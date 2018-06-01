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
	sub    rsp, 2944
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
        sub     rdx, 4928
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	push r14
	call global_init
	pop r14
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
	
L_961:
	mov rbx,r11
	imul rbx,r11
	cmp r13,rbx
	mov rbx, 0
	setl bl
	add r14,r14
	cmp rbx, 0
	mov qword [rsp+8*19],rbx
	je L_962
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	lea rax,[rbx+r13*8+8H]
	mov qword [rsp+8*21],rbx
	mov rbx,0
	mov [rax],rbx
	mov rbx,r13
	mov qword [rsp+8*23],rbx
	mov rbx,1
	add r13,rbx
	mov qword [rsp+8*22],rax
	jmp L_961
	
L_962:
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
	mov qword [rsp+8*26],rbx
	
L_964:
	mov rbx,r11
	imul rbx,r11
	cmp r13,rbx
	mov rbx, 0
	setl bl
	add r14,r14
	cmp rbx, 0
	mov qword [rsp+8*27],rbx
	je L_965
	mov rbx,  [rsp+8*26]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov rax,r13
	mov rdx,1
	add r13,rdx
	mov qword [rsp+8*30],rax
	jmp L_964
	
L_965:
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
	mov qword [rsp+8*32],rbx
	
L_967:
	cmp r13,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_968
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
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov rdx,0
	mov r14,rdx
	
L_970:
	cmp r14,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_971
	mov rbx,1
	mov r12,rbx
	neg r12
	mov rdx,  [rsp+8*32]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r14*8+8H]
	mov [r15],r12
	mov r15,r14
	mov rax,1
	add r14,rax
	jmp L_970
	
L_971:
	mov r15,r13
	mov rbx,1
	add r13,rbx
	jmp L_967
	
L_968:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,0
	lea r15,[r15+rdx*8+8H]
	mov rax,  [rsp+8*5]
	mov [r15],rax
	mov rdx,  [rsp+8*26]
	mov r15,rdx
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov rbx,  [rsp+8*6]
	mov [r15],rbx
	mov rax,  [rsp+8*32]
	mov r15,rax
	mov rdx,  [rsp+8*5]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	lea r15,[r15+rbx*8+8H]
	mov rbx,0
	mov [r15],rbx
	
L_973:
	mov rbx,  [rsp+8*3]
	cmp rbx,r10
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_974
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r14, [r15]
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r13, [r15]
	mov rbx,  [rsp+8*32]
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
	mov rax,  [rsp+8*26]
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
	jne L_1067
	mov rbx,0
	mov r15,rbx
	jmp L_1068
	
L_1067:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1068:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_975
	mov rbx,0
	mov r15,rbx
	jmp L_976
	
L_975:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1075
	mov rbx,0
	mov r15,rbx
	jmp L_1076
	
L_1075:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1076:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_976:
	cmp r15, 0
	je L_978
	mov rbx,  [rsp+8*32]
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
	je L_980
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rax,  [rsp+8*32]
	mov rdx,rax
	lea rbx,[rdx+r13*8+8H]
	mov rdx, [rbx]
	lea rbx,[rdx+r12*8+8H]
	mov [rbx],r15
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*95],rbx
	mov qword [rsp+8*94],rdx
	jne L_981
	mov rbx,0
	mov r15,rbx
	jmp L_982
	
L_981:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_982:
	cmp r15, 0
	je L_984
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_984:
	
L_980:
	
L_978:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	sub r15,rax
	mov r13,r15
	mov rax,  [rsp+8*26]
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
	jne L_1083
	mov rbx,0
	mov r15,rbx
	jmp L_1084
	
L_1083:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1084:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_985
	mov rbx,0
	mov r15,rbx
	jmp L_986
	
L_985:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1091
	mov rbx,0
	mov r15,rbx
	jmp L_1092
	
L_1091:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1092:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_986:
	cmp r15, 0
	je L_988
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	lea rax,[rbx+r13*8+8H]
	mov rbx, [rax]
	lea rax,[rbx+r12*8+8H]
	mov qword [rsp+8*119],rbx
	mov rbx, [rax]
	mov qword [rsp+8*120],rax
	mov rax,1
	mov rdx,rax
	neg rdx
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*121],rbx
	mov qword [rsp+8*122],rdx
	mov qword [rsp+8*123],rax
	je L_990
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea rax,[r15+r10*8+8H]
	mov [rax],r13
	mov rbx,  [rsp+8*26]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov qword [rsp+8*126],rax
	mov rax,  [rsp+8*13]
	mov rdx,1
	mov r14,rax
	add r14,rdx
	mov rdx,  [rsp+8*32]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_991
	mov rbx,0
	mov r15,rbx
	jmp L_992
	
L_991:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_992:
	cmp r15, 0
	je L_994
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_994:
	
L_990:
	
L_988:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r13,r15
	mov rax,  [rsp+8*26]
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
	jne L_1099
	mov rbx,0
	mov r15,rbx
	jmp L_1100
	
L_1099:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1100:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_995
	mov rbx,0
	mov r15,rbx
	jmp L_996
	
L_995:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1107
	mov rbx,0
	mov r15,rbx
	jmp L_1108
	
L_1107:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1108:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_996:
	cmp r15, 0
	je L_998
	mov rbx,  [rsp+8*32]
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
	je L_1000
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rdx,  [rsp+8*32]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1001
	mov rbx,0
	mov r15,rbx
	jmp L_1002
	
L_1001:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1002:
	cmp r15, 0
	je L_1004
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1004:
	
L_1000:
	
L_998:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r13,r15
	mov rax,  [rsp+8*26]
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
	jne L_1115
	mov rbx,0
	mov r15,rbx
	jmp L_1116
	
L_1115:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1116:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1005
	mov rbx,0
	mov r15,rbx
	jmp L_1006
	
L_1005:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1123
	mov rbx,0
	mov r15,rbx
	jmp L_1124
	
L_1123:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1124:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1006:
	cmp r15, 0
	je L_1008
	mov rbx,  [rsp+8*32]
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
	je L_1010
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rdx,  [rsp+8*32]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1011
	mov rbx,0
	mov r15,rbx
	jmp L_1012
	
L_1011:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1012:
	cmp r15, 0
	je L_1014
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1014:
	
L_1010:
	
L_1008:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r13,r15
	mov rax,  [rsp+8*26]
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
	jne L_1131
	mov rbx,0
	mov r15,rbx
	jmp L_1132
	
L_1131:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1132:
	mov r15,r15
	mov rbx,r15
	cmp rbx, 0
	mov qword [rsp+8*219],rbx
	jne L_1015
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*220],rbx
	jmp L_1016
	
L_1015:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1139
	mov rbx,0
	mov r15,rbx
	jmp L_1140
	
L_1139:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1140:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*226],rbx
	mov qword [rsp+8*220],rdx
	
L_1016:
	mov rbx,  [rsp+8*220]
	cmp rbx, 0
	je L_1018
	mov rbx,  [rsp+8*32]
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
	mov qword [rsp+8*228],rdx
	je L_1020
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rdx,  [rsp+8*32]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1021
	mov rbx,0
	mov r15,rbx
	jmp L_1022
	
L_1021:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1022:
	cmp r15, 0
	je L_1024
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1024:
	
L_1020:
	
L_1018:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r13,r15
	mov rax,  [rsp+8*26]
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
	jne L_1147
	mov rbx,0
	mov r15,rbx
	jmp L_1148
	
L_1147:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1148:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1025
	mov rbx,0
	mov r15,rbx
	jmp L_1026
	
L_1025:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1155
	mov rbx,0
	mov r15,rbx
	jmp L_1156
	
L_1155:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1156:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1026:
	cmp r15, 0
	je L_1028
	mov rbx,  [rsp+8*32]
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
	je L_1030
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rdx,  [rsp+8*32]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1031
	mov rbx,0
	mov r15,rbx
	jmp L_1032
	
L_1031:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1032:
	cmp r15, 0
	je L_1034
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1034:
	
L_1030:
	
L_1028:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	add r15,rax
	mov r13,r15
	mov rax,  [rsp+8*26]
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
	jne L_1163
	mov rbx,0
	mov r15,rbx
	jmp L_1164
	
L_1163:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1164:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1035
	mov rbx,0
	mov r15,rbx
	jmp L_1036
	
L_1035:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1171
	mov rbx,0
	mov r15,rbx
	jmp L_1172
	
L_1171:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1172:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1036:
	cmp r15, 0
	je L_1038
	mov rbx,  [rsp+8*32]
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
	je L_1040
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rdx,  [rsp+8*32]
	mov r15,rdx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1041
	mov rbx,0
	mov r15,rbx
	jmp L_1042
	
L_1041:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1042:
	cmp r15, 0
	je L_1044
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1044:
	
L_1040:
	
L_1038:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	add r15,rax
	mov r13,r15
	mov rax,  [rsp+8*26]
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
	jne L_1179
	mov rbx,0
	mov r15,rbx
	jmp L_1180
	
L_1179:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1180:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1045
	mov rbx,0
	mov r15,rbx
	jmp L_1046
	
L_1045:
	mov rsi,r11
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1187
	mov rbx,0
	mov r15,rbx
	jmp L_1188
	
L_1187:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1188:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1046:
	cmp r15, 0
	je L_1048
	mov rbx,  [rsp+8*32]
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
	je L_1050
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r10*8+8H]
	mov [r15],r13
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+r10*8+8H]
	mov [r15],r12
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	cmp r13,r8
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1051
	mov rbx,0
	mov r15,rbx
	jmp L_1052
	
L_1051:
	cmp r12,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1052:
	cmp r15, 0
	je L_1054
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1054:
	
L_1050:
	
L_1048:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1056
	jmp L_974
	
L_1056:
	mov rbx,  [rsp+8*3]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov qword [rsp+8*3],rbx
	jmp L_973
	
L_974:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1057
	mov rbx,  [rsp+8*32]
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
	jmp L_1058
	
L_1057:
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
	
L_1058:
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2944
	mov rbx,  [rsp+8*360]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   4928
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

