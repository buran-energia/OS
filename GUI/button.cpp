#include <string.h>
#include <stdlib.h>
#include "button.h"

CButton::CButton(int left, int top, int width, int height, char *caption, DWORD style):
		CWidget(left, top, width, height)
{
	this->caption = caption;
	this->style = style;
	bmp.data = 0;
	color = 0xC8D0D4;
	type = 0;

	ActiveColor = color;
	BorderColor = RGB(128, 128, 128);
	ActiveBorderColor = BorderColor;
	TextColor = 0;
	radius = 12;
	imgoffset = 4;
	txtoffset = 4;
}

CButton::~CButton()
{
	if(bmp.data)
		free(bmp.data);
}

void CButton::Paint()
{
	if((type == FLATBUTTON) && (style&BS_ROUNDRECT))
	{
		if(active)
			Screen->RoundRect(left, top, width, height, radius, ActiveColor, 1);
		else
		if(!(style&BS_TRANSPARENT))
			Screen->RoundRect(left, top, width, height, radius, color, 1);
	}
	else
	{
		if(active)
			Screen->Rectangle(left, top, width, height, ActiveColor, 1);
		else
		if(!(style&BS_TRANSPARENT))
			Screen->Rectangle(left, top, width, height, color, 1);
	}

	int xoffset = 0;
	int yoffset = 0;
	if(style&BS_BITMAP && bmp.data)
	{
		if(style&BS_IMAGEONTOP && caption)
		{
			if(style&BS_CENTER)
				xoffset = (width>>1)-(bmp.biWidth>>1);
			else
				xoffset = imgoffset;
			yoffset = (height>>1)-(Screen->TextHeight(caption, 16)>>1)-((bmp.biHeight+8)>>1);
		}
		else
		{
			if(style&BS_CENTER)
				xoffset = (width>>1)-(Screen->TextWidth(caption, 16, caption.StrLen())>>1)-(bmp.biWidth>>1);
			else
				xoffset = imgoffset;
			yoffset = (height>>1)-(bmp.biHeight>>1);
		}

		if(mousedown && active)
			Screen->Bitmap(left+xoffset+1, top+yoffset+1, &bmp, 1);
		else
			Screen->Bitmap(left+xoffset, top+yoffset, &bmp, 1);


		if(style&BS_IMAGEONTOP && caption)
		{
			yoffset += bmp.biHeight+4;
			if(style&BS_CENTER)
				xoffset = (width>>1)-(Screen->TextWidth(caption, 16, caption.StrLen())>>1);
			else
				xoffset = imgoffset+txtoffset;
		}
		else
		{
			xoffset += bmp.biWidth+txtoffset;
			yoffset = (height>>1)-(Screen->TextHeight(caption, 16)>>1);
		}
	}
	else
	{
		xoffset = (width>>1)-(Screen->TextWidth(caption, 16, caption.StrLen())>>1);
		yoffset = (height>>1)-(Screen->TextHeight(caption, 16)>>1);
	}

	if((type == FLATBUTTON))
	{
		if(active)
		{
			if(style&BS_ROUNDRECT)
				Screen->RoundRect(left, top, width, height, radius, ActiveBorderColor, 0);
			else
				Screen->Rectangle(left, top, width, height, ActiveBorderColor, 0);
		}
		else
		if(!(style&BS_NOBORDER))
		{
			if(style&BS_ROUNDRECT)
				Screen->RoundRect(left, top, width, height, radius, BorderColor, 0);
			else
				Screen->Rectangle(left, top, width, height, BorderColor, 0);
		}
	}

	if(mousedown && active)
	{
		if(type == SPEEDBUTTON)
		{
			Screen->HLine(left, top, width-1, 0x808080);
			Screen->VLine(left, top+1, height-2, 0x808080);
			Screen->HLine(left, bottom, width, 0xFFFFFF);
			Screen->VLine(right, top, height, 0xFFFFFF);
		}
		else
		if(!type)
		{
			// first frame
			Screen->HLine(left, top, width-1, 0);
			Screen->VLine(left, top+1, height-2, 0);
			Screen->HLine(left, bottom, width, 0xFFFFFF);
			Screen->VLine(right, top, height, 0xFFFFFF);
			// second frame
			Screen->HLine(left+1, top+1, width-2, 0x808080);
			Screen->VLine(left+1, top+1, height-3, 0x808080);
		}
		
		Screen->TextOut(left+xoffset+1, top+yoffset+1, caption, 16, TextColor);			
	}
	else
	{
		if(type == SPEEDBUTTON)
		{
			if(active)
			{
				Screen->HLine(left, top, width-1, 0xFFFFFF);
				Screen->VLine(left, top+1, height-2, 0xFFFFFF);
				Screen->HLine(left, bottom, width, 0x808080);
				Screen->VLine(right, top, height, 0x808080);
			}
		}
		else
		if(!type)
		{
			// first frame
			Screen->HLine(left, top, width-1, 0xFFFFFF);
			Screen->VLine(left, top+1, height-2, 0xFFFFFF);
			Screen->HLine(left, bottom, width, 0);
			Screen->VLine(right, top, height, 0);
			// second frame
			Screen->HLine(left+1, bottom-1, width-2, 0x808080);
			Screen->VLine(right-1, top+1, height-3, 0x808080);
		}

		
		Screen->TextOut(left+xoffset, top+yoffset, caption, 16, TextColor);			
	}	

	SendMessage(wndproc, (DWORD) this, WM_PAINT, 0, 0);
}

void CButton::MouseDown(int x, int y)
{
	CControl::MouseDown(x, y);
	Repaint();	
}

void CButton::MouseUp(int x, int y)
{
	CControl::MouseUp(x, y);
	Repaint();		
}

void CButton::MouseEnter()
{
	active = 1;
	if(mousedown || (color != ActiveColor))
		Repaint();
}

void CButton::MouseLeave()
{
	active = 0;
	if(mousedown || (color != ActiveColor))
		Repaint();
}

void CButton::SetButtonType(DWORD type)
{
	if(this->type == type) return;

	this->type = type;

	Repaint();
}

void CButton::SetBitmap(BITMAP *bmp)
{
	if(!bmp)
		return;

	memcpy(&this->bmp, bmp, sizeof(BITMAP));
	if(bmp->data)
	{
		this->bmp.data = (BYTE *) malloc(bmp->biWidth*bmp->biHeight*Screen->bpp);
		memcpy(this->bmp.data, bmp->data, bmp->biWidth*bmp->biHeight*Screen->bpp);
	}
	else
		this->bmp.data = 0;

	Repaint();
}

void CButton::SetColor(DWORD color)
{
	if(this->color == color) return;

	if(ActiveColor == color)
		ActiveColor = color;
	this->color = color;

	if(!(style&BS_TRANSPARENT))
		Repaint();
}

void CButton::SetActiveColor(DWORD color)
{
	if(ActiveColor == color) return;

	ActiveColor = color;

	Repaint();
}

void CButton::SetBorderColor(DWORD color)
{
	if(BorderColor == color) return;

	BorderColor = color;

	if(type == FLATBUTTON)
		Repaint();
}

void CButton::SetTextColor(DWORD color)
{
	if(TextColor == color) return;

	TextColor = color;

	if(caption.StrLen() > 0)
		Repaint();
}

void CButton::SetActiveBorderColor(DWORD color)
{
	if(ActiveBorderColor == color) return;

	ActiveBorderColor = color;

	if((type == FLATBUTTON) && active)
		Repaint();
}

void CButton::SetRadius(int radius)
{
	if(this->radius == radius) return;

	this->radius = radius;

	if((type == FLATBUTTON) && (style&BS_ROUNDRECT))
		Repaint();
}

void CButton::SetImageOffset(int offset)
{
	if(imgoffset == offset) return;

	imgoffset = offset;
	if((style&BS_BITMAP) && !(style&BS_CENTER) && bmp.data)
		Repaint();
}

void CButton::SetTextOffset(int offset)
{
	if(txtoffset == offset) return;

	txtoffset = offset;
	if(!(style&BS_CENTER) && caption)
		Repaint();
}

