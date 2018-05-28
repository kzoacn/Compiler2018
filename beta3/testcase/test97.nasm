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
	mov r15,rbx
	mov qword [rsp+8*3],rax
	mov rax,1
	mov rbx,rax
	mov rax,20
	mov r14,rax
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
	mov r11,rbx
	mov qword [rsp+8*12],rdx
	mov qword [rsp+8*11],rax
	
L_2746:
	mov rbx,  [rsp+8*3]
	cmp r11,rbx
	mov r13, 0
	setl r13B
	cmp r13, 0
	je L_2747
	mov rdx,  [rsp+8*4]
	mov rbx,rdx
	mov qword [rsp+8*15],rbx
	
L_2749:
	mov rbx,  [rsp+8*15]
	cmp rbx,r15
	mov r13, 0
	setl r13B
	cmp r13, 0
	je L_2750
	mov rdx,  [rsp+8*6]
	mov rbx,rdx
	mov qword [rsp+8*17],rbx
	
L_2752:
	mov rbx,  [rsp+8*17]
	cmp rbx,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	je L_2753
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*8]
	mov rsi,rax
	mov qword [arg+8*2],rbx
	mov rbx,  [rsp+8*2]
	mov rdi,rbx
	mov r10,rdi
	mov r12,rsi
	mov rbx,  [arg+8*2]
	mov r13,rbx
	mov rdx,31
	and r13,rdx
	mov r13,r13
	mov rsi,r12
	mov rdi,r10
	mov r10,rdi
	mov rax,rsi
	mov rbx,1
	add r10,rbx
	mov rdx,r10
	mov qword [rsp+8*28],rax
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*30],rdx
	mov qword [rsp+8*31],rax
	
L_3109:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r10,rbx
	imul r10,rdx
	mov rax,  [rsp+8*31]
	cmp rax,r10
	mov r10, 0
	setl r10B
	mov rbx,  [rsp+8*33]
	add rbx,rbx
	cmp r10, 0
	mov qword [rsp+8*33],rbx
	je L_3111
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov rbx,17
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov qword [rsp+8*38],rdx
	mov rdx,rsi
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*46],rdx
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	mov rbx,r10
	mov rax,  [rsp+8*46]
	mov r10,rbx
	mov rcx,rax
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*38],rdx
	mov rdx,1
	add r10,rdx
	mov rbx,r10
	mov r10,r9
	mov rcx,rax
	shr r10,cl
	and r10,rbx
	mov rbx,r10
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rbx
	mov r10,r10
	mov r10,r10
	mov rdx,  [rsp+8*48]
	and r10,rdx
	mov r10,r10
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov qword [rsp+8*38],rbx
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*30],rax
	mov rax,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rax
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rdx,  [rsp+8*30]
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r10,rbx
	mov qword [rsp+8*38],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_3109
	
L_3111:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r10,r10
	mov r12,r10
	mov r12,r12
	mov rsi,r13
	mov rdi,r12
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov rax,r10
	mov rbx,32
	sub r13,rbx
	neg r13
	mov rsi,r13
	mov rdi,r12
	mov r9,rdi
	mov qword [rsp+8*38],rdx
	mov rdx,rsi
	mov qword [rsp+8*63],rax
	mov rax,65535
	mov rsi,rax
	mov rbx,32767
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*46],rdx
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	mov rax,r10
	mov rbx,  [rsp+8*46]
	mov r10,rax
	mov rcx,rbx
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*38],rdx
	mov rdx,1
	add r10,rdx
	mov rax,r10
	mov r10,r9
	mov rcx,rbx
	shr r10,cl
	and r10,rax
	mov rax,r10
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*48],rax
	mov rax,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rax
	mov r10,r10
	mov r10,r10
	mov rdx,  [rsp+8*48]
	and r10,rdx
	mov r10,r10
	mov r13,r10
	mov rbx,  [rsp+8*63]
	or r13,rbx
	mov r13,r13
	mov r13,r13
	mov qword [rsp+8*38],rax
	mov rax,r13
	mov rbx,  [rsp+8*17]
	mov rdx,rbx
	mov qword [rsp+8*69],rax
	mov rax,  [rsp+8*8]
	mov rsi,rax
	mov rdi,r11
	mov r10,rdi
	mov r12,rsi
	mov r13,rdx
	mov rbx,31
	and r13,rbx
	mov r13,r13
	mov rsi,r12
	mov rdi,r10
	mov r10,rdi
	mov rax,rsi
	mov qword [arg+8*2],rdx
	mov rdx,1
	add r10,rdx
	mov rbx,r10
	mov qword [rsp+8*28],rax
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rax
	
L_3141:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r10,rbx
	imul r10,rdx
	mov rax,  [rsp+8*31]
	cmp rax,r10
	mov r10, 0
	setl r10B
	mov rbx,  [rsp+8*33]
	add rbx,rbx
	cmp r10, 0
	mov qword [rsp+8*33],rbx
	je L_3143
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov rbx,17
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov qword [rsp+8*38],rdx
	mov rdx,rsi
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*46],rdx
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	mov rbx,r10
	mov rax,  [rsp+8*46]
	mov r10,rbx
	mov rcx,rax
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*38],rdx
	mov rdx,1
	add r10,rdx
	mov rbx,r10
	mov r10,r9
	mov rcx,rax
	shr r10,cl
	and r10,rbx
	mov rbx,r10
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rbx
	mov r10,r10
	mov r10,r10
	mov rdx,  [rsp+8*48]
	and r10,rdx
	mov r10,r10
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov qword [rsp+8*38],rbx
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*30],rax
	mov rax,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rax
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rdx,  [rsp+8*30]
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r10,rbx
	mov qword [rsp+8*38],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_3141
	
L_3143:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r10,r10
	mov r12,r10
	mov r12,r12
	mov rsi,r13
	mov rdi,r12
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov rax,r10
	mov rbx,32
	sub r13,rbx
	neg r13
	mov rsi,r13
	mov rdi,r12
	mov r9,rdi
	mov qword [rsp+8*38],rdx
	mov rdx,rsi
	mov qword [rsp+8*63],rax
	mov rax,65535
	mov rsi,rax
	mov rbx,32767
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*46],rdx
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	mov rax,r10
	mov rbx,  [rsp+8*46]
	mov r10,rax
	mov rcx,rbx
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*38],rdx
	mov rdx,1
	add r10,rdx
	mov rax,r10
	mov r10,r9
	mov rcx,rbx
	shr r10,cl
	and r10,rax
	mov rax,r10
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*48],rax
	mov rax,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rax
	mov r10,r10
	mov r10,r10
	mov rdx,  [rsp+8*48]
	and r10,rdx
	mov r10,r10
	mov r13,r10
	mov rbx,  [rsp+8*63]
	or r13,rbx
	mov r13,r13
	mov r13,r13
	mov qword [rsp+8*38],rax
	mov rax,r13
	mov rbx,  [rsp+8*17]
	mov rdx,rbx
	mov qword [rsp+8*71],rax
	mov rax,  [rsp+8*8]
	mov rsi,rax
	mov rbx,  [rsp+8*15]
	mov rdi,rbx
	mov r10,rdi
	mov r12,rsi
	mov r13,rdx
	mov rax,31
	and r13,rax
	mov r13,r13
	mov rsi,r12
	mov rdi,r10
	mov r10,rdi
	mov rbx,rsi
	mov qword [arg+8*2],rdx
	mov rdx,1
	add r10,rdx
	mov rax,r10
	mov qword [rsp+8*28],rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rax
	
L_3173:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r10,rbx
	imul r10,rdx
	mov rax,  [rsp+8*31]
	cmp rax,r10
	mov r10, 0
	setl r10B
	mov rbx,  [rsp+8*33]
	add rbx,rbx
	cmp r10, 0
	mov qword [rsp+8*33],rbx
	je L_3175
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov rbx,17
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov qword [rsp+8*38],rdx
	mov rdx,rsi
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*46],rdx
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	mov rbx,r10
	mov rax,  [rsp+8*46]
	mov r10,rbx
	mov rcx,rax
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*38],rdx
	mov rdx,1
	add r10,rdx
	mov rbx,r10
	mov r10,r9
	mov rcx,rax
	shr r10,cl
	and r10,rbx
	mov rbx,r10
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rbx
	mov r10,r10
	mov r10,r10
	mov rdx,  [rsp+8*48]
	and r10,rdx
	mov r10,r10
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov qword [rsp+8*38],rbx
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*30],rax
	mov rax,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rax
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rdx,  [rsp+8*30]
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r10,rbx
	mov qword [rsp+8*38],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_3173
	
L_3175:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r10,r10
	mov r12,r10
	mov r12,r12
	mov rsi,r13
	mov rdi,r12
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov rax,r10
	mov rbx,32
	sub r13,rbx
	neg r13
	mov rsi,r13
	mov rdi,r12
	mov r9,rdi
	mov qword [rsp+8*38],rdx
	mov rdx,rsi
	mov qword [rsp+8*63],rax
	mov rax,65535
	mov rsi,rax
	mov rbx,32767
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*46],rdx
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	mov rax,r10
	mov rbx,  [rsp+8*46]
	mov r10,rax
	mov rcx,rbx
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*38],rdx
	mov rdx,1
	add r10,rdx
	mov rax,r10
	mov r10,r9
	mov rcx,rbx
	shr r10,cl
	and r10,rax
	mov rax,r10
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*48],rax
	mov rax,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rax
	mov r10,r10
	mov r10,r10
	mov rdx,  [rsp+8*48]
	and r10,rdx
	mov r10,r10
	mov r13,r10
	mov rbx,  [rsp+8*63]
	or r13,rbx
	mov r13,r13
	mov r13,r13
	mov qword [rsp+8*38],rax
	mov rax,r13
	mov rdx,  [rsp+8*15]
	mov r13,r11
	xor r13,rdx
	mov qword [rsp+8*73],rax
	mov rax,  [rsp+8*17]
	mov rbx,rax
	mov rdx,  [rsp+8*8]
	mov rsi,rdx
	mov rdi,r13
	mov r10,rdi
	mov r12,rsi
	mov r13,rbx
	mov qword [arg+8*2],rbx
	mov rbx,31
	and r13,rbx
	mov r13,r13
	mov rsi,r12
	mov rdi,r10
	mov r10,rdi
	mov rbx,rsi
	mov rdx,1
	add r10,rdx
	mov rax,r10
	mov qword [rsp+8*28],rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rax
	
L_3205:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r10,rbx
	imul r10,rdx
	mov rax,  [rsp+8*31]
	cmp rax,r10
	mov r10, 0
	setl r10B
	mov rbx,  [rsp+8*33]
	add rbx,rbx
	cmp r10, 0
	mov qword [rsp+8*33],rbx
	je L_3207
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov rbx,17
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov qword [rsp+8*38],rdx
	mov rdx,rsi
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*46],rdx
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	mov rbx,r10
	mov rax,  [rsp+8*46]
	mov r10,rbx
	mov rcx,rax
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*38],rdx
	mov rdx,1
	add r10,rdx
	mov rbx,r10
	mov r10,r9
	mov rcx,rax
	shr r10,cl
	and r10,rbx
	mov rbx,r10
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rbx
	mov r10,r10
	mov r10,r10
	mov rdx,  [rsp+8*48]
	and r10,rdx
	mov r10,r10
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov qword [rsp+8*38],rbx
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*30],rax
	mov rax,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rax
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rdx,  [rsp+8*30]
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r10,rbx
	mov qword [rsp+8*38],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_3205
	
L_3207:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r10,r10
	mov r12,r10
	mov r12,r12
	mov rsi,r13
	mov rdi,r12
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov rax,r10
	mov rbx,32
	sub r13,rbx
	neg r13
	mov rsi,r13
	mov rdi,r12
	mov r9,rdi
	mov rbx,rsi
	mov qword [rsp+8*38],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*63],rax
	mov rax,32767
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*46],rbx
	mov rbx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rbx
	mov r10,r10
	mov r10,r10
	mov rdx,r10
	mov rax,  [rsp+8*46]
	mov r10,rdx
	mov rcx,rax
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*38],rbx
	mov rbx,1
	add r10,rbx
	mov rdx,r10
	mov r10,r9
	mov rcx,rax
	shr r10,cl
	and r10,rdx
	mov rdx,r10
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*48],rdx
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	mov rbx,  [rsp+8*48]
	and r10,rbx
	mov r10,r10
	mov r13,r10
	mov rax,  [rsp+8*63]
	or r13,rax
	mov r13,r13
	mov r13,r13
	mov rax,r13
	mov qword [rsp+8*38],rdx
	mov rdx,1
	mov rsi,rdx
	mov rdx,  [rsp+8*17]
	mov rdi,rdx
	mov r10,rdi
	mov rbx,rsi
	mov qword [rsp+8*76],rax
	mov rax,1
	add r10,rax
	mov rdx,r10
	mov qword [rsp+8*28],rbx
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	
L_2917:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r10,rbx
	imul r10,rdx
	mov rax,  [rsp+8*31]
	cmp rax,r10
	mov r10, 0
	setl r10B
	mov rbx,  [rsp+8*33]
	add rbx,rbx
	cmp r10, 0
	mov qword [rsp+8*33],rbx
	je L_2919
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov rbx,17
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov qword [rsp+8*38],rdx
	mov rdx,rsi
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*46],rdx
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	mov rbx,r10
	mov rax,  [rsp+8*46]
	mov r10,rbx
	mov rcx,rax
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*38],rdx
	mov rdx,1
	add r10,rdx
	mov rbx,r10
	mov r10,r9
	mov rcx,rax
	shr r10,cl
	and r10,rbx
	mov rbx,r10
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rbx
	mov r10,r10
	mov r10,r10
	mov rdx,  [rsp+8*48]
	and r10,rdx
	mov r10,r10
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov qword [rsp+8*38],rbx
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*30],rax
	mov rax,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rax
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rdx,  [rsp+8*30]
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r10,rbx
	mov qword [rsp+8*38],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_2917
	
L_2919:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r10,r10
	mov r13,r10
	mov rax,1
	mov rsi,rax
	mov rax,  [rsp+8*15]
	mov rdi,rax
	mov r10,rdi
	mov rbx,rsi
	mov rdx,1
	add r10,rdx
	mov rax,r10
	mov qword [rsp+8*28],rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rax
	
L_2937:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r10,rbx
	imul r10,rdx
	mov rax,  [rsp+8*31]
	cmp rax,r10
	mov r10, 0
	setl r10B
	mov rbx,  [rsp+8*33]
	add rbx,rbx
	cmp r10, 0
	mov qword [rsp+8*33],rbx
	je L_2939
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov rbx,17
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov qword [rsp+8*38],rdx
	mov rdx,rsi
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*46],rdx
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	mov rbx,r10
	mov rax,  [rsp+8*46]
	mov r10,rbx
	mov rcx,rax
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*38],rdx
	mov rdx,1
	add r10,rdx
	mov rbx,r10
	mov r10,r9
	mov rcx,rax
	shr r10,cl
	and r10,rbx
	mov rbx,r10
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rbx
	mov r10,r10
	mov r10,r10
	mov rdx,  [rsp+8*48]
	and r10,rdx
	mov r10,r10
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov qword [rsp+8*38],rbx
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*30],rax
	mov rax,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rax
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rdx,  [rsp+8*30]
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r10,rbx
	mov qword [rsp+8*38],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_2937
	
L_2939:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r10,r10
	mov r12,r10
	xor r12,r13
	mov rax,1
	mov rsi,rax
	mov rdi,r11
	mov r10,rdi
	mov rax,rsi
	mov rbx,1
	add r10,rbx
	mov rdx,r10
	mov qword [rsp+8*28],rax
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*30],rdx
	mov qword [rsp+8*31],rax
	
L_2957:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r10,rbx
	imul r10,rdx
	mov rax,  [rsp+8*31]
	cmp rax,r10
	mov r10, 0
	setl r10B
	mov rbx,  [rsp+8*33]
	add rbx,rbx
	cmp r10, 0
	mov qword [rsp+8*33],rbx
	je L_2959
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov rbx,17
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov qword [rsp+8*38],rdx
	mov rdx,rsi
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*46],rdx
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	mov rbx,r10
	mov rax,  [rsp+8*46]
	mov r10,rbx
	mov rcx,rax
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*38],rdx
	mov rdx,1
	add r10,rdx
	mov rbx,r10
	mov r10,r9
	mov rcx,rax
	shr r10,cl
	and r10,rbx
	mov rbx,r10
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rbx
	mov r10,r10
	mov r10,r10
	mov rdx,  [rsp+8*48]
	and r10,rdx
	mov r10,r10
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov qword [rsp+8*38],rbx
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*30],rax
	mov rax,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rax
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rdx,  [rsp+8*30]
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r10,rbx
	mov qword [rsp+8*38],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_2957
	
L_2959:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r10,r10
	mov r13,r10
	xor r12,r13
	mov r13,r12
	mov rax,  [rsp+8*69]
	mov r12,rax
	xor r12,r13
	mov rax,1
	mov rsi,rax
	mov rdi,r12
	mov r10,rdi
	mov rax,rsi
	mov rbx,1
	add r10,rbx
	mov rdx,r10
	mov qword [rsp+8*28],rax
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*30],rdx
	mov qword [rsp+8*31],rax
	
L_2977:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r10,rbx
	imul r10,rdx
	mov rax,  [rsp+8*31]
	cmp rax,r10
	mov r10, 0
	setl r10B
	mov rbx,  [rsp+8*33]
	add rbx,rbx
	cmp r10, 0
	mov qword [rsp+8*33],rbx
	je L_2979
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov rbx,17
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov qword [rsp+8*38],rdx
	mov rdx,rsi
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*46],rdx
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	mov rbx,r10
	mov rax,  [rsp+8*46]
	mov r10,rbx
	mov rcx,rax
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*38],rdx
	mov rdx,1
	add r10,rdx
	mov rbx,r10
	mov r10,r9
	mov rcx,rax
	shr r10,cl
	and r10,rbx
	mov rbx,r10
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rbx
	mov r10,r10
	mov r10,r10
	mov rdx,  [rsp+8*48]
	and r10,rdx
	mov r10,r10
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov qword [rsp+8*38],rbx
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*30],rax
	mov rax,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rax
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rdx,  [rsp+8*30]
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r10,rbx
	mov qword [rsp+8*38],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_2977
	
L_2979:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r10,r10
	mov r12,r10
	mov rax,  [rsp+8*9]
	add r12,rax
	mov rax,r12
	mov rbx,  [rsp+8*71]
	mov r12,rbx
	xor r12,r13
	mov rbx,1
	mov rsi,rbx
	mov rdi,r12
	mov r10,rdi
	mov rbx,rsi
	mov rdx,1
	add r10,rdx
	mov qword [rsp+8*9],rax
	mov rax,r10
	mov qword [rsp+8*28],rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rax
	
L_2997:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r10,rbx
	imul r10,rdx
	mov rax,  [rsp+8*31]
	cmp rax,r10
	mov r10, 0
	setl r10B
	mov rbx,  [rsp+8*33]
	add rbx,rbx
	cmp r10, 0
	mov qword [rsp+8*33],rbx
	je L_2999
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov rbx,17
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov qword [rsp+8*38],rdx
	mov rdx,rsi
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*46],rdx
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	mov rbx,r10
	mov rax,  [rsp+8*46]
	mov r10,rbx
	mov rcx,rax
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*38],rdx
	mov rdx,1
	add r10,rdx
	mov rbx,r10
	mov r10,r9
	mov rcx,rax
	shr r10,cl
	and r10,rbx
	mov rbx,r10
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rbx
	mov r10,r10
	mov r10,r10
	mov rdx,  [rsp+8*48]
	and r10,rdx
	mov r10,r10
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov qword [rsp+8*38],rbx
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*30],rax
	mov rax,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rax
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rdx,  [rsp+8*30]
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r10,rbx
	mov qword [rsp+8*38],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_2997
	
L_2999:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r10,r10
	mov r12,r10
	mov rax,  [rsp+8*10]
	add r12,rax
	mov rax,r12
	mov rbx,  [rsp+8*73]
	mov r12,rbx
	xor r12,r13
	mov rbx,1
	mov rsi,rbx
	mov rdi,r12
	mov r10,rdi
	mov rbx,rsi
	mov rdx,1
	add r10,rdx
	mov qword [rsp+8*10],rax
	mov rax,r10
	mov qword [rsp+8*28],rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rax
	
L_3017:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r10,rbx
	imul r10,rdx
	mov rax,  [rsp+8*31]
	cmp rax,r10
	mov r10, 0
	setl r10B
	mov rbx,  [rsp+8*33]
	add rbx,rbx
	cmp r10, 0
	mov qword [rsp+8*33],rbx
	je L_3019
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov rbx,17
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov qword [rsp+8*38],rdx
	mov rdx,rsi
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*46],rdx
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	mov rbx,r10
	mov rax,  [rsp+8*46]
	mov r10,rbx
	mov rcx,rax
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*38],rdx
	mov rdx,1
	add r10,rdx
	mov rbx,r10
	mov r10,r9
	mov rcx,rax
	shr r10,cl
	and r10,rbx
	mov rbx,r10
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r10,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rbx
	mov r10,r10
	mov r10,r10
	mov rdx,  [rsp+8*48]
	and r10,rdx
	mov r10,r10
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov qword [rsp+8*38],rbx
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov qword [rsp+8*30],rax
	mov rax,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rax
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rdx,  [rsp+8*30]
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r10,rbx
	mov qword [rsp+8*38],rax
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_3017
	
L_3019:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r10,r10
	mov r12,r10
	mov rax,  [rsp+8*11]
	add r12,rax
	mov rax,r12
	mov rbx,  [rsp+8*76]
	xor r13,rbx
	mov rbx,1
	mov rsi,rbx
	mov rdi,r13
	mov r10,rdi
	mov rbx,rsi
	mov rdx,1
	add r10,rdx
	mov rdx,r10
	mov qword [rsp+8*11],rax
	mov qword [rsp+8*28],rbx
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*30],rdx
	mov qword [rsp+8*31],rax
	
L_3037:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov r10,rbx
	imul r10,rdx
	mov rax,  [rsp+8*31]
	cmp rax,r10
	mov r10, 0
	setl r10B
	mov rbx,  [rsp+8*33]
	add rbx,rbx
	cmp r10, 0
	mov qword [rsp+8*33],rbx
	je L_3039
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	mov rax,  [rsp+8*30]
	xor r10,rax
	mov rax,r10
	mov rbx,17
	mov rsi,rbx
	mov rdi,rax
	mov r9,rdi
	mov rbx,rsi
	mov qword [rsp+8*38],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rdx,32767
	mov rdi,rdx
	mov r10,rdi
	mov rdx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rdx
	mov r10,r10
	mov r10,r10
	mov qword [rsp+8*30],rax
	mov rax,r10
	mov r10,rax
	mov rcx,rbx
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*38],rdx
	mov rdx,1
	add r10,rdx
	mov rax,r10
	mov r10,r9
	mov rcx,rbx
	shr r10,cl
	and r10,rax
	mov rax,r10
	mov qword [rsp+8*46],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rbx,65535
	mov rdi,rbx
	mov r10,rdi
	mov rbx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rbx
	mov r10,r10
	mov r10,r10
	and r10,rax
	mov r10,r10
	mov r10,r10
	mov rdx,  [rsp+8*30]
	xor r10,rdx
	mov rdx,r10
	mov qword [rsp+8*48],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov r9,rdi
	mov r10,rsi
	mov r9,r9
	mov rcx,r10
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rax,65535
	mov rdi,rax
	mov r10,rdi
	mov rbx,rsi
	mov r10,r10
	mov rcx,16
	shl r10,cl
	or r10,rbx
	mov r10,r10
	mov r10,r10
	and r9,r10
	mov r10,r9
	mov r10,r10
	xor r10,rdx
	mov rdx,r10
	mov qword [rsp+8*38],rbx
	mov rbx,  [rsp+8*31]
	mov r10,rbx
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_3037
	
L_3039:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r10,r10
	mov r13,r10
	mov rax,  [rsp+8*12]
	add r13,rax
	mov rax,r13
	mov rbx,  [rsp+8*17]
	mov r13,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*17],rbx
	mov qword [rsp+8*12],rax
	jmp L_2752
	
L_2753:
	mov rbx,  [rsp+8*15]
	mov r13,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*15],rbx
	jmp L_2749
	
L_2750:
	mov r13,r11
	mov rbx,1
	add r11,rbx
	jmp L_2746
	
L_2747:
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov r10,rdi
	mov rdx,t127
	mov r13,rdx
	mov rax,28
	mov r15,rax
	
L_2829:
	mov rbx,0
	cmp r15,rbx
	mov r14, 0
	setge r14B
	cmp r14, 0
	je L_2830
	mov r14,r10
	mov rcx,r15
	shr r14,cl
	mov rbx,15
	and r14,rbx
	mov r14,r14
	mov rdx,10
	cmp r14,rdx
	mov r12, 0
	setl r12B
	cmp r12, 0
	je L_2831
	mov rbx,48
	add r14,rbx
	mov rdi,r14
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r12, 0
	setge r12B
	cmp r12, 0
	jne L_2832
	mov rbx,0
	mov r12,rbx
	jmp L_2833
	
L_2832:
	mov rbx,126
	cmp r14,rbx
	mov r12, 0
	setle r12B
	mov r12,r12
	
L_2833:
	cmp r12, 0
	je L_2834
	mov rbx,  [gbl+8*108]
	mov r11,rbx
	mov rdx,32
	mov r12,r14
	sub r12,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r12
	mov rbx,r11
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r14,r14
	jmp L_2836
	
L_2834:
	mov rbx,t125
	mov r14,rbx
	
L_2836:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r13,r14
	jmp L_2837
	
L_2831:
	mov rbx,65
	add r14,rbx
	mov rdx,10
	sub r14,rdx
	mov rdi,r14
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r12, 0
	setge r12B
	cmp r12, 0
	jne L_2838
	mov rbx,0
	mov r12,rbx
	jmp L_2839
	
L_2838:
	mov rbx,126
	cmp r14,rbx
	mov r12, 0
	setle r12B
	mov r12,r12
	
L_2839:
	cmp r12, 0
	je L_2840
	mov rbx,  [gbl+8*108]
	mov r11,rbx
	mov rdx,32
	mov r12,r14
	sub r12,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r12
	mov rbx,r11
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r14,r14
	jmp L_2842
	
L_2840:
	mov rbx,t125
	mov r14,rbx
	
L_2842:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r13,r14
	
L_2837:
	mov rbx,4
	sub r15,rbx
	mov r15,r15
	jmp L_2829
	
L_2830:
	mov r15,r13
	mov r15,r15
	mov     rsi, t222
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, format
	mov rsi, r15 
	add rsi, 1 
	xor rax, rax
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call printf
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rbx,  [rsp+8*10]
	mov rdi,rbx
	mov r10,rdi
	mov rdx,t127
	mov r13,rdx
	mov rax,28
	mov r15,rax
	
L_2846:
	mov rbx,0
	cmp r15,rbx
	mov r14, 0
	setge r14B
	cmp r14, 0
	je L_2847
	mov r14,r10
	mov rcx,r15
	shr r14,cl
	mov rbx,15
	and r14,rbx
	mov r14,r14
	mov rdx,10
	cmp r14,rdx
	mov r12, 0
	setl r12B
	cmp r12, 0
	je L_2848
	mov rbx,48
	add r14,rbx
	mov rdi,r14
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r12, 0
	setge r12B
	cmp r12, 0
	jne L_2849
	mov rbx,0
	mov r12,rbx
	jmp L_2850
	
L_2849:
	mov rbx,126
	cmp r14,rbx
	mov r12, 0
	setle r12B
	mov r12,r12
	
L_2850:
	cmp r12, 0
	je L_2851
	mov rbx,  [gbl+8*108]
	mov r11,rbx
	mov rdx,32
	mov r12,r14
	sub r12,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r12
	mov rbx,r11
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r14,r14
	jmp L_2853
	
L_2851:
	mov rbx,t125
	mov r14,rbx
	
L_2853:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r13,r14
	jmp L_2854
	
L_2848:
	mov rbx,65
	add r14,rbx
	mov rdx,10
	sub r14,rdx
	mov rdi,r14
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r12, 0
	setge r12B
	cmp r12, 0
	jne L_2855
	mov rbx,0
	mov r12,rbx
	jmp L_2856
	
L_2855:
	mov rbx,126
	cmp r14,rbx
	mov r12, 0
	setle r12B
	mov r12,r12
	
L_2856:
	cmp r12, 0
	je L_2857
	mov rbx,  [gbl+8*108]
	mov r11,rbx
	mov rdx,32
	mov r12,r14
	sub r12,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r12
	mov rbx,r11
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r14,r14
	jmp L_2859
	
L_2857:
	mov rbx,t125
	mov r14,rbx
	
L_2859:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r13,r14
	
L_2854:
	mov rbx,4
	sub r15,rbx
	mov r15,r15
	jmp L_2846
	
L_2847:
	mov r15,r13
	mov r15,r15
	mov     rsi, t229
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, format
	mov rsi, r15 
	add rsi, 1 
	xor rax, rax
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call printf
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rbx,  [rsp+8*11]
	mov rdi,rbx
	mov r10,rdi
	mov rdx,t127
	mov r13,rdx
	mov rax,28
	mov r15,rax
	
L_2863:
	mov rbx,0
	cmp r15,rbx
	mov r14, 0
	setge r14B
	cmp r14, 0
	je L_2864
	mov r14,r10
	mov rcx,r15
	shr r14,cl
	mov rbx,15
	and r14,rbx
	mov r14,r14
	mov rdx,10
	cmp r14,rdx
	mov r12, 0
	setl r12B
	cmp r12, 0
	je L_2865
	mov rbx,48
	add r14,rbx
	mov rdi,r14
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r12, 0
	setge r12B
	cmp r12, 0
	jne L_2866
	mov rbx,0
	mov r12,rbx
	jmp L_2867
	
L_2866:
	mov rbx,126
	cmp r14,rbx
	mov r12, 0
	setle r12B
	mov r12,r12
	
L_2867:
	cmp r12, 0
	je L_2868
	mov rbx,  [gbl+8*108]
	mov r11,rbx
	mov rdx,32
	mov r12,r14
	sub r12,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r12
	mov rbx,r11
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r14,r14
	jmp L_2870
	
L_2868:
	mov rbx,t125
	mov r14,rbx
	
L_2870:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r13,r14
	jmp L_2871
	
L_2865:
	mov rbx,65
	add r14,rbx
	mov rdx,10
	sub r14,rdx
	mov rdi,r14
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r12, 0
	setge r12B
	cmp r12, 0
	jne L_2872
	mov rbx,0
	mov r12,rbx
	jmp L_2873
	
L_2872:
	mov rbx,126
	cmp r14,rbx
	mov r12, 0
	setle r12B
	mov r12,r12
	
L_2873:
	cmp r12, 0
	je L_2874
	mov rbx,  [gbl+8*108]
	mov r11,rbx
	mov rdx,32
	mov r12,r14
	sub r12,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r12
	mov rbx,r11
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r14,r14
	jmp L_2876
	
L_2874:
	mov rbx,t125
	mov r14,rbx
	
L_2876:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r13,r14
	
L_2871:
	mov rbx,4
	sub r15,rbx
	mov r15,r15
	jmp L_2863
	
L_2864:
	mov r15,r13
	mov r15,r15
	mov     rsi, t236
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, format
	mov rsi, r15 
	add rsi, 1 
	xor rax, rax
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call printf
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov r10,rdi
	mov rdx,t127
	mov r13,rdx
	mov rax,28
	mov r15,rax
	
L_2880:
	mov rbx,0
	cmp r15,rbx
	mov r14, 0
	setge r14B
	cmp r14, 0
	je L_2881
	mov r14,r10
	mov rcx,r15
	shr r14,cl
	mov rbx,15
	and r14,rbx
	mov r14,r14
	mov rdx,10
	cmp r14,rdx
	mov r12, 0
	setl r12B
	cmp r12, 0
	je L_2882
	mov rbx,48
	add r14,rbx
	mov rdi,r14
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r12, 0
	setge r12B
	cmp r12, 0
	jne L_2883
	mov rbx,0
	mov r12,rbx
	jmp L_2884
	
L_2883:
	mov rbx,126
	cmp r14,rbx
	mov r12, 0
	setle r12B
	mov r12,r12
	
L_2884:
	cmp r12, 0
	je L_2885
	mov rbx,  [gbl+8*108]
	mov r11,rbx
	mov rdx,32
	mov r12,r14
	sub r12,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r12
	mov rbx,r11
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r14,r14
	jmp L_2887
	
L_2885:
	mov rbx,t125
	mov r14,rbx
	
L_2887:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r13,r14
	jmp L_2888
	
L_2882:
	mov rbx,65
	add r14,rbx
	mov rdx,10
	sub r14,rdx
	mov rdi,r14
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r12, 0
	setge r12B
	cmp r12, 0
	jne L_2889
	mov rbx,0
	mov r12,rbx
	jmp L_2890
	
L_2889:
	mov rbx,126
	cmp r14,rbx
	mov r12, 0
	setle r12B
	mov r12,r12
	
L_2890:
	cmp r12, 0
	je L_2891
	mov rbx,  [gbl+8*108]
	mov r11,rbx
	mov rdx,32
	mov r12,r14
	sub r12,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r12
	mov rdx,r11
	mov qword [arg+8*63],rdx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r14,r14
	jmp L_2893
	
L_2891:
	mov rbx,t125
	mov r14,rbx
	
L_2893:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r13,r14
	
L_2888:
	mov rbx,4
	sub r15,rbx
	mov r15,r15
	jmp L_2880
	
L_2881:
	mov r15,r13
	mov r15,r15
	mov     rsi, t243
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, format
	mov rsi, r15 
	add rsi, 1 
	xor rax, rax
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call printf
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rbx,t248
	mov rdi,rbx
	mov r15,rdi
	mov rdi, r15 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
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

