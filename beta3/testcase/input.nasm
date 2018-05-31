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
	sub    rsp, 1536
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
        sub     rdx, 3520
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	mov     rdi, 256
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*1], rax
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rbx,0
	mov r15,rbx
	mov r14,r15
	mov r15,r14
	mov r14,r15
	mov r15,r14
	mov r14,r15
	mov r15,r14
	mov r14,r15
	mov r15,r14
	mov rax,350
	mov rdx,rax
	mov rax,0
	mov rbx,rax
	mov rax,0
	mov r13,rax
	mov r12,r13
	mov r13,r12
	mov r12,r13
	mov r13,r12
	mov r12,r13
	mov r13,r12
	mov r12,r13
	mov r13,r12
	mov r12,r13
	mov r13,r12
	mov qword [rsp+8*12],rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*13],rbx
	mov qword [rsp+8*25],rax
	
L_491:
	mov rbx,  [rsp+8*25]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r12, 0
	setl r12B
	cmp r12, 0
	je L_492
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*27],rbx
	
L_494:
	mov rbx,  [rsp+8*27]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r11, 0
	setl r11B
	cmp r11, 0
	je L_495
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*29],rbx
	
L_497:
	mov rbx,  [rsp+8*29]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r10, 0
	setl r10B
	cmp r10, 0
	je L_498
	mov rbx,  [rsp+8*25]
	cmp rbx,0
	mov r10, 0
	setg r10B
	cmp r10, 0
	jne L_500
	mov rbx,0
	mov r10,rbx
	jmp L_501
	
L_500:
	xor rdx, rdx
	mov rax, [rsp+8*25]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r10,r8
	
L_501:
	cmp r10, 0
	je L_504
	mov rbx,1
	mov r10,rbx
	jmp L_505
	
L_504:
	mov rbx,  [rsp+8*27]
	cmp rbx,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	jne L_502
	mov rbx,0
	mov r9,rbx
	jmp L_503
	
L_502:
	xor rdx, rdx
	mov rax, [rsp+8*27]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r8, rdx
	mov rbx,0
	cmp r8,rbx
	mov r13, 0
	sete r13B
	mov r9,r13
	
L_503:
	mov r10,r9
	
L_505:
	cmp r10, 0
	je L_508
	mov rbx,1
	mov r10,rbx
	jmp L_509
	
L_508:
	mov rbx,  [rsp+8*29]
	cmp rbx,0
	mov r13, 0
	setg r13B
	cmp r13, 0
	jne L_506
	mov rbx,0
	mov r13,rbx
	jmp L_507
	
L_506:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r13,r8
	
L_507:
	mov r10,r13
	
L_509:
	cmp r10, 0
	je L_512
	mov rbx,1
	mov r10,rbx
	jmp L_513
	
L_512:
	mov rbx,  [rsp+8*25]
	mov rdx,  [rsp+8*27]
	mov r13,rbx
	add r13,rdx
	mov rax,  [rsp+8*29]
	add r13,rax
	cmp r13,0
	mov r13, 0
	setg r13B
	cmp r13, 0
	jne L_510
	mov rbx,0
	mov r13,rbx
	jmp L_511
	
L_510:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r13,r8
	
L_511:
	mov r10,r13
	
L_513:
	cmp r10, 0
	je L_516
	mov rbx,1
	mov r10,rbx
	jmp L_517
	
L_516:
	mov rbx,  [rsp+8*25]
	mov rdx,  [rsp+8*27]
	mov r13,rbx
	imul r13,rdx
	mov rax,  [rsp+8*29]
	imul r13,rax
	cmp r13,0
	mov r13, 0
	setg r13B
	cmp r13, 0
	jne L_514
	mov rbx,0
	mov r13,rbx
	jmp L_515
	
L_514:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r13,r8
	
L_515:
	mov r10,r13
	
L_517:
	mov r13,r10
	mov rbx,  [rsp+8*25]
	cmp rbx,0
	mov r10, 0
	setg r10B
	cmp r10, 0
	jne L_518
	mov rbx,0
	mov r10,rbx
	jmp L_519
	
L_518:
	xor rdx, rdx
	mov rax, [rsp+8*25]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r10,r8
	
L_519:
	cmp r10, 0
	je L_522
	mov rbx,1
	mov r10,rbx
	jmp L_523
	
L_522:
	mov rbx,  [rsp+8*27]
	cmp rbx,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	jne L_520
	mov rbx,0
	mov r9,rbx
	jmp L_521
	
L_520:
	xor rdx, rdx
	mov rax, [rsp+8*27]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r8, rdx
	mov rbx,0
	cmp r8,rbx
	mov r14, 0
	sete r14B
	mov r9,r14
	
L_521:
	mov r10,r9
	
L_523:
	cmp r10, 0
	je L_526
	mov rbx,1
	mov r10,rbx
	jmp L_527
	
L_526:
	mov rbx,  [rsp+8*29]
	cmp rbx,0
	mov r14, 0
	setg r14B
	cmp r14, 0
	jne L_524
	mov rbx,0
	mov r14,rbx
	jmp L_525
	
L_524:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r14,r8
	
L_525:
	mov r10,r14
	
L_527:
	cmp r10, 0
	je L_530
	mov rbx,1
	mov r10,rbx
	jmp L_531
	
L_530:
	mov rbx,  [rsp+8*25]
	mov rdx,  [rsp+8*27]
	mov r14,rbx
	add r14,rdx
	mov rax,  [rsp+8*29]
	add r14,rax
	cmp r14,0
	mov r14, 0
	setg r14B
	cmp r14, 0
	jne L_528
	mov rbx,0
	mov r14,rbx
	jmp L_529
	
L_528:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r14,r8
	
L_529:
	mov r10,r14
	
L_531:
	cmp r10, 0
	je L_534
	mov rbx,1
	mov r10,rbx
	jmp L_535
	
L_534:
	mov rbx,  [rsp+8*25]
	mov rdx,  [rsp+8*27]
	mov r14,rbx
	imul r14,rdx
	mov rax,  [rsp+8*29]
	imul r14,rax
	cmp r14,0
	mov r14, 0
	setg r14B
	cmp r14, 0
	jne L_532
	mov rbx,0
	mov r14,rbx
	jmp L_533
	
L_532:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r14,r8
	
L_533:
	mov r10,r14
	
L_535:
	mov r14,r10
	mov rbx,  [rsp+8*25]
	cmp rbx,0
	mov r10, 0
	setg r10B
	cmp r10, 0
	jne L_536
	mov rbx,0
	mov r10,rbx
	jmp L_537
	
L_536:
	xor rdx, rdx
	mov rax, [rsp+8*25]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r10,r8
	
L_537:
	cmp r10, 0
	je L_540
	mov rbx,1
	mov r10,rbx
	jmp L_541
	
L_540:
	mov rbx,  [rsp+8*27]
	cmp rbx,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	jne L_538
	mov rbx,0
	mov r9,rbx
	jmp L_539
	
L_538:
	xor rdx, rdx
	mov rax, [rsp+8*27]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r8, rdx
	mov rbx,0
	cmp r8,rbx
	mov r15, 0
	sete r15B
	mov r9,r15
	
L_539:
	mov r10,r9
	
L_541:
	cmp r10, 0
	je L_544
	mov rbx,1
	mov r10,rbx
	jmp L_545
	
L_544:
	mov rbx,  [rsp+8*29]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_542
	mov rbx,0
	mov r15,rbx
	jmp L_543
	
L_542:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r15,r8
	
L_543:
	mov r10,r15
	
L_545:
	cmp r10, 0
	je L_548
	mov rbx,1
	mov r10,rbx
	jmp L_549
	
L_548:
	mov rbx,  [rsp+8*25]
	mov rdx,  [rsp+8*27]
	mov r15,rbx
	add r15,rdx
	mov rax,  [rsp+8*29]
	add r15,rax
	cmp r15,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_546
	mov rbx,0
	mov r15,rbx
	jmp L_547
	
L_546:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r15,r8
	
L_547:
	mov r10,r15
	
L_549:
	cmp r10, 0
	je L_552
	mov rbx,1
	mov r10,rbx
	jmp L_553
	
L_552:
	mov rbx,  [rsp+8*25]
	mov rdx,  [rsp+8*27]
	mov r15,rbx
	imul r15,rdx
	mov rax,  [rsp+8*29]
	imul r15,rax
	cmp r15,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_550
	mov rbx,0
	mov r15,rbx
	jmp L_551
	
L_550:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r15,r8
	
L_551:
	mov r10,r15
	
L_553:
	mov r15,r10
	mov rbx,  [rsp+8*25]
	cmp rbx,0
	mov r10, 0
	setg r10B
	cmp r10, 0
	jne L_554
	mov rbx,0
	mov r10,rbx
	jmp L_555
	
L_554:
	xor rdx, rdx
	mov rax, [rsp+8*25]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r10,r8
	
L_555:
	cmp r10, 0
	je L_558
	mov rbx,1
	mov r10,rbx
	jmp L_559
	
L_558:
	mov rbx,  [rsp+8*27]
	cmp rbx,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	jne L_556
	mov rbx,0
	mov r9,rbx
	jmp L_557
	
L_556:
	xor rdx, rdx
	mov rax, [rsp+8*27]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r8, rdx
	mov rbx,0
	cmp r8,rbx
	mov r12, 0
	sete r12B
	mov r9,r12
	
L_557:
	mov r10,r9
	
L_559:
	cmp r10, 0
	je L_562
	mov rbx,1
	mov r10,rbx
	jmp L_563
	
L_562:
	mov rbx,  [rsp+8*29]
	cmp rbx,0
	mov r12, 0
	setg r12B
	cmp r12, 0
	jne L_560
	mov rbx,0
	mov r12,rbx
	jmp L_561
	
L_560:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r12,r8
	
L_561:
	mov r10,r12
	
L_563:
	cmp r10, 0
	je L_566
	mov rbx,1
	mov r10,rbx
	jmp L_567
	
L_566:
	mov rbx,  [rsp+8*25]
	mov rdx,  [rsp+8*27]
	mov r12,rbx
	add r12,rdx
	mov rax,  [rsp+8*29]
	add r12,rax
	cmp r12,0
	mov r12, 0
	setg r12B
	cmp r12, 0
	jne L_564
	mov rbx,0
	mov r12,rbx
	jmp L_565
	
L_564:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r12,r8
	
L_565:
	mov r10,r12
	
L_567:
	cmp r10, 0
	je L_570
	mov rbx,1
	mov r10,rbx
	jmp L_571
	
L_570:
	mov rbx,  [rsp+8*25]
	mov rdx,  [rsp+8*27]
	mov r12,rbx
	imul r12,rdx
	mov rax,  [rsp+8*29]
	imul r12,rax
	cmp r12,0
	mov r12, 0
	setg r12B
	cmp r12, 0
	jne L_568
	mov rbx,0
	mov r12,rbx
	jmp L_569
	
L_568:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r12,r8
	
L_569:
	mov r10,r12
	
L_571:
	mov r12,r10
	mov rbx,  [rsp+8*25]
	cmp rbx,0
	mov r10, 0
	setg r10B
	cmp r10, 0
	jne L_572
	mov rbx,0
	mov r10,rbx
	jmp L_573
	
L_572:
	xor rdx, rdx
	mov rax, [rsp+8*25]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r10,r8
	
L_573:
	cmp r10, 0
	je L_576
	mov rbx,1
	mov r10,rbx
	jmp L_577
	
L_576:
	mov rbx,  [rsp+8*27]
	cmp rbx,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	jne L_574
	mov rbx,0
	mov r9,rbx
	jmp L_575
	
L_574:
	xor rdx, rdx
	mov rax, [rsp+8*27]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r8, rdx
	mov rbx,0
	cmp r8,rbx
	mov r11, 0
	sete r11B
	mov r9,r11
	
L_575:
	mov r10,r9
	
L_577:
	cmp r10, 0
	je L_580
	mov rbx,1
	mov r10,rbx
	jmp L_581
	
L_580:
	mov rbx,  [rsp+8*29]
	cmp rbx,0
	mov r11, 0
	setg r11B
	cmp r11, 0
	jne L_578
	mov rbx,0
	mov r11,rbx
	jmp L_579
	
L_578:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r11,r8
	
L_579:
	mov r10,r11
	
L_581:
	cmp r10, 0
	je L_584
	mov rbx,1
	mov r10,rbx
	jmp L_585
	
L_584:
	mov rbx,  [rsp+8*25]
	mov rdx,  [rsp+8*27]
	mov r11,rbx
	add r11,rdx
	mov rax,  [rsp+8*29]
	add r11,rax
	cmp r11,0
	mov r11, 0
	setg r11B
	cmp r11, 0
	jne L_582
	mov rbx,0
	mov r11,rbx
	jmp L_583
	
L_582:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r11,r8
	
L_583:
	mov r10,r11
	
L_585:
	cmp r10, 0
	je L_588
	mov rbx,1
	mov r10,rbx
	jmp L_589
	
L_588:
	mov rbx,  [rsp+8*25]
	mov rdx,  [rsp+8*27]
	mov r11,rbx
	imul r11,rdx
	mov rax,  [rsp+8*29]
	imul r11,rax
	cmp r11,0
	mov r11, 0
	setg r11B
	cmp r11, 0
	jne L_586
	mov rbx,0
	mov r11,rbx
	jmp L_587
	
L_586:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r11,r8
	
L_587:
	mov r10,r11
	
L_589:
	mov rbx,r10
	mov rdx,  [rsp+8*25]
	cmp rdx,0
	mov r10, 0
	setg r10B
	cmp r10, 0
	mov qword [rsp+8*110],rbx
	jne L_590
	mov rbx,0
	mov r10,rbx
	jmp L_591
	
L_590:
	xor rdx, rdx
	mov rax, [rsp+8*25]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r10,r8
	
L_591:
	cmp r10, 0
	je L_594
	mov rbx,1
	mov r10,rbx
	jmp L_595
	
L_594:
	mov rbx,  [rsp+8*27]
	cmp rbx,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	jne L_592
	mov rbx,0
	mov r9,rbx
	jmp L_593
	
L_592:
	xor rdx, rdx
	mov rax, [rsp+8*27]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r8, rdx
	mov rbx,0
	cmp r8,rbx
	mov r11, 0
	sete r11B
	mov r9,r11
	
L_593:
	mov r10,r9
	
L_595:
	cmp r10, 0
	je L_598
	mov rbx,1
	mov r10,rbx
	jmp L_599
	
L_598:
	mov rbx,  [rsp+8*29]
	cmp rbx,0
	mov r11, 0
	setg r11B
	cmp r11, 0
	jne L_596
	mov rbx,0
	mov r11,rbx
	jmp L_597
	
L_596:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r11,r8
	
L_597:
	mov r10,r11
	
L_599:
	cmp r10, 0
	je L_602
	mov rbx,1
	mov r10,rbx
	jmp L_603
	
L_602:
	mov rbx,  [rsp+8*25]
	mov rdx,  [rsp+8*27]
	mov r11,rbx
	add r11,rdx
	mov rax,  [rsp+8*29]
	add r11,rax
	cmp r11,0
	mov r11, 0
	setg r11B
	cmp r11, 0
	jne L_600
	mov rbx,0
	mov r11,rbx
	jmp L_601
	
L_600:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r11,r8
	
L_601:
	mov r10,r11
	
L_603:
	cmp r10, 0
	je L_606
	mov rbx,1
	mov r10,rbx
	jmp L_607
	
L_606:
	mov rbx,  [rsp+8*25]
	mov rdx,  [rsp+8*27]
	mov r11,rbx
	imul r11,rdx
	mov rax,  [rsp+8*29]
	imul r11,rax
	cmp r11,0
	mov r11, 0
	setg r11B
	cmp r11, 0
	jne L_604
	mov rbx,0
	mov r11,rbx
	jmp L_605
	
L_604:
	xor rdx, rdx
	mov rax, [rsp+8*29]
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r8, 0
	sete r8B
	mov r11,r8
	
L_605:
	mov r10,r11
	
L_607:
	mov r11,r10
	cmp r13, 0
	je L_609
	mov rbx,  [rsp+8*13]
	mov r13,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*13],rbx
	
L_609:
	cmp r14, 0
	je L_611
	mov rbx,  [rsp+8*13]
	mov r14,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*13],rbx
	
L_611:
	cmp r15, 0
	je L_613
	mov rbx,  [rsp+8*13]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*13],rbx
	
L_613:
	cmp r12, 0
	je L_615
	mov rbx,  [rsp+8*13]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*13],rbx
	
L_615:
	mov rbx,  [rsp+8*110]
	cmp rbx, 0
	je L_617
	mov rbx,  [rsp+8*13]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*13],rbx
	
L_617:
	cmp r11, 0
	je L_619
	mov rbx,  [rsp+8*13]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*13],rbx
	
L_619:
	mov rbx,  [rsp+8*29]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*29],rbx
	jmp L_497
	
L_498:
	mov rbx,  [rsp+8*27]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*27],rbx
	jmp L_494
	
L_495:
	mov rbx,  [rsp+8*25]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*25],rbx
	jmp L_491
	
L_492:
	mov rbx,  [rsp+8*13]
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
	mov     qword r14, rax
	mov rdi,r14
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
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*25],rbx
	
L_620:
	mov rbx,  [rsp+8*25]
	mov rdx,30000000
	cmp rbx,rdx
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_621
	mov rbx,100
	mov rdi,rbx
	mov r15,rdi
	mov rdi,r15
	mov r15,rdi
	mov rdi,r15
	mov r15,rdi
	mov rdi,r15
	mov r15,rdi
	mov rdx,250
	cmp r15,rdx
	mov r14, 0
	setl r14B
	cmp r15,0
	mov r13, 0
	setg r13B
	mov r12,r14
	and r12,r13
	cmp r12, 0
	je L_689
	mov rbx,  [gbl+8*1]
	lea r14,[rbx+r15*8+8H]
	mov r13, [r14]
	cmp r13,0
	mov r11, 0
	setg r11B
	cmp r11, 0
	je L_689
	cmp r12, 0
	je L_690
	mov rbx,  [gbl+8*1]
	lea r14,[rbx+r15*8+8H]
	mov [r14],r13
	
L_690:
	mov r11,r13
	jmp L_692
	
L_689:
	mov r13,rdi
	mov rbx,1
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r13
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,2
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,3
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,4
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,5
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,6
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,7
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,8
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,9
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,10
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,11
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,12
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,13
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,14
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,15
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,16
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,17
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,18
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,19
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,20
	mov r10,r13
	sub r10,rbx
	xor rdx, rdx
	mov rax,  r9
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	cmp r12, 0
	je L_693
	mov rbx,  [gbl+8*1]
	lea r14,[rbx+r15*8+8H]
	mov [r14],r9
	
L_693:
	mov r11,r9
	
L_692:
	mov r15,r11
	mov r14,r15
	mov r15,r14
	mov r14,r15
	mov r15,r14
	mov r14,r15
	mov r15,r14
	mov r14,r15
	xor rdx, rdx
	mov rax, [rsp+8*25]
	mov rbx, 3000000
	cdq
	idiv ebx
	mov  r15, rdx
	mov rbx,0
	cmp r15,rbx
	mov r13, 0
	sete r13B
	cmp r13, 0
	je L_624
	mov rdi,r14
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
	mov     qword r14, rax
	mov rdi,r14
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
	
L_624:
	mov rbx,  [rsp+8*25]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*25],rbx
	jmp L_620
	
L_621:
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1536
	mov rbx,  [rsp+8*184]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   3520
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

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

