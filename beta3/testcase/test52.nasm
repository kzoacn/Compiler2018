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
	push r12
	call global_init
	pop r12
	mov r12 , rax
	mov rbx,106
	mov rdi,rbx
	mov r12,rdi
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
	mov     qword  r11, rax
	mov rbx,r11
	mov rdx,0
	mov r11,rdx
	mov qword [gbl+8*5],rbx
	
L_1404:
	cmp r11,r12
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_1405
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
	mov     qword  r9, rax
	mov rbx,  [gbl+8*5]
	mov r8,rbx
	lea r10,[r8+r11*8+8H]
	mov [r10],r9
	mov rdx,0
	mov r10,rdx
	
L_1406:
	cmp r10,r12
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_1407
	mov rbx,  [gbl+8*5]
	mov r9,rbx
	lea r8,[r9+r11*8+8H]
	mov r9, [r8]
	lea r8,[r9+r10*8+8H]
	mov rdx,0
	mov [r8],rdx
	mov r9,r10
	mov rax,1
	add r10,rax
	jmp L_1406
	
L_1407:
	mov r9,r11
	mov rbx,1
	add r11,rbx
	jmp L_1404
	
L_1405:
	mov rbx,0
	mov r12,rbx
	mov r9,r12
	mov rax,101
	mov rdx,rax
	mov rbx,1
	mov r9,rdx
	sub r9,rbx
	mov rbx,r9
	mov rax,rbx
	mov qword [gbl+8*19],rdx
	mov rdx,0
	mov r11,rdx
	mov qword [gbl+8*21],rbx
	mov qword [gbl+8*22],rax
	
L_1384:
	mov rbx,  [gbl+8*19]
	cmp r11,rbx
	mov r8, 0
	setl r8B
	cmp r8, 0
	je L_1385
	mov rbx,0
	mov r10,rbx
	
L_1387:
	mov rbx,  [gbl+8*19]
	cmp r10,rbx
	mov r8, 0
	setl r8B
	cmp r8, 0
	je L_1388
	mov rbx,1
	mov r8,rbx
	neg r8
	mov rdx,  [gbl+8*5]
	mov r9,rdx
	lea r13,[r9+r11*8+8H]
	mov r9, [r13]
	lea r13,[r9+r10*8+8H]
	mov [r13],r8
	mov r13,r10
	mov rax,1
	add r10,rax
	jmp L_1387
	
L_1388:
	mov r13,r11
	mov rbx,1
	add r11,rbx
	jmp L_1384
	
L_1385:
	
L_1390:
	mov rbx,  [gbl+8*30]
	mov rdx,  [gbl+8*31]
	cmp rbx,rdx
	mov r13, 0
	setle r13B
	cmp r13, 0
	je L_1391
	mov rbx,  [gbl+8*33]
	mov r13,rbx
	mov rdx,  [gbl+8*30]
	lea r11,[r13+rdx*8+8H]
	mov r13, [r11]
	mov r11,r13
	mov rax,  [gbl+8*38]
	mov r13,rax
	lea r10,[r13+rdx*8+8H]
	mov r13, [r10]
	mov r10,r13
	mov rbx,  [gbl+8*5]
	mov r13,rbx
	lea r9,[r13+r11*8+8H]
	mov r13, [r9]
	lea r9,[r13+r10*8+8H]
	mov r13, [r9]
	mov rax,r13
	mov rdx,1
	mov r13,r11
	sub r13,rdx
	mov rdx,2
	mov r8,r10
	sub r8,rdx
	mov rsi,r8
	mov rdi,r13
	mov rdx,rdi
	mov rbx,rsi
	mov qword [gbl+8*46],rax
	mov rax,  [gbl+8*19]
	mov rsi,rax
	mov rdi,rdx
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov qword [rsp+8*51],rbx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*50],rdx
	jne L_1441
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1442
	
L_1441:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1442:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov r9,rbx
	cmp r9, 0
	mov qword [rsp+8*56],rbx
	jne L_1445
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1446
	
L_1445:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdx,  [rsp+8*51]
	mov rdi,rdx
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*54],rax
	jne L_1447
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1448
	
L_1447:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1448:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*59],rax
	
L_1446:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1451
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov rax,1
	mov qword [rsp+8*62],rbx
	mov rbx,rax
	neg rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [rsp+8*62]
	cmp rdx,rbx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rax
	je L_1452
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*33]
	mov rdx,rbx
	mov qword [rsp+8*65],rax
	mov rax,  [gbl+8*31]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rbx],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*68],rax
	mov rax,  [gbl+8*46]
	mov qword [rsp+8*69],rbx
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*70],rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rdx],rbx
	mov rax,  [rsp+8*50]
	mov rbx,  [gbl+8*22]
	cmp rax,rbx
	mov qword [rsp+8*72],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*73],rdx
	jne L_1453
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1454
	
L_1453:
	mov rbx,  [rsp+8*51]
	mov rdx,  [gbl+8*21]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*74],rax
	
L_1454:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1455
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1455:
	
L_1452:
	
L_1451:
	mov rdx,0
	mov rbx,rdx
	mov r13,rbx
	mov rax,1
	mov r13,r11
	sub r13,rax
	mov rax,2
	mov r14,r10
	add r14,rax
	mov rsi,r14
	mov rdi,r13
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*76],rbx
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,rax
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov qword [rsp+8*51],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*54],rdx
	mov qword [rsp+8*50],rax
	jne L_1458
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1459
	
L_1458:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1459:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov r9,rbx
	cmp r9, 0
	mov qword [rsp+8*56],rbx
	jne L_1462
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1463
	
L_1462:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdx,  [rsp+8*51]
	mov rdi,rdx
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*54],rax
	jne L_1464
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1465
	
L_1464:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1465:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*59],rax
	
L_1463:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1468
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov rax,1
	mov qword [rsp+8*62],rbx
	mov rbx,rax
	neg rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [rsp+8*62]
	cmp rdx,rbx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rax
	je L_1469
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*33]
	mov rdx,rbx
	mov qword [rsp+8*65],rax
	mov rax,  [gbl+8*31]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rbx],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*68],rax
	mov rax,  [gbl+8*46]
	mov qword [rsp+8*69],rbx
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*70],rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rdx],rbx
	mov rax,  [rsp+8*50]
	mov rbx,  [gbl+8*22]
	cmp rax,rbx
	mov qword [rsp+8*72],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*73],rdx
	jne L_1470
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1471
	
L_1470:
	mov rbx,  [rsp+8*51]
	mov rdx,  [gbl+8*21]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*74],rax
	
L_1471:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1472
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1472:
	
L_1469:
	
L_1468:
	mov rdx,0
	mov rbx,rdx
	mov r14,rbx
	mov rax,1
	mov r14,r11
	add r14,rax
	mov rax,2
	mov r13,r10
	sub r13,rax
	mov rsi,r13
	mov rdi,r14
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*76],rbx
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,rax
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov qword [rsp+8*51],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*54],rdx
	mov qword [rsp+8*50],rax
	jne L_1475
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1476
	
L_1475:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1476:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov r9,rbx
	cmp r9, 0
	mov qword [rsp+8*56],rbx
	jne L_1479
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1480
	
L_1479:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdx,  [rsp+8*51]
	mov rdi,rdx
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*54],rax
	jne L_1481
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1482
	
L_1481:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1482:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*59],rax
	
L_1480:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1485
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov rax,1
	mov qword [rsp+8*62],rbx
	mov rbx,rax
	neg rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [rsp+8*62]
	cmp rdx,rbx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rax
	je L_1486
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*33]
	mov rdx,rbx
	mov qword [rsp+8*65],rax
	mov rax,  [gbl+8*31]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rbx],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*68],rax
	mov rax,  [gbl+8*46]
	mov qword [rsp+8*69],rbx
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*70],rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rdx],rbx
	mov rax,  [rsp+8*50]
	mov rbx,  [gbl+8*22]
	cmp rax,rbx
	mov qword [rsp+8*72],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*73],rdx
	jne L_1487
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1488
	
L_1487:
	mov rbx,  [rsp+8*51]
	mov rdx,  [gbl+8*21]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*74],rax
	
L_1488:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1489
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1489:
	
L_1486:
	
L_1485:
	mov rdx,0
	mov rbx,rdx
	mov r14,rbx
	mov rax,1
	mov r14,r11
	add r14,rax
	mov rax,2
	mov r13,r10
	add r13,rax
	mov rsi,r13
	mov rdi,r14
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*76],rbx
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,rax
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov qword [rsp+8*51],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*54],rdx
	mov qword [rsp+8*50],rax
	jne L_1492
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1493
	
L_1492:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1493:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov r9,rbx
	cmp r9, 0
	mov qword [rsp+8*56],rbx
	jne L_1496
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1497
	
L_1496:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdx,  [rsp+8*51]
	mov rdi,rdx
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*54],rax
	jne L_1498
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1499
	
L_1498:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1499:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*59],rax
	
L_1497:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1502
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov rax,1
	mov qword [rsp+8*62],rbx
	mov rbx,rax
	neg rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [rsp+8*62]
	cmp rdx,rbx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rax
	je L_1503
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*33]
	mov rdx,rbx
	mov qword [rsp+8*65],rax
	mov rax,  [gbl+8*31]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rbx],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*68],rax
	mov rax,  [gbl+8*46]
	mov qword [rsp+8*69],rbx
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*70],rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rdx],rbx
	mov rax,  [rsp+8*50]
	mov rbx,  [gbl+8*22]
	cmp rax,rbx
	mov qword [rsp+8*72],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*73],rdx
	jne L_1504
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1505
	
L_1504:
	mov rbx,  [rsp+8*51]
	mov rdx,  [gbl+8*21]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*74],rax
	
L_1505:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1506
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1506:
	
L_1503:
	
L_1502:
	mov rdx,0
	mov rbx,rdx
	mov r14,rbx
	mov rax,2
	mov r14,r11
	sub r14,rax
	mov rax,1
	mov r13,r10
	sub r13,rax
	mov rsi,r13
	mov rdi,r14
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*76],rbx
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,rax
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov qword [rsp+8*51],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*54],rdx
	mov qword [rsp+8*50],rax
	jne L_1509
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1510
	
L_1509:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1510:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov r9,rbx
	cmp r9, 0
	mov qword [rsp+8*56],rbx
	jne L_1513
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1514
	
L_1513:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdx,  [rsp+8*51]
	mov rdi,rdx
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*54],rax
	jne L_1515
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1516
	
L_1515:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1516:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*59],rax
	
L_1514:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1519
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov rax,1
	mov qword [rsp+8*62],rbx
	mov rbx,rax
	neg rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [rsp+8*62]
	cmp rdx,rbx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rax
	je L_1520
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*33]
	mov rdx,rbx
	mov qword [rsp+8*65],rax
	mov rax,  [gbl+8*31]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rbx],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*68],rax
	mov rax,  [gbl+8*46]
	mov qword [rsp+8*69],rbx
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*70],rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rdx],rbx
	mov rax,  [rsp+8*50]
	mov rbx,  [gbl+8*22]
	cmp rax,rbx
	mov qword [rsp+8*72],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*73],rdx
	jne L_1521
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1522
	
L_1521:
	mov rbx,  [rsp+8*51]
	mov rdx,  [gbl+8*21]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*74],rax
	
L_1522:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1523
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1523:
	
L_1520:
	
L_1519:
	mov rdx,0
	mov rbx,rdx
	mov r14,rbx
	mov rax,2
	mov r14,r11
	sub r14,rax
	mov rax,1
	mov r13,r10
	add r13,rax
	mov rsi,r13
	mov rdi,r14
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*76],rbx
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,rax
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov qword [rsp+8*51],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*54],rdx
	mov qword [rsp+8*50],rax
	jne L_1526
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1527
	
L_1526:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1527:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov r9,rbx
	cmp r9, 0
	mov qword [rsp+8*56],rbx
	jne L_1530
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1531
	
L_1530:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdx,  [rsp+8*51]
	mov rdi,rdx
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*54],rax
	jne L_1532
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1533
	
L_1532:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1533:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*59],rax
	
L_1531:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1536
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov rax,1
	mov qword [rsp+8*62],rbx
	mov rbx,rax
	neg rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [rsp+8*62]
	cmp rdx,rbx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rax
	je L_1537
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*33]
	mov rdx,rbx
	mov qword [rsp+8*65],rax
	mov rax,  [gbl+8*31]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rbx],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*68],rax
	mov rax,  [gbl+8*46]
	mov qword [rsp+8*69],rbx
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*70],rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rdx],rbx
	mov rax,  [rsp+8*50]
	mov rbx,  [gbl+8*22]
	cmp rax,rbx
	mov qword [rsp+8*72],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*73],rdx
	jne L_1538
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1539
	
L_1538:
	mov rbx,  [rsp+8*51]
	mov rdx,  [gbl+8*21]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*74],rax
	
L_1539:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1540
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1540:
	
L_1537:
	
L_1536:
	mov rdx,0
	mov rbx,rdx
	mov r14,rbx
	mov rax,2
	mov r14,r11
	add r14,rax
	mov rax,1
	mov r13,r10
	sub r13,rax
	mov rsi,r13
	mov rdi,r14
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*76],rbx
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,rax
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov qword [rsp+8*51],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*54],rdx
	mov qword [rsp+8*50],rax
	jne L_1543
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1544
	
L_1543:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1544:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov r9,rbx
	cmp r9, 0
	mov qword [rsp+8*56],rbx
	jne L_1547
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1548
	
L_1547:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdx,  [rsp+8*51]
	mov rdi,rdx
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*54],rax
	jne L_1549
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1550
	
L_1549:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1550:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*59],rax
	
L_1548:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1553
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov rax,1
	mov qword [rsp+8*62],rbx
	mov rbx,rax
	neg rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [rsp+8*62]
	cmp rdx,rbx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rax
	je L_1554
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*33]
	mov rdx,rbx
	mov qword [rsp+8*65],rax
	mov rax,  [gbl+8*31]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rbx],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*68],rax
	mov rax,  [gbl+8*46]
	mov qword [rsp+8*69],rbx
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*70],rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rdx],rbx
	mov rax,  [rsp+8*50]
	mov rbx,  [gbl+8*22]
	cmp rax,rbx
	mov qword [rsp+8*72],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*73],rdx
	jne L_1555
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1556
	
L_1555:
	mov rbx,  [rsp+8*51]
	mov rdx,  [gbl+8*21]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*74],rax
	
L_1556:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1557
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1557:
	
L_1554:
	
L_1553:
	mov rdx,0
	mov rbx,rdx
	mov r14,rbx
	mov rax,2
	mov r14,r11
	add r14,rax
	mov rax,1
	mov r13,r10
	add r13,rax
	mov rsi,r13
	mov rdi,r14
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*76],rbx
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdi,rax
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov qword [rsp+8*51],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*54],rdx
	mov qword [rsp+8*50],rax
	jne L_1560
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1561
	
L_1560:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1561:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov r9,rbx
	cmp r9, 0
	mov qword [rsp+8*56],rbx
	jne L_1564
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1565
	
L_1564:
	mov rbx,  [gbl+8*19]
	mov rsi,rbx
	mov rdx,  [rsp+8*51]
	mov rdi,rdx
	mov r12,rdi
	mov r15,rsi
	cmp r12,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*54],rax
	jne L_1566
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1567
	
L_1566:
	mov rbx,0
	cmp r12,rbx
	mov r8, 0
	setge r8B
	mov rdx,r8
	mov qword [rsp+8*54],rdx
	
L_1567:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*56],rbx
	mov rbx,rax
	mov qword [rsp+8*58],rbx
	mov qword [rsp+8*59],rax
	
L_1565:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1570
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*61],rdx
	mov rdx,1
	mov rax,rdx
	neg rax
	cmp rbx,rax
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*62],rbx
	mov qword [rsp+8*64],rdx
	mov qword [rsp+8*63],rax
	je L_1571
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rax,  [gbl+8*33]
	mov rdx,rax
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rax],rdx
	mov qword [rsp+8*67],rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*69],rbx
	mov rbx,  [gbl+8*46]
	mov qword [rsp+8*68],rax
	mov rax,1
	mov rdx,rbx
	add rdx,rax
	mov rax,  [gbl+8*5]
	mov rbx,rax
	mov qword [rsp+8*70],rdx
	mov rdx,  [rsp+8*50]
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rax],rbx
	mov rbx,  [rsp+8*50]
	mov qword [rsp+8*72],rax
	mov rax,  [gbl+8*22]
	cmp rbx,rax
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*73],rdx
	jne L_1572
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1573
	
L_1572:
	mov rbx,  [rsp+8*51]
	mov rdx,  [gbl+8*21]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*74],rax
	
L_1573:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1574
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1574:
	
L_1571:
	
L_1570:
	mov rdx,0
	mov rbx,rdx
	mov r15,rbx
	mov rax,  [gbl+8*75]
	mov qword [rsp+8*76],rbx
	mov rbx,1
	cmp rax,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1393
	jmp L_1391
	
L_1393:
	mov rbx,  [gbl+8*30]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov qword [gbl+8*30],rbx
	jmp L_1390
	
L_1391:
	mov rbx,  [gbl+8*75]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1394
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [gbl+8*22]
	lea r14,[r15+rdx*8+8H]
	mov r15, [r14]
	mov rax,  [gbl+8*21]
	lea r14,[r15+rax*8+8H]
	mov r15, [r14]
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
	mov     qword r14, rax
	mov rdi,r14
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
	jmp L_1395
	
L_1394:
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
	
L_1395:
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
	mov     qword [gbl+8*109], rax
	mov rdx,  [gbl+8*109]
	mov rbx,rdx
	mov qword [gbl+8*33],rbx
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
	mov     qword [gbl+8*110], rax
	mov rdx,  [gbl+8*110]
	mov rbx,rdx
	mov qword [gbl+8*38],rbx
	mov rbx,  [rsp+8*111]
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

