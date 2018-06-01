





default rel

global main

extern scanf
extern _GLOBAL_OFFSET_TABLE_


SECTION .text   


SECTION .data   


SECTION .bss    


SECTION .rodata.str1.1 

.LC0:
        db 25H, 64H, 00H


SECTION .text.startup 6

main:
        sub     rsp, 24
        lea     rdi, [rel .LC0]
        xor     eax, eax
        lea     rsi, [rsp+0CH]
        call    scanf
        xor     eax, eax
        cmp     dword [rsp+0CH], 3
        setne   al
        add     rsp, 24
        add     eax, 1
        ret



