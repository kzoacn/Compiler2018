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
	push r14
	push r13
	push r12
	call global_init
	pop r12
	pop r13
	pop r14
	pop r15
	mov r15 , rax
	mov r9,110
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
	
L_2021:
	mov r8,  [gbl+8*6]
	cmp r8,r15
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*7],r9
	je L_2022
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
	
L_2023:
	mov r8,  [gbl+8*11]
	cmp r8,r15
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*12],r9
	je L_2024
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
	jmp L_2023
	
L_2024:
	mov r9,  [gbl+8*6]
	mov r8,r9
	mov r10,1
	add r9,r10
	mov qword [rsp+8*16],r8
	mov qword [gbl+8*6],r9
	jmp L_2021
	
L_2022:
	mov r8,0
	mov r15,r8
	mov r15,r15
	mov r9,0
	mov r15,r9
	mov r10,99
	mov r13,r10
	mov r8,100
	mov r11,r8
	mov r9,0
	mov r8,r9
	mov r9,r11
	mov r10,r13
	mov qword [rsp+8*22],r8
	mov r8,r10
	mov qword rsi,r9
	mov qword [rsp+8*21],r11
	mov r11,  rsi
	mov r9,r11
	mov qword [rsp+8*24],r8
	mov qword rdi,r10
	mov r10,1
	mov r8,r10
	mov qword [gbl+8*6],r8
	mov qword [rsp+8*25],r9
	
L_2029:
	mov r8,  [gbl+8*6]
	mov r9,49
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*26],r10
	je L_2030
	mov r9,50
	mov r8,r9
	mov qword [gbl+8*11],r8
	
L_2031:
	mov r8,98
	mov r9,  [gbl+8*6]
	mov r10,r8
	sub r10,r9
	mov r11,1
	add r10,r11
	mov r8,  [gbl+8*11]
	cmp r8,r10
	mov r10, 0
	setle r10B
	mov r11,  [rsp+8*28]
	add r11,r11
	cmp r10, 0
	mov qword [rsp+8*27],r10
	mov qword [rsp+8*28],r11
	je L_2033
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*6]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [gbl+8*11]
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*29],r8
	mov r8,1
	mov [r11],r8
	mov r8,r9
	mov qword [rsp+8*31],r8
	mov r8,1
	add r9,r8
	mov qword [gbl+8*11],r9
	mov qword [rsp+8*30],r11
	jmp L_2031
	
L_2033:
	mov r9,  [gbl+8*6]
	mov r8,r9
	mov r10,1
	add r9,r10
	mov qword [rsp+8*32],r8
	mov qword [gbl+8*6],r9
	jmp L_2029
	
L_2030:
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*6],r8
	
L_2036:
	mov r8,  [gbl+8*6]
	mov r9,49
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*33],r10
	je L_2037
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*24]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r10,  [gbl+8*6]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*34],r8
	mov r8,1
	mov [r11],r8
	mov r8,r10
	mov qword [rsp+8*36],r8
	mov r8,1
	add r10,r8
	mov qword [gbl+8*6],r10
	mov qword [rsp+8*35],r11
	jmp L_2036
	
L_2037:
	mov r9,50
	mov r8,r9
	mov qword [gbl+8*6],r8
	
L_2039:
	mov r8,  [gbl+8*6]
	mov r9,98
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*37],r10
	je L_2040
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*6]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*25]
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*38],r8
	mov r8,1
	mov [r11],r8
	mov r8,r10
	mov qword [rsp+8*40],r8
	mov r8,1
	add r10,r8
	mov qword [gbl+8*6],r10
	mov qword [rsp+8*39],r11
	jmp L_2039
	
L_2040:
	mov r8,0
	mov r15,r8
	mov r9,r15
	mov qword [rsp+8*42],r9
	
L_1976:
	mov r9,  [rsp+8*22]
	mov r8,r9
	mov r10,r13
	mov r9,  [rsp+8*21]
	mov r11,r9
	mov r12,r11
	mov qword [arg+8*2],r8
	mov r8,r10
	mov qword rsi,r10
	mov r10,  [arg+8*2]
	mov r14,r10
	mov r9,0
	mov r10,r9
	mov qword rdi,r11
	mov r11,1
	mov r9,r11
	mov qword [rsp+8*45],r8
	mov r8,1
	mov r11,r8
	mov qword [gbl+8*48],r9
	mov qword [gbl+8*47],r10
	mov qword [gbl+8*6],r11
	
L_2044:
	mov r8,  [gbl+8*6]
	cmp r8,r12
	mov r9, 0
	setle r9B
	cmp r9, 0
	mov qword [rsp+8*49],r9
	je L_2045
	mov r9,  [gbl+8*50]
	mov r8,r9
	mov r10,  [gbl+8*6]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*51],r8
	mov r8,0
	mov [r11],r8
	mov r8,r10
	mov qword [rsp+8*53],r8
	mov r8,1
	add r10,r8
	mov qword [gbl+8*6],r10
	mov qword [rsp+8*52],r11
	jmp L_2044
	
L_2045:
	mov r9,  [gbl+8*54]
	mov r8,r9
	mov r10,1
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*55],r8
	mov r8,  [rsp+8*45]
	mov [r11],r8
	mov r10,  [gbl+8*50]
	mov r15,r10
	lea r15,[r15+r8*8+8H]
	mov qword [rsp+8*56],r11
	mov r11,1
	mov [r15],r11
	mov r11,  [gbl+8*59]
	mov r15,r11
	lea r15,[r15+r8*8+8H]
	mov r8,0
	mov [r15],r8
	mov r8,0
	mov r14,r8
	
L_2047:
	mov r8,  [gbl+8*47]
	mov r9,  [gbl+8*48]
	cmp r8,r9
	mov r15, 0
	setl r15B
	cmp r15, 0
	jne L_2048
	mov r8,0
	mov r15,r8
	jmp L_2049
	
L_2048:
	mov r8,0
	cmp r14,r8
	mov r15, 0
	sete r15B
	mov r15,r15
	
L_2049:
	cmp r15, 0
	je L_2050
	mov r9,  [gbl+8*47]
	mov r8,r9
	mov r10,1
	add r9,r10
	mov qword [rsp+8*64],r8
	mov r8,  [gbl+8*54]
	mov r11,r8
	lea r10,[r11+r9*8+8H]
	mov qword [gbl+8*47],r9
	mov r9, [r10]
	mov qword [rsp+8*66],r10
	mov r10,r9
	mov qword [rsp+8*67],r9
	mov qword [rsp+8*65],r11
	mov r11,1
	mov r9,r11
	mov qword [gbl+8*11],r9
	mov qword [gbl+8*6],r10
	
L_2051:
	mov r8,  [gbl+8*11]
	cmp r8,r12
	mov r9, 0
	setle r9B
	cmp r9, 0
	mov qword [rsp+8*68],r9
	je L_2052
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*6]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [gbl+8*11]
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*69],r8
	mov r8, [r11]
	cmp r8,0
	mov qword [rsp+8*70],r11
	mov r11, 0
	setg r11B
	cmp r11, 0
	mov qword [rsp+8*71],r8
	mov qword [rsp+8*72],r11
	jne L_2053
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_2054
	
L_2053:
	mov r9,  [gbl+8*50]
	mov r8,r9
	mov r10,  [gbl+8*11]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*73],r8
	mov r8, [r11]
	mov qword [rsp+8*74],r11
	mov r11,0
	cmp r8,r11
	mov r9, 0
	sete r9B
	mov qword [rsp+8*75],r8
	mov r8,r9
	mov qword [rsp+8*72],r8
	mov qword [rsp+8*76],r9
	
L_2054:
	mov r8,  [rsp+8*72]
	cmp r8, 0
	je L_2055
	mov r9,  [gbl+8*50]
	mov r8,r9
	mov r10,  [gbl+8*11]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*77],r8
	mov r8,1
	mov [r11],r8
	mov qword [rsp+8*78],r11
	mov r11,  [gbl+8*48]
	mov r8,r11
	mov qword [rsp+8*79],r8
	mov r8,1
	add r11,r8
	mov r9,  [gbl+8*54]
	mov r8,r9
	lea r10,[r8+r11*8+8H]
	mov qword [rsp+8*80],r8
	mov r8,  [gbl+8*11]
	mov [r10],r8
	mov qword [rsp+8*81],r10
	mov r9,  [gbl+8*59]
	mov r10,r9
	mov qword [gbl+8*48],r11
	lea r11,[r10+r8*8+8H]
	mov qword [rsp+8*82],r10
	mov r10,  [gbl+8*6]
	mov [r11],r10
	mov qword [rsp+8*83],r11
	mov r11,  [gbl+8*48]
	cmp r11,r12
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*84],r9
	je L_2056
	mov r8,1
	mov r14,r8
	
L_2056:
	
L_2055:
	mov r9,  [gbl+8*11]
	mov r8,r9
	mov r10,1
	add r9,r10
	mov qword [rsp+8*85],r8
	mov qword [gbl+8*11],r9
	jmp L_2051
	
L_2052:
	jmp L_2047
	
L_2050:
	mov r15,r14
	mov r8,r15
	cmp r8,0
	mov r9, 0
	setg r9B
	cmp r9, 0
	mov qword [rsp+8*87],r8
	mov qword [rsp+8*88],r9
	je L_1977
	mov r9,  [rsp+8*21]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*89],r10
	mov r10,  [gbl+8*90]
	mov r9,r10
	mov qword [rsp+8*91],r9
	mov r9,1
	add r10,r9
	mov qword rdi,r8
	mov qword [gbl+8*90],r10
	mov qword [gbl+8*6],r11
	
L_2060:
	mov r9,  [gbl+8*59]
	mov r8,r9
	mov r10,  [gbl+8*6]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*92],r8
	mov r8, [r11]
	cmp r8,0
	mov qword [rsp+8*93],r11
	mov r11, 0
	setg r11B
	cmp r11, 0
	mov qword [rsp+8*94],r8
	mov qword [rsp+8*95],r11
	je L_2061
	mov r9,  [gbl+8*59]
	mov r8,r9
	mov r10,  [gbl+8*6]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*96],r8
	mov r8, [r11]
	mov qword [rsp+8*97],r11
	mov r11,r8
	mov qword [rsp+8*98],r8
	mov r8,  [gbl+8*5]
	mov r15,r8
	lea r14,[r15+r11*8+8H]
	mov r15, [r14]
	lea r14,[r15+r10*8+8H]
	mov r15, [r14]
	mov r9,r15
	mov qword [rsp+8*102],r9
	mov r9,1
	sub r15,r9
	mov [r14],r15
	mov r15,r8
	lea r15,[r15+r10*8+8H]
	mov r15, [r15]
	lea r15,[r15+r11*8+8H]
	mov r12, [r15]
	mov r14,r12
	mov r8,1
	add r12,r8
	mov [r15],r12
	mov r10,r11
	mov qword [gbl+8*6],r10
	mov qword [gbl+8*11],r11
	jmp L_2060
	
L_2061:
	mov r8,0
	mov r15,r8
	mov r9,r15
	mov qword [rsp+8*108],r9
	jmp L_1976
	
L_1977:
	mov r9,  [gbl+8*90]
	mov r8,r9
	mov r15,r8
	mov qword rdi,r8
	mov     rdi,  r15
	call    toString
	mov     qword r15, rax
	mov r8,r15
	mov r15,r8
	mov qword rdi,r8
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
	sub    rsp, 984
	mov r9,0
	mov r8,r9
	mov qword [gbl+8*90],r8
	mov     rdi, 110
	call    mallocArray
	mov     qword [gbl+8*112], rax
	mov r9,  [gbl+8*112]
	mov r8,r9
	mov qword [gbl+8*50],r8
	mov     rdi, 110
	call    mallocArray
	mov     qword [gbl+8*113], rax
	mov r9,  [gbl+8*113]
	mov r8,r9
	mov qword [gbl+8*59],r8
	mov     rdi, 110
	call    mallocArray
	mov     qword [gbl+8*114], rax
	mov r9,  [gbl+8*114]
	mov r8,r9
	mov qword [gbl+8*54],r8
	mov r8,  [rsp+8*115]
	mov rax,r8
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
	

