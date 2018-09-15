/* simple fat12/16/32 driver that is capable to detect a fat volume and to load files */

#include "fat.h"
#include "boot.h"
#include "string.h"

static int ConvertName(char *dest, char *src);
static direntry_t *FindFile(char *filename);
static void ReadFATSector(u32_t start, u16_t es);
static void ReadCluster(u32_t start, u16_t es);
static void ReadDataCluster(u32_t cluster, u16_t es);
static u32_t GetCluster(u32_t cluster);

static bpb_t *bpb = (bpb_t *) MBR_ADDRESS;
static fat_t *fat = (fat_t *) FAT_OFFSET;
static fat32_t *fat32 = (fat32_t *) FAT_OFFSET;
static partition_t *partition;
static disk_t *disk;
static int fstype;
static u32_t datastart, clustsize, rootstart;
static u32_t rootsize; /* FS root size in sectors */
static u32_t eoc, badclust;
/* this variable holds the current sector number of the fat table that is in memory */
static u32_t curfatsec;

int GetFATType(partition_t *part_ptr, disk_t *disk_ptr)
{
	u32_t datasize; /* size of the data region in clusters */
	u32_t fatsize;  /* size of one FAT in sectors */
	u32_t totalsec; /* total sectors occupied by the volume in sectors */

	/* by now all pointers (bpb, fat, fat32) should be correct */
	partition = part_ptr;
	disk = disk_ptr;
	totalsec = bpb->tot_sec16? bpb->tot_sec16: bpb->tot_sec32;
	fatsize = bpb->fat_sz16? bpb->fat_sz16: fat32->fat_sz32;
	
	/* check if this is a FAT file system */
	if( ((bpb->byts_per_sec != 512) && (bpb->byts_per_sec != 1024)  &&
	     (bpb->byts_per_sec != 2048) && (bpb->byts_per_sec != 4096)) ||
	     (bpb->byts_per_sec * bpb->sec_per_clus > 32768)
	     /* volume size should never be more than the size of a partition */
	     /* NOT TRUE? Windows doesn't complain about it */
	     /*(ISHARDDISK && totalsec > partition->size)*/ )
 	     return UNKNOWN;

 	rootsize = ((bpb->root_ent_cnt * DIR_ENTRY_SIZE) + (bpb->byts_per_sec - 1)) /
 	           bpb->byts_per_sec;
 	datastart = bpb->rsvd_sec_cnt + (bpb->num_fats * fatsize) + rootsize;
   	datasize = (totalsec - datastart) /  bpb->sec_per_clus;
   	rootstart = datastart - rootsize;
   	clustsize = bpb->sec_per_clus * bpb->byts_per_sec;

   	if(datasize < FAT12_MAX_CLUSTERS)
    	fstype = FAT12;
   	else if (datasize < FAT16_MAX_CLUSTERS)
    	fstype = FAT16;
   	else 
   	{
    	/* we only support version 0:0 of FAT32 */ 
    	if(fat32->fs_ver > 0)
    		return UNKNOWN;
    		
   		fstype = FAT32;
   	}
   	
	if(fstype == FAT12)
	{
 		eoc = FAT12_LAST_CLUSTER;
 		badclust = FAT12_BAD_CLUSTER;
	}
	else if(fstype == FAT16)
	{
		eoc = FAT16_LAST_CLUSTER;
 		badclust = FAT16_BAD_CLUSTER;
	}
	else
	{
		eoc = FAT32_LAST_CLUSTER;
		badclust = FAT32_BAD_CLUSTER;
	}
 
	curfatsec = 0;
          
 	return fstype;
}

/* converts "foobar.bar" to "FOOBAR  BAR", dest must be a MAX_NAME_LEN byte buffer */
static int ConvertName(char *dest, char *src)
{
	int i;	
		
	memset(dest, ' ', MAX_NAME_LEN - 1);
	dest[MAX_NAME_LEN - 1] = '\0';
	
	for(i = 0; i < strlen(src); i++)
	{
		if(src[i] == '.')
			break;
			
		/* it's a 8.3 format, you can't have a name more than 8 bytes */
		if(i > 8)
			return 0;
	}

	memcpy(dest, src, i);
	
	/* does this file has an extension? */
	if(i < strlen(src) - 1)
	{
		/* copy it, if so */
		strncpy(dest + 8, src + i + 1, 3); /* 8 bytes - file name, 3 bytes - extension */
	}
	
	_strupr(dest);	
	
	return 1;
}

/* takes the cluster from the FAT */
static u32_t GetCluster(u32_t cluster)
{
	u32_t fatsec, fatoffset, ret;
	
	if(fstype == FAT12)
		fatoffset = cluster + (cluster >> 1);
	else if(fstype == FAT16)
		fatoffset = cluster << 1;
	else
		fatoffset = cluster << 2;	
		
	fatsec = bpb->rsvd_sec_cnt + (fatoffset / bpb->byts_per_sec);
	/* load the fat sector if it's not already there */
	if(curfatsec != fatsec)
	{
		curfatsec = fatsec;
		ReadFATSector(fatsec, segment(FAT_BUFFER));
		
		/* read the next sector if it's fat12, it's the easiest
           way to deal with boundary issues */
		if(fstype == FAT12)
			ReadFATSector(fatsec + 1, segment(FAT_BUFFER + DEFAULT_SEC_SZ));
	}
	
	/* where is our cluster */
	fatoffset %= bpb->byts_per_sec;
	fatoffset += FAT_BUFFER;
	
	if(fstype == FAT12)
	{
		ret = *((u16_t *) fatoffset);
		if(cluster & 1) /* if the number is odd, we only need the high 12 bits */
			ret >>= FAT12_ODD_SHIFT;
		else      /* otherwise we need the low 12 bits */
			ret &= FAT12_EVEN_MASK;
	}
	else if(fstype == FAT16)
		ret = *((u16_t *) fatoffset);
	else /* if FAT32, we only need 28 bits */
		ret = (*((u32_t *) fatoffset)) & FAT32_CLUST_MASK;
		
	return ret;
}

/* searches for a file in the root dir */
static direntry_t *FindFile(char *filename)
{
	u32_t rootsectors, rootclust = 0;
	u16_t n;
	direntry_t *entry = 0;
	char fname[MAX_NAME_LEN];

	if(!ConvertName(fname, filename))
		return 0;
		
	/* where is the start of our root directory */
	if(fstype == FAT32)
	{
		rootclust = fat32->root_clus;
		/* how many bytes are occupied by the entries */		
		n = clustsize;
	}
	else
	{
		rootclust = rootstart; /* rootclust now holds the first sector of the root dir */
		/* how many root sectors do we have */
		/* we don't need this for FAT32, since root dir in FAT32 can be of a variable size */
		rootsectors = rootsize;
		n = bpb->byts_per_sec;		
	}

	/* scan the root dir */
	do {
		/* for FAT32 we read the whole cluster of root entries*/
		if(fstype == FAT32)	
		{
			/* no more root entries ? */
			if(rootclust >= FAT32_LAST_CLUSTER)
				break;
		
			ReadDataCluster(rootclust, segment(DIR_BUFFER));
			/* Get next cluster of the root dir */
			rootclust = GetCluster(rootclust);
		}
		else
		{
			/* no more root sectors? */
			if(!(rootsectors--))
				break;
		
			ReadFATSector(rootclust++, segment(DIR_BUFFER));
		}
		
		/* scan the entries for the specified name */
		for(entry = (direntry_t *) DIR_BUFFER; (u16_t) entry < DIR_BUFFER + n; entry++)
		{
			if(!strncmp(fname, entry->name, MAX_NAME_LEN - 1) && 
			   !(entry->attr & ATTR_DIRECTORY))
				return entry;
		}		
	} while(1);
	
	return 0;
}

static void ReadDataCluster(u32_t cluster, u16_t es)
{
	ReadCluster(datastart + (cluster - 2) * bpb->sec_per_clus, es);
}

static void ReadCluster(u32_t start, u16_t es)
{
	u32_t n = clustsize / disk->bytes_per_sec;
	
	while(n--)
	{
 		ReadFATSector(start, es);
 		es += segment(disk->bytes_per_sec);
 		start++;
	}
}

static void ReadFATSector(u32_t start, u16_t es)
{
	if(ISHARDDISK)
		start += partition->start_lba;

	ReadSectorLBA(start, es);
}

/* file will be loaded at [addr:0000] (addr = segment) */
void LoadFile(char *filename, direntry_t *entry, u16_t addr)
{
	direntry_t *fileinfo;
	u32_t clust;
	
	if(!(fileinfo = FindFile(filename)))
		panic("file not found");
	else if(((u32_t) seg2phys(addr)) + fileinfo->file_size > MAX_ADDRESS)
		panic("not enough free memory to load this file");
	else
	{
		memcpy(entry, fileinfo, DIR_ENTRY_SIZE);
		
		/* load the file into memory */
		clust = (u32_t) entry->fst_clus_lo | (((u32_t) entry->fst_clus_hi) << 16);
		
		if(!clust) /* return if file is empty */
			return;
		
		do {
			ReadDataCluster(clust, addr);
			clust = GetCluster(clust);
			addr += segment(clustsize);
		} while(clust < badclust);	

		if(clust == badclust)
			panic("bad cluster detected, file is damaged");
	}
}

