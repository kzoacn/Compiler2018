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
	sub    rsp, 2336
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
        sub     rdx, 4320
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rbx,102
	mov r10,rbx
	mov rax,0
	mov rdx,rax
	mov rbx,0
	mov r9,rbx
	mov rbx,0
	mov r12,rbx
	mov rbx,0
	mov r13,rbx
	mov rbx,1
	mov r15,r10
	sub r15,rbx
	mov rbx,r15
	mov rax,1
	mov r15,r10
	sub r15,rax
	mov rax,r15
	mov qword [rsp+8*3],rdx
	mov rdx,0
	mov r8,rdx
	mov qword [rsp+8*8],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*10],rax
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*12],rdx
	mov rdx,0
	mov rax,rdx
	mov r15,r10
	imul r15,r10
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
	
L_859:
	mov r15,r10
	imul r15,r10
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_860
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r14
	mov rax,1
	add r14,rax
	jmp L_859
	
L_860:
	mov r15,r10
	imul r15,r10
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
	mov r11,r15
	mov rbx,0
	mov r14,rbx
	
L_862:
	mov r15,r10
	imul r15,r10
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_863
	mov r15,r11
	lea r15,[r15+r14*8+8H]
	mov rbx,0
	mov [r15],rbx
	mov r15,r14
	mov rdx,1
	add r14,rdx
	jmp L_862
	
L_863:
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
	mov     qword  r15, rax
	mov rbx,r15
	mov rdx,0
	mov r14,rdx
	mov qword [rsp+8*31],rbx
	
L_865:
	cmp r14,r10
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_866
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
	mov     qword [rsp+8*33], rax
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov rdx,  [rsp+8*33]
	mov [r15],rdx
	mov rax,0
	mov r15,rax
	
L_868:
	cmp r15,r10
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*37],rbx
	je L_869
	mov rbx,1
	mov rdx,rbx
	neg rdx
	mov rbx,  [rsp+8*31]
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	lea rdx,[rax+r14*8+8H]
	mov rax, [rdx]
	lea rdx,[rax+r15*8+8H]
	mov qword [rsp+8*39],rax
	mov rax,  [rsp+8*38]
	mov [rdx],rax
	mov qword [rsp+8*40],rdx
	mov rdx,r15
	mov qword [rsp+8*41],rdx
	mov rdx,1
	add r15,rdx
	jmp L_868
	
L_869:
	mov r15,r14
	mov rbx,1
	add r14,rbx
	jmp L_865
	
L_866:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,0
	lea r15,[r15+rdx*8+8H]
	mov [r15],r12
	mov rax,r11
	mov rdx,0
	lea r15,[rax+rdx*8+8H]
	mov [r15],r13
	mov qword [rsp+8*45],rax
	mov rax,  [rsp+8*31]
	mov rdx,rax
	lea r15,[rdx+r12*8+8H]
	mov rdx, [r15]
	lea r15,[rdx+r13*8+8H]
	mov qword [rsp+8*47],rdx
	mov rdx,0
	mov [r15],rdx
	
L_871:
	mov rbx,  [rsp+8*3]
	cmp rbx,r9
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_872
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r14, [r15]
	mov r15,r11
	lea r15,[r15+rdx*8+8H]
	mov rax, [r15]
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	lea r15,[r15+rax*8+8H]
	mov r15, [r15]
	mov qword [rsp+8*55],rax
	mov rax,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	mov rbx,  [rsp+8*3]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov qword [rsp+8*13],rax
	mov rax,1
	sub r15,rax
	mov r8,r15
	mov rax,r11
	lea rdx,[rax+rbx*8+8H]
	mov qword [rsp+8*63],rax
	mov rax, [rdx]
	mov qword [rsp+8*64],rdx
	mov rdx,2
	mov rbx,rax
	sub rbx,rdx
	mov rdx,rbx
	mov rsi,r10
	mov rdi,r8
	mov rbx,rdi
	mov qword [rsp+8*65],rax
	mov rax,rsi
	cmp rbx,rax
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*69],rbx
	mov qword [rsp+8*12],rdx
	mov qword [rsp+8*70],rax
	jne L_961
	mov rbx,0
	mov r15,rbx
	jmp L_962
	
L_961:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_962:
	mov r15,r15
	mov rbx,r15
	cmp rbx, 0
	mov qword [rsp+8*74],rbx
	jne L_873
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_874
	
L_873:
	mov rsi,r10
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*69],rdx
	mov qword [rsp+8*70],rax
	jne L_965
	mov rbx,0
	mov r15,rbx
	jmp L_966
	
L_965:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_966:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*76],rbx
	mov qword [rsp+8*75],rdx
	
L_874:
	mov rbx,  [rsp+8*75]
	cmp rbx, 0
	je L_876
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	lea rax,[rbx+r8*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*12]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*77],rbx
	mov rbx, [rax]
	mov qword [rsp+8*78],rax
	mov rax,1
	mov rdx,rax
	neg rdx
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*79],rbx
	mov qword [rsp+8*80],rdx
	mov qword [rsp+8*81],rax
	je L_878
	mov rbx,1
	mov rdx,r9
	add rdx,rbx
	mov r9,rdx
	mov rbx,  [rsp+8*17]
	mov rax,rbx
	lea rdx,[rax+r9*8+8H]
	mov [rdx],r8
	mov qword [rsp+8*84],rdx
	mov rdx,r11
	mov qword [rsp+8*83],rax
	lea rax,[rdx+r9*8+8H]
	mov qword [rsp+8*85],rdx
	mov rdx,  [rsp+8*12]
	mov [rax],rdx
	mov qword [rsp+8*86],rax
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*87],rdx
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	lea rax,[rbx+r8*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*12]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*88],rbx
	mov rbx,  [rsp+8*87]
	mov [rax],rbx
	mov rbx,  [rsp+8*8]
	cmp r8,rbx
	mov qword [rsp+8*89],rax
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*90],rax
	jne L_879
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*90],rbx
	jmp L_880
	
L_879:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*90],rbx
	mov qword [rsp+8*91],rax
	
L_880:
	mov rbx,  [rsp+8*90]
	cmp rbx, 0
	je L_882
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_882:
	
L_878:
	
L_876:
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*3]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*92],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*93],rdx
	mov rdx,1
	mov rax,rbx
	sub rax,rdx
	mov r8,rax
	mov qword [rsp+8*94],rbx
	mov rbx,r11
	mov rdx,  [rsp+8*3]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*96],rbx
	mov rbx, [rax]
	mov qword [rsp+8*97],rax
	mov rax,2
	mov rdx,rbx
	add rdx,rax
	mov qword [rsp+8*98],rbx
	mov rbx,rdx
	mov rsi,r10
	mov rdi,r8
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*12],rbx
	mov qword [rsp+8*69],rdx
	mov qword [rsp+8*70],rax
	jne L_969
	mov rbx,0
	mov r15,rbx
	jmp L_970
	
L_969:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_970:
	mov r15,r15
	mov rbx,r15
	cmp rbx, 0
	mov qword [rsp+8*100],rbx
	jne L_883
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*101],rbx
	jmp L_884
	
L_883:
	mov rsi,r10
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*69],rdx
	mov qword [rsp+8*70],rax
	jne L_973
	mov rbx,0
	mov r15,rbx
	jmp L_974
	
L_973:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_974:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*102],rbx
	mov qword [rsp+8*101],rdx
	
L_884:
	mov rbx,  [rsp+8*101]
	cmp rbx, 0
	je L_886
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov r15, [r15]
	mov rdx,  [rsp+8*12]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	mov r14,rax
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_888
	mov rbx,1
	mov r15,r9
	add r15,rbx
	mov r9,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r9*8+8H]
	mov [r15],r8
	mov r15,r11
	lea r15,[r15+r9*8+8H]
	mov rax,  [rsp+8*12]
	mov [r15],rax
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rdx,  [rsp+8*31]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov r15, [r15]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	mov rbx,  [rsp+8*8]
	cmp r8,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_889
	mov rbx,0
	mov r15,rbx
	jmp L_890
	
L_889:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_890:
	cmp r15, 0
	je L_892
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_892:
	
L_888:
	
L_886:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r8,r15
	mov r15,r11
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov rax,r15
	mov rsi,r10
	mov rdi,r8
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*69],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*12],rax
	jne L_977
	mov rbx,0
	mov r15,rbx
	jmp L_978
	
L_977:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_978:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_893
	mov rbx,0
	mov r15,rbx
	jmp L_894
	
L_893:
	mov rsi,r10
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*69],rdx
	mov qword [rsp+8*70],rax
	jne L_981
	mov rbx,0
	mov r15,rbx
	jmp L_982
	
L_981:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_982:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_894:
	cmp r15, 0
	je L_896
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov r15, [r15]
	mov rdx,  [rsp+8*12]
	lea r15,[r15+rdx*8+8H]
	mov rax, [r15]
	mov rbx,1
	mov r15,rbx
	neg r15
	cmp rax,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*131],rax
	je L_898
	mov rbx,1
	mov r15,r9
	add r15,rbx
	mov r9,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r9*8+8H]
	mov [r15],r8
	mov r15,r11
	lea r15,[r15+r9*8+8H]
	mov rax,  [rsp+8*12]
	mov [r15],rax
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rdx,  [rsp+8*31]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov r15, [r15]
	mov rbx,  [rsp+8*12]
	lea r15,[r15+rbx*8+8H]
	mov [r15],rax
	mov rax,  [rsp+8*8]
	cmp r8,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_899
	mov rbx,0
	mov r15,rbx
	jmp L_900
	
L_899:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_900:
	cmp r15, 0
	je L_902
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_902:
	
L_898:
	
L_896:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r8,r15
	mov rax,r11
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*148],rax
	mov rax, [rbx]
	mov qword [rsp+8*149],rbx
	mov rbx,2
	mov rdx,rax
	add rdx,rbx
	mov rbx,rdx
	mov rsi,r10
	mov rdi,r8
	mov rdx,rdi
	mov qword [rsp+8*150],rax
	mov rax,rsi
	cmp rdx,rax
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*12],rbx
	mov qword [rsp+8*69],rdx
	mov qword [rsp+8*70],rax
	jne L_985
	mov rbx,0
	mov r15,rbx
	jmp L_986
	
L_985:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_986:
	mov r15,r15
	mov rbx,r15
	cmp rbx, 0
	mov qword [rsp+8*152],rbx
	jne L_903
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*153],rbx
	jmp L_904
	
L_903:
	mov rsi,r10
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*69],rdx
	mov qword [rsp+8*70],rax
	jne L_989
	mov rbx,0
	mov r15,rbx
	jmp L_990
	
L_989:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_990:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*154],rbx
	mov qword [rsp+8*153],rdx
	
L_904:
	mov rbx,  [rsp+8*153]
	cmp rbx, 0
	je L_906
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	lea rax,[rbx+r8*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*12]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*155],rbx
	mov rbx, [rax]
	mov qword [rsp+8*156],rax
	mov rax,1
	mov rdx,rax
	neg rdx
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*157],rbx
	mov qword [rsp+8*158],rdx
	mov qword [rsp+8*159],rax
	je L_908
	mov rbx,1
	mov rdx,r9
	add rdx,rbx
	mov r9,rdx
	mov rbx,  [rsp+8*17]
	mov rax,rbx
	lea rdx,[rax+r9*8+8H]
	mov [rdx],r8
	mov qword [rsp+8*162],rdx
	mov rdx,r11
	mov qword [rsp+8*161],rax
	lea rax,[rdx+r9*8+8H]
	mov qword [rsp+8*163],rdx
	mov rdx,  [rsp+8*12]
	mov [rax],rdx
	mov qword [rsp+8*164],rax
	mov rax,  [rsp+8*13]
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*165],rdx
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	lea rax,[rbx+r8*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*12]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*166],rbx
	mov rbx,  [rsp+8*165]
	mov [rax],rbx
	mov rbx,  [rsp+8*8]
	cmp r8,rbx
	mov qword [rsp+8*167],rax
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*168],rax
	jne L_909
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*168],rbx
	jmp L_910
	
L_909:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	mov rax,r15
	mov qword [rsp+8*168],rax
	
L_910:
	mov rbx,  [rsp+8*168]
	cmp rbx, 0
	je L_912
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_912:
	
L_908:
	
L_906:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r8,r15
	mov rax,r11
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*174],rax
	mov rax, [rbx]
	mov qword [rsp+8*175],rbx
	mov rbx,1
	mov rdx,rax
	sub rdx,rbx
	mov rbx,rdx
	mov rsi,r10
	mov rdi,r8
	mov rdx,rdi
	mov qword [rsp+8*176],rax
	mov rax,rsi
	cmp rdx,rax
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*12],rbx
	mov qword [rsp+8*69],rdx
	mov qword [rsp+8*70],rax
	jne L_993
	mov rbx,0
	mov r15,rbx
	jmp L_994
	
L_993:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_994:
	mov r15,r15
	mov rbx,r15
	cmp rbx, 0
	mov qword [rsp+8*178],rbx
	jne L_913
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*179],rbx
	jmp L_914
	
L_913:
	mov rsi,r10
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*69],rdx
	mov qword [rsp+8*70],rax
	jne L_997
	mov rbx,0
	mov r15,rbx
	jmp L_998
	
L_997:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_998:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*180],rbx
	mov qword [rsp+8*179],rdx
	
L_914:
	mov rbx,  [rsp+8*179]
	cmp rbx, 0
	je L_916
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	lea rdx,[r15+r8*8+8H]
	mov r15, [rdx]
	mov rax,  [rsp+8*12]
	lea rdx,[r15+rax*8+8H]
	mov r15, [rdx]
	mov qword [rsp+8*182],rdx
	mov rdx,1
	mov r14,rdx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_918
	mov rbx,1
	mov r15,r9
	add r15,rbx
	mov r9,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r9*8+8H]
	mov [r15],r8
	mov r15,r11
	lea r15,[r15+r9*8+8H]
	mov rax,  [rsp+8*12]
	mov [r15],rax
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rdx,  [rsp+8*31]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov r15, [r15]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	mov rbx,  [rsp+8*8]
	cmp r8,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_919
	mov rbx,0
	mov r15,rbx
	jmp L_920
	
L_919:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_920:
	cmp r15, 0
	je L_922
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_922:
	
L_918:
	
L_916:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r8,r15
	mov r15,r11
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov rax,r15
	mov rsi,r10
	mov rdi,r8
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*69],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*12],rax
	jne L_1001
	mov rbx,0
	mov r15,rbx
	jmp L_1002
	
L_1001:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1002:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_923
	mov rbx,0
	mov r15,rbx
	jmp L_924
	
L_923:
	mov rsi,r10
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*69],rdx
	mov qword [rsp+8*70],rax
	jne L_1005
	mov rbx,0
	mov r15,rbx
	jmp L_1006
	
L_1005:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1006:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_924:
	cmp r15, 0
	je L_926
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov r15, [r15]
	mov rdx,  [rsp+8*12]
	lea r15,[r15+rdx*8+8H]
	mov r14, [r15]
	mov rax,1
	mov r15,rax
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_928
	mov rbx,1
	mov r15,r9
	add r15,rbx
	mov r9,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r9*8+8H]
	mov [r15],r8
	mov r15,r11
	lea r15,[r15+r9*8+8H]
	mov rax,  [rsp+8*12]
	mov [r15],rax
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rdx,  [rsp+8*31]
	mov r15,rdx
	lea r15,[r15+r8*8+8H]
	mov r15, [r15]
	mov rbx,  [rsp+8*12]
	lea r15,[r15+rbx*8+8H]
	mov [r15],rax
	mov rax,  [rsp+8*8]
	cmp r8,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_929
	mov rbx,0
	mov r15,rbx
	jmp L_930
	
L_929:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_930:
	cmp r15, 0
	je L_932
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_932:
	
L_928:
	
L_926:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	add r15,rax
	mov r8,r15
	mov r15,r11
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	sub r15,rax
	mov rax,r15
	mov rsi,r10
	mov rdi,r8
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*69],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*12],rax
	jne L_1009
	mov rbx,0
	mov r15,rbx
	jmp L_1010
	
L_1009:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1010:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_933
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*231],rbx
	jmp L_934
	
L_933:
	mov rsi,r10
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*69],rdx
	mov qword [rsp+8*70],rax
	jne L_1013
	mov rbx,0
	mov r15,rbx
	jmp L_1014
	
L_1013:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1014:
	mov r15,r15
	mov rbx,r15
	mov rdx,rbx
	mov qword [rsp+8*232],rbx
	mov qword [rsp+8*231],rdx
	
L_934:
	mov rbx,  [rsp+8*231]
	cmp rbx, 0
	je L_936
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	lea rax,[rbx+r8*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*12]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*233],rbx
	mov rbx, [rax]
	mov qword [rsp+8*234],rax
	mov rax,1
	mov rdx,rax
	neg rdx
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*235],rbx
	mov qword [rsp+8*236],rdx
	mov qword [rsp+8*237],rax
	je L_938
	mov rbx,1
	mov rdx,r9
	add rdx,rbx
	mov r9,rdx
	mov rax,  [rsp+8*17]
	mov r15,rax
	lea rbx,[r15+r9*8+8H]
	mov [rbx],r8
	mov qword [rsp+8*240],rbx
	mov rbx,r11
	lea rdx,[rbx+r9*8+8H]
	mov qword [rsp+8*241],rbx
	mov rbx,  [rsp+8*12]
	mov [rdx],rbx
	mov qword [rsp+8*242],rdx
	mov rdx,  [rsp+8*13]
	mov rax,1
	mov rbx,rdx
	add rbx,rax
	mov qword [rsp+8*243],rbx
	mov rbx,  [rsp+8*31]
	mov rax,rbx
	lea rdx,[rax+r8*8+8H]
	mov rax, [rdx]
	mov rbx,  [rsp+8*12]
	lea rdx,[rax+rbx*8+8H]
	mov qword [rsp+8*244],rax
	mov rax,  [rsp+8*243]
	mov [rdx],rax
	mov qword [rsp+8*245],rdx
	mov rdx,  [rsp+8*8]
	cmp r8,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*246],rax
	jne L_939
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*246],rbx
	jmp L_940
	
L_939:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	mov rax,r15
	mov qword [rsp+8*246],rax
	
L_940:
	mov rbx,  [rsp+8*246]
	cmp rbx, 0
	je L_942
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_942:
	
L_938:
	
L_936:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	add r15,rax
	mov r8,r15
	mov rax,r11
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*252],rax
	mov rax, [rbx]
	mov qword [rsp+8*253],rbx
	mov rbx,1
	mov r15,rax
	add r15,rbx
	mov rbx,r15
	mov rsi,r10
	mov rdi,r8
	mov qword [rsp+8*254],rax
	mov rax,rdi
	mov rdx,rsi
	cmp rax,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*12],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*69],rax
	jne L_1017
	mov rbx,0
	mov r15,rbx
	jmp L_1018
	
L_1017:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1018:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_943
	mov rbx,0
	mov r15,rbx
	jmp L_944
	
L_943:
	mov rsi,r10
	mov rbx,  [rsp+8*12]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rsi
	cmp rdx,rax
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*69],rdx
	mov qword [rsp+8*70],rax
	jne L_1021
	mov rbx,0
	mov r15,rbx
	jmp L_1022
	
L_1021:
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1022:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_944:
	cmp r15, 0
	je L_946
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov r15, [r15]
	mov rdx,  [rsp+8*12]
	lea r15,[r15+rdx*8+8H]
	mov r14, [r15]
	mov rax,1
	mov r15,rax
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_948
	mov rbx,1
	mov r15,r9
	add r15,rbx
	mov r9,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	lea r15,[r15+r9*8+8H]
	mov [r15],r8
	mov r15,r11
	lea r15,[r15+r9*8+8H]
	mov rax,  [rsp+8*12]
	mov [r15],rax
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov rbx,  [rsp+8*31]
	mov r15,rbx
	lea r15,[r15+r8*8+8H]
	mov r15, [r15]
	lea r15,[r15+rax*8+8H]
	mov [r15],r14
	mov rdx,  [rsp+8*8]
	cmp r8,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_949
	mov rbx,0
	mov r15,rbx
	jmp L_950
	
L_949:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_950:
	cmp r15, 0
	je L_952
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_952:
	
L_948:
	
L_946:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_954
	jmp L_872
	
L_954:
	mov rbx,  [rsp+8*3]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov qword [rsp+8*3],rbx
	jmp L_871
	
L_872:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_955
	mov rbx,  [rsp+8*31]
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
	jmp L_956
	
L_955:
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
	
L_956:
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2336
	mov rbx,  [rsp+8*284]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   4320
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

