#ifndef FormH
#define FormH

#include "control.h"

#define WS_VISIBLE     1
#define WS_ALPHABLEND  2
#define WS_NONRECT     4
#define WS_CLOSEBUTTON 8

class CControl;
class CWndList;

#include "button.h"
#include "screen.h"

class CForm: public CControl {
	public:
		CForm(int left, int top, int width, int height, char *caption, DWORD style, void (*wndproc)(MSG *msg));
		~CForm();
		void Add(CControl *ctrl);
		void Delete(CControl *ctrl);
		void SetWindowPos(int left, int top);
		void SetWindowSize(int width, int height);
		void Paint();		
		void MouseDown(int x, int y);
		void MouseUp(int x, int y);		
		void MouseMove(int x, int y);	
		void MouseLeave();
		void KeyDown(int key);
		void SetColor(DWORD color);
		void HideWindow();
		void ShowWindow();
		void SetCaption(char *caption);
		void StartMoving();
		void SetChildArea(int left, int top, int right, int bottom);
		CButton *CloseButton;
		DWORD style;
		CWndList *Children;
	private:
		CString caption;
		int moving;
		int color;
		int ChildLeft, ChildTop, ChildRight, ChildBottom;
};
	
#endif
