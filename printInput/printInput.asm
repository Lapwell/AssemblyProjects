section .data ; .data is where defined variables are entered.

	STDIN equ 0 	;Argument for where to get user input, I believe.
	STDOUT equ 1    ;This is the standard output argument.
	SYS_EXIT equ 1  ;This is for when we exit the code.
	SYS_READ equ 3  ;For when we want to read input from the user.
	SYS_WRITE equ 4 ;How we print to screen.

	msg db "Enter a value:"
	msglen equ $-msg ;We need the length of the msg in order to use SYS_WRITE.

	rtnMsg db "You entered: "
	rtnMsgLen equ $-rtnMsg


section .bss ;This is where we declare undefined variables.

	input resb 64


section .text
	global _start

_start:
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg
	mov edx, msglen
	int 0x80

	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, input
	mov edx, 256
	int 0x80

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, rtnMsg
	mov edx, rtnMsgLen
	int 0x80

	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, input
	mov edx, 256
	int 0x80

	mov eax, SYS_EXIT
	int 0x80
