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
	sub    rsp, 2424
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 4408
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	call global_init
	mov r8 , rax
	mov r10,102
	mov r9,r10
	mov r12,0
	mov r11,r12
	mov qword [rsp+8*1],r8
	mov r8,0
	mov r13,r8
	mov r10,0
	mov r8,r10
	mov r12,0
	mov r10,r12
	mov r12,1
	mov qword [rsp+8*3],r11
	mov r11,r9
	sub r11,r12
	mov r12,r11
	mov r11,1
	mov qword [rsp+8*4],r13
	mov r13,r9
	sub r13,r11
	mov r11,r13
	mov qword [rsp+8*5],r8
	mov r8,0
	mov r13,r8
	mov qword [rsp+8*6],r10
	mov r10,0
	mov r8,r10
	mov qword [rsp+8*8],r12
	mov r12,0
	mov r10,r12
	mov qword [rsp+8*2],r9
	mov r9,0
	mov r12,r9
	mov r9,  [rsp+8*2]
	mov qword [rsp+8*10],r11
	mov r11,r9
	imul r11,r9
	mov qword [rsp+8*12],r8
	mov qword [rsp+8*13],r10
	mov qword [rsp+8*15],r11
	mov qword [rsp+8*14],r12
	mov qword [rsp+8*11],r13
	mov     rdi, [rsp+8*15]
	call    mallocArray
	mov     qword [rsp+8*16], rax
	mov r9,  [rsp+8*16]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*17],r8
	mov qword [rsp+8*18],r10
	
L_219:
	mov r8,  [rsp+8*2]
	mov r9,r8
	imul r9,r8
	mov r10,  [rsp+8*18]
	cmp r10,r9
	mov r11, 0
	setl r11B
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*20],r11
	mov r8,  [rsp+8*20]
	cmp r8, 0
	je L_220
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*18]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,0
	mov [r11],r12
	mov r13,r10
	mov qword [rsp+8*21],r8
	mov r8,1
	mov r10,r10
	add r10,r8
	mov qword [rsp+8*18],r10
	mov qword [rsp+8*22],r11
	mov qword [rsp+8*23],r13
	jmp L_219
	
L_220:
	mov r8,  [rsp+8*2]
	mov r9,r8
	imul r9,r8
	mov qword [rsp+8*24],r9
	mov     rdi, [rsp+8*24]
	call    mallocArray
	mov     qword [rsp+8*25], rax
	mov r9,  [rsp+8*25]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*26],r8
	mov qword [rsp+8*18],r10
	
L_222:
	mov r8,  [rsp+8*2]
	mov r9,r8
	imul r9,r8
	mov r10,  [rsp+8*18]
	cmp r10,r9
	mov r11, 0
	setl r11B
	mov qword [rsp+8*27],r9
	mov qword [rsp+8*28],r11
	mov r8,  [rsp+8*28]
	cmp r8, 0
	je L_223
	mov r9,  [rsp+8*26]
	mov r8,r9
	mov r10,  [rsp+8*18]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,0
	mov [r11],r12
	mov r13,r10
	mov qword [rsp+8*29],r8
	mov r8,1
	mov r10,r10
	add r10,r8
	mov qword [rsp+8*18],r10
	mov qword [rsp+8*30],r11
	mov qword [rsp+8*31],r13
	jmp L_222
	
L_223:
	mov     rdi, [rsp+8*2]
	call    mallocArray
	mov     qword [rsp+8*32], rax
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*18],r10
	
L_225:
	mov r8,  [rsp+8*18]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*34],r10
	mov r8,  [rsp+8*34]
	cmp r8, 0
	je L_226
	mov     rdi, [rsp+8*2]
	call    mallocArray
	mov     qword [rsp+8*35], rax
	mov r9,  [rsp+8*33]
	mov r8,r9
	mov r10,  [rsp+8*18]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,  [rsp+8*35]
	mov [r11],r12
	mov qword [rsp+8*36],r8
	mov r8,0
	mov r13,r8
	mov qword [rsp+8*37],r11
	mov qword [rsp+8*38],r13
	
L_228:
	mov r8,  [rsp+8*38]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*39],r10
	mov r8,  [rsp+8*39]
	cmp r8, 0
	je L_229
	mov r8,1
	mov r9,r8
	neg r9
	mov r11,  [rsp+8*33]
	mov r10,r11
	mov r12,  [rsp+8*18]
	mov r13,r12
	add r13,1
	shl r13,4
	add r13,r10
	mov r10, [r13]
	mov r8,  [rsp+8*38]
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r10
	mov [r13],r9
	mov r9,r8
	mov qword [rsp+8*43],r9
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*38],r8
	mov qword [rsp+8*41],r10
	mov qword [rsp+8*42],r13
	jmp L_228
	
L_229:
	mov r9,  [rsp+8*18]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*44],r8
	mov qword [rsp+8*18],r9
	jmp L_225
	
L_226:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,  [rsp+8*5]
	mov [r11],r12
	mov qword [rsp+8*45],r8
	mov r8,  [rsp+8*26]
	mov r13,r8
	mov r10,0
	mov qword [rsp+8*46],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r13
	mov r10,  [rsp+8*6]
	mov [r11],r10
	mov qword [rsp+8*48],r11
	mov qword [rsp+8*47],r13
	mov r13,  [rsp+8*33]
	mov r11,r13
	mov r9,r12
	add r9,1
	shl r9,4
	add r9,r11
	mov r11, [r9]
	mov r9,r10
	add r9,1
	shl r9,4
	add r9,r11
	mov r10,0
	mov [r9],r10
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*49],r11
	
L_231:
	mov r8,  [rsp+8*3]
	mov r9,  [rsp+8*4]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*51],r10
	mov r8,  [rsp+8*51]
	cmp r8, 0
	je L_232
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*52],r8
	mov r8,  [rsp+8*26]
	mov r13,r8
	mov qword [rsp+8*53],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r13
	mov qword [rsp+8*55],r13
	mov r13, [r11]
	mov qword [rsp+8*56],r11
	mov r9,  [rsp+8*33]
	mov r11,r9
	mov r8,r12
	add r8,1
	shl r8,4
	add r8,r11
	mov r11, [r8]
	mov r8,r13
	add r8,1
	shl r8,4
	add r8,r11
	mov qword [rsp+8*58],r11
	mov r11, [r8]
	mov qword [rsp+8*59],r8
	mov r8,r11
	mov qword [rsp+8*60],r11
	mov qword [rsp+8*54],r12
	mov r12,  [rsp+8*17]
	mov r11,r12
	mov qword [rsp+8*57],r13
	mov r13,r10
	add r13,1
	shl r13,4
	add r13,r11
	mov qword [rsp+8*61],r11
	mov r11, [r13]
	mov qword [rsp+8*62],r13
	mov r13,1
	mov r9,r11
	sub r9,r13
	mov qword [rsp+8*63],r11
	mov r11,r9
	mov r13,  [rsp+8*26]
	mov r9,r13
	mov qword [rsp+8*13],r8
	mov r8,r10
	add r8,1
	shl r8,4
	add r8,r9
	mov qword [rsp+8*65],r9
	mov r9, [r8]
	mov qword [rsp+8*66],r8
	mov r8,2
	mov r12,r9
	sub r12,r8
	mov r8,r12
	mov qword [rsp+8*67],r9
	mov r12,  [rsp+8*2]
	mov r9,r12
	mov qword [rsp+8*11],r11
	mov r13,  [rsp+8*11]
	mov r11,r13
	mov r10,r11
	mov qword [rsp+8*12],r8
	mov r8,r9
	cmp r10,r8
	mov r12, 0
	setl r12B
	mov qword [rsp+8*72],r8
	mov qword rsi,r9
	mov qword [rsp+8*71],r10
	mov qword rdi,r11
	mov qword [rsp+8*73],r12
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_321
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_322
	
L_321:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_322:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*77],r10
	jne L_233
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*78],r8
	jmp L_234
	
L_233:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov r9, 0
	setl r9B
	mov qword rsi,r8
	mov qword [rsp+8*73],r9
	mov qword rdi,r10
	mov qword [rsp+8*71],r12
	mov qword [rsp+8*72],r13
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_325
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_326
	
L_325:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_326:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*79],r10
	mov qword [rsp+8*78],r11
	
L_234:
	mov r8,  [rsp+8*78]
	cmp r8, 0
	je L_236
	mov r9,  [rsp+8*33]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*12]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov qword [rsp+8*80],r8
	mov r8,1
	mov qword [rsp+8*81],r11
	mov r11,r8
	neg r11
	cmp r13,r11
	mov r8, 0
	sete r8B
	mov qword [rsp+8*84],r8
	mov qword [rsp+8*83],r11
	mov qword [rsp+8*82],r13
	mov r8,  [rsp+8*84]
	cmp r8, 0
	je L_238
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [rsp+8*17]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r9,  [rsp+8*11]
	mov [r13],r9
	mov qword [rsp+8*86],r11
	mov r11,  [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*87],r13
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r10
	mov qword [rsp+8*88],r10
	mov r10,  [rsp+8*12]
	mov [r13],r10
	mov qword [rsp+8*89],r13
	mov r13,  [rsp+8*13]
	mov r12,1
	mov r9,r13
	add r9,r12
	mov r11,  [rsp+8*33]
	mov r12,r11
	mov qword [rsp+8*4],r8
	mov r8,  [rsp+8*11]
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r12
	mov r12, [r10]
	mov qword [rsp+8*90],r9
	mov r9,  [rsp+8*12]
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r12
	mov qword [rsp+8*91],r12
	mov r12,  [rsp+8*90]
	mov [r10],r12
	mov qword [rsp+8*92],r10
	mov r10,  [rsp+8*8]
	cmp r8,r10
	mov r12, 0
	sete r12B
	mov qword [rsp+8*93],r12
	mov r8,  [rsp+8*93]
	cmp r8, 0
	jne L_239
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*94],r8
	jmp L_240
	
L_239:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*95],r10
	mov r9,  [rsp+8*95]
	mov r8,r9
	mov qword [rsp+8*94],r8
	
L_240:
	mov r8,  [rsp+8*94]
	cmp r8, 0
	je L_242
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_242:
	
L_238:
	
L_236:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,1
	mov qword [rsp+8*96],r8
	mov r8,r12
	sub r8,r13
	mov qword [rsp+8*97],r11
	mov r11,r8
	mov qword [rsp+8*98],r12
	mov r12,  [rsp+8*26]
	mov r8,r12
	mov r13,r10
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*100],r8
	mov r8, [r13]
	mov qword [rsp+8*101],r13
	mov r13,2
	mov r9,r8
	add r9,r13
	mov qword [rsp+8*102],r8
	mov r8,r9
	mov r13,  [rsp+8*2]
	mov r9,r13
	mov qword [rsp+8*11],r11
	mov r12,  [rsp+8*11]
	mov r11,r12
	mov r10,r11
	mov qword [rsp+8*12],r8
	mov r8,r9
	cmp r10,r8
	mov r13, 0
	setl r13B
	mov qword [rsp+8*72],r8
	mov qword rsi,r9
	mov qword [rsp+8*71],r10
	mov qword rdi,r11
	mov qword [rsp+8*73],r13
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_329
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_330
	
L_329:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_330:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*104],r10
	jne L_243
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*105],r8
	jmp L_244
	
L_243:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov r9, 0
	setl r9B
	mov qword rsi,r8
	mov qword [rsp+8*73],r9
	mov qword rdi,r10
	mov qword [rsp+8*71],r12
	mov qword [rsp+8*72],r13
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_333
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_334
	
L_333:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_334:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*106],r10
	mov qword [rsp+8*105],r11
	
L_244:
	mov r8,  [rsp+8*105]
	cmp r8, 0
	je L_246
	mov r9,  [rsp+8*33]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*12]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov qword [rsp+8*107],r8
	mov r8,1
	mov qword [rsp+8*108],r11
	mov r11,r8
	neg r11
	cmp r13,r11
	mov r8, 0
	sete r8B
	mov qword [rsp+8*111],r8
	mov qword [rsp+8*110],r11
	mov qword [rsp+8*109],r13
	mov r8,  [rsp+8*111]
	cmp r8, 0
	je L_248
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [rsp+8*17]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r9,  [rsp+8*11]
	mov [r13],r9
	mov qword [rsp+8*113],r11
	mov r11,  [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*114],r13
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r10
	mov qword [rsp+8*115],r10
	mov r10,  [rsp+8*12]
	mov [r13],r10
	mov qword [rsp+8*116],r13
	mov r13,  [rsp+8*13]
	mov r12,1
	mov r9,r13
	add r9,r12
	mov r11,  [rsp+8*33]
	mov r12,r11
	mov qword [rsp+8*4],r8
	mov r8,  [rsp+8*11]
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r12
	mov r12, [r10]
	mov qword [rsp+8*117],r9
	mov r9,  [rsp+8*12]
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r12
	mov qword [rsp+8*118],r12
	mov r12,  [rsp+8*117]
	mov [r10],r12
	mov qword [rsp+8*119],r10
	mov r10,  [rsp+8*8]
	cmp r8,r10
	mov r12, 0
	sete r12B
	mov qword [rsp+8*120],r12
	mov r8,  [rsp+8*120]
	cmp r8, 0
	jne L_249
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*121],r8
	jmp L_250
	
L_249:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*122],r10
	mov r9,  [rsp+8*122]
	mov r8,r9
	mov qword [rsp+8*121],r8
	
L_250:
	mov r8,  [rsp+8*121]
	cmp r8, 0
	je L_252
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_252:
	
L_248:
	
L_246:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,1
	mov qword [rsp+8*123],r8
	mov r8,r12
	add r8,r13
	mov qword [rsp+8*124],r11
	mov r11,r8
	mov qword [rsp+8*125],r12
	mov r12,  [rsp+8*26]
	mov r8,r12
	mov r13,r10
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*127],r8
	mov r8, [r13]
	mov qword [rsp+8*128],r13
	mov r13,2
	mov r9,r8
	sub r9,r13
	mov qword [rsp+8*129],r8
	mov r8,r9
	mov r13,  [rsp+8*2]
	mov r9,r13
	mov qword [rsp+8*11],r11
	mov r12,  [rsp+8*11]
	mov r11,r12
	mov r10,r11
	mov qword [rsp+8*12],r8
	mov r8,r9
	cmp r10,r8
	mov r13, 0
	setl r13B
	mov qword [rsp+8*72],r8
	mov qword rsi,r9
	mov qword [rsp+8*71],r10
	mov qword rdi,r11
	mov qword [rsp+8*73],r13
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_337
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_338
	
L_337:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_338:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*131],r10
	jne L_253
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*132],r8
	jmp L_254
	
L_253:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov r9, 0
	setl r9B
	mov qword rsi,r8
	mov qword [rsp+8*73],r9
	mov qword rdi,r10
	mov qword [rsp+8*71],r12
	mov qword [rsp+8*72],r13
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_341
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_342
	
L_341:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_342:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*133],r10
	mov qword [rsp+8*132],r11
	
L_254:
	mov r8,  [rsp+8*132]
	cmp r8, 0
	je L_256
	mov r9,  [rsp+8*33]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*12]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov qword [rsp+8*134],r8
	mov r8,1
	mov qword [rsp+8*135],r11
	mov r11,r8
	neg r11
	cmp r13,r11
	mov r8, 0
	sete r8B
	mov qword [rsp+8*138],r8
	mov qword [rsp+8*137],r11
	mov qword [rsp+8*136],r13
	mov r8,  [rsp+8*138]
	cmp r8, 0
	je L_258
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [rsp+8*17]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r9,  [rsp+8*11]
	mov [r13],r9
	mov qword [rsp+8*140],r11
	mov r11,  [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*141],r13
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r10
	mov qword [rsp+8*142],r10
	mov r10,  [rsp+8*12]
	mov [r13],r10
	mov qword [rsp+8*143],r13
	mov r13,  [rsp+8*13]
	mov r12,1
	mov r9,r13
	add r9,r12
	mov r11,  [rsp+8*33]
	mov r12,r11
	mov qword [rsp+8*4],r8
	mov r8,  [rsp+8*11]
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r12
	mov r12, [r10]
	mov qword [rsp+8*144],r9
	mov r9,  [rsp+8*12]
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r12
	mov qword [rsp+8*145],r12
	mov r12,  [rsp+8*144]
	mov [r10],r12
	mov qword [rsp+8*146],r10
	mov r10,  [rsp+8*8]
	cmp r8,r10
	mov r12, 0
	sete r12B
	mov qword [rsp+8*147],r12
	mov r8,  [rsp+8*147]
	cmp r8, 0
	jne L_259
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*148],r8
	jmp L_260
	
L_259:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*149],r10
	mov r9,  [rsp+8*149]
	mov r8,r9
	mov qword [rsp+8*148],r8
	
L_260:
	mov r8,  [rsp+8*148]
	cmp r8, 0
	je L_262
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_262:
	
L_258:
	
L_256:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,1
	mov qword [rsp+8*150],r8
	mov r8,r12
	add r8,r13
	mov qword [rsp+8*151],r11
	mov r11,r8
	mov qword [rsp+8*152],r12
	mov r12,  [rsp+8*26]
	mov r8,r12
	mov r13,r10
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*154],r8
	mov r8, [r13]
	mov qword [rsp+8*155],r13
	mov r13,2
	mov r9,r8
	add r9,r13
	mov qword [rsp+8*156],r8
	mov r8,r9
	mov r13,  [rsp+8*2]
	mov r9,r13
	mov qword [rsp+8*11],r11
	mov r12,  [rsp+8*11]
	mov r11,r12
	mov r10,r11
	mov qword [rsp+8*12],r8
	mov r8,r9
	cmp r10,r8
	mov r13, 0
	setl r13B
	mov qword [rsp+8*72],r8
	mov qword rsi,r9
	mov qword [rsp+8*71],r10
	mov qword rdi,r11
	mov qword [rsp+8*73],r13
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_345
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_346
	
L_345:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_346:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*158],r10
	jne L_263
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*159],r8
	jmp L_264
	
L_263:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov r9, 0
	setl r9B
	mov qword rsi,r8
	mov qword [rsp+8*73],r9
	mov qword rdi,r10
	mov qword [rsp+8*71],r12
	mov qword [rsp+8*72],r13
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_349
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_350
	
L_349:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_350:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*160],r10
	mov qword [rsp+8*159],r11
	
L_264:
	mov r8,  [rsp+8*159]
	cmp r8, 0
	je L_266
	mov r9,  [rsp+8*33]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*12]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov qword [rsp+8*161],r8
	mov r8,1
	mov qword [rsp+8*162],r11
	mov r11,r8
	neg r11
	cmp r13,r11
	mov r8, 0
	sete r8B
	mov qword [rsp+8*165],r8
	mov qword [rsp+8*164],r11
	mov qword [rsp+8*163],r13
	mov r8,  [rsp+8*165]
	cmp r8, 0
	je L_268
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [rsp+8*17]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r9,  [rsp+8*11]
	mov [r13],r9
	mov qword [rsp+8*167],r11
	mov r11,  [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*168],r13
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r10
	mov qword [rsp+8*169],r10
	mov r10,  [rsp+8*12]
	mov [r13],r10
	mov qword [rsp+8*170],r13
	mov r13,  [rsp+8*13]
	mov r12,1
	mov r9,r13
	add r9,r12
	mov r11,  [rsp+8*33]
	mov r12,r11
	mov qword [rsp+8*4],r8
	mov r8,  [rsp+8*11]
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r12
	mov r12, [r10]
	mov qword [rsp+8*171],r9
	mov r9,  [rsp+8*12]
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r12
	mov qword [rsp+8*172],r12
	mov r12,  [rsp+8*171]
	mov [r10],r12
	mov qword [rsp+8*173],r10
	mov r10,  [rsp+8*8]
	cmp r8,r10
	mov r12, 0
	sete r12B
	mov qword [rsp+8*174],r12
	mov r8,  [rsp+8*174]
	cmp r8, 0
	jne L_269
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*175],r8
	jmp L_270
	
L_269:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*176],r10
	mov r9,  [rsp+8*176]
	mov r8,r9
	mov qword [rsp+8*175],r8
	
L_270:
	mov r8,  [rsp+8*175]
	cmp r8, 0
	je L_272
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_272:
	
L_268:
	
L_266:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,2
	mov qword [rsp+8*177],r8
	mov r8,r12
	sub r8,r13
	mov qword [rsp+8*178],r11
	mov r11,r8
	mov qword [rsp+8*179],r12
	mov r12,  [rsp+8*26]
	mov r8,r12
	mov r13,r10
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*181],r8
	mov r8, [r13]
	mov qword [rsp+8*182],r13
	mov r13,1
	mov r9,r8
	sub r9,r13
	mov qword [rsp+8*183],r8
	mov r8,r9
	mov r13,  [rsp+8*2]
	mov r9,r13
	mov qword [rsp+8*11],r11
	mov r12,  [rsp+8*11]
	mov r11,r12
	mov r10,r11
	mov qword [rsp+8*12],r8
	mov r8,r9
	cmp r10,r8
	mov r13, 0
	setl r13B
	mov qword [rsp+8*72],r8
	mov qword rsi,r9
	mov qword [rsp+8*71],r10
	mov qword rdi,r11
	mov qword [rsp+8*73],r13
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_353
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_354
	
L_353:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_354:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*185],r10
	jne L_273
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*186],r8
	jmp L_274
	
L_273:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov r9, 0
	setl r9B
	mov qword rsi,r8
	mov qword [rsp+8*73],r9
	mov qword rdi,r10
	mov qword [rsp+8*71],r12
	mov qword [rsp+8*72],r13
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_357
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_358
	
L_357:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_358:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*187],r10
	mov qword [rsp+8*186],r11
	
L_274:
	mov r8,  [rsp+8*186]
	cmp r8, 0
	je L_276
	mov r9,  [rsp+8*33]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*12]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov qword [rsp+8*188],r8
	mov r8,1
	mov qword [rsp+8*189],r11
	mov r11,r8
	neg r11
	cmp r13,r11
	mov r8, 0
	sete r8B
	mov qword [rsp+8*192],r8
	mov qword [rsp+8*191],r11
	mov qword [rsp+8*190],r13
	mov r8,  [rsp+8*192]
	cmp r8, 0
	je L_278
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [rsp+8*17]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r9,  [rsp+8*11]
	mov [r13],r9
	mov qword [rsp+8*194],r11
	mov r11,  [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*195],r13
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r10
	mov qword [rsp+8*196],r10
	mov r10,  [rsp+8*12]
	mov [r13],r10
	mov qword [rsp+8*197],r13
	mov r13,  [rsp+8*13]
	mov r12,1
	mov r9,r13
	add r9,r12
	mov r11,  [rsp+8*33]
	mov r12,r11
	mov qword [rsp+8*4],r8
	mov r8,  [rsp+8*11]
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r12
	mov r12, [r10]
	mov qword [rsp+8*198],r9
	mov r9,  [rsp+8*12]
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r12
	mov qword [rsp+8*199],r12
	mov r12,  [rsp+8*198]
	mov [r10],r12
	mov qword [rsp+8*200],r10
	mov r10,  [rsp+8*8]
	cmp r8,r10
	mov r12, 0
	sete r12B
	mov qword [rsp+8*201],r12
	mov r8,  [rsp+8*201]
	cmp r8, 0
	jne L_279
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*202],r8
	jmp L_280
	
L_279:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*203],r10
	mov r9,  [rsp+8*203]
	mov r8,r9
	mov qword [rsp+8*202],r8
	
L_280:
	mov r8,  [rsp+8*202]
	cmp r8, 0
	je L_282
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_282:
	
L_278:
	
L_276:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,2
	mov qword [rsp+8*204],r8
	mov r8,r12
	sub r8,r13
	mov qword [rsp+8*205],r11
	mov r11,r8
	mov qword [rsp+8*206],r12
	mov r12,  [rsp+8*26]
	mov r8,r12
	mov r13,r10
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*208],r8
	mov r8, [r13]
	mov qword [rsp+8*209],r13
	mov r13,1
	mov r9,r8
	add r9,r13
	mov qword [rsp+8*210],r8
	mov r8,r9
	mov r13,  [rsp+8*2]
	mov r9,r13
	mov qword [rsp+8*11],r11
	mov r12,  [rsp+8*11]
	mov r11,r12
	mov r10,r11
	mov qword [rsp+8*12],r8
	mov r8,r9
	cmp r10,r8
	mov r13, 0
	setl r13B
	mov qword [rsp+8*72],r8
	mov qword rsi,r9
	mov qword [rsp+8*71],r10
	mov qword rdi,r11
	mov qword [rsp+8*73],r13
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_361
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_362
	
L_361:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_362:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*212],r10
	jne L_283
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*213],r8
	jmp L_284
	
L_283:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov r9, 0
	setl r9B
	mov qword rsi,r8
	mov qword [rsp+8*73],r9
	mov qword rdi,r10
	mov qword [rsp+8*71],r12
	mov qword [rsp+8*72],r13
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_365
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_366
	
L_365:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_366:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*214],r10
	mov qword [rsp+8*213],r11
	
L_284:
	mov r8,  [rsp+8*213]
	cmp r8, 0
	je L_286
	mov r9,  [rsp+8*33]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*12]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov qword [rsp+8*215],r8
	mov r8,1
	mov qword [rsp+8*216],r11
	mov r11,r8
	neg r11
	cmp r13,r11
	mov r8, 0
	sete r8B
	mov qword [rsp+8*219],r8
	mov qword [rsp+8*218],r11
	mov qword [rsp+8*217],r13
	mov r8,  [rsp+8*219]
	cmp r8, 0
	je L_288
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [rsp+8*17]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r9,  [rsp+8*11]
	mov [r13],r9
	mov qword [rsp+8*221],r11
	mov r11,  [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*222],r13
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r10
	mov qword [rsp+8*223],r10
	mov r10,  [rsp+8*12]
	mov [r13],r10
	mov qword [rsp+8*224],r13
	mov r13,  [rsp+8*13]
	mov r12,1
	mov r9,r13
	add r9,r12
	mov r11,  [rsp+8*33]
	mov r12,r11
	mov qword [rsp+8*4],r8
	mov r8,  [rsp+8*11]
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r12
	mov r12, [r10]
	mov qword [rsp+8*225],r9
	mov r9,  [rsp+8*12]
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r12
	mov qword [rsp+8*226],r12
	mov r12,  [rsp+8*225]
	mov [r10],r12
	mov qword [rsp+8*227],r10
	mov r10,  [rsp+8*8]
	cmp r8,r10
	mov r12, 0
	sete r12B
	mov qword [rsp+8*228],r12
	mov r8,  [rsp+8*228]
	cmp r8, 0
	jne L_289
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*229],r8
	jmp L_290
	
L_289:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*230],r10
	mov r9,  [rsp+8*230]
	mov r8,r9
	mov qword [rsp+8*229],r8
	
L_290:
	mov r8,  [rsp+8*229]
	cmp r8, 0
	je L_292
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_292:
	
L_288:
	
L_286:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,2
	mov qword [rsp+8*231],r8
	mov r8,r12
	add r8,r13
	mov qword [rsp+8*232],r11
	mov r11,r8
	mov qword [rsp+8*233],r12
	mov r12,  [rsp+8*26]
	mov r8,r12
	mov r13,r10
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*235],r8
	mov r8, [r13]
	mov qword [rsp+8*236],r13
	mov r13,1
	mov r9,r8
	sub r9,r13
	mov qword [rsp+8*237],r8
	mov r8,r9
	mov r13,  [rsp+8*2]
	mov r9,r13
	mov qword [rsp+8*11],r11
	mov r12,  [rsp+8*11]
	mov r11,r12
	mov r10,r11
	mov qword [rsp+8*12],r8
	mov r8,r9
	cmp r10,r8
	mov r13, 0
	setl r13B
	mov qword [rsp+8*72],r8
	mov qword rsi,r9
	mov qword [rsp+8*71],r10
	mov qword rdi,r11
	mov qword [rsp+8*73],r13
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_369
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_370
	
L_369:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_370:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*239],r10
	jne L_293
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*240],r8
	jmp L_294
	
L_293:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov r9, 0
	setl r9B
	mov qword rsi,r8
	mov qword [rsp+8*73],r9
	mov qword rdi,r10
	mov qword [rsp+8*71],r12
	mov qword [rsp+8*72],r13
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_373
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_374
	
L_373:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_374:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*241],r10
	mov qword [rsp+8*240],r11
	
L_294:
	mov r8,  [rsp+8*240]
	cmp r8, 0
	je L_296
	mov r9,  [rsp+8*33]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*12]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov qword [rsp+8*242],r8
	mov r8,1
	mov qword [rsp+8*243],r11
	mov r11,r8
	neg r11
	cmp r13,r11
	mov r8, 0
	sete r8B
	mov qword [rsp+8*246],r8
	mov qword [rsp+8*245],r11
	mov qword [rsp+8*244],r13
	mov r8,  [rsp+8*246]
	cmp r8, 0
	je L_298
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [rsp+8*17]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r9,  [rsp+8*11]
	mov [r13],r9
	mov qword [rsp+8*248],r11
	mov r11,  [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*249],r13
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r10
	mov qword [rsp+8*250],r10
	mov r10,  [rsp+8*12]
	mov [r13],r10
	mov qword [rsp+8*251],r13
	mov r13,  [rsp+8*13]
	mov r12,1
	mov r9,r13
	add r9,r12
	mov r11,  [rsp+8*33]
	mov r12,r11
	mov qword [rsp+8*4],r8
	mov r8,  [rsp+8*11]
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r12
	mov r12, [r10]
	mov qword [rsp+8*252],r9
	mov r9,  [rsp+8*12]
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r12
	mov qword [rsp+8*253],r12
	mov r12,  [rsp+8*252]
	mov [r10],r12
	mov qword [rsp+8*254],r10
	mov r10,  [rsp+8*8]
	cmp r8,r10
	mov r12, 0
	sete r12B
	mov qword [rsp+8*255],r12
	mov r8,  [rsp+8*255]
	cmp r8, 0
	jne L_299
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*256],r8
	jmp L_300
	
L_299:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*257],r10
	mov r9,  [rsp+8*257]
	mov r8,r9
	mov qword [rsp+8*256],r8
	
L_300:
	mov r8,  [rsp+8*256]
	cmp r8, 0
	je L_302
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_302:
	
L_298:
	
L_296:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,2
	mov qword [rsp+8*258],r8
	mov r8,r12
	add r8,r13
	mov qword [rsp+8*259],r11
	mov r11,r8
	mov qword [rsp+8*260],r12
	mov r12,  [rsp+8*26]
	mov r8,r12
	mov r13,r10
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*262],r8
	mov r8, [r13]
	mov qword [rsp+8*263],r13
	mov r13,1
	mov r9,r8
	add r9,r13
	mov qword [rsp+8*264],r8
	mov r8,r9
	mov r13,  [rsp+8*2]
	mov r9,r13
	mov qword [rsp+8*11],r11
	mov r12,  [rsp+8*11]
	mov r11,r12
	mov r10,r11
	mov qword [rsp+8*12],r8
	mov r8,r9
	cmp r10,r8
	mov r13, 0
	setl r13B
	mov qword [rsp+8*72],r8
	mov qword rsi,r9
	mov qword [rsp+8*71],r10
	mov qword rdi,r11
	mov qword [rsp+8*73],r13
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_377
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_378
	
L_377:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_378:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*266],r10
	jne L_303
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*267],r8
	jmp L_304
	
L_303:
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r11,  [rsp+8*12]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov qword rsi,r8
	mov r8, 0
	setl r8B
	mov qword [rsp+8*73],r8
	mov qword rdi,r10
	mov qword [rsp+8*71],r12
	mov qword [rsp+8*72],r13
	mov r8,  [rsp+8*73]
	cmp r8, 0
	jne L_381
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*74],r8
	jmp L_382
	
L_381:
	mov r8,  [rsp+8*71]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*75],r10
	mov r9,  [rsp+8*75]
	mov r8,r9
	mov qword [rsp+8*74],r8
	
L_382:
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*268],r10
	mov qword [rsp+8*267],r11
	
L_304:
	mov r8,  [rsp+8*267]
	cmp r8, 0
	je L_306
	mov r9,  [rsp+8*33]
	mov r8,r9
	mov r10,  [rsp+8*11]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*12]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov qword [rsp+8*269],r8
	mov r8,1
	mov qword [rsp+8*270],r11
	mov r11,r8
	neg r11
	cmp r13,r11
	mov r8, 0
	sete r8B
	mov qword [rsp+8*273],r8
	mov qword [rsp+8*272],r11
	mov qword [rsp+8*271],r13
	mov r8,  [rsp+8*273]
	cmp r8, 0
	je L_308
	mov r8,  [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [rsp+8*17]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r9,  [rsp+8*11]
	mov [r13],r9
	mov qword [rsp+8*275],r11
	mov r11,  [rsp+8*26]
	mov r10,r11
	mov r11,r8
	add r11,1
	shl r11,4
	add r11,r10
	mov qword [rsp+8*4],r8
	mov r8,  [rsp+8*12]
	mov [r11],r8
	mov qword [rsp+8*277],r10
	mov r10,  [rsp+8*13]
	mov qword [rsp+8*278],r11
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r11,  [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*276],r13
	mov r13,r9
	add r13,1
	shl r13,4
	add r13,r10
	mov r10, [r13]
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r10
	mov [r13],r12
	mov qword [rsp+8*280],r10
	mov r10,  [rsp+8*8]
	cmp r9,r10
	mov r12, 0
	sete r12B
	mov qword [rsp+8*282],r12
	mov qword [rsp+8*281],r13
	mov r8,  [rsp+8*282]
	cmp r8, 0
	jne L_309
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*283],r8
	jmp L_310
	
L_309:
	mov r8,  [rsp+8*12]
	mov r9,  [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*284],r10
	mov r9,  [rsp+8*284]
	mov r8,r9
	mov qword [rsp+8*283],r8
	
L_310:
	mov r8,  [rsp+8*283]
	cmp r8, 0
	je L_312
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_312:
	
L_308:
	
L_306:
	mov r8,  [rsp+8*14]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*285],r10
	mov r8,  [rsp+8*285]
	cmp r8, 0
	je L_314
	jmp L_232
	
L_314:
	mov r8,  [rsp+8*3]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov qword [rsp+8*3],r8
	mov qword [rsp+8*286],r10
	jmp L_231
	
L_232:
	mov r8,  [rsp+8*14]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*287],r10
	mov r8,  [rsp+8*287]
	cmp r8, 0
	je L_315
	mov r9,  [rsp+8*33]
	mov r8,r9
	mov r10,  [rsp+8*8]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*10]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov qword [rsp+8*288],r8
	mov r8,r13
	mov r9,r8
	mov qword rdi,r8
	mov qword [rsp+8*291],r9
	mov qword [rsp+8*289],r11
	mov qword [rsp+8*290],r13
	mov     rdi, [rsp+8*291]
	call    toString
	mov     qword[rsp+8*292], rax
	mov r9,  [rsp+8*292]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*293],r10
	mov rdi,[rsp+8*293] 
	add rdi, 1 
	call puts
	jmp L_316
	
L_315:
	mov r9,t453
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*294],r10
	mov rdi,[rsp+8*294] 
	add rdi, 1 
	call puts
	
L_316:
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2424
	mov r8,  [rsp+8*295]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   4408
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
	
t453:
	 db 12,"no solution!" ,0


