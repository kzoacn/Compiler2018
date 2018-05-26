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
	mov r8 , rax
	mov r10,106
	mov r9,r10
	mov r11,r9
	mov qword [rsp+8*1],r8
	mov qword rdi,r9
	mov qword [rsp+8*3],r11
	mov     rdi, [rsp+8*3]
	call    mallocArray
	mov     qword [rsp+8*4], rax
	mov r8,  [rsp+8*4]
	mov r13,r8
	mov r10,0
	mov r9,r10
	mov qword [gbl+8*6],r9
	
L_566:
	mov r8,  [gbl+8*6]
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*7],r10
	je L_567
	mov     rdi, [rsp+8*3]
	call    mallocArray
	mov     qword [rsp+8*8], rax
	mov r8,r13
	mov r9,  [gbl+8*6]
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r11,  [rsp+8*8]
	mov [r10],r11
	mov qword [rsp+8*9],r8
	mov qword [rsp+8*10],r10
	mov r10,0
	mov r8,r10
	mov qword [gbl+8*11],r8
	
L_568:
	mov r8,  [gbl+8*11]
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*12],r10
	je L_569
	mov r8,r13
	mov r9,  [gbl+8*6]
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
	mov qword [rsp+8*13],r8
	mov r8,0
	mov [r10],r8
	mov r8,r11
	inc r11 
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*14],r10
	mov qword [gbl+8*11],r11
	jmp L_568
	
L_569:
	mov r9,  [gbl+8*6]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*16],r8
	mov qword [gbl+8*6],r9
	jmp L_566
	
L_567:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*17],r8
	mov r8,101
	mov r11,r8
	mov r8,1
	mov r9,r11
	sub r9,r8
	mov r8,r9
	mov r9,r8
	mov qword [rsp+8*18],r10
	mov qword [gbl+8*19],r11
	mov r11,0
	mov r10,r11
	mov qword [gbl+8*21],r8
	mov qword [gbl+8*22],r9
	mov qword [gbl+8*6],r10
	
L_546:
	mov r8,  [gbl+8*6]
	mov r9,  [gbl+8*19]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*23],r10
	je L_547
	mov r9,0
	mov r8,r9
	mov qword [gbl+8*11],r8
	
L_549:
	mov r8,  [gbl+8*11]
	mov r9,  [gbl+8*19]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*24],r10
	je L_550
	mov r8,1
	mov r9,r8
	neg r9
	mov r10,r13
	mov r11,  [gbl+8*6]
	mov r8,r11
	add r8,1
	shl r8,3
	add r8,r10
	mov r10, [r8]
	mov qword [rsp+8*25],r9
	mov r9,  [gbl+8*11]
	mov r8,r9
	add r8,1
	shl r8,3
	add r8,r10
	mov qword [rsp+8*26],r10
	mov r10,  [rsp+8*25]
	mov [r8],r10
	mov qword [rsp+8*27],r8
	mov r8,r9
	inc r9 
	mov qword [rsp+8*28],r8
	mov qword [gbl+8*11],r9
	jmp L_549
	
L_550:
	mov r9,  [gbl+8*6]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*29],r8
	mov qword [gbl+8*6],r9
	jmp L_546
	
L_547:
	
L_552:
	mov r8,  [gbl+8*30]
	mov r9,  [gbl+8*31]
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*32],r10
	je L_553
	mov r9,  [gbl+8*33]
	mov r8,r9
	mov r10,  [gbl+8*30]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*34],r8
	mov r8, [r11]
	mov qword [rsp+8*35],r11
	mov r11,r8
	mov qword [rsp+8*36],r8
	mov r9,  [gbl+8*38]
	mov r8,r9
	mov qword [gbl+8*37],r11
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*39],r8
	mov r8, [r11]
	mov qword [rsp+8*40],r11
	mov r11,r8
	mov qword [rsp+8*41],r8
	mov r8,r13
	mov r9,  [gbl+8*37]
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r8, [r10]
	mov r10,r11
	add r10,1
	shl r10,3
	add r10,r8
	mov qword [rsp+8*43],r8
	mov r8, [r10]
	mov qword [rsp+8*44],r10
	mov r10,r8
	mov qword [rsp+8*45],r8
	mov r8,1
	mov qword [gbl+8*42],r11
	mov r11,r9
	sub r11,r8
	mov r8,  [gbl+8*42]
	mov qword [gbl+8*46],r10
	mov r10,2
	mov r9,r8
	sub r9,r10
	mov r10,r9
	mov r9,r11
	mov r11,r9
	mov r8,r10
	mov qword rdi,r9
	mov r9,  [gbl+8*19]
	mov r10,r9
	mov qword [rsp+8*50],r11
	mov qword [rsp+8*51],r8
	mov r8,  [rsp+8*50]
	mov r11,r8
	mov r14,r11
	mov r9,r10
	cmp r14,r9
	mov r8, 0
	setl r8B
	cmp r8, 0
	mov qword [rsp+8*54],r8
	mov qword [rsp+8*53],r9
	mov qword rsi,r10
	mov qword rdi,r11
	jne L_603
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_604
	
L_603:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_604:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_607
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_608
	
L_607:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r14,r10
	mov qword rsi,r8
	mov r9,  rsi
	mov r8,r9
	cmp r14,r8
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*53],r8
	mov qword rdi,r10
	mov qword [rsp+8*54],r11
	jne L_609
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_610
	
L_609:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_610:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_608:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_613
	mov r8,r13
	mov r9,  [rsp+8*50]
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r8, [r10]
	mov r11,  [rsp+8*51]
	mov r10,r11
	add r10,1
	shl r10,3
	add r10,r8
	mov r9, [r10]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r11,r8
	neg r11
	cmp r9,r11
	mov qword [rsp+8*61],r10
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*62],r9
	mov qword [rsp+8*64],r10
	mov qword [rsp+8*63],r11
	je L_614
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r11
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r11,r13
	mov r8,  [rsp+8*50]
	mov r9,r8
	add r9,1
	shl r9,3
	add r9,r11
	mov r11, [r9]
	mov qword [rsp+8*70],r10
	mov r10,  [rsp+8*51]
	mov r9,r10
	add r9,1
	shl r9,3
	add r9,r11
	mov r8,  [rsp+8*70]
	mov [r9],r8
	mov r10,  [rsp+8*50]
	mov qword [rsp+8*71],r11
	mov r11,  [gbl+8*22]
	cmp r10,r11
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*73],r8
	mov qword [rsp+8*72],r9
	jne L_615
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_616
	
L_615:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_616:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_617
	mov r8,1
	mov r15,r8
	
L_617:
	
L_614:
	
L_613:
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
	mov r14,r11
	mov qword rsi,r8
	mov r9,  rsi
	mov r8,r9
	cmp r14,r8
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*53],r8
	mov qword [rsp+8*54],r10
	mov qword rdi,r11
	jne L_620
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_621
	
L_620:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_621:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_624
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_625
	
L_624:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r14,r10
	mov qword rsi,r8
	mov r9,  rsi
	mov r8,r9
	cmp r14,r8
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*53],r8
	mov qword rdi,r10
	mov qword [rsp+8*54],r11
	jne L_626
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_627
	
L_626:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_627:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_625:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_630
	mov r8,r13
	mov r9,  [rsp+8*50]
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r8, [r10]
	mov r11,  [rsp+8*51]
	mov r10,r11
	add r10,1
	shl r10,3
	add r10,r8
	mov r9, [r10]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r11,r8
	neg r11
	cmp r9,r11
	mov qword [rsp+8*61],r10
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*62],r9
	mov qword [rsp+8*64],r10
	mov qword [rsp+8*63],r11
	je L_631
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r11
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r11,r13
	mov r8,  [rsp+8*50]
	mov r9,r8
	add r9,1
	shl r9,3
	add r9,r11
	mov r11, [r9]
	mov qword [rsp+8*70],r10
	mov r10,  [rsp+8*51]
	mov r9,r10
	add r9,1
	shl r9,3
	add r9,r11
	mov r8,  [rsp+8*70]
	mov [r9],r8
	mov r10,  [rsp+8*50]
	mov qword [rsp+8*71],r11
	mov r11,  [gbl+8*22]
	cmp r10,r11
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*73],r8
	mov qword [rsp+8*72],r9
	jne L_632
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_633
	
L_632:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_633:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_634
	mov r8,1
	mov r15,r8
	
L_634:
	
L_631:
	
L_630:
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
	mov r14,r11
	mov qword rsi,r8
	mov r9,  rsi
	mov r8,r9
	cmp r14,r8
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*53],r8
	mov qword [rsp+8*54],r10
	mov qword rdi,r11
	jne L_637
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_638
	
L_637:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_638:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_641
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_642
	
L_641:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r14,r10
	mov qword rsi,r8
	mov r9,  rsi
	mov r8,r9
	cmp r14,r8
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*53],r8
	mov qword rdi,r10
	mov qword [rsp+8*54],r11
	jne L_643
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_644
	
L_643:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_644:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_642:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_647
	mov r8,r13
	mov r9,  [rsp+8*50]
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r8, [r10]
	mov r11,  [rsp+8*51]
	mov r10,r11
	add r10,1
	shl r10,3
	add r10,r8
	mov r9, [r10]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r11,r8
	neg r11
	cmp r9,r11
	mov qword [rsp+8*61],r10
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*62],r9
	mov qword [rsp+8*64],r10
	mov qword [rsp+8*63],r11
	je L_648
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r11
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r11,r13
	mov r8,  [rsp+8*50]
	mov r9,r8
	add r9,1
	shl r9,3
	add r9,r11
	mov r11, [r9]
	mov qword [rsp+8*70],r10
	mov r10,  [rsp+8*51]
	mov r9,r10
	add r9,1
	shl r9,3
	add r9,r11
	mov r8,  [rsp+8*70]
	mov [r9],r8
	mov r10,  [rsp+8*50]
	mov qword [rsp+8*71],r11
	mov r11,  [gbl+8*22]
	cmp r10,r11
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*73],r8
	mov qword [rsp+8*72],r9
	jne L_649
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_650
	
L_649:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_650:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_651
	mov r8,1
	mov r15,r8
	
L_651:
	
L_648:
	
L_647:
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
	mov r14,r11
	mov qword rsi,r8
	mov r9,  rsi
	mov r8,r9
	cmp r14,r8
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*53],r8
	mov qword [rsp+8*54],r10
	mov qword rdi,r11
	jne L_654
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_655
	
L_654:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_655:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_658
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_659
	
L_658:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r14,r10
	mov qword rsi,r8
	mov r9,  rsi
	mov r8,r9
	cmp r14,r8
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*53],r8
	mov qword rdi,r10
	mov qword [rsp+8*54],r11
	jne L_660
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_661
	
L_660:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_661:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_659:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_664
	mov r8,r13
	mov r9,  [rsp+8*50]
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r8, [r10]
	mov r11,  [rsp+8*51]
	mov r10,r11
	add r10,1
	shl r10,3
	add r10,r8
	mov r9, [r10]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r11,r8
	neg r11
	cmp r9,r11
	mov qword [rsp+8*61],r10
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*62],r9
	mov qword [rsp+8*64],r10
	mov qword [rsp+8*63],r11
	je L_665
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r11
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r11,r13
	mov r8,  [rsp+8*50]
	mov r9,r8
	add r9,1
	shl r9,3
	add r9,r11
	mov r11, [r9]
	mov qword [rsp+8*70],r10
	mov r10,  [rsp+8*51]
	mov r9,r10
	add r9,1
	shl r9,3
	add r9,r11
	mov r8,  [rsp+8*70]
	mov [r9],r8
	mov r10,  [rsp+8*50]
	mov qword [rsp+8*71],r11
	mov r11,  [gbl+8*22]
	cmp r10,r11
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*73],r8
	mov qword [rsp+8*72],r9
	jne L_666
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_667
	
L_666:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_667:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_668
	mov r8,1
	mov r15,r8
	
L_668:
	
L_665:
	
L_664:
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
	mov r14,r11
	mov qword rsi,r8
	mov r9,  rsi
	mov r8,r9
	cmp r14,r8
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*53],r8
	mov qword [rsp+8*54],r10
	mov qword rdi,r11
	jne L_671
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_672
	
L_671:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_672:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_675
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_676
	
L_675:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r14,r10
	mov qword rsi,r8
	mov r9,  rsi
	mov r8,r9
	cmp r14,r8
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*53],r8
	mov qword rdi,r10
	mov qword [rsp+8*54],r11
	jne L_677
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_678
	
L_677:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_678:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_676:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_681
	mov r8,r13
	mov r9,  [rsp+8*50]
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r8, [r10]
	mov r11,  [rsp+8*51]
	mov r10,r11
	add r10,1
	shl r10,3
	add r10,r8
	mov r9, [r10]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r11,r8
	neg r11
	cmp r9,r11
	mov qword [rsp+8*61],r10
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*62],r9
	mov qword [rsp+8*64],r10
	mov qword [rsp+8*63],r11
	je L_682
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r11
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r11,r13
	mov r8,  [rsp+8*50]
	mov r9,r8
	add r9,1
	shl r9,3
	add r9,r11
	mov r11, [r9]
	mov qword [rsp+8*70],r10
	mov r10,  [rsp+8*51]
	mov r9,r10
	add r9,1
	shl r9,3
	add r9,r11
	mov r8,  [rsp+8*70]
	mov [r9],r8
	mov r10,  [rsp+8*50]
	mov qword [rsp+8*71],r11
	mov r11,  [gbl+8*22]
	cmp r10,r11
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*73],r8
	mov qword [rsp+8*72],r9
	jne L_683
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_684
	
L_683:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_684:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_685
	mov r8,1
	mov r15,r8
	
L_685:
	
L_682:
	
L_681:
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
	mov r14,r11
	mov qword rsi,r8
	mov r9,  rsi
	mov r8,r9
	cmp r14,r8
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*53],r8
	mov qword [rsp+8*54],r10
	mov qword rdi,r11
	jne L_688
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_689
	
L_688:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_689:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_692
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_693
	
L_692:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r14,r10
	mov qword rsi,r8
	mov r9,  rsi
	mov r8,r9
	cmp r14,r8
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*53],r8
	mov qword rdi,r10
	mov qword [rsp+8*54],r11
	jne L_694
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_695
	
L_694:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_695:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_693:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_698
	mov r8,r13
	mov r9,  [rsp+8*50]
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r8, [r10]
	mov r11,  [rsp+8*51]
	mov r10,r11
	add r10,1
	shl r10,3
	add r10,r8
	mov r9, [r10]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r11,r8
	neg r11
	cmp r9,r11
	mov qword [rsp+8*61],r10
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*62],r9
	mov qword [rsp+8*64],r10
	mov qword [rsp+8*63],r11
	je L_699
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r11
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r11,r13
	mov r8,  [rsp+8*50]
	mov r9,r8
	add r9,1
	shl r9,3
	add r9,r11
	mov r11, [r9]
	mov qword [rsp+8*70],r10
	mov r10,  [rsp+8*51]
	mov r9,r10
	add r9,1
	shl r9,3
	add r9,r11
	mov r8,  [rsp+8*70]
	mov [r9],r8
	mov r10,  [rsp+8*50]
	mov qword [rsp+8*71],r11
	mov r11,  [gbl+8*22]
	cmp r10,r11
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*73],r8
	mov qword [rsp+8*72],r9
	jne L_700
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_701
	
L_700:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_701:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_702
	mov r8,1
	mov r15,r8
	
L_702:
	
L_699:
	
L_698:
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
	mov r14,r11
	mov qword rsi,r8
	mov r9,  rsi
	mov r8,r9
	cmp r14,r8
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*53],r8
	mov qword [rsp+8*54],r10
	mov qword rdi,r11
	jne L_705
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_706
	
L_705:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_706:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_709
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_710
	
L_709:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r14,r10
	mov qword rsi,r8
	mov r9,  rsi
	mov r8,r9
	cmp r14,r8
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*53],r8
	mov qword rdi,r10
	mov qword [rsp+8*54],r11
	jne L_711
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_712
	
L_711:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_712:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_710:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_715
	mov r8,r13
	mov r9,  [rsp+8*50]
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r8, [r10]
	mov r11,  [rsp+8*51]
	mov r10,r11
	add r10,1
	shl r10,3
	add r10,r8
	mov r9, [r10]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r11,r8
	neg r11
	cmp r9,r11
	mov qword [rsp+8*61],r10
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*62],r9
	mov qword [rsp+8*64],r10
	mov qword [rsp+8*63],r11
	je L_716
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r11
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r11,r13
	mov r8,  [rsp+8*50]
	mov r9,r8
	add r9,1
	shl r9,3
	add r9,r11
	mov r11, [r9]
	mov qword [rsp+8*70],r10
	mov r10,  [rsp+8*51]
	mov r9,r10
	add r9,1
	shl r9,3
	add r9,r11
	mov r8,  [rsp+8*70]
	mov [r9],r8
	mov r10,  [rsp+8*50]
	mov qword [rsp+8*71],r11
	mov r11,  [gbl+8*22]
	cmp r10,r11
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*73],r8
	mov qword [rsp+8*72],r9
	jne L_717
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_718
	
L_717:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_718:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_719
	mov r8,1
	mov r15,r8
	
L_719:
	
L_716:
	
L_715:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov qword [rsp+8*95],r10
	mov r10,2
	mov r9,r11
	add r9,r10
	mov r10,  [gbl+8*42]
	mov r11,1
	mov qword [rsp+8*76],r8
	mov r8,r10
	add r8,r11
	mov r10,r8
	mov r8,r9
	mov r9,r8
	mov r11,r10
	mov qword rdi,r8
	mov r8,  [gbl+8*19]
	mov r10,r8
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*51],r11
	mov r11,  [rsp+8*50]
	mov r9,r11
	mov r14,r9
	mov r8,r10
	cmp r14,r8
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*53],r8
	mov qword rdi,r9
	mov qword rsi,r10
	mov qword [rsp+8*54],r11
	jne L_722
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_723
	
L_722:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_723:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_726
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_727
	
L_726:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r14,r10
	mov r9,r8
	cmp r14,r9
	mov qword rsi,r8
	mov r8, 0
	setl r8B
	cmp r8, 0
	mov qword [rsp+8*54],r8
	mov qword [rsp+8*53],r9
	mov qword rdi,r10
	jne L_728
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_729
	
L_728:
	mov r8,0
	cmp r14,r8
	mov r9, 0
	setge r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_729:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_727:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_732
	mov r8,r13
	mov r9,  [rsp+8*50]
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r8, [r10]
	mov r11,  [rsp+8*51]
	mov r10,r11
	add r10,1
	shl r10,3
	add r10,r8
	mov qword [rsp+8*60],r8
	mov r8, [r10]
	mov qword [rsp+8*61],r10
	mov r10,1
	mov r9,r10
	neg r9
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*62],r8
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*64],r10
	je L_733
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r11
	mov qword [rsp+8*66],r11
	mov r11,  [rsp+8*50]
	mov [r10],r11
	mov qword [rsp+8*67],r10
	mov r9,  [gbl+8*38]
	mov r10,r9
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r10
	mov qword [gbl+8*31],r8
	mov r8,  [rsp+8*51]
	mov [r11],r8
	mov qword [rsp+8*68],r10
	mov r10,  [gbl+8*46]
	mov qword [rsp+8*69],r11
	mov r11,1
	mov r9,r10
	add r9,r11
	mov r10,r13
	mov r11,  [rsp+8*50]
	mov r8,r11
	add r8,1
	shl r8,3
	add r8,r10
	mov r10, [r8]
	mov qword [rsp+8*70],r9
	mov r9,  [rsp+8*51]
	mov r8,r9
	add r8,1
	shl r8,3
	add r8,r10
	mov qword [rsp+8*71],r10
	mov r10,  [rsp+8*70]
	mov [r8],r10
	mov qword [rsp+8*72],r8
	mov r8,  [gbl+8*22]
	cmp r11,r8
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*73],r10
	jne L_734
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_735
	
L_734:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_735:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_736
	mov r8,1
	mov r15,r8
	
L_736:
	
L_733:
	
L_732:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,1
	cmp r15,r11
	mov qword [rsp+8*76],r8
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*99],r8
	mov qword [rsp+8*98],r10
	je L_555
	jmp L_553
	
L_555:
	mov r8,  [gbl+8*30]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov qword [gbl+8*30],r8
	mov qword [rsp+8*100],r10
	jmp L_552
	
L_553:
	mov r8,1
	cmp r15,r8
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*101],r9
	je L_556
	mov r8,r13
	mov r9,  [gbl+8*22]
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
	mov r8, [r10]
	mov r11,  [gbl+8*21]
	mov r10,r11
	add r10,1
	shl r10,3
	add r10,r8
	mov qword [rsp+8*102],r8
	mov r8, [r10]
	mov r9,r8
	mov qword [rsp+8*104],r8
	mov r8,r9
	mov qword [rsp+8*105],r8
	mov qword rdi,r9
	mov qword [rsp+8*103],r10
	mov     rdi, [rsp+8*105]
	call    toString
	mov     qword[rsp+8*106], rax
	mov r9,  [rsp+8*106]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*107],r10
	mov rdi,[rsp+8*107] 
	add rdi, 1 
	call puts
	jmp L_557
	
L_556:
	mov r9,t211
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*108],r10
	mov rdi,[rsp+8*108] 
	add rdi, 1 
	call puts
	
L_557:
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


