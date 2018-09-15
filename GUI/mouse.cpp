#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dos.h>
#include <go32.h>
#include <dpmi.h>
#include "screen.h"
#include "mouse.h"

short oldmousex, oldmousey;
BYTE *mouseback, *mousebuf, *mouseimg;
CMouse *Mouse;
RECT updatelist[5]; // mouse update regions, to bypass A LOT of mallocs on mouse move

const unsigned char mouse_shadow[24*16] = {
253, 251, 250, 249, 249, 250, 251, 253, 255, 255, 255, 255, 255, 255, 255, 255, 
251, 255, 244, 241, 241, 243, 246, 250, 252, 255, 255, 255, 255, 255, 255, 255, 
248, 255, 255, 229, 227, 231, 237, 244, 249, 252, 255, 255, 255, 255, 255, 255, 
244, 255, 255, 255, 209, 213, 223, 233, 242, 248, 252, 255, 255, 255, 255, 255, 
240, 255, 255, 255, 255, 191, 203, 218, 231, 242, 248, 252, 255, 255, 255, 255, 
236, 255, 255, 255, 255, 255, 179, 197, 216, 231, 242, 248, 252, 255, 255, 255, 
234, 255, 255, 255, 255, 255, 255, 173, 195, 215, 231, 242, 248, 252, 255, 255, 
233, 255, 255, 255, 255, 255, 255, 255, 170, 194, 215, 231, 242, 248, 252, 255, 
232, 255, 255, 255, 255, 255, 255, 255, 255, 170, 194, 215, 231, 242, 249, 252, 
232, 255, 255, 255, 255, 255, 255, 255, 255, 255, 171, 196, 217, 233, 244, 250, 
232, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 176, 201, 222, 237, 246, 
232, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 255, 187, 212, 230, 243, 
232, 255, 255, 255, 255, 255, 255, 255, 100, 100, 122, 150, 179, 205, 226, 240, 
232, 255, 255, 255, 119, 255, 255, 255, 255, 101, 121, 148, 177, 204, 225, 240, 
234, 255, 255, 157, 132, 255, 255, 255, 255, 126, 126, 152, 181, 207, 227, 241, 
239, 225, 207, 188, 173, 160, 255, 255, 255, 255, 136, 159, 186, 212, 232, 244, 
243, 233, 220, 208, 197, 186, 172, 255, 255, 255, 158, 158, 184, 210, 231, 244, 
247, 241, 233, 225, 218, 209, 195, 255, 255, 255, 255, 158, 182, 208, 229, 243, 
251, 247, 243, 238, 234, 227, 214, 196, 255, 255, 154, 163, 183, 207, 228, 242, 
253, 251, 249, 247, 244, 239, 229, 213, 194, 178, 170, 175, 191, 212, 230, 243, 
255, 253, 253, 252, 250, 246, 239, 227, 212, 199, 192, 194, 205, 221, 235, 245, 
255, 255, 255, 255, 253, 251, 246, 238, 228, 219, 213, 214, 221, 232, 242, 249, 
255, 255, 255, 255, 255, 253, 250, 246, 241, 235, 232, 232, 236, 242, 247, 251, 
255, 255, 255, 255, 255, 255, 253, 251, 248, 246, 244, 244, 246, 249, 251, 253};

void MouseHandler(__dpmi_regs *regs)
{
	short x, y, tmp = Mouse->MouseButtons;
	union REGS r;
	
	if(!Mouse->MouseEnabled || busy) return;
	
	Mouse->MouseButtons = regs->x.bx;	
	
	r.x.ax = 0xB;
	int86(0x33, &r, &r);	
	asm volatile("movw %%cx, %0\n"
				 "movw %%dx, %1\n"
				 : "=m"(x), "=m"(y));
			
	short mx = Mouse->MouseX+x;
	short my = Mouse->MouseY+y;

	Mouse->SetCursorPos(mx, my);	

	if(mouse_callback)
	{
		mouse_callback(x, y, Mouse->MouseButtons);
		return;
	}		
				 
/*	r.x.ax = 3;		
	int86(0x33, &r, &r); 

	asm("movw %%bx, %0" : "=m"(buttons)); */

	if(!tmp&1 && Mouse->MouseButtons&1)
		Screen->MouseDown(mx, my);
		
	if(tmp&1 && !Mouse->MouseButtons&1)
		Screen->MouseUp(mx, my);	
	
	if(x || y)
		Screen->MouseMove(mx, my);
}

void SetMouseEventHandler(void (*func)(__dpmi_regs *))
{
	__dpmi_regs r, callback_regs;
	_go32_dpmi_seginfo callback_info;

	callback_info.pm_offset = (unsigned int) func;
	callback_info.pm_selector = _my_cs();

	_go32_dpmi_allocate_real_mode_callback_retf(&callback_info, &callback_regs);

	r.x.ax = 0xC;
	r.x.cx = 0xFF;
	r.x.dx = callback_info.rm_offset;
	r.x.es = callback_info.rm_segment;

	__dpmi_int(0x33, &r);
}

void RemoveMouseEventHandler()
{
	__dpmi_regs r;

	r.x.ax = 0xC;
	r.x.cx = 0;
	r.x.dx = 0;
	r.x.es = 0;

	__dpmi_int(0x33, &r);
}

CMouse::CMouse()
{
	union REGS r;
	WORD check;

	MouseX = 100;
	MouseY = 100;
	
	r.x.ax = 0;
	int86(0x33, &r, &r);	
	asm volatile("movw %%ax, %0" : "=m"(check));
	if(check != 0xFFFF) panic("Mouse driver not installed!");
	
	mouseback = new BYTE[MOUSE_HEIGHT*MOUSE_WIDTH*Screen->bpp];
	mousebuf = new BYTE[MOUSE_HEIGHT*MOUSE_WIDTH*Screen->bpp];
	mouseimg = new BYTE[MOUSE_HEIGHT*MOUSE_WIDTH*Screen->bpp];
	if(!mouseback || !mousebuf || !mouseimg) panic("cannot alloc mem for mouse");
	memset(mouseback, 0, MOUSE_HEIGHT*MOUSE_WIDTH*Screen->bpp);
	memset(mousebuf, 0, MOUSE_HEIGHT*MOUSE_WIDTH*Screen->bpp);
	memset(mouseimg, 0, MOUSE_HEIGHT*MOUSE_WIDTH*Screen->bpp);
	
	FILE *fp = fopen("cursor.bmp", "rb");
	if(fp == NULL) panic("cannot open cursor.bmp");	
	fseek(fp, 54, SEEK_SET);

	for(int y=(MOUSE_HEIGHT-1)*MOUSE_WIDTH; y>=0; y-=MOUSE_WIDTH)
		for(int x=0; x<MOUSE_WIDTH; x++)
			fread(&mouseimg[(x+y)*Screen->bpp], 3, 1, fp);
	
	fclose(fp);	
	
	Screen->Image(MouseX, MouseY, MOUSE_WIDTH, MOUSE_HEIGHT, mouseback, 1);	
	SetCursorPos(100, 100);
	MouseEnabled = 1;
}

CMouse::~CMouse()
{
	free(mouseback);
	free(mousebuf);
	free(mouseimg);
}

void CMouse::Init()
{
	SetMouseEventHandler(MouseHandler);
}

void CMouse::DeInit()
{
	RemoveMouseEventHandler();
}

void CMouse::Draw()
{
	Screen->Image(MouseX, MouseY, MOUSE_WIDTH, MOUSE_HEIGHT, mouseback, 1);
	memcpy(mousebuf, mouseback, MOUSE_HEIGHT*MOUSE_WIDTH*Screen->bpp);	
	
	for(int i=0, d=0; i<MOUSE_WIDTH*MOUSE_HEIGHT*Screen->bpp; i+=Screen->bpp, d++)
	{
		mousebuf[i] = Alpha(mousebuf[i], 0, mouse_shadow[d]);
		mousebuf[i+1] = Alpha(mousebuf[i+1], 0, mouse_shadow[d]);
		mousebuf[i+2] = Alpha(mousebuf[i+2], 0, mouse_shadow[d]);
	}
	
	for(int d=0, i=0; i<MOUSE_HEIGHT*MOUSE_WIDTH; i++, d+=Screen->bpp) 
	{
		if(memcmp(&mouseimg[d], mouseimg, Screen->bpp))
		{
			memcpy(&mousebuf[d], &mouseimg[d], Screen->bpp);
		}
	}	
	
	Screen->Image(MouseX, MouseY, MOUSE_WIDTH, MOUSE_HEIGHT, mousebuf, 0);	
}

void CMouse::Clear()
{
	Screen->Image(MouseX, MouseY, MOUSE_WIDTH, MOUSE_HEIGHT, mouseback, 0);	
}

void CheckMouseRegions(RECT &r1, RECT &r2)
{
	memset(updatelist, 0, sizeof(updatelist));

    if(r1.left < r2.left || r2.right < r1.left || r1.bottom < r2.top || r2.bottom < r1.top)
	{
		updatelist[0] = r1;
		updatelist[1] = r2;

		return;
	}

    RECT *next, current = r1;
	updatelist[0] = r2;

	next = &updatelist[1];
    if(current.left < r2.left)
    {
        next->left = current.left;
        next->right = r2.left;
        next->top = current.top;
        next->bottom = current.bottom;
		next->width = next->right - next->left+1;
		next->height = next->bottom - next->top+1;

        current.left = r2.left;
    }

	next = &updatelist[2];
    if(current.right > r2.right)
    {
        next->left = r2.right;
        next->right = current.right;
        next->top = current.top;
        next->bottom = current.bottom;
		next->width = next->right - next->left+1;
		next->height = next->bottom - next->top+1;

        current.right = r2.right;
    }

	next = &updatelist[3];
    if(current.top < r2.top)
    {
        next->left = current.left;
        next->right = current.right;
        next->top = current.top;
        next->bottom = r2.top;
		next->width = next->right - next->left+1;
		next->height = next->bottom - next->top+1;

        current.top = r2.top;
    }

	next = &updatelist[4];
    if(current.bottom > r2.bottom)
    {
        next->left = current.left;
        next->right = current.right;
        next->top = r2.bottom;
        next->bottom = current.bottom;
		next->width = next->right - next->left+1;
		next->height = next->bottom - next->top+1;

        current.bottom = r2.bottom;
    }
}

int CMouse::SetCursorPos(int x, int y)
{
	if(x == MouseX && y == MouseY && x < 0 && y < 0) return 0;

	if(x < 0) x = 0;
	if(y < 0) y = 0;	
	if(x > Screen->ScreenWidth-2) x = Screen->ScreenWidth-2;
	if(y > Screen->ScreenHeight-2) y = Screen->ScreenHeight-2;	
	
	if(x == MouseX && y == MouseY) return 0;

	MouseX = x;
	MouseY = y;	

/*	paint_mouse = 0;
	Screen->FlushRect(oldmousex, oldmousey, MOUSE_WIDTH, MOUSE_HEIGHT);		
	paint_mouse = 1;
	Screen->FlushRect(MouseX, MouseY, MOUSE_WIDTH, MOUSE_HEIGHT);*/
		
	RECT r1, r2;
	Mouse->Draw();
	FillRect(r1, oldmousex, oldmousey, MOUSE_WIDTH, MOUSE_HEIGHT);
	FillRect(r2, MouseX, MouseY, MOUSE_WIDTH, MOUSE_HEIGHT);
	paint_mouse = 0;
	CheckMouseRegions(r1, r2);
	Screen->FlushMouse(updatelist);
	paint_mouse = 1;
	Mouse->Clear();

	oldmousex = MouseX;
	oldmousey = MouseY;
	return 1;	
}

void CMouse::GetCursorPos(int &x, int &y)
{
	x = MouseX;
	y = MouseY;	
}

short CMouse::GetButtons()
{
	return MouseButtons;
}

void CMouse::CaptureMouse(void (*callback)(int, int, short))
{
	mouse_callback = callback;
}

void CMouse::ReleaseMouse()
{
	mouse_callback = 0;
}
