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
	sub    rsp, 984
	mov     rax, 936870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 936870912
        movsxd  rdx, edx
        sub     rdx, 2968
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rbx,110
	mov rdi,rbx
	mov r15,rdi
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov     qword  r14, rax
	mov r10,r14
	mov rbx,0
	mov r9,rbx
	
L_2544:
	cmp r9,r15
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_2545
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov     qword  r14, rax
	mov r13,r10
	lea r13,[r13+r9*8+8H]
	mov [r13],r14
	mov rdx,0
	mov rbx,rdx
	mov qword [gbl+8*11],rbx
	
L_2546:
	mov rbx,  [gbl+8*11]
	cmp rbx,r15
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_2547
	mov r14,r10
	lea r14,[r14+r9*8+8H]
	mov r14, [r14]
	mov rbx,  [gbl+8*11]
	lea r14,[r14+rbx*8+8H]
	mov rdx,0
	mov [r14],rdx
	mov r14,rbx
	mov rax,1
	add rbx,rax
	mov qword [gbl+8*11],rbx
	jmp L_2546
	
L_2547:
	mov r14,r9
	mov rbx,1
	add r9,rbx
	jmp L_2544
	
L_2545:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,0
	mov r15,rdx
	mov rax,99
	mov r12,rax
	mov rdx,100
	mov rbx,rdx
	mov rdx,0
	mov r11,rdx
	mov rsi,rbx
	mov rdi,r12
	mov r13,rdi
	mov r14,rsi
	mov rdx,1
	mov r9,rdx
	mov qword [rsp+8*21],rbx
	
L_2552:
	mov rbx,49
	cmp r9,rbx
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_2553
	mov rdx,50
	mov rbx,rdx
	mov qword [gbl+8*11],rbx
	
L_2554:
	mov rbx,98
	mov r15,rbx
	sub r15,r9
	mov rdx,1
	add r15,rdx
	mov rax,  [gbl+8*11]
	cmp rax,r15
	mov r15, 0
	setle r15B
	mov rbx,  [rsp+8*28]
	add rbx,rbx
	cmp r15, 0
	mov qword [rsp+8*28],rbx
	je L_2556
	mov r15,r10
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	mov rbx,  [gbl+8*11]
	lea r15,[r15+rbx*8+8H]
	mov rdx,1
	mov [r15],rdx
	mov r15,rbx
	mov rax,1
	add rbx,rax
	mov qword [gbl+8*11],rbx
	jmp L_2554
	
L_2556:
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_2552
	
L_2553:
	mov rbx,1
	mov r9,rbx
	
L_2559:
	mov rbx,49
	cmp r9,rbx
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_2560
	mov r15,r10
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov rbx,1
	mov [r15],rbx
	mov r15,r9
	mov rdx,1
	add r9,rdx
	jmp L_2559
	
L_2560:
	mov rbx,50
	mov r9,rbx
	
L_2562:
	mov rbx,98
	cmp r9,rbx
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_2563
	mov r15,r10
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	lea r15,[r15+r14*8+8H]
	mov rbx,1
	mov [r15],rbx
	mov r15,r9
	mov rdx,1
	add r9,rdx
	jmp L_2562
	
L_2563:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	
L_2499:
	mov rbx,r11
	mov rsi,r12
	mov rdx,  [rsp+8*21]
	mov rdi,rdx
	mov r13,rdi
	mov r14,rsi
	mov r15,rbx
	mov qword [arg+8*2],rbx
	mov rbx,0
	mov rax,rbx
	mov rdx,1
	mov rbx,rdx
	mov rdx,1
	mov r9,rdx
	mov qword [gbl+8*48],rbx
	mov qword [gbl+8*47],rax
	
L_2567:
	cmp r9,r13
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_2568
	mov rbx,  [gbl+8*50]
	mov r15,rbx
	lea r15,[r15+r9*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r9
	mov rax,1
	add r9,rax
	jmp L_2567
	
L_2568:
	mov rbx,  [gbl+8*54]
	mov r15,rbx
	mov rdx,1
	lea r15,[r15+rdx*8+8H]
	mov [r15],r14
	mov rax,  [gbl+8*50]
	mov r15,rax
	lea r15,[r15+r14*8+8H]
	mov rdx,1
	mov [r15],rdx
	mov rdx,  [gbl+8*59]
	mov r15,rdx
	lea r15,[r15+r14*8+8H]
	mov rbx,0
	mov [r15],rbx
	mov rbx,0
	mov r15,rbx
	
L_2570:
	mov rbx,  [gbl+8*47]
	mov rdx,  [gbl+8*48]
	cmp rbx,rdx
	mov r14, 0
	setl r14B
	cmp r14, 0
	jne L_2571
	mov rbx,0
	mov r14,rbx
	jmp L_2572
	
L_2571:
	mov rbx,0
	cmp r15,rbx
	mov r14, 0
	sete r14B
	mov r14,r14
	
L_2572:
	cmp r14, 0
	je L_2573
	mov rbx,  [gbl+8*47]
	mov r14,rbx
	mov rdx,1
	add rbx,rdx
	mov rax,  [gbl+8*54]
	mov r14,rax
	lea r14,[r14+rbx*8+8H]
	mov r14, [r14]
	mov r9,r14
	mov qword [gbl+8*47],rbx
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*11],rbx
	
L_2574:
	mov rbx,  [gbl+8*11]
	cmp rbx,r13
	mov r14, 0
	setle r14B
	cmp r14, 0
	je L_2575
	mov r14,r10
	lea r14,[r14+r9*8+8H]
	mov r14, [r14]
	mov rbx,  [gbl+8*11]
	lea r14,[r14+rbx*8+8H]
	mov r14, [r14]
	cmp r14,0
	mov r14, 0
	setg r14B
	cmp r14, 0
	jne L_2576
	mov rbx,0
	mov r14,rbx
	jmp L_2577
	
L_2576:
	mov rbx,  [gbl+8*50]
	mov r14,rbx
	mov rdx,  [gbl+8*11]
	lea r14,[r14+rdx*8+8H]
	mov r14, [r14]
	mov rax,0
	cmp r14,rax
	mov r14, 0
	sete r14B
	mov r14,r14
	
L_2577:
	cmp r14, 0
	je L_2578
	mov rbx,  [gbl+8*50]
	mov r14,rbx
	mov rdx,  [gbl+8*11]
	lea r14,[r14+rdx*8+8H]
	mov rax,1
	mov [r14],rax
	mov rax,  [gbl+8*48]
	mov r14,rax
	mov rbx,1
	add rax,rbx
	mov rbx,  [gbl+8*54]
	mov r14,rbx
	lea r14,[r14+rax*8+8H]
	mov [r14],rdx
	mov rbx,  [gbl+8*59]
	mov r14,rbx
	lea r14,[r14+rdx*8+8H]
	mov [r14],r9
	cmp rax,r13
	mov r14, 0
	sete r14B
	cmp r14, 0
	mov qword [gbl+8*48],rax
	je L_2579
	mov rbx,1
	mov r15,rbx
	
L_2579:
	
L_2578:
	mov rbx,  [gbl+8*11]
	mov r14,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [gbl+8*11],rbx
	jmp L_2574
	
L_2575:
	jmp L_2570
	
L_2573:
	mov r15,r15
	mov r15,r15
	cmp r15,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	je L_2500
	mov rbx,  [rsp+8*21]
	mov rdi,rbx
	mov r15,rdi
	mov r9,r15
	mov rdx,  [gbl+8*90]
	mov r15,rdx
	mov rax,1
	add rdx,rax
	mov qword [gbl+8*90],rdx
	
L_2583:
	mov rbx,  [gbl+8*59]
	mov r15,rbx
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	cmp r15,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	je L_2584
	mov rbx,  [gbl+8*59]
	mov r15,rbx
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	mov rdx,r15
	mov r15,r10
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov r14, [r15]
	mov r13,r14
	mov rax,1
	sub r14,rax
	mov [r15],r14
	mov r15,r10
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	lea r15,[r15+rdx*8+8H]
	mov r13, [r15]
	mov r14,r13
	mov rax,1
	add r13,rax
	mov [r15],r13
	mov r9,rdx
	mov qword [gbl+8*11],rdx
	jmp L_2583
	
L_2584:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	jmp L_2499
	
L_2500:
	mov rbx,  [gbl+8*90]
	mov rdi,rbx
	mov r15,rdi
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov     qword r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, r15 
	add rdi, 1 
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 984
	mov rdx,0
	mov rbx,rdx
	mov qword [gbl+8*90],rbx
	mov     rdi, 110
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov     qword [gbl+8*112], rax
	mov rdx,  [gbl+8*112]
	mov rbx,rdx
	mov qword [gbl+8*50],rbx
	mov     rdi, 110
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov     qword [gbl+8*113], rax
	mov rdx,  [gbl+8*113]
	mov rbx,rdx
	mov qword [gbl+8*59],rbx
	mov     rdi, 110
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov     qword [gbl+8*114], rax
	mov rdx,  [gbl+8*114]
	mov rbx,rdx
	mov qword [gbl+8*54],rbx
	mov rbx,  [rsp+8*115]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   2968
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

