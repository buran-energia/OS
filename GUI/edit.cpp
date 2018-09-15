#include <string.h>
#include <ctype.h>
#include "edit.h"

CEdit::CEdit(int left, int top, int width, int height, DWORD style):
	   CWidget(left, top, width, height)
{
	pos = 0;
	offset = 0;
	this->style = style;
}

CEdit::~CEdit()
{
	
}

void CEdit::Paint()
{
	int ClipLeft, ClipTop, ClipRight, ClipBottom;
	int textwidth=0;

	while((textwidth = Screen->TextWidth(caption+offset, 16, pos-offset)) > width-4)
		offset++;

	Screen->Rectangle(left, top, width, height, RGB(100, 177, 255), 0);
	if(!(style&ES_TRANSPARENT))
		Screen->Rectangle(left+1, top+1, width-2, height-2, RGB(255, 255, 255), 1);

	Screen->GetClippingRect(ClipLeft, ClipTop, ClipRight, ClipBottom);

	int pleft, ptop;
	int x = ClipRight-ClipLeft+1;
	Parent->GetPosition(pleft, ptop);
	if(ClipRight > pleft+this->left+width-2)
		x = (pleft+this->left+width-2)-ClipLeft+1;

	Screen->SetClippingRect(ClipLeft, ClipTop, x, ClipBottom-ClipTop+1);
	
	Screen->TextOut(left+2, top+2, caption+offset, 16, 0);
	Screen->SetClippingRect(ClipLeft, ClipTop, ClipRight-ClipLeft+1, ClipBottom-ClipTop+1);

	Screen->VLine(left+textwidth+2, top+2, height-4, 0);

	SendMessage(wndproc, (DWORD) this, WM_PAINT, 0, 0);
}

void CEdit::MouseDown(int x, int y)
{
	CControl::MouseDown(x, y);

	if(caption && x > 0 && x < width && y > 2 && y < height-4)
	{
		int i = offset;
		int curx = 0;

		while(i <= caption.StrLen() && curx < width-4)
		{
			int charwidth = Screen->TextWidth(&caption[i], 16, 1);

			curx += charwidth;

			if(curx > x)
			{
				if(curx-(charwidth>>1) < x)
					i++;

				break;
			}

			i++;
		}

		pos = i;

		if(offset && pos == offset)
			offset--;

		Repaint();
	}
}

void CEdit::MouseUp(int x, int y)
{
	CControl::MouseUp(x, y);
}

void CEdit::MouseMove(int x, int y)
{
	CControl::MouseMove(x, y);
}

void CEdit::MouseEnter()
{
	CControl::MouseEnter();
}

void CEdit::MouseLeave()
{
	CControl::MouseLeave();
}

void CEdit::KeyDown(int key)
{
	CControl::KeyDown(key);

	switch(key)
	{
		case K_BackSpace:
					if(!pos) return;

					caption.Delete(pos);
					pos--;
					if(offset && pos == offset)
						offset--;
					Repaint();
					break;
		case K_Delete:
					if(pos < caption.StrLen())
					{
						caption.Delete(pos+1);
						Repaint();
					}
					break;
		case K_Left:
					if(!pos) return;

					pos--;
					if(offset && pos == offset)
						offset--;
					Repaint();
					break;
		case K_Right:
					if(pos < caption.StrLen())
					{
						pos++;
						Repaint();
					}
					break;
		case K_Home:
					if(pos)
					{
						pos = 0;
						offset = 0;
						Repaint();
					}
					break;
		case K_End:
					if(pos != caption.StrLen())
					{
						pos = caption.StrLen();
						Repaint();
					}
					break;
		default: 
					if(!isprint(key)) return;

					caption.Add(key, pos);
					pos++;
					Repaint();
	}
}


