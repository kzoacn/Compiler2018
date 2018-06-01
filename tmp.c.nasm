





default rel

global main

extern puts
extern _GLOBAL_OFFSET_TABLE_


SECTION .text   


SECTION .data   


SECTION .bss    


SECTION .rodata.str1.8 align=8

.LC0:
        db 33H, 36H, 0AH, 33H, 36H, 0AH, 37H, 32H
        db 0AH, 33H, 36H, 0AH, 37H, 32H, 0AH, 31H
        db 39H, 0AH, 35H, 35H, 0AH, 33H, 36H, 0AH
        db 37H, 32H, 0AH, 31H, 39H, 0AH, 35H, 35H
        db 0AH, 31H, 36H, 37H, 0AH, 32H, 30H, 33H
        db 0AH, 31H, 37H, 39H, 0AH, 32H, 31H, 35H
        db 0AH, 33H, 36H, 0AH, 37H, 32H, 0AH, 31H
        db 39H, 0AH, 35H, 35H, 0AH, 31H, 36H, 37H
        db 0AH, 32H, 30H, 33H, 0AH, 31H, 37H, 39H
        db 0AH, 32H, 31H, 35H, 0AH, 36H, 34H, 0AH
        db 31H, 30H, 30H, 0AH, 31H, 30H, 33H, 0AH
        db 31H, 33H, 39H, 0AH, 31H, 38H, 36H, 0AH
        db 32H, 32H, 32H, 0AH, 33H, 0AH, 33H, 39H
        db 0AH, 33H, 36H, 0AH, 37H, 32H, 0AH, 31H
        db 39H, 0AH, 35H, 35H, 0AH, 31H, 36H, 37H
        db 0AH, 32H, 30H, 33H, 0AH, 31H, 37H, 39H
        db 0AH, 32H, 31H, 35H, 0AH, 36H, 34H, 0AH
        db 31H, 30H, 30H, 0AH, 31H, 30H, 33H, 0AH
        db 31H, 33H, 39H, 0AH, 31H, 38H, 36H, 0AH
        db 32H, 32H, 32H, 0AH, 33H, 0AH, 33H, 39H
        db 0AH, 31H, 34H, 35H, 0AH, 31H, 38H, 31H
        db 0AH, 31H, 31H, 33H, 0AH, 31H, 34H, 39H
        db 0AH, 32H, 31H, 36H, 0AH, 31H, 39H, 0AH
        db 39H, 33H, 0AH, 31H, 32H, 39H, 00H


SECTION .text.startup 6

main:
        lea     rdi, [rel .LC0]
        sub     rsp, 8
        call    puts
        xor     eax, eax
        add     rsp, 8
        ret



