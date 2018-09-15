#include "ctype.h"
#include "string.h"

int strlen(const char* string)
{
	int r = 0;
	while(*string++) r++;

	return r;
}

int strncmp(const char *s1, const char *s2, int n)
{
	int i;

	for(i=0; i<n; i++)
	{
		if(s1[i]>s2[i]) return 1;
		if(s1[i]<s2[i]) return -1;		
	}
	
	return 0;
}

int strcmp(const char *s1, const char *s2)
{
	int len, i;
	len = strlen(s1);

	for(i=0; i<=len; i++)
	{
		if(s1[i]>s2[i]) return 1;
		if(s1[i]<s2[i]) return -1;		
		if((!s1[i])||(!s2[i])) return 0;		
	}
}

char* _strupr(char *s1)
{
	int i, len = strlen(s1);
	for(i=0; i<len; i++)
	{
		if(_islower(s1[i]))
			s1[i] = _toupper(s1[i]);
	}

	return s1;
}

char* _strlwr(char *s1)
{
	int i, len = strlen(s1);
	for(i=0; i<len; i++)
	{
		if(_isupper(s1[i]))
			s1[i] = _tolower(s1[i]);
	}

	return s1;
}

void* memset(void* dst, int c, int length)
{
	char *temp = (char*)dst;
	while(length--)
	{
		*temp++ = c;
	}

	return dst;
}

void *memcpy(void *s1, const void *s2, int n)
{
	char *temp = (char*)s1, *temp2 = (char*)s2;
	while(n--)
	{
		*temp++ = *temp2++;
	}

	return s1;
}

char *strncpy(char *s1, const char *s2, int n)
{
	if(strlen(s2) < n)
		n = strlen(s2);
		
	memcpy(s1, s2, n);
	s1[n] = '\0';
}

char *strchr(char *s, char c)
{
	do {
		if(*s == c)
			return s;
	} while(*s++);
	
	return 0;
}
