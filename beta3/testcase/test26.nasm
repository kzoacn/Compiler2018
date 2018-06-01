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
	sub    rsp, 2640
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
        sub     rdx, 4624
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rbx,102
	mov r11,rbx
	mov rax,0
	mov rdx,rax
	mov rbx,0
	mov r10,rbx
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*3],rdx
	mov rdx,0
	mov rax,rdx
	mov rdx,-1
	mov r15,rdx
	mov rdx,-1
	mov qword [rsp+8*5],rbx
	mov rbx,0
	mov r14,rdx
	imul r14,rbx
	add r15,r14
	mov rbx,1
	mov r14,rbx
	imul r14,r11
	add r15,r14
	mov r8,r15
	mov rbx,-1
	mov r14,rbx
	mov rbx,-1
	mov rdx,0
	mov r15,rbx
	imul r15,rdx
	add r14,r15
	mov rbx,1
	mov r15,rbx
	imul r15,r11
	add r14,r15
	mov r9,r14
	mov rbx,0
	mov r13,rbx
	mov rbx,0
	mov r12,rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*6],rax
	mov rax,0
	mov rdx,rax
	mov r15,r11
	imul r15,r11
	mov qword [rsp+8*17],rbx
	mov qword [rsp+8*18],rdx
	mov     rdi,  r15
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,r15
	mov rdx,0
	mov r13,rdx
	mov qword [rsp+8*21],rbx
	
L_892:
	mov r15,r11
	imul r15,r11
	cmp r13,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_893
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r13
	mov rax,1
	add r13,rax
	jmp L_892
	
L_893:
	mov r15,r11
	imul r15,r11
	mov     rdi,  r15
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,r15
	mov rdx,0
	mov r13,rdx
	mov qword [rsp+8*29],rbx
	
L_895:
	mov r15,r11
	imul r15,r11
	cmp r13,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_896
	mov rbx,  [rsp+8*29]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r13
	mov rax,1
	add r13,rax
	jmp L_895
	
L_896:
	mov     rdi,  r11
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,r15
	mov rdx,0
	mov r13,rdx
	mov qword [rsp+8*35],rbx
	
L_898:
	cmp r13,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_899
	mov     rdi,  r11
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
	mov rbx,  [rsp+8*35]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov rdx,0
	mov r14,rdx
	
L_901:
	cmp r14,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_902
	mov rbx,1
	mov r12,rbx
	neg r12
	mov rdx,  [rsp+8*35]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r14*8+8H]
	mov [r15],r12
	mov r15,r14
	mov rax,1
	add r14,rax
	jmp L_901
	
L_902:
	mov r15,r13
	mov rbx,1
	add r13,rbx
	jmp L_898
	
L_899:
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	mov rdx,0
	lea r15,[r15+rdx*8+8H]
	mov rax,  [rsp+8*5]
	mov [r15],rax
	mov rdx,  [rsp+8*29]
	mov r15,rdx
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov rbx,  [rsp+8*6]
	mov [r15],rbx
	mov rax,  [rsp+8*35]
	mov r15,rax
	mov rdx,  [rsp+8*5]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	lea r15,[r15+rbx*8+8H]
	mov rbx,0
	mov [r15],rbx
	
L_904:
	mov rbx,  [rsp+8*3]
	cmp rbx,r10
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_905
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r14, [r15]
	mov rax,  [rsp+8*29]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r13, [r15]
	mov rbx,  [rsp+8*35]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	mov rax,r15
	mov rdx,  [rsp+8*21]
	mov r15,rdx
	mov rbx,  [rsp+8*3]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov qword [rsp+8*17],rax
	mov rax,1
	sub r15,rax
	mov r13,r15
	mov rax,  [rsp+8*29]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rdx,2
	sub r15,rdx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*73],rdx
	mov qword [rsp+8*75],rax
	jne L_994
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_995
	
L_994:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_995:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	cmp r15, 0
	jne L_906
	mov rbx,0
	mov r15,rbx
	jmp L_907
	
L_906:
	mov rsi,r11
	mov rdi,r12
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*75],rdx
	jne L_998
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_999
	
L_998:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_999:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	mov r15,r15
	
L_907:
	cmp r15, 0
	je L_909
	mov rdx,  [rsp+8*35]
	mov rbx,rdx
	lea rax,[rbx+r13*8+8H]
	mov rbx, [rax]
	lea rax,[rbx+r12*8+8H]
	mov qword [rsp+8*81],rbx
	mov rbx, [rax]
	mov qword [rsp+8*82],rax
	mov rax,1
	mov rdx,rax
	neg rdx
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*83],rbx
	mov qword [rsp+8*84],rdx
	mov qword [rsp+8*85],rax
	je L_911
	mov rdx,1
	mov rbx,rdx
	mov rax,1
	mov r15,rax
	imul r15,r10
	add rbx,r15
	mov rdx,1
	mov rax,0
	mov r15,rdx
	imul r15,rax
	add rbx,r15
	mov r10,rbx
	mov qword [rsp+8*86],rbx
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rdx,  [rsp+8*29]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,1
	mov rax,rbx
	mov rbx,1
	mov rdx,0
	mov qword [rsp+8*93],rax
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*93]
	add rbx,rax
	mov rdx,1
	mov qword [rsp+8*94],rax
	mov rax,  [rsp+8*17]
	mov qword [rsp+8*93],rbx
	mov rbx,rdx
	imul rbx,rax
	mov rdx,  [rsp+8*93]
	add rdx,rbx
	mov qword [rsp+8*95],rbx
	mov rax,  [rsp+8*35]
	mov rbx,rax
	mov qword [rsp+8*93],rdx
	lea rdx,[rbx+r13*8+8H]
	mov rbx, [rdx]
	lea rdx,[rbx+r12*8+8H]
	mov qword [rsp+8*96],rbx
	mov rbx,  [rsp+8*93]
	mov [rdx],rbx
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*97],rdx
	jne L_912
	mov rbx,0
	mov r15,rbx
	jmp L_913
	
L_912:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_913:
	cmp r15, 0
	je L_915
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_915:
	
L_911:
	
L_909:
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	sub r15,rax
	mov r13,r15
	mov rax,  [rsp+8*29]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,2
	add r15,rbx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*75],rax
	jne L_1002
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_1003
	
L_1002:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_1003:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	cmp r15, 0
	jne L_916
	mov rbx,0
	mov r15,rbx
	jmp L_917
	
L_916:
	mov rsi,r11
	mov rdi,r12
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*75],rdx
	jne L_1006
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_1007
	
L_1006:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_1007:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	mov r15,r15
	
L_917:
	cmp r15, 0
	je L_919
	mov rbx,  [rsp+8*35]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	mov rdx,1
	mov r14,rdx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_921
	mov rbx,1
	mov r14,rbx
	mov rdx,1
	mov rax,0
	mov r15,rdx
	imul r15,rax
	add r14,r15
	mov rbx,1
	mov r15,rbx
	imul r15,r10
	add r14,r15
	mov r10,r14
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rdx,  [rsp+8*29]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rax,1
	mov r14,rax
	mov rax,1
	mov rbx,  [rsp+8*17]
	mov r15,rax
	imul r15,rbx
	add r14,r15
	mov rax,1
	mov rdx,0
	mov r15,rax
	imul r15,rdx
	add r14,r15
	mov rdx,  [rsp+8*35]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_922
	mov rbx,0
	mov r15,rbx
	jmp L_923
	
L_922:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_923:
	cmp r15, 0
	je L_925
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_925:
	
L_921:
	
L_919:
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r13,r15
	mov rax,  [rsp+8*29]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,2
	sub r15,rbx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*75],rax
	jne L_1010
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_1011
	
L_1010:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_1011:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	cmp r15, 0
	jne L_926
	mov rbx,0
	mov r15,rbx
	jmp L_927
	
L_926:
	mov rsi,r11
	mov rdi,r12
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*75],rdx
	jne L_1014
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_1015
	
L_1014:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_1015:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	mov r15,r15
	
L_927:
	cmp r15, 0
	je L_929
	mov rbx,  [rsp+8*35]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	mov rdx,1
	mov r14,rdx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_931
	mov rbx,1
	mov r14,rbx
	mov rdx,1
	mov r15,rdx
	imul r15,r10
	add r14,r15
	mov rax,1
	mov rbx,0
	mov r15,rax
	imul r15,rbx
	add r14,r15
	mov r10,r14
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rdx,  [rsp+8*29]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,1
	mov rax,rbx
	mov rbx,1
	mov rdx,0
	mov qword [rsp+8*153],rax
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*153]
	add rbx,rax
	mov rdx,1
	mov qword [rsp+8*154],rax
	mov rax,  [rsp+8*17]
	mov qword [rsp+8*153],rbx
	mov rbx,rdx
	imul rbx,rax
	mov rdx,  [rsp+8*153]
	add rdx,rbx
	mov qword [rsp+8*155],rbx
	mov rax,  [rsp+8*35]
	mov rbx,rax
	mov qword [rsp+8*153],rdx
	lea rdx,[rbx+r13*8+8H]
	mov rbx, [rdx]
	lea rdx,[rbx+r12*8+8H]
	mov qword [rsp+8*156],rbx
	mov rbx,  [rsp+8*153]
	mov [rdx],rbx
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*157],rdx
	jne L_932
	mov rbx,0
	mov r15,rbx
	jmp L_933
	
L_932:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_933:
	cmp r15, 0
	je L_935
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_935:
	
L_931:
	
L_929:
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r13,r15
	mov rax,  [rsp+8*29]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,2
	add r15,rbx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*75],rax
	jne L_1018
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_1019
	
L_1018:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_1019:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	cmp r15, 0
	jne L_936
	mov rbx,0
	mov r15,rbx
	jmp L_937
	
L_936:
	mov rsi,r11
	mov rdi,r12
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*75],rdx
	jne L_1022
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_1023
	
L_1022:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_1023:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	mov r15,r15
	
L_937:
	cmp r15, 0
	je L_939
	mov rbx,  [rsp+8*35]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	mov rdx,1
	mov r14,rdx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_941
	mov rbx,1
	mov r14,rbx
	mov rdx,1
	mov rax,0
	mov r15,rdx
	imul r15,rax
	add r14,r15
	mov rbx,1
	mov r15,rbx
	imul r15,r10
	add r14,r15
	mov r10,r14
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rdx,  [rsp+8*29]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rax,1
	mov r14,rax
	mov rax,1
	mov rbx,  [rsp+8*17]
	mov r15,rax
	imul r15,rbx
	add r14,r15
	mov rax,1
	mov rdx,0
	mov r15,rax
	imul r15,rdx
	add r14,r15
	mov rdx,  [rsp+8*35]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_942
	mov rbx,0
	mov r15,rbx
	jmp L_943
	
L_942:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_943:
	cmp r15, 0
	je L_945
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_945:
	
L_941:
	
L_939:
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r13,r15
	mov rax,  [rsp+8*29]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,1
	sub r15,rbx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*75],rax
	jne L_1026
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_1027
	
L_1026:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_1027:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	cmp r15, 0
	jne L_946
	mov rbx,0
	mov r15,rbx
	jmp L_947
	
L_946:
	mov rsi,r11
	mov rdi,r12
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*75],rdx
	jne L_1030
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_1031
	
L_1030:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_1031:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	mov r15,r15
	
L_947:
	cmp r15, 0
	je L_949
	mov rbx,  [rsp+8*35]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	mov rdx,1
	mov r14,rdx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_951
	mov rbx,1
	mov r14,rbx
	mov rdx,1
	mov r15,rdx
	imul r15,r10
	add r14,r15
	mov rax,1
	mov rbx,0
	mov r15,rax
	imul r15,rbx
	add r14,r15
	mov r10,r14
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rdx,  [rsp+8*29]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rax,1
	mov r14,rax
	mov rax,1
	mov rbx,0
	mov r15,rax
	imul r15,rbx
	add r14,r15
	mov rbx,1
	mov rax,  [rsp+8*17]
	mov r15,rbx
	imul r15,rax
	add r14,r15
	mov rbx,  [rsp+8*35]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_952
	mov rbx,0
	mov r15,rbx
	jmp L_953
	
L_952:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_953:
	cmp r15, 0
	je L_955
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_955:
	
L_951:
	
L_949:
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r13,r15
	mov rax,  [rsp+8*29]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,1
	add r15,rbx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*75],rax
	jne L_1034
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_1035
	
L_1034:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_1035:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	cmp r15, 0
	jne L_956
	mov rbx,0
	mov r15,rbx
	jmp L_957
	
L_956:
	mov rsi,r11
	mov rdi,r12
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*75],rdx
	jne L_1038
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_1039
	
L_1038:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_1039:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	mov r15,r15
	
L_957:
	cmp r15, 0
	je L_959
	mov rbx,  [rsp+8*35]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	mov rdx,1
	mov r14,rdx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_961
	mov rbx,1
	mov r14,rbx
	mov rdx,1
	mov rax,0
	mov r15,rdx
	imul r15,rax
	add r14,r15
	mov rbx,1
	mov r15,rbx
	imul r15,r10
	add r14,r15
	mov r10,r14
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rdx,  [rsp+8*29]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rax,1
	mov r14,rax
	mov rax,1
	mov rbx,  [rsp+8*17]
	mov r15,rax
	imul r15,rbx
	add r14,r15
	mov rax,1
	mov rdx,0
	mov r15,rax
	imul r15,rdx
	add r14,r15
	mov rdx,  [rsp+8*35]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_962
	mov rbx,0
	mov r15,rbx
	jmp L_963
	
L_962:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_963:
	cmp r15, 0
	je L_965
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_965:
	
L_961:
	
L_959:
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	add r15,rax
	mov r13,r15
	mov rax,  [rsp+8*29]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,1
	sub r15,rbx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*75],rax
	jne L_1042
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_1043
	
L_1042:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_1043:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	cmp r15, 0
	jne L_966
	mov rbx,0
	mov r15,rbx
	jmp L_967
	
L_966:
	mov rsi,r11
	mov rdi,r12
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*75],rdx
	jne L_1046
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_1047
	
L_1046:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_1047:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	mov r15,r15
	
L_967:
	cmp r15, 0
	je L_969
	mov rbx,  [rsp+8*35]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov r14, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_971
	mov rbx,1
	mov r14,rbx
	mov rdx,1
	mov rax,0
	mov r15,rdx
	imul r15,rax
	add r14,r15
	mov rbx,1
	mov r15,rbx
	imul r15,r10
	add r14,r15
	mov r10,r14
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rdx,  [rsp+8*29]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rax,1
	mov r14,rax
	mov rax,1
	mov rbx,  [rsp+8*17]
	mov r15,rax
	imul r15,rbx
	add r14,r15
	mov rax,1
	mov rdx,0
	mov r15,rax
	imul r15,rdx
	add r14,r15
	mov rdx,  [rsp+8*35]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_972
	mov rbx,0
	mov r15,rbx
	jmp L_973
	
L_972:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_973:
	cmp r15, 0
	je L_975
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_975:
	
L_971:
	
L_969:
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	add r15,rax
	mov r13,r15
	mov rax,  [rsp+8*29]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,1
	add r15,rbx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*75],rax
	jne L_1050
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_1051
	
L_1050:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_1051:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	cmp r15, 0
	jne L_976
	mov rbx,0
	mov r15,rbx
	jmp L_977
	
L_976:
	mov rsi,r11
	mov rdi,r12
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*75],rdx
	jne L_1054
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_1055
	
L_1054:
	mov rbx,  [rsp+8*73]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rax
	
L_1055:
	mov rbx,  [rsp+8*75]
	mov r15,rbx
	mov r15,r15
	mov r15,r15
	
L_977:
	cmp r15, 0
	je L_979
	mov rbx,  [rsp+8*35]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	mov rdx,1
	mov r14,rdx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_981
	mov rbx,1
	mov r14,rbx
	mov rdx,1
	mov rax,0
	mov r15,rdx
	imul r15,rax
	add r14,r15
	mov rbx,1
	mov r15,rbx
	imul r15,r10
	add r14,r15
	mov r10,r14
	mov rbx,  [rsp+8*21]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rbx,  [rsp+8*29]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,1
	mov r14,rbx
	mov rbx,1
	mov rdx,  [rsp+8*17]
	mov r15,rbx
	imul r15,rdx
	add r14,r15
	mov rbx,1
	mov rdx,0
	mov r15,rbx
	imul r15,rdx
	add r14,r15
	mov rbx,  [rsp+8*35]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_982
	mov rbx,0
	mov r15,rbx
	jmp L_983
	
L_982:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_983:
	cmp r15, 0
	je L_985
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_985:
	
L_981:
	
L_979:
	mov rbx,  [rsp+8*18]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_987
	jmp L_905
	
L_987:
	mov rbx,1
	mov r14,rbx
	mov rdx,1
	mov rax,  [rsp+8*3]
	mov r15,rdx
	imul r15,rax
	add r14,r15
	mov rbx,1
	mov rdx,0
	mov r15,rbx
	imul r15,rdx
	add r14,r15
	mov rax,r14
	mov qword [rsp+8*3],rax
	jmp L_904
	
L_905:
	mov rbx,  [rsp+8*18]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_988
	mov rbx,  [rsp+8*35]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	mov rdi,r15
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
	jmp L_989
	
L_988:
	mov rbx,t575
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
	
L_989:
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2640
	mov rbx,  [rsp+8*322]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   4624
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

t575:
	 db 12,"no solution!" ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

