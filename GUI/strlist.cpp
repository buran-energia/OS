#include <stdlib.h>
#include "strlist.h"

CStringList::CStringList()
{
	list = 0;
	count = 0;
}

CStringList::~CStringList()
{
	StrList *current, *tmp;

	current = list;
	while(current)
	{
		tmp = current;
		current = current->next;
		delete tmp->str;
		free(tmp);
	}
}

void CStringList::Add(char *string)
{
	StrList *strlist, *current;

	strlist = new StrList;
	strlist->str = string;
	strlist->next = 0;

	if(list)
	{
		for(current = list; current->next; current = current->next);

		strlist->prev = current;
		current->next = strlist;
	}
	else
	{
		strlist->prev = 0;
		list = strlist;
	}

	count++;
}

void CStringList::Delete(int pos)
{
	if(pos < 1 || pos > count) return;

	StrList *current = list;

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

	delete current->str;
	free(current);

	count--;
}

char *CStringList::GetItem(int pos)
{
	if(pos < 1 || pos > count) return 0;

	StrList *current = list;

	while(--pos)
	{
		current = current->next;
	}

	return current->str;
}

int CStringList::Count()
{
	return count;
}
