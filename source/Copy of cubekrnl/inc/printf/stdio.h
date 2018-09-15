#ifndef _STDIO_H_
#define _STDIO_H_

#include <stdarg.h>

int vsnprintf(char* buffer, int size, const char* format, va_list args);
int sprintf(char* buffer, const char* format, ...);
int snprintf(char* buffer, int size, const char* format, ...);
int printf(const char* format, ...);

void print(char *msg);
void SetXY(int x, int y);
void GetXY(int *x, int *y);
void putc(char c);
void SetColor(int col);
int GetColor();
void ClearScreen();
//void TextOut(int x, int y, char *str, int len, int color);
void MoveUp();
void SetCursor(int x, int y);

void init_console(int);

#endif // _STDIO_H_
