#include "parse.h"
#include "boot.h"
#include "ctype.h"

static char *curpos;

int SetSection(char *name)
{
	char *s = (char *) CFG_FILE_ADDR;
	int len = strlen(name);
	
	while(strncmp(name, s, len) && *s++);

	if(*s)
	{	
		curpos = s + len;
		return 1;
	}
		return 0;
}

int ReadLine(char *buf, int len)
{
	char *s = curpos;
	int i = 0;
	
	while(*s == '\n' || *s == '\r' || *s == ' ')
		s++;
		
	if(*s == 0 || *s == '[')
		return 0;
		
	while(isprint(s[i]))
		i++;

	if(i > len)
		i = len;

	if(i < 1 || i > MAX_NAME_LEN)
		return 0;

	strncpy(buf, s, i);
	curpos = s + i;
	
	return 1;
}
