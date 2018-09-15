bits 32

%define DIVIDE_ERROR    0
%define NMI             2
%define BREAKPOINT      3
%define OVERFLOW        4
%define BOUND_CHECK     5
%define INVALID_OPCODE  6
%define DEVICE_NA       7
%define DOUBLE_FAULT    8
%define INVALID_TSS     10
%define SEGMENT_NA      11
%define STACK_FAULT     12
%define GPF             13
%define PAGE_FAULT      14
%define FPU             16
%define ALIGNMENT_CHECK 17
%define MACHINE_CHECK   18
%define SIMD            19

extern _HALInterruptHandler
; extern _stack_start

global _isr_return

segment .text

%macro interrupt 2
global _interrupt_%1
	align 16
_interrupt_%1:
%if (%2 == 0)
	push dword 0
%endif	
	push dword %1
	jmp _isr
%endmacro

; exceptions 0 - 20, some of which are reserved

interrupt DIVIDE_ERROR, 0
interrupt 1, 0
interrupt NMI, 0
interrupt BREAKPOINT, 0
interrupt OVERFLOW, 0
interrupt BOUND_CHECK, 0
interrupt INVALID_OPCODE, 0
interrupt DEVICE_NA, 0
interrupt DOUBLE_FAULT, 1
interrupt 9, 0
interrupt INVALID_TSS, 1
interrupt SEGMENT_NA, 1
interrupt STACK_FAULT, 1
interrupt GPF, 1
interrupt PAGE_FAULT, 1
interrupt 15, 0
interrupt FPU, 0
interrupt ALIGNMENT_CHECK, 1
interrupt MACHINE_CHECK, 0
interrupt SIMD, 0

; 20-31 exceptions are reserved by Intel
; setup hardware interrupt handlers (32-47)
; plus a syscall (48)

%assign i 20
%rep 29
interrupt i, 0
%assign i (i + 1)
%endrep

global _isr_stack
_isr_stack dd 0
global _reentrance
_reentrance dd 0

; extern _GetCurrentThread

	align 16
_isr:
	pushad
	push ds
	push es
	push fs
	push gs
	mov ax, ss
	mov ds, ax
	mov es, ax
	mov fs, ax	
	mov gs, ax
	mov ebx, esp
;	cmp dword [_reentrance], 0
;	jnz skip_isr_stack
;	mov esp, [_isr_stack]	
	push ebx
;	call _GetCurrentThread
	pop ebx
;	mov [eax], ebx             ; current_thread->context = esp;
skip_isr_stack:
	inc dword [_reentrance]
	push ebx                   ; push (context_t *context)
	call _HALInterruptHandler
	add esp, 4                 ; skip "push ebx"
	dec dword [_reentrance]		
	cmp eax, 0
	jz isr_flush
_isr_return:
	mov esp, eax
isr_flush:
	pop gs
	pop fs
	pop es
	pop ds
	popad
	add esp, 8                ; skip interrupt and code numbers
	iretd
