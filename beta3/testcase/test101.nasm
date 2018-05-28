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
	sub    rsp, 800
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 2784
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rdx,700
	mov rbx,rdx
	mov qword [rsp+8*2],rbx
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
	mov     qword [rsp+8*3], rax
	mov rbx,  [rsp+8*3]
	mov rdx,0
	lea rax,[rbx+rdx*8+8H]
	mov rdx,  [rsp+8*2]
	mov [rax],rdx
	mov rdx,1
	lea rax,[rbx+rdx*8+8H]
	mov rdx,  [rsp+8*2]
	mov [rax],rdx
	mov qword [rsp+8*4],rax
	mov     rdi, [rsp+8*3]
	push r11
	push r10
	push r9
	push r8
	call    multiArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [rsp+8*3], rax
	mov rbx,  [rsp+8*3]
	mov r12,rbx
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
	mov     qword [rsp+8*6], rax
	mov rbx,  [rsp+8*6]
	mov rdx,0
	lea rax,[rbx+rdx*8+8H]
	mov rdx,  [rsp+8*2]
	mov [rax],rdx
	mov rdx,1
	lea rax,[rbx+rdx*8+8H]
	mov rdx,  [rsp+8*2]
	mov [rax],rdx
	mov qword [rsp+8*7],rax
	mov     rdi, [rsp+8*6]
	push r11
	push r10
	push r9
	push r8
	call    multiArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [rsp+8*6], rax
	mov rbx,  [rsp+8*6]
	mov r11,rbx
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
	mov     qword [rsp+8*9], rax
	mov rbx,  [rsp+8*9]
	mov rdx,0
	lea rax,[rbx+rdx*8+8H]
	mov rdx,  [rsp+8*2]
	mov [rax],rdx
	mov rdx,1
	lea rax,[rbx+rdx*8+8H]
	mov rdx,  [rsp+8*2]
	mov [rax],rdx
	mov qword [rsp+8*10],rax
	mov     rdi, [rsp+8*9]
	push r11
	push r10
	push r9
	push r8
	call    multiArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [rsp+8*9], rax
	mov rdx,  [rsp+8*9]
	mov rbx,rdx
	mov rax,0
	mov r10,rax
	mov qword [rsp+8*11],rbx
	
L_0:
	mov rbx,  [rsp+8*2]
	cmp r10,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*13],rdx
	je L_1
	mov rbx,0
	mov r9,rbx
	
L_3:
	mov rbx,  [rsp+8*2]
	cmp r9,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*15],rdx
	je L_4
	mov rbx,r10
	add rbx,r9
	mov rdx,r12
	lea rax,[rdx+r10*8+8H]
	mov rdx, [rax]
	lea rax,[rdx+r9*8+8H]
	mov [rax],rbx
	mov rbx,1
	add r9,rbx
	mov qword [rsp+8*17],rdx
	mov qword [rsp+8*18],rax
	jmp L_3
	
L_4:
	mov rbx,1
	add r10,rbx
	jmp L_0
	
L_1:
	mov rbx,0
	mov r10,rbx
	
L_6:
	mov rbx,  [rsp+8*2]
	cmp r10,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*19],rdx
	je L_7
	mov rbx,0
	mov r9,rbx
	
L_9:
	mov rbx,  [rsp+8*2]
	cmp r9,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*20],rdx
	je L_10
	mov rbx,0
	mov r8,rbx
	
L_12:
	mov rbx,  [rsp+8*2]
	cmp r8,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*22],rdx
	je L_13
	cmp r9,r10
	mov rbx, 0
	setge bl
	cmp rbx, 0
	mov qword [rsp+8*23],rbx
	je L_16
	mov rbx,r11
	lea rdx,[rbx+r10*8+8H]
	mov rbx, [rdx]
	lea rdx,[rbx+r9*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*24],rbx
	mov rbx,r12
	mov qword [rsp+8*25],rdx
	lea rdx,[rbx+r10*8+8H]
	mov rbx, [rdx]
	lea rdx,[rbx+r8*8+8H]
	mov qword [rsp+8*27],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*28],rdx
	mov rdx,r12
	mov qword [rsp+8*26],rax
	lea rax,[rdx+r8*8+8H]
	mov rdx, [rax]
	lea rax,[rdx+r9*8+8H]
	mov qword [rsp+8*30],rdx
	mov rdx, [rax]
	mov qword [rsp+8*31],rax
	mov rax,rdx
	mov rsi,rbx
	mov qword [rsp+8*29],rbx
	mov rbx,  [rsp+8*26]
	mov rdi,rbx
	mov r15,rdi
	mov r14,rsi
	mov r13,rax
	mov rbx,r15
	add rbx,r14
	add rbx,r13
	mov qword [rsp+8*32],rdx
	mov rdx,1
	mov qword [arg+8*2],rax
	mov rax,rdx
	mov rcx,30
	shl rax,cl
	mov qword [rsp+8*39],rbx
	mov rbx,1
	sub rax,rbx
	mov rdx,  [rsp+8*39]
	and rdx,rax
	mov r15,rdx
	mov rbx,r15
	mov qword [rsp+8*40],rax
	mov rax,r11
	mov qword [rsp+8*39],rdx
	lea rdx,[rax+r10*8+8H]
	mov rax, [rdx]
	lea rdx,[rax+r9*8+8H]
	mov [rdx],rbx
	mov qword [rsp+8*42],rbx
	mov rbx,r11
	mov qword [rsp+8*44],rdx
	lea rdx,[rbx+r10*8+8H]
	mov rbx, [rdx]
	lea rdx,[rbx+r9*8+8H]
	mov qword [rsp+8*45],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*46],rdx
	mov rdx,r12
	mov qword [rsp+8*43],rax
	lea rax,[rdx+r10*8+8H]
	mov rdx, [rax]
	lea rax,[rdx+r8*8+8H]
	mov qword [rsp+8*48],rdx
	mov rdx, [rax]
	mov r15,r12
	mov qword [rsp+8*49],rax
	lea rax,[r15+r8*8+8H]
	mov r15, [rax]
	lea rax,[r15+r9*8+8H]
	mov r15, [rax]
	mov qword [rsp+8*52],rax
	mov rax,r15
	mov rsi,rdx
	mov rdi,rbx
	mov r15,rdi
	mov r14,rsi
	mov r13,rax
	mov qword [rsp+8*47],rbx
	mov rbx,r15
	add rbx,r14
	add rbx,r13
	mov qword [rsp+8*50],rdx
	mov rdx,1
	mov qword [arg+8*2],rax
	mov rax,rdx
	mov rcx,30
	shl rax,cl
	mov qword [rsp+8*39],rbx
	mov rbx,1
	sub rax,rbx
	mov rdx,  [rsp+8*39]
	and rdx,rax
	mov r15,rdx
	mov r14,r15
	mov rbx,  [rsp+8*11]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov [r15],r14
	mov r15,r11
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov r14, [r15]
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r8*8+8H]
	mov r13, [r15]
	mov r15,r12
	lea r15,[r15+r8*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	mov qword [rsp+8*40],rax
	mov rax,r15
	mov rsi,r13
	mov rdi,r14
	mov r15,rdi
	mov r14,rsi
	mov r13,rax
	mov rdx,r15
	add rdx,r14
	add rdx,r13
	mov rbx,1
	mov qword [arg+8*2],rax
	mov rax,rbx
	mov rcx,30
	shl rax,cl
	mov qword [rsp+8*39],rdx
	mov rdx,1
	sub rax,rdx
	mov rbx,  [rsp+8*39]
	and rbx,rax
	mov r15,rbx
	mov r15,r15
	mov rdx,  [rsp+8*11]
	mov r14,rdx
	lea r14,[r14+r10*8+8H]
	mov r14, [r14]
	lea r14,[r14+r9*8+8H]
	mov [r14],r15
	mov r15,r11
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov r13, [r15]
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r8*8+8H]
	mov r14, [r15]
	mov r15,r12
	lea r15,[r15+r8*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	mov qword [rsp+8*40],rax
	mov rax,r15
	mov rsi,r14
	mov rdi,r13
	mov r15,rdi
	mov r14,rsi
	mov r13,rax
	mov rbx,r15
	add rbx,r14
	add rbx,r13
	mov qword [arg+8*2],rax
	mov rax,1
	mov rdx,rax
	mov rcx,30
	shl rdx,cl
	mov rax,1
	sub rdx,rax
	and rbx,rdx
	mov r15,rbx
	mov r14,r15
	mov rbx,  [rsp+8*11]
	mov r15,rbx
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r9*8+8H]
	mov [r15],r14
	mov qword [rsp+8*40],rdx
	
L_16:
	mov rbx,1
	add r8,rbx
	jmp L_12
	
L_13:
	mov rbx,1
	add r9,rbx
	jmp L_9
	
L_10:
	mov rbx,1
	add r10,rbx
	jmp L_6
	
L_7:
	mov rbx,0
	mov r15,rbx
	mov rdx,0
	mov r10,rdx
	
L_17:
	mov rbx,  [rsp+8*2]
	cmp r10,rbx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_18
	mov rbx,0
	mov r9,rbx
	
L_20:
	mov rbx,  [rsp+8*2]
	cmp r9,rbx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_21
	mov r14,r11
	lea r14,[r14+r10*8+8H]
	mov r14, [r14]
	lea r14,[r14+r9*8+8H]
	mov r14, [r14]
	add r15,r14
	mov rbx,1
	mov r14,rbx
	mov rcx,30
	shl r14,cl
	mov rdx,1
	sub r14,rdx
	and r15,r14
	mov r15,r15
	mov rax,1
	add r9,rax
	jmp L_20
	
L_21:
	mov rbx,1
	add r10,rbx
	jmp L_17
	
L_18:
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
	sub    rsp, 800
	mov rbx,  [rsp+8*92]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   2784
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
	

