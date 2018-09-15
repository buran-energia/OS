#include <stdio.h>
#include <stdlib.h>
#include "bmp.h"
#include "screen.h"

int LoadBitmap(char *filename, BITMAP *bmp)
{
	FILE *fp = fopen(filename, "rb");

	if(!fp) return 0;

	fseek(fp, 14, SEEK_SET);
	fread(bmp, sizeof(BITMAP), 1, fp);
	fseek(fp, 54, SEEK_SET);

	if(!(bmp->data = (BYTE *) malloc(bmp->biWidth*bmp->biHeight*Screen->bpp))) 
	{
		fclose(fp);
		return 0;
	}

	int x, d = bmp->biWidth%4;
	for(int y=(bmp->biHeight-1)*bmp->biWidth; y>=0; y-=bmp->biWidth)
	{
		for(int x=0; x<bmp->biWidth; x++)
			fread(&bmp->data[(x+y)*Screen->bpp], 3, 1, fp);

		if(d)
			fseek(fp, d, SEEK_CUR);
	}

	fclose(fp);

	return 1;
}
