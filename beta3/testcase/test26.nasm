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
	mov r14 , rax
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
	mov r9,rbx
	sub r9,rax
	mov rax,r9
	mov qword [rsp+8*4],rdx
	mov rdx,1
	mov r9,rbx
	sub r9,rdx
	mov rdx,r9
	mov qword [rsp+8*8],rax
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*10],rdx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*11],rax
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*12],rbx
	mov rbx,0
	mov rax,rbx
	mov rbx,  [rsp+8*2]
	mov r14,rbx
	imul r14,rbx
	mov qword [rsp+8*13],rdx
	mov qword [rsp+8*14],rax
	mov     rdi,  r14
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r13, rax
	mov rbx,r13
	mov rdx,0
	mov r13,rdx
	mov qword [rsp+8*17],rbx
	
L_938:
	mov rbx,  [rsp+8*2]
	mov r14,rbx
	imul r14,rbx
	cmp r13,r14
	mov r14, 0
	setl r14B
	add r15,r15
	cmp r14, 0
	je L_939
	mov rbx,  [rsp+8*17]
	mov r14,rbx
	lea r8,[r14+r13*8+8H]
	mov rdx,0
	mov [r8],rdx
	mov r14,r13
	mov rax,1
	add r13,rax
	jmp L_938
	
L_939:
	mov rbx,  [rsp+8*2]
	mov r14,rbx
	imul r14,rbx
	mov     rdi,  r14
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword  r8, rax
	mov rbx,r8
	mov rdx,0
	mov r13,rdx
	mov qword [rsp+8*26],rbx
	
L_941:
	mov rbx,  [rsp+8*2]
	mov r8,rbx
	imul r8,rbx
	cmp r13,r8
	mov r8, 0
	setl r8B
	add r15,r15
	cmp r8, 0
	je L_942
	mov rbx,  [rsp+8*26]
	mov r8,rbx
	lea r14,[r8+r13*8+8H]
	mov rdx,0
	mov [r14],rdx
	mov r14,r13
	mov rax,1
	add r13,rax
	jmp L_941
	
L_942:
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
	mov rbx,r15
	mov rdx,0
	mov r13,rdx
	mov qword [rsp+8*32],rbx
	
L_944:
	mov rbx,  [rsp+8*2]
	cmp r13,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_945
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
	mov rbx,  [rsp+8*32]
	mov r8,rbx
	lea r14,[r8+r13*8+8H]
	mov [r14],r15
	mov rdx,0
	mov r15,rdx
	
L_947:
	mov rbx,  [rsp+8*2]
	cmp r15,rbx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_948
	mov rbx,1
	mov r14,rbx
	neg r14
	mov rdx,  [rsp+8*32]
	mov r8,rdx
	lea r9,[r8+r13*8+8H]
	mov r8, [r9]
	lea r9,[r8+r15*8+8H]
	mov [r9],r14
	mov r14,r15
	mov rax,1
	add r15,rax
	jmp L_947
	
L_948:
	mov r15,r13
	mov rbx,1
	add r13,rbx
	jmp L_944
	
L_945:
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,0
	lea r14,[r15+rdx*8+8H]
	mov [r14],r11
	mov rax,  [rsp+8*26]
	mov r15,rax
	mov rdx,0
	lea r14,[r15+rdx*8+8H]
	mov [r14],r10
	mov rdx,  [rsp+8*32]
	mov r15,rdx
	lea r14,[r15+r11*8+8H]
	mov r15, [r14]
	lea r14,[r15+r10*8+8H]
	mov rbx,0
	mov [r14],rbx
	
L_950:
	mov rbx,  [rsp+8*3]
	mov rdx,  [rsp+8*4]
	cmp rbx,rdx
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_951
	mov rbx,  [rsp+8*17]
	mov r15,rbx
	mov rdx,  [rsp+8*3]
	lea r14,[r15+rdx*8+8H]
	mov r15, [r14]
	mov rax,  [rsp+8*26]
	mov r14,rax
	lea r13,[r14+rdx*8+8H]
	mov r14, [r13]
	mov rbx,  [rsp+8*32]
	mov r13,rbx
	lea r11,[r13+r15*8+8H]
	mov r13, [r11]
	lea r11,[r13+r14*8+8H]
	mov r15, [r11]
	mov rax,r15
	mov rdx,  [rsp+8*17]
	mov r15,rdx
	mov rbx,  [rsp+8*3]
	lea r14,[r15+rbx*8+8H]
	mov r15, [r14]
	mov qword [rsp+8*13],rax
	mov rax,1
	mov r14,r15
	sub r14,rax
	mov rax,r14
	mov rdx,  [rsp+8*26]
	mov r15,rdx
	lea r14,[r15+rbx*8+8H]
	mov r15, [r14]
	mov qword [rsp+8*11],rax
	mov rax,2
	mov r14,r15
	sub r14,rax
	mov rax,r14
	mov rdx,  [rsp+8*2]
	mov rsi,rdx
	mov rbx,  [rsp+8*11]
	mov rdi,rbx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	mov qword [rsp+8*12],rax
	jne L_1040
	mov rbx,0
	mov r13,rbx
	jmp L_1041
	
L_1040:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1041:
	mov r10,r13
	mov r9,r10
	cmp r9, 0
	jne L_952
	mov rbx,0
	mov r9,rbx
	jmp L_953
	
L_952:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1044
	mov rbx,0
	mov r13,rbx
	jmp L_1045
	
L_1044:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1045:
	mov r10,r13
	mov r8,r10
	mov r9,r8
	
L_953:
	cmp r9, 0
	je L_955
	mov rbx,  [rsp+8*32]
	mov r9,rbx
	mov rdx,  [rsp+8*11]
	lea r8,[r9+rdx*8+8H]
	mov r9, [r8]
	mov rax,  [rsp+8*12]
	lea r8,[r9+rax*8+8H]
	mov r9, [r8]
	mov rbx,1
	mov r8,rbx
	neg r8
	cmp r9,r8
	mov r12, 0
	sete r12B
	cmp r12, 0
	je L_957
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r12,rbx
	add r12,rdx
	mov rbx,r12
	mov rax,  [rsp+8*17]
	mov r12,rax
	lea r9,[r12+rbx*8+8H]
	mov rdx,  [rsp+8*11]
	mov [r9],rdx
	mov rax,  [rsp+8*26]
	mov r12,rax
	lea r9,[r12+rbx*8+8H]
	mov rdx,  [rsp+8*12]
	mov [r9],rdx
	mov rax,  [rsp+8*13]
	mov qword [rsp+8*4],rbx
	mov rbx,1
	mov r12,rax
	add r12,rbx
	mov rbx,  [rsp+8*32]
	mov r9,rbx
	mov rdx,  [rsp+8*11]
	lea r8,[r9+rdx*8+8H]
	mov r9, [r8]
	mov rax,  [rsp+8*12]
	lea r8,[r9+rax*8+8H]
	mov [r8],r12
	mov rbx,  [rsp+8*8]
	cmp rdx,rbx
	mov r12, 0
	sete r12B
	cmp r12, 0
	jne L_958
	mov rbx,0
	mov r12,rbx
	jmp L_959
	
L_958:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov r9, 0
	sete r9B
	mov r12,r9
	
L_959:
	cmp r12, 0
	je L_961
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_961:
	
L_957:
	
L_955:
	mov rbx,  [rsp+8*17]
	mov r12,rbx
	mov rdx,  [rsp+8*3]
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov rax,1
	mov r9,r12
	sub r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*26]
	mov r12,rbx
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov qword [rsp+8*11],rax
	mov rax,2
	mov r9,r12
	add r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*11]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	mov qword [rsp+8*12],rax
	jne L_1048
	mov rbx,0
	mov r13,rbx
	jmp L_1049
	
L_1048:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1049:
	mov r10,r13
	mov r12,r10
	cmp r12, 0
	jne L_962
	mov rbx,0
	mov r12,rbx
	jmp L_963
	
L_962:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1052
	mov rbx,0
	mov r13,rbx
	jmp L_1053
	
L_1052:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1053:
	mov r10,r13
	mov r9,r10
	mov r12,r9
	
L_963:
	cmp r12, 0
	je L_965
	mov rbx,  [rsp+8*32]
	mov r12,rbx
	mov rdx,  [rsp+8*11]
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov rax,  [rsp+8*12]
	lea r9,[r12+rax*8+8H]
	mov r12, [r9]
	mov rbx,1
	mov r9,rbx
	neg r9
	cmp r12,r9
	mov r8, 0
	sete r8B
	cmp r8, 0
	je L_967
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r12,rbx
	add r12,rdx
	mov rbx,r12
	mov rax,  [rsp+8*17]
	mov r12,rax
	lea r9,[r12+rbx*8+8H]
	mov rdx,  [rsp+8*11]
	mov [r9],rdx
	mov rax,  [rsp+8*26]
	mov r12,rax
	lea r9,[r12+rbx*8+8H]
	mov rdx,  [rsp+8*12]
	mov [r9],rdx
	mov rax,  [rsp+8*13]
	mov qword [rsp+8*4],rbx
	mov rbx,1
	mov r12,rax
	add r12,rbx
	mov rbx,  [rsp+8*32]
	mov r9,rbx
	mov rdx,  [rsp+8*11]
	lea r8,[r9+rdx*8+8H]
	mov r9, [r8]
	mov rax,  [rsp+8*12]
	lea r8,[r9+rax*8+8H]
	mov [r8],r12
	mov rbx,  [rsp+8*8]
	cmp rdx,rbx
	mov r12, 0
	sete r12B
	cmp r12, 0
	jne L_968
	mov rbx,0
	mov r12,rbx
	jmp L_969
	
L_968:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov r9, 0
	sete r9B
	mov r12,r9
	
L_969:
	cmp r12, 0
	je L_971
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_971:
	
L_967:
	
L_965:
	mov rbx,  [rsp+8*17]
	mov r12,rbx
	mov rdx,  [rsp+8*3]
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov rax,1
	mov r9,r12
	add r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*26]
	mov r12,rbx
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov qword [rsp+8*11],rax
	mov rax,2
	mov r9,r12
	sub r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*11]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	mov qword [rsp+8*12],rax
	jne L_1056
	mov rbx,0
	mov r13,rbx
	jmp L_1057
	
L_1056:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1057:
	mov r10,r13
	mov r12,r10
	cmp r12, 0
	jne L_972
	mov rbx,0
	mov r12,rbx
	jmp L_973
	
L_972:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1060
	mov rbx,0
	mov r13,rbx
	jmp L_1061
	
L_1060:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1061:
	mov r10,r13
	mov r9,r10
	mov r12,r9
	
L_973:
	cmp r12, 0
	je L_975
	mov rbx,  [rsp+8*32]
	mov r12,rbx
	mov rdx,  [rsp+8*11]
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov rax,  [rsp+8*12]
	lea r9,[r12+rax*8+8H]
	mov r12, [r9]
	mov rbx,1
	mov r9,rbx
	neg r9
	cmp r12,r9
	mov r8, 0
	sete r8B
	cmp r8, 0
	je L_977
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r12,rbx
	add r12,rdx
	mov rbx,r12
	mov rax,  [rsp+8*17]
	mov r12,rax
	lea r9,[r12+rbx*8+8H]
	mov rdx,  [rsp+8*11]
	mov [r9],rdx
	mov rax,  [rsp+8*26]
	mov r12,rax
	lea r9,[r12+rbx*8+8H]
	mov rdx,  [rsp+8*12]
	mov [r9],rdx
	mov rax,  [rsp+8*13]
	mov qword [rsp+8*4],rbx
	mov rbx,1
	mov r12,rax
	add r12,rbx
	mov rbx,  [rsp+8*32]
	mov r9,rbx
	mov rdx,  [rsp+8*11]
	lea r8,[r9+rdx*8+8H]
	mov r9, [r8]
	mov rax,  [rsp+8*12]
	lea r8,[r9+rax*8+8H]
	mov [r8],r12
	mov rbx,  [rsp+8*8]
	cmp rdx,rbx
	mov r12, 0
	sete r12B
	cmp r12, 0
	jne L_978
	mov rbx,0
	mov r12,rbx
	jmp L_979
	
L_978:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov r9, 0
	sete r9B
	mov r12,r9
	
L_979:
	cmp r12, 0
	je L_981
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_981:
	
L_977:
	
L_975:
	mov rbx,  [rsp+8*17]
	mov r12,rbx
	mov rdx,  [rsp+8*3]
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov rax,1
	mov r9,r12
	add r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*26]
	mov r12,rbx
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov qword [rsp+8*11],rax
	mov rax,2
	mov r9,r12
	add r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*11]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	mov qword [rsp+8*12],rax
	jne L_1064
	mov rbx,0
	mov r13,rbx
	jmp L_1065
	
L_1064:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1065:
	mov r10,r13
	mov r12,r10
	cmp r12, 0
	jne L_982
	mov rbx,0
	mov r12,rbx
	jmp L_983
	
L_982:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1068
	mov rbx,0
	mov r13,rbx
	jmp L_1069
	
L_1068:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1069:
	mov r10,r13
	mov r9,r10
	mov r12,r9
	
L_983:
	cmp r12, 0
	je L_985
	mov rbx,  [rsp+8*32]
	mov r12,rbx
	mov rdx,  [rsp+8*11]
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov rax,  [rsp+8*12]
	lea r9,[r12+rax*8+8H]
	mov r12, [r9]
	mov rbx,1
	mov r9,rbx
	neg r9
	cmp r12,r9
	mov r8, 0
	sete r8B
	cmp r8, 0
	je L_987
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r12,rbx
	add r12,rdx
	mov rbx,r12
	mov rax,  [rsp+8*17]
	mov r12,rax
	lea r9,[r12+rbx*8+8H]
	mov rdx,  [rsp+8*11]
	mov [r9],rdx
	mov rax,  [rsp+8*26]
	mov r12,rax
	lea r9,[r12+rbx*8+8H]
	mov rdx,  [rsp+8*12]
	mov [r9],rdx
	mov rax,  [rsp+8*13]
	mov qword [rsp+8*4],rbx
	mov rbx,1
	mov r12,rax
	add r12,rbx
	mov rbx,  [rsp+8*32]
	mov r9,rbx
	mov rdx,  [rsp+8*11]
	lea r8,[r9+rdx*8+8H]
	mov r9, [r8]
	mov rax,  [rsp+8*12]
	lea r8,[r9+rax*8+8H]
	mov [r8],r12
	mov rbx,  [rsp+8*8]
	cmp rdx,rbx
	mov r12, 0
	sete r12B
	cmp r12, 0
	jne L_988
	mov rbx,0
	mov r12,rbx
	jmp L_989
	
L_988:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov r9, 0
	sete r9B
	mov r12,r9
	
L_989:
	cmp r12, 0
	je L_991
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_991:
	
L_987:
	
L_985:
	mov rbx,  [rsp+8*17]
	mov r12,rbx
	mov rdx,  [rsp+8*3]
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov rax,2
	mov r9,r12
	sub r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*26]
	mov r12,rbx
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov qword [rsp+8*11],rax
	mov rax,1
	mov r9,r12
	sub r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*11]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	mov qword [rsp+8*12],rax
	jne L_1072
	mov rbx,0
	mov r13,rbx
	jmp L_1073
	
L_1072:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1073:
	mov r10,r13
	mov r12,r10
	cmp r12, 0
	jne L_992
	mov rbx,0
	mov r12,rbx
	jmp L_993
	
L_992:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1076
	mov rbx,0
	mov r13,rbx
	jmp L_1077
	
L_1076:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1077:
	mov r10,r13
	mov r9,r10
	mov r12,r9
	
L_993:
	cmp r12, 0
	je L_995
	mov rbx,  [rsp+8*32]
	mov r12,rbx
	mov rdx,  [rsp+8*11]
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov rax,  [rsp+8*12]
	lea r9,[r12+rax*8+8H]
	mov r12, [r9]
	mov rbx,1
	mov r9,rbx
	neg r9
	cmp r12,r9
	mov r8, 0
	sete r8B
	cmp r8, 0
	je L_997
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r12,rbx
	add r12,rdx
	mov rbx,r12
	mov rax,  [rsp+8*17]
	mov r12,rax
	lea r9,[r12+rbx*8+8H]
	mov rdx,  [rsp+8*11]
	mov [r9],rdx
	mov rax,  [rsp+8*26]
	mov r12,rax
	lea r9,[r12+rbx*8+8H]
	mov rdx,  [rsp+8*12]
	mov [r9],rdx
	mov rax,  [rsp+8*13]
	mov qword [rsp+8*4],rbx
	mov rbx,1
	mov r12,rax
	add r12,rbx
	mov rbx,  [rsp+8*32]
	mov r9,rbx
	mov rdx,  [rsp+8*11]
	lea r8,[r9+rdx*8+8H]
	mov r9, [r8]
	mov rax,  [rsp+8*12]
	lea r8,[r9+rax*8+8H]
	mov [r8],r12
	mov rbx,  [rsp+8*8]
	cmp rdx,rbx
	mov r12, 0
	sete r12B
	cmp r12, 0
	jne L_998
	mov rbx,0
	mov r12,rbx
	jmp L_999
	
L_998:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov r9, 0
	sete r9B
	mov r12,r9
	
L_999:
	cmp r12, 0
	je L_1001
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1001:
	
L_997:
	
L_995:
	mov rbx,  [rsp+8*17]
	mov r12,rbx
	mov rdx,  [rsp+8*3]
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov rax,2
	mov r9,r12
	sub r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*26]
	mov r12,rbx
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov qword [rsp+8*11],rax
	mov rax,1
	mov r9,r12
	add r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*11]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	mov qword [rsp+8*12],rax
	jne L_1080
	mov rbx,0
	mov r13,rbx
	jmp L_1081
	
L_1080:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1081:
	mov r10,r13
	mov r12,r10
	cmp r12, 0
	jne L_1002
	mov rbx,0
	mov r12,rbx
	jmp L_1003
	
L_1002:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1084
	mov rbx,0
	mov r13,rbx
	jmp L_1085
	
L_1084:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1085:
	mov r10,r13
	mov r9,r10
	mov r12,r9
	
L_1003:
	cmp r12, 0
	je L_1005
	mov rbx,  [rsp+8*32]
	mov r12,rbx
	mov rdx,  [rsp+8*11]
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov rax,  [rsp+8*12]
	lea r9,[r12+rax*8+8H]
	mov r12, [r9]
	mov rbx,1
	mov r9,rbx
	neg r9
	cmp r12,r9
	mov r8, 0
	sete r8B
	cmp r8, 0
	je L_1007
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r12,rbx
	add r12,rdx
	mov rbx,r12
	mov rax,  [rsp+8*17]
	mov r12,rax
	lea r9,[r12+rbx*8+8H]
	mov rdx,  [rsp+8*11]
	mov [r9],rdx
	mov rax,  [rsp+8*26]
	mov r12,rax
	lea r9,[r12+rbx*8+8H]
	mov rdx,  [rsp+8*12]
	mov [r9],rdx
	mov rax,  [rsp+8*13]
	mov qword [rsp+8*4],rbx
	mov rbx,1
	mov r12,rax
	add r12,rbx
	mov rbx,  [rsp+8*32]
	mov r9,rbx
	mov rdx,  [rsp+8*11]
	lea r8,[r9+rdx*8+8H]
	mov r9, [r8]
	mov rax,  [rsp+8*12]
	lea r8,[r9+rax*8+8H]
	mov [r8],r12
	mov rbx,  [rsp+8*8]
	cmp rdx,rbx
	mov r12, 0
	sete r12B
	cmp r12, 0
	jne L_1008
	mov rbx,0
	mov r12,rbx
	jmp L_1009
	
L_1008:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov r9, 0
	sete r9B
	mov r12,r9
	
L_1009:
	cmp r12, 0
	je L_1011
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1011:
	
L_1007:
	
L_1005:
	mov rbx,  [rsp+8*17]
	mov r12,rbx
	mov rdx,  [rsp+8*3]
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov rax,2
	mov r9,r12
	add r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*26]
	mov r12,rbx
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov qword [rsp+8*11],rax
	mov rax,1
	mov r9,r12
	sub r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*11]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	mov qword [rsp+8*12],rax
	jne L_1088
	mov rbx,0
	mov r13,rbx
	jmp L_1089
	
L_1088:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1089:
	mov r10,r13
	mov r12,r10
	cmp r12, 0
	jne L_1012
	mov rbx,0
	mov r12,rbx
	jmp L_1013
	
L_1012:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1092
	mov rbx,0
	mov r13,rbx
	jmp L_1093
	
L_1092:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1093:
	mov r10,r13
	mov r9,r10
	mov r12,r9
	
L_1013:
	cmp r12, 0
	je L_1015
	mov rbx,  [rsp+8*32]
	mov r12,rbx
	mov rdx,  [rsp+8*11]
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov rax,  [rsp+8*12]
	lea r9,[r12+rax*8+8H]
	mov r12, [r9]
	mov rbx,1
	mov r9,rbx
	neg r9
	cmp r12,r9
	mov r8, 0
	sete r8B
	cmp r8, 0
	je L_1017
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r12,rbx
	add r12,rdx
	mov rbx,r12
	mov rax,  [rsp+8*17]
	mov r12,rax
	lea r9,[r12+rbx*8+8H]
	mov rdx,  [rsp+8*11]
	mov [r9],rdx
	mov rax,  [rsp+8*26]
	mov r12,rax
	lea r9,[r12+rbx*8+8H]
	mov rdx,  [rsp+8*12]
	mov [r9],rdx
	mov rax,  [rsp+8*13]
	mov qword [rsp+8*4],rbx
	mov rbx,1
	mov r12,rax
	add r12,rbx
	mov rbx,  [rsp+8*32]
	mov r9,rbx
	mov rdx,  [rsp+8*11]
	lea r8,[r9+rdx*8+8H]
	mov r9, [r8]
	mov rax,  [rsp+8*12]
	lea r8,[r9+rax*8+8H]
	mov [r8],r12
	mov rbx,  [rsp+8*8]
	cmp rdx,rbx
	mov r12, 0
	sete r12B
	cmp r12, 0
	jne L_1018
	mov rbx,0
	mov r12,rbx
	jmp L_1019
	
L_1018:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov r9, 0
	sete r9B
	mov r12,r9
	
L_1019:
	cmp r12, 0
	je L_1021
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1021:
	
L_1017:
	
L_1015:
	mov rbx,  [rsp+8*17]
	mov r12,rbx
	mov rdx,  [rsp+8*3]
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov rax,2
	mov r9,r12
	add r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*26]
	mov r12,rbx
	lea r9,[r12+rdx*8+8H]
	mov r12, [r9]
	mov qword [rsp+8*11],rax
	mov rax,1
	mov r9,r12
	add r9,rax
	mov rax,r9
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*11]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	mov qword [rsp+8*12],rax
	jne L_1096
	mov rbx,0
	mov r13,rbx
	jmp L_1097
	
L_1096:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1097:
	mov r10,r13
	mov r12,r10
	cmp r12, 0
	jne L_1022
	mov rbx,0
	mov r12,rbx
	jmp L_1023
	
L_1022:
	mov rbx,  [rsp+8*2]
	mov rsi,rbx
	mov rdx,  [rsp+8*12]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	cmp r15,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	jne L_1100
	mov rbx,0
	mov r13,rbx
	jmp L_1101
	
L_1100:
	mov rbx,0
	cmp r15,rbx
	mov r11, 0
	setge r11B
	mov r13,r11
	
L_1101:
	mov r10,r13
	mov r15,r10
	mov r12,r15
	
L_1023:
	cmp r12, 0
	je L_1025
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	mov rdx,  [rsp+8*11]
	lea r14,[r15+rdx*8+8H]
	mov r15, [r14]
	mov rax,  [rsp+8*12]
	lea r14,[r15+rax*8+8H]
	mov r15, [r14]
	mov rbx,1
	mov r14,rbx
	neg r14
	cmp r15,r14
	mov r13, 0
	sete r13B
	cmp r13, 0
	je L_1027
	mov rbx,  [rsp+8*4]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov rax,  [rsp+8*17]
	mov r15,rax
	lea r14,[r15+rbx*8+8H]
	mov rdx,  [rsp+8*11]
	mov [r14],rdx
	mov rax,  [rsp+8*26]
	mov r15,rax
	lea r14,[r15+rbx*8+8H]
	mov qword [rsp+8*4],rbx
	mov rbx,  [rsp+8*12]
	mov [r14],rbx
	mov rax,  [rsp+8*13]
	mov rdx,1
	mov r15,rax
	add r15,rdx
	mov rdx,  [rsp+8*32]
	mov r14,rdx
	mov rax,  [rsp+8*11]
	lea r13,[r14+rax*8+8H]
	mov r14, [r13]
	lea r13,[r14+rbx*8+8H]
	mov [r13],r15
	mov rdx,  [rsp+8*8]
	cmp rax,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_1028
	mov rbx,0
	mov r15,rbx
	jmp L_1029
	
L_1028:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*10]
	cmp rbx,rdx
	mov r14, 0
	sete r14B
	mov r15,r14
	
L_1029:
	cmp r15, 0
	je L_1031
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_1031:
	
L_1027:
	
L_1025:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1033
	jmp L_951
	
L_1033:
	mov rbx,  [rsp+8*3]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov qword [rsp+8*3],rbx
	jmp L_950
	
L_951:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1034
	mov rbx,  [rsp+8*32]
	mov r15,rbx
	mov rdx,  [rsp+8*8]
	lea r14,[r15+rdx*8+8H]
	mov r15, [r14]
	mov rax,  [rsp+8*10]
	lea r14,[r15+rax*8+8H]
	mov r15, [r14]
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
	mov     qword r14, rax
	mov rdi,r14
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
	jmp L_1035
	
L_1034:
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
	
L_1035:
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

