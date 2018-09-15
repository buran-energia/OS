@echo off

cls

echo # Compiling...
tcc -c boot.c
if errorlevel 1 goto error
tcc -c fat.c
if errorlevel 1 goto error
tcc -c itoa.c
if errorlevel 1 goto error
tcc -c parse.c
if errorlevel 1 goto error
tcc -c printf.c
if errorlevel 1 goto error
tcc -c string.c
if errorlevel 1 goto error

gcc -c pmode.c -o pmode.obj
if errorlevel 1 goto error


nasm bootldr.asm -f obj -o bootldr.obj
if errorlevel 1 goto error
nasm bootsec.asm -f bin -o bootsec.bin
if errorlevel 1 goto error

copy *.obj out\

echo # Linking...
jloc jloc.ini cubeldr cubeldr.map
echo # COMPILATION SUCCESSFUL!
goto exit
:error
echo # COMPILATION STOPPED!
:exit
del *.obj
