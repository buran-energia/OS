#ifndef _KE_H_
#define _KE_H_

#include <types.h>
#include <hal.h>
#include <process.h>
#include <stdio.h>

/*

    Virtual address: Size:                Description:
    
    0xC0100000       KeCubekrnlSize       "cubekrnl.exe" is loaded here
    0xC0100000*      i386MmPageDirSize    kernel page directory and/or page tables
    0xC0100000**     depends on memory    page database
    0xC0100000***    NON_PAGED_POOL_SIZE  size of non paged pool or kernel heap

    * - add KeCubekrnlSize
    ** - add KeCubekrnlSize + i386MmPageDirSize 
    *** - follows right after page database

    0xC0100000
   |------------------------------------------|
   |                                          |
   |              cubekrnl.exe                |
   |                                          |
   |------------------------------------------|
   |                                          |
   |        page directory and tables         |
   |                                          |
   |------------------------------------------|
   |                                          |
   |              page database               |
   |                                          |
   |------------------------------------------|
   |                                          |
   |       non-paged pool / kernel heap       |
   |                                          |
   |------------------------------------------|

    0xE0000000 - 0xE0400000
   |------------------------------------------|
   |                                          |
   |               System PTEs                |
   |                                          |
   |------------------------------------------|

*/

#define CUBEKRNL_BASE        0xC0100000
#define CUBEKRNL_PHYS_BASE   0x00100000

#define KERNEL_MODULE        0           // index to a module array
#define MODULE_ARRAY         0xC000F000

#define INVALID_POINTER      ((void *) -1)

//
// Debug macros
//

// #define ENABLE_DEBUG

#ifdef ENABLE_DEBUG
#define DEBUG(x, ...) \
    printf(x, ##__VA_ARGS__);
#else
#define DEBUG(x, ...)
#endif

#define ASSERT(x) \
    (x) ? TRUE : KePanicStr("%s:%d %s", __FILE__, __LINE__, #x)

//
// Bootloader module structure
//

#define MAX_NAME_LEN         12

typedef struct {
	u32_t address;
	u32_t size;
	char  name[MAX_NAME_LEN];
} boot_module_t;

extern ulong KeCubekrnlSize;
extern ulong KePhysPageDir;
extern process_t *KeCurrentProcess;
extern thread_t *KeCurrentThread;

typedef ulong spinlock_t;

void
KeInit();

ulong 
KeGetCubekrnlSize();

void
KePanic(
    char *str
    );

void
KePanicStr(
    char *str, ...
    );

void
KeInitializeSpinlock(
    spinlock_t *lock
    );

void
KeAcquireSpinlock(
    spinlock_t *lock
    );

void
KeReleaseSpinlock(
    spinlock_t *lock
    );

void
KeHaltCPU();

void *
KeHeapAlloc(
    ulong size
    );

void
KeHeapFree(
    void *ptr
    );

void
KeAttachProcess(
    process_t *process
    );

#endif
