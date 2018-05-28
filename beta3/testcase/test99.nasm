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
	sub    rsp, 720
	mov     rax, 936870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 936870912
        movsxd  rdx, edx
        sub     rdx, 2704
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rdx,14
	mov rbx,rdx
	mov rdx,0
	mov rax,rdx
	mov rdx,0
	mov r11,rdx
	mov qword [rsp+8*2],rbx
	mov qword [rsp+8*3],rax
	
L_2617:
	mov rbx,  [rsp+8*2]
	cmp r11,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2618
	mov rbx,0
	mov r10,rbx
	
L_2620:
	mov rbx,  [rsp+8*2]
	cmp r10,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2621
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*8],rbx
	
L_2623:
	mov rbx,  [rsp+8*8]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2624
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*10],rbx
	
L_2626:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2627
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*12],rbx
	
L_2629:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2630
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_2632:
	mov rbx,  [rsp+8*14]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2633
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*16],rbx
	
L_2635:
	mov rbx,  [rsp+8*16]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2636
	cmp r11,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_2638
	mov rbx,0
	mov r15,rbx
	jmp L_2639
	
L_2638:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2639:
	cmp r15, 0
	je L_2644
	mov rbx,1
	mov r15,rbx
	jmp L_2645
	
L_2644:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_2640
	mov rbx,0
	mov r15,rbx
	jmp L_2641
	
L_2640:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2641:
	cmp r15, 0
	jne L_2642
	mov rbx,0
	mov r15,rbx
	jmp L_2643
	
L_2642:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2643:
	mov r15,r15
	
L_2645:
	cmp r15, 0
	je L_2646
	mov rbx,1
	mov r15,rbx
	jmp L_2647
	
L_2646:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_2647:
	cmp r15, 0
	je L_2650
	mov rbx,1
	mov r15,rbx
	jmp L_2651
	
L_2650:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_2648
	mov rbx,0
	mov r15,rbx
	jmp L_2649
	
L_2648:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2649:
	mov r15,r15
	
L_2651:
	mov r13,r15
	cmp r11,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_2652
	mov rbx,0
	mov r15,rbx
	jmp L_2653
	
L_2652:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2653:
	cmp r15, 0
	je L_2658
	mov rbx,1
	mov r15,rbx
	jmp L_2659
	
L_2658:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_2654
	mov rbx,0
	mov r15,rbx
	jmp L_2655
	
L_2654:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2655:
	cmp r15, 0
	jne L_2656
	mov rbx,0
	mov r15,rbx
	jmp L_2657
	
L_2656:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2657:
	mov r15,r15
	
L_2659:
	cmp r15, 0
	je L_2660
	mov rbx,1
	mov r15,rbx
	jmp L_2661
	
L_2660:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_2661:
	cmp r15, 0
	je L_2664
	mov rbx,1
	mov r15,rbx
	jmp L_2665
	
L_2664:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_2662
	mov rbx,0
	mov r15,rbx
	jmp L_2663
	
L_2662:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2663:
	mov r15,r15
	
L_2665:
	mov r12,r15
	cmp r11,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_2666
	mov rbx,0
	mov r15,rbx
	jmp L_2667
	
L_2666:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2667:
	cmp r15, 0
	je L_2672
	mov rbx,1
	mov r15,rbx
	jmp L_2673
	
L_2672:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_2668
	mov rbx,0
	mov r15,rbx
	jmp L_2669
	
L_2668:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2669:
	cmp r15, 0
	jne L_2670
	mov rbx,0
	mov r15,rbx
	jmp L_2671
	
L_2670:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2671:
	mov r15,r15
	
L_2673:
	cmp r15, 0
	je L_2674
	mov rbx,1
	mov r15,rbx
	jmp L_2675
	
L_2674:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_2675:
	cmp r15, 0
	je L_2678
	mov rbx,1
	mov r15,rbx
	jmp L_2679
	
L_2678:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_2676
	mov rbx,0
	mov r15,rbx
	jmp L_2677
	
L_2676:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2677:
	mov r15,r15
	
L_2679:
	mov rbx,r15
	cmp r11,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*44],rbx
	jne L_2680
	mov rbx,0
	mov r15,rbx
	jmp L_2681
	
L_2680:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2681:
	cmp r15, 0
	je L_2686
	mov rbx,1
	mov r15,rbx
	jmp L_2687
	
L_2686:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_2682
	mov rbx,0
	mov r15,rbx
	jmp L_2683
	
L_2682:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2683:
	cmp r15, 0
	jne L_2684
	mov rbx,0
	mov r15,rbx
	jmp L_2685
	
L_2684:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2685:
	mov r15,r15
	
L_2687:
	cmp r15, 0
	je L_2688
	mov rbx,1
	mov r15,rbx
	jmp L_2689
	
L_2688:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_2689:
	cmp r15, 0
	je L_2692
	mov rbx,1
	mov r15,rbx
	jmp L_2693
	
L_2692:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_2690
	mov rbx,0
	mov r15,rbx
	jmp L_2691
	
L_2690:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2691:
	mov r15,r15
	
L_2693:
	mov r15,r15
	cmp r11,r10
	mov r14, 0
	sete r14B
	cmp r14, 0
	jne L_2694
	mov rbx,0
	mov r14,rbx
	jmp L_2695
	
L_2694:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2695:
	cmp r14, 0
	je L_2700
	mov rbx,1
	mov r14,rbx
	jmp L_2701
	
L_2700:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r14, 0
	sete r14B
	cmp r14, 0
	jne L_2696
	mov rbx,0
	mov r14,rbx
	jmp L_2697
	
L_2696:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2697:
	cmp r14, 0
	jne L_2698
	mov rbx,0
	mov r14,rbx
	jmp L_2699
	
L_2698:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2699:
	mov r14,r14
	
L_2701:
	cmp r14, 0
	je L_2702
	mov rbx,1
	mov r14,rbx
	jmp L_2703
	
L_2702:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov r14, 0
	sete r14B
	mov r14,r14
	
L_2703:
	cmp r14, 0
	je L_2706
	mov rbx,1
	mov r14,rbx
	jmp L_2707
	
L_2706:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r14, 0
	setg r14B
	cmp r14, 0
	jne L_2704
	mov rbx,0
	mov r14,rbx
	jmp L_2705
	
L_2704:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2705:
	mov r14,r14
	
L_2707:
	mov rbx,r14
	cmp r11,r10
	mov r14, 0
	sete r14B
	cmp r14, 0
	mov qword [rsp+8*62],rbx
	jne L_2708
	mov rbx,0
	mov r14,rbx
	jmp L_2709
	
L_2708:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2709:
	cmp r14, 0
	je L_2714
	mov rbx,1
	mov r14,rbx
	jmp L_2715
	
L_2714:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r14, 0
	sete r14B
	cmp r14, 0
	jne L_2710
	mov rbx,0
	mov r14,rbx
	jmp L_2711
	
L_2710:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2711:
	cmp r14, 0
	jne L_2712
	mov rbx,0
	mov r14,rbx
	jmp L_2713
	
L_2712:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2713:
	mov r14,r14
	
L_2715:
	cmp r14, 0
	je L_2716
	mov rbx,1
	mov r14,rbx
	jmp L_2717
	
L_2716:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov r14, 0
	sete r14B
	mov r14,r14
	
L_2717:
	cmp r14, 0
	je L_2720
	mov rbx,1
	mov r14,rbx
	jmp L_2721
	
L_2720:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r14, 0
	setg r14B
	cmp r14, 0
	jne L_2718
	mov rbx,0
	mov r14,rbx
	jmp L_2719
	
L_2718:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2719:
	mov r14,r14
	
L_2721:
	mov r14,r14
	cmp r13, 0
	je L_2723
	mov rbx,  [rsp+8*3]
	mov r13,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_2723:
	cmp r12, 0
	je L_2725
	mov rbx,  [rsp+8*3]
	mov r13,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_2725:
	mov rbx,  [rsp+8*44]
	cmp rbx, 0
	je L_2727
	mov rbx,  [rsp+8*3]
	mov r13,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_2727:
	cmp r15, 0
	je L_2729
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_2729:
	mov rbx,  [rsp+8*62]
	cmp rbx, 0
	je L_2731
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_2731:
	cmp r14, 0
	je L_2733
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_2733:
	mov rbx,  [rsp+8*16]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*16],rbx
	jmp L_2635
	
L_2636:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*14],rbx
	jmp L_2632
	
L_2633:
	mov rbx,  [rsp+8*12]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*12],rbx
	jmp L_2629
	
L_2630:
	mov rbx,  [rsp+8*10]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*10],rbx
	jmp L_2626
	
L_2627:
	mov rbx,  [rsp+8*8]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*8],rbx
	jmp L_2623
	
L_2624:
	mov rbx,1
	add r10,rbx
	jmp L_2620
	
L_2621:
	mov rbx,1
	add r11,rbx
	jmp L_2617
	
L_2618:
	mov rbx,  [rsp+8*3]
	mov rdi,rbx
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
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 720
	mov rbx,  [rsp+8*82]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   2704
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

