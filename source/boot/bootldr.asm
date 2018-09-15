;=========================================================================;
; Second Stage BootLoader (see "boot.c" for version number)               ;
; - by Serge Mastepanov                                                   ;
;                                                                         ;
; Description:                                                            ;
; Contains various functions used by "boot.c".                            ;
;                                                                         ;
; Updates:                                                                ;
; - June 20, 2003 - file created                                          ;
;=========================================================================;

bits 16

%define MEM_INFO_BUFFER  0xD000
%define MODULE_ARRAY     0xF000
%define BOOTLDR_STACK    0x7C00

%define code_sel         (1 << 3)
%define data_sel         (2 << 3)

extern _b_main
extern _pmode

global _boot_drive

global _putc
global _ClearScreen
global _getc
global _reboot
global _ResetDrive
global _ReadSector
global _GetDiskInfo
global _GetExtVersion
global _GetExtInfo
global _ReadSectorExt
global _SearchForFile
global LUDIV@
global LXMUL@
global LUMOD@
global LXLSH@
global LXURSH@
global _DetectCPU
global _EnoughMemory

_main:
	jmp short start
	dw 0xAA55
	_boot_drive db 0

	align 8
gdt:
	dd 0
	dd 0

	dd 0x0000FFFF   ; codeseg
	dd 0x00CF9A00   ; non-conforming | execute/read-only

	dd 0x0000FFFF   ; dataseg
	dd 0x00CF9200   ; read-write | expand-up

gdtr:
	dw (3*8)-1
	dd gdt

start:
	mov [_boot_drive], dl
	xor ax, ax
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, BOOTLDR_STACK

	call _b_main
	call GetMem

	mov al, 0xC
	mov dx, 0x3F2
	out dx, al

	lgdt [gdtr]

	cli
	in al, 0x70  ; disable NMI
	or al, 0x80
	out 0x70, al

	mov al, 0xD1 ; enable A20
	out 0x64, al
	mov al, 0xDF
	out 0x60, al

	mov eax, cr0
	and eax, ~0x60000000
	or al, 1
	mov cr0, eax

	mov ax, data_sel
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov esp, BOOTLDR_STACK

	call code_sel:_pmode

; void putc(char c)
_putc:
	push bp
	mov bp, sp
	mov ah, 0xE
	mov al, [bp + 4]
	xor bx, bx

	cmp al, 10
	jz newline

	cmp al, 9
	jz addtab

	int 0x10
endp:
	pop bp
	ret
newline:
	mov al, 13
	int 0x10
	mov al, 10
	int 0x10
	jmp endp
addtab:
	mov cx, 3
	mov al, ' '
addspace:
	int 0x10
	loop addspace
	jmp endp


; void clrscr()
_ClearScreen:
	mov ax, 3
	int 0x10
	ret

; char getc()
_getc:
	xor ax, ax
	int 0x16
	ret

; void reboot()
_reboot:
	mov bx, 0x40
	mov ds, bx
	mov word [0x72], 0x1234
	jmp 0xFFFF:0x0000	

; u16_t ResetDrive()
_ResetDrive:
	xor ah, ah
	mov dl, [_boot_drive]
	int 0x13
	shr ax, 8
	ret

; u16_t ReadSector(u16_t track, u16_t sector, u16_t head, u16_t es)
_ReadSector:
	push bp
	mov bp, sp
	mov ch, [bp + 4]
	mov cl, [bp + 5]
	shl cl, 6
	or cl, [bp + 6]
	mov dh, [bp + 8]
	mov dl, [_boot_drive]
	push es
	mov ax, [bp + 10]
	mov es, ax
	xor bx, bx
	mov ax, 0x201
	int 0x13
	shr ax, 8
	pop es
	pop bp
	ret

; int GetDiskInfo(disk_t *disk)
_GetDiskInfo:
	push bp
	mov bp, sp
	mov ah, 8
	mov dl, [_boot_drive]
	int 0x13
	jc geterr
	mov bx, [bp + 4]
	inc dh
	mov [bx], dh
	push cx
	shr cx, 8
	mov dl, cl
	shr dl, 6
	mov ch, dl
	mov [bx + 2], cx
	pop cx
	and cx, 0x3F
	mov [bx + 4], cx	
geterr:
	shr ax, 8		
	pop bp
	ret

; int GetExtVersion()
_GetExtVersion:
	mov ah, 0x41
	mov bx, 0x55AA
	mov dl, [_boot_drive]
	int 0x13
	jc noext
	shr ax, 8  ; ax - major version of extensions
	ret
noext:
	xor ax, ax
	ret

; we need, mostly, the driveflags in order to determine 
; whether the controller supports LBA addresing
; int GetExtInfo(extinfo_t *extinfo, u8_t *driveflags)
_GetExtInfo:
	push bp
	mov bp, sp
	mov ah, 0x48
	mov dl, [_boot_drive]
	mov si, [bp + 4]
	int 0x13
	jc noinfo
	cmp dword [si + 0x1A], 0x10FFEF     ; are EDD params available? (0xFFFF:0xFFFF)
	jz noflags
	mov bx, [si + 0x1A]                 ; bx - displacement to EDD params
	push es
	mov dx, [si + 0x1A+2]
	mov es, dx                          ; es - segment to EDD params
	mov cl, [es:bx + 4]                 ; es:bx - EDD configuration parameters, 4 - flags offset
	pop es
	jmp saveflags
noflags:
	mov cl, 10100000b                   ; default flags
saveflags:	
	mov di, [bp + 6]                      ; *driveflags
	mov [di], cl
noinfo:
	shr ax, 8	
	pop bp
	ret

; u16_t ReadSectorExt(readpacket_t *packet);
_ReadSectorExt:
	push bp
	mov bp, sp
	mov ah, 0x42
	mov dl, [_boot_drive]
	mov si, [bp + 4]
	int 0x13
	shr ax, 8
	pop bp
	ret

; this is rather a hack, Turbo C uses LUDIV@ to divide 32-bit numbers
; this will be a far call, so our params are at bp+6 instead of bp+4
LUDIV@:
	push bp
	mov bp, sp
	mov eax, [bp + 6]
	mov ecx, [bp + 10]
	xor edx, edx
	div ecx
	mov edx, eax
	shr edx, 16	
	pop bp	
	retf 8
	
LXMUL@:
	shl eax, 16
	shrd eax, edx, 16
	shl ebx, 16
	shrd ebx, ecx, 16
	mul ebx
	mov edx, eax
	shr edx, 16	
	retf
	
LUMOD@:
	push bp
	mov bp, sp
	mov eax, [bp + 6]
	mov ecx, [bp + 10]
	xor edx, edx
	div ecx
	mov eax, edx
	shr edx, 16	
	pop bp	
	retf 8
	
LXLSH@:
	shl eax, 16
	shrd eax, edx, 16
	shl eax, cl
	mov edx, eax
	shr edx, 16
	retf	
	
LXURSH@:
	shl eax, 16
	shrd eax, edx, 16
	shr eax, cl
	mov edx, eax
	shr edx, 16
	retf

; returns 0 if the processor is < i386
_DetectCPU:
	pushf                ; backup flags reg.
	pushf
	pop ax
	mov bx, ax
	xor ax, (1 << 14)
	push ax
	popf
	pushf
	pop ax
	popf                 ; restore flags reg.
	xor ax, (1 << 14)
	cmp ax, bx
	jz i386
	xor ax, ax
	ret
i386:
	mov ax, 1
	ret
	
; checks whether we have enough extended memory (in KB)
; returns 1 if we do have enough mem.
; int EnoughMemory(u16_t kb);
_EnoughMemory:
	push bp
	mov bp, sp
	mov ax, 0x8800
	int 0x15
	cmp ax, [bp + 4]
	jae is_enough
	xor ax, ax
	jmp exit_mem
is_enough:
	mov ax, 1
exit_mem:
	pop bp
	ret

; determine memory map/size
GetMem:
	push ds
	pop es
	mov di, (MEM_INFO_BUFFER + 4)
	xor ebx, ebx	
m_loop:
	mov eax, 0xE820
	mov ecx, 20
	mov edx, 0x534D4150             ; 'SMAP'
	int 0x15
	jc exit_E820
	cmp ecx, 20                     ; bios bug?
	jnz exit_E820
	cmp eax, 0x534D4150             ; function not supported? (if for some reason CF is clear)
	jnz exit_E820
	add di, 20
	or ebx, ebx
	jz exit_E820                    ; end of memory map?
	jmp m_loop
exit_E820:
	cmp di, (MEM_INFO_BUFFER + 4)   ; this will be equal only if E820 is not supported
	jz E820_na
	sub di, (MEM_INFO_BUFFER + 4)   ; what is the size of our memory map?
	mov word [MEM_INFO_BUFFER], 0xE820
	mov [MEM_INFO_BUFFER + 2], di
	ret
E820_na:                            ; if E820 is not available we use E801
	mov ax, 0xE801
	int 0x15
	jc E801_na
	mov word [MEM_INFO_BUFFER], 0xE801
	mov [MEM_INFO_BUFFER + 2], ax
	mov [MEM_INFO_BUFFER + 4], bx
	mov [MEM_INFO_BUFFER + 6], cx
	mov [MEM_INFO_BUFFER + 8], dx	
	ret
E801_na:                            ; if E801 is not available we use 88
	mov ax, 0x8800
	int 0x15	
	mov word [MEM_INFO_BUFFER], 0x8800
	mov [MEM_INFO_BUFFER + 2], ax
	ret
	

