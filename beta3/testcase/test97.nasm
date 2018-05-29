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
	
L_2787:
	mov rbx,  [rsp+8*13]
	mov rdx,  [rsp+8*3]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2788
	mov rdx,  [rsp+8*4]
	mov rbx,rdx
	mov qword [rsp+8*15],rbx
	
L_2790:
	mov rbx,  [rsp+8*15]
	mov rdx,  [rsp+8*5]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2791
	mov rdx,  [rsp+8*6]
	mov rbx,rdx
	mov qword [rsp+8*17],rbx
	
L_2793:
	mov rbx,  [rsp+8*17]
	mov rdx,  [rsp+8*7]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2794
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
	and r15,rdx
	mov r8,r15
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov rax,rsi
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov rdx,0
	mov r9,rdx
	mov qword [rsp+8*28],rax
	
L_3150:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r15,rbx
	imul r15,rdx
	cmp r9,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_3152
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
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
	mov r14,rdi
	mov r13,rsi
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov r11,r15
	mov r15,r11
	mov rcx,r13
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r11,r15
	mov r15,r14
	mov rcx,r13
	shr r15,cl
	and r15,r11
	mov r11,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r15,r11
	mov r15,r15
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov rbx,5
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_3150
	
L_3152:
	mov rbx,123456789
	mov r15,r10
	xor r15,rbx
	mov r15,r15
	mov r15,r15
	mov r13,r15
	mov rsi,r8
	mov rdi,r13
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r10,r15
	mov rbx,32
	mov r15,rbx
	sub r15,r8
	mov rsi,r15
	mov rdi,r13
	mov r14,rdi
	mov r13,rsi
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov r11,r15
	mov r15,r11
	mov rcx,r13
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r11,r15
	mov r15,r14
	mov rcx,r13
	shr r15,cl
	and r15,r11
	mov r11,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r15,r11
	mov r15,r15
	mov r15,r15
	or r15,r10
	mov r15,r15
	mov r15,r15
	mov rbx,r15
	mov rax,  [rsp+8*17]
	mov rdx,rax
	mov qword [rsp+8*69],rbx
	mov rbx,  [rsp+8*8]
	mov rsi,rbx
	mov qword [arg+8*2],rdx
	mov rdx,  [rsp+8*13]
	mov rdi,rdx
	mov r13,rdi
	mov r14,rsi
	mov rax,  [arg+8*2]
	mov r15,rax
	mov rbx,31
	and r15,rbx
	mov r8,r15
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov rdx,rsi
	mov rax,1
	add r15,rax
	mov r10,r15
	mov rbx,0
	mov r9,rbx
	mov qword [rsp+8*28],rdx
	
L_3182:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r15,rbx
	imul r15,rdx
	cmp r9,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_3184
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
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
	mov r14,rdi
	mov r13,rsi
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov r11,r15
	mov r15,r11
	mov rcx,r13
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r11,r15
	mov r15,r14
	mov rcx,r13
	shr r15,cl
	and r15,r11
	mov r11,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r15,r11
	mov r15,r15
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov rbx,5
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_3182
	
L_3184:
	mov rbx,123456789
	mov r15,r10
	xor r15,rbx
	mov r15,r15
	mov r15,r15
	mov r13,r15
	mov rsi,r8
	mov rdi,r13
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r10,r15
	mov rbx,32
	mov r15,rbx
	sub r15,r8
	mov rsi,r15
	mov rdi,r13
	mov r14,rdi
	mov r13,rsi
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov r11,r15
	mov r15,r11
	mov rcx,r13
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r11,r15
	mov r15,r14
	mov rcx,r13
	shr r15,cl
	and r15,r11
	mov r11,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r15,r11
	mov r15,r15
	mov r15,r15
	or r15,r10
	mov r15,r15
	mov r15,r15
	mov rbx,r15
	mov rax,  [rsp+8*17]
	mov rdx,rax
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*8]
	mov rsi,rbx
	mov qword [arg+8*2],rdx
	mov rdx,  [rsp+8*15]
	mov rdi,rdx
	mov r13,rdi
	mov r14,rsi
	mov rax,  [arg+8*2]
	mov r15,rax
	mov rbx,31
	and r15,rbx
	mov r8,r15
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov rdx,rsi
	mov rax,1
	add r15,rax
	mov r10,r15
	mov rbx,0
	mov r9,rbx
	mov qword [rsp+8*28],rdx
	
L_3214:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r15,rbx
	imul r15,rdx
	cmp r9,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_3216
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
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
	mov r14,rdi
	mov r13,rsi
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov r11,r15
	mov r15,r11
	mov rcx,r13
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r11,r15
	mov r15,r14
	mov rcx,r13
	shr r15,cl
	and r15,r11
	mov r11,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r15,r11
	mov r15,r15
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov rbx,5
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_3214
	
L_3216:
	mov rbx,123456789
	mov r15,r10
	xor r15,rbx
	mov r15,r15
	mov r15,r15
	mov r13,r15
	mov rsi,r8
	mov rdi,r13
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r10,r15
	mov rbx,32
	mov r15,rbx
	sub r15,r8
	mov rsi,r15
	mov rdi,r13
	mov r14,rdi
	mov r13,rsi
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov r11,r15
	mov r15,r11
	mov rcx,r13
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r11,r15
	mov r15,r14
	mov rcx,r13
	shr r15,cl
	and r15,r11
	mov r11,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r15,r11
	mov r15,r15
	mov r15,r15
	or r15,r10
	mov r15,r15
	mov r15,r15
	mov rbx,r15
	mov rdx,  [rsp+8*13]
	mov rax,  [rsp+8*15]
	mov r15,rdx
	xor r15,rax
	mov qword [rsp+8*73],rbx
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*8]
	mov rsi,rax
	mov rdi,r15
	mov r13,rdi
	mov r14,rsi
	mov r15,rbx
	mov qword [arg+8*2],rbx
	mov rbx,31
	and r15,rbx
	mov r8,r15
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov rbx,rsi
	mov rax,1
	add r15,rax
	mov r10,r15
	mov rdx,0
	mov r9,rdx
	mov qword [rsp+8*28],rbx
	
L_3246:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r15,rbx
	imul r15,rdx
	cmp r9,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_3248
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
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
	mov r14,rdi
	mov r13,rsi
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov r11,r15
	mov r15,r11
	mov rcx,r13
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r11,r15
	mov r15,r14
	mov rcx,r13
	shr r15,cl
	and r15,r11
	mov r11,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r15,r11
	mov r15,r15
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov rbx,5
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_3246
	
L_3248:
	mov rbx,123456789
	mov r15,r10
	xor r15,rbx
	mov r15,r15
	mov r15,r15
	mov r13,r15
	mov rsi,r8
	mov rdi,r13
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r10,r15
	mov rbx,32
	mov r15,rbx
	sub r15,r8
	mov rsi,r15
	mov rdi,r13
	mov r14,rdi
	mov r13,rsi
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov r11,r15
	mov r15,r11
	mov rcx,r13
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rax,1
	add r15,rax
	mov r11,r15
	mov r15,r14
	mov rcx,r13
	shr r15,cl
	and r15,r11
	mov r11,r15
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
	and r15,r11
	mov r15,r15
	mov r15,r15
	or r15,r10
	mov r15,r15
	mov r15,r15
	mov rax,r15
	mov rbx,1
	mov rsi,rbx
	mov rbx,  [rsp+8*17]
	mov rdi,rbx
	mov r15,rdi
	mov rdx,rsi
	mov qword [rsp+8*76],rax
	mov rax,1
	add r15,rax
	mov r10,r15
	mov rbx,0
	mov r9,rbx
	mov qword [rsp+8*28],rdx
	
L_2958:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r15,rbx
	imul r15,rdx
	cmp r9,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_2960
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
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
	mov r14,rdi
	mov r13,rsi
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov r11,r15
	mov r15,r11
	mov rcx,r13
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r11,r15
	mov r15,r14
	mov rcx,r13
	shr r15,cl
	and r15,r11
	mov r11,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r15,r11
	mov r15,r15
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov rbx,5
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_2958
	
L_2960:
	mov rbx,123456789
	mov r15,r10
	xor r15,rbx
	mov r15,r15
	mov r8,r15
	mov rdx,1
	mov rsi,rdx
	mov rax,  [rsp+8*15]
	mov rdi,rax
	mov r15,rdi
	mov rdx,rsi
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov rax,0
	mov r9,rax
	mov qword [rsp+8*28],rdx
	
L_2978:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r15,rbx
	imul r15,rdx
	cmp r9,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_2980
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
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
	mov r14,rdi
	mov r13,rsi
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov r11,r15
	mov r15,r11
	mov rcx,r13
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r11,r15
	mov r15,r14
	mov rcx,r13
	shr r15,cl
	and r15,r11
	mov r11,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r15,r11
	mov r15,r15
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov rbx,5
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_2978
	
L_2980:
	mov rbx,123456789
	mov r15,r10
	xor r15,rbx
	mov r15,r15
	mov r15,r15
	xor r8,r15
	mov rdx,1
	mov rsi,rdx
	mov rax,  [rsp+8*13]
	mov rdi,rax
	mov r15,rdi
	mov rdx,rsi
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov rax,0
	mov r9,rax
	mov qword [rsp+8*28],rdx
	
L_2998:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r15,rbx
	imul r15,rdx
	cmp r9,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_3000
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
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
	mov r14,rdi
	mov r13,rsi
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov r11,r15
	mov r15,r11
	mov rcx,r13
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r11,r15
	mov r15,r14
	mov rcx,r13
	shr r15,cl
	and r15,r11
	mov r11,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r15,r11
	mov r15,r15
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov rbx,5
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_2998
	
L_3000:
	mov rbx,123456789
	mov r15,r10
	xor r15,rbx
	mov r15,r15
	mov r15,r15
	xor r8,r15
	mov r8,r8
	mov rdx,  [rsp+8*69]
	mov r15,rdx
	xor r15,r8
	mov rax,1
	mov rsi,rax
	mov rdi,r15
	mov r15,rdi
	mov rdx,rsi
	mov rax,1
	add r15,rax
	mov r10,r15
	mov rbx,0
	mov r9,rbx
	mov qword [rsp+8*28],rdx
	
L_3018:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r15,rbx
	imul r15,rdx
	cmp r9,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_3020
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
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
	mov r14,rdi
	mov r13,rsi
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov r11,r15
	mov r15,r11
	mov rcx,r13
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r11,r15
	mov r15,r14
	mov rcx,r13
	shr r15,cl
	and r15,r11
	mov r11,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r15,r11
	mov r15,r15
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov rbx,5
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_3018
	
L_3020:
	mov rbx,123456789
	mov r15,r10
	xor r15,rbx
	mov r15,r15
	mov r15,r15
	mov rdx,  [rsp+8*9]
	add r15,rdx
	mov rdx,r15
	mov rax,  [rsp+8*71]
	mov r15,rax
	xor r15,r8
	mov rax,1
	mov rsi,rax
	mov rdi,r15
	mov r15,rdi
	mov rax,rsi
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov qword [rsp+8*9],rdx
	mov rdx,0
	mov r9,rdx
	mov qword [rsp+8*28],rax
	
L_3038:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r15,rbx
	imul r15,rdx
	cmp r9,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_3040
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
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
	mov r14,rdi
	mov r13,rsi
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov r11,r15
	mov r15,r11
	mov rcx,r13
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r11,r15
	mov r15,r14
	mov rcx,r13
	shr r15,cl
	and r15,r11
	mov r11,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r15,r11
	mov r15,r15
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov rbx,5
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_3038
	
L_3040:
	mov rbx,123456789
	mov r15,r10
	xor r15,rbx
	mov r15,r15
	mov r15,r15
	mov rdx,  [rsp+8*10]
	add r15,rdx
	mov rdx,r15
	mov rax,  [rsp+8*73]
	mov r15,rax
	xor r15,r8
	mov rax,1
	mov rsi,rax
	mov rdi,r15
	mov r15,rdi
	mov rax,rsi
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov qword [rsp+8*10],rdx
	mov rdx,0
	mov r9,rdx
	mov qword [rsp+8*28],rax
	
L_3058:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r15,rbx
	imul r15,rdx
	cmp r9,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_3060
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
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
	mov r14,rdi
	mov r13,rsi
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov r11,r15
	mov r15,r11
	mov rcx,r13
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r11,r15
	mov r15,r14
	mov rcx,r13
	shr r15,cl
	and r15,r11
	mov r11,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r15,r11
	mov r15,r15
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov rbx,5
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r14,r15
	mov r15,r14
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_3058
	
L_3060:
	mov rbx,123456789
	mov r15,r10
	xor r15,rbx
	mov r15,r15
	mov r15,r15
	mov rdx,  [rsp+8*11]
	add r15,rdx
	mov rdx,r15
	mov rax,  [rsp+8*76]
	mov r15,rax
	xor r15,r8
	mov rax,1
	mov rsi,rax
	mov rdi,r15
	mov r15,rdi
	mov rax,rsi
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov rbx,0
	mov r9,rbx
	mov qword [rsp+8*11],rdx
	mov qword [rsp+8*28],rax
	
L_3078:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r15,rbx
	imul r15,rdx
	cmp r9,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_3080
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
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
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
	mov r14,rdi
	mov r13,rsi
	mov rbx,65535
	mov rsi,rbx
	mov rbx,32767
	mov rdi,rbx
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	mov r11,r15
	mov r15,r11
	mov rcx,r13
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r11,r15
	mov r15,r14
	mov rcx,r13
	shr r15,cl
	and r15,r11
	mov r11,r15
	mov rbx,65535
	mov rsi,rbx
	mov rbx,65535
	mov rdi,rbx
	mov r15,rdi
	mov r12,rsi
	mov r15,r15
	mov rcx,16
	shl r15,cl
	or r15,r12
	mov r15,r15
	mov r15,r15
	and r15,r11
	mov r15,r15
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov rbx,5
	mov rsi,rbx
	mov rdi,r10
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,r15
	shl r14,cl
	mov rsi,rdx
	mov rdi,rax
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
	mov r15,r15
	xor r15,r10
	mov r10,r15
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_3078
	
L_3080:
	mov rbx,123456789
	mov r15,r10
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
	jmp L_2793
	
L_2794:
	mov rbx,  [rsp+8*15]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*15],rbx
	jmp L_2790
	
L_2791:
	mov rbx,  [rsp+8*13]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*13],rbx
	jmp L_2787
	
L_2788:
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov r9,rdi
	mov rdx,t127
	mov r11,rdx
	mov rax,28
	mov r10,rax
	
L_2870:
	mov rbx,0
	cmp r10,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_2871
	mov r15,r9
	mov rcx,r10
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r15,r15
	mov rdx,10
	cmp r15,rdx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_2872
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r12,rdi
	mov rdx,32
	cmp r12,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2873
	mov rbx,0
	mov r15,rbx
	jmp L_2874
	
L_2873:
	mov rbx,126
	cmp r12,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2874:
	cmp r15, 0
	je L_2875
	mov rbx,  [gbl+8*108]
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
	jmp L_2877
	
L_2875:
	mov rbx,t125
	mov r15,rbx
	
L_2877:
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
	jmp L_2878
	
L_2872:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r12,rdi
	mov rax,32
	cmp r12,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2879
	mov rbx,0
	mov r15,rbx
	jmp L_2880
	
L_2879:
	mov rbx,126
	cmp r12,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2880:
	cmp r15, 0
	je L_2881
	mov rbx,  [gbl+8*108]
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
	jmp L_2883
	
L_2881:
	mov rbx,t125
	mov r15,rbx
	
L_2883:
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
	
L_2878:
	mov rbx,4
	mov r15,r10
	sub r15,rbx
	mov r10,r15
	jmp L_2870
	
L_2871:
	mov r15,r11
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
	mov r9,rdi
	mov rdx,t127
	mov r11,rdx
	mov rax,28
	mov r10,rax
	
L_2887:
	mov rbx,0
	cmp r10,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_2888
	mov r15,r9
	mov rcx,r10
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r15,r15
	mov rdx,10
	cmp r15,rdx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_2889
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r12,rdi
	mov rdx,32
	cmp r12,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2890
	mov rbx,0
	mov r15,rbx
	jmp L_2891
	
L_2890:
	mov rbx,126
	cmp r12,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2891:
	cmp r15, 0
	je L_2892
	mov rbx,  [gbl+8*108]
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
	jmp L_2894
	
L_2892:
	mov rbx,t125
	mov r15,rbx
	
L_2894:
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
	jmp L_2895
	
L_2889:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r12,rdi
	mov rax,32
	cmp r12,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2896
	mov rbx,0
	mov r15,rbx
	jmp L_2897
	
L_2896:
	mov rbx,126
	cmp r12,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2897:
	cmp r15, 0
	je L_2898
	mov rbx,  [gbl+8*108]
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
	jmp L_2900
	
L_2898:
	mov rbx,t125
	mov r15,rbx
	
L_2900:
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
	
L_2895:
	mov rbx,4
	mov r15,r10
	sub r15,rbx
	mov r10,r15
	jmp L_2887
	
L_2888:
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
	mov r9,rdi
	mov rdx,t127
	mov r11,rdx
	mov rax,28
	mov r10,rax
	
L_2904:
	mov rbx,0
	cmp r10,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_2905
	mov r15,r9
	mov rcx,r10
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r15,r15
	mov rdx,10
	cmp r15,rdx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_2906
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r12,rdi
	mov rdx,32
	cmp r12,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2907
	mov rbx,0
	mov r15,rbx
	jmp L_2908
	
L_2907:
	mov rbx,126
	cmp r12,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2908:
	cmp r15, 0
	je L_2909
	mov rbx,  [gbl+8*108]
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
	jmp L_2911
	
L_2909:
	mov rbx,t125
	mov r15,rbx
	
L_2911:
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
	jmp L_2912
	
L_2906:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r12,rdi
	mov rax,32
	cmp r12,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2913
	mov rbx,0
	mov r15,rbx
	jmp L_2914
	
L_2913:
	mov rbx,126
	cmp r12,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2914:
	cmp r15, 0
	je L_2915
	mov rbx,  [gbl+8*108]
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
	jmp L_2917
	
L_2915:
	mov rbx,t125
	mov r15,rbx
	
L_2917:
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
	
L_2912:
	mov rbx,4
	mov r15,r10
	sub r15,rbx
	mov r10,r15
	jmp L_2904
	
L_2905:
	mov r15,r11
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
	mov r9,rdi
	mov rdx,t127
	mov r11,rdx
	mov rax,28
	mov r10,rax
	
L_2921:
	mov rbx,0
	cmp r10,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_2922
	mov r15,r9
	mov rcx,r10
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r15,r15
	mov rdx,10
	cmp r15,rdx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_2923
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r12,rdi
	mov rdx,32
	cmp r12,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2924
	mov rbx,0
	mov r15,rbx
	jmp L_2925
	
L_2924:
	mov rbx,126
	cmp r12,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2925:
	cmp r15, 0
	je L_2926
	mov rbx,  [gbl+8*108]
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
	jmp L_2928
	
L_2926:
	mov rbx,t125
	mov r15,rbx
	
L_2928:
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
	jmp L_2929
	
L_2923:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r12,rdi
	mov rax,32
	cmp r12,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_2930
	mov rbx,0
	mov r15,rbx
	jmp L_2931
	
L_2930:
	mov rbx,126
	cmp r12,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_2931:
	cmp r15, 0
	je L_2932
	mov rbx,  [gbl+8*108]
	mov r13,rbx
	mov rdx,32
	mov r14,r12
	sub r14,rdx
	mov rax,32
	mov r15,r12
	sub r15,rax
	mov rsi,r15
	mov rdi,r14
	mov rdx,r13
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
	jmp L_2934
	
L_2932:
	mov rbx,t125
	mov r15,rbx
	
L_2934:
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
	
L_2929:
	mov rbx,4
	mov r15,r10
	sub r15,rbx
	mov r10,r15
	jmp L_2921
	
L_2922:
	mov r15,r11
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

