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


A_Optimizer:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2832
	mov rdx,  [arg+8*63]
	mov rbx,rdx
	mov qword [rsp+8*2],rbx
	mov     rdi, 10
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
	mov rdx,2
	mov [rax],rdx
	mov rdx,1
	lea rax,[rbx+rdx*8+8H]
	mov rdx,2
	mov [rax],rdx
	mov rdx,2
	lea rax,[rbx+rdx*8+8H]
	mov rdx,2
	mov [rax],rdx
	mov rdx,3
	lea rax,[rbx+rdx*8+8H]
	mov rdx,2
	mov [rax],rdx
	mov rdx,4
	lea rax,[rbx+rdx*8+8H]
	mov rdx,2
	mov [rax],rdx
	mov rdx,5
	lea rax,[rbx+rdx*8+8H]
	mov rdx,2
	mov [rax],rdx
	mov rdx,6
	lea rax,[rbx+rdx*8+8H]
	mov rdx,2
	mov [rax],rdx
	mov rdx,7
	lea rax,[rbx+rdx*8+8H]
	mov rdx,2
	mov [rax],rdx
	mov rdx,8
	lea rax,[rbx+rdx*8+8H]
	mov rdx,2
	mov [rax],rdx
	mov rdx,9
	lea rax,[rbx+rdx*8+8H]
	mov rdx,2
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
	mov rdx,  [rsp+8*3]
	mov rbx,rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*5],rbx
	mov rbx,1
	mov rdx,rbx
	mov qword [rsp+8*7],rdx
	mov qword [rsp+8*6],rax
	
L_0:
	mov rbx,  [rsp+8*7]
	mov rdx,1000
	cmp rbx,rdx
	mov rax, 0
	setle al
	cmp rax, 0
	mov qword [rsp+8*8],rax
	je L_1
	mov rbx,123
	mov rdx,  [rsp+8*7]
	mov rax,rbx
	add rax,rdx
	mov rdx,  [rsp+8*5]
	mov rbx,rdx
	mov qword [rsp+8*9],rax
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,1
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,1
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,1
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,1
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov rbx, [rdx]
	mov rax,1
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*10],rbx
	mov rbx,  [rsp+8*9]
	mov [rdx],rbx
	mov qword [rsp+8*11],rdx
	mov rdx,  [rsp+8*5]
	mov rbx,rdx
	mov rdx,0
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,1
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,0
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,1
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,0
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,1
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,0
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,1
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,0
	lea rax,[rbx+rdx*8+8H]
	mov rbx, [rax]
	mov rdx,1
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*12],rbx
	mov rbx, [rax]
	mov rdx,  [rsp+8*6]
	mov qword [rsp+8*13],rax
	mov rax,rdx
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*14],rbx
	mov rax,  [rsp+8*7]
	mov rbx,rax
	mov qword [rsp+8*16],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*6],rdx
	mov qword [rsp+8*7],rax
	jmp L_0
	
L_1:
	mov rbx,  [rsp+8*6]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*18],rdx
	mov     rdi, [rsp+8*18]
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword[rsp+8*19], rax
	mov rbx,  [rsp+8*19]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*20],rdx
	mov rdi,[rsp+8*20] 
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
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*7],rbx
	
L_3:
	mov rbx,  [rsp+8*7]
	mov rdx,1000000
	cmp rbx,rdx
	mov rax, 0
	setle al
	cmp rax, 0
	mov qword [rsp+8*21],rax
	je L_4
	mov rbx,  [rsp+8*6]
	mov rdx,8
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov rax,  [rsp+8*7]
	mov rdx,rax
	mov qword [rsp+8*23],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*6],rbx
	mov qword [rsp+8*7],rax
	jmp L_3
	
L_4:
	mov rbx,  [rsp+8*6]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*24],rdx
	mov     rdi, [rsp+8*24]
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword[rsp+8*25], rax
	mov rbx,  [rsp+8*25]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*26],rdx
	mov rdi,[rsp+8*26] 
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
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*7],rbx
	
L_6:
	mov rbx,  [rsp+8*7]
	mov rdx,200000000
	cmp rbx,rdx
	mov rax, 0
	setle al
	cmp rax, 0
	mov qword [rsp+8*27],rax
	je L_7
	mov rdx,  [rsp+8*7]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*28],rbx
	mov qword [rsp+8*7],rdx
	jmp L_6
	
L_7:
	mov rbx,  [rsp+8*29]
	mov rax,rbx
	leave
	ret
	
main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2832
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 4816
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	call global_init
	mov rbx , rax
	mov qword [rsp+8*30],rbx
	push r11
	push r10
	push r9
	push r8
	call    getInt
	pop r8
	pop r9
	pop r10
	pop r11
	mov     [rsp+8*31], rax
	mov rdx,  [rsp+8*31]
	mov rbx,rdx
	mov qword [gbl+8*32],rbx
	push r11
	push r10
	push r9
	push r8
	call    getInt
	pop r8
	pop r9
	pop r10
	pop r11
	mov     [rsp+8*33], rax
	mov rdx,  [rsp+8*33]
	mov rbx,rdx
	mov rdx,1
	mov rax,rdx
	mov qword [rsp+8*34],rbx
	mov qword [rsp+8*35],rax
	
L_69:
	mov rbx,  [rsp+8*35]
	mov rdx,  [gbl+8*32]
	cmp rbx,rdx
	mov rax, 0
	setle al
	cmp rax, 0
	mov qword [rsp+8*36],rax
	je L_70
	mov rdx,  [gbl+8*37]
	mov rbx,rdx
	mov rax,  [rsp+8*35]
	lea rdx,[rbx+rax*8+8H]
	mov [rdx],rax
	mov qword [rsp+8*38],rbx
	mov rbx,  [rsp+8*34]
	cmp rax,rbx
	mov qword [rsp+8*39],rdx
	mov rdx, 0
	setle dl
	cmp rdx, 0
	mov qword [rsp+8*40],rdx
	je L_73
	mov rbx,  [rsp+8*34]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rbx,  [rsp+8*35]
	sub rax,rbx
	mov rbx,  [gbl+8*37]
	mov rdx,rbx
	mov qword [rsp+8*41],rax
	mov rax,  [rsp+8*35]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*42],rdx
	mov rdx,  [rsp+8*41]
	mov [rbx],rdx
	mov qword [rsp+8*43],rbx
	
L_73:
	mov rdx,  [gbl+8*37]
	mov rbx,rdx
	mov rax,  [rsp+8*35]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*44],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*45],rdx
	mov rax,  [gbl+8*47]
	mov rdx,rax
	mov qword [rsp+8*46],rbx
	mov rbx,  [rsp+8*35]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*48],rdx
	mov rdx,  [rsp+8*46]
	mov [rax],rdx
	mov rdx,rbx
	mov qword [rsp+8*50],rdx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*35],rbx
	mov qword [rsp+8*49],rax
	jmp L_69
	
L_70:
	mov rbx,  [gbl+8*32]
	mov rdx,1
	mov rax,rbx
	add rax,rdx
	mov rsi,rax
	mov rdx,1
	mov rdi,rdx
	mov qword [rsp+8*51],rax
	call quicksort
	mov rbx , rax
	mov rdx,rbx
	mov qword [rsp+8*53],rbx
	mov rbx,1
	mov rax,rbx
	mov qword [rsp+8*54],rdx
	mov qword [rsp+8*55],rax
	
L_79:
	mov rbx,  [rsp+8*55]
	mov rdx,  [gbl+8*32]
	cmp rbx,rdx
	mov rax, 0
	setle al
	cmp rax, 0
	mov qword [rsp+8*56],rax
	je L_80
	mov rdx,  [gbl+8*47]
	mov rbx,rdx
	mov rax,  [rsp+8*55]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*57],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*59],rbx
	mov rbx,  [gbl+8*37]
	mov rax,rbx
	mov qword [rsp+8*58],rdx
	mov rdx,  [rsp+8*55]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*59]
	mov [rbx],rdx
	mov qword [rsp+8*60],rax
	mov qword [rsp+8*61],rbx
	mov rbx,  [rsp+8*55]
	mov rax,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*55],rbx
	mov qword [rsp+8*62],rax
	jmp L_79
	
L_80:
	mov rdx,0
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*64],rax
	mov rdx,1
	mov rax,rdx
	mov qword [rsp+8*63],rbx
	mov qword [rsp+8*65],rax
	
L_119:
	mov rbx,  [rsp+8*65]
	mov rdx,  [gbl+8*32]
	cmp rbx,rdx
	mov rax, 0
	setle al
	cmp rax, 0
	mov qword [rsp+8*66],rax
	je L_120
	mov rbx,  [rsp+8*65]
	mov rdx,1
	mov rax,rbx
	sub rax,rdx
	mov rbx,  [gbl+8*68]
	mov rdx,rbx
	mov qword [rsp+8*67],rax
	mov rax,  [rsp+8*65]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*69],rdx
	mov rdx,  [rsp+8*67]
	mov [rbx],rdx
	mov qword [rsp+8*70],rbx
	mov rbx,1
	mov rdx,rax
	add rdx,rbx
	mov qword [rsp+8*71],rdx
	mov rdx,  [gbl+8*72]
	mov rbx,rdx
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*73],rbx
	mov rbx,  [rsp+8*71]
	mov [rdx],rbx
	mov rbx,rax
	mov qword [rsp+8*75],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*74],rdx
	mov qword [rsp+8*65],rax
	jmp L_119
	
L_120:
	mov rdx,0
	mov rbx,rdx
	mov rdx,  [gbl+8*32]
	mov rax,rdx
	mov qword [rsp+8*76],rbx
	mov qword [rsp+8*65],rax
	
L_122:
	mov rbx,  [rsp+8*65]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	setge al
	cmp rax, 0
	mov qword [rsp+8*77],rax
	je L_123
	mov rdx,  [gbl+8*37]
	mov rbx,rdx
	mov rax,  [rsp+8*65]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*78],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*79],rdx
	mov rax,  [gbl+8*68]
	mov rdx,rax
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*80],rbx
	mov rbx, [rax]
	mov qword [rsp+8*81],rdx
	mov rdx,rbx
	mov qword [rsp+8*83],rbx
	mov qword [rsp+8*82],rax
	mov rax,  [gbl+8*37]
	mov rbx,rax
	mov qword [rsp+8*84],rdx
	mov rdx,  [rsp+8*65]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*85],rbx
	mov rbx, [rax]
	mov qword [rsp+8*86],rax
	mov rdx,  [gbl+8*72]
	mov rax,rdx
	lea rdx,[rax+rbx*8+8H]
	mov qword [rsp+8*87],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*89],rdx
	mov rdx,rbx
	mov qword [rsp+8*90],rbx
	mov qword [rsp+8*88],rax
	mov rax,  [gbl+8*72]
	mov rbx,rax
	mov qword [rsp+8*91],rdx
	mov rdx,  [rsp+8*84]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*92],rbx
	mov rbx,  [rsp+8*91]
	mov [rax],rbx
	mov qword [rsp+8*93],rax
	mov rdx,  [gbl+8*68]
	mov rax,rdx
	lea rdx,[rax+rbx*8+8H]
	mov qword [rsp+8*94],rax
	mov rax,  [rsp+8*84]
	mov [rdx],rax
	mov qword [rsp+8*95],rdx
	mov rdx,  [rsp+8*76]
	mov rax,rdx
	add rax,rbx
	mov rbx,  [rsp+8*84]
	sub rax,rbx
	mov rbx,2
	sub rax,rbx
	mov rdx,rax
	mov rax,  [rsp+8*65]
	mov rbx,rax
	mov qword [rsp+8*97],rbx
	mov rbx,1
	sub rax,rbx
	mov qword [rsp+8*76],rdx
	mov qword [rsp+8*65],rax
	jmp L_122
	
L_123:
	mov rdx,  [rsp+8*76]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*98],rbx
	mov rbx,rax
	mov qword [rsp+8*99],rax
	mov rax,1
	mov rdx,rax
	mov qword [rsp+8*100],rbx
	mov qword [rsp+8*55],rdx
	
L_84:
	mov rbx,  [rsp+8*55]
	mov rdx,  [gbl+8*32]
	cmp rbx,rdx
	mov rax, 0
	setle al
	cmp rax, 0
	mov qword [rsp+8*56],rax
	je L_85
	mov rdx,  [gbl+8*47]
	mov rbx,rdx
	mov rax,  [rsp+8*55]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*57],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*59],rbx
	mov rbx,  [gbl+8*37]
	mov rax,rbx
	mov qword [rsp+8*58],rdx
	mov rdx,  [rsp+8*55]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*59]
	mov [rbx],rdx
	mov qword [rsp+8*60],rax
	mov qword [rsp+8*61],rbx
	mov rbx,  [rsp+8*55]
	mov rax,rbx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*55],rbx
	mov qword [rsp+8*62],rax
	jmp L_84
	
L_85:
	mov rdx,0
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*101],rax
	mov rax,  [gbl+8*32]
	mov rdx,1
	mov qword [rsp+8*63],rbx
	mov rbx,rax
	add rbx,rdx
	mov rsi,rbx
	mov rbx,1
	mov rdi,rbx
	call mergesort
	mov rbx , rax
	mov rdx,rbx
	mov qword [rsp+8*103],rbx
	mov rbx,1
	mov rax,rbx
	mov qword [rsp+8*104],rdx
	mov qword [rsp+8*55],rax
	
L_89:
	mov rbx,  [rsp+8*55]
	mov rdx,  [gbl+8*32]
	cmp rbx,rdx
	mov rax, 0
	setle al
	cmp rax, 0
	mov qword [rsp+8*56],rax
	je L_90
	mov rdx,  [gbl+8*47]
	mov rbx,rdx
	mov rax,  [rsp+8*55]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*57],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*58],rdx
	mov rax,  [gbl+8*37]
	mov rdx,rax
	mov qword [rsp+8*59],rbx
	mov rbx,  [rsp+8*55]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*60],rdx
	mov rdx,  [rsp+8*59]
	mov [rax],rdx
	mov rdx,rbx
	mov qword [rsp+8*62],rdx
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*55],rbx
	mov qword [rsp+8*61],rax
	jmp L_89
	
L_90:
	mov rdx,0
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*63],rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*105],rax
	mov rax,1
	mov rdx,rax
	mov qword [rsp+8*106],rbx
	mov qword [rsp+8*107],rdx
	
L_127:
	mov rbx,  [rsp+8*107]
	mov rdx,  [gbl+8*32]
	cmp rbx,rdx
	mov rax, 0
	setle al
	cmp rax, 0
	mov qword [rsp+8*108],rax
	je L_128
	mov rdx,  [gbl+8*37]
	mov rbx,rdx
	mov rax,  [rsp+8*107]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*109],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*110],rdx
	mov rax,  [gbl+8*112]
	mov rdx,rax
	mov qword [rsp+8*111],rbx
	mov rbx,  [rsp+8*107]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*113],rdx
	mov rdx,  [rsp+8*111]
	mov [rax],rdx
	mov rdx,rbx
	mov qword [rsp+8*115],rdx
	mov qword [rsp+8*114],rax
	
L_129:
	mov rbx,  [rsp+8*115]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	setne al
	cmp rax, 0
	mov qword [rsp+8*116],rax
	je L_130
	mov rdx,  [rsp+8*106]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*117],rbx
	mov rax,  [gbl+8*112]
	mov rbx,rax
	mov qword [rsp+8*106],rdx
	mov rdx,  [rsp+8*115]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*118],rbx
	mov rbx, [rax]
	mov qword [rsp+8*119],rax
	mov rax,1
	mov qword [rsp+8*120],rbx
	mov rbx,rdx
	mov rcx,rax
	shr rbx,cl
	mov qword [rsp+8*121],rbx
	mov rbx,  [gbl+8*112]
	mov rax,rbx
	mov rdx,  [rsp+8*121]
	lea rbx,[rax+rdx*8+8H]
	mov rdx, [rbx]
	mov qword [rsp+8*123],rbx
	mov rbx,  [rsp+8*120]
	cmp rbx,rdx
	mov qword [rsp+8*122],rax
	mov rax, 0
	setg al
	cmp rax, 0
	mov qword [rsp+8*124],rdx
	mov qword [rsp+8*125],rax
	je L_131
	jmp L_130
	
L_131:
	mov rdx,  [gbl+8*112]
	mov rbx,rdx
	mov rax,  [rsp+8*115]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*126],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*127],rdx
	mov rdx,rbx
	mov qword [rsp+8*128],rbx
	mov rbx,1
	mov qword [rsp+8*129],rdx
	mov rdx,rax
	mov rcx,rbx
	shr rdx,cl
	mov qword [rsp+8*130],rdx
	mov rdx,  [gbl+8*112]
	mov rbx,rdx
	mov rax,  [rsp+8*130]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*131],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*132],rdx
	mov rax,  [gbl+8*112]
	mov rdx,rax
	mov qword [rsp+8*133],rbx
	mov rbx,  [rsp+8*115]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*134],rdx
	mov rdx,  [rsp+8*133]
	mov [rax],rdx
	mov rdx,1
	mov qword [rsp+8*135],rax
	mov rax,rbx
	mov rcx,rdx
	shr rax,cl
	mov rbx,  [gbl+8*112]
	mov rdx,rbx
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*137],rdx
	mov rdx,  [rsp+8*129]
	mov [rbx],rdx
	mov qword [rsp+8*138],rbx
	mov rbx,  [rsp+8*115]
	mov rax,1
	mov rdx,rbx
	mov rcx,rax
	shr rdx,cl
	mov rbx,rdx
	mov qword [rsp+8*115],rbx
	mov qword [rsp+8*139],rdx
	jmp L_129
	
L_130:
	mov rdx,  [rsp+8*107]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*140],rbx
	mov qword [rsp+8*107],rdx
	jmp L_127
	
L_128:
	mov rdx,  [gbl+8*32]
	mov rbx,rdx
	mov qword [rsp+8*141],rbx
	mov rbx,1
	mov rax,rbx
	mov qword [rsp+8*107],rax
	
L_133:
	mov rbx,  [rsp+8*107]
	mov rdx,  [gbl+8*32]
	cmp rbx,rdx
	mov rax, 0
	setle al
	cmp rax, 0
	mov qword [rsp+8*142],rax
	je L_134
	mov rdx,  [gbl+8*112]
	mov rbx,rdx
	mov rax,1
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*143],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*144],rdx
	mov rax,  [gbl+8*37]
	mov rdx,rax
	mov qword [rsp+8*145],rbx
	mov rbx,  [rsp+8*107]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*146],rdx
	mov rdx,  [rsp+8*145]
	mov [rax],rdx
	mov qword [rsp+8*147],rax
	mov rax,  [rsp+8*141]
	mov rdx,rax
	mov rbx,1
	sub rax,rbx
	mov qword [rsp+8*148],rdx
	mov rdx,  [gbl+8*112]
	mov rbx,rdx
	mov qword [rsp+8*141],rax
	mov rax,  [rsp+8*148]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*149],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*150],rdx
	mov rax,  [gbl+8*112]
	mov rdx,rax
	mov qword [rsp+8*151],rbx
	mov rbx,1
	lea rax,[rdx+rbx*8+8H]
	mov rbx,  [rsp+8*151]
	mov [rax],rbx
	mov qword [rsp+8*152],rdx
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*154],rbx
	mov qword [rsp+8*153],rax
	
L_135:
	mov rbx,  [rsp+8*154]
	mov rdx,rbx
	mov rcx,1
	shl rdx,cl
	mov rax,  [rsp+8*141]
	cmp rdx,rax
	mov rdx, 0
	setle dl
	mov rbx,  [rsp+8*156]
	add rbx,rbx
	cmp rdx, 0
	mov qword [rsp+8*156],rbx
	mov qword [rsp+8*155],rdx
	je L_137
	mov rbx,  [rsp+8*154]
	mov rdx,rbx
	mov rcx,1
	shl rdx,cl
	mov rax,rdx
	mov rdx,1
	mov rbx,rax
	add rbx,rdx
	mov rdx,rbx
	mov rbx,rax
	mov qword [rsp+8*161],rbx
	mov rbx,  [rsp+8*141]
	cmp rdx,rbx
	mov qword [rsp+8*158],rax
	mov rax, 0
	setle al
	cmp rax, 0
	mov qword [rsp+8*160],rdx
	mov qword [rsp+8*162],rax
	je L_138
	mov rdx,  [rsp+8*106]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*163],rbx
	mov rax,  [gbl+8*112]
	mov rbx,rax
	mov qword [rsp+8*106],rdx
	mov rdx,  [rsp+8*160]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*164],rbx
	mov rbx, [rax]
	mov qword [rsp+8*165],rax
	mov rdx,  [gbl+8*112]
	mov rax,rdx
	mov qword [rsp+8*166],rbx
	mov rbx,  [rsp+8*158]
	lea rdx,[rax+rbx*8+8H]
	mov rbx, [rdx]
	mov qword [rsp+8*168],rdx
	mov rdx,  [rsp+8*166]
	cmp rdx,rbx
	mov qword [rsp+8*167],rax
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*169],rbx
	mov qword [rsp+8*170],rax
	je L_139
	mov rdx,  [rsp+8*160]
	mov rbx,rdx
	mov qword [rsp+8*161],rbx
	
L_139:
	
L_138:
	mov rdx,  [rsp+8*106]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*171],rbx
	mov rax,  [gbl+8*112]
	mov rbx,rax
	mov qword [rsp+8*106],rdx
	mov rdx,  [rsp+8*154]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*172],rbx
	mov rbx, [rax]
	mov qword [rsp+8*173],rax
	mov rdx,  [gbl+8*112]
	mov rax,rdx
	mov qword [rsp+8*174],rbx
	mov rbx,  [rsp+8*161]
	lea rdx,[rax+rbx*8+8H]
	mov qword [rsp+8*175],rax
	mov rax, [rdx]
	mov qword [rsp+8*176],rdx
	mov rdx,  [rsp+8*174]
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*178],rbx
	mov qword [rsp+8*177],rax
	je L_140
	jmp L_137
	
L_140:
	mov rdx,  [gbl+8*112]
	mov rbx,rdx
	mov rax,  [rsp+8*154]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*179],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*180],rdx
	mov rdx,rbx
	mov qword [rsp+8*181],rbx
	mov rax,  [gbl+8*112]
	mov rbx,rax
	mov qword [rsp+8*129],rdx
	mov rdx,  [rsp+8*161]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*182],rbx
	mov rbx, [rax]
	mov qword [rsp+8*183],rax
	mov rdx,  [gbl+8*112]
	mov rax,rdx
	mov qword [rsp+8*184],rbx
	mov rbx,  [rsp+8*154]
	lea rdx,[rax+rbx*8+8H]
	mov qword [rsp+8*185],rax
	mov rax,  [rsp+8*184]
	mov [rdx],rax
	mov qword [rsp+8*186],rdx
	mov rax,  [gbl+8*112]
	mov rdx,rax
	mov rbx,  [rsp+8*161]
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*187],rdx
	mov rdx,  [rsp+8*129]
	mov [rax],rdx
	mov qword [rsp+8*188],rax
	mov rax,  [rsp+8*154]
	mov rdx,rax
	mov rax,rbx
	mov rbx,rdx
	mov qword [rsp+8*161],rbx
	mov qword [rsp+8*129],rdx
	mov qword [rsp+8*154],rax
	jmp L_135
	
L_137:
	mov rdx,  [rsp+8*107]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*189],rbx
	mov qword [rsp+8*107],rdx
	jmp L_133
	
L_134:
	mov rdx,  [rsp+8*106]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*190],rbx
	mov rbx,rax
	mov rdx,  [rsp+8*54]
	mov rdi,rdx
	mov rdx,rdi
	mov qword [rsp+8*192],rbx
	mov qword [rsp+8*193],rdx
	mov qword [rsp+8*191],rax
	mov     rdi, [rsp+8*193]
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword[rsp+8*194], rax
	mov rbx,  [rsp+8*194]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*195],rdx
	mov rdi,[rsp+8*195] 
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
	mov rbx,  [rsp+8*100]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*196],rdx
	mov     rdi, [rsp+8*196]
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword[rsp+8*197], rax
	mov rbx,  [rsp+8*197]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*198],rdx
	mov rdi,[rsp+8*198] 
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
	mov rbx,  [rsp+8*104]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*199],rdx
	mov     rdi, [rsp+8*199]
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword[rsp+8*200], rax
	mov rbx,  [rsp+8*200]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*201],rdx
	mov rdi,[rsp+8*201] 
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
	mov rbx,  [rsp+8*192]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*202],rdx
	mov     rdi, [rsp+8*202]
	push r11
	push r10
	push r9
	push r8
	call    toString
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword[rsp+8*203], rax
	mov rbx,  [rsp+8*203]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*204],rdx
	mov rdi,[rsp+8*204] 
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
	mov     rdi, 1
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [rsp+8*205], rax
	mov rdx,  [rsp+8*205]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*206],rbx
	mov rbx,rax
	mov qword [arg+8*63],rbx
	mov qword [rsp+8*207],rax
	call A_Optimizer
	mov rbx , rax
	mov rdx,0
	mov rax,rdx
	        mov     rsp, qword [trsp]
	leave
	ret
	
quicksort:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2832
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*209],rbx
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*210],rdx
	mov rdx,  [gbl+8*37]
	mov rbx,rdx
	mov qword [rsp+8*211],rax
	mov rax,  [rsp+8*209]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*212],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*213],rdx
	mov rdx,rbx
	mov qword [rsp+8*214],rbx
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*215],rdx
	mov rdx,0
	mov rax,rdx
	mov rdx,  [rsp+8*209]
	mov qword [rsp+8*216],rbx
	mov rbx,1
	mov qword [rsp+8*217],rax
	mov rax,rdx
	add rax,rbx
	mov rbx,rax
	mov qword [rsp+8*219],rbx
	mov qword [rsp+8*218],rax
	
L_12:
	mov rbx,  [rsp+8*219]
	mov rdx,  [rsp+8*210]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*220],rax
	je L_13
	mov rdx,  [rsp+8*211]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*221],rbx
	mov rax,  [gbl+8*37]
	mov rbx,rax
	mov qword [rsp+8*211],rdx
	mov rdx,  [rsp+8*219]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*222],rbx
	mov rbx, [rax]
	mov qword [rsp+8*223],rax
	mov rax,  [rsp+8*215]
	cmp rbx,rax
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*224],rbx
	mov qword [rsp+8*225],rdx
	je L_15
	mov rdx,  [gbl+8*37]
	mov rbx,rdx
	mov rax,  [rsp+8*219]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*226],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*227],rdx
	mov rax,  [rsp+8*216]
	mov rdx,rax
	mov qword [rsp+8*228],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*229],rdx
	mov rdx,  [gbl+8*68]
	mov rbx,rdx
	mov qword [rsp+8*216],rax
	mov rax,  [rsp+8*229]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*230],rbx
	mov rbx,  [rsp+8*228]
	mov [rdx],rbx
	mov qword [rsp+8*231],rdx
	jmp L_16
	
L_15:
	mov rdx,  [gbl+8*37]
	mov rbx,rdx
	mov rax,  [rsp+8*219]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*232],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*233],rdx
	mov rax,  [rsp+8*217]
	mov rdx,rax
	mov qword [rsp+8*234],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*235],rdx
	mov rdx,  [gbl+8*72]
	mov rbx,rdx
	mov qword [rsp+8*217],rax
	mov rax,  [rsp+8*235]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*236],rbx
	mov rbx,  [rsp+8*234]
	mov [rdx],rbx
	mov qword [rsp+8*237],rdx
	
L_16:
	mov rdx,  [rsp+8*219]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*238],rbx
	mov qword [rsp+8*219],rdx
	jmp L_12
	
L_13:
	mov rdx,  [rsp+8*209]
	mov rbx,rdx
	mov qword [rsp+8*239],rbx
	mov rbx,0
	mov rax,rbx
	mov qword [rsp+8*219],rax
	
L_17:
	mov rbx,  [rsp+8*219]
	mov rdx,  [rsp+8*216]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*240],rax
	je L_18
	mov rdx,  [gbl+8*68]
	mov rbx,rdx
	mov rax,  [rsp+8*219]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*241],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*242],rdx
	mov rax,  [rsp+8*239]
	mov rdx,rax
	mov qword [rsp+8*243],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*244],rdx
	mov rdx,  [gbl+8*37]
	mov rbx,rdx
	mov qword [rsp+8*239],rax
	mov rax,  [rsp+8*244]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*245],rbx
	mov rbx,  [rsp+8*243]
	mov [rdx],rbx
	mov qword [rsp+8*246],rdx
	mov rdx,  [rsp+8*219]
	mov rbx,rdx
	mov qword [rsp+8*247],rbx
	mov rbx,1
	add rdx,rbx
	mov qword [rsp+8*219],rdx
	jmp L_17
	
L_18:
	mov rdx,  [rsp+8*239]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*248],rbx
	mov rbx,  [gbl+8*37]
	mov rax,rbx
	mov qword [rsp+8*239],rdx
	mov rdx,  [rsp+8*248]
	lea rbx,[rax+rdx*8+8H]
	mov rdx,  [rsp+8*215]
	mov [rbx],rdx
	mov qword [rsp+8*250],rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*219],rbx
	mov qword [rsp+8*249],rax
	
L_20:
	mov rbx,  [rsp+8*219]
	mov rdx,  [rsp+8*217]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*251],rax
	je L_21
	mov rdx,  [gbl+8*72]
	mov rbx,rdx
	mov rax,  [rsp+8*219]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*252],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*253],rdx
	mov rax,  [rsp+8*239]
	mov rdx,rax
	mov qword [rsp+8*254],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*239],rax
	mov rax,  [gbl+8*37]
	mov rbx,rax
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*256],rbx
	mov rbx,  [rsp+8*254]
	mov [rax],rbx
	mov qword [rsp+8*255],rdx
	mov rdx,  [rsp+8*219]
	mov rbx,rdx
	mov qword [rsp+8*258],rbx
	mov rbx,1
	add rdx,rbx
	mov qword [rsp+8*219],rdx
	mov qword [rsp+8*257],rax
	jmp L_20
	
L_21:
	mov rbx,  [rsp+8*216]
	cmp rbx,1
	mov rdx, 0
	setg dl
	cmp rdx, 0
	mov qword [rsp+8*259],rdx
	je L_24
	mov rbx,  [rsp+8*209]
	mov rdx,  [rsp+8*216]
	mov rax,rbx
	add rax,rdx
	mov rsi,rax
	mov rdi,rbx
	mov qword [rsp+8*260],rax
	call quicksort
	mov rbx , rax
	mov rdx,  [rsp+8*211]
	mov rax,rdx
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*261],rbx
	mov qword [rsp+8*211],rdx
	mov qword [rsp+8*262],rax
	
L_24:
	mov rbx,  [rsp+8*217]
	cmp rbx,1
	mov rdx, 0
	setg dl
	cmp rdx, 0
	mov qword [rsp+8*263],rdx
	je L_26
	mov rbx,  [rsp+8*210]
	mov rdx,  [rsp+8*217]
	mov rax,rbx
	sub rax,rdx
	mov rsi,rbx
	mov rdi,rax
	mov qword [rsp+8*264],rax
	call quicksort
	mov rbx , rax
	mov rdx,  [rsp+8*211]
	mov rax,rdx
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*265],rbx
	mov qword [rsp+8*211],rdx
	mov qword [rsp+8*266],rax
	
L_26:
	mov rbx,  [rsp+8*211]
	mov rax,rbx
	leave
	ret
	
mergesort:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2832
	mov rbx,rdi
	mov rdx,rsi
	mov rax,1
	mov qword [rsp+8*268],rdx
	mov rdx,rbx
	add rdx,rax
	mov rax,  [rsp+8*268]
	cmp rdx,rax
	mov qword [rsp+8*267],rbx
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*270],rbx
	mov qword [rsp+8*269],rdx
	je L_34
	mov rbx,0
	mov rax,rbx
	leave
	ret
	
L_34:
	mov rbx,  [rsp+8*267]
	mov rdx,  [rsp+8*268]
	mov rax,rbx
	add rax,rdx
	mov rbx,1
	mov rcx,rbx
	shr rax,cl
	mov rbx,rax
	mov rdx,0
	mov rax,rdx
	mov rsi,rbx
	mov rdx,  [rsp+8*267]
	mov rdi,rdx
	mov qword [rsp+8*272],rbx
	mov qword [rsp+8*273],rax
	call mergesort
	mov rbx , rax
	mov rdx,  [rsp+8*273]
	mov rax,rdx
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*274],rbx
	mov rbx,  [rsp+8*268]
	mov rsi,rbx
	mov rax,  [rsp+8*272]
	mov rdi,rax
	mov qword [rsp+8*273],rdx
	call mergesort
	mov rbx , rax
	mov rdx,  [rsp+8*273]
	mov rax,rdx
	add rax,rbx
	mov rdx,rax
	mov qword [rsp+8*276],rbx
	mov rax,0
	mov rbx,rax
	mov qword [rsp+8*273],rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*278],rbx
	mov rbx,  [rsp+8*267]
	mov rdx,rbx
	mov qword [rsp+8*280],rdx
	mov qword [rsp+8*279],rax
	
L_35:
	mov rbx,  [rsp+8*280]
	mov rdx,  [rsp+8*272]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*281],rax
	je L_36
	mov rdx,  [gbl+8*37]
	mov rbx,rdx
	mov rax,  [rsp+8*280]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*282],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*283],rdx
	mov rax,  [rsp+8*278]
	mov rdx,rax
	mov qword [rsp+8*284],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*285],rdx
	mov rdx,  [gbl+8*68]
	mov rbx,rdx
	mov qword [rsp+8*278],rax
	mov rax,  [rsp+8*285]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*286],rbx
	mov rbx,  [rsp+8*284]
	mov [rdx],rbx
	mov qword [rsp+8*287],rdx
	mov rdx,  [rsp+8*280]
	mov rbx,rdx
	mov qword [rsp+8*288],rbx
	mov rbx,1
	add rdx,rbx
	mov qword [rsp+8*280],rdx
	jmp L_35
	
L_36:
	mov rdx,  [rsp+8*272]
	mov rbx,rdx
	mov qword [rsp+8*280],rbx
	
L_38:
	mov rbx,  [rsp+8*280]
	mov rdx,  [rsp+8*268]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*289],rax
	je L_39
	mov rdx,  [gbl+8*37]
	mov rbx,rdx
	mov rax,  [rsp+8*280]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*290],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*291],rdx
	mov rax,  [rsp+8*279]
	mov rdx,rax
	mov qword [rsp+8*292],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*293],rdx
	mov rdx,  [gbl+8*72]
	mov rbx,rdx
	mov qword [rsp+8*279],rax
	mov rax,  [rsp+8*293]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*294],rbx
	mov rbx,  [rsp+8*292]
	mov [rdx],rbx
	mov qword [rsp+8*295],rdx
	mov rdx,  [rsp+8*280]
	mov rbx,rdx
	mov qword [rsp+8*296],rbx
	mov rbx,1
	add rdx,rbx
	mov qword [rsp+8*280],rdx
	jmp L_38
	
L_39:
	mov rdx,0
	mov rbx,rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*297],rbx
	mov rbx,  [rsp+8*267]
	mov rdx,rbx
	mov qword [rsp+8*299],rdx
	mov qword [rsp+8*298],rax
	
L_41:
	mov rbx,  [rsp+8*297]
	mov rdx,  [rsp+8*278]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*300],rax
	jne L_43
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*300],rbx
	jmp L_44
	
L_43:
	mov rbx,  [rsp+8*298]
	mov rdx,  [rsp+8*279]
	cmp rbx,rdx
	mov rax, 0
	setl al
	mov rbx,rax
	mov qword [rsp+8*300],rbx
	mov qword [rsp+8*301],rax
	
L_44:
	mov rbx,  [rsp+8*300]
	cmp rbx, 0
	je L_42
	mov rdx,  [rsp+8*273]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*302],rbx
	mov rax,  [gbl+8*68]
	mov rbx,rax
	mov qword [rsp+8*273],rdx
	mov rdx,  [rsp+8*297]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*303],rbx
	mov rbx, [rax]
	mov qword [rsp+8*304],rax
	mov rdx,  [gbl+8*72]
	mov rax,rdx
	mov qword [rsp+8*305],rbx
	mov rbx,  [rsp+8*298]
	lea rdx,[rax+rbx*8+8H]
	mov qword [rsp+8*306],rax
	mov rax, [rdx]
	mov qword [rsp+8*307],rdx
	mov rdx,  [rsp+8*305]
	cmp rdx,rax
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*309],rbx
	mov qword [rsp+8*308],rax
	je L_45
	mov rdx,  [rsp+8*297]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*310],rbx
	mov rbx,  [gbl+8*68]
	mov rax,rbx
	mov qword [rsp+8*297],rdx
	mov rdx,  [rsp+8*310]
	lea rbx,[rax+rdx*8+8H]
	mov rdx, [rbx]
	mov qword [rsp+8*312],rbx
	mov qword [rsp+8*311],rax
	mov rax,  [rsp+8*299]
	mov rbx,rax
	mov qword [rsp+8*313],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*314],rbx
	mov rbx,  [gbl+8*37]
	mov rdx,rbx
	mov qword [rsp+8*299],rax
	mov rax,  [rsp+8*314]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*315],rdx
	mov rdx,  [rsp+8*313]
	mov [rbx],rdx
	mov qword [rsp+8*316],rbx
	jmp L_46
	
L_45:
	mov rdx,  [rsp+8*298]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*317],rbx
	mov rbx,  [gbl+8*72]
	mov rax,rbx
	mov qword [rsp+8*298],rdx
	mov rdx,  [rsp+8*317]
	lea rbx,[rax+rdx*8+8H]
	mov rdx, [rbx]
	mov qword [rsp+8*319],rbx
	mov qword [rsp+8*318],rax
	mov rax,  [rsp+8*299]
	mov rbx,rax
	mov qword [rsp+8*320],rdx
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*321],rbx
	mov rbx,  [gbl+8*37]
	mov rdx,rbx
	mov qword [rsp+8*299],rax
	mov rax,  [rsp+8*321]
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*322],rdx
	mov rdx,  [rsp+8*320]
	mov [rbx],rdx
	mov qword [rsp+8*323],rbx
	
L_46:
	jmp L_41
	
L_42:
	
L_47:
	mov rbx,  [rsp+8*297]
	mov rdx,  [rsp+8*278]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*324],rax
	je L_48
	mov rdx,  [rsp+8*297]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*297],rdx
	mov rax,  [gbl+8*68]
	mov rdx,rax
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*325],rbx
	mov rbx, [rax]
	mov qword [rsp+8*326],rdx
	mov qword [rsp+8*327],rax
	mov rax,  [rsp+8*299]
	mov rdx,rax
	mov qword [rsp+8*328],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*329],rdx
	mov rdx,  [gbl+8*37]
	mov rbx,rdx
	mov qword [rsp+8*299],rax
	mov rax,  [rsp+8*329]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*330],rbx
	mov rbx,  [rsp+8*328]
	mov [rdx],rbx
	mov qword [rsp+8*331],rdx
	jmp L_47
	
L_48:
	
L_49:
	mov rbx,  [rsp+8*298]
	mov rdx,  [rsp+8*279]
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*332],rax
	je L_50
	mov rdx,  [rsp+8*298]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*298],rdx
	mov rax,  [gbl+8*72]
	mov rdx,rax
	lea rax,[rdx+rbx*8+8H]
	mov qword [rsp+8*333],rbx
	mov rbx, [rax]
	mov qword [rsp+8*334],rdx
	mov qword [rsp+8*335],rax
	mov rax,  [rsp+8*299]
	mov rdx,rax
	mov qword [rsp+8*336],rbx
	mov rbx,1
	add rax,rbx
	mov qword [rsp+8*299],rax
	mov rax,  [gbl+8*37]
	mov rbx,rax
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*338],rbx
	mov rbx,  [rsp+8*336]
	mov [rax],rbx
	mov qword [rsp+8*337],rdx
	mov qword [rsp+8*339],rax
	jmp L_49
	
L_50:
	mov rbx,  [rsp+8*273]
	mov rax,rbx
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2832
	mov rdx,100000
	mov rbx,rdx
	mov qword [gbl+8*340],rbx
	mov     rdi, [gbl+8*340]
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*341], rax
	mov rdx,  [gbl+8*341]
	mov rbx,rdx
	mov qword [gbl+8*37],rbx
	mov     rdi, [gbl+8*340]
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*342], rax
	mov rdx,  [gbl+8*342]
	mov rbx,rdx
	mov qword [gbl+8*47],rbx
	mov     rdi, [gbl+8*340]
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*343], rax
	mov rdx,  [gbl+8*343]
	mov rbx,rdx
	mov qword [gbl+8*68],rbx
	mov     rdi, [gbl+8*340]
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*344], rax
	mov rdx,  [gbl+8*344]
	mov rbx,rdx
	mov qword [gbl+8*72],rbx
	mov     rdi, [gbl+8*340]
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*345], rax
	mov rdx,  [gbl+8*345]
	mov rbx,rdx
	mov qword [gbl+8*112],rbx
	mov rbx,  [rsp+8*346]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   4816
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


