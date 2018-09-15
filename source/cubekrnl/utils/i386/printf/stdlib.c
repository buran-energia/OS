#include <stdlib.h>
#include <string.h>
#include <types.h>

// Int -> char* ADVANCED
char* itoaex(size_t value, char* buffer, int radix, int neg)
{
	char temp[35];
	int digit, loop = 0;
	char magic;
	size_t n;

	// Negation
	if((neg)&&(radix!=10))
		return NULL;

	// DO IT !
	do
	{
		n = value;
		n /= radix;
		n *= radix;
		digit = value - n;
		magic = (digit>9)?('a'-10):('0');
		temp[loop++] = magic + digit;
		value /= radix;
	} while( value );

	if(neg)
		temp[loop++] = '-';

	temp[loop--] = '\0';

	digit = loop+1;
	for(n = 0; n < digit; n++)
	{
		buffer[n] = temp[loop];
		loop--;
	}
	buffer[n] = '\0';

	return buffer;
}

// int -> char* simple
char* itoa(long value, char* buffer)
{
	char temp[35];
	int i, neg = 0;

	if(value<0)
	{
		value = -value;
		neg = 1;
	}

	itoaex(value, temp, 10, neg);
	for(i=0; i<strlen(temp); i++)
	{
		buffer[i] = temp[i];
	}
	buffer[i] = 0;

	return buffer;
}

// char* -> int
int atoi(char* value)
{
	int len, i, ret = 0, n = 0;

	if(value[0]=='-')
	{
		n = 1;
		*value++;
	}

	len = strlen(value);
	for(i=0; i<len; i++)
	{

		ret += value[i] - '0';
		if(i!=len-1) ret *= 10;
	}

	if(n) return -ret;
	return ret;

}
