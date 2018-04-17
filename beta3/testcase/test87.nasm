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
	sub    rsp, 6296
	call global_init
	mov r10, qword [rsp+8*1]
	mov r10 , rax
	mov qword [rsp+8*1],r10
	
L_627:
	mov r10, qword [rsp+8*2]
	mov r11,1
	mov r10,r11
	shl r10,29
	mov qword [rsp+8*2],r10
	mov r10, qword [gbl+8*3]
	mov r11, qword [rsp+8*2]
	cmp r10,r11
	mov r12, qword [rsp+8*4]
	mov r12, 0
	setl r12B
	mov qword [gbl+8*3],r10
	mov qword [rsp+8*2],r11
	mov qword [rsp+8*4],r12
	mov r10, qword [rsp+8*4]
	cmp r10, 0
	mov qword [rsp+8*4],r10
	jne L_629
	mov r10, qword [rsp+8*5]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*5],r10
	jmp L_630
	
L_629:
	mov r10, qword [rsp+8*6]
	mov r11,1
	mov r10,r11
	shl r10,29
	mov qword [rsp+8*6],r10
	mov r10, qword [rsp+8*7]
	mov r11, qword [rsp+8*6]
	mov r10,r11
	neg r10
	mov qword [rsp+8*7],r10
	mov qword [rsp+8*6],r11
	mov r10, qword [gbl+8*3]
	mov r11, qword [rsp+8*7]
	cmp r10,r11
	mov r12, qword [rsp+8*8]
	mov r12, 0
	setg r12B
	mov qword [gbl+8*3],r10
	mov qword [rsp+8*7],r11
	mov qword [rsp+8*8],r12
	mov r10, qword [rsp+8*5]
	mov r11, qword [rsp+8*8]
	mov r10,r11
	mov qword [rsp+8*5],r10
	mov qword [rsp+8*8],r11
	
L_630:
	mov r10, qword [rsp+8*5]
	cmp r10, 0
	mov qword [rsp+8*5],r10
	je L_628
	mov r10, qword [rsp+8*10]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov r13, qword [rsp+8*12]
	mov r13,r10
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov r15, qword [rsp+8*13]
	mov r15,r12
	add r15,r14
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*14]
	mov r12,r13
	sub r12,r15
	mov qword [rsp+8*12],r13
	mov r13, qword [rsp+8*15]
	mov r13,r11
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r13,r14
	mov qword [rsp+8*13],r15
	mov r15, qword [rsp+8*16]
	mov r15,r13
	mov qword [rsp+8*10],r10
	mov r10, qword [gbl+8*11]
	add r15,r10
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*17]
	mov r11,r14
	add r11,r10
	mov qword [rsp+8*14],r12
	mov r12, qword [rsp+8*18]
	mov r12,r15
	sub r12,r11
	mov qword [rsp+8*15],r13
	mov r13, qword [rsp+8*19]
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*14]
	mov r13,r14
	add r13,r12
	mov qword [rsp+8*16],r15
	mov r15, qword [rsp+8*20]
	mov qword [gbl+8*11],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	mov qword [rsp+8*17],r11
	mov r11, qword [gbl+8*9]
	sub r15,r11
	mov qword [rsp+8*18],r12
	mov r12, qword [rsp+8*21]
	mov r12,r15
	mov qword [rsp+8*19],r13
	mov r13, qword [gbl+8*11]
	add r12,r13
	mov qword [rsp+8*14],r14
	mov r14, qword [rsp+8*22]
	mov r14,r11
	add r14,r13
	mov qword [rsp+8*20],r15
	mov r15, qword [rsp+8*23]
	mov r15,r12
	sub r15,r14
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*24]
	mov qword [gbl+8*9],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*21],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*25]
	mov r13,r10
	mov qword [rsp+8*22],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*23],r15
	mov r15, qword [rsp+8*26]
	mov qword [rsp+8*24],r10
	mov r10, qword [rsp+8*23]
	mov r15,r10
	add r15,r13
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*27]
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*19]
	mov r11,r12
	add r11,r15
	mov qword [rsp+8*25],r13
	mov r13, qword [rsp+8*28]
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	mov r13,r14
	mov qword [rsp+8*26],r15
	mov r15, qword [gbl+8*11]
	add r13,r15
	mov qword [rsp+8*23],r10
	mov r10, qword [rsp+8*29]
	mov qword [rsp+8*27],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*19],r12
	mov r12, qword [rsp+8*30]
	mov r12,r10
	add r12,r15
	mov qword [rsp+8*28],r13
	mov r13, qword [rsp+8*31]
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*28]
	mov r13,r14
	add r13,r12
	mov qword [gbl+8*11],r15
	mov r15, qword [rsp+8*32]
	mov qword [rsp+8*29],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [gbl+8*3],r11
	mov r11, qword [gbl+8*11]
	add r15,r11
	mov qword [rsp+8*30],r12
	mov r12, qword [rsp+8*33]
	mov r12,r13
	sub r12,r15
	mov qword [rsp+8*31],r13
	mov r13, qword [rsp+8*34]
	mov qword [rsp+8*28],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	sub r13,r10
	mov qword [rsp+8*32],r15
	mov r15, qword [rsp+8*35]
	mov r15,r13
	add r15,r11
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*36]
	mov qword [gbl+8*11],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [rsp+8*33],r12
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*34],r13
	mov r13, qword [rsp+8*37]
	mov r13,r15
	sub r13,r10
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*38]
	mov qword [rsp+8*35],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	sub r14,r11
	mov qword [rsp+8*36],r10
	mov r10, qword [rsp+8*39]
	mov r10,r14
	add r10,r12
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*40]
	mov r11,r13
	add r11,r10
	mov qword [gbl+8*11],r12
	mov r12, qword [rsp+8*41]
	mov qword [rsp+8*37],r13
	mov r13, qword [rsp+8*33]
	mov r12,r13
	add r12,r11
	mov qword [rsp+8*38],r14
	mov r14, qword [rsp+8*42]
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*27]
	mov r14,r15
	sub r14,r12
	mov qword [rsp+8*39],r10
	mov r10, qword [rsp+8*43]
	mov qword [rsp+8*40],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [rsp+8*41],r12
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*33],r13
	mov r13, qword [rsp+8*44]
	mov qword [rsp+8*42],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	sub r13,r11
	mov qword [rsp+8*27],r15
	mov r15, qword [rsp+8*45]
	mov r15,r13
	add r15,r12
	mov qword [rsp+8*43],r10
	mov r10, qword [rsp+8*46]
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*43]
	mov r10,r11
	add r10,r15
	mov qword [gbl+8*11],r12
	mov r12, qword [rsp+8*47]
	mov qword [rsp+8*44],r13
	mov r13, qword [gbl+8*9]
	mov r12,r13
	mov qword [gbl+8*3],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*45],r15
	mov r15, qword [rsp+8*48]
	mov qword [rsp+8*46],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*43],r11
	mov r11, qword [rsp+8*49]
	mov r11,r15
	add r11,r14
	mov qword [rsp+8*47],r12
	mov r12, qword [rsp+8*50]
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*47]
	mov r12,r13
	add r12,r11
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*51]
	mov qword [rsp+8*48],r15
	mov r15, qword [rsp+8*46]
	mov r14,r15
	sub r14,r12
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*52]
	mov qword [rsp+8*49],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [rsp+8*50],r12
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*47],r13
	mov r13, qword [rsp+8*53]
	mov qword [rsp+8*51],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	sub r13,r11
	mov qword [rsp+8*46],r15
	mov r15, qword [rsp+8*54]
	mov r15,r13
	add r15,r12
	mov qword [rsp+8*52],r10
	mov r10, qword [rsp+8*55]
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*52]
	mov r10,r11
	add r10,r15
	mov qword [gbl+8*11],r12
	mov r12, qword [rsp+8*56]
	mov qword [rsp+8*53],r13
	mov r13, qword [gbl+8*9]
	mov r12,r13
	mov qword [gbl+8*3],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*54],r15
	mov r15, qword [rsp+8*57]
	mov r15,r10
	sub r15,r12
	mov qword [rsp+8*55],r10
	mov r10, qword [rsp+8*58]
	mov qword [rsp+8*52],r11
	mov r11, qword [rsp+8*51]
	mov r10,r11
	sub r10,r15
	mov qword [rsp+8*56],r12
	mov r12, qword [rsp+8*59]
	mov qword [gbl+8*9],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r12,r14
	mov qword [rsp+8*57],r15
	mov r15, qword [rsp+8*60]
	mov r15,r12
	mov qword [rsp+8*58],r10
	mov r10, qword [gbl+8*11]
	add r15,r10
	mov qword [rsp+8*51],r11
	mov r11, qword [rsp+8*61]
	mov r11,r14
	add r11,r10
	mov qword [rsp+8*59],r12
	mov r12, qword [rsp+8*62]
	mov r12,r15
	sub r12,r11
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*63]
	mov qword [gbl+8*9],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	mov qword [rsp+8*60],r15
	mov r15, qword [gbl+8*9]
	sub r13,r15
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*64]
	mov r10,r13
	mov qword [rsp+8*61],r11
	mov r11, qword [gbl+8*11]
	add r10,r11
	mov qword [rsp+8*62],r12
	mov r12, qword [rsp+8*65]
	mov qword [rsp+8*63],r13
	mov r13, qword [rsp+8*62]
	mov r12,r13
	add r12,r10
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*66]
	mov r14,r15
	add r14,r11
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*67]
	mov qword [rsp+8*64],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	mov qword [gbl+8*11],r11
	mov r11, qword [gbl+8*9]
	sub r15,r11
	mov qword [rsp+8*65],r12
	mov r12, qword [rsp+8*68]
	mov r12,r15
	mov qword [rsp+8*62],r13
	mov r13, qword [gbl+8*11]
	add r12,r13
	mov qword [rsp+8*66],r14
	mov r14, qword [rsp+8*69]
	mov qword [rsp+8*67],r15
	mov r15, qword [rsp+8*66]
	mov r14,r15
	add r14,r12
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*70]
	mov r10,r11
	add r10,r13
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*71]
	mov r11,r14
	sub r11,r10
	mov qword [rsp+8*68],r12
	mov r12, qword [rsp+8*72]
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*65]
	mov r12,r13
	sub r12,r11
	mov qword [rsp+8*69],r14
	mov r14, qword [rsp+8*73]
	mov qword [rsp+8*66],r15
	mov r15, qword [rsp+8*58]
	mov r14,r15
	add r14,r12
	mov qword [rsp+8*70],r10
	mov r10, qword [rsp+8*74]
	mov qword [rsp+8*71],r11
	mov r11, qword [rsp+8*42]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*72],r12
	mov r12, qword [rsp+8*75]
	mov qword [rsp+8*65],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	mov qword [rsp+8*73],r14
	mov r14, qword [gbl+8*9]
	sub r12,r14
	mov qword [rsp+8*58],r15
	mov r15, qword [rsp+8*76]
	mov r15,r12
	mov qword [rsp+8*74],r10
	mov r10, qword [gbl+8*11]
	add r15,r10
	mov qword [rsp+8*42],r11
	mov r11, qword [rsp+8*77]
	mov r11,r14
	add r11,r10
	mov qword [rsp+8*75],r12
	mov r12, qword [rsp+8*78]
	mov r12,r15
	sub r12,r11
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*79]
	mov qword [gbl+8*9],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	mov qword [rsp+8*76],r15
	mov r15, qword [gbl+8*9]
	sub r13,r15
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*80]
	mov r10,r13
	mov qword [rsp+8*77],r11
	mov r11, qword [gbl+8*11]
	add r10,r11
	mov qword [rsp+8*78],r12
	mov r12, qword [rsp+8*81]
	mov r12,r15
	add r12,r11
	mov qword [rsp+8*79],r13
	mov r13, qword [rsp+8*82]
	mov r13,r10
	sub r13,r12
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*83]
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*78]
	mov r14,r15
	add r14,r13
	mov qword [rsp+8*80],r10
	mov r10, qword [rsp+8*84]
	mov qword [gbl+8*11],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*81],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*82],r13
	mov r13, qword [rsp+8*85]
	mov r13,r10
	mov qword [rsp+8*83],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*78],r15
	mov r15, qword [rsp+8*86]
	mov r15,r12
	add r15,r14
	mov qword [rsp+8*84],r10
	mov r10, qword [rsp+8*87]
	mov r10,r13
	sub r10,r15
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*88]
	mov qword [gbl+8*9],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	mov qword [rsp+8*85],r13
	mov r13, qword [gbl+8*9]
	sub r11,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*89]
	mov r14,r11
	mov qword [rsp+8*86],r15
	mov r15, qword [gbl+8*11]
	add r14,r15
	mov qword [rsp+8*87],r10
	mov r10, qword [rsp+8*90]
	mov qword [rsp+8*88],r11
	mov r11, qword [rsp+8*87]
	mov r10,r11
	add r10,r14
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*91]
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*83]
	mov r12,r13
	add r12,r10
	mov qword [rsp+8*89],r14
	mov r14, qword [rsp+8*92]
	mov qword [gbl+8*11],r15
	mov r15, qword [gbl+8*9]
	mov r14,r15
	mov qword [rsp+8*90],r10
	mov r10, qword [gbl+8*11]
	add r14,r10
	mov qword [rsp+8*87],r11
	mov r11, qword [rsp+8*93]
	mov qword [rsp+8*91],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	sub r11,r15
	mov qword [rsp+8*83],r13
	mov r13, qword [rsp+8*94]
	mov r13,r11
	add r13,r10
	mov qword [rsp+8*92],r14
	mov r14, qword [rsp+8*95]
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*92]
	mov r14,r15
	add r14,r13
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*96]
	mov qword [rsp+8*93],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [gbl+8*3],r12
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*94],r13
	mov r13, qword [rsp+8*97]
	mov r13,r14
	sub r13,r10
	mov qword [rsp+8*95],r14
	mov r14, qword [rsp+8*98]
	mov qword [rsp+8*92],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	sub r14,r11
	mov qword [rsp+8*96],r10
	mov r10, qword [rsp+8*99]
	mov r10,r14
	add r10,r12
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*100]
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [rsp+8*97],r13
	mov r13, qword [gbl+8*11]
	add r11,r13
	mov qword [rsp+8*98],r14
	mov r14, qword [rsp+8*101]
	mov r14,r10
	sub r14,r11
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*102]
	mov qword [rsp+8*99],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r12
	mov qword [rsp+8*100],r11
	mov r11, qword [rsp+8*103]
	mov r11,r15
	add r11,r13
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*104]
	mov r12,r14
	add r12,r11
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*105]
	mov qword [rsp+8*101],r14
	mov r14, qword [rsp+8*97]
	mov r13,r14
	add r13,r12
	mov qword [rsp+8*102],r15
	mov r15, qword [rsp+8*106]
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*91]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*103],r11
	mov r11, qword [rsp+8*107]
	mov qword [rsp+8*104],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [rsp+8*105],r13
	mov r13, qword [gbl+8*11]
	add r11,r13
	mov qword [rsp+8*97],r14
	mov r14, qword [rsp+8*108]
	mov qword [rsp+8*106],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	sub r14,r12
	mov qword [rsp+8*91],r10
	mov r10, qword [rsp+8*109]
	mov r10,r14
	add r10,r13
	mov qword [rsp+8*107],r11
	mov r11, qword [rsp+8*110]
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*107]
	mov r11,r12
	add r11,r10
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*111]
	mov qword [rsp+8*108],r14
	mov r14, qword [gbl+8*9]
	mov r13,r14
	mov qword [gbl+8*3],r15
	mov r15, qword [gbl+8*11]
	add r13,r15
	mov qword [rsp+8*109],r10
	mov r10, qword [rsp+8*112]
	mov r10,r11
	sub r10,r13
	mov qword [rsp+8*110],r11
	mov r11, qword [rsp+8*113]
	mov qword [rsp+8*107],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	sub r11,r14
	mov qword [rsp+8*111],r13
	mov r13, qword [rsp+8*114]
	mov r13,r11
	add r13,r15
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*115]
	mov qword [gbl+8*11],r15
	mov r15, qword [gbl+8*9]
	mov r14,r15
	mov qword [rsp+8*112],r10
	mov r10, qword [gbl+8*11]
	add r14,r10
	mov qword [rsp+8*113],r11
	mov r11, qword [rsp+8*116]
	mov r11,r13
	sub r11,r14
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*117]
	mov qword [rsp+8*114],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r15
	mov qword [rsp+8*115],r14
	mov r14, qword [rsp+8*118]
	mov r14,r12
	add r14,r10
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*119]
	mov r15,r11
	add r15,r14
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*120]
	mov qword [rsp+8*116],r11
	mov r11, qword [rsp+8*112]
	mov r10,r11
	add r10,r15
	mov qword [rsp+8*117],r12
	mov r12, qword [rsp+8*121]
	mov qword [gbl+8*3],r13
	mov r13, qword [gbl+8*9]
	mov r12,r13
	mov qword [rsp+8*118],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*119],r15
	mov r15, qword [rsp+8*122]
	mov qword [rsp+8*120],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*112],r11
	mov r11, qword [rsp+8*123]
	mov r11,r15
	add r11,r14
	mov qword [rsp+8*121],r12
	mov r12, qword [rsp+8*124]
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*121]
	mov r12,r13
	add r12,r11
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*125]
	mov qword [rsp+8*122],r15
	mov r15, qword [gbl+8*9]
	mov r14,r15
	mov qword [gbl+8*3],r10
	mov r10, qword [gbl+8*11]
	add r14,r10
	mov qword [rsp+8*123],r11
	mov r11, qword [rsp+8*126]
	mov r11,r12
	sub r11,r14
	mov qword [rsp+8*124],r12
	mov r12, qword [rsp+8*127]
	mov qword [rsp+8*121],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r15
	mov qword [rsp+8*125],r14
	mov r14, qword [rsp+8*128]
	mov r14,r12
	add r14,r10
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*129]
	mov qword [gbl+8*11],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [rsp+8*126],r11
	mov r11, qword [gbl+8*11]
	add r15,r11
	mov qword [rsp+8*127],r12
	mov r12, qword [rsp+8*130]
	mov r12,r14
	sub r12,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*131]
	mov qword [rsp+8*128],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	sub r13,r10
	mov qword [rsp+8*129],r15
	mov r15, qword [rsp+8*132]
	mov r15,r13
	add r15,r11
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*133]
	mov r10,r12
	add r10,r15
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*134]
	mov qword [rsp+8*130],r12
	mov r12, qword [rsp+8*126]
	mov r11,r12
	add r11,r10
	mov qword [rsp+8*131],r13
	mov r13, qword [rsp+8*135]
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*120]
	mov r13,r14
	sub r13,r11
	mov qword [rsp+8*132],r15
	mov r15, qword [rsp+8*136]
	mov qword [rsp+8*133],r10
	mov r10, qword [rsp+8*106]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*134],r11
	mov r11, qword [rsp+8*137]
	mov qword [rsp+8*126],r12
	mov r12, qword [rsp+8*74]
	mov r11,r12
	add r11,r15
	mov qword [rsp+8*135],r13
	mov r13, qword [rsp+8*138]
	mov qword [rsp+8*120],r14
	mov r14, qword [gbl+8*9]
	mov r13,r14
	mov qword [rsp+8*136],r15
	mov r15, qword [gbl+8*11]
	add r13,r15
	mov qword [rsp+8*106],r10
	mov r10, qword [rsp+8*139]
	mov qword [rsp+8*137],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*74],r12
	mov r12, qword [rsp+8*140]
	mov r12,r10
	add r12,r15
	mov qword [rsp+8*138],r13
	mov r13, qword [rsp+8*141]
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*138]
	mov r13,r14
	add r13,r12
	mov qword [gbl+8*11],r15
	mov r15, qword [rsp+8*142]
	mov qword [rsp+8*139],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [gbl+8*3],r11
	mov r11, qword [gbl+8*11]
	add r15,r11
	mov qword [rsp+8*140],r12
	mov r12, qword [rsp+8*143]
	mov qword [rsp+8*141],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r10
	mov qword [rsp+8*138],r14
	mov r14, qword [rsp+8*144]
	mov r14,r12
	add r14,r11
	mov qword [rsp+8*142],r15
	mov r15, qword [rsp+8*145]
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*142]
	mov r15,r10
	add r15,r14
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*146]
	mov qword [rsp+8*143],r12
	mov r12, qword [rsp+8*141]
	mov r11,r12
	sub r11,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*147]
	mov qword [rsp+8*144],r14
	mov r14, qword [gbl+8*9]
	mov r13,r14
	mov qword [rsp+8*145],r15
	mov r15, qword [gbl+8*11]
	add r13,r15
	mov qword [rsp+8*142],r10
	mov r10, qword [rsp+8*148]
	mov qword [rsp+8*146],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*141],r12
	mov r12, qword [rsp+8*149]
	mov r12,r10
	add r12,r15
	mov qword [rsp+8*147],r13
	mov r13, qword [rsp+8*150]
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*147]
	mov r13,r14
	add r13,r12
	mov qword [gbl+8*11],r15
	mov r15, qword [rsp+8*151]
	mov qword [rsp+8*148],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [gbl+8*3],r11
	mov r11, qword [gbl+8*11]
	add r15,r11
	mov qword [rsp+8*149],r12
	mov r12, qword [rsp+8*152]
	mov r12,r13
	sub r12,r15
	mov qword [rsp+8*150],r13
	mov r13, qword [rsp+8*153]
	mov qword [rsp+8*147],r14
	mov r14, qword [rsp+8*146]
	mov r13,r14
	sub r13,r12
	mov qword [rsp+8*151],r15
	mov r15, qword [rsp+8*154]
	mov qword [gbl+8*9],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	mov qword [gbl+8*11],r11
	mov r11, qword [gbl+8*9]
	sub r15,r11
	mov qword [rsp+8*152],r12
	mov r12, qword [rsp+8*155]
	mov r12,r15
	mov qword [rsp+8*153],r13
	mov r13, qword [gbl+8*11]
	add r12,r13
	mov qword [rsp+8*146],r14
	mov r14, qword [rsp+8*156]
	mov r14,r11
	add r14,r13
	mov qword [rsp+8*154],r15
	mov r15, qword [rsp+8*157]
	mov r15,r12
	sub r15,r14
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*158]
	mov qword [gbl+8*9],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*155],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*159]
	mov r13,r10
	mov qword [rsp+8*156],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*157],r15
	mov r15, qword [rsp+8*160]
	mov qword [rsp+8*158],r10
	mov r10, qword [rsp+8*157]
	mov r15,r10
	add r15,r13
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*161]
	mov r11,r12
	add r11,r14
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*162]
	mov qword [rsp+8*159],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r12,r14
	mov qword [rsp+8*160],r15
	mov r15, qword [rsp+8*163]
	mov r15,r12
	mov qword [rsp+8*157],r10
	mov r10, qword [gbl+8*11]
	add r15,r10
	mov qword [rsp+8*161],r11
	mov r11, qword [rsp+8*164]
	mov qword [rsp+8*162],r12
	mov r12, qword [rsp+8*161]
	mov r11,r12
	add r11,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*165]
	mov r13,r14
	add r13,r10
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*166]
	mov r14,r11
	sub r14,r13
	mov qword [rsp+8*163],r15
	mov r15, qword [rsp+8*167]
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*160]
	mov r15,r10
	sub r15,r14
	mov qword [rsp+8*164],r11
	mov r11, qword [rsp+8*168]
	mov qword [rsp+8*161],r12
	mov r12, qword [rsp+8*153]
	mov r11,r12
	add r11,r15
	mov qword [rsp+8*165],r13
	mov r13, qword [rsp+8*169]
	mov qword [rsp+8*166],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	mov qword [rsp+8*167],r15
	mov r15, qword [gbl+8*9]
	sub r13,r15
	mov qword [rsp+8*160],r10
	mov r10, qword [rsp+8*170]
	mov r10,r13
	mov qword [rsp+8*168],r11
	mov r11, qword [gbl+8*11]
	add r10,r11
	mov qword [rsp+8*153],r12
	mov r12, qword [rsp+8*171]
	mov r12,r15
	add r12,r11
	mov qword [rsp+8*169],r13
	mov r13, qword [rsp+8*172]
	mov r13,r10
	sub r13,r12
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*173]
	mov qword [gbl+8*9],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	mov qword [rsp+8*170],r10
	mov r10, qword [gbl+8*9]
	sub r14,r10
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*174]
	mov r11,r14
	mov qword [rsp+8*171],r12
	mov r12, qword [gbl+8*11]
	add r11,r12
	mov qword [rsp+8*172],r13
	mov r13, qword [rsp+8*175]
	mov qword [rsp+8*173],r14
	mov r14, qword [rsp+8*172]
	mov r13,r14
	add r13,r11
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*176]
	mov r15,r10
	add r15,r12
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*177]
	mov qword [rsp+8*174],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*175],r13
	mov r13, qword [rsp+8*178]
	mov r13,r10
	mov qword [rsp+8*172],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*176],r15
	mov r15, qword [rsp+8*179]
	mov qword [rsp+8*177],r10
	mov r10, qword [rsp+8*176]
	mov r15,r10
	add r15,r13
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*180]
	mov r11,r12
	add r11,r14
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*181]
	mov r12,r15
	sub r12,r11
	mov qword [rsp+8*178],r13
	mov r13, qword [rsp+8*182]
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*175]
	mov r13,r14
	sub r13,r12
	mov qword [rsp+8*179],r15
	mov r15, qword [rsp+8*183]
	mov qword [rsp+8*176],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	mov qword [rsp+8*180],r11
	mov r11, qword [gbl+8*9]
	sub r15,r11
	mov qword [rsp+8*181],r12
	mov r12, qword [rsp+8*184]
	mov r12,r15
	mov qword [rsp+8*182],r13
	mov r13, qword [gbl+8*11]
	add r12,r13
	mov qword [rsp+8*175],r14
	mov r14, qword [rsp+8*185]
	mov r14,r11
	add r14,r13
	mov qword [rsp+8*183],r15
	mov r15, qword [rsp+8*186]
	mov r15,r12
	sub r15,r14
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*187]
	mov qword [gbl+8*9],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*184],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*188]
	mov r13,r10
	mov qword [rsp+8*185],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*186],r15
	mov r15, qword [rsp+8*189]
	mov qword [rsp+8*187],r10
	mov r10, qword [rsp+8*186]
	mov r15,r10
	add r15,r13
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*190]
	mov r11,r12
	add r11,r14
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*191]
	mov qword [rsp+8*188],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r12,r14
	mov qword [rsp+8*189],r15
	mov r15, qword [rsp+8*192]
	mov r15,r12
	mov qword [rsp+8*186],r10
	mov r10, qword [gbl+8*11]
	add r15,r10
	mov qword [rsp+8*190],r11
	mov r11, qword [rsp+8*193]
	mov qword [rsp+8*191],r12
	mov r12, qword [rsp+8*190]
	mov r11,r12
	add r11,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*194]
	mov r13,r14
	add r13,r10
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*195]
	mov r14,r11
	sub r14,r13
	mov qword [rsp+8*192],r15
	mov r15, qword [rsp+8*196]
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*189]
	mov r15,r10
	sub r15,r14
	mov qword [rsp+8*193],r11
	mov r11, qword [rsp+8*197]
	mov qword [rsp+8*190],r12
	mov r12, qword [rsp+8*182]
	mov r11,r12
	add r11,r15
	mov qword [rsp+8*194],r13
	mov r13, qword [rsp+8*198]
	mov qword [rsp+8*195],r14
	mov r14, qword [rsp+8*168]
	mov r13,r14
	add r13,r11
	mov qword [rsp+8*196],r15
	mov r15, qword [rsp+8*199]
	mov qword [rsp+8*189],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	mov qword [rsp+8*197],r11
	mov r11, qword [gbl+8*9]
	sub r15,r11
	mov qword [rsp+8*182],r12
	mov r12, qword [rsp+8*200]
	mov r12,r15
	mov qword [rsp+8*198],r13
	mov r13, qword [gbl+8*11]
	add r12,r13
	mov qword [rsp+8*168],r14
	mov r14, qword [rsp+8*201]
	mov r14,r11
	add r14,r13
	mov qword [rsp+8*199],r15
	mov r15, qword [rsp+8*202]
	mov r15,r12
	sub r15,r14
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*203]
	mov qword [gbl+8*9],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*200],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*204]
	mov r13,r10
	mov qword [rsp+8*201],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*202],r15
	mov r15, qword [rsp+8*205]
	mov r15,r12
	add r15,r14
	mov qword [rsp+8*203],r10
	mov r10, qword [rsp+8*206]
	mov r10,r13
	sub r10,r15
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*207]
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*202]
	mov r11,r12
	add r11,r10
	mov qword [rsp+8*204],r13
	mov r13, qword [rsp+8*208]
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	mov qword [rsp+8*205],r15
	mov r15, qword [gbl+8*9]
	sub r13,r15
	mov qword [rsp+8*206],r10
	mov r10, qword [rsp+8*209]
	mov r10,r13
	mov qword [rsp+8*207],r11
	mov r11, qword [gbl+8*11]
	add r10,r11
	mov qword [rsp+8*202],r12
	mov r12, qword [rsp+8*210]
	mov r12,r15
	add r12,r11
	mov qword [rsp+8*208],r13
	mov r13, qword [rsp+8*211]
	mov r13,r10
	sub r13,r12
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*212]
	mov qword [gbl+8*9],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	mov qword [rsp+8*209],r10
	mov r10, qword [gbl+8*9]
	sub r14,r10
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*213]
	mov r11,r14
	mov qword [rsp+8*210],r12
	mov r12, qword [gbl+8*11]
	add r11,r12
	mov qword [rsp+8*211],r13
	mov r13, qword [rsp+8*214]
	mov qword [rsp+8*212],r14
	mov r14, qword [rsp+8*211]
	mov r13,r14
	add r13,r11
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*215]
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*207]
	mov r15,r10
	add r15,r13
	mov qword [rsp+8*213],r11
	mov r11, qword [rsp+8*216]
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [rsp+8*214],r13
	mov r13, qword [gbl+8*11]
	add r11,r13
	mov qword [rsp+8*211],r14
	mov r14, qword [rsp+8*217]
	mov qword [rsp+8*215],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	sub r14,r12
	mov qword [rsp+8*207],r10
	mov r10, qword [rsp+8*218]
	mov r10,r14
	add r10,r13
	mov qword [rsp+8*216],r11
	mov r11, qword [rsp+8*219]
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*216]
	mov r11,r12
	add r11,r10
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*220]
	mov qword [rsp+8*217],r14
	mov r14, qword [gbl+8*9]
	mov r13,r14
	mov qword [gbl+8*3],r15
	mov r15, qword [gbl+8*11]
	add r13,r15
	mov qword [rsp+8*218],r10
	mov r10, qword [rsp+8*221]
	mov r10,r11
	sub r10,r13
	mov qword [rsp+8*219],r11
	mov r11, qword [rsp+8*222]
	mov qword [rsp+8*216],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	sub r11,r14
	mov qword [rsp+8*220],r13
	mov r13, qword [rsp+8*223]
	mov r13,r11
	add r13,r15
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*224]
	mov qword [gbl+8*11],r15
	mov r15, qword [gbl+8*9]
	mov r14,r15
	mov qword [rsp+8*221],r10
	mov r10, qword [gbl+8*11]
	add r14,r10
	mov qword [rsp+8*222],r11
	mov r11, qword [rsp+8*225]
	mov r11,r13
	sub r11,r14
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*226]
	mov qword [rsp+8*223],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r15
	mov qword [rsp+8*224],r14
	mov r14, qword [rsp+8*227]
	mov r14,r12
	add r14,r10
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*228]
	mov r15,r11
	add r15,r14
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*229]
	mov qword [rsp+8*225],r11
	mov r11, qword [rsp+8*221]
	mov r10,r11
	add r10,r15
	mov qword [rsp+8*226],r12
	mov r12, qword [rsp+8*230]
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*215]
	mov r12,r13
	sub r12,r10
	mov qword [rsp+8*227],r14
	mov r14, qword [rsp+8*231]
	mov qword [rsp+8*228],r15
	mov r15, qword [gbl+8*9]
	mov r14,r15
	mov qword [rsp+8*229],r10
	mov r10, qword [gbl+8*11]
	add r14,r10
	mov qword [rsp+8*221],r11
	mov r11, qword [rsp+8*232]
	mov qword [rsp+8*230],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	sub r11,r15
	mov qword [rsp+8*215],r13
	mov r13, qword [rsp+8*233]
	mov r13,r11
	add r13,r10
	mov qword [rsp+8*231],r14
	mov r14, qword [rsp+8*234]
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*231]
	mov r14,r15
	add r14,r13
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*235]
	mov qword [rsp+8*232],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [gbl+8*3],r12
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*233],r13
	mov r13, qword [rsp+8*236]
	mov r13,r14
	sub r13,r10
	mov qword [rsp+8*234],r14
	mov r14, qword [rsp+8*237]
	mov qword [rsp+8*231],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	sub r14,r11
	mov qword [rsp+8*235],r10
	mov r10, qword [rsp+8*238]
	mov r10,r14
	add r10,r12
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*239]
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [rsp+8*236],r13
	mov r13, qword [gbl+8*11]
	add r11,r13
	mov qword [rsp+8*237],r14
	mov r14, qword [rsp+8*240]
	mov r14,r10
	sub r14,r11
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*241]
	mov qword [rsp+8*238],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r12
	mov qword [rsp+8*239],r11
	mov r11, qword [rsp+8*242]
	mov r11,r15
	add r11,r13
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*243]
	mov r12,r14
	add r12,r11
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*244]
	mov qword [rsp+8*240],r14
	mov r14, qword [rsp+8*236]
	mov r13,r14
	add r13,r12
	mov qword [rsp+8*241],r15
	mov r15, qword [rsp+8*245]
	mov qword [gbl+8*3],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [rsp+8*242],r11
	mov r11, qword [gbl+8*11]
	add r15,r11
	mov qword [rsp+8*243],r12
	mov r12, qword [rsp+8*246]
	mov qword [rsp+8*244],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r10
	mov qword [rsp+8*236],r14
	mov r14, qword [rsp+8*247]
	mov r14,r12
	add r14,r11
	mov qword [rsp+8*245],r15
	mov r15, qword [rsp+8*248]
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*245]
	mov r15,r10
	add r15,r14
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*249]
	mov qword [rsp+8*246],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [gbl+8*3],r13
	mov r13, qword [gbl+8*11]
	add r11,r13
	mov qword [rsp+8*247],r14
	mov r14, qword [rsp+8*250]
	mov r14,r15
	sub r14,r11
	mov qword [rsp+8*248],r15
	mov r15, qword [rsp+8*251]
	mov qword [rsp+8*245],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r12
	mov qword [rsp+8*249],r11
	mov r11, qword [rsp+8*252]
	mov r11,r15
	add r11,r13
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*253]
	mov qword [gbl+8*11],r13
	mov r13, qword [gbl+8*9]
	mov r12,r13
	mov qword [rsp+8*250],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*251],r15
	mov r15, qword [rsp+8*254]
	mov r15,r11
	sub r15,r12
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*255]
	mov qword [rsp+8*252],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	sub r10,r13
	mov qword [rsp+8*253],r12
	mov r12, qword [rsp+8*256]
	mov r12,r10
	add r12,r14
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*257]
	mov r13,r15
	add r13,r12
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*258]
	mov qword [rsp+8*254],r15
	mov r15, qword [rsp+8*250]
	mov r14,r15
	add r14,r13
	mov qword [rsp+8*255],r10
	mov r10, qword [rsp+8*259]
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*244]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*256],r12
	mov r12, qword [rsp+8*260]
	mov qword [rsp+8*257],r13
	mov r13, qword [rsp+8*230]
	mov r12,r13
	sub r12,r10
	mov qword [rsp+8*258],r14
	mov r14, qword [rsp+8*261]
	mov qword [rsp+8*250],r15
	mov r15, qword [rsp+8*198]
	mov r14,r15
	add r14,r12
	mov qword [rsp+8*259],r10
	mov r10, qword [rsp+8*262]
	mov qword [rsp+8*244],r11
	mov r11, qword [rsp+8*137]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*260],r12
	mov r12, qword [gbl+8*9]
	mov r12,r10
	mov qword [rsp+8*262],r10
	mov qword [rsp+8*137],r11
	mov qword [gbl+8*9],r12
	mov qword [rsp+8*230],r13
	mov qword [rsp+8*261],r14
	mov qword [rsp+8*198],r15
	mov r10, qword [rsp+8*263]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov r13, qword [rsp+8*264]
	mov r13,r10
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov r15, qword [rsp+8*265]
	mov r15,r12
	add r15,r14
	mov qword [rsp+8*264],r13
	mov r13, qword [rsp+8*266]
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*264]
	mov r13,r14
	sub r13,r15
	mov qword [rsp+8*265],r15
	mov r15, qword [rsp+8*267]
	mov r15,r11
	sub r15,r12
	mov qword [rsp+8*263],r10
	mov r10, qword [rsp+8*268]
	mov r10,r15
	mov qword [gbl+8*3],r11
	mov r11, qword [gbl+8*11]
	add r10,r11
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*269]
	mov qword [rsp+8*266],r13
	mov r13, qword [gbl+8*9]
	mov r12,r13
	add r12,r11
	mov qword [rsp+8*264],r14
	mov r14, qword [rsp+8*270]
	mov r14,r10
	sub r14,r12
	mov qword [rsp+8*267],r15
	mov r15, qword [rsp+8*271]
	mov qword [rsp+8*268],r10
	mov r10, qword [rsp+8*266]
	mov r15,r10
	add r15,r14
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*272]
	mov qword [rsp+8*269],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	sub r11,r13
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*273]
	mov r13,r11
	mov qword [rsp+8*270],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*271],r15
	mov r15, qword [rsp+8*274]
	mov qword [rsp+8*266],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	add r15,r14
	mov qword [rsp+8*272],r11
	mov r11, qword [rsp+8*275]
	mov r11,r13
	sub r11,r15
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*276]
	mov qword [rsp+8*273],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r10
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*277]
	mov r14,r12
	mov qword [rsp+8*274],r15
	mov r15, qword [gbl+8*11]
	add r14,r15
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*278]
	mov r10,r11
	add r10,r14
	mov qword [rsp+8*275],r11
	mov r11, qword [rsp+8*279]
	mov qword [rsp+8*276],r12
	mov r12, qword [rsp+8*271]
	mov r11,r12
	add r11,r10
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*280]
	mov qword [rsp+8*277],r14
	mov r14, qword [gbl+8*9]
	mov r13,r14
	add r13,r15
	mov qword [gbl+8*11],r15
	mov r15, qword [rsp+8*281]
	mov qword [rsp+8*278],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r14
	mov qword [rsp+8*279],r11
	mov r11, qword [rsp+8*282]
	mov r11,r15
	mov qword [rsp+8*271],r12
	mov r12, qword [gbl+8*11]
	add r11,r12
	mov qword [rsp+8*280],r13
	mov r13, qword [rsp+8*283]
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*280]
	mov r13,r14
	add r13,r11
	mov qword [rsp+8*281],r15
	mov r15, qword [rsp+8*284]
	mov qword [gbl+8*3],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	add r15,r12
	mov qword [rsp+8*282],r11
	mov r11, qword [rsp+8*285]
	mov r11,r13
	sub r11,r15
	mov qword [gbl+8*11],r12
	mov r12, qword [rsp+8*286]
	mov qword [rsp+8*283],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r10
	mov qword [rsp+8*280],r14
	mov r14, qword [rsp+8*287]
	mov r14,r12
	mov qword [rsp+8*284],r15
	mov r15, qword [gbl+8*11]
	add r14,r15
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*288]
	mov qword [rsp+8*285],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	add r10,r15
	mov qword [rsp+8*286],r12
	mov r12, qword [rsp+8*289]
	mov r12,r14
	sub r12,r10
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*290]
	mov qword [rsp+8*287],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	sub r13,r11
	mov qword [gbl+8*11],r15
	mov r15, qword [rsp+8*291]
	mov r15,r13
	mov qword [rsp+8*288],r10
	mov r10, qword [gbl+8*11]
	add r15,r10
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*292]
	mov r11,r12
	add r11,r15
	mov qword [rsp+8*289],r12
	mov r12, qword [rsp+8*293]
	mov qword [rsp+8*290],r13
	mov r13, qword [rsp+8*285]
	mov r12,r13
	add r12,r11
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*294]
	mov qword [rsp+8*291],r15
	mov r15, qword [rsp+8*279]
	mov r14,r15
	sub r14,r12
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*295]
	mov qword [rsp+8*292],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [rsp+8*293],r12
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*285],r13
	mov r13, qword [rsp+8*296]
	mov qword [rsp+8*294],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	sub r13,r11
	mov qword [rsp+8*279],r15
	mov r15, qword [rsp+8*297]
	mov r15,r13
	add r15,r12
	mov qword [rsp+8*295],r10
	mov r10, qword [rsp+8*298]
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*295]
	mov r10,r11
	add r10,r15
	mov qword [gbl+8*11],r12
	mov r12, qword [rsp+8*299]
	mov qword [rsp+8*296],r13
	mov r13, qword [gbl+8*9]
	mov r12,r13
	mov qword [gbl+8*3],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*297],r15
	mov r15, qword [rsp+8*300]
	mov qword [rsp+8*298],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*295],r11
	mov r11, qword [rsp+8*301]
	mov r11,r15
	add r11,r14
	mov qword [rsp+8*299],r12
	mov r12, qword [rsp+8*302]
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*299]
	mov r12,r13
	add r12,r11
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*303]
	mov qword [rsp+8*300],r15
	mov r15, qword [rsp+8*298]
	mov r14,r15
	sub r14,r12
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*304]
	mov qword [rsp+8*301],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [rsp+8*302],r12
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*299],r13
	mov r13, qword [rsp+8*305]
	mov qword [rsp+8*303],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	sub r13,r11
	mov qword [rsp+8*298],r15
	mov r15, qword [rsp+8*306]
	mov r15,r13
	add r15,r12
	mov qword [rsp+8*304],r10
	mov r10, qword [rsp+8*307]
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*304]
	mov r10,r11
	add r10,r15
	mov qword [gbl+8*11],r12
	mov r12, qword [rsp+8*308]
	mov qword [rsp+8*305],r13
	mov r13, qword [gbl+8*9]
	mov r12,r13
	mov qword [gbl+8*3],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*306],r15
	mov r15, qword [rsp+8*309]
	mov r15,r10
	sub r15,r12
	mov qword [rsp+8*307],r10
	mov r10, qword [rsp+8*310]
	mov qword [rsp+8*304],r11
	mov r11, qword [rsp+8*303]
	mov r10,r11
	sub r10,r15
	mov qword [rsp+8*308],r12
	mov r12, qword [rsp+8*311]
	mov qword [gbl+8*9],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r12,r14
	mov qword [rsp+8*309],r15
	mov r15, qword [rsp+8*312]
	mov r15,r12
	mov qword [rsp+8*310],r10
	mov r10, qword [gbl+8*11]
	add r15,r10
	mov qword [rsp+8*303],r11
	mov r11, qword [rsp+8*313]
	mov r11,r14
	add r11,r10
	mov qword [rsp+8*311],r12
	mov r12, qword [rsp+8*314]
	mov r12,r15
	sub r12,r11
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*315]
	mov qword [gbl+8*9],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	mov qword [rsp+8*312],r15
	mov r15, qword [gbl+8*9]
	sub r13,r15
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*316]
	mov r10,r13
	mov qword [rsp+8*313],r11
	mov r11, qword [gbl+8*11]
	add r10,r11
	mov qword [rsp+8*314],r12
	mov r12, qword [rsp+8*317]
	mov qword [rsp+8*315],r13
	mov r13, qword [rsp+8*314]
	mov r12,r13
	add r12,r10
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*318]
	mov r14,r15
	add r14,r11
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*319]
	mov qword [rsp+8*316],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	mov qword [gbl+8*11],r11
	mov r11, qword [gbl+8*9]
	sub r15,r11
	mov qword [rsp+8*317],r12
	mov r12, qword [rsp+8*320]
	mov r12,r15
	mov qword [rsp+8*314],r13
	mov r13, qword [gbl+8*11]
	add r12,r13
	mov qword [rsp+8*318],r14
	mov r14, qword [rsp+8*321]
	mov qword [rsp+8*319],r15
	mov r15, qword [rsp+8*318]
	mov r14,r15
	add r14,r12
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*322]
	mov r10,r11
	add r10,r13
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*323]
	mov r11,r14
	sub r11,r10
	mov qword [rsp+8*320],r12
	mov r12, qword [rsp+8*324]
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*317]
	mov r12,r13
	sub r12,r11
	mov qword [rsp+8*321],r14
	mov r14, qword [rsp+8*325]
	mov qword [rsp+8*318],r15
	mov r15, qword [rsp+8*310]
	mov r14,r15
	add r14,r12
	mov qword [rsp+8*322],r10
	mov r10, qword [rsp+8*326]
	mov qword [rsp+8*323],r11
	mov r11, qword [rsp+8*294]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*324],r12
	mov r12, qword [rsp+8*327]
	mov qword [rsp+8*317],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	mov qword [rsp+8*325],r14
	mov r14, qword [gbl+8*9]
	sub r12,r14
	mov qword [rsp+8*310],r15
	mov r15, qword [rsp+8*328]
	mov r15,r12
	mov qword [rsp+8*326],r10
	mov r10, qword [gbl+8*11]
	add r15,r10
	mov qword [rsp+8*294],r11
	mov r11, qword [rsp+8*329]
	mov r11,r14
	add r11,r10
	mov qword [rsp+8*327],r12
	mov r12, qword [rsp+8*330]
	mov r12,r15
	sub r12,r11
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*331]
	mov qword [gbl+8*9],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	mov qword [rsp+8*328],r15
	mov r15, qword [gbl+8*9]
	sub r13,r15
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*332]
	mov r10,r13
	mov qword [rsp+8*329],r11
	mov r11, qword [gbl+8*11]
	add r10,r11
	mov qword [rsp+8*330],r12
	mov r12, qword [rsp+8*333]
	mov r12,r15
	add r12,r11
	mov qword [rsp+8*331],r13
	mov r13, qword [rsp+8*334]
	mov r13,r10
	sub r13,r12
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*335]
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*330]
	mov r14,r15
	add r14,r13
	mov qword [rsp+8*332],r10
	mov r10, qword [rsp+8*336]
	mov qword [gbl+8*11],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*333],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*334],r13
	mov r13, qword [rsp+8*337]
	mov r13,r10
	mov qword [rsp+8*335],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*330],r15
	mov r15, qword [rsp+8*338]
	mov r15,r12
	add r15,r14
	mov qword [rsp+8*336],r10
	mov r10, qword [rsp+8*339]
	mov r10,r13
	sub r10,r15
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*340]
	mov qword [gbl+8*9],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	mov qword [rsp+8*337],r13
	mov r13, qword [gbl+8*9]
	sub r11,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*341]
	mov r14,r11
	mov qword [rsp+8*338],r15
	mov r15, qword [gbl+8*11]
	add r14,r15
	mov qword [rsp+8*339],r10
	mov r10, qword [rsp+8*342]
	mov qword [rsp+8*340],r11
	mov r11, qword [rsp+8*339]
	mov r10,r11
	add r10,r14
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*343]
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*335]
	mov r12,r13
	add r12,r10
	mov qword [rsp+8*341],r14
	mov r14, qword [rsp+8*344]
	mov qword [gbl+8*11],r15
	mov r15, qword [gbl+8*9]
	mov r14,r15
	mov qword [rsp+8*342],r10
	mov r10, qword [gbl+8*11]
	add r14,r10
	mov qword [rsp+8*339],r11
	mov r11, qword [rsp+8*345]
	mov qword [rsp+8*343],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	sub r11,r15
	mov qword [rsp+8*335],r13
	mov r13, qword [rsp+8*346]
	mov r13,r11
	add r13,r10
	mov qword [rsp+8*344],r14
	mov r14, qword [rsp+8*347]
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*344]
	mov r14,r15
	add r14,r13
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*348]
	mov qword [rsp+8*345],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [gbl+8*3],r12
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*346],r13
	mov r13, qword [rsp+8*349]
	mov r13,r14
	sub r13,r10
	mov qword [rsp+8*347],r14
	mov r14, qword [rsp+8*350]
	mov qword [rsp+8*344],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	sub r14,r11
	mov qword [rsp+8*348],r10
	mov r10, qword [rsp+8*351]
	mov r10,r14
	add r10,r12
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*352]
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [rsp+8*349],r13
	mov r13, qword [gbl+8*11]
	add r11,r13
	mov qword [rsp+8*350],r14
	mov r14, qword [rsp+8*353]
	mov r14,r10
	sub r14,r11
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*354]
	mov qword [rsp+8*351],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r12
	mov qword [rsp+8*352],r11
	mov r11, qword [rsp+8*355]
	mov r11,r15
	add r11,r13
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*356]
	mov r12,r14
	add r12,r11
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*357]
	mov qword [rsp+8*353],r14
	mov r14, qword [rsp+8*349]
	mov r13,r14
	add r13,r12
	mov qword [rsp+8*354],r15
	mov r15, qword [rsp+8*358]
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*343]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*355],r11
	mov r11, qword [rsp+8*359]
	mov qword [rsp+8*356],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [rsp+8*357],r13
	mov r13, qword [gbl+8*11]
	add r11,r13
	mov qword [rsp+8*349],r14
	mov r14, qword [rsp+8*360]
	mov qword [rsp+8*358],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	sub r14,r12
	mov qword [rsp+8*343],r10
	mov r10, qword [rsp+8*361]
	mov r10,r14
	add r10,r13
	mov qword [rsp+8*359],r11
	mov r11, qword [rsp+8*362]
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*359]
	mov r11,r12
	add r11,r10
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*363]
	mov qword [rsp+8*360],r14
	mov r14, qword [gbl+8*9]
	mov r13,r14
	mov qword [gbl+8*3],r15
	mov r15, qword [gbl+8*11]
	add r13,r15
	mov qword [rsp+8*361],r10
	mov r10, qword [rsp+8*364]
	mov r10,r11
	sub r10,r13
	mov qword [rsp+8*362],r11
	mov r11, qword [rsp+8*365]
	mov qword [rsp+8*359],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	sub r11,r14
	mov qword [rsp+8*363],r13
	mov r13, qword [rsp+8*366]
	mov r13,r11
	add r13,r15
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*367]
	mov qword [gbl+8*11],r15
	mov r15, qword [gbl+8*9]
	mov r14,r15
	mov qword [rsp+8*364],r10
	mov r10, qword [gbl+8*11]
	add r14,r10
	mov qword [rsp+8*365],r11
	mov r11, qword [rsp+8*368]
	mov r11,r13
	sub r11,r14
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*369]
	mov qword [rsp+8*366],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r15
	mov qword [rsp+8*367],r14
	mov r14, qword [rsp+8*370]
	mov r14,r12
	add r14,r10
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*371]
	mov r15,r11
	add r15,r14
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*372]
	mov qword [rsp+8*368],r11
	mov r11, qword [rsp+8*364]
	mov r10,r11
	add r10,r15
	mov qword [rsp+8*369],r12
	mov r12, qword [rsp+8*373]
	mov qword [gbl+8*3],r13
	mov r13, qword [gbl+8*9]
	mov r12,r13
	mov qword [rsp+8*370],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*371],r15
	mov r15, qword [rsp+8*374]
	mov qword [rsp+8*372],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*364],r11
	mov r11, qword [rsp+8*375]
	mov r11,r15
	add r11,r14
	mov qword [rsp+8*373],r12
	mov r12, qword [rsp+8*376]
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*373]
	mov r12,r13
	add r12,r11
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*377]
	mov qword [rsp+8*374],r15
	mov r15, qword [gbl+8*9]
	mov r14,r15
	mov qword [gbl+8*3],r10
	mov r10, qword [gbl+8*11]
	add r14,r10
	mov qword [rsp+8*375],r11
	mov r11, qword [rsp+8*378]
	mov r11,r12
	sub r11,r14
	mov qword [rsp+8*376],r12
	mov r12, qword [rsp+8*379]
	mov qword [rsp+8*373],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r15
	mov qword [rsp+8*377],r14
	mov r14, qword [rsp+8*380]
	mov r14,r12
	add r14,r10
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*381]
	mov qword [gbl+8*11],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [rsp+8*378],r11
	mov r11, qword [gbl+8*11]
	add r15,r11
	mov qword [rsp+8*379],r12
	mov r12, qword [rsp+8*382]
	mov r12,r14
	sub r12,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*383]
	mov qword [rsp+8*380],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	sub r13,r10
	mov qword [rsp+8*381],r15
	mov r15, qword [rsp+8*384]
	mov r15,r13
	add r15,r11
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*385]
	mov r10,r12
	add r10,r15
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*386]
	mov qword [rsp+8*382],r12
	mov r12, qword [rsp+8*378]
	mov r11,r12
	add r11,r10
	mov qword [rsp+8*383],r13
	mov r13, qword [rsp+8*387]
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*372]
	mov r13,r14
	sub r13,r11
	mov qword [rsp+8*384],r15
	mov r15, qword [rsp+8*388]
	mov qword [rsp+8*385],r10
	mov r10, qword [rsp+8*358]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*386],r11
	mov r11, qword [rsp+8*389]
	mov qword [rsp+8*378],r12
	mov r12, qword [rsp+8*326]
	mov r11,r12
	add r11,r15
	mov qword [rsp+8*387],r13
	mov r13, qword [rsp+8*390]
	mov qword [rsp+8*372],r14
	mov r14, qword [gbl+8*9]
	mov r13,r14
	mov qword [rsp+8*388],r15
	mov r15, qword [gbl+8*11]
	add r13,r15
	mov qword [rsp+8*358],r10
	mov r10, qword [rsp+8*391]
	mov qword [rsp+8*389],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*326],r12
	mov r12, qword [rsp+8*392]
	mov r12,r10
	add r12,r15
	mov qword [rsp+8*390],r13
	mov r13, qword [rsp+8*393]
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*390]
	mov r13,r14
	add r13,r12
	mov qword [gbl+8*11],r15
	mov r15, qword [rsp+8*394]
	mov qword [rsp+8*391],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [gbl+8*3],r11
	mov r11, qword [gbl+8*11]
	add r15,r11
	mov qword [rsp+8*392],r12
	mov r12, qword [rsp+8*395]
	mov qword [rsp+8*393],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r10
	mov qword [rsp+8*390],r14
	mov r14, qword [rsp+8*396]
	mov r14,r12
	add r14,r11
	mov qword [rsp+8*394],r15
	mov r15, qword [rsp+8*397]
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*394]
	mov r15,r10
	add r15,r14
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*398]
	mov qword [rsp+8*395],r12
	mov r12, qword [rsp+8*393]
	mov r11,r12
	sub r11,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*399]
	mov qword [rsp+8*396],r14
	mov r14, qword [gbl+8*9]
	mov r13,r14
	mov qword [rsp+8*397],r15
	mov r15, qword [gbl+8*11]
	add r13,r15
	mov qword [rsp+8*394],r10
	mov r10, qword [rsp+8*400]
	mov qword [rsp+8*398],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*393],r12
	mov r12, qword [rsp+8*401]
	mov r12,r10
	add r12,r15
	mov qword [rsp+8*399],r13
	mov r13, qword [rsp+8*402]
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*399]
	mov r13,r14
	add r13,r12
	mov qword [gbl+8*11],r15
	mov r15, qword [rsp+8*403]
	mov qword [rsp+8*400],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [gbl+8*3],r11
	mov r11, qword [gbl+8*11]
	add r15,r11
	mov qword [rsp+8*401],r12
	mov r12, qword [rsp+8*404]
	mov r12,r13
	sub r12,r15
	mov qword [rsp+8*402],r13
	mov r13, qword [rsp+8*405]
	mov qword [rsp+8*399],r14
	mov r14, qword [rsp+8*398]
	mov r13,r14
	sub r13,r12
	mov qword [rsp+8*403],r15
	mov r15, qword [rsp+8*406]
	mov qword [gbl+8*9],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	mov qword [gbl+8*11],r11
	mov r11, qword [gbl+8*9]
	sub r15,r11
	mov qword [rsp+8*404],r12
	mov r12, qword [rsp+8*407]
	mov r12,r15
	mov qword [rsp+8*405],r13
	mov r13, qword [gbl+8*11]
	add r12,r13
	mov qword [rsp+8*398],r14
	mov r14, qword [rsp+8*408]
	mov r14,r11
	add r14,r13
	mov qword [rsp+8*406],r15
	mov r15, qword [rsp+8*409]
	mov r15,r12
	sub r15,r14
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*410]
	mov qword [gbl+8*9],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*407],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*411]
	mov r13,r10
	mov qword [rsp+8*408],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*409],r15
	mov r15, qword [rsp+8*412]
	mov qword [rsp+8*410],r10
	mov r10, qword [rsp+8*409]
	mov r15,r10
	add r15,r13
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*413]
	mov r11,r12
	add r11,r14
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*414]
	mov qword [rsp+8*411],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r12,r14
	mov qword [rsp+8*412],r15
	mov r15, qword [rsp+8*415]
	mov r15,r12
	mov qword [rsp+8*409],r10
	mov r10, qword [gbl+8*11]
	add r15,r10
	mov qword [rsp+8*413],r11
	mov r11, qword [rsp+8*416]
	mov qword [rsp+8*414],r12
	mov r12, qword [rsp+8*413]
	mov r11,r12
	add r11,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*417]
	mov r13,r14
	add r13,r10
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*418]
	mov r14,r11
	sub r14,r13
	mov qword [rsp+8*415],r15
	mov r15, qword [rsp+8*419]
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*412]
	mov r15,r10
	sub r15,r14
	mov qword [rsp+8*416],r11
	mov r11, qword [rsp+8*420]
	mov qword [rsp+8*413],r12
	mov r12, qword [rsp+8*405]
	mov r11,r12
	add r11,r15
	mov qword [rsp+8*417],r13
	mov r13, qword [rsp+8*421]
	mov qword [rsp+8*418],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	mov qword [rsp+8*419],r15
	mov r15, qword [gbl+8*9]
	sub r13,r15
	mov qword [rsp+8*412],r10
	mov r10, qword [rsp+8*422]
	mov r10,r13
	mov qword [rsp+8*420],r11
	mov r11, qword [gbl+8*11]
	add r10,r11
	mov qword [rsp+8*405],r12
	mov r12, qword [rsp+8*423]
	mov r12,r15
	add r12,r11
	mov qword [rsp+8*421],r13
	mov r13, qword [rsp+8*424]
	mov r13,r10
	sub r13,r12
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*425]
	mov qword [gbl+8*9],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	mov qword [rsp+8*422],r10
	mov r10, qword [gbl+8*9]
	sub r14,r10
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*426]
	mov r11,r14
	mov qword [rsp+8*423],r12
	mov r12, qword [gbl+8*11]
	add r11,r12
	mov qword [rsp+8*424],r13
	mov r13, qword [rsp+8*427]
	mov qword [rsp+8*425],r14
	mov r14, qword [rsp+8*424]
	mov r13,r14
	add r13,r11
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*428]
	mov r15,r10
	add r15,r12
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*429]
	mov qword [rsp+8*426],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*427],r13
	mov r13, qword [rsp+8*430]
	mov r13,r10
	mov qword [rsp+8*424],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*428],r15
	mov r15, qword [rsp+8*431]
	mov qword [rsp+8*429],r10
	mov r10, qword [rsp+8*428]
	mov r15,r10
	add r15,r13
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*432]
	mov r11,r12
	add r11,r14
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*433]
	mov r12,r15
	sub r12,r11
	mov qword [rsp+8*430],r13
	mov r13, qword [rsp+8*434]
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*427]
	mov r13,r14
	sub r13,r12
	mov qword [rsp+8*431],r15
	mov r15, qword [rsp+8*435]
	mov qword [rsp+8*428],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	mov qword [rsp+8*432],r11
	mov r11, qword [gbl+8*9]
	sub r15,r11
	mov qword [rsp+8*433],r12
	mov r12, qword [rsp+8*436]
	mov r12,r15
	mov qword [rsp+8*434],r13
	mov r13, qword [gbl+8*11]
	add r12,r13
	mov qword [rsp+8*427],r14
	mov r14, qword [rsp+8*437]
	mov r14,r11
	add r14,r13
	mov qword [rsp+8*435],r15
	mov r15, qword [rsp+8*438]
	mov r15,r12
	sub r15,r14
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*439]
	mov qword [gbl+8*9],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*436],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*440]
	mov r13,r10
	mov qword [rsp+8*437],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*438],r15
	mov r15, qword [rsp+8*441]
	mov qword [rsp+8*439],r10
	mov r10, qword [rsp+8*438]
	mov r15,r10
	add r15,r13
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*442]
	mov r11,r12
	add r11,r14
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*443]
	mov qword [rsp+8*440],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r12,r14
	mov qword [rsp+8*441],r15
	mov r15, qword [rsp+8*444]
	mov r15,r12
	mov qword [rsp+8*438],r10
	mov r10, qword [gbl+8*11]
	add r15,r10
	mov qword [rsp+8*442],r11
	mov r11, qword [rsp+8*445]
	mov qword [rsp+8*443],r12
	mov r12, qword [rsp+8*442]
	mov r11,r12
	add r11,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*446]
	mov r13,r14
	add r13,r10
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*447]
	mov r14,r11
	sub r14,r13
	mov qword [rsp+8*444],r15
	mov r15, qword [rsp+8*448]
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*441]
	mov r15,r10
	sub r15,r14
	mov qword [rsp+8*445],r11
	mov r11, qword [rsp+8*449]
	mov qword [rsp+8*442],r12
	mov r12, qword [rsp+8*434]
	mov r11,r12
	add r11,r15
	mov qword [rsp+8*446],r13
	mov r13, qword [rsp+8*450]
	mov qword [rsp+8*447],r14
	mov r14, qword [rsp+8*420]
	mov r13,r14
	add r13,r11
	mov qword [rsp+8*448],r15
	mov r15, qword [rsp+8*451]
	mov qword [rsp+8*441],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	mov qword [rsp+8*449],r11
	mov r11, qword [gbl+8*9]
	sub r15,r11
	mov qword [rsp+8*434],r12
	mov r12, qword [rsp+8*452]
	mov r12,r15
	mov qword [rsp+8*450],r13
	mov r13, qword [gbl+8*11]
	add r12,r13
	mov qword [rsp+8*420],r14
	mov r14, qword [rsp+8*453]
	mov r14,r11
	add r14,r13
	mov qword [rsp+8*451],r15
	mov r15, qword [rsp+8*454]
	mov r15,r12
	sub r15,r14
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*455]
	mov qword [gbl+8*9],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*452],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*456]
	mov r13,r10
	mov qword [rsp+8*453],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*454],r15
	mov r15, qword [rsp+8*457]
	mov r15,r12
	add r15,r14
	mov qword [rsp+8*455],r10
	mov r10, qword [rsp+8*458]
	mov r10,r13
	sub r10,r15
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*459]
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*454]
	mov r11,r12
	add r11,r10
	mov qword [rsp+8*456],r13
	mov r13, qword [rsp+8*460]
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	mov qword [rsp+8*457],r15
	mov r15, qword [gbl+8*9]
	sub r13,r15
	mov qword [rsp+8*458],r10
	mov r10, qword [rsp+8*461]
	mov r10,r13
	mov qword [rsp+8*459],r11
	mov r11, qword [gbl+8*11]
	add r10,r11
	mov qword [rsp+8*454],r12
	mov r12, qword [rsp+8*462]
	mov r12,r15
	add r12,r11
	mov qword [rsp+8*460],r13
	mov r13, qword [rsp+8*463]
	mov r13,r10
	sub r13,r12
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*464]
	mov qword [gbl+8*9],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	mov qword [rsp+8*461],r10
	mov r10, qword [gbl+8*9]
	sub r14,r10
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*465]
	mov r11,r14
	mov qword [rsp+8*462],r12
	mov r12, qword [gbl+8*11]
	add r11,r12
	mov qword [rsp+8*463],r13
	mov r13, qword [rsp+8*466]
	mov qword [rsp+8*464],r14
	mov r14, qword [rsp+8*463]
	mov r13,r14
	add r13,r11
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*467]
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*459]
	mov r15,r10
	add r15,r13
	mov qword [rsp+8*465],r11
	mov r11, qword [rsp+8*468]
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [rsp+8*466],r13
	mov r13, qword [gbl+8*11]
	add r11,r13
	mov qword [rsp+8*463],r14
	mov r14, qword [rsp+8*469]
	mov qword [rsp+8*467],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	sub r14,r12
	mov qword [rsp+8*459],r10
	mov r10, qword [rsp+8*470]
	mov r10,r14
	add r10,r13
	mov qword [rsp+8*468],r11
	mov r11, qword [rsp+8*471]
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*468]
	mov r11,r12
	add r11,r10
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*472]
	mov qword [rsp+8*469],r14
	mov r14, qword [gbl+8*9]
	mov r13,r14
	mov qword [gbl+8*3],r15
	mov r15, qword [gbl+8*11]
	add r13,r15
	mov qword [rsp+8*470],r10
	mov r10, qword [rsp+8*473]
	mov r10,r11
	sub r10,r13
	mov qword [rsp+8*471],r11
	mov r11, qword [rsp+8*474]
	mov qword [rsp+8*468],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	sub r11,r14
	mov qword [rsp+8*472],r13
	mov r13, qword [rsp+8*475]
	mov r13,r11
	add r13,r15
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*476]
	mov qword [gbl+8*11],r15
	mov r15, qword [gbl+8*9]
	mov r14,r15
	mov qword [rsp+8*473],r10
	mov r10, qword [gbl+8*11]
	add r14,r10
	mov qword [rsp+8*474],r11
	mov r11, qword [rsp+8*477]
	mov r11,r13
	sub r11,r14
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*478]
	mov qword [rsp+8*475],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r15
	mov qword [rsp+8*476],r14
	mov r14, qword [rsp+8*479]
	mov r14,r12
	add r14,r10
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*480]
	mov r15,r11
	add r15,r14
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*481]
	mov qword [rsp+8*477],r11
	mov r11, qword [rsp+8*473]
	mov r10,r11
	add r10,r15
	mov qword [rsp+8*478],r12
	mov r12, qword [rsp+8*482]
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*467]
	mov r12,r13
	sub r12,r10
	mov qword [rsp+8*479],r14
	mov r14, qword [rsp+8*483]
	mov qword [rsp+8*480],r15
	mov r15, qword [gbl+8*9]
	mov r14,r15
	mov qword [rsp+8*481],r10
	mov r10, qword [gbl+8*11]
	add r14,r10
	mov qword [rsp+8*473],r11
	mov r11, qword [rsp+8*484]
	mov qword [rsp+8*482],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	sub r11,r15
	mov qword [rsp+8*467],r13
	mov r13, qword [rsp+8*485]
	mov r13,r11
	add r13,r10
	mov qword [rsp+8*483],r14
	mov r14, qword [rsp+8*486]
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*483]
	mov r14,r15
	add r14,r13
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*487]
	mov qword [rsp+8*484],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [gbl+8*3],r12
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*485],r13
	mov r13, qword [rsp+8*488]
	mov r13,r14
	sub r13,r10
	mov qword [rsp+8*486],r14
	mov r14, qword [rsp+8*489]
	mov qword [rsp+8*483],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	sub r14,r11
	mov qword [rsp+8*487],r10
	mov r10, qword [rsp+8*490]
	mov r10,r14
	add r10,r12
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*491]
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [rsp+8*488],r13
	mov r13, qword [gbl+8*11]
	add r11,r13
	mov qword [rsp+8*489],r14
	mov r14, qword [rsp+8*492]
	mov r14,r10
	sub r14,r11
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*493]
	mov qword [rsp+8*490],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r12
	mov qword [rsp+8*491],r11
	mov r11, qword [rsp+8*494]
	mov r11,r15
	add r11,r13
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*495]
	mov r12,r14
	add r12,r11
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*496]
	mov qword [rsp+8*492],r14
	mov r14, qword [rsp+8*488]
	mov r13,r14
	add r13,r12
	mov qword [rsp+8*493],r15
	mov r15, qword [rsp+8*497]
	mov qword [gbl+8*3],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [rsp+8*494],r11
	mov r11, qword [gbl+8*11]
	add r15,r11
	mov qword [rsp+8*495],r12
	mov r12, qword [rsp+8*498]
	mov qword [rsp+8*496],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r10
	mov qword [rsp+8*488],r14
	mov r14, qword [rsp+8*499]
	mov r14,r12
	add r14,r11
	mov qword [rsp+8*497],r15
	mov r15, qword [rsp+8*500]
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*497]
	mov r15,r10
	add r15,r14
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*501]
	mov qword [rsp+8*498],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [gbl+8*3],r13
	mov r13, qword [gbl+8*11]
	add r11,r13
	mov qword [rsp+8*499],r14
	mov r14, qword [rsp+8*502]
	mov r14,r15
	sub r14,r11
	mov qword [rsp+8*500],r15
	mov r15, qword [rsp+8*503]
	mov qword [rsp+8*497],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r12
	mov qword [rsp+8*501],r11
	mov r11, qword [rsp+8*504]
	mov r11,r15
	add r11,r13
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*505]
	mov qword [gbl+8*11],r13
	mov r13, qword [gbl+8*9]
	mov r12,r13
	mov qword [rsp+8*502],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*503],r15
	mov r15, qword [rsp+8*506]
	mov r15,r11
	sub r15,r12
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*507]
	mov qword [rsp+8*504],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	sub r10,r13
	mov qword [rsp+8*505],r12
	mov r12, qword [rsp+8*508]
	mov r12,r10
	add r12,r14
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*509]
	mov r13,r15
	add r13,r12
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*510]
	mov qword [rsp+8*506],r15
	mov r15, qword [rsp+8*502]
	mov r14,r15
	add r14,r13
	mov qword [rsp+8*507],r10
	mov r10, qword [rsp+8*511]
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*496]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*508],r12
	mov r12, qword [rsp+8*512]
	mov qword [rsp+8*509],r13
	mov r13, qword [rsp+8*482]
	mov r12,r13
	sub r12,r10
	mov qword [rsp+8*510],r14
	mov r14, qword [rsp+8*513]
	mov qword [rsp+8*502],r15
	mov r15, qword [rsp+8*450]
	mov r14,r15
	add r14,r12
	mov qword [rsp+8*511],r10
	mov r10, qword [rsp+8*514]
	mov qword [rsp+8*496],r11
	mov r11, qword [rsp+8*389]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*512],r12
	mov r12, qword [gbl+8*11]
	mov r12,r10
	mov qword [rsp+8*514],r10
	mov qword [rsp+8*389],r11
	mov qword [gbl+8*11],r12
	mov qword [rsp+8*482],r13
	mov qword [rsp+8*513],r14
	mov qword [rsp+8*450],r15
	mov r10, qword [rsp+8*515]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov r13, qword [rsp+8*516]
	mov r13,r10
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov r15, qword [rsp+8*517]
	mov r15,r12
	add r15,r14
	mov qword [rsp+8*516],r13
	mov r13, qword [rsp+8*518]
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*516]
	mov r13,r14
	sub r13,r15
	mov qword [rsp+8*517],r15
	mov r15, qword [rsp+8*519]
	mov r15,r11
	sub r15,r12
	mov qword [rsp+8*515],r10
	mov r10, qword [rsp+8*520]
	mov r10,r15
	mov qword [gbl+8*3],r11
	mov r11, qword [gbl+8*11]
	add r10,r11
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*521]
	mov qword [rsp+8*518],r13
	mov r13, qword [gbl+8*9]
	mov r12,r13
	add r12,r11
	mov qword [rsp+8*516],r14
	mov r14, qword [rsp+8*522]
	mov r14,r10
	sub r14,r12
	mov qword [rsp+8*519],r15
	mov r15, qword [rsp+8*523]
	mov qword [rsp+8*520],r10
	mov r10, qword [rsp+8*518]
	mov r15,r10
	add r15,r14
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*524]
	mov qword [rsp+8*521],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	sub r11,r13
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*525]
	mov r13,r11
	mov qword [rsp+8*522],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*523],r15
	mov r15, qword [rsp+8*526]
	mov qword [rsp+8*518],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	add r15,r14
	mov qword [rsp+8*524],r11
	mov r11, qword [rsp+8*527]
	mov r11,r13
	sub r11,r15
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*528]
	mov qword [rsp+8*525],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r10
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*529]
	mov r14,r12
	mov qword [rsp+8*526],r15
	mov r15, qword [gbl+8*11]
	add r14,r15
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*530]
	mov r10,r11
	add r10,r14
	mov qword [rsp+8*527],r11
	mov r11, qword [rsp+8*531]
	mov qword [rsp+8*528],r12
	mov r12, qword [rsp+8*523]
	mov r11,r12
	add r11,r10
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*532]
	mov qword [rsp+8*529],r14
	mov r14, qword [gbl+8*9]
	mov r13,r14
	add r13,r15
	mov qword [gbl+8*11],r15
	mov r15, qword [rsp+8*533]
	mov qword [rsp+8*530],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r14
	mov qword [rsp+8*531],r11
	mov r11, qword [rsp+8*534]
	mov r11,r15
	mov qword [rsp+8*523],r12
	mov r12, qword [gbl+8*11]
	add r11,r12
	mov qword [rsp+8*532],r13
	mov r13, qword [rsp+8*535]
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*532]
	mov r13,r14
	add r13,r11
	mov qword [rsp+8*533],r15
	mov r15, qword [rsp+8*536]
	mov qword [gbl+8*3],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	add r15,r12
	mov qword [rsp+8*534],r11
	mov r11, qword [rsp+8*537]
	mov r11,r13
	sub r11,r15
	mov qword [gbl+8*11],r12
	mov r12, qword [rsp+8*538]
	mov qword [rsp+8*535],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r10
	mov qword [rsp+8*532],r14
	mov r14, qword [rsp+8*539]
	mov r14,r12
	mov qword [rsp+8*536],r15
	mov r15, qword [gbl+8*11]
	add r14,r15
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*540]
	mov qword [rsp+8*537],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	add r10,r15
	mov qword [rsp+8*538],r12
	mov r12, qword [rsp+8*541]
	mov r12,r14
	sub r12,r10
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*542]
	mov qword [rsp+8*539],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	sub r13,r11
	mov qword [gbl+8*11],r15
	mov r15, qword [rsp+8*543]
	mov r15,r13
	mov qword [rsp+8*540],r10
	mov r10, qword [gbl+8*11]
	add r15,r10
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*544]
	mov r11,r12
	add r11,r15
	mov qword [rsp+8*541],r12
	mov r12, qword [rsp+8*545]
	mov qword [rsp+8*542],r13
	mov r13, qword [rsp+8*537]
	mov r12,r13
	add r12,r11
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*546]
	mov qword [rsp+8*543],r15
	mov r15, qword [rsp+8*531]
	mov r14,r15
	sub r14,r12
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*547]
	mov qword [rsp+8*544],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [rsp+8*545],r12
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*537],r13
	mov r13, qword [rsp+8*548]
	mov qword [rsp+8*546],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	sub r13,r11
	mov qword [rsp+8*531],r15
	mov r15, qword [rsp+8*549]
	mov r15,r13
	add r15,r12
	mov qword [rsp+8*547],r10
	mov r10, qword [rsp+8*550]
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*547]
	mov r10,r11
	add r10,r15
	mov qword [gbl+8*11],r12
	mov r12, qword [rsp+8*551]
	mov qword [rsp+8*548],r13
	mov r13, qword [gbl+8*9]
	mov r12,r13
	mov qword [gbl+8*3],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*549],r15
	mov r15, qword [rsp+8*552]
	mov qword [rsp+8*550],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*547],r11
	mov r11, qword [rsp+8*553]
	mov r11,r15
	add r11,r14
	mov qword [rsp+8*551],r12
	mov r12, qword [rsp+8*554]
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*551]
	mov r12,r13
	add r12,r11
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*555]
	mov qword [rsp+8*552],r15
	mov r15, qword [rsp+8*550]
	mov r14,r15
	sub r14,r12
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*556]
	mov qword [rsp+8*553],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [rsp+8*554],r12
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*551],r13
	mov r13, qword [rsp+8*557]
	mov qword [rsp+8*555],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	sub r13,r11
	mov qword [rsp+8*550],r15
	mov r15, qword [rsp+8*558]
	mov r15,r13
	add r15,r12
	mov qword [rsp+8*556],r10
	mov r10, qword [rsp+8*559]
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*556]
	mov r10,r11
	add r10,r15
	mov qword [gbl+8*11],r12
	mov r12, qword [rsp+8*560]
	mov qword [rsp+8*557],r13
	mov r13, qword [gbl+8*9]
	mov r12,r13
	mov qword [gbl+8*3],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*558],r15
	mov r15, qword [rsp+8*561]
	mov r15,r10
	sub r15,r12
	mov qword [rsp+8*559],r10
	mov r10, qword [rsp+8*562]
	mov qword [rsp+8*556],r11
	mov r11, qword [rsp+8*555]
	mov r10,r11
	sub r10,r15
	mov qword [rsp+8*560],r12
	mov r12, qword [rsp+8*563]
	mov qword [gbl+8*9],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r12,r14
	mov qword [rsp+8*561],r15
	mov r15, qword [rsp+8*564]
	mov r15,r12
	mov qword [rsp+8*562],r10
	mov r10, qword [gbl+8*11]
	add r15,r10
	mov qword [rsp+8*555],r11
	mov r11, qword [rsp+8*565]
	mov r11,r14
	add r11,r10
	mov qword [rsp+8*563],r12
	mov r12, qword [rsp+8*566]
	mov r12,r15
	sub r12,r11
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*567]
	mov qword [gbl+8*9],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	mov qword [rsp+8*564],r15
	mov r15, qword [gbl+8*9]
	sub r13,r15
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*568]
	mov r10,r13
	mov qword [rsp+8*565],r11
	mov r11, qword [gbl+8*11]
	add r10,r11
	mov qword [rsp+8*566],r12
	mov r12, qword [rsp+8*569]
	mov qword [rsp+8*567],r13
	mov r13, qword [rsp+8*566]
	mov r12,r13
	add r12,r10
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*570]
	mov r14,r15
	add r14,r11
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*571]
	mov qword [rsp+8*568],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	mov qword [gbl+8*11],r11
	mov r11, qword [gbl+8*9]
	sub r15,r11
	mov qword [rsp+8*569],r12
	mov r12, qword [rsp+8*572]
	mov r12,r15
	mov qword [rsp+8*566],r13
	mov r13, qword [gbl+8*11]
	add r12,r13
	mov qword [rsp+8*570],r14
	mov r14, qword [rsp+8*573]
	mov qword [rsp+8*571],r15
	mov r15, qword [rsp+8*570]
	mov r14,r15
	add r14,r12
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*574]
	mov r10,r11
	add r10,r13
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*575]
	mov r11,r14
	sub r11,r10
	mov qword [rsp+8*572],r12
	mov r12, qword [rsp+8*576]
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*569]
	mov r12,r13
	sub r12,r11
	mov qword [rsp+8*573],r14
	mov r14, qword [rsp+8*577]
	mov qword [rsp+8*570],r15
	mov r15, qword [rsp+8*562]
	mov r14,r15
	add r14,r12
	mov qword [rsp+8*574],r10
	mov r10, qword [rsp+8*578]
	mov qword [rsp+8*575],r11
	mov r11, qword [rsp+8*546]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*576],r12
	mov r12, qword [rsp+8*579]
	mov qword [rsp+8*569],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	mov qword [rsp+8*577],r14
	mov r14, qword [gbl+8*9]
	sub r12,r14
	mov qword [rsp+8*562],r15
	mov r15, qword [rsp+8*580]
	mov r15,r12
	mov qword [rsp+8*578],r10
	mov r10, qword [gbl+8*11]
	add r15,r10
	mov qword [rsp+8*546],r11
	mov r11, qword [rsp+8*581]
	mov r11,r14
	add r11,r10
	mov qword [rsp+8*579],r12
	mov r12, qword [rsp+8*582]
	mov r12,r15
	sub r12,r11
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*583]
	mov qword [gbl+8*9],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	mov qword [rsp+8*580],r15
	mov r15, qword [gbl+8*9]
	sub r13,r15
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*584]
	mov r10,r13
	mov qword [rsp+8*581],r11
	mov r11, qword [gbl+8*11]
	add r10,r11
	mov qword [rsp+8*582],r12
	mov r12, qword [rsp+8*585]
	mov r12,r15
	add r12,r11
	mov qword [rsp+8*583],r13
	mov r13, qword [rsp+8*586]
	mov r13,r10
	sub r13,r12
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*587]
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*582]
	mov r14,r15
	add r14,r13
	mov qword [rsp+8*584],r10
	mov r10, qword [rsp+8*588]
	mov qword [gbl+8*11],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*585],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*586],r13
	mov r13, qword [rsp+8*589]
	mov r13,r10
	mov qword [rsp+8*587],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*582],r15
	mov r15, qword [rsp+8*590]
	mov r15,r12
	add r15,r14
	mov qword [rsp+8*588],r10
	mov r10, qword [rsp+8*591]
	mov r10,r13
	sub r10,r15
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*592]
	mov qword [gbl+8*9],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	mov qword [rsp+8*589],r13
	mov r13, qword [gbl+8*9]
	sub r11,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*593]
	mov r14,r11
	mov qword [rsp+8*590],r15
	mov r15, qword [gbl+8*11]
	add r14,r15
	mov qword [rsp+8*591],r10
	mov r10, qword [rsp+8*594]
	mov qword [rsp+8*592],r11
	mov r11, qword [rsp+8*591]
	mov r10,r11
	add r10,r14
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*595]
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*587]
	mov r12,r13
	add r12,r10
	mov qword [rsp+8*593],r14
	mov r14, qword [rsp+8*596]
	mov qword [gbl+8*11],r15
	mov r15, qword [gbl+8*9]
	mov r14,r15
	mov qword [rsp+8*594],r10
	mov r10, qword [gbl+8*11]
	add r14,r10
	mov qword [rsp+8*591],r11
	mov r11, qword [rsp+8*597]
	mov qword [rsp+8*595],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	sub r11,r15
	mov qword [rsp+8*587],r13
	mov r13, qword [rsp+8*598]
	mov r13,r11
	add r13,r10
	mov qword [rsp+8*596],r14
	mov r14, qword [rsp+8*599]
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*596]
	mov r14,r15
	add r14,r13
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*600]
	mov qword [rsp+8*597],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [gbl+8*3],r12
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*598],r13
	mov r13, qword [rsp+8*601]
	mov r13,r14
	sub r13,r10
	mov qword [rsp+8*599],r14
	mov r14, qword [rsp+8*602]
	mov qword [rsp+8*596],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	sub r14,r11
	mov qword [rsp+8*600],r10
	mov r10, qword [rsp+8*603]
	mov r10,r14
	add r10,r12
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*604]
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [rsp+8*601],r13
	mov r13, qword [gbl+8*11]
	add r11,r13
	mov qword [rsp+8*602],r14
	mov r14, qword [rsp+8*605]
	mov r14,r10
	sub r14,r11
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*606]
	mov qword [rsp+8*603],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r12
	mov qword [rsp+8*604],r11
	mov r11, qword [rsp+8*607]
	mov r11,r15
	add r11,r13
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*608]
	mov r12,r14
	add r12,r11
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*609]
	mov qword [rsp+8*605],r14
	mov r14, qword [rsp+8*601]
	mov r13,r14
	add r13,r12
	mov qword [rsp+8*606],r15
	mov r15, qword [rsp+8*610]
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*595]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*607],r11
	mov r11, qword [rsp+8*611]
	mov qword [rsp+8*608],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [rsp+8*609],r13
	mov r13, qword [gbl+8*11]
	add r11,r13
	mov qword [rsp+8*601],r14
	mov r14, qword [rsp+8*612]
	mov qword [rsp+8*610],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	sub r14,r12
	mov qword [rsp+8*595],r10
	mov r10, qword [rsp+8*613]
	mov r10,r14
	add r10,r13
	mov qword [rsp+8*611],r11
	mov r11, qword [rsp+8*614]
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*611]
	mov r11,r12
	add r11,r10
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*615]
	mov qword [rsp+8*612],r14
	mov r14, qword [gbl+8*9]
	mov r13,r14
	mov qword [gbl+8*3],r15
	mov r15, qword [gbl+8*11]
	add r13,r15
	mov qword [rsp+8*613],r10
	mov r10, qword [rsp+8*616]
	mov r10,r11
	sub r10,r13
	mov qword [rsp+8*614],r11
	mov r11, qword [rsp+8*617]
	mov qword [rsp+8*611],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	sub r11,r14
	mov qword [rsp+8*615],r13
	mov r13, qword [rsp+8*618]
	mov r13,r11
	add r13,r15
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*619]
	mov qword [gbl+8*11],r15
	mov r15, qword [gbl+8*9]
	mov r14,r15
	mov qword [rsp+8*616],r10
	mov r10, qword [gbl+8*11]
	add r14,r10
	mov qword [rsp+8*617],r11
	mov r11, qword [rsp+8*620]
	mov r11,r13
	sub r11,r14
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*621]
	mov qword [rsp+8*618],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r15
	mov qword [rsp+8*619],r14
	mov r14, qword [rsp+8*622]
	mov r14,r12
	add r14,r10
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*623]
	mov r15,r11
	add r15,r14
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*624]
	mov qword [rsp+8*620],r11
	mov r11, qword [rsp+8*616]
	mov r10,r11
	add r10,r15
	mov qword [rsp+8*621],r12
	mov r12, qword [rsp+8*625]
	mov qword [gbl+8*3],r13
	mov r13, qword [gbl+8*9]
	mov r12,r13
	mov qword [rsp+8*622],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*623],r15
	mov r15, qword [rsp+8*626]
	mov qword [rsp+8*624],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*616],r11
	mov r11, qword [rsp+8*627]
	mov r11,r15
	add r11,r14
	mov qword [rsp+8*625],r12
	mov r12, qword [rsp+8*628]
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*625]
	mov r12,r13
	add r12,r11
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*629]
	mov qword [rsp+8*626],r15
	mov r15, qword [gbl+8*9]
	mov r14,r15
	mov qword [gbl+8*3],r10
	mov r10, qword [gbl+8*11]
	add r14,r10
	mov qword [rsp+8*627],r11
	mov r11, qword [rsp+8*630]
	mov r11,r12
	sub r11,r14
	mov qword [rsp+8*628],r12
	mov r12, qword [rsp+8*631]
	mov qword [rsp+8*625],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r15
	mov qword [rsp+8*629],r14
	mov r14, qword [rsp+8*632]
	mov r14,r12
	add r14,r10
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*633]
	mov qword [gbl+8*11],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [rsp+8*630],r11
	mov r11, qword [gbl+8*11]
	add r15,r11
	mov qword [rsp+8*631],r12
	mov r12, qword [rsp+8*634]
	mov r12,r14
	sub r12,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*635]
	mov qword [rsp+8*632],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	sub r13,r10
	mov qword [rsp+8*633],r15
	mov r15, qword [rsp+8*636]
	mov r15,r13
	add r15,r11
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*637]
	mov r10,r12
	add r10,r15
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*638]
	mov qword [rsp+8*634],r12
	mov r12, qword [rsp+8*630]
	mov r11,r12
	add r11,r10
	mov qword [rsp+8*635],r13
	mov r13, qword [rsp+8*639]
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*624]
	mov r13,r14
	sub r13,r11
	mov qword [rsp+8*636],r15
	mov r15, qword [rsp+8*640]
	mov qword [rsp+8*637],r10
	mov r10, qword [rsp+8*610]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*638],r11
	mov r11, qword [rsp+8*641]
	mov qword [rsp+8*630],r12
	mov r12, qword [rsp+8*578]
	mov r11,r12
	add r11,r15
	mov qword [rsp+8*639],r13
	mov r13, qword [rsp+8*642]
	mov qword [rsp+8*624],r14
	mov r14, qword [gbl+8*9]
	mov r13,r14
	mov qword [rsp+8*640],r15
	mov r15, qword [gbl+8*11]
	add r13,r15
	mov qword [rsp+8*610],r10
	mov r10, qword [rsp+8*643]
	mov qword [rsp+8*641],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*578],r12
	mov r12, qword [rsp+8*644]
	mov r12,r10
	add r12,r15
	mov qword [rsp+8*642],r13
	mov r13, qword [rsp+8*645]
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*642]
	mov r13,r14
	add r13,r12
	mov qword [gbl+8*11],r15
	mov r15, qword [rsp+8*646]
	mov qword [rsp+8*643],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [gbl+8*3],r11
	mov r11, qword [gbl+8*11]
	add r15,r11
	mov qword [rsp+8*644],r12
	mov r12, qword [rsp+8*647]
	mov qword [rsp+8*645],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r10
	mov qword [rsp+8*642],r14
	mov r14, qword [rsp+8*648]
	mov r14,r12
	add r14,r11
	mov qword [rsp+8*646],r15
	mov r15, qword [rsp+8*649]
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*646]
	mov r15,r10
	add r15,r14
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*650]
	mov qword [rsp+8*647],r12
	mov r12, qword [rsp+8*645]
	mov r11,r12
	sub r11,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*651]
	mov qword [rsp+8*648],r14
	mov r14, qword [gbl+8*9]
	mov r13,r14
	mov qword [rsp+8*649],r15
	mov r15, qword [gbl+8*11]
	add r13,r15
	mov qword [rsp+8*646],r10
	mov r10, qword [rsp+8*652]
	mov qword [rsp+8*650],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*645],r12
	mov r12, qword [rsp+8*653]
	mov r12,r10
	add r12,r15
	mov qword [rsp+8*651],r13
	mov r13, qword [rsp+8*654]
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*651]
	mov r13,r14
	add r13,r12
	mov qword [gbl+8*11],r15
	mov r15, qword [rsp+8*655]
	mov qword [rsp+8*652],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [gbl+8*3],r11
	mov r11, qword [gbl+8*11]
	add r15,r11
	mov qword [rsp+8*653],r12
	mov r12, qword [rsp+8*656]
	mov r12,r13
	sub r12,r15
	mov qword [rsp+8*654],r13
	mov r13, qword [rsp+8*657]
	mov qword [rsp+8*651],r14
	mov r14, qword [rsp+8*650]
	mov r13,r14
	sub r13,r12
	mov qword [rsp+8*655],r15
	mov r15, qword [rsp+8*658]
	mov qword [gbl+8*9],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	mov qword [gbl+8*11],r11
	mov r11, qword [gbl+8*9]
	sub r15,r11
	mov qword [rsp+8*656],r12
	mov r12, qword [rsp+8*659]
	mov r12,r15
	mov qword [rsp+8*657],r13
	mov r13, qword [gbl+8*11]
	add r12,r13
	mov qword [rsp+8*650],r14
	mov r14, qword [rsp+8*660]
	mov r14,r11
	add r14,r13
	mov qword [rsp+8*658],r15
	mov r15, qword [rsp+8*661]
	mov r15,r12
	sub r15,r14
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*662]
	mov qword [gbl+8*9],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*659],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*663]
	mov r13,r10
	mov qword [rsp+8*660],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*661],r15
	mov r15, qword [rsp+8*664]
	mov qword [rsp+8*662],r10
	mov r10, qword [rsp+8*661]
	mov r15,r10
	add r15,r13
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*665]
	mov r11,r12
	add r11,r14
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*666]
	mov qword [rsp+8*663],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r12,r14
	mov qword [rsp+8*664],r15
	mov r15, qword [rsp+8*667]
	mov r15,r12
	mov qword [rsp+8*661],r10
	mov r10, qword [gbl+8*11]
	add r15,r10
	mov qword [rsp+8*665],r11
	mov r11, qword [rsp+8*668]
	mov qword [rsp+8*666],r12
	mov r12, qword [rsp+8*665]
	mov r11,r12
	add r11,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*669]
	mov r13,r14
	add r13,r10
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*670]
	mov r14,r11
	sub r14,r13
	mov qword [rsp+8*667],r15
	mov r15, qword [rsp+8*671]
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*664]
	mov r15,r10
	sub r15,r14
	mov qword [rsp+8*668],r11
	mov r11, qword [rsp+8*672]
	mov qword [rsp+8*665],r12
	mov r12, qword [rsp+8*657]
	mov r11,r12
	add r11,r15
	mov qword [rsp+8*669],r13
	mov r13, qword [rsp+8*673]
	mov qword [rsp+8*670],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	mov qword [rsp+8*671],r15
	mov r15, qword [gbl+8*9]
	sub r13,r15
	mov qword [rsp+8*664],r10
	mov r10, qword [rsp+8*674]
	mov r10,r13
	mov qword [rsp+8*672],r11
	mov r11, qword [gbl+8*11]
	add r10,r11
	mov qword [rsp+8*657],r12
	mov r12, qword [rsp+8*675]
	mov r12,r15
	add r12,r11
	mov qword [rsp+8*673],r13
	mov r13, qword [rsp+8*676]
	mov r13,r10
	sub r13,r12
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*677]
	mov qword [gbl+8*9],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	mov qword [rsp+8*674],r10
	mov r10, qword [gbl+8*9]
	sub r14,r10
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*678]
	mov r11,r14
	mov qword [rsp+8*675],r12
	mov r12, qword [gbl+8*11]
	add r11,r12
	mov qword [rsp+8*676],r13
	mov r13, qword [rsp+8*679]
	mov qword [rsp+8*677],r14
	mov r14, qword [rsp+8*676]
	mov r13,r14
	add r13,r11
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*680]
	mov r15,r10
	add r15,r12
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*681]
	mov qword [rsp+8*678],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*679],r13
	mov r13, qword [rsp+8*682]
	mov r13,r10
	mov qword [rsp+8*676],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*680],r15
	mov r15, qword [rsp+8*683]
	mov qword [rsp+8*681],r10
	mov r10, qword [rsp+8*680]
	mov r15,r10
	add r15,r13
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*684]
	mov r11,r12
	add r11,r14
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*685]
	mov r12,r15
	sub r12,r11
	mov qword [rsp+8*682],r13
	mov r13, qword [rsp+8*686]
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*679]
	mov r13,r14
	sub r13,r12
	mov qword [rsp+8*683],r15
	mov r15, qword [rsp+8*687]
	mov qword [rsp+8*680],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	mov qword [rsp+8*684],r11
	mov r11, qword [gbl+8*9]
	sub r15,r11
	mov qword [rsp+8*685],r12
	mov r12, qword [rsp+8*688]
	mov r12,r15
	mov qword [rsp+8*686],r13
	mov r13, qword [gbl+8*11]
	add r12,r13
	mov qword [rsp+8*679],r14
	mov r14, qword [rsp+8*689]
	mov r14,r11
	add r14,r13
	mov qword [rsp+8*687],r15
	mov r15, qword [rsp+8*690]
	mov r15,r12
	sub r15,r14
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*691]
	mov qword [gbl+8*9],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*688],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*692]
	mov r13,r10
	mov qword [rsp+8*689],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*690],r15
	mov r15, qword [rsp+8*693]
	mov qword [rsp+8*691],r10
	mov r10, qword [rsp+8*690]
	mov r15,r10
	add r15,r13
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*694]
	mov r11,r12
	add r11,r14
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*695]
	mov qword [rsp+8*692],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r12,r14
	mov qword [rsp+8*693],r15
	mov r15, qword [rsp+8*696]
	mov r15,r12
	mov qword [rsp+8*690],r10
	mov r10, qword [gbl+8*11]
	add r15,r10
	mov qword [rsp+8*694],r11
	mov r11, qword [rsp+8*697]
	mov qword [rsp+8*695],r12
	mov r12, qword [rsp+8*694]
	mov r11,r12
	add r11,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*698]
	mov r13,r14
	add r13,r10
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*699]
	mov r14,r11
	sub r14,r13
	mov qword [rsp+8*696],r15
	mov r15, qword [rsp+8*700]
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*693]
	mov r15,r10
	sub r15,r14
	mov qword [rsp+8*697],r11
	mov r11, qword [rsp+8*701]
	mov qword [rsp+8*694],r12
	mov r12, qword [rsp+8*686]
	mov r11,r12
	add r11,r15
	mov qword [rsp+8*698],r13
	mov r13, qword [rsp+8*702]
	mov qword [rsp+8*699],r14
	mov r14, qword [rsp+8*672]
	mov r13,r14
	add r13,r11
	mov qword [rsp+8*700],r15
	mov r15, qword [rsp+8*703]
	mov qword [rsp+8*693],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	mov qword [rsp+8*701],r11
	mov r11, qword [gbl+8*9]
	sub r15,r11
	mov qword [rsp+8*686],r12
	mov r12, qword [rsp+8*704]
	mov r12,r15
	mov qword [rsp+8*702],r13
	mov r13, qword [gbl+8*11]
	add r12,r13
	mov qword [rsp+8*672],r14
	mov r14, qword [rsp+8*705]
	mov r14,r11
	add r14,r13
	mov qword [rsp+8*703],r15
	mov r15, qword [rsp+8*706]
	mov r15,r12
	sub r15,r14
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*707]
	mov qword [gbl+8*9],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*704],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*708]
	mov r13,r10
	mov qword [rsp+8*705],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*706],r15
	mov r15, qword [rsp+8*709]
	mov r15,r12
	add r15,r14
	mov qword [rsp+8*707],r10
	mov r10, qword [rsp+8*710]
	mov r10,r13
	sub r10,r15
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*711]
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*706]
	mov r11,r12
	add r11,r10
	mov qword [rsp+8*708],r13
	mov r13, qword [rsp+8*712]
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*3]
	mov r13,r14
	mov qword [rsp+8*709],r15
	mov r15, qword [gbl+8*9]
	sub r13,r15
	mov qword [rsp+8*710],r10
	mov r10, qword [rsp+8*713]
	mov r10,r13
	mov qword [rsp+8*711],r11
	mov r11, qword [gbl+8*11]
	add r10,r11
	mov qword [rsp+8*706],r12
	mov r12, qword [rsp+8*714]
	mov r12,r15
	add r12,r11
	mov qword [rsp+8*712],r13
	mov r13, qword [rsp+8*715]
	mov r13,r10
	sub r13,r12
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*716]
	mov qword [gbl+8*9],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	mov qword [rsp+8*713],r10
	mov r10, qword [gbl+8*9]
	sub r14,r10
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*717]
	mov r11,r14
	mov qword [rsp+8*714],r12
	mov r12, qword [gbl+8*11]
	add r11,r12
	mov qword [rsp+8*715],r13
	mov r13, qword [rsp+8*718]
	mov qword [rsp+8*716],r14
	mov r14, qword [rsp+8*715]
	mov r13,r14
	add r13,r11
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*719]
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*711]
	mov r15,r10
	add r15,r13
	mov qword [rsp+8*717],r11
	mov r11, qword [rsp+8*720]
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [rsp+8*718],r13
	mov r13, qword [gbl+8*11]
	add r11,r13
	mov qword [rsp+8*715],r14
	mov r14, qword [rsp+8*721]
	mov qword [rsp+8*719],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	sub r14,r12
	mov qword [rsp+8*711],r10
	mov r10, qword [rsp+8*722]
	mov r10,r14
	add r10,r13
	mov qword [rsp+8*720],r11
	mov r11, qword [rsp+8*723]
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*720]
	mov r11,r12
	add r11,r10
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*724]
	mov qword [rsp+8*721],r14
	mov r14, qword [gbl+8*9]
	mov r13,r14
	mov qword [gbl+8*3],r15
	mov r15, qword [gbl+8*11]
	add r13,r15
	mov qword [rsp+8*722],r10
	mov r10, qword [rsp+8*725]
	mov r10,r11
	sub r10,r13
	mov qword [rsp+8*723],r11
	mov r11, qword [rsp+8*726]
	mov qword [rsp+8*720],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	sub r11,r14
	mov qword [rsp+8*724],r13
	mov r13, qword [rsp+8*727]
	mov r13,r11
	add r13,r15
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*728]
	mov qword [gbl+8*11],r15
	mov r15, qword [gbl+8*9]
	mov r14,r15
	mov qword [rsp+8*725],r10
	mov r10, qword [gbl+8*11]
	add r14,r10
	mov qword [rsp+8*726],r11
	mov r11, qword [rsp+8*729]
	mov r11,r13
	sub r11,r14
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*730]
	mov qword [rsp+8*727],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r15
	mov qword [rsp+8*728],r14
	mov r14, qword [rsp+8*731]
	mov r14,r12
	add r14,r10
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*732]
	mov r15,r11
	add r15,r14
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*733]
	mov qword [rsp+8*729],r11
	mov r11, qword [rsp+8*725]
	mov r10,r11
	add r10,r15
	mov qword [rsp+8*730],r12
	mov r12, qword [rsp+8*734]
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*719]
	mov r12,r13
	sub r12,r10
	mov qword [rsp+8*731],r14
	mov r14, qword [rsp+8*735]
	mov qword [rsp+8*732],r15
	mov r15, qword [gbl+8*9]
	mov r14,r15
	mov qword [rsp+8*733],r10
	mov r10, qword [gbl+8*11]
	add r14,r10
	mov qword [rsp+8*725],r11
	mov r11, qword [rsp+8*736]
	mov qword [rsp+8*734],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	sub r11,r15
	mov qword [rsp+8*719],r13
	mov r13, qword [rsp+8*737]
	mov r13,r11
	add r13,r10
	mov qword [rsp+8*735],r14
	mov r14, qword [rsp+8*738]
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*735]
	mov r14,r15
	add r14,r13
	mov qword [gbl+8*11],r10
	mov r10, qword [rsp+8*739]
	mov qword [rsp+8*736],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [gbl+8*3],r12
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*737],r13
	mov r13, qword [rsp+8*740]
	mov r13,r14
	sub r13,r10
	mov qword [rsp+8*738],r14
	mov r14, qword [rsp+8*741]
	mov qword [rsp+8*735],r15
	mov r15, qword [gbl+8*3]
	mov r14,r15
	sub r14,r11
	mov qword [rsp+8*739],r10
	mov r10, qword [rsp+8*742]
	mov r10,r14
	add r10,r12
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*743]
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [rsp+8*740],r13
	mov r13, qword [gbl+8*11]
	add r11,r13
	mov qword [rsp+8*741],r14
	mov r14, qword [rsp+8*744]
	mov r14,r10
	sub r14,r11
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*745]
	mov qword [rsp+8*742],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r12
	mov qword [rsp+8*743],r11
	mov r11, qword [rsp+8*746]
	mov r11,r15
	add r11,r13
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*747]
	mov r12,r14
	add r12,r11
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*748]
	mov qword [rsp+8*744],r14
	mov r14, qword [rsp+8*740]
	mov r13,r14
	add r13,r12
	mov qword [rsp+8*745],r15
	mov r15, qword [rsp+8*749]
	mov qword [gbl+8*3],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [rsp+8*746],r11
	mov r11, qword [gbl+8*11]
	add r15,r11
	mov qword [rsp+8*747],r12
	mov r12, qword [rsp+8*750]
	mov qword [rsp+8*748],r13
	mov r13, qword [gbl+8*3]
	mov r12,r13
	sub r12,r10
	mov qword [rsp+8*740],r14
	mov r14, qword [rsp+8*751]
	mov r14,r12
	add r14,r11
	mov qword [rsp+8*749],r15
	mov r15, qword [rsp+8*752]
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*749]
	mov r15,r10
	add r15,r14
	mov qword [gbl+8*11],r11
	mov r11, qword [rsp+8*753]
	mov qword [rsp+8*750],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [gbl+8*3],r13
	mov r13, qword [gbl+8*11]
	add r11,r13
	mov qword [rsp+8*751],r14
	mov r14, qword [rsp+8*754]
	mov r14,r15
	sub r14,r11
	mov qword [rsp+8*752],r15
	mov r15, qword [rsp+8*755]
	mov qword [rsp+8*749],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	sub r15,r12
	mov qword [rsp+8*753],r11
	mov r11, qword [rsp+8*756]
	mov r11,r15
	add r11,r13
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*757]
	mov qword [gbl+8*11],r13
	mov r13, qword [gbl+8*9]
	mov r12,r13
	mov qword [rsp+8*754],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*755],r15
	mov r15, qword [rsp+8*758]
	mov r15,r11
	sub r15,r12
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*759]
	mov qword [rsp+8*756],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	sub r10,r13
	mov qword [rsp+8*757],r12
	mov r12, qword [rsp+8*760]
	mov r12,r10
	add r12,r14
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*761]
	mov r13,r15
	add r13,r12
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*762]
	mov qword [rsp+8*758],r15
	mov r15, qword [rsp+8*754]
	mov r14,r15
	add r14,r13
	mov qword [rsp+8*759],r10
	mov r10, qword [rsp+8*763]
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*748]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*760],r12
	mov r12, qword [rsp+8*764]
	mov qword [rsp+8*761],r13
	mov r13, qword [rsp+8*734]
	mov r12,r13
	sub r12,r10
	mov qword [rsp+8*762],r14
	mov r14, qword [rsp+8*765]
	mov qword [rsp+8*754],r15
	mov r15, qword [rsp+8*702]
	mov r14,r15
	add r14,r12
	mov qword [rsp+8*763],r10
	mov r10, qword [rsp+8*766]
	mov qword [rsp+8*748],r11
	mov r11, qword [rsp+8*641]
	mov r10,r11
	sub r10,r14
	mov qword [rsp+8*764],r12
	mov r12, qword [gbl+8*3]
	mov r12,r10
	mov qword [rsp+8*766],r10
	mov qword [rsp+8*641],r11
	mov qword [gbl+8*3],r12
	mov qword [rsp+8*734],r13
	mov qword [rsp+8*765],r14
	mov qword [rsp+8*702],r15
	jmp L_627
	
L_628:
	mov r10, qword [arg+8*0]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [gbl+8*9],r11
	mov r10, qword [rsp+8*768]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*768],r10
	mov qword [arg+8*0],r11
	mov     rdi, [rsp+8*768]
	call    toString
	mov     qword[rsp+8*769], rax
	mov     rsi, t789
	mov     rdi, [rsp+8*769]
	call    concat
	mov [rsp+8*770], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [gbl+8*11]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [gbl+8*11],r11
	mov r10, qword [rsp+8*771]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*771],r10
	mov qword [arg+8*0],r11
	mov     rdi, [rsp+8*771]
	call    toString
	mov     qword[rsp+8*772], rax
	mov     rsi, [rsp+8*772]
	mov     rdi, [rsp+8*770]
	call    concat
	mov [rsp+8*773], rax
	mov     rsi, t795
	mov     rdi, [rsp+8*773]
	call    concat
	mov [rsp+8*774], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [gbl+8*3],r11
	mov r10, qword [rsp+8*775]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*775],r10
	mov qword [arg+8*0],r11
	mov     rdi, [rsp+8*775]
	call    toString
	mov     qword[rsp+8*776], rax
	mov     rsi, [rsp+8*776]
	mov     rdi, [rsp+8*774]
	call    concat
	mov [rsp+8*777], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*777]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*777],r11
	mov r10, qword [rsp+8*778]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*778],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*778] 
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
	sub    rsp, 6296
	mov r10, qword [gbl+8*9]
	mov r11,1
	mov r10,r11
	mov qword [gbl+8*9],r10
	mov r10, qword [gbl+8*11]
	mov r11,1
	mov r10,r11
	mov qword [gbl+8*11],r10
	mov r10, qword [gbl+8*3]
	mov r11,1
	mov r10,r11
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*779]
	mov rax,r10
	mov qword [rsp+8*779],r10
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
	
t789:
	 db 1," " ,0

t795:
	 db 1," " ,0


