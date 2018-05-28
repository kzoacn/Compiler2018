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


gcd:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1336
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*2],rbx
	mov rbx,  [arg+8*2]
	mov rax,rbx
	mov qword [rsp+8*4],rdx
	mov rbx,  [arg+8*3]
	mov rdx,rbx
	mov qword [rsp+8*6],rax
	mov rbx,  [arg+8*4]
	mov rax,rbx
	mov qword [rsp+8*8],rdx
	mov rbx,  [arg+8*5]
	mov rdx,rbx
	mov qword [rsp+8*10],rax
	mov rbx,  [arg+8*6]
	mov rax,rbx
	mov qword [rsp+8*12],rdx
	mov rbx,  [arg+8*7]
	mov rdx,rbx
	mov qword [rsp+8*14],rax
	mov rbx,  [arg+8*8]
	mov rax,rbx
	mov qword [rsp+8*16],rdx
	mov rbx,  [arg+8*9]
	mov rdx,rbx
	mov qword [rsp+8*18],rax
	mov rbx,  [arg+8*10]
	mov rax,rbx
	mov qword [rsp+8*20],rdx
	mov rbx,  [arg+8*11]
	mov rdx,rbx
	mov qword [rsp+8*22],rax
	mov rax,  [arg+8*12]
	mov r15,rax
	mov rbx,  [arg+8*13]
	mov r13,rbx
	mov qword [rsp+8*24],rdx
	mov rdx,  [arg+8*14]
	mov r14,rdx
	mov rax,  [arg+8*15]
	mov r11,rax
	mov rbx,  [arg+8*16]
	mov r12,rbx
	mov rax,  [arg+8*17]
	mov rdx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,  [arg+8*18]
	mov rbx,rdx
	mov qword [rsp+8*38],rbx
	mov rbx,  [arg+8*19]
	mov rax,rbx
	mov rbx,  [arg+8*20]
	mov rdx,rbx
	mov qword [rsp+8*40],rax
	mov rbx,  [arg+8*21]
	mov rax,rbx
	mov qword [rsp+8*42],rdx
	mov rbx,  [arg+8*22]
	mov rdx,rbx
	mov qword [rsp+8*44],rax
	mov rbx,  [arg+8*23]
	mov rax,rbx
	mov qword [rsp+8*46],rdx
	mov rbx,  [arg+8*24]
	mov rdx,rbx
	mov qword [rsp+8*48],rax
	mov rbx,  [arg+8*25]
	mov rax,rbx
	mov qword [rsp+8*50],rdx
	mov rbx,  [arg+8*26]
	mov rdx,rbx
	mov qword [rsp+8*52],rax
	mov rbx,  [arg+8*27]
	mov rax,rbx
	mov qword [rsp+8*54],rdx
	mov rbx,  [arg+8*28]
	mov rdx,rbx
	mov qword [rsp+8*56],rax
	mov rbx,  [arg+8*29]
	mov rax,rbx
	mov qword [rsp+8*58],rdx
	mov rbx,  [arg+8*30]
	mov rdx,rbx
	mov qword [rsp+8*60],rax
	mov rbx,  [arg+8*31]
	mov rax,rbx
	mov qword [rsp+8*62],rdx
	mov rbx,0
	mov rdx,rbx
	mov qword [rsp+8*65],rdx
	mov qword [rsp+8*64],rax
	
L_2085:
	mov rbx,  [rsp+8*65]
	mov rdx,10
	cmp rbx,rdx
	mov rax, 0
	setle al
	cmp rax, 0
	mov qword [rsp+8*66],rax
	je L_2086
	mov rbx,  [rsp+8*6]
	mov rdx,  [rsp+8*8]
	mov rax,rbx
	add rax,rdx
	mov rbx,  [rsp+8*10]
	add rax,rbx
	mov rdx,  [rsp+8*12]
	add rax,rdx
	mov rbx,  [rsp+8*14]
	add rax,rbx
	mov rdx,  [rsp+8*16]
	add rax,rdx
	mov rbx,  [rsp+8*18]
	add rax,rbx
	mov rdx,  [rsp+8*20]
	add rax,rdx
	mov rbx,  [rsp+8*22]
	add rax,rbx
	mov rdx,  [rsp+8*24]
	add rax,rdx
	add rax,r15
	add rax,r13
	add rax,r14
	add rax,r11
	add rax,r12
	mov rbx,  [rsp+8*36]
	add rax,rbx
	mov rdx,  [rsp+8*38]
	add rax,rdx
	mov rbx,  [rsp+8*40]
	add rax,rbx
	mov rdx,  [rsp+8*42]
	add rax,rdx
	mov rbx,  [rsp+8*44]
	add rax,rbx
	mov rdx,  [rsp+8*46]
	add rax,rdx
	mov rbx,  [rsp+8*48]
	add rax,rbx
	mov rdx,  [rsp+8*50]
	add rax,rdx
	mov rbx,  [rsp+8*52]
	add rax,rbx
	mov rdx,  [rsp+8*54]
	add rax,rdx
	mov rbx,  [rsp+8*56]
	add rax,rbx
	mov rdx,  [rsp+8*58]
	add rax,rdx
	mov rbx,  [rsp+8*60]
	add rax,rbx
	mov rdx,  [rsp+8*62]
	add rax,rdx
	mov rbx,  [rsp+8*64]
	add rax,rbx
	mov qword [rsp+8*67],rax
	xor rdx, rdx
	mov rax, [rsp+8*67]
	mov rbx, 100
	cdq
	idiv rbx
	mov [rsp+8*68], rdx
	mov rdx,  [rsp+8*68]
	mov rbx,rdx
	mov rax,  [rsp+8*65]
	mov rdx,1
	add rax,rdx
	mov qword [rsp+8*69],rbx
	mov qword [rsp+8*65],rax
	jmp L_2085
	
L_2086:
	xor rdx, rdx
	mov rax, [rsp+8*2]
	mov rbx, [rsp+8*4]
	cdq
	idiv rbx
	mov [rsp+8*70], rdx
	mov rbx,  [rsp+8*70]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*71],rax
	je L_2088
	mov rbx,  [rsp+8*4]
	mov rax,rbx
	leave
	ret
	
L_2088:
	xor rdx, rdx
	mov rax, [rsp+8*2]
	mov rbx, [rsp+8*4]
	cdq
	idiv rbx
	mov [rsp+8*72], rdx
	mov rdx,58
	mov rbx,rdx
	mov rdx,56
	mov rax,rdx
	mov qword [arg+8*31],rbx
	mov rbx,54
	mov rdx,rbx
	mov qword [arg+8*30],rax
	mov rax,52
	mov rbx,rax
	mov qword [arg+8*29],rdx
	mov rdx,50
	mov rax,rdx
	mov qword [arg+8*28],rbx
	mov rbx,48
	mov rdx,rbx
	mov qword [arg+8*27],rax
	mov rax,46
	mov rbx,rax
	mov qword [arg+8*26],rdx
	mov rdx,44
	mov rax,rdx
	mov qword [arg+8*25],rbx
	mov rbx,42
	mov rdx,rbx
	mov qword [arg+8*24],rax
	mov rax,40
	mov rbx,rax
	mov qword [arg+8*23],rdx
	mov rdx,38
	mov rax,rdx
	mov qword [arg+8*22],rbx
	mov rbx,36
	mov rdx,rbx
	mov qword [arg+8*21],rax
	mov rax,34
	mov rbx,rax
	mov qword [arg+8*20],rdx
	mov rdx,32
	mov rax,rdx
	mov qword [arg+8*19],rbx
	mov rbx,30
	mov rdx,rbx
	mov qword [arg+8*18],rax
	mov rax,28
	mov rbx,rax
	mov qword [arg+8*17],rdx
	mov rdx,26
	mov rax,rdx
	mov qword [arg+8*16],rbx
	mov rbx,24
	mov rdx,rbx
	mov qword [arg+8*15],rax
	mov rax,22
	mov rbx,rax
	mov qword [arg+8*14],rdx
	mov rdx,20
	mov rax,rdx
	mov qword [arg+8*13],rbx
	mov rbx,18
	mov rdx,rbx
	mov qword [arg+8*12],rax
	mov rax,16
	mov rbx,rax
	mov qword [arg+8*11],rdx
	mov rdx,14
	mov rax,rdx
	mov qword [arg+8*10],rbx
	mov rbx,12
	mov rdx,rbx
	mov qword [arg+8*9],rax
	mov rax,10
	mov rbx,rax
	mov qword [arg+8*8],rdx
	mov rdx,8
	mov rax,rdx
	mov qword [arg+8*7],rbx
	mov rbx,6
	mov rdx,rbx
	mov qword [arg+8*6],rax
	mov rax,4
	mov rbx,rax
	mov qword [arg+8*5],rdx
	mov rdx,2
	mov rax,rdx
	mov qword [arg+8*4],rbx
	mov rbx,0
	mov rdx,rbx
	mov rbx,68
	mov rsi,rbx
	mov rbx,10
	mov rdi,rbx
	mov qword [arg+8*2],rdx
	mov qword [arg+8*3],rax
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call gcd
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rbx , rax
	mov rax,  [rsp+8*64]
	mov rdx,rax
	mov qword [rsp+8*73],rbx
	mov rbx,  [rsp+8*62]
	mov rax,rbx
	mov qword [arg+8*31],rdx
	mov rdx,  [rsp+8*60]
	mov rbx,rdx
	mov qword [arg+8*30],rax
	mov rax,  [rsp+8*58]
	mov rdx,rax
	mov qword [arg+8*29],rbx
	mov rbx,  [rsp+8*56]
	mov rax,rbx
	mov qword [arg+8*28],rdx
	mov rdx,  [rsp+8*54]
	mov rbx,rdx
	mov qword [arg+8*27],rax
	mov rax,  [rsp+8*52]
	mov rdx,rax
	mov qword [arg+8*26],rbx
	mov rbx,  [rsp+8*50]
	mov rax,rbx
	mov qword [arg+8*25],rdx
	mov rdx,  [rsp+8*48]
	mov rbx,rdx
	mov qword [arg+8*24],rax
	mov rax,  [rsp+8*46]
	mov rdx,rax
	mov qword [arg+8*23],rbx
	mov rbx,  [rsp+8*44]
	mov rax,rbx
	mov qword [arg+8*22],rdx
	mov rdx,  [rsp+8*42]
	mov rbx,rdx
	mov qword [arg+8*21],rax
	mov rax,  [rsp+8*40]
	mov rdx,rax
	mov qword [arg+8*20],rbx
	mov rbx,  [rsp+8*38]
	mov rax,rbx
	mov qword [arg+8*19],rdx
	mov rdx,  [rsp+8*36]
	mov rbx,rdx
	mov rdx,r12
	mov qword [arg+8*18],rax
	mov rax,r11
	mov qword [arg+8*17],rbx
	mov rbx,r14
	mov qword [arg+8*16],rdx
	mov rdx,r13
	mov qword [arg+8*15],rax
	mov rax,r15
	mov qword [arg+8*14],rbx
	mov qword [arg+8*13],rdx
	mov rdx,  [rsp+8*24]
	mov rbx,rdx
	mov qword [arg+8*12],rax
	mov rax,  [rsp+8*22]
	mov rdx,rax
	mov qword [arg+8*11],rbx
	mov rbx,  [rsp+8*20]
	mov rax,rbx
	mov qword [arg+8*10],rdx
	mov rdx,  [rsp+8*18]
	mov rbx,rdx
	mov qword [arg+8*9],rax
	mov rax,  [rsp+8*16]
	mov rdx,rax
	mov qword [arg+8*8],rbx
	mov rbx,  [rsp+8*14]
	mov rax,rbx
	mov qword [arg+8*7],rdx
	mov rdx,  [rsp+8*12]
	mov rbx,rdx
	mov qword [arg+8*6],rax
	mov rax,  [rsp+8*10]
	mov rdx,rax
	mov qword [arg+8*5],rbx
	mov rbx,  [rsp+8*73]
	mov rax,rbx
	mov qword [arg+8*4],rdx
	mov rdx,  [rsp+8*69]
	mov rbx,rdx
	mov rdx,  [rsp+8*72]
	mov rsi,rdx
	mov rdx,  [rsp+8*4]
	mov rdi,rdx
	mov qword [arg+8*2],rbx
	mov qword [arg+8*3],rax
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call gcd1
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rbx , rax
	mov rax,rbx
	leave
	ret
	
gcd1:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1336
	mov rbx,rdi
	mov rdx,rsi
	mov rax,  [arg+8*2]
	mov r15,rax
	mov qword [rsp+8*75],rbx
	mov qword [rsp+8*76],rdx
	mov rdx,  [arg+8*3]
	mov rbx,rdx
	mov qword [rsp+8*78],rbx
	mov rbx,  [arg+8*4]
	mov rax,rbx
	mov rbx,  [arg+8*5]
	mov rdx,rbx
	mov qword [rsp+8*79],rax
	mov rax,  [arg+8*6]
	mov r11,rax
	mov qword [rsp+8*80],rdx
	mov rdx,  [arg+8*7]
	mov rbx,rdx
	mov qword [rsp+8*82],rbx
	mov rbx,  [arg+8*8]
	mov rax,rbx
	mov rbx,  [arg+8*9]
	mov rdx,rbx
	mov qword [rsp+8*83],rax
	mov rbx,  [arg+8*10]
	mov rax,rbx
	mov qword [rsp+8*84],rdx
	mov rbx,  [arg+8*11]
	mov rdx,rbx
	mov qword [rsp+8*85],rax
	mov rbx,  [arg+8*12]
	mov rax,rbx
	mov qword [rsp+8*86],rdx
	mov rbx,  [arg+8*13]
	mov rdx,rbx
	mov qword [rsp+8*87],rax
	mov rbx,  [arg+8*14]
	mov rax,rbx
	mov qword [rsp+8*88],rdx
	mov rdx,  [arg+8*15]
	mov r14,rdx
	mov qword [rsp+8*89],rax
	mov rax,  [arg+8*16]
	mov rbx,rax
	mov qword [rsp+8*91],rbx
	mov rbx,  [arg+8*17]
	mov rdx,rbx
	mov rbx,  [arg+8*18]
	mov rax,rbx
	mov qword [rsp+8*92],rdx
	mov rbx,  [arg+8*19]
	mov rdx,rbx
	mov qword [rsp+8*93],rax
	mov rbx,  [arg+8*20]
	mov rax,rbx
	mov qword [rsp+8*94],rdx
	mov rbx,  [arg+8*21]
	mov rdx,rbx
	mov qword [rsp+8*95],rax
	mov rbx,  [arg+8*22]
	mov rax,rbx
	mov qword [rsp+8*96],rdx
	mov rdx,  [arg+8*23]
	mov r13,rdx
	mov qword [rsp+8*97],rax
	mov rax,  [arg+8*24]
	mov rbx,rax
	mov qword [rsp+8*99],rbx
	mov rbx,  [arg+8*25]
	mov rdx,rbx
	mov rbx,  [arg+8*26]
	mov rax,rbx
	mov qword [rsp+8*100],rdx
	mov rdx,  [arg+8*27]
	mov r12,rdx
	mov qword [rsp+8*101],rax
	mov rax,  [arg+8*28]
	mov rbx,rax
	mov qword [rsp+8*103],rbx
	mov rbx,  [arg+8*29]
	mov rdx,rbx
	mov rbx,  [arg+8*30]
	mov rax,rbx
	mov qword [rsp+8*104],rdx
	mov rbx,  [arg+8*31]
	mov rdx,rbx
	mov qword [rsp+8*105],rax
	mov rax,  [rsp+8*78]
	mov rbx,r15
	add rbx,rax
	mov qword [rsp+8*106],rdx
	mov rdx,  [rsp+8*79]
	add rbx,rdx
	mov rax,  [rsp+8*80]
	add rbx,rax
	add rbx,r11
	mov rdx,  [rsp+8*82]
	add rbx,rdx
	mov rax,  [rsp+8*83]
	add rbx,rax
	mov rdx,  [rsp+8*84]
	add rbx,rdx
	mov rax,  [rsp+8*85]
	add rbx,rax
	mov rdx,  [rsp+8*86]
	add rbx,rdx
	mov rax,  [rsp+8*87]
	add rbx,rax
	mov rdx,  [rsp+8*88]
	add rbx,rdx
	mov rax,  [rsp+8*89]
	add rbx,rax
	add rbx,r14
	mov rdx,  [rsp+8*91]
	add rbx,rdx
	mov rax,  [rsp+8*92]
	add rbx,rax
	mov rdx,  [rsp+8*93]
	add rbx,rdx
	mov rax,  [rsp+8*94]
	add rbx,rax
	mov rdx,  [rsp+8*95]
	add rbx,rdx
	mov rax,  [rsp+8*96]
	add rbx,rax
	mov rdx,  [rsp+8*97]
	add rbx,rdx
	add rbx,r13
	mov rax,  [rsp+8*99]
	add rbx,rax
	mov rdx,  [rsp+8*100]
	add rbx,rdx
	mov rax,  [rsp+8*101]
	add rbx,rax
	add rbx,r12
	mov rdx,  [rsp+8*103]
	add rbx,rdx
	mov rax,  [rsp+8*104]
	add rbx,rax
	mov rdx,  [rsp+8*105]
	add rbx,rdx
	mov rax,  [rsp+8*106]
	add rbx,rax
	mov qword [rsp+8*107],rbx
	xor rdx, rdx
	mov rax, [rsp+8*107]
	mov rbx, 100
	cdq
	idiv rbx
	mov [rsp+8*108], rdx
	mov rbx,  [rsp+8*108]
	mov r15,rbx
	xor rdx, rdx
	mov rax, [rsp+8*75]
	mov rbx, [rsp+8*76]
	cdq
	idiv rbx
	mov [rsp+8*110], rdx
	mov rbx,  [rsp+8*110]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*111],rax
	je L_2090
	mov rbx,  [rsp+8*76]
	mov rax,rbx
	leave
	ret
	
L_2090:
	xor rdx, rdx
	mov rax, [rsp+8*75]
	mov rbx, [rsp+8*76]
	cdq
	idiv rbx
	mov [rsp+8*112], rdx
	mov rdx,  [rsp+8*106]
	mov rbx,rdx
	mov rdx,  [rsp+8*105]
	mov rax,rdx
	mov qword [arg+8*31],rbx
	mov rbx,  [rsp+8*104]
	mov rdx,rbx
	mov qword [arg+8*30],rax
	mov rax,  [rsp+8*103]
	mov rbx,rax
	mov rax,r12
	mov qword [arg+8*29],rdx
	mov qword [arg+8*28],rbx
	mov rbx,  [rsp+8*101]
	mov rdx,rbx
	mov qword [arg+8*27],rax
	mov rax,  [rsp+8*100]
	mov rbx,rax
	mov qword [arg+8*26],rdx
	mov rdx,  [rsp+8*99]
	mov rax,rdx
	mov rdx,r13
	mov qword [arg+8*25],rbx
	mov qword [arg+8*24],rax
	mov rax,  [rsp+8*97]
	mov rbx,rax
	mov qword [arg+8*23],rdx
	mov rdx,  [rsp+8*96]
	mov rax,rdx
	mov qword [arg+8*22],rbx
	mov rbx,  [rsp+8*95]
	mov rdx,rbx
	mov qword [arg+8*21],rax
	mov rax,  [rsp+8*94]
	mov rbx,rax
	mov qword [arg+8*20],rdx
	mov rdx,  [rsp+8*93]
	mov rax,rdx
	mov qword [arg+8*19],rbx
	mov rbx,  [rsp+8*92]
	mov rdx,rbx
	mov qword [arg+8*18],rax
	mov rax,  [rsp+8*91]
	mov rbx,rax
	mov rax,r14
	mov qword [arg+8*17],rdx
	mov qword [arg+8*16],rbx
	mov rbx,  [rsp+8*89]
	mov rdx,rbx
	mov qword [arg+8*15],rax
	mov rax,  [rsp+8*88]
	mov rbx,rax
	mov qword [arg+8*14],rdx
	mov rdx,  [rsp+8*87]
	mov rax,rdx
	mov qword [arg+8*13],rbx
	mov rbx,  [rsp+8*86]
	mov rdx,rbx
	mov qword [arg+8*12],rax
	mov rax,  [rsp+8*85]
	mov rbx,rax
	mov qword [arg+8*11],rdx
	mov rdx,  [rsp+8*84]
	mov rax,rdx
	mov qword [arg+8*10],rbx
	mov rbx,  [rsp+8*83]
	mov rdx,rbx
	mov qword [arg+8*9],rax
	mov rax,  [rsp+8*82]
	mov rbx,rax
	mov rax,r11
	mov qword [arg+8*8],rdx
	mov qword [arg+8*7],rbx
	mov rbx,  [rsp+8*80]
	mov rdx,rbx
	mov qword [arg+8*6],rax
	mov rax,  [rsp+8*79]
	mov rbx,rax
	mov qword [arg+8*5],rdx
	mov rdx,  [rsp+8*78]
	mov rax,rdx
	mov rdx,r15
	mov qword [arg+8*4],rbx
	mov rbx,  [rsp+8*112]
	mov rsi,rbx
	mov rbx,  [rsp+8*76]
	mov rdi,rbx
	mov qword [arg+8*2],rdx
	mov qword [arg+8*3],rax
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call gcd2
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov rbx , rax
	mov rax,rbx
	leave
	ret
	
gcd2:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1336
	mov rbx,rdi
	mov rdx,rsi
	mov qword [rsp+8*114],rbx
	mov rbx,  [arg+8*2]
	mov rax,rbx
	mov qword [rsp+8*115],rdx
	mov rbx,  [arg+8*3]
	mov rdx,rbx
	mov qword [rsp+8*116],rax
	mov rbx,  [arg+8*4]
	mov rax,rbx
	mov qword [rsp+8*117],rdx
	mov rbx,  [arg+8*5]
	mov rdx,rbx
	mov qword [rsp+8*118],rax
	mov rbx,  [arg+8*6]
	mov rax,rbx
	mov qword [rsp+8*119],rdx
	mov rbx,  [arg+8*7]
	mov rdx,rbx
	mov qword [rsp+8*120],rax
	mov rbx,  [arg+8*8]
	mov rax,rbx
	mov qword [rsp+8*121],rdx
	mov rbx,  [arg+8*9]
	mov rdx,rbx
	mov qword [rsp+8*122],rax
	mov rbx,  [arg+8*10]
	mov rax,rbx
	mov qword [rsp+8*123],rdx
	mov rbx,  [arg+8*11]
	mov rdx,rbx
	mov qword [rsp+8*124],rax
	mov rax,  [arg+8*12]
	mov r13,rax
	mov qword [rsp+8*125],rdx
	mov rdx,  [arg+8*13]
	mov rbx,rdx
	mov qword [rsp+8*127],rbx
	mov rbx,  [arg+8*14]
	mov rax,rbx
	mov rbx,  [arg+8*15]
	mov rdx,rbx
	mov qword [rsp+8*128],rax
	mov rax,  [arg+8*16]
	mov r11,rax
	mov rbx,  [arg+8*17]
	mov r14,rbx
	mov qword [rsp+8*129],rdx
	mov rax,  [arg+8*18]
	mov rdx,rax
	mov qword [rsp+8*132],rdx
	mov rdx,  [arg+8*19]
	mov rbx,rdx
	mov qword [rsp+8*133],rbx
	mov rbx,  [arg+8*20]
	mov rax,rbx
	mov rbx,  [arg+8*21]
	mov rdx,rbx
	mov qword [rsp+8*134],rax
	mov rbx,  [arg+8*22]
	mov rax,rbx
	mov qword [rsp+8*135],rdx
	mov rbx,  [arg+8*23]
	mov rdx,rbx
	mov qword [rsp+8*136],rax
	mov rbx,  [arg+8*24]
	mov rax,rbx
	mov qword [rsp+8*137],rdx
	mov rdx,  [arg+8*25]
	mov r15,rdx
	mov qword [rsp+8*138],rax
	mov rax,  [arg+8*26]
	mov rbx,rax
	mov qword [rsp+8*140],rbx
	mov rbx,  [arg+8*27]
	mov rdx,rbx
	mov rbx,  [arg+8*28]
	mov rax,rbx
	mov qword [rsp+8*141],rdx
	mov rdx,  [arg+8*29]
	mov r12,rdx
	mov qword [rsp+8*142],rax
	mov rax,  [arg+8*30]
	mov rbx,rax
	mov qword [rsp+8*144],rbx
	mov rbx,  [arg+8*31]
	mov rdx,rbx
	mov rax,  [rsp+8*116]
	mov rbx,  [rsp+8*117]
	mov qword [rsp+8*145],rdx
	mov rdx,rax
	add rdx,rbx
	mov rbx,  [rsp+8*118]
	add rdx,rbx
	mov rax,  [rsp+8*119]
	add rdx,rax
	mov rbx,  [rsp+8*120]
	add rdx,rbx
	mov rax,  [rsp+8*121]
	add rdx,rax
	mov rbx,  [rsp+8*122]
	add rdx,rbx
	mov rax,  [rsp+8*123]
	add rdx,rax
	mov rbx,  [rsp+8*124]
	add rdx,rbx
	mov rax,  [rsp+8*125]
	add rdx,rax
	add rdx,r13
	mov rbx,  [rsp+8*127]
	add rdx,rbx
	mov rax,  [rsp+8*128]
	add rdx,rax
	mov rbx,  [rsp+8*129]
	add rdx,rbx
	add rdx,r11
	add rdx,r14
	mov rax,  [rsp+8*132]
	add rdx,rax
	mov rbx,  [rsp+8*133]
	add rdx,rbx
	mov rax,  [rsp+8*134]
	add rdx,rax
	mov rbx,  [rsp+8*135]
	add rdx,rbx
	mov rax,  [rsp+8*136]
	add rdx,rax
	mov rbx,  [rsp+8*137]
	add rdx,rbx
	mov rax,  [rsp+8*138]
	add rdx,rax
	add rdx,r15
	mov rbx,  [rsp+8*140]
	add rdx,rbx
	mov rax,  [rsp+8*141]
	add rdx,rax
	mov rbx,  [rsp+8*142]
	add rdx,rbx
	add rdx,r12
	mov rax,  [rsp+8*144]
	add rdx,rax
	mov rbx,  [rsp+8*145]
	add rdx,rbx
	mov qword [rsp+8*146],rdx
	xor rdx, rdx
	mov rax, [rsp+8*146]
	mov rbx, 100
	cdq
	idiv rbx
	mov [rsp+8*147], rdx
	mov rdx,  [rsp+8*147]
	mov rbx,rdx
	mov qword [rsp+8*148],rbx
	xor rdx, rdx
	mov rax, [rsp+8*114]
	mov rbx, [rsp+8*115]
	cdq
	idiv rbx
	mov [rsp+8*149], rdx
	mov rbx,  [rsp+8*149]
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*150],rax
	je L_2092
	mov rbx,  [rsp+8*115]
	mov rax,rbx
	leave
	ret
	
L_2092:
	xor rdx, rdx
	mov rax, [rsp+8*114]
	mov rbx, [rsp+8*115]
	cdq
	idiv rbx
	mov [rsp+8*151], rdx
	mov rdx,  [rsp+8*145]
	mov rbx,rdx
	mov rdx,  [rsp+8*144]
	mov rax,rdx
	mov rdx,r12
	mov qword [arg+8*31],rbx
	mov qword [arg+8*30],rax
	mov rax,  [rsp+8*142]
	mov rbx,rax
	mov qword [arg+8*29],rdx
	mov rdx,  [rsp+8*141]
	mov rax,rdx
	mov qword [arg+8*28],rbx
	mov rbx,  [rsp+8*140]
	mov rdx,rbx
	mov rbx,r15
	mov qword [arg+8*27],rax
	mov qword [arg+8*26],rdx
	mov rdx,  [rsp+8*138]
	mov rax,rdx
	mov qword [arg+8*25],rbx
	mov rbx,  [rsp+8*137]
	mov rdx,rbx
	mov qword [arg+8*24],rax
	mov rax,  [rsp+8*136]
	mov rbx,rax
	mov qword [arg+8*23],rdx
	mov rdx,  [rsp+8*135]
	mov rax,rdx
	mov qword [arg+8*22],rbx
	mov rbx,  [rsp+8*134]
	mov rdx,rbx
	mov qword [arg+8*21],rax
	mov rax,  [rsp+8*133]
	mov rbx,rax
	mov qword [arg+8*20],rdx
	mov rdx,  [rsp+8*132]
	mov rax,rdx
	mov rdx,r14
	mov qword [arg+8*19],rbx
	mov rbx,r11
	mov qword [arg+8*18],rax
	mov qword [arg+8*17],rdx
	mov rdx,  [rsp+8*129]
	mov rax,rdx
	mov qword [arg+8*16],rbx
	mov rbx,  [rsp+8*128]
	mov rdx,rbx
	mov qword [arg+8*15],rax
	mov rax,  [rsp+8*127]
	mov rbx,rax
	mov rax,r13
	mov qword [arg+8*14],rdx
	mov qword [arg+8*13],rbx
	mov rbx,  [rsp+8*125]
	mov rdx,rbx
	mov qword [arg+8*12],rax
	mov rax,  [rsp+8*124]
	mov rbx,rax
	mov qword [arg+8*11],rdx
	mov rdx,  [rsp+8*123]
	mov rax,rdx
	mov qword [arg+8*10],rbx
	mov rbx,  [rsp+8*122]
	mov rdx,rbx
	mov qword [arg+8*9],rax
	mov rax,  [rsp+8*121]
	mov rbx,rax
	mov qword [arg+8*8],rdx
	mov rdx,  [rsp+8*120]
	mov rax,rdx
	mov qword [arg+8*7],rbx
	mov rbx,  [rsp+8*119]
	mov rdx,rbx
	mov qword [arg+8*6],rax
	mov rax,  [rsp+8*118]
	mov rbx,rax
	mov qword [arg+8*5],rdx
	mov rdx,  [rsp+8*117]
	mov rax,rdx
	mov qword [arg+8*4],rbx
	mov rbx,  [rsp+8*116]
	mov rdx,rbx
	mov rbx,  [rsp+8*151]
	mov rsi,rbx
	mov rbx,  [rsp+8*115]
	mov rdi,rbx
	mov qword [arg+8*2],rdx
	mov qword [arg+8*3],rax
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call gcd
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov r15 , rax
	mov rax,r15
	leave
	ret
	
main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1336
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 3320
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
	mov rdx,58
	mov rbx,rdx
	mov qword [arg+8*31],rbx
	mov rbx,56
	mov rax,rbx
	mov rdx,54
	mov rbx,rdx
	mov qword [arg+8*29],rbx
	mov rdx,52
	mov rbx,rdx
	mov qword [arg+8*28],rbx
	mov rdx,50
	mov rbx,rdx
	mov qword [arg+8*27],rbx
	mov rdx,48
	mov rbx,rdx
	mov qword [arg+8*26],rbx
	mov rdx,46
	mov rbx,rdx
	mov qword [arg+8*25],rbx
	mov rdx,44
	mov rbx,rdx
	mov qword [arg+8*24],rbx
	mov rdx,42
	mov rbx,rdx
	mov qword [arg+8*23],rbx
	mov rdx,40
	mov rbx,rdx
	mov qword [arg+8*22],rbx
	mov rdx,38
	mov rbx,rdx
	mov qword [arg+8*21],rbx
	mov rdx,36
	mov rbx,rdx
	mov qword [arg+8*20],rbx
	mov rdx,34
	mov rbx,rdx
	mov qword [arg+8*19],rbx
	mov rdx,32
	mov rbx,rdx
	mov qword [arg+8*18],rbx
	mov rdx,30
	mov rbx,rdx
	mov qword [arg+8*17],rbx
	mov rdx,28
	mov rbx,rdx
	mov qword [arg+8*16],rbx
	mov rdx,26
	mov rbx,rdx
	mov qword [arg+8*15],rbx
	mov rdx,24
	mov rbx,rdx
	mov qword [arg+8*14],rbx
	mov rdx,22
	mov rbx,rdx
	mov qword [arg+8*13],rbx
	mov rdx,20
	mov rbx,rdx
	mov qword [arg+8*12],rbx
	mov rdx,18
	mov rbx,rdx
	mov qword [arg+8*11],rbx
	mov rdx,16
	mov rbx,rdx
	mov qword [arg+8*10],rbx
	mov rdx,14
	mov rbx,rdx
	mov qword [arg+8*9],rbx
	mov rdx,12
	mov rbx,rdx
	mov qword [arg+8*8],rbx
	mov rdx,10
	mov rbx,rdx
	mov qword [arg+8*7],rbx
	mov rdx,8
	mov rbx,rdx
	mov qword [arg+8*6],rbx
	mov rdx,6
	mov rbx,rdx
	mov qword [arg+8*5],rbx
	mov rdx,4
	mov rbx,rdx
	mov qword [arg+8*4],rbx
	mov rdx,2
	mov rbx,rdx
	mov qword [arg+8*3],rbx
	mov rdx,0
	mov rbx,rdx
	mov qword [arg+8*2],rbx
	mov rbx,1
	mov rsi,rbx
	mov rbx,10
	mov rdi,rbx
	mov qword [arg+8*30],rax
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	call gcd
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov r15 , rax
	mov rbx,1024
	add r15,rbx
	mov rdi,r15
	mov r15,rdi
	mov     rdi,  r15
	call    toString
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
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1336
	mov rbx,  [rsp+8*159]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   3320
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
	

