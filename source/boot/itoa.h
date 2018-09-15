#ifndef _ITOA_H_
#define _ITOA_H_

#include "types.h"

char* itoaex(size_t value, char* buffer, int radix, int neg);
char* itoa(long value, char* buffer);
int atoi(char* value);

#endif