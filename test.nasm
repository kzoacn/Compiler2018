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
	sub    rsp, 728
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 2712
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
	call    getInt
	mov     [rsp+8*2], rax
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov r13,0
	mov r12,r13
	mov qword [rsp+8*3],r8
	mov qword [rsp+8*4],r10
	mov qword [rsp+8*5],r12
	
L_0:
	mov r8,  [rsp+8*5]
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*6],r10
	mov r8,  [rsp+8*6]
	cmp r8, 0
	je L_1
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*7],r8
	
L_3:
	mov r8,  [rsp+8*7]
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*8],r10
	mov r8,  [rsp+8*8]
	cmp r8, 0
	je L_4
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*9],r8
	
L_6:
	mov r8,  [rsp+8*9]
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*10],r10
	mov r8,  [rsp+8*10]
	cmp r8, 0
	je L_7
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*11],r8
	
L_9:
	mov r8,  [rsp+8*11]
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*12],r10
	mov r8,  [rsp+8*12]
	cmp r8, 0
	je L_10
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*13],r8
	
L_12:
	mov r8,  [rsp+8*13]
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*14],r10
	mov r8,  [rsp+8*14]
	cmp r8, 0
	je L_13
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	
L_15:
	mov r8,  [rsp+8*15]
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*16],r10
	mov r8,  [rsp+8*16]
	cmp r8, 0
	je L_16
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*17],r8
	
L_18:
	mov r8,  [rsp+8*17]
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*18],r10
	mov r8,  [rsp+8*18]
	cmp r8, 0
	je L_19
	mov r8,  [rsp+8*5]
	mov r9,  [rsp+8*7]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*19],r10
	mov r8,  [rsp+8*19]
	cmp r8, 0
	jne L_21
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*19],r8
	jmp L_22
	
L_21:
	mov r8,  [rsp+8*9]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*20],r10
	mov r9,  [rsp+8*20]
	mov r8,r9
	mov qword [rsp+8*19],r8
	
L_22:
	mov r8,  [rsp+8*19]
	cmp r8, 0
	je L_27
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*19],r8
	jmp L_28
	
L_27:
	mov r8,  [rsp+8*11]
	mov r9,  [rsp+8*13]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*21],r10
	mov r8,  [rsp+8*21]
	cmp r8, 0
	jne L_23
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*21],r8
	jmp L_24
	
L_23:
	mov r8,  [rsp+8*15]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*22],r10
	mov r9,  [rsp+8*22]
	mov r8,r9
	mov qword [rsp+8*21],r8
	
L_24:
	mov r8,  [rsp+8*21]
	cmp r8, 0
	jne L_25
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*21],r8
	jmp L_26
	
L_25:
	mov r8,  [rsp+8*17]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*23],r10
	mov r9,  [rsp+8*23]
	mov r8,r9
	mov qword [rsp+8*21],r8
	
L_26:
	mov r9,  [rsp+8*21]
	mov r8,r9
	mov qword [rsp+8*19],r8
	
L_28:
	mov r8,  [rsp+8*19]
	cmp r8, 0
	je L_29
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*19],r8
	jmp L_30
	
L_29:
	mov r8,  [rsp+8*5]
	mov r9,  [rsp+8*17]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*24],r10
	mov r9,  [rsp+8*24]
	mov r8,r9
	mov qword [rsp+8*19],r8
	
L_30:
	mov r8,  [rsp+8*19]
	cmp r8, 0
	je L_33
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*19],r8
	jmp L_34
	
L_33:
	mov r8,  [rsp+8*11]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*25],r10
	mov r8,  [rsp+8*25]
	cmp r8, 0
	jne L_31
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*25],r8
	jmp L_32
	
L_31:
	mov r8,  [rsp+8*15]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*26],r10
	mov r9,  [rsp+8*26]
	mov r8,r9
	mov qword [rsp+8*25],r8
	
L_32:
	mov r9,  [rsp+8*25]
	mov r8,r9
	mov qword [rsp+8*19],r8
	
L_34:
	mov r9,  [rsp+8*19]
	mov r8,r9
	mov r10,  [rsp+8*5]
	mov r11,  [rsp+8*7]
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*27],r8
	mov qword [rsp+8*28],r12
	mov r8,  [rsp+8*28]
	cmp r8, 0
	jne L_35
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*28],r8
	jmp L_36
	
L_35:
	mov r8,  [rsp+8*9]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*29],r10
	mov r9,  [rsp+8*29]
	mov r8,r9
	mov qword [rsp+8*28],r8
	
L_36:
	mov r8,  [rsp+8*28]
	cmp r8, 0
	je L_41
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*28],r8
	jmp L_42
	
L_41:
	mov r8,  [rsp+8*11]
	mov r9,  [rsp+8*13]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*30],r10
	mov r8,  [rsp+8*30]
	cmp r8, 0
	jne L_37
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*30],r8
	jmp L_38
	
L_37:
	mov r8,  [rsp+8*15]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*31],r10
	mov r9,  [rsp+8*31]
	mov r8,r9
	mov qword [rsp+8*30],r8
	
L_38:
	mov r8,  [rsp+8*30]
	cmp r8, 0
	jne L_39
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*30],r8
	jmp L_40
	
L_39:
	mov r8,  [rsp+8*17]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*32],r10
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov qword [rsp+8*30],r8
	
L_40:
	mov r9,  [rsp+8*30]
	mov r8,r9
	mov qword [rsp+8*28],r8
	
L_42:
	mov r8,  [rsp+8*28]
	cmp r8, 0
	je L_43
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*28],r8
	jmp L_44
	
L_43:
	mov r8,  [rsp+8*5]
	mov r9,  [rsp+8*17]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*33],r10
	mov r9,  [rsp+8*33]
	mov r8,r9
	mov qword [rsp+8*28],r8
	
L_44:
	mov r8,  [rsp+8*28]
	cmp r8, 0
	je L_47
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*28],r8
	jmp L_48
	
L_47:
	mov r8,  [rsp+8*11]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*34],r10
	mov r8,  [rsp+8*34]
	cmp r8, 0
	jne L_45
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*34],r8
	jmp L_46
	
L_45:
	mov r8,  [rsp+8*15]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*35],r10
	mov r9,  [rsp+8*35]
	mov r8,r9
	mov qword [rsp+8*34],r8
	
L_46:
	mov r9,  [rsp+8*34]
	mov r8,r9
	mov qword [rsp+8*28],r8
	
L_48:
	mov r9,  [rsp+8*28]
	mov r8,r9
	mov r10,  [rsp+8*5]
	mov r11,  [rsp+8*7]
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*36],r8
	mov qword [rsp+8*37],r12
	mov r8,  [rsp+8*37]
	cmp r8, 0
	jne L_49
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*37],r8
	jmp L_50
	
L_49:
	mov r8,  [rsp+8*9]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*38],r10
	mov r9,  [rsp+8*38]
	mov r8,r9
	mov qword [rsp+8*37],r8
	
L_50:
	mov r8,  [rsp+8*37]
	cmp r8, 0
	je L_55
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*37],r8
	jmp L_56
	
L_55:
	mov r8,  [rsp+8*11]
	mov r9,  [rsp+8*13]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*39],r10
	mov r8,  [rsp+8*39]
	cmp r8, 0
	jne L_51
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*39],r8
	jmp L_52
	
L_51:
	mov r8,  [rsp+8*15]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*40],r10
	mov r9,  [rsp+8*40]
	mov r8,r9
	mov qword [rsp+8*39],r8
	
L_52:
	mov r8,  [rsp+8*39]
	cmp r8, 0
	jne L_53
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*39],r8
	jmp L_54
	
L_53:
	mov r8,  [rsp+8*17]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*41],r10
	mov r9,  [rsp+8*41]
	mov r8,r9
	mov qword [rsp+8*39],r8
	
L_54:
	mov r9,  [rsp+8*39]
	mov r8,r9
	mov qword [rsp+8*37],r8
	
L_56:
	mov r8,  [rsp+8*37]
	cmp r8, 0
	je L_57
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*37],r8
	jmp L_58
	
L_57:
	mov r8,  [rsp+8*5]
	mov r9,  [rsp+8*17]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*42],r10
	mov r9,  [rsp+8*42]
	mov r8,r9
	mov qword [rsp+8*37],r8
	
L_58:
	mov r8,  [rsp+8*37]
	cmp r8, 0
	je L_61
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*37],r8
	jmp L_62
	
L_61:
	mov r8,  [rsp+8*11]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*43],r10
	mov r8,  [rsp+8*43]
	cmp r8, 0
	jne L_59
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*43],r8
	jmp L_60
	
L_59:
	mov r8,  [rsp+8*15]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*44],r10
	mov r9,  [rsp+8*44]
	mov r8,r9
	mov qword [rsp+8*43],r8
	
L_60:
	mov r9,  [rsp+8*43]
	mov r8,r9
	mov qword [rsp+8*37],r8
	
L_62:
	mov r9,  [rsp+8*37]
	mov r8,r9
	mov r10,  [rsp+8*5]
	mov r11,  [rsp+8*7]
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*45],r8
	mov qword [rsp+8*46],r12
	mov r8,  [rsp+8*46]
	cmp r8, 0
	jne L_63
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*46],r8
	jmp L_64
	
L_63:
	mov r8,  [rsp+8*9]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*47],r10
	mov r9,  [rsp+8*47]
	mov r8,r9
	mov qword [rsp+8*46],r8
	
L_64:
	mov r8,  [rsp+8*46]
	cmp r8, 0
	je L_69
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*46],r8
	jmp L_70
	
L_69:
	mov r8,  [rsp+8*11]
	mov r9,  [rsp+8*13]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*48],r10
	mov r8,  [rsp+8*48]
	cmp r8, 0
	jne L_65
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*48],r8
	jmp L_66
	
L_65:
	mov r8,  [rsp+8*15]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*49],r10
	mov r9,  [rsp+8*49]
	mov r8,r9
	mov qword [rsp+8*48],r8
	
L_66:
	mov r8,  [rsp+8*48]
	cmp r8, 0
	jne L_67
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*48],r8
	jmp L_68
	
L_67:
	mov r8,  [rsp+8*17]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*50],r10
	mov r9,  [rsp+8*50]
	mov r8,r9
	mov qword [rsp+8*48],r8
	
L_68:
	mov r9,  [rsp+8*48]
	mov r8,r9
	mov qword [rsp+8*46],r8
	
L_70:
	mov r8,  [rsp+8*46]
	cmp r8, 0
	je L_71
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*46],r8
	jmp L_72
	
L_71:
	mov r8,  [rsp+8*5]
	mov r9,  [rsp+8*17]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*51],r10
	mov r9,  [rsp+8*51]
	mov r8,r9
	mov qword [rsp+8*46],r8
	
L_72:
	mov r8,  [rsp+8*46]
	cmp r8, 0
	je L_75
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*46],r8
	jmp L_76
	
L_75:
	mov r8,  [rsp+8*11]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*52],r10
	mov r8,  [rsp+8*52]
	cmp r8, 0
	jne L_73
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*52],r8
	jmp L_74
	
L_73:
	mov r8,  [rsp+8*15]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*53],r10
	mov r9,  [rsp+8*53]
	mov r8,r9
	mov qword [rsp+8*52],r8
	
L_74:
	mov r9,  [rsp+8*52]
	mov r8,r9
	mov qword [rsp+8*46],r8
	
L_76:
	mov r9,  [rsp+8*46]
	mov r8,r9
	mov r10,  [rsp+8*5]
	mov r11,  [rsp+8*7]
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*54],r8
	mov qword [rsp+8*55],r12
	mov r8,  [rsp+8*55]
	cmp r8, 0
	jne L_77
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*55],r8
	jmp L_78
	
L_77:
	mov r8,  [rsp+8*9]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*56],r10
	mov r9,  [rsp+8*56]
	mov r8,r9
	mov qword [rsp+8*55],r8
	
L_78:
	mov r8,  [rsp+8*55]
	cmp r8, 0
	je L_83
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*55],r8
	jmp L_84
	
L_83:
	mov r8,  [rsp+8*11]
	mov r9,  [rsp+8*13]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*57],r10
	mov r8,  [rsp+8*57]
	cmp r8, 0
	jne L_79
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*57],r8
	jmp L_80
	
L_79:
	mov r8,  [rsp+8*15]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*58],r10
	mov r9,  [rsp+8*58]
	mov r8,r9
	mov qword [rsp+8*57],r8
	
L_80:
	mov r8,  [rsp+8*57]
	cmp r8, 0
	jne L_81
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*57],r8
	jmp L_82
	
L_81:
	mov r8,  [rsp+8*17]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*59],r10
	mov r9,  [rsp+8*59]
	mov r8,r9
	mov qword [rsp+8*57],r8
	
L_82:
	mov r9,  [rsp+8*57]
	mov r8,r9
	mov qword [rsp+8*55],r8
	
L_84:
	mov r8,  [rsp+8*55]
	cmp r8, 0
	je L_85
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*55],r8
	jmp L_86
	
L_85:
	mov r8,  [rsp+8*5]
	mov r9,  [rsp+8*17]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*60],r10
	mov r9,  [rsp+8*60]
	mov r8,r9
	mov qword [rsp+8*55],r8
	
L_86:
	mov r8,  [rsp+8*55]
	cmp r8, 0
	je L_89
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*55],r8
	jmp L_90
	
L_89:
	mov r8,  [rsp+8*11]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*61],r10
	mov r8,  [rsp+8*61]
	cmp r8, 0
	jne L_87
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*61],r8
	jmp L_88
	
L_87:
	mov r8,  [rsp+8*15]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*62],r10
	mov r9,  [rsp+8*62]
	mov r8,r9
	mov qword [rsp+8*61],r8
	
L_88:
	mov r9,  [rsp+8*61]
	mov r8,r9
	mov qword [rsp+8*55],r8
	
L_90:
	mov r9,  [rsp+8*55]
	mov r8,r9
	mov r10,  [rsp+8*5]
	mov r11,  [rsp+8*7]
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*63],r8
	mov qword [rsp+8*64],r12
	mov r8,  [rsp+8*64]
	cmp r8, 0
	jne L_91
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*64],r8
	jmp L_92
	
L_91:
	mov r8,  [rsp+8*9]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*65],r10
	mov r9,  [rsp+8*65]
	mov r8,r9
	mov qword [rsp+8*64],r8
	
L_92:
	mov r8,  [rsp+8*64]
	cmp r8, 0
	je L_97
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*64],r8
	jmp L_98
	
L_97:
	mov r8,  [rsp+8*11]
	mov r9,  [rsp+8*13]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*66],r10
	mov r8,  [rsp+8*66]
	cmp r8, 0
	jne L_93
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*66],r8
	jmp L_94
	
L_93:
	mov r8,  [rsp+8*15]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*67],r10
	mov r9,  [rsp+8*67]
	mov r8,r9
	mov qword [rsp+8*66],r8
	
L_94:
	mov r8,  [rsp+8*66]
	cmp r8, 0
	jne L_95
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*66],r8
	jmp L_96
	
L_95:
	mov r8,  [rsp+8*17]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*68],r10
	mov r9,  [rsp+8*68]
	mov r8,r9
	mov qword [rsp+8*66],r8
	
L_96:
	mov r9,  [rsp+8*66]
	mov r8,r9
	mov qword [rsp+8*64],r8
	
L_98:
	mov r8,  [rsp+8*64]
	cmp r8, 0
	je L_99
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*64],r8
	jmp L_100
	
L_99:
	mov r8,  [rsp+8*5]
	mov r9,  [rsp+8*17]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*69],r10
	mov r9,  [rsp+8*69]
	mov r8,r9
	mov qword [rsp+8*64],r8
	
L_100:
	mov r8,  [rsp+8*64]
	cmp r8, 0
	je L_103
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*64],r8
	jmp L_104
	
L_103:
	mov r8,  [rsp+8*11]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*70],r10
	mov r8,  [rsp+8*70]
	cmp r8, 0
	jne L_101
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*70],r8
	jmp L_102
	
L_101:
	mov r8,  [rsp+8*15]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*71],r10
	mov r9,  [rsp+8*71]
	mov r8,r9
	mov qword [rsp+8*70],r8
	
L_102:
	mov r9,  [rsp+8*70]
	mov r8,r9
	mov qword [rsp+8*64],r8
	
L_104:
	mov r9,  [rsp+8*64]
	mov r8,r9
	mov r10,  [rsp+8*27]
	cmp r10, 0
	mov qword [rsp+8*72],r8
	je L_106
	mov r9,  [rsp+8*4]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*73],r8
	mov qword [rsp+8*4],r9
	
L_106:
	mov r8,  [rsp+8*36]
	cmp r8, 0
	je L_108
	mov r9,  [rsp+8*4]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*4],r9
	
L_108:
	mov r8,  [rsp+8*45]
	cmp r8, 0
	je L_110
	mov r9,  [rsp+8*4]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*75],r8
	mov qword [rsp+8*4],r9
	
L_110:
	mov r8,  [rsp+8*54]
	cmp r8, 0
	je L_112
	mov r9,  [rsp+8*4]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*4],r9
	
L_112:
	mov r8,  [rsp+8*63]
	cmp r8, 0
	je L_114
	mov r9,  [rsp+8*4]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*77],r8
	mov qword [rsp+8*4],r9
	
L_114:
	mov r8,  [rsp+8*72]
	cmp r8, 0
	je L_116
	mov r9,  [rsp+8*4]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*78],r8
	mov qword [rsp+8*4],r9
	
L_116:
	inc qword[rsp+8*17] 
	jmp L_18
	
L_19:
	inc qword[rsp+8*15] 
	jmp L_15
	
L_16:
	inc qword[rsp+8*13] 
	jmp L_12
	
L_13:
	inc qword[rsp+8*11] 
	jmp L_9
	
L_10:
	inc qword[rsp+8*9] 
	jmp L_6
	
L_7:
	inc qword[rsp+8*7] 
	jmp L_3
	
L_4:
	inc qword[rsp+8*5] 
	jmp L_0
	
L_1:
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*80],r10
	mov     rdi, [rsp+8*80]
	call    toString
	mov     qword[rsp+8*81], rax
	mov r9,  [rsp+8*81]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*82],r10
	mov rdi, format
	mov rsi,[rsp+8*82] 
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
	sub    rsp, 728
	mov r8,  [rsp+8*83]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   2712
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
	

