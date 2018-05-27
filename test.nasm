	 global    main
	 extern    puts
	 extern    printf
	 extern    scanf
	 extern    malloc
	 extern    calloc
	 extern    strlen
	 extern    strcmp
	 extern    memset

	 section   .text
toString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     qword [rbp-38H], rdi
        mov     qword [rbp-8H], 0
        mov     qword [rbp-10H], 1
        cmp     qword [rbp-38H], 0
        jnz     DD13
        mov     qword [rbp-8H], 1
DD13:  cmp     qword [rbp-38H], 0
        jns     DD14
        neg     qword [rbp-38H]
        mov     qword [rbp-10H], -1
        add     qword [rbp-8H], 1
DD14:  mov     rax, qword [rbp-38H]
        mov     qword [rbp-18H], rax
        jmp     DD16

DD15:  add     qword [rbp-8H], 1
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
DD16:  cmp     qword [rbp-18H], 0
        jg      DD15
        mov     rax, qword [rbp-8H]
        add     rax, 2
        mov     rdi, rax
        call    malloc
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
        jnz     DD17
        mov     rax, qword [rbp-20H]
        mov     byte [rax], 45
DD17:  mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-28H]
        add     rax, rdx
        mov     qword [rbp-20H], rax
        cmp     qword [rbp-38H], 0
        jnz     DD19
        mov     rax, qword [rbp-20H]
        mov     byte [rax], 48
        jmp     DD19

DD18:  mov     rcx, qword [rbp-38H]
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
DD19:  cmp     qword [rbp-38H], 0
        jg      DD18
        mov     rax, qword [rbp-28H]
        leave
        ret

mallocArray:
        push    rbx
        mov     rbx, rdi
        lea     rdi, [rdi*8+8H]
        mov     esi, 1
        call    calloc
        mov     qword [rax], rbx
        pop     rbx
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
        call    malloc
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
        jmp     DD2

DD1:  add     qword [rbp-10H], 1
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
DD2:  mov     rax, qword [rbp-28H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      DD1
        mov     qword [rbp-8H], 0
        jmp     DD4

DD3:  add     qword [rbp-10H], 1
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
DD4:  mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      DD3
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
        jnz     L_009
        mov     eax, dword [rbp-34H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-40H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     rdi, rax
        call    mallocArray
        jmp     L_012

L_009:  mov     eax, dword [rbp-34H]
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
        jmp     L_011

L_010:  mov     eax, dword [rbp-14H]
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
L_011:  mov     eax, dword [rbp-14H]
        cdqe
        cmp     rax, qword [rbp-20H]
        jl      L_010
        mov     rax, qword [rbp-28H]
L_012:  add     rsp, 56
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
	sub    rsp, 640
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 2624
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	push r14
	push r13
	push r12
	call global_init
	pop r12
	pop r13
	pop r14
	pop r15
	mov r15 , rax
	mov r8,17
	mov r14,r8
	mov r9,1
	mov r13,r9
	
L_0:
	cmp r13,r14
	mov r8, 0
	setle r8B
	cmp r8, 0
	mov qword [rsp+8*4],r8
	je L_1
	mov r8,1
	mov r12,r8
	
L_3:
	cmp r12,r14
	mov r8, 0
	setle r8B
	cmp r8, 0
	mov qword [rsp+8*6],r8
	je L_4
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*7],r8
	
L_6:
	mov r8,  [rsp+8*7]
	cmp r8,r14
	mov r9, 0
	setle r9B
	cmp r9, 0
	mov qword [rsp+8*8],r9
	je L_7
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*9],r8
	
L_9:
	mov r8,  [rsp+8*9]
	cmp r8,r14
	mov r9, 0
	setle r9B
	cmp r9, 0
	mov qword [rsp+8*10],r9
	je L_10
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*11],r8
	
L_12:
	mov r8,  [rsp+8*11]
	cmp r8,r14
	mov r9, 0
	setle r9B
	cmp r9, 0
	mov qword [rsp+8*12],r9
	je L_13
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*13],r8
	
L_15:
	mov r8,  [rsp+8*13]
	cmp r8,r14
	mov r9, 0
	setle r9B
	cmp r9, 0
	mov qword [rsp+8*14],r9
	je L_16
	cmp r13,r12
	mov r8, 0
	setne r8B
	cmp r8, 0
	mov qword [rsp+8*15],r8
	jne L_18
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_19
	
L_18:
	mov r8,  [rsp+8*7]
	cmp r13,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*16],r9
	mov qword [rsp+8*15],r10
	
L_19:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_20
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_21
	
L_20:
	mov r8,  [rsp+8*9]
	cmp r13,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*17],r9
	mov qword [rsp+8*15],r10
	
L_21:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_22
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_23
	
L_22:
	mov r8,  [rsp+8*11]
	cmp r13,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*18],r9
	mov qword [rsp+8*15],r10
	
L_23:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_24
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_25
	
L_24:
	mov r8,  [rsp+8*13]
	cmp r13,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*15],r10
	
L_25:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_26
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_27
	
L_26:
	mov r8,  [gbl+8*20]
	cmp r13,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*21],r9
	mov qword [rsp+8*15],r10
	
L_27:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_28
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_29
	
L_28:
	mov r8,  [gbl+8*22]
	cmp r13,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*23],r9
	mov qword [rsp+8*15],r10
	
L_29:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_30
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_31
	
L_30:
	mov r8,  [gbl+8*24]
	cmp r13,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*15],r10
	
L_31:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_32
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_33
	
L_32:
	mov r8,  [gbl+8*26]
	cmp r13,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*27],r9
	mov qword [rsp+8*15],r10
	
L_33:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_34
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_35
	
L_34:
	mov r8,  [rsp+8*7]
	cmp r12,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*15],r10
	
L_35:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_36
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_37
	
L_36:
	mov r8,  [rsp+8*9]
	cmp r12,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*29],r9
	mov qword [rsp+8*15],r10
	
L_37:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_38
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_39
	
L_38:
	mov r8,  [rsp+8*11]
	cmp r12,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*15],r10
	
L_39:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_40
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_41
	
L_40:
	mov r8,  [rsp+8*13]
	cmp r12,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*15],r10
	
L_41:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_42
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_43
	
L_42:
	mov r8,  [gbl+8*20]
	cmp r12,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*32],r9
	mov qword [rsp+8*15],r10
	
L_43:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_44
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_45
	
L_44:
	mov r8,  [gbl+8*22]
	cmp r12,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*33],r9
	mov qword [rsp+8*15],r10
	
L_45:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_46
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_47
	
L_46:
	mov r8,  [gbl+8*24]
	cmp r12,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*34],r9
	mov qword [rsp+8*15],r10
	
L_47:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_48
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_49
	
L_48:
	mov r8,  [gbl+8*26]
	cmp r12,r8
	mov r9, 0
	setne r9B
	mov r10,r9
	mov qword [rsp+8*35],r9
	mov qword [rsp+8*15],r10
	
L_49:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_50
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_51
	
L_50:
	mov r8,  [rsp+8*7]
	mov r9,  [rsp+8*9]
	cmp r8,r9
	mov r10, 0
	setne r10B
	mov r11,r10
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*15],r11
	
L_51:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_52
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_53
	
L_52:
	mov r8,  [rsp+8*7]
	mov r9,  [rsp+8*11]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_53:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_54
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_55
	
L_54:
	mov r8,  [rsp+8*7]
	mov r9,  [rsp+8*13]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_55:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_56
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_57
	
L_56:
	mov r8,  [rsp+8*7]
	mov r9,  [gbl+8*20]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_57:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_58
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_59
	
L_58:
	mov r8,  [rsp+8*7]
	mov r9,  [gbl+8*22]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_59:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_60
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_61
	
L_60:
	mov r8,  [rsp+8*7]
	mov r9,  [gbl+8*24]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_61:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_62
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_63
	
L_62:
	mov r8,  [rsp+8*7]
	mov r9,  [gbl+8*26]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_63:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_64
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_65
	
L_64:
	mov r8,  [rsp+8*9]
	mov r9,  [rsp+8*11]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_65:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_66
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_67
	
L_66:
	mov r8,  [rsp+8*9]
	mov r9,  [rsp+8*13]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_67:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_68
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_69
	
L_68:
	mov r8,  [rsp+8*9]
	mov r9,  [gbl+8*20]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_69:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_70
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_71
	
L_70:
	mov r8,  [rsp+8*9]
	mov r9,  [gbl+8*22]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_71:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_72
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_73
	
L_72:
	mov r8,  [rsp+8*9]
	mov r9,  [gbl+8*24]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_73:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_74
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_75
	
L_74:
	mov r8,  [rsp+8*9]
	mov r9,  [gbl+8*26]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_75:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_76
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_77
	
L_76:
	mov r8,  [rsp+8*11]
	mov r9,  [rsp+8*13]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_77:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_78
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_79
	
L_78:
	mov r8,  [rsp+8*11]
	mov r9,  [gbl+8*20]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_79:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_80
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_81
	
L_80:
	mov r8,  [rsp+8*11]
	mov r9,  [gbl+8*22]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_81:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_82
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_83
	
L_82:
	mov r8,  [rsp+8*11]
	mov r9,  [gbl+8*24]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_83:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_84
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_85
	
L_84:
	mov r8,  [rsp+8*11]
	mov r9,  [gbl+8*26]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_85:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_86
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_87
	
L_86:
	mov r8,  [rsp+8*13]
	mov r9,  [gbl+8*20]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_87:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_88
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_89
	
L_88:
	mov r8,  [rsp+8*13]
	mov r9,  [gbl+8*22]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_89:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_90
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_91
	
L_90:
	mov r8,  [rsp+8*13]
	mov r9,  [gbl+8*24]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_91:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_92
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_93
	
L_92:
	mov r8,  [rsp+8*13]
	mov r9,  [gbl+8*26]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_93:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_94
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_95
	
L_94:
	mov r8,  [gbl+8*22]
	mov r9,  [gbl+8*24]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_95:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	jne L_96
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	jmp L_97
	
L_96:
	mov r8,  [gbl+8*20]
	mov r9,  [gbl+8*26]
	cmp r8,r9
	mov r15, 0
	setne r15B
	mov r10,r15
	mov qword [rsp+8*15],r10
	
L_97:
	mov r8,  [rsp+8*15]
	cmp r8, 0
	je L_99
	mov r8,  [gbl+8*60]
	mov r15,r8
	mov r9,1
	add r8,r9
	mov qword [gbl+8*60],r8
	
L_99:
	mov r9,  [rsp+8*13]
	mov r8,r9
	mov r10,1
	add r9,r10
	mov qword [rsp+8*62],r8
	mov qword [rsp+8*13],r9
	jmp L_15
	
L_16:
	mov r9,  [rsp+8*11]
	mov r8,r9
	mov r10,1
	add r9,r10
	mov qword [rsp+8*63],r8
	mov qword [rsp+8*11],r9
	jmp L_12
	
L_13:
	mov r9,  [rsp+8*9]
	mov r8,r9
	mov r10,1
	add r9,r10
	mov qword [rsp+8*64],r8
	mov qword [rsp+8*9],r9
	jmp L_9
	
L_10:
	mov r9,  [rsp+8*7]
	mov r8,r9
	mov r10,1
	add r9,r10
	mov qword [rsp+8*65],r8
	mov qword [rsp+8*7],r9
	jmp L_6
	
L_7:
	mov r8,r12
	mov r9,1
	add r12,r9
	mov qword [rsp+8*66],r8
	jmp L_3
	
L_4:
	mov r8,r13
	mov r9,1
	add r13,r9
	mov qword [rsp+8*67],r8
	jmp L_0
	
L_1:
	mov r9,  [gbl+8*60]
	mov r8,r9
	mov r15,r8
	mov qword rdi,r8
	mov     rdi,  r15
	call    toString
	mov     qword r15, rax
	mov r8,r15
	mov r15,r8
	mov qword rdi,r8
	mov rdi, r15 
	add rdi, 1 
	call puts
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 640
	mov r9,99
	mov r8,r9
	mov r11,100
	mov r10,r11
	mov qword [gbl+8*20],r8
	mov r9,101
	mov r8,r9
	mov qword [gbl+8*24],r8
	mov r9,102
	mov r8,r9
	mov qword [gbl+8*26],r8
	mov r9,0
	mov r8,r9
	mov qword [gbl+8*60],r8
	mov qword [gbl+8*22],r10
	mov r8,  [rsp+8*72]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   2624
buff.1788:
        resb    256
arg:
        resb    1024

trsp:         resb   1024
	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	
GS_31:
	db 25H, 6CH, 64H, 00H
	
GS_32:
	db 25H, 73H, 00H
	

