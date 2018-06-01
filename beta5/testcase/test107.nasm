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


dfs:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1360
	mov r13,rdi
	cmp r13,r9
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_334
	mov rbx,0
	mov r13,rbx
	
L_426:
	cmp r13,r10
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_427
	mov rbx,0
	mov r11,rbx
	mov rdx,0
	mov r12,rdx
	
L_428:
	mov rbx,3
	cmp r12,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_429
	mov rbx,  [gbl+8*11]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	mov r14,r15
	cmp r14,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_430
	mov rbx,0
	mov r15,rbx
	jmp L_431
	
L_430:
	mov rbx,  [gbl+8*17]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	mov rdx,1
	cmp r15,rdx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_431:
	cmp r15, 0
	je L_432
	mov rbx,1
	mov r11,rbx
	
L_432:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_433
	mov rbx,0
	mov r15,rbx
	jmp L_434
	
L_433:
	mov r15,r14
	neg r15
	mov rbx,  [gbl+8*17]
	mov r14,rbx
	lea r15,[r14+r15*8+8H]
	mov r15, [r15]
	mov rdx,0
	cmp r15,rdx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_434:
	cmp r15, 0
	je L_435
	mov rbx,1
	mov r11,rbx
	
L_435:
	mov rbx,1
	add r12,rbx
	jmp L_428
	
L_429:
	mov rbx,0
	cmp r11,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_437
	mov rbx,0
	mov r15,rbx
	jmp L_439
	
L_437:
	mov rbx,1
	add r13,rbx
	jmp L_426
	
L_427:
	mov rbx,1
	mov r15,rbx
	
L_439:
	mov r15,r15
	mov rbx,1
	cmp r15,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_336
	mov rbx,t185
	mov rdi,rbx
	mov r14,rdi
	mov rdx,0
	mov r12,rdx
	
L_354:
	mov r15,r14
	mov rbx,r15
	mov rdx,rbx
	mov rdx, [rdx]
	mov rax,255
	and rdx,rax
	cmp r12,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [arg+8*63],rbx
	mov qword [rsp+8*36],rdx
	je L_355
	mov rbx,r14
	mov rdi,r12
	mov rdx,rbx
	mov qword [rsp+8*38],rbx
	mov qword [arg+8*63],rdx
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    ord
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,  [gbl+8*40]
	add r15,rbx
	mov rbx,r15
	mov rdx,1
	add r12,rdx
	mov qword [gbl+8*40],rbx
	jmp L_354
	
L_355:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,0
	mov rdi,rdx
	push r15
	push r9
	push r8
	call print_cond
	pop r8
	pop r9
	pop r15
	mov r15 , rax
	mov rbx,t191
	mov rdi,rbx
	mov r14,rdi
	mov rdx,0
	mov r12,rdx
	
L_359:
	mov r15,r14
	mov rbx,r15
	mov rdx,rbx
	mov rdx, [rdx]
	mov rax,255
	and rdx,rax
	cmp r12,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [arg+8*63],rbx
	mov qword [rsp+8*36],rdx
	je L_360
	mov rbx,r14
	mov rdi,r12
	mov rdx,rbx
	mov qword [rsp+8*38],rbx
	mov qword [arg+8*63],rdx
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    ord
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,  [gbl+8*40]
	add r15,rbx
	mov rbx,r15
	mov rdx,1
	add r12,rdx
	mov qword [gbl+8*40],rbx
	jmp L_359
	
L_360:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	
L_336:
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
L_334:
	mov rbx,1
	mov r14,r13
	add r14,rbx
	mov rdx,  [gbl+8*17]
	mov r15,rdx
	lea r15,[r15+r14*8+8H]
	mov rax,1
	mov [r15],rax
	mov rbx,1
	mov r15,r13
	add r15,rbx
	mov rdi,r15
	push r15
	push r13
	push r10
	push r9
	push r8
	call dfs
	pop r8
	pop r9
	pop r10
	pop r13
	pop r15
	mov r15 , rax
	mov rbx,1
	mov r15,r13
	add r15,rbx
	mov rdx,  [gbl+8*17]
	mov r14,rdx
	lea r15,[r14+r15*8+8H]
	mov rax,0
	mov [r15],rax
	mov rbx,1
	mov r15,r13
	add r15,rbx
	mov rdi,r15
	push r15
	push r10
	push r9
	push r8
	call dfs
	pop r8
	pop r9
	pop r10
	pop r15
	mov r15 , rax
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
print_last_cond:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1360
	mov r13,rdi
	cmp r13,r9
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_338
	mov rbx,t215
	mov rdi,rbx
	mov r14,rdi
	mov rdx,0
	mov r12,rdx
	
L_364:
	mov r15,r14
	mov rbx,r15
	mov rdx,rbx
	mov rdx, [rdx]
	mov rax,255
	and rdx,rax
	cmp r12,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [arg+8*63],rbx
	mov qword [rsp+8*36],rdx
	je L_365
	mov rbx,r14
	mov rdi,r12
	mov rdx,rbx
	mov qword [rsp+8*38],rbx
	mov qword [arg+8*63],rdx
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    ord
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,  [gbl+8*40]
	add r15,rbx
	mov rbx,r15
	mov rdx,1
	add r12,rdx
	mov qword [gbl+8*40],rbx
	jmp L_364
	
L_365:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rax,1
	mov rdx,rax
	mov rax,0
	mov r13,rax
	mov qword [rsp+8*59],rdx
	
L_339:
	cmp r13,r9
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_340
	mov rbx,1
	mov r15,r13
	add r15,rbx
	mov rdx,  [gbl+8*17]
	mov r14,rdx
	lea r15,[r14+r15*8+8H]
	mov r15, [r15]
	mov rax,1
	cmp r15,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_343
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*59],rbx
	
L_343:
	mov rbx,1
	mov r15,r13
	add r15,rbx
	mov rdx,  [gbl+8*17]
	mov r14,rdx
	lea r15,[r14+r15*8+8H]
	mov r15, [r15]
	mov rdi,r15
	mov r15,rdi
	mov     rdi,  r15
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword r15, rax
	mov rdi,r15
	mov r14,rdi
	mov rbx,0
	mov r12,rbx
	
L_369:
	mov r15,r14
	mov rbx,r15
	mov rdx,rbx
	mov rdx, [rdx]
	mov rax,255
	and rdx,rax
	cmp r12,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [arg+8*63],rbx
	mov qword [rsp+8*36],rdx
	je L_370
	mov rbx,r14
	mov rdi,r12
	mov rdx,rbx
	mov qword [rsp+8*38],rbx
	mov qword [arg+8*63],rdx
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    ord
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,  [gbl+8*40]
	add r15,rbx
	mov rbx,r15
	mov rdx,1
	add r12,rdx
	mov qword [gbl+8*40],rbx
	jmp L_369
	
L_370:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,1
	add r13,rdx
	jmp L_339
	
L_340:
	mov rbx,  [rsp+8*59]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_344
	mov rbx,t242
	mov rdi,rbx
	mov r14,rdi
	mov rdx,0
	mov r12,rdx
	
L_374:
	mov r15,r14
	mov rbx,r15
	mov rdx,rbx
	mov rdx, [rdx]
	mov rax,255
	and rdx,rax
	cmp r12,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [arg+8*63],rbx
	mov qword [rsp+8*36],rdx
	je L_375
	mov rbx,r14
	mov rdi,r12
	mov rdx,rbx
	mov qword [rsp+8*38],rbx
	mov qword [arg+8*63],rdx
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    ord
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,  [gbl+8*40]
	add r15,rbx
	mov rbx,r15
	mov rdx,1
	add r12,rdx
	mov qword [gbl+8*40],rbx
	jmp L_374
	
L_375:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	jmp L_345
	
L_344:
	mov rbx,t245
	mov rdi,rbx
	mov r14,rdi
	mov rdx,0
	mov r12,rdx
	
L_379:
	mov r15,r14
	mov rbx,r15
	mov rdx,rbx
	mov rdx, [rdx]
	mov rax,255
	and rdx,rax
	cmp r12,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [arg+8*63],rbx
	mov qword [rsp+8*36],rdx
	je L_380
	mov rbx,r14
	mov rdi,r12
	mov rdx,rbx
	mov qword [rsp+8*38],rbx
	mov qword [arg+8*63],rdx
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    ord
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,  [gbl+8*40]
	add r15,rbx
	mov rbx,r15
	mov rdx,1
	add r12,rdx
	mov qword [gbl+8*40],rbx
	jmp L_379
	
L_380:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	
L_345:
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
L_338:
	mov rbx,1
	mov r14,r13
	add r14,rbx
	mov rdx,  [gbl+8*17]
	mov r15,rdx
	lea r15,[r15+r14*8+8H]
	mov rax,1
	mov [r15],rax
	mov rbx,1
	mov r15,r13
	add r15,rbx
	mov rdi,r15
	push r15
	push r13
	push r9
	call print_last_cond
	pop r9
	pop r13
	pop r15
	mov r15 , rax
	mov rbx,1
	mov r15,r13
	add r15,rbx
	mov rdx,  [gbl+8*17]
	mov r14,rdx
	lea r15,[r14+r15*8+8H]
	mov rax,0
	mov [r15],rax
	mov rbx,1
	mov r15,r13
	add r15,rbx
	mov rdi,r15
	push r15
	push r9
	call print_last_cond
	pop r9
	pop r15
	mov r15 , rax
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1360
	mov     rax, 936870912
        cdqe
        mov     rdi, rax
        call    malloc
	        mov rbx,0
	        mov rsi,0
	        mov rdi,0
	        mov rcx,0
	        mov rdx,0
			mov r8,0
			mov r9,0
			mov r10,0
			mov r11,0
			mov r12,0
			mov r13,0
			mov r14,0
			mov r15,0
        mov     edx, dword 936870912
        movsxd  rdx, edx
        sub     rdx, 3344
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rbx,5
	mov r15,rbx
	mov rdx,2
	mov r14,rdx
	imul r14,r15
	mov rax,1
	add r14,rax
	mov r9,r14
	mov r10,r15
	mov rbx,1
	mov r11,rbx
	mov rbx,t273
	mov rdi,rbx
	mov r14,rdi
	mov rbx,0
	mov r12,rbx
	
L_390:
	mov r15,r14
	mov rbx,r15
	mov rdx,rbx
	mov rdx, [rdx]
	mov rax,255
	and rdx,rax
	cmp r12,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [arg+8*63],rbx
	mov qword [rsp+8*36],rdx
	je L_391
	mov rbx,r14
	mov rdi,r12
	mov rdx,rbx
	mov qword [rsp+8*38],rbx
	mov qword [arg+8*63],rdx
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    ord
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,  [gbl+8*40]
	add r15,rbx
	mov rbx,r15
	mov rdx,1
	add r12,rdx
	mov qword [gbl+8*40],rbx
	jmp L_390
	
L_391:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov     rdi,  r10
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,r15
	mov rdx,0
	mov r13,rdx
	mov qword [gbl+8*11],rbx
	
L_346:
	cmp r13,r10
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_347
	mov     rdi, 3
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov r14,r15
	mov r15,r14
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov [r15],r11
	mov rdx,1
	mov r12,r11
	add r12,rdx
	mov r15,r14
	mov rax,1
	lea r15,[r15+rax*8+8H]
	mov [r15],r12
	mov rbx,2
	mov r15,r11
	add r15,rbx
	mov r12,r15
	neg r12
	mov r15,r14
	mov rbx,2
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rbx,2
	mov r15,r11
	add r15,rbx
	mov r11,r15
	mov rbx,  [gbl+8*11]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov rbx,1
	add r13,rbx
	jmp L_346
	
L_347:
	mov rbx,1
	mov r15,r9
	add r15,rbx
	mov     rdi,  r15
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,r15
	mov rdx,1
	mov r15,r9
	add r15,rdx
	mov qword [gbl+8*17],rbx
	mov     rdi,  r15
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov r8,r15
	mov rbx,0
	mov rdi,rbx
	push r15
	push r10
	push r9
	push r8
	call dfs
	pop r8
	pop r9
	pop r10
	pop r15
	mov r15 , rax
	mov rbx,0
	mov rdi,rbx
	push r15
	push r9
	call print_last_cond
	pop r9
	pop r15
	mov r15 , rax
	mov rbx,  [gbl+8*40]
	mov rdi,rbx
	mov r15,rdi
	mov     rdi,  r15
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, r15 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
print_cond:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1360
	mov r13,rdi
	cmp r13,r9
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_327
	mov rbx,  [gbl+8*17]
	mov rsi,rbx
	mov rdi,r8
	mov r14,rdi
	mov r13,rsi
	mov rdx,0
	mov r12,rdx
	mov rax,0
	mov r11,rax
	
L_410:
	mov rbx,3
	cmp r11,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_411
	mov r15,r14
	lea r15,[r15+r11*8+8H]
	mov r10, [r15]
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	cmp r10,r15
	mov r15, 0
	setne r15B
	cmp r15, 0
	je L_412
	mov r15,r12
	mov rbx,1
	add r12,rbx
	
L_412:
	mov rbx,1
	add r11,rbx
	jmp L_410
	
L_411:
	mov r15,r12
	mov r15,r15
	mov rdi,r15
	mov r15,rdi
	mov     rdi,  r15
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword r15, rax
	mov     rsi,  r15
	mov     rdi, t133
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	mov     rsi, t140
	mov     rdi,  r15
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	mov rdi,r15
	mov r14,rdi
	mov rbx,0
	mov r12,rbx
	
L_416:
	mov r15,r14
	mov rbx,r15
	mov rdx,rbx
	mov rdx, [rdx]
	mov rax,255
	and rdx,rax
	cmp r12,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [arg+8*63],rbx
	mov qword [rsp+8*36],rdx
	je L_417
	mov rbx,r14
	mov rdi,r12
	mov rdx,rbx
	mov qword [rsp+8*38],rbx
	mov qword [arg+8*63],rdx
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    ord
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,  [gbl+8*40]
	add r15,rbx
	mov rbx,r15
	mov rdx,1
	add r12,rdx
	mov qword [gbl+8*40],rbx
	jmp L_416
	
L_417:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,0
	mov r13,rdx
	
L_328:
	cmp r13,r9
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_329
	xor rdx, rdx
	mov rax,  r13
	mov rbx, 10
	cdq
	idiv ebx
	mov  r15, rdx
	mov rbx,0
	cmp r15,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_332
	mov rbx,1
	mov r15,r13
	add r15,rbx
	mov r14,r8
	lea r15,[r14+r15*8+8H]
	mov r15, [r15]
	mov rdi,r15
	mov r15,rdi
	mov     rdi,  r15
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword r15, rax
	mov rdi,r15
	mov r14,rdi
	mov rbx,0
	mov r12,rbx
	
L_421:
	mov r15,r14
	mov rbx,r15
	mov rdx,rbx
	mov rdx, [rdx]
	mov rax,255
	and rdx,rax
	cmp r12,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [arg+8*63],rbx
	mov qword [rsp+8*36],rdx
	je L_422
	mov rbx,r14
	mov rdi,r12
	mov rdx,rbx
	mov qword [rsp+8*38],rbx
	mov qword [arg+8*63],rdx
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    ord
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,  [gbl+8*40]
	add r15,rbx
	mov rbx,r15
	mov rdx,1
	add r12,rdx
	mov qword [gbl+8*40],rbx
	jmp L_421
	
L_422:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	
L_332:
	mov rbx,1
	add r13,rbx
	jmp L_328
	
L_329:
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
L_327:
	mov rbx,1
	mov r14,r13
	add r14,rbx
	mov r15,r8
	lea r15,[r15+r14*8+8H]
	mov rdx,1
	mov [r15],rdx
	mov rax,1
	mov r15,r13
	add r15,rax
	mov rdi,r15
	push r15
	push r13
	push r9
	push r8
	call print_cond
	pop r8
	pop r9
	pop r13
	pop r15
	mov r15 , rax
	mov rbx,1
	mov r15,r13
	add r15,rbx
	mov r14,r8
	lea r15,[r14+r15*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov rax,1
	mov r15,r13
	add r15,rax
	mov rdi,r15
	push r15
	push r9
	push r8
	call print_cond
	pop r8
	pop r9
	pop r15
	mov r15 , rax
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1360
	mov rdx,0
	mov rbx,rdx
	mov qword [gbl+8*40],rbx
	mov rbx,  [rsp+8*162]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   3344
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

t191:
	 db 7," <= 0;",10,"" ,0

t215:
	 db 1,"x" ,0

t133:
	 db 2,"- " ,0

t242:
	 db 3," + " ,0

t245:
	 db 6," = 1;",10,"" ,0

t140:
	 db 2,"*x" ,0

t185:
	 db 3,"xz " ,0

t273:
	 db 9,"max: xz;",10,"" ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

