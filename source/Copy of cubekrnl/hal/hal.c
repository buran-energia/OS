#include <hal.h>

void 
HALSetup()

/*

Description:

    Initialize CPU, this is the first function that should be called
    after loading the kernel.

*/

{
    i386CPUInit();
}

void 
HALIdleThread()

{
    #ifdef _i386_
    
    i386HaltCPU();
    
    #endif
}

void 
HALSetTimerFreq(
    int freq
    )

/*

Description:
    
    Initialize timer

Parameters:

    freq - timer frequency in Hz

*/

{
    #ifdef _i386_
    
    i386SetTimerFreq(freq);
    
    #endif
}

void 
HALInitContext(
    context_t *context, 
    int type, 
    uint entry, 
    uint stack
    )

/*

Description:

    Initializes threads context, this should be used when creating new threads.

Parameters:

    context - pointer to threads context that needs to be initialized

    type - there are 2 types: system and user threads

    entry - threads entry point (instruction pointer)

    stack - threads stack

*/

{
    #ifdef _i386_

    i386InitContext(context, type, entry, stack);

    #endif
}

void 
HALMaskIRQs(
    u32_t mask
    )

/*

Description:
    
    Enables/Disables IRQs

Parameters:

    mask - bitmap of IRQs, 0 - enabled, 1 - disabled

*/

{
    #ifdef _i386_

    i386MaskIRQs(mask);

    #endif
}

void
HALAckInterrupt(
    u8_t irq
    )

{
    #ifdef _i386_

    i386AckInterrupt(irq);

    #endif
}

void 
HALShutDown(
    uint flags
    )

{

// UNIMPLEMENTED

}

void
HALInterruptHandler(context_t *context)
{
    printf("INTERRUPT %d\n", context->interrupt);

    ulong page;
	asm volatile("movl %%cr2, %%eax\nmovl %%eax, %0" : "=m"(page));
	printf("PAGE 0x%08X EIP 0x%08X\n", page, context->eip);

    for(;;);
}
