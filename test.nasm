	 global    main
	 extern    puts
	 extern    printf
	 extern    scanf
	 extern    malloc
	 extern    calloc
	 extern    strlen
	 extern    strcmp
	 extern    memset
	 extern    memcpy
	 extern    sprintf

	 section   .text
myalloc:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-18H], rdi
        mov     rax, qword [rel cur.1759]
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-18H]
        add     rax, 8
        and     rax, 0FFFFFFFFFFFFFFF8H
        mov     qword [rbp-18H], rax
        mov     rdx, qword [rel cur.1759]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        mov     qword [rel cur.1759], rax
        mov     rax, qword [rbp-8H]
        pop     rbp
        ret

toString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 56
        mov     qword [rbp-38H], rdi
        mov     qword [rbp-8H], 0
        mov     qword [rbp-10H], 1
        cmp     qword [rbp-38H], 0
        jnz     TS_013
        mov     qword [rbp-8H], 1
TS_013:  cmp     qword [rbp-38H], 0
        jns     TS_014
        neg     qword [rbp-38H]
        mov     qword [rbp-10H], -1
        add     qword [rbp-8H], 1
TS_014:  mov     rax, qword [rbp-38H]
        mov     qword [rbp-18H], rax
        jmp     TS_016

TS_015:  add     qword [rbp-8H], 1
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
TS_016:  cmp     qword [rbp-18H], 0
        jg      TS_015
        mov     rax, qword [rbp-8H]
        add     rax, 2
        mov     rdi, rax
        call    myalloc
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
        jnz     TS_017
        mov     rax, qword [rbp-20H]
        mov     byte [rax], 45
TS_017:  mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-28H]
        add     rax, rdx
        mov     qword [rbp-20H], rax
        cmp     qword [rbp-38H], 0
        jnz     TS_019
        mov     rax, qword [rbp-20H]
        mov     byte [rax], 48
        jmp     TS_019

TS_018:  mov     rcx, qword [rbp-38H]
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
        lea     edx, [rax+30H]
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
TS_019:  cmp     qword [rbp-38H], 0
        jg      TS_018
        mov     rax, qword [rbp-28H]
        leave
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
        call    myalloc
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
        call    myalloc
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
        jmp     ML_02

ML_01:  add     qword [rbp-10H], 1
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
ML_02:  mov     rax, qword [rbp-28H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      ML_01
        mov     qword [rbp-8H], 0
        jmp     ML_04

ML_03:  add     qword [rbp-10H], 1
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
ML_04:  mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      ML_03
        add     qword [rbp-10H], 1
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        mov     byte [rax], 0
        mov     rax, qword [rbp-18H]
        leave
        ret

address:
        lea     rax, [rdi+rsi*8+8H]
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
        jnz     ML_09
        mov     eax, dword [rbp-34H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-40H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     rdi, rax
        call    mallocArray
        jmp     ML_12

ML_09:  mov     eax, dword [rbp-34H]
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
        jmp     ML_11

ML_10:  mov     eax, dword [rbp-14H]
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
ML_11:  mov     eax, dword [rbp-14H]
        cdqe
        cmp     rax, qword [rbp-20H]
        jl      ML_10
        mov     rax, qword [rbp-28H]
ML_12:  add     rsp, 56
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
        jnz     DD5
        mov     rax, qword [rbp-28H]
        jmp     DD8

DD5:  mov     qword [rbp-8H], 1
        jmp     DD7

DD6:  mov     rax, qword [rbp-8H]
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
DD7:  mov     rax, qword [rbp-8H]
        cmp     rax, qword [rbp-18H]
        jl      DD6
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
DD8:  leave
        ret

getInt:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        lea     rax, [rbp-8H]
        mov     rsi, rax
        mov     edi, GS_31
        mov     eax, 0
        call    scanf
        mov     rax, qword [rbp-8H]
        leave
        ret

getString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     esi, buff.1788
        mov     edi, GS_32
        mov     eax, 0
        call    scanf
        mov     edi, buff.1788
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
        jmp     GS_20

GS_19:  mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-18H]
        add     rdx, rax
        mov     rax, qword [rbp-8H]
        sub     rax, 1

        movzx   eax, byte [abs buff.1788+rax]
        mov     byte [rdx], al
        add     qword [rbp-8H], 1
GS_20:  mov     rax, qword [rbp-8H]
        cmp     rax, qword [rbp-10H]
        jle     GS_19
        mov     rax, qword [rbp-18H]
        leave
        ret

parseInt:
        push    rbp
        mov     rbp, rsp
        mov     r8,qword [arg+8*63]
        mov     qword [rbp-18H], r8
        mov     qword [rbp-10H], 0
        mov     qword [rbp-8H], 1
        jmp     PSL_025

PSL_023:  mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 47
        jbe     PSL_024
        mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 57
        ja      PSL_024
        mov     rdx, qword [rbp-10H]
        mov     rax, rdx
        shl     rax, 2
        add     rax, rdx
        add     rax, rax
        mov     rdx, rax
        mov     rcx, qword [rbp-8H]
        mov     rax, qword [rbp-18H]
        add     rax, rcx
        movzx   eax, byte [rax]
        movzx   eax, al
        sub     eax, 48
        cdqe
        add     rax, rdx
        mov     qword [rbp-10H], rax
        add     qword [rbp-8H], 1
        jmp     PSL_025

PSL_024:  mov     rax, qword [rbp-10H]
        jmp     PSL_026

PSL_025:  mov     rax, qword [rbp-18H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jge     PSL_023
        mov     rax, qword [rbp-10H]
PSL_026:  pop     rbp
        ret

substring:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp-28H], rdi
        mov     qword [rbp-30H], rsi
        mov     r8,qword [arg+8*63]
        mov     qword [rbp-18H], r8
        mov     rax, qword [rbp-28H]
        mov     rdx, qword [rbp-30H]
        sub     rdx, rax
        mov     rax, rdx
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
        jmp     PSL_022

PSL_021:  add     qword [rbp-10H], 1
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp-20H]
        add     rdx, rax
        mov     rax, qword [rbp-8H]
        lea     rcx, [rax+1H]
        mov     rax, qword [rbp-18H]
        add     rax, rcx
        movzx   eax, byte [rax]
        mov     byte [rdx], al
        add     qword [rbp-8H], 1
PSL_022:  mov     rax, qword [rbp-8H]
        cmp     rax, qword [rbp-30H]
        jle     PSL_021
        add     qword [rbp-10H], 1
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        mov     byte [rax], 0
        mov     rax, qword [rbp-20H]
        leave
        ret

ord:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-18H], rdi
        mov     r8,qword [arg+8*63]
        mov     qword [rbp-8H], r8
        mov     rax, qword [rbp-18H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-8H]
        add     rax, rdx
        movzx   eax, byte [rax]
        movzx   eax, al
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
	push   rbp
	mov    rbp, rsp
	sub    rsp, 13888
	mov     rax, 936870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 936870912
        movsxd  rdx, edx
        sub     rdx, 15872
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	call global_init
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	mov rbx , rax
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*1],rbx
	mov rax,  [gbl+8*3]
	mov rbx,rax
	mov qword [rsp+8*2],rdx
	mov rdx,0
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*4],rbx
	mov rbx,t143
	mov [rax],rbx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov qword [rsp+8*5],rax
	mov rax,1
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*6],rbx
	mov rbx,t147
	mov [rdx],rbx
	mov qword [rsp+8*7],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,2
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*8],rbx
	mov rbx,t151
	mov [rdx],rbx
	mov qword [rsp+8*9],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,3
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*10],rbx
	mov rbx,t155
	mov [rdx],rbx
	mov qword [rsp+8*11],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,4
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*12],rbx
	mov rbx,t159
	mov [rdx],rbx
	mov qword [rsp+8*13],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,5
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*14],rbx
	mov rbx,t163
	mov [rdx],rbx
	mov qword [rsp+8*15],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,6
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*16],rbx
	mov rbx,t167
	mov [rdx],rbx
	mov qword [rsp+8*17],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*18],rbx
	mov rbx,t171
	mov [rdx],rbx
	mov qword [rsp+8*19],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*20],rbx
	mov rbx,t175
	mov [rdx],rbx
	mov qword [rsp+8*21],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,9
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*22],rbx
	mov rbx,t179
	mov [rdx],rbx
	mov qword [rsp+8*23],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*24],rbx
	mov rbx,t183
	mov [rdx],rbx
	mov qword [rsp+8*25],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,11
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*26],rbx
	mov rbx,t187
	mov [rdx],rbx
	mov qword [rsp+8*27],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,12
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*28],rbx
	mov rbx,t191
	mov [rdx],rbx
	mov qword [rsp+8*29],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,13
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*30],rbx
	mov rbx,t195
	mov [rdx],rbx
	mov qword [rsp+8*31],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,14
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*32],rbx
	mov rbx,t199
	mov [rdx],rbx
	mov qword [rsp+8*33],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*34],rbx
	mov rbx,t203
	mov [rdx],rbx
	mov qword [rsp+8*35],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*36],rbx
	mov rbx,t207
	mov [rdx],rbx
	mov qword [rsp+8*37],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*38],rbx
	mov rbx,t211
	mov [rdx],rbx
	mov qword [rsp+8*39],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,18
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*40],rbx
	mov rbx,t215
	mov [rdx],rbx
	mov qword [rsp+8*41],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,19
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*42],rbx
	mov rbx,t219
	mov [rdx],rbx
	mov qword [rsp+8*43],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,20
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*44],rbx
	mov rbx,t223
	mov [rdx],rbx
	mov qword [rsp+8*45],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,21
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*46],rbx
	mov rbx,t227
	mov [rdx],rbx
	mov qword [rsp+8*47],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,22
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*48],rbx
	mov rbx,t231
	mov [rdx],rbx
	mov qword [rsp+8*49],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,23
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*50],rbx
	mov rbx,t235
	mov [rdx],rbx
	mov qword [rsp+8*51],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,24
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*52],rbx
	mov rbx,t239
	mov [rdx],rbx
	mov qword [rsp+8*53],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,25
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*54],rbx
	mov rbx,t243
	mov [rdx],rbx
	mov qword [rsp+8*55],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*56],rbx
	mov rbx,t247
	mov [rdx],rbx
	mov qword [rsp+8*57],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,27
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*58],rbx
	mov rbx,t251
	mov [rdx],rbx
	mov qword [rsp+8*59],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx,t255
	mov [rdx],rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,29
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*62],rbx
	mov rbx,t259
	mov [rdx],rbx
	mov qword [rsp+8*63],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,30
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*64],rbx
	mov rbx,t263
	mov [rdx],rbx
	mov qword [rsp+8*65],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,31
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*66],rbx
	mov rbx,t267
	mov [rdx],rbx
	mov qword [rsp+8*67],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,32
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*68],rbx
	mov rbx,t271
	mov [rdx],rbx
	mov qword [rsp+8*69],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,33
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*70],rbx
	mov rbx,t275
	mov [rdx],rbx
	mov qword [rsp+8*71],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,34
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*72],rbx
	mov rbx,t279
	mov [rdx],rbx
	mov qword [rsp+8*73],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,35
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*74],rbx
	mov rbx,t283
	mov [rdx],rbx
	mov qword [rsp+8*75],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,36
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*76],rbx
	mov rbx,t287
	mov [rdx],rbx
	mov qword [rsp+8*77],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,37
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*78],rbx
	mov rbx,t291
	mov [rdx],rbx
	mov qword [rsp+8*79],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,38
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*80],rbx
	mov rbx,t295
	mov [rdx],rbx
	mov qword [rsp+8*81],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,39
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*82],rbx
	mov rbx,t299
	mov [rdx],rbx
	mov qword [rsp+8*83],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,40
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*84],rbx
	mov rbx,t303
	mov [rdx],rbx
	mov qword [rsp+8*85],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,41
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*86],rbx
	mov rbx,t307
	mov [rdx],rbx
	mov qword [rsp+8*87],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,42
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*88],rbx
	mov rbx,t311
	mov [rdx],rbx
	mov qword [rsp+8*89],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,43
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*90],rbx
	mov rbx,t315
	mov [rdx],rbx
	mov qword [rsp+8*91],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,44
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*92],rbx
	mov rbx,t319
	mov [rdx],rbx
	mov qword [rsp+8*93],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,45
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*94],rbx
	mov rbx,t323
	mov [rdx],rbx
	mov qword [rsp+8*95],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,46
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*96],rbx
	mov rbx,t327
	mov [rdx],rbx
	mov qword [rsp+8*97],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,47
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*98],rbx
	mov rbx,t331
	mov [rdx],rbx
	mov qword [rsp+8*99],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,48
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*100],rbx
	mov rbx,t335
	mov [rdx],rbx
	mov qword [rsp+8*101],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,49
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*102],rbx
	mov rbx,t339
	mov [rdx],rbx
	mov qword [rsp+8*103],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,50
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*104],rbx
	mov rbx,t343
	mov [rdx],rbx
	mov qword [rsp+8*105],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,51
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*106],rbx
	mov rbx,t347
	mov [rdx],rbx
	mov qword [rsp+8*107],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,52
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*108],rbx
	mov rbx,t351
	mov [rdx],rbx
	mov qword [rsp+8*109],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,53
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*110],rbx
	mov rbx,t355
	mov [rdx],rbx
	mov qword [rsp+8*111],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,54
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*112],rbx
	mov rbx,t359
	mov [rdx],rbx
	mov qword [rsp+8*113],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,55
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*114],rbx
	mov rbx,t363
	mov [rdx],rbx
	mov qword [rsp+8*115],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,56
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*116],rbx
	mov rbx,t367
	mov [rdx],rbx
	mov qword [rsp+8*117],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,57
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*118],rbx
	mov rbx,t371
	mov [rdx],rbx
	mov qword [rsp+8*119],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*120],rbx
	mov rbx,t375
	mov [rdx],rbx
	mov qword [rsp+8*121],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*122],rbx
	mov rbx,t379
	mov [rdx],rbx
	mov qword [rsp+8*123],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,60
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*124],rbx
	mov rbx,t383
	mov [rdx],rbx
	mov qword [rsp+8*125],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,61
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*126],rbx
	mov rbx,t387
	mov [rdx],rbx
	mov qword [rsp+8*127],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,62
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*128],rbx
	mov rbx,t391
	mov [rdx],rbx
	mov qword [rsp+8*129],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,63
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*130],rbx
	mov rbx,t395
	mov [rdx],rbx
	mov qword [rsp+8*131],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,64
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*132],rbx
	mov rbx,t399
	mov [rdx],rbx
	mov qword [rsp+8*133],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*134],rbx
	mov rbx,t403
	mov [rdx],rbx
	mov qword [rsp+8*135],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*136],rbx
	mov rbx,t407
	mov [rdx],rbx
	mov qword [rsp+8*137],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*138],rbx
	mov rbx,t411
	mov [rdx],rbx
	mov qword [rsp+8*139],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,68
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*140],rbx
	mov rbx,t415
	mov [rdx],rbx
	mov qword [rsp+8*141],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*142],rbx
	mov rbx,t419
	mov [rdx],rbx
	mov qword [rsp+8*143],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,70
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*144],rbx
	mov rbx,t423
	mov [rdx],rbx
	mov qword [rsp+8*145],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*146],rbx
	mov rbx,t427
	mov [rdx],rbx
	mov qword [rsp+8*147],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,72
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*148],rbx
	mov rbx,t431
	mov [rdx],rbx
	mov qword [rsp+8*149],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,73
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*150],rbx
	mov rbx,t435
	mov [rdx],rbx
	mov qword [rsp+8*151],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,74
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*152],rbx
	mov rbx,t439
	mov [rdx],rbx
	mov qword [rsp+8*153],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,75
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*154],rbx
	mov rbx,t443
	mov [rdx],rbx
	mov qword [rsp+8*155],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*156],rbx
	mov rbx,t447
	mov [rdx],rbx
	mov qword [rsp+8*157],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,77
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*158],rbx
	mov rbx,t451
	mov [rdx],rbx
	mov qword [rsp+8*159],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,78
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*160],rbx
	mov rbx,t455
	mov [rdx],rbx
	mov qword [rsp+8*161],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,79
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*162],rbx
	mov rbx,t459
	mov [rdx],rbx
	mov qword [rsp+8*163],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*164],rbx
	mov rbx,t463
	mov [rdx],rbx
	mov qword [rsp+8*165],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*166],rbx
	mov rbx,t467
	mov [rdx],rbx
	mov qword [rsp+8*167],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*168],rbx
	mov rbx,t471
	mov [rdx],rbx
	mov qword [rsp+8*169],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*170],rbx
	mov rbx,t475
	mov [rdx],rbx
	mov qword [rsp+8*171],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,84
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*172],rbx
	mov rbx,t479
	mov [rdx],rbx
	mov qword [rsp+8*173],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,85
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*174],rbx
	mov rbx,t483
	mov [rdx],rbx
	mov qword [rsp+8*175],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*176],rbx
	mov rbx,t487
	mov [rdx],rbx
	mov qword [rsp+8*177],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,87
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*178],rbx
	mov rbx,t491
	mov [rdx],rbx
	mov qword [rsp+8*179],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,88
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*180],rbx
	mov rbx,t495
	mov [rdx],rbx
	mov qword [rsp+8*181],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,89
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*182],rbx
	mov rbx,t499
	mov [rdx],rbx
	mov qword [rsp+8*183],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,90
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*184],rbx
	mov rbx,t503
	mov [rdx],rbx
	mov qword [rsp+8*185],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,91
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*186],rbx
	mov rbx,t507
	mov [rdx],rbx
	mov qword [rsp+8*187],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,92
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*188],rbx
	mov rbx,t511
	mov [rdx],rbx
	mov qword [rsp+8*189],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*191],rbx
	mov rbx,t515
	mov [rdx],rbx
	mov qword [rsp+8*192],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,1
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*193],rbx
	mov rbx,t519
	mov [rdx],rbx
	mov qword [rsp+8*194],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,2
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*195],rbx
	mov rbx,t523
	mov [rdx],rbx
	mov qword [rsp+8*196],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,3
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*197],rbx
	mov rbx,t527
	mov [rdx],rbx
	mov qword [rsp+8*198],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,4
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*199],rbx
	mov rbx,t531
	mov [rdx],rbx
	mov qword [rsp+8*200],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,5
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*201],rbx
	mov rbx,t535
	mov [rdx],rbx
	mov qword [rsp+8*202],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,6
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*203],rbx
	mov rbx,t539
	mov [rdx],rbx
	mov qword [rsp+8*204],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*205],rbx
	mov rbx,t543
	mov [rdx],rbx
	mov qword [rsp+8*206],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*207],rbx
	mov rbx,t547
	mov [rdx],rbx
	mov qword [rsp+8*208],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,9
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*209],rbx
	mov rbx,t551
	mov [rdx],rbx
	mov qword [rsp+8*210],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*211],rbx
	mov rbx,t555
	mov [rdx],rbx
	mov qword [rsp+8*212],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,11
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*213],rbx
	mov rbx,t559
	mov [rdx],rbx
	mov qword [rsp+8*214],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,12
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*215],rbx
	mov rbx,t563
	mov [rdx],rbx
	mov qword [rsp+8*216],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,13
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*217],rbx
	mov rbx,t567
	mov [rdx],rbx
	mov qword [rsp+8*218],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,14
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*219],rbx
	mov rbx,t571
	mov [rdx],rbx
	mov qword [rsp+8*220],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*221],rbx
	mov rbx,t575
	mov [rdx],rbx
	mov qword [rsp+8*222],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*223],rbx
	mov rbx,t579
	mov [rdx],rbx
	mov qword [rsp+8*224],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*225],rbx
	mov rbx,t583
	mov [rdx],rbx
	mov qword [rsp+8*226],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,18
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*227],rbx
	mov rbx,t587
	mov [rdx],rbx
	mov qword [rsp+8*228],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,19
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*229],rbx
	mov rbx,t591
	mov [rdx],rbx
	mov qword [rsp+8*230],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,20
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*231],rbx
	mov rbx,t595
	mov [rdx],rbx
	mov qword [rsp+8*232],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,21
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*233],rbx
	mov rbx,t599
	mov [rdx],rbx
	mov qword [rsp+8*234],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,22
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*235],rbx
	mov rbx,t603
	mov [rdx],rbx
	mov qword [rsp+8*236],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,23
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*237],rbx
	mov rbx,t607
	mov [rdx],rbx
	mov qword [rsp+8*238],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,24
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*239],rbx
	mov rbx,t611
	mov [rdx],rbx
	mov qword [rsp+8*240],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,25
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*241],rbx
	mov rbx,t615
	mov [rdx],rbx
	mov qword [rsp+8*242],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*243],rbx
	mov rbx,t619
	mov [rdx],rbx
	mov qword [rsp+8*244],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,27
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*245],rbx
	mov rbx,t623
	mov [rdx],rbx
	mov qword [rsp+8*246],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*247],rbx
	mov rbx,t627
	mov [rdx],rbx
	mov qword [rsp+8*248],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,29
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*249],rbx
	mov rbx,t631
	mov [rdx],rbx
	mov qword [rsp+8*250],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,30
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*251],rbx
	mov rbx,t635
	mov [rdx],rbx
	mov qword [rsp+8*252],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,31
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*253],rbx
	mov rbx,t639
	mov [rdx],rbx
	mov qword [rsp+8*254],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*255],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*256],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*257],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*260],rbx
	mov qword [rsp+8*258],rdx
	mov qword [rsp+8*259],rax
	mov     rsi, [rsp+8*260]
	mov     rdi, [rsp+8*257]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*262],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*264],rbx
	mov qword [rsp+8*263],rdx
	mov     rsi, [rsp+8*264]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*265],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*267],rbx
	mov qword [rsp+8*266],rdx
	mov     rsi, [rsp+8*267]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*268],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*270],rbx
	mov qword [rsp+8*269],rdx
	mov     rsi, [rsp+8*270]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*271],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*273],rbx
	mov qword [rsp+8*272],rdx
	mov     rsi, [rsp+8*273]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*274],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*276],rbx
	mov qword [rsp+8*275],rdx
	mov     rsi, [rsp+8*276]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*277],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*279],rbx
	mov qword [rsp+8*278],rdx
	mov     rsi, [rsp+8*279]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*280],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*282],rbx
	mov qword [rsp+8*281],rdx
	mov     rsi, [rsp+8*282]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*283],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*285],rbx
	mov qword [rsp+8*284],rdx
	mov     rsi, [rsp+8*285]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*286],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*288],rbx
	mov qword [rsp+8*287],rdx
	mov     rsi, [rsp+8*288]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*289],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*291],rbx
	mov qword [rsp+8*290],rdx
	mov     rsi, [rsp+8*291]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*292],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*294],rbx
	mov qword [rsp+8*293],rdx
	mov     rsi, [rsp+8*294]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*295],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*297],rbx
	mov qword [rsp+8*296],rdx
	mov     rsi, [rsp+8*297]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*298],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*300],rbx
	mov qword [rsp+8*299],rdx
	mov     rsi, [rsp+8*300]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*301],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*303],rbx
	mov qword [rsp+8*302],rdx
	mov     rsi, [rsp+8*303]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*304],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*306],rbx
	mov qword [rsp+8*305],rdx
	mov     rsi, [rsp+8*306]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*307],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*309],rbx
	mov qword [rsp+8*308],rdx
	mov     rsi, [rsp+8*309]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,89
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*310],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*312],rbx
	mov qword [rsp+8*311],rdx
	mov     rsi, [rsp+8*312]
	mov     rdi, [rsp+8*261]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*261], rax
	mov rbx,  [rsp+8*261]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*314],rdx
	mov rdi,[rsp+8*314] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*315],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*316],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*317],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*320],rbx
	mov qword [rsp+8*318],rdx
	mov qword [rsp+8*319],rax
	mov     rsi, [rsp+8*320]
	mov     rdi, [rsp+8*317]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*322],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*324],rbx
	mov qword [rsp+8*323],rdx
	mov     rsi, [rsp+8*324]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*325],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*327],rbx
	mov qword [rsp+8*326],rdx
	mov     rsi, [rsp+8*327]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*328],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*330],rbx
	mov qword [rsp+8*329],rdx
	mov     rsi, [rsp+8*330]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*331],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*333],rbx
	mov qword [rsp+8*332],rdx
	mov     rsi, [rsp+8*333]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*334],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*336],rbx
	mov qword [rsp+8*335],rdx
	mov     rsi, [rsp+8*336]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*337],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*339],rbx
	mov qword [rsp+8*338],rdx
	mov     rsi, [rsp+8*339]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*340],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*342],rbx
	mov qword [rsp+8*341],rdx
	mov     rsi, [rsp+8*342]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*343],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*345],rbx
	mov qword [rsp+8*344],rdx
	mov     rsi, [rsp+8*345]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*346],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*348],rbx
	mov qword [rsp+8*347],rdx
	mov     rsi, [rsp+8*348]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*349],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*351],rbx
	mov qword [rsp+8*350],rdx
	mov     rsi, [rsp+8*351]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*352],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*354],rbx
	mov qword [rsp+8*353],rdx
	mov     rsi, [rsp+8*354]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*355],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*357],rbx
	mov qword [rsp+8*356],rdx
	mov     rsi, [rsp+8*357]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*358],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*360],rbx
	mov qword [rsp+8*359],rdx
	mov     rsi, [rsp+8*360]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*362],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*364],rbx
	mov qword [rsp+8*363],rdx
	mov     rsi, [rsp+8*364]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*365],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*367],rbx
	mov qword [rsp+8*366],rdx
	mov     rsi, [rsp+8*367]
	mov     rdi, [rsp+8*321]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*321], rax
	mov rbx,  [rsp+8*321]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*368],rdx
	mov rdi,[rsp+8*368] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*369],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*370],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*371],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*374],rbx
	mov qword [rsp+8*372],rdx
	mov qword [rsp+8*373],rax
	mov     rsi, [rsp+8*374]
	mov     rdi, [rsp+8*371]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*376],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*378],rbx
	mov qword [rsp+8*377],rdx
	mov     rsi, [rsp+8*378]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*379],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*381],rbx
	mov qword [rsp+8*380],rdx
	mov     rsi, [rsp+8*381]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*382],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*384],rbx
	mov qword [rsp+8*383],rdx
	mov     rsi, [rsp+8*384]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*385],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*387],rbx
	mov qword [rsp+8*386],rdx
	mov     rsi, [rsp+8*387]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*388],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*390],rbx
	mov qword [rsp+8*389],rdx
	mov     rsi, [rsp+8*390]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*391],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*393],rbx
	mov qword [rsp+8*392],rdx
	mov     rsi, [rsp+8*393]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*394],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*396],rbx
	mov qword [rsp+8*395],rdx
	mov     rsi, [rsp+8*396]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*397],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*399],rbx
	mov qword [rsp+8*398],rdx
	mov     rsi, [rsp+8*399]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*400],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*402],rbx
	mov qword [rsp+8*401],rdx
	mov     rsi, [rsp+8*402]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*403],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*405],rbx
	mov qword [rsp+8*404],rdx
	mov     rsi, [rsp+8*405]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*406],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*408],rbx
	mov qword [rsp+8*407],rdx
	mov     rsi, [rsp+8*408]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*409],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*411],rbx
	mov qword [rsp+8*410],rdx
	mov     rsi, [rsp+8*411]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*412],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*414],rbx
	mov qword [rsp+8*413],rdx
	mov     rsi, [rsp+8*414]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*415],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*417],rbx
	mov qword [rsp+8*416],rdx
	mov     rsi, [rsp+8*417]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*418],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*420],rbx
	mov qword [rsp+8*419],rdx
	mov     rsi, [rsp+8*420]
	mov     rdi, [rsp+8*375]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*375], rax
	mov rbx,  [rsp+8*375]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*421],rdx
	mov rdi,[rsp+8*421] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*422],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*423],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*424],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*427],rbx
	mov qword [rsp+8*425],rdx
	mov qword [rsp+8*426],rax
	mov     rsi, [rsp+8*427]
	mov     rdi, [rsp+8*424]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*429],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*431],rbx
	mov qword [rsp+8*430],rdx
	mov     rsi, [rsp+8*431]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*432],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*434],rbx
	mov qword [rsp+8*433],rdx
	mov     rsi, [rsp+8*434]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*435],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*437],rbx
	mov qword [rsp+8*436],rdx
	mov     rsi, [rsp+8*437]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*438],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*440],rbx
	mov qword [rsp+8*439],rdx
	mov     rsi, [rsp+8*440]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*441],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*443],rbx
	mov qword [rsp+8*442],rdx
	mov     rsi, [rsp+8*443]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*444],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*446],rbx
	mov qword [rsp+8*445],rdx
	mov     rsi, [rsp+8*446]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*447],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*449],rbx
	mov qword [rsp+8*448],rdx
	mov     rsi, [rsp+8*449]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*450],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*452],rbx
	mov qword [rsp+8*451],rdx
	mov     rsi, [rsp+8*452]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*453],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*455],rbx
	mov qword [rsp+8*454],rdx
	mov     rsi, [rsp+8*455]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*456],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*458],rbx
	mov qword [rsp+8*457],rdx
	mov     rsi, [rsp+8*458]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*459],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*461],rbx
	mov qword [rsp+8*460],rdx
	mov     rsi, [rsp+8*461]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*462],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*464],rbx
	mov qword [rsp+8*463],rdx
	mov     rsi, [rsp+8*464]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*465],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*467],rbx
	mov qword [rsp+8*466],rdx
	mov     rsi, [rsp+8*467]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*468],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*470],rbx
	mov qword [rsp+8*469],rdx
	mov     rsi, [rsp+8*470]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*471],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*473],rbx
	mov qword [rsp+8*472],rdx
	mov     rsi, [rsp+8*473]
	mov     rdi, [rsp+8*428]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*428], rax
	mov rbx,  [rsp+8*428]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*474],rdx
	mov rdi,[rsp+8*474] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*475],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*476],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*477],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*480],rbx
	mov qword [rsp+8*478],rdx
	mov qword [rsp+8*479],rax
	mov     rsi, [rsp+8*480]
	mov     rdi, [rsp+8*477]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*482],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*484],rbx
	mov qword [rsp+8*483],rdx
	mov     rsi, [rsp+8*484]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*485],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*487],rbx
	mov qword [rsp+8*486],rdx
	mov     rsi, [rsp+8*487]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*488],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*490],rbx
	mov qword [rsp+8*489],rdx
	mov     rsi, [rsp+8*490]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*491],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*493],rbx
	mov qword [rsp+8*492],rdx
	mov     rsi, [rsp+8*493]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,18
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*494],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*496],rbx
	mov qword [rsp+8*495],rdx
	mov     rsi, [rsp+8*496]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*497],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*499],rbx
	mov qword [rsp+8*498],rdx
	mov     rsi, [rsp+8*499]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*500],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*502],rbx
	mov qword [rsp+8*501],rdx
	mov     rsi, [rsp+8*502]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*503],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*505],rbx
	mov qword [rsp+8*504],rdx
	mov     rsi, [rsp+8*505]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*506],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*508],rbx
	mov qword [rsp+8*507],rdx
	mov     rsi, [rsp+8*508]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*509],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*511],rbx
	mov qword [rsp+8*510],rdx
	mov     rsi, [rsp+8*511]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*512],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*514],rbx
	mov qword [rsp+8*513],rdx
	mov     rsi, [rsp+8*514]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*515],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*517],rbx
	mov qword [rsp+8*516],rdx
	mov     rsi, [rsp+8*517]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*518],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*520],rbx
	mov qword [rsp+8*519],rdx
	mov     rsi, [rsp+8*520]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,18
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*521],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*523],rbx
	mov qword [rsp+8*522],rdx
	mov     rsi, [rsp+8*523]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*524],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*526],rbx
	mov qword [rsp+8*525],rdx
	mov     rsi, [rsp+8*526]
	mov     rdi, [rsp+8*481]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*481], rax
	mov rbx,  [rsp+8*481]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*527],rdx
	mov rdi,[rsp+8*527] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*528],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*529],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*530],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*533],rbx
	mov qword [rsp+8*531],rdx
	mov qword [rsp+8*532],rax
	mov     rsi, [rsp+8*533]
	mov     rdi, [rsp+8*530]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*535],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*537],rbx
	mov qword [rsp+8*536],rdx
	mov     rsi, [rsp+8*537]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*538],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*540],rbx
	mov qword [rsp+8*539],rdx
	mov     rsi, [rsp+8*540]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*541],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*543],rbx
	mov qword [rsp+8*542],rdx
	mov     rsi, [rsp+8*543]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*544],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*546],rbx
	mov qword [rsp+8*545],rdx
	mov     rsi, [rsp+8*546]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,19
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*547],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*549],rbx
	mov qword [rsp+8*548],rdx
	mov     rsi, [rsp+8*549]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*550],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*552],rbx
	mov qword [rsp+8*551],rdx
	mov     rsi, [rsp+8*552]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*553],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*555],rbx
	mov qword [rsp+8*554],rdx
	mov     rsi, [rsp+8*555]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*556],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*558],rbx
	mov qword [rsp+8*557],rdx
	mov     rsi, [rsp+8*558]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*559],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*561],rbx
	mov qword [rsp+8*560],rdx
	mov     rsi, [rsp+8*561]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*562],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*564],rbx
	mov qword [rsp+8*563],rdx
	mov     rsi, [rsp+8*564]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*565],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*567],rbx
	mov qword [rsp+8*566],rdx
	mov     rsi, [rsp+8*567]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*568],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*570],rbx
	mov qword [rsp+8*569],rdx
	mov     rsi, [rsp+8*570]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*571],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*573],rbx
	mov qword [rsp+8*572],rdx
	mov     rsi, [rsp+8*573]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,19
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*574],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*576],rbx
	mov qword [rsp+8*575],rdx
	mov     rsi, [rsp+8*576]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*577],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*579],rbx
	mov qword [rsp+8*578],rdx
	mov     rsi, [rsp+8*579]
	mov     rdi, [rsp+8*534]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*534], rax
	mov rbx,  [rsp+8*534]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*580],rdx
	mov rdi,[rsp+8*580] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*581],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*582],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*583],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*586],rbx
	mov qword [rsp+8*584],rdx
	mov qword [rsp+8*585],rax
	mov     rsi, [rsp+8*586]
	mov     rdi, [rsp+8*583]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*588],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*590],rbx
	mov qword [rsp+8*589],rdx
	mov     rsi, [rsp+8*590]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*591],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*593],rbx
	mov qword [rsp+8*592],rdx
	mov     rsi, [rsp+8*593]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*594],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*596],rbx
	mov qword [rsp+8*595],rdx
	mov     rsi, [rsp+8*596]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*597],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*599],rbx
	mov qword [rsp+8*598],rdx
	mov     rsi, [rsp+8*599]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,20
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*600],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*602],rbx
	mov qword [rsp+8*601],rdx
	mov     rsi, [rsp+8*602]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*603],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*605],rbx
	mov qword [rsp+8*604],rdx
	mov     rsi, [rsp+8*605]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*606],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*608],rbx
	mov qword [rsp+8*607],rdx
	mov     rsi, [rsp+8*608]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*609],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*611],rbx
	mov qword [rsp+8*610],rdx
	mov     rsi, [rsp+8*611]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*612],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*614],rbx
	mov qword [rsp+8*613],rdx
	mov     rsi, [rsp+8*614]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*615],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*617],rbx
	mov qword [rsp+8*616],rdx
	mov     rsi, [rsp+8*617]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*618],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*620],rbx
	mov qword [rsp+8*619],rdx
	mov     rsi, [rsp+8*620]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*621],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*623],rbx
	mov qword [rsp+8*622],rdx
	mov     rsi, [rsp+8*623]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*624],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*626],rbx
	mov qword [rsp+8*625],rdx
	mov     rsi, [rsp+8*626]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,20
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*627],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*629],rbx
	mov qword [rsp+8*628],rdx
	mov     rsi, [rsp+8*629]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*630],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*632],rbx
	mov qword [rsp+8*631],rdx
	mov     rsi, [rsp+8*632]
	mov     rdi, [rsp+8*587]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*587], rax
	mov rbx,  [rsp+8*587]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*633],rdx
	mov rdi,[rsp+8*633] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*634],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*635],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*636],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*639],rbx
	mov qword [rsp+8*637],rdx
	mov qword [rsp+8*638],rax
	mov     rsi, [rsp+8*639]
	mov     rdi, [rsp+8*636]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*641],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*643],rbx
	mov qword [rsp+8*642],rdx
	mov     rsi, [rsp+8*643]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*644],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*646],rbx
	mov qword [rsp+8*645],rdx
	mov     rsi, [rsp+8*646]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*647],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*649],rbx
	mov qword [rsp+8*648],rdx
	mov     rsi, [rsp+8*649]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*650],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*652],rbx
	mov qword [rsp+8*651],rdx
	mov     rsi, [rsp+8*652]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,21
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*653],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*655],rbx
	mov qword [rsp+8*654],rdx
	mov     rsi, [rsp+8*655]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*656],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*658],rbx
	mov qword [rsp+8*657],rdx
	mov     rsi, [rsp+8*658]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*659],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*661],rbx
	mov qword [rsp+8*660],rdx
	mov     rsi, [rsp+8*661]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*662],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*664],rbx
	mov qword [rsp+8*663],rdx
	mov     rsi, [rsp+8*664]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*665],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*667],rbx
	mov qword [rsp+8*666],rdx
	mov     rsi, [rsp+8*667]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*668],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*670],rbx
	mov qword [rsp+8*669],rdx
	mov     rsi, [rsp+8*670]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*671],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*673],rbx
	mov qword [rsp+8*672],rdx
	mov     rsi, [rsp+8*673]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*674],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*676],rbx
	mov qword [rsp+8*675],rdx
	mov     rsi, [rsp+8*676]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*677],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*679],rbx
	mov qword [rsp+8*678],rdx
	mov     rsi, [rsp+8*679]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,21
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*680],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*682],rbx
	mov qword [rsp+8*681],rdx
	mov     rsi, [rsp+8*682]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*683],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*685],rbx
	mov qword [rsp+8*684],rdx
	mov     rsi, [rsp+8*685]
	mov     rdi, [rsp+8*640]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*640], rax
	mov rbx,  [rsp+8*640]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*686],rdx
	mov rdi,[rsp+8*686] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*687],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*688],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*689],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*692],rbx
	mov qword [rsp+8*690],rdx
	mov qword [rsp+8*691],rax
	mov     rsi, [rsp+8*692]
	mov     rdi, [rsp+8*689]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*694],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*696],rbx
	mov qword [rsp+8*695],rdx
	mov     rsi, [rsp+8*696]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*697],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*699],rbx
	mov qword [rsp+8*698],rdx
	mov     rsi, [rsp+8*699]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*700],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*702],rbx
	mov qword [rsp+8*701],rdx
	mov     rsi, [rsp+8*702]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*703],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*705],rbx
	mov qword [rsp+8*704],rdx
	mov     rsi, [rsp+8*705]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,22
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*706],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*708],rbx
	mov qword [rsp+8*707],rdx
	mov     rsi, [rsp+8*708]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*709],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*711],rbx
	mov qword [rsp+8*710],rdx
	mov     rsi, [rsp+8*711]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*712],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*714],rbx
	mov qword [rsp+8*713],rdx
	mov     rsi, [rsp+8*714]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*715],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*717],rbx
	mov qword [rsp+8*716],rdx
	mov     rsi, [rsp+8*717]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*718],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*720],rbx
	mov qword [rsp+8*719],rdx
	mov     rsi, [rsp+8*720]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*721],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*723],rbx
	mov qword [rsp+8*722],rdx
	mov     rsi, [rsp+8*723]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*724],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*726],rbx
	mov qword [rsp+8*725],rdx
	mov     rsi, [rsp+8*726]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*727],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*729],rbx
	mov qword [rsp+8*728],rdx
	mov     rsi, [rsp+8*729]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*730],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*732],rbx
	mov qword [rsp+8*731],rdx
	mov     rsi, [rsp+8*732]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,22
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*733],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*735],rbx
	mov qword [rsp+8*734],rdx
	mov     rsi, [rsp+8*735]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*736],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*738],rbx
	mov qword [rsp+8*737],rdx
	mov     rsi, [rsp+8*738]
	mov     rdi, [rsp+8*693]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*693], rax
	mov rbx,  [rsp+8*693]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*739],rdx
	mov rdi,[rsp+8*739] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*740],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*741],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*742],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*745],rbx
	mov qword [rsp+8*743],rdx
	mov qword [rsp+8*744],rax
	mov     rsi, [rsp+8*745]
	mov     rdi, [rsp+8*742]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*747],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*749],rbx
	mov qword [rsp+8*748],rdx
	mov     rsi, [rsp+8*749]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*750],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*752],rbx
	mov qword [rsp+8*751],rdx
	mov     rsi, [rsp+8*752]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*753],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*755],rbx
	mov qword [rsp+8*754],rdx
	mov     rsi, [rsp+8*755]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*756],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*758],rbx
	mov qword [rsp+8*757],rdx
	mov     rsi, [rsp+8*758]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,23
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*759],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*761],rbx
	mov qword [rsp+8*760],rdx
	mov     rsi, [rsp+8*761]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*762],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*764],rbx
	mov qword [rsp+8*763],rdx
	mov     rsi, [rsp+8*764]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*765],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*767],rbx
	mov qword [rsp+8*766],rdx
	mov     rsi, [rsp+8*767]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*768],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*770],rbx
	mov qword [rsp+8*769],rdx
	mov     rsi, [rsp+8*770]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*771],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*773],rbx
	mov qword [rsp+8*772],rdx
	mov     rsi, [rsp+8*773]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*774],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*776],rbx
	mov qword [rsp+8*775],rdx
	mov     rsi, [rsp+8*776]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*777],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*779],rbx
	mov qword [rsp+8*778],rdx
	mov     rsi, [rsp+8*779]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*780],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*782],rbx
	mov qword [rsp+8*781],rdx
	mov     rsi, [rsp+8*782]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*783],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*785],rbx
	mov qword [rsp+8*784],rdx
	mov     rsi, [rsp+8*785]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,23
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*786],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*788],rbx
	mov qword [rsp+8*787],rdx
	mov     rsi, [rsp+8*788]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*789],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*791],rbx
	mov qword [rsp+8*790],rdx
	mov     rsi, [rsp+8*791]
	mov     rdi, [rsp+8*746]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*746], rax
	mov rbx,  [rsp+8*746]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*792],rdx
	mov rdi,[rsp+8*792] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*793],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*794],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*795],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*798],rbx
	mov qword [rsp+8*796],rdx
	mov qword [rsp+8*797],rax
	mov     rsi, [rsp+8*798]
	mov     rdi, [rsp+8*795]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*800],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*802],rbx
	mov qword [rsp+8*801],rdx
	mov     rsi, [rsp+8*802]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*803],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*805],rbx
	mov qword [rsp+8*804],rdx
	mov     rsi, [rsp+8*805]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*806],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*808],rbx
	mov qword [rsp+8*807],rdx
	mov     rsi, [rsp+8*808]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*809],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*811],rbx
	mov qword [rsp+8*810],rdx
	mov     rsi, [rsp+8*811]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,24
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*812],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*814],rbx
	mov qword [rsp+8*813],rdx
	mov     rsi, [rsp+8*814]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*815],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*817],rbx
	mov qword [rsp+8*816],rdx
	mov     rsi, [rsp+8*817]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*818],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*820],rbx
	mov qword [rsp+8*819],rdx
	mov     rsi, [rsp+8*820]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*821],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*823],rbx
	mov qword [rsp+8*822],rdx
	mov     rsi, [rsp+8*823]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*824],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*826],rbx
	mov qword [rsp+8*825],rdx
	mov     rsi, [rsp+8*826]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*827],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*829],rbx
	mov qword [rsp+8*828],rdx
	mov     rsi, [rsp+8*829]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*830],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*832],rbx
	mov qword [rsp+8*831],rdx
	mov     rsi, [rsp+8*832]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*833],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*835],rbx
	mov qword [rsp+8*834],rdx
	mov     rsi, [rsp+8*835]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*836],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*838],rbx
	mov qword [rsp+8*837],rdx
	mov     rsi, [rsp+8*838]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,24
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*839],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*841],rbx
	mov qword [rsp+8*840],rdx
	mov     rsi, [rsp+8*841]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*842],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*844],rbx
	mov qword [rsp+8*843],rdx
	mov     rsi, [rsp+8*844]
	mov     rdi, [rsp+8*799]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*799], rax
	mov rbx,  [rsp+8*799]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*845],rdx
	mov rdi,[rsp+8*845] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,91
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*846],rbx
	mov rbx, [rdx]
	mov rdi,rbx
	mov qword [rsp+8*848],rbx
	mov rbx,rdi
	mov qword [rsp+8*849],rbx
	mov qword [rsp+8*847],rdx
	mov rdi,[rsp+8*849] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*850],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*851],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*852],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*855],rbx
	mov qword [rsp+8*853],rdx
	mov qword [rsp+8*854],rax
	mov     rsi, [rsp+8*855]
	mov     rdi, [rsp+8*852]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*857],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*859],rbx
	mov qword [rsp+8*858],rdx
	mov     rsi, [rsp+8*859]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*860],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*862],rbx
	mov qword [rsp+8*861],rdx
	mov     rsi, [rsp+8*862]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*863],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*865],rbx
	mov qword [rsp+8*864],rdx
	mov     rsi, [rsp+8*865]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*866],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*868],rbx
	mov qword [rsp+8*867],rdx
	mov     rsi, [rsp+8*868]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*869],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*871],rbx
	mov qword [rsp+8*870],rdx
	mov     rsi, [rsp+8*871]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*872],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*874],rbx
	mov qword [rsp+8*873],rdx
	mov     rsi, [rsp+8*874]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*875],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*877],rbx
	mov qword [rsp+8*876],rdx
	mov     rsi, [rsp+8*877]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*878],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*880],rbx
	mov qword [rsp+8*879],rdx
	mov     rsi, [rsp+8*880]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*881],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*883],rbx
	mov qword [rsp+8*882],rdx
	mov     rsi, [rsp+8*883]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*884],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*886],rbx
	mov qword [rsp+8*885],rdx
	mov     rsi, [rsp+8*886]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*887],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*889],rbx
	mov qword [rsp+8*888],rdx
	mov     rsi, [rsp+8*889]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,85
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*890],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*892],rbx
	mov qword [rsp+8*891],rdx
	mov     rsi, [rsp+8*892]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*893],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*895],rbx
	mov qword [rsp+8*894],rdx
	mov     rsi, [rsp+8*895]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*896],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*898],rbx
	mov qword [rsp+8*897],rdx
	mov     rsi, [rsp+8*898]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*899],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*901],rbx
	mov qword [rsp+8*900],rdx
	mov     rsi, [rsp+8*901]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*902],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*904],rbx
	mov qword [rsp+8*903],rdx
	mov     rsi, [rsp+8*904]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*905],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*907],rbx
	mov qword [rsp+8*906],rdx
	mov     rsi, [rsp+8*907]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*908],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*910],rbx
	mov qword [rsp+8*909],rdx
	mov     rsi, [rsp+8*910]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*911],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*913],rbx
	mov qword [rsp+8*912],rdx
	mov     rsi, [rsp+8*913]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*914],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*916],rbx
	mov qword [rsp+8*915],rdx
	mov     rsi, [rsp+8*916]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*917],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*919],rbx
	mov qword [rsp+8*918],rdx
	mov     rsi, [rsp+8*919]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,20
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*920],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*922],rbx
	mov qword [rsp+8*921],rdx
	mov     rsi, [rsp+8*922]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,21
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*923],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*925],rbx
	mov qword [rsp+8*924],rdx
	mov     rsi, [rsp+8*925]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*926],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*928],rbx
	mov qword [rsp+8*927],rdx
	mov     rsi, [rsp+8*928]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*929],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*931],rbx
	mov qword [rsp+8*930],rdx
	mov     rsi, [rsp+8*931]
	mov     rdi, [rsp+8*856]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*856], rax
	mov rbx,  [rsp+8*856]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*932],rdx
	mov rdi,[rsp+8*932] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*933],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*934],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*935],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*938],rbx
	mov qword [rsp+8*936],rdx
	mov qword [rsp+8*937],rax
	mov     rsi, [rsp+8*938]
	mov     rdi, [rsp+8*935]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*940],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*942],rbx
	mov qword [rsp+8*941],rdx
	mov     rsi, [rsp+8*942]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*943],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*945],rbx
	mov qword [rsp+8*944],rdx
	mov     rsi, [rsp+8*945]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*946],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*948],rbx
	mov qword [rsp+8*947],rdx
	mov     rsi, [rsp+8*948]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*949],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*951],rbx
	mov qword [rsp+8*950],rdx
	mov     rsi, [rsp+8*951]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*952],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*954],rbx
	mov qword [rsp+8*953],rdx
	mov     rsi, [rsp+8*954]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*955],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*957],rbx
	mov qword [rsp+8*956],rdx
	mov     rsi, [rsp+8*957]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*958],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*960],rbx
	mov qword [rsp+8*959],rdx
	mov     rsi, [rsp+8*960]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*961],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*963],rbx
	mov qword [rsp+8*962],rdx
	mov     rsi, [rsp+8*963]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*964],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*966],rbx
	mov qword [rsp+8*965],rdx
	mov     rsi, [rsp+8*966]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*967],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*969],rbx
	mov qword [rsp+8*968],rdx
	mov     rsi, [rsp+8*969]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*970],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*972],rbx
	mov qword [rsp+8*971],rdx
	mov     rsi, [rsp+8*972]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,85
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*973],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*975],rbx
	mov qword [rsp+8*974],rdx
	mov     rsi, [rsp+8*975]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*976],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*978],rbx
	mov qword [rsp+8*977],rdx
	mov     rsi, [rsp+8*978]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*979],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*981],rbx
	mov qword [rsp+8*980],rdx
	mov     rsi, [rsp+8*981]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*982],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*984],rbx
	mov qword [rsp+8*983],rdx
	mov     rsi, [rsp+8*984]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*985],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*987],rbx
	mov qword [rsp+8*986],rdx
	mov     rsi, [rsp+8*987]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*988],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*990],rbx
	mov qword [rsp+8*989],rdx
	mov     rsi, [rsp+8*990]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*991],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*993],rbx
	mov qword [rsp+8*992],rdx
	mov     rsi, [rsp+8*993]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*994],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*996],rbx
	mov qword [rsp+8*995],rdx
	mov     rsi, [rsp+8*996]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*997],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*999],rbx
	mov qword [rsp+8*998],rdx
	mov     rsi, [rsp+8*999]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1000],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1002],rbx
	mov qword [rsp+8*1001],rdx
	mov     rsi, [rsp+8*1002]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,20
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1003],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1005],rbx
	mov qword [rsp+8*1004],rdx
	mov     rsi, [rsp+8*1005]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,21
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1006],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1008],rbx
	mov qword [rsp+8*1007],rdx
	mov     rsi, [rsp+8*1008]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1009],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1011],rbx
	mov qword [rsp+8*1010],rdx
	mov     rsi, [rsp+8*1011]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1012],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1014],rbx
	mov qword [rsp+8*1013],rdx
	mov     rsi, [rsp+8*1014]
	mov     rdi, [rsp+8*939]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*939], rax
	mov rbx,  [rsp+8*939]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1015],rdx
	mov rdi,[rsp+8*1015] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1016],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1017],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1018],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1021],rbx
	mov qword [rsp+8*1019],rdx
	mov qword [rsp+8*1020],rax
	mov     rsi, [rsp+8*1021]
	mov     rdi, [rsp+8*1018]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1023],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1025],rbx
	mov qword [rsp+8*1024],rdx
	mov     rsi, [rsp+8*1025]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1026],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1028],rbx
	mov qword [rsp+8*1027],rdx
	mov     rsi, [rsp+8*1028]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1029],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1031],rbx
	mov qword [rsp+8*1030],rdx
	mov     rsi, [rsp+8*1031]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1032],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1034],rbx
	mov qword [rsp+8*1033],rdx
	mov     rsi, [rsp+8*1034]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1035],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1037],rbx
	mov qword [rsp+8*1036],rdx
	mov     rsi, [rsp+8*1037]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1038],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1040],rbx
	mov qword [rsp+8*1039],rdx
	mov     rsi, [rsp+8*1040]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1041],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1043],rbx
	mov qword [rsp+8*1042],rdx
	mov     rsi, [rsp+8*1043]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1044],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1046],rbx
	mov qword [rsp+8*1045],rdx
	mov     rsi, [rsp+8*1046]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1047],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1049],rbx
	mov qword [rsp+8*1048],rdx
	mov     rsi, [rsp+8*1049]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1050],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1052],rbx
	mov qword [rsp+8*1051],rdx
	mov     rsi, [rsp+8*1052]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1053],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1055],rbx
	mov qword [rsp+8*1054],rdx
	mov     rsi, [rsp+8*1055]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1056],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1058],rbx
	mov qword [rsp+8*1057],rdx
	mov     rsi, [rsp+8*1058]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1059],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1061],rbx
	mov qword [rsp+8*1060],rdx
	mov     rsi, [rsp+8*1061]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1062],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1064],rbx
	mov qword [rsp+8*1063],rdx
	mov     rsi, [rsp+8*1064]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1065],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1067],rbx
	mov qword [rsp+8*1066],rdx
	mov     rsi, [rsp+8*1067]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,89
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1068],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1070],rbx
	mov qword [rsp+8*1069],rdx
	mov     rsi, [rsp+8*1070]
	mov     rdi, [rsp+8*1022]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1022], rax
	mov rbx,  [rsp+8*1022]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1071],rdx
	mov rdi,[rsp+8*1071] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1072],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1073],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1074],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1077],rbx
	mov qword [rsp+8*1075],rdx
	mov qword [rsp+8*1076],rax
	mov     rsi, [rsp+8*1077]
	mov     rdi, [rsp+8*1074]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1079],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1081],rbx
	mov qword [rsp+8*1080],rdx
	mov     rsi, [rsp+8*1081]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1082],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1084],rbx
	mov qword [rsp+8*1083],rdx
	mov     rsi, [rsp+8*1084]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1085],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1087],rbx
	mov qword [rsp+8*1086],rdx
	mov     rsi, [rsp+8*1087]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,27
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1088],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1090],rbx
	mov qword [rsp+8*1089],rdx
	mov     rsi, [rsp+8*1090]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1091],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1093],rbx
	mov qword [rsp+8*1092],rdx
	mov     rsi, [rsp+8*1093]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,24
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1094],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1096],rbx
	mov qword [rsp+8*1095],rdx
	mov     rsi, [rsp+8*1096]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1097],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1099],rbx
	mov qword [rsp+8*1098],rdx
	mov     rsi, [rsp+8*1099]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1100],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1102],rbx
	mov qword [rsp+8*1101],rdx
	mov     rsi, [rsp+8*1102]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1103],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1105],rbx
	mov qword [rsp+8*1104],rdx
	mov     rsi, [rsp+8*1105]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1106],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1108],rbx
	mov qword [rsp+8*1107],rdx
	mov     rsi, [rsp+8*1108]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1109],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1111],rbx
	mov qword [rsp+8*1110],rdx
	mov     rsi, [rsp+8*1111]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1112],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1114],rbx
	mov qword [rsp+8*1113],rdx
	mov     rsi, [rsp+8*1114]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1115],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1117],rbx
	mov qword [rsp+8*1116],rdx
	mov     rsi, [rsp+8*1117]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1118],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1120],rbx
	mov qword [rsp+8*1119],rdx
	mov     rsi, [rsp+8*1120]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1121],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1123],rbx
	mov qword [rsp+8*1122],rdx
	mov     rsi, [rsp+8*1123]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1124],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1126],rbx
	mov qword [rsp+8*1125],rdx
	mov     rsi, [rsp+8*1126]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1127],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1129],rbx
	mov qword [rsp+8*1128],rdx
	mov     rsi, [rsp+8*1129]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1130],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1132],rbx
	mov qword [rsp+8*1131],rdx
	mov     rsi, [rsp+8*1132]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1133],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1135],rbx
	mov qword [rsp+8*1134],rdx
	mov     rsi, [rsp+8*1135]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1136],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1138],rbx
	mov qword [rsp+8*1137],rdx
	mov     rsi, [rsp+8*1138]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1139],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1141],rbx
	mov qword [rsp+8*1140],rdx
	mov     rsi, [rsp+8*1141]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1142],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1144],rbx
	mov qword [rsp+8*1143],rdx
	mov     rsi, [rsp+8*1144]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1145],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1147],rbx
	mov qword [rsp+8*1146],rdx
	mov     rsi, [rsp+8*1147]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1148],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1150],rbx
	mov qword [rsp+8*1149],rdx
	mov     rsi, [rsp+8*1150]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1151],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1153],rbx
	mov qword [rsp+8*1152],rdx
	mov     rsi, [rsp+8*1153]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1154],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1156],rbx
	mov qword [rsp+8*1155],rdx
	mov     rsi, [rsp+8*1156]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1157],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1159],rbx
	mov qword [rsp+8*1158],rdx
	mov     rsi, [rsp+8*1159]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1160],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1162],rbx
	mov qword [rsp+8*1161],rdx
	mov     rsi, [rsp+8*1162]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1163],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1165],rbx
	mov qword [rsp+8*1164],rdx
	mov     rsi, [rsp+8*1165]
	mov     rdi, [rsp+8*1078]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1078], rax
	mov rbx,  [rsp+8*1078]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1166],rdx
	mov rdi,[rsp+8*1166] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1167],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1168],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1169],rbx
	mov rbx,67
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1172],rbx
	mov qword [rsp+8*1170],rdx
	mov qword [rsp+8*1171],rax
	mov     rsi, [rsp+8*1172]
	mov     rdi, [rsp+8*1169]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1174],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1176],rbx
	mov qword [rsp+8*1175],rdx
	mov     rsi, [rsp+8*1176]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1177],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1179],rbx
	mov qword [rsp+8*1178],rdx
	mov     rsi, [rsp+8*1179]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1180],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1182],rbx
	mov qword [rsp+8*1181],rdx
	mov     rsi, [rsp+8*1182]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1183],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1185],rbx
	mov qword [rsp+8*1184],rdx
	mov     rsi, [rsp+8*1185]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1186],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1188],rbx
	mov qword [rsp+8*1187],rdx
	mov     rsi, [rsp+8*1188]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1189],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1191],rbx
	mov qword [rsp+8*1190],rdx
	mov     rsi, [rsp+8*1191]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1192],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1194],rbx
	mov qword [rsp+8*1193],rdx
	mov     rsi, [rsp+8*1194]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1195],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1197],rbx
	mov qword [rsp+8*1196],rdx
	mov     rsi, [rsp+8*1197]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1198],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1200],rbx
	mov qword [rsp+8*1199],rdx
	mov     rsi, [rsp+8*1200]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1201],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1203],rbx
	mov qword [rsp+8*1202],rdx
	mov     rsi, [rsp+8*1203]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1204],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1206],rbx
	mov qword [rsp+8*1205],rdx
	mov     rsi, [rsp+8*1206]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1207],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1209],rbx
	mov qword [rsp+8*1208],rdx
	mov     rsi, [rsp+8*1209]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1210],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1212],rbx
	mov qword [rsp+8*1211],rdx
	mov     rsi, [rsp+8*1212]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1213],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1215],rbx
	mov qword [rsp+8*1214],rdx
	mov     rsi, [rsp+8*1215]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1216],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1218],rbx
	mov qword [rsp+8*1217],rdx
	mov     rsi, [rsp+8*1218]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,14
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1219],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1221],rbx
	mov qword [rsp+8*1220],rdx
	mov     rsi, [rsp+8*1221]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1222],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1224],rbx
	mov qword [rsp+8*1223],rdx
	mov     rsi, [rsp+8*1224]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1225],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1227],rbx
	mov qword [rsp+8*1226],rdx
	mov     rsi, [rsp+8*1227]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1228],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1230],rbx
	mov qword [rsp+8*1229],rdx
	mov     rsi, [rsp+8*1230]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1231],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1233],rbx
	mov qword [rsp+8*1232],rdx
	mov     rsi, [rsp+8*1233]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1234],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1236],rbx
	mov qword [rsp+8*1235],rdx
	mov     rsi, [rsp+8*1236]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1237],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1239],rbx
	mov qword [rsp+8*1238],rdx
	mov     rsi, [rsp+8*1239]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1240],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1242],rbx
	mov qword [rsp+8*1241],rdx
	mov     rsi, [rsp+8*1242]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1243],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1245],rbx
	mov qword [rsp+8*1244],rdx
	mov     rsi, [rsp+8*1245]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1246],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1248],rbx
	mov qword [rsp+8*1247],rdx
	mov     rsi, [rsp+8*1248]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1249],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1251],rbx
	mov qword [rsp+8*1250],rdx
	mov     rsi, [rsp+8*1251]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1252],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1254],rbx
	mov qword [rsp+8*1253],rdx
	mov     rsi, [rsp+8*1254]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,4
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1255],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1257],rbx
	mov qword [rsp+8*1256],rdx
	mov     rsi, [rsp+8*1257]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1258],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1260],rbx
	mov qword [rsp+8*1259],rdx
	mov     rsi, [rsp+8*1260]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1261],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1263],rbx
	mov qword [rsp+8*1262],rdx
	mov     rsi, [rsp+8*1263]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1264],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1266],rbx
	mov qword [rsp+8*1265],rdx
	mov     rsi, [rsp+8*1266]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1267],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1269],rbx
	mov qword [rsp+8*1268],rdx
	mov     rsi, [rsp+8*1269]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1270],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1272],rbx
	mov qword [rsp+8*1271],rdx
	mov     rsi, [rsp+8*1272]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1273],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1275],rbx
	mov qword [rsp+8*1274],rdx
	mov     rsi, [rsp+8*1275]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1276],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1278],rbx
	mov qword [rsp+8*1277],rdx
	mov     rsi, [rsp+8*1278]
	mov     rdi, [rsp+8*1173]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1173], rax
	mov rbx,  [rsp+8*1173]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1279],rdx
	mov rdi,[rsp+8*1279] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,91
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1280],rbx
	mov rbx, [rdx]
	mov rdi,rbx
	mov qword [rsp+8*1282],rbx
	mov rbx,rdi
	mov qword [rsp+8*1283],rbx
	mov qword [rsp+8*1281],rdx
	mov rdi,[rsp+8*1283] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1284],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1285],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1286],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1289],rbx
	mov qword [rsp+8*1287],rdx
	mov qword [rsp+8*1288],rax
	mov     rsi, [rsp+8*1289]
	mov     rdi, [rsp+8*1286]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1291],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1293],rbx
	mov qword [rsp+8*1292],rdx
	mov     rsi, [rsp+8*1293]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1294],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1296],rbx
	mov qword [rsp+8*1295],rdx
	mov     rsi, [rsp+8*1296]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1297],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1299],rbx
	mov qword [rsp+8*1298],rdx
	mov     rsi, [rsp+8*1299]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1300],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1302],rbx
	mov qword [rsp+8*1301],rdx
	mov     rsi, [rsp+8*1302]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1303],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1305],rbx
	mov qword [rsp+8*1304],rdx
	mov     rsi, [rsp+8*1305]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1306],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1308],rbx
	mov qword [rsp+8*1307],rdx
	mov     rsi, [rsp+8*1308]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1309],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1311],rbx
	mov qword [rsp+8*1310],rdx
	mov     rsi, [rsp+8*1311]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1312],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1314],rbx
	mov qword [rsp+8*1313],rdx
	mov     rsi, [rsp+8*1314]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1315],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1317],rbx
	mov qword [rsp+8*1316],rdx
	mov     rsi, [rsp+8*1317]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1318],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1320],rbx
	mov qword [rsp+8*1319],rdx
	mov     rsi, [rsp+8*1320]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1321],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1323],rbx
	mov qword [rsp+8*1322],rdx
	mov     rsi, [rsp+8*1323]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1324],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1326],rbx
	mov qword [rsp+8*1325],rdx
	mov     rsi, [rsp+8*1326]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1327],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1329],rbx
	mov qword [rsp+8*1328],rdx
	mov     rsi, [rsp+8*1329]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1330],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1332],rbx
	mov qword [rsp+8*1331],rdx
	mov     rsi, [rsp+8*1332]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1333],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1335],rbx
	mov qword [rsp+8*1334],rdx
	mov     rsi, [rsp+8*1335]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,89
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1336],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1338],rbx
	mov qword [rsp+8*1337],rdx
	mov     rsi, [rsp+8*1338]
	mov     rdi, [rsp+8*1290]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1290], rax
	mov rbx,  [rsp+8*1290]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1339],rdx
	mov rdi,[rsp+8*1339] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1340],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1341],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1342],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1345],rbx
	mov qword [rsp+8*1343],rdx
	mov qword [rsp+8*1344],rax
	mov     rsi, [rsp+8*1345]
	mov     rdi, [rsp+8*1342]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1347],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1349],rbx
	mov qword [rsp+8*1348],rdx
	mov     rsi, [rsp+8*1349]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1350],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1352],rbx
	mov qword [rsp+8*1351],rdx
	mov     rsi, [rsp+8*1352]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1353],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1355],rbx
	mov qword [rsp+8*1354],rdx
	mov     rsi, [rsp+8*1355]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,27
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1356],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1358],rbx
	mov qword [rsp+8*1357],rdx
	mov     rsi, [rsp+8*1358]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1359],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1361],rbx
	mov qword [rsp+8*1360],rdx
	mov     rsi, [rsp+8*1361]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,24
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1362],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1364],rbx
	mov qword [rsp+8*1363],rdx
	mov     rsi, [rsp+8*1364]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1365],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1367],rbx
	mov qword [rsp+8*1366],rdx
	mov     rsi, [rsp+8*1367]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1368],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1370],rbx
	mov qword [rsp+8*1369],rdx
	mov     rsi, [rsp+8*1370]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1371],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1373],rbx
	mov qword [rsp+8*1372],rdx
	mov     rsi, [rsp+8*1373]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1374],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1376],rbx
	mov qword [rsp+8*1375],rdx
	mov     rsi, [rsp+8*1376]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1377],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1379],rbx
	mov qword [rsp+8*1378],rdx
	mov     rsi, [rsp+8*1379]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1380],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1382],rbx
	mov qword [rsp+8*1381],rdx
	mov     rsi, [rsp+8*1382]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1383],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1385],rbx
	mov qword [rsp+8*1384],rdx
	mov     rsi, [rsp+8*1385]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1386],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1388],rbx
	mov qword [rsp+8*1387],rdx
	mov     rsi, [rsp+8*1388]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1389],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1391],rbx
	mov qword [rsp+8*1390],rdx
	mov     rsi, [rsp+8*1391]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1392],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1394],rbx
	mov qword [rsp+8*1393],rdx
	mov     rsi, [rsp+8*1394]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1395],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1397],rbx
	mov qword [rsp+8*1396],rdx
	mov     rsi, [rsp+8*1397]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1398],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1400],rbx
	mov qword [rsp+8*1399],rdx
	mov     rsi, [rsp+8*1400]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1401],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1403],rbx
	mov qword [rsp+8*1402],rdx
	mov     rsi, [rsp+8*1403]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1404],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1406],rbx
	mov qword [rsp+8*1405],rdx
	mov     rsi, [rsp+8*1406]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1407],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1409],rbx
	mov qword [rsp+8*1408],rdx
	mov     rsi, [rsp+8*1409]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1410],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1412],rbx
	mov qword [rsp+8*1411],rdx
	mov     rsi, [rsp+8*1412]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1413],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1415],rbx
	mov qword [rsp+8*1414],rdx
	mov     rsi, [rsp+8*1415]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1416],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1418],rbx
	mov qword [rsp+8*1417],rdx
	mov     rsi, [rsp+8*1418]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1419],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1421],rbx
	mov qword [rsp+8*1420],rdx
	mov     rsi, [rsp+8*1421]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1422],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1424],rbx
	mov qword [rsp+8*1423],rdx
	mov     rsi, [rsp+8*1424]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1425],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1427],rbx
	mov qword [rsp+8*1426],rdx
	mov     rsi, [rsp+8*1427]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1428],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1430],rbx
	mov qword [rsp+8*1429],rdx
	mov     rsi, [rsp+8*1430]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1431],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1433],rbx
	mov qword [rsp+8*1432],rdx
	mov     rsi, [rsp+8*1433]
	mov     rdi, [rsp+8*1346]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1346], rax
	mov rbx,  [rsp+8*1346]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1434],rdx
	mov rdi,[rsp+8*1434] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1435],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1436],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1437],rbx
	mov rbx,67
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1440],rbx
	mov qword [rsp+8*1438],rdx
	mov qword [rsp+8*1439],rax
	mov     rsi, [rsp+8*1440]
	mov     rdi, [rsp+8*1437]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1442],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1444],rbx
	mov qword [rsp+8*1443],rdx
	mov     rsi, [rsp+8*1444]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1445],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1447],rbx
	mov qword [rsp+8*1446],rdx
	mov     rsi, [rsp+8*1447]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1448],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1450],rbx
	mov qword [rsp+8*1449],rdx
	mov     rsi, [rsp+8*1450]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1451],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1453],rbx
	mov qword [rsp+8*1452],rdx
	mov     rsi, [rsp+8*1453]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1454],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1456],rbx
	mov qword [rsp+8*1455],rdx
	mov     rsi, [rsp+8*1456]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1457],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1459],rbx
	mov qword [rsp+8*1458],rdx
	mov     rsi, [rsp+8*1459]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1460],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1462],rbx
	mov qword [rsp+8*1461],rdx
	mov     rsi, [rsp+8*1462]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1463],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1465],rbx
	mov qword [rsp+8*1464],rdx
	mov     rsi, [rsp+8*1465]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1466],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1468],rbx
	mov qword [rsp+8*1467],rdx
	mov     rsi, [rsp+8*1468]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1469],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1471],rbx
	mov qword [rsp+8*1470],rdx
	mov     rsi, [rsp+8*1471]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1472],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1474],rbx
	mov qword [rsp+8*1473],rdx
	mov     rsi, [rsp+8*1474]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1475],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1477],rbx
	mov qword [rsp+8*1476],rdx
	mov     rsi, [rsp+8*1477]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1478],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1480],rbx
	mov qword [rsp+8*1479],rdx
	mov     rsi, [rsp+8*1480]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1481],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1483],rbx
	mov qword [rsp+8*1482],rdx
	mov     rsi, [rsp+8*1483]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1484],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1486],rbx
	mov qword [rsp+8*1485],rdx
	mov     rsi, [rsp+8*1486]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,14
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1487],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1489],rbx
	mov qword [rsp+8*1488],rdx
	mov     rsi, [rsp+8*1489]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1490],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1492],rbx
	mov qword [rsp+8*1491],rdx
	mov     rsi, [rsp+8*1492]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1493],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1495],rbx
	mov qword [rsp+8*1494],rdx
	mov     rsi, [rsp+8*1495]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1496],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1498],rbx
	mov qword [rsp+8*1497],rdx
	mov     rsi, [rsp+8*1498]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1499],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1501],rbx
	mov qword [rsp+8*1500],rdx
	mov     rsi, [rsp+8*1501]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1502],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1504],rbx
	mov qword [rsp+8*1503],rdx
	mov     rsi, [rsp+8*1504]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1505],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1507],rbx
	mov qword [rsp+8*1506],rdx
	mov     rsi, [rsp+8*1507]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1508],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1510],rbx
	mov qword [rsp+8*1509],rdx
	mov     rsi, [rsp+8*1510]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1511],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1513],rbx
	mov qword [rsp+8*1512],rdx
	mov     rsi, [rsp+8*1513]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1514],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1516],rbx
	mov qword [rsp+8*1515],rdx
	mov     rsi, [rsp+8*1516]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1517],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1519],rbx
	mov qword [rsp+8*1518],rdx
	mov     rsi, [rsp+8*1519]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1520],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1522],rbx
	mov qword [rsp+8*1521],rdx
	mov     rsi, [rsp+8*1522]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,4
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1523],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1525],rbx
	mov qword [rsp+8*1524],rdx
	mov     rsi, [rsp+8*1525]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1526],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1528],rbx
	mov qword [rsp+8*1527],rdx
	mov     rsi, [rsp+8*1528]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1529],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1531],rbx
	mov qword [rsp+8*1530],rdx
	mov     rsi, [rsp+8*1531]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1532],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1534],rbx
	mov qword [rsp+8*1533],rdx
	mov     rsi, [rsp+8*1534]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1535],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1537],rbx
	mov qword [rsp+8*1536],rdx
	mov     rsi, [rsp+8*1537]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1538],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1540],rbx
	mov qword [rsp+8*1539],rdx
	mov     rsi, [rsp+8*1540]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1541],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1543],rbx
	mov qword [rsp+8*1542],rdx
	mov     rsi, [rsp+8*1543]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1544],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1546],rbx
	mov qword [rsp+8*1545],rdx
	mov     rsi, [rsp+8*1546]
	mov     rdi, [rsp+8*1441]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1441], rax
	mov rbx,  [rsp+8*1441]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1547],rdx
	mov rdi,[rsp+8*1547] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,91
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1548],rbx
	mov rbx, [rdx]
	mov rdi,rbx
	mov qword [rsp+8*1550],rbx
	mov rbx,rdi
	mov qword [rsp+8*1551],rbx
	mov qword [rsp+8*1549],rdx
	mov rdi,[rsp+8*1551] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1552],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1553],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1554],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1557],rbx
	mov qword [rsp+8*1555],rdx
	mov qword [rsp+8*1556],rax
	mov     rsi, [rsp+8*1557]
	mov     rdi, [rsp+8*1554]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1558], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1559],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1561],rbx
	mov qword [rsp+8*1560],rdx
	mov     rsi, [rsp+8*1561]
	mov     rdi, [rsp+8*1558]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1558], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1562],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1564],rbx
	mov qword [rsp+8*1563],rdx
	mov     rsi, [rsp+8*1564]
	mov     rdi, [rsp+8*1558]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1558], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1565],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1567],rbx
	mov qword [rsp+8*1566],rdx
	mov     rsi, [rsp+8*1567]
	mov     rdi, [rsp+8*1558]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1558], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1568],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1570],rbx
	mov qword [rsp+8*1569],rdx
	mov     rsi, [rsp+8*1570]
	mov     rdi, [rsp+8*1558]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1558], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1571],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1573],rbx
	mov qword [rsp+8*1572],rdx
	mov     rsi, [rsp+8*1573]
	mov     rdi, [rsp+8*1558]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1558], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1574],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1576],rbx
	mov qword [rsp+8*1575],rdx
	mov     rsi, [rsp+8*1576]
	mov     rdi, [rsp+8*1558]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1558], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,77
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1577],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1579],rbx
	mov qword [rsp+8*1578],rdx
	mov     rsi, [rsp+8*1579]
	mov     rdi, [rsp+8*1558]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1558], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1580],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1582],rbx
	mov qword [rsp+8*1581],rdx
	mov     rsi, [rsp+8*1582]
	mov     rdi, [rsp+8*1558]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1558], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1558]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1558], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1583],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1585],rbx
	mov qword [rsp+8*1584],rdx
	mov     rsi, [rsp+8*1585]
	mov     rdi, [rsp+8*1558]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1558], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1558]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1558], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1586],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1588],rbx
	mov qword [rsp+8*1587],rdx
	mov     rsi, [rsp+8*1588]
	mov     rdi, [rsp+8*1558]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1558], rax
	mov rbx,  [rsp+8*1558]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1589],rdx
	mov rdi,[rsp+8*1589] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1590],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1591],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1592],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1595],rbx
	mov qword [rsp+8*1593],rdx
	mov qword [rsp+8*1594],rax
	mov     rsi, [rsp+8*1595]
	mov     rdi, [rsp+8*1592]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1596], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1597],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1599],rbx
	mov qword [rsp+8*1598],rdx
	mov     rsi, [rsp+8*1599]
	mov     rdi, [rsp+8*1596]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1596], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1600],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1602],rbx
	mov qword [rsp+8*1601],rdx
	mov     rsi, [rsp+8*1602]
	mov     rdi, [rsp+8*1596]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1596], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1603],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1605],rbx
	mov qword [rsp+8*1604],rdx
	mov     rsi, [rsp+8*1605]
	mov     rdi, [rsp+8*1596]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1596], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1606],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1608],rbx
	mov qword [rsp+8*1607],rdx
	mov     rsi, [rsp+8*1608]
	mov     rdi, [rsp+8*1596]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1596], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1609],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1611],rbx
	mov qword [rsp+8*1610],rdx
	mov     rsi, [rsp+8*1611]
	mov     rdi, [rsp+8*1596]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1596], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,63
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1612],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1614],rbx
	mov qword [rsp+8*1613],rdx
	mov     rsi, [rsp+8*1614]
	mov     rdi, [rsp+8*1596]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1596], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1615],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1617],rbx
	mov qword [rsp+8*1616],rdx
	mov     rsi, [rsp+8*1617]
	mov     rdi, [rsp+8*1596]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1596], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,79
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1618],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1620],rbx
	mov qword [rsp+8*1619],rdx
	mov     rsi, [rsp+8*1620]
	mov     rdi, [rsp+8*1596]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1596], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1621],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1623],rbx
	mov qword [rsp+8*1622],rdx
	mov     rsi, [rsp+8*1623]
	mov     rdi, [rsp+8*1596]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1596], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1596]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1596], rax
	mov     rsi, [gbl+8*1624]
	mov     rdi, [rsp+8*1596]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1596], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1596]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1596], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1596]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1596], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1625],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1627],rbx
	mov qword [rsp+8*1626],rdx
	mov     rsi, [rsp+8*1627]
	mov     rdi, [rsp+8*1596]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1596], rax
	mov rbx,  [rsp+8*1596]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1628],rdx
	mov rdi,[rsp+8*1628] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1629],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1630],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1631],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1634],rbx
	mov qword [rsp+8*1632],rdx
	mov qword [rsp+8*1633],rax
	mov     rsi, [rsp+8*1634]
	mov     rdi, [rsp+8*1631]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1635], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1636],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1638],rbx
	mov qword [rsp+8*1637],rdx
	mov     rsi, [rsp+8*1638]
	mov     rdi, [rsp+8*1635]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1635], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1639],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1641],rbx
	mov qword [rsp+8*1640],rdx
	mov     rsi, [rsp+8*1641]
	mov     rdi, [rsp+8*1635]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1635], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1642],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1644],rbx
	mov qword [rsp+8*1643],rdx
	mov     rsi, [rsp+8*1644]
	mov     rdi, [rsp+8*1635]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1635], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1645],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1647],rbx
	mov qword [rsp+8*1646],rdx
	mov     rsi, [rsp+8*1647]
	mov     rdi, [rsp+8*1635]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1635], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1648],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1650],rbx
	mov qword [rsp+8*1649],rdx
	mov     rsi, [rsp+8*1650]
	mov     rdi, [rsp+8*1635]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1635], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,63
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1651],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1653],rbx
	mov qword [rsp+8*1652],rdx
	mov     rsi, [rsp+8*1653]
	mov     rdi, [rsp+8*1635]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1635], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1654],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1656],rbx
	mov qword [rsp+8*1655],rdx
	mov     rsi, [rsp+8*1656]
	mov     rdi, [rsp+8*1635]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1635], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,64
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1657],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1659],rbx
	mov qword [rsp+8*1658],rdx
	mov     rsi, [rsp+8*1659]
	mov     rdi, [rsp+8*1635]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1635], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1660],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1662],rbx
	mov qword [rsp+8*1661],rdx
	mov     rsi, [rsp+8*1662]
	mov     rdi, [rsp+8*1635]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1635], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1635]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1635], rax
	mov     rsi, [gbl+8*1624]
	mov     rdi, [rsp+8*1635]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1635], rax
	mov     rsi, [gbl+8*1624]
	mov     rdi, [rsp+8*1635]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1635], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1635]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1635], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1663],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1665],rbx
	mov qword [rsp+8*1664],rdx
	mov     rsi, [rsp+8*1665]
	mov     rdi, [rsp+8*1635]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1635], rax
	mov rbx,  [rsp+8*1635]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1666],rdx
	mov rdi,[rsp+8*1666] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1667],rbx
	mov rbx, [rdx]
	mov rdi,rbx
	mov qword [rsp+8*1669],rbx
	mov rbx,rdi
	mov qword [rsp+8*1670],rbx
	mov qword [rsp+8*1668],rdx
	mov rdi,[rsp+8*1670] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*2],rbx
	
L_24:
	mov rbx,  [rsp+8*2]
	mov rdx,93
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*1671],rax
	je L_25
	mov rbx,  [rsp+8*2]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,9
	cmp rdx,rax
	mov rbx, 0
	setle bl
	cmp rbx, 0
	mov qword [rsp+8*1673],rbx
	mov qword [rsp+8*1672],rdx
	je L_195
	mov rbx,  [rsp+8*1672]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,0
	cmp rdx,rax
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*1675],rbx
	mov qword [rsp+8*1674],rdx
	je L_196
	mov rdx,t66
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_198
	
L_196:
	mov rbx,  [rsp+8*1674]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1677],rax
	je L_199
	mov rdx,t69
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_198
	
L_199:
	mov rbx,  [rsp+8*1674]
	mov rdx,2
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1678],rax
	je L_200
	mov rdx,t72
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_198
	
L_200:
	mov rbx,  [rsp+8*1674]
	mov rdx,3
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1679],rax
	je L_201
	mov rdx,t75
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_198
	
L_201:
	mov rbx,  [rsp+8*1674]
	mov rdx,4
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1680],rax
	je L_202
	mov rdx,t78
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_198
	
L_202:
	mov rbx,  [rsp+8*1674]
	mov rdx,5
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1681],rax
	je L_203
	mov rdx,t81
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_198
	
L_203:
	mov rbx,  [rsp+8*1674]
	mov rdx,6
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1682],rax
	je L_204
	mov rdx,t84
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_198
	
L_204:
	mov rbx,  [rsp+8*1674]
	mov rdx,7
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1683],rax
	je L_205
	mov rdx,t87
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_198
	
L_205:
	mov rbx,  [rsp+8*1674]
	mov rdx,8
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1684],rax
	je L_206
	mov rdx,t90
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_198
	
L_206:
	mov rbx,  [rsp+8*1674]
	mov rdx,9
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1685],rax
	je L_207
	mov rdx,t93
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_198
	
L_207:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	
L_198:
	mov rdx,  [rsp+8*1676]
	mov rbx,rdx
	mov qword [rsp+8*1686],rbx
	mov     rsi, [rsp+8*1686]
	mov     rdi, t122
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1687], rax
	mov     rsi, t126
	mov     rdi, [rsp+8*1687]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1687], rax
	mov rdx,  [rsp+8*1687]
	mov rbx,rdx
	mov qword [rsp+8*1688],rbx
	jmp L_209
	
L_195:
	xor rdx, rdx
	mov rax, [rsp+8*1672]
	mov rbx, 10
	cdq
	idiv rbx
	mov [rsp+8*1689], rax
	mov rbx,  [rsp+8*1689]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,0
	cmp rdx,rax
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*1675],rbx
	mov qword [rsp+8*1674],rdx
	je L_210
	mov rdx,t66
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_212
	
L_210:
	mov rbx,  [rsp+8*1674]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1677],rax
	je L_213
	mov rdx,t69
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_212
	
L_213:
	mov rbx,  [rsp+8*1674]
	mov rdx,2
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1678],rax
	je L_214
	mov rdx,t72
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_212
	
L_214:
	mov rbx,  [rsp+8*1674]
	mov rdx,3
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1679],rax
	je L_215
	mov rdx,t75
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_212
	
L_215:
	mov rbx,  [rsp+8*1674]
	mov rdx,4
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1680],rax
	je L_216
	mov rdx,t78
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_212
	
L_216:
	mov rbx,  [rsp+8*1674]
	mov rdx,5
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1681],rax
	je L_217
	mov rdx,t81
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_212
	
L_217:
	mov rbx,  [rsp+8*1674]
	mov rdx,6
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1682],rax
	je L_218
	mov rdx,t84
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_212
	
L_218:
	mov rbx,  [rsp+8*1674]
	mov rdx,7
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1683],rax
	je L_219
	mov rdx,t87
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_212
	
L_219:
	mov rbx,  [rsp+8*1674]
	mov rdx,8
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1684],rax
	je L_220
	mov rdx,t90
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_212
	
L_220:
	mov rbx,  [rsp+8*1674]
	mov rdx,9
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1685],rax
	je L_221
	mov rdx,t93
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_212
	
L_221:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	
L_212:
	mov rdx,  [rsp+8*1676]
	mov rbx,rdx
	mov qword [rsp+8*1690],rbx
	mov     rsi, [rsp+8*1690]
	mov     rdi, t127
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1691], rax
	xor rdx, rdx
	mov rax, [rsp+8*1672]
	mov rbx, 10
	cdq
	idiv rbx
	mov [rsp+8*1692], rdx
	mov rbx,  [rsp+8*1692]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,0
	cmp rdx,rax
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*1675],rbx
	mov qword [rsp+8*1674],rdx
	je L_222
	mov rdx,t66
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_224
	
L_222:
	mov rbx,  [rsp+8*1674]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1677],rax
	je L_225
	mov rdx,t69
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_224
	
L_225:
	mov rbx,  [rsp+8*1674]
	mov rdx,2
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1678],rax
	je L_226
	mov rdx,t72
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_224
	
L_226:
	mov rbx,  [rsp+8*1674]
	mov rdx,3
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1679],rax
	je L_227
	mov rdx,t75
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_224
	
L_227:
	mov rbx,  [rsp+8*1674]
	mov rdx,4
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1680],rax
	je L_228
	mov rdx,t78
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_224
	
L_228:
	mov rbx,  [rsp+8*1674]
	mov rdx,5
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1681],rax
	je L_229
	mov rdx,t81
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_224
	
L_229:
	mov rbx,  [rsp+8*1674]
	mov rdx,6
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1682],rax
	je L_230
	mov rdx,t84
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_224
	
L_230:
	mov rbx,  [rsp+8*1674]
	mov rdx,7
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1683],rax
	je L_231
	mov rdx,t87
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_224
	
L_231:
	mov rbx,  [rsp+8*1674]
	mov rdx,8
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1684],rax
	je L_232
	mov rdx,t90
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_224
	
L_232:
	mov rbx,  [rsp+8*1674]
	mov rdx,9
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1685],rax
	je L_233
	mov rdx,t93
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_224
	
L_233:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	
L_224:
	mov rdx,  [rsp+8*1676]
	mov rbx,rdx
	mov qword [rsp+8*1693],rbx
	mov     rsi, [rsp+8*1693]
	mov     rdi, [rsp+8*1691]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1691], rax
	mov     rsi, t137
	mov     rdi, [rsp+8*1691]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1691], rax
	mov rdx,  [rsp+8*1691]
	mov rbx,rdx
	mov qword [rsp+8*1688],rbx
	
L_209:
	mov rdx,  [rsp+8*1688]
	mov rbx,rdx
	mov qword [rsp+8*1694],rbx
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1694]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1695], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,  [rsp+8*2]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1696],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1698],rbx
	mov qword [rsp+8*1697],rdx
	mov     rsi, [rsp+8*1698]
	mov     rdi, [rsp+8*1695]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1695], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1695]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1695], rax
	mov     rsi, [gbl+8*1699]
	mov     rdi, [rsp+8*1695]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1695], rax
	mov rbx,  [rsp+8*1695]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1700],rdx
	mov rdi,[rsp+8*1700] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [rsp+8*2]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*1701],rbx
	mov qword [rsp+8*2],rdx
	jmp L_24
	
L_25:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*2],rbx
	
L_27:
	mov rbx,  [rsp+8*2]
	mov rdx,32
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*1702],rax
	je L_28
	mov rbx,  [rsp+8*2]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,9
	cmp rdx,rax
	mov rbx, 0
	setle bl
	cmp rbx, 0
	mov qword [rsp+8*1704],rbx
	mov qword [rsp+8*1703],rdx
	je L_234
	mov rbx,  [rsp+8*1703]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,0
	cmp rdx,rax
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*1675],rbx
	mov qword [rsp+8*1674],rdx
	je L_235
	mov rdx,t66
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_237
	
L_235:
	mov rbx,  [rsp+8*1674]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1677],rax
	je L_238
	mov rdx,t69
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_237
	
L_238:
	mov rbx,  [rsp+8*1674]
	mov rdx,2
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1678],rax
	je L_239
	mov rdx,t72
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_237
	
L_239:
	mov rbx,  [rsp+8*1674]
	mov rdx,3
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1679],rax
	je L_240
	mov rdx,t75
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_237
	
L_240:
	mov rbx,  [rsp+8*1674]
	mov rdx,4
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1680],rax
	je L_241
	mov rdx,t78
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_237
	
L_241:
	mov rbx,  [rsp+8*1674]
	mov rdx,5
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1681],rax
	je L_242
	mov rdx,t81
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_237
	
L_242:
	mov rbx,  [rsp+8*1674]
	mov rdx,6
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1682],rax
	je L_243
	mov rdx,t84
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_237
	
L_243:
	mov rbx,  [rsp+8*1674]
	mov rdx,7
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1683],rax
	je L_244
	mov rdx,t87
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_237
	
L_244:
	mov rbx,  [rsp+8*1674]
	mov rdx,8
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1684],rax
	je L_245
	mov rdx,t90
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_237
	
L_245:
	mov rbx,  [rsp+8*1674]
	mov rdx,9
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1685],rax
	je L_246
	mov rdx,t93
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_237
	
L_246:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	
L_237:
	mov rdx,  [rsp+8*1676]
	mov rbx,rdx
	mov qword [rsp+8*1705],rbx
	mov     rsi, [rsp+8*1705]
	mov     rdi, t103
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1706], rax
	mov     rsi, t107
	mov     rdi, [rsp+8*1706]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1706], rax
	mov rdx,  [rsp+8*1706]
	mov rbx,rdx
	mov qword [rsp+8*1707],rbx
	jmp L_248
	
L_234:
	xor rdx, rdx
	mov rax, [rsp+8*1703]
	mov rbx, 10
	cdq
	idiv rbx
	mov [rsp+8*1708], rax
	mov rbx,  [rsp+8*1708]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,0
	cmp rdx,rax
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*1675],rbx
	mov qword [rsp+8*1674],rdx
	je L_249
	mov rdx,t66
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_251
	
L_249:
	mov rbx,  [rsp+8*1674]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1677],rax
	je L_252
	mov rdx,t69
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_251
	
L_252:
	mov rbx,  [rsp+8*1674]
	mov rdx,2
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1678],rax
	je L_253
	mov rdx,t72
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_251
	
L_253:
	mov rbx,  [rsp+8*1674]
	mov rdx,3
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1679],rax
	je L_254
	mov rdx,t75
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_251
	
L_254:
	mov rbx,  [rsp+8*1674]
	mov rdx,4
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1680],rax
	je L_255
	mov rdx,t78
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_251
	
L_255:
	mov rbx,  [rsp+8*1674]
	mov rdx,5
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1681],rax
	je L_256
	mov rdx,t81
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_251
	
L_256:
	mov rbx,  [rsp+8*1674]
	mov rdx,6
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1682],rax
	je L_257
	mov rdx,t84
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_251
	
L_257:
	mov rbx,  [rsp+8*1674]
	mov rdx,7
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1683],rax
	je L_258
	mov rdx,t87
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_251
	
L_258:
	mov rbx,  [rsp+8*1674]
	mov rdx,8
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1684],rax
	je L_259
	mov rdx,t90
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_251
	
L_259:
	mov rbx,  [rsp+8*1674]
	mov rdx,9
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1685],rax
	je L_260
	mov rdx,t93
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_251
	
L_260:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	
L_251:
	mov rdx,  [rsp+8*1676]
	mov rbx,rdx
	mov qword [rsp+8*1709],rbx
	mov     rsi, [rsp+8*1709]
	mov     rdi, t108
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1710], rax
	xor rdx, rdx
	mov rax, [rsp+8*1703]
	mov rbx, 10
	cdq
	idiv rbx
	mov [rsp+8*1711], rdx
	mov rbx,  [rsp+8*1711]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,0
	cmp rdx,rax
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*1675],rbx
	mov qword [rsp+8*1674],rdx
	je L_261
	mov rdx,t66
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_263
	
L_261:
	mov rbx,  [rsp+8*1674]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1677],rax
	je L_264
	mov rdx,t69
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_263
	
L_264:
	mov rbx,  [rsp+8*1674]
	mov rdx,2
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1678],rax
	je L_265
	mov rdx,t72
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_263
	
L_265:
	mov rbx,  [rsp+8*1674]
	mov rdx,3
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1679],rax
	je L_266
	mov rdx,t75
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_263
	
L_266:
	mov rbx,  [rsp+8*1674]
	mov rdx,4
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1680],rax
	je L_267
	mov rdx,t78
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_263
	
L_267:
	mov rbx,  [rsp+8*1674]
	mov rdx,5
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1681],rax
	je L_268
	mov rdx,t81
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_263
	
L_268:
	mov rbx,  [rsp+8*1674]
	mov rdx,6
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1682],rax
	je L_269
	mov rdx,t84
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_263
	
L_269:
	mov rbx,  [rsp+8*1674]
	mov rdx,7
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1683],rax
	je L_270
	mov rdx,t87
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_263
	
L_270:
	mov rbx,  [rsp+8*1674]
	mov rdx,8
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1684],rax
	je L_271
	mov rdx,t90
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_263
	
L_271:
	mov rbx,  [rsp+8*1674]
	mov rdx,9
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1685],rax
	je L_272
	mov rdx,t93
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	jmp L_263
	
L_272:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*1676],rbx
	
L_263:
	mov rdx,  [rsp+8*1676]
	mov rbx,rdx
	mov qword [rsp+8*1712],rbx
	mov     rsi, [rsp+8*1712]
	mov     rdi, [rsp+8*1710]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1710], rax
	mov     rsi, t118
	mov     rdi, [rsp+8*1710]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1710], rax
	mov rdx,  [rsp+8*1710]
	mov rbx,rdx
	mov qword [rsp+8*1707],rbx
	
L_248:
	mov rdx,  [rsp+8*1707]
	mov rbx,rdx
	mov qword [rsp+8*1713],rbx
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1713]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1714], rax
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,  [rsp+8*2]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1715],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1717],rbx
	mov qword [rsp+8*1716],rdx
	mov     rsi, [rsp+8*1717]
	mov     rdi, [rsp+8*1714]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1714], rax
	mov     rsi, [gbl+8*361]
	mov     rdi, [rsp+8*1714]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1714], rax
	mov     rsi, [gbl+8*1699]
	mov     rdi, [rsp+8*1714]
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov [rsp+8*1714], rax
	mov rbx,  [rsp+8*1714]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1718],rdx
	mov rdi,[rsp+8*1718] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [rsp+8*2]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*1719],rbx
	mov qword [rsp+8*2],rdx
	jmp L_27
	
L_28:
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*2],rbx
	
L_30:
	mov rbx,  [rsp+8*2]
	mov rdx,32
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*1720],rax
	je L_31
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,  [rsp+8*2]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1721],rbx
	mov rbx, [rdx]
	mov rdi,rbx
	mov qword [rsp+8*1723],rbx
	mov rbx,rdi
	mov qword [rsp+8*1724],rbx
	mov qword [rsp+8*1722],rdx
	mov rdi,[rsp+8*1724] 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rdx,  [rsp+8*2]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*1725],rbx
	mov qword [rsp+8*2],rdx
	jmp L_30
	
L_31:
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 13888
	mov     rdi, 256
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov     qword [gbl+8*1726], rax
	mov rdx,  [gbl+8*1726]
	mov rbx,rdx
	mov qword [gbl+8*190],rbx
	mov     rdi, 256
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov     qword [gbl+8*1727], rax
	mov rdx,  [gbl+8*1727]
	mov rbx,rdx
	mov qword [gbl+8*3],rbx
	mov rbx,t139
	mov rax,rbx
	mov rdx,t140
	mov rbx,rdx
	mov qword [gbl+8*361],rbx
	mov rdx,t141
	mov rbx,rdx
	mov qword [gbl+8*1624],rbx
	mov qword [gbl+8*1699],rax
	mov rbx,  [rsp+8*1728]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   15872
buff.1788:
        resb    256
arg:
        resb    1024

trsp:         resb   1024
s.1809:
        resb    1

ML_31:
        resb    319
mem.1758:
        resb    536870912
	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	
GS_31:
	db 25H, 6CH, 64H, 00H
	
GS_32:
	db 25H, 73H, 00H
	ML_32:
        db 25H, 6CH, 64H, 00H

t122:
	 db 2,"c[" ,0

t243:
	 db 1,":" ,0

t363:
	 db 1,"X" ,0

t487:
	 db 1,"x" ,0

t483:
	 db 1,"w" ,0

t515:
	 db 83,"int main(){int i=0;// Quine is a a program that produces its source code as output." ,0

t118:
	 db 2,"]=" ,0

t239:
	 db 1,"9" ,0

t635:
	 db 9,"return 0;" ,0

t511:
	 db 1,"~" ,0

t599:
	 db 241,"println(c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[65]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[14]+c[16]+c[15]+c[8]+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[4]+c[16]+c[15]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t235:
	 db 1,"8" ,0

t631:
	 db 31,"for(i=1;i<32;i++)println(s[i]);" ,0

t359:
	 db 1,"W" ,0

t479:
	 db 1,"v" ,0

t519:
	 db 119,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[66]+c[71]+c[69]+c[82]+c[7]+c[71]+c[76]+c[82]+c[0]+c[86]+c[8]+c[89]);" ,0

t639:
	 db 1,"}" ,0

t191:
	 db 1,"-" ,0

t199:
	 db 1,"/" ,0

t595:
	 db 206,"println(c[71]+c[68]+c[7]+c[65]+c[65]+c[27]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[65]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t231:
	 db 1,"7" ,0

t355:
	 db 1,"V" ,0

t475:
	 db 1,"u" ,0

t195:
	 db 1,"." ,0

t591:
	 db 113,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[65]+c[17]+c[7]+c[71]+c[76]+c[82]+c[0]+c[65]+c[65]+c[8]+c[89]);" ,0

t351:
	 db 1,"U" ,0

t471:
	 db 1,"t" ,0

t108:
	 db 2,"s[" ,0

t107:
	 db 2,"]=" ,0

t503:
	 db 1,"|" ,0

t627:
	 db 48,"for(i=0;i<32;i++)println(s2(i)+a2q+s[i]+a2q+co);" ,0

t467:
	 db 1,"s" ,0

t66:
	 db 1,"0" ,0

t103:
	 db 2,"s[" ,0

t587:
	 db 15,"println(c[91]);" ,0

t69:
	 db 1,"1" ,0

t227:
	 db 1,"6" ,0

t623:
	 db 48,"for(i=0;i<93;i++)println(c2(i)+a2q+c[i]+a2q+co);" ,0

t347:
	 db 1,"T" ,0

t507:
	 db 1,"}" ,0

t143:
	 db 1," " ,0

t267:
	 db 1,"@" ,0

t387:
	 db 1,"_" ,0

t140:
	 db 1,"",34,"" ,0

t72:
	 db 1,"2" ,0

t263:
	 db 1,"?" ,0

t141:
	 db 1,"",92,"" ,0

t383:
	 db 1,"^" ,0

t415:
	 db 1,"f" ,0

t539:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[19]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[19]+a2q+c[26]);" ,0

t75:
	 db 1,"3" ,0

t78:
	 db 1,"4" ,0

t137:
	 db 2,"]=" ,0

t379:
	 db 1,"]" ,0

t411:
	 db 1,"e" ,0

t499:
	 db 1,"{" ,0

t139:
	 db 1,";" ,0

t535:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[18]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[18]+a2q+c[26]);" ,0

t259:
	 db 1,">" ,0

t419:
	 db 1,"g" ,0

t375:
	 db 1,"[" ,0

t495:
	 db 1,"z" ,0

t531:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[17]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[17]+a2q+c[26]);" ,0

t255:
	 db 1,"=" ,0

t81:
	 db 1,"5" ,0

t371:
	 db 1,"Z" ,0

t491:
	 db 1,"y" ,0

t251:
	 db 1,"<" ,0

t84:
	 db 1,"6" ,0

t87:
	 db 1,"7" ,0

t407:
	 db 1,"d" ,0

t527:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[16]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[16]+a2q+c[26]);" ,0

t126:
	 db 2,"]=" ,0

t247:
	 db 1,";" ,0

t367:
	 db 1,"Y" ,0

t403:
	 db 1,"c" ,0

t127:
	 db 2,"c[" ,0

t523:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[15]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[15]+a2q+c[26]);" ,0

t287:
	 db 1,"E" ,0

t90:
	 db 1,"8" ,0

t443:
	 db 1,"m" ,0

t167:
	 db 1,"'" ,0

t563:
	 db 15,"println(c[91]);" ,0

t283:
	 db 1,"D" ,0

t93:
	 db 1,"9" ,0

t163:
	 db 1,"&" ,0

t559:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[24]+a2q+c[26]);" ,0

t319:
	 db 1,"M" ,0

t439:
	 db 1,"l" ,0

t159:
	 db 1,"%" ,0

t555:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[23]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[23]+a2q+c[26]);" ,0

t279:
	 db 1,"C" ,0

t315:
	 db 1,"L" ,0

t435:
	 db 1,"k" ,0

t391:
	 db 1,"`" ,0

t155:
	 db 1,"$" ,0

t551:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[22]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[22]+a2q+c[26]);" ,0

t275:
	 db 1,"B" ,0

t311:
	 db 1,"K" ,0

t399:
	 db 1,"b" ,0

t431:
	 db 1,"j" ,0

t151:
	 db 1,"#" ,0

t271:
	 db 1,"A" ,0

t395:
	 db 1,"a" ,0

t427:
	 db 1,"i" ,0

t547:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[21]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[21]+a2q+c[26]);" ,0

t307:
	 db 1,"J" ,0

t423:
	 db 1,"h" ,0

t147:
	 db 1,"!" ,0

t543:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[20]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[20]+a2q+c[26]);" ,0

t303:
	 db 1,"I" ,0

t463:
	 db 1,"r" ,0

t187:
	 db 1,"," ,0

t583:
	 db 241,"println(c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[81]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[14]+c[16]+c[15]+c[8]+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[4]+c[16]+c[15]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t223:
	 db 1,"5" ,0

t343:
	 db 1,"S" ,0

t183:
	 db 1,"+" ,0

t339:
	 db 1,"R" ,0

t459:
	 db 1,"q" ,0

t219:
	 db 1,"4" ,0

t615:
	 db 96,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[63]+c[17]+c[64]+c[28]+a2q+a2b+a2b+a2q+c[26]);" ,0

t335:
	 db 1,"Q" ,0

t455:
	 db 1,"p" ,0

t579:
	 db 206,"println(c[71]+c[68]+c[7]+c[81]+c[81]+c[27]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[81]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t215:
	 db 1,"3" ,0

t611:
	 db 96,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[63]+c[17]+c[79]+c[28]+a2q+a2b+a2q+a2q+c[26]);" ,0

t619:
	 db 14,"println(s[0]);" ,0

t171:
	 db 1,"(" ,0

t291:
	 db 1,"F" ,0

t331:
	 db 1,"P" ,0

t451:
	 db 1,"o" ,0

t179:
	 db 1,"*" ,0

t575:
	 db 113,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[81]+c[17]+c[7]+c[71]+c[76]+c[82]+c[0]+c[81]+c[81]+c[8]+c[89]);" ,0

t211:
	 db 1,"2" ,0

t299:
	 db 1,"H" ,0

t175:
	 db 1,")" ,0

t571:
	 db 169,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[59]+c[0]+c[65]+c[28]+c[76]+c[67]+c[85]+c[0]+c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[17]+c[20]+c[21]+c[59]+c[26]);" ,0

t295:
	 db 1,"G" ,0

t207:
	 db 1,"1" ,0

t603:
	 db 15,"println(c[91]);" ,0

t327:
	 db 1,"O" ,0

t203:
	 db 1,"0" ,0

t323:
	 db 1,"N" ,0

t447:
	 db 1,"n" ,0

t567:
	 db 169,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[59]+c[0]+c[81]+c[28]+c[76]+c[67]+c[85]+c[0]+c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[17]+c[20]+c[21]+c[59]+c[26]);" ,0

t607:
	 db 88,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[65]+c[77]+c[28]+a2q+c[26]+a2q+c[26]);" ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

