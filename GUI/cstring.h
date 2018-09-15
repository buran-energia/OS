#ifndef CstringH
#define CstringH

class CString
{
	public:
		CString();
		~CString();
		void Add(char c, int pos);
		void Delete(int pos);
		int StrLen();
		operator char *();
		void operator = (char *string);
		void operator += (char *string);
		void operator += (char c);
	protected:
		char *String;
		int Length;
};

#endif
