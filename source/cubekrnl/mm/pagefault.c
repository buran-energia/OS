#include <mm.h>
#include <vm.h>

void
MmPageFault(
    ulong address, 
    ulong flags
    )

{
    ulong page;
    ulong virt;
    pte_t *pte;

    DEBUG("Page fault at address 0x%08lX\n", address);

    //
    // Some page table isn't mapped?
    //

    if(address >= (ulong) PROCESS_PTES_ADDR && 
       address < (ulong) PROCESS_PTES_MAX_ADDR) {

//        KePanicStr("SYSTEM PTE");

        pte = (pte_t *) KePageDir + PAGE_NUM(address - PROCESS_PTES_ADDR);

        if(pte->present == TRUE) {

            //
            // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            // COPY FROM KERNEL PAGE DIR TO USER PAGE DIR
            // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            // return;
        }

        //
        // Get a free page for the page table
        //

        page = (ulong) MmAllocPhysPage();

        ASSERT((void *) page != NULL);

        //
        // Zero out the page table
        //

        virt = (ulong) MmMapTempPage(page);

        ZeroPage(virt);

        MmUnMapTempPage(virt);

        //
        // Map the page table to the page directory
        //

        i386SetNormalPte(pte,
                         PAGE_NUM(page),
                         FALSE);

            //
            // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            // COPY FROM KERNEL PAGE DIR TO USER PAGE DIR
            // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            // return;

        return;
    }

    ASSERT( SUCCESS(MmCommit(address, PAGE_SIZE)) );
}
