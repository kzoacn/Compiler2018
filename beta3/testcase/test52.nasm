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
	sub    rsp, 952
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 2936
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rbx,106
	mov rdi,rbx
	mov r15,rdi
	mov     rdi,  r15
	push r11
	push r10
	call    mallocArray
	pop r10
	pop r11
	mov     qword [rsp+8*4], rax
	mov rdx,  [rsp+8*4]
	mov rbx,rdx
	mov rax,0
	mov r14,rax
	mov qword [gbl+8*5],rbx
	
L_1019:
	cmp r14,r15
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*7],rbx
	je L_1020
	mov     rdi,  r15
	push r11
	push r10
	call    mallocArray
	pop r10
	pop r11
	mov     qword [rsp+8*8], rax
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	lea rax,[rbx+r14*8+8H]
	mov qword [rsp+8*9],rbx
	mov rbx,  [rsp+8*8]
	mov [rax],rbx
	mov qword [rsp+8*10],rax
	mov rax,0
	mov rbx,rax
	mov qword [gbl+8*11],rbx
	
L_1021:
	mov rbx,  [gbl+8*11]
	cmp rbx,r15
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*12],rdx
	je L_1022
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	lea rax,[rbx+r14*8+8H]
	mov rbx, [rax]
	mov rdx,  [gbl+8*11]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*13],rbx
	mov rbx,0
	mov [rax],rbx
	mov rbx,rdx
	mov qword [rsp+8*15],rbx
	mov rbx,1
	add rdx,rbx
	mov qword [gbl+8*11],rdx
	mov qword [rsp+8*14],rax
	jmp L_1021
	
L_1022:
	mov rbx,r14
	mov rdx,1
	add r14,rdx
	mov qword [rsp+8*16],rbx
	jmp L_1019
	
L_1020:
	mov rbx,0
	mov r15,rbx
	mov rdx,r15
	mov rax,101
	mov r11,rax
	mov rbx,1
	mov qword [rsp+8*18],rdx
	mov rdx,r11
	sub rdx,rbx
	mov r13,rdx
	mov r12,r13
	mov rbx,0
	mov r14,rbx
	mov qword [rsp+8*20],rdx
	
L_999:
	cmp r14,r11
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*23],rbx
	je L_1000
	mov rdx,0
	mov rbx,rdx
	mov qword [gbl+8*11],rbx
	
L_1002:
	mov rbx,  [gbl+8*11]
	cmp rbx,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1003
	mov rbx,1
	mov rdx,rbx
	neg rdx
	mov rax,  [gbl+8*5]
	mov r15,rax
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	mov rbx,  [gbl+8*11]
	lea r15,[r15+rbx*8+8H]
	mov [r15],rdx
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [gbl+8*11],rbx
	jmp L_1002
	
L_1003:
	mov r15,r14
	mov rbx,1
	add r14,rbx
	jmp L_999
	
L_1000:
	
L_1005:
	mov rbx,  [gbl+8*30]
	mov rdx,  [gbl+8*31]
	cmp rbx,rdx
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1006
	mov rbx,  [gbl+8*33]
	mov r15,rbx
	mov rdx,  [gbl+8*30]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov r14,r15
	mov rax,  [gbl+8*38]
	mov r15,rax
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov rbx,r15
	mov rax,  [gbl+8*5]
	mov r15,rax
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rdx,r15
	mov rax,1
	mov qword [gbl+8*42],rbx
	mov rbx,r14
	sub rbx,rax
	mov rax,  [gbl+8*42]
	mov qword [gbl+8*46],rdx
	mov rdx,2
	mov r15,rax
	sub r15,rdx
	mov rsi,r15
	mov rdi,rbx
	mov rbx,rdi
	mov rdx,rsi
	mov rsi,r11
	mov rdi,rbx
	mov rax,rdi
	mov r15,rsi
	cmp rax,r15
	mov qword [rsp+8*51],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*50],rbx
	mov qword [rsp+8*54],rdx
	mov qword [rsp+8*52],rax
	jne L_1056
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1057
	
L_1056:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1057:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	cmp rdx, 0
	mov qword [rsp+8*57],rdx
	jne L_1060
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1061
	
L_1060:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*54],rax
	jne L_1062
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1063
	
L_1062:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1063:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	mov rax,rdx
	mov qword [rsp+8*59],rdx
	mov qword [rsp+8*58],rax
	
L_1061:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1066
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov rax,1
	mov qword [rsp+8*62],rbx
	mov rbx,rax
	neg rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [rsp+8*62]
	cmp rdx,rbx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rax
	je L_1067
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*33]
	mov rdx,rbx
	mov qword [rsp+8*65],rax
	mov rax,  [gbl+8*31]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rbx],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*68],rax
	mov rax,  [gbl+8*46]
	mov qword [rsp+8*69],rbx
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*70],rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rdx],rbx
	mov rax,  [rsp+8*50]
	cmp rax,r12
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*72],rdx
	jne L_1068
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1069
	
L_1068:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1069:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1070
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1070:
	
L_1067:
	
L_1066:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,1
	mov r15,r14
	sub r15,rdx
	mov rax,  [gbl+8*42]
	mov rdx,2
	mov rbx,rax
	add rbx,rdx
	mov rsi,rbx
	mov rdi,r15
	mov rbx,rdi
	mov rdx,rsi
	mov rsi,r11
	mov rdi,rbx
	mov rax,rdi
	mov r15,rsi
	cmp rax,r15
	mov qword [rsp+8*51],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*50],rbx
	mov qword [rsp+8*54],rdx
	mov qword [rsp+8*52],rax
	jne L_1073
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1074
	
L_1073:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1074:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	cmp rdx, 0
	mov qword [rsp+8*57],rdx
	jne L_1077
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1078
	
L_1077:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*54],rax
	jne L_1079
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1080
	
L_1079:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1080:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	mov rax,rdx
	mov qword [rsp+8*59],rdx
	mov qword [rsp+8*58],rax
	
L_1078:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1083
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov rax,1
	mov qword [rsp+8*62],rbx
	mov rbx,rax
	neg rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [rsp+8*62]
	cmp rdx,rbx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rax
	je L_1084
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*33]
	mov rdx,rbx
	mov qword [rsp+8*65],rax
	mov rax,  [gbl+8*31]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rbx],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*68],rax
	mov rax,  [gbl+8*46]
	mov qword [rsp+8*69],rbx
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*70],rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rdx],rbx
	mov rax,  [rsp+8*50]
	cmp rax,r12
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*72],rdx
	jne L_1085
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1086
	
L_1085:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1086:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1087
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1087:
	
L_1084:
	
L_1083:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,1
	mov r15,r14
	add r15,rdx
	mov rax,  [gbl+8*42]
	mov rdx,2
	mov rbx,rax
	sub rbx,rdx
	mov rsi,rbx
	mov rdi,r15
	mov rbx,rdi
	mov rdx,rsi
	mov rsi,r11
	mov rdi,rbx
	mov rax,rdi
	mov r15,rsi
	cmp rax,r15
	mov qword [rsp+8*51],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*50],rbx
	mov qword [rsp+8*54],rdx
	mov qword [rsp+8*52],rax
	jne L_1090
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1091
	
L_1090:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1091:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	cmp rdx, 0
	mov qword [rsp+8*57],rdx
	jne L_1094
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1095
	
L_1094:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*54],rax
	jne L_1096
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1097
	
L_1096:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1097:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	mov rax,rdx
	mov qword [rsp+8*59],rdx
	mov qword [rsp+8*58],rax
	
L_1095:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1100
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov rax,1
	mov qword [rsp+8*62],rbx
	mov rbx,rax
	neg rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [rsp+8*62]
	cmp rdx,rbx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rax
	je L_1101
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*33]
	mov rdx,rbx
	mov qword [rsp+8*65],rax
	mov rax,  [gbl+8*31]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rbx],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*68],rax
	mov rax,  [gbl+8*46]
	mov qword [rsp+8*69],rbx
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*70],rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rdx],rbx
	mov rax,  [rsp+8*50]
	cmp rax,r12
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*72],rdx
	jne L_1102
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1103
	
L_1102:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1103:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1104
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1104:
	
L_1101:
	
L_1100:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,1
	mov r15,r14
	add r15,rdx
	mov rax,  [gbl+8*42]
	mov rdx,2
	mov rbx,rax
	add rbx,rdx
	mov rsi,rbx
	mov rdi,r15
	mov rbx,rdi
	mov rdx,rsi
	mov rsi,r11
	mov rdi,rbx
	mov rax,rdi
	mov r15,rsi
	cmp rax,r15
	mov qword [rsp+8*51],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*50],rbx
	mov qword [rsp+8*54],rdx
	mov qword [rsp+8*52],rax
	jne L_1107
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1108
	
L_1107:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1108:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	cmp rdx, 0
	mov qword [rsp+8*57],rdx
	jne L_1111
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1112
	
L_1111:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*54],rax
	jne L_1113
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1114
	
L_1113:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1114:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	mov rax,rdx
	mov qword [rsp+8*59],rdx
	mov qword [rsp+8*58],rax
	
L_1112:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1117
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov rax,1
	mov qword [rsp+8*62],rbx
	mov rbx,rax
	neg rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [rsp+8*62]
	cmp rdx,rbx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rax
	je L_1118
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*33]
	mov rdx,rbx
	mov qword [rsp+8*65],rax
	mov rax,  [gbl+8*31]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rbx],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*68],rax
	mov rax,  [gbl+8*46]
	mov qword [rsp+8*69],rbx
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*70],rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rdx],rbx
	mov rax,  [rsp+8*50]
	cmp rax,r12
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*72],rdx
	jne L_1119
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1120
	
L_1119:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1120:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1121
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1121:
	
L_1118:
	
L_1117:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,2
	mov r15,r14
	sub r15,rdx
	mov rax,  [gbl+8*42]
	mov rdx,1
	mov rbx,rax
	sub rbx,rdx
	mov rsi,rbx
	mov rdi,r15
	mov rbx,rdi
	mov rdx,rsi
	mov rsi,r11
	mov rdi,rbx
	mov rax,rdi
	mov r15,rsi
	cmp rax,r15
	mov qword [rsp+8*51],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*50],rbx
	mov qword [rsp+8*54],rdx
	mov qword [rsp+8*52],rax
	jne L_1124
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1125
	
L_1124:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1125:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	cmp rdx, 0
	mov qword [rsp+8*57],rdx
	jne L_1128
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1129
	
L_1128:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*54],rax
	jne L_1130
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1131
	
L_1130:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1131:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	mov rax,rdx
	mov qword [rsp+8*59],rdx
	mov qword [rsp+8*58],rax
	
L_1129:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1134
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov rax,1
	mov qword [rsp+8*62],rbx
	mov rbx,rax
	neg rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [rsp+8*62]
	cmp rdx,rbx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rax
	je L_1135
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*33]
	mov rdx,rbx
	mov qword [rsp+8*65],rax
	mov rax,  [gbl+8*31]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rbx],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*68],rax
	mov rax,  [gbl+8*46]
	mov qword [rsp+8*69],rbx
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*70],rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rdx],rbx
	mov rax,  [rsp+8*50]
	cmp rax,r12
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*72],rdx
	jne L_1136
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1137
	
L_1136:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1137:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1138
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1138:
	
L_1135:
	
L_1134:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,2
	mov rax,r14
	sub rax,rdx
	mov rdx,  [gbl+8*42]
	mov rbx,1
	mov r15,rdx
	add r15,rbx
	mov rsi,r15
	mov rdi,rax
	mov rbx,rdi
	mov rax,rsi
	mov rsi,r11
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov qword [rsp+8*51],rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*50],rbx
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*54],rax
	jne L_1141
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1142
	
L_1141:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1142:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	cmp rdx, 0
	mov qword [rsp+8*57],rdx
	jne L_1145
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1146
	
L_1145:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*54],rax
	jne L_1147
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1148
	
L_1147:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1148:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	mov rax,rdx
	mov qword [rsp+8*59],rdx
	mov qword [rsp+8*58],rax
	
L_1146:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1151
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov rax,1
	mov qword [rsp+8*62],rbx
	mov rbx,rax
	neg rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [rsp+8*62]
	cmp rdx,rbx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rax
	je L_1152
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*33]
	mov rdx,rbx
	mov qword [rsp+8*65],rax
	mov rax,  [gbl+8*31]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rbx],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*68],rax
	mov rax,  [gbl+8*46]
	mov qword [rsp+8*69],rbx
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*70],rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rdx],rbx
	mov rax,  [rsp+8*50]
	cmp rax,r12
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*72],rdx
	jne L_1153
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1154
	
L_1153:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1154:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1155
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1155:
	
L_1152:
	
L_1151:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,2
	mov rax,r14
	add rax,rdx
	mov rdx,  [gbl+8*42]
	mov rbx,1
	mov r15,rdx
	sub r15,rbx
	mov rsi,r15
	mov rdi,rax
	mov rbx,rdi
	mov rax,rsi
	mov rsi,r11
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov qword [rsp+8*51],rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*50],rbx
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*54],rax
	jne L_1158
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1159
	
L_1158:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1159:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	cmp rdx, 0
	mov qword [rsp+8*57],rdx
	jne L_1162
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1163
	
L_1162:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*54],rax
	jne L_1164
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1165
	
L_1164:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1165:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	mov rax,rdx
	mov qword [rsp+8*59],rdx
	mov qword [rsp+8*58],rax
	
L_1163:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1168
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov rax,1
	mov qword [rsp+8*62],rbx
	mov rbx,rax
	neg rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [rsp+8*62]
	cmp rdx,rbx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*64],rax
	je L_1169
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*33]
	mov rdx,rbx
	mov qword [rsp+8*65],rax
	mov rax,  [gbl+8*31]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rbx],rdx
	mov qword [rsp+8*67],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*68],rax
	mov rax,  [gbl+8*46]
	mov qword [rsp+8*69],rbx
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*70],rdx
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rdx],rbx
	mov rax,  [rsp+8*50]
	cmp rax,r12
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*73],rbx
	mov qword [rsp+8*72],rdx
	jne L_1170
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1171
	
L_1170:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1171:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1172
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1172:
	
L_1169:
	
L_1168:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,2
	mov r15,r14
	add r15,rdx
	mov rax,  [gbl+8*42]
	mov rdx,1
	mov r14,rax
	add r14,rdx
	mov rsi,r14
	mov rdi,r15
	mov rdx,rdi
	mov rax,rsi
	mov rsi,r11
	mov rdi,rdx
	mov rbx,rdi
	mov r15,rsi
	cmp rbx,r15
	mov qword [rsp+8*51],rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*52],rbx
	mov qword [rsp+8*50],rdx
	mov qword [rsp+8*54],rax
	jne L_1175
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1176
	
L_1175:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1176:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	cmp rdx, 0
	mov qword [rsp+8*57],rdx
	jne L_1179
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*58],rbx
	jmp L_1180
	
L_1179:
	mov rsi,r11
	mov rbx,  [rsp+8*51]
	mov rdi,rbx
	mov rdx,rdi
	mov r15,rsi
	cmp rdx,r15
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*54],rax
	jne L_1181
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*54],rbx
	jmp L_1182
	
L_1181:
	mov rbx,  [rsp+8*52]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	mov rbx,rax
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*55],rax
	
L_1182:
	mov rbx,  [rsp+8*54]
	mov r15,rbx
	mov rdx,r15
	mov rax,rdx
	mov qword [rsp+8*59],rdx
	mov qword [rsp+8*58],rax
	
L_1180:
	mov rbx,  [rsp+8*58]
	cmp rbx, 0
	je L_1185
	mov rdx,  [gbl+8*5]
	mov rbx,rdx
	mov rax,  [rsp+8*50]
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,  [rsp+8*51]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*61],rdx
	mov rdx,1
	mov rax,rdx
	neg rax
	cmp rbx,rax
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*62],rbx
	mov qword [rsp+8*64],rdx
	mov qword [rsp+8*63],rax
	je L_1186
	mov rbx,  [gbl+8*31]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rax,  [gbl+8*33]
	mov rdx,rax
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*66],rdx
	mov rdx,  [rsp+8*50]
	mov [rax],rdx
	mov qword [rsp+8*67],rax
	mov qword [gbl+8*31],rbx
	mov rbx,  [gbl+8*38]
	mov rax,rbx
	mov rdx,  [gbl+8*31]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*51]
	mov [rbx],rdx
	mov qword [rsp+8*69],rbx
	mov rbx,  [gbl+8*46]
	mov qword [rsp+8*68],rax
	mov rax,1
	mov rdx,rbx
	add rdx,rax
	mov rax,  [gbl+8*5]
	mov rbx,rax
	mov qword [rsp+8*70],rdx
	mov rdx,  [rsp+8*50]
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,  [rsp+8*51]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*71],rbx
	mov rbx,  [rsp+8*70]
	mov [rax],rbx
	mov rbx,  [rsp+8*50]
	cmp rbx,r12
	mov qword [rsp+8*72],rax
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*73],rax
	jne L_1187
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*73],rbx
	jmp L_1188
	
L_1187:
	mov rbx,  [rsp+8*51]
	cmp rbx,r13
	mov rdx, 0
	sete dl
	mov rax,rdx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*73],rax
	
L_1188:
	mov rbx,  [rsp+8*73]
	cmp rbx, 0
	je L_1189
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*75],rbx
	
L_1189:
	
L_1186:
	
L_1185:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,  [gbl+8*75]
	mov rax,1
	cmp rdx,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1008
	jmp L_1006
	
L_1008:
	mov rbx,  [gbl+8*30]
	mov rdx,1
	mov r15,rbx
	add r15,rdx
	mov rbx,r15
	mov qword [gbl+8*30],rbx
	jmp L_1005
	
L_1006:
	mov rbx,  [gbl+8*75]
	mov rdx,1
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1009
	mov rbx,  [gbl+8*5]
	mov r15,rbx
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	mov rdi,r15
	mov r15,rdi
	mov     rdi,  r15
	push r11
	push r10
	call    toString
	pop r10
	pop r11
	mov     qword r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, r15 
	add rdi, 1 
	push r11
	push r10
	call puts
	pop r10
	pop r11
	jmp L_1010
	
L_1009:
	mov rbx,t211
	mov rdi,rbx
	mov r15,rdi
	mov rdi, r15 
	add rdi, 1 
	push r11
	push r10
	call puts
	pop r10
	pop r11
	
L_1010:
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 952
	mov     rdi, 12000
	push r11
	push r10
	call    mallocArray
	pop r10
	pop r11
	mov     qword [gbl+8*109], rax
	mov rdx,  [gbl+8*109]
	mov rbx,rdx
	mov qword [gbl+8*33],rbx
	mov     rdi, 12000
	push r11
	push r10
	call    mallocArray
	pop r10
	pop r11
	mov     qword [gbl+8*110], rax
	mov rdx,  [gbl+8*110]
	mov rbx,rdx
	mov qword [gbl+8*38],rbx
	mov rbx,  [rsp+8*111]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   2936
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
	
t211:
	 db 12,"no solution!" ,0


