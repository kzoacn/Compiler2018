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
	sub    rsp, 1144
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 3128
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	push r14
	push r13
	push r12
	call global_init
	pop r12
	pop r13
	pop r14
	pop r15
	mov r15 , rax
	mov r9,0
	mov r8,r9
	mov r11,40
	mov r10,r11
	mov r11,100
	mov r9,r11
	mov r11,200
	mov r15,r11
	mov qword [rsp+8*2],r8
	mov r8,125
	mov r11,r8
	mov r8,250
	mov r14,r8
	mov qword [rsp+8*3],r10
	mov r10,30
	mov r8,r10
	mov qword [rsp+8*4],r9
	mov r9,0
	mov r10,r9
	mov qword [rsp+8*6],r11
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*8],r8
	mov r8,0
	mov r11,r8
	mov qword [rsp+8*9],r10
	mov r10,0
	mov r8,r10
	mov qword [rsp+8*10],r9
	mov r9,  [rsp+8*2]
	mov r10,r9
	mov qword [rsp+8*12],r8
	mov qword [rsp+8*13],r10
	mov qword [rsp+8*11],r11
	
L_311:
	mov r8,  [rsp+8*13]
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r13, 0
	setl r13B
	cmp r13, 0
	je L_312
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov qword [rsp+8*15],r8
	
L_314:
	mov r8,  [rsp+8*15]
	cmp r8,r15
	mov r13, 0
	setl r13B
	cmp r13, 0
	je L_315
	mov r9,  [rsp+8*6]
	mov r8,r9
	mov qword [rsp+8*17],r8
	
L_317:
	mov r8,  [rsp+8*17]
	cmp r8,r14
	mov r13, 0
	setl r13B
	cmp r13, 0
	je L_318
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*8]
	mov rsi,r10
	mov r11,  [rsp+8*2]
	mov rdi,r11
	mov r11,rdi
	mov r12,rsi
	mov r13,r8
	mov r9,31
	and r13,r9
	mov r13,r13
	mov rsi,r12
	mov rdi,r11
	mov r10,rdi
	mov qword [arg+8*2],r8
	mov r8,rsi
	mov r9,1
	mov qword [rsp+8*22],r11
	mov r11,r10
	add r11,r9
	mov qword [rsp+8*28],r8
	mov r8,r11
	mov qword [rsp+8*27],r10
	mov r10,0
	mov r9,r10
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*29],r11
	
L_674:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov r8,  [rsp+8*33]
	add r8,r8
	cmp r10, 0
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*32],r10
	je L_676
	mov r8,13
	mov rsi,r8
	mov r9,  [rsp+8*30]
	mov rdi,r9
	mov r10,rdi
	mov r11,rsi
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*36],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*34],r10
	mov r10,rdi
	mov qword [rsp+8*35],r11
	mov r11,rsi
	mov r9,r10
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r8,r9
	mov qword [rsp+8*37],r10
	mov r10,r8
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r10
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r8
	mov r8,r9
	mov qword [rsp+8*41],r10
	mov r10,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov qword [rsp+8*42],r9
	mov r9,17
	mov rsi,r9
	mov rdi,r10
	mov qword [rsp+8*43],r8
	mov r8,rdi
	mov qword [rsp+8*44],r11
	mov r11,rsi
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*30],r10
	mov r10,32767
	mov rdi,r10
	mov qword [rsp+8*45],r8
	mov r8,rdi
	mov qword [rsp+8*46],r11
	mov r11,rsi
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,r8
	mov qword [rsp+8*39],r9
	mov r9,  [rsp+8*46]
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*47],r8
	mov r8,1
	add r10,r8
	mov r11,r10
	mov r9,  [rsp+8*45]
	mov r8,  [rsp+8*46]
	mov qword [rsp+8*49],r10
	mov r10,r9
	mov rcx,r8
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r8,65535
	mov rsi,r8
	mov r9,32767
	mov rdi,r9
	mov qword [rsp+8*50],r10
	mov r10,rdi
	mov qword [rsp+8*48],r11
	mov r11,rsi
	mov r8,r10
	mov rcx,16
	shl r8,cl
	or r8,r11
	mov r9,r8
	mov qword [rsp+8*37],r10
	mov r10,r9
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*48]
	mov qword [rsp+8*39],r8
	mov r8,r11
	and r8,r10
	mov qword [rsp+8*40],r9
	mov r9,r8
	mov qword [rsp+8*51],r10
	mov r10,r9
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*52],r8
	mov r8,r11
	xor r8,r10
	mov r11,r8
	mov qword [rsp+8*53],r9
	mov r9,5
	mov rsi,r9
	mov rdi,r11
	mov qword [rsp+8*54],r10
	mov r10,rdi
	mov qword [rsp+8*55],r8
	mov r8,rsi
	mov r9,r10
	mov rcx,r8
	shl r9,cl
	mov qword [rsp+8*30],r11
	mov r11,65535
	mov rsi,r11
	mov qword [rsp+8*35],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*36],r9
	mov r9,rdi
	mov qword [rsp+8*34],r10
	mov r10,rsi
	mov r11,r9
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r9
	mov qword [rsp+8*39],r11
	mov r11,r10
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*42],r11
	mov qword [rsp+8*56],r8
	mov r8,  [rsp+8*31]
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov r9,1
	add r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*58],r11
	jmp L_674
	
L_676:
	mov r8,  [rsp+8*30]
	mov r9,123456789
	mov r10,r8
	xor r10,r9
	mov r11,r10
	mov r12,r11
	mov r12,r12
	mov rsi,r13
	mov rdi,r12
	mov r8,rdi
	mov r9,rsi
	mov qword [rsp+8*59],r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*60],r11
	mov r11,65535
	mov rsi,r11
	mov qword [rsp+8*34],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*35],r9
	mov r9,rdi
	mov qword [rsp+8*36],r10
	mov r10,rsi
	mov r11,r9
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r9
	mov qword [rsp+8*39],r11
	mov r11,r10
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,32
	sub r13,r9
	neg r13
	mov rsi,r13
	mov rdi,r12
	mov qword [rsp+8*36],r10
	mov r10,rdi
	mov qword [rsp+8*63],r8
	mov r8,rsi
	mov qword [rsp+8*42],r11
	mov r11,65535
	mov rsi,r11
	mov r9,32767
	mov rdi,r9
	mov qword [rsp+8*45],r10
	mov r10,rdi
	mov qword [rsp+8*46],r8
	mov r8,rsi
	mov r11,r10
	mov rcx,16
	shl r11,cl
	or r11,r8
	mov r9,r11
	mov qword [rsp+8*37],r10
	mov r10,r9
	mov qword [rsp+8*38],r8
	mov r8,r10
	mov qword [rsp+8*39],r11
	mov r11,  [rsp+8*46]
	mov qword [rsp+8*40],r9
	mov r9,r8
	mov rcx,r11
	shr r9,cl
	mov r9,r9
	mov rcx,1
	shl r9,cl
	mov qword [rsp+8*47],r10
	mov r10,1
	add r9,r10
	mov r8,r9
	mov r11,  [rsp+8*45]
	mov r10,  [rsp+8*46]
	mov qword [rsp+8*48],r8
	mov r8,r11
	mov rcx,r10
	shr r8,cl
	mov qword [rsp+8*49],r9
	mov r9,  [rsp+8*48]
	and r8,r9
	mov r9,r8
	mov r10,65535
	mov rsi,r10
	mov r11,32767
	mov rdi,r11
	mov qword [rsp+8*50],r8
	mov r8,rdi
	mov qword [rsp+8*48],r9
	mov r9,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r9
	mov r9,  [rsp+8*48]
	mov qword [rsp+8*39],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*40],r11
	mov r11,r10
	mov r13,r11
	mov qword [rsp+8*51],r8
	mov r8,  [rsp+8*63]
	or r13,r8
	mov r13,r13
	mov r13,r13
	mov r9,r13
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*53],r11
	mov r11,  [rsp+8*17]
	mov r10,r11
	mov r8,  [rsp+8*8]
	mov rsi,r8
	mov qword [rsp+8*69],r9
	mov r9,  [rsp+8*13]
	mov rdi,r9
	mov qword [arg+8*2],r10
	mov r10,rdi
	mov r12,rsi
	mov r11,  [arg+8*2]
	mov r13,r11
	mov r8,31
	and r13,r8
	mov r13,r13
	mov rsi,r12
	mov rdi,r10
	mov r9,rdi
	mov r11,rsi
	mov r8,1
	mov qword [rsp+8*22],r10
	mov r10,r9
	add r10,r8
	mov qword [rsp+8*28],r11
	mov r11,r10
	mov qword [rsp+8*27],r9
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*29],r10
	mov qword [rsp+8*30],r11
	
L_706:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov r8,  [rsp+8*33]
	add r8,r8
	cmp r10, 0
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*32],r10
	je L_708
	mov r8,13
	mov rsi,r8
	mov r9,  [rsp+8*30]
	mov rdi,r9
	mov r10,rdi
	mov r11,rsi
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*36],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*34],r10
	mov r10,rdi
	mov qword [rsp+8*35],r11
	mov r11,rsi
	mov r9,r10
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r8,r9
	mov qword [rsp+8*37],r10
	mov r10,r8
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r10
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r8
	mov r8,r9
	mov qword [rsp+8*41],r10
	mov r10,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov qword [rsp+8*42],r9
	mov r9,17
	mov rsi,r9
	mov rdi,r10
	mov qword [rsp+8*43],r8
	mov r8,rdi
	mov qword [rsp+8*44],r11
	mov r11,rsi
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*30],r10
	mov r10,32767
	mov rdi,r10
	mov qword [rsp+8*45],r8
	mov r8,rdi
	mov qword [rsp+8*46],r11
	mov r11,rsi
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,r8
	mov qword [rsp+8*39],r9
	mov r9,  [rsp+8*46]
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*47],r8
	mov r8,1
	add r10,r8
	mov r11,r10
	mov r9,  [rsp+8*45]
	mov r8,  [rsp+8*46]
	mov qword [rsp+8*49],r10
	mov r10,r9
	mov rcx,r8
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r8,65535
	mov rsi,r8
	mov r9,32767
	mov rdi,r9
	mov qword [rsp+8*50],r10
	mov r10,rdi
	mov qword [rsp+8*48],r11
	mov r11,rsi
	mov r8,r10
	mov rcx,16
	shl r8,cl
	or r8,r11
	mov r9,r8
	mov qword [rsp+8*37],r10
	mov r10,r9
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*48]
	mov qword [rsp+8*39],r8
	mov r8,r11
	and r8,r10
	mov qword [rsp+8*40],r9
	mov r9,r8
	mov qword [rsp+8*51],r10
	mov r10,r9
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*52],r8
	mov r8,r11
	xor r8,r10
	mov r11,r8
	mov qword [rsp+8*53],r9
	mov r9,5
	mov rsi,r9
	mov rdi,r11
	mov qword [rsp+8*54],r10
	mov r10,rdi
	mov qword [rsp+8*55],r8
	mov r8,rsi
	mov r9,r10
	mov rcx,r8
	shl r9,cl
	mov qword [rsp+8*30],r11
	mov r11,65535
	mov rsi,r11
	mov qword [rsp+8*35],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*36],r9
	mov r9,rdi
	mov qword [rsp+8*34],r10
	mov r10,rsi
	mov r11,r9
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r9
	mov qword [rsp+8*39],r11
	mov r11,r10
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*42],r11
	mov qword [rsp+8*56],r8
	mov r8,  [rsp+8*31]
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov r9,1
	add r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*58],r11
	jmp L_706
	
L_708:
	mov r8,  [rsp+8*30]
	mov r9,123456789
	mov r10,r8
	xor r10,r9
	mov r11,r10
	mov r12,r11
	mov r12,r12
	mov rsi,r13
	mov rdi,r12
	mov r8,rdi
	mov r9,rsi
	mov qword [rsp+8*59],r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*60],r11
	mov r11,65535
	mov rsi,r11
	mov qword [rsp+8*34],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*35],r9
	mov r9,rdi
	mov qword [rsp+8*36],r10
	mov r10,rsi
	mov r11,r9
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r9
	mov qword [rsp+8*39],r11
	mov r11,r10
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,32
	sub r13,r9
	neg r13
	mov rsi,r13
	mov rdi,r12
	mov qword [rsp+8*36],r10
	mov r10,rdi
	mov qword [rsp+8*63],r8
	mov r8,rsi
	mov qword [rsp+8*42],r11
	mov r11,65535
	mov rsi,r11
	mov r9,32767
	mov rdi,r9
	mov qword [rsp+8*45],r10
	mov r10,rdi
	mov qword [rsp+8*46],r8
	mov r8,rsi
	mov r11,r10
	mov rcx,16
	shl r11,cl
	or r11,r8
	mov r9,r11
	mov qword [rsp+8*37],r10
	mov r10,r9
	mov qword [rsp+8*38],r8
	mov r8,r10
	mov qword [rsp+8*39],r11
	mov r11,  [rsp+8*46]
	mov qword [rsp+8*40],r9
	mov r9,r8
	mov rcx,r11
	shr r9,cl
	mov r9,r9
	mov rcx,1
	shl r9,cl
	mov qword [rsp+8*47],r10
	mov r10,1
	add r9,r10
	mov r8,r9
	mov r11,  [rsp+8*45]
	mov r10,  [rsp+8*46]
	mov qword [rsp+8*48],r8
	mov r8,r11
	mov rcx,r10
	shr r8,cl
	mov qword [rsp+8*49],r9
	mov r9,  [rsp+8*48]
	and r8,r9
	mov r9,r8
	mov r10,65535
	mov rsi,r10
	mov r11,32767
	mov rdi,r11
	mov qword [rsp+8*50],r8
	mov r8,rdi
	mov qword [rsp+8*48],r9
	mov r9,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r9
	mov r9,  [rsp+8*48]
	mov qword [rsp+8*39],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*40],r11
	mov r11,r10
	mov r13,r11
	mov qword [rsp+8*51],r8
	mov r8,  [rsp+8*63]
	or r13,r8
	mov r13,r13
	mov r13,r13
	mov r9,r13
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*53],r11
	mov r11,  [rsp+8*17]
	mov r10,r11
	mov r8,  [rsp+8*8]
	mov rsi,r8
	mov qword [rsp+8*71],r9
	mov r9,  [rsp+8*15]
	mov rdi,r9
	mov qword [arg+8*2],r10
	mov r10,rdi
	mov r12,rsi
	mov r11,  [arg+8*2]
	mov r13,r11
	mov r8,31
	and r13,r8
	mov r13,r13
	mov rsi,r12
	mov rdi,r10
	mov r9,rdi
	mov r11,rsi
	mov r8,1
	mov qword [rsp+8*22],r10
	mov r10,r9
	add r10,r8
	mov qword [rsp+8*28],r11
	mov r11,r10
	mov qword [rsp+8*27],r9
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*29],r10
	mov qword [rsp+8*30],r11
	
L_738:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov r8,  [rsp+8*33]
	add r8,r8
	cmp r10, 0
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*32],r10
	je L_740
	mov r8,13
	mov rsi,r8
	mov r9,  [rsp+8*30]
	mov rdi,r9
	mov r10,rdi
	mov r11,rsi
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*36],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*34],r10
	mov r10,rdi
	mov qword [rsp+8*35],r11
	mov r11,rsi
	mov r9,r10
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r8,r9
	mov qword [rsp+8*37],r10
	mov r10,r8
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r10
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r8
	mov r8,r9
	mov qword [rsp+8*41],r10
	mov r10,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov qword [rsp+8*42],r9
	mov r9,17
	mov rsi,r9
	mov rdi,r10
	mov qword [rsp+8*43],r8
	mov r8,rdi
	mov qword [rsp+8*44],r11
	mov r11,rsi
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*30],r10
	mov r10,32767
	mov rdi,r10
	mov qword [rsp+8*45],r8
	mov r8,rdi
	mov qword [rsp+8*46],r11
	mov r11,rsi
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,r8
	mov qword [rsp+8*39],r9
	mov r9,  [rsp+8*46]
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*47],r8
	mov r8,1
	add r10,r8
	mov r11,r10
	mov r9,  [rsp+8*45]
	mov r8,  [rsp+8*46]
	mov qword [rsp+8*49],r10
	mov r10,r9
	mov rcx,r8
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r8,65535
	mov rsi,r8
	mov r9,32767
	mov rdi,r9
	mov qword [rsp+8*50],r10
	mov r10,rdi
	mov qword [rsp+8*48],r11
	mov r11,rsi
	mov r8,r10
	mov rcx,16
	shl r8,cl
	or r8,r11
	mov r9,r8
	mov qword [rsp+8*37],r10
	mov r10,r9
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*48]
	mov qword [rsp+8*39],r8
	mov r8,r11
	and r8,r10
	mov qword [rsp+8*40],r9
	mov r9,r8
	mov qword [rsp+8*51],r10
	mov r10,r9
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*52],r8
	mov r8,r11
	xor r8,r10
	mov r11,r8
	mov qword [rsp+8*53],r9
	mov r9,5
	mov rsi,r9
	mov rdi,r11
	mov qword [rsp+8*54],r10
	mov r10,rdi
	mov qword [rsp+8*55],r8
	mov r8,rsi
	mov r9,r10
	mov rcx,r8
	shl r9,cl
	mov qword [rsp+8*30],r11
	mov r11,65535
	mov rsi,r11
	mov qword [rsp+8*35],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*36],r9
	mov r9,rdi
	mov qword [rsp+8*34],r10
	mov r10,rsi
	mov r11,r9
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r9
	mov qword [rsp+8*39],r11
	mov r11,r10
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*42],r11
	mov qword [rsp+8*56],r8
	mov r8,  [rsp+8*31]
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov r9,1
	add r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*58],r11
	jmp L_738
	
L_740:
	mov r8,  [rsp+8*30]
	mov r9,123456789
	mov r10,r8
	xor r10,r9
	mov r11,r10
	mov r12,r11
	mov r12,r12
	mov rsi,r13
	mov rdi,r12
	mov r8,rdi
	mov r9,rsi
	mov qword [rsp+8*59],r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*60],r11
	mov r11,65535
	mov rsi,r11
	mov qword [rsp+8*34],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*35],r9
	mov r9,rdi
	mov qword [rsp+8*36],r10
	mov r10,rsi
	mov r11,r9
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r9
	mov qword [rsp+8*39],r11
	mov r11,r10
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,32
	sub r13,r9
	neg r13
	mov rsi,r13
	mov rdi,r12
	mov qword [rsp+8*36],r10
	mov r10,rdi
	mov qword [rsp+8*63],r8
	mov r8,rsi
	mov qword [rsp+8*42],r11
	mov r11,65535
	mov rsi,r11
	mov r9,32767
	mov rdi,r9
	mov qword [rsp+8*45],r10
	mov r10,rdi
	mov qword [rsp+8*46],r8
	mov r8,rsi
	mov r11,r10
	mov rcx,16
	shl r11,cl
	or r11,r8
	mov r9,r11
	mov qword [rsp+8*37],r10
	mov r10,r9
	mov qword [rsp+8*38],r8
	mov r8,r10
	mov qword [rsp+8*39],r11
	mov r11,  [rsp+8*46]
	mov qword [rsp+8*40],r9
	mov r9,r8
	mov rcx,r11
	shr r9,cl
	mov r9,r9
	mov rcx,1
	shl r9,cl
	mov qword [rsp+8*47],r10
	mov r10,1
	add r9,r10
	mov r8,r9
	mov r11,  [rsp+8*45]
	mov r10,  [rsp+8*46]
	mov qword [rsp+8*48],r8
	mov r8,r11
	mov rcx,r10
	shr r8,cl
	mov qword [rsp+8*49],r9
	mov r9,  [rsp+8*48]
	and r8,r9
	mov r9,r8
	mov r10,65535
	mov rsi,r10
	mov r11,32767
	mov rdi,r11
	mov qword [rsp+8*50],r8
	mov r8,rdi
	mov qword [rsp+8*48],r9
	mov r9,rsi
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r9
	mov r9,  [rsp+8*48]
	mov qword [rsp+8*39],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*40],r11
	mov r11,r10
	mov r13,r11
	mov qword [rsp+8*51],r8
	mov r8,  [rsp+8*63]
	or r13,r8
	mov r13,r13
	mov r13,r13
	mov r9,r13
	mov qword [rsp+8*52],r10
	mov r10,  [rsp+8*13]
	mov qword [rsp+8*53],r11
	mov r11,  [rsp+8*15]
	mov r13,r10
	xor r13,r11
	mov qword [rsp+8*73],r9
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*8]
	mov rsi,r10
	mov rdi,r13
	mov r10,rdi
	mov r12,rsi
	mov r13,r8
	mov qword [arg+8*2],r8
	mov r8,31
	and r13,r8
	mov r13,r13
	mov rsi,r12
	mov rdi,r10
	mov r8,rdi
	mov qword [rsp+8*22],r10
	mov r10,rsi
	mov r11,1
	mov r9,r8
	add r9,r11
	mov qword [rsp+8*28],r10
	mov r10,r9
	mov qword [rsp+8*27],r8
	mov r11,0
	mov r8,r11
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*29],r9
	mov qword [rsp+8*30],r10
	
L_770:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov r8,  [rsp+8*33]
	add r8,r8
	cmp r10, 0
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*32],r10
	je L_772
	mov r8,13
	mov rsi,r8
	mov r9,  [rsp+8*30]
	mov rdi,r9
	mov r10,rdi
	mov r11,rsi
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*36],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*34],r10
	mov r10,rdi
	mov qword [rsp+8*35],r11
	mov r11,rsi
	mov r9,r10
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r8,r9
	mov qword [rsp+8*37],r10
	mov r10,r8
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r10
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r8
	mov r8,r9
	mov qword [rsp+8*41],r10
	mov r10,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov qword [rsp+8*42],r9
	mov r9,17
	mov rsi,r9
	mov rdi,r10
	mov qword [rsp+8*43],r8
	mov r8,rdi
	mov qword [rsp+8*44],r11
	mov r11,rsi
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*30],r10
	mov r10,32767
	mov rdi,r10
	mov qword [rsp+8*45],r8
	mov r8,rdi
	mov qword [rsp+8*46],r11
	mov r11,rsi
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,r8
	mov qword [rsp+8*39],r9
	mov r9,  [rsp+8*46]
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*47],r8
	mov r8,1
	add r10,r8
	mov r11,r10
	mov r9,  [rsp+8*45]
	mov r8,  [rsp+8*46]
	mov qword [rsp+8*49],r10
	mov r10,r9
	mov rcx,r8
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r8,65535
	mov rsi,r8
	mov r9,32767
	mov rdi,r9
	mov qword [rsp+8*50],r10
	mov r10,rdi
	mov qword [rsp+8*48],r11
	mov r11,rsi
	mov r8,r10
	mov rcx,16
	shl r8,cl
	or r8,r11
	mov r9,r8
	mov qword [rsp+8*37],r10
	mov r10,r9
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*48]
	mov qword [rsp+8*39],r8
	mov r8,r11
	and r8,r10
	mov qword [rsp+8*40],r9
	mov r9,r8
	mov qword [rsp+8*51],r10
	mov r10,r9
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*52],r8
	mov r8,r11
	xor r8,r10
	mov r11,r8
	mov qword [rsp+8*53],r9
	mov r9,5
	mov rsi,r9
	mov rdi,r11
	mov qword [rsp+8*54],r10
	mov r10,rdi
	mov qword [rsp+8*55],r8
	mov r8,rsi
	mov r9,r10
	mov rcx,r8
	shl r9,cl
	mov qword [rsp+8*30],r11
	mov r11,65535
	mov rsi,r11
	mov qword [rsp+8*35],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*36],r9
	mov r9,rdi
	mov qword [rsp+8*34],r10
	mov r10,rsi
	mov r11,r9
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r9
	mov qword [rsp+8*39],r11
	mov r11,r10
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*42],r11
	mov qword [rsp+8*56],r8
	mov r8,  [rsp+8*31]
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov r9,1
	add r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*58],r11
	jmp L_770
	
L_772:
	mov r8,  [rsp+8*30]
	mov r9,123456789
	mov r10,r8
	xor r10,r9
	mov r11,r10
	mov r12,r11
	mov r12,r12
	mov rsi,r13
	mov rdi,r12
	mov r8,rdi
	mov r9,rsi
	mov qword [rsp+8*59],r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*60],r11
	mov r11,65535
	mov rsi,r11
	mov qword [rsp+8*34],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*35],r9
	mov r9,rdi
	mov qword [rsp+8*36],r10
	mov r10,rsi
	mov r11,r9
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r9
	mov qword [rsp+8*39],r11
	mov r11,r10
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,32
	sub r13,r9
	neg r13
	mov rsi,r13
	mov rdi,r12
	mov r9,rdi
	mov qword [rsp+8*36],r10
	mov r10,rsi
	mov qword [rsp+8*63],r8
	mov r8,65535
	mov rsi,r8
	mov qword [rsp+8*42],r11
	mov r11,32767
	mov rdi,r11
	mov qword [rsp+8*45],r9
	mov r9,rdi
	mov qword [rsp+8*46],r10
	mov r10,rsi
	mov r8,r9
	mov rcx,16
	shl r8,cl
	or r8,r10
	mov r11,r8
	mov qword [rsp+8*37],r9
	mov r9,r11
	mov qword [rsp+8*38],r10
	mov r10,r9
	mov qword [rsp+8*39],r8
	mov r8,  [rsp+8*46]
	mov qword [rsp+8*40],r11
	mov r11,r10
	mov rcx,r8
	shr r11,cl
	mov r11,r11
	mov rcx,1
	shl r11,cl
	mov qword [rsp+8*47],r9
	mov r9,1
	add r11,r9
	mov r10,r11
	mov r8,  [rsp+8*45]
	mov r9,  [rsp+8*46]
	mov qword [rsp+8*48],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	mov qword [rsp+8*49],r11
	mov r11,  [rsp+8*48]
	and r10,r11
	mov r11,r10
	mov r8,65535
	mov rsi,r8
	mov r9,32767
	mov rdi,r9
	mov qword [rsp+8*50],r10
	mov r10,rdi
	mov qword [rsp+8*48],r11
	mov r11,rsi
	mov r8,r10
	mov rcx,16
	shl r8,cl
	or r8,r11
	mov r9,r8
	mov qword [rsp+8*37],r10
	mov r10,r9
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*48]
	mov qword [rsp+8*39],r8
	mov r8,r11
	and r8,r10
	mov qword [rsp+8*40],r9
	mov r9,r8
	mov r13,r9
	mov qword [rsp+8*51],r10
	mov r10,  [rsp+8*63]
	or r13,r10
	mov r13,r13
	mov r13,r13
	mov r10,r13
	mov r11,1
	mov rsi,r11
	mov r11,  [rsp+8*17]
	mov rdi,r11
	mov qword [rsp+8*52],r8
	mov r8,rdi
	mov qword [rsp+8*53],r9
	mov r9,rsi
	mov qword [rsp+8*76],r10
	mov r10,1
	mov r11,r8
	add r11,r10
	mov qword [rsp+8*28],r9
	mov r9,r11
	mov qword [rsp+8*27],r8
	mov r10,0
	mov r8,r10
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*29],r11
	
L_482:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov r8,  [rsp+8*33]
	add r8,r8
	cmp r10, 0
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*32],r10
	je L_484
	mov r8,13
	mov rsi,r8
	mov r9,  [rsp+8*30]
	mov rdi,r9
	mov r10,rdi
	mov r11,rsi
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*36],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*34],r10
	mov r10,rdi
	mov qword [rsp+8*35],r11
	mov r11,rsi
	mov r9,r10
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r8,r9
	mov qword [rsp+8*37],r10
	mov r10,r8
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r10
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r8
	mov r8,r9
	mov qword [rsp+8*41],r10
	mov r10,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov qword [rsp+8*42],r9
	mov r9,17
	mov rsi,r9
	mov rdi,r10
	mov qword [rsp+8*43],r8
	mov r8,rdi
	mov qword [rsp+8*44],r11
	mov r11,rsi
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*30],r10
	mov r10,32767
	mov rdi,r10
	mov qword [rsp+8*45],r8
	mov r8,rdi
	mov qword [rsp+8*46],r11
	mov r11,rsi
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,r8
	mov qword [rsp+8*39],r9
	mov r9,  [rsp+8*46]
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*47],r8
	mov r8,1
	add r10,r8
	mov r11,r10
	mov r9,  [rsp+8*45]
	mov r8,  [rsp+8*46]
	mov qword [rsp+8*49],r10
	mov r10,r9
	mov rcx,r8
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r8,65535
	mov rsi,r8
	mov r9,32767
	mov rdi,r9
	mov qword [rsp+8*50],r10
	mov r10,rdi
	mov qword [rsp+8*48],r11
	mov r11,rsi
	mov r8,r10
	mov rcx,16
	shl r8,cl
	or r8,r11
	mov r9,r8
	mov qword [rsp+8*37],r10
	mov r10,r9
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*48]
	mov qword [rsp+8*39],r8
	mov r8,r11
	and r8,r10
	mov qword [rsp+8*40],r9
	mov r9,r8
	mov qword [rsp+8*51],r10
	mov r10,r9
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*52],r8
	mov r8,r11
	xor r8,r10
	mov r11,r8
	mov qword [rsp+8*53],r9
	mov r9,5
	mov rsi,r9
	mov rdi,r11
	mov qword [rsp+8*54],r10
	mov r10,rdi
	mov qword [rsp+8*55],r8
	mov r8,rsi
	mov r9,r10
	mov rcx,r8
	shl r9,cl
	mov qword [rsp+8*30],r11
	mov r11,65535
	mov rsi,r11
	mov qword [rsp+8*35],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*36],r9
	mov r9,rdi
	mov qword [rsp+8*34],r10
	mov r10,rsi
	mov r11,r9
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r9
	mov qword [rsp+8*39],r11
	mov r11,r10
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*42],r11
	mov qword [rsp+8*56],r8
	mov r8,  [rsp+8*31]
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov r9,1
	add r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*58],r11
	jmp L_482
	
L_484:
	mov r8,  [rsp+8*30]
	mov r9,123456789
	mov r10,r8
	xor r10,r9
	mov r11,r10
	mov r13,r11
	mov r8,1
	mov rsi,r8
	mov r8,  [rsp+8*15]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*59],r10
	mov r10,rsi
	mov qword [rsp+8*60],r11
	mov r11,1
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*28],r10
	mov r10,r8
	mov qword [rsp+8*27],r9
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*29],r8
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*30],r10
	
L_502:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov r8,  [rsp+8*33]
	add r8,r8
	cmp r10, 0
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*32],r10
	je L_504
	mov r8,13
	mov rsi,r8
	mov r9,  [rsp+8*30]
	mov rdi,r9
	mov r10,rdi
	mov r11,rsi
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*36],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*34],r10
	mov r10,rdi
	mov qword [rsp+8*35],r11
	mov r11,rsi
	mov r9,r10
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r8,r9
	mov qword [rsp+8*37],r10
	mov r10,r8
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r10
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r8
	mov r8,r9
	mov qword [rsp+8*41],r10
	mov r10,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov qword [rsp+8*42],r9
	mov r9,17
	mov rsi,r9
	mov rdi,r10
	mov qword [rsp+8*43],r8
	mov r8,rdi
	mov qword [rsp+8*44],r11
	mov r11,rsi
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*30],r10
	mov r10,32767
	mov rdi,r10
	mov qword [rsp+8*45],r8
	mov r8,rdi
	mov qword [rsp+8*46],r11
	mov r11,rsi
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,r8
	mov qword [rsp+8*39],r9
	mov r9,  [rsp+8*46]
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*47],r8
	mov r8,1
	add r10,r8
	mov r11,r10
	mov r9,  [rsp+8*45]
	mov r8,  [rsp+8*46]
	mov qword [rsp+8*49],r10
	mov r10,r9
	mov rcx,r8
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r8,65535
	mov rsi,r8
	mov r9,32767
	mov rdi,r9
	mov qword [rsp+8*50],r10
	mov r10,rdi
	mov qword [rsp+8*48],r11
	mov r11,rsi
	mov r8,r10
	mov rcx,16
	shl r8,cl
	or r8,r11
	mov r9,r8
	mov qword [rsp+8*37],r10
	mov r10,r9
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*48]
	mov qword [rsp+8*39],r8
	mov r8,r11
	and r8,r10
	mov qword [rsp+8*40],r9
	mov r9,r8
	mov qword [rsp+8*51],r10
	mov r10,r9
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*52],r8
	mov r8,r11
	xor r8,r10
	mov r11,r8
	mov qword [rsp+8*53],r9
	mov r9,5
	mov rsi,r9
	mov rdi,r11
	mov qword [rsp+8*54],r10
	mov r10,rdi
	mov qword [rsp+8*55],r8
	mov r8,rsi
	mov r9,r10
	mov rcx,r8
	shl r9,cl
	mov qword [rsp+8*30],r11
	mov r11,65535
	mov rsi,r11
	mov qword [rsp+8*35],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*36],r9
	mov r9,rdi
	mov qword [rsp+8*34],r10
	mov r10,rsi
	mov r11,r9
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r9
	mov qword [rsp+8*39],r11
	mov r11,r10
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*42],r11
	mov qword [rsp+8*56],r8
	mov r8,  [rsp+8*31]
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov r9,1
	add r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*58],r11
	jmp L_502
	
L_504:
	mov r8,  [rsp+8*30]
	mov r9,123456789
	mov r10,r8
	xor r10,r9
	mov r11,r10
	mov r12,r11
	xor r12,r13
	mov r8,1
	mov rsi,r8
	mov r8,  [rsp+8*13]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*59],r10
	mov r10,rsi
	mov qword [rsp+8*60],r11
	mov r11,1
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*28],r10
	mov r10,r8
	mov qword [rsp+8*27],r9
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*29],r8
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*30],r10
	
L_522:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov r8,  [rsp+8*33]
	add r8,r8
	cmp r10, 0
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*32],r10
	je L_524
	mov r8,13
	mov rsi,r8
	mov r9,  [rsp+8*30]
	mov rdi,r9
	mov r10,rdi
	mov r11,rsi
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*36],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*34],r10
	mov r10,rdi
	mov qword [rsp+8*35],r11
	mov r11,rsi
	mov r9,r10
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r8,r9
	mov qword [rsp+8*37],r10
	mov r10,r8
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r10
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r8
	mov r8,r9
	mov qword [rsp+8*41],r10
	mov r10,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov qword [rsp+8*42],r9
	mov r9,17
	mov rsi,r9
	mov rdi,r10
	mov qword [rsp+8*43],r8
	mov r8,rdi
	mov qword [rsp+8*44],r11
	mov r11,rsi
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*30],r10
	mov r10,32767
	mov rdi,r10
	mov qword [rsp+8*45],r8
	mov r8,rdi
	mov qword [rsp+8*46],r11
	mov r11,rsi
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,r8
	mov qword [rsp+8*39],r9
	mov r9,  [rsp+8*46]
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*47],r8
	mov r8,1
	add r10,r8
	mov r11,r10
	mov r9,  [rsp+8*45]
	mov r8,  [rsp+8*46]
	mov qword [rsp+8*49],r10
	mov r10,r9
	mov rcx,r8
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r8,65535
	mov rsi,r8
	mov r9,32767
	mov rdi,r9
	mov qword [rsp+8*50],r10
	mov r10,rdi
	mov qword [rsp+8*48],r11
	mov r11,rsi
	mov r8,r10
	mov rcx,16
	shl r8,cl
	or r8,r11
	mov r9,r8
	mov qword [rsp+8*37],r10
	mov r10,r9
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*48]
	mov qword [rsp+8*39],r8
	mov r8,r11
	and r8,r10
	mov qword [rsp+8*40],r9
	mov r9,r8
	mov qword [rsp+8*51],r10
	mov r10,r9
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*52],r8
	mov r8,r11
	xor r8,r10
	mov r11,r8
	mov qword [rsp+8*53],r9
	mov r9,5
	mov rsi,r9
	mov rdi,r11
	mov qword [rsp+8*54],r10
	mov r10,rdi
	mov qword [rsp+8*55],r8
	mov r8,rsi
	mov r9,r10
	mov rcx,r8
	shl r9,cl
	mov qword [rsp+8*30],r11
	mov r11,65535
	mov rsi,r11
	mov qword [rsp+8*35],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*36],r9
	mov r9,rdi
	mov qword [rsp+8*34],r10
	mov r10,rsi
	mov r11,r9
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r9
	mov qword [rsp+8*39],r11
	mov r11,r10
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*42],r11
	mov qword [rsp+8*56],r8
	mov r8,  [rsp+8*31]
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov r9,1
	add r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*58],r11
	jmp L_522
	
L_524:
	mov r8,  [rsp+8*30]
	mov r9,123456789
	mov r10,r8
	xor r10,r9
	mov r11,r10
	mov r13,r11
	xor r12,r13
	mov r13,r12
	mov r8,  [rsp+8*69]
	mov r12,r8
	xor r12,r13
	mov r8,1
	mov rsi,r8
	mov rdi,r12
	mov r8,rdi
	mov r9,rsi
	mov qword [rsp+8*59],r10
	mov r10,1
	mov qword [rsp+8*60],r11
	mov r11,r8
	add r11,r10
	mov qword [rsp+8*28],r9
	mov r9,r11
	mov qword [rsp+8*27],r8
	mov r10,0
	mov r8,r10
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*29],r11
	
L_542:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov r8,  [rsp+8*33]
	add r8,r8
	cmp r10, 0
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*32],r10
	je L_544
	mov r8,13
	mov rsi,r8
	mov r9,  [rsp+8*30]
	mov rdi,r9
	mov r10,rdi
	mov r11,rsi
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*36],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*34],r10
	mov r10,rdi
	mov qword [rsp+8*35],r11
	mov r11,rsi
	mov r9,r10
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r8,r9
	mov qword [rsp+8*37],r10
	mov r10,r8
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r10
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r8
	mov r8,r9
	mov qword [rsp+8*41],r10
	mov r10,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov qword [rsp+8*42],r9
	mov r9,17
	mov rsi,r9
	mov rdi,r10
	mov qword [rsp+8*43],r8
	mov r8,rdi
	mov qword [rsp+8*44],r11
	mov r11,rsi
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*30],r10
	mov r10,32767
	mov rdi,r10
	mov qword [rsp+8*45],r8
	mov r8,rdi
	mov qword [rsp+8*46],r11
	mov r11,rsi
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,r8
	mov qword [rsp+8*39],r9
	mov r9,  [rsp+8*46]
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*47],r8
	mov r8,1
	add r10,r8
	mov r11,r10
	mov r9,  [rsp+8*45]
	mov r8,  [rsp+8*46]
	mov qword [rsp+8*49],r10
	mov r10,r9
	mov rcx,r8
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r8,65535
	mov rsi,r8
	mov r9,32767
	mov rdi,r9
	mov qword [rsp+8*50],r10
	mov r10,rdi
	mov qword [rsp+8*48],r11
	mov r11,rsi
	mov r8,r10
	mov rcx,16
	shl r8,cl
	or r8,r11
	mov r9,r8
	mov qword [rsp+8*37],r10
	mov r10,r9
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*48]
	mov qword [rsp+8*39],r8
	mov r8,r11
	and r8,r10
	mov qword [rsp+8*40],r9
	mov r9,r8
	mov qword [rsp+8*51],r10
	mov r10,r9
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*52],r8
	mov r8,r11
	xor r8,r10
	mov r11,r8
	mov qword [rsp+8*53],r9
	mov r9,5
	mov rsi,r9
	mov rdi,r11
	mov qword [rsp+8*54],r10
	mov r10,rdi
	mov qword [rsp+8*55],r8
	mov r8,rsi
	mov r9,r10
	mov rcx,r8
	shl r9,cl
	mov qword [rsp+8*30],r11
	mov r11,65535
	mov rsi,r11
	mov qword [rsp+8*35],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*36],r9
	mov r9,rdi
	mov qword [rsp+8*34],r10
	mov r10,rsi
	mov r11,r9
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r9
	mov qword [rsp+8*39],r11
	mov r11,r10
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*42],r11
	mov qword [rsp+8*56],r8
	mov r8,  [rsp+8*31]
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov r9,1
	add r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*58],r11
	jmp L_542
	
L_544:
	mov r8,  [rsp+8*30]
	mov r9,123456789
	mov r10,r8
	xor r10,r9
	mov r11,r10
	mov r12,r11
	mov r8,  [rsp+8*9]
	add r12,r8
	mov r8,r12
	mov r9,  [rsp+8*71]
	mov r12,r9
	xor r12,r13
	mov r9,1
	mov rsi,r9
	mov rdi,r12
	mov r9,rdi
	mov qword [rsp+8*59],r10
	mov r10,rsi
	mov qword [rsp+8*60],r11
	mov r11,1
	mov qword [rsp+8*9],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*28],r10
	mov r10,r8
	mov qword [rsp+8*27],r9
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*29],r8
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*30],r10
	
L_562:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov r8,  [rsp+8*33]
	add r8,r8
	cmp r10, 0
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*32],r10
	je L_564
	mov r8,13
	mov rsi,r8
	mov r9,  [rsp+8*30]
	mov rdi,r9
	mov r10,rdi
	mov r11,rsi
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*36],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*34],r10
	mov r10,rdi
	mov qword [rsp+8*35],r11
	mov r11,rsi
	mov r9,r10
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r8,r9
	mov qword [rsp+8*37],r10
	mov r10,r8
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r10
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r8
	mov r8,r9
	mov qword [rsp+8*41],r10
	mov r10,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov qword [rsp+8*42],r9
	mov r9,17
	mov rsi,r9
	mov rdi,r10
	mov qword [rsp+8*43],r8
	mov r8,rdi
	mov qword [rsp+8*44],r11
	mov r11,rsi
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*30],r10
	mov r10,32767
	mov rdi,r10
	mov qword [rsp+8*45],r8
	mov r8,rdi
	mov qword [rsp+8*46],r11
	mov r11,rsi
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,r8
	mov qword [rsp+8*39],r9
	mov r9,  [rsp+8*46]
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*47],r8
	mov r8,1
	add r10,r8
	mov r11,r10
	mov r9,  [rsp+8*45]
	mov r8,  [rsp+8*46]
	mov qword [rsp+8*49],r10
	mov r10,r9
	mov rcx,r8
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r8,65535
	mov rsi,r8
	mov r9,32767
	mov rdi,r9
	mov qword [rsp+8*50],r10
	mov r10,rdi
	mov qword [rsp+8*48],r11
	mov r11,rsi
	mov r8,r10
	mov rcx,16
	shl r8,cl
	or r8,r11
	mov r9,r8
	mov qword [rsp+8*37],r10
	mov r10,r9
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*48]
	mov qword [rsp+8*39],r8
	mov r8,r11
	and r8,r10
	mov qword [rsp+8*40],r9
	mov r9,r8
	mov qword [rsp+8*51],r10
	mov r10,r9
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*52],r8
	mov r8,r11
	xor r8,r10
	mov r11,r8
	mov qword [rsp+8*53],r9
	mov r9,5
	mov rsi,r9
	mov rdi,r11
	mov qword [rsp+8*54],r10
	mov r10,rdi
	mov qword [rsp+8*55],r8
	mov r8,rsi
	mov r9,r10
	mov rcx,r8
	shl r9,cl
	mov qword [rsp+8*30],r11
	mov r11,65535
	mov rsi,r11
	mov qword [rsp+8*35],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*36],r9
	mov r9,rdi
	mov qword [rsp+8*34],r10
	mov r10,rsi
	mov r11,r9
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r9
	mov qword [rsp+8*39],r11
	mov r11,r10
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*42],r11
	mov qword [rsp+8*56],r8
	mov r8,  [rsp+8*31]
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov r9,1
	add r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*58],r11
	jmp L_562
	
L_564:
	mov r8,  [rsp+8*30]
	mov r9,123456789
	mov r10,r8
	xor r10,r9
	mov r11,r10
	mov r12,r11
	mov r8,  [rsp+8*10]
	add r12,r8
	mov r8,r12
	mov r9,  [rsp+8*73]
	mov r12,r9
	xor r12,r13
	mov r9,1
	mov rsi,r9
	mov rdi,r12
	mov r9,rdi
	mov qword [rsp+8*59],r10
	mov r10,rsi
	mov qword [rsp+8*60],r11
	mov r11,1
	mov qword [rsp+8*10],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*28],r10
	mov r10,r8
	mov qword [rsp+8*27],r9
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*29],r8
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*30],r10
	
L_582:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov r8,  [rsp+8*33]
	add r8,r8
	cmp r10, 0
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*32],r10
	je L_584
	mov r8,13
	mov rsi,r8
	mov r9,  [rsp+8*30]
	mov rdi,r9
	mov r10,rdi
	mov r11,rsi
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*36],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*34],r10
	mov r10,rdi
	mov qword [rsp+8*35],r11
	mov r11,rsi
	mov r9,r10
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r8,r9
	mov qword [rsp+8*37],r10
	mov r10,r8
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r10
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r8
	mov r8,r9
	mov qword [rsp+8*41],r10
	mov r10,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov qword [rsp+8*42],r9
	mov r9,17
	mov rsi,r9
	mov rdi,r10
	mov qword [rsp+8*43],r8
	mov r8,rdi
	mov qword [rsp+8*44],r11
	mov r11,rsi
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*30],r10
	mov r10,32767
	mov rdi,r10
	mov qword [rsp+8*45],r8
	mov r8,rdi
	mov qword [rsp+8*46],r11
	mov r11,rsi
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,r8
	mov qword [rsp+8*39],r9
	mov r9,  [rsp+8*46]
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*47],r8
	mov r8,1
	add r10,r8
	mov r11,r10
	mov r9,  [rsp+8*45]
	mov r8,  [rsp+8*46]
	mov qword [rsp+8*49],r10
	mov r10,r9
	mov rcx,r8
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r8,65535
	mov rsi,r8
	mov r9,32767
	mov rdi,r9
	mov qword [rsp+8*50],r10
	mov r10,rdi
	mov qword [rsp+8*48],r11
	mov r11,rsi
	mov r8,r10
	mov rcx,16
	shl r8,cl
	or r8,r11
	mov r9,r8
	mov qword [rsp+8*37],r10
	mov r10,r9
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*48]
	mov qword [rsp+8*39],r8
	mov r8,r11
	and r8,r10
	mov qword [rsp+8*40],r9
	mov r9,r8
	mov qword [rsp+8*51],r10
	mov r10,r9
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*52],r8
	mov r8,r11
	xor r8,r10
	mov r11,r8
	mov qword [rsp+8*53],r9
	mov r9,5
	mov rsi,r9
	mov rdi,r11
	mov qword [rsp+8*54],r10
	mov r10,rdi
	mov qword [rsp+8*55],r8
	mov r8,rsi
	mov r9,r10
	mov rcx,r8
	shl r9,cl
	mov qword [rsp+8*30],r11
	mov r11,65535
	mov rsi,r11
	mov qword [rsp+8*35],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*36],r9
	mov r9,rdi
	mov qword [rsp+8*34],r10
	mov r10,rsi
	mov r11,r9
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r9
	mov qword [rsp+8*39],r11
	mov r11,r10
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*42],r11
	mov qword [rsp+8*56],r8
	mov r8,  [rsp+8*31]
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov r9,1
	add r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*58],r11
	jmp L_582
	
L_584:
	mov r8,  [rsp+8*30]
	mov r9,123456789
	mov r10,r8
	xor r10,r9
	mov r11,r10
	mov r12,r11
	mov r8,  [rsp+8*11]
	add r12,r8
	mov r8,r12
	mov r9,  [rsp+8*76]
	xor r13,r9
	mov r9,1
	mov rsi,r9
	mov rdi,r13
	mov r9,rdi
	mov qword [rsp+8*59],r10
	mov r10,rsi
	mov qword [rsp+8*60],r11
	mov r11,1
	mov qword [rsp+8*11],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*27],r9
	mov r9,r8
	mov r11,0
	mov r8,r11
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*28],r10
	
L_602:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov r8,  [rsp+8*33]
	add r8,r8
	cmp r10, 0
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*32],r10
	je L_604
	mov r8,13
	mov rsi,r8
	mov r9,  [rsp+8*30]
	mov rdi,r9
	mov r10,rdi
	mov r11,rsi
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov r9,65535
	mov rsi,r9
	mov qword [rsp+8*36],r8
	mov r8,32767
	mov rdi,r8
	mov qword [rsp+8*34],r10
	mov r10,rdi
	mov qword [rsp+8*35],r11
	mov r11,rsi
	mov r9,r10
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r8,r9
	mov qword [rsp+8*37],r10
	mov r10,r8
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r10
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r8
	mov r8,r9
	mov qword [rsp+8*41],r10
	mov r10,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov qword [rsp+8*43],r8
	mov r8,17
	mov rsi,r8
	mov rdi,r10
	mov r8,rdi
	mov r11,rsi
	mov qword [rsp+8*42],r9
	mov r9,65535
	mov rsi,r9
	mov r9,32767
	mov rdi,r9
	mov r9,rdi
	mov qword [rsp+8*30],r10
	mov r10,rsi
	mov qword [rsp+8*45],r8
	mov r8,r9
	mov rcx,16
	shl r8,cl
	or r8,r10
	mov qword [rsp+8*46],r11
	mov r11,r8
	mov qword [rsp+8*37],r9
	mov r9,r11
	mov qword [rsp+8*38],r10
	mov r10,r9
	mov qword [rsp+8*47],r9
	mov r9,  [rsp+8*46]
	mov qword [rsp+8*39],r8
	mov r8,r10
	mov rcx,r9
	shr r8,cl
	mov r8,r8
	mov rcx,1
	shl r8,cl
	mov qword [rsp+8*40],r11
	mov r11,1
	add r8,r11
	mov r10,r8
	mov r8,  [rsp+8*45]
	mov r11,r8
	mov rcx,r9
	shr r11,cl
	and r11,r10
	mov r10,r11
	mov r8,65535
	mov rsi,r8
	mov r8,32767
	mov rdi,r8
	mov r8,rdi
	mov r9,rsi
	mov r11,r8
	mov rcx,16
	shl r11,cl
	or r11,r9
	mov qword [rsp+8*48],r10
	mov r10,r11
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r9
	mov r9,  [rsp+8*48]
	mov qword [rsp+8*39],r11
	mov r11,r9
	and r11,r8
	mov qword [rsp+8*51],r8
	mov r8,r11
	mov r9,r8
	mov qword [rsp+8*53],r8
	mov r8,  [rsp+8*30]
	mov r11,r8
	xor r11,r9
	mov r8,r11
	mov qword [rsp+8*54],r9
	mov r9,5
	mov rsi,r9
	mov rdi,r8
	mov r9,rdi
	mov r11,rsi
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov rcx,r11
	shl r10,cl
	mov qword [rsp+8*34],r9
	mov r9,65535
	mov rsi,r9
	mov r9,32767
	mov rdi,r9
	mov r9,rdi
	mov qword [rsp+8*35],r11
	mov r11,rsi
	mov qword [rsp+8*30],r8
	mov r8,r9
	mov rcx,16
	shl r8,cl
	or r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov r8,r9
	and r10,r8
	mov qword [rsp+8*41],r8
	mov r8,r10
	mov qword [rsp+8*40],r9
	mov r9,r8
	mov qword [rsp+8*42],r8
	mov r8,  [rsp+8*30]
	mov r10,r8
	xor r10,r9
	mov r8,r10
	mov qword [rsp+8*56],r9
	mov r10,  [rsp+8*31]
	mov r9,r10
	mov qword [rsp+8*58],r9
	mov r9,1
	add r10,r9
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*31],r10
	mov qword [rsp+8*38],r11
	jmp L_602
	
L_604:
	mov r8,  [rsp+8*30]
	mov r9,123456789
	mov r10,r8
	xor r10,r9
	mov r11,r10
	mov r13,r11
	mov r8,  [rsp+8*12]
	add r13,r8
	mov r8,r13
	mov r9,  [rsp+8*17]
	mov r13,r9
	mov r10,1
	add r9,r10
	mov qword [rsp+8*12],r8
	mov qword [rsp+8*17],r9
	mov qword [rsp+8*60],r11
	jmp L_317
	
L_318:
	mov r8,  [rsp+8*15]
	mov r13,r8
	mov r9,1
	add r8,r9
	mov qword [rsp+8*15],r8
	jmp L_314
	
L_315:
	mov r8,  [rsp+8*13]
	mov r13,r8
	mov r9,1
	add r8,r9
	mov qword [rsp+8*13],r8
	jmp L_311
	
L_312:
	mov r8,  [rsp+8*9]
	mov rdi,r8
	mov r12,rdi
	mov r9,t127
	mov r13,r9
	mov r10,28
	mov r15,r10
	
L_394:
	mov r8,0
	cmp r15,r8
	mov r14, 0
	setge r14B
	cmp r14, 0
	je L_395
	mov r14,r12
	mov rcx,r15
	shr r14,cl
	mov r8,15
	and r14,r8
	mov r14,r14
	mov r9,10
	cmp r14,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*103],r10
	je L_396
	mov r8,48
	add r14,r8
	mov rdi,r14
	mov r14,rdi
	mov r9,32
	cmp r14,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*106],r10
	jne L_397
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_398
	
L_397:
	mov r8,126
	cmp r14,r8
	mov r9, 0
	setle r9B
	mov r10,r9
	mov qword [rsp+8*107],r9
	mov qword [rsp+8*106],r10
	
L_398:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_399
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,32
	mov r11,r14
	sub r11,r10
	mov qword [rsp+8*109],r8
	mov r8,32
	mov r9,r14
	sub r9,r8
	mov rsi,r9
	mov rdi,r11
	mov r8,  [rsp+8*109]
	mov r10,r8
	mov qword [rsp+8*111],r9
	mov qword [arg+8*63],r10
	mov qword [rsp+8*110],r11
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r14,r8
	jmp L_401
	
L_399:
	mov r8,t125
	mov r14,r8
	
L_401:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	call    concat
	mov  r14, rax
	mov r13,r14
	jmp L_402
	
L_396:
	mov r8,65
	add r14,r8
	mov r9,10
	sub r14,r9
	mov rdi,r14
	mov r14,rdi
	mov r10,32
	cmp r14,r10
	mov r11, 0
	setge r11B
	cmp r11, 0
	mov qword [rsp+8*106],r11
	jne L_403
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_404
	
L_403:
	mov r8,126
	cmp r14,r8
	mov r9, 0
	setle r9B
	mov r10,r9
	mov qword [rsp+8*107],r9
	mov qword [rsp+8*106],r10
	
L_404:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_405
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,32
	mov r11,r14
	sub r11,r10
	mov qword [rsp+8*109],r8
	mov r8,32
	mov r9,r14
	sub r9,r8
	mov rsi,r9
	mov rdi,r11
	mov r8,  [rsp+8*109]
	mov r10,r8
	mov qword [rsp+8*111],r9
	mov qword [arg+8*63],r10
	mov qword [rsp+8*110],r11
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r14,r8
	jmp L_407
	
L_405:
	mov r8,t125
	mov r14,r8
	
L_407:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	call    concat
	mov  r14, rax
	mov r13,r14
	
L_402:
	mov r8,4
	sub r15,r8
	mov r15,r15
	jmp L_394
	
L_395:
	mov r15,r13
	mov r15,r15
	mov     rsi, t222
	mov     rdi,  r15
	call    concat
	mov  r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, format
	mov rsi, r15 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8,  [rsp+8*10]
	mov rdi,r8
	mov r12,rdi
	mov r9,t127
	mov r13,r9
	mov r10,28
	mov r15,r10
	
L_411:
	mov r8,0
	cmp r15,r8
	mov r14, 0
	setge r14B
	cmp r14, 0
	je L_412
	mov r14,r12
	mov rcx,r15
	shr r14,cl
	mov r8,15
	and r14,r8
	mov r14,r14
	mov r9,10
	cmp r14,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*103],r10
	je L_413
	mov r8,48
	add r14,r8
	mov rdi,r14
	mov r14,rdi
	mov r9,32
	cmp r14,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*106],r10
	jne L_414
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_415
	
L_414:
	mov r8,126
	cmp r14,r8
	mov r9, 0
	setle r9B
	mov r10,r9
	mov qword [rsp+8*107],r9
	mov qword [rsp+8*106],r10
	
L_415:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_416
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,32
	mov r11,r14
	sub r11,r10
	mov qword [rsp+8*109],r8
	mov r8,32
	mov r9,r14
	sub r9,r8
	mov rsi,r9
	mov rdi,r11
	mov r8,  [rsp+8*109]
	mov r10,r8
	mov qword [rsp+8*111],r9
	mov qword [arg+8*63],r10
	mov qword [rsp+8*110],r11
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r14,r8
	jmp L_418
	
L_416:
	mov r8,t125
	mov r14,r8
	
L_418:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	call    concat
	mov  r14, rax
	mov r13,r14
	jmp L_419
	
L_413:
	mov r8,65
	add r14,r8
	mov r9,10
	sub r14,r9
	mov rdi,r14
	mov r14,rdi
	mov r10,32
	cmp r14,r10
	mov r11, 0
	setge r11B
	cmp r11, 0
	mov qword [rsp+8*106],r11
	jne L_420
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_421
	
L_420:
	mov r8,126
	cmp r14,r8
	mov r9, 0
	setle r9B
	mov r10,r9
	mov qword [rsp+8*107],r9
	mov qword [rsp+8*106],r10
	
L_421:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_422
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,32
	mov r11,r14
	sub r11,r10
	mov qword [rsp+8*109],r8
	mov r8,32
	mov r9,r14
	sub r9,r8
	mov rsi,r9
	mov rdi,r11
	mov r8,  [rsp+8*109]
	mov r10,r8
	mov qword [rsp+8*111],r9
	mov qword [arg+8*63],r10
	mov qword [rsp+8*110],r11
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r14,r8
	jmp L_424
	
L_422:
	mov r8,t125
	mov r14,r8
	
L_424:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	call    concat
	mov  r14, rax
	mov r13,r14
	
L_419:
	mov r8,4
	sub r15,r8
	mov r15,r15
	jmp L_411
	
L_412:
	mov r15,r13
	mov r15,r15
	mov     rsi, t229
	mov     rdi,  r15
	call    concat
	mov  r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, format
	mov rsi, r15 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8,  [rsp+8*11]
	mov rdi,r8
	mov r12,rdi
	mov r9,t127
	mov r13,r9
	mov r10,28
	mov r15,r10
	
L_428:
	mov r8,0
	cmp r15,r8
	mov r14, 0
	setge r14B
	cmp r14, 0
	je L_429
	mov r14,r12
	mov rcx,r15
	shr r14,cl
	mov r8,15
	and r14,r8
	mov r14,r14
	mov r9,10
	cmp r14,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*103],r10
	je L_430
	mov r8,48
	add r14,r8
	mov rdi,r14
	mov r14,rdi
	mov r9,32
	cmp r14,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*106],r10
	jne L_431
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_432
	
L_431:
	mov r8,126
	cmp r14,r8
	mov r9, 0
	setle r9B
	mov r10,r9
	mov qword [rsp+8*107],r9
	mov qword [rsp+8*106],r10
	
L_432:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_433
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,32
	mov r11,r14
	sub r11,r10
	mov qword [rsp+8*109],r8
	mov r8,32
	mov r9,r14
	sub r9,r8
	mov rsi,r9
	mov rdi,r11
	mov r8,  [rsp+8*109]
	mov r10,r8
	mov qword [rsp+8*111],r9
	mov qword [arg+8*63],r10
	mov qword [rsp+8*110],r11
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r14,r8
	jmp L_435
	
L_433:
	mov r8,t125
	mov r14,r8
	
L_435:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	call    concat
	mov  r14, rax
	mov r13,r14
	jmp L_436
	
L_430:
	mov r8,65
	add r14,r8
	mov r9,10
	sub r14,r9
	mov rdi,r14
	mov r14,rdi
	mov r10,32
	cmp r14,r10
	mov r11, 0
	setge r11B
	cmp r11, 0
	mov qword [rsp+8*106],r11
	jne L_437
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_438
	
L_437:
	mov r8,126
	cmp r14,r8
	mov r9, 0
	setle r9B
	mov r10,r9
	mov qword [rsp+8*107],r9
	mov qword [rsp+8*106],r10
	
L_438:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_439
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,32
	mov r11,r14
	sub r11,r10
	mov qword [rsp+8*109],r8
	mov r8,32
	mov r9,r14
	sub r9,r8
	mov rsi,r9
	mov rdi,r11
	mov r8,  [rsp+8*109]
	mov r10,r8
	mov qword [rsp+8*111],r9
	mov qword [arg+8*63],r10
	mov qword [rsp+8*110],r11
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r14,r8
	jmp L_441
	
L_439:
	mov r8,t125
	mov r14,r8
	
L_441:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	call    concat
	mov  r14, rax
	mov r13,r14
	
L_436:
	mov r8,4
	sub r15,r8
	mov r15,r15
	jmp L_428
	
L_429:
	mov r15,r13
	mov r15,r15
	mov     rsi, t236
	mov     rdi,  r15
	call    concat
	mov  r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, format
	mov rsi, r15 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8,  [rsp+8*12]
	mov rdi,r8
	mov r12,rdi
	mov r9,t127
	mov r13,r9
	mov r10,28
	mov r15,r10
	
L_445:
	mov r8,0
	cmp r15,r8
	mov r14, 0
	setge r14B
	cmp r14, 0
	je L_446
	mov r14,r12
	mov rcx,r15
	shr r14,cl
	mov r8,15
	and r14,r8
	mov r14,r14
	mov r9,10
	cmp r14,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*103],r10
	je L_447
	mov r8,48
	add r14,r8
	mov rdi,r14
	mov r14,rdi
	mov r9,32
	cmp r14,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*106],r10
	jne L_448
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_449
	
L_448:
	mov r8,126
	cmp r14,r8
	mov r9, 0
	setle r9B
	mov r10,r9
	mov qword [rsp+8*107],r9
	mov qword [rsp+8*106],r10
	
L_449:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_450
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,32
	mov r11,r14
	sub r11,r10
	mov qword [rsp+8*109],r8
	mov r8,32
	mov r9,r14
	sub r9,r8
	mov rsi,r9
	mov rdi,r11
	mov r8,  [rsp+8*109]
	mov r10,r8
	mov qword [rsp+8*111],r9
	mov qword [arg+8*63],r10
	mov qword [rsp+8*110],r11
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r14,r8
	jmp L_452
	
L_450:
	mov r8,t125
	mov r14,r8
	
L_452:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	call    concat
	mov  r14, rax
	mov r13,r14
	jmp L_453
	
L_447:
	mov r8,65
	add r14,r8
	mov r9,10
	sub r14,r9
	mov rdi,r14
	mov r14,rdi
	mov r10,32
	cmp r14,r10
	mov r11, 0
	setge r11B
	cmp r11, 0
	mov qword [rsp+8*106],r11
	jne L_454
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_455
	
L_454:
	mov r8,126
	cmp r14,r8
	mov r9, 0
	setle r9B
	mov r10,r9
	mov qword [rsp+8*107],r9
	mov qword [rsp+8*106],r10
	
L_455:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_456
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,32
	mov r11,r14
	sub r11,r10
	mov r10,32
	mov qword [rsp+8*109],r8
	mov r8,r14
	sub r8,r10
	mov rsi,r8
	mov rdi,r11
	mov r10,  [rsp+8*109]
	mov r8,r10
	mov qword [arg+8*63],r8
	mov qword [rsp+8*110],r11
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r14,r8
	jmp L_458
	
L_456:
	mov r8,t125
	mov r14,r8
	
L_458:
	mov r14,r14
	mov     rsi,  r14
	mov     rdi,  r13
	call    concat
	mov  r14, rax
	mov r13,r14
	
L_453:
	mov r8,4
	sub r15,r8
	mov r15,r15
	jmp L_445
	
L_446:
	mov r15,r13
	mov r15,r15
	mov     rsi, t243
	mov     rdi,  r15
	call    concat
	mov  r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, format
	mov rsi, r15 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8,t248
	mov rdi,r8
	mov r15,rdi
	mov rdi, r15 
	add rdi, 1 
	call puts
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1144
	mov r9,t109
	mov r8,r9
	mov qword [gbl+8*108],r8
	mov r8,  [rsp+8*135]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   3128
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
	
t229:
	 db 1," " ,0

t109:
	 db 95," !",34,"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[",92,"]^_`abcdefghijklmnopqrstuvwxyz{|}~" ,0

t236:
	 db 1," " ,0

t125:
	 db 0,"" ,0

t127:
	 db 0,"" ,0

t248:
	 db 0,"" ,0

t243:
	 db 1," " ,0

t222:
	 db 1," " ,0


