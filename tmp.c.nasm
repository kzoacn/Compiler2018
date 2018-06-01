





default rel

global main

extern puts
extern _GLOBAL_OFFSET_TABLE_


SECTION .text   


SECTION .data   


SECTION .bss    


SECTION .rodata.str1.1 

.LC0:
        db 41H, 6EH, 73H, 20H, 69H, 73H, 20H, 39H
        db 31H, 35H, 37H, 36H, 33H, 32H, 32H, 35H
        db 00H


SECTION .text.startup 6

main:
        lea     rdi, [rel .LC0]
        sub     rsp, 8
        call    puts
        xor     eax, eax
        add     rsp, 8
        ret



