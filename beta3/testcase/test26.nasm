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
	
L_252:
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
	je L_253
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
	jmp L_252
	
L_253:
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
	
L_255:
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
	je L_256
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
	jmp L_255
	
L_256:
	mov     rdi, [rsp+8*2]
	call    mallocArray
	mov     qword [rsp+8*31], rax
	mov r9,  [rsp+8*31]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*32],r8
	mov qword [rsp+8*18],r10
	
L_258:
	mov r8,  [rsp+8*18]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*33],r10
	je L_259
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
	
L_261:
	mov r8,  [rsp+8*37]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*38],r10
	je L_262
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
	jmp L_261
	
L_262:
	mov r9,  [rsp+8*18]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*43],r8
	mov qword [rsp+8*18],r9
	jmp L_258
	
L_259:
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
	
L_264:
	mov r8,  [rsp+8*3]
	mov r9,  [rsp+8*4]
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*50],r10
	je L_265
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
	jne L_354
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_355
	
L_354:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_355:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*75],r10
	jne L_266
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_267
	
L_266:
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
	jne L_358
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_359
	
L_358:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_359:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*77],r10
	mov qword [rsp+8*76],r11
	
L_267:
	mov r8,  [rsp+8*76]
	cmp r8, 0
	je L_269
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
	je L_271
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
	jne L_272
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*91],r8
	jmp L_273
	
L_272:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*92],r10
	mov qword [rsp+8*91],r11
	
L_273:
	mov r8,  [rsp+8*91]
	cmp r8, 0
	je L_275
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_275:
	
L_271:
	
L_269:
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
	jne L_362
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_363
	
L_362:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_363:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*101],r10
	jne L_276
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*102],r8
	jmp L_277
	
L_276:
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
	jne L_366
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_367
	
L_366:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_367:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*103],r10
	mov qword [rsp+8*102],r11
	
L_277:
	mov r8,  [rsp+8*102]
	cmp r8, 0
	je L_279
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
	je L_281
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
	jne L_282
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*117],r8
	jmp L_283
	
L_282:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*118],r10
	mov qword [rsp+8*117],r11
	
L_283:
	mov r8,  [rsp+8*117]
	cmp r8, 0
	je L_285
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_285:
	
L_281:
	
L_279:
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
	jne L_370
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_371
	
L_370:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_371:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*127],r10
	jne L_286
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*128],r8
	jmp L_287
	
L_286:
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
	jne L_374
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_375
	
L_374:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_375:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*129],r10
	mov qword [rsp+8*128],r11
	
L_287:
	mov r8,  [rsp+8*128]
	cmp r8, 0
	je L_289
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
	je L_291
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
	jne L_292
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*143],r8
	jmp L_293
	
L_292:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*144],r10
	mov qword [rsp+8*143],r11
	
L_293:
	mov r8,  [rsp+8*143]
	cmp r8, 0
	je L_295
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_295:
	
L_291:
	
L_289:
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
	jne L_378
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_379
	
L_378:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_379:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*153],r10
	jne L_296
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*154],r8
	jmp L_297
	
L_296:
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
	jne L_382
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_383
	
L_382:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_383:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*155],r10
	mov qword [rsp+8*154],r11
	
L_297:
	mov r8,  [rsp+8*154]
	cmp r8, 0
	je L_299
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
	je L_301
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
	jne L_302
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*169],r8
	jmp L_303
	
L_302:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*170],r10
	mov qword [rsp+8*169],r11
	
L_303:
	mov r8,  [rsp+8*169]
	cmp r8, 0
	je L_305
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_305:
	
L_301:
	
L_299:
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
	jne L_386
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_387
	
L_386:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_387:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*179],r10
	jne L_306
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*180],r8
	jmp L_307
	
L_306:
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
	jne L_390
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_391
	
L_390:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_391:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*181],r10
	mov qword [rsp+8*180],r11
	
L_307:
	mov r8,  [rsp+8*180]
	cmp r8, 0
	je L_309
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
	je L_311
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
	jne L_312
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*195],r8
	jmp L_313
	
L_312:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*196],r10
	mov qword [rsp+8*195],r11
	
L_313:
	mov r8,  [rsp+8*195]
	cmp r8, 0
	je L_315
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_315:
	
L_311:
	
L_309:
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
	jne L_394
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_395
	
L_394:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_395:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*205],r10
	jne L_316
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*206],r8
	jmp L_317
	
L_316:
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
	jne L_398
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_399
	
L_398:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_399:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*207],r10
	mov qword [rsp+8*206],r11
	
L_317:
	mov r8,  [rsp+8*206]
	cmp r8, 0
	je L_319
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
	je L_321
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
	jne L_322
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*221],r8
	jmp L_323
	
L_322:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*222],r10
	mov qword [rsp+8*221],r11
	
L_323:
	mov r8,  [rsp+8*221]
	cmp r8, 0
	je L_325
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_325:
	
L_321:
	
L_319:
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
	jne L_402
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_403
	
L_402:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_403:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*231],r10
	jne L_326
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*232],r8
	jmp L_327
	
L_326:
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
	jne L_406
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_407
	
L_406:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_407:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*233],r10
	mov qword [rsp+8*232],r11
	
L_327:
	mov r8,  [rsp+8*232]
	cmp r8, 0
	je L_329
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
	je L_331
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
	jne L_332
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*247],r8
	jmp L_333
	
L_332:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*248],r10
	mov qword [rsp+8*247],r11
	
L_333:
	mov r8,  [rsp+8*247]
	cmp r8, 0
	je L_335
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_335:
	
L_331:
	
L_329:
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
	jne L_410
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_411
	
L_410:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_411:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*257],r10
	jne L_336
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*258],r8
	jmp L_337
	
L_336:
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
	jne L_414
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_415
	
L_414:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_415:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*259],r10
	mov qword [rsp+8*258],r11
	
L_337:
	mov r8,  [rsp+8*258]
	cmp r8, 0
	je L_339
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
	je L_341
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
	jne L_342
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*273],r8
	jmp L_343
	
L_342:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*274],r10
	mov qword [rsp+8*273],r11
	
L_343:
	mov r8,  [rsp+8*273]
	cmp r8, 0
	je L_345
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_345:
	
L_341:
	
L_339:
	mov r8,  [rsp+8*14]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*275],r10
	je L_347
	jmp L_265
	
L_347:
	mov r8,  [rsp+8*3]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov qword [rsp+8*3],r8
	mov qword [rsp+8*276],r10
	jmp L_264
	
L_265:
	mov r8,  [rsp+8*14]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*277],r10
	je L_348
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
	jmp L_349
	
L_348:
	mov r9,t442
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*284],r10
	mov rdi,[rsp+8*284] 
	add rdi, 1 
	call puts
	
L_349:
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


