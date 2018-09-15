#ifndef _MMI386_H_
#define _MMI386_H_

#include <types.h>
#include <utils.h>

#define BOOT_STACK             0xC0007C00

#define MEM_INFO_BUFFER        0xC000D000
#define FREE_MEM_BUFFER        0xC000C000

#define SIG_E820               0xE820
#define SIG_E801               0xE801
#define SIG_8800               0x8800

#define MEMORY_AVAILABLE       1

#define PAGE_SIZE              0x1000
#define PAGE_MASK              (PAGE_SIZE - 1)
#define PAGE_SHIFT             12
#define PAGE_NUM(x)            ((x) >> PAGE_SHIFT)
#define PAGE_ALIGN(x)          ALIGN(x, PAGE_SIZE)

#define LARGE_PAGE_SIZE        0x400000
#define LARGE_PAGE_SHIFT       22
#define LARGE_PAGE_NUM(x)      ((x) >> LARGE_PAGE_SHIFT)
#define LARGE_PAGE_ALIGN(x)    ALIGN(x, LARGE_PAGE_SIZE)

#define MAX_PAGE_TABLE_ENTRIES 1024

#define SET_PAGE_DIR(x) \
    asm volatile("movl %%eax, %%cr3" :: "a"(x))

//
// BIOS E820, E801 function structs
//

typedef struct {
    u64_t addr;
    u64_t size;
    u32_t type;
} __attribute__((packed)) e820map_t;

typedef struct {
    u16_t extended1;
    u16_t extended2;	
    u16_t configured1;
    u16_t configured2;
} e801map_t;

//
// This is how the bootloader stores the memory information
//

typedef struct {
    u16_t func;         // BIOS supported function (e.g. SIG_E820)
	
    union {
        u16_t bufsize;
        u16_t memsize;
        u16_t e801map;
    };
	
    e820map_t e820map[];
} meminfo_t;

typedef struct {
    ulong addr;
    ulong size;
} memarea_t;

//
// Page table entry
//

typedef struct {
    unsigned present        : 1;
    unsigned writable       : 1;
    unsigned user_page      : 1;
    unsigned write_through  : 1;
    unsigned cache_disabled : 1;
    unsigned accessed       : 1;
    unsigned dirty          : 1;
    unsigned large_page     : 1;
    unsigned global         : 1;
    unsigned available      : 3;
    unsigned page_number    : 20;
} pte_t;

void
i386MmInit();

ulong 
i386MmGetFreeMemory();

memarea_t * 
i386MmGetFreeMemoryList();

ulong
i386MmGetPageDirSize();

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
    );

#endif
