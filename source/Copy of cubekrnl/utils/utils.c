#include <utils.h>
#include <hal.h>
#include <mmi386.h>

void
SetMemory(
    void *addr, 
    ulong value, 
    ulong length
    )

/*

Description:
    
    Sets memory area to the specified value.

Parameters:

    addr - start address

    value - 8-bit value, that will be used to set memory

    length - length of the memory area (in bytes)

*/

{
    #ifdef _i386_

    i386SetMemory(addr, value, length); // macro defined in i386.h

    #endif
}

void
SetMemoryD(
    void *addr, 
    ulong value, 
    ulong length
    )

/*

Description:
    
    Sets memory area using dword (ulong) granularity.

Parameters:

    addr - start address, should be aligned on dword boundary,
           for performance

    value - 32-bit value, that will be used to set memory

    length - length of the memory area (in 4 bytes)

*/

{
    #ifdef _i386_

    i386SetMemoryD(addr, value, length);
    
    #endif
}

void ZeroMemory(
    void *addr,
    ulong length
    )

{
    SetMemory(addr, 0, length);
}

void ZeroMemoryD(
    void *addr,
    ulong length
    )

{
    SetMemoryD(addr, 0, length);
}

void ZeroPage(
    ulong page
    )

{
    ZeroMemoryD((void *) page, SIZE_IN_DWORDS(PAGE_SIZE));
}
