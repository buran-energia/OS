#ifndef _PE_H_
#define _PE_H_

#include "types.h"

#define IMAGE_DOS_SIGNATURE                 0x5A4D      // MZ
#define IMAGE_NT_SIGNATURE                  0x00004550  // PE00

/* Directory Entries */
#define IMAGE_DIRECTORY_ENTRY_EXPORT         0   /* Export Directory */
#define IMAGE_DIRECTORY_ENTRY_IMPORT         1   /* Import Directory */
#define IMAGE_DIRECTORY_ENTRY_RESOURCE       2   /* Resource Directory */
#define IMAGE_DIRECTORY_ENTRY_EXCEPTION      3   /* Exception Directory */
#define IMAGE_DIRECTORY_ENTRY_SECURITY       4   /* Security Directory */
#define IMAGE_DIRECTORY_ENTRY_BASERELOC      5   /* Base Relocation Table */
#define IMAGE_DIRECTORY_ENTRY_DEBUG          6   /* Debug Directory */
#define IMAGE_DIRECTORY_ENTRY_COPYRIGHT      7   /* Description String */
#define IMAGE_DIRECTORY_ENTRY_GLOBALPTR      8   /* Machine Value (MIPS GP) */
#define IMAGE_DIRECTORY_ENTRY_TLS            9   /* TLS Directory */
#define IMAGE_DIRECTORY_ENTRY_LOAD_CONFIG   10   /* Load Configuration Directory */
#define IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT  11   /* Bound Import Directory in headers */
#define IMAGE_DIRECTORY_ENTRY_IAT           12   /* Import Address Table */

#define IMAGE_FILE_MACHINE_I386             0x014c  // Intel 386.  

#define IMAGE_NUMBEROF_DIRECTORY_ENTRIES    16

#define IMAGE_SIZEOF_SHORT_NAME              8

// Section characteristics.
#define IMAGE_SCN_CNT_CODE                   0x00000020  // Section contains code.
#define IMAGE_SCN_CNT_INITIALIZED_DATA       0x00000040  // Section contains initialized data.
#define IMAGE_SCN_CNT_UNINITIALIZED_DATA     0x00000080  // Section contains uninitialized data.
#define IMAGE_SCN_LNK_INFO                   0x00000200  // Section contains comments or some other type of information.
#define IMAGE_SCN_LNK_REMOVE                 0x00000800  // Section contents will not become part of image.
#define IMAGE_SCN_LNK_COMDAT                 0x00001000  // Section contents comdat.
#define IMAGE_SCN_NO_DEFER_SPEC_EXC          0x00004000  // Reset speculative exceptions handling bits in the TLB entries for this section.
#define IMAGE_SCN_GPREL                      0x00008000  // Section content can be accessed relative to GP
#define IMAGE_SCN_MEM_FARDATA                0x00008000
#define IMAGE_SCN_MEM_PURGEABLE              0x00020000
#define IMAGE_SCN_MEM_16BIT                  0x00020000
#define IMAGE_SCN_MEM_LOCKED                 0x00040000
#define IMAGE_SCN_MEM_PRELOAD                0x00080000
#define IMAGE_SCN_LNK_NRELOC_OVFL            0x01000000  // Section contains extended relocations.
#define IMAGE_SCN_MEM_DISCARDABLE            0x02000000  // Section can be discarded.
#define IMAGE_SCN_MEM_NOT_CACHED             0x04000000  // Section is not cachable.
#define IMAGE_SCN_MEM_NOT_PAGED              0x08000000  // Section is not pageable.
#define IMAGE_SCN_MEM_SHARED                 0x10000000  // Section is shareable.
#define IMAGE_SCN_MEM_EXECUTE                0x20000000  // Section is executable.
#define IMAGE_SCN_MEM_READ                   0x40000000  // Section is readable.
#define IMAGE_SCN_MEM_WRITE                  0x80000000  // Section is writeable.

#define IMAGE_ORDINAL_FLAG 0x80000000
#define IMAGE_ORDINAL(Ordinal) (Ordinal & 0xffff)

typedef struct _IMAGE_DOS_HEADER {       // DOS .EXE header
    u16_t   e_magic;                     // Magic number
    u16_t   e_cblp;                      // Bytes on last page of file
    u16_t   e_cp;                        // Pages in file
    u16_t   e_crlc;                      // Relocations
    u16_t   e_cparhdr;                   // Size of header in paragraphs
    u16_t   e_minalloc;                  // Minimum extra paragraphs needed
    u16_t   e_maxalloc;                  // Maximum extra paragraphs needed
    u16_t   e_ss;                        // Initial (relative) SS value
    u16_t   e_sp;                        // Initial SP value
    u16_t   e_csum;                      // Checksum
    u16_t   e_ip;                        // Initial IP value
    u16_t   e_cs;                        // Initial (relative) CS value
    u16_t   e_lfarlc;                    // File address of relocation table
    u16_t   e_ovno;                      // Overlay number
    u16_t   e_res[4];                    // Reserved u16_ts
    u16_t   e_oemid;                     // OEM identifier (for e_oeminfo)
    u16_t   e_oeminfo;                   // OEM information; e_oemid specific
    u16_t   e_res2[10];                  // Reserved u16_ts
    u32_t   e_lfanew;                    // File address of new exe header
} IMAGE_DOS_HEADER, *PIMAGE_DOS_HEADER;
  
typedef struct IMAGE_FILE_HEADER {
	u32_t   Signature;
    u16_t   Machine;
    u16_t   NumberOfSections;
    u32_t   TimeDateStamp;
    u32_t   PointerToSymbolTable;
    u32_t   NumberOfSymbols;
    u16_t   SizeOfOptionalHeader;
    u16_t   Characteristics;
} IMAGE_FILE_HEADER, *PIMAGE_FILE_HEADER;  

// Directory format.
typedef struct _IMAGE_DATA_DIRECTORY {
    u32_t   VirtualAddress;
    u32_t   Size;
} IMAGE_DATA_DIRECTORY, *PIMAGE_DATA_DIRECTORY;

// Optional header format.
typedef struct _IMAGE_OPTIONAL_HEADER {
    // Standard fields.
    u16_t   Magic;
    u8_t    MajorLinkerVersion;
    u8_t    MinorLinkerVersion;
    u32_t   SizeOfCode;
    u32_t   SizeOfInitializedData;
    u32_t   SizeOfUninitializedData;
    u32_t   AddressOfEntryPoint;
    u32_t   BaseOfCode;
    u32_t   BaseOfData;
    
    // NT additional fields.
    u32_t   ImageBase;
    u32_t   SectionAlignment;
    u32_t   FileAlignment;
    u16_t   MajorOperatingSystemVersion;
    u16_t   MinorOperatingSystemVersion;
    u16_t   MajorImageVersion;
    u16_t   MinorImageVersion;
    u16_t   MajorSubsystemVersion;
    u16_t   MinorSubsystemVersion;
    u32_t   Win32VersionValue;
    u32_t   SizeOfImage;
    u32_t   SizeOfHeaders;
    u32_t   CheckSum;
    u16_t   Subsystem;
    u16_t   DllCharacteristics;
    u32_t   SizeOfStackReserve;
    u32_t   SizeOfStackCommit;
    u32_t   SizeOfHeapReserve;
    u32_t   SizeOfHeapCommit;
    u32_t   LoaderFlags;
    u32_t   NumberOfRvaAndSizes;
    IMAGE_DATA_DIRECTORY DataDirectory[IMAGE_NUMBEROF_DIRECTORY_ENTRIES];
} IMAGE_OPTIONAL_HEADER32, *PIMAGE_OPTIONAL_HEADER32;

// Section header format.
typedef struct _IMAGE_SECTION_HEADER {
    u8_t    Name[IMAGE_SIZEOF_SHORT_NAME];
    union {
            u32_t   PhysicalAddress;
            u32_t   VirtualSize;
    } Misc;
    u32_t   VirtualAddress;
    u32_t   SizeOfRawData;
    u32_t   PointerToRawData;
    u32_t   PointerToRelocations;
    u32_t   PointerToLinenumbers;
    u16_t   NumberOfRelocations;
    u16_t   NumberOfLinenumbers;
    u32_t   Characteristics;
} IMAGE_SECTION_HEADER, *PIMAGE_SECTION_HEADER;

// Export Format
typedef struct _IMAGE_EXPORT_DIRECTORY {
    u32_t   Characteristics;
    u32_t   TimeDateStamp;
    u16_t   MajorVersion;
    u16_t   MinorVersion;
    u32_t   Name;
    u32_t   Base;
    u32_t   NumberOfFunctions;
    u32_t   NumberOfNames;
    u32_t   AddressOfFunctions;     // RVA from base of image
    u32_t   AddressOfNames;         // RVA from base of image
    u32_t   AddressOfNameOrdinals;  // RVA from base of image
} IMAGE_EXPORT_DIRECTORY, *PIMAGE_EXPORT_DIRECTORY;

typedef struct _IMAGE_IMPORT_DESCRIPTOR {
    union {
        u32_t   Characteristics;            // 0 for terminating null import descriptor
        u32_t   OriginalFirstThunk;         // RVA to original unbound IAT (PIMAGE_THUNK_DATA)
    };
    u32_t   TimeDateStamp;                  // 0 if not bound,
                                            // -1 if bound, and real date\time stamp
                                            //     in IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT (new BIND)
                                            // O.W. date/time stamp of DLL bound to (Old BIND)

    u32_t   ForwarderChain;                 // -1 if no forwarders
    u32_t   Name;
    u32_t   FirstThunk;                     // RVA to IAT (if bound this IAT has actual addresses)
} IMAGE_IMPORT_DESCRIPTOR;

typedef struct IMAGE_IMPORT_BY_NAME {
    u16_t   Hint;
    u8_t    Name[1];
} IMAGE_IMPORT_BY_NAME, *PIMAGE_IMPORT_BY_NAME;

typedef struct IMAGE_THUNK_DATA {
    union {
        u8_t  *ForwarderString;
        u32_t *Function;
        u32_t Ordinal;
        PIMAGE_IMPORT_BY_NAME AddressOfData;
    } u1;
} IMAGE_THUNK_DATA;

typedef struct _IMAGE_BASE_RELOCATION {
    u32_t   VirtualAddress;
    u32_t   SizeOfBlock;
} IMAGE_BASE_RELOCATION;

#endif

