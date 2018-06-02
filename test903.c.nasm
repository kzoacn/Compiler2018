





default rel

global N
global k
global j
global i
global h
global total
global main

extern scanf
extern _GLOBAL_OFFSET_TABLE_


SECTION .text   


SECTION .data   align=4

k:
        dd 00000066H

j:      dd 00000065H

i:      dd 00000064H

h:      dd 00000063H


SECTION .bss    align=4

total:
        resd    1


SECTION .rodata.str1.1 

.LC0:
        db 25H, 64H, 00H


SECTION .text.startup 6

main:
        push    r15
        push    r14
        lea     rsi, [rel N]
        push    r13
        push    r12
        lea     rdi, [rel .LC0]
        push    rbp
        push    rbx
        xor     eax, eax
        sub     rsp, 40
        call    scanf
        mov     eax, dword [rel N]
        test    eax, eax
        jle     L_008
        mov     r11d, dword [rel i]
        mov     r10d, dword [rel j]
        lea     r14d, [rax+1H]
        mov     r12d, dword [rel h]
        mov     r15d, dword [rel k]
        mov     r13d, 1
        mov     ebx, dword [rel total]
        mov     ebp, r13d
        mov     r9d, r14d
        cmp     r11d, r10d
        mov     byte [rsp+1CH], 0
        mov     r13d, r11d
        setne   byte [rsp+1DH]
        cmp     r12d, r15d
        mov     r14d, r10d
        setne   byte [rsp+1FH]
        mov     dword [rsp+18H], ebx
L_001:  mov     r10d, 1
        mov     eax, r9d
        mov     r9d, r10d
        mov     r10d, eax
L_002:  cmp     ebp, r9d
        mov     eax, r15d
        mov     dword [rsp+8H], 1
        setne   byte [rsp+1EH]
        cmp     r12d, r9d
        mov     r8d, r9d
        setne   byte [rsp+0CH]
        cmp     r13d, r9d
        setne   byte [rsp+0DH]
        cmp     r14d, r9d
        setne   byte [rsp+0EH]
        cmp     r15d, r9d
        mov     r15d, r14d
        setne   byte [rsp+0FH]
        mov     r14d, r13d
        mov     r13d, r12d
        mov     r12d, eax
L_003:  mov     eax, dword [rsp+8H]
        mov     r11d, r8d
        mov     r9d, 1
        mov     r8d, r12d
        cmp     ebp, eax
        setne   cl
        and     cl, byte [rsp+1EH]
        cmp     r13d, eax
        setne   byte [rsp+14H]
        cmp     r14d, eax
        setne   byte [rsp+15H]
        cmp     r15d, eax
        setne   byte [rsp+16H]
        cmp     r12d, eax
        setne   byte [rsp+17H]
L_004:  cmp     r13d, r9d
        mov     edx, 1
        setne   byte [rsp+10H]
        cmp     r14d, r9d
        setne   byte [rsp+11H]
        cmp     r15d, r9d
        setne   byte [rsp+13H]
        cmp     r8d, r9d
        setne   byte [rsp+12H]




ALIGN   8
L_005:  cmp     r13d, edx
        mov     eax, 1
        setne   r12b
        cmp     r14d, edx
        setne   bl
        cmp     r15d, edx
        setne   byte [rsp+6H]
        cmp     r8d, edx
        setne   byte [rsp+7H]




ALIGN   8
L_006:  test    cl, cl
        je      L_007
        cmp     ebp, r9d
        setne   dil
        cmp     ebp, edx
        setne   sil
        test    dil, sil
        je      L_007
        cmp     ebp, eax
        je      L_007
        cmp     r13d, ebp
        je      L_007
        cmp     r14d, ebp
        je      L_007
        cmp     r15d, ebp
        je      L_007
        cmp     r8d, ebp
        je      L_007
        cmp     dword [rsp+8H], r11d
        je      L_007
        cmp     r9d, r11d
        je      L_007
        cmp     edx, r11d
        setne   sil
        cmp     eax, r11d
        setne   dil
        and     esi, edi
        and     sil, byte [rsp+0CH]
        and     sil, byte [rsp+0DH]
        test    byte [rsp+0EH], sil
        je      L_007
        cmp     byte [rsp+0FH], 0
        je      L_007
        mov     edi, dword [rsp+8H]
        cmp     r9d, edi
        setne   sil
        cmp     edx, edi
        setne   dil
        and     esi, edi
        cmp     eax, dword [rsp+8H]
        setne   dil
        and     esi, edi
        and     sil, byte [rsp+14H]
        and     sil, byte [rsp+15H]
        test    byte [rsp+16H], sil
        je      L_007
        cmp     byte [rsp+17H], 0
        jz      L_007
        cmp     edx, r9d
        setne   sil
        cmp     r9d, eax
        setne   dil
        and     esi, edi
        and     sil, byte [rsp+10H]
        and     sil, byte [rsp+11H]
        and     sil, byte [rsp+13H]
        and     sil, byte [rsp+12H]
        cmp     edx, eax
        setne   dil
        and     esi, edi
        and     esi, r12d
        and     esi, ebx
        and     sil, byte [rsp+6H]
        and     sil, byte [rsp+7H]
        cmp     r13d, eax
        setne   dil
        and     esi, edi
        cmp     r14d, eax
        setne   dil
        and     esi, edi
        cmp     r15d, eax
        setne   dil
        and     esi, edi
        cmp     r8d, eax
        setne   dil
        and     esi, edi
        and     sil, byte [rsp+1DH]
        and     sil, byte [rsp+1FH]
        jz      L_007
        add     dword [rsp+18H], 1
        mov     byte [rsp+1CH], sil




ALIGN   8
L_007:  add     eax, 1
        cmp     eax, r10d
        jne     L_006
        add     edx, 1
        cmp     edx, eax
        jne     L_005
        add     r9d, 1
        cmp     r9d, edx
        jne     L_004
        add     dword [rsp+8H], 1
        mov     r12d, r8d
        mov     r8d, r11d
        mov     eax, dword [rsp+8H]
        cmp     eax, r9d
        jne     L_003
        mov     r9d, r11d
        mov     eax, r12d
        mov     r12d, r13d
        add     r9d, 1
        cmp     r9d, dword [rsp+8H]
        mov     r13d, r14d
        mov     r14d, r15d
        mov     r15d, eax
        jne     L_002
        mov     eax, r10d
        add     ebp, 1
        mov     r10d, r9d
        cmp     r10d, ebp
        mov     r9d, eax
        jne     L_001
        cmp     byte [rsp+1CH], 0
        jnz     L_009
L_008:  add     rsp, 40
        xor     eax, eax
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        ret

L_009:  mov     eax, dword [rsp+18H]
        mov     dword [rel total], eax
        jmp     L_008



