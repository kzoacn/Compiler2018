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
	push r9
	push r8
	call global_init
	pop r8
	pop r9
	pop r15
	mov r15 , rax
	mov rbx,106
	mov rdi,rbx
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
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov     qword  r13, rax
	mov r12,r13
	mov rbx,0
	mov r14,rbx
	
L_38:
	cmp r14,r15
	mov r13, 0
	setl r13B
	cmp r13, 0
	je L_39
	mov     rdi,  r15
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
	mov     qword  r13, rax
	mov r10,r12
	lea r10,[r10+r14*8+8H]
	mov [r10],r13
	mov rbx,0
	mov r13,rbx
	
L_40:
	cmp r13,r15
	mov r10, 0
	setl r10B
	cmp r10, 0
	je L_41
	mov r10,r12
	lea r10,[r10+r14*8+8H]
	mov r10, [r10]
	lea r10,[r10+r13*8+8H]
	mov rbx,0
	mov [r10],rbx
	mov r10,r13
	mov rdx,1
	add r13,rdx
	jmp L_40
	
L_41:
	mov r13,r14
	mov rbx,1
	add r14,rbx
	jmp L_38
	
L_39:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rax,101
	mov rdx,rax
	mov rbx,1
	mov r15,rdx
	sub r15,rbx
	mov rbx,r15
	mov rax,rbx
	mov qword [gbl+8*19],rdx
	mov rdx,0
	mov r14,rdx
	mov qword [gbl+8*21],rbx
	mov qword [gbl+8*22],rax
	
L_18:
	mov rbx,  [gbl+8*19]
	cmp r14,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_19
	mov rbx,0
	mov r13,rbx
	
L_21:
	mov rbx,  [gbl+8*19]
	cmp r13,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_22
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
	jmp L_21
	
L_22:
	mov r15,r14
	mov rbx,1
	add r14,rbx
	jmp L_18
	
L_19:
	
L_24:
	cmp r8,r9
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_25
	mov rbx,  [gbl+8*33]
	mov r13,rbx
	lea r15,[r13+r8*8+8H]
	mov r15, [r15]
	mov rdx,r15
	mov rax,  [gbl+8*38]
	mov r13,rax
	lea r15,[r13+r8*8+8H]
	mov r13, [r15]
	mov rbx,r13
	mov r13,r12
	lea r13,[r13+rdx*8+8H]
	mov r13, [r13]
	lea r13,[r13+rbx*8+8H]
	mov r15, [r13]
	mov r13,r15
	mov rax,1
	mov r15,rdx
	sub r15,rax
	mov rax,2
	mov r10,rbx
	sub r10,rax
	mov rsi,r10
	mov rdi,r15
	mov r10,rdi
	mov r11,rsi
	mov rax,  [gbl+8*19]
	mov rsi,rax
	mov rdi,r10
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [gbl+8*42],rbx
	mov qword [gbl+8*37],rdx
	jne L_75
	mov rbx,0
	mov r15,rbx
	jmp L_76
	
L_75:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_76:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_79
	mov rbx,0
	mov r15,rbx
	jmp L_80
	
L_79:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r11
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_81
	mov rbx,0
	mov r15,rbx
	jmp L_82
	
L_81:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_82:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_80:
	cmp r15, 0
	je L_85
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	mov rbx,1
	mov r14,rbx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_86
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r9*8+8H]
	mov [r15],r10
	mov rax,  [gbl+8*38]
	mov r15,rax
	lea r15,[r15+r9*8+8H]
	mov [r15],r11
	mov rbx,1
	mov r14,r13
	add r14,rbx
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov [r15],r14
	mov rdx,  [gbl+8*22]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_87
	mov rbx,0
	mov r15,rbx
	jmp L_88
	
L_87:
	mov rbx,  [gbl+8*21]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_88:
	cmp r15, 0
	je L_89
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_89:
	
L_86:
	
L_85:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,  [gbl+8*37]
	mov rax,1
	mov r15,rdx
	sub r15,rax
	mov rax,  [gbl+8*42]
	mov rbx,2
	mov r10,rax
	add r10,rbx
	mov rsi,r10
	mov rdi,r15
	mov r10,rdi
	mov r11,rsi
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r10
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_92
	mov rbx,0
	mov r15,rbx
	jmp L_93
	
L_92:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_93:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_96
	mov rbx,0
	mov r15,rbx
	jmp L_97
	
L_96:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r11
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_98
	mov rbx,0
	mov r15,rbx
	jmp L_99
	
L_98:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_99:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_97:
	cmp r15, 0
	je L_102
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	mov rbx,1
	mov r14,rbx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_103
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r9*8+8H]
	mov [r15],r10
	mov rax,  [gbl+8*38]
	mov r15,rax
	lea r15,[r15+r9*8+8H]
	mov [r15],r11
	mov rbx,1
	mov r14,r13
	add r14,rbx
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov [r15],r14
	mov rdx,  [gbl+8*22]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_104
	mov rbx,0
	mov r15,rbx
	jmp L_105
	
L_104:
	mov rbx,  [gbl+8*21]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_105:
	cmp r15, 0
	je L_106
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_106:
	
L_103:
	
L_102:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,  [gbl+8*37]
	mov rax,1
	mov r15,rdx
	add r15,rax
	mov rax,  [gbl+8*42]
	mov rbx,2
	mov r10,rax
	sub r10,rbx
	mov rsi,r10
	mov rdi,r15
	mov r10,rdi
	mov r11,rsi
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r10
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_109
	mov rbx,0
	mov r15,rbx
	jmp L_110
	
L_109:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_110:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_113
	mov rbx,0
	mov r15,rbx
	jmp L_114
	
L_113:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r11
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_115
	mov rbx,0
	mov r15,rbx
	jmp L_116
	
L_115:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_116:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_114:
	cmp r15, 0
	je L_119
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	mov rbx,1
	mov r14,rbx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_120
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r9*8+8H]
	mov [r15],r10
	mov rax,  [gbl+8*38]
	mov r15,rax
	lea r15,[r15+r9*8+8H]
	mov [r15],r11
	mov rbx,1
	mov r14,r13
	add r14,rbx
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov [r15],r14
	mov rdx,  [gbl+8*22]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_121
	mov rbx,0
	mov r15,rbx
	jmp L_122
	
L_121:
	mov rbx,  [gbl+8*21]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_122:
	cmp r15, 0
	je L_123
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_123:
	
L_120:
	
L_119:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,  [gbl+8*37]
	mov rax,1
	mov r15,rdx
	add r15,rax
	mov rax,  [gbl+8*42]
	mov rbx,2
	mov r14,rax
	add r14,rbx
	mov rsi,r14
	mov rdi,r15
	mov r10,rdi
	mov r11,rsi
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r10
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_126
	mov rbx,0
	mov r15,rbx
	jmp L_127
	
L_126:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_127:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_130
	mov rbx,0
	mov r15,rbx
	jmp L_131
	
L_130:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r11
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_132
	mov rbx,0
	mov r15,rbx
	jmp L_133
	
L_132:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_133:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_131:
	cmp r15, 0
	je L_136
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	mov rbx,1
	mov r14,rbx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_137
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r9*8+8H]
	mov [r15],r10
	mov rax,  [gbl+8*38]
	mov r15,rax
	lea r15,[r15+r9*8+8H]
	mov [r15],r11
	mov rbx,1
	mov r14,r13
	add r14,rbx
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov [r15],r14
	mov rdx,  [gbl+8*22]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_138
	mov rbx,0
	mov r15,rbx
	jmp L_139
	
L_138:
	mov rbx,  [gbl+8*21]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_139:
	cmp r15, 0
	je L_140
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_140:
	
L_137:
	
L_136:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,  [gbl+8*37]
	mov rax,2
	mov r15,rdx
	sub r15,rax
	mov rax,  [gbl+8*42]
	mov rbx,1
	mov r14,rax
	sub r14,rbx
	mov rsi,r14
	mov rdi,r15
	mov r10,rdi
	mov r11,rsi
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r10
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_143
	mov rbx,0
	mov r15,rbx
	jmp L_144
	
L_143:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_144:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_147
	mov rbx,0
	mov r15,rbx
	jmp L_148
	
L_147:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r11
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_149
	mov rbx,0
	mov r15,rbx
	jmp L_150
	
L_149:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_150:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_148:
	cmp r15, 0
	je L_153
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	mov rbx,1
	mov r14,rbx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_154
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r9*8+8H]
	mov [r15],r10
	mov rax,  [gbl+8*38]
	mov r15,rax
	lea r15,[r15+r9*8+8H]
	mov [r15],r11
	mov rbx,1
	mov r14,r13
	add r14,rbx
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov [r15],r14
	mov rdx,  [gbl+8*22]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_155
	mov rbx,0
	mov r15,rbx
	jmp L_156
	
L_155:
	mov rbx,  [gbl+8*21]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_156:
	cmp r15, 0
	je L_157
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_157:
	
L_154:
	
L_153:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,  [gbl+8*37]
	mov rax,2
	mov r15,rdx
	sub r15,rax
	mov rax,  [gbl+8*42]
	mov rbx,1
	mov r10,rax
	add r10,rbx
	mov rsi,r10
	mov rdi,r15
	mov r10,rdi
	mov r11,rsi
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r10
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_160
	mov rbx,0
	mov r15,rbx
	jmp L_161
	
L_160:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_161:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_164
	mov rbx,0
	mov r15,rbx
	jmp L_165
	
L_164:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r11
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_166
	mov rbx,0
	mov r15,rbx
	jmp L_167
	
L_166:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_167:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_165:
	cmp r15, 0
	je L_170
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	mov rbx,1
	mov r14,rbx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_171
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r9*8+8H]
	mov [r15],r10
	mov rax,  [gbl+8*38]
	mov r15,rax
	lea r15,[r15+r9*8+8H]
	mov [r15],r11
	mov rbx,1
	mov r14,r13
	add r14,rbx
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov [r15],r14
	mov rdx,  [gbl+8*22]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_172
	mov rbx,0
	mov r15,rbx
	jmp L_173
	
L_172:
	mov rbx,  [gbl+8*21]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_173:
	cmp r15, 0
	je L_174
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_174:
	
L_171:
	
L_170:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,  [gbl+8*37]
	mov rax,2
	mov r10,rdx
	add r10,rax
	mov rax,  [gbl+8*42]
	mov rbx,1
	mov r15,rax
	sub r15,rbx
	mov rsi,r15
	mov rdi,r10
	mov r10,rdi
	mov r11,rsi
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r10
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_177
	mov rbx,0
	mov r15,rbx
	jmp L_178
	
L_177:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_178:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_181
	mov rbx,0
	mov r15,rbx
	jmp L_182
	
L_181:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r11
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_183
	mov rbx,0
	mov r15,rbx
	jmp L_184
	
L_183:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_184:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_182:
	cmp r15, 0
	je L_187
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	mov rbx,1
	mov r14,rbx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_188
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r9*8+8H]
	mov [r15],r10
	mov rax,  [gbl+8*38]
	mov r15,rax
	lea r15,[r15+r9*8+8H]
	mov [r15],r11
	mov rbx,1
	mov r14,r13
	add r14,rbx
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov [r15],r14
	mov rdx,  [gbl+8*22]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_189
	mov rbx,0
	mov r15,rbx
	jmp L_190
	
L_189:
	mov rbx,  [gbl+8*21]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_190:
	cmp r15, 0
	je L_191
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_191:
	
L_188:
	
L_187:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,  [gbl+8*37]
	mov rax,2
	mov r15,rdx
	add r15,rax
	mov rdx,  [gbl+8*42]
	mov rax,1
	mov r10,rdx
	add r10,rax
	mov rsi,r10
	mov rdi,r15
	mov r10,rdi
	mov r11,rsi
	mov rdx,  [gbl+8*19]
	mov rsi,rdx
	mov rdi,r10
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_194
	mov rbx,0
	mov r15,rbx
	jmp L_195
	
L_194:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_195:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_198
	mov rbx,0
	mov r15,rbx
	jmp L_199
	
L_198:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,r11
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_200
	mov rbx,0
	mov r15,rbx
	jmp L_201
	
L_200:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_201:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_199:
	cmp r15, 0
	je L_204
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	mov rbx,1
	mov r14,rbx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_205
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r9*8+8H]
	mov [r15],r10
	mov rax,  [gbl+8*38]
	mov r15,rax
	lea r15,[r15+r9*8+8H]
	mov [r15],r11
	mov rbx,1
	mov r14,r13
	add r14,rbx
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov [r15],r14
	mov rbx,  [gbl+8*22]
	cmp r10,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_206
	mov rbx,0
	mov r15,rbx
	jmp L_207
	
L_206:
	mov rbx,  [gbl+8*21]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_207:
	cmp r15, 0
	je L_208
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_208:
	
L_205:
	
L_204:
	mov rbx,0
	mov r15,rbx
	mov r13,r15
	mov rdx,  [gbl+8*75]
	mov rax,1
	cmp rdx,rax
	mov r13, 0
	sete r13B
	cmp r13, 0
	je L_27
	jmp L_25
	
L_27:
	mov rbx,1
	mov r13,r8
	add r13,rbx
	mov r8,r13
	jmp L_24
	
L_25:
	mov rbx,  [gbl+8*75]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_28
	mov r15,r12
	mov rbx,  [gbl+8*22]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rdx,  [gbl+8*21]
	lea r15,[r15+rdx*8+8H]
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
	jmp L_29
	
L_28:
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
	
L_29:
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

