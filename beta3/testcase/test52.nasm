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
	sub    rsp, 952
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 2936
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
	mov r8,106
	mov rdi,r8
	mov r15,rdi
	mov     rdi,  r15
	call    mallocArray
	mov     qword [rsp+8*4], rax
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov r10,0
	mov r14,r10
	mov qword [gbl+8*5],r8
	
L_1093:
	cmp r14,r15
	mov r8, 0
	setl r8B
	cmp r8, 0
	mov qword [rsp+8*7],r8
	je L_1094
	mov     rdi,  r15
	call    mallocArray
	mov     qword [rsp+8*8], rax
	mov r9,  [gbl+8*5]
	mov r8,r9
	lea r10,[r8+r14*8+8H]
	mov r11,  [rsp+8*8]
	mov [r10],r11
	mov qword [rsp+8*9],r8
	mov qword [rsp+8*10],r10
	mov r10,0
	mov r8,r10
	mov qword [gbl+8*11],r8
	
L_1095:
	mov r8,  [gbl+8*11]
	cmp r8,r15
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*12],r9
	je L_1096
	mov r9,  [gbl+8*5]
	mov r8,r9
	lea r10,[r8+r14*8+8H]
	mov r8, [r10]
	mov r11,  [gbl+8*11]
	lea r10,[r8+r11*8+8H]
	mov qword [rsp+8*13],r8
	mov r8,0
	mov [r10],r8
	mov r8,r11
	mov qword [rsp+8*15],r8
	mov r8,1
	add r11,r8
	mov qword [rsp+8*14],r10
	mov qword [gbl+8*11],r11
	jmp L_1095
	
L_1096:
	mov r8,r14
	mov r9,1
	add r14,r9
	mov qword [rsp+8*16],r8
	jmp L_1093
	
L_1094:
	mov r8,0
	mov r15,r8
	mov r9,r15
	mov r11,101
	mov r10,r11
	mov r8,1
	mov qword [rsp+8*18],r9
	mov r9,r10
	sub r9,r8
	mov r13,r9
	mov r12,r13
	mov r8,0
	mov r14,r8
	mov qword [rsp+8*20],r9
	mov qword [gbl+8*19],r10
	
L_1073:
	mov r8,  [gbl+8*19]
	cmp r14,r8
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*23],r9
	je L_1074
	mov r9,0
	mov r8,r9
	mov qword [gbl+8*11],r8
	
L_1076:
	mov r8,  [gbl+8*11]
	mov r9,  [gbl+8*19]
	cmp r8,r9
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_1077
	mov r8,1
	mov r9,r8
	neg r9
	mov r10,  [gbl+8*5]
	mov r15,r10
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	mov r11,  [gbl+8*11]
	lea r15,[r15+r11*8+8H]
	mov [r15],r9
	mov r15,r11
	mov r8,1
	add r11,r8
	mov qword [rsp+8*25],r9
	mov qword [gbl+8*11],r11
	jmp L_1076
	
L_1077:
	mov r15,r14
	mov r8,1
	add r14,r8
	jmp L_1073
	
L_1074:
	
L_1079:
	mov r8,  [gbl+8*30]
	mov r9,  [gbl+8*31]
	cmp r8,r9
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1080
	mov r8,  [gbl+8*33]
	mov r15,r8
	mov r9,  [gbl+8*30]
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	mov r14,r15
	mov r10,  [gbl+8*38]
	mov r15,r10
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	mov r11,r15
	mov r8,  [gbl+8*5]
	mov r15,r8
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	mov r10,r15
	mov r9,1
	mov r8,r14
	sub r8,r9
	mov r9,2
	mov r15,r11
	sub r15,r9
	mov rsi,r15
	mov rdi,r8
	mov r8,rdi
	mov r9,rsi
	mov qword [gbl+8*46],r10
	mov r10,  [gbl+8*19]
	mov rsi,r10
	mov rdi,r8
	mov qword [gbl+8*42],r11
	mov r11,rdi
	mov r15,rsi
	cmp r11,r15
	mov qword [rsp+8*51],r9
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*50],r8
	mov qword [rsp+8*54],r9
	mov qword [rsp+8*52],r11
	jne L_1130
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1131
	
L_1130:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1131:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	cmp r9, 0
	mov qword [rsp+8*57],r9
	jne L_1134
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1135
	
L_1134:
	mov r8,  [gbl+8*19]
	mov rsi,r8
	mov r9,  [rsp+8*51]
	mov rdi,r9
	mov r10,rdi
	mov r15,rsi
	cmp r10,r15
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*54],r11
	jne L_1136
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1137
	
L_1136:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1137:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	mov r10,r9
	mov qword [rsp+8*59],r9
	mov qword [rsp+8*58],r10
	
L_1135:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1140
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	lea r11,[r8+r9*8+8H]
	mov r10, [r11]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r9,r8
	neg r9
	cmp r10,r9
	mov qword [rsp+8*61],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*64],r11
	je L_1141
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	lea r10,[r11+r8*8+8H]
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	lea r10,[r8+r9*8+8H]
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r8,  [gbl+8*5]
	mov r11,r8
	mov r9,  [rsp+8*50]
	mov qword [rsp+8*70],r10
	lea r10,[r11+r9*8+8H]
	mov r11, [r10]
	mov r8,  [rsp+8*51]
	lea r10,[r11+r8*8+8H]
	mov r9,  [rsp+8*70]
	mov [r10],r9
	mov r8,  [rsp+8*50]
	cmp r8,r12
	mov qword [rsp+8*71],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r11
	jne L_1142
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1143
	
L_1142:
	mov r8,  [rsp+8*51]
	cmp r8,r13
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1143:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1144
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1144:
	
L_1141:
	
L_1140:
	mov r8,0
	mov r15,r8
	mov r15,r15
	mov r9,1
	mov r15,r14
	sub r15,r9
	mov r10,  [gbl+8*42]
	mov r11,2
	mov r9,r10
	add r9,r11
	mov rsi,r9
	mov rdi,r15
	mov r9,rdi
	mov r11,rsi
	mov r8,  [gbl+8*19]
	mov rsi,r8
	mov rdi,r9
	mov r10,rdi
	mov r15,rsi
	cmp r10,r15
	mov qword [rsp+8*51],r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*54],r11
	jne L_1147
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1148
	
L_1147:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1148:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	cmp r9, 0
	mov qword [rsp+8*57],r9
	jne L_1151
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1152
	
L_1151:
	mov r8,  [gbl+8*19]
	mov rsi,r8
	mov r9,  [rsp+8*51]
	mov rdi,r9
	mov r10,rdi
	mov r15,rsi
	cmp r10,r15
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*54],r11
	jne L_1153
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1154
	
L_1153:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1154:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	mov r10,r9
	mov qword [rsp+8*59],r9
	mov qword [rsp+8*58],r10
	
L_1152:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1157
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	lea r11,[r8+r9*8+8H]
	mov r10, [r11]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r9,r8
	neg r9
	cmp r10,r9
	mov qword [rsp+8*61],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*64],r11
	je L_1158
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	lea r10,[r11+r8*8+8H]
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	lea r10,[r8+r9*8+8H]
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r8,  [gbl+8*5]
	mov r11,r8
	mov r9,  [rsp+8*50]
	mov qword [rsp+8*70],r10
	lea r10,[r11+r9*8+8H]
	mov r11, [r10]
	mov r8,  [rsp+8*51]
	lea r10,[r11+r8*8+8H]
	mov r9,  [rsp+8*70]
	mov [r10],r9
	mov r8,  [rsp+8*50]
	cmp r8,r12
	mov qword [rsp+8*71],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r11
	jne L_1159
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1160
	
L_1159:
	mov r8,  [rsp+8*51]
	cmp r8,r13
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1160:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1161
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1161:
	
L_1158:
	
L_1157:
	mov r8,0
	mov r15,r8
	mov r15,r15
	mov r9,1
	mov r15,r14
	add r15,r9
	mov r10,  [gbl+8*42]
	mov r11,2
	mov r9,r10
	sub r9,r11
	mov rsi,r9
	mov rdi,r15
	mov r9,rdi
	mov r11,rsi
	mov r8,  [gbl+8*19]
	mov rsi,r8
	mov rdi,r9
	mov r10,rdi
	mov r15,rsi
	cmp r10,r15
	mov qword [rsp+8*51],r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*54],r11
	jne L_1164
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1165
	
L_1164:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1165:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	cmp r9, 0
	mov qword [rsp+8*57],r9
	jne L_1168
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1169
	
L_1168:
	mov r8,  [gbl+8*19]
	mov rsi,r8
	mov r9,  [rsp+8*51]
	mov rdi,r9
	mov r10,rdi
	mov r15,rsi
	cmp r10,r15
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*54],r11
	jne L_1170
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1171
	
L_1170:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1171:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	mov r10,r9
	mov qword [rsp+8*59],r9
	mov qword [rsp+8*58],r10
	
L_1169:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1174
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	lea r11,[r8+r9*8+8H]
	mov r10, [r11]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r9,r8
	neg r9
	cmp r10,r9
	mov qword [rsp+8*61],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*64],r11
	je L_1175
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	lea r10,[r11+r8*8+8H]
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	lea r10,[r8+r9*8+8H]
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r8,  [gbl+8*5]
	mov r11,r8
	mov r9,  [rsp+8*50]
	mov qword [rsp+8*70],r10
	lea r10,[r11+r9*8+8H]
	mov r11, [r10]
	mov r8,  [rsp+8*51]
	lea r10,[r11+r8*8+8H]
	mov r9,  [rsp+8*70]
	mov [r10],r9
	mov r8,  [rsp+8*50]
	cmp r8,r12
	mov qword [rsp+8*71],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r11
	jne L_1176
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1177
	
L_1176:
	mov r8,  [rsp+8*51]
	cmp r8,r13
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1177:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1178
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1178:
	
L_1175:
	
L_1174:
	mov r8,0
	mov r15,r8
	mov r15,r15
	mov r9,1
	mov r15,r14
	add r15,r9
	mov r10,  [gbl+8*42]
	mov r11,2
	mov r9,r10
	add r9,r11
	mov rsi,r9
	mov rdi,r15
	mov r9,rdi
	mov r11,rsi
	mov r8,  [gbl+8*19]
	mov rsi,r8
	mov rdi,r9
	mov r10,rdi
	mov r15,rsi
	cmp r10,r15
	mov qword [rsp+8*51],r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*54],r11
	jne L_1181
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1182
	
L_1181:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1182:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	cmp r9, 0
	mov qword [rsp+8*57],r9
	jne L_1185
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1186
	
L_1185:
	mov r8,  [gbl+8*19]
	mov rsi,r8
	mov r9,  [rsp+8*51]
	mov rdi,r9
	mov r10,rdi
	mov r15,rsi
	cmp r10,r15
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*54],r11
	jne L_1187
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1188
	
L_1187:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1188:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	mov r10,r9
	mov qword [rsp+8*59],r9
	mov qword [rsp+8*58],r10
	
L_1186:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1191
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	lea r11,[r8+r9*8+8H]
	mov r10, [r11]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r9,r8
	neg r9
	cmp r10,r9
	mov qword [rsp+8*61],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*64],r11
	je L_1192
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	lea r10,[r11+r8*8+8H]
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	lea r10,[r8+r9*8+8H]
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r8,  [gbl+8*5]
	mov r11,r8
	mov r9,  [rsp+8*50]
	mov qword [rsp+8*70],r10
	lea r10,[r11+r9*8+8H]
	mov r11, [r10]
	mov r8,  [rsp+8*51]
	lea r10,[r11+r8*8+8H]
	mov r9,  [rsp+8*70]
	mov [r10],r9
	mov r8,  [rsp+8*50]
	cmp r8,r12
	mov qword [rsp+8*71],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r11
	jne L_1193
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1194
	
L_1193:
	mov r8,  [rsp+8*51]
	cmp r8,r13
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1194:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1195
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1195:
	
L_1192:
	
L_1191:
	mov r8,0
	mov r15,r8
	mov r15,r15
	mov r9,2
	mov r15,r14
	sub r15,r9
	mov r10,  [gbl+8*42]
	mov r11,1
	mov r9,r10
	sub r9,r11
	mov rsi,r9
	mov rdi,r15
	mov r9,rdi
	mov r11,rsi
	mov r8,  [gbl+8*19]
	mov rsi,r8
	mov rdi,r9
	mov r10,rdi
	mov r15,rsi
	cmp r10,r15
	mov qword [rsp+8*51],r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*54],r11
	jne L_1198
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1199
	
L_1198:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1199:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	cmp r9, 0
	mov qword [rsp+8*57],r9
	jne L_1202
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1203
	
L_1202:
	mov r8,  [gbl+8*19]
	mov rsi,r8
	mov r9,  [rsp+8*51]
	mov rdi,r9
	mov r10,rdi
	mov r15,rsi
	cmp r10,r15
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*54],r11
	jne L_1204
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1205
	
L_1204:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1205:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	mov r10,r9
	mov qword [rsp+8*59],r9
	mov qword [rsp+8*58],r10
	
L_1203:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1208
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	lea r11,[r8+r9*8+8H]
	mov r10, [r11]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r9,r8
	neg r9
	cmp r10,r9
	mov qword [rsp+8*61],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*64],r11
	je L_1209
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	lea r10,[r11+r8*8+8H]
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	lea r10,[r8+r9*8+8H]
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r8,  [gbl+8*5]
	mov r11,r8
	mov r9,  [rsp+8*50]
	mov qword [rsp+8*70],r10
	lea r10,[r11+r9*8+8H]
	mov r11, [r10]
	mov r8,  [rsp+8*51]
	lea r10,[r11+r8*8+8H]
	mov r9,  [rsp+8*70]
	mov [r10],r9
	mov r8,  [rsp+8*50]
	cmp r8,r12
	mov qword [rsp+8*71],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r11
	jne L_1210
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1211
	
L_1210:
	mov r8,  [rsp+8*51]
	cmp r8,r13
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1211:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1212
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1212:
	
L_1209:
	
L_1208:
	mov r8,0
	mov r15,r8
	mov r15,r15
	mov r9,2
	mov r10,r14
	sub r10,r9
	mov r11,  [gbl+8*42]
	mov r9,1
	mov r15,r11
	add r15,r9
	mov rsi,r15
	mov rdi,r10
	mov r9,rdi
	mov r10,rsi
	mov r8,  [gbl+8*19]
	mov rsi,r8
	mov rdi,r9
	mov r11,rdi
	mov r15,rsi
	cmp r11,r15
	mov qword [rsp+8*51],r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*54],r10
	mov qword [rsp+8*52],r11
	jne L_1215
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1216
	
L_1215:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1216:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	cmp r9, 0
	mov qword [rsp+8*57],r9
	jne L_1219
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1220
	
L_1219:
	mov r8,  [gbl+8*19]
	mov rsi,r8
	mov r9,  [rsp+8*51]
	mov rdi,r9
	mov r10,rdi
	mov r15,rsi
	cmp r10,r15
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*54],r11
	jne L_1221
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1222
	
L_1221:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1222:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	mov r10,r9
	mov qword [rsp+8*59],r9
	mov qword [rsp+8*58],r10
	
L_1220:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1225
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	lea r11,[r8+r9*8+8H]
	mov r10, [r11]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r9,r8
	neg r9
	cmp r10,r9
	mov qword [rsp+8*61],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*64],r11
	je L_1226
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	lea r10,[r11+r8*8+8H]
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	lea r10,[r8+r9*8+8H]
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r8,  [gbl+8*5]
	mov r11,r8
	mov r9,  [rsp+8*50]
	mov qword [rsp+8*70],r10
	lea r10,[r11+r9*8+8H]
	mov r11, [r10]
	mov r8,  [rsp+8*51]
	lea r10,[r11+r8*8+8H]
	mov r9,  [rsp+8*70]
	mov [r10],r9
	mov r8,  [rsp+8*50]
	cmp r8,r12
	mov qword [rsp+8*71],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r11
	jne L_1227
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1228
	
L_1227:
	mov r8,  [rsp+8*51]
	cmp r8,r13
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1228:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1229
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1229:
	
L_1226:
	
L_1225:
	mov r8,0
	mov r15,r8
	mov r15,r15
	mov r9,2
	mov r10,r14
	add r10,r9
	mov r11,  [gbl+8*42]
	mov r9,1
	mov r15,r11
	sub r15,r9
	mov rsi,r15
	mov rdi,r10
	mov r9,rdi
	mov r10,rsi
	mov r8,  [gbl+8*19]
	mov rsi,r8
	mov rdi,r9
	mov r11,rdi
	mov r15,rsi
	cmp r11,r15
	mov qword [rsp+8*51],r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*54],r10
	mov qword [rsp+8*52],r11
	jne L_1232
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1233
	
L_1232:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1233:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	cmp r9, 0
	mov qword [rsp+8*57],r9
	jne L_1236
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1237
	
L_1236:
	mov r8,  [gbl+8*19]
	mov rsi,r8
	mov r9,  [rsp+8*51]
	mov rdi,r9
	mov r10,rdi
	mov r15,rsi
	cmp r10,r15
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*54],r11
	jne L_1238
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1239
	
L_1238:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1239:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	mov r10,r9
	mov qword [rsp+8*59],r9
	mov qword [rsp+8*58],r10
	
L_1237:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1242
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	lea r11,[r8+r9*8+8H]
	mov r10, [r11]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r9,r8
	neg r9
	cmp r10,r9
	mov qword [rsp+8*61],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*64],r11
	je L_1243
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	lea r10,[r11+r8*8+8H]
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	lea r10,[r8+r9*8+8H]
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r8,  [gbl+8*5]
	mov r11,r8
	mov r9,  [rsp+8*50]
	mov qword [rsp+8*70],r10
	lea r10,[r11+r9*8+8H]
	mov r11, [r10]
	mov r8,  [rsp+8*51]
	lea r10,[r11+r8*8+8H]
	mov r9,  [rsp+8*70]
	mov [r10],r9
	mov r8,  [rsp+8*50]
	cmp r8,r12
	mov qword [rsp+8*71],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r11
	jne L_1244
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1245
	
L_1244:
	mov r8,  [rsp+8*51]
	cmp r8,r13
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1245:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1246
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1246:
	
L_1243:
	
L_1242:
	mov r8,0
	mov r15,r8
	mov r15,r15
	mov r9,2
	mov r15,r14
	add r15,r9
	mov r10,  [gbl+8*42]
	mov r11,1
	mov r14,r10
	add r14,r11
	mov rsi,r14
	mov rdi,r15
	mov r9,rdi
	mov r10,rsi
	mov r11,  [gbl+8*19]
	mov rsi,r11
	mov rdi,r9
	mov r8,rdi
	mov r15,rsi
	cmp r8,r15
	mov qword [rsp+8*51],r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*54],r10
	jne L_1249
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1250
	
L_1249:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1250:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	cmp r9, 0
	mov qword [rsp+8*57],r9
	jne L_1253
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1254
	
L_1253:
	mov r8,  [gbl+8*19]
	mov rsi,r8
	mov r9,  [rsp+8*51]
	mov rdi,r9
	mov r10,rdi
	mov r15,rsi
	cmp r10,r15
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*54],r11
	jne L_1255
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1256
	
L_1255:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1256:
	mov r8,  [rsp+8*54]
	mov r15,r8
	mov r9,r15
	mov r10,r9
	mov qword [rsp+8*59],r9
	mov qword [rsp+8*58],r10
	
L_1254:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1259
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*60],r8
	mov r8, [r11]
	mov qword [rsp+8*61],r11
	mov r11,1
	mov r10,r11
	neg r10
	cmp r8,r10
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*62],r8
	mov qword [rsp+8*63],r10
	mov qword [rsp+8*64],r11
	je L_1260
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	lea r10,[r11+r8*8+8H]
	mov qword [rsp+8*66],r11
	mov r11,  [rsp+8*50]
	mov [r10],r11
	mov qword [rsp+8*67],r10
	mov r9,  [gbl+8*38]
	mov r10,r9
	lea r11,[r10+r8*8+8H]
	mov qword [gbl+8*31],r8
	mov r8,  [rsp+8*51]
	mov [r11],r8
	mov qword [rsp+8*68],r10
	mov r10,  [gbl+8*46]
	mov qword [rsp+8*69],r11
	mov r11,1
	mov r9,r10
	add r9,r11
	mov r11,  [gbl+8*5]
	mov r10,r11
	mov r8,  [rsp+8*50]
	mov qword [rsp+8*70],r9
	lea r9,[r10+r8*8+8H]
	mov r10, [r9]
	mov r11,  [rsp+8*51]
	lea r9,[r10+r11*8+8H]
	mov qword [rsp+8*71],r10
	mov r10,  [rsp+8*70]
	mov [r9],r10
	cmp r8,r12
	mov qword [rsp+8*72],r9
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*73],r9
	jne L_1261
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1262
	
L_1261:
	mov r8,  [rsp+8*51]
	cmp r8,r13
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1262:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1263
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1263:
	
L_1260:
	
L_1259:
	mov r8,0
	mov r15,r8
	mov r15,r15
	mov r9,  [gbl+8*75]
	mov r10,1
	cmp r9,r10
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1082
	jmp L_1080
	
L_1082:
	mov r8,  [gbl+8*30]
	mov r9,1
	mov r15,r8
	add r15,r9
	mov r8,r15
	mov qword [gbl+8*30],r8
	jmp L_1079
	
L_1080:
	mov r8,  [gbl+8*75]
	mov r9,1
	cmp r8,r9
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1083
	mov r8,  [gbl+8*5]
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r13*8+8H]
	mov r15, [r15]
	mov rdi,r15
	mov r15,rdi
	mov     rdi,  r15
	call    toString
	mov     qword r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, r15 
	add rdi, 1 
	call puts
	jmp L_1084
	
L_1083:
	mov r8,t211
	mov rdi,r8
	mov r15,rdi
	mov rdi, r15 
	add rdi, 1 
	call puts
	
L_1084:
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 952
	mov     rdi, 12000
	call    mallocArray
	mov     qword [gbl+8*109], rax
	mov r9,  [gbl+8*109]
	mov r8,r9
	mov qword [gbl+8*33],r8
	mov     rdi, 12000
	call    mallocArray
	mov     qword [gbl+8*110], rax
	mov r9,  [gbl+8*110]
	mov r8,r9
	mov qword [gbl+8*38],r8
	mov r8,  [rsp+8*111]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   2936
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
	
t211:
	 db 12,"no solution!" ,0


