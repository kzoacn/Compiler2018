





default rel

global main

extern puts
extern _GLOBAL_OFFSET_TABLE_


SECTION .text   

main:
        push    rbp
        mov     rbp, rsp
        lea     rdi, [rel L_001]
        call    puts
        mov     eax, 0
        pop     rbp
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

L_001:
        db 33H, 37H, 33H, 36H, 37H, 31H, 30H, 37H
        db 37H, 38H, 37H, 38H, 30H, 34H, 33H, 34H
        db 33H, 37H, 31H, 00H


