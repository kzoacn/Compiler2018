





default rel

global main

extern puts


SECTION .text   

main:
        push    rbp
        mov     rbp, rsp
        mov     edi, L_001
        call    puts
        mov     eax, 0
        pop     rbp
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata align=8

L_001:
        db 28H, 30H, 2CH, 20H, 30H, 2CH, 20H, 30H
        db 29H, 0AH, 32H, 38H, 37H, 31H, 36H, 33H
        db 32H, 35H, 0AH, 37H, 34H, 32H, 31H, 36H
        db 33H, 36H, 0AH, 39H, 39H, 38H, 30H, 34H
        db 30H, 34H, 0AH, 33H, 38H, 34H, 36H, 34H
        db 35H, 34H, 34H, 0AH, 31H, 38H, 35H, 34H
        db 33H, 39H, 32H, 0AH, 28H, 37H, 36H, 31H
        db 36H, 2CH, 20H, 31H, 36H, 36H, 36H, 31H
        db 38H, 38H, 2CH, 20H, 2DH, 31H, 32H, 33H
        db 32H, 39H, 38H, 36H, 29H, 0AH, 28H, 2DH
        db 35H, 30H, 38H, 2CH, 20H, 34H, 31H, 31H
        db 39H, 2CH, 20H, 33H, 33H, 39H, 30H, 29H
        db 0AH, 28H, 35H, 36H, 32H, 2CH, 20H, 31H
        db 35H, 38H, 34H, 2CH, 20H, 32H, 31H, 34H
        db 34H, 29H, 0AH, 28H, 2DH, 39H, 32H, 30H
        db 2CH, 20H, 37H, 36H, 38H, 2CH, 20H, 2DH
        db 35H, 32H, 34H, 29H, 0AH, 28H, 36H, 31H
        db 32H, 2CH, 20H, 2DH, 34H, 36H, 39H, 2CH
        db 20H, 2DH, 36H, 33H, 30H, 29H, 00H


