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
	sub    rsp, 6352
	call global_init
	mov r8 , rax
	mov r10,0
	mov r9,r10
	mov qword [rsp+8*1],r8
	mov qword [rsp+8*2],r9
	
L_0:
	mov r8, qword [rsp+8*2]
	mov r9,1000000
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*3],r10
	mov r8, qword [rsp+8*3]
	cmp r8, 0
	je L_1
	mov r8, qword [rsp+8*2]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r12,1
	mov r13,r8
	add r13,r12
	mov r14,r13
	mov r15,1
	mov r9,r8
	add r9,r15
	mov r10,r9
	mov qword [rsp+8*8],r9
	mov qword [gbl+8*9],r10
	mov qword [gbl+8*5],r11
	mov qword [rsp+8*6],r13
	mov qword [gbl+8*7],r14
	
L_3:
	mov r8,1
	mov r9,29
	mov r10,r8
	shl r10,29
	mov r11, qword [gbl+8*9]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*10],r10
	mov qword [rsp+8*11],r12
	mov r8, qword [rsp+8*11]
	cmp r8, 0
	jne L_5
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*12],r8
	jmp L_6
	
L_5:
	mov r8,1
	mov r9,29
	mov r10,r8
	shl r10,29
	mov r11,r10
	neg r11
	mov r12, qword [gbl+8*9]
	cmp r12,r11
	mov r13, 0
	setg r13B
	mov qword [rsp+8*13],r10
	mov qword [rsp+8*14],r11
	mov qword [rsp+8*15],r13
	mov r9, qword [rsp+8*15]
	mov r8,r9
	mov qword [rsp+8*12],r8
	
L_6:
	mov r8, qword [rsp+8*12]
	cmp r8, 0
	je L_4
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov r10,r8
	sub r10,r9
	mov r11, qword [gbl+8*7]
	mov r12,r10
	add r12,r11
	mov r13,r9
	add r13,r11
	mov r14,r12
	sub r14,r13
	mov r15,r8
	sub r15,r9
	mov r10,r15
	add r10,r11
	mov r12,r9
	add r12,r11
	mov r13,r10
	sub r13,r12
	mov r10,r14
	add r10,r13
	mov r12,r8
	sub r12,r9
	mov r13,r12
	add r13,r11
	mov r12,r9
	add r12,r11
	mov r14,r13
	sub r14,r12
	mov r12,r8
	sub r12,r9
	mov r13,r12
	add r13,r11
	mov r12,r14
	add r12,r13
	mov r13,r10
	add r13,r12
	mov r10,r9
	add r10,r11
	mov r12,r8
	sub r12,r9
	mov r14,r12
	add r14,r11
	mov r12,r10
	add r12,r14
	mov r10,r9
	add r10,r11
	mov r14,r12
	sub r14,r10
	mov r10,r8
	sub r10,r9
	mov r12,r10
	add r12,r11
	mov r10,r9
	add r10,r11
	mov r15,r12
	sub r15,r10
	mov r10,r8
	sub r10,r9
	mov r12,r10
	add r12,r11
	mov r10,r15
	add r10,r12
	mov r12,r14
	add r12,r10
	mov r10,r13
	sub r10,r12
	mov r12,r9
	add r12,r11
	mov r13,r8
	sub r13,r9
	mov r14,r13
	add r14,r11
	mov r13,r12
	add r13,r14
	mov r12,r9
	add r12,r11
	mov r14,r8
	sub r14,r9
	mov r15,r14
	add r15,r11
	mov r14,r12
	add r14,r15
	mov r12,r13
	sub r12,r14
	mov r13,r9
	add r13,r11
	mov r14,r8
	sub r14,r9
	mov r15,r14
	add r15,r11
	mov r14,r13
	add r14,r15
	mov r13,r9
	add r13,r11
	mov r15,r14
	sub r15,r13
	mov r13,r12
	sub r13,r15
	mov r12,r8
	sub r12,r9
	mov r14,r12
	add r14,r11
	mov r12,r9
	add r12,r11
	mov r15,r14
	sub r15,r12
	mov r12,r8
	sub r12,r9
	mov r14,r12
	add r14,r11
	mov r12,r15
	add r12,r14
	mov r14,r9
	add r14,r11
	mov r15,r8
	sub r15,r9
	mov r8,r15
	add r8,r11
	mov r15,r14
	add r15,r8
	mov r8,r9
	add r8,r11
	mov r14,r15
	sub r14,r8
	mov r8,r12
	sub r8,r14
	mov r12,r13
	add r12,r8
	mov r8,r10
	sub r8,r12
	mov r10, qword [gbl+8*9]
	mov r12,r10
	sub r12,r9
	mov r13,r12
	add r13,r11
	mov r12,r9
	add r12,r11
	mov r14,r13
	sub r14,r12
	mov r12,r10
	sub r12,r9
	mov r13,r12
	add r13,r11
	mov r12,r9
	add r12,r11
	mov r15,r13
	sub r15,r12
	mov r12,r14
	add r12,r15
	mov r13,r10
	sub r13,r9
	mov r14,r13
	add r14,r11
	mov r13,r9
	add r13,r11
	mov r15,r14
	sub r15,r13
	mov r13,r10
	sub r13,r9
	mov r14,r13
	add r14,r11
	mov r13,r15
	add r13,r14
	mov r14,r12
	add r14,r13
	mov r12,r9
	add r12,r11
	mov r13,r10
	sub r13,r9
	mov r15,r13
	add r15,r11
	mov r13,r12
	add r13,r15
	mov r12,r9
	add r12,r11
	mov r15,r13
	sub r15,r12
	mov r12,r10
	sub r12,r9
	mov r13,r12
	add r13,r11
	mov r12,r9
	add r12,r11
	mov r10,r13
	sub r10,r12
	mov r12, qword [gbl+8*9]
	mov r13,r12
	sub r13,r9
	mov r12,r13
	add r12,r11
	mov r13,r10
	add r13,r12
	mov r10,r15
	add r10,r13
	mov r12,r14
	sub r12,r10
	mov r10,r9
	add r10,r11
	mov r13, qword [gbl+8*9]
	mov r14,r13
	sub r14,r9
	mov r15,r14
	add r15,r11
	mov r14,r10
	add r14,r15
	mov r10,r9
	add r10,r11
	mov r15,r14
	sub r15,r10
	mov r10,r13
	sub r10,r9
	mov r14,r10
	add r14,r11
	mov r10,r9
	add r10,r11
	mov r13,r14
	sub r13,r10
	mov r10, qword [gbl+8*9]
	mov r14,r10
	sub r14,r9
	mov r10,r14
	add r10,r11
	mov r14,r13
	add r14,r10
	mov r10,r15
	add r10,r14
	mov r13,r9
	add r13,r11
	mov r14, qword [gbl+8*9]
	mov r15,r14
	sub r15,r9
	mov r14,r15
	add r14,r11
	mov r15,r13
	add r15,r14
	mov r13,r9
	add r13,r11
	mov r14,r15
	sub r14,r13
	mov r13, qword [gbl+8*9]
	mov r15,r13
	sub r15,r9
	mov r13,r15
	add r13,r11
	mov r15,r9
	add r15,r11
	mov r11,r13
	sub r11,r15
	mov r13, qword [gbl+8*9]
	mov r15,r13
	sub r15,r9
	mov r13, qword [gbl+8*7]
	mov r9,r15
	add r9,r13
	mov r15,r11
	add r15,r9
	mov r9,r14
	add r9,r15
	mov r11,r10
	sub r11,r9
	mov r9,r12
	sub r9,r11
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r13
	mov r11, qword [gbl+8*9]
	mov r12,r11
	sub r12,r8
	mov r14,r12
	add r14,r13
	mov r12,r9
	add r12,r14
	mov r9,r8
	add r9,r13
	mov r14,r11
	sub r14,r8
	mov r15,r14
	add r15,r13
	mov r14,r9
	add r14,r15
	mov r9,r12
	sub r9,r14
	mov r12,r8
	add r12,r13
	mov r14,r11
	sub r14,r8
	mov r15,r14
	add r15,r13
	mov r14,r12
	add r14,r15
	mov r12,r8
	add r12,r13
	mov r15,r14
	sub r15,r12
	mov r12,r9
	sub r12,r15
	mov r9,r11
	sub r9,r8
	mov r14,r9
	add r14,r13
	mov r9,r8
	add r9,r13
	mov r15,r14
	sub r15,r9
	mov r9,r11
	sub r9,r8
	mov r14,r9
	add r14,r13
	mov r9,r15
	add r9,r14
	mov r14,r8
	add r14,r13
	mov r15,r11
	sub r15,r8
	mov r11,r15
	add r11,r13
	mov r15,r14
	add r15,r11
	mov r11,r8
	add r11,r13
	mov r14,r15
	sub r14,r11
	mov r11,r9
	sub r11,r14
	mov r9,r12
	add r9,r11
	mov r11, qword [gbl+8*9]
	mov r12,r11
	sub r12,r8
	mov r14,r12
	add r14,r13
	mov r12,r8
	add r12,r13
	mov r15,r14
	sub r15,r12
	mov r12,r11
	sub r12,r8
	mov r14,r12
	add r14,r13
	mov r12,r15
	add r12,r14
	mov r14,r8
	add r14,r13
	mov r15,r11
	sub r15,r8
	mov r11,r15
	add r11,r13
	mov r15,r14
	add r15,r11
	mov r11,r8
	add r11,r13
	mov r14,r15
	sub r14,r11
	mov r11,r12
	sub r11,r14
	mov r12, qword [gbl+8*9]
	mov r14,r12
	sub r14,r8
	mov r15,r14
	add r15,r13
	mov r14,r8
	add r14,r13
	mov r12,r15
	sub r12,r14
	mov r14, qword [gbl+8*9]
	mov r15,r14
	sub r15,r8
	mov r14,r15
	add r14,r13
	mov r15,r12
	add r15,r14
	mov r12,r8
	add r12,r13
	mov r14, qword [gbl+8*9]
	mov r13,r14
	sub r13,r8
	mov r14, qword [gbl+8*7]
	mov r8,r13
	add r8,r14
	mov r13,r12
	add r13,r8
	mov r8, qword [gbl+8*5]
	mov r12,r8
	add r12,r14
	mov r14,r13
	sub r14,r12
	mov r12,r15
	sub r12,r14
	mov r13,r11
	add r13,r12
	mov r11,r9
	add r11,r13
	mov r9, qword [gbl+8*9]
	mov r12,r9
	sub r12,r8
	mov r13, qword [gbl+8*7]
	mov r14,r12
	add r14,r13
	mov r12,r8
	add r12,r13
	mov r15,r14
	sub r15,r12
	mov r12,r9
	sub r12,r8
	mov r14,r12
	add r14,r13
	mov r12,r8
	add r12,r13
	mov r9,r14
	sub r9,r12
	mov r12,r15
	add r12,r9
	mov r9, qword [gbl+8*9]
	mov r14,r9
	sub r14,r8
	mov r15,r14
	add r15,r13
	mov r14,r8
	add r14,r13
	mov r9,r15
	sub r9,r14
	mov r14, qword [gbl+8*9]
	mov r15,r14
	sub r15,r8
	mov r14,r15
	add r14,r13
	mov r15,r9
	add r15,r14
	mov r9,r12
	add r9,r15
	mov r12,r8
	add r12,r13
	mov r14, qword [gbl+8*9]
	mov r15,r14
	sub r15,r8
	mov r14,r15
	add r14,r13
	mov r15,r12
	add r15,r14
	mov r12,r8
	add r12,r13
	mov r14,r15
	sub r14,r12
	mov r12, qword [gbl+8*9]
	mov r15,r12
	sub r15,r8
	mov r12,r15
	add r12,r13
	mov r15,r8
	add r15,r13
	mov r13,r12
	sub r13,r15
	mov r12, qword [gbl+8*9]
	mov r15,r12
	sub r15,r8
	mov r12, qword [gbl+8*7]
	mov r8,r15
	add r8,r12
	mov r15,r13
	add r15,r8
	mov r8,r14
	add r8,r15
	mov r13,r9
	sub r13,r8
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r12
	mov r14, qword [gbl+8*9]
	mov r15,r14
	sub r15,r8
	mov r14,r15
	add r14,r12
	mov r15,r9
	add r15,r14
	mov r9,r8
	add r9,r12
	mov r14,r15
	sub r14,r9
	mov r9, qword [gbl+8*9]
	mov r15,r9
	sub r15,r8
	mov r9,r15
	add r9,r12
	mov r15,r8
	add r15,r12
	mov r12,r9
	sub r12,r15
	mov r9, qword [gbl+8*9]
	mov r15,r9
	sub r15,r8
	mov r9, qword [gbl+8*7]
	mov r8,r15
	add r8,r9
	mov r15,r12
	add r15,r8
	mov r8,r14
	add r8,r15
	mov r12, qword [gbl+8*5]
	mov r14,r12
	add r14,r9
	mov r15, qword [gbl+8*9]
	mov r9,r15
	sub r9,r12
	mov r15, qword [gbl+8*7]
	mov r12,r9
	add r12,r15
	mov r9,r14
	add r9,r12
	mov r12, qword [gbl+8*5]
	mov r14,r12
	add r14,r15
	mov r15,r9
	sub r15,r14
	mov r9, qword [gbl+8*9]
	mov r14,r9
	sub r14,r12
	mov r9, qword [gbl+8*7]
	mov r12,r14
	add r12,r9
	mov r14, qword [gbl+8*5]
	mov qword [rsp+8*142],r10
	mov r10,r14
	add r10,r9
	mov r9,r12
	sub r9,r10
	mov r10, qword [gbl+8*9]
	mov r12,r10
	sub r12,r14
	mov r10, qword [gbl+8*7]
	mov r14,r12
	add r14,r10
	mov r12,r9
	add r12,r14
	mov r9,r15
	add r9,r12
	mov r12,r8
	sub r12,r9
	mov r8,r13
	sub r8,r12
	mov r9,r11
	add r9,r8
	mov r8, qword [rsp+8*142]
	mov r11,r8
	sub r11,r9
	mov r8,r11
	mov r9, qword [gbl+8*9]
	mov r11,r9
	sub r11,r8
	mov r12,r11
	add r12,r10
	mov r11,r8
	add r11,r10
	mov r13,r12
	sub r13,r11
	mov r11,r9
	sub r11,r8
	mov r12,r11
	add r12,r10
	mov r11,r8
	add r11,r10
	mov r14,r12
	sub r14,r11
	mov r11,r13
	add r11,r14
	mov r12,r9
	sub r12,r8
	mov r13,r12
	add r13,r10
	mov r12,r8
	add r12,r10
	mov r14,r13
	sub r14,r12
	mov r12,r9
	sub r12,r8
	mov r13,r12
	add r13,r10
	mov r12,r14
	add r12,r13
	mov r13,r11
	add r13,r12
	mov r11,r8
	add r11,r10
	mov r12,r9
	sub r12,r8
	mov r14,r12
	add r14,r10
	mov r12,r11
	add r12,r14
	mov r11,r8
	add r11,r10
	mov r14,r12
	sub r14,r11
	mov r11,r9
	sub r11,r8
	mov r12,r11
	add r12,r10
	mov r11,r8
	add r11,r10
	mov r15,r12
	sub r15,r11
	mov r11,r9
	sub r11,r8
	mov r12,r11
	add r12,r10
	mov r11,r15
	add r11,r12
	mov r12,r14
	add r12,r11
	mov r11,r13
	sub r11,r12
	mov r12,r8
	add r12,r10
	mov r13,r9
	sub r13,r8
	mov r14,r13
	add r14,r10
	mov r13,r12
	add r13,r14
	mov r12,r8
	add r12,r10
	mov r14,r9
	sub r14,r8
	mov r15,r14
	add r15,r10
	mov r14,r12
	add r14,r15
	mov r12,r13
	sub r12,r14
	mov r13,r8
	add r13,r10
	mov r14,r9
	sub r14,r8
	mov r15,r14
	add r15,r10
	mov r14,r13
	add r14,r15
	mov r13,r8
	add r13,r10
	mov r15,r14
	sub r15,r13
	mov r13,r12
	sub r13,r15
	mov r12,r9
	sub r12,r8
	mov r14,r12
	add r14,r10
	mov r12,r8
	add r12,r10
	mov r15,r14
	sub r15,r12
	mov r12,r9
	sub r12,r8
	mov r14,r12
	add r14,r10
	mov r12,r15
	add r12,r14
	mov r14,r8
	add r14,r10
	mov r15,r9
	sub r15,r8
	mov r9,r15
	add r9,r10
	mov r15,r14
	add r15,r9
	mov r9,r8
	add r9,r10
	mov r14,r15
	sub r14,r9
	mov r9,r12
	sub r9,r14
	mov r12,r13
	add r12,r9
	mov r9,r11
	sub r9,r12
	mov r11, qword [gbl+8*9]
	mov r12,r11
	sub r12,r8
	mov r13,r12
	add r13,r10
	mov r12,r8
	add r12,r10
	mov r14,r13
	sub r14,r12
	mov r12,r11
	sub r12,r8
	mov r13,r12
	add r13,r10
	mov r12,r8
	add r12,r10
	mov r15,r13
	sub r15,r12
	mov r12,r14
	add r12,r15
	mov r13,r11
	sub r13,r8
	mov r14,r13
	add r14,r10
	mov r13,r8
	add r13,r10
	mov r15,r14
	sub r15,r13
	mov r13,r11
	sub r13,r8
	mov r14,r13
	add r14,r10
	mov r13,r15
	add r13,r14
	mov r14,r12
	add r14,r13
	mov r12,r8
	add r12,r10
	mov r13,r11
	sub r13,r8
	mov r15,r13
	add r15,r10
	mov r13,r12
	add r13,r15
	mov r12,r8
	add r12,r10
	mov r15,r13
	sub r15,r12
	mov r12,r11
	sub r12,r8
	mov r13,r12
	add r13,r10
	mov r12,r8
	add r12,r10
	mov r11,r13
	sub r11,r12
	mov r12, qword [gbl+8*9]
	mov r13,r12
	sub r13,r8
	mov r12,r13
	add r12,r10
	mov r13,r11
	add r13,r12
	mov r11,r15
	add r11,r13
	mov r12,r14
	sub r12,r11
	mov r11,r8
	add r11,r10
	mov r13, qword [gbl+8*9]
	mov r14,r13
	sub r14,r8
	mov r15,r14
	add r15,r10
	mov r14,r11
	add r14,r15
	mov r11,r8
	add r11,r10
	mov r15,r14
	sub r15,r11
	mov r11,r13
	sub r11,r8
	mov r14,r11
	add r14,r10
	mov r11,r8
	add r11,r10
	mov r13,r14
	sub r13,r11
	mov r11, qword [gbl+8*9]
	mov r14,r11
	sub r14,r8
	mov r11,r14
	add r11,r10
	mov r14,r13
	add r14,r11
	mov r11,r15
	add r11,r14
	mov r13,r8
	add r13,r10
	mov r14, qword [gbl+8*9]
	mov r15,r14
	sub r15,r8
	mov r14,r15
	add r14,r10
	mov r15,r13
	add r15,r14
	mov r13,r8
	add r13,r10
	mov r14,r15
	sub r14,r13
	mov r13, qword [gbl+8*9]
	mov r15,r13
	sub r15,r8
	mov r13,r15
	add r13,r10
	mov r15,r8
	add r15,r10
	mov r10,r13
	sub r10,r15
	mov r13, qword [gbl+8*9]
	mov r15,r13
	sub r15,r8
	mov r13, qword [gbl+8*7]
	mov qword [gbl+8*5],r8
	mov r8,r15
	add r8,r13
	mov r15,r10
	add r15,r8
	mov r8,r14
	add r8,r15
	mov r10,r11
	sub r10,r8
	mov r8,r12
	sub r8,r10
	mov r10,r9
	add r10,r8
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r13
	mov r11, qword [gbl+8*9]
	mov r12,r11
	sub r12,r8
	mov r14,r12
	add r14,r13
	mov r12,r9
	add r12,r14
	mov r9,r8
	add r9,r13
	mov r14,r11
	sub r14,r8
	mov r15,r14
	add r15,r13
	mov r14,r9
	add r14,r15
	mov r9,r12
	sub r9,r14
	mov r12,r8
	add r12,r13
	mov r14,r11
	sub r14,r8
	mov r15,r14
	add r15,r13
	mov r14,r12
	add r14,r15
	mov r12,r8
	add r12,r13
	mov r15,r14
	sub r15,r12
	mov r12,r9
	sub r12,r15
	mov r9,r11
	sub r9,r8
	mov r14,r9
	add r14,r13
	mov r9,r8
	add r9,r13
	mov r15,r14
	sub r15,r9
	mov r9,r11
	sub r9,r8
	mov r14,r9
	add r14,r13
	mov r9,r15
	add r9,r14
	mov r14,r8
	add r14,r13
	mov r15,r11
	sub r15,r8
	mov r11,r15
	add r11,r13
	mov r15,r14
	add r15,r11
	mov r11,r8
	add r11,r13
	mov r14,r15
	sub r14,r11
	mov r11,r9
	sub r11,r14
	mov r9,r12
	add r9,r11
	mov r11, qword [gbl+8*9]
	mov r12,r11
	sub r12,r8
	mov r14,r12
	add r14,r13
	mov r12,r8
	add r12,r13
	mov r15,r14
	sub r15,r12
	mov r12,r11
	sub r12,r8
	mov r14,r12
	add r14,r13
	mov r12,r15
	add r12,r14
	mov r14,r8
	add r14,r13
	mov r15,r11
	sub r15,r8
	mov r11,r15
	add r11,r13
	mov r15,r14
	add r15,r11
	mov r11,r8
	add r11,r13
	mov r14,r15
	sub r14,r11
	mov r11,r12
	sub r11,r14
	mov r12, qword [gbl+8*9]
	mov r14,r12
	sub r14,r8
	mov r15,r14
	add r15,r13
	mov r14,r8
	add r14,r13
	mov r12,r15
	sub r12,r14
	mov r14, qword [gbl+8*9]
	mov r15,r14
	sub r15,r8
	mov r14,r15
	add r14,r13
	mov r15,r12
	add r15,r14
	mov r12,r8
	add r12,r13
	mov r14, qword [gbl+8*9]
	mov r13,r14
	sub r13,r8
	mov r14, qword [gbl+8*7]
	mov r8,r13
	add r8,r14
	mov r13,r12
	add r13,r8
	mov r8, qword [gbl+8*5]
	mov r12,r8
	add r12,r14
	mov r14,r13
	sub r14,r12
	mov r12,r15
	sub r12,r14
	mov r13,r11
	add r13,r12
	mov r11,r9
	add r11,r13
	mov r9, qword [gbl+8*9]
	mov r12,r9
	sub r12,r8
	mov r13, qword [gbl+8*7]
	mov r14,r12
	add r14,r13
	mov r12,r8
	add r12,r13
	mov r15,r14
	sub r15,r12
	mov r12,r9
	sub r12,r8
	mov r14,r12
	add r14,r13
	mov r12,r8
	add r12,r13
	mov r9,r14
	sub r9,r12
	mov r12,r15
	add r12,r9
	mov r9, qword [gbl+8*9]
	mov r14,r9
	sub r14,r8
	mov r15,r14
	add r15,r13
	mov r14,r8
	add r14,r13
	mov r9,r15
	sub r9,r14
	mov r14, qword [gbl+8*9]
	mov r15,r14
	sub r15,r8
	mov r14,r15
	add r14,r13
	mov r15,r9
	add r15,r14
	mov r9,r12
	add r9,r15
	mov r12,r8
	add r12,r13
	mov r14, qword [gbl+8*9]
	mov r15,r14
	sub r15,r8
	mov r14,r15
	add r14,r13
	mov r15,r12
	add r15,r14
	mov r12,r8
	add r12,r13
	mov r14,r15
	sub r14,r12
	mov r12, qword [gbl+8*9]
	mov r15,r12
	sub r15,r8
	mov r12,r15
	add r12,r13
	mov r15,r8
	add r15,r13
	mov r13,r12
	sub r13,r15
	mov r12, qword [gbl+8*9]
	mov r15,r12
	sub r15,r8
	mov r12, qword [gbl+8*7]
	mov r8,r15
	add r8,r12
	mov r15,r13
	add r15,r8
	mov r8,r14
	add r8,r15
	mov r13,r9
	sub r13,r8
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r12
	mov r14, qword [gbl+8*9]
	mov r15,r14
	sub r15,r8
	mov r14,r15
	add r14,r12
	mov r15,r9
	add r15,r14
	mov r9,r8
	add r9,r12
	mov r14,r15
	sub r14,r9
	mov r9, qword [gbl+8*9]
	mov r15,r9
	sub r15,r8
	mov r9,r15
	add r9,r12
	mov r15,r8
	add r15,r12
	mov r12,r9
	sub r12,r15
	mov r9, qword [gbl+8*9]
	mov r15,r9
	sub r15,r8
	mov r9, qword [gbl+8*7]
	mov r8,r15
	add r8,r9
	mov r15,r12
	add r15,r8
	mov r8,r14
	add r8,r15
	mov r12, qword [gbl+8*5]
	mov r14,r12
	add r14,r9
	mov r15, qword [gbl+8*9]
	mov r9,r15
	sub r9,r12
	mov r15, qword [gbl+8*7]
	mov r12,r9
	add r12,r15
	mov r9,r14
	add r9,r12
	mov r12, qword [gbl+8*5]
	mov r14,r12
	add r14,r15
	mov r15,r9
	sub r15,r14
	mov r9, qword [gbl+8*9]
	mov r14,r9
	sub r14,r12
	mov r9, qword [gbl+8*7]
	mov r12,r14
	add r12,r9
	mov r14, qword [gbl+8*5]
	mov qword [rsp+8*394],r10
	mov r10,r14
	add r10,r9
	mov r9,r12
	sub r9,r10
	mov r10, qword [gbl+8*9]
	mov r12,r10
	sub r12,r14
	mov r10, qword [gbl+8*7]
	mov r14,r12
	add r14,r10
	mov r12,r9
	add r12,r14
	mov r9,r15
	add r9,r12
	mov r12,r8
	sub r12,r9
	mov r8,r13
	sub r8,r12
	mov r9,r11
	add r9,r8
	mov r8, qword [rsp+8*394]
	mov r11,r8
	sub r11,r9
	mov r10,r11
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov r11,r8
	sub r11,r9
	mov r12,r11
	add r12,r10
	mov r11,r9
	add r11,r10
	mov r13,r12
	sub r13,r11
	mov r11,r8
	sub r11,r9
	mov r12,r11
	add r12,r10
	mov r11,r9
	add r11,r10
	mov r14,r12
	sub r14,r11
	mov r11,r13
	add r11,r14
	mov r12,r8
	sub r12,r9
	mov r13,r12
	add r13,r10
	mov r12,r9
	add r12,r10
	mov r14,r13
	sub r14,r12
	mov r12,r8
	sub r12,r9
	mov r13,r12
	add r13,r10
	mov r12,r14
	add r12,r13
	mov r13,r11
	add r13,r12
	mov r11,r9
	add r11,r10
	mov r12,r8
	sub r12,r9
	mov r14,r12
	add r14,r10
	mov r12,r11
	add r12,r14
	mov r11,r9
	add r11,r10
	mov r14,r12
	sub r14,r11
	mov r11,r8
	sub r11,r9
	mov r12,r11
	add r12,r10
	mov r11,r9
	add r11,r10
	mov r15,r12
	sub r15,r11
	mov r11,r8
	sub r11,r9
	mov r12,r11
	add r12,r10
	mov r11,r15
	add r11,r12
	mov r12,r14
	add r12,r11
	mov r11,r13
	sub r11,r12
	mov r12,r9
	add r12,r10
	mov r13,r8
	sub r13,r9
	mov r14,r13
	add r14,r10
	mov r13,r12
	add r13,r14
	mov r12,r9
	add r12,r10
	mov r14,r8
	sub r14,r9
	mov r15,r14
	add r15,r10
	mov r14,r12
	add r14,r15
	mov r12,r13
	sub r12,r14
	mov r13,r9
	add r13,r10
	mov r14,r8
	sub r14,r9
	mov r15,r14
	add r15,r10
	mov r14,r13
	add r14,r15
	mov r13,r9
	add r13,r10
	mov r15,r14
	sub r15,r13
	mov r13,r12
	sub r13,r15
	mov r12,r8
	sub r12,r9
	mov r14,r12
	add r14,r10
	mov r12,r9
	add r12,r10
	mov r15,r14
	sub r15,r12
	mov r12,r8
	sub r12,r9
	mov r14,r12
	add r14,r10
	mov r12,r15
	add r12,r14
	mov r14,r9
	add r14,r10
	mov r15,r8
	sub r15,r9
	mov r8,r15
	add r8,r10
	mov r15,r14
	add r15,r8
	mov r8,r9
	add r8,r10
	mov r14,r15
	sub r14,r8
	mov r8,r12
	sub r8,r14
	mov r12,r13
	add r12,r8
	mov r8,r11
	sub r8,r12
	mov r11, qword [gbl+8*9]
	mov r12,r11
	sub r12,r9
	mov r13,r12
	add r13,r10
	mov r12,r9
	add r12,r10
	mov r14,r13
	sub r14,r12
	mov r12,r11
	sub r12,r9
	mov r13,r12
	add r13,r10
	mov r12,r9
	add r12,r10
	mov r15,r13
	sub r15,r12
	mov r12,r14
	add r12,r15
	mov r13,r11
	sub r13,r9
	mov r14,r13
	add r14,r10
	mov r13,r9
	add r13,r10
	mov r15,r14
	sub r15,r13
	mov r13,r11
	sub r13,r9
	mov r14,r13
	add r14,r10
	mov r13,r15
	add r13,r14
	mov r14,r12
	add r14,r13
	mov r12,r9
	add r12,r10
	mov r13,r11
	sub r13,r9
	mov r15,r13
	add r15,r10
	mov r13,r12
	add r13,r15
	mov r12,r9
	add r12,r10
	mov r15,r13
	sub r15,r12
	mov r12,r11
	sub r12,r9
	mov r13,r12
	add r13,r10
	mov r12,r9
	add r12,r10
	mov r11,r13
	sub r11,r12
	mov r12, qword [gbl+8*9]
	mov r13,r12
	sub r13,r9
	mov r12,r13
	add r12,r10
	mov r13,r11
	add r13,r12
	mov r11,r15
	add r11,r13
	mov r12,r14
	sub r12,r11
	mov r11,r9
	add r11,r10
	mov r13, qword [gbl+8*9]
	mov r14,r13
	sub r14,r9
	mov r15,r14
	add r15,r10
	mov r14,r11
	add r14,r15
	mov r11,r9
	add r11,r10
	mov r15,r14
	sub r15,r11
	mov r11,r13
	sub r11,r9
	mov r14,r11
	add r14,r10
	mov r11,r9
	add r11,r10
	mov r13,r14
	sub r13,r11
	mov r11, qword [gbl+8*9]
	mov r14,r11
	sub r14,r9
	mov r11,r14
	add r11,r10
	mov r14,r13
	add r14,r11
	mov r11,r15
	add r11,r14
	mov r13,r9
	add r13,r10
	mov r14, qword [gbl+8*9]
	mov r15,r14
	sub r15,r9
	mov r14,r15
	add r14,r10
	mov r15,r13
	add r15,r14
	mov r13,r9
	add r13,r10
	mov r14,r15
	sub r14,r13
	mov r13, qword [gbl+8*9]
	mov r15,r13
	sub r15,r9
	mov r13,r15
	add r13,r10
	mov r15,r9
	add r15,r10
	mov qword [gbl+8*7],r10
	mov r10,r13
	sub r10,r15
	mov r13, qword [gbl+8*9]
	mov r15,r13
	sub r15,r9
	mov r13, qword [gbl+8*7]
	mov r9,r15
	add r9,r13
	mov r15,r10
	add r15,r9
	mov r9,r14
	add r9,r15
	mov r10,r11
	sub r10,r9
	mov r9,r12
	sub r9,r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r13
	mov r11, qword [gbl+8*9]
	mov r12,r11
	sub r12,r8
	mov r14,r12
	add r14,r13
	mov r12,r9
	add r12,r14
	mov r9,r8
	add r9,r13
	mov r14,r11
	sub r14,r8
	mov r15,r14
	add r15,r13
	mov r14,r9
	add r14,r15
	mov r9,r12
	sub r9,r14
	mov r12,r8
	add r12,r13
	mov r14,r11
	sub r14,r8
	mov r15,r14
	add r15,r13
	mov r14,r12
	add r14,r15
	mov r12,r8
	add r12,r13
	mov r15,r14
	sub r15,r12
	mov r12,r9
	sub r12,r15
	mov r9,r11
	sub r9,r8
	mov r14,r9
	add r14,r13
	mov r9,r8
	add r9,r13
	mov r15,r14
	sub r15,r9
	mov r9,r11
	sub r9,r8
	mov r14,r9
	add r14,r13
	mov r9,r15
	add r9,r14
	mov r14,r8
	add r14,r13
	mov r15,r11
	sub r15,r8
	mov r11,r15
	add r11,r13
	mov r15,r14
	add r15,r11
	mov r11,r8
	add r11,r13
	mov r14,r15
	sub r14,r11
	mov r11,r9
	sub r11,r14
	mov r9,r12
	add r9,r11
	mov r11, qword [gbl+8*9]
	mov r12,r11
	sub r12,r8
	mov r14,r12
	add r14,r13
	mov r12,r8
	add r12,r13
	mov r15,r14
	sub r15,r12
	mov r12,r11
	sub r12,r8
	mov r14,r12
	add r14,r13
	mov r12,r15
	add r12,r14
	mov r14,r8
	add r14,r13
	mov r15,r11
	sub r15,r8
	mov r11,r15
	add r11,r13
	mov r15,r14
	add r15,r11
	mov r11,r8
	add r11,r13
	mov r14,r15
	sub r14,r11
	mov r11,r12
	sub r11,r14
	mov r12, qword [gbl+8*9]
	mov r14,r12
	sub r14,r8
	mov r15,r14
	add r15,r13
	mov r14,r8
	add r14,r13
	mov r12,r15
	sub r12,r14
	mov r14, qword [gbl+8*9]
	mov r15,r14
	sub r15,r8
	mov r14,r15
	add r14,r13
	mov r15,r12
	add r15,r14
	mov r12,r8
	add r12,r13
	mov r14, qword [gbl+8*9]
	mov r13,r14
	sub r13,r8
	mov r14, qword [gbl+8*7]
	mov r8,r13
	add r8,r14
	mov r13,r12
	add r13,r8
	mov r8, qword [gbl+8*5]
	mov r12,r8
	add r12,r14
	mov r14,r13
	sub r14,r12
	mov r12,r15
	sub r12,r14
	mov r13,r11
	add r13,r12
	mov r11,r9
	add r11,r13
	mov r9, qword [gbl+8*9]
	mov r12,r9
	sub r12,r8
	mov r13, qword [gbl+8*7]
	mov r14,r12
	add r14,r13
	mov r12,r8
	add r12,r13
	mov r15,r14
	sub r15,r12
	mov r12,r9
	sub r12,r8
	mov r14,r12
	add r14,r13
	mov r12,r8
	add r12,r13
	mov r9,r14
	sub r9,r12
	mov r12,r15
	add r12,r9
	mov r9, qword [gbl+8*9]
	mov r14,r9
	sub r14,r8
	mov r15,r14
	add r15,r13
	mov r14,r8
	add r14,r13
	mov r9,r15
	sub r9,r14
	mov r14, qword [gbl+8*9]
	mov r15,r14
	sub r15,r8
	mov r14,r15
	add r14,r13
	mov r15,r9
	add r15,r14
	mov r9,r12
	add r9,r15
	mov r12,r8
	add r12,r13
	mov r14, qword [gbl+8*9]
	mov r15,r14
	sub r15,r8
	mov r14,r15
	add r14,r13
	mov r15,r12
	add r15,r14
	mov r12,r8
	add r12,r13
	mov r14,r15
	sub r14,r12
	mov r12, qword [gbl+8*9]
	mov r15,r12
	sub r15,r8
	mov r12,r15
	add r12,r13
	mov r15,r8
	add r15,r13
	mov r13,r12
	sub r13,r15
	mov r12, qword [gbl+8*9]
	mov r15,r12
	sub r15,r8
	mov r12, qword [gbl+8*7]
	mov r8,r15
	add r8,r12
	mov r15,r13
	add r15,r8
	mov r8,r14
	add r8,r15
	mov r13,r9
	sub r13,r8
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r12
	mov r14, qword [gbl+8*9]
	mov r15,r14
	sub r15,r8
	mov r14,r15
	add r14,r12
	mov r15,r9
	add r15,r14
	mov r9,r8
	add r9,r12
	mov r14,r15
	sub r14,r9
	mov r9, qword [gbl+8*9]
	mov r15,r9
	sub r15,r8
	mov r9,r15
	add r9,r12
	mov r15,r8
	add r15,r12
	mov r12,r9
	sub r12,r15
	mov r9, qword [gbl+8*9]
	mov r15,r9
	sub r15,r8
	mov r9, qword [gbl+8*7]
	mov r8,r15
	add r8,r9
	mov r15,r12
	add r15,r8
	mov r8,r14
	add r8,r15
	mov r12, qword [gbl+8*5]
	mov r14,r12
	add r14,r9
	mov r15, qword [gbl+8*9]
	mov r9,r15
	sub r9,r12
	mov r15, qword [gbl+8*7]
	mov r12,r9
	add r12,r15
	mov r9,r14
	add r9,r12
	mov r12, qword [gbl+8*5]
	mov r14,r12
	add r14,r15
	mov r15,r9
	sub r15,r14
	mov r9, qword [gbl+8*9]
	mov r14,r9
	sub r14,r12
	mov r9, qword [gbl+8*7]
	mov r12,r14
	add r12,r9
	mov r14, qword [gbl+8*5]
	mov qword [rsp+8*646],r10
	mov r10,r14
	add r10,r9
	mov r9,r12
	sub r9,r10
	mov r10, qword [gbl+8*9]
	mov r12,r10
	sub r12,r14
	mov r10, qword [gbl+8*7]
	mov r14,r12
	add r14,r10
	mov r12,r9
	add r12,r14
	mov r9,r15
	add r9,r12
	mov r12,r8
	sub r12,r9
	mov r8,r13
	sub r8,r12
	mov r9,r11
	add r9,r8
	mov r8, qword [rsp+8*646]
	mov r11,r8
	sub r11,r9
	mov r8,r11
	mov qword [gbl+8*9],r8
	mov qword [rsp+8*770],r9
	mov qword [rsp+8*771],r11
	mov qword [rsp+8*768],r12
	mov qword [rsp+8*739],r13
	mov qword [rsp+8*765],r14
	mov qword [rsp+8*759],r15
	jmp L_3
	
L_4:
	xor rdx, rdx
	mov r8, qword [rsp+8*2]
	mov rax, r8
	mov r9,1000
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r11,0
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*772],r10
	mov qword [rsp+8*773],r12
	mov r8, qword [rsp+8*773]
	cmp r8, 0
	je L_8
	mov r9, qword [gbl+8*5]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*775],r10
	mov     rdi, [rsp+8*775]
	call    toString
	mov     qword[rsp+8*776], rax
	mov     rsi, t848
	mov     rdi, [rsp+8*776]
	call    concat
	mov [rsp+8*777], rax
	mov r9, qword [gbl+8*7]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*778],r10
	mov     rdi, [rsp+8*778]
	call    toString
	mov     qword[rsp+8*779], rax
	mov     rsi, [rsp+8*779]
	mov     rdi, [rsp+8*777]
	call    concat
	mov [rsp+8*780], rax
	mov     rsi, t854
	mov     rdi, [rsp+8*780]
	call    concat
	mov [rsp+8*781], rax
	mov r9, qword [gbl+8*9]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*782],r10
	mov     rdi, [rsp+8*782]
	call    toString
	mov     qword[rsp+8*783], rax
	mov     rsi, [rsp+8*783]
	mov     rdi, [rsp+8*781]
	call    concat
	mov [rsp+8*784], rax
	mov r9, qword [rsp+8*784]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*785],r10
	mov rdi,[rsp+8*785] 
	add rdi, 1 
	call puts
	
L_8:
	
L_2:
	mov r8, qword [rsp+8*2]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*2],r8
	jmp L_0
	
L_1:
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
	sub    rsp, 6352
	mov r8, qword [rsp+8*786]
	mov rax,r8
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   8336
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
	
t854:
	 db 1," " ,0

t848:
	 db 1," " ,0


