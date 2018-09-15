#ifndef _PROCESS_H_
#define _PROCESS_H_

#include <types.h>
#include <thread.h>

typedef struct process_t process_t;

struct process_t {
    process_t *next;
    thread_t  *threads;
    ulong     id;
    ulong     pagedir;
    char      *path;
    uint      type;
    ulong     last_thread_id;
};

#endif
