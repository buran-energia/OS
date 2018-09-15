#ifndef _MM_H_
#define _MM_H_

#include <types.h>
#include <hal.h>
#include <ke.h>

/*

    Address:    Virtual:    Size:        Description:
    
    0x00000000  0xC0000000  0x20000000   Kernel

*/

#define NON_PAGED_POOL_SIZE      0x400000

//
// IBM specific
//

#define MEM_EXTENDED             0x100000
#define MEM_16M                  (16 * 0x100000)

//
// Kernel specific
//

#define MAP_KERNEL_BASE_START    0
#define MAP_KERNEL_VIRT_START    0xC0000000
#define MAP_KERNEL_SIZE          0x20000000   // 512 MB

#define KE_VIRT_TO_PHYS(x)       ((x) - (ulong) MAP_KERNEL_VIRT_START)

//
// Pool types
//

#define NON_PAGED_POOL           0

/*

Description:
    
    Converts page pointer of the page database to the page address,
    this eliminates the need of storing each page address in the 
    page db.

Parameters:

    x - pointer to a page database entry

*/

#define PAGE_FROM_DB_ENTRY(x) \
    ( (((ulong) (x) - (ulong) MmPageDatabase) / sizeof(page_t)) << PAGE_SHIFT ) 

#define PAGE_DB_SIZE(max_addr) \
    (PAGE_ALIGN( PAGE_NUM(max_addr) * sizeof(page_t) ))

//
// List manipulation macros
//

#define MmInitializeList(list) \
    KeInitializeSpinlock(&(list)->lock); \
    (list)->first = NULL; \
    (list)->last = NULL; \
    (list)->count = 0

#define MmInsertToList(list, item) \
    if((list)->first == NULL) \
        (list)->first = item; \
    else \
        (list)->last->next = item; \
    (list)->last = item; \
    (item)->next = NULL; \
    (list)->count++;

#define MmDeleteFromList(list, item) \
    if((list)->first != item) { \
        page_t *_$page; \
        if((list)->first != NULL) \
            for(_$page = (list)->first; \
                _$page->next != NULL && _$page->next != item; \
                _$page = _$page->next); \
                if(_$page->next != NULL) { \
                    (list)->count--; \
                    _$page->next = _$page->next->next; } \
    } \
    else { \
        (list)->first = (item)->next; \
        (list)->count--; }
              

#define MmReferPage(page) \
    (page)->reference++;

#define MmDereferPage(page) \
    (page)->reference--;

//
// Page structure
//

typedef struct page_t page_t;

struct page_t {
    page_t *next;
    uint   reference;
};

typedef struct {
    page_t     *first;
    page_t     *last;
    spinlock_t lock;
    ulong      count;
} page_list_t;

//
// Heap structure
//

typedef struct memlist_t memlist_t;

struct memlist_t {
    ulong     addr;
    ulong     size;
    memlist_t *next;
    memlist_t *prev;
};

typedef struct {
    memlist_t  *free_list;
    memlist_t  *used_list;
    ulong      addr;        // heap address
    ulong      size;        // total size of the heap
    ulong      free;        // total bytes left
    ulong      type;
    spinlock_t lock;
} heap_t;

//
// Global variables
//

extern ulong MmMaxPhysAddr;
extern ulong MmTotalFreeMemory;
extern page_t *MmPageDatabase;
extern heap_t MmNonPagedPool;

//
// Function prototypes
//

void
MmInit();

ulong
MmAllocPhysPage();

void
MmFreePhysPage(
    ulong page
    );

void 
MmCreateHeap(
    heap_t *heap,
    ulong addr,
    ulong size,
    ulong type
    );

void *
MmHeapAlloc(
    heap_t *heap,
    ulong size
    );

void
MmHeapFree(
    heap_t *heap,
    void *ptr
    );

ulong
MmGetFreePageCount();

#endif
