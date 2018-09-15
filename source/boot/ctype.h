#ifndef _CTYPE_H_
#define _CTYPE_H_

#define _tolower(c) (c|0x20)
#define _toupper(c) (c&0x5F)
#define _toascii(c) (c&0x7f)

#define _isupper(c) ((c>='A')&&(c<='Z'))
#define _islower(c) ((c>='a')&&(c<='z'))

#define isalpha(c) ((_isupper(c))||(_islower(c)))
#define isdigit(c) ((c>='0')&&(c<='9'))
#define isalnum(c) ((isalpha(c))||(isdigit(c)))

#define isascii(c) ((c>=0)&&(c<=127))
#define iscntrl(c) ((c>=0)&&(c<=31))
#define isprint(c) ((c>=31)&&(c<=127))
#define isgraph(c) ((isprint(c))&&(c!=' '))
#define islower(c) _islower(c)
#define isspace(c) (c==' ')
#define isupper(c) _isupper(c)
#define isxdigit(c) ((isdigit(c))||((_toupper(c)>='A')&&(_toupper(c)<='F')))

#define tolower(c) _tolower(c)
#define toupper(c) _toupper(c)
#define toascii(c) _toascii(c)

#endif 
