





default rel

global main

extern printf
extern scanf
extern _GLOBAL_OFFSET_TABLE_


SECTION .text   


SECTION .data   


SECTION .bss    


SECTION .rodata.str1.1 

.LC0:
        db 25H, 64H, 00H

.LC1:
        db 25H, 64H, 0AH, 00H


SECTION .text.startup 6

main:
        push    r13
        push    r12
        lea     rdi, [rel .LC0]
        push    rbp
        push    rbx
        xor     eax, eax
        xor     ebx, ebx
        sub     rsp, 24
        lea     rsi, [rsp+0CH]
        call    scanf
        mov     edi, dword [rsp+0CH]
        xor     esi, esi
        test    edi, edi
        jle     L_011
L_001:  xor     ebp, ebp
L_002:  cmp     ebp, ebx
        sete    r13b
        xor     r12d, r12d
L_003:  test    r12d, r12d
        setg    r8b
        xor     r10d, r10d
        and     r8d, r13d
L_004:  xor     r11d, r11d
L_005:  xor     r9d, r9d




ALIGN   8
L_006:  xor     eax, eax




ALIGN   8
L_007:  test    r8b, r8b
        jnz     L_008
        test    r9d, r9d
        setg    dl
        cmp     r10d, r11d
        sete    cl
        test    cl, dl
        jz      L_012
        test    eax, eax
        jle     L_012
L_008:  add     esi, 2
        mov     edx, 1
L_009:  add     esi, 2
L_010:  add     eax, 1
        lea     esi, [rsi+rdx*2]
        cmp     eax, edi
        jnz     L_007
        add     r9d, 1
        cmp     edi, r9d
        jnz     L_006
        add     r11d, 1
        cmp     edi, r11d
        jnz     L_005
        add     r10d, 1
        cmp     edi, r10d
        jnz     L_004
        add     r12d, 1
        cmp     edi, r12d
        jnz     L_003
        add     ebp, 1
        cmp     edi, ebp
        jne     L_002
        add     ebx, 1
        cmp     edi, ebx
        jne     L_001
L_011:  lea     rdi, [rel .LC1]
        xor     eax, eax
        call    printf
        add     rsp, 24
        xor     eax, eax
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        ret





ALIGN   8
L_012:  cmp     eax, ebx
        jz      L_008
        test    r10d, r10d
        setg    cl
        and     ecx, edx
        test    cl, cl
        movzx   edx, cl
        jz      L_010
        add     esi, 2
        jmp     L_009



