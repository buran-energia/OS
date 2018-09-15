#ifndef ControlH
#define ControlH

#include "wndlist.h"
#include "screen.h"
#include "messages.h"
#include "keys.h"
#include "bmp.h"

class CWndList;

class CControl {
	public:
		CControl(int left, int top, int width, int height);
		virtual ~CControl();
		virtual void GetPosition(int &left, int &top);
		virtual void SetPosition(int left, int top);
		virtual void GetSize(int &width, int &height);
		virtual void SetSize(int width, int height);
		virtual void Paint();
		virtual void MouseDown(int x, int y);
		virtual void MouseUp(int x, int y);		
		virtual void MouseMove(int x, int y);
		virtual void MouseEnter();
		virtual void MouseLeave();
		virtual void MouseClick();
		virtual void KeyDown(int key);
		void Repaint();
		void Show();
		void Hide();
		void SetMask(BYTE *mask);
		void ClearMask();
		BYTE *GetMask();

		CWndList *Parent;
		void (* wndproc)(MSG *msg);
		int visible;
		int left, top, width, height, right, bottom;
		int active, mousedown;
	protected:
		BYTE *mask;
};

#endif
