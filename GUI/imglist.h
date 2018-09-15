#ifndef ImglistH
#define ImglistH

#include "cstring.h"
#include "bmp.h"

typedef struct ImgList
{
	CString str;
	BITMAP bmp;
	ImgList *next;
	ImgList *prev;
};

class CImageList
{
	public:
		CImageList();
		~CImageList();
		void Add(char *string, BITMAP *bmp);
		void Delete(int pos);
		char *GetItem(int pos);
		BITMAP *GetBitmap(int pos);
		int Count();		
	private:
		int count;
		ImgList *list;
};

#endif
