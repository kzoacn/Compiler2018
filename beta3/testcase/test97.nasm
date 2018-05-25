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
	sub    rsp, 1144
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 3128
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
	mov r10,1
	mov r9,r10
	mov r12,50
	mov r11,r12
	mov r14,1
	mov r13,r14
	mov qword [rsp+8*1],r8
	mov r8,50
	mov r15,r8
	mov r10,1
	mov r8,r10
	mov r12,20
	mov r10,r12
	mov r14,30
	mov r12,r14
	mov qword [rsp+8*2],r9
	mov r9,0
	mov r14,r9
	mov qword [rsp+8*3],r11
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*4],r13
	mov r13,0
	mov r11,r13
	mov qword [rsp+8*5],r15
	mov r15,0
	mov r13,r15
	mov qword [rsp+8*6],r8
	mov r8,  [rsp+8*2]
	mov r15,r8
	mov qword [rsp+8*10],r9
	mov qword [rsp+8*7],r10
	mov qword [rsp+8*11],r11
	mov qword [rsp+8*8],r12
	mov qword [rsp+8*12],r13
	mov qword [rsp+8*9],r14
	mov qword [rsp+8*13],r15
	
L_1273:
	mov r8,  [rsp+8*13]
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*14],r10
	mov r8,  [rsp+8*14]
	cmp r8, 0
	je L_1274
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov qword [rsp+8*15],r8
	
L_1276:
	mov r8,  [rsp+8*15]
	mov r9,  [rsp+8*5]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*16],r10
	mov r8,  [rsp+8*16]
	cmp r8, 0
	je L_1277
	mov r9,  [rsp+8*6]
	mov r8,r9
	mov qword [rsp+8*17],r8
	
L_1279:
	mov r8,  [rsp+8*17]
	mov r9,  [rsp+8*7]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*18],r10
	mov r8,  [rsp+8*18]
	cmp r8, 0
	je L_1280
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r11,  [rsp+8*8]
	mov r10,r11
	mov r13,  [rsp+8*2]
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
	mov qword [rsp+8*22],r14
	mov qword [arg+8*2],r8
	mov r8,  [rsp+8*22]
	mov r14,r8
	mov r9,r14
	mov qword [rsp+8*24],r13
	mov r13,r10
	mov qword [rsp+8*25],r11
	mov r11,1
	mov qword [rsp+8*26],r12
	mov r12,r9
	add r12,r11
	mov qword [rsp+8*23],r15
	mov r15,r12
	mov qword rdi,r14
	mov r14,0
	mov r8,r14
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*27],r9
	mov qword rsi,r10
	mov qword [rsp+8*29],r12
	mov qword [rsp+8*28],r13
	mov qword [rsp+8*30],r15
	
L_1636:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov qword [rsp+8*32],r10
	mov r8,  [rsp+8*33]
	add r8,r8
	mov r9,  [rsp+8*32]
	cmp r9, 0
	mov qword [rsp+8*33],r8
	je L_1638
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
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
	mov qword [rsp+8*34],r12
	mov r12,r8
	mov qword [rsp+8*35],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*36],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*36]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*37],r11
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*38],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*39],r13
	mov qword [rsp+8*40],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*41],r15
	mov r15,r11
	mov qword [rsp+8*36],r9
	mov r9,r15
	mov qword [rsp+8*42],r10
	mov r10,r13
	mov qword [rsp+8*43],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*44],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*30],r11
	mov r11,r13
	mov qword [rsp+8*45],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*46],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*46]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	inc r13 
	mov r12,r13
	mov qword [rsp+8*37],r14
	mov r14,  [rsp+8*45]
	mov qword [rsp+8*38],r11
	mov r11,r14
	mov rcx,r15
	shr r11,cl
	and r11,r12
	mov r12,r11
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r10
	mov r10,65535
	mov r9,r10
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*49],r13
	mov r13,65535
	mov r8,r13
	mov r14,r8
	mov r15,r9
	mov qword [rsp+8*50],r11
	mov r11,r14
	mov rcx,16
	shl r11,cl
	or r11,r15
	mov qword [rsp+8*48],r12
	mov r12,r11
	mov r10,r12
	mov r13,  [rsp+8*48]
	mov qword rdi,r8
	mov r8,r13
	and r8,r10
	mov qword rsi,r9
	mov r9,r8
	mov qword [rsp+8*37],r14
	mov r14,r9
	mov qword [rsp+8*38],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*39],r11
	mov r11,r15
	xor r11,r14
	mov r15,r11
	mov qword [rsp+8*40],r12
	mov qword [rsp+8*51],r10
	mov r10,5
	mov r12,r10
	mov r13,r15
	mov qword [rsp+8*52],r8
	mov r8,r13
	mov qword [rsp+8*53],r9
	mov r9,r12
	mov qword [rsp+8*54],r14
	mov r14,r8
	mov rcx,r9
	shl r14,cl
	mov qword [rsp+8*55],r11
	mov r11,65535
	mov r12,r11
	mov r10,65535
	mov r13,r10
	mov qword [rsp+8*30],r15
	mov r15,r13
	mov qword [rsp+8*34],r8
	mov r8,r12
	mov qword [rsp+8*35],r9
	mov r9,r15
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*36],r14
	mov r14,r9
	mov r11,r14
	mov r10,  [rsp+8*36]
	mov r10,r10
	and r10,r11
	mov qword rdi,r13
	mov r13,r10
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*37],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*38],r8
	mov r8,r15
	xor r8,r12
	mov r15,r8
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r14
	mov r14,  [rsp+8*31]
	mov r9,r14
	inc r14 
	mov qword [rsp+8*57],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*41],r11
	mov qword [rsp+8*56],r12
	mov qword [rsp+8*42],r13
	mov qword [rsp+8*31],r14
	mov qword [rsp+8*30],r15
	jmp L_1636
	
L_1638:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,r11
	mov r14,  [rsp+8*26]
	mov r13,r14
	mov r15,r12
	mov r8,r15
	mov qword [rsp+8*59],r9
	mov r9,r13
	mov qword [rsp+8*60],r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*61],r11
	mov r11,65535
	mov r13,r11
	mov r14,65535
	mov r15,r14
	mov qword [rsp+8*62],r12
	mov r12,r15
	mov qword [rsp+8*34],r8
	mov r8,r13
	mov qword [rsp+8*35],r9
	mov r9,r12
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*36],r10
	mov r10,r9
	mov r11,r10
	mov r14,  [rsp+8*36]
	mov r14,r14
	and r14,r11
	mov qword rdi,r15
	mov r15,r14
	mov qword rsi,r13
	mov r13,r15
	mov qword [rsp+8*37],r12
	mov r12,32
	mov qword [rsp+8*38],r8
	mov r8,  [rsp+8*26]
	mov qword [rsp+8*39],r9
	mov r9,r12
	sub r9,r8
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r11
	mov qword [rsp+8*36],r14
	mov r14,  [rsp+8*62]
	mov r11,r14
	mov qword [rsp+8*63],r13
	mov r13,r11
	mov qword [rsp+8*42],r15
	mov r15,r10
	mov r8,65535
	mov r10,r8
	mov r12,32767
	mov r11,r12
	mov qword [rsp+8*64],r9
	mov r9,r11
	mov r14,r10
	mov qword [rsp+8*45],r13
	mov r13,r9
	mov rcx,16
	shl r13,cl
	or r13,r14
	mov qword [rsp+8*46],r15
	mov r15,r13
	mov r8,r15
	mov r12,r8
	mov qword rdi,r11
	mov r11,  [rsp+8*46]
	mov qword rsi,r10
	mov r10,r12
	mov rcx,r11
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r12,r10
	mov qword [rsp+8*37],r9
	mov r9,  [rsp+8*45]
	mov qword [rsp+8*38],r14
	mov r14,r9
	mov rcx,r11
	shr r14,cl
	and r14,r12
	mov r12,r14
	mov qword [rsp+8*39],r13
	mov qword [rsp+8*40],r15
	mov r15,65535
	mov r13,r15
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*49],r10
	mov r10,65535
	mov r8,r10
	mov r9,r8
	mov r11,r13
	mov qword [rsp+8*48],r12
	mov r12,r9
	mov rcx,16
	shl r12,cl
	or r12,r11
	mov qword [rsp+8*50],r14
	mov r14,r12
	mov r15,r14
	mov r10,  [rsp+8*48]
	mov qword rdi,r8
	mov r8,r10
	and r8,r15
	mov qword rsi,r13
	mov r13,r8
	mov qword [rsp+8*37],r9
	mov r9,r13
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*63]
	mov qword [rsp+8*39],r12
	mov r12,r11
	or r12,r9
	mov qword [rsp+8*40],r14
	mov r14,r12
	mov r10,r14
	mov qword [rsp+8*51],r15
	mov r15,r10
	mov qword [rsp+8*68],r10
	mov qword [rsp+8*52],r8
	mov r8,  [rsp+8*17]
	mov r10,r8
	mov qword [rsp+8*53],r13
	mov qword [rsp+8*65],r9
	mov r9,  [rsp+8*8]
	mov r13,r9
	mov qword [rsp+8*66],r12
	mov r12,  [rsp+8*13]
	mov r11,r12
	mov qword [rsp+8*67],r14
	mov r14,r11
	mov qword [rsp+8*69],r15
	mov r15,r13
	mov r8,r10
	mov r9,31
	mov r12,r8
	and r12,r9
	mov qword rdi,r11
	mov r11,r12
	mov r13,r15
	mov qword [rsp+8*22],r14
	mov qword [arg+8*2],r10
	mov r10,  [rsp+8*22]
	mov r14,r10
	mov qword [rsp+8*24],r8
	mov r8,r14
	mov r9,r13
	mov qword [rsp+8*26],r11
	mov r11,1
	mov qword [rsp+8*25],r12
	mov r12,r8
	add r12,r11
	mov qword [rsp+8*23],r15
	mov r15,r12
	mov qword rdi,r14
	mov r14,0
	mov r10,r14
	mov qword [rsp+8*27],r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*31],r10
	mov qword [rsp+8*29],r12
	mov qword rsi,r13
	mov qword [rsp+8*30],r15
	
L_1668:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov qword [rsp+8*32],r10
	mov r8,  [rsp+8*33]
	add r8,r8
	mov r9,  [rsp+8*32]
	cmp r9, 0
	mov qword [rsp+8*33],r8
	je L_1670
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
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
	mov qword [rsp+8*34],r12
	mov r12,r8
	mov qword [rsp+8*35],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*36],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*36]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*37],r11
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*38],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*39],r13
	mov qword [rsp+8*40],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*41],r15
	mov r15,r11
	mov qword [rsp+8*36],r9
	mov r9,r15
	mov qword [rsp+8*42],r10
	mov r10,r13
	mov qword [rsp+8*43],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*44],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*30],r11
	mov r11,r13
	mov qword [rsp+8*45],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*46],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*46]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	inc r13 
	mov r12,r13
	mov qword [rsp+8*37],r14
	mov r14,  [rsp+8*45]
	mov qword [rsp+8*38],r11
	mov r11,r14
	mov rcx,r15
	shr r11,cl
	and r11,r12
	mov r12,r11
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r10
	mov r10,65535
	mov r9,r10
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*49],r13
	mov r13,65535
	mov r8,r13
	mov r14,r8
	mov r15,r9
	mov qword [rsp+8*50],r11
	mov r11,r14
	mov rcx,16
	shl r11,cl
	or r11,r15
	mov qword [rsp+8*48],r12
	mov r12,r11
	mov r10,r12
	mov r13,  [rsp+8*48]
	mov qword rdi,r8
	mov r8,r13
	and r8,r10
	mov qword rsi,r9
	mov r9,r8
	mov qword [rsp+8*37],r14
	mov r14,r9
	mov qword [rsp+8*38],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*39],r11
	mov r11,r15
	xor r11,r14
	mov r15,r11
	mov qword [rsp+8*40],r12
	mov qword [rsp+8*51],r10
	mov r10,5
	mov r12,r10
	mov r13,r15
	mov qword [rsp+8*52],r8
	mov r8,r13
	mov qword [rsp+8*53],r9
	mov r9,r12
	mov qword [rsp+8*54],r14
	mov r14,r8
	mov rcx,r9
	shl r14,cl
	mov qword [rsp+8*55],r11
	mov r11,65535
	mov r12,r11
	mov r10,65535
	mov r13,r10
	mov qword [rsp+8*30],r15
	mov r15,r13
	mov qword [rsp+8*34],r8
	mov r8,r12
	mov qword [rsp+8*35],r9
	mov r9,r15
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*36],r14
	mov r14,r9
	mov r11,r14
	mov r10,  [rsp+8*36]
	mov r10,r10
	and r10,r11
	mov qword rdi,r13
	mov r13,r10
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*37],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*38],r8
	mov r8,r15
	xor r8,r12
	mov r15,r8
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r14
	mov r14,  [rsp+8*31]
	mov r9,r14
	inc r14 
	mov qword [rsp+8*57],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*41],r11
	mov qword [rsp+8*56],r12
	mov qword [rsp+8*42],r13
	mov qword [rsp+8*31],r14
	mov qword [rsp+8*30],r15
	jmp L_1668
	
L_1670:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,r11
	mov r14,  [rsp+8*26]
	mov r13,r14
	mov r15,r12
	mov r8,r15
	mov qword [rsp+8*59],r9
	mov r9,r13
	mov qword [rsp+8*60],r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*61],r11
	mov r11,65535
	mov r13,r11
	mov r14,65535
	mov r15,r14
	mov qword [rsp+8*62],r12
	mov r12,r15
	mov qword [rsp+8*34],r8
	mov r8,r13
	mov qword [rsp+8*35],r9
	mov r9,r12
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*36],r10
	mov r10,r9
	mov r11,r10
	mov r14,  [rsp+8*36]
	mov r14,r14
	and r14,r11
	mov qword rdi,r15
	mov r15,r14
	mov qword rsi,r13
	mov r13,r15
	mov qword [rsp+8*37],r12
	mov r12,32
	mov qword [rsp+8*38],r8
	mov r8,  [rsp+8*26]
	mov qword [rsp+8*39],r9
	mov r9,r12
	sub r9,r8
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r11
	mov qword [rsp+8*36],r14
	mov r14,  [rsp+8*62]
	mov r11,r14
	mov qword [rsp+8*63],r13
	mov r13,r11
	mov qword [rsp+8*42],r15
	mov r15,r10
	mov r8,65535
	mov r10,r8
	mov r12,32767
	mov r11,r12
	mov qword [rsp+8*64],r9
	mov r9,r11
	mov r14,r10
	mov qword [rsp+8*45],r13
	mov r13,r9
	mov rcx,16
	shl r13,cl
	or r13,r14
	mov qword [rsp+8*46],r15
	mov r15,r13
	mov r8,r15
	mov r12,r8
	mov qword rdi,r11
	mov r11,  [rsp+8*46]
	mov qword rsi,r10
	mov r10,r12
	mov rcx,r11
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r12,r10
	mov qword [rsp+8*37],r9
	mov r9,  [rsp+8*45]
	mov qword [rsp+8*38],r14
	mov r14,r9
	mov rcx,r11
	shr r14,cl
	and r14,r12
	mov r12,r14
	mov qword [rsp+8*39],r13
	mov qword [rsp+8*40],r15
	mov r15,65535
	mov r13,r15
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*49],r10
	mov r10,65535
	mov r8,r10
	mov r9,r8
	mov r11,r13
	mov qword [rsp+8*48],r12
	mov r12,r9
	mov rcx,16
	shl r12,cl
	or r12,r11
	mov qword [rsp+8*50],r14
	mov r14,r12
	mov r15,r14
	mov r10,  [rsp+8*48]
	mov qword rdi,r8
	mov r8,r10
	and r8,r15
	mov qword rsi,r13
	mov r13,r8
	mov qword [rsp+8*37],r9
	mov r9,r13
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*63]
	mov qword [rsp+8*39],r12
	mov r12,r11
	or r12,r9
	mov qword [rsp+8*40],r14
	mov r14,r12
	mov r10,r14
	mov qword [rsp+8*51],r15
	mov r15,r10
	mov qword [rsp+8*70],r10
	mov qword [rsp+8*52],r8
	mov r8,  [rsp+8*17]
	mov r10,r8
	mov qword [rsp+8*53],r13
	mov qword [rsp+8*65],r9
	mov r9,  [rsp+8*8]
	mov r13,r9
	mov qword [rsp+8*66],r12
	mov r12,  [rsp+8*15]
	mov r11,r12
	mov qword [rsp+8*67],r14
	mov r14,r11
	mov qword [rsp+8*71],r15
	mov r15,r13
	mov r8,r10
	mov r9,31
	mov r12,r8
	and r12,r9
	mov qword rdi,r11
	mov r11,r12
	mov r13,r15
	mov qword [rsp+8*22],r14
	mov qword [arg+8*2],r10
	mov r10,  [rsp+8*22]
	mov r14,r10
	mov qword [rsp+8*24],r8
	mov r8,r14
	mov r9,r13
	mov qword [rsp+8*26],r11
	mov r11,1
	mov qword [rsp+8*25],r12
	mov r12,r8
	add r12,r11
	mov qword [rsp+8*23],r15
	mov r15,r12
	mov qword rdi,r14
	mov r14,0
	mov r10,r14
	mov qword [rsp+8*27],r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*31],r10
	mov qword [rsp+8*29],r12
	mov qword rsi,r13
	mov qword [rsp+8*30],r15
	
L_1700:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov qword [rsp+8*32],r10
	mov r8,  [rsp+8*33]
	add r8,r8
	mov r9,  [rsp+8*32]
	cmp r9, 0
	mov qword [rsp+8*33],r8
	je L_1702
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
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
	mov qword [rsp+8*34],r12
	mov r12,r8
	mov qword [rsp+8*35],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*36],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*36]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*37],r11
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*38],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*39],r13
	mov qword [rsp+8*40],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*41],r15
	mov r15,r11
	mov qword [rsp+8*36],r9
	mov r9,r15
	mov qword [rsp+8*42],r10
	mov r10,r13
	mov qword [rsp+8*43],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*44],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*30],r11
	mov r11,r13
	mov qword [rsp+8*45],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*46],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*46]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	inc r13 
	mov r12,r13
	mov qword [rsp+8*37],r14
	mov r14,  [rsp+8*45]
	mov qword [rsp+8*38],r11
	mov r11,r14
	mov rcx,r15
	shr r11,cl
	and r11,r12
	mov r12,r11
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r10
	mov r10,65535
	mov r9,r10
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*49],r13
	mov r13,65535
	mov r8,r13
	mov r14,r8
	mov r15,r9
	mov qword [rsp+8*50],r11
	mov r11,r14
	mov rcx,16
	shl r11,cl
	or r11,r15
	mov qword [rsp+8*48],r12
	mov r12,r11
	mov r10,r12
	mov r13,  [rsp+8*48]
	mov qword rdi,r8
	mov r8,r13
	and r8,r10
	mov qword rsi,r9
	mov r9,r8
	mov qword [rsp+8*37],r14
	mov r14,r9
	mov qword [rsp+8*38],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*39],r11
	mov r11,r15
	xor r11,r14
	mov r15,r11
	mov qword [rsp+8*40],r12
	mov qword [rsp+8*51],r10
	mov r10,5
	mov r12,r10
	mov r13,r15
	mov qword [rsp+8*52],r8
	mov r8,r13
	mov qword [rsp+8*53],r9
	mov r9,r12
	mov qword [rsp+8*54],r14
	mov r14,r8
	mov rcx,r9
	shl r14,cl
	mov qword [rsp+8*55],r11
	mov r11,65535
	mov r12,r11
	mov r10,65535
	mov r13,r10
	mov qword [rsp+8*30],r15
	mov r15,r13
	mov qword [rsp+8*34],r8
	mov r8,r12
	mov qword [rsp+8*35],r9
	mov r9,r15
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*36],r14
	mov r14,r9
	mov r11,r14
	mov r10,  [rsp+8*36]
	mov r10,r10
	and r10,r11
	mov qword rdi,r13
	mov r13,r10
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*37],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*38],r8
	mov r8,r15
	xor r8,r12
	mov r15,r8
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r14
	mov r14,  [rsp+8*31]
	mov r9,r14
	inc r14 
	mov qword [rsp+8*57],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*41],r11
	mov qword [rsp+8*56],r12
	mov qword [rsp+8*42],r13
	mov qword [rsp+8*31],r14
	mov qword [rsp+8*30],r15
	jmp L_1700
	
L_1702:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,r11
	mov r14,  [rsp+8*26]
	mov r13,r14
	mov r15,r12
	mov r8,r15
	mov qword [rsp+8*59],r9
	mov r9,r13
	mov qword [rsp+8*60],r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*61],r11
	mov r11,65535
	mov r13,r11
	mov r14,65535
	mov r15,r14
	mov qword [rsp+8*62],r12
	mov r12,r15
	mov qword [rsp+8*34],r8
	mov r8,r13
	mov qword [rsp+8*35],r9
	mov r9,r12
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*36],r10
	mov r10,r9
	mov r11,r10
	mov r14,  [rsp+8*36]
	mov r14,r14
	and r14,r11
	mov qword rdi,r15
	mov r15,r14
	mov qword rsi,r13
	mov r13,r15
	mov qword [rsp+8*37],r12
	mov r12,32
	mov qword [rsp+8*38],r8
	mov r8,  [rsp+8*26]
	mov qword [rsp+8*39],r9
	mov r9,r12
	sub r9,r8
	mov qword [rsp+8*40],r10
	mov r10,r9
	mov qword [rsp+8*41],r11
	mov qword [rsp+8*36],r14
	mov r14,  [rsp+8*62]
	mov r11,r14
	mov qword [rsp+8*63],r13
	mov r13,r11
	mov qword [rsp+8*42],r15
	mov r15,r10
	mov r8,65535
	mov r10,r8
	mov r12,32767
	mov r11,r12
	mov qword [rsp+8*64],r9
	mov r9,r11
	mov r14,r10
	mov qword [rsp+8*45],r13
	mov r13,r9
	mov rcx,16
	shl r13,cl
	or r13,r14
	mov qword [rsp+8*46],r15
	mov r15,r13
	mov r8,r15
	mov r12,r8
	mov qword rdi,r11
	mov r11,  [rsp+8*46]
	mov qword rsi,r10
	mov r10,r12
	mov rcx,r11
	shr r10,cl
	mov r10,r10
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r12,r10
	mov qword [rsp+8*37],r9
	mov r9,  [rsp+8*45]
	mov qword [rsp+8*38],r14
	mov r14,r9
	mov rcx,r11
	shr r14,cl
	and r14,r12
	mov r12,r14
	mov qword [rsp+8*39],r13
	mov qword [rsp+8*40],r15
	mov r15,65535
	mov r13,r15
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*49],r10
	mov r10,65535
	mov r8,r10
	mov r9,r8
	mov r11,r13
	mov qword [rsp+8*48],r12
	mov r12,r9
	mov rcx,16
	shl r12,cl
	or r12,r11
	mov qword [rsp+8*50],r14
	mov r14,r12
	mov r15,r14
	mov r10,  [rsp+8*48]
	mov qword rdi,r8
	mov r8,r10
	and r8,r15
	mov qword rsi,r13
	mov r13,r8
	mov qword [rsp+8*37],r9
	mov r9,r13
	mov qword [rsp+8*38],r11
	mov r11,  [rsp+8*63]
	mov qword [rsp+8*39],r12
	mov r12,r11
	or r12,r9
	mov qword [rsp+8*40],r14
	mov r14,r12
	mov r10,r14
	mov qword [rsp+8*51],r15
	mov r15,r10
	mov qword [rsp+8*72],r10
	mov r10,  [rsp+8*13]
	mov qword [rsp+8*52],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*53],r13
	mov r13,r10
	xor r13,r8
	mov qword [rsp+8*65],r9
	mov r11,  [rsp+8*17]
	mov r9,r11
	mov qword [rsp+8*66],r12
	mov qword [rsp+8*67],r14
	mov r14,  [rsp+8*8]
	mov r12,r14
	mov r14,r13
	mov r13,r14
	mov qword [rsp+8*73],r15
	mov r15,r12
	mov r8,r9
	mov qword [arg+8*2],r9
	mov r9,31
	mov r10,r8
	and r10,r9
	mov qword [rsp+8*24],r8
	mov r8,r10
	mov r12,r15
	mov r14,r13
	mov r9,r14
	mov r10,r12
	mov qword [rsp+8*22],r13
	mov r13,1
	mov qword [rsp+8*23],r15
	mov r15,r9
	add r15,r13
	mov r11,r15
	mov qword [rsp+8*26],r8
	mov qword rdi,r14
	mov r14,0
	mov r8,r14
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*27],r9
	mov qword [rsp+8*28],r10
	mov qword [rsp+8*30],r11
	mov qword rsi,r12
	mov qword [rsp+8*29],r15
	
L_1732:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov qword [rsp+8*32],r10
	mov r8,  [rsp+8*33]
	add r8,r8
	mov r9,  [rsp+8*32]
	cmp r9, 0
	mov qword [rsp+8*33],r8
	je L_1734
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
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
	mov qword [rsp+8*34],r12
	mov r12,r8
	mov qword [rsp+8*35],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*36],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*36]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*37],r11
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*38],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*39],r13
	mov qword [rsp+8*40],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*41],r15
	mov r15,r11
	mov qword [rsp+8*36],r9
	mov r9,r15
	mov qword [rsp+8*42],r10
	mov r10,r13
	mov qword [rsp+8*43],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*44],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*30],r11
	mov r11,r13
	mov qword [rsp+8*45],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*46],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*46]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	inc r13 
	mov r12,r13
	mov qword [rsp+8*37],r14
	mov r14,  [rsp+8*45]
	mov qword [rsp+8*38],r11
	mov r11,r14
	mov rcx,r15
	shr r11,cl
	and r11,r12
	mov r12,r11
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r10
	mov r10,65535
	mov r9,r10
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*49],r13
	mov r13,65535
	mov r8,r13
	mov r14,r8
	mov r15,r9
	mov qword [rsp+8*50],r11
	mov r11,r14
	mov rcx,16
	shl r11,cl
	or r11,r15
	mov qword [rsp+8*48],r12
	mov r12,r11
	mov r10,r12
	mov r13,  [rsp+8*48]
	mov qword rdi,r8
	mov r8,r13
	and r8,r10
	mov qword rsi,r9
	mov r9,r8
	mov qword [rsp+8*37],r14
	mov r14,r9
	mov qword [rsp+8*38],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*39],r11
	mov r11,r15
	xor r11,r14
	mov r15,r11
	mov qword [rsp+8*40],r12
	mov qword [rsp+8*51],r10
	mov r10,5
	mov r12,r10
	mov r13,r15
	mov qword [rsp+8*52],r8
	mov r8,r13
	mov qword [rsp+8*53],r9
	mov r9,r12
	mov qword [rsp+8*54],r14
	mov r14,r8
	mov rcx,r9
	shl r14,cl
	mov qword [rsp+8*55],r11
	mov r11,65535
	mov r12,r11
	mov r10,65535
	mov r13,r10
	mov qword [rsp+8*30],r15
	mov r15,r13
	mov qword [rsp+8*34],r8
	mov r8,r12
	mov qword [rsp+8*35],r9
	mov r9,r15
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*36],r14
	mov r14,r9
	mov r11,r14
	mov r10,  [rsp+8*36]
	mov r10,r10
	and r10,r11
	mov qword rdi,r13
	mov r13,r10
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*37],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*38],r8
	mov r8,r15
	xor r8,r12
	mov r15,r8
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r14
	mov r14,  [rsp+8*31]
	mov r9,r14
	inc r14 
	mov qword [rsp+8*57],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*41],r11
	mov qword [rsp+8*56],r12
	mov qword [rsp+8*42],r13
	mov qword [rsp+8*31],r14
	mov qword [rsp+8*30],r15
	jmp L_1732
	
L_1734:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,r11
	mov r14,  [rsp+8*26]
	mov r13,r14
	mov r15,r12
	mov qword [rsp+8*61],r11
	mov r11,r15
	mov r8,r13
	mov qword [rsp+8*59],r9
	mov r9,r11
	mov rcx,r8
	shl r9,cl
	mov qword [rsp+8*60],r10
	mov r10,65535
	mov r13,r10
	mov r14,65535
	mov r15,r14
	mov qword [rsp+8*62],r12
	mov r12,r15
	mov qword [rsp+8*35],r8
	mov r8,r13
	mov qword [rsp+8*36],r9
	mov r9,r12
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*34],r11
	mov r11,r9
	mov r10,r11
	mov r14,  [rsp+8*36]
	mov r14,r14
	and r14,r10
	mov qword rdi,r15
	mov r15,r14
	mov qword rsi,r13
	mov r13,r15
	mov qword [rsp+8*37],r12
	mov r12,32
	mov qword [rsp+8*38],r8
	mov r8,  [rsp+8*26]
	mov qword [rsp+8*39],r9
	mov r9,r12
	sub r9,r8
	mov r8,r9
	mov r12,  [rsp+8*62]
	mov r9,r12
	mov r12,r9
	mov qword [rsp+8*40],r11
	mov r11,r8
	mov qword [rsp+8*41],r10
	mov r10,65535
	mov r8,r10
	mov qword [rsp+8*36],r14
	mov r14,32767
	mov r9,r14
	mov qword [rsp+8*63],r13
	mov r13,r9
	mov qword [rsp+8*42],r15
	mov r15,r8
	mov qword [rsp+8*45],r12
	mov r12,r13
	mov rcx,16
	shl r12,cl
	or r12,r15
	mov qword [rsp+8*46],r11
	mov r11,r12
	mov r10,r11
	mov r14,r10
	mov qword rdi,r9
	mov r9,  [rsp+8*46]
	mov qword rsi,r8
	mov r8,r14
	mov rcx,r9
	shr r8,cl
	mov r8,r8
	mov rcx,1
	shl r8,cl
	inc r8 
	mov r14,r8
	mov qword [rsp+8*37],r13
	mov r13,  [rsp+8*45]
	mov qword [rsp+8*38],r15
	mov r15,r13
	mov rcx,r9
	shr r15,cl
	and r15,r14
	mov r14,r15
	mov qword [rsp+8*39],r12
	mov qword [rsp+8*40],r11
	mov r11,65535
	mov r12,r11
	mov qword [rsp+8*47],r10
	mov qword [rsp+8*49],r8
	mov r8,65535
	mov r10,r8
	mov r9,r10
	mov r13,r12
	mov qword [rsp+8*48],r14
	mov r14,r9
	mov rcx,16
	shl r14,cl
	or r14,r13
	mov qword [rsp+8*50],r15
	mov r15,r14
	mov r11,r15
	mov r8,  [rsp+8*48]
	mov qword rdi,r10
	mov r10,r8
	and r10,r11
	mov qword rsi,r12
	mov r12,r10
	mov qword [rsp+8*37],r9
	mov r9,r12
	mov qword [rsp+8*38],r13
	mov r13,  [rsp+8*63]
	mov qword [rsp+8*39],r14
	mov r14,r13
	or r14,r9
	mov qword [rsp+8*65],r9
	mov r9,r14
	mov r13,r9
	mov qword [rsp+8*67],r9
	mov r9,r13
	mov qword [rsp+8*75],r13
	mov r14,1
	mov r13,r14
	mov qword [rsp+8*40],r15
	mov r15,  [rsp+8*17]
	mov r14,r15
	mov r8,r14
	mov qword [rsp+8*51],r11
	mov r11,r13
	mov qword [rsp+8*52],r10
	mov r10,1
	mov qword [rsp+8*53],r12
	mov r12,r8
	add r12,r10
	mov qword [rsp+8*76],r9
	mov r9,r12
	mov qword rdi,r14
	mov r14,0
	mov r15,r14
	mov qword [rsp+8*27],r8
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*28],r11
	mov qword [rsp+8*29],r12
	mov qword rsi,r13
	mov qword [rsp+8*31],r15
	
L_1444:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov qword [rsp+8*32],r10
	mov r8,  [rsp+8*33]
	add r8,r8
	mov r9,  [rsp+8*32]
	cmp r9, 0
	mov qword [rsp+8*33],r8
	je L_1446
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
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
	mov qword [rsp+8*34],r12
	mov r12,r8
	mov qword [rsp+8*35],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*36],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*36]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*37],r11
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*38],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*39],r13
	mov qword [rsp+8*40],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*41],r15
	mov r15,r11
	mov qword [rsp+8*36],r9
	mov r9,r15
	mov qword [rsp+8*42],r10
	mov r10,r13
	mov qword [rsp+8*43],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*44],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*30],r11
	mov r11,r13
	mov qword [rsp+8*45],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*46],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*46]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	inc r13 
	mov r12,r13
	mov qword [rsp+8*37],r14
	mov r14,  [rsp+8*45]
	mov qword [rsp+8*38],r11
	mov r11,r14
	mov rcx,r15
	shr r11,cl
	and r11,r12
	mov r12,r11
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r10
	mov r10,65535
	mov r9,r10
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*49],r13
	mov r13,65535
	mov r8,r13
	mov r14,r8
	mov r15,r9
	mov qword [rsp+8*50],r11
	mov r11,r14
	mov rcx,16
	shl r11,cl
	or r11,r15
	mov qword [rsp+8*48],r12
	mov r12,r11
	mov r10,r12
	mov r13,  [rsp+8*48]
	mov qword rdi,r8
	mov r8,r13
	and r8,r10
	mov qword rsi,r9
	mov r9,r8
	mov qword [rsp+8*37],r14
	mov r14,r9
	mov qword [rsp+8*38],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*39],r11
	mov r11,r15
	xor r11,r14
	mov r15,r11
	mov qword [rsp+8*40],r12
	mov qword [rsp+8*51],r10
	mov r10,5
	mov r12,r10
	mov r13,r15
	mov qword [rsp+8*52],r8
	mov r8,r13
	mov qword [rsp+8*53],r9
	mov r9,r12
	mov qword [rsp+8*54],r14
	mov r14,r8
	mov rcx,r9
	shl r14,cl
	mov qword [rsp+8*55],r11
	mov r11,65535
	mov r12,r11
	mov r10,65535
	mov r13,r10
	mov qword [rsp+8*30],r15
	mov r15,r13
	mov qword [rsp+8*34],r8
	mov r8,r12
	mov qword [rsp+8*35],r9
	mov r9,r15
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*36],r14
	mov r14,r9
	mov r11,r14
	mov r10,  [rsp+8*36]
	mov r10,r10
	and r10,r11
	mov qword rdi,r13
	mov r13,r10
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*37],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*38],r8
	mov r8,r15
	xor r8,r12
	mov r15,r8
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r14
	mov r14,  [rsp+8*31]
	mov r9,r14
	inc r14 
	mov qword [rsp+8*57],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*41],r11
	mov qword [rsp+8*56],r12
	mov qword [rsp+8*42],r13
	mov qword [rsp+8*31],r14
	mov qword [rsp+8*30],r15
	jmp L_1444
	
L_1446:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r13,1
	mov r12,r13
	mov r15,  [rsp+8*15]
	mov r14,r15
	mov r13,r14
	mov r8,r12
	mov qword [rsp+8*59],r9
	mov r9,1
	mov qword [rsp+8*60],r10
	mov r10,r13
	add r10,r9
	mov qword [rsp+8*77],r11
	mov r11,r10
	mov qword rdi,r14
	mov r14,0
	mov r15,r14
	mov qword [rsp+8*28],r8
	mov qword [rsp+8*29],r10
	mov qword [rsp+8*30],r11
	mov qword rsi,r12
	mov qword [rsp+8*27],r13
	mov qword [rsp+8*31],r15
	
L_1464:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov qword [rsp+8*32],r10
	mov r8,  [rsp+8*33]
	add r8,r8
	mov r9,  [rsp+8*32]
	cmp r9, 0
	mov qword [rsp+8*33],r8
	je L_1466
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
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
	mov qword [rsp+8*34],r12
	mov r12,r8
	mov qword [rsp+8*35],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*36],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*36]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*37],r11
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*38],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*39],r13
	mov qword [rsp+8*40],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*41],r15
	mov r15,r11
	mov qword [rsp+8*36],r9
	mov r9,r15
	mov qword [rsp+8*42],r10
	mov r10,r13
	mov qword [rsp+8*43],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*44],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*30],r11
	mov r11,r13
	mov qword [rsp+8*45],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*46],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*46]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	inc r13 
	mov r12,r13
	mov qword [rsp+8*37],r14
	mov r14,  [rsp+8*45]
	mov qword [rsp+8*38],r11
	mov r11,r14
	mov rcx,r15
	shr r11,cl
	and r11,r12
	mov r12,r11
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r10
	mov r10,65535
	mov r9,r10
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*49],r13
	mov r13,65535
	mov r8,r13
	mov r14,r8
	mov r15,r9
	mov qword [rsp+8*50],r11
	mov r11,r14
	mov rcx,16
	shl r11,cl
	or r11,r15
	mov qword [rsp+8*48],r12
	mov r12,r11
	mov r10,r12
	mov r13,  [rsp+8*48]
	mov qword rdi,r8
	mov r8,r13
	and r8,r10
	mov qword rsi,r9
	mov r9,r8
	mov qword [rsp+8*37],r14
	mov r14,r9
	mov qword [rsp+8*38],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*39],r11
	mov r11,r15
	xor r11,r14
	mov r15,r11
	mov qword [rsp+8*40],r12
	mov qword [rsp+8*51],r10
	mov r10,5
	mov r12,r10
	mov r13,r15
	mov qword [rsp+8*52],r8
	mov r8,r13
	mov qword [rsp+8*53],r9
	mov r9,r12
	mov qword [rsp+8*54],r14
	mov r14,r8
	mov rcx,r9
	shl r14,cl
	mov qword [rsp+8*55],r11
	mov r11,65535
	mov r12,r11
	mov r10,65535
	mov r13,r10
	mov qword [rsp+8*30],r15
	mov r15,r13
	mov qword [rsp+8*34],r8
	mov r8,r12
	mov qword [rsp+8*35],r9
	mov r9,r15
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*36],r14
	mov r14,r9
	mov r11,r14
	mov r10,  [rsp+8*36]
	mov r10,r10
	and r10,r11
	mov qword rdi,r13
	mov r13,r10
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*37],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*38],r8
	mov r8,r15
	xor r8,r12
	mov r15,r8
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r14
	mov r14,  [rsp+8*31]
	mov r9,r14
	inc r14 
	mov qword [rsp+8*57],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*41],r11
	mov qword [rsp+8*56],r12
	mov qword [rsp+8*42],r13
	mov qword [rsp+8*31],r14
	mov qword [rsp+8*30],r15
	jmp L_1464
	
L_1466:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,  [rsp+8*77]
	mov r13,r12
	xor r13,r11
	mov r15,1
	mov r14,r15
	mov qword [rsp+8*78],r11
	mov r12,  [rsp+8*13]
	mov r11,r12
	mov r15,r11
	mov r8,r14
	mov qword [rsp+8*59],r9
	mov r9,1
	mov qword [rsp+8*60],r10
	mov r10,r15
	add r10,r9
	mov qword [rsp+8*79],r13
	mov r13,r10
	mov qword rdi,r11
	mov r11,0
	mov r12,r11
	mov qword [rsp+8*28],r8
	mov qword [rsp+8*29],r10
	mov qword [rsp+8*31],r12
	mov qword [rsp+8*30],r13
	mov qword rsi,r14
	mov qword [rsp+8*27],r15
	
L_1484:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov qword [rsp+8*32],r10
	mov r8,  [rsp+8*33]
	add r8,r8
	mov r9,  [rsp+8*32]
	cmp r9, 0
	mov qword [rsp+8*33],r8
	je L_1486
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
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
	mov qword [rsp+8*34],r12
	mov r12,r8
	mov qword [rsp+8*35],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*36],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*36]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*37],r11
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*38],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*39],r13
	mov qword [rsp+8*40],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*41],r15
	mov r15,r11
	mov qword [rsp+8*36],r9
	mov r9,r15
	mov qword [rsp+8*42],r10
	mov r10,r13
	mov qword [rsp+8*43],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*44],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*30],r11
	mov r11,r13
	mov qword [rsp+8*45],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*46],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*46]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	inc r13 
	mov r12,r13
	mov qword [rsp+8*37],r14
	mov r14,  [rsp+8*45]
	mov qword [rsp+8*38],r11
	mov r11,r14
	mov rcx,r15
	shr r11,cl
	and r11,r12
	mov r12,r11
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r10
	mov r10,65535
	mov r9,r10
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*49],r13
	mov r13,65535
	mov r8,r13
	mov r14,r8
	mov r15,r9
	mov qword [rsp+8*50],r11
	mov r11,r14
	mov rcx,16
	shl r11,cl
	or r11,r15
	mov qword [rsp+8*48],r12
	mov r12,r11
	mov r10,r12
	mov r13,  [rsp+8*48]
	mov qword rdi,r8
	mov r8,r13
	and r8,r10
	mov qword rsi,r9
	mov r9,r8
	mov qword [rsp+8*37],r14
	mov r14,r9
	mov qword [rsp+8*38],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*39],r11
	mov r11,r15
	xor r11,r14
	mov r15,r11
	mov qword [rsp+8*40],r12
	mov qword [rsp+8*51],r10
	mov r10,5
	mov r12,r10
	mov r13,r15
	mov qword [rsp+8*52],r8
	mov r8,r13
	mov qword [rsp+8*53],r9
	mov r9,r12
	mov qword [rsp+8*54],r14
	mov r14,r8
	mov rcx,r9
	shl r14,cl
	mov qword [rsp+8*55],r11
	mov r11,65535
	mov r12,r11
	mov r10,65535
	mov r13,r10
	mov qword [rsp+8*30],r15
	mov r15,r13
	mov qword [rsp+8*34],r8
	mov r8,r12
	mov qword [rsp+8*35],r9
	mov r9,r15
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*36],r14
	mov r14,r9
	mov r11,r14
	mov r10,  [rsp+8*36]
	mov r10,r10
	and r10,r11
	mov qword rdi,r13
	mov r13,r10
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*37],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*38],r8
	mov r8,r15
	xor r8,r12
	mov r15,r8
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r14
	mov r14,  [rsp+8*31]
	mov r9,r14
	inc r14 
	mov qword [rsp+8*57],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*41],r11
	mov qword [rsp+8*56],r12
	mov qword [rsp+8*42],r13
	mov qword [rsp+8*31],r14
	mov qword [rsp+8*30],r15
	jmp L_1484
	
L_1486:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,  [rsp+8*79]
	mov r12,r12
	xor r12,r11
	mov r13,r12
	mov r14,  [rsp+8*69]
	mov r15,r14
	xor r15,r13
	mov qword [rsp+8*80],r11
	mov r12,1
	mov r11,r12
	mov r12,r15
	mov r14,r12
	mov r15,r11
	mov r8,1
	mov qword [rsp+8*59],r9
	mov r9,r14
	add r9,r8
	mov qword [rsp+8*60],r10
	mov r10,r9
	mov qword [rsp+8*81],r13
	mov qword rdi,r12
	mov r12,0
	mov r13,r12
	mov qword [rsp+8*29],r9
	mov qword [rsp+8*30],r10
	mov qword rsi,r11
	mov qword [rsp+8*31],r13
	mov qword [rsp+8*27],r14
	mov qword [rsp+8*28],r15
	
L_1504:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov qword [rsp+8*32],r10
	mov r8,  [rsp+8*33]
	add r8,r8
	mov r9,  [rsp+8*32]
	cmp r9, 0
	mov qword [rsp+8*33],r8
	je L_1506
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
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
	mov qword [rsp+8*34],r12
	mov r12,r8
	mov qword [rsp+8*35],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*36],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*36]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*37],r11
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*38],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*39],r13
	mov qword [rsp+8*40],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*41],r15
	mov r15,r11
	mov qword [rsp+8*36],r9
	mov r9,r15
	mov qword [rsp+8*42],r10
	mov r10,r13
	mov qword [rsp+8*43],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*44],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*30],r11
	mov r11,r13
	mov qword [rsp+8*45],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*46],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*46]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	inc r13 
	mov r12,r13
	mov qword [rsp+8*37],r14
	mov r14,  [rsp+8*45]
	mov qword [rsp+8*38],r11
	mov r11,r14
	mov rcx,r15
	shr r11,cl
	and r11,r12
	mov r12,r11
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r10
	mov r10,65535
	mov r9,r10
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*49],r13
	mov r13,65535
	mov r8,r13
	mov r14,r8
	mov r15,r9
	mov qword [rsp+8*50],r11
	mov r11,r14
	mov rcx,16
	shl r11,cl
	or r11,r15
	mov qword [rsp+8*48],r12
	mov r12,r11
	mov r10,r12
	mov r13,  [rsp+8*48]
	mov qword rdi,r8
	mov r8,r13
	and r8,r10
	mov qword rsi,r9
	mov r9,r8
	mov qword [rsp+8*37],r14
	mov r14,r9
	mov qword [rsp+8*38],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*39],r11
	mov r11,r15
	xor r11,r14
	mov r15,r11
	mov qword [rsp+8*40],r12
	mov qword [rsp+8*51],r10
	mov r10,5
	mov r12,r10
	mov r13,r15
	mov qword [rsp+8*52],r8
	mov r8,r13
	mov qword [rsp+8*53],r9
	mov r9,r12
	mov qword [rsp+8*54],r14
	mov r14,r8
	mov rcx,r9
	shl r14,cl
	mov qword [rsp+8*55],r11
	mov r11,65535
	mov r12,r11
	mov r10,65535
	mov r13,r10
	mov qword [rsp+8*30],r15
	mov r15,r13
	mov qword [rsp+8*34],r8
	mov r8,r12
	mov qword [rsp+8*35],r9
	mov r9,r15
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*36],r14
	mov r14,r9
	mov r11,r14
	mov r10,  [rsp+8*36]
	mov r10,r10
	and r10,r11
	mov qword rdi,r13
	mov r13,r10
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*37],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*38],r8
	mov r8,r15
	xor r8,r12
	mov r15,r8
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r14
	mov r14,  [rsp+8*31]
	mov r9,r14
	inc r14 
	mov qword [rsp+8*57],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*41],r11
	mov qword [rsp+8*56],r12
	mov qword [rsp+8*42],r13
	mov qword [rsp+8*31],r14
	mov qword [rsp+8*30],r15
	jmp L_1504
	
L_1506:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,  [rsp+8*9]
	mov r13,r12
	add r13,r11
	mov r12,r13
	mov r14,  [rsp+8*71]
	mov r15,  [rsp+8*81]
	mov qword [rsp+8*83],r11
	mov r11,r14
	xor r11,r15
	mov r14,1
	mov r13,r14
	mov r14,r11
	mov r11,r14
	mov r8,r13
	mov qword [rsp+8*59],r9
	mov r9,1
	mov qword [rsp+8*60],r10
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*9],r12
	mov r12,r10
	mov qword rdi,r14
	mov r14,0
	mov r15,r14
	mov qword [rsp+8*28],r8
	mov qword [rsp+8*29],r10
	mov qword [rsp+8*27],r11
	mov qword [rsp+8*30],r12
	mov qword rsi,r13
	mov qword [rsp+8*31],r15
	
L_1524:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov qword [rsp+8*32],r10
	mov r8,  [rsp+8*33]
	add r8,r8
	mov r9,  [rsp+8*32]
	cmp r9, 0
	mov qword [rsp+8*33],r8
	je L_1526
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
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
	mov qword [rsp+8*34],r12
	mov r12,r8
	mov qword [rsp+8*35],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*36],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*36]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*37],r11
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*38],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*39],r13
	mov qword [rsp+8*40],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*41],r15
	mov r15,r11
	mov qword [rsp+8*36],r9
	mov r9,r15
	mov qword [rsp+8*42],r10
	mov r10,r13
	mov qword [rsp+8*43],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*44],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*30],r11
	mov r11,r13
	mov qword [rsp+8*45],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*46],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*46]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	inc r13 
	mov r12,r13
	mov qword [rsp+8*37],r14
	mov r14,  [rsp+8*45]
	mov qword [rsp+8*38],r11
	mov r11,r14
	mov rcx,r15
	shr r11,cl
	and r11,r12
	mov r12,r11
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r10
	mov r10,65535
	mov r9,r10
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*49],r13
	mov r13,65535
	mov r8,r13
	mov r14,r8
	mov r15,r9
	mov qword [rsp+8*50],r11
	mov r11,r14
	mov rcx,16
	shl r11,cl
	or r11,r15
	mov qword [rsp+8*48],r12
	mov r12,r11
	mov r10,r12
	mov r13,  [rsp+8*48]
	mov qword rdi,r8
	mov r8,r13
	and r8,r10
	mov qword rsi,r9
	mov r9,r8
	mov qword [rsp+8*37],r14
	mov r14,r9
	mov qword [rsp+8*38],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*39],r11
	mov r11,r15
	xor r11,r14
	mov r15,r11
	mov qword [rsp+8*40],r12
	mov qword [rsp+8*51],r10
	mov r10,5
	mov r12,r10
	mov r13,r15
	mov qword [rsp+8*52],r8
	mov r8,r13
	mov qword [rsp+8*53],r9
	mov r9,r12
	mov qword [rsp+8*54],r14
	mov r14,r8
	mov rcx,r9
	shl r14,cl
	mov qword [rsp+8*55],r11
	mov r11,65535
	mov r12,r11
	mov r10,65535
	mov r13,r10
	mov qword [rsp+8*30],r15
	mov r15,r13
	mov qword [rsp+8*34],r8
	mov r8,r12
	mov qword [rsp+8*35],r9
	mov r9,r15
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*36],r14
	mov r14,r9
	mov r11,r14
	mov r10,  [rsp+8*36]
	mov r10,r10
	and r10,r11
	mov qword rdi,r13
	mov r13,r10
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*37],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*38],r8
	mov r8,r15
	xor r8,r12
	mov r15,r8
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r14
	mov r14,  [rsp+8*31]
	mov r9,r14
	inc r14 
	mov qword [rsp+8*57],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*41],r11
	mov qword [rsp+8*56],r12
	mov qword [rsp+8*42],r13
	mov qword [rsp+8*31],r14
	mov qword [rsp+8*30],r15
	jmp L_1524
	
L_1526:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,  [rsp+8*10]
	mov r13,r12
	add r13,r11
	mov r12,r13
	mov r14,  [rsp+8*73]
	mov r15,  [rsp+8*81]
	mov qword [rsp+8*86],r11
	mov r11,r14
	xor r11,r15
	mov r14,1
	mov r13,r14
	mov r14,r11
	mov r11,r14
	mov r8,r13
	mov qword [rsp+8*59],r9
	mov r9,1
	mov qword [rsp+8*60],r10
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*10],r12
	mov r12,r10
	mov qword rdi,r14
	mov r14,0
	mov r15,r14
	mov qword [rsp+8*28],r8
	mov qword [rsp+8*29],r10
	mov qword [rsp+8*27],r11
	mov qword [rsp+8*30],r12
	mov qword rsi,r13
	mov qword [rsp+8*31],r15
	
L_1544:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov qword [rsp+8*32],r10
	mov r8,  [rsp+8*33]
	add r8,r8
	mov r9,  [rsp+8*32]
	cmp r9, 0
	mov qword [rsp+8*33],r8
	je L_1546
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
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
	mov qword [rsp+8*34],r12
	mov r12,r8
	mov qword [rsp+8*35],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*36],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*36]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*37],r11
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*38],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*39],r13
	mov qword [rsp+8*40],r14
	mov r14,17
	mov r13,r14
	mov qword [rsp+8*41],r15
	mov r15,r11
	mov qword [rsp+8*36],r9
	mov r9,r15
	mov qword [rsp+8*42],r10
	mov r10,r13
	mov qword [rsp+8*43],r8
	mov r8,65535
	mov r13,r8
	mov qword [rsp+8*44],r12
	mov r12,32767
	mov r15,r12
	mov r14,r15
	mov qword [rsp+8*30],r11
	mov r11,r13
	mov qword [rsp+8*45],r9
	mov r9,r14
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov qword [rsp+8*46],r10
	mov r10,r9
	mov r8,r10
	mov r12,r8
	mov qword rdi,r15
	mov r15,  [rsp+8*46]
	mov qword rsi,r13
	mov r13,r12
	mov rcx,r15
	shr r13,cl
	mov r13,r13
	mov rcx,1
	shl r13,cl
	inc r13 
	mov r12,r13
	mov qword [rsp+8*37],r14
	mov r14,  [rsp+8*45]
	mov qword [rsp+8*38],r11
	mov r11,r14
	mov rcx,r15
	shr r11,cl
	and r11,r12
	mov r12,r11
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r10
	mov r10,65535
	mov r9,r10
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*49],r13
	mov r13,65535
	mov r8,r13
	mov r14,r8
	mov r15,r9
	mov qword [rsp+8*50],r11
	mov r11,r14
	mov rcx,16
	shl r11,cl
	or r11,r15
	mov qword [rsp+8*48],r12
	mov r12,r11
	mov r10,r12
	mov r13,  [rsp+8*48]
	mov qword rdi,r8
	mov r8,r13
	and r8,r10
	mov qword rsi,r9
	mov r9,r8
	mov qword [rsp+8*37],r14
	mov r14,r9
	mov qword [rsp+8*38],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*39],r11
	mov r11,r15
	xor r11,r14
	mov r15,r11
	mov qword [rsp+8*40],r12
	mov qword [rsp+8*51],r10
	mov r10,5
	mov r12,r10
	mov r13,r15
	mov qword [rsp+8*52],r8
	mov r8,r13
	mov qword [rsp+8*53],r9
	mov r9,r12
	mov qword [rsp+8*54],r14
	mov r14,r8
	mov rcx,r9
	shl r14,cl
	mov qword [rsp+8*55],r11
	mov r11,65535
	mov r12,r11
	mov r10,65535
	mov r13,r10
	mov qword [rsp+8*30],r15
	mov r15,r13
	mov qword [rsp+8*34],r8
	mov r8,r12
	mov qword [rsp+8*35],r9
	mov r9,r15
	mov rcx,16
	shl r9,cl
	or r9,r8
	mov qword [rsp+8*36],r14
	mov r14,r9
	mov r11,r14
	mov r10,  [rsp+8*36]
	mov r10,r10
	and r10,r11
	mov qword rdi,r13
	mov r13,r10
	mov qword rsi,r12
	mov r12,r13
	mov qword [rsp+8*37],r15
	mov r15,  [rsp+8*30]
	mov qword [rsp+8*38],r8
	mov r8,r15
	xor r8,r12
	mov r15,r8
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*40],r14
	mov r14,  [rsp+8*31]
	mov r9,r14
	inc r14 
	mov qword [rsp+8*57],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*41],r11
	mov qword [rsp+8*56],r12
	mov qword [rsp+8*42],r13
	mov qword [rsp+8*31],r14
	mov qword [rsp+8*30],r15
	jmp L_1544
	
L_1546:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,  [rsp+8*11]
	mov r13,r12
	add r13,r11
	mov r12,r13
	mov r14,  [rsp+8*76]
	mov r15,  [rsp+8*81]
	mov qword [rsp+8*89],r11
	mov r11,r14
	xor r11,r15
	mov r14,1
	mov r13,r14
	mov r14,r11
	mov r11,r14
	mov r15,r13
	mov r8,1
	mov qword [rsp+8*59],r9
	mov r9,r11
	add r9,r8
	mov r8,r9
	mov qword [rsp+8*27],r11
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*60],r10
	mov qword [rsp+8*11],r12
	mov qword rsi,r13
	mov qword rdi,r14
	mov qword [rsp+8*28],r15
	
L_1564:
	mov r8,  [rsp+8*28]
	mov r9,10
	mov r10,r8
	imul r10,r9
	mov r11,  [rsp+8*31]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov qword [rsp+8*32],r10
	mov r8,  [rsp+8*33]
	add r8,r8
	mov r9,  [rsp+8*32]
	cmp r9, 0
	mov qword [rsp+8*33],r8
	je L_1566
	mov r9,13
	mov r8,r9
	mov r11,  [rsp+8*30]
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
	mov qword [rsp+8*34],r12
	mov r12,r8
	mov qword [rsp+8*35],r13
	mov r13,r11
	mov rcx,16
	shl r13,cl
	or r13,r12
	mov qword [rsp+8*36],r14
	mov r14,r13
	mov r15,r14
	mov r9,  [rsp+8*36]
	mov r9,r9
	and r9,r15
	mov qword rdi,r10
	mov r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*37],r11
	mov r11,  [rsp+8*30]
	mov qword [rsp+8*38],r12
	mov r12,r11
	xor r12,r8
	mov r11,r12
	mov qword [rsp+8*43],r8
	mov r12,17
	mov r8,r12
	mov r12,r11
	mov qword [rsp+8*39],r13
	mov r13,r12
	mov qword [rsp+8*40],r14
	mov r14,r8
	mov qword [rsp+8*41],r15
	mov r15,65535
	mov r8,r15
	mov r15,32767
	mov r12,r15
	mov r15,r12
	mov qword [rsp+8*36],r9
	mov r9,r8
	mov qword [rsp+8*42],r10
	mov r10,r15
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov qword [rsp+8*30],r11
	mov r11,r10
	mov qword [rsp+8*45],r13
	mov r13,r11
	mov qword [rsp+8*46],r14
	mov r14,r13
	mov qword [rsp+8*47],r13
	mov r13,  [rsp+8*46]
	mov qword rdi,r12
	mov r12,r14
	mov rcx,r13
	shr r12,cl
	mov r12,r12
	mov rcx,1
	shl r12,cl
	inc r12 
	mov r14,r12
	mov r12,  [rsp+8*45]
	mov qword rsi,r8
	mov r8,r12
	mov rcx,r13
	shr r8,cl
	and r8,r14
	mov r14,r8
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
	mov qword [rsp+8*51],r13
	mov r13,r12
	mov r12,r13
	mov qword [rsp+8*53],r13
	mov r13,  [rsp+8*30]
	mov qword [rsp+8*48],r14
	mov r14,r13
	xor r14,r12
	mov r13,r14
	mov qword [rsp+8*54],r12
	mov r12,5
	mov r8,r12
	mov r12,r13
	mov r14,r12
	mov qword [rsp+8*37],r15
	mov r15,r8
	mov qword [rsp+8*38],r9
	mov r9,r14
	mov rcx,r15
	shl r9,cl
	mov qword [rsp+8*34],r14
	mov r14,65535
	mov r8,r14
	mov r14,65535
	mov r12,r14
	mov r14,r12
	mov qword [rsp+8*35],r15
	mov r15,r8
	mov r10,r14
	mov rcx,16
	shl r10,cl
	or r10,r15
	mov r11,r10
	mov r10,r11
	mov r9,r9
	and r9,r10
	mov qword [rsp+8*41],r10
	mov r10,r9
	mov r9,r10
	mov qword [rsp+8*42],r10
	mov r10,r13
	xor r10,r9
	mov r13,r10
	mov qword [rsp+8*56],r9
	mov r10,  [rsp+8*31]
	mov r9,r10
	inc r10 
	mov qword rsi,r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*31],r10
	mov qword [rsp+8*40],r11
	mov qword rdi,r12
	mov qword [rsp+8*30],r13
	mov qword [rsp+8*37],r14
	mov qword [rsp+8*38],r15
	jmp L_1564
	
L_1566:
	mov r8,  [rsp+8*30]
	mov r9,r8
	xor r9,123456789
	mov r10,r9
	mov r11,r10
	mov r12,  [rsp+8*12]
	mov r13,r12
	add r13,r11
	mov r12,r13
	mov r15,  [rsp+8*17]
	mov r14,r15
	inc r15 
	mov qword [rsp+8*59],r9
	mov qword [rsp+8*60],r10
	mov qword [rsp+8*92],r11
	mov qword [rsp+8*12],r12
	mov qword [rsp+8*93],r13
	mov qword [rsp+8*94],r14
	mov qword [rsp+8*17],r15
	jmp L_1279
	
L_1280:
	mov r9,  [rsp+8*15]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*95],r8
	mov qword [rsp+8*15],r9
	jmp L_1276
	
L_1277:
	mov r9,  [rsp+8*13]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*96],r8
	mov qword [rsp+8*13],r9
	jmp L_1273
	
L_1274:
	mov r9,  [rsp+8*9]
	mov r8,r9
	mov r10,r8
	mov r12,t127
	mov r11,r12
	mov r14,28
	mov r13,r14
	mov qword rdi,r8
	mov qword [rsp+8*97],r10
	mov qword [rsp+8*98],r11
	mov qword [rsp+8*99],r13
	
L_1356:
	mov r8,  [rsp+8*99]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*100],r10
	mov r8,  [rsp+8*100]
	cmp r8, 0
	je L_1357
	mov r8,  [rsp+8*97]
	mov r9,  [rsp+8*99]
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
	mov qword [rsp+8*101],r10
	mov qword [rsp+8*102],r12
	mov qword [rsp+8*103],r14
	mov r8,  [rsp+8*103]
	cmp r8, 0
	je L_1358
	mov r8,48
	mov r9,  [rsp+8*102]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r12,r11
	mov r13,32
	cmp r12,r13
	mov r14, 0
	setge r14B
	mov qword [rsp+8*104],r10
	mov qword rdi,r11
	mov qword [rsp+8*105],r12
	mov qword [rsp+8*106],r14
	mov r8,  [rsp+8*106]
	cmp r8, 0
	jne L_1359
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1360
	
L_1359:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*107],r10
	mov r9,  [rsp+8*107]
	mov r8,r9
	mov qword [rsp+8*106],r8
	
L_1360:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1361
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov r12,r10
	sub r12,r11
	mov r13,32
	mov r14,r10
	sub r14,r13
	mov r15,r14
	mov qword [rsp+8*109],r8
	mov r8,r12
	mov r11,  [rsp+8*109]
	mov r9,r11
	mov qword rdi,r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*110],r12
	mov qword [rsp+8*111],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1363
	
L_1361:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1363:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*115],r8
	mov     rsi, [rsp+8*115]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*116], rax
	mov r9,  [rsp+8*116]
	mov r8,r9
	mov qword [rsp+8*98],r8
	jmp L_1364
	
L_1358:
	mov r8,65
	mov r9,  [rsp+8*102]
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
	mov qword [rsp+8*117],r10
	mov qword rdi,r12
	mov qword [rsp+8*105],r13
	mov qword [rsp+8*106],r15
	mov r8,  [rsp+8*106]
	cmp r8, 0
	jne L_1365
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1366
	
L_1365:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*107],r10
	mov r9,  [rsp+8*107]
	mov r8,r9
	mov qword [rsp+8*106],r8
	
L_1366:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1367
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov r12,r10
	sub r12,r11
	mov r13,32
	mov r14,r10
	sub r14,r13
	mov r15,r14
	mov qword [rsp+8*109],r8
	mov r8,r12
	mov r11,  [rsp+8*109]
	mov r9,r11
	mov qword rdi,r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*110],r12
	mov qword [rsp+8*111],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1369
	
L_1367:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1369:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*118],r8
	mov     rsi, [rsp+8*118]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*119], rax
	mov r9,  [rsp+8*119]
	mov r8,r9
	mov qword [rsp+8*98],r8
	
L_1364:
	mov r8,  [rsp+8*99]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*99],r8
	mov qword [rsp+8*120],r10
	jmp L_1356
	
L_1357:
	mov r9,  [rsp+8*98]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*121],r8
	mov qword [rsp+8*122],r10
	mov     rsi, t222
	mov     rdi, [rsp+8*122]
	call    concat
	mov [rsp+8*123], rax
	mov r9,  [rsp+8*123]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*124],r10
	mov rdi, format
	mov rsi,[rsp+8*124] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r9,  [rsp+8*10]
	mov r8,r9
	mov r10,r8
	mov r12,t127
	mov r11,r12
	mov r14,28
	mov r13,r14
	mov qword rdi,r8
	mov qword [rsp+8*97],r10
	mov qword [rsp+8*98],r11
	mov qword [rsp+8*99],r13
	
L_1373:
	mov r8,  [rsp+8*99]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*100],r10
	mov r8,  [rsp+8*100]
	cmp r8, 0
	je L_1374
	mov r8,  [rsp+8*97]
	mov r9,  [rsp+8*99]
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
	mov qword [rsp+8*101],r10
	mov qword [rsp+8*102],r12
	mov qword [rsp+8*103],r14
	mov r8,  [rsp+8*103]
	cmp r8, 0
	je L_1375
	mov r8,48
	mov r9,  [rsp+8*102]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r12,r11
	mov r13,32
	cmp r12,r13
	mov r14, 0
	setge r14B
	mov qword [rsp+8*104],r10
	mov qword rdi,r11
	mov qword [rsp+8*105],r12
	mov qword [rsp+8*106],r14
	mov r8,  [rsp+8*106]
	cmp r8, 0
	jne L_1376
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1377
	
L_1376:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*107],r10
	mov r9,  [rsp+8*107]
	mov r8,r9
	mov qword [rsp+8*106],r8
	
L_1377:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1378
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov r12,r10
	sub r12,r11
	mov r13,32
	mov r14,r10
	sub r14,r13
	mov r15,r14
	mov qword [rsp+8*109],r8
	mov r8,r12
	mov r11,  [rsp+8*109]
	mov r9,r11
	mov qword rdi,r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*110],r12
	mov qword [rsp+8*111],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1380
	
L_1378:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1380:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*115],r8
	mov     rsi, [rsp+8*115]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*116], rax
	mov r9,  [rsp+8*116]
	mov r8,r9
	mov qword [rsp+8*98],r8
	jmp L_1381
	
L_1375:
	mov r8,65
	mov r9,  [rsp+8*102]
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
	mov qword [rsp+8*117],r10
	mov qword rdi,r12
	mov qword [rsp+8*105],r13
	mov qword [rsp+8*106],r15
	mov r8,  [rsp+8*106]
	cmp r8, 0
	jne L_1382
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1383
	
L_1382:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*107],r10
	mov r9,  [rsp+8*107]
	mov r8,r9
	mov qword [rsp+8*106],r8
	
L_1383:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1384
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov r12,r10
	sub r12,r11
	mov r13,32
	mov r14,r10
	sub r14,r13
	mov r15,r14
	mov qword [rsp+8*109],r8
	mov r8,r12
	mov r11,  [rsp+8*109]
	mov r9,r11
	mov qword rdi,r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*110],r12
	mov qword [rsp+8*111],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1386
	
L_1384:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1386:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*118],r8
	mov     rsi, [rsp+8*118]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*119], rax
	mov r9,  [rsp+8*119]
	mov r8,r9
	mov qword [rsp+8*98],r8
	
L_1381:
	mov r8,  [rsp+8*99]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*99],r8
	mov qword [rsp+8*120],r10
	jmp L_1373
	
L_1374:
	mov r9,  [rsp+8*98]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*121],r8
	mov qword [rsp+8*125],r10
	mov     rsi, t229
	mov     rdi, [rsp+8*125]
	call    concat
	mov [rsp+8*126], rax
	mov r9,  [rsp+8*126]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*127],r10
	mov rdi, format
	mov rsi,[rsp+8*127] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r9,  [rsp+8*11]
	mov r8,r9
	mov r10,r8
	mov r12,t127
	mov r11,r12
	mov r14,28
	mov r13,r14
	mov qword rdi,r8
	mov qword [rsp+8*97],r10
	mov qword [rsp+8*98],r11
	mov qword [rsp+8*99],r13
	
L_1390:
	mov r8,  [rsp+8*99]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*100],r10
	mov r8,  [rsp+8*100]
	cmp r8, 0
	je L_1391
	mov r8,  [rsp+8*97]
	mov r9,  [rsp+8*99]
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
	mov qword [rsp+8*101],r10
	mov qword [rsp+8*102],r12
	mov qword [rsp+8*103],r14
	mov r8,  [rsp+8*103]
	cmp r8, 0
	je L_1392
	mov r8,48
	mov r9,  [rsp+8*102]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r12,r11
	mov r13,32
	cmp r12,r13
	mov r14, 0
	setge r14B
	mov qword [rsp+8*104],r10
	mov qword rdi,r11
	mov qword [rsp+8*105],r12
	mov qword [rsp+8*106],r14
	mov r8,  [rsp+8*106]
	cmp r8, 0
	jne L_1393
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1394
	
L_1393:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*107],r10
	mov r9,  [rsp+8*107]
	mov r8,r9
	mov qword [rsp+8*106],r8
	
L_1394:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1395
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov r12,r10
	sub r12,r11
	mov r13,32
	mov r14,r10
	sub r14,r13
	mov r15,r14
	mov qword [rsp+8*109],r8
	mov r8,r12
	mov r11,  [rsp+8*109]
	mov r9,r11
	mov qword rdi,r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*110],r12
	mov qword [rsp+8*111],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1397
	
L_1395:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1397:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*115],r8
	mov     rsi, [rsp+8*115]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*116], rax
	mov r9,  [rsp+8*116]
	mov r8,r9
	mov qword [rsp+8*98],r8
	jmp L_1398
	
L_1392:
	mov r8,65
	mov r9,  [rsp+8*102]
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
	mov qword [rsp+8*117],r10
	mov qword rdi,r12
	mov qword [rsp+8*105],r13
	mov qword [rsp+8*106],r15
	mov r8,  [rsp+8*106]
	cmp r8, 0
	jne L_1399
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1400
	
L_1399:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*107],r10
	mov r9,  [rsp+8*107]
	mov r8,r9
	mov qword [rsp+8*106],r8
	
L_1400:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1401
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov r12,r10
	sub r12,r11
	mov r13,32
	mov r14,r10
	sub r14,r13
	mov r15,r14
	mov qword [rsp+8*109],r8
	mov r8,r12
	mov r11,  [rsp+8*109]
	mov r9,r11
	mov qword rdi,r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*110],r12
	mov qword [rsp+8*111],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1403
	
L_1401:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1403:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*118],r8
	mov     rsi, [rsp+8*118]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*119], rax
	mov r9,  [rsp+8*119]
	mov r8,r9
	mov qword [rsp+8*98],r8
	
L_1398:
	mov r8,  [rsp+8*99]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*99],r8
	mov qword [rsp+8*120],r10
	jmp L_1390
	
L_1391:
	mov r9,  [rsp+8*98]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*121],r8
	mov qword [rsp+8*128],r10
	mov     rsi, t236
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
	mov r9,  [rsp+8*12]
	mov r8,r9
	mov r10,r8
	mov r12,t127
	mov r11,r12
	mov r14,28
	mov r13,r14
	mov qword rdi,r8
	mov qword [rsp+8*97],r10
	mov qword [rsp+8*98],r11
	mov qword [rsp+8*99],r13
	
L_1407:
	mov r8,  [rsp+8*99]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*100],r10
	mov r8,  [rsp+8*100]
	cmp r8, 0
	je L_1408
	mov r8,  [rsp+8*97]
	mov r9,  [rsp+8*99]
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
	mov qword [rsp+8*101],r10
	mov qword [rsp+8*102],r12
	mov qword [rsp+8*103],r14
	mov r8,  [rsp+8*103]
	cmp r8, 0
	je L_1409
	mov r8,48
	mov r9,  [rsp+8*102]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r12,r11
	mov r13,32
	cmp r12,r13
	mov r14, 0
	setge r14B
	mov qword [rsp+8*104],r10
	mov qword rdi,r11
	mov qword [rsp+8*105],r12
	mov qword [rsp+8*106],r14
	mov r8,  [rsp+8*106]
	cmp r8, 0
	jne L_1410
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1411
	
L_1410:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*107],r10
	mov r9,  [rsp+8*107]
	mov r8,r9
	mov qword [rsp+8*106],r8
	
L_1411:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1412
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov r12,r10
	sub r12,r11
	mov r13,32
	mov r14,r10
	sub r14,r13
	mov r15,r14
	mov qword [rsp+8*109],r8
	mov r8,r12
	mov r11,  [rsp+8*109]
	mov r9,r11
	mov qword rdi,r8
	mov qword [arg+8*63],r9
	mov qword [rsp+8*110],r12
	mov qword [rsp+8*111],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1414
	
L_1412:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1414:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*115],r8
	mov     rsi, [rsp+8*115]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*116], rax
	mov r9,  [rsp+8*116]
	mov r8,r9
	mov qword [rsp+8*98],r8
	jmp L_1415
	
L_1409:
	mov r8,65
	mov r9,  [rsp+8*102]
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
	mov qword [rsp+8*117],r10
	mov qword rdi,r12
	mov qword [rsp+8*105],r13
	mov qword [rsp+8*106],r15
	mov r8,  [rsp+8*106]
	cmp r8, 0
	jne L_1416
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*106],r8
	jmp L_1417
	
L_1416:
	mov r8,  [rsp+8*105]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*107],r10
	mov r9,  [rsp+8*107]
	mov r8,r9
	mov qword [rsp+8*106],r8
	
L_1417:
	mov r8,  [rsp+8*106]
	cmp r8, 0
	je L_1418
	mov r9,  [gbl+8*108]
	mov r8,r9
	mov r10,  [rsp+8*105]
	mov r11,32
	mov r12,r10
	sub r12,r11
	mov r13,32
	mov r14,r10
	sub r14,r13
	mov r15,r14
	mov r10,r12
	mov r11,r8
	mov qword [rsp+8*109],r8
	mov qword rdi,r10
	mov qword [arg+8*63],r11
	mov qword [rsp+8*110],r12
	mov qword [rsp+8*111],r14
	mov qword rsi,r15
	mov     rsi, rsi
	mov     rdi, rdi
	call    substring
	mov [rsp+8*113], rax
	mov r9,  [rsp+8*113]
	mov r8,r9
	mov qword [rsp+8*114],r8
	jmp L_1420
	
L_1418:
	mov r9,t125
	mov r8,r9
	mov qword [rsp+8*114],r8
	
L_1420:
	mov r9,  [rsp+8*114]
	mov r8,r9
	mov qword [rsp+8*118],r8
	mov     rsi, [rsp+8*118]
	mov     rdi, [rsp+8*98]
	call    concat
	mov [rsp+8*119], rax
	mov r9,  [rsp+8*119]
	mov r8,r9
	mov qword [rsp+8*98],r8
	
L_1415:
	mov r8,  [rsp+8*99]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*99],r8
	mov qword [rsp+8*120],r10
	jmp L_1407
	
L_1408:
	mov r9,  [rsp+8*98]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*121],r8
	mov qword [rsp+8*131],r10
	mov     rsi, t243
	mov     rdi, [rsp+8*131]
	call    concat
	mov [rsp+8*132], rax
	mov r9,  [rsp+8*132]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*133],r10
	mov rdi, format
	mov rsi,[rsp+8*133] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r9,t248
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*134],r10
	mov rdi,[rsp+8*134] 
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
	sub    rsp, 1144
	mov r9,t109
	mov r8,r9
	mov qword [gbl+8*108],r8
	mov r8,  [rsp+8*135]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   3128
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
	
t229:
	 db 1," " ,0

t109:
	 db 95," !",34,"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[",92,"]^_`abcdefghijklmnopqrstuvwxyz{|}~" ,0

t236:
	 db 1," " ,0

t125:
	 db 0,"" ,0

t127:
	 db 0,"" ,0

t248:
	 db 0,"" ,0

t243:
	 db 1," " ,0

t222:
	 db 1," " ,0


