#ifndef _I386_H_
#define _I386_H_

#include <types.h>

//
// Machine specific defines
//

#define DWORD_SIZE         4

#define GDT_SEGMENT_COUNT  6
#define IDT_SEGMENT_COUNT  256

#define KERNEL_PRIV        0
#define USER_PRIV          3

#define MAX_EXCEPTIONS    32
#define MAX_IRQS          16

//
// i8259 Programmable Interrupt Controller defines
//

#define MASTER_PIC_VEC     32
#define SLAVE_PIC_VEC      (MASTER_PIC_VEC + 8)

#define INT_CTRL           0x20
#define END_OF_INT         0x20      
#define INT_CTRL_SLAVE     0xA0
#define INT_MASK           0x21
#define INT_MASK_SLAVE     0xA1
#define CASCADE_IRQ        2
#define ICW1               0x11 // Initialization command word, edge triggered, cascade, ICW4 needed
#define ICW4               1    // no special fully nested mode, not buffered, normal EOI

//
// i8253 Timer defines
// 

#define TIMER0             0x40
#define TIMER_MODE         0x43
#define TIMER_FREQ         1193182
#define SQUARE_WAVE        0x36
#define TIMER_IRQ          0

//
// Segment descriptor types
//

#define GDT_SELECTOR(x)    ((x) << 3)

#define NULL_SEG           0
#define KERNEL_CODE_SEG    1
#define KERNEL_DATA_SEG    2
#define USER_CODE_SEG      3
#define USER_DATA_SEG      4
#define TSS_SEG            5

#define CODE_TYPE          0x1A  // execute, read, non-conforming
#define DATA_TYPE          0x12  // read, write, expand-up
#define TSS32_TYPE         0x9   // 32-bit TSS (available)
#define INT32_TYPE         0xE   // 32-bit interrupt gate
#define TRAP32_TYPE        0xF   // 32-bit trap gate

#define KERNEL_SEG_BASE    0
#define KERNEL_SEG_LIMIT   0xFFFFF
#define USER_SEG_BASE      0
#define USER_SEG_LIMIT     0xFFFFF

//
// Flags in the EFLAGS register
//

#define EFLAGS_NT          14
#define EFLAGS_AC          18
#define EFLAGS_ID          21

//
// CPUID feature flags
//

#define CPUID_PSE          3
#define CPUID_SEP          11
#define CPUID_MTRR         12
#define CPUID_PGE          13
#define CPUID_HTT          28

//
// CR4 flags
//

#define CR4_PSE            (1 << 4)
#define CR4_PGE            (1 << 7)

//
// Misc macros
//

#define SET_CR4_FLAG(flag) \
    asm volatile("movl %%cr4, %%eax\n\t" \
                 "orl %%ebx, %%eax\n\t" \
                 "movl %%eax, %%cr4" \
                 :: "b"(flag));

#define SET_STACK(stack) \
    asm volatile("movl %%eax, %%esp" :: "a"(stack));

//
// i386 Port I/O
//

#define i386WritePortB(port, value) \
    asm volatile("outb %%al, %%dx" :: "d"(port), "a"(value));

#define i386WritePortW(port, value) \
    asm volatile("outw %%ax, %%dx" :: "d"(port), "a"(value));

#define i386ReadPortB(port, value) \
    asm volatile("inb %%dx, %%al" : "=a"(value) : "d"(port));

//
// CPU dependent string manipulation functions
//

#define i386SetMemory(addr, value, length) \
    asm("cld\n\t" \
        "rep stosb" :: "D"(addr), "a"(value), "c"(length));

#define i386SetMemoryD(addr, value, length) \
    asm("cld\n\t" \
        "rep stosl" :: "D"(addr), "a"(value), "c"(length));  

//
// CPUID instruction
//

#define CPUID(value, eax, ebx, ecx, edx) \
    asm volatile("cpuid" \
                 : "=a"(eax), "=b"(ebx), "=c"(ecx), "=d"(edx) \
                 : "a"(value));       

//
// These are the things we need from CPUID
//

typedef struct {
	u32_t max_input;
	char  name[13];
	u8_t  logical_processors;
	u32_t features;
	u32_t ext_features;
} cpuid_t;

//
// General purpose registers
//

typedef struct {
    u32_t edi;
    u32_t esi;
    u32_t ebp;
    u32_t esp;
    u32_t ebx;
    u32_t edx;
    u32_t ecx;
    u32_t eax;
} regs_t;

//
// i386 TSS struct
//

typedef struct {
    u32_t link;
    u32_t esp0;
    u32_t ss0;
    u32_t esp1;
    u32_t ss1;
    u32_t esp2;
    u32_t ss2;
    u32_t cr3;
    u32_t eip;
    u32_t eflags;
    u32_t eax;
    u32_t ecx;
    u32_t edx;
    u32_t ebx;
    u32_t esp;
    u32_t ebp;
    u32_t esi;
    u32_t edi;
    u32_t es;
    u32_t cs;
    u32_t ss;
    u32_t ds;
    u32_t fs;
    u32_t gs;
    u32_t ldt;
    u32_t iomap;
} tss_t;

//
// Threads context
//

typedef struct {
    u32_t gs;
    u32_t fs;
    u32_t es;
    u32_t ds;
    regs_t regs;
    u32_t interrupt;	
    u32_t code;
    u32_t eip;
    u32_t cs;
    u32_t eflags;
    u32_t esp;
    u32_t ss;
} context_t;

//
// Segment descriptor
//

typedef struct {
    unsigned limit_lo    : 16;
    unsigned base_lo     : 16;
    unsigned base_hi1    : 8;
    unsigned type        : 5;
    unsigned dpl         : 2;
    unsigned present     : 1;
    unsigned limit_hi    : 4;
    unsigned available   : 1;
    unsigned zero        : 1; // always 0
    unsigned op_size     : 1;
    unsigned granularity : 1;
    unsigned base_hi2    : 8;
} __attribute__((aligned (8))) segment_t;

//
// Task, Interrupt and Trap gates
//

typedef struct {
    unsigned offset_lo   : 16;
    unsigned selector    : 16;
    unsigned reserved    : 5;
    unsigned zero1       : 3;
    unsigned gate_type   : 3; // 101b = task gate, 110b - interrupt gate, 111b - trap gate
    unsigned gate_size   : 1; // 16 or 32 bit? (only for int and trap gates)
    unsigned zero2       : 1;
    unsigned dpl         : 2;
    unsigned present     : 1;
    unsigned offset_hi   : 16;
} __attribute__((aligned (8))) gate_t;

//
// GDT / IDT registers
//

typedef struct {
    u16_t limit;
    u32_t base;
} __attribute__((packed)) seg_reg_t;

//
// Function prototypes
//

void
i386CPUInit();

void 
i386InitPIC(
    int master_vec,
    int slave_vec
    );

void 
i386SetTimerFreq(
    int freq
    );

void 
i386HaltCPU();

inline void
i386MaskIRQs(
    u32_t mask
    );

inline void
i386AckInterrupt(
    u8_t irq
    );

void 
i386InitContext(
    context_t *context, 
    int type, 
    uint entry, 
    uint stack
    );

void 
i386LoadGDTR(
    seg_reg_t *gdtr
    );

void 
i386LoadIDTR(
    seg_reg_t *idtr
    );

void
i386LoadTSS(
    u16_t sel
    );

void
i386SetSegment(
    segment_t *seg,
    ulong base,
    ulong limit,
    uint type,
    uint dpl,
    bool present,
    bool op_size,
    bool granularity
    );

void
i386SetGate(
    gate_t *gate,
    ulong offset,
    u16_t selector,
    uint gate_type,
    bool gate_size,
    uint dpl,
    bool present
    );

bool 
i386GetCPUID(
    cpuid_t *cpuid
    );

bool
i386IsCPUSupported();

bool
i386QueryFeature(
    uint feature
    );

#endif
