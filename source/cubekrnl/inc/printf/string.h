#ifndef _STRING_H_
#define _STRING_H_

#include <ctype.h>

int strlen(const char* string);

char* _strupr(char *s1);
char* _strlwr(char *s1);

void* memset(void* dst, int c, size_t length);
void *memcpy(void *s1, const void *s2, size_t n);

#define bzero(x, len) memset((void *)(x), 0, (size_t)(x))
#define strcpy(x, y) (char*)memcpy(x, y, strlen(y))

#endif // _STRING_H_

