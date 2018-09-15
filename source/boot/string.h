#ifndef _STRING_H_
#define _STRING_H_

#include "types.h"

int strlen(const char* string);
int strcmp(const char *s1, const char *s2);
int strncmp(const char *s1, const char *s2, int n);

char* _strupr(char *s1);
char* _strlwr(char *s1);

void* memset(void* dst, int c, int length);
void *memcpy(void *s1, const void *s2, int n);
char *strncpy(char *s1, const char *s2, int n);
char *strchr(char *s, char c);

#define bzero(x, len) memset((void *)(x), 0, (int)(x))
#define strcpy(x, y) (char*)memcpy(x, y, strlen(y))

#endif
