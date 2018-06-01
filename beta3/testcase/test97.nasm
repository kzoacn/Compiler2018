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
	call global_init
	mov rbx , rax
	mov rax,1
	mov rdx,rax
	mov qword [rsp+8*1],rbx
	mov rax,50
	mov rbx,rax
	mov qword [rsp+8*2],rdx
	mov rdx,1
	mov rax,rdx
	mov qword [rsp+8*3],rbx
	mov rbx,50
	mov rdx,rbx
	mov qword [rsp+8*4],rax
	mov rax,1
	mov rbx,rax
	mov qword [rsp+8*5],rdx
	mov rdx,20
	mov rax,rdx
	mov qword [rsp+8*6],rbx
	mov rbx,30
	mov rdx,rbx
	mov qword [rsp+8*7],rax
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*8],rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*9],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*10],rax
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*11],rdx
	mov rdx,  [rsp+8*2]
	mov rax,rdx
	mov qword [rsp+8*12],rbx
	mov qword [rsp+8*13],rax
	
L_2425:
	mov rbx,  [rsp+8*13]
	mov rdx,  [rsp+8*3]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*14],rax
	je L_2426
	mov rdx,  [rsp+8*4]
	mov rbx,rdx
	mov qword [rsp+8*15],rbx
	
L_2428:
	mov rbx,  [rsp+8*15]
	mov rdx,  [rsp+8*5]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*16],rax
	je L_2429
	mov rdx,  [rsp+8*6]
	mov rbx,rdx
	mov qword [rsp+8*17],rbx
	
L_2431:
	mov rbx,  [rsp+8*17]
	mov rdx,  [rsp+8*7]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*18],rax
	je L_2432
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*8]
	mov rsi,rax
	mov qword [arg+8*2],rbx
	mov rbx,  [rsp+8*2]
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*22],rbx
	mov rbx,  [arg+8*2]
	mov rax,rbx
	mov qword [rsp+8*23],rdx
	mov rdx,31
	mov rbx,rax
	and rbx,rdx
	mov qword [rsp+8*24],rax
	mov rax,rbx
	mov qword [rsp+8*25],rbx
	mov rbx,  [rsp+8*23]
	mov rsi,rbx
	mov rbx,  [rsp+8*22]
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*26],rax
	mov rax,1
	mov qword [rsp+8*28],rdx
	mov rdx,rbx
	add rdx,rax
	mov qword [rsp+8*27],rbx
	mov rbx,rdx
	mov qword [rsp+8*29],rdx
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rdx
	
L_2778:
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
	je L_2779
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
	jmp L_2778
	
L_2779:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*75],rax
	mov rax,rbx
	mov qword [rsp+8*76],rbx
	mov rbx,rax
	mov qword [rsp+8*77],rax
	mov rax,  [rsp+8*26]
	mov rsi,rax
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	mov qword [rsp+8*78],rbx
	mov rbx,rdx
	mov rcx,rax
	shl rbx,cl
	mov qword [rsp+8*79],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*80],rax
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
	mov rax,  [rsp+8*26]
	mov qword [rsp+8*88],rbx
	mov rbx,rdx
	sub rbx,rax
	mov rsi,rbx
	mov qword [rsp+8*89],rbx
	mov rbx,  [rsp+8*78]
	mov rdi,rbx
	mov rbx,rdi
	mov rax,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*90],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*91],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*93],rdx
	mov rdx,rbx
	mov qword [rsp+8*94],rbx
	mov rbx,rdx
	mov qword [rsp+8*95],rdx
	mov rdx,rbx
	mov qword [rsp+8*96],rbx
	mov rbx,  [rsp+8*91]
	mov qword [rsp+8*92],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
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
	mov qword [rsp+8*107],rdx
	mov rdx,rbx
	mov qword [rsp+8*109],rbx
	mov rbx,rdx
	mov qword [rsp+8*110],rdx
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
	
L_2809:
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
	je L_2810
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
	mov qword [rsp+8*130],rdx
	mov rdx,rbx
	mov qword [rsp+8*125],rbx
	mov rbx,rdx
	mov qword [rsp+8*131],rdx
	mov rdx,  [rsp+8*120]
	mov qword [rsp+8*128],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*132],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*133],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*120],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*134],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*135],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*136],rbx
	mov rbx,rax
	mov qword [rsp+8*137],rdx
	mov rdx,rbx
	mov qword [rsp+8*139],rbx
	mov rbx,rdx
	mov qword [rsp+8*140],rdx
	mov rdx,  [rsp+8*135]
	mov qword [rsp+8*138],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov qword [rsp+8*141],rbx
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*142],rax
	mov rax,  [rsp+8*134]
	mov rbx,  [rsp+8*135]
	mov qword [rsp+8*141],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rbx,  [rsp+8*141]
	and rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*143],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*141],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*144],rbx
	mov rbx,rax
	mov qword [rsp+8*145],rdx
	mov rdx,rbx
	mov qword [rsp+8*147],rbx
	mov rbx,  [rsp+8*141]
	mov qword [rsp+8*146],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*148],rdx
	mov rdx,rbx
	mov qword [rsp+8*150],rbx
	mov rbx,  [rsp+8*120]
	mov qword [rsp+8*149],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*151],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*152],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*120],rbx
	mov rbx,rax
	mov rcx,rdx
	shl rbx,cl
	mov qword [rsp+8*154],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*153],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*155],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*156],rbx
	mov rbx,rax
	mov qword [rsp+8*157],rdx
	mov rdx,rbx
	mov qword [rsp+8*159],rbx
	mov rbx,  [rsp+8*155]
	and rbx,rdx
	mov qword [rsp+8*160],rdx
	mov rdx,rbx
	mov qword [rsp+8*155],rbx
	mov rbx,rdx
	mov qword [rsp+8*161],rdx
	mov rdx,  [rsp+8*120]
	mov qword [rsp+8*158],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*162],rbx
	mov qword [rsp+8*163],rax
	mov rax,  [rsp+8*121]
	mov rbx,rax
	mov qword [rsp+8*164],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*120],rdx
	mov qword [rsp+8*121],rax
	jmp L_2809
	
L_2810:
	mov rbx,  [rsp+8*120]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*165],rax
	mov rax,rbx
	mov qword [rsp+8*166],rbx
	mov rbx,rax
	mov qword [rsp+8*167],rax
	mov rax,  [rsp+8*116]
	mov rsi,rax
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	mov qword [rsp+8*168],rbx
	mov rbx,rdx
	mov rcx,rax
	shl rbx,cl
	mov qword [rsp+8*169],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*170],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*171],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*172],rbx
	mov rbx,rax
	mov qword [rsp+8*173],rdx
	mov rdx,rbx
	mov qword [rsp+8*175],rbx
	mov rbx,  [rsp+8*171]
	and rbx,rdx
	mov qword [rsp+8*176],rdx
	mov rdx,rbx
	mov qword [rsp+8*171],rbx
	mov rbx,rdx
	mov qword [rsp+8*177],rdx
	mov rdx,32
	mov qword [rsp+8*174],rax
	mov rax,  [rsp+8*116]
	mov qword [rsp+8*178],rbx
	mov rbx,rdx
	sub rbx,rax
	mov rsi,rbx
	mov qword [rsp+8*179],rbx
	mov rbx,  [rsp+8*168]
	mov rdi,rbx
	mov rbx,rdi
	mov rax,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*180],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*181],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*183],rdx
	mov rdx,rbx
	mov qword [rsp+8*184],rbx
	mov rbx,rdx
	mov qword [rsp+8*185],rdx
	mov rdx,rbx
	mov qword [rsp+8*186],rbx
	mov rbx,  [rsp+8*181]
	mov qword [rsp+8*182],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*188],rax
	mov rax,  [rsp+8*180]
	mov rbx,  [rsp+8*181]
	mov qword [rsp+8*187],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rbx,  [rsp+8*187]
	and rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*189],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*187],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*190],rbx
	mov rbx,rax
	mov qword [rsp+8*191],rdx
	mov rdx,rbx
	mov qword [rsp+8*193],rbx
	mov rbx,  [rsp+8*187]
	mov qword [rsp+8*192],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*194],rdx
	mov rdx,rbx
	mov qword [rsp+8*196],rbx
	mov rbx,  [rsp+8*178]
	mov qword [rsp+8*195],rax
	mov rax,rbx
	or rax,rdx
	mov rbx,rax
	mov qword [rsp+8*197],rdx
	mov rdx,rbx
	mov qword [rsp+8*199],rbx
	mov rbx,rdx
	mov qword [rsp+8*200],rdx
	mov qword [rsp+8*198],rax
	mov rax,  [rsp+8*17]
	mov rdx,rax
	mov qword [rsp+8*201],rbx
	mov rbx,  [rsp+8*8]
	mov rsi,rbx
	mov qword [arg+8*2],rdx
	mov rdx,  [rsp+8*15]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*202],rax
	mov rax,  [arg+8*2]
	mov rdx,rax
	mov qword [rsp+8*203],rbx
	mov rbx,31
	mov rax,rdx
	and rax,rbx
	mov qword [rsp+8*204],rdx
	mov rdx,rax
	mov qword [rsp+8*205],rax
	mov rax,  [rsp+8*203]
	mov rsi,rax
	mov rax,  [rsp+8*202]
	mov rdi,rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*206],rdx
	mov rdx,1
	mov qword [rsp+8*208],rbx
	mov rbx,rax
	add rbx,rdx
	mov qword [rsp+8*207],rax
	mov rax,rbx
	mov qword [rsp+8*209],rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*211],rbx
	mov qword [rsp+8*210],rax
	
L_2840:
	mov rbx,  [rsp+8*208]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*211]
	cmp rbx,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*212],rax
	je L_2841
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*210]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*214],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*213],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*215],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov rax,rdx
	mov rcx,16
	shl rax,cl
	or rax,rbx
	mov qword [rsp+8*217],rbx
	mov rbx,rax
	mov qword [rsp+8*216],rdx
	mov rdx,rbx
	mov qword [rsp+8*219],rbx
	mov rbx,  [rsp+8*215]
	and rbx,rdx
	mov qword [rsp+8*220],rdx
	mov rdx,rbx
	mov qword [rsp+8*215],rbx
	mov rbx,rdx
	mov qword [rsp+8*221],rdx
	mov rdx,  [rsp+8*210]
	mov qword [rsp+8*218],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*222],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*223],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*210],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*224],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*225],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*226],rbx
	mov rbx,rax
	mov qword [rsp+8*227],rdx
	mov rdx,rbx
	mov qword [rsp+8*229],rbx
	mov rbx,rdx
	mov qword [rsp+8*230],rdx
	mov rdx,  [rsp+8*225]
	mov qword [rsp+8*228],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov qword [rsp+8*231],rbx
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*232],rax
	mov rax,  [rsp+8*224]
	mov rbx,  [rsp+8*225]
	mov qword [rsp+8*231],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rbx,  [rsp+8*231]
	and rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*233],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*231],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*234],rbx
	mov rbx,rax
	mov qword [rsp+8*235],rdx
	mov rdx,rbx
	mov qword [rsp+8*237],rbx
	mov rbx,  [rsp+8*231]
	mov qword [rsp+8*236],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*238],rdx
	mov rdx,rbx
	mov qword [rsp+8*240],rbx
	mov rbx,  [rsp+8*210]
	mov qword [rsp+8*239],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*241],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*242],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*210],rbx
	mov rbx,rax
	mov rcx,rdx
	shl rbx,cl
	mov qword [rsp+8*244],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*243],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*245],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*246],rbx
	mov rbx,rax
	mov qword [rsp+8*247],rdx
	mov rdx,rbx
	mov qword [rsp+8*249],rbx
	mov rbx,  [rsp+8*245]
	and rbx,rdx
	mov qword [rsp+8*250],rdx
	mov rdx,rbx
	mov qword [rsp+8*245],rbx
	mov rbx,rdx
	mov qword [rsp+8*251],rdx
	mov rdx,  [rsp+8*210]
	mov qword [rsp+8*248],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*252],rbx
	mov qword [rsp+8*253],rax
	mov rax,  [rsp+8*211]
	mov rbx,rax
	mov qword [rsp+8*254],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*210],rdx
	mov qword [rsp+8*211],rax
	jmp L_2840
	
L_2841:
	mov rbx,  [rsp+8*210]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*255],rax
	mov rax,rbx
	mov qword [rsp+8*256],rbx
	mov rbx,rax
	mov qword [rsp+8*257],rax
	mov rax,  [rsp+8*206]
	mov rsi,rax
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	mov qword [rsp+8*258],rbx
	mov rbx,rdx
	mov rcx,rax
	shl rbx,cl
	mov qword [rsp+8*259],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*260],rax
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
	mov rax,  [rsp+8*206]
	mov qword [rsp+8*268],rbx
	mov rbx,rdx
	sub rbx,rax
	mov rsi,rbx
	mov qword [rsp+8*269],rbx
	mov rbx,  [rsp+8*258]
	mov rdi,rbx
	mov rbx,rdi
	mov rax,rsi
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*270],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*271],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*273],rdx
	mov rdx,rbx
	mov qword [rsp+8*274],rbx
	mov rbx,rdx
	mov qword [rsp+8*275],rdx
	mov rdx,rbx
	mov qword [rsp+8*276],rbx
	mov rbx,  [rsp+8*271]
	mov qword [rsp+8*272],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*278],rax
	mov rax,  [rsp+8*270]
	mov rbx,  [rsp+8*271]
	mov qword [rsp+8*277],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rbx,  [rsp+8*277]
	and rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*279],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*277],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*280],rbx
	mov rbx,rax
	mov qword [rsp+8*281],rdx
	mov rdx,rbx
	mov qword [rsp+8*283],rbx
	mov rbx,  [rsp+8*277]
	mov qword [rsp+8*282],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*284],rdx
	mov rdx,rbx
	mov qword [rsp+8*286],rbx
	mov rbx,  [rsp+8*268]
	mov qword [rsp+8*285],rax
	mov rax,rbx
	or rax,rdx
	mov rbx,rax
	mov qword [rsp+8*287],rdx
	mov rdx,rbx
	mov qword [rsp+8*289],rbx
	mov rbx,rdx
	mov qword [rsp+8*290],rdx
	mov rdx,  [rsp+8*13]
	mov qword [rsp+8*288],rax
	mov rax,  [rsp+8*15]
	mov qword [rsp+8*291],rbx
	mov rbx,rdx
	xor rbx,rax
	mov qword [rsp+8*292],rbx
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*8]
	mov rsi,rax
	mov rax,  [rsp+8*292]
	mov rdi,rax
	mov rax,rdi
	mov qword [arg+8*2],rbx
	mov rbx,rsi
	mov qword [rsp+8*293],rax
	mov rax,  [arg+8*2]
	mov rdx,rax
	mov rax,31
	mov qword [rsp+8*294],rbx
	mov rbx,rdx
	and rbx,rax
	mov qword [rsp+8*295],rdx
	mov rdx,rbx
	mov qword [rsp+8*296],rbx
	mov rbx,  [rsp+8*294]
	mov rsi,rbx
	mov rbx,  [rsp+8*293]
	mov rdi,rbx
	mov rbx,rdi
	mov rax,rsi
	mov qword [rsp+8*297],rdx
	mov rdx,1
	mov qword [rsp+8*299],rax
	mov rax,rbx
	add rax,rdx
	mov qword [rsp+8*298],rbx
	mov rbx,rax
	mov qword [rsp+8*300],rax
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*301],rbx
	mov qword [rsp+8*302],rax
	
L_2871:
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
	je L_2872
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
	mov qword [rsp+8*311],rdx
	mov rdx,rbx
	mov qword [rsp+8*306],rbx
	mov rbx,rdx
	mov qword [rsp+8*312],rdx
	mov rdx,  [rsp+8*301]
	mov qword [rsp+8*309],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*313],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*314],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*301],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*315],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*316],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*317],rbx
	mov rbx,rax
	mov qword [rsp+8*318],rdx
	mov rdx,rbx
	mov qword [rsp+8*320],rbx
	mov rbx,rdx
	mov qword [rsp+8*321],rdx
	mov rdx,  [rsp+8*316]
	mov qword [rsp+8*319],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov qword [rsp+8*322],rbx
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*323],rax
	mov rax,  [rsp+8*315]
	mov rbx,  [rsp+8*316]
	mov qword [rsp+8*322],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rbx,  [rsp+8*322]
	and rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*324],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*322],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*325],rbx
	mov rbx,rax
	mov qword [rsp+8*326],rdx
	mov rdx,rbx
	mov qword [rsp+8*328],rbx
	mov rbx,  [rsp+8*322]
	mov qword [rsp+8*327],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*329],rdx
	mov rdx,rbx
	mov qword [rsp+8*331],rbx
	mov rbx,  [rsp+8*301]
	mov qword [rsp+8*330],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*332],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*333],rax
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
	jmp L_2871
	
L_2872:
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
	mov qword [rsp+8*352],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*353],rbx
	mov rbx,rax
	mov qword [rsp+8*354],rdx
	mov rdx,rbx
	mov qword [rsp+8*356],rbx
	mov rbx,  [rsp+8*352]
	and rbx,rdx
	mov qword [rsp+8*357],rdx
	mov rdx,rbx
	mov qword [rsp+8*352],rbx
	mov rbx,rdx
	mov qword [rsp+8*358],rdx
	mov rdx,32
	mov qword [rsp+8*355],rax
	mov rax,  [rsp+8*297]
	mov qword [rsp+8*359],rbx
	mov rbx,rdx
	sub rbx,rax
	mov rsi,rbx
	mov qword [rsp+8*360],rbx
	mov rbx,  [rsp+8*349]
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*361],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*362],rdx
	mov rdx,rdi
	mov rax,rsi
	mov rbx,rdx
	mov rcx,16
	shl rbx,cl
	or rbx,rax
	mov qword [rsp+8*363],rdx
	mov rdx,rbx
	mov qword [rsp+8*365],rbx
	mov rbx,rdx
	mov qword [rsp+8*366],rdx
	mov rdx,rbx
	mov qword [rsp+8*367],rbx
	mov rbx,  [rsp+8*362]
	mov qword [rsp+8*364],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*369],rax
	mov rax,  [rsp+8*361]
	mov rbx,  [rsp+8*362]
	mov qword [rsp+8*368],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rbx,  [rsp+8*368]
	and rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*370],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*368],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*371],rbx
	mov rbx,rax
	mov qword [rsp+8*372],rdx
	mov rdx,rbx
	mov qword [rsp+8*374],rbx
	mov rbx,  [rsp+8*368]
	mov qword [rsp+8*373],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*375],rdx
	mov rdx,rbx
	mov qword [rsp+8*377],rbx
	mov rbx,  [rsp+8*359]
	mov qword [rsp+8*376],rax
	mov rax,rbx
	or rax,rdx
	mov rbx,rax
	mov qword [rsp+8*378],rdx
	mov rdx,rbx
	mov qword [rsp+8*380],rbx
	mov rbx,rdx
	mov qword [rsp+8*381],rdx
	mov rdx,1
	mov rsi,rdx
	mov rdx,  [rsp+8*17]
	mov rdi,rdx
	mov qword [rsp+8*379],rax
	mov rax,rdi
	mov qword [rsp+8*382],rbx
	mov rbx,rsi
	mov rdx,1
	mov qword [rsp+8*384],rbx
	mov rbx,rax
	add rbx,rdx
	mov qword [rsp+8*383],rax
	mov rax,rbx
	mov qword [rsp+8*385],rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*387],rbx
	mov qword [rsp+8*386],rax
	
L_2595:
	mov rbx,  [rsp+8*384]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*387]
	cmp rbx,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*388],rax
	je L_2596
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*386]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*390],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*389],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*391],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov rax,rdx
	mov rcx,16
	shl rax,cl
	or rax,rbx
	mov qword [rsp+8*393],rbx
	mov rbx,rax
	mov qword [rsp+8*392],rdx
	mov rdx,rbx
	mov qword [rsp+8*395],rbx
	mov rbx,  [rsp+8*391]
	and rbx,rdx
	mov qword [rsp+8*396],rdx
	mov rdx,rbx
	mov qword [rsp+8*391],rbx
	mov rbx,rdx
	mov qword [rsp+8*397],rdx
	mov rdx,  [rsp+8*386]
	mov qword [rsp+8*394],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*398],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*399],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*386],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*400],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*401],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*402],rbx
	mov rbx,rax
	mov qword [rsp+8*403],rdx
	mov rdx,rbx
	mov qword [rsp+8*405],rbx
	mov rbx,rdx
	mov qword [rsp+8*406],rdx
	mov rdx,  [rsp+8*401]
	mov qword [rsp+8*404],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov qword [rsp+8*407],rbx
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*408],rax
	mov rax,  [rsp+8*400]
	mov rbx,  [rsp+8*401]
	mov qword [rsp+8*407],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rbx,  [rsp+8*407]
	and rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*409],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*407],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*410],rbx
	mov rbx,rax
	mov qword [rsp+8*411],rdx
	mov rdx,rbx
	mov qword [rsp+8*413],rbx
	mov rbx,  [rsp+8*407]
	mov qword [rsp+8*412],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*414],rdx
	mov rdx,rbx
	mov qword [rsp+8*416],rbx
	mov rbx,  [rsp+8*386]
	mov qword [rsp+8*415],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*417],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*418],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*386],rbx
	mov rbx,rax
	mov rcx,rdx
	shl rbx,cl
	mov qword [rsp+8*420],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*419],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*421],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*422],rbx
	mov rbx,rax
	mov qword [rsp+8*423],rdx
	mov rdx,rbx
	mov qword [rsp+8*425],rbx
	mov rbx,  [rsp+8*421]
	and rbx,rdx
	mov qword [rsp+8*426],rdx
	mov rdx,rbx
	mov qword [rsp+8*421],rbx
	mov rbx,rdx
	mov qword [rsp+8*427],rdx
	mov rdx,  [rsp+8*386]
	mov qword [rsp+8*424],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*428],rbx
	mov qword [rsp+8*429],rax
	mov rax,  [rsp+8*387]
	mov rbx,rax
	mov qword [rsp+8*430],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*386],rdx
	mov qword [rsp+8*387],rax
	jmp L_2595
	
L_2596:
	mov rbx,  [rsp+8*386]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*431],rax
	mov rax,rbx
	mov qword [rsp+8*432],rbx
	mov rbx,1
	mov rsi,rbx
	mov rbx,  [rsp+8*15]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*433],rax
	mov rax,rsi
	mov rbx,1
	mov qword [rsp+8*435],rax
	mov rax,rdx
	add rax,rbx
	mov qword [rsp+8*434],rdx
	mov rdx,rax
	mov qword [rsp+8*436],rax
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*437],rdx
	mov qword [rsp+8*438],rax
	
L_2614:
	mov rbx,  [rsp+8*435]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*438]
	cmp rbx,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*439],rax
	je L_2615
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*437]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*441],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*440],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*442],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov rax,rdx
	mov rcx,16
	shl rax,cl
	or rax,rbx
	mov qword [rsp+8*444],rbx
	mov rbx,rax
	mov qword [rsp+8*443],rdx
	mov rdx,rbx
	mov qword [rsp+8*446],rbx
	mov rbx,  [rsp+8*442]
	and rbx,rdx
	mov qword [rsp+8*447],rdx
	mov rdx,rbx
	mov qword [rsp+8*442],rbx
	mov rbx,rdx
	mov qword [rsp+8*448],rdx
	mov rdx,  [rsp+8*437]
	mov qword [rsp+8*445],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*449],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*450],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*437],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*451],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*452],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*453],rbx
	mov rbx,rax
	mov qword [rsp+8*454],rdx
	mov rdx,rbx
	mov qword [rsp+8*456],rbx
	mov rbx,rdx
	mov qword [rsp+8*457],rdx
	mov rdx,  [rsp+8*452]
	mov qword [rsp+8*455],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov qword [rsp+8*458],rbx
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*459],rax
	mov rax,  [rsp+8*451]
	mov rbx,  [rsp+8*452]
	mov qword [rsp+8*458],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rbx,  [rsp+8*458]
	and rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*460],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*458],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*461],rbx
	mov rbx,rax
	mov qword [rsp+8*462],rdx
	mov rdx,rbx
	mov qword [rsp+8*464],rbx
	mov rbx,  [rsp+8*458]
	mov qword [rsp+8*463],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*465],rdx
	mov rdx,rbx
	mov qword [rsp+8*467],rbx
	mov rbx,  [rsp+8*437]
	mov qword [rsp+8*466],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*468],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*469],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*437],rbx
	mov rbx,rax
	mov rcx,rdx
	shl rbx,cl
	mov qword [rsp+8*471],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*470],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*472],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*473],rbx
	mov rbx,rax
	mov qword [rsp+8*474],rdx
	mov rdx,rbx
	mov qword [rsp+8*476],rbx
	mov rbx,  [rsp+8*472]
	and rbx,rdx
	mov qword [rsp+8*477],rdx
	mov rdx,rbx
	mov qword [rsp+8*472],rbx
	mov rbx,rdx
	mov qword [rsp+8*478],rdx
	mov rdx,  [rsp+8*437]
	mov qword [rsp+8*475],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*479],rbx
	mov qword [rsp+8*480],rax
	mov rax,  [rsp+8*438]
	mov rbx,rax
	mov qword [rsp+8*481],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*437],rdx
	mov qword [rsp+8*438],rax
	jmp L_2614
	
L_2615:
	mov rbx,  [rsp+8*437]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*482],rax
	mov rax,rbx
	mov qword [rsp+8*483],rbx
	mov rbx,  [rsp+8*433]
	mov rdx,rbx
	xor rdx,rax
	mov rbx,1
	mov rsi,rbx
	mov rbx,  [rsp+8*13]
	mov rdi,rbx
	mov qword [rsp+8*484],rax
	mov rax,rdi
	mov qword [rsp+8*485],rdx
	mov rdx,rsi
	mov rbx,1
	mov qword [rsp+8*487],rdx
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*486],rax
	mov rax,rdx
	mov qword [rsp+8*488],rdx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*490],rdx
	mov qword [rsp+8*489],rax
	
L_2633:
	mov rbx,  [rsp+8*487]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*490]
	cmp rbx,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*491],rax
	je L_2634
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*489]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*493],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*492],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*494],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov rax,rdx
	mov rcx,16
	shl rax,cl
	or rax,rbx
	mov qword [rsp+8*496],rbx
	mov rbx,rax
	mov qword [rsp+8*495],rdx
	mov rdx,rbx
	mov qword [rsp+8*498],rbx
	mov rbx,  [rsp+8*494]
	and rbx,rdx
	mov qword [rsp+8*499],rdx
	mov rdx,rbx
	mov qword [rsp+8*494],rbx
	mov rbx,rdx
	mov qword [rsp+8*500],rdx
	mov rdx,  [rsp+8*489]
	mov qword [rsp+8*497],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*501],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*502],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*489],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*503],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*504],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*505],rbx
	mov rbx,rax
	mov qword [rsp+8*506],rdx
	mov rdx,rbx
	mov qword [rsp+8*508],rbx
	mov rbx,rdx
	mov qword [rsp+8*509],rdx
	mov rdx,  [rsp+8*504]
	mov qword [rsp+8*507],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov qword [rsp+8*510],rbx
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*511],rax
	mov rax,  [rsp+8*503]
	mov rbx,  [rsp+8*504]
	mov qword [rsp+8*510],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rbx,  [rsp+8*510]
	and rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*512],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*510],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*513],rbx
	mov rbx,rax
	mov qword [rsp+8*514],rdx
	mov rdx,rbx
	mov qword [rsp+8*516],rbx
	mov rbx,  [rsp+8*510]
	mov qword [rsp+8*515],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*517],rdx
	mov rdx,rbx
	mov qword [rsp+8*519],rbx
	mov rbx,  [rsp+8*489]
	mov qword [rsp+8*518],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*520],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*521],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*489],rbx
	mov rbx,rax
	mov rcx,rdx
	shl rbx,cl
	mov qword [rsp+8*523],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*522],rax
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
	mov rdx,  [rsp+8*489]
	mov qword [rsp+8*527],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*531],rbx
	mov qword [rsp+8*532],rax
	mov rax,  [rsp+8*490]
	mov rbx,rax
	mov qword [rsp+8*533],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*489],rdx
	mov qword [rsp+8*490],rax
	jmp L_2633
	
L_2634:
	mov rbx,  [rsp+8*489]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*534],rax
	mov rax,rbx
	mov qword [rsp+8*535],rbx
	mov rbx,  [rsp+8*485]
	xor rbx,rax
	mov qword [rsp+8*536],rax
	mov rax,rbx
	mov rbx,  [rsp+8*111]
	mov rdx,rbx
	xor rdx,rax
	mov rbx,1
	mov rsi,rbx
	mov rdi,rdx
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*537],rax
	mov rax,1
	mov qword [rsp+8*540],rdx
	mov rdx,rbx
	add rdx,rax
	mov qword [rsp+8*539],rbx
	mov rbx,rdx
	mov qword [rsp+8*541],rdx
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*542],rbx
	mov qword [rsp+8*543],rdx
	
L_2652:
	mov rbx,  [rsp+8*540]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*543]
	cmp rbx,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*544],rax
	je L_2653
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*542]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*546],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*545],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*547],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov rax,rdx
	mov rcx,16
	shl rax,cl
	or rax,rbx
	mov qword [rsp+8*549],rbx
	mov rbx,rax
	mov qword [rsp+8*548],rdx
	mov rdx,rbx
	mov qword [rsp+8*551],rbx
	mov rbx,  [rsp+8*547]
	and rbx,rdx
	mov qword [rsp+8*552],rdx
	mov rdx,rbx
	mov qword [rsp+8*547],rbx
	mov rbx,rdx
	mov qword [rsp+8*553],rdx
	mov rdx,  [rsp+8*542]
	mov qword [rsp+8*550],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*554],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*555],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*542],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*556],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*557],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*558],rbx
	mov rbx,rax
	mov qword [rsp+8*559],rdx
	mov rdx,rbx
	mov qword [rsp+8*561],rbx
	mov rbx,rdx
	mov qword [rsp+8*562],rdx
	mov rdx,  [rsp+8*557]
	mov qword [rsp+8*560],rax
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
	jmp L_2652
	
L_2653:
	mov rbx,  [rsp+8*542]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*587],rax
	mov rax,rbx
	mov qword [rsp+8*588],rbx
	mov rbx,  [rsp+8*9]
	mov rdx,rbx
	add rdx,rax
	mov rbx,rdx
	mov rdx,  [rsp+8*201]
	mov qword [rsp+8*589],rax
	mov rax,  [rsp+8*537]
	mov qword [rsp+8*9],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,1
	mov rsi,rdx
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,1
	mov qword [rsp+8*593],rdx
	mov rdx,rbx
	add rdx,rax
	mov qword [rsp+8*592],rbx
	mov rbx,rdx
	mov qword [rsp+8*594],rdx
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*595],rbx
	mov qword [rsp+8*596],rdx
	
L_2671:
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
	je L_2672
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
	jmp L_2671
	
L_2672:
	mov rbx,  [rsp+8*595]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*640],rax
	mov rax,rbx
	mov qword [rsp+8*641],rbx
	mov rbx,  [rsp+8*10]
	mov rdx,rbx
	add rdx,rax
	mov rbx,rdx
	mov rdx,  [rsp+8*291]
	mov qword [rsp+8*642],rax
	mov rax,  [rsp+8*537]
	mov qword [rsp+8*10],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,1
	mov rsi,rdx
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,1
	mov qword [rsp+8*646],rdx
	mov rdx,rbx
	add rdx,rax
	mov qword [rsp+8*645],rbx
	mov rbx,rdx
	mov qword [rsp+8*647],rdx
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*648],rbx
	mov qword [rsp+8*649],rdx
	
L_2690:
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
	je L_2691
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
	mov qword [rsp+8*656],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*660],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*661],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*648],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*662],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*663],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*664],rbx
	mov rbx,rax
	mov qword [rsp+8*665],rdx
	mov rdx,rbx
	mov qword [rsp+8*667],rbx
	mov rbx,rdx
	mov qword [rsp+8*668],rdx
	mov rdx,  [rsp+8*663]
	mov qword [rsp+8*666],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov qword [rsp+8*669],rbx
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*670],rax
	mov rax,  [rsp+8*662]
	mov rbx,  [rsp+8*663]
	mov qword [rsp+8*669],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rbx,  [rsp+8*669]
	and rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*671],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*669],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*672],rbx
	mov rbx,rax
	mov qword [rsp+8*673],rdx
	mov rdx,rbx
	mov qword [rsp+8*675],rbx
	mov rbx,  [rsp+8*669]
	mov qword [rsp+8*674],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*676],rdx
	mov rdx,rbx
	mov qword [rsp+8*678],rbx
	mov rbx,  [rsp+8*648]
	mov qword [rsp+8*677],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*679],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*680],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*648],rbx
	mov rbx,rax
	mov rcx,rdx
	shl rbx,cl
	mov qword [rsp+8*682],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*681],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*683],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*684],rbx
	mov rbx,rax
	mov qword [rsp+8*685],rdx
	mov rdx,rbx
	mov qword [rsp+8*687],rbx
	mov rbx,  [rsp+8*683]
	and rbx,rdx
	mov qword [rsp+8*688],rdx
	mov rdx,rbx
	mov qword [rsp+8*683],rbx
	mov rbx,rdx
	mov qword [rsp+8*689],rdx
	mov rdx,  [rsp+8*648]
	mov qword [rsp+8*686],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*690],rbx
	mov qword [rsp+8*691],rax
	mov rax,  [rsp+8*649]
	mov rbx,rax
	mov qword [rsp+8*692],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*648],rdx
	mov qword [rsp+8*649],rax
	jmp L_2690
	
L_2691:
	mov rbx,  [rsp+8*648]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*693],rax
	mov rax,rbx
	mov qword [rsp+8*694],rbx
	mov rbx,  [rsp+8*11]
	mov rdx,rbx
	add rdx,rax
	mov rbx,rdx
	mov rdx,  [rsp+8*382]
	mov qword [rsp+8*695],rax
	mov rax,  [rsp+8*537]
	mov qword [rsp+8*11],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,1
	mov rsi,rdx
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,1
	mov qword [rsp+8*699],rdx
	mov rdx,rbx
	add rdx,rax
	mov qword [rsp+8*698],rbx
	mov rbx,rdx
	mov qword [rsp+8*700],rdx
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*701],rbx
	mov qword [rsp+8*702],rdx
	
L_2709:
	mov rbx,  [rsp+8*699]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*702]
	cmp rbx,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*703],rax
	je L_2710
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*701]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*705],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*704],rax
	mov rax,65535
	mov rdi,rax
	mov qword [rsp+8*706],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov rax,rdx
	mov rcx,16
	shl rax,cl
	or rax,rbx
	mov qword [rsp+8*708],rbx
	mov rbx,rax
	mov qword [rsp+8*707],rdx
	mov rdx,rbx
	mov qword [rsp+8*710],rbx
	mov rbx,  [rsp+8*706]
	and rbx,rdx
	mov qword [rsp+8*711],rdx
	mov rdx,rbx
	mov qword [rsp+8*706],rbx
	mov rbx,rdx
	mov qword [rsp+8*712],rdx
	mov rdx,  [rsp+8*701]
	mov qword [rsp+8*709],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*713],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov rbx,rdi
	mov qword [rsp+8*714],rax
	mov rax,rsi
	mov qword [rsp+8*701],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rdx,32767
	mov rdi,rdx
	mov rdx,rdi
	mov qword [rsp+8*715],rbx
	mov rbx,rsi
	mov qword [rsp+8*716],rax
	mov rax,rdx
	mov rcx,16
	shl rax,cl
	or rax,rbx
	mov qword [rsp+8*718],rbx
	mov rbx,rax
	mov qword [rsp+8*717],rdx
	mov rdx,rbx
	mov qword [rsp+8*720],rbx
	mov rbx,rdx
	mov qword [rsp+8*721],rdx
	mov rdx,  [rsp+8*716]
	mov qword [rsp+8*719],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov qword [rsp+8*722],rbx
	mov rbx,1
	add rax,rbx
	mov rbx,rax
	mov qword [rsp+8*723],rax
	mov rax,  [rsp+8*715]
	mov qword [rsp+8*722],rbx
	mov rbx,rax
	mov rcx,rdx
	shr rbx,cl
	mov rdx,  [rsp+8*722]
	and rbx,rdx
	mov rdx,rbx
	mov qword [rsp+8*724],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rbx,65535
	mov rdi,rbx
	mov rbx,rdi
	mov rax,rsi
	mov qword [rsp+8*722],rdx
	mov rdx,rbx
	mov rcx,16
	shl rdx,cl
	or rdx,rax
	mov qword [rsp+8*725],rbx
	mov rbx,rdx
	mov qword [rsp+8*727],rdx
	mov rdx,rbx
	mov qword [rsp+8*728],rbx
	mov rbx,  [rsp+8*722]
	mov qword [rsp+8*726],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*729],rdx
	mov rdx,rbx
	mov qword [rsp+8*731],rbx
	mov rbx,  [rsp+8*701]
	mov qword [rsp+8*730],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*732],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*733],rax
	mov rax,rsi
	mov qword [rsp+8*701],rbx
	mov rbx,rdx
	mov rcx,rax
	shl rbx,cl
	mov qword [rsp+8*734],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rdx,65535
	mov rdi,rdx
	mov rdx,rdi
	mov qword [rsp+8*735],rax
	mov rax,rsi
	mov qword [rsp+8*736],rbx
	mov rbx,rdx
	mov rcx,16
	shl rbx,cl
	or rbx,rax
	mov qword [rsp+8*737],rdx
	mov rdx,rbx
	mov qword [rsp+8*739],rbx
	mov rbx,rdx
	mov qword [rsp+8*740],rdx
	mov rdx,  [rsp+8*736]
	and rdx,rbx
	mov qword [rsp+8*741],rbx
	mov rbx,rdx
	mov qword [rsp+8*736],rdx
	mov rdx,rbx
	mov qword [rsp+8*742],rbx
	mov rbx,  [rsp+8*701]
	mov qword [rsp+8*738],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*743],rdx
	mov qword [rsp+8*744],rax
	mov rax,  [rsp+8*702]
	mov rdx,rax
	mov qword [rsp+8*745],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*701],rbx
	mov qword [rsp+8*702],rax
	jmp L_2709
	
L_2710:
	mov rbx,  [rsp+8*701]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*747],rbx
	mov rbx,  [rsp+8*12]
	mov qword [rsp+8*746],rax
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [rsp+8*748],rdx
	mov rax,  [rsp+8*17]
	mov rdx,rax
	mov qword [rsp+8*750],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*12],rbx
	mov qword [rsp+8*17],rax
	jmp L_2431
	
L_2432:
	mov rdx,  [rsp+8*15]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*751],rbx
	mov qword [rsp+8*15],rdx
	jmp L_2428
	
L_2429:
	mov rdx,  [rsp+8*13]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*752],rbx
	mov qword [rsp+8*13],rdx
	jmp L_2425
	
L_2426:
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov rdx,rdi
	mov rbx,t127
	mov rax,rbx
	mov qword [rsp+8*753],rdx
	mov rbx,28
	mov rdx,rbx
	mov qword [rsp+8*755],rdx
	mov qword [rsp+8*754],rax
	
L_2508:
	mov rbx,  [rsp+8*755]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	cmp rax, 0
	mov qword [rsp+8*756],rax
	je L_2509
	mov rbx,  [rsp+8*753]
	mov rdx,  [rsp+8*755]
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,15
	and rax,rbx
	mov rdx,rax
	mov qword [rsp+8*757],rax
	mov rax,10
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*759],rbx
	mov qword [rsp+8*758],rdx
	je L_2510
	mov rbx,48
	mov rdx,  [rsp+8*758]
	mov rax,rbx
	add rax,rdx
	mov rdi,rax
	mov qword [rsp+8*760],rax
	mov rax,rdi
	mov rbx,32
	cmp rax,rbx
	mov rdx, 0
	setge dl
	cmp rdx, 0
	mov qword [rsp+8*762],rdx
	mov qword [rsp+8*761],rax
	jne L_2511
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*762],rbx
	jmp L_2512
	
L_2511:
	mov rbx,  [rsp+8*761]
	mov rdx,126
	cmp rbx,rdx
	mov rax, 0
	setle al
	mov rbx,rax
	mov qword [rsp+8*762],rbx
	mov qword [rsp+8*763],rax
	
L_2512:
	mov rbx,  [rsp+8*762]
	cmp rbx, 0
	je L_2513
	mov rdx,  [gbl+8*764]
	mov rbx,rdx
	mov rax,  [rsp+8*761]
	mov qword [rsp+8*765],rbx
	mov rbx,32
	mov rdx,rax
	sub rdx,rbx
	mov rbx,32
	mov qword [rsp+8*766],rdx
	mov rdx,rax
	sub rdx,rbx
	mov rsi,rdx
	mov qword [rsp+8*767],rdx
	mov rdx,  [rsp+8*766]
	mov rdi,rdx
	mov rax,  [rsp+8*765]
	mov rdx,rax
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
	mov [rsp+8*769], rax
	mov rdx,  [rsp+8*769]
	mov rbx,rdx
	mov qword [rsp+8*770],rbx
	jmp L_2515
	
L_2513:
	mov rdx,t125
	mov rbx,rdx
	mov qword [rsp+8*770],rbx
	
L_2515:
	mov rdx,  [rsp+8*770]
	mov rbx,rdx
	mov qword [rsp+8*771],rbx
	mov     rsi, [rsp+8*771]
	mov     rdi, [rsp+8*754]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*772], rax
	mov rdx,  [rsp+8*772]
	mov rbx,rdx
	mov qword [rsp+8*754],rbx
	jmp L_2516
	
L_2510:
	mov rbx,65
	mov rdx,  [rsp+8*758]
	mov rax,rbx
	add rax,rdx
	mov rdx,10
	sub rax,rdx
	mov rdi,rax
	mov qword [rsp+8*773],rax
	mov rax,rdi
	mov rbx,32
	cmp rax,rbx
	mov rdx, 0
	setge dl
	cmp rdx, 0
	mov qword [rsp+8*775],rdx
	mov qword [rsp+8*774],rax
	jne L_2517
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*775],rbx
	jmp L_2518
	
L_2517:
	mov rbx,  [rsp+8*774]
	mov rdx,126
	cmp rbx,rdx
	mov rax, 0
	setle al
	mov rbx,rax
	mov qword [rsp+8*775],rbx
	mov qword [rsp+8*776],rax
	
L_2518:
	mov rbx,  [rsp+8*775]
	cmp rbx, 0
	je L_2519
	mov rdx,  [gbl+8*764]
	mov rbx,rdx
	mov rax,  [rsp+8*774]
	mov qword [rsp+8*777],rbx
	mov rbx,32
	mov rdx,rax
	sub rdx,rbx
	mov rbx,32
	mov qword [rsp+8*778],rdx
	mov rdx,rax
	sub rdx,rbx
	mov rsi,rdx
	mov qword [rsp+8*779],rdx
	mov rdx,  [rsp+8*778]
	mov rdi,rdx
	mov rax,  [rsp+8*777]
	mov rdx,rax
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
	mov [rsp+8*780], rax
	mov rdx,  [rsp+8*780]
	mov rbx,rdx
	mov qword [rsp+8*781],rbx
	jmp L_2521
	
L_2519:
	mov rdx,t125
	mov rbx,rdx
	mov qword [rsp+8*781],rbx
	
L_2521:
	mov rdx,  [rsp+8*781]
	mov rbx,rdx
	mov qword [rsp+8*782],rbx
	mov     rsi, [rsp+8*782]
	mov     rdi, [rsp+8*754]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*783], rax
	mov rdx,  [rsp+8*783]
	mov rbx,rdx
	mov qword [rsp+8*754],rbx
	
L_2516:
	mov rbx,  [rsp+8*755]
	mov rdx,4
	mov rax,rbx
	sub rax,rdx
	mov rbx,rax
	mov qword [rsp+8*755],rbx
	mov qword [rsp+8*784],rax
	jmp L_2508
	
L_2509:
	mov rdx,  [rsp+8*754]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*785],rbx
	mov qword [rsp+8*786],rax
	mov     rsi, t222
	mov     rdi, [rsp+8*786]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*787], rax
	mov rbx,  [rsp+8*787]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*788],rdx
	mov rdi, format
	mov rsi,[rsp+8*788] 
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
	mov rbx,t127
	mov rax,rbx
	mov qword [rsp+8*789],rdx
	mov rbx,28
	mov rdx,rbx
	mov qword [rsp+8*791],rdx
	mov qword [rsp+8*790],rax
	
L_2525:
	mov rbx,  [rsp+8*791]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	cmp rax, 0
	mov qword [rsp+8*792],rax
	je L_2526
	mov rbx,  [rsp+8*789]
	mov rdx,  [rsp+8*791]
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,15
	and rax,rbx
	mov rdx,rax
	mov qword [rsp+8*793],rax
	mov rax,10
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*795],rbx
	mov qword [rsp+8*794],rdx
	je L_2527
	mov rbx,48
	mov rdx,  [rsp+8*794]
	mov rax,rbx
	add rax,rdx
	mov rdi,rax
	mov qword [rsp+8*796],rax
	mov rax,rdi
	mov rbx,32
	cmp rax,rbx
	mov rdx, 0
	setge dl
	cmp rdx, 0
	mov qword [rsp+8*798],rdx
	mov qword [rsp+8*797],rax
	jne L_2528
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*798],rbx
	jmp L_2529
	
L_2528:
	mov rbx,  [rsp+8*797]
	mov rdx,126
	cmp rbx,rdx
	mov rax, 0
	setle al
	mov rbx,rax
	mov qword [rsp+8*798],rbx
	mov qword [rsp+8*799],rax
	
L_2529:
	mov rbx,  [rsp+8*798]
	cmp rbx, 0
	je L_2530
	mov rdx,  [gbl+8*764]
	mov rbx,rdx
	mov rax,  [rsp+8*797]
	mov qword [rsp+8*800],rbx
	mov rbx,32
	mov rdx,rax
	sub rdx,rbx
	mov rbx,32
	mov qword [rsp+8*801],rdx
	mov rdx,rax
	sub rdx,rbx
	mov rsi,rdx
	mov qword [rsp+8*802],rdx
	mov rdx,  [rsp+8*801]
	mov rdi,rdx
	mov rax,  [rsp+8*800]
	mov rdx,rax
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
	mov [rsp+8*803], rax
	mov rdx,  [rsp+8*803]
	mov rbx,rdx
	mov qword [rsp+8*804],rbx
	jmp L_2532
	
L_2530:
	mov rdx,t125
	mov rbx,rdx
	mov qword [rsp+8*804],rbx
	
L_2532:
	mov rdx,  [rsp+8*804]
	mov rbx,rdx
	mov qword [rsp+8*805],rbx
	mov     rsi, [rsp+8*805]
	mov     rdi, [rsp+8*790]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*806], rax
	mov rdx,  [rsp+8*806]
	mov rbx,rdx
	mov qword [rsp+8*790],rbx
	jmp L_2533
	
L_2527:
	mov rbx,65
	mov rdx,  [rsp+8*794]
	mov rax,rbx
	add rax,rdx
	mov rdx,10
	sub rax,rdx
	mov rdi,rax
	mov qword [rsp+8*807],rax
	mov rax,rdi
	mov rbx,32
	cmp rax,rbx
	mov rdx, 0
	setge dl
	cmp rdx, 0
	mov qword [rsp+8*809],rdx
	mov qword [rsp+8*808],rax
	jne L_2534
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*809],rbx
	jmp L_2535
	
L_2534:
	mov rbx,  [rsp+8*808]
	mov rdx,126
	cmp rbx,rdx
	mov rax, 0
	setle al
	mov rbx,rax
	mov qword [rsp+8*809],rbx
	mov qword [rsp+8*810],rax
	
L_2535:
	mov rbx,  [rsp+8*809]
	cmp rbx, 0
	je L_2536
	mov rdx,  [gbl+8*764]
	mov rbx,rdx
	mov rax,  [rsp+8*808]
	mov qword [rsp+8*811],rbx
	mov rbx,32
	mov rdx,rax
	sub rdx,rbx
	mov rbx,32
	mov qword [rsp+8*812],rdx
	mov rdx,rax
	sub rdx,rbx
	mov rsi,rdx
	mov qword [rsp+8*813],rdx
	mov rdx,  [rsp+8*812]
	mov rdi,rdx
	mov rax,  [rsp+8*811]
	mov rdx,rax
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
	mov [rsp+8*814], rax
	mov rdx,  [rsp+8*814]
	mov rbx,rdx
	mov qword [rsp+8*815],rbx
	jmp L_2538
	
L_2536:
	mov rdx,t125
	mov rbx,rdx
	mov qword [rsp+8*815],rbx
	
L_2538:
	mov rdx,  [rsp+8*815]
	mov rbx,rdx
	mov qword [rsp+8*816],rbx
	mov     rsi, [rsp+8*816]
	mov     rdi, [rsp+8*790]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*817], rax
	mov rdx,  [rsp+8*817]
	mov rbx,rdx
	mov qword [rsp+8*790],rbx
	
L_2533:
	mov rbx,  [rsp+8*791]
	mov rdx,4
	mov rax,rbx
	sub rax,rdx
	mov rbx,rax
	mov qword [rsp+8*791],rbx
	mov qword [rsp+8*818],rax
	jmp L_2525
	
L_2526:
	mov rdx,  [rsp+8*790]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*819],rbx
	mov qword [rsp+8*820],rax
	mov     rsi, t229
	mov     rdi, [rsp+8*820]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*821], rax
	mov rbx,  [rsp+8*821]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*822],rdx
	mov rdi, format
	mov rsi,[rsp+8*822] 
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
	mov rbx,t127
	mov rax,rbx
	mov qword [rsp+8*823],rdx
	mov rbx,28
	mov rdx,rbx
	mov qword [rsp+8*825],rdx
	mov qword [rsp+8*824],rax
	
L_2542:
	mov rbx,  [rsp+8*825]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	cmp rax, 0
	mov qword [rsp+8*826],rax
	je L_2543
	mov rbx,  [rsp+8*823]
	mov rdx,  [rsp+8*825]
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,15
	and rax,rbx
	mov rdx,rax
	mov qword [rsp+8*827],rax
	mov rax,10
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*829],rbx
	mov qword [rsp+8*828],rdx
	je L_2544
	mov rbx,48
	mov rdx,  [rsp+8*828]
	mov rax,rbx
	add rax,rdx
	mov rdi,rax
	mov qword [rsp+8*830],rax
	mov rax,rdi
	mov rbx,32
	cmp rax,rbx
	mov rdx, 0
	setge dl
	cmp rdx, 0
	mov qword [rsp+8*832],rdx
	mov qword [rsp+8*831],rax
	jne L_2545
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*832],rbx
	jmp L_2546
	
L_2545:
	mov rbx,  [rsp+8*831]
	mov rdx,126
	cmp rbx,rdx
	mov rax, 0
	setle al
	mov rbx,rax
	mov qword [rsp+8*832],rbx
	mov qword [rsp+8*833],rax
	
L_2546:
	mov rbx,  [rsp+8*832]
	cmp rbx, 0
	je L_2547
	mov rdx,  [gbl+8*764]
	mov rbx,rdx
	mov rax,  [rsp+8*831]
	mov qword [rsp+8*834],rbx
	mov rbx,32
	mov rdx,rax
	sub rdx,rbx
	mov rbx,32
	mov qword [rsp+8*835],rdx
	mov rdx,rax
	sub rdx,rbx
	mov rsi,rdx
	mov qword [rsp+8*836],rdx
	mov rdx,  [rsp+8*835]
	mov rdi,rdx
	mov rax,  [rsp+8*834]
	mov rdx,rax
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
	mov [rsp+8*837], rax
	mov rdx,  [rsp+8*837]
	mov rbx,rdx
	mov qword [rsp+8*838],rbx
	jmp L_2549
	
L_2547:
	mov rdx,t125
	mov rbx,rdx
	mov qword [rsp+8*838],rbx
	
L_2549:
	mov rdx,  [rsp+8*838]
	mov rbx,rdx
	mov qword [rsp+8*839],rbx
	mov     rsi, [rsp+8*839]
	mov     rdi, [rsp+8*824]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*840], rax
	mov rdx,  [rsp+8*840]
	mov rbx,rdx
	mov qword [rsp+8*824],rbx
	jmp L_2550
	
L_2544:
	mov rbx,65
	mov rdx,  [rsp+8*828]
	mov rax,rbx
	add rax,rdx
	mov rdx,10
	sub rax,rdx
	mov rdi,rax
	mov qword [rsp+8*841],rax
	mov rax,rdi
	mov rbx,32
	cmp rax,rbx
	mov rdx, 0
	setge dl
	cmp rdx, 0
	mov qword [rsp+8*843],rdx
	mov qword [rsp+8*842],rax
	jne L_2551
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*843],rbx
	jmp L_2552
	
L_2551:
	mov rbx,  [rsp+8*842]
	mov rdx,126
	cmp rbx,rdx
	mov rax, 0
	setle al
	mov rbx,rax
	mov qword [rsp+8*843],rbx
	mov qword [rsp+8*844],rax
	
L_2552:
	mov rbx,  [rsp+8*843]
	cmp rbx, 0
	je L_2553
	mov rdx,  [gbl+8*764]
	mov rbx,rdx
	mov rax,  [rsp+8*842]
	mov qword [rsp+8*845],rbx
	mov rbx,32
	mov rdx,rax
	sub rdx,rbx
	mov rbx,32
	mov qword [rsp+8*846],rdx
	mov rdx,rax
	sub rdx,rbx
	mov rsi,rdx
	mov qword [rsp+8*847],rdx
	mov rdx,  [rsp+8*846]
	mov rdi,rdx
	mov rax,  [rsp+8*845]
	mov rdx,rax
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
	mov [rsp+8*848], rax
	mov rdx,  [rsp+8*848]
	mov rbx,rdx
	mov qword [rsp+8*849],rbx
	jmp L_2555
	
L_2553:
	mov rdx,t125
	mov rbx,rdx
	mov qword [rsp+8*849],rbx
	
L_2555:
	mov rdx,  [rsp+8*849]
	mov rbx,rdx
	mov qword [rsp+8*850],rbx
	mov     rsi, [rsp+8*850]
	mov     rdi, [rsp+8*824]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*851], rax
	mov rdx,  [rsp+8*851]
	mov rbx,rdx
	mov qword [rsp+8*824],rbx
	
L_2550:
	mov rbx,  [rsp+8*825]
	mov rdx,4
	mov rax,rbx
	sub rax,rdx
	mov rbx,rax
	mov qword [rsp+8*825],rbx
	mov qword [rsp+8*852],rax
	jmp L_2542
	
L_2543:
	mov rdx,  [rsp+8*824]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*853],rbx
	mov qword [rsp+8*854],rax
	mov     rsi, t236
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*855], rax
	mov rbx,  [rsp+8*855]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*856],rdx
	mov rdi, format
	mov rsi,[rsp+8*856] 
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
	mov rbx,t127
	mov rax,rbx
	mov qword [rsp+8*857],rdx
	mov rdx,28
	mov rbx,rdx
	mov qword [rsp+8*859],rbx
	mov qword [rsp+8*858],rax
	
L_2559:
	mov rbx,  [rsp+8*859]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	cmp rax, 0
	mov qword [rsp+8*860],rax
	je L_2560
	mov rbx,  [rsp+8*857]
	mov rdx,  [rsp+8*859]
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,15
	and rax,rbx
	mov rbx,rax
	mov qword [rsp+8*861],rax
	mov rax,10
	cmp rbx,rax
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*862],rbx
	mov qword [rsp+8*863],rdx
	je L_2561
	mov rbx,48
	mov rdx,  [rsp+8*862]
	mov rax,rbx
	add rax,rdx
	mov rdi,rax
	mov rbx,rdi
	mov qword [rsp+8*864],rax
	mov rax,32
	cmp rbx,rax
	mov rdx, 0
	setge dl
	cmp rdx, 0
	mov qword [rsp+8*865],rbx
	mov qword [rsp+8*866],rdx
	jne L_2562
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*866],rbx
	jmp L_2563
	
L_2562:
	mov rbx,  [rsp+8*865]
	mov rdx,126
	cmp rbx,rdx
	mov rax, 0
	setle al
	mov rbx,rax
	mov qword [rsp+8*866],rbx
	mov qword [rsp+8*867],rax
	
L_2563:
	mov rbx,  [rsp+8*866]
	cmp rbx, 0
	je L_2564
	mov rdx,  [gbl+8*764]
	mov rbx,rdx
	mov rax,  [rsp+8*865]
	mov qword [rsp+8*868],rbx
	mov rbx,32
	mov rdx,rax
	sub rdx,rbx
	mov rbx,32
	mov qword [rsp+8*869],rdx
	mov rdx,rax
	sub rdx,rbx
	mov rsi,rdx
	mov qword [rsp+8*870],rdx
	mov rdx,  [rsp+8*869]
	mov rdi,rdx
	mov rax,  [rsp+8*868]
	mov rdx,rax
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
	mov [rsp+8*871], rax
	mov rdx,  [rsp+8*871]
	mov rbx,rdx
	mov qword [rsp+8*872],rbx
	jmp L_2566
	
L_2564:
	mov rdx,t125
	mov rbx,rdx
	mov qword [rsp+8*872],rbx
	
L_2566:
	mov rdx,  [rsp+8*872]
	mov rbx,rdx
	mov qword [rsp+8*873],rbx
	mov     rsi, [rsp+8*873]
	mov     rdi, [rsp+8*858]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*874], rax
	mov rdx,  [rsp+8*874]
	mov rbx,rdx
	mov qword [rsp+8*858],rbx
	jmp L_2567
	
L_2561:
	mov rbx,65
	mov rdx,  [rsp+8*862]
	mov rax,rbx
	add rax,rdx
	mov rbx,10
	sub rax,rbx
	mov rdi,rax
	mov rbx,rdi
	mov rdx,32
	cmp rbx,rdx
	mov qword [rsp+8*875],rax
	mov rax, 0
	setge al
	cmp rax, 0
	mov qword [rsp+8*876],rbx
	mov qword [rsp+8*877],rax
	jne L_2568
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*877],rbx
	jmp L_2569
	
L_2568:
	mov rbx,  [rsp+8*876]
	mov rdx,126
	cmp rbx,rdx
	mov rax, 0
	setle al
	mov rdx,rax
	mov qword [rsp+8*877],rdx
	mov qword [rsp+8*878],rax
	
L_2569:
	mov rbx,  [rsp+8*877]
	cmp rbx, 0
	je L_2570
	mov rdx,  [gbl+8*764]
	mov rbx,rdx
	mov rax,  [rsp+8*876]
	mov qword [rsp+8*879],rbx
	mov rbx,32
	mov rdx,rax
	sub rdx,rbx
	mov rbx,32
	mov qword [rsp+8*880],rdx
	mov rdx,rax
	sub rdx,rbx
	mov rsi,rdx
	mov rbx,  [rsp+8*880]
	mov rdi,rbx
	mov qword [rsp+8*881],rdx
	mov rdx,  [rsp+8*879]
	mov rbx,rdx
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
	mov [rsp+8*882], rax
	mov rdx,  [rsp+8*882]
	mov rbx,rdx
	mov qword [rsp+8*883],rbx
	jmp L_2572
	
L_2570:
	mov rdx,t125
	mov rbx,rdx
	mov qword [rsp+8*883],rbx
	
L_2572:
	mov rdx,  [rsp+8*883]
	mov rbx,rdx
	mov qword [rsp+8*884],rbx
	mov     rsi, [rsp+8*884]
	mov     rdi, [rsp+8*858]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*885], rax
	mov rdx,  [rsp+8*885]
	mov rbx,rdx
	mov qword [rsp+8*858],rbx
	
L_2567:
	mov rbx,  [rsp+8*859]
	mov rdx,4
	mov rax,rbx
	sub rax,rdx
	mov rbx,rax
	mov qword [rsp+8*859],rbx
	mov qword [rsp+8*886],rax
	jmp L_2559
	
L_2560:
	mov rdx,  [rsp+8*858]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*887],rbx
	mov qword [rsp+8*888],rax
	mov     rsi, t243
	mov     rdi, [rsp+8*888]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*889], rax
	mov rbx,  [rsp+8*889]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*890],rdx
	mov rdi, format
	mov rsi,[rsp+8*890] 
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
	mov rdx,rdi
	mov qword [rsp+8*891],rdx
	mov rdi,[rsp+8*891] 
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

