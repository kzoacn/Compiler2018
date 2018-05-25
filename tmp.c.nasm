





default rel

global main

extern putchar
extern _GLOBAL_OFFSET_TABLE_


SECTION .text   

main:
        push    rbp
        mov     rbp, rsp
        mov     edi, 53
        call    putchar
        mov     edi, 53
        call    putchar
        mov     edi, 57
        call    putchar
        mov     edi, 51
        call    putchar
        mov     edi, 53
        call    putchar
        mov     edi, 53
        call    putchar
        mov     edi, 51
        call    putchar
        mov     edi, 50
        call    putchar
        mov     edi, 50
        call    putchar
        mov     eax, 0
        pop     rbp
        ret



SECTION .data   


SECTION .bss    


