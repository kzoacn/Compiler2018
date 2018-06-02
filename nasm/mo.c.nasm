





default rel

global main


SECTION .text   

main:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-8H], 1
        mov     rcx, qword [rbp-8H]
        mov     rdx, qword 0B2F4FC0794908CF3H
        mov     rax, rcx
        imul    rdx
        lea     rax, [rdx+rcx]
        sar     rax, 21
        mov     rdx, rax
        mov     rax, rcx
        sar     rax, 63
        sub     rdx, rax
        mov     rax, rdx
        imul    rax, rax, 3000000
        sub     rcx, rax
        mov     rax, rcx
        mov     qword [rbp-10H], rax
        mov     eax, 0
        pop     rbp
        ret



SECTION .data   


SECTION .bss    


