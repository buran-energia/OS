#ifndef _KE_H_
#define _KE_H_

#include <types.h>
#include <hal.h>
#include <mm.h>
#include <synch.h>
#include <utils.h>
#include <debug.h>

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
   |              non-paged pool              |
   |                                          |
   |------------------------------------------|

    0xE0000000 - 0xE0400000
   |------------------------------------------|
   |                                          |
   |               Process PTEs               |
   |                                          |
   |------------------------------------------|

    0xE0400000 - 0xE0800000
   |------------------------------------------|
   |                                          |
   |         Temp page mapping area           |
   |                                          |
   |------------------------------------------|

    0xE0800000 - 0xE0801000
   |------------------------------------------|
   |                                          |
   |         Process page directory           |
   |                                          |
   |------------------------------------------|

*/

#define CUBEKRNL_BASE        0xC0100000
#define CUBEKRNL_PHYS_BASE   0x00100000

#define KERNEL_MODULE        0           // index to a module array
#define MODULE_ARRAY         0xC000F000

#define INVALID_POINTER      ((void *) -1)

//
// Function return status values
//

#define STATUS               int

#define STATUS_SUCCESS       0
#define STATUS_NO_RESOURCES  -1
#define STATUS_ERROR         -2

#define SUCCESS(status)      (status == STATUS_SUCCESS)

//
// Bootloader module structure
//

#define MAX_NAME_LEN         12

typedef struct {
	u32_t address;
	u32_t size;
	char  name[MAX_NAME_LEN];
} boot_module_t;


//
// Thread struct
//

typedef struct thread_t thread_t;

struct thread_t {
    context_t *context;
    thread_t  *next;
    ulong     id;
    uint      state;
    ulong     create_time;       // currently unused
    ulong     start_address;
    uint      priority;
 // process_t *process;
};

//
// Process struct
//

typedef struct process_t process_t;

struct process_t {
    process_t  *next;
    varea_t    *address_space;
    thread_t   *threads;
    ulong      id;
    ulong      pagedir;
    char       *path;
    ulong      last_thread_id;
    mutex_t    va_mutex;          // Virtual address space mutex
};

//
// Section struct
//

typedef struct {
    ulong flags;
    ulong size;
    ulong pages[];
} section_t;

extern ulong KeCubekrnlSize;
extern ulong KePageDir;
extern process_t *KeCurrentProcess;
extern thread_t *KeCurrentThread;
extern process_t *KeTasks;

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
KeHaltCPU();

void *
KeHeapAlloc(
    uint pool,
    ulong size
    );

void
KeHeapFree(
    uint pool,
    void *ptr
    );

void
KeAttachProcess(
    process_t *process
    );

//
// process.c
//

STATUS
KeCreateProcessEnvironment(
    process_t *process
    );

process_t *
KeFindProcess(
    ulong id
    );

process_t *
KeCreateProcess(
    char *path
    );

#endif
