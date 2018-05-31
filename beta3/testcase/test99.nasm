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
	mov qword [rsp+8*2],rbx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*4],rdx
	mov qword [rsp+8*3],rax
	
L_4061:
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r12, 0
	setl r12B
	cmp r12, 0
	je L_4062
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*6],rbx
	
L_4064:
	mov rbx,  [rsp+8*6]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r11, 0
	setl r11B
	cmp r11, 0
	je L_4065
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*8],rbx
	
L_4067:
	mov rbx,  [rsp+8*8]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r10, 0
	setl r10B
	cmp r10, 0
	je L_4068
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*10],rbx
	
L_4070:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_4071
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*12],rbx
	
L_4073:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r8, 0
	setl r8B
	cmp r8, 0
	je L_4074
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_4076:
	mov rbx,  [rsp+8*14]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_4077
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*16],rbx
	
L_4079:
	mov rbx,  [rsp+8*16]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov r13, 0
	setl r13B
	cmp r13, 0
	je L_4080
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r13, 0
	sete r13B
	cmp r13, 0
	jne L_4082
	mov rbx,0
	mov r13,rbx
	jmp L_4083
	
L_4082:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r13,r15
	
L_4083:
	cmp r13, 0
	je L_4088
	mov rbx,1
	mov r13,rbx
	jmp L_4089
	
L_4088:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_4084
	mov rbx,0
	mov r15,rbx
	jmp L_4085
	
L_4084:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r12, 0
	setg r12B
	mov r15,r12
	
L_4085:
	cmp r15, 0
	jne L_4086
	mov rbx,0
	mov r15,rbx
	jmp L_4087
	
L_4086:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r12, 0
	setg r12B
	mov r15,r12
	
L_4087:
	mov r13,r15
	
L_4089:
	cmp r13, 0
	je L_4090
	mov rbx,1
	mov r13,rbx
	jmp L_4091
	
L_4090:
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*16]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	mov r13,r15
	
L_4091:
	cmp r13, 0
	je L_4094
	mov rbx,1
	mov r13,rbx
	jmp L_4095
	
L_4094:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_4092
	mov rbx,0
	mov r15,rbx
	jmp L_4093
	
L_4092:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r12, 0
	setg r12B
	mov r15,r12
	
L_4093:
	mov r13,r15
	
L_4095:
	mov r15,r13
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r13, 0
	sete r13B
	cmp r13, 0
	jne L_4096
	mov rbx,0
	mov r13,rbx
	jmp L_4097
	
L_4096:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r12, 0
	setg r12B
	mov r13,r12
	
L_4097:
	cmp r13, 0
	je L_4102
	mov rbx,1
	mov r13,rbx
	jmp L_4103
	
L_4102:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r12, 0
	sete r12B
	cmp r12, 0
	jne L_4098
	mov rbx,0
	mov r12,rbx
	jmp L_4099
	
L_4098:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r11, 0
	setg r11B
	mov r12,r11
	
L_4099:
	cmp r12, 0
	jne L_4100
	mov rbx,0
	mov r12,rbx
	jmp L_4101
	
L_4100:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r11, 0
	setg r11B
	mov r12,r11
	
L_4101:
	mov r13,r12
	
L_4103:
	cmp r13, 0
	je L_4104
	mov rbx,1
	mov r13,rbx
	jmp L_4105
	
L_4104:
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*16]
	cmp rbx,rdx
	mov r12, 0
	sete r12B
	mov r13,r12
	
L_4105:
	cmp r13, 0
	je L_4108
	mov rbx,1
	mov r13,rbx
	jmp L_4109
	
L_4108:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r12, 0
	setg r12B
	cmp r12, 0
	jne L_4106
	mov rbx,0
	mov r12,rbx
	jmp L_4107
	
L_4106:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r11, 0
	setg r11B
	mov r12,r11
	
L_4107:
	mov r13,r12
	
L_4109:
	mov r12,r13
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r13, 0
	sete r13B
	cmp r13, 0
	jne L_4110
	mov rbx,0
	mov r13,rbx
	jmp L_4111
	
L_4110:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r11, 0
	setg r11B
	mov r13,r11
	
L_4111:
	cmp r13, 0
	je L_4116
	mov rbx,1
	mov r13,rbx
	jmp L_4117
	
L_4116:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r11, 0
	sete r11B
	cmp r11, 0
	jne L_4112
	mov rbx,0
	mov r11,rbx
	jmp L_4113
	
L_4112:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r10, 0
	setg r10B
	mov r11,r10
	
L_4113:
	cmp r11, 0
	jne L_4114
	mov rbx,0
	mov r11,rbx
	jmp L_4115
	
L_4114:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r10, 0
	setg r10B
	mov r11,r10
	
L_4115:
	mov r13,r11
	
L_4117:
	cmp r13, 0
	je L_4118
	mov rbx,1
	mov r13,rbx
	jmp L_4119
	
L_4118:
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*16]
	cmp rbx,rdx
	mov r11, 0
	sete r11B
	mov r13,r11
	
L_4119:
	cmp r13, 0
	je L_4122
	mov rbx,1
	mov r13,rbx
	jmp L_4123
	
L_4122:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r11, 0
	setg r11B
	cmp r11, 0
	jne L_4120
	mov rbx,0
	mov r11,rbx
	jmp L_4121
	
L_4120:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r10, 0
	setg r10B
	mov r11,r10
	
L_4121:
	mov r13,r11
	
L_4123:
	mov r11,r13
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r13, 0
	sete r13B
	cmp r13, 0
	jne L_4124
	mov rbx,0
	mov r13,rbx
	jmp L_4125
	
L_4124:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r10, 0
	setg r10B
	mov r13,r10
	
L_4125:
	cmp r13, 0
	je L_4130
	mov rbx,1
	mov r13,rbx
	jmp L_4131
	
L_4130:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r10, 0
	sete r10B
	cmp r10, 0
	jne L_4126
	mov rbx,0
	mov r10,rbx
	jmp L_4127
	
L_4126:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r9, 0
	setg r9B
	mov r10,r9
	
L_4127:
	cmp r10, 0
	jne L_4128
	mov rbx,0
	mov r10,rbx
	jmp L_4129
	
L_4128:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r9, 0
	setg r9B
	mov r10,r9
	
L_4129:
	mov r13,r10
	
L_4131:
	cmp r13, 0
	je L_4132
	mov rbx,1
	mov r13,rbx
	jmp L_4133
	
L_4132:
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*16]
	cmp rbx,rdx
	mov r10, 0
	sete r10B
	mov r13,r10
	
L_4133:
	cmp r13, 0
	je L_4136
	mov rbx,1
	mov r13,rbx
	jmp L_4137
	
L_4136:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r10, 0
	setg r10B
	cmp r10, 0
	jne L_4134
	mov rbx,0
	mov r10,rbx
	jmp L_4135
	
L_4134:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r9, 0
	setg r9B
	mov r10,r9
	
L_4135:
	mov r13,r10
	
L_4137:
	mov r10,r13
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r13, 0
	sete r13B
	cmp r13, 0
	jne L_4138
	mov rbx,0
	mov r13,rbx
	jmp L_4139
	
L_4138:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r9, 0
	setg r9B
	mov r13,r9
	
L_4139:
	cmp r13, 0
	je L_4144
	mov rbx,1
	mov r13,rbx
	jmp L_4145
	
L_4144:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r9, 0
	sete r9B
	cmp r9, 0
	jne L_4140
	mov rbx,0
	mov r9,rbx
	jmp L_4141
	
L_4140:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r8, 0
	setg r8B
	mov r9,r8
	
L_4141:
	cmp r9, 0
	jne L_4142
	mov rbx,0
	mov r9,rbx
	jmp L_4143
	
L_4142:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r8, 0
	setg r8B
	mov r9,r8
	
L_4143:
	mov r13,r9
	
L_4145:
	cmp r13, 0
	je L_4146
	mov rbx,1
	mov r13,rbx
	jmp L_4147
	
L_4146:
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*16]
	cmp rbx,rdx
	mov r9, 0
	sete r9B
	mov r13,r9
	
L_4147:
	cmp r13, 0
	je L_4150
	mov rbx,1
	mov r13,rbx
	jmp L_4151
	
L_4150:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	jne L_4148
	mov rbx,0
	mov r9,rbx
	jmp L_4149
	
L_4148:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r8, 0
	setg r8B
	mov r9,r8
	
L_4149:
	mov r13,r9
	
L_4151:
	mov r9,r13
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*6]
	cmp rbx,rdx
	mov r13, 0
	sete r13B
	cmp r13, 0
	jne L_4152
	mov rbx,0
	mov r13,rbx
	jmp L_4153
	
L_4152:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r8, 0
	setg r8B
	mov r13,r8
	
L_4153:
	cmp r13, 0
	je L_4158
	mov rbx,1
	mov r13,rbx
	jmp L_4159
	
L_4158:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r8, 0
	sete r8B
	cmp r8, 0
	jne L_4154
	mov rbx,0
	mov r8,rbx
	jmp L_4155
	
L_4154:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r8,r14
	
L_4155:
	cmp r8, 0
	jne L_4156
	mov rbx,0
	mov r8,rbx
	jmp L_4157
	
L_4156:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r8,r14
	
L_4157:
	mov r13,r8
	
L_4159:
	cmp r13, 0
	je L_4160
	mov rbx,1
	mov r13,rbx
	jmp L_4161
	
L_4160:
	mov rbx,  [rsp+8*4]
	mov rdx,  [rsp+8*16]
	cmp rbx,rdx
	mov r14, 0
	sete r14B
	mov r13,r14
	
L_4161:
	cmp r13, 0
	je L_4164
	mov rbx,1
	mov r13,rbx
	jmp L_4165
	
L_4164:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r14, 0
	setg r14B
	cmp r14, 0
	jne L_4162
	mov rbx,0
	mov r14,rbx
	jmp L_4163
	
L_4162:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r8, 0
	setg r8B
	mov r14,r8
	
L_4163:
	mov r13,r14
	
L_4165:
	mov r14,r13
	cmp r15, 0
	je L_4167
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_4167:
	cmp r12, 0
	je L_4169
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_4169:
	cmp r11, 0
	je L_4171
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_4171:
	cmp r10, 0
	je L_4173
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_4173:
	cmp r9, 0
	je L_4175
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_4175:
	cmp r14, 0
	je L_4177
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_4177:
	mov rbx,  [rsp+8*16]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*16],rbx
	jmp L_4079
	
L_4080:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*14],rbx
	jmp L_4076
	
L_4077:
	mov rbx,  [rsp+8*12]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*12],rbx
	jmp L_4073
	
L_4074:
	mov rbx,  [rsp+8*10]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*10],rbx
	jmp L_4070
	
L_4071:
	mov rbx,  [rsp+8*8]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*8],rbx
	jmp L_4067
	
L_4068:
	mov rbx,  [rsp+8*6]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*6],rbx
	jmp L_4064
	
L_4065:
	mov rbx,  [rsp+8*4]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*4],rbx
	jmp L_4061
	
L_4062:
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
	mov     qword r14, rax
	mov rdi,r14
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

