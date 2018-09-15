#include <stdlib.h>
#include <conio.h>
#include <mem.h>
#include <stdio.h>
#include <dos.h>
#include <pc.h>

char *filter[] = {"*.c", "*.cpp", "*.h", "*.asm", NULL};	

int main()
{
	struct find_t s;
	FILE *fp;
	int total = 0;
	int item = 0;

	while(filter[item])
	{
		if(_dos_findfirst(filter[item], 0, &s)) 
		{
			item++;
			continue;
		}

		do {
			fp = fopen(s.name, "r");
			do {
				if(fgetc(fp) == '\n')
					total++;
			} while(!feof(fp));
		
			fclose(fp);		
		} while(!_dos_findnext(&s));
		
		item++;
	}

	printf("Total lines: %d", total);

	return 0;
}
