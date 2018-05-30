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


gcd:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1312
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*2],rbx
	mov rbx,  [arg+8*2]
	mov rax,rbx
	mov qword [rsp+8*4],rdx
	mov rbx,  [arg+8*3]
	mov rdx,rbx
	mov qword [rsp+8*6],rax
	mov rbx,  [arg+8*4]
	mov rax,rbx
	mov qword [rsp+8*8],rdx
	mov rbx,  [arg+8*5]
	mov rdx,rbx
	mov qword [rsp+8*10],rax
	mov rbx,  [arg+8*6]
	mov rax,rbx
	mov qword [rsp+8*12],rdx
	mov rbx,  [arg+8*7]
	mov rdx,rbx
	mov qword [rsp+8*14],rax
	mov rbx,  [arg+8*8]
	mov rax,rbx
	mov qword [rsp+8*16],rdx
	mov rbx,  [arg+8*9]
	mov rdx,rbx
	mov qword [rsp+8*18],rax
	mov rbx,  [arg+8*10]
	mov rax,rbx
	mov qword [rsp+8*20],rdx
	mov rbx,  [arg+8*11]
	mov rdx,rbx
	mov qword [rsp+8*22],rax
	mov rax,  [arg+8*12]
	mov r14,rax
	mov rbx,  [arg+8*13]
	mov r12,rbx
	mov qword [rsp+8*24],rdx
	mov rdx,  [arg+8*14]
	mov r13,rdx
	mov rax,  [arg+8*15]
	mov r10,rax
	mov rbx,  [arg+8*16]
	mov r11,rbx
	mov rdx,  [arg+8*17]
	mov r8,rdx
	mov rax,  [arg+8*18]
	mov r9,rax
	mov rdx,  [arg+8*19]
	mov rbx,rdx
	mov qword [rsp+8*40],rbx
	mov rbx,  [arg+8*20]
	mov rax,rbx
	mov rbx,  [arg+8*21]
	mov rdx,rbx
	mov qword [rsp+8*42],rax
	mov rbx,  [arg+8*22]
	mov rax,rbx
	mov qword [rsp+8*44],rdx
	mov rbx,  [arg+8*23]
	mov rdx,rbx
	mov qword [rsp+8*46],rax
	mov rbx,  [arg+8*24]
	mov rax,rbx
	mov qword [rsp+8*48],rdx
	mov rbx,  [arg+8*25]
	mov rdx,rbx
	mov qword [rsp+8*50],rax
	mov rbx,  [arg+8*26]
	mov rax,rbx
	mov qword [rsp+8*52],rdx
	mov rbx,  [arg+8*27]
	mov rdx,rbx
	mov qword [rsp+8*54],rax
	mov rbx,  [arg+8*28]
	mov rax,rbx
	mov qword [rsp+8*56],rdx
	mov rbx,  [arg+8*29]
	mov rdx,rbx
	mov qword [rsp+8*58],rax
	mov rbx,  [arg+8*30]
	mov rax,rbx
	mov qword [rsp+8*60],rdx
	mov rbx,  [arg+8*31]
	mov rdx,rbx
	mov qword [rsp+8*62],rax
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*64],rdx
	mov qword [rsp+8*65],rax
	
L_2748:
	mov rbx,  [rsp+8*65]
	mov rdx,10
	cmp rbx,rdx
	mov rax, 0
	setle al
	cmp rax, 0
	mov qword [rsp+8*66],rax
	je L_2749
	mov rbx,  [rsp+8*6]
	mov rdx,  [rsp+8*8]
	mov r15,rbx
	add r15,rdx
	mov rax,  [rsp+8*10]
	add r15,rax
	mov rbx,  [rsp+8*12]
	add r15,rbx
	mov rdx,  [rsp+8*14]
	add r15,rdx
	mov rax,  [rsp+8*16]
	add r15,rax
	mov rbx,  [rsp+8*18]
	add r15,rbx
	mov rdx,  [rsp+8*20]
	add r15,rdx
	mov rax,  [rsp+8*22]
	add r15,rax
	mov rbx,  [rsp+8*24]
	add r15,rbx
	add r15,r14
	add r15,r12
	add r15,r13
	add r15,r10
	add r15,r11
	add r15,r8
	add r15,r9
	mov rdx,  [rsp+8*40]
	add r15,rdx
	mov rax,  [rsp+8*42]
	add r15,rax
	mov rbx,  [rsp+8*44]
	add r15,rbx
	mov rdx,  [rsp+8*46]
	add r15,rdx
	mov rax,  [rsp+8*48]
	add r15,rax
	mov rbx,  [rsp+8*50]
	add r15,rbx
	mov rdx,  [rsp+8*52]
	add r15,rdx
	mov rax,  [rsp+8*54]
	add r15,rax
	mov rbx,  [rsp+8*56]
	add r15,rbx
	mov rdx,  [rsp+8*58]
	add r15,rdx
	mov rax,  [rsp+8*60]
	add r15,rax
	mov rbx,  [rsp+8*62]
	add r15,rbx
	mov rdx,  [rsp+8*64]
	add r15,rdx
	xor rdx, rdx
	mov rax,  r15
	mov rbx, 100
	cdq
	idiv rbx
	mov  r15, rdx
	mov r15,r15
	mov rbx,  [rsp+8*65]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*65],rbx
	jmp L_2748
	
L_2749:
	xor rdx, rdx
	mov rax, [rsp+8*2]
	mov rbx, [rsp+8*4]
	cdq
	idiv rbx
	mov [rsp+8*69], rdx
	mov rbx,  [rsp+8*69]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*70],rax
	je L_2751
	mov rbx,  [rsp+8*4]
	mov rax,rbx
	leave
	ret
	
L_2751:
	xor rdx, rdx
	mov rax, [rsp+8*2]
	mov rbx, [rsp+8*4]
	cdq
	idiv rbx
	mov [rsp+8*71], rdx
	mov rdx,58
	mov rbx,rdx
	mov rdx,56
	mov rax,rdx
	mov qword [arg+8*31],rbx
	mov rbx,54
	mov rdx,rbx
	mov qword [arg+8*30],rax
	mov rax,52
	mov rbx,rax
	mov qword [arg+8*29],rdx
	mov rdx,50
	mov rax,rdx
	mov qword [arg+8*28],rbx
	mov rbx,48
	mov rdx,rbx
	mov qword [arg+8*27],rax
	mov rax,46
	mov rbx,rax
	mov qword [arg+8*26],rdx
	mov rdx,44
	mov rax,rdx
	mov qword [arg+8*25],rbx
	mov rbx,42
	mov rdx,rbx
	mov qword [arg+8*24],rax
	mov rax,40
	mov rbx,rax
	mov qword [arg+8*23],rdx
	mov rdx,38
	mov rax,rdx
	mov qword [arg+8*22],rbx
	mov rbx,36
	mov rdx,rbx
	mov qword [arg+8*21],rax
	mov rax,34
	mov rbx,rax
	mov qword [arg+8*20],rdx
	mov rdx,32
	mov rax,rdx
	mov qword [arg+8*19],rbx
	mov rbx,30
	mov rdx,rbx
	mov qword [arg+8*18],rax
	mov rax,28
	mov rbx,rax
	mov qword [arg+8*17],rdx
	mov rdx,26
	mov rax,rdx
	mov qword [arg+8*16],rbx
	mov rbx,24
	mov rdx,rbx
	mov qword [arg+8*15],rax
	mov rax,22
	mov rbx,rax
	mov qword [arg+8*14],rdx
	mov rdx,20
	mov rax,rdx
	mov qword [arg+8*13],rbx
	mov rbx,18
	mov rdx,rbx
	mov qword [arg+8*12],rax
	mov rax,16
	mov rbx,rax
	mov qword [arg+8*11],rdx
	mov rdx,14
	mov rax,rdx
	mov qword [arg+8*10],rbx
	mov rbx,12
	mov rdx,rbx
	mov qword [arg+8*9],rax
	mov rax,10
	mov rbx,rax
	mov qword [arg+8*8],rdx
	mov rdx,8
	mov rax,rdx
	mov qword [arg+8*7],rbx
	mov rbx,6
	mov rdx,rbx
	mov qword [arg+8*6],rax
	mov rax,4
	mov rbx,rax
	mov qword [arg+8*5],rdx
	mov rdx,2
	mov rax,rdx
	mov qword [arg+8*4],rbx
	mov rbx,0
	mov rdx,rbx
	mov rbx,68
	mov rsi,rbx
	mov rbx,10
	mov rdi,rbx
	mov qword [arg+8*2],rdx
	mov qword [arg+8*3],rax
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call gcd
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rbx , rax
	mov rax,  [rsp+8*64]
	mov rdx,rax
	mov qword [rsp+8*72],rbx
	mov rbx,  [rsp+8*62]
	mov rax,rbx
	mov qword [arg+8*31],rdx
	mov rdx,  [rsp+8*60]
	mov rbx,rdx
	mov qword [arg+8*30],rax
	mov rax,  [rsp+8*58]
	mov rdx,rax
	mov qword [arg+8*29],rbx
	mov rbx,  [rsp+8*56]
	mov rax,rbx
	mov qword [arg+8*28],rdx
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov qword [arg+8*27],rax
	mov rax,  [rsp+8*52]
	mov rdx,rax
	mov qword [arg+8*26],rbx
	mov rbx,  [rsp+8*50]
	mov rax,rbx
	mov qword [arg+8*25],rdx
	mov rdx,  [rsp+8*48]
	mov rbx,rdx
	mov qword [arg+8*24],rax
	mov rax,  [rsp+8*46]
	mov rdx,rax
	mov qword [arg+8*23],rbx
	mov rbx,  [rsp+8*44]
	mov rax,rbx
	mov qword [arg+8*22],rdx
	mov rdx,  [rsp+8*42]
	mov rbx,rdx
	mov qword [arg+8*21],rax
	mov rax,  [rsp+8*40]
	mov rdx,rax
	mov rax,r9
	mov qword [arg+8*20],rbx
	mov rbx,r8
	mov qword [arg+8*19],rdx
	mov rdx,r11
	mov qword [arg+8*18],rax
	mov rax,r10
	mov qword [arg+8*17],rbx
	mov rbx,r13
	mov qword [arg+8*16],rdx
	mov rdx,r12
	mov qword [arg+8*15],rax
	mov rax,r14
	mov qword [arg+8*14],rbx
	mov qword [arg+8*13],rdx
	mov rdx,  [rsp+8*24]
	mov rbx,rdx
	mov qword [arg+8*12],rax
	mov rax,  [rsp+8*22]
	mov rdx,rax
	mov qword [arg+8*11],rbx
	mov rbx,  [rsp+8*20]
	mov rax,rbx
	mov qword [arg+8*10],rdx
	mov rdx,  [rsp+8*18]
	mov rbx,rdx
	mov qword [arg+8*9],rax
	mov rax,  [rsp+8*16]
	mov rdx,rax
	mov qword [arg+8*8],rbx
	mov rbx,  [rsp+8*14]
	mov rax,rbx
	mov qword [arg+8*7],rdx
	mov rdx,  [rsp+8*12]
	mov rbx,rdx
	mov qword [arg+8*6],rax
	mov rax,  [rsp+8*10]
	mov rdx,rax
	mov qword [arg+8*5],rbx
	mov rbx,  [rsp+8*72]
	mov rax,rbx
	mov rbx,r15
	mov qword [arg+8*4],rdx
	mov rdx,  [rsp+8*71]
	mov rsi,rdx
	mov rdx,  [rsp+8*4]
	mov rdi,rdx
	mov qword [arg+8*2],rbx
	mov qword [arg+8*3],rax
	push r15
	push r14
	call gcd1
	pop r14
	pop r15
	mov r14 , rax
	mov rax,r14
	leave
	ret
	
gcd1:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1312
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*74],rbx
	mov rbx,  [arg+8*2]
	mov rax,rbx
	mov qword [rsp+8*75],rdx
	mov rbx,  [arg+8*3]
	mov rdx,rbx
	mov qword [rsp+8*76],rax
	mov rbx,  [arg+8*4]
	mov rax,rbx
	mov qword [rsp+8*77],rdx
	mov rbx,  [arg+8*5]
	mov rdx,rbx
	mov qword [rsp+8*78],rax
	mov rax,  [arg+8*6]
	mov r9,rax
	mov qword [rsp+8*79],rdx
	mov rdx,  [arg+8*7]
	mov rbx,rdx
	mov qword [rsp+8*81],rbx
	mov rbx,  [arg+8*8]
	mov rax,rbx
	mov rdx,  [arg+8*9]
	mov r10,rdx
	mov qword [rsp+8*82],rax
	mov rax,  [arg+8*10]
	mov rbx,rax
	mov qword [rsp+8*84],rbx
	mov rbx,  [arg+8*11]
	mov rdx,rbx
	mov rbx,  [arg+8*12]
	mov rax,rbx
	mov qword [rsp+8*85],rdx
	mov rbx,  [arg+8*13]
	mov rdx,rbx
	mov qword [rsp+8*86],rax
	mov rbx,  [arg+8*14]
	mov rax,rbx
	mov qword [rsp+8*87],rdx
	mov rdx,  [arg+8*15]
	mov r12,rdx
	mov qword [rsp+8*88],rax
	mov rax,  [arg+8*16]
	mov rbx,rax
	mov qword [rsp+8*90],rbx
	mov rbx,  [arg+8*17]
	mov rdx,rbx
	mov rax,  [arg+8*18]
	mov r8,rax
	mov qword [rsp+8*91],rdx
	mov rdx,  [arg+8*19]
	mov rbx,rdx
	mov qword [rsp+8*93],rbx
	mov rbx,  [arg+8*20]
	mov rax,rbx
	mov rbx,  [arg+8*21]
	mov rdx,rbx
	mov qword [rsp+8*94],rax
	mov rbx,  [arg+8*22]
	mov rax,rbx
	mov qword [rsp+8*95],rdx
	mov rdx,  [arg+8*23]
	mov r14,rdx
	mov qword [rsp+8*96],rax
	mov rax,  [arg+8*24]
	mov rbx,rax
	mov qword [rsp+8*98],rbx
	mov rbx,  [arg+8*25]
	mov rdx,rbx
	mov rbx,  [arg+8*26]
	mov rax,rbx
	mov qword [rsp+8*99],rdx
	mov rdx,  [arg+8*27]
	mov r13,rdx
	mov qword [rsp+8*100],rax
	mov rax,  [arg+8*28]
	mov rbx,rax
	mov qword [rsp+8*102],rbx
	mov rbx,  [arg+8*29]
	mov rdx,rbx
	mov rbx,  [arg+8*30]
	mov rax,rbx
	mov qword [rsp+8*103],rdx
	mov rdx,  [arg+8*31]
	mov r11,rdx
	mov rbx,  [rsp+8*76]
	mov qword [rsp+8*104],rax
	mov rax,  [rsp+8*77]
	mov rdx,rbx
	add rdx,rax
	mov rbx,  [rsp+8*78]
	add rdx,rbx
	mov rax,  [rsp+8*79]
	add rdx,rax
	add rdx,r9
	mov rbx,  [rsp+8*81]
	add rdx,rbx
	mov rax,  [rsp+8*82]
	add rdx,rax
	add rdx,r10
	mov rbx,  [rsp+8*84]
	add rdx,rbx
	mov rax,  [rsp+8*85]
	add rdx,rax
	mov rbx,  [rsp+8*86]
	add rdx,rbx
	mov rax,  [rsp+8*87]
	add rdx,rax
	mov rbx,  [rsp+8*88]
	add rdx,rbx
	add rdx,r12
	mov rax,  [rsp+8*90]
	add rdx,rax
	mov rbx,  [rsp+8*91]
	add rdx,rbx
	add rdx,r8
	mov rax,  [rsp+8*93]
	add rdx,rax
	mov rbx,  [rsp+8*94]
	add rdx,rbx
	mov rax,  [rsp+8*95]
	add rdx,rax
	mov rbx,  [rsp+8*96]
	add rdx,rbx
	add rdx,r14
	mov rax,  [rsp+8*98]
	add rdx,rax
	mov rbx,  [rsp+8*99]
	add rdx,rbx
	mov rax,  [rsp+8*100]
	add rdx,rax
	add rdx,r13
	mov rbx,  [rsp+8*102]
	add rdx,rbx
	mov rax,  [rsp+8*103]
	add rdx,rax
	mov rbx,  [rsp+8*104]
	add rdx,rbx
	add rdx,r11
	mov qword [rsp+8*106],rdx
	xor rdx, rdx
	mov rax, [rsp+8*106]
	mov rbx, 100
	cdq
	idiv rbx
	mov [rsp+8*106], rdx
	mov rdx,  [rsp+8*106]
	mov rbx,rdx
	mov qword [rsp+8*107],rbx
	xor rdx, rdx
	mov rax, [rsp+8*74]
	mov rbx, [rsp+8*75]
	cdq
	idiv rbx
	mov [rsp+8*108], rdx
	mov rbx,  [rsp+8*108]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*109],rax
	je L_2753
	mov rbx,  [rsp+8*75]
	mov rax,rbx
	leave
	ret
	
L_2753:
	xor rdx, rdx
	mov rax, [rsp+8*74]
	mov rbx, [rsp+8*75]
	cdq
	idiv rbx
	mov [rsp+8*110], rdx
	mov rbx,r11
	mov rax,  [rsp+8*104]
	mov rdx,rax
	mov qword [arg+8*31],rbx
	mov rbx,  [rsp+8*103]
	mov rax,rbx
	mov qword [arg+8*30],rdx
	mov rdx,  [rsp+8*102]
	mov rbx,rdx
	mov rdx,r13
	mov qword [arg+8*29],rax
	mov qword [arg+8*28],rbx
	mov rbx,  [rsp+8*100]
	mov rax,rbx
	mov qword [arg+8*27],rdx
	mov rdx,  [rsp+8*99]
	mov rbx,rdx
	mov qword [arg+8*26],rax
	mov rax,  [rsp+8*98]
	mov rdx,rax
	mov rax,r14
	mov qword [arg+8*25],rbx
	mov qword [arg+8*24],rdx
	mov rdx,  [rsp+8*96]
	mov rbx,rdx
	mov qword [arg+8*23],rax
	mov rax,  [rsp+8*95]
	mov rdx,rax
	mov qword [arg+8*22],rbx
	mov rbx,  [rsp+8*94]
	mov rax,rbx
	mov qword [arg+8*21],rdx
	mov rdx,  [rsp+8*93]
	mov rbx,rdx
	mov rdx,r8
	mov qword [arg+8*20],rax
	mov qword [arg+8*19],rbx
	mov rbx,  [rsp+8*91]
	mov rax,rbx
	mov qword [arg+8*18],rdx
	mov rdx,  [rsp+8*90]
	mov rbx,rdx
	mov rdx,r12
	mov qword [arg+8*17],rax
	mov qword [arg+8*16],rbx
	mov rbx,  [rsp+8*88]
	mov rax,rbx
	mov qword [arg+8*15],rdx
	mov rdx,  [rsp+8*87]
	mov rbx,rdx
	mov qword [arg+8*14],rax
	mov rax,  [rsp+8*86]
	mov rdx,rax
	mov qword [arg+8*13],rbx
	mov rbx,  [rsp+8*85]
	mov rax,rbx
	mov qword [arg+8*12],rdx
	mov rdx,  [rsp+8*84]
	mov rbx,rdx
	mov rdx,r10
	mov qword [arg+8*11],rax
	mov qword [arg+8*10],rbx
	mov rbx,  [rsp+8*82]
	mov rax,rbx
	mov qword [arg+8*9],rdx
	mov rdx,  [rsp+8*81]
	mov rbx,rdx
	mov rdx,r9
	mov qword [arg+8*8],rax
	mov qword [arg+8*7],rbx
	mov rbx,  [rsp+8*79]
	mov rax,rbx
	mov qword [arg+8*6],rdx
	mov rdx,  [rsp+8*78]
	mov rbx,rdx
	mov qword [arg+8*5],rax
	mov rax,  [rsp+8*77]
	mov rdx,rax
	mov qword [arg+8*4],rbx
	mov rbx,  [rsp+8*107]
	mov rax,rbx
	mov rbx,  [rsp+8*110]
	mov rsi,rbx
	mov rbx,  [rsp+8*75]
	mov rdi,rbx
	mov qword [arg+8*3],rdx
	mov qword [arg+8*2],rax
	push r15
	push r14
	call gcd2
	pop r14
	pop r15
	mov r14 , rax
	mov rax,r14
	leave
	ret
	
gcd2:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1312
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*112],rbx
	mov rbx,  [arg+8*2]
	mov rax,rbx
	mov qword [rsp+8*113],rdx
	mov rbx,  [arg+8*3]
	mov rdx,rbx
	mov qword [rsp+8*114],rax
	mov rbx,  [arg+8*4]
	mov rax,rbx
	mov qword [rsp+8*115],rdx
	mov rbx,  [arg+8*5]
	mov rdx,rbx
	mov qword [rsp+8*116],rax
	mov rbx,  [arg+8*6]
	mov rax,rbx
	mov qword [rsp+8*117],rdx
	mov rdx,  [arg+8*7]
	mov r10,rdx
	mov qword [rsp+8*118],rax
	mov rax,  [arg+8*8]
	mov rbx,rax
	mov qword [rsp+8*120],rbx
	mov rbx,  [arg+8*9]
	mov rdx,rbx
	mov rbx,  [arg+8*10]
	mov rax,rbx
	mov qword [rsp+8*121],rdx
	mov rbx,  [arg+8*11]
	mov rdx,rbx
	mov qword [rsp+8*122],rax
	mov rax,  [arg+8*12]
	mov r13,rax
	mov qword [rsp+8*123],rdx
	mov rdx,  [arg+8*13]
	mov rbx,rdx
	mov qword [rsp+8*125],rbx
	mov rbx,  [arg+8*14]
	mov rax,rbx
	mov rbx,  [arg+8*15]
	mov rdx,rbx
	mov qword [rsp+8*126],rax
	mov rax,  [arg+8*16]
	mov r11,rax
	mov qword [rsp+8*127],rdx
	mov rdx,  [arg+8*17]
	mov rbx,rdx
	mov qword [rsp+8*129],rbx
	mov rbx,  [arg+8*18]
	mov rax,rbx
	mov rbx,  [arg+8*19]
	mov rdx,rbx
	mov qword [rsp+8*130],rax
	mov rbx,  [arg+8*20]
	mov rax,rbx
	mov qword [rsp+8*131],rdx
	mov rdx,  [arg+8*21]
	mov r9,rdx
	mov rbx,  [arg+8*22]
	mov r8,rbx
	mov qword [rsp+8*132],rax
	mov rdx,  [arg+8*23]
	mov rax,rdx
	mov rdx,  [arg+8*24]
	mov rbx,rdx
	mov qword [rsp+8*135],rax
	mov rax,  [arg+8*25]
	mov r14,rax
	mov qword [rsp+8*136],rbx
	mov rdx,  [arg+8*26]
	mov rbx,rdx
	mov qword [rsp+8*138],rbx
	mov rbx,  [arg+8*27]
	mov rax,rbx
	mov rbx,  [arg+8*28]
	mov rdx,rbx
	mov qword [rsp+8*139],rax
	mov rax,  [arg+8*29]
	mov r12,rax
	mov qword [rsp+8*140],rdx
	mov rdx,  [arg+8*30]
	mov rbx,rdx
	mov qword [rsp+8*142],rbx
	mov rbx,  [arg+8*31]
	mov rax,rbx
	mov rdx,  [rsp+8*114]
	mov rbx,  [rsp+8*115]
	mov qword [rsp+8*143],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,  [rsp+8*116]
	add rax,rbx
	mov rdx,  [rsp+8*117]
	add rax,rdx
	mov rbx,  [rsp+8*118]
	add rax,rbx
	add rax,r10
	mov rdx,  [rsp+8*120]
	add rax,rdx
	mov rbx,  [rsp+8*121]
	add rax,rbx
	mov rdx,  [rsp+8*122]
	add rax,rdx
	mov rbx,  [rsp+8*123]
	add rax,rbx
	add rax,r13
	mov rdx,  [rsp+8*125]
	add rax,rdx
	mov rbx,  [rsp+8*126]
	add rax,rbx
	mov rdx,  [rsp+8*127]
	add rax,rdx
	add rax,r11
	mov rbx,  [rsp+8*129]
	add rax,rbx
	mov rdx,  [rsp+8*130]
	add rax,rdx
	mov rbx,  [rsp+8*131]
	add rax,rbx
	mov rdx,  [rsp+8*132]
	add rax,rdx
	add rax,r9
	add rax,r8
	mov rbx,  [rsp+8*135]
	add rax,rbx
	mov rdx,  [rsp+8*136]
	add rax,rdx
	add rax,r14
	mov rbx,  [rsp+8*138]
	add rax,rbx
	mov rdx,  [rsp+8*139]
	add rax,rdx
	mov rbx,  [rsp+8*140]
	add rax,rbx
	add rax,r12
	mov rdx,  [rsp+8*142]
	add rax,rdx
	mov rbx,  [rsp+8*143]
	add rax,rbx
	mov qword [rsp+8*144],rax
	xor rdx, rdx
	mov rax, [rsp+8*144]
	mov rbx, 100
	cdq
	idiv rbx
	mov [rsp+8*144], rdx
	mov rdx,  [rsp+8*144]
	mov rbx,rdx
	mov qword [rsp+8*145],rbx
	xor rdx, rdx
	mov rax, [rsp+8*112]
	mov rbx, [rsp+8*113]
	cdq
	idiv rbx
	mov [rsp+8*146], rdx
	mov rbx,  [rsp+8*146]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*147],rax
	je L_2755
	mov rbx,  [rsp+8*113]
	mov rax,rbx
	leave
	ret
	
L_2755:
	xor rdx, rdx
	mov rax, [rsp+8*112]
	mov rbx, [rsp+8*113]
	cdq
	idiv rbx
	mov [rsp+8*148], rdx
	mov rdx,  [rsp+8*143]
	mov rbx,rdx
	mov rdx,  [rsp+8*142]
	mov rax,rdx
	mov rdx,r12
	mov qword [arg+8*31],rbx
	mov qword [arg+8*30],rax
	mov rax,  [rsp+8*140]
	mov rbx,rax
	mov qword [arg+8*29],rdx
	mov rdx,  [rsp+8*139]
	mov rax,rdx
	mov qword [arg+8*28],rbx
	mov rbx,  [rsp+8*138]
	mov rdx,rbx
	mov rbx,r14
	mov qword [arg+8*27],rax
	mov qword [arg+8*26],rdx
	mov rdx,  [rsp+8*136]
	mov rax,rdx
	mov qword [arg+8*25],rbx
	mov rbx,  [rsp+8*135]
	mov rdx,rbx
	mov rbx,r8
	mov qword [arg+8*24],rax
	mov rax,r9
	mov qword [arg+8*23],rdx
	mov qword [arg+8*22],rbx
	mov rbx,  [rsp+8*132]
	mov rdx,rbx
	mov qword [arg+8*21],rax
	mov rax,  [rsp+8*131]
	mov rbx,rax
	mov qword [arg+8*20],rdx
	mov rdx,  [rsp+8*130]
	mov rax,rdx
	mov qword [arg+8*19],rbx
	mov rbx,  [rsp+8*129]
	mov rdx,rbx
	mov rbx,r11
	mov qword [arg+8*18],rax
	mov qword [arg+8*17],rdx
	mov rdx,  [rsp+8*127]
	mov rax,rdx
	mov qword [arg+8*16],rbx
	mov rbx,  [rsp+8*126]
	mov rdx,rbx
	mov qword [arg+8*15],rax
	mov rax,  [rsp+8*125]
	mov rbx,rax
	mov rax,r13
	mov qword [arg+8*14],rdx
	mov qword [arg+8*13],rbx
	mov rbx,  [rsp+8*123]
	mov rdx,rbx
	mov qword [arg+8*12],rax
	mov rax,  [rsp+8*122]
	mov rbx,rax
	mov qword [arg+8*11],rdx
	mov rdx,  [rsp+8*121]
	mov rax,rdx
	mov qword [arg+8*10],rbx
	mov rbx,  [rsp+8*120]
	mov rdx,rbx
	mov rbx,r10
	mov qword [arg+8*9],rax
	mov qword [arg+8*8],rdx
	mov rdx,  [rsp+8*118]
	mov rax,rdx
	mov qword [arg+8*7],rbx
	mov rbx,  [rsp+8*117]
	mov rdx,rbx
	mov qword [arg+8*6],rax
	mov rax,  [rsp+8*116]
	mov rbx,rax
	mov qword [arg+8*5],rdx
	mov rdx,  [rsp+8*115]
	mov rax,rdx
	mov qword [arg+8*4],rbx
	mov rbx,  [rsp+8*114]
	mov rdx,rbx
	mov rbx,  [rsp+8*148]
	mov rsi,rbx
	mov rbx,  [rsp+8*113]
	mov rdi,rbx
	mov qword [arg+8*2],rdx
	mov qword [arg+8*3],rax
	push r15
	push r14
	call gcd
	pop r14
	pop r15
	mov r14 , rax
	mov rax,r14
	leave
	ret
	
main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1312
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
        sub     rdx, 3296
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	push r14
	call global_init
	pop r14
	pop r15
	mov r14 , rax
	mov rdx,58
	mov rbx,rdx
	mov qword [arg+8*31],rbx
	mov rbx,56
	mov rax,rbx
	mov rdx,54
	mov rbx,rdx
	mov qword [arg+8*29],rbx
	mov rdx,52
	mov rbx,rdx
	mov qword [arg+8*28],rbx
	mov rdx,50
	mov rbx,rdx
	mov qword [arg+8*27],rbx
	mov rdx,48
	mov rbx,rdx
	mov qword [arg+8*26],rbx
	mov rdx,46
	mov rbx,rdx
	mov qword [arg+8*25],rbx
	mov rdx,44
	mov rbx,rdx
	mov qword [arg+8*24],rbx
	mov rdx,42
	mov rbx,rdx
	mov qword [arg+8*23],rbx
	mov rdx,40
	mov rbx,rdx
	mov qword [arg+8*22],rbx
	mov rdx,38
	mov rbx,rdx
	mov qword [arg+8*21],rbx
	mov rdx,36
	mov rbx,rdx
	mov qword [arg+8*20],rbx
	mov rdx,34
	mov rbx,rdx
	mov qword [arg+8*19],rbx
	mov rdx,32
	mov rbx,rdx
	mov qword [arg+8*18],rbx
	mov rdx,30
	mov rbx,rdx
	mov qword [arg+8*17],rbx
	mov rdx,28
	mov rbx,rdx
	mov qword [arg+8*16],rbx
	mov rdx,26
	mov rbx,rdx
	mov qword [arg+8*15],rbx
	mov rdx,24
	mov rbx,rdx
	mov qword [arg+8*14],rbx
	mov rdx,22
	mov rbx,rdx
	mov qword [arg+8*13],rbx
	mov rdx,20
	mov rbx,rdx
	mov qword [arg+8*12],rbx
	mov rdx,18
	mov rbx,rdx
	mov qword [arg+8*11],rbx
	mov rdx,16
	mov rbx,rdx
	mov qword [arg+8*10],rbx
	mov rdx,14
	mov rbx,rdx
	mov qword [arg+8*9],rbx
	mov rdx,12
	mov rbx,rdx
	mov qword [arg+8*8],rbx
	mov rdx,10
	mov rbx,rdx
	mov qword [arg+8*7],rbx
	mov rdx,8
	mov rbx,rdx
	mov qword [arg+8*6],rbx
	mov rdx,6
	mov rbx,rdx
	mov qword [arg+8*5],rbx
	mov rdx,4
	mov rbx,rdx
	mov qword [arg+8*4],rbx
	mov rdx,2
	mov rbx,rdx
	mov qword [arg+8*3],rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [arg+8*2],rbx
	mov rbx,1
	mov rsi,rbx
	mov rbx,10
	mov rdi,rbx
	mov qword [arg+8*30],rax
	push r15
	push r14
	call gcd
	pop r14
	pop r15
	mov r14 , rax
	mov rbx,1024
	mov r15,r14
	add r15,rbx
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
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1312
	mov rbx,  [rsp+8*156]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   3296
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

