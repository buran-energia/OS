#ifndef MaskH
#define MaskH

#include "control.h"

#define MASK_CLEAR 0
#define MASK_FILL  1
#define MASK_GET   2

class CControl;

void CreateMask(CControl *ctrl, DWORD color, int type);
void PixelMask(CControl *ctrl, int x, int y, int set);
int GetPixelMask(CControl *ctrl, int x, int y);

#endif
