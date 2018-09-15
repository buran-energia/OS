#include <stdlib.h>
#include "menu.h"

void MenuProc(MSG *msg)
{
	CControl *ctrl;

	ctrl = (CControl *) msg->handle;

	if(ctrl->Parent == Screen->Windows)
	{
		if(msg->message == WM_PAINT)
		{
			// first rame	
			Screen->HLine(ctrl->left, ctrl->top, ctrl->width-1, 0xC8D0D4);
			Screen->VLine(ctrl->left, ctrl->top, ctrl->height-1, 0xC8D0D4);
			Screen->HLine(ctrl->left, ctrl->bottom, ctrl->width, 0x404040);
			Screen->VLine(ctrl->right, ctrl->top, ctrl->height-1, 0x404040);	
			// second frame
			Screen->HLine(ctrl->left+1, ctrl->top+1, ctrl->width-2, 0xFFFFFF);
			Screen->VLine(ctrl->left+1, ctrl->top+1, ctrl->height-2, 0xFFFFFF);	
			Screen->HLine(ctrl->left+1, ctrl->bottom-1, ctrl->width-2, 0x808080);
			Screen->VLine(ctrl->right-1, ctrl->top+1, ctrl->height-2, 0x808080);

			Screen->Rectangle(ctrl->left+25+2, ctrl->top+2, ctrl->width-4-25, ctrl->height-4, RGB(255, 255, 255), 1);
			Screen->Rectangle(ctrl->left+2, ctrl->top+2, 25, ctrl->height-4, RGB(164, 209, 255), 1);
		}
	}
	else
	{
		if(msg->message == WM_CLICK)
		{
			CMenu *menu = (CMenu *) ctrl->Parent->Handle;
			ButtonList *current = menu->list;
			int i = 1;

			for(; current->button != ctrl; current = current->next, i++);

			menu->HideWindow();
			SendMessage(menu->menuproc, ctrl->Parent->Handle, WM_MENUCLICK, 0, i);
		}
	}
}

CMenu::CMenu(int left, int top, DWORD style, void (*menuproc)(MSG *msg)):
	   CForm(left, top, 0, 0, 0, (style |= WS_NONRECT)&0xFFFFFFFE, MenuProc)
{
	this->menuproc = menuproc;
	visible = 0;
	list = 0;
	count = 0;
}

CMenu::~CMenu()
{
	ButtonList *current, *tmp;

	current = list;
	while(current)
	{
		tmp = current;
		current = current->next;
		free(tmp);
	}	
}

void CMenu::AddItem(char *caption, BITMAP *bmp)
{
	ButtonList *newlist, *current;

	newlist = (ButtonList *) malloc(sizeof(ButtonList));
	newlist->button = new CButton(2, 2, 100, 23, 0, BS_BITMAP | BS_TRANSPARENT | BS_NOBORDER);
	SetChildArea(2, 2, 2, 2);
	newlist->button->SetButtonType(FLATBUTTON);
	newlist->button->SetTextOffset(8);
	newlist->button->SetColor(RGB(255, 255, 255));
	newlist->button->SetBorderColor(RGB(255, 255, 255));
	newlist->button->SetActiveBorderColor(RGB(100, 177, 255));
	newlist->button->SetActiveColor(RGB(100, 177, 255));
	newlist->button->caption = caption;
	newlist->button->SetBitmap(bmp);
	newlist->next = 0;

	if(list)
	{
		for(current = list; current->next; current = current->next);

		newlist->prev = current;
		current->next = newlist;
	}
	else
	{
		newlist->prev = 0;
		list = newlist;
	}

	Add(newlist->button);

	count++;
}

void CMenu::DeleteItem(int pos)
{
	if(pos < 1) return;

	ButtonList *current = list;

	while(--pos && current)
	{
		current = current->next;
	}

	if(list == current)
		list = current->next;
	else
		current->prev->next = current->next;

	if(current->next)
		current->next->prev = current->prev;

	Delete(current->button);
	delete current->button;
	free(current);

	count--;
}

void CMenu::Popup(int x, int y)
{
	ButtonList *current = list;

	SetWindowPos(x, y);
	SetWindowSize(104, count*23+4);

	for(int i=0; i<count; i++, current = current->next)
		current->button->SetPosition(0, i*23);

	ShowWindow();
}
