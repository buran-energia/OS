#ifndef MenuH
#define MenuH

#include "form.h"
#include "button.h"

typedef struct ButtonList
{
	CButton *button;
	ButtonList *next;
	ButtonList *prev;
};

class CMenu: public CForm
{
	public:
		CMenu(int left, int top, DWORD style, void (*menuproc)(MSG *msg));
		~CMenu();
		void AddItem(char *caption, BITMAP *bmp);
		void DeleteItem(int pos);
		void Popup(int x, int y);

		ButtonList *list;
		void (* menuproc)(MSG *msg);
	private:
		int count;
};

#endif
