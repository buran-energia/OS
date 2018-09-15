#include <mm.h>
#include <ke.h>

#ifdef _i386_
#include <mmi386.h>
#endif

ulong MmMaxPhysAddr;
ulong MmTotalFreeMemory;
page_t *MmPageDatabase;
heap_t MmNonPagedPool;

static page_list_t free_list;  // list of free physical pages

void
MmInit()

/*

Description:

    Initialize device-independent memory manager.

*/

{
    ulong i;
    ulong index;
    ulong kernel_size;
    memarea_t *mem_map;
    memarea_t *first_map;

    #ifdef _i386_

    //
    // Get kernel size along with page tables
    //

    kernel_size = KeCubekrnlSize + i386MmGetPageDirSize();

    //
    // Get the list of free memory blocks
    //

    first_map = i386MmGetFreeMemoryList();

    #endif

    //
    // Initialize the list structure of free pages
    //

    MmInitializeList(&free_list);


    //
    // Determine where to store page database
    //

    MmPageDatabase = (page_t *) (CUBEKRNL_BASE + kernel_size);

    //
    // Create page database
    //
    // The page number of the PTE is also an index to this page database
    // (MmPageDatabase), this way we can track whether the page is used or not,
    // this is needed because multiple processes can have shared pages
    //

    mem_map = first_map;

    do {

        index = PAGE_NUM((ulong) mem_map->addr);

        for(i = 0; i < mem_map->size; i += PAGE_SIZE, index++) {
            
            //
            // Set the initial reference to 0 - page isn't used
            //

            MmPageDatabase[index].reference = 0;

            //
            // Insert the available page to the free list
            //

            MmInsertToList(&free_list, &MmPageDatabase[index]);
        }

        mem_map++;

    } while(mem_map->size > 0);

    //
    // Add page database size to the kernel_size
    //
    
    kernel_size += PAGE_DB_SIZE(MmMaxPhysAddr);

    //
    // Do we have enough space in the first free block for the
    // kernel_size and non-paged pool?
    //

    ASSERT(first_map->size > kernel_size + NON_PAGED_POOL_SIZE);

    //
    // Create non-paged heap
    //

    MmCreateHeap(&MmNonPagedPool, 
                 CUBEKRNL_BASE + kernel_size, 
                 NON_PAGED_POOL_SIZE, 
                 NON_PAGED_POOL);

    //
    // Add the size of non-paged pool to kernel_size
    //

    kernel_size += NON_PAGED_POOL_SIZE;

    //
    // Mark kernel, pool and database pages as used
    //

    for(i = 0; i < kernel_size; i += PAGE_SIZE) {

        //
        // Translate physical page address to the page index in DB
        //

        index = PAGE_NUM( CUBEKRNL_PHYS_BASE + i );

        //
        // Increase the reference count of the page
        // 

        MmReferPage(&MmPageDatabase[index]);
        
        //
        // Delete this page from the free list
        //

        MmDeleteFromList(&free_list, &MmPageDatabase[index]);
    }

}

ulong
MmAllocPhysPage()

/*

Description:

    Allocates physical page

Returns:

    FALSE - if there are no free pages

    page - physical page address

*/

{
    ulong page_addr;
    page_t *page;

    KeAcquireSpinlock(&free_list.lock);

    page = free_list.first;

    if(page == NULL) {

        KeReleaseSpinlock(&free_list.lock);

        return FALSE;
    }
    else {

        MmReferPage(page);

        MmDeleteFromList(&free_list, page);

        page_addr = PAGE_FROM_DB_ENTRY(page);
    }

    KeReleaseSpinlock(&free_list.lock);

    return page_addr;
}

void
MmFreePhysPage(
    ulong page
    )

{
    ulong index;

    ASSERT((page & PAGE_MASK) == 0);

    KeAcquireSpinlock(&free_list.lock);

    //
    // Calculate the index to the page database of the page
    //

    index = PAGE_NUM(page);

    MmDereferPage(&MmPageDatabase[index]);
        
    //
    // Insert the page to the free list, if reference count is zero
    //

    if(MmPageDatabase[index].reference == 0) {

        MmInsertToList(&free_list, &MmPageDatabase[index]);

    }

    KeReleaseSpinlock(&free_list.lock);
}

void 
MmCreateHeap(
    heap_t *heap,
    ulong addr,
    ulong size,
    ulong type
    )

{
    heap->addr = addr;
    heap->size = size;
    heap->type = type;

    //
    // There are no used entries, so the used_list is NULL
    //

    heap->used_list = NULL;

    //
    // Create the initial free block
    //

    heap->free_list = (memlist_t *) addr;
    heap->free_list->addr = addr + sizeof(memlist_t);
    heap->free_list->size = size - sizeof(memlist_t);
    heap->free_list->next = NULL;
    heap->free_list->prev = NULL;

    heap->free = heap->free_list->size;

    KeInitializeSpinlock(&heap->lock);
}

void *
MmHeapAlloc(
    heap_t *heap,
    ulong size
    )

{
    memlist_t *ptr, *used_entry;

    KeAcquireSpinlock(&heap->lock);

    size = ALIGN(size, 16) + sizeof(memlist_t);

    for(ptr = heap->free_list; ptr != NULL && ptr->size < size; ptr = ptr->next);

    if(ptr == NULL) {

        KeReleaseSpinlock(&heap->lock);

        return INVALID_POINTER;
    }

    used_entry = ptr;
    ptr = (memlist_t *) (ptr->addr + size - sizeof(memlist_t)); /* ptr points to a free entry */
    ptr->addr = used_entry->addr + size;
    ptr->size = used_entry->size - size;
    
    if(used_entry == heap->free_list) {

        heap->free_list = ptr;
    }

    if(used_entry->prev != NULL) {

        used_entry->prev->next = ptr;
        ptr->prev = used_entry->prev;
    }
    else {

        ptr->prev = NULL;
    }

    if(used_entry->next != NULL) {

        used_entry->next->prev = ptr;
        ptr->next = used_entry->next;
    }
    else {

        ptr->next = NULL;
    }

    used_entry->size = size;
    used_entry->prev = NULL;
    used_entry->next = heap->used_list;

    if(heap->used_list != NULL) {

        heap->used_list->prev = used_entry;
    }

    heap->used_list = used_entry;

    heap->free -= size;

    KeReleaseSpinlock(&heap->lock);

    DEBUG("Alloc at 0x%08X, free %d bytes\n", used_entry->addr, heap->free);

    return (void *) used_entry->addr;
}

void
MmHeapFree(
    heap_t *heap,
    void *ptr
    )

{
    memlist_t *list, *tmp, *next_entry, *prev_entry;

    if(ptr == NULL) {

        return;        
    }

    //
    // Wrong pointer? Although, it's not critical to pass a correct pointer
    // to this function, this certainly would mean that some sort of data corruption
    // in kernel or driver has happened, so these checks are useful
    //

    ASSERT(((ulong) ptr & 15) == 0);

    KeAcquireSpinlock(&heap->lock);

    for(list = heap->used_list; 
        list != NULL && list->addr != (ulong) ptr; 
        list = list->next);

    ASSERT(list != NULL);

    heap->free += list->size;

    //
    // Remove this entry from "used list"
    //

    if(list == heap->used_list) {

        if(list->next != NULL) {

            heap->used_list = list->next;
            heap->used_list->prev = NULL;
        }
        else {

            heap->used_list = NULL;
        }
    }
    else {

        if(list->prev != NULL) {

            list->prev->next = list->next;
        }

        if(list->next != NULL) {

            list->next->prev = list->prev;
        }
    }

    //
    // Add this entry to the "free list"
    //

    if(list < heap->free_list || heap->free_list == NULL) {

        next_entry = heap->free_list;
        prev_entry = NULL;

        list->next = heap->free_list;
        list->prev = NULL;

        if(heap->free_list != NULL) {

            heap->free_list->prev = list;
        }

        heap->free_list = list;
    }
    else {

        //
        // free_list is sorted by addresses, so here we search for the right
        // position, which should satisfy the following: entry->addr < ptr < entry->addr
        //

        for(tmp = heap->free_list; tmp != NULL && tmp->addr < (ulong) ptr; tmp = tmp->next);

        next_entry = tmp;
        prev_entry = tmp->prev;

        //
        // Insert our list
        //

        if(next_entry != NULL) {

            next_entry->prev = list;
            list->next = next_entry;
        }
        else {

            list->next = NULL;
        }

        prev_entry->next = list;
        list->prev = prev_entry;
    }

    //
    // Check to see if we can combine these lists
    //

    if(next_entry != NULL) {

        if(list->addr + list->size == next_entry->addr) {

            list->size += next_entry->size;
            list->next = next_entry->next;
        }

        if(next_entry->next != NULL) {

            next_entry->next->prev = list;
        }
    }

    if(prev_entry != NULL) {

        if(prev_entry->addr + prev_entry->size == list->addr) {

            prev_entry->size += list->size;
            prev_entry->next = list->next;
        }

        if(list->next != NULL) {

            list->next->prev = prev_entry;
        }
    }

    DEBUG("Free at 0x%08X, free: %d bytes\n", ptr, heap->free);

    KeReleaseSpinlock(&heap->lock);
}

ulong
MmGetFreePageCount()

{
    return free_list.count;
}

