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
        mov     r8,qword [arg+8*15]
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
        mov     r8,qword [arg+8*15]
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
        mov     r8,qword [arg+8*15]
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
	sub    rsp, 1064
	call global_init
	mov r10, qword [rsp+8*1]
	mov r10 , rax
	mov qword [rsp+8*1],r10
	call    getInt
	mov     [rsp+8*2], rax
	mov r10, qword [rsp+8*3]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov r12, qword [rsp+8*4]
	mov r13,0
	mov r12,r13
	mov r14, qword [rsp+8*5]
	mov r15,0
	mov r14,r15
	mov qword [rsp+8*3],r10
	mov qword [rsp+8*2],r11
	mov qword [rsp+8*4],r12
	mov qword [rsp+8*5],r14
	
L_0:
	mov r10, qword [rsp+8*5]
	mov r11, qword [rsp+8*3]
	cmp r10,r11
	mov r12, qword [rsp+8*6]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*5],r10
	mov qword [rsp+8*3],r11
	mov qword [rsp+8*6],r12
	mov r10, qword [rsp+8*6]
	cmp r10, 0
	mov qword [rsp+8*6],r10
	je L_1
	mov r10, qword [rsp+8*7]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*7],r10
	
L_3:
	mov r10, qword [rsp+8*7]
	mov r11, qword [rsp+8*3]
	cmp r10,r11
	mov r12, qword [rsp+8*8]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*7],r10
	mov qword [rsp+8*3],r11
	mov qword [rsp+8*8],r12
	mov r10, qword [rsp+8*8]
	cmp r10, 0
	mov qword [rsp+8*8],r10
	je L_4
	mov r10, qword [rsp+8*9]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*9],r10
	
L_6:
	mov r10, qword [rsp+8*9]
	mov r11, qword [rsp+8*3]
	cmp r10,r11
	mov r12, qword [rsp+8*10]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*9],r10
	mov qword [rsp+8*3],r11
	mov qword [rsp+8*10],r12
	mov r10, qword [rsp+8*10]
	cmp r10, 0
	mov qword [rsp+8*10],r10
	je L_7
	mov r10, qword [rsp+8*11]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*11],r10
	
L_9:
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*3]
	cmp r10,r11
	mov r12, qword [rsp+8*12]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*3],r11
	mov qword [rsp+8*12],r12
	mov r10, qword [rsp+8*12]
	cmp r10, 0
	mov qword [rsp+8*12],r10
	je L_10
	mov r10, qword [rsp+8*13]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*13],r10
	
L_12:
	mov r10, qword [rsp+8*13]
	mov r11, qword [rsp+8*3]
	cmp r10,r11
	mov r12, qword [rsp+8*14]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*13],r10
	mov qword [rsp+8*3],r11
	mov qword [rsp+8*14],r12
	mov r10, qword [rsp+8*14]
	cmp r10, 0
	mov qword [rsp+8*14],r10
	je L_13
	mov r10, qword [rsp+8*15]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*15],r10
	
L_15:
	mov r10, qword [rsp+8*15]
	mov r11, qword [rsp+8*3]
	cmp r10,r11
	mov r12, qword [rsp+8*16]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*3],r11
	mov qword [rsp+8*16],r12
	mov r10, qword [rsp+8*16]
	cmp r10, 0
	mov qword [rsp+8*16],r10
	je L_16
	mov r10, qword [rsp+8*17]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*17],r10
	
L_18:
	mov r10, qword [rsp+8*17]
	mov r11, qword [rsp+8*3]
	cmp r10,r11
	mov r12, qword [rsp+8*18]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*3],r11
	mov qword [rsp+8*18],r12
	mov r10, qword [rsp+8*18]
	cmp r10, 0
	mov qword [rsp+8*18],r10
	je L_19
	mov r10, qword [rsp+8*5]
	mov r11, qword [rsp+8*7]
	cmp r10,r11
	mov r12, qword [rsp+8*19]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*5],r10
	mov qword [rsp+8*7],r11
	mov qword [rsp+8*19],r12
	mov r10, qword [rsp+8*19]
	cmp r10, 0
	mov qword [rsp+8*19],r10
	jne L_21
	mov r10, qword [rsp+8*20]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*20],r10
	jmp L_22
	
L_21:
	mov r10, qword [rsp+8*9]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*21]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*9],r10
	mov qword [rsp+8*21],r12
	mov r10, qword [rsp+8*20]
	mov r11, qword [rsp+8*21]
	mov r10,r11
	mov qword [rsp+8*20],r10
	mov qword [rsp+8*21],r11
	
L_22:
	mov r10, qword [rsp+8*20]
	cmp r10, 0
	mov qword [rsp+8*20],r10
	je L_27
	mov r10, qword [rsp+8*22]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*22],r10
	jmp L_28
	
L_27:
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*13]
	cmp r10,r11
	mov r12, qword [rsp+8*23]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*13],r11
	mov qword [rsp+8*23],r12
	mov r10, qword [rsp+8*23]
	cmp r10, 0
	mov qword [rsp+8*23],r10
	jne L_23
	mov r10, qword [rsp+8*24]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*24],r10
	jmp L_24
	
L_23:
	mov r10, qword [rsp+8*15]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*25]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*25],r12
	mov r10, qword [rsp+8*24]
	mov r11, qword [rsp+8*25]
	mov r10,r11
	mov qword [rsp+8*24],r10
	mov qword [rsp+8*25],r11
	
L_24:
	mov r10, qword [rsp+8*24]
	cmp r10, 0
	mov qword [rsp+8*24],r10
	jne L_25
	mov r10, qword [rsp+8*26]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*26],r10
	jmp L_26
	
L_25:
	mov r10, qword [rsp+8*17]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*27]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*27],r12
	mov r10, qword [rsp+8*26]
	mov r11, qword [rsp+8*27]
	mov r10,r11
	mov qword [rsp+8*26],r10
	mov qword [rsp+8*27],r11
	
L_26:
	mov r10, qword [rsp+8*22]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*22],r10
	mov qword [rsp+8*26],r11
	
L_28:
	mov r10, qword [rsp+8*22]
	cmp r10, 0
	mov qword [rsp+8*22],r10
	je L_29
	mov r10, qword [rsp+8*28]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*28],r10
	jmp L_30
	
L_29:
	mov r10, qword [rsp+8*5]
	mov r11, qword [rsp+8*17]
	cmp r10,r11
	mov r12, qword [rsp+8*29]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*5],r10
	mov qword [rsp+8*17],r11
	mov qword [rsp+8*29],r12
	mov r10, qword [rsp+8*28]
	mov r11, qword [rsp+8*29]
	mov r10,r11
	mov qword [rsp+8*28],r10
	mov qword [rsp+8*29],r11
	
L_30:
	mov r10, qword [rsp+8*28]
	cmp r10, 0
	mov qword [rsp+8*28],r10
	je L_33
	mov r10, qword [rsp+8*30]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*30],r10
	jmp L_34
	
L_33:
	mov r10, qword [rsp+8*11]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*31]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*31],r12
	mov r10, qword [rsp+8*31]
	cmp r10, 0
	mov qword [rsp+8*31],r10
	jne L_31
	mov r10, qword [rsp+8*32]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*32],r10
	jmp L_32
	
L_31:
	mov r10, qword [rsp+8*15]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*33]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*33],r12
	mov r10, qword [rsp+8*32]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*32],r10
	mov qword [rsp+8*33],r11
	
L_32:
	mov r10, qword [rsp+8*30]
	mov r11, qword [rsp+8*32]
	mov r10,r11
	mov qword [rsp+8*30],r10
	mov qword [rsp+8*32],r11
	
L_34:
	mov r10, qword [rsp+8*34]
	mov r11, qword [rsp+8*30]
	mov r10,r11
	mov r12, qword [rsp+8*5]
	mov r13, qword [rsp+8*7]
	cmp r12,r13
	mov r14, qword [rsp+8*35]
	mov r14, 0
	sete r14B
	mov qword [rsp+8*34],r10
	mov qword [rsp+8*30],r11
	mov qword [rsp+8*5],r12
	mov qword [rsp+8*7],r13
	mov qword [rsp+8*35],r14
	mov r10, qword [rsp+8*35]
	cmp r10, 0
	mov qword [rsp+8*35],r10
	jne L_35
	mov r10, qword [rsp+8*36]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*36],r10
	jmp L_36
	
L_35:
	mov r10, qword [rsp+8*9]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*37]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*9],r10
	mov qword [rsp+8*37],r12
	mov r10, qword [rsp+8*36]
	mov r11, qword [rsp+8*37]
	mov r10,r11
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*37],r11
	
L_36:
	mov r10, qword [rsp+8*36]
	cmp r10, 0
	mov qword [rsp+8*36],r10
	je L_41
	mov r10, qword [rsp+8*38]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*38],r10
	jmp L_42
	
L_41:
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*13]
	cmp r10,r11
	mov r12, qword [rsp+8*39]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*13],r11
	mov qword [rsp+8*39],r12
	mov r10, qword [rsp+8*39]
	cmp r10, 0
	mov qword [rsp+8*39],r10
	jne L_37
	mov r10, qword [rsp+8*40]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*40],r10
	jmp L_38
	
L_37:
	mov r10, qword [rsp+8*15]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*41]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*41],r12
	mov r10, qword [rsp+8*40]
	mov r11, qword [rsp+8*41]
	mov r10,r11
	mov qword [rsp+8*40],r10
	mov qword [rsp+8*41],r11
	
L_38:
	mov r10, qword [rsp+8*40]
	cmp r10, 0
	mov qword [rsp+8*40],r10
	jne L_39
	mov r10, qword [rsp+8*42]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*42],r10
	jmp L_40
	
L_39:
	mov r10, qword [rsp+8*17]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*43]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*43],r12
	mov r10, qword [rsp+8*42]
	mov r11, qword [rsp+8*43]
	mov r10,r11
	mov qword [rsp+8*42],r10
	mov qword [rsp+8*43],r11
	
L_40:
	mov r10, qword [rsp+8*38]
	mov r11, qword [rsp+8*42]
	mov r10,r11
	mov qword [rsp+8*38],r10
	mov qword [rsp+8*42],r11
	
L_42:
	mov r10, qword [rsp+8*38]
	cmp r10, 0
	mov qword [rsp+8*38],r10
	je L_43
	mov r10, qword [rsp+8*44]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*44],r10
	jmp L_44
	
L_43:
	mov r10, qword [rsp+8*5]
	mov r11, qword [rsp+8*17]
	cmp r10,r11
	mov r12, qword [rsp+8*45]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*5],r10
	mov qword [rsp+8*17],r11
	mov qword [rsp+8*45],r12
	mov r10, qword [rsp+8*44]
	mov r11, qword [rsp+8*45]
	mov r10,r11
	mov qword [rsp+8*44],r10
	mov qword [rsp+8*45],r11
	
L_44:
	mov r10, qword [rsp+8*44]
	cmp r10, 0
	mov qword [rsp+8*44],r10
	je L_47
	mov r10, qword [rsp+8*46]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*46],r10
	jmp L_48
	
L_47:
	mov r10, qword [rsp+8*11]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*47]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*47],r12
	mov r10, qword [rsp+8*47]
	cmp r10, 0
	mov qword [rsp+8*47],r10
	jne L_45
	mov r10, qword [rsp+8*48]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*48],r10
	jmp L_46
	
L_45:
	mov r10, qword [rsp+8*15]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*49]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*49],r12
	mov r10, qword [rsp+8*48]
	mov r11, qword [rsp+8*49]
	mov r10,r11
	mov qword [rsp+8*48],r10
	mov qword [rsp+8*49],r11
	
L_46:
	mov r10, qword [rsp+8*46]
	mov r11, qword [rsp+8*48]
	mov r10,r11
	mov qword [rsp+8*46],r10
	mov qword [rsp+8*48],r11
	
L_48:
	mov r10, qword [rsp+8*50]
	mov r11, qword [rsp+8*46]
	mov r10,r11
	mov r12, qword [rsp+8*5]
	mov r13, qword [rsp+8*7]
	cmp r12,r13
	mov r14, qword [rsp+8*51]
	mov r14, 0
	sete r14B
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*46],r11
	mov qword [rsp+8*5],r12
	mov qword [rsp+8*7],r13
	mov qword [rsp+8*51],r14
	mov r10, qword [rsp+8*51]
	cmp r10, 0
	mov qword [rsp+8*51],r10
	jne L_49
	mov r10, qword [rsp+8*52]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*52],r10
	jmp L_50
	
L_49:
	mov r10, qword [rsp+8*9]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*53]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*9],r10
	mov qword [rsp+8*53],r12
	mov r10, qword [rsp+8*52]
	mov r11, qword [rsp+8*53]
	mov r10,r11
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*53],r11
	
L_50:
	mov r10, qword [rsp+8*52]
	cmp r10, 0
	mov qword [rsp+8*52],r10
	je L_55
	mov r10, qword [rsp+8*54]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*54],r10
	jmp L_56
	
L_55:
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*13]
	cmp r10,r11
	mov r12, qword [rsp+8*55]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*13],r11
	mov qword [rsp+8*55],r12
	mov r10, qword [rsp+8*55]
	cmp r10, 0
	mov qword [rsp+8*55],r10
	jne L_51
	mov r10, qword [rsp+8*56]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*56],r10
	jmp L_52
	
L_51:
	mov r10, qword [rsp+8*15]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*57]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*57],r12
	mov r10, qword [rsp+8*56]
	mov r11, qword [rsp+8*57]
	mov r10,r11
	mov qword [rsp+8*56],r10
	mov qword [rsp+8*57],r11
	
L_52:
	mov r10, qword [rsp+8*56]
	cmp r10, 0
	mov qword [rsp+8*56],r10
	jne L_53
	mov r10, qword [rsp+8*58]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*58],r10
	jmp L_54
	
L_53:
	mov r10, qword [rsp+8*17]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*59]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*59],r12
	mov r10, qword [rsp+8*58]
	mov r11, qword [rsp+8*59]
	mov r10,r11
	mov qword [rsp+8*58],r10
	mov qword [rsp+8*59],r11
	
L_54:
	mov r10, qword [rsp+8*54]
	mov r11, qword [rsp+8*58]
	mov r10,r11
	mov qword [rsp+8*54],r10
	mov qword [rsp+8*58],r11
	
L_56:
	mov r10, qword [rsp+8*54]
	cmp r10, 0
	mov qword [rsp+8*54],r10
	je L_57
	mov r10, qword [rsp+8*60]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*60],r10
	jmp L_58
	
L_57:
	mov r10, qword [rsp+8*5]
	mov r11, qword [rsp+8*17]
	cmp r10,r11
	mov r12, qword [rsp+8*61]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*5],r10
	mov qword [rsp+8*17],r11
	mov qword [rsp+8*61],r12
	mov r10, qword [rsp+8*60]
	mov r11, qword [rsp+8*61]
	mov r10,r11
	mov qword [rsp+8*60],r10
	mov qword [rsp+8*61],r11
	
L_58:
	mov r10, qword [rsp+8*60]
	cmp r10, 0
	mov qword [rsp+8*60],r10
	je L_61
	mov r10, qword [rsp+8*62]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*62],r10
	jmp L_62
	
L_61:
	mov r10, qword [rsp+8*11]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*63]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*63],r12
	mov r10, qword [rsp+8*63]
	cmp r10, 0
	mov qword [rsp+8*63],r10
	jne L_59
	mov r10, qword [rsp+8*64]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*64],r10
	jmp L_60
	
L_59:
	mov r10, qword [rsp+8*15]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*65]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*65],r12
	mov r10, qword [rsp+8*64]
	mov r11, qword [rsp+8*65]
	mov r10,r11
	mov qword [rsp+8*64],r10
	mov qword [rsp+8*65],r11
	
L_60:
	mov r10, qword [rsp+8*62]
	mov r11, qword [rsp+8*64]
	mov r10,r11
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*64],r11
	
L_62:
	mov r10, qword [rsp+8*66]
	mov r11, qword [rsp+8*62]
	mov r10,r11
	mov r12, qword [rsp+8*5]
	mov r13, qword [rsp+8*7]
	cmp r12,r13
	mov r14, qword [rsp+8*67]
	mov r14, 0
	sete r14B
	mov qword [rsp+8*66],r10
	mov qword [rsp+8*62],r11
	mov qword [rsp+8*5],r12
	mov qword [rsp+8*7],r13
	mov qword [rsp+8*67],r14
	mov r10, qword [rsp+8*67]
	cmp r10, 0
	mov qword [rsp+8*67],r10
	jne L_63
	mov r10, qword [rsp+8*68]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*68],r10
	jmp L_64
	
L_63:
	mov r10, qword [rsp+8*9]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*69]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*9],r10
	mov qword [rsp+8*69],r12
	mov r10, qword [rsp+8*68]
	mov r11, qword [rsp+8*69]
	mov r10,r11
	mov qword [rsp+8*68],r10
	mov qword [rsp+8*69],r11
	
L_64:
	mov r10, qword [rsp+8*68]
	cmp r10, 0
	mov qword [rsp+8*68],r10
	je L_69
	mov r10, qword [rsp+8*70]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*70],r10
	jmp L_70
	
L_69:
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*13]
	cmp r10,r11
	mov r12, qword [rsp+8*71]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*13],r11
	mov qword [rsp+8*71],r12
	mov r10, qword [rsp+8*71]
	cmp r10, 0
	mov qword [rsp+8*71],r10
	jne L_65
	mov r10, qword [rsp+8*72]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*72],r10
	jmp L_66
	
L_65:
	mov r10, qword [rsp+8*15]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*73]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*73],r12
	mov r10, qword [rsp+8*72]
	mov r11, qword [rsp+8*73]
	mov r10,r11
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r11
	
L_66:
	mov r10, qword [rsp+8*72]
	cmp r10, 0
	mov qword [rsp+8*72],r10
	jne L_67
	mov r10, qword [rsp+8*74]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*74],r10
	jmp L_68
	
L_67:
	mov r10, qword [rsp+8*17]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*75]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*75],r12
	mov r10, qword [rsp+8*74]
	mov r11, qword [rsp+8*75]
	mov r10,r11
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*75],r11
	
L_68:
	mov r10, qword [rsp+8*70]
	mov r11, qword [rsp+8*74]
	mov r10,r11
	mov qword [rsp+8*70],r10
	mov qword [rsp+8*74],r11
	
L_70:
	mov r10, qword [rsp+8*70]
	cmp r10, 0
	mov qword [rsp+8*70],r10
	je L_71
	mov r10, qword [rsp+8*76]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*76],r10
	jmp L_72
	
L_71:
	mov r10, qword [rsp+8*5]
	mov r11, qword [rsp+8*17]
	cmp r10,r11
	mov r12, qword [rsp+8*77]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*5],r10
	mov qword [rsp+8*17],r11
	mov qword [rsp+8*77],r12
	mov r10, qword [rsp+8*76]
	mov r11, qword [rsp+8*77]
	mov r10,r11
	mov qword [rsp+8*76],r10
	mov qword [rsp+8*77],r11
	
L_72:
	mov r10, qword [rsp+8*76]
	cmp r10, 0
	mov qword [rsp+8*76],r10
	je L_75
	mov r10, qword [rsp+8*78]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*78],r10
	jmp L_76
	
L_75:
	mov r10, qword [rsp+8*11]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*79]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*79],r12
	mov r10, qword [rsp+8*79]
	cmp r10, 0
	mov qword [rsp+8*79],r10
	jne L_73
	mov r10, qword [rsp+8*80]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*80],r10
	jmp L_74
	
L_73:
	mov r10, qword [rsp+8*15]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*81]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*81],r12
	mov r10, qword [rsp+8*80]
	mov r11, qword [rsp+8*81]
	mov r10,r11
	mov qword [rsp+8*80],r10
	mov qword [rsp+8*81],r11
	
L_74:
	mov r10, qword [rsp+8*78]
	mov r11, qword [rsp+8*80]
	mov r10,r11
	mov qword [rsp+8*78],r10
	mov qword [rsp+8*80],r11
	
L_76:
	mov r10, qword [rsp+8*82]
	mov r11, qword [rsp+8*78]
	mov r10,r11
	mov r12, qword [rsp+8*5]
	mov r13, qword [rsp+8*7]
	cmp r12,r13
	mov r14, qword [rsp+8*83]
	mov r14, 0
	sete r14B
	mov qword [rsp+8*82],r10
	mov qword [rsp+8*78],r11
	mov qword [rsp+8*5],r12
	mov qword [rsp+8*7],r13
	mov qword [rsp+8*83],r14
	mov r10, qword [rsp+8*83]
	cmp r10, 0
	mov qword [rsp+8*83],r10
	jne L_77
	mov r10, qword [rsp+8*84]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*84],r10
	jmp L_78
	
L_77:
	mov r10, qword [rsp+8*9]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*85]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*9],r10
	mov qword [rsp+8*85],r12
	mov r10, qword [rsp+8*84]
	mov r11, qword [rsp+8*85]
	mov r10,r11
	mov qword [rsp+8*84],r10
	mov qword [rsp+8*85],r11
	
L_78:
	mov r10, qword [rsp+8*84]
	cmp r10, 0
	mov qword [rsp+8*84],r10
	je L_83
	mov r10, qword [rsp+8*86]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*86],r10
	jmp L_84
	
L_83:
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*13]
	cmp r10,r11
	mov r12, qword [rsp+8*87]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*13],r11
	mov qword [rsp+8*87],r12
	mov r10, qword [rsp+8*87]
	cmp r10, 0
	mov qword [rsp+8*87],r10
	jne L_79
	mov r10, qword [rsp+8*88]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*88],r10
	jmp L_80
	
L_79:
	mov r10, qword [rsp+8*15]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*89]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*89],r12
	mov r10, qword [rsp+8*88]
	mov r11, qword [rsp+8*89]
	mov r10,r11
	mov qword [rsp+8*88],r10
	mov qword [rsp+8*89],r11
	
L_80:
	mov r10, qword [rsp+8*88]
	cmp r10, 0
	mov qword [rsp+8*88],r10
	jne L_81
	mov r10, qword [rsp+8*90]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*90],r10
	jmp L_82
	
L_81:
	mov r10, qword [rsp+8*17]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*91]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*91],r12
	mov r10, qword [rsp+8*90]
	mov r11, qword [rsp+8*91]
	mov r10,r11
	mov qword [rsp+8*90],r10
	mov qword [rsp+8*91],r11
	
L_82:
	mov r10, qword [rsp+8*86]
	mov r11, qword [rsp+8*90]
	mov r10,r11
	mov qword [rsp+8*86],r10
	mov qword [rsp+8*90],r11
	
L_84:
	mov r10, qword [rsp+8*86]
	cmp r10, 0
	mov qword [rsp+8*86],r10
	je L_85
	mov r10, qword [rsp+8*92]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*92],r10
	jmp L_86
	
L_85:
	mov r10, qword [rsp+8*5]
	mov r11, qword [rsp+8*17]
	cmp r10,r11
	mov r12, qword [rsp+8*93]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*5],r10
	mov qword [rsp+8*17],r11
	mov qword [rsp+8*93],r12
	mov r10, qword [rsp+8*92]
	mov r11, qword [rsp+8*93]
	mov r10,r11
	mov qword [rsp+8*92],r10
	mov qword [rsp+8*93],r11
	
L_86:
	mov r10, qword [rsp+8*92]
	cmp r10, 0
	mov qword [rsp+8*92],r10
	je L_89
	mov r10, qword [rsp+8*94]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*94],r10
	jmp L_90
	
L_89:
	mov r10, qword [rsp+8*11]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*95]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*95],r12
	mov r10, qword [rsp+8*95]
	cmp r10, 0
	mov qword [rsp+8*95],r10
	jne L_87
	mov r10, qword [rsp+8*96]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*96],r10
	jmp L_88
	
L_87:
	mov r10, qword [rsp+8*15]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*97]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*97],r12
	mov r10, qword [rsp+8*96]
	mov r11, qword [rsp+8*97]
	mov r10,r11
	mov qword [rsp+8*96],r10
	mov qword [rsp+8*97],r11
	
L_88:
	mov r10, qword [rsp+8*94]
	mov r11, qword [rsp+8*96]
	mov r10,r11
	mov qword [rsp+8*94],r10
	mov qword [rsp+8*96],r11
	
L_90:
	mov r10, qword [rsp+8*98]
	mov r11, qword [rsp+8*94]
	mov r10,r11
	mov r12, qword [rsp+8*5]
	mov r13, qword [rsp+8*7]
	cmp r12,r13
	mov r14, qword [rsp+8*99]
	mov r14, 0
	sete r14B
	mov qword [rsp+8*98],r10
	mov qword [rsp+8*94],r11
	mov qword [rsp+8*5],r12
	mov qword [rsp+8*7],r13
	mov qword [rsp+8*99],r14
	mov r10, qword [rsp+8*99]
	cmp r10, 0
	mov qword [rsp+8*99],r10
	jne L_91
	mov r10, qword [rsp+8*100]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*100],r10
	jmp L_92
	
L_91:
	mov r10, qword [rsp+8*9]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*101]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*9],r10
	mov qword [rsp+8*101],r12
	mov r10, qword [rsp+8*100]
	mov r11, qword [rsp+8*101]
	mov r10,r11
	mov qword [rsp+8*100],r10
	mov qword [rsp+8*101],r11
	
L_92:
	mov r10, qword [rsp+8*100]
	cmp r10, 0
	mov qword [rsp+8*100],r10
	je L_97
	mov r10, qword [rsp+8*102]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*102],r10
	jmp L_98
	
L_97:
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*13]
	cmp r10,r11
	mov r12, qword [rsp+8*103]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*13],r11
	mov qword [rsp+8*103],r12
	mov r10, qword [rsp+8*103]
	cmp r10, 0
	mov qword [rsp+8*103],r10
	jne L_93
	mov r10, qword [rsp+8*104]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*104],r10
	jmp L_94
	
L_93:
	mov r10, qword [rsp+8*15]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*105]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*105],r12
	mov r10, qword [rsp+8*104]
	mov r11, qword [rsp+8*105]
	mov r10,r11
	mov qword [rsp+8*104],r10
	mov qword [rsp+8*105],r11
	
L_94:
	mov r10, qword [rsp+8*104]
	cmp r10, 0
	mov qword [rsp+8*104],r10
	jne L_95
	mov r10, qword [rsp+8*106]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*106],r10
	jmp L_96
	
L_95:
	mov r10, qword [rsp+8*17]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*107]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*107],r12
	mov r10, qword [rsp+8*106]
	mov r11, qword [rsp+8*107]
	mov r10,r11
	mov qword [rsp+8*106],r10
	mov qword [rsp+8*107],r11
	
L_96:
	mov r10, qword [rsp+8*102]
	mov r11, qword [rsp+8*106]
	mov r10,r11
	mov qword [rsp+8*102],r10
	mov qword [rsp+8*106],r11
	
L_98:
	mov r10, qword [rsp+8*102]
	cmp r10, 0
	mov qword [rsp+8*102],r10
	je L_99
	mov r10, qword [rsp+8*108]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*108],r10
	jmp L_100
	
L_99:
	mov r10, qword [rsp+8*5]
	mov r11, qword [rsp+8*17]
	cmp r10,r11
	mov r12, qword [rsp+8*109]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*5],r10
	mov qword [rsp+8*17],r11
	mov qword [rsp+8*109],r12
	mov r10, qword [rsp+8*108]
	mov r11, qword [rsp+8*109]
	mov r10,r11
	mov qword [rsp+8*108],r10
	mov qword [rsp+8*109],r11
	
L_100:
	mov r10, qword [rsp+8*108]
	cmp r10, 0
	mov qword [rsp+8*108],r10
	je L_103
	mov r10, qword [rsp+8*110]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*110],r10
	jmp L_104
	
L_103:
	mov r10, qword [rsp+8*11]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*111]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*111],r12
	mov r10, qword [rsp+8*111]
	cmp r10, 0
	mov qword [rsp+8*111],r10
	jne L_101
	mov r10, qword [rsp+8*112]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*112],r10
	jmp L_102
	
L_101:
	mov r10, qword [rsp+8*15]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*113]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*113],r12
	mov r10, qword [rsp+8*112]
	mov r11, qword [rsp+8*113]
	mov r10,r11
	mov qword [rsp+8*112],r10
	mov qword [rsp+8*113],r11
	
L_102:
	mov r10, qword [rsp+8*110]
	mov r11, qword [rsp+8*112]
	mov r10,r11
	mov qword [rsp+8*110],r10
	mov qword [rsp+8*112],r11
	
L_104:
	mov r10, qword [rsp+8*114]
	mov r11, qword [rsp+8*110]
	mov r10,r11
	mov r12, qword [rsp+8*34]
	cmp r12, 0
	mov qword [rsp+8*114],r10
	mov qword [rsp+8*110],r11
	mov qword [rsp+8*34],r12
	je L_106
	mov r10, qword [rsp+8*115]
	mov r11, qword [rsp+8*4]
	mov r10,r11
	mov r11,r11
	mov r12,1
	add r11,r12
	mov qword [rsp+8*115],r10
	mov qword [rsp+8*4],r11
	
L_106:
	mov r10, qword [rsp+8*50]
	cmp r10, 0
	mov qword [rsp+8*50],r10
	je L_108
	mov r10, qword [rsp+8*116]
	mov r11, qword [rsp+8*4]
	mov r10,r11
	mov r11,r11
	mov r12,1
	add r11,r12
	mov qword [rsp+8*116],r10
	mov qword [rsp+8*4],r11
	
L_108:
	mov r10, qword [rsp+8*66]
	cmp r10, 0
	mov qword [rsp+8*66],r10
	je L_110
	mov r10, qword [rsp+8*117]
	mov r11, qword [rsp+8*4]
	mov r10,r11
	mov r11,r11
	mov r12,1
	add r11,r12
	mov qword [rsp+8*117],r10
	mov qword [rsp+8*4],r11
	
L_110:
	mov r10, qword [rsp+8*82]
	cmp r10, 0
	mov qword [rsp+8*82],r10
	je L_112
	mov r10, qword [rsp+8*118]
	mov r11, qword [rsp+8*4]
	mov r10,r11
	mov r11,r11
	mov r12,1
	add r11,r12
	mov qword [rsp+8*118],r10
	mov qword [rsp+8*4],r11
	
L_112:
	mov r10, qword [rsp+8*98]
	cmp r10, 0
	mov qword [rsp+8*98],r10
	je L_114
	mov r10, qword [rsp+8*119]
	mov r11, qword [rsp+8*4]
	mov r10,r11
	mov r11,r11
	mov r12,1
	add r11,r12
	mov qword [rsp+8*119],r10
	mov qword [rsp+8*4],r11
	
L_114:
	mov r10, qword [rsp+8*114]
	cmp r10, 0
	mov qword [rsp+8*114],r10
	je L_116
	mov r10, qword [rsp+8*120]
	mov r11, qword [rsp+8*4]
	mov r10,r11
	mov r11,r11
	mov r12,1
	add r11,r12
	mov qword [rsp+8*120],r10
	mov qword [rsp+8*4],r11
	
L_116:
	
L_20:
	mov r10, qword [rsp+8*17]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*17],r10
	jmp L_18
	
L_19:
	
L_17:
	mov r10, qword [rsp+8*15]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*15],r10
	jmp L_15
	
L_16:
	
L_14:
	mov r10, qword [rsp+8*13]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*13],r10
	jmp L_12
	
L_13:
	
L_11:
	mov r10, qword [rsp+8*11]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*11],r10
	jmp L_9
	
L_10:
	
L_8:
	mov r10, qword [rsp+8*9]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*9],r10
	jmp L_6
	
L_7:
	
L_5:
	mov r10, qword [rsp+8*7]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*7],r10
	jmp L_3
	
L_4:
	
L_2:
	mov r10, qword [rsp+8*5]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*5],r10
	jmp L_0
	
L_1:
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*4]
	mov r10,r11
	mov r12, qword [rsp+8*122]
	mov r12,r10
	mov qword [arg+8*0],r10
	mov qword [rsp+8*4],r11
	mov qword [rsp+8*122],r12
	mov     rdi, [rsp+8*122]
	call    toString
	mov     qword[rsp+8*123], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*123]
	mov r10,r11
	mov r12, qword [rsp+8*124]
	mov r12,r10
	mov qword [arg+8*0],r10
	mov qword [rsp+8*123],r11
	mov qword [rsp+8*124],r12
	mov rdi, format
	mov rsi,[rsp+8*124] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10,0
	mov rax,r10
	leave
	ret
	mov r10,0
	mov rax,r10
	leave
	ret
	jmp QED
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1064
	mov r10, qword [rsp+8*125]
	mov rax,r10
	mov qword [rsp+8*125],r10
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   3048
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
	

