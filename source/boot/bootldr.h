#ifndef _BOOTLDR_H_
#define _BOOTLDR_H_

#define KERNEL          "cubekrnl.exe"

#define MAJOR_VERSION   0
#define MINOR_VERSION   1

#define KERNEL_MODULE   0

#define MEM_REQUIRED    5                    /* extended mem in MB (max 64) */
#define DEFAULT_SEC_SZ  512
#define P_ACTIVE        0x80                 /* active partition test bit */
#define HARDDISK        0x80                 /* HDD bit */
#define TABLE_OFFSET    (MBR_ADDRESS + 446)  /* partition table offset */
#define BOOT_SECTOR     0
#define BOOTSIG         0xAA55               /* boot signature */
#define BOOTSIG_OFFSET  (MBR_ADDRESS + 510)
#define RD_PACKET_SIZE  0x10                 /* packet size for READ command (for bios ext.) */
#define EXT_INFO_SIZE   0x1E
#define LBA_FLAG        (1 << 6)
#define ISHARDDISK      (boot_drive & HARDDISK)

#define MBR_ADDRESS     0x500                /* where to store MBR */
#define ALLOC_ADDR      0x10000              /* where to store all loaded modules */
#define MODULE_ARRAY    0xF000               /* where our array of module_t will be stored */
#define CFG_FILE_ADDR   0xE000
#define MEM_INFO_BUFFER 0xD000
#define MAX_CFG_SIZE    0x1000               /* max boot.cfg file size */
#define MAX_ADDRESS     0x90000              /* this will be the limit for modules */
#define MAX_PAGE_ADDR   0x9F000

#define segment(x)      (x >> 4)
#define seg2phys(x)     (x << 4)
#define bytes2kb(x)     (x >> 10)

#define PAGE_SIZE       4096
#define PAGE_MASK       (PAGE_SIZE - 1)
#define PAGE_ALIGN(x)   (x + PAGE_MASK) & ~(PAGE_MASK)

#define DIR_SHIFT       22
#define TABLE_SHIFT     12
#define TABLE_MASK      0x3FF
#define PRESENT_PAGE    1
#define WRITABLE_PAGE   (1 << 1)
#define USER_PAGE       (1 << 2)

#define MAX_NAME_LEN    12

typedef struct
{
	u32_t address;
	u32_t size;
	char  name[MAX_NAME_LEN];
} module_t;

#endif
