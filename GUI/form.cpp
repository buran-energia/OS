#include <stdlib.h>
#include <string.h>
#include "form.h"
#include "mouse.h"

int FrameX, FrameY, FrameWidth, FrameHeight;
BYTE *frametop, *frameleft, *frameright, *framebottom;
CForm *ActiveWindow;

CForm::CForm(int left, int top, int width, int height, char *caption, DWORD style, void (*wndproc)(MSG *msg)):
	   CControl(left, top, width, height)
{
	Children = new CWndList;
	Children->Handle = (DWORD) this;

	if(style&WS_NONRECT)
	{
		ChildLeft = 0;
		ChildTop = 0;
		ChildRight = 0;
		ChildBottom = 0;
	}
	else
	{
		ChildLeft = 4;
		ChildTop = 24;
		ChildRight = 4;
		ChildBottom = 4;
	}

	Children->SetPosition(left+ChildLeft, top+ChildTop);
	Children->SetSize(width-ChildLeft, height-ChildTop);

	moving = 0;
	this->style = style;
	this->color = 0xC8D0D4;
	this->wndproc = wndproc;
	this->visible = style&WS_VISIBLE;
	this->caption = caption;
	CloseButton = 0;
}

CForm::~CForm()
{
	delete Children;
}

void CForm::Add(CControl *ctrl)
{
	ctrl->wndproc = wndproc;
	Children->Add(ctrl);
}

void CForm::Delete(CControl *ctrl)
{
	ctrl->wndproc = NULL;
	Children->Delete(ctrl);
}

DWORD Alpha24(DWORD dst, DWORD src, BYTE alpha)
{
	BYTE r,g,b;
	r = Alpha(dst&0xFF, src&0xFF, alpha);
	g = Alpha(dst>>8, src>>8, alpha);
	b = Alpha(dst>>16, src>>16, alpha);
	return r<<16 | g<<8 | b;
}

void CForm::Paint()
{
	int x, y, x2, y2, ClipLeft, ClipTop, ClipRight, ClipBottom;	
	BYTE *buffer;

	Screen->GetClippingRect(ClipLeft, ClipTop, ClipRight, ClipBottom);

	if(style&WS_ALPHABLEND)
	{
		GetPosition(x, y);
		GetSize(x2, y2);
		x2++;
		y2++;

		if(x < ClipLeft)
		{
			x2 -= ClipLeft-x+1;
			x = ClipLeft;
		}

		if(x+x2-1 > ClipRight)
			x2 = ClipRight-x+1;	

		if(y < ClipTop)
		{
			y2 -= ClipTop-y+1;
			y = ClipTop;
		}

		if(y+y2-1 > ClipBottom)
			y2 = ClipBottom-y+1;

		buffer = new BYTE[x2*y2*3];

		Screen->Image(x,y,x2,y2,buffer,1);
	}

	if(!(style&WS_NONRECT))
	{
		// first rame	
		Screen->HLine(left, top, width-1, 0xC8D0D4);
		Screen->VLine(left, top, height-1, 0xC8D0D4);
		Screen->HLine(left, bottom, width, 0x404040);
		Screen->VLine(right, top, height-1, 0x404040);	
		// second frame
		Screen->HLine(left+1, top+1, width-2, 0xFFFFFF);
		Screen->VLine(left+1, top+1, height-2, 0xFFFFFF);	
		Screen->HLine(left+1, bottom-1, width-2, 0x808080);
		Screen->VLine(right-1, top+1, height-2, 0x808080);
		// draw whole window
		Screen->Rectangle(left+2, top+22, width-4, height-4-20, color, 1);	
		// draw title
		Screen->Rectangle(left+2, top+2, width-4, 20, 0x9FC3E9, 1);	
		Screen->TextOut(left+6, top+6, caption, 16, 0xFFFFFF);
	}
	
	SendMessage(wndproc, (DWORD) this, WM_PAINT, 0, 0);

	Screen->SetChildArea(left+ChildLeft, top+ChildTop);
	Children->PaintAll(ClipLeft, ClipTop, ClipRight-ClipLeft+1, ClipBottom-ClipTop+1);	
	Screen->SetChildArea(0, 0);

	if(style&WS_ALPHABLEND)
	{
		int i, ii;

		for(i=0; i<y2; i++)
			for(ii=0; ii<x2*3; ii++)
				Screen->buffer[((((y+i)*Screen->ScreenWidth)+x)*3+ii)] = Alpha(Screen->buffer[((((y+i)*Screen->ScreenWidth)+x)*3+ii)], buffer[(i*x2*3+ii)], 150);

		free(buffer);
	}
}

void CForm::SetWindowPos(int left, int top)
{
	int oldleft, oldtop;
	RECT r1, r2;
	
	oldleft = this->left;
	oldtop = this->top;
	
	CControl::SetPosition(left, top);
	Children->SetPosition(left+ChildLeft, top+ChildTop);

	if(!visible) 
		return;

	FillRect(r1, oldleft, oldtop, width, height);
	FillRect(r2, left, top, width, height);

//	if((style & WS_ALPHABLEND) || (style & WS_NONRECT) || (oldleft < 0 || oldtop < 0 || oldleft+width > Screen->ScreenWidth || oldtop+height > Screen->ScreenHeight))
	{
		Screen->RepaintRects(CheckRegions(r1, r2, 1));
	}
/*	else
	{
		BYTE *buffer = new BYTE[width*height*Screen->bpp];
		Screen->Image(oldleft, oldtop, width, height, buffer, 1);
		Screen->RepaintRects(CheckRegions(r1, r2, 0));
		Screen->Image(left, top, width, height, buffer, 0);
		free(buffer);
		Screen->FlushRect(left, top, width, height);
	}*/
}

void CForm::SetWindowSize(int width, int height)
{
	if(mask) return;

	int oldwidth, oldheight;
	
	oldwidth = this->width;
	oldheight = this->height;
	
	SetSize(width, height);
	Children->SetSize(width-ChildLeft-ChildRight, height-ChildTop-ChildBottom);

	if(!visible) 
		return;
	
	if(oldwidth > width) 
		width = oldwidth;
	if(oldheight > height) 
		height = oldheight;	
	Screen->RepaintRect(left, top, width, height, 1);
}

void SaveFrame(int restore)
{
	Screen->Image(FrameX, FrameY, FrameWidth, 1, frametop, restore);
	Screen->Image(FrameX, FrameY+FrameHeight-1, FrameWidth, 1, framebottom, restore);	
	Screen->Image(FrameX, FrameY, 1, FrameHeight, frameleft, restore);	
	Screen->Image(FrameX+FrameWidth-1, FrameY, 1, FrameHeight, frameright, restore);			
}

void FlushFrame()
{
	Screen->FlushRect(FrameX, FrameY, FrameWidth, 1);	
	Screen->FlushRect(FrameX, FrameY+FrameHeight-1, FrameWidth, 1);	
	Screen->FlushRect(FrameX, FrameY, 1, FrameHeight);	
	Screen->FlushRect(FrameX+FrameWidth-1, FrameY, 1, FrameHeight);			
}

void DrawFrame()
{
	Screen->HLine(FrameX, FrameY, FrameWidth, 0xFFFF00);	
	Screen->VLine(FrameX, FrameY, FrameHeight, 0xFFFF00);
	Screen->HLine(FrameX, FrameY+FrameHeight-1, FrameWidth, 0xFFFF00);
	Screen->VLine(FrameX+FrameWidth-1, FrameY, FrameHeight-1, 0xFFFF00);
}

void DisplayFrame(int x, int y, short MouseButtons)
{
	if(!Mouse->MouseButtons&1)
	{
		SaveFrame(0);
		ActiveWindow->SetWindowPos(FrameX, FrameY);
		ActiveWindow->MouseUp(0, 0);
		free(frameleft);
		free(frameright);
		free(frametop);
		free(framebottom);
		mouse_callback = NULL;		
		return;
	}

	busy = 1;
//	Mouse->SetCursorPos(Mouse->MouseX+x, Mouse->MouseY+y);
	
	/*SaveFrame(0);
	FlushFrame();*/
	if(Mouse->MouseX && Mouse->MouseX < Screen->ScreenWidth-2)
	FrameX += x;
	if(Mouse->MouseY && Mouse->MouseY < Screen->ScreenHeight-2)
	FrameY += y;	
	/*SaveFrame(1);
	DrawFrame();
	FlushFrame();*/
	ActiveWindow->SetWindowPos(FrameX, FrameY);
	
	busy = 0;
}

void CForm::MouseDown(int x, int y)
{
	Screen->SetOnTop(this);		
	if(!Children->MouseDown(x-left-ChildLeft, y-top-ChildTop))
		CControl::MouseDown(x-left, y-top);	
}

void CForm::MouseUp(int x, int y)
{
	if(!Children->MouseUp(x-left-ChildLeft, y-top-ChildTop))
		CControl::MouseUp(x-left, y-top);
}

void CForm::MouseMove(int x, int y)
{
	if(!Children->MouseMove(x-left-ChildLeft, y-top-ChildTop))
		CControl::MouseMove(x-left, y-top);
	
	if(!(style&WS_NONRECT) && !Children->FocusedObject && mousedown && x >= left+4 && x <= right-4 && y >= top+4 && y <= top+4+18) 
	{
		StartMoving();
	}
}

void CForm::MouseLeave()
{
	if(Children->ActiveObject)
	{
		Children->ActiveObject->MouseLeave();
		Children->ActiveObject = NULL;
	}
}

void CForm::KeyDown(int key)
{
	CControl::KeyDown(key);
	Children->KeyDown(key);
}

void CForm::SetColor(DWORD color)
{
	this->color = color;
}

void CForm::ShowWindow()
{
	style |= WS_VISIBLE;
	Show();
}

void CForm::HideWindow()
{
	style &= 0xFFFFFFFE;
	Hide();
}

void CForm::SetCaption(char *caption)
{
	this->caption = caption;
	Repaint();
}

void CForm::StartMoving()
{
		FrameX = left;
		FrameY = top;
		FrameWidth = width;
		FrameHeight = height;
/*		frameleft = new BYTE[height*Screen->bpp];
		frameright = new BYTE[height*Screen->bpp];		
		frametop = new BYTE[width*Screen->bpp];				
		framebottom = new BYTE[width*Screen->bpp];						
		SaveFrame(1); */
		mouse_callback = DisplayFrame;
		ActiveWindow = this;
	//	DisplayFrame(0, 0, 1);
}

void CForm::SetChildArea(int left, int top, int right, int bottom)
{
	if(style&WS_NONRECT)
	{
		ChildLeft = left;
		ChildTop = top;
		ChildRight = right;
		ChildBottom = bottom;

		Children->SetPosition(left+ChildLeft, top+ChildTop);
		Children->SetSize(width-ChildLeft-ChildRight, height-ChildTop-ChildBottom);
	}
}
