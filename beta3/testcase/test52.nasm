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
	mov r9,106
	mov r8,r9
	mov r15,r8
	mov qword rdi,r8
	mov     rdi,  r15
	call    mallocArray
	mov     qword [rsp+8*4], rax
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [gbl+8*5],r8
	mov qword [gbl+8*6],r10
	
L_1098:
	mov r8,  [gbl+8*6]
	cmp r8,r15
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*7],r9
	je L_1099
	mov     rdi,  r15
	call    mallocArray
	mov     qword [rsp+8*8], rax
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*6]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*9],r8
	mov r8,  [rsp+8*8]
	mov [r11],r8
	mov qword [rsp+8*10],r11
	mov r11,0
	mov r8,r11
	mov qword [gbl+8*11],r8
	
L_1100:
	mov r8,  [gbl+8*11]
	cmp r8,r15
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*12],r9
	je L_1101
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*6]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [gbl+8*11]
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*13],r8
	mov r8,0
	mov [r11],r8
	mov r8,r9
	mov qword [rsp+8*15],r8
	mov r8,1
	add r9,r8
	mov qword [gbl+8*11],r9
	mov qword [rsp+8*14],r11
	jmp L_1100
	
L_1101:
	mov r9,  [gbl+8*6]
	mov r8,r9
	mov r10,1
	add r9,r10
	mov qword [rsp+8*16],r8
	mov qword [gbl+8*6],r9
	jmp L_1098
	
L_1099:
	mov r8,0
	mov r15,r8
	mov r9,r15
	mov r11,101
	mov r10,r11
	mov r8,1
	mov qword [rsp+8*18],r9
	mov r9,r10
	sub r9,r8
	mov r14,r9
	mov r12,r14
	mov r9,0
	mov r8,r9
	mov qword [gbl+8*6],r8
	mov qword [gbl+8*19],r10
	
L_1078:
	mov r8,  [gbl+8*6]
	mov r9,  [gbl+8*19]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*23],r10
	je L_1079
	mov r9,0
	mov r8,r9
	mov qword [gbl+8*11],r8
	
L_1081:
	mov r8,  [gbl+8*11]
	mov r9,  [gbl+8*19]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*24],r10
	je L_1082
	mov r8,1
	mov r9,r8
	neg r9
	mov r10,  [gbl+8*5]
	mov r15,r10
	mov r11,  [gbl+8*6]
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	mov r8,  [gbl+8*11]
	lea r15,[r15+r8*8+8H]
	mov [r15],r9
	mov r9,r8
	mov qword [rsp+8*28],r9
	mov r9,1
	add r8,r9
	mov qword [gbl+8*11],r8
	jmp L_1081
	
L_1082:
	mov r9,  [gbl+8*6]
	mov r8,r9
	mov r10,1
	add r9,r10
	mov qword [rsp+8*29],r8
	mov qword [gbl+8*6],r9
	jmp L_1078
	
L_1079:
	
L_1084:
	mov r8,  [gbl+8*30]
	mov r9,  [gbl+8*31]
	cmp r8,r9
	mov r15, 0
	setle r15B
	cmp r15, 0
	je L_1085
	mov r8,  [gbl+8*33]
	mov r15,r8
	mov r9,  [gbl+8*30]
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	mov r10,r15
	mov r11,  [gbl+8*38]
	mov r15,r11
	lea r15,[r15+r9*8+8H]
	mov r15, [r15]
	mov r8,r15
	mov qword [gbl+8*37],r10
	mov r10,  [gbl+8*5]
	mov r15,r10
	mov r11,  [gbl+8*37]
	lea r15,[r15+r11*8+8H]
	mov r15, [r15]
	lea r15,[r15+r8*8+8H]
	mov r9, [r15]
	mov r10,r9
	mov qword [rsp+8*45],r9
	mov r9,1
	mov qword [gbl+8*42],r8
	mov r8,r11
	sub r8,r9
	mov r9,  [gbl+8*42]
	mov qword [gbl+8*46],r10
	mov r10,2
	mov qword [rsp+8*47],r8
	mov r8,r9
	sub r8,r10
	mov r10,r8
	mov r11,  [rsp+8*47]
	mov r8,r11
	mov r11,r8
	mov r9,r10
	mov qword rdi,r8
	mov r8,  [gbl+8*19]
	mov r10,r8
	mov qword [rsp+8*50],r11
	mov qword [rsp+8*51],r9
	mov r9,  [rsp+8*50]
	mov r11,r9
	mov r8,r11
	mov qword rsi,r10
	mov r9,  rsi
	mov r10,r9
	cmp r8,r10
	mov qword rdi,r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r10
	mov qword [rsp+8*54],r11
	jne L_1135
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1136
	
L_1135:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1136:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_1139
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1140
	
L_1139:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	cmp r8,r9
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r10
	jne L_1141
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1142
	
L_1141:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1142:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_1140:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1145
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
	je L_1146
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
	jne L_1147
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1148
	
L_1147:
	mov r8,  [rsp+8*51]
	cmp r8,r14
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1148:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1149
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1149:
	
L_1146:
	
L_1145:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov qword [rsp+8*77],r10
	mov r10,1
	mov r9,r11
	sub r9,r10
	mov r10,  [gbl+8*42]
	mov qword [rsp+8*76],r8
	mov r8,2
	mov qword [rsp+8*78],r9
	mov r9,r10
	add r9,r8
	mov r8,r9
	mov r11,  [rsp+8*78]
	mov r9,r11
	mov r11,r9
	mov r10,r8
	mov qword rdi,r9
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov qword [rsp+8*50],r11
	mov qword [rsp+8*51],r10
	mov r10,  [rsp+8*50]
	mov r11,r10
	mov qword rsi,r8
	mov r8,r11
	mov r10,  rsi
	mov r9,r10
	cmp r8,r9
	mov qword rdi,r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r11
	jne L_1152
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1153
	
L_1152:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1153:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_1156
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1157
	
L_1156:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	cmp r8,r9
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r10
	jne L_1158
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1159
	
L_1158:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1159:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_1157:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1162
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
	je L_1163
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
	jne L_1164
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1165
	
L_1164:
	mov r8,  [rsp+8*51]
	cmp r8,r14
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1165:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1166
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1166:
	
L_1163:
	
L_1162:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov qword [rsp+8*80],r10
	mov r10,1
	mov r9,r11
	add r9,r10
	mov r10,  [gbl+8*42]
	mov qword [rsp+8*76],r8
	mov r8,2
	mov qword [rsp+8*81],r9
	mov r9,r10
	sub r9,r8
	mov r8,r9
	mov r11,  [rsp+8*81]
	mov r9,r11
	mov r11,r9
	mov r10,r8
	mov qword rdi,r9
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov qword [rsp+8*50],r11
	mov qword [rsp+8*51],r10
	mov r10,  [rsp+8*50]
	mov r11,r10
	mov qword rsi,r8
	mov r8,r11
	mov r10,  rsi
	mov r9,r10
	cmp r8,r9
	mov qword rdi,r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r11
	jne L_1169
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1170
	
L_1169:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1170:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_1173
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1174
	
L_1173:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	cmp r8,r9
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r10
	jne L_1175
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1176
	
L_1175:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1176:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_1174:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1179
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
	je L_1180
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
	jne L_1181
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1182
	
L_1181:
	mov r8,  [rsp+8*51]
	cmp r8,r14
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1182:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1183
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1183:
	
L_1180:
	
L_1179:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov qword [rsp+8*83],r10
	mov r10,1
	mov r9,r11
	add r9,r10
	mov r10,  [gbl+8*42]
	mov qword [rsp+8*76],r8
	mov r8,2
	mov qword [rsp+8*84],r9
	mov r9,r10
	add r9,r8
	mov r8,r9
	mov r11,  [rsp+8*84]
	mov r9,r11
	mov r11,r9
	mov r10,r8
	mov qword rdi,r9
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov qword [rsp+8*50],r11
	mov qword [rsp+8*51],r10
	mov r10,  [rsp+8*50]
	mov r11,r10
	mov qword rsi,r8
	mov r8,r11
	mov r10,  rsi
	mov r9,r10
	cmp r8,r9
	mov qword rdi,r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r11
	jne L_1186
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1187
	
L_1186:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1187:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_1190
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1191
	
L_1190:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	cmp r8,r9
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r10
	jne L_1192
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1193
	
L_1192:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1193:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_1191:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1196
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
	je L_1197
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
	jne L_1198
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1199
	
L_1198:
	mov r8,  [rsp+8*51]
	cmp r8,r14
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1199:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1200
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1200:
	
L_1197:
	
L_1196:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov qword [rsp+8*86],r10
	mov r10,2
	mov r9,r11
	sub r9,r10
	mov r10,  [gbl+8*42]
	mov qword [rsp+8*76],r8
	mov r8,1
	mov qword [rsp+8*87],r9
	mov r9,r10
	sub r9,r8
	mov r8,r9
	mov r11,  [rsp+8*87]
	mov r9,r11
	mov r11,r9
	mov r10,r8
	mov qword rdi,r9
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov qword [rsp+8*50],r11
	mov qword [rsp+8*51],r10
	mov r10,  [rsp+8*50]
	mov r11,r10
	mov qword rsi,r8
	mov r8,r11
	mov r10,  rsi
	mov r9,r10
	cmp r8,r9
	mov qword rdi,r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r11
	jne L_1203
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1204
	
L_1203:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1204:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_1207
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1208
	
L_1207:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	cmp r8,r9
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r10
	jne L_1209
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1210
	
L_1209:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1210:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_1208:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1213
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
	je L_1214
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
	jne L_1215
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1216
	
L_1215:
	mov r8,  [rsp+8*51]
	cmp r8,r14
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1216:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1217
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1217:
	
L_1214:
	
L_1213:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov qword [rsp+8*89],r10
	mov r10,2
	mov r9,r11
	sub r9,r10
	mov r10,  [gbl+8*42]
	mov qword [rsp+8*76],r8
	mov r8,1
	mov qword [rsp+8*90],r9
	mov r9,r10
	add r9,r8
	mov r8,r9
	mov r11,  [rsp+8*90]
	mov r9,r11
	mov r11,r9
	mov r10,r8
	mov qword rdi,r9
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov qword [rsp+8*50],r11
	mov qword [rsp+8*51],r10
	mov r10,  [rsp+8*50]
	mov r11,r10
	mov qword rsi,r8
	mov r8,r11
	mov r10,  rsi
	mov r9,r10
	cmp r8,r9
	mov qword rdi,r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r11
	jne L_1220
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1221
	
L_1220:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1221:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_1224
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1225
	
L_1224:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	cmp r8,r9
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r10
	jne L_1226
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1227
	
L_1226:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1227:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_1225:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1230
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
	je L_1231
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
	jne L_1232
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1233
	
L_1232:
	mov r8,  [rsp+8*51]
	cmp r8,r14
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1233:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1234
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1234:
	
L_1231:
	
L_1230:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov qword [rsp+8*92],r10
	mov r10,2
	mov r9,r11
	add r9,r10
	mov r10,  [gbl+8*42]
	mov qword [rsp+8*76],r8
	mov r8,1
	mov qword [rsp+8*93],r9
	mov r9,r10
	sub r9,r8
	mov r8,r9
	mov r11,  [rsp+8*93]
	mov r9,r11
	mov r11,r9
	mov r10,r8
	mov qword rdi,r9
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov qword [rsp+8*50],r11
	mov qword [rsp+8*51],r10
	mov r10,  [rsp+8*50]
	mov r11,r10
	mov qword rsi,r8
	mov r8,r11
	mov r10,  rsi
	mov r9,r10
	cmp r8,r9
	mov qword rdi,r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r11
	jne L_1237
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1238
	
L_1237:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1238:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_1241
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1242
	
L_1241:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	cmp r8,r9
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r10
	jne L_1243
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1244
	
L_1243:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1244:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_1242:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1247
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
	je L_1248
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
	jne L_1249
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1250
	
L_1249:
	mov r8,  [rsp+8*51]
	cmp r8,r14
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1250:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1251
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1251:
	
L_1248:
	
L_1247:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov qword [rsp+8*95],r10
	mov r10,2
	mov r15,r11
	add r15,r10
	mov r10,  [gbl+8*42]
	mov r11,1
	mov r13,r10
	add r13,r11
	mov r10,r13
	mov r11,r15
	mov r9,r11
	mov qword [rsp+8*76],r8
	mov r8,r10
	mov qword [rsp+8*50],r9
	mov r9,  [gbl+8*19]
	mov r10,r9
	mov qword [rsp+8*51],r8
	mov r8,  [rsp+8*50]
	mov r11,r8
	mov r9,r11
	mov qword rsi,r10
	mov r8,  rsi
	mov r10,r8
	cmp r9,r10
	mov qword rdi,r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r9
	mov qword [rsp+8*53],r10
	mov qword [rsp+8*54],r11
	jne L_1254
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1255
	
L_1254:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1255:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_1258
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_1259
	
L_1258:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r9,r10
	mov qword rsi,r8
	mov r11,  rsi
	mov r8,r11
	cmp r9,r8
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*53],r8
	mov qword [rsp+8*52],r9
	mov qword rdi,r10
	mov qword [rsp+8*54],r11
	jne L_1260
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_1261
	
L_1260:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_1261:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_1259:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_1264
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
	je L_1265
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
	jne L_1266
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_1267
	
L_1266:
	mov r8,  [rsp+8*51]
	cmp r8,r14
	mov r9, 0
	sete r9B
	mov r10,r9
	mov qword [rsp+8*74],r9
	mov qword [rsp+8*73],r10
	
L_1267:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_1268
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_1268:
	
L_1265:
	
L_1264:
	mov r9,0
	mov r8,r9
	mov r15,r8
	mov r10,  [gbl+8*75]
	mov r11,1
	cmp r10,r11
	mov r15, 0
	sete r15B
	cmp r15, 0
	mov qword [rsp+8*76],r8
	je L_1087
	jmp L_1085
	
L_1087:
	mov r8,  [gbl+8*30]
	mov r9,1
	mov r15,r8
	add r15,r9
	mov r8,r15
	mov qword [gbl+8*30],r8
	jmp L_1084
	
L_1085:
	mov r8,  [gbl+8*75]
	mov r9,1
	cmp r8,r9
	mov r15, 0
	sete r15B
	cmp r15, 0
	je L_1088
	mov r8,  [gbl+8*5]
	mov r15,r8
	lea r15,[r15+r12*8+8H]
	mov r15, [r15]
	lea r15,[r15+r14*8+8H]
	mov r15, [r15]
	mov r9,r15
	mov r15,r9
	mov qword rdi,r9
	mov     rdi,  r15
	call    toString
	mov     qword r15, rax
	mov r8,r15
	mov r15,r8
	mov qword rdi,r8
	mov rdi, r15 
	add rdi, 1 
	call puts
	jmp L_1089
	
L_1088:
	mov r9,t211
	mov r8,r9
	mov r15,r8
	mov qword rdi,r8
	mov rdi, r15 
	add rdi, 1 
	call puts
	
L_1089:
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


