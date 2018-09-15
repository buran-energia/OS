#ifndef _HAL_H_
#define _HAL_H_

#define _i386_

#include <types.h>

#define SCHEDULER_FREQ    100

//
// i386 specific
//

#ifdef _i386_
#include <i386.h>

#define WritePortB(port, value) \
    i386WritePortB(port, value)

#define WritePortW(port, value) \
    i386WritePortW(port, value)

#define ReadPortB(port, value) \
    i386ReadPortB(port, value)

#define HALEnableInterrupts() \
    asm volatile("sti");

#define HALDisableInterrupts() \
    asm volatile("cli");
#endif

#define SIZE_IN_DWORDS(x)   ALIGN(x, DWORD_SIZE)

//
// Function prototypes
//

void 
HALSetup();

void 
HALIdleThread();

void 
HALSetTimerFreq(
    int freq
    );

void 
HALInitContext(
    context_t *context, 
    int type, 
    uint entry, 
    uint stack
    );

void 
HALMaskIRQs(
    u32_t mask
    );

void
HALAckInterrupt(
    u8_t irq
    );

void 
HALShutDown(
    uint flags
    );

#endif
