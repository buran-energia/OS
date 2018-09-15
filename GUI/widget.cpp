#include "widget.h"

CWidget::CWidget(int left, int top, int width, int height):
		CControl(left, top, width, height)
{

}

CWidget::~CWidget()
{

}
	
void CWidget::SetPosition(int left, int top)
{
	RECT r1, r2;
	int x, y;

	if(!Parent) return;

	Parent->GetPosition(x, y);

	int oldleft = this->left+x;
	int oldtop = this->top+y;
	
	CControl::SetPosition(left, top);

	left += x;
	top += y;
	
	FillRect(r1, oldleft, oldtop, width, height);
	FillRect(r2, left, top, width, height);

	Screen->RepaintRects(CheckRegions(r1, r2, 1));
}

void CWidget::SetSize(int width, int height)
{
	if(!Parent || mask) return;

	int x, y;

	Parent->GetPosition(x, y);

	int oldwidth = this->width;
	int oldheight = this->height;

	CControl::SetSize(width, height);
	
	if(oldwidth > width) width = oldwidth;
	if(oldheight > height) height = oldheight;	
	Screen->RepaintRect(x+left, y+top, width, height, 1);
}
