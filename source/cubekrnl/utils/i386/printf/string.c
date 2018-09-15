#include <ctype.h>
#include <string.h>

// String lenght
int strlen(const char* string)
{
	int r = 0;
	while(*string++) r++;

	return r;
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

void* memset(void* dst, int c, size_t length)
{
	char *temp = (char*)dst;
	while(length--)
	{
		*temp++ = c;
	}

	return dst;
}

void *memcpy(void *s1, const void *s2, size_t n)
{
	char *temp = (char*)s1, *temp2 = (char*)s2;
	while(n--)
	{
		*temp++ = *temp2++;
	}

	return s1;
}
