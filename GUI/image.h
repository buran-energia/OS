#ifndef ImageH
#define ImageH

#include "widget.h"
#include "bmp.h"

class CImage: public CWidget
{
	public:
		CImage(int left, int top, int width, int height, BITMAP *bmp = 0, int transparent = 1);
		~CImage();
		void Paint();
		void SetBitmap(BITMAP *bmp, int transparent = 1);
	private:
		BITMAP image;
		int transparent;
};

#endif
