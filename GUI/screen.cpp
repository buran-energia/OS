#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <dos.h>
#include <conio.h>
#include <unistd.h>
#include <sys/nearptr.h>
#include "gui.h"
#include "test.h"
#include <ft2build.h>
#include FT_FREETYPE_H
#include "math.h"

#define sgn(x) ((x<0)?-1:((x>0)?1:0)) 

CScreen *Screen;
BYTE *vmem;
int busy = 0;
void (*mouse_callback)(int, int, short) = NULL;
FT_Library library;	
FT_Face face;

void debug(char *msg)
{
	FILE *fp;
	
	fp = fopen("debug.txt", "a+");
	fwrite(msg, strlen(msg), 1, fp);
	fclose(fp);
}

void panic(char *err)
{
	union REGS r;
	
	r.x.ax = 3;
	int86(0x10, &r, &r);	
	
	printf("PANIC: %s\n", err);
	getch();
	exit(1);	
}

BYTE Alpha(BYTE r, BYTE src, BYTE alpha)
{
	return ((alpha*(r+64-src))>>8)+src-(alpha>>2);
}

CScreen::CScreen(int mode)
{
	SetVESAMode(mode, 0);

	if(__djgpp_nearptr_enable() == -1) exit(1);
	vmem = (BYTE *) (0xA0000 + __djgpp_conventional_base);

	ScreenWidth = modeinfo.XResolution;
	ScreenHeight = modeinfo.YResolution;
	bpp = modeinfo.BitsPerPixel>>3;

	SetClippingRect(0, 0, ScreenWidth, ScreenHeight);

	buffer = new BYTE[ScreenWidth*ScreenHeight*bpp];
	background = new BYTE[ScreenWidth*ScreenHeight*bpp];

	if(!buffer || !background)
		panic("cannot alloc mem for buffers");
	
	memset(buffer, 0, ScreenWidth*ScreenHeight*bpp);
	memset(background, 0, ScreenWidth*ScreenHeight*bpp);

	if(FT_Init_FreeType(&library)) panic("ini_freetype_lib");
	if(FT_New_Face(library, "SSERIFE.FON", 0, &face)) panic("new_face");

	Windows = new CWndList;
	Windows->Handle = (DWORD) this;
	Windows->SetPosition(0, 0);

	SetChildArea(0, 0);
}

CScreen::~CScreen()
{
	free(buffer);
	free(background);
	delete Windows;
}

void CScreen::SetClippingRect(int left, int top, int width, int height)
{
	if(left < 0)
		ClipLeft = 0;
	else
		ClipLeft = left;

	if(top < 0)
		ClipTop = 0;
	else
		ClipTop = top;

	if(left+width-1 > ScreenWidth-1)
		ClipRight = ScreenWidth-1;
	else
		ClipRight = left+width-1;

	if(top+height-1 > ScreenHeight-1)
		ClipBottom = ScreenHeight-1;
	else
		ClipBottom = top+height-1;
}

void CScreen::GetClippingRect(int &left, int &top, int &right, int &bottom)
{
	left = ClipLeft;
	top = ClipTop;
	right = ClipRight;
	bottom = ClipBottom;
}

void CScreen::Pixel(int x, int y, DWORD color)
{
	x += ChildLeft;
	y += ChildTop;

	if(x < ClipLeft || x > ClipRight || y < ClipTop || y > ClipBottom) return;

	asm("cli");
	switch(bpp)
	{
		case 3:
				asm volatile("movl %1, %%edi\n"
				             "imul %2, %%edi\n"
				             "addl %3, %%edi\n"
				             "imul $3, %%edi\n"
				             "addl %0, %%edi\n"
				             "movl %4, %%eax\n"
				             "movw %%ax, (%%edi)\n"
				             "shr $8, %%eax\n"
				             "movb %%ah, 2(%%edi)"
				             :: "m"(buffer), "m"(y), "m"(ScreenWidth), "m"(x), "m"(color));
				break;
		case 4:
				asm volatile("movl %1, %%edi\n"
				             "imul %2, %%edi\n"
				             "addl %3, %%edi\n"
				             "shl  $2, %%edi\n"
				             "addl %0, %%edi\n"
				             "movl %4, %%eax\n"
				             "movl %%eax, (%%edi)"
				             :: "m"(buffer), "m"(y), "m"(ScreenWidth), "m"(x), "m"(color));
				break;
	}
	asm("sti");
}

void CScreen::HLine(int x, int y, int width, DWORD color)
{
	x += ChildLeft;
	y += ChildTop;

	if(x > ClipRight || x+width-1 < ClipLeft || y < ClipTop || y > ClipBottom) return;

	if(x < ClipLeft)
	{
		width -= ClipLeft-x;
		x = ClipLeft;
	}

	if(x+width-1 > ClipRight)
		width = ClipRight-x+1;

//	for(int i=0; i<width; i++)
//		Pixel(x+i, y, color);

	if(width < 1) return;

	asm("cli");
	switch(bpp)
	{
		case 3:
				asm volatile("movl %1, %%edi\n"
				             "imul %2, %%edi\n"
				             "addl %3, %%edi\n"
				             "imul $3, %%edi\n"
				             "addl %0, %%edi\n"
				             "movl %4, %%eax\n"
				             "movl %%eax, %%edx\n"
				             "shrl $8, %%edx\n"
				             "movl %5, %%ecx\n"
				             "1:movw %%ax, (%%edi)\n"
				             "movb %%dh, 2(%%edi)\n"
				             "addl $3, %%edi\n"
				             "loop 1b\n"	
				             :: "m"(buffer), "m"(y), "m"(ScreenWidth), "m"(x), "m"(color), "m"(width));
				break;
		case 4:
				asm volatile("movl %1, %%edi\n"
				             "imul %2, %%edi\n"
				             "addl %3, %%edi\n"
				             "shl  $2, %%edi\n"
				             "addl %0, %%edi\n"
				             "movl %4, %%eax\n"
				             "movl %5, %%ecx\n"
				             "1:movl %%eax, (%%edi)\n"
				             "addl $4, %%edi\n"
				             "loop 1b\n"	
				             :: "m"(buffer), "m"(y), "m"(ScreenWidth), "m"(x), "m"(color), "m"(width));
				break;
	}
	asm("sti"); 
}

void CScreen::VLine(int x, int y, int height, DWORD color)
{
	x += ChildLeft;
	y += ChildTop;

	if(y > ClipBottom || y+height-1 < ClipTop || x < ClipLeft || x > ClipRight) return;

	if(y < ClipTop)
	{
		height -= ClipTop-y;
		y = ClipTop;
	}

	if(y+height-1 > ClipBottom)
		height = ClipBottom-y+1;

/*	for(int i=0; i<height; i++)
		Pixel(x, y+i, color); */

	if(height < 1) return;

	asm("cli");
	switch(bpp)
	{
		case 3:
				asm volatile("movl %1, %%edi\n"
				             "movl %2, %%ebx\n"
				             "imul %%ebx, %%edi\n"
				             "addl %3, %%edi\n"
				             "imul $3, %%edi\n"
				             "addl %0, %%edi\n"
				             "movl %4, %%eax\n"
				             "movl %%eax, %%edx\n"
				             "shrl $8, %%edx\n"
				             "movl %5, %%ecx\n"
				             "imul $3, %%ebx\n"
				             "1:movw %%ax, (%%edi)\n"
				             "movb %%dh, 2(%%edi)\n"
				             "addl %%ebx, %%edi\n"
				             "loop 1b\n"			
				             :: "m"(buffer), "m"(y), "m"(ScreenWidth), "m"(x), "m"(color), "m"(height));
				break;
		case 4:
				asm volatile("movl %1, %%edi\n"
				             "movl %2, %%ebx\n"
				             "imul %%ebx, %%edi\n"
				             "addl %3, %%edi\n"
				             "shl  $2, %%edi\n"
				             "addl %0, %%edi\n"
				             "movl %4, %%eax\n"
				             "movl %5, %%ecx\n"
				             "shl  $2, %%ebx\n"
				             "1:movl %%eax, (%%edi)\n"
				             "addl %%ebx, %%edi\n"
				             "loop 1b\n"			
				             :: "m"(buffer), "m"(y), "m"(ScreenWidth), "m"(x), "m"(color), "m"(height));
				break;
	}
	asm("sti");
}

// Bresenham's line drawing algorithm
void CScreen::Line(int x1, int y1, int x2, int y2, DWORD color)
{
	int i, dx, dy, sdx, sdy, dxabs, dyabs, x, y, px, py;

	dx = x2-x1;
	dy = y2-y1;
	dxabs = abs(dx);
	dyabs = abs(dy);
	sdx = sgn(dx);
	sdy = sgn(dy);
	x = dyabs>>1;
	y = dxabs>>1;
	px = x1;
	py = y1;

	Screen->Pixel(px, py, color);

	if(dxabs >= dyabs) 
	{
	    for(i=0; i<dxabs; i++) 
		{
      		y += dyabs;

      		if(y >= dxabs) 
			{
        		y -= dxabs;
        		py += sdy;
      		}
      		
      		px += sdx;
      		Screen->Pixel(px, py, color);
    	}
  	} 
	else 
	{
    	for(i=0; i<dyabs; i++) 
		{
    	    x += dxabs;
      	  
    	    if(x >= dyabs) 
			{
                x -= dyabs;
        		px += sdx;
      	   	}
      	   
      		py += sdy;
      		Screen->Pixel(px, py, color);
    	}
  	}	
}

void CScreen::Rectangle(int left, int top, int width, int height, DWORD color, int fill)
{
	if(ChildLeft+left > ClipRight || ChildTop+top > ClipBottom || ChildLeft+left+width-1 < ClipLeft || ChildTop+top+height-1 < ClipTop) return;

	if(fill)
	{
		height += top;

		for(int i=top; i<height; i++)
		HLine(left, i, width, color);
	} 
	else 
	{
		HLine(left, top, width, color);
		VLine(left, top, height, color);
		HLine(left, top+height-1, width, color);
		VLine(left+width-1, top, height, color);
	}	
}

void CScreen::Circle(int left, int top, int radius, DWORD color, int fill)
{
	if(ChildLeft+left > ClipRight || top > ClipBottom || ChildLeft+left+(radius<<1)-1 < ClipLeft || ChildTop+top+(radius<<1)-1 < ClipTop) return;

	float n = 0;
	float r = 1/(float) radius;
	int dx = 0;
	int dy = radius-1;

	left += radius-1;
	top += radius-1;
	while (dx <= dy)
	{
		if(fill)
		{
			HLine(left-dx, top+dy-1, dx<<1, color);
			HLine(left-dx, top-dy+1, dx<<1, color);
			HLine(left-dy, top+dx, dy<<1, color);
			HLine(left-dy, top-dx, dy<<1, color);
		}
		else
		{
			Pixel(left-dx, top-dy, color); // top-left
			Pixel(left-dy, top-dx, color);
			Pixel(left+dx, top-dy, color); // top-right
			Pixel(left+dy, top-dx, color);
			Pixel(left-dx, top+dy, color); // bottom-left
			Pixel(left-dy, top+dx, color);
			Pixel(left+dx, top+dy, color); // bottom-right
			Pixel(left+dy, top+dx, color);
		}

		dx++;
		n += r;
		dy = (int) ((float) radius*sin(acos(n)));
	}
}

void CScreen::RoundRect(int left, int top, int width, int height, int radius, DWORD color, int fill)
{
	if(ChildLeft+left > ClipRight || ChildTop+top > ClipBottom || ChildLeft+left+width-1 < ClipLeft || ChildTop+top+height-1 < ClipTop) return;

	float n = 0;
	float r = 1/(float) radius;
	int dx = 0;
	int dy = radius-1;

	int x = left+radius-1;
	int y = top+radius-1;
	int right = left+width-radius;
	int bottom = top+height-radius;
	int d = width-(radius<<1)+2;

	while (dx <= dy)
	{
		if(fill)
		{
			HLine(x-dx, bottom+dy, d+(dx<<1), color);
			HLine(x-dx, y-dy, d+(dx<<1), color);
			HLine(x-dy, bottom+dx, d+(dy<<1), color);
			HLine(x-dy, y-dx, d+(dy<<1), color);
		}
		else
		{
			Pixel(x-dx, y-dy, color); // top-left
			Pixel(x-dy, y-dx, color);
			Pixel(right+dx, y-dy, color); // top-right
			Pixel(right+dy, y-dx, color);
			Pixel(x-dx, bottom+dy, color); // bottom-left
			Pixel(x-dy, bottom+dx, color);
			Pixel(right+dx, bottom+dy, color); // bottom-right
			Pixel(right+dy, bottom+dx, color);
		}

		dx++;
		n += r;
		dy = (int) ((float) radius*sin(acos(n)));
	}

	if(fill)
		Rectangle(left, top+radius, width, height-(radius<<1)+1, color, 1);
	else
	{
		VLine(left, top+radius, height-(radius<<1)+1, color);
		VLine(left+width-1, top+radius, height-(radius<<1)+1, color);
	}

	HLine(left+radius, top, width-(radius<<1)+1, color);
	HLine(left+radius, top+height-1, width-(radius<<1)+1, color);
}

void CScreen::Image(int left, int top, int width, int height, BYTE *image, int get)
{
	left += ChildLeft;
	top += ChildTop;

	if(left > ClipRight || top > ClipBottom || left+width-1 < ClipLeft || top+height-1 < ClipTop) return;

	DWORD imgstart = 0;
	DWORD imgwidth = width;

	if(left < ClipLeft)
	{
		width -= ClipLeft-left;
		imgstart = abs(ClipLeft-left);
		left = ClipLeft;
	}

	if(left+width-1 > ClipRight)
		width = ClipRight-left+1;	

	if(top < ClipTop)
	{
		height -= ClipTop-top;
		imgstart += abs(ClipTop-top)*imgwidth;
		top = ClipTop;
	}

	if(top+height-1 > ClipBottom)
		height = ClipBottom-top+1;

	DWORD pos = (top*ScreenWidth+left)*bpp;
	DWORD imgd = width*bpp;
	DWORD d = ScreenWidth*bpp;

	height += top;
	imgstart *= bpp;
	imgwidth *= bpp;

	asm("cli");
	if(get)
	{
		for(; top<height; top++, pos+=d, imgstart+=imgwidth)
			memcpy(&image[imgstart], &buffer[pos], imgd);
	}
	else
	{
		for(; top<height; top++, pos+=d, imgstart+=imgwidth)
			memcpy(&buffer[pos], &image[imgstart], imgd);
	}
	asm("sti");
}

void CScreen::Bitmap(int left, int top, BITMAP *bmp, int transparent)
{
	if(!transparent)
		Image(left, top, bmp->biWidth, bmp->biHeight, bmp->data, 0);
	else
	{
		left += ChildLeft;
		top += ChildTop;

		int width = bmp->biWidth;
		int height = bmp->biHeight;

		if(left > ClipRight || top > ClipBottom || left+width-1 < ClipLeft || top+height-1 < ClipTop) return;

		DWORD imgstart = 0;
		DWORD imgwidth = width;
		
		if(left < ClipLeft)
		{
			width -= ClipLeft-left;
			imgstart = abs(ClipLeft-left);
			left = ClipLeft;
		}

		if(left+width-1 > ClipRight)
			width = ClipRight-left+1;	

		if(top < ClipTop)
		{
			height -= ClipTop-top;
			imgstart += abs(ClipTop-top)*imgwidth;
			top = ClipTop;
		}

		if(top+height-1 > ClipBottom)
			height = ClipBottom-top+1;

		DWORD pos = (top*ScreenWidth+left)*bpp;
		DWORD imgd = width*bpp;
		DWORD d = ScreenWidth*bpp;

		height += top;
		imgstart *= bpp;
		imgwidth *= bpp;
		width *= bpp;

		asm("cli");
		for(; top<height; top++, pos+=d, imgstart+=imgwidth)
		{
			for(int i=0; i<width; i+=bpp)
			{
				if(memcmp(&bmp->data[imgstart+i], bmp->data, Screen->bpp))
				{
					memcpy(&buffer[pos+i], &bmp->data[imgstart+i], Screen->bpp);
				}
			}	
		}
		asm("sti");
	}
}

void CScreen::TextOut(int left, int top, char *text, int size, DWORD color)
{
//	left += ChildLeft;
//	top += ChildTop;

	if(!text) return;

	FT_GlyphSlot slot;
	FT_UInt glyph_index;
	int curx = left;
	
	if(FT_Set_Char_Size(face, 0, size<<6, 0, 0)) return;
	if(FT_Set_Pixel_Sizes(face, 0, size)) return;

	slot = face->glyph;

	top += size-4;

	int x, y, b, d;
    for(int n=0; n<strlen(text); n++) 
	{
		
		if(text[n] == '\n')
		{
			top += size-2;
			curx = left;
			continue;
		}
		
	    if(!(glyph_index = FT_Get_Char_Index(face, text[n]))) continue;
         
        FT_Load_Glyph(face, glyph_index, FT_LOAD_DEFAULT);
        FT_Render_Glyph(face->glyph, ft_render_mode_mono);

		if(slot->bitmap.width % 8)
			d = 1;
		else
			d = 0;
				
    	for(y=0; y<slot->bitmap.rows; y++)
    	{
   			for(x=0; x<(slot->bitmap.width>>3)+d; x++) 
    		{
				for(b=7; b>=0; b--) 
				{
					if((slot->bitmap.buffer[y*((slot->bitmap.width>>3)+d)+x]>>b)&1)
						Pixel(curx+(x<<3)+(7-b), top+y-slot->bitmap_top, color);
				}
   			}			
		}
   		
   		curx += (slot->advance.x>>6);
	}
}

void CScreen::FlushRect(int left, int top, int width, int height)
{
	if(left > ClipRight || top > ClipBottom || left+width-1 < ClipLeft || top+height-1 < ClipTop) return;

	if(left < ClipLeft)
	{
		width -= ClipLeft-left;
		left = ClipLeft;
	}

	if(left+width-1 > ClipRight)
		width = ClipRight-left+1;	

	if(top < ClipTop)
	{
		height -= ClipTop-top;
		top = ClipTop;
	}

	if(top+height-1 > ClipBottom)
		height = ClipBottom-top+1;

	RECT r1, r2;

	FillRect(r1, left, top, width, height);
	FillRect(r2, Mouse->MouseX, Mouse->MouseY, MOUSE_WIDTH, MOUSE_HEIGHT);
	int mouse_within = Collision(r1, r2);

	if(Mouse->paint_mouse && mouse_within)	
	{
		busy = 1; // fixes a drawing bug
		Mouse->Draw();
	}
		
	PutImage(left, top, width, height, buffer);

	if(Mouse->paint_mouse && mouse_within)	
	{
		Mouse->Clear();
		busy = 0;
	}	
}

void CScreen::FlushRects(UpdateList *list)
{
	UpdateList *tmp;

	while(list)
	{
		if(show)
		{
			sleep(1);
			Rectangle(list->r.left, list->r.top, list->r.width, list->r.height, 0xFFFFFF, 1);
			Rectangle(list->r.left, list->r.top, list->r.width, list->r.height, 0, 0);
		}

		FlushRect(list->r.left, list->r.top, list->r.width, list->r.height);

		tmp = list;
		list = list->next;
		free(tmp);
	}
}

void CScreen::FlushMouse(RECT *list)
{
	for(int i=0; i<5; i++)
	{
		if(list[i].left || list[i].top || list[i].width || list[i].height)
		{
			FlushRect(list[i].left, list[i].top, list[i].width, list[i].height);
		}
	}
}

void CScreen::RestoreBackground(int left, int top, int width, int height)
{
	if(left > ClipRight || top > ClipBottom || left+width-1 < ClipLeft || top+height-1 < ClipTop) return;

	if(left < ClipLeft)
	{
		width -= ClipLeft-left;
		left = ClipLeft;
	}

	if(left+width-1 > ClipRight)
		width = ClipRight-left+1;	

	if(top < ClipTop)
	{
		height -= ClipTop-top;
		top = ClipTop;
	}

	if(top+height-1 > ClipBottom)
		height = ClipBottom-top+1;

	DWORD pos = (top*ScreenWidth+left)*bpp;
	DWORD d = width*bpp;
	DWORD dscr = ScreenWidth*bpp;

	for(; height>0; height--, pos+=dscr)
	memcpy(&buffer[pos], &background[pos], d);
}

void CScreen::RepaintRect(int left, int top, int width, int height, int flush)
{
	RestoreBackground(left, top, width, height);
	SetClippingRect(left, top, width, height);
	Windows->PaintAll(left, top, width, height);
	SetClippingRect(0, 0, ScreenWidth-1, ScreenHeight-1);
	if(flush)
		FlushRect(left, top, width, height);
}

void CScreen::RepaintRects(UpdateList *list)
{
	UpdateList *tmp;

	busy = 1;
	tmp = list;
	while(tmp)
	{
		RepaintRect(tmp->r.left, tmp->r.top, tmp->r.width, tmp->r.height, 0);

		tmp = tmp->next;
	}

	FlushRects(list);

	busy = 0;
}

void CScreen::AddWindow(CForm *wnd)
{
	Windows->Add(wnd);
}

void CScreen::DeleteWindow(CForm *wnd)
{
	Windows->Delete(wnd);
}

void CScreen::SetOnTop(CForm *wnd)
{
	UpdateList *list;
	int left, top, width, height;

	wnd->GetPosition(left, top);
	wnd->GetSize(width, height);
	
	Screen->SetClippingRect(left, top, width, height);
	
	list = Windows->GetUpdateList(wnd);
	if(Windows->SetOnTop(wnd)) 
	{
//		Screen->RepaintRect(left, top, width, height, 1);
		if(list)
			RepaintRects(list);
	} 

	Screen->SetClippingRect(0, 0, Screen->ScreenWidth-1, Screen->ScreenHeight-1);
}

void CScreen::MouseDown(int x, int y)
{
	Windows->MouseDown(x, y);
}

void CScreen::MouseUp(int x, int y)
{
	Windows->MouseUp(x, y);
}

void CScreen::MouseMove(int x, int y)
{
	Windows->MouseMove(x, y);
}

void CScreen::KeyDown(int key)
{
	Windows->KeyDown(key);
}

void CScreen::SetChildArea(int left, int top)
{
	ChildLeft = left;
	ChildTop = top;
}

int CScreen::TextWidth(char *text, int size, int width)
{
	FT_UInt glyph_index;
	int maxx = 0;
	int curx = 0;
	
	if(!text) return 0;
	if(FT_Set_Char_Size(face, 0, size<<6, 0, 0)) return 0;
	if(FT_Set_Pixel_Sizes(face, 0, size)) return 0;

	if(width > strlen(text))
		width = strlen(text);

    for(int n=0; n<width; n++) 
	{
		if(text[n] == '\n')
		{
			if(curx > maxx)
				maxx = curx;
			curx = 0;
			continue;
		}
		
        if(!(glyph_index = FT_Get_Char_Index(face, text[n]))) continue;
         
        FT_Load_Glyph(face, glyph_index, FT_LOAD_DEFAULT);

   		curx += face->glyph->bitmap.width;
	}

	if(!maxx) maxx = curx;
	return maxx;
}

int CScreen::TextHeight(char *text, int size)
{
	if(!text) return 0;

	int cury = size;

    for(int n=0; n<strlen(text); n++) 
	{
			if(text[n] == '\n')
				cury += size-2;
	}

	return cury;
}

CForm *CreateWindow(int left, int top, int width, int height, char *caption, DWORD style, void (*wndproc)(MSG *msg))
{
	CForm *handle;

	handle = new CForm(left, top, width, height, caption, style, wndproc);
	Screen->AddWindow(handle);

	if(!(style&WS_NONRECT) && (style&WS_CLOSEBUTTON))
	{
		CButton *CloseButton = new CButton(width-25, -20, 18, 16, 0, BS_BITMAP | BS_CENTER);
	
		BITMAP closebmp;
		if(!LoadBitmap("close.bmp", &closebmp)) panic("error loading close.bmp");
		CloseButton->SetBitmap(&closebmp);
		free(closebmp.data);
	
		handle->Add(CloseButton);
		handle->CloseButton = CloseButton;
	}

	return handle;
}

void DestroyWindow(CForm *handle)
{
	delete handle;
	Screen->DeleteWindow(handle);
}
