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
	sub    rsp, 6296
	call global_init
	mov r8 , rax
	mov qword [rsp+8*1],r8
	
L_627:
	mov r8,1
	mov r9,29
	mov r10,r8
	shl r10,29
	mov r11, qword [gbl+8*3]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*2],r10
	mov qword [rsp+8*4],r12
	mov r8, qword [rsp+8*4]
	cmp r8, 0
	jne L_629
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*5],r8
	jmp L_630
	
L_629:
	mov r8,1
	mov r9,29
	mov r10,r8
	shl r10,29
	mov r11,r10
	neg r11
	mov r12, qword [gbl+8*3]
	cmp r12,r11
	mov r13, 0
	setg r13B
	mov qword [rsp+8*6],r10
	mov qword [rsp+8*7],r11
	mov qword [rsp+8*8],r13
	mov r9, qword [rsp+8*8]
	mov r8,r9
	mov qword [rsp+8*5],r8
	
L_630:
	mov r8, qword [rsp+8*5]
	cmp r8, 0
	je L_628
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov r10,r8
	sub r10,r9
	mov r11, qword [gbl+8*11]
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
	mov qword [rsp+8*16],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*17],r8
	mov r8, qword [rsp+8*16]
	mov r9, qword [rsp+8*17]
	mov qword [rsp+8*10],r10
	mov r10,r8
	sub r10,r9
	mov r8,r14
	add r8,r10
	mov qword [rsp+8*19],r8
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*18],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*21],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*22],r8
	mov r8, qword [rsp+8*21]
	mov r9, qword [rsp+8*22]
	mov qword [rsp+8*20],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*23],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*25],r8
	mov r8, qword [rsp+8*23]
	mov r9, qword [rsp+8*25]
	mov qword [rsp+8*24],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*19]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*27],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*28],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*26],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*33],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*32],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*31],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*35],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*36],r8
	mov r8, qword [rsp+8*35]
	mov r9, qword [rsp+8*36]
	mov qword [rsp+8*34],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*37],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*39],r8
	mov r8, qword [rsp+8*37]
	mov r9, qword [rsp+8*39]
	mov qword [rsp+8*38],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*33]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*27]
	mov qword [rsp+8*40],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*41],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*43],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*42],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*45],r8
	mov r8, qword [rsp+8*43]
	mov r9, qword [rsp+8*45]
	mov qword [rsp+8*44],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*47],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*46],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*49],r8
	mov r8, qword [rsp+8*47]
	mov r9, qword [rsp+8*49]
	mov qword [rsp+8*48],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*46]
	mov r9,r8
	sub r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*51],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*52],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*50],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*57],r8
	mov r8, qword [rsp+8*51]
	mov qword [rsp+8*56],r9
	mov r9, qword [rsp+8*57]
	mov qword [rsp+8*55],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*58],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*60],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*61],r8
	mov r8, qword [rsp+8*60]
	mov r9, qword [rsp+8*61]
	mov qword [rsp+8*59],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*62],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*64],r8
	mov r8, qword [rsp+8*62]
	mov r9, qword [rsp+8*64]
	mov qword [rsp+8*63],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*66],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*65],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*68],r8
	mov r8, qword [rsp+8*66]
	mov r9, qword [rsp+8*68]
	mov qword [rsp+8*67],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*71],r8
	mov r8, qword [rsp+8*65]
	mov qword [rsp+8*70],r9
	mov r9, qword [rsp+8*71]
	mov qword [rsp+8*69],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*58]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*42]
	mov qword [rsp+8*72],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*73],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*74],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*76],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*77],r8
	mov r8, qword [rsp+8*76]
	mov r9, qword [rsp+8*77]
	mov qword [rsp+8*75],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*78],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*80],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*81],r8
	mov r8, qword [rsp+8*80]
	mov r9, qword [rsp+8*81]
	mov qword [rsp+8*79],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*78]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*83],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*82],r10
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
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*87],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*89],r8
	mov r8, qword [rsp+8*87]
	mov r9, qword [rsp+8*89]
	mov qword [rsp+8*88],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*83]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*91],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*92],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*90],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*97],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*96],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*95],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*99],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*100],r8
	mov r8, qword [rsp+8*99]
	mov r9, qword [rsp+8*100]
	mov qword [rsp+8*98],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*101],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*103],r8
	mov r8, qword [rsp+8*101]
	mov r9, qword [rsp+8*103]
	mov qword [rsp+8*102],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*97]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*91]
	mov qword [rsp+8*104],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*105],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*107],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*106],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*109],r8
	mov r8, qword [rsp+8*107]
	mov r9, qword [rsp+8*109]
	mov qword [rsp+8*108],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*112],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*111],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*110],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*114],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*115],r8
	mov r8, qword [rsp+8*114]
	mov r9, qword [rsp+8*115]
	mov qword [rsp+8*113],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*116],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*118],r8
	mov r8, qword [rsp+8*116]
	mov r9, qword [rsp+8*118]
	mov qword [rsp+8*117],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*112]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*120],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*121],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*119],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*126],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*125],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*124],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*128],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*129],r8
	mov r8, qword [rsp+8*128]
	mov r9, qword [rsp+8*129]
	mov qword [rsp+8*127],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*130],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*132],r8
	mov r8, qword [rsp+8*130]
	mov r9, qword [rsp+8*132]
	mov qword [rsp+8*131],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*126]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*120]
	mov qword [rsp+8*133],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*106]
	mov qword [rsp+8*134],r9
	mov r9,r8
	sub r9,r10
	mov r8, qword [rsp+8*74]
	mov qword [rsp+8*135],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*136],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*138],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*137],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*140],r8
	mov r8, qword [rsp+8*138]
	mov r9, qword [rsp+8*140]
	mov qword [rsp+8*139],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*142],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*141],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*144],r8
	mov r8, qword [rsp+8*142]
	mov r9, qword [rsp+8*144]
	mov qword [rsp+8*143],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*141]
	mov r9,r8
	sub r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*146],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*147],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*145],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*152],r8
	mov r8, qword [rsp+8*146]
	mov qword [rsp+8*151],r9
	mov r9, qword [rsp+8*152]
	mov qword [rsp+8*150],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*153],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*155],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*156],r8
	mov r8, qword [rsp+8*155]
	mov r9, qword [rsp+8*156]
	mov qword [rsp+8*154],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*157],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*159],r8
	mov r8, qword [rsp+8*157]
	mov r9, qword [rsp+8*159]
	mov qword [rsp+8*158],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*161],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*160],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*163],r8
	mov r8, qword [rsp+8*161]
	mov r9, qword [rsp+8*163]
	mov qword [rsp+8*162],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*166],r8
	mov r8, qword [rsp+8*160]
	mov qword [rsp+8*165],r9
	mov r9, qword [rsp+8*166]
	mov qword [rsp+8*164],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*153]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*168],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*167],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*170],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*171],r8
	mov r8, qword [rsp+8*170]
	mov r9, qword [rsp+8*171]
	mov qword [rsp+8*169],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*172],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*174],r8
	mov r8, qword [rsp+8*172]
	mov r9, qword [rsp+8*174]
	mov qword [rsp+8*173],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*176],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*175],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*178],r8
	mov r8, qword [rsp+8*176]
	mov r9, qword [rsp+8*178]
	mov qword [rsp+8*177],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*181],r8
	mov r8, qword [rsp+8*175]
	mov qword [rsp+8*180],r9
	mov r9, qword [rsp+8*181]
	mov qword [rsp+8*179],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*182],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*184],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*185],r8
	mov r8, qword [rsp+8*184]
	mov r9, qword [rsp+8*185]
	mov qword [rsp+8*183],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*186],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*188],r8
	mov r8, qword [rsp+8*186]
	mov r9, qword [rsp+8*188]
	mov qword [rsp+8*187],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*190],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*189],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*192],r8
	mov r8, qword [rsp+8*190]
	mov r9, qword [rsp+8*192]
	mov qword [rsp+8*191],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*195],r8
	mov r8, qword [rsp+8*189]
	mov qword [rsp+8*194],r9
	mov r9, qword [rsp+8*195]
	mov qword [rsp+8*193],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*182]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*168]
	mov qword [rsp+8*196],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*197],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*198],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*200],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*201],r8
	mov r8, qword [rsp+8*200]
	mov r9, qword [rsp+8*201]
	mov qword [rsp+8*199],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*202],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*204],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*205],r8
	mov r8, qword [rsp+8*204]
	mov r9, qword [rsp+8*205]
	mov qword [rsp+8*203],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*202]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*207],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*206],r10
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
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*211],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*213],r8
	mov r8, qword [rsp+8*211]
	mov r9, qword [rsp+8*213]
	mov qword [rsp+8*212],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*207]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*215],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*216],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*214],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*221],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*220],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*219],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*223],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*224],r8
	mov r8, qword [rsp+8*223]
	mov r9, qword [rsp+8*224]
	mov qword [rsp+8*222],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*225],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*227],r8
	mov r8, qword [rsp+8*225]
	mov r9, qword [rsp+8*227]
	mov qword [rsp+8*226],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*221]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*215]
	mov qword [rsp+8*228],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*229],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*231],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*230],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*233],r8
	mov r8, qword [rsp+8*231]
	mov r9, qword [rsp+8*233]
	mov qword [rsp+8*232],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*236],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*235],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*234],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*238],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*239],r8
	mov r8, qword [rsp+8*238]
	mov r9, qword [rsp+8*239]
	mov qword [rsp+8*237],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*240],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*242],r8
	mov r8, qword [rsp+8*240]
	mov r9, qword [rsp+8*242]
	mov qword [rsp+8*241],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*236]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*244],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*245],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*243],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*250],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*249],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*248],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*252],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*253],r8
	mov r8, qword [rsp+8*252]
	mov r9, qword [rsp+8*253]
	mov qword [rsp+8*251],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*254],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*256],r8
	mov r8, qword [rsp+8*254]
	mov r9, qword [rsp+8*256]
	mov qword [rsp+8*255],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*250]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*244]
	mov qword [rsp+8*257],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*230]
	mov qword [rsp+8*258],r9
	mov r9,r8
	sub r9,r10
	mov r8, qword [rsp+8*198]
	mov qword [rsp+8*259],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*137]
	mov qword [rsp+8*260],r9
	mov r9,r8
	sub r9,r10
	mov r8,r9
	mov qword [gbl+8*9],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*262],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*261],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*264],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*265],r8
	mov r8, qword [rsp+8*264]
	mov r9, qword [rsp+8*265]
	mov qword [rsp+8*263],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*266],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*268],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*269],r8
	mov r8, qword [rsp+8*268]
	mov r9, qword [rsp+8*269]
	mov qword [rsp+8*267],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*266]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*271],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*270],r10
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
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*275],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*277],r8
	mov r8, qword [rsp+8*275]
	mov r9, qword [rsp+8*277]
	mov qword [rsp+8*276],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*271]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*279],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*280],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*278],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*285],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*284],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*283],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*287],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*288],r8
	mov r8, qword [rsp+8*287]
	mov r9, qword [rsp+8*288]
	mov qword [rsp+8*286],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*289],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*291],r8
	mov r8, qword [rsp+8*289]
	mov r9, qword [rsp+8*291]
	mov qword [rsp+8*290],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*285]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*279]
	mov qword [rsp+8*292],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*293],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*295],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*294],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*297],r8
	mov r8, qword [rsp+8*295]
	mov r9, qword [rsp+8*297]
	mov qword [rsp+8*296],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*299],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*298],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*301],r8
	mov r8, qword [rsp+8*299]
	mov r9, qword [rsp+8*301]
	mov qword [rsp+8*300],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*298]
	mov r9,r8
	sub r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*303],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*304],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*302],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*309],r8
	mov r8, qword [rsp+8*303]
	mov qword [rsp+8*308],r9
	mov r9, qword [rsp+8*309]
	mov qword [rsp+8*307],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*310],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*312],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*313],r8
	mov r8, qword [rsp+8*312]
	mov r9, qword [rsp+8*313]
	mov qword [rsp+8*311],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*314],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*316],r8
	mov r8, qword [rsp+8*314]
	mov r9, qword [rsp+8*316]
	mov qword [rsp+8*315],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*318],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*317],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*320],r8
	mov r8, qword [rsp+8*318]
	mov r9, qword [rsp+8*320]
	mov qword [rsp+8*319],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*323],r8
	mov r8, qword [rsp+8*317]
	mov qword [rsp+8*322],r9
	mov r9, qword [rsp+8*323]
	mov qword [rsp+8*321],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*310]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*294]
	mov qword [rsp+8*324],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*325],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*326],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*328],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*329],r8
	mov r8, qword [rsp+8*328]
	mov r9, qword [rsp+8*329]
	mov qword [rsp+8*327],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*330],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*332],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*333],r8
	mov r8, qword [rsp+8*332]
	mov r9, qword [rsp+8*333]
	mov qword [rsp+8*331],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*330]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*335],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*334],r10
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
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*339],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*341],r8
	mov r8, qword [rsp+8*339]
	mov r9, qword [rsp+8*341]
	mov qword [rsp+8*340],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*335]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*343],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*344],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*342],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*349],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*348],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*347],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*351],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*352],r8
	mov r8, qword [rsp+8*351]
	mov r9, qword [rsp+8*352]
	mov qword [rsp+8*350],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*353],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*355],r8
	mov r8, qword [rsp+8*353]
	mov r9, qword [rsp+8*355]
	mov qword [rsp+8*354],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*349]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*343]
	mov qword [rsp+8*356],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*357],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*359],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*358],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*361],r8
	mov r8, qword [rsp+8*359]
	mov r9, qword [rsp+8*361]
	mov qword [rsp+8*360],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*364],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*363],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*362],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*366],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*367],r8
	mov r8, qword [rsp+8*366]
	mov r9, qword [rsp+8*367]
	mov qword [rsp+8*365],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*368],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*370],r8
	mov r8, qword [rsp+8*368]
	mov r9, qword [rsp+8*370]
	mov qword [rsp+8*369],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*364]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*372],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*373],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*371],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*378],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*377],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*376],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*380],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*381],r8
	mov r8, qword [rsp+8*380]
	mov r9, qword [rsp+8*381]
	mov qword [rsp+8*379],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*382],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*384],r8
	mov r8, qword [rsp+8*382]
	mov r9, qword [rsp+8*384]
	mov qword [rsp+8*383],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*378]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*372]
	mov qword [rsp+8*385],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*358]
	mov qword [rsp+8*386],r9
	mov r9,r8
	sub r9,r10
	mov r8, qword [rsp+8*326]
	mov qword [rsp+8*387],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*388],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*390],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*389],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*392],r8
	mov r8, qword [rsp+8*390]
	mov r9, qword [rsp+8*392]
	mov qword [rsp+8*391],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*394],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*393],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*396],r8
	mov r8, qword [rsp+8*394]
	mov r9, qword [rsp+8*396]
	mov qword [rsp+8*395],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*393]
	mov r9,r8
	sub r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*398],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*399],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*397],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*404],r8
	mov r8, qword [rsp+8*398]
	mov qword [rsp+8*403],r9
	mov r9, qword [rsp+8*404]
	mov qword [rsp+8*402],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*405],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*407],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*408],r8
	mov r8, qword [rsp+8*407]
	mov r9, qword [rsp+8*408]
	mov qword [rsp+8*406],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*409],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*411],r8
	mov r8, qword [rsp+8*409]
	mov r9, qword [rsp+8*411]
	mov qword [rsp+8*410],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*413],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*412],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*415],r8
	mov r8, qword [rsp+8*413]
	mov r9, qword [rsp+8*415]
	mov qword [rsp+8*414],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*418],r8
	mov r8, qword [rsp+8*412]
	mov qword [rsp+8*417],r9
	mov r9, qword [rsp+8*418]
	mov qword [rsp+8*416],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*405]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*420],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*419],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*422],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*423],r8
	mov r8, qword [rsp+8*422]
	mov r9, qword [rsp+8*423]
	mov qword [rsp+8*421],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*424],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*426],r8
	mov r8, qword [rsp+8*424]
	mov r9, qword [rsp+8*426]
	mov qword [rsp+8*425],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*428],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*427],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*430],r8
	mov r8, qword [rsp+8*428]
	mov r9, qword [rsp+8*430]
	mov qword [rsp+8*429],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*433],r8
	mov r8, qword [rsp+8*427]
	mov qword [rsp+8*432],r9
	mov r9, qword [rsp+8*433]
	mov qword [rsp+8*431],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*434],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*436],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*437],r8
	mov r8, qword [rsp+8*436]
	mov r9, qword [rsp+8*437]
	mov qword [rsp+8*435],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*438],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*440],r8
	mov r8, qword [rsp+8*438]
	mov r9, qword [rsp+8*440]
	mov qword [rsp+8*439],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*442],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*441],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*444],r8
	mov r8, qword [rsp+8*442]
	mov r9, qword [rsp+8*444]
	mov qword [rsp+8*443],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*447],r8
	mov r8, qword [rsp+8*441]
	mov qword [rsp+8*446],r9
	mov r9, qword [rsp+8*447]
	mov qword [rsp+8*445],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*434]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*420]
	mov qword [rsp+8*448],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*449],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*450],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*452],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*453],r8
	mov r8, qword [rsp+8*452]
	mov r9, qword [rsp+8*453]
	mov qword [rsp+8*451],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*454],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*456],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*457],r8
	mov r8, qword [rsp+8*456]
	mov r9, qword [rsp+8*457]
	mov qword [rsp+8*455],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*454]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*459],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*458],r10
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
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*463],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*465],r8
	mov r8, qword [rsp+8*463]
	mov r9, qword [rsp+8*465]
	mov qword [rsp+8*464],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*459]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*467],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*468],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*466],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*473],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*472],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*471],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*475],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*476],r8
	mov r8, qword [rsp+8*475]
	mov r9, qword [rsp+8*476]
	mov qword [rsp+8*474],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*477],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*479],r8
	mov r8, qword [rsp+8*477]
	mov r9, qword [rsp+8*479]
	mov qword [rsp+8*478],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*473]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*467]
	mov qword [rsp+8*480],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*481],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*483],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*482],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*485],r8
	mov r8, qword [rsp+8*483]
	mov r9, qword [rsp+8*485]
	mov qword [rsp+8*484],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*488],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*487],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*486],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*490],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*491],r8
	mov r8, qword [rsp+8*490]
	mov r9, qword [rsp+8*491]
	mov qword [rsp+8*489],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*492],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*494],r8
	mov r8, qword [rsp+8*492]
	mov r9, qword [rsp+8*494]
	mov qword [rsp+8*493],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*488]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*496],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*497],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*495],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*502],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*501],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*500],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*504],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*505],r8
	mov r8, qword [rsp+8*504]
	mov r9, qword [rsp+8*505]
	mov qword [rsp+8*503],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*506],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*508],r8
	mov r8, qword [rsp+8*506]
	mov r9, qword [rsp+8*508]
	mov qword [rsp+8*507],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*502]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*496]
	mov qword [rsp+8*509],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*482]
	mov qword [rsp+8*510],r9
	mov r9,r8
	sub r9,r10
	mov r8, qword [rsp+8*450]
	mov qword [rsp+8*511],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*389]
	mov qword [rsp+8*512],r9
	mov r9,r8
	sub r9,r10
	mov r11,r9
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*514],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*513],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*516],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*517],r8
	mov r8, qword [rsp+8*516]
	mov r9, qword [rsp+8*517]
	mov qword [rsp+8*515],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*518],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*520],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*521],r8
	mov r8, qword [rsp+8*520]
	mov r9, qword [rsp+8*521]
	mov qword [rsp+8*519],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*518]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*523],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*522],r10
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
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*527],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*529],r8
	mov r8, qword [rsp+8*527]
	mov r9, qword [rsp+8*529]
	mov qword [rsp+8*528],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*523]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*531],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*532],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*530],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*537],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*536],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*535],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*539],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*540],r8
	mov r8, qword [rsp+8*539]
	mov r9, qword [rsp+8*540]
	mov qword [rsp+8*538],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*541],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*543],r8
	mov r8, qword [rsp+8*541]
	mov r9, qword [rsp+8*543]
	mov qword [rsp+8*542],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*537]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*531]
	mov qword [rsp+8*544],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*545],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*547],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*546],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*549],r8
	mov r8, qword [rsp+8*547]
	mov r9, qword [rsp+8*549]
	mov qword [rsp+8*548],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*551],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*550],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*553],r8
	mov r8, qword [rsp+8*551]
	mov r9, qword [rsp+8*553]
	mov qword [rsp+8*552],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*550]
	mov r9,r8
	sub r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*555],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*556],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*554],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*561],r8
	mov r8, qword [rsp+8*555]
	mov qword [rsp+8*560],r9
	mov r9, qword [rsp+8*561]
	mov qword [rsp+8*559],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*562],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*564],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*565],r8
	mov r8, qword [rsp+8*564]
	mov r9, qword [rsp+8*565]
	mov qword [rsp+8*563],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*566],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*568],r8
	mov r8, qword [rsp+8*566]
	mov r9, qword [rsp+8*568]
	mov qword [rsp+8*567],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*570],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*569],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*572],r8
	mov r8, qword [rsp+8*570]
	mov r9, qword [rsp+8*572]
	mov qword [rsp+8*571],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*575],r8
	mov r8, qword [rsp+8*569]
	mov qword [rsp+8*574],r9
	mov r9, qword [rsp+8*575]
	mov qword [rsp+8*573],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*562]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*546]
	mov qword [rsp+8*576],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*577],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*578],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*580],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*581],r8
	mov r8, qword [rsp+8*580]
	mov r9, qword [rsp+8*581]
	mov qword [rsp+8*579],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*582],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*584],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*585],r8
	mov r8, qword [rsp+8*584]
	mov r9, qword [rsp+8*585]
	mov qword [rsp+8*583],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*582]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*587],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*586],r10
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
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*591],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*593],r8
	mov r8, qword [rsp+8*591]
	mov r9, qword [rsp+8*593]
	mov qword [rsp+8*592],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*587]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*595],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*596],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*594],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*601],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*600],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*599],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*603],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*604],r8
	mov r8, qword [rsp+8*603]
	mov r9, qword [rsp+8*604]
	mov qword [rsp+8*602],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*605],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*607],r8
	mov r8, qword [rsp+8*605]
	mov r9, qword [rsp+8*607]
	mov qword [rsp+8*606],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*601]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*595]
	mov qword [rsp+8*608],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*609],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*611],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*610],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*613],r8
	mov r8, qword [rsp+8*611]
	mov r9, qword [rsp+8*613]
	mov qword [rsp+8*612],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*616],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*615],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*614],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*618],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*619],r8
	mov r8, qword [rsp+8*618]
	mov r9, qword [rsp+8*619]
	mov qword [rsp+8*617],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*620],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*622],r8
	mov r8, qword [rsp+8*620]
	mov r9, qword [rsp+8*622]
	mov qword [rsp+8*621],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*616]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*624],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*625],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*623],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*630],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*629],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*628],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*632],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*633],r8
	mov r8, qword [rsp+8*632]
	mov r9, qword [rsp+8*633]
	mov qword [rsp+8*631],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*634],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*636],r8
	mov r8, qword [rsp+8*634]
	mov r9, qword [rsp+8*636]
	mov qword [rsp+8*635],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*630]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*624]
	mov qword [rsp+8*637],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*610]
	mov qword [rsp+8*638],r9
	mov r9,r8
	sub r9,r10
	mov r8, qword [rsp+8*578]
	mov qword [rsp+8*639],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*640],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*642],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*641],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*644],r8
	mov r8, qword [rsp+8*642]
	mov r9, qword [rsp+8*644]
	mov qword [rsp+8*643],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*646],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*645],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*648],r8
	mov r8, qword [rsp+8*646]
	mov r9, qword [rsp+8*648]
	mov qword [rsp+8*647],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*645]
	mov r9,r8
	sub r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*650],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*651],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*649],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*656],r8
	mov r8, qword [rsp+8*650]
	mov qword [rsp+8*655],r9
	mov r9, qword [rsp+8*656]
	mov qword [rsp+8*654],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*657],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*659],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*660],r8
	mov r8, qword [rsp+8*659]
	mov r9, qword [rsp+8*660]
	mov qword [rsp+8*658],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*661],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*663],r8
	mov r8, qword [rsp+8*661]
	mov r9, qword [rsp+8*663]
	mov qword [rsp+8*662],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*665],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*664],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*667],r8
	mov r8, qword [rsp+8*665]
	mov r9, qword [rsp+8*667]
	mov qword [rsp+8*666],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*670],r8
	mov r8, qword [rsp+8*664]
	mov qword [rsp+8*669],r9
	mov r9, qword [rsp+8*670]
	mov qword [rsp+8*668],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*657]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*672],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*671],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*674],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*675],r8
	mov r8, qword [rsp+8*674]
	mov r9, qword [rsp+8*675]
	mov qword [rsp+8*673],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*676],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*678],r8
	mov r8, qword [rsp+8*676]
	mov r9, qword [rsp+8*678]
	mov qword [rsp+8*677],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*680],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*679],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*682],r8
	mov r8, qword [rsp+8*680]
	mov r9, qword [rsp+8*682]
	mov qword [rsp+8*681],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*685],r8
	mov r8, qword [rsp+8*679]
	mov qword [rsp+8*684],r9
	mov r9, qword [rsp+8*685]
	mov qword [rsp+8*683],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*686],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*688],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*689],r8
	mov r8, qword [rsp+8*688]
	mov r9, qword [rsp+8*689]
	mov qword [rsp+8*687],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*690],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*692],r8
	mov r8, qword [rsp+8*690]
	mov r9, qword [rsp+8*692]
	mov qword [rsp+8*691],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*694],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*693],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*696],r8
	mov r8, qword [rsp+8*694]
	mov r9, qword [rsp+8*696]
	mov qword [rsp+8*695],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*699],r8
	mov r8, qword [rsp+8*693]
	mov qword [rsp+8*698],r9
	mov r9, qword [rsp+8*699]
	mov qword [rsp+8*697],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*686]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*672]
	mov qword [rsp+8*700],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*701],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*702],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*704],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*705],r8
	mov r8, qword [rsp+8*704]
	mov r9, qword [rsp+8*705]
	mov qword [rsp+8*703],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*706],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*708],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*709],r8
	mov r8, qword [rsp+8*708]
	mov r9, qword [rsp+8*709]
	mov qword [rsp+8*707],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*706]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*711],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*710],r10
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
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*715],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*717],r8
	mov r8, qword [rsp+8*715]
	mov r9, qword [rsp+8*717]
	mov qword [rsp+8*716],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*711]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*719],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*720],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*718],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*725],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*724],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*723],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*727],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*728],r8
	mov r8, qword [rsp+8*727]
	mov r9, qword [rsp+8*728]
	mov qword [rsp+8*726],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*729],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*731],r8
	mov r8, qword [rsp+8*729]
	mov r9, qword [rsp+8*731]
	mov qword [rsp+8*730],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*725]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*719]
	mov qword [rsp+8*732],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*733],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*735],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*734],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*737],r8
	mov r8, qword [rsp+8*735]
	mov r9, qword [rsp+8*737]
	mov qword [rsp+8*736],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*740],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*739],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*738],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*742],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*743],r8
	mov r8, qword [rsp+8*742]
	mov r9, qword [rsp+8*743]
	mov qword [rsp+8*741],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*744],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*746],r8
	mov r8, qword [rsp+8*744]
	mov r9, qword [rsp+8*746]
	mov qword [rsp+8*745],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*740]
	mov r9,r8
	add r9,r10
	mov r8, qword [gbl+8*9]
	mov qword [rsp+8*748],r9
	mov r9,r8
	add r9,r11
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*749],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*747],r10
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
	mov r8, qword [gbl+8*9]
	mov r9,r8
	add r9,r11
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*754],r8
	mov r8, qword [gbl+8*3]
	mov qword [rsp+8*753],r9
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*752],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*756],r8
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*757],r8
	mov r8, qword [rsp+8*756]
	mov r9, qword [rsp+8*757]
	mov qword [rsp+8*755],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [gbl+8*3]
	mov r9, qword [gbl+8*9]
	mov qword [rsp+8*758],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*760],r8
	mov r8, qword [rsp+8*758]
	mov r9, qword [rsp+8*760]
	mov qword [rsp+8*759],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*754]
	mov r9,r8
	add r9,r10
	mov r8, qword [rsp+8*748]
	mov qword [rsp+8*761],r10
	mov r10,r8
	sub r10,r9
	mov r8, qword [rsp+8*734]
	mov qword [rsp+8*762],r9
	mov r9,r8
	sub r9,r10
	mov r8, qword [rsp+8*702]
	mov qword [rsp+8*763],r10
	mov r10,r8
	add r10,r9
	mov r8, qword [rsp+8*641]
	mov qword [rsp+8*764],r9
	mov r9,r8
	sub r9,r10
	mov r8,r9
	mov qword [gbl+8*3],r8
	mov qword [rsp+8*766],r9
	mov qword [rsp+8*765],r10
	mov qword [gbl+8*11],r11
	mov qword [rsp+8*12],r12
	mov qword [rsp+8*13],r13
	mov qword [rsp+8*14],r14
	mov qword [rsp+8*15],r15
	jmp L_627
	
L_628:
	mov r9, qword [gbl+8*9]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*768],r10
	mov     rdi, [rsp+8*768]
	call    toString
	mov     qword[rsp+8*769], rax
	mov     rsi, t837
	mov     rdi, [rsp+8*769]
	call    concat
	mov [rsp+8*770], rax
	mov r9, qword [gbl+8*11]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*771],r10
	mov     rdi, [rsp+8*771]
	call    toString
	mov     qword[rsp+8*772], rax
	mov     rsi, [rsp+8*772]
	mov     rdi, [rsp+8*770]
	call    concat
	mov [rsp+8*773], rax
	mov     rsi, t843
	mov     rdi, [rsp+8*773]
	call    concat
	mov [rsp+8*774], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*775],r10
	mov     rdi, [rsp+8*775]
	call    toString
	mov     qword[rsp+8*776], rax
	mov     rsi, [rsp+8*776]
	mov     rdi, [rsp+8*774]
	call    concat
	mov [rsp+8*777], rax
	mov r9, qword [rsp+8*777]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*778],r10
	mov rdi,[rsp+8*778] 
	add rdi, 1 
	call puts
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
	sub    rsp, 6296
	mov r9,1
	mov r8,r9
	mov r11,1
	mov r10,r11
	mov r13,1
	mov r12,r13
	mov qword [gbl+8*9],r8
	mov qword [gbl+8*11],r10
	mov qword [gbl+8*3],r12
	mov r8, qword [rsp+8*779]
	mov rax,r8
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   8280
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
	
t843:
	 db 1," " ,0

t837:
	 db 1," " ,0


