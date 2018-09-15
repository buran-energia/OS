#ifndef _PE_H_
#define _PE_H_

#include <types.h>

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
    ushort   e_magic;                     // Magic number
    ushort   e_cblp;                      // Bytes on last page of file
    ushort   e_cp;                        // Pages in file
    ushort   e_crlc;                      // Relocations
    ushort   e_cparhdr;                   // Size of header in paragraphs
    ushort   e_minalloc;                  // Minimum extra paragraphs needed
    ushort   e_maxalloc;                  // Maximum extra paragraphs needed
    ushort   e_ss;                        // Initial (relative) SS value
    ushort   e_sp;                        // Initial SP value
    ushort   e_csum;                      // Checksum
    ushort   e_ip;                        // Initial IP value
    ushort   e_cs;                        // Initial (relative) CS value
    ushort   e_lfarlc;                    // File address of relocation table
    ushort   e_ovno;                      // Overlay number
    ushort   e_res[4];                    // Reserved ushorts
    ushort   e_oemid;                     // OEM identifier (for e_oeminfo)
    ushort   e_oeminfo;                   // OEM information; e_oemid specific
    ushort   e_res2[10];                  // Reserved ushorts
    ulong    e_lfanew;                    // File address of new exe header
} IMAGE_DOS_HEADER, *PIMAGE_DOS_HEADER;
  
typedef struct IMAGE_FILE_HEADER {
    ulong    Signature;
    ushort   Machine;
    ushort   NumberOfSections;
    ulong    TimeDateStamp;
    ulong    PointerToSymbolTable;
    ulong    NumberOfSymbols;
    ushort   SizeOfOptionalHeader;
    ushort   Characteristics;
} IMAGE_FILE_HEADER, *PIMAGE_FILE_HEADER;  

// Directory format.
typedef struct _IMAGE_DATA_DIRECTORY {
    ulong    VirtualAddress;
    ulong    Size;
} IMAGE_DATA_DIRECTORY, *PIMAGE_DATA_DIRECTORY;

// Optional header format.
typedef struct _IMAGE_OPTIONAL_HEADER {
    // Standard fields.
    ushort   Magic;
    uchar    MajorLinkerVersion;
    uchar    MinorLinkerVersion;
    ulong    SizeOfCode;
    ulong    SizeOfInitializedData;
    ulong    SizeOfUninitializedData;
    ulong    AddressOfEntryPoint;
    ulong    BaseOfCode;
    ulong    BaseOfData;
    
    // NT additional fields.
    ulong    ImageBase;
    ulong    SectionAlignment;
    ulong    FileAlignment;
    ushort   MajorOperatingSystemVersion;
    ushort   MinorOperatingSystemVersion;
    ushort   MajorImageVersion;
    ushort   MinorImageVersion;
    ushort   MajorSubsystemVersion;
    ushort   MinorSubsystemVersion;
    ulong    Win32VersionValue;
    ulong    SizeOfImage;
    ulong    SizeOfHeaders;
    ulong    CheckSum;
    ushort   Subsystem;
    ushort   DllCharacteristics;
    ulong    SizeOfStackReserve;
    ulong    SizeOfStackCommit;
    ulong    SizeOfHeapReserve;
    ulong    SizeOfHeapCommit;
    ulong    LoaderFlags;
    ulong    NumberOfRvaAndSizes;
    IMAGE_DATA_DIRECTORY DataDirectory[IMAGE_NUMBEROF_DIRECTORY_ENTRIES];
} IMAGE_OPTIONAL_HEADER32, *PIMAGE_OPTIONAL_HEADER32;

// Section header format.
typedef struct _IMAGE_SECTION_HEADER {
    uchar    Name[IMAGE_SIZEOF_SHORT_NAME];
    union {
            ulong   PhysicalAddress;
            ulong   VirtualSize;
    } Misc;
    ulong   VirtualAddress;
    ulong   SizeOfRawData;
    ulong   PointerToRawData;
    ulong   PointerToRelocations;
    ulong   PointerToLinenumbers;
    ushort  NumberOfRelocations;
    ushort  NumberOfLinenumbers;
    ulong   Characteristics;
} IMAGE_SECTION_HEADER, *PIMAGE_SECTION_HEADER;

// Export Format
typedef struct _IMAGE_EXPORT_DIRECTORY {
    ulong   Characteristics;
    ulong   TimeDateStamp;
    ushort  MajorVersion;
    ushort  MinorVersion;
    ulong   Name;
    ulong   Base;
    ulong   NumberOfFunctions;
    ulong   NumberOfNames;
    ulong   AddressOfFunctions;     // RVA from base of image
    ulong   AddressOfNames;         // RVA from base of image
    ulong   AddressOfNameOrdinals;  // RVA from base of image
} IMAGE_EXPORT_DIRECTORY, *PIMAGE_EXPORT_DIRECTORY;

typedef struct _IMAGE_IMPORT_DESCRIPTOR {
    union {
        ulong   Characteristics;            // 0 for terminating null import descriptor
        ulong   OriginalFirstThunk;         // RVA to original unbound IAT (PIMAGE_THUNK_DATA)
    };
    ulong   TimeDateStamp;                  // 0 if not bound,
                                            // -1 if bound, and real date\time stamp
                                            //     in IMAGE_DIRECTORY_ENTRY_BOUND_IMPORT (new BIND)
                                            // O.W. date/time stamp of DLL bound to (Old BIND)

    ulong   ForwarderChain;                 // -1 if no forwarders
    ulong   Name;
    ulong   FirstThunk;                     // RVA to IAT (if bound this IAT has actual addresses)
} IMAGE_IMPORT_DESCRIPTOR;

typedef struct IMAGE_IMPORT_BY_NAME {
    ushort   Hint;
    uchar    Name[1];
} IMAGE_IMPORT_BY_NAME, *PIMAGE_IMPORT_BY_NAME;

typedef struct IMAGE_THUNK_DATA {
    union {
        uchar *ForwarderString;
        ulong *Function;
        ulong Ordinal;
        PIMAGE_IMPORT_BY_NAME AddressOfData;
    } u1;
} IMAGE_THUNK_DATA;

typedef struct _IMAGE_BASE_RELOCATION {
    ulong   VirtualAddress;
    ulong   SizeOfBlock;
} IMAGE_BASE_RELOCATION;

#endif
