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
        mov     edx, dword 936870912
        movsxd  rdx, edx
        sub     rdx, 4328
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	call global_init
	mov rbx , rax
	mov rax,102
	mov rdx,rax
	mov qword [rsp+8*1],rbx
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*2],rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*3],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*4],rax
	mov rax,0
	mov rbx,rax
	mov rax,  [rsp+8*2]
	mov qword [rsp+8*5],rdx
	mov rdx,1
	mov qword [rsp+8*6],rbx
	mov rbx,rax
	sub rbx,rdx
	mov rdx,rbx
	mov rbx,1
	mov qword [rsp+8*8],rdx
	mov rdx,rax
	sub rdx,rbx
	mov rbx,rdx
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*10],rbx
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*11],rdx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*12],rax
	mov rax,0
	mov rdx,rax
	mov rax,  [rsp+8*2]
	mov qword [rsp+8*13],rbx
	mov rbx,rax
	imul rbx,rax
	mov qword [rsp+8*15],rbx
	mov qword [rsp+8*14],rdx
	mov     rdi, [rsp+8*15]
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
	mov     qword [rsp+8*16], rax
	mov rdx,  [rsp+8*16]
	mov rbx,rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*17],rbx
	mov qword [rsp+8*18],rax
	
L_1165:
	mov rbx,  [rsp+8*2]
	mov rdx,rbx
	imul rdx,rbx
	mov rax,  [rsp+8*18]
	cmp rax,rdx
	mov rdx, 0
	setl dl
	mov rbx,  [rsp+8*20]
	add rbx,rbx
	cmp rdx, 0
	mov qword [rsp+8*20],rbx
	mov qword [rsp+8*19],rdx
	je L_1166
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*18]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*21],rbx
	mov rbx,0
	mov [rdx],rbx
	mov rbx,rax
	mov qword [rsp+8*23],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*22],rdx
	mov qword [rsp+8*18],rax
	jmp L_1165
	
L_1166:
	mov rbx,  [rsp+8*2]
	mov rdx,rbx
	imul rdx,rbx
	mov qword [rsp+8*24],rdx
	mov     rdi, [rsp+8*24]
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
	mov     qword [rsp+8*25], rax
	mov rdx,  [rsp+8*25]
	mov rbx,rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*26],rbx
	mov qword [rsp+8*18],rax
	
L_1168:
	mov rbx,  [rsp+8*2]
	mov rdx,rbx
	imul rdx,rbx
	mov rax,  [rsp+8*18]
	cmp rax,rdx
	mov rdx, 0
	setl dl
	mov rbx,  [rsp+8*20]
	add rbx,rbx
	cmp rdx, 0
	mov qword [rsp+8*20],rbx
	mov qword [rsp+8*27],rdx
	je L_1169
	mov rdx,  [rsp+8*26]
	mov rbx,rdx
	mov rax,  [rsp+8*18]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*28],rbx
	mov rbx,0
	mov [rdx],rbx
	mov rbx,rax
	mov qword [rsp+8*30],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*29],rdx
	mov qword [rsp+8*18],rax
	jmp L_1168
	
L_1169:
	mov     rdi, [rsp+8*2]
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
	mov     qword [rsp+8*31], rax
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*32],rbx
	mov qword [rsp+8*18],rax
	
L_1171:
	mov rbx,  [rsp+8*18]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*33],rax
	je L_1172
	mov     rdi, [rsp+8*2]
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
	
L_1174:
	mov rbx,  [rsp+8*37]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*38],rax
	je L_1175
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
	jmp L_1174
	
L_1175:
	mov rdx,  [rsp+8*18]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*43],rbx
	mov qword [rsp+8*18],rdx
	jmp L_1171
	
L_1172:
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*44],rbx
	mov rbx,  [rsp+8*5]
	mov [rdx],rbx
	mov qword [rsp+8*45],rdx
	mov rax,  [rsp+8*26]
	mov rdx,rax
	mov rbx,0
	lea rax,[rdx+rbx*8+8H]
	mov rbx,  [rsp+8*6]
	mov [rax],rbx
	mov qword [rsp+8*46],rdx
	mov qword [rsp+8*47],rax
	mov rax,  [rsp+8*32]
	mov rdx,rax
	mov rbx,  [rsp+8*5]
	lea rax,[rdx+rbx*8+8H]
	mov rdx, [rax]
	mov rbx,  [rsp+8*6]
	lea rax,[rdx+rbx*8+8H]
	mov rbx,0
	mov [rax],rbx
	mov qword [rsp+8*48],rdx
	mov qword [rsp+8*49],rax
	
L_1177:
	mov rbx,  [rsp+8*3]
	mov rdx,  [rsp+8*4]
	cmp rbx,rdx
	mov rax, 0
	setle al
	cmp rax, 0
	mov qword [rsp+8*50],rax
	je L_1178
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*3]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*51],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*52],rdx
	mov rax,  [rsp+8*26]
	mov rdx,rax
	mov qword [rsp+8*53],rbx
	mov rbx,  [rsp+8*3]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*54],rdx
	mov rdx, [rax]
	mov qword [rsp+8*55],rax
	mov rbx,  [rsp+8*32]
	mov rax,rbx
	mov qword [rsp+8*56],rdx
	mov rdx,  [rsp+8*53]
	lea rbx,[rax+rdx*8+8H]
	mov rax, [rbx]
	mov rdx,  [rsp+8*56]
	lea rbx,[rax+rdx*8+8H]
	mov rdx, [rbx]
	mov qword [rsp+8*58],rbx
	mov rbx,rdx
	mov qword [rsp+8*59],rdx
	mov qword [rsp+8*57],rax
	mov rax,  [rsp+8*17]
	mov rdx,rax
	mov qword [rsp+8*13],rbx
	mov rbx,  [rsp+8*3]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*60],rdx
	mov rdx, [rax]
	mov qword [rsp+8*61],rax
	mov rax,1
	mov rbx,rdx
	sub rbx,rax
	mov qword [rsp+8*62],rdx
	mov rdx,rbx
	mov rax,  [rsp+8*26]
	mov rbx,rax
	mov qword [rsp+8*11],rdx
	mov rdx,  [rsp+8*3]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*64],rbx
	mov rbx, [rax]
	mov qword [rsp+8*65],rax
	mov rax,2
	mov rdx,rbx
	sub rdx,rax
	mov qword [rsp+8*66],rbx
	mov rbx,rdx
	mov rdx,  [rsp+8*2]
	mov rsi,rdx
	mov rax,  [rsp+8*11]
	mov rdi,rax
	mov qword [rsp+8*12],rbx
	mov rbx,rdi
	mov rdx,rsi
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*70],rbx
	mov qword [rsp+8*71],rdx
	mov qword [rsp+8*72],rax
	jne L_1267
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1268
	
L_1267:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1268:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*75],rax
	jne L_1179
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*76],rbx
	jmp L_1180
	
L_1179:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	cmp rax,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*72],rdx
	mov qword [rsp+8*70],rax
	jne L_1271
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1272
	
L_1271:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1272:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*76],rdx
	mov qword [rsp+8*77],rax
	
L_1180:
	mov rbx,  [rsp+8*76]
	cmp rbx, 0
	je L_1182
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
	je L_1184
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rax,  [rsp+8*17]
	mov rdx,rax
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*84],rdx
	mov rdx,  [rsp+8*11]
	mov [rax],rdx
	mov qword [rsp+8*85],rax
	mov qword [rsp+8*4],rbx
	mov rbx,  [rsp+8*26]
	mov rax,rbx
	mov rdx,  [rsp+8*4]
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*86],rax
	mov rax,  [rsp+8*12]
	mov [rbx],rax
	mov qword [rsp+8*87],rbx
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,  [rsp+8*32]
	mov rdx,rbx
	mov qword [rsp+8*88],rax
	mov rax,  [rsp+8*11]
	lea rbx,[rdx+rax*8+8H]
	mov rdx, [rbx]
	mov rax,  [rsp+8*12]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*89],rdx
	mov rdx,  [rsp+8*88]
	mov [rbx],rdx
	mov qword [rsp+8*90],rbx
	mov rbx,  [rsp+8*11]
	mov rdx,  [rsp+8*8]
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*91],rax
	jne L_1185
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*91],rbx
	jmp L_1186
	
L_1185:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*91],rbx
	mov qword [rsp+8*92],rax
	
L_1186:
	mov rbx,  [rsp+8*91]
	cmp rbx, 0
	je L_1188
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1188:
	
L_1184:
	
L_1182:
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
	mov qword [rsp+8*95],rbx
	mov rbx,rax
	mov rax,  [rsp+8*26]
	mov rdx,rax
	mov qword [rsp+8*11],rbx
	mov rbx,  [rsp+8*3]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*97],rdx
	mov rdx, [rax]
	mov qword [rsp+8*98],rax
	mov rax,2
	mov rbx,rdx
	add rbx,rax
	mov qword [rsp+8*99],rdx
	mov rdx,rbx
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rax,  [rsp+8*11]
	mov rdi,rax
	mov qword [rsp+8*12],rdx
	mov rdx,rdi
	mov rbx,rsi
	cmp rdx,rbx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*72],rax
	jne L_1275
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1276
	
L_1275:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1276:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*101],rax
	jne L_1189
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*102],rbx
	jmp L_1190
	
L_1189:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	cmp rax,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*72],rdx
	mov qword [rsp+8*70],rax
	jne L_1279
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1280
	
L_1279:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1280:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*102],rdx
	mov qword [rsp+8*103],rax
	
L_1190:
	mov rbx,  [rsp+8*102]
	cmp rbx, 0
	je L_1192
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
	je L_1194
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rax,  [rsp+8*17]
	mov rdx,rax
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*110],rdx
	mov rdx,  [rsp+8*11]
	mov [rax],rdx
	mov qword [rsp+8*111],rax
	mov qword [rsp+8*4],rbx
	mov rbx,  [rsp+8*26]
	mov rax,rbx
	mov rdx,  [rsp+8*4]
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*112],rax
	mov rax,  [rsp+8*12]
	mov [rbx],rax
	mov qword [rsp+8*113],rbx
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,  [rsp+8*32]
	mov rdx,rbx
	mov qword [rsp+8*114],rax
	mov rax,  [rsp+8*11]
	lea rbx,[rdx+rax*8+8H]
	mov rdx, [rbx]
	mov rax,  [rsp+8*12]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*115],rdx
	mov rdx,  [rsp+8*114]
	mov [rbx],rdx
	mov qword [rsp+8*116],rbx
	mov rbx,  [rsp+8*11]
	mov rdx,  [rsp+8*8]
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*117],rax
	jne L_1195
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*117],rbx
	jmp L_1196
	
L_1195:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*117],rbx
	mov qword [rsp+8*118],rax
	
L_1196:
	mov rbx,  [rsp+8*117]
	cmp rbx, 0
	je L_1198
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1198:
	
L_1194:
	
L_1192:
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*3]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*119],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*120],rdx
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov qword [rsp+8*121],rbx
	mov rbx,rax
	mov rax,  [rsp+8*26]
	mov rdx,rax
	mov qword [rsp+8*11],rbx
	mov rbx,  [rsp+8*3]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*123],rdx
	mov rdx, [rax]
	mov qword [rsp+8*124],rax
	mov rax,2
	mov rbx,rdx
	sub rbx,rax
	mov qword [rsp+8*125],rdx
	mov rdx,rbx
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rax,  [rsp+8*11]
	mov rdi,rax
	mov qword [rsp+8*12],rdx
	mov rdx,rdi
	mov rbx,rsi
	cmp rdx,rbx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*72],rax
	jne L_1283
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1284
	
L_1283:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1284:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*127],rax
	jne L_1199
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*128],rbx
	jmp L_1200
	
L_1199:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	cmp rax,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*72],rdx
	mov qword [rsp+8*70],rax
	jne L_1287
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1288
	
L_1287:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1288:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*128],rdx
	mov qword [rsp+8*129],rax
	
L_1200:
	mov rbx,  [rsp+8*128]
	cmp rbx, 0
	je L_1202
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
	je L_1204
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rax,  [rsp+8*17]
	mov rdx,rax
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*136],rdx
	mov rdx,  [rsp+8*11]
	mov [rax],rdx
	mov qword [rsp+8*137],rax
	mov qword [rsp+8*4],rbx
	mov rbx,  [rsp+8*26]
	mov rax,rbx
	mov rdx,  [rsp+8*4]
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*138],rax
	mov rax,  [rsp+8*12]
	mov [rbx],rax
	mov qword [rsp+8*139],rbx
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,  [rsp+8*32]
	mov rdx,rbx
	mov qword [rsp+8*140],rax
	mov rax,  [rsp+8*11]
	lea rbx,[rdx+rax*8+8H]
	mov rdx, [rbx]
	mov rax,  [rsp+8*12]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*141],rdx
	mov rdx,  [rsp+8*140]
	mov [rbx],rdx
	mov qword [rsp+8*142],rbx
	mov rbx,  [rsp+8*11]
	mov rdx,  [rsp+8*8]
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*143],rax
	jne L_1205
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*143],rbx
	jmp L_1206
	
L_1205:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*143],rbx
	mov qword [rsp+8*144],rax
	
L_1206:
	mov rbx,  [rsp+8*143]
	cmp rbx, 0
	je L_1208
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1208:
	
L_1204:
	
L_1202:
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*3]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*145],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*146],rdx
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov qword [rsp+8*147],rbx
	mov rbx,rax
	mov rax,  [rsp+8*26]
	mov rdx,rax
	mov qword [rsp+8*11],rbx
	mov rbx,  [rsp+8*3]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*149],rdx
	mov rdx, [rax]
	mov qword [rsp+8*150],rax
	mov rax,2
	mov rbx,rdx
	add rbx,rax
	mov qword [rsp+8*151],rdx
	mov rdx,rbx
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rax,  [rsp+8*11]
	mov rdi,rax
	mov qword [rsp+8*12],rdx
	mov rdx,rdi
	mov rbx,rsi
	cmp rdx,rbx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*72],rax
	jne L_1291
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1292
	
L_1291:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1292:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*153],rax
	jne L_1209
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*154],rbx
	jmp L_1210
	
L_1209:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	cmp rax,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*72],rdx
	mov qword [rsp+8*70],rax
	jne L_1295
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1296
	
L_1295:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1296:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*154],rdx
	mov qword [rsp+8*155],rax
	
L_1210:
	mov rbx,  [rsp+8*154]
	cmp rbx, 0
	je L_1212
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
	je L_1214
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rax,  [rsp+8*17]
	mov rdx,rax
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*162],rdx
	mov rdx,  [rsp+8*11]
	mov [rax],rdx
	mov qword [rsp+8*163],rax
	mov qword [rsp+8*4],rbx
	mov rbx,  [rsp+8*26]
	mov rax,rbx
	mov rdx,  [rsp+8*4]
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*164],rax
	mov rax,  [rsp+8*12]
	mov [rbx],rax
	mov qword [rsp+8*165],rbx
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,  [rsp+8*32]
	mov rdx,rbx
	mov qword [rsp+8*166],rax
	mov rax,  [rsp+8*11]
	lea rbx,[rdx+rax*8+8H]
	mov rdx, [rbx]
	mov rax,  [rsp+8*12]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*167],rdx
	mov rdx,  [rsp+8*166]
	mov [rbx],rdx
	mov qword [rsp+8*168],rbx
	mov rbx,  [rsp+8*11]
	mov rdx,  [rsp+8*8]
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*169],rax
	jne L_1215
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*169],rbx
	jmp L_1216
	
L_1215:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*169],rbx
	mov qword [rsp+8*170],rax
	
L_1216:
	mov rbx,  [rsp+8*169]
	cmp rbx, 0
	je L_1218
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1218:
	
L_1214:
	
L_1212:
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*3]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*171],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*172],rdx
	mov rdx,2
	mov rax,rbx
	sub rax,rdx
	mov qword [rsp+8*173],rbx
	mov rbx,rax
	mov rax,  [rsp+8*26]
	mov rdx,rax
	mov qword [rsp+8*11],rbx
	mov rbx,  [rsp+8*3]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*175],rdx
	mov rdx, [rax]
	mov qword [rsp+8*176],rax
	mov rax,1
	mov rbx,rdx
	sub rbx,rax
	mov qword [rsp+8*177],rdx
	mov rdx,rbx
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rax,  [rsp+8*11]
	mov rdi,rax
	mov qword [rsp+8*12],rdx
	mov rdx,rdi
	mov rbx,rsi
	cmp rdx,rbx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*72],rax
	jne L_1299
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1300
	
L_1299:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1300:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*179],rax
	jne L_1219
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*180],rbx
	jmp L_1220
	
L_1219:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	cmp rax,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*72],rdx
	mov qword [rsp+8*70],rax
	jne L_1303
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1304
	
L_1303:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1304:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*180],rdx
	mov qword [rsp+8*181],rax
	
L_1220:
	mov rbx,  [rsp+8*180]
	cmp rbx, 0
	je L_1222
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
	je L_1224
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rax,  [rsp+8*17]
	mov rdx,rax
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*188],rdx
	mov rdx,  [rsp+8*11]
	mov [rax],rdx
	mov qword [rsp+8*189],rax
	mov qword [rsp+8*4],rbx
	mov rbx,  [rsp+8*26]
	mov rax,rbx
	mov rdx,  [rsp+8*4]
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*190],rax
	mov rax,  [rsp+8*12]
	mov [rbx],rax
	mov qword [rsp+8*191],rbx
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,  [rsp+8*32]
	mov rdx,rbx
	mov qword [rsp+8*192],rax
	mov rax,  [rsp+8*11]
	lea rbx,[rdx+rax*8+8H]
	mov rdx, [rbx]
	mov rax,  [rsp+8*12]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*193],rdx
	mov rdx,  [rsp+8*192]
	mov [rbx],rdx
	mov qword [rsp+8*194],rbx
	mov rbx,  [rsp+8*11]
	mov rdx,  [rsp+8*8]
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*195],rax
	jne L_1225
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*195],rbx
	jmp L_1226
	
L_1225:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*195],rbx
	mov qword [rsp+8*196],rax
	
L_1226:
	mov rbx,  [rsp+8*195]
	cmp rbx, 0
	je L_1228
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1228:
	
L_1224:
	
L_1222:
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*3]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*197],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*198],rdx
	mov rdx,2
	mov rax,rbx
	sub rax,rdx
	mov qword [rsp+8*199],rbx
	mov rbx,rax
	mov rax,  [rsp+8*26]
	mov rdx,rax
	mov qword [rsp+8*11],rbx
	mov rbx,  [rsp+8*3]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*201],rdx
	mov rdx, [rax]
	mov qword [rsp+8*202],rax
	mov rax,1
	mov rbx,rdx
	add rbx,rax
	mov qword [rsp+8*203],rdx
	mov rdx,rbx
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rax,  [rsp+8*11]
	mov rdi,rax
	mov qword [rsp+8*12],rdx
	mov rdx,rdi
	mov rbx,rsi
	cmp rdx,rbx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*72],rax
	jne L_1307
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1308
	
L_1307:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1308:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*205],rax
	jne L_1229
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*206],rbx
	jmp L_1230
	
L_1229:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	cmp rax,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*72],rdx
	mov qword [rsp+8*70],rax
	jne L_1311
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1312
	
L_1311:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1312:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*206],rdx
	mov qword [rsp+8*207],rax
	
L_1230:
	mov rbx,  [rsp+8*206]
	cmp rbx, 0
	je L_1232
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
	je L_1234
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rax,  [rsp+8*17]
	mov rdx,rax
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*214],rdx
	mov rdx,  [rsp+8*11]
	mov [rax],rdx
	mov qword [rsp+8*215],rax
	mov qword [rsp+8*4],rbx
	mov rbx,  [rsp+8*26]
	mov rax,rbx
	mov rdx,  [rsp+8*4]
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*216],rax
	mov rax,  [rsp+8*12]
	mov [rbx],rax
	mov qword [rsp+8*217],rbx
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,  [rsp+8*32]
	mov rdx,rbx
	mov qword [rsp+8*218],rax
	mov rax,  [rsp+8*11]
	lea rbx,[rdx+rax*8+8H]
	mov rdx, [rbx]
	mov rax,  [rsp+8*12]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*219],rdx
	mov rdx,  [rsp+8*218]
	mov [rbx],rdx
	mov qword [rsp+8*220],rbx
	mov rbx,  [rsp+8*11]
	mov rdx,  [rsp+8*8]
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*221],rax
	jne L_1235
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*221],rbx
	jmp L_1236
	
L_1235:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*221],rbx
	mov qword [rsp+8*222],rax
	
L_1236:
	mov rbx,  [rsp+8*221]
	cmp rbx, 0
	je L_1238
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1238:
	
L_1234:
	
L_1232:
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*3]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*223],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*224],rdx
	mov rdx,2
	mov rax,rbx
	add rax,rdx
	mov qword [rsp+8*225],rbx
	mov rbx,rax
	mov rax,  [rsp+8*26]
	mov rdx,rax
	mov qword [rsp+8*11],rbx
	mov rbx,  [rsp+8*3]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*227],rdx
	mov rdx, [rax]
	mov qword [rsp+8*228],rax
	mov rax,1
	mov rbx,rdx
	sub rbx,rax
	mov qword [rsp+8*229],rdx
	mov rdx,rbx
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rax,  [rsp+8*11]
	mov rdi,rax
	mov qword [rsp+8*12],rdx
	mov rdx,rdi
	mov rbx,rsi
	cmp rdx,rbx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*72],rax
	jne L_1315
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1316
	
L_1315:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1316:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*231],rax
	jne L_1239
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*232],rbx
	jmp L_1240
	
L_1239:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	cmp rax,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*72],rdx
	mov qword [rsp+8*70],rax
	jne L_1319
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1320
	
L_1319:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1320:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov rdx,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*232],rdx
	mov qword [rsp+8*233],rax
	
L_1240:
	mov rbx,  [rsp+8*232]
	cmp rbx, 0
	je L_1242
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
	je L_1244
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rax,  [rsp+8*17]
	mov rdx,rax
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*240],rdx
	mov rdx,  [rsp+8*11]
	mov [rax],rdx
	mov qword [rsp+8*241],rax
	mov qword [rsp+8*4],rbx
	mov rbx,  [rsp+8*26]
	mov rax,rbx
	mov rdx,  [rsp+8*4]
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*242],rax
	mov rax,  [rsp+8*12]
	mov [rbx],rax
	mov qword [rsp+8*243],rbx
	mov rbx,  [rsp+8*13]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,  [rsp+8*32]
	mov rdx,rbx
	mov qword [rsp+8*244],rax
	mov rax,  [rsp+8*11]
	lea rbx,[rdx+rax*8+8H]
	mov rdx, [rbx]
	mov rax,  [rsp+8*12]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*245],rdx
	mov rdx,  [rsp+8*244]
	mov [rbx],rdx
	mov qword [rsp+8*246],rbx
	mov rbx,  [rsp+8*11]
	mov rdx,  [rsp+8*8]
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*247],rax
	jne L_1245
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*247],rbx
	jmp L_1246
	
L_1245:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*247],rbx
	mov qword [rsp+8*248],rax
	
L_1246:
	mov rbx,  [rsp+8*247]
	cmp rbx, 0
	je L_1248
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1248:
	
L_1244:
	
L_1242:
	mov rdx,  [rsp+8*17]
	mov rbx,rdx
	mov rax,  [rsp+8*3]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*249],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*250],rdx
	mov rdx,2
	mov rax,rbx
	add rax,rdx
	mov qword [rsp+8*251],rbx
	mov rbx,rax
	mov rax,  [rsp+8*26]
	mov rdx,rax
	mov qword [rsp+8*11],rbx
	mov rbx,  [rsp+8*3]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*253],rdx
	mov rdx, [rax]
	mov qword [rsp+8*254],rax
	mov rax,1
	mov rbx,rdx
	add rbx,rax
	mov qword [rsp+8*255],rdx
	mov rdx,rbx
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rax,  [rsp+8*11]
	mov rdi,rax
	mov qword [rsp+8*12],rdx
	mov rdx,rdi
	mov rbx,rsi
	cmp rdx,rbx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*72],rax
	jne L_1323
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1324
	
L_1323:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1324:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	cmp rax, 0
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*257],rax
	jne L_1249
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*258],rbx
	jmp L_1250
	
L_1249:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov rax,rdi
	mov rbx,rsi
	cmp rax,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*71],rbx
	mov qword [rsp+8*72],rdx
	mov qword [rsp+8*70],rax
	jne L_1327
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*72],rbx
	jmp L_1328
	
L_1327:
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*73],rax
	
L_1328:
	mov rdx,  [rsp+8*72]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*74],rbx
	mov rbx,rax
	mov qword [rsp+8*258],rbx
	mov qword [rsp+8*259],rax
	
L_1250:
	mov rbx,  [rsp+8*258]
	cmp rbx, 0
	je L_1252
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
	je L_1254
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rax,  [rsp+8*17]
	mov rdx,rax
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*266],rdx
	mov rdx,  [rsp+8*11]
	mov [rax],rdx
	mov qword [rsp+8*267],rax
	mov qword [rsp+8*4],rbx
	mov rbx,  [rsp+8*26]
	mov rax,rbx
	mov rbx,  [rsp+8*4]
	lea rdx,[rax+rbx*8+8H]
	mov rbx,  [rsp+8*12]
	mov [rdx],rbx
	mov qword [rsp+8*269],rdx
	mov rdx,  [rsp+8*13]
	mov qword [rsp+8*268],rax
	mov rax,1
	mov rbx,rdx
	add rbx,rax
	mov rax,  [rsp+8*32]
	mov rdx,rax
	mov qword [rsp+8*270],rbx
	mov rbx,  [rsp+8*11]
	lea rax,[rdx+rbx*8+8H]
	mov rdx, [rax]
	mov rbx,  [rsp+8*12]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*271],rdx
	mov rdx,  [rsp+8*270]
	mov [rax],rdx
	mov rdx,  [rsp+8*11]
	mov qword [rsp+8*272],rax
	mov rax,  [rsp+8*8]
	cmp rdx,rax
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*273],rbx
	jne L_1255
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*273],rbx
	jmp L_1256
	
L_1255:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*273],rbx
	mov qword [rsp+8*274],rax
	
L_1256:
	mov rbx,  [rsp+8*273]
	cmp rbx, 0
	je L_1258
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1258:
	
L_1254:
	
L_1252:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*275],rax
	je L_1260
	jmp L_1178
	
L_1260:
	mov rbx,  [rsp+8*3]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [rsp+8*3],rbx
	mov qword [rsp+8*276],rax
	jmp L_1177
	
L_1178:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*277],rax
	je L_1261
	mov rdx,  [rsp+8*32]
	mov rbx,rdx
	mov rax,  [rsp+8*8]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*10]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*278],rbx
	mov rbx, [rdx]
	mov rdi,rbx
	mov qword [rsp+8*280],rbx
	mov rbx,rdi
	mov qword [rsp+8*281],rbx
	mov qword [rsp+8*279],rdx
	mov     rdi, [rsp+8*281]
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
	mov     qword[rsp+8*282], rax
	mov rbx,  [rsp+8*282]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*283],rdx
	mov rdi,[rsp+8*283] 
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
	jmp L_1262
	
L_1261:
	mov rbx,t442
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*284],rdx
	mov rdi,[rsp+8*284] 
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
	
L_1262:
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

