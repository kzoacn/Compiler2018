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
	sub    rsp, 2344
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
        sub     rdx, 4328
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rbx,102
	mov r12,rbx
	mov rax,0
	mov rdx,rax
	mov rbx,0
	mov r11,rbx
	mov rax,0
	mov rbx,rax
	mov rax,0
	mov r8,rax
	mov rax,1
	mov r15,r12
	sub r15,rax
	mov rax,r15
	mov qword [rsp+8*3],rdx
	mov rdx,1
	mov r15,r12
	sub r15,rdx
	mov rdx,r15
	mov qword [rsp+8*5],rbx
	mov rbx,0
	mov r10,rbx
	mov rbx,0
	mov r9,rbx
	mov qword [rsp+8*8],rax
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*10],rdx
	mov rdx,0
	mov rax,rdx
	mov r15,r12
	imul r15,r12
	mov qword [rsp+8*13],rbx
	mov qword [rsp+8*14],rax
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
	mov r14,rdx
	mov qword [rsp+8*17],rbx
	
L_743:
	mov r15,r12
	imul r15,r12
	cmp r14,r15
	mov r15, 0
	setl r15B
	mov rbx,  [rsp+8*20]
	add rbx,rbx
	cmp r15, 0
	mov qword [rsp+8*20],rbx
	je L_744
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r14
	mov rax,1
	add r14,rax
	jmp L_743
	
L_744:
	mov r15,r12
	imul r15,r12
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
	mov r13,r15
	mov rbx,0
	mov r14,rbx
	
L_746:
	mov r15,r12
	imul r15,r12
	cmp r14,r15
	mov r15, 0
	setl r15B
	mov rbx,  [rsp+8*20]
	add rbx,rbx
	cmp r15, 0
	mov qword [rsp+8*20],rbx
	je L_747
	mov r15,r13
	lea r15,[r15+r14*8+8H]
	mov rbx,0
	mov [r15],rbx
	mov r15,r14
	mov rdx,1
	add r14,rdx
	jmp L_746
	
L_747:
	mov     rdi,  r12
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
	mov r14,rdx
	mov qword [rsp+8*32],rbx
	
L_749:
	cmp r14,r12
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_750
	mov     rdi,  r12
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [rsp+8*34], rax
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov rdx,  [rsp+8*34]
	mov [r15],rdx
	mov rax,0
	mov r15,rax
	
L_752:
	cmp r15,r12
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*38],rbx
	je L_753
	mov rbx,1
	mov rdx,rbx
	neg rdx
	mov rbx,  [rsp+8*32]
	mov rax,rbx
	mov qword [rsp+8*39],rdx
	lea rdx,[rax+r14*8+8H]
	mov rax, [rdx]
	lea rdx,[rax+r15*8+8H]
	mov qword [rsp+8*40],rax
	mov rax,  [rsp+8*39]
	mov [rdx],rax
	mov qword [rsp+8*41],rdx
	mov rdx,r15
	mov qword [rsp+8*42],rdx
	mov rdx,1
	add r15,rdx
	jmp L_752
	
L_753:
	mov r15,r14
	mov rbx,1
	add r14,rbx
	jmp L_749
	
L_750:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,0
	lea r15,[r15+rdx*8+8H]
	mov rax,  [rsp+8*5]
	mov [r15],rax
	mov rdx,r13
	mov rbx,0
	lea r15,[rdx+rbx*8+8H]
	mov [r15],r8
	mov qword [rsp+8*46],rdx
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	lea r15,[rbx+rax*8+8H]
	mov rbx, [r15]
	lea r15,[rbx+r8*8+8H]
	mov qword [rsp+8*48],rbx
	mov rbx,0
	mov [r15],rbx
	
L_755:
	mov rbx,  [rsp+8*3]
	cmp rbx,r11
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_756
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r14, [r15]
	mov r15,r13
	lea r15,[r15+rdx*8+8H]
	mov rax, [r15]
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	lea r15,[r15+rax*8+8H]
	mov r15, [r15]
	mov qword [rsp+8*56],rax
	mov rax,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	mov rbx,  [rsp+8*3]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov qword [rsp+8*13],rax
	mov rax,1
	sub r15,rax
	mov r10,r15
	mov rax,r13
	lea rdx,[rax+rbx*8+8H]
	mov qword [rsp+8*64],rax
	mov rax, [rdx]
	mov qword [rsp+8*65],rdx
	mov rdx,2
	mov rbx,rax
	sub rbx,rdx
	mov r9,rbx
	mov rsi,r12
	mov rdi,r10
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*66],rax
	jne L_845
	mov rbx,0
	mov r15,rbx
	jmp L_846
	
L_845:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_846:
	mov r15,r15
	mov rbx,r15
	cmp rbx, 0
	mov qword [rsp+8*75],rbx
	jne L_757
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*76],rbx
	jmp L_758
	
L_757:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_849
	mov rbx,0
	mov r15,rbx
	jmp L_850
	
L_849:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_850:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*77],rbx
	mov qword [rsp+8*76],rdx
	
L_758:
	mov rbx,  [rsp+8*76]
	cmp rbx, 0
	je L_760
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	lea rax,[rbx+r10*8+8H]
	mov rbx, [rax]
	lea rax,[rbx+r9*8+8H]
	mov qword [rsp+8*78],rbx
	mov rbx, [rax]
	mov qword [rsp+8*79],rax
	mov rax,1
	mov rdx,rax
	neg rdx
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*80],rbx
	mov qword [rsp+8*81],rdx
	mov qword [rsp+8*82],rax
	je L_762
	mov rbx,1
	mov rdx,r11
	add rdx,rbx
	mov r11,rdx
	mov rbx,  [rsp+8*17]
	mov rax,rbx
	lea rdx,[rax+r11*8+8H]
	mov [rdx],r10
	mov qword [rsp+8*85],rdx
	mov rdx,r13
	mov qword [rsp+8*84],rax
	lea rax,[rdx+r11*8+8H]
	mov [rax],r9
	mov qword [rsp+8*86],rdx
	mov rdx,  [rsp+8*13]
	mov qword [rsp+8*87],rax
	mov rax,1
	mov rbx,rdx
	add rbx,rax
	mov qword [rsp+8*88],rbx
	mov rbx,  [rsp+8*32]
	mov rax,rbx
	lea rdx,[rax+r10*8+8H]
	mov rax, [rdx]
	lea rdx,[rax+r9*8+8H]
	mov qword [rsp+8*89],rax
	mov rax,  [rsp+8*88]
	mov [rdx],rax
	mov qword [rsp+8*90],rdx
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*91],rax
	jne L_763
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*91],rbx
	jmp L_764
	
L_763:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*92],rdx
	mov qword [rsp+8*91],rax
	
L_764:
	mov rbx,  [rsp+8*91]
	cmp rbx, 0
	je L_766
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_766:
	
L_762:
	
L_760:
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*3]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*93],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*94],rdx
	mov rdx,1
	mov rax,rbx
	sub rax,rdx
	mov r10,rax
	mov qword [rsp+8*95],rbx
	mov rbx,r13
	mov rdx,  [rsp+8*3]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*97],rbx
	mov rbx, [rax]
	mov qword [rsp+8*98],rax
	mov rax,2
	mov rdx,rbx
	add rdx,rax
	mov r9,rdx
	mov rsi,r12
	mov rdi,r10
	mov qword [rsp+8*99],rbx
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_853
	mov rbx,0
	mov r15,rbx
	jmp L_854
	
L_853:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_854:
	mov r15,r15
	mov rbx,r15
	cmp rbx, 0
	mov qword [rsp+8*101],rbx
	jne L_767
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*102],rbx
	jmp L_768
	
L_767:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_857
	mov rbx,0
	mov r15,rbx
	jmp L_858
	
L_857:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_858:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*103],rbx
	mov qword [rsp+8*102],rdx
	
L_768:
	mov rbx,  [rsp+8*102]
	cmp rbx, 0
	je L_770
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	mov rdx,1
	mov r14,rdx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_772
	mov rbx,1
	mov r15,r11
	add r15,rbx
	mov r11,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r11*8+8H]
	mov [r15],r10
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov [r15],r9
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov [r15],r14
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_773
	mov rbx,0
	mov r15,rbx
	jmp L_774
	
L_773:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_774:
	cmp r15, 0
	je L_776
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_776:
	
L_772:
	
L_770:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r10,r15
	mov r15,r13
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r9,r15
	mov rsi,r12
	mov rdi,r10
	mov rax,rdi
	mov rbx,rsi
	cmp rax,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*70],rax
	jne L_861
	mov rbx,0
	mov r15,rbx
	jmp L_862
	
L_861:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_862:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_777
	mov rbx,0
	mov r15,rbx
	jmp L_778
	
L_777:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_865
	mov rbx,0
	mov r15,rbx
	jmp L_866
	
L_865:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_866:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_778:
	cmp r15, 0
	je L_780
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov rdx, [r15]
	mov rax,1
	mov r15,rax
	neg r15
	cmp rdx,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*132],rdx
	je L_782
	mov rbx,1
	mov r15,r11
	add r15,rbx
	mov r11,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r11*8+8H]
	mov [r15],r10
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov [r15],r9
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov [r15],rdx
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_783
	mov rbx,0
	mov r15,rbx
	jmp L_784
	
L_783:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_784:
	cmp r15, 0
	je L_786
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_786:
	
L_782:
	
L_780:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r10,r15
	mov rax,r13
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*149],rax
	mov rax, [rbx]
	mov qword [rsp+8*150],rbx
	mov rbx,2
	mov rdx,rax
	add rdx,rbx
	mov r9,rdx
	mov rsi,r12
	mov rdi,r10
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*151],rax
	jne L_869
	mov rbx,0
	mov r15,rbx
	jmp L_870
	
L_869:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_870:
	mov r15,r15
	mov rbx,r15
	cmp rbx, 0
	mov qword [rsp+8*153],rbx
	jne L_787
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*154],rbx
	jmp L_788
	
L_787:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_873
	mov rbx,0
	mov r15,rbx
	jmp L_874
	
L_873:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_874:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*155],rbx
	mov qword [rsp+8*154],rdx
	
L_788:
	mov rbx,  [rsp+8*154]
	cmp rbx, 0
	je L_790
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	lea rax,[rbx+r10*8+8H]
	mov rbx, [rax]
	lea rax,[rbx+r9*8+8H]
	mov qword [rsp+8*156],rbx
	mov rbx, [rax]
	mov qword [rsp+8*157],rax
	mov rax,1
	mov rdx,rax
	neg rdx
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*158],rbx
	mov qword [rsp+8*159],rdx
	mov qword [rsp+8*160],rax
	je L_792
	mov rbx,1
	mov rdx,r11
	add rdx,rbx
	mov r11,rdx
	mov rbx,  [rsp+8*17]
	mov rax,rbx
	lea rdx,[rax+r11*8+8H]
	mov [rdx],r10
	mov qword [rsp+8*163],rdx
	mov rdx,r13
	mov qword [rsp+8*162],rax
	lea rax,[rdx+r11*8+8H]
	mov [rax],r9
	mov qword [rsp+8*164],rdx
	mov rdx,  [rsp+8*13]
	mov qword [rsp+8*165],rax
	mov rax,1
	mov rbx,rdx
	add rbx,rax
	mov qword [rsp+8*166],rbx
	mov rbx,  [rsp+8*32]
	mov rax,rbx
	lea rdx,[rax+r10*8+8H]
	mov rax, [rdx]
	lea rdx,[rax+r9*8+8H]
	mov qword [rsp+8*167],rax
	mov rax,  [rsp+8*166]
	mov [rdx],rax
	mov qword [rsp+8*168],rdx
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*169],rax
	jne L_793
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*169],rbx
	jmp L_794
	
L_793:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov r15, 0
	sete r15B
	mov rdx,r15
	mov qword [rsp+8*169],rdx
	
L_794:
	mov rbx,  [rsp+8*169]
	cmp rbx, 0
	je L_796
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_796:
	
L_792:
	
L_790:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r10,r15
	mov rax,r13
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*175],rax
	mov rax, [rbx]
	mov qword [rsp+8*176],rbx
	mov rbx,1
	mov rdx,rax
	sub rdx,rbx
	mov r9,rdx
	mov rsi,r12
	mov rdi,r10
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*177],rax
	jne L_877
	mov rbx,0
	mov r15,rbx
	jmp L_878
	
L_877:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_878:
	mov r15,r15
	mov rbx,r15
	cmp rbx, 0
	mov qword [rsp+8*179],rbx
	jne L_797
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*180],rbx
	jmp L_798
	
L_797:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_881
	mov rbx,0
	mov r15,rbx
	jmp L_882
	
L_881:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_882:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*181],rbx
	mov qword [rsp+8*180],rdx
	
L_798:
	mov rbx,  [rsp+8*180]
	cmp rbx, 0
	je L_800
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea rdx,[r15+r10*8+8H]
	mov r15, [rdx]
	lea rdx,[r15+r9*8+8H]
	mov r15, [rdx]
	mov rax,1
	mov r14,rax
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*183],rdx
	je L_802
	mov rbx,1
	mov r15,r11
	add r15,rbx
	mov r11,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r11*8+8H]
	mov [r15],r10
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov [r15],r9
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov [r15],r14
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_803
	mov rbx,0
	mov r15,rbx
	jmp L_804
	
L_803:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_804:
	cmp r15, 0
	je L_806
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_806:
	
L_802:
	
L_800:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r10,r15
	mov r15,r13
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r9,r15
	mov rsi,r12
	mov rdi,r10
	mov rax,rdi
	mov rbx,rsi
	cmp rax,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*70],rax
	jne L_885
	mov rbx,0
	mov r15,rbx
	jmp L_886
	
L_885:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_886:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_807
	mov rbx,0
	mov r15,rbx
	jmp L_808
	
L_807:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_889
	mov rbx,0
	mov r15,rbx
	jmp L_890
	
L_889:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_890:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_808:
	cmp r15, 0
	je L_810
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov r14, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_812
	mov rbx,1
	mov r15,r11
	add r15,rbx
	mov r11,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r11*8+8H]
	mov [r15],r10
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov [r15],r9
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov [r15],rdx
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_813
	mov rbx,0
	mov r15,rbx
	jmp L_814
	
L_813:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_814:
	cmp r15, 0
	je L_816
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_816:
	
L_812:
	
L_810:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	add r15,rax
	mov r10,r15
	mov r15,r13
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	sub r15,rax
	mov r9,r15
	mov rsi,r12
	mov rdi,r10
	mov rax,rdi
	mov rbx,rsi
	cmp rax,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*70],rax
	jne L_893
	mov rbx,0
	mov r15,rbx
	jmp L_894
	
L_893:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_894:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_817
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*232],rbx
	jmp L_818
	
L_817:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_897
	mov rbx,0
	mov r15,rbx
	jmp L_898
	
L_897:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_898:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*233],rbx
	mov qword [rsp+8*232],rdx
	
L_818:
	mov rbx,  [rsp+8*232]
	cmp rbx, 0
	je L_820
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	lea rax,[rbx+r10*8+8H]
	mov rbx, [rax]
	lea rax,[rbx+r9*8+8H]
	mov qword [rsp+8*234],rbx
	mov rbx, [rax]
	mov qword [rsp+8*235],rax
	mov rax,1
	mov rdx,rax
	neg rdx
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*236],rbx
	mov qword [rsp+8*237],rdx
	mov qword [rsp+8*238],rax
	je L_822
	mov rbx,1
	mov rdx,r11
	add rdx,rbx
	mov r11,rdx
	mov rax,  [rsp+8*17]
	mov r15,rax
	lea rbx,[r15+r11*8+8H]
	mov [rbx],r10
	mov qword [rsp+8*241],rbx
	mov rbx,r13
	lea rdx,[rbx+r11*8+8H]
	mov [rdx],r9
	mov qword [rsp+8*242],rbx
	mov rbx,  [rsp+8*13]
	mov qword [rsp+8*243],rdx
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,  [rsp+8*32]
	mov rdx,rbx
	mov qword [rsp+8*244],rax
	lea rax,[rdx+r10*8+8H]
	mov rdx, [rax]
	lea rax,[rdx+r9*8+8H]
	mov qword [rsp+8*245],rdx
	mov rdx,  [rsp+8*244]
	mov [rax],rdx
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov qword [rsp+8*246],rax
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*247],rax
	jne L_823
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*247],rbx
	jmp L_824
	
L_823:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov r15, 0
	sete r15B
	mov rdx,r15
	mov qword [rsp+8*247],rdx
	
L_824:
	mov rbx,  [rsp+8*247]
	cmp rbx, 0
	je L_826
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_826:
	
L_822:
	
L_820:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	add r15,rax
	mov r10,r15
	mov rax,r13
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*253],rax
	mov rax, [rbx]
	mov qword [rsp+8*254],rbx
	mov rbx,1
	mov r15,rax
	add r15,rbx
	mov r9,r15
	mov rsi,r12
	mov rdi,r10
	mov rbx,rdi
	mov qword [rsp+8*255],rax
	mov rax,rsi
	cmp rbx,rax
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rax
	jne L_901
	mov rbx,0
	mov r15,rbx
	jmp L_902
	
L_901:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_902:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_827
	mov rbx,0
	mov r15,rbx
	jmp L_828
	
L_827:
	mov rsi,r12
	mov rdi,r9
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	jne L_905
	mov rbx,0
	mov r15,rbx
	jmp L_906
	
L_905:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_906:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_828:
	cmp r15, 0
	je L_830
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov r14, [r15]
	mov rdx,1
	mov r15,rdx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_832
	mov rbx,1
	mov r15,r11
	add r15,rbx
	mov r11,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r11*8+8H]
	mov [r15],r10
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov [r15],r9
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov r14,rax
	add r14,rbx
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov [r15],r14
	mov rdx,  [rsp+8*8]
	cmp r10,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_833
	mov rbx,0
	mov r15,rbx
	jmp L_834
	
L_833:
	mov rbx,  [rsp+8*10]
	cmp r9,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_834:
	cmp r15, 0
	je L_836
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_836:
	
L_832:
	
L_830:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_838
	jmp L_756
	
L_838:
	mov rbx,  [rsp+8*3]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov qword [rsp+8*3],rbx
	jmp L_755
	
L_756:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_839
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	mov rdx,  [rsp+8*8]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,  [rsp+8*10]
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
	jmp L_840
	
L_839:
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
	
L_840:
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2344
	mov rbx,  [rsp+8*285]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   4328
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

