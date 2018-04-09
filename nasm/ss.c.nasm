





default rel

global func
global main


SECTION .text   

func:
        push    rbp
        mov     rbp, rsp
        mov     dword [rbp-14H], edi
        mov     eax, dword [rbp-14H]
        imul    eax, dword [rbp-14H]
        mov     dword [rbp-10H], eax
        mov     eax, dword [rbp-14H]
        add     eax, 1
        mov     dword [rbp-0CH], eax
        mov     rax, qword [rbp-10H]
        pop     rbp
        ret


main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     dword [rbp-4H], 4
        mov     eax, dword [rbp-4H]
        mov     edi, eax
        call    func
        mov     qword [rbp-10H], rax
        mov     eax, 0
        leave
        ret



SECTION .data   


SECTION .bss    


