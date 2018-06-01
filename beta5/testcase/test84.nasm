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
	sub    rsp, 1232
	call global_init
	mov [rsp+8*1] , rax
	mov r8, [gbl+8*2]
	mov qword [rsp+8*3] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*3]
	call    address
	mov [rsp+8*4], rax
	mov r8, 2
	mov r9, [rsp+8*4]
	mov qword [r9], r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*6] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*6]
	call    address
	mov [rsp+8*7], rax
	mov r8, 6
	mov r9, [rsp+8*7]
	mov qword [r9], r8
	mov r8, [gbl+8*2]
	mov qword [rsp+8*8] ,r8
	mov     rsi, 1
	mov     rdi, [rsp+8*8]
	call    address
	mov [rsp+8*9], rax
	mov r8, 1
	mov r9, [rsp+8*9]
	mov qword [r9], r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*10] ,r8
	mov     rsi, 1
	mov     rdi, [rsp+8*10]
	call    address
	mov [rsp+8*11], rax
	mov r8, 2
	mov r9, [rsp+8*11]
	mov qword [r9], r8
	mov r8, [gbl+8*2]
	mov qword [rsp+8*12] ,r8
	mov     rsi, 2
	mov     rdi, [rsp+8*12]
	call    address
	mov [rsp+8*13], rax
	mov r8, 2
	mov r9, [rsp+8*13]
	mov qword [r9], r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*14] ,r8
	mov     rsi, 2
	mov     rdi, [rsp+8*14]
	call    address
	mov [rsp+8*15], rax
	mov r8, 4
	mov r9, [rsp+8*15]
	mov qword [r9], r8
	mov r8, [gbl+8*2]
	mov qword [rsp+8*16] ,r8
	mov     rsi, 3
	mov     rdi, [rsp+8*16]
	call    address
	mov [rsp+8*17], rax
	mov r8, 4
	mov r9, [rsp+8*17]
	mov qword [r9], r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*18] ,r8
	mov     rsi, 3
	mov     rdi, [rsp+8*18]
	call    address
	mov [rsp+8*19], rax
	mov r8, 5
	mov r9, [rsp+8*19]
	mov qword [r9], r8
	mov r8, [gbl+8*2]
	mov qword [rsp+8*20] ,r8
	mov     rsi, 4
	mov     rdi, [rsp+8*20]
	call    address
	mov [rsp+8*21], rax
	mov r8, 3
	mov r9, [rsp+8*21]
	mov qword [r9], r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*22] ,r8
	mov     rsi, 4
	mov     rdi, [rsp+8*22]
	call    address
	mov [rsp+8*23], rax
	mov r8, 7
	mov r9, [rsp+8*23]
	mov qword [r9], r8
	mov r8, [gbl+8*2]
	mov qword [rsp+8*24] ,r8
	mov     rsi, 5
	mov     rdi, [rsp+8*24]
	call    address
	mov [rsp+8*25], rax
	mov r8, 3
	mov r9, [rsp+8*25]
	mov qword [r9], r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*26] ,r8
	mov     rsi, 5
	mov     rdi, [rsp+8*26]
	call    address
	mov [rsp+8*27], rax
	mov r8, 1
	mov r9, [rsp+8*27]
	mov qword [r9], r8
	mov qword [rsp+8*28] ,1
	
L_643:
	mov r8, [rsp+8*28]
	mov qword [rsp+8*29] ,r8
	mov r8, [rsp+8*28]
	sub r8, 1
	mov qword [rsp+8*28],r8 
	mov r8, [rsp+8*29]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*30], 0
	setne [rsp+8*30]
	mov r8, [rsp+8*30]
	cmp r8, 0
	je L_644
	mov qword [gbl+8*31] ,7
	call init
	mov [rsp+8*32] , rax
	mov qword [gbl+8*33] ,0
	
L_645:
	mov r8, [gbl+8*31]
	sub r8, 1
	mov qword [rsp+8*34],r8 
	mov r8, [gbl+8*33]
	mov r9, [rsp+8*34]
	cmp r8, r9
	mov qword [rsp+8*35], 0
	setl [rsp+8*35]
	mov r8, [rsp+8*35]
	cmp r8, 0
	je L_646
	mov r8, [gbl+8*2]
	mov qword [rsp+8*36] ,r8
	mov     rsi, [gbl+8*33]
	mov     rdi, [rsp+8*36]
	call    address
	mov [rsp+8*37], rax
	mov r8, [rsp+8*37]
	mov r8, [r8]
	mov [rsp+8*38], r8
	mov r8, [rsp+8*38]
	mov qword [rsp+8*39] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*40] ,r8
	mov     rsi, [gbl+8*33]
	mov     rdi, [rsp+8*40]
	call    address
	mov [rsp+8*41], rax
	mov r8, [rsp+8*41]
	mov r8, [r8]
	mov [rsp+8*42], r8
	mov r8, [rsp+8*42]
	mov qword [rsp+8*43] ,r8
	mov r8, [rsp+8*43]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*39]
	mov qword [arg+8*0] ,r8
	call add
	mov [rsp+8*46] , rax
	mov r8, [rsp+8*39]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*43]
	mov qword [arg+8*0] ,r8
	call add
	mov [rsp+8*47] , rax
	
L_647:
	mov r8, [gbl+8*33]
	add r8, 1
	mov qword [gbl+8*33],r8 
	jmp L_645
	
L_646:
	mov qword [arg+8*0] ,1
	call dfs
	mov [rsp+8*48] , rax
	mov r8, [gbl+8*49]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*50] ,r8
	mov     rdi, [rsp+8*50]
	call    toString
	mov     qword[rsp+8*51], rax
	mov r8, [rsp+8*51]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*52] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*52] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*53]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*54] ,r8
	mov     rdi, [rsp+8*54]
	call    toString
	mov     qword[rsp+8*55], rax
	mov r8, [rsp+8*55]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*56] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*56] 
	add rsi, 1 
	xor rax, rax
	call printf
	jmp L_643
	
L_644:
	mov rax,0
	leave
	ret
	mov rax,0
	leave
	ret
	jmp QED
	
add:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1232
	mov r8, [arg+8*0]
	mov qword [rsp+8*57] ,r8
	mov r8, [arg+8*1]
	mov qword [rsp+8*58] ,r8
	mov r8, [gbl+8*59]
	add r8, 1
	mov qword [gbl+8*59],r8 
	mov     rdi, 2
	call    mallocArray
	mov     qword [rsp+8*60], rax
	mov r8, [rsp+8*60]
	mov qword [rsp+8*61] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*60]
	call    address
	mov [rsp+8*61], rax
	mov r8, [gbl+8*59]
	mov r9, [rsp+8*61]
	mov qword [r9], r8
	mov     rsi, 1
	mov     rdi, [rsp+8*60]
	call    address
	mov [rsp+8*61], rax
	mov r8, 0
	mov r9, [rsp+8*61]
	mov qword [r9], r8
	mov     rsi, [rsp+8*60]
	mov     rdi, [gbl+8*62]
	call    multiAddress
	mov [rsp+8*63], rax
	mov r8, [rsp+8*58]
	mov r9, [rsp+8*63]
	mov qword [r9], r8
	mov     rdi, 2
	call    mallocArray
	mov     qword [rsp+8*64], rax
	mov r8, [rsp+8*64]
	mov qword [rsp+8*65] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*64]
	call    address
	mov [rsp+8*65], rax
	mov r8, [gbl+8*59]
	mov r9, [rsp+8*65]
	mov qword [r9], r8
	mov     rsi, 1
	mov     rdi, [rsp+8*64]
	call    address
	mov [rsp+8*65], rax
	mov r8, 1
	mov r9, [rsp+8*65]
	mov qword [r9], r8
	mov     rsi, [rsp+8*64]
	mov     rdi, [gbl+8*62]
	call    multiAddress
	mov [rsp+8*66], rax
	mov r8, [gbl+8*67]
	mov qword [rsp+8*68] ,r8
	mov     rsi, [rsp+8*57]
	mov     rdi, [rsp+8*68]
	call    address
	mov [rsp+8*69], rax
	mov r8, [rsp+8*69]
	mov r8, [r8]
	mov [rsp+8*70], r8
	mov r8, [rsp+8*70]
	mov r9, [rsp+8*66]
	mov qword [r9], r8
	mov r8, [gbl+8*67]
	mov qword [rsp+8*71] ,r8
	mov     rsi, [rsp+8*57]
	mov     rdi, [rsp+8*71]
	call    address
	mov [rsp+8*72], rax
	mov r8, [gbl+8*59]
	mov r9, [rsp+8*72]
	mov qword [r9], r8
	mov rax,0
	leave
	ret
	
init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1232
	mov     rdi, 100
	call    mallocArray
	mov     qword [rsp+8*73], rax
	mov r8, [rsp+8*73]
	mov qword [gbl+8*62] ,r8
	mov qword [gbl+8*59] ,0
	mov qword [gbl+8*49] ,0
	mov r8, [gbl+8*31]
	mov qword [gbl+8*53] ,r8
	mov     rdi, 100
	call    mallocArray
	mov     qword [rsp+8*74], rax
	mov r8, [rsp+8*74]
	mov qword [gbl+8*75] ,r8
	mov     rdi, 100
	call    mallocArray
	mov     qword [rsp+8*76], rax
	mov r8, [rsp+8*76]
	mov qword [gbl+8*77] ,r8
	mov     rdi, 100
	call    mallocArray
	mov     qword [rsp+8*78], rax
	mov r8, [rsp+8*78]
	mov qword [gbl+8*79] ,r8
	mov     rdi, 100
	call    mallocArray
	mov     qword [rsp+8*80], rax
	mov r8, [rsp+8*80]
	mov qword [gbl+8*67] ,r8
	mov qword [gbl+8*33] ,0
	
L_624:
	mov r8, [gbl+8*33]
	mov r9, 100
	cmp r8, r9
	mov qword [rsp+8*81], 0
	setl [rsp+8*81]
	mov r8, [rsp+8*81]
	cmp r8, 0
	je L_625
	mov     rdi, 2
	call    mallocArray
	mov     qword [rsp+8*82], rax
	mov r8, [gbl+8*62]
	mov qword [rsp+8*83] ,r8
	mov     rsi, [gbl+8*33]
	mov     rdi, [rsp+8*83]
	call    address
	mov [rsp+8*84], rax
	mov r8, [rsp+8*82]
	mov r9, [rsp+8*84]
	mov qword [r9], r8
	
L_626:
	mov r8, [gbl+8*33]
	add r8, 1
	mov qword [gbl+8*33],r8 
	jmp L_624
	
L_625:
	mov qword [gbl+8*33] ,0
	
L_627:
	mov r8, [gbl+8*33]
	mov r9, [gbl+8*31]
	cmp r8, r9
	mov qword [rsp+8*85], 0
	setle [rsp+8*85]
	mov r8, [rsp+8*85]
	cmp r8, 0
	je L_628
	mov r8, [gbl+8*75]
	mov qword [rsp+8*86] ,r8
	mov     rsi, [gbl+8*33]
	mov     rdi, [rsp+8*86]
	call    address
	mov [rsp+8*87], rax
	mov r8, 0
	mov r9, [rsp+8*87]
	mov qword [r9], r8
	mov r8, [gbl+8*77]
	mov qword [rsp+8*88] ,r8
	mov     rsi, [gbl+8*33]
	mov     rdi, [rsp+8*88]
	call    address
	mov [rsp+8*89], rax
	mov r8, 0
	mov r9, [rsp+8*89]
	mov qword [r9], r8
	mov r8, [gbl+8*79]
	mov qword [rsp+8*90] ,r8
	mov     rsi, [gbl+8*33]
	mov     rdi, [rsp+8*90]
	call    address
	mov [rsp+8*91], rax
	mov r8, 0
	mov r9, [rsp+8*91]
	mov qword [r9], r8
	mov r8, [gbl+8*67]
	mov qword [rsp+8*92] ,r8
	mov     rsi, [gbl+8*33]
	mov     rdi, [rsp+8*92]
	call    address
	mov [rsp+8*93], rax
	mov r8, 0
	mov r9, [rsp+8*93]
	mov qword [r9], r8
	
L_629:
	mov r8, [gbl+8*33]
	add r8, 1
	mov qword [gbl+8*33],r8 
	jmp L_627
	
L_628:
	mov rax,0
	leave
	ret
	
max:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1232
	mov r8, [arg+8*0]
	mov qword [rsp+8*94] ,r8
	mov r8, [arg+8*1]
	mov qword [rsp+8*95] ,r8
	mov r8, [rsp+8*94]
	mov r9, [rsp+8*95]
	cmp r8, r9
	mov qword [rsp+8*96], 0
	setg [rsp+8*96]
	mov r8, [rsp+8*96]
	cmp r8, 0
	je L_630
	mov rax,[rsp+8*94]
	leave
	ret
	jmp L_631
	
L_630:
	mov rax,[rsp+8*95]
	leave
	ret
	
L_631:
	mov rax,0
	leave
	ret
	
dfs:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1232
	mov r8, [arg+8*0]
	mov qword [rsp+8*97] ,r8
	mov qword [rsp+8*98] ,0
	mov r8, [gbl+8*75]
	mov qword [rsp+8*99] ,r8
	mov     rsi, [rsp+8*97]
	mov     rdi, [rsp+8*99]
	call    address
	mov [rsp+8*100], rax
	mov r8, 1
	mov r9, [rsp+8*100]
	mov qword [r9], r8
	mov r8, [gbl+8*67]
	mov qword [rsp+8*101] ,r8
	mov     rsi, [rsp+8*97]
	mov     rdi, [rsp+8*101]
	call    address
	mov [rsp+8*102], rax
	mov r8, [rsp+8*102]
	mov r8, [r8]
	mov [rsp+8*103], r8
	mov r8, [rsp+8*103]
	mov qword [rsp+8*104] ,r8
	
L_632:
	mov r8, [rsp+8*104]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*105], 0
	setne [rsp+8*105]
	mov r8, [rsp+8*105]
	cmp r8, 0
	je L_633
	mov     rdi, 2
	call    mallocArray
	mov     qword [rsp+8*106], rax
	mov r8, [rsp+8*106]
	mov qword [rsp+8*107] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*106]
	call    address
	mov [rsp+8*107], rax
	mov r8, [rsp+8*104]
	mov r9, [rsp+8*107]
	mov qword [r9], r8
	mov     rsi, 1
	mov     rdi, [rsp+8*106]
	call    address
	mov [rsp+8*107], rax
	mov r8, 0
	mov r9, [rsp+8*107]
	mov qword [r9], r8
	mov     rsi, [rsp+8*106]
	mov     rdi, [gbl+8*62]
	call    multiAddress
	mov [rsp+8*108], rax
	mov r8, [rsp+8*108]
	mov r8, [r8]
	mov [rsp+8*108], r8
	mov r8, [rsp+8*108]
	mov qword [rsp+8*109] ,r8
	mov r8, [gbl+8*75]
	mov qword [rsp+8*110] ,r8
	mov     rsi, [rsp+8*109]
	mov     rdi, [rsp+8*110]
	call    address
	mov [rsp+8*111], rax
	mov r8, [rsp+8*111]
	mov r8, [r8]
	mov [rsp+8*112], r8
	mov r8, [rsp+8*112]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*113], 0
	sete [rsp+8*113]
	mov r8, [rsp+8*113]
	cmp r8, 0
	je L_636
	mov r8, [rsp+8*109]
	mov qword [arg+8*0] ,r8
	call dfs
	mov [rsp+8*114] , rax
	mov r8, [gbl+8*77]
	mov qword [rsp+8*115] ,r8
	mov     rsi, [rsp+8*97]
	mov     rdi, [rsp+8*115]
	call    address
	mov [rsp+8*116], rax
	mov r8, [rsp+8*116]
	mov r8, [r8]
	mov [rsp+8*117], r8
	mov r8, [gbl+8*77]
	mov qword [rsp+8*118] ,r8
	mov     rsi, [rsp+8*109]
	mov     rdi, [rsp+8*118]
	call    address
	mov [rsp+8*119], rax
	mov r8, [rsp+8*119]
	mov r8, [r8]
	mov [rsp+8*120], r8
	mov r8, [rsp+8*120]
	add r8, 1
	mov qword [rsp+8*121],r8 
	mov r8, [rsp+8*117]
	add r8, [rsp+8*121]
	mov qword [rsp+8*122],r8 
	mov r8, [gbl+8*77]
	mov qword [rsp+8*123] ,r8
	mov     rsi, [rsp+8*97]
	mov     rdi, [rsp+8*123]
	call    address
	mov [rsp+8*124], rax
	mov r8, [rsp+8*122]
	mov r9, [rsp+8*124]
	mov qword [r9], r8
	mov r8, [gbl+8*77]
	mov qword [rsp+8*125] ,r8
	mov     rsi, [rsp+8*109]
	mov     rdi, [rsp+8*125]
	call    address
	mov [rsp+8*126], rax
	mov r8, [rsp+8*126]
	mov r8, [r8]
	mov [rsp+8*127], r8
	mov r8, [rsp+8*127]
	add r8, 1
	mov qword [rsp+8*128],r8 
	mov r8, [rsp+8*128]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*98]
	mov qword [arg+8*0] ,r8
	call max
	mov [rsp+8*129] , rax
	mov r8, [rsp+8*129]
	mov qword [rsp+8*98] ,r8
	
L_636:
	
L_634:
	mov     rdi, 2
	call    mallocArray
	mov     qword [rsp+8*130], rax
	mov r8, [rsp+8*130]
	mov qword [rsp+8*131] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*130]
	call    address
	mov [rsp+8*131], rax
	mov r8, [rsp+8*104]
	mov r9, [rsp+8*131]
	mov qword [r9], r8
	mov     rsi, 1
	mov     rdi, [rsp+8*130]
	call    address
	mov [rsp+8*131], rax
	mov r8, 1
	mov r9, [rsp+8*131]
	mov qword [r9], r8
	mov     rsi, [rsp+8*130]
	mov     rdi, [gbl+8*62]
	call    multiAddress
	mov [rsp+8*132], rax
	mov r8, [rsp+8*132]
	mov r8, [r8]
	mov [rsp+8*132], r8
	mov r8, [rsp+8*132]
	mov qword [rsp+8*104] ,r8
	jmp L_632
	
L_633:
	mov r8, [gbl+8*77]
	mov qword [rsp+8*133] ,r8
	mov     rsi, [rsp+8*97]
	mov     rdi, [rsp+8*133]
	call    address
	mov [rsp+8*134], rax
	mov r8, [rsp+8*134]
	mov r8, [r8]
	mov [rsp+8*135], r8
	mov r8, [gbl+8*31]
	sub r8, [rsp+8*135]
	mov qword [rsp+8*136],r8 
	mov r8, [rsp+8*136]
	sub r8, 1
	mov qword [rsp+8*137],r8 
	mov r8, [rsp+8*137]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*98]
	mov qword [arg+8*0] ,r8
	call max
	mov [rsp+8*138] , rax
	mov r8, [rsp+8*138]
	mov qword [rsp+8*98] ,r8
	mov r8, [rsp+8*98]
	mov r9, [gbl+8*53]
	cmp r8, r9
	mov qword [rsp+8*139], 0
	setl [rsp+8*139]
	mov r8, [rsp+8*139]
	cmp r8, 0
	je L_639
	mov qword [rsp+8*140] ,1
	jmp L_640
	
L_639:
	mov r8, [rsp+8*98]
	mov r9, [gbl+8*53]
	cmp r8, r9
	mov qword [rsp+8*141], 0
	sete [rsp+8*141]
	mov r8, [rsp+8*141]
	cmp r8, 0
	jne L_637
	mov qword [rsp+8*142] ,0
	jmp L_638
	
L_637:
	mov r8, [rsp+8*97]
	mov r9, [gbl+8*49]
	cmp r8, r9
	mov qword [rsp+8*143], 0
	setl [rsp+8*143]
	mov r8, [rsp+8*143]
	mov qword [rsp+8*142] ,r8
	
L_638:
	mov r8, [rsp+8*142]
	mov qword [rsp+8*140] ,r8
	
L_640:
	mov r8, [rsp+8*140]
	cmp r8, 0
	je L_642
	mov r8, [rsp+8*97]
	mov qword [gbl+8*49] ,r8
	mov r8, [rsp+8*98]
	mov qword [gbl+8*53] ,r8
	
L_642:
	mov rax,0
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1232
	mov qword [gbl+8*59] ,0
	mov qword [gbl+8*31] ,0
	mov qword [gbl+8*49] ,0
	mov qword [gbl+8*53] ,0
	mov qword [gbl+8*33] ,0
	mov     rdi, 7
	call    mallocArray
	mov     qword [gbl+8*144], rax
	mov r8, [gbl+8*144]
	mov qword [gbl+8*2] ,r8
	mov     rdi, 7
	call    mallocArray
	mov     qword [gbl+8*145], rax
	mov r8, [gbl+8*145]
	mov qword [gbl+8*5] ,r8
	mov rax,[rsp+8*146]
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   3216
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
	

