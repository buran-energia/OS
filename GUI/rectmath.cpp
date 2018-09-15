#include <stdio.h>
#include "rectmath.h"

int RectEqual(RECT &r1, RECT &r2)
{
	if(r1.left == r2.left && r1.top == r2.top && 
	   r1.width == r2.width && r1.height == r2.height)
		return 1;
	else
		return 0;
}

void FillRect(RECT &r, int left, int top, int width, int height)
{
	r.left = left;
	r.top = top;
	r.width = width;
	r.height = height;
	r.right = left+width-1;
	r.bottom = top+height-1;
}

int Collision(RECT &r1, RECT &r2)
{
   if(r1.right < r2.left || r2.right < r1.left || r1.bottom < r2.top || r2.bottom < r1.top)
		return 0;
   else
		return 1;
}

UpdateList *CheckRegions(RECT &r1, RECT &r2, int include)
{
	UpdateList *list = NULL, *next = NULL;

    if(!Collision(r1, r2))
	{
		list = new UpdateList;
		list->r = r1;

		if(include)
		{
			next = new UpdateList;
			next->next = NULL;
			next->r = r2;
		}

		list->next = next;

		return list;
	}

    RECT current = r1;
	if(include)
	{
		list = new UpdateList;
		list->r = r2;
		list->next = NULL;
	}

    if(current.left < r2.left)
    {
        next = new UpdateList;
        next->r.left = current.left;
        next->r.right = r2.left;
        next->r.top = current.top;
        next->r.bottom = current.bottom;
		next->r.width = next->r.right - next->r.left+1;
		next->r.height = next->r.bottom - next->r.top+1;

        next->next = list;
        list = next;
        current.left = r2.left;
    }

    if(current.right > r2.right)
    {
        next = new UpdateList;
        next->r.left = r2.right;
        next->r.right = current.right;
        next->r.top = current.top;
        next->r.bottom = current.bottom;
		next->r.width = next->r.right - next->r.left+1;
		next->r.height = next->r.bottom - next->r.top+1;

        next->next = list;
        list = next;
        current.right = r2.right;
    }

    if(current.top < r2.top)
    {
        next = new UpdateList;
        next->r.left = current.left;
        next->r.right = current.right;
        next->r.top = current.top;
        next->r.bottom = r2.top;
		next->r.width = next->r.right - next->r.left+1;
		next->r.height = next->r.bottom - next->r.top+1;

        next->next = list;
        list = next;
        current.top = r2.top;
    }

    if(current.bottom > r2.bottom)
    {
        next = new UpdateList;
        next->r.left = current.left;
        next->r.right = current.right;
        next->r.top = r2.bottom;
        next->r.bottom = current.bottom;
		next->r.width = next->r.right - next->r.left+1;
		next->r.height = next->r.bottom - next->r.top+1;

        next->next = list;
        list = next;
        current.bottom = r2.bottom;
    }

	return list;
}

UpdateList* AddRect(UpdateList* list, RECT &r)
{
	UpdateList *current, *tmp, *newlist;

	if(!list) return 0;

	for(current = list; current; current = current->next)
	{
		if(Collision(current->r, r))
		{
			tmp = CheckRegions(current->r, r, 0);
		}
	}
}
