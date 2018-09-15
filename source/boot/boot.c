/* memory layout after loading kernel:
   0xD000:   MEM_INFO_BUFFER -> memory info
   0xE000:   CFG_FILE_ADDR   -> BOOTCFG file
   0xF000:   MODULE_ARRAY    -> array of loaded modules
   0x10000:  ALLOC_ADDR      -> loaded modules
   
   kernel environment:
   pmode, paging
   address: 0x100000 (1 MB)
   stack:   0xD000
   gdt:     0x8000 + gdt (bootldr.asm)
*/

#include "boot.h"
#include "printf.h" /* S V's printf */
#include "fat.h"

static void LoadConfigFile();
static void CheckFileSystem();
static void GetBIOSExtensions();
static void GetActivePartition();
static void LoadBootSector(u32_t LBA);
static void LoadModule(char *filename);
static void InitVolume();
static void check(int status);

static disk_t disk;
static partition_t partition, *table_ptr = (partition_t *) TABLE_OFFSET;
static readpacket_t rpacket;
static extinfo_t extinfo;
static int fstype, biosext = 0;
static u8_t driveflags = 0;

void b_main()
{
	char buf[512], *s;
	u8_t old_boot_drive = boot_drive;

	ClearScreen();	

	if(!DetectCPU())
		panic("only i486 and newer processors are supported.");

	printf("Cube bootloader version %d.%d\n\n" \
	       "Boot device information:\n" \
	       " - Boot device: %s %d (id: 0x%02X)\n", \
	       MAJOR_VERSION, MINOR_VERSION, \
	       BOOT_DEV_NAME, (boot_drive & 1) + 1, boot_drive);

	InitVolume();	
	LoadConfigFile();

	/* read options */
	if(SetSection("[options]"))
	{
		while(ReadLine(buf, sizeof(buf) - 1))
		{
			s = (char *) strchr(buf, '=');
			*s++ = '\0';

			if(!strcmp(buf, "bootdrive"))
			{
				if(!strcmp(s, "fd0"))
					boot_drive = 0;
				else if(!strcmp(s, "fd1"))
					boot_drive = 1;		
				else if(!strcmp(s, "hd0"))
					boot_drive = HARDDISK;
				else if(!strcmp(s, "hd1"))
					boot_drive = HARDDISK | 1;
			
				if(old_boot_drive != boot_drive)
				{
					printf(" - Loading modules from: %s %d (id: 0x%02X)\n", 
					BOOT_DEV_NAME, (boot_drive & 1) + 1, boot_drive);
				       
				}

				InitVolume();
			}	
   		}
   	}
	
	LoadModule(KERNEL);

	/* we now check whether we have enough extended memory */
	if(!EnoughMemory((u16_t) MEM_REQUIRED * 1024) /*bytes2kb(((module_t *) MODULE_ARRAY)->size))*/)
		panic("not enough extended memory to load kernel");	
	
	/* load modules */
	if(SetSection("[modules]"))
	{
		while(ReadLine(buf, sizeof(buf) - 1))
			LoadModule(buf);
	}
}

static void LoadConfigFile()
{
	direntry_t fileinfo;

	printf("\t - Loading configuration file \"%s\" ... ", BOOTCFG);
	LoadFile(BOOTCFG, &fileinfo, (u16_t) segment(CFG_FILE_ADDR));
	printf("done\n");	

	if(fileinfo.file_size >= MAX_CFG_SIZE)
		panic("configuration file must be < 4 KB");
}

static void InitVolume()
{
	check(GetDiskInfo(&disk));
	disk.bytes_per_sec = DEFAULT_SEC_SZ;	
	
	/* load a boot sector of the drive (MBR on hdd) */  
	LoadBootSector((u32_t) BOOT_SECTOR);
	
	if(ISHARDDISK) 
	{
		GetBIOSExtensions();
		GetActivePartition();
	}

	CheckFileSystem();
}

static void LoadModule(char *filename)
{
	static u32_t addr = ALLOC_ADDR;
	static module_t *module = (module_t *) MODULE_ARRAY;	
	direntry_t fileinfo;	

	printf("\t - Loading file \"%s\" ... ", filename);
	LoadFile(filename, &fileinfo, (u16_t) segment(addr));
	printf("done\n");	
	
	module->address = addr;
	/* all loaded files are aligned on PAGE_SIZE boundary */	
	module->size = PAGE_ALIGN(fileinfo.file_size);
	strncpy(module->name, filename, MAX_NAME_LEN);

	addr += module->size;
	memset(++module, 0, sizeof(module_t));
}

static void CheckFileSystem()
{
	fstype = GetFATType(&partition, &disk);	   

	printf(" - File system: %s", FSNAMES[fstype]);
	if(ISHARDDISK)
		printf(" (type: 0x%02X)", partition.type);
	putc('\n');

	if(fstype == UNKNOWN)
		panic("Unknown file system");
}

static void GetBIOSExtensions()
{
	biosext = GetExtVersion();

	printf("\t - BIOS extensions: ");
	if(biosext)
	{
		extinfo.size = EXT_INFO_SIZE;
		check(GetExtInfo(&extinfo, &driveflags));

		printf("Available (version 0x%02X, LBA: %s)\n", \
		       biosext, driveflags & LBA_FLAG? "Yes": "No");

		rpacket.reserved = 0;
		rpacket.size = RD_PACKET_SIZE;
		rpacket.start_high = 0;
		rpacket.buf_off = 0;
	}
	else
		printf("Not available\n");
}

static void GetActivePartition()
{
	int i;

	printf("\t - Looking for active partition... ");
	for(i = 0; i < 4; i++)
	{
		if(i == 3)
			panic("No active primary partition found");

		if(table_ptr[i].active & P_ACTIVE)
		{
			/* partition table doesn't have a "size" variable, that's why "- sizeof(u32_t)" */
			memcpy(&partition, &table_ptr[i], sizeof(partition_t) - sizeof(u32_t));
			partition.size = partition.end_lba - partition.start_lba;
			printf("found\n");
			
			break;
		}
	}

	switch(partition.type)
	{
		case 0x1: /* FAT12 */
		case 0x4: /* FAT16 */
		case 0x6: /* FAT16 */
		case 0xB: /* FAT32 */
		case 0xC: /* FAT32 */
		          /* read the boot sector of the active partition */
		          LoadBootSector(partition.start_lba);
		          break;
		default:  fstype = UNKNOWN;
	}		
}

static void LoadBootSector(u32_t LBA)
{
	/* read the first sector of the BootDrive to address 0x500 (es=0x50) */
	ReadSectorLBA(LBA, segment(MBR_ADDRESS));

	if(*((u16_t *) BOOTSIG_OFFSET) != (u16_t) BOOTSIG)
		panic("Boot sector doesn't have a signature");
}

void ReadSectorLBA(u32_t LBA, u16_t es)
{
	u16_t head, cyl, sec, tmp;
	int status, n; 

	if(ISHARDDISK && biosext && (driveflags & LBA_FLAG))
	{
		rpacket.blocks_num = 1;
		rpacket.buf_seg = es;
		rpacket.start_low = LBA;

		status = ReadSectorExt(&rpacket);
	}
	else
	{
		n = ISHARDDISK ? 0: 3; /* 3 retries for floppy */

		sec = LBA % disk.sectors_per_trk + 1;
		cyl = (LBA / disk.sectors_per_trk) / disk.heads;
		head = (LBA / disk.sectors_per_trk) % disk.heads;

		do {
			  status = ReadSector(cyl, sec, head, es);
			  
			  if(status && !ISHARDDISK)
			  	  check(ResetDrive());
		} while(n-- && status); 
	}

	check(status);
}

static void check(int status)
{
	disk_error_t *err = (disk_error_t *) disk_errors;

	if(status)
	{
		do {
			if(status == err->number)
				panic(err->str);
		} while((++err)->number);
		
		panic("unknown problem with \"INT 13\" interface");		
	}
}

void panic(char *str)
{
	print("\n\nERROR: ");
	print(str);
	print("\nPress any key to reboot...");
	getc();
	reboot();
}

