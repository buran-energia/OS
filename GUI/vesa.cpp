#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <go32.h>
#include <dpmi.h>
#include <sys/nearptr.h>
#include "vesa.h"

MODEINFO modeinfo;

void GetVBEInfo(VBEINFO *vbeinfo)
{
	__dpmi_regs r;
	
	r.x.ax = 0x4F00;

	r.x.di = 0;
	r.x.es = (__tb >> 4);
	dosmemput(vbeinfo, sizeof(VBEINFO), __tb);	
	__dpmi_int(0x10, &r);
	dosmemget(__tb, sizeof(VBEINFO), vbeinfo);
}

void GetModeInfo(int mode, MODEINFO *modeinfo)
{
	__dpmi_regs r;
	
	r.x.ax = 0x4F01;
	r.x.cx = mode;
	r.x.di = 0;
	r.x.es = (__tb >> 4);
	dosmemput(modeinfo, sizeof(MODEINFO), __tb);	
	__dpmi_int(0x10, &r);
	dosmemget(__tb, sizeof(MODEINFO), modeinfo);
}

void SetVESAMode(int mode, int LFB)
{
	__dpmi_regs r;

	GetModeInfo(mode, &modeinfo);

//	printf("X: %d\nY: %d\nBPP: %d", modeinfo.XResolution, modeinfo.YResolution, modeinfo.BitsPerPixel);
//	getch();
//	LFB_Enabled = LFB;
	
	if(LFB) mode |= 0x4000;
	r.x.ax = 0x4F02;
	r.x.bx = mode;
	__dpmi_int(0x10, &r);
}
