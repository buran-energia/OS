#ifndef WidgetH
#define WidgetH

#include "control.h"

class CWidget: public CControl {
	public:
		CWidget(int left, int top, int width, int height);
		~CWidget();
		virtual void SetPosition(int left, int top);
		virtual void SetSize(int width, int height);
};

#endif
