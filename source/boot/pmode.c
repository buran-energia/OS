/*
   some of this is false

   Bootloader will setup the following regions:
   Physical Address   Virtual Address   Size       Description
   ===========================================================
   0x00000000         0x00000000        0x100000   video memory, kernel modules
   0x00100000         0xC0100000        unknown    KERNEL
   0x00100000*        0xC0100000*       0x300000*  KERNEL HEAP, STACK
   0x00400000         0x00400000        unknown    MM

   * - this indicates that the value is based on other factors, like the kernel size
*/

#include "types.h"
#include "bootldr.h"
#include "pe.h"

#define KERNEL_START        0x100000
#define KERNEL_VIRT_START   0xC0100000

#define TEXT_MEM_SIZE       8000
#define TEXT_MEM_ADDR       0xB8000

#define GRAY_COLOR          7

#define FILE_IS_NOT_PE      "file is not in PE format"

#define memset(addr, value, length) \
        asm volatile("cld\n\t" \
                     "rep stosb" :: "D"(addr), "a"(value), "c"(length));
        
#define memcpy(src, dest, length) \
        asm volatile("cld\n\t" \
	             "rep movsb" :: "S"(src), "D"(dest), "c"(length));       

#define SetPageDir(page) \
	asm volatile("movl %%eax, %%cr3" :: "a"(page)); 

#define EnablePaging() \
	asm volatile("movl %cr0, %eax\n\t" \
	             "orl $1<<31, %eax\n\t" \
	             "movl %eax, %cr0");

#define SetESP(esp) \
	asm volatile("mov %%eax, %%esp" :: "a"(esp));

static u32_t kernel_entry, kernel_size, pagedir, page = MAX_ADDRESS;

static IMAGE_OPTIONAL_HEADER32 *opt_h;
static IMAGE_DOS_HEADER *dos_h;
static IMAGE_FILE_HEADER *file_h;
static IMAGE_SECTION_HEADER *sec_h;	

static void print(char *s)
{
	static u16_t *textmem = (u16_t *) TEXT_MEM_ADDR;

	while(*s)
		*textmem++ = *s++ | (GRAY_COLOR << 8);
}

static void panic(char *s)
{
	/* clear screen */
	memset((void *) TEXT_MEM_ADDR, 0, TEXT_MEM_SIZE);
	
	print("ERROR: ");
	print(s);
	
	for(;;);
}

static u32_t AllocPage()
{
	if(page == MAX_PAGE_ADDR)
		panic("MAX_PAGE_ADDR limit exceeded");
		
	page += PAGE_SIZE;
	
	return (page - PAGE_SIZE);
}

/* creates page dir/table */
static u32_t CreatePage()
{
	u32_t page = AllocPage();

	/* fill the page with 0's */
	memset((u32_t *) page, 0, PAGE_SIZE);

	return page;
}

static u32_t MMap(u32_t phys, u32_t virt, u32_t length, u32_t options)
{
	u32_t *pagetable, *pdir;

	length = (PAGE_ALIGN(length)) / PAGE_SIZE;
	phys &= ~PAGE_MASK;
	virt &= ~PAGE_MASK;	

	while(length--)
	{
		pdir = &((u32_t *) pagedir)[virt >> DIR_SHIFT];

		if(*pdir & PRESENT_PAGE)
		{
			pagetable = (u32_t *) (*pdir & ~PAGE_MASK);
		}
		else
		{
			pagetable = (u32_t *) CreatePage();
			if((u32_t) pagetable == (u32_t) -1)
				return 0;
				
			*pdir = options | (u32_t) pagetable;
		}

		pagetable[(virt >> TABLE_SHIFT) & TABLE_MASK] = options | phys;	
		
		phys += PAGE_SIZE;
		virt += PAGE_SIZE;
	}
	
	return 1;
}

static void LoadPEFile(u32_t addr, u32_t start, u32_t virtstart, u32_t options)
{
	dos_h = (IMAGE_DOS_HEADER *) addr;
	int i;

	if(dos_h->e_magic != IMAGE_DOS_SIGNATURE || !dos_h->e_lfanew)
		panic(FILE_IS_NOT_PE);
	
	file_h = (IMAGE_FILE_HEADER *) (addr + dos_h->e_lfanew);
	
	if(file_h->Signature != IMAGE_NT_SIGNATURE ||
	   file_h->SizeOfOptionalHeader != sizeof(IMAGE_OPTIONAL_HEADER32))
		panic(FILE_IS_NOT_PE);
		
	opt_h = (IMAGE_OPTIONAL_HEADER32 *) ((u32_t) file_h + sizeof(IMAGE_FILE_HEADER));
	sec_h = (IMAGE_SECTION_HEADER *) ((u32_t) opt_h + sizeof(IMAGE_OPTIONAL_HEADER32));

	memcpy(addr, start, opt_h->SizeOfHeaders);
//	MMap(start, virtstart, opt_h->SizeOfHeaders, PRESENT_PAGE | options);

	/* load sections */
	for(i = 0; i < file_h->NumberOfSections; i++)
	{
/*		MMap(start + sec_h[i].VirtualAddress,
		     virtstart + sec_h[i].VirtualAddress,
		     sec_h[i].Misc.VirtualSize,
		     (sec_h[i].Characteristics & IMAGE_SCN_MEM_WRITE ? WRITABLE_PAGE : 0) |
		     options | PRESENT_PAGE);
*/	
		memcpy(addr + sec_h[i].PointerToRawData,
		       start + sec_h[i].VirtualAddress,
		       sec_h[i].SizeOfRawData);	
	}
}

void pmode()
{
	module_t *module = (module_t *) MODULE_ARRAY;	

	pagedir = CreatePage();

	LoadPEFile(module[KERNEL_MODULE].address, KERNEL_START, KERNEL_VIRT_START, 0); /* KERNEL */
	kernel_entry = opt_h->AddressOfEntryPoint;
	kernel_size = opt_h->SizeOfImage;
	module[KERNEL_MODULE].address = KERNEL_START;
	module[KERNEL_MODULE].size = kernel_size;

	MMap(0, 0, 0x100000, PRESENT_PAGE | WRITABLE_PAGE);	
	MMap(0, 0xC0000000, 0x400000, PRESENT_PAGE | WRITABLE_PAGE);

	SetPageDir(pagedir);
	EnablePaging();

	((void (*)()) (KERNEL_VIRT_START + kernel_entry))();
}
