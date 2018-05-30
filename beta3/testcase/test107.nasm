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
	mov r10,rdi
	cmp r10,r15
	mov r9, 0
	sete r9B
	cmp r9, 0
	je L_336
	mov rbx,0
	mov r10,rbx
	
L_428:
	cmp r10,r12
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_429
	mov rbx,0
	mov r8,rbx
	mov rdx,0
	mov r9,rdx
	
L_430:
	mov rbx,3
	cmp r9,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*10],rdx
	je L_431
	mov rbx,r11
	lea rdx,[rbx+r10*8+8H]
	mov rbx, [rdx]
	lea rdx,[rbx+r9*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*12],rbx
	mov rbx,rax
	cmp rbx,0
	mov qword [rsp+8*13],rdx
	mov rdx, 0
	setg dl
	cmp rdx, 0
	mov qword [rsp+8*15],rbx
	mov qword [rsp+8*16],rdx
	mov qword [rsp+8*14],rax
	jne L_432
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*16],rbx
	jmp L_433
	
L_432:
	mov rbx,r14
	mov rdx,  [rsp+8*15]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*18],rbx
	mov rbx, [rax]
	mov qword [rsp+8*19],rax
	mov rax,1
	cmp rbx,rax
	mov rdx, 0
	sete dl
	mov qword [rsp+8*20],rbx
	mov rbx,rdx
	mov qword [rsp+8*16],rbx
	mov qword [rsp+8*21],rdx
	
L_433:
	mov rbx,  [rsp+8*16]
	cmp rbx, 0
	je L_434
	mov rbx,1
	mov r8,rbx
	
L_434:
	mov rbx,  [rsp+8*15]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*22],rax
	jne L_435
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*22],rbx
	jmp L_436
	
L_435:
	mov rbx,  [rsp+8*15]
	mov rdx,rbx
	neg rdx
	mov rax,r14
	lea rbx,[rax+rdx*8+8H]
	mov rdx, [rbx]
	mov qword [rsp+8*25],rbx
	mov rbx,0
	cmp rdx,rbx
	mov qword [rsp+8*24],rax
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*22],rbx
	mov qword [rsp+8*26],rdx
	mov qword [rsp+8*27],rax
	
L_436:
	mov rbx,  [rsp+8*22]
	cmp rbx, 0
	je L_437
	mov rbx,1
	mov r8,rbx
	
L_437:
	mov rbx,1
	add r9,rbx
	jmp L_430
	
L_431:
	mov rbx,0
	cmp r8,rbx
	mov r9, 0
	sete r9B
	cmp r9, 0
	je L_439
	mov rbx,0
	mov r12,rbx
	jmp L_441
	
L_439:
	mov rbx,1
	add r10,rbx
	jmp L_428
	
L_429:
	mov rbx,1
	mov r12,rbx
	
L_441:
	mov r12,r12
	mov rbx,1
	cmp r12,rbx
	mov r12, 0
	sete r12B
	cmp r12, 0
	je L_338
	mov rbx,t185
	mov rdi,rbx
	mov r11,rdi
	mov rdx,0
	mov r10,rdx
	
L_356:
	mov r9,r11
	mov rbx,r9
	mov r9,rbx
	mov r9, [r9]
	mov rdx,255
	and r9,rdx
	cmp r10,r9
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [arg+8*63],rbx
	je L_357
	mov r9,r11
	mov rdi,r10
	mov rbx,r9
	mov qword [arg+8*63],rbx
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
	mov     qword  r9, rax
	mov rbx,  [gbl+8*40]
	add r9,rbx
	mov rbx,r9
	mov rdx,1
	add r10,rdx
	mov qword [gbl+8*40],rbx
	jmp L_356
	
L_357:
	mov rbx,0
	mov r11,rbx
	mov r12,r11
	mov rdx,0
	mov rdi,rdx
	push r15
	push r14
	push r13
	push r12
	call print_cond
	pop r12
	pop r13
	pop r14
	pop r15
	mov r12 , rax
	mov rbx,t191
	mov rdi,rbx
	mov r11,rdi
	mov rdx,0
	mov r10,rdx
	
L_361:
	mov r9,r11
	mov rbx,r9
	mov r9,rbx
	mov r9, [r9]
	mov rdx,255
	and r9,rdx
	cmp r10,r9
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [arg+8*63],rbx
	je L_362
	mov r9,r11
	mov rdi,r10
	mov rbx,r9
	mov qword [arg+8*63],rbx
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
	mov     qword  r9, rax
	mov rbx,  [gbl+8*40]
	add r9,rbx
	mov rbx,r9
	mov rdx,1
	add r10,rdx
	mov qword [gbl+8*40],rbx
	jmp L_361
	
L_362:
	mov rbx,0
	mov r11,rbx
	mov r15,r11
	
L_338:
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
L_336:
	mov rbx,1
	mov r8,r10
	add r8,rbx
	mov r9,r14
	lea r9,[r9+r8*8+8H]
	mov rdx,1
	mov [r9],rdx
	mov rax,1
	mov r9,r10
	add r9,rax
	mov rdi,r9
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	call dfs
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov r9 , rax
	mov rbx,1
	mov r9,r10
	add r9,rbx
	mov r8,r14
	lea r9,[r8+r9*8+8H]
	mov rdx,0
	mov [r9],rdx
	mov rax,1
	add r10,rax
	mov rdi,r10
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	call dfs
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov r10 , rax
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
print_last_cond:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1360
	mov r13,rdi
	cmp r13,r15
	mov r12, 0
	sete r12B
	cmp r12, 0
	je L_340
	mov rbx,t215
	mov rdi,rbx
	mov r11,rdi
	mov rdx,0
	mov r10,rdx
	
L_366:
	mov r9,r11
	mov rbx,r9
	mov r9,rbx
	mov r9, [r9]
	mov rdx,255
	and r9,rdx
	cmp r10,r9
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [arg+8*63],rbx
	je L_367
	mov r9,r11
	mov rdi,r10
	mov rbx,r9
	mov qword [arg+8*63],rbx
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
	mov     qword  r9, rax
	mov rbx,  [gbl+8*40]
	add r9,rbx
	mov rbx,r9
	mov rdx,1
	add r10,rdx
	mov qword [gbl+8*40],rbx
	jmp L_366
	
L_367:
	mov rbx,0
	mov r11,rbx
	mov r13,r11
	mov rdx,1
	mov r12,rdx
	mov rax,0
	mov r13,rax
	
L_341:
	cmp r13,r15
	mov r11, 0
	setl r11B
	cmp r11, 0
	je L_342
	mov rbx,1
	mov r11,r13
	add r11,rbx
	mov r10,r14
	lea r11,[r10+r11*8+8H]
	mov r11, [r11]
	mov rdx,1
	cmp r11,rdx
	mov r11, 0
	sete r11B
	cmp r11, 0
	je L_345
	mov rbx,0
	mov r12,rbx
	
L_345:
	mov rbx,1
	mov r11,r13
	add r11,rbx
	mov r10,r14
	lea r11,[r10+r11*8+8H]
	mov r11, [r11]
	mov rdi,r11
	mov r11,rdi
	mov     rdi,  r11
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword r11, rax
	mov rdi,r11
	mov r11,rdi
	mov rbx,0
	mov r10,rbx
	
L_371:
	mov r9,r11
	mov rbx,r9
	mov r9,rbx
	mov r9, [r9]
	mov rdx,255
	and r9,rdx
	cmp r10,r9
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [arg+8*63],rbx
	je L_372
	mov r9,r11
	mov rdi,r10
	mov rbx,r9
	mov qword [arg+8*63],rbx
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
	mov     qword  r9, rax
	mov rbx,  [gbl+8*40]
	add r9,rbx
	mov rbx,r9
	mov rdx,1
	add r10,rdx
	mov qword [gbl+8*40],rbx
	jmp L_371
	
L_372:
	mov rbx,0
	mov r11,rbx
	mov r11,r11
	mov rdx,1
	add r13,rdx
	jmp L_341
	
L_342:
	mov rbx,0
	cmp r12,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_346
	mov rbx,t242
	mov rdi,rbx
	mov r11,rdi
	mov rdx,0
	mov r10,rdx
	
L_376:
	mov r9,r11
	mov rbx,r9
	mov r9,rbx
	mov r9, [r9]
	mov rdx,255
	and r9,rdx
	cmp r10,r9
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [arg+8*63],rbx
	je L_377
	mov r9,r11
	mov rdi,r10
	mov rbx,r9
	mov qword [arg+8*63],rbx
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
	mov     qword  r9, rax
	mov rbx,  [gbl+8*40]
	add r9,rbx
	mov rbx,r9
	mov rdx,1
	add r10,rdx
	mov qword [gbl+8*40],rbx
	jmp L_376
	
L_377:
	mov rbx,0
	mov r11,rbx
	mov r15,r11
	jmp L_347
	
L_346:
	mov rbx,t245
	mov rdi,rbx
	mov r11,rdi
	mov rdx,0
	mov r10,rdx
	
L_381:
	mov r9,r11
	mov rbx,r9
	mov r9,rbx
	mov r9, [r9]
	mov rdx,255
	and r9,rdx
	cmp r10,r9
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [arg+8*63],rbx
	je L_382
	mov r9,r11
	mov rdi,r10
	mov rbx,r9
	mov qword [arg+8*63],rbx
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
	mov     qword  r9, rax
	mov rbx,  [gbl+8*40]
	add r9,rbx
	mov rbx,r9
	mov rdx,1
	add r10,rdx
	mov qword [gbl+8*40],rbx
	jmp L_381
	
L_382:
	mov rbx,0
	mov r11,rbx
	mov r15,r11
	
L_347:
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
L_340:
	mov rbx,1
	mov r11,r13
	add r11,rbx
	mov r12,r14
	lea r12,[r12+r11*8+8H]
	mov rdx,1
	mov [r12],rdx
	mov rax,1
	mov r12,r13
	add r12,rax
	mov rdi,r12
	push r15
	push r14
	push r13
	push r12
	call print_last_cond
	pop r12
	pop r13
	pop r14
	pop r15
	mov r12 , rax
	mov rbx,1
	mov r12,r13
	add r12,rbx
	mov r11,r14
	lea r12,[r11+r12*8+8H]
	mov rdx,0
	mov [r12],rdx
	mov rax,1
	add r13,rax
	mov rdi,r13
	push r15
	push r14
	push r13
	call print_last_cond
	pop r13
	pop r14
	pop r15
	mov r13 , rax
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
	mov r14,rbx
	mov rdx,2
	mov r15,rdx
	imul r15,r14
	mov rax,1
	add r15,rax
	mov r15,r15
	mov r12,r14
	mov rbx,1
	mov r14,rbx
	mov rbx,t273
	mov rdi,rbx
	mov r11,rdi
	mov rbx,0
	mov r10,rbx
	
L_392:
	mov r9,r11
	mov rbx,r9
	mov r9,rbx
	mov r9, [r9]
	mov rdx,255
	and r9,rdx
	cmp r10,r9
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [arg+8*63],rbx
	je L_393
	mov r9,r11
	mov rdi,r10
	mov rbx,r9
	mov qword [arg+8*63],rbx
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
	mov     qword  r9, rax
	mov rbx,  [gbl+8*40]
	add r9,rbx
	mov rbx,r9
	mov rdx,1
	add r10,rdx
	mov qword [gbl+8*40],rbx
	jmp L_392
	
L_393:
	mov rbx,0
	mov r11,rbx
	mov r13,r11
	mov     rdi,  r12
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r13, rax
	mov r11,r13
	mov rbx,0
	mov r13,rbx
	
L_348:
	cmp r13,r12
	mov r10, 0
	setl r10B
	cmp r10, 0
	je L_349
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
	mov     qword  r10, rax
	mov r10,r10
	mov r9,r10
	mov rbx,0
	lea r9,[r9+rbx*8+8H]
	mov [r9],r14
	mov rdx,1
	mov r9,r14
	add r9,rdx
	mov r8,r10
	mov rax,1
	lea r8,[r8+rax*8+8H]
	mov [r8],r9
	mov rbx,2
	mov r9,r14
	add r9,rbx
	mov r9,r9
	neg r9
	mov r8,r10
	mov rbx,2
	lea r8,[r8+rbx*8+8H]
	mov [r8],r9
	mov rbx,2
	add r14,rbx
	mov r14,r14
	mov r9,r11
	lea r9,[r9+r13*8+8H]
	mov [r9],r10
	mov rbx,1
	add r13,rbx
	jmp L_348
	
L_349:
	mov rbx,1
	mov r14,r15
	add r14,rbx
	mov     rdi,  r14
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r14, rax
	mov r14,r14
	mov rbx,1
	mov r13,r15
	add r13,rbx
	mov     rdi,  r13
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r13, rax
	mov r13,r13
	mov rbx,0
	mov rdi,rbx
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	call dfs
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov r10 , rax
	mov rbx,0
	mov rdi,rbx
	push r15
	push r14
	push r13
	call print_last_cond
	pop r13
	pop r14
	pop r15
	mov r13 , rax
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
	mov r12,rdi
	cmp r12,r15
	mov r11, 0
	sete r11B
	cmp r11, 0
	je L_329
	mov rsi,r14
	mov rdi,r13
	mov r14,rdi
	mov r12,rsi
	mov rbx,0
	mov r11,rbx
	mov rdx,0
	mov r10,rdx
	
L_412:
	mov rbx,3
	cmp r10,rbx
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_413
	mov r9,r14
	lea r9,[r9+r10*8+8H]
	mov r9, [r9]
	mov r8,r12
	lea r8,[r8+r10*8+8H]
	mov r8, [r8]
	cmp r9,r8
	mov r9, 0
	setne r9B
	cmp r9, 0
	je L_414
	mov r9,r11
	mov rbx,1
	add r11,rbx
	
L_414:
	mov rbx,1
	add r10,rbx
	jmp L_412
	
L_413:
	mov r14,r11
	mov r14,r14
	mov rdi,r14
	mov r14,rdi
	mov     rdi,  r14
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword r14, rax
	mov     rsi,  r14
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
	mov  r14, rax
	mov     rsi, t140
	mov     rdi,  r14
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r14, rax
	mov rdi,r14
	mov r11,rdi
	mov rbx,0
	mov r10,rbx
	
L_418:
	mov r9,r11
	mov rbx,r9
	mov r9,rbx
	mov r9, [r9]
	mov rdx,255
	and r9,rdx
	cmp r10,r9
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [arg+8*63],rbx
	je L_419
	mov r9,r11
	mov rdi,r10
	mov rbx,r9
	mov qword [arg+8*63],rbx
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
	mov     qword  r9, rax
	mov rbx,  [gbl+8*40]
	add r9,rbx
	mov rbx,r9
	mov rdx,1
	add r10,rdx
	mov qword [gbl+8*40],rbx
	jmp L_418
	
L_419:
	mov rbx,0
	mov r11,rbx
	mov r14,r11
	mov rdx,0
	mov r14,rdx
	
L_330:
	cmp r14,r15
	mov r12, 0
	setl r12B
	cmp r12, 0
	je L_331
	xor rdx, rdx
	mov rax,  r14
	mov rbx, 10
	cdq
	idiv ebx
	mov  r12, rdx
	mov rbx,0
	cmp r12,rbx
	mov r12, 0
	sete r12B
	cmp r12, 0
	je L_334
	mov rbx,1
	mov r12,r14
	add r12,rbx
	mov r11,r13
	lea r12,[r11+r12*8+8H]
	mov r12, [r12]
	mov rdi,r12
	mov r12,rdi
	mov     rdi,  r12
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword r12, rax
	mov rdi,r12
	mov r11,rdi
	mov rbx,0
	mov r10,rbx
	
L_423:
	mov r9,r11
	mov rbx,r9
	mov r9,rbx
	mov r9, [r9]
	mov rdx,255
	and r9,rdx
	cmp r10,r9
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [arg+8*63],rbx
	je L_424
	mov r9,r11
	mov rdi,r10
	mov rbx,r9
	mov qword [arg+8*63],rbx
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
	mov     qword  r9, rax
	mov rbx,  [gbl+8*40]
	add r9,rbx
	mov rbx,r9
	mov rdx,1
	add r10,rdx
	mov qword [gbl+8*40],rbx
	jmp L_423
	
L_424:
	mov rbx,0
	mov r11,rbx
	mov r12,r11
	
L_334:
	mov rbx,1
	add r14,rbx
	jmp L_330
	
L_331:
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
L_329:
	mov rbx,1
	mov r10,r12
	add r10,rbx
	mov r11,r13
	lea r11,[r11+r10*8+8H]
	mov rdx,1
	mov [r11],rdx
	mov rax,1
	mov r11,r12
	add r11,rax
	mov rdi,r11
	push r15
	push r14
	push r13
	push r12
	push r11
	call print_cond
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov r11 , rax
	mov rbx,1
	mov r11,r12
	add r11,rbx
	mov r10,r13
	lea r11,[r10+r11*8+8H]
	mov rdx,0
	mov [r11],rdx
	mov rax,1
	add r12,rax
	mov rdi,r12
	push r15
	push r14
	push r13
	push r12
	call print_cond
	pop r12
	pop r13
	pop r14
	pop r15
	mov r12 , rax
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

