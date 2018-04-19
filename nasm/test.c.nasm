





default rel

global main


SECTION .text   

main:
        push    rbp
        mov     rbp, rsp
        mov     dword [rbp-4H], 1
        mov     dword [rbp-8H], 2
        mov     eax, dword [rbp-8H]
        mov     edx, dword [rbp-4H]
        add     eax, edx
        mov     dword [rbp-0CH], eax
        pop     rbp
        ret



SECTION .data   


SECTION .bss    


