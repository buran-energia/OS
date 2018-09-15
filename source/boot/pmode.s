	.file	"pmode.c"
	.data
	.align 4
_page:
	.long	589824
	.align 4
_textmem:
	.long	753664
	.text
.globl _kitoa
	.def	_kitoa;	.scl	2;	.type	32;	.endef
_kitoa:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$56, %esp
	movl	$0, -44(%ebp)
	cmpl	$0, 8(%ebp)
	jne	L2
	movl	12(%ebp), %eax
	movb	$48, (%eax)
	movl	12(%ebp), %eax
	incl	%eax
	movb	$0, (%eax)
	jmp	L1
L2:
	nop
L3:
	cmpl	$0, 8(%ebp)
	jne	L5
	jmp	L4
L5:
	movl	8(%ebp), %edx
	movl	$-858993459, %eax
	mull	%edx
	movl	%edx, %eax
	shrl	$3, %eax
	movl	%eax, -48(%ebp)
	movl	8(%ebp), %ecx
	movl	$-858993459, %eax
	mull	%ecx
	shrl	$3, %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -52(%ebp)
	movb	-52(%ebp), %al
	addl	$48, %eax
	movb	%al, -9(%ebp)
	movl	-48(%ebp), %eax
	movl	%eax, 8(%ebp)
	movl	-44(%ebp), %eax
	leal	-8(%ebp), %edx
	addl	%edx, %eax
	leal	-32(%eax), %edx
	movb	-9(%ebp), %al
	movb	%al, (%edx)
	leal	-44(%ebp), %eax
	incl	(%eax)
	jmp	L3
L4:
	movl	-44(%ebp), %eax
	addl	12(%ebp), %eax
	movb	$0, (%eax)
L6:
	leal	-44(%ebp), %eax
	decl	(%eax)
	cmpl	$-1, -44(%ebp)
	jne	L8
	jmp	L1
L8:
	movl	12(%ebp), %eax
	movl	%eax, %edx
	leal	-8(%ebp), %eax
	addl	-44(%ebp), %eax
	subl	$32, %eax
	movb	(%eax), %al
	movb	%al, (%edx)
	leal	12(%ebp), %eax
	incl	(%eax)
	jmp	L6
L1:
	leave
	ret
	.def	_print;	.scl	3;	.type	32;	.endef
_print:
	pushl	%ebp
	movl	%esp, %ebp
	nop
L10:
	movl	8(%ebp), %eax
	cmpb	$0, (%eax)
	jne	L12
	jmp	L9
L12:
	movl	_textmem, %eax
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movsbw	(%eax),%ax
	orl	$1792, %eax
	movw	%ax, (%edx)
	incl	8(%ebp)
	addl	$2, _textmem
	jmp	L10
L9:
	popl	%ebp
	ret
LC0:
	.ascii "ERROR: \0"
	.def	_panic;	.scl	3;	.type	32;	.endef
_panic:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	subl	$4, %esp
	movl	$753664, %edi
	movl	$0, %eax
	movl	$8000, %ecx
/APP
	rep stosb
/NO_APP
	subl	$12, %esp
	pushl	$LC0
	call	_print
	addl	$16, %esp
	subl	$12, %esp
	pushl	8(%ebp)
	call	_print
	addl	$16, %esp
L14:
	jmp	L14
	.def	_EnablePaging;	.scl	3;	.type	32;	.endef
_EnablePaging:
	pushl	%ebp
	movl	%esp, %ebp
/APP
	movl %cr0, %eax
	orl $1<<31, %eax
	movl %eax, %cr0
	
/NO_APP
	popl	%ebp
	ret
	.def	_SetPageDir;	.scl	3;	.type	32;	.endef
_SetPageDir:
	pushl	%ebp
	movl	%esp, %ebp
/APP
	movl 8(%ebp), %eax
	movl %eax, %cr3
	
/NO_APP
	popl	%ebp
	ret
	.def	_AllocPage;	.scl	3;	.type	32;	.endef
_AllocPage:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	cmpl	$651264, _page
	jne	L20
	movl	$-1, -4(%ebp)
	jmp	L19
L20:
	addl	$4096, _page
	movl	_page, %eax
	subl	$4096, %eax
	movl	%eax, -4(%ebp)
L19:
	movl	-4(%ebp), %eax
	leave
	ret
	.def	_CreatePage;	.scl	3;	.type	32;	.endef
_CreatePage:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	subl	$20, %esp
	call	_AllocPage
	movl	%eax, -8(%ebp)
	cmpl	$-1, -8(%ebp)
	jne	L22
	movl	$-1, -12(%ebp)
	jmp	L21
L22:
	movl	-8(%ebp), %edi
	movl	$0, %eax
	movl	$4096, %ecx
/APP
	rep stosb
/NO_APP
	movl	-8(%ebp), %eax
	movl	%eax, -12(%ebp)
L21:
	movl	-12(%ebp), %eax
	addl	$20, %esp
	popl	%edi
	popl	%ebp
	ret
	.def	_MMap;	.scl	3;	.type	32;	.endef
_MMap:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$24, %esp
	movl	20(%ebp), %eax
	shrl	$12, %eax
	movl	%eax, 20(%ebp)
	leal	12(%ebp), %eax
	andl	$-4096, (%eax)
	leal	16(%ebp), %eax
	andl	$-4096, (%eax)
L24:
	leal	20(%ebp), %eax
	decl	(%eax)
	cmpl	$-1, 20(%ebp)
	jne	L26
	jmp	L25
L26:
	movl	8(%ebp), %eax
	movl	%eax, -8(%ebp)
	movl	16(%ebp), %eax
	shrl	$22, %eax
	leal	0(,%eax,4), %edx
	leal	-8(%ebp), %eax
	addl	%edx, (%eax)
	movl	-8(%ebp), %eax
	movl	(%eax), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	L27
	movl	-8(%ebp), %eax
	movl	(%eax), %eax
	andl	$-4096, %eax
	movl	%eax, -4(%ebp)
	jmp	L28
L27:
	call	_CreatePage
	movl	%eax, -4(%ebp)
	cmpl	$-1, -4(%ebp)
	jne	L29
	movl	$0, -12(%ebp)
	jmp	L23
L29:
	movl	-8(%ebp), %ecx
	movl	-8(%ebp), %edx
	movl	-4(%ebp), %eax
	orl	(%edx), %eax
	orl	$1, %eax
	movl	%eax, (%ecx)
L28:
	movl	16(%ebp), %eax
	shrl	$12, %eax
	andl	$1023, %eax
	leal	0(,%eax,4), %ecx
	movl	-4(%ebp), %edx
	movl	12(%ebp), %eax
	orl	$3, %eax
	movl	%eax, (%edx,%ecx)
	leal	12(%ebp), %eax
	addl	$4096, (%eax)
	leal	16(%ebp), %eax
	addl	$4096, (%eax)
	jmp	L24
L25:
	movl	$1, -12(%ebp)
L23:
	movl	-12(%ebp), %eax
	leave
	ret
LC1:
	.ascii "file is not in PE format\0"
	.def	_LoadPEFile;	.scl	3;	.type	32;	.endef
_LoadPEFile:
	pushl	%ebp
	movl	%esp, %ebp
	pushl	%edi
	pushl	%esi
	subl	$32, %esp
	movl	8(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	cmpw	$23117, (%eax)
	je	L31
	subl	$12, %esp
	pushl	$LC1
	call	_panic
	addl	$16, %esp
L31:
	movl	-12(%ebp), %eax
	movl	60(%eax), %eax
	addl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-16(%ebp), %eax
	cmpl	$17744, (%eax)
	je	L32
	subl	$12, %esp
	pushl	$LC1
	call	_panic
	addl	$16, %esp
L32:
	movl	-16(%ebp), %eax
	cmpw	$224, 20(%eax)
	je	L33
	subl	$12, %esp
	pushl	$LC1
	call	_panic
	addl	$16, %esp
L33:
	movl	-16(%ebp), %eax
	addl	$24, %eax
	movl	%eax, -20(%ebp)
	movl	-20(%ebp), %eax
	addl	$224, %eax
	movl	%eax, -24(%ebp)
	movl	$0, -28(%ebp)
L34:
	movl	-16(%ebp), %eax
	movw	6(%eax), %ax
	andl	$65535, %eax
	cmpl	%eax, -28(%ebp)
	jl	L37
	jmp	L30
L37:
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	leal	0(,%eax,8), %edx
	movl	-24(%ebp), %eax
	movl	36(%eax,%edx), %eax
	andl	$32, %eax
	testl	%eax, %eax
	je	L36
	subl	$12, %esp
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$3, %eax
	addl	-24(%ebp), %eax
	pushl	%eax
	call	_print
	addl	$16, %esp
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	leal	0(,%eax,8), %edx
	movl	-24(%ebp), %eax
	movl	20(%eax,%edx), %esi
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	leal	0(,%eax,8), %edx
	movl	-24(%ebp), %eax
	movl	12(%eax,%edx), %edi
	subl	$1073741824, %edi
	movl	-28(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	leal	0(,%eax,8), %edx
	movl	-24(%ebp), %eax
	movl	16(%eax,%edx), %ecx
/APP
	rep movsb
/NO_APP
L36:
	leal	-28(%ebp), %eax
	incl	(%eax)
	jmp	L34
L30:
	leal	-8(%ebp), %esp
	popl	%esi
	popl	%edi
	popl	%ebp
	ret
.globl _pmode
	.def	_pmode;	.scl	2;	.type	32;	.endef
_pmode:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	call	_CreatePage
	movl	%eax, -4(%ebp)
	pushl	$1048576
	pushl	$0
	pushl	$0
	pushl	-4(%ebp)
	call	_MMap
	addl	$16, %esp
	pushl	$1048576
	pushl	$-1073741824
	pushl	$1048576
	pushl	-4(%ebp)
	call	_MMap
	addl	$16, %esp
	pushl	$1048576
	pushl	$-805306368
	pushl	$2097152
	pushl	-4(%ebp)
	call	_MMap
	addl	$16, %esp
	pushl	$1048576
	pushl	$-269484032
	pushl	$3145728
	pushl	-4(%ebp)
	call	_MMap
	addl	$16, %esp
	subl	$12, %esp
	pushl	-4(%ebp)
	call	_SetPageDir
	addl	$16, %esp
	call	_EnablePaging
	subl	$12, %esp
	pushl	61440
	call	_LoadPEFile
	addl	$16, %esp
L40:
	jmp	L40
