#ifndef _VM_H_
#define _VM_H_

#include <ke.h>
#include <mm.h>

#define PROCESS_PTES_ADDR         0xE0000000
#define PROCESS_PTES_MAX_ADDR     (PROCESS_PTES_ADDR + 0x400000)

//
// Address for temporary mappings
//

#define PROCESS_TEMP_MAP_ADDR     PROCESS_PTES_MAX_ADDR
#define PROCESS_TEMP_MAP_MAX_ADDR (PROCESS_PTES_MAX_ADDR + 0x400000)

#define PROCESS_PAGE_DIR          PROCESS_TEMP_MAP_MAX_ADDR

//
// Maximum addressable address
//

#define MAX_ADDRESS               0xFFFFFFFF

//
// 64K alignment for virtual memory allocations
//

#define VM_ALIGN(x)               ALIGN(x, 0x10000)

#define VM_MAX_ADDR(varea)        (varea->start + varea->size)

//
// Virtual memory allocation types
//

#define MM_RESERVE         1
#define MM_COMMIT          2
#define MM_TOP_DOWN        4

bool
MmCollision(
    varea_t *varea1, 
    varea_t *varea2
    );

ulong
MmVirtualAlloc(
    process_t *process,
    ulong addr, 
    ulong size,
    ulong type,    
    ulong flags
    );

void
MmVirtualFree(
    process_t *process,
    ulong addr
    );

varea_t *
MmGetAreaByAddress(
    ulong addr
    );

STATUS
MmCommit(
    ulong addr, 
    ulong size
    );

#endif
