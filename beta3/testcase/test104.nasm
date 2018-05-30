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
	sub    rsp, 1472
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
        sub     rdx, 3456
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
	mov rbx,0
	mov r9,rbx
	mov rdx,0
	mov r8,rdx
	mov rax,0
	mov r13,rax
	mov rbx,210
	mov r10,rbx
	mov rbx,0
	mov r14,rbx
	mov     rdi, 100
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r12, rax
	mov r12,r12
	xor rdx, rdx
	mov rax, [gbl+8*9]
	mov rbx, [gbl+8*10]
	cdq
	idiv rbx
	mov  r11, rax
	mov rbx,r11
	mov qword [gbl+8*12],rbx
	xor rdx, rdx
	mov rax, [gbl+8*9]
	mov rbx, [gbl+8*10]
	cdq
	idiv ebx
	mov  r11, rdx
	mov rbx,r11
	mov rdi,r10
	mov r11,rdi
	mov qword [gbl+8*14],rbx
	
L_159:
	cmp r14,r11
	mov rbx, 0
	setle bl
	cmp rbx, 0
	mov qword [rsp+8*17],rbx
	je L_160
	mov rbx,1
	mov rdx,r14
	add rdx,rbx
	mov rax,r14
	imul rax,rdx
	mov qword [rsp+8*18],rdx
	mov qword [rsp+8*19],rax
	xor rdx, rdx
	mov rax, [rsp+8*19]
	mov rbx, 2
	cdq
	idiv rbx
	mov [rsp+8*19], rax
	mov rbx,  [rsp+8*19]
	cmp r11,rbx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*20],rdx
	je L_161
	mov rbx,1
	mov r11,rbx
	jmp L_163
	
L_161:
	mov rbx,1
	add r14,rbx
	jmp L_159
	
L_160:
	mov rbx,0
	mov r11,rbx
	
L_163:
	mov r11,r11
	cmp r11, 0
	sete r11B
	cmp r11, 0
	je L_127
	mov rbx,t224
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
	mov rbx,1
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
L_127:
	mov rbx,t229
	mov rdi,rbx
	mov r11,rdi
	mov rdi, r11 
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
	mov rbx,3654898
	mov rdi,rbx
	mov r11,rdi
	mov rdx,r11
	mov rax,0
	mov r11,rax
	mov r11,r11
	mov qword [gbl+8*27],rdx
	xor rdx, rdx
	mov rax, [gbl+8*27]
	mov rbx, [gbl+8*12]
	cdq
	idiv ebx
	mov [rsp+8*30], rdx
	mov rbx,  [gbl+8*10]
	mov rdx,  [rsp+8*30]
	mov rax,rbx
	imul rax,rdx
	mov qword [rsp+8*31],rax
	xor rdx, rdx
	mov rax, [gbl+8*27]
	mov rbx, [gbl+8*12]
	cdq
	idiv rbx
	mov [rsp+8*32], rax
	mov rbx,  [gbl+8*14]
	mov rdx,  [rsp+8*32]
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	sub rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*33],rax
	mov rax,0
	cmp rdx,rax
	mov qword [rsp+8*31],rbx
	mov rbx, 0
	setge bl
	cmp rbx, 0
	mov qword [rsp+8*35],rbx
	mov qword [rsp+8*34],rdx
	je L_165
	mov rdx,  [rsp+8*34]
	mov rbx,rdx
	mov qword [gbl+8*27],rbx
	jmp L_166
	
L_165:
	mov rbx,  [rsp+8*34]
	mov rdx,  [gbl+8*9]
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*27],rbx
	mov qword [rsp+8*36],rax
	
L_166:
	mov rdx,  [gbl+8*27]
	mov rbx,rdx
	mov r11,rbx
	mov qword [rsp+8*37],rbx
	xor rdx, rdx
	mov rax,  r11
	mov rbx, 10
	cdq
	idiv ebx
	mov  r11, rdx
	mov rbx,1
	add r11,rbx
	mov r11,r11
	mov rdi,r11
	mov rdx,rdi
	mov qword [rsp+8*41],rdx
	mov     rdi, [rsp+8*41]
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword[rsp+8*42], rax
	mov rbx,  [rsp+8*42]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*43],rdx
	mov rdi,[rsp+8*43] 
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
	
L_128:
	mov rbx,1
	mov rdx,r11
	sub rdx,rbx
	cmp r9,rdx
	mov rdx, 0
	setl dl
	add r15,r15
	cmp rdx, 0
	mov qword [rsp+8*44],rdx
	je L_129
	xor rdx, rdx
	mov rax, [gbl+8*27]
	mov rbx, [gbl+8*12]
	cdq
	idiv ebx
	mov [rsp+8*30], rdx
	mov rbx,  [gbl+8*10]
	mov rdx,  [rsp+8*30]
	mov rax,rbx
	imul rax,rdx
	mov qword [rsp+8*31],rax
	xor rdx, rdx
	mov rax, [gbl+8*27]
	mov rbx, [gbl+8*12]
	cdq
	idiv rbx
	mov [rsp+8*32], rax
	mov rbx,  [gbl+8*14]
	mov rdx,  [rsp+8*32]
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	sub rbx,rax
	mov rdx,rbx
	mov qword [rsp+8*33],rax
	mov rax,0
	cmp rdx,rax
	mov qword [rsp+8*31],rbx
	mov rbx, 0
	setge bl
	cmp rbx, 0
	mov qword [rsp+8*35],rbx
	mov qword [rsp+8*34],rdx
	je L_169
	mov rdx,  [rsp+8*34]
	mov rbx,rdx
	mov qword [gbl+8*27],rbx
	jmp L_170
	
L_169:
	mov rbx,  [rsp+8*34]
	mov rdx,  [gbl+8*9]
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*27],rbx
	mov qword [rsp+8*36],rax
	
L_170:
	mov rdx,  [gbl+8*27]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*37],rbx
	mov qword [rsp+8*46],rax
	xor rdx, rdx
	mov rax, [rsp+8*46]
	mov rbx, 10
	cdq
	idiv ebx
	mov [rsp+8*47], rdx
	mov rbx,  [rsp+8*47]
	mov rdx,1
	add rbx,rdx
	mov rax,r12
	lea rdx,[rax+r9*8+8H]
	mov [rdx],rbx
	mov qword [rsp+8*47],rbx
	mov qword [rsp+8*49],rdx
	mov qword [rsp+8*48],rax
	
L_131:
	mov rbx,r12
	lea rdx,[rbx+r9*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*50],rbx
	mov rbx,rax
	add rbx,r8
	cmp rbx,r10
	mov rbx, 0
	setg bl
	add r15,r15
	cmp rbx, 0
	mov qword [rsp+8*53],rbx
	mov qword [rsp+8*51],rdx
	mov qword [rsp+8*52],rax
	je L_132
	xor rdx, rdx
	mov rax, [gbl+8*27]
	mov rbx, [gbl+8*12]
	cdq
	idiv ebx
	mov [rsp+8*30], rdx
	mov rbx,  [gbl+8*10]
	mov rdx,  [rsp+8*30]
	mov rax,rbx
	imul rax,rdx
	mov qword [rsp+8*31],rax
	xor rdx, rdx
	mov rax, [gbl+8*27]
	mov rbx, [gbl+8*12]
	cdq
	idiv rbx
	mov [rsp+8*32], rax
	mov rbx,  [gbl+8*14]
	mov rdx,  [rsp+8*32]
	mov rax,rbx
	imul rax,rdx
	mov rbx,  [rsp+8*31]
	sub rbx,rax
	mov rdx,rbx
	mov rbx,0
	cmp rdx,rbx
	mov rax, 0
	setge al
	cmp rax, 0
	mov qword [rsp+8*34],rdx
	mov qword [rsp+8*35],rax
	je L_173
	mov rdx,  [rsp+8*34]
	mov rbx,rdx
	mov qword [gbl+8*27],rbx
	jmp L_174
	
L_173:
	mov rbx,  [rsp+8*34]
	mov rdx,  [gbl+8*9]
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*27],rbx
	mov qword [rsp+8*36],rax
	
L_174:
	mov rdx,  [gbl+8*27]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*37],rbx
	mov qword [rsp+8*54],rax
	xor rdx, rdx
	mov rax, [rsp+8*54]
	mov rbx, 10
	cdq
	idiv ebx
	mov [rsp+8*55], rdx
	mov rbx,  [rsp+8*55]
	mov rdx,1
	add rbx,rdx
	mov rax,r12
	lea rdx,[rax+r9*8+8H]
	mov [rdx],rbx
	mov qword [rsp+8*55],rbx
	mov qword [rsp+8*57],rdx
	mov qword [rsp+8*56],rax
	jmp L_131
	
L_132:
	mov rbx,r12
	lea rdx,[rbx+r9*8+8H]
	mov rax, [rdx]
	add r8,rax
	mov r8,r8
	mov qword [rsp+8*58],rbx
	mov rbx,1
	add r9,rbx
	mov qword [rsp+8*59],rdx
	mov qword [rsp+8*60],rax
	jmp L_128
	
L_129:
	sub r10,r8
	mov rbx,1
	mov r8,r11
	sub r8,rbx
	mov r9,r12
	lea r9,[r9+r8*8+8H]
	mov [r9],r10
	mov rdx,0
	mov r10,rdx
	
L_177:
	cmp r10,r11
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_178
	mov r9,r12
	lea r9,[r9+r10*8+8H]
	mov r9, [r9]
	mov rdi,r9
	mov r9,rdi
	mov     rdi,  r9
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword r9, rax
	mov     rsi, t106
	mov     rdi,  r9
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r9, rax
	mov rdi,r9
	mov r9,rdi
	mov rdi, format
	mov rsi, r9 
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
	mov rbx,1
	add r10,rbx
	jmp L_177
	
L_178:
	mov rbx,t111
	mov rdi,rbx
	mov r10,rdi
	mov rdi, r10 
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
	mov r10,rbx
	mov r10,r10
	mov rdx,0
	mov r10,rdx
	
L_230:
	cmp r10,r11
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_231
	mov r9,r12
	lea r9,[r9+r10*8+8H]
	mov r9, [r9]
	mov rbx,0
	cmp r9,rbx
	mov r9, 0
	sete r9B
	cmp r9, 0
	je L_232
	mov rbx,1
	mov r9,r10
	add r9,rbx
	mov r9,r9
	
L_233:
	cmp r9,r11
	mov r8, 0
	setl r8B
	cmp r8, 0
	je L_234
	mov r8,r12
	lea r8,[r8+r9*8+8H]
	mov r8, [r8]
	mov rbx,0
	cmp r8,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	je L_235
	mov rsi,r9
	mov rdi,r10
	mov r8,rdi
	mov r9,rsi
	mov rbx,r12
	lea rdx,[rbx+r8*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*94],rbx
	mov rbx,rax
	mov qword [rsp+8*95],rdx
	mov rdx,r12
	mov qword [rsp+8*97],rbx
	lea rbx,[rdx+r9*8+8H]
	mov qword [rsp+8*96],rax
	mov rax, [rbx]
	mov qword [rsp+8*98],rdx
	mov rdx,r12
	lea r8,[rdx+r8*8+8H]
	mov [r8],rax
	mov r8,r12
	lea r9,[r8+r9*8+8H]
	mov qword [rsp+8*99],rbx
	mov rbx,  [rsp+8*97]
	mov [r9],rbx
	mov qword [rsp+8*101],rdx
	mov rdx,0
	mov r9,rdx
	mov r9,r9
	mov qword [rsp+8*100],rax
	jmp L_234
	
L_235:
	mov rbx,1
	add r9,rbx
	jmp L_233
	
L_234:
	
L_232:
	mov rbx,1
	add r10,rbx
	jmp L_230
	
L_231:
	mov rbx,0
	mov r10,rbx
	
L_240:
	cmp r10,r11
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_241
	mov r9,r12
	lea r9,[r9+r10*8+8H]
	mov r9, [r9]
	mov rbx,0
	cmp r9,rbx
	mov r9, 0
	sete r9B
	cmp r9, 0
	je L_242
	mov r11,r10
	jmp L_241
	
L_242:
	mov rbx,1
	add r10,rbx
	jmp L_240
	
L_241:
	mov rbx,0
	mov r10,rbx
	mov r10,r10
	
L_133:
	mov     rdi, 100
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r10, rax
	mov r10,r10
	cmp r11,r14
	mov r9, 0
	setne r9B
	cmp r9, 0
	je L_246
	mov rbx,0
	mov r10,rbx
	jmp L_248
	
L_246:
	mov rbx,0
	mov r8,rbx
	
L_249:
	cmp r8,r11
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_250
	mov r9,r12
	lea r9,[r9+r8*8+8H]
	mov r9, [r9]
	mov rbx,r10
	lea rdx,[rbx+r8*8+8H]
	mov [rdx],r9
	mov rax,1
	add r8,rax
	mov qword [rsp+8*123],rbx
	mov qword [rsp+8*124],rdx
	jmp L_249
	
L_250:
	mov rbx,0
	mov r9,rbx
	
L_252:
	mov rbx,1
	mov r8,r11
	sub r8,rbx
	cmp r9,r8
	mov r8, 0
	setl r8B
	add r15,r15
	cmp r8, 0
	je L_254
	mov rbx,1
	mov r8,r9
	add r8,rbx
	mov r8,r8
	
L_255:
	cmp r8,r11
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*128],rbx
	je L_256
	mov rbx,r10
	lea rdx,[rbx+r9*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*129],rbx
	mov rbx,r10
	mov qword [rsp+8*130],rdx
	lea rdx,[rbx+r8*8+8H]
	mov qword [rsp+8*132],rbx
	mov rbx, [rdx]
	cmp rax,rbx
	mov qword [rsp+8*133],rdx
	mov rdx, 0
	setg dl
	cmp rdx, 0
	mov qword [rsp+8*134],rbx
	mov qword [rsp+8*135],rdx
	mov qword [rsp+8*131],rax
	je L_257
	mov rbx,r10
	lea rdx,[rbx+r9*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*136],rbx
	mov rbx,rax
	mov qword [rsp+8*137],rdx
	mov rdx,r10
	mov qword [rsp+8*138],rax
	lea rax,[rdx+r8*8+8H]
	mov qword [rsp+8*140],rdx
	mov rdx, [rax]
	mov qword [rsp+8*141],rax
	mov rax,r10
	mov qword [rsp+8*139],rbx
	lea rbx,[rax+r9*8+8H]
	mov [rbx],rdx
	mov qword [rsp+8*144],rbx
	mov rbx,r10
	mov qword [rsp+8*142],rdx
	lea rdx,[rbx+r8*8+8H]
	mov qword [rsp+8*145],rbx
	mov rbx,  [rsp+8*139]
	mov [rdx],rbx
	mov qword [rsp+8*146],rdx
	mov qword [rsp+8*143],rax
	
L_257:
	mov rbx,1
	add r8,rbx
	jmp L_255
	
L_256:
	mov rbx,1
	add r9,rbx
	jmp L_252
	
L_254:
	mov rbx,0
	mov r9,rbx
	
L_260:
	cmp r9,r11
	mov r8, 0
	setl r8B
	cmp r8, 0
	je L_261
	mov r8,r10
	lea r8,[r8+r9*8+8H]
	mov rbx, [r8]
	mov rdx,1
	mov r8,r9
	add r8,rdx
	cmp rbx,r8
	mov r8, 0
	setne r8B
	cmp r8, 0
	mov qword [rsp+8*150],rbx
	je L_262
	mov rbx,0
	mov r10,rbx
	jmp L_248
	
L_262:
	mov rbx,1
	add r9,rbx
	jmp L_260
	
L_261:
	mov rbx,1
	mov r10,rbx
	
L_248:
	mov r10,r10
	cmp r10, 0
	sete r10B
	cmp r10, 0
	je L_134
	mov rbx,1
	add r13,rbx
	mov rdi,r13
	mov r10,rdi
	mov     rdi,  r10
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword r10, rax
	mov     rsi,  r10
	mov     rdi, t284
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r10, rax
	mov     rsi, t290
	mov     rdi,  r10
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r10, rax
	mov rdi,r10
	mov r10,rdi
	mov rdi, r10 
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
	mov r10,rbx
	
L_182:
	cmp r10,r11
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_183
	mov r9,r12
	lea r8,[r9+r10*8+8H]
	mov r9, [r8]
	mov rbx,1
	sub r9,rbx
	mov [r8],r9
	mov rdx,1
	add r10,rdx
	mov r10,r10
	jmp L_182
	
L_183:
	mov r10,r12
	lea r10,[r10+r11*8+8H]
	mov [r10],r11
	mov r10,r11
	mov rbx,1
	add r11,rbx
	mov rdx,0
	mov r10,rdx
	mov r10,r10
	mov rax,0
	mov r10,rax
	
L_264:
	cmp r10,r11
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_265
	mov r9,r12
	lea r9,[r9+r10*8+8H]
	mov r9, [r9]
	mov rbx,0
	cmp r9,rbx
	mov r9, 0
	sete r9B
	cmp r9, 0
	je L_266
	mov rbx,1
	mov r9,r10
	add r9,rbx
	mov r9,r9
	
L_267:
	cmp r9,r11
	mov r8, 0
	setl r8B
	cmp r8, 0
	je L_268
	mov r8,r12
	lea r8,[r8+r9*8+8H]
	mov r8, [r8]
	mov rbx,0
	cmp r8,rbx
	mov r8, 0
	setne r8B
	cmp r8, 0
	je L_269
	mov rsi,r9
	mov rdi,r10
	mov r8,rdi
	mov r9,rsi
	mov rbx,r12
	lea rdx,[rbx+r8*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*94],rbx
	mov rbx,rax
	mov qword [rsp+8*95],rdx
	mov rdx,r12
	mov qword [rsp+8*96],rax
	lea rax,[rdx+r9*8+8H]
	mov qword [rsp+8*98],rdx
	mov rdx, [rax]
	mov qword [rsp+8*99],rax
	mov rax,r12
	lea r8,[rax+r8*8+8H]
	mov [r8],rdx
	mov r8,r12
	lea r9,[r8+r9*8+8H]
	mov [r9],rbx
	mov qword [rsp+8*97],rbx
	mov rbx,0
	mov r9,rbx
	mov r9,r9
	mov qword [rsp+8*100],rdx
	mov qword [rsp+8*101],rax
	jmp L_268
	
L_269:
	mov rbx,1
	add r9,rbx
	jmp L_267
	
L_268:
	
L_266:
	mov rbx,1
	add r10,rbx
	jmp L_264
	
L_265:
	mov rbx,0
	mov r10,rbx
	
L_274:
	cmp r10,r11
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_275
	mov r9,r12
	lea r9,[r9+r10*8+8H]
	mov r9, [r9]
	mov rbx,0
	cmp r9,rbx
	mov r9, 0
	sete r9B
	cmp r9, 0
	je L_276
	mov r11,r10
	jmp L_275
	
L_276:
	mov rbx,1
	add r10,rbx
	jmp L_274
	
L_275:
	mov rbx,0
	mov r10,rbx
	mov r10,r10
	mov rdx,0
	mov r10,rdx
	
L_187:
	cmp r10,r11
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_188
	mov r9,r12
	lea r9,[r9+r10*8+8H]
	mov r9, [r9]
	mov rdi,r9
	mov r9,rdi
	mov     rdi,  r9
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword r9, rax
	mov     rsi, t106
	mov     rdi,  r9
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r9, rax
	mov rdi,r9
	mov r9,rdi
	mov rdi, format
	mov rsi, r9 
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
	mov rbx,1
	add r10,rbx
	jmp L_187
	
L_188:
	mov rbx,t111
	mov rdi,rbx
	mov r10,rdi
	mov rdi, r10 
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
	mov r10,rbx
	mov r10,r10
	jmp L_133
	
L_134:
	mov rdi,r13
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
	mov     rsi,  r15
	mov     rdi, t300
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
	mov     rsi, t305
	mov     rdi,  r15
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r15, rax
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
	sub    rsp, 1472
	mov rdx,48271
	mov rbx,rdx
	mov qword [gbl+8*10],rbx
	mov rbx,2147483647
	mov rax,rbx
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*27],rbx
	mov qword [gbl+8*9],rax
	mov rbx,  [rsp+8*176]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   3456
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
	 db 12,"Let's start!" ,0

t290:
	 db 1,":" ,0

t305:
	 db 8," step(s)" ,0

t224:
	 db 79,"Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i" ,0

t106:
	 db 1," " ,0

t111:
	 db 0,"" ,0

t300:
	 db 7,"Total: " ,0

t284:
	 db 5,"step " ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

