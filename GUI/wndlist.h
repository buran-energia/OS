#ifndef WndlistH
#define WndlistH

#include "control.h"
#include "rectmath.h"
#include "types.h"

class CControl;

typedef struct WinList {
	CControl *ctrl;
	WinList *next;
	WinList *prev;
};

class CWndList {
	public:
		CWndList();
		~CWndList();
		void Add(CControl *ctrl);
		void Delete(CControl *ctrl);
		int SetOnTop(CControl *ctrl);
		void PaintAll(int left, int top, int width, int height);
		int MouseDown(int x, int y);
		int MouseUp(int x, int y);		
		int MouseMove(int x, int y);
		void KeyDown(int key);
		void GetPosition(int &left, int &top);
		void SetPosition(int left, int top);
		void GetSize(int &width, int &height);
		void SetSize(int width, int height);
		UpdateList *GetUpdateList(CControl *ctrl);
		CControl *ControlAtPos(int x, int y);

		CControl *ActiveObject, *FocusedObject;
		DWORD Handle;
	protected:
		int left, top, width, height, right, bottom;	
		WinList *first, *last;
		int count;
};

#endif
