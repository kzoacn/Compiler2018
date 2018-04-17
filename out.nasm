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
	sub    rsp, 1064
	call global_init
	mov [rsp+8*1] , rax
	call    getInt
	mov     [rsp+8*2], rax
	mov r8, [rsp+8*2]
	mov qword [rsp+8*3] ,r8
	mov qword [rsp+8*4] ,0
	mov qword [rsp+8*5] ,0
	
L_0:
	mov r8, [rsp+8*5]
	mov r9, [rsp+8*3]
	cmp r8, r9
	mov qword [rsp+8*6], 0
	setl [rsp+8*6]
	mov r8, [rsp+8*6]
	cmp r8, 0
	je L_1
	mov qword [rsp+8*7] ,0
	
L_3:
	mov r8, [rsp+8*7]
	mov r9, [rsp+8*3]
	cmp r8, r9
	mov qword [rsp+8*8], 0
	setl [rsp+8*8]
	mov r8, [rsp+8*8]
	cmp r8, 0
	je L_4
	mov qword [rsp+8*9] ,0
	
L_6:
	mov r8, [rsp+8*9]
	mov r9, [rsp+8*3]
	cmp r8, r9
	mov qword [rsp+8*10], 0
	setl [rsp+8*10]
	mov r8, [rsp+8*10]
	cmp r8, 0
	je L_7
	mov qword [rsp+8*11] ,0
	
L_9:
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*3]
	cmp r8, r9
	mov qword [rsp+8*12], 0
	setl [rsp+8*12]
	mov r8, [rsp+8*12]
	cmp r8, 0
	je L_10
	mov qword [rsp+8*13] ,0
	
L_12:
	mov r8, [rsp+8*13]
	mov r9, [rsp+8*3]
	cmp r8, r9
	mov qword [rsp+8*14], 0
	setl [rsp+8*14]
	mov r8, [rsp+8*14]
	cmp r8, 0
	je L_13
	mov qword [rsp+8*15] ,0
	
L_15:
	mov r8, [rsp+8*15]
	mov r9, [rsp+8*3]
	cmp r8, r9
	mov qword [rsp+8*16], 0
	setl [rsp+8*16]
	mov r8, [rsp+8*16]
	cmp r8, 0
	je L_16
	mov qword [rsp+8*17] ,0
	
L_18:
	mov r8, [rsp+8*17]
	mov r9, [rsp+8*3]
	cmp r8, r9
	mov qword [rsp+8*18], 0
	setl [rsp+8*18]
	mov r8, [rsp+8*18]
	cmp r8, 0
	je L_19
	mov r8, [rsp+8*5]
	mov r9, [rsp+8*7]
	cmp r8, r9
	mov qword [rsp+8*19], 0
	sete [rsp+8*19]
	mov r8, [rsp+8*19]
	cmp r8, 0
	jne L_21
	mov qword [rsp+8*20] ,0
	jmp L_22
	
L_21:
	mov r8, [rsp+8*9]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*21], 0
	setg [rsp+8*21]
	mov r8, [rsp+8*21]
	mov qword [rsp+8*20] ,r8
	
L_22:
	mov r8, [rsp+8*20]
	cmp r8, 0
	je L_27
	mov qword [rsp+8*22] ,1
	jmp L_28
	
L_27:
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*13]
	cmp r8, r9
	mov qword [rsp+8*23], 0
	sete [rsp+8*23]
	mov r8, [rsp+8*23]
	cmp r8, 0
	jne L_23
	mov qword [rsp+8*24] ,0
	jmp L_24
	
L_23:
	mov r8, [rsp+8*15]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*25], 0
	setg [rsp+8*25]
	mov r8, [rsp+8*25]
	mov qword [rsp+8*24] ,r8
	
L_24:
	mov r8, [rsp+8*24]
	cmp r8, 0
	jne L_25
	mov qword [rsp+8*26] ,0
	jmp L_26
	
L_25:
	mov r8, [rsp+8*17]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*27], 0
	setg [rsp+8*27]
	mov r8, [rsp+8*27]
	mov qword [rsp+8*26] ,r8
	
L_26:
	mov r8, [rsp+8*26]
	mov qword [rsp+8*22] ,r8
	
L_28:
	mov r8, [rsp+8*22]
	cmp r8, 0
	je L_29
	mov qword [rsp+8*28] ,1
	jmp L_30
	
L_29:
	mov r8, [rsp+8*5]
	mov r9, [rsp+8*17]
	cmp r8, r9
	mov qword [rsp+8*29], 0
	sete [rsp+8*29]
	mov r8, [rsp+8*29]
	mov qword [rsp+8*28] ,r8
	
L_30:
	mov r8, [rsp+8*28]
	cmp r8, 0
	je L_33
	mov qword [rsp+8*30] ,1
	jmp L_34
	
L_33:
	mov r8, [rsp+8*11]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*31], 0
	setg [rsp+8*31]
	mov r8, [rsp+8*31]
	cmp r8, 0
	jne L_31
	mov qword [rsp+8*32] ,0
	jmp L_32
	
L_31:
	mov r8, [rsp+8*15]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*33], 0
	setg [rsp+8*33]
	mov r8, [rsp+8*33]
	mov qword [rsp+8*32] ,r8
	
L_32:
	mov r8, [rsp+8*32]
	mov qword [rsp+8*30] ,r8
	
L_34:
	mov r8, [rsp+8*30]
	mov qword [rsp+8*34] ,r8
	mov r8, [rsp+8*5]
	mov r9, [rsp+8*7]
	cmp r8, r9
	mov qword [rsp+8*35], 0
	sete [rsp+8*35]
	mov r8, [rsp+8*35]
	cmp r8, 0
	jne L_35
	mov qword [rsp+8*36] ,0
	jmp L_36
	
L_35:
	mov r8, [rsp+8*9]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*37], 0
	setg [rsp+8*37]
	mov r8, [rsp+8*37]
	mov qword [rsp+8*36] ,r8
	
L_36:
	mov r8, [rsp+8*36]
	cmp r8, 0
	je L_41
	mov qword [rsp+8*38] ,1
	jmp L_42
	
L_41:
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*13]
	cmp r8, r9
	mov qword [rsp+8*39], 0
	sete [rsp+8*39]
	mov r8, [rsp+8*39]
	cmp r8, 0
	jne L_37
	mov qword [rsp+8*40] ,0
	jmp L_38
	
L_37:
	mov r8, [rsp+8*15]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*41], 0
	setg [rsp+8*41]
	mov r8, [rsp+8*41]
	mov qword [rsp+8*40] ,r8
	
L_38:
	mov r8, [rsp+8*40]
	cmp r8, 0
	jne L_39
	mov qword [rsp+8*42] ,0
	jmp L_40
	
L_39:
	mov r8, [rsp+8*17]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*43], 0
	setg [rsp+8*43]
	mov r8, [rsp+8*43]
	mov qword [rsp+8*42] ,r8
	
L_40:
	mov r8, [rsp+8*42]
	mov qword [rsp+8*38] ,r8
	
L_42:
	mov r8, [rsp+8*38]
	cmp r8, 0
	je L_43
	mov qword [rsp+8*44] ,1
	jmp L_44
	
L_43:
	mov r8, [rsp+8*5]
	mov r9, [rsp+8*17]
	cmp r8, r9
	mov qword [rsp+8*45], 0
	sete [rsp+8*45]
	mov r8, [rsp+8*45]
	mov qword [rsp+8*44] ,r8
	
L_44:
	mov r8, [rsp+8*44]
	cmp r8, 0
	je L_47
	mov qword [rsp+8*46] ,1
	jmp L_48
	
L_47:
	mov r8, [rsp+8*11]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*47], 0
	setg [rsp+8*47]
	mov r8, [rsp+8*47]
	cmp r8, 0
	jne L_45
	mov qword [rsp+8*48] ,0
	jmp L_46
	
L_45:
	mov r8, [rsp+8*15]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*49], 0
	setg [rsp+8*49]
	mov r8, [rsp+8*49]
	mov qword [rsp+8*48] ,r8
	
L_46:
	mov r8, [rsp+8*48]
	mov qword [rsp+8*46] ,r8
	
L_48:
	mov r8, [rsp+8*46]
	mov qword [rsp+8*50] ,r8
	mov r8, [rsp+8*5]
	mov r9, [rsp+8*7]
	cmp r8, r9
	mov qword [rsp+8*51], 0
	sete [rsp+8*51]
	mov r8, [rsp+8*51]
	cmp r8, 0
	jne L_49
	mov qword [rsp+8*52] ,0
	jmp L_50
	
L_49:
	mov r8, [rsp+8*9]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*53], 0
	setg [rsp+8*53]
	mov r8, [rsp+8*53]
	mov qword [rsp+8*52] ,r8
	
L_50:
	mov r8, [rsp+8*52]
	cmp r8, 0
	je L_55
	mov qword [rsp+8*54] ,1
	jmp L_56
	
L_55:
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*13]
	cmp r8, r9
	mov qword [rsp+8*55], 0
	sete [rsp+8*55]
	mov r8, [rsp+8*55]
	cmp r8, 0
	jne L_51
	mov qword [rsp+8*56] ,0
	jmp L_52
	
L_51:
	mov r8, [rsp+8*15]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*57], 0
	setg [rsp+8*57]
	mov r8, [rsp+8*57]
	mov qword [rsp+8*56] ,r8
	
L_52:
	mov r8, [rsp+8*56]
	cmp r8, 0
	jne L_53
	mov qword [rsp+8*58] ,0
	jmp L_54
	
L_53:
	mov r8, [rsp+8*17]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*59], 0
	setg [rsp+8*59]
	mov r8, [rsp+8*59]
	mov qword [rsp+8*58] ,r8
	
L_54:
	mov r8, [rsp+8*58]
	mov qword [rsp+8*54] ,r8
	
L_56:
	mov r8, [rsp+8*54]
	cmp r8, 0
	je L_57
	mov qword [rsp+8*60] ,1
	jmp L_58
	
L_57:
	mov r8, [rsp+8*5]
	mov r9, [rsp+8*17]
	cmp r8, r9
	mov qword [rsp+8*61], 0
	sete [rsp+8*61]
	mov r8, [rsp+8*61]
	mov qword [rsp+8*60] ,r8
	
L_58:
	mov r8, [rsp+8*60]
	cmp r8, 0
	je L_61
	mov qword [rsp+8*62] ,1
	jmp L_62
	
L_61:
	mov r8, [rsp+8*11]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*63], 0
	setg [rsp+8*63]
	mov r8, [rsp+8*63]
	cmp r8, 0
	jne L_59
	mov qword [rsp+8*64] ,0
	jmp L_60
	
L_59:
	mov r8, [rsp+8*15]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*65], 0
	setg [rsp+8*65]
	mov r8, [rsp+8*65]
	mov qword [rsp+8*64] ,r8
	
L_60:
	mov r8, [rsp+8*64]
	mov qword [rsp+8*62] ,r8
	
L_62:
	mov r8, [rsp+8*62]
	mov qword [rsp+8*66] ,r8
	mov r8, [rsp+8*5]
	mov r9, [rsp+8*7]
	cmp r8, r9
	mov qword [rsp+8*67], 0
	sete [rsp+8*67]
	mov r8, [rsp+8*67]
	cmp r8, 0
	jne L_63
	mov qword [rsp+8*68] ,0
	jmp L_64
	
L_63:
	mov r8, [rsp+8*9]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*69], 0
	setg [rsp+8*69]
	mov r8, [rsp+8*69]
	mov qword [rsp+8*68] ,r8
	
L_64:
	mov r8, [rsp+8*68]
	cmp r8, 0
	je L_69
	mov qword [rsp+8*70] ,1
	jmp L_70
	
L_69:
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*13]
	cmp r8, r9
	mov qword [rsp+8*71], 0
	sete [rsp+8*71]
	mov r8, [rsp+8*71]
	cmp r8, 0
	jne L_65
	mov qword [rsp+8*72] ,0
	jmp L_66
	
L_65:
	mov r8, [rsp+8*15]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*73], 0
	setg [rsp+8*73]
	mov r8, [rsp+8*73]
	mov qword [rsp+8*72] ,r8
	
L_66:
	mov r8, [rsp+8*72]
	cmp r8, 0
	jne L_67
	mov qword [rsp+8*74] ,0
	jmp L_68
	
L_67:
	mov r8, [rsp+8*17]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*75], 0
	setg [rsp+8*75]
	mov r8, [rsp+8*75]
	mov qword [rsp+8*74] ,r8
	
L_68:
	mov r8, [rsp+8*74]
	mov qword [rsp+8*70] ,r8
	
L_70:
	mov r8, [rsp+8*70]
	cmp r8, 0
	je L_71
	mov qword [rsp+8*76] ,1
	jmp L_72
	
L_71:
	mov r8, [rsp+8*5]
	mov r9, [rsp+8*17]
	cmp r8, r9
	mov qword [rsp+8*77], 0
	sete [rsp+8*77]
	mov r8, [rsp+8*77]
	mov qword [rsp+8*76] ,r8
	
L_72:
	mov r8, [rsp+8*76]
	cmp r8, 0
	je L_75
	mov qword [rsp+8*78] ,1
	jmp L_76
	
L_75:
	mov r8, [rsp+8*11]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*79], 0
	setg [rsp+8*79]
	mov r8, [rsp+8*79]
	cmp r8, 0
	jne L_73
	mov qword [rsp+8*80] ,0
	jmp L_74
	
L_73:
	mov r8, [rsp+8*15]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*81], 0
	setg [rsp+8*81]
	mov r8, [rsp+8*81]
	mov qword [rsp+8*80] ,r8
	
L_74:
	mov r8, [rsp+8*80]
	mov qword [rsp+8*78] ,r8
	
L_76:
	mov r8, [rsp+8*78]
	mov qword [rsp+8*82] ,r8
	mov r8, [rsp+8*5]
	mov r9, [rsp+8*7]
	cmp r8, r9
	mov qword [rsp+8*83], 0
	sete [rsp+8*83]
	mov r8, [rsp+8*83]
	cmp r8, 0
	jne L_77
	mov qword [rsp+8*84] ,0
	jmp L_78
	
L_77:
	mov r8, [rsp+8*9]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*85], 0
	setg [rsp+8*85]
	mov r8, [rsp+8*85]
	mov qword [rsp+8*84] ,r8
	
L_78:
	mov r8, [rsp+8*84]
	cmp r8, 0
	je L_83
	mov qword [rsp+8*86] ,1
	jmp L_84
	
L_83:
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*13]
	cmp r8, r9
	mov qword [rsp+8*87], 0
	sete [rsp+8*87]
	mov r8, [rsp+8*87]
	cmp r8, 0
	jne L_79
	mov qword [rsp+8*88] ,0
	jmp L_80
	
L_79:
	mov r8, [rsp+8*15]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*89], 0
	setg [rsp+8*89]
	mov r8, [rsp+8*89]
	mov qword [rsp+8*88] ,r8
	
L_80:
	mov r8, [rsp+8*88]
	cmp r8, 0
	jne L_81
	mov qword [rsp+8*90] ,0
	jmp L_82
	
L_81:
	mov r8, [rsp+8*17]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*91], 0
	setg [rsp+8*91]
	mov r8, [rsp+8*91]
	mov qword [rsp+8*90] ,r8
	
L_82:
	mov r8, [rsp+8*90]
	mov qword [rsp+8*86] ,r8
	
L_84:
	mov r8, [rsp+8*86]
	cmp r8, 0
	je L_85
	mov qword [rsp+8*92] ,1
	jmp L_86
	
L_85:
	mov r8, [rsp+8*5]
	mov r9, [rsp+8*17]
	cmp r8, r9
	mov qword [rsp+8*93], 0
	sete [rsp+8*93]
	mov r8, [rsp+8*93]
	mov qword [rsp+8*92] ,r8
	
L_86:
	mov r8, [rsp+8*92]
	cmp r8, 0
	je L_89
	mov qword [rsp+8*94] ,1
	jmp L_90
	
L_89:
	mov r8, [rsp+8*11]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*95], 0
	setg [rsp+8*95]
	mov r8, [rsp+8*95]
	cmp r8, 0
	jne L_87
	mov qword [rsp+8*96] ,0
	jmp L_88
	
L_87:
	mov r8, [rsp+8*15]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*97], 0
	setg [rsp+8*97]
	mov r8, [rsp+8*97]
	mov qword [rsp+8*96] ,r8
	
L_88:
	mov r8, [rsp+8*96]
	mov qword [rsp+8*94] ,r8
	
L_90:
	mov r8, [rsp+8*94]
	mov qword [rsp+8*98] ,r8
	mov r8, [rsp+8*5]
	mov r9, [rsp+8*7]
	cmp r8, r9
	mov qword [rsp+8*99], 0
	sete [rsp+8*99]
	mov r8, [rsp+8*99]
	cmp r8, 0
	jne L_91
	mov qword [rsp+8*100] ,0
	jmp L_92
	
L_91:
	mov r8, [rsp+8*9]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*101], 0
	setg [rsp+8*101]
	mov r8, [rsp+8*101]
	mov qword [rsp+8*100] ,r8
	
L_92:
	mov r8, [rsp+8*100]
	cmp r8, 0
	je L_97
	mov qword [rsp+8*102] ,1
	jmp L_98
	
L_97:
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*13]
	cmp r8, r9
	mov qword [rsp+8*103], 0
	sete [rsp+8*103]
	mov r8, [rsp+8*103]
	cmp r8, 0
	jne L_93
	mov qword [rsp+8*104] ,0
	jmp L_94
	
L_93:
	mov r8, [rsp+8*15]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*105], 0
	setg [rsp+8*105]
	mov r8, [rsp+8*105]
	mov qword [rsp+8*104] ,r8
	
L_94:
	mov r8, [rsp+8*104]
	cmp r8, 0
	jne L_95
	mov qword [rsp+8*106] ,0
	jmp L_96
	
L_95:
	mov r8, [rsp+8*17]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*107], 0
	setg [rsp+8*107]
	mov r8, [rsp+8*107]
	mov qword [rsp+8*106] ,r8
	
L_96:
	mov r8, [rsp+8*106]
	mov qword [rsp+8*102] ,r8
	
L_98:
	mov r8, [rsp+8*102]
	cmp r8, 0
	je L_99
	mov qword [rsp+8*108] ,1
	jmp L_100
	
L_99:
	mov r8, [rsp+8*5]
	mov r9, [rsp+8*17]
	cmp r8, r9
	mov qword [rsp+8*109], 0
	sete [rsp+8*109]
	mov r8, [rsp+8*109]
	mov qword [rsp+8*108] ,r8
	
L_100:
	mov r8, [rsp+8*108]
	cmp r8, 0
	je L_103
	mov qword [rsp+8*110] ,1
	jmp L_104
	
L_103:
	mov r8, [rsp+8*11]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*111], 0
	setg [rsp+8*111]
	mov r8, [rsp+8*111]
	cmp r8, 0
	jne L_101
	mov qword [rsp+8*112] ,0
	jmp L_102
	
L_101:
	mov r8, [rsp+8*15]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*113], 0
	setg [rsp+8*113]
	mov r8, [rsp+8*113]
	mov qword [rsp+8*112] ,r8
	
L_102:
	mov r8, [rsp+8*112]
	mov qword [rsp+8*110] ,r8
	
L_104:
	mov r8, [rsp+8*110]
	mov qword [rsp+8*114] ,r8
	mov r8, [rsp+8*34]
	cmp r8, 0
	je L_106
	mov r8, [rsp+8*4]
	mov qword [rsp+8*115] ,r8
	mov r8, [rsp+8*4]
	add r8, 1
	mov qword [rsp+8*4],r8 
	
L_106:
	mov r8, [rsp+8*50]
	cmp r8, 0
	je L_108
	mov r8, [rsp+8*4]
	mov qword [rsp+8*116] ,r8
	mov r8, [rsp+8*4]
	add r8, 1
	mov qword [rsp+8*4],r8 
	
L_108:
	mov r8, [rsp+8*66]
	cmp r8, 0
	je L_110
	mov r8, [rsp+8*4]
	mov qword [rsp+8*117] ,r8
	mov r8, [rsp+8*4]
	add r8, 1
	mov qword [rsp+8*4],r8 
	
L_110:
	mov r8, [rsp+8*82]
	cmp r8, 0
	je L_112
	mov r8, [rsp+8*4]
	mov qword [rsp+8*118] ,r8
	mov r8, [rsp+8*4]
	add r8, 1
	mov qword [rsp+8*4],r8 
	
L_112:
	mov r8, [rsp+8*98]
	cmp r8, 0
	je L_114
	mov r8, [rsp+8*4]
	mov qword [rsp+8*119] ,r8
	mov r8, [rsp+8*4]
	add r8, 1
	mov qword [rsp+8*4],r8 
	
L_114:
	mov r8, [rsp+8*114]
	cmp r8, 0
	je L_116
	mov r8, [rsp+8*4]
	mov qword [rsp+8*120] ,r8
	mov r8, [rsp+8*4]
	add r8, 1
	mov qword [rsp+8*4],r8 
	
L_116:
	
L_20:
	mov r8, [rsp+8*17]
	add r8, 1
	mov qword [rsp+8*17],r8 
	jmp L_18
	
L_19:
	
L_17:
	mov r8, [rsp+8*15]
	add r8, 1
	mov qword [rsp+8*15],r8 
	jmp L_15
	
L_16:
	
L_14:
	mov r8, [rsp+8*13]
	add r8, 1
	mov qword [rsp+8*13],r8 
	jmp L_12
	
L_13:
	
L_11:
	mov r8, [rsp+8*11]
	add r8, 1
	mov qword [rsp+8*11],r8 
	jmp L_9
	
L_10:
	
L_8:
	mov r8, [rsp+8*9]
	add r8, 1
	mov qword [rsp+8*9],r8 
	jmp L_6
	
L_7:
	
L_5:
	mov r8, [rsp+8*7]
	add r8, 1
	mov qword [rsp+8*7],r8 
	jmp L_3
	
L_4:
	
L_2:
	mov r8, [rsp+8*5]
	add r8, 1
	mov qword [rsp+8*5],r8 
	jmp L_0
	
L_1:
	mov r8, [rsp+8*4]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*122] ,r8
	mov     rdi, [rsp+8*122]
	call    toString
	mov     qword[rsp+8*123], rax
	mov r8, [rsp+8*123]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*124] ,r8
	mov rdi, format
	mov rsi,[rsp+8*124] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov rax,0
	leave
	ret
	mov rax,0
	leave
	ret
	jmp QED
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1064
	mov rax,[rsp+8*125]
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   3048
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
	

