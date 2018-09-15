#ifndef MouseH
#define MouseH

#define MOUSE_WIDTH 16
#define MOUSE_HEIGHT 24

class CMouse {
	public:
		CMouse();
		~CMouse();
		void Init();
		void DeInit();
		int SetCursorPos(int x, int y);
		void GetCursorPos(int &x, int &y);
		short GetButtons();
		void Draw();
		void Clear();
		void CaptureMouse(void (*callback)(int, int, short));
		void ReleaseMouse();
		
		short MouseX, MouseY, paint_mouse, MouseEnabled, MouseButtons;
};

extern CMouse *Mouse;

#endif
