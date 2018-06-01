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
	sub    rsp, 2216
	call global_init
	mov [rsp+8*1] , rax
	mov     rdi, 8
	call    malloc
	mov     qword [rsp+8*2], rax
	mov r8, [rsp+8*2]
	mov qword [rsp+8*3] ,r8
	mov     rdi, 8
	call    malloc
	mov     qword [rsp+8*4], rax
	mov r8, [rsp+8*4]
	mov qword [rsp+8*5] ,r8
	mov     rdi, 8
	call    malloc
	mov     qword [rsp+8*6], rax
	mov r8, [rsp+8*6]
	mov qword [rsp+8*7] ,r8
	mov     rdi, 8
	call    malloc
	mov     qword [rsp+8*8], rax
	mov r8, [rsp+8*8]
	mov qword [rsp+8*9] ,r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*10] ,r8
	mov r8, [rsp+8*10]
	mov qword [arg+8*15] ,r8
	call point_printPoint
	mov [rsp+8*12] , rax
	mov r8, [rsp+8*3]
	mov qword [rsp+8*13] ,r8
	mov r8, 463
	neg r8
	mov [rsp+8*14], r8
	mov qword [arg+8*2] ,480
	mov r8, [rsp+8*14]
	mov qword [arg+8*1] ,r8
	mov qword [arg+8*0] ,849
	mov r8, [rsp+8*13]
	mov qword [arg+8*15] ,r8
	call point_set
	mov [rsp+8*18] , rax
	mov r8, [rsp+8*5]
	mov qword [rsp+8*19] ,r8
	mov r8, 208
	neg r8
	mov [rsp+8*20], r8
	mov r8, 150
	neg r8
	mov [rsp+8*21], r8
	mov r8, [rsp+8*21]
	mov qword [arg+8*2] ,r8
	mov qword [arg+8*1] ,585
	mov r8, [rsp+8*20]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*19]
	mov qword [arg+8*15] ,r8
	call point_set
	mov [rsp+8*22] , rax
	mov r8, [rsp+8*7]
	mov qword [rsp+8*23] ,r8
	mov r8, 670
	neg r8
	mov [rsp+8*24], r8
	mov r8, 742
	neg r8
	mov [rsp+8*25], r8
	mov r8, [rsp+8*25]
	mov qword [arg+8*2] ,r8
	mov r8, [rsp+8*24]
	mov qword [arg+8*1] ,r8
	mov qword [arg+8*0] ,360
	mov r8, [rsp+8*23]
	mov qword [arg+8*15] ,r8
	call point_set
	mov [rsp+8*26] , rax
	mov r8, [rsp+8*9]
	mov qword [rsp+8*27] ,r8
	mov r8, 29
	neg r8
	mov [rsp+8*28], r8
	mov r8, 591
	neg r8
	mov [rsp+8*29], r8
	mov r8, 960
	neg r8
	mov [rsp+8*30], r8
	mov r8, [rsp+8*30]
	mov qword [arg+8*2] ,r8
	mov r8, [rsp+8*29]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*28]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*27]
	mov qword [arg+8*15] ,r8
	call point_set
	mov [rsp+8*31] , rax
	mov r8, [rsp+8*3]
	mov qword [rsp+8*32] ,r8
	mov r8, [rsp+8*5]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*32]
	mov qword [arg+8*15] ,r8
	call point_add
	mov [rsp+8*33] , rax
	mov r8, [rsp+8*5]
	mov qword [rsp+8*34] ,r8
	mov r8, [rsp+8*7]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*34]
	mov qword [arg+8*15] ,r8
	call point_add
	mov [rsp+8*35] , rax
	mov r8, [rsp+8*9]
	mov qword [rsp+8*36] ,r8
	mov r8, [rsp+8*7]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*36]
	mov qword [arg+8*15] ,r8
	call point_add
	mov [rsp+8*37] , rax
	mov r8, [rsp+8*7]
	mov qword [rsp+8*38] ,r8
	mov r8, [rsp+8*3]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*38]
	mov qword [arg+8*15] ,r8
	call point_sub
	mov [rsp+8*39] , rax
	mov r8, [rsp+8*5]
	mov qword [rsp+8*40] ,r8
	mov r8, [rsp+8*9]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*40]
	mov qword [arg+8*15] ,r8
	call point_sub
	mov [rsp+8*41] , rax
	mov r8, [rsp+8*9]
	mov qword [rsp+8*42] ,r8
	mov r8, [rsp+8*7]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*42]
	mov qword [arg+8*15] ,r8
	call point_sub
	mov [rsp+8*43] , rax
	mov r8, [rsp+8*7]
	mov qword [rsp+8*44] ,r8
	mov r8, [rsp+8*5]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*44]
	mov qword [arg+8*15] ,r8
	call point_add
	mov [rsp+8*45] , rax
	mov r8, [rsp+8*3]
	mov qword [rsp+8*46] ,r8
	mov r8, [rsp+8*5]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*46]
	mov qword [arg+8*15] ,r8
	call point_add
	mov [rsp+8*47] , rax
	mov r8, [rsp+8*5]
	mov qword [rsp+8*48] ,r8
	mov r8, [rsp+8*5]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*48]
	mov qword [arg+8*15] ,r8
	call point_add
	mov [rsp+8*49] , rax
	mov r8, [rsp+8*7]
	mov qword [rsp+8*50] ,r8
	mov r8, [rsp+8*7]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*50]
	mov qword [arg+8*15] ,r8
	call point_add
	mov [rsp+8*51] , rax
	mov r8, [rsp+8*3]
	mov qword [rsp+8*52] ,r8
	mov r8, [rsp+8*9]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*52]
	mov qword [arg+8*15] ,r8
	call point_sub
	mov [rsp+8*53] , rax
	mov r8, [rsp+8*3]
	mov qword [rsp+8*54] ,r8
	mov r8, [rsp+8*5]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*54]
	mov qword [arg+8*15] ,r8
	call point_add
	mov [rsp+8*55] , rax
	mov r8, [rsp+8*5]
	mov qword [rsp+8*56] ,r8
	mov r8, [rsp+8*7]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*56]
	mov qword [arg+8*15] ,r8
	call point_sub
	mov [rsp+8*57] , rax
	mov r8, [rsp+8*3]
	mov qword [rsp+8*58] ,r8
	mov r8, [rsp+8*58]
	mov qword [arg+8*15] ,r8
	call point_sqrLen
	mov [rsp+8*59] , rax
	mov r8, [rsp+8*59]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*60] ,r8
	mov     rdi, [rsp+8*60]
	call    toString
	mov     qword[rsp+8*61], rax
	mov r8, [rsp+8*61]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*62] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*62] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*5]
	mov qword [rsp+8*63] ,r8
	mov r8, [rsp+8*63]
	mov qword [arg+8*15] ,r8
	call point_sqrLen
	mov [rsp+8*64] , rax
	mov r8, [rsp+8*64]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*65] ,r8
	mov     rdi, [rsp+8*65]
	call    toString
	mov     qword[rsp+8*66], rax
	mov r8, [rsp+8*66]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*67] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*67] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*5]
	mov qword [rsp+8*68] ,r8
	mov r8, [rsp+8*7]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*68]
	mov qword [arg+8*15] ,r8
	call point_sqrDis
	mov [rsp+8*69] , rax
	mov r8, [rsp+8*69]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*70] ,r8
	mov     rdi, [rsp+8*70]
	call    toString
	mov     qword[rsp+8*71], rax
	mov r8, [rsp+8*71]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*72] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*72] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*9]
	mov qword [rsp+8*73] ,r8
	mov r8, [rsp+8*3]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*73]
	mov qword [arg+8*15] ,r8
	call point_sqrDis
	mov [rsp+8*74] , rax
	mov r8, [rsp+8*74]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*75] ,r8
	mov     rdi, [rsp+8*75]
	call    toString
	mov     qword[rsp+8*76], rax
	mov r8, [rsp+8*76]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*77] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*77] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*7]
	mov qword [rsp+8*78] ,r8
	mov r8, [rsp+8*3]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*78]
	mov qword [arg+8*15] ,r8
	call point_dot
	mov [rsp+8*79] , rax
	mov r8, [rsp+8*79]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*80] ,r8
	mov     rdi, [rsp+8*80]
	call    toString
	mov     qword[rsp+8*81], rax
	mov r8, [rsp+8*81]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*82] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*82] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*5]
	mov qword [rsp+8*83] ,r8
	mov r8, [rsp+8*9]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*83]
	mov qword [arg+8*15] ,r8
	call point_cross
	mov [rsp+8*84] , rax
	mov r8, [rsp+8*84]
	mov qword [arg+8*15] ,r8
	call point_printPoint
	mov [rsp+8*85] , rax
	mov r8, [rsp+8*85]
	mov qword [rsp+8*84] ,r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*86] ,r8
	mov r8, [rsp+8*86]
	mov qword [arg+8*15] ,r8
	call point_printPoint
	mov [rsp+8*87] , rax
	mov r8, [rsp+8*5]
	mov qword [rsp+8*88] ,r8
	mov r8, [rsp+8*88]
	mov qword [arg+8*15] ,r8
	call point_printPoint
	mov [rsp+8*89] , rax
	mov r8, [rsp+8*7]
	mov qword [rsp+8*90] ,r8
	mov r8, [rsp+8*90]
	mov qword [arg+8*15] ,r8
	call point_printPoint
	mov [rsp+8*91] , rax
	mov r8, [rsp+8*9]
	mov qword [rsp+8*92] ,r8
	mov r8, [rsp+8*92]
	mov qword [arg+8*15] ,r8
	call point_printPoint
	mov [rsp+8*93] , rax
	mov rax,0
	leave
	ret
	mov rax,0
	leave
	ret
	jmp QED
	
point_point:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2216
	mov r8, [arg+8*15]
	mov qword [rsp+8*94] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*94]
	call    address
	mov [rsp+8*95], rax
	mov     rdi, 0
	call    mallocArray
	mov     qword [rsp+8*96], rax
	mov r8, [rsp+8*96]
	mov qword [rsp+8*97] ,r8
	mov     rsi, [rsp+8*96]
	mov     rdi, [rsp+8*95]
	call    multiAddress
	mov [rsp+8*98], rax
	mov r8, 0
	mov r9, [rsp+8*98]
	mov qword [r9], r8
	mov     rsi, 1
	mov     rdi, [rsp+8*94]
	call    address
	mov [rsp+8*99], rax
	mov     rdi, 0
	call    mallocArray
	mov     qword [rsp+8*100], rax
	mov r8, [rsp+8*100]
	mov qword [rsp+8*101] ,r8
	mov     rsi, [rsp+8*100]
	mov     rdi, [rsp+8*99]
	call    multiAddress
	mov [rsp+8*102], rax
	mov r8, 0
	mov r9, [rsp+8*102]
	mov qword [r9], r8
	mov     rsi, 2
	mov     rdi, [rsp+8*94]
	call    address
	mov [rsp+8*103], rax
	mov     rdi, 0
	call    mallocArray
	mov     qword [rsp+8*104], rax
	mov r8, [rsp+8*104]
	mov qword [rsp+8*105] ,r8
	mov     rsi, [rsp+8*104]
	mov     rdi, [rsp+8*103]
	call    multiAddress
	mov [rsp+8*106], rax
	mov r8, 0
	mov r9, [rsp+8*106]
	mov qword [r9], r8
	mov rax,[rsp+8*107]
	leave
	ret
	
point_set:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2216
	mov r8, [arg+8*15]
	mov qword [rsp+8*108] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*109] ,r8
	mov r8, [arg+8*1]
	mov qword [rsp+8*110] ,r8
	mov r8, [arg+8*2]
	mov qword [rsp+8*111] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*108]
	call    address
	mov [rsp+8*95], rax
	mov     rdi, 0
	call    mallocArray
	mov     qword [rsp+8*112], rax
	mov r8, [rsp+8*112]
	mov qword [rsp+8*113] ,r8
	mov     rsi, [rsp+8*112]
	mov     rdi, [rsp+8*95]
	call    multiAddress
	mov [rsp+8*114], rax
	mov r8, [rsp+8*109]
	mov r9, [rsp+8*114]
	mov qword [r9], r8
	mov     rsi, 1
	mov     rdi, [rsp+8*108]
	call    address
	mov [rsp+8*99], rax
	mov     rdi, 0
	call    mallocArray
	mov     qword [rsp+8*115], rax
	mov r8, [rsp+8*115]
	mov qword [rsp+8*116] ,r8
	mov     rsi, [rsp+8*115]
	mov     rdi, [rsp+8*99]
	call    multiAddress
	mov [rsp+8*117], rax
	mov r8, [rsp+8*110]
	mov r9, [rsp+8*117]
	mov qword [r9], r8
	mov     rsi, 2
	mov     rdi, [rsp+8*108]
	call    address
	mov [rsp+8*103], rax
	mov     rdi, 0
	call    mallocArray
	mov     qword [rsp+8*118], rax
	mov r8, [rsp+8*118]
	mov qword [rsp+8*119] ,r8
	mov     rsi, [rsp+8*118]
	mov     rdi, [rsp+8*103]
	call    multiAddress
	mov [rsp+8*120], rax
	mov r8, [rsp+8*111]
	mov r9, [rsp+8*120]
	mov qword [r9], r8
	mov rax,[rsp+8*121]
	leave
	ret
	
point_sqrLen:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2216
	mov r8, [arg+8*15]
	mov qword [rsp+8*122] ,r8
	mov r8, [rsp+8*95]
	imul r8, [rsp+8*95]
	mov qword [rsp+8*123],r8 
	mov r8, [rsp+8*99]
	imul r8, [rsp+8*99]
	mov qword [rsp+8*124],r8 
	mov r8, [rsp+8*123]
	add r8, [rsp+8*124]
	mov qword [rsp+8*125],r8 
	mov r8, [rsp+8*103]
	imul r8, [rsp+8*103]
	mov qword [rsp+8*126],r8 
	mov r8, [rsp+8*125]
	add r8, [rsp+8*126]
	mov qword [rsp+8*127],r8 
	mov rax,[rsp+8*127]
	leave
	ret
	mov rax,0
	leave
	ret
	
point_sqrDis:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2216
	mov r8, [arg+8*15]
	mov qword [rsp+8*128] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*129] ,r8
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*130], rax
	mov r8, [rsp+8*130]
	mov qword [rsp+8*131] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*130]
	call    address
	mov [rsp+8*131], rax
	mov r8, 0
	mov r9, [rsp+8*131]
	mov qword [r9], r8
	mov     rsi, [rsp+8*130]
	mov     rdi, [rsp+8*129]
	call    multiAddress
	mov [rsp+8*132], rax
	mov r8, [rsp+8*132]
	mov r8, [r8]
	mov [rsp+8*132], r8
	mov r8, [rsp+8*95]
	sub r8, [rsp+8*132]
	mov qword [rsp+8*133],r8 
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*134], rax
	mov r8, [rsp+8*134]
	mov qword [rsp+8*135] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*134]
	call    address
	mov [rsp+8*135], rax
	mov r8, 0
	mov r9, [rsp+8*135]
	mov qword [r9], r8
	mov     rsi, [rsp+8*134]
	mov     rdi, [rsp+8*129]
	call    multiAddress
	mov [rsp+8*136], rax
	mov r8, [rsp+8*136]
	mov r8, [r8]
	mov [rsp+8*136], r8
	mov r8, [rsp+8*95]
	sub r8, [rsp+8*136]
	mov qword [rsp+8*137],r8 
	mov r8, [rsp+8*133]
	imul r8, [rsp+8*137]
	mov qword [rsp+8*138],r8 
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*139], rax
	mov r8, [rsp+8*139]
	mov qword [rsp+8*140] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*139]
	call    address
	mov [rsp+8*140], rax
	mov r8, 1
	mov r9, [rsp+8*140]
	mov qword [r9], r8
	mov     rsi, [rsp+8*139]
	mov     rdi, [rsp+8*129]
	call    multiAddress
	mov [rsp+8*141], rax
	mov r8, [rsp+8*141]
	mov r8, [r8]
	mov [rsp+8*141], r8
	mov r8, [rsp+8*99]
	sub r8, [rsp+8*141]
	mov qword [rsp+8*142],r8 
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*143], rax
	mov r8, [rsp+8*143]
	mov qword [rsp+8*144] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*143]
	call    address
	mov [rsp+8*144], rax
	mov r8, 1
	mov r9, [rsp+8*144]
	mov qword [r9], r8
	mov     rsi, [rsp+8*143]
	mov     rdi, [rsp+8*129]
	call    multiAddress
	mov [rsp+8*145], rax
	mov r8, [rsp+8*145]
	mov r8, [r8]
	mov [rsp+8*145], r8
	mov r8, [rsp+8*99]
	sub r8, [rsp+8*145]
	mov qword [rsp+8*146],r8 
	mov r8, [rsp+8*142]
	imul r8, [rsp+8*146]
	mov qword [rsp+8*147],r8 
	mov r8, [rsp+8*138]
	add r8, [rsp+8*147]
	mov qword [rsp+8*148],r8 
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*149], rax
	mov r8, [rsp+8*149]
	mov qword [rsp+8*150] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*149]
	call    address
	mov [rsp+8*150], rax
	mov r8, 2
	mov r9, [rsp+8*150]
	mov qword [r9], r8
	mov     rsi, [rsp+8*149]
	mov     rdi, [rsp+8*129]
	call    multiAddress
	mov [rsp+8*151], rax
	mov r8, [rsp+8*151]
	mov r8, [r8]
	mov [rsp+8*151], r8
	mov r8, [rsp+8*103]
	sub r8, [rsp+8*151]
	mov qword [rsp+8*152],r8 
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*153], rax
	mov r8, [rsp+8*153]
	mov qword [rsp+8*154] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*153]
	call    address
	mov [rsp+8*154], rax
	mov r8, 2
	mov r9, [rsp+8*154]
	mov qword [r9], r8
	mov     rsi, [rsp+8*153]
	mov     rdi, [rsp+8*129]
	call    multiAddress
	mov [rsp+8*155], rax
	mov r8, [rsp+8*155]
	mov r8, [r8]
	mov [rsp+8*155], r8
	mov r8, [rsp+8*103]
	sub r8, [rsp+8*155]
	mov qword [rsp+8*156],r8 
	mov r8, [rsp+8*152]
	imul r8, [rsp+8*156]
	mov qword [rsp+8*157],r8 
	mov r8, [rsp+8*148]
	add r8, [rsp+8*157]
	mov qword [rsp+8*158],r8 
	mov rax,[rsp+8*158]
	leave
	ret
	mov rax,0
	leave
	ret
	
point_dot:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2216
	mov r8, [arg+8*15]
	mov qword [rsp+8*159] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*160] ,r8
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*161], rax
	mov r8, [rsp+8*161]
	mov qword [rsp+8*162] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*161]
	call    address
	mov [rsp+8*162], rax
	mov r8, 0
	mov r9, [rsp+8*162]
	mov qword [r9], r8
	mov     rsi, [rsp+8*161]
	mov     rdi, [rsp+8*160]
	call    multiAddress
	mov [rsp+8*163], rax
	mov r8, [rsp+8*163]
	mov r8, [r8]
	mov [rsp+8*163], r8
	mov r8, [rsp+8*95]
	imul r8, [rsp+8*163]
	mov qword [rsp+8*164],r8 
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*165], rax
	mov r8, [rsp+8*165]
	mov qword [rsp+8*166] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*165]
	call    address
	mov [rsp+8*166], rax
	mov r8, 1
	mov r9, [rsp+8*166]
	mov qword [r9], r8
	mov     rsi, [rsp+8*165]
	mov     rdi, [rsp+8*160]
	call    multiAddress
	mov [rsp+8*167], rax
	mov r8, [rsp+8*167]
	mov r8, [r8]
	mov [rsp+8*167], r8
	mov r8, [rsp+8*99]
	imul r8, [rsp+8*167]
	mov qword [rsp+8*168],r8 
	mov r8, [rsp+8*164]
	add r8, [rsp+8*168]
	mov qword [rsp+8*169],r8 
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*170], rax
	mov r8, [rsp+8*170]
	mov qword [rsp+8*171] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*170]
	call    address
	mov [rsp+8*171], rax
	mov r8, 2
	mov r9, [rsp+8*171]
	mov qword [r9], r8
	mov     rsi, [rsp+8*170]
	mov     rdi, [rsp+8*160]
	call    multiAddress
	mov [rsp+8*172], rax
	mov r8, [rsp+8*172]
	mov r8, [r8]
	mov [rsp+8*172], r8
	mov r8, [rsp+8*103]
	imul r8, [rsp+8*172]
	mov qword [rsp+8*173],r8 
	mov r8, [rsp+8*169]
	add r8, [rsp+8*173]
	mov qword [rsp+8*174],r8 
	mov rax,[rsp+8*174]
	leave
	ret
	mov rax,0
	leave
	ret
	
point_cross:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2216
	mov r8, [arg+8*15]
	mov qword [rsp+8*175] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*176] ,r8
	mov     rdi, 8
	call    malloc
	mov     qword [rsp+8*177], rax
	mov r8, [rsp+8*177]
	mov qword [rsp+8*178] ,r8
	mov r8, [rsp+8*178]
	mov qword [rsp+8*179] ,r8
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*180], rax
	mov r8, [rsp+8*180]
	mov qword [rsp+8*181] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*180]
	call    address
	mov [rsp+8*181], rax
	mov r8, 2
	mov r9, [rsp+8*181]
	mov qword [r9], r8
	mov     rsi, [rsp+8*180]
	mov     rdi, [rsp+8*176]
	call    multiAddress
	mov [rsp+8*182], rax
	mov r8, [rsp+8*182]
	mov r8, [r8]
	mov [rsp+8*182], r8
	mov r8, [rsp+8*99]
	imul r8, [rsp+8*182]
	mov qword [rsp+8*183],r8 
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*184], rax
	mov r8, [rsp+8*184]
	mov qword [rsp+8*185] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*184]
	call    address
	mov [rsp+8*185], rax
	mov r8, 1
	mov r9, [rsp+8*185]
	mov qword [r9], r8
	mov     rsi, [rsp+8*184]
	mov     rdi, [rsp+8*176]
	call    multiAddress
	mov [rsp+8*186], rax
	mov r8, [rsp+8*186]
	mov r8, [r8]
	mov [rsp+8*186], r8
	mov r8, [rsp+8*103]
	imul r8, [rsp+8*186]
	mov qword [rsp+8*187],r8 
	mov r8, [rsp+8*183]
	sub r8, [rsp+8*187]
	mov qword [rsp+8*188],r8 
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*189], rax
	mov r8, [rsp+8*189]
	mov qword [rsp+8*190] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*189]
	call    address
	mov [rsp+8*190], rax
	mov r8, 0
	mov r9, [rsp+8*190]
	mov qword [r9], r8
	mov     rsi, [rsp+8*189]
	mov     rdi, [rsp+8*176]
	call    multiAddress
	mov [rsp+8*191], rax
	mov r8, [rsp+8*191]
	mov r8, [r8]
	mov [rsp+8*191], r8
	mov r8, [rsp+8*103]
	imul r8, [rsp+8*191]
	mov qword [rsp+8*192],r8 
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*193], rax
	mov r8, [rsp+8*193]
	mov qword [rsp+8*194] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*193]
	call    address
	mov [rsp+8*194], rax
	mov r8, 2
	mov r9, [rsp+8*194]
	mov qword [r9], r8
	mov     rsi, [rsp+8*193]
	mov     rdi, [rsp+8*176]
	call    multiAddress
	mov [rsp+8*195], rax
	mov r8, [rsp+8*195]
	mov r8, [r8]
	mov [rsp+8*195], r8
	mov r8, [rsp+8*95]
	imul r8, [rsp+8*195]
	mov qword [rsp+8*196],r8 
	mov r8, [rsp+8*192]
	sub r8, [rsp+8*196]
	mov qword [rsp+8*197],r8 
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*198], rax
	mov r8, [rsp+8*198]
	mov qword [rsp+8*199] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*198]
	call    address
	mov [rsp+8*199], rax
	mov r8, 1
	mov r9, [rsp+8*199]
	mov qword [r9], r8
	mov     rsi, [rsp+8*198]
	mov     rdi, [rsp+8*176]
	call    multiAddress
	mov [rsp+8*200], rax
	mov r8, [rsp+8*200]
	mov r8, [r8]
	mov [rsp+8*200], r8
	mov r8, [rsp+8*95]
	imul r8, [rsp+8*200]
	mov qword [rsp+8*201],r8 
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*202], rax
	mov r8, [rsp+8*202]
	mov qword [rsp+8*203] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*202]
	call    address
	mov [rsp+8*203], rax
	mov r8, 0
	mov r9, [rsp+8*203]
	mov qword [r9], r8
	mov     rsi, [rsp+8*202]
	mov     rdi, [rsp+8*176]
	call    multiAddress
	mov [rsp+8*204], rax
	mov r8, [rsp+8*204]
	mov r8, [r8]
	mov [rsp+8*204], r8
	mov r8, [rsp+8*99]
	imul r8, [rsp+8*204]
	mov qword [rsp+8*205],r8 
	mov r8, [rsp+8*201]
	sub r8, [rsp+8*205]
	mov qword [rsp+8*206],r8 
	mov r8, [rsp+8*206]
	mov qword [arg+8*2] ,r8
	mov r8, [rsp+8*197]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*188]
	mov qword [arg+8*0] ,r8
	mov r8, [rsp+8*179]
	mov qword [arg+8*15] ,r8
	call point_set
	mov [rsp+8*207] , rax
	mov rax,[rsp+8*178]
	leave
	ret
	mov rax,0
	leave
	ret
	
point_add:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2216
	mov r8, [arg+8*15]
	mov qword [rsp+8*208] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*209] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*208]
	call    address
	mov [rsp+8*95], rax
	mov     rdi, 0
	call    mallocArray
	mov     qword [rsp+8*210], rax
	mov r8, [rsp+8*210]
	mov qword [rsp+8*211] ,r8
	mov     rsi, [rsp+8*210]
	mov     rdi, [rsp+8*95]
	call    multiAddress
	mov [rsp+8*212], rax
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*213], rax
	mov r8, [rsp+8*213]
	mov qword [rsp+8*214] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*213]
	call    address
	mov [rsp+8*214], rax
	mov r8, 0
	mov r9, [rsp+8*214]
	mov qword [r9], r8
	mov     rsi, [rsp+8*213]
	mov     rdi, [rsp+8*209]
	call    multiAddress
	mov [rsp+8*215], rax
	mov r8, [rsp+8*215]
	mov r8, [r8]
	mov [rsp+8*215], r8
	mov r8, [rsp+8*95]
	add r8, [rsp+8*215]
	mov qword [rsp+8*216],r8 
	mov r8, [rsp+8*216]
	mov r9, [rsp+8*212]
	mov qword [r9], r8
	mov     rsi, 1
	mov     rdi, [rsp+8*208]
	call    address
	mov [rsp+8*99], rax
	mov     rdi, 0
	call    mallocArray
	mov     qword [rsp+8*217], rax
	mov r8, [rsp+8*217]
	mov qword [rsp+8*218] ,r8
	mov     rsi, [rsp+8*217]
	mov     rdi, [rsp+8*99]
	call    multiAddress
	mov [rsp+8*219], rax
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*220], rax
	mov r8, [rsp+8*220]
	mov qword [rsp+8*221] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*220]
	call    address
	mov [rsp+8*221], rax
	mov r8, 1
	mov r9, [rsp+8*221]
	mov qword [r9], r8
	mov     rsi, [rsp+8*220]
	mov     rdi, [rsp+8*209]
	call    multiAddress
	mov [rsp+8*222], rax
	mov r8, [rsp+8*222]
	mov r8, [r8]
	mov [rsp+8*222], r8
	mov r8, [rsp+8*99]
	add r8, [rsp+8*222]
	mov qword [rsp+8*223],r8 
	mov r8, [rsp+8*223]
	mov r9, [rsp+8*219]
	mov qword [r9], r8
	mov     rsi, 2
	mov     rdi, [rsp+8*208]
	call    address
	mov [rsp+8*103], rax
	mov     rdi, 0
	call    mallocArray
	mov     qword [rsp+8*224], rax
	mov r8, [rsp+8*224]
	mov qword [rsp+8*225] ,r8
	mov     rsi, [rsp+8*224]
	mov     rdi, [rsp+8*103]
	call    multiAddress
	mov [rsp+8*226], rax
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*227], rax
	mov r8, [rsp+8*227]
	mov qword [rsp+8*228] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*227]
	call    address
	mov [rsp+8*228], rax
	mov r8, 2
	mov r9, [rsp+8*228]
	mov qword [r9], r8
	mov     rsi, [rsp+8*227]
	mov     rdi, [rsp+8*209]
	call    multiAddress
	mov [rsp+8*229], rax
	mov r8, [rsp+8*229]
	mov r8, [r8]
	mov [rsp+8*229], r8
	mov r8, [rsp+8*103]
	add r8, [rsp+8*229]
	mov qword [rsp+8*230],r8 
	mov r8, [rsp+8*230]
	mov r9, [rsp+8*226]
	mov qword [r9], r8
	mov rax,[rsp+8*208]
	leave
	ret
	mov rax,0
	leave
	ret
	
point_sub:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2216
	mov r8, [arg+8*15]
	mov qword [rsp+8*231] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*232] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*231]
	call    address
	mov [rsp+8*95], rax
	mov     rdi, 0
	call    mallocArray
	mov     qword [rsp+8*233], rax
	mov r8, [rsp+8*233]
	mov qword [rsp+8*234] ,r8
	mov     rsi, [rsp+8*233]
	mov     rdi, [rsp+8*95]
	call    multiAddress
	mov [rsp+8*235], rax
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*236], rax
	mov r8, [rsp+8*236]
	mov qword [rsp+8*237] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*236]
	call    address
	mov [rsp+8*237], rax
	mov r8, 0
	mov r9, [rsp+8*237]
	mov qword [r9], r8
	mov     rsi, [rsp+8*236]
	mov     rdi, [rsp+8*232]
	call    multiAddress
	mov [rsp+8*238], rax
	mov r8, [rsp+8*238]
	mov r8, [r8]
	mov [rsp+8*238], r8
	mov r8, [rsp+8*95]
	sub r8, [rsp+8*238]
	mov qword [rsp+8*239],r8 
	mov r8, [rsp+8*239]
	mov r9, [rsp+8*235]
	mov qword [r9], r8
	mov     rsi, 1
	mov     rdi, [rsp+8*231]
	call    address
	mov [rsp+8*99], rax
	mov     rdi, 0
	call    mallocArray
	mov     qword [rsp+8*240], rax
	mov r8, [rsp+8*240]
	mov qword [rsp+8*241] ,r8
	mov     rsi, [rsp+8*240]
	mov     rdi, [rsp+8*99]
	call    multiAddress
	mov [rsp+8*242], rax
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*243], rax
	mov r8, [rsp+8*243]
	mov qword [rsp+8*244] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*243]
	call    address
	mov [rsp+8*244], rax
	mov r8, 1
	mov r9, [rsp+8*244]
	mov qword [r9], r8
	mov     rsi, [rsp+8*243]
	mov     rdi, [rsp+8*232]
	call    multiAddress
	mov [rsp+8*245], rax
	mov r8, [rsp+8*245]
	mov r8, [r8]
	mov [rsp+8*245], r8
	mov r8, [rsp+8*99]
	sub r8, [rsp+8*245]
	mov qword [rsp+8*246],r8 
	mov r8, [rsp+8*246]
	mov r9, [rsp+8*242]
	mov qword [r9], r8
	mov     rsi, 2
	mov     rdi, [rsp+8*231]
	call    address
	mov [rsp+8*103], rax
	mov     rdi, 0
	call    mallocArray
	mov     qword [rsp+8*247], rax
	mov r8, [rsp+8*247]
	mov qword [rsp+8*248] ,r8
	mov     rsi, [rsp+8*247]
	mov     rdi, [rsp+8*103]
	call    multiAddress
	mov [rsp+8*249], rax
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*250], rax
	mov r8, [rsp+8*250]
	mov qword [rsp+8*251] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*250]
	call    address
	mov [rsp+8*251], rax
	mov r8, 2
	mov r9, [rsp+8*251]
	mov qword [r9], r8
	mov     rsi, [rsp+8*250]
	mov     rdi, [rsp+8*232]
	call    multiAddress
	mov [rsp+8*252], rax
	mov r8, [rsp+8*252]
	mov r8, [r8]
	mov [rsp+8*252], r8
	mov r8, [rsp+8*103]
	sub r8, [rsp+8*252]
	mov qword [rsp+8*253],r8 
	mov r8, [rsp+8*253]
	mov r9, [rsp+8*249]
	mov qword [r9], r8
	mov rax,[rsp+8*231]
	leave
	ret
	mov rax,0
	leave
	ret
	
point_printPoint:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2216
	mov r8, [arg+8*15]
	mov qword [rsp+8*254] ,r8
	mov r8, [rsp+8*95]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*255] ,r8
	mov     rdi, [rsp+8*255]
	call    toString
	mov     qword[rsp+8*256], rax
	mov     rsi, [rsp+8*256]
	mov     rdi, t381
	call    concat
	mov [rsp+8*257], rax
	mov     rsi, t386
	mov     rdi, [rsp+8*257]
	call    concat
	mov [rsp+8*258], rax
	mov r8, [rsp+8*99]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*259] ,r8
	mov     rdi, [rsp+8*259]
	call    toString
	mov     qword[rsp+8*260], rax
	mov     rsi, [rsp+8*260]
	mov     rdi, [rsp+8*258]
	call    concat
	mov [rsp+8*261], rax
	mov     rsi, t392
	mov     rdi, [rsp+8*261]
	call    concat
	mov [rsp+8*262], rax
	mov r8, [rsp+8*103]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*263] ,r8
	mov     rdi, [rsp+8*263]
	call    toString
	mov     qword[rsp+8*264], rax
	mov     rsi, [rsp+8*264]
	mov     rdi, [rsp+8*262]
	call    concat
	mov [rsp+8*265], rax
	mov     rsi, t398
	mov     rdi, [rsp+8*265]
	call    concat
	mov [rsp+8*266], rax
	mov r8, [rsp+8*266]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*267] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*267] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov rax,[rsp+8*268]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2216
	mov rax,[rsp+8*269]
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   4200
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
	
t386:
	 db 2,", " ,0

t398:
	 db 1,")" ,0

t381:
	 db 1,"(" ,0

t392:
	 db 2,", " ,0


