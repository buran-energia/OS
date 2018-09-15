#ifndef MessagesH
#define MessagesH

#include "types.h"

#define WM_MOUSEDOWN  1
#define WM_MOUSEUP    2
#define WM_MOUSEMOVE  3
#define WM_MOUSEENTER 4
#define WM_MOUSELEAVE 5
#define WM_CLICK      6
#define WM_PAINT      7
#define WM_KEYDOWN    8
#define WM_MENUCLICK  9

typedef struct MSG
{
	DWORD handle;
	DWORD message;
	DWORD hparam;
	DWORD lparam;
};

void SendMessage(void (* wndproc)(MSG *msg), DWORD handle, DWORD message, DWORD hparam, DWORD lparam);

#endif
