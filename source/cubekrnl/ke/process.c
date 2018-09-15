#include <mm.h>
#include <vm.h>
#include <ke.h>
#include <utils.h>

process_t *KeTasks;

STATUS
KeCreateProcessEnvironment(
    process_t *process
    )

{
    ulong pagedir;
    ulong virt_pagedir;

    //
    // Create process page directory
    //

    pagedir = (ulong) MmAllocPhysPage();

    if((void *) pagedir == NULL) {

        return STATUS_NO_RESOURCES;
    }

    //
    // Temporary map the page directory
    //

    virt_pagedir = (ulong) MmMapTempPage(pagedir);

    ZeroPage(virt_pagedir);

    //
    // Map kernel page tables
    //

    CopyMemory((void *) ((pte_t *) KePageDir + LARGE_PAGE_NUM( MAP_KERNEL_VIRT_START )),
               (void *) ((pte_t *) virt_pagedir + LARGE_PAGE_NUM( MAP_KERNEL_VIRT_START )),
               LARGE_PAGE_NUM( MAP_KERNEL_VIRT_START ));

    MmUnMapTempPage(virt_pagedir);

//    MmMapPage(PROCESS_PAGE_DIR, 
//              pagedir,
//              MM_PAGE_READ | MM_PAGE_WRITE,
//              FALSE);

    process->pagedir = pagedir;

    return STATUS_SUCCESS;
}

process_t *
KeFindProcess(
    ulong id
    )

{
    process_t *process;
	
    for(process = KeTasks; 
        process != NULL && process->id != id; 
        process = process->next);
	
    if(process == NULL) {

		return NULL;
    }
		
	return process;
}

process_t *
KeCreateProcess(
    char *path
    )

{
    static ulong unique_id = 0;
    process_t *process;

    process = KeHeapAlloc(NON_PAGED_POOL, sizeof(process_t));

    if(process == NULL) {

        return NULL;
    }

    if(!SUCCESS(KeCreateProcessEnvironment(process))) {

        KeHeapFree(NON_PAGED_POOL, process);

        return NULL;
    }

    process->last_thread_id = 0;
    process->path = path;

    //
    // Generate process id
    //

    if(unique_id == (ulong) -1) {

		unique_id = 0;

        while(KeFindProcess(unique_id) != NULL) {

		    unique_id++;
        }
    }

    process->id = unique_id;

    KeInitializeMutex(&process->va_mutex);

    process->next = KeTasks;
    KeTasks = process;

    return process;
}

