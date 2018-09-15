#include "cstring.h"
#include "string.h"
#include "stdlib.h"

CString::CString()
{
	String = 0;
	Length = 0;
}

CString::~CString()
{
	free(String);
}

int CString::StrLen()
{
	return Length;
}

void CString::Add(char c, int pos)
{
	char *newstr;

	if(pos > Length)
		pos = Length;

	Length++;
	newstr = new char[Length+1];

	memcpy(newstr, String, pos);
	newstr[pos] = c;
	memcpy(newstr+pos+1, String+pos, Length-pos-1);
	newstr[Length] = 0;
	free(String);

	String = newstr;
}

void CString::Delete(int pos)
{
	char *newstr;

	Length--;
	newstr = new char[Length+1];

	memcpy(newstr, String, pos-1);
	memcpy(newstr+pos-1, String+pos, Length-pos+1);
	newstr[Length] = 0;
	free(String);

	String = newstr;
}

CString::operator char *()
{
   return String;
}

void CString::operator = (char *string)
{
	char *newstr;

	if(!string)
	{
		String = 0;
		return;
	}

	Length = strlen(string);
	newstr = new char[Length+1];
	free(String);
	strcpy(newstr, string);

	String = newstr;
}


void CString::operator += (char *string)
{
	char *newstr;

	Length += strlen(string);

	newstr = new char[Length+1];
	strcpy(newstr, String);
	strcat(newstr, string);
	free(String);

	String = newstr;
}

void CString::operator += (char c)
{
	char *newstr;

	Length++;
	newstr = new char[Length+1];
	memcpy(newstr, String, Length-1);
	newstr[Length-1] = c;
	newstr[Length] = 0;
	free(String);

	String = newstr;
}
