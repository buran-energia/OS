#include <string.h>
#include <stdlib.h>
#include "mask.h"

// this has to be rewritten + should use bits instead of bytes
void CreateMask(CControl *ctrl, DWORD color, int type)
{
	if(!ctrl) return;

	BYTE *mask;
	int left, top, width, height, size;

	ctrl->GetSize(width, height);
	ctrl->GetPosition(left, top);
	size = width*height;

	mask = (BYTE *) malloc(size);

	if(mask)
	{
		ctrl->SetMask(mask);

		switch(type)
		{
			case MASK_CLEAR:
							memset(mask, 0, size);
							break;
			case MASK_FILL:
							memset(mask, 1, size);
							break;
			case MASK_GET:
							asm("cli");
							memset(mask, 0, size);

							BYTE *buffer = new BYTE[size*Screen->bpp];
							Screen->Image(0, 0, width, height, buffer, 1);

							Screen->Rectangle(0, 0, width, height, color, 1);
							ctrl->left = 0;
							ctrl->top = 0;
							ctrl->Paint();

							for(int y=0; y<height; y++)
								for(int x=0; x<width; x++)
									if(memcmp(&Screen->buffer[(y*Screen->ScreenWidth+x)*Screen->bpp], &color, Screen->bpp))
										mask[y*width+x] = 1;

							ctrl->left = left;
							ctrl->top = top;
							Screen->Image(0, 0, width, height, buffer, 0);
							free(buffer);
							asm("sti");
							break;
		}
	}
}

void PixelMask(CControl *ctrl, int x, int y, int set)
{
	BYTE *mask;

	if(mask = ctrl->GetMask());
	if(!mask) return;

	int width, height;

	ctrl->GetSize(width, height);
	mask[y*width+x] = (BYTE) set;
}

int GetPixelMask(CControl *ctrl, int x, int y)
{
	BYTE *mask;

	if(mask = ctrl->GetMask());
	if(!mask) return 0;
	
	int width, height;

	ctrl->GetSize(width, height);
	return mask[y*width+x];
}
