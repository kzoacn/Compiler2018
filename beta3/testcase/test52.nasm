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
	sub    rsp, 952
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
        sub     rdx, 2936
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	push r8
	call global_init
	pop r8
	pop r15
	mov r15 , rax
	mov rbx,106
	mov rdi,rbx
	mov r13,rdi
	mov     rdi,  r13
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
	mov r12,rdx
	mov qword [gbl+8*2],rbx
	
L_1487:
	cmp r12,r13
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1488
	mov     rdi,  r13
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
	mov rbx,  [gbl+8*2]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov rdx,0
	mov r14,rdx
	
L_1489:
	cmp r14,r13
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1490
	mov rbx,  [gbl+8*2]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r14*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r14
	mov rax,1
	add r14,rax
	jmp L_1489
	
L_1490:
	mov r15,r12
	mov rbx,1
	add r12,rbx
	jmp L_1487
	
L_1488:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,101
	mov r9,rdx
	mov rax,1
	mov r15,r9
	sub r15,rax
	mov r11,r15
	mov r10,r11
	mov rbx,0
	mov r12,rbx
	
L_1467:
	cmp r12,r9
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1468
	mov rbx,0
	mov r14,rbx
	
L_1470:
	cmp r14,r9
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1471
	mov rbx,1
	mov r13,rbx
	neg r13
	mov rdx,  [gbl+8*2]
	mov r15,rdx
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r14*8+8H]
	mov [r15],r13
	mov r15,r14
	mov rax,1
	add r14,rax
	jmp L_1470
	
L_1471:
	mov r15,r12
	mov rbx,1
	add r12,rbx
	jmp L_1467
	
L_1468:
	
L_1473:
	mov rbx,  [gbl+8*3]
	cmp rbx,r8
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1474
	mov rbx,  [gbl+8*4]
	mov r15,rbx
	mov rdx,  [gbl+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov r13,r15
	mov rax,  [gbl+8*5]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov r12,r15
	mov rbx,  [gbl+8*2]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	mov rax,r15
	mov rdx,1
	mov r14,r13
	sub r14,rdx
	mov rdx,2
	mov r15,r12
	sub r15,rdx
	mov rsi,r15
	mov rdi,r14
	mov rdx,rdi
	mov rbx,rsi
	mov rsi,r9
	mov rdi,rdx
	mov qword [gbl+8*6],rax
	mov rax,rdi
	mov r15,rsi
	cmp rax,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*9],rbx
	mov qword [rsp+8*8],rdx
	mov qword [rsp+8*10],rax
	jne L_1524
	mov rbx,0
	mov r15,rbx
	jmp L_1525
	
L_1524:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1525:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1528
	mov rbx,0
	mov r15,rbx
	jmp L_1529
	
L_1528:
	mov rsi,r9
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*10],rdx
	jne L_1530
	mov rbx,0
	mov r15,rbx
	jmp L_1531
	
L_1530:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1531:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1529:
	cmp r15, 0
	je L_1534
	mov rbx,  [gbl+8*2]
	mov r15,rbx
	mov rdx,  [rsp+8*8]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*9]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*11],rbx
	je L_1535
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*4]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*8]
	mov [r15],rax
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*9]
	mov [r15],rdx
	mov rax,  [gbl+8*6]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*2]
	mov r15,rdx
	mov rbx,  [rsp+8*8]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*9]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1536
	mov rbx,0
	mov r15,rbx
	jmp L_1537
	
L_1536:
	mov rbx,  [rsp+8*9]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1537:
	cmp r15, 0
	je L_1538
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*12],rbx
	
L_1538:
	
L_1535:
	
L_1534:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,1
	mov r15,r13
	sub r15,rdx
	mov rax,2
	mov r14,r12
	add r14,rax
	mov rsi,r14
	mov rdi,r15
	mov rdx,rdi
	mov rax,rsi
	mov rsi,r9
	mov rdi,rdx
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*10],rbx
	mov qword [rsp+8*8],rdx
	mov qword [rsp+8*9],rax
	jne L_1541
	mov rbx,0
	mov r15,rbx
	jmp L_1542
	
L_1541:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1542:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1545
	mov rbx,0
	mov r15,rbx
	jmp L_1546
	
L_1545:
	mov rsi,r9
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*10],rdx
	jne L_1547
	mov rbx,0
	mov r15,rbx
	jmp L_1548
	
L_1547:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1548:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1546:
	cmp r15, 0
	je L_1551
	mov rbx,  [gbl+8*2]
	mov r15,rbx
	mov rdx,  [rsp+8*8]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*9]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*11],rbx
	je L_1552
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*4]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*8]
	mov [r15],rax
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*9]
	mov [r15],rdx
	mov rax,  [gbl+8*6]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*2]
	mov r15,rdx
	mov rbx,  [rsp+8*8]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*9]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1553
	mov rbx,0
	mov r15,rbx
	jmp L_1554
	
L_1553:
	mov rbx,  [rsp+8*9]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1554:
	cmp r15, 0
	je L_1555
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*12],rbx
	
L_1555:
	
L_1552:
	
L_1551:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,1
	mov r15,r13
	add r15,rdx
	mov rax,2
	mov r14,r12
	sub r14,rax
	mov rsi,r14
	mov rdi,r15
	mov rdx,rdi
	mov rax,rsi
	mov rsi,r9
	mov rdi,rdx
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*10],rbx
	mov qword [rsp+8*8],rdx
	mov qword [rsp+8*9],rax
	jne L_1558
	mov rbx,0
	mov r15,rbx
	jmp L_1559
	
L_1558:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1559:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1562
	mov rbx,0
	mov r15,rbx
	jmp L_1563
	
L_1562:
	mov rsi,r9
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*10],rdx
	jne L_1564
	mov rbx,0
	mov r15,rbx
	jmp L_1565
	
L_1564:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1565:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1563:
	cmp r15, 0
	je L_1568
	mov rbx,  [gbl+8*2]
	mov r15,rbx
	mov rdx,  [rsp+8*8]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*9]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*11],rbx
	je L_1569
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*4]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*8]
	mov [r15],rax
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*9]
	mov [r15],rdx
	mov rax,  [gbl+8*6]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*2]
	mov r15,rdx
	mov rbx,  [rsp+8*8]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*9]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1570
	mov rbx,0
	mov r15,rbx
	jmp L_1571
	
L_1570:
	mov rbx,  [rsp+8*9]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1571:
	cmp r15, 0
	je L_1572
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*12],rbx
	
L_1572:
	
L_1569:
	
L_1568:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,1
	mov r15,r13
	add r15,rdx
	mov rax,2
	mov rdx,r12
	add rdx,rax
	mov rsi,rdx
	mov rdi,r15
	mov rdx,rdi
	mov rax,rsi
	mov rsi,r9
	mov rdi,rdx
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*10],rbx
	mov qword [rsp+8*8],rdx
	mov qword [rsp+8*9],rax
	jne L_1575
	mov rbx,0
	mov r15,rbx
	jmp L_1576
	
L_1575:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1576:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1579
	mov rbx,0
	mov r15,rbx
	jmp L_1580
	
L_1579:
	mov rsi,r9
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*10],rdx
	jne L_1581
	mov rbx,0
	mov r15,rbx
	jmp L_1582
	
L_1581:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1582:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1580:
	cmp r15, 0
	je L_1585
	mov rbx,  [gbl+8*2]
	mov r15,rbx
	mov rdx,  [rsp+8*8]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*9]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*11],rbx
	je L_1586
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*4]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*8]
	mov [r15],rax
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*9]
	mov [r15],rdx
	mov rax,  [gbl+8*6]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*2]
	mov r15,rdx
	mov rbx,  [rsp+8*8]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*9]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1587
	mov rbx,0
	mov r15,rbx
	jmp L_1588
	
L_1587:
	mov rbx,  [rsp+8*9]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1588:
	cmp r15, 0
	je L_1589
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*12],rbx
	
L_1589:
	
L_1586:
	
L_1585:
	mov rbx,0
	mov r15,rbx
	mov rdx,r15
	mov rax,2
	mov qword [rsp+8*14],rdx
	mov rdx,r13
	sub rdx,rax
	mov rax,1
	mov rbx,r12
	sub rbx,rax
	mov rsi,rbx
	mov rdi,rdx
	mov rbx,rdi
	mov rdx,rsi
	mov rsi,r9
	mov rdi,rbx
	mov rax,rdi
	mov r15,rsi
	cmp rax,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*8],rbx
	mov qword [rsp+8*9],rdx
	mov qword [rsp+8*10],rax
	jne L_1592
	mov rbx,0
	mov r15,rbx
	jmp L_1593
	
L_1592:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1593:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1596
	mov rbx,0
	mov r15,rbx
	jmp L_1597
	
L_1596:
	mov rsi,r9
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*10],rdx
	jne L_1598
	mov rbx,0
	mov r15,rbx
	jmp L_1599
	
L_1598:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1599:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1597:
	cmp r15, 0
	je L_1602
	mov rbx,  [gbl+8*2]
	mov r15,rbx
	mov rdx,  [rsp+8*8]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*9]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*11],rbx
	je L_1603
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*4]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*8]
	mov [r15],rax
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*9]
	mov [r15],rdx
	mov rax,  [gbl+8*6]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*2]
	mov r15,rdx
	mov rbx,  [rsp+8*8]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*9]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1604
	mov rbx,0
	mov r15,rbx
	jmp L_1605
	
L_1604:
	mov rbx,  [rsp+8*9]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1605:
	cmp r15, 0
	je L_1606
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*12],rbx
	
L_1606:
	
L_1603:
	
L_1602:
	mov rbx,0
	mov r15,rbx
	mov rdx,r15
	mov rax,2
	mov qword [rsp+8*17],rdx
	mov rdx,r13
	sub rdx,rax
	mov rax,1
	mov r15,r12
	add r15,rax
	mov rsi,r15
	mov rdi,rdx
	mov rdx,rdi
	mov rax,rsi
	mov rsi,r9
	mov rdi,rdx
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*10],rbx
	mov qword [rsp+8*8],rdx
	mov qword [rsp+8*9],rax
	jne L_1609
	mov rbx,0
	mov r15,rbx
	jmp L_1610
	
L_1609:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1610:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1613
	mov rbx,0
	mov r15,rbx
	jmp L_1614
	
L_1613:
	mov rsi,r9
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*10],rdx
	jne L_1615
	mov rbx,0
	mov r15,rbx
	jmp L_1616
	
L_1615:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1616:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1614:
	cmp r15, 0
	je L_1619
	mov rbx,  [gbl+8*2]
	mov r15,rbx
	mov rdx,  [rsp+8*8]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*9]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*11],rbx
	je L_1620
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*4]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*8]
	mov [r15],rax
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*9]
	mov [r15],rdx
	mov rax,  [gbl+8*6]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*2]
	mov r15,rdx
	mov rbx,  [rsp+8*8]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*9]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1621
	mov rbx,0
	mov r15,rbx
	jmp L_1622
	
L_1621:
	mov rbx,  [rsp+8*9]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1622:
	cmp r15, 0
	je L_1623
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*12],rbx
	
L_1623:
	
L_1620:
	
L_1619:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,2
	mov r14,r13
	add r14,rdx
	mov rax,1
	mov r15,r12
	sub r15,rax
	mov rsi,r15
	mov rdi,r14
	mov rdx,rdi
	mov rax,rsi
	mov rsi,r9
	mov rdi,rdx
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*10],rbx
	mov qword [rsp+8*8],rdx
	mov qword [rsp+8*9],rax
	jne L_1626
	mov rbx,0
	mov r15,rbx
	jmp L_1627
	
L_1626:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1627:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1630
	mov rbx,0
	mov r15,rbx
	jmp L_1631
	
L_1630:
	mov rsi,r9
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*10],rdx
	jne L_1632
	mov rbx,0
	mov r15,rbx
	jmp L_1633
	
L_1632:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1633:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1631:
	cmp r15, 0
	je L_1636
	mov rbx,  [gbl+8*2]
	mov r15,rbx
	mov rdx,  [rsp+8*8]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*9]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*11],rbx
	je L_1637
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*4]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*8]
	mov [r15],rax
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*9]
	mov [r15],rdx
	mov rax,  [gbl+8*6]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*2]
	mov r15,rdx
	mov rbx,  [rsp+8*8]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*9]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1638
	mov rbx,0
	mov r15,rbx
	jmp L_1639
	
L_1638:
	mov rbx,  [rsp+8*9]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1639:
	cmp r15, 0
	je L_1640
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*12],rbx
	
L_1640:
	
L_1637:
	
L_1636:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,2
	mov r14,r13
	add r14,rdx
	mov rax,1
	mov r15,r12
	add r15,rax
	mov rsi,r15
	mov rdi,r14
	mov rdx,rdi
	mov rax,rsi
	mov rsi,r9
	mov rdi,rdx
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*10],rbx
	mov qword [rsp+8*8],rdx
	mov qword [rsp+8*9],rax
	jne L_1643
	mov rbx,0
	mov r15,rbx
	jmp L_1644
	
L_1643:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1644:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1647
	mov rbx,0
	mov r15,rbx
	jmp L_1648
	
L_1647:
	mov rsi,r9
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*10],rdx
	jne L_1649
	mov rbx,0
	mov r15,rbx
	jmp L_1650
	
L_1649:
	mov rbx,  [rsp+8*10]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1650:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1648:
	cmp r15, 0
	je L_1653
	mov rbx,  [gbl+8*2]
	mov r15,rbx
	mov rdx,  [rsp+8*8]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*9]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*11],rbx
	je L_1654
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*4]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*8]
	mov [r15],rax
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*9]
	mov [r15],rdx
	mov rax,  [gbl+8*6]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rbx,  [gbl+8*2]
	mov r15,rbx
	mov rax,  [rsp+8*8]
	lea r15,[r15+rax*8+8H]
	mov r15, [r15]
	lea r15,[r15+rdx*8+8H]
	mov [r15],r14
	cmp rax,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1655
	mov rbx,0
	mov r15,rbx
	jmp L_1656
	
L_1655:
	mov rbx,  [rsp+8*9]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1656:
	cmp r15, 0
	je L_1657
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*12],rbx
	
L_1657:
	
L_1654:
	
L_1653:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,  [gbl+8*12]
	mov rax,1
	cmp rdx,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1476
	jmp L_1474
	
L_1476:
	mov rbx,  [gbl+8*3]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov qword [gbl+8*3],rbx
	jmp L_1473
	
L_1474:
	mov rbx,  [gbl+8*12]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1477
	mov rbx,  [gbl+8*2]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
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
	jmp L_1478
	
L_1477:
	mov rbx,t211
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
	
L_1478:
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 952
	mov     rdi, 12000
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*19], rax
	mov rdx,  [gbl+8*19]
	mov rbx,rdx
	mov qword [gbl+8*4],rbx
	mov     rdi, 12000
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*20], rax
	mov rdx,  [gbl+8*20]
	mov rbx,rdx
	mov qword [gbl+8*5],rbx
	mov rbx,  [rsp+8*21]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   2936
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

t211:
	 db 12,"no solution!" ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

