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
	mov r15 , rax
	mov rbx,106
	mov rdi,rbx
	mov r10,rdi
	mov     rdi,  r10
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
	mov r12,r15
	mov rbx,0
	mov r14,rbx
	
L_1663:
	cmp r14,r10
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1664
	mov     rdi,  r10
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
	mov r13,r12
	lea r13,[r13+r14*8+8H]
	mov [r13],r15
	mov rbx,0
	mov r13,rbx
	
L_1665:
	cmp r13,r10
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1666
	mov r15,r12
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov rbx,0
	mov [r15],rbx
	mov r15,r13
	mov rdx,1
	add r13,rdx
	jmp L_1665
	
L_1666:
	mov r15,r14
	mov rbx,1
	add r14,rbx
	jmp L_1663
	
L_1664:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rax,101
	mov rdx,rax
	mov rbx,1
	mov r15,rdx
	sub r15,rbx
	mov r9,r15
	mov rbx,r9
	mov rax,0
	mov r14,rax
	mov qword [gbl+8*22],rbx
	mov qword [gbl+8*19],rdx
	
L_1643:
	mov rbx,  [gbl+8*19]
	cmp r14,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1644
	mov rbx,0
	mov r13,rbx
	
L_1646:
	mov rbx,  [gbl+8*19]
	cmp r13,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1647
	mov rbx,1
	mov r10,rbx
	neg r10
	mov r15,r12
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov [r15],r10
	mov r15,r13
	mov rdx,1
	add r13,rdx
	jmp L_1646
	
L_1647:
	mov r15,r14
	mov rbx,1
	add r14,rbx
	jmp L_1643
	
L_1644:
	
L_1649:
	mov rbx,  [gbl+8*30]
	mov rdx,  [gbl+8*31]
	cmp rbx,rdx
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1650
	mov rbx,  [gbl+8*33]
	mov r15,rbx
	mov rdx,  [gbl+8*30]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,r15
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov qword [gbl+8*37],rax
	mov rax,r15
	mov r15,r12
	mov rbx,  [gbl+8*37]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	lea r15,[r15+rax*8+8H]
	mov r15, [r15]
	mov rdx,r15
	mov qword [gbl+8*42],rax
	mov rax,1
	mov r10,rbx
	sub r10,rax
	mov rax,  [gbl+8*42]
	mov qword [gbl+8*46],rdx
	mov rdx,2
	mov r13,rax
	sub r13,rdx
	mov rsi,r13
	mov rdi,r10
	mov r10,rdi
	mov r15,rsi
	mov rdx,  [gbl+8*19]
	mov rsi,rdx
	mov rdi,r10
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1700
	mov rbx,0
	mov r13,rbx
	jmp L_1701
	
L_1700:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1701:
	mov r13,r13
	mov r13,r13
	cmp r13, 0
	jne L_1704
	mov rbx,0
	mov r13,rbx
	jmp L_1705
	
L_1704:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r15
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1706
	mov rbx,0
	mov r13,rbx
	jmp L_1707
	
L_1706:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1707:
	mov r13,r13
	mov r13,r13
	mov r13,r13
	
L_1705:
	cmp r13, 0
	je L_1710
	mov r13,r12
	lea r13,[r13+r10*8+8H]
	mov r13, [r13]
	lea r13,[r13+r15*8+8H]
	mov r14, [r13]
	mov rbx,1
	mov r13,rbx
	neg r13
	cmp r14,r13
	mov r13, 0
	sete r13B
	cmp r13, 0
	je L_1711
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r13,rbx
	add r13,rdx
	mov rbx,r13
	mov rax,  [gbl+8*33]
	mov r13,rax
	lea r13,[r13+rbx*8+8H]
	mov [r13],r10
	mov rdx,  [gbl+8*38]
	mov r13,rdx
	lea r13,[r13+rbx*8+8H]
	mov [r13],r15
	mov rax,  [gbl+8*46]
	mov rdx,1
	mov r13,rax
	add r13,rdx
	mov r14,r12
	lea r14,[r14+r10*8+8H]
	mov r14, [r14]
	lea r14,[r14+r15*8+8H]
	mov [r14],r13
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*22]
	cmp r10,rbx
	mov r13, 0
	sete r13B
	cmp r13, 0
	jne L_1712
	mov rbx,0
	mov r13,rbx
	jmp L_1713
	
L_1712:
	cmp r15,r9
	mov r13, 0
	sete r13B
	mov r13,r13
	
L_1713:
	cmp r13, 0
	je L_1714
	mov rbx,1
	mov r11,rbx
	
L_1714:
	
L_1711:
	
L_1710:
	mov rbx,0
	mov r13,rbx
	mov r13,r13
	mov rdx,  [gbl+8*37]
	mov rax,1
	mov r13,rdx
	sub r13,rax
	mov rax,  [gbl+8*42]
	mov rbx,2
	mov r10,rax
	add r10,rbx
	mov rsi,r10
	mov rdi,r13
	mov r10,rdi
	mov r15,rsi
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r10
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1717
	mov rbx,0
	mov r13,rbx
	jmp L_1718
	
L_1717:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1718:
	mov r13,r13
	mov r13,r13
	cmp r13, 0
	jne L_1721
	mov rbx,0
	mov r13,rbx
	jmp L_1722
	
L_1721:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r15
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1723
	mov rbx,0
	mov r13,rbx
	jmp L_1724
	
L_1723:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1724:
	mov r13,r13
	mov r13,r13
	mov r13,r13
	
L_1722:
	cmp r13, 0
	je L_1727
	mov r13,r12
	lea r13,[r13+r10*8+8H]
	mov r13, [r13]
	lea r13,[r13+r15*8+8H]
	mov r14, [r13]
	mov rbx,1
	mov r13,rbx
	neg r13
	cmp r14,r13
	mov r13, 0
	sete r13B
	cmp r13, 0
	je L_1728
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r13,rbx
	add r13,rdx
	mov rbx,r13
	mov rax,  [gbl+8*33]
	mov r13,rax
	lea r13,[r13+rbx*8+8H]
	mov [r13],r10
	mov rdx,  [gbl+8*38]
	mov r13,rdx
	lea r13,[r13+rbx*8+8H]
	mov [r13],r15
	mov rax,  [gbl+8*46]
	mov rdx,1
	mov r13,rax
	add r13,rdx
	mov r14,r12
	lea r14,[r14+r10*8+8H]
	mov r14, [r14]
	lea r14,[r14+r15*8+8H]
	mov [r14],r13
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*22]
	cmp r10,rbx
	mov r13, 0
	sete r13B
	cmp r13, 0
	jne L_1729
	mov rbx,0
	mov r13,rbx
	jmp L_1730
	
L_1729:
	cmp r15,r9
	mov r13, 0
	sete r13B
	mov r13,r13
	
L_1730:
	cmp r13, 0
	je L_1731
	mov rbx,1
	mov r11,rbx
	
L_1731:
	
L_1728:
	
L_1727:
	mov rbx,0
	mov r13,rbx
	mov r13,r13
	mov rdx,  [gbl+8*37]
	mov rax,1
	mov r13,rdx
	add r13,rax
	mov rax,  [gbl+8*42]
	mov rbx,2
	mov r10,rax
	sub r10,rbx
	mov rsi,r10
	mov rdi,r13
	mov r10,rdi
	mov r15,rsi
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r10
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1734
	mov rbx,0
	mov r13,rbx
	jmp L_1735
	
L_1734:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1735:
	mov r13,r13
	mov r13,r13
	cmp r13, 0
	jne L_1738
	mov rbx,0
	mov r13,rbx
	jmp L_1739
	
L_1738:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r15
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1740
	mov rbx,0
	mov r13,rbx
	jmp L_1741
	
L_1740:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1741:
	mov r13,r13
	mov r13,r13
	mov r13,r13
	
L_1739:
	cmp r13, 0
	je L_1744
	mov r13,r12
	lea r13,[r13+r10*8+8H]
	mov r13, [r13]
	lea r13,[r13+r15*8+8H]
	mov r14, [r13]
	mov rbx,1
	mov r13,rbx
	neg r13
	cmp r14,r13
	mov r13, 0
	sete r13B
	cmp r13, 0
	je L_1745
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r13,rbx
	add r13,rdx
	mov rbx,r13
	mov rax,  [gbl+8*33]
	mov r13,rax
	lea r13,[r13+rbx*8+8H]
	mov [r13],r10
	mov rdx,  [gbl+8*38]
	mov r13,rdx
	lea r13,[r13+rbx*8+8H]
	mov [r13],r15
	mov rax,  [gbl+8*46]
	mov rdx,1
	mov r13,rax
	add r13,rdx
	mov r14,r12
	lea r14,[r14+r10*8+8H]
	mov r14, [r14]
	lea r14,[r14+r15*8+8H]
	mov [r14],r13
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*22]
	cmp r10,rbx
	mov r13, 0
	sete r13B
	cmp r13, 0
	jne L_1746
	mov rbx,0
	mov r13,rbx
	jmp L_1747
	
L_1746:
	cmp r15,r9
	mov r13, 0
	sete r13B
	mov r13,r13
	
L_1747:
	cmp r13, 0
	je L_1748
	mov rbx,1
	mov r11,rbx
	
L_1748:
	
L_1745:
	
L_1744:
	mov rbx,0
	mov r13,rbx
	mov r13,r13
	mov rdx,  [gbl+8*37]
	mov rax,1
	mov r13,rdx
	add r13,rax
	mov rax,  [gbl+8*42]
	mov rbx,2
	mov r15,rax
	add r15,rbx
	mov rsi,r15
	mov rdi,r13
	mov r10,rdi
	mov r15,rsi
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r10
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1751
	mov rbx,0
	mov r13,rbx
	jmp L_1752
	
L_1751:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1752:
	mov r13,r13
	mov r13,r13
	cmp r13, 0
	jne L_1755
	mov rbx,0
	mov r13,rbx
	jmp L_1756
	
L_1755:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r15
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1757
	mov rbx,0
	mov r13,rbx
	jmp L_1758
	
L_1757:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1758:
	mov r13,r13
	mov r13,r13
	mov r13,r13
	
L_1756:
	cmp r13, 0
	je L_1761
	mov r13,r12
	lea r13,[r13+r10*8+8H]
	mov r13, [r13]
	lea r13,[r13+r15*8+8H]
	mov r14, [r13]
	mov rbx,1
	mov r13,rbx
	neg r13
	cmp r14,r13
	mov r13, 0
	sete r13B
	cmp r13, 0
	je L_1762
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r13,rbx
	add r13,rdx
	mov rbx,r13
	mov rax,  [gbl+8*33]
	mov r13,rax
	lea r13,[r13+rbx*8+8H]
	mov [r13],r10
	mov rdx,  [gbl+8*38]
	mov r13,rdx
	lea r13,[r13+rbx*8+8H]
	mov [r13],r15
	mov rax,  [gbl+8*46]
	mov rdx,1
	mov r13,rax
	add r13,rdx
	mov r14,r12
	lea r14,[r14+r10*8+8H]
	mov r14, [r14]
	lea r14,[r14+r15*8+8H]
	mov [r14],r13
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*22]
	cmp r10,rbx
	mov r13, 0
	sete r13B
	cmp r13, 0
	jne L_1763
	mov rbx,0
	mov r13,rbx
	jmp L_1764
	
L_1763:
	cmp r15,r9
	mov r13, 0
	sete r13B
	mov r13,r13
	
L_1764:
	cmp r13, 0
	je L_1765
	mov rbx,1
	mov r11,rbx
	
L_1765:
	
L_1762:
	
L_1761:
	mov rbx,0
	mov r13,rbx
	mov r15,r13
	mov rdx,  [gbl+8*37]
	mov rax,2
	mov r14,rdx
	sub r14,rax
	mov rax,  [gbl+8*42]
	mov rbx,1
	mov r15,rax
	sub r15,rbx
	mov rsi,r15
	mov rdi,r14
	mov r10,rdi
	mov r15,rsi
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r10
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1768
	mov rbx,0
	mov r13,rbx
	jmp L_1769
	
L_1768:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1769:
	mov r13,r13
	mov r13,r13
	cmp r13, 0
	jne L_1772
	mov rbx,0
	mov r13,rbx
	jmp L_1773
	
L_1772:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r15
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1774
	mov rbx,0
	mov r13,rbx
	jmp L_1775
	
L_1774:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1775:
	mov r13,r13
	mov r13,r13
	mov r13,r13
	
L_1773:
	cmp r13, 0
	je L_1778
	mov r13,r12
	lea r13,[r13+r10*8+8H]
	mov r13, [r13]
	lea r13,[r13+r15*8+8H]
	mov r14, [r13]
	mov rbx,1
	mov r13,rbx
	neg r13
	cmp r14,r13
	mov r13, 0
	sete r13B
	cmp r13, 0
	je L_1779
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r13,rbx
	add r13,rdx
	mov rbx,r13
	mov rax,  [gbl+8*33]
	mov r13,rax
	lea r13,[r13+rbx*8+8H]
	mov [r13],r10
	mov rdx,  [gbl+8*38]
	mov r13,rdx
	lea r13,[r13+rbx*8+8H]
	mov [r13],r15
	mov rax,  [gbl+8*46]
	mov rdx,1
	mov r13,rax
	add r13,rdx
	mov r14,r12
	lea r14,[r14+r10*8+8H]
	mov r14, [r14]
	lea r14,[r14+r15*8+8H]
	mov [r14],r13
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*22]
	cmp r10,rbx
	mov r13, 0
	sete r13B
	cmp r13, 0
	jne L_1780
	mov rbx,0
	mov r13,rbx
	jmp L_1781
	
L_1780:
	cmp r15,r9
	mov r13, 0
	sete r13B
	mov r13,r13
	
L_1781:
	cmp r13, 0
	je L_1782
	mov rbx,1
	mov r11,rbx
	
L_1782:
	
L_1779:
	
L_1778:
	mov rbx,0
	mov r13,rbx
	mov r15,r13
	mov rdx,  [gbl+8*37]
	mov rax,2
	mov r15,rdx
	sub r15,rax
	mov rax,  [gbl+8*42]
	mov rbx,1
	mov r13,rax
	add r13,rbx
	mov rsi,r13
	mov rdi,r15
	mov r10,rdi
	mov r15,rsi
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r10
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1785
	mov rbx,0
	mov r13,rbx
	jmp L_1786
	
L_1785:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1786:
	mov r13,r13
	mov r13,r13
	cmp r13, 0
	jne L_1789
	mov rbx,0
	mov r13,rbx
	jmp L_1790
	
L_1789:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r15
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1791
	mov rbx,0
	mov r13,rbx
	jmp L_1792
	
L_1791:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1792:
	mov r13,r13
	mov r13,r13
	mov r13,r13
	
L_1790:
	cmp r13, 0
	je L_1795
	mov r13,r12
	lea r13,[r13+r10*8+8H]
	mov r13, [r13]
	lea r13,[r13+r15*8+8H]
	mov r14, [r13]
	mov rbx,1
	mov r13,rbx
	neg r13
	cmp r14,r13
	mov r13, 0
	sete r13B
	cmp r13, 0
	je L_1796
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r13,rbx
	add r13,rdx
	mov rbx,r13
	mov rax,  [gbl+8*33]
	mov r13,rax
	lea r13,[r13+rbx*8+8H]
	mov [r13],r10
	mov rdx,  [gbl+8*38]
	mov r13,rdx
	lea r13,[r13+rbx*8+8H]
	mov [r13],r15
	mov rax,  [gbl+8*46]
	mov rdx,1
	mov r13,rax
	add r13,rdx
	mov r14,r12
	lea r14,[r14+r10*8+8H]
	mov r14, [r14]
	lea r14,[r14+r15*8+8H]
	mov [r14],r13
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*22]
	cmp r10,rbx
	mov r13, 0
	sete r13B
	cmp r13, 0
	jne L_1797
	mov rbx,0
	mov r13,rbx
	jmp L_1798
	
L_1797:
	cmp r15,r9
	mov r13, 0
	sete r13B
	mov r13,r13
	
L_1798:
	cmp r13, 0
	je L_1799
	mov rbx,1
	mov r11,rbx
	
L_1799:
	
L_1796:
	
L_1795:
	mov rbx,0
	mov r13,rbx
	mov r13,r13
	mov rdx,  [gbl+8*37]
	mov rax,2
	mov r13,rdx
	add r13,rax
	mov rax,  [gbl+8*42]
	mov rbx,1
	mov r10,rax
	sub r10,rbx
	mov rsi,r10
	mov rdi,r13
	mov r10,rdi
	mov r15,rsi
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r10
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1802
	mov rbx,0
	mov r13,rbx
	jmp L_1803
	
L_1802:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1803:
	mov r13,r13
	mov r13,r13
	cmp r13, 0
	jne L_1806
	mov rbx,0
	mov r13,rbx
	jmp L_1807
	
L_1806:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r15
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1808
	mov rbx,0
	mov r13,rbx
	jmp L_1809
	
L_1808:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1809:
	mov r13,r13
	mov r13,r13
	mov r13,r13
	
L_1807:
	cmp r13, 0
	je L_1812
	mov r13,r12
	lea r13,[r13+r10*8+8H]
	mov r13, [r13]
	lea r13,[r13+r15*8+8H]
	mov r14, [r13]
	mov rbx,1
	mov r13,rbx
	neg r13
	cmp r14,r13
	mov r13, 0
	sete r13B
	cmp r13, 0
	je L_1813
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r13,rbx
	add r13,rdx
	mov rbx,r13
	mov rax,  [gbl+8*33]
	mov r13,rax
	lea r13,[r13+rbx*8+8H]
	mov [r13],r10
	mov rdx,  [gbl+8*38]
	mov r13,rdx
	lea r13,[r13+rbx*8+8H]
	mov [r13],r15
	mov rax,  [gbl+8*46]
	mov rdx,1
	mov r13,rax
	add r13,rdx
	mov r14,r12
	lea r14,[r14+r10*8+8H]
	mov r14, [r14]
	lea r14,[r14+r15*8+8H]
	mov [r14],r13
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*22]
	cmp r10,rbx
	mov r13, 0
	sete r13B
	cmp r13, 0
	jne L_1814
	mov rbx,0
	mov r13,rbx
	jmp L_1815
	
L_1814:
	cmp r15,r9
	mov r13, 0
	sete r13B
	mov r13,r13
	
L_1815:
	cmp r13, 0
	je L_1816
	mov rbx,1
	mov r11,rbx
	
L_1816:
	
L_1813:
	
L_1812:
	mov rbx,0
	mov r13,rbx
	mov r13,r13
	mov rdx,  [gbl+8*37]
	mov rax,2
	mov r13,rdx
	add r13,rax
	mov rdx,  [gbl+8*42]
	mov rax,1
	mov r10,rdx
	add r10,rax
	mov rsi,r10
	mov rdi,r13
	mov r10,rdi
	mov r15,rsi
	mov rdx,  [gbl+8*19]
	mov rsi,rdx
	mov rdi,r10
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1819
	mov rbx,0
	mov r13,rbx
	jmp L_1820
	
L_1819:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1820:
	mov r13,r13
	mov r13,r13
	cmp r13, 0
	jne L_1823
	mov rbx,0
	mov r13,rbx
	jmp L_1824
	
L_1823:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r15
	mov r14,rdi
	mov r13,rsi
	cmp r14,r13
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1825
	mov rbx,0
	mov r13,rbx
	jmp L_1826
	
L_1825:
	mov rbx,0
	cmp r14,rbx
	mov r13, 0
	setge r13B
	mov r13,r13
	
L_1826:
	mov r13,r13
	mov r13,r13
	mov r13,r13
	
L_1824:
	cmp r13, 0
	je L_1829
	mov r13,r12
	lea r13,[r13+r10*8+8H]
	mov r13, [r13]
	lea r13,[r13+r15*8+8H]
	mov r14, [r13]
	mov rbx,1
	mov r13,rbx
	neg r13
	cmp r14,r13
	mov r13, 0
	sete r13B
	cmp r13, 0
	je L_1830
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r13,rbx
	add r13,rdx
	mov rbx,r13
	mov rax,  [gbl+8*33]
	mov r13,rax
	lea r13,[r13+rbx*8+8H]
	mov [r13],r10
	mov rdx,  [gbl+8*38]
	mov r13,rdx
	lea r13,[r13+rbx*8+8H]
	mov [r13],r15
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*46]
	mov rax,1
	mov r13,rbx
	add r13,rax
	mov r14,r12
	lea r14,[r14+r10*8+8H]
	mov r14, [r14]
	lea r14,[r14+r15*8+8H]
	mov [r14],r13
	mov rbx,  [gbl+8*22]
	cmp r10,rbx
	mov r13, 0
	sete r13B
	cmp r13, 0
	jne L_1831
	mov rbx,0
	mov r13,rbx
	jmp L_1832
	
L_1831:
	cmp r15,r9
	mov r13, 0
	sete r13B
	mov r13,r13
	
L_1832:
	cmp r13, 0
	je L_1833
	mov rbx,1
	mov r11,rbx
	
L_1833:
	
L_1830:
	
L_1829:
	mov rbx,0
	mov r13,rbx
	mov r13,r13
	mov rdx,1
	cmp r11,rdx
	mov r13, 0
	sete r13B
	cmp r13, 0
	je L_1652
	jmp L_1650
	
L_1652:
	mov rbx,  [gbl+8*30]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rbx,r14
	mov qword [gbl+8*30],rbx
	jmp L_1649
	
L_1650:
	mov rbx,1
	cmp r11,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1653
	mov r15,r12
	mov rbx,  [gbl+8*22]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
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
	jmp L_1654
	
L_1653:
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
	
L_1654:
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

