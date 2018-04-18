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
	sub    rsp, 6296
	call global_init
	mov r8 , rax
	mov qword [rsp+8*1],r8
	
L_627:
	mov r8,1
	mov r9,29
	mov r10,r8
	shl r10,29
	mov r11, qword [gbl+8*3]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*2],r10
	mov qword [rsp+8*4],r12
	mov r8, qword [rsp+8*4]
	cmp r8, 0
	jne L_629
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*5],r8
	jmp L_630
	
L_629:
	mov r8,1
	mov r9,29
	mov r10,r8
	shl r10,29
	mov r11,r10
	neg r11
	mov r12, qword [gbl+8*3]
	cmp r12,r11
	mov r13, 0
	setg r13B
	mov qword [rsp+8*6],r10
	mov qword [rsp+8*7],r11
	mov qword [rsp+8*8],r13
	mov r9, qword [rsp+8*8]
	mov r8,r9
	mov qword [rsp+8*5],r8
	
L_630:
	mov r8, qword [rsp+8*5]
	cmp r8, 0
	je L_628
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov r10,r8
	sub r10,r9
	mov r11, qword [gbl+8*11]
	mov r12,r10
	add r12,r11
	mov r13,r9
	add r13,r11
	mov r14,r12
	sub r14,r13
	mov r15,r8
	sub r15,r9
	mov qword [rsp+8*10],r10
	mov r10,r15
	add r10,r11
	mov qword [rsp+8*12],r12
	mov r12,r9
	add r12,r11
	mov qword [rsp+8*13],r13
	mov r13,r10
	sub r13,r12
	mov r8,r14
	add r8,r13
	mov qword [rsp+8*15],r15
	mov r15, qword [gbl+8*3]
	mov r11,r15
	sub r11,r9
	mov qword [rsp+8*16],r10
	mov r10, qword [gbl+8*11]
	mov qword [rsp+8*17],r12
	mov r12,r11
	add r12,r10
	mov qword [rsp+8*19],r8
	mov r8,r9
	add r8,r10
	mov qword [rsp+8*18],r13
	mov r13,r12
	sub r13,r8
	mov qword [rsp+8*14],r14
	mov r14,r15
	sub r14,r9
	mov qword [rsp+8*20],r11
	mov r11,r14
	add r11,r10
	mov qword [rsp+8*22],r8
	mov r8,r13
	add r8,r11
	mov qword [rsp+8*21],r12
	mov r12, qword [rsp+8*19]
	mov r9,r12
	add r9,r8
	mov r15, qword [gbl+8*9]
	mov qword [rsp+8*24],r14
	mov r14,r15
	add r14,r10
	mov qword [rsp+8*25],r11
	mov r11, qword [gbl+8*3]
	mov qword [rsp+8*23],r13
	mov r13,r11
	sub r13,r15
	mov qword [rsp+8*26],r8
	mov r8,r13
	add r8,r10
	mov qword [rsp+8*27],r9
	mov r9,r14
	add r9,r8
	mov r12,r15
	add r12,r10
	mov r11,r9
	sub r11,r12
	mov qword [rsp+8*29],r13
	mov r13, qword [gbl+8*3]
	mov qword [rsp+8*30],r8
	mov r8,r13
	sub r8,r15
	mov qword [rsp+8*28],r14
	mov r14,r8
	add r14,r10
	mov qword [rsp+8*31],r9
	mov r9,r15
	add r9,r10
	mov qword [rsp+8*33],r11
	mov r11,r14
	sub r11,r9
	mov qword [rsp+8*32],r12
	mov r12,r13
	sub r12,r15
	mov qword [rsp+8*34],r8
	mov r8,r12
	add r8,r10
	mov qword [rsp+8*36],r9
	mov r9,r11
	add r9,r8
	mov qword [rsp+8*35],r14
	mov r14, qword [rsp+8*33]
	mov r13,r14
	add r13,r9
	mov r15, qword [rsp+8*27]
	mov r10,r15
	sub r10,r13
	mov qword [rsp+8*38],r12
	mov r12, qword [gbl+8*9]
	mov qword [rsp+8*39],r8
	mov r8, qword [gbl+8*11]
	mov qword [rsp+8*37],r11
	mov r11,r12
	add r11,r8
	mov qword [rsp+8*40],r9
	mov r9, qword [gbl+8*3]
	mov r14,r9
	sub r14,r12
	mov qword [rsp+8*42],r10
	mov r10,r14
	add r10,r8
	mov qword [rsp+8*41],r13
	mov r13,r11
	add r13,r10
	mov r15,r12
	add r15,r8
	mov qword [rsp+8*44],r14
	mov r14,r9
	sub r14,r12
	mov qword [rsp+8*45],r10
	mov r10,r14
	add r10,r8
	mov qword [rsp+8*43],r11
	mov r11,r15
	add r11,r10
	mov r9,r13
	sub r9,r11
	mov qword [rsp+8*48],r14
	mov r14,r12
	add r14,r8
	mov qword [rsp+8*49],r10
	mov r10, qword [gbl+8*3]
	mov qword [rsp+8*47],r15
	mov r15,r10
	sub r15,r12
	mov qword [rsp+8*51],r9
	mov r9,r15
	add r9,r8
	mov qword [rsp+8*50],r11
	mov r11,r14
	add r11,r9
	mov qword [rsp+8*46],r13
	mov r13,r12
	add r13,r8
	mov r10,r11
	sub r10,r13
	mov qword [rsp+8*53],r15
	mov r15, qword [rsp+8*51]
	mov qword [rsp+8*54],r9
	mov r9,r15
	sub r9,r10
	mov qword [rsp+8*52],r14
	mov r14, qword [gbl+8*3]
	mov r8,r14
	sub r8,r12
	mov qword [rsp+8*55],r11
	mov r11, qword [gbl+8*11]
	mov qword [rsp+8*56],r13
	mov r13,r8
	add r13,r11
	mov qword [rsp+8*58],r9
	mov r9,r12
	add r9,r11
	mov qword [rsp+8*57],r10
	mov r10,r13
	sub r10,r9
	mov r15,r14
	sub r15,r12
	mov qword [rsp+8*59],r8
	mov r8,r15
	add r8,r11
	mov qword [rsp+8*61],r9
	mov r9,r10
	add r9,r8
	mov qword [rsp+8*60],r13
	mov r13,r12
	add r13,r11
	mov qword [rsp+8*63],r15
	mov r15,r14
	sub r15,r12
	mov qword [rsp+8*64],r8
	mov r8,r15
	add r8,r11
	mov qword [rsp+8*65],r9
	mov r9,r13
	add r9,r8
	mov qword [rsp+8*62],r10
	mov r10,r12
	add r10,r11
	mov r14,r9
	sub r14,r10
	mov qword [rsp+8*67],r15
	mov r15, qword [rsp+8*65]
	mov qword [rsp+8*68],r8
	mov r8,r15
	sub r8,r14
	mov qword [rsp+8*66],r13
	mov r13, qword [rsp+8*58]
	mov r11,r13
	add r11,r8
	mov r12, qword [rsp+8*42]
	mov qword [rsp+8*69],r9
	mov r9,r12
	sub r9,r11
	mov qword [rsp+8*70],r10
	mov r10, qword [gbl+8*3]
	mov qword [rsp+8*71],r14
	mov r14, qword [gbl+8*9]
	mov r15,r10
	sub r15,r14
	mov qword [rsp+8*72],r8
	mov r8, qword [gbl+8*11]
	mov r13,r15
	add r13,r8
	mov qword [rsp+8*74],r9
	mov r9,r14
	add r9,r8
	mov qword [rsp+8*73],r11
	mov r11,r13
	sub r11,r9
	mov r12,r10
	sub r12,r14
	mov qword [rsp+8*75],r15
	mov r15,r12
	add r15,r8
	mov qword [rsp+8*77],r9
	mov r9,r14
	add r9,r8
	mov qword [rsp+8*78],r11
	mov r11,r15
	sub r11,r9
	mov qword [rsp+8*76],r13
	mov r13, qword [rsp+8*78]
	mov r10,r13
	add r10,r11
	mov qword [rsp+8*79],r12
	mov r12, qword [gbl+8*3]
	mov r8,r12
	sub r8,r14
	mov qword [rsp+8*81],r9
	mov r9, qword [gbl+8*11]
	mov qword [rsp+8*80],r15
	mov r15,r8
	add r15,r9
	mov qword [rsp+8*83],r10
	mov r10,r14
	add r10,r9
	mov qword [rsp+8*82],r11
	mov r11,r15
	sub r11,r10
	mov r13,r12
	sub r13,r14
	mov qword [rsp+8*84],r8
	mov r8,r13
	add r8,r9
	mov qword [rsp+8*86],r10
	mov r10,r11
	add r10,r8
	mov qword [rsp+8*85],r15
	mov r15, qword [rsp+8*83]
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*88],r13
	mov r13,r14
	add r13,r9
	mov qword [rsp+8*89],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*87],r11
	mov r11,r8
	sub r11,r14
	mov qword [rsp+8*90],r10
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*91],r12
	mov r12,r13
	add r12,r10
	mov r15,r14
	add r15,r9
	mov r8,r12
	sub r8,r15
	mov qword [rsp+8*93],r11
	mov r11, qword [gbl+8*3]
	mov qword [rsp+8*94],r10
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*92],r13
	mov r13,r10
	add r13,r9
	mov qword [rsp+8*97],r8
	mov r8,r14
	add r8,r9
	mov qword [rsp+8*95],r12
	mov r12,r13
	sub r12,r8
	mov qword [rsp+8*96],r15
	mov r15,r11
	sub r15,r14
	mov qword [rsp+8*98],r10
	mov r10,r15
	add r10,r9
	mov qword [rsp+8*100],r8
	mov r8,r12
	add r8,r10
	mov qword [rsp+8*99],r13
	mov r13, qword [rsp+8*97]
	mov r11,r13
	add r11,r8
	mov r14, qword [rsp+8*91]
	mov r9,r14
	sub r9,r11
	mov qword [rsp+8*102],r15
	mov r15, qword [gbl+8*9]
	mov qword [rsp+8*103],r10
	mov r10, qword [gbl+8*11]
	mov qword [rsp+8*101],r12
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*104],r8
	mov r8, qword [gbl+8*3]
	mov r13,r8
	sub r13,r15
	mov qword [rsp+8*106],r9
	mov r9,r13
	add r9,r10
	mov qword [rsp+8*105],r11
	mov r11,r12
	add r11,r9
	mov r14,r15
	add r14,r10
	mov r8,r11
	sub r8,r14
	mov qword [rsp+8*108],r13
	mov r13, qword [gbl+8*3]
	mov qword [rsp+8*109],r9
	mov r9,r13
	sub r9,r15
	mov qword [rsp+8*107],r12
	mov r12,r9
	add r12,r10
	mov qword [rsp+8*112],r8
	mov r8,r15
	add r8,r10
	mov qword [rsp+8*110],r11
	mov r11,r12
	sub r11,r8
	mov qword [rsp+8*111],r14
	mov r14,r13
	sub r14,r15
	mov qword [rsp+8*113],r9
	mov r9,r14
	add r9,r10
	mov qword [rsp+8*115],r8
	mov r8,r11
	add r8,r9
	mov qword [rsp+8*114],r12
	mov r12, qword [rsp+8*112]
	mov r13,r12
	add r13,r8
	mov qword [rsp+8*117],r14
	mov r14,r15
	add r14,r10
	mov qword [rsp+8*118],r9
	mov r9, qword [gbl+8*3]
	mov qword [rsp+8*116],r11
	mov r11,r9
	sub r11,r15
	mov qword [rsp+8*119],r8
	mov r8,r11
	add r8,r10
	mov r12,r14
	add r12,r8
	mov qword [rsp+8*120],r13
	mov r13,r15
	add r13,r10
	mov r9,r12
	sub r9,r13
	mov qword [rsp+8*122],r11
	mov r11, qword [gbl+8*3]
	mov qword [rsp+8*123],r8
	mov r8,r11
	sub r8,r15
	mov qword [rsp+8*121],r14
	mov r14,r8
	add r14,r10
	mov qword [rsp+8*126],r9
	mov r9,r15
	add r9,r10
	mov qword [rsp+8*124],r12
	mov r12,r14
	sub r12,r9
	mov qword [rsp+8*125],r13
	mov r13,r11
	sub r13,r15
	mov qword [rsp+8*127],r8
	mov r8,r13
	add r8,r10
	mov qword [rsp+8*129],r9
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*128],r14
	mov r14, qword [rsp+8*126]
	mov r11,r14
	add r11,r9
	mov r15, qword [rsp+8*120]
	mov r10,r15
	sub r10,r11
	mov qword [rsp+8*131],r13
	mov r13, qword [rsp+8*106]
	mov qword [rsp+8*132],r8
	mov r8,r13
	sub r8,r10
	mov qword [rsp+8*130],r12
	mov r12, qword [rsp+8*74]
	mov qword [rsp+8*133],r9
	mov r9,r12
	add r9,r8
	mov r14, qword [gbl+8*9]
	mov qword [rsp+8*134],r11
	mov r11, qword [gbl+8*11]
	mov r15,r14
	add r15,r11
	mov qword [rsp+8*135],r10
	mov r10, qword [gbl+8*3]
	mov r13,r10
	sub r13,r14
	mov qword [rsp+8*136],r8
	mov r8,r13
	add r8,r11
	mov qword [rsp+8*137],r9
	mov r9,r15
	add r9,r8
	mov r12,r14
	add r12,r11
	mov qword [rsp+8*139],r13
	mov r13,r10
	sub r13,r14
	mov qword [rsp+8*140],r8
	mov r8,r13
	add r8,r11
	mov qword [rsp+8*141],r9
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*138],r15
	mov r15, qword [rsp+8*141]
	mov r10,r15
	sub r10,r9
	mov qword [rsp+8*143],r13
	mov r13,r14
	add r13,r11
	mov qword [rsp+8*144],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*142],r12
	mov r12,r8
	sub r12,r14
	mov qword [rsp+8*145],r9
	mov r9,r12
	add r9,r11
	mov qword [rsp+8*146],r10
	mov r10,r13
	add r10,r9
	mov r15,r14
	add r15,r11
	mov r8,r10
	sub r8,r15
	mov qword [rsp+8*148],r12
	mov r12, qword [rsp+8*146]
	mov qword [rsp+8*149],r9
	mov r9,r12
	sub r9,r8
	mov qword [rsp+8*147],r13
	mov r13, qword [gbl+8*3]
	mov r11,r13
	sub r11,r14
	mov qword [rsp+8*150],r10
	mov r10, qword [gbl+8*11]
	mov qword [rsp+8*151],r15
	mov r15,r11
	add r15,r10
	mov qword [rsp+8*152],r8
	mov r8,r14
	add r8,r10
	mov qword [rsp+8*153],r9
	mov r9,r15
	sub r9,r8
	mov r12,r13
	sub r12,r14
	mov qword [rsp+8*154],r11
	mov r11,r12
	add r11,r10
	mov qword [rsp+8*156],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*155],r15
	mov r15,r14
	add r15,r10
	mov qword [rsp+8*158],r12
	mov r12,r13
	sub r12,r14
	mov qword [rsp+8*160],r8
	mov r8,r12
	add r8,r10
	mov qword [rsp+8*157],r9
	mov r9,r15
	add r9,r8
	mov qword [rsp+8*159],r11
	mov r11,r14
	add r11,r10
	mov r13,r9
	sub r13,r11
	mov qword [rsp+8*162],r12
	mov r12, qword [rsp+8*160]
	mov qword [rsp+8*163],r8
	mov r8,r12
	sub r8,r13
	mov qword [rsp+8*161],r15
	mov r15, qword [rsp+8*153]
	mov r10,r15
	add r10,r8
	mov r14, qword [gbl+8*3]
	mov qword [rsp+8*164],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*165],r11
	mov r11,r14
	sub r11,r9
	mov r12, qword [gbl+8*11]
	mov qword [rsp+8*166],r13
	mov r13,r11
	add r13,r12
	mov qword [rsp+8*167],r8
	mov r8,r9
	add r8,r12
	mov qword [rsp+8*168],r10
	mov r10,r13
	sub r10,r8
	mov r15,r14
	sub r15,r9
	mov qword [rsp+8*169],r11
	mov r11,r15
	add r11,r12
	mov qword [rsp+8*171],r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*170],r13
	mov r13,r9
	add r13,r12
	mov qword [rsp+8*173],r15
	mov r15,r14
	sub r15,r9
	mov qword [rsp+8*175],r8
	mov r8,r15
	add r8,r12
	mov qword [rsp+8*172],r10
	mov r10,r13
	add r10,r8
	mov qword [rsp+8*174],r11
	mov r11,r9
	add r11,r12
	mov r14,r10
	sub r14,r11
	mov qword [rsp+8*177],r15
	mov r15, qword [rsp+8*175]
	mov qword [rsp+8*178],r8
	mov r8,r15
	sub r8,r14
	mov qword [rsp+8*176],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r9
	mov qword [rsp+8*179],r10
	mov r10, qword [gbl+8*11]
	mov qword [rsp+8*180],r11
	mov r11,r12
	add r11,r10
	mov qword [rsp+8*182],r8
	mov r8,r9
	add r8,r10
	mov qword [rsp+8*181],r14
	mov r14,r11
	sub r14,r8
	mov r15,r13
	sub r15,r9
	mov qword [rsp+8*183],r12
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*185],r8
	mov r8,r14
	add r8,r12
	mov qword [rsp+8*184],r11
	mov r11,r9
	add r11,r10
	mov qword [rsp+8*187],r15
	mov r15,r13
	sub r15,r9
	mov qword [rsp+8*189],r8
	mov r8,r15
	add r8,r10
	mov qword [rsp+8*188],r12
	mov r12,r11
	add r12,r8
	mov qword [rsp+8*186],r14
	mov r14,r9
	add r14,r10
	mov r13,r12
	sub r13,r14
	mov qword [rsp+8*191],r15
	mov r15, qword [rsp+8*189]
	mov qword [rsp+8*192],r8
	mov r8,r15
	sub r8,r13
	mov qword [rsp+8*190],r11
	mov r11, qword [rsp+8*182]
	mov r9,r11
	add r9,r8
	mov r10, qword [rsp+8*168]
	mov qword [rsp+8*193],r12
	mov r12,r10
	add r12,r9
	mov qword [rsp+8*194],r14
	mov r14, qword [gbl+8*3]
	mov qword [rsp+8*195],r13
	mov r13, qword [gbl+8*9]
	mov r15,r14
	sub r15,r13
	mov qword [rsp+8*196],r8
	mov r8, qword [gbl+8*11]
	mov r11,r15
	add r11,r8
	mov qword [rsp+8*197],r9
	mov r9,r13
	add r9,r8
	mov r10,r11
	sub r10,r9
	mov qword [rsp+8*198],r12
	mov r12,r14
	sub r12,r13
	mov qword [rsp+8*199],r15
	mov r15,r12
	add r15,r8
	mov qword [rsp+8*201],r9
	mov r9,r13
	add r9,r8
	mov qword [rsp+8*202],r10
	mov r10,r15
	sub r10,r9
	mov qword [rsp+8*200],r11
	mov r11, qword [rsp+8*202]
	mov r14,r11
	add r14,r10
	mov qword [rsp+8*203],r12
	mov r12, qword [gbl+8*3]
	mov r8,r12
	sub r8,r13
	mov qword [rsp+8*205],r9
	mov r9, qword [gbl+8*11]
	mov qword [rsp+8*204],r15
	mov r15,r8
	add r15,r9
	mov qword [rsp+8*206],r10
	mov r10,r13
	add r10,r9
	mov r11,r15
	sub r11,r10
	mov qword [rsp+8*207],r14
	mov r14,r12
	sub r14,r13
	mov qword [rsp+8*208],r8
	mov r8,r14
	add r8,r9
	mov qword [rsp+8*210],r10
	mov r10,r11
	add r10,r8
	mov qword [rsp+8*209],r15
	mov r15, qword [rsp+8*207]
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*212],r14
	mov r14,r13
	add r14,r9
	mov qword [rsp+8*213],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*211],r11
	mov r11,r8
	sub r11,r13
	mov qword [rsp+8*214],r10
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*215],r12
	mov r12,r14
	add r12,r10
	mov r15,r13
	add r15,r9
	mov r8,r12
	sub r8,r15
	mov qword [rsp+8*217],r11
	mov r11, qword [gbl+8*3]
	mov qword [rsp+8*218],r10
	mov r10,r11
	sub r10,r13
	mov qword [rsp+8*216],r14
	mov r14,r10
	add r14,r9
	mov qword [rsp+8*221],r8
	mov r8,r13
	add r8,r9
	mov qword [rsp+8*219],r12
	mov r12,r14
	sub r12,r8
	mov qword [rsp+8*220],r15
	mov r15,r11
	sub r15,r13
	mov qword [rsp+8*222],r10
	mov r10,r15
	add r10,r9
	mov qword [rsp+8*224],r8
	mov r8,r12
	add r8,r10
	mov qword [rsp+8*223],r14
	mov r14, qword [rsp+8*221]
	mov r11,r14
	add r11,r8
	mov r13, qword [rsp+8*215]
	mov r9,r13
	sub r9,r11
	mov qword [rsp+8*226],r15
	mov r15, qword [gbl+8*9]
	mov qword [rsp+8*227],r10
	mov r10, qword [gbl+8*11]
	mov qword [rsp+8*225],r12
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*228],r8
	mov r8, qword [gbl+8*3]
	mov r14,r8
	sub r14,r15
	mov qword [rsp+8*230],r9
	mov r9,r14
	add r9,r10
	mov qword [rsp+8*229],r11
	mov r11,r12
	add r11,r9
	mov r13,r15
	add r13,r10
	mov r8,r11
	sub r8,r13
	mov qword [rsp+8*232],r14
	mov r14, qword [gbl+8*3]
	mov qword [rsp+8*233],r9
	mov r9,r14
	sub r9,r15
	mov qword [rsp+8*231],r12
	mov r12,r9
	add r12,r10
	mov qword [rsp+8*236],r8
	mov r8,r15
	add r8,r10
	mov qword [rsp+8*234],r11
	mov r11,r12
	sub r11,r8
	mov qword [rsp+8*235],r13
	mov r13,r14
	sub r13,r15
	mov qword [rsp+8*237],r9
	mov r9,r13
	add r9,r10
	mov qword [rsp+8*239],r8
	mov r8,r11
	add r8,r9
	mov qword [rsp+8*238],r12
	mov r12, qword [rsp+8*236]
	mov r14,r12
	add r14,r8
	mov qword [rsp+8*241],r13
	mov r13,r15
	add r13,r10
	mov qword [rsp+8*242],r9
	mov r9, qword [gbl+8*3]
	mov qword [rsp+8*240],r11
	mov r11,r9
	sub r11,r15
	mov qword [rsp+8*243],r8
	mov r8,r11
	add r8,r10
	mov r12,r13
	add r12,r8
	mov qword [rsp+8*244],r14
	mov r14,r15
	add r14,r10
	mov r9,r12
	sub r9,r14
	mov qword [rsp+8*246],r11
	mov r11, qword [gbl+8*3]
	mov qword [rsp+8*247],r8
	mov r8,r11
	sub r8,r15
	mov qword [rsp+8*245],r13
	mov r13,r8
	add r13,r10
	mov qword [rsp+8*250],r9
	mov r9,r15
	add r9,r10
	mov qword [rsp+8*248],r12
	mov r12,r13
	sub r12,r9
	mov qword [rsp+8*249],r14
	mov r14,r11
	sub r14,r15
	mov qword [rsp+8*251],r8
	mov r8,r14
	add r8,r10
	mov qword [rsp+8*253],r9
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*252],r13
	mov r13, qword [rsp+8*250]
	mov r11,r13
	add r11,r9
	mov r15, qword [rsp+8*244]
	mov r10,r15
	sub r10,r11
	mov qword [rsp+8*255],r14
	mov r14, qword [rsp+8*230]
	mov qword [rsp+8*256],r8
	mov r8,r14
	sub r8,r10
	mov qword [rsp+8*254],r12
	mov r12, qword [rsp+8*198]
	mov qword [rsp+8*257],r9
	mov r9,r12
	add r9,r8
	mov r13, qword [rsp+8*137]
	mov qword [rsp+8*258],r11
	mov r11,r13
	sub r11,r9
	mov r15,r11
	mov qword [rsp+8*259],r10
	mov r10, qword [gbl+8*3]
	mov r14,r10
	sub r14,r15
	mov qword [rsp+8*260],r8
	mov r8, qword [gbl+8*11]
	mov r12,r14
	add r12,r8
	mov qword [rsp+8*261],r9
	mov r9,r15
	add r9,r8
	mov r13,r12
	sub r13,r9
	mov qword [rsp+8*262],r11
	mov r11,r10
	sub r11,r15
	mov qword [rsp+8*263],r14
	mov r14,r11
	add r14,r8
	mov qword [rsp+8*265],r9
	mov r9,r15
	add r9,r8
	mov qword [rsp+8*264],r12
	mov r12,r14
	sub r12,r9
	mov r10,r13
	add r10,r12
	mov qword [rsp+8*267],r11
	mov r11, qword [gbl+8*3]
	mov r8,r11
	sub r8,r15
	mov qword [rsp+8*269],r9
	mov r9, qword [gbl+8*11]
	mov qword [rsp+8*268],r14
	mov r14,r8
	add r14,r9
	mov qword [rsp+8*271],r10
	mov r10,r15
	add r10,r9
	mov qword [rsp+8*270],r12
	mov r12,r14
	sub r12,r10
	mov qword [rsp+8*266],r13
	mov r13,r11
	sub r13,r15
	mov qword [rsp+8*272],r8
	mov r8,r13
	add r8,r9
	mov qword [rsp+8*274],r10
	mov r10,r12
	add r10,r8
	mov qword [rsp+8*273],r14
	mov r14, qword [rsp+8*271]
	mov r11,r14
	add r11,r10
	mov qword [rsp+8*276],r13
	mov r13,r15
	add r13,r9
	mov qword [rsp+8*277],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*275],r12
	mov r12,r8
	sub r12,r15
	mov qword [rsp+8*278],r10
	mov r10,r12
	add r10,r9
	mov qword [rsp+8*279],r11
	mov r11,r13
	add r11,r10
	mov r14,r15
	add r14,r9
	mov r8,r11
	sub r8,r14
	mov qword [rsp+8*281],r12
	mov r12, qword [gbl+8*3]
	mov qword [rsp+8*282],r10
	mov r10,r12
	sub r10,r15
	mov qword [rsp+8*280],r13
	mov r13,r10
	add r13,r9
	mov qword [rsp+8*285],r8
	mov r8,r15
	add r8,r9
	mov qword [rsp+8*283],r11
	mov r11,r13
	sub r11,r8
	mov qword [rsp+8*284],r14
	mov r14,r12
	sub r14,r15
	mov qword [rsp+8*286],r10
	mov r10,r14
	add r10,r9
	mov qword [rsp+8*288],r8
	mov r8,r11
	add r8,r10
	mov qword [rsp+8*287],r13
	mov r13, qword [rsp+8*285]
	mov r12,r13
	add r12,r8
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*279]
	mov r9,r15
	sub r9,r12
	mov qword [rsp+8*290],r14
	mov r14, qword [gbl+8*9]
	mov qword [rsp+8*291],r10
	mov r10, qword [gbl+8*11]
	mov qword [rsp+8*289],r11
	mov r11,r14
	add r11,r10
	mov qword [rsp+8*292],r8
	mov r8, qword [gbl+8*3]
	mov r13,r8
	sub r13,r14
	mov qword [rsp+8*294],r9
	mov r9,r13
	add r9,r10
	mov qword [rsp+8*293],r12
	mov r12,r11
	add r12,r9
	mov r15,r14
	add r15,r10
	mov qword [rsp+8*296],r13
	mov r13,r8
	sub r13,r14
	mov qword [rsp+8*297],r9
	mov r9,r13
	add r9,r10
	mov qword [rsp+8*295],r11
	mov r11,r15
	add r11,r9
	mov r8,r12
	sub r8,r11
	mov qword [rsp+8*300],r13
	mov r13,r14
	add r13,r10
	mov qword [rsp+8*301],r9
	mov r9, qword [gbl+8*3]
	mov qword [rsp+8*299],r15
	mov r15,r9
	sub r15,r14
	mov qword [rsp+8*303],r8
	mov r8,r15
	add r8,r10
	mov qword [rsp+8*302],r11
	mov r11,r13
	add r11,r8
	mov qword [rsp+8*298],r12
	mov r12,r14
	add r12,r10
	mov r9,r11
	sub r9,r12
	mov qword [rsp+8*305],r15
	mov r15, qword [rsp+8*303]
	mov qword [rsp+8*306],r8
	mov r8,r15
	sub r8,r9
	mov qword [rsp+8*304],r13
	mov r13, qword [gbl+8*3]
	mov r10,r13
	sub r10,r14
	mov qword [rsp+8*307],r11
	mov r11, qword [gbl+8*11]
	mov qword [rsp+8*308],r12
	mov r12,r10
	add r12,r11
	mov qword [rsp+8*310],r8
	mov r8,r14
	add r8,r11
	mov qword [rsp+8*309],r9
	mov r9,r12
	sub r9,r8
	mov r15,r13
	sub r15,r14
	mov qword [rsp+8*311],r10
	mov r10,r15
	add r10,r11
	mov qword [rsp+8*313],r8
	mov r8,r9
	add r8,r10
	mov qword [rsp+8*312],r12
	mov r12,r14
	add r12,r11
	mov qword [rsp+8*315],r15
	mov r15,r13
	sub r15,r14
	mov qword [rsp+8*317],r8
	mov r8,r15
	add r8,r11
	mov qword [rsp+8*314],r9
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*316],r10
	mov r10,r14
	add r10,r11
	mov r13,r9
	sub r13,r10
	mov qword [rsp+8*319],r15
	mov r15, qword [rsp+8*317]
	mov qword [rsp+8*320],r8
	mov r8,r15
	sub r8,r13
	mov qword [rsp+8*318],r12
	mov r12, qword [rsp+8*310]
	mov r11,r12
	add r11,r8
	mov r14, qword [rsp+8*294]
	mov qword [rsp+8*321],r9
	mov r9,r14
	sub r9,r11
	mov qword [rsp+8*322],r10
	mov r10, qword [gbl+8*3]
	mov qword [rsp+8*323],r13
	mov r13, qword [gbl+8*9]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*324],r8
	mov r8, qword [gbl+8*11]
	mov r12,r15
	add r12,r8
	mov qword [rsp+8*326],r9
	mov r9,r13
	add r9,r8
	mov qword [rsp+8*325],r11
	mov r11,r12
	sub r11,r9
	mov r14,r10
	sub r14,r13
	mov qword [rsp+8*327],r15
	mov r15,r14
	add r15,r8
	mov qword [rsp+8*329],r9
	mov r9,r13
	add r9,r8
	mov qword [rsp+8*330],r11
	mov r11,r15
	sub r11,r9
	mov qword [rsp+8*328],r12
	mov r12, qword [rsp+8*330]
	mov r10,r12
	add r10,r11
	mov qword [rsp+8*331],r14
	mov r14, qword [gbl+8*3]
	mov r8,r14
	sub r8,r13
	mov qword [rsp+8*333],r9
	mov r9, qword [gbl+8*11]
	mov qword [rsp+8*332],r15
	mov r15,r8
	add r15,r9
	mov qword [rsp+8*335],r10
	mov r10,r13
	add r10,r9
	mov qword [rsp+8*334],r11
	mov r11,r15
	sub r11,r10
	mov r12,r14
	sub r12,r13
	mov qword [rsp+8*336],r8
	mov r8,r12
	add r8,r9
	mov qword [rsp+8*338],r10
	mov r10,r11
	add r10,r8
	mov qword [rsp+8*337],r15
	mov r15, qword [rsp+8*335]
	mov r13,r15
	add r13,r10
	mov r14, qword [gbl+8*9]
	mov qword [rsp+8*340],r12
	mov r12,r14
	add r12,r9
	mov qword [rsp+8*341],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*339],r11
	mov r11,r8
	sub r11,r14
	mov qword [rsp+8*342],r10
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*343],r13
	mov r13,r12
	add r13,r10
	mov r15,r14
	add r15,r9
	mov r8,r13
	sub r8,r15
	mov qword [rsp+8*345],r11
	mov r11, qword [gbl+8*3]
	mov qword [rsp+8*346],r10
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*344],r12
	mov r12,r10
	add r12,r9
	mov qword [rsp+8*349],r8
	mov r8,r14
	add r8,r9
	mov qword [rsp+8*347],r13
	mov r13,r12
	sub r13,r8
	mov qword [rsp+8*348],r15
	mov r15,r11
	sub r15,r14
	mov qword [rsp+8*350],r10
	mov r10,r15
	add r10,r9
	mov qword [rsp+8*352],r8
	mov r8,r13
	add r8,r10
	mov qword [rsp+8*351],r12
	mov r12, qword [rsp+8*349]
	mov r11,r12
	add r11,r8
	mov r14, qword [rsp+8*343]
	mov r9,r14
	sub r9,r11
	mov qword [rsp+8*354],r15
	mov r15, qword [gbl+8*9]
	mov qword [rsp+8*355],r10
	mov r10, qword [gbl+8*11]
	mov qword [rsp+8*353],r13
	mov r13,r15
	add r13,r10
	mov qword [rsp+8*356],r8
	mov r8, qword [gbl+8*3]
	mov r12,r8
	sub r12,r15
	mov qword [rsp+8*358],r9
	mov r9,r12
	add r9,r10
	mov qword [rsp+8*357],r11
	mov r11,r13
	add r11,r9
	mov r14,r15
	add r14,r10
	mov r8,r11
	sub r8,r14
	mov qword [rsp+8*360],r12
	mov r12, qword [gbl+8*3]
	mov qword [rsp+8*361],r9
	mov r9,r12
	sub r9,r15
	mov qword [rsp+8*359],r13
	mov r13,r9
	add r13,r10
	mov qword [rsp+8*364],r8
	mov r8,r15
	add r8,r10
	mov qword [rsp+8*362],r11
	mov r11,r13
	sub r11,r8
	mov qword [rsp+8*363],r14
	mov r14,r12
	sub r14,r15
	mov qword [rsp+8*365],r9
	mov r9,r14
	add r9,r10
	mov qword [rsp+8*367],r8
	mov r8,r11
	add r8,r9
	mov qword [rsp+8*366],r13
	mov r13, qword [rsp+8*364]
	mov r12,r13
	add r12,r8
	mov qword [rsp+8*369],r14
	mov r14,r15
	add r14,r10
	mov qword [rsp+8*370],r9
	mov r9, qword [gbl+8*3]
	mov qword [rsp+8*368],r11
	mov r11,r9
	sub r11,r15
	mov qword [rsp+8*371],r8
	mov r8,r11
	add r8,r10
	mov qword [rsp+8*372],r12
	mov r12,r14
	add r12,r8
	mov r13,r15
	add r13,r10
	mov r9,r12
	sub r9,r13
	mov qword [rsp+8*374],r11
	mov r11, qword [gbl+8*3]
	mov qword [rsp+8*375],r8
	mov r8,r11
	sub r8,r15
	mov qword [rsp+8*373],r14
	mov r14,r8
	add r14,r10
	mov qword [rsp+8*378],r9
	mov r9,r15
	add r9,r10
	mov qword [rsp+8*376],r12
	mov r12,r14
	sub r12,r9
	mov qword [rsp+8*377],r13
	mov r13,r11
	sub r13,r15
	mov qword [rsp+8*379],r8
	mov r8,r13
	add r8,r10
	mov qword [rsp+8*381],r9
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*380],r14
	mov r14, qword [rsp+8*378]
	mov r11,r14
	add r11,r9
	mov r15, qword [rsp+8*372]
	mov r10,r15
	sub r10,r11
	mov qword [rsp+8*383],r13
	mov r13, qword [rsp+8*358]
	mov qword [rsp+8*384],r8
	mov r8,r13
	sub r8,r10
	mov qword [rsp+8*382],r12
	mov r12, qword [rsp+8*326]
	mov qword [rsp+8*385],r9
	mov r9,r12
	add r9,r8
	mov r14, qword [gbl+8*9]
	mov qword [rsp+8*386],r11
	mov r11, qword [gbl+8*11]
	mov r15,r14
	add r15,r11
	mov qword [rsp+8*387],r10
	mov r10, qword [gbl+8*3]
	mov r13,r10
	sub r13,r14
	mov qword [rsp+8*388],r8
	mov r8,r13
	add r8,r11
	mov qword [rsp+8*389],r9
	mov r9,r15
	add r9,r8
	mov r12,r14
	add r12,r11
	mov qword [rsp+8*391],r13
	mov r13,r10
	sub r13,r14
	mov qword [rsp+8*392],r8
	mov r8,r13
	add r8,r11
	mov qword [rsp+8*393],r9
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*390],r15
	mov r15, qword [rsp+8*393]
	mov r10,r15
	sub r10,r9
	mov qword [rsp+8*395],r13
	mov r13,r14
	add r13,r11
	mov qword [rsp+8*396],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*394],r12
	mov r12,r8
	sub r12,r14
	mov qword [rsp+8*397],r9
	mov r9,r12
	add r9,r11
	mov qword [rsp+8*398],r10
	mov r10,r13
	add r10,r9
	mov r15,r14
	add r15,r11
	mov r8,r10
	sub r8,r15
	mov qword [rsp+8*400],r12
	mov r12, qword [rsp+8*398]
	mov qword [rsp+8*401],r9
	mov r9,r12
	sub r9,r8
	mov qword [rsp+8*399],r13
	mov r13, qword [gbl+8*3]
	mov r11,r13
	sub r11,r14
	mov qword [rsp+8*402],r10
	mov r10, qword [gbl+8*11]
	mov qword [rsp+8*403],r15
	mov r15,r11
	add r15,r10
	mov qword [rsp+8*404],r8
	mov r8,r14
	add r8,r10
	mov qword [rsp+8*405],r9
	mov r9,r15
	sub r9,r8
	mov r12,r13
	sub r12,r14
	mov qword [rsp+8*406],r11
	mov r11,r12
	add r11,r10
	mov qword [rsp+8*408],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*407],r15
	mov r15,r14
	add r15,r10
	mov qword [rsp+8*410],r12
	mov r12,r13
	sub r12,r14
	mov qword [rsp+8*412],r8
	mov r8,r12
	add r8,r10
	mov qword [rsp+8*409],r9
	mov r9,r15
	add r9,r8
	mov qword [rsp+8*411],r11
	mov r11,r14
	add r11,r10
	mov r13,r9
	sub r13,r11
	mov qword [rsp+8*414],r12
	mov r12, qword [rsp+8*412]
	mov qword [rsp+8*415],r8
	mov r8,r12
	sub r8,r13
	mov qword [rsp+8*413],r15
	mov r15, qword [rsp+8*405]
	mov r10,r15
	add r10,r8
	mov r14, qword [gbl+8*3]
	mov qword [rsp+8*416],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*417],r11
	mov r11,r14
	sub r11,r9
	mov r12, qword [gbl+8*11]
	mov qword [rsp+8*418],r13
	mov r13,r11
	add r13,r12
	mov qword [rsp+8*419],r8
	mov r8,r9
	add r8,r12
	mov qword [rsp+8*420],r10
	mov r10,r13
	sub r10,r8
	mov r15,r14
	sub r15,r9
	mov qword [rsp+8*421],r11
	mov r11,r15
	add r11,r12
	mov qword [rsp+8*423],r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*422],r13
	mov r13,r9
	add r13,r12
	mov qword [rsp+8*425],r15
	mov r15,r14
	sub r15,r9
	mov qword [rsp+8*427],r8
	mov r8,r15
	add r8,r12
	mov qword [rsp+8*424],r10
	mov r10,r13
	add r10,r8
	mov qword [rsp+8*426],r11
	mov r11,r9
	add r11,r12
	mov r14,r10
	sub r14,r11
	mov qword [rsp+8*429],r15
	mov r15, qword [rsp+8*427]
	mov qword [rsp+8*430],r8
	mov r8,r15
	sub r8,r14
	mov qword [rsp+8*428],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r9
	mov qword [rsp+8*431],r10
	mov r10, qword [gbl+8*11]
	mov qword [rsp+8*432],r11
	mov r11,r12
	add r11,r10
	mov qword [rsp+8*434],r8
	mov r8,r9
	add r8,r10
	mov qword [rsp+8*433],r14
	mov r14,r11
	sub r14,r8
	mov r15,r13
	sub r15,r9
	mov qword [rsp+8*435],r12
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*437],r8
	mov r8,r14
	add r8,r12
	mov qword [rsp+8*436],r11
	mov r11,r9
	add r11,r10
	mov qword [rsp+8*439],r15
	mov r15,r13
	sub r15,r9
	mov qword [rsp+8*441],r8
	mov r8,r15
	add r8,r10
	mov qword [rsp+8*440],r12
	mov r12,r11
	add r12,r8
	mov qword [rsp+8*438],r14
	mov r14,r9
	add r14,r10
	mov r13,r12
	sub r13,r14
	mov qword [rsp+8*443],r15
	mov r15, qword [rsp+8*441]
	mov qword [rsp+8*444],r8
	mov r8,r15
	sub r8,r13
	mov qword [rsp+8*442],r11
	mov r11, qword [rsp+8*434]
	mov r9,r11
	add r9,r8
	mov r10, qword [rsp+8*420]
	mov qword [rsp+8*445],r12
	mov r12,r10
	add r12,r9
	mov qword [rsp+8*446],r14
	mov r14, qword [gbl+8*3]
	mov qword [rsp+8*447],r13
	mov r13, qword [gbl+8*9]
	mov r15,r14
	sub r15,r13
	mov qword [rsp+8*448],r8
	mov r8, qword [gbl+8*11]
	mov r11,r15
	add r11,r8
	mov qword [rsp+8*449],r9
	mov r9,r13
	add r9,r8
	mov r10,r11
	sub r10,r9
	mov qword [rsp+8*450],r12
	mov r12,r14
	sub r12,r13
	mov qword [rsp+8*451],r15
	mov r15,r12
	add r15,r8
	mov qword [rsp+8*453],r9
	mov r9,r13
	add r9,r8
	mov qword [rsp+8*454],r10
	mov r10,r15
	sub r10,r9
	mov qword [rsp+8*452],r11
	mov r11, qword [rsp+8*454]
	mov r14,r11
	add r14,r10
	mov qword [rsp+8*455],r12
	mov r12, qword [gbl+8*3]
	mov r8,r12
	sub r8,r13
	mov qword [rsp+8*457],r9
	mov r9, qword [gbl+8*11]
	mov qword [rsp+8*456],r15
	mov r15,r8
	add r15,r9
	mov qword [rsp+8*458],r10
	mov r10,r13
	add r10,r9
	mov r11,r15
	sub r11,r10
	mov qword [rsp+8*459],r14
	mov r14,r12
	sub r14,r13
	mov qword [rsp+8*460],r8
	mov r8,r14
	add r8,r9
	mov qword [rsp+8*462],r10
	mov r10,r11
	add r10,r8
	mov qword [rsp+8*461],r15
	mov r15, qword [rsp+8*459]
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*464],r14
	mov r14,r13
	add r14,r9
	mov qword [rsp+8*465],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*463],r11
	mov r11,r8
	sub r11,r13
	mov qword [rsp+8*466],r10
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*467],r12
	mov r12,r14
	add r12,r10
	mov r15,r13
	add r15,r9
	mov r8,r12
	sub r8,r15
	mov qword [rsp+8*469],r11
	mov r11, qword [gbl+8*3]
	mov qword [rsp+8*470],r10
	mov r10,r11
	sub r10,r13
	mov qword [rsp+8*468],r14
	mov r14,r10
	add r14,r9
	mov qword [rsp+8*473],r8
	mov r8,r13
	add r8,r9
	mov qword [rsp+8*471],r12
	mov r12,r14
	sub r12,r8
	mov qword [rsp+8*472],r15
	mov r15,r11
	sub r15,r13
	mov qword [rsp+8*474],r10
	mov r10,r15
	add r10,r9
	mov qword [rsp+8*476],r8
	mov r8,r12
	add r8,r10
	mov qword [rsp+8*475],r14
	mov r14, qword [rsp+8*473]
	mov r11,r14
	add r11,r8
	mov r13, qword [rsp+8*467]
	mov r9,r13
	sub r9,r11
	mov qword [rsp+8*478],r15
	mov r15, qword [gbl+8*9]
	mov qword [rsp+8*479],r10
	mov r10, qword [gbl+8*11]
	mov qword [rsp+8*477],r12
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*480],r8
	mov r8, qword [gbl+8*3]
	mov r14,r8
	sub r14,r15
	mov qword [rsp+8*482],r9
	mov r9,r14
	add r9,r10
	mov qword [rsp+8*481],r11
	mov r11,r12
	add r11,r9
	mov r13,r15
	add r13,r10
	mov r8,r11
	sub r8,r13
	mov qword [rsp+8*484],r14
	mov r14, qword [gbl+8*3]
	mov qword [rsp+8*485],r9
	mov r9,r14
	sub r9,r15
	mov qword [rsp+8*483],r12
	mov r12,r9
	add r12,r10
	mov qword [rsp+8*488],r8
	mov r8,r15
	add r8,r10
	mov qword [rsp+8*486],r11
	mov r11,r12
	sub r11,r8
	mov qword [rsp+8*487],r13
	mov r13,r14
	sub r13,r15
	mov qword [rsp+8*489],r9
	mov r9,r13
	add r9,r10
	mov qword [rsp+8*491],r8
	mov r8,r11
	add r8,r9
	mov qword [rsp+8*490],r12
	mov r12, qword [rsp+8*488]
	mov r14,r12
	add r14,r8
	mov qword [rsp+8*493],r13
	mov r13,r15
	add r13,r10
	mov qword [rsp+8*494],r9
	mov r9, qword [gbl+8*3]
	mov qword [rsp+8*492],r11
	mov r11,r9
	sub r11,r15
	mov qword [rsp+8*495],r8
	mov r8,r11
	add r8,r10
	mov r12,r13
	add r12,r8
	mov qword [rsp+8*496],r14
	mov r14,r15
	add r14,r10
	mov r9,r12
	sub r9,r14
	mov qword [rsp+8*498],r11
	mov r11, qword [gbl+8*3]
	mov qword [rsp+8*499],r8
	mov r8,r11
	sub r8,r15
	mov qword [rsp+8*497],r13
	mov r13,r8
	add r13,r10
	mov qword [rsp+8*502],r9
	mov r9,r15
	add r9,r10
	mov qword [rsp+8*500],r12
	mov r12,r13
	sub r12,r9
	mov qword [rsp+8*501],r14
	mov r14,r11
	sub r14,r15
	mov qword [rsp+8*503],r8
	mov r8,r14
	add r8,r10
	mov qword [rsp+8*505],r9
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*504],r13
	mov r13, qword [rsp+8*502]
	mov r11,r13
	add r11,r9
	mov r15, qword [rsp+8*496]
	mov r10,r15
	sub r10,r11
	mov qword [rsp+8*507],r14
	mov r14, qword [rsp+8*482]
	mov qword [rsp+8*508],r8
	mov r8,r14
	sub r8,r10
	mov qword [rsp+8*506],r12
	mov r12, qword [rsp+8*450]
	mov qword [rsp+8*509],r9
	mov r9,r12
	add r9,r8
	mov r13, qword [rsp+8*389]
	mov qword [rsp+8*510],r11
	mov r11,r13
	sub r11,r9
	mov r15,r11
	mov qword [rsp+8*511],r10
	mov r10, qword [gbl+8*3]
	mov r14, qword [gbl+8*9]
	mov qword [rsp+8*512],r8
	mov r8,r10
	sub r8,r14
	mov r12,r8
	add r12,r15
	mov qword [rsp+8*513],r9
	mov r9,r14
	add r9,r15
	mov r13,r12
	sub r13,r9
	mov qword [rsp+8*514],r11
	mov r11,r10
	sub r11,r14
	mov qword [rsp+8*515],r8
	mov r8,r11
	add r8,r15
	mov qword [rsp+8*517],r9
	mov r9,r14
	add r9,r15
	mov qword [rsp+8*516],r12
	mov r12,r8
	sub r12,r9
	mov r10,r13
	add r10,r12
	mov qword [rsp+8*519],r11
	mov r11, qword [gbl+8*3]
	mov qword [gbl+8*11],r15
	mov r15,r11
	sub r15,r14
	mov qword [rsp+8*520],r8
	mov r8, qword [gbl+8*11]
	mov qword [rsp+8*521],r9
	mov r9,r15
	add r9,r8
	mov qword [rsp+8*523],r10
	mov r10,r14
	add r10,r8
	mov qword [rsp+8*522],r12
	mov r12,r9
	sub r12,r10
	mov qword [rsp+8*518],r13
	mov r13,r11
	sub r13,r14
	mov qword [rsp+8*524],r15
	mov r15,r13
	add r15,r8
	mov qword [rsp+8*525],r9
	mov r9,r12
	add r9,r15
	mov qword [rsp+8*526],r10
	mov r10, qword [rsp+8*523]
	mov r11,r10
	add r11,r9
	mov qword [rsp+8*528],r13
	mov r13,r14
	add r13,r8
	mov qword [rsp+8*527],r12
	mov r12, qword [gbl+8*3]
	mov qword [rsp+8*529],r15
	mov r15,r12
	sub r15,r14
	mov qword [rsp+8*530],r9
	mov r9,r15
	add r9,r8
	mov r10,r13
	add r10,r9
	mov qword [rsp+8*531],r11
	mov r11,r14
	add r11,r8
	mov r12,r10
	sub r12,r11
	mov qword [rsp+8*533],r15
	mov r15, qword [gbl+8*3]
	mov qword [rsp+8*534],r9
	mov r9,r15
	sub r9,r14
	mov qword [rsp+8*532],r13
	mov r13,r9
	add r13,r8
	mov qword [rsp+8*535],r10
	mov r10,r14
	add r10,r8
	mov qword [rsp+8*536],r11
	mov r11,r13
	sub r11,r10
	mov qword [rsp+8*537],r12
	mov r12,r15
	sub r12,r14
	mov qword [rsp+8*538],r9
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*540],r10
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*539],r13
	mov r13, qword [rsp+8*537]
	mov r14,r13
	add r14,r10
	mov r15, qword [rsp+8*531]
	mov r8,r15
	sub r8,r14
	mov qword [rsp+8*542],r12
	mov r12, qword [gbl+8*9]
	mov qword [rsp+8*543],r9
	mov r9, qword [gbl+8*11]
	mov qword [rsp+8*541],r11
	mov r11,r12
	add r11,r9
	mov qword [rsp+8*544],r10
	mov r10, qword [gbl+8*3]
	mov r13,r10
	sub r13,r12
	mov qword [rsp+8*546],r8
	mov r8,r13
	add r8,r9
	mov qword [rsp+8*545],r14
	mov r14,r11
	add r14,r8
	mov r15,r12
	add r15,r9
	mov qword [rsp+8*548],r13
	mov r13,r10
	sub r13,r12
	mov qword [rsp+8*549],r8
	mov r8,r13
	add r8,r9
	mov qword [rsp+8*547],r11
	mov r11,r15
	add r11,r8
	mov r10,r14
	sub r10,r11
	mov qword [rsp+8*552],r13
	mov r13,r12
	add r13,r9
	mov qword [rsp+8*553],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*551],r15
	mov r15,r8
	sub r15,r12
	mov qword [rsp+8*555],r10
	mov r10,r15
	add r10,r9
	mov qword [rsp+8*554],r11
	mov r11,r13
	add r11,r10
	mov qword [rsp+8*550],r14
	mov r14,r12
	add r14,r9
	mov r8,r11
	sub r8,r14
	mov qword [rsp+8*557],r15
	mov r15, qword [rsp+8*555]
	mov qword [rsp+8*558],r10
	mov r10,r15
	sub r10,r8
	mov qword [rsp+8*556],r13
	mov r13, qword [gbl+8*3]
	mov r9,r13
	sub r9,r12
	mov qword [rsp+8*559],r11
	mov r11, qword [gbl+8*11]
	mov qword [rsp+8*560],r14
	mov r14,r9
	add r14,r11
	mov qword [rsp+8*561],r8
	mov r8,r12
	add r8,r11
	mov qword [rsp+8*562],r10
	mov r10,r14
	sub r10,r8
	mov r15,r13
	sub r15,r12
	mov qword [rsp+8*563],r9
	mov r9,r15
	add r9,r11
	mov qword [rsp+8*565],r8
	mov r8,r10
	add r8,r9
	mov qword [rsp+8*564],r14
	mov r14,r12
	add r14,r11
	mov qword [rsp+8*567],r15
	mov r15,r13
	sub r15,r12
	mov qword [rsp+8*569],r8
	mov r8,r15
	add r8,r11
	mov qword [rsp+8*568],r9
	mov r9,r14
	add r9,r8
	mov qword [rsp+8*566],r10
	mov r10,r12
	add r10,r11
	mov r13,r9
	sub r13,r10
	mov qword [rsp+8*571],r15
	mov r15, qword [rsp+8*569]
	mov qword [rsp+8*572],r8
	mov r8,r15
	sub r8,r13
	mov qword [rsp+8*570],r14
	mov r14, qword [rsp+8*562]
	mov r11,r14
	add r11,r8
	mov r12, qword [rsp+8*546]
	mov qword [rsp+8*573],r9
	mov r9,r12
	sub r9,r11
	mov qword [rsp+8*574],r10
	mov r10, qword [gbl+8*3]
	mov qword [rsp+8*575],r13
	mov r13, qword [gbl+8*9]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*576],r8
	mov r8, qword [gbl+8*11]
	mov r14,r15
	add r14,r8
	mov qword [rsp+8*578],r9
	mov r9,r13
	add r9,r8
	mov qword [rsp+8*577],r11
	mov r11,r14
	sub r11,r9
	mov r12,r10
	sub r12,r13
	mov qword [rsp+8*579],r15
	mov r15,r12
	add r15,r8
	mov qword [rsp+8*581],r9
	mov r9,r13
	add r9,r8
	mov qword [rsp+8*582],r11
	mov r11,r15
	sub r11,r9
	mov qword [rsp+8*580],r14
	mov r14, qword [rsp+8*582]
	mov r10,r14
	add r10,r11
	mov qword [rsp+8*583],r12
	mov r12, qword [gbl+8*3]
	mov r8,r12
	sub r8,r13
	mov qword [rsp+8*585],r9
	mov r9, qword [gbl+8*11]
	mov qword [rsp+8*584],r15
	mov r15,r8
	add r15,r9
	mov qword [rsp+8*587],r10
	mov r10,r13
	add r10,r9
	mov qword [rsp+8*586],r11
	mov r11,r15
	sub r11,r10
	mov r14,r12
	sub r14,r13
	mov qword [rsp+8*588],r8
	mov r8,r14
	add r8,r9
	mov qword [rsp+8*590],r10
	mov r10,r11
	add r10,r8
	mov qword [rsp+8*589],r15
	mov r15, qword [rsp+8*587]
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*592],r14
	mov r14,r13
	add r14,r9
	mov qword [rsp+8*593],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*591],r11
	mov r11,r8
	sub r11,r13
	mov qword [rsp+8*594],r10
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*595],r12
	mov r12,r14
	add r12,r10
	mov r15,r13
	add r15,r9
	mov r8,r12
	sub r8,r15
	mov qword [rsp+8*597],r11
	mov r11, qword [gbl+8*3]
	mov qword [rsp+8*598],r10
	mov r10,r11
	sub r10,r13
	mov qword [rsp+8*596],r14
	mov r14,r10
	add r14,r9
	mov qword [rsp+8*601],r8
	mov r8,r13
	add r8,r9
	mov qword [rsp+8*599],r12
	mov r12,r14
	sub r12,r8
	mov qword [rsp+8*600],r15
	mov r15,r11
	sub r15,r13
	mov qword [rsp+8*602],r10
	mov r10,r15
	add r10,r9
	mov qword [rsp+8*604],r8
	mov r8,r12
	add r8,r10
	mov qword [rsp+8*603],r14
	mov r14, qword [rsp+8*601]
	mov r11,r14
	add r11,r8
	mov r13, qword [rsp+8*595]
	mov r9,r13
	sub r9,r11
	mov qword [rsp+8*606],r15
	mov r15, qword [gbl+8*9]
	mov qword [rsp+8*607],r10
	mov r10, qword [gbl+8*11]
	mov qword [rsp+8*605],r12
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*608],r8
	mov r8, qword [gbl+8*3]
	mov r14,r8
	sub r14,r15
	mov qword [rsp+8*610],r9
	mov r9,r14
	add r9,r10
	mov qword [rsp+8*609],r11
	mov r11,r12
	add r11,r9
	mov r13,r15
	add r13,r10
	mov r8,r11
	sub r8,r13
	mov qword [rsp+8*612],r14
	mov r14, qword [gbl+8*3]
	mov qword [rsp+8*613],r9
	mov r9,r14
	sub r9,r15
	mov qword [rsp+8*611],r12
	mov r12,r9
	add r12,r10
	mov qword [rsp+8*616],r8
	mov r8,r15
	add r8,r10
	mov qword [rsp+8*614],r11
	mov r11,r12
	sub r11,r8
	mov qword [rsp+8*615],r13
	mov r13,r14
	sub r13,r15
	mov qword [rsp+8*617],r9
	mov r9,r13
	add r9,r10
	mov qword [rsp+8*619],r8
	mov r8,r11
	add r8,r9
	mov qword [rsp+8*618],r12
	mov r12, qword [rsp+8*616]
	mov r14,r12
	add r14,r8
	mov qword [rsp+8*621],r13
	mov r13,r15
	add r13,r10
	mov qword [rsp+8*622],r9
	mov r9, qword [gbl+8*3]
	mov qword [rsp+8*620],r11
	mov r11,r9
	sub r11,r15
	mov qword [rsp+8*623],r8
	mov r8,r11
	add r8,r10
	mov r12,r13
	add r12,r8
	mov qword [rsp+8*624],r14
	mov r14,r15
	add r14,r10
	mov r9,r12
	sub r9,r14
	mov qword [rsp+8*626],r11
	mov r11, qword [gbl+8*3]
	mov qword [rsp+8*627],r8
	mov r8,r11
	sub r8,r15
	mov qword [rsp+8*625],r13
	mov r13,r8
	add r13,r10
	mov qword [rsp+8*630],r9
	mov r9,r15
	add r9,r10
	mov qword [rsp+8*628],r12
	mov r12,r13
	sub r12,r9
	mov qword [rsp+8*629],r14
	mov r14,r11
	sub r14,r15
	mov qword [rsp+8*631],r8
	mov r8,r14
	add r8,r10
	mov qword [rsp+8*633],r9
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*632],r13
	mov r13, qword [rsp+8*630]
	mov r11,r13
	add r11,r9
	mov r15, qword [rsp+8*624]
	mov r10,r15
	sub r10,r11
	mov qword [rsp+8*635],r14
	mov r14, qword [rsp+8*610]
	mov qword [rsp+8*636],r8
	mov r8,r14
	sub r8,r10
	mov qword [rsp+8*634],r12
	mov r12, qword [rsp+8*578]
	mov qword [rsp+8*637],r9
	mov r9,r12
	add r9,r8
	mov r13, qword [gbl+8*9]
	mov qword [rsp+8*638],r11
	mov r11, qword [gbl+8*11]
	mov r15,r13
	add r15,r11
	mov qword [rsp+8*639],r10
	mov r10, qword [gbl+8*3]
	mov r14,r10
	sub r14,r13
	mov qword [rsp+8*640],r8
	mov r8,r14
	add r8,r11
	mov qword [rsp+8*641],r9
	mov r9,r15
	add r9,r8
	mov r12,r13
	add r12,r11
	mov qword [rsp+8*643],r14
	mov r14,r10
	sub r14,r13
	mov qword [rsp+8*644],r8
	mov r8,r14
	add r8,r11
	mov qword [rsp+8*645],r9
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*642],r15
	mov r15, qword [rsp+8*645]
	mov r10,r15
	sub r10,r9
	mov qword [rsp+8*647],r14
	mov r14,r13
	add r14,r11
	mov qword [rsp+8*648],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*646],r12
	mov r12,r8
	sub r12,r13
	mov qword [rsp+8*649],r9
	mov r9,r12
	add r9,r11
	mov qword [rsp+8*650],r10
	mov r10,r14
	add r10,r9
	mov r15,r13
	add r15,r11
	mov r8,r10
	sub r8,r15
	mov qword [rsp+8*652],r12
	mov r12, qword [rsp+8*650]
	mov qword [rsp+8*653],r9
	mov r9,r12
	sub r9,r8
	mov qword [rsp+8*651],r14
	mov r14, qword [gbl+8*3]
	mov r11,r14
	sub r11,r13
	mov qword [rsp+8*654],r10
	mov r10, qword [gbl+8*11]
	mov qword [rsp+8*655],r15
	mov r15,r11
	add r15,r10
	mov qword [rsp+8*656],r8
	mov r8,r13
	add r8,r10
	mov qword [rsp+8*657],r9
	mov r9,r15
	sub r9,r8
	mov r12,r14
	sub r12,r13
	mov qword [rsp+8*658],r11
	mov r11,r12
	add r11,r10
	mov qword [rsp+8*660],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*659],r15
	mov r15,r13
	add r15,r10
	mov qword [rsp+8*662],r12
	mov r12,r14
	sub r12,r13
	mov qword [rsp+8*664],r8
	mov r8,r12
	add r8,r10
	mov qword [rsp+8*661],r9
	mov r9,r15
	add r9,r8
	mov qword [rsp+8*663],r11
	mov r11,r13
	add r11,r10
	mov r14,r9
	sub r14,r11
	mov qword [rsp+8*666],r12
	mov r12, qword [rsp+8*664]
	mov qword [rsp+8*667],r8
	mov r8,r12
	sub r8,r14
	mov qword [rsp+8*665],r15
	mov r15, qword [rsp+8*657]
	mov r10,r15
	add r10,r8
	mov r13, qword [gbl+8*3]
	mov qword [rsp+8*668],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*669],r11
	mov r11,r13
	sub r11,r9
	mov r12, qword [gbl+8*11]
	mov qword [rsp+8*670],r14
	mov r14,r11
	add r14,r12
	mov qword [rsp+8*671],r8
	mov r8,r9
	add r8,r12
	mov qword [rsp+8*672],r10
	mov r10,r14
	sub r10,r8
	mov r15,r13
	sub r15,r9
	mov qword [rsp+8*673],r11
	mov r11,r15
	add r11,r12
	mov qword [rsp+8*675],r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*674],r14
	mov r14,r9
	add r14,r12
	mov qword [rsp+8*677],r15
	mov r15,r13
	sub r15,r9
	mov qword [rsp+8*679],r8
	mov r8,r15
	add r8,r12
	mov qword [rsp+8*676],r10
	mov r10,r14
	add r10,r8
	mov qword [rsp+8*678],r11
	mov r11,r9
	add r11,r12
	mov r13,r10
	sub r13,r11
	mov qword [rsp+8*681],r15
	mov r15, qword [rsp+8*679]
	mov qword [rsp+8*682],r8
	mov r8,r15
	sub r8,r13
	mov qword [rsp+8*680],r14
	mov r14, qword [gbl+8*3]
	mov r12,r14
	sub r12,r9
	mov qword [rsp+8*683],r10
	mov r10, qword [gbl+8*11]
	mov qword [rsp+8*684],r11
	mov r11,r12
	add r11,r10
	mov qword [rsp+8*686],r8
	mov r8,r9
	add r8,r10
	mov qword [rsp+8*685],r13
	mov r13,r11
	sub r13,r8
	mov r15,r14
	sub r15,r9
	mov qword [rsp+8*687],r12
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*689],r8
	mov r8,r13
	add r8,r12
	mov qword [rsp+8*688],r11
	mov r11,r9
	add r11,r10
	mov qword [rsp+8*691],r15
	mov r15,r14
	sub r15,r9
	mov qword [rsp+8*693],r8
	mov r8,r15
	add r8,r10
	mov qword [rsp+8*692],r12
	mov r12,r11
	add r12,r8
	mov qword [rsp+8*690],r13
	mov r13,r9
	add r13,r10
	mov r14,r12
	sub r14,r13
	mov qword [rsp+8*695],r15
	mov r15, qword [rsp+8*693]
	mov qword [rsp+8*696],r8
	mov r8,r15
	sub r8,r14
	mov qword [rsp+8*694],r11
	mov r11, qword [rsp+8*686]
	mov r9,r11
	add r9,r8
	mov r10, qword [rsp+8*672]
	mov qword [rsp+8*697],r12
	mov r12,r10
	add r12,r9
	mov qword [rsp+8*698],r13
	mov r13, qword [gbl+8*3]
	mov qword [rsp+8*699],r14
	mov r14, qword [gbl+8*9]
	mov r15,r13
	sub r15,r14
	mov qword [rsp+8*700],r8
	mov r8, qword [gbl+8*11]
	mov r11,r15
	add r11,r8
	mov qword [rsp+8*701],r9
	mov r9,r14
	add r9,r8
	mov r10,r11
	sub r10,r9
	mov qword [rsp+8*702],r12
	mov r12,r13
	sub r12,r14
	mov qword [rsp+8*703],r15
	mov r15,r12
	add r15,r8
	mov qword [rsp+8*705],r9
	mov r9,r14
	add r9,r8
	mov qword [rsp+8*706],r10
	mov r10,r15
	sub r10,r9
	mov qword [rsp+8*704],r11
	mov r11, qword [rsp+8*706]
	mov r13,r11
	add r13,r10
	mov qword [rsp+8*707],r12
	mov r12, qword [gbl+8*3]
	mov r8,r12
	sub r8,r14
	mov qword [rsp+8*709],r9
	mov r9, qword [gbl+8*11]
	mov qword [rsp+8*708],r15
	mov r15,r8
	add r15,r9
	mov qword [rsp+8*710],r10
	mov r10,r14
	add r10,r9
	mov r11,r15
	sub r11,r10
	mov qword [rsp+8*711],r13
	mov r13,r12
	sub r13,r14
	mov qword [rsp+8*712],r8
	mov r8,r13
	add r8,r9
	mov qword [rsp+8*714],r10
	mov r10,r11
	add r10,r8
	mov qword [rsp+8*713],r15
	mov r15, qword [rsp+8*711]
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*716],r13
	mov r13,r14
	add r13,r9
	mov qword [rsp+8*717],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*715],r11
	mov r11,r8
	sub r11,r14
	mov qword [rsp+8*718],r10
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*719],r12
	mov r12,r13
	add r12,r10
	mov r15,r14
	add r15,r9
	mov r8,r12
	sub r8,r15
	mov qword [rsp+8*721],r11
	mov r11, qword [gbl+8*3]
	mov qword [rsp+8*722],r10
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*720],r13
	mov r13,r10
	add r13,r9
	mov qword [rsp+8*725],r8
	mov r8,r14
	add r8,r9
	mov qword [rsp+8*723],r12
	mov r12,r13
	sub r12,r8
	mov qword [rsp+8*724],r15
	mov r15,r11
	sub r15,r14
	mov qword [rsp+8*726],r10
	mov r10,r15
	add r10,r9
	mov qword [rsp+8*728],r8
	mov r8,r12
	add r8,r10
	mov qword [rsp+8*727],r13
	mov r13, qword [rsp+8*725]
	mov r11,r13
	add r11,r8
	mov r14, qword [rsp+8*719]
	mov r9,r14
	sub r9,r11
	mov qword [rsp+8*730],r15
	mov r15, qword [gbl+8*9]
	mov qword [rsp+8*731],r10
	mov r10, qword [gbl+8*11]
	mov qword [rsp+8*729],r12
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*732],r8
	mov r8, qword [gbl+8*3]
	mov r13,r8
	sub r13,r15
	mov qword [rsp+8*734],r9
	mov r9,r13
	add r9,r10
	mov qword [rsp+8*733],r11
	mov r11,r12
	add r11,r9
	mov r14,r15
	add r14,r10
	mov r8,r11
	sub r8,r14
	mov qword [rsp+8*736],r13
	mov r13, qword [gbl+8*3]
	mov qword [rsp+8*737],r9
	mov r9,r13
	sub r9,r15
	mov qword [rsp+8*735],r12
	mov r12,r9
	add r12,r10
	mov qword [rsp+8*740],r8
	mov r8,r15
	add r8,r10
	mov qword [rsp+8*738],r11
	mov r11,r12
	sub r11,r8
	mov qword [rsp+8*739],r14
	mov r14,r13
	sub r14,r15
	mov qword [rsp+8*741],r9
	mov r9,r14
	add r9,r10
	mov qword [rsp+8*743],r8
	mov r8,r11
	add r8,r9
	mov qword [rsp+8*742],r12
	mov r12, qword [rsp+8*740]
	mov r13,r12
	add r13,r8
	mov qword [rsp+8*745],r14
	mov r14,r15
	add r14,r10
	mov qword [rsp+8*746],r9
	mov r9, qword [gbl+8*3]
	mov qword [rsp+8*744],r11
	mov r11,r9
	sub r11,r15
	mov qword [rsp+8*747],r8
	mov r8,r11
	add r8,r10
	mov r12,r14
	add r12,r8
	mov qword [rsp+8*748],r13
	mov r13,r15
	add r13,r10
	mov r9,r12
	sub r9,r13
	mov qword [rsp+8*750],r11
	mov r11, qword [gbl+8*3]
	mov qword [rsp+8*751],r8
	mov r8,r11
	sub r8,r15
	mov qword [rsp+8*749],r14
	mov r14,r8
	add r14,r10
	mov qword [rsp+8*754],r9
	mov r9,r15
	add r9,r10
	mov qword [rsp+8*752],r12
	mov r12,r14
	sub r12,r9
	mov qword [rsp+8*753],r13
	mov r13,r11
	sub r13,r15
	mov qword [rsp+8*755],r8
	mov r8,r13
	add r8,r10
	mov qword [rsp+8*757],r9
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*756],r14
	mov r14, qword [rsp+8*754]
	mov r11,r14
	add r11,r9
	mov r15, qword [rsp+8*748]
	mov r10,r15
	sub r10,r11
	mov qword [rsp+8*759],r13
	mov r13, qword [rsp+8*734]
	mov qword [rsp+8*760],r8
	mov r8,r13
	sub r8,r10
	mov qword [rsp+8*758],r12
	mov r12, qword [rsp+8*702]
	mov qword [rsp+8*761],r9
	mov r9,r12
	add r9,r8
	mov r14, qword [rsp+8*641]
	mov qword [rsp+8*762],r11
	mov r11,r14
	sub r11,r9
	mov r15,r11
	mov qword [rsp+8*764],r8
	mov qword [rsp+8*765],r9
	mov qword [rsp+8*763],r10
	mov qword [rsp+8*766],r11
	mov qword [gbl+8*3],r15
	jmp L_627
	
L_628:
	mov r9, qword [gbl+8*9]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*768],r10
	mov     rdi, [rsp+8*768]
	call    toString
	mov     qword[rsp+8*769], rax
	mov     rsi, t837
	mov     rdi, [rsp+8*769]
	call    concat
	mov [rsp+8*770], rax
	mov r9, qword [gbl+8*11]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*771],r10
	mov     rdi, [rsp+8*771]
	call    toString
	mov     qword[rsp+8*772], rax
	mov     rsi, [rsp+8*772]
	mov     rdi, [rsp+8*770]
	call    concat
	mov [rsp+8*773], rax
	mov     rsi, t843
	mov     rdi, [rsp+8*773]
	call    concat
	mov [rsp+8*774], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*775],r10
	mov     rdi, [rsp+8*775]
	call    toString
	mov     qword[rsp+8*776], rax
	mov     rsi, [rsp+8*776]
	mov     rdi, [rsp+8*774]
	call    concat
	mov [rsp+8*777], rax
	mov r9, qword [rsp+8*777]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*778],r10
	mov rdi,[rsp+8*778] 
	add rdi, 1 
	call puts
	mov r8,0
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	jmp QED
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 6296
	mov r9,1
	mov r8,r9
	mov r11,1
	mov r10,r11
	mov r13,1
	mov r12,r13
	mov qword [gbl+8*9],r8
	mov qword [gbl+8*11],r10
	mov qword [gbl+8*3],r12
	mov r8, qword [rsp+8*779]
	mov rax,r8
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   8280
buff.1788:
        resb    256
arg:
        resb    1024

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	
GS_31:
	db 25H, 6CH, 64H, 00H
	
GS_32:
	db 25H, 73H, 00H
	
t843:
	 db 1," " ,0

t837:
	 db 1," " ,0


