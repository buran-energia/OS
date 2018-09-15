#ifndef RectmathH
#define RectmathH

typedef struct RECT
{
	int left;
	int top;
	int width;
	int height;
	int right;
	int bottom;
};

typedef struct UpdateList
{
	RECT r;
	UpdateList *next;
};

int RectEqual(RECT &r1, RECT &r2);
void FillRect(RECT &r, int left, int top, int width, int height);
int Collision(RECT &r1, RECT &r2);
UpdateList *CheckRegions(RECT &r1, RECT &r2, int include);
UpdateList* AddRect(UpdateList* list, RECT &r);

#endif
