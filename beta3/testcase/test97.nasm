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
	sub    rsp, 7200
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
        sub     rdx, 9184
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
	mov qword [rsp+8*3],rax
	mov rax,50
	mov rbx,rax
	mov qword [rsp+8*4],rdx
	mov rdx,1
	mov rax,rdx
	mov qword [rsp+8*5],rbx
	mov rbx,20
	mov rdx,rbx
	mov qword [rsp+8*6],rax
	mov rax,30
	mov rbx,rax
	mov qword [rsp+8*7],rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*8],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*9],rax
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*10],rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*11],rbx
	mov rbx,  [rsp+8*2]
	mov rdx,rbx
	mov qword [rsp+8*13],rdx
	mov qword [rsp+8*12],rax
	
L_1985:
	mov rbx,  [rsp+8*13]
	mov rdx,  [rsp+8*3]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1986
	mov rbx,  [rsp+8*4]
	mov r8,rbx
	
L_1988:
	mov rbx,  [rsp+8*5]
	cmp r8,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1989
	mov rdx,  [rsp+8*6]
	mov rbx,rdx
	mov qword [rsp+8*17],rbx
	
L_1991:
	mov rbx,  [rsp+8*17]
	mov rdx,  [rsp+8*7]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1992
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*8]
	mov rsi,rax
	mov qword [arg+8*2],rbx
	mov rbx,  [rsp+8*2]
	mov rdi,rbx
	mov rbx,rdi
	mov r14,rsi
	mov rdx,  [arg+8*2]
	mov r15,rdx
	mov rax,31
	and r15,rax
	mov r13,r15
	mov rsi,r14
	mov rdi,rbx
	mov r15,rdi
	mov qword [rsp+8*22],rbx
	mov rbx,rsi
	mov rdx,1
	add r15,rdx
	mov rax,r15
	mov qword [rsp+8*28],rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rax
	
L_2338:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*32],rax
	je L_2339
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*33],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*35],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov rax,rdx
	mov rcx,16
	shl rax,cl
	or rax,rbx
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,rbx
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*35]
	and rbx,rdx
	mov qword [rsp+8*40],rdx
	mov rdx,rbx
	mov qword [rsp+8*35],rbx
	mov rbx,rdx
	mov qword [rsp+8*41],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*38],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*42],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*43],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*44],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*45],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*46],rbx
	mov rbx,rax
	mov qword [rsp+8*47],rdx
	mov rdx,rbx
	mov qword [rsp+8*49],rbx
	mov rbx,rdx
	mov qword [rsp+8*50],rdx
	mov rdx,  [rsp+8*45]
	mov qword [rsp+8*48],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov qword [rsp+8*51],rbx
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*52],rax
	mov rax,  [rsp+8*44]
	mov rbx,  [rsp+8*45]
	mov qword [rsp+8*51],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rbx,  [rsp+8*51]
	and rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*53],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*51],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*54],rbx
	mov rbx,rax
	mov qword [rsp+8*55],rdx
	mov rdx,rbx
	mov qword [rsp+8*57],rbx
	mov rbx,  [rsp+8*51]
	mov qword [rsp+8*56],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*58],rdx
	mov rdx,rbx
	mov qword [rsp+8*60],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*59],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*61],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*62],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rbx
	mov rbx,rax
	mov rcx,rdx
	shl rbx,cl
	mov qword [rsp+8*64],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*63],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*65],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*66],rbx
	mov rbx,rax
	mov qword [rsp+8*67],rdx
	mov rdx,rbx
	mov qword [rsp+8*69],rbx
	mov rbx,  [rsp+8*65]
	and rbx,rdx
	mov qword [rsp+8*70],rdx
	mov rdx,rbx
	mov qword [rsp+8*65],rbx
	mov rbx,rdx
	mov qword [rsp+8*71],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*68],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	mov rax,  [rsp+8*31]
	mov rbx,rax
	mov qword [rsp+8*74],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*30],rdx
	mov qword [rsp+8*31],rax
	jmp L_2338
	
L_2339:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*75],rax
	mov rax,rbx
	mov qword [rsp+8*76],rbx
	mov rbx,rax
	mov rsi,r13
	mov rdi,rbx
	mov qword [rsp+8*77],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*78],rbx
	mov rbx,rax
	mov rcx,rdx
	shl rbx,cl
	mov qword [rsp+8*80],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*79],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*81],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*82],rbx
	mov rbx,rax
	mov qword [rsp+8*83],rdx
	mov rdx,rbx
	mov qword [rsp+8*85],rbx
	mov rbx,  [rsp+8*81]
	and rbx,rdx
	mov qword [rsp+8*86],rdx
	mov rdx,rbx
	mov qword [rsp+8*81],rbx
	mov rbx,rdx
	mov qword [rsp+8*87],rdx
	mov rdx,32
	mov qword [rsp+8*84],rax
	mov rax,rdx
	sub rax,r13
	mov rsi,rax
	mov qword [rsp+8*89],rax
	mov rax,  [rsp+8*78]
	mov rdi,rax
	mov rax,rdi
	mov qword [rsp+8*88],rbx
	mov rbx,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*90],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*91],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*92],rbx
	mov rbx,rax
	mov qword [rsp+8*93],rdx
	mov rdx,rbx
	mov qword [rsp+8*95],rbx
	mov rbx,rdx
	mov qword [rsp+8*96],rdx
	mov rdx,  [rsp+8*91]
	mov qword [rsp+8*94],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov qword [rsp+8*97],rbx
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*98],rax
	mov rax,  [rsp+8*90]
	mov rbx,  [rsp+8*91]
	mov qword [rsp+8*97],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rbx,  [rsp+8*97]
	and rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*99],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*97],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*100],rbx
	mov rbx,rax
	mov qword [rsp+8*101],rdx
	mov rdx,rbx
	mov qword [rsp+8*103],rbx
	mov rbx,  [rsp+8*97]
	mov qword [rsp+8*102],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*104],rdx
	mov rdx,rbx
	mov qword [rsp+8*106],rbx
	mov rbx,  [rsp+8*88]
	mov qword [rsp+8*105],rax
	mov rax,rbx
	or rax,rdx
	mov rbx,rax
	mov r15,rbx
	mov qword [rsp+8*109],rbx
	mov rbx,r15
	mov qword [rsp+8*107],rdx
	mov qword [rsp+8*108],rax
	mov rax,  [rsp+8*17]
	mov rdx,rax
	mov qword [rsp+8*111],rbx
	mov rbx,  [rsp+8*8]
	mov rsi,rbx
	mov qword [arg+8*2],rdx
	mov rdx,  [rsp+8*13]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*112],rax
	mov rax,  [arg+8*2]
	mov rdx,rax
	mov qword [rsp+8*113],rbx
	mov rbx,31
	mov rax,rdx
	and rax,rbx
	mov qword [rsp+8*114],rdx
	mov rdx,rax
	mov qword [rsp+8*115],rax
	mov rax,  [rsp+8*113]
	mov rsi,rax
	mov rax,  [rsp+8*112]
	mov rdi,rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*116],rdx
	mov rdx,1
	mov qword [rsp+8*118],rbx
	mov rbx,rax
	add rbx,rdx
	mov qword [rsp+8*117],rax
	mov rax,rbx
	mov qword [rsp+8*119],rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*121],rbx
	mov qword [rsp+8*120],rax
	
L_2369:
	mov rbx,  [rsp+8*118]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*121]
	cmp rbx,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*122],rax
	je L_2370
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*120]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*124],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*123],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*125],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov rax,rdx
	mov rcx,16
	shl rax,cl
	or rax,rbx
	mov qword [rsp+8*127],rbx
	mov rbx,rax
	mov qword [rsp+8*126],rdx
	mov rdx,rbx
	mov qword [rsp+8*129],rbx
	mov rbx,  [rsp+8*125]
	and rbx,rdx
	mov r15,rbx
	mov r15,r15
	mov qword [rsp+8*125],rbx
	mov rbx,  [rsp+8*120]
	xor r15,rbx
	mov rbx,r15
	mov qword [rsp+8*130],rdx
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov r12,rdi
	mov r14,rsi
	mov qword [rsp+8*128],rax
	mov rax,65535
	mov rsi,rax
	mov rdx,32767
	mov rdi,rdx
	mov r15,rdi
	mov r13,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r13
	mov r15,r15
	mov r15,r15
	mov r13,r15
	mov r15,r13
	mov rcx,r14
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*120],rbx
	mov rbx,1
	add r15,rbx
	mov r13,r15
	mov r15,r12
	mov rcx,r14
	shr r15,cl
	and r15,r13
	mov r13,r15
	mov rax,65535
	mov rsi,rax
	mov rdx,65535
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r14
	mov r15,r15
	mov r15,r15
	and r15,r13
	mov r15,r15
	mov r15,r15
	mov rbx,  [rsp+8*120]
	xor r15,rbx
	mov rbx,r15
	mov rax,5
	mov rsi,rax
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,r15
	shl r14,cl
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r13,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r13
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,rbx
	mov rbx,r15
	mov rdx,  [rsp+8*121]
	mov r15,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*120],rbx
	mov qword [rsp+8*121],rdx
	jmp L_2369
	
L_2370:
	mov rbx,  [rsp+8*120]
	mov rdx,123456789
	mov r15,rbx
	xor r15,rdx
	mov r15,r15
	mov r15,r15
	mov r13,r15
	mov rax,  [rsp+8*116]
	mov rsi,rax
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,r15
	shl r14,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,65535
	mov rdi,rdx
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r12,r15
	mov rax,32
	mov rbx,  [rsp+8*116]
	mov r15,rax
	sub r15,rbx
	mov rsi,r15
	mov rdi,r13
	mov r11,rdi
	mov r14,rsi
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov r15,rdi
	mov r13,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r13
	mov r15,r15
	mov r15,r15
	mov r13,r15
	mov r15,r13
	mov rcx,r14
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rax,1
	add r15,rax
	mov r13,r15
	mov r15,r11
	mov rcx,r14
	shr r15,cl
	and r15,r13
	mov r13,r15
	mov rbx,65535
	mov rsi,rbx
	mov rdx,65535
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r14
	mov r15,r15
	mov r15,r15
	and r15,r13
	mov r15,r15
	mov r15,r15
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov rax,r15
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov qword [rsp+8*201],rax
	mov rax,  [rsp+8*8]
	mov rsi,rax
	mov rdi,r8
	mov r13,rdi
	mov r14,rsi
	mov r15,rbx
	mov rdx,31
	and r15,rdx
	mov r12,r15
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov r11,rsi
	mov rax,1
	add r15,rax
	mov qword [arg+8*2],rbx
	mov rbx,r15
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*210],rbx
	mov qword [rsp+8*211],rdx
	
L_2400:
	mov rbx,10
	mov r15,r11
	imul r15,rbx
	mov rdx,  [rsp+8*211]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2401
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*210]
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,r15
	shl r14,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r15,rdi
	mov r13,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r13
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,rdx
	mov rdx,r15
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r10,rdi
	mov r14,rsi
	mov rbx,65535
	mov rsi,rbx
	mov rax,32767
	mov rdi,rax
	mov r15,rdi
	mov r13,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r13
	mov r15,r15
	mov r15,r15
	mov r13,r15
	mov r15,r13
	mov rcx,r14
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*210],rdx
	mov rdx,1
	add r15,rdx
	mov r13,r15
	mov r15,r10
	mov rcx,r14
	shr r15,cl
	and r15,r13
	mov r13,r15
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r14,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r14
	mov r15,r15
	mov r15,r15
	and r15,r13
	mov r15,r15
	mov r15,r15
	mov rdx,  [rsp+8*210]
	xor r15,rdx
	mov rdx,r15
	mov rbx,5
	mov rsi,rbx
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	mov r13,r15
	mov rcx,r14
	shl r13,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r15,rdi
	mov r14,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r14
	mov r15,r15
	mov qword [rsp+8*210],rdx
	mov rdx,r15
	and r13,rdx
	mov qword [rsp+8*250],rdx
	mov rdx,r13
	mov rax,rdx
	mov qword [rsp+8*251],rdx
	mov rdx,  [rsp+8*210]
	mov rbx,rdx
	xor rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*253],rbx
	mov qword [rsp+8*252],rax
	mov rax,  [rsp+8*211]
	mov rbx,rax
	mov qword [rsp+8*254],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*210],rdx
	mov qword [rsp+8*211],rax
	jmp L_2400
	
L_2401:
	mov rbx,  [rsp+8*210]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*255],rax
	mov rax,rbx
	mov qword [rsp+8*256],rbx
	mov rbx,rax
	mov rsi,r12
	mov rdi,rbx
	mov qword [rsp+8*257],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*258],rbx
	mov rbx,rax
	mov rcx,rdx
	shl rbx,cl
	mov qword [rsp+8*260],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*259],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*261],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*262],rbx
	mov rbx,rax
	mov qword [rsp+8*263],rdx
	mov rdx,rbx
	mov qword [rsp+8*265],rbx
	mov rbx,  [rsp+8*261]
	and rbx,rdx
	mov qword [rsp+8*266],rdx
	mov rdx,rbx
	mov qword [rsp+8*261],rbx
	mov rbx,rdx
	mov qword [rsp+8*267],rdx
	mov rdx,32
	mov qword [rsp+8*264],rax
	mov rax,rdx
	sub rax,r12
	mov rsi,rax
	mov qword [rsp+8*269],rax
	mov rax,  [rsp+8*258]
	mov rdi,rax
	mov rax,rdi
	mov qword [rsp+8*268],rbx
	mov rbx,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*270],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*271],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*272],rbx
	mov rbx,rax
	mov r15,rbx
	mov qword [rsp+8*275],rbx
	mov rbx,r15
	mov qword [rsp+8*273],rdx
	mov rdx,  [rsp+8*271]
	mov r15,rbx
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*274],rax
	mov rax,1
	add r15,rax
	mov rbx,r15
	mov rdx,  [rsp+8*270]
	mov rax,  [rsp+8*271]
	mov qword [rsp+8*277],rbx
	mov rbx,rdx
	mov rcx,rax
	shr rbx,cl
	mov rdx,  [rsp+8*277]
	and rbx,rdx
	mov rdx,rbx
	mov qword [rsp+8*279],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov qword [rsp+8*277],rdx
	mov rdx,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov r15,r15
	mov r15,r15
	mov qword [rsp+8*281],rdx
	mov rdx,  [rsp+8*277]
	and r15,rdx
	mov r15,r15
	mov r15,r15
	mov rdx,  [rsp+8*268]
	or r15,rdx
	mov r15,r15
	mov r15,r15
	mov rdx,r15
	mov rbx,  [rsp+8*13]
	mov r15,rbx
	xor r15,r8
	mov qword [rsp+8*291],rdx
	mov rdx,  [rsp+8*17]
	mov rax,rdx
	mov rbx,  [rsp+8*8]
	mov rsi,rbx
	mov rdi,r15
	mov rbx,rdi
	mov rdx,rsi
	mov qword [arg+8*2],rax
	mov qword [rsp+8*293],rbx
	mov rbx,  [arg+8*2]
	mov rax,rbx
	mov rbx,31
	mov qword [rsp+8*294],rdx
	mov rdx,rax
	and rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*296],rdx
	mov rdx,  [rsp+8*294]
	mov rsi,rdx
	mov rdx,  [rsp+8*293]
	mov rdi,rdx
	mov rdx,rdi
	mov qword [rsp+8*295],rax
	mov rax,rsi
	mov qword [rsp+8*297],rbx
	mov rbx,1
	mov qword [rsp+8*299],rax
	mov rax,rdx
	add rax,rbx
	mov qword [rsp+8*298],rdx
	mov rdx,rax
	mov qword [rsp+8*300],rax
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*301],rdx
	mov qword [rsp+8*302],rax
	
L_2431:
	mov rbx,  [rsp+8*299]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*302]
	cmp rbx,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*303],rax
	je L_2432
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*301]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*305],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*304],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*306],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov rax,rdx
	mov rcx,16
	shl rax,cl
	or rax,rbx
	mov qword [rsp+8*308],rbx
	mov rbx,rax
	mov qword [rsp+8*307],rdx
	mov rdx,rbx
	mov qword [rsp+8*310],rbx
	mov rbx,  [rsp+8*306]
	and rbx,rdx
	mov r15,rbx
	mov r15,r15
	mov qword [rsp+8*306],rbx
	mov rbx,  [rsp+8*301]
	xor r15,rbx
	mov rbx,r15
	mov qword [rsp+8*311],rdx
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*309],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*301],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*315],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*316],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov rax,rdx
	mov rcx,16
	shl rax,cl
	or rax,rbx
	mov qword [rsp+8*318],rbx
	mov rbx,rax
	mov qword [rsp+8*317],rdx
	mov rdx,rbx
	mov qword [rsp+8*320],rbx
	mov rbx,rdx
	mov qword [rsp+8*321],rdx
	mov rdx,  [rsp+8*316]
	mov r15,rbx
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*319],rax
	mov rax,1
	add r15,rax
	mov rbx,r15
	mov rdx,  [rsp+8*315]
	mov rax,  [rsp+8*316]
	mov r15,rdx
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*322],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov r15,r15
	mov r15,r15
	mov qword [rsp+8*325],rbx
	mov rbx,  [rsp+8*322]
	and r15,rbx
	mov r15,r15
	mov r15,r15
	mov rbx,  [rsp+8*301]
	mov qword [rsp+8*326],rdx
	mov rdx,rbx
	xor rdx,r15
	mov rbx,rdx
	mov qword [rsp+8*333],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*301],rbx
	mov rbx,rax
	mov rcx,rdx
	shl rbx,cl
	mov qword [rsp+8*335],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*334],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*336],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*337],rbx
	mov rbx,rax
	mov qword [rsp+8*338],rdx
	mov rdx,rbx
	mov qword [rsp+8*340],rbx
	mov rbx,  [rsp+8*336]
	and rbx,rdx
	mov qword [rsp+8*341],rdx
	mov rdx,rbx
	mov qword [rsp+8*336],rbx
	mov rbx,rdx
	mov qword [rsp+8*342],rdx
	mov rdx,  [rsp+8*301]
	mov qword [rsp+8*339],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*343],rbx
	mov qword [rsp+8*344],rax
	mov rax,  [rsp+8*302]
	mov rbx,rax
	mov qword [rsp+8*345],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*301],rdx
	mov qword [rsp+8*302],rax
	jmp L_2431
	
L_2432:
	mov rbx,  [rsp+8*301]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*346],rax
	mov rax,rbx
	mov qword [rsp+8*347],rbx
	mov rbx,rax
	mov qword [rsp+8*348],rax
	mov rax,  [rsp+8*297]
	mov rsi,rax
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	mov qword [rsp+8*349],rbx
	mov rbx,rdx
	mov rcx,rax
	shl rbx,cl
	mov qword [rsp+8*350],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*351],rax
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r14,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r14
	mov r15,r15
	mov r15,r15
	and rbx,r15
	mov r15,rbx
	mov r12,r15
	mov qword [rsp+8*352],rbx
	mov rbx,32
	mov rdx,  [rsp+8*297]
	mov r15,rbx
	sub r15,rdx
	mov rsi,r15
	mov rbx,  [rsp+8*349]
	mov rdi,rbx
	mov r11,rdi
	mov r10,rsi
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r14
	mov r15,r15
	mov r15,r15
	mov r13,r15
	mov r15,r13
	mov rcx,r10
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rax,1
	add r15,rax
	mov r13,r15
	mov r15,r11
	mov rcx,r10
	shr r15,cl
	and r15,r13
	mov r13,r15
	mov rbx,65535
	mov rsi,rbx
	mov rdx,65535
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r14
	mov r15,r15
	mov r15,r15
	and r15,r13
	mov r15,r15
	mov r15,r15
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov rax,r15
	mov rbx,1
	mov rsi,rbx
	mov rbx,  [rsp+8*17]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*382],rax
	mov rax,rsi
	mov rbx,1
	mov r15,rdx
	add r15,rbx
	mov qword [rsp+8*383],rdx
	mov rdx,r15
	mov qword [rsp+8*384],rax
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*386],rdx
	mov qword [rsp+8*387],rax
	
L_2155:
	mov rbx,  [rsp+8*384]
	mov rdx,10
	mov r15,rbx
	imul r15,rdx
	mov rax,  [rsp+8*387]
	cmp rax,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2156
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*386]
	mov rdi,rdx
	mov r15,rdi
	mov rax,rsi
	mov rbx,r15
	mov rcx,rax
	shl rbx,cl
	mov qword [rsp+8*390],rax
	mov rax,65535
	mov rsi,rax
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*391],rbx
	mov rbx,rdi
	mov r15,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,r15
	mov r15,rax
	mov qword [rsp+8*392],rbx
	mov rbx,r15
	mov qword [rsp+8*394],rax
	mov rax,  [rsp+8*391]
	and rax,rbx
	mov qword [rsp+8*396],rbx
	mov rbx,rax
	mov qword [rsp+8*391],rax
	mov rax,rbx
	mov qword [rsp+8*397],rbx
	mov rbx,  [rsp+8*386]
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*399],rdx
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*398],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*386],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*400],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*401],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov rax,rdx
	mov rcx,16
	shl rax,cl
	or rax,rbx
	mov qword [rsp+8*403],rbx
	mov rbx,rax
	mov qword [rsp+8*402],rdx
	mov rdx,rbx
	mov qword [rsp+8*405],rbx
	mov rbx,rdx
	mov qword [rsp+8*406],rdx
	mov rdx,  [rsp+8*401]
	mov r15,rbx
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*404],rax
	mov rax,1
	add r15,rax
	mov rbx,r15
	mov rdx,  [rsp+8*400]
	mov rax,  [rsp+8*401]
	mov r15,rdx
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r14,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r14
	mov r15,r15
	mov r15,r15
	and r15,rbx
	mov r15,r15
	mov r15,r15
	mov qword [rsp+8*407],rbx
	mov rbx,  [rsp+8*386]
	xor r15,rbx
	mov rbx,r15
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov r15,rdi
	mov r14,rsi
	mov r13,r15
	mov rcx,r14
	shl r13,cl
	mov rax,65535
	mov rsi,rax
	mov rdx,65535
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r14
	mov r15,r15
	mov r15,r15
	and r13,r15
	mov r15,r13
	mov r15,r15
	xor r15,rbx
	mov rbx,r15
	mov rax,  [rsp+8*387]
	mov r15,rax
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*386],rbx
	mov qword [rsp+8*387],rax
	jmp L_2155
	
L_2156:
	mov rbx,  [rsp+8*386]
	mov rdx,123456789
	mov r15,rbx
	xor r15,rdx
	mov r15,r15
	mov rax,r15
	mov rbx,1
	mov rsi,rbx
	mov rdi,r8
	mov r15,rdi
	mov r12,rsi
	mov rbx,1
	add r15,rbx
	mov r11,r15
	mov rdx,0
	mov r10,rdx
	mov qword [rsp+8*433],rax
	
L_2174:
	mov rbx,10
	mov r15,r12
	imul r15,rbx
	cmp r10,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2175
	mov rbx,13
	mov rsi,rbx
	mov rdi,r11
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,r15
	shl r14,cl
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r13,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r13
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,r11
	mov r11,r15
	mov rbx,17
	mov rsi,rbx
	mov rdi,r11
	mov r14,rdi
	mov r9,rsi
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
	mov r15,r15
	mov r15,r15
	mov r13,r15
	mov r15,r13
	mov rcx,r9
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*454],rbx
	mov rbx,1
	add r15,rbx
	mov r13,r15
	mov r15,r14
	mov rcx,r9
	shr r15,cl
	and r15,r13
	mov r13,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r14,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r14
	mov r15,r15
	mov r15,r15
	and r15,r13
	mov r15,r15
	mov r15,r15
	xor r15,r11
	mov r11,r15
	mov rbx,5
	mov rsi,rbx
	mov rdi,r11
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,r15
	shl r14,cl
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r13,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r13
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,r11
	mov r11,r15
	mov r15,r10
	mov rbx,1
	add r10,rbx
	jmp L_2174
	
L_2175:
	mov rbx,123456789
	mov r15,r11
	xor r15,rbx
	mov r15,r15
	mov r15,r15
	mov rdx,  [rsp+8*433]
	mov rax,rdx
	xor rax,r15
	mov rdx,1
	mov rsi,rdx
	mov rdx,  [rsp+8*13]
	mov rdi,rdx
	mov r15,rdi
	mov r12,rsi
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov qword [rsp+8*485],rax
	mov rax,0
	mov r11,rax
	
L_2193:
	mov rbx,10
	mov r15,r12
	imul r15,rbx
	cmp r11,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2194
	mov rbx,13
	mov rsi,rbx
	mov rdi,r10
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,r15
	shl r14,cl
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r13,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r13
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov rbx,17
	mov rsi,rbx
	mov rdi,r10
	mov rdx,rdi
	mov r13,rsi
	mov rax,65535
	mov rsi,rax
	mov rbx,32767
	mov rdi,rbx
	mov r15,rdi
	mov r14,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r14
	mov r15,r15
	mov r15,r15
	mov r15,r15
	mov qword [rsp+8*503],rdx
	mov rdx,r15
	mov rcx,r13
	shr rdx,cl
	mov rdx,rdx
	mov rcx,1
	shl rdx,cl
	mov rax,1
	add rdx,rax
	mov r15,rdx
	mov qword [rsp+8*511],rdx
	mov rdx,  [rsp+8*503]
	mov rbx,rdx
	mov rcx,r13
	shr rbx,cl
	and rbx,r15
	mov r15,rbx
	mov qword [rsp+8*512],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rdx,65535
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*514],rbx
	mov rbx,rdx
	mov qword [rsp+8*515],rdx
	mov rdx,rbx
	mov qword [rsp+8*516],rbx
	mov rbx,r15
	and rbx,rdx
	mov qword [rsp+8*517],rdx
	mov rdx,rbx
	mov qword [rsp+8*518],rbx
	mov rbx,rdx
	mov qword [rsp+8*519],rdx
	mov rdx,r10
	xor rdx,rbx
	mov r10,rdx
	mov qword [rsp+8*520],rbx
	mov rbx,5
	mov rsi,rbx
	mov rdi,r10
	mov qword [rsp+8*521],rdx
	mov rdx,rdi
	mov qword [rsp+8*513],rax
	mov rax,rsi
	mov rbx,rdx
	mov rcx,rax
	shl rbx,cl
	mov qword [rsp+8*522],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*523],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*524],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*525],rbx
	mov rbx,rax
	mov qword [rsp+8*526],rdx
	mov rdx,rbx
	mov qword [rsp+8*528],rbx
	mov rbx,  [rsp+8*524]
	and rbx,rdx
	mov qword [rsp+8*529],rdx
	mov rdx,rbx
	mov qword [rsp+8*524],rbx
	mov rbx,rdx
	mov qword [rsp+8*530],rdx
	mov rdx,r10
	xor rdx,rbx
	mov r10,rdx
	mov qword [rsp+8*531],rbx
	mov rbx,r11
	mov qword [rsp+8*533],rbx
	mov rbx,1
	add r11,rbx
	mov qword [rsp+8*532],rdx
	mov qword [rsp+8*527],rax
	jmp L_2193
	
L_2194:
	mov rbx,123456789
	mov rdx,r10
	xor rdx,rbx
	mov rax,rdx
	mov r15,rax
	mov qword [rsp+8*534],rdx
	mov rdx,  [rsp+8*485]
	xor rdx,r15
	mov r10,rdx
	mov rdx,  [rsp+8*111]
	mov qword [rsp+8*535],rax
	mov rax,rdx
	xor rax,r10
	mov rdx,1
	mov rsi,rdx
	mov rdi,rax
	mov rdx,rdi
	mov rax,rsi
	mov rbx,1
	mov qword [rsp+8*540],rax
	mov rax,rdx
	add rax,rbx
	mov qword [rsp+8*539],rdx
	mov rdx,rax
	mov qword [rsp+8*541],rax
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*542],rdx
	mov qword [rsp+8*543],rax
	
L_2212:
	mov rbx,  [rsp+8*540]
	mov rdx,10
	mov r15,rbx
	imul r15,rdx
	mov rax,  [rsp+8*543]
	cmp rax,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2213
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*542]
	mov rdi,rdx
	mov rax,rdi
	mov r15,rsi
	mov rbx,rax
	mov rcx,r15
	shl rbx,cl
	mov qword [rsp+8*545],rax
	mov rax,65535
	mov rsi,rax
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*547],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov r15,r15
	mov r15,r15
	mov qword [rsp+8*548],rbx
	mov rbx,  [rsp+8*547]
	and rbx,r15
	mov r15,rbx
	mov r15,r15
	mov qword [rsp+8*547],rbx
	mov rbx,  [rsp+8*542]
	xor r15,rbx
	mov rbx,r15
	mov qword [rsp+8*549],rax
	mov rax,17
	mov rsi,rax
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	mov qword [rsp+8*542],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*556],rdx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*557],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*559],rbx
	mov rbx,rdx
	mov qword [rsp+8*560],rdx
	mov rdx,rbx
	mov qword [rsp+8*561],rbx
	mov rbx,rdx
	mov qword [rsp+8*562],rdx
	mov rdx,  [rsp+8*557]
	mov qword [rsp+8*558],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov qword [rsp+8*563],rbx
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*564],rax
	mov rax,  [rsp+8*556]
	mov rbx,  [rsp+8*557]
	mov qword [rsp+8*563],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rbx,  [rsp+8*563]
	and rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*565],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*563],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*566],rbx
	mov rbx,rax
	mov qword [rsp+8*567],rdx
	mov rdx,rbx
	mov qword [rsp+8*569],rbx
	mov rbx,  [rsp+8*563]
	mov qword [rsp+8*568],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*570],rdx
	mov rdx,rbx
	mov qword [rsp+8*572],rbx
	mov rbx,  [rsp+8*542]
	mov qword [rsp+8*571],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*573],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*574],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*542],rbx
	mov rbx,rax
	mov rcx,rdx
	shl rbx,cl
	mov qword [rsp+8*576],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*575],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*577],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*578],rbx
	mov rbx,rax
	mov qword [rsp+8*579],rdx
	mov rdx,rbx
	mov qword [rsp+8*581],rbx
	mov rbx,  [rsp+8*577]
	and rbx,rdx
	mov qword [rsp+8*582],rdx
	mov rdx,rbx
	mov qword [rsp+8*577],rbx
	mov rbx,rdx
	mov qword [rsp+8*583],rdx
	mov rdx,  [rsp+8*542]
	mov qword [rsp+8*580],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*584],rbx
	mov qword [rsp+8*585],rax
	mov rax,  [rsp+8*543]
	mov rbx,rax
	mov qword [rsp+8*586],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*542],rdx
	mov qword [rsp+8*543],rax
	jmp L_2212
	
L_2213:
	mov rbx,  [rsp+8*542]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*587],rax
	mov rax,rbx
	mov qword [rsp+8*588],rbx
	mov rbx,  [rsp+8*9]
	mov r15,rbx
	add r15,rax
	mov rbx,r15
	mov qword [rsp+8*589],rax
	mov rax,  [rsp+8*201]
	mov rdx,rax
	xor rdx,r10
	mov rax,1
	mov rsi,rax
	mov rdi,rdx
	mov rdx,rdi
	mov rax,rsi
	mov qword [rsp+8*9],rbx
	mov rbx,1
	mov qword [rsp+8*593],rax
	mov rax,rdx
	add rax,rbx
	mov qword [rsp+8*592],rdx
	mov rdx,rax
	mov qword [rsp+8*594],rax
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*595],rdx
	mov qword [rsp+8*596],rax
	
L_2231:
	mov rbx,  [rsp+8*593]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*596]
	cmp rbx,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*597],rax
	je L_2232
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*595]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*599],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*598],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*600],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov rax,rdx
	mov rcx,16
	shl rax,cl
	or rax,rbx
	mov qword [rsp+8*602],rbx
	mov rbx,rax
	mov qword [rsp+8*601],rdx
	mov rdx,rbx
	mov qword [rsp+8*604],rbx
	mov rbx,  [rsp+8*600]
	and rbx,rdx
	mov qword [rsp+8*605],rdx
	mov rdx,rbx
	mov qword [rsp+8*600],rbx
	mov rbx,rdx
	mov qword [rsp+8*606],rdx
	mov rdx,  [rsp+8*595]
	mov qword [rsp+8*603],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*607],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*608],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*595],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*609],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*610],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*611],rbx
	mov rbx,rax
	mov qword [rsp+8*612],rdx
	mov rdx,rbx
	mov qword [rsp+8*614],rbx
	mov rbx,rdx
	mov qword [rsp+8*615],rdx
	mov rdx,  [rsp+8*610]
	mov qword [rsp+8*613],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov qword [rsp+8*616],rbx
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*617],rax
	mov rax,  [rsp+8*609]
	mov rbx,  [rsp+8*610]
	mov qword [rsp+8*616],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rbx,  [rsp+8*616]
	and rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*618],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*616],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*619],rbx
	mov rbx,rax
	mov qword [rsp+8*620],rdx
	mov rdx,rbx
	mov qword [rsp+8*622],rbx
	mov rbx,  [rsp+8*616]
	mov qword [rsp+8*621],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*623],rdx
	mov rdx,rbx
	mov qword [rsp+8*625],rbx
	mov rbx,  [rsp+8*595]
	mov qword [rsp+8*624],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*626],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*627],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*595],rbx
	mov rbx,rax
	mov rcx,rdx
	shl rbx,cl
	mov qword [rsp+8*629],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*628],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*630],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*631],rbx
	mov rbx,rax
	mov qword [rsp+8*632],rdx
	mov rdx,rbx
	mov qword [rsp+8*634],rbx
	mov rbx,  [rsp+8*630]
	and rbx,rdx
	mov qword [rsp+8*635],rdx
	mov rdx,rbx
	mov qword [rsp+8*630],rbx
	mov rbx,rdx
	mov qword [rsp+8*636],rdx
	mov rdx,  [rsp+8*595]
	mov qword [rsp+8*633],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*637],rbx
	mov qword [rsp+8*638],rax
	mov rax,  [rsp+8*596]
	mov rbx,rax
	mov qword [rsp+8*639],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*595],rdx
	mov qword [rsp+8*596],rax
	jmp L_2231
	
L_2232:
	mov rbx,  [rsp+8*595]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*640],rax
	mov rax,rbx
	mov qword [rsp+8*641],rbx
	mov rbx,  [rsp+8*10]
	mov r15,rbx
	add r15,rax
	mov rbx,r15
	mov qword [rsp+8*642],rax
	mov rax,  [rsp+8*291]
	mov rdx,rax
	xor rdx,r10
	mov rax,1
	mov rsi,rax
	mov rdi,rdx
	mov rdx,rdi
	mov rax,rsi
	mov qword [rsp+8*10],rbx
	mov rbx,1
	mov qword [rsp+8*646],rax
	mov rax,rdx
	add rax,rbx
	mov qword [rsp+8*645],rdx
	mov rdx,rax
	mov qword [rsp+8*647],rax
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*648],rdx
	mov qword [rsp+8*649],rax
	
L_2250:
	mov rbx,  [rsp+8*646]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*649]
	cmp rbx,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*650],rax
	je L_2251
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*648]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*652],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*651],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*653],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov rax,rdx
	mov rcx,16
	shl rax,cl
	or rax,rbx
	mov qword [rsp+8*655],rbx
	mov rbx,rax
	mov qword [rsp+8*654],rdx
	mov rdx,rbx
	mov qword [rsp+8*657],rbx
	mov rbx,  [rsp+8*653]
	and rbx,rdx
	mov qword [rsp+8*658],rdx
	mov rdx,rbx
	mov qword [rsp+8*653],rbx
	mov rbx,rdx
	mov qword [rsp+8*659],rdx
	mov rdx,  [rsp+8*648]
	mov r15,rdx
	xor r15,rbx
	mov rdx,r15
	mov qword [rsp+8*660],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov r12,rdi
	mov r11,rsi
	mov qword [rsp+8*656],rax
	mov rax,65535
	mov rsi,rax
	mov rbx,32767
	mov rdi,rbx
	mov r15,rdi
	mov r14,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r14
	mov r15,r15
	mov r15,r15
	mov r13,r15
	mov r15,r13
	mov rcx,r11
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*648],rdx
	mov rdx,1
	add r15,rdx
	mov r13,r15
	mov r15,r12
	mov rcx,r11
	shr r15,cl
	and r15,r13
	mov r13,r15
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r15,rdi
	mov r14,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r14
	mov r15,r15
	mov r15,r15
	and r15,r13
	mov r15,r15
	mov r15,r15
	mov rdx,  [rsp+8*648]
	xor r15,rdx
	mov rdx,r15
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,r15
	shl r14,cl
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r13,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r13
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,rdx
	mov rdx,r15
	mov rbx,  [rsp+8*649]
	mov r15,rbx
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*649],rbx
	mov qword [rsp+8*648],rdx
	jmp L_2250
	
L_2251:
	mov rbx,  [rsp+8*648]
	mov rdx,123456789
	mov r15,rbx
	xor r15,rdx
	mov r15,r15
	mov rax,r15
	mov rbx,  [rsp+8*11]
	mov r15,rbx
	add r15,rax
	mov rbx,r15
	mov qword [rsp+8*695],rax
	mov rax,  [rsp+8*382]
	mov r15,rax
	xor r15,r10
	mov rax,1
	mov rsi,rax
	mov rdi,r15
	mov r15,rdi
	mov r10,rsi
	mov rax,1
	add r15,rax
	mov r11,r15
	mov rax,0
	mov r12,rax
	mov qword [rsp+8*11],rbx
	
L_2269:
	mov rbx,10
	mov r15,r10
	imul r15,rbx
	cmp r12,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2270
	mov rbx,13
	mov rsi,rbx
	mov rdi,r11
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,r15
	shl r14,cl
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r13,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r13
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,r11
	mov r11,r15
	mov rbx,17
	mov rsi,rbx
	mov rdi,r11
	mov r13,rdi
	mov r14,rsi
	mov rbx,65535
	mov rsi,rbx
	mov rbx,32767
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov r15,r15
	mov r15,r15
	mov r15,r15
	mov qword [rsp+8*717],rbx
	mov rbx,r15
	mov rcx,r14
	shr rbx,cl
	mov rbx,rbx
	mov rcx,1
	shl rbx,cl
	mov qword [rsp+8*718],rdx
	mov rdx,1
	add rbx,rdx
	mov r15,rbx
	mov qword [rsp+8*723],rbx
	mov rbx,r13
	mov rcx,r14
	shr rbx,cl
	and rbx,r15
	mov r15,rbx
	mov qword [rsp+8*724],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rbx,65535
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*725],rbx
	mov rbx,rax
	mov qword [rsp+8*726],rdx
	mov rdx,rbx
	mov qword [rsp+8*728],rbx
	mov rbx,r15
	and rbx,rdx
	mov qword [rsp+8*729],rdx
	mov rdx,rbx
	mov qword [rsp+8*730],rbx
	mov rbx,rdx
	mov qword [rsp+8*731],rdx
	mov rdx,r11
	xor rdx,rbx
	mov r11,rdx
	mov qword [rsp+8*732],rbx
	mov rbx,5
	mov rsi,rbx
	mov rdi,r11
	mov rbx,rdi
	mov qword [rsp+8*733],rdx
	mov rdx,rsi
	mov qword [rsp+8*727],rax
	mov rax,rbx
	mov rcx,rdx
	shl rax,cl
	mov qword [rsp+8*734],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rbx,65535
	mov rdi,rbx
	mov rbx,rdi
	mov qword [rsp+8*735],rdx
	mov rdx,rsi
	mov qword [rsp+8*736],rax
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*737],rbx
	mov rbx,rax
	mov qword [rsp+8*738],rdx
	mov rdx,rbx
	mov qword [rsp+8*740],rbx
	mov rbx,  [rsp+8*736]
	and rbx,rdx
	mov qword [rsp+8*741],rdx
	mov rdx,rbx
	mov qword [rsp+8*736],rbx
	mov rbx,rdx
	mov qword [rsp+8*742],rdx
	mov rdx,r11
	xor rdx,rbx
	mov r11,rdx
	mov qword [rsp+8*743],rbx
	mov rbx,r12
	mov qword [rsp+8*745],rbx
	mov rbx,1
	add r12,rbx
	mov qword [rsp+8*744],rdx
	mov qword [rsp+8*739],rax
	jmp L_2269
	
L_2270:
	mov rbx,123456789
	mov r15,r11
	xor r15,rbx
	mov r15,r15
	mov r15,r15
	mov rdx,  [rsp+8*12]
	add r15,rdx
	mov rdx,r15
	mov rax,  [rsp+8*17]
	mov r15,rax
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*12],rdx
	mov qword [rsp+8*17],rax
	jmp L_1991
	
L_1992:
	mov r15,r8
	mov rbx,1
	add r8,rbx
	jmp L_1988
	
L_1989:
	mov rbx,  [rsp+8*13]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*13],rbx
	jmp L_1985
	
L_1986:
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov r9,rdi
	mov rdx,t127
	mov r10,rdx
	mov rax,28
	mov r11,rax
	
L_2068:
	mov rbx,0
	cmp r11,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_2069
	mov r15,r9
	mov rcx,r11
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r14,r15
	mov rdx,10
	cmp r14,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2070
	mov rbx,48
	mov r15,rbx
	add r15,r14
	mov rdi,r15
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2071
	mov rbx,0
	mov r15,rbx
	jmp L_2072
	
L_2071:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2072:
	cmp r15, 0
	je L_2073
	mov rbx,  [gbl+8*764]
	mov r12,rbx
	mov rdx,32
	mov r13,r14
	sub r13,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r13
	mov rbx,r12
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
	jmp L_2075
	
L_2073:
	mov rbx,t125
	mov r15,rbx
	
L_2075:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r10
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
	mov r10,r15
	jmp L_2076
	
L_2070:
	mov rbx,65
	mov r15,rbx
	add r15,r14
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2077
	mov rbx,0
	mov r15,rbx
	jmp L_2078
	
L_2077:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2078:
	cmp r15, 0
	je L_2079
	mov rbx,  [gbl+8*764]
	mov r12,rbx
	mov rdx,32
	mov r13,r14
	sub r13,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r13
	mov rbx,r12
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
	jmp L_2081
	
L_2079:
	mov rbx,t125
	mov r15,rbx
	
L_2081:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r10
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
	mov r10,r15
	
L_2076:
	mov rbx,4
	mov r15,r11
	sub r15,rbx
	mov r11,r15
	jmp L_2068
	
L_2069:
	mov r15,r10
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
	mov r10,rdi
	mov rdx,t127
	mov r11,rdx
	mov rax,28
	mov r9,rax
	
L_2085:
	mov rbx,0
	cmp r9,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_2086
	mov r15,r10
	mov rcx,r9
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r15,r15
	mov rdx,10
	cmp r15,rdx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_2087
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r12,rdi
	mov rdx,32
	cmp r12,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2088
	mov rbx,0
	mov r15,rbx
	jmp L_2089
	
L_2088:
	mov rbx,126
	cmp r12,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2089:
	cmp r15, 0
	je L_2090
	mov rbx,  [gbl+8*764]
	mov r13,rbx
	mov rdx,32
	mov r14,r12
	sub r14,rdx
	mov rax,32
	mov r15,r12
	sub r15,rax
	mov rsi,r15
	mov rdi,r14
	mov rbx,r13
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
	jmp L_2092
	
L_2090:
	mov rbx,t125
	mov r15,rbx
	
L_2092:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r11
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
	mov r11,r15
	jmp L_2093
	
L_2087:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r13,rdi
	mov rax,32
	cmp r13,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2094
	mov rbx,0
	mov r15,rbx
	jmp L_2095
	
L_2094:
	mov rbx,126
	cmp r13,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2095:
	cmp r15, 0
	je L_2096
	mov rbx,  [gbl+8*764]
	mov r12,rbx
	mov rdx,32
	mov r14,r13
	sub r14,rdx
	mov rax,32
	mov r15,r13
	sub r15,rax
	mov rsi,r15
	mov rdi,r14
	mov rbx,r12
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
	jmp L_2098
	
L_2096:
	mov rbx,t125
	mov r15,rbx
	
L_2098:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r11
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
	mov r11,r15
	
L_2093:
	mov rbx,4
	mov r15,r9
	sub r15,rbx
	mov r9,r15
	jmp L_2085
	
L_2086:
	mov r15,r11
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
	mov r12,rdi
	mov rdx,t127
	mov r10,rdx
	mov rax,28
	mov r11,rax
	
L_2102:
	mov rbx,0
	cmp r11,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_2103
	mov r15,r12
	mov rcx,r11
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r14,r15
	mov rdx,10
	cmp r14,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2104
	mov rbx,48
	mov r15,rbx
	add r15,r14
	mov rdi,r15
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2105
	mov rbx,0
	mov r15,rbx
	jmp L_2106
	
L_2105:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2106:
	cmp r15, 0
	je L_2107
	mov rbx,  [gbl+8*764]
	mov r15,rbx
	mov rdx,32
	mov r13,r14
	sub r13,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r13
	mov rbx,r15
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
	jmp L_2109
	
L_2107:
	mov rbx,t125
	mov r15,rbx
	
L_2109:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r10
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
	mov r10,r15
	jmp L_2110
	
L_2104:
	mov rbx,65
	mov r15,rbx
	add r15,r14
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2111
	mov rbx,0
	mov r15,rbx
	jmp L_2112
	
L_2111:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2112:
	cmp r15, 0
	je L_2113
	mov rbx,  [gbl+8*764]
	mov r15,rbx
	mov rdx,32
	mov r13,r14
	sub r13,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r13
	mov rbx,r15
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
	jmp L_2115
	
L_2113:
	mov rbx,t125
	mov r15,rbx
	
L_2115:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r10
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
	mov r10,r15
	
L_2110:
	mov rbx,4
	mov r15,r11
	sub r15,rbx
	mov r11,r15
	jmp L_2102
	
L_2103:
	mov r15,r10
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
	mov r11,rdi
	mov rdx,t127
	mov r9,rdx
	mov rax,28
	mov r10,rax
	
L_2119:
	mov rbx,0
	cmp r10,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_2120
	mov r15,r11
	mov rcx,r10
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r14,r15
	mov rdx,10
	cmp r14,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2121
	mov rbx,48
	mov r15,rbx
	add r15,r14
	mov rdi,r15
	mov r13,rdi
	mov rdx,32
	cmp r13,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2122
	mov rbx,0
	mov r15,rbx
	jmp L_2123
	
L_2122:
	mov rbx,126
	cmp r13,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2123:
	cmp r15, 0
	je L_2124
	mov rbx,  [gbl+8*764]
	mov r12,rbx
	mov rdx,32
	mov r14,r13
	sub r14,rdx
	mov rax,32
	mov r15,r13
	sub r15,rax
	mov rsi,r15
	mov rdi,r14
	mov rbx,r12
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
	jmp L_2126
	
L_2124:
	mov rbx,t125
	mov r15,rbx
	
L_2126:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r9
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
	mov r9,r15
	jmp L_2127
	
L_2121:
	mov rbx,65
	mov r15,rbx
	add r15,r14
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2128
	mov rbx,0
	mov r15,rbx
	jmp L_2129
	
L_2128:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2129:
	cmp r15, 0
	je L_2130
	mov rbx,  [gbl+8*764]
	mov r15,rbx
	mov rdx,32
	mov r13,r14
	sub r13,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r13
	mov rdx,r15
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
	jmp L_2132
	
L_2130:
	mov rbx,t125
	mov r15,rbx
	
L_2132:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r9
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
	mov r9,r15
	
L_2127:
	mov rbx,4
	mov r15,r10
	sub r15,rbx
	mov r10,r15
	jmp L_2119
	
L_2120:
	mov r15,r9
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
	sub    rsp, 7200
	mov rdx,t109
	mov rbx,rdx
	mov qword [gbl+8*764],rbx
	mov rbx,  [rsp+8*892]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   9184
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

