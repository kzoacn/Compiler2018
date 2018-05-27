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
	sub    rsp, 2344
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 4328
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
	mov r8 , rax
	mov r10,102
	mov r9,r10
	mov qword [rsp+8*1],r8
	mov r8,0
	mov r11,r8
	mov r10,0
	mov r8,r10
	mov qword [rsp+8*2],r9
	mov r9,0
	mov r10,r9
	mov qword [rsp+8*3],r11
	mov r11,0
	mov r9,r11
	mov r11,  [rsp+8*2]
	mov qword [rsp+8*4],r8
	mov r8,1
	mov qword [rsp+8*5],r10
	mov r10,r11
	sub r10,r8
	mov r8,r10
	mov r10,1
	mov qword [rsp+8*6],r9
	mov r9,r11
	sub r9,r10
	mov r10,r9
	mov qword [rsp+8*8],r8
	mov r8,0
	mov r9,r8
	mov r11,0
	mov r8,r11
	mov qword [rsp+8*10],r10
	mov r10,0
	mov r11,r10
	mov qword [rsp+8*11],r9
	mov r9,0
	mov r10,r9
	mov r9,  [rsp+8*2]
	mov qword [rsp+8*12],r8
	mov r8,r9
	imul r8,r9
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*14],r10
	mov qword [rsp+8*13],r11
	mov     rdi, [rsp+8*15]
	call    mallocArray
	mov     qword [rsp+8*16], rax
	mov r9,  [rsp+8*16]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*17],r8
	mov qword [rsp+8*18],r10
	
L_755:
	mov r8,  [rsp+8*2]
	mov r9,r8
	imul r9,r8
	mov r10,  [rsp+8*18]
	cmp r10,r9
	mov r9, 0
	setl r9B
	mov r11,  [rsp+8*20]
	add r11,r11
	cmp r9, 0
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*20],r11
	je L_756
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*18]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*21],r8
	mov r8,0
	mov [r11],r8
	mov r8,r10
	inc r10 
	mov qword [rsp+8*23],r8
	mov qword [rsp+8*18],r10
	mov qword [rsp+8*22],r11
	jmp L_755
	
L_756:
	mov r8,  [rsp+8*2]
	mov r9,r8
	imul r9,r8
	mov qword [rsp+8*24],r9
	mov     rdi, [rsp+8*24]
	call    mallocArray
	mov     qword [rsp+8*25], rax
	mov r9,  [rsp+8*25]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*26],r8
	mov qword [rsp+8*18],r10
	
L_758:
	mov r8,  [rsp+8*2]
	mov r9,r8
	imul r9,r8
	mov r10,  [rsp+8*18]
	cmp r10,r9
	mov r9, 0
	setl r9B
	mov r11,  [rsp+8*20]
	add r11,r11
	cmp r9, 0
	mov qword [rsp+8*27],r9
	mov qword [rsp+8*20],r11
	je L_759
	mov r9,  [rsp+8*26]
	mov r8,r9
	mov r10,  [rsp+8*18]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*28],r8
	mov r8,0
	mov [r11],r8
	mov r8,r10
	inc r10 
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*18],r10
	mov qword [rsp+8*29],r11
	jmp L_758
	
L_759:
	mov     rdi, [rsp+8*2]
	call    mallocArray
	mov     qword [rsp+8*31], rax
	mov r9,  [rsp+8*31]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*32],r8
	mov qword [rsp+8*18],r10
	
L_761:
	mov r8,  [rsp+8*18]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*33],r10
	je L_762
	mov     rdi, [rsp+8*2]
	call    mallocArray
	mov     qword [rsp+8*34], rax
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*18]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*35],r8
	mov r8,  [rsp+8*34]
	mov [r11],r8
	mov qword [rsp+8*36],r11
	mov r11,0
	mov r8,r11
	mov qword [rsp+8*37],r8
	
L_764:
	mov r8,  [rsp+8*37]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*38],r10
	je L_765
	mov r8,1
	mov r9,r8
	neg r9
	mov r11,  [rsp+8*32]
	mov r10,r11
	mov r8,  [rsp+8*18]
	mov qword [rsp+8*39],r9
	lea r9,[r10+r8*8+8H]
	mov r10, [r9]
	mov r11,  [rsp+8*37]
	lea r9,[r10+r11*8+8H]
	mov qword [rsp+8*40],r10
	mov r10,  [rsp+8*39]
	mov [r9],r10
	mov qword [rsp+8*41],r9
	mov r9,r11
	inc r11 
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*37],r11
	jmp L_764
	
L_765:
	mov r9,  [rsp+8*18]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*43],r8
	mov qword [rsp+8*18],r9
	jmp L_761
	
L_762:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*44],r8
	mov r8,  [rsp+8*5]
	mov [r11],r8
	mov qword [rsp+8*45],r11
	mov r11,  [rsp+8*26]
	mov r10,r11
	mov r9,0
	lea r8,[r10+r9*8+8H]
	mov r9,  [rsp+8*6]
	mov [r8],r9
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*46],r10
	mov r10,  [rsp+8*32]
	mov r8,r10
	mov r11,  [rsp+8*5]
	lea r9,[r8+r11*8+8H]
	mov r8, [r9]
	mov r11,  [rsp+8*6]
	lea r9,[r8+r11*8+8H]
	mov qword [rsp+8*48],r8
	mov r8,0
	mov [r9],r8
	mov qword [rsp+8*49],r9
	
L_767:
	mov r8,  [rsp+8*3]
	mov r9,  [rsp+8*4]
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*50],r10
	je L_768
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*51],r8
	mov r8, [r11]
	mov qword [rsp+8*52],r11
	mov r9,  [rsp+8*26]
	mov r11,r9
	mov qword [rsp+8*53],r8
	lea r8,[r11+r10*8+8H]
	mov qword [rsp+8*54],r11
	mov r11, [r8]
	mov qword [rsp+8*55],r8
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*53]
	mov qword [rsp+8*56],r11
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r10,  [rsp+8*56]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*57],r8
	mov r8, [r11]
	mov r10,r8
	mov qword [rsp+8*59],r8
	mov qword [rsp+8*58],r11
	mov r11,  [rsp+8*17]
	mov r8,r11
	mov r9,  [rsp+8*3]
	mov qword [rsp+8*13],r10
	lea r10,[r8+r9*8+8H]
	mov qword [rsp+8*60],r8
	mov r8, [r10]
	mov qword [rsp+8*61],r10
	mov r10,1
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*62],r8
	mov r8,r11
	mov r11,  [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*11],r8
	lea r8,[r10+r9*8+8H]
	mov qword [rsp+8*64],r10
	mov r10, [r8]
	mov qword [rsp+8*65],r8
	mov r8,2
	mov r11,r10
	sub r11,r8
	mov r8,r11
	mov qword [rsp+8*66],r10
	mov r11,  [rsp+8*2]
	mov r10,r11
	mov qword [rsp+8*12],r8
	mov r8,  [rsp+8*11]
	mov r9,r8
	mov qword rsi,r10
	mov r10,r9
	mov r8,  rsi
	mov r11,r8
	cmp r10,r11
	mov qword rdi,r9
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*72],r9
	mov qword [rsp+8*70],r10
	mov qword [rsp+8*71],r11
	jne L_857
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_858
	
L_857:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_858:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*75],r10
	jne L_769
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_770
	
L_769:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
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
	mov qword [rsp+8*70],r8
	mov qword [rsp+8*71],r9
	mov qword [rsp+8*72],r10
	jne L_861
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_862
	
L_861:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_862:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*77],r10
	mov qword [rsp+8*76],r11
	
L_770:
	mov r8,  [rsp+8*76]
	cmp r8, 0
	je L_772
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*78],r8
	mov r8, [r11]
	mov qword [rsp+8*79],r11
	mov r11,1
	mov r10,r11
	neg r10
	cmp r8,r10
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*80],r8
	mov qword [rsp+8*81],r10
	mov qword [rsp+8*82],r11
	je L_774
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	lea r10,[r11+r8*8+8H]
	mov qword [rsp+8*84],r11
	mov r11,  [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*85],r10
	mov r9,  [rsp+8*26]
	mov r10,r9
	lea r11,[r10+r8*8+8H]
	mov qword [rsp+8*86],r10
	mov r10,  [rsp+8*12]
	mov [r11],r10
	mov qword [rsp+8*87],r11
	mov r11,  [rsp+8*13]
	mov r9,1
	mov qword [rsp+8*4],r8
	mov r8,r11
	add r8,r9
	mov r10,  [rsp+8*32]
	mov r9,r10
	mov qword [rsp+8*88],r8
	mov r8,  [rsp+8*11]
	lea r11,[r9+r8*8+8H]
	mov r9, [r11]
	mov r10,  [rsp+8*12]
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*89],r9
	mov r9,  [rsp+8*88]
	mov [r11],r9
	mov r9,  [rsp+8*8]
	cmp r8,r9
	mov qword [rsp+8*90],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*91],r11
	jne L_775
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*91],r8
	jmp L_776
	
L_775:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*92],r10
	mov qword [rsp+8*91],r11
	
L_776:
	mov r8,  [rsp+8*91]
	cmp r8, 0
	je L_778
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_778:
	
L_774:
	
L_772:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*93],r8
	mov r8, [r11]
	mov qword [rsp+8*94],r11
	mov r11,1
	mov r9,r8
	sub r9,r11
	mov qword [rsp+8*95],r8
	mov r8,r9
	mov r11,  [rsp+8*26]
	mov r9,r11
	mov qword [rsp+8*11],r8
	lea r8,[r9+r10*8+8H]
	mov qword [rsp+8*97],r9
	mov r9, [r8]
	mov qword [rsp+8*98],r8
	mov r8,2
	mov r11,r9
	add r11,r8
	mov r8,r11
	mov qword [rsp+8*99],r9
	mov r11,  [rsp+8*2]
	mov r9,r11
	mov qword [rsp+8*12],r8
	mov r8,  [rsp+8*11]
	mov r10,r8
	mov qword rsi,r9
	mov r9,r10
	mov r8,  rsi
	mov r11,r8
	cmp r9,r11
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*70],r9
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*71],r11
	jne L_865
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_866
	
L_865:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_866:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*101],r10
	jne L_779
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*102],r8
	jmp L_780
	
L_779:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
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
	mov qword [rsp+8*70],r8
	mov qword [rsp+8*71],r9
	mov qword [rsp+8*72],r10
	jne L_869
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_870
	
L_869:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_870:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*103],r10
	mov qword [rsp+8*102],r11
	
L_780:
	mov r8,  [rsp+8*102]
	cmp r8, 0
	je L_782
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*104],r8
	mov r8, [r11]
	mov qword [rsp+8*105],r11
	mov r11,1
	mov r10,r11
	neg r10
	cmp r8,r10
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*106],r8
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*108],r11
	je L_784
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	lea r10,[r11+r8*8+8H]
	mov qword [rsp+8*110],r11
	mov r11,  [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*111],r10
	mov r9,  [rsp+8*26]
	mov r10,r9
	lea r11,[r10+r8*8+8H]
	mov qword [rsp+8*112],r10
	mov r10,  [rsp+8*12]
	mov [r11],r10
	mov qword [rsp+8*113],r11
	mov r11,  [rsp+8*13]
	mov r9,1
	mov qword [rsp+8*4],r8
	mov r8,r11
	add r8,r9
	mov r10,  [rsp+8*32]
	mov r9,r10
	mov qword [rsp+8*114],r8
	mov r8,  [rsp+8*11]
	lea r11,[r9+r8*8+8H]
	mov r9, [r11]
	mov r10,  [rsp+8*12]
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*115],r9
	mov r9,  [rsp+8*114]
	mov [r11],r9
	mov r9,  [rsp+8*8]
	cmp r8,r9
	mov qword [rsp+8*116],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*117],r11
	jne L_785
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*117],r8
	jmp L_786
	
L_785:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*118],r10
	mov qword [rsp+8*117],r11
	
L_786:
	mov r8,  [rsp+8*117]
	cmp r8, 0
	je L_788
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_788:
	
L_784:
	
L_782:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*119],r8
	mov r8, [r11]
	mov qword [rsp+8*120],r11
	mov r11,1
	mov r9,r8
	add r9,r11
	mov qword [rsp+8*121],r8
	mov r8,r9
	mov r11,  [rsp+8*26]
	mov r9,r11
	mov qword [rsp+8*11],r8
	lea r8,[r9+r10*8+8H]
	mov qword [rsp+8*123],r9
	mov r9, [r8]
	mov qword [rsp+8*124],r8
	mov r8,2
	mov r11,r9
	sub r11,r8
	mov r8,r11
	mov qword [rsp+8*125],r9
	mov r11,  [rsp+8*2]
	mov r9,r11
	mov qword [rsp+8*12],r8
	mov r8,  [rsp+8*11]
	mov r10,r8
	mov qword rsi,r9
	mov r9,r10
	mov r8,  rsi
	mov r11,r8
	cmp r9,r11
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*70],r9
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*71],r11
	jne L_873
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_874
	
L_873:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_874:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*127],r10
	jne L_789
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*128],r8
	jmp L_790
	
L_789:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
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
	mov qword [rsp+8*70],r8
	mov qword [rsp+8*71],r9
	mov qword [rsp+8*72],r10
	jne L_877
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_878
	
L_877:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_878:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*129],r10
	mov qword [rsp+8*128],r11
	
L_790:
	mov r8,  [rsp+8*128]
	cmp r8, 0
	je L_792
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*130],r8
	mov r8, [r11]
	mov qword [rsp+8*131],r11
	mov r11,1
	mov r10,r11
	neg r10
	cmp r8,r10
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*132],r8
	mov qword [rsp+8*133],r10
	mov qword [rsp+8*134],r11
	je L_794
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	lea r10,[r11+r8*8+8H]
	mov qword [rsp+8*136],r11
	mov r11,  [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*137],r10
	mov r9,  [rsp+8*26]
	mov r10,r9
	lea r11,[r10+r8*8+8H]
	mov qword [rsp+8*138],r10
	mov r10,  [rsp+8*12]
	mov [r11],r10
	mov qword [rsp+8*139],r11
	mov r11,  [rsp+8*13]
	mov r9,1
	mov qword [rsp+8*4],r8
	mov r8,r11
	add r8,r9
	mov r10,  [rsp+8*32]
	mov r9,r10
	mov qword [rsp+8*140],r8
	mov r8,  [rsp+8*11]
	lea r11,[r9+r8*8+8H]
	mov r9, [r11]
	mov r10,  [rsp+8*12]
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*141],r9
	mov r9,  [rsp+8*140]
	mov [r11],r9
	mov r9,  [rsp+8*8]
	cmp r8,r9
	mov qword [rsp+8*142],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*143],r11
	jne L_795
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*143],r8
	jmp L_796
	
L_795:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*144],r10
	mov qword [rsp+8*143],r11
	
L_796:
	mov r8,  [rsp+8*143]
	cmp r8, 0
	je L_798
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_798:
	
L_794:
	
L_792:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*145],r8
	mov r8, [r11]
	mov qword [rsp+8*146],r11
	mov r11,1
	mov r9,r8
	add r9,r11
	mov qword [rsp+8*147],r8
	mov r8,r9
	mov r11,  [rsp+8*26]
	mov r9,r11
	mov qword [rsp+8*11],r8
	lea r8,[r9+r10*8+8H]
	mov qword [rsp+8*149],r9
	mov r9, [r8]
	mov qword [rsp+8*150],r8
	mov r8,2
	mov r11,r9
	add r11,r8
	mov r8,r11
	mov qword [rsp+8*151],r9
	mov r11,  [rsp+8*2]
	mov r9,r11
	mov qword [rsp+8*12],r8
	mov r8,  [rsp+8*11]
	mov r10,r8
	mov qword rsi,r9
	mov r9,r10
	mov r8,  rsi
	mov r11,r8
	cmp r9,r11
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*70],r9
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*71],r11
	jne L_881
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_882
	
L_881:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_882:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*153],r10
	jne L_799
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*154],r8
	jmp L_800
	
L_799:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
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
	mov qword [rsp+8*70],r8
	mov qword [rsp+8*71],r9
	mov qword [rsp+8*72],r10
	jne L_885
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_886
	
L_885:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_886:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*155],r10
	mov qword [rsp+8*154],r11
	
L_800:
	mov r8,  [rsp+8*154]
	cmp r8, 0
	je L_802
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*156],r8
	mov r8, [r11]
	mov qword [rsp+8*157],r11
	mov r11,1
	mov r10,r11
	neg r10
	cmp r8,r10
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*158],r8
	mov qword [rsp+8*159],r10
	mov qword [rsp+8*160],r11
	je L_804
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	lea r10,[r11+r8*8+8H]
	mov qword [rsp+8*162],r11
	mov r11,  [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*163],r10
	mov r9,  [rsp+8*26]
	mov r10,r9
	lea r11,[r10+r8*8+8H]
	mov qword [rsp+8*164],r10
	mov r10,  [rsp+8*12]
	mov [r11],r10
	mov qword [rsp+8*165],r11
	mov r11,  [rsp+8*13]
	mov r9,1
	mov qword [rsp+8*4],r8
	mov r8,r11
	add r8,r9
	mov r10,  [rsp+8*32]
	mov r9,r10
	mov qword [rsp+8*166],r8
	mov r8,  [rsp+8*11]
	lea r11,[r9+r8*8+8H]
	mov r9, [r11]
	mov r10,  [rsp+8*12]
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*167],r9
	mov r9,  [rsp+8*166]
	mov [r11],r9
	mov r9,  [rsp+8*8]
	cmp r8,r9
	mov qword [rsp+8*168],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*169],r11
	jne L_805
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*169],r8
	jmp L_806
	
L_805:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*170],r10
	mov qword [rsp+8*169],r11
	
L_806:
	mov r8,  [rsp+8*169]
	cmp r8, 0
	je L_808
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_808:
	
L_804:
	
L_802:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*171],r8
	mov r8, [r11]
	mov qword [rsp+8*172],r11
	mov r11,2
	mov r9,r8
	sub r9,r11
	mov qword [rsp+8*173],r8
	mov r8,r9
	mov r11,  [rsp+8*26]
	mov r9,r11
	mov qword [rsp+8*11],r8
	lea r8,[r9+r10*8+8H]
	mov qword [rsp+8*175],r9
	mov r9, [r8]
	mov qword [rsp+8*176],r8
	mov r8,1
	mov r11,r9
	sub r11,r8
	mov r8,r11
	mov qword [rsp+8*177],r9
	mov r11,  [rsp+8*2]
	mov r9,r11
	mov qword [rsp+8*12],r8
	mov r8,  [rsp+8*11]
	mov r10,r8
	mov qword rsi,r9
	mov r9,r10
	mov r8,  rsi
	mov r11,r8
	cmp r9,r11
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*70],r9
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*71],r11
	jne L_889
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_890
	
L_889:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_890:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*179],r10
	jne L_809
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*180],r8
	jmp L_810
	
L_809:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
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
	mov qword [rsp+8*70],r8
	mov qword [rsp+8*71],r9
	mov qword [rsp+8*72],r10
	jne L_893
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_894
	
L_893:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_894:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*181],r10
	mov qword [rsp+8*180],r11
	
L_810:
	mov r8,  [rsp+8*180]
	cmp r8, 0
	je L_812
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*182],r8
	mov r8, [r11]
	mov qword [rsp+8*183],r11
	mov r11,1
	mov r10,r11
	neg r10
	cmp r8,r10
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*184],r8
	mov qword [rsp+8*185],r10
	mov qword [rsp+8*186],r11
	je L_814
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	lea r10,[r11+r8*8+8H]
	mov qword [rsp+8*188],r11
	mov r11,  [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*189],r10
	mov r9,  [rsp+8*26]
	mov r10,r9
	lea r11,[r10+r8*8+8H]
	mov qword [rsp+8*190],r10
	mov r10,  [rsp+8*12]
	mov [r11],r10
	mov qword [rsp+8*191],r11
	mov r11,  [rsp+8*13]
	mov r9,1
	mov qword [rsp+8*4],r8
	mov r8,r11
	add r8,r9
	mov r10,  [rsp+8*32]
	mov r9,r10
	mov qword [rsp+8*192],r8
	mov r8,  [rsp+8*11]
	lea r11,[r9+r8*8+8H]
	mov r9, [r11]
	mov r10,  [rsp+8*12]
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*193],r9
	mov r9,  [rsp+8*192]
	mov [r11],r9
	mov r9,  [rsp+8*8]
	cmp r8,r9
	mov qword [rsp+8*194],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*195],r11
	jne L_815
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*195],r8
	jmp L_816
	
L_815:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*196],r10
	mov qword [rsp+8*195],r11
	
L_816:
	mov r8,  [rsp+8*195]
	cmp r8, 0
	je L_818
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_818:
	
L_814:
	
L_812:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*197],r8
	mov r8, [r11]
	mov qword [rsp+8*198],r11
	mov r11,2
	mov r9,r8
	sub r9,r11
	mov qword [rsp+8*199],r8
	mov r8,r9
	mov r11,  [rsp+8*26]
	mov r9,r11
	mov qword [rsp+8*11],r8
	lea r8,[r9+r10*8+8H]
	mov qword [rsp+8*201],r9
	mov r9, [r8]
	mov qword [rsp+8*202],r8
	mov r8,1
	mov r11,r9
	add r11,r8
	mov r8,r11
	mov qword [rsp+8*203],r9
	mov r11,  [rsp+8*2]
	mov r9,r11
	mov qword [rsp+8*12],r8
	mov r8,  [rsp+8*11]
	mov r10,r8
	mov qword rsi,r9
	mov r9,r10
	mov r8,  rsi
	mov r11,r8
	cmp r9,r11
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*70],r9
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*71],r11
	jne L_897
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_898
	
L_897:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_898:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*205],r10
	jne L_819
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*206],r8
	jmp L_820
	
L_819:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
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
	mov qword [rsp+8*70],r8
	mov qword [rsp+8*71],r9
	mov qword [rsp+8*72],r10
	jne L_901
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_902
	
L_901:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_902:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*207],r10
	mov qword [rsp+8*206],r11
	
L_820:
	mov r8,  [rsp+8*206]
	cmp r8, 0
	je L_822
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*208],r8
	mov r8, [r11]
	mov qword [rsp+8*209],r11
	mov r11,1
	mov r10,r11
	neg r10
	cmp r8,r10
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*210],r8
	mov qword [rsp+8*211],r10
	mov qword [rsp+8*212],r11
	je L_824
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	lea r10,[r11+r8*8+8H]
	mov qword [rsp+8*214],r11
	mov r11,  [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*215],r10
	mov r9,  [rsp+8*26]
	mov r10,r9
	lea r11,[r10+r8*8+8H]
	mov qword [rsp+8*216],r10
	mov r10,  [rsp+8*12]
	mov [r11],r10
	mov qword [rsp+8*217],r11
	mov r11,  [rsp+8*13]
	mov r9,1
	mov qword [rsp+8*4],r8
	mov r8,r11
	add r8,r9
	mov r10,  [rsp+8*32]
	mov r9,r10
	mov qword [rsp+8*218],r8
	mov r8,  [rsp+8*11]
	lea r11,[r9+r8*8+8H]
	mov r9, [r11]
	mov r10,  [rsp+8*12]
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*219],r9
	mov r9,  [rsp+8*218]
	mov [r11],r9
	mov r9,  [rsp+8*8]
	cmp r8,r9
	mov qword [rsp+8*220],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*221],r11
	jne L_825
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*221],r8
	jmp L_826
	
L_825:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*222],r10
	mov qword [rsp+8*221],r11
	
L_826:
	mov r8,  [rsp+8*221]
	cmp r8, 0
	je L_828
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_828:
	
L_824:
	
L_822:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*223],r8
	mov r8, [r11]
	mov qword [rsp+8*224],r11
	mov r11,2
	mov r9,r8
	add r9,r11
	mov qword [rsp+8*225],r8
	mov r8,r9
	mov r11,  [rsp+8*26]
	mov r9,r11
	mov qword [rsp+8*11],r8
	lea r8,[r9+r10*8+8H]
	mov qword [rsp+8*227],r9
	mov r9, [r8]
	mov qword [rsp+8*228],r8
	mov r8,1
	mov r11,r9
	sub r11,r8
	mov r8,r11
	mov qword [rsp+8*229],r9
	mov r11,  [rsp+8*2]
	mov r9,r11
	mov qword [rsp+8*12],r8
	mov r8,  [rsp+8*11]
	mov r10,r8
	mov qword rsi,r9
	mov r9,r10
	mov r8,  rsi
	mov r11,r8
	cmp r9,r11
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*70],r9
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*71],r11
	jne L_905
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_906
	
L_905:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_906:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*231],r10
	jne L_829
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*232],r8
	jmp L_830
	
L_829:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
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
	mov qword [rsp+8*70],r8
	mov qword [rsp+8*71],r9
	mov qword [rsp+8*72],r10
	jne L_909
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_910
	
L_909:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_910:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*233],r10
	mov qword [rsp+8*232],r11
	
L_830:
	mov r8,  [rsp+8*232]
	cmp r8, 0
	je L_832
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*234],r8
	mov r8, [r11]
	mov qword [rsp+8*235],r11
	mov r11,1
	mov r10,r11
	neg r10
	cmp r8,r10
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*236],r8
	mov qword [rsp+8*237],r10
	mov qword [rsp+8*238],r11
	je L_834
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	lea r10,[r11+r8*8+8H]
	mov qword [rsp+8*240],r11
	mov r11,  [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*241],r10
	mov r9,  [rsp+8*26]
	mov r10,r9
	lea r11,[r10+r8*8+8H]
	mov qword [rsp+8*242],r10
	mov r10,  [rsp+8*12]
	mov [r11],r10
	mov qword [rsp+8*243],r11
	mov r11,  [rsp+8*13]
	mov r9,1
	mov qword [rsp+8*4],r8
	mov r8,r11
	add r8,r9
	mov r10,  [rsp+8*32]
	mov r9,r10
	mov qword [rsp+8*244],r8
	mov r8,  [rsp+8*11]
	lea r11,[r9+r8*8+8H]
	mov r9, [r11]
	mov r10,  [rsp+8*12]
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*245],r9
	mov r9,  [rsp+8*244]
	mov [r11],r9
	mov r9,  [rsp+8*8]
	cmp r8,r9
	mov qword [rsp+8*246],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*247],r11
	jne L_835
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*247],r8
	jmp L_836
	
L_835:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*248],r10
	mov qword [rsp+8*247],r11
	
L_836:
	mov r8,  [rsp+8*247]
	cmp r8, 0
	je L_838
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_838:
	
L_834:
	
L_832:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*249],r8
	mov r8, [r11]
	mov qword [rsp+8*250],r11
	mov r11,2
	mov r9,r8
	add r9,r11
	mov qword [rsp+8*251],r8
	mov r8,r9
	mov r11,  [rsp+8*26]
	mov r9,r11
	mov qword [rsp+8*11],r8
	lea r8,[r9+r10*8+8H]
	mov qword [rsp+8*253],r9
	mov r9, [r8]
	mov qword [rsp+8*254],r8
	mov r8,1
	mov r11,r9
	add r11,r8
	mov r8,r11
	mov qword [rsp+8*255],r9
	mov r11,  [rsp+8*2]
	mov r9,r11
	mov qword [rsp+8*12],r8
	mov r8,  [rsp+8*11]
	mov r10,r8
	mov qword rsi,r9
	mov r9,r10
	mov r8,  rsi
	mov r11,r8
	cmp r9,r11
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*70],r9
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*71],r11
	jne L_913
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_914
	
L_913:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_914:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*257],r10
	jne L_839
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*258],r8
	jmp L_840
	
L_839:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
	mov r10,r11
	mov r9,r10
	mov qword rsi,r8
	mov r11,  rsi
	mov r8,r11
	cmp r9,r8
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*71],r8
	mov qword [rsp+8*70],r9
	mov qword rdi,r10
	mov qword [rsp+8*72],r11
	jne L_917
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_918
	
L_917:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_918:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*259],r10
	mov qword [rsp+8*258],r11
	
L_840:
	mov r8,  [rsp+8*258]
	cmp r8, 0
	je L_842
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*260],r8
	mov r8, [r11]
	mov qword [rsp+8*261],r11
	mov r11,1
	mov r10,r11
	neg r10
	cmp r8,r10
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*262],r8
	mov qword [rsp+8*263],r10
	mov qword [rsp+8*264],r11
	je L_844
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	lea r9,[r11+r8*8+8H]
	mov r10,  [rsp+8*11]
	mov [r9],r10
	mov qword [rsp+8*267],r9
	mov qword [rsp+8*266],r11
	mov r11,  [rsp+8*26]
	mov r9,r11
	lea r11,[r9+r8*8+8H]
	mov qword [rsp+8*4],r8
	mov r8,  [rsp+8*12]
	mov [r11],r8
	mov qword [rsp+8*268],r9
	mov r9,  [rsp+8*13]
	mov qword [rsp+8*269],r11
	mov r11,1
	mov r10,r9
	add r10,r11
	mov r11,  [rsp+8*32]
	mov r9,r11
	mov r8,  [rsp+8*11]
	mov qword [rsp+8*270],r10
	lea r10,[r9+r8*8+8H]
	mov r9, [r10]
	mov r11,  [rsp+8*12]
	lea r10,[r9+r11*8+8H]
	mov qword [rsp+8*271],r9
	mov r9,  [rsp+8*270]
	mov [r10],r9
	mov r9,  [rsp+8*8]
	cmp r8,r9
	mov qword [rsp+8*272],r10
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*273],r10
	jne L_845
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*273],r8
	jmp L_846
	
L_845:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*274],r10
	mov qword [rsp+8*273],r11
	
L_846:
	mov r8,  [rsp+8*273]
	cmp r8, 0
	je L_848
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_848:
	
L_844:
	
L_842:
	mov r8,  [rsp+8*14]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*275],r10
	je L_850
	jmp L_768
	
L_850:
	mov r8,  [rsp+8*3]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov qword [rsp+8*3],r8
	mov qword [rsp+8*276],r10
	jmp L_767
	
L_768:
	mov r8,  [rsp+8*14]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*277],r10
	je L_851
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*8]
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*10]
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*278],r8
	mov r8, [r11]
	mov r9,r8
	mov qword [rsp+8*280],r8
	mov r8,r9
	mov qword [rsp+8*281],r8
	mov qword rdi,r9
	mov qword [rsp+8*279],r11
	mov     rdi, [rsp+8*281]
	call    toString
	mov     qword[rsp+8*282], rax
	mov r9,  [rsp+8*282]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*283],r10
	mov rdi,[rsp+8*283] 
	add rdi, 1 
	call puts
	jmp L_852
	
L_851:
	mov r9,t442
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*284],r10
	mov rdi,[rsp+8*284] 
	add rdi, 1 
	call puts
	
L_852:
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2344
	mov r8,  [rsp+8*285]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   4328
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
	
t442:
	 db 12,"no solution!" ,0


