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
	sub    rsp, 952
	mov     rax, 936870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 936870912
        movsxd  rdx, edx
        sub     rdx, 2936
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	push r10
	call global_init
	pop r10
	pop r15
	mov r15 , rax
	mov rbx,106
	mov rdi,rbx
	mov r13,rdi
	mov     rdi,  r13
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
	mov     qword  r15, rax
	mov rbx,r15
	mov rdx,0
	mov r9,rdx
	mov qword [gbl+8*5],rbx
	
L_1639:
	cmp r9,r13
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1640
	mov     rdi,  r13
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
	mov     qword  r15, rax
	mov rbx,  [gbl+8*5]
	mov r14,rbx
	lea r14,[r14+r9*8+8H]
	mov [r14],r15
	mov rdx,0
	mov r14,rdx
	
L_1641:
	cmp r14,r13
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1642
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	lea r15,[r15+r14*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r14
	mov rax,1
	add r14,rax
	jmp L_1641
	
L_1642:
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_1639
	
L_1640:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,101
	mov r11,rdx
	mov rax,1
	mov r15,r11
	sub r15,rax
	mov r13,r15
	mov r12,r13
	mov rbx,0
	mov r9,rbx
	
L_1619:
	cmp r9,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1620
	mov rbx,0
	mov r14,rbx
	
L_1622:
	cmp r14,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1623
	mov rbx,1
	mov rdx,rbx
	neg rdx
	mov rax,  [gbl+8*5]
	mov r15,rax
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	lea r15,[r15+r14*8+8H]
	mov [r15],rdx
	mov r15,r14
	mov rbx,1
	add r14,rbx
	mov qword [rsp+8*25],rdx
	jmp L_1622
	
L_1623:
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_1619
	
L_1620:
	
L_1625:
	mov rbx,  [gbl+8*30]
	cmp rbx,r10
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1626
	mov rbx,  [gbl+8*33]
	mov r15,rbx
	mov rdx,  [gbl+8*30]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov r9,r15
	mov rax,  [gbl+8*38]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,r15
	mov rax,  [gbl+8*5]
	mov r15,rax
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rdx,r15
	mov rax,1
	mov r14,r9
	sub r14,rax
	mov rax,2
	mov r15,rbx
	sub r15,rax
	mov rsi,r15
	mov rdi,r14
	mov rax,rdi
	mov qword [gbl+8*46],rdx
	mov rdx,rsi
	mov rsi,r11
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [gbl+8*42],rbx
	mov qword [rsp+8*51],rdx
	mov qword [rsp+8*50],rax
	jne L_1676
	mov rbx,0
	mov r15,rbx
	jmp L_1677
	
L_1676:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1677:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1680
	mov rbx,0
	mov r15,rbx
	jmp L_1681
	
L_1680:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1682
	mov rbx,0
	mov r15,rbx
	jmp L_1683
	
L_1682:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1683:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1681:
	cmp r15, 0
	je L_1686
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov r14, [r15]
	mov rbx,1
	mov r15,rbx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1687
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	mov rbx,  [rsp+8*50]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r12
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1688
	mov rbx,0
	mov r15,rbx
	jmp L_1689
	
L_1688:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1689:
	cmp r15, 0
	je L_1690
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1690:
	
L_1687:
	
L_1686:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,1
	mov r15,r9
	sub r15,rdx
	mov rax,  [gbl+8*42]
	mov rdx,2
	mov r14,rax
	add r14,rdx
	mov rsi,r14
	mov rdi,r15
	mov rdx,rdi
	mov rbx,rsi
	mov rsi,r11
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*51],rbx
	mov qword [rsp+8*50],rdx
	jne L_1693
	mov rbx,0
	mov r15,rbx
	jmp L_1694
	
L_1693:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1694:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1697
	mov rbx,0
	mov r15,rbx
	jmp L_1698
	
L_1697:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1699
	mov rbx,0
	mov r15,rbx
	jmp L_1700
	
L_1699:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1700:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1698:
	cmp r15, 0
	je L_1703
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov r14, [r15]
	mov rbx,1
	mov r15,rbx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1704
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	mov rbx,  [rsp+8*50]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r12
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1705
	mov rbx,0
	mov r15,rbx
	jmp L_1706
	
L_1705:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1706:
	cmp r15, 0
	je L_1707
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1707:
	
L_1704:
	
L_1703:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,1
	mov r15,r9
	add r15,rdx
	mov rax,  [gbl+8*42]
	mov rdx,2
	mov r14,rax
	sub r14,rdx
	mov rsi,r14
	mov rdi,r15
	mov rdx,rdi
	mov rbx,rsi
	mov rsi,r11
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*51],rbx
	mov qword [rsp+8*50],rdx
	jne L_1710
	mov rbx,0
	mov r15,rbx
	jmp L_1711
	
L_1710:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1711:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1714
	mov rbx,0
	mov r15,rbx
	jmp L_1715
	
L_1714:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1716
	mov rbx,0
	mov r15,rbx
	jmp L_1717
	
L_1716:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1717:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1715:
	cmp r15, 0
	je L_1720
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov r14, [r15]
	mov rbx,1
	mov r15,rbx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1721
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	mov rbx,  [rsp+8*50]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r12
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1722
	mov rbx,0
	mov r15,rbx
	jmp L_1723
	
L_1722:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1723:
	cmp r15, 0
	je L_1724
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1724:
	
L_1721:
	
L_1720:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,1
	mov r15,r9
	add r15,rdx
	mov rax,  [gbl+8*42]
	mov rdx,2
	mov r14,rax
	add r14,rdx
	mov rsi,r14
	mov rdi,r15
	mov rdx,rdi
	mov rbx,rsi
	mov rsi,r11
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*51],rbx
	mov qword [rsp+8*50],rdx
	jne L_1727
	mov rbx,0
	mov r15,rbx
	jmp L_1728
	
L_1727:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1728:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1731
	mov rbx,0
	mov r15,rbx
	jmp L_1732
	
L_1731:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1733
	mov rbx,0
	mov r15,rbx
	jmp L_1734
	
L_1733:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1734:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1732:
	cmp r15, 0
	je L_1737
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov r14, [r15]
	mov rbx,1
	mov r15,rbx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1738
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	mov rbx,  [rsp+8*50]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r12
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1739
	mov rbx,0
	mov r15,rbx
	jmp L_1740
	
L_1739:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1740:
	cmp r15, 0
	je L_1741
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1741:
	
L_1738:
	
L_1737:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,2
	mov r15,r9
	sub r15,rdx
	mov rax,  [gbl+8*42]
	mov rdx,1
	mov r14,rax
	sub r14,rdx
	mov rsi,r14
	mov rdi,r15
	mov rdx,rdi
	mov rbx,rsi
	mov rsi,r11
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*51],rbx
	mov qword [rsp+8*50],rdx
	jne L_1744
	mov rbx,0
	mov r15,rbx
	jmp L_1745
	
L_1744:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1745:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1748
	mov rbx,0
	mov r15,rbx
	jmp L_1749
	
L_1748:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1750
	mov rbx,0
	mov r15,rbx
	jmp L_1751
	
L_1750:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1751:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1749:
	cmp r15, 0
	je L_1754
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov r14, [r15]
	mov rbx,1
	mov r15,rbx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1755
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	mov rbx,  [rsp+8*50]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r12
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1756
	mov rbx,0
	mov r15,rbx
	jmp L_1757
	
L_1756:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1757:
	cmp r15, 0
	je L_1758
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1758:
	
L_1755:
	
L_1754:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,2
	mov r14,r9
	sub r14,rdx
	mov rax,  [gbl+8*42]
	mov rdx,1
	mov r15,rax
	add r15,rdx
	mov rsi,r15
	mov rdi,r14
	mov rdx,rdi
	mov rbx,rsi
	mov rsi,r11
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*51],rbx
	mov qword [rsp+8*50],rdx
	jne L_1761
	mov rbx,0
	mov r15,rbx
	jmp L_1762
	
L_1761:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1762:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1765
	mov rbx,0
	mov r15,rbx
	jmp L_1766
	
L_1765:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1767
	mov rbx,0
	mov r15,rbx
	jmp L_1768
	
L_1767:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1768:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1766:
	cmp r15, 0
	je L_1771
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov r14, [r15]
	mov rbx,1
	mov r15,rbx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1772
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	mov rbx,  [rsp+8*50]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r12
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1773
	mov rbx,0
	mov r15,rbx
	jmp L_1774
	
L_1773:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1774:
	cmp r15, 0
	je L_1775
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1775:
	
L_1772:
	
L_1771:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,2
	mov r14,r9
	add r14,rdx
	mov rax,  [gbl+8*42]
	mov rdx,1
	mov r15,rax
	sub r15,rdx
	mov rsi,r15
	mov rdi,r14
	mov rdx,rdi
	mov rbx,rsi
	mov rsi,r11
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*51],rbx
	mov qword [rsp+8*50],rdx
	jne L_1778
	mov rbx,0
	mov r15,rbx
	jmp L_1779
	
L_1778:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1779:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1782
	mov rbx,0
	mov r15,rbx
	jmp L_1783
	
L_1782:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1784
	mov rbx,0
	mov r15,rbx
	jmp L_1785
	
L_1784:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1785:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1783:
	cmp r15, 0
	je L_1788
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov r14, [r15]
	mov rbx,1
	mov r15,rbx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1789
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	mov rbx,  [rsp+8*50]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r12
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1790
	mov rbx,0
	mov r15,rbx
	jmp L_1791
	
L_1790:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1791:
	cmp r15, 0
	je L_1792
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1792:
	
L_1789:
	
L_1788:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,2
	mov r15,r9
	add r15,rdx
	mov rax,  [gbl+8*42]
	mov rdx,1
	mov r14,rax
	add r14,rdx
	mov rsi,r14
	mov rdi,r15
	mov rdx,rdi
	mov rax,rsi
	mov rsi,r11
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*50],rdx
	mov qword [rsp+8*51],rax
	jne L_1795
	mov rbx,0
	mov r15,rbx
	jmp L_1796
	
L_1795:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1796:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1799
	mov rbx,0
	mov r15,rbx
	jmp L_1800
	
L_1799:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1801
	mov rbx,0
	mov r15,rbx
	jmp L_1802
	
L_1801:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1802:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1800:
	cmp r15, 0
	je L_1805
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov r14, [r15]
	mov rbx,1
	mov r15,rbx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1806
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rax,  [rsp+8*50]
	lea r15,[r15+rax*8+8H]
	mov r15, [r15]
	lea r15,[r15+rdx*8+8H]
	mov [r15],r14
	cmp rax,r12
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1807
	mov rbx,0
	mov r15,rbx
	jmp L_1808
	
L_1807:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1808:
	cmp r15, 0
	je L_1809
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1809:
	
L_1806:
	
L_1805:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,  [gbl+8*75]
	mov rax,1
	cmp rdx,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1628
	jmp L_1626
	
L_1628:
	mov rbx,  [gbl+8*30]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov qword [gbl+8*30],rbx
	jmp L_1625
	
L_1626:
	mov rbx,  [gbl+8*75]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1629
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	mov rdi,r15
	mov r15,rdi
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov     qword r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, r15 
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
	jmp L_1630
	
L_1629:
	mov rbx,t211
	mov rdi,rbx
	mov r15,rdi
	mov rdi, r15 
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
	
L_1630:
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 952
	mov     rdi, 12000
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
	mov     qword [gbl+8*109], rax
	mov rdx,  [gbl+8*109]
	mov rbx,rdx
	mov qword [gbl+8*33],rbx
	mov     rdi, 12000
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
	mov     qword [gbl+8*110], rax
	mov rdx,  [gbl+8*110]
	mov rbx,rdx
	mov qword [gbl+8*38],rbx
	mov rbx,  [rsp+8*111]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   2936
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

t211:
	 db 12,"no solution!" ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

