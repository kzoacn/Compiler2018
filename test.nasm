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
	mov r14,r12
	mov r15,r10
	mov r13,r8
	mov r9,31
	mov r11,r13
	and r11,r9
	mov qword rdi,r12
	mov r12,r11
	mov r10,r15
	mov qword [rsp+8*28],r14
	mov qword [arg+8*2],r8
	mov r8,  [rsp+8*28]
	mov r14,r8
	mov r9,r14
	mov qword [rsp+8*30],r13
	mov r13,r10
	mov qword [rsp+8*31],r11
	mov r11,1
	mov qword [rsp+8*32],r12
	mov r12,r9
	add r12,r11
	mov qword [rsp+8*29],r15
	mov r15,r12
	mov qword rdi,r14
	mov r14,0
	mov r8,r14
	mov qword [rsp+8*37],r8
	mov qword [rsp+8*33],r9
	mov qword rsi,r10
	mov qword [rsp+8*35],r12
	mov qword [rsp+8*34],r13
	mov qword [rsp+8*36],r15
	
L_365:
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
	je L_366
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
	mov r11,r10
	mov qword [rsp+8*40],r12
	mov r12,r8
	mov qword [rsp+8*41],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*42],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*42]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*43],r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*44],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*45],r13
	mov qword [rsp+8*46],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*47],r15
	mov r15,r11
	mov qword [rsp+8*42],r9
	mov r9,r15
	mov qword [rsp+8*48],r10
	mov r10,r13
	mov qword [rsp+8*49],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*50],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*36],r11
	mov r11,r13
	mov qword [rsp+8*51],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*52],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*52]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	mov qword [rsp+8*43],r14
	mov r14,1
	mov r13,r13
	add r13,r14
	mov r12,r13
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*51]
	mov qword [rsp+8*45],r9
	mov r9,r11
	mov rcx,r15
	shr r9,cl
	and r9,r12
	mov r12,r9
	mov qword [rsp+8*46],r10
	mov qword [rsp+8*53],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*55],r13
	mov r13,65535
	mov r14,r13
	mov r11,r14
	mov r15,r10
	mov qword [rsp+8*56],r9
	mov r9,r11
	mov rcx,16
	shl r9,cl
	or r9,r15
	mov qword [rsp+8*54],r12
	mov r12,r9
	mov r8,r12
	mov r13,  [rsp+8*54]
	mov qword rdi,r14
	mov r14,r13
	and r14,r8
	mov qword rsi,r10
	mov r10,r14
	mov qword [rsp+8*43],r11
	mov r11,r10
	mov qword [rsp+8*44],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*45],r9
	mov r9,r15
	xor r9,r11
	mov r15,r9
	mov qword [rsp+8*46],r12
	mov qword [rsp+8*57],r8
	mov r8,5
	mov r12,r8
	mov r13,r15
	mov qword [rsp+8*58],r14
	mov r14,r13
	mov qword [rsp+8*59],r10
	mov r10,r12
	mov qword [rsp+8*60],r11
	mov r11,r14
	mov rcx,r10
	shl r11,cl
	mov qword [rsp+8*61],r9
	mov r9,65535
	mov r12,r9
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*36],r15
	mov r15,r13
	mov qword [rsp+8*41],r10
	mov r10,r12
	mov qword [rsp+8*42],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov qword [rsp+8*40],r14
	mov r14,r11
	mov r9,r14
	mov r8,  [rsp+8*42]
	mov r8,r8
	and r8,r9
	mov qword rdi,r13
	mov r13,r8
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*43],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*44],r10
	mov r10,r15
	xor r10,r12
	mov r15,r10
	mov qword [rsp+8*45],r11
	mov qword [rsp+8*46],r14
	mov r14,  [rsp+8*37]
	mov r11,r14
	mov qword [rsp+8*47],r9
	mov r9,1
	mov r14,r14
	add r14,r9
	mov qword [rsp+8*42],r8
	mov qword [rsp+8*63],r10
	mov qword [rsp+8*64],r11
	mov qword [rsp+8*62],r12
	mov qword [rsp+8*48],r13
	mov qword [rsp+8*37],r14
	mov qword [rsp+8*36],r15
	jmp L_365
	
L_366:
	mov r8,  [rsp+8*36]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,r11
	mov r14,  [rsp+8*32]
	mov r13,r14
	mov r15,r12
	mov r8,r15
	mov qword [rsp+8*65],r9
	mov r9,r13
	mov qword [rsp+8*66],r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*67],r11
	mov r11,65535
	mov r13,r11
	mov r14,65535
	mov r15,r14
	mov qword [rsp+8*68],r12
	mov r12,r15
	mov qword [rsp+8*40],r8
	mov r8,r13
	mov qword [rsp+8*41],r9
	mov r9,r12
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*42],r10
	mov r10,r9
	mov r11,r10
	mov r14,  [rsp+8*42]
	mov r14,r14
	and r14,r11
	mov qword rdi,r15
	mov r15,r14
	mov qword rsi,r13
	mov r13,r15
	mov qword [rsp+8*43],r12
	mov r12,32
	mov qword [rsp+8*44],r8
	mov r8,  [rsp+8*32]
	mov qword [rsp+8*45],r9
	mov r9,r12
	sub r9,r8
	mov qword [rsp+8*46],r10
	mov r10,r9
	mov qword [rsp+8*47],r11
	mov qword [rsp+8*42],r14
	mov r14,  [rsp+8*68]
	mov r11,r14
	mov qword [rsp+8*69],r13
	mov r13,r11
	mov qword [rsp+8*48],r15
	mov r15,r10
	mov r8,65535
	mov r10,r8
	mov r12,32767
	mov r11,r12
	mov qword [rsp+8*70],r9
	mov r9,r11
	mov r14,r10
	mov qword [rsp+8*51],r13
	mov r13,r9
	mov rcx,16
	shl r13,cl
	or r13,r14
	mov qword [rsp+8*52],r15
	mov r15,r13
	mov r8,r15
	mov r12,r8
	mov qword rdi,r11
	mov r11,  [rsp+8*52]
	mov qword rsi,r10
	mov r10,r12
	mov rcx,r11
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*43],r9
	mov r9,1
	mov r10,r10
	add r10,r9
	mov r12,r10
	mov qword [rsp+8*44],r14
	mov r14,  [rsp+8*51]
	mov qword [rsp+8*45],r13
	mov r13,r14
	mov rcx,r11
	shr r13,cl
	and r13,r12
	mov r12,r13
	mov qword [rsp+8*46],r15
	mov qword [rsp+8*53],r8
	mov r8,65535
	mov r15,r8
	mov qword [rsp+8*55],r10
	mov r10,65535
	mov r9,r10
	mov r11,r9
	mov r14,r15
	mov qword [rsp+8*54],r12
	mov r12,r11
	mov rcx,16
	shl r12,cl
	or r12,r14
	mov qword [rsp+8*56],r13
	mov r13,r12
	mov r8,r13
	mov r10,  [rsp+8*54]
	mov qword rdi,r9
	mov r9,r10
	and r9,r8
	mov qword rsi,r15
	mov r15,r9
	mov qword [rsp+8*43],r11
	mov r11,r15
	mov qword [rsp+8*44],r14
	mov r14,  [rsp+8*69]
	mov qword [rsp+8*45],r12
	mov r12,r14
	or r12,r11
	mov qword [rsp+8*46],r13
	mov r13,r12
	mov qword [rsp+8*57],r8
	mov r8,r13
	mov r10,r8
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*58],r9
	mov r9,  [rsp+8*23]
	mov r8,r9
	mov qword [rsp+8*59],r15
	mov qword [rsp+8*71],r11
	mov r11,  [rsp+8*14]
	mov r15,r11
	mov qword [rsp+8*72],r12
	mov r12,  [rsp+8*19]
	mov r14,r12
	mov qword [rsp+8*73],r13
	mov r13,r14
	mov qword [rsp+8*75],r10
	mov r10,r15
	mov qword [arg+8*2],r8
	mov r9,  [arg+8*2]
	mov r8,r9
	mov r11,31
	mov r12,r8
	and r12,r11
	mov qword [rsp+8*28],r13
	mov r13,r12
	mov r15,r10
	mov r9,  [rsp+8*28]
	mov r14,r9
	mov qword [rsp+8*30],r8
	mov r8,r14
	mov r11,r15
	mov qword [rsp+8*31],r12
	mov r12,1
	mov qword [rsp+8*32],r13
	mov r13,r8
	add r13,r12
	mov qword [rsp+8*29],r10
	mov r10,r13
	mov qword rdi,r14
	mov r14,0
	mov r9,r14
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*37],r9
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*34],r11
	mov qword [rsp+8*35],r13
	mov qword rsi,r15
	
L_396:
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
	je L_397
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
	mov r11,r10
	mov qword [rsp+8*40],r12
	mov r12,r8
	mov qword [rsp+8*41],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*42],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*42]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*43],r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*44],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*45],r13
	mov qword [rsp+8*46],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*47],r15
	mov r15,r11
	mov qword [rsp+8*42],r9
	mov r9,r15
	mov qword [rsp+8*48],r10
	mov r10,r13
	mov qword [rsp+8*49],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*50],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*36],r11
	mov r11,r13
	mov qword [rsp+8*51],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*52],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*52]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	mov qword [rsp+8*43],r14
	mov r14,1
	mov r13,r13
	add r13,r14
	mov r12,r13
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*51]
	mov qword [rsp+8*45],r9
	mov r9,r11
	mov rcx,r15
	shr r9,cl
	and r9,r12
	mov r12,r9
	mov qword [rsp+8*46],r10
	mov qword [rsp+8*53],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*55],r13
	mov r13,65535
	mov r14,r13
	mov r11,r14
	mov r15,r10
	mov qword [rsp+8*56],r9
	mov r9,r11
	mov rcx,16
	shl r9,cl
	or r9,r15
	mov qword [rsp+8*54],r12
	mov r12,r9
	mov r8,r12
	mov r13,  [rsp+8*54]
	mov qword rdi,r14
	mov r14,r13
	and r14,r8
	mov qword rsi,r10
	mov r10,r14
	mov qword [rsp+8*43],r11
	mov r11,r10
	mov qword [rsp+8*44],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*45],r9
	mov r9,r15
	xor r9,r11
	mov r15,r9
	mov qword [rsp+8*46],r12
	mov qword [rsp+8*57],r8
	mov r8,5
	mov r12,r8
	mov r13,r15
	mov qword [rsp+8*58],r14
	mov r14,r13
	mov qword [rsp+8*59],r10
	mov r10,r12
	mov qword [rsp+8*60],r11
	mov r11,r14
	mov rcx,r10
	shl r11,cl
	mov qword [rsp+8*61],r9
	mov r9,65535
	mov r12,r9
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*36],r15
	mov r15,r13
	mov qword [rsp+8*41],r10
	mov r10,r12
	mov qword [rsp+8*42],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov qword [rsp+8*40],r14
	mov r14,r11
	mov r9,r14
	mov r8,  [rsp+8*42]
	mov r8,r8
	and r8,r9
	mov qword rdi,r13
	mov r13,r8
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*43],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*44],r10
	mov r10,r15
	xor r10,r12
	mov r15,r10
	mov qword [rsp+8*45],r11
	mov qword [rsp+8*46],r14
	mov r14,  [rsp+8*37]
	mov r11,r14
	mov qword [rsp+8*47],r9
	mov r9,1
	mov r14,r14
	add r14,r9
	mov qword [rsp+8*42],r8
	mov qword [rsp+8*63],r10
	mov qword [rsp+8*64],r11
	mov qword [rsp+8*62],r12
	mov qword [rsp+8*48],r13
	mov qword [rsp+8*37],r14
	mov qword [rsp+8*36],r15
	jmp L_396
	
L_397:
	mov r8,  [rsp+8*36]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,r11
	mov r14,  [rsp+8*32]
	mov r13,r14
	mov r15,r12
	mov r8,r15
	mov qword [rsp+8*65],r9
	mov r9,r13
	mov qword [rsp+8*66],r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*67],r11
	mov r11,65535
	mov r13,r11
	mov r14,65535
	mov r15,r14
	mov qword [rsp+8*68],r12
	mov r12,r15
	mov qword [rsp+8*40],r8
	mov r8,r13
	mov qword [rsp+8*41],r9
	mov r9,r12
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*42],r10
	mov r10,r9
	mov r11,r10
	mov r14,  [rsp+8*42]
	mov r14,r14
	and r14,r11
	mov qword rdi,r15
	mov r15,r14
	mov qword rsi,r13
	mov r13,r15
	mov qword [rsp+8*43],r12
	mov r12,32
	mov qword [rsp+8*44],r8
	mov r8,  [rsp+8*32]
	mov qword [rsp+8*45],r9
	mov r9,r12
	sub r9,r8
	mov qword [rsp+8*46],r10
	mov r10,r9
	mov qword [rsp+8*47],r11
	mov qword [rsp+8*42],r14
	mov r14,  [rsp+8*68]
	mov r11,r14
	mov qword [rsp+8*69],r13
	mov r13,r11
	mov qword [rsp+8*48],r15
	mov r15,r10
	mov r8,65535
	mov r10,r8
	mov r12,32767
	mov r11,r12
	mov qword [rsp+8*70],r9
	mov r9,r11
	mov r14,r10
	mov qword [rsp+8*51],r13
	mov r13,r9
	mov rcx,16
	shl r13,cl
	or r13,r14
	mov qword [rsp+8*52],r15
	mov r15,r13
	mov r8,r15
	mov r12,r8
	mov qword rdi,r11
	mov r11,  [rsp+8*52]
	mov qword rsi,r10
	mov r10,r12
	mov rcx,r11
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*43],r9
	mov r9,1
	mov r10,r10
	add r10,r9
	mov r12,r10
	mov qword [rsp+8*44],r14
	mov r14,  [rsp+8*51]
	mov qword [rsp+8*45],r13
	mov r13,r14
	mov rcx,r11
	shr r13,cl
	and r13,r12
	mov r12,r13
	mov qword [rsp+8*46],r15
	mov qword [rsp+8*53],r8
	mov r8,65535
	mov r15,r8
	mov qword [rsp+8*55],r10
	mov r10,65535
	mov r9,r10
	mov r11,r9
	mov r14,r15
	mov qword [rsp+8*54],r12
	mov r12,r11
	mov rcx,16
	shl r12,cl
	or r12,r14
	mov qword [rsp+8*56],r13
	mov r13,r12
	mov r8,r13
	mov r10,  [rsp+8*54]
	mov qword rdi,r9
	mov r9,r10
	and r9,r8
	mov qword rsi,r15
	mov r15,r9
	mov qword [rsp+8*43],r11
	mov r11,r15
	mov qword [rsp+8*44],r14
	mov r14,  [rsp+8*69]
	mov qword [rsp+8*45],r12
	mov r12,r14
	or r12,r11
	mov qword [rsp+8*46],r13
	mov r13,r12
	mov qword [rsp+8*57],r8
	mov r8,r13
	mov r10,r8
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*58],r9
	mov r9,  [rsp+8*23]
	mov r8,r9
	mov qword [rsp+8*59],r15
	mov qword [rsp+8*71],r11
	mov r11,  [rsp+8*14]
	mov r15,r11
	mov qword [rsp+8*72],r12
	mov r12,  [rsp+8*21]
	mov r14,r12
	mov qword [rsp+8*73],r13
	mov r13,r14
	mov qword [rsp+8*77],r10
	mov r10,r15
	mov qword [arg+8*2],r8
	mov r9,  [arg+8*2]
	mov r8,r9
	mov r11,31
	mov r12,r8
	and r12,r11
	mov qword [rsp+8*28],r13
	mov r13,r12
	mov r15,r10
	mov r9,  [rsp+8*28]
	mov r14,r9
	mov qword [rsp+8*30],r8
	mov r8,r14
	mov r11,r15
	mov qword [rsp+8*31],r12
	mov r12,1
	mov qword [rsp+8*32],r13
	mov r13,r8
	add r13,r12
	mov qword [rsp+8*29],r10
	mov r10,r13
	mov qword rdi,r14
	mov r14,0
	mov r9,r14
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*37],r9
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*34],r11
	mov qword [rsp+8*35],r13
	mov qword rsi,r15
	
L_427:
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
	je L_428
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
	mov r11,r10
	mov qword [rsp+8*40],r12
	mov r12,r8
	mov qword [rsp+8*41],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*42],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*42]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*43],r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*44],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*45],r13
	mov qword [rsp+8*46],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*47],r15
	mov r15,r11
	mov qword [rsp+8*42],r9
	mov r9,r15
	mov qword [rsp+8*48],r10
	mov r10,r13
	mov qword [rsp+8*49],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*50],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*36],r11
	mov r11,r13
	mov qword [rsp+8*51],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*52],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*52]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	mov qword [rsp+8*43],r14
	mov r14,1
	mov r13,r13
	add r13,r14
	mov r12,r13
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*51]
	mov qword [rsp+8*45],r9
	mov r9,r11
	mov rcx,r15
	shr r9,cl
	and r9,r12
	mov r12,r9
	mov qword [rsp+8*46],r10
	mov qword [rsp+8*53],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*55],r13
	mov r13,65535
	mov r14,r13
	mov r11,r14
	mov r15,r10
	mov qword [rsp+8*56],r9
	mov r9,r11
	mov rcx,16
	shl r9,cl
	or r9,r15
	mov qword [rsp+8*54],r12
	mov r12,r9
	mov r8,r12
	mov r13,  [rsp+8*54]
	mov qword rdi,r14
	mov r14,r13
	and r14,r8
	mov qword rsi,r10
	mov r10,r14
	mov qword [rsp+8*43],r11
	mov r11,r10
	mov qword [rsp+8*44],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*45],r9
	mov r9,r15
	xor r9,r11
	mov r15,r9
	mov qword [rsp+8*46],r12
	mov qword [rsp+8*57],r8
	mov r8,5
	mov r12,r8
	mov r13,r15
	mov qword [rsp+8*58],r14
	mov r14,r13
	mov qword [rsp+8*59],r10
	mov r10,r12
	mov qword [rsp+8*60],r11
	mov r11,r14
	mov rcx,r10
	shl r11,cl
	mov qword [rsp+8*61],r9
	mov r9,65535
	mov r12,r9
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*36],r15
	mov r15,r13
	mov qword [rsp+8*41],r10
	mov r10,r12
	mov qword [rsp+8*42],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov qword [rsp+8*40],r14
	mov r14,r11
	mov r9,r14
	mov r8,  [rsp+8*42]
	mov r8,r8
	and r8,r9
	mov qword rdi,r13
	mov r13,r8
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*43],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*44],r10
	mov r10,r15
	xor r10,r12
	mov r15,r10
	mov qword [rsp+8*45],r11
	mov qword [rsp+8*46],r14
	mov r14,  [rsp+8*37]
	mov r11,r14
	mov qword [rsp+8*47],r9
	mov r9,1
	mov r14,r14
	add r14,r9
	mov qword [rsp+8*42],r8
	mov qword [rsp+8*63],r10
	mov qword [rsp+8*64],r11
	mov qword [rsp+8*62],r12
	mov qword [rsp+8*48],r13
	mov qword [rsp+8*37],r14
	mov qword [rsp+8*36],r15
	jmp L_427
	
L_428:
	mov r8,  [rsp+8*36]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,r11
	mov r14,  [rsp+8*32]
	mov r13,r14
	mov r15,r12
	mov r8,r15
	mov qword [rsp+8*65],r9
	mov r9,r13
	mov qword [rsp+8*66],r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*67],r11
	mov r11,65535
	mov r13,r11
	mov r14,65535
	mov r15,r14
	mov qword [rsp+8*68],r12
	mov r12,r15
	mov qword [rsp+8*40],r8
	mov r8,r13
	mov qword [rsp+8*41],r9
	mov r9,r12
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*42],r10
	mov r10,r9
	mov r11,r10
	mov r14,  [rsp+8*42]
	mov r14,r14
	and r14,r11
	mov qword rdi,r15
	mov r15,r14
	mov qword rsi,r13
	mov r13,r15
	mov qword [rsp+8*43],r12
	mov r12,32
	mov qword [rsp+8*44],r8
	mov r8,  [rsp+8*32]
	mov qword [rsp+8*45],r9
	mov r9,r12
	sub r9,r8
	mov qword [rsp+8*46],r10
	mov r10,r9
	mov qword [rsp+8*47],r11
	mov qword [rsp+8*42],r14
	mov r14,  [rsp+8*68]
	mov r11,r14
	mov qword [rsp+8*69],r13
	mov r13,r11
	mov qword [rsp+8*48],r15
	mov r15,r10
	mov r8,65535
	mov r10,r8
	mov r12,32767
	mov r11,r12
	mov qword [rsp+8*70],r9
	mov r9,r11
	mov r14,r10
	mov qword [rsp+8*51],r13
	mov r13,r9
	mov rcx,16
	shl r13,cl
	or r13,r14
	mov qword [rsp+8*52],r15
	mov r15,r13
	mov r8,r15
	mov r12,r8
	mov qword rdi,r11
	mov r11,  [rsp+8*52]
	mov qword rsi,r10
	mov r10,r12
	mov rcx,r11
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	mov qword [rsp+8*43],r9
	mov r9,1
	mov r10,r10
	add r10,r9
	mov r12,r10
	mov qword [rsp+8*44],r14
	mov r14,  [rsp+8*51]
	mov qword [rsp+8*45],r13
	mov r13,r14
	mov rcx,r11
	shr r13,cl
	and r13,r12
	mov r12,r13
	mov qword [rsp+8*46],r15
	mov qword [rsp+8*53],r8
	mov r8,65535
	mov r15,r8
	mov qword [rsp+8*55],r10
	mov r10,65535
	mov r9,r10
	mov r11,r9
	mov r14,r15
	mov qword [rsp+8*54],r12
	mov r12,r11
	mov rcx,16
	shl r12,cl
	or r12,r14
	mov qword [rsp+8*56],r13
	mov r13,r12
	mov r8,r13
	mov r10,  [rsp+8*54]
	mov qword rdi,r9
	mov r9,r10
	and r9,r8
	mov qword rsi,r15
	mov r15,r9
	mov qword [rsp+8*43],r11
	mov r11,r15
	mov qword [rsp+8*44],r14
	mov r14,  [rsp+8*69]
	mov qword [rsp+8*45],r12
	mov r12,r14
	or r12,r11
	mov qword [rsp+8*46],r13
	mov r13,r12
	mov qword [rsp+8*57],r8
	mov r8,r13
	mov r10,r8
	mov qword [rsp+8*78],r8
	mov r8,  [rsp+8*19]
	mov qword [rsp+8*58],r9
	mov r9,  [rsp+8*21]
	mov qword [rsp+8*59],r15
	mov r15,r8
	xor r15,r9
	mov qword [rsp+8*71],r11
	mov r14,  [rsp+8*23]
	mov r11,r14
	mov qword [rsp+8*72],r12
	mov qword [rsp+8*73],r13
	mov r13,  [rsp+8*14]
	mov r12,r13
	mov r13,r15
	mov r15,r13
	mov qword [rsp+8*79],r10
	mov r10,r12
	mov r8,r11
	mov qword [arg+8*2],r11
	mov r11,31
	mov r9,r8
	and r9,r11
	mov qword [rsp+8*30],r8
	mov r8,r9
	mov r12,r10
	mov r13,r15
	mov r9,r13
	mov qword [rsp+8*29],r10
	mov r10,r12
	mov r11,1
	mov qword [rsp+8*28],r15
	mov r15,r9
	add r15,r11
	mov r14,r15
	mov qword [rsp+8*32],r8
	mov qword rdi,r13
	mov r13,0
	mov r8,r13
	mov qword [rsp+8*37],r8
	mov qword [rsp+8*33],r9
	mov qword [rsp+8*34],r10
	mov qword rsi,r12
	mov qword [rsp+8*36],r14
	mov qword [rsp+8*35],r15
	
L_458:
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
	je L_459
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
	mov r11,r10
	mov qword [rsp+8*40],r12
	mov r12,r8
	mov qword [rsp+8*41],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*42],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*42]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*43],r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*44],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*45],r13
	mov qword [rsp+8*46],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*47],r15
	mov r15,r11
	mov qword [rsp+8*42],r9
	mov r9,r15
	mov qword [rsp+8*48],r10
	mov r10,r13
	mov qword [rsp+8*49],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*50],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*36],r11
	mov r11,r13
	mov qword [rsp+8*51],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*52],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*52]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	mov qword [rsp+8*43],r14
	mov r14,1
	mov r13,r13
	add r13,r14
	mov r12,r13
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*51]
	mov qword [rsp+8*45],r9
	mov r9,r11
	mov rcx,r15
	shr r9,cl
	and r9,r12
	mov r12,r9
	mov qword [rsp+8*46],r10
	mov qword [rsp+8*53],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*55],r13
	mov r13,65535
	mov r14,r13
	mov r11,r14
	mov r15,r10
	mov qword [rsp+8*56],r9
	mov r9,r11
	mov rcx,16
	shl r9,cl
	or r9,r15
	mov qword [rsp+8*54],r12
	mov r12,r9
	mov r8,r12
	mov r13,  [rsp+8*54]
	mov qword rdi,r14
	mov r14,r13
	and r14,r8
	mov qword rsi,r10
	mov r10,r14
	mov qword [rsp+8*43],r11
	mov r11,r10
	mov qword [rsp+8*44],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*45],r9
	mov r9,r15
	xor r9,r11
	mov r15,r9
	mov qword [rsp+8*46],r12
	mov qword [rsp+8*57],r8
	mov r8,5
	mov r12,r8
	mov r13,r15
	mov qword [rsp+8*58],r14
	mov r14,r13
	mov qword [rsp+8*59],r10
	mov r10,r12
	mov qword [rsp+8*60],r11
	mov r11,r14
	mov rcx,r10
	shl r11,cl
	mov qword [rsp+8*61],r9
	mov r9,65535
	mov r12,r9
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*36],r15
	mov r15,r13
	mov qword [rsp+8*41],r10
	mov r10,r12
	mov qword [rsp+8*42],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov qword [rsp+8*40],r14
	mov r14,r11
	mov r9,r14
	mov r8,  [rsp+8*42]
	mov r8,r8
	and r8,r9
	mov qword rdi,r13
	mov r13,r8
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*43],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*44],r10
	mov r10,r15
	xor r10,r12
	mov r15,r10
	mov qword [rsp+8*45],r11
	mov qword [rsp+8*46],r14
	mov r14,  [rsp+8*37]
	mov r11,r14
	mov qword [rsp+8*47],r9
	mov r9,1
	mov r14,r14
	add r14,r9
	mov qword [rsp+8*42],r8
	mov qword [rsp+8*63],r10
	mov qword [rsp+8*64],r11
	mov qword [rsp+8*62],r12
	mov qword [rsp+8*48],r13
	mov qword [rsp+8*37],r14
	mov qword [rsp+8*36],r15
	jmp L_458
	
L_459:
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
	mov r8,r13
	mov qword [rsp+8*65],r9
	mov r9,r11
	mov rcx,r8
	shl r9,cl
	mov qword [rsp+8*66],r10
	mov r10,65535
	mov r13,r10
	mov r14,65535
	mov r15,r14
	mov qword [rsp+8*68],r12
	mov r12,r15
	mov qword [rsp+8*41],r8
	mov r8,r13
	mov qword [rsp+8*42],r9
	mov r9,r12
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*40],r11
	mov r11,r9
	mov r10,r11
	mov r14,  [rsp+8*42]
	mov r14,r14
	and r14,r10
	mov qword rdi,r15
	mov r15,r14
	mov qword rsi,r13
	mov r13,r15
	mov qword [rsp+8*43],r12
	mov r12,32
	mov qword [rsp+8*44],r8
	mov r8,  [rsp+8*32]
	mov qword [rsp+8*45],r9
	mov r9,r12
	sub r9,r8
	mov r8,r9
	mov r12,  [rsp+8*68]
	mov r9,r12
	mov r12,r9
	mov qword [rsp+8*46],r11
	mov r11,r8
	mov qword [rsp+8*47],r10
	mov r10,65535
	mov r8,r10
	mov qword [rsp+8*42],r14
	mov r14,32767
	mov r9,r14
	mov qword [rsp+8*69],r13
	mov r13,r9
	mov qword [rsp+8*48],r15
	mov r15,r8
	mov qword [rsp+8*51],r12
	mov r12,r13
	mov rcx,16
	shl r12,cl
	or r12,r15
	mov qword [rsp+8*52],r11
	mov r11,r12
	mov r10,r11
	mov r14,r10
	mov qword rdi,r9
	mov r9,  [rsp+8*52]
	mov qword rsi,r8
	mov r8,r14
	mov rcx,r9
	shr r8,cl
	mov r8,r8
	mov rcx,1
	shl r8,cl
	mov qword [rsp+8*43],r13
	mov r13,1
	mov r8,r8
	add r8,r13
	mov r14,r8
	mov qword [rsp+8*44],r15
	mov r15,  [rsp+8*51]
	mov qword [rsp+8*45],r12
	mov r12,r15
	mov rcx,r9
	shr r12,cl
	and r12,r14
	mov r14,r12
	mov qword [rsp+8*46],r11
	mov qword [rsp+8*53],r10
	mov r10,65535
	mov r11,r10
	mov qword [rsp+8*55],r8
	mov r8,65535
	mov r13,r8
	mov r9,r13
	mov r15,r11
	mov qword [rsp+8*56],r12
	mov r12,r9
	mov rcx,16
	shl r12,cl
	or r12,r15
	mov qword [rsp+8*54],r14
	mov r14,r12
	mov r10,r14
	mov r8,  [rsp+8*54]
	mov qword rdi,r13
	mov r13,r8
	and r13,r10
	mov qword rsi,r11
	mov r11,r13
	mov qword [rsp+8*43],r9
	mov r9,r11
	mov qword [rsp+8*44],r15
	mov r15,  [rsp+8*69]
	mov qword [rsp+8*45],r12
	mov r12,r15
	or r12,r9
	mov qword [rsp+8*71],r9
	mov r9,r12
	mov r12,r9
	mov qword [rsp+8*73],r9
	mov r9,r12
	mov qword [rsp+8*81],r12
	mov r15,1
	mov r12,r15
	mov qword [rsp+8*46],r14
	mov r14,  [rsp+8*23]
	mov r15,r14
	mov r8,r15
	mov qword [rsp+8*57],r10
	mov r10,r12
	mov qword [rsp+8*58],r13
	mov r13,1
	mov qword [rsp+8*59],r11
	mov r11,r8
	add r11,r13
	mov qword [rsp+8*82],r9
	mov r9,r11
	mov qword rdi,r15
	mov r15,0
	mov r14,r15
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*36],r9
	mov qword [rsp+8*34],r10
	mov qword [rsp+8*35],r11
	mov qword rsi,r12
	mov qword [rsp+8*37],r14
	
L_182:
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
	je L_183
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
	mov r11,r10
	mov qword [rsp+8*40],r12
	mov r12,r8
	mov qword [rsp+8*41],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*42],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*42]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*43],r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*44],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*45],r13
	mov qword [rsp+8*46],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*47],r15
	mov r15,r11
	mov qword [rsp+8*42],r9
	mov r9,r15
	mov qword [rsp+8*48],r10
	mov r10,r13
	mov qword [rsp+8*49],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*50],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*36],r11
	mov r11,r13
	mov qword [rsp+8*51],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*52],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*52]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	mov qword [rsp+8*43],r14
	mov r14,1
	mov r13,r13
	add r13,r14
	mov r12,r13
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*51]
	mov qword [rsp+8*45],r9
	mov r9,r11
	mov rcx,r15
	shr r9,cl
	and r9,r12
	mov r12,r9
	mov qword [rsp+8*46],r10
	mov qword [rsp+8*53],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*55],r13
	mov r13,65535
	mov r14,r13
	mov r11,r14
	mov r15,r10
	mov qword [rsp+8*56],r9
	mov r9,r11
	mov rcx,16
	shl r9,cl
	or r9,r15
	mov qword [rsp+8*54],r12
	mov r12,r9
	mov r8,r12
	mov r13,  [rsp+8*54]
	mov qword rdi,r14
	mov r14,r13
	and r14,r8
	mov qword rsi,r10
	mov r10,r14
	mov qword [rsp+8*43],r11
	mov r11,r10
	mov qword [rsp+8*44],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*45],r9
	mov r9,r15
	xor r9,r11
	mov r15,r9
	mov qword [rsp+8*46],r12
	mov qword [rsp+8*57],r8
	mov r8,5
	mov r12,r8
	mov r13,r15
	mov qword [rsp+8*58],r14
	mov r14,r13
	mov qword [rsp+8*59],r10
	mov r10,r12
	mov qword [rsp+8*60],r11
	mov r11,r14
	mov rcx,r10
	shl r11,cl
	mov qword [rsp+8*61],r9
	mov r9,65535
	mov r12,r9
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*36],r15
	mov r15,r13
	mov qword [rsp+8*41],r10
	mov r10,r12
	mov qword [rsp+8*42],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov qword [rsp+8*40],r14
	mov r14,r11
	mov r9,r14
	mov r8,  [rsp+8*42]
	mov r8,r8
	and r8,r9
	mov qword rdi,r13
	mov r13,r8
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*43],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*44],r10
	mov r10,r15
	xor r10,r12
	mov r15,r10
	mov qword [rsp+8*45],r11
	mov qword [rsp+8*46],r14
	mov r14,  [rsp+8*37]
	mov r11,r14
	mov qword [rsp+8*47],r9
	mov r9,1
	mov r14,r14
	add r14,r9
	mov qword [rsp+8*42],r8
	mov qword [rsp+8*63],r10
	mov qword [rsp+8*64],r11
	mov qword [rsp+8*62],r12
	mov qword [rsp+8*48],r13
	mov qword [rsp+8*37],r14
	mov qword [rsp+8*36],r15
	jmp L_182
	
L_183:
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
	mov r8,r12
	mov qword [rsp+8*65],r9
	mov r9,1
	mov qword [rsp+8*66],r10
	mov r10,r13
	add r10,r9
	mov qword [rsp+8*83],r11
	mov r11,r10
	mov qword rdi,r14
	mov r14,0
	mov r15,r14
	mov qword [rsp+8*34],r8
	mov qword [rsp+8*35],r10
	mov qword [rsp+8*36],r11
	mov qword rsi,r12
	mov qword [rsp+8*33],r13
	mov qword [rsp+8*37],r15
	
L_201:
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
	je L_202
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
	mov r11,r10
	mov qword [rsp+8*40],r12
	mov r12,r8
	mov qword [rsp+8*41],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*42],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*42]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*43],r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*44],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*45],r13
	mov qword [rsp+8*46],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*47],r15
	mov r15,r11
	mov qword [rsp+8*42],r9
	mov r9,r15
	mov qword [rsp+8*48],r10
	mov r10,r13
	mov qword [rsp+8*49],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*50],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*36],r11
	mov r11,r13
	mov qword [rsp+8*51],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*52],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*52]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	mov qword [rsp+8*43],r14
	mov r14,1
	mov r13,r13
	add r13,r14
	mov r12,r13
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*51]
	mov qword [rsp+8*45],r9
	mov r9,r11
	mov rcx,r15
	shr r9,cl
	and r9,r12
	mov r12,r9
	mov qword [rsp+8*46],r10
	mov qword [rsp+8*53],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*55],r13
	mov r13,65535
	mov r14,r13
	mov r11,r14
	mov r15,r10
	mov qword [rsp+8*56],r9
	mov r9,r11
	mov rcx,16
	shl r9,cl
	or r9,r15
	mov qword [rsp+8*54],r12
	mov r12,r9
	mov r8,r12
	mov r13,  [rsp+8*54]
	mov qword rdi,r14
	mov r14,r13
	and r14,r8
	mov qword rsi,r10
	mov r10,r14
	mov qword [rsp+8*43],r11
	mov r11,r10
	mov qword [rsp+8*44],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*45],r9
	mov r9,r15
	xor r9,r11
	mov r15,r9
	mov qword [rsp+8*46],r12
	mov qword [rsp+8*57],r8
	mov r8,5
	mov r12,r8
	mov r13,r15
	mov qword [rsp+8*58],r14
	mov r14,r13
	mov qword [rsp+8*59],r10
	mov r10,r12
	mov qword [rsp+8*60],r11
	mov r11,r14
	mov rcx,r10
	shl r11,cl
	mov qword [rsp+8*61],r9
	mov r9,65535
	mov r12,r9
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*36],r15
	mov r15,r13
	mov qword [rsp+8*41],r10
	mov r10,r12
	mov qword [rsp+8*42],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov qword [rsp+8*40],r14
	mov r14,r11
	mov r9,r14
	mov r8,  [rsp+8*42]
	mov r8,r8
	and r8,r9
	mov qword rdi,r13
	mov r13,r8
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*43],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*44],r10
	mov r10,r15
	xor r10,r12
	mov r15,r10
	mov qword [rsp+8*45],r11
	mov qword [rsp+8*46],r14
	mov r14,  [rsp+8*37]
	mov r11,r14
	mov qword [rsp+8*47],r9
	mov r9,1
	mov r14,r14
	add r14,r9
	mov qword [rsp+8*42],r8
	mov qword [rsp+8*63],r10
	mov qword [rsp+8*64],r11
	mov qword [rsp+8*62],r12
	mov qword [rsp+8*48],r13
	mov qword [rsp+8*37],r14
	mov qword [rsp+8*36],r15
	jmp L_201
	
L_202:
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
	mov r8,r14
	mov qword [rsp+8*65],r9
	mov r9,1
	mov qword [rsp+8*66],r10
	mov r10,r15
	add r10,r9
	mov qword [rsp+8*85],r13
	mov r13,r10
	mov qword rdi,r11
	mov r11,0
	mov r12,r11
	mov qword [rsp+8*34],r8
	mov qword [rsp+8*35],r10
	mov qword [rsp+8*37],r12
	mov qword [rsp+8*36],r13
	mov qword rsi,r14
	mov qword [rsp+8*33],r15
	
L_220:
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
	je L_221
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
	mov r11,r10
	mov qword [rsp+8*40],r12
	mov r12,r8
	mov qword [rsp+8*41],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*42],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*42]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*43],r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*44],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*45],r13
	mov qword [rsp+8*46],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*47],r15
	mov r15,r11
	mov qword [rsp+8*42],r9
	mov r9,r15
	mov qword [rsp+8*48],r10
	mov r10,r13
	mov qword [rsp+8*49],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*50],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*36],r11
	mov r11,r13
	mov qword [rsp+8*51],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*52],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*52]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	mov qword [rsp+8*43],r14
	mov r14,1
	mov r13,r13
	add r13,r14
	mov r12,r13
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*51]
	mov qword [rsp+8*45],r9
	mov r9,r11
	mov rcx,r15
	shr r9,cl
	and r9,r12
	mov r12,r9
	mov qword [rsp+8*46],r10
	mov qword [rsp+8*53],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*55],r13
	mov r13,65535
	mov r14,r13
	mov r11,r14
	mov r15,r10
	mov qword [rsp+8*56],r9
	mov r9,r11
	mov rcx,16
	shl r9,cl
	or r9,r15
	mov qword [rsp+8*54],r12
	mov r12,r9
	mov r8,r12
	mov r13,  [rsp+8*54]
	mov qword rdi,r14
	mov r14,r13
	and r14,r8
	mov qword rsi,r10
	mov r10,r14
	mov qword [rsp+8*43],r11
	mov r11,r10
	mov qword [rsp+8*44],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*45],r9
	mov r9,r15
	xor r9,r11
	mov r15,r9
	mov qword [rsp+8*46],r12
	mov qword [rsp+8*57],r8
	mov r8,5
	mov r12,r8
	mov r13,r15
	mov qword [rsp+8*58],r14
	mov r14,r13
	mov qword [rsp+8*59],r10
	mov r10,r12
	mov qword [rsp+8*60],r11
	mov r11,r14
	mov rcx,r10
	shl r11,cl
	mov qword [rsp+8*61],r9
	mov r9,65535
	mov r12,r9
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*36],r15
	mov r15,r13
	mov qword [rsp+8*41],r10
	mov r10,r12
	mov qword [rsp+8*42],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov qword [rsp+8*40],r14
	mov r14,r11
	mov r9,r14
	mov r8,  [rsp+8*42]
	mov r8,r8
	and r8,r9
	mov qword rdi,r13
	mov r13,r8
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*43],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*44],r10
	mov r10,r15
	xor r10,r12
	mov r15,r10
	mov qword [rsp+8*45],r11
	mov qword [rsp+8*46],r14
	mov r14,  [rsp+8*37]
	mov r11,r14
	mov qword [rsp+8*47],r9
	mov r9,1
	mov r14,r14
	add r14,r9
	mov qword [rsp+8*42],r8
	mov qword [rsp+8*63],r10
	mov qword [rsp+8*64],r11
	mov qword [rsp+8*62],r12
	mov qword [rsp+8*48],r13
	mov qword [rsp+8*37],r14
	mov qword [rsp+8*36],r15
	jmp L_220
	
L_221:
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
	mov r8,1
	mov qword [rsp+8*65],r9
	mov r9,r14
	add r9,r8
	mov qword [rsp+8*66],r10
	mov r10,r9
	mov qword [rsp+8*87],r13
	mov qword rdi,r12
	mov r12,0
	mov r13,r12
	mov qword [rsp+8*35],r9
	mov qword [rsp+8*36],r10
	mov qword rsi,r11
	mov qword [rsp+8*37],r13
	mov qword [rsp+8*33],r14
	mov qword [rsp+8*34],r15
	
L_239:
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
	je L_240
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
	mov r11,r10
	mov qword [rsp+8*40],r12
	mov r12,r8
	mov qword [rsp+8*41],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*42],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*42]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*43],r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*44],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*45],r13
	mov qword [rsp+8*46],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*47],r15
	mov r15,r11
	mov qword [rsp+8*42],r9
	mov r9,r15
	mov qword [rsp+8*48],r10
	mov r10,r13
	mov qword [rsp+8*49],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*50],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*36],r11
	mov r11,r13
	mov qword [rsp+8*51],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*52],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*52]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	mov qword [rsp+8*43],r14
	mov r14,1
	mov r13,r13
	add r13,r14
	mov r12,r13
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*51]
	mov qword [rsp+8*45],r9
	mov r9,r11
	mov rcx,r15
	shr r9,cl
	and r9,r12
	mov r12,r9
	mov qword [rsp+8*46],r10
	mov qword [rsp+8*53],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*55],r13
	mov r13,65535
	mov r14,r13
	mov r11,r14
	mov r15,r10
	mov qword [rsp+8*56],r9
	mov r9,r11
	mov rcx,16
	shl r9,cl
	or r9,r15
	mov qword [rsp+8*54],r12
	mov r12,r9
	mov r8,r12
	mov r13,  [rsp+8*54]
	mov qword rdi,r14
	mov r14,r13
	and r14,r8
	mov qword rsi,r10
	mov r10,r14
	mov qword [rsp+8*43],r11
	mov r11,r10
	mov qword [rsp+8*44],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*45],r9
	mov r9,r15
	xor r9,r11
	mov r15,r9
	mov qword [rsp+8*46],r12
	mov qword [rsp+8*57],r8
	mov r8,5
	mov r12,r8
	mov r13,r15
	mov qword [rsp+8*58],r14
	mov r14,r13
	mov qword [rsp+8*59],r10
	mov r10,r12
	mov qword [rsp+8*60],r11
	mov r11,r14
	mov rcx,r10
	shl r11,cl
	mov qword [rsp+8*61],r9
	mov r9,65535
	mov r12,r9
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*36],r15
	mov r15,r13
	mov qword [rsp+8*41],r10
	mov r10,r12
	mov qword [rsp+8*42],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov qword [rsp+8*40],r14
	mov r14,r11
	mov r9,r14
	mov r8,  [rsp+8*42]
	mov r8,r8
	and r8,r9
	mov qword rdi,r13
	mov r13,r8
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*43],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*44],r10
	mov r10,r15
	xor r10,r12
	mov r15,r10
	mov qword [rsp+8*45],r11
	mov qword [rsp+8*46],r14
	mov r14,  [rsp+8*37]
	mov r11,r14
	mov qword [rsp+8*47],r9
	mov r9,1
	mov r14,r14
	add r14,r9
	mov qword [rsp+8*42],r8
	mov qword [rsp+8*63],r10
	mov qword [rsp+8*64],r11
	mov qword [rsp+8*62],r12
	mov qword [rsp+8*48],r13
	mov qword [rsp+8*37],r14
	mov qword [rsp+8*36],r15
	jmp L_239
	
L_240:
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
	mov r8,r13
	mov qword [rsp+8*65],r9
	mov r9,1
	mov qword [rsp+8*66],r10
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*15],r12
	mov r12,r10
	mov qword rdi,r14
	mov r14,0
	mov r15,r14
	mov qword [rsp+8*34],r8
	mov qword [rsp+8*35],r10
	mov qword [rsp+8*33],r11
	mov qword [rsp+8*36],r12
	mov qword rsi,r13
	mov qword [rsp+8*37],r15
	
L_258:
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
	je L_259
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
	mov r11,r10
	mov qword [rsp+8*40],r12
	mov r12,r8
	mov qword [rsp+8*41],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*42],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*42]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*43],r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*44],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*45],r13
	mov qword [rsp+8*46],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*47],r15
	mov r15,r11
	mov qword [rsp+8*42],r9
	mov r9,r15
	mov qword [rsp+8*48],r10
	mov r10,r13
	mov qword [rsp+8*49],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*50],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*36],r11
	mov r11,r13
	mov qword [rsp+8*51],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*52],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*52]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	mov qword [rsp+8*43],r14
	mov r14,1
	mov r13,r13
	add r13,r14
	mov r12,r13
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*51]
	mov qword [rsp+8*45],r9
	mov r9,r11
	mov rcx,r15
	shr r9,cl
	and r9,r12
	mov r12,r9
	mov qword [rsp+8*46],r10
	mov qword [rsp+8*53],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*55],r13
	mov r13,65535
	mov r14,r13
	mov r11,r14
	mov r15,r10
	mov qword [rsp+8*56],r9
	mov r9,r11
	mov rcx,16
	shl r9,cl
	or r9,r15
	mov qword [rsp+8*54],r12
	mov r12,r9
	mov r8,r12
	mov r13,  [rsp+8*54]
	mov qword rdi,r14
	mov r14,r13
	and r14,r8
	mov qword rsi,r10
	mov r10,r14
	mov qword [rsp+8*43],r11
	mov r11,r10
	mov qword [rsp+8*44],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*45],r9
	mov r9,r15
	xor r9,r11
	mov r15,r9
	mov qword [rsp+8*46],r12
	mov qword [rsp+8*57],r8
	mov r8,5
	mov r12,r8
	mov r13,r15
	mov qword [rsp+8*58],r14
	mov r14,r13
	mov qword [rsp+8*59],r10
	mov r10,r12
	mov qword [rsp+8*60],r11
	mov r11,r14
	mov rcx,r10
	shl r11,cl
	mov qword [rsp+8*61],r9
	mov r9,65535
	mov r12,r9
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*36],r15
	mov r15,r13
	mov qword [rsp+8*41],r10
	mov r10,r12
	mov qword [rsp+8*42],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov qword [rsp+8*40],r14
	mov r14,r11
	mov r9,r14
	mov r8,  [rsp+8*42]
	mov r8,r8
	and r8,r9
	mov qword rdi,r13
	mov r13,r8
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*43],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*44],r10
	mov r10,r15
	xor r10,r12
	mov r15,r10
	mov qword [rsp+8*45],r11
	mov qword [rsp+8*46],r14
	mov r14,  [rsp+8*37]
	mov r11,r14
	mov qword [rsp+8*47],r9
	mov r9,1
	mov r14,r14
	add r14,r9
	mov qword [rsp+8*42],r8
	mov qword [rsp+8*63],r10
	mov qword [rsp+8*64],r11
	mov qword [rsp+8*62],r12
	mov qword [rsp+8*48],r13
	mov qword [rsp+8*37],r14
	mov qword [rsp+8*36],r15
	jmp L_258
	
L_259:
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
	mov r8,r13
	mov qword [rsp+8*65],r9
	mov r9,1
	mov qword [rsp+8*66],r10
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*16],r12
	mov r12,r10
	mov qword rdi,r14
	mov r14,0
	mov r15,r14
	mov qword [rsp+8*34],r8
	mov qword [rsp+8*35],r10
	mov qword [rsp+8*33],r11
	mov qword [rsp+8*36],r12
	mov qword rsi,r13
	mov qword [rsp+8*37],r15
	
L_277:
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
	je L_278
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
	mov r11,r10
	mov qword [rsp+8*40],r12
	mov r12,r8
	mov qword [rsp+8*41],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*42],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*42]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*43],r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*44],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*45],r13
	mov qword [rsp+8*46],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*47],r15
	mov r15,r11
	mov qword [rsp+8*42],r9
	mov r9,r15
	mov qword [rsp+8*48],r10
	mov r10,r13
	mov qword [rsp+8*49],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*50],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*36],r11
	mov r11,r13
	mov qword [rsp+8*51],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*52],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*52]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	mov qword [rsp+8*43],r14
	mov r14,1
	mov r13,r13
	add r13,r14
	mov r12,r13
	mov qword [rsp+8*44],r11
	mov r11,  [rsp+8*51]
	mov qword [rsp+8*45],r9
	mov r9,r11
	mov rcx,r15
	shr r9,cl
	and r9,r12
	mov r12,r9
	mov qword [rsp+8*46],r10
	mov qword [rsp+8*53],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*55],r13
	mov r13,65535
	mov r14,r13
	mov r11,r14
	mov r15,r10
	mov qword [rsp+8*56],r9
	mov r9,r11
	mov rcx,16
	shl r9,cl
	or r9,r15
	mov qword [rsp+8*54],r12
	mov r12,r9
	mov r8,r12
	mov r13,  [rsp+8*54]
	mov qword rdi,r14
	mov r14,r13
	and r14,r8
	mov qword rsi,r10
	mov r10,r14
	mov qword [rsp+8*43],r11
	mov r11,r10
	mov qword [rsp+8*44],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*45],r9
	mov r9,r15
	xor r9,r11
	mov r15,r9
	mov qword [rsp+8*46],r12
	mov qword [rsp+8*57],r8
	mov r8,5
	mov r12,r8
	mov r13,r15
	mov qword [rsp+8*58],r14
	mov r14,r13
	mov qword [rsp+8*59],r10
	mov r10,r12
	mov qword [rsp+8*60],r11
	mov r11,r14
	mov rcx,r10
	shl r11,cl
	mov qword [rsp+8*61],r9
	mov r9,65535
	mov r12,r9
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*36],r15
	mov r15,r13
	mov qword [rsp+8*41],r10
	mov r10,r12
	mov qword [rsp+8*42],r11
	mov r11,r15
	mov rcx,16
	shl r11,cl
	or r11,r10
	mov qword [rsp+8*40],r14
	mov r14,r11
	mov r9,r14
	mov r8,  [rsp+8*42]
	mov r8,r8
	and r8,r9
	mov qword rdi,r13
	mov r13,r8
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*43],r15
	mov r15,  [rsp+8*36]
	mov qword [rsp+8*44],r10
	mov r10,r15
	xor r10,r12
	mov r15,r10
	mov qword [rsp+8*45],r11
	mov qword [rsp+8*46],r14
	mov r14,  [rsp+8*37]
	mov r11,r14
	mov qword [rsp+8*47],r9
	mov r9,1
	mov r14,r14
	add r14,r9
	mov qword [rsp+8*42],r8
	mov qword [rsp+8*63],r10
	mov qword [rsp+8*64],r11
	mov qword [rsp+8*62],r12
	mov qword [rsp+8*48],r13
	mov qword [rsp+8*37],r14
	mov qword [rsp+8*36],r15
	jmp L_277
	
L_278:
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
	mov r8,1
	mov qword [rsp+8*65],r9
	mov r9,r11
	add r9,r8
	mov r8,r9
	mov qword [rsp+8*33],r11
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*36],r8
	mov qword [rsp+8*37],r9
	mov qword [rsp+8*66],r10
	mov qword [rsp+8*17],r12
	mov qword rsi,r13
	mov qword rdi,r14
	mov qword [rsp+8*34],r15
	
L_296:
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
	je L_297
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
	mov r11,r10
	mov qword [rsp+8*40],r12
	mov r12,r8
	mov qword [rsp+8*41],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*42],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*42]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*43],r11
	mov r11,  [rsp+8*36]
	mov qword [rsp+8*44],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*49],r8
	mov r12,17
	mov r8,r12
	mov r12,r11
	mov qword [rsp+8*45],r13
	mov r13,r12
	mov qword [rsp+8*46],r14
	mov r14,r8
	mov qword [rsp+8*47],r15
	mov r15,65535
	mov r8,r15
	mov r15,32767
	mov r12,r15
	mov r15,r12
	mov qword [rsp+8*42],r9
	mov r9,r8
	mov qword [rsp+8*48],r10
	mov r10,r15
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov qword [rsp+8*36],r11
	mov r11,r10
	mov qword [rsp+8*51],r13
	mov r13,r11
	mov qword [rsp+8*52],r14
	mov r14,r13
	mov qword [rsp+8*53],r13
	mov r13,  [rsp+8*52]
	mov qword rdi,r12
	mov r12,r14
	mov rcx,r13
	shr r12,cl
	mov r12,r12
	mov rcx,1
	shl r12,cl
	mov qword rsi,r8
	mov r8,1
	mov r12,r12
	add r12,r8
	mov r14,r12
	mov r8,  [rsp+8*51]
	mov r12,r8
	mov rcx,r13
	shr r12,cl
	and r12,r14
	mov r14,r12
	mov r12,65535
	mov r8,r12
	mov r13,65535
	mov r12,r13
	mov r15,r12
	mov r9,r8
	mov r10,r15
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov r13,r11
	mov qword rdi,r12
	mov r12,r14
	and r12,r13
	mov qword [rsp+8*57],r13
	mov r13,r12
	mov r12,r13
	mov qword [rsp+8*59],r13
	mov r13,  [rsp+8*36]
	mov qword [rsp+8*54],r14
	mov r14,r13
	xor r14,r12
	mov r13,r14
	mov qword [rsp+8*60],r12
	mov r12,5
	mov r8,r12
	mov r12,r13
	mov r14,r12
	mov qword [rsp+8*43],r15
	mov r15,r8
	mov qword [rsp+8*44],r9
	mov r9,r14
	mov rcx,r15
	shl r9,cl
	mov qword [rsp+8*40],r14
	mov r14,65535
	mov r8,r14
	mov r14,65535
	mov r12,r14
	mov r14,r12
	mov qword [rsp+8*41],r15
	mov r15,r8
	mov r10,r14
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r11,r10
	mov r10,r11
	mov r9,r9
	and r9,r10
	mov qword [rsp+8*47],r10
	mov r10,r9
	mov r9,r10
	mov qword [rsp+8*48],r10
	mov r10,r13
	xor r10,r9
	mov r13,r10
	mov qword [rsp+8*62],r9
	mov r10,  [rsp+8*37]
	mov r9,r10
	mov qword [rsp+8*64],r9
	mov r9,1
	mov r10,r10
	add r10,r9
	mov qword rsi,r8
	mov qword [rsp+8*37],r10
	mov qword [rsp+8*46],r11
	mov qword rdi,r12
	mov qword [rsp+8*36],r13
	mov qword [rsp+8*43],r14
	mov qword [rsp+8*44],r15
	jmp L_296
	
L_297:
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
	jmp L_18
	
L_19:
	mov r9,  [rsp+8*21]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*101],r8
	mov qword [rsp+8*21],r9
	jmp L_15
	
L_16:
	mov r9,  [rsp+8*19]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*102],r8
	mov qword [rsp+8*19],r9
	jmp L_12
	
L_13:
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
	
L_95:
	mov r8,  [rsp+8*105]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*106],r10
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_96
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
	je L_97
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
	jne L_98
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_99
	
L_98:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_99:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_100
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
	mov qword [rsp+8*116],r8
	mov r8,r12
	mov r11,  [rsp+8*116]
	mov r9,r11
	mov qword rdi,r8
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
	jmp L_102
	
L_100:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_102:
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
	jmp L_103
	
L_97:
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
	jne L_104
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_105
	
L_104:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_105:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_106
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
	mov qword [rsp+8*116],r8
	mov r8,r12
	mov r11,  [rsp+8*116]
	mov r9,r11
	mov qword rdi,r8
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
	jmp L_108
	
L_106:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_108:
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
	
L_103:
	mov r8,  [rsp+8*105]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*127],r10
	jmp L_95
	
L_96:
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
	
L_112:
	mov r8,  [rsp+8*105]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*106],r10
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_113
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
	je L_114
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
	jne L_115
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_116
	
L_115:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_116:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_117
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
	mov qword [rsp+8*116],r8
	mov r8,r12
	mov r11,  [rsp+8*116]
	mov r9,r11
	mov qword rdi,r8
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
	jmp L_119
	
L_117:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_119:
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
	jmp L_120
	
L_114:
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
	jne L_121
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_122
	
L_121:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_122:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_123
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
	mov qword [rsp+8*116],r8
	mov r8,r12
	mov r11,  [rsp+8*116]
	mov r9,r11
	mov qword rdi,r8
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
	jmp L_125
	
L_123:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_125:
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
	
L_120:
	mov r8,  [rsp+8*105]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*127],r10
	jmp L_112
	
L_113:
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
	
L_129:
	mov r8,  [rsp+8*105]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*106],r10
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_130
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
	je L_131
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
	jne L_132
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_133
	
L_132:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_133:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_134
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
	mov qword [rsp+8*116],r8
	mov r8,r12
	mov r11,  [rsp+8*116]
	mov r9,r11
	mov qword rdi,r8
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
	jmp L_136
	
L_134:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_136:
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
	jmp L_137
	
L_131:
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
	jne L_138
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_139
	
L_138:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_139:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_140
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
	mov qword [rsp+8*116],r8
	mov r8,r12
	mov r11,  [rsp+8*116]
	mov r9,r11
	mov qword rdi,r8
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
	jmp L_142
	
L_140:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_142:
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
	
L_137:
	mov r8,  [rsp+8*105]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*127],r10
	jmp L_129
	
L_130:
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
	
L_146:
	mov r8,  [rsp+8*105]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*106],r10
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_147
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
	je L_148
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
	jne L_149
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_150
	
L_149:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_150:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_151
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
	mov qword [rsp+8*116],r8
	mov r8,r12
	mov r11,  [rsp+8*116]
	mov r9,r11
	mov qword rdi,r8
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
	jmp L_153
	
L_151:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_153:
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
	jmp L_154
	
L_148:
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
	jne L_155
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	jmp L_156
	
L_155:
	mov r8,  [rsp+8*111]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*114],r10
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_156:
	mov r8,  [rsp+8*113]
	cmp r8, 0
	je L_157
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
	jmp L_159
	
L_157:
	mov r9,t127
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_159:
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
	
L_154:
	mov r8,  [rsp+8*105]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*105],r8
	mov qword [rsp+8*127],r10
	jmp L_146
	
L_147:
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


