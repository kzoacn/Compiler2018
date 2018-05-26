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


qsrt:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 552
	mov r8,  rdi
	mov r14,r8
	mov r10,  rsi
	mov r9,r10
	mov r11,r14
	mov r15,r9
	mov r8,r14
	add r8,r9
	xor rdx, rdx
	mov rax, r8
	mov r10,2
	mov rbx, r10
	cdq
	idiv rbx
	mov qword [rsp+8*5],r11
	mov r11, rax
	mov r10,  [gbl+8*9]
	mov r8,r10
	mov qword [rsp+8*4],r9
	mov r9,r11
	add r9,1
	shl r9,3
	add r9,r8
	mov qword [rsp+8*10],r8
	mov r8, [r9]
	mov r13,r8
	mov qword [rsp+8*12],r8
	mov qword [rsp+8*11],r9
	mov qword [rsp+8*8],r11
	
L_213:
	mov r8,  [rsp+8*5]
	cmp r8,r15
	mov r9, 0
	setle r9B
	cmp r9, 0
	mov qword [rsp+8*14],r9
	je L_214
	
L_215:
	mov r9,  [gbl+8*9]
	mov r8,r9
	mov r10,  [rsp+8*5]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*15],r8
	mov r8, [r11]
	cmp r8,r13
	mov qword [rsp+8*16],r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*17],r8
	mov qword [rsp+8*18],r11
	je L_216
	mov r9,  [rsp+8*5]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*19],r8
	mov qword [rsp+8*5],r9
	jmp L_215
	
L_216:
	
L_217:
	mov r9,  [gbl+8*9]
	mov r8,r9
	mov r10,r15
	add r10,1
	shl r10,3
	add r10,r8
	mov r11, [r10]
	cmp r11,r13
	mov qword [rsp+8*20],r8
	mov r8, 0
	setg r8B
	cmp r8, 0
	mov qword [rsp+8*23],r8
	mov qword [rsp+8*21],r10
	mov qword [rsp+8*22],r11
	je L_218
	mov r8,r15
	mov r9,1
	mov r15,r15
	sub r15,r9
	mov qword [rsp+8*24],r8
	jmp L_217
	
L_218:
	mov r8,  [rsp+8*5]
	cmp r8,r15
	mov r9, 0
	setle r9B
	cmp r9, 0
	mov qword [rsp+8*25],r9
	je L_220
	mov r9,  [gbl+8*9]
	mov r8,r9
	mov r10,  [rsp+8*5]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*26],r8
	mov r8, [r11]
	mov qword [rsp+8*27],r11
	mov r11,r8
	mov qword [rsp+8*28],r8
	mov r8,r9
	mov r10,r15
	add r10,1
	shl r10,3
	add r10,r8
	mov qword [rsp+8*30],r8
	mov r8, [r10]
	mov qword [rsp+8*31],r10
	mov r10,r9
	mov qword [rsp+8*29],r11
	mov r11,  [rsp+8*5]
	mov qword [rsp+8*32],r8
	mov r8,r11
	add r8,1
	shl r8,3
	add r8,r10
	mov qword [rsp+8*33],r10
	mov r10,  [rsp+8*32]
	mov [r8],r10
	mov qword [rsp+8*34],r8
	mov r8,r9
	mov r10,r15
	add r10,1
	shl r10,3
	add r10,r8
	mov qword [rsp+8*35],r8
	mov r8,  [rsp+8*29]
	mov [r10],r8
	mov r8,r11
	inc r11 
	mov qword [rsp+8*37],r8
	mov r8,r15
	mov qword [rsp+8*38],r8
	mov r8,1
	mov r15,r15
	sub r15,r8
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*5],r11
	
L_220:
	jmp L_213
	
L_214:
	cmp r14,r15
	mov r8, 0
	setl r8B
	cmp r8, 0
	mov qword [rsp+8*39],r8
	je L_222
	mov r8,r15
	mov r9,r14
	mov qword rsi,r8
	mov qword rdi,r9
	push r15
	push r14
	push r13
	push r12
	call qsrt
	pop r12
	pop r13
	pop r14
	pop r15
	mov r8 , rax
	mov qword [rsp+8*40],r8
	
L_222:
	mov r8,  [rsp+8*5]
	mov r9,  [rsp+8*4]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*41],r10
	je L_224
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov r11,  [rsp+8*5]
	mov r10,r11
	mov qword rsi,r8
	mov qword rdi,r10
	push r15
	push r14
	push r13
	push r12
	call qsrt
	pop r12
	pop r13
	pop r14
	pop r15
	mov r8 , rax
	mov qword [rsp+8*42],r8
	
L_224:
	mov r8,0
	mov rax,r8
	leave
	ret
	
main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 552
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 2536
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
	mov qword [rsp+8*43],r8
	mov qword [rsp+8*44],r9
	
L_225:
	mov r8,  [rsp+8*44]
	mov r9,  [gbl+8*45]
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*46],r10
	je L_226
	mov r8,  [gbl+8*45]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r11,  [rsp+8*44]
	mov r10,r10
	sub r10,r11
	mov r8,  [gbl+8*9]
	mov r9,r8
	mov qword [rsp+8*47],r10
	mov r10,r11
	add r10,1
	shl r10,3
	add r10,r9
	mov qword [rsp+8*48],r9
	mov r9,  [rsp+8*47]
	mov [r10],r9
	mov r9,r11
	inc r11 
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*49],r10
	mov qword [rsp+8*44],r11
	jmp L_225
	
L_226:
	mov r9,  [gbl+8*45]
	mov r8,r9
	mov r11,1
	mov r10,r11
	mov qword rsi,r8
	mov qword rdi,r10
	push r15
	push r14
	push r13
	push r12
	call qsrt
	pop r12
	pop r13
	pop r14
	pop r15
	mov r8 , rax
	mov r10,1
	mov r9,r10
	mov qword [rsp+8*51],r8
	mov qword [rsp+8*44],r9
	
L_228:
	mov r8,  [rsp+8*44]
	mov r9,  [gbl+8*45]
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*52],r10
	je L_229
	mov r9,  [gbl+8*9]
	mov r8,r9
	mov r10,  [rsp+8*44]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*53],r8
	mov r8, [r11]
	mov qword [rsp+8*54],r11
	mov r11,r8
	mov qword [rsp+8*55],r8
	mov r8,r11
	mov qword [rsp+8*56],r8
	mov qword rdi,r11
	mov     rdi, [rsp+8*56]
	call    toString
	mov     qword[rsp+8*57], rax
	mov r9,  [rsp+8*57]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*58],r10
	mov rdi,[rsp+8*58] 
	add rdi, 1 
	call puts
	mov r9,  [rsp+8*44]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*59],r8
	mov qword [rsp+8*44],r9
	jmp L_228
	
L_229:
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 552
	mov     rdi, 101
	call    mallocArray
	mov     qword [gbl+8*60], rax
	mov r9,  [gbl+8*60]
	mov r8,r9
	mov r11,100
	mov r10,r11
	mov qword [gbl+8*9],r8
	mov qword [gbl+8*45],r10
	mov r8,  [rsp+8*61]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   2536
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
	

