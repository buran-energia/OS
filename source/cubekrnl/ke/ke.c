#include <ke.h>
#include <mm.h>
#include <vm.h>

#ifdef _i386_
#include <mmi386.h>
#endif

ulong KeCubekrnlSize;
ulong KePageDir;
process_t *KeCurrentProcess;
thread_t *KeCurrentThread;

static heap_t *pools[] = { &MmNonPagedPool,
                           NULL };

void
KernelMain()

{
    KeInit();
    MmInit();
    
/*    printf("KeCubekrnlSize: %ld\n", KeCubekrnlSize);
    printf("i386MmGetPageDirSize: %ld\n", i386MmGetPageDirSize());
    printf("MmMaxPhysAddr: %ld\n", MmMaxPhysAddr);

    printf("Total memory: %ld bytes\n", MmGetFreePageCount() * PAGE_SIZE);
    printf("end of KernelMain");
    
    i386SetNormalPte((pte_t *) KePageDir + LARGE_PAGE_NUM(0xC3200000),
                     PAGE_NUM(MmAllocPhysPage()),
                     FALSE);

    i386SetNormalPte((pte_t *) SYSTEM_PTES_ADDR + PAGE_NUM(0xC3200000),
                     PAGE_NUM(MmAllocPhysPage()),
                     FALSE);

    *((ulong *) 0xC3200000) = 0; 

    *((ulong *) 0xC0400000) = 0; */

    process_t process;

    KeCurrentProcess = &process;

    process.address_space = NULL;

    MmVirtualAlloc(&process, 0xC3200000, 4096, 0, MM_PAGE_READ | MM_PAGE_WRITE);


    *((ulong *) 0xC3200000) = 0;
 //   *((ulong *) 0xE3200000) = 0;

    MmMapPage(0xF0000000, 0xB8000, MM_PAGE_WRITE, TRUE);

    *((u64_t *) 0xF0000000) = 0;

//    MmUnMapPage(0xF0000000);

//    *((u64_t *) 0xF0000008) = 0;

	printf("apic %d rdmsr %d\n", i386QueryFeature(9), i386QueryFeature(5));

    for(;;);
}

void
KeInit()

{
    KePageDir = CUBEKRNL_BASE + KeGetCubekrnlSize();

    KeTasks = NULL;
}

ulong 
KeGetCubekrnlSize()

{
    //
    // Get the size of "cubekrnl.exe"
    //
    // Works as follows:
    //
    // MODULE_ARRAY points to modules that have been loaded by the
    // bootloader, the fist module is always "cubekrnl.exe"
    //
    // Notes:
    //
    // "cubekrnl.exe" size will always be aligned on PAGE_SIZE boundary
    //

    KeCubekrnlSize = ((boot_module_t *) MODULE_ARRAY)->size;

    return KeCubekrnlSize;
}

void
KePanic(
    char *str
    )

{
    printf("\nKERNEL PANIC: %s", str);

    KeHaltCPU();
}

void
KePanicStr(
    char *str, ...
    )

{
    char buf[1024];

    va_list args;

    va_start(args, str);

    printf("KERNEL PANIC: ");
    vsnprintf(buf, (int) -1, str, args);
    print(buf);

    va_end(args);

    KeHaltCPU();
}

void
KeHaltCPU()

{
    HALDisableInterrupts();
    HALIdleThread();
}

void *
KeHeapAlloc(
    uint pool,
    ulong size
    )

{
    return MmHeapAlloc(pools[pool], size);
}

void
KeHeapFree(
    uint pool,
    void *ptr
    )

{
    MmHeapFree(pools[pool], ptr);
}

void
KeAttachProcess(
    process_t *process
    )

{
    if(KeCurrentProcess != process) {

        SET_PAGE_DIR(process->pagedir);
    }
}

/*section_t *
KeCreateSection(
    ulong flags,
    ulong size
    )

{
    section_t *section;
}*/
