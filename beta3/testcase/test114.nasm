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
	sub    rsp, 688
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
        sub     rdx, 2672
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rdx,80
	mov rbx,rdx
	mov qword [rsp+8*1],rbx
	mov     rdi, 2
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
	mov rbx,0
	lea r15,[r14+rbx*8+8H]
	mov rdx,  [rsp+8*1]
	mov [r15],rdx
	mov rax,1
	lea r15,[r14+rax*8+8H]
	mov [r15],rdx
	mov     rdi,  r14
	call    multiArray
	mov     qword  r14, rax
	mov r12,r14
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*2],rbx
	
L_516:
	mov rbx,  [rsp+8*2]
	mov rdx,  [rsp+8*1]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_517
	mov rbx,0
	mov r10,rbx
	
L_519:
	mov rbx,  [rsp+8*1]
	cmp r10,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_520
	mov rbx,0
	mov r9,rbx
	
L_522:
	mov rbx,  [rsp+8*1]
	cmp r9,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_523
	mov rbx,  [rsp+8*2]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_527
	mov rbx,0
	mov r15,rbx
	jmp L_528
	
L_527:
	cmp r10,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_525
	mov rbx,0
	mov r15,rbx
	jmp L_526
	
L_525:
	cmp r9,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_526:
	mov r15,r15
	
L_528:
	cmp r15, 0
	je L_530
	xor rdx, rdx
	mov rax, [rsp+8*2]
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r14, rdx
	xor rdx, rdx
	mov rax,  r10
	mov rbx,  r9
	cdq
	idiv ebx
	mov  r15, rdx
	cmp r14,r15
	mov r15, 0
	setne r15B
	cmp r15, 0
	jne L_533
	mov rbx,0
	mov r15,rbx
	jmp L_534
	
L_533:
	xor rdx, rdx
	mov rax,  r10
	mov rbx,  r9
	cdq
	idiv ebx
	mov  r15, rdx
	xor rdx, rdx
	mov rax,  r9
	mov rbx, [rsp+8*2]
	cdq
	idiv ebx
	mov  r14, rdx
	cmp r15,r14
	mov r15, 0
	setne r15B
	cmp r15, 0
	jne L_531
	mov rbx,0
	mov r15,rbx
	jmp L_532
	
L_531:
	xor rdx, rdx
	mov rax, [rsp+8*2]
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r15, rdx
	xor rdx, rdx
	mov rax,  r9
	mov rbx, [rsp+8*2]
	cdq
	idiv ebx
	mov  r14, rdx
	cmp r15,r14
	mov r15, 0
	setne r15B
	mov r15,r15
	
L_532:
	mov r15,r15
	
L_534:
	cmp r15, 0
	je L_536
	mov rbx,  [rsp+8*2]
	mov r14,rbx
	and r14,r10
	and r14,r9
	mov r15,rbx
	add r15,r10
	add r15,r9
	mov rsi,r15
	mov rdi,r14
	mov r15,rdi
	mov rdx,rsi
	mov rax,1
	add r15,rax
	mov r8,r15
	mov rax,0
	mov r11,rax
	mov qword [rsp+8*5],rdx
	
L_601:
	mov rbx,  [rsp+8*5]
	mov rdx,10
	mov r15,rbx
	imul r15,rdx
	cmp r11,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_602
	mov rbx,13
	mov rsi,rbx
	mov rdi,r8
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,r15
	shl r14,cl
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r15,rdi
	mov rbx,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	and r14,r15
	mov rax,r14
	mov r15,rax
	xor r15,r8
	mov r8,r15
	mov qword [rsp+8*6],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,r8
	mov r14,rdi
	mov rbx,rsi
	mov qword [rsp+8*7],rdx
	mov rdx,65536
	mov rsi,rdx
	mov rdx,32767
	mov rdi,rdx
	mov r15,rdi
	mov rdx,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov qword [rsp+8*8],rax
	mov rax,r15
	mov r15,rax
	mov r13,r15
	mov rcx,rbx
	shr r13,cl
	mov qword [rsp+8*6],rdx
	mov rdx,1
	mov qword [rsp+8*7],rax
	mov rax,1
	mov r15,rdx
	add r15,rax
	mov rcx,r15
	shl r13,cl
	mov rdx,1
	add r13,rdx
	mov r15,r14
	mov rcx,rbx
	shr r15,cl
	and r13,r15
	mov qword [rsp+8*9],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rbx,32767
	mov rdi,rbx
	mov r15,rdi
	mov rbx,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	and r13,r15
	mov rax,r13
	mov qword [rsp+8*6],rbx
	mov rbx,rax
	mov r15,r8
	xor r15,rbx
	mov r8,r15
	mov qword [rsp+8*11],rbx
	mov rbx,5
	mov rsi,rbx
	mov rdi,r8
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,r15
	shl r14,cl
	mov rbx,65535
	mov rsi,rbx
	mov rbx,32767
	mov rdi,rbx
	mov r15,rdi
	mov rbx,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	and r14,r15
	mov qword [rsp+8*6],rbx
	mov rbx,r14
	mov r15,rbx
	xor r15,r8
	mov r8,r15
	mov r15,r11
	mov qword [rsp+8*8],rbx
	mov rbx,1
	add r11,rbx
	mov qword [rsp+8*7],rdx
	mov qword [rsp+8*10],rax
	jmp L_601
	
L_602:
	mov rbx,123456789
	mov r15,r8
	xor r15,rbx
	mov r15,r15
	mov r14,r15
	mov r15,r12
	mov rdx,  [rsp+8*2]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	lea r15,[r15+r10*8+8H]
	mov [r15],r14
	
L_536:
	
L_530:
	mov rbx,1
	add r9,rbx
	jmp L_522
	
L_523:
	mov rbx,1
	add r10,rbx
	jmp L_519
	
L_520:
	mov rbx,  [rsp+8*2]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*2],rbx
	jmp L_516
	
L_517:
	mov rbx,0
	mov r14,rbx
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*2],rdx
	
L_537:
	mov rbx,  [rsp+8*2]
	mov rdx,  [rsp+8*1]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_538
	mov rbx,0
	mov r10,rbx
	
L_540:
	mov rbx,  [rsp+8*1]
	cmp r10,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_541
	mov rbx,0
	mov r9,rbx
	
L_543:
	mov rbx,  [rsp+8*1]
	cmp r9,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_544
	mov rbx,  [rsp+8*2]
	cmp rbx,r10
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_546
	mov rbx,0
	mov r15,rbx
	jmp L_547
	
L_546:
	cmp r10,r9
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_547:
	cmp r15, 0
	je L_549
	mov r15,r12
	mov rbx,  [rsp+8*2]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	add r15,r14
	mov rdx,1
	mov r14,rdx
	mov rcx,30
	shl r14,cl
	mov rax,1
	sub r14,rax
	and r15,r14
	mov r14,r15
	
L_549:
	mov rbx,1
	add r9,rbx
	jmp L_543
	
L_544:
	mov rbx,1
	add r10,rbx
	jmp L_540
	
L_541:
	mov rbx,  [rsp+8*2]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*2],rbx
	jmp L_537
	
L_538:
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
	mov     qword r15, rax
	mov     rsi,  r15
	mov     rdi, t172
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
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 688
	mov rbx,  [rsp+8*12]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   2672
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

t172:
	 db 7,"Ans is " ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

