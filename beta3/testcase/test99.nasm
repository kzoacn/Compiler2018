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
	
L_3278:
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_3279
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*6],rbx
	
L_3281:
	mov rbx,  [rsp+8*6]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_3282
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*8],rbx
	
L_3284:
	mov rbx,  [rsp+8*8]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_3285
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*10],rbx
	
L_3287:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_3288
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*12],rbx
	
L_3290:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_3291
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_3293:
	mov rbx,  [rsp+8*14]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_3294
	mov rbx,0
	mov r8,rbx
	
L_3296:
	mov rbx,  [rsp+8*2]
	cmp r8,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_3297
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_3299
	mov rbx,0
	mov r15,rbx
	jmp L_3300
	
L_3299:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3300:
	cmp r15, 0
	je L_3305
	mov rbx,1
	mov r15,rbx
	jmp L_3306
	
L_3305:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_3301
	mov rbx,0
	mov r15,rbx
	jmp L_3302
	
L_3301:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3302:
	cmp r15, 0
	jne L_3303
	mov rbx,0
	mov r15,rbx
	jmp L_3304
	
L_3303:
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3304:
	mov r15,r15
	
L_3306:
	cmp r15, 0
	je L_3307
	mov rbx,1
	mov r15,rbx
	jmp L_3308
	
L_3307:
	mov rbx,  [rsp+8*4]
	cmp rbx,r8
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_3308:
	cmp r15, 0
	je L_3311
	mov rbx,1
	mov r15,rbx
	jmp L_3312
	
L_3311:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_3309
	mov rbx,0
	mov r15,rbx
	jmp L_3310
	
L_3309:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3310:
	mov r15,r15
	
L_3312:
	mov r9,r15
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_3313
	mov rbx,0
	mov r15,rbx
	jmp L_3314
	
L_3313:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3314:
	cmp r15, 0
	je L_3319
	mov rbx,1
	mov r15,rbx
	jmp L_3320
	
L_3319:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_3315
	mov rbx,0
	mov r15,rbx
	jmp L_3316
	
L_3315:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3316:
	cmp r15, 0
	jne L_3317
	mov rbx,0
	mov r15,rbx
	jmp L_3318
	
L_3317:
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3318:
	mov r15,r15
	
L_3320:
	cmp r15, 0
	je L_3321
	mov rbx,1
	mov r15,rbx
	jmp L_3322
	
L_3321:
	mov rbx,  [rsp+8*4]
	cmp rbx,r8
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_3322:
	cmp r15, 0
	je L_3325
	mov rbx,1
	mov r15,rbx
	jmp L_3326
	
L_3325:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_3323
	mov rbx,0
	mov r15,rbx
	jmp L_3324
	
L_3323:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3324:
	mov r15,r15
	
L_3326:
	mov r10,r15
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_3327
	mov rbx,0
	mov r15,rbx
	jmp L_3328
	
L_3327:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3328:
	cmp r15, 0
	je L_3333
	mov rbx,1
	mov r15,rbx
	jmp L_3334
	
L_3333:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_3329
	mov rbx,0
	mov r15,rbx
	jmp L_3330
	
L_3329:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3330:
	cmp r15, 0
	jne L_3331
	mov rbx,0
	mov r15,rbx
	jmp L_3332
	
L_3331:
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3332:
	mov r15,r15
	
L_3334:
	cmp r15, 0
	je L_3335
	mov rbx,1
	mov r15,rbx
	jmp L_3336
	
L_3335:
	mov rbx,  [rsp+8*4]
	cmp rbx,r8
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_3336:
	cmp r15, 0
	je L_3339
	mov rbx,1
	mov r15,rbx
	jmp L_3340
	
L_3339:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_3337
	mov rbx,0
	mov r15,rbx
	jmp L_3338
	
L_3337:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3338:
	mov r15,r15
	
L_3340:
	mov r11,r15
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_3341
	mov rbx,0
	mov r15,rbx
	jmp L_3342
	
L_3341:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3342:
	cmp r15, 0
	je L_3347
	mov rbx,1
	mov r15,rbx
	jmp L_3348
	
L_3347:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_3343
	mov rbx,0
	mov r15,rbx
	jmp L_3344
	
L_3343:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3344:
	cmp r15, 0
	jne L_3345
	mov rbx,0
	mov r15,rbx
	jmp L_3346
	
L_3345:
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3346:
	mov r15,r15
	
L_3348:
	cmp r15, 0
	je L_3349
	mov rbx,1
	mov r15,rbx
	jmp L_3350
	
L_3349:
	mov rbx,  [rsp+8*4]
	cmp rbx,r8
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_3350:
	cmp r15, 0
	je L_3353
	mov rbx,1
	mov r15,rbx
	jmp L_3354
	
L_3353:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_3351
	mov rbx,0
	mov r15,rbx
	jmp L_3352
	
L_3351:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3352:
	mov r15,r15
	
L_3354:
	mov r12,r15
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_3355
	mov rbx,0
	mov r15,rbx
	jmp L_3356
	
L_3355:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3356:
	cmp r15, 0
	je L_3361
	mov rbx,1
	mov r15,rbx
	jmp L_3362
	
L_3361:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_3357
	mov rbx,0
	mov r15,rbx
	jmp L_3358
	
L_3357:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3358:
	cmp r15, 0
	jne L_3359
	mov rbx,0
	mov r15,rbx
	jmp L_3360
	
L_3359:
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3360:
	mov r15,r15
	
L_3362:
	cmp r15, 0
	je L_3363
	mov rbx,1
	mov r15,rbx
	jmp L_3364
	
L_3363:
	mov rbx,  [rsp+8*4]
	cmp rbx,r8
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_3364:
	cmp r15, 0
	je L_3367
	mov rbx,1
	mov r15,rbx
	jmp L_3368
	
L_3367:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_3365
	mov rbx,0
	mov r15,rbx
	jmp L_3366
	
L_3365:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3366:
	mov r15,r15
	
L_3368:
	mov r13,r15
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_3369
	mov rbx,0
	mov r15,rbx
	jmp L_3370
	
L_3369:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3370:
	cmp r15, 0
	je L_3375
	mov rbx,1
	mov r15,rbx
	jmp L_3376
	
L_3375:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_3371
	mov rbx,0
	mov r15,rbx
	jmp L_3372
	
L_3371:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3372:
	cmp r15, 0
	jne L_3373
	mov rbx,0
	mov r15,rbx
	jmp L_3374
	
L_3373:
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3374:
	mov r15,r15
	
L_3376:
	cmp r15, 0
	je L_3377
	mov rbx,1
	mov r15,rbx
	jmp L_3378
	
L_3377:
	mov rbx,  [rsp+8*4]
	cmp rbx,r8
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_3378:
	cmp r15, 0
	je L_3381
	mov rbx,1
	mov r15,rbx
	jmp L_3382
	
L_3381:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_3379
	mov rbx,0
	mov r15,rbx
	jmp L_3380
	
L_3379:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_3380:
	mov r15,r15
	
L_3382:
	mov r14,r15
	cmp r9, 0
	je L_3384
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_3384:
	cmp r10, 0
	je L_3386
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_3386:
	cmp r11, 0
	je L_3388
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_3388:
	cmp r12, 0
	je L_3390
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_3390:
	cmp r13, 0
	je L_3392
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_3392:
	cmp r14, 0
	je L_3394
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_3394:
	mov rbx,1
	add r8,rbx
	jmp L_3296
	
L_3297:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*14],rbx
	jmp L_3293
	
L_3294:
	mov rbx,  [rsp+8*12]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*12],rbx
	jmp L_3290
	
L_3291:
	mov rbx,  [rsp+8*10]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*10],rbx
	jmp L_3287
	
L_3288:
	mov rbx,  [rsp+8*8]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*8],rbx
	jmp L_3284
	
L_3285:
	mov rbx,  [rsp+8*6]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*6],rbx
	jmp L_3281
	
L_3282:
	mov rbx,  [rsp+8*4]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*4],rbx
	jmp L_3278
	
L_3279:
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

