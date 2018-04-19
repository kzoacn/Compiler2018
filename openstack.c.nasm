





default rel

global _main
global main

extern malloc


SECTION .text   

_main:
        push    rbp
        mov     rbp, rsp
        pop     rbp
        ret


main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        
        
        mov     eax, 671088640
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 671088640
        movsxd  rdx, edx
        sub     rdx, 4096
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
        
        
        
        mov     rsp, qword [trsp]
        mov     eax, 0
        leave
        ret



SECTION .data   


SECTION .bss    


