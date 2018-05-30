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
	mov r13,rbx
	mov rdx,0
	mov r12,rdx
	mov rax,0
	mov r9,rax
	mov rdx,0
	mov rbx,rdx
	mov rax,0
	mov rdx,rax
	mov rax,1
	mov r15,r13
	sub r15,rax
	mov r14,r15
	mov rax,1
	mov r15,r13
	sub r15,rax
	mov r15,r15
	mov qword [rsp+8*5],rbx
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*6],rdx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*11],rax
	mov rax,0
	mov rdx,rax
	mov rax,0
	mov r11,rax
	mov r10,r13
	imul r10,r13
	mov qword [rsp+8*12],rbx
	mov qword [rsp+8*13],rdx
	mov     rdi,  r10
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
	mov r10,r10
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_1208:
	mov r8,r13
	imul r8,r13
	mov rbx,  [rsp+8*18]
	cmp rbx,r8
	mov r8, 0
	setl r8B
	mov rdx,  [rsp+8*20]
	add rdx,rdx
	cmp r8, 0
	mov qword [rsp+8*20],rdx
	je L_1209
	mov r8,r10
	mov rbx,  [rsp+8*18]
	lea r8,[r8+rbx*8+8H]
	mov rdx,0
	mov [r8],rdx
	mov r8,rbx
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*18],rbx
	jmp L_1208
	
L_1209:
	mov r8,r13
	imul r8,r13
	mov     rdi,  r8
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r8, rax
	mov r8,r8
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_1211:
	mov rbx,r13
	imul rbx,r13
	mov rdx,  [rsp+8*18]
	cmp rdx,rbx
	mov rbx, 0
	setl bl
	mov rax,  [rsp+8*20]
	add rax,rax
	cmp rbx, 0
	mov qword [rsp+8*27],rbx
	mov qword [rsp+8*20],rax
	je L_1212
	mov rbx,r8
	mov rdx,  [rsp+8*18]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*28],rbx
	mov rbx,0
	mov [rax],rbx
	mov rbx,rdx
	mov qword [rsp+8*30],rbx
	mov rbx,1
	add rdx,rbx
	mov qword [rsp+8*18],rdx
	mov qword [rsp+8*29],rax
	jmp L_1211
	
L_1212:
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
	mov     qword [rsp+8*31], rax
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*32],rbx
	mov qword [rsp+8*18],rax
	
L_1214:
	mov rbx,  [rsp+8*18]
	cmp rbx,r13
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*33],rdx
	je L_1215
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
	mov     qword [rsp+8*34], rax
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*18]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*35],rbx
	mov rbx,  [rsp+8*34]
	mov [rdx],rbx
	mov qword [rsp+8*36],rdx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*37],rbx
	
L_1217:
	mov rbx,  [rsp+8*37]
	cmp rbx,r13
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*38],rdx
	je L_1218
	mov rbx,1
	mov rdx,rbx
	neg rdx
	mov rbx,  [rsp+8*32]
	mov rax,rbx
	mov qword [rsp+8*39],rdx
	mov rdx,  [rsp+8*18]
	lea rbx,[rax+rdx*8+8H]
	mov rax, [rbx]
	mov rdx,  [rsp+8*37]
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*40],rax
	mov rax,  [rsp+8*39]
	mov [rbx],rax
	mov qword [rsp+8*41],rbx
	mov rbx,rdx
	mov qword [rsp+8*42],rbx
	mov rbx,1
	add rdx,rbx
	mov qword [rsp+8*37],rdx
	jmp L_1217
	
L_1218:
	mov rdx,  [rsp+8*18]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*43],rbx
	mov qword [rsp+8*18],rdx
	jmp L_1214
	
L_1215:
	mov rbx,r10
	mov rdx,0
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*44],rbx
	mov rbx,  [rsp+8*5]
	mov [rax],rbx
	mov rdx,r8
	mov qword [rsp+8*45],rax
	mov rax,0
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*46],rdx
	mov rdx,  [rsp+8*6]
	mov [rbx],rdx
	mov qword [rsp+8*47],rbx
	mov rax,  [rsp+8*32]
	mov rbx,rax
	mov rdx,  [rsp+8*5]
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*6]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*48],rbx
	mov rbx,0
	mov [rax],rbx
	mov qword [rsp+8*49],rax
	
L_1220:
	cmp r12,r9
	mov rbx, 0
	setle bl
	cmp rbx, 0
	mov qword [rsp+8*50],rbx
	je L_1221
	mov rbx,r10
	lea rdx,[rbx+r12*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*51],rbx
	mov rbx,r8
	mov qword [rsp+8*52],rdx
	lea rdx,[rbx+r12*8+8H]
	mov qword [rsp+8*54],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*55],rdx
	mov qword [rsp+8*53],rax
	mov rax,  [rsp+8*32]
	mov rdx,rax
	mov qword [rsp+8*56],rbx
	mov rbx,  [rsp+8*53]
	lea rax,[rdx+rbx*8+8H]
	mov rdx, [rax]
	mov rbx,  [rsp+8*56]
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*57],rdx
	mov rdx,rbx
	mov qword [rsp+8*59],rbx
	mov rbx,r10
	mov qword [rsp+8*58],rax
	lea rax,[rbx+r12*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rax]
	mov qword [rsp+8*61],rax
	mov rax,1
	mov qword [rsp+8*13],rdx
	mov rdx,rbx
	sub rdx,rax
	mov qword [rsp+8*62],rbx
	mov rbx,rdx
	mov rdx,r8
	lea rax,[rdx+r12*8+8H]
	mov qword [rsp+8*64],rdx
	mov rdx, [rax]
	mov qword [rsp+8*65],rax
	mov rax,2
	mov qword [rsp+8*11],rbx
	mov rbx,rdx
	sub rbx,rax
	mov qword [rsp+8*66],rdx
	mov rdx,rbx
	mov rsi,r13
	mov rbx,  [rsp+8*11]
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*12],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*70],rax
	jne L_1310
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1311
	
L_1310:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1311:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*75],rax
	jne L_1222
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*76],rbx
	jmp L_1223
	
L_1222:
	mov rsi,r13
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*71],rax
	jne L_1314
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1315
	
L_1314:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1315:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*76],rdx
	mov qword [rsp+8*77],rax
	
L_1223:
	mov rbx,  [rsp+8*76]
	cmp rbx, 0
	je L_1225
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*11]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*78],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*79],rdx
	mov rdx,1
	mov rax,rdx
	neg rax
	cmp rbx,rax
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*80],rbx
	mov qword [rsp+8*82],rdx
	mov qword [rsp+8*81],rax
	je L_1227
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,r10
	lea rax,[rdx+r9*8+8H]
	mov rbx,  [rsp+8*11]
	mov [rax],rbx
	mov qword [rsp+8*84],rdx
	mov rdx,r8
	mov qword [rsp+8*85],rax
	lea rax,[rdx+r9*8+8H]
	mov qword [rsp+8*86],rdx
	mov rdx,  [rsp+8*12]
	mov [rax],rdx
	mov qword [rsp+8*87],rax
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*88],rdx
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*11]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*89],rbx
	mov rbx,  [rsp+8*88]
	mov [rdx],rbx
	mov rbx,  [rsp+8*11]
	cmp rbx,r14
	mov qword [rsp+8*90],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*91],rdx
	jne L_1228
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*91],rbx
	jmp L_1229
	
L_1228:
	mov rbx,  [rsp+8*12]
	cmp rbx,r15
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*92],rdx
	mov qword [rsp+8*91],rax
	
L_1229:
	mov rbx,  [rsp+8*91]
	cmp rbx, 0
	je L_1231
	mov rbx,1
	mov r11,rbx
	
L_1231:
	
L_1227:
	
L_1225:
	mov rbx,r10
	lea rdx,[rbx+r12*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*93],rbx
	mov rbx,1
	mov qword [rsp+8*94],rdx
	mov rdx,rax
	sub rdx,rbx
	mov rbx,rdx
	mov rdx,r8
	mov qword [rsp+8*95],rax
	lea rax,[rdx+r12*8+8H]
	mov qword [rsp+8*97],rdx
	mov rdx, [rax]
	mov qword [rsp+8*98],rax
	mov rax,2
	mov qword [rsp+8*11],rbx
	mov rbx,rdx
	add rbx,rax
	mov qword [rsp+8*99],rdx
	mov rdx,rbx
	mov rsi,r13
	mov rbx,  [rsp+8*11]
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*12],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*70],rax
	jne L_1318
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1319
	
L_1318:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1319:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*101],rax
	jne L_1232
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*102],rbx
	jmp L_1233
	
L_1232:
	mov rsi,r13
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*71],rax
	jne L_1322
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1323
	
L_1322:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1323:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*102],rdx
	mov qword [rsp+8*103],rax
	
L_1233:
	mov rbx,  [rsp+8*102]
	cmp rbx, 0
	je L_1235
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*11]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*104],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*105],rdx
	mov rdx,1
	mov rax,rdx
	neg rax
	cmp rbx,rax
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*106],rbx
	mov qword [rsp+8*108],rdx
	mov qword [rsp+8*107],rax
	je L_1237
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,r10
	lea rax,[rdx+r9*8+8H]
	mov rbx,  [rsp+8*11]
	mov [rax],rbx
	mov qword [rsp+8*110],rdx
	mov rdx,r8
	mov qword [rsp+8*111],rax
	lea rax,[rdx+r9*8+8H]
	mov qword [rsp+8*112],rdx
	mov rdx,  [rsp+8*12]
	mov [rax],rdx
	mov qword [rsp+8*113],rax
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*114],rdx
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*11]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*115],rbx
	mov rbx,  [rsp+8*114]
	mov [rdx],rbx
	mov rbx,  [rsp+8*11]
	cmp rbx,r14
	mov qword [rsp+8*116],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*117],rdx
	jne L_1238
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*117],rbx
	jmp L_1239
	
L_1238:
	mov rbx,  [rsp+8*12]
	cmp rbx,r15
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*118],rdx
	mov qword [rsp+8*117],rax
	
L_1239:
	mov rbx,  [rsp+8*117]
	cmp rbx, 0
	je L_1241
	mov rbx,1
	mov r11,rbx
	
L_1241:
	
L_1237:
	
L_1235:
	mov rbx,r10
	lea rdx,[rbx+r12*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*119],rbx
	mov rbx,1
	mov qword [rsp+8*120],rdx
	mov rdx,rax
	add rdx,rbx
	mov rbx,rdx
	mov rdx,r8
	mov qword [rsp+8*121],rax
	lea rax,[rdx+r12*8+8H]
	mov qword [rsp+8*123],rdx
	mov rdx, [rax]
	mov qword [rsp+8*124],rax
	mov rax,2
	mov qword [rsp+8*11],rbx
	mov rbx,rdx
	sub rbx,rax
	mov qword [rsp+8*125],rdx
	mov rdx,rbx
	mov rsi,r13
	mov rbx,  [rsp+8*11]
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*12],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*70],rax
	jne L_1326
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1327
	
L_1326:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1327:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*127],rax
	jne L_1242
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*128],rbx
	jmp L_1243
	
L_1242:
	mov rsi,r13
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*71],rax
	jne L_1330
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1331
	
L_1330:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1331:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*128],rdx
	mov qword [rsp+8*129],rax
	
L_1243:
	mov rbx,  [rsp+8*128]
	cmp rbx, 0
	je L_1245
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*11]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*130],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*131],rdx
	mov rdx,1
	mov rax,rdx
	neg rax
	cmp rbx,rax
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*132],rbx
	mov qword [rsp+8*134],rdx
	mov qword [rsp+8*133],rax
	je L_1247
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,r10
	lea rax,[rdx+r9*8+8H]
	mov rbx,  [rsp+8*11]
	mov [rax],rbx
	mov qword [rsp+8*136],rdx
	mov rdx,r8
	mov qword [rsp+8*137],rax
	lea rax,[rdx+r9*8+8H]
	mov qword [rsp+8*138],rdx
	mov rdx,  [rsp+8*12]
	mov [rax],rdx
	mov qword [rsp+8*139],rax
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*140],rdx
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*11]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*141],rbx
	mov rbx,  [rsp+8*140]
	mov [rdx],rbx
	mov rbx,  [rsp+8*11]
	cmp rbx,r14
	mov qword [rsp+8*142],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*143],rdx
	jne L_1248
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*143],rbx
	jmp L_1249
	
L_1248:
	mov rbx,  [rsp+8*12]
	cmp rbx,r15
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*144],rdx
	mov qword [rsp+8*143],rax
	
L_1249:
	mov rbx,  [rsp+8*143]
	cmp rbx, 0
	je L_1251
	mov rbx,1
	mov r11,rbx
	
L_1251:
	
L_1247:
	
L_1245:
	mov rbx,r10
	lea rdx,[rbx+r12*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*145],rbx
	mov rbx,1
	mov qword [rsp+8*146],rdx
	mov rdx,rax
	add rdx,rbx
	mov rbx,rdx
	mov rdx,r8
	mov qword [rsp+8*147],rax
	lea rax,[rdx+r12*8+8H]
	mov qword [rsp+8*149],rdx
	mov rdx, [rax]
	mov qword [rsp+8*150],rax
	mov rax,2
	mov qword [rsp+8*11],rbx
	mov rbx,rdx
	add rbx,rax
	mov qword [rsp+8*151],rdx
	mov rdx,rbx
	mov rsi,r13
	mov rbx,  [rsp+8*11]
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*12],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*70],rax
	jne L_1334
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1335
	
L_1334:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1335:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*153],rax
	jne L_1252
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*154],rbx
	jmp L_1253
	
L_1252:
	mov rsi,r13
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*71],rax
	jne L_1338
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1339
	
L_1338:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1339:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*154],rdx
	mov qword [rsp+8*155],rax
	
L_1253:
	mov rbx,  [rsp+8*154]
	cmp rbx, 0
	je L_1255
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*11]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*156],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*157],rdx
	mov rdx,1
	mov rax,rdx
	neg rax
	cmp rbx,rax
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*158],rbx
	mov qword [rsp+8*160],rdx
	mov qword [rsp+8*159],rax
	je L_1257
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,r10
	lea rax,[rdx+r9*8+8H]
	mov rbx,  [rsp+8*11]
	mov [rax],rbx
	mov qword [rsp+8*162],rdx
	mov rdx,r8
	mov qword [rsp+8*163],rax
	lea rax,[rdx+r9*8+8H]
	mov qword [rsp+8*164],rdx
	mov rdx,  [rsp+8*12]
	mov [rax],rdx
	mov qword [rsp+8*165],rax
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*166],rdx
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*11]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*167],rbx
	mov rbx,  [rsp+8*166]
	mov [rdx],rbx
	mov rbx,  [rsp+8*11]
	cmp rbx,r14
	mov qword [rsp+8*168],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*169],rdx
	jne L_1258
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*169],rbx
	jmp L_1259
	
L_1258:
	mov rbx,  [rsp+8*12]
	cmp rbx,r15
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*170],rdx
	mov qword [rsp+8*169],rax
	
L_1259:
	mov rbx,  [rsp+8*169]
	cmp rbx, 0
	je L_1261
	mov rbx,1
	mov r11,rbx
	
L_1261:
	
L_1257:
	
L_1255:
	mov rbx,r10
	lea rdx,[rbx+r12*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*171],rbx
	mov rbx,2
	mov qword [rsp+8*172],rdx
	mov rdx,rax
	sub rdx,rbx
	mov rbx,rdx
	mov rdx,r8
	mov qword [rsp+8*173],rax
	lea rax,[rdx+r12*8+8H]
	mov qword [rsp+8*175],rdx
	mov rdx, [rax]
	mov qword [rsp+8*176],rax
	mov rax,1
	mov qword [rsp+8*11],rbx
	mov rbx,rdx
	sub rbx,rax
	mov qword [rsp+8*177],rdx
	mov rdx,rbx
	mov rsi,r13
	mov rbx,  [rsp+8*11]
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*12],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*70],rax
	jne L_1342
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1343
	
L_1342:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1343:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*179],rax
	jne L_1262
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*180],rbx
	jmp L_1263
	
L_1262:
	mov rsi,r13
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*71],rax
	jne L_1346
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1347
	
L_1346:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1347:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*180],rdx
	mov qword [rsp+8*181],rax
	
L_1263:
	mov rbx,  [rsp+8*180]
	cmp rbx, 0
	je L_1265
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*11]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*182],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*183],rdx
	mov rdx,1
	mov rax,rdx
	neg rax
	cmp rbx,rax
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*184],rbx
	mov qword [rsp+8*186],rdx
	mov qword [rsp+8*185],rax
	je L_1267
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,r10
	lea rax,[rdx+r9*8+8H]
	mov rbx,  [rsp+8*11]
	mov [rax],rbx
	mov qword [rsp+8*188],rdx
	mov rdx,r8
	mov qword [rsp+8*189],rax
	lea rax,[rdx+r9*8+8H]
	mov qword [rsp+8*190],rdx
	mov rdx,  [rsp+8*12]
	mov [rax],rdx
	mov qword [rsp+8*191],rax
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*192],rdx
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*11]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*193],rbx
	mov rbx,  [rsp+8*192]
	mov [rdx],rbx
	mov rbx,  [rsp+8*11]
	cmp rbx,r14
	mov qword [rsp+8*194],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*195],rdx
	jne L_1268
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*195],rbx
	jmp L_1269
	
L_1268:
	mov rbx,  [rsp+8*12]
	cmp rbx,r15
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*196],rdx
	mov qword [rsp+8*195],rax
	
L_1269:
	mov rbx,  [rsp+8*195]
	cmp rbx, 0
	je L_1271
	mov rbx,1
	mov r11,rbx
	
L_1271:
	
L_1267:
	
L_1265:
	mov rbx,r10
	lea rdx,[rbx+r12*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*197],rbx
	mov rbx,2
	mov qword [rsp+8*198],rdx
	mov rdx,rax
	sub rdx,rbx
	mov rbx,rdx
	mov rdx,r8
	mov qword [rsp+8*199],rax
	lea rax,[rdx+r12*8+8H]
	mov qword [rsp+8*201],rdx
	mov rdx, [rax]
	mov qword [rsp+8*202],rax
	mov rax,1
	mov qword [rsp+8*11],rbx
	mov rbx,rdx
	add rbx,rax
	mov qword [rsp+8*203],rdx
	mov rdx,rbx
	mov rsi,r13
	mov rbx,  [rsp+8*11]
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*12],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*70],rax
	jne L_1350
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1351
	
L_1350:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1351:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*205],rax
	jne L_1272
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*206],rbx
	jmp L_1273
	
L_1272:
	mov rsi,r13
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*71],rax
	jne L_1354
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1355
	
L_1354:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1355:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*206],rdx
	mov qword [rsp+8*207],rax
	
L_1273:
	mov rbx,  [rsp+8*206]
	cmp rbx, 0
	je L_1275
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*11]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*208],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*209],rdx
	mov rdx,1
	mov rax,rdx
	neg rax
	cmp rbx,rax
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*210],rbx
	mov qword [rsp+8*212],rdx
	mov qword [rsp+8*211],rax
	je L_1277
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,r10
	lea rax,[rdx+r9*8+8H]
	mov rbx,  [rsp+8*11]
	mov [rax],rbx
	mov qword [rsp+8*214],rdx
	mov rdx,r8
	mov qword [rsp+8*215],rax
	lea rax,[rdx+r9*8+8H]
	mov qword [rsp+8*216],rdx
	mov rdx,  [rsp+8*12]
	mov [rax],rdx
	mov qword [rsp+8*217],rax
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*218],rdx
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*11]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*219],rbx
	mov rbx,  [rsp+8*218]
	mov [rdx],rbx
	mov rbx,  [rsp+8*11]
	cmp rbx,r14
	mov qword [rsp+8*220],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*221],rdx
	jne L_1278
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*221],rbx
	jmp L_1279
	
L_1278:
	mov rbx,  [rsp+8*12]
	cmp rbx,r15
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*222],rdx
	mov qword [rsp+8*221],rax
	
L_1279:
	mov rbx,  [rsp+8*221]
	cmp rbx, 0
	je L_1281
	mov rbx,1
	mov r11,rbx
	
L_1281:
	
L_1277:
	
L_1275:
	mov rbx,r10
	lea rdx,[rbx+r12*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*223],rbx
	mov rbx,2
	mov qword [rsp+8*224],rdx
	mov rdx,rax
	add rdx,rbx
	mov rbx,rdx
	mov rdx,r8
	mov qword [rsp+8*225],rax
	lea rax,[rdx+r12*8+8H]
	mov qword [rsp+8*227],rdx
	mov rdx, [rax]
	mov qword [rsp+8*228],rax
	mov rax,1
	mov qword [rsp+8*11],rbx
	mov rbx,rdx
	sub rbx,rax
	mov qword [rsp+8*229],rdx
	mov rdx,rbx
	mov rsi,r13
	mov rbx,  [rsp+8*11]
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*12],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*70],rax
	jne L_1358
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1359
	
L_1358:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1359:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*231],rax
	jne L_1282
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*232],rbx
	jmp L_1283
	
L_1282:
	mov rsi,r13
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*71],rax
	jne L_1362
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1363
	
L_1362:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1363:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*232],rdx
	mov qword [rsp+8*233],rax
	
L_1283:
	mov rbx,  [rsp+8*232]
	cmp rbx, 0
	je L_1285
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*11]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*234],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*235],rdx
	mov rdx,1
	mov rax,rdx
	neg rax
	cmp rbx,rax
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*236],rbx
	mov qword [rsp+8*238],rdx
	mov qword [rsp+8*237],rax
	je L_1287
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,r10
	lea rax,[rdx+r9*8+8H]
	mov rbx,  [rsp+8*11]
	mov [rax],rbx
	mov qword [rsp+8*240],rdx
	mov rdx,r8
	mov qword [rsp+8*241],rax
	lea rax,[rdx+r9*8+8H]
	mov qword [rsp+8*242],rdx
	mov rdx,  [rsp+8*12]
	mov [rax],rdx
	mov qword [rsp+8*243],rax
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*244],rdx
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*11]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*245],rbx
	mov rbx,  [rsp+8*244]
	mov [rdx],rbx
	mov rbx,  [rsp+8*11]
	cmp rbx,r14
	mov qword [rsp+8*246],rdx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*247],rdx
	jne L_1288
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*247],rbx
	jmp L_1289
	
L_1288:
	mov rbx,  [rsp+8*12]
	cmp rbx,r15
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*248],rdx
	mov qword [rsp+8*247],rax
	
L_1289:
	mov rbx,  [rsp+8*247]
	cmp rbx, 0
	je L_1291
	mov rbx,1
	mov r11,rbx
	
L_1291:
	
L_1287:
	
L_1285:
	mov rbx,r10
	lea rdx,[rbx+r12*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*249],rbx
	mov rbx,2
	mov qword [rsp+8*250],rdx
	mov rdx,rax
	add rdx,rbx
	mov rbx,rdx
	mov rdx,r8
	mov qword [rsp+8*251],rax
	lea rax,[rdx+r12*8+8H]
	mov qword [rsp+8*253],rdx
	mov rdx, [rax]
	mov qword [rsp+8*254],rax
	mov rax,1
	mov qword [rsp+8*11],rbx
	mov rbx,rdx
	add rbx,rax
	mov qword [rsp+8*255],rdx
	mov rdx,rbx
	mov rsi,r13
	mov rbx,  [rsp+8*11]
	mov rdi,rbx
	mov rax,rdi
	mov qword [rsp+8*12],rdx
	mov rdx,rsi
	cmp rax,rdx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*70],rax
	jne L_1366
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1367
	
L_1366:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1367:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*257],rax
	jne L_1292
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*258],rbx
	jmp L_1293
	
L_1292:
	mov rsi,r13
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*71],rax
	jne L_1370
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1371
	
L_1370:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1371:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*74],rbx
	mov rbx,rax
	mov qword [rsp+8*258],rbx
	mov qword [rsp+8*259],rax
	
L_1293:
	mov rbx,  [rsp+8*258]
	cmp rbx, 0
	je L_1295
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*11]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*260],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*261],rdx
	mov rdx,1
	mov rax,rdx
	neg rax
	cmp rbx,rax
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*262],rbx
	mov qword [rsp+8*264],rdx
	mov qword [rsp+8*263],rax
	je L_1297
	mov rbx,1
	add r9,rbx
	mov r9,r9
	mov rdx,r10
	lea rax,[rdx+r9*8+8H]
	mov rbx,  [rsp+8*11]
	mov [rax],rbx
	mov qword [rsp+8*266],rdx
	mov rdx,r8
	mov qword [rsp+8*267],rax
	lea rax,[rdx+r9*8+8H]
	mov qword [rsp+8*268],rdx
	mov rdx,  [rsp+8*12]
	mov [rax],rdx
	mov qword [rsp+8*269],rax
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov rax,  [rsp+8*32]
	mov rbx,rax
	mov qword [rsp+8*270],rdx
	mov rdx,  [rsp+8*11]
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*12]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*271],rbx
	mov rbx,  [rsp+8*270]
	mov [rax],rbx
	mov rbx,  [rsp+8*11]
	cmp rbx,r14
	mov qword [rsp+8*272],rax
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*273],rax
	jne L_1298
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*273],rbx
	jmp L_1299
	
L_1298:
	mov rbx,  [rsp+8*12]
	cmp rbx,r15
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*274],rdx
	mov qword [rsp+8*273],rax
	
L_1299:
	mov rbx,  [rsp+8*273]
	cmp rbx, 0
	je L_1301
	mov rbx,1
	mov r11,rbx
	
L_1301:
	
L_1297:
	
L_1295:
	mov rbx,1
	cmp r11,rbx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*275],rdx
	je L_1303
	jmp L_1221
	
L_1303:
	mov rbx,1
	add r12,rbx
	mov r12,r12
	jmp L_1220
	
L_1221:
	mov rbx,1
	cmp r11,rbx
	mov r13, 0
	sete r13B
	cmp r13, 0
	je L_1304
	mov rbx,  [rsp+8*32]
	mov r13,rbx
	lea r14,[r13+r14*8+8H]
	mov r13, [r14]
	lea r14,[r13+r15*8+8H]
	mov r15, [r14]
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
	jmp L_1305
	
L_1304:
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
	
L_1305:
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

