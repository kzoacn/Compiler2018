





default rel

global main

extern fclose
extern fgets
extern printf
extern fopen
extern _GLOBAL_OFFSET_TABLE_


SECTION .text   

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 524304
        lea     rsi, [rel L_003]
        lea     rdi, [rel L_004]
        call    fopen
        mov     qword [rbp-8H], rax
        jmp     L_002

L_001:  lea     rax, [rbp-80010H]
        mov     rdi, rax
        mov     eax, 0
        call    printf
L_002:  mov     rdx, qword [rbp-8H]
        lea     rax, [rbp-80010H]
        mov     esi, 65536
        mov     rdi, rax
        call    fgets
        test    rax, rax
        jnz     L_001
        mov     rax, qword [rbp-8H]
        mov     rdi, rax
        call    fclose
        mov     eax, 0
        leave
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

L_003:
        db 72H, 00H

L_004:
        db 61H, 6EH, 73H, 2EH, 6FH, 75H, 74H, 00H


