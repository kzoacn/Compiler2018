





default rel

global main

extern printf


SECTION .text   

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 320
        mov     byte [rbp-8*1], 0
        mov     byte [rbp-8*2], 0
        mov     byte [rbp-8*3], 0
        mov     byte [rbp-8*4], 0
        mov     byte [rbp-8*5], 0
        mov     byte [rbp-8*6], 0
        mov     byte [rbp-8*8], 2
        mov     qword [rbp-8*7], 1
        mov     qword [rbp-8*9], 3
        mov     byte [rbp-8*10], 0
        mov     byte [rbp-8*11], 0
        mov     byte [rbp-8*12], 0
        mov     byte [rbp-8*13], 0
        
        mov     rax,qword [rbp-8*8]
        mov     rsi, rax
        mov     edi, L_001
        mov     eax, 0
        call    printf
        mov     eax, 0
        leave
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

L_001:
        db 25H, 64H, 0AH, 00H


