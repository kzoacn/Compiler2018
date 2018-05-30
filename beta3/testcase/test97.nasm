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
	push r12
	call global_init
	pop r12
	pop r15
	mov r15 , rax
	mov rbx,1
	mov r8,rbx
	mov rax,50
	mov rdx,rax
	mov rax,1
	mov rbx,rax
	mov rax,50
	mov r11,rax
	mov qword [rsp+8*3],rdx
	mov rdx,1
	mov rax,rdx
	mov rdx,20
	mov r10,rdx
	mov qword [rsp+8*4],rbx
	mov rbx,30
	mov rdx,rbx
	mov qword [rsp+8*6],rax
	mov rax,0
	mov rbx,rax
	mov rax,0
	mov r13,rax
	mov rax,0
	mov r14,rax
	mov rax,0
	mov r15,rax
	mov r9,r8
	mov qword [rsp+8*9],rbx
	mov qword [rsp+8*8],rdx
	
L_2789:
	mov rbx,  [rsp+8*3]
	cmp r9,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*14],rdx
	je L_2790
	mov rdx,  [rsp+8*4]
	mov rbx,rdx
	mov qword [rsp+8*15],rbx
	
L_2792:
	mov rbx,  [rsp+8*15]
	cmp rbx,r11
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*16],rdx
	je L_2793
	mov rdx,  [rsp+8*6]
	mov rbx,rdx
	mov qword [rsp+8*17],rbx
	
L_2795:
	mov rbx,  [rsp+8*17]
	cmp rbx,r10
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*18],rdx
	je L_2796
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*8]
	mov rsi,rax
	mov rdi,r8
	mov qword [arg+8*2],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*22],rbx
	mov rbx,  [arg+8*2]
	mov rax,rbx
	mov qword [rsp+8*23],rdx
	mov rdx,31
	mov rbx,rax
	and rbx,rdx
	mov qword [rsp+8*25],rbx
	mov rdx,  [rsp+8*25]
	mov rbx,rdx
	mov qword [rsp+8*24],rax
	mov rax,  [rsp+8*23]
	mov rsi,rax
	mov qword [rsp+8*26],rbx
	mov rbx,  [rsp+8*22]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	mov rbx,1
	mov qword [rsp+8*28],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,rax
	mov qword [rsp+8*27],rdx
	mov qword [rsp+8*30],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*29],rax
	
L_3152:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	add r12,r12
	cmp rax, 0
	mov qword [rsp+8*32],rax
	je L_3154
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*36],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*43],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*44],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*46],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	mov qword [rsp+8*38],rdx
	mov rdx,rbx
	mov qword [rsp+8*39],rax
	mov rax,rdx
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rdx,rdx
	mov rcx,1
	shl rdx,cl
	mov rbx,1
	add rdx,rbx
	mov rax,rdx
	mov rbx,  [rsp+8*45]
	mov qword [rsp+8*49],rdx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*48],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,  [rsp+8*48]
	and rax,rbx
	mov rbx,rax
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*50],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*51],rdx
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rax,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rax
	xor rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*54],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rax
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rax
	mov rax,rbx
	mov rcx,rdx
	shl rax,cl
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*35],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*30],rdx
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*58],rbx
	mov qword [rsp+8*31],rdx
	jmp L_3152
	
L_3154:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*59],rax
	mov rax,rdx
	mov qword [rsp+8*60],rbx
	mov rbx,  [rsp+8*26]
	mov rsi,rbx
	mov rdi,rax
	mov qword [rsp+8*61],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov qword [rsp+8*62],rax
	mov rax,rdx
	mov rcx,rbx
	shl rax,cl
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*34],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,32
	mov qword [rsp+8*63],rbx
	mov rbx,  [rsp+8*26]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	sub rax,rbx
	mov rsi,rax
	mov rbx,  [rsp+8*62]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*64],rax
	mov rax,rsi
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*45],rdx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*46],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
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
	mov rdx,  [rsp+8*45]
	mov qword [rsp+8*49],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*48],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rbx,  [rsp+8*48]
	and rax,rbx
	mov rbx,rax
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*50],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*51],rdx
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rax,  [rsp+8*63]
	mov qword [rsp+8*53],rbx
	mov rbx,rax
	or rbx,rdx
	mov qword [rsp+8*66],rbx
	mov qword [rsp+8*65],rdx
	mov rdx,  [rsp+8*66]
	mov rbx,rdx
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
	mov rbx,rdi
	mov qword [arg+8*2],rax
	mov rax,rsi
	mov qword [rsp+8*22],rbx
	mov rbx,  [arg+8*2]
	mov rdx,rbx
	mov qword [rsp+8*23],rax
	mov rax,31
	mov rbx,rdx
	and rbx,rax
	mov qword [rsp+8*25],rbx
	mov qword [rsp+8*24],rdx
	mov rdx,  [rsp+8*25]
	mov rbx,rdx
	mov rax,  [rsp+8*23]
	mov rsi,rax
	mov qword [rsp+8*26],rbx
	mov rbx,  [rsp+8*22]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	mov rbx,1
	mov qword [rsp+8*28],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,rax
	mov qword [rsp+8*27],rdx
	mov qword [rsp+8*30],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*29],rax
	
L_3184:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	add r12,r12
	cmp rax, 0
	mov qword [rsp+8*32],rax
	je L_3186
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*36],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*43],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*44],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*46],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	mov qword [rsp+8*38],rdx
	mov rdx,rbx
	mov qword [rsp+8*39],rax
	mov rax,rdx
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rdx,rdx
	mov rcx,1
	shl rdx,cl
	mov rbx,1
	add rdx,rbx
	mov rax,rdx
	mov rbx,  [rsp+8*45]
	mov qword [rsp+8*49],rdx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*48],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,  [rsp+8*48]
	and rax,rbx
	mov rbx,rax
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*50],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*51],rdx
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rax,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rax
	xor rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*54],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rax
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rax
	mov rax,rbx
	mov rcx,rdx
	shl rax,cl
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*35],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*30],rdx
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*58],rbx
	mov qword [rsp+8*31],rdx
	jmp L_3184
	
L_3186:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*59],rax
	mov rax,rdx
	mov qword [rsp+8*60],rbx
	mov rbx,  [rsp+8*26]
	mov rsi,rbx
	mov rdi,rax
	mov qword [rsp+8*61],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov qword [rsp+8*62],rax
	mov rax,rdx
	mov rcx,rbx
	shl rax,cl
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*34],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,32
	mov qword [rsp+8*63],rbx
	mov rbx,  [rsp+8*26]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	sub rax,rbx
	mov rsi,rax
	mov rbx,  [rsp+8*62]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*64],rax
	mov rax,rsi
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*45],rdx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*46],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
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
	mov rdx,  [rsp+8*45]
	mov qword [rsp+8*49],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*48],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rbx,  [rsp+8*48]
	and rax,rbx
	mov rbx,rax
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*50],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*51],rdx
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rax,  [rsp+8*63]
	mov qword [rsp+8*53],rbx
	mov rbx,rax
	or rbx,rdx
	mov qword [rsp+8*66],rbx
	mov qword [rsp+8*65],rdx
	mov rdx,  [rsp+8*66]
	mov rbx,rdx
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
	mov qword [arg+8*2],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*22],rax
	mov rax,  [arg+8*2]
	mov rbx,rax
	mov qword [rsp+8*23],rdx
	mov rdx,31
	mov rax,rbx
	and rax,rdx
	mov qword [rsp+8*24],rbx
	mov rbx,rax
	mov rdx,  [rsp+8*23]
	mov rsi,rdx
	mov qword [rsp+8*26],rbx
	mov rbx,  [rsp+8*22]
	mov rdi,rbx
	mov qword [rsp+8*25],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,1
	mov qword [rsp+8*28],rdx
	mov rdx,rax
	add rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*27],rax
	mov qword [rsp+8*30],rbx
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*29],rdx
	mov qword [rsp+8*31],rax
	
L_3216:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	add r12,r12
	cmp rax, 0
	mov qword [rsp+8*32],rax
	je L_3218
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*36],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*43],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*44],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*46],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	mov qword [rsp+8*38],rdx
	mov rdx,rbx
	mov qword [rsp+8*39],rax
	mov rax,rdx
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rdx,rdx
	mov rcx,1
	shl rdx,cl
	mov rbx,1
	add rdx,rbx
	mov rax,rdx
	mov rbx,  [rsp+8*45]
	mov qword [rsp+8*49],rdx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*48],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,  [rsp+8*48]
	and rax,rbx
	mov rbx,rax
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*50],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*51],rdx
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rax,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rax
	xor rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*54],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rax
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rax
	mov rax,rbx
	mov rcx,rdx
	shl rax,cl
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*35],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*30],rdx
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*58],rbx
	mov qword [rsp+8*31],rdx
	jmp L_3216
	
L_3218:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*59],rax
	mov rax,rdx
	mov qword [rsp+8*60],rbx
	mov rbx,  [rsp+8*26]
	mov rsi,rbx
	mov rdi,rax
	mov qword [rsp+8*61],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov qword [rsp+8*62],rax
	mov rax,rdx
	mov rcx,rbx
	shl rax,cl
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*34],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,32
	mov qword [rsp+8*63],rbx
	mov rbx,  [rsp+8*26]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	sub rax,rbx
	mov rsi,rax
	mov rbx,  [rsp+8*62]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*64],rax
	mov rax,rsi
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*45],rdx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*46],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
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
	mov rdx,  [rsp+8*45]
	mov qword [rsp+8*49],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*48],rax
	mov rax,rdx
	mov rcx,rbx
	shr rax,cl
	mov rbx,  [rsp+8*48]
	and rax,rbx
	mov rbx,rax
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*50],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*51],rdx
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rax,  [rsp+8*63]
	mov qword [rsp+8*53],rbx
	mov rbx,rax
	or rbx,rdx
	mov qword [rsp+8*66],rbx
	mov qword [rsp+8*65],rdx
	mov rdx,  [rsp+8*66]
	mov rbx,rdx
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
	mov rax,rdi
	mov rbx,rsi
	mov qword [arg+8*2],rdx
	mov qword [rsp+8*22],rax
	mov rax,  [arg+8*2]
	mov rdx,rax
	mov rax,31
	mov qword [rsp+8*23],rbx
	mov rbx,rdx
	and rbx,rax
	mov qword [rsp+8*24],rdx
	mov rdx,rbx
	mov rbx,  [rsp+8*23]
	mov rsi,rbx
	mov rbx,  [rsp+8*22]
	mov rdi,rbx
	mov rbx,rdi
	mov rax,rsi
	mov qword [rsp+8*26],rdx
	mov rdx,1
	mov qword [rsp+8*28],rax
	mov rax,rbx
	add rax,rdx
	mov qword [rsp+8*27],rbx
	mov rbx,rax
	mov qword [rsp+8*30],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*29],rax
	
L_3248:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	add r12,r12
	cmp rax, 0
	mov qword [rsp+8*32],rax
	je L_3250
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*36],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*43],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*44],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*46],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	mov qword [rsp+8*38],rdx
	mov rdx,rbx
	mov qword [rsp+8*39],rax
	mov rax,rdx
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rdx,rdx
	mov rcx,1
	shl rdx,cl
	mov rbx,1
	add rdx,rbx
	mov rax,rdx
	mov rbx,  [rsp+8*45]
	mov qword [rsp+8*49],rdx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*48],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,  [rsp+8*48]
	and rax,rbx
	mov rbx,rax
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*50],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*51],rdx
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rax,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rax
	xor rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*54],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rax
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rax
	mov rax,rbx
	mov rcx,rdx
	shl rax,cl
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*35],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*30],rdx
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*58],rbx
	mov qword [rsp+8*31],rdx
	jmp L_3248
	
L_3250:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*59],rax
	mov rax,rdx
	mov qword [rsp+8*61],rdx
	mov rdx,  [rsp+8*26]
	mov rsi,rdx
	mov rdi,rax
	mov qword [rsp+8*60],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*62],rax
	mov rax,rbx
	mov rcx,rdx
	shl rax,cl
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*35],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,32
	mov qword [rsp+8*63],rbx
	mov rbx,  [rsp+8*26]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	sub rax,rbx
	mov rsi,rax
	mov rbx,  [rsp+8*62]
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*45],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*46],rdx
	mov rdx,rdi
	mov rax,rsi
	mov rbx,rdx
	mov rcx,16
	shl rbx,cl
	or rbx,rax
	mov qword [rsp+8*37],rdx
	mov rdx,rbx
	mov qword [rsp+8*38],rax
	mov rax,rdx
	mov qword [rsp+8*39],rbx
	mov rbx,rax
	mov qword [rsp+8*40],rdx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*47],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rax,rax
	mov rcx,1
	shl rax,cl
	mov qword [rsp+8*48],rbx
	mov rbx,1
	add rax,rbx
	mov rdx,rax
	mov rbx,  [rsp+8*45]
	mov qword [rsp+8*48],rdx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*49],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,  [rsp+8*48]
	and rax,rbx
	mov rbx,rax
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*50],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*51],rdx
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rax,  [rsp+8*63]
	mov qword [rsp+8*53],rbx
	mov rbx,rax
	or rbx,rdx
	mov qword [rsp+8*65],rdx
	mov rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*67],rdx
	mov rdx,rbx
	mov qword [rsp+8*75],rbx
	mov rbx,1
	mov rsi,rbx
	mov rbx,  [rsp+8*17]
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*76],rdx
	mov rdx,rsi
	mov rbx,1
	mov qword [rsp+8*28],rdx
	mov rdx,rax
	add rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*27],rax
	mov qword [rsp+8*30],rbx
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*29],rdx
	mov qword [rsp+8*31],rax
	
L_2960:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	add r12,r12
	cmp rax, 0
	mov qword [rsp+8*32],rax
	je L_2962
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*36],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*43],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*44],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*46],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	mov qword [rsp+8*38],rdx
	mov rdx,rbx
	mov qword [rsp+8*39],rax
	mov rax,rdx
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rdx,rdx
	mov rcx,1
	shl rdx,cl
	mov rbx,1
	add rdx,rbx
	mov rax,rdx
	mov rbx,  [rsp+8*45]
	mov qword [rsp+8*49],rdx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*48],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,  [rsp+8*48]
	and rax,rbx
	mov rbx,rax
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*50],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*51],rdx
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rax,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rax
	xor rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*54],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rax
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rax
	mov rax,rbx
	mov rcx,rdx
	shl rax,cl
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*35],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*30],rdx
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*58],rbx
	mov qword [rsp+8*31],rdx
	jmp L_2960
	
L_2962:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*59],rax
	mov rax,1
	mov rsi,rax
	mov rax,  [rsp+8*15]
	mov rdi,rax
	mov qword [rsp+8*60],rbx
	mov rbx,rdi
	mov qword [rsp+8*77],rdx
	mov rdx,rsi
	mov rax,1
	mov qword [rsp+8*28],rdx
	mov rdx,rbx
	add rdx,rax
	mov qword [rsp+8*27],rbx
	mov rbx,rdx
	mov qword [rsp+8*30],rbx
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*29],rdx
	mov qword [rsp+8*31],rax
	
L_2980:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	add r12,r12
	cmp rax, 0
	mov qword [rsp+8*32],rax
	je L_2982
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*36],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*43],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*44],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*46],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	mov qword [rsp+8*38],rdx
	mov rdx,rbx
	mov qword [rsp+8*39],rax
	mov rax,rdx
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rdx,rdx
	mov rcx,1
	shl rdx,cl
	mov rbx,1
	add rdx,rbx
	mov rax,rdx
	mov rbx,  [rsp+8*45]
	mov qword [rsp+8*49],rdx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*48],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,  [rsp+8*48]
	and rax,rbx
	mov rbx,rax
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*50],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*51],rdx
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rax,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rax
	xor rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*54],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rax
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rax
	mov rax,rbx
	mov rcx,rdx
	shl rax,cl
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*35],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*30],rdx
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*58],rbx
	mov qword [rsp+8*31],rdx
	jmp L_2980
	
L_2982:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*59],rax
	mov rax,  [rsp+8*77]
	mov qword [rsp+8*60],rbx
	mov rbx,rax
	xor rbx,rdx
	mov qword [rsp+8*78],rdx
	mov rdx,1
	mov rsi,rdx
	mov rdi,r9
	mov rdx,rdi
	mov rax,rsi
	mov qword [rsp+8*79],rbx
	mov rbx,1
	mov qword [rsp+8*28],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,rax
	mov qword [rsp+8*27],rdx
	mov qword [rsp+8*30],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*29],rax
	
L_3000:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	add r12,r12
	cmp rax, 0
	mov qword [rsp+8*32],rax
	je L_3002
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*36],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*43],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*44],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*46],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	mov qword [rsp+8*38],rdx
	mov rdx,rbx
	mov qword [rsp+8*39],rax
	mov rax,rdx
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rdx,rdx
	mov rcx,1
	shl rdx,cl
	mov rbx,1
	add rdx,rbx
	mov rax,rdx
	mov rbx,  [rsp+8*45]
	mov qword [rsp+8*49],rdx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*48],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,  [rsp+8*48]
	and rax,rbx
	mov rbx,rax
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*50],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*51],rdx
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rax,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rax
	xor rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*54],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rax
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rax
	mov rax,rbx
	mov rcx,rdx
	shl rax,cl
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*35],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*30],rdx
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*58],rbx
	mov qword [rsp+8*31],rdx
	jmp L_3000
	
L_3002:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*59],rax
	mov rax,  [rsp+8*79]
	xor rax,rdx
	mov qword [rsp+8*80],rdx
	mov rdx,rax
	mov rax,  [rsp+8*69]
	mov qword [rsp+8*60],rbx
	mov rbx,rax
	xor rbx,rdx
	mov rax,1
	mov rsi,rax
	mov rdi,rbx
	mov rbx,rdi
	mov rax,rsi
	mov qword [rsp+8*81],rdx
	mov rdx,1
	mov qword [rsp+8*28],rax
	mov rax,rbx
	add rax,rdx
	mov qword [rsp+8*27],rbx
	mov rbx,rax
	mov qword [rsp+8*30],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*29],rax
	
L_3020:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	add r12,r12
	cmp rax, 0
	mov qword [rsp+8*32],rax
	je L_3022
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*36],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*43],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*44],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*46],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	mov qword [rsp+8*38],rdx
	mov rdx,rbx
	mov qword [rsp+8*39],rax
	mov rax,rdx
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rdx,rdx
	mov rcx,1
	shl rdx,cl
	mov rbx,1
	add rdx,rbx
	mov rax,rdx
	mov rbx,  [rsp+8*45]
	mov qword [rsp+8*49],rdx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*48],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,  [rsp+8*48]
	and rax,rbx
	mov rbx,rax
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*50],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*51],rdx
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rax,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rax
	xor rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*54],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rax
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rax
	mov rax,rbx
	mov rcx,rdx
	shl rax,cl
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*35],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*30],rdx
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*58],rbx
	mov qword [rsp+8*31],rdx
	jmp L_3020
	
L_3022:
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
	mov rdx,  [rsp+8*81]
	mov qword [rsp+8*9],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,1
	mov rsi,rbx
	mov rdi,rax
	mov rbx,rdi
	mov rax,rsi
	mov rdx,1
	mov qword [rsp+8*28],rax
	mov rax,rbx
	add rax,rdx
	mov qword [rsp+8*27],rbx
	mov rbx,rax
	mov qword [rsp+8*30],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*29],rax
	
L_3040:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	add r12,r12
	cmp rax, 0
	mov qword [rsp+8*32],rax
	je L_3042
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*36],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*43],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*44],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*46],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	mov qword [rsp+8*38],rdx
	mov rdx,rbx
	mov qword [rsp+8*39],rax
	mov rax,rdx
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rdx,rdx
	mov rcx,1
	shl rdx,cl
	mov rbx,1
	add rdx,rbx
	mov rax,rdx
	mov rbx,  [rsp+8*45]
	mov qword [rsp+8*49],rdx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*48],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,  [rsp+8*48]
	and rax,rbx
	mov rbx,rax
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*50],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*51],rdx
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rax,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rax
	xor rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*54],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rax
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rax
	mov rax,rbx
	mov rcx,rdx
	shl rax,cl
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*35],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*30],rdx
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*58],rbx
	mov qword [rsp+8*31],rdx
	jmp L_3040
	
L_3042:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	add r13,rdx
	mov r13,r13
	mov qword [rsp+8*86],rdx
	mov rdx,  [rsp+8*73]
	mov qword [rsp+8*59],rax
	mov rax,  [rsp+8*81]
	mov qword [rsp+8*60],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,1
	mov rsi,rdx
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,1
	mov qword [rsp+8*28],rdx
	mov rdx,rbx
	add rdx,rax
	mov qword [rsp+8*27],rbx
	mov rbx,rdx
	mov qword [rsp+8*30],rbx
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*29],rdx
	mov qword [rsp+8*31],rax
	
L_3060:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	add r12,r12
	cmp rax, 0
	mov qword [rsp+8*32],rax
	je L_3062
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*36],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*43],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov qword [rsp+8*44],rax
	mov rax,rdi
	mov rbx,rsi
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*46],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,rbx
	mov rcx,16
	shl rax,cl
	or rax,rdx
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	mov qword [rsp+8*38],rdx
	mov rdx,rbx
	mov qword [rsp+8*39],rax
	mov rax,rdx
	mov qword [rsp+8*40],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*47],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rdx,rdx
	mov rcx,1
	shl rdx,cl
	mov rbx,1
	add rdx,rbx
	mov rax,rdx
	mov rbx,  [rsp+8*45]
	mov qword [rsp+8*49],rdx
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*48],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,  [rsp+8*48]
	and rax,rbx
	mov rbx,rax
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rdi,rbx
	mov qword [rsp+8*50],rax
	mov rax,rdi
	mov rdx,rsi
	mov rbx,rax
	mov rcx,16
	shl rbx,cl
	or rbx,rdx
	mov qword [rsp+8*37],rax
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rdx,rax
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rax
	mov rax,rbx
	and rax,rdx
	mov rbx,rax
	mov qword [rsp+8*51],rdx
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rax,  [rsp+8*30]
	mov qword [rsp+8*53],rbx
	mov rbx,rax
	xor rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*54],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rax
	mov qword [rsp+8*55],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rax
	mov rax,rbx
	mov rcx,rdx
	shl rax,cl
	mov qword [rsp+8*34],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*35],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*30],rdx
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	mov qword [rsp+8*57],rax
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*58],rbx
	mov qword [rsp+8*31],rdx
	jmp L_3060
	
L_3062:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	add r14,rdx
	mov r14,r14
	mov qword [rsp+8*89],rdx
	mov rdx,  [rsp+8*76]
	mov qword [rsp+8*59],rax
	mov rax,  [rsp+8*81]
	mov qword [rsp+8*60],rbx
	mov rbx,rdx
	xor rbx,rax
	mov rdx,1
	mov rsi,rdx
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,1
	mov qword [rsp+8*28],rdx
	mov rdx,rbx
	add rdx,rax
	mov qword [rsp+8*27],rbx
	mov rbx,rdx
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rdx
	
L_3080:
	mov rbx,  [rsp+8*28]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	cmp rbx,rax
	mov rax, 0
	setl al
	add r12,r12
	cmp rax, 0
	mov qword [rsp+8*32],rax
	je L_3082
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,rbx
	shl rdx,cl
	mov qword [rsp+8*35],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*36],rdx
	mov rdx,65535
	mov rdi,rdx
	mov qword [rsp+8*34],rax
	mov rax,rdi
	mov rbx,rsi
	mov rdx,rax
	mov rcx,16
	shl rdx,cl
	or rdx,rbx
	mov qword [rsp+8*37],rax
	mov rax,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*40],rax
	mov rax,rdx
	mov qword [rsp+8*41],rbx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [rsp+8*30]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	xor rax,rbx
	mov rdx,rax
	mov qword [rsp+8*43],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov rbx,rdi
	mov rax,rsi
	mov qword [rsp+8*30],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rdx,32767
	mov rdi,rdx
	mov rdx,rdi
	mov qword [rsp+8*45],rbx
	mov rbx,rsi
	mov qword [rsp+8*46],rax
	mov rax,rdx
	mov rcx,16
	shl rax,cl
	or rax,rbx
	mov qword [rsp+8*37],rdx
	mov rdx,rax
	mov qword [rsp+8*38],rbx
	mov rbx,rdx
	mov qword [rsp+8*39],rax
	mov rax,rbx
	mov qword [rsp+8*47],rbx
	mov rbx,  [rsp+8*46]
	mov qword [rsp+8*40],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov rdx,rdx
	mov rcx,1
	shl rdx,cl
	mov rbx,1
	add rdx,rbx
	mov rax,rdx
	mov rbx,  [rsp+8*45]
	mov rdx,  [rsp+8*46]
	mov qword [rsp+8*48],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,  [rsp+8*48]
	and rax,rbx
	mov rbx,rax
	mov rdx,65535
	mov rsi,rdx
	mov rdx,65535
	mov rdi,rdx
	mov rdx,rdi
	mov rax,rsi
	mov qword [rsp+8*48],rbx
	mov rbx,rdx
	mov rcx,16
	shl rbx,cl
	or rbx,rax
	mov qword [rsp+8*37],rdx
	mov rdx,rbx
	mov qword [rsp+8*38],rax
	mov rax,rdx
	mov qword [rsp+8*39],rbx
	mov rbx,  [rsp+8*48]
	mov qword [rsp+8*40],rdx
	mov rdx,rbx
	and rdx,rax
	mov rbx,rdx
	mov rdx,rbx
	mov qword [rsp+8*53],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*51],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*54],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	mov qword [rsp+8*30],rbx
	mov rbx,rdx
	mov rcx,rax
	shl rbx,cl
	mov qword [rsp+8*34],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rdx,65535
	mov rdi,rdx
	mov rdx,rdi
	mov qword [rsp+8*35],rax
	mov rax,rsi
	mov qword [rsp+8*36],rbx
	mov rbx,rdx
	mov rcx,16
	shl rbx,cl
	or rbx,rax
	mov qword [rsp+8*37],rdx
	mov rdx,rbx
	mov rbx,rdx
	mov qword [rsp+8*40],rdx
	mov rdx,  [rsp+8*36]
	and rdx,rbx
	mov qword [rsp+8*41],rbx
	mov rbx,rdx
	mov rdx,rbx
	mov qword [rsp+8*42],rbx
	mov rbx,  [rsp+8*30]
	mov qword [rsp+8*38],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*56],rdx
	mov rax,  [rsp+8*31]
	mov rdx,rax
	mov qword [rsp+8*58],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rax
	jmp L_3080
	
L_3082:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	add r15,rdx
	mov r15,r15
	mov qword [rsp+8*60],rbx
	mov qword [rsp+8*92],rdx
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov qword [rsp+8*94],rbx
	mov rbx,1
	add rdx,rbx
	mov qword [rsp+8*17],rdx
	mov qword [rsp+8*59],rax
	jmp L_2795
	
L_2796:
	mov rdx,  [rsp+8*15]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*95],rbx
	mov qword [rsp+8*15],rdx
	jmp L_2792
	
L_2793:
	mov rbx,r9
	mov rdx,1
	add r9,rdx
	mov qword [rsp+8*96],rbx
	jmp L_2789
	
L_2790:
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov r12,rdi
	mov rdx,t127
	mov r10,rdx
	mov rax,28
	mov r11,rax
	
L_2872:
	mov rbx,0
	cmp r11,rbx
	mov r9, 0
	setge r9B
	cmp r9, 0
	je L_2873
	mov r9,r12
	mov rcx,r11
	shr r9,cl
	mov rbx,15
	and r9,rbx
	mov r9,r9
	mov rdx,10
	cmp r9,rdx
	mov r8, 0
	setl r8B
	cmp r8, 0
	je L_2874
	mov rbx,48
	add r9,rbx
	mov rdi,r9
	mov r9,rdi
	mov rdx,32
	cmp r9,rdx
	mov r8, 0
	setge r8B
	cmp r8, 0
	jne L_2875
	mov rbx,0
	mov r8,rbx
	jmp L_2876
	
L_2875:
	mov rbx,126
	cmp r9,rbx
	mov r8, 0
	setle r8B
	mov r8,r8
	
L_2876:
	cmp r8, 0
	je L_2877
	mov rdx,  [gbl+8*108]
	mov rbx,rdx
	mov rax,32
	mov r8,r9
	sub r8,rax
	mov qword [rsp+8*109],rbx
	mov rbx,32
	sub r9,rbx
	mov rsi,r9
	mov rdi,r8
	mov rax,  [rsp+8*109]
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
	mov  r9, rax
	mov r9,r9
	jmp L_2879
	
L_2877:
	mov rbx,t125
	mov r9,rbx
	
L_2879:
	mov r9,r9
	mov     rsi,  r9
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
	mov  r10, rax
	mov r10,r10
	jmp L_2880
	
L_2874:
	mov rbx,65
	add r9,rbx
	mov rdx,10
	sub r9,rdx
	mov rdi,r9
	mov r9,rdi
	mov rax,32
	cmp r9,rax
	mov r8, 0
	setge r8B
	cmp r8, 0
	jne L_2881
	mov rbx,0
	mov r8,rbx
	jmp L_2882
	
L_2881:
	mov rbx,126
	cmp r9,rbx
	mov r8, 0
	setle r8B
	mov r8,r8
	
L_2882:
	cmp r8, 0
	je L_2883
	mov rdx,  [gbl+8*108]
	mov rbx,rdx
	mov rax,32
	mov r8,r9
	sub r8,rax
	mov qword [rsp+8*109],rbx
	mov rbx,32
	sub r9,rbx
	mov rsi,r9
	mov rdi,r8
	mov rax,  [rsp+8*109]
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
	mov  r9, rax
	mov r9,r9
	jmp L_2885
	
L_2883:
	mov rbx,t125
	mov r9,rbx
	
L_2885:
	mov r9,r9
	mov     rsi,  r9
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
	mov  r10, rax
	mov r10,r10
	
L_2880:
	mov rbx,4
	sub r11,rbx
	mov r11,r11
	jmp L_2872
	
L_2873:
	mov r12,r10
	mov r12,r12
	mov     rsi, t222
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
	mov  r12, rax
	mov rdi,r12
	mov r12,rdi
	mov rdi, format
	mov rsi, r12 
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
	mov rdi,r13
	mov r12,rdi
	mov rbx,t127
	mov r10,rbx
	mov rdx,28
	mov r11,rdx
	
L_2889:
	mov rbx,0
	cmp r11,rbx
	mov r9, 0
	setge r9B
	cmp r9, 0
	je L_2890
	mov r9,r12
	mov rcx,r11
	shr r9,cl
	mov rbx,15
	and r9,rbx
	mov r9,r9
	mov rdx,10
	cmp r9,rdx
	mov r8, 0
	setl r8B
	cmp r8, 0
	je L_2891
	mov rbx,48
	add r9,rbx
	mov rdi,r9
	mov r9,rdi
	mov rdx,32
	cmp r9,rdx
	mov r8, 0
	setge r8B
	cmp r8, 0
	jne L_2892
	mov rbx,0
	mov r8,rbx
	jmp L_2893
	
L_2892:
	mov rbx,126
	cmp r9,rbx
	mov r8, 0
	setle r8B
	mov r8,r8
	
L_2893:
	cmp r8, 0
	je L_2894
	mov rdx,  [gbl+8*108]
	mov rbx,rdx
	mov rax,32
	mov r8,r9
	sub r8,rax
	mov qword [rsp+8*109],rbx
	mov rbx,32
	sub r9,rbx
	mov rsi,r9
	mov rdi,r8
	mov rax,  [rsp+8*109]
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
	mov  r9, rax
	mov r9,r9
	jmp L_2896
	
L_2894:
	mov rbx,t125
	mov r9,rbx
	
L_2896:
	mov r9,r9
	mov     rsi,  r9
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
	mov  r10, rax
	mov r10,r10
	jmp L_2897
	
L_2891:
	mov rbx,65
	add r9,rbx
	mov rdx,10
	sub r9,rdx
	mov rdi,r9
	mov r9,rdi
	mov rax,32
	cmp r9,rax
	mov r8, 0
	setge r8B
	cmp r8, 0
	jne L_2898
	mov rbx,0
	mov r8,rbx
	jmp L_2899
	
L_2898:
	mov rbx,126
	cmp r9,rbx
	mov r8, 0
	setle r8B
	mov r8,r8
	
L_2899:
	cmp r8, 0
	je L_2900
	mov rdx,  [gbl+8*108]
	mov rbx,rdx
	mov rax,32
	mov r8,r9
	sub r8,rax
	mov qword [rsp+8*109],rbx
	mov rbx,32
	sub r9,rbx
	mov rsi,r9
	mov rdi,r8
	mov rax,  [rsp+8*109]
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
	mov  r9, rax
	mov r9,r9
	jmp L_2902
	
L_2900:
	mov rbx,t125
	mov r9,rbx
	
L_2902:
	mov r9,r9
	mov     rsi,  r9
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
	mov  r10, rax
	mov r10,r10
	
L_2897:
	mov rbx,4
	sub r11,rbx
	mov r11,r11
	jmp L_2889
	
L_2890:
	mov r12,r10
	mov r13,r12
	mov     rsi, t229
	mov     rdi,  r13
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r13, rax
	mov rdi,r13
	mov r13,rdi
	mov rdi, format
	mov rsi, r13 
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
	mov rdi,r14
	mov r12,rdi
	mov rbx,t127
	mov r10,rbx
	mov rdx,28
	mov r11,rdx
	
L_2906:
	mov rbx,0
	cmp r11,rbx
	mov r9, 0
	setge r9B
	cmp r9, 0
	je L_2907
	mov r9,r12
	mov rcx,r11
	shr r9,cl
	mov rbx,15
	and r9,rbx
	mov r9,r9
	mov rdx,10
	cmp r9,rdx
	mov r8, 0
	setl r8B
	cmp r8, 0
	je L_2908
	mov rbx,48
	add r9,rbx
	mov rdi,r9
	mov r9,rdi
	mov rdx,32
	cmp r9,rdx
	mov r8, 0
	setge r8B
	cmp r8, 0
	jne L_2909
	mov rbx,0
	mov r8,rbx
	jmp L_2910
	
L_2909:
	mov rbx,126
	cmp r9,rbx
	mov r8, 0
	setle r8B
	mov r8,r8
	
L_2910:
	cmp r8, 0
	je L_2911
	mov rdx,  [gbl+8*108]
	mov rbx,rdx
	mov rax,32
	mov r8,r9
	sub r8,rax
	mov qword [rsp+8*109],rbx
	mov rbx,32
	sub r9,rbx
	mov rsi,r9
	mov rdi,r8
	mov rax,  [rsp+8*109]
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
	mov  r9, rax
	mov r9,r9
	jmp L_2913
	
L_2911:
	mov rbx,t125
	mov r9,rbx
	
L_2913:
	mov r9,r9
	mov     rsi,  r9
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
	mov  r10, rax
	mov r10,r10
	jmp L_2914
	
L_2908:
	mov rbx,65
	add r9,rbx
	mov rdx,10
	sub r9,rdx
	mov rdi,r9
	mov r9,rdi
	mov rax,32
	cmp r9,rax
	mov r8, 0
	setge r8B
	cmp r8, 0
	jne L_2915
	mov rbx,0
	mov r8,rbx
	jmp L_2916
	
L_2915:
	mov rbx,126
	cmp r9,rbx
	mov r8, 0
	setle r8B
	mov r8,r8
	
L_2916:
	cmp r8, 0
	je L_2917
	mov rdx,  [gbl+8*108]
	mov rbx,rdx
	mov rax,32
	mov r8,r9
	sub r8,rax
	mov qword [rsp+8*109],rbx
	mov rbx,32
	sub r9,rbx
	mov rsi,r9
	mov rdi,r8
	mov rax,  [rsp+8*109]
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
	mov  r9, rax
	mov r9,r9
	jmp L_2919
	
L_2917:
	mov rbx,t125
	mov r9,rbx
	
L_2919:
	mov r9,r9
	mov     rsi,  r9
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
	mov  r10, rax
	mov r10,r10
	
L_2914:
	mov rbx,4
	sub r11,rbx
	mov r11,r11
	jmp L_2906
	
L_2907:
	mov r12,r10
	mov r14,r12
	mov     rsi, t236
	mov     rdi,  r14
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r14, rax
	mov rdi,r14
	mov r14,rdi
	mov rdi, format
	mov rsi, r14 
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
	mov rdi,r15
	mov r12,rdi
	mov rbx,t127
	mov r10,rbx
	mov rdx,28
	mov r11,rdx
	
L_2923:
	mov rbx,0
	cmp r11,rbx
	mov r9, 0
	setge r9B
	cmp r9, 0
	je L_2924
	mov r9,r12
	mov rcx,r11
	shr r9,cl
	mov rbx,15
	and r9,rbx
	mov r9,r9
	mov rdx,10
	cmp r9,rdx
	mov r8, 0
	setl r8B
	cmp r8, 0
	je L_2925
	mov rbx,48
	add r9,rbx
	mov rdi,r9
	mov r9,rdi
	mov rdx,32
	cmp r9,rdx
	mov r8, 0
	setge r8B
	cmp r8, 0
	jne L_2926
	mov rbx,0
	mov r8,rbx
	jmp L_2927
	
L_2926:
	mov rbx,126
	cmp r9,rbx
	mov r8, 0
	setle r8B
	mov r8,r8
	
L_2927:
	cmp r8, 0
	je L_2928
	mov rdx,  [gbl+8*108]
	mov rbx,rdx
	mov rax,32
	mov r8,r9
	sub r8,rax
	mov qword [rsp+8*109],rbx
	mov rbx,32
	sub r9,rbx
	mov rsi,r9
	mov rdi,r8
	mov rax,  [rsp+8*109]
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
	mov  r9, rax
	mov r9,r9
	jmp L_2930
	
L_2928:
	mov rbx,t125
	mov r9,rbx
	
L_2930:
	mov r9,r9
	mov     rsi,  r9
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
	mov  r10, rax
	mov r10,r10
	jmp L_2931
	
L_2925:
	mov rbx,65
	add r9,rbx
	mov rdx,10
	sub r9,rdx
	mov rdi,r9
	mov r9,rdi
	mov rax,32
	cmp r9,rax
	mov r8, 0
	setge r8B
	cmp r8, 0
	jne L_2932
	mov rbx,0
	mov r8,rbx
	jmp L_2933
	
L_2932:
	mov rbx,126
	cmp r9,rbx
	mov r8, 0
	setle r8B
	mov r8,r8
	
L_2933:
	cmp r8, 0
	je L_2934
	mov rdx,  [gbl+8*108]
	mov rbx,rdx
	mov rax,32
	mov r8,r9
	sub r8,rax
	mov rax,32
	sub r9,rax
	mov rsi,r9
	mov rdi,r8
	mov rax,rbx
	mov qword [rsp+8*109],rbx
	mov qword [arg+8*63],rax
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
	mov  r9, rax
	mov r9,r9
	jmp L_2936
	
L_2934:
	mov rbx,t125
	mov r9,rbx
	
L_2936:
	mov r9,r9
	mov     rsi,  r9
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
	mov  r10, rax
	mov r10,r10
	
L_2931:
	mov rbx,4
	sub r11,rbx
	mov r11,r11
	jmp L_2923
	
L_2924:
	mov r12,r10
	mov r15,r12
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

