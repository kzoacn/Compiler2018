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
	sub    rsp, 720
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 2704
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
	mov r9,14
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*2],r8
	mov qword [rsp+8*4],r9
	mov qword [rsp+8*3],r10
	
L_2720:
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*5],r10
	je L_2721
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*6],r8
	
L_2723:
	mov r8,  [rsp+8*6]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*7],r10
	je L_2724
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*8],r8
	
L_2726:
	mov r8,  [rsp+8*8]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*9],r10
	je L_2727
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*10],r8
	
L_2729:
	mov r8,  [rsp+8*10]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*11],r10
	je L_2730
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*12],r8
	
L_2732:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*13],r10
	je L_2733
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_2735:
	mov r8,  [rsp+8*14]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*15],r10
	je L_2736
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*16],r8
	
L_2738:
	mov r8,  [rsp+8*16]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*17],r10
	je L_2739
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*6]
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*18],r10
	jne L_2741
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*18],r8
	jmp L_2742
	
L_2741:
	mov r8,  [rsp+8*8]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	
L_2742:
	mov r8,  [rsp+8*18]
	cmp r8, 0
	je L_2747
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*18],r8
	jmp L_2748
	
L_2747:
	mov r8,  [rsp+8*10]
	mov r9,  [rsp+8*12]
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*20],r10
	jne L_2743
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*20],r8
	jmp L_2744
	
L_2743:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*21],r9
	mov qword [rsp+8*20],r10
	
L_2744:
	mov r8,  [rsp+8*20]
	cmp r8, 0
	jne L_2745
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*20],r8
	jmp L_2746
	
L_2745:
	mov r8,  [rsp+8*16]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*22],r9
	mov qword [rsp+8*20],r10
	
L_2746:
	mov r9,  [rsp+8*20]
	mov r8,r9
	mov qword [rsp+8*18],r8
	
L_2748:
	mov r8,  [rsp+8*18]
	cmp r8, 0
	je L_2749
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*18],r8
	jmp L_2750
	
L_2749:
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*16]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*23],r10
	mov qword [rsp+8*18],r11
	
L_2750:
	mov r8,  [rsp+8*18]
	cmp r8, 0
	je L_2753
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*18],r8
	jmp L_2754
	
L_2753:
	mov r8,  [rsp+8*10]
	cmp r8,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	mov qword [rsp+8*24],r9
	jne L_2751
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*24],r8
	jmp L_2752
	
L_2751:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*24],r10
	
L_2752:
	mov r9,  [rsp+8*24]
	mov r8,r9
	mov qword [rsp+8*18],r8
	
L_2754:
	mov r8,  [rsp+8*18]
	mov r13,r8
	mov r9,  [rsp+8*4]
	mov r10,  [rsp+8*6]
	cmp r9,r10
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*27],r11
	jne L_2755
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*27],r8
	jmp L_2756
	
L_2755:
	mov r8,  [rsp+8*8]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*27],r10
	
L_2756:
	mov r8,  [rsp+8*27]
	cmp r8, 0
	je L_2761
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*27],r8
	jmp L_2762
	
L_2761:
	mov r8,  [rsp+8*10]
	mov r9,  [rsp+8*12]
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*29],r10
	jne L_2757
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*29],r8
	jmp L_2758
	
L_2757:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*29],r10
	
L_2758:
	mov r8,  [rsp+8*29]
	cmp r8, 0
	jne L_2759
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*29],r8
	jmp L_2760
	
L_2759:
	mov r8,  [rsp+8*16]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*29],r10
	
L_2760:
	mov r9,  [rsp+8*29]
	mov r8,r9
	mov qword [rsp+8*27],r8
	
L_2762:
	mov r8,  [rsp+8*27]
	cmp r8, 0
	je L_2763
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*27],r8
	jmp L_2764
	
L_2763:
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*16]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*32],r10
	mov qword [rsp+8*27],r11
	
L_2764:
	mov r8,  [rsp+8*27]
	cmp r8, 0
	je L_2767
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*27],r8
	jmp L_2768
	
L_2767:
	mov r8,  [rsp+8*10]
	cmp r8,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	mov qword [rsp+8*33],r9
	jne L_2765
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*33],r8
	jmp L_2766
	
L_2765:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*34],r9
	mov qword [rsp+8*33],r10
	
L_2766:
	mov r9,  [rsp+8*33]
	mov r8,r9
	mov qword [rsp+8*27],r8
	
L_2768:
	mov r8,  [rsp+8*27]
	mov r12,r8
	mov r9,  [rsp+8*4]
	mov r10,  [rsp+8*6]
	cmp r9,r10
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*36],r11
	jne L_2769
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*36],r8
	jmp L_2770
	
L_2769:
	mov r8,  [rsp+8*8]
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r9,r15
	mov qword [rsp+8*36],r9
	
L_2770:
	mov r8,  [rsp+8*36]
	cmp r8, 0
	je L_2775
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*36],r8
	jmp L_2776
	
L_2775:
	mov r8,  [rsp+8*10]
	mov r9,  [rsp+8*12]
	cmp r8,r9
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_2771
	mov r8,0
	mov r15,r8
	jmp L_2772
	
L_2771:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2772:
	cmp r15, 0
	jne L_2773
	mov r8,0
	mov r15,r8
	jmp L_2774
	
L_2773:
	mov r8,  [rsp+8*16]
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2774:
	mov r8,r15
	mov qword [rsp+8*36],r8
	
L_2776:
	mov r8,  [rsp+8*36]
	cmp r8, 0
	je L_2777
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*36],r8
	jmp L_2778
	
L_2777:
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*16]
	cmp r8,r9
	mov r15, 0
	sete r15B
	mov r10,r15
	mov qword [rsp+8*36],r10
	
L_2778:
	mov r8,  [rsp+8*36]
	cmp r8, 0
	je L_2781
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*36],r8
	jmp L_2782
	
L_2781:
	mov r8,  [rsp+8*10]
	cmp r8,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_2779
	mov r8,0
	mov r15,r8
	jmp L_2780
	
L_2779:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2780:
	mov r8,r15
	mov qword [rsp+8*36],r8
	
L_2782:
	mov r9,  [rsp+8*36]
	mov r8,r9
	mov r10,  [rsp+8*4]
	mov r11,  [rsp+8*6]
	cmp r10,r11
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*44],r8
	jne L_2783
	mov r8,0
	mov r15,r8
	jmp L_2784
	
L_2783:
	mov r8,  [rsp+8*8]
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2784:
	cmp r15, 0
	je L_2789
	mov r8,1
	mov r15,r8
	jmp L_2790
	
L_2789:
	mov r8,  [rsp+8*10]
	mov r9,  [rsp+8*12]
	cmp r8,r9
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_2785
	mov r8,0
	mov r15,r8
	jmp L_2786
	
L_2785:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2786:
	cmp r15, 0
	jne L_2787
	mov r8,0
	mov r15,r8
	jmp L_2788
	
L_2787:
	mov r8,  [rsp+8*16]
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2788:
	mov r15,r15
	
L_2790:
	cmp r15, 0
	je L_2791
	mov r8,1
	mov r15,r8
	jmp L_2792
	
L_2791:
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*16]
	cmp r8,r9
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_2792:
	cmp r15, 0
	je L_2795
	mov r8,1
	mov r15,r8
	jmp L_2796
	
L_2795:
	mov r8,  [rsp+8*10]
	cmp r8,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_2793
	mov r8,0
	mov r15,r8
	jmp L_2794
	
L_2793:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2794:
	mov r15,r15
	
L_2796:
	mov r15,r15
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*6]
	cmp r8,r9
	mov r14, 0
	sete r14B
	cmp r14, 0
	jne L_2797
	mov r8,0
	mov r14,r8
	jmp L_2798
	
L_2797:
	mov r8,  [rsp+8*8]
	cmp r8,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2798:
	cmp r14, 0
	je L_2803
	mov r8,1
	mov r14,r8
	jmp L_2804
	
L_2803:
	mov r8,  [rsp+8*10]
	mov r9,  [rsp+8*12]
	cmp r8,r9
	mov r14, 0
	sete r14B
	cmp r14, 0
	jne L_2799
	mov r8,0
	mov r14,r8
	jmp L_2800
	
L_2799:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2800:
	cmp r14, 0
	jne L_2801
	mov r8,0
	mov r14,r8
	jmp L_2802
	
L_2801:
	mov r8,  [rsp+8*16]
	cmp r8,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2802:
	mov r14,r14
	
L_2804:
	cmp r14, 0
	je L_2805
	mov r8,1
	mov r14,r8
	jmp L_2806
	
L_2805:
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*16]
	cmp r8,r9
	mov r14, 0
	sete r14B
	mov r14,r14
	
L_2806:
	cmp r14, 0
	je L_2809
	mov r8,1
	mov r14,r8
	jmp L_2810
	
L_2809:
	mov r8,  [rsp+8*10]
	cmp r8,0
	mov r14, 0
	setg r14B
	cmp r14, 0
	jne L_2807
	mov r8,0
	mov r14,r8
	jmp L_2808
	
L_2807:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2808:
	mov r14,r14
	
L_2810:
	mov r8,r14
	mov r9,  [rsp+8*4]
	mov r10,  [rsp+8*6]
	cmp r9,r10
	mov r14, 0
	sete r14B
	cmp r14, 0
	mov qword [rsp+8*62],r8
	jne L_2811
	mov r8,0
	mov r14,r8
	jmp L_2812
	
L_2811:
	mov r8,  [rsp+8*8]
	cmp r8,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2812:
	cmp r14, 0
	je L_2817
	mov r8,1
	mov r14,r8
	jmp L_2818
	
L_2817:
	mov r8,  [rsp+8*10]
	mov r9,  [rsp+8*12]
	cmp r8,r9
	mov r14, 0
	sete r14B
	cmp r14, 0
	jne L_2813
	mov r8,0
	mov r14,r8
	jmp L_2814
	
L_2813:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2814:
	cmp r14, 0
	jne L_2815
	mov r8,0
	mov r14,r8
	jmp L_2816
	
L_2815:
	mov r8,  [rsp+8*16]
	cmp r8,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2816:
	mov r14,r14
	
L_2818:
	cmp r14, 0
	je L_2819
	mov r8,1
	mov r14,r8
	jmp L_2820
	
L_2819:
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*16]
	cmp r8,r9
	mov r14, 0
	sete r14B
	mov r14,r14
	
L_2820:
	cmp r14, 0
	je L_2823
	mov r8,1
	mov r14,r8
	jmp L_2824
	
L_2823:
	mov r8,  [rsp+8*10]
	cmp r8,0
	mov r14, 0
	setg r14B
	cmp r14, 0
	jne L_2821
	mov r8,0
	mov r14,r8
	jmp L_2822
	
L_2821:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2822:
	mov r14,r14
	
L_2824:
	mov r14,r14
	cmp r13, 0
	je L_2826
	mov r8,  [rsp+8*3]
	mov r13,r8
	mov r9,1
	add r8,r9
	mov qword [rsp+8*3],r8
	
L_2826:
	cmp r12, 0
	je L_2828
	mov r8,  [rsp+8*3]
	mov r13,r8
	mov r9,1
	add r8,r9
	mov qword [rsp+8*3],r8
	
L_2828:
	mov r8,  [rsp+8*44]
	cmp r8, 0
	je L_2830
	mov r8,  [rsp+8*3]
	mov r13,r8
	mov r9,1
	add r8,r9
	mov qword [rsp+8*3],r8
	
L_2830:
	cmp r15, 0
	je L_2832
	mov r8,  [rsp+8*3]
	mov r15,r8
	mov r9,1
	add r8,r9
	mov qword [rsp+8*3],r8
	
L_2832:
	mov r8,  [rsp+8*62]
	cmp r8, 0
	je L_2834
	mov r8,  [rsp+8*3]
	mov r15,r8
	mov r9,1
	add r8,r9
	mov qword [rsp+8*3],r8
	
L_2834:
	cmp r14, 0
	je L_2836
	mov r8,  [rsp+8*3]
	mov r15,r8
	mov r9,1
	add r8,r9
	mov qword [rsp+8*3],r8
	
L_2836:
	mov r8,  [rsp+8*16]
	mov r9,1
	add r8,r9
	mov qword [rsp+8*16],r8
	jmp L_2738
	
L_2739:
	mov r8,  [rsp+8*14]
	mov r9,1
	add r8,r9
	mov qword [rsp+8*14],r8
	jmp L_2735
	
L_2736:
	mov r8,  [rsp+8*12]
	mov r9,1
	add r8,r9
	mov qword [rsp+8*12],r8
	jmp L_2732
	
L_2733:
	mov r8,  [rsp+8*10]
	mov r9,1
	add r8,r9
	mov qword [rsp+8*10],r8
	jmp L_2729
	
L_2730:
	mov r8,  [rsp+8*8]
	mov r9,1
	add r8,r9
	mov qword [rsp+8*8],r8
	jmp L_2726
	
L_2727:
	mov r8,  [rsp+8*6]
	mov r9,1
	add r8,r9
	mov qword [rsp+8*6],r8
	jmp L_2723
	
L_2724:
	mov r8,  [rsp+8*4]
	mov r9,1
	add r8,r9
	mov qword [rsp+8*4],r8
	jmp L_2720
	
L_2721:
	mov r9,  [rsp+8*3]
	mov r8,r9
	mov r15,r8
	mov qword rdi,r8
	mov     rdi,  r15
	call    toString
	mov     qword r15, rax
	mov r8,r15
	mov r15,r8
	mov qword rdi,r8
	mov rdi, format
	mov rsi, r15 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 720
	mov r8,  [rsp+8*82]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   2704
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
	

