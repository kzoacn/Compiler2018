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
	sub    rsp, 848
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 2832
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
	mov qword [rsp+8*1],r8
	mov     rdi, 100
	call    mallocArray
	mov     qword [rsp+8*2], rax
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r10,0
	mov r14,r10
	mov qword [gbl+8*3],r8
	
L_1320:
	mov r8,  [gbl+8*5]
	cmp r14,r8
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*6],r9
	je L_1321
	mov r9,  [gbl+8*3]
	mov r8,r9
	lea r10,[r8+r14*8+8H]
	mov r11,0
	mov [r10],r11
	mov qword [rsp+8*7],r8
	mov r8,r14
	inc qword r14 
	mov qword [rsp+8*10],r8
	mov qword [rsp+8*8],r10
	jmp L_1320
	
L_1321:
	mov r8,1
	mov r14,r8
	
L_1323:
	mov r8,500
	cmp r14,r8
	mov r9, 0
	setle r9B
	cmp r9, 0
	mov qword [rsp+8*11],r9
	je L_1324
	mov r8,r14
	mov r9,r14
	mov r13,r9
	mov r10,r8
	mov r11,0
	mov r15,r11
	mov r9,r13
	mov r12,r9
	mov qword rsi,r8
	mov r8,237
	mov r11,r12
	imul r11,r8
	xor rdx, rdx
	mov rax, r11
	mov qword [rsp+8*15],r10
	mov r10,  [gbl+8*5]
	mov rbx, r10
	cdq
	idiv rbx
	mov qword rdi,r9
	mov r9, rdx
	mov r8,r9
	mov r10,r8
	mov r15,r10
	mov qword [rsp+8*22],r10
	mov qword [rsp+8*19],r11
	mov r11,  [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*20],r9
	lea r9,[r10+r15*8+8H]
	mov qword [rsp+8*24],r10
	mov r10, [r9]
	mov qword [rsp+8*25],r9
	mov r9,0
	cmp r10,r9
	mov qword [rsp+8*21],r8
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*28],r8
	mov qword [rsp+8*26],r10
	je L_1357
	mov     rdi, 3
	call    mallocArray
	mov     qword [rsp+8*29], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	lea r10,[r8+r15*8+8H]
	mov r11,  [rsp+8*29]
	mov [r10],r11
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*31],r10
	mov     rdi, 2
	call    mallocArray
	mov     qword [rsp+8*32], rax
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,0
	lea r8,[r9+r10*8+8H]
	mov [r8],r15
	mov r11,1
	lea r8,[r9+r11*8+8H]
	mov r10,0
	mov [r8],r10
	mov qword [rsp+8*33],r8
	mov     rsi, [rsp+8*32]
	mov     rdi, [gbl+8*3]
	call    multiAddress
	mov [rsp+8*34], rax
	mov r8,  [rsp+8*34]
	mov [r8],r13
	mov     rdi, 2
	call    mallocArray
	mov     qword [rsp+8*35], rax
	mov r9,  [rsp+8*35]
	mov r8,r9
	mov r10,0
	lea r8,[r9+r10*8+8H]
	mov [r8],r15
	mov r11,1
	lea r8,[r9+r11*8+8H]
	mov r10,1
	mov [r8],r10
	mov qword [rsp+8*36],r8
	mov     rsi, [rsp+8*35]
	mov     rdi, [gbl+8*3]
	call    multiAddress
	mov [rsp+8*37], rax
	mov r8,  [rsp+8*37]
	mov r9,  [rsp+8*15]
	mov [r8],r9
	mov     rdi, 2
	call    mallocArray
	mov     qword [rsp+8*38], rax
	mov r9,  [rsp+8*38]
	mov r8,r9
	mov r10,0
	lea r8,[r9+r10*8+8H]
	mov [r8],r15
	mov r11,1
	lea r8,[r9+r11*8+8H]
	mov r10,2
	mov [r8],r10
	mov qword [rsp+8*39],r8
	mov     rsi, [rsp+8*38]
	mov     rdi, [gbl+8*3]
	call    multiAddress
	mov [rsp+8*40], rax
	mov r8,  [rsp+8*40]
	mov r9,0
	mov [r8],r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*42],r10
	jmp L_1359
	
L_1357:
	mov r9,  [gbl+8*3]
	mov r8,r9
	lea r10,[r8+r15*8+8H]
	mov r11, [r10]
	mov r15,r11
	mov qword [rsp+8*43],r8
	mov qword [rsp+8*44],r10
	mov qword [rsp+8*45],r11
	
L_1360:
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*46], rax
	mov r9,  [rsp+8*46]
	mov r8,r9
	mov r10,0
	lea r8,[r9+r10*8+8H]
	mov r11,0
	mov [r8],r11
	mov qword [rsp+8*47],r8
	mov     rsi, [rsp+8*46]
	mov     rdi,  r15
	call    multiAddress
	mov [rsp+8*48], rax
	mov r8,  [rsp+8*48]
	mov r8, [r8]
	cmp r8,r13
	mov r9, 0
	setne r9B
	cmp r9, 0
	mov qword [rsp+8*48],r8
	mov qword [rsp+8*49],r9
	je L_1361
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*50], rax
	mov r9,  [rsp+8*50]
	mov r8,r9
	mov r10,0
	lea r8,[r9+r10*8+8H]
	mov r11,2
	mov [r8],r11
	mov qword [rsp+8*51],r8
	mov     rsi, [rsp+8*50]
	mov     rdi,  r15
	call    multiAddress
	mov [rsp+8*52], rax
	mov r8,  [rsp+8*52]
	mov r8, [r8]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*54],r10
	je L_1362
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*55], rax
	mov r9,  [rsp+8*55]
	mov r8,r9
	mov r10,0
	lea r8,[r9+r10*8+8H]
	mov r11,2
	mov [r8],r11
	mov qword [rsp+8*56],r8
	mov     rsi, [rsp+8*55]
	mov     rdi,  r15
	call    multiAddress
	mov [rsp+8*57], rax
	mov     rdi, 3
	call    mallocArray
	mov     qword [rsp+8*58], rax
	mov r8,  [rsp+8*57]
	mov r9,  [rsp+8*58]
	mov [r8],r9
	mov     rdi, 2
	call    mallocArray
	mov     qword [rsp+8*59], rax
	mov r9,  [rsp+8*59]
	mov r8,r9
	mov r10,0
	lea r8,[r9+r10*8+8H]
	mov r11,2
	mov [r8],r11
	mov r10,1
	lea r8,[r9+r10*8+8H]
	mov r10,0
	mov [r8],r10
	mov qword [rsp+8*60],r8
	mov     rsi, [rsp+8*59]
	mov     rdi,  r15
	call    multiAddress
	mov [rsp+8*61], rax
	mov r8,  [rsp+8*61]
	mov [r8],r13
	mov     rdi, 2
	call    mallocArray
	mov     qword [rsp+8*62], rax
	mov r9,  [rsp+8*62]
	mov r8,r9
	mov r10,0
	lea r8,[r9+r10*8+8H]
	mov r11,2
	mov [r8],r11
	mov r10,1
	lea r8,[r9+r10*8+8H]
	mov r10,2
	mov [r8],r10
	mov qword [rsp+8*63],r8
	mov     rsi, [rsp+8*62]
	mov     rdi,  r15
	call    multiAddress
	mov [rsp+8*64], rax
	mov r8,  [rsp+8*64]
	mov r9,0
	mov [r8],r9
	
L_1362:
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*66], rax
	mov r9,  [rsp+8*66]
	mov r8,r9
	mov r10,0
	lea r8,[r9+r10*8+8H]
	mov r11,2
	mov [r8],r11
	mov qword [rsp+8*67],r8
	mov     rsi, [rsp+8*66]
	mov     rdi,  r15
	call    multiAddress
	mov [rsp+8*68], rax
	mov r8,  [rsp+8*68]
	mov r8, [r8]
	mov r15,r8
	mov qword [rsp+8*68],r8
	jmp L_1360
	
L_1361:
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*69], rax
	mov r9,  [rsp+8*69]
	mov r8,r9
	mov r10,0
	lea r8,[r9+r10*8+8H]
	mov r11,1
	mov [r8],r11
	mov qword [rsp+8*70],r8
	mov     rsi, [rsp+8*69]
	mov     rdi,  r15
	call    multiAddress
	mov [rsp+8*71], rax
	mov r8,  [rsp+8*71]
	mov r9,  [rsp+8*15]
	mov [r8],r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*42],r10
	
L_1359:
	mov r9,  [rsp+8*42]
	mov r8,r9
	mov r10,r14
	inc qword r14 
	mov qword [rsp+8*72],r8
	mov qword [rsp+8*73],r10
	jmp L_1323
	
L_1324:
	mov r8,1
	mov r14,r8
	
L_1326:
	mov r8,500
	cmp r14,r8
	mov r9, 0
	setle r9B
	cmp r9, 0
	mov qword [rsp+8*74],r9
	je L_1327
	mov r8,r14
	mov r13,r8
	mov r9,0
	mov r15,r9
	mov r8,r13
	mov r12,r8
	mov r10,237
	mov r11,r12
	imul r11,r10
	xor rdx, rdx
	mov rax, r11
	mov r9,  [gbl+8*5]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r11,r10
	mov r10,r11
	mov qword [rsp+8*21],r11
	mov qword rdi,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	lea r8,[r11+r10*8+8H]
	mov qword [rsp+8*78],r10
	mov r10, [r8]
	mov r15,r10
	mov qword [rsp+8*80],r8
	mov qword [rsp+8*81],r10
	mov qword [rsp+8*79],r11
	
L_1343:
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*82], rax
	mov r9,  [rsp+8*82]
	mov r8,r9
	mov r10,0
	lea r8,[r9+r10*8+8H]
	mov r11,0
	mov [r8],r11
	mov qword [rsp+8*83],r8
	mov     rsi, [rsp+8*82]
	mov     rdi,  r15
	call    multiAddress
	mov [rsp+8*84], rax
	mov r8,  [rsp+8*84]
	mov r8, [r8]
	cmp r8,r13
	mov r9, 0
	setne r9B
	cmp r9, 0
	mov qword [rsp+8*84],r8
	mov qword [rsp+8*85],r9
	je L_1344
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*86], rax
	mov r9,  [rsp+8*86]
	mov r8,r9
	mov r10,0
	lea r8,[r9+r10*8+8H]
	mov r11,2
	mov [r8],r11
	mov qword [rsp+8*87],r8
	mov     rsi, [rsp+8*86]
	mov     rdi,  r15
	call    multiAddress
	mov [rsp+8*88], rax
	mov r8,  [rsp+8*88]
	mov r8, [r8]
	mov r15,r8
	mov qword [rsp+8*88],r8
	jmp L_1343
	
L_1344:
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*89], rax
	mov r9,  [rsp+8*89]
	mov r8,r9
	mov r10,0
	lea r8,[r9+r10*8+8H]
	mov r11,1
	mov [r8],r11
	mov qword [rsp+8*90],r8
	mov     rsi, [rsp+8*89]
	mov     rdi,  r15
	call    multiAddress
	mov [rsp+8*91], rax
	mov r8,  [rsp+8*91]
	mov r8, [r8]
	mov r9,r8
	mov r10,r9
	mov r11,r10
	mov qword [rsp+8*91],r8
	mov r8,r11
	mov qword [rsp+8*94],r8
	mov qword [rsp+8*92],r9
	mov qword [rsp+8*93],r10
	mov qword rdi,r11
	mov     rdi, [rsp+8*94]
	call    toString
	mov     qword[rsp+8*95], rax
	mov r9,  [rsp+8*95]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*96],r10
	mov rdi,[rsp+8*96] 
	add rdi, 1 
	call puts
	mov r8,r14
	inc qword r14 
	mov qword [rsp+8*97],r8
	jmp L_1326
	
L_1327:
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 848
	mov r9,100
	mov r8,r9
	mov qword [gbl+8*5],r8
	mov r8,  [rsp+8*98]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   2832
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
	

