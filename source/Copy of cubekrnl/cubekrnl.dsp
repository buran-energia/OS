# Microsoft Developer Studio Project File - Name="cubekrnl" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Console Application" 0x0103

CFG=cubekrnl - Win32 Release
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "cubekrnl.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "cubekrnl.mak" CFG="cubekrnl - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "cubekrnl - Win32 Release" (based on "Win32 (x86) Console Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
RSC=rc.exe
# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "Release"
# PROP BASE Intermediate_Dir "Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Release"
# PROP Intermediate_Dir "Release"
# PROP Target_Dir ""
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_CONSOLE" /D "_MBCS" /YX /FD /c
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:console /machine:I386
# Begin Target

# Name "cubekrnl - Win32 Release"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Group "hal"

# PROP Default_Filter ""
# Begin Group "i386 hal"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\hal\i386\i386.c
# End Source File
# Begin Source File

SOURCE=.\hal\i386\isr.asm
# End Source File
# End Group
# Begin Source File

SOURCE=.\hal\hal.c
# End Source File
# End Group
# Begin Group "utils"

# PROP Default_Filter ""
# Begin Group "i386"

# PROP Default_Filter ""
# End Group
# Begin Source File

SOURCE=.\utils\utils.c
# End Source File
# End Group
# Begin Group "ke"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\ke\ke.c
# End Source File
# Begin Source File

SOURCE=.\ke\process.c
# End Source File
# Begin Source File

SOURCE=.\ke\thread.c
# End Source File
# End Group
# Begin Group "mm"

# PROP Default_Filter ""
# Begin Group "i386 mm"

# PROP Default_Filter ""
# Begin Source File

SOURCE=.\mm\i386\mmi386.c
# End Source File
# End Group
# Begin Source File

SOURCE=.\mm\mm.c
# End Source File
# End Group
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl"
# Begin Source File

SOURCE=.\inc\hal.h
# End Source File
# Begin Source File

SOURCE=.\inc\i386.h
# End Source File
# Begin Source File

SOURCE=.\inc\interrupts.h
# End Source File
# Begin Source File

SOURCE=.\inc\ke.h
# End Source File
# Begin Source File

SOURCE=.\inc\list.h
# End Source File
# Begin Source File

SOURCE=.\inc\mm.h
# End Source File
# Begin Source File

SOURCE=.\inc\mmi386.h
# End Source File
# Begin Source File

SOURCE=.\inc\process.h
# End Source File
# Begin Source File

SOURCE=.\inc\thread.h
# End Source File
# Begin Source File

SOURCE=.\inc\types.h
# End Source File
# Begin Source File

SOURCE=.\inc\utils.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# End Group
# Begin Source File

SOURCE=.\makefile
# End Source File
# End Target
# End Project
