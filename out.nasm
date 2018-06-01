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
	sub    rsp, 1184
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
        sub     rdx, 3168
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
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
	mov qword [rsp+8*3],rbx
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
	mov qword [rsp+8*5],rbx
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
	mov qword [rsp+8*7],rbx
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
	mov r12,r15
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
	mov qword [rsp+8*11],rbx
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
	mov r11,r15
	mov rdx,30
	mov rbx,rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*14],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*15],rax
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*16],rdx
	mov rdx,0
	mov rax,rdx
	mov rdx,  [rsp+8*3]
	mov r9,rdx
	mov qword [rsp+8*17],rbx
	mov qword [rsp+8*18],rax
	
L_12:
	mov rbx,  [rsp+8*5]
	cmp r9,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_13
	mov rbx,  [rsp+8*7]
	mov r8,rbx
	
L_15:
	cmp r8,r12
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_16
	mov rdx,  [rsp+8*11]
	mov rbx,rdx
	mov qword [rsp+8*23],rbx
	
L_18:
	mov rbx,  [rsp+8*23]
	cmp rbx,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_19
	mov rdx,  [rsp+8*23]
	mov rbx,rdx
	mov rax,  [rsp+8*14]
	mov rsi,rax
	mov qword [arg+8*2],rbx
	mov rbx,  [rsp+8*3]
	mov rdi,rbx
	mov r13,rdi
	mov r14,rsi
	mov rbx,  [arg+8*2]
	mov r15,rbx
	mov rdx,31
	mov rax,r15
	and rax,rdx
	mov r10,rax
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov rbx,rsi
	mov rdx,1
	add r15,rdx
	mov qword [rsp+8*31],rax
	mov rax,r15
	mov qword [rsp+8*34],rbx
	mov rbx,0
	mov r13,rbx
	mov qword [rsp+8*36],rax
	
L_365:
	mov rbx,  [rsp+8*34]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	cmp r13,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*38],rax
	je L_366
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*36]
	mov rdi,rdx
	mov rax,rdi
	mov r15,rsi
	mov r14,rax
	mov rcx,r15
	shl r14,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*39],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	and r14,r15
	mov qword [rsp+8*42],rax
	mov rax,r14
	mov qword [rsp+8*43],rbx
	mov rbx,rax
	mov qword [rsp+8*45],rdx
	mov rdx,  [rsp+8*36]
	mov r15,rdx
	xor r15,rbx
	mov rdx,r15
	mov qword [rsp+8*47],rax
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r14,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rdx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*51],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rdx,r15
	mov r15,rdx
	mov qword [rsp+8*42],rbx
	mov rbx,r15
	mov qword [rsp+8*43],rax
	mov rax,  [rsp+8*51]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*45],rdx
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r14
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*53],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov r15,rax
	mov qword [rsp+8*42],rbx
	mov rbx,  [rsp+8*53]
	and r15,rbx
	mov qword [rsp+8*43],rdx
	mov rdx,r15
	mov qword [rsp+8*45],rax
	mov rax,rdx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*58],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*59],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rbx
	mov qword [rsp+8*60],rdx
	mov rdx,rdi
	mov r15,rsi
	mov r14,rdx
	mov rcx,r15
	shl r14,cl
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*39],rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rbx,r15
	mov r15,rbx
	and r14,r15
	mov qword [rsp+8*42],rdx
	mov rdx,r14
	mov qword [rsp+8*43],rax
	mov rax,rdx
	mov qword [rsp+8*45],rbx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*47],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*61],rax
	mov rax,r13
	mov qword [rsp+8*36],rbx
	mov rbx,1
	add r13,rbx
	mov qword [rsp+8*62],rdx
	mov qword [rsp+8*63],rax
	jmp L_365
	
L_366:
	mov rbx,  [rsp+8*36]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*64],rax
	mov rax,rdx
	mov rsi,r10
	mov rdi,rax
	mov qword [rsp+8*65],rbx
	mov rbx,rdi
	mov r15,rsi
	mov r14,rbx
	mov rcx,r15
	shl r14,cl
	mov qword [rsp+8*66],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*67],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*39],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov r15,rax
	and r14,r15
	mov qword [rsp+8*42],rbx
	mov rbx,r14
	mov qword [rsp+8*43],rdx
	mov rdx,rbx
	mov qword [rsp+8*45],rax
	mov rax,32
	mov qword [rsp+8*47],rbx
	mov rbx,rax
	sub rbx,r10
	mov rsi,rbx
	mov qword [rsp+8*68],rdx
	mov rdx,  [rsp+8*67]
	mov rdi,rdx
	mov r14,rdi
	mov rax,rsi
	mov qword [rsp+8*69],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*51],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	mov qword [rsp+8*42],rax
	mov rax,r15
	mov qword [rsp+8*43],rbx
	mov rbx,  [rsp+8*51]
	mov r15,rax
	mov rcx,rbx
	shr r15,cl
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*45],rdx
	mov rdx,1
	add r15,rdx
	mov rax,r15
	mov r15,r14
	mov rcx,rbx
	shr r15,cl
	and r15,rax
	mov rax,r15
	mov rdx,65535
	mov rsi,rdx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*53],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	mov qword [rsp+8*42],rax
	mov rax,  [rsp+8*53]
	and r15,rax
	mov qword [rsp+8*43],rdx
	mov rdx,r15
	mov qword [rsp+8*45],rbx
	mov rbx,rdx
	mov rax,  [rsp+8*68]
	mov qword [rsp+8*58],rdx
	mov rdx,rax
	or rdx,rbx
	mov qword [rsp+8*70],rbx
	mov rbx,rdx
	mov r15,rbx
	mov rax,r15
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*72],rbx
	mov rbx,  [rsp+8*23]
	mov rdx,rbx
	mov qword [rsp+8*74],rax
	mov rax,  [rsp+8*14]
	mov rsi,rax
	mov rdi,r9
	mov r13,rdi
	mov r14,rsi
	mov r15,rdx
	mov rbx,31
	mov rax,r15
	and rax,rbx
	mov r10,rax
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov qword [arg+8*2],rdx
	mov rdx,rsi
	mov rbx,1
	add r15,rbx
	mov qword [rsp+8*31],rax
	mov rax,r15
	mov qword [rsp+8*34],rdx
	mov rdx,0
	mov r13,rdx
	mov qword [rsp+8*36],rax
	
L_396:
	mov rbx,  [rsp+8*34]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	cmp r13,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*38],rax
	je L_397
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*36]
	mov rdi,rdx
	mov rax,rdi
	mov r15,rsi
	mov r14,rax
	mov rcx,r15
	shl r14,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*39],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	and r14,r15
	mov qword [rsp+8*42],rax
	mov rax,r14
	mov qword [rsp+8*43],rbx
	mov rbx,rax
	mov qword [rsp+8*45],rdx
	mov rdx,  [rsp+8*36]
	mov r15,rdx
	xor r15,rbx
	mov rdx,r15
	mov qword [rsp+8*47],rax
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r14,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rdx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*51],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rdx,r15
	mov r15,rdx
	mov qword [rsp+8*42],rbx
	mov rbx,r15
	mov qword [rsp+8*43],rax
	mov rax,  [rsp+8*51]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*45],rdx
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r14
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*53],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov r15,rax
	mov qword [rsp+8*42],rbx
	mov rbx,  [rsp+8*53]
	and r15,rbx
	mov qword [rsp+8*43],rdx
	mov rdx,r15
	mov qword [rsp+8*45],rax
	mov rax,rdx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*58],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*59],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rbx
	mov qword [rsp+8*60],rdx
	mov rdx,rdi
	mov r15,rsi
	mov r14,rdx
	mov rcx,r15
	shl r14,cl
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*39],rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rbx,r15
	mov r15,rbx
	and r14,r15
	mov qword [rsp+8*42],rdx
	mov rdx,r14
	mov qword [rsp+8*43],rax
	mov rax,rdx
	mov qword [rsp+8*45],rbx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*47],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*61],rax
	mov rax,r13
	mov qword [rsp+8*36],rbx
	mov rbx,1
	add r13,rbx
	mov qword [rsp+8*62],rdx
	mov qword [rsp+8*63],rax
	jmp L_396
	
L_397:
	mov rbx,  [rsp+8*36]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*64],rax
	mov rax,rdx
	mov rsi,r10
	mov rdi,rax
	mov qword [rsp+8*65],rbx
	mov rbx,rdi
	mov r15,rsi
	mov r14,rbx
	mov rcx,r15
	shl r14,cl
	mov qword [rsp+8*66],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*67],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*39],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov r15,rax
	and r14,r15
	mov qword [rsp+8*42],rbx
	mov rbx,r14
	mov qword [rsp+8*43],rdx
	mov rdx,rbx
	mov qword [rsp+8*45],rax
	mov rax,32
	mov qword [rsp+8*47],rbx
	mov rbx,rax
	sub rbx,r10
	mov rsi,rbx
	mov qword [rsp+8*68],rdx
	mov rdx,  [rsp+8*67]
	mov rdi,rdx
	mov r14,rdi
	mov rax,rsi
	mov qword [rsp+8*69],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*51],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	mov qword [rsp+8*42],rax
	mov rax,r15
	mov qword [rsp+8*43],rbx
	mov rbx,  [rsp+8*51]
	mov r15,rax
	mov rcx,rbx
	shr r15,cl
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*45],rdx
	mov rdx,1
	add r15,rdx
	mov rax,r15
	mov r15,r14
	mov rcx,rbx
	shr r15,cl
	and r15,rax
	mov rax,r15
	mov rdx,65535
	mov rsi,rdx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*53],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	mov qword [rsp+8*42],rax
	mov rax,  [rsp+8*53]
	and r15,rax
	mov qword [rsp+8*43],rdx
	mov rdx,r15
	mov qword [rsp+8*45],rbx
	mov rbx,rdx
	mov rax,  [rsp+8*68]
	mov qword [rsp+8*58],rdx
	mov rdx,rax
	or rdx,rbx
	mov qword [rsp+8*70],rbx
	mov rbx,rdx
	mov r15,rbx
	mov rax,r15
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*72],rbx
	mov rbx,  [rsp+8*23]
	mov rdx,rbx
	mov qword [rsp+8*76],rax
	mov rax,  [rsp+8*14]
	mov rsi,rax
	mov rdi,r8
	mov r13,rdi
	mov r14,rsi
	mov r15,rdx
	mov rbx,31
	mov rax,r15
	and rax,rbx
	mov r10,rax
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov qword [arg+8*2],rdx
	mov rdx,rsi
	mov rbx,1
	add r15,rbx
	mov qword [rsp+8*31],rax
	mov rax,r15
	mov qword [rsp+8*34],rdx
	mov rdx,0
	mov r13,rdx
	mov qword [rsp+8*36],rax
	
L_427:
	mov rbx,  [rsp+8*34]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	cmp r13,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*38],rax
	je L_428
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*36]
	mov rdi,rdx
	mov rax,rdi
	mov r15,rsi
	mov r14,rax
	mov rcx,r15
	shl r14,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*39],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	and r14,r15
	mov qword [rsp+8*42],rax
	mov rax,r14
	mov qword [rsp+8*43],rbx
	mov rbx,rax
	mov qword [rsp+8*45],rdx
	mov rdx,  [rsp+8*36]
	mov r15,rdx
	xor r15,rbx
	mov rdx,r15
	mov qword [rsp+8*47],rax
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r14,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rdx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*51],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rdx,r15
	mov r15,rdx
	mov qword [rsp+8*42],rbx
	mov rbx,r15
	mov qword [rsp+8*43],rax
	mov rax,  [rsp+8*51]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*45],rdx
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r14
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*53],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov r15,rax
	mov qword [rsp+8*42],rbx
	mov rbx,  [rsp+8*53]
	and r15,rbx
	mov qword [rsp+8*43],rdx
	mov rdx,r15
	mov qword [rsp+8*45],rax
	mov rax,rdx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*58],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*59],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rbx
	mov qword [rsp+8*60],rdx
	mov rdx,rdi
	mov r15,rsi
	mov r14,rdx
	mov rcx,r15
	shl r14,cl
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*39],rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rbx,r15
	mov r15,rbx
	and r14,r15
	mov qword [rsp+8*42],rdx
	mov rdx,r14
	mov qword [rsp+8*43],rax
	mov rax,rdx
	mov qword [rsp+8*45],rbx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*47],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*61],rax
	mov rax,r13
	mov qword [rsp+8*36],rbx
	mov rbx,1
	add r13,rbx
	mov qword [rsp+8*62],rdx
	mov qword [rsp+8*63],rax
	jmp L_427
	
L_428:
	mov rbx,  [rsp+8*36]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*64],rax
	mov rax,rdx
	mov rsi,r10
	mov rdi,rax
	mov qword [rsp+8*65],rbx
	mov rbx,rdi
	mov r15,rsi
	mov r14,rbx
	mov rcx,r15
	shl r14,cl
	mov qword [rsp+8*66],rdx
	mov rdx,65535
	mov rsi,rdx
	mov qword [rsp+8*67],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*39],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov r15,rax
	and r14,r15
	mov qword [rsp+8*42],rbx
	mov rbx,r14
	mov qword [rsp+8*43],rdx
	mov rdx,rbx
	mov qword [rsp+8*45],rax
	mov rax,32
	mov qword [rsp+8*47],rbx
	mov rbx,rax
	sub rbx,r10
	mov rsi,rbx
	mov qword [rsp+8*68],rdx
	mov rdx,  [rsp+8*67]
	mov rdi,rdx
	mov r14,rdi
	mov rax,rsi
	mov qword [rsp+8*69],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*51],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	mov qword [rsp+8*42],rax
	mov rax,r15
	mov qword [rsp+8*43],rbx
	mov rbx,  [rsp+8*51]
	mov r15,rax
	mov rcx,rbx
	shr r15,cl
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*45],rdx
	mov rdx,1
	add r15,rdx
	mov rax,r15
	mov r15,r14
	mov rcx,rbx
	shr r15,cl
	and r15,rax
	mov rax,r15
	mov rdx,65535
	mov rsi,rdx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*53],rax
	mov rax,rdi
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rbx,r15
	mov r15,rbx
	mov qword [rsp+8*42],rax
	mov rax,  [rsp+8*53]
	and r15,rax
	mov qword [rsp+8*43],rdx
	mov rdx,r15
	mov qword [rsp+8*45],rbx
	mov rbx,rdx
	mov rax,  [rsp+8*68]
	mov qword [rsp+8*58],rdx
	mov rdx,rax
	or rdx,rbx
	mov qword [rsp+8*70],rbx
	mov rbx,rdx
	mov r15,rbx
	mov rax,r15
	mov qword [rsp+8*71],rdx
	mov rdx,r9
	xor rdx,r8
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*78],rax
	mov rax,  [rsp+8*23]
	mov rbx,rax
	mov qword [rsp+8*79],rdx
	mov rdx,  [rsp+8*14]
	mov rsi,rdx
	mov rdx,  [rsp+8*79]
	mov rdi,rdx
	mov r13,rdi
	mov r14,rsi
	mov r15,rbx
	mov qword [arg+8*2],rbx
	mov rbx,31
	mov rdx,r15
	and rdx,rbx
	mov r10,rdx
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov rbx,rsi
	mov rdx,1
	add r15,rdx
	mov rax,r15
	mov qword [rsp+8*34],rbx
	mov rbx,0
	mov r13,rbx
	mov qword [rsp+8*36],rax
	
L_458:
	mov rbx,  [rsp+8*34]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	cmp r13,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*38],rax
	je L_459
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*36]
	mov rdi,rdx
	mov rax,rdi
	mov r15,rsi
	mov r14,rax
	mov rcx,r15
	shl r14,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*39],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	and r14,r15
	mov qword [rsp+8*42],rax
	mov rax,r14
	mov qword [rsp+8*43],rbx
	mov rbx,rax
	mov qword [rsp+8*45],rdx
	mov rdx,  [rsp+8*36]
	mov r15,rdx
	xor r15,rbx
	mov rdx,r15
	mov qword [rsp+8*47],rax
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r14,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rdx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*51],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rdx,r15
	mov r15,rdx
	mov qword [rsp+8*42],rbx
	mov rbx,r15
	mov qword [rsp+8*43],rax
	mov rax,  [rsp+8*51]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*45],rdx
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r14
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*53],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov r15,rax
	mov qword [rsp+8*42],rbx
	mov rbx,  [rsp+8*53]
	and r15,rbx
	mov qword [rsp+8*43],rdx
	mov rdx,r15
	mov qword [rsp+8*45],rax
	mov rax,rdx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*58],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*59],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rbx
	mov qword [rsp+8*60],rdx
	mov rdx,rdi
	mov r15,rsi
	mov r14,rdx
	mov rcx,r15
	shl r14,cl
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*39],rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rbx,r15
	mov r15,rbx
	and r14,r15
	mov qword [rsp+8*42],rdx
	mov rdx,r14
	mov qword [rsp+8*43],rax
	mov rax,rdx
	mov qword [rsp+8*45],rbx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*47],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*61],rax
	mov rax,r13
	mov qword [rsp+8*36],rbx
	mov rbx,1
	add r13,rbx
	mov qword [rsp+8*62],rdx
	mov qword [rsp+8*63],rax
	jmp L_458
	
L_459:
	mov rbx,  [rsp+8*36]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*64],rax
	mov rax,rdx
	mov rsi,r10
	mov rdi,rax
	mov qword [rsp+8*66],rdx
	mov rdx,rdi
	mov r15,rsi
	mov r14,rdx
	mov rcx,r15
	shl r14,cl
	mov qword [rsp+8*65],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*67],rax
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*39],rdx
	mov rdx,rdi
	mov rbx,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rax,r15
	mov r15,rax
	and r14,r15
	mov qword [rsp+8*42],rdx
	mov rdx,r14
	mov qword [rsp+8*43],rbx
	mov rbx,rdx
	mov qword [rsp+8*45],rax
	mov rax,32
	mov qword [rsp+8*68],rbx
	mov rbx,rax
	sub rbx,r10
	mov rsi,rbx
	mov rbx,  [rsp+8*67]
	mov rdi,rbx
	mov r14,rdi
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*47],rdx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*51],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rdx,r15
	mov r15,rdx
	mov qword [rsp+8*42],rbx
	mov rbx,r15
	mov qword [rsp+8*43],rax
	mov rax,  [rsp+8*51]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*45],rdx
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r14
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*53],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov r15,rax
	mov qword [rsp+8*42],rbx
	mov rbx,  [rsp+8*53]
	and r15,rbx
	mov qword [rsp+8*43],rdx
	mov rdx,r15
	mov qword [rsp+8*45],rax
	mov rax,rdx
	mov rbx,  [rsp+8*68]
	mov qword [rsp+8*58],rdx
	mov rdx,rbx
	or rdx,rax
	mov rbx,rdx
	mov rdx,rbx
	mov qword [rsp+8*72],rbx
	mov rbx,rdx
	mov qword [rsp+8*80],rdx
	mov rdx,1
	mov rsi,rdx
	mov rdx,  [rsp+8*23]
	mov rdi,rdx
	mov r15,rdi
	mov qword [rsp+8*70],rax
	mov rax,rsi
	mov qword [rsp+8*81],rbx
	mov rbx,1
	add r15,rbx
	mov rdx,r15
	mov qword [rsp+8*34],rax
	mov rax,0
	mov r13,rax
	mov qword [rsp+8*36],rdx
	
L_182:
	mov rbx,  [rsp+8*34]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	cmp r13,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*38],rax
	je L_183
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*36]
	mov rdi,rdx
	mov rax,rdi
	mov r15,rsi
	mov r14,rax
	mov rcx,r15
	shl r14,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*39],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	and r14,r15
	mov qword [rsp+8*42],rax
	mov rax,r14
	mov qword [rsp+8*43],rbx
	mov rbx,rax
	mov qword [rsp+8*45],rdx
	mov rdx,  [rsp+8*36]
	mov r15,rdx
	xor r15,rbx
	mov rdx,r15
	mov qword [rsp+8*47],rax
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r14,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rdx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*51],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rdx,r15
	mov r15,rdx
	mov qword [rsp+8*42],rbx
	mov rbx,r15
	mov qword [rsp+8*43],rax
	mov rax,  [rsp+8*51]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*45],rdx
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r14
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*53],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov r15,rax
	mov qword [rsp+8*42],rbx
	mov rbx,  [rsp+8*53]
	and r15,rbx
	mov qword [rsp+8*43],rdx
	mov rdx,r15
	mov qword [rsp+8*45],rax
	mov rax,rdx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*58],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*59],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rbx
	mov qword [rsp+8*60],rdx
	mov rdx,rdi
	mov r15,rsi
	mov r14,rdx
	mov rcx,r15
	shl r14,cl
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*39],rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rbx,r15
	mov r15,rbx
	and r14,r15
	mov qword [rsp+8*42],rdx
	mov rdx,r14
	mov qword [rsp+8*43],rax
	mov rax,rdx
	mov qword [rsp+8*45],rbx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*47],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*61],rax
	mov rax,r13
	mov qword [rsp+8*36],rbx
	mov rbx,1
	add r13,rbx
	mov qword [rsp+8*62],rdx
	mov qword [rsp+8*63],rax
	jmp L_182
	
L_183:
	mov rbx,  [rsp+8*36]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*64],rax
	mov rax,1
	mov rsi,rax
	mov rdi,r8
	mov r15,rdi
	mov rax,rsi
	mov qword [rsp+8*65],rbx
	mov rbx,1
	add r15,rbx
	mov qword [rsp+8*82],rdx
	mov rdx,r15
	mov qword [rsp+8*34],rax
	mov rax,0
	mov r13,rax
	mov qword [rsp+8*36],rdx
	
L_201:
	mov rbx,  [rsp+8*34]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	cmp r13,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*38],rax
	je L_202
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*36]
	mov rdi,rdx
	mov rax,rdi
	mov r15,rsi
	mov r14,rax
	mov rcx,r15
	shl r14,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*39],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	and r14,r15
	mov qword [rsp+8*42],rax
	mov rax,r14
	mov qword [rsp+8*43],rbx
	mov rbx,rax
	mov qword [rsp+8*45],rdx
	mov rdx,  [rsp+8*36]
	mov r15,rdx
	xor r15,rbx
	mov rdx,r15
	mov qword [rsp+8*47],rax
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r14,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rdx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*51],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rdx,r15
	mov r15,rdx
	mov qword [rsp+8*42],rbx
	mov rbx,r15
	mov qword [rsp+8*43],rax
	mov rax,  [rsp+8*51]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*45],rdx
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r14
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*53],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov r15,rax
	mov qword [rsp+8*42],rbx
	mov rbx,  [rsp+8*53]
	and r15,rbx
	mov qword [rsp+8*43],rdx
	mov rdx,r15
	mov qword [rsp+8*45],rax
	mov rax,rdx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*58],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*59],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rbx
	mov qword [rsp+8*60],rdx
	mov rdx,rdi
	mov r15,rsi
	mov r14,rdx
	mov rcx,r15
	shl r14,cl
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*39],rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rbx,r15
	mov r15,rbx
	and r14,r15
	mov qword [rsp+8*42],rdx
	mov rdx,r14
	mov qword [rsp+8*43],rax
	mov rax,rdx
	mov qword [rsp+8*45],rbx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*47],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*61],rax
	mov rax,r13
	mov qword [rsp+8*36],rbx
	mov rbx,1
	add r13,rbx
	mov qword [rsp+8*62],rdx
	mov qword [rsp+8*63],rax
	jmp L_201
	
L_202:
	mov rbx,  [rsp+8*36]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*64],rax
	mov rax,  [rsp+8*82]
	mov qword [rsp+8*65],rbx
	mov rbx,rax
	xor rbx,rdx
	mov qword [rsp+8*83],rdx
	mov rdx,1
	mov rsi,rdx
	mov rdi,r9
	mov r15,rdi
	mov rdx,rsi
	mov rax,1
	add r15,rax
	mov qword [rsp+8*84],rbx
	mov rbx,r15
	mov qword [rsp+8*34],rdx
	mov rdx,0
	mov r13,rdx
	mov qword [rsp+8*36],rbx
	
L_220:
	mov rbx,  [rsp+8*34]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	cmp r13,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*38],rax
	je L_221
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*36]
	mov rdi,rdx
	mov rax,rdi
	mov r15,rsi
	mov r14,rax
	mov rcx,r15
	shl r14,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*39],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	and r14,r15
	mov qword [rsp+8*42],rax
	mov rax,r14
	mov qword [rsp+8*43],rbx
	mov rbx,rax
	mov qword [rsp+8*45],rdx
	mov rdx,  [rsp+8*36]
	mov r15,rdx
	xor r15,rbx
	mov rdx,r15
	mov qword [rsp+8*47],rax
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r14,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rdx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*51],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rdx,r15
	mov r15,rdx
	mov qword [rsp+8*42],rbx
	mov rbx,r15
	mov qword [rsp+8*43],rax
	mov rax,  [rsp+8*51]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*45],rdx
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r14
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*53],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov r15,rax
	mov qword [rsp+8*42],rbx
	mov rbx,  [rsp+8*53]
	and r15,rbx
	mov qword [rsp+8*43],rdx
	mov rdx,r15
	mov qword [rsp+8*45],rax
	mov rax,rdx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*58],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*59],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rbx
	mov qword [rsp+8*60],rdx
	mov rdx,rdi
	mov r15,rsi
	mov r14,rdx
	mov rcx,r15
	shl r14,cl
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*39],rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rbx,r15
	mov r15,rbx
	and r14,r15
	mov qword [rsp+8*42],rdx
	mov rdx,r14
	mov qword [rsp+8*43],rax
	mov rax,rdx
	mov qword [rsp+8*45],rbx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*47],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*61],rax
	mov rax,r13
	mov qword [rsp+8*36],rbx
	mov rbx,1
	add r13,rbx
	mov qword [rsp+8*62],rdx
	mov qword [rsp+8*63],rax
	jmp L_220
	
L_221:
	mov rbx,  [rsp+8*36]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*64],rax
	mov rax,  [rsp+8*84]
	xor rax,rdx
	mov qword [rsp+8*85],rdx
	mov rdx,rax
	mov rax,  [rsp+8*74]
	mov qword [rsp+8*65],rbx
	mov rbx,rax
	xor rbx,rdx
	mov rax,1
	mov rsi,rax
	mov rdi,rbx
	mov r15,rdi
	mov rbx,rsi
	mov rax,1
	add r15,rax
	mov qword [rsp+8*86],rdx
	mov rdx,r15
	mov qword [rsp+8*34],rbx
	mov rbx,0
	mov r13,rbx
	mov qword [rsp+8*36],rdx
	
L_239:
	mov rbx,  [rsp+8*34]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	cmp r13,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*38],rax
	je L_240
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*36]
	mov rdi,rdx
	mov rax,rdi
	mov r15,rsi
	mov r14,rax
	mov rcx,r15
	shl r14,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*39],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	and r14,r15
	mov qword [rsp+8*42],rax
	mov rax,r14
	mov qword [rsp+8*43],rbx
	mov rbx,rax
	mov qword [rsp+8*45],rdx
	mov rdx,  [rsp+8*36]
	mov r15,rdx
	xor r15,rbx
	mov rdx,r15
	mov qword [rsp+8*47],rax
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r14,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rdx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*51],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rdx,r15
	mov r15,rdx
	mov qword [rsp+8*42],rbx
	mov rbx,r15
	mov qword [rsp+8*43],rax
	mov rax,  [rsp+8*51]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*45],rdx
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r14
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*53],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov r15,rax
	mov qword [rsp+8*42],rbx
	mov rbx,  [rsp+8*53]
	and r15,rbx
	mov qword [rsp+8*43],rdx
	mov rdx,r15
	mov qword [rsp+8*45],rax
	mov rax,rdx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*58],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*59],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rbx
	mov qword [rsp+8*60],rdx
	mov rdx,rdi
	mov r15,rsi
	mov r14,rdx
	mov rcx,r15
	shl r14,cl
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*39],rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rbx,r15
	mov r15,rbx
	and r14,r15
	mov qword [rsp+8*42],rdx
	mov rdx,r14
	mov qword [rsp+8*43],rax
	mov rax,rdx
	mov qword [rsp+8*45],rbx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*47],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*61],rax
	mov rax,r13
	mov qword [rsp+8*36],rbx
	mov rbx,1
	add r13,rbx
	mov qword [rsp+8*62],rdx
	mov qword [rsp+8*63],rax
	jmp L_239
	
L_240:
	mov rbx,  [rsp+8*36]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*64],rax
	mov rax,  [rsp+8*15]
	mov qword [rsp+8*65],rbx
	mov rbx,rax
	add rbx,rdx
	mov rax,rbx
	mov rbx,  [rsp+8*76]
	mov qword [rsp+8*88],rdx
	mov rdx,  [rsp+8*86]
	mov r15,rbx
	xor r15,rdx
	mov rbx,1
	mov rsi,rbx
	mov rdi,r15
	mov r15,rdi
	mov rbx,rsi
	mov qword [rsp+8*15],rax
	mov rax,1
	add r15,rax
	mov rdx,r15
	mov qword [rsp+8*34],rbx
	mov rbx,0
	mov r13,rbx
	mov qword [rsp+8*36],rdx
	
L_258:
	mov rbx,  [rsp+8*34]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	cmp r13,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*38],rax
	je L_259
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*36]
	mov rdi,rdx
	mov rax,rdi
	mov r15,rsi
	mov r14,rax
	mov rcx,r15
	shl r14,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*39],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	and r14,r15
	mov qword [rsp+8*42],rax
	mov rax,r14
	mov qword [rsp+8*43],rbx
	mov rbx,rax
	mov qword [rsp+8*45],rdx
	mov rdx,  [rsp+8*36]
	mov r15,rdx
	xor r15,rbx
	mov rdx,r15
	mov qword [rsp+8*47],rax
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r14,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rdx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*51],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rdx,r15
	mov r15,rdx
	mov qword [rsp+8*42],rbx
	mov rbx,r15
	mov qword [rsp+8*43],rax
	mov rax,  [rsp+8*51]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*45],rdx
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r14
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*53],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov r15,rax
	mov qword [rsp+8*42],rbx
	mov rbx,  [rsp+8*53]
	and r15,rbx
	mov qword [rsp+8*43],rdx
	mov rdx,r15
	mov qword [rsp+8*45],rax
	mov rax,rdx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*58],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*59],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rbx
	mov qword [rsp+8*60],rdx
	mov rdx,rdi
	mov r15,rsi
	mov r14,rdx
	mov rcx,r15
	shl r14,cl
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*39],rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rbx,r15
	mov r15,rbx
	and r14,r15
	mov qword [rsp+8*42],rdx
	mov rdx,r14
	mov qword [rsp+8*43],rax
	mov rax,rdx
	mov qword [rsp+8*45],rbx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*47],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*61],rax
	mov rax,r13
	mov qword [rsp+8*36],rbx
	mov rbx,1
	add r13,rbx
	mov qword [rsp+8*62],rdx
	mov qword [rsp+8*63],rax
	jmp L_258
	
L_259:
	mov rbx,  [rsp+8*36]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*64],rax
	mov rax,  [rsp+8*16]
	mov qword [rsp+8*65],rbx
	mov rbx,rax
	add rbx,rdx
	mov rax,rbx
	mov rbx,  [rsp+8*78]
	mov qword [rsp+8*91],rdx
	mov rdx,  [rsp+8*86]
	mov qword [rsp+8*16],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,1
	mov rsi,rbx
	mov rdi,rax
	mov r15,rdi
	mov rbx,rsi
	mov rax,1
	add r15,rax
	mov rdx,r15
	mov qword [rsp+8*34],rbx
	mov rbx,0
	mov r13,rbx
	mov qword [rsp+8*36],rdx
	
L_277:
	mov rbx,  [rsp+8*34]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	cmp r13,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*38],rax
	je L_278
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*36]
	mov rdi,rdx
	mov rax,rdi
	mov r15,rsi
	mov r14,rax
	mov rcx,r15
	shl r14,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*39],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	and r14,r15
	mov qword [rsp+8*42],rax
	mov rax,r14
	mov qword [rsp+8*43],rbx
	mov rbx,rax
	mov qword [rsp+8*45],rdx
	mov rdx,  [rsp+8*36]
	mov r15,rdx
	xor r15,rbx
	mov rdx,r15
	mov qword [rsp+8*47],rax
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r14,rdi
	mov qword [rsp+8*48],rbx
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rdx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*51],rbx
	mov rbx,rdi
	mov rax,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rdx,r15
	mov r15,rdx
	mov qword [rsp+8*42],rbx
	mov rbx,r15
	mov qword [rsp+8*43],rax
	mov rax,  [rsp+8*51]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*45],rdx
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r14
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov qword [rsp+8*53],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov rax,r15
	mov r15,rax
	mov qword [rsp+8*42],rbx
	mov rbx,  [rsp+8*53]
	and r15,rbx
	mov qword [rsp+8*43],rdx
	mov rdx,r15
	mov qword [rsp+8*45],rax
	mov rax,rdx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*58],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*59],rax
	mov rax,5
	mov rsi,rax
	mov rdi,rbx
	mov qword [rsp+8*60],rdx
	mov rdx,rdi
	mov r15,rsi
	mov r14,rdx
	mov rcx,r15
	shl r14,cl
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*36],rbx
	mov rbx,32767
	mov rdi,rbx
	mov qword [rsp+8*39],rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov rbx,r15
	mov r15,rbx
	and r14,r15
	mov qword [rsp+8*42],rdx
	mov rdx,r14
	mov qword [rsp+8*43],rax
	mov rax,rdx
	mov qword [rsp+8*45],rbx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*47],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov qword [rsp+8*61],rax
	mov rax,r13
	mov qword [rsp+8*36],rbx
	mov rbx,1
	add r13,rbx
	mov qword [rsp+8*62],rdx
	mov qword [rsp+8*63],rax
	jmp L_277
	
L_278:
	mov rbx,  [rsp+8*36]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*64],rax
	mov rax,  [rsp+8*17]
	mov qword [rsp+8*65],rbx
	mov rbx,rax
	add rbx,rdx
	mov rax,rbx
	mov rbx,  [rsp+8*81]
	mov qword [rsp+8*94],rdx
	mov rdx,  [rsp+8*86]
	mov qword [rsp+8*17],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,1
	mov rsi,rbx
	mov rdi,rax
	mov r15,rdi
	mov rbx,rsi
	mov rdx,1
	add r15,rdx
	mov rdx,r15
	mov rax,0
	mov r13,rax
	mov qword [rsp+8*34],rbx
	mov qword [rsp+8*36],rdx
	
L_296:
	mov rbx,  [rsp+8*34]
	mov rdx,10
	mov rax,rbx
	imul rax,rdx
	cmp r13,rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*38],rax
	je L_297
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*36]
	mov rdi,rdx
	mov rax,rdi
	mov r15,rsi
	mov r14,rax
	mov rcx,r15
	shl r14,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov qword [rsp+8*39],rax
	mov rax,rdi
	mov rbx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rbx
	mov rdx,r15
	mov r15,rdx
	and r14,r15
	mov qword [rsp+8*42],rax
	mov rax,r14
	mov qword [rsp+8*43],rbx
	mov rbx,rax
	mov qword [rsp+8*45],rdx
	mov rdx,  [rsp+8*36]
	mov r15,rdx
	xor r15,rbx
	mov rdx,r15
	mov qword [rsp+8*48],rbx
	mov rbx,17
	mov rsi,rbx
	mov rdi,rdx
	mov r14,rdi
	mov rbx,rsi
	mov qword [rsp+8*47],rax
	mov rax,65535
	mov rsi,rax
	mov rax,32767
	mov rdi,rax
	mov rax,rdi
	mov qword [rsp+8*36],rdx
	mov rdx,rsi
	mov r15,rax
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov qword [rsp+8*51],rbx
	mov rbx,r15
	mov r15,rbx
	mov qword [rsp+8*42],rax
	mov rax,r15
	mov qword [rsp+8*43],rdx
	mov rdx,  [rsp+8*51]
	mov r15,rax
	mov rcx,rdx
	shr r15,cl
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*45],rbx
	mov rbx,1
	add r15,rbx
	mov rax,r15
	mov r15,r14
	mov rcx,rdx
	shr r15,cl
	and r15,rax
	mov rax,r15
	mov rbx,65535
	mov rsi,rbx
	mov rbx,32767
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov r15,rbx
	mov rcx,16
	shl r15,cl
	or r15,rdx
	mov qword [rsp+8*53],rax
	mov rax,r15
	mov r15,rax
	mov qword [rsp+8*42],rbx
	mov rbx,  [rsp+8*53]
	and r15,rbx
	mov rbx,r15
	mov qword [rsp+8*43],rdx
	mov rdx,rbx
	mov qword [rsp+8*58],rbx
	mov rbx,  [rsp+8*36]
	mov qword [rsp+8*45],rax
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov qword [rsp+8*59],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	mov r14,rdx
	mov rcx,r15
	shl r14,cl
	mov qword [rsp+8*39],rdx
	mov rdx,65535
	mov rsi,rdx
	mov rdx,32767
	mov rdi,rdx
	mov rdx,rdi
	mov rax,rsi
	mov r15,rdx
	mov rcx,16
	shl r15,cl
	or r15,rax
	mov qword [rsp+8*42],rdx
	mov rdx,r15
	mov r15,rdx
	and r14,r15
	mov qword [rsp+8*45],rdx
	mov rdx,r14
	mov qword [rsp+8*43],rax
	mov rax,rdx
	mov qword [rsp+8*47],rdx
	mov rdx,rbx
	xor rdx,rax
	mov rbx,rdx
	mov rdx,r13
	mov qword [rsp+8*63],rdx
	mov rdx,1
	add r13,rdx
	mov qword [rsp+8*36],rbx
	mov qword [rsp+8*61],rax
	jmp L_296
	
L_297:
	mov rbx,  [rsp+8*36]
	mov rdx,123456789
	mov rax,rbx
	xor rax,rdx
	mov rbx,rax
	mov r15,rbx
	mov qword [rsp+8*65],rbx
	mov rbx,  [rsp+8*18]
	add r15,rbx
	mov rbx,r15
	mov rdx,  [rsp+8*23]
	mov r15,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*18],rbx
	mov qword [rsp+8*23],rdx
	jmp L_18
	
L_19:
	mov r15,r8
	mov rbx,1
	add r8,rbx
	jmp L_15
	
L_16:
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_12
	
L_13:
	mov rbx,  [rsp+8*15]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,t127
	mov r12,rax
	mov rbx,28
	mov r13,rbx
	mov qword [rsp+8*102],rdx
	
L_95:
	mov rbx,0
	cmp r13,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_96
	mov rbx,  [rsp+8*102]
	mov r15,rbx
	mov rcx,r13
	shr r15,cl
	mov rdx,15
	and r15,rdx
	mov rax,10
	cmp r15,rax
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_97
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_98
	mov rbx,0
	mov r15,rbx
	jmp L_99
	
L_98:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	
L_99:
	cmp r15, 0
	je L_100
	mov rbx,  [gbl+8*113]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
	mov qword [arg+8*63],rbx
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	jmp L_102
	
L_100:
	mov rbx,t125
	mov r15,rbx
	
L_102:
	mov     rsi,  r15
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
	mov  r15, rax
	mov r12,r15
	jmp L_103
	
L_97:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_104
	mov rbx,0
	mov r15,rbx
	jmp L_105
	
L_104:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	
L_105:
	cmp r15, 0
	je L_106
	mov rbx,  [gbl+8*113]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
	mov qword [arg+8*63],rbx
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	jmp L_108
	
L_106:
	mov rbx,t125
	mov r15,rbx
	
L_108:
	mov     rsi,  r15
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
	mov  r15, rax
	mov r12,r15
	
L_103:
	mov rbx,4
	mov r15,r13
	sub r15,rbx
	mov r13,r15
	jmp L_95
	
L_96:
	mov r15,r12
	mov     rsi, t240
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
	mov rbx,  [rsp+8*16]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,t127
	mov r12,rax
	mov rbx,28
	mov r13,rbx
	mov qword [rsp+8*102],rdx
	
L_112:
	mov rbx,0
	cmp r13,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_113
	mov rbx,  [rsp+8*102]
	mov r15,rbx
	mov rcx,r13
	shr r15,cl
	mov rdx,15
	and r15,rdx
	mov rax,10
	cmp r15,rax
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_114
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_115
	mov rbx,0
	mov r15,rbx
	jmp L_116
	
L_115:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	
L_116:
	cmp r15, 0
	je L_117
	mov rbx,  [gbl+8*113]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
	mov qword [arg+8*63],rbx
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	jmp L_119
	
L_117:
	mov rbx,t125
	mov r15,rbx
	
L_119:
	mov     rsi,  r15
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
	mov  r15, rax
	mov r12,r15
	jmp L_120
	
L_114:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_121
	mov rbx,0
	mov r15,rbx
	jmp L_122
	
L_121:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	
L_122:
	cmp r15, 0
	je L_123
	mov rbx,  [gbl+8*113]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
	mov qword [arg+8*63],rbx
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	jmp L_125
	
L_123:
	mov rbx,t125
	mov r15,rbx
	
L_125:
	mov     rsi,  r15
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
	mov  r15, rax
	mov r12,r15
	
L_120:
	mov rbx,4
	mov r15,r13
	sub r15,rbx
	mov r13,r15
	jmp L_112
	
L_113:
	mov r15,r12
	mov     rsi, t247
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
	mov rbx,  [rsp+8*17]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,t127
	mov r12,rax
	mov rbx,28
	mov r13,rbx
	mov qword [rsp+8*102],rdx
	
L_129:
	mov rbx,0
	cmp r13,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_130
	mov rbx,  [rsp+8*102]
	mov r15,rbx
	mov rcx,r13
	shr r15,cl
	mov rdx,15
	and r15,rdx
	mov rax,10
	cmp r15,rax
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_131
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_132
	mov rbx,0
	mov r15,rbx
	jmp L_133
	
L_132:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	
L_133:
	cmp r15, 0
	je L_134
	mov rbx,  [gbl+8*113]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
	mov qword [arg+8*63],rbx
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	jmp L_136
	
L_134:
	mov rbx,t125
	mov r15,rbx
	
L_136:
	mov     rsi,  r15
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
	mov  r15, rax
	mov r12,r15
	jmp L_137
	
L_131:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_138
	mov rbx,0
	mov r15,rbx
	jmp L_139
	
L_138:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	
L_139:
	cmp r15, 0
	je L_140
	mov rbx,  [gbl+8*113]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
	mov qword [arg+8*63],rbx
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	jmp L_142
	
L_140:
	mov rbx,t125
	mov r15,rbx
	
L_142:
	mov     rsi,  r15
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
	mov  r15, rax
	mov r12,r15
	
L_137:
	mov rbx,4
	mov r15,r13
	sub r15,rbx
	mov r13,r15
	jmp L_129
	
L_130:
	mov r15,r12
	mov     rsi, t254
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
	mov rbx,  [rsp+8*18]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,t127
	mov r12,rax
	mov rbx,28
	mov r13,rbx
	mov qword [rsp+8*102],rdx
	
L_146:
	mov rbx,0
	cmp r13,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_147
	mov rbx,  [rsp+8*102]
	mov r15,rbx
	mov rcx,r13
	shr r15,cl
	mov rdx,15
	and r15,rdx
	mov rax,10
	cmp r15,rax
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_148
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_149
	mov rbx,0
	mov r15,rbx
	jmp L_150
	
L_149:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	
L_150:
	cmp r15, 0
	je L_151
	mov rbx,  [gbl+8*113]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
	mov qword [arg+8*63],rbx
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	jmp L_153
	
L_151:
	mov rbx,t125
	mov r15,rbx
	
L_153:
	mov     rsi,  r15
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
	mov  r15, rax
	mov r12,r15
	jmp L_154
	
L_148:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_155
	mov rbx,0
	mov r15,rbx
	jmp L_156
	
L_155:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	
L_156:
	cmp r15, 0
	je L_157
	mov rbx,  [gbl+8*113]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rdx,r10
	mov qword [arg+8*63],rdx
	push r11
	push r10
	push r9
	push r8
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	jmp L_159
	
L_157:
	mov rbx,t125
	mov r15,rbx
	
L_159:
	mov     rsi,  r15
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
	mov  r15, rax
	mov r12,r15
	
L_154:
	mov rbx,4
	mov r15,r13
	sub r15,rbx
	mov r13,r15
	jmp L_146
	
L_147:
	mov r15,r12
	mov     rsi, t261
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
	mov rbx,t266
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
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1184
	mov rdx,t109
	mov rbx,rdx
	mov qword [gbl+8*113],rbx
	mov rbx,  [rsp+8*140]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   3168
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

t109:
	 db 95," !",34,"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[",92,"]^_`abcdefghijklmnopqrstuvwxyz{|}~" ,0

t247:
	 db 1," " ,0

t125:
	 db 0,"" ,0

t127:
	 db 0,"" ,0

t254:
	 db 1," " ,0

t266:
	 db 0,"" ,0

t261:
	 db 1," " ,0

t240:
	 db 1," " ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

