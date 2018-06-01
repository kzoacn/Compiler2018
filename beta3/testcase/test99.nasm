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
	
L_2902:
	mov rbx,  [rsp+8*2]
	cmp r11,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2903
	mov rbx,0
	mov r10,rbx
	
L_2905:
	mov rbx,  [rsp+8*2]
	cmp r10,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2906
	mov rbx,0
	mov r9,rbx
	
L_2908:
	mov rbx,  [rsp+8*2]
	cmp r9,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2909
	mov rbx,0
	mov r8,rbx
	
L_2911:
	mov rbx,  [rsp+8*2]
	cmp r8,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2912
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*12],rbx
	
L_2914:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2915
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_2917:
	mov rbx,  [rsp+8*14]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2918
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*16],rbx
	
L_2920:
	mov rbx,  [rsp+8*16]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*17],rax
	je L_2921
	cmp r11,r10
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*18],rbx
	jne L_2923
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	jmp L_2924
	
L_2923:
	cmp r9,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*19],rbx
	mov qword [rsp+8*18],rdx
	
L_2924:
	mov rbx,  [rsp+8*18]
	cmp rbx, 0
	je L_2929
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	jmp L_2930
	
L_2929:
	mov rbx,  [rsp+8*12]
	cmp r8,rbx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*20],rdx
	jne L_2925
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*20],rbx
	jmp L_2926
	
L_2925:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*21],rdx
	mov qword [rsp+8*20],rax
	
L_2926:
	mov rbx,  [rsp+8*20]
	cmp rbx, 0
	jne L_2927
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*20],rbx
	jmp L_2928
	
L_2927:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*22],rdx
	mov qword [rsp+8*20],rax
	
L_2928:
	mov rdx,  [rsp+8*20]
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_2930:
	mov rbx,  [rsp+8*18]
	cmp rbx, 0
	je L_2931
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	jmp L_2932
	
L_2931:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*23],rdx
	mov qword [rsp+8*18],rax
	
L_2932:
	mov rbx,  [rsp+8*18]
	cmp rbx, 0
	je L_2935
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	jmp L_2936
	
L_2935:
	cmp r8,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*24],rbx
	jne L_2933
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*24],rbx
	jmp L_2934
	
L_2933:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov rdx,r15
	mov qword [rsp+8*24],rdx
	
L_2934:
	mov rdx,  [rsp+8*24]
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_2936:
	mov rbx,  [rsp+8*18]
	mov r13,rbx
	cmp r11,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_2937
	mov rbx,0
	mov r15,rbx
	jmp L_2938
	
L_2937:
	cmp r9,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2938:
	cmp r15, 0
	je L_2943
	mov rbx,1
	mov r15,rbx
	jmp L_2944
	
L_2943:
	mov rbx,  [rsp+8*12]
	cmp r8,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_2939
	mov rbx,0
	mov r15,rbx
	jmp L_2940
	
L_2939:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2940:
	cmp r15, 0
	jne L_2941
	mov rbx,0
	mov r15,rbx
	jmp L_2942
	
L_2941:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2942:
	mov r15,r15
	
L_2944:
	cmp r15, 0
	je L_2945
	mov rbx,1
	mov r15,rbx
	jmp L_2946
	
L_2945:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_2946:
	cmp r15, 0
	je L_2949
	mov rbx,1
	mov r15,rbx
	jmp L_2950
	
L_2949:
	cmp r8,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_2947
	mov rbx,0
	mov r15,rbx
	jmp L_2948
	
L_2947:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2948:
	mov r15,r15
	
L_2950:
	mov r12,r15
	cmp r11,r10
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*36],rbx
	jne L_2951
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*36],rbx
	jmp L_2952
	
L_2951:
	cmp r9,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*37],rbx
	mov qword [rsp+8*36],rdx
	
L_2952:
	mov rbx,  [rsp+8*36]
	cmp rbx, 0
	je L_2957
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*36],rbx
	jmp L_2958
	
L_2957:
	mov rbx,  [rsp+8*12]
	cmp r8,rbx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*38],rdx
	jne L_2953
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*38],rbx
	jmp L_2954
	
L_2953:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*39],rdx
	mov qword [rsp+8*38],rax
	
L_2954:
	mov rbx,  [rsp+8*38]
	cmp rbx, 0
	jne L_2955
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*38],rbx
	jmp L_2956
	
L_2955:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov rdx,r15
	mov qword [rsp+8*38],rdx
	
L_2956:
	mov rdx,  [rsp+8*38]
	mov rbx,rdx
	mov qword [rsp+8*36],rbx
	
L_2958:
	mov rbx,  [rsp+8*36]
	cmp rbx, 0
	je L_2959
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*36],rbx
	jmp L_2960
	
L_2959:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov rdx,r15
	mov qword [rsp+8*36],rdx
	
L_2960:
	mov rbx,  [rsp+8*36]
	cmp rbx, 0
	je L_2963
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*36],rbx
	jmp L_2964
	
L_2963:
	cmp r8,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_2961
	mov rbx,0
	mov r15,rbx
	jmp L_2962
	
L_2961:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2962:
	mov rbx,r15
	mov qword [rsp+8*36],rbx
	
L_2964:
	mov rdx,  [rsp+8*36]
	mov rbx,rdx
	cmp r11,r10
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*44],rbx
	mov qword [rsp+8*45],rax
	jne L_2965
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*45],rbx
	jmp L_2966
	
L_2965:
	cmp r9,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*46],rbx
	mov qword [rsp+8*45],rdx
	
L_2966:
	mov rbx,  [rsp+8*45]
	cmp rbx, 0
	je L_2971
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*45],rbx
	jmp L_2972
	
L_2971:
	mov rbx,  [rsp+8*12]
	cmp r8,rbx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*47],rdx
	jne L_2967
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*47],rbx
	jmp L_2968
	
L_2967:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*48],rdx
	mov qword [rsp+8*47],rax
	
L_2968:
	mov rbx,  [rsp+8*47]
	cmp rbx, 0
	jne L_2969
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*47],rbx
	jmp L_2970
	
L_2969:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*49],rdx
	mov qword [rsp+8*47],rax
	
L_2970:
	mov rdx,  [rsp+8*47]
	mov rbx,rdx
	mov qword [rsp+8*45],rbx
	
L_2972:
	mov rbx,  [rsp+8*45]
	cmp rbx, 0
	je L_2973
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*45],rbx
	jmp L_2974
	
L_2973:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*50],rdx
	mov qword [rsp+8*45],rax
	
L_2974:
	mov rbx,  [rsp+8*45]
	cmp rbx, 0
	je L_2977
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*45],rbx
	jmp L_2978
	
L_2977:
	cmp r8,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*51],rbx
	jne L_2975
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*51],rbx
	jmp L_2976
	
L_2975:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*51],rax
	
L_2976:
	mov rdx,  [rsp+8*51]
	mov rbx,rdx
	mov qword [rsp+8*45],rbx
	
L_2978:
	mov rbx,  [rsp+8*45]
	mov r14,rbx
	cmp r11,r10
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*54],rdx
	jne L_2979
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_2980
	
L_2979:
	cmp r9,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*55],rbx
	mov qword [rsp+8*54],rdx
	
L_2980:
	mov rbx,  [rsp+8*54]
	cmp rbx, 0
	je L_2985
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_2986
	
L_2985:
	mov rbx,  [rsp+8*12]
	cmp r8,rbx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*56],rdx
	jne L_2981
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*56],rbx
	jmp L_2982
	
L_2981:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*57],rdx
	mov qword [rsp+8*56],rax
	
L_2982:
	mov rbx,  [rsp+8*56]
	cmp rbx, 0
	jne L_2983
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*56],rbx
	jmp L_2984
	
L_2983:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*58],rdx
	mov qword [rsp+8*56],rax
	
L_2984:
	mov rdx,  [rsp+8*56]
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	
L_2986:
	mov rbx,  [rsp+8*54]
	cmp rbx, 0
	je L_2987
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_2988
	
L_2987:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*59],rdx
	mov qword [rsp+8*54],rax
	
L_2988:
	mov rbx,  [rsp+8*54]
	cmp rbx, 0
	je L_2991
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_2992
	
L_2991:
	cmp r8,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*60],rbx
	jne L_2989
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*60],rbx
	jmp L_2990
	
L_2989:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*61],rdx
	mov qword [rsp+8*60],rax
	
L_2990:
	mov rdx,  [rsp+8*60]
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	
L_2992:
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	cmp r11,r10
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*62],rbx
	mov qword [rsp+8*63],rax
	jne L_2993
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*63],rbx
	jmp L_2994
	
L_2993:
	cmp r9,0
	mov rbx, 0
	setg bl
	mov rdx,rbx
	mov qword [rsp+8*64],rbx
	mov qword [rsp+8*63],rdx
	
L_2994:
	mov rbx,  [rsp+8*63]
	cmp rbx, 0
	je L_2999
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*63],rbx
	jmp L_3000
	
L_2999:
	mov rbx,  [rsp+8*12]
	cmp r8,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_2995
	mov rbx,0
	mov r15,rbx
	jmp L_2996
	
L_2995:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2996:
	cmp r15, 0
	jne L_2997
	mov rbx,0
	mov r15,rbx
	jmp L_2998
	
L_2997:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2998:
	mov rbx,r15
	mov qword [rsp+8*63],rbx
	
L_3000:
	mov rbx,  [rsp+8*63]
	cmp rbx, 0
	je L_3001
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*63],rbx
	jmp L_3002
	
L_3001:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov rdx,r15
	mov qword [rsp+8*63],rdx
	
L_3002:
	mov rbx,  [rsp+8*63]
	cmp rbx, 0
	je L_3005
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*63],rbx
	jmp L_3006
	
L_3005:
	cmp r8,0
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*69],rbx
	jne L_3003
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*69],rbx
	jmp L_3004
	
L_3003:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*70],rdx
	mov qword [rsp+8*69],rax
	
L_3004:
	mov rdx,  [rsp+8*69]
	mov rbx,rdx
	mov qword [rsp+8*63],rbx
	
L_3006:
	mov rbx,  [rsp+8*63]
	mov r15,rbx
	cmp r13, 0
	je L_3008
	mov rdx,  [rsp+8*3]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*72],rbx
	mov qword [rsp+8*3],rdx
	
L_3008:
	cmp r12, 0
	je L_3010
	mov rdx,  [rsp+8*3]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*3],rdx
	
L_3010:
	mov rbx,  [rsp+8*44]
	cmp rbx, 0
	je L_3012
	mov rdx,  [rsp+8*3]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*3],rdx
	
L_3012:
	cmp r14, 0
	je L_3014
	mov rdx,  [rsp+8*3]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*3],rdx
	
L_3014:
	mov rbx,  [rsp+8*62]
	cmp rbx, 0
	je L_3016
	mov rdx,  [rsp+8*3]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*76],rbx
	mov qword [rsp+8*3],rdx
	
L_3016:
	cmp r15, 0
	je L_3018
	mov rdx,  [rsp+8*3]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*77],rbx
	mov qword [rsp+8*3],rdx
	
L_3018:
	mov rbx,  [rsp+8*16]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*16],rbx
	jmp L_2920
	
L_2921:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*14],rbx
	jmp L_2917
	
L_2918:
	mov rbx,  [rsp+8*12]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*12],rbx
	jmp L_2914
	
L_2915:
	mov rbx,1
	add r8,rbx
	jmp L_2911
	
L_2912:
	mov rbx,1
	add r9,rbx
	jmp L_2908
	
L_2909:
	mov rbx,1
	add r10,rbx
	jmp L_2905
	
L_2906:
	mov rbx,1
	add r11,rbx
	jmp L_2902
	
L_2903:
	mov rbx,  [rsp+8*3]
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
	mov rdi, format
	mov rsi, r15 
	add rsi, 1 
	xor rax, rax
	push r11
	push r10
	push r9
	push r8
	call printf
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

