#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <types.h>

char *textmem = (char *) 0xC00B8000;
unsigned int CurPos = 0, Color = 7, width = 80, height = 25;

inline void outb(u16_t port, u8_t byte)
{
	asm volatile("outb %%al, %%dx" :: "d"(port), "a"(byte));
}

int GetColor()
{
	return Color;
}

void SetColor(int col)
{
	Color = col;
}

void SetXY(int x, int y)
{
	if(y>height-1) x = height-1;
	if(x>width-1) x = width-1;
	CurPos = (y*width+x)<<1;
}

void GetXY(int *x, int *y)
{
	*y = CurPos / (width<<1);
	*x = (CurPos % (width<<1))>>1;
}

void SetCursor(int x, int y)
{
	int pos = width*y+x;

	outb(0x3d4, 0x0F);
	outb(0x3d5, pos);

	outb(0x3d4, 0x0E);
	outb(0x3d5, pos >> 8);
}

void MoveUp()
{
	int i, d;

	for(i=width<<1, d=0; i<height*width<<1; d++, i++)
	textmem[d] = textmem[i];

	for(i=(height-1)*width<<1; i<height*width<<1; i+=2) {
		textmem[i] = Color;
		textmem[i] = 0;
	}
}

void ClearScreen()
{
	int i;

	for(i=0; i<4000; i+=2) {
	  textmem[i] = 0;
	  textmem[i+1] = Color;
	}

	SetCursor(-1, -1);
	CurPos = 0;
}

void putc(char c)
{
	int x, y;

	switch(c) {
		case '\n':
			  GetXY(&x, &y);
			  SetXY(0, y+1);
			  break;
		case '\r':
			  GetXY(&x, &y);
			  SetXY(0, y);
			  break;
		case '\t':
			  GetXY(&x, &y);
			  SetXY(x+8, y);
			  break;
	}

	if(CurPos>=height*width<<1) {
	  MoveUp();
	  CurPos = (height-1)*width<<1;
	}

	if(c!='\n' && c!='\r' && c!='\t') {
	  textmem[CurPos++] = c;
	  textmem[CurPos++] = Color;
	}
}
/*
void TextOut(int x, int y, char *str, int len, int color)
{
	int tmpColor, tmpPos;

	tmpPos = CurPos;
	tmpColor = GetColor();
	SetColor(color);
	SetXY(x, y);

	while(len--)
	putc(*str++);

	SetColor(tmpColor);
	CurPos = tmpPos;
}*/

void print(char *msg)
{
	while(*msg)
	putc(*msg++);
}

int printf(const char *format, ...)
{
	va_list args;
	int i;
	char printbuf[1024];

	va_start(args, format);
	i = vsnprintf(printbuf, 0xFFFFFFFFUL, format, args);
	print(printbuf);
	va_end(args);

	return i;
}
