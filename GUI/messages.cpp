#include "messages.h"

void SendMessage(void (*wndproc)(MSG *msg), DWORD handle, DWORD message, DWORD hparam, DWORD lparam)
{
	if(!wndproc) return;

	MSG msg;

	msg.handle = handle;
	msg.message = message;
	msg.hparam = hparam;
	msg.lparam = lparam;

	wndproc(&msg);
}
