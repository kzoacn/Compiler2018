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
	sub    rsp, 1464
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
        sub     rdx, 3448
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rdx,0
	mov rbx,rdx
	mov rdx,0
	mov rax,rdx
	mov rdx,0
	mov r8,rdx
	mov rdx,210
	mov r11,rdx
	mov rdx,0
	mov r9,rdx
	mov qword [rsp+8*1],rbx
	mov qword [rsp+8*2],rax
	mov     rdi, 100
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
	mov r10,r15
	xor rdx, rdx
	mov rax, [gbl+8*4]
	mov rbx, [gbl+8*3]
	cdq
	idiv ebx
	mov  r15, rax
	mov r13,r15
	xor rdx, rdx
	mov rax, [gbl+8*4]
	mov rbx, [gbl+8*3]
	cdq
	idiv ebx
	mov  r15, rdx
	mov r12,r15
	mov rdi,r11
	mov r14,rdi
	
L_153:
	cmp r9,r14
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_154
	mov rbx,1
	mov r15,r9
	add r15,rbx
	imul r15,r9
	xor rdx, rdx
	mov rax,  r15
	mov rbx, 2
	cdq
	idiv ebx
	mov  r15, rax
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_155
	mov rbx,1
	mov r15,rbx
	jmp L_157
	
L_155:
	mov rbx,1
	add r9,rbx
	jmp L_153
	
L_154:
	mov rbx,0
	mov r15,rbx
	
L_157:
	mov r15,r15
	cmp r15, 0
	sete r15B
	cmp r15, 0
	je L_121
	mov rbx,t224
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
	mov rbx,1
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
L_121:
	mov rbx,t229
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
	mov rbx,3654898
	mov rdi,rbx
	mov r15,rdi
	mov rdx,r15
	mov rax,0
	mov r15,rax
	mov r15,r15
	mov qword [gbl+8*6],rdx
	xor rdx, rdx
	mov rax, [gbl+8*6]
	mov rbx,  r13
	cdq
	idiv ebx
	mov  r15, rdx
	mov rbx,  [gbl+8*3]
	mov r14,rbx
	imul r14,r15
	xor rdx, rdx
	mov rax, [gbl+8*6]
	mov rbx,  r13
	cdq
	idiv ebx
	mov  r15, rax
	imul r15,r12
	sub r14,r15
	mov rbx,r14
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	mov qword [rsp+8*7],rbx
	je L_159
	mov rdx,  [rsp+8*7]
	mov rbx,rdx
	mov qword [gbl+8*6],rbx
	jmp L_160
	
L_159:
	mov rbx,  [rsp+8*7]
	mov rdx,  [gbl+8*4]
	mov r15,rbx
	add r15,rdx
	mov rax,r15
	mov qword [gbl+8*6],rax
	
L_160:
	mov rbx,  [gbl+8*6]
	mov r15,rbx
	mov r15,r15
	xor rdx, rdx
	mov rax,  r15
	mov rbx, 10
	cdq
	idiv ebx
	mov  r15, rdx
	mov rbx,1
	add r15,rbx
	mov rdx,r15
	mov rdi,rdx
	mov r15,rdi
	mov qword [gbl+8*8],rdx
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
	
L_122:
	mov rbx,  [gbl+8*8]
	mov rdx,1
	mov rax,rbx
	sub rax,rdx
	mov rdx,  [rsp+8*1]
	cmp rdx,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*9],rax
	je L_123
	xor rdx, rdx
	mov rax, [gbl+8*6]
	mov rbx,  r13
	cdq
	idiv ebx
	mov  r15, rdx
	mov rbx,  [gbl+8*3]
	mov r14,rbx
	imul r14,r15
	xor rdx, rdx
	mov rax, [gbl+8*6]
	mov rbx,  r13
	cdq
	idiv ebx
	mov  r15, rax
	imul r15,r12
	sub r14,r15
	mov rbx,r14
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	mov qword [rsp+8*7],rbx
	je L_163
	mov rdx,  [rsp+8*7]
	mov rbx,rdx
	mov qword [gbl+8*6],rbx
	jmp L_164
	
L_163:
	mov rbx,  [rsp+8*7]
	mov rdx,  [gbl+8*4]
	mov r15,rbx
	add r15,rdx
	mov rax,r15
	mov qword [gbl+8*6],rax
	
L_164:
	mov rbx,  [gbl+8*6]
	mov r15,rbx
	mov rdx,r15
	mov qword [rsp+8*10],rdx
	xor rdx, rdx
	mov rax, [rsp+8*10]
	mov rbx, 10
	cdq
	idiv ebx
	mov [rsp+8*11], rdx
	mov rbx,  [rsp+8*11]
	mov rdx,1
	add rbx,rdx
	mov rax,r10
	mov rdx,  [rsp+8*1]
	mov qword [rsp+8*11],rbx
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*12],rax
	mov rax,  [rsp+8*11]
	mov [rbx],rax
	mov qword [rsp+8*13],rbx
	
L_125:
	mov rbx,r10
	mov rdx,  [rsp+8*1]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*14],rbx
	mov rbx, [rax]
	mov qword [rsp+8*15],rax
	mov rax,  [rsp+8*2]
	mov rdx,rbx
	add rdx,rax
	cmp rdx,r11
	mov rdx, 0
	setg dl
	cmp rdx, 0
	mov qword [rsp+8*16],rbx
	mov qword [rsp+8*17],rdx
	je L_126
	xor rdx, rdx
	mov rax, [gbl+8*6]
	mov rbx,  r13
	cdq
	idiv ebx
	mov  r15, rdx
	mov rbx,  [gbl+8*3]
	mov r14,rbx
	imul r14,r15
	xor rdx, rdx
	mov rax, [gbl+8*6]
	mov rbx,  r13
	cdq
	idiv ebx
	mov  r15, rax
	imul r15,r12
	sub r14,r15
	mov rbx,r14
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	mov qword [rsp+8*7],rbx
	je L_167
	mov rdx,  [rsp+8*7]
	mov rbx,rdx
	mov qword [gbl+8*6],rbx
	jmp L_168
	
L_167:
	mov rbx,  [rsp+8*7]
	mov rdx,  [gbl+8*4]
	mov r15,rbx
	add r15,rdx
	mov rax,r15
	mov qword [gbl+8*6],rax
	
L_168:
	mov rbx,  [gbl+8*6]
	mov r15,rbx
	mov rdx,r15
	mov qword [rsp+8*18],rdx
	xor rdx, rdx
	mov rax, [rsp+8*18]
	mov rbx, 10
	cdq
	idiv ebx
	mov [rsp+8*19], rdx
	mov rbx,  [rsp+8*19]
	mov rdx,1
	add rbx,rdx
	mov rax,r10
	mov rdx,  [rsp+8*1]
	mov qword [rsp+8*19],rbx
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*20],rax
	mov rax,  [rsp+8*19]
	mov [rbx],rax
	mov qword [rsp+8*21],rbx
	jmp L_125
	
L_126:
	mov rbx,r10
	mov rdx,  [rsp+8*1]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*22],rbx
	mov rbx, [rax]
	mov qword [rsp+8*23],rax
	mov rax,  [rsp+8*2]
	mov rdx,rax
	add rdx,rbx
	mov rax,rdx
	mov qword [rsp+8*24],rbx
	mov rbx,  [rsp+8*1]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*1],rbx
	mov qword [rsp+8*2],rax
	jmp L_122
	
L_123:
	mov rbx,  [rsp+8*2]
	mov r14,r11
	sub r14,rbx
	mov rdx,  [gbl+8*8]
	mov rax,1
	mov r13,rdx
	sub r13,rax
	mov r15,r10
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov rbx,0
	mov r14,rbx
	
L_171:
	mov rbx,  [gbl+8*8]
	cmp r14,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_172
	mov r15,r10
	lea r15,[r15+r14*8+8H]
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
	mov     rsi, t106
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
	mov rbx,1
	add r14,rbx
	jmp L_171
	
L_172:
	mov rbx,t111
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
	mov r15,rbx
	mov r15,r15
	mov rdx,0
	mov r13,rdx
	
L_223:
	mov rbx,  [gbl+8*8]
	cmp r13,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_224
	mov r15,r10
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	mov rbx,0
	cmp r15,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_225
	mov rbx,1
	mov r15,r13
	add r15,rbx
	mov r14,r15
	
L_226:
	mov rbx,  [gbl+8*8]
	cmp r14,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_227
	mov r15,r10
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	mov rbx,0
	cmp r15,rbx
	mov r15, 0
	setne r15B
	cmp r15, 0
	je L_228
	mov rsi,r14
	mov rdi,r13
	mov r12,rdi
	mov r11,rsi
	mov r15,r10
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	mov rbx,r15
	mov r15,r10
	lea r15,[r15+r11*8+8H]
	mov r14, [r15]
	mov r15,r10
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov r15,r10
	lea r15,[r15+r11*8+8H]
	mov [r15],rbx
	mov rdx,0
	mov r15,rdx
	mov r15,r15
	mov qword [rsp+8*27],rbx
	jmp L_227
	
L_228:
	mov rbx,1
	add r14,rbx
	jmp L_226
	
L_227:
	
L_225:
	mov rbx,1
	add r13,rbx
	jmp L_223
	
L_224:
	mov rbx,0
	mov r13,rbx
	
L_233:
	mov rbx,  [gbl+8*8]
	cmp r13,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_234
	mov r15,r10
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	mov rbx,0
	cmp r15,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_235
	mov rbx,r13
	mov qword [gbl+8*8],rbx
	jmp L_234
	
L_235:
	mov rbx,1
	add r13,rbx
	jmp L_233
	
L_234:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	
L_127:
	mov     rdi, 100
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
	mov rbx,  [gbl+8*8]
	cmp rbx,r9
	mov r15, 0
	setne r15B
	cmp r15, 0
	je L_239
	mov rbx,0
	mov r15,rbx
	jmp L_241
	
L_239:
	mov rbx,0
	mov r12,rbx
	
L_242:
	mov rbx,  [gbl+8*8]
	cmp r12,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_243
	mov r15,r10
	lea r15,[r15+r12*8+8H]
	mov r14, [r15]
	mov r15,r13
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov rbx,1
	add r12,rbx
	jmp L_242
	
L_243:
	mov rbx,0
	mov r11,rbx
	
L_245:
	mov rbx,  [gbl+8*8]
	mov rdx,1
	mov r15,rbx
	sub r15,rdx
	cmp r11,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_246
	mov rbx,1
	mov r15,r11
	add r15,rbx
	mov r12,r15
	
L_247:
	mov rbx,  [gbl+8*8]
	cmp r12,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_248
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov rbx, [r15]
	mov r15,r13
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	cmp rbx,r15
	mov r15, 0
	setg r15B
	cmp r15, 0
	mov qword [rsp+8*28],rbx
	je L_249
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	mov r15,r15
	mov rbx,r13
	lea rdx,[rbx+r12*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*29],rbx
	mov rbx,r13
	mov qword [rsp+8*30],rdx
	lea rdx,[rbx+r11*8+8H]
	mov [rdx],rax
	mov qword [rsp+8*32],rbx
	mov rbx,r13
	mov qword [rsp+8*33],rdx
	lea rdx,[rbx+r12*8+8H]
	mov [rdx],r15
	mov qword [rsp+8*34],rbx
	mov qword [rsp+8*35],rdx
	mov qword [rsp+8*31],rax
	
L_249:
	mov rbx,1
	add r12,rbx
	jmp L_247
	
L_248:
	mov rbx,1
	add r11,rbx
	jmp L_245
	
L_246:
	mov rbx,0
	mov r11,rbx
	
L_252:
	mov rbx,  [gbl+8*8]
	cmp r11,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_253
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov r14, [r15]
	mov rbx,1
	mov r15,r11
	add r15,rbx
	cmp r14,r15
	mov r15, 0
	setne r15B
	cmp r15, 0
	je L_254
	mov rbx,0
	mov r15,rbx
	jmp L_241
	
L_254:
	mov rbx,1
	add r11,rbx
	jmp L_252
	
L_253:
	mov rbx,1
	mov r15,rbx
	
L_241:
	mov r15,r15
	cmp r15, 0
	sete r15B
	cmp r15, 0
	je L_128
	mov rbx,1
	add r8,rbx
	mov rdi,r8
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
	mov     rsi,  r15
	mov     rdi, t284
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
	mov     rsi, t290
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
	mov r13,rbx
	
L_176:
	mov rbx,  [gbl+8*8]
	cmp r13,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_177
	mov r15,r10
	lea r14,[r15+r13*8+8H]
	mov r15, [r14]
	mov rbx,1
	sub r15,rbx
	mov [r14],r15
	mov rdx,1
	mov r15,r13
	add r15,rdx
	mov r13,r15
	jmp L_176
	
L_177:
	mov r15,r10
	mov rbx,  [gbl+8*8]
	lea r15,[r15+rbx*8+8H]
	mov [r15],rbx
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov rax,0
	mov r15,rax
	mov r15,r15
	mov rdx,0
	mov r13,rdx
	mov qword [gbl+8*8],rbx
	
L_256:
	mov rbx,  [gbl+8*8]
	cmp r13,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_257
	mov r15,r10
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	mov rbx,0
	cmp r15,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_258
	mov rbx,1
	mov r15,r13
	add r15,rbx
	mov r14,r15
	
L_259:
	mov rbx,  [gbl+8*8]
	cmp r14,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_260
	mov r15,r10
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	mov rbx,0
	cmp r15,rbx
	mov r15, 0
	setne r15B
	cmp r15, 0
	je L_261
	mov rsi,r14
	mov rdi,r13
	mov r12,rdi
	mov r11,rsi
	mov r15,r10
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	mov rbx,r15
	mov r15,r10
	lea r15,[r15+r11*8+8H]
	mov r14, [r15]
	mov r15,r10
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov r15,r10
	lea r15,[r15+r11*8+8H]
	mov [r15],rbx
	mov rdx,0
	mov r15,rdx
	mov r15,r15
	mov qword [rsp+8*27],rbx
	jmp L_260
	
L_261:
	mov rbx,1
	add r14,rbx
	jmp L_259
	
L_260:
	
L_258:
	mov rbx,1
	add r13,rbx
	jmp L_256
	
L_257:
	mov rbx,0
	mov r13,rbx
	
L_266:
	mov rbx,  [gbl+8*8]
	cmp r13,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_267
	mov r15,r10
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	mov rbx,0
	cmp r15,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_268
	mov rbx,r13
	mov qword [gbl+8*8],rbx
	jmp L_267
	
L_268:
	mov rbx,1
	add r13,rbx
	jmp L_266
	
L_267:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,0
	mov r14,rdx
	
L_181:
	mov rbx,  [gbl+8*8]
	cmp r14,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_182
	mov r15,r10
	lea r15,[r15+r14*8+8H]
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
	mov     rsi, t106
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
	mov rbx,1
	add r14,rbx
	jmp L_181
	
L_182:
	mov rbx,t111
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
	mov r15,rbx
	mov r15,r15
	jmp L_127
	
L_128:
	mov rdi,r8
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
	mov     rsi,  r15
	mov     rdi, t300
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
	mov     rsi, t305
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
	sub    rsp, 1464
	mov rdx,48271
	mov rbx,rdx
	mov qword [gbl+8*3],rbx
	mov rbx,2147483647
	mov rax,rbx
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*6],rbx
	mov qword [gbl+8*4],rax
	mov rbx,  [rsp+8*36]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   3448
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
	 db 12,"Let's start!" ,0

t290:
	 db 1,":" ,0

t305:
	 db 8," step(s)" ,0

t224:
	 db 79,"Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i" ,0

t106:
	 db 1," " ,0

t111:
	 db 0,"" ,0

t300:
	 db 7,"Total: " ,0

t284:
	 db 5,"step " ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

