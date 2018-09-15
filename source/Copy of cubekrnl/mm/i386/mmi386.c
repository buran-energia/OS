#include <utils.h>
#include <ke.h>
#include <mm.h>
#include <mmi386.h>

static memarea_t *mem_map = (memarea_t *) FREE_MEM_BUFFER;
static ulong page_dir_size;

void
i386MmInit()

/*

Description:

    Initialize device-dependent memory manager.

*/

{
    pte_t *pte;
    ulong addr;
    ulong table;
    ulong i;

    //
    // Check available memory
    //

    i386MmGetFreeMemory();

    ASSERT(MmTotalFreeMemory != FALSE);

    //
    // Create kernel page directory
    //

    pte = (pte_t *) (CUBEKRNL_BASE + KeGetCubekrnlSize());

    ZeroPage((ulong) pte);

    //
    // Does this processor support GLOBAL pages?
    //

    if(i386QueryFeature(CPUID_PGE) == TRUE) {

        //
        // Enable GLOBAL pages support
        //

        SET_CR4_FLAG(CR4_PGE);
    }

    //
    // Map the first 512 MB to MAP_KERNEL_VIRT_START (0xC0000000)
    //
    // Map 512 MB only if LARGE pages are available or the total memory
    // size is >= 511 MB since we don't want to waste pages for
    // unnecessary page tables
    //

    if(i386QueryFeature(CPUID_PSE) == TRUE) {

        //
        // We use 4-MB pages (with PSE flag set) to map
        // the needed memory, so enable 4-MB pages
        //

        SET_CR4_FLAG(CR4_PSE);

        //
        // Map the first 4 MB with "GLOBAL" flag set
        //
        // We don't care whether "CPUID_PGE" feature is present
        //

        i386SetPte(pte + LARGE_PAGE_NUM( MAP_KERNEL_VIRT_START ),
                   PAGE_NUM( MAP_KERNEL_BASE_START ),
                   FALSE,
                   TRUE,
                   TRUE,
                   FALSE,
                   TRUE,
                   TRUE);

        //
        // Map the rest 508 MB
        //

        for(addr = (ulong) LARGE_PAGE_SIZE; 
            addr < (ulong) MAP_KERNEL_SIZE; 
            addr += (ulong) LARGE_PAGE_SIZE) {

            i386SetPte(pte + LARGE_PAGE_NUM( MAP_KERNEL_VIRT_START + addr ),
                       PAGE_NUM( MAP_KERNEL_BASE_START + addr ),
                       FALSE,
                       TRUE,
                       TRUE,
                       FALSE,
                       TRUE,
                       FALSE);
        }

        page_dir_size = PAGE_SIZE;                       
    } 
    else {

        //
        // If this processor does not support large pages, then we do the
        // mapping by creating page tables to fulfill our needs
        //

        //
        // Calculate the address of the next available page
        // for the page table
        //
        // All page tables will be stored after the page directory
        //

        table = (ulong) pte + PAGE_SIZE;

        //
        // Initialize page directory and page tables
        //

        ulong map_kernel_size;

        //
        // Determine the memory region to map
        //
        // If MmMaxPhysAddr >= 511 MB, we map 512 MB
        // otherwise we map only the (MmMaxPhysAddr + MEM_EXTENDED)
        //

        map_kernel_size = (MmMaxPhysAddr >= MAP_KERNEL_SIZE - MEM_EXTENDED) ?
                          MAP_KERNEL_SIZE : 
                          LARGE_PAGE_ALIGN(MmMaxPhysAddr + MEM_EXTENDED);

        for(addr = 0; 
            addr < map_kernel_size; 
            addr += LARGE_PAGE_SIZE) {

            //
            // Map page table to the page directory
            //

            i386SetPte(pte + LARGE_PAGE_NUM( MAP_KERNEL_VIRT_START + addr ),
                       PAGE_NUM( KE_VIRT_TO_PHYS(table) ),
                       FALSE,
                       TRUE,
                       TRUE,
                       FALSE,
                       FALSE,
                       FALSE);

            //
            // Set entries of the current page table
            //

            for(i = 0; i < LARGE_PAGE_SIZE; i += PAGE_SIZE) {

                i386SetPte(((pte_t *) table)++,
                           PAGE_NUM(addr + i),
                           FALSE,
                           TRUE,
                           TRUE,
                           FALSE,
                           FALSE,
                           FALSE);
            }
        }

        page_dir_size = table - (ulong) pte;
    }

    //
    // Set kernel page directory
    //

    SET_PAGE_DIR( KE_VIRT_TO_PHYS((ulong) pte) );
}

static void 
AddMemToList(
    u32_t addr, 
    u32_t size
    )

{
    static uint pos = 0;
    
    mem_map[pos].addr = addr;
    mem_map[pos].size = size;
    
    pos++;
    
    MmTotalFreeMemory += size;

    if(size != 0) {

        MmMaxPhysAddr = addr + size;
    }
}

ulong 
i386MmGetFreeMemory()

/*

Description:

    Fills "mem_map" with list of memory blocks available for OS use,
    this does not include memory below 1 MB.

    It works this way: the bootloader calls various BIOS functions to
    determine memory size, then it stores the info at address
    "MEM_INFO_BUFFER", so all we have to do is to parse it, for more
    info see "bootldr.asm" in the bootloader.

Returns:

    FALSE - if no extended memory detected (impossible, unless the data
            at "MEM_INFO_BUFFER" has been damaged)

    SIZE IN BYTES - otherwise it returns the total size of extended memory

Notes:

    Do not call this function more than once
    
*/

{
    meminfo_t *meminfo = (meminfo_t *) MEM_INFO_BUFFER;

    MmTotalFreeMemory = 0;

    if(meminfo->func == SIG_E820) {

        int i = meminfo->bufsize / sizeof(e820map_t);

        while(i--) {

            if(meminfo->e820map[i].type == MEMORY_AVAILABLE &&
               (u32_t) meminfo->e820map[i].addr >= MEM_EXTENDED) {

                AddMemToList(PAGE_ALIGN((u32_t) meminfo->e820map[i].addr),
                             (u32_t) meminfo->e820map[i].size);
            }
        }
    }
    else if(meminfo->func == SIG_E801) {

        e801map_t *e801map = (e801map_t *) &meminfo->e801map;

        if(e801map->configured1) {

            AddMemToList(MEM_EXTENDED, e801map->configured1 * 1024);
        }
        
        if(e801map->configured2) {

            AddMemToList(MEM_16M, e801map->configured2 * 65536);
        }
    }
    else if(meminfo->func == SIG_8800) {

        AddMemToList(MEM_EXTENDED, meminfo->memsize * 1024);
    }    
    else
        return FALSE;

    AddMemToList(0, 0);

    return MmTotalFreeMemory;
}

memarea_t * 
i386MmGetFreeMemoryList()

{
    return mem_map;
}

ulong
i386MmGetPageDirSize()

{
    return page_dir_size;
}

void
i386SetPte(
    pte_t *pte,
    ulong page_number,
    bool user_page,
    bool present,
    bool writable,
    bool cache_disabled,
    bool large_page,
    bool global
    )

{
    ZeroMemory(pte, sizeof(pte_t));

    pte->page_number = page_number;
    pte->user_page = user_page;
    pte->present = present;
    pte->writable = writable;
    pte->cache_disabled = cache_disabled;
    pte->large_page = large_page;
    pte->global = global;
}

void 
i386InvalidatePte(
    pte_t *pte
    )

{

}
