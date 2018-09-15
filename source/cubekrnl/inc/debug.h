#ifndef _DEBUG_H_
#define _DEBUG_H_

#include <ke.h>
#include <stdio.h>

//
// Debug macros
//

#define ENABLE_DEBUG

#ifdef ENABLE_DEBUG
#define DEBUG(x, ...) \
    printf(x, ##__VA_ARGS__);
#else
#define DEBUG(x, ...)
#endif

#define ASSERT(x) \
    (x) ? TRUE : KePanicStr("%s:%d %s", __FILE__, __LINE__, #x)

#endif
