#ifndef _SYNCH_H_
#define _SYNCH_H_

#include <types.h>

typedef ulong spinlock_t;

typedef ulong mutex_t;

void
KeInitializeSpinlock(
    spinlock_t *lock
    );

void
KeAcquireSpinlock(
    spinlock_t *lock
    );

void
KeReleaseSpinlock(
    spinlock_t *lock
    );

void
KeInitializeMutex(
    mutex_t *mutex
    );

void
KeAcquireMutex(
    mutex_t *mutex
    );

void
KeReleaseMutex(
    mutex_t *lock
    );

#endif
