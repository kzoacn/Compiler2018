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
	mov qword [gbl+8*5],rbx
	
L_1422:
	cmp r12,r13
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1423
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
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov rdx,0
	mov r14,rdx
	
L_1424:
	cmp r14,r13
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1425
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r14*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r14
	mov rax,1
	add r14,rax
	jmp L_1424
	
L_1425:
	mov r15,r12
	mov rbx,1
	add r12,rbx
	jmp L_1422
	
L_1423:
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
	
L_1402:
	cmp r12,r9
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1403
	mov rbx,0
	mov r14,rbx
	
L_1405:
	cmp r14,r9
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1406
	mov rbx,1
	mov r13,rbx
	neg r13
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r14*8+8H]
	mov [r15],r13
	mov r15,r14
	mov rax,1
	add r14,rax
	jmp L_1405
	
L_1406:
	mov r15,r12
	mov rbx,1
	add r12,rbx
	jmp L_1402
	
L_1403:
	
L_1408:
	mov rbx,  [gbl+8*30]
	cmp rbx,r8
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1409
	mov rbx,  [gbl+8*33]
	mov r15,rbx
	mov rdx,  [gbl+8*30]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov r13,r15
	mov rax,  [gbl+8*38]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov r12,r15
	mov rbx,  [gbl+8*5]
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
	mov qword [gbl+8*46],rax
	mov rax,rdi
	mov r15,rsi
	cmp rax,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*51],rbx
	mov qword [rsp+8*50],rdx
	mov qword [rsp+8*52],rax
	jne L_1459
	mov rbx,0
	mov r15,rbx
	jmp L_1460
	
L_1459:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1460:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1463
	mov rbx,0
	mov r15,rbx
	jmp L_1464
	
L_1463:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*52],rdx
	jne L_1465
	mov rbx,0
	mov r15,rbx
	jmp L_1466
	
L_1465:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1466:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1464:
	cmp r15, 0
	je L_1469
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*62],rbx
	je L_1470
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	mov rbx,  [rsp+8*50]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1471
	mov rbx,0
	mov r15,rbx
	jmp L_1472
	
L_1471:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1472:
	cmp r15, 0
	je L_1473
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1473:
	
L_1470:
	
L_1469:
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
	mov qword [rsp+8*52],rbx
	mov qword [rsp+8*50],rdx
	mov qword [rsp+8*51],rax
	jne L_1476
	mov rbx,0
	mov r15,rbx
	jmp L_1477
	
L_1476:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1477:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1480
	mov rbx,0
	mov r15,rbx
	jmp L_1481
	
L_1480:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*52],rdx
	jne L_1482
	mov rbx,0
	mov r15,rbx
	jmp L_1483
	
L_1482:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1483:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1481:
	cmp r15, 0
	je L_1486
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*62],rbx
	je L_1487
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	mov rbx,  [rsp+8*50]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1488
	mov rbx,0
	mov r15,rbx
	jmp L_1489
	
L_1488:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1489:
	cmp r15, 0
	je L_1490
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1490:
	
L_1487:
	
L_1486:
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
	mov qword [rsp+8*52],rbx
	mov qword [rsp+8*50],rdx
	mov qword [rsp+8*51],rax
	jne L_1493
	mov rbx,0
	mov r15,rbx
	jmp L_1494
	
L_1493:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1494:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1497
	mov rbx,0
	mov r15,rbx
	jmp L_1498
	
L_1497:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*52],rdx
	jne L_1499
	mov rbx,0
	mov r15,rbx
	jmp L_1500
	
L_1499:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1500:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1498:
	cmp r15, 0
	je L_1503
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*62],rbx
	je L_1504
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	mov rbx,  [rsp+8*50]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1505
	mov rbx,0
	mov r15,rbx
	jmp L_1506
	
L_1505:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1506:
	cmp r15, 0
	je L_1507
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1507:
	
L_1504:
	
L_1503:
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
	mov qword [rsp+8*52],rbx
	mov qword [rsp+8*50],rdx
	mov qword [rsp+8*51],rax
	jne L_1510
	mov rbx,0
	mov r15,rbx
	jmp L_1511
	
L_1510:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1511:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1514
	mov rbx,0
	mov r15,rbx
	jmp L_1515
	
L_1514:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*52],rdx
	jne L_1516
	mov rbx,0
	mov r15,rbx
	jmp L_1517
	
L_1516:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1517:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1515:
	cmp r15, 0
	je L_1520
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*62],rbx
	je L_1521
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	mov rbx,  [rsp+8*50]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1522
	mov rbx,0
	mov r15,rbx
	jmp L_1523
	
L_1522:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1523:
	cmp r15, 0
	je L_1524
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1524:
	
L_1521:
	
L_1520:
	mov rbx,0
	mov r15,rbx
	mov rdx,r15
	mov rax,2
	mov qword [rsp+8*86],rdx
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
	mov qword [rsp+8*50],rbx
	mov qword [rsp+8*51],rdx
	mov qword [rsp+8*52],rax
	jne L_1527
	mov rbx,0
	mov r15,rbx
	jmp L_1528
	
L_1527:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1528:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1531
	mov rbx,0
	mov r15,rbx
	jmp L_1532
	
L_1531:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*52],rdx
	jne L_1533
	mov rbx,0
	mov r15,rbx
	jmp L_1534
	
L_1533:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1534:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1532:
	cmp r15, 0
	je L_1537
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*62],rbx
	je L_1538
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	mov rbx,  [rsp+8*50]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1539
	mov rbx,0
	mov r15,rbx
	jmp L_1540
	
L_1539:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1540:
	cmp r15, 0
	je L_1541
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1541:
	
L_1538:
	
L_1537:
	mov rbx,0
	mov r15,rbx
	mov rdx,r15
	mov rax,2
	mov qword [rsp+8*89],rdx
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
	mov qword [rsp+8*52],rbx
	mov qword [rsp+8*50],rdx
	mov qword [rsp+8*51],rax
	jne L_1544
	mov rbx,0
	mov r15,rbx
	jmp L_1545
	
L_1544:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1545:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1548
	mov rbx,0
	mov r15,rbx
	jmp L_1549
	
L_1548:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*52],rdx
	jne L_1550
	mov rbx,0
	mov r15,rbx
	jmp L_1551
	
L_1550:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1551:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1549:
	cmp r15, 0
	je L_1554
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*62],rbx
	je L_1555
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	mov rbx,  [rsp+8*50]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1556
	mov rbx,0
	mov r15,rbx
	jmp L_1557
	
L_1556:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1557:
	cmp r15, 0
	je L_1558
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1558:
	
L_1555:
	
L_1554:
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
	mov qword [rsp+8*52],rbx
	mov qword [rsp+8*50],rdx
	mov qword [rsp+8*51],rax
	jne L_1561
	mov rbx,0
	mov r15,rbx
	jmp L_1562
	
L_1561:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1562:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1565
	mov rbx,0
	mov r15,rbx
	jmp L_1566
	
L_1565:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*52],rdx
	jne L_1567
	mov rbx,0
	mov r15,rbx
	jmp L_1568
	
L_1567:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1568:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1566:
	cmp r15, 0
	je L_1571
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*62],rbx
	je L_1572
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	mov rbx,  [rsp+8*50]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	cmp rbx,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1573
	mov rbx,0
	mov r15,rbx
	jmp L_1574
	
L_1573:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1574:
	cmp r15, 0
	je L_1575
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1575:
	
L_1572:
	
L_1571:
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
	mov qword [rsp+8*52],rbx
	mov qword [rsp+8*50],rdx
	mov qword [rsp+8*51],rax
	jne L_1578
	mov rbx,0
	mov r15,rbx
	jmp L_1579
	
L_1578:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1579:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1582
	mov rbx,0
	mov r15,rbx
	jmp L_1583
	
L_1582:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*52],rdx
	jne L_1584
	mov rbx,0
	mov r15,rbx
	jmp L_1585
	
L_1584:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1585:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1583:
	cmp r15, 0
	je L_1588
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rdx,  [rsp+8*50]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*51]
	lea r15,[r15+rax*8+8H]
	mov rbx, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp rbx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*62],rbx
	je L_1589
	mov rbx,1
	mov r15,r8
	add r15,rbx
	mov r8,r15
	mov rdx,  [gbl+8*33]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov rax,  [rsp+8*50]
	mov [r15],rax
	mov rbx,  [gbl+8*38]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov rdx,  [rsp+8*51]
	mov [r15],rdx
	mov rax,  [gbl+8*46]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	mov rax,  [rsp+8*50]
	lea r15,[r15+rax*8+8H]
	mov r15, [r15]
	lea r15,[r15+rdx*8+8H]
	mov [r15],r14
	cmp rax,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1590
	mov rbx,0
	mov r15,rbx
	jmp L_1591
	
L_1590:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1591:
	cmp r15, 0
	je L_1592
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1592:
	
L_1589:
	
L_1588:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,  [gbl+8*75]
	mov rax,1
	cmp rdx,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1411
	jmp L_1409
	
L_1411:
	mov rbx,  [gbl+8*30]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov qword [gbl+8*30],rbx
	jmp L_1408
	
L_1409:
	mov rbx,  [gbl+8*75]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1412
	mov rbx,  [gbl+8*5]
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
	jmp L_1413
	
L_1412:
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
	
L_1413:
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

