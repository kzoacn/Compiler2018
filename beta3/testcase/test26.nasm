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
	sub    rsp, 2936
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
        sub     rdx, 4920
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
	mov rdx,1
	mov r15,r11
	sub r15,rdx
	mov r8,r15
	mov rdx,1
	mov r15,r11
	sub r15,rdx
	mov r9,r15
	mov rdx,0
	mov r13,rdx
	mov rdx,0
	mov r12,rdx
	mov qword [rsp+8*5],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*6],rax
	mov rax,0
	mov rbx,rax
	mov r15,r11
	imul r15,r11
	mov qword [rsp+8*14],rbx
	mov qword [rsp+8*13],rdx
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
	mov qword [rsp+8*17],rbx
	
L_846:
	mov r15,r11
	imul r15,r11
	cmp r13,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_847
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r13
	mov rax,1
	add r13,rax
	jmp L_846
	
L_847:
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
	mov qword [rsp+8*25],rbx
	
L_849:
	mov rbx,r11
	imul rbx,r11
	cmp r13,rbx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*26],rbx
	je L_850
	mov rbx,  [rsp+8*25]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov rax,r13
	mov rdx,1
	add r13,rdx
	mov qword [rsp+8*29],rax
	jmp L_849
	
L_850:
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
	mov qword [rsp+8*31],rbx
	
L_852:
	cmp r13,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_853
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
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov rdx,0
	mov r14,rdx
	
L_855:
	cmp r14,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_856
	mov rbx,1
	mov r12,rbx
	neg r12
	mov rdx,  [rsp+8*31]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r14*8+8H]
	mov [r15],r12
	mov r15,r14
	mov rax,1
	add r14,rax
	jmp L_855
	
L_856:
	mov r15,r13
	mov rbx,1
	add r13,rbx
	jmp L_852
	
L_853:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,0
	lea r15,[r15+rdx*8+8H]
	mov rax,  [rsp+8*5]
	mov [r15],rax
	mov rdx,  [rsp+8*25]
	mov r15,rdx
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov rbx,  [rsp+8*6]
	mov [r15],rbx
	mov rax,  [rsp+8*31]
	mov r15,rax
	mov rdx,  [rsp+8*5]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	lea r15,[r15+rbx*8+8H]
	mov rbx,0
	mov [r15],rbx
	
L_858:
	mov rbx,  [rsp+8*3]
	cmp rbx,r10
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_859
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r14, [r15]
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r13, [r15]
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	mov rax,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	mov rbx,  [rsp+8*3]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov qword [rsp+8*13],rax
	mov rax,1
	sub r15,rax
	mov r13,r15
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rdx,2
	sub r15,rdx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_948
	mov rbx,0
	mov r15,rbx
	jmp L_949
	
L_948:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_949:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_860
	mov rbx,0
	mov r15,rbx
	jmp L_861
	
L_860:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_952
	mov rbx,0
	mov r15,rbx
	jmp L_953
	
L_952:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_953:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_861:
	cmp r15, 0
	je L_863
	mov rbx,  [rsp+8*31]
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
	je L_865
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rax,  [rsp+8*31]
	mov rdx,rax
	lea rbx,[rdx+r13*8+8H]
	mov rdx, [rbx]
	lea rbx,[rdx+r12*8+8H]
	mov [rbx],r15
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*94],rbx
	mov qword [rsp+8*93],rdx
	jne L_866
	mov rbx,0
	mov r15,rbx
	jmp L_867
	
L_866:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_867:
	cmp r15, 0
	je L_869
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_869:
	
L_865:
	
L_863:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	sub r15,rax
	mov r13,r15
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,2
	add r15,rbx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_956
	mov rbx,0
	mov r15,rbx
	jmp L_957
	
L_956:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_957:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_870
	mov rbx,0
	mov r15,rbx
	jmp L_871
	
L_870:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_960
	mov rbx,0
	mov r15,rbx
	jmp L_961
	
L_960:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_961:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_871:
	cmp r15, 0
	je L_873
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	lea rax,[rbx+r13*8+8H]
	mov rbx, [rax]
	lea rax,[rbx+r12*8+8H]
	mov qword [rsp+8*118],rbx
	mov rbx, [rax]
	mov qword [rsp+8*119],rax
	mov rax,1
	mov rdx,rax
	neg rdx
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*120],rbx
	mov qword [rsp+8*121],rdx
	mov qword [rsp+8*122],rax
	je L_875
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea rax,[r15+r10*8+8H]
	mov [rax],r13
	mov rbx,  [rsp+8*25]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov qword [rsp+8*125],rax
	mov rax,  [rsp+8*13]
	mov rdx,1
	mov r14,rax
	add r14,rdx
	mov rdx,  [rsp+8*31]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_876
	mov rbx,0
	mov r15,rbx
	jmp L_877
	
L_876:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_877:
	cmp r15, 0
	je L_879
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_879:
	
L_875:
	
L_873:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r13,r15
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,2
	sub r15,rbx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_964
	mov rbx,0
	mov r15,rbx
	jmp L_965
	
L_964:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_965:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_880
	mov rbx,0
	mov r15,rbx
	jmp L_881
	
L_880:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_968
	mov rbx,0
	mov r15,rbx
	jmp L_969
	
L_968:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_969:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_881:
	cmp r15, 0
	je L_883
	mov rbx,  [rsp+8*31]
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
	je L_885
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rdx,  [rsp+8*31]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_886
	mov rbx,0
	mov r15,rbx
	jmp L_887
	
L_886:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_887:
	cmp r15, 0
	je L_889
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_889:
	
L_885:
	
L_883:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r13,r15
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,2
	add r15,rbx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_972
	mov rbx,0
	mov r15,rbx
	jmp L_973
	
L_972:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_973:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_890
	mov rbx,0
	mov r15,rbx
	jmp L_891
	
L_890:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_976
	mov rbx,0
	mov r15,rbx
	jmp L_977
	
L_976:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_977:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_891:
	cmp r15, 0
	je L_893
	mov rbx,  [rsp+8*31]
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
	je L_895
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rdx,  [rsp+8*31]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_896
	mov rbx,0
	mov r15,rbx
	jmp L_897
	
L_896:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_897:
	cmp r15, 0
	je L_899
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_899:
	
L_895:
	
L_893:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r13,r15
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,1
	sub r15,rbx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_980
	mov rbx,0
	mov r15,rbx
	jmp L_981
	
L_980:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_981:
	mov r15,r15
	mov rbx,r15
	cmp rbx, 0
	mov qword [rsp+8*218],rbx
	jne L_900
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*219],rbx
	jmp L_901
	
L_900:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_984
	mov rbx,0
	mov r15,rbx
	jmp L_985
	
L_984:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_985:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*225],rbx
	mov qword [rsp+8*219],rdx
	
L_901:
	mov rbx,  [rsp+8*219]
	cmp rbx, 0
	je L_903
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	lea rdx,[r15+r13*8+8H]
	mov r15, [rdx]
	lea rdx,[r15+r12*8+8H]
	mov r15, [rdx]
	mov rax,1
	mov r14,rax
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*227],rdx
	je L_905
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rdx,  [rsp+8*31]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_906
	mov rbx,0
	mov r15,rbx
	jmp L_907
	
L_906:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_907:
	cmp r15, 0
	je L_909
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_909:
	
L_905:
	
L_903:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r13,r15
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,1
	add r15,rbx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_988
	mov rbx,0
	mov r15,rbx
	jmp L_989
	
L_988:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_989:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_910
	mov rbx,0
	mov r15,rbx
	jmp L_911
	
L_910:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_992
	mov rbx,0
	mov r15,rbx
	jmp L_993
	
L_992:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_993:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_911:
	cmp r15, 0
	je L_913
	mov rbx,  [rsp+8*31]
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
	je L_915
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rdx,  [rsp+8*31]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_916
	mov rbx,0
	mov r15,rbx
	jmp L_917
	
L_916:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_917:
	cmp r15, 0
	je L_919
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_919:
	
L_915:
	
L_913:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	add r15,rax
	mov r13,r15
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,1
	sub r15,rbx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_996
	mov rbx,0
	mov r15,rbx
	jmp L_997
	
L_996:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_997:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_920
	mov rbx,0
	mov r15,rbx
	jmp L_921
	
L_920:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1000
	mov rbx,0
	mov r15,rbx
	jmp L_1001
	
L_1000:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1001:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_921:
	cmp r15, 0
	je L_923
	mov rbx,  [rsp+8*31]
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
	je L_925
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rdx,  [rsp+8*31]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_926
	mov rbx,0
	mov r15,rbx
	jmp L_927
	
L_926:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_927:
	cmp r15, 0
	je L_929
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_929:
	
L_925:
	
L_923:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	add r15,rax
	mov r13,r15
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,1
	add r15,rbx
	mov r12,r15
	mov rsi,r11
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1004
	mov rbx,0
	mov r15,rbx
	jmp L_1005
	
L_1004:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1005:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_930
	mov rbx,0
	mov r15,rbx
	jmp L_931
	
L_930:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1008
	mov rbx,0
	mov r15,rbx
	jmp L_1009
	
L_1008:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1009:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_931:
	cmp r15, 0
	je L_933
	mov rbx,  [rsp+8*31]
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
	je L_935
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [rsp+8*25]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_936
	mov rbx,0
	mov r15,rbx
	jmp L_937
	
L_936:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_937:
	cmp r15, 0
	je L_939
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_939:
	
L_935:
	
L_933:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_941
	jmp L_859
	
L_941:
	mov rbx,  [rsp+8*3]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov qword [rsp+8*3],rbx
	jmp L_858
	
L_859:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_942
	mov rbx,  [rsp+8*31]
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
	jmp L_943
	
L_942:
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
	
L_943:
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2936
	mov rbx,  [rsp+8*359]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   4920
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

