#include <stdio.h>
#include <string.h>
#include <conio.h>
#include <go32.h>
#include <dpmi.h>
#include "vbe12.h"

int curbank = 0;

void SetBank(short bank)
{
	if(curbank == bank) return;

	curbank = bank;
	
	__dpmi_regs r;	
	
	r.x.ax = 0x4F05;
	r.x.bx = 0;
	r.x.dx = bank;
	__dpmi_int(0x10, &r);	
}

void SetPixel(int x, int y, DWORD color)
{
	DWORD pos = (y*Screen->ScreenWidth+x)*Screen->bpp;

	if(pos>>16 != curbank) SetBank(pos>>16);

	memcpy(&vmem[pos&0xFFFF], &color, Screen->bpp);
}

void PutImage(int left, int top, int width, int height, BYTE *buf)
{
	DWORD pos = (top*Screen->ScreenWidth+left)*Screen->bpp;
	DWORD workarea = pos&0xFFFF;
	DWORD d = Screen->ScreenWidth*Screen->bpp;
	DWORD dimg = width*Screen->bpp;

	SetBank(pos>>16);

	height += top;
	for(; top<height; top++)
	{
		if((workarea+dimg) > 0xFFFF)
		{
			memcpy(&vmem[workarea], &buf[pos], 0xFFFF-workarea);
			SetBank(curbank+1);
			memcpy(vmem, &buf[pos+0x10000-workarea], (workarea+dimg)-0x10000);
			workarea = (workarea+d)&0xFFFF;
		}
		else
		{
			memcpy(&vmem[workarea], &buf[pos], dimg);
			workarea += d;
			if(workarea > 0xFFFF)
			{
				SetBank(curbank+1);
				workarea &= 0xFFFF;
			}
		}

		pos += d;
	}
}
