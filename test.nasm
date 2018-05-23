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
	sub    rsp, 1184
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 3168
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	call global_init
	mov r8 , rax
	mov qword [rsp+8*1],r8
	call    getInt
	mov     [rsp+8*2], rax
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov qword [rsp+8*3],r8
	call    getInt
	mov     [rsp+8*4], rax
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov qword [rsp+8*5],r8
	call    getInt
	mov     [rsp+8*6], rax
	mov r9,  [rsp+8*6]
	mov r8,r9
	mov qword [rsp+8*7],r8
	call    getInt
	mov     [rsp+8*8], rax
	mov r9,  [rsp+8*8]
	mov r8,r9
	mov qword [rsp+8*9],r8
	call    getInt
	mov     [rsp+8*10], rax
	mov r9,  [rsp+8*10]
	mov r8,r9
	mov qword [rsp+8*11],r8
	call    getInt
	mov     [rsp+8*12], rax
	mov r9,  [rsp+8*12]
	mov r8,r9
	mov r11,30
	mov r10,r11
	mov r13,0
	mov r12,r13
	mov r15,0
	mov r14,r15
	mov r11,0
	mov r9,r11
	mov r13,0
	mov r11,r13
	mov r15,  [rsp+8*3]
	mov r13,r15
	mov qword [rsp+8*13],r8
	mov qword [rsp+8*17],r9
	mov qword [rsp+8*14],r10
	mov qword [rsp+8*18],r11
	mov qword [rsp+8*15],r12
	mov qword [rsp+8*19],r13
	mov qword [rsp+8*16],r14
	
L_12:
	mov r8,  [rsp+8*19]
	mov r9,  [rsp+8*5]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*20],r10
	mov r8,  [rsp+8*20]
	cmp r8, 0
	je L_13
	mov r9,  [rsp+8*7]
	mov r8,r9
	mov qword [rsp+8*21],r8
	
L_15:
	mov r8,  [rsp+8*21]
	mov r9,  [rsp+8*9]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*22],r10
	mov r8,  [rsp+8*22]
	cmp r8, 0
	je L_16
	mov r9,  [rsp+8*11]
	mov r8,r9
	mov qword [rsp+8*23],r8
	
L_18:
	mov r8,  [rsp+8*23]
	mov r9,  [rsp+8*13]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*24],r10
	mov r8,  [rsp+8*24]
	cmp r8, 0
	je L_19
	mov r9,  [rsp+8*23]
	mov r8,r9
	mov r11,  [rsp+8*14]
	mov r10,r11
	mov r13,  [rsp+8*3]
	mov r12,r13
	mov qword [arg+8*2],r8
	mov qword rsi,r10
	mov qword rdi,r12
	call getnumber
	mov r8 , rax
	mov r9,r8
	mov r11,  [rsp+8*23]
	mov r10,r11
	mov r13,  [rsp+8*14]
	mov r12,r13
	mov r15,  [rsp+8*19]
	mov r14,r15
	mov qword [rsp+8*28],r8
	mov qword [rsp+8*29],r9
	mov qword [arg+8*2],r10
	mov qword rsi,r12
	mov qword rdi,r14
	call getnumber
	mov r8 , rax
	mov r9,r8
	mov r11,  [rsp+8*23]
	mov r10,r11
	mov r13,  [rsp+8*14]
	mov r12,r13
	mov r15,  [rsp+8*21]
	mov r14,r15
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*31],r9
	mov qword [arg+8*2],r10
	mov qword rsi,r12
	mov qword rdi,r14
	call getnumber
	mov r8 , rax
	mov r9,r8
	mov r10,  [rsp+8*19]
	mov r11,  [rsp+8*21]
	mov r12,r10
	xor r12,r11
	mov r14,  [rsp+8*23]
	mov r13,r14
	mov qword [rsp+8*32],r8
	mov r8,  [rsp+8*14]
	mov r15,r8
	mov r8,r12
	mov qword rdi,r8
	mov qword [rsp+8*33],r9
	mov qword [rsp+8*34],r12
	mov qword [arg+8*2],r13
	mov qword rsi,r15
	call getnumber
	mov r8 , rax
	mov r9,r8
	mov r11,1
	mov r10,r11
	mov r13,  [rsp+8*23]
	mov r12,r13
	mov qword [rsp+8*35],r8
	mov qword [rsp+8*36],r9
	mov qword rsi,r10
	mov qword rdi,r12
	call xorshift
	mov r8 , rax
	mov r10,1
	mov r9,r10
	mov r12,  [rsp+8*21]
	mov r11,r12
	mov qword [rsp+8*37],r8
	mov qword rsi,r9
	mov qword rdi,r11
	call xorshift
	mov r8 , rax
	mov r9,  [rsp+8*37]
	mov r10,r9
	xor r10,r8
	mov r12,1
	mov r11,r12
	mov r14,  [rsp+8*19]
	mov r13,r14
	mov qword [rsp+8*38],r8
	mov qword [rsp+8*39],r10
	mov qword rsi,r11
	mov qword rdi,r13
	call xorshift
	mov r8 , rax
	mov r9,  [rsp+8*39]
	mov r9,r9
	xor r9,r8
	mov r10,r9
	mov r11,  [rsp+8*29]
	mov r12,r11
	xor r12,r10
	mov r14,1
	mov r13,r14
	mov r15,r12
	mov qword [rsp+8*40],r8
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*41],r10
	mov qword [rsp+8*42],r12
	mov qword rsi,r13
	mov qword rdi,r15
	call xorshift
	mov r8 , rax
	mov r9,  [rsp+8*15]
	mov r10,r9
	add r10,r8
	mov r9,r10
	mov r11,  [rsp+8*31]
	mov r12,  [rsp+8*41]
	mov r13,r11
	xor r13,r12
	mov r15,1
	mov r14,r15
	mov qword [rsp+8*43],r8
	mov r8,r13
	mov qword rdi,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*44],r10
	mov qword [rsp+8*45],r13
	mov qword rsi,r14
	call xorshift
	mov r8 , rax
	mov r9,  [rsp+8*16]
	mov r10,r9
	add r10,r8
	mov r9,r10
	mov r11,  [rsp+8*33]
	mov r12,  [rsp+8*41]
	mov r13,r11
	xor r13,r12
	mov r15,1
	mov r14,r15
	mov qword [rsp+8*46],r8
	mov r8,r13
	mov qword rdi,r8
	mov qword [rsp+8*16],r9
	mov qword [rsp+8*47],r10
	mov qword [rsp+8*48],r13
	mov qword rsi,r14
	call xorshift
	mov r8 , rax
	mov r9,  [rsp+8*17]
	mov r10,r9
	add r10,r8
	mov r9,r10
	mov r11,  [rsp+8*36]
	mov r12,  [rsp+8*41]
	mov r13,r11
	xor r13,r12
	mov r15,1
	mov r14,r15
	mov qword [rsp+8*49],r8
	mov r8,r13
	mov qword rdi,r8
	mov qword [rsp+8*17],r9
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*51],r13
	mov qword rsi,r14
	call xorshift
	mov r8 , rax
	mov r9,  [rsp+8*18]
	mov r10,r9
	add r10,r8
	mov r9,r10
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*18],r9
	mov qword [rsp+8*53],r10
	
L_20:
	mov r9,  [rsp+8*23]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*54],r8
	mov qword [rsp+8*23],r9
	jmp L_18
	
L_19:
	
L_17:
	mov r9,  [rsp+8*21]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*55],r8
	mov qword [rsp+8*21],r9
	jmp L_15
	
L_16:
	
L_14:
	mov r9,  [rsp+8*19]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*19],r9
	jmp L_12
	
L_13:
	mov r9,  [rsp+8*15]
	mov r8,r9
	mov qword rdi,r8
	call toStringHex
	mov r8 , rax
	mov qword [rsp+8*57],r8
	mov     rsi, t242
	mov     rdi, [rsp+8*57]
	call    concat
	mov [rsp+8*58], rax
	mov r9,  [rsp+8*58]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*59],r10
	mov rdi, format
	mov rsi,[rsp+8*59] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r9,  [rsp+8*16]
	mov r8,r9
	mov qword rdi,r8
	call toStringHex
	mov r8 , rax
	mov qword [rsp+8*60],r8
	mov     rsi, t249
	mov     rdi, [rsp+8*60]
	call    concat
	mov [rsp+8*61], rax
	mov r9,  [rsp+8*61]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*62],r10
	mov rdi, format
	mov rsi,[rsp+8*62] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov qword rdi,r8
	call toStringHex
	mov r8 , rax
	mov qword [rsp+8*63],r8
	mov     rsi, t256
	mov     rdi, [rsp+8*63]
	call    concat
	mov [rsp+8*64], rax
	mov r9,  [rsp+8*64]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*65],r10
	mov rdi, format
	mov rsi,[rsp+8*65] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r9,  [rsp+8*18]
	mov r8,r9
	mov qword rdi,r8
	call toStringHex
	mov r8 , rax
	mov qword [rsp+8*66],r8
	mov     rsi, t263
	mov     rdi, [rsp+8*66]
	call    concat
	mov [rsp+8*67], rax
	mov r9,  [rsp+8*67]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*68],r10
	mov rdi, format
	mov rsi,[rsp+8*68] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r9,t268
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*69],r10
	mov rdi,[rsp+8*69] 
	add rdi, 1 
	call puts
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	jmp QED
	
shift_l:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1184
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov r12,r8
	mov rcx,r10
	shl r12,cl
	mov r13,65535
	mov r11,r13
	mov r14,65535
	mov r9,r14
	mov r15,r9
	mov qword rdi,r9
	mov r9,r11
	mov qword rsi,r11
	mov r11,16
	mov qword [rsp+8*72],r12
	mov r12,r15
	mov rcx,r11
	shl r12,cl
	or r12,r9
	mov qword [rsp+8*75],r12
	mov qword [rsp+8*74],r9
	mov r9,  [rsp+8*75]
	mov r12,r9
	mov qword [rsp+8*70],r8
	mov qword [rsp+8*71],r10
	mov qword [rsp+8*76],r12
	mov qword [rsp+8*73],r15
	jmp L_43
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_43
	
L_43:
	mov r9,  [rsp+8*76]
	mov r8,r9
	mov r10,  [rsp+8*72]
	mov r10,r10
	and r10,r8
	mov rax,r10
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
hilo:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1184
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov r12,16
	mov r13,r8
	mov rcx,r12
	shl r13,cl
	or r13,r10
	mov rax,r13
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
int2chr:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1184
	mov r9,  rdi
	mov r8,r9
	mov r10,32
	cmp r8,r10
	mov r11, 0
	setge r11B
	mov qword [rsp+8*78],r8
	mov qword [rsp+8*79],r11
	mov r8,  [rsp+8*79]
	cmp r8, 0
	jne L_3
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*80],r8
	jmp L_4
	
L_3:
	mov r8,  [rsp+8*78]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*81],r10
	mov r9,  [rsp+8*81]
	mov r8,r9
	mov qword [rsp+8*80],r8
	
L_4:
	mov r8,  [rsp+8*80]
	cmp r8, 0
	je L_6
	mov r9,  [gbl+8*82]
	mov r8,r9
	mov r10,  [rsp+8*78]
	mov r11,32
	mov r12,r10
	sub r12,r11
	mov r13,32
	mov r14,r10
	sub r14,r13
	mov r15,r14
	mov r9,r12
	mov qword rdi,r9
	mov r9,r8
	mov qword [rsp+8*83],r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*84],r12
	mov qword [rsp+8*85],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*87], rax
	mov r8,  [rsp+8*87]
	mov rax,r8
	leave
	ret
	
L_6:
	mov r8,t127
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
getnumber:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1184
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov r13,  [arg+8*2]
	mov r12,r13
	mov r14,31
	mov r15,r12
	and r15,r14
	mov qword [rsp+8*90],r12
	mov r12,r15
	mov r11,r10
	mov r9,r8
	mov qword [rsp+8*88],r8
	mov r8,r9
	mov qword [rsp+8*89],r10
	mov r10,r11
	mov r13,1
	mov r14,r8
	add r14,r13
	mov r15,r14
	mov qword rdi,r9
	mov qword rsi,r11
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*93],r8
	mov qword [rsp+8*97],r9
	mov qword [rsp+8*94],r10
	mov qword [rsp+8*92],r12
	mov qword [rsp+8*95],r14
	mov qword [rsp+8*96],r15
	
L_114:
	mov r8,  [rsp+8*94]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*97]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*98],r10
	mov qword [rsp+8*99],r12
	mov r8,  [rsp+8*99]
	cmp r8, 0
	je L_115
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*96]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	mov r14,r12
	mov rcx,r13
	shl r14,cl
	mov r15,65535
	mov r8,r15
	mov qword rsi,r8
	mov r8,65535
	mov r10,r8
	mov qword rdi,r10
	mov r11,  rdi
	mov r10,r11
	mov qword [rsp+8*72],r14
	mov r14,  rsi
	mov r11,r14
	mov r14,16
	mov qword [rsp+8*74],r11
	mov r11,r10
	mov rcx,r14
	shl r11,cl
	mov qword [rsp+8*75],r11
	mov r11,  [rsp+8*74]
	mov qword [rsp+8*73],r10
	mov r10,  [rsp+8*75]
	or r10,r11
	mov qword [rsp+8*75],r10
	mov r11,  [rsp+8*75]
	mov r10,r11
	mov qword [rsp+8*76],r10
	mov qword [rsp+8*70],r12
	mov qword [rsp+8*71],r13
	jmp L_117
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_117
	
L_117:
	mov r9,  [rsp+8*76]
	mov r8,r9
	mov r10,  [rsp+8*72]
	mov r10,r10
	and r10,r8
	mov r11,r10
	mov qword [rsp+8*77],r8
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*100],r11
	jmp L_119
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*100],r8
	jmp L_119
	
L_119:
	mov r9,  [rsp+8*100]
	mov r8,r9
	mov r10,  [rsp+8*96]
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov r13,17
	mov r12,r13
	mov r14,r10
	mov r15,r14
	mov qword rsi,r12
	mov qword rdi,r14
	mov r14,  rsi
	mov r12,r14
	mov qword [rsp+8*96],r10
	mov r10,65535
	mov r14,r10
	mov qword rsi,r14
	mov r9,32767
	mov r14,r9
	mov qword rdi,r14
	mov qword [rsp+8*104],r12
	mov r12,  rdi
	mov r14,r12
	mov qword [rsp+8*73],r14
	mov r14,  rsi
	mov r12,r14
	mov r14,  [rsp+8*73]
	mov qword [rsp+8*74],r12
	mov r12,16
	mov qword [rsp+8*103],r15
	mov r15,r14
	mov rcx,r12
	shl r15,cl
	mov qword [rsp+8*75],r15
	mov r15,  [rsp+8*74]
	mov r12,  [rsp+8*75]
	or r12,r15
	mov qword [rsp+8*75],r12
	mov r15,  [rsp+8*75]
	mov r12,r15
	mov qword [rsp+8*101],r8
	mov qword [rsp+8*102],r11
	mov qword [rsp+8*76],r12
	jmp L_121
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_121
	
L_121:
	mov r9,  [rsp+8*76]
	mov r8,r9
	mov r10,r8
	mov r11,  [rsp+8*104]
	mov r12,r10
	mov rcx,r11
	shr r12,cl
	mov r13,1
	mov rcx,r13
	shl r12,cl
	mov r14,1
	mov r12,r12
	add r12,r14
	mov r10,r12
	mov r15,  [rsp+8*103]
	mov r9,r15
	mov rcx,r11
	shr r9,cl
	and r9,r10
	mov r10,r9
	mov qword [rsp+8*106],r10
	mov qword [rsp+8*108],r9
	mov r9,65535
	mov r10,r9
	mov qword rsi,r10
	mov r9,65535
	mov r10,r9
	mov qword rdi,r10
	mov r9,  rdi
	mov r10,r9
	mov qword [rsp+8*73],r10
	mov r10,  rsi
	mov r9,r10
	mov r10,  [rsp+8*73]
	mov qword [rsp+8*74],r9
	mov r9,16
	mov r11,r10
	mov rcx,r9
	shl r11,cl
	mov qword [rsp+8*75],r11
	mov r11,  [rsp+8*74]
	mov r9,  [rsp+8*75]
	or r9,r11
	mov qword [rsp+8*75],r9
	mov r11,  [rsp+8*75]
	mov r9,r11
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*76],r9
	mov qword [rsp+8*107],r12
	jmp L_123
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_123
	
L_123:
	mov r9,  [rsp+8*76]
	mov r8,r9
	mov r10,  [rsp+8*106]
	mov r11,r10
	and r11,r8
	mov r12,r11
	mov qword [rsp+8*109],r8
	mov qword [rsp+8*110],r11
	mov qword [rsp+8*111],r12
	jmp L_125
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*111],r8
	jmp L_125
	
L_125:
	mov r9,  [rsp+8*111]
	mov r8,r9
	mov r10,  [rsp+8*96]
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov r13,5
	mov r12,r13
	mov r14,r10
	mov r15,r14
	mov qword rsi,r12
	mov qword rdi,r14
	mov r14,  rsi
	mov r12,r14
	mov r14,r15
	mov rcx,r12
	shl r14,cl
	mov qword [rsp+8*96],r10
	mov qword [rsp+8*72],r14
	mov r14,65535
	mov r10,r14
	mov qword rsi,r10
	mov r14,65535
	mov r10,r14
	mov qword rdi,r10
	mov r14,  rdi
	mov r10,r14
	mov qword [rsp+8*73],r10
	mov r10,  rsi
	mov r14,r10
	mov r10,  [rsp+8*73]
	mov qword [rsp+8*74],r14
	mov r14,16
	mov qword [rsp+8*71],r12
	mov r12,r10
	mov rcx,r14
	shl r12,cl
	mov qword [rsp+8*75],r12
	mov r12,  [rsp+8*74]
	mov r10,  [rsp+8*75]
	or r10,r12
	mov qword [rsp+8*75],r10
	mov r12,  [rsp+8*75]
	mov r10,r12
	mov qword [rsp+8*112],r8
	mov qword [rsp+8*76],r10
	mov qword [rsp+8*113],r11
	mov qword [rsp+8*70],r15
	jmp L_127
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_127
	
L_127:
	mov r9,  [rsp+8*76]
	mov r8,r9
	mov r10,  [rsp+8*72]
	mov r10,r10
	and r10,r8
	mov r11,r10
	mov qword [rsp+8*77],r8
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*100],r11
	jmp L_129
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*100],r8
	jmp L_129
	
L_129:
	mov r9,  [rsp+8*100]
	mov r8,r9
	mov r10,  [rsp+8*96]
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov qword [rsp+8*114],r8
	mov qword [rsp+8*96],r10
	mov qword [rsp+8*115],r11
	
L_130:
	mov r9,  [rsp+8*97]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*116],r8
	mov qword [rsp+8*97],r9
	jmp L_114
	
L_115:
	mov r8,  [rsp+8*96]
	mov r9,123456789
	mov r10,r8
	xor r10,r9
	mov r11,r10
	mov qword [rsp+8*117],r10
	mov qword [rsp+8*118],r11
	jmp L_132
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*118],r8
	jmp L_132
	
L_132:
	mov r9,  [rsp+8*118]
	mov r8,r9
	mov r10,r8
	mov r12,  [rsp+8*92]
	mov r11,r12
	mov r13,r10
	mov r14,r13
	mov r15,r11
	mov qword [rsp+8*119],r8
	mov r8,r14
	mov rcx,r15
	shl r8,cl
	mov r9,65535
	mov r11,r9
	mov qword rsi,r11
	mov r11,65535
	mov r13,r11
	mov qword rdi,r13
	mov qword [rsp+8*72],r8
	mov r8,  rdi
	mov r13,r8
	mov qword [rsp+8*73],r13
	mov r13,  rsi
	mov r8,r13
	mov r13,  [rsp+8*73]
	mov qword [rsp+8*74],r8
	mov r8,16
	mov r11,r13
	mov rcx,r8
	shl r11,cl
	mov qword [rsp+8*75],r11
	mov r11,  [rsp+8*74]
	mov r8,  [rsp+8*75]
	or r8,r11
	mov qword [rsp+8*75],r8
	mov r11,  [rsp+8*75]
	mov r8,r11
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*120],r10
	mov qword [rsp+8*70],r14
	mov qword [rsp+8*71],r15
	jmp L_78
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_78
	
L_78:
	mov r9,  [rsp+8*76]
	mov r8,r9
	mov r10,  [rsp+8*72]
	mov r10,r10
	and r10,r8
	mov r11,r10
	mov qword [rsp+8*77],r8
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*100],r11
	jmp L_80
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*100],r8
	jmp L_80
	
L_80:
	mov r9,  [rsp+8*100]
	mov r8,r9
	mov r10,32
	mov r11,  [rsp+8*92]
	mov r12,r10
	sub r12,r11
	mov r13,r12
	mov r15,  [rsp+8*120]
	mov r14,r15
	mov r10,r14
	mov r11,r13
	mov r12,65535
	mov r13,r12
	mov r15,32767
	mov r14,r15
	mov qword rsi,r13
	mov r13,r14
	mov qword rdi,r14
	mov r9,  rsi
	mov r14,r9
	mov r9,16
	mov qword [rsp+8*74],r14
	mov r14,r13
	mov rcx,r9
	shl r14,cl
	mov qword [rsp+8*75],r14
	mov r14,  [rsp+8*74]
	mov r9,  [rsp+8*75]
	or r9,r14
	mov qword [rsp+8*75],r9
	mov r14,  [rsp+8*75]
	mov r9,r14
	mov qword [rsp+8*121],r8
	mov qword [rsp+8*76],r9
	mov qword [rsp+8*103],r10
	mov qword [rsp+8*104],r11
	mov qword [rsp+8*73],r13
	jmp L_82
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_82
	
L_82:
	mov r9,  [rsp+8*76]
	mov r8,r9
	mov r10,r8
	mov r11,  [rsp+8*104]
	mov r12,r10
	mov rcx,r11
	shr r12,cl
	mov r13,1
	mov rcx,r13
	shl r12,cl
	mov r14,1
	mov r12,r12
	add r12,r14
	mov r10,r12
	mov r15,  [rsp+8*103]
	mov r9,r15
	mov rcx,r11
	shr r9,cl
	and r9,r10
	mov r10,r9
	mov qword [rsp+8*106],r10
	mov qword [rsp+8*108],r9
	mov r9,65535
	mov r10,r9
	mov qword rsi,r10
	mov r9,65535
	mov r10,r9
	mov qword rdi,r10
	mov r9,  rdi
	mov r10,r9
	mov qword [rsp+8*73],r10
	mov r10,  rsi
	mov r9,r10
	mov r10,  [rsp+8*73]
	mov qword [rsp+8*74],r9
	mov r9,16
	mov r11,r10
	mov rcx,r9
	shl r11,cl
	mov qword [rsp+8*75],r11
	mov r11,  [rsp+8*74]
	mov r9,  [rsp+8*75]
	or r9,r11
	mov qword [rsp+8*75],r9
	mov r11,  [rsp+8*75]
	mov r9,r11
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*76],r9
	mov qword [rsp+8*107],r12
	jmp L_84
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_84
	
L_84:
	mov r9,  [rsp+8*76]
	mov r8,r9
	mov r10,  [rsp+8*106]
	mov r11,r10
	and r11,r8
	mov r12,r11
	mov qword [rsp+8*109],r8
	mov qword [rsp+8*110],r11
	mov qword [rsp+8*111],r12
	jmp L_86
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*111],r8
	jmp L_86
	
L_86:
	mov r9,  [rsp+8*111]
	mov r8,r9
	mov r10,  [rsp+8*121]
	mov r11,r10
	or r11,r8
	mov rax,r11
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
shift_r:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1184
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov r12,65535
	mov r11,r12
	mov r13,32767
	mov r9,r13
	mov r14,r9
	mov r15,r11
	mov qword rdi,r9
	mov r9,16
	mov qword rsi,r11
	mov r11,r14
	mov rcx,r9
	shl r11,cl
	or r11,r15
	mov qword [rsp+8*75],r11
	mov qword [rsp+8*74],r15
	mov r15,  [rsp+8*75]
	mov r11,r15
	mov qword [rsp+8*103],r8
	mov qword [rsp+8*104],r10
	mov qword [rsp+8*76],r11
	mov qword [rsp+8*73],r14
	jmp L_29
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_29
	
L_29:
	mov r9,  [rsp+8*76]
	mov r8,r9
	mov r10,r8
	mov r11,  [rsp+8*104]
	mov r12,r10
	mov rcx,r11
	shr r12,cl
	mov r13,1
	mov rcx,r13
	shl r12,cl
	mov r14,1
	mov r12,r12
	add r12,r14
	mov r10,r12
	mov r15,  [rsp+8*103]
	mov r9,r15
	mov rcx,r11
	shr r9,cl
	and r9,r10
	mov r10,r9
	mov qword [rsp+8*106],r10
	mov qword [rsp+8*108],r9
	mov r9,65535
	mov r10,r9
	mov qword rsi,r10
	mov r9,65535
	mov r10,r9
	mov qword rdi,r10
	mov r9,  rdi
	mov r10,r9
	mov qword [rsp+8*73],r10
	mov r10,  rsi
	mov r9,r10
	mov r10,  [rsp+8*73]
	mov qword [rsp+8*74],r9
	mov r9,16
	mov r11,r10
	mov rcx,r9
	shl r11,cl
	mov qword [rsp+8*75],r11
	mov r11,  [rsp+8*74]
	mov r9,  [rsp+8*75]
	or r9,r11
	mov qword [rsp+8*75],r9
	mov r11,  [rsp+8*75]
	mov r9,r11
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*76],r9
	mov qword [rsp+8*107],r12
	jmp L_31
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_31
	
L_31:
	mov r9,  [rsp+8*76]
	mov r8,r9
	mov r10,  [rsp+8*106]
	mov r11,r10
	and r11,r8
	mov rax,r11
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
xorshift:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1184
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov r12,1
	mov r13,r8
	add r13,r12
	mov r14,r13
	mov qword [rsp+8*93],r8
	mov r8,0
	mov r15,r8
	mov qword [rsp+8*94],r10
	mov qword rsi,r11
	mov qword [rsp+8*95],r13
	mov qword [rsp+8*96],r14
	mov qword [rsp+8*97],r15
	
L_0:
	mov r8,  [rsp+8*94]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*97]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*98],r10
	mov qword [rsp+8*99],r12
	mov r8,  [rsp+8*99]
	cmp r8, 0
	je L_1
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*96]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	mov r14,r12
	mov rcx,r13
	shl r14,cl
	mov r15,65535
	mov r8,r15
	mov r9,65535
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword rdi,r10
	mov r11,  rsi
	mov r10,r11
	mov r11,16
	mov qword [rsp+8*72],r14
	mov r14,r8
	mov rcx,r11
	shl r14,cl
	or r14,r10
	mov qword [rsp+8*75],r14
	mov qword [rsp+8*74],r10
	mov r10,  [rsp+8*75]
	mov r14,r10
	mov qword [rsp+8*73],r8
	mov qword [rsp+8*70],r12
	mov qword [rsp+8*71],r13
	mov qword [rsp+8*76],r14
	jmp L_88
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_88
	
L_88:
	mov r9,  [rsp+8*76]
	mov r8,r9
	mov r10,  [rsp+8*72]
	mov r10,r10
	and r10,r8
	mov r11,r10
	mov qword [rsp+8*77],r8
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*100],r11
	jmp L_90
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*100],r8
	jmp L_90
	
L_90:
	mov r9,  [rsp+8*100]
	mov r8,r9
	mov r10,  [rsp+8*96]
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov r13,17
	mov r12,r13
	mov r14,r10
	mov r15,r14
	mov qword [rsp+8*101],r8
	mov r8,r12
	mov r11,65535
	mov r12,r11
	mov r11,32767
	mov r14,r11
	mov r11,r14
	mov r13,r12
	mov qword rsi,r12
	mov r12,16
	mov qword rdi,r14
	mov r14,r11
	mov rcx,r12
	shl r14,cl
	or r14,r13
	mov qword [rsp+8*96],r10
	mov r10,r14
	mov qword [rsp+8*104],r8
	mov qword [rsp+8*76],r10
	mov qword [rsp+8*73],r11
	mov qword [rsp+8*74],r13
	mov qword [rsp+8*75],r14
	mov qword [rsp+8*103],r15
	jmp L_51
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_51
	
L_51:
	mov r9,  [rsp+8*76]
	mov r8,r9
	mov r10,r8
	mov r11,  [rsp+8*104]
	mov r12,r10
	mov rcx,r11
	shr r12,cl
	mov r13,1
	mov rcx,r13
	shl r12,cl
	mov r14,1
	mov r12,r12
	add r12,r14
	mov r10,r12
	mov r15,  [rsp+8*103]
	mov qword [rsp+8*105],r8
	mov r8,r15
	mov rcx,r11
	shr r8,cl
	and r8,r10
	mov r10,r8
	mov r11,65535
	mov r8,r11
	mov r12,65535
	mov r11,r12
	mov r12,r11
	mov r13,r8
	mov r14,16
	mov r15,r12
	mov rcx,r14
	shl r15,cl
	or r15,r13
	mov r9,r15
	mov qword rsi,r8
	mov qword [rsp+8*76],r9
	mov qword [rsp+8*106],r10
	mov qword rdi,r11
	mov qword [rsp+8*73],r12
	mov qword [rsp+8*74],r13
	mov qword [rsp+8*75],r15
	jmp L_53
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_53
	
L_53:
	mov r9,  [rsp+8*76]
	mov r8,r9
	mov r10,  [rsp+8*106]
	mov r11,r10
	and r11,r8
	mov r12,r11
	mov qword [rsp+8*109],r8
	mov qword [rsp+8*110],r11
	mov qword [rsp+8*111],r12
	jmp L_55
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*111],r8
	jmp L_55
	
L_55:
	mov r9,  [rsp+8*111]
	mov r8,r9
	mov r10,  [rsp+8*96]
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov r13,5
	mov r12,r13
	mov r14,r10
	mov r15,r14
	mov qword [rsp+8*112],r8
	mov r8,r12
	mov r9,r15
	mov rcx,r8
	shl r9,cl
	mov qword [rsp+8*71],r8
	mov r8,65535
	mov r12,r8
	mov r8,65535
	mov r14,r8
	mov r8,r14
	mov r11,r12
	mov r13,16
	mov qword [rsp+8*70],r15
	mov r15,r8
	mov rcx,r13
	shl r15,cl
	or r15,r11
	mov qword [rsp+8*73],r8
	mov r8,r15
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*72],r9
	mov qword [rsp+8*96],r10
	mov qword [rsp+8*74],r11
	mov qword rsi,r12
	mov qword rdi,r14
	mov qword [rsp+8*75],r15
	jmp L_92
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*76],r8
	jmp L_92
	
L_92:
	mov r9,  [rsp+8*76]
	mov r8,r9
	mov r10,  [rsp+8*72]
	mov r10,r10
	and r10,r8
	mov r11,r10
	mov qword [rsp+8*77],r8
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*100],r11
	jmp L_94
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*100],r8
	jmp L_94
	
L_94:
	mov r9,  [rsp+8*100]
	mov r8,r9
	mov r10,  [rsp+8*96]
	mov r11,r10
	xor r11,r8
	mov r10,r11
	mov qword [rsp+8*114],r8
	mov qword [rsp+8*96],r10
	mov qword [rsp+8*115],r11
	
L_2:
	mov r9,  [rsp+8*97]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*116],r8
	mov qword [rsp+8*97],r9
	jmp L_0
	
L_1:
	mov r8,  [rsp+8*96]
	mov r9,123456789
	mov r10,r8
	xor r10,r9
	mov rax,r10
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
toStringHex:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1184
	mov r9,  rdi
	mov r8,r9
	mov r11,t129
	mov r10,r11
	mov r13,28
	mov r12,r13
	mov qword [rsp+8*125],r8
	mov qword [rsp+8*126],r10
	mov qword [rsp+8*127],r12
	
L_7:
	mov r8,  [rsp+8*127]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*128],r10
	mov r8,  [rsp+8*128]
	cmp r8, 0
	je L_8
	mov r8,  [rsp+8*125]
	mov r9,  [rsp+8*127]
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	mov r11,15
	mov r10,r10
	and r10,r11
	mov r12,r10
	mov r13,10
	cmp r12,r13
	mov r14, 0
	setl r14B
	mov qword [rsp+8*129],r10
	mov qword [rsp+8*130],r12
	mov qword [rsp+8*131],r14
	mov r8,  [rsp+8*131]
	cmp r8, 0
	je L_10
	mov r8,48
	mov r9,  [rsp+8*130]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r12,r11
	mov r13,32
	cmp r12,r13
	mov r14, 0
	setge r14B
	mov qword [rsp+8*132],r10
	mov qword rdi,r11
	mov qword [rsp+8*78],r12
	mov qword [rsp+8*79],r14
	mov r8,  [rsp+8*79]
	cmp r8, 0
	jne L_32
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*80],r8
	jmp L_33
	
L_32:
	mov r8,  [rsp+8*78]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*81],r10
	mov r9,  [rsp+8*81]
	mov r8,r9
	mov qword [rsp+8*80],r8
	
L_33:
	mov r8,  [rsp+8*80]
	cmp r8, 0
	je L_34
	mov r9,  [gbl+8*82]
	mov r8,r9
	mov r10,  [rsp+8*78]
	mov r11,32
	mov r12,r10
	sub r12,r11
	mov r13,32
	mov r14,r10
	sub r14,r13
	mov r15,r14
	mov r9,r12
	mov qword rdi,r9
	mov r9,r8
	mov qword [rsp+8*83],r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*84],r12
	mov qword [rsp+8*85],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*87], rax
	mov r9,  [rsp+8*87]
	mov r8,r9
	mov qword [rsp+8*133],r8
	jmp L_36
	
L_34:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*133],r8
	jmp L_36
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*133],r8
	jmp L_36
	
L_36:
	mov r9,  [rsp+8*133]
	mov r8,r9
	mov qword [rsp+8*134],r8
	mov     rsi, [rsp+8*134]
	mov     rdi, [rsp+8*126]
	call    concat
	mov [rsp+8*135], rax
	mov r9,  [rsp+8*135]
	mov r8,r9
	mov qword [rsp+8*126],r8
	jmp L_11
	
L_10:
	mov r8,65
	mov r9,  [rsp+8*130]
	mov r10,r8
	add r10,r9
	mov r11,10
	mov r10,r10
	sub r10,r11
	mov r12,r10
	mov r13,r12
	mov r14,32
	cmp r13,r14
	mov r15, 0
	setge r15B
	mov qword [rsp+8*136],r10
	mov qword rdi,r12
	mov qword [rsp+8*78],r13
	mov qword [rsp+8*79],r15
	mov r8,  [rsp+8*79]
	cmp r8, 0
	jne L_37
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*80],r8
	jmp L_38
	
L_37:
	mov r8,  [rsp+8*78]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*81],r10
	mov r9,  [rsp+8*81]
	mov r8,r9
	mov qword [rsp+8*80],r8
	
L_38:
	mov r8,  [rsp+8*80]
	cmp r8, 0
	je L_39
	mov r9,  [gbl+8*82]
	mov r8,r9
	mov r10,  [rsp+8*78]
	mov r11,32
	mov r12,r10
	sub r12,r11
	mov r13,32
	mov r14,r10
	sub r14,r13
	mov r15,r14
	mov r10,r12
	mov r11,r8
	mov qword [rsp+8*83],r8
	mov qword rdi,r10
	mov qword [arg+8*63],r11
	mov qword [rsp+8*84],r12
	mov qword [rsp+8*85],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*87], rax
	mov r9,  [rsp+8*87]
	mov r8,r9
	mov qword [rsp+8*133],r8
	jmp L_41
	
L_39:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*133],r8
	jmp L_41
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*133],r8
	jmp L_41
	
L_41:
	mov r9,  [rsp+8*133]
	mov r8,r9
	mov qword [rsp+8*137],r8
	mov     rsi, [rsp+8*137]
	mov     rdi, [rsp+8*126]
	call    concat
	mov [rsp+8*138], rax
	mov r9,  [rsp+8*138]
	mov r8,r9
	mov qword [rsp+8*126],r8
	
L_11:
	
L_9:
	mov r8,  [rsp+8*127]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*127],r8
	mov qword [rsp+8*139],r10
	jmp L_7
	
L_8:
	mov r8,  [rsp+8*126]
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1184
	mov r9,t110
	mov r8,r9
	mov qword [gbl+8*82],r8
	mov r8,  [rsp+8*140]
	mov rax,r8
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   3168
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
	
t129:
	 db 0,"" ,0

t268:
	 db 0,"" ,0

t249:
	 db 1," " ,0

t127:
	 db 0,"" ,0

t110:
	 db 95," !",34,"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[",92,"]^_`abcdefghijklmnopqrstuvwxyz{|}~" ,0

t242:
	 db 1," " ,0

t256:
	 db 1," " ,0

t263:
	 db 1," " ,0


