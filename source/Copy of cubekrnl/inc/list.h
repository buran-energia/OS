#ifndef _LIST_H_
#define _LIST_H_

#include <types.h>
#include <ke.h>
#include <utils.h>

/*

#define InsertToList(list, item) \
    item->back = NULL; \
    item->next = (list)->first; \
    if((list)->first != NULL) \
        (list)->first->back = item; \
    (list)->first = item

#define DeleteFromList(list, item) \
    if(item->back != NULL) \
        item->back->next = item->next; \
    if(item->next != NULL) \
        item->next->back = item->back; \
    if(list->first == item) \
        list->first = item->next

*/

#endif
