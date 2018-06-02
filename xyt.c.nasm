





default rel

global toString
global main

extern sprintf
extern _GLOBAL_OFFSET_TABLE_


SECTION .text   

toString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     dword [rbp-4H], edi
        mov     eax, dword [rbp-4H]
        mov     edx, eax
        lea     rsi, [rel L_001]
        lea     rdi, [rel s.1758]
        mov     eax, 0
        call    sprintf
        nop
        leave
        ret


main:
        push    rbp
        mov     rbp, rsp
        mov     edi, 2
        call    toString
        mov     eax, 0
        pop     rbp
        ret



SECTION .data   


SECTION .bss    6

s.1758:
        resb    20


SECTION .rodata 

L_001:
        db 25H, 6CH, 6CH, 64H, 00H


