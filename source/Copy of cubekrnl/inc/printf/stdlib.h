#ifndef _STDLIB_H_
#define _STDLIB_H_

#include <ctype.h>

char* itoaex(size_t value, char* buffer, int radix, int neg);
char* itoa(long value, char* buffer);
int atoi(char* value);

#endif // _STDLIB_H_
