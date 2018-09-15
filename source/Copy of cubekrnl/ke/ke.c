#include <ke.h>
#include <mm.h>
#include <stdio.h>

#ifdef _i386_
#include <mmi386.h>
#endif

ulong KeCubekrnlSize;
ulong KePhysPageDir;
process_t *KeCurrentProcess;
thread_t *KeCurrentThread;

void
KernelMain()

{
    KeInit();
    MmInit();

    printf("end of KernelMain");
    

    for(;;);
}

void
KeInit()

{
    KePhysPageDir = CUBEKRNL_PHYS_BASE + KeGetCubekrnlSize();
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
KeInitializeSpinlock(
    spinlock_t *lock
    )

{
    *lock = 0;
}

void
KeAcquireSpinlock(
    spinlock_t *lock
    )

{
    #ifdef _i386_

    //
    // On a uniprocessor, this is just a HALDisableInterrupts routine
    //

    HALDisableInterrupts();

    #endif
}

void
KeReleaseSpinlock(
    spinlock_t *lock
    )

{
    #ifdef _i386_

    HALEnableInterrupts();

    #endif    
}

void
KeHaltCPU()

{
    HALDisableInterrupts();
    HALIdleThread();
}

void *
KeHeapAlloc(
    ulong size
    )

{
    return MmHeapAlloc(&MmNonPagedPool, size);
}

void
KeHeapFree(
    void *ptr
    )

{
    return MmHeapFree(&MmNonPagedPool, ptr);
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

