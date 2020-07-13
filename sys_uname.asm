BITS 64
%define BUFFER 256

global _start

section .rodata

	linefeed db 0xA
	linefeed_len equ $-linefeed

section .bss

	uname resb BUFFER

section .text

_start:
	mov rax, 63
	mov rdi, uname
	syscall
	jmp _print_uname

_print_uname:
	mov rax, 0x1
	mov rdi, 0x1
	mov rsi, uname
	mov rdx, BUFFER
	syscall
	jmp _linefeed

_linefeed:
	mov rax, 0x1
	mov rdi, 0x1
	mov rsi, linefeed
	mov rdx, linefeed_len
	syscall
	jmp _exit

_exit:
	mov rax, 0x3C
	mov rdi, 0
	syscall
