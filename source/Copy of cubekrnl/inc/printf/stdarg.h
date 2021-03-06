// stdarg.h

// defines:

#ifndef STDARG_H
#define STDARG_H

#include <types.h>

// if your wondering where LASTARG is defined, I think the compile does it.
#define	va_start( AP, LASTARG )	\
	( AP = ( ( va_list ) & ( LASTARG ) + VA_SIZE( LASTARG ) ) )

// same with TYPE
#define va_arg( AP, TYPE )						\
 ( AP += __va_rounded_size ( TYPE ),					\
  * ( ( TYPE * ) ( AP - __va_rounded_size ( TYPE ) ) ) )

#define __va_rounded_size( TYPE )  \
  ( ( ( sizeof ( TYPE ) + sizeof ( long ) - 1 ) / sizeof ( long ) ) * sizeof ( long ) )

#define	VA_SIZE( TYPE )					\
	( ( sizeof( TYPE ) + sizeof( STACKITEM ) - 1 )	\
		& ~( sizeof( STACKITEM ) - 1 ) )

#define	STACKITEM	int

#define va_end(AP)

// typedefs:
typedef unsigned char *va_list;

#endif

// End of stdarg.h
