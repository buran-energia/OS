#include <vm.h>

bool
MmCollision(
    varea_t *varea1, 
    varea_t *varea2
    )

/*

Description:
    
    Checks whether 2 virtual areas are colliding

Parameters:

    varea1 - virtual memory address 1

    varea2 - virtual memory address 2

Returns:

    TRUE - if addresses are colliding

    FALSE - if addresses are not colliding

*/

{
    if(varea1 == NULL || 
       varea2 == NULL || 
       varea1->start + varea1->size <= varea2->start ||
       varea2->start + varea2->size <= varea1->start) {

        return FALSE;
    }
    else {

        return TRUE;
    }

}

ulong
MmVirtualAlloc(
    process_t *process,
    ulong addr, 
    ulong size,
    ulong type,
    ulong flags
    )

{
    varea_t *varea;
    varea_t *new_area;
    ulong free_block;
    bool collision;
    
    //
    // Allocate memory for virtual memory descriptor
    // 

    new_area = KeHeapAlloc(NON_PAGED_POOL, sizeof(varea_t));

    if(new_area == NULL) {
        
        return (ulong) INVALID_POINTER;
    }

    //
    // Round the values up to the virtual memory allocation granularity,
    // which is 65536 bytes
    //

    addr = VM_ALIGN(addr);
    size = VM_ALIGN(size);
    
    //
    // Initialize the new descriptor
    //

    new_area->start = addr;
    new_area->size = size;
    new_area->flags = flags;

    KeAcquireMutex(&process->va_mutex);

    //
    // Is this the first entry or is the first entry located at
    // a higher address than our reserved memory?
    //

    if(process->address_space == NULL ||
       (process->address_space != NULL &&
        process->address_space->start >= addr + size) ) {

        //
        // Insert our descriptor at the beginning of the list
        //

        if(process->address_space != NULL) {
            
            process->address_space->prev = new_area;
        }

        new_area->prev = NULL;
        new_area->next = process->address_space;
        process->address_space = new_area;

        KeReleaseMutex(&process->va_mutex);

        DEBUG("MmVirtualAlloc: addr 0x%08lX size 0x%08lX\n", 
              new_area->start, new_area->size);

        return addr;
    }

    collision = FALSE;

    varea = process->address_space;

    //
    // First try to see if we can map at the desired address (addr),
    // if failed, try to find a free block at some other address
    //

    do {

        if(collision == TRUE) {

            //
            // If there's address collision, we can't reserve memory at
            // the desired address
            //
            // Now just try to find a block with a suitable size
            //

            if(varea->next == NULL) {
                
                free_block = MAX_ADDRESS - VM_MAX_ADDR(varea);
            }
            else {

                free_block = varea->next->start - VM_MAX_ADDR(varea);
            }

            if(free_block < size) {

                varea = varea->next;

                if(varea == NULL) {

                    break;
                }

                //
                // The block is not big enough, continue the loop
                //

                continue;
            }

            //
            // We found the free block, now just get its address
            //

            new_area->start = VM_MAX_ADDR(varea);

            break;

        } 
        else {

            if(MmCollision(varea, new_area) == TRUE) {

                //
                // If there's virtual memory collision, restart the loop
                //

                if(type & MM_TOP_DOWN) {

                    while(varea->next != NULL) {
                        
                        varea = varea->next;
                    }
                }
                else {

                    varea = process->address_space;
                }

                collision = TRUE;

                continue;
            }
            else {

                if(varea->next != NULL && 
                   varea->next->start >= addr + size) {
                    
                    //
                    // We found the right position in the list, exit the loop
                    //

                    break;

                }

                //
                // Is this the last entry?
                //

                if(varea->next == NULL) {

                    if(size > MAX_ADDRESS - VM_MAX_ADDR(varea)) {
        
                        //
                        // The last free block isn't big enough
                        //

                        varea = NULL;
                    }

                    break;
                }
            }
        }

        varea = varea->next;

    } while(varea != NULL);

    //
    // Did we find any free blocks?
    //

    if(varea == NULL) {
        
        KeReleaseMutex(&process->va_mutex);

        KeHeapFree(NON_PAGED_POOL, new_area);

        return (ulong) INVALID_POINTER;
    }
    else {

        //
        // Found the free block
        //
        // Add our descriptor to the right position in the list
        // (our list must be sorted, remember?)
        //

        if(varea->next != NULL) {

            varea->next->prev = new_area;
        }

        new_area->next = varea->next;
        new_area->prev = varea;

        varea->next = new_area;
    }

    KeReleaseMutex(&process->va_mutex);

    if(type & MM_COMMIT) {

        MmCommit(addr, size);
    }

    DEBUG("MmVirtualAlloc: addr 0x%08lX size 0x%08lX\n", 
          new_area->start, new_area->size);

    return new_area->start;
}

void
MmVirtualFree(
    process_t *process,
    ulong addr
    )

{
    varea_t *varea;
    varea_t *tmp;

    KeAcquireMutex(&process->va_mutex);

    varea = process->address_space;

    ASSERT(varea != NULL);

    if(varea->start == addr) {

        process->address_space = varea->next;

        DEBUG("MmVirtualFree: addr 0x%08lX size 0x%08lX\n", 
              varea->start, varea->size);

        KeHeapFree(NON_PAGED_POOL, varea);

        KeReleaseMutex(&process->va_mutex);

        return;
    }

    //
    // Search for virtual memory descriptor in the list
    //

    while(varea->next != NULL && varea->next->start != addr) {

        varea = varea->next;
    }

    //
    // Wrong pointer?
    //

    ASSERT(varea->next != NULL);

    DEBUG("MmVirtualFree: addr 0x%08lX size 0x%08lX\n", 
          varea->next->start, varea->next->size);

    //
    // Remove the descriptor from the list
    //

    tmp = varea->next;
    varea->next = varea->next->next;    

    KeReleaseMutex(&process->va_mutex);

    KeHeapFree(NON_PAGED_POOL, tmp);
}

varea_t *
MmGetAreaByAddress(
    ulong addr
    )

{
    varea_t *varea;

    KeAcquireMutex(&KeCurrentProcess->va_mutex);

    for(varea = KeCurrentProcess->address_space;
        varea != NULL && 
        (addr < varea->start || addr >= VM_MAX_ADDR(varea));
        varea = varea->next);

    KeReleaseMutex(&KeCurrentProcess->va_mutex);

    return varea;
}

STATUS
MmCommit(
    ulong addr, 
    ulong size
    )

{
    varea_t *varea;
    ulong page;
    ulong i;

    addr &= ~PAGE_MASK;
    size = PAGE_ALIGN(size);

    KeAcquireMutex(&KeCurrentProcess->va_mutex);

    //
    // Imagine the following scenario:
    // We create a virtual region for some process, but don't commit the area.
    // Then the process creates 2 threads, they both access the same uncommited
    // page, so we get 2 page faults for the same virtual page. The result is
    // that 2 pages will be allocated.
    // To solve this problem here we try to see whether the page is already mapped

    varea = MmGetAreaByAddress(addr);

    if(varea == NULL) {

        return STATUS_ERROR;
    }

    ASSERT(addr + size <= VM_MAX_ADDR(varea));

    if(varea->flags == MM_PAGE_NO_ACCESS) {

        KeReleaseMutex(&KeCurrentProcess->va_mutex);

        return STATUS_SUCCESS;
    }


    for(i = 0; i < size; i += PAGE_SIZE) {

        page = (ulong) MmAllocPhysPage();

        //
        // This could only happen if swap file is full and there are
        // no free pages left (when swapping is implemented)
        //

        if((void *) page == NULL) {

            //
            // Free all allocated pages and return an error
            //

            while(i >= 0) {
                
                MmUnMapPage(addr + i, TRUE);
            }

            KeReleaseMutex(&KeCurrentProcess->va_mutex);

            return STATUS_NO_RESOURCES;
        }

        MmMapPage(addr + i, page + i, varea->flags, TRUE);
    }

    KeReleaseMutex(&KeCurrentProcess->va_mutex);

    return STATUS_SUCCESS;

}
