





default rel

global toString
global main

extern printf
extern malloc
extern puts


SECTION .text   

toString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     dword [rbp-24H], edi
        mov     dword [rbp-4H], 0
        mov     dword [rbp-8H], 1
        cmp     dword [rbp-24H], 0
        jns     toS_001
        neg     dword [rbp-24H]
        mov     dword [rbp-8H], -1
        add     dword [rbp-4H], 1
toS_001:  mov     eax, dword [rbp-24H]
        mov     dword [rbp-0CH], eax
        jmp     toS_003

toS_002:  add     dword [rbp-4H], 1
        mov     ecx, dword [rbp-0CH]
        mov     edx, 1717986919
        mov     eax, ecx
        imul    edx
        sar     edx, 2
        mov     eax, ecx
        sar     eax, 31
        sub     edx, eax
        mov     eax, edx
        mov     dword [rbp-0CH], eax
toS_003:  cmp     dword [rbp-0CH], 0
        jg      toS_002
        mov     eax, dword [rbp-4H]
        add     eax, 1
        cdqe
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-20H], rax
        mov     rax, qword [rbp-20H]
        mov     qword [rbp-18H], rax
        mov     eax, dword [rbp-4H]
        mov     edx, eax
        mov     rax, qword [rbp-18H]
        mov     byte [rax], dl
        add     qword [rbp-18H], 1
        cmp     dword [rbp-8H], -1
        jnz     toS_004
        mov     rax, qword [rbp-18H]
        mov     byte [rax], 45
toS_004:  mov     eax, dword [rbp-4H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        mov     qword [rbp-18H], rax
        jmp     toS_006

toS_005:  mov     ecx, dword [rbp-24H]
        mov     edx, 1717986919
        mov     eax, ecx
        imul    edx
        sar     edx, 2
        mov     eax, ecx
        sar     eax, 31
        sub     edx, eax
        mov     eax, edx
        shl     eax, 2
        add     eax, edx
        add     eax, eax
        sub     ecx, eax
        mov     edx, ecx
        mov     eax, edx
        add     eax, 48
        mov     edx, eax
        mov     rax, qword [rbp-18H]
        mov     byte [rax], dl
        sub     qword [rbp-18H], 1
        mov     ecx, dword [rbp-24H]
        mov     edx, 1717986919
        mov     eax, ecx
        imul    edx
        sar     edx, 2
        mov     eax, ecx
        sar     eax, 31
        sub     edx, eax
        mov     eax, edx
        mov     dword [rbp-24H], eax
toS_006:  cmp     dword [rbp-24H], 0
        jg      toS_005
        mov     rax, qword [rbp-20H]
        leave
        ret


main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     rdi, -132456
        call    toString
        add     rax,1
        mov     rdi, rax
        call    puts
        leave
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

toS_007:
        db 25H, 64H, 0AH, 00H

toS_008:
        db 25H, 63H, 0AH, 00H


