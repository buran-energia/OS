#ifndef VesaH
#define VesaH

#define MODE_640x480x24 0x112
#define MODE_800x600x24 0x115
#define MODE_1024x768x24 0x118

typedef struct VBEINFO {
	char VBESignature[4];
	char VBEMinorVersion;
	char VBEMajorVersion;
	char *OEMStringPtr;
	char Capabilities[4];
	char *VideoModePtr;
	short TotalMemory;
	short OEMSoftwareRev;
	char *OEMVendorNamePtr;
	char *OEMProductNamePtr;
	char *OEMProductRevPtr;
	char Reserved[222];
	char OEMData[256];
};

typedef struct MODEINFO {
	short ModeAttributes;
	char WinAAttributes;
	char WinBAttributes;
	short WinGranularity;
	short WinSize;
	short WinASegment;
	short WinBSegment;
	void (*BankSwitch)();
	short BytesPerScanLine;
	short XResolution;
	short YResolution;
	char XCharSize;
	char YCharSize;
	char NumberOfPlanes;
	char BitsPerPixel;
	char NumberOfBanks;
	char MemoryModel;
	char BankSize;
	char NumberOfImagePages;
	char Reserved;
	char RedMaskSize;
	char RedFieldPosition;
	char GreenMaskSize;
	char GreenFieldPosition;
	char BlueMaskSize;
	char BlueFieldPosition;
	char RsvdMaskSize;
	char RsvdFieldPosition;
	char DirectColorModeInfo;
	char *PhysBasePtr;
	unsigned long Reserved2;
	short Reserved3;
	short LinBytesPerScanLine;
	char BnkNumberOfImagePages;
	char LinNumberOfImagePages;
	char LinRedMaskSize;
	char LinRedFieldPosition;
	char LinGreenMaskSize;
	char LinGreenFieldPosition;
	char LinBlueMaskSize;
	char LinBlueFieldPosition;
	char LinRsvdMaskSize;
	char LinRsvdFieldPosition;
	char MaxPixelClock;
	char Reserved4[189];
};

void GetVBEInfo(VBEINFO *vbeinfo);
void GetModeInfo(int mode, MODEINFO *modeinfo);
void SetVESAMode(int mode, int LFB);

extern MODEINFO modeinfo;

#endif
