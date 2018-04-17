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
	mov r8, qword [rsp+8*1]
	mov r8 , rax
	mov qword [rsp+8*1],r8
	
L_627:
	mov r8, qword [rsp+8*2]
	mov r9,1
	mov r8,r9
	shl r8,29
	mov r10, qword [gbl+8*3]
	cmp r10,r8
	mov r11, qword [rsp+8*4]
	mov r11, 0
	setl r11B
	mov qword [rsp+8*2],r8
	mov qword [gbl+8*3],r10
	mov qword [rsp+8*4],r11
	mov r8, qword [rsp+8*4]
	cmp r8, 0
	mov qword [rsp+8*4],r8
	jne L_629
	mov r8, qword [rsp+8*5]
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*5],r8
	jmp L_630
	
L_629:
	mov r8, qword [rsp+8*6]
	mov r9,1
	mov r8,r9
	shl r8,29
	mov r10, qword [rsp+8*7]
	mov r10,r8
	neg r10
	mov r11, qword [gbl+8*3]
	cmp r11,r10
	mov r12, qword [rsp+8*8]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*6],r8
	mov qword [rsp+8*7],r10
	mov qword [gbl+8*3],r11
	mov qword [rsp+8*8],r12
	mov r8, qword [rsp+8*5]
	mov r9, qword [rsp+8*8]
	mov r8,r9
	mov qword [rsp+8*5],r8
	mov qword [rsp+8*8],r9
	
L_630:
	mov r8, qword [rsp+8*5]
	cmp r8, 0
	mov qword [rsp+8*5],r8
	je L_628
	mov r8, qword [rsp+8*10]
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10, qword [gbl+8*9]
	sub r8,r10
	mov r11, qword [rsp+8*12]
	mov r11,r8
	mov r12, qword [gbl+8*11]
	add r11,r12
	mov r13, qword [rsp+8*13]
	mov r13,r10
	add r13,r12
	mov r14, qword [rsp+8*14]
	mov r14,r11
	sub r14,r13
	mov r15, qword [rsp+8*15]
	mov r15,r9
	sub r15,r10
	mov qword [rsp+8*10],r8
	mov r8, qword [rsp+8*16]
	mov r8,r15
	add r8,r12
	mov qword [rsp+8*12],r11
	mov r11, qword [rsp+8*17]
	mov r11,r10
	add r11,r12
	mov qword [rsp+8*13],r13
	mov r13, qword [rsp+8*18]
	mov r13,r8
	sub r13,r11
	mov qword [rsp+8*14],r14
	mov r14, qword [rsp+8*19]
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*14]
	mov r14,r9
	add r14,r13
	mov qword [rsp+8*15],r15
	mov r15, qword [rsp+8*20]
	mov qword [gbl+8*9],r10
	mov r10, qword [gbl+8*3]
	mov r15,r10
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	sub r15,r12
	mov qword [rsp+8*16],r8
	mov r8, qword [rsp+8*21]
	mov r8,r15
	mov qword [rsp+8*17],r11
	mov r11, qword [gbl+8*11]
	add r8,r11
	mov qword [rsp+8*14],r9
	mov r9, qword [rsp+8*22]
	mov r9,r12
	add r9,r11
	mov qword [rsp+8*18],r13
	mov r13, qword [rsp+8*23]
	mov r13,r8
	sub r13,r9
	mov qword [rsp+8*19],r14
	mov r14, qword [rsp+8*24]
	mov r14,r10
	sub r14,r12
	mov qword [rsp+8*20],r15
	mov r15, qword [rsp+8*25]
	mov r15,r14
	add r15,r11
	mov qword [rsp+8*21],r8
	mov r8, qword [rsp+8*26]
	mov r8,r13
	add r8,r15
	mov qword [rsp+8*22],r9
	mov r9, qword [rsp+8*27]
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*19]
	mov r9,r10
	add r9,r8
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*28]
	mov qword [gbl+8*11],r11
	mov r11, qword [gbl+8*9]
	mov r12,r11
	mov qword [rsp+8*24],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*23],r13
	mov r13, qword [rsp+8*29]
	mov qword [rsp+8*25],r15
	mov r15, qword [gbl+8*3]
	mov r13,r15
	sub r13,r11
	mov qword [rsp+8*26],r8
	mov r8, qword [rsp+8*30]
	mov r8,r13
	add r8,r14
	mov qword [rsp+8*27],r9
	mov r9, qword [rsp+8*31]
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*19],r10
	mov r10, qword [rsp+8*32]
	mov r10,r11
	add r10,r14
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*33]
	mov r15,r9
	sub r15,r10
	mov qword [rsp+8*29],r13
	mov r13, qword [rsp+8*34]
	mov qword [rsp+8*30],r8
	mov r8, qword [gbl+8*3]
	mov r13,r8
	sub r13,r11
	mov qword [rsp+8*28],r12
	mov r12, qword [rsp+8*35]
	mov r12,r13
	add r12,r14
	mov qword [rsp+8*31],r9
	mov r9, qword [rsp+8*36]
	mov r9,r11
	add r9,r14
	mov qword [rsp+8*32],r10
	mov r10, qword [rsp+8*37]
	mov r10,r12
	sub r10,r9
	mov qword [rsp+8*33],r15
	mov r15, qword [rsp+8*38]
	mov r15,r8
	sub r15,r11
	mov qword [rsp+8*34],r13
	mov r13, qword [rsp+8*39]
	mov r13,r15
	add r13,r14
	mov qword [rsp+8*36],r9
	mov r9, qword [rsp+8*40]
	mov r9,r10
	add r9,r13
	mov qword [rsp+8*35],r12
	mov r12, qword [rsp+8*41]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*33]
	mov r12,r8
	add r12,r9
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*42]
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*27]
	mov r11,r14
	sub r11,r12
	mov qword [rsp+8*38],r15
	mov r15, qword [rsp+8*43]
	mov qword [rsp+8*37],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [rsp+8*39],r13
	mov r13, qword [gbl+8*11]
	add r15,r13
	mov qword [rsp+8*33],r8
	mov r8, qword [rsp+8*44]
	mov qword [rsp+8*40],r9
	mov r9, qword [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*42],r11
	mov r11, qword [rsp+8*45]
	mov r11,r8
	add r11,r13
	mov qword [rsp+8*41],r12
	mov r12, qword [rsp+8*46]
	mov r12,r15
	add r12,r11
	mov qword [rsp+8*27],r14
	mov r14, qword [rsp+8*47]
	mov r14,r10
	add r14,r13
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*48]
	mov qword [rsp+8*44],r8
	mov r8, qword [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*45],r11
	mov r11, qword [rsp+8*49]
	mov r11,r9
	add r11,r13
	mov qword [rsp+8*46],r12
	mov r12, qword [rsp+8*50]
	mov r12,r14
	add r12,r11
	mov qword [rsp+8*43],r15
	mov r15, qword [rsp+8*51]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*46]
	mov r15,r8
	sub r15,r12
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*52]
	mov qword [rsp+8*48],r9
	mov r9, qword [gbl+8*9]
	mov r10,r9
	add r10,r13
	mov qword [rsp+8*49],r11
	mov r11, qword [rsp+8*53]
	mov qword [rsp+8*47],r14
	mov r14, qword [gbl+8*3]
	mov r11,r14
	sub r11,r9
	mov qword [rsp+8*46],r8
	mov r8, qword [rsp+8*54]
	mov r8,r11
	add r8,r13
	mov qword [rsp+8*50],r12
	mov r12, qword [rsp+8*55]
	mov r12,r10
	add r12,r8
	mov qword [rsp+8*51],r15
	mov r15, qword [rsp+8*56]
	mov r15,r9
	add r15,r13
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*57]
	mov r14,r12
	sub r14,r15
	mov qword [rsp+8*53],r11
	mov r11, qword [rsp+8*58]
	mov qword [rsp+8*54],r8
	mov r8, qword [rsp+8*51]
	mov r11,r8
	sub r11,r14
	mov qword [rsp+8*52],r10
	mov r10, qword [rsp+8*59]
	mov qword [gbl+8*9],r9
	mov r9, qword [gbl+8*3]
	mov r10,r9
	mov qword [gbl+8*11],r13
	mov r13, qword [gbl+8*9]
	sub r10,r13
	mov qword [rsp+8*55],r12
	mov r12, qword [rsp+8*60]
	mov r12,r10
	mov qword [rsp+8*56],r15
	mov r15, qword [gbl+8*11]
	add r12,r15
	mov qword [rsp+8*51],r8
	mov r8, qword [rsp+8*61]
	mov r8,r13
	add r8,r15
	mov qword [rsp+8*58],r11
	mov r11, qword [rsp+8*62]
	mov r11,r12
	sub r11,r8
	mov qword [rsp+8*57],r14
	mov r14, qword [rsp+8*63]
	mov r14,r9
	sub r14,r13
	mov qword [rsp+8*59],r10
	mov r10, qword [rsp+8*64]
	mov r10,r14
	add r10,r15
	mov qword [rsp+8*61],r8
	mov r8, qword [rsp+8*65]
	mov r8,r11
	add r8,r10
	mov qword [rsp+8*60],r12
	mov r12, qword [rsp+8*66]
	mov r12,r13
	add r12,r15
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*67]
	mov qword [rsp+8*63],r14
	mov r14, qword [gbl+8*3]
	mov r9,r14
	sub r9,r13
	mov qword [rsp+8*65],r8
	mov r8, qword [rsp+8*68]
	mov r8,r9
	add r8,r15
	mov qword [rsp+8*64],r10
	mov r10, qword [rsp+8*69]
	mov r10,r12
	add r10,r8
	mov qword [rsp+8*62],r11
	mov r11, qword [rsp+8*70]
	mov r11,r13
	add r11,r15
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*71]
	mov r14,r10
	sub r14,r11
	mov qword [rsp+8*67],r9
	mov r9, qword [rsp+8*72]
	mov qword [rsp+8*68],r8
	mov r8, qword [rsp+8*65]
	mov r9,r8
	sub r9,r14
	mov qword [rsp+8*66],r12
	mov r12, qword [rsp+8*73]
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*58]
	mov r12,r13
	add r12,r9
	mov qword [gbl+8*11],r15
	mov r15, qword [rsp+8*74]
	mov qword [rsp+8*69],r10
	mov r10, qword [rsp+8*42]
	mov r15,r10
	sub r15,r12
	mov qword [rsp+8*70],r11
	mov r11, qword [rsp+8*75]
	mov qword [rsp+8*65],r8
	mov r8, qword [gbl+8*3]
	mov r11,r8
	mov qword [rsp+8*71],r14
	mov r14, qword [gbl+8*9]
	sub r11,r14
	mov qword [rsp+8*72],r9
	mov r9, qword [rsp+8*76]
	mov r9,r11
	mov qword [rsp+8*58],r13
	mov r13, qword [gbl+8*11]
	add r9,r13
	mov qword [rsp+8*42],r10
	mov r10, qword [rsp+8*77]
	mov r10,r14
	add r10,r13
	mov qword [rsp+8*73],r12
	mov r12, qword [rsp+8*78]
	mov r12,r9
	sub r12,r10
	mov qword [rsp+8*74],r15
	mov r15, qword [rsp+8*79]
	mov r15,r8
	sub r15,r14
	mov qword [rsp+8*75],r11
	mov r11, qword [rsp+8*80]
	mov r11,r15
	add r11,r13
	mov qword [rsp+8*76],r9
	mov r9, qword [rsp+8*81]
	mov r9,r14
	add r9,r13
	mov qword [rsp+8*77],r10
	mov r10, qword [rsp+8*82]
	mov r10,r11
	sub r10,r9
	mov qword [rsp+8*78],r12
	mov r12, qword [rsp+8*83]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*78]
	mov r12,r8
	add r12,r10
	mov qword [rsp+8*79],r15
	mov r15, qword [rsp+8*84]
	mov qword [gbl+8*11],r13
	mov r13, qword [gbl+8*3]
	mov r15,r13
	sub r15,r14
	mov qword [rsp+8*81],r9
	mov r9, qword [rsp+8*85]
	mov r9,r15
	mov qword [rsp+8*80],r11
	mov r11, qword [gbl+8*11]
	add r9,r11
	mov qword [rsp+8*78],r8
	mov r8, qword [rsp+8*86]
	mov r8,r14
	add r8,r11
	mov qword [rsp+8*82],r10
	mov r10, qword [rsp+8*87]
	mov r10,r9
	sub r10,r8
	mov qword [rsp+8*83],r12
	mov r12, qword [rsp+8*88]
	mov r12,r13
	sub r12,r14
	mov qword [rsp+8*84],r15
	mov r15, qword [rsp+8*89]
	mov r15,r12
	add r15,r11
	mov qword [rsp+8*86],r8
	mov r8, qword [rsp+8*90]
	mov r8,r10
	add r8,r15
	mov qword [rsp+8*85],r9
	mov r9, qword [rsp+8*91]
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*83]
	mov r9,r13
	add r9,r8
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*92]
	mov qword [gbl+8*11],r11
	mov r11, qword [gbl+8*9]
	mov r14,r11
	mov qword [rsp+8*88],r12
	mov r12, qword [gbl+8*11]
	add r14,r12
	mov qword [rsp+8*87],r10
	mov r10, qword [rsp+8*93]
	mov qword [rsp+8*89],r15
	mov r15, qword [gbl+8*3]
	mov r10,r15
	sub r10,r11
	mov qword [rsp+8*90],r8
	mov r8, qword [rsp+8*94]
	mov r8,r10
	add r8,r12
	mov qword [rsp+8*91],r9
	mov r9, qword [rsp+8*95]
	mov r9,r14
	add r9,r8
	mov qword [rsp+8*83],r13
	mov r13, qword [rsp+8*96]
	mov r13,r11
	add r13,r12
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*97]
	mov r15,r9
	sub r15,r13
	mov qword [rsp+8*93],r10
	mov r10, qword [rsp+8*98]
	mov qword [rsp+8*94],r8
	mov r8, qword [gbl+8*3]
	mov r10,r8
	sub r10,r11
	mov qword [rsp+8*92],r14
	mov r14, qword [rsp+8*99]
	mov r14,r10
	add r14,r12
	mov qword [rsp+8*95],r9
	mov r9, qword [rsp+8*100]
	mov r9,r11
	add r9,r12
	mov qword [rsp+8*96],r13
	mov r13, qword [rsp+8*101]
	mov r13,r14
	sub r13,r9
	mov qword [rsp+8*97],r15
	mov r15, qword [rsp+8*102]
	mov r15,r8
	sub r15,r11
	mov qword [rsp+8*98],r10
	mov r10, qword [rsp+8*103]
	mov r10,r15
	add r10,r12
	mov qword [rsp+8*100],r9
	mov r9, qword [rsp+8*104]
	mov r9,r13
	add r9,r10
	mov qword [rsp+8*99],r14
	mov r14, qword [rsp+8*105]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*97]
	mov r14,r8
	add r14,r9
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*106]
	mov qword [gbl+8*11],r12
	mov r12, qword [rsp+8*91]
	mov r11,r12
	sub r11,r14
	mov qword [rsp+8*102],r15
	mov r15, qword [rsp+8*107]
	mov qword [rsp+8*103],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [rsp+8*101],r13
	mov r13, qword [gbl+8*11]
	add r15,r13
	mov qword [rsp+8*97],r8
	mov r8, qword [rsp+8*108]
	mov qword [rsp+8*104],r9
	mov r9, qword [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*106],r11
	mov r11, qword [rsp+8*109]
	mov r11,r8
	add r11,r13
	mov qword [rsp+8*91],r12
	mov r12, qword [rsp+8*110]
	mov r12,r15
	add r12,r11
	mov qword [rsp+8*105],r14
	mov r14, qword [rsp+8*111]
	mov r14,r10
	add r14,r13
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*112]
	mov r9,r12
	sub r9,r14
	mov qword [rsp+8*108],r8
	mov r8, qword [rsp+8*113]
	mov qword [rsp+8*109],r11
	mov r11, qword [gbl+8*3]
	mov r8,r11
	sub r8,r10
	mov qword [rsp+8*107],r15
	mov r15, qword [rsp+8*114]
	mov r15,r8
	add r15,r13
	mov qword [rsp+8*112],r9
	mov r9, qword [rsp+8*115]
	mov r9,r10
	add r9,r13
	mov qword [rsp+8*110],r12
	mov r12, qword [rsp+8*116]
	mov r12,r15
	sub r12,r9
	mov qword [rsp+8*111],r14
	mov r14, qword [rsp+8*117]
	mov r14,r11
	sub r14,r10
	mov qword [rsp+8*113],r8
	mov r8, qword [rsp+8*118]
	mov r8,r14
	add r8,r13
	mov qword [rsp+8*115],r9
	mov r9, qword [rsp+8*119]
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*114],r15
	mov r15, qword [rsp+8*120]
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*112]
	mov r15,r10
	add r15,r9
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*121]
	mov qword [gbl+8*11],r13
	mov r13, qword [gbl+8*9]
	mov r11,r13
	mov qword [rsp+8*117],r14
	mov r14, qword [gbl+8*11]
	add r11,r14
	mov qword [rsp+8*118],r8
	mov r8, qword [rsp+8*122]
	mov qword [rsp+8*116],r12
	mov r12, qword [gbl+8*3]
	mov r8,r12
	sub r8,r13
	mov qword [rsp+8*119],r9
	mov r9, qword [rsp+8*123]
	mov r9,r8
	add r9,r14
	mov qword [rsp+8*112],r10
	mov r10, qword [rsp+8*124]
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*120],r15
	mov r15, qword [rsp+8*125]
	mov r15,r13
	add r15,r14
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*126]
	mov r12,r10
	sub r12,r15
	mov qword [rsp+8*122],r8
	mov r8, qword [rsp+8*127]
	mov qword [rsp+8*123],r9
	mov r9, qword [gbl+8*3]
	mov r8,r9
	sub r8,r13
	mov qword [rsp+8*121],r11
	mov r11, qword [rsp+8*128]
	mov r11,r8
	add r11,r14
	mov qword [rsp+8*124],r10
	mov r10, qword [rsp+8*129]
	mov r10,r13
	add r10,r14
	mov qword [rsp+8*126],r12
	mov r12, qword [rsp+8*130]
	mov r12,r11
	sub r12,r10
	mov qword [rsp+8*125],r15
	mov r15, qword [rsp+8*131]
	mov r15,r9
	sub r15,r13
	mov qword [rsp+8*127],r8
	mov r8, qword [rsp+8*132]
	mov r8,r15
	add r8,r14
	mov qword [rsp+8*129],r10
	mov r10, qword [rsp+8*133]
	mov r10,r12
	add r10,r8
	mov qword [rsp+8*128],r11
	mov r11, qword [rsp+8*134]
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*126]
	mov r11,r9
	add r11,r10
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*135]
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*120]
	mov r13,r14
	sub r13,r11
	mov qword [rsp+8*131],r15
	mov r15, qword [rsp+8*136]
	mov qword [rsp+8*132],r8
	mov r8, qword [rsp+8*106]
	mov r15,r8
	sub r15,r13
	mov qword [rsp+8*130],r12
	mov r12, qword [rsp+8*137]
	mov qword [rsp+8*126],r9
	mov r9, qword [rsp+8*74]
	mov r12,r9
	add r12,r15
	mov qword [rsp+8*133],r10
	mov r10, qword [rsp+8*138]
	mov qword [rsp+8*134],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [rsp+8*120],r14
	mov r14, qword [gbl+8*11]
	add r10,r14
	mov qword [rsp+8*106],r8
	mov r8, qword [rsp+8*139]
	mov qword [rsp+8*135],r13
	mov r13, qword [gbl+8*3]
	mov r8,r13
	sub r8,r11
	mov qword [rsp+8*74],r9
	mov r9, qword [rsp+8*140]
	mov r9,r8
	add r9,r14
	mov qword [rsp+8*137],r12
	mov r12, qword [rsp+8*141]
	mov r12,r10
	add r12,r9
	mov qword [rsp+8*136],r15
	mov r15, qword [rsp+8*142]
	mov r15,r11
	add r15,r14
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*143]
	mov qword [rsp+8*139],r8
	mov r8, qword [gbl+8*3]
	mov r13,r8
	sub r13,r11
	mov qword [rsp+8*140],r9
	mov r9, qword [rsp+8*144]
	mov r9,r13
	add r9,r14
	mov qword [rsp+8*138],r10
	mov r10, qword [rsp+8*145]
	mov r10,r15
	add r10,r9
	mov qword [rsp+8*141],r12
	mov r12, qword [rsp+8*146]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*141]
	mov r12,r8
	sub r12,r10
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*147]
	mov qword [rsp+8*143],r13
	mov r13, qword [gbl+8*9]
	mov r11,r13
	add r11,r14
	mov qword [rsp+8*144],r9
	mov r9, qword [rsp+8*148]
	mov qword [rsp+8*142],r15
	mov r15, qword [gbl+8*3]
	mov r9,r15
	sub r9,r13
	mov qword [rsp+8*141],r8
	mov r8, qword [rsp+8*149]
	mov r8,r9
	add r8,r14
	mov qword [rsp+8*145],r10
	mov r10, qword [rsp+8*150]
	mov r10,r11
	add r10,r8
	mov qword [rsp+8*146],r12
	mov r12, qword [rsp+8*151]
	mov r12,r13
	add r12,r14
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*152]
	mov r15,r10
	sub r15,r12
	mov qword [rsp+8*148],r9
	mov r9, qword [rsp+8*153]
	mov qword [rsp+8*149],r8
	mov r8, qword [rsp+8*146]
	mov r9,r8
	sub r9,r15
	mov qword [rsp+8*147],r11
	mov r11, qword [rsp+8*154]
	mov qword [gbl+8*9],r13
	mov r13, qword [gbl+8*3]
	mov r11,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r11,r14
	mov qword [rsp+8*150],r10
	mov r10, qword [rsp+8*155]
	mov r10,r11
	mov qword [rsp+8*151],r12
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*146],r8
	mov r8, qword [rsp+8*156]
	mov r8,r14
	add r8,r12
	mov qword [rsp+8*153],r9
	mov r9, qword [rsp+8*157]
	mov r9,r10
	sub r9,r8
	mov qword [rsp+8*152],r15
	mov r15, qword [rsp+8*158]
	mov r15,r13
	sub r15,r14
	mov qword [rsp+8*154],r11
	mov r11, qword [rsp+8*159]
	mov r11,r15
	add r11,r12
	mov qword [rsp+8*156],r8
	mov r8, qword [rsp+8*160]
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*155],r10
	mov r10, qword [rsp+8*161]
	mov r10,r14
	add r10,r12
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*162]
	mov qword [rsp+8*158],r15
	mov r15, qword [gbl+8*3]
	mov r13,r15
	sub r13,r14
	mov qword [rsp+8*160],r8
	mov r8, qword [rsp+8*163]
	mov r8,r13
	add r8,r12
	mov qword [rsp+8*157],r9
	mov r9, qword [rsp+8*164]
	mov r9,r10
	add r9,r8
	mov qword [rsp+8*159],r11
	mov r11, qword [rsp+8*165]
	mov r11,r14
	add r11,r12
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*166]
	mov r15,r9
	sub r15,r11
	mov qword [rsp+8*162],r13
	mov r13, qword [rsp+8*167]
	mov qword [rsp+8*163],r8
	mov r8, qword [rsp+8*160]
	mov r13,r8
	sub r13,r15
	mov qword [rsp+8*161],r10
	mov r10, qword [rsp+8*168]
	mov qword [gbl+8*11],r12
	mov r12, qword [rsp+8*153]
	mov r10,r12
	add r10,r13
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*169]
	mov qword [rsp+8*164],r9
	mov r9, qword [gbl+8*3]
	mov r14,r9
	mov qword [rsp+8*165],r11
	mov r11, qword [gbl+8*9]
	sub r14,r11
	mov qword [rsp+8*160],r8
	mov r8, qword [rsp+8*170]
	mov r8,r14
	mov qword [rsp+8*166],r15
	mov r15, qword [gbl+8*11]
	add r8,r15
	mov qword [rsp+8*168],r10
	mov r10, qword [rsp+8*171]
	mov r10,r11
	add r10,r15
	mov qword [rsp+8*153],r12
	mov r12, qword [rsp+8*172]
	mov r12,r8
	sub r12,r10
	mov qword [rsp+8*167],r13
	mov r13, qword [rsp+8*173]
	mov r13,r9
	sub r13,r11
	mov qword [rsp+8*169],r14
	mov r14, qword [rsp+8*174]
	mov r14,r13
	add r14,r15
	mov qword [rsp+8*170],r8
	mov r8, qword [rsp+8*175]
	mov r8,r12
	add r8,r14
	mov qword [rsp+8*171],r10
	mov r10, qword [rsp+8*176]
	mov r10,r11
	add r10,r15
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*177]
	mov qword [rsp+8*173],r13
	mov r13, qword [gbl+8*3]
	mov r9,r13
	sub r9,r11
	mov qword [rsp+8*175],r8
	mov r8, qword [rsp+8*178]
	mov r8,r9
	add r8,r15
	mov qword [rsp+8*172],r12
	mov r12, qword [rsp+8*179]
	mov r12,r10
	add r12,r8
	mov qword [rsp+8*174],r14
	mov r14, qword [rsp+8*180]
	mov r14,r11
	add r14,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*181]
	mov r13,r12
	sub r13,r14
	mov qword [rsp+8*177],r9
	mov r9, qword [rsp+8*182]
	mov qword [rsp+8*178],r8
	mov r8, qword [rsp+8*175]
	mov r9,r8
	sub r9,r13
	mov qword [rsp+8*176],r10
	mov r10, qword [rsp+8*183]
	mov qword [gbl+8*9],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [gbl+8*11],r15
	mov r15, qword [gbl+8*9]
	sub r10,r15
	mov qword [rsp+8*179],r12
	mov r12, qword [rsp+8*184]
	mov r12,r10
	mov qword [rsp+8*180],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*175],r8
	mov r8, qword [rsp+8*185]
	mov r8,r15
	add r8,r14
	mov qword [rsp+8*182],r9
	mov r9, qword [rsp+8*186]
	mov r9,r12
	sub r9,r8
	mov qword [rsp+8*181],r13
	mov r13, qword [rsp+8*187]
	mov r13,r11
	sub r13,r15
	mov qword [rsp+8*183],r10
	mov r10, qword [rsp+8*188]
	mov r10,r13
	add r10,r14
	mov qword [rsp+8*185],r8
	mov r8, qword [rsp+8*189]
	mov r8,r9
	add r8,r10
	mov qword [rsp+8*184],r12
	mov r12, qword [rsp+8*190]
	mov r12,r15
	add r12,r14
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*191]
	mov qword [rsp+8*187],r13
	mov r13, qword [gbl+8*3]
	mov r11,r13
	sub r11,r15
	mov qword [rsp+8*189],r8
	mov r8, qword [rsp+8*192]
	mov r8,r11
	add r8,r14
	mov qword [rsp+8*186],r9
	mov r9, qword [rsp+8*193]
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*188],r10
	mov r10, qword [rsp+8*194]
	mov r10,r15
	add r10,r14
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*195]
	mov r13,r9
	sub r13,r10
	mov qword [rsp+8*191],r11
	mov r11, qword [rsp+8*196]
	mov qword [rsp+8*192],r8
	mov r8, qword [rsp+8*189]
	mov r11,r8
	sub r11,r13
	mov qword [rsp+8*190],r12
	mov r12, qword [rsp+8*197]
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*182]
	mov r12,r14
	add r12,r11
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*198]
	mov qword [rsp+8*193],r9
	mov r9, qword [rsp+8*168]
	mov r15,r9
	add r15,r12
	mov qword [rsp+8*194],r10
	mov r10, qword [rsp+8*199]
	mov qword [rsp+8*189],r8
	mov r8, qword [gbl+8*3]
	mov r10,r8
	mov qword [rsp+8*195],r13
	mov r13, qword [gbl+8*9]
	sub r10,r13
	mov qword [rsp+8*196],r11
	mov r11, qword [rsp+8*200]
	mov r11,r10
	mov qword [rsp+8*182],r14
	mov r14, qword [gbl+8*11]
	add r11,r14
	mov qword [rsp+8*168],r9
	mov r9, qword [rsp+8*201]
	mov r9,r13
	add r9,r14
	mov qword [rsp+8*197],r12
	mov r12, qword [rsp+8*202]
	mov r12,r11
	sub r12,r9
	mov qword [rsp+8*198],r15
	mov r15, qword [rsp+8*203]
	mov r15,r8
	sub r15,r13
	mov qword [rsp+8*199],r10
	mov r10, qword [rsp+8*204]
	mov r10,r15
	add r10,r14
	mov qword [rsp+8*201],r9
	mov r9, qword [rsp+8*205]
	mov r9,r13
	add r9,r14
	mov qword [rsp+8*200],r11
	mov r11, qword [rsp+8*206]
	mov r11,r10
	sub r11,r9
	mov qword [rsp+8*202],r12
	mov r12, qword [rsp+8*207]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*202]
	mov r12,r8
	add r12,r11
	mov qword [rsp+8*203],r15
	mov r15, qword [rsp+8*208]
	mov qword [gbl+8*9],r13
	mov r13, qword [gbl+8*3]
	mov r15,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r15,r14
	mov qword [rsp+8*205],r9
	mov r9, qword [rsp+8*209]
	mov r9,r15
	mov qword [rsp+8*204],r10
	mov r10, qword [gbl+8*11]
	add r9,r10
	mov qword [rsp+8*202],r8
	mov r8, qword [rsp+8*210]
	mov r8,r14
	add r8,r10
	mov qword [rsp+8*206],r11
	mov r11, qword [rsp+8*211]
	mov r11,r9
	sub r11,r8
	mov qword [rsp+8*207],r12
	mov r12, qword [rsp+8*212]
	mov r12,r13
	sub r12,r14
	mov qword [rsp+8*208],r15
	mov r15, qword [rsp+8*213]
	mov r15,r12
	add r15,r10
	mov qword [rsp+8*210],r8
	mov r8, qword [rsp+8*214]
	mov r8,r11
	add r8,r15
	mov qword [rsp+8*209],r9
	mov r9, qword [rsp+8*215]
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*207]
	mov r9,r13
	add r9,r8
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*216]
	mov qword [gbl+8*11],r10
	mov r10, qword [gbl+8*9]
	mov r14,r10
	mov qword [rsp+8*212],r12
	mov r12, qword [gbl+8*11]
	add r14,r12
	mov qword [rsp+8*211],r11
	mov r11, qword [rsp+8*217]
	mov qword [rsp+8*213],r15
	mov r15, qword [gbl+8*3]
	mov r11,r15
	sub r11,r10
	mov qword [rsp+8*214],r8
	mov r8, qword [rsp+8*218]
	mov r8,r11
	add r8,r12
	mov qword [rsp+8*215],r9
	mov r9, qword [rsp+8*219]
	mov r9,r14
	add r9,r8
	mov qword [rsp+8*207],r13
	mov r13, qword [rsp+8*220]
	mov r13,r10
	add r13,r12
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*221]
	mov r15,r9
	sub r15,r13
	mov qword [rsp+8*217],r11
	mov r11, qword [rsp+8*222]
	mov qword [rsp+8*218],r8
	mov r8, qword [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*216],r14
	mov r14, qword [rsp+8*223]
	mov r14,r11
	add r14,r12
	mov qword [rsp+8*219],r9
	mov r9, qword [rsp+8*224]
	mov r9,r10
	add r9,r12
	mov qword [rsp+8*220],r13
	mov r13, qword [rsp+8*225]
	mov r13,r14
	sub r13,r9
	mov qword [rsp+8*221],r15
	mov r15, qword [rsp+8*226]
	mov r15,r8
	sub r15,r10
	mov qword [rsp+8*222],r11
	mov r11, qword [rsp+8*227]
	mov r11,r15
	add r11,r12
	mov qword [rsp+8*224],r9
	mov r9, qword [rsp+8*228]
	mov r9,r13
	add r9,r11
	mov qword [rsp+8*223],r14
	mov r14, qword [rsp+8*229]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*221]
	mov r14,r8
	add r14,r9
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*230]
	mov qword [gbl+8*11],r12
	mov r12, qword [rsp+8*215]
	mov r10,r12
	sub r10,r14
	mov qword [rsp+8*226],r15
	mov r15, qword [rsp+8*231]
	mov qword [rsp+8*227],r11
	mov r11, qword [gbl+8*9]
	mov r15,r11
	mov qword [rsp+8*225],r13
	mov r13, qword [gbl+8*11]
	add r15,r13
	mov qword [rsp+8*221],r8
	mov r8, qword [rsp+8*232]
	mov qword [rsp+8*228],r9
	mov r9, qword [gbl+8*3]
	mov r8,r9
	sub r8,r11
	mov qword [rsp+8*230],r10
	mov r10, qword [rsp+8*233]
	mov r10,r8
	add r10,r13
	mov qword [rsp+8*215],r12
	mov r12, qword [rsp+8*234]
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*229],r14
	mov r14, qword [rsp+8*235]
	mov r14,r11
	add r14,r13
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*236]
	mov r9,r12
	sub r9,r14
	mov qword [rsp+8*232],r8
	mov r8, qword [rsp+8*237]
	mov qword [rsp+8*233],r10
	mov r10, qword [gbl+8*3]
	mov r8,r10
	sub r8,r11
	mov qword [rsp+8*231],r15
	mov r15, qword [rsp+8*238]
	mov r15,r8
	add r15,r13
	mov qword [rsp+8*236],r9
	mov r9, qword [rsp+8*239]
	mov r9,r11
	add r9,r13
	mov qword [rsp+8*234],r12
	mov r12, qword [rsp+8*240]
	mov r12,r15
	sub r12,r9
	mov qword [rsp+8*235],r14
	mov r14, qword [rsp+8*241]
	mov r14,r10
	sub r14,r11
	mov qword [rsp+8*237],r8
	mov r8, qword [rsp+8*242]
	mov r8,r14
	add r8,r13
	mov qword [rsp+8*239],r9
	mov r9, qword [rsp+8*243]
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*238],r15
	mov r15, qword [rsp+8*244]
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*236]
	mov r15,r10
	add r15,r9
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*245]
	mov qword [gbl+8*11],r13
	mov r13, qword [gbl+8*9]
	mov r11,r13
	mov qword [rsp+8*241],r14
	mov r14, qword [gbl+8*11]
	add r11,r14
	mov qword [rsp+8*242],r8
	mov r8, qword [rsp+8*246]
	mov qword [rsp+8*240],r12
	mov r12, qword [gbl+8*3]
	mov r8,r12
	sub r8,r13
	mov qword [rsp+8*243],r9
	mov r9, qword [rsp+8*247]
	mov r9,r8
	add r9,r14
	mov qword [rsp+8*236],r10
	mov r10, qword [rsp+8*248]
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*244],r15
	mov r15, qword [rsp+8*249]
	mov r15,r13
	add r15,r14
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*250]
	mov r12,r10
	sub r12,r15
	mov qword [rsp+8*246],r8
	mov r8, qword [rsp+8*251]
	mov qword [rsp+8*247],r9
	mov r9, qword [gbl+8*3]
	mov r8,r9
	sub r8,r13
	mov qword [rsp+8*245],r11
	mov r11, qword [rsp+8*252]
	mov r11,r8
	add r11,r14
	mov qword [rsp+8*248],r10
	mov r10, qword [rsp+8*253]
	mov r10,r13
	add r10,r14
	mov qword [rsp+8*250],r12
	mov r12, qword [rsp+8*254]
	mov r12,r11
	sub r12,r10
	mov qword [rsp+8*249],r15
	mov r15, qword [rsp+8*255]
	mov r15,r9
	sub r15,r13
	mov qword [rsp+8*251],r8
	mov r8, qword [rsp+8*256]
	mov r8,r15
	add r8,r14
	mov qword [rsp+8*253],r10
	mov r10, qword [rsp+8*257]
	mov r10,r12
	add r10,r8
	mov qword [rsp+8*252],r11
	mov r11, qword [rsp+8*258]
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*250]
	mov r11,r9
	add r11,r10
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*259]
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*244]
	mov r13,r14
	sub r13,r11
	mov qword [rsp+8*255],r15
	mov r15, qword [rsp+8*260]
	mov qword [rsp+8*256],r8
	mov r8, qword [rsp+8*230]
	mov r15,r8
	sub r15,r13
	mov qword [rsp+8*254],r12
	mov r12, qword [rsp+8*261]
	mov qword [rsp+8*250],r9
	mov r9, qword [rsp+8*198]
	mov r12,r9
	add r12,r15
	mov qword [rsp+8*257],r10
	mov r10, qword [rsp+8*262]
	mov qword [rsp+8*258],r11
	mov r11, qword [rsp+8*137]
	mov r10,r11
	sub r10,r12
	mov qword [rsp+8*244],r14
	mov r14, qword [gbl+8*9]
	mov r14,r10
	mov qword [rsp+8*230],r8
	mov r8, qword [rsp+8*263]
	mov qword [rsp+8*259],r13
	mov r13, qword [gbl+8*3]
	mov r8,r13
	sub r8,r14
	mov qword [rsp+8*198],r9
	mov r9, qword [rsp+8*264]
	mov r9,r8
	mov qword [rsp+8*260],r15
	mov r15, qword [gbl+8*11]
	add r9,r15
	mov qword [rsp+8*137],r11
	mov r11, qword [rsp+8*265]
	mov r11,r14
	add r11,r15
	mov qword [rsp+8*261],r12
	mov r12, qword [rsp+8*266]
	mov r12,r9
	sub r12,r11
	mov qword [rsp+8*262],r10
	mov r10, qword [rsp+8*267]
	mov r10,r13
	sub r10,r14
	mov qword [rsp+8*263],r8
	mov r8, qword [rsp+8*268]
	mov r8,r10
	add r8,r15
	mov qword [rsp+8*264],r9
	mov r9, qword [rsp+8*269]
	mov r9,r14
	add r9,r15
	mov qword [rsp+8*265],r11
	mov r11, qword [rsp+8*270]
	mov r11,r8
	sub r11,r9
	mov qword [rsp+8*266],r12
	mov r12, qword [rsp+8*271]
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*266]
	mov r12,r13
	add r12,r11
	mov qword [rsp+8*267],r10
	mov r10, qword [rsp+8*272]
	mov qword [gbl+8*9],r14
	mov r14, qword [gbl+8*3]
	mov r10,r14
	mov qword [gbl+8*11],r15
	mov r15, qword [gbl+8*9]
	sub r10,r15
	mov qword [rsp+8*268],r8
	mov r8, qword [rsp+8*273]
	mov r8,r10
	mov qword [rsp+8*269],r9
	mov r9, qword [gbl+8*11]
	add r8,r9
	mov qword [rsp+8*270],r11
	mov r11, qword [rsp+8*274]
	mov r11,r15
	add r11,r9
	mov qword [rsp+8*271],r12
	mov r12, qword [rsp+8*275]
	mov r12,r8
	sub r12,r11
	mov qword [rsp+8*266],r13
	mov r13, qword [rsp+8*276]
	mov r13,r14
	sub r13,r15
	mov qword [rsp+8*272],r10
	mov r10, qword [rsp+8*277]
	mov r10,r13
	add r10,r9
	mov qword [rsp+8*273],r8
	mov r8, qword [rsp+8*278]
	mov r8,r12
	add r8,r10
	mov qword [rsp+8*274],r11
	mov r11, qword [rsp+8*279]
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*271]
	mov r11,r14
	add r11,r8
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*280]
	mov qword [gbl+8*11],r9
	mov r9, qword [gbl+8*9]
	mov r15,r9
	mov qword [rsp+8*276],r13
	mov r13, qword [gbl+8*11]
	add r15,r13
	mov qword [rsp+8*277],r10
	mov r10, qword [rsp+8*281]
	mov qword [rsp+8*275],r12
	mov r12, qword [gbl+8*3]
	mov r10,r12
	sub r10,r9
	mov qword [rsp+8*278],r8
	mov r8, qword [rsp+8*282]
	mov r8,r10
	add r8,r13
	mov qword [rsp+8*279],r11
	mov r11, qword [rsp+8*283]
	mov r11,r15
	add r11,r8
	mov qword [rsp+8*271],r14
	mov r14, qword [rsp+8*284]
	mov r14,r9
	add r14,r13
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*285]
	mov r12,r11
	sub r12,r14
	mov qword [rsp+8*281],r10
	mov r10, qword [rsp+8*286]
	mov qword [rsp+8*282],r8
	mov r8, qword [gbl+8*3]
	mov r10,r8
	sub r10,r9
	mov qword [rsp+8*280],r15
	mov r15, qword [rsp+8*287]
	mov r15,r10
	add r15,r13
	mov qword [rsp+8*283],r11
	mov r11, qword [rsp+8*288]
	mov r11,r9
	add r11,r13
	mov qword [rsp+8*285],r12
	mov r12, qword [rsp+8*289]
	mov r12,r15
	sub r12,r11
	mov qword [rsp+8*284],r14
	mov r14, qword [rsp+8*290]
	mov r14,r8
	sub r14,r9
	mov qword [rsp+8*286],r10
	mov r10, qword [rsp+8*291]
	mov r10,r14
	add r10,r13
	mov qword [rsp+8*288],r11
	mov r11, qword [rsp+8*292]
	mov r11,r12
	add r11,r10
	mov qword [rsp+8*287],r15
	mov r15, qword [rsp+8*293]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*285]
	mov r15,r8
	add r15,r11
	mov qword [gbl+8*9],r9
	mov r9, qword [rsp+8*294]
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*279]
	mov r9,r13
	sub r9,r15
	mov qword [rsp+8*290],r14
	mov r14, qword [rsp+8*295]
	mov qword [rsp+8*291],r10
	mov r10, qword [gbl+8*9]
	mov r14,r10
	mov qword [rsp+8*289],r12
	mov r12, qword [gbl+8*11]
	add r14,r12
	mov qword [rsp+8*285],r8
	mov r8, qword [rsp+8*296]
	mov qword [rsp+8*292],r11
	mov r11, qword [gbl+8*3]
	mov r8,r11
	sub r8,r10
	mov qword [rsp+8*294],r9
	mov r9, qword [rsp+8*297]
	mov r9,r8
	add r9,r12
	mov qword [rsp+8*279],r13
	mov r13, qword [rsp+8*298]
	mov r13,r14
	add r13,r9
	mov qword [rsp+8*293],r15
	mov r15, qword [rsp+8*299]
	mov r15,r10
	add r15,r12
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*300]
	mov qword [rsp+8*296],r8
	mov r8, qword [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*297],r9
	mov r9, qword [rsp+8*301]
	mov r9,r11
	add r9,r12
	mov qword [rsp+8*298],r13
	mov r13, qword [rsp+8*302]
	mov r13,r15
	add r13,r9
	mov qword [rsp+8*295],r14
	mov r14, qword [rsp+8*303]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*298]
	mov r14,r8
	sub r14,r13
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*304]
	mov qword [rsp+8*300],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	add r10,r12
	mov qword [rsp+8*301],r9
	mov r9, qword [rsp+8*305]
	mov qword [rsp+8*299],r15
	mov r15, qword [gbl+8*3]
	mov r9,r15
	sub r9,r11
	mov qword [rsp+8*298],r8
	mov r8, qword [rsp+8*306]
	mov r8,r9
	add r8,r12
	mov qword [rsp+8*302],r13
	mov r13, qword [rsp+8*307]
	mov r13,r10
	add r13,r8
	mov qword [rsp+8*303],r14
	mov r14, qword [rsp+8*308]
	mov r14,r11
	add r14,r12
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*309]
	mov r15,r13
	sub r15,r14
	mov qword [rsp+8*305],r9
	mov r9, qword [rsp+8*310]
	mov qword [rsp+8*306],r8
	mov r8, qword [rsp+8*303]
	mov r9,r8
	sub r9,r15
	mov qword [rsp+8*304],r10
	mov r10, qword [rsp+8*311]
	mov qword [gbl+8*9],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*307],r13
	mov r13, qword [rsp+8*312]
	mov r13,r10
	mov qword [rsp+8*308],r14
	mov r14, qword [gbl+8*11]
	add r13,r14
	mov qword [rsp+8*303],r8
	mov r8, qword [rsp+8*313]
	mov r8,r12
	add r8,r14
	mov qword [rsp+8*310],r9
	mov r9, qword [rsp+8*314]
	mov r9,r13
	sub r9,r8
	mov qword [rsp+8*309],r15
	mov r15, qword [rsp+8*315]
	mov r15,r11
	sub r15,r12
	mov qword [rsp+8*311],r10
	mov r10, qword [rsp+8*316]
	mov r10,r15
	add r10,r14
	mov qword [rsp+8*313],r8
	mov r8, qword [rsp+8*317]
	mov r8,r9
	add r8,r10
	mov qword [rsp+8*312],r13
	mov r13, qword [rsp+8*318]
	mov r13,r12
	add r13,r14
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*319]
	mov qword [rsp+8*315],r15
	mov r15, qword [gbl+8*3]
	mov r11,r15
	sub r11,r12
	mov qword [rsp+8*317],r8
	mov r8, qword [rsp+8*320]
	mov r8,r11
	add r8,r14
	mov qword [rsp+8*314],r9
	mov r9, qword [rsp+8*321]
	mov r9,r13
	add r9,r8
	mov qword [rsp+8*316],r10
	mov r10, qword [rsp+8*322]
	mov r10,r12
	add r10,r14
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*323]
	mov r15,r9
	sub r15,r10
	mov qword [rsp+8*319],r11
	mov r11, qword [rsp+8*324]
	mov qword [rsp+8*320],r8
	mov r8, qword [rsp+8*317]
	mov r11,r8
	sub r11,r15
	mov qword [rsp+8*318],r13
	mov r13, qword [rsp+8*325]
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*310]
	mov r13,r12
	add r13,r11
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*326]
	mov qword [rsp+8*321],r9
	mov r9, qword [rsp+8*294]
	mov r14,r9
	sub r14,r13
	mov qword [rsp+8*322],r10
	mov r10, qword [rsp+8*327]
	mov qword [rsp+8*317],r8
	mov r8, qword [gbl+8*3]
	mov r10,r8
	mov qword [rsp+8*323],r15
	mov r15, qword [gbl+8*9]
	sub r10,r15
	mov qword [rsp+8*324],r11
	mov r11, qword [rsp+8*328]
	mov r11,r10
	mov qword [rsp+8*310],r12
	mov r12, qword [gbl+8*11]
	add r11,r12
	mov qword [rsp+8*294],r9
	mov r9, qword [rsp+8*329]
	mov r9,r15
	add r9,r12
	mov qword [rsp+8*325],r13
	mov r13, qword [rsp+8*330]
	mov r13,r11
	sub r13,r9
	mov qword [rsp+8*326],r14
	mov r14, qword [rsp+8*331]
	mov r14,r8
	sub r14,r15
	mov qword [rsp+8*327],r10
	mov r10, qword [rsp+8*332]
	mov r10,r14
	add r10,r12
	mov qword [rsp+8*329],r9
	mov r9, qword [rsp+8*333]
	mov r9,r15
	add r9,r12
	mov qword [rsp+8*328],r11
	mov r11, qword [rsp+8*334]
	mov r11,r10
	sub r11,r9
	mov qword [rsp+8*330],r13
	mov r13, qword [rsp+8*335]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*330]
	mov r13,r8
	add r13,r11
	mov qword [rsp+8*331],r14
	mov r14, qword [rsp+8*336]
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*3]
	mov r14,r12
	sub r14,r15
	mov qword [rsp+8*333],r9
	mov r9, qword [rsp+8*337]
	mov r9,r14
	mov qword [rsp+8*332],r10
	mov r10, qword [gbl+8*11]
	add r9,r10
	mov qword [rsp+8*330],r8
	mov r8, qword [rsp+8*338]
	mov r8,r15
	add r8,r10
	mov qword [rsp+8*334],r11
	mov r11, qword [rsp+8*339]
	mov r11,r9
	sub r11,r8
	mov qword [rsp+8*335],r13
	mov r13, qword [rsp+8*340]
	mov r13,r12
	sub r13,r15
	mov qword [rsp+8*336],r14
	mov r14, qword [rsp+8*341]
	mov r14,r13
	add r14,r10
	mov qword [rsp+8*338],r8
	mov r8, qword [rsp+8*342]
	mov r8,r11
	add r8,r14
	mov qword [rsp+8*337],r9
	mov r9, qword [rsp+8*343]
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*335]
	mov r9,r12
	add r9,r8
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*344]
	mov qword [gbl+8*11],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [rsp+8*340],r13
	mov r13, qword [gbl+8*11]
	add r15,r13
	mov qword [rsp+8*339],r11
	mov r11, qword [rsp+8*345]
	mov qword [rsp+8*341],r14
	mov r14, qword [gbl+8*3]
	mov r11,r14
	sub r11,r10
	mov qword [rsp+8*342],r8
	mov r8, qword [rsp+8*346]
	mov r8,r11
	add r8,r13
	mov qword [rsp+8*343],r9
	mov r9, qword [rsp+8*347]
	mov r9,r15
	add r9,r8
	mov qword [rsp+8*335],r12
	mov r12, qword [rsp+8*348]
	mov r12,r10
	add r12,r13
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*349]
	mov r14,r9
	sub r14,r12
	mov qword [rsp+8*345],r11
	mov r11, qword [rsp+8*350]
	mov qword [rsp+8*346],r8
	mov r8, qword [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*344],r15
	mov r15, qword [rsp+8*351]
	mov r15,r11
	add r15,r13
	mov qword [rsp+8*347],r9
	mov r9, qword [rsp+8*352]
	mov r9,r10
	add r9,r13
	mov qword [rsp+8*348],r12
	mov r12, qword [rsp+8*353]
	mov r12,r15
	sub r12,r9
	mov qword [rsp+8*349],r14
	mov r14, qword [rsp+8*354]
	mov r14,r8
	sub r14,r10
	mov qword [rsp+8*350],r11
	mov r11, qword [rsp+8*355]
	mov r11,r14
	add r11,r13
	mov qword [rsp+8*352],r9
	mov r9, qword [rsp+8*356]
	mov r9,r12
	add r9,r11
	mov qword [rsp+8*351],r15
	mov r15, qword [rsp+8*357]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*349]
	mov r15,r8
	add r15,r9
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*358]
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*343]
	mov r10,r13
	sub r10,r15
	mov qword [rsp+8*354],r14
	mov r14, qword [rsp+8*359]
	mov qword [rsp+8*355],r11
	mov r11, qword [gbl+8*9]
	mov r14,r11
	mov qword [rsp+8*353],r12
	mov r12, qword [gbl+8*11]
	add r14,r12
	mov qword [rsp+8*349],r8
	mov r8, qword [rsp+8*360]
	mov qword [rsp+8*356],r9
	mov r9, qword [gbl+8*3]
	mov r8,r9
	sub r8,r11
	mov qword [rsp+8*358],r10
	mov r10, qword [rsp+8*361]
	mov r10,r8
	add r10,r12
	mov qword [rsp+8*343],r13
	mov r13, qword [rsp+8*362]
	mov r13,r14
	add r13,r10
	mov qword [rsp+8*357],r15
	mov r15, qword [rsp+8*363]
	mov r15,r11
	add r15,r12
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*364]
	mov r9,r13
	sub r9,r15
	mov qword [rsp+8*360],r8
	mov r8, qword [rsp+8*365]
	mov qword [rsp+8*361],r10
	mov r10, qword [gbl+8*3]
	mov r8,r10
	sub r8,r11
	mov qword [rsp+8*359],r14
	mov r14, qword [rsp+8*366]
	mov r14,r8
	add r14,r12
	mov qword [rsp+8*364],r9
	mov r9, qword [rsp+8*367]
	mov r9,r11
	add r9,r12
	mov qword [rsp+8*362],r13
	mov r13, qword [rsp+8*368]
	mov r13,r14
	sub r13,r9
	mov qword [rsp+8*363],r15
	mov r15, qword [rsp+8*369]
	mov r15,r10
	sub r15,r11
	mov qword [rsp+8*365],r8
	mov r8, qword [rsp+8*370]
	mov r8,r15
	add r8,r12
	mov qword [rsp+8*367],r9
	mov r9, qword [rsp+8*371]
	mov r9,r13
	add r9,r8
	mov qword [rsp+8*366],r14
	mov r14, qword [rsp+8*372]
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*364]
	mov r14,r10
	add r14,r9
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*373]
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [rsp+8*369],r15
	mov r15, qword [gbl+8*11]
	add r11,r15
	mov qword [rsp+8*370],r8
	mov r8, qword [rsp+8*374]
	mov qword [rsp+8*368],r13
	mov r13, qword [gbl+8*3]
	mov r8,r13
	sub r8,r12
	mov qword [rsp+8*371],r9
	mov r9, qword [rsp+8*375]
	mov r9,r8
	add r9,r15
	mov qword [rsp+8*364],r10
	mov r10, qword [rsp+8*376]
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*372],r14
	mov r14, qword [rsp+8*377]
	mov r14,r12
	add r14,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*378]
	mov r13,r10
	sub r13,r14
	mov qword [rsp+8*374],r8
	mov r8, qword [rsp+8*379]
	mov qword [rsp+8*375],r9
	mov r9, qword [gbl+8*3]
	mov r8,r9
	sub r8,r12
	mov qword [rsp+8*373],r11
	mov r11, qword [rsp+8*380]
	mov r11,r8
	add r11,r15
	mov qword [rsp+8*376],r10
	mov r10, qword [rsp+8*381]
	mov r10,r12
	add r10,r15
	mov qword [rsp+8*378],r13
	mov r13, qword [rsp+8*382]
	mov r13,r11
	sub r13,r10
	mov qword [rsp+8*377],r14
	mov r14, qword [rsp+8*383]
	mov r14,r9
	sub r14,r12
	mov qword [rsp+8*379],r8
	mov r8, qword [rsp+8*384]
	mov r8,r14
	add r8,r15
	mov qword [rsp+8*381],r10
	mov r10, qword [rsp+8*385]
	mov r10,r13
	add r10,r8
	mov qword [rsp+8*380],r11
	mov r11, qword [rsp+8*386]
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*378]
	mov r11,r9
	add r11,r10
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*387]
	mov qword [rsp+8*383],r14
	mov r14, qword [rsp+8*372]
	mov r12,r14
	sub r12,r11
	mov qword [gbl+8*11],r15
	mov r15, qword [rsp+8*388]
	mov qword [rsp+8*384],r8
	mov r8, qword [rsp+8*358]
	mov r15,r8
	sub r15,r12
	mov qword [rsp+8*382],r13
	mov r13, qword [rsp+8*389]
	mov qword [rsp+8*378],r9
	mov r9, qword [rsp+8*326]
	mov r13,r9
	add r13,r15
	mov qword [rsp+8*385],r10
	mov r10, qword [rsp+8*390]
	mov qword [rsp+8*386],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [rsp+8*372],r14
	mov r14, qword [gbl+8*11]
	add r10,r14
	mov qword [rsp+8*358],r8
	mov r8, qword [rsp+8*391]
	mov qword [rsp+8*387],r12
	mov r12, qword [gbl+8*3]
	mov r8,r12
	sub r8,r11
	mov qword [rsp+8*326],r9
	mov r9, qword [rsp+8*392]
	mov r9,r8
	add r9,r14
	mov qword [rsp+8*389],r13
	mov r13, qword [rsp+8*393]
	mov r13,r10
	add r13,r9
	mov qword [rsp+8*388],r15
	mov r15, qword [rsp+8*394]
	mov r15,r11
	add r15,r14
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*395]
	mov qword [rsp+8*391],r8
	mov r8, qword [gbl+8*3]
	mov r12,r8
	sub r12,r11
	mov qword [rsp+8*392],r9
	mov r9, qword [rsp+8*396]
	mov r9,r12
	add r9,r14
	mov qword [rsp+8*390],r10
	mov r10, qword [rsp+8*397]
	mov r10,r15
	add r10,r9
	mov qword [rsp+8*393],r13
	mov r13, qword [rsp+8*398]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*393]
	mov r13,r8
	sub r13,r10
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*399]
	mov qword [rsp+8*395],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	add r11,r14
	mov qword [rsp+8*396],r9
	mov r9, qword [rsp+8*400]
	mov qword [rsp+8*394],r15
	mov r15, qword [gbl+8*3]
	mov r9,r15
	sub r9,r12
	mov qword [rsp+8*393],r8
	mov r8, qword [rsp+8*401]
	mov r8,r9
	add r8,r14
	mov qword [rsp+8*397],r10
	mov r10, qword [rsp+8*402]
	mov r10,r11
	add r10,r8
	mov qword [rsp+8*398],r13
	mov r13, qword [rsp+8*403]
	mov r13,r12
	add r13,r14
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*404]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*400],r9
	mov r9, qword [rsp+8*405]
	mov qword [rsp+8*401],r8
	mov r8, qword [rsp+8*398]
	mov r9,r8
	sub r9,r15
	mov qword [rsp+8*399],r11
	mov r11, qword [rsp+8*406]
	mov qword [gbl+8*9],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r11,r14
	mov qword [rsp+8*402],r10
	mov r10, qword [rsp+8*407]
	mov r10,r11
	mov qword [rsp+8*403],r13
	mov r13, qword [gbl+8*11]
	add r10,r13
	mov qword [rsp+8*398],r8
	mov r8, qword [rsp+8*408]
	mov r8,r14
	add r8,r13
	mov qword [rsp+8*405],r9
	mov r9, qword [rsp+8*409]
	mov r9,r10
	sub r9,r8
	mov qword [rsp+8*404],r15
	mov r15, qword [rsp+8*410]
	mov r15,r12
	sub r15,r14
	mov qword [rsp+8*406],r11
	mov r11, qword [rsp+8*411]
	mov r11,r15
	add r11,r13
	mov qword [rsp+8*408],r8
	mov r8, qword [rsp+8*412]
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*407],r10
	mov r10, qword [rsp+8*413]
	mov r10,r14
	add r10,r13
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*414]
	mov qword [rsp+8*410],r15
	mov r15, qword [gbl+8*3]
	mov r12,r15
	sub r12,r14
	mov qword [rsp+8*412],r8
	mov r8, qword [rsp+8*415]
	mov r8,r12
	add r8,r13
	mov qword [rsp+8*409],r9
	mov r9, qword [rsp+8*416]
	mov r9,r10
	add r9,r8
	mov qword [rsp+8*411],r11
	mov r11, qword [rsp+8*417]
	mov r11,r14
	add r11,r13
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*418]
	mov r15,r9
	sub r15,r11
	mov qword [rsp+8*414],r12
	mov r12, qword [rsp+8*419]
	mov qword [rsp+8*415],r8
	mov r8, qword [rsp+8*412]
	mov r12,r8
	sub r12,r15
	mov qword [rsp+8*413],r10
	mov r10, qword [rsp+8*420]
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*405]
	mov r10,r13
	add r10,r12
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*421]
	mov qword [rsp+8*416],r9
	mov r9, qword [gbl+8*3]
	mov r14,r9
	mov qword [rsp+8*417],r11
	mov r11, qword [gbl+8*9]
	sub r14,r11
	mov qword [rsp+8*412],r8
	mov r8, qword [rsp+8*422]
	mov r8,r14
	mov qword [rsp+8*418],r15
	mov r15, qword [gbl+8*11]
	add r8,r15
	mov qword [rsp+8*420],r10
	mov r10, qword [rsp+8*423]
	mov r10,r11
	add r10,r15
	mov qword [rsp+8*419],r12
	mov r12, qword [rsp+8*424]
	mov r12,r8
	sub r12,r10
	mov qword [rsp+8*405],r13
	mov r13, qword [rsp+8*425]
	mov r13,r9
	sub r13,r11
	mov qword [rsp+8*421],r14
	mov r14, qword [rsp+8*426]
	mov r14,r13
	add r14,r15
	mov qword [rsp+8*422],r8
	mov r8, qword [rsp+8*427]
	mov r8,r12
	add r8,r14
	mov qword [rsp+8*423],r10
	mov r10, qword [rsp+8*428]
	mov r10,r11
	add r10,r15
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*429]
	mov qword [rsp+8*425],r13
	mov r13, qword [gbl+8*3]
	mov r9,r13
	sub r9,r11
	mov qword [rsp+8*427],r8
	mov r8, qword [rsp+8*430]
	mov r8,r9
	add r8,r15
	mov qword [rsp+8*424],r12
	mov r12, qword [rsp+8*431]
	mov r12,r10
	add r12,r8
	mov qword [rsp+8*426],r14
	mov r14, qword [rsp+8*432]
	mov r14,r11
	add r14,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*433]
	mov r13,r12
	sub r13,r14
	mov qword [rsp+8*429],r9
	mov r9, qword [rsp+8*434]
	mov qword [rsp+8*430],r8
	mov r8, qword [rsp+8*427]
	mov r9,r8
	sub r9,r13
	mov qword [rsp+8*428],r10
	mov r10, qword [rsp+8*435]
	mov qword [gbl+8*9],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [gbl+8*11],r15
	mov r15, qword [gbl+8*9]
	sub r10,r15
	mov qword [rsp+8*431],r12
	mov r12, qword [rsp+8*436]
	mov r12,r10
	mov qword [rsp+8*432],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*427],r8
	mov r8, qword [rsp+8*437]
	mov r8,r15
	add r8,r14
	mov qword [rsp+8*434],r9
	mov r9, qword [rsp+8*438]
	mov r9,r12
	sub r9,r8
	mov qword [rsp+8*433],r13
	mov r13, qword [rsp+8*439]
	mov r13,r11
	sub r13,r15
	mov qword [rsp+8*435],r10
	mov r10, qword [rsp+8*440]
	mov r10,r13
	add r10,r14
	mov qword [rsp+8*437],r8
	mov r8, qword [rsp+8*441]
	mov r8,r9
	add r8,r10
	mov qword [rsp+8*436],r12
	mov r12, qword [rsp+8*442]
	mov r12,r15
	add r12,r14
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*443]
	mov qword [rsp+8*439],r13
	mov r13, qword [gbl+8*3]
	mov r11,r13
	sub r11,r15
	mov qword [rsp+8*441],r8
	mov r8, qword [rsp+8*444]
	mov r8,r11
	add r8,r14
	mov qword [rsp+8*438],r9
	mov r9, qword [rsp+8*445]
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*440],r10
	mov r10, qword [rsp+8*446]
	mov r10,r15
	add r10,r14
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*447]
	mov r13,r9
	sub r13,r10
	mov qword [rsp+8*443],r11
	mov r11, qword [rsp+8*448]
	mov qword [rsp+8*444],r8
	mov r8, qword [rsp+8*441]
	mov r11,r8
	sub r11,r13
	mov qword [rsp+8*442],r12
	mov r12, qword [rsp+8*449]
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*434]
	mov r12,r14
	add r12,r11
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*450]
	mov qword [rsp+8*445],r9
	mov r9, qword [rsp+8*420]
	mov r15,r9
	add r15,r12
	mov qword [rsp+8*446],r10
	mov r10, qword [rsp+8*451]
	mov qword [rsp+8*441],r8
	mov r8, qword [gbl+8*3]
	mov r10,r8
	mov qword [rsp+8*447],r13
	mov r13, qword [gbl+8*9]
	sub r10,r13
	mov qword [rsp+8*448],r11
	mov r11, qword [rsp+8*452]
	mov r11,r10
	mov qword [rsp+8*434],r14
	mov r14, qword [gbl+8*11]
	add r11,r14
	mov qword [rsp+8*420],r9
	mov r9, qword [rsp+8*453]
	mov r9,r13
	add r9,r14
	mov qword [rsp+8*449],r12
	mov r12, qword [rsp+8*454]
	mov r12,r11
	sub r12,r9
	mov qword [rsp+8*450],r15
	mov r15, qword [rsp+8*455]
	mov r15,r8
	sub r15,r13
	mov qword [rsp+8*451],r10
	mov r10, qword [rsp+8*456]
	mov r10,r15
	add r10,r14
	mov qword [rsp+8*453],r9
	mov r9, qword [rsp+8*457]
	mov r9,r13
	add r9,r14
	mov qword [rsp+8*452],r11
	mov r11, qword [rsp+8*458]
	mov r11,r10
	sub r11,r9
	mov qword [rsp+8*454],r12
	mov r12, qword [rsp+8*459]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*454]
	mov r12,r8
	add r12,r11
	mov qword [rsp+8*455],r15
	mov r15, qword [rsp+8*460]
	mov qword [gbl+8*9],r13
	mov r13, qword [gbl+8*3]
	mov r15,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r15,r14
	mov qword [rsp+8*457],r9
	mov r9, qword [rsp+8*461]
	mov r9,r15
	mov qword [rsp+8*456],r10
	mov r10, qword [gbl+8*11]
	add r9,r10
	mov qword [rsp+8*454],r8
	mov r8, qword [rsp+8*462]
	mov r8,r14
	add r8,r10
	mov qword [rsp+8*458],r11
	mov r11, qword [rsp+8*463]
	mov r11,r9
	sub r11,r8
	mov qword [rsp+8*459],r12
	mov r12, qword [rsp+8*464]
	mov r12,r13
	sub r12,r14
	mov qword [rsp+8*460],r15
	mov r15, qword [rsp+8*465]
	mov r15,r12
	add r15,r10
	mov qword [rsp+8*462],r8
	mov r8, qword [rsp+8*466]
	mov r8,r11
	add r8,r15
	mov qword [rsp+8*461],r9
	mov r9, qword [rsp+8*467]
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*459]
	mov r9,r13
	add r9,r8
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*468]
	mov qword [gbl+8*11],r10
	mov r10, qword [gbl+8*9]
	mov r14,r10
	mov qword [rsp+8*464],r12
	mov r12, qword [gbl+8*11]
	add r14,r12
	mov qword [rsp+8*463],r11
	mov r11, qword [rsp+8*469]
	mov qword [rsp+8*465],r15
	mov r15, qword [gbl+8*3]
	mov r11,r15
	sub r11,r10
	mov qword [rsp+8*466],r8
	mov r8, qword [rsp+8*470]
	mov r8,r11
	add r8,r12
	mov qword [rsp+8*467],r9
	mov r9, qword [rsp+8*471]
	mov r9,r14
	add r9,r8
	mov qword [rsp+8*459],r13
	mov r13, qword [rsp+8*472]
	mov r13,r10
	add r13,r12
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*473]
	mov r15,r9
	sub r15,r13
	mov qword [rsp+8*469],r11
	mov r11, qword [rsp+8*474]
	mov qword [rsp+8*470],r8
	mov r8, qword [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*468],r14
	mov r14, qword [rsp+8*475]
	mov r14,r11
	add r14,r12
	mov qword [rsp+8*471],r9
	mov r9, qword [rsp+8*476]
	mov r9,r10
	add r9,r12
	mov qword [rsp+8*472],r13
	mov r13, qword [rsp+8*477]
	mov r13,r14
	sub r13,r9
	mov qword [rsp+8*473],r15
	mov r15, qword [rsp+8*478]
	mov r15,r8
	sub r15,r10
	mov qword [rsp+8*474],r11
	mov r11, qword [rsp+8*479]
	mov r11,r15
	add r11,r12
	mov qword [rsp+8*476],r9
	mov r9, qword [rsp+8*480]
	mov r9,r13
	add r9,r11
	mov qword [rsp+8*475],r14
	mov r14, qword [rsp+8*481]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*473]
	mov r14,r8
	add r14,r9
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*482]
	mov qword [gbl+8*11],r12
	mov r12, qword [rsp+8*467]
	mov r10,r12
	sub r10,r14
	mov qword [rsp+8*478],r15
	mov r15, qword [rsp+8*483]
	mov qword [rsp+8*479],r11
	mov r11, qword [gbl+8*9]
	mov r15,r11
	mov qword [rsp+8*477],r13
	mov r13, qword [gbl+8*11]
	add r15,r13
	mov qword [rsp+8*473],r8
	mov r8, qword [rsp+8*484]
	mov qword [rsp+8*480],r9
	mov r9, qword [gbl+8*3]
	mov r8,r9
	sub r8,r11
	mov qword [rsp+8*482],r10
	mov r10, qword [rsp+8*485]
	mov r10,r8
	add r10,r13
	mov qword [rsp+8*467],r12
	mov r12, qword [rsp+8*486]
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*481],r14
	mov r14, qword [rsp+8*487]
	mov r14,r11
	add r14,r13
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*488]
	mov r9,r12
	sub r9,r14
	mov qword [rsp+8*484],r8
	mov r8, qword [rsp+8*489]
	mov qword [rsp+8*485],r10
	mov r10, qword [gbl+8*3]
	mov r8,r10
	sub r8,r11
	mov qword [rsp+8*483],r15
	mov r15, qword [rsp+8*490]
	mov r15,r8
	add r15,r13
	mov qword [rsp+8*488],r9
	mov r9, qword [rsp+8*491]
	mov r9,r11
	add r9,r13
	mov qword [rsp+8*486],r12
	mov r12, qword [rsp+8*492]
	mov r12,r15
	sub r12,r9
	mov qword [rsp+8*487],r14
	mov r14, qword [rsp+8*493]
	mov r14,r10
	sub r14,r11
	mov qword [rsp+8*489],r8
	mov r8, qword [rsp+8*494]
	mov r8,r14
	add r8,r13
	mov qword [rsp+8*491],r9
	mov r9, qword [rsp+8*495]
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*490],r15
	mov r15, qword [rsp+8*496]
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*488]
	mov r15,r10
	add r15,r9
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*497]
	mov qword [gbl+8*11],r13
	mov r13, qword [gbl+8*9]
	mov r11,r13
	mov qword [rsp+8*493],r14
	mov r14, qword [gbl+8*11]
	add r11,r14
	mov qword [rsp+8*494],r8
	mov r8, qword [rsp+8*498]
	mov qword [rsp+8*492],r12
	mov r12, qword [gbl+8*3]
	mov r8,r12
	sub r8,r13
	mov qword [rsp+8*495],r9
	mov r9, qword [rsp+8*499]
	mov r9,r8
	add r9,r14
	mov qword [rsp+8*488],r10
	mov r10, qword [rsp+8*500]
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*496],r15
	mov r15, qword [rsp+8*501]
	mov r15,r13
	add r15,r14
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*502]
	mov r12,r10
	sub r12,r15
	mov qword [rsp+8*498],r8
	mov r8, qword [rsp+8*503]
	mov qword [rsp+8*499],r9
	mov r9, qword [gbl+8*3]
	mov r8,r9
	sub r8,r13
	mov qword [rsp+8*497],r11
	mov r11, qword [rsp+8*504]
	mov r11,r8
	add r11,r14
	mov qword [rsp+8*500],r10
	mov r10, qword [rsp+8*505]
	mov r10,r13
	add r10,r14
	mov qword [rsp+8*502],r12
	mov r12, qword [rsp+8*506]
	mov r12,r11
	sub r12,r10
	mov qword [rsp+8*501],r15
	mov r15, qword [rsp+8*507]
	mov r15,r9
	sub r15,r13
	mov qword [rsp+8*503],r8
	mov r8, qword [rsp+8*508]
	mov r8,r15
	add r8,r14
	mov qword [rsp+8*505],r10
	mov r10, qword [rsp+8*509]
	mov r10,r12
	add r10,r8
	mov qword [rsp+8*504],r11
	mov r11, qword [rsp+8*510]
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*502]
	mov r11,r9
	add r11,r10
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*511]
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*496]
	mov r13,r14
	sub r13,r11
	mov qword [rsp+8*507],r15
	mov r15, qword [rsp+8*512]
	mov qword [rsp+8*508],r8
	mov r8, qword [rsp+8*482]
	mov r15,r8
	sub r15,r13
	mov qword [rsp+8*506],r12
	mov r12, qword [rsp+8*513]
	mov qword [rsp+8*502],r9
	mov r9, qword [rsp+8*450]
	mov r12,r9
	add r12,r15
	mov qword [rsp+8*509],r10
	mov r10, qword [rsp+8*514]
	mov qword [rsp+8*510],r11
	mov r11, qword [rsp+8*389]
	mov r10,r11
	sub r10,r12
	mov qword [rsp+8*496],r14
	mov r14, qword [gbl+8*11]
	mov r14,r10
	mov qword [rsp+8*482],r8
	mov r8, qword [rsp+8*515]
	mov qword [rsp+8*511],r13
	mov r13, qword [gbl+8*3]
	mov r8,r13
	mov qword [rsp+8*450],r9
	mov r9, qword [gbl+8*9]
	sub r8,r9
	mov qword [rsp+8*512],r15
	mov r15, qword [rsp+8*516]
	mov r15,r8
	add r15,r14
	mov qword [rsp+8*389],r11
	mov r11, qword [rsp+8*517]
	mov r11,r9
	add r11,r14
	mov qword [rsp+8*513],r12
	mov r12, qword [rsp+8*518]
	mov r12,r15
	sub r12,r11
	mov qword [rsp+8*514],r10
	mov r10, qword [rsp+8*519]
	mov r10,r13
	sub r10,r9
	mov qword [rsp+8*515],r8
	mov r8, qword [rsp+8*520]
	mov r8,r10
	add r8,r14
	mov qword [rsp+8*517],r11
	mov r11, qword [rsp+8*521]
	mov r11,r9
	add r11,r14
	mov qword [rsp+8*518],r12
	mov r12, qword [rsp+8*522]
	mov r12,r8
	sub r12,r11
	mov qword [rsp+8*516],r15
	mov r15, qword [rsp+8*523]
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*518]
	mov r15,r13
	add r15,r12
	mov qword [rsp+8*519],r10
	mov r10, qword [rsp+8*524]
	mov qword [gbl+8*9],r9
	mov r9, qword [gbl+8*3]
	mov r10,r9
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r10,r14
	mov qword [rsp+8*520],r8
	mov r8, qword [rsp+8*525]
	mov r8,r10
	mov qword [rsp+8*521],r11
	mov r11, qword [gbl+8*11]
	add r8,r11
	mov qword [rsp+8*522],r12
	mov r12, qword [rsp+8*526]
	mov r12,r14
	add r12,r11
	mov qword [rsp+8*518],r13
	mov r13, qword [rsp+8*527]
	mov r13,r8
	sub r13,r12
	mov qword [rsp+8*523],r15
	mov r15, qword [rsp+8*528]
	mov r15,r9
	sub r15,r14
	mov qword [rsp+8*524],r10
	mov r10, qword [rsp+8*529]
	mov r10,r15
	add r10,r11
	mov qword [rsp+8*525],r8
	mov r8, qword [rsp+8*530]
	mov r8,r13
	add r8,r10
	mov qword [rsp+8*526],r12
	mov r12, qword [rsp+8*531]
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*523]
	mov r12,r9
	add r12,r8
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*532]
	mov qword [gbl+8*11],r11
	mov r11, qword [gbl+8*9]
	mov r14,r11
	mov qword [rsp+8*528],r15
	mov r15, qword [gbl+8*11]
	add r14,r15
	mov qword [rsp+8*529],r10
	mov r10, qword [rsp+8*533]
	mov qword [rsp+8*527],r13
	mov r13, qword [gbl+8*3]
	mov r10,r13
	sub r10,r11
	mov qword [rsp+8*530],r8
	mov r8, qword [rsp+8*534]
	mov r8,r10
	add r8,r15
	mov qword [rsp+8*523],r9
	mov r9, qword [rsp+8*535]
	mov r9,r14
	add r9,r8
	mov qword [rsp+8*531],r12
	mov r12, qword [rsp+8*536]
	mov r12,r11
	add r12,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*537]
	mov r13,r9
	sub r13,r12
	mov qword [rsp+8*533],r10
	mov r10, qword [rsp+8*538]
	mov qword [rsp+8*534],r8
	mov r8, qword [gbl+8*3]
	mov r10,r8
	sub r10,r11
	mov qword [rsp+8*532],r14
	mov r14, qword [rsp+8*539]
	mov r14,r10
	add r14,r15
	mov qword [rsp+8*535],r9
	mov r9, qword [rsp+8*540]
	mov r9,r11
	add r9,r15
	mov qword [rsp+8*536],r12
	mov r12, qword [rsp+8*541]
	mov r12,r14
	sub r12,r9
	mov qword [rsp+8*537],r13
	mov r13, qword [rsp+8*542]
	mov r13,r8
	sub r13,r11
	mov qword [rsp+8*538],r10
	mov r10, qword [rsp+8*543]
	mov r10,r13
	add r10,r15
	mov qword [rsp+8*540],r9
	mov r9, qword [rsp+8*544]
	mov r9,r12
	add r9,r10
	mov qword [rsp+8*539],r14
	mov r14, qword [rsp+8*545]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*537]
	mov r14,r8
	add r14,r9
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*546]
	mov qword [rsp+8*542],r13
	mov r13, qword [rsp+8*531]
	mov r11,r13
	sub r11,r14
	mov qword [gbl+8*11],r15
	mov r15, qword [rsp+8*547]
	mov qword [rsp+8*543],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [rsp+8*541],r12
	mov r12, qword [gbl+8*11]
	add r15,r12
	mov qword [rsp+8*537],r8
	mov r8, qword [rsp+8*548]
	mov qword [rsp+8*544],r9
	mov r9, qword [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*546],r11
	mov r11, qword [rsp+8*549]
	mov r11,r8
	add r11,r12
	mov qword [rsp+8*531],r13
	mov r13, qword [rsp+8*550]
	mov r13,r15
	add r13,r11
	mov qword [rsp+8*545],r14
	mov r14, qword [rsp+8*551]
	mov r14,r10
	add r14,r12
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*552]
	mov qword [rsp+8*548],r8
	mov r8, qword [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*549],r11
	mov r11, qword [rsp+8*553]
	mov r11,r9
	add r11,r12
	mov qword [rsp+8*550],r13
	mov r13, qword [rsp+8*554]
	mov r13,r14
	add r13,r11
	mov qword [rsp+8*547],r15
	mov r15, qword [rsp+8*555]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*550]
	mov r15,r8
	sub r15,r13
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*556]
	mov qword [rsp+8*552],r9
	mov r9, qword [gbl+8*9]
	mov r10,r9
	add r10,r12
	mov qword [rsp+8*553],r11
	mov r11, qword [rsp+8*557]
	mov qword [rsp+8*551],r14
	mov r14, qword [gbl+8*3]
	mov r11,r14
	sub r11,r9
	mov qword [rsp+8*550],r8
	mov r8, qword [rsp+8*558]
	mov r8,r11
	add r8,r12
	mov qword [rsp+8*554],r13
	mov r13, qword [rsp+8*559]
	mov r13,r10
	add r13,r8
	mov qword [rsp+8*555],r15
	mov r15, qword [rsp+8*560]
	mov r15,r9
	add r15,r12
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*561]
	mov r14,r13
	sub r14,r15
	mov qword [rsp+8*557],r11
	mov r11, qword [rsp+8*562]
	mov qword [rsp+8*558],r8
	mov r8, qword [rsp+8*555]
	mov r11,r8
	sub r11,r14
	mov qword [rsp+8*556],r10
	mov r10, qword [rsp+8*563]
	mov qword [gbl+8*9],r9
	mov r9, qword [gbl+8*3]
	mov r10,r9
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*559],r13
	mov r13, qword [rsp+8*564]
	mov r13,r10
	mov qword [rsp+8*560],r15
	mov r15, qword [gbl+8*11]
	add r13,r15
	mov qword [rsp+8*555],r8
	mov r8, qword [rsp+8*565]
	mov r8,r12
	add r8,r15
	mov qword [rsp+8*562],r11
	mov r11, qword [rsp+8*566]
	mov r11,r13
	sub r11,r8
	mov qword [rsp+8*561],r14
	mov r14, qword [rsp+8*567]
	mov r14,r9
	sub r14,r12
	mov qword [rsp+8*563],r10
	mov r10, qword [rsp+8*568]
	mov r10,r14
	add r10,r15
	mov qword [rsp+8*565],r8
	mov r8, qword [rsp+8*569]
	mov r8,r11
	add r8,r10
	mov qword [rsp+8*564],r13
	mov r13, qword [rsp+8*570]
	mov r13,r12
	add r13,r15
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*571]
	mov qword [rsp+8*567],r14
	mov r14, qword [gbl+8*3]
	mov r9,r14
	sub r9,r12
	mov qword [rsp+8*569],r8
	mov r8, qword [rsp+8*572]
	mov r8,r9
	add r8,r15
	mov qword [rsp+8*568],r10
	mov r10, qword [rsp+8*573]
	mov r10,r13
	add r10,r8
	mov qword [rsp+8*566],r11
	mov r11, qword [rsp+8*574]
	mov r11,r12
	add r11,r15
	mov qword [gbl+8*3],r14
	mov r14, qword [rsp+8*575]
	mov r14,r10
	sub r14,r11
	mov qword [rsp+8*571],r9
	mov r9, qword [rsp+8*576]
	mov qword [rsp+8*572],r8
	mov r8, qword [rsp+8*569]
	mov r9,r8
	sub r9,r14
	mov qword [rsp+8*570],r13
	mov r13, qword [rsp+8*577]
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*562]
	mov r13,r12
	add r13,r9
	mov qword [gbl+8*11],r15
	mov r15, qword [rsp+8*578]
	mov qword [rsp+8*573],r10
	mov r10, qword [rsp+8*546]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*574],r11
	mov r11, qword [rsp+8*579]
	mov qword [rsp+8*569],r8
	mov r8, qword [gbl+8*3]
	mov r11,r8
	mov qword [rsp+8*575],r14
	mov r14, qword [gbl+8*9]
	sub r11,r14
	mov qword [rsp+8*576],r9
	mov r9, qword [rsp+8*580]
	mov r9,r11
	mov qword [rsp+8*562],r12
	mov r12, qword [gbl+8*11]
	add r9,r12
	mov qword [rsp+8*546],r10
	mov r10, qword [rsp+8*581]
	mov r10,r14
	add r10,r12
	mov qword [rsp+8*577],r13
	mov r13, qword [rsp+8*582]
	mov r13,r9
	sub r13,r10
	mov qword [rsp+8*578],r15
	mov r15, qword [rsp+8*583]
	mov r15,r8
	sub r15,r14
	mov qword [rsp+8*579],r11
	mov r11, qword [rsp+8*584]
	mov r11,r15
	add r11,r12
	mov qword [rsp+8*580],r9
	mov r9, qword [rsp+8*585]
	mov r9,r14
	add r9,r12
	mov qword [rsp+8*581],r10
	mov r10, qword [rsp+8*586]
	mov r10,r11
	sub r10,r9
	mov qword [rsp+8*582],r13
	mov r13, qword [rsp+8*587]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*582]
	mov r13,r8
	add r13,r10
	mov qword [rsp+8*583],r15
	mov r15, qword [rsp+8*588]
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*3]
	mov r15,r12
	sub r15,r14
	mov qword [rsp+8*585],r9
	mov r9, qword [rsp+8*589]
	mov r9,r15
	mov qword [rsp+8*584],r11
	mov r11, qword [gbl+8*11]
	add r9,r11
	mov qword [rsp+8*582],r8
	mov r8, qword [rsp+8*590]
	mov r8,r14
	add r8,r11
	mov qword [rsp+8*586],r10
	mov r10, qword [rsp+8*591]
	mov r10,r9
	sub r10,r8
	mov qword [rsp+8*587],r13
	mov r13, qword [rsp+8*592]
	mov r13,r12
	sub r13,r14
	mov qword [rsp+8*588],r15
	mov r15, qword [rsp+8*593]
	mov r15,r13
	add r15,r11
	mov qword [rsp+8*590],r8
	mov r8, qword [rsp+8*594]
	mov r8,r10
	add r8,r15
	mov qword [rsp+8*589],r9
	mov r9, qword [rsp+8*595]
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*587]
	mov r9,r12
	add r9,r8
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*596]
	mov qword [gbl+8*11],r11
	mov r11, qword [gbl+8*9]
	mov r14,r11
	mov qword [rsp+8*592],r13
	mov r13, qword [gbl+8*11]
	add r14,r13
	mov qword [rsp+8*591],r10
	mov r10, qword [rsp+8*597]
	mov qword [rsp+8*593],r15
	mov r15, qword [gbl+8*3]
	mov r10,r15
	sub r10,r11
	mov qword [rsp+8*594],r8
	mov r8, qword [rsp+8*598]
	mov r8,r10
	add r8,r13
	mov qword [rsp+8*595],r9
	mov r9, qword [rsp+8*599]
	mov r9,r14
	add r9,r8
	mov qword [rsp+8*587],r12
	mov r12, qword [rsp+8*600]
	mov r12,r11
	add r12,r13
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*601]
	mov r15,r9
	sub r15,r12
	mov qword [rsp+8*597],r10
	mov r10, qword [rsp+8*602]
	mov qword [rsp+8*598],r8
	mov r8, qword [gbl+8*3]
	mov r10,r8
	sub r10,r11
	mov qword [rsp+8*596],r14
	mov r14, qword [rsp+8*603]
	mov r14,r10
	add r14,r13
	mov qword [rsp+8*599],r9
	mov r9, qword [rsp+8*604]
	mov r9,r11
	add r9,r13
	mov qword [rsp+8*600],r12
	mov r12, qword [rsp+8*605]
	mov r12,r14
	sub r12,r9
	mov qword [rsp+8*601],r15
	mov r15, qword [rsp+8*606]
	mov r15,r8
	sub r15,r11
	mov qword [rsp+8*602],r10
	mov r10, qword [rsp+8*607]
	mov r10,r15
	add r10,r13
	mov qword [rsp+8*604],r9
	mov r9, qword [rsp+8*608]
	mov r9,r12
	add r9,r10
	mov qword [rsp+8*603],r14
	mov r14, qword [rsp+8*609]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*601]
	mov r14,r8
	add r14,r9
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*610]
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*595]
	mov r11,r13
	sub r11,r14
	mov qword [rsp+8*606],r15
	mov r15, qword [rsp+8*611]
	mov qword [rsp+8*607],r10
	mov r10, qword [gbl+8*9]
	mov r15,r10
	mov qword [rsp+8*605],r12
	mov r12, qword [gbl+8*11]
	add r15,r12
	mov qword [rsp+8*601],r8
	mov r8, qword [rsp+8*612]
	mov qword [rsp+8*608],r9
	mov r9, qword [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*610],r11
	mov r11, qword [rsp+8*613]
	mov r11,r8
	add r11,r12
	mov qword [rsp+8*595],r13
	mov r13, qword [rsp+8*614]
	mov r13,r15
	add r13,r11
	mov qword [rsp+8*609],r14
	mov r14, qword [rsp+8*615]
	mov r14,r10
	add r14,r12
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*616]
	mov r9,r13
	sub r9,r14
	mov qword [rsp+8*612],r8
	mov r8, qword [rsp+8*617]
	mov qword [rsp+8*613],r11
	mov r11, qword [gbl+8*3]
	mov r8,r11
	sub r8,r10
	mov qword [rsp+8*611],r15
	mov r15, qword [rsp+8*618]
	mov r15,r8
	add r15,r12
	mov qword [rsp+8*616],r9
	mov r9, qword [rsp+8*619]
	mov r9,r10
	add r9,r12
	mov qword [rsp+8*614],r13
	mov r13, qword [rsp+8*620]
	mov r13,r15
	sub r13,r9
	mov qword [rsp+8*615],r14
	mov r14, qword [rsp+8*621]
	mov r14,r11
	sub r14,r10
	mov qword [rsp+8*617],r8
	mov r8, qword [rsp+8*622]
	mov r8,r14
	add r8,r12
	mov qword [rsp+8*619],r9
	mov r9, qword [rsp+8*623]
	mov r9,r13
	add r9,r8
	mov qword [rsp+8*618],r15
	mov r15, qword [rsp+8*624]
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*616]
	mov r15,r10
	add r15,r9
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*625]
	mov qword [gbl+8*11],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	mov qword [rsp+8*621],r14
	mov r14, qword [gbl+8*11]
	add r11,r14
	mov qword [rsp+8*622],r8
	mov r8, qword [rsp+8*626]
	mov qword [rsp+8*620],r13
	mov r13, qword [gbl+8*3]
	mov r8,r13
	sub r8,r12
	mov qword [rsp+8*623],r9
	mov r9, qword [rsp+8*627]
	mov r9,r8
	add r9,r14
	mov qword [rsp+8*616],r10
	mov r10, qword [rsp+8*628]
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*624],r15
	mov r15, qword [rsp+8*629]
	mov r15,r12
	add r15,r14
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*630]
	mov r13,r10
	sub r13,r15
	mov qword [rsp+8*626],r8
	mov r8, qword [rsp+8*631]
	mov qword [rsp+8*627],r9
	mov r9, qword [gbl+8*3]
	mov r8,r9
	sub r8,r12
	mov qword [rsp+8*625],r11
	mov r11, qword [rsp+8*632]
	mov r11,r8
	add r11,r14
	mov qword [rsp+8*628],r10
	mov r10, qword [rsp+8*633]
	mov r10,r12
	add r10,r14
	mov qword [rsp+8*630],r13
	mov r13, qword [rsp+8*634]
	mov r13,r11
	sub r13,r10
	mov qword [rsp+8*629],r15
	mov r15, qword [rsp+8*635]
	mov r15,r9
	sub r15,r12
	mov qword [rsp+8*631],r8
	mov r8, qword [rsp+8*636]
	mov r8,r15
	add r8,r14
	mov qword [rsp+8*633],r10
	mov r10, qword [rsp+8*637]
	mov r10,r13
	add r10,r8
	mov qword [rsp+8*632],r11
	mov r11, qword [rsp+8*638]
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*630]
	mov r11,r9
	add r11,r10
	mov qword [gbl+8*9],r12
	mov r12, qword [rsp+8*639]
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*624]
	mov r12,r14
	sub r12,r11
	mov qword [rsp+8*635],r15
	mov r15, qword [rsp+8*640]
	mov qword [rsp+8*636],r8
	mov r8, qword [rsp+8*610]
	mov r15,r8
	sub r15,r12
	mov qword [rsp+8*634],r13
	mov r13, qword [rsp+8*641]
	mov qword [rsp+8*630],r9
	mov r9, qword [rsp+8*578]
	mov r13,r9
	add r13,r15
	mov qword [rsp+8*637],r10
	mov r10, qword [rsp+8*642]
	mov qword [rsp+8*638],r11
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov qword [rsp+8*624],r14
	mov r14, qword [gbl+8*11]
	add r10,r14
	mov qword [rsp+8*610],r8
	mov r8, qword [rsp+8*643]
	mov qword [rsp+8*639],r12
	mov r12, qword [gbl+8*3]
	mov r8,r12
	sub r8,r11
	mov qword [rsp+8*578],r9
	mov r9, qword [rsp+8*644]
	mov r9,r8
	add r9,r14
	mov qword [rsp+8*641],r13
	mov r13, qword [rsp+8*645]
	mov r13,r10
	add r13,r9
	mov qword [rsp+8*640],r15
	mov r15, qword [rsp+8*646]
	mov r15,r11
	add r15,r14
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*647]
	mov qword [rsp+8*643],r8
	mov r8, qword [gbl+8*3]
	mov r12,r8
	sub r12,r11
	mov qword [rsp+8*644],r9
	mov r9, qword [rsp+8*648]
	mov r9,r12
	add r9,r14
	mov qword [rsp+8*642],r10
	mov r10, qword [rsp+8*649]
	mov r10,r15
	add r10,r9
	mov qword [rsp+8*645],r13
	mov r13, qword [rsp+8*650]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*645]
	mov r13,r8
	sub r13,r10
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*651]
	mov qword [rsp+8*647],r12
	mov r12, qword [gbl+8*9]
	mov r11,r12
	add r11,r14
	mov qword [rsp+8*648],r9
	mov r9, qword [rsp+8*652]
	mov qword [rsp+8*646],r15
	mov r15, qword [gbl+8*3]
	mov r9,r15
	sub r9,r12
	mov qword [rsp+8*645],r8
	mov r8, qword [rsp+8*653]
	mov r8,r9
	add r8,r14
	mov qword [rsp+8*649],r10
	mov r10, qword [rsp+8*654]
	mov r10,r11
	add r10,r8
	mov qword [rsp+8*650],r13
	mov r13, qword [rsp+8*655]
	mov r13,r12
	add r13,r14
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*656]
	mov r15,r10
	sub r15,r13
	mov qword [rsp+8*652],r9
	mov r9, qword [rsp+8*657]
	mov qword [rsp+8*653],r8
	mov r8, qword [rsp+8*650]
	mov r9,r8
	sub r9,r15
	mov qword [rsp+8*651],r11
	mov r11, qword [rsp+8*658]
	mov qword [gbl+8*9],r12
	mov r12, qword [gbl+8*3]
	mov r11,r12
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r11,r14
	mov qword [rsp+8*654],r10
	mov r10, qword [rsp+8*659]
	mov r10,r11
	mov qword [rsp+8*655],r13
	mov r13, qword [gbl+8*11]
	add r10,r13
	mov qword [rsp+8*650],r8
	mov r8, qword [rsp+8*660]
	mov r8,r14
	add r8,r13
	mov qword [rsp+8*657],r9
	mov r9, qword [rsp+8*661]
	mov r9,r10
	sub r9,r8
	mov qword [rsp+8*656],r15
	mov r15, qword [rsp+8*662]
	mov r15,r12
	sub r15,r14
	mov qword [rsp+8*658],r11
	mov r11, qword [rsp+8*663]
	mov r11,r15
	add r11,r13
	mov qword [rsp+8*660],r8
	mov r8, qword [rsp+8*664]
	mov r8,r9
	add r8,r11
	mov qword [rsp+8*659],r10
	mov r10, qword [rsp+8*665]
	mov r10,r14
	add r10,r13
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*666]
	mov qword [rsp+8*662],r15
	mov r15, qword [gbl+8*3]
	mov r12,r15
	sub r12,r14
	mov qword [rsp+8*664],r8
	mov r8, qword [rsp+8*667]
	mov r8,r12
	add r8,r13
	mov qword [rsp+8*661],r9
	mov r9, qword [rsp+8*668]
	mov r9,r10
	add r9,r8
	mov qword [rsp+8*663],r11
	mov r11, qword [rsp+8*669]
	mov r11,r14
	add r11,r13
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*670]
	mov r15,r9
	sub r15,r11
	mov qword [rsp+8*666],r12
	mov r12, qword [rsp+8*671]
	mov qword [rsp+8*667],r8
	mov r8, qword [rsp+8*664]
	mov r12,r8
	sub r12,r15
	mov qword [rsp+8*665],r10
	mov r10, qword [rsp+8*672]
	mov qword [gbl+8*11],r13
	mov r13, qword [rsp+8*657]
	mov r10,r13
	add r10,r12
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*673]
	mov qword [rsp+8*668],r9
	mov r9, qword [gbl+8*3]
	mov r14,r9
	mov qword [rsp+8*669],r11
	mov r11, qword [gbl+8*9]
	sub r14,r11
	mov qword [rsp+8*664],r8
	mov r8, qword [rsp+8*674]
	mov r8,r14
	mov qword [rsp+8*670],r15
	mov r15, qword [gbl+8*11]
	add r8,r15
	mov qword [rsp+8*672],r10
	mov r10, qword [rsp+8*675]
	mov r10,r11
	add r10,r15
	mov qword [rsp+8*671],r12
	mov r12, qword [rsp+8*676]
	mov r12,r8
	sub r12,r10
	mov qword [rsp+8*657],r13
	mov r13, qword [rsp+8*677]
	mov r13,r9
	sub r13,r11
	mov qword [rsp+8*673],r14
	mov r14, qword [rsp+8*678]
	mov r14,r13
	add r14,r15
	mov qword [rsp+8*674],r8
	mov r8, qword [rsp+8*679]
	mov r8,r12
	add r8,r14
	mov qword [rsp+8*675],r10
	mov r10, qword [rsp+8*680]
	mov r10,r11
	add r10,r15
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*681]
	mov qword [rsp+8*677],r13
	mov r13, qword [gbl+8*3]
	mov r9,r13
	sub r9,r11
	mov qword [rsp+8*679],r8
	mov r8, qword [rsp+8*682]
	mov r8,r9
	add r8,r15
	mov qword [rsp+8*676],r12
	mov r12, qword [rsp+8*683]
	mov r12,r10
	add r12,r8
	mov qword [rsp+8*678],r14
	mov r14, qword [rsp+8*684]
	mov r14,r11
	add r14,r15
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*685]
	mov r13,r12
	sub r13,r14
	mov qword [rsp+8*681],r9
	mov r9, qword [rsp+8*686]
	mov qword [rsp+8*682],r8
	mov r8, qword [rsp+8*679]
	mov r9,r8
	sub r9,r13
	mov qword [rsp+8*680],r10
	mov r10, qword [rsp+8*687]
	mov qword [gbl+8*9],r11
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [gbl+8*11],r15
	mov r15, qword [gbl+8*9]
	sub r10,r15
	mov qword [rsp+8*683],r12
	mov r12, qword [rsp+8*688]
	mov r12,r10
	mov qword [rsp+8*684],r14
	mov r14, qword [gbl+8*11]
	add r12,r14
	mov qword [rsp+8*679],r8
	mov r8, qword [rsp+8*689]
	mov r8,r15
	add r8,r14
	mov qword [rsp+8*686],r9
	mov r9, qword [rsp+8*690]
	mov r9,r12
	sub r9,r8
	mov qword [rsp+8*685],r13
	mov r13, qword [rsp+8*691]
	mov r13,r11
	sub r13,r15
	mov qword [rsp+8*687],r10
	mov r10, qword [rsp+8*692]
	mov r10,r13
	add r10,r14
	mov qword [rsp+8*689],r8
	mov r8, qword [rsp+8*693]
	mov r8,r9
	add r8,r10
	mov qword [rsp+8*688],r12
	mov r12, qword [rsp+8*694]
	mov r12,r15
	add r12,r14
	mov qword [gbl+8*3],r11
	mov r11, qword [rsp+8*695]
	mov qword [rsp+8*691],r13
	mov r13, qword [gbl+8*3]
	mov r11,r13
	sub r11,r15
	mov qword [rsp+8*693],r8
	mov r8, qword [rsp+8*696]
	mov r8,r11
	add r8,r14
	mov qword [rsp+8*690],r9
	mov r9, qword [rsp+8*697]
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*692],r10
	mov r10, qword [rsp+8*698]
	mov r10,r15
	add r10,r14
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*699]
	mov r13,r9
	sub r13,r10
	mov qword [rsp+8*695],r11
	mov r11, qword [rsp+8*700]
	mov qword [rsp+8*696],r8
	mov r8, qword [rsp+8*693]
	mov r11,r8
	sub r11,r13
	mov qword [rsp+8*694],r12
	mov r12, qword [rsp+8*701]
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*686]
	mov r12,r14
	add r12,r11
	mov qword [gbl+8*9],r15
	mov r15, qword [rsp+8*702]
	mov qword [rsp+8*697],r9
	mov r9, qword [rsp+8*672]
	mov r15,r9
	add r15,r12
	mov qword [rsp+8*698],r10
	mov r10, qword [rsp+8*703]
	mov qword [rsp+8*693],r8
	mov r8, qword [gbl+8*3]
	mov r10,r8
	mov qword [rsp+8*699],r13
	mov r13, qword [gbl+8*9]
	sub r10,r13
	mov qword [rsp+8*700],r11
	mov r11, qword [rsp+8*704]
	mov r11,r10
	mov qword [rsp+8*686],r14
	mov r14, qword [gbl+8*11]
	add r11,r14
	mov qword [rsp+8*672],r9
	mov r9, qword [rsp+8*705]
	mov r9,r13
	add r9,r14
	mov qword [rsp+8*701],r12
	mov r12, qword [rsp+8*706]
	mov r12,r11
	sub r12,r9
	mov qword [rsp+8*702],r15
	mov r15, qword [rsp+8*707]
	mov r15,r8
	sub r15,r13
	mov qword [rsp+8*703],r10
	mov r10, qword [rsp+8*708]
	mov r10,r15
	add r10,r14
	mov qword [rsp+8*705],r9
	mov r9, qword [rsp+8*709]
	mov r9,r13
	add r9,r14
	mov qword [rsp+8*704],r11
	mov r11, qword [rsp+8*710]
	mov r11,r10
	sub r11,r9
	mov qword [rsp+8*706],r12
	mov r12, qword [rsp+8*711]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*706]
	mov r12,r8
	add r12,r11
	mov qword [rsp+8*707],r15
	mov r15, qword [rsp+8*712]
	mov qword [gbl+8*9],r13
	mov r13, qword [gbl+8*3]
	mov r15,r13
	mov qword [gbl+8*11],r14
	mov r14, qword [gbl+8*9]
	sub r15,r14
	mov qword [rsp+8*709],r9
	mov r9, qword [rsp+8*713]
	mov r9,r15
	mov qword [rsp+8*708],r10
	mov r10, qword [gbl+8*11]
	add r9,r10
	mov qword [rsp+8*706],r8
	mov r8, qword [rsp+8*714]
	mov r8,r14
	add r8,r10
	mov qword [rsp+8*710],r11
	mov r11, qword [rsp+8*715]
	mov r11,r9
	sub r11,r8
	mov qword [rsp+8*711],r12
	mov r12, qword [rsp+8*716]
	mov r12,r13
	sub r12,r14
	mov qword [rsp+8*712],r15
	mov r15, qword [rsp+8*717]
	mov r15,r12
	add r15,r10
	mov qword [rsp+8*714],r8
	mov r8, qword [rsp+8*718]
	mov r8,r11
	add r8,r15
	mov qword [rsp+8*713],r9
	mov r9, qword [rsp+8*719]
	mov qword [gbl+8*3],r13
	mov r13, qword [rsp+8*711]
	mov r9,r13
	add r9,r8
	mov qword [gbl+8*9],r14
	mov r14, qword [rsp+8*720]
	mov qword [gbl+8*11],r10
	mov r10, qword [gbl+8*9]
	mov r14,r10
	mov qword [rsp+8*716],r12
	mov r12, qword [gbl+8*11]
	add r14,r12
	mov qword [rsp+8*715],r11
	mov r11, qword [rsp+8*721]
	mov qword [rsp+8*717],r15
	mov r15, qword [gbl+8*3]
	mov r11,r15
	sub r11,r10
	mov qword [rsp+8*718],r8
	mov r8, qword [rsp+8*722]
	mov r8,r11
	add r8,r12
	mov qword [rsp+8*719],r9
	mov r9, qword [rsp+8*723]
	mov r9,r14
	add r9,r8
	mov qword [rsp+8*711],r13
	mov r13, qword [rsp+8*724]
	mov r13,r10
	add r13,r12
	mov qword [gbl+8*3],r15
	mov r15, qword [rsp+8*725]
	mov r15,r9
	sub r15,r13
	mov qword [rsp+8*721],r11
	mov r11, qword [rsp+8*726]
	mov qword [rsp+8*722],r8
	mov r8, qword [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*720],r14
	mov r14, qword [rsp+8*727]
	mov r14,r11
	add r14,r12
	mov qword [rsp+8*723],r9
	mov r9, qword [rsp+8*728]
	mov r9,r10
	add r9,r12
	mov qword [rsp+8*724],r13
	mov r13, qword [rsp+8*729]
	mov r13,r14
	sub r13,r9
	mov qword [rsp+8*725],r15
	mov r15, qword [rsp+8*730]
	mov r15,r8
	sub r15,r10
	mov qword [rsp+8*726],r11
	mov r11, qword [rsp+8*731]
	mov r11,r15
	add r11,r12
	mov qword [rsp+8*728],r9
	mov r9, qword [rsp+8*732]
	mov r9,r13
	add r9,r11
	mov qword [rsp+8*727],r14
	mov r14, qword [rsp+8*733]
	mov qword [gbl+8*3],r8
	mov r8, qword [rsp+8*725]
	mov r14,r8
	add r14,r9
	mov qword [gbl+8*9],r10
	mov r10, qword [rsp+8*734]
	mov qword [gbl+8*11],r12
	mov r12, qword [rsp+8*719]
	mov r10,r12
	sub r10,r14
	mov qword [rsp+8*730],r15
	mov r15, qword [rsp+8*735]
	mov qword [rsp+8*731],r11
	mov r11, qword [gbl+8*9]
	mov r15,r11
	mov qword [rsp+8*729],r13
	mov r13, qword [gbl+8*11]
	add r15,r13
	mov qword [rsp+8*725],r8
	mov r8, qword [rsp+8*736]
	mov qword [rsp+8*732],r9
	mov r9, qword [gbl+8*3]
	mov r8,r9
	sub r8,r11
	mov qword [rsp+8*734],r10
	mov r10, qword [rsp+8*737]
	mov r10,r8
	add r10,r13
	mov qword [rsp+8*719],r12
	mov r12, qword [rsp+8*738]
	mov r12,r15
	add r12,r10
	mov qword [rsp+8*733],r14
	mov r14, qword [rsp+8*739]
	mov r14,r11
	add r14,r13
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*740]
	mov r9,r12
	sub r9,r14
	mov qword [rsp+8*736],r8
	mov r8, qword [rsp+8*741]
	mov qword [rsp+8*737],r10
	mov r10, qword [gbl+8*3]
	mov r8,r10
	sub r8,r11
	mov qword [rsp+8*735],r15
	mov r15, qword [rsp+8*742]
	mov r15,r8
	add r15,r13
	mov qword [rsp+8*740],r9
	mov r9, qword [rsp+8*743]
	mov r9,r11
	add r9,r13
	mov qword [rsp+8*738],r12
	mov r12, qword [rsp+8*744]
	mov r12,r15
	sub r12,r9
	mov qword [rsp+8*739],r14
	mov r14, qword [rsp+8*745]
	mov r14,r10
	sub r14,r11
	mov qword [rsp+8*741],r8
	mov r8, qword [rsp+8*746]
	mov r8,r14
	add r8,r13
	mov qword [rsp+8*743],r9
	mov r9, qword [rsp+8*747]
	mov r9,r12
	add r9,r8
	mov qword [rsp+8*742],r15
	mov r15, qword [rsp+8*748]
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*740]
	mov r15,r10
	add r15,r9
	mov qword [gbl+8*9],r11
	mov r11, qword [rsp+8*749]
	mov qword [gbl+8*11],r13
	mov r13, qword [gbl+8*9]
	mov r11,r13
	mov qword [rsp+8*745],r14
	mov r14, qword [gbl+8*11]
	add r11,r14
	mov qword [rsp+8*746],r8
	mov r8, qword [rsp+8*750]
	mov qword [rsp+8*744],r12
	mov r12, qword [gbl+8*3]
	mov r8,r12
	sub r8,r13
	mov qword [rsp+8*747],r9
	mov r9, qword [rsp+8*751]
	mov r9,r8
	add r9,r14
	mov qword [rsp+8*740],r10
	mov r10, qword [rsp+8*752]
	mov r10,r11
	add r10,r9
	mov qword [rsp+8*748],r15
	mov r15, qword [rsp+8*753]
	mov r15,r13
	add r15,r14
	mov qword [gbl+8*3],r12
	mov r12, qword [rsp+8*754]
	mov r12,r10
	sub r12,r15
	mov qword [rsp+8*750],r8
	mov r8, qword [rsp+8*755]
	mov qword [rsp+8*751],r9
	mov r9, qword [gbl+8*3]
	mov r8,r9
	sub r8,r13
	mov qword [rsp+8*749],r11
	mov r11, qword [rsp+8*756]
	mov r11,r8
	add r11,r14
	mov qword [rsp+8*752],r10
	mov r10, qword [rsp+8*757]
	mov r10,r13
	add r10,r14
	mov qword [rsp+8*754],r12
	mov r12, qword [rsp+8*758]
	mov r12,r11
	sub r12,r10
	mov qword [rsp+8*753],r15
	mov r15, qword [rsp+8*759]
	mov r15,r9
	sub r15,r13
	mov qword [rsp+8*755],r8
	mov r8, qword [rsp+8*760]
	mov r8,r15
	add r8,r14
	mov qword [rsp+8*757],r10
	mov r10, qword [rsp+8*761]
	mov r10,r12
	add r10,r8
	mov qword [rsp+8*756],r11
	mov r11, qword [rsp+8*762]
	mov qword [gbl+8*3],r9
	mov r9, qword [rsp+8*754]
	mov r11,r9
	add r11,r10
	mov qword [gbl+8*9],r13
	mov r13, qword [rsp+8*763]
	mov qword [gbl+8*11],r14
	mov r14, qword [rsp+8*748]
	mov r13,r14
	sub r13,r11
	mov qword [rsp+8*759],r15
	mov r15, qword [rsp+8*764]
	mov qword [rsp+8*760],r8
	mov r8, qword [rsp+8*734]
	mov r15,r8
	sub r15,r13
	mov qword [rsp+8*758],r12
	mov r12, qword [rsp+8*765]
	mov qword [rsp+8*754],r9
	mov r9, qword [rsp+8*702]
	mov r12,r9
	add r12,r15
	mov qword [rsp+8*761],r10
	mov r10, qword [rsp+8*766]
	mov qword [rsp+8*762],r11
	mov r11, qword [rsp+8*641]
	mov r10,r11
	sub r10,r12
	mov qword [rsp+8*748],r14
	mov r14, qword [gbl+8*3]
	mov r14,r10
	mov qword [rsp+8*734],r8
	mov qword [rsp+8*702],r9
	mov qword [rsp+8*766],r10
	mov qword [rsp+8*641],r11
	mov qword [rsp+8*765],r12
	mov qword [rsp+8*763],r13
	mov qword [gbl+8*3],r14
	mov qword [rsp+8*764],r15
	jmp L_627
	
L_628:
	mov r8, qword [arg+8*0]
	mov r9, qword [gbl+8*9]
	mov r8,r9
	mov r10, qword [rsp+8*768]
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [gbl+8*9],r9
	mov qword [rsp+8*768],r10
	mov     rdi, [rsp+8*768]
	call    toString
	mov     qword[rsp+8*769], rax
	mov     rsi, t789
	mov     rdi, [rsp+8*769]
	call    concat
	mov [rsp+8*770], rax
	mov r8, qword [arg+8*0]
	mov r9, qword [gbl+8*11]
	mov r8,r9
	mov r10, qword [rsp+8*771]
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [gbl+8*11],r9
	mov qword [rsp+8*771],r10
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
	mov r8, qword [arg+8*0]
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10, qword [rsp+8*775]
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [gbl+8*3],r9
	mov qword [rsp+8*775],r10
	mov     rdi, [rsp+8*775]
	call    toString
	mov     qword[rsp+8*776], rax
	mov     rsi, [rsp+8*776]
	mov     rdi, [rsp+8*774]
	call    concat
	mov [rsp+8*777], rax
	mov r8, qword [arg+8*0]
	mov r9, qword [rsp+8*777]
	mov r8,r9
	mov r10, qword [rsp+8*778]
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*777],r9
	mov qword [rsp+8*778],r10
	mov rdi, formatln
	mov rsi,[rsp+8*778] 
	add rsi, 1 
	xor rax, rax
	call printf
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
	mov r8, qword [gbl+8*9]
	mov r9,1
	mov r8,r9
	mov r10, qword [gbl+8*11]
	mov r11,1
	mov r10,r11
	mov r12, qword [gbl+8*3]
	mov r13,1
	mov r12,r13
	mov qword [gbl+8*9],r8
	mov qword [gbl+8*11],r10
	mov qword [gbl+8*3],r12
	mov r8, qword [rsp+8*779]
	mov rax,r8
	mov qword [rsp+8*779],r8
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


