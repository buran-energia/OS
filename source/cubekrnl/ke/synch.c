#include <synch.h>

void
KeInitializeSpinlock(
    spinlock_t *lock
    )

{
    *lock = 0;
}

void
KeAcquireSpinlock(
    spinlock_t *lock
    )

{
    #ifdef _i386_

    //
    // On a uniprocessor, this is just a HALDisableInterrupts routine
    //

    HALDisableInterrupts();

    #endif
}

void
KeReleaseSpinlock(
    spinlock_t *lock
    )

{
    #ifdef _i386_

    HALEnableInterrupts();

    #endif    
}

void
KeInitializeMutex(
    mutex_t *mutex
    )

{
    *mutex = 0;
}

void
KeAcquireMutex(
    mutex_t *mutex
    )

{
    #ifdef _i386_

    HALDisableInterrupts();

    #endif
}

void
KeReleaseMutex(
    mutex_t *lock
    )

{
    #ifdef _i386_

    HALEnableInterrupts();

    #endif    
}
