#include <stdlib.h>
#include <string.h>
#include "image.h"

CImage::CImage(int left, int top, int width, int height, BITMAP *bmp, int transparent):
		CWidget(left, top, width, height)
{
	this->transparent = transparent;

	if(bmp)
		SetBitmap(bmp, transparent);
	else
		image.data = 0;
}

CImage::~CImage()
{
	if(image.data)
		free(image.data);
}

void CImage::Paint()
{
	Screen->Bitmap(left, top, &image, transparent);

	SendMessage(wndproc, (DWORD) this, WM_PAINT, 0, 0);
}

void CImage::SetBitmap(BITMAP *bmp, int transparent)
{
	this->transparent = transparent;

	memcpy(&image, bmp, sizeof(BITMAP));
	if(bmp->data)
	{
		image.data = (BYTE *) malloc(bmp->biWidth*bmp->biHeight*Screen->bpp);
		memcpy(image.data, bmp->data, bmp->biWidth*bmp->biHeight*Screen->bpp);
	}
	else
		bmp->data = 0;
	Repaint();
}
