





default rel

global mallocArray
global concat
global address
global multiAddress
global _multiArray
global multiArray
global toString
global getInt
global getString
global substring
global parseInt
global ord
global test
global strls
global strle
global streq
global strge
global strgt
global strne
global main

extern puts
extern strcmp
extern printf
extern scanf
extern strlen
extern sprintf
extern memset
extern malloc
extern _GLOBAL_OFFSET_TABLE_


SECTION .text   

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
        mov     rax, qword [rbp-18H]
        add     rax, 1
        shl     rax, 3
        mov     rdx, rax
        mov     rax, qword [rbp-8H]
        mov     esi, 0
        mov     rdi, rax
        call    memset
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
        movzx   edx, al
        mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        movzx   eax, al
        add     eax, edx
        add     eax, 2
        cdqe
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-18H], rax
        mov     rax, qword [rbp-28H]
        movzx   edx, byte [rax]
        mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        add     edx, eax
        mov     rax, qword [rbp-18H]
        mov     byte [rax], dl
        mov     qword [rbp-8H], 0
        mov     qword [rbp-10H], 0
        mov     qword [rbp-8H], 0
        jmp     L_002

L_001:  add     qword [rbp-10H], 1
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
L_002:  mov     rax, qword [rbp-28H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      L_001
        mov     qword [rbp-8H], 0
        jmp     L_004

L_003:  add     qword [rbp-10H], 1
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
L_004:  mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      L_003
        add     qword [rbp-10H], 1
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        mov     byte [rax], 0
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
        lea     rdx, [rax*8]
        mov     rax, qword [rbp-8H]
        add     rax, rdx
        pop     rbp
        ret


multiAddress:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp-28H], rdi
        mov     qword [rbp-30H], rsi
        mov     rax, qword [rbp-30H]
        mov     rax, qword [rax]
        mov     qword [rbp-18H], rax
        mov     rax, qword [rbp-28H]
        mov     qword [rbp-10H], rax
        cmp     qword [rbp-18H], 0
        jnz     L_005
        mov     rax, qword [rbp-28H]
        jmp     L_008

L_005:  mov     qword [rbp-8H], 1
        jmp     L_007

L_006:  mov     rax, qword [rbp-8H]
        lea     rdx, [rax-1H]
        mov     rax, qword [rbp-30H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rdx, qword [rax]
        mov     rax, qword [rbp-10H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     qword [rbp-10H], rax
        add     qword [rbp-8H], 1
L_007:  mov     rax, qword [rbp-8H]
        cmp     rax, qword [rbp-18H]
        jl      L_006
        mov     rax, qword [rbp-18H]
        lea     rdx, [rax-1H]
        mov     rax, qword [rbp-30H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rdx, qword [rax]
        mov     rax, qword [rbp-10H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     qword [rbp-10H], rax
        mov     rax, qword [rbp-10H]
L_008:  leave
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
        jnz     L_009
        mov     eax, dword [rbp-34H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-40H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     rdi, rax
        call    mallocArray
        jmp     L_012

L_009:  mov     eax, dword [rbp-34H]
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
        jmp     L_011

L_010:  mov     eax, dword [rbp-14H]
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
L_011:  mov     eax, dword [rbp-14H]
        cdqe
        cmp     rax, qword [rbp-20H]
        jl      L_010
        mov     rax, qword [rbp-28H]
L_012:  add     rsp, 56
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


toString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     edi, 256
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-8H]
        lea     rcx, [rax+1H]
        mov     rax, qword [rbp-18H]
        mov     rdx, rax
        lea     rsi, [rel L_031]
        mov     rdi, rcx
        mov     eax, 0
        call    sprintf
        mov     rax, qword [rbp-8H]
        add     rax, 1
        mov     rdi, rax
        call    strlen
        mov     edx, eax
        mov     rax, qword [rbp-8H]
        mov     byte [rax], dl
        mov     rax, qword [rbp-8H]
        leave
        ret


getInt:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        lea     rax, [rbp-8H]
        mov     rsi, rax
        lea     rdi, [rel L_031]
        mov     eax, 0
        call    scanf
        mov     rax, qword [rbp-8H]
        leave
        ret


getString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        lea     rsi, [rel buff.1815]
        lea     rdi, [rel L_032]
        mov     eax, 0
        call    scanf
        lea     rdi, [rel buff.1815]
        call    strlen
        mov     qword [rbp-10H], rax
        mov     rax, qword [rbp-10H]
        add     rax, 2
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-18H], rax
        mov     rax, qword [rbp-10H]
        mov     edx, eax
        mov     rax, qword [rbp-18H]
        mov     byte [rax], dl
        mov     qword [rbp-8H], 1
        jmp     L_014

L_013:  mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-18H]
        add     rdx, rax
        mov     rax, qword [rbp-8H]
        lea     rcx, [rax-1H]
        lea     rax, [rel buff.1815]
        movzx   eax, byte [rcx+rax]
        mov     byte [rdx], al
        add     qword [rbp-8H], 1
L_014:  mov     rax, qword [rbp-8H]
        cmp     rax, qword [rbp-10H]
        jle     L_013
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        mov     byte [rax], 0
        mov     rax, qword [rbp-18H]
        leave
        ret


substring:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp-28H], rdi
        mov     qword [rbp-30H], rsi
        mov     qword [rbp-18H], 16777215
        mov     rax, qword [rbp-30H]
        sub     rax, qword [rbp-28H]
        add     rax, 3
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-20H], rax
        mov     rax, qword [rbp-30H]
        mov     edx, eax
        mov     rax, qword [rbp-28H]
        sub     edx, eax
        mov     eax, edx
        add     eax, 1
        mov     edx, eax
        mov     rax, qword [rbp-20H]
        mov     byte [rax], dl
        mov     qword [rbp-10H], 0
        mov     rax, qword [rbp-28H]
        mov     qword [rbp-8H], rax
        jmp     L_016

L_015:  add     qword [rbp-10H], 1
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        mov     rdx, qword [rbp-8H]
        lea     rcx, [rdx+1H]
        mov     rdx, qword [rbp-18H]
        add     rdx, rcx
        movzx   edx, byte [rdx]
        mov     byte [rax], dl
        add     qword [rbp-8H], 1
L_016:  mov     rax, qword [rbp-8H]
        cmp     rax, qword [rbp-30H]
        jle     L_015
        add     qword [rbp-10H], 1
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        mov     byte [rax], 0
        mov     rax, qword [rbp-20H]
        leave
        ret


parseInt:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-18H], 16777215
        mov     qword [rbp-10H], 0
        mov     qword [rbp-8H], 1
        jmp     L_019

L_017:  mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 47
        jbe     L_018
        mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 57
        ja      L_018
        mov     rdx, qword [rbp-10H]
        mov     rax, rdx
        shl     rax, 2
        add     rax, rdx
        add     rax, rax
        mov     rcx, rax
        mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        movzx   eax, al
        sub     eax, 48
        cdqe
        add     rax, rcx
        mov     qword [rbp-10H], rax
        add     qword [rbp-8H], 1
        jmp     L_019

L_018:  mov     rax, qword [rbp-10H]
        jmp     L_020

L_019:  mov     rax, qword [rbp-18H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jge     L_017
        mov     rax, qword [rbp-10H]
L_020:  pop     rbp
        ret


ord:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-18H], rdi
        mov     qword [rbp-8H], 16777215
        mov     rax, qword [rbp-18H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-8H]
        add     rax, rdx
        movzx   eax, byte [rax]
        movzx   eax, al
        pop     rbp
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
        jmp     L_024

L_021:  mov     rax, qword [rbp-38H]
        mov     rdx, qword [rbp-18H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     qword [rbp-40H], rax
        mov     qword [rbp-20H], 0
        jmp     L_023

L_022:  mov     rax, qword [rbp-40H]
        mov     rdx, qword [rbp-20H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rdx, rax
        add     qword [rbp-28H], 1
        mov     rax, qword [rbp-28H]
        mov     qword [rdx], rax
        add     qword [rbp-20H], 1
L_023:  cmp     qword [rbp-20H], 4
        jle     L_022
        add     qword [rbp-18H], 1
L_024:  cmp     qword [rbp-18H], 3
        jle     L_021
        mov     qword [rbp-18H], 0
        jmp     L_028

L_025:  mov     rax, qword [rbp-38H]
        mov     rdx, qword [rbp-18H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     qword [rbp-48H], rax
        mov     qword [rbp-20H], 0
        jmp     L_027

L_026:  cmp     qword [rbp-20H], 4
        sete    al
        movzx   eax, al
        movsxd  rdx, eax
        lea     rax, [rel L_034]
        movzx   eax, byte [rdx+rax]
        movsx   ebx, al
        mov     rax, qword [rbp-48H]
        mov     rdx, qword [rbp-20H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     edx, ebx
        mov     rsi, rax
        lea     rdi, [rel L_033]
        mov     eax, 0
        call    printf
        add     qword [rbp-20H], 1
L_027:  cmp     qword [rbp-20H], 4
        jle     L_026
        add     qword [rbp-18H], 1
L_028:  cmp     qword [rbp-18H], 3
        jle     L_025
        nop
        add     rsp, 72
        pop     rbx
        pop     rbp
        ret


strls:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-8H]
        add     rax, 1
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        shr     eax, 31
        movzx   eax, al
        leave
        ret


strle:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-8H]
        add     rax, 1
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        setle   al
        movzx   eax, al
        leave
        ret


streq:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-8H]
        add     rax, 1
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        sete    al
        movzx   eax, al
        leave
        ret


strge:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-8H]
        add     rax, 1
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        not     eax
        shr     eax, 31
        movzx   eax, al
        leave
        ret


strgt:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-8H]
        add     rax, 1
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        setg    al
        movzx   eax, al
        leave
        ret


strne:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-8H]
        add     rax, 1
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        setne   al
        movzx   eax, al
        leave
        ret


main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     edi, 1
        call    toString
        mov     qword [rbp-20H], rax
        mov     edi, 0
        call    toString
        mov     qword [rbp-28H], rax
        mov     rdx, qword [rbp-28H]
        mov     rax, qword [rbp-20H]
        mov     rsi, rdx
        mov     rdi, rax
        call    strne
        mov     rsi, rax
        lea     rdi, [rel L_035]
        mov     eax, 0
        call    printf
        mov     dword [rbp-2CH], 126
        mov     edi, 0
        call    toString
        mov     qword [rbp-8H], rax
        mov     edi, 0
        call    toString
        mov     qword [rbp-10H], rax
        mov     dword [rbp-14H], 0
        mov     dword [rbp-14H], 0
        jmp     L_030

L_029:  mov     rdx, qword [rbp-20H]
        mov     rax, qword [rbp-8H]
        mov     rsi, rdx
        mov     rdi, rax
        call    concat
        mov     qword [rbp-8H], rax
        mov     rdx, qword [rbp-28H]
        mov     rax, qword [rbp-10H]
        mov     rsi, rdx
        mov     rdi, rax
        call    concat
        mov     qword [rbp-10H], rax
        add     dword [rbp-14H], 1
L_030:  mov     eax, dword [rbp-14H]
        cmp     eax, dword [rbp-2CH]
        jl      L_029
        mov     rax, qword [rbp-8H]
        add     rax, 1
        mov     rdi, rax
        call    puts
        mov     rax, qword [rbp-10H]
        add     rax, 1
        mov     rdi, rax
        call    puts
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp-8H]
        mov     rsi, rdx
        mov     rdi, rax
        call    concat
        add     rax, 1
        mov     rdi, rax
        call    puts
        mov     eax, 0
        leave
        ret



SECTION .data   


SECTION .bss    align=32

buff.1815:
        resb    256


SECTION .rodata 

L_031:
        db 25H, 6CH, 64H, 00H

L_032:
        db 25H, 73H, 00H

L_033:
        db 25H, 64H, 25H, 63H, 00H

L_034:
        db 20H, 0AH, 00H

L_035:
        db 25H, 6CH, 64H, 0AH, 00H


