#include <utils.h>
#include <ke.h>
#include <mm.h>
#include <vm.h>
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
    pte_t *kpdir;  // kernel page directory
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

    kpdir = (pte_t *) (CUBEKRNL_BASE + KeGetCubekrnlSize());

    ZeroPage((ulong) kpdir);

    //
    // Does this processor support GLOBAL pages?
    //

    if(i386QueryFeature(CPUID_PGE) == TRUE) {

        //
        // Enable GLOBAL pages support
        //

        SET_CR4_FLAG(CR4_PGE);
    }

    i386SetNormalPte(kpdir + LARGE_PAGE_NUM( PROCESS_PTES_ADDR ),
                     PAGE_NUM( KE_VIRT_TO_PHYS((ulong) kpdir) ),
                     FALSE);

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

        i386SetPte(kpdir + LARGE_PAGE_NUM( MAP_KERNEL_VIRT_START ),
                   PAGE_NUM( MAP_KERNEL_BASE_START ),
                   FALSE,
                   TRUE,
                   TRUE,
                   FALSE,
                   TRUE,   // Large
                   TRUE);  // Global

        //
        // Map the rest memory and since we are not using any page tables
        // there are no pages that are being wasted
        //

        for(addr = LARGE_PAGE_SIZE; 
            addr < MAP_KERNEL_SIZE - LARGE_PAGE_SIZE; // 508 MB
            addr += LARGE_PAGE_SIZE) {

            i386SetLargePte(kpdir + LARGE_PAGE_NUM( MAP_KERNEL_VIRT_START + addr ),
                            PAGE_NUM( MAP_KERNEL_BASE_START + addr ),
                            FALSE);
        }

        //
        // We don't have any page tables, so page_dir_size is the size
        // of page directory
        //

        page_dir_size = PAGE_SIZE;                       
    } 
    else {

        //
        // If this processor does not support large pages, then we do the
        // mapping by creating page tables to fulfill our needs
        //

        //
        // Calculate the physical address of the next available page
        // for the page table
        //

        table = (ulong) kpdir + PAGE_SIZE;

        //
        // Initialize page directory and page tables
        //

        ulong map_kernel_size = LARGE_PAGE_ALIGN(MmMaxPhysAddr);

        //
        // Make sure we map not more than 508 MB
        //

        if(map_kernel_size > MAP_KERNEL_SIZE - LARGE_PAGE_SIZE) {
            
            map_kernel_size = MAP_KERNEL_SIZE - LARGE_PAGE_SIZE;
        }

        for(addr = 0; 
            addr < map_kernel_size;
            addr += LARGE_PAGE_SIZE) {

            //
            // Map page table to the page directory
            //

            i386SetNormalPte(kpdir + LARGE_PAGE_NUM( MAP_KERNEL_VIRT_START + addr ),
                             PAGE_NUM( KE_VIRT_TO_PHYS(table) ),
                             FALSE);

            //
            // Set entries of the current page table
            //

            for(i = 0; i < LARGE_PAGE_SIZE; i += PAGE_SIZE) {

                i386SetNormalPte(((pte_t *) table)++,
                                 PAGE_NUM(addr + i),
                                 FALSE);
            }
        }

        //
        // What's the size of our page tables + page directory?
        //

        page_dir_size = table - (ulong) kpdir;
    }

    //
    // Create page table for "Temp page mapping area"
    //

    page_dir_size += PAGE_SIZE;

    i386SetNormalPte(kpdir + LARGE_PAGE_NUM( PROCESS_TEMP_MAP_ADDR ),
                     PAGE_NUM( KE_VIRT_TO_PHYS((ulong) kpdir + page_dir_size) ),
                     TRUE);

    //
    // Zero it out
    //

    ZeroPage((ulong) kpdir + page_dir_size);

    //
    // Set kernel page directory
    //

    SET_PAGE_DIR( KE_VIRT_TO_PHYS((ulong) kpdir) );
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

            //
            // Truncate all memory > 4 GB, since we don't have
            // any support for it
            //

            if(meminfo->e820map[i].addr + meminfo->e820map[i].size >= (u64_t) 0x100000000) {

                meminfo->e820map[i].size = (u64_t) 0x100000000 - meminfo->e820map[i].addr;
            }

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
i386InvalidatePage(
    ulong page
    )

{
    asm("invlpg %0" :: "m"(*((ulong *) page)));
}
