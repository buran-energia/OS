#ifndef _FAT_H_
#define _FAT_H_

#include "types.h"
#include "boot.h"

#define UNKNOWN              0
#define FAT12                1
#define FAT16                2
#define FAT32                3

#define FAT_OFFSET           (MBR_ADDRESS + 0x24)
#define FAT_BUFFER           (MBR_ADDRESS + DEFAULT_SEC_SZ)  /* where to store FAT table (1024 bytes is enough) */
#define DIR_BUFFER           (FAT_BUFFER + DEFAULT_SEC_SZ * 2)  /* buffer used to hold clusters with dir entries   */

/* some FS related defines */
#define FAT12_MAX_CLUSTERS   4085
#define FAT16_MAX_CLUSTERS   65525

#define DIR_ENTRY_SIZE       sizeof(direntry_t)
#define ATTR_DIRECTORY       0x10

#define FAT12_ODD_SHIFT      4
#define FAT12_EVEN_MASK      0x0FFF
#define FAT12_LAST_CLUSTER   0x0FF8
#define FAT12_BAD_CLUSTER    0x0FF7

#define FAT16_LAST_CLUSTER   0xFFF8
#define FAT16_BAD_CLUSTER    0xFFF7

#define FAT32_CLUST_MASK     0x0FFFFFFF
#define FAT32_LAST_CLUSTER   0x0FFFFFF8
#define FAT32_BAD_CLUSTER    0x0FFFFFF7

typedef struct
{
	u8_t  jmp_boot[3];
	char  oem_name[8];
	u16_t byts_per_sec;
	u8_t  sec_per_clus;
	u16_t rsvd_sec_cnt;
	u8_t  num_fats;
	u16_t root_ent_cnt;
	u16_t tot_sec16;
	u8_t  media;
	u16_t fat_sz16;
	u16_t sec_per_trk;
	u16_t num_heads;
	u32_t hidd_sec;
	u32_t tot_sec32;	
} bpb_t;

typedef struct
{
	u8_t  drv_num;
	u8_t  reserved1;
	u8_t  boot_sig;
	u32_t vol_id;
	char  vol_lab[11];
	char  fil_sys_type[8];
} fat_t;

typedef struct
{
	u32_t fat_sz32;
	u16_t ext_flags;
	u16_t fs_ver;
	u32_t root_clus;
	u16_t fs_info;
	u16_t bk_boot_sec;
	u8_t  reserved[12];
	u8_t  drv_num;
	u8_t  reserved1;
	u8_t  boot_sig;
	u32_t vol_id;
	char  vol_lab[11];
	char  fil_sys_type[8];
} fat32_t;

typedef struct
{
	char  name[11];
	u8_t  attr;
	u8_t  nt_res;
	u8_t  crt_time_tenth;
	u16_t crt_time;
	u16_t crt_date;
	u16_t lst_acc_date;
	u16_t fst_clus_hi;
	u16_t wrt_time;
	u16_t wrt_date;
	u16_t fst_clus_lo;
	u32_t file_size;
} direntry_t;

int GetFATType(partition_t *part_ptr, disk_t *disk_ptr);
void LoadFile(char *filename, direntry_t *entry, u16_t addr);

#endif
