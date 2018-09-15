#ifndef EditH
#define EditH

#include "widget.h"
#include "cstring.h"

#define ES_TRANSPARENT 1

class CEdit: public CWidget {
	public:
		CEdit(int left, int top, int width, int height, DWORD style = 0);
		~CEdit();
		void Paint();		
		void MouseDown(int x, int y);
		void MouseUp(int x, int y);		
		void MouseMove(int x, int y);
		void MouseEnter();
		void MouseLeave();
		void KeyDown(int key);
	
		CString caption;
		int pos;
	private:
		int offset;
		DWORD style;
};

#endif
