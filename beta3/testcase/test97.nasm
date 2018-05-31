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
	sub    rsp, 1144
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
        sub     rdx, 3128
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rdx,1
	mov rbx,rdx
	mov rdx,50
	mov rax,rdx
	mov qword [rsp+8*2],rbx
	mov rbx,1
	mov rdx,rbx
	mov rbx,50
	mov r11,rbx
	mov qword [rsp+8*3],rax
	mov rax,1
	mov rbx,rax
	mov rax,20
	mov r10,rax
	mov qword [rsp+8*4],rdx
	mov rdx,30
	mov rax,rdx
	mov qword [rsp+8*6],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*8],rax
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*9],rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*10],rbx
	mov rbx,0
	mov rdx,rbx
	mov rbx,  [rsp+8*2]
	mov r9,rbx
	mov qword [rsp+8*12],rdx
	mov qword [rsp+8*11],rax
	
L_3393:
	mov rbx,  [rsp+8*3]
	cmp r9,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*14],rdx
	je L_3394
	mov rdx,  [rsp+8*4]
	mov rbx,rdx
	mov qword [rsp+8*15],rbx
	
L_3396:
	mov rbx,  [rsp+8*15]
	cmp rbx,r11
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*16],rdx
	je L_3397
	mov rdx,  [rsp+8*6]
	mov rbx,rdx
	mov qword [rsp+8*17],rbx
	
L_3399:
	mov rbx,  [rsp+8*17]
	cmp rbx,r10
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*18],rdx
	je L_3400
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*8]
	mov rsi,rax
	mov qword [arg+8*2],rbx
	mov rbx,  [rsp+8*2]
	mov rdi,rbx
	mov r13,rdi
	mov r14,rsi
	mov rbx,  [arg+8*2]
	mov r15,rbx
	mov rdx,31
	mov rax,r15
	and rax,rdx
	mov r12,rax
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov rbx,rsi
	mov rdx,1
	mov qword [rsp+8*25],rax
	mov rax,r15
	add rax,rdx
	mov qword [rsp+8*28],rbx
	mov rbx,rax
	mov qword [rsp+8*30],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*29],rax
	
L_3756:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	mov rdx,  [rsp+8*33]
	add rdx,rdx
	cmp rax, 0
	mov qword [rsp+8*33],rdx
	mov qword [rsp+8*32],rax
	je L_3758
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov r13,rax
	mov rcx,rbx
	shl r13,cl
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*43],rdx
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov r13,rdi
	mov qword [rsp+8*44],rax
	mov rax,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*30],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*46],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*48],rdx
	mov rdx,r13
	mov rcx,rbx
	shr rdx,cl
	mov qword [rsp+8*49],rax
	mov rax,  [rsp+8*48]
	and rdx,rax
	mov rax,rdx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*50],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*48],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rdx
	mov rdx,rbx
	and rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*51],rax
	mov rax,rbx
	mov qword [rsp+8*52],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*54],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r13,rbx
	mov rcx,rax
	shl r13,cl
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*35],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*56],rdx
	mov qword [rsp+8*30],rbx
	mov rbx,  [rsp+8*31]
	mov rdx,rbx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*58],rdx
	jmp L_3756
	
L_3758:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*59],rax
	mov rax,rdx
	mov rsi,r12
	mov rdi,rax
	mov qword [rsp+8*60],rbx
	mov rbx,rdi
	mov qword [rsp+8*61],rdx
	mov rdx,rsi
	mov r13,rbx
	mov rcx,rdx
	shl r13,cl
	mov qword [rsp+8*62],rax
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*35],rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rdx
	mov rdx,r13
	mov qword [rsp+8*38],rax
	mov rax,rdx
	mov qword [rsp+8*40],rbx
	mov rbx,32
	mov qword [rsp+8*42],rdx
	mov rdx,rbx
	sub rdx,r12
	mov rsi,rdx
	mov qword [rsp+8*63],rax
	mov rax,  [rsp+8*62]
	mov rdi,rax
	mov r13,rdi
	mov rbx,rsi
	mov qword [rsp+8*64],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*46],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	mov qword [rsp+8*38],rdx
	mov rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,  [rsp+8*46]
	mov qword [rsp+8*47],rbx
	mov rbx,rdx
	mov rcx,rax
	shr rbx,cl
	mov rbx,rbx
	mov rcx,1
	shl rbx,cl
	mov qword [rsp+8*48],rdx
	mov rdx,1
	add rbx,rdx
	mov rax,rbx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*49],rbx
	mov rbx,r13
	mov rcx,rdx
	shr rbx,cl
	and rbx,rax
	mov rax,rbx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*50],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*48],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,  [rsp+8*48]
	mov qword [rsp+8*40],rbx
	mov rbx,rdx
	and rbx,rax
	mov qword [rsp+8*52],rbx
	mov rdx,  [rsp+8*52]
	mov rbx,rdx
	mov qword [rsp+8*51],rax
	mov rax,rbx
	mov rdx,  [rsp+8*63]
	mov qword [rsp+8*53],rbx
	mov rbx,rdx
	or rbx,rax
	mov qword [rsp+8*66],rbx
	mov rdx,  [rsp+8*66]
	mov rbx,rdx
	mov qword [rsp+8*65],rax
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*68],rax
	mov qword [rsp+8*67],rbx
	mov rbx,  [rsp+8*17]
	mov rax,rbx
	mov qword [rsp+8*69],rdx
	mov rdx,  [rsp+8*8]
	mov rsi,rdx
	mov rdi,r9
	mov r13,rdi
	mov r14,rsi
	mov r15,rax
	mov rbx,31
	mov rdx,r15
	and rdx,rbx
	mov r12,rdx
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov qword [arg+8*2],rax
	mov rax,rsi
	mov rbx,1
	mov qword [rsp+8*25],rdx
	mov rdx,r15
	add rdx,rbx
	mov qword [rsp+8*28],rax
	mov rax,rdx
	mov qword [rsp+8*29],rdx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rax
	
L_3788:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	mov rdx,  [rsp+8*33]
	add rdx,rdx
	cmp rax, 0
	mov qword [rsp+8*33],rdx
	mov qword [rsp+8*32],rax
	je L_3790
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov r13,rax
	mov rcx,rbx
	shl r13,cl
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*43],rdx
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov r13,rdi
	mov qword [rsp+8*44],rax
	mov rax,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*30],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*46],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*48],rdx
	mov rdx,r13
	mov rcx,rbx
	shr rdx,cl
	mov qword [rsp+8*49],rax
	mov rax,  [rsp+8*48]
	and rdx,rax
	mov rax,rdx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*50],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*48],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rdx
	mov rdx,rbx
	and rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*51],rax
	mov rax,rbx
	mov qword [rsp+8*52],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*54],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r13,rbx
	mov rcx,rax
	shl r13,cl
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*35],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*56],rdx
	mov qword [rsp+8*30],rbx
	mov rbx,  [rsp+8*31]
	mov rdx,rbx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*58],rdx
	jmp L_3788
	
L_3790:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*59],rax
	mov rax,rdx
	mov rsi,r12
	mov rdi,rax
	mov qword [rsp+8*60],rbx
	mov rbx,rdi
	mov qword [rsp+8*61],rdx
	mov rdx,rsi
	mov r13,rbx
	mov rcx,rdx
	shl r13,cl
	mov qword [rsp+8*62],rax
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*35],rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rdx
	mov rdx,r13
	mov qword [rsp+8*38],rax
	mov rax,rdx
	mov qword [rsp+8*40],rbx
	mov rbx,32
	mov qword [rsp+8*42],rdx
	mov rdx,rbx
	sub rdx,r12
	mov rsi,rdx
	mov qword [rsp+8*63],rax
	mov rax,  [rsp+8*62]
	mov rdi,rax
	mov r13,rdi
	mov rbx,rsi
	mov qword [rsp+8*64],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*46],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	mov qword [rsp+8*38],rdx
	mov rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,  [rsp+8*46]
	mov qword [rsp+8*47],rbx
	mov rbx,rdx
	mov rcx,rax
	shr rbx,cl
	mov rbx,rbx
	mov rcx,1
	shl rbx,cl
	mov qword [rsp+8*48],rdx
	mov rdx,1
	add rbx,rdx
	mov rax,rbx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*49],rbx
	mov rbx,r13
	mov rcx,rdx
	shr rbx,cl
	and rbx,rax
	mov rax,rbx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*50],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*48],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,  [rsp+8*48]
	mov qword [rsp+8*40],rbx
	mov rbx,rdx
	and rbx,rax
	mov qword [rsp+8*52],rbx
	mov rdx,  [rsp+8*52]
	mov rbx,rdx
	mov qword [rsp+8*51],rax
	mov rax,rbx
	mov rdx,  [rsp+8*63]
	mov qword [rsp+8*53],rbx
	mov rbx,rdx
	or rbx,rax
	mov qword [rsp+8*66],rbx
	mov rdx,  [rsp+8*66]
	mov rbx,rdx
	mov qword [rsp+8*65],rax
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*70],rax
	mov qword [rsp+8*67],rbx
	mov rbx,  [rsp+8*17]
	mov rax,rbx
	mov qword [rsp+8*71],rdx
	mov rdx,  [rsp+8*8]
	mov rsi,rdx
	mov rbx,  [rsp+8*15]
	mov rdi,rbx
	mov r13,rdi
	mov r14,rsi
	mov r15,rax
	mov rdx,31
	mov rbx,r15
	and rbx,rdx
	mov r12,rbx
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov qword [arg+8*2],rax
	mov rax,rsi
	mov rdx,1
	mov qword [rsp+8*25],rbx
	mov rbx,r15
	add rbx,rdx
	mov qword [rsp+8*28],rax
	mov rax,rbx
	mov qword [rsp+8*29],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*30],rax
	
L_3820:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	mov rdx,  [rsp+8*33]
	add rdx,rdx
	cmp rax, 0
	mov qword [rsp+8*33],rdx
	mov qword [rsp+8*32],rax
	je L_3822
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov r13,rax
	mov rcx,rbx
	shl r13,cl
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*43],rdx
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov r13,rdi
	mov qword [rsp+8*44],rax
	mov rax,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*30],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*46],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*48],rdx
	mov rdx,r13
	mov rcx,rbx
	shr rdx,cl
	mov qword [rsp+8*49],rax
	mov rax,  [rsp+8*48]
	and rdx,rax
	mov rax,rdx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*50],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*48],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rdx
	mov rdx,rbx
	and rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*51],rax
	mov rax,rbx
	mov qword [rsp+8*52],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*54],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r13,rbx
	mov rcx,rax
	shl r13,cl
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*35],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*56],rdx
	mov qword [rsp+8*30],rbx
	mov rbx,  [rsp+8*31]
	mov rdx,rbx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*58],rdx
	jmp L_3820
	
L_3822:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*59],rax
	mov rax,rdx
	mov rsi,r12
	mov rdi,rax
	mov qword [rsp+8*60],rbx
	mov rbx,rdi
	mov qword [rsp+8*61],rdx
	mov rdx,rsi
	mov r13,rbx
	mov rcx,rdx
	shl r13,cl
	mov qword [rsp+8*62],rax
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*35],rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rdx
	mov rdx,r13
	mov qword [rsp+8*38],rax
	mov rax,rdx
	mov qword [rsp+8*40],rbx
	mov rbx,32
	mov qword [rsp+8*42],rdx
	mov rdx,rbx
	sub rdx,r12
	mov rsi,rdx
	mov qword [rsp+8*63],rax
	mov rax,  [rsp+8*62]
	mov rdi,rax
	mov r13,rdi
	mov rbx,rsi
	mov qword [rsp+8*64],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*46],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	mov qword [rsp+8*38],rdx
	mov rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,  [rsp+8*46]
	mov qword [rsp+8*47],rbx
	mov rbx,rdx
	mov rcx,rax
	shr rbx,cl
	mov rbx,rbx
	mov rcx,1
	shl rbx,cl
	mov qword [rsp+8*48],rdx
	mov rdx,1
	add rbx,rdx
	mov rax,rbx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*49],rbx
	mov rbx,r13
	mov rcx,rdx
	shr rbx,cl
	and rbx,rax
	mov rax,rbx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*50],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*48],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,  [rsp+8*48]
	mov qword [rsp+8*40],rbx
	mov rbx,rdx
	and rbx,rax
	mov qword [rsp+8*52],rbx
	mov rdx,  [rsp+8*52]
	mov rbx,rdx
	mov qword [rsp+8*51],rax
	mov rax,rbx
	mov rdx,  [rsp+8*63]
	mov qword [rsp+8*53],rbx
	mov rbx,rdx
	or rbx,rax
	mov qword [rsp+8*66],rbx
	mov rdx,  [rsp+8*66]
	mov rbx,rdx
	mov qword [rsp+8*65],rax
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*72],rax
	mov rax,  [rsp+8*15]
	mov qword [rsp+8*67],rbx
	mov rbx,r9
	xor rbx,rax
	mov qword [rsp+8*73],rdx
	mov qword [rsp+8*74],rbx
	mov rbx,  [rsp+8*17]
	mov rdx,rbx
	mov rax,  [rsp+8*8]
	mov rsi,rax
	mov rax,  [rsp+8*74]
	mov rdi,rax
	mov r13,rdi
	mov r14,rsi
	mov r15,rdx
	mov qword [arg+8*2],rdx
	mov rdx,31
	mov rax,r15
	and rax,rdx
	mov r12,rax
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov rdx,rsi
	mov rax,1
	mov rbx,r15
	add rbx,rax
	mov qword [rsp+8*28],rdx
	mov rdx,rbx
	mov qword [rsp+8*29],rbx
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*30],rdx
	mov qword [rsp+8*31],rax
	
L_3852:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	mov rdx,  [rsp+8*33]
	add rdx,rdx
	cmp rax, 0
	mov qword [rsp+8*33],rdx
	mov qword [rsp+8*32],rax
	je L_3854
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov r13,rax
	mov rcx,rbx
	shl r13,cl
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*43],rdx
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov r13,rdi
	mov qword [rsp+8*44],rax
	mov rax,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*30],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*46],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*48],rdx
	mov rdx,r13
	mov rcx,rbx
	shr rdx,cl
	mov qword [rsp+8*49],rax
	mov rax,  [rsp+8*48]
	and rdx,rax
	mov rax,rdx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*50],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*48],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rdx
	mov rdx,rbx
	and rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*51],rax
	mov rax,rbx
	mov qword [rsp+8*52],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*54],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r13,rbx
	mov rcx,rax
	shl r13,cl
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*35],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*56],rdx
	mov qword [rsp+8*30],rbx
	mov rbx,  [rsp+8*31]
	mov rdx,rbx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*58],rdx
	jmp L_3852
	
L_3854:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*59],rax
	mov rax,rdx
	mov rsi,r12
	mov rdi,rax
	mov qword [rsp+8*61],rdx
	mov rdx,rdi
	mov qword [rsp+8*60],rbx
	mov rbx,rsi
	mov r13,rdx
	mov rcx,rbx
	shl r13,cl
	mov qword [rsp+8*62],rax
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*34],rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rdx
	mov rdx,r13
	mov qword [rsp+8*38],rax
	mov rax,rdx
	mov qword [rsp+8*40],rbx
	mov rbx,32
	mov qword [rsp+8*42],rdx
	mov rdx,rbx
	sub rdx,r12
	mov rsi,rdx
	mov rbx,  [rsp+8*62]
	mov rdi,rbx
	mov r13,rdi
	mov rbx,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*63],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*46],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	mov qword [rsp+8*38],rdx
	mov rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,  [rsp+8*46]
	mov qword [rsp+8*47],rbx
	mov rbx,rdx
	mov rcx,rax
	shr rbx,cl
	mov rbx,rbx
	mov rcx,1
	shl rbx,cl
	mov qword [rsp+8*48],rdx
	mov rdx,1
	add rbx,rdx
	mov rax,rbx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*49],rbx
	mov rbx,r13
	mov rcx,rdx
	shr rbx,cl
	and rbx,rax
	mov rax,rbx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*50],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*48],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,  [rsp+8*48]
	mov qword [rsp+8*40],rbx
	mov rbx,rdx
	and rbx,rax
	mov qword [rsp+8*52],rbx
	mov rdx,  [rsp+8*52]
	mov rbx,rdx
	mov qword [rsp+8*51],rax
	mov rax,rbx
	mov rdx,  [rsp+8*63]
	mov qword [rsp+8*53],rbx
	mov rbx,rdx
	or rbx,rax
	mov rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*67],rdx
	mov rdx,rbx
	mov qword [rsp+8*75],rbx
	mov rbx,1
	mov rsi,rbx
	mov rbx,  [rsp+8*17]
	mov rdi,rbx
	mov r15,rdi
	mov qword [rsp+8*65],rax
	mov rax,rsi
	mov qword [rsp+8*76],rdx
	mov rdx,1
	mov rbx,r15
	add rbx,rdx
	mov qword [rsp+8*28],rax
	mov rax,rbx
	mov qword [rsp+8*29],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*30],rax
	
L_3564:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	mov rdx,  [rsp+8*33]
	add rdx,rdx
	cmp rax, 0
	mov qword [rsp+8*33],rdx
	mov qword [rsp+8*32],rax
	je L_3566
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov r13,rax
	mov rcx,rbx
	shl r13,cl
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*43],rdx
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov r13,rdi
	mov qword [rsp+8*44],rax
	mov rax,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*30],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*46],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*48],rdx
	mov rdx,r13
	mov rcx,rbx
	shr rdx,cl
	mov qword [rsp+8*49],rax
	mov rax,  [rsp+8*48]
	and rdx,rax
	mov rax,rdx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*50],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*48],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rdx
	mov rdx,rbx
	and rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*51],rax
	mov rax,rbx
	mov qword [rsp+8*52],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*54],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r13,rbx
	mov rcx,rax
	shl r13,cl
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*35],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*56],rdx
	mov qword [rsp+8*30],rbx
	mov rbx,  [rsp+8*31]
	mov rdx,rbx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*58],rdx
	jmp L_3564
	
L_3566:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov r14,rbx
	mov rdx,1
	mov rsi,rdx
	mov rdx,  [rsp+8*15]
	mov rdi,rdx
	mov r15,rdi
	mov qword [rsp+8*59],rax
	mov rax,rsi
	mov qword [rsp+8*60],rbx
	mov rbx,1
	mov rdx,r15
	add rdx,rbx
	mov qword [rsp+8*28],rax
	mov rax,rdx
	mov qword [rsp+8*29],rdx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rax
	
L_3584:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	mov rdx,  [rsp+8*33]
	add rdx,rdx
	cmp rax, 0
	mov qword [rsp+8*33],rdx
	mov qword [rsp+8*32],rax
	je L_3586
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov r13,rax
	mov rcx,rbx
	shl r13,cl
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*43],rdx
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov r13,rdi
	mov qword [rsp+8*44],rax
	mov rax,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*30],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*46],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*48],rdx
	mov rdx,r13
	mov rcx,rbx
	shr rdx,cl
	mov qword [rsp+8*49],rax
	mov rax,  [rsp+8*48]
	and rdx,rax
	mov rax,rdx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*50],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*48],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rdx
	mov rdx,rbx
	and rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*51],rax
	mov rax,rbx
	mov qword [rsp+8*52],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*54],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r13,rbx
	mov rcx,rax
	shl r13,cl
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*35],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*56],rdx
	mov qword [rsp+8*30],rbx
	mov rbx,  [rsp+8*31]
	mov rdx,rbx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*58],rdx
	jmp L_3584
	
L_3586:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov r15,rbx
	xor r14,r15
	mov rdx,1
	mov rsi,rdx
	mov rdi,r9
	mov r15,rdi
	mov rdx,rsi
	mov qword [rsp+8*59],rax
	mov rax,1
	mov qword [rsp+8*60],rbx
	mov rbx,r15
	add rbx,rax
	mov qword [rsp+8*28],rdx
	mov rdx,rbx
	mov qword [rsp+8*29],rbx
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*30],rdx
	mov qword [rsp+8*31],rax
	
L_3604:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	mov rdx,  [rsp+8*33]
	add rdx,rdx
	cmp rax, 0
	mov qword [rsp+8*33],rdx
	mov qword [rsp+8*32],rax
	je L_3606
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov r13,rax
	mov rcx,rbx
	shl r13,cl
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*43],rdx
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov r13,rdi
	mov qword [rsp+8*44],rax
	mov rax,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*30],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*46],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*48],rdx
	mov rdx,r13
	mov rcx,rbx
	shr rdx,cl
	mov qword [rsp+8*49],rax
	mov rax,  [rsp+8*48]
	and rdx,rax
	mov rax,rdx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*50],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*48],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rdx
	mov rdx,rbx
	and rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*51],rax
	mov rax,rbx
	mov qword [rsp+8*52],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*54],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r13,rbx
	mov rcx,rax
	shl r13,cl
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*35],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*56],rdx
	mov qword [rsp+8*30],rbx
	mov rbx,  [rsp+8*31]
	mov rdx,rbx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*58],rdx
	jmp L_3604
	
L_3606:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov r15,rbx
	xor r14,r15
	mov r14,r14
	mov rdx,  [rsp+8*69]
	mov r15,rdx
	xor r15,r14
	mov rdx,1
	mov rsi,rdx
	mov rdi,r15
	mov r15,rdi
	mov rdx,rsi
	mov qword [rsp+8*59],rax
	mov rax,1
	mov qword [rsp+8*60],rbx
	mov rbx,r15
	add rbx,rax
	mov qword [rsp+8*28],rdx
	mov rdx,rbx
	mov qword [rsp+8*29],rbx
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*30],rdx
	mov qword [rsp+8*31],rax
	
L_3624:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	mov rdx,  [rsp+8*33]
	add rdx,rdx
	cmp rax, 0
	mov qword [rsp+8*33],rdx
	mov qword [rsp+8*32],rax
	je L_3626
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov r13,rax
	mov rcx,rbx
	shl r13,cl
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*43],rdx
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov r13,rdi
	mov qword [rsp+8*44],rax
	mov rax,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*30],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*46],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*48],rdx
	mov rdx,r13
	mov rcx,rbx
	shr rdx,cl
	mov qword [rsp+8*49],rax
	mov rax,  [rsp+8*48]
	and rdx,rax
	mov rax,rdx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*50],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*48],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rdx
	mov rdx,rbx
	and rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*51],rax
	mov rax,rbx
	mov qword [rsp+8*52],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*54],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r13,rbx
	mov rcx,rax
	shl r13,cl
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*35],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*56],rdx
	mov qword [rsp+8*30],rbx
	mov rbx,  [rsp+8*31]
	mov rdx,rbx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*58],rdx
	jmp L_3624
	
L_3626:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*59],rax
	mov rax,  [rsp+8*9]
	mov qword [rsp+8*60],rbx
	mov rbx,rax
	add rbx,rdx
	mov rax,rbx
	mov rbx,  [rsp+8*71]
	mov qword [rsp+8*83],rdx
	mov rdx,rbx
	xor rdx,r14
	mov rbx,1
	mov rsi,rbx
	mov rdi,rdx
	mov r15,rdi
	mov rbx,rsi
	mov rdx,1
	mov qword [rsp+8*9],rax
	mov rax,r15
	add rax,rdx
	mov qword [rsp+8*28],rbx
	mov rbx,rax
	mov qword [rsp+8*30],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*29],rax
	
L_3644:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	mov rdx,  [rsp+8*33]
	add rdx,rdx
	cmp rax, 0
	mov qword [rsp+8*33],rdx
	mov qword [rsp+8*32],rax
	je L_3646
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov r13,rax
	mov rcx,rbx
	shl r13,cl
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*43],rdx
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov r13,rdi
	mov qword [rsp+8*44],rax
	mov rax,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*30],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*46],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*48],rdx
	mov rdx,r13
	mov rcx,rbx
	shr rdx,cl
	mov qword [rsp+8*49],rax
	mov rax,  [rsp+8*48]
	and rdx,rax
	mov rax,rdx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*50],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*48],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rdx
	mov rdx,rbx
	and rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*51],rax
	mov rax,rbx
	mov qword [rsp+8*52],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*54],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r13,rbx
	mov rcx,rax
	shl r13,cl
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*35],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*56],rdx
	mov qword [rsp+8*30],rbx
	mov rbx,  [rsp+8*31]
	mov rdx,rbx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*58],rdx
	jmp L_3644
	
L_3646:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*59],rax
	mov rax,  [rsp+8*10]
	mov qword [rsp+8*60],rbx
	mov rbx,rax
	add rbx,rdx
	mov rax,rbx
	mov rbx,  [rsp+8*73]
	mov r15,rbx
	xor r15,r14
	mov rbx,1
	mov rsi,rbx
	mov rdi,r15
	mov r15,rdi
	mov rbx,rsi
	mov qword [rsp+8*86],rdx
	mov rdx,1
	mov qword [rsp+8*10],rax
	mov rax,r15
	add rax,rdx
	mov qword [rsp+8*28],rbx
	mov rbx,rax
	mov qword [rsp+8*30],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*29],rax
	
L_3664:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	mov rdx,  [rsp+8*33]
	add rdx,rdx
	cmp rax, 0
	mov qword [rsp+8*33],rdx
	mov qword [rsp+8*32],rax
	je L_3666
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov r13,rax
	mov rcx,rbx
	shl r13,cl
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*43],rdx
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov r13,rdi
	mov qword [rsp+8*44],rax
	mov rax,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*30],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*46],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*48],rdx
	mov rdx,r13
	mov rcx,rbx
	shr rdx,cl
	mov qword [rsp+8*49],rax
	mov rax,  [rsp+8*48]
	and rdx,rax
	mov rax,rdx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*50],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*48],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rdx
	mov rdx,rbx
	and rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*51],rax
	mov rax,rbx
	mov qword [rsp+8*52],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*54],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r13,rbx
	mov rcx,rax
	shl r13,cl
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*35],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*56],rdx
	mov qword [rsp+8*30],rbx
	mov rbx,  [rsp+8*31]
	mov rdx,rbx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*58],rdx
	jmp L_3664
	
L_3666:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov r15,rbx
	mov rdx,  [rsp+8*11]
	add r15,rdx
	mov rdx,r15
	mov qword [rsp+8*59],rax
	mov rax,  [rsp+8*76]
	mov r15,rax
	xor r15,r14
	mov rax,1
	mov rsi,rax
	mov rdi,r15
	mov r15,rdi
	mov rax,rsi
	mov qword [rsp+8*60],rbx
	mov rbx,1
	mov qword [rsp+8*11],rdx
	mov rdx,r15
	add rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*28],rax
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rdx
	
L_3684:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	mov rdx,  [rsp+8*33]
	add rdx,rdx
	cmp rax, 0
	mov qword [rsp+8*33],rdx
	mov qword [rsp+8*32],rax
	je L_3686
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov r13,rax
	mov rcx,rbx
	shl r13,cl
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*37],rax
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*43],rdx
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov r13,rdi
	mov rdx,rsi
	mov rax,65535
	mov rsi,rax
	mov rax,32767
	mov rdi,rax
	mov rax,rdi
	mov qword [rsp+8*30],rbx
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov qword [rsp+8*46],rdx
	mov rdx,r15
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*47],rax
	mov rax,  [rsp+8*46]
	mov qword [rsp+8*40],rdx
	mov rdx,rbx
	mov rcx,rax
	shr rdx,cl
	mov rdx,rdx
	mov rcx,1
	shl rdx,cl
	mov qword [rsp+8*48],rbx
	mov rbx,1
	add rdx,rbx
	mov rbx,rdx
	mov rdx,r13
	mov rcx,rax
	shr rdx,cl
	and rdx,rbx
	mov rbx,rdx
	mov rdx,65535
	mov rsi,rdx
	mov rdx,65535
	mov rdi,rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov qword [rsp+8*48],rbx
	mov rbx,r15
	mov qword [rsp+8*37],rdx
	mov rdx,rbx
	mov qword [rsp+8*38],rax
	mov rax,  [rsp+8*48]
	mov qword [rsp+8*40],rbx
	mov rbx,rax
	and rbx,rdx
	mov qword [rsp+8*51],rdx
	mov rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*53],rdx
	mov rdx,  [rsp+8*30]
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*54],rbx
	mov rbx,5
	mov rsi,rbx
	mov rdi,rdx
	mov rbx,rdi
	mov rax,rsi
	mov r13,rbx
	mov rcx,rax
	shl r13,cl
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rbx,65535
	mov rdi,rbx
	mov rbx,rdi
	mov qword [rsp+8*35],rax
	mov rax,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov qword [rsp+8*37],rbx
	mov rbx,r15
	mov r15,rbx
	and r13,r15
	mov qword [rsp+8*40],rbx
	mov rbx,r13
	mov qword [rsp+8*38],rax
	mov rax,rbx
	mov qword [rsp+8*42],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*56],rax
	mov rax,  [rsp+8*31]
	mov rbx,rax
	mov qword [rsp+8*58],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*30],rdx
	mov qword [rsp+8*31],rax
	jmp L_3684
	
L_3686:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov r15,rbx
	mov qword [rsp+8*60],rbx
	mov rbx,  [rsp+8*12]
	add r15,rbx
	mov rbx,r15
	mov rax,  [rsp+8*17]
	mov rdx,rax
	mov qword [rsp+8*94],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*12],rbx
	mov qword [rsp+8*17],rax
	jmp L_3399
	
L_3400:
	mov rdx,  [rsp+8*15]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*95],rbx
	mov qword [rsp+8*15],rdx
	jmp L_3396
	
L_3397:
	mov rbx,r9
	mov rdx,1
	add r9,rdx
	mov qword [rsp+8*96],rbx
	jmp L_3393
	
L_3394:
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,t127
	mov r12,rax
	mov rbx,28
	mov r13,rbx
	mov qword [rsp+8*97],rdx
	
L_3476:
	mov rbx,0
	cmp r13,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_3477
	mov rbx,  [rsp+8*97]
	mov r15,rbx
	mov rcx,r13
	shr r15,cl
	mov rdx,15
	and r15,rdx
	mov r15,r15
	mov rax,10
	cmp r15,rax
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_3478
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_3479
	mov rbx,0
	mov r15,rbx
	jmp L_3480
	
L_3479:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_3480:
	cmp r15, 0
	je L_3481
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	mov r15,r15
	jmp L_3483
	
L_3481:
	mov rbx,t125
	mov r15,rbx
	
L_3483:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
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
	mov r12,r15
	jmp L_3484
	
L_3478:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_3485
	mov rbx,0
	mov r15,rbx
	jmp L_3486
	
L_3485:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_3486:
	cmp r15, 0
	je L_3487
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	mov r15,r15
	jmp L_3489
	
L_3487:
	mov rbx,t125
	mov r15,rbx
	
L_3489:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
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
	mov r12,r15
	
L_3484:
	mov rbx,4
	mov r15,r13
	sub r15,rbx
	mov r13,r15
	jmp L_3476
	
L_3477:
	mov r15,r12
	mov r15,r15
	mov     rsi, t222
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
	mov rbx,  [rsp+8*10]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,t127
	mov r12,rax
	mov rbx,28
	mov r13,rbx
	mov qword [rsp+8*97],rdx
	
L_3493:
	mov rbx,0
	cmp r13,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_3494
	mov rbx,  [rsp+8*97]
	mov r15,rbx
	mov rcx,r13
	shr r15,cl
	mov rdx,15
	and r15,rdx
	mov r15,r15
	mov rax,10
	cmp r15,rax
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_3495
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_3496
	mov rbx,0
	mov r15,rbx
	jmp L_3497
	
L_3496:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_3497:
	cmp r15, 0
	je L_3498
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	mov r15,r15
	jmp L_3500
	
L_3498:
	mov rbx,t125
	mov r15,rbx
	
L_3500:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
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
	mov r12,r15
	jmp L_3501
	
L_3495:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_3502
	mov rbx,0
	mov r15,rbx
	jmp L_3503
	
L_3502:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_3503:
	cmp r15, 0
	je L_3504
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	mov r15,r15
	jmp L_3506
	
L_3504:
	mov rbx,t125
	mov r15,rbx
	
L_3506:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
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
	mov r12,r15
	
L_3501:
	mov rbx,4
	mov r15,r13
	sub r15,rbx
	mov r13,r15
	jmp L_3493
	
L_3494:
	mov r15,r12
	mov r15,r15
	mov     rsi, t229
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
	mov rbx,  [rsp+8*11]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,t127
	mov r12,rax
	mov rbx,28
	mov r13,rbx
	mov qword [rsp+8*97],rdx
	
L_3510:
	mov rbx,0
	cmp r13,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_3511
	mov rbx,  [rsp+8*97]
	mov r15,rbx
	mov rcx,r13
	shr r15,cl
	mov rdx,15
	and r15,rdx
	mov r15,r15
	mov rax,10
	cmp r15,rax
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_3512
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_3513
	mov rbx,0
	mov r15,rbx
	jmp L_3514
	
L_3513:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_3514:
	cmp r15, 0
	je L_3515
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	mov r15,r15
	jmp L_3517
	
L_3515:
	mov rbx,t125
	mov r15,rbx
	
L_3517:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
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
	mov r12,r15
	jmp L_3518
	
L_3512:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_3519
	mov rbx,0
	mov r15,rbx
	jmp L_3520
	
L_3519:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_3520:
	cmp r15, 0
	je L_3521
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	mov r15,r15
	jmp L_3523
	
L_3521:
	mov rbx,t125
	mov r15,rbx
	
L_3523:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
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
	mov r12,r15
	
L_3518:
	mov rbx,4
	mov r15,r13
	sub r15,rbx
	mov r13,r15
	jmp L_3510
	
L_3511:
	mov r15,r12
	mov r15,r15
	mov     rsi, t236
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
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,t127
	mov r12,rax
	mov rbx,28
	mov r13,rbx
	mov qword [rsp+8*97],rdx
	
L_3527:
	mov rbx,0
	cmp r13,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_3528
	mov rbx,  [rsp+8*97]
	mov r15,rbx
	mov rcx,r13
	shr r15,cl
	mov rdx,15
	and r15,rdx
	mov r15,r15
	mov rax,10
	cmp r15,rax
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_3529
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_3530
	mov rbx,0
	mov r15,rbx
	jmp L_3531
	
L_3530:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_3531:
	cmp r15, 0
	je L_3532
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	mov r15,r15
	jmp L_3534
	
L_3532:
	mov rbx,t125
	mov r15,rbx
	
L_3534:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
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
	mov r12,r15
	jmp L_3535
	
L_3529:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_3536
	mov rbx,0
	mov r15,rbx
	jmp L_3537
	
L_3536:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_3537:
	cmp r15, 0
	je L_3538
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rdx,r10
	mov qword [arg+8*63],rdx
	mov     rsi, rsi
	mov     rdi, rdi
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	mov r15,r15
	jmp L_3540
	
L_3538:
	mov rbx,t125
	mov r15,rbx
	
L_3540:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
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
	mov r12,r15
	
L_3535:
	mov rbx,4
	mov r15,r13
	sub r15,rbx
	mov r13,r15
	jmp L_3527
	
L_3528:
	mov r15,r12
	mov r15,r15
	mov     rsi, t243
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
	mov rbx,t248
	mov rdi,rbx
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
	sub    rsp, 1144
	mov rdx,t109
	mov rbx,rdx
	mov qword [gbl+8*108],rbx
	mov rbx,  [rsp+8*135]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   3128
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

t229:
	 db 1," " ,0

t109:
	 db 95," !",34,"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[",92,"]^_`abcdefghijklmnopqrstuvwxyz{|}~" ,0

t236:
	 db 1," " ,0

t125:
	 db 0,"" ,0

t127:
	 db 0,"" ,0

t248:
	 db 0,"" ,0

t243:
	 db 1," " ,0

t222:
	 db 1," " ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

