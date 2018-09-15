#ifndef ButtonH
#define ButtonH

#include "widget.h"
#include "cstring.h"
#include "bmp.h"

#define BS_BITMAP      1
#define BS_TRANSPARENT 2
#define BS_IMAGEONTOP  4
#define BS_ROUNDRECT   8  // only for FLATBUTTON
#define BS_NOBORDER    16 // only for FLATBUTTON
#define BS_CENTER	   32

#define SPEEDBUTTON 1
#define FLATBUTTON  2

class CButton: public CWidget {
	public:
		CButton(int left, int top, int width, int height, char *caption, DWORD style = 0);
		~CButton();
		void Paint();		
		void MouseDown(int x, int y);
		void MouseUp(int x, int y);	
		void MouseEnter();
		void MouseLeave();
		void SetButtonType(DWORD type);
		void SetBitmap(BITMAP *bmp);
		void SetColor(DWORD color);
		void SetActiveColor(DWORD color);
		void SetBorderColor(DWORD color);
		void SetActiveBorderColor(DWORD color);
		void SetTextColor(DWORD color);
		void SetRadius(int radius); // for BS_ROUNDRECT
		void SetImageOffset(int offset);
		void SetTextOffset(int offset);
		CString caption;
	private:
		DWORD style, type;
		BITMAP bmp;
		DWORD color, ActiveColor, BorderColor, TextColor, ActiveBorderColor;
		int radius, imgoffset, txtoffset;
}; 

#endif
