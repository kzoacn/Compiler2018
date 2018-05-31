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
	inc rax
        shl     rax, 3
        mov     rdi, rax
        call    myalloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-18H]
	inc rax
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
	inc eax
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
	inc eax
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
	inc rax
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
	inc rax
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
	inc rax
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
	inc rax
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
	inc rax
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
	inc rax
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
	sub    rsp, 1472
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
        sub     rdx, 3456
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rbx,0
	mov r10,rbx
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
	mov rbx,r15
	mov qword [rsp+8*4],rbx
	
L_46:
	mov rbx,  [rsp+8*4]
	cmp r10,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_47
	mov rdx,0
	mov rbx,rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*6],rbx
	mov rbx,0
	mov rdx,rbx
	mov rbx,5050
	mov r11,rbx
	mov rbx,0
	mov r8,rbx
	mov qword [rsp+8*8],rdx
	mov qword [rsp+8*7],rax
	mov     rdi, 101
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
	mov r9,r15
	xor rdx, rdx
	mov rax, [gbl+8*13]
	mov rbx, [gbl+8*14]
	cdq
	idiv ebx
	mov  r15, rax
	mov r13,r15
	xor rdx, rdx
	mov rax, [gbl+8*13]
	mov rbx, [gbl+8*14]
	cdq
	idiv ebx
	mov  r15, rdx
	mov r12,r15
	mov rdi,r11
	mov r14,rdi
	
L_82:
	cmp r8,r14
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_83
	mov rbx,1
	mov r15,r8
	add r15,rbx
	imul r15,r8
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
	je L_84
	mov rbx,1
	mov r15,rbx
	jmp L_86
	
L_84:
	mov rbx,1
	add r8,rbx
	jmp L_82
	
L_83:
	mov rbx,0
	mov r15,rbx
	
L_86:
	mov rbx,r15
	mov rdx, 0
	cmp rbx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*26],rbx
	mov qword [rsp+8*27],rdx
	je L_50
	mov rbx,t227
	mov rdi,rbx
	mov r15,rdi
	mov rdi, r15 
	inc rdi
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
	
L_50:
	mov rbx,t232
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*29],rdx
	mov rdi,[rsp+8*29] 
	inc rdi
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	xor rdx, rdx
	mov rax, [gbl+8*30]
	mov rbx,  r13
	cdq
	idiv ebx
	mov  r15, rdx
	mov rbx,  [gbl+8*14]
	mov r14,rbx
	imul r14,r15
	xor rdx, rdx
	mov rax, [gbl+8*30]
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
	mov qword [rsp+8*35],rbx
	je L_88
	mov rdx,  [rsp+8*35]
	mov rbx,rdx
	mov qword [gbl+8*30],rbx
	jmp L_89
	
L_88:
	mov rbx,  [rsp+8*35]
	mov rdx,  [gbl+8*13]
	mov r15,rbx
	add r15,rdx
	mov rax,r15
	mov qword [gbl+8*30],rax
	
L_89:
	mov rbx,  [gbl+8*30]
	mov r15,rbx
	mov rdx,r15
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rax
	mov qword [rsp+8*39],rdx
	mov rdx,0
	mov r15,rdx
	mov rdx,r15
	mov qword [gbl+8*30],rbx
	mov qword [rsp+8*42],rdx
	mov qword [rsp+8*40],rax
	xor rdx, rdx
	mov rax, [gbl+8*30]
	mov rbx,  r13
	cdq
	idiv ebx
	mov  r15, rdx
	mov rbx,  [gbl+8*14]
	mov r14,rbx
	imul r14,r15
	xor rdx, rdx
	mov rax, [gbl+8*30]
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
	mov qword [rsp+8*35],rbx
	je L_92
	mov rdx,  [rsp+8*35]
	mov rbx,rdx
	mov qword [gbl+8*30],rbx
	jmp L_93
	
L_92:
	mov rbx,  [rsp+8*35]
	mov rdx,  [gbl+8*13]
	mov r15,rbx
	add r15,rdx
	mov rax,r15
	mov qword [gbl+8*30],rax
	
L_93:
	mov rbx,  [gbl+8*30]
	mov r15,rbx
	mov rdx,r15
	mov qword [rsp+8*43],rdx
	xor rdx, rdx
	mov rax, [rsp+8*43]
	mov rbx, 10
	cdq
	idiv ebx
	mov [rsp+8*44], rdx
	mov rbx,  [rsp+8*44]
	mov rdx,1
	add rbx,rdx
	mov rax,rbx
	mov rdi,rax
	mov rbx,rdi
	mov qword [rsp+8*46],rbx
	mov qword [gbl+8*45],rax
	mov     rdi, [rsp+8*46]
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword[rsp+8*47], rax
	mov rbx,  [rsp+8*47]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*48],rdx
	mov rdi,[rsp+8*48] 
	inc rdi
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	
L_51:
	mov rbx,  [gbl+8*45]
	mov rdx,1
	mov rax,rbx
	sub rax,rdx
	mov rdx,  [rsp+8*6]
	cmp rdx,rax
	mov rax, 0
	setl al
	mov rbx,  [rsp+8*50]
	add rbx,rbx
	cmp rax, 0
	mov qword [rsp+8*50],rbx
	mov qword [rsp+8*49],rax
	je L_52
	xor rdx, rdx
	mov rax, [gbl+8*30]
	mov rbx,  r13
	cdq
	idiv ebx
	mov  r15, rdx
	mov rbx,  [gbl+8*14]
	mov r14,rbx
	imul r14,r15
	xor rdx, rdx
	mov rax, [gbl+8*30]
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
	mov qword [rsp+8*35],rbx
	je L_96
	mov rdx,  [rsp+8*35]
	mov rbx,rdx
	mov qword [gbl+8*30],rbx
	jmp L_97
	
L_96:
	mov rbx,  [rsp+8*35]
	mov rdx,  [gbl+8*13]
	mov r15,rbx
	add r15,rdx
	mov rax,r15
	mov qword [gbl+8*30],rax
	
L_97:
	mov rbx,  [gbl+8*30]
	mov r15,rbx
	mov rdx,r15
	mov qword [rsp+8*51],rdx
	xor rdx, rdx
	mov rax, [rsp+8*51]
	mov rbx, 10
	cdq
	idiv ebx
	mov [rsp+8*52], rdx
	mov rbx,  [rsp+8*52]
	mov rdx,1
	add rbx,rdx
	mov rax,r9
	mov rdx,  [rsp+8*6]
	mov qword [rsp+8*52],rbx
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*53],rax
	mov rax,  [rsp+8*52]
	mov [rbx],rax
	mov qword [rsp+8*54],rbx
	
L_54:
	mov rbx,r9
	mov rdx,  [rsp+8*6]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*55],rbx
	mov rbx, [rax]
	mov qword [rsp+8*56],rax
	mov rax,  [rsp+8*7]
	mov rdx,rbx
	add rdx,rax
	cmp rdx,r11
	mov rdx, 0
	setg dl
	mov qword [rsp+8*57],rbx
	mov rbx,  [rsp+8*50]
	add rbx,rbx
	cmp rdx, 0
	mov qword [rsp+8*50],rbx
	mov qword [rsp+8*58],rdx
	je L_55
	xor rdx, rdx
	mov rax, [gbl+8*30]
	mov rbx,  r13
	cdq
	idiv ebx
	mov  r15, rdx
	mov rbx,  [gbl+8*14]
	mov r14,rbx
	imul r14,r15
	xor rdx, rdx
	mov rax, [gbl+8*30]
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
	mov qword [rsp+8*35],rbx
	je L_100
	mov rdx,  [rsp+8*35]
	mov rbx,rdx
	mov qword [gbl+8*30],rbx
	jmp L_101
	
L_100:
	mov rbx,  [rsp+8*35]
	mov rdx,  [gbl+8*13]
	mov r15,rbx
	add r15,rdx
	mov rax,r15
	mov qword [gbl+8*30],rax
	
L_101:
	mov rbx,  [gbl+8*30]
	mov r15,rbx
	mov rdx,r15
	mov qword [rsp+8*59],rdx
	xor rdx, rdx
	mov rax, [rsp+8*59]
	mov rbx, 10
	cdq
	idiv ebx
	mov [rsp+8*60], rdx
	mov rbx,  [rsp+8*60]
	mov rdx,1
	add rbx,rdx
	mov rax,r9
	mov rdx,  [rsp+8*6]
	mov qword [rsp+8*60],rbx
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*61],rax
	mov rax,  [rsp+8*60]
	mov [rbx],rax
	mov qword [rsp+8*62],rbx
	jmp L_54
	
L_55:
	mov rbx,r9
	mov rdx,  [rsp+8*6]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*63],rbx
	mov rbx, [rax]
	mov qword [rsp+8*64],rax
	mov rax,  [rsp+8*7]
	mov rdx,rax
	add rdx,rbx
	mov rax,rdx
	mov qword [rsp+8*65],rbx
	mov rbx,  [rsp+8*6]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*6],rbx
	mov qword [rsp+8*7],rax
	jmp L_51
	
L_52:
	mov rbx,  [rsp+8*7]
	mov r14,r11
	sub r14,rbx
	mov rdx,  [gbl+8*45]
	mov rax,1
	mov rbx,rdx
	sub rbx,rax
	mov r15,r9
	lea r15,[r15+rbx*8+8H]
	mov [r15],r14
	mov rbx,0
	mov r14,rbx
	
L_104:
	mov rbx,  [gbl+8*45]
	cmp r14,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_105
	mov r15,r9
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
	inc rsi
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
	jmp L_104
	
L_105:
	mov rbx,t111
	mov rdi,rbx
	mov r15,rdi
	mov rdi, r15 
	inc rdi
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
	mov rdx,0
	mov r14,rdx
	
L_152:
	mov rbx,  [gbl+8*45]
	cmp r14,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_153
	mov rbx,r9
	lea rdx,[rbx+r14*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*85],rbx
	mov rbx,0
	cmp rax,rbx
	mov qword [rsp+8*86],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*88],rdx
	mov qword [rsp+8*87],rax
	je L_154
	mov rbx,1
	mov rdx,r14
	add rdx,rbx
	mov r15,rdx
	mov qword [rsp+8*89],rdx
	
L_155:
	mov rbx,  [gbl+8*45]
	cmp r15,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*91],rdx
	je L_156
	mov rbx,r9
	lea rdx,[rbx+r15*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*92],rbx
	mov rbx,0
	cmp rax,rbx
	mov qword [rsp+8*93],rdx
	mov rdx, 0
	setne dl
	cmp rdx, 0
	mov qword [rsp+8*95],rdx
	mov qword [rsp+8*94],rax
	je L_157
	mov rsi,r15
	mov rdi,r14
	mov r12,rdi
	mov r11,rsi
	mov r15,r9
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	mov rbx,r15
	mov r15,r9
	lea r15,[r15+r11*8+8H]
	mov r13, [r15]
	mov r15,r9
	lea r15,[r15+r12*8+8H]
	mov [r15],r13
	mov r15,r9
	lea r15,[r15+r11*8+8H]
	mov [r15],rbx
	mov rdx,0
	mov r15,rdx
	mov qword [rsp+8*102],rbx
	jmp L_156
	
L_157:
	mov rbx,1
	add r15,rbx
	jmp L_155
	
L_156:
	
L_154:
	mov rbx,1
	add r14,rbx
	jmp L_152
	
L_153:
	mov rbx,0
	mov r14,rbx
	
L_162:
	mov rbx,  [gbl+8*45]
	cmp r14,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_163
	mov r15,r9
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	mov rbx,0
	cmp r15,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_164
	mov rbx,r14
	mov qword [gbl+8*45],rbx
	jmp L_163
	
L_164:
	mov rbx,1
	add r14,rbx
	jmp L_162
	
L_163:
	mov rbx,0
	mov r15,rbx
	
L_56:
	mov     rdi, 101
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
	mov r14,r15
	mov rbx,  [gbl+8*45]
	cmp rbx,r8
	mov r15, 0
	setne r15B
	cmp r15, 0
	je L_168
	mov rbx,0
	mov r15,rbx
	jmp L_170
	
L_168:
	mov rbx,0
	mov r15,rbx
	
L_171:
	mov rbx,  [gbl+8*45]
	cmp r15,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*124],rdx
	je L_172
	mov rbx,r9
	lea rdx,[rbx+r15*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*125],rbx
	mov rbx,r14
	mov qword [rsp+8*126],rdx
	lea rdx,[rbx+r15*8+8H]
	mov [rdx],rax
	mov qword [rsp+8*128],rbx
	mov rbx,1
	add r15,rbx
	mov qword [rsp+8*129],rdx
	mov qword [rsp+8*127],rax
	jmp L_171
	
L_172:
	mov rbx,0
	mov r12,rbx
	
L_174:
	mov rbx,  [gbl+8*45]
	mov rdx,1
	mov rax,rbx
	sub rax,rdx
	cmp r12,rax
	mov rax, 0
	setl al
	mov rdx,  [rsp+8*50]
	add rdx,rdx
	cmp rax, 0
	mov qword [rsp+8*50],rdx
	mov qword [rsp+8*131],rax
	je L_176
	mov rbx,1
	mov rdx,r12
	add rdx,rbx
	mov r15,rdx
	mov qword [rsp+8*132],rdx
	
L_177:
	mov rbx,  [gbl+8*45]
	cmp r15,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*133],rdx
	je L_178
	mov rbx,r14
	lea rdx,[rbx+r12*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*134],rbx
	mov rbx,r14
	mov qword [rsp+8*135],rdx
	lea rdx,[rbx+r15*8+8H]
	mov qword [rsp+8*137],rbx
	mov rbx, [rdx]
	cmp rax,rbx
	mov qword [rsp+8*138],rdx
	mov rdx, 0
	setg dl
	cmp rdx, 0
	mov qword [rsp+8*139],rbx
	mov qword [rsp+8*140],rdx
	mov qword [rsp+8*136],rax
	je L_179
	mov rbx,r14
	lea rdx,[rbx+r12*8+8H]
	mov rax, [rdx]
	mov r13,rax
	mov qword [rsp+8*141],rbx
	mov rbx,r14
	mov qword [rsp+8*142],rdx
	lea rdx,[rbx+r15*8+8H]
	mov qword [rsp+8*145],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*146],rdx
	mov rdx,r14
	mov qword [rsp+8*143],rax
	lea rax,[rdx+r12*8+8H]
	mov [rax],rbx
	mov qword [rsp+8*147],rbx
	mov rbx,r14
	mov qword [rsp+8*148],rdx
	lea rdx,[rbx+r15*8+8H]
	mov [rdx],r13
	mov qword [rsp+8*150],rbx
	mov qword [rsp+8*151],rdx
	mov qword [rsp+8*149],rax
	
L_179:
	mov rbx,1
	add r15,rbx
	jmp L_177
	
L_178:
	mov rbx,1
	add r12,rbx
	jmp L_174
	
L_176:
	mov rbx,0
	mov r12,rbx
	
L_182:
	mov rbx,  [gbl+8*45]
	cmp r12,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*152],rdx
	je L_183
	mov rbx,r14
	lea rdx,[rbx+r12*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*153],rbx
	mov rbx,1
	mov qword [rsp+8*154],rdx
	mov rdx,r12
	add rdx,rbx
	cmp rax,rdx
	mov rbx, 0
	setne bl
	cmp rbx, 0
	mov qword [rsp+8*157],rbx
	mov qword [rsp+8*156],rdx
	mov qword [rsp+8*155],rax
	je L_184
	mov rbx,0
	mov r15,rbx
	jmp L_170
	
L_184:
	mov rbx,1
	add r12,rbx
	jmp L_182
	
L_183:
	mov rbx,1
	mov r15,rbx
	
L_170:
	cmp r15, 0
	sete r15B
	cmp r15, 0
	je L_57
	mov rbx,  [rsp+8*8]
	mov rdx,1
	add rbx,rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*8],rbx
	mov qword [rsp+8*160],rax
	
L_109:
	mov rbx,  [rsp+8*160]
	mov rdx,  [gbl+8*45]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_110
	mov r15,r9
	mov rbx,  [rsp+8*160]
	lea r14,[r15+rbx*8+8H]
	mov r15, [r14]
	mov rdx,1
	sub r15,rdx
	mov [r14],r15
	mov rax,1
	mov r15,rbx
	add r15,rax
	mov rbx,r15
	mov qword [rsp+8*160],rbx
	jmp L_109
	
L_110:
	mov r15,r9
	mov rbx,  [gbl+8*45]
	lea r15,[r15+rbx*8+8H]
	mov [r15],rbx
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov rax,0
	mov r15,rax
	mov rdx,0
	mov r14,rdx
	mov qword [gbl+8*45],rbx
	
L_186:
	mov rbx,  [gbl+8*45]
	cmp r14,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_187
	mov rbx,r9
	lea rdx,[rbx+r14*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*85],rbx
	mov rbx,0
	cmp rax,rbx
	mov qword [rsp+8*86],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*88],rdx
	mov qword [rsp+8*87],rax
	je L_188
	mov rbx,1
	mov rdx,r14
	add rdx,rbx
	mov r15,rdx
	mov qword [rsp+8*89],rdx
	
L_189:
	mov rbx,  [gbl+8*45]
	cmp r15,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*91],rdx
	je L_190
	mov rbx,r9
	lea rdx,[rbx+r15*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*92],rbx
	mov rbx,0
	cmp rax,rbx
	mov qword [rsp+8*93],rdx
	mov rdx, 0
	setne dl
	cmp rdx, 0
	mov qword [rsp+8*95],rdx
	mov qword [rsp+8*94],rax
	je L_191
	mov rsi,r15
	mov rdi,r14
	mov r12,rdi
	mov r11,rsi
	mov r15,r9
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	mov rbx,r15
	mov r15,r9
	lea r15,[r15+r11*8+8H]
	mov r13, [r15]
	mov r15,r9
	lea r15,[r15+r12*8+8H]
	mov [r15],r13
	mov r15,r9
	lea r15,[r15+r11*8+8H]
	mov [r15],rbx
	mov rdx,0
	mov r15,rdx
	mov qword [rsp+8*102],rbx
	jmp L_190
	
L_191:
	mov rbx,1
	add r15,rbx
	jmp L_189
	
L_190:
	
L_188:
	mov rbx,1
	add r14,rbx
	jmp L_186
	
L_187:
	mov rbx,0
	mov r14,rbx
	
L_196:
	mov rbx,  [gbl+8*45]
	cmp r14,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_197
	mov r15,r9
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	mov rbx,0
	cmp r15,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_198
	mov rbx,r14
	mov qword [gbl+8*45],rbx
	jmp L_197
	
L_198:
	mov rbx,1
	add r14,rbx
	jmp L_196
	
L_197:
	mov rbx,0
	mov r15,rbx
	jmp L_56
	
L_57:
	mov rbx,  [rsp+8*8]
	mov rdi,rbx
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
	mov     rdi, t293
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
	mov     rsi, t298
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
	inc rdi
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
	add r10,rbx
	jmp L_46
	
L_47:
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1472
	mov rdx,48271
	mov rbx,rdx
	mov qword [gbl+8*14],rbx
	mov rbx,2147483647
	mov rax,rbx
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*30],rbx
	mov qword [gbl+8*13],rax
	mov rbx,  [rsp+8*176]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   3456
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

t106:
	 db 1," " ,0

t227:
	 db 79,"Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i" ,0

t111:
	 db 0,"" ,0

t232:
	 db 12,"Let's start!" ,0

t298:
	 db 8," step(s)" ,0

t293:
	 db 7,"Total: " ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

