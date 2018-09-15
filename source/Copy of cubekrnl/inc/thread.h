#ifndef _THREAD_H_
#define _THREAD_H_

#include <types.h>

typedef struct thread_t thread_t;

struct thread_t {
    thread_t  *next;
    ulong     id;
    uint      state;
    ulong     create_time;   // currently unused
    ulong     stack;
    ulong     start_address;
    uint      priority;
 // process_t *process;
};

#endif
