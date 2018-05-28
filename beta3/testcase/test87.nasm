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
	sub    rsp, 2632
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 4616
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	push r11
	call global_init
	pop r11
	pop r15
	mov r15 , rax
	
L_2081:
	mov rbx,1
	mov rdx,rbx
	mov rcx,29
	shl rdx,cl
	mov rax,  [gbl+8*3]
	cmp rax,rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*2],rdx
	jne L_2083
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*2],rbx
	jmp L_2084
	
L_2083:
	mov rbx,1
	mov rdx,rbx
	mov rcx,29
	shl rdx,cl
	mov rax,rdx
	neg rax
	mov rbx,  [gbl+8*3]
	cmp rbx,rax
	mov rax, 0
	setg al
	mov rdx,rax
	mov qword [rsp+8*2],rdx
	mov qword [rsp+8*5],rax
	
L_2084:
	add r11,r11
	mov rbx,  [rsp+8*2]
	cmp rbx, 0
	je L_2082
	mov rbx,  [gbl+8*3]
	mov rdx,  [gbl+8*7]
	mov rax,rbx
	sub rax,rdx
	mov rbx,  [gbl+8*9]
	add rax,rbx
	mov qword [rsp+8*8],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,  [rsp+8*8]
	sub rbx,rax
	mov rax,  [gbl+8*3]
	mov qword [rsp+8*8],rbx
	mov rbx,rax
	sub rbx,rdx
	mov rdx,  [gbl+8*9]
	add rbx,rdx
	mov rax,  [gbl+8*7]
	mov qword [rsp+8*11],rbx
	mov rbx,rax
	add rbx,rdx
	mov qword [rsp+8*12],rbx
	mov rbx,  [rsp+8*11]
	mov rdx,  [rsp+8*12]
	sub rbx,rdx
	mov rdx,  [rsp+8*8]
	add rdx,rbx
	mov rbx,  [gbl+8*3]
	mov qword [rsp+8*8],rdx
	mov rdx,rbx
	sub rdx,rax
	mov rbx,  [gbl+8*9]
	add rdx,rbx
	mov qword [rsp+8*13],rdx
	mov rdx,rax
	add rdx,rbx
	mov rbx,  [rsp+8*13]
	sub rbx,rdx
	mov rdx,  [gbl+8*3]
	mov qword [rsp+8*13],rbx
	mov rbx,rdx
	sub rbx,rax
	mov rdx,  [gbl+8*9]
	add rbx,rdx
	mov rax,  [rsp+8*13]
	add rax,rbx
	mov rbx,  [rsp+8*8]
	add rbx,rax
	mov rax,  [gbl+8*7]
	mov qword [rsp+8*8],rbx
	mov rbx,rax
	add rbx,rdx
	mov qword [rsp+8*16],rbx
	mov rbx,  [gbl+8*3]
	mov rdx,rbx
	sub rdx,rax
	mov rbx,  [gbl+8*9]
	add rdx,rbx
	mov rax,  [rsp+8*16]
	add rax,rdx
	mov rdx,  [gbl+8*7]
	mov qword [rsp+8*16],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,  [rsp+8*16]
	sub rbx,rax
	mov rax,  [gbl+8*3]
	mov qword [rsp+8*16],rbx
	mov rbx,rax
	sub rbx,rdx
	mov rdx,  [gbl+8*9]
	add rbx,rdx
	mov rax,  [gbl+8*7]
	mov qword [rsp+8*19],rbx
	mov rbx,rax
	add rbx,rdx
	mov qword [rsp+8*20],rbx
	mov rbx,  [rsp+8*19]
	mov rdx,  [rsp+8*20]
	sub rbx,rdx
	mov rdx,  [gbl+8*3]
	mov qword [rsp+8*19],rbx
	mov rbx,rdx
	sub rbx,rax
	mov rdx,  [gbl+8*9]
	add rbx,rdx
	mov rax,  [rsp+8*19]
	add rax,rbx
	mov rbx,  [rsp+8*16]
	add rbx,rax
	mov rax,  [rsp+8*8]
	sub rax,rbx
	mov rbx,  [gbl+8*7]
	mov qword [rsp+8*8],rax
	mov rax,rbx
	add rax,rdx
	mov rbx,  [gbl+8*3]
	mov rdx,  [gbl+8*7]
	mov qword [rsp+8*22],rax
	mov rax,rbx
	sub rax,rdx
	mov rbx,  [gbl+8*9]
	add rax,rbx
	mov rdx,  [rsp+8*22]
	add rdx,rax
	mov rax,  [gbl+8*7]
	mov qword [rsp+8*22],rdx
	mov rdx,rax
	add rdx,rbx
	mov rbx,  [gbl+8*3]
	mov qword [rsp+8*24],rdx
	mov rdx,rbx
	sub rdx,rax
	mov rbx,  [gbl+8*9]
	add rdx,rbx
	mov rax,  [rsp+8*24]
	add rax,rdx
	mov rdx,  [rsp+8*22]
	sub rdx,rax
	mov rax,  [gbl+8*7]
	mov qword [rsp+8*22],rdx
	mov rdx,rax
	add rdx,rbx
	mov rbx,  [gbl+8*3]
	mov qword [rsp+8*26],rdx
	mov rdx,rbx
	sub rdx,rax
	mov rbx,  [gbl+8*9]
	add rdx,rbx
	mov rax,  [rsp+8*26]
	add rax,rdx
	mov rdx,  [gbl+8*7]
	mov qword [rsp+8*26],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,  [rsp+8*26]
	sub rbx,rax
	mov rax,  [rsp+8*22]
	sub rax,rbx
	mov rbx,  [gbl+8*3]
	mov qword [rsp+8*22],rax
	mov rax,rbx
	sub rax,rdx
	mov rbx,  [gbl+8*9]
	add rax,rbx
	mov qword [rsp+8*29],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,  [rsp+8*29]
	sub rbx,rax
	mov rax,  [gbl+8*3]
	mov qword [rsp+8*29],rbx
	mov rbx,rax
	sub rbx,rdx
	mov rdx,  [gbl+8*9]
	add rbx,rdx
	mov rax,  [rsp+8*29]
	add rax,rbx
	mov rbx,  [gbl+8*7]
	mov qword [rsp+8*29],rax
	mov rax,rbx
	add rax,rdx
	mov rbx,  [gbl+8*3]
	mov rdx,  [gbl+8*7]
	mov qword [rsp+8*32],rax
	mov rax,rbx
	sub rax,rdx
	mov rbx,  [gbl+8*9]
	add rax,rbx
	mov rdx,  [rsp+8*32]
	add rdx,rax
	mov rax,  [gbl+8*7]
	mov qword [rsp+8*32],rdx
	mov rdx,rax
	add rdx,rbx
	mov rbx,  [rsp+8*32]
	sub rbx,rdx
	mov rdx,  [rsp+8*29]
	sub rdx,rbx
	mov rbx,  [rsp+8*22]
	add rbx,rdx
	mov rdx,  [rsp+8*8]
	sub rdx,rbx
	mov rbx,  [gbl+8*3]
	mov qword [rsp+8*8],rdx
	mov rdx,rbx
	sub rdx,rax
	mov rbx,  [gbl+8*9]
	add rdx,rbx
	mov qword [rsp+8*35],rdx
	mov rdx,rax
	add rdx,rbx
	mov rbx,  [rsp+8*35]
	sub rbx,rdx
	mov rdx,  [gbl+8*3]
	mov qword [rsp+8*35],rbx
	mov rbx,rdx
	sub rbx,rax
	mov rdx,  [gbl+8*9]
	add rbx,rdx
	mov qword [rsp+8*37],rbx
	mov rbx,rax
	add rbx,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,  [rsp+8*37]
	mov rdx,  [rsp+8*38]
	sub rbx,rdx
	mov rdx,  [rsp+8*35]
	add rdx,rbx
	mov rbx,  [gbl+8*3]
	mov qword [rsp+8*35],rdx
	mov rdx,rbx
	sub rdx,rax
	mov rbx,  [gbl+8*9]
	add rdx,rbx
	mov qword [rsp+8*39],rdx
	mov rdx,rax
	add rdx,rbx
	mov rbx,  [rsp+8*39]
	sub rbx,rdx
	mov rdx,  [gbl+8*3]
	mov qword [rsp+8*39],rbx
	mov rbx,rdx
	sub rbx,rax
	mov rdx,  [gbl+8*9]
	add rbx,rdx
	mov rax,  [rsp+8*39]
	add rax,rbx
	mov rbx,  [rsp+8*35]
	add rbx,rax
	mov rax,  [gbl+8*7]
	mov qword [rsp+8*35],rbx
	mov rbx,rax
	add rbx,rdx
	mov qword [rsp+8*42],rbx
	mov rbx,  [gbl+8*3]
	mov rdx,rbx
	sub rdx,rax
	mov rbx,  [gbl+8*9]
	add rdx,rbx
	mov rax,  [rsp+8*42]
	add rax,rdx
	mov rdx,  [gbl+8*7]
	mov qword [rsp+8*42],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,  [rsp+8*42]
	sub rbx,rax
	mov rax,  [gbl+8*3]
	mov qword [rsp+8*42],rbx
	mov rbx,rax
	sub rbx,rdx
	mov rdx,  [gbl+8*9]
	add rbx,rdx
	mov rax,  [gbl+8*7]
	mov qword [rsp+8*45],rbx
	mov rbx,rax
	add rbx,rdx
	mov qword [rsp+8*46],rbx
	mov rbx,  [rsp+8*45]
	mov rdx,  [rsp+8*46]
	sub rbx,rdx
	mov rdx,  [gbl+8*3]
	mov qword [rsp+8*45],rbx
	mov rbx,rdx
	sub rbx,rax
	mov rdx,  [gbl+8*9]
	add rbx,rdx
	mov rax,  [rsp+8*45]
	add rax,rbx
	mov rbx,  [rsp+8*42]
	add rbx,rax
	mov rax,  [rsp+8*35]
	sub rax,rbx
	mov rbx,  [gbl+8*7]
	mov qword [rsp+8*35],rax
	mov rax,rbx
	add rax,rdx
	mov rbx,  [gbl+8*3]
	mov rdx,  [gbl+8*7]
	mov qword [rsp+8*48],rax
	mov rax,rbx
	sub rax,rdx
	mov rbx,  [gbl+8*9]
	add rax,rbx
	mov rdx,  [rsp+8*48]
	add rdx,rax
	mov rax,  [gbl+8*7]
	mov qword [rsp+8*48],rdx
	mov rdx,rax
	add rdx,rbx
	mov rbx,  [rsp+8*48]
	sub rbx,rdx
	mov rdx,  [gbl+8*3]
	mov qword [rsp+8*48],rbx
	mov rbx,rdx
	sub rbx,rax
	mov rdx,  [gbl+8*9]
	add rbx,rdx
	mov qword [rsp+8*51],rbx
	mov rbx,rax
	add rbx,rdx
	mov qword [rsp+8*52],rbx
	mov rbx,  [rsp+8*51]
	mov rdx,  [rsp+8*52]
	sub rbx,rdx
	mov rdx,  [gbl+8*3]
	mov qword [rsp+8*51],rbx
	mov rbx,rdx
	sub rbx,rax
	mov rdx,  [gbl+8*9]
	add rbx,rdx
	mov rax,  [rsp+8*51]
	add rax,rbx
	mov rbx,  [rsp+8*48]
	add rbx,rax
	mov rax,  [gbl+8*7]
	mov qword [rsp+8*48],rbx
	mov rbx,rax
	add rbx,rdx
	mov qword [rsp+8*54],rbx
	mov rbx,  [gbl+8*3]
	mov rdx,rbx
	sub rdx,rax
	mov rbx,  [gbl+8*9]
	add rdx,rbx
	mov rax,  [rsp+8*54]
	add rax,rdx
	mov rdx,  [gbl+8*7]
	mov qword [rsp+8*54],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,  [rsp+8*54]
	sub rbx,rax
	mov rax,  [gbl+8*3]
	mov qword [rsp+8*54],rbx
	mov rbx,rax
	sub rbx,rdx
	mov rdx,  [gbl+8*9]
	add rbx,rdx
	mov rax,  [gbl+8*7]
	mov qword [rsp+8*57],rbx
	mov rbx,rax
	add rbx,rdx
	mov qword [rsp+8*58],rbx
	mov rbx,  [rsp+8*57]
	mov rdx,  [rsp+8*58]
	sub rbx,rdx
	mov rdx,  [gbl+8*3]
	mov qword [rsp+8*57],rbx
	mov rbx,rdx
	sub rbx,rax
	mov rdx,  [gbl+8*9]
	add rbx,rdx
	mov rax,  [rsp+8*57]
	add rax,rbx
	mov rbx,  [rsp+8*54]
	add rbx,rax
	mov rax,  [rsp+8*48]
	sub rax,rbx
	mov rbx,  [rsp+8*35]
	sub rbx,rax
	mov rax,  [rsp+8*8]
	add rax,rbx
	mov rbx,  [gbl+8*7]
	mov qword [rsp+8*8],rax
	mov rax,rbx
	add rax,rdx
	mov rbx,  [gbl+8*3]
	mov rdx,  [gbl+8*7]
	mov qword [rsp+8*60],rax
	mov rax,rbx
	sub rax,rdx
	mov rbx,  [gbl+8*9]
	add rax,rbx
	mov rdx,  [rsp+8*60]
	add rdx,rax
	mov rax,  [gbl+8*7]
	mov r14,rax
	add r14,rbx
	mov qword [rsp+8*60],rdx
	mov rdx,  [gbl+8*3]
	mov r15,rdx
	sub r15,rax
	add r15,rbx
	add r14,r15
	mov rdx,  [rsp+8*60]
	sub rdx,r14
	mov r14,rax
	add r14,rbx
	mov qword [rsp+8*60],rdx
	mov rdx,  [gbl+8*3]
	mov r15,rdx
	sub r15,rax
	add r15,rbx
	add r14,r15
	mov r15,rax
	add r15,rbx
	sub r14,r15
	mov rdx,  [rsp+8*60]
	sub rdx,r14
	mov rbx,  [gbl+8*3]
	mov r13,rbx
	sub r13,rax
	mov qword [rsp+8*60],rdx
	mov rdx,  [gbl+8*9]
	add r13,rdx
	mov r15,rax
	add r15,rdx
	sub r13,r15
	mov r15,rbx
	sub r15,rax
	add r15,rdx
	add r13,r15
	mov r14,rax
	add r14,rdx
	mov r15,rbx
	sub r15,rax
	add r15,rdx
	add r14,r15
	mov r15,rax
	add r15,rdx
	sub r14,r15
	sub r13,r14
	mov rbx,  [rsp+8*60]
	add rbx,r13
	mov rdx,  [gbl+8*3]
	mov r13,rdx
	sub r13,rax
	mov qword [rsp+8*60],rbx
	mov rbx,  [gbl+8*9]
	add r13,rbx
	mov r15,rax
	add r15,rbx
	sub r13,r15
	mov r15,rdx
	sub r15,rax
	add r15,rbx
	add r13,r15
	mov r14,rax
	add r14,rbx
	mov r15,rdx
	sub r15,rax
	add r15,rbx
	add r14,r15
	mov r15,rax
	add r15,rbx
	sub r14,r15
	sub r13,r14
	mov r14,rdx
	sub r14,rax
	add r14,rbx
	mov r15,rax
	add r15,rbx
	sub r14,r15
	mov r15,rdx
	sub r15,rax
	add r15,rbx
	add r14,r15
	mov r12,rax
	add r12,rbx
	mov r15,rdx
	sub r15,rax
	add r15,rbx
	add r12,r15
	mov r15,rax
	add r15,rbx
	sub r12,r15
	sub r14,r12
	add r13,r14
	mov rdx,  [rsp+8*60]
	add rdx,r13
	mov rbx,  [gbl+8*3]
	mov r12,rbx
	sub r12,rax
	mov qword [rsp+8*60],rdx
	mov rdx,  [gbl+8*9]
	add r12,rdx
	mov r15,rax
	add r15,rdx
	sub r12,r15
	mov r14,rbx
	sub r14,rax
	add r14,rdx
	mov r15,rax
	add r15,rdx
	sub r14,r15
	add r12,r14
	mov r15,rbx
	sub r15,rax
	add r15,rdx
	mov r14,rax
	add r14,rdx
	sub r15,r14
	mov r14,rbx
	sub r14,rax
	add r14,rdx
	add r15,r14
	add r12,r15
	mov r13,rax
	add r13,rdx
	mov r15,rbx
	sub r15,rax
	add r15,rdx
	add r13,r15
	mov r15,rax
	add r15,rdx
	sub r13,r15
	mov r14,rbx
	sub r14,rax
	add r14,rdx
	mov r15,rax
	add r15,rdx
	sub r14,r15
	mov r15,rbx
	sub r15,rax
	add r15,rdx
	add r14,r15
	add r13,r14
	sub r12,r13
	mov r13,rax
	add r13,rdx
	mov r15,rbx
	sub r15,rax
	add r15,rdx
	add r13,r15
	mov r15,rax
	add r15,rdx
	sub r13,r15
	mov r14,rbx
	sub r14,rax
	add r14,rdx
	mov r15,rax
	add r15,rdx
	sub r14,r15
	mov r15,rbx
	sub r15,rax
	add r15,rdx
	add r14,r15
	add r13,r14
	mov r14,rax
	add r14,rdx
	mov r15,rbx
	sub r15,rax
	add r15,rdx
	add r14,r15
	mov r15,rax
	add r15,rdx
	sub r14,r15
	mov r15,rbx
	sub r15,rax
	add r15,rdx
	mov r10,rax
	add r10,rdx
	sub r15,r10
	mov r10,rbx
	sub r10,rax
	add r10,rdx
	add r15,r10
	add r14,r15
	sub r13,r14
	sub r12,r13
	mov rbx,  [rsp+8*60]
	add rbx,r12
	mov rax,  [rsp+8*8]
	sub rax,rbx
	mov rbx,rax
	mov rax,  [gbl+8*3]
	mov r8,rax
	sub r8,rbx
	add r8,rdx
	mov r15,rbx
	add r15,rdx
	sub r8,r15
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	add r8,r14
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	mov r14,rbx
	add r14,rdx
	sub r15,r14
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r15,r14
	add r8,r15
	mov r14,rbx
	add r14,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	mov r13,rax
	sub r13,rbx
	add r13,rdx
	mov r15,rbx
	add r15,rdx
	sub r13,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r13,r15
	add r14,r13
	sub r8,r14
	mov r12,rbx
	add r12,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r12,r15
	mov r15,rbx
	add r15,rdx
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r15,r14
	sub r12,r15
	mov r15,rbx
	add r15,rdx
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r15,r14
	mov r14,rbx
	add r14,rdx
	sub r15,r14
	sub r12,r15
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	mov r15,rbx
	add r15,rdx
	mov r13,rax
	sub r13,rbx
	add r13,rdx
	add r15,r13
	mov r13,rbx
	add r13,rdx
	sub r15,r13
	sub r14,r15
	add r12,r14
	sub r8,r12
	mov r12,rax
	sub r12,rbx
	add r12,rdx
	mov r15,rbx
	add r15,rdx
	sub r12,r15
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	add r12,r14
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	add r12,r14
	mov r13,rbx
	add r13,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r13,r15
	mov r15,rbx
	add r15,rdx
	sub r13,r15
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	add r13,r14
	sub r12,r13
	mov r13,rbx
	add r13,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r13,r15
	mov r15,rbx
	add r15,rdx
	sub r13,r15
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	add r13,r14
	mov r15,rbx
	add r15,rdx
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r15,r14
	mov r14,rbx
	add r14,rdx
	sub r15,r14
	mov r10,rax
	sub r10,rbx
	add r10,rdx
	mov r14,rbx
	add r14,rdx
	sub r10,r14
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r10,r14
	add r15,r10
	sub r13,r15
	sub r12,r13
	add r8,r12
	mov r12,rbx
	add r12,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r12,r15
	mov r14,rbx
	add r14,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	sub r12,r14
	mov r14,rbx
	add r14,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	sub r12,r14
	mov r13,rax
	sub r13,rbx
	add r13,rdx
	mov r15,rbx
	add r15,rdx
	sub r13,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r13,r15
	mov r14,rbx
	add r14,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	sub r13,r14
	add r12,r13
	mov r13,rax
	sub r13,rbx
	add r13,rdx
	mov r15,rbx
	add r15,rdx
	sub r13,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r13,r15
	mov r15,rbx
	add r15,rdx
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r15,r14
	mov r14,rbx
	add r14,rdx
	sub r15,r14
	sub r13,r15
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	mov r10,rbx
	add r10,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r10,r15
	mov r15,rbx
	add r15,rdx
	sub r10,r15
	sub r14,r10
	add r13,r14
	add r12,r13
	mov r10,rax
	sub r10,rbx
	add r10,rdx
	mov r15,rbx
	add r15,rdx
	sub r10,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	mov r14,rbx
	add r14,rdx
	sub r15,r14
	add r10,r15
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	add r10,r14
	mov r13,rbx
	add r13,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r13,r15
	mov r15,rbx
	add r15,rdx
	sub r13,r15
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	add r13,r14
	sub r10,r13
	mov r15,rbx
	add r15,rdx
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r15,r14
	mov r14,rbx
	add r14,rdx
	sub r15,r14
	mov r13,rax
	sub r13,rbx
	add r13,rdx
	mov r14,rbx
	add r14,rdx
	sub r13,r14
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r13,r14
	add r15,r13
	mov r13,rbx
	add r13,rdx
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r13,r14
	mov r14,rbx
	add r14,rdx
	sub r13,r14
	mov r9,rax
	sub r9,rbx
	add r9,rdx
	mov r14,rbx
	add r14,rdx
	sub r9,r14
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r9,r14
	add r13,r9
	sub r15,r13
	sub r10,r15
	add r12,r10
	sub r8,r12
	mov rdx,r8
	mov r8,rax
	sub r8,rbx
	add r8,rdx
	mov r15,rbx
	add r15,rdx
	sub r8,r15
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	add r8,r14
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	mov r14,rbx
	add r14,rdx
	sub r15,r14
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r15,r14
	add r8,r15
	mov r13,rbx
	add r13,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r13,r15
	mov r15,rbx
	add r15,rdx
	sub r13,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	mov r14,rbx
	add r14,rdx
	sub r15,r14
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r15,r14
	add r13,r15
	sub r8,r13
	mov r13,rbx
	add r13,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r13,r15
	mov r15,rbx
	add r15,rdx
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r15,r14
	sub r13,r15
	mov r15,rbx
	add r15,rdx
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r15,r14
	mov r14,rbx
	add r14,rdx
	sub r15,r14
	sub r13,r15
	mov r12,rax
	sub r12,rbx
	add r12,rdx
	mov r15,rbx
	add r15,rdx
	sub r12,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r12,r15
	mov r15,rbx
	add r15,rdx
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r15,r14
	mov r14,rbx
	add r14,rdx
	sub r15,r14
	sub r12,r15
	add r13,r12
	sub r8,r13
	mov r12,rax
	sub r12,rbx
	add r12,rdx
	mov r15,rbx
	add r15,rdx
	sub r12,r15
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	add r12,r14
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	add r12,r14
	mov r13,rbx
	add r13,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r13,r15
	mov r15,rbx
	add r15,rdx
	sub r13,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	mov r14,rbx
	add r14,rdx
	sub r15,r14
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r15,r14
	add r13,r15
	sub r12,r13
	mov r14,rbx
	add r14,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	mov r13,rax
	sub r13,rbx
	add r13,rdx
	mov r15,rbx
	add r15,rdx
	sub r13,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r13,r15
	add r14,r13
	mov r15,rbx
	add r15,rdx
	mov r13,rax
	sub r13,rbx
	add r13,rdx
	add r15,r13
	mov r13,rbx
	add r13,rdx
	sub r15,r13
	mov r10,rax
	sub r10,rbx
	add r10,rdx
	mov r13,rbx
	add r13,rdx
	sub r10,r13
	mov r13,rax
	sub r13,rbx
	add r13,rdx
	add r10,r13
	add r15,r10
	sub r14,r15
	sub r12,r14
	add r8,r12
	mov r12,rbx
	add r12,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r12,r15
	mov r14,rbx
	add r14,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	sub r12,r14
	mov r14,rbx
	add r14,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	sub r12,r14
	mov r13,rax
	sub r13,rbx
	add r13,rdx
	mov r15,rbx
	add r15,rdx
	sub r13,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r13,r15
	mov r14,rbx
	add r14,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	sub r13,r14
	add r12,r13
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	mov r15,rbx
	add r15,rdx
	mov r13,rax
	sub r13,rbx
	add r13,rdx
	add r15,r13
	mov r13,rbx
	add r13,rdx
	sub r15,r13
	sub r14,r15
	mov r10,rax
	sub r10,rbx
	add r10,rdx
	mov r15,rbx
	add r15,rdx
	sub r10,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r10,r15
	mov r13,rbx
	add r13,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r13,r15
	mov r15,rbx
	add r15,rdx
	sub r13,r15
	sub r10,r13
	add r14,r10
	add r12,r14
	mov r10,rax
	sub r10,rbx
	add r10,rdx
	mov r15,rbx
	add r15,rdx
	sub r10,r15
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	add r10,r14
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	mov r14,rbx
	add r14,rdx
	sub r15,r14
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r15,r14
	add r10,r15
	mov r13,rbx
	add r13,rdx
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r13,r15
	mov r15,rbx
	add r15,rdx
	sub r13,r15
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r15,rbx
	add r15,rdx
	sub r14,r15
	mov r15,rax
	sub r15,rbx
	add r15,rdx
	add r14,r15
	add r13,r14
	sub r10,r13
	mov r15,rbx
	add r15,rdx
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r15,r14
	mov r14,rbx
	add r14,rdx
	sub r15,r14
	mov r13,rax
	sub r13,rbx
	add r13,rdx
	mov r14,rbx
	add r14,rdx
	sub r13,r14
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r13,r14
	add r15,r13
	mov r9,rbx
	add r9,rdx
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	add r9,r14
	mov r14,rbx
	add r14,rdx
	sub r9,r14
	mov r14,rax
	sub r14,rbx
	add r14,rdx
	mov r13,rbx
	add r13,rdx
	sub r14,r13
	mov r13,rax
	sub r13,rbx
	add r13,rdx
	add r14,r13
	add r9,r14
	sub r15,r9
	sub r10,r15
	add r12,r10
	sub r8,r12
	mov rax,r8
	mov qword [gbl+8*7],rbx
	mov qword [gbl+8*9],rdx
	mov qword [gbl+8*3],rax
	jmp L_2081
	
L_2082:
	mov rbx,  [gbl+8*7]
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
	mov     rsi, t381
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
	mov  r14, rax
	mov rbx,  [gbl+8*9]
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
	mov     rsi,  r15
	mov     rdi,  r14
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r14, rax
	mov     rsi, t386
	mov     rdi,  r14
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r14, rax
	mov rbx,  [gbl+8*3]
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
	mov     rsi,  r15
	mov     rdi,  r14
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov  r14, rax
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
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2632
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*7],rbx
	mov rbx,1
	mov rax,rbx
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*3],rbx
	mov qword [gbl+8*9],rax
	mov rbx,  [rsp+8*321]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   4616
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
	
t386:
	 db 1," " ,0

t381:
	 db 1," " ,0


