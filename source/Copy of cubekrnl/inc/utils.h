#ifndef _UTILS_H_
#define _UTILS_H_

#include <types.h>

#define ALIGN(x, addr)    (((x) + ((addr) - 1)) & ~((addr) - 1))

//
// Function prototypes
//

void
SetMemory(
    void *addr, 
    ulong value, 
    ulong length
    );

void
SetMemoryD(
    void *addr, 
    ulong value, 
    ulong length
    );

void ZeroMemory(
    void *addr,
    ulong length
    );

void ZeroMemoryD(
    void *addr,
    ulong length
    );

void ZeroPage(
    ulong page
    );

#endif
