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
        shl     rax, 4
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-18H]
        add     rax, 1
        shl     rax, 4
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
        jmp     cc_002

cc_001:  add     qword [rbp-10H], 1
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
cc_002:  mov     rax, qword [rbp-28H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      cc_001
        mov     qword [rbp-8H], 0
        jmp     cc_004

cc_003:  add     qword [rbp-10H], 1
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
cc_004:  mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      cc_003
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
        shl     rax, 4
        mov     rdx, rax
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
        jnz     CL_005
        mov     eax, dword [rbp-34H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-40H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     rdi, rax
        call    mallocArray
        jmp     CL_008

CL_005:  mov     eax, dword [rbp-34H]
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
        jmp     CL_007

CL_006:  mov     eax, dword [rbp-14H]
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
CL_007:  mov     eax, dword [rbp-14H]
        cdqe
        cmp     rax, qword [rbp-20H]
        jl      CL_006
        mov     rax, qword [rbp-28H]
CL_008:  add     rsp, 56
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
        cmp     qword [rbp-18H], 0
        jnz     mAd_005
        mov     rax, qword [rbp-28H]
        jmp     mAd_008

mAd_005:  mov     rax, qword [rbp-28H]
        mov     qword [rbp-10H], rax
        mov     qword [rbp-8H], 1
        jmp     mAd_007

mAd_006:  mov     rax, qword [rbp-8H]
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
mAd_007:  mov     rax, qword [rbp-8H]
        cmp     rax, qword [rbp-18H]
        jl      mAd_006
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
mAd_008:  leave
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
	sub    rsp, 1128
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 3112
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	push r14
	call global_init
	pop r14
	pop r15
	mov r8 , rax
	mov qword [rsp+8*1],r8
	call    getString
	mov     [rsp+8*2], rax
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov qword [arg+8*63],r8
	call    parseInt
	mov     qword [rsp+8*4], rax
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*2],r8
	mov qword [gbl+8*5],r10
	mov     rdi, [gbl+8*5]
	call    mallocArray
	mov     qword [rsp+8*6], rax
	mov r9,  [rsp+8*6]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [gbl+8*7],r8
	mov qword [rsp+8*8],r10
	
L_19:
	mov r9,  [gbl+8*7]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov r11, [r11]
	mov r12,  [rsp+8*8]
	cmp r12,r11
	mov r13, 0
	setl r13B
	mov qword [rsp+8*9],r8
	mov qword [arg+8*63],r10
	mov qword [rsp+8*10],r11
	mov qword [rsp+8*11],r13
	mov r8,  [rsp+8*11]
	cmp r8, 0
	je L_20
	mov r9,  [gbl+8*7]
	mov r8,r9
	mov r10,  [rsp+8*8]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov [r11],r10
	mov r12,1
	mov r13,r10
	add r13,r12
	mov r10,r13
	mov qword [rsp+8*12],r8
	mov qword [rsp+8*8],r10
	mov qword [rsp+8*13],r11
	mov qword [rsp+8*14],r13
	jmp L_19
	
L_20:
	mov r8,  [gbl+8*5]
	mov r9,1
	mov r10,r8
	sub r10,r9
	xor rdx, rdx
	mov rax, r10
	mov r11,2
	mov rbx, r11
	cdq
	idiv rbx
	mov r12, rax
	mov r13,r12
	mov r10,0
	mov r9,r10
	mov qword [rsp+8*18],r9
	mov r10,0
	mov r9,r10
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*16],r12
	mov qword [rsp+8*17],r13
	
L_71:
	mov r8,  [rsp+8*17]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*20],r10
	mov r8,  [rsp+8*20]
	cmp r8, 0
	je L_72
	mov r8,  [rsp+8*17]
	mov r9,2
	mov r10,r8
	imul r10,r9
	mov r11,r10
	mov r12,2
	mov r13,r8
	imul r13,r12
	mov r9,1
	mov r13,r13
	add r13,r9
	mov r9,  [gbl+8*5]
	cmp r13,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*23],r10
	mov qword [rsp+8*19],r11
	mov qword [rsp+8*22],r13
	mov r8,  [rsp+8*23]
	cmp r8, 0
	jne L_73
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*24],r8
	jmp L_74
	
L_73:
	mov r8,  [rsp+8*17]
	mov r9,2
	mov r10,r8
	imul r10,r9
	mov r11,1
	mov r10,r10
	add r10,r11
	mov r13,  [gbl+8*7]
	mov r12,r13
	mov r9,r10
	add r9,1
	shl r9,4
	add r9,r12
	mov r10, [r9]
	mov qword [rsp+8*27],r9
	mov r9,2
	mov r11,r8
	imul r11,r9
	mov r9,r13
	mov qword [rsp+8*26],r12
	mov r12,r11
	add r12,1
	shl r12,4
	add r12,r9
	mov qword [rsp+8*30],r9
	mov r9, [r12]
	cmp r10,r9
	mov r11, 0
	setl r11B
	mov qword [rsp+8*32],r9
	mov qword [rsp+8*28],r10
	mov qword [rsp+8*33],r11
	mov qword [rsp+8*31],r12
	mov r9,  [rsp+8*33]
	mov r8,r9
	mov qword [rsp+8*24],r8
	
L_74:
	mov r8,  [rsp+8*24]
	cmp r8, 0
	je L_75
	mov r8,  [rsp+8*17]
	mov r9,2
	mov r10,r8
	imul r10,r9
	mov r11,1
	mov r10,r10
	add r10,r11
	mov r12,r10
	mov qword [rsp+8*34],r10
	mov qword [rsp+8*19],r12
	
L_75:
	mov r9,  [gbl+8*7]
	mov r8,r9
	mov r10,  [rsp+8*17]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov qword [rsp+8*35],r8
	mov r8,  [rsp+8*19]
	mov qword [rsp+8*36],r11
	mov r11,r8
	add r11,1
	shl r11,4
	add r11,r13
	mov qword [rsp+8*38],r13
	mov r13, [r11]
	cmp r12,r13
	mov qword [rsp+8*39],r11
	mov r11, 0
	setg r11B
	mov qword [rsp+8*41],r11
	mov qword [rsp+8*37],r12
	mov qword [rsp+8*40],r13
	mov r8,  [rsp+8*41]
	cmp r8, 0
	je L_76
	mov r9,  [rsp+8*19]
	mov r8,r9
	mov r11,  [rsp+8*17]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	mov qword rsi,r8
	mov r9,  [gbl+8*7]
	mov r8,r9
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*46],r8
	mov r8, [r11]
	mov qword [rsp+8*47],r11
	mov r11,r8
	mov qword [rsp+8*48],r8
	mov r8,r9
	mov qword rdi,r10
	mov r10,r13
	add r10,1
	shl r10,4
	add r10,r8
	mov qword [rsp+8*50],r8
	mov r8, [r10]
	mov qword [rsp+8*51],r10
	mov r10,r9
	mov qword [rsp+8*49],r11
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r10
	mov [r11],r8
	mov qword [rsp+8*52],r8
	mov r8,r9
	mov qword [rsp+8*53],r10
	mov r10,r13
	add r10,1
	shl r10,4
	add r10,r8
	mov qword [rsp+8*55],r8
	mov r8,  [rsp+8*49]
	mov [r10],r8
	mov qword [rsp+8*56],r10
	mov r10,0
	mov r8,r10
	mov r10,r8
	mov qword [rsp+8*57],r8
	mov qword [rsp+8*58],r10
	mov qword [rsp+8*54],r11
	mov qword [rsp+8*44],r12
	mov qword [rsp+8*45],r13
	
L_76:
	mov r8,  [rsp+8*17]
	mov r9,1
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*17],r8
	mov qword [rsp+8*59],r10
	jmp L_71
	
L_72:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r12,0
	mov r11,r12
	mov qword [rsp+8*60],r8
	mov r8,0
	mov r13,r8
	mov qword [rsp+8*61],r10
	mov qword [rsp+8*62],r11
	mov qword [rsp+8*63],r13
	
L_81:
	mov r8,  [rsp+8*63]
	mov r9,  [gbl+8*5]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*64],r10
	mov r8,  [rsp+8*64]
	cmp r8, 0
	je L_82
	mov r9,  [gbl+8*7]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov qword [rsp+8*65],r8
	mov r8,  [gbl+8*5]
	mov r10,  [rsp+8*63]
	mov qword [rsp+8*66],r11
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*67],r12
	mov r12,1
	mov r11,r11
	sub r11,r12
	mov r12,r9
	mov qword [rsp+8*62],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r12
	mov r11, [r13]
	mov qword [rsp+8*69],r12
	mov r12,r9
	mov qword [rsp+8*70],r13
	mov r13,0
	mov r8,r13
	add r8,1
	shl r8,4
	add r8,r12
	mov [r8],r11
	mov qword [rsp+8*73],r8
	mov r8,  [gbl+8*5]
	mov qword [rsp+8*71],r11
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*72],r12
	mov r12,1
	mov r11,r11
	sub r11,r12
	mov r12,r9
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r12
	mov r11,  [rsp+8*62]
	mov [r13],r11
	mov r11,r8
	sub r11,r10
	mov r8,1
	mov r11,r11
	sub r11,r8
	mov r8,r11
	mov r11,r8
	mov qword [rsp+8*75],r12
	mov qword [rsp+8*76],r13
	mov r13,0
	mov r12,r13
	mov r9,0
	mov r13,r9
	mov r10,0
	mov r9,r10
	mov qword rdi,r8
	mov qword [rsp+8*81],r9
	mov qword [rsp+8*78],r11
	mov qword [rsp+8*79],r12
	mov qword [rsp+8*80],r13
	
L_83:
	mov r8,  [rsp+8*79]
	mov r9,2
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*78]
	cmp r10,r11
	mov r12, 0
	setl r12B
	mov qword [rsp+8*82],r10
	mov qword [rsp+8*83],r12
	mov r8,  [rsp+8*83]
	cmp r8, 0
	je L_84
	mov r8,  [rsp+8*79]
	mov r9,2
	mov r10,r8
	imul r10,r9
	mov r11,r10
	mov r12,2
	mov r13,r8
	imul r13,r12
	mov r9,1
	mov r13,r13
	add r13,r9
	mov r9,  [rsp+8*78]
	cmp r13,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*86],r10
	mov qword [rsp+8*80],r11
	mov qword [rsp+8*85],r13
	mov r8,  [rsp+8*86]
	cmp r8, 0
	jne L_85
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*87],r8
	jmp L_86
	
L_85:
	mov r8,  [rsp+8*79]
	mov r9,2
	mov r10,r8
	imul r10,r9
	mov r11,1
	mov r10,r10
	add r10,r11
	mov r13,  [gbl+8*7]
	mov r12,r13
	mov r9,r10
	add r9,1
	shl r9,4
	add r9,r12
	mov r10, [r9]
	mov qword [rsp+8*90],r9
	mov r9,2
	mov r11,r8
	imul r11,r9
	mov r9,r13
	mov qword [rsp+8*89],r12
	mov r12,r11
	add r12,1
	shl r12,4
	add r12,r9
	mov qword [rsp+8*93],r9
	mov r9, [r12]
	cmp r10,r9
	mov r11, 0
	setl r11B
	mov qword [rsp+8*95],r9
	mov qword [rsp+8*91],r10
	mov qword [rsp+8*96],r11
	mov qword [rsp+8*94],r12
	mov r9,  [rsp+8*96]
	mov r8,r9
	mov qword [rsp+8*87],r8
	
L_86:
	mov r8,  [rsp+8*87]
	cmp r8, 0
	je L_87
	mov r8,  [rsp+8*79]
	mov r9,2
	mov r10,r8
	imul r10,r9
	mov r11,1
	mov r10,r10
	add r10,r11
	mov r12,r10
	mov qword [rsp+8*97],r10
	mov qword [rsp+8*80],r12
	
L_87:
	mov r9,  [gbl+8*7]
	mov r8,r9
	mov r10,  [rsp+8*79]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov qword [rsp+8*98],r8
	mov r8,  [rsp+8*80]
	mov qword [rsp+8*99],r11
	mov r11,r8
	add r11,1
	shl r11,4
	add r11,r13
	mov qword [rsp+8*101],r13
	mov r13, [r11]
	cmp r12,r13
	mov qword [rsp+8*102],r11
	mov r11, 0
	setg r11B
	mov qword [rsp+8*104],r11
	mov qword [rsp+8*100],r12
	mov qword [rsp+8*103],r13
	mov r8,  [rsp+8*104]
	cmp r8, 0
	je L_88
	mov r9,  [gbl+8*7]
	mov r8,r9
	mov r10,  [rsp+8*79]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov qword [rsp+8*105],r8
	mov r8,r9
	mov qword [rsp+8*106],r11
	mov r11,  [rsp+8*80]
	mov qword [rsp+8*107],r12
	mov r12,r11
	add r12,1
	shl r12,4
	add r12,r8
	mov qword [rsp+8*109],r8
	mov r8, [r12]
	mov qword [rsp+8*110],r12
	mov r12,r9
	mov qword [rsp+8*108],r13
	mov r13,r10
	add r13,1
	shl r13,4
	add r13,r12
	mov [r13],r8
	mov qword [rsp+8*111],r8
	mov r8,r9
	mov qword [rsp+8*112],r12
	mov r12,r11
	add r12,1
	shl r12,4
	add r12,r8
	mov qword [rsp+8*114],r8
	mov r8,  [rsp+8*108]
	mov [r12],r8
	mov r10,r11
	mov qword [rsp+8*79],r10
	mov qword [rsp+8*115],r12
	mov qword [rsp+8*113],r13
	jmp L_89
	
L_88:
	jmp L_84
	
L_89:
	jmp L_83
	
L_84:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [rsp+8*63]
	mov r12,1
	mov r13,r11
	add r13,r12
	mov r11,r13
	mov qword [rsp+8*116],r8
	mov qword [rsp+8*117],r10
	mov qword [rsp+8*63],r11
	mov qword [rsp+8*118],r13
	jmp L_81
	
L_82:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r12,0
	mov r11,r12
	mov qword [rsp+8*119],r8
	mov qword [rsp+8*120],r10
	mov qword [rsp+8*8],r11
	
L_22:
	mov r9,  [gbl+8*7]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov r11, [r11]
	mov r12,  [rsp+8*8]
	cmp r12,r11
	mov r13, 0
	setl r13B
	mov qword [rsp+8*121],r8
	mov qword [arg+8*63],r10
	mov qword [rsp+8*122],r11
	mov qword [rsp+8*123],r13
	mov r8,  [rsp+8*123]
	cmp r8, 0
	je L_23
	mov r9,  [gbl+8*7]
	mov r8,r9
	mov r10,  [rsp+8*8]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov qword [rsp+8*124],r8
	mov r8,r13
	mov qword [rsp+8*127],r8
	mov qword [rsp+8*125],r11
	mov qword [rsp+8*126],r12
	mov qword rdi,r13
	mov     rdi, [rsp+8*127]
	call    toString
	mov     qword[rsp+8*128], rax
	mov     rsi, t234
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
	mov r8,  [rsp+8*8]
	mov r9,39997
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov qword [rsp+8*8],r8
	mov qword [rsp+8*131],r10
	jmp L_22
	
L_23:
	mov r9,t239
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*132],r10
	mov rdi, format
	mov rsi,[rsp+8*132] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1128
	mov r8,  [rsp+8*133]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   3112
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
	
t239:
	 db 1,"",10,"" ,0

t234:
	 db 1," " ,0


