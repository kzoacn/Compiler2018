





default rel

global mallocArray
global concat
global address
global _multiArray
global multiArray
global test
global main

extern printf
extern malloc


SECTION .text   

mallocArray:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     rax, qword [rbp-18H]
        add     rax, 1
        shl     rax, 4
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-8H]
        mov     rdx, qword [rbp-18H]
        mov     qword [rax], rdx
        mov     rax, qword [rbp-8H]
        leave
        ret


concat:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp-28H], rdi
        mov     qword [rbp-30H], rsi
        mov     rax, qword [rbp-28H]
        movzx   eax, byte [rax]
        movsx   edx, al
        mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        movsx   eax, al
        add     eax, edx
        add     eax, 1
        cdqe
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-18H], rax
        mov     rax, qword [rbp-28H]
        movzx   eax, byte [rax]
        mov     edx, eax
        mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        add     eax, edx
        mov     edx, eax
        mov     rax, qword [rbp-18H]
        mov     byte [rax], dl
        mov     qword [rbp-8H], 0
        mov     qword [rbp-10H], 0
        mov     qword [rbp-8H], 0
        jmp     CL_002

CL_001:  add     qword [rbp-10H], 1
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp-18H]
        add     rdx, rax
        mov     rax, qword [rbp-8H]
        lea     rcx, [rax+1H]
        mov     rax, qword [rbp-28H]
        add     rax, rcx
        movzx   eax, byte [rax]
        mov     byte [rdx], al
        add     qword [rbp-8H], 1
CL_002:  mov     rax, qword [rbp-28H]
        movzx   eax, byte [rax]
        movsx   rax, al
        cmp     rax, qword [rbp-8H]
        jg      CL_001
        mov     qword [rbp-8H], 0
        jmp     CL_004

CL_003:  add     qword [rbp-10H], 1
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp-18H]
        add     rdx, rax
        mov     rax, qword [rbp-8H]
        lea     rcx, [rax+1H]
        mov     rax, qword [rbp-30H]
        add     rax, rcx
        movzx   eax, byte [rax]
        mov     byte [rdx], al
        add     qword [rbp-8H], 1
CL_004:  mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        movsx   rax, al
        cmp     rax, qword [rbp-8H]
        jg      CL_003
        mov     rax, qword [rbp-18H]
        leave
        ret


address:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        add     rax, 1
        shl     rax, 4
        mov     rdx, rax
        mov     rax, qword [rbp-8H]
        add     rax, rdx
        pop     rbp
        ret


_multiArray:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 56
        mov     dword [rbp-34H], edi
        mov     qword [rbp-40H], rsi
        mov     eax, dword [rbp-34H]
        add     eax, 1
        movsxd  rdx, eax
        mov     rax, qword [rbp-40H]
        mov     rax, qword [rax]
        cmp     rdx, rax
        jnz     CL_005
        mov     eax, dword [rbp-34H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-40H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     rdi, rax
        call    mallocArray
        jmp     CL_008

CL_005:  mov     eax, dword [rbp-34H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-40H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     qword [rbp-20H], rax
        mov     rax, qword [rbp-20H]
        mov     rdi, rax
        call    mallocArray
        mov     qword [rbp-28H], rax
        mov     dword [rbp-14H], 0
        jmp     CL_007

CL_006:  mov     eax, dword [rbp-14H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-28H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rbx, rax
        mov     eax, dword [rbp-34H]
        lea     edx, [rax+1H]
        mov     rax, qword [rbp-40H]
        mov     rsi, rax
        mov     edi, edx
        call    _multiArray
        mov     qword [rbx], rax
        add     dword [rbp-14H], 1
CL_007:  mov     eax, dword [rbp-14H]
        cdqe
        cmp     rax, qword [rbp-20H]
        jl      CL_006
        mov     rax, qword [rbp-28H]
CL_008:  add     rsp, 56
        pop     rbx
        pop     rbp
        ret


multiArray:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     rax, qword [rbp-8H]
        mov     rsi, rax
        mov     edi, 0
        call    _multiArray
        leave
        ret


test:
        push    rbp
        mov     rbp, rsp
        push    rbx
        sub     rsp, 72
        mov     edi, 2
        call    mallocArray
        mov     qword [rbp-30H], rax
        mov     rax, qword [rbp-30H]
        mov     esi, 0
        mov     rdi, rax
        call    address
        mov     qword [rax], 4
        mov     rax, qword [rbp-30H]
        mov     esi, 1
        mov     rdi, rax
        call    address
        mov     qword [rax], 5
        mov     rax, qword [rbp-30H]
        mov     rdi, rax
        call    multiArray
        mov     qword [rbp-38H], rax
        mov     qword [rbp-28H], 0
        mov     qword [rbp-18H], 0
        jmp     CL_012

CL_009:  mov     rax, qword [rbp-38H]
        mov     rdx, qword [rbp-18H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     qword [rbp-40H], rax
        mov     qword [rbp-20H], 0
        jmp     CL_011

CL_010:  mov     rax, qword [rbp-40H]
        mov     rdx, qword [rbp-20H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        add     qword [rbp-28H], 1
        mov     rdx, qword [rbp-28H]
        mov     qword [rax], rdx
        add     qword [rbp-20H], 1
CL_011:  cmp     qword [rbp-20H], 4
        jle     CL_010
        add     qword [rbp-18H], 1
CL_012:  cmp     qword [rbp-18H], 3
        jle     CL_009
        mov     qword [rbp-18H], 0
        jmp     CL_016

CL_013:  mov     rax, qword [rbp-38H]
        mov     rdx, qword [rbp-18H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     qword [rbp-48H], rax
        mov     qword [rbp-20H], 0
        jmp     CL_015

CL_014:  cmp     qword [rbp-20H], 4
        sete    al
        movzx   eax, al
        cdqe

        movzx   eax, byte [abs CL_018+rax]
        movsx   ebx, al
        mov     rax, qword [rbp-48H]
        mov     rdx, qword [rbp-20H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     edx, ebx
        mov     rsi, rax
        mov     edi, CL_017
        mov     eax, 0
        call    printf
        add     qword [rbp-20H], 1
CL_015:  cmp     qword [rbp-20H], 4
        jle     CL_014
        add     qword [rbp-18H], 1
CL_016:  cmp     qword [rbp-18H], 3
        jle     CL_013
        add     rsp, 72
        pop     rbx
        pop     rbp
        ret


main:
        push    rbp
        mov     rbp, rsp
        mov     eax, 0
        call    test
        pop     rbp
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

CL_017:
        db 25H, 64H, 25H, 63H, 00H

CL_018:  db 20H, 0AH, 00H


