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
	mov r10,40
	mov r13,r10
	mov r9,100
	mov r11,r9
	mov r10,200
	mov r9,r10
	mov qword [rsp+8*2],r8
	mov r8,125
	mov r10,r8
	mov qword [rsp+8*4],r11
	mov r11,250
	mov r8,r11
	mov r11,30
	mov r14,r11
	mov qword [rsp+8*5],r9
	mov r9,0
	mov r11,r9
	mov qword [rsp+8*6],r10
	mov r10,0
	mov r9,r10
	mov qword [rsp+8*7],r8
	mov r8,0
	mov r10,r8
	mov qword [rsp+8*9],r11
	mov r11,0
	mov r8,r11
	mov qword [rsp+8*10],r9
	mov r9,  [rsp+8*2]
	mov r11,r9
	mov qword [rsp+8*12],r8
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*13],r11
	
L_12:
	mov r8,  [rsp+8*13]
	cmp r8,r13
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_13
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov qword [rsp+8*15],r8
	
L_15:
	mov r8,  [rsp+8*15]
	mov r9,  [rsp+8*5]
	cmp r8,r9
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_16
	mov r9,  [rsp+8*6]
	mov r8,r9
	mov qword [rsp+8*17],r8
	
L_18:
	mov r8,  [rsp+8*17]
	mov r9,  [rsp+8*7]
	cmp r8,r9
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_19
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,r14
	mov qword [arg+8*2],r8
	mov r8,  [rsp+8*2]
	mov r11,r8
	mov r8,r11
	mov r9,r10
	mov qword [rsp+8*22],r8
	mov qword rdi,r11
	mov r11,  [arg+8*2]
	mov r8,r11
	mov qword [rsp+8*23],r9
	mov r9,31
	mov r15,r8
	and r15,r9
	mov qword rsi,r10
	mov r10,r15
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*23]
	mov r11,r8
	mov qword [rsp+8*26],r10
	mov r10,  [rsp+8*22]
	mov r9,r10
	mov r8,r9
	mov r15,r11
	mov r10,1
	mov qword rdi,r9
	mov r9,r8
	add r9,r10
	mov qword rsi,r11
	mov r11,r9
	mov qword [rsp+8*27],r8
	mov r10,0
	mov r8,r10
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*29],r9
	mov qword [rsp+8*30],r11
	
L_375:
	mov r8,10
	mov r9,r15
	imul r9,r8
	mov r10,  [rsp+8*31]
	cmp r10,r9
	mov r9, 0
	setl r9B
	mov r11,  [rsp+8*33]
	add r11,r11
	cmp r9, 0
	mov qword [rsp+8*32],r9
	mov qword [rsp+8*33],r11
	je L_377
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*35],r9
	mov qword [rsp+8*36],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r8
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*43],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*30]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*45],r9
	mov qword [rsp+8*46],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
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
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*47],r8
	mov r8,  [rsp+8*45]
	mov qword [rsp+8*49],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*48],r11
	mov r11,32767
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
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
	mov qword [rsp+8*51],r8
	mov r8,r11
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*52],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*53],r11
	mov qword [rsp+8*54],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*55],r10
	mov r10,  [rsp+8*30]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*36],r9
	mov qword [rsp+8*35],r11
	mov r11,32767
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r8
	mov qword [rsp+8*39],r9
	mov r9,r10
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*56],r11
	mov r11,  [rsp+8*31]
	mov r9,r11
	inc r11 
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*31],r11
	jmp L_375
	
L_377:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r15,r9
	mov r10,r15
	mov r8,  [rsp+8*26]
	mov r11,r8
	mov qword [rsp+8*59],r9
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov qword [rsp+8*62],r10
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*36],r9
	mov qword [rsp+8*35],r11
	mov r11,32767
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r8
	mov qword [rsp+8*39],r9
	mov r9,r10
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov qword [rsp+8*41],r8
	mov r8,32
	mov qword [rsp+8*36],r10
	mov r10,  [rsp+8*26]
	mov r15,r8
	sub r15,r10
	mov qword [rsp+8*42],r9
	mov r9,r15
	mov qword [rsp+8*63],r11
	mov r8,  [rsp+8*62]
	mov r11,r8
	mov r10,r11
	mov qword rsi,r9
	mov r8,  rsi
	mov r9,r8
	mov qword [rsp+8*45],r10
	mov r10,65535
	mov r8,r10
	mov qword [rsp+8*46],r9
	mov r9,32767
	mov r11,r9
	mov qword rsi,r8
	mov r8,r11
	mov r9,  rsi
	mov r10,r9
	mov qword rdi,r11
	mov r11,r8
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r9,r11
	mov qword [rsp+8*37],r8
	mov r8,r9
	mov qword [rsp+8*38],r10
	mov r10,r8
	mov qword [rsp+8*39],r11
	mov r11,  [rsp+8*46]
	mov qword [rsp+8*40],r9
	mov r9,r10
	mov rcx,r11
	shr r9,cl
	mov rcx,1
	shl r9,cl
	inc r9 
	mov r10,r9
	mov qword [rsp+8*47],r8
	mov r8,  [rsp+8*45]
	mov qword [rsp+8*49],r9
	mov r9,r8
	mov rcx,r11
	shr r9,cl
	and r9,r10
	mov r10,r9
	mov r11,65535
	mov r8,r11
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*48],r10
	mov r10,32767
	mov r9,r10
	mov qword rsi,r8
	mov r8,r9
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*48]
	mov qword [rsp+8*39],r9
	mov r9,r11
	and r9,r8
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*51],r8
	mov r8,r10
	mov r11,  [rsp+8*63]
	mov r15,r11
	or r15,r8
	mov qword [rsp+8*52],r9
	mov r9,r15
	mov qword [rsp+8*53],r10
	mov qword [rsp+8*65],r8
	mov r8,  [rsp+8*17]
	mov r10,r8
	mov r11,r14
	mov qword [rsp+8*69],r9
	mov r8,  [rsp+8*13]
	mov r9,r8
	mov qword [arg+8*2],r10
	mov r10,r9
	mov qword rsi,r11
	mov r8,  rsi
	mov r11,r8
	mov qword rdi,r9
	mov qword [rsp+8*22],r10
	mov r10,  [arg+8*2]
	mov r9,r10
	mov r8,31
	mov r15,r9
	and r15,r8
	mov qword [rsp+8*23],r11
	mov r11,r15
	mov r8,  [rsp+8*23]
	mov r10,r8
	mov qword [rsp+8*24],r9
	mov qword [rsp+8*26],r11
	mov r11,  [rsp+8*22]
	mov r9,r11
	mov r8,r9
	mov r15,r10
	mov r11,1
	mov qword rdi,r9
	mov r9,r8
	add r9,r11
	mov qword rsi,r10
	mov r10,r9
	mov qword [rsp+8*27],r8
	mov r11,0
	mov r8,r11
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*29],r9
	mov qword [rsp+8*30],r10
	
L_407:
	mov r8,10
	mov r9,r15
	imul r9,r8
	mov r10,  [rsp+8*31]
	cmp r10,r9
	mov r9, 0
	setl r9B
	mov r11,  [rsp+8*33]
	add r11,r11
	cmp r9, 0
	mov qword [rsp+8*32],r9
	mov qword [rsp+8*33],r11
	je L_409
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*35],r9
	mov qword [rsp+8*36],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r8
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*43],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*30]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*45],r9
	mov qword [rsp+8*46],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
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
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*47],r8
	mov r8,  [rsp+8*45]
	mov qword [rsp+8*49],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*48],r11
	mov r11,32767
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
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
	mov qword [rsp+8*51],r8
	mov r8,r11
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*52],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*53],r11
	mov qword [rsp+8*54],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*55],r10
	mov r10,  [rsp+8*30]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*36],r9
	mov qword [rsp+8*35],r11
	mov r11,32767
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r8
	mov qword [rsp+8*39],r9
	mov r9,r10
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*56],r11
	mov r11,  [rsp+8*31]
	mov r9,r11
	inc r11 
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*31],r11
	jmp L_407
	
L_409:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r15,r9
	mov r10,r15
	mov r8,  [rsp+8*26]
	mov r11,r8
	mov qword [rsp+8*59],r9
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov qword [rsp+8*62],r10
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*36],r9
	mov qword [rsp+8*35],r11
	mov r11,32767
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r8
	mov qword [rsp+8*39],r9
	mov r9,r10
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov qword [rsp+8*41],r8
	mov r8,32
	mov qword [rsp+8*36],r10
	mov r10,  [rsp+8*26]
	mov r15,r8
	sub r15,r10
	mov qword [rsp+8*42],r9
	mov r9,r15
	mov qword [rsp+8*63],r11
	mov r8,  [rsp+8*62]
	mov r11,r8
	mov r10,r11
	mov qword rsi,r9
	mov r8,  rsi
	mov r9,r8
	mov qword [rsp+8*45],r10
	mov r10,65535
	mov r8,r10
	mov qword [rsp+8*46],r9
	mov r9,32767
	mov r11,r9
	mov qword rsi,r8
	mov r8,r11
	mov r9,  rsi
	mov r10,r9
	mov qword rdi,r11
	mov r11,r8
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r9,r11
	mov qword [rsp+8*37],r8
	mov r8,r9
	mov qword [rsp+8*38],r10
	mov r10,r8
	mov qword [rsp+8*39],r11
	mov r11,  [rsp+8*46]
	mov qword [rsp+8*40],r9
	mov r9,r10
	mov rcx,r11
	shr r9,cl
	mov rcx,1
	shl r9,cl
	inc r9 
	mov r10,r9
	mov qword [rsp+8*47],r8
	mov r8,  [rsp+8*45]
	mov qword [rsp+8*49],r9
	mov r9,r8
	mov rcx,r11
	shr r9,cl
	and r9,r10
	mov r10,r9
	mov r11,65535
	mov r8,r11
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*48],r10
	mov r10,32767
	mov r9,r10
	mov qword rsi,r8
	mov r8,r9
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*48]
	mov qword [rsp+8*39],r9
	mov r9,r11
	and r9,r8
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*51],r8
	mov r8,r10
	mov r11,  [rsp+8*63]
	mov r15,r11
	or r15,r8
	mov qword [rsp+8*52],r9
	mov r9,r15
	mov qword [rsp+8*53],r10
	mov qword [rsp+8*65],r8
	mov r8,  [rsp+8*17]
	mov r10,r8
	mov r11,r14
	mov qword [rsp+8*71],r9
	mov r8,  [rsp+8*15]
	mov r9,r8
	mov qword [arg+8*2],r10
	mov r10,r9
	mov qword rsi,r11
	mov r8,  rsi
	mov r11,r8
	mov qword rdi,r9
	mov qword [rsp+8*22],r10
	mov r10,  [arg+8*2]
	mov r9,r10
	mov r8,31
	mov r15,r9
	and r15,r8
	mov qword [rsp+8*23],r11
	mov r11,r15
	mov r8,  [rsp+8*23]
	mov r10,r8
	mov qword [rsp+8*24],r9
	mov qword [rsp+8*26],r11
	mov r11,  [rsp+8*22]
	mov r9,r11
	mov r8,r9
	mov r15,r10
	mov r11,1
	mov qword rdi,r9
	mov r9,r8
	add r9,r11
	mov qword rsi,r10
	mov r10,r9
	mov qword [rsp+8*27],r8
	mov r11,0
	mov r8,r11
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*29],r9
	mov qword [rsp+8*30],r10
	
L_439:
	mov r8,10
	mov r9,r15
	imul r9,r8
	mov r10,  [rsp+8*31]
	cmp r10,r9
	mov r9, 0
	setl r9B
	mov r11,  [rsp+8*33]
	add r11,r11
	cmp r9, 0
	mov qword [rsp+8*32],r9
	mov qword [rsp+8*33],r11
	je L_441
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*35],r9
	mov qword [rsp+8*36],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r8
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*43],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*30]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*45],r9
	mov qword [rsp+8*46],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
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
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*47],r8
	mov r8,  [rsp+8*45]
	mov qword [rsp+8*49],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*48],r11
	mov r11,32767
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
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
	mov qword [rsp+8*51],r8
	mov r8,r11
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*52],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*53],r11
	mov qword [rsp+8*54],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*55],r10
	mov r10,  [rsp+8*30]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*36],r9
	mov qword [rsp+8*35],r11
	mov r11,32767
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r8
	mov qword [rsp+8*39],r9
	mov r9,r10
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*56],r11
	mov r11,  [rsp+8*31]
	mov r9,r11
	inc r11 
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*31],r11
	jmp L_439
	
L_441:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r15,r9
	mov r10,r15
	mov r8,  [rsp+8*26]
	mov r11,r8
	mov qword [rsp+8*59],r9
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov qword [rsp+8*62],r10
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*36],r9
	mov qword [rsp+8*35],r11
	mov r11,32767
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r8
	mov qword [rsp+8*39],r9
	mov r9,r10
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov qword [rsp+8*41],r8
	mov r8,32
	mov qword [rsp+8*36],r10
	mov r10,  [rsp+8*26]
	mov r15,r8
	sub r15,r10
	mov qword [rsp+8*42],r9
	mov r9,r15
	mov qword [rsp+8*63],r11
	mov r8,  [rsp+8*62]
	mov r11,r8
	mov r10,r11
	mov qword rsi,r9
	mov r8,  rsi
	mov r9,r8
	mov qword [rsp+8*45],r10
	mov r10,65535
	mov r8,r10
	mov qword [rsp+8*46],r9
	mov r9,32767
	mov r11,r9
	mov qword rsi,r8
	mov r8,r11
	mov r9,  rsi
	mov r10,r9
	mov qword rdi,r11
	mov r11,r8
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov r9,r11
	mov qword [rsp+8*37],r8
	mov r8,r9
	mov qword [rsp+8*38],r10
	mov r10,r8
	mov qword [rsp+8*39],r11
	mov r11,  [rsp+8*46]
	mov qword [rsp+8*40],r9
	mov r9,r10
	mov rcx,r11
	shr r9,cl
	mov rcx,1
	shl r9,cl
	inc r9 
	mov r10,r9
	mov qword [rsp+8*47],r8
	mov r8,  [rsp+8*45]
	mov qword [rsp+8*49],r9
	mov r9,r8
	mov rcx,r11
	shr r9,cl
	and r9,r10
	mov r10,r9
	mov r11,65535
	mov r8,r11
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*48],r10
	mov r10,32767
	mov r9,r10
	mov qword rsi,r8
	mov r8,r9
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*48]
	mov qword [rsp+8*39],r9
	mov r9,r11
	and r9,r8
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*51],r8
	mov r8,r10
	mov r11,  [rsp+8*63]
	mov r15,r11
	or r15,r8
	mov qword [rsp+8*52],r9
	mov r9,r15
	mov qword [rsp+8*53],r10
	mov r10,  [rsp+8*13]
	mov qword [rsp+8*65],r8
	mov r8,  [rsp+8*15]
	mov r15,r10
	xor r15,r8
	mov qword [rsp+8*73],r9
	mov r9,  [rsp+8*17]
	mov r11,r9
	mov r8,r14
	mov r10,r15
	mov r9,r10
	mov qword [arg+8*2],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov qword rdi,r10
	mov r10,  [arg+8*2]
	mov r9,r10
	mov r10,31
	mov r15,r9
	and r15,r10
	mov qword [rsp+8*24],r9
	mov r9,r15
	mov r8,r11
	mov qword [rsp+8*23],r11
	mov r11,  [rsp+8*22]
	mov r10,r11
	mov r11,r10
	mov r15,r8
	mov qword [rsp+8*26],r9
	mov r9,1
	mov qword rdi,r10
	mov r10,r11
	add r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*27],r11
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*29],r10
	
L_471:
	mov r8,10
	mov r9,r15
	imul r9,r8
	mov r10,  [rsp+8*31]
	cmp r10,r9
	mov r9, 0
	setl r9B
	mov r11,  [rsp+8*33]
	add r11,r11
	cmp r9, 0
	mov qword [rsp+8*32],r9
	mov qword [rsp+8*33],r11
	je L_473
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*35],r9
	mov qword [rsp+8*36],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r8
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*43],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*30]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*45],r9
	mov qword [rsp+8*46],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
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
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*47],r8
	mov r8,  [rsp+8*45]
	mov qword [rsp+8*49],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*48],r11
	mov r11,32767
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
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
	mov qword [rsp+8*51],r8
	mov r8,r11
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*52],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*53],r11
	mov qword [rsp+8*54],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*55],r10
	mov r10,  [rsp+8*30]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*36],r9
	mov qword [rsp+8*35],r11
	mov r11,32767
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r8
	mov qword [rsp+8*39],r9
	mov r9,r10
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*56],r11
	mov r11,  [rsp+8*31]
	mov r9,r11
	inc r11 
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*31],r11
	jmp L_471
	
L_473:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r15,r9
	mov r10,r15
	mov r8,  [rsp+8*26]
	mov r11,r8
	mov qword [rsp+8*59],r9
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov qword [rsp+8*62],r10
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*36],r9
	mov qword [rsp+8*35],r11
	mov r11,32767
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r8
	mov qword [rsp+8*39],r9
	mov r9,r10
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov qword [rsp+8*41],r8
	mov r8,32
	mov qword [rsp+8*36],r10
	mov r10,  [rsp+8*26]
	mov r15,r8
	sub r15,r10
	mov r8,r15
	mov qword [rsp+8*42],r9
	mov r9,  [rsp+8*62]
	mov r10,r9
	mov r9,r10
	mov qword [rsp+8*63],r11
	mov r11,r8
	mov qword [rsp+8*45],r9
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*46],r11
	mov r11,32767
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r9
	mov r9,r8
	mov qword [rsp+8*39],r10
	mov r10,  [rsp+8*46]
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov rcx,r10
	shr r11,cl
	mov rcx,1
	shl r11,cl
	inc r11 
	mov r9,r11
	mov qword [rsp+8*47],r8
	mov r8,  [rsp+8*45]
	mov qword [rsp+8*48],r9
	mov r9,r8
	mov rcx,r10
	shr r9,cl
	mov qword [rsp+8*49],r11
	mov r11,  [rsp+8*48]
	and r9,r11
	mov r11,r9
	mov r10,65535
	mov r8,r10
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*48],r11
	mov r11,32767
	mov r9,r11
	mov qword rsi,r8
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*48]
	mov qword [rsp+8*39],r9
	mov r9,r10
	and r9,r8
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov qword [rsp+8*51],r8
	mov r8,r11
	mov r10,  [rsp+8*63]
	mov r15,r10
	or r15,r8
	mov qword [rsp+8*65],r8
	mov r8,r15
	mov qword [rsp+8*52],r9
	mov r9,1
	mov r10,r9
	mov qword [rsp+8*53],r11
	mov r11,  [rsp+8*17]
	mov r9,r11
	mov qword [rsp+8*76],r8
	mov r8,r9
	mov r15,r10
	mov r11,1
	mov qword rdi,r9
	mov r9,r8
	add r9,r11
	mov qword rsi,r10
	mov r10,r9
	mov qword [rsp+8*27],r8
	mov r11,0
	mov r8,r11
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*29],r9
	mov qword [rsp+8*30],r10
	
L_183:
	mov r8,10
	mov r9,r15
	imul r9,r8
	mov r10,  [rsp+8*31]
	cmp r10,r9
	mov r9, 0
	setl r9B
	mov r11,  [rsp+8*33]
	add r11,r11
	cmp r9, 0
	mov qword [rsp+8*32],r9
	mov qword [rsp+8*33],r11
	je L_185
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*35],r9
	mov qword [rsp+8*36],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r8
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*43],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*30]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*45],r9
	mov qword [rsp+8*46],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
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
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*47],r8
	mov r8,  [rsp+8*45]
	mov qword [rsp+8*49],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*48],r11
	mov r11,32767
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
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
	mov qword [rsp+8*51],r8
	mov r8,r11
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*52],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*53],r11
	mov qword [rsp+8*54],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*55],r10
	mov r10,  [rsp+8*30]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*36],r9
	mov qword [rsp+8*35],r11
	mov r11,32767
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r8
	mov qword [rsp+8*39],r9
	mov r9,r10
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*56],r11
	mov r11,  [rsp+8*31]
	mov r9,r11
	inc r11 
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*31],r11
	jmp L_183
	
L_185:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r15,r9
	mov r10,r15
	mov r8,1
	mov r11,r8
	mov qword [rsp+8*59],r9
	mov r9,  [rsp+8*15]
	mov r8,r9
	mov qword [rsp+8*77],r10
	mov r10,r8
	mov r15,r11
	mov r9,1
	mov qword rdi,r8
	mov r8,r10
	add r8,r9
	mov qword rsi,r11
	mov r11,r8
	mov qword [rsp+8*27],r10
	mov r10,0
	mov r9,r10
	mov qword [rsp+8*29],r8
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*30],r11
	
L_203:
	mov r8,10
	mov r9,r15
	imul r9,r8
	mov r10,  [rsp+8*31]
	cmp r10,r9
	mov r9, 0
	setl r9B
	mov r11,  [rsp+8*33]
	add r11,r11
	cmp r9, 0
	mov qword [rsp+8*32],r9
	mov qword [rsp+8*33],r11
	je L_205
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*35],r9
	mov qword [rsp+8*36],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r8
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*43],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*30]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*45],r9
	mov qword [rsp+8*46],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
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
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*47],r8
	mov r8,  [rsp+8*45]
	mov qword [rsp+8*49],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*48],r11
	mov r11,32767
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
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
	mov qword [rsp+8*51],r8
	mov r8,r11
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*52],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*53],r11
	mov qword [rsp+8*54],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*55],r10
	mov r10,  [rsp+8*30]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*36],r9
	mov qword [rsp+8*35],r11
	mov r11,32767
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r8
	mov qword [rsp+8*39],r9
	mov r9,r10
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*56],r11
	mov r11,  [rsp+8*31]
	mov r9,r11
	inc r11 
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*31],r11
	jmp L_203
	
L_205:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r15,r9
	mov r10,r15
	mov r11,  [rsp+8*77]
	mov r8,r11
	xor r8,r10
	mov qword [rsp+8*78],r10
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*59],r9
	mov r9,  [rsp+8*13]
	mov r11,r9
	mov qword [rsp+8*79],r8
	mov r8,r11
	mov r15,r10
	mov r9,1
	mov qword rdi,r11
	mov r11,r8
	add r11,r9
	mov qword rsi,r10
	mov r10,r11
	mov qword [rsp+8*27],r8
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*30],r10
	mov qword [rsp+8*29],r11
	
L_223:
	mov r8,10
	mov r9,r15
	imul r9,r8
	mov r10,  [rsp+8*31]
	cmp r10,r9
	mov r9, 0
	setl r9B
	mov r11,  [rsp+8*33]
	add r11,r11
	cmp r9, 0
	mov qword [rsp+8*32],r9
	mov qword [rsp+8*33],r11
	je L_225
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*35],r9
	mov qword [rsp+8*36],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r8
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*43],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*30]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*45],r9
	mov qword [rsp+8*46],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
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
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*47],r8
	mov r8,  [rsp+8*45]
	mov qword [rsp+8*49],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*48],r11
	mov r11,32767
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
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
	mov qword [rsp+8*51],r8
	mov r8,r11
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*52],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*53],r11
	mov qword [rsp+8*54],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*55],r10
	mov r10,  [rsp+8*30]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*36],r9
	mov qword [rsp+8*35],r11
	mov r11,32767
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r8
	mov qword [rsp+8*39],r9
	mov r9,r10
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*56],r11
	mov r11,  [rsp+8*31]
	mov r9,r11
	inc r11 
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*31],r11
	jmp L_223
	
L_225:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r15,r9
	mov r10,r15
	mov r11,  [rsp+8*79]
	xor r11,r10
	mov qword [rsp+8*80],r10
	mov r10,r11
	mov r11,  [rsp+8*69]
	mov r8,r11
	xor r8,r10
	mov qword [rsp+8*59],r9
	mov r9,1
	mov r11,r9
	mov r9,r8
	mov r8,r9
	mov r15,r11
	mov qword [rsp+8*81],r10
	mov r10,1
	mov qword rdi,r9
	mov r9,r8
	add r9,r10
	mov qword rsi,r11
	mov r11,r9
	mov qword [rsp+8*27],r8
	mov r10,0
	mov r8,r10
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*29],r9
	mov qword [rsp+8*30],r11
	
L_243:
	mov r8,10
	mov r9,r15
	imul r9,r8
	mov r10,  [rsp+8*31]
	cmp r10,r9
	mov r9, 0
	setl r9B
	mov r11,  [rsp+8*33]
	add r11,r11
	cmp r9, 0
	mov qword [rsp+8*32],r9
	mov qword [rsp+8*33],r11
	je L_245
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*35],r9
	mov qword [rsp+8*36],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r8
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*43],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*30]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*45],r9
	mov qword [rsp+8*46],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
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
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*47],r8
	mov r8,  [rsp+8*45]
	mov qword [rsp+8*49],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*48],r11
	mov r11,32767
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
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
	mov qword [rsp+8*51],r8
	mov r8,r11
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*52],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*53],r11
	mov qword [rsp+8*54],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*55],r10
	mov r10,  [rsp+8*30]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*36],r9
	mov qword [rsp+8*35],r11
	mov r11,32767
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r8
	mov qword [rsp+8*39],r9
	mov r9,r10
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*56],r11
	mov r11,  [rsp+8*31]
	mov r9,r11
	inc r11 
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*31],r11
	jmp L_243
	
L_245:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r15,r9
	mov r10,r15
	mov r11,  [rsp+8*9]
	mov r8,r11
	add r8,r10
	mov r11,r8
	mov r8,  [rsp+8*71]
	mov qword [rsp+8*83],r10
	mov r10,  [rsp+8*81]
	mov qword [rsp+8*59],r9
	mov r9,r8
	xor r9,r10
	mov qword [rsp+8*9],r11
	mov r11,1
	mov r8,r11
	mov r11,r9
	mov r9,r11
	mov r15,r8
	mov r10,1
	mov qword rdi,r11
	mov r11,r9
	add r11,r10
	mov qword rsi,r8
	mov r8,r11
	mov qword [rsp+8*27],r9
	mov r10,0
	mov r9,r10
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*29],r11
	
L_263:
	mov r8,10
	mov r9,r15
	imul r9,r8
	mov r10,  [rsp+8*31]
	cmp r10,r9
	mov r9, 0
	setl r9B
	mov r11,  [rsp+8*33]
	add r11,r11
	cmp r9, 0
	mov qword [rsp+8*32],r9
	mov qword [rsp+8*33],r11
	je L_265
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*35],r9
	mov qword [rsp+8*36],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r8
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*43],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*30]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*45],r9
	mov qword [rsp+8*46],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
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
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*47],r8
	mov r8,  [rsp+8*45]
	mov qword [rsp+8*49],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*48],r11
	mov r11,32767
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
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
	mov qword [rsp+8*51],r8
	mov r8,r11
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*52],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*53],r11
	mov qword [rsp+8*54],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*55],r10
	mov r10,  [rsp+8*30]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*36],r9
	mov qword [rsp+8*35],r11
	mov r11,32767
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r8
	mov qword [rsp+8*39],r9
	mov r9,r10
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*56],r11
	mov r11,  [rsp+8*31]
	mov r9,r11
	inc r11 
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*31],r11
	jmp L_263
	
L_265:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r15,r9
	mov r10,r15
	mov r11,  [rsp+8*10]
	mov r8,r11
	add r8,r10
	mov r11,r8
	mov r8,  [rsp+8*73]
	mov qword [rsp+8*86],r10
	mov r10,  [rsp+8*81]
	mov qword [rsp+8*59],r9
	mov r9,r8
	xor r9,r10
	mov qword [rsp+8*10],r11
	mov r11,1
	mov r8,r11
	mov r11,r9
	mov r9,r11
	mov r15,r8
	mov r10,1
	mov qword rdi,r11
	mov r11,r9
	add r11,r10
	mov qword rsi,r8
	mov r8,r11
	mov qword [rsp+8*27],r9
	mov r10,0
	mov r9,r10
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*29],r11
	
L_283:
	mov r8,10
	mov r9,r15
	imul r9,r8
	mov r10,  [rsp+8*31]
	cmp r10,r9
	mov r9, 0
	setl r9B
	mov r11,  [rsp+8*33]
	add r11,r11
	cmp r9, 0
	mov qword [rsp+8*32],r9
	mov qword [rsp+8*33],r11
	je L_285
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*35],r9
	mov qword [rsp+8*36],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r8
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*43],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*30]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*45],r9
	mov qword [rsp+8*46],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
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
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*47],r8
	mov r8,  [rsp+8*45]
	mov qword [rsp+8*49],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*48],r11
	mov r11,32767
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
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
	mov qword [rsp+8*51],r8
	mov r8,r11
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*52],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*53],r11
	mov qword [rsp+8*54],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*55],r10
	mov r10,  [rsp+8*30]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*36],r9
	mov qword [rsp+8*35],r11
	mov r11,32767
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*37],r8
	mov r8,r11
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*36]
	and r10,r8
	mov qword [rsp+8*39],r9
	mov r9,r10
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*56],r11
	mov r11,  [rsp+8*31]
	mov r9,r11
	inc r11 
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*31],r11
	jmp L_283
	
L_285:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r15,r9
	mov r10,r15
	mov r11,  [rsp+8*11]
	mov r8,r11
	add r8,r10
	mov r11,r8
	mov r8,  [rsp+8*76]
	mov qword [rsp+8*89],r10
	mov r10,  [rsp+8*81]
	mov qword [rsp+8*59],r9
	mov r9,r8
	xor r9,r10
	mov r10,1
	mov r8,r10
	mov r10,r9
	mov r9,r10
	mov r15,r8
	mov qword [rsp+8*11],r11
	mov r11,1
	mov qword rdi,r10
	mov r10,r9
	add r10,r11
	mov qword [rsp+8*27],r9
	mov r9,r10
	mov r11,0
	mov r10,r11
	mov qword rsi,r8
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*31],r10
	
L_303:
	mov r8,10
	mov r9,r15
	imul r9,r8
	mov r10,  [rsp+8*31]
	cmp r10,r9
	mov r9, 0
	setl r9B
	mov r11,  [rsp+8*33]
	add r11,r11
	cmp r9, 0
	mov qword [rsp+8*32],r9
	mov qword [rsp+8*33],r11
	je L_305
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
	mov r10,r11
	mov r9,r10
	mov qword rsi,r8
	mov r11,  rsi
	mov r8,r11
	mov qword rdi,r10
	mov r10,r9
	mov rcx,r8
	shl r10,cl
	mov qword [rsp+8*35],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*34],r9
	mov qword [rsp+8*36],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*37],r8
	mov r8,r10
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*36]
	and r11,r8
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*36],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*43],r10
	mov r11,17
	mov r10,r11
	mov r11,r8
	mov qword [rsp+8*42],r9
	mov r9,r11
	mov qword rsi,r10
	mov qword [rsp+8*30],r8
	mov r8,  rsi
	mov r10,r8
	mov qword [rsp+8*45],r9
	mov r9,65535
	mov r8,r9
	mov r9,32767
	mov r11,r9
	mov r9,r11
	mov qword [rsp+8*46],r10
	mov r10,r8
	mov qword rdi,r11
	mov r11,r9
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov qword rsi,r8
	mov r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov qword [rsp+8*38],r10
	mov r10,r9
	mov qword [rsp+8*47],r9
	mov r9,  [rsp+8*46]
	mov qword [rsp+8*39],r11
	mov r11,r10
	mov rcx,r9
	shr r11,cl
	mov rcx,1
	shl r11,cl
	inc r11 
	mov r10,r11
	mov r11,  [rsp+8*45]
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov rcx,r9
	shr r8,cl
	and r8,r10
	mov r10,r8
	mov r9,65535
	mov r8,r9
	mov r11,32767
	mov r9,r11
	mov r11,r9
	mov qword [rsp+8*48],r10
	mov r10,r8
	mov qword rdi,r9
	mov r9,r11
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov qword rsi,r8
	mov r8,r9
	mov qword [rsp+8*37],r11
	mov r11,r8
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*48]
	mov qword [rsp+8*39],r9
	mov r9,r10
	and r9,r11
	mov r10,r9
	mov r9,r10
	mov qword [rsp+8*53],r10
	mov r10,  [rsp+8*30]
	mov qword [rsp+8*51],r11
	mov r11,r10
	xor r11,r9
	mov r10,r11
	mov qword [rsp+8*54],r9
	mov r11,5
	mov r9,r11
	mov r11,r10
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword rsi,r9
	mov qword [rsp+8*30],r10
	mov r10,  rsi
	mov r9,r10
	mov qword rdi,r11
	mov r11,r8
	mov rcx,r9
	shl r11,cl
	mov qword [rsp+8*34],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*35],r9
	mov r9,32767
	mov r8,r9
	mov r9,r8
	mov qword [rsp+8*36],r11
	mov r11,r10
	mov qword rdi,r8
	mov r8,r9
	mov rcx,16
	shl r8,cl
	or r8,r11
	mov qword [rsp+8*37],r9
	mov r9,r8
	mov r8,r9
	mov qword [rsp+8*40],r9
	mov r9,  [rsp+8*36]
	and r9,r8
	mov qword [rsp+8*41],r8
	mov r8,r9
	mov r9,r8
	mov qword [rsp+8*42],r8
	mov r8,  [rsp+8*30]
	mov qword [rsp+8*38],r11
	mov r11,r8
	xor r11,r9
	mov r8,r11
	mov qword [rsp+8*56],r9
	mov r11,  [rsp+8*31]
	mov r9,r11
	inc r11 
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*58],r9
	mov qword rsi,r10
	mov qword [rsp+8*31],r11
	jmp L_303
	
L_305:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r15,r9
	mov r10,r15
	mov r11,  [rsp+8*12]
	mov r8,r11
	add r8,r10
	mov r11,r8
	mov r8,  [rsp+8*17]
	mov r15,r8
	inc r8 
	mov qword [rsp+8*17],r8
	mov qword [rsp+8*59],r9
	mov qword [rsp+8*92],r10
	mov qword [rsp+8*12],r11
	jmp L_18
	
L_19:
	mov r8,  [rsp+8*15]
	mov r15,r8
	inc r8 
	mov qword [rsp+8*15],r8
	jmp L_15
	
L_16:
	mov r8,  [rsp+8*13]
	mov r15,r8
	inc r8 
	mov qword [rsp+8*13],r8
	jmp L_12
	
L_13:
	mov r9,  [rsp+8*9]
	mov r8,r9
	mov r14,r8
	mov r11,t127
	mov r10,r11
	mov qword rdi,r8
	mov r8,28
	mov r9,r8
	mov qword [rsp+8*99],r9
	mov qword [rsp+8*98],r10
	
L_95:
	mov r8,  [rsp+8*99]
	mov r9,0
	cmp r8,r9
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_96
	mov r8,  [rsp+8*99]
	mov r15,r14
	mov rcx,r8
	shr r15,cl
	mov r9,15
	and r15,r9
	mov r10,r15
	mov r11,10
	cmp r10,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*102],r10
	je L_97
	mov r8,48
	mov r9,  [rsp+8*102]
	mov r15,r8
	add r15,r9
	mov r10,r15
	mov r11,r10
	mov r8,32
	cmp r11,r8
	mov r9, 0
	setge r9B
	cmp r9, 0
	mov qword [rsp+8*106],r9
	mov qword rdi,r10
	mov qword [rsp+8*105],r11
	jne L_98
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_99
	
L_98:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_99:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_100
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov qword [rsp+8*109],r8
	mov r8,r10
	sub r8,r11
	mov r9,32
	mov qword [rsp+8*110],r8
	mov r8,r10
	sub r8,r9
	mov r11,r8
	mov r10,  [rsp+8*110]
	mov r9,r10
	mov qword [rsp+8*111],r8
	mov qword rsi,r11
	mov r11,  [rsp+8*109]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r15,r8
	jmp L_102
	
L_100:
	mov r8,t125
	mov r15,r8
	
L_102:
	mov     rsi,  r15
	mov     rdi, [rsp+8*98]
	call    concat
	mov  r15, rax
	mov r8,r15
	mov qword [rsp+8*98],r8
	jmp L_103
	
L_97:
	mov r8,65
	mov r9,  [rsp+8*102]
	mov r15,r8
	add r15,r9
	mov r10,10
	sub r15,r10
	mov r11,r15
	mov r8,r11
	mov r9,32
	cmp r8,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*106],r10
	mov qword rdi,r11
	jne L_104
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_105
	
L_104:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_105:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_106
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov qword [rsp+8*109],r8
	mov r8,r10
	sub r8,r11
	mov r9,32
	mov qword [rsp+8*110],r8
	mov r8,r10
	sub r8,r9
	mov r11,r8
	mov r10,  [rsp+8*110]
	mov r9,r10
	mov qword [rsp+8*111],r8
	mov qword rsi,r11
	mov r11,  [rsp+8*109]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r15,r8
	jmp L_108
	
L_106:
	mov r8,t125
	mov r15,r8
	
L_108:
	mov     rsi,  r15
	mov     rdi, [rsp+8*98]
	call    concat
	mov  r15, rax
	mov r8,r15
	mov qword [rsp+8*98],r8
	
L_103:
	mov r8,  [rsp+8*99]
	mov r9,4
	mov r15,r8
	sub r15,r9
	mov r8,r15
	mov qword [rsp+8*99],r8
	jmp L_95
	
L_96:
	mov r8,  [rsp+8*98]
	mov r15,r8
	mov r9,r15
	mov qword [rsp+8*122],r9
	mov     rsi, t222
	mov     rdi, [rsp+8*122]
	call    concat
	mov [rsp+8*123], rax
	mov r9,  [rsp+8*123]
	mov r8,r9
	mov r15,r8
	mov qword rdi,r8
	mov rdi, format
	mov rsi, r15 
	inc rsi
	xor rax, rax
	call printf
	mov r9,  [rsp+8*10]
	mov r8,r9
	mov r14,r8
	mov r11,t127
	mov r10,r11
	mov qword rdi,r8
	mov r8,28
	mov r9,r8
	mov qword [rsp+8*99],r9
	mov qword [rsp+8*98],r10
	
L_112:
	mov r8,  [rsp+8*99]
	mov r9,0
	cmp r8,r9
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_113
	mov r8,  [rsp+8*99]
	mov r15,r14
	mov rcx,r8
	shr r15,cl
	mov r9,15
	and r15,r9
	mov r10,r15
	mov r11,10
	cmp r10,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*102],r10
	je L_114
	mov r8,48
	mov r9,  [rsp+8*102]
	mov r15,r8
	add r15,r9
	mov r10,r15
	mov r11,r10
	mov r8,32
	cmp r11,r8
	mov r9, 0
	setge r9B
	cmp r9, 0
	mov qword [rsp+8*106],r9
	mov qword rdi,r10
	mov qword [rsp+8*105],r11
	jne L_115
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_116
	
L_115:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_116:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_117
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov qword [rsp+8*109],r8
	mov r8,r10
	sub r8,r11
	mov r9,32
	mov qword [rsp+8*110],r8
	mov r8,r10
	sub r8,r9
	mov r11,r8
	mov r10,  [rsp+8*110]
	mov r9,r10
	mov qword [rsp+8*111],r8
	mov qword rsi,r11
	mov r11,  [rsp+8*109]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r15,r8
	jmp L_119
	
L_117:
	mov r8,t125
	mov r15,r8
	
L_119:
	mov     rsi,  r15
	mov     rdi, [rsp+8*98]
	call    concat
	mov  r15, rax
	mov r8,r15
	mov qword [rsp+8*98],r8
	jmp L_120
	
L_114:
	mov r8,65
	mov r9,  [rsp+8*102]
	mov r15,r8
	add r15,r9
	mov r10,10
	sub r15,r10
	mov r11,r15
	mov r8,r11
	mov r9,32
	cmp r8,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*106],r10
	mov qword rdi,r11
	jne L_121
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_122
	
L_121:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_122:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_123
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov qword [rsp+8*109],r8
	mov r8,r10
	sub r8,r11
	mov r9,32
	mov qword [rsp+8*110],r8
	mov r8,r10
	sub r8,r9
	mov r11,r8
	mov r10,  [rsp+8*110]
	mov r9,r10
	mov qword [rsp+8*111],r8
	mov qword rsi,r11
	mov r11,  [rsp+8*109]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r15,r8
	jmp L_125
	
L_123:
	mov r8,t125
	mov r15,r8
	
L_125:
	mov     rsi,  r15
	mov     rdi, [rsp+8*98]
	call    concat
	mov  r15, rax
	mov r8,r15
	mov qword [rsp+8*98],r8
	
L_120:
	mov r8,  [rsp+8*99]
	mov r9,4
	mov r15,r8
	sub r15,r9
	mov r8,r15
	mov qword [rsp+8*99],r8
	jmp L_112
	
L_113:
	mov r8,  [rsp+8*98]
	mov r15,r8
	mov     rsi, t229
	mov     rdi,  r15
	call    concat
	mov  r15, rax
	mov r8,r15
	mov r15,r8
	mov qword rdi,r8
	mov rdi, format
	mov rsi, r15 
	inc rsi
	xor rax, rax
	call printf
	mov r9,  [rsp+8*11]
	mov r8,r9
	mov r14,r8
	mov r11,t127
	mov r10,r11
	mov qword rdi,r8
	mov r8,28
	mov r9,r8
	mov qword [rsp+8*99],r9
	mov qword [rsp+8*98],r10
	
L_129:
	mov r8,  [rsp+8*99]
	mov r9,0
	cmp r8,r9
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_130
	mov r8,  [rsp+8*99]
	mov r15,r14
	mov rcx,r8
	shr r15,cl
	mov r9,15
	and r15,r9
	mov r10,r15
	mov r11,10
	cmp r10,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*102],r10
	je L_131
	mov r8,48
	mov r9,  [rsp+8*102]
	mov r15,r8
	add r15,r9
	mov r10,r15
	mov r11,r10
	mov r8,32
	cmp r11,r8
	mov r9, 0
	setge r9B
	cmp r9, 0
	mov qword [rsp+8*106],r9
	mov qword rdi,r10
	mov qword [rsp+8*105],r11
	jne L_132
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_133
	
L_132:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_133:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_134
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov qword [rsp+8*109],r8
	mov r8,r10
	sub r8,r11
	mov r9,32
	mov qword [rsp+8*110],r8
	mov r8,r10
	sub r8,r9
	mov r11,r8
	mov r10,  [rsp+8*110]
	mov r9,r10
	mov qword [rsp+8*111],r8
	mov qword rsi,r11
	mov r11,  [rsp+8*109]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r15,r8
	jmp L_136
	
L_134:
	mov r8,t125
	mov r15,r8
	
L_136:
	mov     rsi,  r15
	mov     rdi, [rsp+8*98]
	call    concat
	mov  r15, rax
	mov r8,r15
	mov qword [rsp+8*98],r8
	jmp L_137
	
L_131:
	mov r8,65
	mov r9,  [rsp+8*102]
	mov r15,r8
	add r15,r9
	mov r10,10
	sub r15,r10
	mov r11,r15
	mov r8,r11
	mov r9,32
	cmp r8,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*106],r10
	mov qword rdi,r11
	jne L_138
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_139
	
L_138:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_139:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_140
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov qword [rsp+8*109],r8
	mov r8,r10
	sub r8,r11
	mov r9,32
	mov qword [rsp+8*110],r8
	mov r8,r10
	sub r8,r9
	mov r11,r8
	mov r10,  [rsp+8*110]
	mov r9,r10
	mov qword [rsp+8*111],r8
	mov qword rsi,r11
	mov r11,  [rsp+8*109]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r15,r8
	jmp L_142
	
L_140:
	mov r8,t125
	mov r15,r8
	
L_142:
	mov     rsi,  r15
	mov     rdi, [rsp+8*98]
	call    concat
	mov  r15, rax
	mov r8,r15
	mov qword [rsp+8*98],r8
	
L_137:
	mov r8,  [rsp+8*99]
	mov r9,4
	mov r15,r8
	sub r15,r9
	mov r8,r15
	mov qword [rsp+8*99],r8
	jmp L_129
	
L_130:
	mov r8,  [rsp+8*98]
	mov r15,r8
	mov     rsi, t236
	mov     rdi,  r15
	call    concat
	mov  r15, rax
	mov r8,r15
	mov r15,r8
	mov qword rdi,r8
	mov rdi, format
	mov rsi, r15 
	inc rsi
	xor rax, rax
	call printf
	mov r9,  [rsp+8*12]
	mov r8,r9
	mov r14,r8
	mov r11,t127
	mov r10,r11
	mov r11,28
	mov r9,r11
	mov qword rdi,r8
	mov qword [rsp+8*99],r9
	mov qword [rsp+8*98],r10
	
L_146:
	mov r8,  [rsp+8*99]
	mov r9,0
	cmp r8,r9
	mov r15, 0
	setge r15B
	cmp r15, 0
	je L_147
	mov r8,  [rsp+8*99]
	mov r15,r14
	mov rcx,r8
	shr r15,cl
	mov r9,15
	and r15,r9
	mov r10,r15
	mov r11,10
	cmp r10,r11
	mov r15, 0
	setl r15B
	cmp r15, 0
	mov qword [rsp+8*102],r10
	je L_148
	mov r8,48
	mov r9,  [rsp+8*102]
	mov r15,r8
	add r15,r9
	mov r10,r15
	mov r11,r10
	mov r8,32
	cmp r11,r8
	mov r9, 0
	setge r9B
	cmp r9, 0
	mov qword [rsp+8*106],r9
	mov qword rdi,r10
	mov qword [rsp+8*105],r11
	jne L_149
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_150
	
L_149:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_150:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_151
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov qword [rsp+8*109],r8
	mov r8,r10
	sub r8,r11
	mov r9,32
	mov qword [rsp+8*110],r8
	mov r8,r10
	sub r8,r9
	mov r11,r8
	mov r10,  [rsp+8*110]
	mov r9,r10
	mov qword [rsp+8*111],r8
	mov qword rsi,r11
	mov r11,  [rsp+8*109]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r15,r8
	jmp L_153
	
L_151:
	mov r8,t125
	mov r15,r8
	
L_153:
	mov     rsi,  r15
	mov     rdi, [rsp+8*98]
	call    concat
	mov  r15, rax
	mov r8,r15
	mov qword [rsp+8*98],r8
	jmp L_154
	
L_148:
	mov r8,65
	mov r9,  [rsp+8*102]
	mov r15,r8
	add r15,r9
	mov r10,10
	sub r15,r10
	mov r11,r15
	mov r8,r11
	mov r9,32
	cmp r8,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*106],r10
	mov qword rdi,r11
	jne L_155
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_156
	
L_155:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_156:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_157
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov qword [rsp+8*109],r8
	mov r8,r10
	sub r8,r11
	mov r11,32
	mov r9,r10
	sub r9,r11
	mov r10,r9
	mov r9,r8
	mov r11,  [rsp+8*109]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	mov qword rsi,r10
	call    substring
	mov [rsp+8*113], rax
	mov r8,  [rsp+8*113]
	mov r15,r8
	jmp L_159
	
L_157:
	mov r8,t125
	mov r15,r8
	
L_159:
	mov     rsi,  r15
	mov     rdi, [rsp+8*98]
	call    concat
	mov  r15, rax
	mov r8,r15
	mov qword [rsp+8*98],r8
	
L_154:
	mov r8,  [rsp+8*99]
	mov r9,4
	mov r15,r8
	sub r15,r9
	mov r8,r15
	mov qword [rsp+8*99],r8
	jmp L_146
	
L_147:
	mov r8,  [rsp+8*98]
	mov r15,r8
	mov     rsi, t243
	mov     rdi,  r15
	call    concat
	mov  r15, rax
	mov r8,r15
	mov r15,r8
	mov qword rdi,r8
	mov rdi, format
	mov rsi, r15 
	inc rsi
	xor rax, rax
	call printf
	mov r9,t248
	mov r8,r9
	mov r15,r8
	mov qword rdi,r8
	mov rdi, r15 
	inc rdi
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


