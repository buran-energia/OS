#include <hal.h>
#include <i386.h>
#include <mmi386.h>
#include <interrupts.h>
#include <utils.h>
#include <mm.h>
#include <debug.h>

static cpuid_t cpuid;
static seg_reg_t gdtr, idtr;
static segment_t gdt[GDT_SEGMENT_COUNT];
static gate_t idt[IDT_SEGMENT_COUNT];
static tss_t tss;

void
i386CPUInit()

{
    int i;

    ClearScreen();

    if(i386IsCPUSupported() == FALSE) {

        printf("Only i486 and newer processors are supported.");

        i386HaltCPU();
    }

    //
    // Add kernel and user segments to the GDT
    //

    ZeroMemory(gdt, sizeof(segment_t)); // NULL segment

    i386SetSegment(gdt + KERNEL_CODE_SEG,
                   KERNEL_SEG_BASE,
                   KERNEL_SEG_LIMIT,
                   CODE_TYPE,
                   KERNEL_PRIV,
                   TRUE,
                   TRUE,
                   TRUE);

    i386SetSegment(gdt + KERNEL_DATA_SEG,
                   KERNEL_SEG_BASE,
                   KERNEL_SEG_LIMIT,
                   DATA_TYPE,
                   KERNEL_PRIV,
                   TRUE,
                   TRUE,
                   TRUE);

    i386SetSegment(gdt + USER_CODE_SEG,
                   USER_SEG_BASE,
                   USER_SEG_LIMIT,
                   CODE_TYPE,
                   USER_PRIV,
                   TRUE,
                   TRUE,
                   TRUE);

    i386SetSegment(gdt + USER_DATA_SEG,
                   USER_SEG_BASE,
                   USER_SEG_LIMIT,
                   DATA_TYPE,
                   USER_PRIV,
                   TRUE,
                   TRUE,
                   TRUE);

    //
    // TSS segment is needed to do the "USER to KERNEL" transition
    //

    i386SetSegment(gdt + TSS_SEG,
                   (uint) &tss,
                   sizeof(tss_t),
                   TSS32_TYPE,
                   KERNEL_PRIV,
                   TRUE,
                   TRUE,
                   TRUE);

    tss.ss0 = GDT_SELECTOR(DATA_TYPE);
    tss.iomap = sizeof(tss_t);

    //
    // Setup exception handlers and IRQs
    //

    for(i = 0; i < MAX_EXCEPTIONS + MAX_IRQS; i++) {

        i386SetGate(idt + i,
                    (ulong) interrupts[i],
                    GDT_SELECTOR(KERNEL_CODE_SEG),
                    INT32_TYPE,
                    TRUE,
                    KERNEL_PRIV,
                    TRUE);
    };

    //
    // Setup GDT, IDT and TSS registers
    //

    gdtr.base = (u32_t) gdt;
    gdtr.limit = GDT_SEGMENT_COUNT * sizeof(segment_t) - 1;

    idtr.base = (u32_t) idt;
    idtr.limit = IDT_SEGMENT_COUNT * sizeof(segment_t) - 1;

    i386LoadGDTR(&gdtr);
    i386LoadIDTR(&idtr);
    i386LoadTSS(GDT_SELECTOR(TSS_SEG));

    //
    // Setup PIC, Timer and fill the cpuid_t struct
    //

    i386InitPIC(MASTER_PIC_VEC, SLAVE_PIC_VEC);

    i386SetTimerFreq(SCHEDULER_FREQ);

    i386GetCPUID(&cpuid);

    //
    // Setup stack to a known value
    //

    SET_STACK(BOOT_STACK);

    //
    // Initialize device-dependent MM
    //

    i386MmInit();

    //
    // Load KERNEL_CODE_SEG and jump to main kernel function
    //

    asm volatile("ljmp %0, $_KernelMain" 
                 :: "i"(GDT_SELECTOR(KERNEL_CODE_SEG)));
}

void 
i386InitPIC(
    int master_vec,
    int slave_vec
    )

/*

Description:
    
    Initialize i8259 Programmable Interrupt Controller,
    masks all interrupts

Parameters:

    master_vec - where to map 8 master IRQs, this is a vector number in IDT

    slave_vec - where to map 8 slave IRQs, this is a vector number in IDT

*/

{
    //
    // Reprogram master controller
    //

    i386WritePortB(INT_CTRL, ICW1); 
    i386WritePortB(INT_MASK, master_vec);
    i386WritePortB(INT_MASK, 1 << CASCADE_IRQ); 
    i386WritePortB(INT_MASK, ICW4);
    i386WritePortB(INT_MASK, ~(1 << CASCADE_IRQ));
    i386WritePortB(INT_MASK, 0xFF);
	
    //
    // And now the slave
    //

    i386WritePortB(INT_CTRL_SLAVE, ICW1);
    i386WritePortB(INT_MASK_SLAVE, slave_vec);
    i386WritePortB(INT_MASK_SLAVE, CASCADE_IRQ);
    i386WritePortB(INT_MASK_SLAVE, ICW4);
    i386WritePortB(INT_MASK_SLAVE, 0xFF);
}

void 
i386SetTimerFreq(
    int freq
    )

{
    i386WritePortB(TIMER_MODE, SQUARE_WAVE);
    i386WritePortB(TIMER0, (TIMER_FREQ / freq) & 0xFF);
    i386WritePortB(TIMER0, (TIMER_FREQ / freq) >> 8);	
}

void 
i386HaltCPU()

{
    asm("hlt");
}

inline void
i386EnableIRQ(
    int irq
    )

{
    static uint mask;

    mask &= ~(1 << irq);

    if(irq < 8) {

        i386WritePortB(INT_MASK, mask);

    } 
    else {

        i386WritePortB(INT_MASK_SLAVE, mask >> 8);
    }
}

inline void
i386DisableIRQ(
    int irq
    )

{
    static uint mask;

    mask |= (1 << irq);

    if(irq < 8) {

        i386WritePortB(INT_MASK, mask);

    } 
    else {

        i386WritePortB(INT_MASK_SLAVE, mask >> 8);
    }
}

inline void
i386AckInterrupt(
    u8_t irq
    )

{
    i386WritePortB(INT_CTRL, END_OF_INT);

    //
    // Do we need to acknowledge the slave controller?
    //

    if(irq >= 8) {

        i386WritePortB(INT_CTRL_SLAVE, END_OF_INT);
    }
}

void 
i386InitContext(
    context_t *context, 
    int type, 
    uint entry, 
    uint stack
    )

{

}

void 
i386LoadGDTR(
    seg_reg_t *gdtr
    )

{
    asm("lgdt %0" :: "m"(*gdtr));
}

void 
i386LoadIDTR(
    seg_reg_t *idtr
    )

{
    asm("lidt %0" :: "m"(*idtr));
}

void
i386LoadTSS(
    u16_t sel
    )

{
    asm("ltr %0" :: "m"(sel));
}

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
    )

{
    ZeroMemory(seg, sizeof(segment_t));

    seg->base_lo = base & 0xFFFF;
    seg->base_hi1 = (base >> 16) & 0xFF;
    seg->base_hi2 = base >> 24;
    seg->limit_lo = limit & 0xFFFF;
    seg->limit_hi = limit >> 16;
    seg->type = type;
    seg->dpl = dpl;
    seg->present = present;
    seg->op_size = op_size;
    seg->zero = 0;
    seg->granularity = granularity;
}

void
i386SetGate(
    gate_t *gate,
    ulong offset,
    u16_t selector,
    uint gate_type,
    bool gate_size,
    uint dpl,
    bool present
    )

{
    ZeroMemory(gate, sizeof(gate_t));

    gate->offset_lo = offset & 0xFFFF;
    gate->offset_hi = offset >> 16;
    gate->selector = selector;
    gate->gate_type = gate_type;
    gate->gate_size = gate_size;
    gate->dpl = dpl;
    gate->present = present;
}

static bool
i386CanChangeFlag(
    int flag
    )

{
    bool result;

    asm volatile("pushf\n\t" \
                 "popl %%eax\n\t" \
                 "movl %%eax, %%ebx\n\t" \
                 "xorl %1, %%eax\n\t" \
                 "pushl %%eax\n\t" \
                 "popf\n\t" \
                 "pushf\n\t" \
                 "popl %%eax\n\t" \
                 "xorl %1, %%eax\n\t" \
                 "cmpl %%ebx, %%eax\n\t" \
                 "jz 1f\n\t" \
                 "xorl %%eax, %%eax\n\t" \
                 "jmp 2f\n\t" \
                 "1:\n\t" \
                 "movl $1, %%eax\n\t" \
                 "2:" : "=a"(result) : "m"(1 << flag));

    //
    // Although the value is already in eax, we need this in order to
    // to hide the "control reaches end of non-void function" warning
    //

    return result;
}

bool 
i386GetCPUID(
    cpuid_t *cpuid
    )

/*

Description:
    
    Checks whether CPUID instruction is supported and fills cpuid struct
    with the appropriate information.

Parameters:

    cpuid - cpuid_t structure to be filled

Returns:

    FALSE - if CPUID is not supported, cpuid struct will be filled with zeros

    TRUE - if CPUID is supported

*/

{
    u32_t eax;
    u32_t ebx;
    u32_t ecx;
    u32_t edx;

    ZeroMemory(cpuid, sizeof(cpuid_t));

    //
    // Check to see whether CPUID instruction is supported
    //

    if(i386CanChangeFlag(EFLAGS_ID) == FALSE) {

        return FALSE;
    }

    CPUID(0, eax, ebx, ecx, edx);
                 
    cpuid->max_input = eax;

    //
    // Get processor name (e.g. GenuineIntel)
    //

    *((u32_t *) &cpuid->name[0]) = ebx;
    *((u32_t *) &cpuid->name[4]) = edx;
    *((u32_t *) &cpuid->name[8]) = ecx;        
    
    if(cpuid->max_input > 0) {

        CPUID(1, eax, ebx, ecx, edx);

        cpuid->logical_processors = (ebx >> 16) & 0xFF;
        cpuid->features = edx;
        cpuid->ext_features = ecx;
    }
	             
    return TRUE;
}

bool
i386IsCPUSupported()

/*

Description:

    Checks whether the processor is 486 or newer, by trying
    to change the AC flag in the EFLAGS register.

Returns:

    TRUE - if the processor is 486 or newer

    FALSE - if the processor is 386

*/

{
    return i386CanChangeFlag(EFLAGS_AC);
}

bool
i386QueryFeature(
    uint feature
    )

{
    if(cpuid.features & (1 << feature)) {

        return TRUE;
    }
    else {
        
        return FALSE;
    }
}

ulong
i386InterruptHandler(
    context_t *context
    )

{
    ulong cr2;

    DEBUG("\nINTERRUPT %ld\n", context->interrupt);

    switch(context->interrupt) {

        case EX_PAGE_FAULT:

            GET_CR2(&cr2);
            MmPageFault(cr2, context->code);

            break;
    }

 //	if(IsrReentrance > 1)
 	 	return 0;
}
