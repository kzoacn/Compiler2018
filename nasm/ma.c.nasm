





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
extern malloc
extern calloc
extern _GLOBAL_OFFSET_TABLE_


SECTION .text   6

mallocArray:
        push    rbx
        mov     rbx, rdi
        lea     rdi, [rdi*8+8H]
        mov     esi, 1
        call    calloc
        mov     qword [rax], rbx
        pop     rbx
        ret






ALIGN   8

concat:
        push    r13
        push    r12
        mov     r13, rdi
        push    rbp
        push    rbx
        mov     r12, rsi
        sub     rsp, 8
        movzx   edx, byte [rdi]
        movzx   eax, byte [rsi]
        lea     edi, [rdx+rax+2H]
        mov     ebx, edx
        mov     ebp, eax
        movsxd  rdi, edi
        call    malloc
        lea     edx, [rbx+rbp]
        movzx   edi, bl
        test    rdi, rdi
        mov     byte [rax], dl
        jz      OIII_05
        xor     edx, edx




ALIGN   8
OIII_01:  add     rdx, 1
        movzx   ecx, byte [r13+rdx]
        cmp     rdx, rdi
        mov     byte [rax+rdx], cl
        jnz     OIII_01
        lea     rdx, [rdi+1H]
OIII_02:  movzx   r8d, bpl
        test    r8, r8
        jz      OIII_04
        lea     rsi, [rax+rdi]
        xor     edx, edx




ALIGN   8
OIII_03:  movzx   ecx, byte [r12+rdx+1H]
        mov     byte [rsi+rdx+1H], cl
        add     rdx, 1
        cmp     rdx, r8
        jnz     OIII_03
        lea     rdx, [rdx+rdi+1H]
OIII_04:  mov     byte [rax+rdx], 0
        add     rsp, 8
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        ret

OIII_05:  mov     edx, 1
        jmp     OIII_02






ALIGN   8

address:
        lea     rax, [rdi+rsi*8+8H]
        ret







ALIGN   16

multiAddress:
        mov     rcx, qword [rsi]
        mov     rax, rdi
        test    rcx, rcx
        jz      OIII_08
        cmp     rcx, 1
        mov     eax, 1
        jle     OIII_07





ALIGN   16
OIII_06:  mov     rdx, qword [rsi+rax*8]
        add     rax, 1
        cmp     rcx, rax
        mov     rdi, qword [rdi+rdx*8+8H]
        jnz     OIII_06
OIII_07:  mov     rax, qword [rsi+rcx*8]
        lea     rax, [rdi+rax*8+8H]
OIII_08:

        ret






ALIGN   8

_multiArray:
        push    r14
        push    r13
        lea     r13d, [rdi+1H]
        push    r12
        push    rbp
        movsxd  rax, r13d
        push    rbx
        cmp     rax, qword [rsi]
        jz      OIII_11
        movsxd  rdi, edi
        mov     rbp, rsi
        mov     r12, qword [rsi+rdi*8+8H]
        mov     rdi, r12
        call    mallocArray
        test    r12, r12
        mov     r14, rax
        jle     OIII_10
        add     r12, 1
        mov     ebx, 1




ALIGN   16
OIII_09:  mov     rsi, rbp
        mov     edi, r13d
        call    _multiArray
        mov     qword [r14+rbx*8], rax
        add     rbx, 1
        cmp     r12, rbx
        jnz     OIII_09
OIII_10:  pop     rbx
        mov     rax, r14
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        ret





ALIGN   8
OIII_11:  pop     rbx
        movsxd  rdi, edi
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        mov     rdi, qword [rsi+rdi*8+8H]
        jmp     mallocArray






ALIGN   8

multiArray:
        mov     rsi, rdi
        xor     edi, edi
        jmp     _multiArray






ALIGN   8

toString:
        test    rdi, rdi
        push    r12
        push    rbp
        push    rbx
        je      OIII_18
        mov     rbx, rdi
        jns     OIII_19
        neg     rbx
OIII_12:



        db 49H, 0C7H, 0C4H, 0FFH, 0FFH, 0FFH, 0FFH

        db 0BFH, 01H, 00H, 00H, 00H
OIII_13:  mov     rcx, rbx
        mov     rsi, qword 6666666666666667H
        jmp     OIII_15





ALIGN   8
OIII_14:  mov     rdi, rbp
OIII_15:  mov     rax, rcx
        sar     rcx, 63
        lea     rbp, [rdi+1H]
        imul    rsi
        sar     rdx, 2
        sub     rdx, rcx
        mov     rcx, rdx
        jnz     OIII_14
        add     rdi, 3
        call    malloc
        cmp     r12, -1
        mov     byte [rax+rbp+1H], 0
        mov     rsi, rax
        mov     byte [rax], bpl
        jnz     OIII_16
        mov     byte [rsi+1H], 45
OIII_16:  lea     rcx, [rsi+rbp]
        mov     rdi, qword 6666666666666667H




ALIGN   8
OIII_17:  mov     rax, rbx
        sub     rcx, 1
        imul    rdi
        mov     rax, rbx
        sar     rax, 63
        sar     rdx, 2
        sub     rdx, rax
        lea     rax, [rdx+rdx*4]
        add     rax, rax
        sub     rbx, rax
        add     ebx, 48
        mov     byte [rcx+1H], bl
        test    rdx, rdx
        mov     rbx, rdx
        jnz     OIII_17
        pop     rbx
        mov     rax, rsi
        pop     rbp
        pop     r12
        ret

OIII_18:  mov     edi, 3
        call    malloc
        mov     rsi, rax
        mov     byte [rax+2H], 0
        mov     byte [rax], 1
        mov     byte [rax+1H], 48
        mov     rax, rsi
        pop     rbx
        pop     rbp
        pop     r12
        ret

OIII_19:  mov     r12d, 1
        xor     edi, edi
        jmp     OIII_13






ALIGN   8

getInt:
        sub     rsp, 24
        lea     rdi, [rel .LC0]
        xor     eax, eax
        lea     rsi, [rsp+8H]
        call    scanf
        mov     rax, qword [rsp+8H]
        add     rsp, 24
        ret







ALIGN   16

getString:
        push    rbx
        lea     rsi, [rel buff.1823]
        lea     rdi, [rel .LC1]
        xor     eax, eax
        call    scanf
        lea     rcx, [rel buff.1823]
        mov     rbx, rcx
OIII_20:  mov     edx, dword [rbx]
        add     rbx, 4
        lea     eax, [rdx-1010101H]
        not     edx
        and     eax, edx
        and     eax, 80808080H
        jz      OIII_20
        mov     edx, eax
        shr     edx, 16
        test    eax, 8080H
        cmove   eax, edx
        lea     rdx, [rbx+2H]
        mov     esi, eax
        cmove   rbx, rdx
        add     sil, al
        sbb     rbx, 3
        sub     rbx, rcx
        lea     rdi, [rbx+2H]
        call    malloc
        test    rbx, rbx
        mov     byte [rax], bl
        jle     OIII_22
        lea     rdi, [rbx+1H]
        lea     rsi, [rel OIII_35]
        mov     edx, 1




ALIGN   16
OIII_21:  movzx   ecx, byte [rsi+rdx]
        mov     byte [rax+rdx], cl
        add     rdx, 1
        cmp     rdx, rdi
        jnz     OIII_21
OIII_22:  mov     byte [rax+rbx+1H], 0
        pop     rbx
        ret







ALIGN   16

substring:
        push    rbp
        mov     rbp, rdi
        push    rbx
        mov     rdi, rsi
        mov     rbx, rsi
        sub     rdi, rbp
        sub     rsp, 8
        add     rdi, 3
        call    malloc
        mov     edx, ebx
        sub     edx, ebp
        add     edx, 1
        cmp     rbx, rbp
        mov     byte [rax], dl
        jl      OIII_25
        mov     rdi, rax
        lea     r8, [rbx+1H]
        mov     rdx, rbp
        sub     rdi, rbp





ALIGN   16
OIII_23:  movzx   ecx, byte [rdx+1000000H]
        mov     byte [rdi+rdx+1H], cl
        add     rdx, 1
        cmp     r8, rdx
        jnz     OIII_23
        sub     rbx, rbp
        add     rbx, 2
OIII_24:  mov     byte [rax+rbx], 0
        add     rsp, 8
        pop     rbx
        pop     rbp
        ret

OIII_25:  mov     ebx, 1
        jmp     OIII_24






ALIGN   8

parseInt:


        movzx   edi, byte [abs 0FFFFFFH]
        test    rdi, rdi
        jz      OIII_28


        movzx   edx, byte [abs 1000000H]
        xor     eax, eax
        mov     ecx, 1
        lea     esi, [rdx-30H]
        cmp     sil, 9
        jbe     OIII_27
        jmp     OIII_30






ALIGN   16
OIII_26:  movzx   edx, byte [rcx+0FFFFFFH]
        lea     esi, [rdx-30H]
        cmp     sil, 9
        ja      OIII_29
OIII_27:  sub     edx, 48
        lea     rax, [rax+rax*4]
        add     rcx, 1
        movsxd  rdx, edx
        cmp     rcx, rdi
        lea     rax, [rdx+rax*2]
        jle     OIII_26

        ret

OIII_28:  xor     eax, eax
OIII_29:

        ret

OIII_30:

        ret


        nop

ALIGN   16
ord:
        movzx   eax, byte [rdi+1000000H]
        ret






ALIGN   16

test:
        push    r15
        push    r14
        mov     edi, 2
        push    r13
        push    r12
        push    rbp
        push    rbx
        sub     rsp, 8
        call    mallocArray
        xor     edi, edi
        mov     qword [rax+8H], 4
        mov     qword [rax+10H], 5
        mov     rsi, rax
        call    _multiArray
        lea     r12, [rax+8H]
        xor     edi, edi
        xor     edx, edx
        mov     r8, r12
OIII_31:  mov     rcx, rdi
        add     rcx, qword [r8]
        lea     rsi, [rdx+5H]
OIII_32:  add     rdx, 1
        cmp     rdx, rsi
        mov     qword [rcx+rdx*8], rdx
        jnz     OIII_32
        add     r8, 8
        sub     rdi, 40
        cmp     rdx, 20
        jnz     OIII_31
        lea     r14, [rax+28H]
        lea     r13, [rel .LC2]
        lea     rbp, [rel .LC3]
OIII_33:  mov     r15, qword [r12]
        xor     ebx, ebx
OIII_34:  xor     eax, eax
        cmp     rbx, 4
        mov     rdi, rbp
        sete    al
        add     rbx, 1
        movsx   edx, byte [r13+rax]
        mov     rsi, qword [r15+rbx*8]
        xor     eax, eax
        call    printf
        cmp     rbx, 5
        jnz     OIII_34
        add     r12, 8
        cmp     r14, r12
        jnz     OIII_33
        add     rsp, 8
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        pop     r15
        ret






ALIGN   8

strls:
        sub     rsp, 8
        add     rsi, 1
        add     rdi, 1
        call    strcmp
        cdqe
        add     rsp, 8
        shr     rax, 63
        ret






ALIGN   8

strle:
        sub     rsp, 8
        add     rsi, 1
        add     rdi, 1
        call    strcmp
        test    eax, eax
        setle   al
        add     rsp, 8
        movzx   eax, al
        ret






ALIGN   8

streq:
        sub     rsp, 8
        add     rsi, 1
        add     rdi, 1
        call    strcmp
        test    eax, eax
        sete    al
        add     rsp, 8
        movzx   eax, al
        ret






ALIGN   8

strge:
        sub     rsp, 8
        add     rsi, 1
        add     rdi, 1
        call    strcmp
        cdqe
        add     rsp, 8
        not     rax
        shr     rax, 63
        ret


        nop

ALIGN   16
strgt:
        sub     rsp, 8
        add     rsi, 1
        add     rdi, 1
        call    strcmp
        test    eax, eax
        setg    al
        add     rsp, 8
        movzx   eax, al
        ret






ALIGN   8

strne:
        sub     rsp, 8
        add     rsi, 1
        add     rdi, 1
        call    strcmp
        test    eax, eax
        setne   al
        add     rsp, 8
        movzx   eax, al
        ret



SECTION .data   


SECTION .bss    align=32

buff.1823:
        resb    256


SECTION .rodata.str1.1 

.LC0:
        db 25H, 6CH, 64H, 00H

.LC1:
        db 25H, 73H, 00H

.LC3:
        db 25H, 64H, 25H, 63H, 00H

.LC2:
        db 20H, 0AH, 00H

.LC4:
        db 25H, 6CH, 64H, 0AH, 00H


SECTION .text.startup 6

main:
        push    r14
        push    r13
        mov     edi, 1
        push    r12
        push    rbp
        push    rbx
        mov     ebx, 126
        call    toString
        xor     edi, edi
        mov     r13, rax
        call    toString
        lea     rdi, [r13+1H]
        lea     rsi, [rax+1H]
        mov     r14, rax
        call    strcmp
        xor     esi, esi
        lea     rdi, [rel .LC4]
        test    eax, eax
        setne   sil
        xor     eax, eax
        call    printf
        xor     edi, edi
        call    toString
        xor     edi, edi
        mov     rbp, rax
        call    toString
        mov     r12, rax




ALIGN   8
OIII_36:  mov     rdi, rbp
        mov     rsi, r13
        call    concat
        mov     rdi, r12
        mov     rsi, r14
        mov     rbp, rax
        call    concat
        sub     ebx, 1
        mov     r12, rax
        jnz     OIII_36
        lea     rdi, [rbp+1H]
        call    puts
        lea     rdi, [r12+1H]
        call    puts
        mov     rsi, r12
        mov     rdi, rbp
        call    concat
        lea     rdi, [rax+1H]
        call    puts
        pop     rbx
        xor     eax, eax
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        ret



