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
	
L_219:
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
	je L_220
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*18]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*21],r8
	mov r8,0
	mov [r11],r8
	mov r8,r10
	inc r10 
	mov qword [rsp+8*23],r8
	mov qword [rsp+8*18],r10
	mov qword [rsp+8*22],r11
	jmp L_219
	
L_220:
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
	
L_222:
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
	je L_223
	mov r9,  [rsp+8*26]
	mov r8,r9
	mov r10,  [rsp+8*18]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*28],r8
	mov r8,0
	mov [r11],r8
	mov r8,r10
	inc r10 
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*18],r10
	mov qword [rsp+8*29],r11
	jmp L_222
	
L_223:
	mov     rdi, [rsp+8*2]
	call    mallocArray
	mov     qword [rsp+8*31], rax
	mov r9,  [rsp+8*31]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*32],r8
	mov qword [rsp+8*18],r10
	
L_225:
	mov r8,  [rsp+8*18]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*33],r10
	je L_226
	mov     rdi, [rsp+8*2]
	call    mallocArray
	mov     qword [rsp+8*34], rax
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*18]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*35],r8
	mov r8,  [rsp+8*34]
	mov [r11],r8
	mov qword [rsp+8*36],r11
	mov r11,0
	mov r8,r11
	mov qword [rsp+8*37],r8
	
L_228:
	mov r8,  [rsp+8*37]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*38],r10
	je L_229
	mov r8,1
	mov r9,r8
	neg r9
	mov r11,  [rsp+8*32]
	mov r10,r11
	mov r8,  [rsp+8*18]
	mov qword [rsp+8*39],r9
	mov r9,r8
	add r9,1
	shl r9,3
	add r9,r10
	mov r10, [r9]
	mov r11,  [rsp+8*37]
	mov r9,r11
	add r9,1
	shl r9,3
	add r9,r10
	mov qword [rsp+8*40],r10
	mov r10,  [rsp+8*39]
	mov [r9],r10
	mov qword [rsp+8*41],r9
	mov r9,r11
	inc r11 
	mov qword [rsp+8*42],r9
	mov qword [rsp+8*37],r11
	jmp L_228
	
L_229:
	mov r9,  [rsp+8*18]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*43],r8
	mov qword [rsp+8*18],r9
	jmp L_225
	
L_226:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*44],r8
	mov r8,  [rsp+8*5]
	mov [r11],r8
	mov qword [rsp+8*45],r11
	mov r11,  [rsp+8*26]
	mov r10,r11
	mov r9,0
	mov r8,r9
	add r8,1
	shl r8,3
	add r8,r10
	mov r9,  [rsp+8*6]
	mov [r8],r9
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*46],r10
	mov r10,  [rsp+8*32]
	mov r8,r10
	mov r11,  [rsp+8*5]
	mov r9,r11
	add r9,1
	shl r9,3
	add r9,r8
	mov r8, [r9]
	mov r11,  [rsp+8*6]
	mov r9,r11
	add r9,1
	shl r9,3
	add r9,r8
	mov qword [rsp+8*48],r8
	mov r8,0
	mov [r9],r8
	mov qword [rsp+8*49],r9
	
L_231:
	mov r8,  [rsp+8*3]
	mov r9,  [rsp+8*4]
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*50],r10
	je L_232
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*51],r8
	mov r8, [r11]
	mov qword [rsp+8*52],r11
	mov r9,  [rsp+8*26]
	mov r11,r9
	mov qword [rsp+8*53],r8
	mov r8,r10
	add r8,1
	shl r8,3
	add r8,r11
	mov qword [rsp+8*54],r11
	mov r11, [r8]
	mov qword [rsp+8*55],r8
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*53]
	mov qword [rsp+8*56],r11
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov r8, [r11]
	mov r10,  [rsp+8*56]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov qword [rsp+8*57],r8
	mov r8, [r11]
	mov r10,r8
	mov qword [rsp+8*59],r8
	mov qword [rsp+8*58],r11
	mov r11,  [rsp+8*17]
	mov r8,r11
	mov r9,  [rsp+8*3]
	mov qword [rsp+8*13],r10
	mov r10,r9
	add r10,1
	shl r10,3
	add r10,r8
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
	mov r8,r9
	add r8,1
	shl r8,3
	add r8,r10
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
	jne L_321
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_322
	
L_321:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_322:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*75],r10
	jne L_233
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_234
	
L_233:
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
	jne L_325
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_326
	
L_325:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_326:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*77],r10
	mov qword [rsp+8*76],r11
	
L_234:
	mov r8,  [rsp+8*76]
	cmp r8, 0
	je L_236
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	mov r11,r9
	add r11,1
	shl r11,3
	add r11,r8
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
	je L_238
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r11
	mov qword [rsp+8*84],r11
	mov r11,  [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*85],r10
	mov r9,  [rsp+8*26]
	mov r10,r9
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r10
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
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r9
	mov r9, [r11]
	mov r10,  [rsp+8*12]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r9
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
	jne L_239
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*91],r8
	jmp L_240
	
L_239:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*92],r10
	mov qword [rsp+8*91],r11
	
L_240:
	mov r8,  [rsp+8*91]
	cmp r8, 0
	je L_242
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_242:
	
L_238:
	
L_236:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
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
	mov r8,r10
	add r8,1
	shl r8,3
	add r8,r9
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
	jne L_329
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_330
	
L_329:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_330:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*101],r10
	jne L_243
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*102],r8
	jmp L_244
	
L_243:
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
	jne L_333
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_334
	
L_333:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_334:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*103],r10
	mov qword [rsp+8*102],r11
	
L_244:
	mov r8,  [rsp+8*102]
	cmp r8, 0
	je L_246
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	mov r11,r9
	add r11,1
	shl r11,3
	add r11,r8
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
	je L_248
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r11
	mov qword [rsp+8*110],r11
	mov r11,  [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*111],r10
	mov r9,  [rsp+8*26]
	mov r10,r9
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r10
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
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r9
	mov r9, [r11]
	mov r10,  [rsp+8*12]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r9
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
	jne L_249
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*117],r8
	jmp L_250
	
L_249:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*118],r10
	mov qword [rsp+8*117],r11
	
L_250:
	mov r8,  [rsp+8*117]
	cmp r8, 0
	je L_252
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_252:
	
L_248:
	
L_246:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
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
	mov r8,r10
	add r8,1
	shl r8,3
	add r8,r9
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
	jne L_337
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_338
	
L_337:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_338:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*127],r10
	jne L_253
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*128],r8
	jmp L_254
	
L_253:
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
	jne L_341
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_342
	
L_341:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_342:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*129],r10
	mov qword [rsp+8*128],r11
	
L_254:
	mov r8,  [rsp+8*128]
	cmp r8, 0
	je L_256
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	mov r11,r9
	add r11,1
	shl r11,3
	add r11,r8
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
	je L_258
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r11
	mov qword [rsp+8*136],r11
	mov r11,  [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*137],r10
	mov r9,  [rsp+8*26]
	mov r10,r9
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r10
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
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r9
	mov r9, [r11]
	mov r10,  [rsp+8*12]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r9
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
	jne L_259
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*143],r8
	jmp L_260
	
L_259:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*144],r10
	mov qword [rsp+8*143],r11
	
L_260:
	mov r8,  [rsp+8*143]
	cmp r8, 0
	je L_262
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_262:
	
L_258:
	
L_256:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
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
	mov r8,r10
	add r8,1
	shl r8,3
	add r8,r9
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
	jne L_345
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_346
	
L_345:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_346:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*153],r10
	jne L_263
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*154],r8
	jmp L_264
	
L_263:
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
	jne L_349
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_350
	
L_349:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_350:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*155],r10
	mov qword [rsp+8*154],r11
	
L_264:
	mov r8,  [rsp+8*154]
	cmp r8, 0
	je L_266
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	mov r11,r9
	add r11,1
	shl r11,3
	add r11,r8
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
	je L_268
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r11
	mov qword [rsp+8*162],r11
	mov r11,  [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*163],r10
	mov r9,  [rsp+8*26]
	mov r10,r9
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r10
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
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r9
	mov r9, [r11]
	mov r10,  [rsp+8*12]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r9
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
	jne L_269
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*169],r8
	jmp L_270
	
L_269:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*170],r10
	mov qword [rsp+8*169],r11
	
L_270:
	mov r8,  [rsp+8*169]
	cmp r8, 0
	je L_272
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_272:
	
L_268:
	
L_266:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
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
	mov r8,r10
	add r8,1
	shl r8,3
	add r8,r9
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
	jne L_353
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_354
	
L_353:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_354:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*179],r10
	jne L_273
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*180],r8
	jmp L_274
	
L_273:
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
	jne L_357
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_358
	
L_357:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_358:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*181],r10
	mov qword [rsp+8*180],r11
	
L_274:
	mov r8,  [rsp+8*180]
	cmp r8, 0
	je L_276
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	mov r11,r9
	add r11,1
	shl r11,3
	add r11,r8
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
	je L_278
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r11
	mov qword [rsp+8*188],r11
	mov r11,  [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*189],r10
	mov r9,  [rsp+8*26]
	mov r10,r9
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r10
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
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r9
	mov r9, [r11]
	mov r10,  [rsp+8*12]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r9
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
	jne L_279
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*195],r8
	jmp L_280
	
L_279:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*196],r10
	mov qword [rsp+8*195],r11
	
L_280:
	mov r8,  [rsp+8*195]
	cmp r8, 0
	je L_282
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_282:
	
L_278:
	
L_276:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
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
	mov r8,r10
	add r8,1
	shl r8,3
	add r8,r9
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
	jne L_361
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_362
	
L_361:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_362:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*205],r10
	jne L_283
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*206],r8
	jmp L_284
	
L_283:
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
	jne L_365
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_366
	
L_365:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_366:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*207],r10
	mov qword [rsp+8*206],r11
	
L_284:
	mov r8,  [rsp+8*206]
	cmp r8, 0
	je L_286
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	mov r11,r9
	add r11,1
	shl r11,3
	add r11,r8
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
	je L_288
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r11
	mov qword [rsp+8*214],r11
	mov r11,  [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*215],r10
	mov r9,  [rsp+8*26]
	mov r10,r9
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r10
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
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r9
	mov r9, [r11]
	mov r10,  [rsp+8*12]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r9
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
	jne L_289
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*221],r8
	jmp L_290
	
L_289:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*222],r10
	mov qword [rsp+8*221],r11
	
L_290:
	mov r8,  [rsp+8*221]
	cmp r8, 0
	je L_292
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_292:
	
L_288:
	
L_286:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
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
	mov r8,r10
	add r8,1
	shl r8,3
	add r8,r9
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
	jne L_369
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_370
	
L_369:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_370:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*231],r10
	jne L_293
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*232],r8
	jmp L_294
	
L_293:
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
	jne L_373
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_374
	
L_373:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_374:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*233],r10
	mov qword [rsp+8*232],r11
	
L_294:
	mov r8,  [rsp+8*232]
	cmp r8, 0
	je L_296
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	mov r11,r9
	add r11,1
	shl r11,3
	add r11,r8
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
	je L_298
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r11
	mov qword [rsp+8*240],r11
	mov r11,  [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*241],r10
	mov r9,  [rsp+8*26]
	mov r10,r9
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r10
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
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r9
	mov r9, [r11]
	mov r10,  [rsp+8*12]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r9
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
	jne L_299
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*247],r8
	jmp L_300
	
L_299:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*248],r10
	mov qword [rsp+8*247],r11
	
L_300:
	mov r8,  [rsp+8*247]
	cmp r8, 0
	je L_302
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_302:
	
L_298:
	
L_296:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
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
	mov r8,r10
	add r8,1
	shl r8,3
	add r8,r9
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
	jne L_377
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_378
	
L_377:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_378:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*257],r10
	jne L_303
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*258],r8
	jmp L_304
	
L_303:
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
	jne L_381
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_382
	
L_381:
	mov r8,  [rsp+8*70]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*72],r11
	
L_382:
	mov r9,  [rsp+8*72]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*259],r10
	mov qword [rsp+8*258],r11
	
L_304:
	mov r8,  [rsp+8*258]
	cmp r8, 0
	je L_306
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*12]
	mov r11,r9
	add r11,1
	shl r11,3
	add r11,r8
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
	je L_308
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [rsp+8*17]
	mov r11,r9
	mov r9,r8
	add r9,1
	shl r9,3
	add r9,r11
	mov r10,  [rsp+8*11]
	mov [r9],r10
	mov qword [rsp+8*267],r9
	mov qword [rsp+8*266],r11
	mov r11,  [rsp+8*26]
	mov r9,r11
	mov r11,r8
	add r11,1
	shl r11,3
	add r11,r9
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
	mov r10,r8
	add r10,1
	shl r10,3
	add r10,r9
	mov r9, [r10]
	mov r11,  [rsp+8*12]
	mov r10,r11
	add r10,1
	shl r10,3
	add r10,r9
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
	jne L_309
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*273],r8
	jmp L_310
	
L_309:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*274],r10
	mov qword [rsp+8*273],r11
	
L_310:
	mov r8,  [rsp+8*273]
	cmp r8, 0
	je L_312
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_312:
	
L_308:
	
L_306:
	mov r8,  [rsp+8*14]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*275],r10
	je L_314
	jmp L_232
	
L_314:
	mov r8,  [rsp+8*3]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov qword [rsp+8*3],r8
	mov qword [rsp+8*276],r10
	jmp L_231
	
L_232:
	mov r8,  [rsp+8*14]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*277],r10
	je L_315
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,  [rsp+8*8]
	mov r11,r10
	add r11,1
	shl r11,3
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*10]
	mov r11,r9
	add r11,1
	shl r11,3
	add r11,r8
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
	jmp L_316
	
L_315:
	mov r9,t442
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*284],r10
	mov rdi,[rsp+8*284] 
	add rdi, 1 
	call puts
	
L_316:
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


