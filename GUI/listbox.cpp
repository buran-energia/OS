#include "listbox.h"

CListBox::CListBox(int left, int top, int width, int height, DWORD style):
		  CWidget(left, top, width, height)
{
	ItemIndex = 0;
	offset = 1;
	this->style = style;
}

CListBox::~CListBox()
{
	
}

void CListBox::Paint()
{
	if(!visible) return;

	int ClipLeft, ClipTop, ClipRight, ClipBottom;

	Screen->Rectangle(left, top, width, height, RGB(100, 177, 255), 0);
	if(!(style&LS_TRANSPARENT))
		Screen->Rectangle(left+1, top+1, width-2, height-2, RGB(255, 255, 255), 1);

	if(!Items.Count()) return;

	int offheight = 0;
	if(offset)
	{
		for(int i=1; i<offset; i++)
			offheight += Screen->TextHeight(Items.GetItem(i), 16);
	}

	int posheight = 0;
	if(ItemIndex)
	{
		for(int i=1; i<=ItemIndex; i++)
			posheight += Screen->TextHeight(Items.GetItem(i), 16);
	}

	if(posheight > offheight+height-8)
	{
		offheight += height-8;
		while(posheight > offheight)
		{
			offset++;
			offheight += Screen->TextHeight(Items.GetItem(offset), 16);
		}
		offset++;
	}
	else
		if(posheight <= offheight)
			offset = ItemIndex;

	Screen->GetClippingRect(ClipLeft, ClipTop, ClipRight, ClipBottom);

	int pleft, ptop;
	int x = ClipRight-ClipLeft+1;
	int y = ClipBottom-ClipTop+1;
	Parent->GetPosition(pleft, ptop);
	if(ClipRight > pleft+this->left+width-4)
		x = (pleft+this->left+width-4)-ClipLeft+1;
	if(ClipBottom > ptop+this->top+height-3)
		y = (ptop+this->top+height-3)-ClipTop+1;

	Screen->SetClippingRect(ClipLeft, ClipTop, x, y);
	
	int pos = offset;
	int cury = 0;
	while(pos <= Items.Count() && cury < height-4)
	{
		int textheight = Screen->TextHeight(Items.GetItem(pos), 16);

		if(ItemIndex && ItemIndex == pos)
		{
			Screen->SetClippingRect(ClipLeft, ClipTop, ClipRight-ClipLeft+1, y);
			Screen->Rectangle(left+2+1, top+cury+2+1, width-4-2, textheight+1-2, RGB(164, 209, 255), 1);
			Screen->Rectangle(left+2, top+cury+2, width-4, textheight+1, RGB(100, 177, 255), 0);
			Screen->SetClippingRect(ClipLeft, ClipTop, x, y);
			Screen->TextOut(left+4, top+cury+4, Items.GetItem(pos), 16, 0xFFFFFF);
		}
		else
			Screen->TextOut(left+4, top+cury+4, Items.GetItem(pos), 16, 0);

		cury += textheight;
		pos++;
	}

	Screen->SetClippingRect(ClipLeft, ClipTop, ClipRight-ClipLeft+1, ClipBottom-ClipTop+1);

	SendMessage(wndproc, (DWORD) this, WM_PAINT, 0, 0);
}

void CListBox::MouseDown(int x, int y)
{
	SetPos(ItemAtPos(x, y));
	CControl::MouseDown(x, y);
}

void CListBox::MouseUp(int x, int y)
{
	CControl::MouseUp(x, y);
}

void CListBox::MouseMove(int x, int y)
{
	CControl::MouseMove(x, y);
}

void CListBox::MouseEnter()
{
	CControl::MouseEnter();
}

void CListBox::MouseLeave()
{
	CControl::MouseLeave();
}

void CListBox::KeyDown(int key)
{
	CControl::KeyDown(key);

	switch(key)
	{
		case K_Down:
					if(ItemIndex < Items.Count())
					{
						ItemIndex++;
						Repaint();
					}
					break;
		case K_Up:
					if(ItemIndex > 1)
					{
						ItemIndex--;
						Repaint();
					}
					break;
	}
}

void CListBox::SetPos(int pos)
{
	if(pos < 1 || pos > Items.Count() || pos == ItemIndex) return;

	ItemIndex = pos;
	Repaint();
}

int CListBox::GetPos()
{
	return ItemIndex;
}

int CListBox::ItemAtPos(int x, int y)
{
	if(x < 2 || x > width-2 || y < 2 || y > height-2) return 0;

	int pos = offset;
	int cury = 0;
	while(pos <= Items.Count() && cury < height-4)
	{
		cury += Screen->TextHeight(Items.GetItem(pos), 16);

		if(y < cury)
			return pos;
		pos++;
	}

	return 0;
}

void CListBox::Add(char *caption)
{
	Items.Add(caption);
	Repaint();
}

void CListBox::Delete(int pos)
{
	if(pos < 1 || pos > Items.Count()) return;

	Items.Delete(pos);
	Repaint();
}
