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
	mov r8 , rax
	mov r10,110
	mov r9,r10
	mov r13,r9
	mov qword [rsp+8*1],r8
	mov qword rdi,r9
	mov     rdi,  r13
	call    mallocArray
	mov     qword [rsp+8*4], rax
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [gbl+8*5],r8
	mov qword [gbl+8*6],r10
	
L_1471:
	mov r8,  [gbl+8*6]
	cmp r8,r13
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*7],r9
	je L_1472
	mov     rdi,  r13
	call    mallocArray
	mov     qword [rsp+8*8], rax
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*6]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*9],r8
	mov r8,  [rsp+8*8]
	mov [r11],r8
	mov qword [rsp+8*10],r11
	mov r11,0
	mov r8,r11
	mov qword [gbl+8*11],r8
	
L_1473:
	mov r8,  [gbl+8*11]
	cmp r8,r13
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*12],r9
	je L_1474
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*6]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov r8, [r11]
	mov r9,  [gbl+8*11]
	mov r11,r9
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*13],r8
	mov r8,0
	mov [r11],r8
	mov r8,r9
	inc r9 
	mov qword [rsp+8*15],r8
	mov qword [gbl+8*11],r9
	mov qword [rsp+8*14],r11
	jmp L_1473
	
L_1474:
	mov r9,  [gbl+8*6]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*16],r8
	mov qword [gbl+8*6],r9
	jmp L_1471
	
L_1472:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,0
	mov r15,r11
	mov qword [rsp+8*17],r8
	mov r9,99
	mov r8,r9
	mov r9,100
	mov r14,r9
	mov qword [rsp+8*18],r10
	mov r10,0
	mov r9,r10
	mov r10,r14
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword rsi,r10
	mov qword [rsp+8*20],r8
	mov r8,  rsi
	mov r10,r8
	mov qword [rsp+8*24],r9
	mov qword rdi,r11
	mov r11,1
	mov r9,r11
	mov qword [gbl+8*6],r9
	mov qword [rsp+8*25],r10
	
L_1479:
	mov r8,  [gbl+8*6]
	mov r9,49
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*26],r10
	je L_1480
	mov r9,50
	mov r8,r9
	mov qword [gbl+8*11],r8
	
L_1481:
	mov r8,98
	mov r9,  [gbl+8*6]
	mov r10,r8
	sub r10,r9
	inc r10 
	mov r11,  [gbl+8*11]
	cmp r11,r10
	mov r10, 0
	setle r10B
	add r12,r12
	cmp r10, 0
	mov qword [rsp+8*27],r10
	je L_1483
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*6]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov r8, [r11]
	mov r9,  [gbl+8*11]
	mov r11,r9
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*29],r8
	mov r8,1
	mov [r11],r8
	mov r8,r9
	inc r9 
	mov qword [rsp+8*31],r8
	mov qword [gbl+8*11],r9
	mov qword [rsp+8*30],r11
	jmp L_1481
	
L_1483:
	mov r9,  [gbl+8*6]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*32],r8
	mov qword [gbl+8*6],r9
	jmp L_1479
	
L_1480:
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*6],r8
	
L_1486:
	mov r8,  [gbl+8*6]
	mov r9,49
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*33],r10
	je L_1487
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*24]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov r8, [r11]
	mov r10,  [gbl+8*6]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*34],r8
	mov r8,1
	mov [r11],r8
	mov r8,r10
	inc r10 
	mov qword [rsp+8*36],r8
	mov qword [gbl+8*6],r10
	mov qword [rsp+8*35],r11
	jmp L_1486
	
L_1487:
	mov r9,50
	mov r8,r9
	mov qword [gbl+8*6],r8
	
L_1489:
	mov r8,  [gbl+8*6]
	mov r9,98
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*37],r10
	je L_1490
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*6]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*25]
	mov r11,r9
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*38],r8
	mov r8,1
	mov [r11],r8
	mov r8,r10
	inc r10 
	mov qword [rsp+8*40],r8
	mov qword [gbl+8*6],r10
	mov qword [rsp+8*39],r11
	jmp L_1489
	
L_1490:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*41],r8
	mov qword [rsp+8*42],r10
	
L_1426:
	mov r9,  [rsp+8*22]
	mov r8,r9
	mov r11,  [rsp+8*20]
	mov r10,r11
	mov r9,r14
	mov r11,r9
	mov qword [arg+8*2],r8
	mov r8,r10
	mov qword rsi,r10
	mov qword rdi,r9
	mov r9,  [arg+8*2]
	mov r10,r9
	mov qword [rsp+8*44],r11
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*45],r8
	mov r8,1
	mov r11,r8
	mov qword [rsp+8*46],r10
	mov r10,1
	mov r8,r10
	mov qword [gbl+8*6],r8
	mov qword [gbl+8*47],r9
	mov qword [gbl+8*48],r11
	
L_1494:
	mov r8,  [gbl+8*6]
	mov r9,  [rsp+8*44]
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*49],r10
	je L_1495
	mov r9,  [gbl+8*50]
	mov r8,r9
	mov r10,  [gbl+8*6]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*51],r8
	mov r8,0
	mov [r11],r8
	mov r8,r10
	inc r10 
	mov qword [rsp+8*53],r8
	mov qword [gbl+8*6],r10
	mov qword [rsp+8*52],r11
	jmp L_1494
	
L_1495:
	mov r9,  [gbl+8*54]
	mov r8,r9
	mov r10,1
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*55],r8
	mov r8,  [rsp+8*45]
	mov [r11],r8
	mov qword [rsp+8*56],r11
	mov r11,  [gbl+8*50]
	mov r10,r11
	mov r9,r8
	add r9,1
	shl r9,3
	add r9,r10
	mov qword [rsp+8*57],r10
	mov r10,1
	mov [r9],r10
	mov qword [rsp+8*58],r9
	mov r10,  [gbl+8*59]
	mov r9,r10
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r9
	mov r8,0
	mov [r11],r8
	mov qword [rsp+8*60],r9
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*46],r8
	mov qword [rsp+8*61],r11
	
L_1497:
	mov r8,  [gbl+8*47]
	mov r9,  [gbl+8*48]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*62],r10
	jne L_1498
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*62],r8
	jmp L_1499
	
L_1498:
	mov r8,  [rsp+8*46]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*63],r10
	mov qword [rsp+8*62],r11
	
L_1499:
	mov r8,  [rsp+8*62]
	cmp r8, 0
	je L_1500
	mov r9,  [gbl+8*47]
	mov r8,r9
	inc r9 
	mov r11,  [gbl+8*54]
	mov r10,r11
	mov qword [rsp+8*64],r8
	mov r8,r9
	add r8,1
	shl r8,3
	add r8,r10
	mov qword [gbl+8*47],r9
	mov r9, [r8]
	mov qword [rsp+8*66],r8
	mov r8,r9
	mov qword [rsp+8*67],r9
	mov qword [rsp+8*65],r10
	mov r10,1
	mov r9,r10
	mov qword [gbl+8*6],r8
	mov qword [gbl+8*11],r9
	
L_1501:
	mov r8,  [gbl+8*11]
	mov r9,  [rsp+8*44]
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*68],r10
	je L_1502
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*6]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov r8, [r11]
	mov r9,  [gbl+8*11]
	mov r11,r9
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*69],r8
	mov r8, [r11]
	cmp r8,0
	mov qword [rsp+8*70],r11
	mov r11, 0
	setg r11B
	cmp r11, 0
	mov qword [rsp+8*71],r8
	mov qword [rsp+8*72],r11
	jne L_1503
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_1504
	
L_1503:
	mov r9,  [gbl+8*50]
	mov r8,r9
	mov r10,  [gbl+8*11]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
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
	
L_1504:
	mov r8,  [rsp+8*72]
	cmp r8, 0
	je L_1505
	mov r9,  [gbl+8*50]
	mov r8,r9
	mov r10,  [gbl+8*11]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*77],r8
	mov r8,1
	mov [r11],r8
	mov qword [rsp+8*78],r11
	mov r11,  [gbl+8*48]
	mov r8,r11
	inc r11 
	mov qword [rsp+8*79],r8
	mov r9,  [gbl+8*54]
	mov r8,r9
	mov r10,r11
	add r10,1
	shl r10,3
	add r10,r8
	mov qword [rsp+8*80],r8
	mov r8,  [gbl+8*11]
	mov [r10],r8
	mov qword [rsp+8*81],r10
	mov r9,  [gbl+8*59]
	mov r10,r9
	mov qword [gbl+8*48],r11
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r10
	mov qword [rsp+8*82],r10
	mov r10,  [gbl+8*6]
	mov [r11],r10
	mov qword [rsp+8*83],r11
	mov r11,  [gbl+8*48]
	mov r9,  [rsp+8*44]
	cmp r11,r9
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*84],r8
	je L_1506
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*46],r8
	
L_1506:
	
L_1505:
	mov r9,  [gbl+8*11]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*85],r8
	mov qword [gbl+8*11],r9
	jmp L_1501
	
L_1502:
	jmp L_1497
	
L_1500:
	mov r9,  [rsp+8*46]
	mov r8,r9
	mov r10,r8
	cmp r10,0
	mov r11, 0
	setg r11B
	cmp r11, 0
	mov qword [rsp+8*86],r8
	mov qword [rsp+8*87],r10
	mov qword [rsp+8*88],r11
	je L_1427
	mov r8,r14
	mov r9,r8
	mov r10,r9
	mov qword [rsp+8*89],r9
	mov r9,  [gbl+8*90]
	mov r11,r9
	inc r9 
	mov qword rdi,r8
	mov qword [gbl+8*90],r9
	mov qword [gbl+8*6],r10
	mov qword [rsp+8*91],r11
	
L_1510:
	mov r9,  [gbl+8*59]
	mov r8,r9
	mov r10,  [gbl+8*6]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*92],r8
	mov r8, [r11]
	cmp r8,0
	mov qword [rsp+8*93],r11
	mov r11, 0
	setg r11B
	cmp r11, 0
	mov qword [rsp+8*94],r8
	mov qword [rsp+8*95],r11
	je L_1511
	mov r9,  [gbl+8*59]
	mov r8,r9
	mov r10,  [gbl+8*6]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*96],r8
	mov r8, [r11]
	mov qword [rsp+8*97],r11
	mov r11,r8
	mov qword [rsp+8*98],r8
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,r11
	add r10,1
	shl r10,3
	add r10,r8
	mov r8, [r10]
	mov r9,  [gbl+8*6]
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov qword [rsp+8*99],r8
	mov r8, [r10]
	mov qword [gbl+8*11],r11
	mov r11,r8
	mov qword [rsp+8*102],r11
	mov r11,1
	mov r8,r8
	sub r8,r11
	mov [r10],r8
	mov qword [rsp+8*101],r8
	mov qword [rsp+8*100],r10
	mov r10,  [gbl+8*5]
	mov r8,r10
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r8, [r10]
	mov r11,  [gbl+8*11]
	mov r10,r11
	add r10,1
	shl r10,3
	add r10,r8
	mov qword [rsp+8*103],r8
	mov r8, [r10]
	mov r9,r8
	inc r8 
	mov [r10],r8
	mov qword [rsp+8*105],r8
	mov r8,r11
	mov qword [gbl+8*6],r8
	mov qword [rsp+8*106],r9
	mov qword [rsp+8*104],r10
	jmp L_1510
	
L_1511:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*107],r8
	mov qword [rsp+8*108],r10
	jmp L_1426
	
L_1427:
	mov r9,  [gbl+8*90]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*109],r10
	mov     rdi, [rsp+8*109]
	call    toString
	mov     qword[rsp+8*110], rax
	mov r9,  [rsp+8*110]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*111],r10
	mov rdi,[rsp+8*111] 
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
	

