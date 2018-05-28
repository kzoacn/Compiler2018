	 global    main
	 extern    puts
	 extern    printf
	 extern    scanf
	 extern    malloc
	 extern    calloc
	 extern    strlen
	 extern    strcmp
	 extern    memset
	 extern    sprintf

	 section   .text
toString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     edi, 256
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-8H]
        lea     rcx, [rax+1H]
        mov     rax, qword [rbp-18H]
        mov     rdx, rax
        lea     rsi, [rel L_031]
        mov     rdi, rcx
        mov     eax, 0
        call    sprintf
        mov     rax, qword [rbp-8H]
        add     rax, 1
        mov     rdi, rax
        call    strlen
        mov     edx, eax
        mov     rax, qword [rbp-8H]
        mov     byte [rax], dl
        mov     rax, qword [rbp-8H]
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
	sub    rsp, 1472
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 3456
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rdx,0
	mov rbx,rdx
	mov rdx,0
	mov rax,rdx
	mov rdx,0
	mov r8,rdx
	mov rdx,210
	mov r9,rdx
	mov rdx,0
	mov r10,rdx
	mov qword [rsp+8*2],rbx
	mov qword [rsp+8*3],rax
	mov     rdi, 100
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
	mov r11,r15
	xor rdx, rdx
	mov rax, [gbl+8*9]
	mov rbx, [gbl+8*10]
	cdq
	idiv rbx
	mov  r15, rax
	mov r13,r15
	xor rdx, rdx
	mov rax, [gbl+8*9]
	mov rbx, [gbl+8*10]
	cdq
	idiv rbx
	mov  r15, rdx
	mov r12,r15
	mov rdi,r9
	mov r15,rdi
	
L_159:
	cmp r10,r15
	mov r14, 0
	setle r14B
	cmp r14, 0
	je L_160
	mov rbx,1
	mov r14,r10
	add r14,rbx
	imul r14,r10
	xor rdx, rdx
	mov rax,  r14
	mov rbx, 2
	cdq
	idiv rbx
	mov  r14, rax
	cmp r15,r14
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_161
	mov rbx,1
	mov r15,rbx
	jmp L_163
	
L_161:
	mov rbx,1
	add r10,rbx
	jmp L_159
	
L_160:
	mov rbx,0
	mov r15,rbx
	
L_163:
	mov r15,r15
	cmp r15, 0
	sete r15B
	cmp r15, 0
	je L_127
	mov rbx,t224
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
	mov rbx,1
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
L_127:
	mov rbx,t229
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
	mov rbx,3654898
	mov rdi,rbx
	mov r15,rdi
	mov rdx,r15
	mov rax,0
	mov r15,rax
	mov r15,r15
	mov qword [gbl+8*27],rdx
	xor rdx, rdx
	mov rax, [gbl+8*27]
	mov rbx,  r13
	cdq
	idiv rbx
	mov  r15, rdx
	mov rbx,  [gbl+8*10]
	mov r14,rbx
	imul r14,r15
	xor rdx, rdx
	mov rax, [gbl+8*27]
	mov rbx,  r13
	cdq
	idiv rbx
	mov  r15, rax
	imul r15,r12
	sub r14,r15
	mov r14,r14
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_165
	mov rbx,r14
	mov qword [gbl+8*27],rbx
	jmp L_166
	
L_165:
	mov rbx,  [gbl+8*9]
	mov r15,r14
	add r15,rbx
	mov rdx,r15
	mov qword [gbl+8*27],rdx
	
L_166:
	mov rbx,  [gbl+8*27]
	mov r15,rbx
	mov r15,r15
	xor rdx, rdx
	mov rax,  r15
	mov rbx, 10
	cdq
	idiv rbx
	mov  r15, rdx
	mov rbx,1
	add r15,rbx
	mov rdx,r15
	mov rdi,rdx
	mov r15,rdi
	mov qword [gbl+8*40],rdx
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
	
L_128:
	mov rbx,  [gbl+8*40]
	mov rdx,1
	mov r15,rbx
	sub r15,rdx
	mov rax,  [rsp+8*2]
	cmp rax,r15
	mov r15, 0
	setl r15B
	mov rdx,  [rsp+8*45]
	add rdx,rdx
	cmp r15, 0
	mov qword [rsp+8*45],rdx
	je L_129
	xor rdx, rdx
	mov rax, [gbl+8*27]
	mov rbx,  r13
	cdq
	idiv rbx
	mov  r15, rdx
	mov rbx,  [gbl+8*10]
	mov r14,rbx
	imul r14,r15
	xor rdx, rdx
	mov rax, [gbl+8*27]
	mov rbx,  r13
	cdq
	idiv rbx
	mov  r15, rax
	imul r15,r12
	sub r14,r15
	mov r14,r14
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_169
	mov rbx,r14
	mov qword [gbl+8*27],rbx
	jmp L_170
	
L_169:
	mov rbx,  [gbl+8*9]
	mov r15,r14
	add r15,rbx
	mov rdx,r15
	mov qword [gbl+8*27],rdx
	
L_170:
	mov rbx,  [gbl+8*27]
	mov r15,rbx
	mov r15,r15
	xor rdx, rdx
	mov rax,  r15
	mov rbx, 10
	cdq
	idiv rbx
	mov  r15, rdx
	mov rbx,1
	add r15,rbx
	mov r14,r11
	mov rdx,  [rsp+8*2]
	lea r14,[r14+rdx*8+8H]
	mov [r14],r15
	
L_131:
	mov r15,r11
	mov rbx,  [rsp+8*2]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rdx,  [rsp+8*3]
	add r15,rdx
	cmp r15,r9
	mov r15, 0
	setg r15B
	mov rax,  [rsp+8*45]
	add rax,rax
	cmp r15, 0
	mov qword [rsp+8*45],rax
	je L_132
	xor rdx, rdx
	mov rax, [gbl+8*27]
	mov rbx,  r13
	cdq
	idiv rbx
	mov  r15, rdx
	mov rbx,  [gbl+8*10]
	mov r14,rbx
	imul r14,r15
	xor rdx, rdx
	mov rax, [gbl+8*27]
	mov rbx,  r13
	cdq
	idiv rbx
	mov  r15, rax
	imul r15,r12
	sub r14,r15
	mov r14,r14
	mov rbx,0
	cmp r14,rbx
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_173
	mov rbx,r14
	mov qword [gbl+8*27],rbx
	jmp L_174
	
L_173:
	mov rbx,  [gbl+8*9]
	mov r15,r14
	add r15,rbx
	mov rdx,r15
	mov qword [gbl+8*27],rdx
	
L_174:
	mov rbx,  [gbl+8*27]
	mov r15,rbx
	mov r15,r15
	xor rdx, rdx
	mov rax,  r15
	mov rbx, 10
	cdq
	idiv rbx
	mov  r15, rdx
	mov rbx,1
	add r15,rbx
	mov r14,r11
	mov rdx,  [rsp+8*2]
	lea r14,[r14+rdx*8+8H]
	mov [r14],r15
	jmp L_131
	
L_132:
	mov r15,r11
	mov rbx,  [rsp+8*2]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov rdx,  [rsp+8*3]
	add r15,rdx
	mov rdx,r15
	mov rax,1
	add rbx,rax
	mov qword [rsp+8*2],rbx
	mov qword [rsp+8*3],rdx
	jmp L_128
	
L_129:
	mov rbx,  [rsp+8*3]
	mov r14,r9
	sub r14,rbx
	mov rdx,  [gbl+8*40]
	mov rax,1
	mov r13,rdx
	sub r13,rax
	mov r15,r11
	lea r15,[r15+r13*8+8H]
	mov [r15],r14
	mov rbx,0
	mov r15,rbx
	
L_177:
	mov rbx,  [gbl+8*40]
	cmp r15,rbx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_178
	mov r14,r11
	lea r14,[r14+r15*8+8H]
	mov r14, [r14]
	mov rdi,r14
	mov r14,rdi
	mov     rdi,  r14
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
	mov     rsi, t106
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
	mov r14,rdi
	mov rdi, format
	mov rsi, r14 
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
	mov rbx,1
	add r15,rbx
	jmp L_177
	
L_178:
	mov rbx,t111
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
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,0
	mov r15,rdx
	
L_230:
	mov rbx,  [gbl+8*40]
	cmp r15,rbx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_231
	mov r14,r11
	lea r14,[r14+r15*8+8H]
	mov r14, [r14]
	mov rbx,0
	cmp r14,rbx
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_232
	mov rbx,1
	mov r14,r15
	add r14,rbx
	mov r14,r14
	
L_233:
	mov rbx,  [gbl+8*40]
	cmp r14,rbx
	mov r13, 0
	setl r13B
	cmp r13, 0
	je L_234
	mov r13,r11
	lea r13,[r13+r14*8+8H]
	mov r13, [r13]
	mov rbx,0
	cmp r13,rbx
	mov r13, 0
	setne r13B
	cmp r13, 0
	je L_235
	mov rsi,r14
	mov rdi,r15
	mov r12,rdi
	mov r9,rsi
	mov r14,r11
	lea r14,[r14+r12*8+8H]
	mov r14, [r14]
	mov rbx,r14
	mov r14,r11
	lea r14,[r14+r9*8+8H]
	mov r14, [r14]
	mov r13,r11
	lea r13,[r13+r12*8+8H]
	mov [r13],r14
	mov r14,r11
	lea r14,[r14+r9*8+8H]
	mov [r14],rbx
	mov rdx,0
	mov r14,rdx
	mov r14,r14
	mov qword [rsp+8*97],rbx
	jmp L_234
	
L_235:
	mov rbx,1
	add r14,rbx
	jmp L_233
	
L_234:
	
L_232:
	mov rbx,1
	add r15,rbx
	jmp L_230
	
L_231:
	mov rbx,0
	mov r15,rbx
	
L_240:
	mov rbx,  [gbl+8*40]
	cmp r15,rbx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_241
	mov r14,r11
	lea r14,[r14+r15*8+8H]
	mov r14, [r14]
	mov rbx,0
	cmp r14,rbx
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_242
	mov rbx,r15
	mov qword [gbl+8*40],rbx
	jmp L_241
	
L_242:
	mov rbx,1
	add r15,rbx
	jmp L_240
	
L_241:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	
L_133:
	mov     rdi, 100
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
	mov r15,r15
	mov rbx,  [gbl+8*40]
	cmp rbx,r10
	mov r14, 0
	setne r14B
	cmp r14, 0
	je L_246
	mov rbx,0
	mov r15,rbx
	jmp L_248
	
L_246:
	mov rbx,0
	mov r14,rbx
	
L_249:
	mov rbx,  [gbl+8*40]
	cmp r14,rbx
	mov r13, 0
	setl r13B
	cmp r13, 0
	je L_250
	mov r13,r11
	lea r13,[r13+r14*8+8H]
	mov r13, [r13]
	mov r12,r15
	lea r12,[r12+r14*8+8H]
	mov [r12],r13
	mov rbx,1
	add r14,rbx
	jmp L_249
	
L_250:
	mov rbx,0
	mov r12,rbx
	
L_252:
	mov rbx,  [gbl+8*40]
	mov rdx,1
	mov r14,rbx
	sub r14,rdx
	cmp r12,r14
	mov r14, 0
	setl r14B
	mov rax,  [rsp+8*45]
	add rax,rax
	cmp r14, 0
	mov qword [rsp+8*45],rax
	je L_254
	mov rbx,1
	mov r14,r12
	add r14,rbx
	mov r14,r14
	
L_255:
	mov rbx,  [gbl+8*40]
	cmp r14,rbx
	mov r13, 0
	setl r13B
	cmp r13, 0
	je L_256
	mov r13,r15
	lea r13,[r13+r12*8+8H]
	mov r9, [r13]
	mov r13,r15
	lea r13,[r13+r14*8+8H]
	mov r13, [r13]
	cmp r9,r13
	mov r13, 0
	setg r13B
	cmp r13, 0
	je L_257
	mov r13,r15
	lea r13,[r13+r12*8+8H]
	mov r13, [r13]
	mov r13,r13
	mov r9,r15
	lea r9,[r9+r14*8+8H]
	mov rbx, [r9]
	mov r9,r15
	lea r9,[r9+r12*8+8H]
	mov [r9],rbx
	mov r9,r15
	lea r9,[r9+r14*8+8H]
	mov [r9],r13
	mov qword [rsp+8*142],rbx
	
L_257:
	mov rbx,1
	add r14,rbx
	jmp L_255
	
L_256:
	mov rbx,1
	add r12,rbx
	jmp L_252
	
L_254:
	mov rbx,0
	mov r12,rbx
	
L_260:
	mov rbx,  [gbl+8*40]
	cmp r12,rbx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_261
	mov r14,r15
	lea r14,[r14+r12*8+8H]
	mov r13, [r14]
	mov rbx,1
	mov r14,r12
	add r14,rbx
	cmp r13,r14
	mov r14, 0
	setne r14B
	cmp r14, 0
	je L_262
	mov rbx,0
	mov r15,rbx
	jmp L_248
	
L_262:
	mov rbx,1
	add r12,rbx
	jmp L_260
	
L_261:
	mov rbx,1
	mov r15,rbx
	
L_248:
	mov r15,r15
	cmp r15, 0
	sete r15B
	cmp r15, 0
	je L_134
	mov rbx,1
	add r8,rbx
	mov rdi,r8
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
	mov     rdi, t284
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
	mov     rsi, t290
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
	mov  r15, rax
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
	mov r13,rbx
	
L_182:
	mov rbx,  [gbl+8*40]
	cmp r13,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_183
	mov r15,r11
	lea r14,[r15+r13*8+8H]
	mov r15, [r14]
	mov rbx,1
	sub r15,rbx
	mov [r14],r15
	mov rdx,1
	mov r15,r13
	add r15,rdx
	mov r13,r15
	jmp L_182
	
L_183:
	mov r15,r11
	mov rbx,  [gbl+8*40]
	lea r15,[r15+rbx*8+8H]
	mov [r15],rbx
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov rax,0
	mov r15,rax
	mov r15,r15
	mov rdx,0
	mov r15,rdx
	mov qword [gbl+8*40],rbx
	
L_264:
	mov rbx,  [gbl+8*40]
	cmp r15,rbx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_265
	mov r14,r11
	lea r14,[r14+r15*8+8H]
	mov r14, [r14]
	mov rbx,0
	cmp r14,rbx
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_266
	mov rbx,1
	mov r14,r15
	add r14,rbx
	mov r14,r14
	
L_267:
	mov rbx,  [gbl+8*40]
	cmp r14,rbx
	mov r13, 0
	setl r13B
	cmp r13, 0
	je L_268
	mov r13,r11
	lea r13,[r13+r14*8+8H]
	mov r13, [r13]
	mov rbx,0
	cmp r13,rbx
	mov r13, 0
	setne r13B
	cmp r13, 0
	je L_269
	mov rsi,r14
	mov rdi,r15
	mov r12,rdi
	mov r9,rsi
	mov r14,r11
	lea r14,[r14+r12*8+8H]
	mov r14, [r14]
	mov rbx,r14
	mov r14,r11
	lea r14,[r14+r9*8+8H]
	mov r14, [r14]
	mov r13,r11
	lea r13,[r13+r12*8+8H]
	mov [r13],r14
	mov r14,r11
	lea r14,[r14+r9*8+8H]
	mov [r14],rbx
	mov rdx,0
	mov r14,rdx
	mov r14,r14
	mov qword [rsp+8*97],rbx
	jmp L_268
	
L_269:
	mov rbx,1
	add r14,rbx
	jmp L_267
	
L_268:
	
L_266:
	mov rbx,1
	add r15,rbx
	jmp L_264
	
L_265:
	mov rbx,0
	mov r15,rbx
	
L_274:
	mov rbx,  [gbl+8*40]
	cmp r15,rbx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_275
	mov r14,r11
	lea r14,[r14+r15*8+8H]
	mov r14, [r14]
	mov rbx,0
	cmp r14,rbx
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_276
	mov rbx,r15
	mov qword [gbl+8*40],rbx
	jmp L_275
	
L_276:
	mov rbx,1
	add r15,rbx
	jmp L_274
	
L_275:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,0
	mov r15,rdx
	
L_187:
	mov rbx,  [gbl+8*40]
	cmp r15,rbx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_188
	mov r14,r11
	lea r14,[r14+r15*8+8H]
	mov r14, [r14]
	mov rdi,r14
	mov r14,rdi
	mov     rdi,  r14
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
	mov     rsi, t106
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
	mov r14,rdi
	mov rdi, format
	mov rsi, r14 
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
	mov rbx,1
	add r15,rbx
	jmp L_187
	
L_188:
	mov rbx,t111
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
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	jmp L_133
	
L_134:
	mov rdi,r8
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
	mov     rdi, t300
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
	mov     rsi, t305
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
	mov  r15, rax
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
	sub    rsp, 1472
	mov rdx,48271
	mov rbx,rdx
	mov qword [gbl+8*10],rbx
	mov rbx,2147483647
	mov rax,rbx
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*27],rbx
	mov qword [gbl+8*9],rax
	mov rbx,  [rsp+8*176]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   3456
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
	L_031:
        db 25H, 6CH, 64H, 00H

t229:
	 db 12,"Let's start!" ,0

t290:
	 db 1,":" ,0

t305:
	 db 8," step(s)" ,0

t224:
	 db 79,"Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i" ,0

t106:
	 db 1," " ,0

t111:
	 db 0,"" ,0

t300:
	 db 7,"Total: " ,0

t284:
	 db 5,"step " ,0


