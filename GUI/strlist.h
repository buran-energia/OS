#ifndef StrlistH
#define StrlistH

#include "cstring.h"

typedef struct StrList
{
	CString str;
	StrList *next;
	StrList *prev;
};

class CStringList
{
	public:
		CStringList();
		~CStringList();
		void Add(char *string);
		void Delete(int pos);
		char *GetItem(int pos);
		int Count();		
	private:
		int count;
		StrList *list;
};

#endif

