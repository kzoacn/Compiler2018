





default rel

global main

extern puts


SECTION .text   

main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     dword [rbp-4H], 3
        mov     dword [rbp-8H], 4
        mov     eax, dword [rbp-8H]
        mov     edx, dword [rbp-4H]
        add     eax, edx
        mov     dword [rbp-0CH], eax
        mov     edi, L_001
        call    puts
        leave
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

L_001:
        db 67H, 65H, 6CH, 6CH, 6FH, 00H


