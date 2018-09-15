#ifndef _BOOT_H_
#define _BOOT_H_

#include "types.h"
#include "bootldr.h"

#define BOOTCFG         "boot.cfg"
#define BOOT_DEV_NAME   ISHARDDISK? "Hard disk drive": "Floppy disk drive"

typedef struct
{
	u16_t heads;
	u16_t tracks;
	u16_t sectors_per_trk;
	u16_t bytes_per_sec;
} disk_t;

typedef struct
{
	u8_t  size;
	u8_t  reserved;
	u16_t blocks_num;
	u16_t buf_off;
	u16_t buf_seg;
	u32_t start_low;
	u32_t start_high;
} readpacket_t;

typedef struct
{
	u16_t size;
	u16_t flags;
	u32_t cylinders;
	u32_t heads;
	u32_t sectors_per_trk;
	u32_t sectors_low;
	u32_t sectors_high;
	u16_t bytes_per_sec;
	u32_t cfg_buffer;
} extinfo_t;

typedef struct
{
	u8_t  active;
	u8_t  head_start;
	u16_t cyl_sec_tart;
	u8_t  type;
	u8_t  head_end;
	u16_t cyl_sec_end;
	u32_t start_lba;
	u32_t end_lba;
	u32_t size;
} partition_t;

typedef struct
{
	char number;
	char *str;
} disk_error_t;

/* imported variables */
extern u8_t boot_drive;

/* imported functions */
extern char getc();
extern void reboot();
extern u16_t ResetDrive();
extern u16_t ReadSector(u16_t track, u16_t sector, u16_t head, u16_t es);
extern u16_t ReadSectorExt(readpacket_t *packet);
extern int GetDiskInfo(disk_t *disk);
extern int GetExtVersion();
extern int GetExtInfo(extinfo_t *extinfo, u8_t *driveflags);
extern int DetectCPU();
extern int EnoughMemory(u16_t kb);

/* global functions */
void ReadSectorLBA(u32_t LBA, u16_t es);
void ClearScreen();
void panic(char *str);

const char *FSNAMES[] = {"Unknown", "FAT12", "FAT16", "FAT32"};
const disk_error_t 
	  disk_errors[] = {{0x01, "invalid function in AH or invalid parameter"},
                       {0x02, "address mark not found"},
                       {0x03, "disk write-protected"},
                       {0x04, "sector not found/read error"},
                       {0x05, "reset failed (hard disk)"},
                       {0x06, "disk changed (floppy)"},
                       {0x07, "drive parameter activity failed (hard disk)"},
                       {0x08, "DMA overrun"},
                       {0x09, "data boundary error (attempted DMA across 64K boundary or >80h sectors)"},
                       {0x0A, "bad sector detected (hard disk)"},
                       {0x0B, "bad track detected (hard disk)"},
                       {0x0C, "unsupported track or invalid media"},
                       {0x0D, "invalid number of sectors on format (PS/2 hard disk)"},
                       {0x0E, "control data address mark detected (hard disk)"},
                       {0x0F, "DMA arbitration level out of range (hard disk)"},
                       {0x10, "uncorrectable CRC or ECC error on read"},
                       {0x11, "data ECC corrected (hard disk)"},
                       {0x20, "controller failure"},
                       {0x31, "no media in drive (IBM/MS INT 13 extensions)"},
                       {0x32, "incorrect drive type stored in CMOS (Compaq)"},
                       {0x40, "seek failed"},
                       {0x80, "timeout (not ready)"},
                       {0xAA, "drive not ready (hard disk)"},
                       {0xB0, "volume not locked in drive (INT 13 extensions)"},
                       {0xB1, "volume locked in drive (INT 13 extensions)"},
                       {0xB2, "volume not removable (INT 13 extensions)"},
                       {0xB3, "volume in use (INT 13 extensions)"},
                       {0xB4, "lock count exceeded (INT 13 extensions)"},
                       {0xB5, "valid eject request failed (INT 13 extensions)"},
                       {0xB6, "volume present but read protected (INT 13 extensions)"},
                       {0xBB, "undefined error (hard disk)"},
                       {0xCC, "write fault (hard disk)"},
                       {0xE0, "status register error (hard disk)"},
                       {0xFF, "sense operation failed (hard disk)"},
                       {0, 0}};
                             
#endif
