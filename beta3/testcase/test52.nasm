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
	sub    rsp, 2728
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
        sub     rdx, 4712
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	push r10
	call global_init
	pop r10
	pop r15
	mov r15 , rax
	mov rbx,106
	mov rdi,rbx
	mov r14,rdi
	mov     rdi,  r14
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
	mov qword [gbl+8*5],rbx
	
L_1367:
	cmp r12,r14
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1368
	mov     rdi,  r14
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r13, rax
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov [r15],r13
	mov rdx,0
	mov r13,rdx
	
L_1369:
	cmp r13,r14
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1370
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r13
	mov rax,1
	add r13,rax
	jmp L_1369
	
L_1370:
	mov r15,r12
	mov rbx,1
	add r12,rbx
	jmp L_1367
	
L_1368:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,101
	mov r11,rdx
	mov rax,1
	mov r15,r11
	sub r15,rax
	mov rbx,r15
	mov rdx,rbx
	mov rax,0
	mov r12,rax
	mov qword [gbl+8*21],rbx
	mov qword [gbl+8*22],rdx
	
L_1347:
	cmp r12,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1348
	mov rbx,0
	mov r13,rbx
	
L_1350:
	cmp r13,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1351
	mov rbx,1
	mov rdx,rbx
	neg rdx
	mov rax,  [gbl+8*5]
	mov r15,rax
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov [r15],rdx
	mov r15,r13
	mov rbx,1
	add r13,rbx
	mov qword [rsp+8*25],rdx
	jmp L_1350
	
L_1351:
	mov r15,r12
	mov rbx,1
	add r12,rbx
	jmp L_1347
	
L_1348:
	
L_1353:
	mov rbx,  [gbl+8*30]
	cmp rbx,r10
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1354
	mov rbx,  [gbl+8*33]
	mov r15,rbx
	mov rdx,  [gbl+8*30]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov r9,r15
	mov rax,  [gbl+8*38]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov r8,r15
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	lea r15,[r15+r8*8+8H]
	mov r15, [r15]
	mov rax,r15
	mov rdx,1
	mov rbx,r9
	sub rbx,rdx
	mov rdx,2
	mov qword [gbl+8*46],rax
	mov rax,r8
	sub rax,rdx
	mov rsi,rax
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	mov rsi,r11
	mov rdi,r14
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*52],rbx
	mov qword [rsp+8*53],rdx
	mov qword [rsp+8*54],rax
	jne L_1404
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1405
	
L_1404:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1405:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*57],rax
	jne L_1408
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1409
	
L_1408:
	mov rsi,r11
	mov rdi,r15
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*59],rbx
	mov qword [rsp+8*60],rdx
	mov qword [rsp+8*61],rax
	jne L_1410
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*61],rbx
	jmp L_1411
	
L_1410:
	mov rbx,  [rsp+8*59]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*61],rbx
	mov qword [rsp+8*62],rax
	
L_1411:
	mov rdx,  [rsp+8*61]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*63],rbx
	mov rbx,rax
	mov qword [rsp+8*58],rbx
	mov qword [rsp+8*64],rax
	
L_1409:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1414
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	lea rax,[rbx+r14*8+8H]
	mov rbx, [rax]
	lea rax,[rbx+r15*8+8H]
	mov qword [rsp+8*65],rbx
	mov rbx, [rax]
	mov qword [rsp+8*66],rax
	mov rax,1
	mov rdx,rax
	neg rdx
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*67],rbx
	mov qword [rsp+8*68],rdx
	mov qword [rsp+8*69],rax
	je L_1415
	mov rbx,1
	mov rdx,r10
	add rdx,rbx
	mov r10,rdx
	mov qword [rsp+8*70],rdx
	mov rdx,  [gbl+8*33]
	mov rax,rdx
	lea rbx,[rax+r10*8+8H]
	mov [rbx],r14
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*71],rax
	mov rax,  [gbl+8*38]
	mov rbx,rax
	lea rdx,[rbx+r10*8+8H]
	mov [rdx],r15
	mov qword [rsp+8*73],rbx
	mov rbx,  [gbl+8*46]
	mov qword [rsp+8*74],rdx
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov qword [rsp+8*75],rax
	lea rax,[rbx+r14*8+8H]
	mov rbx, [rax]
	lea rax,[rbx+r15*8+8H]
	mov qword [rsp+8*76],rbx
	mov rbx,  [rsp+8*75]
	mov [rax],rbx
	mov rbx,  [gbl+8*22]
	cmp r14,rbx
	mov qword [rsp+8*77],rax
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*78],rax
	jne L_1416
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*78],rbx
	jmp L_1417
	
L_1416:
	mov rbx,  [gbl+8*21]
	cmp r15,rbx
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*79],rdx
	mov qword [rsp+8*78],rax
	
L_1417:
	mov rbx,  [rsp+8*78]
	cmp rbx, 0
	je L_1418
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*80],rbx
	
L_1418:
	
L_1415:
	
L_1414:
	mov rdx,0
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*81],rbx
	mov rbx,1
	mov qword [rsp+8*82],rax
	mov rax,r9
	sub rax,rbx
	mov rbx,2
	mov rdx,r8
	add rdx,rbx
	mov rsi,rdx
	mov rdi,rax
	mov rbx,rdi
	mov rdx,rsi
	mov rsi,r11
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*86],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov qword [rsp+8*85],rbx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*89],rbx
	mov qword [rsp+8*88],rdx
	mov qword [rsp+8*87],rax
	jne L_1421
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*89],rbx
	jmp L_1422
	
L_1421:
	mov rbx,  [rsp+8*87]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*89],rbx
	mov qword [rsp+8*90],rax
	
L_1422:
	mov rdx,  [rsp+8*89]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*91],rbx
	mov qword [rsp+8*92],rax
	jne L_1425
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*93],rbx
	jmp L_1426
	
L_1425:
	mov rsi,r11
	mov rbx,  [rsp+8*86]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*96],rbx
	mov qword [rsp+8*94],rdx
	mov qword [rsp+8*95],rax
	jne L_1427
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*96],rbx
	jmp L_1428
	
L_1427:
	mov rbx,  [rsp+8*94]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*96],rbx
	mov qword [rsp+8*97],rax
	
L_1428:
	mov rdx,  [rsp+8*96]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*98],rbx
	mov rbx,rax
	mov qword [rsp+8*93],rbx
	mov qword [rsp+8*99],rax
	
L_1426:
	mov rbx,  [rsp+8*93]
	cmp rbx, 0
	je L_1431
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*85]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*86]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*100],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*101],rdx
	mov rdx,1
	mov rax,rdx
	neg rax
	cmp rbx,rax
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*102],rbx
	mov qword [rsp+8*104],rdx
	mov qword [rsp+8*103],rax
	je L_1432
	mov rbx,1
	mov rdx,r10
	add rdx,rbx
	mov r10,rdx
	mov qword [rsp+8*105],rdx
	mov rdx,  [gbl+8*33]
	mov rax,rdx
	lea rbx,[rax+r10*8+8H]
	mov qword [rsp+8*106],rax
	mov rax,  [rsp+8*85]
	mov [rbx],rax
	mov qword [rsp+8*107],rbx
	mov rdx,  [gbl+8*38]
	mov rbx,rdx
	lea rax,[rbx+r10*8+8H]
	mov qword [rsp+8*108],rbx
	mov rbx,  [rsp+8*86]
	mov [rax],rbx
	mov qword [rsp+8*109],rax
	mov rax,  [gbl+8*46]
	mov rdx,1
	mov r14,rax
	add r14,rdx
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*85]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*86]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	mov rbx,  [gbl+8*22]
	cmp rdx,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1433
	mov rbx,0
	mov r15,rbx
	jmp L_1434
	
L_1433:
	mov rbx,  [rsp+8*86]
	mov rdx,  [gbl+8*21]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1434:
	cmp r15, 0
	je L_1435
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*80],rbx
	
L_1435:
	
L_1432:
	
L_1431:
	mov rbx,0
	mov r15,rbx
	mov rdx,r15
	mov rax,1
	mov qword [rsp+8*116],rdx
	mov rdx,r9
	add rdx,rax
	mov rax,2
	mov rbx,r8
	sub rbx,rax
	mov rsi,rbx
	mov rdi,rdx
	mov r13,rdi
	mov r12,rsi
	mov rsi,r11
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*118],rbx
	mov qword [rsp+8*117],rdx
	jne L_1438
	mov rbx,0
	mov r15,rbx
	jmp L_1439
	
L_1438:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1439:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1442
	mov rbx,0
	mov r15,rbx
	jmp L_1443
	
L_1442:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1444
	mov rbx,0
	mov r15,rbx
	jmp L_1445
	
L_1444:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1445:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1443:
	cmp r15, 0
	je L_1448
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov rdx, [r15]
	mov rax,1
	mov r15,rax
	neg r15
	cmp rdx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*136],rdx
	je L_1449
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [gbl+8*38]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [gbl+8*46]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,  [gbl+8*5]
	mov rax,rbx
	lea rdx,[rax+r13*8+8H]
	mov rax, [rdx]
	lea rdx,[rax+r12*8+8H]
	mov [rdx],r15
	mov qword [rsp+8*146],rdx
	mov rdx,  [gbl+8*22]
	cmp r13,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*145],rax
	jne L_1450
	mov rbx,0
	mov r15,rbx
	jmp L_1451
	
L_1450:
	mov rbx,  [gbl+8*21]
	cmp r12,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1451:
	cmp r15, 0
	je L_1452
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*80],rbx
	
L_1452:
	
L_1449:
	
L_1448:
	mov rbx,0
	mov r15,rbx
	mov rdx,r15
	mov rax,1
	mov qword [rsp+8*150],rdx
	mov rdx,r9
	add rdx,rax
	mov rax,2
	mov rbx,r8
	add rbx,rax
	mov rsi,rbx
	mov rdi,rdx
	mov r12,rdi
	mov r13,rsi
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*152],rbx
	mov qword [rsp+8*151],rdx
	jne L_1455
	mov rbx,0
	mov r15,rbx
	jmp L_1456
	
L_1455:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1456:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1459
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*161],rbx
	jmp L_1460
	
L_1459:
	mov rsi,r11
	mov rdi,r13
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*162],rbx
	mov qword [rsp+8*163],rdx
	mov qword [rsp+8*164],rax
	jne L_1461
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*164],rbx
	jmp L_1462
	
L_1461:
	mov rbx,  [rsp+8*162]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*164],rbx
	mov qword [rsp+8*165],rax
	
L_1462:
	mov rdx,  [rsp+8*164]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*166],rbx
	mov rbx,rax
	mov qword [rsp+8*161],rbx
	mov qword [rsp+8*167],rax
	
L_1460:
	mov rbx,  [rsp+8*161]
	cmp rbx, 0
	je L_1465
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	lea rax,[rbx+r12*8+8H]
	mov rbx, [rax]
	lea rax,[rbx+r13*8+8H]
	mov qword [rsp+8*168],rbx
	mov rbx, [rax]
	mov qword [rsp+8*169],rax
	mov rax,1
	mov rdx,rax
	neg rdx
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*170],rbx
	mov qword [rsp+8*171],rdx
	mov qword [rsp+8*172],rax
	je L_1466
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rax,  [gbl+8*33]
	mov rdx,rax
	lea rbx,[rdx+r10*8+8H]
	mov [rbx],r12
	mov qword [rsp+8*175],rbx
	mov qword [rsp+8*174],rdx
	mov rdx,  [gbl+8*38]
	mov rbx,rdx
	lea rax,[rbx+r10*8+8H]
	mov [rax],r13
	mov qword [rsp+8*176],rbx
	mov rbx,  [gbl+8*46]
	mov qword [rsp+8*177],rax
	mov rax,1
	mov rdx,rbx
	add rdx,rax
	mov qword [rsp+8*178],rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	lea rax,[rbx+r12*8+8H]
	mov rbx, [rax]
	lea rax,[rbx+r13*8+8H]
	mov qword [rsp+8*179],rbx
	mov rbx,  [rsp+8*178]
	mov [rax],rbx
	mov rbx,  [gbl+8*22]
	cmp r12,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*180],rax
	jne L_1467
	mov rbx,0
	mov r15,rbx
	jmp L_1468
	
L_1467:
	mov rbx,  [gbl+8*21]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1468:
	cmp r15, 0
	je L_1469
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*80],rbx
	
L_1469:
	
L_1466:
	
L_1465:
	mov rdx,0
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*183],rbx
	mov rbx,2
	mov qword [rsp+8*184],rax
	mov rax,r9
	sub rax,rbx
	mov rbx,1
	mov rdx,r8
	sub rdx,rbx
	mov rsi,rdx
	mov rdi,rax
	mov rbx,rdi
	mov rdx,rsi
	mov rsi,r11
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*188],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov qword [rsp+8*187],rbx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*191],rbx
	mov qword [rsp+8*190],rdx
	mov qword [rsp+8*189],rax
	jne L_1472
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*191],rbx
	jmp L_1473
	
L_1472:
	mov rbx,  [rsp+8*189]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*191],rbx
	mov qword [rsp+8*192],rax
	
L_1473:
	mov rdx,  [rsp+8*191]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*193],rbx
	mov qword [rsp+8*194],rax
	jne L_1476
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*195],rbx
	jmp L_1477
	
L_1476:
	mov rsi,r11
	mov rbx,  [rsp+8*188]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*198],rbx
	mov qword [rsp+8*196],rdx
	mov qword [rsp+8*197],rax
	jne L_1478
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*198],rbx
	jmp L_1479
	
L_1478:
	mov rbx,  [rsp+8*196]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov rax,r15
	mov qword [rsp+8*198],rax
	
L_1479:
	mov rdx,  [rsp+8*198]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*200],rbx
	mov rbx,rax
	mov qword [rsp+8*195],rbx
	mov qword [rsp+8*201],rax
	
L_1477:
	mov rbx,  [rsp+8*195]
	cmp rbx, 0
	je L_1482
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*187]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*188]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*202],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*203],rdx
	mov rdx,1
	mov rax,rdx
	neg rax
	cmp rbx,rax
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*204],rbx
	mov qword [rsp+8*206],rdx
	mov qword [rsp+8*205],rax
	je L_1483
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rax,  [gbl+8*33]
	mov rdx,rax
	lea rbx,[rdx+r10*8+8H]
	mov qword [rsp+8*208],rdx
	mov rdx,  [rsp+8*187]
	mov [rbx],rdx
	mov qword [rsp+8*209],rbx
	mov rax,  [gbl+8*38]
	mov rbx,rax
	lea rdx,[rbx+r10*8+8H]
	mov qword [rsp+8*210],rbx
	mov rbx,  [rsp+8*188]
	mov [rdx],rbx
	mov qword [rsp+8*211],rdx
	mov rdx,  [gbl+8*46]
	mov rax,1
	mov rbx,rdx
	add rbx,rax
	mov qword [rsp+8*212],rbx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*187]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*188]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*213],rbx
	mov rbx,  [rsp+8*212]
	mov [rdx],rbx
	mov rbx,  [rsp+8*187]
	mov qword [rsp+8*214],rdx
	mov rdx,  [gbl+8*22]
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*215],rax
	jne L_1484
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*215],rbx
	jmp L_1485
	
L_1484:
	mov rbx,  [rsp+8*188]
	mov rdx,  [gbl+8*21]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*215],rbx
	mov qword [rsp+8*216],rax
	
L_1485:
	mov rbx,  [rsp+8*215]
	cmp rbx, 0
	je L_1486
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*80],rbx
	
L_1486:
	
L_1483:
	
L_1482:
	mov rdx,0
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*217],rbx
	mov rbx,2
	mov qword [rsp+8*218],rax
	mov rax,r9
	sub rax,rbx
	mov rbx,1
	mov rdx,r8
	add rdx,rbx
	mov rsi,rdx
	mov rdi,rax
	mov rbx,rdi
	mov r13,rsi
	mov rsi,r11
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*221],rbx
	mov qword [rsp+8*220],rdx
	mov qword [rsp+8*219],rax
	jne L_1489
	mov rbx,0
	mov r15,rbx
	jmp L_1490
	
L_1489:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1490:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1493
	mov rbx,0
	mov r15,rbx
	jmp L_1494
	
L_1493:
	mov rsi,r11
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1495
	mov rbx,0
	mov r15,rbx
	jmp L_1496
	
L_1495:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1496:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1494:
	cmp r15, 0
	je L_1499
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*221]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	mov rax,1
	mov r14,rax
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1500
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov rax,  [rsp+8*221]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rdx,  [gbl+8*46]
	mov rax,1
	mov r14,rdx
	add r14,rax
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*221]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov rax,  [gbl+8*22]
	cmp rdx,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1501
	mov rbx,0
	mov r15,rbx
	jmp L_1502
	
L_1501:
	mov rbx,  [gbl+8*21]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1502:
	cmp r15, 0
	je L_1503
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*80],rbx
	
L_1503:
	
L_1500:
	
L_1499:
	mov rbx,0
	mov r15,rbx
	mov rdx,r15
	mov rax,2
	mov qword [rsp+8*252],rdx
	mov rdx,r9
	add rdx,rax
	mov rax,1
	mov rbx,r8
	sub rbx,rax
	mov rsi,rbx
	mov rdi,rdx
	mov r13,rdi
	mov r12,rsi
	mov rsi,r11
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*254],rbx
	mov qword [rsp+8*253],rdx
	jne L_1506
	mov rbx,0
	mov r15,rbx
	jmp L_1507
	
L_1506:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1507:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1510
	mov rbx,0
	mov r15,rbx
	jmp L_1511
	
L_1510:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1512
	mov rbx,0
	mov r15,rbx
	jmp L_1513
	
L_1512:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1513:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1511:
	cmp r15, 0
	je L_1516
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov rdx, [r15]
	mov rax,1
	mov r15,rax
	neg r15
	cmp rdx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*272],rdx
	je L_1517
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [gbl+8*38]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [gbl+8*46]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rax,  [gbl+8*5]
	mov r15,rax
	lea rbx,[r15+r13*8+8H]
	mov r15, [rbx]
	lea rbx,[r15+r12*8+8H]
	mov [rbx],r14
	mov qword [rsp+8*282],rbx
	mov rbx,  [gbl+8*22]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1518
	mov rbx,0
	mov r15,rbx
	jmp L_1519
	
L_1518:
	mov rbx,  [gbl+8*21]
	cmp r12,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1519:
	cmp r15, 0
	je L_1520
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*80],rbx
	
L_1520:
	
L_1517:
	
L_1516:
	mov rbx,0
	mov r15,rbx
	mov rdx,r15
	mov rax,2
	mov r14,r9
	add r14,rax
	mov qword [rsp+8*286],rdx
	mov rdx,1
	mov r15,r8
	add r15,rdx
	mov rsi,r15
	mov rdi,r14
	mov r12,rdi
	mov r13,rsi
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1523
	mov rbx,0
	mov r15,rbx
	jmp L_1524
	
L_1523:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1524:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1527
	mov rbx,0
	mov r15,rbx
	jmp L_1528
	
L_1527:
	mov rsi,r11
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1529
	mov rbx,0
	mov r15,rbx
	jmp L_1530
	
L_1529:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1530:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1528:
	cmp r15, 0
	je L_1533
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	mov rdx,1
	mov r14,rdx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1534
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rax,  [gbl+8*38]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rbx,  [gbl+8*46]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea rdx,[r15+r12*8+8H]
	mov r15, [rdx]
	lea rdx,[r15+r13*8+8H]
	mov [rdx],r14
	mov qword [rsp+8*316],rdx
	mov rdx,  [gbl+8*22]
	cmp r12,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1535
	mov rbx,0
	mov r15,rbx
	jmp L_1536
	
L_1535:
	mov rbx,  [gbl+8*21]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1536:
	cmp r15, 0
	je L_1537
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*80],rbx
	
L_1537:
	
L_1534:
	
L_1533:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,  [gbl+8*80]
	mov rax,1
	cmp rdx,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1356
	jmp L_1354
	
L_1356:
	mov rbx,  [gbl+8*30]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov qword [gbl+8*30],rbx
	jmp L_1353
	
L_1354:
	mov rbx,  [gbl+8*80]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1357
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [gbl+8*22]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [gbl+8*21]
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
	jmp L_1358
	
L_1357:
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
	
L_1358:
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2728
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
	mov     qword [gbl+8*331], rax
	mov rdx,  [gbl+8*331]
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
	mov     qword [gbl+8*332], rax
	mov rdx,  [gbl+8*332]
	mov rbx,rdx
	mov qword [gbl+8*38],rbx
	mov rbx,  [rsp+8*333]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   4712
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

