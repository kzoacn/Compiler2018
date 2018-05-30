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
	push r14
	push r13
	push r12
	call global_init
	pop r12
	pop r13
	pop r14
	pop r15
	mov r12 , rax
	mov rbx,106
	mov rdi,rbx
	mov r11,rdi
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
	mov     qword  r12, rax
	mov r12,r12
	mov rbx,0
	mov r8,rbx
	
L_1682:
	cmp r8,r11
	mov r10, 0
	setl r10B
	cmp r10, 0
	je L_1683
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
	mov     qword  r10, rax
	mov r9,r12
	lea r9,[r9+r8*8+8H]
	mov [r9],r10
	mov rdx,0
	mov rbx,rdx
	mov qword [gbl+8*11],rbx
	
L_1684:
	mov rbx,  [gbl+8*11]
	cmp rbx,r11
	mov r10, 0
	setl r10B
	cmp r10, 0
	je L_1685
	mov r10,r12
	lea r10,[r10+r8*8+8H]
	mov r10, [r10]
	mov rbx,  [gbl+8*11]
	lea r10,[r10+rbx*8+8H]
	mov rdx,0
	mov [r10],rdx
	mov r10,rbx
	mov rax,1
	add rbx,rax
	mov qword [gbl+8*11],rbx
	jmp L_1684
	
L_1685:
	mov r10,r8
	mov rbx,1
	add r8,rbx
	jmp L_1682
	
L_1683:
	mov rbx,0
	mov r11,rbx
	mov r11,r11
	mov rdx,101
	mov r9,rdx
	mov rax,1
	mov r11,r9
	sub r11,rax
	mov r11,r11
	mov r10,r11
	mov rbx,0
	mov r8,rbx
	
L_1662:
	cmp r8,r9
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*23],rbx
	je L_1663
	mov rdx,0
	mov rbx,rdx
	mov qword [gbl+8*11],rbx
	
L_1665:
	mov rbx,  [gbl+8*11]
	cmp rbx,r9
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*24],rdx
	je L_1666
	mov rbx,1
	mov rdx,rbx
	neg rdx
	mov rax,r12
	lea rbx,[rax+r8*8+8H]
	mov rax, [rbx]
	mov qword [rsp+8*25],rdx
	mov rdx,  [gbl+8*11]
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*26],rax
	mov rax,  [rsp+8*25]
	mov [rbx],rax
	mov qword [rsp+8*27],rbx
	mov rbx,rdx
	mov qword [rsp+8*28],rbx
	mov rbx,1
	add rdx,rbx
	mov qword [gbl+8*11],rdx
	jmp L_1665
	
L_1666:
	mov rbx,r8
	mov rdx,1
	add r8,rdx
	mov qword [rsp+8*29],rbx
	jmp L_1662
	
L_1663:
	
L_1668:
	cmp r13,r14
	mov r8, 0
	setle r8B
	cmp r8, 0
	je L_1669
	mov rbx,  [gbl+8*33]
	mov r8,rbx
	lea r8,[r8+r13*8+8H]
	mov r8, [r8]
	mov r8,r8
	mov rax,  [gbl+8*38]
	mov rdx,rax
	lea rbx,[rdx+r13*8+8H]
	mov qword [rsp+8*39],rdx
	mov rdx, [rbx]
	mov qword [rsp+8*40],rbx
	mov rbx,rdx
	mov qword [rsp+8*41],rdx
	mov rdx,r12
	lea rax,[rdx+r8*8+8H]
	mov rdx, [rax]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*43],rdx
	mov rdx, [rax]
	mov qword [rsp+8*44],rax
	mov rax,rdx
	mov qword [rsp+8*45],rdx
	mov rdx,1
	mov qword [gbl+8*42],rbx
	mov rbx,r8
	sub rbx,rdx
	mov rdx,  [gbl+8*42]
	mov qword [gbl+8*46],rax
	mov rax,2
	mov qword [rsp+8*47],rbx
	mov rbx,rdx
	sub rbx,rax
	mov rsi,rbx
	mov rbx,  [rsp+8*47]
	mov rdi,rbx
	mov rbx,rdi
	mov rax,rsi
	mov rsi,r9
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*51],rax
	mov rax,rsi
	cmp rdx,rax
	mov qword [rsp+8*50],rbx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*53],rax
	jne L_1719
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1720
	
L_1719:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1720:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*57],rax
	jne L_1723
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1724
	
L_1723:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*53],rax
	jne L_1725
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1726
	
L_1725:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1726:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*59],rax
	
L_1724:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1729
	mov rbx,r12
	mov rdx,  [rsp+8*50]
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rax]
	mov rdx,1
	mov qword [rsp+8*62],rbx
	mov rbx,rdx
	neg rbx
	mov qword [rsp+8*61],rax
	mov rax,  [rsp+8*62]
	cmp rax,rbx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rdx
	je L_1730
	mov rbx,1
	add r14,rbx
	mov r14,r14
	mov rax,  [gbl+8*33]
	mov rdx,rax
	lea rbx,[rdx+r14*8+8H]
	mov rax,  [rsp+8*50]
	mov [rbx],rax
	mov qword [rsp+8*66],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rdx,rbx
	lea rax,[rdx+r14*8+8H]
	mov rbx,  [rsp+8*51]
	mov [rax],rbx
	mov qword [rsp+8*68],rdx
	mov rdx,  [gbl+8*46]
	mov rbx,1
	mov qword [rsp+8*69],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,r12
	mov rdx,  [rsp+8*50]
	mov qword [rsp+8*70],rax
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rax],rbx
	mov rdx,  [rsp+8*50]
	cmp rdx,r10
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*72],rax
	jne L_1731
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1732
	
L_1731:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1732:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1733
	mov rbx,1
	mov r15,rbx
	
L_1733:
	
L_1730:
	
L_1729:
	mov rdx,0
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*77],rax
	mov rax,1
	mov rdx,r8
	sub rdx,rax
	mov rax,  [gbl+8*42]
	mov qword [rsp+8*76],rbx
	mov rbx,2
	mov qword [rsp+8*78],rdx
	mov rdx,rax
	add rdx,rbx
	mov rsi,rdx
	mov rbx,  [rsp+8*78]
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rsi,r9
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*51],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov qword [rsp+8*50],rbx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*53],rdx
	mov qword [rsp+8*52],rax
	jne L_1736
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1737
	
L_1736:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1737:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*57],rax
	jne L_1740
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1741
	
L_1740:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*53],rax
	jne L_1742
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1743
	
L_1742:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1743:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*59],rax
	
L_1741:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1746
	mov rbx,r12
	mov rdx,  [rsp+8*50]
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rax]
	mov rdx,1
	mov qword [rsp+8*62],rbx
	mov rbx,rdx
	neg rbx
	mov qword [rsp+8*61],rax
	mov rax,  [rsp+8*62]
	cmp rax,rbx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rdx
	je L_1747
	mov rbx,1
	add r14,rbx
	mov r14,r14
	mov rax,  [gbl+8*33]
	mov rdx,rax
	lea rbx,[rdx+r14*8+8H]
	mov rax,  [rsp+8*50]
	mov [rbx],rax
	mov qword [rsp+8*66],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rdx,rbx
	lea rax,[rdx+r14*8+8H]
	mov rbx,  [rsp+8*51]
	mov [rax],rbx
	mov qword [rsp+8*68],rdx
	mov rdx,  [gbl+8*46]
	mov rbx,1
	mov qword [rsp+8*69],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,r12
	mov rdx,  [rsp+8*50]
	mov qword [rsp+8*70],rax
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rax],rbx
	mov rdx,  [rsp+8*50]
	cmp rdx,r10
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*72],rax
	jne L_1748
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1749
	
L_1748:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1749:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1750
	mov rbx,1
	mov r15,rbx
	
L_1750:
	
L_1747:
	
L_1746:
	mov rdx,0
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*80],rax
	mov rax,1
	mov rdx,r8
	add rdx,rax
	mov rax,  [gbl+8*42]
	mov qword [rsp+8*76],rbx
	mov rbx,2
	mov qword [rsp+8*81],rdx
	mov rdx,rax
	sub rdx,rbx
	mov rsi,rdx
	mov rbx,  [rsp+8*81]
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rsi,r9
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*51],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov qword [rsp+8*50],rbx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*53],rdx
	mov qword [rsp+8*52],rax
	jne L_1753
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1754
	
L_1753:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1754:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*57],rax
	jne L_1757
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1758
	
L_1757:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*53],rax
	jne L_1759
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1760
	
L_1759:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1760:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*59],rax
	
L_1758:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1763
	mov rbx,r12
	mov rdx,  [rsp+8*50]
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rax]
	mov rdx,1
	mov qword [rsp+8*62],rbx
	mov rbx,rdx
	neg rbx
	mov qword [rsp+8*61],rax
	mov rax,  [rsp+8*62]
	cmp rax,rbx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rdx
	je L_1764
	mov rbx,1
	add r14,rbx
	mov r14,r14
	mov rax,  [gbl+8*33]
	mov rdx,rax
	lea rbx,[rdx+r14*8+8H]
	mov rax,  [rsp+8*50]
	mov [rbx],rax
	mov qword [rsp+8*66],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rdx,rbx
	lea rax,[rdx+r14*8+8H]
	mov rbx,  [rsp+8*51]
	mov [rax],rbx
	mov qword [rsp+8*68],rdx
	mov rdx,  [gbl+8*46]
	mov rbx,1
	mov qword [rsp+8*69],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,r12
	mov rdx,  [rsp+8*50]
	mov qword [rsp+8*70],rax
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rax],rbx
	mov rdx,  [rsp+8*50]
	cmp rdx,r10
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*72],rax
	jne L_1765
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1766
	
L_1765:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1766:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1767
	mov rbx,1
	mov r15,rbx
	
L_1767:
	
L_1764:
	
L_1763:
	mov rdx,0
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*83],rax
	mov rax,1
	mov rdx,r8
	add rdx,rax
	mov rax,  [gbl+8*42]
	mov qword [rsp+8*76],rbx
	mov rbx,2
	mov qword [rsp+8*84],rdx
	mov rdx,rax
	add rdx,rbx
	mov rsi,rdx
	mov rbx,  [rsp+8*84]
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rsi,r9
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*51],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov qword [rsp+8*50],rbx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*53],rdx
	mov qword [rsp+8*52],rax
	jne L_1770
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1771
	
L_1770:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1771:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*57],rax
	jne L_1774
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1775
	
L_1774:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*53],rax
	jne L_1776
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1777
	
L_1776:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1777:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*59],rax
	
L_1775:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1780
	mov rbx,r12
	mov rdx,  [rsp+8*50]
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rax]
	mov rdx,1
	mov qword [rsp+8*62],rbx
	mov rbx,rdx
	neg rbx
	mov qword [rsp+8*61],rax
	mov rax,  [rsp+8*62]
	cmp rax,rbx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rdx
	je L_1781
	mov rbx,1
	add r14,rbx
	mov r14,r14
	mov rax,  [gbl+8*33]
	mov rdx,rax
	lea rbx,[rdx+r14*8+8H]
	mov rax,  [rsp+8*50]
	mov [rbx],rax
	mov qword [rsp+8*66],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rdx,rbx
	lea rax,[rdx+r14*8+8H]
	mov rbx,  [rsp+8*51]
	mov [rax],rbx
	mov qword [rsp+8*68],rdx
	mov rdx,  [gbl+8*46]
	mov rbx,1
	mov qword [rsp+8*69],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,r12
	mov rdx,  [rsp+8*50]
	mov qword [rsp+8*70],rax
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rax],rbx
	mov rdx,  [rsp+8*50]
	cmp rdx,r10
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*72],rax
	jne L_1782
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1783
	
L_1782:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1783:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1784
	mov rbx,1
	mov r15,rbx
	
L_1784:
	
L_1781:
	
L_1780:
	mov rdx,0
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*86],rax
	mov rax,2
	mov rdx,r8
	sub rdx,rax
	mov rax,  [gbl+8*42]
	mov qword [rsp+8*76],rbx
	mov rbx,1
	mov qword [rsp+8*87],rdx
	mov rdx,rax
	sub rdx,rbx
	mov rsi,rdx
	mov rbx,  [rsp+8*87]
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rsi,r9
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*51],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov qword [rsp+8*50],rbx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*53],rdx
	mov qword [rsp+8*52],rax
	jne L_1787
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1788
	
L_1787:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1788:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*57],rax
	jne L_1791
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1792
	
L_1791:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*53],rax
	jne L_1793
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1794
	
L_1793:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1794:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*59],rax
	
L_1792:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1797
	mov rbx,r12
	mov rdx,  [rsp+8*50]
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rax]
	mov rdx,1
	mov qword [rsp+8*62],rbx
	mov rbx,rdx
	neg rbx
	mov qword [rsp+8*61],rax
	mov rax,  [rsp+8*62]
	cmp rax,rbx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rdx
	je L_1798
	mov rbx,1
	add r14,rbx
	mov r14,r14
	mov rax,  [gbl+8*33]
	mov rdx,rax
	lea rbx,[rdx+r14*8+8H]
	mov rax,  [rsp+8*50]
	mov [rbx],rax
	mov qword [rsp+8*66],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rdx,rbx
	lea rax,[rdx+r14*8+8H]
	mov rbx,  [rsp+8*51]
	mov [rax],rbx
	mov qword [rsp+8*68],rdx
	mov rdx,  [gbl+8*46]
	mov rbx,1
	mov qword [rsp+8*69],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,r12
	mov rdx,  [rsp+8*50]
	mov qword [rsp+8*70],rax
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rax],rbx
	mov rdx,  [rsp+8*50]
	cmp rdx,r10
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*72],rax
	jne L_1799
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1800
	
L_1799:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1800:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1801
	mov rbx,1
	mov r15,rbx
	
L_1801:
	
L_1798:
	
L_1797:
	mov rdx,0
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*89],rax
	mov rax,2
	mov rdx,r8
	sub rdx,rax
	mov rax,  [gbl+8*42]
	mov qword [rsp+8*76],rbx
	mov rbx,1
	mov qword [rsp+8*90],rdx
	mov rdx,rax
	add rdx,rbx
	mov rsi,rdx
	mov rbx,  [rsp+8*90]
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rsi,r9
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*51],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov qword [rsp+8*50],rbx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*53],rdx
	mov qword [rsp+8*52],rax
	jne L_1804
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1805
	
L_1804:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1805:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*57],rax
	jne L_1808
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1809
	
L_1808:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*53],rax
	jne L_1810
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1811
	
L_1810:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1811:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*59],rax
	
L_1809:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1814
	mov rbx,r12
	mov rdx,  [rsp+8*50]
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rax]
	mov rdx,1
	mov qword [rsp+8*62],rbx
	mov rbx,rdx
	neg rbx
	mov qword [rsp+8*61],rax
	mov rax,  [rsp+8*62]
	cmp rax,rbx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rdx
	je L_1815
	mov rbx,1
	add r14,rbx
	mov r14,r14
	mov rax,  [gbl+8*33]
	mov rdx,rax
	lea rbx,[rdx+r14*8+8H]
	mov rax,  [rsp+8*50]
	mov [rbx],rax
	mov qword [rsp+8*66],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rdx,rbx
	lea rax,[rdx+r14*8+8H]
	mov rbx,  [rsp+8*51]
	mov [rax],rbx
	mov qword [rsp+8*68],rdx
	mov rdx,  [gbl+8*46]
	mov rbx,1
	mov qword [rsp+8*69],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,r12
	mov rdx,  [rsp+8*50]
	mov qword [rsp+8*70],rax
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rax],rbx
	mov rdx,  [rsp+8*50]
	cmp rdx,r10
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*72],rax
	jne L_1816
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1817
	
L_1816:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1817:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1818
	mov rbx,1
	mov r15,rbx
	
L_1818:
	
L_1815:
	
L_1814:
	mov rdx,0
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*92],rax
	mov rax,2
	mov rdx,r8
	add rdx,rax
	mov rax,  [gbl+8*42]
	mov qword [rsp+8*76],rbx
	mov rbx,1
	mov qword [rsp+8*93],rdx
	mov rdx,rax
	sub rdx,rbx
	mov rsi,rdx
	mov rbx,  [rsp+8*93]
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rsi,r9
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*51],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov qword [rsp+8*50],rbx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*53],rdx
	mov qword [rsp+8*52],rax
	jne L_1821
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1822
	
L_1821:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1822:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*57],rax
	jne L_1825
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1826
	
L_1825:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*53],rax
	jne L_1827
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1828
	
L_1827:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1828:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*59],rax
	
L_1826:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1831
	mov rbx,r12
	mov rdx,  [rsp+8*50]
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rax]
	mov rdx,1
	mov qword [rsp+8*62],rbx
	mov rbx,rdx
	neg rbx
	mov qword [rsp+8*61],rax
	mov rax,  [rsp+8*62]
	cmp rax,rbx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rdx
	je L_1832
	mov rbx,1
	add r14,rbx
	mov r14,r14
	mov rax,  [gbl+8*33]
	mov rdx,rax
	lea rbx,[rdx+r14*8+8H]
	mov rax,  [rsp+8*50]
	mov [rbx],rax
	mov qword [rsp+8*66],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rdx,rbx
	lea rax,[rdx+r14*8+8H]
	mov rbx,  [rsp+8*51]
	mov [rax],rbx
	mov qword [rsp+8*68],rdx
	mov rdx,  [gbl+8*46]
	mov rbx,1
	mov qword [rsp+8*69],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,r12
	mov rdx,  [rsp+8*50]
	mov qword [rsp+8*70],rax
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rax],rbx
	mov rdx,  [rsp+8*50]
	cmp rdx,r10
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*72],rax
	jne L_1833
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1834
	
L_1833:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1834:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1835
	mov rbx,1
	mov r15,rbx
	
L_1835:
	
L_1832:
	
L_1831:
	mov rdx,0
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*95],rax
	mov rax,2
	add r8,rax
	mov rax,  [gbl+8*42]
	mov rdx,1
	mov qword [rsp+8*76],rbx
	mov rbx,rax
	add rbx,rdx
	mov rsi,rbx
	mov rdi,r8
	mov rbx,rdi
	mov rdx,rsi
	mov rsi,r9
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*51],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov qword [rsp+8*50],rbx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*53],rdx
	mov qword [rsp+8*52],rax
	jne L_1838
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1839
	
L_1838:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1839:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*56],rbx
	mov qword [rsp+8*57],rax
	jne L_1842
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1843
	
L_1842:
	mov rsi,r9
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*53],rax
	jne L_1844
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1845
	
L_1844:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1845:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*56],rbx
	mov rbx,rax
	mov qword [rsp+8*58],rbx
	mov qword [rsp+8*59],rax
	
L_1843:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1848
	mov rbx,r12
	mov rdx,  [rsp+8*50]
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rax]
	mov qword [rsp+8*61],rax
	mov rax,1
	mov rdx,rax
	neg rdx
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*62],rbx
	mov qword [rsp+8*63],rdx
	mov qword [rsp+8*64],rax
	je L_1849
	mov rbx,1
	add r14,rbx
	mov r14,r14
	mov rax,  [gbl+8*33]
	mov rdx,rax
	lea rbx,[rdx+r14*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rbx],rdx
	mov qword [rsp+8*67],rbx
	mov rax,  [gbl+8*38]
	mov rbx,rax
	lea rdx,[rbx+r14*8+8H]
	mov qword [rsp+8*68],rbx
	mov rbx,  [rsp+8*51]
	mov [rdx],rbx
	mov qword [rsp+8*69],rdx
	mov rdx,  [gbl+8*46]
	mov rax,1
	mov rbx,rdx
	add rbx,rax
	mov rdx,r12
	mov rax,  [rsp+8*50]
	mov qword [rsp+8*70],rbx
	lea rbx,[rdx+rax*8+8H]
	mov rdx, [rbx]
	mov rax,  [rsp+8*51]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*71],rdx
	mov rdx,  [rsp+8*70]
	mov [rbx],rdx
	mov qword [rsp+8*72],rbx
	mov rbx,  [rsp+8*50]
	cmp rbx,r10
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*73],rdx
	jne L_1850
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1851
	
L_1850:
	mov rbx,  [rsp+8*51]
	cmp rbx,r11
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1851:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1852
	mov rbx,1
	mov r15,rbx
	
L_1852:
	
L_1849:
	
L_1848:
	mov rdx,0
	mov rbx,rdx
	mov r8,rbx
	mov rax,1
	cmp r15,rax
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*76],rbx
	je L_1671
	jmp L_1669
	
L_1671:
	mov rbx,1
	add r13,rbx
	mov r13,r13
	jmp L_1668
	
L_1669:
	mov rbx,1
	cmp r15,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1672
	mov r15,r12
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
	jmp L_1673
	
L_1672:
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
	
L_1673:
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

