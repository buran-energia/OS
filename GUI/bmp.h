#ifndef BmpH
#define BmpH

#include "types.h"

typedef struct 
{
    DWORD biSize;
    DWORD biWidth;
    DWORD biHeight;
    WORD biPlanes;
    WORD biBitCount;
    DWORD biCompression;
    DWORD biSizeImage;
    DWORD biXPelsPerMeter;
    DWORD biYPelsPerMeter;
    DWORD biClrUsed;
    DWORD biClrImportant;
	BYTE *data;
} BITMAP;

int LoadBitmap(char *filename, BITMAP *bmp);

#endif
