#ifndef LabelH
#define LabelH

#include "widget.h"
#include "cstring.h"

class CLabel: public CWidget {
	public:
		CLabel(int left, int top, int width, int height, char *caption, int size);
		~CLabel();
		void Paint();		
		void MouseDown(int x, int y);
		void MouseUp(int x, int y);		
		void MouseMove(int x, int y);
		void MouseEnter();
		void MouseLeave();
		void SetText(char *caption);
		void SetFontSize(int size);
		void SetColor(DWORD color);
	private:
		CString caption;
		int size;
		DWORD color;
};

#endif
