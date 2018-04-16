





default rel

global main

extern puts


SECTION .text   

main:
        push    rbp
        mov     rbp, rsp
        mov     edi, L_001
        call    puts
        pop     rbp
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata align=8

L_001:
        db 76H, 65H, 63H, 74H, 6FH, 72H, 20H, 78H
        db 3AH, 20H, 28H, 20H, 39H, 2CH, 20H, 38H
        db 2CH, 20H, 37H, 2CH, 20H, 36H, 2CH, 20H
        db 35H, 2CH, 20H, 34H, 2CH, 20H, 33H, 2CH
        db 20H, 32H, 2CH, 20H, 31H, 2CH, 20H, 30H
        db 20H, 29H, 0AH, 65H, 78H, 63H, 69H, 74H
        db 65H, 64H, 21H, 0AH, 76H, 65H, 63H, 74H
        db 6FH, 72H, 20H, 79H, 3AH, 20H, 28H, 20H
        db 39H, 2CH, 20H, 38H, 2CH, 20H, 37H, 2CH
        db 20H, 38H, 31H, 37H, 2CH, 20H, 35H, 2CH
        db 20H, 34H, 2CH, 20H, 33H, 2CH, 20H, 32H
        db 2CH, 20H, 31H, 2CH, 20H, 30H, 20H, 29H
        db 0AH, 78H, 20H, 2BH, 20H, 79H, 3AH, 20H
        db 28H, 20H, 31H, 38H, 2CH, 20H, 31H, 36H
        db 2CH, 20H, 31H, 34H, 2CH, 20H, 38H, 32H
        db 33H, 2CH, 20H, 31H, 30H, 2CH, 20H, 38H
        db 2CH, 20H, 36H, 2CH, 20H, 34H, 2CH, 20H
        db 32H, 2CH, 20H, 30H, 20H, 29H, 0AH, 78H
        db 20H, 2AH, 20H, 79H, 3AH, 20H, 30H, 0AH
        db 28H, 31H, 20H, 3CH, 3CH, 20H, 33H, 29H
        db 20H, 2AH, 20H, 79H, 3AH, 20H, 28H, 20H
        db 37H, 32H, 2CH, 20H, 36H, 34H, 2CH, 20H
        db 35H, 36H, 2CH, 20H, 36H, 35H, 33H, 36H
        db 2CH, 20H, 34H, 30H, 2CH, 20H, 33H, 32H
        db 2CH, 20H, 32H, 34H, 2CH, 20H, 31H, 36H
        db 2CH, 20H, 38H, 2CH, 20H, 30H, 20H, 29H
        db 00H


