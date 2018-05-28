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
	mov r10,rdi
	mov r14,rsi
	mov rdx,  [arg+8*2]
	mov rbx,rdx
	mov qword [rsp+8*6],rbx
	mov rbx,  [arg+8*3]
	mov rax,rbx
	mov rbx,  [arg+8*4]
	mov rdx,rbx
	mov qword [rsp+8*8],rax
	mov rbx,  [arg+8*5]
	mov rax,rbx
	mov qword [rsp+8*10],rdx
	mov rdx,  [arg+8*6]
	mov r15,rdx
	mov qword [rsp+8*12],rax
	mov rax,  [arg+8*7]
	mov rbx,rax
	mov qword [rsp+8*16],rbx
	mov rbx,  [arg+8*8]
	mov rdx,rbx
	mov rax,  [arg+8*9]
	mov r11,rax
	mov qword [rsp+8*18],rdx
	mov rdx,  [arg+8*10]
	mov rbx,rdx
	mov rax,  [arg+8*11]
	mov r12,rax
	mov qword [rsp+8*22],rbx
	mov rbx,  [arg+8*12]
	mov r9,rbx
	mov rax,  [arg+8*13]
	mov rdx,rax
	mov qword [rsp+8*28],rdx
	mov rdx,  [arg+8*14]
	mov rbx,rdx
	mov qword [rsp+8*30],rbx
	mov rbx,  [arg+8*15]
	mov rax,rbx
	mov rbx,  [arg+8*16]
	mov rdx,rbx
	mov qword [rsp+8*32],rax
	mov rbx,  [arg+8*17]
	mov rax,rbx
	mov qword [rsp+8*34],rdx
	mov rbx,  [arg+8*18]
	mov rdx,rbx
	mov qword [rsp+8*36],rax
	mov rbx,  [arg+8*19]
	mov rax,rbx
	mov qword [rsp+8*38],rdx
	mov rbx,  [arg+8*20]
	mov rdx,rbx
	mov qword [rsp+8*40],rax
	mov rbx,  [arg+8*21]
	mov rax,rbx
	mov qword [rsp+8*42],rdx
	mov rbx,  [arg+8*22]
	mov rdx,rbx
	mov qword [rsp+8*44],rax
	mov rbx,  [arg+8*23]
	mov rax,rbx
	mov qword [rsp+8*46],rdx
	mov rbx,  [arg+8*24]
	mov rdx,rbx
	mov qword [rsp+8*48],rax
	mov rbx,  [arg+8*25]
	mov rax,rbx
	mov qword [rsp+8*50],rdx
	mov rbx,  [arg+8*26]
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rbx,  [arg+8*27]
	mov rax,rbx
	mov qword [rsp+8*54],rdx
	mov rbx,  [arg+8*28]
	mov rdx,rbx
	mov qword [rsp+8*56],rax
	mov rbx,  [arg+8*29]
	mov rax,rbx
	mov qword [rsp+8*58],rdx
	mov rbx,  [arg+8*30]
	mov rdx,rbx
	mov qword [rsp+8*60],rax
	mov rbx,  [arg+8*31]
	mov rax,rbx
	mov qword [rsp+8*62],rdx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*65],rdx
	mov qword [rsp+8*64],rax
	
L_2729:
	mov rbx,  [rsp+8*65]
	mov rdx,10
	cmp rbx,rdx
	mov r13, 0
	setle r13B
	cmp r13, 0
	je L_2730
	mov rbx,  [rsp+8*6]
	mov rdx,  [rsp+8*8]
	mov r13,rbx
	add r13,rdx
	mov rax,  [rsp+8*10]
	add r13,rax
	mov rbx,  [rsp+8*12]
	add r13,rbx
	add r13,r15
	mov rdx,  [rsp+8*16]
	add r13,rdx
	mov rax,  [rsp+8*18]
	add r13,rax
	add r13,r11
	mov rbx,  [rsp+8*22]
	add r13,rbx
	add r13,r12
	add r13,r9
	mov rdx,  [rsp+8*28]
	add r13,rdx
	mov rax,  [rsp+8*30]
	add r13,rax
	mov rbx,  [rsp+8*32]
	add r13,rbx
	mov rdx,  [rsp+8*34]
	add r13,rdx
	mov rax,  [rsp+8*36]
	add r13,rax
	mov rbx,  [rsp+8*38]
	add r13,rbx
	mov rdx,  [rsp+8*40]
	add r13,rdx
	mov rax,  [rsp+8*42]
	add r13,rax
	mov rbx,  [rsp+8*44]
	add r13,rbx
	mov rdx,  [rsp+8*46]
	add r13,rdx
	mov rax,  [rsp+8*48]
	add r13,rax
	mov rbx,  [rsp+8*50]
	add r13,rbx
	mov rdx,  [rsp+8*52]
	add r13,rdx
	mov rax,  [rsp+8*54]
	add r13,rax
	mov rbx,  [rsp+8*56]
	add r13,rbx
	mov rdx,  [rsp+8*58]
	add r13,rdx
	mov rax,  [rsp+8*60]
	add r13,rax
	mov rbx,  [rsp+8*62]
	add r13,rbx
	mov rdx,  [rsp+8*64]
	add r13,rdx
	xor rdx, rdx
	mov rax,  r13
	mov rbx, 100
	cdq
	idiv rbx
	mov  r13, rdx
	mov rbx,r13
	mov rdx,  [rsp+8*65]
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*68],rbx
	mov qword [rsp+8*65],rdx
	jmp L_2729
	
L_2730:
	xor rdx, rdx
	mov rax,  r10
	mov rbx,  r14
	cdq
	idiv rbx
	mov  r13, rdx
	mov rbx,0
	cmp r13,rbx
	mov r13, 0
	sete r13B
	cmp r13, 0
	je L_2732
	mov rax,r14
	leave
	ret
	
L_2732:
	xor rdx, rdx
	mov rax,  r10
	mov rbx,  r14
	cdq
	idiv rbx
	mov  r13, rdx
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
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	call gcd
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	mov r10 , rax
	mov rdx,  [rsp+8*64]
	mov rbx,rdx
	mov rdx,  [rsp+8*62]
	mov rax,rdx
	mov qword [arg+8*31],rbx
	mov rbx,  [rsp+8*60]
	mov rdx,rbx
	mov qword [arg+8*30],rax
	mov rax,  [rsp+8*58]
	mov rbx,rax
	mov qword [arg+8*29],rdx
	mov rdx,  [rsp+8*56]
	mov rax,rdx
	mov qword [arg+8*28],rbx
	mov rbx,  [rsp+8*54]
	mov rdx,rbx
	mov qword [arg+8*27],rax
	mov rax,  [rsp+8*52]
	mov rbx,rax
	mov qword [arg+8*26],rdx
	mov rdx,  [rsp+8*50]
	mov rax,rdx
	mov qword [arg+8*25],rbx
	mov rbx,  [rsp+8*48]
	mov rdx,rbx
	mov qword [arg+8*24],rax
	mov rax,  [rsp+8*46]
	mov rbx,rax
	mov qword [arg+8*23],rdx
	mov rdx,  [rsp+8*44]
	mov rax,rdx
	mov qword [arg+8*22],rbx
	mov rbx,  [rsp+8*42]
	mov rdx,rbx
	mov qword [arg+8*21],rax
	mov rax,  [rsp+8*40]
	mov rbx,rax
	mov qword [arg+8*20],rdx
	mov rdx,  [rsp+8*38]
	mov rax,rdx
	mov qword [arg+8*19],rbx
	mov rbx,  [rsp+8*36]
	mov rdx,rbx
	mov qword [arg+8*18],rax
	mov rax,  [rsp+8*34]
	mov rbx,rax
	mov qword [arg+8*17],rdx
	mov rdx,  [rsp+8*32]
	mov rax,rdx
	mov qword [arg+8*16],rbx
	mov rbx,  [rsp+8*30]
	mov rdx,rbx
	mov qword [arg+8*15],rax
	mov rax,  [rsp+8*28]
	mov rbx,rax
	mov rax,r9
	mov qword [arg+8*14],rdx
	mov rdx,r12
	mov qword [arg+8*13],rbx
	mov qword [arg+8*12],rax
	mov rax,  [rsp+8*22]
	mov rbx,rax
	mov rax,r11
	mov qword [arg+8*11],rdx
	mov qword [arg+8*10],rbx
	mov rbx,  [rsp+8*18]
	mov rdx,rbx
	mov qword [arg+8*9],rax
	mov rax,  [rsp+8*16]
	mov rbx,rax
	mov rax,r15
	mov qword [arg+8*8],rdx
	mov qword [arg+8*7],rbx
	mov rbx,  [rsp+8*12]
	mov rdx,rbx
	mov qword [arg+8*6],rax
	mov rax,  [rsp+8*10]
	mov rbx,rax
	mov rax,r10
	mov qword [arg+8*5],rdx
	mov qword [arg+8*4],rbx
	mov rbx,  [rsp+8*68]
	mov rdx,rbx
	mov rsi,r13
	mov rdi,r14
	mov qword [arg+8*2],rdx
	mov qword [arg+8*3],rax
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	call gcd1
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	mov r15 , rax
	mov rax,r15
	leave
	ret
	
gcd1:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1312
	mov rbx,rdi
	mov rdx,rsi
	mov rax,  [arg+8*2]
	mov r12,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*75],rdx
	mov rdx,  [arg+8*3]
	mov rbx,rdx
	mov qword [rsp+8*77],rbx
	mov rbx,  [arg+8*4]
	mov rax,rbx
	mov rdx,  [arg+8*5]
	mov r14,rdx
	mov qword [rsp+8*78],rax
	mov rax,  [arg+8*6]
	mov rbx,rax
	mov qword [rsp+8*80],rbx
	mov rbx,  [arg+8*7]
	mov rdx,rbx
	mov rbx,  [arg+8*8]
	mov rax,rbx
	mov qword [rsp+8*81],rdx
	mov rbx,  [arg+8*9]
	mov rdx,rbx
	mov qword [rsp+8*82],rax
	mov rax,  [arg+8*10]
	mov r10,rax
	mov qword [rsp+8*83],rdx
	mov rdx,  [arg+8*11]
	mov rbx,rdx
	mov qword [rsp+8*85],rbx
	mov rbx,  [arg+8*12]
	mov rax,rbx
	mov rbx,  [arg+8*13]
	mov rdx,rbx
	mov qword [rsp+8*86],rax
	mov rax,  [arg+8*14]
	mov r9,rax
	mov qword [rsp+8*87],rdx
	mov rdx,  [arg+8*15]
	mov rbx,rdx
	mov qword [rsp+8*89],rbx
	mov rbx,  [arg+8*16]
	mov rax,rbx
	mov rbx,  [arg+8*17]
	mov rdx,rbx
	mov qword [rsp+8*90],rax
	mov rbx,  [arg+8*18]
	mov rax,rbx
	mov qword [rsp+8*91],rdx
	mov rdx,  [arg+8*19]
	mov r13,rdx
	mov rbx,  [arg+8*20]
	mov r15,rbx
	mov qword [rsp+8*92],rax
	mov rdx,  [arg+8*21]
	mov rax,rdx
	mov rdx,  [arg+8*22]
	mov rbx,rdx
	mov qword [rsp+8*95],rax
	mov qword [rsp+8*96],rbx
	mov rbx,  [arg+8*23]
	mov rax,rbx
	mov rbx,  [arg+8*24]
	mov rdx,rbx
	mov qword [rsp+8*97],rax
	mov rbx,  [arg+8*25]
	mov rax,rbx
	mov qword [rsp+8*98],rdx
	mov rdx,  [arg+8*26]
	mov r11,rdx
	mov qword [rsp+8*99],rax
	mov rax,  [arg+8*27]
	mov rbx,rax
	mov qword [rsp+8*101],rbx
	mov rbx,  [arg+8*28]
	mov rdx,rbx
	mov rbx,  [arg+8*29]
	mov rax,rbx
	mov qword [rsp+8*102],rdx
	mov rbx,  [arg+8*30]
	mov rdx,rbx
	mov qword [rsp+8*103],rax
	mov rbx,  [arg+8*31]
	mov rax,rbx
	mov qword [rsp+8*104],rdx
	mov rdx,  [rsp+8*77]
	add r12,rdx
	mov rbx,  [rsp+8*78]
	add r12,rbx
	add r12,r14
	mov qword [rsp+8*105],rax
	mov rax,  [rsp+8*80]
	add r12,rax
	mov rdx,  [rsp+8*81]
	add r12,rdx
	mov rbx,  [rsp+8*82]
	add r12,rbx
	mov rax,  [rsp+8*83]
	add r12,rax
	add r12,r10
	mov rdx,  [rsp+8*85]
	add r12,rdx
	mov rbx,  [rsp+8*86]
	add r12,rbx
	mov rax,  [rsp+8*87]
	add r12,rax
	add r12,r9
	mov rdx,  [rsp+8*89]
	add r12,rdx
	mov rbx,  [rsp+8*90]
	add r12,rbx
	mov rax,  [rsp+8*91]
	add r12,rax
	mov rdx,  [rsp+8*92]
	add r12,rdx
	add r12,r13
	add r12,r15
	mov rbx,  [rsp+8*95]
	add r12,rbx
	mov rax,  [rsp+8*96]
	add r12,rax
	mov rdx,  [rsp+8*97]
	add r12,rdx
	mov rbx,  [rsp+8*98]
	add r12,rbx
	mov rax,  [rsp+8*99]
	add r12,rax
	add r12,r11
	mov rdx,  [rsp+8*101]
	add r12,rdx
	mov rbx,  [rsp+8*102]
	add r12,rbx
	mov rax,  [rsp+8*103]
	add r12,rax
	mov rdx,  [rsp+8*104]
	add r12,rdx
	mov rbx,  [rsp+8*105]
	add r12,rbx
	xor rdx, rdx
	mov rax,  r12
	mov rbx, 100
	cdq
	idiv rbx
	mov  r12, rdx
	mov r12,r12
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
	je L_2734
	mov rbx,  [rsp+8*75]
	mov rax,rbx
	leave
	ret
	
L_2734:
	xor rdx, rdx
	mov rax, [rsp+8*74]
	mov rbx, [rsp+8*75]
	cdq
	idiv rbx
	mov [rsp+8*110], rdx
	mov rdx,  [rsp+8*105]
	mov rbx,rdx
	mov rdx,  [rsp+8*104]
	mov rax,rdx
	mov qword [arg+8*31],rbx
	mov rbx,  [rsp+8*103]
	mov rdx,rbx
	mov qword [arg+8*30],rax
	mov rax,  [rsp+8*102]
	mov rbx,rax
	mov qword [arg+8*29],rdx
	mov rdx,  [rsp+8*101]
	mov rax,rdx
	mov rdx,r11
	mov qword [arg+8*28],rbx
	mov qword [arg+8*27],rax
	mov rax,  [rsp+8*99]
	mov rbx,rax
	mov qword [arg+8*26],rdx
	mov rdx,  [rsp+8*98]
	mov rax,rdx
	mov qword [arg+8*25],rbx
	mov rbx,  [rsp+8*97]
	mov rdx,rbx
	mov qword [arg+8*24],rax
	mov rax,  [rsp+8*96]
	mov rbx,rax
	mov qword [arg+8*23],rdx
	mov rdx,  [rsp+8*95]
	mov rax,rdx
	mov rdx,r15
	mov qword [arg+8*22],rbx
	mov rbx,r13
	mov qword [arg+8*21],rax
	mov qword [arg+8*20],rdx
	mov rdx,  [rsp+8*92]
	mov rax,rdx
	mov qword [arg+8*19],rbx
	mov rbx,  [rsp+8*91]
	mov rdx,rbx
	mov qword [arg+8*18],rax
	mov rax,  [rsp+8*90]
	mov rbx,rax
	mov qword [arg+8*17],rdx
	mov rdx,  [rsp+8*89]
	mov rax,rdx
	mov rdx,r9
	mov qword [arg+8*16],rbx
	mov qword [arg+8*15],rax
	mov rax,  [rsp+8*87]
	mov rbx,rax
	mov qword [arg+8*14],rdx
	mov rdx,  [rsp+8*86]
	mov rax,rdx
	mov qword [arg+8*13],rbx
	mov rbx,  [rsp+8*85]
	mov rdx,rbx
	mov rbx,r10
	mov qword [arg+8*12],rax
	mov qword [arg+8*11],rdx
	mov rdx,  [rsp+8*83]
	mov rax,rdx
	mov qword [arg+8*10],rbx
	mov rbx,  [rsp+8*82]
	mov rdx,rbx
	mov qword [arg+8*9],rax
	mov rax,  [rsp+8*81]
	mov rbx,rax
	mov qword [arg+8*8],rdx
	mov rdx,  [rsp+8*80]
	mov rax,rdx
	mov rdx,r14
	mov qword [arg+8*7],rbx
	mov qword [arg+8*6],rax
	mov rax,  [rsp+8*78]
	mov rbx,rax
	mov qword [arg+8*5],rdx
	mov rdx,  [rsp+8*77]
	mov rax,rdx
	mov rdx,r12
	mov qword [arg+8*4],rbx
	mov rbx,  [rsp+8*110]
	mov rsi,rbx
	mov rbx,  [rsp+8*75]
	mov rdi,rbx
	mov qword [arg+8*2],rdx
	mov qword [arg+8*3],rax
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	call gcd2
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	mov r15 , rax
	mov rax,r15
	leave
	ret
	
gcd2:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1312
	mov rbx,rdi
	mov rdx,rsi
	mov rax,  [arg+8*2]
	mov r12,rax
	mov qword [rsp+8*112],rbx
	mov qword [rsp+8*113],rdx
	mov rdx,  [arg+8*3]
	mov rbx,rdx
	mov qword [rsp+8*115],rbx
	mov rbx,  [arg+8*4]
	mov rax,rbx
	mov rbx,  [arg+8*5]
	mov rdx,rbx
	mov qword [rsp+8*116],rax
	mov rax,  [arg+8*6]
	mov r13,rax
	mov qword [rsp+8*117],rdx
	mov rdx,  [arg+8*7]
	mov rbx,rdx
	mov qword [rsp+8*119],rbx
	mov rbx,  [arg+8*8]
	mov rax,rbx
	mov rbx,  [arg+8*9]
	mov rdx,rbx
	mov qword [rsp+8*120],rax
	mov rbx,  [arg+8*10]
	mov rax,rbx
	mov qword [rsp+8*121],rdx
	mov rdx,  [arg+8*11]
	mov r15,rdx
	mov qword [rsp+8*122],rax
	mov rax,  [arg+8*12]
	mov rbx,rax
	mov qword [rsp+8*124],rbx
	mov rbx,  [arg+8*13]
	mov rdx,rbx
	mov rbx,  [arg+8*14]
	mov rax,rbx
	mov qword [rsp+8*125],rdx
	mov rdx,  [arg+8*15]
	mov r10,rdx
	mov qword [rsp+8*126],rax
	mov rax,  [arg+8*16]
	mov rbx,rax
	mov qword [rsp+8*128],rbx
	mov rbx,  [arg+8*17]
	mov rdx,rbx
	mov rbx,  [arg+8*18]
	mov rax,rbx
	mov qword [rsp+8*129],rdx
	mov rdx,  [arg+8*19]
	mov r11,rdx
	mov qword [rsp+8*130],rax
	mov rax,  [arg+8*20]
	mov rbx,rax
	mov qword [rsp+8*132],rbx
	mov rbx,  [arg+8*21]
	mov rdx,rbx
	mov rbx,  [arg+8*22]
	mov rax,rbx
	mov qword [rsp+8*133],rdx
	mov rbx,  [arg+8*23]
	mov rdx,rbx
	mov qword [rsp+8*134],rax
	mov rbx,  [arg+8*24]
	mov rax,rbx
	mov qword [rsp+8*135],rdx
	mov rdx,  [arg+8*25]
	mov r14,rdx
	mov qword [rsp+8*136],rax
	mov rax,  [arg+8*26]
	mov rbx,rax
	mov qword [rsp+8*138],rbx
	mov rbx,  [arg+8*27]
	mov rdx,rbx
	mov rax,  [arg+8*28]
	mov r9,rax
	mov qword [rsp+8*139],rdx
	mov rdx,  [arg+8*29]
	mov rbx,rdx
	mov qword [rsp+8*141],rbx
	mov rbx,  [arg+8*30]
	mov rax,rbx
	mov rbx,  [arg+8*31]
	mov rdx,rbx
	mov qword [rsp+8*142],rax
	mov rax,  [rsp+8*115]
	mov rbx,r12
	add rbx,rax
	mov qword [rsp+8*143],rdx
	mov rdx,  [rsp+8*116]
	add rbx,rdx
	mov rax,  [rsp+8*117]
	add rbx,rax
	add rbx,r13
	mov rdx,  [rsp+8*119]
	add rbx,rdx
	mov rax,  [rsp+8*120]
	add rbx,rax
	mov rdx,  [rsp+8*121]
	add rbx,rdx
	mov rax,  [rsp+8*122]
	add rbx,rax
	add rbx,r15
	mov rdx,  [rsp+8*124]
	add rbx,rdx
	mov rax,  [rsp+8*125]
	add rbx,rax
	mov rdx,  [rsp+8*126]
	add rbx,rdx
	add rbx,r10
	mov rax,  [rsp+8*128]
	add rbx,rax
	mov rdx,  [rsp+8*129]
	add rbx,rdx
	mov rax,  [rsp+8*130]
	add rbx,rax
	add rbx,r11
	mov rdx,  [rsp+8*132]
	add rbx,rdx
	mov rax,  [rsp+8*133]
	add rbx,rax
	mov rdx,  [rsp+8*134]
	add rbx,rdx
	mov rax,  [rsp+8*135]
	add rbx,rax
	mov rdx,  [rsp+8*136]
	add rbx,rdx
	add rbx,r14
	mov rax,  [rsp+8*138]
	add rbx,rax
	mov rdx,  [rsp+8*139]
	add rbx,rdx
	add rbx,r9
	mov rax,  [rsp+8*141]
	add rbx,rax
	mov rdx,  [rsp+8*142]
	add rbx,rdx
	mov rax,  [rsp+8*143]
	add rbx,rax
	mov qword [rsp+8*144],rbx
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
	je L_2736
	mov rbx,  [rsp+8*113]
	mov rax,rbx
	leave
	ret
	
L_2736:
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
	mov qword [arg+8*31],rbx
	mov rbx,  [rsp+8*141]
	mov rdx,rbx
	mov rbx,r9
	mov qword [arg+8*30],rax
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
	mov qword [arg+8*24],rax
	mov rax,  [rsp+8*134]
	mov rbx,rax
	mov qword [arg+8*23],rdx
	mov rdx,  [rsp+8*133]
	mov rax,rdx
	mov qword [arg+8*22],rbx
	mov rbx,  [rsp+8*132]
	mov rdx,rbx
	mov rbx,r11
	mov qword [arg+8*21],rax
	mov qword [arg+8*20],rdx
	mov rdx,  [rsp+8*130]
	mov rax,rdx
	mov qword [arg+8*19],rbx
	mov rbx,  [rsp+8*129]
	mov rdx,rbx
	mov qword [arg+8*18],rax
	mov rax,  [rsp+8*128]
	mov rbx,rax
	mov rax,r10
	mov qword [arg+8*17],rdx
	mov qword [arg+8*16],rbx
	mov rbx,  [rsp+8*126]
	mov rdx,rbx
	mov qword [arg+8*15],rax
	mov rax,  [rsp+8*125]
	mov rbx,rax
	mov qword [arg+8*14],rdx
	mov rdx,  [rsp+8*124]
	mov rax,rdx
	mov rdx,r15
	mov qword [arg+8*13],rbx
	mov qword [arg+8*12],rax
	mov rax,  [rsp+8*122]
	mov rbx,rax
	mov qword [arg+8*11],rdx
	mov rdx,  [rsp+8*121]
	mov rax,rdx
	mov qword [arg+8*10],rbx
	mov rbx,  [rsp+8*120]
	mov rdx,rbx
	mov qword [arg+8*9],rax
	mov rax,  [rsp+8*119]
	mov rbx,rax
	mov rax,r13
	mov qword [arg+8*8],rdx
	mov qword [arg+8*7],rbx
	mov rbx,  [rsp+8*117]
	mov rdx,rbx
	mov qword [arg+8*6],rax
	mov rax,  [rsp+8*116]
	mov rbx,rax
	mov qword [arg+8*5],rdx
	mov rdx,  [rsp+8*115]
	mov rax,rdx
	mov rdx,r12
	mov qword [arg+8*4],rbx
	mov rbx,  [rsp+8*148]
	mov rsi,rbx
	mov rbx,  [rsp+8*113]
	mov rdi,rbx
	mov qword [arg+8*2],rdx
	mov qword [arg+8*3],rax
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	call gcd
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	mov r15 , rax
	mov rax,r15
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
        mov     edx, dword 936870912
        movsxd  rdx, edx
        sub     rdx, 3296
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
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	call gcd
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	mov r15 , rax
	mov rbx,1024
	add r15,rbx
	mov rdi,r15
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

