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
	mov r8,r9
	mov qword [gbl+8*9],r8
	mov qword [rsp+8*8],r9
	mov qword [rsp+8*4],r10
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
	mov r8,r15
	add r8,r11
	mov qword [rsp+8*21],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*22],r8
	mov r8, qword [rsp+8*21]
	mov r9, qword [rsp+8*22]
	mov qword [rsp+8*16],r10
	mov r10,r8
	sub r10,r9
	mov r8,r14
	add r8,r10
	mov qword [rsp+8*24],r8
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*23],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*26],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*27],r8
	mov r8, qword [rsp+8*26]
	mov r9, qword [rsp+8*27]
	mov qword [rsp+8*25],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*28],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*30],r8
	mov r8, qword [rsp+8*28]
	mov r9, qword [rsp+8*30]
	mov qword [rsp+8*29],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*24]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*32],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*33],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*31],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*35],r8
	mov r8, qword [rsp+8*33]
	mov r9, qword [rsp+8*35]
	mov qword [rsp+8*34],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*38],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*37],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*36],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*40],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*41],r8
	mov r8, qword [rsp+8*40]
	mov r9, qword [rsp+8*41]
	mov qword [rsp+8*39],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*42],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*44],r8
	mov r8, qword [rsp+8*42]
	mov r9, qword [rsp+8*44]
	mov qword [rsp+8*43],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*38]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*32]
	mov qword [rsp+8*45],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*46],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*48],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*47],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*50],r8
	mov r8, qword [rsp+8*48]
	mov r9, qword [rsp+8*50]
	mov qword [rsp+8*49],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*52],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*51],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*54],r8
	mov r8, qword [rsp+8*52]
	mov r9, qword [rsp+8*54]
	mov qword [rsp+8*53],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*51]
	mov r9,r8
	sub r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*56],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*57],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*55],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*59],r8
	mov r8, qword [rsp+8*57]
	mov r9, qword [rsp+8*59]
	mov qword [rsp+8*58],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*62],r8
	mov r8, qword [rsp+8*56]
	mov qword [rsp+8*61],r9
	mov r9, qword [rsp+8*62]
	mov qword [rsp+8*60],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*63],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*65],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*66],r8
	mov r8, qword [rsp+8*65]
	mov r9, qword [rsp+8*66]
	mov qword [rsp+8*64],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*67],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*69],r8
	mov r8, qword [rsp+8*67]
	mov r9, qword [rsp+8*69]
	mov qword [rsp+8*68],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*71],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*70],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*73],r8
	mov r8, qword [rsp+8*71]
	mov r9, qword [rsp+8*73]
	mov qword [rsp+8*72],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*76],r8
	mov r8, qword [rsp+8*70]
	mov qword [rsp+8*75],r9
	mov r9, qword [rsp+8*76]
	mov qword [rsp+8*74],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*63]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*47]
	mov qword [rsp+8*77],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*78],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*79],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*81],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*82],r8
	mov r8, qword [rsp+8*81]
	mov r9, qword [rsp+8*82]
	mov qword [rsp+8*80],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*83],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*85],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*86],r8
	mov r8, qword [rsp+8*85]
	mov r9, qword [rsp+8*86]
	mov qword [rsp+8*84],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*83]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*88],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*87],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*90],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*91],r8
	mov r8, qword [rsp+8*90]
	mov r9, qword [rsp+8*91]
	mov qword [rsp+8*89],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*92],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*94],r8
	mov r8, qword [rsp+8*92]
	mov r9, qword [rsp+8*94]
	mov qword [rsp+8*93],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*88]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*96],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*97],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*95],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*99],r8
	mov r8, qword [rsp+8*97]
	mov r9, qword [rsp+8*99]
	mov qword [rsp+8*98],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*102],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*101],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*100],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*104],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*105],r8
	mov r8, qword [rsp+8*104]
	mov r9, qword [rsp+8*105]
	mov qword [rsp+8*103],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*106],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*108],r8
	mov r8, qword [rsp+8*106]
	mov r9, qword [rsp+8*108]
	mov qword [rsp+8*107],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*102]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*96]
	mov qword [rsp+8*109],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*110],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*112],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*111],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*114],r8
	mov r8, qword [rsp+8*112]
	mov r9, qword [rsp+8*114]
	mov qword [rsp+8*113],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*117],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*116],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*115],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*119],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*120],r8
	mov r8, qword [rsp+8*119]
	mov r9, qword [rsp+8*120]
	mov qword [rsp+8*118],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*121],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*123],r8
	mov r8, qword [rsp+8*121]
	mov r9, qword [rsp+8*123]
	mov qword [rsp+8*122],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*117]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*125],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*126],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*124],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*128],r8
	mov r8, qword [rsp+8*126]
	mov r9, qword [rsp+8*128]
	mov qword [rsp+8*127],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*131],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*130],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*129],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*133],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*134],r8
	mov r8, qword [rsp+8*133]
	mov r9, qword [rsp+8*134]
	mov qword [rsp+8*132],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*135],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*137],r8
	mov r8, qword [rsp+8*135]
	mov r9, qword [rsp+8*137]
	mov qword [rsp+8*136],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*131]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*125]
	mov qword [rsp+8*138],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*111]
	mov qword [rsp+8*139],r9
	mov r9,r8
	sub r9,r10
	mov r8, qword [rsp+8*79]
	mov qword [rsp+8*140],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*141],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*143],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*142],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*145],r8
	mov r8, qword [rsp+8*143]
	mov r9, qword [rsp+8*145]
	mov qword [rsp+8*144],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*147],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*146],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*149],r8
	mov r8, qword [rsp+8*147]
	mov r9, qword [rsp+8*149]
	mov qword [rsp+8*148],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*146]
	mov r9,r8
	sub r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*151],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*152],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*150],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*154],r8
	mov r8, qword [rsp+8*152]
	mov r9, qword [rsp+8*154]
	mov qword [rsp+8*153],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*157],r8
	mov r8, qword [rsp+8*151]
	mov qword [rsp+8*156],r9
	mov r9, qword [rsp+8*157]
	mov qword [rsp+8*155],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*158],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*160],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*161],r8
	mov r8, qword [rsp+8*160]
	mov r9, qword [rsp+8*161]
	mov qword [rsp+8*159],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*162],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*164],r8
	mov r8, qword [rsp+8*162]
	mov r9, qword [rsp+8*164]
	mov qword [rsp+8*163],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*166],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*165],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*168],r8
	mov r8, qword [rsp+8*166]
	mov r9, qword [rsp+8*168]
	mov qword [rsp+8*167],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*171],r8
	mov r8, qword [rsp+8*165]
	mov qword [rsp+8*170],r9
	mov r9, qword [rsp+8*171]
	mov qword [rsp+8*169],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*158]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*173],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*172],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*175],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*176],r8
	mov r8, qword [rsp+8*175]
	mov r9, qword [rsp+8*176]
	mov qword [rsp+8*174],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*177],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*179],r8
	mov r8, qword [rsp+8*177]
	mov r9, qword [rsp+8*179]
	mov qword [rsp+8*178],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*181],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*180],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*183],r8
	mov r8, qword [rsp+8*181]
	mov r9, qword [rsp+8*183]
	mov qword [rsp+8*182],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*186],r8
	mov r8, qword [rsp+8*180]
	mov qword [rsp+8*185],r9
	mov r9, qword [rsp+8*186]
	mov qword [rsp+8*184],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*187],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*189],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*190],r8
	mov r8, qword [rsp+8*189]
	mov r9, qword [rsp+8*190]
	mov qword [rsp+8*188],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*191],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*193],r8
	mov r8, qword [rsp+8*191]
	mov r9, qword [rsp+8*193]
	mov qword [rsp+8*192],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*195],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*194],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*197],r8
	mov r8, qword [rsp+8*195]
	mov r9, qword [rsp+8*197]
	mov qword [rsp+8*196],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*200],r8
	mov r8, qword [rsp+8*194]
	mov qword [rsp+8*199],r9
	mov r9, qword [rsp+8*200]
	mov qword [rsp+8*198],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*187]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*173]
	mov qword [rsp+8*201],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*202],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*203],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*205],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*206],r8
	mov r8, qword [rsp+8*205]
	mov r9, qword [rsp+8*206]
	mov qword [rsp+8*204],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*207],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*209],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*210],r8
	mov r8, qword [rsp+8*209]
	mov r9, qword [rsp+8*210]
	mov qword [rsp+8*208],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*207]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*212],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*211],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*214],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*215],r8
	mov r8, qword [rsp+8*214]
	mov r9, qword [rsp+8*215]
	mov qword [rsp+8*213],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*216],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*218],r8
	mov r8, qword [rsp+8*216]
	mov r9, qword [rsp+8*218]
	mov qword [rsp+8*217],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*212]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*220],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*221],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*219],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*223],r8
	mov r8, qword [rsp+8*221]
	mov r9, qword [rsp+8*223]
	mov qword [rsp+8*222],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*226],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*225],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*224],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*228],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*229],r8
	mov r8, qword [rsp+8*228]
	mov r9, qword [rsp+8*229]
	mov qword [rsp+8*227],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*230],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*232],r8
	mov r8, qword [rsp+8*230]
	mov r9, qword [rsp+8*232]
	mov qword [rsp+8*231],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*226]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*220]
	mov qword [rsp+8*233],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*234],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*236],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*235],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*238],r8
	mov r8, qword [rsp+8*236]
	mov r9, qword [rsp+8*238]
	mov qword [rsp+8*237],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*241],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*240],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*239],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*243],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*244],r8
	mov r8, qword [rsp+8*243]
	mov r9, qword [rsp+8*244]
	mov qword [rsp+8*242],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*245],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*247],r8
	mov r8, qword [rsp+8*245]
	mov r9, qword [rsp+8*247]
	mov qword [rsp+8*246],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*241]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*249],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*250],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*248],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*252],r8
	mov r8, qword [rsp+8*250]
	mov r9, qword [rsp+8*252]
	mov qword [rsp+8*251],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*255],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*254],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*253],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*257],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*258],r8
	mov r8, qword [rsp+8*257]
	mov r9, qword [rsp+8*258]
	mov qword [rsp+8*256],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*259],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*261],r8
	mov r8, qword [rsp+8*259]
	mov r9, qword [rsp+8*261]
	mov qword [rsp+8*260],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*255]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*249]
	mov qword [rsp+8*262],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*235]
	mov qword [rsp+8*263],r9
	mov r9,r8
	sub r9,r10
	mov r8, qword [rsp+8*203]
	mov qword [rsp+8*264],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*142]
	mov qword [rsp+8*265],r9
	mov r9,r8
	sub r9,r10
	mov r8,r9
	mov qword [gbl+8*5],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*267],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*266],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*269],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*270],r8
	mov r8, qword [rsp+8*269]
	mov r9, qword [rsp+8*270]
	mov qword [rsp+8*268],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*271],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*273],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*274],r8
	mov r8, qword [rsp+8*273]
	mov r9, qword [rsp+8*274]
	mov qword [rsp+8*272],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*271]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*276],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*275],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*278],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*279],r8
	mov r8, qword [rsp+8*278]
	mov r9, qword [rsp+8*279]
	mov qword [rsp+8*277],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*280],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*282],r8
	mov r8, qword [rsp+8*280]
	mov r9, qword [rsp+8*282]
	mov qword [rsp+8*281],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*276]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*284],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*285],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*283],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*287],r8
	mov r8, qword [rsp+8*285]
	mov r9, qword [rsp+8*287]
	mov qword [rsp+8*286],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*290],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*289],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*288],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*292],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*293],r8
	mov r8, qword [rsp+8*292]
	mov r9, qword [rsp+8*293]
	mov qword [rsp+8*291],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*294],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*296],r8
	mov r8, qword [rsp+8*294]
	mov r9, qword [rsp+8*296]
	mov qword [rsp+8*295],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*290]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*284]
	mov qword [rsp+8*297],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*298],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*300],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*299],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*302],r8
	mov r8, qword [rsp+8*300]
	mov r9, qword [rsp+8*302]
	mov qword [rsp+8*301],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*304],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*303],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*306],r8
	mov r8, qword [rsp+8*304]
	mov r9, qword [rsp+8*306]
	mov qword [rsp+8*305],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*303]
	mov r9,r8
	sub r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*308],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*309],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*307],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*311],r8
	mov r8, qword [rsp+8*309]
	mov r9, qword [rsp+8*311]
	mov qword [rsp+8*310],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*314],r8
	mov r8, qword [rsp+8*308]
	mov qword [rsp+8*313],r9
	mov r9, qword [rsp+8*314]
	mov qword [rsp+8*312],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*315],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*317],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*318],r8
	mov r8, qword [rsp+8*317]
	mov r9, qword [rsp+8*318]
	mov qword [rsp+8*316],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*319],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*321],r8
	mov r8, qword [rsp+8*319]
	mov r9, qword [rsp+8*321]
	mov qword [rsp+8*320],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*323],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*322],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*325],r8
	mov r8, qword [rsp+8*323]
	mov r9, qword [rsp+8*325]
	mov qword [rsp+8*324],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*328],r8
	mov r8, qword [rsp+8*322]
	mov qword [rsp+8*327],r9
	mov r9, qword [rsp+8*328]
	mov qword [rsp+8*326],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*315]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*299]
	mov qword [rsp+8*329],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*330],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*331],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*333],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*334],r8
	mov r8, qword [rsp+8*333]
	mov r9, qword [rsp+8*334]
	mov qword [rsp+8*332],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*335],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*337],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*338],r8
	mov r8, qword [rsp+8*337]
	mov r9, qword [rsp+8*338]
	mov qword [rsp+8*336],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*335]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*340],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*339],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*342],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*343],r8
	mov r8, qword [rsp+8*342]
	mov r9, qword [rsp+8*343]
	mov qword [rsp+8*341],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*344],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*346],r8
	mov r8, qword [rsp+8*344]
	mov r9, qword [rsp+8*346]
	mov qword [rsp+8*345],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*340]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*348],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*349],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*347],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*351],r8
	mov r8, qword [rsp+8*349]
	mov r9, qword [rsp+8*351]
	mov qword [rsp+8*350],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*354],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*353],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*352],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*356],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*357],r8
	mov r8, qword [rsp+8*356]
	mov r9, qword [rsp+8*357]
	mov qword [rsp+8*355],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*358],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*360],r8
	mov r8, qword [rsp+8*358]
	mov r9, qword [rsp+8*360]
	mov qword [rsp+8*359],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*354]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*348]
	mov qword [rsp+8*361],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*362],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*364],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*363],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*366],r8
	mov r8, qword [rsp+8*364]
	mov r9, qword [rsp+8*366]
	mov qword [rsp+8*365],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*369],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*368],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*367],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*371],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*372],r8
	mov r8, qword [rsp+8*371]
	mov r9, qword [rsp+8*372]
	mov qword [rsp+8*370],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*373],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*375],r8
	mov r8, qword [rsp+8*373]
	mov r9, qword [rsp+8*375]
	mov qword [rsp+8*374],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*369]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*377],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*378],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*376],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*380],r8
	mov r8, qword [rsp+8*378]
	mov r9, qword [rsp+8*380]
	mov qword [rsp+8*379],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*383],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*382],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*381],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*385],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*386],r8
	mov r8, qword [rsp+8*385]
	mov r9, qword [rsp+8*386]
	mov qword [rsp+8*384],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*387],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*389],r8
	mov r8, qword [rsp+8*387]
	mov r9, qword [rsp+8*389]
	mov qword [rsp+8*388],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*383]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*377]
	mov qword [rsp+8*390],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*363]
	mov qword [rsp+8*391],r9
	mov r9,r8
	sub r9,r10
	mov r8, qword [rsp+8*331]
	mov qword [rsp+8*392],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*393],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*395],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*394],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*397],r8
	mov r8, qword [rsp+8*395]
	mov r9, qword [rsp+8*397]
	mov qword [rsp+8*396],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*399],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*398],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*401],r8
	mov r8, qword [rsp+8*399]
	mov r9, qword [rsp+8*401]
	mov qword [rsp+8*400],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*398]
	mov r9,r8
	sub r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*403],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*404],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*402],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*406],r8
	mov r8, qword [rsp+8*404]
	mov r9, qword [rsp+8*406]
	mov qword [rsp+8*405],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*409],r8
	mov r8, qword [rsp+8*403]
	mov qword [rsp+8*408],r9
	mov r9, qword [rsp+8*409]
	mov qword [rsp+8*407],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*410],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*412],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*413],r8
	mov r8, qword [rsp+8*412]
	mov r9, qword [rsp+8*413]
	mov qword [rsp+8*411],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*414],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*416],r8
	mov r8, qword [rsp+8*414]
	mov r9, qword [rsp+8*416]
	mov qword [rsp+8*415],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*418],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*417],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*420],r8
	mov r8, qword [rsp+8*418]
	mov r9, qword [rsp+8*420]
	mov qword [rsp+8*419],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*423],r8
	mov r8, qword [rsp+8*417]
	mov qword [rsp+8*422],r9
	mov r9, qword [rsp+8*423]
	mov qword [rsp+8*421],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*410]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*425],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*424],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*427],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*428],r8
	mov r8, qword [rsp+8*427]
	mov r9, qword [rsp+8*428]
	mov qword [rsp+8*426],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*429],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*431],r8
	mov r8, qword [rsp+8*429]
	mov r9, qword [rsp+8*431]
	mov qword [rsp+8*430],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*433],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*432],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*435],r8
	mov r8, qword [rsp+8*433]
	mov r9, qword [rsp+8*435]
	mov qword [rsp+8*434],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*438],r8
	mov r8, qword [rsp+8*432]
	mov qword [rsp+8*437],r9
	mov r9, qword [rsp+8*438]
	mov qword [rsp+8*436],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*439],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*441],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*442],r8
	mov r8, qword [rsp+8*441]
	mov r9, qword [rsp+8*442]
	mov qword [rsp+8*440],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*443],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*445],r8
	mov r8, qword [rsp+8*443]
	mov r9, qword [rsp+8*445]
	mov qword [rsp+8*444],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*447],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*446],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*449],r8
	mov r8, qword [rsp+8*447]
	mov r9, qword [rsp+8*449]
	mov qword [rsp+8*448],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*452],r8
	mov r8, qword [rsp+8*446]
	mov qword [rsp+8*451],r9
	mov r9, qword [rsp+8*452]
	mov qword [rsp+8*450],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*439]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*425]
	mov qword [rsp+8*453],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*454],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*455],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*457],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*458],r8
	mov r8, qword [rsp+8*457]
	mov r9, qword [rsp+8*458]
	mov qword [rsp+8*456],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*459],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*461],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*462],r8
	mov r8, qword [rsp+8*461]
	mov r9, qword [rsp+8*462]
	mov qword [rsp+8*460],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*459]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*464],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*463],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*466],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*467],r8
	mov r8, qword [rsp+8*466]
	mov r9, qword [rsp+8*467]
	mov qword [rsp+8*465],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*468],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*470],r8
	mov r8, qword [rsp+8*468]
	mov r9, qword [rsp+8*470]
	mov qword [rsp+8*469],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*464]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*472],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*473],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*471],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*475],r8
	mov r8, qword [rsp+8*473]
	mov r9, qword [rsp+8*475]
	mov qword [rsp+8*474],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*478],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*477],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*476],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*480],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*481],r8
	mov r8, qword [rsp+8*480]
	mov r9, qword [rsp+8*481]
	mov qword [rsp+8*479],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*482],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*484],r8
	mov r8, qword [rsp+8*482]
	mov r9, qword [rsp+8*484]
	mov qword [rsp+8*483],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*478]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*472]
	mov qword [rsp+8*485],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*486],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*488],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*487],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*490],r8
	mov r8, qword [rsp+8*488]
	mov r9, qword [rsp+8*490]
	mov qword [rsp+8*489],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*493],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*492],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*491],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*495],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*496],r8
	mov r8, qword [rsp+8*495]
	mov r9, qword [rsp+8*496]
	mov qword [rsp+8*494],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*497],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*499],r8
	mov r8, qword [rsp+8*497]
	mov r9, qword [rsp+8*499]
	mov qword [rsp+8*498],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*493]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*501],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*502],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*500],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*504],r8
	mov r8, qword [rsp+8*502]
	mov r9, qword [rsp+8*504]
	mov qword [rsp+8*503],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*507],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*506],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*505],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*509],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*510],r8
	mov r8, qword [rsp+8*509]
	mov r9, qword [rsp+8*510]
	mov qword [rsp+8*508],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*511],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*513],r8
	mov r8, qword [rsp+8*511]
	mov r9, qword [rsp+8*513]
	mov qword [rsp+8*512],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*507]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*501]
	mov qword [rsp+8*514],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*487]
	mov qword [rsp+8*515],r9
	mov r9,r8
	sub r9,r10
	mov r8, qword [rsp+8*455]
	mov qword [rsp+8*516],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*394]
	mov qword [rsp+8*517],r9
	mov r9,r8
	sub r9,r10
	mov r11,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*519],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*518],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*521],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*522],r8
	mov r8, qword [rsp+8*521]
	mov r9, qword [rsp+8*522]
	mov qword [rsp+8*520],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*523],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*525],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*526],r8
	mov r8, qword [rsp+8*525]
	mov r9, qword [rsp+8*526]
	mov qword [rsp+8*524],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*523]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*528],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*527],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*530],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*531],r8
	mov r8, qword [rsp+8*530]
	mov r9, qword [rsp+8*531]
	mov qword [rsp+8*529],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*532],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*534],r8
	mov r8, qword [rsp+8*532]
	mov r9, qword [rsp+8*534]
	mov qword [rsp+8*533],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*528]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*536],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*537],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*535],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*539],r8
	mov r8, qword [rsp+8*537]
	mov r9, qword [rsp+8*539]
	mov qword [rsp+8*538],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*542],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*541],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*540],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*544],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*545],r8
	mov r8, qword [rsp+8*544]
	mov r9, qword [rsp+8*545]
	mov qword [rsp+8*543],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*546],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*548],r8
	mov r8, qword [rsp+8*546]
	mov r9, qword [rsp+8*548]
	mov qword [rsp+8*547],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*542]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*536]
	mov qword [rsp+8*549],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*550],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*552],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*551],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*554],r8
	mov r8, qword [rsp+8*552]
	mov r9, qword [rsp+8*554]
	mov qword [rsp+8*553],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*556],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*555],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*558],r8
	mov r8, qword [rsp+8*556]
	mov r9, qword [rsp+8*558]
	mov qword [rsp+8*557],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*555]
	mov r9,r8
	sub r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*560],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*561],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*559],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*563],r8
	mov r8, qword [rsp+8*561]
	mov r9, qword [rsp+8*563]
	mov qword [rsp+8*562],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*566],r8
	mov r8, qword [rsp+8*560]
	mov qword [rsp+8*565],r9
	mov r9, qword [rsp+8*566]
	mov qword [rsp+8*564],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*567],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*569],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*570],r8
	mov r8, qword [rsp+8*569]
	mov r9, qword [rsp+8*570]
	mov qword [rsp+8*568],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*571],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*573],r8
	mov r8, qword [rsp+8*571]
	mov r9, qword [rsp+8*573]
	mov qword [rsp+8*572],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*575],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*574],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*577],r8
	mov r8, qword [rsp+8*575]
	mov r9, qword [rsp+8*577]
	mov qword [rsp+8*576],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*580],r8
	mov r8, qword [rsp+8*574]
	mov qword [rsp+8*579],r9
	mov r9, qword [rsp+8*580]
	mov qword [rsp+8*578],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*567]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*551]
	mov qword [rsp+8*581],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*582],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*583],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*585],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*586],r8
	mov r8, qword [rsp+8*585]
	mov r9, qword [rsp+8*586]
	mov qword [rsp+8*584],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*587],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*589],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*590],r8
	mov r8, qword [rsp+8*589]
	mov r9, qword [rsp+8*590]
	mov qword [rsp+8*588],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*587]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*592],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*591],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*594],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*595],r8
	mov r8, qword [rsp+8*594]
	mov r9, qword [rsp+8*595]
	mov qword [rsp+8*593],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*596],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*598],r8
	mov r8, qword [rsp+8*596]
	mov r9, qword [rsp+8*598]
	mov qword [rsp+8*597],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*592]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*600],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*601],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*599],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*603],r8
	mov r8, qword [rsp+8*601]
	mov r9, qword [rsp+8*603]
	mov qword [rsp+8*602],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*606],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*605],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*604],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*608],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*609],r8
	mov r8, qword [rsp+8*608]
	mov r9, qword [rsp+8*609]
	mov qword [rsp+8*607],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*610],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*612],r8
	mov r8, qword [rsp+8*610]
	mov r9, qword [rsp+8*612]
	mov qword [rsp+8*611],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*606]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*600]
	mov qword [rsp+8*613],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*614],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*616],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*615],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*618],r8
	mov r8, qword [rsp+8*616]
	mov r9, qword [rsp+8*618]
	mov qword [rsp+8*617],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*621],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*620],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*619],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*623],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*624],r8
	mov r8, qword [rsp+8*623]
	mov r9, qword [rsp+8*624]
	mov qword [rsp+8*622],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*625],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*627],r8
	mov r8, qword [rsp+8*625]
	mov r9, qword [rsp+8*627]
	mov qword [rsp+8*626],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*621]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*629],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*630],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*628],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*632],r8
	mov r8, qword [rsp+8*630]
	mov r9, qword [rsp+8*632]
	mov qword [rsp+8*631],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*635],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*634],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*633],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*637],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*638],r8
	mov r8, qword [rsp+8*637]
	mov r9, qword [rsp+8*638]
	mov qword [rsp+8*636],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*639],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*641],r8
	mov r8, qword [rsp+8*639]
	mov r9, qword [rsp+8*641]
	mov qword [rsp+8*640],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*635]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*629]
	mov qword [rsp+8*642],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*615]
	mov qword [rsp+8*643],r9
	mov r9,r8
	sub r9,r10
	mov r8, qword [rsp+8*583]
	mov qword [rsp+8*644],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*645],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*647],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*646],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*649],r8
	mov r8, qword [rsp+8*647]
	mov r9, qword [rsp+8*649]
	mov qword [rsp+8*648],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*651],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*650],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*653],r8
	mov r8, qword [rsp+8*651]
	mov r9, qword [rsp+8*653]
	mov qword [rsp+8*652],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*650]
	mov r9,r8
	sub r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*655],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*656],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*654],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*658],r8
	mov r8, qword [rsp+8*656]
	mov r9, qword [rsp+8*658]
	mov qword [rsp+8*657],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*661],r8
	mov r8, qword [rsp+8*655]
	mov qword [rsp+8*660],r9
	mov r9, qword [rsp+8*661]
	mov qword [rsp+8*659],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*662],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*664],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*665],r8
	mov r8, qword [rsp+8*664]
	mov r9, qword [rsp+8*665]
	mov qword [rsp+8*663],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*666],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*668],r8
	mov r8, qword [rsp+8*666]
	mov r9, qword [rsp+8*668]
	mov qword [rsp+8*667],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*670],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*669],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*672],r8
	mov r8, qword [rsp+8*670]
	mov r9, qword [rsp+8*672]
	mov qword [rsp+8*671],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*675],r8
	mov r8, qword [rsp+8*669]
	mov qword [rsp+8*674],r9
	mov r9, qword [rsp+8*675]
	mov qword [rsp+8*673],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*662]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*677],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*676],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*679],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*680],r8
	mov r8, qword [rsp+8*679]
	mov r9, qword [rsp+8*680]
	mov qword [rsp+8*678],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*681],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*683],r8
	mov r8, qword [rsp+8*681]
	mov r9, qword [rsp+8*683]
	mov qword [rsp+8*682],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*685],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*684],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*687],r8
	mov r8, qword [rsp+8*685]
	mov r9, qword [rsp+8*687]
	mov qword [rsp+8*686],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*690],r8
	mov r8, qword [rsp+8*684]
	mov qword [rsp+8*689],r9
	mov r9, qword [rsp+8*690]
	mov qword [rsp+8*688],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*691],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*693],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*694],r8
	mov r8, qword [rsp+8*693]
	mov r9, qword [rsp+8*694]
	mov qword [rsp+8*692],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*695],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*697],r8
	mov r8, qword [rsp+8*695]
	mov r9, qword [rsp+8*697]
	mov qword [rsp+8*696],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*699],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*698],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*701],r8
	mov r8, qword [rsp+8*699]
	mov r9, qword [rsp+8*701]
	mov qword [rsp+8*700],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*704],r8
	mov r8, qword [rsp+8*698]
	mov qword [rsp+8*703],r9
	mov r9, qword [rsp+8*704]
	mov qword [rsp+8*702],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*691]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*677]
	mov qword [rsp+8*705],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*706],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*707],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*709],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*710],r8
	mov r8, qword [rsp+8*709]
	mov r9, qword [rsp+8*710]
	mov qword [rsp+8*708],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*711],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*713],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*714],r8
	mov r8, qword [rsp+8*713]
	mov r9, qword [rsp+8*714]
	mov qword [rsp+8*712],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*711]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*716],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*715],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*718],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*719],r8
	mov r8, qword [rsp+8*718]
	mov r9, qword [rsp+8*719]
	mov qword [rsp+8*717],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*720],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*722],r8
	mov r8, qword [rsp+8*720]
	mov r9, qword [rsp+8*722]
	mov qword [rsp+8*721],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*716]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*724],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*725],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*723],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*727],r8
	mov r8, qword [rsp+8*725]
	mov r9, qword [rsp+8*727]
	mov qword [rsp+8*726],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*730],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*729],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*728],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*732],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*733],r8
	mov r8, qword [rsp+8*732]
	mov r9, qword [rsp+8*733]
	mov qword [rsp+8*731],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*734],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*736],r8
	mov r8, qword [rsp+8*734]
	mov r9, qword [rsp+8*736]
	mov qword [rsp+8*735],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*730]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*724]
	mov qword [rsp+8*737],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*738],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*740],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*739],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*742],r8
	mov r8, qword [rsp+8*740]
	mov r9, qword [rsp+8*742]
	mov qword [rsp+8*741],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*745],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*744],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*743],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*747],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*748],r8
	mov r8, qword [rsp+8*747]
	mov r9, qword [rsp+8*748]
	mov qword [rsp+8*746],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*749],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*751],r8
	mov r8, qword [rsp+8*749]
	mov r9, qword [rsp+8*751]
	mov qword [rsp+8*750],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*745]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*5]
	mov qword [rsp+8*753],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*754],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*752],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*756],r8
	mov r8, qword [rsp+8*754]
	mov r9, qword [rsp+8*756]
	mov qword [rsp+8*755],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*5]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*759],r8
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*758],r9
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*757],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*761],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*762],r8
	mov r8, qword [rsp+8*761]
	mov r9, qword [rsp+8*762]
	mov qword [rsp+8*760],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov r9, qword [gbl+8*5]
	mov qword [rsp+8*763],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*765],r8
	mov r8, qword [rsp+8*763]
	mov r9, qword [rsp+8*765]
	mov qword [rsp+8*764],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*759]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*753]
	mov qword [rsp+8*766],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*739]
	mov qword [rsp+8*767],r9
	mov r9,r8
	sub r9,r10
	mov r8, qword [rsp+8*707]
	mov qword [rsp+8*768],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*646]
	mov qword [rsp+8*769],r9
	mov r9,r8
	sub r9,r10
	mov r8,r9
	mov qword [gbl+8*9],r8
	mov qword [rsp+8*771],r9
	mov qword [rsp+8*770],r10
	mov qword [gbl+8*7],r11
	mov qword [rsp+8*17],r12
	mov qword [rsp+8*18],r13
	mov qword [rsp+8*19],r14
	mov qword [rsp+8*20],r15
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


