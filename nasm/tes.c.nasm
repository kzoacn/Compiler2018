





default rel

global f
global g
global h
global i
global main

extern puts
extern _GLOBAL_OFFSET_TABLE_


SECTION .text   

f:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 342
        mov     qword [rbp-18H], rdi
        mov     qword [rbp-8H], 0
        lea     rdi, [rel L_001]
        call    puts
        mov     rax, qword [rbp-8H]
        leave
        ret


g:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 4017
        mov     qword [rbp-18H], rdi
        mov     qword [rbp-8H], 0
        mov     qword [rbp-10H], 1
        lea     rdi, [rel L_002]
        call    puts
        mov     rax, qword [rbp-8H]
        mov     rdi, rax
        call    f
        leave
        ret




i:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 4238
        mov     qword [rbp-28H], rdi
        mov     qword [rbp-8H], 0
        mov     qword [rbp-10H], 1
        mov     qword [rbp-18H], 0
        mov     qword [rbp-20H], 0
        lea     rdi, [rel L_004]
        call    puts
        mov     rax, qword [rbp-8H]
        mov     rdi, rax
        call    g
        leave
        ret


main:
        push    rbp
        mov     rbp, rsp
        mov     edi, 0
        call    i
        mov     eax, 0
        pop     rbp
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

L_001:
        db 66H, 00H

L_002:
        db 67H, 00H

L_003:
        db 68H, 00H

L_004:
        db 69H, 00H


