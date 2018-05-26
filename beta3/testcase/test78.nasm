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
        test    rdi, rdi
        push    r12
        push    rbp
        push    rbx
        je      OIII_18
        mov     rbx, rdi
        jns     OIII_19
        neg     rbx
OIII_12:



        db 49H, 0C7H, 0C4H, 0FFH, 0FFH, 0FFH, 0FFH

        db 0BFH, 01H, 00H, 00H, 00H
OIII_13:  mov     rcx, rbx
        mov     rsi, qword 6666666666666667H
        jmp     OIII_15


OIII_14:  mov     rdi, rbp
OIII_15:  mov     rax, rcx
        sar     rcx, 63
        lea     rbp, [rdi+1H]
        imul    rsi
        sar     rdx, 2
        sub     rdx, rcx
        mov     rcx, rdx
        jnz     OIII_14
        add     rdi, 3
        call    malloc
        cmp     r12, -1
        mov     byte [rax+rbp+1H], 0
        mov     rsi, rax
        mov     byte [rax], bpl
        jnz     OIII_16
        mov     byte [rsi+1H], 45
OIII_16:  lea     rcx, [rsi+rbp]
        mov     rdi, qword 6666666666666667H

OIII_17:  mov     rax, rbx
        sub     rcx, 1
        imul    rdi
        mov     rax, rbx
        sar     rax, 63
        sar     rdx, 2
        sub     rdx, rax
        lea     rax, [rdx+rdx*4]
        add     rax, rax
        sub     rbx, rax
        add     ebx, 48
        mov     byte [rcx+1H], bl
        test    rdx, rdx
        mov     rbx, rdx
        jnz     OIII_17
        pop     rbx
        mov     rax, rsi
        pop     rbp
        pop     r12
        ret

OIII_18:  mov     edi, 3
        call    malloc
        mov     rsi, rax
        mov     byte [rax+2H], 0
        mov     byte [rax], 1
        mov     byte [rax+1H], 48
        mov     rax, rsi
        pop     rbx
        pop     rbp
        pop     r12
        ret

OIII_19:  mov     r12d, 1
        xor     edi, edi
        jmp     OIII_13

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
        push    r13
        push    r12
        mov     r13, rdi
        push    rbp
        push    rbx
        mov     r12, rsi
        sub     rsp, 8
        movzx   edx, byte [rdi]
        movzx   eax, byte [rsi]
        lea     edi, [rdx+rax+2H]
        mov     ebx, edx
        mov     ebp, eax
        movsxd  rdi, edi
        call    malloc
        lea     edx, [rbx+rbp]
        movzx   edi, bl
        test    rdi, rdi
        mov     byte [rax], dl
        jz      OIII_05
        xor     edx, edx

OIII_01:  add     rdx, 1
        movzx   ecx, byte [r13+rdx]
        cmp     rdx, rdi
        mov     byte [rax+rdx], cl
        jnz     OIII_01
        lea     rdx, [rdi+1H]
OIII_02:  movzx   r8d, bpl
        test    r8, r8
        jz      OIII_04
        lea     rsi, [rax+rdi]
        xor     edx, edx

OIII_03:  movzx   ecx, byte [r12+rdx+1H]
        mov     byte [rsi+rdx+1H], cl
        add     rdx, 1
        cmp     rdx, r8
        jnz     OIII_03
        lea     rdx, [rdx+rdi+1H]
OIII_04:  mov     byte [rax+rdx], 0
        add     rsp, 8
        pop     rbx
        pop     rbp
        pop     r12
        pop     r13
        ret

OIII_05:  mov     edx, 1
        jmp     OIII_02

address:
        lea     rax, [rdi+rsi*8+8H]
        ret

_multiArray:
        push    r14
        push    r13
        lea     r13d, [rdi+1H]
        push    r12
        push    rbp
        movsxd  rax, r13d
        push    rbx
        cmp     rax, qword [rsi]
        jz      OIII_11
        movsxd  rdi, edi
        mov     rbp, rsi
        mov     r12, qword [rsi+rdi*8+8H]
        mov     rdi, r12
        call    mallocArray
        test    r12, r12
        mov     r14, rax
        jle     OIII_10
        add     r12, 1
        mov     ebx, 1

OIII_09:  mov     rsi, rbp
        mov     edi, r13d
        call    _multiArray
        mov     qword [r14+rbx*8], rax
        add     rbx, 1
        cmp     r12, rbx
        jnz     OIII_09
OIII_10:  pop     rbx
        mov     rax, r14
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        ret

OIII_11:  pop     rbx
        movsxd  rdi, edi
        pop     rbp
        pop     r12
        pop     r13
        pop     r14
        mov     rdi, qword [rsi+rdi*8+8H]
        jmp     mallocArray


multiArray:
        mov     rsi, rdi
        xor     edi, edi
        jmp     _multiArray

multiAddress:
        mov     rcx, qword [rsi]
        mov     rax, rdi
        test    rcx, rcx
        jz      OIII_08
        cmp     rcx, 1
        mov     eax, 1
        jle     OIII_07

OIII_06:  mov     rdx, qword [rsi+rax*8]
        add     rax, 1
        cmp     rcx, rax
        mov     rdi, qword [rdi+rdx*8+8H]
        jnz     OIII_06
OIII_07:  mov     rax, qword [rsi+rcx*8]
        lea     rax, [rdi+rax*8+8H]
OIII_08:

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
	mov r11,r9
	mov qword [rsp+8*1],r8
	mov qword rdi,r9
	mov qword [rsp+8*3],r11
	mov     rdi, [rsp+8*3]
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
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*7],r10
	je L_1472
	mov     rdi, [rsp+8*3]
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
	
L_1473:
	mov r8,  [gbl+8*11]
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*12],r10
	je L_1474
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
	mov qword [rsp+8*17],r8
	mov r8,0
	mov r11,r8
	mov r9,99
	mov r8,r9
	mov r9,100
	mov r13,r9
	mov qword [rsp+8*18],r10
	mov r10,0
	mov r9,r10
	mov r10,r13
	mov qword [rsp+8*19],r11
	mov r11,r8
	mov r14,r11
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*20],r8
	mov qword rdi,r11
	mov r11,1
	mov r8,r11
	mov qword [gbl+8*6],r8
	mov qword [rsp+8*25],r9
	mov qword rsi,r10
	
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
	add r15,r15
	cmp r10, 0
	mov qword [rsp+8*27],r10
	je L_1483
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
	lea r10,[r8+r14*8+8H]
	mov r8, [r10]
	mov r11,  [gbl+8*6]
	lea r10,[r8+r11*8+8H]
	mov qword [rsp+8*34],r8
	mov r8,1
	mov [r10],r8
	mov r8,r11
	inc r11 
	mov qword [rsp+8*36],r8
	mov qword [rsp+8*35],r10
	mov qword [gbl+8*6],r11
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
	lea r11,[r8+r10*8+8H]
	mov r8, [r11]
	mov r9,  [rsp+8*25]
	lea r11,[r8+r9*8+8H]
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
	mov r9,r13
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
	lea r11,[r8+r10*8+8H]
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
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*55],r8
	mov r8,  [rsp+8*45]
	mov [r11],r8
	mov qword [rsp+8*56],r11
	mov r11,  [gbl+8*50]
	mov r10,r11
	lea r9,[r10+r8*8+8H]
	mov qword [rsp+8*57],r10
	mov r10,1
	mov [r9],r10
	mov qword [rsp+8*58],r9
	mov r10,  [gbl+8*59]
	mov r9,r10
	lea r11,[r9+r8*8+8H]
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
	lea r8,[r10+r9*8+8H]
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
	jne L_1503
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_1504
	
L_1503:
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
	
L_1504:
	mov r8,  [rsp+8*72]
	cmp r8, 0
	je L_1505
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
	inc r11 
	mov qword [rsp+8*79],r8
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
	mov r8,r13
	mov r12,r8
	mov r9,r12
	mov r11,  [gbl+8*90]
	mov r10,r11
	inc r11 
	mov qword rdi,r8
	mov qword [gbl+8*6],r9
	mov qword [rsp+8*91],r10
	mov qword [gbl+8*90],r11
	
L_1510:
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
	je L_1511
	mov r9,  [gbl+8*59]
	mov r8,r9
	mov r10,  [gbl+8*6]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*96],r8
	mov r8, [r11]
	mov qword [rsp+8*97],r11
	mov r11,r8
	mov qword [rsp+8*98],r8
	mov r9,  [gbl+8*5]
	mov r8,r9
	lea r10,[r8+r11*8+8H]
	mov r8, [r10]
	mov r9,  [gbl+8*6]
	lea r10,[r8+r9*8+8H]
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
	lea r10,[r8+r9*8+8H]
	mov r8, [r10]
	mov r11,  [gbl+8*11]
	lea r10,[r8+r11*8+8H]
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
	

