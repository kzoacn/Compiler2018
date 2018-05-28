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
	sub    rsp, 1144
	mov     rax, 936870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 936870912
        movsxd  rdx, edx
        sub     rdx, 3128
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
	mov rdx,0
	mov rbx,rdx
	mov rax,40
	mov r11,rax
	mov rax,100
	mov rdx,rax
	mov rax,200
	mov r9,rax
	mov qword [rsp+8*2],rbx
	mov rbx,125
	mov rax,rbx
	mov qword [rsp+8*4],rdx
	mov rdx,250
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
	
L_479:
	mov rbx,  [rsp+8*13]
	cmp rbx,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_480
	mov rdx,  [rsp+8*4]
	mov rbx,rdx
	mov qword [rsp+8*15],rbx
	
L_482:
	mov rbx,  [rsp+8*15]
	cmp rbx,r9
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_483
	mov rdx,  [rsp+8*6]
	mov rbx,rdx
	mov qword [rsp+8*17],rbx
	
L_485:
	mov rbx,  [rsp+8*17]
	mov rdx,  [rsp+8*7]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_486
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rsi,r12
	mov rax,  [rsp+8*2]
	mov rdi,rax
	mov r13,rdi
	mov r14,rsi
	mov r10,rbx
	mov rax,31
	mov r15,r10
	and r15,rax
	mov rdx,r15
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov r13,rsi
	mov qword [arg+8*2],rbx
	mov rbx,1
	add r15,rbx
	mov rax,r15
	mov qword [rsp+8*26],rdx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*30],rax
	
L_842:
	mov rbx,10
	mov r15,r13
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_844
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov rax,r14
	mov rcx,r15
	shl rax,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rax,r15
	mov r15,rax
	mov r15,r15
	mov rbx,  [rsp+8*30]
	xor r15,rbx
	mov rbx,r15
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov r15,r10
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov rax,  [rsp+8*45]
	mov r15,rax
	mov rcx,rdx
	shr r15,cl
	and r15,r10
	mov r10,r15
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*46],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and r15,r10
	mov r15,r15
	mov r14,r15
	mov rax,  [rsp+8*30]
	xor r14,rax
	mov rax,r14
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov rdx,r14
	mov rcx,r15
	shl rdx,cl
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rdx,r15
	mov r15,rdx
	mov r14,r15
	mov rbx,  [rsp+8*30]
	xor r14,rbx
	mov rbx,r14
	mov rax,  [rsp+8*31]
	mov r15,rax
	mov qword [rsp+8*36],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rax
	jmp L_842
	
L_844:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r14,rbx
	xor r14,rdx
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov rax,  [rsp+8*26]
	mov rsi,rax
	mov rdi,r10
	mov r14,rdi
	mov r15,rsi
	mov rbx,r14
	mov rcx,r15
	shl rbx,cl
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rbx,r15
	mov r15,rbx
	mov r13,r15
	mov rdx,32
	mov rax,  [rsp+8*26]
	mov r15,rdx
	sub r15,rax
	mov rsi,r15
	mov rdi,r10
	mov qword [rsp+8*36],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*45],rbx
	mov rbx,32767
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov r15,r10
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rax,1
	add r15,rax
	mov r10,r15
	mov rbx,  [rsp+8*45]
	mov r15,rbx
	mov rcx,rdx
	shr r15,cl
	and r15,r10
	mov r10,r15
	mov rax,65535
	mov rsi,rax
	mov rbx,32767
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and r15,r10
	mov r15,r15
	mov r15,r15
	or r15,r13
	mov r15,r15
	mov r15,r15
	mov qword [rsp+8*46],rdx
	mov rdx,r15
	mov rbx,  [rsp+8*17]
	mov rax,rbx
	mov rsi,r12
	mov qword [rsp+8*69],rdx
	mov rdx,  [rsp+8*13]
	mov rdi,rdx
	mov r13,rdi
	mov r14,rsi
	mov r10,rax
	mov rbx,31
	mov r15,r10
	and r15,rbx
	mov rdx,r15
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov r13,rsi
	mov qword [arg+8*2],rax
	mov rax,1
	add r15,rax
	mov rbx,r15
	mov qword [rsp+8*26],rdx
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rdx
	
L_874:
	mov rbx,10
	mov r15,r13
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_876
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov rax,r14
	mov rcx,r15
	shl rax,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rax,r15
	mov r15,rax
	mov r15,r15
	mov rbx,  [rsp+8*30]
	xor r15,rbx
	mov rbx,r15
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov r15,r10
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov rax,  [rsp+8*45]
	mov r15,rax
	mov rcx,rdx
	shr r15,cl
	and r15,r10
	mov r10,r15
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*46],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and r15,r10
	mov r15,r15
	mov r14,r15
	mov rax,  [rsp+8*30]
	xor r14,rax
	mov rax,r14
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov rdx,r14
	mov rcx,r15
	shl rdx,cl
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rdx,r15
	mov r15,rdx
	mov r14,r15
	mov rbx,  [rsp+8*30]
	xor r14,rbx
	mov rbx,r14
	mov rax,  [rsp+8*31]
	mov r15,rax
	mov qword [rsp+8*36],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rax
	jmp L_874
	
L_876:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r14,rbx
	xor r14,rdx
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov rax,  [rsp+8*26]
	mov rsi,rax
	mov rdi,r10
	mov r14,rdi
	mov r15,rsi
	mov rbx,r14
	mov rcx,r15
	shl rbx,cl
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rbx,r15
	mov r15,rbx
	mov r13,r15
	mov rdx,32
	mov rax,  [rsp+8*26]
	mov r15,rdx
	sub r15,rax
	mov rsi,r15
	mov rdi,r10
	mov qword [rsp+8*36],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*45],rbx
	mov rbx,32767
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov r15,r10
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rax,1
	add r15,rax
	mov r10,r15
	mov rbx,  [rsp+8*45]
	mov r15,rbx
	mov rcx,rdx
	shr r15,cl
	and r15,r10
	mov r10,r15
	mov rax,65535
	mov rsi,rax
	mov rbx,32767
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and r15,r10
	mov r15,r15
	mov r15,r15
	or r15,r13
	mov r15,r15
	mov r15,r15
	mov qword [rsp+8*46],rdx
	mov rdx,r15
	mov rbx,  [rsp+8*17]
	mov rax,rbx
	mov rsi,r12
	mov qword [rsp+8*71],rdx
	mov rdx,  [rsp+8*15]
	mov rdi,rdx
	mov r13,rdi
	mov r14,rsi
	mov r10,rax
	mov rbx,31
	mov r15,r10
	and r15,rbx
	mov rdx,r15
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov r13,rsi
	mov qword [arg+8*2],rax
	mov rax,1
	add r15,rax
	mov rbx,r15
	mov qword [rsp+8*26],rdx
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rdx
	
L_906:
	mov rbx,10
	mov r15,r13
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_908
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov rax,r14
	mov rcx,r15
	shl rax,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rax,r15
	mov r15,rax
	mov r15,r15
	mov rbx,  [rsp+8*30]
	xor r15,rbx
	mov rbx,r15
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov r15,r10
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov rax,  [rsp+8*45]
	mov r15,rax
	mov rcx,rdx
	shr r15,cl
	and r15,r10
	mov r10,r15
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*46],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and r15,r10
	mov r15,r15
	mov r14,r15
	mov rax,  [rsp+8*30]
	xor r14,rax
	mov rax,r14
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov rdx,r14
	mov rcx,r15
	shl rdx,cl
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rdx,r15
	mov r15,rdx
	mov r14,r15
	mov rbx,  [rsp+8*30]
	xor r14,rbx
	mov rbx,r14
	mov rax,  [rsp+8*31]
	mov r15,rax
	mov qword [rsp+8*36],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rax
	jmp L_906
	
L_908:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r14,rbx
	xor r14,rdx
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov rax,  [rsp+8*26]
	mov rsi,rax
	mov rdi,r10
	mov r14,rdi
	mov r15,rsi
	mov rbx,r14
	mov rcx,r15
	shl rbx,cl
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rbx,r15
	mov r15,rbx
	mov r13,r15
	mov rdx,32
	mov rax,  [rsp+8*26]
	mov r15,rdx
	sub r15,rax
	mov rsi,r15
	mov rdi,r10
	mov qword [rsp+8*36],rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rax,65535
	mov rsi,rax
	mov qword [rsp+8*45],rbx
	mov rbx,32767
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov r15,r10
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rax,1
	add r15,rax
	mov r10,r15
	mov rbx,  [rsp+8*45]
	mov r15,rbx
	mov rcx,rdx
	shr r15,cl
	and r15,r10
	mov r10,r15
	mov rax,65535
	mov rsi,rax
	mov rbx,32767
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and r15,r10
	mov r15,r15
	mov r15,r15
	or r15,r13
	mov r15,r15
	mov r15,r15
	mov qword [rsp+8*46],rdx
	mov rdx,r15
	mov rax,  [rsp+8*13]
	mov rbx,  [rsp+8*15]
	mov r15,rax
	xor r15,rbx
	mov qword [rsp+8*73],rdx
	mov rbx,  [rsp+8*17]
	mov rdx,rbx
	mov rsi,r12
	mov rdi,r15
	mov r13,rdi
	mov r14,rsi
	mov r10,rdx
	mov qword [arg+8*2],rdx
	mov rdx,31
	mov r15,r10
	and r15,rdx
	mov rdx,r15
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov r13,rsi
	mov rax,1
	add r15,rax
	mov rbx,r15
	mov qword [rsp+8*26],rdx
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rdx
	
L_938:
	mov rbx,10
	mov r15,r13
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_940
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov rax,r14
	mov rcx,r15
	shl rax,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rax,r15
	mov r15,rax
	mov r15,r15
	mov rbx,  [rsp+8*30]
	xor r15,rbx
	mov rbx,r15
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov r15,r10
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov rax,  [rsp+8*45]
	mov r15,rax
	mov rcx,rdx
	shr r15,cl
	and r15,r10
	mov r10,r15
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*46],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and r15,r10
	mov r15,r15
	mov r14,r15
	mov rax,  [rsp+8*30]
	xor r14,rax
	mov rax,r14
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov rdx,r14
	mov rcx,r15
	shl rdx,cl
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rdx,r15
	mov r15,rdx
	mov r14,r15
	mov rbx,  [rsp+8*30]
	xor r14,rbx
	mov rbx,r14
	mov rax,  [rsp+8*31]
	mov r15,rax
	mov qword [rsp+8*36],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rax
	jmp L_938
	
L_940:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r14,rbx
	xor r14,rdx
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov rax,  [rsp+8*26]
	mov rsi,rax
	mov rdi,r10
	mov r14,rdi
	mov r15,rsi
	mov rbx,r14
	mov rcx,r15
	shl rbx,cl
	mov rdx,65535
	mov rsi,rdx
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rbx,r15
	mov r15,rbx
	mov r13,r15
	mov rdx,32
	mov rax,  [rsp+8*26]
	mov r15,rdx
	sub r15,rax
	mov rsi,r15
	mov rdi,r10
	mov rdx,rdi
	mov rax,rsi
	mov qword [rsp+8*36],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*45],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov r15,r10
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov rdx,  [rsp+8*45]
	mov r15,rdx
	mov rcx,rax
	shr r15,cl
	and r15,r10
	mov r10,r15
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and r15,r10
	mov r15,r15
	mov r15,r15
	or r15,r13
	mov r15,r15
	mov r15,r15
	mov qword [rsp+8*46],rax
	mov rax,r15
	mov rbx,1
	mov rsi,rbx
	mov rbx,  [rsp+8*17]
	mov rdi,rbx
	mov r15,rdi
	mov r13,rsi
	mov rdx,1
	add r15,rdx
	mov qword [rsp+8*76],rax
	mov rax,r15
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rax
	
L_650:
	mov rbx,10
	mov r15,r13
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_652
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov rax,r14
	mov rcx,r15
	shl rax,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rax,r15
	mov r15,rax
	mov r15,r15
	mov rbx,  [rsp+8*30]
	xor r15,rbx
	mov rbx,r15
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov r15,r10
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov rax,  [rsp+8*45]
	mov r15,rax
	mov rcx,rdx
	shr r15,cl
	and r15,r10
	mov r10,r15
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*46],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and r15,r10
	mov r15,r15
	mov r14,r15
	mov rax,  [rsp+8*30]
	xor r14,rax
	mov rax,r14
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov rdx,r14
	mov rcx,r15
	shl rdx,cl
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rdx,r15
	mov r15,rdx
	mov r14,r15
	mov rbx,  [rsp+8*30]
	xor r14,rbx
	mov rbx,r14
	mov rax,  [rsp+8*31]
	mov r15,rax
	mov qword [rsp+8*36],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rax
	jmp L_650
	
L_652:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r14,rbx
	xor r14,rdx
	mov r15,r14
	mov rax,r15
	mov rbx,1
	mov rsi,rbx
	mov rbx,  [rsp+8*15]
	mov rdi,rbx
	mov r15,rdi
	mov r13,rsi
	mov rdx,1
	add r15,rdx
	mov qword [rsp+8*77],rax
	mov rax,r15
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rax
	
L_670:
	mov rbx,10
	mov r15,r13
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_672
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov rax,r14
	mov rcx,r15
	shl rax,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rax,r15
	mov r15,rax
	mov r15,r15
	mov rbx,  [rsp+8*30]
	xor r15,rbx
	mov rbx,r15
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov r15,r10
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov rax,  [rsp+8*45]
	mov r15,rax
	mov rcx,rdx
	shr r15,cl
	and r15,r10
	mov r10,r15
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*46],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and r15,r10
	mov r15,r15
	mov r14,r15
	mov rax,  [rsp+8*30]
	xor r14,rax
	mov rax,r14
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov rdx,r14
	mov rcx,r15
	shl rdx,cl
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rdx,r15
	mov r15,rdx
	mov r14,r15
	mov rbx,  [rsp+8*30]
	xor r14,rbx
	mov rbx,r14
	mov rax,  [rsp+8*31]
	mov r15,rax
	mov qword [rsp+8*36],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rax
	jmp L_670
	
L_672:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r14,rbx
	xor r14,rdx
	mov r15,r14
	mov r15,r15
	mov rax,  [rsp+8*77]
	mov rbx,rax
	xor rbx,r15
	mov rax,1
	mov rsi,rax
	mov rax,  [rsp+8*13]
	mov rdi,rax
	mov r15,rdi
	mov r13,rsi
	mov rdx,1
	add r15,rdx
	mov qword [rsp+8*79],rbx
	mov rbx,r15
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rax
	
L_690:
	mov rbx,10
	mov r15,r13
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_692
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov rax,r14
	mov rcx,r15
	shl rax,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rax,r15
	mov r15,rax
	mov r15,r15
	mov rbx,  [rsp+8*30]
	xor r15,rbx
	mov rbx,r15
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov r15,r10
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov rax,  [rsp+8*45]
	mov r15,rax
	mov rcx,rdx
	shr r15,cl
	and r15,r10
	mov r10,r15
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*46],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and r15,r10
	mov r15,r15
	mov r14,r15
	mov rax,  [rsp+8*30]
	xor r14,rax
	mov rax,r14
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov rdx,r14
	mov rcx,r15
	shl rdx,cl
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rdx,r15
	mov r15,rdx
	mov r14,r15
	mov rbx,  [rsp+8*30]
	xor r14,rbx
	mov rbx,r14
	mov rax,  [rsp+8*31]
	mov r15,rax
	mov qword [rsp+8*36],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rax
	jmp L_690
	
L_692:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r14,rbx
	xor r14,rdx
	mov r15,r14
	mov r15,r15
	mov rax,  [rsp+8*79]
	xor rax,r15
	mov rbx,rax
	mov rax,  [rsp+8*69]
	mov r15,rax
	xor r15,rbx
	mov rax,1
	mov rsi,rax
	mov rdi,r15
	mov r15,rdi
	mov r13,rsi
	mov rax,1
	add r15,rax
	mov rdx,r15
	mov qword [rsp+8*81],rbx
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*30],rdx
	
L_710:
	mov rbx,10
	mov r15,r13
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_712
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov rax,r14
	mov rcx,r15
	shl rax,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rax,r15
	mov r15,rax
	mov r15,r15
	mov rbx,  [rsp+8*30]
	xor r15,rbx
	mov rbx,r15
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov r15,r10
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov rax,  [rsp+8*45]
	mov r15,rax
	mov rcx,rdx
	shr r15,cl
	and r15,r10
	mov r10,r15
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*46],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and r15,r10
	mov r15,r15
	mov r14,r15
	mov rax,  [rsp+8*30]
	xor r14,rax
	mov rax,r14
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov rdx,r14
	mov rcx,r15
	shl rdx,cl
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rdx,r15
	mov r15,rdx
	mov r14,r15
	mov rbx,  [rsp+8*30]
	xor r14,rbx
	mov rbx,r14
	mov rax,  [rsp+8*31]
	mov r15,rax
	mov qword [rsp+8*36],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rax
	jmp L_710
	
L_712:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r14,rbx
	xor r14,rdx
	mov r15,r14
	mov r14,r15
	mov rax,  [rsp+8*9]
	add r14,rax
	mov rax,r14
	mov rbx,  [rsp+8*71]
	mov rdx,  [rsp+8*81]
	mov r14,rbx
	xor r14,rdx
	mov rbx,1
	mov rsi,rbx
	mov rdi,r14
	mov r15,rdi
	mov r13,rsi
	mov rbx,1
	add r15,rbx
	mov qword [rsp+8*9],rax
	mov rax,r15
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*30],rax
	
L_730:
	mov rbx,10
	mov r15,r13
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_732
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov rax,r14
	mov rcx,r15
	shl rax,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rax,r15
	mov r15,rax
	mov r15,r15
	mov rbx,  [rsp+8*30]
	xor r15,rbx
	mov rbx,r15
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov r15,r10
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov rax,  [rsp+8*45]
	mov r15,rax
	mov rcx,rdx
	shr r15,cl
	and r15,r10
	mov r10,r15
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*46],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and r15,r10
	mov r15,r15
	mov r14,r15
	mov rax,  [rsp+8*30]
	xor r14,rax
	mov rax,r14
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov rdx,r14
	mov rcx,r15
	shl rdx,cl
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rdx,r15
	mov r15,rdx
	mov r14,r15
	mov rbx,  [rsp+8*30]
	xor r14,rbx
	mov rbx,r14
	mov rax,  [rsp+8*31]
	mov r15,rax
	mov qword [rsp+8*36],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rax
	jmp L_730
	
L_732:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r14,rbx
	xor r14,rdx
	mov r15,r14
	mov r14,r15
	mov rax,  [rsp+8*10]
	add r14,rax
	mov rax,r14
	mov rbx,  [rsp+8*73]
	mov rdx,  [rsp+8*81]
	mov r14,rbx
	xor r14,rdx
	mov rbx,1
	mov rsi,rbx
	mov rdi,r14
	mov r15,rdi
	mov r13,rsi
	mov rbx,1
	add r15,rbx
	mov qword [rsp+8*10],rax
	mov rax,r15
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*30],rax
	
L_750:
	mov rbx,10
	mov r15,r13
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_752
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov rax,r14
	mov rcx,r15
	shl rax,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rax,r15
	mov r15,rax
	mov r15,r15
	mov rbx,  [rsp+8*30]
	xor r15,rbx
	mov rbx,r15
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov qword [rsp+8*36],rax
	mov rax,rdi
	mov rdx,rsi
	mov qword [rsp+8*30],rbx
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*45],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov r15,r10
	mov rcx,rdx
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov rax,  [rsp+8*45]
	mov r15,rax
	mov rcx,rdx
	shr r15,cl
	and r15,r10
	mov r10,r15
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*46],rdx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and r15,r10
	mov r15,r15
	mov r14,r15
	mov rax,  [rsp+8*30]
	xor r14,rax
	mov rax,r14
	mov rbx,5
	mov rsi,rbx
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov rdx,r14
	mov rcx,r15
	shl rdx,cl
	mov rbx,65535
	mov rsi,rbx
	mov qword [rsp+8*30],rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rdx,r15
	mov r15,rdx
	mov r14,r15
	mov rbx,  [rsp+8*30]
	xor r14,rbx
	mov rbx,r14
	mov rax,  [rsp+8*31]
	mov r15,rax
	mov qword [rsp+8*36],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rax
	jmp L_750
	
L_752:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r14,rbx
	xor r14,rdx
	mov r15,r14
	mov r14,r15
	mov rax,  [rsp+8*11]
	add r14,rax
	mov rax,r14
	mov rbx,  [rsp+8*76]
	mov rdx,  [rsp+8*81]
	mov r14,rbx
	xor r14,rdx
	mov rbx,1
	mov rsi,rbx
	mov rdi,r14
	mov r15,rdi
	mov r13,rsi
	mov rbx,1
	add r15,rbx
	mov rbx,r15
	mov qword [rsp+8*11],rax
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rdx
	
L_770:
	mov rbx,10
	mov r15,r13
	imul r15,rbx
	mov rdx,  [rsp+8*31]
	cmp rdx,r15
	mov r15, 0
	setl r15B
	mov rax,  [rsp+8*33]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*33],rax
	je L_772
	mov rbx,13
	mov rsi,rbx
	mov rdx,  [rsp+8*30]
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov rax,r14
	mov rcx,r15
	shl rax,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rax,r15
	mov r15,rax
	mov r15,r15
	mov rbx,  [rsp+8*30]
	xor r15,rbx
	mov rbx,r15
	mov rdx,17
	mov rsi,rdx
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*36],rax
	mov rax,rsi
	mov qword [rsp+8*30],rbx
	mov rbx,65535
	mov rsi,rbx
	mov rbx,32767
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	mov r10,r15
	mov r15,r10
	mov rcx,rax
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov rbx,1
	add r15,rbx
	mov r10,r15
	mov r15,rdx
	mov rcx,rax
	shr r15,cl
	and r15,r10
	mov r10,r15
	mov rbx,65535
	mov rsi,rbx
	mov rbx,32767
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and r15,r10
	mov r15,r15
	mov r14,r15
	mov rbx,  [rsp+8*30]
	xor r14,rbx
	mov rbx,r14
	mov qword [rsp+8*45],rdx
	mov rdx,5
	mov rsi,rdx
	mov rdi,rbx
	mov r14,rdi
	mov r15,rsi
	mov rdx,r14
	mov rcx,r15
	shl rdx,cl
	mov qword [rsp+8*46],rax
	mov rax,65535
	mov rsi,rax
	mov rax,32767
	mov rdi,rax
	mov r14,rdi
	mov r15,rsi
	mov r14,r14
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov r15,r14
	mov r15,r15
	and rdx,r15
	mov r15,rdx
	mov r14,r15
	xor r14,rbx
	mov rbx,r14
	mov rdx,  [rsp+8*31]
	mov r15,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*30],rbx
	mov qword [rsp+8*31],rdx
	jmp L_770
	
L_772:
	mov rbx,  [rsp+8*30]
	mov rdx,123456789
	mov r14,rbx
	xor r14,rdx
	mov r15,r14
	mov r14,r15
	mov rax,  [rsp+8*12]
	add r14,rax
	mov rax,r14
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*17],rbx
	mov qword [rsp+8*12],rax
	jmp L_485
	
L_486:
	mov rbx,  [rsp+8*15]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*15],rbx
	jmp L_482
	
L_483:
	mov rbx,  [rsp+8*13]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*13],rbx
	jmp L_479
	
L_480:
	mov rbx,  [rsp+8*9]
	mov rdi,rbx
	mov r9,rdi
	mov rdx,t127
	mov r13,rdx
	mov rax,28
	mov r12,rax
	
L_562:
	mov rbx,0
	cmp r12,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_563
	mov r15,r9
	mov rcx,r12
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r15,r15
	mov rdx,10
	cmp r15,rdx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_564
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_565
	mov rbx,0
	mov r15,rbx
	jmp L_566
	
L_565:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_566:
	cmp r15, 0
	je L_567
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
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
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r15,r15
	jmp L_569
	
L_567:
	mov rbx,t125
	mov r15,rbx
	
L_569:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
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
	mov r13,r15
	jmp L_570
	
L_564:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_571
	mov rbx,0
	mov r15,rbx
	jmp L_572
	
L_571:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_572:
	cmp r15, 0
	je L_573
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
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
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r15,r15
	jmp L_575
	
L_573:
	mov rbx,t125
	mov r15,rbx
	
L_575:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
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
	mov r13,r15
	
L_570:
	mov rbx,4
	mov r15,r12
	sub r15,rbx
	mov r12,r15
	jmp L_562
	
L_563:
	mov r15,r13
	mov r15,r15
	mov     rsi, t222
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
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
	mov r9,rdi
	mov rdx,t127
	mov r13,rdx
	mov rax,28
	mov r12,rax
	
L_579:
	mov rbx,0
	cmp r12,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_580
	mov r15,r9
	mov rcx,r12
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r15,r15
	mov rdx,10
	cmp r15,rdx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_581
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_582
	mov rbx,0
	mov r15,rbx
	jmp L_583
	
L_582:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_583:
	cmp r15, 0
	je L_584
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
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
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r15,r15
	jmp L_586
	
L_584:
	mov rbx,t125
	mov r15,rbx
	
L_586:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
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
	mov r13,r15
	jmp L_587
	
L_581:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_588
	mov rbx,0
	mov r15,rbx
	jmp L_589
	
L_588:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_589:
	cmp r15, 0
	je L_590
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
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
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r15,r15
	jmp L_592
	
L_590:
	mov rbx,t125
	mov r15,rbx
	
L_592:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
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
	mov r13,r15
	
L_587:
	mov rbx,4
	mov r15,r12
	sub r15,rbx
	mov r12,r15
	jmp L_579
	
L_580:
	mov r15,r13
	mov r15,r15
	mov     rsi, t229
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
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
	mov r9,rdi
	mov rdx,t127
	mov r13,rdx
	mov rax,28
	mov r12,rax
	
L_596:
	mov rbx,0
	cmp r12,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_597
	mov r15,r9
	mov rcx,r12
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r15,r15
	mov rdx,10
	cmp r15,rdx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_598
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_599
	mov rbx,0
	mov r15,rbx
	jmp L_600
	
L_599:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_600:
	cmp r15, 0
	je L_601
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
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
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r15,r15
	jmp L_603
	
L_601:
	mov rbx,t125
	mov r15,rbx
	
L_603:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
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
	mov r13,r15
	jmp L_604
	
L_598:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_605
	mov rbx,0
	mov r15,rbx
	jmp L_606
	
L_605:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_606:
	cmp r15, 0
	je L_607
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
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
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r15,r15
	jmp L_609
	
L_607:
	mov rbx,t125
	mov r15,rbx
	
L_609:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
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
	mov r13,r15
	
L_604:
	mov rbx,4
	mov r15,r12
	sub r15,rbx
	mov r12,r15
	jmp L_596
	
L_597:
	mov r15,r13
	mov r15,r15
	mov     rsi, t236
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
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
	mov r9,rdi
	mov rdx,t127
	mov r13,rdx
	mov rax,28
	mov r12,rax
	
L_613:
	mov rbx,0
	cmp r12,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_614
	mov r15,r9
	mov rcx,r12
	shr r15,cl
	mov rbx,15
	and r15,rbx
	mov r15,r15
	mov rdx,10
	cmp r15,rdx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_615
	mov rbx,48
	add r15,rbx
	mov rdi,r15
	mov r14,rdi
	mov rdx,32
	cmp r14,rdx
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_616
	mov rbx,0
	mov r15,rbx
	jmp L_617
	
L_616:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_617:
	cmp r15, 0
	je L_618
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rbx,r10
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
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r15,r15
	jmp L_620
	
L_618:
	mov rbx,t125
	mov r15,rbx
	
L_620:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
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
	mov r13,r15
	jmp L_621
	
L_615:
	mov rbx,65
	add r15,rbx
	mov rdx,10
	sub r15,rdx
	mov rdi,r15
	mov r14,rdi
	mov rax,32
	cmp r14,rax
	mov r15, 0
	setge r15B
	cmp r15, 0
	jne L_622
	mov rbx,0
	mov r15,rbx
	jmp L_623
	
L_622:
	mov rbx,126
	cmp r14,rbx
	mov r15, 0
	setle r15B
	mov r15,r15
	
L_623:
	cmp r15, 0
	je L_624
	mov rbx,  [gbl+8*108]
	mov r10,rbx
	mov rdx,32
	mov r11,r14
	sub r11,rdx
	mov rax,32
	mov r15,r14
	sub r15,rax
	mov rsi,r15
	mov rdi,r11
	mov rdx,r10
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
	call    substring
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov  r15, rax
	mov r15,r15
	jmp L_626
	
L_624:
	mov rbx,t125
	mov r15,rbx
	
L_626:
	mov r15,r15
	mov     rsi,  r15
	mov     rdi,  r13
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
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
	mov r13,r15
	
L_621:
	mov rbx,4
	mov r15,r12
	sub r15,rbx
	mov r12,r15
	jmp L_613
	
L_614:
	mov r15,r13
	mov r15,r15
	mov     rsi, t243
	mov     rdi,  r15
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
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
	call printf
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rbx,t248
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
	sub    rsp, 1144
	mov rdx,t109
	mov rbx,rdx
	mov qword [gbl+8*108],rbx
	mov rbx,  [rsp+8*135]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   3128
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

t229:
	 db 1," " ,0

t109:
	 db 95," !",34,"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[",92,"]^_`abcdefghijklmnopqrstuvwxyz{|}~" ,0

t236:
	 db 1," " ,0

t125:
	 db 0,"" ,0

t127:
	 db 0,"" ,0

t248:
	 db 0,"" ,0

t243:
	 db 1," " ,0

t222:
	 db 1," " ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

