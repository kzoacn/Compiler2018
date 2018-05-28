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
	sub    rsp, 984
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 2968
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	push r13
	call global_init
	pop r13
	pop r15
	mov r15 , rax
	mov rbx,110
	mov rdi,rbx
	mov r15,rdi
	mov     rdi,  r15
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [rsp+8*4], rax
	mov rbx,  [rsp+8*4]
	mov r10,rbx
	mov rdx,0
	mov r9,rdx
	
L_1924:
	cmp r9,r15
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*7],rbx
	je L_1925
	mov     rdi,  r15
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [rsp+8*8], rax
	mov rbx,r10
	lea rdx,[rbx+r9*8+8H]
	mov rax,  [rsp+8*8]
	mov [rdx],rax
	mov qword [rsp+8*9],rbx
	mov rbx,0
	mov r8,rbx
	mov qword [rsp+8*10],rdx
	
L_1926:
	cmp r8,r15
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*12],rbx
	je L_1927
	mov rbx,r10
	lea rdx,[rbx+r9*8+8H]
	mov rbx, [rdx]
	lea rdx,[rbx+r8*8+8H]
	mov rax,0
	mov [rdx],rax
	mov qword [rsp+8*13],rbx
	mov rbx,r8
	mov qword [rsp+8*15],rbx
	mov rbx,1
	add r8,rbx
	mov qword [rsp+8*14],rdx
	jmp L_1926
	
L_1927:
	mov rbx,r9
	mov rdx,1
	add r9,rdx
	mov qword [rsp+8*16],rbx
	jmp L_1924
	
L_1925:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,0
	mov r15,rdx
	mov rax,99
	mov r12,rax
	mov rdx,100
	mov rbx,rdx
	mov rdx,0
	mov r11,rdx
	mov rsi,rbx
	mov rdi,r12
	mov r14,rdi
	mov r15,rsi
	mov rdx,1
	mov r9,rdx
	mov qword [rsp+8*21],rbx
	
L_1932:
	mov rbx,49
	cmp r9,rbx
	mov rdx, 0
	setle dl
	cmp rdx, 0
	mov qword [rsp+8*26],rdx
	je L_1933
	mov rbx,50
	mov r8,rbx
	
L_1934:
	mov rbx,98
	mov rdx,rbx
	sub rdx,r9
	mov rax,1
	add rdx,rax
	cmp r8,rdx
	mov rdx, 0
	setle dl
	add r13,r13
	cmp rdx, 0
	mov qword [rsp+8*27],rdx
	je L_1936
	mov rbx,r10
	lea rdx,[rbx+r9*8+8H]
	mov rbx, [rdx]
	lea rdx,[rbx+r8*8+8H]
	mov rax,1
	mov [rdx],rax
	mov qword [rsp+8*29],rbx
	mov rbx,r8
	mov qword [rsp+8*31],rbx
	mov rbx,1
	add r8,rbx
	mov qword [rsp+8*30],rdx
	jmp L_1934
	
L_1936:
	mov rbx,r9
	mov rdx,1
	add r9,rdx
	mov qword [rsp+8*32],rbx
	jmp L_1932
	
L_1933:
	mov rbx,1
	mov r9,rbx
	
L_1939:
	mov rbx,49
	cmp r9,rbx
	mov rdx, 0
	setle dl
	cmp rdx, 0
	mov qword [rsp+8*33],rdx
	je L_1940
	mov rbx,r10
	lea rdx,[rbx+r14*8+8H]
	mov rbx, [rdx]
	lea rdx,[rbx+r9*8+8H]
	mov rax,1
	mov [rdx],rax
	mov qword [rsp+8*34],rbx
	mov rbx,r9
	mov qword [rsp+8*36],rbx
	mov rbx,1
	add r9,rbx
	mov qword [rsp+8*35],rdx
	jmp L_1939
	
L_1940:
	mov rbx,50
	mov r9,rbx
	
L_1942:
	mov rbx,98
	cmp r9,rbx
	mov rdx, 0
	setle dl
	cmp rdx, 0
	mov qword [rsp+8*37],rdx
	je L_1943
	mov rbx,r10
	lea rdx,[rbx+r9*8+8H]
	mov rbx, [rdx]
	lea rdx,[rbx+r15*8+8H]
	mov rax,1
	mov [rdx],rax
	mov qword [rsp+8*38],rbx
	mov rbx,r9
	mov qword [rsp+8*40],rbx
	mov rbx,1
	add r9,rbx
	mov qword [rsp+8*39],rdx
	jmp L_1942
	
L_1943:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	
L_1879:
	mov rbx,r11
	mov rsi,r12
	mov rdx,  [rsp+8*21]
	mov rdi,rdx
	mov r13,rdi
	mov r14,rsi
	mov r15,rbx
	mov qword [arg+8*2],rbx
	mov rbx,0
	mov rax,rbx
	mov rdx,1
	mov rbx,rdx
	mov rdx,1
	mov r9,rdx
	mov qword [gbl+8*48],rbx
	mov qword [gbl+8*47],rax
	
L_1947:
	cmp r9,r13
	mov rbx, 0
	setle bl
	cmp rbx, 0
	mov qword [rsp+8*49],rbx
	je L_1948
	mov rbx,  [gbl+8*50]
	mov r15,rbx
	lea r15,[r15+r9*8+8H]
	mov rdx,0
	mov [r15],rdx
	mov r15,r9
	mov rax,1
	add r9,rax
	jmp L_1947
	
L_1948:
	mov rbx,  [gbl+8*54]
	mov r15,rbx
	mov rdx,1
	lea r15,[r15+rdx*8+8H]
	mov [r15],r14
	mov rax,  [gbl+8*50]
	mov r15,rax
	lea r15,[r15+r14*8+8H]
	mov rdx,1
	mov [r15],rdx
	mov rdx,  [gbl+8*59]
	mov r15,rdx
	lea r15,[r15+r14*8+8H]
	mov rbx,0
	mov [r15],rbx
	mov rbx,0
	mov r15,rbx
	
L_1950:
	mov rbx,  [gbl+8*47]
	mov rdx,  [gbl+8*48]
	cmp rbx,rdx
	mov r14, 0
	setl r14B
	cmp r14, 0
	jne L_1951
	mov rbx,0
	mov r14,rbx
	jmp L_1952
	
L_1951:
	mov rbx,0
	cmp r15,rbx
	mov r14, 0
	sete r14B
	mov r14,r14
	
L_1952:
	cmp r14, 0
	je L_1953
	mov rbx,  [gbl+8*47]
	mov r14,rbx
	mov rdx,1
	add rbx,rdx
	mov rax,  [gbl+8*54]
	mov r14,rax
	lea r14,[r14+rbx*8+8H]
	mov r14, [r14]
	mov r9,r14
	mov qword [gbl+8*47],rbx
	mov rbx,1
	mov r8,rbx
	
L_1954:
	cmp r8,r13
	mov r14, 0
	setle r14B
	cmp r14, 0
	je L_1955
	mov r14,r10
	lea r14,[r14+r9*8+8H]
	mov r14, [r14]
	lea r14,[r14+r8*8+8H]
	mov r14, [r14]
	cmp r14,0
	mov r14, 0
	setg r14B
	cmp r14, 0
	jne L_1956
	mov rbx,0
	mov r14,rbx
	jmp L_1957
	
L_1956:
	mov rbx,  [gbl+8*50]
	mov r14,rbx
	lea r14,[r14+r8*8+8H]
	mov r14, [r14]
	mov rdx,0
	cmp r14,rdx
	mov r14, 0
	sete r14B
	mov r14,r14
	
L_1957:
	cmp r14, 0
	je L_1958
	mov rbx,  [gbl+8*50]
	mov r14,rbx
	lea r14,[r14+r8*8+8H]
	mov rdx,1
	mov [r14],rdx
	mov rax,  [gbl+8*48]
	mov r14,rax
	mov rdx,1
	add rax,rdx
	mov rdx,  [gbl+8*54]
	mov r14,rdx
	lea r14,[r14+rax*8+8H]
	mov [r14],r8
	mov rbx,  [gbl+8*59]
	mov r14,rbx
	lea r14,[r14+r8*8+8H]
	mov [r14],r9
	cmp rax,r13
	mov r14, 0
	sete r14B
	cmp r14, 0
	mov qword [gbl+8*48],rax
	je L_1959
	mov rbx,1
	mov r15,rbx
	
L_1959:
	
L_1958:
	mov r14,r8
	mov rbx,1
	add r8,rbx
	jmp L_1954
	
L_1955:
	jmp L_1950
	
L_1953:
	mov r15,r15
	mov r15,r15
	cmp r15,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	je L_1880
	mov rbx,  [rsp+8*21]
	mov rdi,rbx
	mov r15,rdi
	mov r9,r15
	mov rdx,  [gbl+8*90]
	mov r15,rdx
	mov rax,1
	add rdx,rax
	mov qword [gbl+8*90],rdx
	
L_1963:
	mov rbx,  [gbl+8*59]
	mov r15,rbx
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	cmp r15,0
	mov r15, 0
	setg r15B
	cmp r15, 0
	je L_1964
	mov rbx,  [gbl+8*59]
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
	jmp L_1963
	
L_1964:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	jmp L_1879
	
L_1880:
	mov rbx,  [gbl+8*90]
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
	sub    rsp, 984
	mov rdx,0
	mov rbx,rdx
	mov qword [gbl+8*90],rbx
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
	mov     qword [gbl+8*112], rax
	mov rdx,  [gbl+8*112]
	mov rbx,rdx
	mov qword [gbl+8*50],rbx
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
	mov     qword [gbl+8*113], rax
	mov rdx,  [gbl+8*113]
	mov rbx,rdx
	mov qword [gbl+8*59],rbx
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
	mov     qword [gbl+8*114], rax
	mov rdx,  [gbl+8*114]
	mov rbx,rdx
	mov qword [gbl+8*54],rbx
	mov rbx,  [rsp+8*115]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   2968
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
	

