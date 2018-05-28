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
	inc eax
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


dfs:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1416
	mov r15,rdi
	mov rdi,r15
	mov r14,rdi
	mov     rdi,  r14
	push r11
	push r10
	call    toString
	pop r10
	pop r11
	mov     qword r14, rax
	mov rdi,r14
	mov r14,rdi
	mov rdi, r14 
	inc rdi
	push r11
	push r10
	call puts
	pop r10
	pop r11
	cmp r15,r12
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_32
	mov rbx,0
	mov r15,rbx
	
L_124:
	cmp r15,r13
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*10],rbx
	je L_125
	mov rbx,0
	mov r11,rbx
	mov rdx,0
	mov r14,rdx
	
L_126:
	mov rbx,3
	cmp r14,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*13],rdx
	je L_127
	mov rdx,  [gbl+8*14]
	mov rbx,rdx
	lea rax,[rbx+r15*8+8H]
	mov rbx, [rax]
	lea rax,[rbx+r14*8+8H]
	mov qword [rsp+8*15],rbx
	mov rbx, [rax]
	mov qword [rsp+8*16],rax
	mov rax,rbx
	cmp rax,0
	mov qword [rsp+8*17],rbx
	mov rbx, 0
	setg bl
	cmp rbx, 0
	mov qword [rsp+8*19],rbx
	mov qword [rsp+8*18],rax
	jne L_128
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*19],rbx
	jmp L_129
	
L_128:
	mov rdx,  [gbl+8*20]
	mov rbx,rdx
	mov rax,  [rsp+8*18]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*21],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*22],rdx
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	sete al
	mov qword [rsp+8*23],rbx
	mov rbx,rax
	mov qword [rsp+8*19],rbx
	mov qword [rsp+8*24],rax
	
L_129:
	mov rbx,  [rsp+8*19]
	cmp rbx, 0
	je L_130
	mov rbx,1
	mov r11,rbx
	
L_130:
	mov rbx,  [rsp+8*18]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*25],rax
	jne L_131
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*25],rbx
	jmp L_132
	
L_131:
	mov rbx,  [rsp+8*18]
	mov rdx,rbx
	neg rdx
	mov rbx,  [gbl+8*20]
	mov rax,rbx
	lea rbx,[rax+rdx*8+8H]
	mov rdx, [rbx]
	mov qword [rsp+8*28],rbx
	mov rbx,0
	cmp rdx,rbx
	mov qword [rsp+8*27],rax
	mov rax, 0
	sete al
	mov rbx,rax
	mov qword [rsp+8*25],rbx
	mov qword [rsp+8*29],rdx
	mov qword [rsp+8*30],rax
	
L_132:
	mov rbx,  [rsp+8*25]
	cmp rbx, 0
	je L_133
	mov rbx,1
	mov r11,rbx
	
L_133:
	mov rbx,1
	add r14,rbx
	jmp L_126
	
L_127:
	mov rbx,0
	cmp r11,rbx
	mov rdx, 0
	sete dl
	cmp rdx, 0
	mov qword [rsp+8*31],rdx
	je L_135
	mov rbx,0
	mov r15,rbx
	jmp L_137
	
L_135:
	mov rbx,1
	add r15,rbx
	jmp L_124
	
L_125:
	mov rbx,1
	mov r15,rbx
	
L_137:
	mov rbx,1
	cmp r15,rbx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_34
	mov rbx,t191
	mov rdi,rbx
	mov r14,rdi
	mov rdx,0
	mov r11,rdx
	
L_52:
	mov rbx,r14
	mov rdx,rbx
	mov rax,rdx
	mov rax, [rax]
	mov qword [rsp+8*37],rbx
	mov rbx,255
	and rax,rbx
	cmp r11,rax
	mov qword [arg+8*63],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*40],rdx
	mov qword [rsp+8*39],rax
	je L_53
	mov rbx,r14
	mov rdi,r11
	mov rdx,rbx
	mov qword [rsp+8*41],rbx
	mov qword [arg+8*63],rdx
	call    ord
	mov     qword [rsp+8*42], rax
	mov rbx,  [gbl+8*43]
	mov rdx,  [rsp+8*42]
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rdx,1
	add r11,rdx
	mov qword [gbl+8*43],rbx
	mov qword [rsp+8*44],rax
	jmp L_52
	
L_53:
	mov rbx,0
	mov r14,rbx
	mov r15,r14
	mov rdx,0
	mov rdi,rdx
	push r15
	push r12
	call print_cond
	pop r12
	pop r15
	mov r15 , rax
	mov rbx,t197
	mov rdi,rbx
	mov r14,rdi
	mov rdx,0
	mov r11,rdx
	
L_57:
	mov rbx,r14
	mov rdx,rbx
	mov rax,rdx
	mov rax, [rax]
	mov qword [rsp+8*37],rbx
	mov rbx,255
	and rax,rbx
	cmp r11,rax
	mov qword [arg+8*63],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*40],rdx
	mov qword [rsp+8*39],rax
	je L_58
	mov rbx,r14
	mov rdi,r11
	mov rdx,rbx
	mov qword [rsp+8*41],rbx
	mov qword [arg+8*63],rdx
	call    ord
	mov     qword [rsp+8*42], rax
	mov rbx,  [gbl+8*43]
	mov rdx,  [rsp+8*42]
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rdx,1
	add r11,rdx
	mov qword [gbl+8*43],rbx
	mov qword [rsp+8*44],rax
	jmp L_57
	
L_58:
	mov rbx,0
	mov r14,rbx
	mov r15,r14
	
L_34:
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
L_32:
	mov rbx,1
	mov r14,r15
	add r14,rbx
	mov rdx,  [gbl+8*20]
	mov r11,rdx
	lea r14,[r11+r14*8+8H]
	mov rax,1
	mov [r14],rax
	mov rbx,1
	mov r14,r15
	add r14,rbx
	mov rdi,r14
	push r15
	push r14
	push r13
	push r12
	call dfs
	pop r12
	pop r13
	pop r14
	pop r15
	mov r14 , rax
	mov rbx,1
	mov r11,r15
	add r11,rbx
	mov rdx,  [gbl+8*20]
	mov r14,rdx
	lea r14,[r14+r11*8+8H]
	mov rax,0
	mov [r14],rax
	mov rbx,1
	add r15,rbx
	mov rdi,r15
	push r15
	push r13
	push r12
	call dfs
	pop r12
	pop r13
	pop r15
	mov r15 , rax
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
print_last_cond:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1416
	mov r14,rdi
	cmp r14,r12
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_36
	mov rbx,t221
	mov rdi,rbx
	mov r14,rdi
	mov rdx,0
	mov r11,rdx
	
L_62:
	mov rbx,r14
	mov rdx,rbx
	mov rax,rdx
	mov rax, [rax]
	mov qword [rsp+8*37],rbx
	mov rbx,255
	and rax,rbx
	cmp r11,rax
	mov qword [arg+8*63],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*40],rdx
	mov qword [rsp+8*39],rax
	je L_63
	mov rbx,r14
	mov rdi,r11
	mov rdx,rbx
	mov qword [rsp+8*41],rbx
	mov qword [arg+8*63],rdx
	call    ord
	mov     qword [rsp+8*42], rax
	mov rbx,  [gbl+8*43]
	mov rdx,  [rsp+8*42]
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rdx,1
	add r11,rdx
	mov qword [gbl+8*43],rbx
	mov qword [rsp+8*44],rax
	jmp L_62
	
L_63:
	mov rbx,0
	mov r14,rbx
	mov r15,r14
	mov rax,1
	mov rdx,rax
	mov rax,0
	mov r13,rax
	mov qword [rsp+8*62],rdx
	
L_37:
	cmp r13,r12
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_38
	mov rbx,1
	mov r14,r13
	add r14,rbx
	mov rdx,  [gbl+8*20]
	mov r15,rdx
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	mov rax,1
	cmp r15,rax
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_41
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*62],rbx
	
L_41:
	mov rbx,1
	mov r14,r13
	add r14,rbx
	mov rdx,  [gbl+8*20]
	mov r15,rdx
	lea r15,[r15+r14*8+8H]
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
	mov r14,rdi
	mov rbx,0
	mov r11,rbx
	
L_67:
	mov rbx,r14
	mov rdx,rbx
	mov rax,rdx
	mov rax, [rax]
	mov qword [rsp+8*37],rbx
	mov rbx,255
	and rax,rbx
	cmp r11,rax
	mov qword [arg+8*63],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*40],rdx
	mov qword [rsp+8*39],rax
	je L_68
	mov rbx,r14
	mov rdi,r11
	mov rdx,rbx
	mov qword [rsp+8*41],rbx
	mov qword [arg+8*63],rdx
	call    ord
	mov     qword [rsp+8*42], rax
	mov rbx,  [gbl+8*43]
	mov rdx,  [rsp+8*42]
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rdx,1
	add r11,rdx
	mov qword [gbl+8*43],rbx
	mov qword [rsp+8*44],rax
	jmp L_67
	
L_68:
	mov rbx,0
	mov r14,rbx
	mov r15,r14
	mov rdx,1
	add r13,rdx
	jmp L_37
	
L_38:
	mov rbx,  [rsp+8*62]
	mov rdx,0
	cmp rbx,rdx
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_42
	mov rbx,t248
	mov rdi,rbx
	mov r14,rdi
	mov rdx,0
	mov r11,rdx
	
L_72:
	mov rbx,r14
	mov rdx,rbx
	mov rax,rdx
	mov rax, [rax]
	mov qword [rsp+8*37],rbx
	mov rbx,255
	and rax,rbx
	cmp r11,rax
	mov qword [arg+8*63],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*40],rdx
	mov qword [rsp+8*39],rax
	je L_73
	mov rbx,r14
	mov rdi,r11
	mov rdx,rbx
	mov qword [rsp+8*41],rbx
	mov qword [arg+8*63],rdx
	call    ord
	mov     qword [rsp+8*42], rax
	mov rbx,  [gbl+8*43]
	mov rdx,  [rsp+8*42]
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rdx,1
	add r11,rdx
	mov qword [gbl+8*43],rbx
	mov qword [rsp+8*44],rax
	jmp L_72
	
L_73:
	mov rbx,0
	mov r14,rbx
	mov r15,r14
	jmp L_43
	
L_42:
	mov rbx,t251
	mov rdi,rbx
	mov r14,rdi
	mov rdx,0
	mov r11,rdx
	
L_77:
	mov rbx,r14
	mov rdx,rbx
	mov rax,rdx
	mov rax, [rax]
	mov qword [rsp+8*37],rbx
	mov rbx,255
	and rax,rbx
	cmp r11,rax
	mov qword [arg+8*63],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*40],rdx
	mov qword [rsp+8*39],rax
	je L_78
	mov rbx,r14
	mov rdi,r11
	mov rdx,rbx
	mov qword [rsp+8*41],rbx
	mov qword [arg+8*63],rdx
	call    ord
	mov     qword [rsp+8*42], rax
	mov rbx,  [gbl+8*43]
	mov rdx,  [rsp+8*42]
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rdx,1
	add r11,rdx
	mov qword [gbl+8*43],rbx
	mov qword [rsp+8*44],rax
	jmp L_77
	
L_78:
	mov rbx,0
	mov r14,rbx
	mov r15,r14
	
L_43:
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
L_36:
	mov rbx,1
	mov r15,r14
	add r15,rbx
	mov rdx,  [gbl+8*20]
	mov r13,rdx
	lea r15,[r13+r15*8+8H]
	mov rax,1
	mov [r15],rax
	mov rbx,1
	mov r15,r14
	add r15,rbx
	mov rdi,r15
	push r15
	push r14
	push r12
	call print_last_cond
	pop r12
	pop r14
	pop r15
	mov r15 , rax
	mov rbx,1
	mov r15,r14
	add r15,rbx
	mov rdx,  [gbl+8*20]
	mov r13,rdx
	lea r15,[r13+r15*8+8H]
	mov rax,0
	mov [r15],rax
	mov rbx,1
	mov r15,r14
	add r15,rbx
	mov rdi,r15
	push r15
	push r12
	call print_last_cond
	pop r12
	pop r15
	mov r15 , rax
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1416
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 3400
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	push r11
	push r10
	call    getInt
	pop r10
	pop r11
	mov      r15, rax
	mov rbx,2
	mov r14,rbx
	imul r14,r15
	mov rdx,1
	add r14,rdx
	mov r12,r14
	mov r13,r15
	mov rbx,1
	mov rax,rbx
	mov rbx,t282
	mov rdi,rbx
	mov r14,rdi
	mov rbx,0
	mov r11,rbx
	mov qword [gbl+8*94],rax
	
L_88:
	mov rbx,r14
	mov rdx,rbx
	mov rax,rdx
	mov rax, [rax]
	mov qword [rsp+8*37],rbx
	mov rbx,255
	and rax,rbx
	cmp r11,rax
	mov qword [arg+8*63],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*40],rdx
	mov qword [rsp+8*39],rax
	je L_89
	mov rbx,r14
	mov rdi,r11
	mov rdx,rbx
	mov qword [rsp+8*41],rbx
	mov qword [arg+8*63],rdx
	call    ord
	mov     qword [rsp+8*42], rax
	mov rbx,  [gbl+8*43]
	mov rdx,  [rsp+8*42]
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rdx,1
	add r11,rdx
	mov qword [gbl+8*43],rbx
	mov qword [rsp+8*44],rax
	jmp L_88
	
L_89:
	mov rbx,0
	mov r14,rbx
	mov r15,r14
	mov     rdi,  r13
	push r11
	push r10
	call    mallocArray
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,r15
	mov rdx,0
	mov r11,rdx
	mov qword [gbl+8*14],rbx
	
L_44:
	cmp r11,r13
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_45
	mov     rdi, 3
	push r11
	push r10
	call    mallocArray
	pop r10
	pop r11
	mov     qword  r15, rax
	mov r14,r15
	mov r15,r14
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov rdx,  [gbl+8*94]
	mov [r15],rdx
	mov rax,1
	mov rbx,rdx
	add rbx,rax
	mov r15,r14
	mov rax,1
	lea r15,[r15+rax*8+8H]
	mov [r15],rbx
	mov rbx,2
	mov r15,rdx
	add r15,rbx
	mov rbx,r15
	neg rbx
	mov r15,r14
	mov rax,2
	lea r15,[r15+rax*8+8H]
	mov [r15],rbx
	mov rbx,2
	mov r15,rdx
	add r15,rbx
	mov rdx,r15
	mov rbx,  [gbl+8*14]
	mov r15,rbx
	lea r15,[r15+r11*8+8H]
	mov [r15],r14
	mov rbx,1
	add r11,rbx
	mov qword [gbl+8*94],rdx
	jmp L_44
	
L_45:
	mov rbx,1
	mov r15,r12
	add r15,rbx
	mov     rdi,  r15
	push r11
	push r10
	call    mallocArray
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,r15
	mov rdx,1
	mov r15,r12
	add r15,rdx
	mov qword [gbl+8*20],rbx
	mov     rdi,  r15
	push r11
	push r10
	call    mallocArray
	pop r10
	pop r11
	mov     qword  r15, rax
	mov rbx,r15
	mov rdx,t319
	mov rdi,rdx
	mov r15,rdi
	mov qword [gbl+8*117],rbx
	mov rdi, r15 
	inc rdi
	push r11
	push r10
	call puts
	pop r10
	pop r11
	mov rbx,0
	mov rdi,rbx
	push r15
	push r13
	push r12
	call dfs
	pop r12
	pop r13
	pop r15
	mov r15 , rax
	mov rbx,t326
	mov rdi,rbx
	mov r15,rdi
	mov rdi, r15 
	inc rdi
	push r11
	push r10
	call puts
	pop r10
	pop r11
	mov rbx,0
	mov rdi,rbx
	push r15
	push r12
	call print_last_cond
	pop r12
	pop r15
	mov r15 , rax
	mov rbx,t333
	mov rdi,rbx
	mov r15,rdi
	mov rdi, r15 
	inc rdi
	push r11
	push r10
	call puts
	pop r10
	pop r11
	mov rbx,  [gbl+8*43]
	mov rdi,rbx
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
	inc rdi
	push r11
	push r10
	call puts
	pop r10
	pop r11
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
print_cond:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1416
	mov r15,rdi
	cmp r15,r12
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_25
	mov rbx,  [gbl+8*20]
	mov rsi,rbx
	mov rdx,  [gbl+8*117]
	mov rdi,rdx
	mov r15,rdi
	mov r14,rsi
	mov rax,0
	mov r13,rax
	mov rbx,0
	mov r11,rbx
	
L_108:
	mov rbx,3
	cmp r11,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*133],rdx
	je L_109
	mov rbx,r15
	lea rdx,[rbx+r11*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*134],rbx
	mov rbx,r14
	mov qword [rsp+8*135],rdx
	lea rdx,[rbx+r11*8+8H]
	mov qword [rsp+8*137],rbx
	mov rbx, [rdx]
	cmp rax,rbx
	mov qword [rsp+8*138],rdx
	mov rdx, 0
	setne dl
	cmp rdx, 0
	mov qword [rsp+8*139],rbx
	mov qword [rsp+8*140],rdx
	mov qword [rsp+8*136],rax
	je L_110
	mov rbx,r13
	mov rdx,1
	add r13,rdx
	mov qword [rsp+8*141],rbx
	
L_110:
	mov rbx,1
	add r11,rbx
	jmp L_108
	
L_109:
	mov r15,r13
	mov rdi,r15
	mov r15,rdi
	mov     rdi,  r15
	push r11
	push r10
	call    toString
	pop r10
	pop r11
	mov     qword r15, rax
	mov     rsi,  r15
	mov     rdi, t133
	push r11
	push r10
	call    concat
	pop r10
	pop r11
	mov  r15, rax
	mov     rsi, t140
	mov     rdi,  r15
	push r11
	push r10
	call    concat
	pop r10
	pop r11
	mov  r15, rax
	mov rdi,r15
	mov r14,rdi
	mov rbx,0
	mov r11,rbx
	
L_114:
	mov rbx,r14
	mov rdx,rbx
	mov rax,rdx
	mov rax, [rax]
	mov qword [rsp+8*37],rbx
	mov rbx,255
	and rax,rbx
	cmp r11,rax
	mov qword [arg+8*63],rdx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*40],rdx
	mov qword [rsp+8*39],rax
	je L_115
	mov rbx,r14
	mov rdi,r11
	mov rdx,rbx
	mov qword [rsp+8*41],rbx
	mov qword [arg+8*63],rdx
	call    ord
	mov     qword [rsp+8*42], rax
	mov rbx,  [gbl+8*43]
	mov rdx,  [rsp+8*42]
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rdx,1
	add r11,rdx
	mov qword [gbl+8*43],rbx
	mov qword [rsp+8*44],rax
	jmp L_114
	
L_115:
	mov rbx,0
	mov r14,rbx
	mov r15,r14
	mov rdx,0
	mov r15,rdx
	
L_26:
	cmp r15,r12
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_27
	xor rdx, rdx
	mov rax,  r15
	mov rbx, 10
	cdq
	idiv rbx
	mov  r14, rdx
	mov rbx,0
	cmp r14,rbx
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_30
	mov rbx,1
	mov r14,r15
	add r14,rbx
	mov rdx,  [gbl+8*117]
	mov r13,rdx
	lea r14,[r13+r14*8+8H]
	mov r14, [r14]
	mov rdi,r14
	mov r14,rdi
	mov     rdi,  r14
	push r11
	push r10
	call    toString
	pop r10
	pop r11
	mov     qword r14, rax
	mov rdi,r14
	mov r14,rdi
	mov rbx,0
	mov r11,rbx
	
L_119:
	mov rbx,r14
	mov rdx,rbx
	mov rax,rdx
	mov rax, [rax]
	mov qword [rsp+8*37],rbx
	mov rbx,255
	and rax,rbx
	cmp r11,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*40],rbx
	mov qword [arg+8*63],rdx
	mov qword [rsp+8*39],rax
	je L_120
	mov rbx,r14
	mov rdi,r11
	mov rdx,rbx
	mov qword [rsp+8*41],rbx
	mov qword [arg+8*63],rdx
	call    ord
	mov     qword [rsp+8*42], rax
	mov rbx,  [gbl+8*43]
	mov rdx,  [rsp+8*42]
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rdx,1
	add r11,rdx
	mov qword [gbl+8*43],rbx
	mov qword [rsp+8*44],rax
	jmp L_119
	
L_120:
	mov rbx,0
	mov r14,rbx
	
L_30:
	mov rbx,1
	add r15,rbx
	jmp L_26
	
L_27:
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
L_25:
	mov rbx,1
	mov r13,r15
	add r13,rbx
	mov rdx,  [gbl+8*117]
	mov r14,rdx
	lea r14,[r14+r13*8+8H]
	mov rax,1
	mov [r14],rax
	mov rbx,1
	mov r14,r15
	add r14,rbx
	mov rdi,r14
	push r15
	push r14
	push r12
	call print_cond
	pop r12
	pop r14
	pop r15
	mov r14 , rax
	mov rbx,1
	mov r14,r15
	add r14,rbx
	mov rdx,  [gbl+8*117]
	mov r13,rdx
	lea r14,[r13+r14*8+8H]
	mov rax,0
	mov [r14],rax
	mov rbx,1
	add r15,rbx
	mov rdi,r15
	push r15
	push r12
	call print_cond
	pop r12
	pop r15
	mov r15 , rax
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1416
	mov rdx,0
	mov rbx,rdx
	mov qword [gbl+8*43],rbx
	mov rbx,  [rsp+8*169]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   3400
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
	
t191:
	 db 3,"xz " ,0

t319:
	 db 5,"herer" ,0

t326:
	 db 5,"herer" ,0

t248:
	 db 3," + " ,0

t133:
	 db 2,"- " ,0

t221:
	 db 1,"x" ,0

t333:
	 db 5,"herer" ,0

t140:
	 db 2,"*x" ,0

t282:
	 db 9,"max: xz;",10,"" ,0

t197:
	 db 7," <= 0;",10,"" ,0

t251:
	 db 6," = 1;",10,"" ,0


