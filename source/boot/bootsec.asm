;=========================================================================;
; First Stage BootLoader v0.9                                             ;
; - by Serge Mastepanov                                                   ;
;                                                                         ;
; Description:                                                            ;
; Uses FAT12 file system to load and execute "cubeldr" file at            ;
; address 8000h (second stage bootloader).                                ;
;                                                                         ;
; Notes:                                                                  ;
; - There may be problems with other than 1.44 MB floppies,               ;
;   currently tested only with 3,5 inch (1.44) floppy format              ;
; - "cubeldr" should weight not more than 65536 bytes (more than enough)  ;
;   (if this bothers you: change "readsec" so that it would use es,       ;
;   instead of bx)                                                        ;
;                                                                         ;
; Updates:                                                                ;
; - Dec. 18, 2003 - added BootDrive variable                              ;
; - June 16, 2003 - file created                                          ;
;=========================================================================;

bits 16
org 0x7C00

%define CheckBootSignature

ATTR_DIRECTORY     equ 0x10
BOOTLDR_ADDR       equ 0x8000             ; where to load cubeldr

start:
	jmp short main
	nop

	BS_OEMName     db 'MSWIN4.1'
	BPB_BytsPerSec dw 512
	BPB_SecPerClus db 1
	BPB_RsvdSecCnt dw 1
	BPB_NumFATs    db 2
	BPB_RootEntCnt dw 0xE0
	BPB_TotSec16   dw 2880
	BPB_Media      db 0xF0
	BPB_FATSz16    dw 9
	BPB_SecPerTrk  dw 18
	BPB_NumHeads   dw 2
	BPB_HiddSec    dd 0
	BPB_TotSec32   dd 0
	BS_DrvNum      db 0
	BS_Reserved1   db 0
	BS_BootSig     db 0x29
	BS_VolID       dd 0xB007AB1E
	BS_VolLab      db 'BootDisk   '
	BS_FilSysType  db 'FAT12   '

	BootDrive      db 0
main:
	xor ax, ax
	mov cs, ax
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov sp, 0x7C00

	mov [BootDrive], dl

	call cls

	mov si, loadingmsg
	call print

	mov bx, 0x500
	mov ax, [BPB_FATSz16]
	mul byte [BPB_NumFATs]
	mov si, ax
	mov ax, [BPB_RsvdSecCnt]
	push si                               ; save FAT size
	call readsec                          ; read FAT

	mov si, [BPB_RootEntCnt]
	shr si, 4                             ; (BPB_RootEntCnt*32)/512, si - sectors used by root dir.
	pop ax                                ; load FAT size
	add ax, [BPB_RsvdSecCnt]
	mov cx, ax
	add cx, si
	push cx                               ; save data offset (in sectors)
	add bx, 0x500
	push bx
	call readsec                          ; read root dir.
	pop bx
	
	mov cx, [BPB_RootEntCnt]
	cld
find:                                         ; search for cubeldr
	push cx
	mov si, bootfile
	mov di, bx
	mov cx, 11
	repz cmpsb
	pop cx
	jz found
	add bx, 0x20
	loop find

notfound:                                     ; in case we didn't find boot.sys file
	call cls
	mov si, notfoundmsg
	jmp restart

found:                                        ; bx should now be pointing to file's info in root table
	test byte [bx + 11], ATTR_DIRECTORY   ; is it a directory with the same name?
	jnz notfound

	mov dx, [bx + 26]                     ; dx - DIR_FstClusLO
	mov bx, (BOOTLDR_ADDR >> 4)
	mov es, bx
	xor bx, bx
	jmp readfile

readfile:
	pop ax                                ; load "data" offset
	push ax
	mov cx, dx
	call readclust
%ifdef CheckBootSignature
	cmp word [BOOTLDR_ADDR + 2], 0xAA55
	jnz noboot
%endif
next:
	mov di, dx
	shr di, 1
	add di, dx                            ; di = dx*1.5

	mov cx, [di + 0x500]
	call check
	pop ax
	push ax
	call readclust

	jmp next

check:
	test dx, 1
	jnz odd
	and cx, 0xFFF
	jmp fetch
odd:
	shr cx, 4
fetch:
	cmp cx, 0xFF8                         ; end of linked list of clusters?
	jae exec
	cmp cx, 0xFF7                         ; bad block?
	jz panic
	mov dx, cx                            ; get the next cluster
	ret

readclust:
	add ax, cx
	sub ax, 2
	mov si, 1
	call readsec
	ret

exec:
	call stop
	mov dl, [BootDrive]
	jmp BOOTLDR_ADDR

stop:                                         ; stop motor
	mov al, 0xC
	mov dx, 0x3F2
	out dx, al
	ret

%ifdef CheckBootSignature
noboot:
	mov si, nobootmsg
	jmp restart
%endif

; readsec function
; ax - sector number (LBA)
; es:bx - buffer
; si - how many sectors to read
; returns:
; bx - address of the last byte written + 1
; =========================================
readsec:
	mov bp, sp
	pusha
nextsec:
	push ax
	push bx
	xor dx, dx
	mov bx, [BPB_SecPerTrk]
	div bx
	mov cl, dl                            ; cl - sector number
	inc cl
	mov bl, [BPB_NumHeads]
	div bl
	mov ch, al                            ; ch - track number
	mov dh, ah                            ; dh - head
	pop bx
	xor dl, dl
	mov di, 3                             ; number of retries
	jmp retry
reset:
	xor ax, ax
	int 0x13
retry:
	or di, di
	jz panic
	dec di
	mov ax, 0x201
	int 0x13
	jc reset
	pop ax
	add bx, 0x200
	inc ax
	dec si
	jnz nextsec
	mov [bp - 8], bx
	popa
	ret

; panic function
; ==============
panic:
	mov si, errormsg
restart:
	call cls
	call stop
	call print
	call getch
	mov bx, 0x40
	mov ds, bx
	mov word [0x72], 0x1234
	jmp 0xFFFF:0x0000

; getch function
; ==============
getch:
	push ax
	xor ax, ax
	int 0x16
	pop ax
	ret

; cls function
; ============
cls:
	mov ax, 3
	int 0x10
	ret

; print function
; ds:si - pointer to string
; =========================
print:
	mov ah, 0xE
	xor bx, bx
	cld
nextc:
	lodsb
	or al, al
	jz done
	int 0x10
	jmp nextc
done:
	ret

	loadingmsg  db 'Loading...',0
	notfoundmsg db '"cubeldr" not found',0
	errormsg    db 'Error reading file',0
%ifdef CheckBootSignature
	nobootmsg   db '"cubeldr" is damaged',0
%endif
	bootfile    db 'CUBELDR    '

	times 512-($-$$)-2 db 0
	dw 0xAA55
