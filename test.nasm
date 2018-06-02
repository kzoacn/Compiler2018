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
	sub    rsp, 648
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
        sub     rdx, 2632
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
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
	mov r15,r15
	mov rbx,1
	mov r14,rbx
	
L_0:
	cmp r14,r15
	mov r13, 0
	setle r13B
	cmp r13, 0
	je L_1
	mov rbx,1
	mov r13,rbx
	
L_3:
	cmp r13,r15
	mov r12, 0
	setle r12B
	cmp r12, 0
	je L_4
	mov rbx,1
	mov r12,rbx
	
L_6:
	cmp r12,r15
	mov r11, 0
	setle r11B
	cmp r11, 0
	je L_7
	mov rbx,1
	mov r11,rbx
	
L_9:
	cmp r11,r15
	mov r10, 0
	setle r10B
	cmp r10, 0
	je L_10
	mov rbx,1
	mov r10,rbx
	
L_12:
	cmp r10,r15
	mov r9, 0
	setle r9B
	cmp r9, 0
	je L_13
	mov rbx,1
	mov r9,rbx
	
L_15:
	cmp r9,r15
	mov r8, 0
	setle r8B
	cmp r8, 0
	je L_16
	cmp r14,r13
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_96
	mov rbx,0
	mov r8,rbx
	jmp L_97
	
L_96:
	cmp r14,r12
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_94
	mov rbx,0
	mov r8,rbx
	jmp L_95
	
L_94:
	cmp r14,r11
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_92
	mov rbx,0
	mov r8,rbx
	jmp L_93
	
L_92:
	cmp r14,r10
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_90
	mov rbx,0
	mov r8,rbx
	jmp L_91
	
L_90:
	cmp r14,r9
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_88
	mov rbx,0
	mov r8,rbx
	jmp L_89
	
L_88:
	mov rbx,  [gbl+8*1]
	cmp r14,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_86
	mov rbx,0
	mov r8,rbx
	jmp L_87
	
L_86:
	mov rbx,  [gbl+8*2]
	cmp r14,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_84
	mov rbx,0
	mov r8,rbx
	jmp L_85
	
L_84:
	mov rbx,  [gbl+8*3]
	cmp r14,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_82
	mov rbx,0
	mov r8,rbx
	jmp L_83
	
L_82:
	mov rbx,  [gbl+8*4]
	cmp r14,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_80
	mov rbx,0
	mov r8,rbx
	jmp L_81
	
L_80:
	cmp r13,r12
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_78
	mov rbx,0
	mov r8,rbx
	jmp L_79
	
L_78:
	cmp r13,r11
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_76
	mov rbx,0
	mov r8,rbx
	jmp L_77
	
L_76:
	cmp r13,r10
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_74
	mov rbx,0
	mov r8,rbx
	jmp L_75
	
L_74:
	cmp r13,r9
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_72
	mov rbx,0
	mov r8,rbx
	jmp L_73
	
L_72:
	mov rbx,  [gbl+8*1]
	cmp r13,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_70
	mov rbx,0
	mov r8,rbx
	jmp L_71
	
L_70:
	mov rbx,  [gbl+8*2]
	cmp r13,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_68
	mov rbx,0
	mov r8,rbx
	jmp L_69
	
L_68:
	mov rbx,  [gbl+8*3]
	cmp r13,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_66
	mov rbx,0
	mov r8,rbx
	jmp L_67
	
L_66:
	mov rbx,  [gbl+8*4]
	cmp r13,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_64
	mov rbx,0
	mov r8,rbx
	jmp L_65
	
L_64:
	cmp r12,r11
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_62
	mov rbx,0
	mov r8,rbx
	jmp L_63
	
L_62:
	cmp r12,r10
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_60
	mov rbx,0
	mov r8,rbx
	jmp L_61
	
L_60:
	cmp r12,r9
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_58
	mov rbx,0
	mov r8,rbx
	jmp L_59
	
L_58:
	mov rbx,  [gbl+8*1]
	cmp r12,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_56
	mov rbx,0
	mov r8,rbx
	jmp L_57
	
L_56:
	mov rbx,  [gbl+8*2]
	cmp r12,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_54
	mov rbx,0
	mov r8,rbx
	jmp L_55
	
L_54:
	mov rbx,  [gbl+8*3]
	cmp r12,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_52
	mov rbx,0
	mov r8,rbx
	jmp L_53
	
L_52:
	mov rbx,  [gbl+8*4]
	cmp r12,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_50
	mov rbx,0
	mov r8,rbx
	jmp L_51
	
L_50:
	cmp r11,r10
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_48
	mov rbx,0
	mov r8,rbx
	jmp L_49
	
L_48:
	cmp r11,r9
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_46
	mov rbx,0
	mov r8,rbx
	jmp L_47
	
L_46:
	mov rbx,  [gbl+8*1]
	cmp r11,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_44
	mov rbx,0
	mov r8,rbx
	jmp L_45
	
L_44:
	mov rbx,  [gbl+8*2]
	cmp r11,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_42
	mov rbx,0
	mov r8,rbx
	jmp L_43
	
L_42:
	mov rbx,  [gbl+8*3]
	cmp r11,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_40
	mov rbx,0
	mov r8,rbx
	jmp L_41
	
L_40:
	mov rbx,  [gbl+8*4]
	cmp r11,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_38
	mov rbx,0
	mov r8,rbx
	jmp L_39
	
L_38:
	cmp r10,r9
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_36
	mov rbx,0
	mov r8,rbx
	jmp L_37
	
L_36:
	mov rbx,  [gbl+8*1]
	cmp r10,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_34
	mov rbx,0
	mov r8,rbx
	jmp L_35
	
L_34:
	mov rbx,  [gbl+8*2]
	cmp r10,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_32
	mov rbx,0
	mov r8,rbx
	jmp L_33
	
L_32:
	mov rbx,  [gbl+8*3]
	cmp r10,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_30
	mov rbx,0
	mov r8,rbx
	jmp L_31
	
L_30:
	mov rbx,  [gbl+8*4]
	cmp r10,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_28
	mov rbx,0
	mov r8,rbx
	jmp L_29
	
L_28:
	mov rbx,  [gbl+8*1]
	cmp r9,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_26
	mov rbx,0
	mov r8,rbx
	jmp L_27
	
L_26:
	mov rbx,  [gbl+8*2]
	cmp r9,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_24
	mov rbx,0
	mov r8,rbx
	jmp L_25
	
L_24:
	mov rbx,  [gbl+8*3]
	cmp r9,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_22
	mov rbx,0
	mov r8,rbx
	jmp L_23
	
L_22:
	mov rbx,  [gbl+8*4]
	cmp r9,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_20
	mov rbx,0
	mov r8,rbx
	jmp L_21
	
L_20:
	mov rbx,  [gbl+8*2]
	mov rdx,  [gbl+8*3]
	cmp rbx,rdx
	mov r8, 0
	setne r8B
	cmp r8, 0
	jne L_18
	mov rbx,0
	mov r8,rbx
	jmp L_19
	
L_18:
	mov rbx,  [gbl+8*1]
	mov rdx,  [gbl+8*4]
	cmp rbx,rdx
	mov r8, 0
	setne r8B
	mov r8,r8
	
L_19:
	mov r8,r8
	
L_21:
	mov r8,r8
	
L_23:
	mov r8,r8
	
L_25:
	mov r8,r8
	
L_27:
	mov r8,r8
	
L_29:
	mov r8,r8
	
L_31:
	mov r8,r8
	
L_33:
	mov r8,r8
	
L_35:
	mov r8,r8
	
L_37:
	mov r8,r8
	
L_39:
	mov r8,r8
	
L_41:
	mov r8,r8
	
L_43:
	mov r8,r8
	
L_45:
	mov r8,r8
	
L_47:
	mov r8,r8
	
L_49:
	mov r8,r8
	
L_51:
	mov r8,r8
	
L_53:
	mov r8,r8
	
L_55:
	mov r8,r8
	
L_57:
	mov r8,r8
	
L_59:
	mov r8,r8
	
L_61:
	mov r8,r8
	
L_63:
	mov r8,r8
	
L_65:
	mov r8,r8
	
L_67:
	mov r8,r8
	
L_69:
	mov r8,r8
	
L_71:
	mov r8,r8
	
L_73:
	mov r8,r8
	
L_75:
	mov r8,r8
	
L_77:
	mov r8,r8
	
L_79:
	mov r8,r8
	
L_81:
	mov r8,r8
	
L_83:
	mov r8,r8
	
L_85:
	mov r8,r8
	
L_87:
	mov r8,r8
	
L_89:
	mov r8,r8
	
L_91:
	mov r8,r8
	
L_93:
	mov r8,r8
	
L_95:
	mov r8,r8
	
L_97:
	cmp r8, 0
	je L_99
	mov rbx,  [gbl+8*5]
	mov r8,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [gbl+8*5],rbx
	
L_99:
	mov r8,r9
	mov rbx,1
	add r9,rbx
	jmp L_15
	
L_16:
	mov r9,r10
	mov rbx,1
	add r10,rbx
	jmp L_12
	
L_13:
	mov r10,r11
	mov rbx,1
	add r11,rbx
	jmp L_9
	
L_10:
	mov r11,r12
	mov rbx,1
	add r12,rbx
	jmp L_6
	
L_7:
	mov r12,r13
	mov rbx,1
	add r13,rbx
	jmp L_3
	
L_4:
	mov r13,r14
	mov rbx,1
	add r14,rbx
	jmp L_0
	
L_1:
	mov rbx,  [gbl+8*5]
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
	sub    rsp, 648
	mov rdx,99
	mov rbx,rdx
	mov qword [gbl+8*1],rbx
	mov rbx,100
	mov rax,rbx
	mov rdx,101
	mov rbx,rdx
	mov qword [gbl+8*3],rbx
	mov rdx,102
	mov rbx,rdx
	mov qword [gbl+8*4],rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [gbl+8*5],rbx
	mov qword [gbl+8*2],rax
	mov rbx,  [rsp+8*7]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   2632
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

