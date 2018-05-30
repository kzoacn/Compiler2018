





default rel

global main


SECTION .text   

main:
        push    rbp
        mov     rbp, rsp
        mov     dword [rbp-4H], 123
        mov     ecx, dword [rbp-4H]
        mov     edx, 2021161081
        mov     eax, ecx
        imul    edx
        sar     edx, 3
        mov     eax, ecx
        sar     eax, 31
        sub     edx, eax
        mov     eax, edx
        mov     dword [rbp-8H], eax
        mov     eax, 0
        pop     rbp
        ret



SECTION .data   


SECTION .bss    


