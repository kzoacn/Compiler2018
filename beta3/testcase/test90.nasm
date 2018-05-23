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


gcd:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1336
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov r13,  [arg+8*2]
	mov r12,r13
	mov r15,  [arg+8*3]
	mov r14,r15
	mov qword [rsp+8*2],r8
	mov r9,  [arg+8*4]
	mov r8,r9
	mov qword [rsp+8*4],r10
	mov r11,  [arg+8*5]
	mov r10,r11
	mov qword [rsp+8*6],r12
	mov r13,  [arg+8*6]
	mov r12,r13
	mov qword [rsp+8*8],r14
	mov r15,  [arg+8*7]
	mov r14,r15
	mov qword [rsp+8*10],r8
	mov r9,  [arg+8*8]
	mov r8,r9
	mov qword [rsp+8*12],r10
	mov r11,  [arg+8*9]
	mov r10,r11
	mov qword [rsp+8*14],r12
	mov r13,  [arg+8*10]
	mov r12,r13
	mov qword [rsp+8*16],r14
	mov r15,  [arg+8*11]
	mov r14,r15
	mov qword [rsp+8*18],r8
	mov r9,  [arg+8*12]
	mov r8,r9
	mov qword [rsp+8*20],r10
	mov r11,  [arg+8*13]
	mov r10,r11
	mov qword [rsp+8*22],r12
	mov r13,  [arg+8*14]
	mov r12,r13
	mov qword [rsp+8*24],r14
	mov r15,  [arg+8*15]
	mov r14,r15
	mov qword [rsp+8*26],r8
	mov r9,  [arg+8*16]
	mov r8,r9
	mov qword [rsp+8*28],r10
	mov r11,  [arg+8*17]
	mov r10,r11
	mov qword [rsp+8*30],r12
	mov r13,  [arg+8*18]
	mov r12,r13
	mov qword [rsp+8*32],r14
	mov r15,  [arg+8*19]
	mov r14,r15
	mov qword [rsp+8*34],r8
	mov r9,  [arg+8*20]
	mov r8,r9
	mov qword [rsp+8*36],r10
	mov r11,  [arg+8*21]
	mov r10,r11
	mov qword [rsp+8*38],r12
	mov r13,  [arg+8*22]
	mov r12,r13
	mov qword [rsp+8*40],r14
	mov r15,  [arg+8*23]
	mov r14,r15
	mov qword [rsp+8*42],r8
	mov r9,  [arg+8*24]
	mov r8,r9
	mov qword [rsp+8*44],r10
	mov r11,  [arg+8*25]
	mov r10,r11
	mov qword [rsp+8*46],r12
	mov r13,  [arg+8*26]
	mov r12,r13
	mov qword [rsp+8*48],r14
	mov r15,  [arg+8*27]
	mov r14,r15
	mov qword [rsp+8*50],r8
	mov r9,  [arg+8*28]
	mov r8,r9
	mov qword [rsp+8*52],r10
	mov r11,  [arg+8*29]
	mov r10,r11
	mov qword [rsp+8*54],r12
	mov r13,  [arg+8*30]
	mov r12,r13
	mov qword [rsp+8*56],r14
	mov r15,  [arg+8*31]
	mov r14,r15
	mov qword [rsp+8*58],r8
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*65],r8
	mov qword [rsp+8*60],r10
	mov qword [rsp+8*62],r12
	mov qword [rsp+8*64],r14
	
L_1672:
	mov r8,  [rsp+8*65]
	mov r9,10
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*66],r10
	mov r8,  [rsp+8*66]
	cmp r8, 0
	je L_1673
	mov r8,  [rsp+8*6]
	mov r9,  [rsp+8*8]
	mov r10,r8
	add r10,r9
	mov r11,  [rsp+8*10]
	mov r10,r10
	add r10,r11
	mov r12,  [rsp+8*12]
	mov r10,r10
	add r10,r12
	mov r13,  [rsp+8*14]
	mov r10,r10
	add r10,r13
	mov r14,  [rsp+8*16]
	mov r10,r10
	add r10,r14
	mov r15,  [rsp+8*18]
	mov r10,r10
	add r10,r15
	mov r8,  [rsp+8*20]
	mov r10,r10
	add r10,r8
	mov r9,  [rsp+8*22]
	mov r10,r10
	add r10,r9
	mov r11,  [rsp+8*24]
	mov r10,r10
	add r10,r11
	mov r12,  [rsp+8*26]
	mov r10,r10
	add r10,r12
	mov r13,  [rsp+8*28]
	mov r10,r10
	add r10,r13
	mov r14,  [rsp+8*30]
	mov r10,r10
	add r10,r14
	mov r15,  [rsp+8*32]
	mov r10,r10
	add r10,r15
	mov r8,  [rsp+8*34]
	mov r10,r10
	add r10,r8
	mov r9,  [rsp+8*36]
	mov r10,r10
	add r10,r9
	mov r11,  [rsp+8*38]
	mov r10,r10
	add r10,r11
	mov r12,  [rsp+8*40]
	mov r10,r10
	add r10,r12
	mov r13,  [rsp+8*42]
	mov r10,r10
	add r10,r13
	mov r14,  [rsp+8*44]
	mov r10,r10
	add r10,r14
	mov r15,  [rsp+8*46]
	mov r10,r10
	add r10,r15
	mov r8,  [rsp+8*48]
	mov r10,r10
	add r10,r8
	mov r9,  [rsp+8*50]
	mov r10,r10
	add r10,r9
	mov r11,  [rsp+8*52]
	mov r10,r10
	add r10,r11
	mov r12,  [rsp+8*54]
	mov r10,r10
	add r10,r12
	mov r13,  [rsp+8*56]
	mov r10,r10
	add r10,r13
	mov r14,  [rsp+8*58]
	mov r10,r10
	add r10,r14
	mov r15,  [rsp+8*60]
	mov r10,r10
	add r10,r15
	mov r8,  [rsp+8*62]
	mov r10,r10
	add r10,r8
	mov r9,  [rsp+8*64]
	mov r10,r10
	add r10,r9
	xor rdx, rdx
	mov rax, r10
	mov r11,100
	mov rbx, r11
	cdq
	idiv rbx
	mov r12, rdx
	mov r10,r12
	mov r11,  [rsp+8*65]
	mov r12,1
	mov r11,r11
	add r11,r12
	mov qword [rsp+8*69],r10
	mov qword [rsp+8*65],r11
	jmp L_1672
	
L_1673:
	xor rdx, rdx
	mov r8,  [rsp+8*2]
	mov rax, r8
	mov r9,  [rsp+8*4]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r11,0
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*70],r10
	mov qword [rsp+8*71],r12
	mov r8,  [rsp+8*71]
	cmp r8, 0
	je L_1675
	mov r8,  [rsp+8*4]
	mov rax,r8
	leave
	ret
	
L_1675:
	xor rdx, rdx
	mov r8,  [rsp+8*2]
	mov rax, r8
	mov r9,  [rsp+8*4]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r12,58
	mov r11,r12
	mov r14,56
	mov r13,r14
	mov r8,54
	mov r15,r8
	mov r12,52
	mov r8,r12
	mov r14,50
	mov r12,r14
	mov r9,48
	mov r14,r9
	mov qword [rsp+8*72],r10
	mov r10,46
	mov r9,r10
	mov qword [arg+8*31],r11
	mov r11,44
	mov r10,r11
	mov qword [arg+8*30],r13
	mov r13,42
	mov r11,r13
	mov qword [arg+8*29],r15
	mov r15,40
	mov r13,r15
	mov qword [arg+8*28],r8
	mov r8,38
	mov r15,r8
	mov qword [arg+8*27],r12
	mov r12,36
	mov r8,r12
	mov qword [arg+8*26],r14
	mov r14,34
	mov r12,r14
	mov qword [arg+8*25],r9
	mov r9,32
	mov r14,r9
	mov qword [arg+8*24],r10
	mov r10,30
	mov r9,r10
	mov qword [arg+8*23],r11
	mov r11,28
	mov r10,r11
	mov qword [arg+8*22],r13
	mov r13,26
	mov r11,r13
	mov qword [arg+8*21],r15
	mov r15,24
	mov r13,r15
	mov qword [arg+8*20],r8
	mov r8,22
	mov r15,r8
	mov qword [arg+8*19],r12
	mov r12,20
	mov r8,r12
	mov qword [arg+8*18],r14
	mov r14,18
	mov r12,r14
	mov qword [arg+8*17],r9
	mov r9,16
	mov r14,r9
	mov qword [arg+8*16],r10
	mov r10,14
	mov r9,r10
	mov qword [arg+8*15],r11
	mov r11,12
	mov r10,r11
	mov qword [arg+8*14],r13
	mov r13,10
	mov r11,r13
	mov qword [arg+8*13],r15
	mov r15,8
	mov r13,r15
	mov qword [arg+8*12],r8
	mov r8,6
	mov r15,r8
	mov qword [arg+8*11],r12
	mov r12,4
	mov r8,r12
	mov qword [arg+8*10],r14
	mov r14,2
	mov r12,r14
	mov qword [arg+8*9],r9
	mov r9,0
	mov r14,r9
	mov qword [arg+8*8],r10
	mov r10,68
	mov r9,r10
	mov qword [arg+8*7],r11
	mov r11,10
	mov r10,r11
	mov qword [arg+8*4],r8
	mov qword rsi,r9
	mov qword rdi,r10
	mov qword [arg+8*3],r12
	mov qword [arg+8*6],r13
	mov qword [arg+8*2],r14
	mov qword [arg+8*5],r15
	call gcd
	mov r8 , rax
	mov r10,  [rsp+8*64]
	mov r9,r10
	mov r12,  [rsp+8*62]
	mov r11,r12
	mov r14,  [rsp+8*60]
	mov r13,r14
	mov r10,  [rsp+8*58]
	mov r15,r10
	mov r12,  [rsp+8*56]
	mov r10,r12
	mov r14,  [rsp+8*54]
	mov r12,r14
	mov qword [rsp+8*73],r8
	mov r8,  [rsp+8*52]
	mov r14,r8
	mov qword [arg+8*31],r9
	mov r9,  [rsp+8*50]
	mov r8,r9
	mov qword [arg+8*30],r11
	mov r11,  [rsp+8*48]
	mov r9,r11
	mov qword [arg+8*29],r13
	mov r13,  [rsp+8*46]
	mov r11,r13
	mov qword [arg+8*28],r15
	mov r15,  [rsp+8*44]
	mov r13,r15
	mov qword [arg+8*27],r10
	mov r10,  [rsp+8*42]
	mov r15,r10
	mov qword [arg+8*26],r12
	mov r12,  [rsp+8*40]
	mov r10,r12
	mov qword [arg+8*25],r14
	mov r14,  [rsp+8*38]
	mov r12,r14
	mov qword [arg+8*24],r8
	mov r8,  [rsp+8*36]
	mov r14,r8
	mov qword [arg+8*23],r9
	mov r9,  [rsp+8*34]
	mov r8,r9
	mov qword [arg+8*22],r11
	mov r11,  [rsp+8*32]
	mov r9,r11
	mov qword [arg+8*21],r13
	mov r13,  [rsp+8*30]
	mov r11,r13
	mov qword [arg+8*20],r15
	mov r15,  [rsp+8*28]
	mov r13,r15
	mov qword [arg+8*19],r10
	mov r10,  [rsp+8*26]
	mov r15,r10
	mov qword [arg+8*18],r12
	mov r12,  [rsp+8*24]
	mov r10,r12
	mov qword [arg+8*17],r14
	mov r14,  [rsp+8*22]
	mov r12,r14
	mov qword [arg+8*16],r8
	mov r8,  [rsp+8*20]
	mov r14,r8
	mov qword [arg+8*15],r9
	mov r9,  [rsp+8*18]
	mov r8,r9
	mov qword [arg+8*14],r11
	mov r11,  [rsp+8*16]
	mov r9,r11
	mov qword [arg+8*13],r13
	mov r13,  [rsp+8*14]
	mov r11,r13
	mov qword [arg+8*12],r15
	mov r15,  [rsp+8*12]
	mov r13,r15
	mov qword [arg+8*11],r10
	mov r10,  [rsp+8*10]
	mov r15,r10
	mov qword [arg+8*10],r12
	mov r12,  [rsp+8*73]
	mov r10,r12
	mov qword [arg+8*9],r14
	mov r14,  [rsp+8*69]
	mov r12,r14
	mov qword [arg+8*8],r8
	mov r8,  [rsp+8*72]
	mov r14,r8
	mov qword [arg+8*7],r9
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov qword rdi,r8
	mov qword [arg+8*3],r10
	mov qword [arg+8*6],r11
	mov qword [arg+8*2],r12
	mov qword [arg+8*5],r13
	mov qword rsi,r14
	mov qword [arg+8*4],r15
	call gcd1
	mov r8 , rax
	mov rax,r8
	leave
	ret
	
gcd1:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1336
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov r13,  [arg+8*2]
	mov r12,r13
	mov r15,  [arg+8*3]
	mov r14,r15
	mov qword [rsp+8*75],r8
	mov r9,  [arg+8*4]
	mov r8,r9
	mov qword [rsp+8*76],r10
	mov r11,  [arg+8*5]
	mov r10,r11
	mov qword [rsp+8*77],r12
	mov r13,  [arg+8*6]
	mov r12,r13
	mov qword [rsp+8*78],r14
	mov r15,  [arg+8*7]
	mov r14,r15
	mov qword [rsp+8*79],r8
	mov r9,  [arg+8*8]
	mov r8,r9
	mov qword [rsp+8*80],r10
	mov r11,  [arg+8*9]
	mov r10,r11
	mov qword [rsp+8*81],r12
	mov r13,  [arg+8*10]
	mov r12,r13
	mov qword [rsp+8*82],r14
	mov r15,  [arg+8*11]
	mov r14,r15
	mov qword [rsp+8*83],r8
	mov r9,  [arg+8*12]
	mov r8,r9
	mov qword [rsp+8*84],r10
	mov r11,  [arg+8*13]
	mov r10,r11
	mov qword [rsp+8*85],r12
	mov r13,  [arg+8*14]
	mov r12,r13
	mov qword [rsp+8*86],r14
	mov r15,  [arg+8*15]
	mov r14,r15
	mov qword [rsp+8*87],r8
	mov r9,  [arg+8*16]
	mov r8,r9
	mov qword [rsp+8*88],r10
	mov r11,  [arg+8*17]
	mov r10,r11
	mov qword [rsp+8*89],r12
	mov r13,  [arg+8*18]
	mov r12,r13
	mov qword [rsp+8*90],r14
	mov r15,  [arg+8*19]
	mov r14,r15
	mov qword [rsp+8*91],r8
	mov r9,  [arg+8*20]
	mov r8,r9
	mov qword [rsp+8*92],r10
	mov r11,  [arg+8*21]
	mov r10,r11
	mov qword [rsp+8*93],r12
	mov r13,  [arg+8*22]
	mov r12,r13
	mov qword [rsp+8*94],r14
	mov r15,  [arg+8*23]
	mov r14,r15
	mov qword [rsp+8*95],r8
	mov r9,  [arg+8*24]
	mov r8,r9
	mov qword [rsp+8*96],r10
	mov r11,  [arg+8*25]
	mov r10,r11
	mov qword [rsp+8*97],r12
	mov r13,  [arg+8*26]
	mov r12,r13
	mov qword [rsp+8*98],r14
	mov r15,  [arg+8*27]
	mov r14,r15
	mov qword [rsp+8*99],r8
	mov r9,  [arg+8*28]
	mov r8,r9
	mov qword [rsp+8*100],r10
	mov r11,  [arg+8*29]
	mov r10,r11
	mov qword [rsp+8*101],r12
	mov r13,  [arg+8*30]
	mov r12,r13
	mov qword [rsp+8*102],r14
	mov r15,  [arg+8*31]
	mov r14,r15
	mov qword [rsp+8*103],r8
	mov r8,  [rsp+8*77]
	mov r9,  [rsp+8*78]
	mov qword [rsp+8*104],r10
	mov r10,r8
	add r10,r9
	mov r8,  [rsp+8*79]
	mov r10,r10
	add r10,r8
	mov r11,  [rsp+8*80]
	mov r10,r10
	add r10,r11
	mov qword [rsp+8*105],r12
	mov r12,  [rsp+8*81]
	mov r10,r10
	add r10,r12
	mov r13,  [rsp+8*82]
	mov r10,r10
	add r10,r13
	mov qword [rsp+8*106],r14
	mov r14,  [rsp+8*83]
	mov r10,r10
	add r10,r14
	mov r15,  [rsp+8*84]
	mov r10,r10
	add r10,r15
	mov r9,  [rsp+8*85]
	mov r10,r10
	add r10,r9
	mov r8,  [rsp+8*86]
	mov r10,r10
	add r10,r8
	mov r11,  [rsp+8*87]
	mov r10,r10
	add r10,r11
	mov r12,  [rsp+8*88]
	mov r10,r10
	add r10,r12
	mov r13,  [rsp+8*89]
	mov r10,r10
	add r10,r13
	mov r14,  [rsp+8*90]
	mov r10,r10
	add r10,r14
	mov r15,  [rsp+8*91]
	mov r10,r10
	add r10,r15
	mov r9,  [rsp+8*92]
	mov r10,r10
	add r10,r9
	mov r8,  [rsp+8*93]
	mov r10,r10
	add r10,r8
	mov r11,  [rsp+8*94]
	mov r10,r10
	add r10,r11
	mov r12,  [rsp+8*95]
	mov r10,r10
	add r10,r12
	mov r13,  [rsp+8*96]
	mov r10,r10
	add r10,r13
	mov r14,  [rsp+8*97]
	mov r10,r10
	add r10,r14
	mov r15,  [rsp+8*98]
	mov r10,r10
	add r10,r15
	mov r9,  [rsp+8*99]
	mov r10,r10
	add r10,r9
	mov r8,  [rsp+8*100]
	mov r10,r10
	add r10,r8
	mov r11,  [rsp+8*101]
	mov r10,r10
	add r10,r11
	mov r12,  [rsp+8*102]
	mov r10,r10
	add r10,r12
	mov r13,  [rsp+8*103]
	mov r10,r10
	add r10,r13
	mov r14,  [rsp+8*104]
	mov r10,r10
	add r10,r14
	mov r15,  [rsp+8*105]
	mov r10,r10
	add r10,r15
	mov r9,  [rsp+8*106]
	mov r10,r10
	add r10,r9
	xor rdx, rdx
	mov rax, r10
	mov r8,100
	mov rbx, r8
	cdq
	idiv rbx
	mov r11, rdx
	mov r8,r11
	xor rdx, rdx
	mov r10,  [rsp+8*75]
	mov rax, r10
	mov r11,  [rsp+8*76]
	mov rbx, r11
	cdq
	idiv rbx
	mov r12, rdx
	mov r13,0
	cmp r12,r13
	mov r14, 0
	sete r14B
	mov qword [rsp+8*109],r8
	mov qword [rsp+8*110],r12
	mov qword [rsp+8*111],r14
	mov r8,  [rsp+8*111]
	cmp r8, 0
	je L_1677
	mov r8,  [rsp+8*76]
	mov rax,r8
	leave
	ret
	
L_1677:
	xor rdx, rdx
	mov r8,  [rsp+8*75]
	mov rax, r8
	mov r9,  [rsp+8*76]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r12,  [rsp+8*106]
	mov r11,r12
	mov r14,  [rsp+8*105]
	mov r13,r14
	mov r8,  [rsp+8*104]
	mov r15,r8
	mov r12,  [rsp+8*103]
	mov r8,r12
	mov r14,  [rsp+8*102]
	mov r12,r14
	mov r9,  [rsp+8*101]
	mov r14,r9
	mov qword [rsp+8*112],r10
	mov r10,  [rsp+8*100]
	mov r9,r10
	mov qword [arg+8*31],r11
	mov r11,  [rsp+8*99]
	mov r10,r11
	mov qword [arg+8*30],r13
	mov r13,  [rsp+8*98]
	mov r11,r13
	mov qword [arg+8*29],r15
	mov r15,  [rsp+8*97]
	mov r13,r15
	mov qword [arg+8*28],r8
	mov r8,  [rsp+8*96]
	mov r15,r8
	mov qword [arg+8*27],r12
	mov r12,  [rsp+8*95]
	mov r8,r12
	mov qword [arg+8*26],r14
	mov r14,  [rsp+8*94]
	mov r12,r14
	mov qword [arg+8*25],r9
	mov r9,  [rsp+8*93]
	mov r14,r9
	mov qword [arg+8*24],r10
	mov r10,  [rsp+8*92]
	mov r9,r10
	mov qword [arg+8*23],r11
	mov r11,  [rsp+8*91]
	mov r10,r11
	mov qword [arg+8*22],r13
	mov r13,  [rsp+8*90]
	mov r11,r13
	mov qword [arg+8*21],r15
	mov r15,  [rsp+8*89]
	mov r13,r15
	mov qword [arg+8*20],r8
	mov r8,  [rsp+8*88]
	mov r15,r8
	mov qword [arg+8*19],r12
	mov r12,  [rsp+8*87]
	mov r8,r12
	mov qword [arg+8*18],r14
	mov r14,  [rsp+8*86]
	mov r12,r14
	mov qword [arg+8*17],r9
	mov r9,  [rsp+8*85]
	mov r14,r9
	mov qword [arg+8*16],r10
	mov r10,  [rsp+8*84]
	mov r9,r10
	mov qword [arg+8*15],r11
	mov r11,  [rsp+8*83]
	mov r10,r11
	mov qword [arg+8*14],r13
	mov r13,  [rsp+8*82]
	mov r11,r13
	mov qword [arg+8*13],r15
	mov r15,  [rsp+8*81]
	mov r13,r15
	mov qword [arg+8*12],r8
	mov r8,  [rsp+8*80]
	mov r15,r8
	mov qword [arg+8*11],r12
	mov r12,  [rsp+8*79]
	mov r8,r12
	mov qword [arg+8*10],r14
	mov r14,  [rsp+8*78]
	mov r12,r14
	mov qword [arg+8*9],r9
	mov r9,  [rsp+8*109]
	mov r14,r9
	mov qword [arg+8*8],r10
	mov r10,  [rsp+8*112]
	mov r9,r10
	mov qword [arg+8*7],r11
	mov r11,  [rsp+8*76]
	mov r10,r11
	mov qword [arg+8*4],r8
	mov qword rsi,r9
	mov qword rdi,r10
	mov qword [arg+8*3],r12
	mov qword [arg+8*6],r13
	mov qword [arg+8*2],r14
	mov qword [arg+8*5],r15
	call gcd2
	mov r8 , rax
	mov rax,r8
	leave
	ret
	
gcd2:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1336
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov r13,  [arg+8*2]
	mov r12,r13
	mov r15,  [arg+8*3]
	mov r14,r15
	mov qword [rsp+8*114],r8
	mov r9,  [arg+8*4]
	mov r8,r9
	mov qword [rsp+8*115],r10
	mov r11,  [arg+8*5]
	mov r10,r11
	mov qword [rsp+8*116],r12
	mov r13,  [arg+8*6]
	mov r12,r13
	mov qword [rsp+8*117],r14
	mov r15,  [arg+8*7]
	mov r14,r15
	mov qword [rsp+8*118],r8
	mov r9,  [arg+8*8]
	mov r8,r9
	mov qword [rsp+8*119],r10
	mov r11,  [arg+8*9]
	mov r10,r11
	mov qword [rsp+8*120],r12
	mov r13,  [arg+8*10]
	mov r12,r13
	mov qword [rsp+8*121],r14
	mov r15,  [arg+8*11]
	mov r14,r15
	mov qword [rsp+8*122],r8
	mov r9,  [arg+8*12]
	mov r8,r9
	mov qword [rsp+8*123],r10
	mov r11,  [arg+8*13]
	mov r10,r11
	mov qword [rsp+8*124],r12
	mov r13,  [arg+8*14]
	mov r12,r13
	mov qword [rsp+8*125],r14
	mov r15,  [arg+8*15]
	mov r14,r15
	mov qword [rsp+8*126],r8
	mov r9,  [arg+8*16]
	mov r8,r9
	mov qword [rsp+8*127],r10
	mov r11,  [arg+8*17]
	mov r10,r11
	mov qword [rsp+8*128],r12
	mov r13,  [arg+8*18]
	mov r12,r13
	mov qword [rsp+8*129],r14
	mov r15,  [arg+8*19]
	mov r14,r15
	mov qword [rsp+8*130],r8
	mov r9,  [arg+8*20]
	mov r8,r9
	mov qword [rsp+8*131],r10
	mov r11,  [arg+8*21]
	mov r10,r11
	mov qword [rsp+8*132],r12
	mov r13,  [arg+8*22]
	mov r12,r13
	mov qword [rsp+8*133],r14
	mov r15,  [arg+8*23]
	mov r14,r15
	mov qword [rsp+8*134],r8
	mov r9,  [arg+8*24]
	mov r8,r9
	mov qword [rsp+8*135],r10
	mov r11,  [arg+8*25]
	mov r10,r11
	mov qword [rsp+8*136],r12
	mov r13,  [arg+8*26]
	mov r12,r13
	mov qword [rsp+8*137],r14
	mov r15,  [arg+8*27]
	mov r14,r15
	mov qword [rsp+8*138],r8
	mov r9,  [arg+8*28]
	mov r8,r9
	mov qword [rsp+8*139],r10
	mov r11,  [arg+8*29]
	mov r10,r11
	mov qword [rsp+8*140],r12
	mov r13,  [arg+8*30]
	mov r12,r13
	mov qword [rsp+8*141],r14
	mov r15,  [arg+8*31]
	mov r14,r15
	mov qword [rsp+8*142],r8
	mov r8,  [rsp+8*116]
	mov r9,  [rsp+8*117]
	mov qword [rsp+8*143],r10
	mov r10,r8
	add r10,r9
	mov r11,  [rsp+8*118]
	mov r10,r10
	add r10,r11
	mov qword [rsp+8*144],r12
	mov r12,  [rsp+8*119]
	mov r10,r10
	add r10,r12
	mov r13,  [rsp+8*120]
	mov r10,r10
	add r10,r13
	mov qword [rsp+8*145],r14
	mov r14,  [rsp+8*121]
	mov r10,r10
	add r10,r14
	mov r15,  [rsp+8*122]
	mov r10,r10
	add r10,r15
	mov r8,  [rsp+8*123]
	mov r10,r10
	add r10,r8
	mov r9,  [rsp+8*124]
	mov r10,r10
	add r10,r9
	mov r11,  [rsp+8*125]
	mov r10,r10
	add r10,r11
	mov r12,  [rsp+8*126]
	mov r10,r10
	add r10,r12
	mov r13,  [rsp+8*127]
	mov r10,r10
	add r10,r13
	mov r14,  [rsp+8*128]
	mov r10,r10
	add r10,r14
	mov r15,  [rsp+8*129]
	mov r10,r10
	add r10,r15
	mov r8,  [rsp+8*130]
	mov r10,r10
	add r10,r8
	mov r9,  [rsp+8*131]
	mov r10,r10
	add r10,r9
	mov r11,  [rsp+8*132]
	mov r10,r10
	add r10,r11
	mov r12,  [rsp+8*133]
	mov r10,r10
	add r10,r12
	mov r13,  [rsp+8*134]
	mov r10,r10
	add r10,r13
	mov r14,  [rsp+8*135]
	mov r10,r10
	add r10,r14
	mov r15,  [rsp+8*136]
	mov r10,r10
	add r10,r15
	mov r8,  [rsp+8*137]
	mov r10,r10
	add r10,r8
	mov r9,  [rsp+8*138]
	mov r10,r10
	add r10,r9
	mov r11,  [rsp+8*139]
	mov r10,r10
	add r10,r11
	mov r12,  [rsp+8*140]
	mov r10,r10
	add r10,r12
	mov r13,  [rsp+8*141]
	mov r10,r10
	add r10,r13
	mov r14,  [rsp+8*142]
	mov r10,r10
	add r10,r14
	mov r15,  [rsp+8*143]
	mov r10,r10
	add r10,r15
	mov r8,  [rsp+8*144]
	mov r10,r10
	add r10,r8
	mov r9,  [rsp+8*145]
	mov r10,r10
	add r10,r9
	xor rdx, rdx
	mov rax, r10
	mov r11,100
	mov rbx, r11
	cdq
	idiv rbx
	mov r12, rdx
	mov r10,r12
	xor rdx, rdx
	mov qword [rsp+8*148],r10
	mov r10,  [rsp+8*114]
	mov rax, r10
	mov r11,  [rsp+8*115]
	mov rbx, r11
	cdq
	idiv rbx
	mov r12, rdx
	mov r13,0
	cmp r12,r13
	mov r14, 0
	sete r14B
	mov qword [rsp+8*149],r12
	mov qword [rsp+8*150],r14
	mov r8,  [rsp+8*150]
	cmp r8, 0
	je L_1679
	mov r8,  [rsp+8*115]
	mov rax,r8
	leave
	ret
	
L_1679:
	xor rdx, rdx
	mov r8,  [rsp+8*114]
	mov rax, r8
	mov r9,  [rsp+8*115]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r12,  [rsp+8*145]
	mov r11,r12
	mov r14,  [rsp+8*144]
	mov r13,r14
	mov r8,  [rsp+8*143]
	mov r15,r8
	mov r12,  [rsp+8*142]
	mov r8,r12
	mov r14,  [rsp+8*141]
	mov r12,r14
	mov r9,  [rsp+8*140]
	mov r14,r9
	mov qword [rsp+8*151],r10
	mov r10,  [rsp+8*139]
	mov r9,r10
	mov qword [arg+8*31],r11
	mov r11,  [rsp+8*138]
	mov r10,r11
	mov qword [arg+8*30],r13
	mov r13,  [rsp+8*137]
	mov r11,r13
	mov qword [arg+8*29],r15
	mov r15,  [rsp+8*136]
	mov r13,r15
	mov qword [arg+8*28],r8
	mov r8,  [rsp+8*135]
	mov r15,r8
	mov qword [arg+8*27],r12
	mov r12,  [rsp+8*134]
	mov r8,r12
	mov qword [arg+8*26],r14
	mov r14,  [rsp+8*133]
	mov r12,r14
	mov qword [arg+8*25],r9
	mov r9,  [rsp+8*132]
	mov r14,r9
	mov qword [arg+8*24],r10
	mov r10,  [rsp+8*131]
	mov r9,r10
	mov qword [arg+8*23],r11
	mov r11,  [rsp+8*130]
	mov r10,r11
	mov qword [arg+8*22],r13
	mov r13,  [rsp+8*129]
	mov r11,r13
	mov qword [arg+8*21],r15
	mov r15,  [rsp+8*128]
	mov r13,r15
	mov qword [arg+8*20],r8
	mov r8,  [rsp+8*127]
	mov r15,r8
	mov qword [arg+8*19],r12
	mov r12,  [rsp+8*126]
	mov r8,r12
	mov qword [arg+8*18],r14
	mov r14,  [rsp+8*125]
	mov r12,r14
	mov qword [arg+8*17],r9
	mov r9,  [rsp+8*124]
	mov r14,r9
	mov qword [arg+8*16],r10
	mov r10,  [rsp+8*123]
	mov r9,r10
	mov qword [arg+8*15],r11
	mov r11,  [rsp+8*122]
	mov r10,r11
	mov qword [arg+8*14],r13
	mov r13,  [rsp+8*121]
	mov r11,r13
	mov qword [arg+8*13],r15
	mov r15,  [rsp+8*120]
	mov r13,r15
	mov qword [arg+8*12],r8
	mov r8,  [rsp+8*119]
	mov r15,r8
	mov qword [arg+8*11],r12
	mov r12,  [rsp+8*118]
	mov r8,r12
	mov qword [arg+8*10],r14
	mov r14,  [rsp+8*117]
	mov r12,r14
	mov qword [arg+8*9],r9
	mov r9,  [rsp+8*116]
	mov r14,r9
	mov qword [arg+8*8],r10
	mov r10,  [rsp+8*151]
	mov r9,r10
	mov qword [arg+8*7],r11
	mov r11,  [rsp+8*115]
	mov r10,r11
	mov qword [arg+8*4],r8
	mov qword rsi,r9
	mov qword rdi,r10
	mov qword [arg+8*3],r12
	mov qword [arg+8*6],r13
	mov qword [arg+8*2],r14
	mov qword [arg+8*5],r15
	call gcd
	mov r8 , rax
	mov rax,r8
	leave
	ret
	
main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1336
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 3320
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	call global_init
	mov r8 , rax
	mov r10,58
	mov r9,r10
	mov r12,56
	mov r11,r12
	mov r14,54
	mov r13,r14
	mov qword [rsp+8*153],r8
	mov r8,52
	mov r15,r8
	mov qword [arg+8*31],r9
	mov r9,50
	mov r8,r9
	mov qword [arg+8*27],r8
	mov r9,48
	mov r8,r9
	mov qword [arg+8*26],r8
	mov r9,46
	mov r8,r9
	mov qword [arg+8*25],r8
	mov r9,44
	mov r8,r9
	mov qword [arg+8*24],r8
	mov r9,42
	mov r8,r9
	mov qword [arg+8*23],r8
	mov r9,40
	mov r8,r9
	mov qword [arg+8*22],r8
	mov r9,38
	mov r8,r9
	mov qword [arg+8*21],r8
	mov r9,36
	mov r8,r9
	mov qword [arg+8*20],r8
	mov r9,34
	mov r8,r9
	mov qword [arg+8*19],r8
	mov r9,32
	mov r8,r9
	mov qword [arg+8*18],r8
	mov r9,30
	mov r8,r9
	mov qword [arg+8*17],r8
	mov r9,28
	mov r8,r9
	mov qword [arg+8*16],r8
	mov r9,26
	mov r8,r9
	mov qword [arg+8*15],r8
	mov r9,24
	mov r8,r9
	mov qword [arg+8*14],r8
	mov r9,22
	mov r8,r9
	mov qword [arg+8*13],r8
	mov r9,20
	mov r8,r9
	mov qword [arg+8*12],r8
	mov r9,18
	mov r8,r9
	mov qword [arg+8*11],r8
	mov r9,16
	mov r8,r9
	mov qword [arg+8*10],r8
	mov r9,14
	mov r8,r9
	mov qword [arg+8*9],r8
	mov r9,12
	mov r8,r9
	mov qword [arg+8*8],r8
	mov r9,10
	mov r8,r9
	mov qword [arg+8*7],r8
	mov r9,8
	mov r8,r9
	mov qword [arg+8*6],r8
	mov r9,6
	mov r8,r9
	mov qword [arg+8*5],r8
	mov r9,4
	mov r8,r9
	mov qword [arg+8*4],r8
	mov r9,2
	mov r8,r9
	mov qword [arg+8*3],r8
	mov r9,0
	mov r8,r9
	mov qword [arg+8*2],r8
	mov r9,1
	mov r8,r9
	mov qword rsi,r8
	mov r9,10
	mov r8,r9
	mov qword rdi,r8
	mov qword [arg+8*30],r11
	mov qword [arg+8*29],r13
	mov qword [arg+8*28],r15
	call gcd
	mov r8 , rax
	mov r9,1024
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r12,r11
	mov qword [rsp+8*154],r8
	mov qword [rsp+8*155],r10
	mov qword rdi,r11
	mov qword [rsp+8*156],r12
	mov     rdi, [rsp+8*156]
	call    toString
	mov     qword[rsp+8*157], rax
	mov r9,  [rsp+8*157]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*158],r10
	mov rdi,[rsp+8*158] 
	add rdi, 1 
	call puts
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1336
	mov r8,  [rsp+8*159]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   3320
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
	

