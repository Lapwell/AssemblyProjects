;This program only prints 0-9, since it's in ascii format. I'll come back some time in the future and make it print numbers past 9. Maybe.

section .data
	STDIN equ 0
	STDOUT equ 1
	SYS_EXIT equ 1
	SYS_READ equ 3
	SYS_WRITE equ 4

	inputMsg db "Input a number: "
	inputMsgLen equ $-inputMsg

	resMsg db "The result is: "
	resMsgLen equ $-resMsg


section .bss
	num1 resb 2
	num2 resb 2
	res resb 1


section .text
	global _start

_start:
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, inputMsg
	mov edx, inputMsgLen
	int 0x80

	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num1
	mov edx, 2
	int 0x80

	mov eax, SYS_WRITE
	mov ebx, STDIN
	mov ecx, inputMsg
	mov edx, inputMsgLen
	int 0x80

	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num2
	mov edx, 2
	int 0x80

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, resMsg
	mov edx, resMsgLen
	int 0x80

	mov eax, [num1]
	sub eax, '0' ;Not sure how it works 100%, but subbing ascii 0 converts the value from ascii into decimal.
	
	mov ebx, [num2]
	sub ebx, '0'

	add eax, ebx
	add eax, '0' ;Converting the data back into ascii from decimal. Still confused on how it works.
	mov [res], eax

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, res
	mov edx, 1
	int 0x80

	mov eax, SYS_EXIT
	xor ebx, ebx
	int 0x80