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
	mov rdx,14
	mov rbx,rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*2],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*4],rdx
	mov qword [rsp+8*3],rax
	
L_4354:
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_4355
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*6],rbx
	
L_4357:
	mov rbx,  [rsp+8*6]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_4358
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*8],rbx
	
L_4360:
	mov rbx,  [rsp+8*8]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_4361
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*10],rbx
	
L_4363:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_4364
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*12],rbx
	
L_4366:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_4367
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_4369:
	mov rbx,  [rsp+8*14]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_4370
	mov rbx,0
	mov r8,rbx
	
L_4372:
	mov rbx,  [rsp+8*2]
	cmp r8,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_4373
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_4375
	mov rbx,0
	mov r15,rbx
	jmp L_4376
	
L_4375:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4376:
	cmp r15, 0
	je L_4381
	mov rbx,1
	mov r15,rbx
	jmp L_4382
	
L_4381:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_4377
	mov rbx,0
	mov r15,rbx
	jmp L_4378
	
L_4377:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4378:
	cmp r15, 0
	jne L_4379
	mov rbx,0
	mov r15,rbx
	jmp L_4380
	
L_4379:
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4380:
	mov r15,r15
	
L_4382:
	cmp r15, 0
	je L_4383
	mov rbx,1
	mov r15,rbx
	jmp L_4384
	
L_4383:
	mov rbx,  [rsp+8*4]
	cmp rbx,r8
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_4384:
	cmp r15, 0
	je L_4387
	mov rbx,1
	mov r15,rbx
	jmp L_4388
	
L_4387:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_4385
	mov rbx,0
	mov r15,rbx
	jmp L_4386
	
L_4385:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4386:
	mov r15,r15
	
L_4388:
	mov r9,r15
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_4389
	mov rbx,0
	mov r15,rbx
	jmp L_4390
	
L_4389:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4390:
	cmp r15, 0
	je L_4395
	mov rbx,1
	mov r15,rbx
	jmp L_4396
	
L_4395:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_4391
	mov rbx,0
	mov r15,rbx
	jmp L_4392
	
L_4391:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4392:
	cmp r15, 0
	jne L_4393
	mov rbx,0
	mov r15,rbx
	jmp L_4394
	
L_4393:
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4394:
	mov r15,r15
	
L_4396:
	cmp r15, 0
	je L_4397
	mov rbx,1
	mov r15,rbx
	jmp L_4398
	
L_4397:
	mov rbx,  [rsp+8*4]
	cmp rbx,r8
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_4398:
	cmp r15, 0
	je L_4401
	mov rbx,1
	mov r15,rbx
	jmp L_4402
	
L_4401:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_4399
	mov rbx,0
	mov r15,rbx
	jmp L_4400
	
L_4399:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4400:
	mov r15,r15
	
L_4402:
	mov r10,r15
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_4403
	mov rbx,0
	mov r15,rbx
	jmp L_4404
	
L_4403:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4404:
	cmp r15, 0
	je L_4409
	mov rbx,1
	mov r15,rbx
	jmp L_4410
	
L_4409:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_4405
	mov rbx,0
	mov r15,rbx
	jmp L_4406
	
L_4405:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4406:
	cmp r15, 0
	jne L_4407
	mov rbx,0
	mov r15,rbx
	jmp L_4408
	
L_4407:
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4408:
	mov r15,r15
	
L_4410:
	cmp r15, 0
	je L_4411
	mov rbx,1
	mov r15,rbx
	jmp L_4412
	
L_4411:
	mov rbx,  [rsp+8*4]
	cmp rbx,r8
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_4412:
	cmp r15, 0
	je L_4415
	mov rbx,1
	mov r15,rbx
	jmp L_4416
	
L_4415:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_4413
	mov rbx,0
	mov r15,rbx
	jmp L_4414
	
L_4413:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4414:
	mov r15,r15
	
L_4416:
	mov r11,r15
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_4417
	mov rbx,0
	mov r15,rbx
	jmp L_4418
	
L_4417:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4418:
	cmp r15, 0
	je L_4423
	mov rbx,1
	mov r15,rbx
	jmp L_4424
	
L_4423:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_4419
	mov rbx,0
	mov r15,rbx
	jmp L_4420
	
L_4419:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4420:
	cmp r15, 0
	jne L_4421
	mov rbx,0
	mov r15,rbx
	jmp L_4422
	
L_4421:
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4422:
	mov r15,r15
	
L_4424:
	cmp r15, 0
	je L_4425
	mov rbx,1
	mov r15,rbx
	jmp L_4426
	
L_4425:
	mov rbx,  [rsp+8*4]
	cmp rbx,r8
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_4426:
	cmp r15, 0
	je L_4429
	mov rbx,1
	mov r15,rbx
	jmp L_4430
	
L_4429:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_4427
	mov rbx,0
	mov r15,rbx
	jmp L_4428
	
L_4427:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4428:
	mov r15,r15
	
L_4430:
	mov r12,r15
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_4431
	mov rbx,0
	mov r15,rbx
	jmp L_4432
	
L_4431:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4432:
	cmp r15, 0
	je L_4437
	mov rbx,1
	mov r15,rbx
	jmp L_4438
	
L_4437:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_4433
	mov rbx,0
	mov r15,rbx
	jmp L_4434
	
L_4433:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4434:
	cmp r15, 0
	jne L_4435
	mov rbx,0
	mov r15,rbx
	jmp L_4436
	
L_4435:
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4436:
	mov r15,r15
	
L_4438:
	cmp r15, 0
	je L_4439
	mov rbx,1
	mov r15,rbx
	jmp L_4440
	
L_4439:
	mov rbx,  [rsp+8*4]
	cmp rbx,r8
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_4440:
	cmp r15, 0
	je L_4443
	mov rbx,1
	mov r15,rbx
	jmp L_4444
	
L_4443:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_4441
	mov rbx,0
	mov r15,rbx
	jmp L_4442
	
L_4441:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4442:
	mov r15,r15
	
L_4444:
	mov r13,r15
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_4445
	mov rbx,0
	mov r15,rbx
	jmp L_4446
	
L_4445:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4446:
	cmp r15, 0
	je L_4451
	mov rbx,1
	mov r15,rbx
	jmp L_4452
	
L_4451:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_4447
	mov rbx,0
	mov r15,rbx
	jmp L_4448
	
L_4447:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4448:
	cmp r15, 0
	jne L_4449
	mov rbx,0
	mov r15,rbx
	jmp L_4450
	
L_4449:
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4450:
	mov r15,r15
	
L_4452:
	cmp r15, 0
	je L_4453
	mov rbx,1
	mov r15,rbx
	jmp L_4454
	
L_4453:
	mov rbx,  [rsp+8*4]
	cmp rbx,r8
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_4454:
	cmp r15, 0
	je L_4457
	mov rbx,1
	mov r15,rbx
	jmp L_4458
	
L_4457:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_4455
	mov rbx,0
	mov r15,rbx
	jmp L_4456
	
L_4455:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_4456:
	mov r15,r15
	
L_4458:
	mov r14,r15
	cmp r9, 0
	je L_4460
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_4460:
	cmp r10, 0
	je L_4462
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_4462:
	cmp r11, 0
	je L_4464
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_4464:
	cmp r12, 0
	je L_4466
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_4466:
	cmp r13, 0
	je L_4468
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_4468:
	cmp r14, 0
	je L_4470
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_4470:
	mov rbx,1
	add r8,rbx
	jmp L_4372
	
L_4373:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*14],rbx
	jmp L_4369
	
L_4370:
	mov rbx,  [rsp+8*12]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*12],rbx
	jmp L_4366
	
L_4367:
	mov rbx,  [rsp+8*10]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*10],rbx
	jmp L_4363
	
L_4364:
	mov rbx,  [rsp+8*8]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*8],rbx
	jmp L_4360
	
L_4361:
	mov rbx,  [rsp+8*6]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*6],rbx
	jmp L_4357
	
L_4358:
	mov rbx,  [rsp+8*4]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*4],rbx
	jmp L_4354
	
L_4355:
	mov rbx,  [rsp+8*3]
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

