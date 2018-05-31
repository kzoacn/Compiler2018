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
	sub    rsp, 2344
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
        sub     rdx, 4328
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rbx,102
	mov r12,rbx
	mov rax,0
	mov rdx,rax
	mov rbx,0
	mov r11,rbx
	mov rax,0
	mov rbx,rax
	mov rax,0
	mov r8,rax
	mov rax,1
	mov r15,r12
	sub r15,rax
	mov rax,r15
	mov qword [rsp+8*3],rdx
	mov rdx,1
	mov r15,r12
	sub r15,rdx
	mov rdx,r15
	mov qword [rsp+8*5],rbx
	mov rbx,0
	mov r10,rbx
	mov rbx,0
	mov r9,rbx
	mov qword [rsp+8*8],rax
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*10],rdx
	mov rdx,0
	mov rax,rdx
	mov r15,r12
	imul r15,r12
	mov qword [rsp+8*13],rbx
	mov qword [rsp+8*14],rax
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
	mov r14,rdx
	mov qword [rsp+8*17],rbx
	
L_920:
	mov r15,r12
	imul r15,r12
	cmp r14,r15
	mov r15, 0
	setl r15B
	mov rbx,  [rsp+8*20]
	add rbx,rbx
	cmp r15, 0
	mov qword [rsp+8*20],rbx
	je L_921
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r14
	mov rax,1
	add r14,rax
	jmp L_920
	
L_921:
	mov r15,r12
	imul r15,r12
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
	mov r13,r15
	mov rbx,0
	mov r14,rbx
	
L_923:
	mov r15,r12
	imul r15,r12
	cmp r14,r15
	mov r15, 0
	setl r15B
	mov rbx,  [rsp+8*20]
	add rbx,rbx
	cmp r15, 0
	mov qword [rsp+8*20],rbx
	je L_924
	mov r15,r13
	lea r15,[r15+r14*8+8H]
	mov rbx,0
	mov [r15],rbx
	mov r15,r14
	mov rdx,1
	add r14,rdx
	jmp L_923
	
L_924:
	mov     rdi,  r12
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
	mov r14,rdx
	mov qword [rsp+8*32],rbx
	
L_926:
	cmp r14,r12
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_927
	mov     rdi,  r12
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [rsp+8*34], rax
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov rdx,  [rsp+8*34]
	mov [r15],rdx
	mov rax,0
	mov r15,rax
	
L_929:
	cmp r15,r12
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*38],rbx
	je L_930
	mov rbx,1
	mov rdx,rbx
	neg rdx
	mov rbx,  [rsp+8*32]
	mov rax,rbx
	mov qword [rsp+8*39],rdx
	lea rdx,[rax+r14*8+8H]
	mov rax, [rdx]
	lea rdx,[rax+r15*8+8H]
	mov qword [rsp+8*40],rax
	mov rax,  [rsp+8*39]
	mov [rdx],rax
	mov qword [rsp+8*41],rdx
	mov rdx,r15
	mov qword [rsp+8*42],rdx
	mov rdx,1
	add r15,rdx
	jmp L_929
	
L_930:
	mov r15,r14
	mov rbx,1
	add r14,rbx
	jmp L_926
	
L_927:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,0
	lea r15,[r15+rdx*8+8H]
	mov rax,  [rsp+8*5]
	mov [r15],rax
	mov rdx,r13
	mov rbx,0
	lea r15,[rdx+rbx*8+8H]
	mov [r15],r8
	mov qword [rsp+8*46],rdx
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	lea r15,[rbx+rax*8+8H]
	mov rbx, [r15]
	lea r15,[rbx+r8*8+8H]
	mov qword [rsp+8*48],rbx
	mov rbx,0
	mov [r15],rbx
	
L_932:
	mov rbx,  [rsp+8*3]
	cmp rbx,r11
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_933
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r14, [r15]
	mov r15,r13
	lea r15,[r15+rdx*8+8H]
	mov rax, [r15]
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	lea r15,[r15+rax*8+8H]
	mov r15, [r15]
	mov qword [rsp+8*56],rax
	mov rax,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	mov rbx,  [rsp+8*3]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov qword [rsp+8*13],rax
	mov rax,1
	sub r15,rax
	mov r10,r15
	mov rax,r13
	lea rdx,[rax+rbx*8+8H]
	mov qword [rsp+8*64],rax
	mov rax, [rdx]
	mov qword [rsp+8*65],rdx
	mov rdx,2
	mov rbx,rax
	sub rbx,rdx
	mov r9,rbx
	mov rsi,r12
	mov rdi,r10
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*66],rax
	jne L_1022
	mov rbx,0
	mov r15,rbx
	jmp L_1023
	
L_1022:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1023:
	mov r15,r15
	mov rbx,r15
	cmp rbx, 0
	mov qword [rsp+8*75],rbx
	jne L_934
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*76],rbx
	jmp L_935
	
L_934:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_1026
	mov rbx,0
	mov r15,rbx
	jmp L_1027
	
L_1026:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1027:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*77],rbx
	mov qword [rsp+8*76],rdx
	
L_935:
	mov rbx,  [rsp+8*76]
	cmp rbx, 0
	je L_937
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	lea rax,[rbx+r10*8+8H]
	mov rbx, [rax]
	lea rax,[rbx+r9*8+8H]
	mov qword [rsp+8*78],rbx
	mov rbx, [rax]
	mov qword [rsp+8*79],rax
	mov rax,1
	mov rdx,rax
	neg rdx
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*80],rbx
	mov qword [rsp+8*81],rdx
	mov qword [rsp+8*82],rax
	je L_939
	mov rbx,1
	mov rdx,r11
	add rdx,rbx
	mov r11,rdx
	mov rbx,  [rsp+8*17]
	mov rax,rbx
	lea rdx,[rax+r11*8+8H]
	mov [rdx],r10
	mov qword [rsp+8*85],rdx
	mov rdx,r13
	mov qword [rsp+8*84],rax
	lea rax,[rdx+r11*8+8H]
	mov [rax],r9
	mov qword [rsp+8*86],rdx
	mov rdx,  [rsp+8*13]
	mov qword [rsp+8*87],rax
	mov rax,1
	mov rbx,rdx
	add rbx,rax
	mov qword [rsp+8*88],rbx
	mov rbx,  [rsp+8*32]
	mov rax,rbx
	lea rdx,[rax+r10*8+8H]
	mov rax, [rdx]
	lea rdx,[rax+r9*8+8H]
	mov qword [rsp+8*89],rax
	mov rax,  [rsp+8*88]
	mov [rdx],rax
	mov qword [rsp+8*90],rdx
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*91],rax
	jne L_940
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*91],rbx
	jmp L_941
	
L_940:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*92],rdx
	mov qword [rsp+8*91],rax
	
L_941:
	mov rbx,  [rsp+8*91]
	cmp rbx, 0
	je L_943
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_943:
	
L_939:
	
L_937:
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*3]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*93],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*94],rdx
	mov rdx,1
	mov rax,rbx
	sub rax,rdx
	mov r10,rax
	mov qword [rsp+8*95],rbx
	mov rbx,r13
	mov rdx,  [rsp+8*3]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*97],rbx
	mov rbx, [rax]
	mov qword [rsp+8*98],rax
	mov rax,2
	mov rdx,rbx
	add rdx,rax
	mov r9,rdx
	mov rsi,r12
	mov rdi,r10
	mov qword [rsp+8*99],rbx
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_1030
	mov rbx,0
	mov r15,rbx
	jmp L_1031
	
L_1030:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1031:
	mov r15,r15
	mov rbx,r15
	cmp rbx, 0
	mov qword [rsp+8*101],rbx
	jne L_944
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*102],rbx
	jmp L_945
	
L_944:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_1034
	mov rbx,0
	mov r15,rbx
	jmp L_1035
	
L_1034:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1035:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*103],rbx
	mov qword [rsp+8*102],rdx
	
L_945:
	mov rbx,  [rsp+8*102]
	cmp rbx, 0
	je L_947
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	mov rdx,1
	mov r14,rdx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_949
	mov rbx,1
	mov r15,r11
	add r15,rbx
	mov r11,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r11*8+8H]
	mov [r15],r10
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov [r15],r9
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov [r15],r14
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_950
	mov rbx,0
	mov r15,rbx
	jmp L_951
	
L_950:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_951:
	cmp r15, 0
	je L_953
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_953:
	
L_949:
	
L_947:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r10,r15
	mov r15,r13
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r9,r15
	mov rsi,r12
	mov rdi,r10
	mov rax,rdi
	mov rbx,rsi
	cmp rax,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*70],rax
	jne L_1038
	mov rbx,0
	mov r15,rbx
	jmp L_1039
	
L_1038:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1039:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_954
	mov rbx,0
	mov r15,rbx
	jmp L_955
	
L_954:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_1042
	mov rbx,0
	mov r15,rbx
	jmp L_1043
	
L_1042:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1043:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_955:
	cmp r15, 0
	je L_957
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov rdx, [r15]
	mov rax,1
	mov r15,rax
	neg r15
	cmp rdx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*132],rdx
	je L_959
	mov rbx,1
	mov r15,r11
	add r15,rbx
	mov r11,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r11*8+8H]
	mov [r15],r10
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov [r15],r9
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov [r15],rdx
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_960
	mov rbx,0
	mov r15,rbx
	jmp L_961
	
L_960:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_961:
	cmp r15, 0
	je L_963
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_963:
	
L_959:
	
L_957:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r10,r15
	mov rax,r13
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*149],rax
	mov rax, [rbx]
	mov qword [rsp+8*150],rbx
	mov rbx,2
	mov rdx,rax
	add rdx,rbx
	mov r9,rdx
	mov rsi,r12
	mov rdi,r10
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*151],rax
	jne L_1046
	mov rbx,0
	mov r15,rbx
	jmp L_1047
	
L_1046:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1047:
	mov r15,r15
	mov rbx,r15
	cmp rbx, 0
	mov qword [rsp+8*153],rbx
	jne L_964
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*154],rbx
	jmp L_965
	
L_964:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_1050
	mov rbx,0
	mov r15,rbx
	jmp L_1051
	
L_1050:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1051:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*155],rbx
	mov qword [rsp+8*154],rdx
	
L_965:
	mov rbx,  [rsp+8*154]
	cmp rbx, 0
	je L_967
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	lea rax,[rbx+r10*8+8H]
	mov rbx, [rax]
	lea rax,[rbx+r9*8+8H]
	mov qword [rsp+8*156],rbx
	mov rbx, [rax]
	mov qword [rsp+8*157],rax
	mov rax,1
	mov rdx,rax
	neg rdx
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*158],rbx
	mov qword [rsp+8*159],rdx
	mov qword [rsp+8*160],rax
	je L_969
	mov rbx,1
	mov rdx,r11
	add rdx,rbx
	mov r11,rdx
	mov rbx,  [rsp+8*17]
	mov rax,rbx
	lea rdx,[rax+r11*8+8H]
	mov [rdx],r10
	mov qword [rsp+8*163],rdx
	mov rdx,r13
	mov qword [rsp+8*162],rax
	lea rax,[rdx+r11*8+8H]
	mov [rax],r9
	mov qword [rsp+8*164],rdx
	mov rdx,  [rsp+8*13]
	mov qword [rsp+8*165],rax
	mov rax,1
	mov rbx,rdx
	add rbx,rax
	mov qword [rsp+8*166],rbx
	mov rbx,  [rsp+8*32]
	mov rax,rbx
	lea rdx,[rax+r10*8+8H]
	mov rax, [rdx]
	lea rdx,[rax+r9*8+8H]
	mov qword [rsp+8*167],rax
	mov rax,  [rsp+8*166]
	mov [rdx],rax
	mov qword [rsp+8*168],rdx
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*169],rax
	jne L_970
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*169],rbx
	jmp L_971
	
L_970:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov r15, 0
	sete r15B
	mov rdx,r15
	mov qword [rsp+8*169],rdx
	
L_971:
	mov rbx,  [rsp+8*169]
	cmp rbx, 0
	je L_973
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_973:
	
L_969:
	
L_967:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r10,r15
	mov rax,r13
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*175],rax
	mov rax, [rbx]
	mov qword [rsp+8*176],rbx
	mov rbx,1
	mov rdx,rax
	sub rdx,rbx
	mov r9,rdx
	mov rsi,r12
	mov rdi,r10
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*177],rax
	jne L_1054
	mov rbx,0
	mov r15,rbx
	jmp L_1055
	
L_1054:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1055:
	mov r15,r15
	mov rbx,r15
	cmp rbx, 0
	mov qword [rsp+8*179],rbx
	jne L_974
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*180],rbx
	jmp L_975
	
L_974:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_1058
	mov rbx,0
	mov r15,rbx
	jmp L_1059
	
L_1058:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1059:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*181],rbx
	mov qword [rsp+8*180],rdx
	
L_975:
	mov rbx,  [rsp+8*180]
	cmp rbx, 0
	je L_977
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea rdx,[r15+r10*8+8H]
	mov r15, [rdx]
	lea rdx,[r15+r9*8+8H]
	mov r15, [rdx]
	mov rax,1
	mov r14,rax
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*183],rdx
	je L_979
	mov rbx,1
	mov r15,r11
	add r15,rbx
	mov r11,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r11*8+8H]
	mov [r15],r10
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov [r15],r9
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov [r15],r14
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_980
	mov rbx,0
	mov r15,rbx
	jmp L_981
	
L_980:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_981:
	cmp r15, 0
	je L_983
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_983:
	
L_979:
	
L_977:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r10,r15
	mov r15,r13
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r9,r15
	mov rsi,r12
	mov rdi,r10
	mov rax,rdi
	mov rbx,rsi
	cmp rax,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*70],rax
	jne L_1062
	mov rbx,0
	mov r15,rbx
	jmp L_1063
	
L_1062:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1063:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_984
	mov rbx,0
	mov r15,rbx
	jmp L_985
	
L_984:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_1066
	mov rbx,0
	mov r15,rbx
	jmp L_1067
	
L_1066:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1067:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_985:
	cmp r15, 0
	je L_987
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov r14, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_989
	mov rbx,1
	mov r15,r11
	add r15,rbx
	mov r11,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r11*8+8H]
	mov [r15],r10
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov [r15],r9
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov [r15],rdx
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_990
	mov rbx,0
	mov r15,rbx
	jmp L_991
	
L_990:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_991:
	cmp r15, 0
	je L_993
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_993:
	
L_989:
	
L_987:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	add r15,rax
	mov r10,r15
	mov r15,r13
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	sub r15,rax
	mov r9,r15
	mov rsi,r12
	mov rdi,r10
	mov rax,rdi
	mov rbx,rsi
	cmp rax,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*70],rax
	jne L_1070
	mov rbx,0
	mov r15,rbx
	jmp L_1071
	
L_1070:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1071:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_994
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*232],rbx
	jmp L_995
	
L_994:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_1074
	mov rbx,0
	mov r15,rbx
	jmp L_1075
	
L_1074:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1075:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*233],rbx
	mov qword [rsp+8*232],rdx
	
L_995:
	mov rbx,  [rsp+8*232]
	cmp rbx, 0
	je L_997
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	lea rax,[rbx+r10*8+8H]
	mov rbx, [rax]
	lea rax,[rbx+r9*8+8H]
	mov qword [rsp+8*234],rbx
	mov rbx, [rax]
	mov qword [rsp+8*235],rax
	mov rax,1
	mov rdx,rax
	neg rdx
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*236],rbx
	mov qword [rsp+8*237],rdx
	mov qword [rsp+8*238],rax
	je L_999
	mov rbx,1
	mov rdx,r11
	add rdx,rbx
	mov r11,rdx
	mov rax,  [rsp+8*17]
	mov r15,rax
	lea rbx,[r15+r11*8+8H]
	mov [rbx],r10
	mov qword [rsp+8*241],rbx
	mov rbx,r13
	lea rdx,[rbx+r11*8+8H]
	mov [rdx],r9
	mov qword [rsp+8*242],rbx
	mov rbx,  [rsp+8*13]
	mov qword [rsp+8*243],rdx
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,  [rsp+8*32]
	mov rdx,rbx
	mov qword [rsp+8*244],rax
	lea rax,[rdx+r10*8+8H]
	mov rdx, [rax]
	lea rax,[rdx+r9*8+8H]
	mov qword [rsp+8*245],rdx
	mov rdx,  [rsp+8*244]
	mov [rax],rdx
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov qword [rsp+8*246],rax
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*247],rax
	jne L_1000
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*247],rbx
	jmp L_1001
	
L_1000:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov r15, 0
	sete r15B
	mov rdx,r15
	mov qword [rsp+8*247],rdx
	
L_1001:
	mov rbx,  [rsp+8*247]
	cmp rbx, 0
	je L_1003
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1003:
	
L_999:
	
L_997:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	add r15,rax
	mov r10,r15
	mov rax,r13
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*253],rax
	mov rax, [rbx]
	mov qword [rsp+8*254],rbx
	mov rbx,1
	mov r15,rax
	add r15,rbx
	mov r9,r15
	mov rsi,r12
	mov rdi,r10
	mov rbx,rdi
	mov qword [rsp+8*255],rax
	mov rax,rsi
	cmp rbx,rax
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rax
	jne L_1078
	mov rbx,0
	mov r15,rbx
	jmp L_1079
	
L_1078:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1079:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1004
	mov rbx,0
	mov r15,rbx
	jmp L_1005
	
L_1004:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_1082
	mov rbx,0
	mov r15,rbx
	jmp L_1083
	
L_1082:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1083:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1005:
	cmp r15, 0
	je L_1007
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov r14, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1009
	mov rbx,1
	mov r15,r11
	add r15,rbx
	mov r11,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r11*8+8H]
	mov [r15],r10
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov [r15],r9
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov [r15],r14
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1010
	mov rbx,0
	mov r15,rbx
	jmp L_1011
	
L_1010:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1011:
	cmp r15, 0
	je L_1013
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1013:
	
L_1009:
	
L_1007:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1015
	jmp L_933
	
L_1015:
	mov rbx,  [rsp+8*3]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov qword [rsp+8*3],rbx
	jmp L_932
	
L_933:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1016
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	mov rdx,  [rsp+8*8]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*10]
	lea r15,[r15+rax*8+8H]
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
	jmp L_1017
	
L_1016:
	mov rbx,t442
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
	
L_1017:
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2344
	mov rbx,  [rsp+8*285]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   4328
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

t442:
	 db 12,"no solution!" ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

