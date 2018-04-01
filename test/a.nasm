global  main
extern  printf
section .text
main:
mov  ebx, dword 3
mov  [vars+4*2], ebx
mov  ebx, dword 4
mov  [vars+4*4], ebx
mov  ebx, [vars+4*4]
mov  [vars+4*6], ebx
mov ebx, [vars+4*4]
add ebx, 1
mov [vars+4*6], ebx
mov ebx, [vars+4*2]
imul ebx, [vars+4*6]
mov [vars+4*7], ebx
mov edi, format
mov esi, [vars+4*7]
xor eax, eax
call printf
section .data
format:
		db  "%d", 10, 0
section .bss
		vars: resd 2048
