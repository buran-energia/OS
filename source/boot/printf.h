#ifndef _PRINTF_H_
#define _PRINTF_H_

#include "stdarg.h"

int printf(const char *format, ...);
int vsnprintf(char* buffer, int size, const char* format, va_list args);
int sprintf(char* buffer, const char* format, ...);
int snprintf(char* buffer, int size, const char* format, ...);
int print(const char* str);
extern void putc(char c);

#endif