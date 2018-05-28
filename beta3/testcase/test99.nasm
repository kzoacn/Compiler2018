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
	push r11
	push r10
	push r9
	push r8
	call global_init
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
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
	
L_2617:
	mov rbx,  [rsp+8*2]
	cmp r11,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*5],rdx
	je L_2618
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*6],rbx
	
L_2620:
	mov rbx,  [rsp+8*6]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*7],rax
	je L_2621
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*8],rbx
	
L_2623:
	mov rbx,  [rsp+8*8]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*9],rax
	je L_2624
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*10],rbx
	
L_2626:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*11],rax
	je L_2627
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*12],rbx
	
L_2629:
	mov rbx,  [rsp+8*12]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*13],rax
	je L_2630
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*14],rbx
	
L_2632:
	mov rbx,  [rsp+8*14]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*15],rax
	je L_2633
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*16],rbx
	
L_2635:
	mov rbx,  [rsp+8*16]
	mov rdx,  [rsp+8*2]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*17],rax
	je L_2636
	mov rbx,  [rsp+8*6]
	cmp r11,rbx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*18],rdx
	jne L_2638
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	jmp L_2639
	
L_2638:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*19],rdx
	mov qword [rsp+8*18],rax
	
L_2639:
	mov rbx,  [rsp+8*18]
	cmp rbx, 0
	je L_2644
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	jmp L_2645
	
L_2644:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*20],rax
	jne L_2640
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*20],rbx
	jmp L_2641
	
L_2640:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*21],rdx
	mov qword [rsp+8*20],rax
	
L_2641:
	mov rbx,  [rsp+8*20]
	cmp rbx, 0
	jne L_2642
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*20],rbx
	jmp L_2643
	
L_2642:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*22],rdx
	mov qword [rsp+8*20],rax
	
L_2643:
	mov rdx,  [rsp+8*20]
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_2645:
	mov rbx,  [rsp+8*18]
	cmp rbx, 0
	je L_2646
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	jmp L_2647
	
L_2646:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*23],rdx
	mov qword [rsp+8*18],rax
	
L_2647:
	mov rbx,  [rsp+8*18]
	cmp rbx, 0
	je L_2650
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	jmp L_2651
	
L_2650:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov rdx, 0
	setg dl
	cmp rdx, 0
	mov qword [rsp+8*24],rdx
	jne L_2648
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*24],rbx
	jmp L_2649
	
L_2648:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*25],rdx
	mov qword [rsp+8*24],rax
	
L_2649:
	mov rdx,  [rsp+8*24]
	mov rbx,rdx
	mov qword [rsp+8*18],rbx
	
L_2651:
	mov rbx,  [rsp+8*18]
	mov r13,rbx
	mov rdx,  [rsp+8*6]
	cmp r11,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*27],rax
	jne L_2652
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*27],rbx
	jmp L_2653
	
L_2652:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*28],rdx
	mov qword [rsp+8*27],rax
	
L_2653:
	mov rbx,  [rsp+8*27]
	cmp rbx, 0
	je L_2658
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*27],rbx
	jmp L_2659
	
L_2658:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*29],rax
	jne L_2654
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*29],rbx
	jmp L_2655
	
L_2654:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*30],rdx
	mov qword [rsp+8*29],rax
	
L_2655:
	mov rbx,  [rsp+8*29]
	cmp rbx, 0
	jne L_2656
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*29],rbx
	jmp L_2657
	
L_2656:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*31],rdx
	mov qword [rsp+8*29],rax
	
L_2657:
	mov rdx,  [rsp+8*29]
	mov rbx,rdx
	mov qword [rsp+8*27],rbx
	
L_2659:
	mov rbx,  [rsp+8*27]
	cmp rbx, 0
	je L_2660
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*27],rbx
	jmp L_2661
	
L_2660:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*32],rdx
	mov qword [rsp+8*27],rax
	
L_2661:
	mov rbx,  [rsp+8*27]
	cmp rbx, 0
	je L_2664
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*27],rbx
	jmp L_2665
	
L_2664:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov rdx, 0
	setg dl
	cmp rdx, 0
	mov qword [rsp+8*33],rdx
	jne L_2662
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*33],rbx
	jmp L_2663
	
L_2662:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov rdx, 0
	setg dl
	mov rax,rdx
	mov qword [rsp+8*34],rdx
	mov qword [rsp+8*33],rax
	
L_2663:
	mov rdx,  [rsp+8*33]
	mov rbx,rdx
	mov qword [rsp+8*27],rbx
	
L_2665:
	mov rbx,  [rsp+8*27]
	mov r12,rbx
	mov rdx,  [rsp+8*6]
	cmp r11,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*36],rax
	jne L_2666
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*36],rbx
	jmp L_2667
	
L_2666:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov rdx,r15
	mov qword [rsp+8*36],rdx
	
L_2667:
	mov rbx,  [rsp+8*36]
	cmp rbx, 0
	je L_2672
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*36],rbx
	jmp L_2673
	
L_2672:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_2668
	mov rbx,0
	mov r15,rbx
	jmp L_2669
	
L_2668:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2669:
	cmp r15, 0
	jne L_2670
	mov rbx,0
	mov r15,rbx
	jmp L_2671
	
L_2670:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2671:
	mov rbx,r15
	mov qword [rsp+8*36],rbx
	
L_2673:
	mov rbx,  [rsp+8*36]
	cmp rbx, 0
	je L_2674
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*36],rbx
	jmp L_2675
	
L_2674:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov rdx,r15
	mov qword [rsp+8*36],rdx
	
L_2675:
	mov rbx,  [rsp+8*36]
	cmp rbx, 0
	je L_2678
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*36],rbx
	jmp L_2679
	
L_2678:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_2676
	mov rbx,0
	mov r15,rbx
	jmp L_2677
	
L_2676:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2677:
	mov rbx,r15
	mov qword [rsp+8*36],rbx
	
L_2679:
	mov rdx,  [rsp+8*36]
	mov rbx,rdx
	mov rax,  [rsp+8*6]
	cmp r11,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*44],rbx
	jne L_2680
	mov rbx,0
	mov r15,rbx
	jmp L_2681
	
L_2680:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2681:
	cmp r15, 0
	je L_2686
	mov rbx,1
	mov r15,rbx
	jmp L_2687
	
L_2686:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	jne L_2682
	mov rbx,0
	mov r15,rbx
	jmp L_2683
	
L_2682:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2683:
	cmp r15, 0
	jne L_2684
	mov rbx,0
	mov r15,rbx
	jmp L_2685
	
L_2684:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2685:
	mov r15,r15
	
L_2687:
	cmp r15, 0
	je L_2688
	mov rbx,1
	mov r15,rbx
	jmp L_2689
	
L_2688:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_2689:
	cmp r15, 0
	je L_2692
	mov rbx,1
	mov r15,rbx
	jmp L_2693
	
L_2692:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	jne L_2690
	mov rbx,0
	mov r15,rbx
	jmp L_2691
	
L_2690:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r15, 0
	setg r15B
	mov r15,r15
	
L_2691:
	mov r15,r15
	
L_2693:
	mov r15,r15
	mov rbx,  [rsp+8*6]
	cmp r11,rbx
	mov r14, 0
	sete r14B
	cmp r14, 0
	jne L_2694
	mov rbx,0
	mov r14,rbx
	jmp L_2695
	
L_2694:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2695:
	cmp r14, 0
	je L_2700
	mov rbx,1
	mov r14,rbx
	jmp L_2701
	
L_2700:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r14, 0
	sete r14B
	cmp r14, 0
	jne L_2696
	mov rbx,0
	mov r14,rbx
	jmp L_2697
	
L_2696:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2697:
	cmp r14, 0
	jne L_2698
	mov rbx,0
	mov r14,rbx
	jmp L_2699
	
L_2698:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2699:
	mov r14,r14
	
L_2701:
	cmp r14, 0
	je L_2702
	mov rbx,1
	mov r14,rbx
	jmp L_2703
	
L_2702:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov r14, 0
	sete r14B
	mov r14,r14
	
L_2703:
	cmp r14, 0
	je L_2706
	mov rbx,1
	mov r14,rbx
	jmp L_2707
	
L_2706:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r14, 0
	setg r14B
	cmp r14, 0
	jne L_2704
	mov rbx,0
	mov r14,rbx
	jmp L_2705
	
L_2704:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2705:
	mov r14,r14
	
L_2707:
	mov rbx,r14
	mov rdx,  [rsp+8*6]
	cmp r11,rdx
	mov r14, 0
	sete r14B
	cmp r14, 0
	mov qword [rsp+8*62],rbx
	jne L_2708
	mov rbx,0
	mov r14,rbx
	jmp L_2709
	
L_2708:
	mov rbx,  [rsp+8*8]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2709:
	cmp r14, 0
	je L_2714
	mov rbx,1
	mov r14,rbx
	jmp L_2715
	
L_2714:
	mov rbx,  [rsp+8*10]
	mov rdx,  [rsp+8*12]
	cmp rbx,rdx
	mov r14, 0
	sete r14B
	cmp r14, 0
	jne L_2710
	mov rbx,0
	mov r14,rbx
	jmp L_2711
	
L_2710:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2711:
	cmp r14, 0
	jne L_2712
	mov rbx,0
	mov r14,rbx
	jmp L_2713
	
L_2712:
	mov rbx,  [rsp+8*16]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2713:
	mov r14,r14
	
L_2715:
	cmp r14, 0
	je L_2716
	mov rbx,1
	mov r14,rbx
	jmp L_2717
	
L_2716:
	mov rbx,  [rsp+8*16]
	cmp r11,rbx
	mov r14, 0
	sete r14B
	mov r14,r14
	
L_2717:
	cmp r14, 0
	je L_2720
	mov rbx,1
	mov r14,rbx
	jmp L_2721
	
L_2720:
	mov rbx,  [rsp+8*10]
	cmp rbx,0
	mov r14, 0
	setg r14B
	cmp r14, 0
	jne L_2718
	mov rbx,0
	mov r14,rbx
	jmp L_2719
	
L_2718:
	mov rbx,  [rsp+8*14]
	cmp rbx,0
	mov r14, 0
	setg r14B
	mov r14,r14
	
L_2719:
	mov r14,r14
	
L_2721:
	mov r14,r14
	cmp r13, 0
	je L_2723
	mov rbx,  [rsp+8*3]
	mov r13,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_2723:
	cmp r12, 0
	je L_2725
	mov rbx,  [rsp+8*3]
	mov r13,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_2725:
	mov rbx,  [rsp+8*44]
	cmp rbx, 0
	je L_2727
	mov rbx,  [rsp+8*3]
	mov r13,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_2727:
	cmp r15, 0
	je L_2729
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_2729:
	mov rbx,  [rsp+8*62]
	cmp rbx, 0
	je L_2731
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_2731:
	cmp r14, 0
	je L_2733
	mov rbx,  [rsp+8*3]
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*3],rbx
	
L_2733:
	mov rbx,  [rsp+8*16]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*16],rbx
	jmp L_2635
	
L_2636:
	mov rbx,  [rsp+8*14]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*14],rbx
	jmp L_2632
	
L_2633:
	mov rbx,  [rsp+8*12]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*12],rbx
	jmp L_2629
	
L_2630:
	mov rbx,  [rsp+8*10]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*10],rbx
	jmp L_2626
	
L_2627:
	mov rbx,  [rsp+8*8]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*8],rbx
	jmp L_2623
	
L_2624:
	mov rbx,  [rsp+8*6]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*6],rbx
	jmp L_2620
	
L_2621:
	mov rbx,1
	add r11,rbx
	jmp L_2617
	
L_2618:
	mov rbx,  [rsp+8*3]
	mov rdi,rbx
	mov r15,rdi
	mov     rdi,  r15
	call    toString
	mov     qword r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, format
	mov rsi, r15 
	add rsi, 1 
	xor rax, rax
	push r11
	push r10
	call printf
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
	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	
GS_31:
	db 25H, 6CH, 64H, 00H
	
GS_32:
	db 25H, 73H, 00H
	

