





default rel

global main


SECTION .text   

main:
        push    rbp
        mov     rbp, rsp
        mov     dword [rbp-4H], 2
        mov     dword [rbp-8H], 0
        cmp     dword [rbp-4H], 2
        jg      L_001
        add     dword [rbp-8H], 1
        jmp     L_002

L_001:  sub     dword [rbp-8H], 1
L_002:  mov     eax, 0
        pop     rbp
        ret



SECTION .data   


SECTION .bss    


