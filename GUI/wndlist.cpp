#include <stdio.h>
#include <stdlib.h>
#include <dos.h>
#include <string.h>
#include <mem.h>
#include "wndlist.h"
#include "mask.h"

CWndList::CWndList()
{
	first = NULL;
	last = NULL;	
	count = 0;
	ActiveObject = NULL;
	FocusedObject = NULL;
	Handle = NULL;
}

CWndList::~CWndList()
{
	WinList *current, *tmp;

	current = first;
	while(current)
	{
		tmp = current;
		current = current->next;
		delete tmp->ctrl;
		free(tmp);
	}
}

void CWndList::Add(CControl *ctrl)
{
	WinList *newctrl;
	
	newctrl = (WinList *) malloc(sizeof(WinList));
	memset(newctrl, 0, sizeof(WinList));

	newctrl->ctrl = ctrl;	
	
	if(first == NULL)
	{
		first = newctrl;
		last = newctrl;
	}
	else
	{
		newctrl->prev = last;
		last->next = newctrl;
		last = newctrl;		
	}
	
	ctrl->Parent = this;
	count++;
}

void CWndList::Delete(CControl *ctrl)
{
	WinList *current;

	current = first;	
	if(first->ctrl == ctrl) 
	{
		first = first->next;
		first->prev = NULL;
	}
	else
	{
		for(; current->ctrl != ctrl; current = current->next);
	
		if(current == last) 
			last = current->prev;
		
		current->next->prev = current->prev;
		current->prev->next = current->next;
	}
	
	free(current);
	ctrl->Parent = NULL;
	count--;
}

int CWndList::SetOnTop(CControl *ctrl)
{
	WinList *current;	
	
	if(count <= 1 || last->ctrl == ctrl) return 0;

	Delete(ctrl);
	Add(ctrl);
	
	return 1;
}

void CWndList::PaintAll(int left, int top, int width, int height)
{
	WinList *last;	
	int x, y, x2, y2;
	RECT r1, r2;
	
	for(last = first; last; last = last->next) 
	{
		if(!last->ctrl->visible) 
			continue;

		last->ctrl->GetPosition(x, y);
		last->ctrl->GetSize(x2, y2);
		x += this->left;
		y += this->top;
		FillRect(r1, x, y, x2, y2);
		FillRect(r2, left, top, width, height);

		if(Collision(r1, r2))
		{
			int oldClipLeft, oldClipTop, oldClipRight, oldClipBottom;

			Screen->GetClippingRect(oldClipLeft, oldClipTop, oldClipRight, oldClipBottom);

			if(x < left)
			{
				x2 -= left-x;
				x = left;
			}

			if(x+x2-1 > left+width-1)
				x2 = left+width-x;	

			if(y < top)
			{
				y2 -= top-y;
				y = top;
			}

			if(y+y2-1 > top+height-1)
				y2 = top+height-y;

			if(this != Screen->Windows)
			{
				if(x+x2 > this->left+this->width)
					x2 = (this->left+this->width)-x-4;

				if(y+y2 > this->top+this->height)
					y2 = (this->top+this->height)-y-4;
			}

			Screen->SetClippingRect(x, y, x2, y2);

			last->ctrl->Paint();

			Screen->SetClippingRect(oldClipLeft, oldClipTop, oldClipRight-oldClipLeft+1, oldClipBottom-oldClipTop+1);
		}
	}
}

int CWndList::MouseDown(int x, int y)
{
	CControl *ctrl;

	if(ctrl = ControlAtPos(x, y))
	{
		if(this == Screen->Windows)
			ctrl->MouseDown(x, y);
		else
		{
			int left, top;
			ctrl->GetPosition(left, top);
			ctrl->MouseDown(x-left, y-top);
		}

		FocusedObject = ctrl;

		return 1;
	}
	else
		return 0;
}

int CWndList::MouseUp(int x, int y)
{
	CControl *ctrl;

	if(FocusedObject)
	{
		if(this == Screen->Windows)
			FocusedObject->MouseUp(x, y);
		else
		{
			int left, top;
			FocusedObject->GetPosition(left, top);
			FocusedObject->MouseUp(x-left, y-top);
		}

		if(ControlAtPos(x, y) == FocusedObject)
			FocusedObject->MouseClick();
		FocusedObject = NULL;
	}
	else
		return 0;
}

int CWndList::MouseMove(int x, int y)
{
	CControl *ctrl;

	if(ctrl = ControlAtPos(x, y))
	{
		if(ActiveObject != ctrl)
		{
			if(ActiveObject)
				ActiveObject->MouseLeave();

			ActiveObject = ctrl;
			ctrl->MouseEnter();
		}

		if(this == Screen->Windows)
			ctrl->MouseMove(x, y);
		else
		{
			int left, top;
			ctrl->GetPosition(left, top);
			ctrl->MouseMove(x-left, y-top);
		}

		return 1;
	}
	else
	{
		if(ActiveObject)
			ActiveObject->MouseLeave();

		ActiveObject = NULL;
		return 0;
	}
}

void CWndList::KeyDown(int key)
{
	if(ActiveObject)
		ActiveObject->KeyDown(key);
}

void CWndList::GetPosition(int &left, int &top)
{
	left = this->left;
	top = this->top;
}

void CWndList::SetPosition(int left, int top)
{
	this->left = left;
	this->top = top;
	right = left+width-1;
	bottom = top+height-1;	
}

void CWndList::GetSize(int &width, int &height)
{
	width = this->width;
	height = this->height;
}

void CWndList::SetSize(int width, int height)
{
	this->width = width;
	this->height = height;
	right = left+width-1;
	bottom = top+height-1;	
}

UpdateList *CWndList::GetUpdateList(CControl *ctrl)
{
	WinList *current;
	int left, top, width, height, ClipLeft, ClipTop, ClipRight, ClipBottom;	
	UpdateList *tmp, *last, *list = NULL;
	RECT r, ClipR;

	if(count <= 1 || this->last->ctrl == ctrl) return 0;

	Screen->GetClippingRect(ClipLeft, ClipTop, ClipRight, ClipBottom);
	ClipR.left = ClipLeft;
	ClipR.top = ClipTop;
	ClipR.width = ClipRight-ClipLeft+1;
	ClipR.height = ClipBottom-ClipTop+1;
	ClipR.right = ClipRight;
	ClipR.bottom = ClipBottom;

	for(current = this->last; current->ctrl != ctrl; current = current->prev) 
	{
		current->ctrl->GetPosition(left, top);
		current->ctrl->GetSize(width, height);

		if(left < ClipLeft)
		{
			width -= ClipLeft-left-1;
			left = ClipLeft;
		}

		if(left+width-1 > ClipRight)
			width = ClipRight-left+1;	

		if(top < ClipTop)
		{
			height -= ClipTop-top-1;
			top = ClipTop;
		}

		if(top+height-1 > ClipBottom)
			height = ClipBottom-top+1;

		FillRect(r, left, top, width, height);

		if(Collision(ClipR, r))
		{
			if(list)
			{
				tmp = new UpdateList;

				tmp->r = r;
				tmp->next = NULL;

				for(last = list; last->next; last = last->next);
					last->next = tmp;
			}
			else
			{
				list = new UpdateList;
				list->r = r;
				list->next = NULL;
			}
		}
	}

	return list;
}

CControl *CWndList::ControlAtPos(int x, int y)
{
	WinList *current;
	int left, top, width, height;	

	for(current = last; current; current = current->prev) 
	{
		current->ctrl->GetPosition(left, top);
		current->ctrl->GetSize(width, height);
		
		if(current->ctrl->visible && x >= left && x <= left+width-1 &&
	   	   y >= top && y <= top+height-1) 
	   	{		
			if(current->ctrl->GetMask())
			{
				if(GetPixelMask(current->ctrl, x-left, y-top))
					return current->ctrl;
			}
			else
				return current->ctrl;
		}
	}	

	return NULL;
}
