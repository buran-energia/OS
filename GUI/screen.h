#ifndef ScreenH
#define ScreenH

#include "types.h"
#include "vesa.h"
#include "vbe12.h"
#include "wndlist.h"
#include "rectmath.h"
#include "messages.h"
#include "bmp.h"

#define RGB(r, g, b) (DWORD)((r<<16) | (g<<8) | b)

class CWndList;
class CForm;

class CScreen 
{
	public:
		CScreen(int mode);
		~CScreen();
		void SetClippingRect(int left, int top, int width, int height);
		void GetClippingRect(int &left, int &top, int &right, int &bottom);
		void Pixel(int x, int y, DWORD color);		
		void HLine(int x, int y, int width, DWORD color);	
		void VLine(int x, int y, int height, DWORD color);
		void Line(int x1, int y1, int x2, int y2, DWORD color);
		void Rectangle(int left, int top, int width, int height, DWORD color, int fill);
		void Circle(int left, int top, int radius, DWORD color, int fill);
		void RoundRect(int left, int top, int width, int height, int radius, DWORD color, int fill);
		void Image(int left, int top, int width, int height, BYTE *image, int get);
		void Bitmap(int left, int top, BITMAP *bmp, int transparent);
		void TextOut(int left, int top, char *text, int size, DWORD color);
		void FlushRect(int left, int top, int width, int height);
		void FlushRects(UpdateList *list);
		void FlushMouse(RECT *list);
		void RestoreBackground(int left, int top, int width, int height);
		void RepaintRect(int left, int top, int width, int height, int flush);
		void RepaintRects(UpdateList *list);
		void AddWindow(CForm *wnd);
		void DeleteWindow(CForm *wnd);
		void SetOnTop(CForm *wnd);
		void MouseDown(int x, int y);
		void MouseUp(int x, int y);
		void MouseMove(int x, int y);
		void KeyDown(int key);
		void SetChildArea(int left, int top);
		int TextWidth(char *text, int size, int width);
		int TextHeight(char *text, int size);

		BYTE *buffer, *background;
		int ScreenWidth, ScreenHeight, bpp;
		CWndList *Windows;
	private:
		int ClipLeft, ClipTop, ClipRight, ClipBottom;
		int ChildLeft, ChildTop;
};

CForm *CreateWindow(int left, int top, int width, int height, char *caption, DWORD style, void (*wndproc)(MSG *msg));
void DestroyWindow(CForm *handle);

void panic(char *err);
void debug(char *msg);
BYTE Alpha(BYTE r, BYTE src, BYTE alpha);

extern CScreen *Screen;
extern BYTE *vmem;
extern int busy;
extern void (*mouse_callback)(int, int, short);

#endif
