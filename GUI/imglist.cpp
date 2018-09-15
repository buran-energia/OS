#include <stdlib.h>
#include <string.h>
#include "imglist.h"
#include "screen.h"

CImageList::CImageList()
{
	list = 0;
	count = 0;
}

CImageList::~CImageList()
{
	ImgList *current, *tmp;

	current = list;
	while(current)
	{
		tmp = current;
		current = current->next;
		delete tmp->str;
		free(tmp->bmp.data);
		free(tmp);
	}
}

void CImageList::Add(char *string, BITMAP *bmp)
{
	ImgList *newlist, *current;

	newlist = new ImgList;
	newlist->str = string;
	newlist->next = 0;
	if(bmp)
	{
		memcpy(&newlist->bmp, bmp, sizeof(BITMAP));
		if(bmp->data)
		{
			newlist->bmp.data = (BYTE *) malloc(bmp->biWidth*bmp->biHeight*Screen->bpp);
			memcpy(newlist->bmp.data, bmp->data, bmp->biWidth*bmp->biHeight*Screen->bpp);
		}
		else
			newlist->bmp.data = 0;
	}

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

	count++;
}

void CImageList::Delete(int pos)
{
	if(pos < 1 || pos > count) return;

	ImgList *current = list;

	while(--pos)
	{
		current = current->next;
	}

	if(list == current)
		list = current->next;
	else
		current->prev->next = current->next;

	if(current->next)
		current->next->prev = current->prev;

	free(current);

	count--;
}

char *CImageList::GetItem(int pos)
{
	if(pos < 1 || pos > count) return 0;

	ImgList *current = list;

	while(--pos)
	{
		current = current->next;
	}

	return current->str;
}

BITMAP *CImageList::GetBitmap(int pos)
{
	if(pos < 1 || pos > count) return 0;

	ImgList *current = list;

	while(--pos)
	{
		current = current->next;
	}

	return &current->bmp;
}

int CImageList::Count()
{
	return count;
}
