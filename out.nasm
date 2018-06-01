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
	inc rax
        shl     rax, 3
        mov     rdi, rax
        call    myalloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-18H]
	inc rax
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
	inc eax
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
	inc eax
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
	inc rax
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
	inc rax
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
	inc rax
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
	inc rax
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
	inc rax
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
	inc rax
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        setne   al
        movzx   eax, al
        leave
        ret


shift_l:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 672
	mov r14,rdi
	mov r15,rsi
	mov r15,r14
	mov rcx,r15
	shl r15,cl
	mov rbx,65535
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	push r15
	push r14
	call hilo
	pop r14
	pop r15
	mov r14 , rax
	and r15,r14
	mov rax,r15
	leave
	ret
	
hilo:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 672
	mov r14,rdi
	mov r15,rsi
	mov rcx,16
	shl r14,cl
	or r14,r15
	mov rax,r14
	leave
	ret
	
shift_r:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 672
	mov r14,rdi
	mov r13,rsi
	mov rbx,65536
	mov rsi,rbx
	mov rdx,32767
	mov rdi,rdx
	push r15
	push r14
	push r13
	call hilo
	pop r13
	pop r14
	pop r15
	mov r15 , rax
	mov rcx,r13
	shr r15,cl
	mov rbx,1
	mov rdx,1
	mov r12,rbx
	add r12,rdx
	mov rcx,r12
	shl r15,cl
	mov rax,1
	add r15,rax
	mov rcx,r13
	shr r14,cl
	and r15,r14
	mov rbx,65535
	mov rsi,rbx
	mov rbx,32767
	mov rdi,rbx
	push r15
	push r14
	call hilo
	pop r14
	pop r15
	mov r14 , rax
	and r15,r14
	mov rax,r15
	leave
	ret
	
xorshift:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 672
	mov r13,rdi
	mov r14,rsi
	mov rbx,1
	add r13,rbx
	mov r12,r13
	mov rdx,0
	mov r13,rdx
	
L_0:
	mov rbx,10
	mov r11,r14
	imul r11,rbx
	cmp r13,r11
	mov r11, 0
	setl r11B
	add r15,r15
	cmp r11, 0
	je L_1
	mov rbx,13
	mov rsi,rbx
	mov rdi,r12
	push r15
	push r14
	push r13
	push r12
	push r11
	call shift_l
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov r11 , rax
	xor r12,r11
	mov rbx,17
	mov rsi,rbx
	mov rdi,r12
	push r15
	push r14
	push r13
	push r12
	push r11
	call shift_r
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov r11 , rax
	xor r12,r11
	mov rbx,5
	mov rsi,rbx
	mov rdi,r12
	push r15
	push r14
	push r13
	push r12
	push r11
	call shift_l
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov r11 , rax
	xor r12,r11
	mov r11,r13
	mov rbx,1
	add r13,rbx
	jmp L_0
	
L_1:
	mov rbx,123456789
	mov r15,r12
	xor r15,rbx
	mov rax,r15
	leave
	ret
	
main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 672
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
        sub     rdx, 2656
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
	push r11
	push r10
	push r9
	push r8
	call    getInt
	pop r8
	pop r9
	pop r10
	pop r11
	mov      r14, rax
	mov     rdi, 2
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
	mov rbx,0
	lea r12,[r13+rbx*8+8H]
	mov [r12],r14
	mov rdx,1
	lea r12,[r13+rdx*8+8H]
	mov [r12],r14
	mov     rdi,  r13
	call    multiArray
	mov     qword  r13, rax
	mov rbx,0
	mov r12,rbx
	
L_3:
	cmp r12,r14
	mov r11, 0
	setl r11B
	cmp r11, 0
	je L_4
	mov rbx,0
	mov r11,rbx
	
L_6:
	cmp r11,r14
	mov r10, 0
	setl r10B
	cmp r10, 0
	je L_7
	mov rbx,0
	mov r10,rbx
	
L_9:
	cmp r10,r14
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_10
	cmp r12,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	jne L_12
	mov rbx,0
	mov r9,rbx
	jmp L_13
	
L_12:
	cmp r11,0
	mov r9, 0
	setg r9B
	
L_13:
	cmp r9, 0
	jne L_14
	mov rbx,0
	mov r9,rbx
	jmp L_15
	
L_14:
	cmp r10,0
	mov r9, 0
	setg r9B
	
L_15:
	cmp r9, 0
	je L_17
	xor rdx, rdx
	mov rax,  r12
	mov rbx,  r11
	cdq
	idiv ebx
	mov  r9, rdx
	xor rdx, rdx
	mov rax,  r11
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r8, rdx
	cmp r9,r8
	mov r9, 0
	setne r9B
	cmp r9, 0
	jne L_18
	mov rbx,0
	mov r9,rbx
	jmp L_19
	
L_18:
	xor rdx, rdx
	mov rax,  r11
	mov rbx,  r10
	cdq
	idiv ebx
	mov  r9, rdx
	xor rdx, rdx
	mov rax,  r10
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r8, rdx
	cmp r9,r8
	mov r9, 0
	setne r9B
	
L_19:
	cmp r9, 0
	jne L_20
	mov rbx,0
	mov r9,rbx
	jmp L_21
	
L_20:
	xor rdx, rdx
	mov rax,  r12
	mov rbx,  r11
	cdq
	idiv ebx
	mov  r9, rdx
	xor rdx, rdx
	mov rax,  r10
	mov rbx,  r12
	cdq
	idiv ebx
	mov  r8, rdx
	cmp r9,r8
	mov r9, 0
	setne r9B
	
L_21:
	cmp r9, 0
	je L_23
	mov r9,r12
	and r9,r11
	and r9,r10
	mov r8,r12
	add r8,r11
	add r8,r10
	mov rsi,r8
	mov rdi,r9
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	call xorshift
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov r9 , rax
	mov r8,r13
	lea r8,[r8+r12*8+8H]
	mov r8, [r8]
	lea r8,[r8+r11*8+8H]
	mov [r8],r9
	
L_23:
	
L_17:
	mov rbx,1
	add r10,rbx
	jmp L_9
	
L_10:
	mov rbx,1
	add r11,rbx
	jmp L_6
	
L_7:
	mov rbx,1
	add r12,rbx
	jmp L_3
	
L_4:
	mov rbx,0
	mov r15,rbx
	mov rdx,0
	mov r12,rdx
	
L_24:
	cmp r12,r14
	mov r11, 0
	setl r11B
	cmp r11, 0
	je L_25
	mov rbx,0
	mov r11,rbx
	
L_27:
	cmp r11,r14
	mov r10, 0
	setl r10B
	cmp r10, 0
	je L_28
	mov rbx,0
	mov r10,rbx
	
L_30:
	cmp r10,r14
	mov r9, 0
	setl r9B
	cmp r9, 0
	je L_31
	cmp r12,r11
	mov r9, 0
	setge r9B
	cmp r9, 0
	jne L_33
	mov rbx,0
	mov r9,rbx
	jmp L_34
	
L_33:
	cmp r11,r10
	mov r9, 0
	setge r9B
	
L_34:
	cmp r9, 0
	je L_36
	mov r9,r13
	lea r9,[r9+r12*8+8H]
	mov r9, [r9]
	lea r9,[r9+r11*8+8H]
	mov r9, [r9]
	add r15,r9
	mov rbx,1
	mov r9,rbx
	mov rcx,30
	shl r9,cl
	mov rdx,1
	sub r9,rdx
	and r15,r9
	
L_36:
	mov rbx,1
	add r10,rbx
	jmp L_30
	
L_31:
	mov rbx,1
	add r11,rbx
	jmp L_27
	
L_28:
	mov rbx,1
	add r12,rbx
	jmp L_24
	
L_25:
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
	mov     rsi,  r15
	mov     rdi, t175
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
	inc rdi
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
	sub    rsp, 672
	mov rbx,  [rsp+8*76]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   2656
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

t175:
	 db 7,"Ans is " ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

