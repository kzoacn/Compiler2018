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
	sub    rsp, 1200
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 3184
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
	
L_1713:
	mov r8,  [rsp+8*19]
	mov r9,  [rsp+8*5]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*20],r10
	mov r8,  [rsp+8*20]
	cmp r8, 0
	je L_1714
	mov r9,  [rsp+8*7]
	mov r8,r9
	mov qword [rsp+8*21],r8
	
L_1716:
	mov r8,  [rsp+8*21]
	mov r9,  [rsp+8*9]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*22],r10
	mov r8,  [rsp+8*22]
	cmp r8, 0
	je L_1717
	mov r9,  [rsp+8*11]
	mov r8,r9
	mov qword [rsp+8*23],r8
	
L_1719:
	mov r8,  [rsp+8*23]
	mov r9,  [rsp+8*13]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*24],r10
	mov r8,  [rsp+8*24]
	cmp r8, 0
	je L_1720
	mov r9,  [rsp+8*23]
	mov r8,r9
	mov r11,  [rsp+8*14]
	mov r10,r11
	mov r13,  [rsp+8*3]
	mov r12,r13
	mov r14,r12
	mov r15,r10
	mov r13,r8
	mov qword rdi,r12
	mov r12,31
	mov qword rsi,r10
	mov r10,r13
	and r10,r12
	mov r9,r10
	mov qword [rsp+8*32],r9
	mov r9,r15
	mov qword rsi,r9
	mov r9,r14
	mov qword rdi,r9
	mov qword [rsp+8*28],r14
	mov r14,  rdi
	mov r9,r14
	mov qword [rsp+8*33],r9
	mov r9,  rsi
	mov r14,r9
	mov r9,  [rsp+8*33]
	mov qword [rsp+8*34],r14
	mov r14,1
	mov qword [rsp+8*29],r15
	mov r15,r9
	add r15,r14
	mov qword [rsp+8*35],r15
	mov r9,  [rsp+8*35]
	mov r15,r9
	mov qword [rsp+8*36],r15
	mov r9,0
	mov r15,r9
	mov qword [arg+8*2],r8
	mov qword [rsp+8*31],r10
	mov qword [rsp+8*30],r13
	mov qword [rsp+8*37],r15
	
L_2066:
	mov r8,  [rsp+8*34]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*37]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*38],r10
	mov qword [rsp+8*39],r12
	mov r8,  [rsp+8*39]
	cmp r8, 0
	je L_2067
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*36]
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
	mov qword [rsp+8*42],r14
	mov r14,  rsi
	mov r11,r14
	mov r14,r10
	mov rcx,16
	shl r14,cl
	or r14,r11
	mov qword [rsp+8*45],r14
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*45]
	mov r14,r11
	mov qword [rsp+8*46],r14
	mov r11,  [rsp+8*46]
	mov r14,r11
	mov qword [rsp+8*47],r14
	mov r14,  [rsp+8*42]
	mov r11,  [rsp+8*47]
	mov r14,r14
	and r14,r11
	mov qword [rsp+8*42],r14
	mov r11,  [rsp+8*42]
	mov r14,r11
	mov qword [rsp+8*48],r14
	mov r11,  [rsp+8*48]
	mov r14,r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*43],r10
	mov r10,r11
	xor r10,r14
	mov r11,r10
	mov qword [rsp+8*36],r11
	mov r8,17
	mov r11,r8
	mov qword rsi,r11
	mov r15,  [rsp+8*36]
	mov r11,r15
	mov qword rdi,r11
	mov r15,  rdi
	mov r11,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov qword [rsp+8*41],r13
	mov r13,65535
	mov r12,r13
	mov qword rsi,r12
	mov qword [rsp+8*51],r11
	mov r11,32767
	mov r12,r11
	mov qword rdi,r12
	mov qword [rsp+8*52],r15
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*43],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*43]
	mov qword [rsp+8*44],r15
	mov r15,r12
	mov rcx,16
	shl r15,cl
	mov qword [rsp+8*45],r15
	mov r15,  [rsp+8*44]
	mov r12,  [rsp+8*45]
	or r12,r15
	mov qword [rsp+8*45],r12
	mov r15,  [rsp+8*45]
	mov r12,r15
	mov qword [rsp+8*46],r12
	mov r15,  [rsp+8*46]
	mov r12,r15
	mov r15,r12
	mov qword [rsp+8*53],r12
	mov r12,  [rsp+8*52]
	mov r11,r15
	mov rcx,r12
	shr r11,cl
	mov r11,r11
	mov rcx,1
	shl r11,cl
	mov qword [rsp+8*54],r15
	mov r15,1
	mov r11,r11
	add r11,r15
	mov r12,r11
	mov qword [rsp+8*54],r12
	mov r12,  [rsp+8*51]
	mov qword [rsp+8*55],r11
	mov r11,  [rsp+8*52]
	mov r15,r12
	mov rcx,r11
	shr r15,cl
	mov qword [rsp+8*56],r15
	mov r15,  [rsp+8*54]
	mov r11,  [rsp+8*56]
	and r11,r15
	mov r15,r11
	mov qword [rsp+8*54],r15
	mov qword [rsp+8*56],r11
	mov r11,65535
	mov r15,r11
	mov qword rsi,r15
	mov r11,65535
	mov r15,r11
	mov qword rdi,r15
	mov r11,  rdi
	mov r15,r11
	mov qword [rsp+8*43],r15
	mov r15,  rsi
	mov r11,r15
	mov r15,  [rsp+8*43]
	mov qword [rsp+8*44],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	mov qword [rsp+8*45],r11
	mov r11,  [rsp+8*44]
	mov r15,  [rsp+8*45]
	or r15,r11
	mov qword [rsp+8*45],r15
	mov r11,  [rsp+8*45]
	mov r15,r11
	mov qword [rsp+8*46],r15
	mov r11,  [rsp+8*46]
	mov r15,r11
	mov r11,  [rsp+8*54]
	mov r12,r11
	and r12,r15
	mov qword [rsp+8*58],r12
	mov r11,  [rsp+8*58]
	mov r12,r11
	mov qword [rsp+8*59],r12
	mov r11,  [rsp+8*59]
	mov r12,r11
	mov qword [rsp+8*60],r12
	mov r12,  [rsp+8*36]
	mov r11,  [rsp+8*60]
	mov qword [rsp+8*57],r15
	mov r15,r12
	xor r15,r11
	mov r12,r15
	mov qword [rsp+8*36],r12
	mov qword [rsp+8*61],r15
	mov r15,5
	mov r12,r15
	mov qword rsi,r12
	mov r15,  [rsp+8*36]
	mov r12,r15
	mov qword rdi,r12
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*40]
	mov r11,r12
	mov rcx,r15
	shl r11,cl
	mov qword [rsp+8*42],r11
	mov r12,65535
	mov r11,r12
	mov qword rsi,r11
	mov r12,65535
	mov r11,r12
	mov qword rdi,r11
	mov r12,  rdi
	mov r11,r12
	mov qword [rsp+8*43],r11
	mov r11,  rsi
	mov r12,r11
	mov r11,  [rsp+8*43]
	mov qword [rsp+8*44],r12
	mov r12,r11
	mov rcx,16
	shl r12,cl
	mov qword [rsp+8*45],r12
	mov r12,  [rsp+8*44]
	mov r11,  [rsp+8*45]
	or r11,r12
	mov qword [rsp+8*45],r11
	mov r12,  [rsp+8*45]
	mov r11,r12
	mov qword [rsp+8*46],r11
	mov r12,  [rsp+8*46]
	mov r11,r12
	mov qword [rsp+8*47],r11
	mov r11,  [rsp+8*42]
	mov r12,  [rsp+8*47]
	mov r11,r11
	and r11,r12
	mov qword [rsp+8*42],r11
	mov r12,  [rsp+8*42]
	mov r11,r12
	mov qword [rsp+8*48],r11
	mov r12,  [rsp+8*48]
	mov r11,r12
	mov qword [rsp+8*62],r11
	mov r11,  [rsp+8*36]
	mov r12,  [rsp+8*62]
	mov qword [rsp+8*41],r15
	mov r15,r11
	xor r15,r12
	mov r11,r15
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*63],r15
	mov r15,  [rsp+8*37]
	mov r11,r15
	mov qword [rsp+8*64],r11
	mov r11,1
	mov r15,r15
	add r15,r11
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*49],r14
	mov qword [rsp+8*37],r15
	jmp L_2066
	
L_2067:
	mov r8,  [rsp+8*36]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,r11
	mov r14,  [rsp+8*32]
	mov r13,r14
	mov r15,r12
	mov qword rdi,r15
	mov qword rsi,r13
	mov r13,  rdi
	mov r15,r13
	mov qword [rsp+8*66],r10
	mov r10,  rsi
	mov r13,r10
	mov r10,r15
	mov rcx,r13
	shl r10,cl
	mov qword [rsp+8*65],r9
	mov r8,65535
	mov r9,r8
	mov qword rsi,r9
	mov qword [rsp+8*42],r10
	mov r10,65535
	mov r9,r10
	mov qword rdi,r9
	mov r10,  rdi
	mov r9,r10
	mov qword [rsp+8*43],r9
	mov r9,  rsi
	mov r10,r9
	mov r9,  [rsp+8*43]
	mov qword [rsp+8*44],r10
	mov r10,r9
	mov rcx,16
	shl r10,cl
	mov qword [rsp+8*45],r10
	mov r10,  [rsp+8*44]
	mov r9,  [rsp+8*45]
	or r9,r10
	mov qword [rsp+8*45],r9
	mov r10,  [rsp+8*45]
	mov r9,r10
	mov qword [rsp+8*46],r9
	mov r10,  [rsp+8*46]
	mov r9,r10
	mov qword [rsp+8*47],r9
	mov r9,  [rsp+8*42]
	mov r10,  [rsp+8*47]
	mov r9,r9
	and r9,r10
	mov qword [rsp+8*42],r9
	mov r10,  [rsp+8*42]
	mov r9,r10
	mov qword [rsp+8*48],r9
	mov r10,  [rsp+8*48]
	mov r9,r10
	mov r10,32
	mov r8,r10
	sub r8,r14
	mov qword [rsp+8*41],r13
	mov r13,r8
	mov qword rsi,r13
	mov r13,r12
	mov qword rdi,r13
	mov qword [rsp+8*40],r15
	mov r15,  rdi
	mov r13,r15
	mov qword [rsp+8*51],r13
	mov r13,  rsi
	mov r15,r13
	mov qword [rsp+8*52],r15
	mov r15,65535
	mov r13,r15
	mov qword rsi,r13
	mov r15,32767
	mov r13,r15
	mov qword rdi,r13
	mov r15,  rdi
	mov r13,r15
	mov qword [rsp+8*43],r13
	mov r13,  rsi
	mov r15,r13
	mov r13,  [rsp+8*43]
	mov qword [rsp+8*44],r15
	mov r15,r13
	mov rcx,16
	shl r15,cl
	mov qword [rsp+8*45],r15
	mov r15,  [rsp+8*44]
	mov r13,  [rsp+8*45]
	or r13,r15
	mov qword [rsp+8*45],r13
	mov r15,  [rsp+8*45]
	mov r13,r15
	mov qword [rsp+8*46],r13
	mov r15,  [rsp+8*46]
	mov r13,r15
	mov r15,r13
	mov qword [rsp+8*53],r13
	mov r13,  [rsp+8*52]
	mov qword [rsp+8*69],r9
	mov r9,r15
	mov rcx,r13
	shr r9,cl
	mov r9,r9
	mov rcx,1
	shl r9,cl
	mov qword [rsp+8*54],r15
	mov r15,1
	mov r9,r9
	add r9,r15
	mov r13,r9
	mov qword [rsp+8*54],r13
	mov r13,  [rsp+8*51]
	mov qword [rsp+8*55],r9
	mov r9,  [rsp+8*52]
	mov r15,r13
	mov rcx,r9
	shr r15,cl
	mov qword [rsp+8*56],r15
	mov r15,  [rsp+8*54]
	mov r9,  [rsp+8*56]
	and r9,r15
	mov r15,r9
	mov qword [rsp+8*54],r15
	mov qword [rsp+8*56],r9
	mov r9,65535
	mov r15,r9
	mov qword rsi,r15
	mov r9,65535
	mov r15,r9
	mov qword rdi,r15
	mov r9,  rdi
	mov r15,r9
	mov qword [rsp+8*43],r15
	mov r15,  rsi
	mov r9,r15
	mov r15,  [rsp+8*43]
	mov qword [rsp+8*44],r9
	mov r9,r15
	mov rcx,16
	shl r9,cl
	mov qword [rsp+8*45],r9
	mov r9,  [rsp+8*44]
	mov r15,  [rsp+8*45]
	or r15,r9
	mov qword [rsp+8*45],r15
	mov r9,  [rsp+8*45]
	mov r15,r9
	mov qword [rsp+8*46],r15
	mov r9,  [rsp+8*46]
	mov r15,r9
	mov r9,  [rsp+8*54]
	mov r13,r9
	and r13,r15
	mov qword [rsp+8*58],r13
	mov r9,  [rsp+8*58]
	mov r13,r9
	mov qword [rsp+8*59],r13
	mov r9,  [rsp+8*59]
	mov r13,r9
	mov r9,  [rsp+8*69]
	mov qword [rsp+8*57],r15
	mov r15,r9
	or r15,r13
	mov qword [rsp+8*72],r15
	mov r9,  [rsp+8*72]
	mov r15,r9
	mov qword [rsp+8*73],r15
	mov r9,  [rsp+8*73]
	mov r15,r9
	mov r9,r15
	mov qword [rsp+8*74],r15
	mov qword [rsp+8*75],r9
	mov r9,  [rsp+8*23]
	mov r15,r9
	mov qword [rsp+8*71],r13
	mov r13,  [rsp+8*14]
	mov r9,r13
	mov qword rsi,r9
	mov qword [rsp+8*68],r12
	mov r12,  [rsp+8*19]
	mov r9,r12
	mov qword rdi,r9
	mov r12,  rdi
	mov r9,r12
	mov qword [rsp+8*70],r8
	mov r8,  rsi
	mov r12,r8
	mov r8,r15
	mov r10,31
	mov r14,r8
	and r14,r10
	mov qword [rsp+8*67],r11
	mov r11,r14
	mov qword [rsp+8*32],r11
	mov r11,r12
	mov qword rsi,r11
	mov r11,r9
	mov qword rdi,r11
	mov qword [rsp+8*28],r9
	mov r9,  rdi
	mov r11,r9
	mov qword [rsp+8*33],r11
	mov r11,  rsi
	mov r9,r11
	mov r11,  [rsp+8*33]
	mov qword [rsp+8*34],r9
	mov r9,1
	mov qword [rsp+8*29],r12
	mov r12,r11
	add r12,r9
	mov qword [rsp+8*35],r12
	mov r9,  [rsp+8*35]
	mov r12,r9
	mov qword [rsp+8*36],r12
	mov r9,0
	mov r12,r9
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*37],r12
	mov qword [rsp+8*31],r14
	mov qword [arg+8*2],r15
	
L_2097:
	mov r8,  [rsp+8*34]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*37]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*38],r10
	mov qword [rsp+8*39],r12
	mov r8,  [rsp+8*39]
	cmp r8, 0
	je L_2098
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*36]
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
	mov qword [rsp+8*42],r14
	mov r14,  rsi
	mov r11,r14
	mov r14,r10
	mov rcx,16
	shl r14,cl
	or r14,r11
	mov qword [rsp+8*45],r14
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*45]
	mov r14,r11
	mov qword [rsp+8*46],r14
	mov r11,  [rsp+8*46]
	mov r14,r11
	mov qword [rsp+8*47],r14
	mov r14,  [rsp+8*42]
	mov r11,  [rsp+8*47]
	mov r14,r14
	and r14,r11
	mov qword [rsp+8*42],r14
	mov r11,  [rsp+8*42]
	mov r14,r11
	mov qword [rsp+8*48],r14
	mov r11,  [rsp+8*48]
	mov r14,r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*43],r10
	mov r10,r11
	xor r10,r14
	mov r11,r10
	mov qword [rsp+8*36],r11
	mov r8,17
	mov r11,r8
	mov qword rsi,r11
	mov r15,  [rsp+8*36]
	mov r11,r15
	mov qword rdi,r11
	mov r15,  rdi
	mov r11,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov qword [rsp+8*41],r13
	mov r13,65535
	mov r12,r13
	mov qword rsi,r12
	mov qword [rsp+8*51],r11
	mov r11,32767
	mov r12,r11
	mov qword rdi,r12
	mov qword [rsp+8*52],r15
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*43],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*43]
	mov qword [rsp+8*44],r15
	mov r15,r12
	mov rcx,16
	shl r15,cl
	mov qword [rsp+8*45],r15
	mov r15,  [rsp+8*44]
	mov r12,  [rsp+8*45]
	or r12,r15
	mov qword [rsp+8*45],r12
	mov r15,  [rsp+8*45]
	mov r12,r15
	mov qword [rsp+8*46],r12
	mov r15,  [rsp+8*46]
	mov r12,r15
	mov r15,r12
	mov qword [rsp+8*53],r12
	mov r12,  [rsp+8*52]
	mov r11,r15
	mov rcx,r12
	shr r11,cl
	mov r11,r11
	mov rcx,1
	shl r11,cl
	mov qword [rsp+8*54],r15
	mov r15,1
	mov r11,r11
	add r11,r15
	mov r12,r11
	mov qword [rsp+8*54],r12
	mov r12,  [rsp+8*51]
	mov qword [rsp+8*55],r11
	mov r11,  [rsp+8*52]
	mov r15,r12
	mov rcx,r11
	shr r15,cl
	mov qword [rsp+8*56],r15
	mov r15,  [rsp+8*54]
	mov r11,  [rsp+8*56]
	and r11,r15
	mov r15,r11
	mov qword [rsp+8*54],r15
	mov qword [rsp+8*56],r11
	mov r11,65535
	mov r15,r11
	mov qword rsi,r15
	mov r11,65535
	mov r15,r11
	mov qword rdi,r15
	mov r11,  rdi
	mov r15,r11
	mov qword [rsp+8*43],r15
	mov r15,  rsi
	mov r11,r15
	mov r15,  [rsp+8*43]
	mov qword [rsp+8*44],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	mov qword [rsp+8*45],r11
	mov r11,  [rsp+8*44]
	mov r15,  [rsp+8*45]
	or r15,r11
	mov qword [rsp+8*45],r15
	mov r11,  [rsp+8*45]
	mov r15,r11
	mov qword [rsp+8*46],r15
	mov r11,  [rsp+8*46]
	mov r15,r11
	mov r11,  [rsp+8*54]
	mov r12,r11
	and r12,r15
	mov qword [rsp+8*58],r12
	mov r11,  [rsp+8*58]
	mov r12,r11
	mov qword [rsp+8*59],r12
	mov r11,  [rsp+8*59]
	mov r12,r11
	mov qword [rsp+8*60],r12
	mov r12,  [rsp+8*36]
	mov r11,  [rsp+8*60]
	mov qword [rsp+8*57],r15
	mov r15,r12
	xor r15,r11
	mov r12,r15
	mov qword [rsp+8*36],r12
	mov qword [rsp+8*61],r15
	mov r15,5
	mov r12,r15
	mov qword rsi,r12
	mov r15,  [rsp+8*36]
	mov r12,r15
	mov qword rdi,r12
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*40]
	mov r11,r12
	mov rcx,r15
	shl r11,cl
	mov qword [rsp+8*42],r11
	mov r12,65535
	mov r11,r12
	mov qword rsi,r11
	mov r12,65535
	mov r11,r12
	mov qword rdi,r11
	mov r12,  rdi
	mov r11,r12
	mov qword [rsp+8*43],r11
	mov r11,  rsi
	mov r12,r11
	mov r11,  [rsp+8*43]
	mov qword [rsp+8*44],r12
	mov r12,r11
	mov rcx,16
	shl r12,cl
	mov qword [rsp+8*45],r12
	mov r12,  [rsp+8*44]
	mov r11,  [rsp+8*45]
	or r11,r12
	mov qword [rsp+8*45],r11
	mov r12,  [rsp+8*45]
	mov r11,r12
	mov qword [rsp+8*46],r11
	mov r12,  [rsp+8*46]
	mov r11,r12
	mov qword [rsp+8*47],r11
	mov r11,  [rsp+8*42]
	mov r12,  [rsp+8*47]
	mov r11,r11
	and r11,r12
	mov qword [rsp+8*42],r11
	mov r12,  [rsp+8*42]
	mov r11,r12
	mov qword [rsp+8*48],r11
	mov r12,  [rsp+8*48]
	mov r11,r12
	mov qword [rsp+8*62],r11
	mov r11,  [rsp+8*36]
	mov r12,  [rsp+8*62]
	mov qword [rsp+8*41],r15
	mov r15,r11
	xor r15,r12
	mov r11,r15
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*63],r15
	mov r15,  [rsp+8*37]
	mov r11,r15
	mov qword [rsp+8*64],r11
	mov r11,1
	mov r15,r15
	add r15,r11
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*49],r14
	mov qword [rsp+8*37],r15
	jmp L_2097
	
L_2098:
	mov r8,  [rsp+8*36]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,r11
	mov r14,  [rsp+8*32]
	mov r13,r14
	mov r15,r12
	mov qword rdi,r15
	mov qword rsi,r13
	mov r13,  rdi
	mov r15,r13
	mov qword [rsp+8*66],r10
	mov r10,  rsi
	mov r13,r10
	mov r10,r15
	mov rcx,r13
	shl r10,cl
	mov qword [rsp+8*65],r9
	mov r8,65535
	mov r9,r8
	mov qword rsi,r9
	mov qword [rsp+8*42],r10
	mov r10,65535
	mov r9,r10
	mov qword rdi,r9
	mov r10,  rdi
	mov r9,r10
	mov qword [rsp+8*43],r9
	mov r9,  rsi
	mov r10,r9
	mov r9,  [rsp+8*43]
	mov qword [rsp+8*44],r10
	mov r10,r9
	mov rcx,16
	shl r10,cl
	mov qword [rsp+8*45],r10
	mov r10,  [rsp+8*44]
	mov r9,  [rsp+8*45]
	or r9,r10
	mov qword [rsp+8*45],r9
	mov r10,  [rsp+8*45]
	mov r9,r10
	mov qword [rsp+8*46],r9
	mov r10,  [rsp+8*46]
	mov r9,r10
	mov qword [rsp+8*47],r9
	mov r9,  [rsp+8*42]
	mov r10,  [rsp+8*47]
	mov r9,r9
	and r9,r10
	mov qword [rsp+8*42],r9
	mov r10,  [rsp+8*42]
	mov r9,r10
	mov qword [rsp+8*48],r9
	mov r10,  [rsp+8*48]
	mov r9,r10
	mov r10,32
	mov r8,r10
	sub r8,r14
	mov qword [rsp+8*41],r13
	mov r13,r8
	mov qword rsi,r13
	mov r13,r12
	mov qword rdi,r13
	mov qword [rsp+8*40],r15
	mov r15,  rdi
	mov r13,r15
	mov qword [rsp+8*51],r13
	mov r13,  rsi
	mov r15,r13
	mov qword [rsp+8*52],r15
	mov r15,65535
	mov r13,r15
	mov qword rsi,r13
	mov r15,32767
	mov r13,r15
	mov qword rdi,r13
	mov r15,  rdi
	mov r13,r15
	mov qword [rsp+8*43],r13
	mov r13,  rsi
	mov r15,r13
	mov r13,  [rsp+8*43]
	mov qword [rsp+8*44],r15
	mov r15,r13
	mov rcx,16
	shl r15,cl
	mov qword [rsp+8*45],r15
	mov r15,  [rsp+8*44]
	mov r13,  [rsp+8*45]
	or r13,r15
	mov qword [rsp+8*45],r13
	mov r15,  [rsp+8*45]
	mov r13,r15
	mov qword [rsp+8*46],r13
	mov r15,  [rsp+8*46]
	mov r13,r15
	mov r15,r13
	mov qword [rsp+8*53],r13
	mov r13,  [rsp+8*52]
	mov qword [rsp+8*69],r9
	mov r9,r15
	mov rcx,r13
	shr r9,cl
	mov r9,r9
	mov rcx,1
	shl r9,cl
	mov qword [rsp+8*54],r15
	mov r15,1
	mov r9,r9
	add r9,r15
	mov r13,r9
	mov qword [rsp+8*54],r13
	mov r13,  [rsp+8*51]
	mov qword [rsp+8*55],r9
	mov r9,  [rsp+8*52]
	mov r15,r13
	mov rcx,r9
	shr r15,cl
	mov qword [rsp+8*56],r15
	mov r15,  [rsp+8*54]
	mov r9,  [rsp+8*56]
	and r9,r15
	mov r15,r9
	mov qword [rsp+8*54],r15
	mov qword [rsp+8*56],r9
	mov r9,65535
	mov r15,r9
	mov qword rsi,r15
	mov r9,65535
	mov r15,r9
	mov qword rdi,r15
	mov r9,  rdi
	mov r15,r9
	mov qword [rsp+8*43],r15
	mov r15,  rsi
	mov r9,r15
	mov r15,  [rsp+8*43]
	mov qword [rsp+8*44],r9
	mov r9,r15
	mov rcx,16
	shl r9,cl
	mov qword [rsp+8*45],r9
	mov r9,  [rsp+8*44]
	mov r15,  [rsp+8*45]
	or r15,r9
	mov qword [rsp+8*45],r15
	mov r9,  [rsp+8*45]
	mov r15,r9
	mov qword [rsp+8*46],r15
	mov r9,  [rsp+8*46]
	mov r15,r9
	mov r9,  [rsp+8*54]
	mov r13,r9
	and r13,r15
	mov qword [rsp+8*58],r13
	mov r9,  [rsp+8*58]
	mov r13,r9
	mov qword [rsp+8*59],r13
	mov r9,  [rsp+8*59]
	mov r13,r9
	mov r9,  [rsp+8*69]
	mov qword [rsp+8*57],r15
	mov r15,r9
	or r15,r13
	mov qword [rsp+8*72],r15
	mov r9,  [rsp+8*72]
	mov r15,r9
	mov qword [rsp+8*73],r15
	mov r9,  [rsp+8*73]
	mov r15,r9
	mov r9,r15
	mov qword [rsp+8*76],r15
	mov qword [rsp+8*77],r9
	mov r9,  [rsp+8*23]
	mov r15,r9
	mov qword [rsp+8*71],r13
	mov r13,  [rsp+8*14]
	mov r9,r13
	mov qword rsi,r9
	mov qword [rsp+8*68],r12
	mov r12,  [rsp+8*21]
	mov r9,r12
	mov qword rdi,r9
	mov r12,  rdi
	mov r9,r12
	mov qword [rsp+8*70],r8
	mov r8,  rsi
	mov r12,r8
	mov r8,r15
	mov r10,31
	mov r14,r8
	and r14,r10
	mov qword [rsp+8*67],r11
	mov r11,r14
	mov qword [rsp+8*32],r11
	mov r11,r12
	mov qword rsi,r11
	mov r11,r9
	mov qword rdi,r11
	mov qword [rsp+8*28],r9
	mov r9,  rdi
	mov r11,r9
	mov qword [rsp+8*33],r11
	mov r11,  rsi
	mov r9,r11
	mov r11,  [rsp+8*33]
	mov qword [rsp+8*34],r9
	mov r9,1
	mov qword [rsp+8*29],r12
	mov r12,r11
	add r12,r9
	mov qword [rsp+8*35],r12
	mov r9,  [rsp+8*35]
	mov r12,r9
	mov qword [rsp+8*36],r12
	mov r9,0
	mov r12,r9
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*37],r12
	mov qword [rsp+8*31],r14
	mov qword [arg+8*2],r15
	
L_2128:
	mov r8,  [rsp+8*34]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*37]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*38],r10
	mov qword [rsp+8*39],r12
	mov r8,  [rsp+8*39]
	cmp r8, 0
	je L_2129
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*36]
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
	mov qword [rsp+8*42],r14
	mov r14,  rsi
	mov r11,r14
	mov r14,r10
	mov rcx,16
	shl r14,cl
	or r14,r11
	mov qword [rsp+8*45],r14
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*45]
	mov r14,r11
	mov qword [rsp+8*46],r14
	mov r11,  [rsp+8*46]
	mov r14,r11
	mov qword [rsp+8*47],r14
	mov r14,  [rsp+8*42]
	mov r11,  [rsp+8*47]
	mov r14,r14
	and r14,r11
	mov qword [rsp+8*42],r14
	mov r11,  [rsp+8*42]
	mov r14,r11
	mov qword [rsp+8*48],r14
	mov r11,  [rsp+8*48]
	mov r14,r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*43],r10
	mov r10,r11
	xor r10,r14
	mov r11,r10
	mov qword [rsp+8*36],r11
	mov r8,17
	mov r11,r8
	mov qword rsi,r11
	mov r15,  [rsp+8*36]
	mov r11,r15
	mov qword rdi,r11
	mov r15,  rdi
	mov r11,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov qword [rsp+8*41],r13
	mov r13,65535
	mov r12,r13
	mov qword rsi,r12
	mov qword [rsp+8*51],r11
	mov r11,32767
	mov r12,r11
	mov qword rdi,r12
	mov qword [rsp+8*52],r15
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*43],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*43]
	mov qword [rsp+8*44],r15
	mov r15,r12
	mov rcx,16
	shl r15,cl
	mov qword [rsp+8*45],r15
	mov r15,  [rsp+8*44]
	mov r12,  [rsp+8*45]
	or r12,r15
	mov qword [rsp+8*45],r12
	mov r15,  [rsp+8*45]
	mov r12,r15
	mov qword [rsp+8*46],r12
	mov r15,  [rsp+8*46]
	mov r12,r15
	mov r15,r12
	mov qword [rsp+8*53],r12
	mov r12,  [rsp+8*52]
	mov r11,r15
	mov rcx,r12
	shr r11,cl
	mov r11,r11
	mov rcx,1
	shl r11,cl
	mov qword [rsp+8*54],r15
	mov r15,1
	mov r11,r11
	add r11,r15
	mov r12,r11
	mov qword [rsp+8*54],r12
	mov r12,  [rsp+8*51]
	mov qword [rsp+8*55],r11
	mov r11,  [rsp+8*52]
	mov r15,r12
	mov rcx,r11
	shr r15,cl
	mov qword [rsp+8*56],r15
	mov r15,  [rsp+8*54]
	mov r11,  [rsp+8*56]
	and r11,r15
	mov r15,r11
	mov qword [rsp+8*54],r15
	mov qword [rsp+8*56],r11
	mov r11,65535
	mov r15,r11
	mov qword rsi,r15
	mov r11,65535
	mov r15,r11
	mov qword rdi,r15
	mov r11,  rdi
	mov r15,r11
	mov qword [rsp+8*43],r15
	mov r15,  rsi
	mov r11,r15
	mov r15,  [rsp+8*43]
	mov qword [rsp+8*44],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	mov qword [rsp+8*45],r11
	mov r11,  [rsp+8*44]
	mov r15,  [rsp+8*45]
	or r15,r11
	mov qword [rsp+8*45],r15
	mov r11,  [rsp+8*45]
	mov r15,r11
	mov qword [rsp+8*46],r15
	mov r11,  [rsp+8*46]
	mov r15,r11
	mov r11,  [rsp+8*54]
	mov r12,r11
	and r12,r15
	mov qword [rsp+8*58],r12
	mov r11,  [rsp+8*58]
	mov r12,r11
	mov qword [rsp+8*59],r12
	mov r11,  [rsp+8*59]
	mov r12,r11
	mov qword [rsp+8*60],r12
	mov r12,  [rsp+8*36]
	mov r11,  [rsp+8*60]
	mov qword [rsp+8*57],r15
	mov r15,r12
	xor r15,r11
	mov r12,r15
	mov qword [rsp+8*36],r12
	mov qword [rsp+8*61],r15
	mov r15,5
	mov r12,r15
	mov qword rsi,r12
	mov r15,  [rsp+8*36]
	mov r12,r15
	mov qword rdi,r12
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*40]
	mov r11,r12
	mov rcx,r15
	shl r11,cl
	mov qword [rsp+8*42],r11
	mov r12,65535
	mov r11,r12
	mov qword rsi,r11
	mov r12,65535
	mov r11,r12
	mov qword rdi,r11
	mov r12,  rdi
	mov r11,r12
	mov qword [rsp+8*43],r11
	mov r11,  rsi
	mov r12,r11
	mov r11,  [rsp+8*43]
	mov qword [rsp+8*44],r12
	mov r12,r11
	mov rcx,16
	shl r12,cl
	mov qword [rsp+8*45],r12
	mov r12,  [rsp+8*44]
	mov r11,  [rsp+8*45]
	or r11,r12
	mov qword [rsp+8*45],r11
	mov r12,  [rsp+8*45]
	mov r11,r12
	mov qword [rsp+8*46],r11
	mov r12,  [rsp+8*46]
	mov r11,r12
	mov qword [rsp+8*47],r11
	mov r11,  [rsp+8*42]
	mov r12,  [rsp+8*47]
	mov r11,r11
	and r11,r12
	mov qword [rsp+8*42],r11
	mov r12,  [rsp+8*42]
	mov r11,r12
	mov qword [rsp+8*48],r11
	mov r12,  [rsp+8*48]
	mov r11,r12
	mov qword [rsp+8*62],r11
	mov r11,  [rsp+8*36]
	mov r12,  [rsp+8*62]
	mov qword [rsp+8*41],r15
	mov r15,r11
	xor r15,r12
	mov r11,r15
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*63],r15
	mov r15,  [rsp+8*37]
	mov r11,r15
	mov qword [rsp+8*64],r11
	mov r11,1
	mov r15,r15
	add r15,r11
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*49],r14
	mov qword [rsp+8*37],r15
	jmp L_2128
	
L_2129:
	mov r8,  [rsp+8*36]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,r11
	mov r14,  [rsp+8*32]
	mov r13,r14
	mov r15,r12
	mov qword rdi,r15
	mov qword rsi,r13
	mov r13,  rdi
	mov r15,r13
	mov qword [rsp+8*66],r10
	mov r10,  rsi
	mov r13,r10
	mov r10,r15
	mov rcx,r13
	shl r10,cl
	mov qword [rsp+8*65],r9
	mov r8,65535
	mov r9,r8
	mov qword rsi,r9
	mov qword [rsp+8*42],r10
	mov r10,65535
	mov r9,r10
	mov qword rdi,r9
	mov r10,  rdi
	mov r9,r10
	mov qword [rsp+8*43],r9
	mov r9,  rsi
	mov r10,r9
	mov r9,  [rsp+8*43]
	mov qword [rsp+8*44],r10
	mov r10,r9
	mov rcx,16
	shl r10,cl
	mov qword [rsp+8*45],r10
	mov r10,  [rsp+8*44]
	mov r9,  [rsp+8*45]
	or r9,r10
	mov qword [rsp+8*45],r9
	mov r10,  [rsp+8*45]
	mov r9,r10
	mov qword [rsp+8*46],r9
	mov r10,  [rsp+8*46]
	mov r9,r10
	mov qword [rsp+8*47],r9
	mov r9,  [rsp+8*42]
	mov r10,  [rsp+8*47]
	mov r9,r9
	and r9,r10
	mov qword [rsp+8*42],r9
	mov r10,  [rsp+8*42]
	mov r9,r10
	mov qword [rsp+8*48],r9
	mov r10,  [rsp+8*48]
	mov r9,r10
	mov r10,32
	mov r8,r10
	sub r8,r14
	mov qword [rsp+8*41],r13
	mov r13,r8
	mov qword rsi,r13
	mov r13,r12
	mov qword rdi,r13
	mov qword [rsp+8*40],r15
	mov r15,  rdi
	mov r13,r15
	mov qword [rsp+8*51],r13
	mov r13,  rsi
	mov r15,r13
	mov qword [rsp+8*52],r15
	mov r15,65535
	mov r13,r15
	mov qword rsi,r13
	mov r15,32767
	mov r13,r15
	mov qword rdi,r13
	mov r15,  rdi
	mov r13,r15
	mov qword [rsp+8*43],r13
	mov r13,  rsi
	mov r15,r13
	mov r13,  [rsp+8*43]
	mov qword [rsp+8*44],r15
	mov r15,r13
	mov rcx,16
	shl r15,cl
	mov qword [rsp+8*45],r15
	mov r15,  [rsp+8*44]
	mov r13,  [rsp+8*45]
	or r13,r15
	mov qword [rsp+8*45],r13
	mov r15,  [rsp+8*45]
	mov r13,r15
	mov qword [rsp+8*46],r13
	mov r15,  [rsp+8*46]
	mov r13,r15
	mov r15,r13
	mov qword [rsp+8*53],r13
	mov r13,  [rsp+8*52]
	mov qword [rsp+8*69],r9
	mov r9,r15
	mov rcx,r13
	shr r9,cl
	mov r9,r9
	mov rcx,1
	shl r9,cl
	mov qword [rsp+8*54],r15
	mov r15,1
	mov r9,r9
	add r9,r15
	mov r13,r9
	mov qword [rsp+8*54],r13
	mov r13,  [rsp+8*51]
	mov qword [rsp+8*55],r9
	mov r9,  [rsp+8*52]
	mov r15,r13
	mov rcx,r9
	shr r15,cl
	mov qword [rsp+8*56],r15
	mov r15,  [rsp+8*54]
	mov r9,  [rsp+8*56]
	and r9,r15
	mov r15,r9
	mov qword [rsp+8*54],r15
	mov qword [rsp+8*56],r9
	mov r9,65535
	mov r15,r9
	mov qword rsi,r15
	mov r9,65535
	mov r15,r9
	mov qword rdi,r15
	mov r9,  rdi
	mov r15,r9
	mov qword [rsp+8*43],r15
	mov r15,  rsi
	mov r9,r15
	mov r15,  [rsp+8*43]
	mov qword [rsp+8*44],r9
	mov r9,r15
	mov rcx,16
	shl r9,cl
	mov qword [rsp+8*45],r9
	mov r9,  [rsp+8*44]
	mov r15,  [rsp+8*45]
	or r15,r9
	mov qword [rsp+8*45],r15
	mov r9,  [rsp+8*45]
	mov r15,r9
	mov qword [rsp+8*46],r15
	mov r9,  [rsp+8*46]
	mov r15,r9
	mov r9,  [rsp+8*54]
	mov r13,r9
	and r13,r15
	mov qword [rsp+8*58],r13
	mov r9,  [rsp+8*58]
	mov r13,r9
	mov qword [rsp+8*59],r13
	mov r9,  [rsp+8*59]
	mov r13,r9
	mov r9,  [rsp+8*69]
	mov qword [rsp+8*57],r15
	mov r15,r9
	or r15,r13
	mov qword [rsp+8*72],r15
	mov r9,  [rsp+8*72]
	mov r15,r9
	mov qword [rsp+8*73],r15
	mov r9,  [rsp+8*73]
	mov r15,r9
	mov r9,r15
	mov qword [rsp+8*78],r15
	mov r15,  [rsp+8*19]
	mov qword [rsp+8*79],r9
	mov r9,  [rsp+8*21]
	mov qword [rsp+8*71],r13
	mov r13,r15
	xor r13,r9
	mov r9,  [rsp+8*23]
	mov r15,r9
	mov qword [rsp+8*68],r12
	mov r12,  [rsp+8*14]
	mov r9,r12
	mov r12,r13
	mov r13,r12
	mov qword rdi,r12
	mov r12,r9
	mov qword rsi,r9
	mov r9,r15
	mov qword [arg+8*2],r15
	mov r15,31
	mov qword [rsp+8*70],r8
	mov r8,r9
	and r8,r15
	mov r14,r8
	mov r8,r12
	mov qword [rsp+8*30],r9
	mov r9,r13
	mov qword [rsp+8*29],r12
	mov r12,r9
	mov qword [rsp+8*28],r13
	mov r13,r8
	mov r15,1
	mov qword rdi,r9
	mov r9,r12
	add r9,r15
	mov qword rsi,r8
	mov r8,r9
	mov qword [rsp+8*36],r8
	mov qword [rsp+8*34],r13
	mov r13,0
	mov r8,r13
	mov qword [rsp+8*37],r8
	mov qword [rsp+8*35],r9
	mov qword [rsp+8*67],r11
	mov qword [rsp+8*33],r12
	mov qword [rsp+8*32],r14
	
L_2159:
	mov r8,  [rsp+8*34]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*37]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*38],r10
	mov qword [rsp+8*39],r12
	mov r8,  [rsp+8*39]
	cmp r8, 0
	je L_2160
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*36]
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
	mov qword [rsp+8*42],r14
	mov r14,  rsi
	mov r11,r14
	mov r14,r10
	mov rcx,16
	shl r14,cl
	or r14,r11
	mov qword [rsp+8*45],r14
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*45]
	mov r14,r11
	mov qword [rsp+8*46],r14
	mov r11,  [rsp+8*46]
	mov r14,r11
	mov qword [rsp+8*47],r14
	mov r14,  [rsp+8*42]
	mov r11,  [rsp+8*47]
	mov r14,r14
	and r14,r11
	mov qword [rsp+8*42],r14
	mov r11,  [rsp+8*42]
	mov r14,r11
	mov qword [rsp+8*48],r14
	mov r11,  [rsp+8*48]
	mov r14,r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*43],r10
	mov r10,r11
	xor r10,r14
	mov r11,r10
	mov qword [rsp+8*36],r11
	mov r8,17
	mov r11,r8
	mov qword rsi,r11
	mov r15,  [rsp+8*36]
	mov r11,r15
	mov qword rdi,r11
	mov r15,  rdi
	mov r11,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov qword [rsp+8*41],r13
	mov r13,65535
	mov r12,r13
	mov qword rsi,r12
	mov qword [rsp+8*51],r11
	mov r11,32767
	mov r12,r11
	mov qword rdi,r12
	mov qword [rsp+8*52],r15
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*43],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*43]
	mov qword [rsp+8*44],r15
	mov r15,r12
	mov rcx,16
	shl r15,cl
	mov qword [rsp+8*45],r15
	mov r15,  [rsp+8*44]
	mov r12,  [rsp+8*45]
	or r12,r15
	mov qword [rsp+8*45],r12
	mov r15,  [rsp+8*45]
	mov r12,r15
	mov qword [rsp+8*46],r12
	mov r15,  [rsp+8*46]
	mov r12,r15
	mov r15,r12
	mov qword [rsp+8*53],r12
	mov r12,  [rsp+8*52]
	mov r11,r15
	mov rcx,r12
	shr r11,cl
	mov r11,r11
	mov rcx,1
	shl r11,cl
	mov qword [rsp+8*54],r15
	mov r15,1
	mov r11,r11
	add r11,r15
	mov r12,r11
	mov qword [rsp+8*54],r12
	mov r12,  [rsp+8*51]
	mov qword [rsp+8*55],r11
	mov r11,  [rsp+8*52]
	mov r15,r12
	mov rcx,r11
	shr r15,cl
	mov qword [rsp+8*56],r15
	mov r15,  [rsp+8*54]
	mov r11,  [rsp+8*56]
	and r11,r15
	mov r15,r11
	mov qword [rsp+8*54],r15
	mov qword [rsp+8*56],r11
	mov r11,65535
	mov r15,r11
	mov qword rsi,r15
	mov r11,65535
	mov r15,r11
	mov qword rdi,r15
	mov r11,  rdi
	mov r15,r11
	mov qword [rsp+8*43],r15
	mov r15,  rsi
	mov r11,r15
	mov r15,  [rsp+8*43]
	mov qword [rsp+8*44],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	mov qword [rsp+8*45],r11
	mov r11,  [rsp+8*44]
	mov r15,  [rsp+8*45]
	or r15,r11
	mov qword [rsp+8*45],r15
	mov r11,  [rsp+8*45]
	mov r15,r11
	mov qword [rsp+8*46],r15
	mov r11,  [rsp+8*46]
	mov r15,r11
	mov r11,  [rsp+8*54]
	mov r12,r11
	and r12,r15
	mov qword [rsp+8*58],r12
	mov r11,  [rsp+8*58]
	mov r12,r11
	mov qword [rsp+8*59],r12
	mov r11,  [rsp+8*59]
	mov r12,r11
	mov qword [rsp+8*60],r12
	mov r12,  [rsp+8*36]
	mov r11,  [rsp+8*60]
	mov qword [rsp+8*57],r15
	mov r15,r12
	xor r15,r11
	mov r12,r15
	mov qword [rsp+8*36],r12
	mov qword [rsp+8*61],r15
	mov r15,5
	mov r12,r15
	mov qword rsi,r12
	mov r15,  [rsp+8*36]
	mov r12,r15
	mov qword rdi,r12
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*40]
	mov r11,r12
	mov rcx,r15
	shl r11,cl
	mov qword [rsp+8*42],r11
	mov r12,65535
	mov r11,r12
	mov qword rsi,r11
	mov r12,65535
	mov r11,r12
	mov qword rdi,r11
	mov r12,  rdi
	mov r11,r12
	mov qword [rsp+8*43],r11
	mov r11,  rsi
	mov r12,r11
	mov r11,  [rsp+8*43]
	mov qword [rsp+8*44],r12
	mov r12,r11
	mov rcx,16
	shl r12,cl
	mov qword [rsp+8*45],r12
	mov r12,  [rsp+8*44]
	mov r11,  [rsp+8*45]
	or r11,r12
	mov qword [rsp+8*45],r11
	mov r12,  [rsp+8*45]
	mov r11,r12
	mov qword [rsp+8*46],r11
	mov r12,  [rsp+8*46]
	mov r11,r12
	mov qword [rsp+8*47],r11
	mov r11,  [rsp+8*42]
	mov r12,  [rsp+8*47]
	mov r11,r11
	and r11,r12
	mov qword [rsp+8*42],r11
	mov r12,  [rsp+8*42]
	mov r11,r12
	mov qword [rsp+8*48],r11
	mov r12,  [rsp+8*48]
	mov r11,r12
	mov qword [rsp+8*62],r11
	mov r11,  [rsp+8*36]
	mov r12,  [rsp+8*62]
	mov qword [rsp+8*41],r15
	mov r15,r11
	xor r15,r12
	mov r11,r15
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*63],r15
	mov r15,  [rsp+8*37]
	mov r11,r15
	mov qword [rsp+8*64],r11
	mov r11,1
	mov r15,r15
	add r15,r11
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*49],r14
	mov qword [rsp+8*37],r15
	jmp L_2159
	
L_2160:
	mov r8,  [rsp+8*36]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,r11
	mov r14,  [rsp+8*32]
	mov r13,r14
	mov r15,r12
	mov qword [rsp+8*67],r11
	mov r11,r15
	mov qword rdi,r15
	mov r15,r13
	mov qword rsi,r13
	mov r13,r11
	mov rcx,r15
	shl r13,cl
	mov qword [rsp+8*66],r10
	mov qword [rsp+8*65],r9
	mov r9,65535
	mov r10,r9
	mov qword rsi,r10
	mov r8,65535
	mov r10,r8
	mov qword rdi,r10
	mov qword [rsp+8*42],r13
	mov r13,  rdi
	mov r10,r13
	mov qword [rsp+8*43],r10
	mov r10,  rsi
	mov r13,r10
	mov r10,  [rsp+8*43]
	mov qword [rsp+8*44],r13
	mov r13,r10
	mov rcx,16
	shl r13,cl
	mov qword [rsp+8*45],r13
	mov r13,  [rsp+8*44]
	mov r10,  [rsp+8*45]
	or r10,r13
	mov qword [rsp+8*45],r10
	mov r13,  [rsp+8*45]
	mov r10,r13
	mov qword [rsp+8*46],r10
	mov r13,  [rsp+8*46]
	mov r10,r13
	mov qword [rsp+8*47],r10
	mov r10,  [rsp+8*42]
	mov r13,  [rsp+8*47]
	mov r10,r10
	and r10,r13
	mov qword [rsp+8*42],r10
	mov r13,  [rsp+8*42]
	mov r10,r13
	mov qword [rsp+8*48],r10
	mov r13,  [rsp+8*48]
	mov r10,r13
	mov r13,32
	mov r8,r13
	sub r8,r14
	mov r13,r8
	mov r8,r12
	mov qword [rsp+8*68],r12
	mov r12,r8
	mov r14,r13
	mov qword rdi,r8
	mov r8,65535
	mov r13,r8
	mov qword rsi,r13
	mov r9,32767
	mov r13,r9
	mov qword rdi,r13
	mov qword [rsp+8*40],r11
	mov r11,  rdi
	mov r13,r11
	mov qword [rsp+8*43],r13
	mov r13,  rsi
	mov r11,r13
	mov r13,  [rsp+8*43]
	mov qword [rsp+8*44],r11
	mov r11,r13
	mov rcx,16
	shl r11,cl
	mov qword [rsp+8*45],r11
	mov r11,  [rsp+8*44]
	mov r13,  [rsp+8*45]
	or r13,r11
	mov qword [rsp+8*45],r13
	mov r11,  [rsp+8*45]
	mov r13,r11
	mov qword [rsp+8*46],r13
	mov r11,  [rsp+8*46]
	mov r13,r11
	mov r11,r13
	mov qword [rsp+8*41],r15
	mov r15,r11
	mov rcx,r14
	shr r15,cl
	mov r15,r15
	mov rcx,1
	shl r15,cl
	mov qword [rsp+8*54],r11
	mov r11,1
	mov r15,r15
	add r15,r11
	mov qword [rsp+8*51],r12
	mov r12,r15
	mov qword [rsp+8*54],r12
	mov r12,  [rsp+8*51]
	mov qword [rsp+8*55],r15
	mov r15,r12
	mov rcx,r14
	shr r15,cl
	mov qword [rsp+8*56],r15
	mov r15,  [rsp+8*54]
	mov r12,  [rsp+8*56]
	and r12,r15
	mov r15,r12
	mov qword [rsp+8*54],r15
	mov qword [rsp+8*56],r12
	mov r12,65535
	mov r15,r12
	mov qword rsi,r15
	mov r12,65535
	mov r15,r12
	mov qword rdi,r15
	mov r12,  rdi
	mov r15,r12
	mov qword [rsp+8*43],r15
	mov r15,  rsi
	mov r12,r15
	mov r15,  [rsp+8*43]
	mov qword [rsp+8*44],r12
	mov r12,r15
	mov rcx,16
	shl r12,cl
	mov qword [rsp+8*45],r12
	mov r12,  [rsp+8*44]
	mov r15,  [rsp+8*45]
	or r15,r12
	mov qword [rsp+8*45],r15
	mov r12,  [rsp+8*45]
	mov r15,r12
	mov qword [rsp+8*46],r15
	mov r12,  [rsp+8*46]
	mov r15,r12
	mov r12,  [rsp+8*54]
	mov qword [rsp+8*52],r14
	mov r14,r12
	and r14,r15
	mov qword [rsp+8*58],r14
	mov r12,  [rsp+8*58]
	mov r14,r12
	mov qword [rsp+8*59],r14
	mov r12,  [rsp+8*59]
	mov r14,r12
	mov r12,r10
	or r12,r14
	mov qword [rsp+8*69],r10
	mov r10,r12
	mov r12,r10
	mov qword [rsp+8*73],r10
	mov r10,r12
	mov qword [rsp+8*81],r12
	mov qword [rsp+8*71],r14
	mov r14,1
	mov r12,r14
	mov qword rsi,r12
	mov r12,  [rsp+8*23]
	mov r14,r12
	mov qword rdi,r14
	mov r12,  rdi
	mov r14,r12
	mov qword [rsp+8*57],r15
	mov r15,  rsi
	mov r12,r15
	mov r15,1
	mov r11,r14
	add r11,r15
	mov qword [rsp+8*53],r13
	mov r13,r11
	mov qword [rsp+8*36],r13
	mov r9,0
	mov r13,r9
	mov qword [rsp+8*82],r10
	mov qword [rsp+8*35],r11
	mov qword [rsp+8*34],r12
	mov qword [rsp+8*37],r13
	mov qword [rsp+8*33],r14
	
L_1883:
	mov r8,  [rsp+8*34]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*37]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*38],r10
	mov qword [rsp+8*39],r12
	mov r8,  [rsp+8*39]
	cmp r8, 0
	je L_1884
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*36]
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
	mov qword [rsp+8*42],r14
	mov r14,  rsi
	mov r11,r14
	mov r14,r10
	mov rcx,16
	shl r14,cl
	or r14,r11
	mov qword [rsp+8*45],r14
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*45]
	mov r14,r11
	mov qword [rsp+8*46],r14
	mov r11,  [rsp+8*46]
	mov r14,r11
	mov qword [rsp+8*47],r14
	mov r14,  [rsp+8*42]
	mov r11,  [rsp+8*47]
	mov r14,r14
	and r14,r11
	mov qword [rsp+8*42],r14
	mov r11,  [rsp+8*42]
	mov r14,r11
	mov qword [rsp+8*48],r14
	mov r11,  [rsp+8*48]
	mov r14,r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*43],r10
	mov r10,r11
	xor r10,r14
	mov r11,r10
	mov qword [rsp+8*36],r11
	mov r8,17
	mov r11,r8
	mov qword rsi,r11
	mov r15,  [rsp+8*36]
	mov r11,r15
	mov qword rdi,r11
	mov r15,  rdi
	mov r11,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov qword [rsp+8*41],r13
	mov r13,65535
	mov r12,r13
	mov qword rsi,r12
	mov qword [rsp+8*51],r11
	mov r11,32767
	mov r12,r11
	mov qword rdi,r12
	mov qword [rsp+8*52],r15
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*43],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*43]
	mov qword [rsp+8*44],r15
	mov r15,r12
	mov rcx,16
	shl r15,cl
	mov qword [rsp+8*45],r15
	mov r15,  [rsp+8*44]
	mov r12,  [rsp+8*45]
	or r12,r15
	mov qword [rsp+8*45],r12
	mov r15,  [rsp+8*45]
	mov r12,r15
	mov qword [rsp+8*46],r12
	mov r15,  [rsp+8*46]
	mov r12,r15
	mov r15,r12
	mov qword [rsp+8*53],r12
	mov r12,  [rsp+8*52]
	mov r11,r15
	mov rcx,r12
	shr r11,cl
	mov r11,r11
	mov rcx,1
	shl r11,cl
	mov qword [rsp+8*54],r15
	mov r15,1
	mov r11,r11
	add r11,r15
	mov r12,r11
	mov qword [rsp+8*54],r12
	mov r12,  [rsp+8*51]
	mov qword [rsp+8*55],r11
	mov r11,  [rsp+8*52]
	mov r15,r12
	mov rcx,r11
	shr r15,cl
	mov qword [rsp+8*56],r15
	mov r15,  [rsp+8*54]
	mov r11,  [rsp+8*56]
	and r11,r15
	mov r15,r11
	mov qword [rsp+8*54],r15
	mov qword [rsp+8*56],r11
	mov r11,65535
	mov r15,r11
	mov qword rsi,r15
	mov r11,65535
	mov r15,r11
	mov qword rdi,r15
	mov r11,  rdi
	mov r15,r11
	mov qword [rsp+8*43],r15
	mov r15,  rsi
	mov r11,r15
	mov r15,  [rsp+8*43]
	mov qword [rsp+8*44],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	mov qword [rsp+8*45],r11
	mov r11,  [rsp+8*44]
	mov r15,  [rsp+8*45]
	or r15,r11
	mov qword [rsp+8*45],r15
	mov r11,  [rsp+8*45]
	mov r15,r11
	mov qword [rsp+8*46],r15
	mov r11,  [rsp+8*46]
	mov r15,r11
	mov r11,  [rsp+8*54]
	mov r12,r11
	and r12,r15
	mov qword [rsp+8*58],r12
	mov r11,  [rsp+8*58]
	mov r12,r11
	mov qword [rsp+8*59],r12
	mov r11,  [rsp+8*59]
	mov r12,r11
	mov qword [rsp+8*60],r12
	mov r12,  [rsp+8*36]
	mov r11,  [rsp+8*60]
	mov qword [rsp+8*57],r15
	mov r15,r12
	xor r15,r11
	mov r12,r15
	mov qword [rsp+8*36],r12
	mov qword [rsp+8*61],r15
	mov r15,5
	mov r12,r15
	mov qword rsi,r12
	mov r15,  [rsp+8*36]
	mov r12,r15
	mov qword rdi,r12
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*40]
	mov r11,r12
	mov rcx,r15
	shl r11,cl
	mov qword [rsp+8*42],r11
	mov r12,65535
	mov r11,r12
	mov qword rsi,r11
	mov r12,65535
	mov r11,r12
	mov qword rdi,r11
	mov r12,  rdi
	mov r11,r12
	mov qword [rsp+8*43],r11
	mov r11,  rsi
	mov r12,r11
	mov r11,  [rsp+8*43]
	mov qword [rsp+8*44],r12
	mov r12,r11
	mov rcx,16
	shl r12,cl
	mov qword [rsp+8*45],r12
	mov r12,  [rsp+8*44]
	mov r11,  [rsp+8*45]
	or r11,r12
	mov qword [rsp+8*45],r11
	mov r12,  [rsp+8*45]
	mov r11,r12
	mov qword [rsp+8*46],r11
	mov r12,  [rsp+8*46]
	mov r11,r12
	mov qword [rsp+8*47],r11
	mov r11,  [rsp+8*42]
	mov r12,  [rsp+8*47]
	mov r11,r11
	and r11,r12
	mov qword [rsp+8*42],r11
	mov r12,  [rsp+8*42]
	mov r11,r12
	mov qword [rsp+8*48],r11
	mov r12,  [rsp+8*48]
	mov r11,r12
	mov qword [rsp+8*62],r11
	mov r11,  [rsp+8*36]
	mov r12,  [rsp+8*62]
	mov qword [rsp+8*41],r15
	mov r15,r11
	xor r15,r12
	mov r11,r15
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*63],r15
	mov r15,  [rsp+8*37]
	mov r11,r15
	mov qword [rsp+8*64],r11
	mov r11,1
	mov r15,r15
	add r15,r11
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*49],r14
	mov qword [rsp+8*37],r15
	jmp L_1883
	
L_1884:
	mov r8,  [rsp+8*36]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r13,1
	mov r12,r13
	mov r15,  [rsp+8*21]
	mov r14,r15
	mov r13,r14
	mov qword rdi,r14
	mov r14,r12
	mov qword rsi,r12
	mov r12,1
	mov r15,r13
	add r15,r12
	mov r8,r15
	mov qword [rsp+8*66],r10
	mov qword [rsp+8*65],r9
	mov r9,0
	mov r10,r9
	mov qword [rsp+8*36],r8
	mov qword [rsp+8*37],r10
	mov qword [rsp+8*83],r11
	mov qword [rsp+8*33],r13
	mov qword [rsp+8*34],r14
	mov qword [rsp+8*35],r15
	
L_1902:
	mov r8,  [rsp+8*34]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*37]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*38],r10
	mov qword [rsp+8*39],r12
	mov r8,  [rsp+8*39]
	cmp r8, 0
	je L_1903
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*36]
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
	mov qword [rsp+8*42],r14
	mov r14,  rsi
	mov r11,r14
	mov r14,r10
	mov rcx,16
	shl r14,cl
	or r14,r11
	mov qword [rsp+8*45],r14
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*45]
	mov r14,r11
	mov qword [rsp+8*46],r14
	mov r11,  [rsp+8*46]
	mov r14,r11
	mov qword [rsp+8*47],r14
	mov r14,  [rsp+8*42]
	mov r11,  [rsp+8*47]
	mov r14,r14
	and r14,r11
	mov qword [rsp+8*42],r14
	mov r11,  [rsp+8*42]
	mov r14,r11
	mov qword [rsp+8*48],r14
	mov r11,  [rsp+8*48]
	mov r14,r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*43],r10
	mov r10,r11
	xor r10,r14
	mov r11,r10
	mov qword [rsp+8*36],r11
	mov r8,17
	mov r11,r8
	mov qword rsi,r11
	mov r15,  [rsp+8*36]
	mov r11,r15
	mov qword rdi,r11
	mov r15,  rdi
	mov r11,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov qword [rsp+8*41],r13
	mov r13,65535
	mov r12,r13
	mov qword rsi,r12
	mov qword [rsp+8*51],r11
	mov r11,32767
	mov r12,r11
	mov qword rdi,r12
	mov qword [rsp+8*52],r15
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*43],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*43]
	mov qword [rsp+8*44],r15
	mov r15,r12
	mov rcx,16
	shl r15,cl
	mov qword [rsp+8*45],r15
	mov r15,  [rsp+8*44]
	mov r12,  [rsp+8*45]
	or r12,r15
	mov qword [rsp+8*45],r12
	mov r15,  [rsp+8*45]
	mov r12,r15
	mov qword [rsp+8*46],r12
	mov r15,  [rsp+8*46]
	mov r12,r15
	mov r15,r12
	mov qword [rsp+8*53],r12
	mov r12,  [rsp+8*52]
	mov r11,r15
	mov rcx,r12
	shr r11,cl
	mov r11,r11
	mov rcx,1
	shl r11,cl
	mov qword [rsp+8*54],r15
	mov r15,1
	mov r11,r11
	add r11,r15
	mov r12,r11
	mov qword [rsp+8*54],r12
	mov r12,  [rsp+8*51]
	mov qword [rsp+8*55],r11
	mov r11,  [rsp+8*52]
	mov r15,r12
	mov rcx,r11
	shr r15,cl
	mov qword [rsp+8*56],r15
	mov r15,  [rsp+8*54]
	mov r11,  [rsp+8*56]
	and r11,r15
	mov r15,r11
	mov qword [rsp+8*54],r15
	mov qword [rsp+8*56],r11
	mov r11,65535
	mov r15,r11
	mov qword rsi,r15
	mov r11,65535
	mov r15,r11
	mov qword rdi,r15
	mov r11,  rdi
	mov r15,r11
	mov qword [rsp+8*43],r15
	mov r15,  rsi
	mov r11,r15
	mov r15,  [rsp+8*43]
	mov qword [rsp+8*44],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	mov qword [rsp+8*45],r11
	mov r11,  [rsp+8*44]
	mov r15,  [rsp+8*45]
	or r15,r11
	mov qword [rsp+8*45],r15
	mov r11,  [rsp+8*45]
	mov r15,r11
	mov qword [rsp+8*46],r15
	mov r11,  [rsp+8*46]
	mov r15,r11
	mov r11,  [rsp+8*54]
	mov r12,r11
	and r12,r15
	mov qword [rsp+8*58],r12
	mov r11,  [rsp+8*58]
	mov r12,r11
	mov qword [rsp+8*59],r12
	mov r11,  [rsp+8*59]
	mov r12,r11
	mov qword [rsp+8*60],r12
	mov r12,  [rsp+8*36]
	mov r11,  [rsp+8*60]
	mov qword [rsp+8*57],r15
	mov r15,r12
	xor r15,r11
	mov r12,r15
	mov qword [rsp+8*36],r12
	mov qword [rsp+8*61],r15
	mov r15,5
	mov r12,r15
	mov qword rsi,r12
	mov r15,  [rsp+8*36]
	mov r12,r15
	mov qword rdi,r12
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*40]
	mov r11,r12
	mov rcx,r15
	shl r11,cl
	mov qword [rsp+8*42],r11
	mov r12,65535
	mov r11,r12
	mov qword rsi,r11
	mov r12,65535
	mov r11,r12
	mov qword rdi,r11
	mov r12,  rdi
	mov r11,r12
	mov qword [rsp+8*43],r11
	mov r11,  rsi
	mov r12,r11
	mov r11,  [rsp+8*43]
	mov qword [rsp+8*44],r12
	mov r12,r11
	mov rcx,16
	shl r12,cl
	mov qword [rsp+8*45],r12
	mov r12,  [rsp+8*44]
	mov r11,  [rsp+8*45]
	or r11,r12
	mov qword [rsp+8*45],r11
	mov r12,  [rsp+8*45]
	mov r11,r12
	mov qword [rsp+8*46],r11
	mov r12,  [rsp+8*46]
	mov r11,r12
	mov qword [rsp+8*47],r11
	mov r11,  [rsp+8*42]
	mov r12,  [rsp+8*47]
	mov r11,r11
	and r11,r12
	mov qword [rsp+8*42],r11
	mov r12,  [rsp+8*42]
	mov r11,r12
	mov qword [rsp+8*48],r11
	mov r12,  [rsp+8*48]
	mov r11,r12
	mov qword [rsp+8*62],r11
	mov r11,  [rsp+8*36]
	mov r12,  [rsp+8*62]
	mov qword [rsp+8*41],r15
	mov r15,r11
	xor r15,r12
	mov r11,r15
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*63],r15
	mov r15,  [rsp+8*37]
	mov r11,r15
	mov qword [rsp+8*64],r11
	mov r11,1
	mov r15,r15
	add r15,r11
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*49],r14
	mov qword [rsp+8*37],r15
	jmp L_1902
	
L_1903:
	mov r8,  [rsp+8*36]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,  [rsp+8*83]
	mov r13,r12
	xor r13,r11
	mov r15,1
	mov r14,r15
	mov qword [rsp+8*84],r11
	mov r12,  [rsp+8*19]
	mov r11,r12
	mov r15,r11
	mov qword rdi,r11
	mov r11,r14
	mov qword rsi,r14
	mov r14,1
	mov r12,r15
	add r12,r14
	mov r8,r12
	mov qword [rsp+8*66],r10
	mov qword [rsp+8*65],r9
	mov r9,0
	mov r10,r9
	mov qword [rsp+8*36],r8
	mov qword [rsp+8*37],r10
	mov qword [rsp+8*34],r11
	mov qword [rsp+8*35],r12
	mov qword [rsp+8*85],r13
	mov qword [rsp+8*33],r15
	
L_1921:
	mov r8,  [rsp+8*34]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*37]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*38],r10
	mov qword [rsp+8*39],r12
	mov r8,  [rsp+8*39]
	cmp r8, 0
	je L_1922
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*36]
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
	mov qword [rsp+8*42],r14
	mov r14,  rsi
	mov r11,r14
	mov r14,r10
	mov rcx,16
	shl r14,cl
	or r14,r11
	mov qword [rsp+8*45],r14
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*45]
	mov r14,r11
	mov qword [rsp+8*46],r14
	mov r11,  [rsp+8*46]
	mov r14,r11
	mov qword [rsp+8*47],r14
	mov r14,  [rsp+8*42]
	mov r11,  [rsp+8*47]
	mov r14,r14
	and r14,r11
	mov qword [rsp+8*42],r14
	mov r11,  [rsp+8*42]
	mov r14,r11
	mov qword [rsp+8*48],r14
	mov r11,  [rsp+8*48]
	mov r14,r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*43],r10
	mov r10,r11
	xor r10,r14
	mov r11,r10
	mov qword [rsp+8*36],r11
	mov r8,17
	mov r11,r8
	mov qword rsi,r11
	mov r15,  [rsp+8*36]
	mov r11,r15
	mov qword rdi,r11
	mov r15,  rdi
	mov r11,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov qword [rsp+8*41],r13
	mov r13,65535
	mov r12,r13
	mov qword rsi,r12
	mov qword [rsp+8*51],r11
	mov r11,32767
	mov r12,r11
	mov qword rdi,r12
	mov qword [rsp+8*52],r15
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*43],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*43]
	mov qword [rsp+8*44],r15
	mov r15,r12
	mov rcx,16
	shl r15,cl
	mov qword [rsp+8*45],r15
	mov r15,  [rsp+8*44]
	mov r12,  [rsp+8*45]
	or r12,r15
	mov qword [rsp+8*45],r12
	mov r15,  [rsp+8*45]
	mov r12,r15
	mov qword [rsp+8*46],r12
	mov r15,  [rsp+8*46]
	mov r12,r15
	mov r15,r12
	mov qword [rsp+8*53],r12
	mov r12,  [rsp+8*52]
	mov r11,r15
	mov rcx,r12
	shr r11,cl
	mov r11,r11
	mov rcx,1
	shl r11,cl
	mov qword [rsp+8*54],r15
	mov r15,1
	mov r11,r11
	add r11,r15
	mov r12,r11
	mov qword [rsp+8*54],r12
	mov r12,  [rsp+8*51]
	mov qword [rsp+8*55],r11
	mov r11,  [rsp+8*52]
	mov r15,r12
	mov rcx,r11
	shr r15,cl
	mov qword [rsp+8*56],r15
	mov r15,  [rsp+8*54]
	mov r11,  [rsp+8*56]
	and r11,r15
	mov r15,r11
	mov qword [rsp+8*54],r15
	mov qword [rsp+8*56],r11
	mov r11,65535
	mov r15,r11
	mov qword rsi,r15
	mov r11,65535
	mov r15,r11
	mov qword rdi,r15
	mov r11,  rdi
	mov r15,r11
	mov qword [rsp+8*43],r15
	mov r15,  rsi
	mov r11,r15
	mov r15,  [rsp+8*43]
	mov qword [rsp+8*44],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	mov qword [rsp+8*45],r11
	mov r11,  [rsp+8*44]
	mov r15,  [rsp+8*45]
	or r15,r11
	mov qword [rsp+8*45],r15
	mov r11,  [rsp+8*45]
	mov r15,r11
	mov qword [rsp+8*46],r15
	mov r11,  [rsp+8*46]
	mov r15,r11
	mov r11,  [rsp+8*54]
	mov r12,r11
	and r12,r15
	mov qword [rsp+8*58],r12
	mov r11,  [rsp+8*58]
	mov r12,r11
	mov qword [rsp+8*59],r12
	mov r11,  [rsp+8*59]
	mov r12,r11
	mov qword [rsp+8*60],r12
	mov r12,  [rsp+8*36]
	mov r11,  [rsp+8*60]
	mov qword [rsp+8*57],r15
	mov r15,r12
	xor r15,r11
	mov r12,r15
	mov qword [rsp+8*36],r12
	mov qword [rsp+8*61],r15
	mov r15,5
	mov r12,r15
	mov qword rsi,r12
	mov r15,  [rsp+8*36]
	mov r12,r15
	mov qword rdi,r12
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*40]
	mov r11,r12
	mov rcx,r15
	shl r11,cl
	mov qword [rsp+8*42],r11
	mov r12,65535
	mov r11,r12
	mov qword rsi,r11
	mov r12,65535
	mov r11,r12
	mov qword rdi,r11
	mov r12,  rdi
	mov r11,r12
	mov qword [rsp+8*43],r11
	mov r11,  rsi
	mov r12,r11
	mov r11,  [rsp+8*43]
	mov qword [rsp+8*44],r12
	mov r12,r11
	mov rcx,16
	shl r12,cl
	mov qword [rsp+8*45],r12
	mov r12,  [rsp+8*44]
	mov r11,  [rsp+8*45]
	or r11,r12
	mov qword [rsp+8*45],r11
	mov r12,  [rsp+8*45]
	mov r11,r12
	mov qword [rsp+8*46],r11
	mov r12,  [rsp+8*46]
	mov r11,r12
	mov qword [rsp+8*47],r11
	mov r11,  [rsp+8*42]
	mov r12,  [rsp+8*47]
	mov r11,r11
	and r11,r12
	mov qword [rsp+8*42],r11
	mov r12,  [rsp+8*42]
	mov r11,r12
	mov qword [rsp+8*48],r11
	mov r12,  [rsp+8*48]
	mov r11,r12
	mov qword [rsp+8*62],r11
	mov r11,  [rsp+8*36]
	mov r12,  [rsp+8*62]
	mov qword [rsp+8*41],r15
	mov r15,r11
	xor r15,r12
	mov r11,r15
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*63],r15
	mov r15,  [rsp+8*37]
	mov r11,r15
	mov qword [rsp+8*64],r11
	mov r11,1
	mov r15,r15
	add r15,r11
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*49],r14
	mov qword [rsp+8*37],r15
	jmp L_1921
	
L_1922:
	mov r8,  [rsp+8*36]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,  [rsp+8*85]
	mov r12,r12
	xor r12,r11
	mov r13,r12
	mov r14,  [rsp+8*75]
	mov r15,r14
	xor r15,r13
	mov qword [rsp+8*86],r11
	mov r12,1
	mov r11,r12
	mov r12,r15
	mov r14,r12
	mov r15,r11
	mov qword rdi,r12
	mov r12,1
	mov qword rsi,r11
	mov r11,r14
	add r11,r12
	mov r8,r11
	mov qword [rsp+8*66],r10
	mov qword [rsp+8*65],r9
	mov r9,0
	mov r10,r9
	mov qword [rsp+8*36],r8
	mov qword [rsp+8*37],r10
	mov qword [rsp+8*35],r11
	mov qword [rsp+8*87],r13
	mov qword [rsp+8*33],r14
	mov qword [rsp+8*34],r15
	
L_1940:
	mov r8,  [rsp+8*34]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*37]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*38],r10
	mov qword [rsp+8*39],r12
	mov r8,  [rsp+8*39]
	cmp r8, 0
	je L_1941
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*36]
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
	mov qword [rsp+8*42],r14
	mov r14,  rsi
	mov r11,r14
	mov r14,r10
	mov rcx,16
	shl r14,cl
	or r14,r11
	mov qword [rsp+8*45],r14
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*45]
	mov r14,r11
	mov qword [rsp+8*46],r14
	mov r11,  [rsp+8*46]
	mov r14,r11
	mov qword [rsp+8*47],r14
	mov r14,  [rsp+8*42]
	mov r11,  [rsp+8*47]
	mov r14,r14
	and r14,r11
	mov qword [rsp+8*42],r14
	mov r11,  [rsp+8*42]
	mov r14,r11
	mov qword [rsp+8*48],r14
	mov r11,  [rsp+8*48]
	mov r14,r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*43],r10
	mov r10,r11
	xor r10,r14
	mov r11,r10
	mov qword [rsp+8*36],r11
	mov r8,17
	mov r11,r8
	mov qword rsi,r11
	mov r15,  [rsp+8*36]
	mov r11,r15
	mov qword rdi,r11
	mov r15,  rdi
	mov r11,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov qword [rsp+8*41],r13
	mov r13,65535
	mov r12,r13
	mov qword rsi,r12
	mov qword [rsp+8*51],r11
	mov r11,32767
	mov r12,r11
	mov qword rdi,r12
	mov qword [rsp+8*52],r15
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*43],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*43]
	mov qword [rsp+8*44],r15
	mov r15,r12
	mov rcx,16
	shl r15,cl
	mov qword [rsp+8*45],r15
	mov r15,  [rsp+8*44]
	mov r12,  [rsp+8*45]
	or r12,r15
	mov qword [rsp+8*45],r12
	mov r15,  [rsp+8*45]
	mov r12,r15
	mov qword [rsp+8*46],r12
	mov r15,  [rsp+8*46]
	mov r12,r15
	mov r15,r12
	mov qword [rsp+8*53],r12
	mov r12,  [rsp+8*52]
	mov r11,r15
	mov rcx,r12
	shr r11,cl
	mov r11,r11
	mov rcx,1
	shl r11,cl
	mov qword [rsp+8*54],r15
	mov r15,1
	mov r11,r11
	add r11,r15
	mov r12,r11
	mov qword [rsp+8*54],r12
	mov r12,  [rsp+8*51]
	mov qword [rsp+8*55],r11
	mov r11,  [rsp+8*52]
	mov r15,r12
	mov rcx,r11
	shr r15,cl
	mov qword [rsp+8*56],r15
	mov r15,  [rsp+8*54]
	mov r11,  [rsp+8*56]
	and r11,r15
	mov r15,r11
	mov qword [rsp+8*54],r15
	mov qword [rsp+8*56],r11
	mov r11,65535
	mov r15,r11
	mov qword rsi,r15
	mov r11,65535
	mov r15,r11
	mov qword rdi,r15
	mov r11,  rdi
	mov r15,r11
	mov qword [rsp+8*43],r15
	mov r15,  rsi
	mov r11,r15
	mov r15,  [rsp+8*43]
	mov qword [rsp+8*44],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	mov qword [rsp+8*45],r11
	mov r11,  [rsp+8*44]
	mov r15,  [rsp+8*45]
	or r15,r11
	mov qword [rsp+8*45],r15
	mov r11,  [rsp+8*45]
	mov r15,r11
	mov qword [rsp+8*46],r15
	mov r11,  [rsp+8*46]
	mov r15,r11
	mov r11,  [rsp+8*54]
	mov r12,r11
	and r12,r15
	mov qword [rsp+8*58],r12
	mov r11,  [rsp+8*58]
	mov r12,r11
	mov qword [rsp+8*59],r12
	mov r11,  [rsp+8*59]
	mov r12,r11
	mov qword [rsp+8*60],r12
	mov r12,  [rsp+8*36]
	mov r11,  [rsp+8*60]
	mov qword [rsp+8*57],r15
	mov r15,r12
	xor r15,r11
	mov r12,r15
	mov qword [rsp+8*36],r12
	mov qword [rsp+8*61],r15
	mov r15,5
	mov r12,r15
	mov qword rsi,r12
	mov r15,  [rsp+8*36]
	mov r12,r15
	mov qword rdi,r12
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*40]
	mov r11,r12
	mov rcx,r15
	shl r11,cl
	mov qword [rsp+8*42],r11
	mov r12,65535
	mov r11,r12
	mov qword rsi,r11
	mov r12,65535
	mov r11,r12
	mov qword rdi,r11
	mov r12,  rdi
	mov r11,r12
	mov qword [rsp+8*43],r11
	mov r11,  rsi
	mov r12,r11
	mov r11,  [rsp+8*43]
	mov qword [rsp+8*44],r12
	mov r12,r11
	mov rcx,16
	shl r12,cl
	mov qword [rsp+8*45],r12
	mov r12,  [rsp+8*44]
	mov r11,  [rsp+8*45]
	or r11,r12
	mov qword [rsp+8*45],r11
	mov r12,  [rsp+8*45]
	mov r11,r12
	mov qword [rsp+8*46],r11
	mov r12,  [rsp+8*46]
	mov r11,r12
	mov qword [rsp+8*47],r11
	mov r11,  [rsp+8*42]
	mov r12,  [rsp+8*47]
	mov r11,r11
	and r11,r12
	mov qword [rsp+8*42],r11
	mov r12,  [rsp+8*42]
	mov r11,r12
	mov qword [rsp+8*48],r11
	mov r12,  [rsp+8*48]
	mov r11,r12
	mov qword [rsp+8*62],r11
	mov r11,  [rsp+8*36]
	mov r12,  [rsp+8*62]
	mov qword [rsp+8*41],r15
	mov r15,r11
	xor r15,r12
	mov r11,r15
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*63],r15
	mov r15,  [rsp+8*37]
	mov r11,r15
	mov qword [rsp+8*64],r11
	mov r11,1
	mov r15,r15
	add r15,r11
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*49],r14
	mov qword [rsp+8*37],r15
	jmp L_1940
	
L_1941:
	mov r8,  [rsp+8*36]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,  [rsp+8*15]
	mov r13,r12
	add r13,r11
	mov r12,r13
	mov r14,  [rsp+8*77]
	mov r15,  [rsp+8*87]
	mov qword [rsp+8*89],r11
	mov r11,r14
	xor r11,r15
	mov r14,1
	mov r13,r14
	mov r14,r11
	mov r11,r14
	mov qword rdi,r14
	mov r14,r13
	mov qword rsi,r13
	mov r13,1
	mov qword [rsp+8*15],r12
	mov r12,r11
	add r12,r13
	mov r8,r12
	mov qword [rsp+8*66],r10
	mov qword [rsp+8*65],r9
	mov r9,0
	mov r10,r9
	mov qword [rsp+8*36],r8
	mov qword [rsp+8*37],r10
	mov qword [rsp+8*33],r11
	mov qword [rsp+8*35],r12
	mov qword [rsp+8*34],r14
	
L_1959:
	mov r8,  [rsp+8*34]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*37]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*38],r10
	mov qword [rsp+8*39],r12
	mov r8,  [rsp+8*39]
	cmp r8, 0
	je L_1960
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*36]
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
	mov qword [rsp+8*42],r14
	mov r14,  rsi
	mov r11,r14
	mov r14,r10
	mov rcx,16
	shl r14,cl
	or r14,r11
	mov qword [rsp+8*45],r14
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*45]
	mov r14,r11
	mov qword [rsp+8*46],r14
	mov r11,  [rsp+8*46]
	mov r14,r11
	mov qword [rsp+8*47],r14
	mov r14,  [rsp+8*42]
	mov r11,  [rsp+8*47]
	mov r14,r14
	and r14,r11
	mov qword [rsp+8*42],r14
	mov r11,  [rsp+8*42]
	mov r14,r11
	mov qword [rsp+8*48],r14
	mov r11,  [rsp+8*48]
	mov r14,r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*43],r10
	mov r10,r11
	xor r10,r14
	mov r11,r10
	mov qword [rsp+8*36],r11
	mov r8,17
	mov r11,r8
	mov qword rsi,r11
	mov r15,  [rsp+8*36]
	mov r11,r15
	mov qword rdi,r11
	mov r15,  rdi
	mov r11,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov qword [rsp+8*41],r13
	mov r13,65535
	mov r12,r13
	mov qword rsi,r12
	mov qword [rsp+8*51],r11
	mov r11,32767
	mov r12,r11
	mov qword rdi,r12
	mov qword [rsp+8*52],r15
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*43],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*43]
	mov qword [rsp+8*44],r15
	mov r15,r12
	mov rcx,16
	shl r15,cl
	mov qword [rsp+8*45],r15
	mov r15,  [rsp+8*44]
	mov r12,  [rsp+8*45]
	or r12,r15
	mov qword [rsp+8*45],r12
	mov r15,  [rsp+8*45]
	mov r12,r15
	mov qword [rsp+8*46],r12
	mov r15,  [rsp+8*46]
	mov r12,r15
	mov r15,r12
	mov qword [rsp+8*53],r12
	mov r12,  [rsp+8*52]
	mov r11,r15
	mov rcx,r12
	shr r11,cl
	mov r11,r11
	mov rcx,1
	shl r11,cl
	mov qword [rsp+8*54],r15
	mov r15,1
	mov r11,r11
	add r11,r15
	mov r12,r11
	mov qword [rsp+8*54],r12
	mov r12,  [rsp+8*51]
	mov qword [rsp+8*55],r11
	mov r11,  [rsp+8*52]
	mov r15,r12
	mov rcx,r11
	shr r15,cl
	mov qword [rsp+8*56],r15
	mov r15,  [rsp+8*54]
	mov r11,  [rsp+8*56]
	and r11,r15
	mov r15,r11
	mov qword [rsp+8*54],r15
	mov qword [rsp+8*56],r11
	mov r11,65535
	mov r15,r11
	mov qword rsi,r15
	mov r11,65535
	mov r15,r11
	mov qword rdi,r15
	mov r11,  rdi
	mov r15,r11
	mov qword [rsp+8*43],r15
	mov r15,  rsi
	mov r11,r15
	mov r15,  [rsp+8*43]
	mov qword [rsp+8*44],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	mov qword [rsp+8*45],r11
	mov r11,  [rsp+8*44]
	mov r15,  [rsp+8*45]
	or r15,r11
	mov qword [rsp+8*45],r15
	mov r11,  [rsp+8*45]
	mov r15,r11
	mov qword [rsp+8*46],r15
	mov r11,  [rsp+8*46]
	mov r15,r11
	mov r11,  [rsp+8*54]
	mov r12,r11
	and r12,r15
	mov qword [rsp+8*58],r12
	mov r11,  [rsp+8*58]
	mov r12,r11
	mov qword [rsp+8*59],r12
	mov r11,  [rsp+8*59]
	mov r12,r11
	mov qword [rsp+8*60],r12
	mov r12,  [rsp+8*36]
	mov r11,  [rsp+8*60]
	mov qword [rsp+8*57],r15
	mov r15,r12
	xor r15,r11
	mov r12,r15
	mov qword [rsp+8*36],r12
	mov qword [rsp+8*61],r15
	mov r15,5
	mov r12,r15
	mov qword rsi,r12
	mov r15,  [rsp+8*36]
	mov r12,r15
	mov qword rdi,r12
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*40]
	mov r11,r12
	mov rcx,r15
	shl r11,cl
	mov qword [rsp+8*42],r11
	mov r12,65535
	mov r11,r12
	mov qword rsi,r11
	mov r12,65535
	mov r11,r12
	mov qword rdi,r11
	mov r12,  rdi
	mov r11,r12
	mov qword [rsp+8*43],r11
	mov r11,  rsi
	mov r12,r11
	mov r11,  [rsp+8*43]
	mov qword [rsp+8*44],r12
	mov r12,r11
	mov rcx,16
	shl r12,cl
	mov qword [rsp+8*45],r12
	mov r12,  [rsp+8*44]
	mov r11,  [rsp+8*45]
	or r11,r12
	mov qword [rsp+8*45],r11
	mov r12,  [rsp+8*45]
	mov r11,r12
	mov qword [rsp+8*46],r11
	mov r12,  [rsp+8*46]
	mov r11,r12
	mov qword [rsp+8*47],r11
	mov r11,  [rsp+8*42]
	mov r12,  [rsp+8*47]
	mov r11,r11
	and r11,r12
	mov qword [rsp+8*42],r11
	mov r12,  [rsp+8*42]
	mov r11,r12
	mov qword [rsp+8*48],r11
	mov r12,  [rsp+8*48]
	mov r11,r12
	mov qword [rsp+8*62],r11
	mov r11,  [rsp+8*36]
	mov r12,  [rsp+8*62]
	mov qword [rsp+8*41],r15
	mov r15,r11
	xor r15,r12
	mov r11,r15
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*63],r15
	mov r15,  [rsp+8*37]
	mov r11,r15
	mov qword [rsp+8*64],r11
	mov r11,1
	mov r15,r15
	add r15,r11
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*49],r14
	mov qword [rsp+8*37],r15
	jmp L_1959
	
L_1960:
	mov r8,  [rsp+8*36]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,  [rsp+8*16]
	mov r13,r12
	add r13,r11
	mov r12,r13
	mov r14,  [rsp+8*79]
	mov r15,  [rsp+8*87]
	mov qword [rsp+8*92],r11
	mov r11,r14
	xor r11,r15
	mov r14,1
	mov r13,r14
	mov r14,r11
	mov r11,r14
	mov qword rdi,r14
	mov r14,r13
	mov qword rsi,r13
	mov r13,1
	mov qword [rsp+8*16],r12
	mov r12,r11
	add r12,r13
	mov r8,r12
	mov qword [rsp+8*66],r10
	mov qword [rsp+8*65],r9
	mov r9,0
	mov r10,r9
	mov qword [rsp+8*36],r8
	mov qword [rsp+8*37],r10
	mov qword [rsp+8*33],r11
	mov qword [rsp+8*35],r12
	mov qword [rsp+8*34],r14
	
L_1978:
	mov r8,  [rsp+8*34]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*37]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*38],r10
	mov qword [rsp+8*39],r12
	mov r8,  [rsp+8*39]
	cmp r8, 0
	je L_1979
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*36]
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
	mov qword [rsp+8*42],r14
	mov r14,  rsi
	mov r11,r14
	mov r14,r10
	mov rcx,16
	shl r14,cl
	or r14,r11
	mov qword [rsp+8*45],r14
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*45]
	mov r14,r11
	mov qword [rsp+8*46],r14
	mov r11,  [rsp+8*46]
	mov r14,r11
	mov qword [rsp+8*47],r14
	mov r14,  [rsp+8*42]
	mov r11,  [rsp+8*47]
	mov r14,r14
	and r14,r11
	mov qword [rsp+8*42],r14
	mov r11,  [rsp+8*42]
	mov r14,r11
	mov qword [rsp+8*48],r14
	mov r11,  [rsp+8*48]
	mov r14,r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*43],r10
	mov r10,r11
	xor r10,r14
	mov r11,r10
	mov qword [rsp+8*36],r11
	mov r8,17
	mov r11,r8
	mov qword rsi,r11
	mov r15,  [rsp+8*36]
	mov r11,r15
	mov qword rdi,r11
	mov r15,  rdi
	mov r11,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov qword [rsp+8*41],r13
	mov r13,65535
	mov r12,r13
	mov qword rsi,r12
	mov qword [rsp+8*51],r11
	mov r11,32767
	mov r12,r11
	mov qword rdi,r12
	mov qword [rsp+8*52],r15
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*43],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*43]
	mov qword [rsp+8*44],r15
	mov r15,r12
	mov rcx,16
	shl r15,cl
	mov qword [rsp+8*45],r15
	mov r15,  [rsp+8*44]
	mov r12,  [rsp+8*45]
	or r12,r15
	mov qword [rsp+8*45],r12
	mov r15,  [rsp+8*45]
	mov r12,r15
	mov qword [rsp+8*46],r12
	mov r15,  [rsp+8*46]
	mov r12,r15
	mov r15,r12
	mov qword [rsp+8*53],r12
	mov r12,  [rsp+8*52]
	mov r11,r15
	mov rcx,r12
	shr r11,cl
	mov r11,r11
	mov rcx,1
	shl r11,cl
	mov qword [rsp+8*54],r15
	mov r15,1
	mov r11,r11
	add r11,r15
	mov r12,r11
	mov qword [rsp+8*54],r12
	mov r12,  [rsp+8*51]
	mov qword [rsp+8*55],r11
	mov r11,  [rsp+8*52]
	mov r15,r12
	mov rcx,r11
	shr r15,cl
	mov qword [rsp+8*56],r15
	mov r15,  [rsp+8*54]
	mov r11,  [rsp+8*56]
	and r11,r15
	mov r15,r11
	mov qword [rsp+8*54],r15
	mov qword [rsp+8*56],r11
	mov r11,65535
	mov r15,r11
	mov qword rsi,r15
	mov r11,65535
	mov r15,r11
	mov qword rdi,r15
	mov r11,  rdi
	mov r15,r11
	mov qword [rsp+8*43],r15
	mov r15,  rsi
	mov r11,r15
	mov r15,  [rsp+8*43]
	mov qword [rsp+8*44],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	mov qword [rsp+8*45],r11
	mov r11,  [rsp+8*44]
	mov r15,  [rsp+8*45]
	or r15,r11
	mov qword [rsp+8*45],r15
	mov r11,  [rsp+8*45]
	mov r15,r11
	mov qword [rsp+8*46],r15
	mov r11,  [rsp+8*46]
	mov r15,r11
	mov r11,  [rsp+8*54]
	mov r12,r11
	and r12,r15
	mov qword [rsp+8*58],r12
	mov r11,  [rsp+8*58]
	mov r12,r11
	mov qword [rsp+8*59],r12
	mov r11,  [rsp+8*59]
	mov r12,r11
	mov qword [rsp+8*60],r12
	mov r12,  [rsp+8*36]
	mov r11,  [rsp+8*60]
	mov qword [rsp+8*57],r15
	mov r15,r12
	xor r15,r11
	mov r12,r15
	mov qword [rsp+8*36],r12
	mov qword [rsp+8*61],r15
	mov r15,5
	mov r12,r15
	mov qword rsi,r12
	mov r15,  [rsp+8*36]
	mov r12,r15
	mov qword rdi,r12
	mov r15,  rdi
	mov r12,r15
	mov qword [rsp+8*40],r12
	mov r12,  rsi
	mov r15,r12
	mov r12,  [rsp+8*40]
	mov r11,r12
	mov rcx,r15
	shl r11,cl
	mov qword [rsp+8*42],r11
	mov r12,65535
	mov r11,r12
	mov qword rsi,r11
	mov r12,65535
	mov r11,r12
	mov qword rdi,r11
	mov r12,  rdi
	mov r11,r12
	mov qword [rsp+8*43],r11
	mov r11,  rsi
	mov r12,r11
	mov r11,  [rsp+8*43]
	mov qword [rsp+8*44],r12
	mov r12,r11
	mov rcx,16
	shl r12,cl
	mov qword [rsp+8*45],r12
	mov r12,  [rsp+8*44]
	mov r11,  [rsp+8*45]
	or r11,r12
	mov qword [rsp+8*45],r11
	mov r12,  [rsp+8*45]
	mov r11,r12
	mov qword [rsp+8*46],r11
	mov r12,  [rsp+8*46]
	mov r11,r12
	mov qword [rsp+8*47],r11
	mov r11,  [rsp+8*42]
	mov r12,  [rsp+8*47]
	mov r11,r11
	and r11,r12
	mov qword [rsp+8*42],r11
	mov r12,  [rsp+8*42]
	mov r11,r12
	mov qword [rsp+8*48],r11
	mov r12,  [rsp+8*48]
	mov r11,r12
	mov qword [rsp+8*62],r11
	mov r11,  [rsp+8*36]
	mov r12,  [rsp+8*62]
	mov qword [rsp+8*41],r15
	mov r15,r11
	xor r15,r12
	mov r11,r15
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*63],r15
	mov r15,  [rsp+8*37]
	mov r11,r15
	mov qword [rsp+8*64],r11
	mov r11,1
	mov r15,r15
	add r15,r11
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*49],r14
	mov qword [rsp+8*37],r15
	jmp L_1978
	
L_1979:
	mov r8,  [rsp+8*36]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,  [rsp+8*17]
	mov r13,r12
	add r13,r11
	mov r12,r13
	mov r14,  [rsp+8*82]
	mov r15,  [rsp+8*87]
	mov qword [rsp+8*95],r11
	mov r11,r14
	xor r11,r15
	mov r14,1
	mov r13,r14
	mov r14,r11
	mov r11,r14
	mov r15,r13
	mov qword rdi,r14
	mov r14,1
	mov qword rsi,r13
	mov r13,r11
	add r13,r14
	mov r8,r13
	mov qword [rsp+8*33],r11
	mov r13,0
	mov r11,r13
	mov qword [rsp+8*36],r8
	mov qword [rsp+8*65],r9
	mov qword [rsp+8*66],r10
	mov qword [rsp+8*37],r11
	mov qword [rsp+8*17],r12
	mov qword [rsp+8*34],r15
	
L_1997:
	mov r8,  [rsp+8*34]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*37]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*38],r10
	mov qword [rsp+8*39],r12
	mov r8,  [rsp+8*39]
	cmp r8, 0
	je L_1998
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*36]
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
	mov qword rdi,r10
	mov qword rsi,r8
	mov r8,  rdi
	mov r10,r8
	mov r11,  rsi
	mov r8,r11
	mov r11,r10
	mov rcx,16
	shl r11,cl
	or r11,r8
	mov qword [rsp+8*42],r14
	mov r14,r11
	mov qword [rsp+8*46],r14
	mov qword [rsp+8*45],r11
	mov r11,  [rsp+8*46]
	mov r14,r11
	mov qword [rsp+8*47],r14
	mov r14,  [rsp+8*42]
	mov r11,  [rsp+8*47]
	mov r14,r14
	and r14,r11
	mov qword [rsp+8*42],r14
	mov r11,  [rsp+8*42]
	mov r14,r11
	mov qword [rsp+8*48],r14
	mov r11,  [rsp+8*48]
	mov r14,r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*44],r8
	mov r8,r11
	xor r8,r14
	mov r11,r8
	mov qword [rsp+8*49],r14
	mov r14,17
	mov r8,r14
	mov r14,r11
	mov qword rdi,r14
	mov qword rsi,r8
	mov r8,  rdi
	mov r14,r8
	mov qword [rsp+8*36],r11
	mov r11,  rsi
	mov r8,r11
	mov qword [rsp+8*43],r10
	mov r10,65535
	mov r11,r10
	mov qword rsi,r11
	mov r11,32767
	mov r10,r11
	mov r11,r10
	mov qword rdi,r10
	mov qword [rsp+8*43],r11
	mov r11,  rsi
	mov r10,r11
	mov r11,  [rsp+8*43]
	mov qword [rsp+8*44],r10
	mov r10,r11
	mov rcx,16
	shl r10,cl
	mov qword [rsp+8*45],r10
	mov r10,  [rsp+8*44]
	mov r11,  [rsp+8*45]
	or r11,r10
	mov qword [rsp+8*45],r11
	mov r10,  [rsp+8*45]
	mov r11,r10
	mov qword [rsp+8*46],r11
	mov r10,  [rsp+8*46]
	mov r11,r10
	mov r10,r11
	mov qword [rsp+8*53],r11
	mov r11,r10
	mov rcx,r8
	shr r11,cl
	mov r11,r11
	mov rcx,1
	shl r11,cl
	mov r9,1
	mov r11,r11
	add r11,r9
	mov r10,r11
	mov r9,r14
	mov rcx,r8
	shr r9,cl
	and r9,r10
	mov r10,r9
	mov qword [rsp+8*52],r8
	mov r9,65535
	mov r8,r9
	mov r11,65535
	mov r9,r11
	mov r11,r9
	mov qword [rsp+8*51],r14
	mov r14,r8
	mov qword rdi,r9
	mov r9,r11
	mov rcx,16
	shl r9,cl
	or r9,r14
	mov qword rsi,r8
	mov r8,r9
	mov qword [rsp+8*46],r8
	mov qword [rsp+8*45],r9
	mov r9,  [rsp+8*46]
	mov r8,r9
	mov r9,r10
	and r9,r8
	mov qword [rsp+8*57],r8
	mov r8,r9
	mov r9,r8
	mov qword [rsp+8*59],r8
	mov r8,  [rsp+8*36]
	mov qword [rsp+8*54],r10
	mov r10,r8
	xor r10,r9
	mov r8,r10
	mov qword [rsp+8*60],r9
	mov r10,5
	mov r9,r10
	mov r10,r8
	mov r12,r10
	mov r13,r9
	mov qword rdi,r10
	mov r10,r12
	mov rcx,r13
	shl r10,cl
	mov r9,r15
	mov qword [rsp+8*40],r12
	mov qword [rsp+8*41],r13
	mov r13,65535
	mov r12,r13
	mov r11,r12
	mov r14,r9
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r14
	mov qword [rsp+8*43],r11
	mov r11,r13
	mov r13,r11
	mov r10,r10
	and r10,r13
	mov qword [rsp+8*46],r11
	mov r11,r10
	mov r10,r11
	mov qword [rsp+8*48],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*62],r10
	mov r11,  [rsp+8*37]
	mov r10,r11
	mov qword [rsp+8*64],r10
	mov r10,1
	mov r11,r11
	add r11,r10
	mov qword [rsp+8*36],r8
	mov qword rsi,r9
	mov qword [rsp+8*37],r11
	mov qword rdi,r12
	mov qword [rsp+8*47],r13
	mov qword [rsp+8*44],r14
	jmp L_1997
	
L_1998:
	mov r8,  [rsp+8*36]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,  [rsp+8*18]
	mov r13,r12
	add r13,r11
	mov r12,r13
	mov r15,  [rsp+8*23]
	mov r14,r15
	mov r8,1
	mov r15,r15
	add r15,r8
	mov qword [rsp+8*65],r9
	mov qword [rsp+8*66],r10
	mov qword [rsp+8*98],r11
	mov qword [rsp+8*18],r12
	mov qword [rsp+8*99],r13
	mov qword [rsp+8*100],r14
	mov qword [rsp+8*23],r15
	jmp L_1719
	
L_1720:
	mov r9,  [rsp+8*21]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*101],r8
	mov qword [rsp+8*21],r9
	jmp L_1716
	
L_1717:
	mov r9,  [rsp+8*19]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*102],r8
	mov qword [rsp+8*19],r9
	jmp L_1713
	
L_1714:
	mov r9,  [rsp+8*15]
	mov r8,r9
	mov r10,r8
	mov r12,t129
	mov r11,r12
	mov r14,28
	mov r13,r14
	mov qword rdi,r8
	mov qword [rsp+8*103],r10
	mov qword [rsp+8*104],r11
	mov qword [rsp+8*105],r13
	
L_1796:
	mov r8,  [rsp+8*105]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*106],r10
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1797
	mov r8,  [rsp+8*103]
	mov r9,  [rsp+8*105]
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
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*108],r12
	mov qword [rsp+8*109],r14
	mov r8,  [rsp+8*109]
	cmp r8, 0
	je L_1798
	mov r8,48
	mov r9,  [rsp+8*108]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r12,r11
	mov r13,32
	cmp r12,r13
	mov r14, 0
	setge r14B
	mov qword [rsp+8*110],r10
	mov qword rdi,r11
	mov qword [rsp+8*111],r12
	mov qword [rsp+8*112],r14
	mov r8,  [rsp+8*112]
	cmp r8, 0
	jne L_1799
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_1800
	
L_1799:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_1800:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_1801
	mov r9,  [gbl+8*115]
	mov r8,r9
	mov r10,  [rsp+8*111]
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
	mov qword [rsp+8*116],r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*117],r12
	mov qword [rsp+8*118],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*120], rax
	mov r9,  [rsp+8*120]
	mov r8,r9
	mov qword [rsp+8*121],r8
	jmp L_1803
	
L_1801:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_1803:
	mov r9,  [rsp+8*121]
	mov r8,r9
	mov qword [rsp+8*122],r8
	mov     rsi, [rsp+8*122]
	mov     rdi, [rsp+8*104]
	call    concat
	mov [rsp+8*123], rax
	mov r9,  [rsp+8*123]
	mov r8,r9
	mov qword [rsp+8*104],r8
	jmp L_1804
	
L_1798:
	mov r8,65
	mov r9,  [rsp+8*108]
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
	mov qword [rsp+8*124],r10
	mov qword rdi,r12
	mov qword [rsp+8*111],r13
	mov qword [rsp+8*112],r15
	mov r8,  [rsp+8*112]
	cmp r8, 0
	jne L_1805
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_1806
	
L_1805:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_1806:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_1807
	mov r9,  [gbl+8*115]
	mov r8,r9
	mov r10,  [rsp+8*111]
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
	mov qword [rsp+8*116],r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*117],r12
	mov qword [rsp+8*118],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*120], rax
	mov r9,  [rsp+8*120]
	mov r8,r9
	mov qword [rsp+8*121],r8
	jmp L_1809
	
L_1807:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_1809:
	mov r9,  [rsp+8*121]
	mov r8,r9
	mov qword [rsp+8*125],r8
	mov     rsi, [rsp+8*125]
	mov     rdi, [rsp+8*104]
	call    concat
	mov [rsp+8*126], rax
	mov r9,  [rsp+8*126]
	mov r8,r9
	mov qword [rsp+8*104],r8
	
L_1804:
	mov r8,  [rsp+8*105]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*127],r10
	jmp L_1796
	
L_1797:
	mov r9,  [rsp+8*104]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*128],r8
	mov qword [rsp+8*129],r10
	mov     rsi, t242
	mov     rdi, [rsp+8*129]
	call    concat
	mov [rsp+8*130], rax
	mov r9,  [rsp+8*130]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*131],r10
	mov rdi, format
	mov rsi,[rsp+8*131] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r9,  [rsp+8*16]
	mov r8,r9
	mov r10,r8
	mov r12,t129
	mov r11,r12
	mov r14,28
	mov r13,r14
	mov qword rdi,r8
	mov qword [rsp+8*103],r10
	mov qword [rsp+8*104],r11
	mov qword [rsp+8*105],r13
	
L_1813:
	mov r8,  [rsp+8*105]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*106],r10
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1814
	mov r8,  [rsp+8*103]
	mov r9,  [rsp+8*105]
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
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*108],r12
	mov qword [rsp+8*109],r14
	mov r8,  [rsp+8*109]
	cmp r8, 0
	je L_1815
	mov r8,48
	mov r9,  [rsp+8*108]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r12,r11
	mov r13,32
	cmp r12,r13
	mov r14, 0
	setge r14B
	mov qword [rsp+8*110],r10
	mov qword rdi,r11
	mov qword [rsp+8*111],r12
	mov qword [rsp+8*112],r14
	mov r8,  [rsp+8*112]
	cmp r8, 0
	jne L_1816
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_1817
	
L_1816:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_1817:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_1818
	mov r9,  [gbl+8*115]
	mov r8,r9
	mov r10,  [rsp+8*111]
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
	mov qword [rsp+8*116],r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*117],r12
	mov qword [rsp+8*118],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*120], rax
	mov r9,  [rsp+8*120]
	mov r8,r9
	mov qword [rsp+8*121],r8
	jmp L_1820
	
L_1818:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_1820:
	mov r9,  [rsp+8*121]
	mov r8,r9
	mov qword [rsp+8*122],r8
	mov     rsi, [rsp+8*122]
	mov     rdi, [rsp+8*104]
	call    concat
	mov [rsp+8*123], rax
	mov r9,  [rsp+8*123]
	mov r8,r9
	mov qword [rsp+8*104],r8
	jmp L_1821
	
L_1815:
	mov r8,65
	mov r9,  [rsp+8*108]
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
	mov qword [rsp+8*124],r10
	mov qword rdi,r12
	mov qword [rsp+8*111],r13
	mov qword [rsp+8*112],r15
	mov r8,  [rsp+8*112]
	cmp r8, 0
	jne L_1822
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_1823
	
L_1822:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_1823:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_1824
	mov r9,  [gbl+8*115]
	mov r8,r9
	mov r10,  [rsp+8*111]
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
	mov qword [rsp+8*116],r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*117],r12
	mov qword [rsp+8*118],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*120], rax
	mov r9,  [rsp+8*120]
	mov r8,r9
	mov qword [rsp+8*121],r8
	jmp L_1826
	
L_1824:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_1826:
	mov r9,  [rsp+8*121]
	mov r8,r9
	mov qword [rsp+8*125],r8
	mov     rsi, [rsp+8*125]
	mov     rdi, [rsp+8*104]
	call    concat
	mov [rsp+8*126], rax
	mov r9,  [rsp+8*126]
	mov r8,r9
	mov qword [rsp+8*104],r8
	
L_1821:
	mov r8,  [rsp+8*105]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*127],r10
	jmp L_1813
	
L_1814:
	mov r9,  [rsp+8*104]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*128],r8
	mov qword [rsp+8*132],r10
	mov     rsi, t249
	mov     rdi, [rsp+8*132]
	call    concat
	mov [rsp+8*133], rax
	mov r9,  [rsp+8*133]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*134],r10
	mov rdi, format
	mov rsi,[rsp+8*134] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,r8
	mov r12,t129
	mov r11,r12
	mov r14,28
	mov r13,r14
	mov qword rdi,r8
	mov qword [rsp+8*103],r10
	mov qword [rsp+8*104],r11
	mov qword [rsp+8*105],r13
	
L_1830:
	mov r8,  [rsp+8*105]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*106],r10
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1831
	mov r8,  [rsp+8*103]
	mov r9,  [rsp+8*105]
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
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*108],r12
	mov qword [rsp+8*109],r14
	mov r8,  [rsp+8*109]
	cmp r8, 0
	je L_1832
	mov r8,48
	mov r9,  [rsp+8*108]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r12,r11
	mov r13,32
	cmp r12,r13
	mov r14, 0
	setge r14B
	mov qword [rsp+8*110],r10
	mov qword rdi,r11
	mov qword [rsp+8*111],r12
	mov qword [rsp+8*112],r14
	mov r8,  [rsp+8*112]
	cmp r8, 0
	jne L_1833
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_1834
	
L_1833:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_1834:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_1835
	mov r9,  [gbl+8*115]
	mov r8,r9
	mov r10,  [rsp+8*111]
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
	mov qword [rsp+8*116],r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*117],r12
	mov qword [rsp+8*118],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*120], rax
	mov r9,  [rsp+8*120]
	mov r8,r9
	mov qword [rsp+8*121],r8
	jmp L_1837
	
L_1835:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_1837:
	mov r9,  [rsp+8*121]
	mov r8,r9
	mov qword [rsp+8*122],r8
	mov     rsi, [rsp+8*122]
	mov     rdi, [rsp+8*104]
	call    concat
	mov [rsp+8*123], rax
	mov r9,  [rsp+8*123]
	mov r8,r9
	mov qword [rsp+8*104],r8
	jmp L_1838
	
L_1832:
	mov r8,65
	mov r9,  [rsp+8*108]
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
	mov qword [rsp+8*124],r10
	mov qword rdi,r12
	mov qword [rsp+8*111],r13
	mov qword [rsp+8*112],r15
	mov r8,  [rsp+8*112]
	cmp r8, 0
	jne L_1839
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_1840
	
L_1839:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_1840:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_1841
	mov r9,  [gbl+8*115]
	mov r8,r9
	mov r10,  [rsp+8*111]
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
	mov qword [rsp+8*116],r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*117],r12
	mov qword [rsp+8*118],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*120], rax
	mov r9,  [rsp+8*120]
	mov r8,r9
	mov qword [rsp+8*121],r8
	jmp L_1843
	
L_1841:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_1843:
	mov r9,  [rsp+8*121]
	mov r8,r9
	mov qword [rsp+8*125],r8
	mov     rsi, [rsp+8*125]
	mov     rdi, [rsp+8*104]
	call    concat
	mov [rsp+8*126], rax
	mov r9,  [rsp+8*126]
	mov r8,r9
	mov qword [rsp+8*104],r8
	
L_1838:
	mov r8,  [rsp+8*105]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*127],r10
	jmp L_1830
	
L_1831:
	mov r9,  [rsp+8*104]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*128],r8
	mov qword [rsp+8*135],r10
	mov     rsi, t256
	mov     rdi, [rsp+8*135]
	call    concat
	mov [rsp+8*136], rax
	mov r9,  [rsp+8*136]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*137],r10
	mov rdi, format
	mov rsi,[rsp+8*137] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r9,  [rsp+8*18]
	mov r8,r9
	mov r10,r8
	mov r12,t129
	mov r11,r12
	mov r14,28
	mov r13,r14
	mov qword rdi,r8
	mov qword [rsp+8*103],r10
	mov qword [rsp+8*104],r11
	mov qword [rsp+8*105],r13
	
L_1847:
	mov r8,  [rsp+8*105]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*106],r10
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1848
	mov r8,  [rsp+8*103]
	mov r9,  [rsp+8*105]
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
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*108],r12
	mov qword [rsp+8*109],r14
	mov r8,  [rsp+8*109]
	cmp r8, 0
	je L_1849
	mov r8,48
	mov r9,  [rsp+8*108]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r12,r11
	mov r13,32
	cmp r12,r13
	mov r14, 0
	setge r14B
	mov qword [rsp+8*110],r10
	mov qword rdi,r11
	mov qword [rsp+8*111],r12
	mov qword [rsp+8*112],r14
	mov r8,  [rsp+8*112]
	cmp r8, 0
	jne L_1850
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_1851
	
L_1850:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_1851:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_1852
	mov r9,  [gbl+8*115]
	mov r8,r9
	mov r10,  [rsp+8*111]
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
	mov qword [rsp+8*116],r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*117],r12
	mov qword [rsp+8*118],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*120], rax
	mov r9,  [rsp+8*120]
	mov r8,r9
	mov qword [rsp+8*121],r8
	jmp L_1854
	
L_1852:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_1854:
	mov r9,  [rsp+8*121]
	mov r8,r9
	mov qword [rsp+8*122],r8
	mov     rsi, [rsp+8*122]
	mov     rdi, [rsp+8*104]
	call    concat
	mov [rsp+8*123], rax
	mov r9,  [rsp+8*123]
	mov r8,r9
	mov qword [rsp+8*104],r8
	jmp L_1855
	
L_1849:
	mov r8,65
	mov r9,  [rsp+8*108]
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
	mov qword [rsp+8*124],r10
	mov qword rdi,r12
	mov qword [rsp+8*111],r13
	mov qword [rsp+8*112],r15
	mov r8,  [rsp+8*112]
	cmp r8, 0
	jne L_1856
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_1857
	
L_1856:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_1857:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_1858
	mov r9,  [gbl+8*115]
	mov r8,r9
	mov r10,  [rsp+8*111]
	mov r11,32
	mov r12,r10
	sub r12,r11
	mov r13,32
	mov r14,r10
	sub r14,r13
	mov r15,r14
	mov r10,r12
	mov r11,r8
	mov qword [rsp+8*116],r8
	mov qword rdi,r10
	mov qword [arg+8*63],r11
	mov qword [rsp+8*117],r12
	mov qword [rsp+8*118],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*120], rax
	mov r9,  [rsp+8*120]
	mov r8,r9
	mov qword [rsp+8*121],r8
	jmp L_1860
	
L_1858:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_1860:
	mov r9,  [rsp+8*121]
	mov r8,r9
	mov qword [rsp+8*125],r8
	mov     rsi, [rsp+8*125]
	mov     rdi, [rsp+8*104]
	call    concat
	mov [rsp+8*126], rax
	mov r9,  [rsp+8*126]
	mov r8,r9
	mov qword [rsp+8*104],r8
	
L_1855:
	mov r8,  [rsp+8*105]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*127],r10
	jmp L_1847
	
L_1848:
	mov r9,  [rsp+8*104]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*128],r8
	mov qword [rsp+8*138],r10
	mov     rsi, t263
	mov     rdi, [rsp+8*138]
	call    concat
	mov [rsp+8*139], rax
	mov r9,  [rsp+8*139]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*140],r10
	mov rdi, format
	mov rsi,[rsp+8*140] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r9,t268
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*141],r10
	mov rdi,[rsp+8*141] 
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
	sub    rsp, 1200
	mov r9,t110
	mov r8,r9
	mov qword [gbl+8*115],r8
	mov r8,  [rsp+8*142]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   3184
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

