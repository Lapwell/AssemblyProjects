section .data
	STDIN equ 0
	STDOUT equ 1
	SYS_EXIT equ 1
	SYS_READ equ 3
	SYS_WRITE equ 4
	sum db '        '

	msg1 db 'Input a number shorter than 6 digits:'
	msg1Len equ $-msg1
	msg2 db 'The result is: '
	msg2Len equ $-msg2


section .bss
	num1 resq 1
	num2 resq 1


section .text
	global _start

_start:

	call get_num

	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num1
	mov edx, 5
	int 0x80

	call get_num

	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num2
	mov edx, 5
	int 0x80

	xor esi, esi
	xor eax, eax
	xor ecx, ecx

	mov esi, 4
	mov ecx, 5
	clc
add_loop:
	mov al, [num1 + esi]
	adc al, [num2 + esi]
	aaa
	pushf
	or al, 30h
	popf

	mov [sum + esi], al
	dec esi
	loop add_loop

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg2
	mov edx, msg2Len
	int 0x80

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, sum
	mov edx, 6
	int 0x80

	mov eax, SYS_EXIT
	int 0x80

get_num:
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg1
	mov edx, msg1Len
	int 0x80
	ret