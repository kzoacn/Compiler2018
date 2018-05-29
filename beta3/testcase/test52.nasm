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
	call global_init
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
	mov r11,rdx
	mov qword [gbl+8*5],rbx
	
L_1697:
	cmp r11,r13
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1698
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
	lea r15,[r15+r11*8+8H]
	mov [r15],r14
	mov rdx,0
	mov r12,rdx
	
L_1699:
	cmp r12,r13
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1700
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r12
	mov rax,1
	add r12,rax
	jmp L_1699
	
L_1700:
	mov r15,r11
	mov rbx,1
	add r11,rbx
	jmp L_1697
	
L_1698:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,101
	mov r8,rdx
	mov rax,1
	mov r15,r8
	sub r15,rax
	mov rbx,r15
	mov rdx,rbx
	mov rax,0
	mov r11,rax
	mov qword [gbl+8*21],rbx
	mov qword [gbl+8*22],rdx
	
L_1677:
	cmp r11,r8
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1678
	mov rbx,0
	mov r12,rbx
	
L_1680:
	cmp r12,r8
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1681
	mov rbx,1
	mov r14,rbx
	neg r14
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov r15,r12
	mov rax,1
	add r12,rax
	jmp L_1680
	
L_1681:
	mov r15,r11
	mov rbx,1
	add r11,rbx
	jmp L_1677
	
L_1678:
	
L_1683:
	mov rbx,  [gbl+8*30]
	mov rdx,  [gbl+8*31]
	cmp rbx,rdx
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1684
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
	mov r10,r15
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	mov r11,r15
	mov rax,1
	mov r14,r9
	sub r14,rax
	mov rax,2
	mov r15,r10
	sub r15,rax
	mov rsi,r15
	mov rdi,r14
	mov r13,rdi
	mov r12,rsi
	mov rsi,r8
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1734
	mov rbx,0
	mov r15,rbx
	jmp L_1735
	
L_1734:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1735:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1738
	mov rbx,0
	mov r15,rbx
	jmp L_1739
	
L_1738:
	mov rsi,r8
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1740
	mov rbx,0
	mov r15,rbx
	jmp L_1741
	
L_1740:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1741:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1739:
	cmp r15, 0
	je L_1744
	mov rbx,  [gbl+8*5]
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
	je L_1745
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [gbl+8*33]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov rdx,  [gbl+8*38]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rax,1
	mov r14,r11
	add r14,rax
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*22]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1746
	mov rbx,0
	mov r15,rbx
	jmp L_1747
	
L_1746:
	mov rbx,  [gbl+8*21]
	cmp r12,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1747:
	cmp r15, 0
	je L_1748
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1748:
	
L_1745:
	
L_1744:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,1
	mov r15,r9
	sub r15,rdx
	mov rax,2
	mov r14,r10
	add r14,rax
	mov rsi,r14
	mov rdi,r15
	mov r13,rdi
	mov r12,rsi
	mov rsi,r8
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1751
	mov rbx,0
	mov r15,rbx
	jmp L_1752
	
L_1751:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1752:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1755
	mov rbx,0
	mov r15,rbx
	jmp L_1756
	
L_1755:
	mov rsi,r8
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1757
	mov rbx,0
	mov r15,rbx
	jmp L_1758
	
L_1757:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1758:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1756:
	cmp r15, 0
	je L_1761
	mov rbx,  [gbl+8*5]
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
	je L_1762
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [gbl+8*33]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov rdx,  [gbl+8*38]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rax,1
	mov r14,r11
	add r14,rax
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*22]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1763
	mov rbx,0
	mov r15,rbx
	jmp L_1764
	
L_1763:
	mov rbx,  [gbl+8*21]
	cmp r12,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1764:
	cmp r15, 0
	je L_1765
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1765:
	
L_1762:
	
L_1761:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,1
	mov r15,r9
	add r15,rdx
	mov rax,2
	mov r14,r10
	sub r14,rax
	mov rsi,r14
	mov rdi,r15
	mov r13,rdi
	mov r12,rsi
	mov rsi,r8
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1768
	mov rbx,0
	mov r15,rbx
	jmp L_1769
	
L_1768:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1769:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1772
	mov rbx,0
	mov r15,rbx
	jmp L_1773
	
L_1772:
	mov rsi,r8
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1774
	mov rbx,0
	mov r15,rbx
	jmp L_1775
	
L_1774:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1775:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1773:
	cmp r15, 0
	je L_1778
	mov rbx,  [gbl+8*5]
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
	je L_1779
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [gbl+8*33]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov rdx,  [gbl+8*38]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rax,1
	mov r14,r11
	add r14,rax
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*22]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1780
	mov rbx,0
	mov r15,rbx
	jmp L_1781
	
L_1780:
	mov rbx,  [gbl+8*21]
	cmp r12,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1781:
	cmp r15, 0
	je L_1782
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1782:
	
L_1779:
	
L_1778:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,1
	mov r15,r9
	add r15,rdx
	mov rax,2
	mov r14,r10
	add r14,rax
	mov rsi,r14
	mov rdi,r15
	mov r13,rdi
	mov r12,rsi
	mov rsi,r8
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1785
	mov rbx,0
	mov r15,rbx
	jmp L_1786
	
L_1785:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1786:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1789
	mov rbx,0
	mov r15,rbx
	jmp L_1790
	
L_1789:
	mov rsi,r8
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1791
	mov rbx,0
	mov r15,rbx
	jmp L_1792
	
L_1791:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1792:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1790:
	cmp r15, 0
	je L_1795
	mov rbx,  [gbl+8*5]
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
	je L_1796
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [gbl+8*33]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov rdx,  [gbl+8*38]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rax,1
	mov r14,r11
	add r14,rax
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*22]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1797
	mov rbx,0
	mov r15,rbx
	jmp L_1798
	
L_1797:
	mov rbx,  [gbl+8*21]
	cmp r12,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1798:
	cmp r15, 0
	je L_1799
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1799:
	
L_1796:
	
L_1795:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,2
	mov r15,r9
	sub r15,rdx
	mov rax,1
	mov r14,r10
	sub r14,rax
	mov rsi,r14
	mov rdi,r15
	mov r13,rdi
	mov r12,rsi
	mov rsi,r8
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1802
	mov rbx,0
	mov r15,rbx
	jmp L_1803
	
L_1802:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1803:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1806
	mov rbx,0
	mov r15,rbx
	jmp L_1807
	
L_1806:
	mov rsi,r8
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1808
	mov rbx,0
	mov r15,rbx
	jmp L_1809
	
L_1808:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1809:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1807:
	cmp r15, 0
	je L_1812
	mov rbx,  [gbl+8*5]
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
	je L_1813
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [gbl+8*33]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov rdx,  [gbl+8*38]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rax,1
	mov r14,r11
	add r14,rax
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*22]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1814
	mov rbx,0
	mov r15,rbx
	jmp L_1815
	
L_1814:
	mov rbx,  [gbl+8*21]
	cmp r12,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1815:
	cmp r15, 0
	je L_1816
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1816:
	
L_1813:
	
L_1812:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,2
	mov r14,r9
	sub r14,rdx
	mov rax,1
	mov r15,r10
	add r15,rax
	mov rsi,r15
	mov rdi,r14
	mov r13,rdi
	mov r12,rsi
	mov rsi,r8
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1819
	mov rbx,0
	mov r15,rbx
	jmp L_1820
	
L_1819:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1820:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1823
	mov rbx,0
	mov r15,rbx
	jmp L_1824
	
L_1823:
	mov rsi,r8
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1825
	mov rbx,0
	mov r15,rbx
	jmp L_1826
	
L_1825:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1826:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1824:
	cmp r15, 0
	je L_1829
	mov rbx,  [gbl+8*5]
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
	je L_1830
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [gbl+8*33]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov rdx,  [gbl+8*38]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rax,1
	mov r14,r11
	add r14,rax
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*22]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1831
	mov rbx,0
	mov r15,rbx
	jmp L_1832
	
L_1831:
	mov rbx,  [gbl+8*21]
	cmp r12,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1832:
	cmp r15, 0
	je L_1833
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1833:
	
L_1830:
	
L_1829:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,2
	mov r14,r9
	add r14,rdx
	mov rax,1
	mov r15,r10
	sub r15,rax
	mov rsi,r15
	mov rdi,r14
	mov r13,rdi
	mov r12,rsi
	mov rsi,r8
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1836
	mov rbx,0
	mov r15,rbx
	jmp L_1837
	
L_1836:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1837:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1840
	mov rbx,0
	mov r15,rbx
	jmp L_1841
	
L_1840:
	mov rsi,r8
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1842
	mov rbx,0
	mov r15,rbx
	jmp L_1843
	
L_1842:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1843:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1841:
	cmp r15, 0
	je L_1846
	mov rbx,  [gbl+8*5]
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
	je L_1847
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [gbl+8*33]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov rdx,  [gbl+8*38]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rax,1
	mov r14,r11
	add r14,rax
	mov rdx,  [gbl+8*5]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*22]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1848
	mov rbx,0
	mov r15,rbx
	jmp L_1849
	
L_1848:
	mov rbx,  [gbl+8*21]
	cmp r12,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1849:
	cmp r15, 0
	je L_1850
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1850:
	
L_1847:
	
L_1846:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,2
	mov r14,r9
	add r14,rdx
	mov rax,1
	mov r15,r10
	add r15,rax
	mov rsi,r15
	mov rdi,r14
	mov r13,rdi
	mov r12,rsi
	mov rsi,r8
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1853
	mov rbx,0
	mov r15,rbx
	jmp L_1854
	
L_1853:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1854:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1857
	mov rbx,0
	mov r15,rbx
	jmp L_1858
	
L_1857:
	mov rsi,r8
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1859
	mov rbx,0
	mov r15,rbx
	jmp L_1860
	
L_1859:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1860:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1858:
	cmp r15, 0
	je L_1863
	mov rbx,  [gbl+8*5]
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
	je L_1864
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [gbl+8*33]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov rdx,  [gbl+8*38]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov qword [gbl+8*31],rbx
	mov rbx,1
	mov r14,r11
	add r14,rbx
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov rax,  [gbl+8*22]
	cmp r13,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1865
	mov rbx,0
	mov r15,rbx
	jmp L_1866
	
L_1865:
	mov rbx,  [gbl+8*21]
	cmp r12,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1866:
	cmp r15, 0
	je L_1867
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1867:
	
L_1864:
	
L_1863:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,  [gbl+8*75]
	mov rax,1
	cmp rdx,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1686
	jmp L_1684
	
L_1686:
	mov rbx,  [gbl+8*30]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov qword [gbl+8*30],rbx
	jmp L_1683
	
L_1684:
	mov rbx,  [gbl+8*75]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1687
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
	jmp L_1688
	
L_1687:
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
	
L_1688:
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

