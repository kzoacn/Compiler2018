





default rel

global toString
global main

extern printf
extern malloc


SECTION .text   

toString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     qword [rbp-38H], rdi
        mov     qword [rbp-8H], 0
        mov     qword [rbp-10H], 1
        cmp     qword [rbp-38H], 0
        jnz     toS_01
        mov     qword [rbp-8H], 1
toS_01:  cmp     qword [rbp-38H], 0
        jns     toS_02
        neg     qword [rbp-38H]
        mov     qword [rbp-10H], -1
        add     qword [rbp-8H], 1
toS_02:  mov     rax, qword [rbp-38H]
        mov     qword [rbp-18H], rax
        jmp     toS_04

toS_03:  add     qword [rbp-8H], 1
        mov     rcx, qword [rbp-18H]
        mov     rdx, qword 6666666666666667H
        mov     rax, rcx
        imul    rdx
        sar     rdx, 2
        mov     rax, rcx
        sar     rax, 63
        sub     rdx, rax
        mov     rax, rdx
        mov     qword [rbp-18H], rax
toS_04:  cmp     qword [rbp-18H], 0
        jg      toS_03
        mov     rax, qword [rbp-8H]
        add     rax, 2
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-28H], rax
        mov     rax, qword [rbp-8H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-28H]
        add     rax, rdx
        mov     byte [rax], 0
        mov     rax, qword [rbp-28H]
        mov     qword [rbp-20H], rax
        mov     rax, qword [rbp-8H]
        mov     edx, eax
        mov     rax, qword [rbp-20H]
        mov     byte [rax], dl
        add     qword [rbp-20H], 1
        cmp     qword [rbp-10H], -1
        jnz     toS_05
        mov     rax, qword [rbp-20H]
        mov     byte [rax], 45
toS_05:  mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-28H]
        add     rax, rdx
        mov     qword [rbp-20H], rax
        cmp     qword [rbp-38H], 0
        jnz     toS_06
        mov     rax, qword [rbp-20H]
        mov     byte [rax], 48
        jmp     toS_08

toS_06:  jmp     toS_08

toS_07:  mov     rcx, qword [rbp-38H]
        mov     rdx, qword 6666666666666667H
        mov     rax, rcx
        imul    rdx
        sar     rdx, 2
        mov     rax, rcx
        sar     rax, 63
        sub     rdx, rax
        mov     rax, rdx
        shl     rax, 2
        add     rax, rdx
        add     rax, rax
        sub     rcx, rax
        mov     rdx, rcx
        mov     eax, edx
        add     eax, 48
        mov     edx, eax
        mov     rax, qword [rbp-20H]
        mov     byte [rax], dl
        sub     qword [rbp-20H], 1
        mov     rcx, qword [rbp-38H]
        mov     rdx, qword 6666666666666667H
        mov     rax, rcx
        imul    rdx
        sar     rdx, 2
        mov     rax, rcx
        sar     rax, 63
        sub     rdx, rax
        mov     rax, rdx
        mov     qword [rbp-38H], rax
toS_08:  cmp     qword [rbp-38H], 0
        jg      toS_07
        mov     rax, qword [rbp-28H]
        leave
        ret


main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     rdi, -987654
        call    toString
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-8H]
        movzx   eax, byte [rax]
        movsx   eax, al
        mov     esi, eax
        mov     edi, toS_09
        mov     eax, 0
        call    printf
        mov     rax, qword [rbp-8H]
        add     rax, 1
        movzx   eax, byte [rax]
        movsx   eax, al
        mov     esi, eax
        mov     edi, toS_10
        mov     eax, 0
        call    printf
        mov     rax, qword [rbp-8H]
        add     rax, 2
        movzx   eax, byte [rax]
        movsx   eax, al
        mov     esi, eax
        mov     edi, toS_10
        mov     eax, 0
        call    printf
        mov     rax, qword [rbp-8H]
        add     rax, 3
        movzx   eax, byte [rax]
        movsx   eax, al
        mov     esi, eax
        mov     edi, toS_10
        mov     eax, 0
        call    printf
        mov     rax, qword [rbp-8H]
        add     rax, 4
        movzx   eax, byte [rax]
        movsx   eax, al
        mov     esi, eax
        mov     edi, toS_10
        mov     eax, 0
        call    printf
        mov     rax, qword [rbp-8H]
        add     rax, 5
        movzx   eax, byte [rax]
        movsx   eax, al
        mov     esi, eax
        mov     edi, toS_10
        mov     eax, 0
        call    printf
        mov     rax, qword [rbp-8H]
        add     rax, 6
        movzx   eax, byte [rax]
        movsx   eax, al
        mov     esi, eax
        mov     edi, toS_10
        mov     eax, 0
        call    printf
        mov     rax, qword [rbp-8H]
        add     rax, 7
        movzx   eax, byte [rax]
        movsx   eax, al
        mov     esi, eax
        mov     edi, toS_10
        mov     eax, 0
        call    printf
        mov     rax, qword [rbp-8H]
        add     rax, 8
        movzx   eax, byte [rax]
        movsx   eax, al
        mov     esi, eax
        mov     edi, toS_09
        mov     eax, 0
        call    printf
        mov     eax, 0
        leave
        ret



SECTION .data   


SECTION .bss    


SECTION .rodata 

toS_09:
        db 25H, 64H, 0AH, 00H

toS_10:
        db 25H, 63H, 0AH, 00H


