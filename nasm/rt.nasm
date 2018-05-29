	global main
	extern printf
	extern puts
	
	section .text
	
main:
	push rbp
	mov rbp, rsp
	sub rsp, 33
	mov rdi, format
	mov rsi, message
	mov rax,0
	call printf
	leave
	ret
	section .data align=8

format:
	db "%s",0
message:
	db "hello",0

