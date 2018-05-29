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
	sub    rsp, 720
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
        sub     rdx, 2704
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rbx,14
	mov r14,rbx
	mov rdx,0
	mov r13,rdx
	mov rax,0
	mov r15,rax
	
L_4354:
	cmp r15,r14
	mov r12, 0
	setl r12B
	cmp r12, 0
	je L_4355
	mov rbx,0
	mov r12,rbx
	
L_4357:
	cmp r12,r14
	mov r11, 0
	setl r11B
	cmp r11, 0
	je L_4358
	mov rbx,0
	mov r11,rbx
	
L_4360:
	cmp r11,r14
	mov r10, 0
	setl r10B
	cmp r10, 0
	je L_4361
	mov rbx,0
	mov r10,rbx
	
L_4363:
	cmp r10,r14
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_4364
	mov rbx,0
	mov r9,rbx
	
L_4366:
	cmp r9,r14
	mov r8, 0
	setl r8B
	cmp r8, 0
	je L_4367
	mov rbx,0
	mov r8,rbx
	
L_4369:
	cmp r8,r14
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*15],rbx
	je L_4370
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*16],rbx
	
L_4372:
	mov rbx,  [rsp+8*16]
	cmp rbx,r14
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*17],rdx
	je L_4373
	cmp r15,r12
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*18],rbx
	jne L_4375
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	jmp L_4376
	
L_4375:
	cmp r11,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*19],rbx
	mov qword [rsp+8*18],rdx
	
L_4376:
	mov rbx,  [rsp+8*18]
	cmp rbx, 0
	je L_4381
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	jmp L_4382
	
L_4381:
	cmp r10,r9
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*20],rbx
	jne L_4377
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*20],rbx
	jmp L_4378
	
L_4377:
	cmp r8,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*21],rbx
	mov qword [rsp+8*20],rdx
	
L_4378:
	mov rbx,  [rsp+8*20]
	cmp rbx, 0
	jne L_4379
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*20],rbx
	jmp L_4380
	
L_4379:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*22],rdx
	mov qword [rsp+8*20],rax
	
L_4380:
	mov rdx,  [rsp+8*20]
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_4382:
	mov rbx,  [rsp+8*18]
	cmp rbx, 0
	je L_4383
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	jmp L_4384
	
L_4383:
	mov rbx,  [rsp+8*16]
	cmp r15,rbx
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*23],rdx
	mov qword [rsp+8*18],rax
	
L_4384:
	mov rbx,  [rsp+8*18]
	cmp rbx, 0
	je L_4387
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	jmp L_4388
	
L_4387:
	cmp r10,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*24],rbx
	jne L_4385
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*24],rbx
	jmp L_4386
	
L_4385:
	cmp r8,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*25],rbx
	mov qword [rsp+8*24],rdx
	
L_4386:
	mov rdx,  [rsp+8*24]
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_4388:
	mov rdx,  [rsp+8*18]
	mov rbx,rdx
	cmp r15,r12
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*26],rbx
	mov qword [rsp+8*27],rax
	jne L_4389
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*27],rbx
	jmp L_4390
	
L_4389:
	cmp r11,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*28],rbx
	mov qword [rsp+8*27],rdx
	
L_4390:
	mov rbx,  [rsp+8*27]
	cmp rbx, 0
	je L_4395
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*27],rbx
	jmp L_4396
	
L_4395:
	cmp r10,r9
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*29],rbx
	jne L_4391
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*29],rbx
	jmp L_4392
	
L_4391:
	cmp r8,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*29],rdx
	
L_4392:
	mov rbx,  [rsp+8*29]
	cmp rbx, 0
	jne L_4393
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*29],rbx
	jmp L_4394
	
L_4393:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*29],rax
	
L_4394:
	mov rdx,  [rsp+8*29]
	mov rbx,rdx
	mov qword [rsp+8*27],rbx
	
L_4396:
	mov rbx,  [rsp+8*27]
	cmp rbx, 0
	je L_4397
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*27],rbx
	jmp L_4398
	
L_4397:
	mov rbx,  [rsp+8*16]
	cmp r15,rbx
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*32],rdx
	mov qword [rsp+8*27],rax
	
L_4398:
	mov rbx,  [rsp+8*27]
	cmp rbx, 0
	je L_4401
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*27],rbx
	jmp L_4402
	
L_4401:
	cmp r10,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*33],rbx
	jne L_4399
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*33],rbx
	jmp L_4400
	
L_4399:
	cmp r8,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*34],rbx
	mov qword [rsp+8*33],rdx
	
L_4400:
	mov rdx,  [rsp+8*33]
	mov rbx,rdx
	mov qword [rsp+8*27],rbx
	
L_4402:
	mov rdx,  [rsp+8*27]
	mov rbx,rdx
	cmp r15,r12
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*35],rbx
	mov qword [rsp+8*36],rax
	jne L_4403
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*36],rbx
	jmp L_4404
	
L_4403:
	cmp r11,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*37],rbx
	mov qword [rsp+8*36],rdx
	
L_4404:
	mov rbx,  [rsp+8*36]
	cmp rbx, 0
	je L_4409
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*36],rbx
	jmp L_4410
	
L_4409:
	cmp r10,r9
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*38],rbx
	jne L_4405
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*38],rbx
	jmp L_4406
	
L_4405:
	cmp r8,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*39],rbx
	mov qword [rsp+8*38],rdx
	
L_4406:
	mov rbx,  [rsp+8*38]
	cmp rbx, 0
	jne L_4407
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*38],rbx
	jmp L_4408
	
L_4407:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*40],rdx
	mov qword [rsp+8*38],rax
	
L_4408:
	mov rdx,  [rsp+8*38]
	mov rbx,rdx
	mov qword [rsp+8*36],rbx
	
L_4410:
	mov rbx,  [rsp+8*36]
	cmp rbx, 0
	je L_4411
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*36],rbx
	jmp L_4412
	
L_4411:
	mov rbx,  [rsp+8*16]
	cmp r15,rbx
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*41],rdx
	mov qword [rsp+8*36],rax
	
L_4412:
	mov rbx,  [rsp+8*36]
	cmp rbx, 0
	je L_4415
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*36],rbx
	jmp L_4416
	
L_4415:
	cmp r10,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*42],rbx
	jne L_4413
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*42],rbx
	jmp L_4414
	
L_4413:
	cmp r8,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*43],rbx
	mov qword [rsp+8*42],rdx
	
L_4414:
	mov rdx,  [rsp+8*42]
	mov rbx,rdx
	mov qword [rsp+8*36],rbx
	
L_4416:
	mov rdx,  [rsp+8*36]
	mov rbx,rdx
	cmp r15,r12
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*44],rbx
	mov qword [rsp+8*45],rax
	jne L_4417
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*45],rbx
	jmp L_4418
	
L_4417:
	cmp r11,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*46],rbx
	mov qword [rsp+8*45],rdx
	
L_4418:
	mov rbx,  [rsp+8*45]
	cmp rbx, 0
	je L_4423
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*45],rbx
	jmp L_4424
	
L_4423:
	cmp r10,r9
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*47],rbx
	jne L_4419
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*47],rbx
	jmp L_4420
	
L_4419:
	cmp r8,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*48],rbx
	mov qword [rsp+8*47],rdx
	
L_4420:
	mov rbx,  [rsp+8*47]
	cmp rbx, 0
	jne L_4421
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*47],rbx
	jmp L_4422
	
L_4421:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*49],rdx
	mov qword [rsp+8*47],rax
	
L_4422:
	mov rdx,  [rsp+8*47]
	mov rbx,rdx
	mov qword [rsp+8*45],rbx
	
L_4424:
	mov rbx,  [rsp+8*45]
	cmp rbx, 0
	je L_4425
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*45],rbx
	jmp L_4426
	
L_4425:
	mov rbx,  [rsp+8*16]
	cmp r15,rbx
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*50],rdx
	mov qword [rsp+8*45],rax
	
L_4426:
	mov rbx,  [rsp+8*45]
	cmp rbx, 0
	je L_4429
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*45],rbx
	jmp L_4430
	
L_4429:
	cmp r10,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*51],rbx
	jne L_4427
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*51],rbx
	jmp L_4428
	
L_4427:
	cmp r8,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*52],rbx
	mov qword [rsp+8*51],rdx
	
L_4428:
	mov rdx,  [rsp+8*51]
	mov rbx,rdx
	mov qword [rsp+8*45],rbx
	
L_4430:
	mov rdx,  [rsp+8*45]
	mov rbx,rdx
	cmp r15,r12
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*53],rbx
	mov qword [rsp+8*54],rax
	jne L_4431
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_4432
	
L_4431:
	cmp r11,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*55],rbx
	mov qword [rsp+8*54],rdx
	
L_4432:
	mov rbx,  [rsp+8*54]
	cmp rbx, 0
	je L_4437
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_4438
	
L_4437:
	cmp r10,r9
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*56],rbx
	jne L_4433
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*56],rbx
	jmp L_4434
	
L_4433:
	cmp r8,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*57],rbx
	mov qword [rsp+8*56],rdx
	
L_4434:
	mov rbx,  [rsp+8*56]
	cmp rbx, 0
	jne L_4435
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*56],rbx
	jmp L_4436
	
L_4435:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*56],rax
	
L_4436:
	mov rdx,  [rsp+8*56]
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	
L_4438:
	mov rbx,  [rsp+8*54]
	cmp rbx, 0
	je L_4439
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_4440
	
L_4439:
	mov rbx,  [rsp+8*16]
	cmp r15,rbx
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*59],rdx
	mov qword [rsp+8*54],rax
	
L_4440:
	mov rbx,  [rsp+8*54]
	cmp rbx, 0
	je L_4443
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_4444
	
L_4443:
	cmp r10,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*60],rbx
	jne L_4441
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*60],rbx
	jmp L_4442
	
L_4441:
	cmp r8,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*61],rbx
	mov qword [rsp+8*60],rdx
	
L_4442:
	mov rdx,  [rsp+8*60]
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	
L_4444:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	cmp r15,r12
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*62],rbx
	mov qword [rsp+8*63],rax
	jne L_4445
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*63],rbx
	jmp L_4446
	
L_4445:
	cmp r11,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*64],rbx
	mov qword [rsp+8*63],rdx
	
L_4446:
	mov rbx,  [rsp+8*63]
	cmp rbx, 0
	je L_4451
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*63],rbx
	jmp L_4452
	
L_4451:
	cmp r10,r9
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*65],rbx
	jne L_4447
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*65],rbx
	jmp L_4448
	
L_4447:
	cmp r8,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*66],rbx
	mov qword [rsp+8*65],rdx
	
L_4448:
	mov rbx,  [rsp+8*65]
	cmp rbx, 0
	jne L_4449
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*65],rbx
	jmp L_4450
	
L_4449:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*67],rdx
	mov qword [rsp+8*65],rax
	
L_4450:
	mov rdx,  [rsp+8*65]
	mov rbx,rdx
	mov qword [rsp+8*63],rbx
	
L_4452:
	mov rbx,  [rsp+8*63]
	cmp rbx, 0
	je L_4453
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*63],rbx
	jmp L_4454
	
L_4453:
	mov rbx,  [rsp+8*16]
	cmp r15,rbx
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*68],rdx
	mov qword [rsp+8*63],rax
	
L_4454:
	mov rbx,  [rsp+8*63]
	cmp rbx, 0
	je L_4457
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*63],rbx
	jmp L_4458
	
L_4457:
	cmp r10,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*69],rbx
	jne L_4455
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*69],rbx
	jmp L_4456
	
L_4455:
	cmp r8,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*69],rdx
	
L_4456:
	mov rdx,  [rsp+8*69]
	mov rbx,rdx
	mov qword [rsp+8*63],rbx
	
L_4458:
	mov rdx,  [rsp+8*63]
	mov rbx,rdx
	mov rax,  [rsp+8*26]
	cmp rax, 0
	mov qword [rsp+8*71],rbx
	je L_4460
	mov rbx,r13
	mov rdx,1
	add r13,rdx
	mov qword [rsp+8*72],rbx
	
L_4460:
	mov rbx,  [rsp+8*35]
	cmp rbx, 0
	je L_4462
	mov rbx,r13
	mov rdx,1
	add r13,rdx
	mov qword [rsp+8*73],rbx
	
L_4462:
	mov rbx,  [rsp+8*44]
	cmp rbx, 0
	je L_4464
	mov rbx,r13
	mov rdx,1
	add r13,rdx
	mov qword [rsp+8*74],rbx
	
L_4464:
	mov rbx,  [rsp+8*53]
	cmp rbx, 0
	je L_4466
	mov rbx,r13
	mov rdx,1
	add r13,rdx
	mov qword [rsp+8*75],rbx
	
L_4466:
	mov rbx,  [rsp+8*62]
	cmp rbx, 0
	je L_4468
	mov rbx,r13
	mov rdx,1
	add r13,rdx
	mov qword [rsp+8*76],rbx
	
L_4468:
	mov rbx,  [rsp+8*71]
	cmp rbx, 0
	je L_4470
	mov rbx,r13
	mov rdx,1
	add r13,rdx
	mov qword [rsp+8*77],rbx
	
L_4470:
	mov rbx,  [rsp+8*16]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*16],rbx
	jmp L_4372
	
L_4373:
	mov rbx,1
	add r8,rbx
	jmp L_4369
	
L_4370:
	mov rbx,1
	add r9,rbx
	jmp L_4366
	
L_4367:
	mov rbx,1
	add r10,rbx
	jmp L_4363
	
L_4364:
	mov rbx,1
	add r11,rbx
	jmp L_4360
	
L_4361:
	mov rbx,1
	add r12,rbx
	jmp L_4357
	
L_4358:
	mov rbx,1
	add r15,rbx
	jmp L_4354
	
L_4355:
	mov rdi,r13
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
	mov rdi, format
	mov rsi, r15 
	add rsi, 1 
	xor rax, rax
	push r11
	push r10
	push r9
	push r8
	call printf
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
	sub    rsp, 720
	mov rbx,  [rsp+8*82]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   2704
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

