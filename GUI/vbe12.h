#ifndef Vbe12H
#define Vbe12H

#include "screen.h"

void SetPixel(int x, int y, DWORD color);
void PutImage(int left, int top, int width, int height, BYTE *buf);

#endif
