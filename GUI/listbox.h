#ifndef ListboxH
#define ListboxH

#include "widget.h"
#include "strlist.h"

#define LS_TRANSPARENT 1

class CListBox: public CWidget {
	public:
		CListBox(int left, int top, int width, int height, DWORD style = 0);
		~CListBox();
		void Paint();		
		void MouseDown(int x, int y);
		void MouseUp(int x, int y);		
		void MouseMove(int x, int y);
		void MouseEnter();
		void MouseLeave();
		void KeyDown(int key);
		void SetPos(int pos);
		int GetPos();
		int ItemAtPos(int x, int y);
		void Add(char *caption);
		void Delete(int pos);

		CStringList Items;
	private:
		int ItemIndex;
		int offset;
		DWORD style;
};

#endif
