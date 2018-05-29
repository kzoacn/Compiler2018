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
        sub     rdx, 4328
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	push r14
	call global_init
	pop r14
	pop r15
	mov r15 , rax
	mov rdx,102
	mov rbx,rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*2],rbx
	mov rbx,0
	mov rdx,rbx
	mov rbx,0
	mov r11,rbx
	mov rbx,0
	mov r10,rbx
	mov rbx,  [rsp+8*2]
	mov qword [rsp+8*3],rax
	mov rax,1
	mov r15,rbx
	sub r15,rax
	mov rax,r15
	mov qword [rsp+8*4],rdx
	mov rdx,1
	mov r15,rbx
	sub r15,rdx
	mov rdx,r15
	mov qword [rsp+8*8],rax
	mov rax,0
	mov r12,rax
	mov rax,0
	mov r13,rax
	mov rax,0
	mov r9,rax
	mov rbx,0
	mov rax,rbx
	mov rbx,  [rsp+8*2]
	mov r15,rbx
	imul r15,rbx
	mov qword [rsp+8*10],rdx
	mov qword [rsp+8*14],rax
	mov     rdi,  r15
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
	mov rdx,0
	mov r12,rdx
	mov qword [rsp+8*17],rbx
	
L_1206:
	mov rbx,  [rsp+8*2]
	mov r15,rbx
	imul r15,rbx
	cmp r12,r15
	mov r15, 0
	setl r15B
	add r14,r14
	cmp r15, 0
	je L_1207
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r12
	mov rax,1
	add r12,rax
	jmp L_1206
	
L_1207:
	mov rbx,  [rsp+8*2]
	mov r15,rbx
	imul r15,rbx
	mov     rdi,  r15
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
	mov rdx,0
	mov r12,rdx
	mov qword [rsp+8*26],rbx
	
L_1209:
	mov rbx,  [rsp+8*2]
	mov r15,rbx
	imul r15,rbx
	cmp r12,r15
	mov r15, 0
	setl r15B
	add r14,r14
	cmp r15, 0
	je L_1210
	mov rbx,  [rsp+8*26]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r12
	mov rax,1
	add r12,rax
	jmp L_1209
	
L_1210:
	mov     rdi, [rsp+8*2]
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
	mov r8,r15
	mov rbx,0
	mov r12,rbx
	
L_1212:
	mov rbx,  [rsp+8*2]
	cmp r12,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1213
	mov     rdi, [rsp+8*2]
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r14, rax
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov [r15],r14
	mov rbx,0
	mov r13,rbx
	
L_1215:
	mov rbx,  [rsp+8*2]
	cmp r13,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1216
	mov rbx,1
	mov r14,rbx
	neg r14
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov r15,r13
	mov rdx,1
	add r13,rdx
	jmp L_1215
	
L_1216:
	mov r15,r12
	mov rbx,1
	add r12,rbx
	jmp L_1212
	
L_1213:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,0
	lea r15,[r15+rdx*8+8H]
	mov [r15],r11
	mov rax,  [rsp+8*26]
	mov r15,rax
	mov rdx,0
	lea r15,[r15+rdx*8+8H]
	mov [r15],r10
	mov r15,r8
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	lea r15,[r15+r10*8+8H]
	mov rdx,0
	mov [r15],rdx
	
L_1218:
	mov rbx,  [rsp+8*3]
	mov rdx,  [rsp+8*4]
	cmp rbx,rdx
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1219
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r13, [r15]
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r14, [r15]
	mov r15,r8
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	mov r9,r15
	mov r15,rbx
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	sub r15,rax
	mov r12,r15
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,2
	sub r15,rbx
	mov r13,r15
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1308
	mov rbx,0
	mov r15,rbx
	jmp L_1309
	
L_1308:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1309:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1220
	mov rbx,0
	mov r15,rbx
	jmp L_1221
	
L_1220:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1312
	mov rbx,0
	mov r15,rbx
	jmp L_1313
	
L_1312:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1313:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1221:
	cmp r15, 0
	je L_1223
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov r14, [r15]
	mov rbx,1
	mov r15,rbx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1225
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [rsp+8*17]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rdx,  [rsp+8*26]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov rax,1
	mov r14,r9
	add r14,rax
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov rax,  [rsp+8*8]
	cmp r12,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*4],rbx
	jne L_1226
	mov rbx,0
	mov r15,rbx
	jmp L_1227
	
L_1226:
	mov rbx,  [rsp+8*10]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1227:
	cmp r15, 0
	je L_1229
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1229:
	
L_1225:
	
L_1223:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	sub r15,rax
	mov r12,r15
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,2
	add r15,rbx
	mov r13,r15
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1316
	mov rbx,0
	mov r15,rbx
	jmp L_1317
	
L_1316:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1317:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1230
	mov rbx,0
	mov r15,rbx
	jmp L_1231
	
L_1230:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1320
	mov rbx,0
	mov r15,rbx
	jmp L_1321
	
L_1320:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1321:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1231:
	cmp r15, 0
	je L_1233
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	mov rbx,1
	mov r14,rbx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1235
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [rsp+8*17]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rdx,  [rsp+8*26]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov rax,1
	mov r14,r9
	add r14,rax
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov rax,  [rsp+8*8]
	cmp r12,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*4],rbx
	jne L_1236
	mov rbx,0
	mov r15,rbx
	jmp L_1237
	
L_1236:
	mov rbx,  [rsp+8*10]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1237:
	cmp r15, 0
	je L_1239
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1239:
	
L_1235:
	
L_1233:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r12,r15
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,2
	sub r15,rbx
	mov r13,r15
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1324
	mov rbx,0
	mov r15,rbx
	jmp L_1325
	
L_1324:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1325:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1240
	mov rbx,0
	mov r15,rbx
	jmp L_1241
	
L_1240:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1328
	mov rbx,0
	mov r15,rbx
	jmp L_1329
	
L_1328:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1329:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1241:
	cmp r15, 0
	je L_1243
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov r14, [r15]
	mov rbx,1
	mov r15,rbx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1245
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [rsp+8*17]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rdx,  [rsp+8*26]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov rax,1
	mov r14,r9
	add r14,rax
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov rax,  [rsp+8*8]
	cmp r12,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*4],rbx
	jne L_1246
	mov rbx,0
	mov r15,rbx
	jmp L_1247
	
L_1246:
	mov rbx,  [rsp+8*10]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1247:
	cmp r15, 0
	je L_1249
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1249:
	
L_1245:
	
L_1243:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,1
	add r15,rax
	mov r12,r15
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,2
	add r15,rbx
	mov r13,r15
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1332
	mov rbx,0
	mov r15,rbx
	jmp L_1333
	
L_1332:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1333:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1250
	mov rbx,0
	mov r15,rbx
	jmp L_1251
	
L_1250:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1336
	mov rbx,0
	mov r15,rbx
	jmp L_1337
	
L_1336:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1337:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1251:
	cmp r15, 0
	je L_1253
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	mov rbx,1
	mov r14,rbx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1255
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [rsp+8*17]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rdx,  [rsp+8*26]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov rax,1
	mov r14,r9
	add r14,rax
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov rax,  [rsp+8*8]
	cmp r12,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*4],rbx
	jne L_1256
	mov rbx,0
	mov r15,rbx
	jmp L_1257
	
L_1256:
	mov rbx,  [rsp+8*10]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1257:
	cmp r15, 0
	je L_1259
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1259:
	
L_1255:
	
L_1253:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r12,r15
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,1
	sub r15,rbx
	mov r13,r15
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1340
	mov rbx,0
	mov r15,rbx
	jmp L_1341
	
L_1340:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1341:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1260
	mov rbx,0
	mov r15,rbx
	jmp L_1261
	
L_1260:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1344
	mov rbx,0
	mov r15,rbx
	jmp L_1345
	
L_1344:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1345:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1261:
	cmp r15, 0
	je L_1263
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	mov rbx,1
	mov r14,rbx
	neg r14
	cmp r15,r14
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1265
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [rsp+8*17]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rdx,  [rsp+8*26]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov rax,1
	mov r14,r9
	add r14,rax
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov rax,  [rsp+8*8]
	cmp r12,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*4],rbx
	jne L_1266
	mov rbx,0
	mov r15,rbx
	jmp L_1267
	
L_1266:
	mov rbx,  [rsp+8*10]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1267:
	cmp r15, 0
	je L_1269
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1269:
	
L_1265:
	
L_1263:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	sub r15,rax
	mov r12,r15
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,1
	add r15,rbx
	mov r13,r15
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1348
	mov rbx,0
	mov r15,rbx
	jmp L_1349
	
L_1348:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1349:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1270
	mov rbx,0
	mov r15,rbx
	jmp L_1271
	
L_1270:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1352
	mov rbx,0
	mov r15,rbx
	jmp L_1353
	
L_1352:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1353:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1271:
	cmp r15, 0
	je L_1273
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov r14, [r15]
	mov rbx,1
	mov r15,rbx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1275
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [rsp+8*17]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rdx,  [rsp+8*26]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov rax,1
	mov r14,r9
	add r14,rax
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov rax,  [rsp+8*8]
	cmp r12,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*4],rbx
	jne L_1276
	mov rbx,0
	mov r15,rbx
	jmp L_1277
	
L_1276:
	mov rbx,  [rsp+8*10]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1277:
	cmp r15, 0
	je L_1279
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1279:
	
L_1275:
	
L_1273:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	add r15,rax
	mov r12,r15
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,1
	sub r15,rbx
	mov r13,r15
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1356
	mov rbx,0
	mov r15,rbx
	jmp L_1357
	
L_1356:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1357:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1280
	mov rbx,0
	mov r15,rbx
	jmp L_1281
	
L_1280:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1360
	mov rbx,0
	mov r15,rbx
	jmp L_1361
	
L_1360:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1361:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1281:
	cmp r15, 0
	je L_1283
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov r14, [r15]
	mov rbx,1
	mov r15,rbx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1285
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [rsp+8*17]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rdx,  [rsp+8*26]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov rax,1
	mov r14,r9
	add r14,rax
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov rax,  [rsp+8*8]
	cmp r12,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*4],rbx
	jne L_1286
	mov rbx,0
	mov r15,rbx
	jmp L_1287
	
L_1286:
	mov rbx,  [rsp+8*10]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1287:
	cmp r15, 0
	je L_1289
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1289:
	
L_1285:
	
L_1283:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rax,2
	add r15,rax
	mov r12,r15
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,1
	add r15,rbx
	mov r13,r15
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1364
	mov rbx,0
	mov r15,rbx
	jmp L_1365
	
L_1364:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1365:
	mov r15,r15
	mov r15,r15
	cmp r15, 0
	jne L_1290
	mov rbx,0
	mov r15,rbx
	jmp L_1291
	
L_1290:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdi,r13
	mov r14,rdi
	mov r15,rsi
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1368
	mov rbx,0
	mov r15,rbx
	jmp L_1369
	
L_1368:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	mov r15,r15
	
L_1369:
	mov r15,r15
	mov r15,r15
	mov r15,r15
	
L_1291:
	cmp r15, 0
	je L_1293
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov r14, [r15]
	mov rbx,1
	mov r15,rbx
	neg r15
	cmp r14,r15
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1295
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [rsp+8*17]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov [r15],r12
	mov rdx,  [rsp+8*26]
	mov r15,rdx
	lea r15,[r15+rbx*8+8H]
	mov [r15],r13
	mov qword [rsp+8*4],rbx
	mov rbx,1
	mov r14,r9
	add r14,rbx
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov rbx,  [rsp+8*8]
	cmp r12,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1296
	mov rbx,0
	mov r15,rbx
	jmp L_1297
	
L_1296:
	mov rbx,  [rsp+8*10]
	cmp r13,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1297:
	cmp r15, 0
	je L_1299
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1299:
	
L_1295:
	
L_1293:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1301
	jmp L_1219
	
L_1301:
	mov rbx,  [rsp+8*3]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov qword [rsp+8*3],rbx
	jmp L_1218
	
L_1219:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1302
	mov r15,r8
	mov rbx,  [rsp+8*8]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rdx,  [rsp+8*10]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
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
	jmp L_1303
	
L_1302:
	mov rbx,t442
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
	
L_1303:
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

