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


A_Optimizer:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2832
	mov rbx,  [arg+8*63]
	mov r15,rbx
	mov     rdi, 10
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
	mov rbx,0
	lea r14,[r15+rbx*8+8H]
	mov rdx,2
	mov [r14],rdx
	mov rax,1
	lea r14,[r15+rax*8+8H]
	mov rbx,2
	mov [r14],rbx
	mov rbx,2
	lea r14,[r15+rbx*8+8H]
	mov rbx,2
	mov [r14],rbx
	mov rbx,3
	lea r14,[r15+rbx*8+8H]
	mov rbx,2
	mov [r14],rbx
	mov rbx,4
	lea r14,[r15+rbx*8+8H]
	mov rbx,2
	mov [r14],rbx
	mov rbx,5
	lea r14,[r15+rbx*8+8H]
	mov rbx,2
	mov [r14],rbx
	mov rbx,6
	lea r14,[r15+rbx*8+8H]
	mov rbx,2
	mov [r14],rbx
	mov rbx,7
	lea r14,[r15+rbx*8+8H]
	mov rbx,2
	mov [r14],rbx
	mov rbx,8
	lea r14,[r15+rbx*8+8H]
	mov rbx,2
	mov [r14],rbx
	mov rbx,9
	lea r14,[r15+rbx*8+8H]
	mov rbx,2
	mov [r14],rbx
	mov     rdi,  r15
	call    multiArray
	mov     qword  r15, rax
	mov r11,r15
	mov rbx,0
	mov r12,rbx
	mov rdx,1
	mov r13,rdx
	
L_0:
	mov rbx,1000
	cmp r13,rbx
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1
	mov rbx,123
	mov r14,rbx
	add r14,r13
	mov r15,r11
	mov rdx,0
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	lea r15,[r15+rax*8+8H]
	mov r15, [r15]
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,1
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,1
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,1
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,1
	lea r15,[r15+rbx*8+8H]
	mov [r15],r14
	mov r15,r11
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,1
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,1
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,1
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,1
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rbx,1
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	add r15,r12
	mov r12,r15
	mov r15,r13
	mov rbx,1
	add r13,rbx
	jmp L_0
	
L_1:
	mov rdi,r12
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
	mov rbx,1
	mov r13,rbx
	
L_3:
	mov rbx,1000000
	cmp r13,rbx
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_4
	mov rbx,8
	mov r15,r12
	add r15,rbx
	mov r12,r15
	mov r15,r13
	mov rdx,1
	add r13,rdx
	jmp L_3
	
L_4:
	mov rdi,r12
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
	mov rbx,1
	mov r13,rbx
	
L_6:
	mov rbx,200000000
	cmp r13,rbx
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_7
	mov r15,r13
	mov rbx,1
	add r13,rbx
	jmp L_6
	
L_7:
	mov rax,r9
	leave
	ret
	
main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2832
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
        sub     rdx, 4816
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	push r9
	push r8
	call global_init
	pop r8
	pop r9
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
	mov r10,r15
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
	mov r13,r15
	mov rbx,1
	mov r12,rbx
	
L_69:
	cmp r12,r10
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_70
	mov rbx,  [gbl+8*37]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov [r15],r12
	cmp r12,r13
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_73
	mov rbx,1
	mov r14,r13
	add r14,rbx
	sub r14,r12
	mov rdx,  [gbl+8*37]
	mov r15,rdx
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	
L_73:
	mov rbx,  [gbl+8*37]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov r14, [r15]
	mov rdx,  [gbl+8*47]
	mov r15,rdx
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov r15,r12
	mov rax,1
	add r12,rax
	jmp L_69
	
L_70:
	mov rbx,1
	mov r15,r10
	add r15,rbx
	mov rsi,r15
	mov rdx,1
	mov rdi,rdx
	push r15
	push r10
	push r9
	push r8
	call quicksort
	pop r8
	pop r9
	pop r10
	pop r15
	mov r15 , rax
	mov rbx,r15
	mov rdx,1
	mov r14,rdx
	mov qword [rsp+8*54],rbx
	
L_79:
	cmp r14,r10
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_80
	mov rbx,  [gbl+8*47]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov r13, [r15]
	mov rdx,  [gbl+8*37]
	mov r15,rdx
	lea r15,[r15+r14*8+8H]
	mov [r15],r13
	mov r15,r14
	mov rax,1
	add r14,rax
	jmp L_79
	
L_80:
	mov rbx,0
	mov r15,rbx
	mov rdx,1
	mov r12,rdx
	
L_119:
	cmp r12,r10
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_120
	mov rbx,1
	mov r14,r12
	sub r14,rbx
	mov rdx,  [gbl+8*68]
	mov r15,rdx
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov rax,1
	mov r15,r12
	add r15,rax
	mov rbx,  [gbl+8*72]
	mov r14,rbx
	lea r14,[r14+r12*8+8H]
	mov [r14],r15
	mov r15,r12
	mov rax,1
	add r12,rax
	jmp L_119
	
L_120:
	mov rbx,0
	mov r13,rbx
	mov r12,r10
	
L_122:
	mov rbx,1
	cmp r12,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_123
	mov rbx,  [gbl+8*37]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	mov rdx,  [gbl+8*68]
	mov r14,rdx
	lea r15,[r14+r15*8+8H]
	mov r15, [r15]
	mov r11,r15
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov r14, [r15]
	mov rax,  [gbl+8*72]
	mov r15,rax
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	mov r14,r15
	mov r15,rax
	lea r15,[r15+r11*8+8H]
	mov [r15],r14
	mov r15,rdx
	lea r15,[r15+r14*8+8H]
	mov [r15],r11
	mov r15,r13
	add r15,r14
	sub r15,r11
	mov rbx,2
	sub r15,rbx
	mov r13,r15
	mov r15,r12
	mov rbx,1
	sub r12,rbx
	jmp L_122
	
L_123:
	mov r15,r13
	mov rbx,r15
	mov rdx,1
	mov r14,rdx
	mov qword [rsp+8*100],rbx
	
L_84:
	cmp r14,r10
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_85
	mov rbx,  [gbl+8*47]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov r13, [r15]
	mov rdx,  [gbl+8*37]
	mov r15,rdx
	lea r15,[r15+r14*8+8H]
	mov [r15],r13
	mov r15,r14
	mov rax,1
	add r14,rax
	jmp L_84
	
L_85:
	mov rbx,0
	mov r15,rbx
	mov rdx,1
	mov r15,r10
	add r15,rdx
	mov rsi,r15
	mov rax,1
	mov rdi,rax
	push r15
	push r10
	push r9
	push r8
	call mergesort
	pop r8
	pop r9
	pop r10
	pop r15
	mov r15 , rax
	mov rbx,r15
	mov rdx,1
	mov r14,rdx
	mov qword [rsp+8*104],rbx
	
L_89:
	cmp r14,r10
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_90
	mov rbx,  [gbl+8*47]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov r13, [r15]
	mov rdx,  [gbl+8*37]
	mov r15,rdx
	lea r15,[r15+r14*8+8H]
	mov [r15],r13
	mov r15,r14
	mov rax,1
	add r14,rax
	jmp L_89
	
L_90:
	mov rbx,0
	mov r15,rbx
	mov rdx,0
	mov r12,rdx
	mov rbx,1
	mov rax,rbx
	mov qword [rsp+8*107],rax
	
L_127:
	mov rbx,  [rsp+8*107]
	cmp rbx,r10
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_128
	mov rbx,  [gbl+8*37]
	mov r15,rbx
	mov rdx,  [rsp+8*107]
	lea r15,[r15+rdx*8+8H]
	mov r14, [r15]
	mov rax,  [gbl+8*112]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov [r15],r14
	mov rbx,rdx
	mov qword [rsp+8*115],rbx
	
L_129:
	mov rbx,  [rsp+8*115]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	setne r15B
	cmp r15, 0
	je L_130
	mov r15,r12
	mov rbx,1
	add r12,rbx
	mov rdx,  [gbl+8*112]
	mov r15,rdx
	mov rax,  [rsp+8*115]
	lea r15,[r15+rax*8+8H]
	mov r14, [r15]
	mov rbx,1
	mov r15,rax
	mov rcx,rbx
	shr r15,cl
	mov r13,rdx
	lea r15,[r13+r15*8+8H]
	mov r15, [r15]
	cmp r14,r15
	mov r15, 0
	setg r15B
	cmp r15, 0
	je L_131
	jmp L_130
	
L_131:
	mov rbx,  [gbl+8*112]
	mov r15,rbx
	mov rdx,  [rsp+8*115]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov r13,r15
	mov rax,1
	mov r15,rdx
	mov rcx,rax
	shr r15,cl
	mov r14,rbx
	lea r15,[r14+r15*8+8H]
	mov r14, [r15]
	mov r15,rbx
	lea r15,[r15+rdx*8+8H]
	mov [r15],r14
	mov rax,1
	mov r15,rdx
	mov rcx,rax
	shr r15,cl
	mov rax,rbx
	lea rdx,[rax+r15*8+8H]
	mov [rdx],r13
	mov qword [rsp+8*138],rdx
	mov rdx,  [rsp+8*115]
	mov qword [rsp+8*137],rax
	mov rax,1
	mov rbx,rdx
	mov rcx,rax
	shr rbx,cl
	mov rdx,rbx
	mov qword [rsp+8*139],rbx
	mov qword [rsp+8*115],rdx
	jmp L_129
	
L_130:
	mov rbx,  [rsp+8*107]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*107],rbx
	jmp L_127
	
L_128:
	mov r11,r10
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*107],rbx
	
L_133:
	mov rbx,  [rsp+8*107]
	cmp rbx,r10
	mov rdx, 0
	setle dl
	cmp rdx, 0
	mov qword [rsp+8*142],rdx
	je L_134
	mov rdx,  [gbl+8*112]
	mov rbx,rdx
	mov rax,1
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*143],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*144],rdx
	mov rax,  [gbl+8*37]
	mov rdx,rax
	mov qword [rsp+8*145],rbx
	mov rbx,  [rsp+8*107]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*146],rdx
	mov rdx,  [rsp+8*145]
	mov [rax],rdx
	mov rdx,r11
	mov qword [rsp+8*147],rax
	mov rax,1
	sub r11,rax
	mov rbx,  [gbl+8*112]
	mov rax,rbx
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*148],rdx
	mov rdx, [rbx]
	mov qword [rsp+8*150],rbx
	mov qword [rsp+8*149],rax
	mov rax,  [gbl+8*112]
	mov rbx,rax
	mov qword [rsp+8*151],rdx
	mov rdx,1
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*152],rbx
	mov rbx,  [rsp+8*151]
	mov [rax],rbx
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*154],rbx
	mov qword [rsp+8*153],rax
	
L_135:
	mov rbx,  [rsp+8*154]
	mov rdx,rbx
	mov rcx,1
	shl rdx,cl
	cmp rdx,r11
	mov rdx, 0
	setle dl
	add r8,r8
	cmp rdx, 0
	mov qword [rsp+8*155],rdx
	je L_137
	mov rbx,  [rsp+8*154]
	mov rdx,rbx
	mov rcx,1
	shl rdx,cl
	mov r15,rdx
	mov rax,1
	mov rdx,r15
	add rdx,rax
	mov r13,rdx
	mov r14,r15
	cmp r13,r11
	mov rdx, 0
	setle dl
	cmp rdx, 0
	mov qword [rsp+8*162],rdx
	je L_138
	mov rbx,r12
	mov rdx,1
	add r12,rdx
	mov qword [rsp+8*163],rbx
	mov rbx,  [gbl+8*112]
	mov rax,rbx
	lea rdx,[rax+r13*8+8H]
	mov qword [rsp+8*164],rax
	mov rax, [rdx]
	mov qword [rsp+8*165],rdx
	mov rdx,rbx
	mov qword [rsp+8*166],rax
	lea rax,[rdx+r15*8+8H]
	mov qword [rsp+8*167],rdx
	mov rdx, [rax]
	mov qword [rsp+8*168],rax
	mov rax,  [rsp+8*166]
	cmp rax,rdx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*170],rbx
	mov qword [rsp+8*169],rdx
	je L_139
	mov r14,r13
	
L_139:
	
L_138:
	mov rbx,r12
	mov rdx,1
	add r12,rdx
	mov qword [rsp+8*171],rbx
	mov rbx,  [gbl+8*112]
	mov rax,rbx
	mov rdx,  [rsp+8*154]
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*172],rax
	mov rax, [rbx]
	mov qword [rsp+8*173],rbx
	mov rdx,  [gbl+8*112]
	mov rbx,rdx
	mov qword [rsp+8*174],rax
	lea rax,[rbx+r14*8+8H]
	mov qword [rsp+8*175],rbx
	mov rbx, [rax]
	mov qword [rsp+8*176],rax
	mov rax,  [rsp+8*174]
	cmp rax,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*177],rbx
	mov qword [rsp+8*178],rdx
	je L_140
	jmp L_137
	
L_140:
	mov rdx,  [gbl+8*112]
	mov rbx,rdx
	mov rax,  [rsp+8*154]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*179],rbx
	mov rbx, [rdx]
	mov r13,rbx
	mov qword [rsp+8*181],rbx
	mov qword [rsp+8*180],rdx
	mov rdx,  [gbl+8*112]
	mov rbx,rdx
	lea rax,[rbx+r14*8+8H]
	mov qword [rsp+8*182],rbx
	mov rbx, [rax]
	mov qword [rsp+8*183],rax
	mov rax,rdx
	mov qword [rsp+8*184],rbx
	mov rbx,  [rsp+8*154]
	lea rdx,[rax+rbx*8+8H]
	mov qword [rsp+8*185],rax
	mov rax,  [rsp+8*184]
	mov [rdx],rax
	mov qword [rsp+8*186],rdx
	mov rax,  [gbl+8*112]
	mov rdx,rax
	lea rbx,[rdx+r14*8+8H]
	mov [rbx],r13
	mov qword [rsp+8*188],rbx
	mov rbx,  [rsp+8*154]
	mov r13,rbx
	mov rbx,r14
	mov r14,r13
	mov qword [rsp+8*154],rbx
	mov qword [rsp+8*187],rdx
	jmp L_135
	
L_137:
	mov rdx,  [rsp+8*107]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*189],rbx
	mov qword [rsp+8*107],rdx
	jmp L_133
	
L_134:
	mov r15,r12
	mov r14,r15
	mov rbx,  [rsp+8*54]
	mov rdi,rbx
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
	mov rbx,  [rsp+8*100]
	mov rdi,rbx
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
	mov rbx,  [rsp+8*104]
	mov rdi,rbx
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
	mov rdi,r14
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
	mov     rdi, 1
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
	mov qword [arg+8*63],rbx
	push r15
	push r9
	call A_Optimizer
	pop r9
	pop r15
	mov r15 , rax
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
quicksort:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2832
	mov r11,rdi
	mov r9,rsi
	mov rbx,0
	mov r12,rbx
	mov rdx,  [gbl+8*37]
	mov r15,rdx
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	mov r8,r15
	mov rbx,0
	mov rax,rbx
	mov rdx,0
	mov rbx,rdx
	mov rdx,1
	mov r15,r11
	add r15,rdx
	mov rdx,r15
	mov qword [rsp+8*217],rbx
	mov qword [rsp+8*219],rdx
	mov qword [rsp+8*216],rax
	
L_12:
	mov rbx,  [rsp+8*219]
	cmp rbx,r9
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_13
	mov r15,r12
	mov rbx,1
	add r12,rbx
	mov rdx,  [gbl+8*37]
	mov r15,rdx
	mov rax,  [rsp+8*219]
	lea r15,[r15+rax*8+8H]
	mov r15, [r15]
	cmp r15,r8
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_15
	mov rbx,  [gbl+8*37]
	mov r15,rbx
	mov rdx,  [rsp+8*219]
	lea r15,[r15+rdx*8+8H]
	mov r13, [r15]
	mov rax,  [rsp+8*216]
	mov r14,rax
	mov rbx,1
	add rax,rbx
	mov rbx,  [gbl+8*68]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov [r15],r13
	mov qword [rsp+8*216],rax
	jmp L_16
	
L_15:
	mov rbx,  [gbl+8*37]
	mov r15,rbx
	mov rdx,  [rsp+8*219]
	lea r15,[r15+rdx*8+8H]
	mov r14, [r15]
	mov rax,  [rsp+8*217]
	mov r15,rax
	mov rbx,1
	add rax,rbx
	mov rdx,  [gbl+8*72]
	mov rbx,rdx
	mov qword [rsp+8*217],rax
	lea rax,[rbx+r15*8+8H]
	mov [rax],r14
	mov qword [rsp+8*236],rbx
	mov qword [rsp+8*237],rax
	
L_16:
	mov rbx,  [rsp+8*219]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*219],rbx
	jmp L_12
	
L_13:
	mov r10,r11
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*219],rbx
	
L_17:
	mov rbx,  [rsp+8*219]
	mov rdx,  [rsp+8*216]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*240],rax
	je L_18
	mov rdx,  [gbl+8*68]
	mov rbx,rdx
	mov rax,  [rsp+8*219]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*241],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*242],rdx
	mov rdx,r10
	mov rax,1
	add r10,rax
	mov qword [rsp+8*243],rbx
	mov rbx,  [gbl+8*37]
	mov rax,rbx
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*244],rdx
	mov rdx,  [rsp+8*243]
	mov [rbx],rdx
	mov qword [rsp+8*246],rbx
	mov rdx,  [rsp+8*219]
	mov rbx,rdx
	mov qword [rsp+8*247],rbx
	mov rbx,1
	add rdx,rbx
	mov qword [rsp+8*219],rdx
	mov qword [rsp+8*245],rax
	jmp L_17
	
L_18:
	mov r15,r10
	mov rbx,1
	add r10,rbx
	mov rax,  [gbl+8*37]
	mov rdx,rax
	lea r15,[rdx+r15*8+8H]
	mov [r15],r8
	mov qword [rsp+8*249],rdx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*219],rbx
	
L_20:
	mov rbx,  [rsp+8*219]
	mov rdx,  [rsp+8*217]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_21
	mov rbx,  [gbl+8*72]
	mov r15,rbx
	mov rdx,  [rsp+8*219]
	lea r15,[r15+rdx*8+8H]
	mov r13, [r15]
	mov r15,r10
	mov rax,1
	add r10,rax
	mov rax,  [gbl+8*37]
	mov r14,rax
	lea r15,[r14+r15*8+8H]
	mov [r15],r13
	mov r15,rdx
	mov rbx,1
	add rdx,rbx
	mov qword [rsp+8*219],rdx
	jmp L_20
	
L_21:
	mov rbx,  [rsp+8*216]
	cmp rbx,1
	mov r15, 0
	setg r15B
	cmp r15, 0
	je L_24
	mov rbx,  [rsp+8*216]
	mov r15,r11
	add r15,rbx
	mov rsi,r15
	mov rdi,r11
	push r15
	push r12
	push r9
	call quicksort
	pop r9
	pop r12
	pop r15
	mov r15 , rax
	add r15,r12
	mov r12,r15
	
L_24:
	mov rbx,  [rsp+8*217]
	cmp rbx,1
	mov r15, 0
	setg r15B
	cmp r15, 0
	je L_26
	mov rbx,  [rsp+8*217]
	mov r15,r9
	sub r15,rbx
	mov rsi,r9
	mov rdi,r15
	push r15
	push r12
	call quicksort
	pop r12
	pop r15
	mov r15 , rax
	add r15,r12
	mov r12,r15
	
L_26:
	mov rax,r12
	leave
	ret
	
mergesort:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2832
	mov r13,rdi
	mov r11,rsi
	mov rbx,1
	mov r15,r13
	add r15,rbx
	cmp r15,r11
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_34
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
L_34:
	mov r15,r13
	add r15,r11
	mov rbx,1
	mov rcx,rbx
	shr r15,cl
	mov rdx,r15
	mov rax,0
	mov r10,rax
	mov rsi,rdx
	mov rdi,r13
	mov qword [rsp+8*272],rdx
	push r15
	push r13
	push r11
	push r10
	call mergesort
	pop r10
	pop r11
	pop r13
	pop r15
	mov r15 , rax
	add r15,r10
	mov r10,r15
	mov rsi,r11
	mov rbx,  [rsp+8*272]
	mov rdi,rbx
	push r15
	push r13
	push r11
	push r10
	call mergesort
	pop r10
	pop r11
	pop r13
	pop r15
	mov r15 , rax
	add r15,r10
	mov r10,r15
	mov rbx,0
	mov r9,rbx
	mov rdx,0
	mov r8,rdx
	mov r12,r13
	
L_35:
	mov rbx,  [rsp+8*272]
	cmp r12,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_36
	mov rbx,  [gbl+8*37]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov r14, [r15]
	mov r15,r9
	mov rdx,1
	add r9,rdx
	mov rdx,  [gbl+8*68]
	mov rax,rdx
	lea rbx,[rax+r15*8+8H]
	mov [rbx],r14
	mov r15,r12
	mov qword [rsp+8*287],rbx
	mov rbx,1
	add r12,rbx
	mov qword [rsp+8*286],rax
	jmp L_35
	
L_36:
	mov rbx,  [rsp+8*272]
	mov r12,rbx
	
L_38:
	cmp r12,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_39
	mov rbx,  [gbl+8*37]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov rdx, [r15]
	mov r14,r8
	mov rax,1
	add r8,rax
	mov rax,  [gbl+8*72]
	mov r15,rax
	lea r15,[r15+r14*8+8H]
	mov [r15],rdx
	mov r15,r12
	mov qword [rsp+8*292],rdx
	mov rdx,1
	add r12,rdx
	jmp L_38
	
L_39:
	mov rbx,0
	mov r11,rbx
	mov rax,0
	mov rdx,rax
	mov r12,r13
	mov qword [rsp+8*298],rdx
	
L_41:
	cmp r11,r9
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_43
	mov rbx,0
	mov r15,rbx
	jmp L_44
	
L_43:
	mov rbx,  [rsp+8*298]
	cmp rbx,r8
	mov r15, 0
	setl r15B
	
L_44:
	cmp r15, 0
	je L_42
	mov r15,r10
	mov rbx,1
	add r10,rbx
	mov rdx,  [gbl+8*68]
	mov r15,rdx
	lea r15,[r15+r11*8+8H]
	mov r14, [r15]
	mov rax,  [gbl+8*72]
	mov r15,rax
	mov rbx,  [rsp+8*298]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_45
	mov r15,r11
	mov rbx,1
	add r11,rbx
	mov rdx,  [gbl+8*68]
	mov r14,rdx
	lea r15,[r14+r15*8+8H]
	mov rax, [r15]
	mov r14,r12
	mov rbx,1
	add r12,rbx
	mov rbx,  [gbl+8*37]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov [r15],rax
	mov qword [rsp+8*313],rax
	jmp L_46
	
L_45:
	mov rbx,  [rsp+8*298]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov rax,  [gbl+8*72]
	mov r14,rax
	lea r15,[r14+r15*8+8H]
	mov rdx, [r15]
	mov r14,r12
	mov qword [rsp+8*298],rbx
	mov rbx,1
	add r12,rbx
	mov rbx,  [gbl+8*37]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov [r15],rdx
	mov qword [rsp+8*320],rdx
	
L_46:
	jmp L_41
	
L_42:
	
L_47:
	cmp r11,r9
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_48
	mov r15,r11
	mov rbx,1
	add r11,rbx
	mov rdx,  [gbl+8*68]
	mov r14,rdx
	lea r15,[r14+r15*8+8H]
	mov r13, [r15]
	mov r14,r12
	mov rax,1
	add r12,rax
	mov rbx,  [gbl+8*37]
	mov r15,rbx
	lea r15,[r15+r14*8+8H]
	mov [r15],r13
	jmp L_47
	
L_48:
	
L_49:
	mov rbx,  [rsp+8*298]
	cmp rbx,r8
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_50
	mov rbx,  [rsp+8*298]
	mov r14,rbx
	mov rdx,1
	add rbx,rdx
	mov rax,  [gbl+8*72]
	mov r15,rax
	lea r15,[r15+r14*8+8H]
	mov r14, [r15]
	mov r15,r12
	mov qword [rsp+8*298],rbx
	mov rbx,1
	add r12,rbx
	mov rbx,  [gbl+8*37]
	mov r13,rbx
	lea r15,[r13+r15*8+8H]
	mov [r15],r14
	jmp L_49
	
L_50:
	mov rax,r10
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2832
	mov rdx,100000
	mov rbx,rdx
	mov qword [gbl+8*340],rbx
	mov     rdi, [gbl+8*340]
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*341], rax
	mov rdx,  [gbl+8*341]
	mov rbx,rdx
	mov qword [gbl+8*37],rbx
	mov     rdi, [gbl+8*340]
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*342], rax
	mov rdx,  [gbl+8*342]
	mov rbx,rdx
	mov qword [gbl+8*47],rbx
	mov     rdi, [gbl+8*340]
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*343], rax
	mov rdx,  [gbl+8*343]
	mov rbx,rdx
	mov qword [gbl+8*68],rbx
	mov     rdi, [gbl+8*340]
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*344], rax
	mov rdx,  [gbl+8*344]
	mov rbx,rdx
	mov qword [gbl+8*72],rbx
	mov     rdi, [gbl+8*340]
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*345], rax
	mov rdx,  [gbl+8*345]
	mov rbx,rdx
	mov qword [gbl+8*112],rbx
	mov rbx,  [rsp+8*346]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   4816
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

