#include <stdlib.h>
#include "control.h"

CControl::CControl(int left, int top, int width, int height)
{
	this->left = left;
	this->top = top;
	this->width = width;
	this->height = height;
	right = left+width-1;
	bottom = top+height-1;
	active = 0;
	mousedown = 0;
	wndproc = 0;
	visible = 1;
	Parent = 0;
	mask = 0;
}

CControl::~CControl()
{
	if(mask)
	{
		free(mask);
	}
}

void CControl::GetPosition(int &left, int &top)
{
	left = this->left;
	top = this->top;
}

void CControl::SetPosition(int left, int top)
{
	this->left = left;
	this->top = top;
	right = left+width-1;
	bottom = top+height-1;	
}

void CControl::GetSize(int &width, int &height)
{
	width = this->width;
	height = this->height;
}

void CControl::SetSize(int width, int height)
{
	if(mask) return;

	this->width = width;
	this->height = height;
	right = left+width-1;
	bottom = top+height-1;	
}

void CControl::Paint()
{

}

void CControl::MouseDown(int x, int y)
{
	mousedown = 1;

	SendMessage(wndproc, (DWORD) this, WM_MOUSEDOWN, 0, (x<<16) | y);
}

void CControl::MouseUp(int x, int y)
{
	mousedown = 0;

	SendMessage(wndproc, (DWORD) this, WM_MOUSEUP, 0, (x<<16) | y);
}

void CControl::MouseMove(int x, int y)
{
	SendMessage(wndproc, (DWORD) this, WM_MOUSEMOVE, 0, (x<<16) | y);
}

void CControl::MouseEnter()
{
	active = 1;

	SendMessage(wndproc, (DWORD) this, WM_MOUSEENTER, 0, 0);
}

void CControl::MouseLeave()
{
	active = 0;

	SendMessage(wndproc, (DWORD) this, WM_MOUSELEAVE, 0, 0);
}

void CControl::MouseClick()
{
	SendMessage(wndproc, (DWORD) this, WM_CLICK, 0, 0);
}

void CControl::Repaint()
{
	if(!Parent || !visible) return;

	int x, y;

	Parent->GetPosition(x, y);
	Screen->RepaintRect(x+left, y+top, width, height, 1);
}

void CControl::Show()
{
	if(visible) return;

	visible = 1;

	Parent->SetOnTop(this);
	Repaint();
}

void CControl::Hide()
{
	if(!visible) return;

	visible = 0;

	int x, y;

	Parent->GetPosition(x, y);
	Screen->RepaintRect(x+left, y+top, width, height, 1);
}

void CControl::KeyDown(int key)
{
	SendMessage(wndproc, (DWORD) this, WM_KEYDOWN, 0, key);
}

void CControl::SetMask(BYTE *mask)
{
	if(this->mask)
	{
		free(this->mask);
	}

	this->mask = mask;
}

void CControl::ClearMask()
{
	if(mask)
	{
		free(mask);
		mask = 0;
	}
}

BYTE *CControl::GetMask()
{
	return mask;
}
