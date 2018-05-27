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
	sub    rsp, 704
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 2688
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
	mov r8,10
	mov r14,r8
	mov r9,5
	mov r10,r14
	add r10,r9
	mov qword [rsp+8*3],r10
	mov     rdi, [rsp+8*3]
	call    mallocArray
	mov     qword [rsp+8*4], rax
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [gbl+8*5],r8
	mov qword [rsp+8*6],r10
	
L_62:
	mov r8,  [rsp+8*6]
	cmp r8,r14
	mov r9, 0
	setle r9B
	cmp r9, 0
	mov qword [rsp+8*7],r9
	je L_63
	mov r9,  [rsp+8*6]
	mov r8,r9
	mov r10,1
	add r9,r10
	mov r10,  [gbl+8*5]
	mov r11,r10
	mov qword [rsp+8*6],r9
	lea r9,[r11+r8*8+8H]
	mov qword [rsp+8*8],r8
	mov r8,1
	mov [r9],r8
	mov qword [rsp+8*10],r9
	mov qword [rsp+8*9],r11
	jmp L_62
	
L_63:
	mov r8,5
	mov r9,r14
	add r9,r8
	mov qword [rsp+8*11],r9
	mov     rdi, [rsp+8*11]
	call    mallocArray
	mov     qword [rsp+8*12], rax
	mov r9,  [rsp+8*12]
	mov r8,r9
	mov r10,5
	mov r11,r14
	add r11,r10
	mov qword [rsp+8*13],r8
	mov qword [rsp+8*14],r11
	mov     rdi, [rsp+8*14]
	call    mallocArray
	mov     qword [rsp+8*15], rax
	mov r8,  [rsp+8*15]
	mov r12,r8
	mov r10,  [rsp+8*13]
	mov r9,r10
	mov r11,1
	lea r8,[r9+r11*8+8H]
	mov qword [rsp+8*17],r9
	mov r9,1
	mov [r8],r9
	mov qword [rsp+8*18],r8
	mov r9,2
	mov r8,r9
	mov qword [rsp+8*6],r8
	
L_64:
	mov r8,  [rsp+8*6]
	cmp r8,r14
	mov r9, 0
	setg r9B
	cmp r9, 0
	mov qword [rsp+8*19],r9
	je L_68
	jmp L_65
	
L_68:
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*6]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*20],r8
	mov r8, [r11]
	cmp r8, 0
	mov qword [rsp+8*22],r8
	mov qword [rsp+8*21],r11
	je L_70
	mov r8,  [gbl+8*23]
	mov r9,1
	add r8,r9
	mov r10,r12
	lea r11,[r10+r8*8+8H]
	mov r9,  [rsp+8*6]
	mov [r11],r9
	mov qword [rsp+8*24],r10
	mov r10,1
	mov qword [rsp+8*25],r11
	mov r11,r9
	sub r11,r10
	mov qword [gbl+8*23],r8
	mov r8,  [rsp+8*13]
	mov r10,r8
	mov qword [rsp+8*26],r11
	lea r11,[r10+r9*8+8H]
	mov qword [rsp+8*27],r10
	mov r10,  [rsp+8*26]
	mov [r11],r10
	mov qword [rsp+8*28],r11
	
L_70:
	mov r9,  [rsp+8*6]
	mov r8,r9
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*29],r8
	mov qword [rsp+8*30],r10
	
L_71:
	mov r8,  [rsp+8*30]
	mov r9,  [gbl+8*23]
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*31],r10
	jne L_74
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*31],r8
	jmp L_75
	
L_74:
	mov r8,r12
	mov r9,  [rsp+8*30]
	lea r10,[r8+r9*8+8H]
	mov r11, [r10]
	mov qword [rsp+8*32],r8
	mov r8,  [rsp+8*29]
	mov qword [rsp+8*33],r10
	mov r10,r8
	imul r10,r11
	cmp r10,r14
	mov r10, 0
	setle r10B
	mov qword [rsp+8*34],r11
	mov r11,r10
	mov qword [rsp+8*35],r10
	mov qword [rsp+8*31],r11
	
L_75:
	mov r8,  [rsp+8*31]
	cmp r8, 0
	je L_72
	mov r8,r12
	mov r9,  [rsp+8*30]
	lea r10,[r8+r9*8+8H]
	mov r11, [r10]
	mov qword [rsp+8*36],r8
	mov r8,  [rsp+8*29]
	mov qword [rsp+8*37],r10
	mov r10,r8
	imul r10,r11
	mov r15,r10
	cmp r15,r14
	mov r10, 0
	setg r10B
	cmp r10, 0
	mov qword [rsp+8*41],r10
	mov qword [rsp+8*38],r11
	je L_77
	jmp L_73
	
L_77:
	mov r9,  [gbl+8*5]
	mov r8,r9
	lea r10,[r8+r15*8+8H]
	mov r11,0
	mov [r10],r11
	mov qword [rsp+8*42],r8
	mov r8,r12
	mov r9,  [rsp+8*30]
	mov qword [rsp+8*43],r10
	lea r10,[r8+r9*8+8H]
	mov qword [rsp+8*44],r8
	mov r8, [r10]
	xor rdx, rdx
	mov qword [rsp+8*45],r10
	mov r10,  [rsp+8*29]
	mov rax, r10
	mov rbx, r8
	cdq
	idiv rbx
	mov r11, rdx
	mov qword [rsp+8*46],r8
	mov r8,0
	cmp r11,r8
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*48],r9
	mov qword [rsp+8*47],r11
	je L_78
	mov r9,  [rsp+8*13]
	mov r8,r9
	mov r10,  [rsp+8*29]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*49],r8
	mov r8, [r11]
	mov r13,r12
	mov qword [rsp+8*50],r11
	mov r11,  [rsp+8*30]
	lea r13,[r13+r11*8+8H]
	mov r13, [r13]
	mov r9,r8
	imul r9,r13
	mov qword [rsp+8*51],r8
	mov r8,  [rsp+8*13]
	mov r13,r8
	lea r15,[r13+r15*8+8H]
	mov [r15],r9
	mov qword [rsp+8*55],r9
	jmp L_72
	
L_78:
	mov r8,  [rsp+8*13]
	mov r15,r8
	mov r9,  [rsp+8*29]
	lea r15,[r15+r9*8+8H]
	mov r13, [r15]
	mov r15,r12
	mov r10,  [rsp+8*30]
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	mov r11,1
	sub r15,r11
	imul r13,r15
	mov r15,r12
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	imul r15,r9
	mov r11,r8
	lea r15,[r11+r15*8+8H]
	mov [r15],r13
	mov qword [rsp+8*70],r11
	
L_73:
	mov r9,  [rsp+8*30]
	mov r8,r9
	mov r10,1
	add r9,r10
	mov qword [rsp+8*72],r8
	mov qword [rsp+8*30],r9
	jmp L_71
	
L_72:
	mov r8,  [rsp+8*13]
	mov r15,r8
	mov r9,  [rsp+8*29]
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	mov r10,r15
	mov r15,r10
	mov qword rdi,r10
	mov     rdi,  r15
	call    toString
	mov     qword r15, rax
	mov r8,r15
	mov r15,r8
	mov qword rdi,r8
	mov rdi, r15 
	add rdi, 1 
	call puts
	mov r8,  [rsp+8*6]
	mov r9,1
	add r8,r9
	mov qword [rsp+8*6],r8
	jmp L_64
	
L_65:
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 704
	mov r9,0
	mov r8,r9
	mov qword [gbl+8*23],r8
	mov r8,  [rsp+8*80]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   2688
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
	
