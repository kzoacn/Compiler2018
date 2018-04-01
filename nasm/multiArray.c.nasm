





default rel

global address
global mallocArray
global _multiArray
global multiArray
global test
global main

extern printf
extern malloc


SECTION .text   

address:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        add     rax, 1
        lea     rdx, [rax*8]
        mov     rax, qword [rbp-8H]
        add     rax, rdx
        pop     rbp
        ret


mallocArray:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     rax, qword [rbp-18H]
        add     rax, 1
        shl     rax, 3
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-8H]
        mov     rdx, qword [rbp-18H]
        mov     qword [rax], rdx
        mov     rax, qword [rbp-8H]
        leave
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
        jnz     L_001
        mov     eax, dword [rbp-34H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-40H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     rdi, rax
        call    mallocArray
        jmp     L_004

L_001:  mov     eax, dword [rbp-34H]
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
        jmp     L_003

L_002:  mov     eax, dword [rbp-14H]
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
L_003:  mov     eax, dword [rbp-14H]
        cdqe
        cmp     rax, qword [rbp-20H]
        jl      L_002
        mov     rax, qword [rbp-28H]
L_004:  add     rsp, 56
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
        jmp     L_008

L_005:  mov     rdx, qword [rbp-18H]
        mov     rax, qword [rbp-38H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     qword [rbp-40H], rax
        mov     qword [rbp-20H], 0
        jmp     L_007

L_006:  mov     rdx, qword [rbp-20H]
        mov     rax, qword [rbp-40H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        add     qword [rbp-28H], 1
        mov     rdx, qword [rbp-28H]
        mov     qword [rax], rdx
        add     qword [rbp-20H], 1
L_007:  cmp     qword [rbp-20H], 4
        jle     L_006
        add     qword [rbp-18H], 1
L_008:  cmp     qword [rbp-18H], 3
        jle     L_005
        mov     qword [rbp-18H], 0
        jmp     L_012

L_009:  mov     rdx, qword [rbp-18H]
        mov     rax, qword [rbp-38H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     qword [rbp-48H], rax
        mov     qword [rbp-20H], 0
        jmp     L_011

L_010:  cmp     qword [rbp-20H], 4
        sete    al
        movzx   eax, al
        cdqe

        movzx   eax, byte [abs L_016+rax]
        movsx   ebx, al
        mov     rdx, qword [rbp-20H]
        mov     rax, qword [rbp-48H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     edx, ebx
        mov     rsi, rax
        mov     edi, L_015
        mov     eax, 0
        call    printf
        add     qword [rbp-20H], 1
L_011:  cmp     qword [rbp-20H], 4
        jle     L_010
        add     qword [rbp-18H], 1
L_012:  cmp     qword [rbp-18H], 3
        jle     L_009
        add     rsp, 72
        pop     rbx
        pop     rbp
        ret


main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-10H], 5
        mov     edi, 1
        call    mallocArray
        mov     qword [rbp-18H], rax
        mov     rax, qword [rbp-18H]
        mov     esi, 0
        mov     rdi, rax
        call    address
        mov     rdx, qword [rbp-10H]
        mov     qword [rax], rdx
        mov     rax, qword [rbp-18H]
        mov     rdi, rax
        call    multiArray
        mov     qword [rbp-20H], rax
        mov     rax, qword [rbp-20H]
        mov     esi, 0
        mov     rdi, rax
        call    address
        mov     qword [rax], 1
        mov     rax, qword [rbp-20H]
        mov     esi, 1
        mov     rdi, rax
        call    address
        mov     qword [rax], 5
        mov     rax, qword [rbp-20H]
        mov     esi, 2
        mov     rdi, rax
        call    address
        mov     qword [rax], 2
        mov     rax, qword [rbp-20H]
        mov     esi, 3
        mov     rdi, rax
        call    address
        mov     qword [rax], 4
        mov     rax, qword [rbp-20H]
        mov     esi, 4
        mov     rdi, rax
        call    address
        mov     qword [rax], 3
        mov     dword [rbp-4H], 0
        jmp     L_014

L_013:  mov     eax, dword [rbp-4H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-20H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     rsi, rax
        mov     edi, L_017
        mov     eax, 0
        call    printf
        add     dword [rbp-4H], 1
L_014:  mov     eax, dword [rbp-4H]
        cdqe
        cmp     rax, qword [rbp-10H]
        jl      L_013
        leave
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

L_015:
        db 25H, 64H, 25H, 63H, 00H

L_016:  db 20H, 0AH, 00H

L_017:
        db 25H, 6CH, 64H, 0AH, 00H


