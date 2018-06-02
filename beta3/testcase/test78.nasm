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
	sub    rsp, 968
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
        sub     rdx, 2952
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rbx,110
	mov rdi,rbx
	mov r13,rdi
	mov     rdi,  r13
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
	mov r10,r15
	mov rbx,0
	mov r9,rbx
	
L_1877:
	cmp r9,r13
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1878
	mov     rdi,  r13
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
	mov r14,r10
	lea r14,[r14+r9*8+8H]
	mov [r14],r15
	mov rbx,0
	mov r8,rbx
	
L_1879:
	cmp r8,r13
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1880
	mov r15,r10
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	lea r15,[r15+r8*8+8H]
	mov rbx,0
	mov [r15],rbx
	mov r15,r8
	mov rdx,1
	add r8,rdx
	jmp L_1879
	
L_1880:
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_1877
	
L_1878:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,99
	mov r12,rdx
	mov rbx,100
	mov rax,rbx
	mov rbx,0
	mov r11,rbx
	mov rsi,rax
	mov rdi,r12
	mov rbx,rdi
	mov r14,rsi
	mov rdx,1
	mov r9,rdx
	mov qword [rsp+8*4],rbx
	mov qword [rsp+8*2],rax
	
L_1885:
	mov rbx,49
	cmp r9,rbx
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1886
	mov rbx,50
	mov r8,rbx
	
L_1887:
	mov rbx,98
	mov r15,rbx
	sub r15,r9
	mov rdx,1
	add r15,rdx
	cmp r8,r15
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1888
	mov r15,r10
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	lea r15,[r15+r8*8+8H]
	mov rbx,1
	mov [r15],rbx
	mov r15,r8
	mov rdx,1
	add r8,rdx
	jmp L_1887
	
L_1888:
	mov r15,r9
	mov rbx,1
	add r9,rbx
	jmp L_1885
	
L_1886:
	mov rbx,1
	mov r9,rbx
	
L_1891:
	mov rbx,49
	cmp r9,rbx
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1892
	mov r15,r10
	mov rbx,  [rsp+8*4]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov rdx,1
	mov [r15],rdx
	mov r15,r9
	mov rax,1
	add r9,rax
	jmp L_1891
	
L_1892:
	mov rbx,50
	mov r9,rbx
	
L_1894:
	mov rbx,98
	cmp r9,rbx
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1895
	mov r15,r10
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	lea r15,[r15+r14*8+8H]
	mov rbx,1
	mov [r15],rbx
	mov r15,r9
	mov rdx,1
	add r9,rdx
	jmp L_1894
	
L_1895:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	
L_1833:
	mov rbx,r11
	mov rsi,r12
	mov rdx,  [rsp+8*2]
	mov rdi,rdx
	mov r13,rdi
	mov rax,rsi
	mov r14,rbx
	mov qword [arg+8*2],rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*6],rax
	mov rax,1
	mov rdx,rax
	mov rax,1
	mov r9,rax
	mov qword [gbl+8*7],rbx
	mov qword [gbl+8*8],rdx
	
L_1899:
	cmp r9,r13
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1900
	mov rbx,  [gbl+8*9]
	mov r15,rbx
	lea r15,[r15+r9*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r9
	mov rax,1
	add r9,rax
	jmp L_1899
	
L_1900:
	mov rbx,  [gbl+8*10]
	mov r15,rbx
	mov rdx,1
	lea r15,[r15+rdx*8+8H]
	mov rax,  [rsp+8*6]
	mov [r15],rax
	mov rdx,  [gbl+8*9]
	mov r15,rdx
	lea r15,[r15+rax*8+8H]
	mov rbx,1
	mov [r15],rbx
	mov rbx,  [gbl+8*11]
	mov r15,rbx
	lea r15,[r15+rax*8+8H]
	mov rax,0
	mov [r15],rax
	mov rax,0
	mov r14,rax
	
L_1902:
	mov rbx,  [gbl+8*7]
	mov rdx,  [gbl+8*8]
	cmp rbx,rdx
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_1903
	mov rbx,0
	mov r15,rbx
	jmp L_1904
	
L_1903:
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_1904:
	cmp r15, 0
	je L_1905
	mov rbx,  [gbl+8*7]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov rax,  [gbl+8*10]
	mov r15,rax
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov r9,r15
	mov qword [gbl+8*7],rbx
	mov rbx,1
	mov r8,rbx
	
L_1906:
	cmp r8,r13
	mov rbx, 0
	setle bl
	cmp rbx, 0
	mov qword [rsp+8*12],rbx
	je L_1907
	mov rbx,r10
	lea rdx,[rbx+r9*8+8H]
	mov rbx, [rdx]
	lea rdx,[rbx+r8*8+8H]
	mov rax, [rdx]
	cmp rax,0
	mov qword [rsp+8*13],rbx
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*16],rbx
	mov qword [rsp+8*14],rdx
	mov qword [rsp+8*15],rax
	jne L_1908
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*16],rbx
	jmp L_1909
	
L_1908:
	mov rdx,  [gbl+8*9]
	mov rbx,rdx
	lea rax,[rbx+r8*8+8H]
	mov qword [rsp+8*17],rbx
	mov rbx, [rax]
	mov qword [rsp+8*18],rax
	mov rax,0
	cmp rbx,rax
	mov rdx, 0
	sete dl
	mov qword [rsp+8*19],rbx
	mov rbx,rdx
	mov qword [rsp+8*16],rbx
	mov qword [rsp+8*20],rdx
	
L_1909:
	mov rbx,  [rsp+8*16]
	cmp rbx, 0
	je L_1910
	mov rdx,  [gbl+8*9]
	mov rbx,rdx
	lea rax,[rbx+r8*8+8H]
	mov qword [rsp+8*21],rbx
	mov rbx,1
	mov [rax],rbx
	mov qword [rsp+8*22],rax
	mov rax,  [gbl+8*8]
	mov rbx,rax
	mov qword [rsp+8*23],rbx
	mov rbx,1
	add rax,rbx
	mov rdx,  [gbl+8*10]
	mov rbx,rdx
	lea rdx,[rbx+rax*8+8H]
	mov [rdx],r8
	mov qword [rsp+8*24],rbx
	mov qword [rsp+8*25],rdx
	mov rdx,  [gbl+8*11]
	mov rbx,rdx
	mov qword [gbl+8*8],rax
	lea rax,[rbx+r8*8+8H]
	mov [rax],r9
	mov qword [rsp+8*26],rbx
	mov rbx,  [gbl+8*8]
	cmp rbx,r13
	mov qword [rsp+8*27],rax
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*28],rax
	je L_1911
	mov rbx,1
	mov r14,rbx
	
L_1911:
	
L_1910:
	mov rbx,r8
	mov rdx,1
	add r8,rdx
	mov qword [rsp+8*29],rbx
	jmp L_1906
	
L_1907:
	jmp L_1902
	
L_1905:
	mov r15,r14
	mov r15,r15
	cmp r15,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	je L_1834
	mov rbx,  [rsp+8*2]
	mov rdi,rbx
	mov r15,rdi
	mov r9,r15
	mov rdx,  [gbl+8*30]
	mov r15,rdx
	mov rax,1
	add rdx,rax
	mov qword [gbl+8*30],rdx
	
L_1915:
	mov rbx,  [gbl+8*11]
	mov r15,rbx
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	cmp r15,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	je L_1916
	mov rbx,  [gbl+8*11]
	mov r15,rbx
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	mov r8,r15
	mov r15,r10
	lea r15,[r15+r8*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov r14, [r15]
	mov r13,r14
	mov rdx,1
	sub r14,rdx
	mov [r15],r14
	mov r15,r10
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	lea r15,[r15+r8*8+8H]
	mov r13, [r15]
	mov r14,r13
	mov rax,1
	add r13,rax
	mov [r15],r13
	mov r9,r8
	jmp L_1915
	
L_1916:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	jmp L_1833
	
L_1834:
	mov rbx,  [gbl+8*30]
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
	sub    rsp, 968
	mov rdx,0
	mov rbx,rdx
	mov qword [gbl+8*30],rbx
	mov     rdi, 110
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*31], rax
	mov rdx,  [gbl+8*31]
	mov rbx,rdx
	mov qword [gbl+8*9],rbx
	mov     rdi, 110
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*32], rax
	mov rdx,  [gbl+8*32]
	mov rbx,rdx
	mov qword [gbl+8*11],rbx
	mov     rdi, 110
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*33], rax
	mov rdx,  [gbl+8*33]
	mov rbx,rdx
	mov qword [gbl+8*10],rbx
	mov rbx,  [rsp+8*34]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   2952
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

