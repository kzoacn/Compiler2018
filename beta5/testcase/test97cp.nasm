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
	sub    rsp, 1152
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
        sub     rdx, 3136
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	call global_init
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	mov r15 , rax
	mov rdx,1
	mov rbx,rdx
	mov rax,50
	mov r13,rax
	mov rax,1
	mov rdx,rax
	mov rax,50
	mov r11,rax
	mov qword [rsp+8*2],rbx
	mov rbx,1
	mov rax,rbx
	mov qword [rsp+8*4],rdx
	mov rdx,20
	mov rbx,rdx
	mov rdx,30
	mov r12,rdx
	mov qword [rsp+8*6],rax
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*7],rbx
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*9],rdx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*10],rax
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*11],rbx
	mov rbx,  [rsp+8*2]
	mov rax,rbx
	mov qword [rsp+8*12],rdx
	mov qword [rsp+8*13],rax
	
L_12:
	mov rbx,  [rsp+8*13]
	cmp rbx,r13
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_13
	mov rdx,  [rsp+8*4]
	mov rbx,rdx
	mov qword [rsp+8*15],rbx
	
L_15:
	mov rbx,  [rsp+8*15]
	cmp rbx,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_16
	mov rdx,  [rsp+8*6]
	mov rbx,rdx
	mov qword [rsp+8*17],rbx
	
L_18:
	mov rbx,  [rsp+8*17]
	mov rdx,  [rsp+8*7]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_19
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rsi,r12
	mov rax,  [rsp+8*2]
	mov rdi,rax
	mov r10,rdi
	mov r14,rsi
	mov r15,rbx
	mov rax,31
	and r15,rax
	mov rdx,r15
	mov rsi,r14
	mov rdi,r10
	mov r15,rdi
	mov r14,rsi
	mov qword [arg+8*2],rbx
	mov rbx,1
	add r15,rbx
	mov rax,r15
	mov qword [rsp+8*26],rdx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*30],rax
	
L_375:
	mov rbx,10
	mov r15,r14
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_377
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r15,r15
	xor r15,rdx
	mov rdx,r15
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r9,rdi
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*30],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	mov qword [rsp+8*46],rbx
	mov rbx,r15
	mov rax,  [rsp+8*46]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r9
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r15,rbx
	mov r15,r15
	mov r9,r15
	mov rdx,  [rsp+8*30]
	xor r9,rdx
	mov rdx,r9
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r10,r15
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_375
	
L_377:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r15,r10
	mov r15,r15
	mov rax,r15
	mov rbx,  [rsp+8*26]
	mov rsi,rbx
	mov rdi,rax
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r14,r15
	mov qword [rsp+8*62],rax
	mov rax,32
	mov rdx,  [rsp+8*26]
	mov r15,rax
	sub r15,rdx
	mov rsi,r15
	mov rbx,  [rsp+8*62]
	mov rdi,rbx
	mov r9,rdi
	mov rdx,rsi
	mov rax,65535
	mov rsi,rax
	mov rbx,32767
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	mov qword [rsp+8*46],rdx
	mov rdx,r15
	mov rax,  [rsp+8*46]
	mov r15,rdx
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov rdx,r15
	mov r15,r9
	mov rcx,rax
	shr r15,cl
	and r15,rdx
	mov rdx,r15
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r15,rdx
	mov r15,r15
	mov r15,r15
	or r15,r14
	mov r15,r15
	mov r15,r15
	mov rbx,r15
	mov qword [rsp+8*48],rdx
	mov rdx,  [rsp+8*17]
	mov rax,rdx
	mov rsi,r12
	mov qword [rsp+8*69],rbx
	mov rbx,  [rsp+8*13]
	mov rdi,rbx
	mov r10,rdi
	mov r14,rsi
	mov r15,rax
	mov rdx,31
	and r15,rdx
	mov rbx,r15
	mov rsi,r14
	mov rdi,r10
	mov r15,rdi
	mov r14,rsi
	mov qword [arg+8*2],rax
	mov rax,1
	add r15,rax
	mov rdx,r15
	mov qword [rsp+8*26],rbx
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	
L_407:
	mov rbx,10
	mov r15,r14
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_409
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r15,r15
	xor r15,rdx
	mov rdx,r15
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r9,rdi
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*30],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	mov qword [rsp+8*46],rbx
	mov rbx,r15
	mov rax,  [rsp+8*46]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r9
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r15,rbx
	mov r15,r15
	mov r9,r15
	mov rdx,  [rsp+8*30]
	xor r9,rdx
	mov rdx,r9
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r10,r15
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_407
	
L_409:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r15,r10
	mov r15,r15
	mov rax,r15
	mov rbx,  [rsp+8*26]
	mov rsi,rbx
	mov rdi,rax
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r14,r15
	mov qword [rsp+8*62],rax
	mov rax,32
	mov rdx,  [rsp+8*26]
	mov r15,rax
	sub r15,rdx
	mov rsi,r15
	mov rbx,  [rsp+8*62]
	mov rdi,rbx
	mov r9,rdi
	mov rdx,rsi
	mov rax,65535
	mov rsi,rax
	mov rbx,32767
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	mov qword [rsp+8*46],rdx
	mov rdx,r15
	mov rax,  [rsp+8*46]
	mov r15,rdx
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov rdx,r15
	mov r15,r9
	mov rcx,rax
	shr r15,cl
	and r15,rdx
	mov rdx,r15
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r15,rdx
	mov r15,r15
	mov r15,r15
	or r15,r14
	mov r15,r15
	mov r15,r15
	mov rbx,r15
	mov qword [rsp+8*48],rdx
	mov rdx,  [rsp+8*17]
	mov rax,rdx
	mov rsi,r12
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*15]
	mov rdi,rbx
	mov r10,rdi
	mov r14,rsi
	mov r15,rax
	mov rdx,31
	and r15,rdx
	mov rbx,r15
	mov rsi,r14
	mov rdi,r10
	mov r15,rdi
	mov r14,rsi
	mov qword [arg+8*2],rax
	mov rax,1
	add r15,rax
	mov rdx,r15
	mov qword [rsp+8*26],rbx
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	
L_439:
	mov rbx,10
	mov r15,r14
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_441
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r15,r15
	xor r15,rdx
	mov rdx,r15
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r9,rdi
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*30],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	mov qword [rsp+8*46],rbx
	mov rbx,r15
	mov rax,  [rsp+8*46]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r9
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r15,rbx
	mov r15,r15
	mov r9,r15
	mov rdx,  [rsp+8*30]
	xor r9,rdx
	mov rdx,r9
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r10,r15
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_439
	
L_441:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r15,r10
	mov r15,r15
	mov rax,r15
	mov rbx,  [rsp+8*26]
	mov rsi,rbx
	mov rdi,rax
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r14,r15
	mov qword [rsp+8*62],rax
	mov rax,32
	mov rdx,  [rsp+8*26]
	mov r15,rax
	sub r15,rdx
	mov rsi,r15
	mov rbx,  [rsp+8*62]
	mov rdi,rbx
	mov r9,rdi
	mov rdx,rsi
	mov rax,65535
	mov rsi,rax
	mov rbx,32767
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	mov qword [rsp+8*46],rdx
	mov rdx,r15
	mov rax,  [rsp+8*46]
	mov r15,rdx
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov rdx,r15
	mov r15,r9
	mov rcx,rax
	shr r15,cl
	and r15,rdx
	mov rdx,r15
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r15,rdx
	mov r15,r15
	mov r15,r15
	or r15,r14
	mov r15,r15
	mov r15,r15
	mov rbx,r15
	mov rax,  [rsp+8*13]
	mov qword [rsp+8*48],rdx
	mov rdx,  [rsp+8*15]
	mov r15,rax
	xor r15,rdx
	mov qword [rsp+8*73],rbx
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rsi,r12
	mov rdi,r15
	mov r10,rdi
	mov r14,rsi
	mov r15,rbx
	mov qword [arg+8*2],rbx
	mov rbx,31
	and r15,rbx
	mov rbx,r15
	mov rsi,r14
	mov rdi,r10
	mov r15,rdi
	mov r14,rsi
	mov rax,1
	add r15,rax
	mov rdx,r15
	mov qword [rsp+8*26],rbx
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	
L_471:
	mov rbx,10
	mov r15,r14
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_473
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r15,r15
	xor r15,rdx
	mov rdx,r15
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r9,rdi
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*30],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	mov qword [rsp+8*46],rbx
	mov rbx,r15
	mov rax,  [rsp+8*46]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r9
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r15,rbx
	mov r15,r15
	mov r9,r15
	mov rdx,  [rsp+8*30]
	xor r9,rdx
	mov rdx,r9
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r10,r15
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_471
	
L_473:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r15,r10
	mov r15,r15
	mov rax,r15
	mov rbx,  [rsp+8*26]
	mov rsi,rbx
	mov rdi,rax
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rdx,65535
	mov rsi,rdx
	mov rbx,65535
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r14,r15
	mov qword [rsp+8*62],rax
	mov rax,32
	mov rdx,  [rsp+8*26]
	mov r15,rax
	sub r15,rdx
	mov rsi,r15
	mov rdx,  [rsp+8*62]
	mov rdi,rdx
	mov r9,rdi
	mov rdx,rsi
	mov rax,65535
	mov rsi,rax
	mov rbx,32767
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	mov qword [rsp+8*46],rdx
	mov rdx,r15
	mov rax,  [rsp+8*46]
	mov r15,rdx
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov rdx,r15
	mov r15,r9
	mov rcx,rax
	shr r15,cl
	and r15,rdx
	mov rdx,r15
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r15,rdx
	mov r15,r15
	mov r15,r15
	or r15,r14
	mov r15,r15
	mov r15,r15
	mov rbx,r15
	mov rax,1
	mov rsi,rax
	mov rax,  [rsp+8*17]
	mov rdi,rax
	mov r15,rdi
	mov r14,rsi
	mov qword [rsp+8*48],rdx
	mov rdx,1
	add r15,rdx
	mov qword [rsp+8*76],rbx
	mov rbx,r15
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rax
	
L_183:
	mov rbx,10
	mov r15,r14
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_185
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r15,r15
	xor r15,rdx
	mov rdx,r15
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r9,rdi
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*30],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	mov qword [rsp+8*46],rbx
	mov rbx,r15
	mov rax,  [rsp+8*46]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r9
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r15,rbx
	mov r15,r15
	mov r9,r15
	mov rdx,  [rsp+8*30]
	xor r9,rdx
	mov rdx,r9
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r10,r15
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_183
	
L_185:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r15,r10
	mov rax,r15
	mov rbx,1
	mov rsi,rbx
	mov rbx,  [rsp+8*15]
	mov rdi,rbx
	mov r15,rdi
	mov r14,rsi
	mov rdx,1
	add r15,rdx
	mov qword [rsp+8*77],rax
	mov rax,r15
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rax
	
L_203:
	mov rbx,10
	mov r15,r14
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_205
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r15,r15
	xor r15,rdx
	mov rdx,r15
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r9,rdi
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*30],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	mov qword [rsp+8*46],rbx
	mov rbx,r15
	mov rax,  [rsp+8*46]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r9
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r15,rbx
	mov r15,r15
	mov r9,r15
	mov rdx,  [rsp+8*30]
	xor r9,rdx
	mov rdx,r9
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r10,r15
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_203
	
L_205:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r15,r10
	mov r15,r15
	mov rax,  [rsp+8*77]
	mov rbx,rax
	xor rbx,r15
	mov rax,1
	mov rsi,rax
	mov rax,  [rsp+8*13]
	mov rdi,rax
	mov r15,rdi
	mov r14,rsi
	mov rdx,1
	add r15,rdx
	mov qword [rsp+8*79],rbx
	mov rbx,r15
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rax
	
L_223:
	mov rbx,10
	mov r15,r14
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_225
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r15,r15
	xor r15,rdx
	mov rdx,r15
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r9,rdi
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*30],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	mov qword [rsp+8*46],rbx
	mov rbx,r15
	mov rax,  [rsp+8*46]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r9
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r15,rbx
	mov r15,r15
	mov r9,r15
	mov rdx,  [rsp+8*30]
	xor r9,rdx
	mov rdx,r9
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r10,r15
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_223
	
L_225:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r15,r10
	mov r15,r15
	mov rax,  [rsp+8*79]
	xor rax,r15
	mov rbx,rax
	mov rax,  [rsp+8*69]
	mov r9,rax
	xor r9,rbx
	mov rax,1
	mov rsi,rax
	mov rdi,r9
	mov r15,rdi
	mov r14,rsi
	mov rax,1
	add r15,rax
	mov rdx,r15
	mov qword [rsp+8*81],rbx
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	
L_243:
	mov rbx,10
	mov r15,r14
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_245
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r15,r15
	xor r15,rdx
	mov rdx,r15
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r9,rdi
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*30],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	mov qword [rsp+8*46],rbx
	mov rbx,r15
	mov rax,  [rsp+8*46]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r9
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r15,rbx
	mov r15,r15
	mov r9,r15
	mov rdx,  [rsp+8*30]
	xor r9,rdx
	mov rdx,r9
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r10,r15
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_243
	
L_245:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r15,r10
	mov r9,r15
	mov rax,  [rsp+8*9]
	add r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*71]
	mov rdx,  [rsp+8*81]
	mov r9,rbx
	xor r9,rdx
	mov rbx,1
	mov rsi,rbx
	mov rdi,r9
	mov r15,rdi
	mov r14,rsi
	mov rbx,1
	add r15,rbx
	mov qword [rsp+8*9],rax
	mov rax,r15
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*30],rax
	
L_263:
	mov rbx,10
	mov r15,r14
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_265
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r15,r15
	xor r15,rdx
	mov rdx,r15
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r9,rdi
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*30],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	mov qword [rsp+8*46],rbx
	mov rbx,r15
	mov rax,  [rsp+8*46]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r9
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r15,rbx
	mov r15,r15
	mov r9,r15
	mov rdx,  [rsp+8*30]
	xor r9,rdx
	mov rdx,r9
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r10,r15
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_263
	
L_265:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r15,r10
	mov r9,r15
	mov rax,  [rsp+8*10]
	mov r10,rax
	add r10,r9
	mov rax,r10
	mov rbx,  [rsp+8*73]
	mov rdx,  [rsp+8*81]
	mov r9,rbx
	xor r9,rdx
	mov rbx,1
	mov rsi,rbx
	mov rdi,r9
	mov r15,rdi
	mov r14,rsi
	mov rbx,1
	add r15,rbx
	mov qword [rsp+8*10],rax
	mov rax,r15
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*30],rax
	
L_283:
	mov rbx,10
	mov r15,r14
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_285
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r15,r15
	xor r15,rdx
	mov rdx,r15
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r9,rdi
	mov rbx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*30],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	mov qword [rsp+8*46],rbx
	mov rbx,r15
	mov rax,  [rsp+8*46]
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r9
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r15,rbx
	mov r15,r15
	mov r9,r15
	mov rdx,  [rsp+8*30]
	xor r9,rdx
	mov rdx,r9
	mov rax,5
	mov rsi,rax
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov qword [rsp+8*48],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rax,65535
	mov rdi,rax
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r10,r15
	xor r10,rdx
	mov rdx,r10
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	jmp L_283
	
L_285:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r15,r10
	mov r9,r15
	mov rax,  [rsp+8*11]
	add r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*76]
	mov rdx,  [rsp+8*81]
	mov r9,rbx
	xor r9,rdx
	mov rbx,1
	mov rsi,rbx
	mov rdi,r9
	mov r15,rdi
	mov r14,rsi
	mov rbx,1
	add r15,rbx
	mov rbx,r15
	mov qword [rsp+8*11],rax
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rdx
	
L_303:
	mov rbx,10
	mov r15,r14
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_305
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rax,65535
	mov rsi,rax
	mov rbx,65535
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r15,r15
	xor r15,rdx
	mov rdx,r15
	mov rax,17
	mov rsi,rax
	mov rdi,rdx
	mov r9,rdi
	mov rax,rsi
	mov rbx,65535
	mov rsi,rbx
	mov rbx,32767
	mov rdi,rbx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	mov rbx,r15
	mov r15,rbx
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*30],rdx
	mov rdx,1
	add r15,rdx
	mov rbx,r15
	mov r15,r9
	mov rcx,rax
	shr r15,cl
	and r15,rbx
	mov rbx,r15
	mov rdx,65535
	mov rsi,rdx
	mov rdx,65535
	mov rdi,rdx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r15,rbx
	mov r15,r15
	mov r9,r15
	mov qword [rsp+8*48],rbx
	mov rbx,  [rsp+8*30]
	xor r9,rbx
	mov rbx,r9
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov r10,rdi
	mov r15,rsi
	mov r9,r10
	mov rcx,r15
	shl r9,cl
	mov rdx,65535
	mov rsi,rdx
	mov rdx,65535
	mov rdi,rdx
	mov r8,rdi
	mov r15,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r15,r10
	mov r15,r15
	and r9,r15
	mov r15,r9
	mov r10,r15
	xor r10,rbx
	mov rbx,r10
	mov rdx,  [rsp+8*31]
	mov r15,rdx
	mov qword [rsp+8*46],rax
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rdx
	jmp L_303
	
L_305:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r10,rbx
	xor r10,rdx
	mov r15,r10
	mov r9,r15
	mov rax,  [rsp+8*12]
	add r9,rax
	mov rax,r9
	
	mov rbx,t220
	mov rdi,rbx
	mov r9,rdi
	mov qword [rsp+8*12],rax
	
;	mov rdi, format 
;	push r11
;	call puts
;	pop r11
	
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*17],rbx
	jmp L_18
	
L_19:
	mov rbx,  [rsp+8*15]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*15],rbx
	jmp L_15
	
L_16:
	mov rbx,  [rsp+8*13]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*13],rbx
	jmp L_12
	
L_13:
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov r10,rdi
	mov rdx,t127
	mov r12,rdx
	mov rax,28
	mov r11,rax
	
L_95:
	mov rbx,0
	cmp r11,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_96
	mov r15,r10
	mov rcx,r11
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r14,r15
	mov rdx,10
	cmp r14,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_97
	mov rbx,48
	mov r15,rbx
	add r15,r14
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
	mov r15,r15
	
L_99:
	cmp r15, 0
	je L_100
	mov rbx,  [gbl+8*109]
	mov r9,rbx
	mov rdx,32
	mov r13,r14
	sub r13,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r13
	mov rbx,r9
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r15,r14
	jmp L_102
	
L_100:
	mov rbx,t125
	mov r15,rbx
	
L_102:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r12,r15
	jmp L_103
	
L_97:
	mov rbx,65
	mov r15,rbx
	add r15,r14
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
	mov r15,r15
	
L_105:
	cmp r15, 0
	je L_106
	mov rbx,  [gbl+8*109]
	mov r9,rbx
	mov rdx,32
	mov r13,r14
	sub r13,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r13
	mov rbx,r9
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r15,r14
	jmp L_108
	
L_106:
	mov rbx,t125
	mov r15,rbx
	
L_108:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r12,r15
	
L_103:
	mov rbx,4
	mov r15,r11
	sub r15,rbx
	mov r11,r15
	jmp L_95
	
L_96:
	mov r15,r12
	mov r15,r15
	mov     rsi, t226
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, format
	mov rsi, r15 
	add rsi, 1 
	xor rax, rax
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call printf
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rbx,  [rsp+8*10]
	mov rdi,rbx
	mov r10,rdi
	mov rdx,t127
	mov r12,rdx
	mov rax,28
	mov r11,rax
	
L_112:
	mov rbx,0
	cmp r11,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_113
	mov r15,r10
	mov rcx,r11
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r14,r15
	mov rdx,10
	cmp r14,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_114
	mov rbx,48
	mov r15,rbx
	add r15,r14
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
	mov r15,r15
	
L_116:
	cmp r15, 0
	je L_117
	mov rbx,  [gbl+8*109]
	mov r9,rbx
	mov rdx,32
	mov r13,r14
	sub r13,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r13
	mov rbx,r9
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r15,r14
	jmp L_119
	
L_117:
	mov rbx,t125
	mov r15,rbx
	
L_119:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r12,r15
	jmp L_120
	
L_114:
	mov rbx,65
	mov r15,rbx
	add r15,r14
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
	mov r15,r15
	
L_122:
	cmp r15, 0
	je L_123
	mov rbx,  [gbl+8*109]
	mov r9,rbx
	mov rdx,32
	mov r13,r14
	sub r13,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r13
	mov rbx,r9
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r15,r14
	jmp L_125
	
L_123:
	mov rbx,t125
	mov r15,rbx
	
L_125:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r12,r15
	
L_120:
	mov rbx,4
	mov r15,r11
	sub r15,rbx
	mov r11,r15
	jmp L_112
	
L_113:
	mov r15,r12
	mov r15,r15
	mov     rsi, t233
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov rdi,r15
	mov r14,rdi
	mov rdi, format
	mov rsi, r14 
	add rsi, 1 
	xor rax, rax
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call printf
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rbx,  [rsp+8*11]
	mov rdi,rbx
	mov r10,rdi
	mov rdx,t127
	mov r12,rdx
	mov rax,28
	mov r11,rax
	
L_129:
	mov rbx,0
	cmp r11,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_130
	mov r15,r10
	mov rcx,r11
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r14,r15
	mov rdx,10
	cmp r14,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_131
	mov rbx,48
	mov r15,rbx
	add r15,r14
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
	mov r15,r15
	
L_133:
	cmp r15, 0
	je L_134
	mov rbx,  [gbl+8*109]
	mov r9,rbx
	mov rdx,32
	mov r13,r14
	sub r13,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r13
	mov rbx,r9
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r15,r14
	jmp L_136
	
L_134:
	mov rbx,t125
	mov r15,rbx
	
L_136:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r12,r15
	jmp L_137
	
L_131:
	mov rbx,65
	mov r15,rbx
	add r15,r14
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
	mov r15,r15
	
L_139:
	cmp r15, 0
	je L_140
	mov rbx,  [gbl+8*109]
	mov r9,rbx
	mov rdx,32
	mov r13,r14
	sub r13,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r13
	mov rbx,r9
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r15,r14
	jmp L_142
	
L_140:
	mov rbx,t125
	mov r15,rbx
	
L_142:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r12,r15
	
L_137:
	mov rbx,4
	mov r15,r11
	sub r15,rbx
	mov r11,r15
	jmp L_129
	
L_130:
	mov r15,r12
	mov r15,r15
	mov     rsi, t240
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, format
	mov rsi, r15 
	add rsi, 1 
	xor rax, rax
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call printf
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov r10,rdi
	mov rdx,t127
	mov r12,rdx
	mov rax,28
	mov r11,rax
	
L_146:
	mov rbx,0
	cmp r11,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_147
	mov r15,r10
	mov rcx,r11
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r14,r15
	mov rdx,10
	cmp r14,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_148
	mov rbx,48
	mov r15,rbx
	add r15,r14
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
	mov r15,r15
	
L_150:
	cmp r15, 0
	je L_151
	mov rbx,  [gbl+8*109]
	mov r9,rbx
	mov rdx,32
	mov r13,r14
	sub r13,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r13
	mov rbx,r9
	mov qword [arg+8*63],rbx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r15,r14
	jmp L_153
	
L_151:
	mov rbx,t125
	mov r15,rbx
	
L_153:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r12,r15
	jmp L_154
	
L_148:
	mov rbx,65
	mov r15,rbx
	add r15,r14
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
	mov r15,r15
	
L_156:
	cmp r15, 0
	je L_157
	mov rbx,  [gbl+8*109]
	mov r9,rbx
	mov rdx,32
	mov r13,r14
	sub r13,rdx
	mov rax,32
	sub r14,rax
	mov rsi,r14
	mov rdi,r13
	mov rdx,r9
	mov qword [arg+8*63],rdx
	mov     rsi, rsi
	mov     rdi, rdi
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r14, rax
	mov r15,r14
	jmp L_159
	
L_157:
	mov rbx,t125
	mov r15,rbx
	
L_159:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r12
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r12,r15
	
L_154:
	mov rbx,4
	mov r15,r11
	sub r15,rbx
	mov r11,r15
	jmp L_146
	
L_147:
	mov r15,r12
	mov r15,r15
	mov     rsi, t247
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, format
	mov rsi, r15 
	add rsi, 1 
	xor rax, rax
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
	call printf
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rbx,t252
	mov rdi,rbx
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
	mov rax, 0
	mov rbx, 0
	mov rcx, 0
	mov rdx, 0
	mov r8, 0
	mov r9, 0
	mov r10, 0
	mov r11, 0
	mov r12, 0
	mov r13, 0
	mov r14, 0
	mov r15, 0
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
	sub    rsp, 1152
	mov rdx,t109
	mov rbx,rdx
	mov qword [gbl+8*109],rbx
	mov rbx,  [rsp+8*136]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   3136
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

t226:
	 db 1," " ,0

t220:
	 db 4,"aaaa" ,0

t233:
	 db 1," " ,0

t252:
	 db 0,"" ,0

t240:
	 db 1," " ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

