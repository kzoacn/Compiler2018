	 global    main
	 extern    puts
	 extern    printf
	 extern    scanf
	 extern    malloc
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
        jnz     L_001
        mov     qword [rbp-8H], 1
L_001:  cmp     qword [rbp-38H], 0
        jns     L_002
        neg     qword [rbp-38H]
        mov     qword [rbp-10H], -1
        add     qword [rbp-8H], 1
L_002:  mov     rax, qword [rbp-38H]
        mov     qword [rbp-18H], rax
        jmp     L_004

L_003:  add     qword [rbp-8H], 1
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
L_004:  cmp     qword [rbp-18H], 0
        jg      L_003
        mov     rax, qword [rbp-8H]
        add     rax, 2
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-28H], rax
        mov     rax, qword [rbp-28H]
        mov     qword [rbp-20H], rax
        mov     rax, qword [rbp-8H]
        mov     edx, eax
        mov     rax, qword [rbp-20H]
        mov     byte [rax], dl
        add     qword [rbp-20H], 1
        cmp     qword [rbp-10H], -1
        jnz     L_005
        mov     rax, qword [rbp-20H]
        mov     byte [rax], 45
L_005:  mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-28H]
        add     rax, rdx
        mov     qword [rbp-20H], rax
        cmp     qword [rbp-38H], 0
        jnz     L_006
        mov     rax, qword [rbp-20H]
        mov     byte [rax], 48
        jmp     L_008

L_006:  jmp     L_008

L_007:  mov     rcx, qword [rbp-38H]
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
        add     eax, 48
        mov     edx, eax
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
L_008:  cmp     qword [rbp-38H], 0
        jg      L_007
        mov     rax, qword [rbp-28H]
        leave
        ret

mallocArray:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword [rbp-18H], rdi
        mov     rax, qword [rbp-18H]
        add     rax, 1
        shl     rax, 3
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-18H]
        add     rax, 1
        shl     rax, 3
        mov     rdx, rax
        mov     rax, qword [rbp-8H]
        mov     esi, 0
        mov     rdi, rax
        call    memset
        mov     rax, qword [rbp-8H]
        mov     rdx, qword [rbp-18H]
        mov     qword [rax], rdx
        mov     rax, qword [rbp-8H]
        leave
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
        jmp     md_2

md_1:  add     qword [rbp-10H], 1
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
md_2:  mov     rax, qword [rbp-28H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      md_1
        mov     qword [rbp-8H], 0
        jmp     md_4

md_3:  add     qword [rbp-10H], 1
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
md_4:  mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      md_3
        add     qword [rbp-10H], 1
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        mov     byte [rax], 0
        mov     rax, qword [rbp-18H]
        leave
        ret

address:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        add     rax, 1
        lea     rdx, [rax*8]
        mov     rax, qword [rbp-8H]
        add     rax, rdx
        pop     rbp
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
        jnz     md_9
        mov     eax, dword [rbp-34H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-40H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     rdi, rax
        call    mallocArray
        jmp     mdd_012

md_9:  mov     eax, dword [rbp-34H]
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
        jmp     mdd_011

mdd_010:  mov     eax, dword [rbp-14H]
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
mdd_011:  mov     eax, dword [rbp-14H]
        cdqe
        cmp     rax, qword [rbp-20H]
        jl      mdd_010
        mov     rax, qword [rbp-28H]
mdd_012:  add     rsp, 56
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
        jnz     IDG5
        mov     rax, qword [rbp-28H]
        jmp     IDG8

IDG5:  mov     qword [rbp-8H], 1
        jmp     IDG7

IDG6:  mov     rax, qword [rbp-8H]
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
IDG7:  mov     rax, qword [rbp-8H]
        cmp     rax, qword [rbp-18H]
        jl      IDG6
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
IDG8:  leave
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
	mov r8 , rax
	mov r10,1
	mov r9,r10
	mov qword [rsp+8*1],r8
	mov r8,50
	mov r11,r8
	mov r10,1
	mov r8,r10
	mov qword [rsp+8*2],r9
	mov r9,50
	mov r10,r9
	mov qword [rsp+8*3],r11
	mov r11,1
	mov r9,r11
	mov qword [rsp+8*4],r8
	mov r8,20
	mov r11,r8
	mov qword [rsp+8*5],r10
	mov r10,30
	mov r8,r10
	mov qword [rsp+8*6],r9
	mov r9,0
	mov r10,r9
	mov qword [rsp+8*7],r11
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
	
L_1679:
	mov r8,  [rsp+8*13]
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*14],r10
	je L_1680
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov qword [rsp+8*15],r8
	
L_1682:
	mov r8,  [rsp+8*15]
	mov r9,  [rsp+8*5]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*16],r10
	je L_1683
	mov r9,  [rsp+8*6]
	mov r8,r9
	mov qword [rsp+8*17],r8
	
L_1685:
	mov r8,  [rsp+8*17]
	mov r9,  [rsp+8*7]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*18],r10
	je L_1686
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r11,  [rsp+8*8]
	mov r10,r11
	mov qword [arg+8*2],r8
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r9,r8
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov qword [rsp+8*22],r9
	mov r9,  [arg+8*2]
	mov r8,r9
	mov qword [rsp+8*23],r10
	mov r10,31
	mov r11,r8
	and r11,r10
	mov r9,r11
	mov qword [rsp+8*24],r8
	mov r10,  [rsp+8*23]
	mov r8,r10
	mov qword [rsp+8*26],r9
	mov qword [rsp+8*25],r11
	mov r11,  [rsp+8*22]
	mov r9,r11
	mov qword rsi,r8
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,1
	mov qword [rsp+8*28],r10
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*27],r8
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*29],r10
	mov qword [rsp+8*30],r11
	
L_2042:
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
	je L_2044
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
	mov r10,65535
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
	mov r11,r11
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
	mov r10,r10
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
	mov r11,65535
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
	mov r11,65535
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
	mov r10,r10
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
	jmp L_2042
	
L_2044:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r8,r11
	mov qword [rsp+8*59],r9
	mov qword [rsp+8*60],r10
	mov r10,  [rsp+8*26]
	mov r9,r10
	mov qword [rsp+8*62],r8
	mov qword [rsp+8*61],r11
	mov r11,  [rsp+8*62]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,r9
	mov rcx,r10
	shl r8,cl
	mov qword [rsp+8*36],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*34],r9
	mov qword [rsp+8*35],r10
	mov r10,65535
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
	mov r11,r11
	and r11,r8
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r8
	mov r8,32
	mov qword [rsp+8*36],r11
	mov r11,  [rsp+8*26]
	mov qword [rsp+8*42],r9
	mov r9,r8
	sub r9,r11
	mov qword [rsp+8*63],r10
	mov r10,r9
	mov r11,  [rsp+8*62]
	mov r8,r11
	mov qword [rsp+8*64],r9
	mov r9,r8
	mov qword rsi,r10
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
	mov r10,r10
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
	mov r11,65535
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
	mov r9,  [rsp+8*63]
	mov qword [rsp+8*52],r10
	mov r10,r9
	or r10,r8
	mov qword [rsp+8*53],r11
	mov r11,r10
	mov qword [rsp+8*65],r8
	mov r8,r11
	mov r9,r8
	mov qword [rsp+8*68],r8
	mov qword [rsp+8*66],r10
	mov r10,  [rsp+8*17]
	mov r8,r10
	mov qword [rsp+8*67],r11
	mov qword [rsp+8*69],r9
	mov r9,  [rsp+8*8]
	mov r11,r9
	mov qword [arg+8*2],r8
	mov r10,  [rsp+8*13]
	mov r8,r10
	mov r9,r8
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r8
	mov qword [rsp+8*22],r9
	mov r9,  [arg+8*2]
	mov r8,r9
	mov r10,31
	mov qword [rsp+8*23],r11
	mov r11,r8
	and r11,r10
	mov r9,r11
	mov qword [rsp+8*24],r8
	mov r10,  [rsp+8*23]
	mov r8,r10
	mov qword [rsp+8*26],r9
	mov qword [rsp+8*25],r11
	mov r11,  [rsp+8*22]
	mov r9,r11
	mov qword rsi,r8
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,1
	mov qword [rsp+8*28],r10
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*27],r8
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*29],r10
	mov qword [rsp+8*30],r11
	
L_2074:
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
	je L_2076
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
	mov r10,65535
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
	mov r11,r11
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
	mov r10,r10
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
	mov r11,65535
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
	mov r11,65535
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
	mov r10,r10
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
	jmp L_2074
	
L_2076:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r8,r11
	mov qword [rsp+8*59],r9
	mov qword [rsp+8*60],r10
	mov r10,  [rsp+8*26]
	mov r9,r10
	mov qword [rsp+8*62],r8
	mov qword [rsp+8*61],r11
	mov r11,  [rsp+8*62]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,r9
	mov rcx,r10
	shl r8,cl
	mov qword [rsp+8*36],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*34],r9
	mov qword [rsp+8*35],r10
	mov r10,65535
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
	mov r11,r11
	and r11,r8
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r8
	mov r8,32
	mov qword [rsp+8*36],r11
	mov r11,  [rsp+8*26]
	mov qword [rsp+8*42],r9
	mov r9,r8
	sub r9,r11
	mov qword [rsp+8*63],r10
	mov r10,r9
	mov r11,  [rsp+8*62]
	mov r8,r11
	mov qword [rsp+8*64],r9
	mov r9,r8
	mov qword rsi,r10
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
	mov r10,r10
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
	mov r11,65535
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
	mov r9,  [rsp+8*63]
	mov qword [rsp+8*52],r10
	mov r10,r9
	or r10,r8
	mov qword [rsp+8*53],r11
	mov r11,r10
	mov qword [rsp+8*65],r8
	mov r8,r11
	mov r9,r8
	mov qword [rsp+8*70],r8
	mov qword [rsp+8*66],r10
	mov r10,  [rsp+8*17]
	mov r8,r10
	mov qword [rsp+8*67],r11
	mov qword [rsp+8*71],r9
	mov r9,  [rsp+8*8]
	mov r11,r9
	mov qword [arg+8*2],r8
	mov r10,  [rsp+8*15]
	mov r8,r10
	mov r9,r8
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r8
	mov qword [rsp+8*22],r9
	mov r9,  [arg+8*2]
	mov r8,r9
	mov r10,31
	mov qword [rsp+8*23],r11
	mov r11,r8
	and r11,r10
	mov r9,r11
	mov qword [rsp+8*24],r8
	mov r10,  [rsp+8*23]
	mov r8,r10
	mov qword [rsp+8*26],r9
	mov qword [rsp+8*25],r11
	mov r11,  [rsp+8*22]
	mov r9,r11
	mov qword rsi,r8
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,1
	mov qword [rsp+8*28],r10
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*27],r8
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*29],r10
	mov qword [rsp+8*30],r11
	
L_2106:
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
	je L_2108
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
	mov r10,65535
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
	mov r11,r11
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
	mov r10,r10
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
	mov r11,65535
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
	mov r11,65535
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
	mov r10,r10
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
	jmp L_2106
	
L_2108:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r8,r11
	mov qword [rsp+8*59],r9
	mov qword [rsp+8*60],r10
	mov r10,  [rsp+8*26]
	mov r9,r10
	mov qword [rsp+8*62],r8
	mov qword [rsp+8*61],r11
	mov r11,  [rsp+8*62]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,r9
	mov rcx,r10
	shl r8,cl
	mov qword [rsp+8*36],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*34],r9
	mov qword [rsp+8*35],r10
	mov r10,65535
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
	mov r11,r11
	and r11,r8
	mov qword [rsp+8*39],r9
	mov r9,r11
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r8
	mov r8,32
	mov qword [rsp+8*36],r11
	mov r11,  [rsp+8*26]
	mov qword [rsp+8*42],r9
	mov r9,r8
	sub r9,r11
	mov qword [rsp+8*63],r10
	mov r10,r9
	mov r11,  [rsp+8*62]
	mov r8,r11
	mov qword [rsp+8*64],r9
	mov r9,r8
	mov qword rsi,r10
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
	mov r10,r10
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
	mov r11,65535
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
	mov r9,  [rsp+8*63]
	mov qword [rsp+8*52],r10
	mov r10,r9
	or r10,r8
	mov qword [rsp+8*53],r11
	mov r11,r10
	mov qword [rsp+8*65],r8
	mov r8,r11
	mov r9,r8
	mov qword [rsp+8*72],r8
	mov r8,  [rsp+8*13]
	mov qword [rsp+8*66],r10
	mov r10,  [rsp+8*15]
	mov qword [rsp+8*67],r11
	mov r11,r8
	xor r11,r10
	mov qword [rsp+8*73],r9
	mov r8,  [rsp+8*17]
	mov r9,r8
	mov qword [rsp+8*74],r11
	mov r11,  [rsp+8*8]
	mov r10,r11
	mov r8,  [rsp+8*74]
	mov r11,r8
	mov r8,r11
	mov qword [arg+8*2],r9
	mov r9,r10
	mov qword [rsp+8*22],r8
	mov qword rdi,r11
	mov r11,  [arg+8*2]
	mov r8,r11
	mov r11,31
	mov qword [rsp+8*23],r9
	mov r9,r8
	and r9,r11
	mov qword [rsp+8*24],r8
	mov r8,r9
	mov r9,  [rsp+8*23]
	mov r10,r9
	mov r11,  [rsp+8*22]
	mov r9,r11
	mov r11,r9
	mov qword [rsp+8*26],r8
	mov r8,r10
	mov qword rdi,r9
	mov r9,1
	mov qword [rsp+8*28],r8
	mov r8,r11
	add r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov qword [rsp+8*27],r11
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*29],r8
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*30],r10
	
L_2138:
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
	je L_2140
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
	mov r10,65535
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
	mov r11,r11
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
	mov r10,r10
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
	mov r11,65535
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
	mov r11,65535
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
	mov r10,r10
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
	jmp L_2138
	
L_2140:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r8,r11
	mov qword [rsp+8*61],r11
	mov qword [rsp+8*59],r9
	mov r9,  [rsp+8*26]
	mov r11,r9
	mov qword [rsp+8*60],r10
	mov r10,r8
	mov r9,r10
	mov qword rsi,r11
	mov qword [rsp+8*62],r8
	mov r8,  rsi
	mov r11,r8
	mov qword rdi,r10
	mov r10,r9
	mov rcx,r11
	shl r10,cl
	mov qword [rsp+8*34],r9
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*35],r11
	mov r11,65535
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
	mov r9,  [rsp+8*36]
	mov r9,r9
	and r9,r8
	mov qword [rsp+8*39],r10
	mov r10,r9
	mov qword [rsp+8*40],r11
	mov r11,r10
	mov qword [rsp+8*41],r8
	mov r8,32
	mov qword [rsp+8*36],r9
	mov r9,  [rsp+8*26]
	mov qword [rsp+8*42],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov r10,  [rsp+8*62]
	mov r9,r10
	mov r10,r9
	mov qword [rsp+8*63],r11
	mov r11,r8
	mov qword rdi,r9
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*45],r10
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
	mov r11,r11
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
	mov r11,65535
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
	mov qword [rsp+8*52],r9
	mov r9,r10
	or r9,r8
	mov qword [rsp+8*65],r8
	mov r8,r9
	mov r9,r8
	mov qword [rsp+8*67],r8
	mov r8,r9
	mov qword [rsp+8*75],r9
	mov r10,1
	mov r9,r10
	mov qword [rsp+8*53],r11
	mov r11,  [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*76],r8
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,1
	mov qword [rsp+8*28],r9
	mov r9,r8
	add r9,r10
	mov r11,r9
	mov qword [rsp+8*27],r8
	mov r10,0
	mov r8,r10
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*29],r9
	mov qword [rsp+8*30],r11
	
L_1850:
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
	je L_1852
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
	mov r10,65535
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
	mov r11,r11
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
	mov r10,r10
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
	mov r11,65535
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
	mov r11,65535
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
	mov r10,r10
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
	jmp L_1850
	
L_1852:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov qword [rsp+8*59],r9
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*60],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov qword [rsp+8*77],r11
	mov r11,r9
	mov qword rsi,r8
	mov r10,  rsi
	mov r8,r10
	mov qword rdi,r9
	mov r9,1
	mov qword [rsp+8*28],r8
	mov r8,r11
	add r8,r9
	mov r10,r8
	mov qword [rsp+8*27],r11
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*29],r8
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*30],r10
	
L_1870:
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
	je L_1872
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
	mov r10,65535
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
	mov r11,r11
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
	mov r10,r10
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
	mov r11,65535
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
	mov r11,65535
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
	mov r10,r10
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
	jmp L_1870
	
L_1872:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r8,  [rsp+8*77]
	mov qword [rsp+8*59],r9
	mov r9,r8
	xor r9,r11
	mov qword [rsp+8*78],r11
	mov r11,1
	mov r8,r11
	mov qword [rsp+8*60],r10
	mov r10,  [rsp+8*13]
	mov r11,r10
	mov qword [rsp+8*79],r9
	mov r9,r11
	mov qword rsi,r8
	mov r10,  rsi
	mov r8,r10
	mov qword rdi,r11
	mov r11,1
	mov qword [rsp+8*28],r8
	mov r8,r9
	add r8,r11
	mov r10,r8
	mov qword [rsp+8*27],r9
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*29],r8
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*30],r10
	
L_1890:
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
	je L_1892
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
	mov r10,65535
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
	mov r11,r11
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
	mov r10,r10
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
	mov r11,65535
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
	mov r11,65535
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
	mov r10,r10
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
	jmp L_1890
	
L_1892:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r8,  [rsp+8*79]
	mov r8,r8
	xor r8,r11
	mov qword [rsp+8*80],r11
	mov r11,r8
	mov r8,  [rsp+8*69]
	mov qword [rsp+8*59],r9
	mov r9,r8
	xor r9,r11
	mov qword [rsp+8*60],r10
	mov r10,1
	mov r8,r10
	mov r10,r9
	mov r9,r10
	mov qword [rsp+8*81],r11
	mov r11,r8
	mov qword rdi,r10
	mov r10,1
	mov qword rsi,r8
	mov r8,r9
	add r8,r10
	mov qword [rsp+8*28],r11
	mov r11,r8
	mov qword [rsp+8*27],r9
	mov r10,0
	mov r9,r10
	mov qword [rsp+8*29],r8
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*30],r11
	
L_1910:
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
	je L_1912
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
	mov r10,65535
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
	mov r11,r11
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
	mov r10,r10
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
	mov r11,65535
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
	mov r11,65535
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
	mov r10,r10
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
	jmp L_1910
	
L_1912:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r8,  [rsp+8*9]
	mov qword [rsp+8*59],r9
	mov r9,r8
	add r9,r11
	mov r8,r9
	mov r9,  [rsp+8*71]
	mov qword [rsp+8*83],r11
	mov r11,  [rsp+8*81]
	mov qword [rsp+8*60],r10
	mov r10,r9
	xor r10,r11
	mov qword [rsp+8*9],r8
	mov r8,1
	mov r9,r8
	mov r8,r10
	mov r10,r8
	mov r11,r9
	mov qword rdi,r8
	mov r8,1
	mov qword rsi,r9
	mov r9,r10
	add r9,r8
	mov qword [rsp+8*28],r11
	mov r11,r9
	mov qword [rsp+8*27],r10
	mov r10,0
	mov r8,r10
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*29],r9
	mov qword [rsp+8*30],r11
	
L_1930:
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
	je L_1932
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
	mov r10,65535
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
	mov r11,r11
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
	mov r10,r10
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
	mov r11,65535
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
	mov r11,65535
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
	mov r10,r10
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
	jmp L_1930
	
L_1932:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r8,  [rsp+8*10]
	mov qword [rsp+8*59],r9
	mov r9,r8
	add r9,r11
	mov r8,r9
	mov r9,  [rsp+8*73]
	mov qword [rsp+8*86],r11
	mov r11,  [rsp+8*81]
	mov qword [rsp+8*60],r10
	mov r10,r9
	xor r10,r11
	mov qword [rsp+8*10],r8
	mov r8,1
	mov r9,r8
	mov r8,r10
	mov r10,r8
	mov r11,r9
	mov qword rdi,r8
	mov r8,1
	mov qword rsi,r9
	mov r9,r10
	add r9,r8
	mov qword [rsp+8*28],r11
	mov r11,r9
	mov qword [rsp+8*27],r10
	mov r10,0
	mov r8,r10
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*29],r9
	mov qword [rsp+8*30],r11
	
L_1950:
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
	je L_1952
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
	mov r10,65535
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
	mov r11,r11
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
	mov r10,r10
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
	mov r11,65535
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
	mov r11,65535
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
	mov r10,r10
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
	jmp L_1950
	
L_1952:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r8,  [rsp+8*11]
	mov qword [rsp+8*59],r9
	mov r9,r8
	add r9,r11
	mov r8,r9
	mov r9,  [rsp+8*76]
	mov qword [rsp+8*89],r11
	mov r11,  [rsp+8*81]
	mov qword [rsp+8*60],r10
	mov r10,r9
	xor r10,r11
	mov r11,1
	mov r9,r11
	mov r11,r10
	mov r10,r11
	mov qword [rsp+8*11],r8
	mov r8,r9
	mov qword rdi,r11
	mov r11,1
	mov qword [rsp+8*28],r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*27],r10
	mov r10,r8
	mov r11,0
	mov r8,r11
	mov qword [rsp+8*31],r8
	mov qword rsi,r9
	mov qword [rsp+8*30],r10
	
L_1970:
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
	je L_1972
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
	mov r10,65535
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
	mov r11,r11
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
	mov r11,r11
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
	mov r11,65535
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
	mov r9,65535
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
	mov r9,r9
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
	jmp L_1970
	
L_1972:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r8,  [rsp+8*12]
	mov r9,r8
	add r9,r11
	mov r8,r9
	mov qword [rsp+8*60],r10
	mov r10,  [rsp+8*17]
	mov r9,r10
	inc r10 
	mov qword [rsp+8*12],r8
	mov qword [rsp+8*94],r9
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*92],r11
	jmp L_1685
	
L_1686:
	mov r9,  [rsp+8*15]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*95],r8
	mov qword [rsp+8*15],r9
	jmp L_1682
	
L_1683:
	mov r9,  [rsp+8*13]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*96],r8
	mov qword [rsp+8*13],r9
	jmp L_1679
	
L_1680:
	mov r9,  [rsp+8*9]
	mov r8,r9
	mov r10,r8
	mov r9,t127
	mov r11,r9
	mov qword rdi,r8
	mov qword [rsp+8*97],r10
	mov r10,28
	mov r8,r10
	mov qword [rsp+8*99],r8
	mov qword [rsp+8*98],r11
	
L_1762:
	mov r8,  [rsp+8*99]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*100],r10
	je L_1763
	mov r8,  [rsp+8*97]
	mov r9,  [rsp+8*99]
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	mov r11,15
	mov r10,r10
	and r10,r11
	mov r8,r10
	mov r9,10
	cmp r8,r9
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*102],r8
	mov qword [rsp+8*101],r10
	mov qword [rsp+8*103],r11
	je L_1764
	mov r8,48
	mov r9,  [rsp+8*102]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r8,r11
	mov r9,32
	cmp r8,r9
	mov qword [rsp+8*104],r10
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*106],r10
	mov qword rdi,r11
	jne L_1765
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1766
	
L_1765:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_1766:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1767
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
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1769
	
L_1767:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1769:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*115],r8
	mov     rsi, [rsp+8*115]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*116], rax
	mov r9,  [rsp+8*116]
	mov r8,r9
	mov qword [rsp+8*98],r8
	jmp L_1770
	
L_1764:
	mov r8,65
	mov r9,  [rsp+8*102]
	mov r10,r8
	add r10,r9
	mov r11,10
	mov r10,r10
	sub r10,r11
	mov r8,r10
	mov r9,r8
	mov r11,32
	cmp r9,r11
	mov qword [rsp+8*117],r10
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword rdi,r8
	mov qword [rsp+8*105],r9
	mov qword [rsp+8*106],r10
	jne L_1771
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1772
	
L_1771:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_1772:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1773
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
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1775
	
L_1773:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1775:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*118],r8
	mov     rsi, [rsp+8*118]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*119], rax
	mov r9,  [rsp+8*119]
	mov r8,r9
	mov qword [rsp+8*98],r8
	
L_1770:
	mov r8,  [rsp+8*99]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*99],r8
	mov qword [rsp+8*120],r10
	jmp L_1762
	
L_1763:
	mov r9,  [rsp+8*98]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*121],r8
	mov qword [rsp+8*122],r10
	mov     rsi, t222
	mov     rdi, [rsp+8*122]
	call    concat
	mov [rsp+8*123], rax
	mov r9,  [rsp+8*123]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*124],r10
	mov rdi, format
	mov rsi,[rsp+8*124] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r9,  [rsp+8*10]
	mov r8,r9
	mov r10,r8
	mov r9,t127
	mov r11,r9
	mov qword rdi,r8
	mov qword [rsp+8*97],r10
	mov r10,28
	mov r8,r10
	mov qword [rsp+8*99],r8
	mov qword [rsp+8*98],r11
	
L_1779:
	mov r8,  [rsp+8*99]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*100],r10
	je L_1780
	mov r8,  [rsp+8*97]
	mov r9,  [rsp+8*99]
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	mov r11,15
	mov r10,r10
	and r10,r11
	mov r8,r10
	mov r9,10
	cmp r8,r9
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*102],r8
	mov qword [rsp+8*101],r10
	mov qword [rsp+8*103],r11
	je L_1781
	mov r8,48
	mov r9,  [rsp+8*102]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r8,r11
	mov r9,32
	cmp r8,r9
	mov qword [rsp+8*104],r10
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*106],r10
	mov qword rdi,r11
	jne L_1782
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1783
	
L_1782:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_1783:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1784
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
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1786
	
L_1784:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1786:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*115],r8
	mov     rsi, [rsp+8*115]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*116], rax
	mov r9,  [rsp+8*116]
	mov r8,r9
	mov qword [rsp+8*98],r8
	jmp L_1787
	
L_1781:
	mov r8,65
	mov r9,  [rsp+8*102]
	mov r10,r8
	add r10,r9
	mov r11,10
	mov r10,r10
	sub r10,r11
	mov r8,r10
	mov r9,r8
	mov r11,32
	cmp r9,r11
	mov qword [rsp+8*117],r10
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword rdi,r8
	mov qword [rsp+8*105],r9
	mov qword [rsp+8*106],r10
	jne L_1788
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1789
	
L_1788:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_1789:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1790
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
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1792
	
L_1790:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1792:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*118],r8
	mov     rsi, [rsp+8*118]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*119], rax
	mov r9,  [rsp+8*119]
	mov r8,r9
	mov qword [rsp+8*98],r8
	
L_1787:
	mov r8,  [rsp+8*99]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*99],r8
	mov qword [rsp+8*120],r10
	jmp L_1779
	
L_1780:
	mov r9,  [rsp+8*98]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*121],r8
	mov qword [rsp+8*125],r10
	mov     rsi, t229
	mov     rdi, [rsp+8*125]
	call    concat
	mov [rsp+8*126], rax
	mov r9,  [rsp+8*126]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*127],r10
	mov rdi, format
	mov rsi,[rsp+8*127] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r9,  [rsp+8*11]
	mov r8,r9
	mov r10,r8
	mov r9,t127
	mov r11,r9
	mov qword rdi,r8
	mov qword [rsp+8*97],r10
	mov r10,28
	mov r8,r10
	mov qword [rsp+8*99],r8
	mov qword [rsp+8*98],r11
	
L_1796:
	mov r8,  [rsp+8*99]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*100],r10
	je L_1797
	mov r8,  [rsp+8*97]
	mov r9,  [rsp+8*99]
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	mov r11,15
	mov r10,r10
	and r10,r11
	mov r8,r10
	mov r9,10
	cmp r8,r9
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*102],r8
	mov qword [rsp+8*101],r10
	mov qword [rsp+8*103],r11
	je L_1798
	mov r8,48
	mov r9,  [rsp+8*102]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r8,r11
	mov r9,32
	cmp r8,r9
	mov qword [rsp+8*104],r10
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*106],r10
	mov qword rdi,r11
	jne L_1799
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1800
	
L_1799:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_1800:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1801
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
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1803
	
L_1801:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1803:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*115],r8
	mov     rsi, [rsp+8*115]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*116], rax
	mov r9,  [rsp+8*116]
	mov r8,r9
	mov qword [rsp+8*98],r8
	jmp L_1804
	
L_1798:
	mov r8,65
	mov r9,  [rsp+8*102]
	mov r10,r8
	add r10,r9
	mov r11,10
	mov r10,r10
	sub r10,r11
	mov r8,r10
	mov r9,r8
	mov r11,32
	cmp r9,r11
	mov qword [rsp+8*117],r10
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword rdi,r8
	mov qword [rsp+8*105],r9
	mov qword [rsp+8*106],r10
	jne L_1805
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1806
	
L_1805:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_1806:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1807
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
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1809
	
L_1807:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1809:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*118],r8
	mov     rsi, [rsp+8*118]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*119], rax
	mov r9,  [rsp+8*119]
	mov r8,r9
	mov qword [rsp+8*98],r8
	
L_1804:
	mov r8,  [rsp+8*99]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*99],r8
	mov qword [rsp+8*120],r10
	jmp L_1796
	
L_1797:
	mov r9,  [rsp+8*98]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*121],r8
	mov qword [rsp+8*128],r10
	mov     rsi, t236
	mov     rdi, [rsp+8*128]
	call    concat
	mov [rsp+8*129], rax
	mov r9,  [rsp+8*129]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*130],r10
	mov rdi, format
	mov rsi,[rsp+8*130] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r9,  [rsp+8*12]
	mov r8,r9
	mov r10,r8
	mov r9,t127
	mov r11,r9
	mov qword rdi,r8
	mov r8,28
	mov r9,r8
	mov qword [rsp+8*99],r9
	mov qword [rsp+8*97],r10
	mov qword [rsp+8*98],r11
	
L_1813:
	mov r8,  [rsp+8*99]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*100],r10
	je L_1814
	mov r8,  [rsp+8*97]
	mov r9,  [rsp+8*99]
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	mov r11,15
	mov r10,r10
	and r10,r11
	mov r8,r10
	mov r10,10
	cmp r8,r10
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*102],r8
	mov qword [rsp+8*103],r11
	je L_1815
	mov r8,48
	mov r9,  [rsp+8*102]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r8,r11
	mov r10,32
	cmp r8,r10
	mov r9, 0
	setge r9B
	cmp r9, 0
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*106],r9
	mov qword rdi,r11
	jne L_1816
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1817
	
L_1816:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_1817:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1818
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
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1820
	
L_1818:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1820:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*115],r8
	mov     rsi, [rsp+8*115]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*116], rax
	mov r9,  [rsp+8*116]
	mov r8,r9
	mov qword [rsp+8*98],r8
	jmp L_1821
	
L_1815:
	mov r8,65
	mov r9,  [rsp+8*102]
	mov r10,r8
	add r10,r9
	mov r11,10
	mov r10,r10
	sub r10,r11
	mov r8,r10
	mov r9,r8
	mov r10,32
	cmp r9,r10
	mov r11, 0
	setge r11B
	cmp r11, 0
	mov qword rdi,r8
	mov qword [rsp+8*105],r9
	mov qword [rsp+8*106],r11
	jne L_1822
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1823
	
L_1822:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*106],r11
	
L_1823:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1824
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
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1826
	
L_1824:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1826:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*118],r8
	mov     rsi, [rsp+8*118]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*119], rax
	mov r9,  [rsp+8*119]
	mov r8,r9
	mov qword [rsp+8*98],r8
	
L_1821:
	mov r8,  [rsp+8*99]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*99],r8
	mov qword [rsp+8*120],r10
	jmp L_1813
	
L_1814:
	mov r9,  [rsp+8*98]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*121],r8
	mov qword [rsp+8*131],r10
	mov     rsi, t243
	mov     rdi, [rsp+8*131]
	call    concat
	mov [rsp+8*132], rax
	mov r9,  [rsp+8*132]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*133],r10
	mov rdi, format
	mov rsi,[rsp+8*133] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r9,t248
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*134],r10
	mov rdi,[rsp+8*134] 
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


