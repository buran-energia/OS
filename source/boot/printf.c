#include "ctype.h"
#include "itoa.h"
#include "printf.h"
#include "types.h"

#define ZEROPAD	1		/* pad with zero          */
#define SIGN	2		/* unsigned/signed long   */
#define PLUS	4		/* show plus              */
#define SPACE	8		/* space if plus          */
#define LEFT	16		/* left justified         */
#define SPECIAL	32		/* 0x or 0                */
#define LARGE	64		/* use upper case letters */

/*
 *	_leading_chars - fill string up to min_len with c chars
 *	#str: the begining of the string
 *	#end: the end
 *	#c: the char
 *	#left: left align or not
 *	#min_len: minimal length of the string
 */
static char* _leading_chars(char* str, char* end, char c, char left, int min_len)
{
	int i, need = min_len - strlen(str);
	char temp[30];

	memset(temp, 0, sizeof(temp));

	if((min_len>30)||(need<=0)) return str;

	for(i=0; i<min_len; i++)
	{
		if(left)
		{
			if(i<strlen(str)) temp[i] = str[i];
			else temp[i] = c;
		}
		else
		{
			if(i<need) temp[i] = c;
			else temp[i] = str[i-need];
		}
	}

	for(i=0; i<min_len; i++)
		str[i] = temp[i];
	str[i] = 0;

	return str;
}

#define PADCHAR ((FLAGS&ZEROPAD)?'0':' ')
#define ISLEFT  ((FLAGS&LEFT)?1:0)

/*
 *	_makestr - no need for you to know what it does :)
 *	actually it fills buffer with a number, formated by the given args
 */
static char* _makestr(char* buffer, char* end, unsigned int num, int base, int precision, int *flags)
{
	char c,sign,tmp[3], temp[50];
	int i = 0, j;
	int FLAGS = *flags;

	if (base < 2 || base > 36)
		return 0;

	if (FLAGS & LEFT)
		(*flags) &= ~ZEROPAD; /* and zeropad out if given */

	c = PADCHAR;

	sign = 0;
	if (FLAGS & SIGN) {
		if (num < 0) {
			sign = '-';
			num = -num;
		} else if (FLAGS & PLUS) {
			sign = '+';
		} else if (FLAGS & SPACE) {
			sign = ' ';
		}

		tmp[i++] = sign;
	}

	if (FLAGS & SPECIAL) {
		if (base == 16) {
			tmp[i++] = '0';
			tmp[i++] = 'x';
		}
		else if (base == 8)
			tmp[i++] = '0';
	}
	tmp[i] = 0;

	if(!itoaex(num, temp, base, 0)) return NULL;
	if(FLAGS & LARGE)
	{
		_strupr(temp);
	}

	for(i=0, j=0; j<strlen(tmp); i++, j++)
	{
		if(buffer<=end)
			buffer[i] = tmp[j];
		else break;
	}

	for(j=0; j<strlen(temp); j++, i++)
	{
		if(buffer<=end)
			buffer[i] = temp[j];
		else break;
	}
	buffer[i] = 0;

	return buffer;
}
/*
 *	vsnprintf - format a string and put it into a given buffer
 *	#buffer: buffer to place the string in
 *	#size: size of the given buffer (including \0 !)
 *	#format: format of the string
 *	#args: va_list args
 *
 *	This function is used by other *printf family
 *	functions, do not use it unless you want to pass
 *	va_list type args!
 */
int vsnprintf(char* buffer, int size, const char* format, va_list args)
{

	char c, *s;
	int precision, num;
	char *end, *str;
	char temp[40];
	int base , minlen;
	int FLAGS, mod, i, *ip;

	str = buffer;            /* str is needed when returning lenght */
	end = buffer + size - 1; /* where the string MUST end           */

	if (end < buffer - 1) {
		end = ((char*) -1); /* 0xFFFF */
		size = end - buffer + 1;
	}

    while(*format)
    {

		if(*format != '%')
		{
			if(str<=end)
				*str++ = *format++;
			else
				break;

			continue;
		}

		/* Parse the % part                           */
		/* by the order in the function prototype     */
		/* %[flags][width][.precision][modifiers]type */

		FLAGS = 0;
		minlen = -1, precision = -1;
		base = 10; i=0;
		again:

		*format++;

		/* flags */
		switch(*format)
		{
			case '0': FLAGS |= ZEROPAD; goto again;
			case '-': FLAGS |= LEFT;    goto again;
			case '+': FLAGS |= PLUS;    goto again;
			case '#': FLAGS |= SPECIAL; goto again;
			case ' ': FLAGS |= SPACE;   goto again;
		}

		/* width */
		if(isdigit(*format)) {

			while(isdigit(*format)) {
				temp[i++] = *format++;
			}
			temp[i] = 0;

			minlen = atoi(temp);
			*format--;
			goto again;
		} else
			if(*format == '*')
			{
				*format++;
				minlen = va_arg(args, int);
				if (minlen < 0)
				{
					minlen = -minlen;
					FLAGS |= LEFT;
				}
			}

		/* precision */
		if (*format == '.') {
			*format++;
			if(isdigit(*format))
			{
				while(isdigit(*format)) {
					temp[i++] = *format++;
				}
				temp[i] = 0;

				precision = atoi(temp);
				*format--;
				goto again;
			} else
				if (*format == '*')
				{
					*format++;
					precision = va_arg(args, int);
				}

			if (precision < 0)
				precision = 0;
		}

		/* modifiers */
		mod = -1;
		if (*format == 'h' || *format == 'l' || *format == 'L' || *format =='Z') {
			mod = *format;
			*format++;
			if (mod == 'l' && *format == 'l') {
				mod = 'L';
				*format++;
			}
		}

		/* type */
		switch(*format)
		{
			case 'c':
			   	c = va_arg(args, char);
				temp[0] = c; temp[1] = 0;
				_leading_chars(temp, end, PADCHAR, ISLEFT,  minlen);

				for(i=0; i<strlen(temp); i++) {
					if(str<=end)
						*str++ = temp[i];
					else
						goto end;
				}

				*format++;
			   	continue;

			case 's':
				s = va_arg(args, char*);
				if(!s)
					s = "<NULL>";

				for(i=0; i<strlen(s); i++)
					temp[i] = s[i];
				temp[i] = 0;

				_leading_chars(temp, end, PADCHAR, ISLEFT,  minlen);

				for(i=0; i<strlen(temp); i++) {
					if(str<=end)
						*str++ = temp[i];
					else
						goto end;
				}

				*format++;
			   	continue;

			case '%':
				*str++ = '%';
				*format++;
				continue;

			case 'n':
				ip = va_arg(args, int*);
				*ip = str - buffer;
				*format++;
				continue;

			case 'p':
				if (minlen == -1)
					minlen = sizeof(void*);
				FLAGS |= 0x1;
				FLAGS &= 0xef;
				FLAGS |= LARGE;
				_makestr(temp, end,
						(unsigned int) va_arg(args, void*), 16, precision, &FLAGS);
				_leading_chars(temp, end, PADCHAR, 0, minlen);

				for(i=0; i<strlen(temp); i++) {
					if(str<=end)
						*str++ = temp[i];
					else
						goto end;
				}
				*format++;
				continue;


			/* numbers, set flags and break */
			case 'i':
		   	case 'd':
				FLAGS |= SIGN;

			case 'u':
				base = 10;
				break;

			case 'X':
				FLAGS |= LARGE;

			case 'x':
				base = 16;
			    break;

			case 'o':
				base = 8;
			   	break;

			/* nothing after % :| */
			default:
			   	goto again;

    	}

		/* numbers break to here             */
		/* What type to grab from the stack? */
		if (mod == 'L')
			num = va_arg(args, unsigned int);
		else if (mod == 'l') {
			num = va_arg(args, unsigned int);
			if (FLAGS & SIGN)
				num = (signed int) num;
		} else if (mod == 'Z') {
			num = va_arg(args, size_t);
		} else if (mod == 'h') {
			num = (unsigned short) va_arg(args, int);
			if (FLAGS & SIGN)
				num = (signed short) num;
		} else {
			num = va_arg(args, unsigned int);
			if (FLAGS & SIGN)
				num = (signed int) num;
		}

		if(!_makestr(temp, end, num, base, precision, &FLAGS)) goto end;
		_leading_chars(temp, end, PADCHAR, ISLEFT, minlen);

		for(i=0; i<strlen(temp); i++)
		{
			if(str<=end)
				*str++ = temp[i];
			else
				goto end;
		}

		*format++;

    }
	end:
	*str = 0;

	return str-buffer;

}

/*
 *	snprintf - same as vsnprintf, but it takes normal arguments,
 *	instead of a va_list.
 *	#buffer: buffer to place the string in
 *	#size: size of the given buffer (including \0 !)
 *	#format: format of the string
 *	#...: the args
 */
int snprintf(char* buffer, int size, const char* format, ...)
{
	va_list args;
	int i;

	va_start(args, format);
	i = vsnprintf(buffer, size, format, args);
	va_end(args);

	return i;
}

/*
 *	sprintf - same as snprintf, but no size in arguments,
 *	other arguments are the same
 */
int sprintf(char* buffer, const char* format, ...)
{
	va_list args;
	int i;

	va_start(args, format);
	i = vsnprintf(buffer, 0xFFFF, format, args);
	va_end(args);

	return i;
}

int printf(const char *format, ...)
{
	va_list args;
	int i;
	char printbuf[1024];

	va_start(args, format);
	i = vsnprintf(printbuf, 0xFFFF, format, args);
	print(printbuf);
	va_end(args);

	return i;
}

int print(const char *str)
{
	while(*str)
		putc(*str++);
}
