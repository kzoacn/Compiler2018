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
	sub    rsp, 1480
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
        sub     rdx, 3464
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov r15,r15
	mov r15,r15
	mov r15,r15
	mov r15,r15
	mov r15,r15
	mov r15,r15
	mov r15,r15
	push r11
	push r10
	push r9
	push r8
	call    getInt
	pop r8
	pop r9
	pop r10
	pop r11
	mov      r15, rax
	mov r14,r15
	mov rbx,0
	mov r13,rbx
	mov rdx,0
	mov r15,rdx
	mov r15,r15
	mov r15,r15
	mov r15,r15
	mov r15,r15
	mov r15,r15
	mov r15,r15
	mov r15,r15
	mov r15,r15
	mov r15,r15
	mov r15,r15
	mov rax,0
	mov r15,rax
	
L_0:
	cmp r15,r14
	mov r12, 0
	setl r12B
	cmp r12, 0
	je L_1
	mov rbx,0
	mov r12,rbx
	
L_3:
	cmp r12,r14
	mov r11, 0
	setl r11B
	cmp r11, 0
	je L_4
	mov rbx,0
	mov r11,rbx
	
L_6:
	cmp r11,r14
	mov r10, 0
	setl r10B
	cmp r10, 0
	je L_7
	cmp r15,0
	mov r10, 0
	setg r10B
	cmp r10, 0
	jne L_9
	mov rbx,0
	mov r10,rbx
	jmp L_10
	
L_9:
	xor rdx, rdx
	mov rax,  r15
	mov rbx, 199
	cdq
	idiv ebx
	mov  r10, rdx
	mov rbx,0
	cmp r10,rbx
	mov r10, 0
	sete r10B
	mov r10,r10
	
L_10:
	cmp r10, 0
	je L_13
	mov rbx,1
	mov r10,rbx
	jmp L_14
	
L_13:
	cmp r12,0
	mov r10, 0
	setg r10B
	cmp r10, 0
	jne L_11
	mov rbx,0
	mov r10,rbx
	jmp L_12
	
L_11:
	xor rdx, rdx
	mov rax,  r12
	mov rbx, 199
	cdq
	idiv ebx
	mov  r10, rdx
	mov rbx,0
	cmp r10,rbx
	mov r10, 0
	sete r10B
	mov r10,r10
	
L_12:
	mov r10,r10
	
L_14:
	cmp r10, 0
	je L_17
	mov rbx,1
	mov r10,rbx
	jmp L_18
	
L_17:
	cmp r11,0
	mov r10, 0
	setg r10B
	cmp r10, 0
	jne L_15
	mov rbx,0
	mov r10,rbx
	jmp L_16
	
L_15:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov  r10, rdx
	mov rbx,0
	cmp r10,rbx
	mov r10, 0
	sete r10B
	mov r10,r10
	
L_16:
	mov r10,r10
	
L_18:
	cmp r10, 0
	je L_21
	mov rbx,1
	mov r10,rbx
	jmp L_22
	
L_21:
	mov r10,r15
	add r10,r12
	add r10,r11
	cmp r10,0
	mov r10, 0
	setg r10B
	cmp r10, 0
	jne L_19
	mov rbx,0
	mov r10,rbx
	jmp L_20
	
L_19:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov  r10, rdx
	mov rbx,0
	cmp r10,rbx
	mov r10, 0
	sete r10B
	mov r10,r10
	
L_20:
	mov r10,r10
	
L_22:
	cmp r10, 0
	je L_25
	mov rbx,1
	mov r10,rbx
	jmp L_26
	
L_25:
	mov r10,r15
	imul r10,r12
	imul r10,r11
	cmp r10,0
	mov r10, 0
	setg r10B
	cmp r10, 0
	jne L_23
	mov rbx,0
	mov r10,rbx
	jmp L_24
	
L_23:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov  r10, rdx
	mov rbx,0
	cmp r10,rbx
	mov r10, 0
	sete r10B
	mov r10,r10
	
L_24:
	mov r10,r10
	
L_26:
	mov r10,r10
	cmp r15,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	jne L_27
	mov rbx,0
	mov r9,rbx
	jmp L_28
	
L_27:
	xor rdx, rdx
	mov rax,  r15
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r9, 0
	sete r9B
	mov r9,r9
	
L_28:
	cmp r9, 0
	je L_31
	mov rbx,1
	mov r9,rbx
	jmp L_32
	
L_31:
	cmp r12,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	jne L_29
	mov rbx,0
	mov r9,rbx
	jmp L_30
	
L_29:
	xor rdx, rdx
	mov rax,  r12
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r9, 0
	sete r9B
	mov r9,r9
	
L_30:
	mov r9,r9
	
L_32:
	cmp r9, 0
	je L_35
	mov rbx,1
	mov r9,rbx
	jmp L_36
	
L_35:
	cmp r11,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	jne L_33
	mov rbx,0
	mov r9,rbx
	jmp L_34
	
L_33:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r9, 0
	sete r9B
	mov r9,r9
	
L_34:
	mov r9,r9
	
L_36:
	cmp r9, 0
	je L_39
	mov rbx,1
	mov r9,rbx
	jmp L_40
	
L_39:
	mov r9,r15
	add r9,r12
	add r9,r11
	cmp r9,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	jne L_37
	mov rbx,0
	mov r9,rbx
	jmp L_38
	
L_37:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r9, 0
	sete r9B
	mov r9,r9
	
L_38:
	mov r9,r9
	
L_40:
	cmp r9, 0
	je L_43
	mov rbx,1
	mov r9,rbx
	jmp L_44
	
L_43:
	mov r9,r15
	imul r9,r12
	imul r9,r11
	cmp r9,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	jne L_41
	mov rbx,0
	mov r9,rbx
	jmp L_42
	
L_41:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov  r9, rdx
	mov rbx,0
	cmp r9,rbx
	mov r9, 0
	sete r9B
	mov r9,r9
	
L_42:
	mov r9,r9
	
L_44:
	mov r9,r9
	cmp r15,0
	mov r8, 0
	setg r8B
	cmp r8, 0
	jne L_45
	mov rbx,0
	mov r8,rbx
	jmp L_46
	
L_45:
	xor rdx, rdx
	mov rax,  r15
	mov rbx, 199
	cdq
	idiv ebx
	mov  r8, rdx
	mov rbx,0
	cmp r8,rbx
	mov r8, 0
	sete r8B
	mov r8,r8
	
L_46:
	cmp r8, 0
	je L_49
	mov rbx,1
	mov r8,rbx
	jmp L_50
	
L_49:
	cmp r12,0
	mov r8, 0
	setg r8B
	cmp r8, 0
	jne L_47
	mov rbx,0
	mov r8,rbx
	jmp L_48
	
L_47:
	xor rdx, rdx
	mov rax,  r12
	mov rbx, 199
	cdq
	idiv ebx
	mov  r8, rdx
	mov rbx,0
	cmp r8,rbx
	mov r8, 0
	sete r8B
	mov r8,r8
	
L_48:
	mov r8,r8
	
L_50:
	cmp r8, 0
	je L_53
	mov rbx,1
	mov r8,rbx
	jmp L_54
	
L_53:
	cmp r11,0
	mov r8, 0
	setg r8B
	cmp r8, 0
	jne L_51
	mov rbx,0
	mov r8,rbx
	jmp L_52
	
L_51:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov  r8, rdx
	mov rbx,0
	cmp r8,rbx
	mov r8, 0
	sete r8B
	mov r8,r8
	
L_52:
	mov r8,r8
	
L_54:
	cmp r8, 0
	je L_57
	mov rbx,1
	mov r8,rbx
	jmp L_58
	
L_57:
	mov r8,r15
	add r8,r12
	add r8,r11
	cmp r8,0
	mov r8, 0
	setg r8B
	cmp r8, 0
	jne L_55
	mov rbx,0
	mov r8,rbx
	jmp L_56
	
L_55:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov  r8, rdx
	mov rbx,0
	cmp r8,rbx
	mov r8, 0
	sete r8B
	mov r8,r8
	
L_56:
	mov r8,r8
	
L_58:
	cmp r8, 0
	je L_61
	mov rbx,1
	mov r8,rbx
	jmp L_62
	
L_61:
	mov r8,r15
	imul r8,r12
	imul r8,r11
	cmp r8,0
	mov r8, 0
	setg r8B
	cmp r8, 0
	jne L_59
	mov rbx,0
	mov r8,rbx
	jmp L_60
	
L_59:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov  r8, rdx
	mov rbx,0
	cmp r8,rbx
	mov r8, 0
	sete r8B
	mov r8,r8
	
L_60:
	mov r8,r8
	
L_62:
	mov r8,r8
	cmp r15,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*79],rbx
	jne L_63
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*79],rbx
	jmp L_64
	
L_63:
	xor rdx, rdx
	mov rax,  r15
	mov rbx, 199
	cdq
	idiv ebx
	mov [rsp+8*80], rdx
	mov rbx,  [rsp+8*80]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*79],rbx
	mov qword [rsp+8*81],rax
	
L_64:
	mov rbx,  [rsp+8*79]
	cmp rbx, 0
	je L_67
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*79],rbx
	jmp L_68
	
L_67:
	cmp r12,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*82],rbx
	jne L_65
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*82],rbx
	jmp L_66
	
L_65:
	xor rdx, rdx
	mov rax,  r12
	mov rbx, 199
	cdq
	idiv ebx
	mov [rsp+8*83], rdx
	mov rbx,  [rsp+8*83]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*82],rbx
	mov qword [rsp+8*84],rax
	
L_66:
	mov rdx,  [rsp+8*82]
	mov rbx,rdx
	mov qword [rsp+8*79],rbx
	
L_68:
	mov rbx,  [rsp+8*79]
	cmp rbx, 0
	je L_71
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*79],rbx
	jmp L_72
	
L_71:
	cmp r11,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*85],rbx
	jne L_69
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*85],rbx
	jmp L_70
	
L_69:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov [rsp+8*86], rdx
	mov rbx,  [rsp+8*86]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*85],rbx
	mov qword [rsp+8*87],rax
	
L_70:
	mov rdx,  [rsp+8*85]
	mov rbx,rdx
	mov qword [rsp+8*79],rbx
	
L_72:
	mov rbx,  [rsp+8*79]
	cmp rbx, 0
	je L_75
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*79],rbx
	jmp L_76
	
L_75:
	mov rbx,r15
	add rbx,r12
	add rbx,r11
	cmp rbx,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*88],rbx
	jne L_73
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*88],rbx
	jmp L_74
	
L_73:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov [rsp+8*89], rdx
	mov rbx,  [rsp+8*89]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*88],rbx
	mov qword [rsp+8*90],rax
	
L_74:
	mov rdx,  [rsp+8*88]
	mov rbx,rdx
	mov qword [rsp+8*79],rbx
	
L_76:
	mov rbx,  [rsp+8*79]
	cmp rbx, 0
	je L_79
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*79],rbx
	jmp L_80
	
L_79:
	mov rbx,r15
	imul rbx,r12
	imul rbx,r11
	cmp rbx,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*91],rbx
	jne L_77
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*91],rbx
	jmp L_78
	
L_77:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov [rsp+8*92], rdx
	mov rbx,  [rsp+8*92]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*91],rbx
	mov qword [rsp+8*93],rax
	
L_78:
	mov rdx,  [rsp+8*91]
	mov rbx,rdx
	mov qword [rsp+8*79],rbx
	
L_80:
	mov rdx,  [rsp+8*79]
	mov rbx,rdx
	cmp r15,0
	mov rax, 0
	setg al
	cmp rax, 0
	mov qword [rsp+8*94],rbx
	mov qword [rsp+8*95],rax
	jne L_81
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*95],rbx
	jmp L_82
	
L_81:
	xor rdx, rdx
	mov rax,  r15
	mov rbx, 199
	cdq
	idiv ebx
	mov [rsp+8*96], rdx
	mov rbx,  [rsp+8*96]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*95],rbx
	mov qword [rsp+8*97],rax
	
L_82:
	mov rbx,  [rsp+8*95]
	cmp rbx, 0
	je L_85
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*95],rbx
	jmp L_86
	
L_85:
	cmp r12,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*98],rbx
	jne L_83
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*98],rbx
	jmp L_84
	
L_83:
	xor rdx, rdx
	mov rax,  r12
	mov rbx, 199
	cdq
	idiv ebx
	mov [rsp+8*99], rdx
	mov rbx,  [rsp+8*99]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*98],rbx
	mov qword [rsp+8*100],rax
	
L_84:
	mov rdx,  [rsp+8*98]
	mov rbx,rdx
	mov qword [rsp+8*95],rbx
	
L_86:
	mov rbx,  [rsp+8*95]
	cmp rbx, 0
	je L_89
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*95],rbx
	jmp L_90
	
L_89:
	cmp r11,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*101],rbx
	jne L_87
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*101],rbx
	jmp L_88
	
L_87:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov [rsp+8*102], rdx
	mov rbx,  [rsp+8*102]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*101],rbx
	mov qword [rsp+8*103],rax
	
L_88:
	mov rdx,  [rsp+8*101]
	mov rbx,rdx
	mov qword [rsp+8*95],rbx
	
L_90:
	mov rbx,  [rsp+8*95]
	cmp rbx, 0
	je L_93
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*95],rbx
	jmp L_94
	
L_93:
	mov rbx,r15
	add rbx,r12
	add rbx,r11
	cmp rbx,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*104],rbx
	jne L_91
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*104],rbx
	jmp L_92
	
L_91:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov [rsp+8*105], rdx
	mov rbx,  [rsp+8*105]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*104],rbx
	mov qword [rsp+8*106],rax
	
L_92:
	mov rdx,  [rsp+8*104]
	mov rbx,rdx
	mov qword [rsp+8*95],rbx
	
L_94:
	mov rbx,  [rsp+8*95]
	cmp rbx, 0
	je L_97
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*95],rbx
	jmp L_98
	
L_97:
	mov rbx,r15
	imul rbx,r12
	imul rbx,r11
	cmp rbx,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*107],rbx
	jne L_95
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*107],rbx
	jmp L_96
	
L_95:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov [rsp+8*108], rdx
	mov rbx,  [rsp+8*108]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*107],rbx
	mov qword [rsp+8*109],rax
	
L_96:
	mov rdx,  [rsp+8*107]
	mov rbx,rdx
	mov qword [rsp+8*95],rbx
	
L_98:
	mov rdx,  [rsp+8*95]
	mov rbx,rdx
	cmp r15,0
	mov rax, 0
	setg al
	cmp rax, 0
	mov qword [rsp+8*110],rbx
	mov qword [rsp+8*111],rax
	jne L_99
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*111],rbx
	jmp L_100
	
L_99:
	xor rdx, rdx
	mov rax,  r15
	mov rbx, 199
	cdq
	idiv ebx
	mov [rsp+8*112], rdx
	mov rbx,  [rsp+8*112]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*111],rbx
	mov qword [rsp+8*113],rax
	
L_100:
	mov rbx,  [rsp+8*111]
	cmp rbx, 0
	je L_103
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*111],rbx
	jmp L_104
	
L_103:
	cmp r12,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*114],rbx
	jne L_101
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*114],rbx
	jmp L_102
	
L_101:
	xor rdx, rdx
	mov rax,  r12
	mov rbx, 199
	cdq
	idiv ebx
	mov [rsp+8*115], rdx
	mov rbx,  [rsp+8*115]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*114],rbx
	mov qword [rsp+8*116],rax
	
L_102:
	mov rdx,  [rsp+8*114]
	mov rbx,rdx
	mov qword [rsp+8*111],rbx
	
L_104:
	mov rbx,  [rsp+8*111]
	cmp rbx, 0
	je L_107
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*111],rbx
	jmp L_108
	
L_107:
	cmp r11,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*117],rbx
	jne L_105
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*117],rbx
	jmp L_106
	
L_105:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov [rsp+8*118], rdx
	mov rbx,  [rsp+8*118]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*117],rbx
	mov qword [rsp+8*119],rax
	
L_106:
	mov rdx,  [rsp+8*117]
	mov rbx,rdx
	mov qword [rsp+8*111],rbx
	
L_108:
	mov rbx,  [rsp+8*111]
	cmp rbx, 0
	je L_111
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*111],rbx
	jmp L_112
	
L_111:
	mov rbx,r15
	add rbx,r12
	add rbx,r11
	cmp rbx,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*120],rbx
	jne L_109
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*120],rbx
	jmp L_110
	
L_109:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov [rsp+8*121], rdx
	mov rbx,  [rsp+8*121]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*120],rbx
	mov qword [rsp+8*122],rax
	
L_110:
	mov rdx,  [rsp+8*120]
	mov rbx,rdx
	mov qword [rsp+8*111],rbx
	
L_112:
	mov rbx,  [rsp+8*111]
	cmp rbx, 0
	je L_115
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*111],rbx
	jmp L_116
	
L_115:
	mov rbx,r15
	imul rbx,r12
	imul rbx,r11
	cmp rbx,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*123],rbx
	jne L_113
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*123],rbx
	jmp L_114
	
L_113:
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 199
	cdq
	idiv ebx
	mov [rsp+8*124], rdx
	mov rbx,  [rsp+8*124]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*123],rbx
	mov qword [rsp+8*125],rax
	
L_114:
	mov rdx,  [rsp+8*123]
	mov rbx,rdx
	mov qword [rsp+8*111],rbx
	
L_116:
	mov rdx,  [rsp+8*111]
	mov rbx,rdx
	cmp r10, 0
	mov qword [rsp+8*126],rbx
	je L_118
	mov r10,r13
	mov rbx,1
	add r13,rbx
	
L_118:
	cmp r9, 0
	je L_120
	mov r10,r13
	mov rbx,1
	add r13,rbx
	
L_120:
	cmp r8, 0
	je L_122
	mov r10,r13
	mov rbx,1
	add r13,rbx
	
L_122:
	mov rbx,  [rsp+8*94]
	cmp rbx, 0
	je L_124
	mov r10,r13
	mov rbx,1
	add r13,rbx
	
L_124:
	mov rbx,  [rsp+8*110]
	cmp rbx, 0
	je L_126
	mov r10,r13
	mov rbx,1
	add r13,rbx
	
L_126:
	mov rbx,  [rsp+8*126]
	cmp rbx, 0
	je L_128
	mov r10,r13
	mov rbx,1
	add r13,rbx
	
L_128:
	mov rbx,1
	add r11,rbx
	jmp L_6
	
L_7:
	mov rbx,1
	add r12,rbx
	jmp L_3
	
L_4:
	mov rbx,1
	add r15,rbx
	jmp L_0
	
L_1:
	mov rdi,r13
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
	mov rbx,1
	mov r15,rbx
	
L_129:
	mov rbx,30000000
	cmp r15,rbx
	mov r14, 0
	setle r14B
	cmp r14, 0
	je L_130
	mov rbx,100
	mov rdi,rbx
	mov r14,rdi
	mov rdi,r14
	mov r14,rdi
	mov rdi,r14
	mov r14,rdi
	mov rdi,r14
	mov r13,rdi
	mov rdx,1
	mov r14,r13
	sub r14,rdx
	xor rdx, rdx
	mov rax,  r13
	mov rbx,  r14
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,2
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,3
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,4
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,5
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,6
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,7
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,8
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,9
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,10
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,11
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,12
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,13
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,14
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,15
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,16
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,17
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,18
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,19
	mov r12,r13
	sub r12,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r14, rdx
	mov rbx,20
	sub r13,rbx
	xor rdx, rdx
	mov rax,  r14
	mov rbx,  r13
	cdq
	idiv ebx
	mov  r14, rdx
	mov r14,r14
	mov r14,r14
	mov r14,r14
	mov r14,r14
	mov r14,r14
	mov r14,r14
	mov r14,r14
	mov r14,r14
	mov r14,r14
	xor rdx, rdx
	mov rax,  r15
	mov rbx, 3000000
	cdq
	idiv ebx
	mov  r13, rdx
	mov rbx,0
	cmp r13,rbx
	mov r13, 0
	sete r13B
	cmp r13, 0
	je L_133
	mov rdi,r14
	mov r14,rdi
	mov     rdi,  r14
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
	mov r14,rdi
	mov rdi, r14 
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
	
L_133:
	mov rbx,1
	add r15,rbx
	jmp L_129
	
L_130:
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1480
	mov rbx,  [rsp+8*177]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   3464
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

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

