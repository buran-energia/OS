#include <string.h>
#include "label.h"

CLabel::CLabel(int left, int top, int width, int height, char *caption, int size):
		CWidget(left, top, width, height)
{
	this->size = size;
	color = 0;

	this->caption = caption;
	CControl::SetSize(Screen->TextWidth(caption, size, strlen(caption)),
			  Screen->TextHeight(caption, size));
}

CLabel::~CLabel()
{
	
}

void CLabel::Paint()
{
	Screen->TextOut(left, top, caption, size, color);

	SendMessage(wndproc, (DWORD) this, WM_PAINT, 0, 0);
}

void CLabel::MouseDown(int x, int y)
{
	CControl::MouseDown(x, y);
}

void CLabel::MouseUp(int x, int y)
{
	CControl::MouseUp(x, y);
}

void CLabel::MouseMove(int x, int y)
{
	CControl::MouseMove(x, y);
}

void CLabel::MouseEnter()
{
	CControl::MouseEnter();
}

void CLabel::MouseLeave()
{
	CControl::MouseLeave();
}

void CLabel::SetText(char *caption)
{
	this->caption = caption;
	CWidget::SetSize(Screen->TextWidth(caption, size, strlen(caption)),
					 Screen->TextHeight(caption, size));
	Repaint();
}

void CLabel::SetFontSize(int size)
{
	if(this->size == size) return;

	this->size = size;

	if(caption.StrLen() > 0)
		Repaint();
}

void CLabel::SetColor(DWORD color)
{
	if(this->color == color) return;

	this->color = color;

	if(caption.StrLen() > 0)
		Repaint();
}
