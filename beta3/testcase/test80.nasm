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
	sub    rsp, 1080
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 3064
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	call global_init
	pop r15
	mov r15 , rax
	mov rdx,9987
	mov rbx,rdx
	mov qword [gbl+8*2],rbx
	mov     rdi, [gbl+8*2]
	push r11
	push r10
	call    mallocArray
	pop r10
	pop r11
	mov     qword  r15, rax
	mov r13,r15
	mov rbx,0
	mov r14,rbx
	
L_1990:
	mov r15,r13
	mov rbx,r15
	mov r15,rbx
	mov r15, [r15]
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [arg+8*63],rbx
	je L_1991
	mov r15,r13
	lea r15,[r15+r14*8+8H]
	mov [r15],r14
	mov rbx,1
	mov r15,r14
	add r15,rbx
	mov r14,r15
	jmp L_1990
	
L_1991:
	mov rbx,  [gbl+8*2]
	mov rdx,1
	mov rax,rbx
	sub rax,rdx
	mov qword [rsp+8*13],rax
	xor rdx, rdx
	mov rax, [rsp+8*13]
	mov rbx, 2
	cdq
	idiv rbx
	mov [rsp+8*14], rax
	mov rbx,  [rsp+8*14]
	mov r14,rbx
	mov rdx,0
	mov r15,rdx
	mov rax,0
	mov r15,rax
	
L_2045:
	mov rbx,0
	cmp r14,rbx
	mov rdx, 0
	setge dl
	cmp rdx, 0
	mov qword [rsp+8*18],rdx
	je L_2046
	mov rbx,2
	mov rdx,r14
	imul rdx,rbx
	mov r15,rdx
	mov rax,2
	mov rbx,r14
	imul rbx,rax
	mov rdx,1
	add rbx,rdx
	mov rdx,  [gbl+8*2]
	cmp rbx,rdx
	mov rbx, 0
	setl bl
	cmp rbx, 0
	mov qword [rsp+8*20],rbx
	jne L_2047
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*20],rbx
	jmp L_2048
	
L_2047:
	mov rbx,2
	mov rdx,r14
	imul rdx,rbx
	mov rax,1
	add rdx,rax
	mov rbx,r13
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*22],rbx
	mov rbx, [rax]
	mov rdx,2
	mov qword [rsp+8*23],rax
	mov rax,r14
	imul rax,rdx
	mov rdx,r13
	mov qword [rsp+8*24],rbx
	lea rbx,[rdx+rax*8+8H]
	mov qword [rsp+8*26],rdx
	mov rdx, [rbx]
	mov qword [rsp+8*27],rbx
	mov rbx,  [rsp+8*24]
	cmp rbx,rdx
	mov rax, 0
	setl al
	mov rbx,rax
	mov qword [rsp+8*20],rbx
	mov qword [rsp+8*28],rdx
	mov qword [rsp+8*29],rax
	
L_2048:
	mov rbx,  [rsp+8*20]
	cmp rbx, 0
	je L_2049
	mov rbx,2
	mov rdx,r14
	imul rdx,rbx
	mov rax,1
	add rdx,rax
	mov r15,rdx
	mov qword [rsp+8*30],rdx
	
L_2049:
	mov rbx,r13
	lea rdx,[rbx+r14*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*31],rbx
	mov rbx,r13
	mov qword [rsp+8*32],rdx
	lea rdx,[rbx+r15*8+8H]
	mov qword [rsp+8*34],rbx
	mov rbx, [rdx]
	cmp rax,rbx
	mov qword [rsp+8*35],rdx
	mov rdx, 0
	setg dl
	cmp rdx, 0
	mov qword [rsp+8*36],rbx
	mov qword [rsp+8*37],rdx
	mov qword [rsp+8*33],rax
	je L_2050
	mov rsi,r15
	mov rdi,r14
	mov r12,rdi
	mov r11,rsi
	mov rbx,r13
	lea rdx,[rbx+r12*8+8H]
	mov rax, [rdx]
	mov r15,rax
	mov qword [rsp+8*42],rbx
	mov rbx,r13
	mov qword [rsp+8*43],rdx
	lea rdx,[rbx+r11*8+8H]
	mov qword [rsp+8*46],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*47],rdx
	mov rdx,r13
	mov qword [rsp+8*44],rax
	lea rax,[rdx+r12*8+8H]
	mov [rax],rbx
	mov qword [rsp+8*48],rbx
	mov rbx,r13
	mov qword [rsp+8*49],rdx
	lea rdx,[rbx+r11*8+8H]
	mov [rdx],r15
	mov qword [rsp+8*51],rbx
	mov rbx,0
	mov r15,rbx
	mov rbx,r15
	mov qword [rsp+8*54],rbx
	mov qword [rsp+8*52],rdx
	mov qword [rsp+8*50],rax
	
L_2050:
	mov rbx,1
	mov rdx,r14
	sub rdx,rbx
	mov r14,rdx
	mov qword [rsp+8*55],rdx
	jmp L_2045
	
L_2046:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,0
	mov r14,rdx
	mov rax,0
	mov r12,rax
	
L_2055:
	mov rbx,  [gbl+8*2]
	cmp r12,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_2056
	mov r15,r13
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov r14,r15
	mov rdx,  [gbl+8*2]
	mov r15,rdx
	sub r15,r12
	mov rax,1
	sub r15,rax
	mov r11,r13
	lea r15,[r11+r15*8+8H]
	mov r11, [r15]
	mov r15,r13
	mov rbx,0
	lea r15,[r15+rbx*8+8H]
	mov [r15],r11
	mov r11,rdx
	sub r11,r12
	mov rbx,1
	sub r11,rbx
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov [r15],r14
	mov r15,rdx
	sub r15,r12
	mov rbx,1
	sub r15,rbx
	mov rdi,r15
	mov rbx,rdi
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*74],rbx
	mov rbx,0
	mov rax,rbx
	mov rbx,0
	mov r15,rbx
	mov qword [rsp+8*75],rdx
	mov qword [rsp+8*76],rax
	
L_2057:
	mov rbx,  [rsp+8*75]
	mov rdx,2
	mov rax,rbx
	imul rax,rdx
	mov rdx,  [rsp+8*74]
	cmp rax,rdx
	mov rax, 0
	setl al
	mov rbx,  [rsp+8*79]
	add rbx,rbx
	cmp rax, 0
	mov qword [rsp+8*79],rbx
	mov qword [rsp+8*78],rax
	je L_2059
	mov rbx,  [rsp+8*75]
	mov rdx,2
	mov rax,rbx
	imul rax,rdx
	mov rdx,rax
	mov rax,2
	mov qword [rsp+8*76],rdx
	mov rdx,rbx
	imul rdx,rax
	mov rax,1
	add rdx,rax
	mov rax,  [rsp+8*74]
	cmp rdx,rax
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*81],rdx
	jne L_2060
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*81],rbx
	jmp L_2061
	
L_2060:
	mov rbx,  [rsp+8*75]
	mov rdx,2
	mov r14,rbx
	imul r14,rdx
	mov rax,1
	add r14,rax
	mov r15,r13
	lea r15,[r15+r14*8+8H]
	mov r14, [r15]
	mov rdx,2
	mov r11,rbx
	imul r11,rdx
	mov r15,r13
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	cmp r14,r15
	mov r15, 0
	setl r15B
	mov rdx,r15
	mov qword [rsp+8*81],rdx
	
L_2061:
	mov rbx,  [rsp+8*81]
	cmp rbx, 0
	je L_2062
	mov rbx,  [rsp+8*75]
	mov rdx,2
	mov r15,rbx
	imul r15,rdx
	mov rax,1
	add r15,rax
	mov rdx,r15
	mov qword [rsp+8*76],rdx
	
L_2062:
	mov r15,r13
	mov rbx,  [rsp+8*75]
	lea r15,[r15+rbx*8+8H]
	mov r14, [r15]
	mov r15,r13
	mov rdx,  [rsp+8*76]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	cmp r14,r15
	mov r15, 0
	setg r15B
	cmp r15, 0
	je L_2063
	mov r15,r13
	mov rbx,  [rsp+8*75]
	lea r15,[r15+rbx*8+8H]
	mov r15, [r15]
	mov r11,r15
	mov r15,r13
	mov rdx,  [rsp+8*76]
	lea r15,[r15+rdx*8+8H]
	mov r15, [r15]
	mov r14,r13
	lea r14,[r14+rbx*8+8H]
	mov [r14],r15
	mov r15,r13
	lea r15,[r15+rdx*8+8H]
	mov [r15],r11
	mov rbx,rdx
	mov qword [rsp+8*75],rbx
	jmp L_2064
	
L_2063:
	jmp L_2059
	
L_2064:
	jmp L_2057
	
L_2059:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,1
	mov r15,r12
	add r15,rdx
	mov r12,r15
	jmp L_2055
	
L_2056:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,0
	mov r14,rdx
	
L_1993:
	mov r15,r13
	mov rbx,r15
	mov r15,rbx
	mov r15, [r15]
	cmp r14,r15
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [arg+8*63],rbx
	je L_1994
	mov r15,r13
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
	mov     rsi, t222
	mov     rdi,  r15
	push r11
	push r10
	call    concat
	pop r10
	pop r11
	mov  r15, rax
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
	mov rbx,1
	mov r15,r14
	add r15,rbx
	mov r14,r15
	jmp L_1993
	
L_1994:
	mov rbx,t227
	mov rdi,rbx
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
	sub    rsp, 1080
	mov rbx,  [rsp+8*127]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   3064
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
	
t227:
	 db 1,"",10,"" ,0

t222:
	 db 1," " ,0


