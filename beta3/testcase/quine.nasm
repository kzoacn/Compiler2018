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
	sub    rsp, 17568
	call global_init
	mov r10, qword [rsp+8*1]
	mov r10 , rax
	mov r11, qword [rsp+8*2]
	mov r12,0
	mov r11,r12
	mov qword [rsp+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [rsp+8*4]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*4],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*4]
	call    address
	mov [rsp+8*5], rax
	mov r10, qword [rsp+8*5]
	mov r11,t101
	mov [r10],r11
	mov qword [rsp+8*5],r10
	mov r10, qword [rsp+8*6]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*6],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 1
	mov     rdi, [rsp+8*6]
	call    address
	mov [rsp+8*7], rax
	mov r10, qword [rsp+8*7]
	mov r11,t105
	mov [r10],r11
	mov qword [rsp+8*7],r10
	mov r10, qword [rsp+8*8]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*8],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 2
	mov     rdi, [rsp+8*8]
	call    address
	mov [rsp+8*9], rax
	mov r10, qword [rsp+8*9]
	mov r11,t109
	mov [r10],r11
	mov qword [rsp+8*9],r10
	mov r10, qword [rsp+8*10]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*10],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 3
	mov     rdi, [rsp+8*10]
	call    address
	mov [rsp+8*11], rax
	mov r10, qword [rsp+8*11]
	mov r11,t113
	mov [r10],r11
	mov qword [rsp+8*11],r10
	mov r10, qword [rsp+8*12]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*12],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 4
	mov     rdi, [rsp+8*12]
	call    address
	mov [rsp+8*13], rax
	mov r10, qword [rsp+8*13]
	mov r11,t117
	mov [r10],r11
	mov qword [rsp+8*13],r10
	mov r10, qword [rsp+8*14]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*14],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 5
	mov     rdi, [rsp+8*14]
	call    address
	mov [rsp+8*15], rax
	mov r10, qword [rsp+8*15]
	mov r11,t121
	mov [r10],r11
	mov qword [rsp+8*15],r10
	mov r10, qword [rsp+8*16]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*16],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 6
	mov     rdi, [rsp+8*16]
	call    address
	mov [rsp+8*17], rax
	mov r10, qword [rsp+8*17]
	mov r11,t125
	mov [r10],r11
	mov qword [rsp+8*17],r10
	mov r10, qword [rsp+8*18]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*18],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*18]
	call    address
	mov [rsp+8*19], rax
	mov r10, qword [rsp+8*19]
	mov r11,t129
	mov [r10],r11
	mov qword [rsp+8*19],r10
	mov r10, qword [rsp+8*20]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*20],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*20]
	call    address
	mov [rsp+8*21], rax
	mov r10, qword [rsp+8*21]
	mov r11,t133
	mov [r10],r11
	mov qword [rsp+8*21],r10
	mov r10, qword [rsp+8*22]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*22],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 9
	mov     rdi, [rsp+8*22]
	call    address
	mov [rsp+8*23], rax
	mov r10, qword [rsp+8*23]
	mov r11,t137
	mov [r10],r11
	mov qword [rsp+8*23],r10
	mov r10, qword [rsp+8*24]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*24],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 10
	mov     rdi, [rsp+8*24]
	call    address
	mov [rsp+8*25], rax
	mov r10, qword [rsp+8*25]
	mov r11,t141
	mov [r10],r11
	mov qword [rsp+8*25],r10
	mov r10, qword [rsp+8*26]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*26],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 11
	mov     rdi, [rsp+8*26]
	call    address
	mov [rsp+8*27], rax
	mov r10, qword [rsp+8*27]
	mov r11,t145
	mov [r10],r11
	mov qword [rsp+8*27],r10
	mov r10, qword [rsp+8*28]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*28],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 12
	mov     rdi, [rsp+8*28]
	call    address
	mov [rsp+8*29], rax
	mov r10, qword [rsp+8*29]
	mov r11,t149
	mov [r10],r11
	mov qword [rsp+8*29],r10
	mov r10, qword [rsp+8*30]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*30],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 13
	mov     rdi, [rsp+8*30]
	call    address
	mov [rsp+8*31], rax
	mov r10, qword [rsp+8*31]
	mov r11,t153
	mov [r10],r11
	mov qword [rsp+8*31],r10
	mov r10, qword [rsp+8*32]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*32],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 14
	mov     rdi, [rsp+8*32]
	call    address
	mov [rsp+8*33], rax
	mov r10, qword [rsp+8*33]
	mov r11,t157
	mov [r10],r11
	mov qword [rsp+8*33],r10
	mov r10, qword [rsp+8*34]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*34],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 15
	mov     rdi, [rsp+8*34]
	call    address
	mov [rsp+8*35], rax
	mov r10, qword [rsp+8*35]
	mov r11,t161
	mov [r10],r11
	mov qword [rsp+8*35],r10
	mov r10, qword [rsp+8*36]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*36],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 16
	mov     rdi, [rsp+8*36]
	call    address
	mov [rsp+8*37], rax
	mov r10, qword [rsp+8*37]
	mov r11,t165
	mov [r10],r11
	mov qword [rsp+8*37],r10
	mov r10, qword [rsp+8*38]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*38],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 17
	mov     rdi, [rsp+8*38]
	call    address
	mov [rsp+8*39], rax
	mov r10, qword [rsp+8*39]
	mov r11,t169
	mov [r10],r11
	mov qword [rsp+8*39],r10
	mov r10, qword [rsp+8*40]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*40],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 18
	mov     rdi, [rsp+8*40]
	call    address
	mov [rsp+8*41], rax
	mov r10, qword [rsp+8*41]
	mov r11,t173
	mov [r10],r11
	mov qword [rsp+8*41],r10
	mov r10, qword [rsp+8*42]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*42],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 19
	mov     rdi, [rsp+8*42]
	call    address
	mov [rsp+8*43], rax
	mov r10, qword [rsp+8*43]
	mov r11,t177
	mov [r10],r11
	mov qword [rsp+8*43],r10
	mov r10, qword [rsp+8*44]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*44],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 20
	mov     rdi, [rsp+8*44]
	call    address
	mov [rsp+8*45], rax
	mov r10, qword [rsp+8*45]
	mov r11,t181
	mov [r10],r11
	mov qword [rsp+8*45],r10
	mov r10, qword [rsp+8*46]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*46],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 21
	mov     rdi, [rsp+8*46]
	call    address
	mov [rsp+8*47], rax
	mov r10, qword [rsp+8*47]
	mov r11,t185
	mov [r10],r11
	mov qword [rsp+8*47],r10
	mov r10, qword [rsp+8*48]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*48],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 22
	mov     rdi, [rsp+8*48]
	call    address
	mov [rsp+8*49], rax
	mov r10, qword [rsp+8*49]
	mov r11,t189
	mov [r10],r11
	mov qword [rsp+8*49],r10
	mov r10, qword [rsp+8*50]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*50],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 23
	mov     rdi, [rsp+8*50]
	call    address
	mov [rsp+8*51], rax
	mov r10, qword [rsp+8*51]
	mov r11,t193
	mov [r10],r11
	mov qword [rsp+8*51],r10
	mov r10, qword [rsp+8*52]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*52],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 24
	mov     rdi, [rsp+8*52]
	call    address
	mov [rsp+8*53], rax
	mov r10, qword [rsp+8*53]
	mov r11,t197
	mov [r10],r11
	mov qword [rsp+8*53],r10
	mov r10, qword [rsp+8*54]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*54],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 25
	mov     rdi, [rsp+8*54]
	call    address
	mov [rsp+8*55], rax
	mov r10, qword [rsp+8*55]
	mov r11,t201
	mov [r10],r11
	mov qword [rsp+8*55],r10
	mov r10, qword [rsp+8*56]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*56],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*56]
	call    address
	mov [rsp+8*57], rax
	mov r10, qword [rsp+8*57]
	mov r11,t205
	mov [r10],r11
	mov qword [rsp+8*57],r10
	mov r10, qword [rsp+8*58]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*58],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 27
	mov     rdi, [rsp+8*58]
	call    address
	mov [rsp+8*59], rax
	mov r10, qword [rsp+8*59]
	mov r11,t209
	mov [r10],r11
	mov qword [rsp+8*59],r10
	mov r10, qword [rsp+8*60]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*60],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*60]
	call    address
	mov [rsp+8*61], rax
	mov r10, qword [rsp+8*61]
	mov r11,t213
	mov [r10],r11
	mov qword [rsp+8*61],r10
	mov r10, qword [rsp+8*62]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*62],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 29
	mov     rdi, [rsp+8*62]
	call    address
	mov [rsp+8*63], rax
	mov r10, qword [rsp+8*63]
	mov r11,t217
	mov [r10],r11
	mov qword [rsp+8*63],r10
	mov r10, qword [rsp+8*64]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*64],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 30
	mov     rdi, [rsp+8*64]
	call    address
	mov [rsp+8*65], rax
	mov r10, qword [rsp+8*65]
	mov r11,t221
	mov [r10],r11
	mov qword [rsp+8*65],r10
	mov r10, qword [rsp+8*66]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*66],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 31
	mov     rdi, [rsp+8*66]
	call    address
	mov [rsp+8*67], rax
	mov r10, qword [rsp+8*67]
	mov r11,t225
	mov [r10],r11
	mov qword [rsp+8*67],r10
	mov r10, qword [rsp+8*68]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*68],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 32
	mov     rdi, [rsp+8*68]
	call    address
	mov [rsp+8*69], rax
	mov r10, qword [rsp+8*69]
	mov r11,t229
	mov [r10],r11
	mov qword [rsp+8*69],r10
	mov r10, qword [rsp+8*70]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*70],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 33
	mov     rdi, [rsp+8*70]
	call    address
	mov [rsp+8*71], rax
	mov r10, qword [rsp+8*71]
	mov r11,t233
	mov [r10],r11
	mov qword [rsp+8*71],r10
	mov r10, qword [rsp+8*72]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*72],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 34
	mov     rdi, [rsp+8*72]
	call    address
	mov [rsp+8*73], rax
	mov r10, qword [rsp+8*73]
	mov r11,t237
	mov [r10],r11
	mov qword [rsp+8*73],r10
	mov r10, qword [rsp+8*74]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*74],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 35
	mov     rdi, [rsp+8*74]
	call    address
	mov [rsp+8*75], rax
	mov r10, qword [rsp+8*75]
	mov r11,t241
	mov [r10],r11
	mov qword [rsp+8*75],r10
	mov r10, qword [rsp+8*76]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*76],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 36
	mov     rdi, [rsp+8*76]
	call    address
	mov [rsp+8*77], rax
	mov r10, qword [rsp+8*77]
	mov r11,t245
	mov [r10],r11
	mov qword [rsp+8*77],r10
	mov r10, qword [rsp+8*78]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*78],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 37
	mov     rdi, [rsp+8*78]
	call    address
	mov [rsp+8*79], rax
	mov r10, qword [rsp+8*79]
	mov r11,t249
	mov [r10],r11
	mov qword [rsp+8*79],r10
	mov r10, qword [rsp+8*80]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*80],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 38
	mov     rdi, [rsp+8*80]
	call    address
	mov [rsp+8*81], rax
	mov r10, qword [rsp+8*81]
	mov r11,t253
	mov [r10],r11
	mov qword [rsp+8*81],r10
	mov r10, qword [rsp+8*82]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*82],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 39
	mov     rdi, [rsp+8*82]
	call    address
	mov [rsp+8*83], rax
	mov r10, qword [rsp+8*83]
	mov r11,t257
	mov [r10],r11
	mov qword [rsp+8*83],r10
	mov r10, qword [rsp+8*84]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*84],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 40
	mov     rdi, [rsp+8*84]
	call    address
	mov [rsp+8*85], rax
	mov r10, qword [rsp+8*85]
	mov r11,t261
	mov [r10],r11
	mov qword [rsp+8*85],r10
	mov r10, qword [rsp+8*86]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*86],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 41
	mov     rdi, [rsp+8*86]
	call    address
	mov [rsp+8*87], rax
	mov r10, qword [rsp+8*87]
	mov r11,t265
	mov [r10],r11
	mov qword [rsp+8*87],r10
	mov r10, qword [rsp+8*88]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*88],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 42
	mov     rdi, [rsp+8*88]
	call    address
	mov [rsp+8*89], rax
	mov r10, qword [rsp+8*89]
	mov r11,t269
	mov [r10],r11
	mov qword [rsp+8*89],r10
	mov r10, qword [rsp+8*90]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*90],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 43
	mov     rdi, [rsp+8*90]
	call    address
	mov [rsp+8*91], rax
	mov r10, qword [rsp+8*91]
	mov r11,t273
	mov [r10],r11
	mov qword [rsp+8*91],r10
	mov r10, qword [rsp+8*92]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*92],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 44
	mov     rdi, [rsp+8*92]
	call    address
	mov [rsp+8*93], rax
	mov r10, qword [rsp+8*93]
	mov r11,t277
	mov [r10],r11
	mov qword [rsp+8*93],r10
	mov r10, qword [rsp+8*94]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*94],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 45
	mov     rdi, [rsp+8*94]
	call    address
	mov [rsp+8*95], rax
	mov r10, qword [rsp+8*95]
	mov r11,t281
	mov [r10],r11
	mov qword [rsp+8*95],r10
	mov r10, qword [rsp+8*96]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*96],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 46
	mov     rdi, [rsp+8*96]
	call    address
	mov [rsp+8*97], rax
	mov r10, qword [rsp+8*97]
	mov r11,t285
	mov [r10],r11
	mov qword [rsp+8*97],r10
	mov r10, qword [rsp+8*98]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*98],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 47
	mov     rdi, [rsp+8*98]
	call    address
	mov [rsp+8*99], rax
	mov r10, qword [rsp+8*99]
	mov r11,t289
	mov [r10],r11
	mov qword [rsp+8*99],r10
	mov r10, qword [rsp+8*100]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*100],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 48
	mov     rdi, [rsp+8*100]
	call    address
	mov [rsp+8*101], rax
	mov r10, qword [rsp+8*101]
	mov r11,t293
	mov [r10],r11
	mov qword [rsp+8*101],r10
	mov r10, qword [rsp+8*102]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*102],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 49
	mov     rdi, [rsp+8*102]
	call    address
	mov [rsp+8*103], rax
	mov r10, qword [rsp+8*103]
	mov r11,t297
	mov [r10],r11
	mov qword [rsp+8*103],r10
	mov r10, qword [rsp+8*104]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*104],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 50
	mov     rdi, [rsp+8*104]
	call    address
	mov [rsp+8*105], rax
	mov r10, qword [rsp+8*105]
	mov r11,t301
	mov [r10],r11
	mov qword [rsp+8*105],r10
	mov r10, qword [rsp+8*106]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*106],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 51
	mov     rdi, [rsp+8*106]
	call    address
	mov [rsp+8*107], rax
	mov r10, qword [rsp+8*107]
	mov r11,t305
	mov [r10],r11
	mov qword [rsp+8*107],r10
	mov r10, qword [rsp+8*108]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*108],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 52
	mov     rdi, [rsp+8*108]
	call    address
	mov [rsp+8*109], rax
	mov r10, qword [rsp+8*109]
	mov r11,t309
	mov [r10],r11
	mov qword [rsp+8*109],r10
	mov r10, qword [rsp+8*110]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*110],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 53
	mov     rdi, [rsp+8*110]
	call    address
	mov [rsp+8*111], rax
	mov r10, qword [rsp+8*111]
	mov r11,t313
	mov [r10],r11
	mov qword [rsp+8*111],r10
	mov r10, qword [rsp+8*112]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*112],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 54
	mov     rdi, [rsp+8*112]
	call    address
	mov [rsp+8*113], rax
	mov r10, qword [rsp+8*113]
	mov r11,t317
	mov [r10],r11
	mov qword [rsp+8*113],r10
	mov r10, qword [rsp+8*114]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*114],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 55
	mov     rdi, [rsp+8*114]
	call    address
	mov [rsp+8*115], rax
	mov r10, qword [rsp+8*115]
	mov r11,t321
	mov [r10],r11
	mov qword [rsp+8*115],r10
	mov r10, qword [rsp+8*116]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*116],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 56
	mov     rdi, [rsp+8*116]
	call    address
	mov [rsp+8*117], rax
	mov r10, qword [rsp+8*117]
	mov r11,t325
	mov [r10],r11
	mov qword [rsp+8*117],r10
	mov r10, qword [rsp+8*118]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*118],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 57
	mov     rdi, [rsp+8*118]
	call    address
	mov [rsp+8*119], rax
	mov r10, qword [rsp+8*119]
	mov r11,t329
	mov [r10],r11
	mov qword [rsp+8*119],r10
	mov r10, qword [rsp+8*120]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*120],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 58
	mov     rdi, [rsp+8*120]
	call    address
	mov [rsp+8*121], rax
	mov r10, qword [rsp+8*121]
	mov r11,t333
	mov [r10],r11
	mov qword [rsp+8*121],r10
	mov r10, qword [rsp+8*122]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*122],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 59
	mov     rdi, [rsp+8*122]
	call    address
	mov [rsp+8*123], rax
	mov r10, qword [rsp+8*123]
	mov r11,t337
	mov [r10],r11
	mov qword [rsp+8*123],r10
	mov r10, qword [rsp+8*124]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*124],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 60
	mov     rdi, [rsp+8*124]
	call    address
	mov [rsp+8*125], rax
	mov r10, qword [rsp+8*125]
	mov r11,t341
	mov [r10],r11
	mov qword [rsp+8*125],r10
	mov r10, qword [rsp+8*126]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*126],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 61
	mov     rdi, [rsp+8*126]
	call    address
	mov [rsp+8*127], rax
	mov r10, qword [rsp+8*127]
	mov r11,t345
	mov [r10],r11
	mov qword [rsp+8*127],r10
	mov r10, qword [rsp+8*128]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*128],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 62
	mov     rdi, [rsp+8*128]
	call    address
	mov [rsp+8*129], rax
	mov r10, qword [rsp+8*129]
	mov r11,t349
	mov [r10],r11
	mov qword [rsp+8*129],r10
	mov r10, qword [rsp+8*130]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*130],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 63
	mov     rdi, [rsp+8*130]
	call    address
	mov [rsp+8*131], rax
	mov r10, qword [rsp+8*131]
	mov r11,t353
	mov [r10],r11
	mov qword [rsp+8*131],r10
	mov r10, qword [rsp+8*132]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*132],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 64
	mov     rdi, [rsp+8*132]
	call    address
	mov [rsp+8*133], rax
	mov r10, qword [rsp+8*133]
	mov r11,t357
	mov [r10],r11
	mov qword [rsp+8*133],r10
	mov r10, qword [rsp+8*134]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*134],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*134]
	call    address
	mov [rsp+8*135], rax
	mov r10, qword [rsp+8*135]
	mov r11,t361
	mov [r10],r11
	mov qword [rsp+8*135],r10
	mov r10, qword [rsp+8*136]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*136],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 66
	mov     rdi, [rsp+8*136]
	call    address
	mov [rsp+8*137], rax
	mov r10, qword [rsp+8*137]
	mov r11,t365
	mov [r10],r11
	mov qword [rsp+8*137],r10
	mov r10, qword [rsp+8*138]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*138],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*138]
	call    address
	mov [rsp+8*139], rax
	mov r10, qword [rsp+8*139]
	mov r11,t369
	mov [r10],r11
	mov qword [rsp+8*139],r10
	mov r10, qword [rsp+8*140]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*140],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 68
	mov     rdi, [rsp+8*140]
	call    address
	mov [rsp+8*141], rax
	mov r10, qword [rsp+8*141]
	mov r11,t373
	mov [r10],r11
	mov qword [rsp+8*141],r10
	mov r10, qword [rsp+8*142]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*142],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*142]
	call    address
	mov [rsp+8*143], rax
	mov r10, qword [rsp+8*143]
	mov r11,t377
	mov [r10],r11
	mov qword [rsp+8*143],r10
	mov r10, qword [rsp+8*144]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*144],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 70
	mov     rdi, [rsp+8*144]
	call    address
	mov [rsp+8*145], rax
	mov r10, qword [rsp+8*145]
	mov r11,t381
	mov [r10],r11
	mov qword [rsp+8*145],r10
	mov r10, qword [rsp+8*146]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*146],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*146]
	call    address
	mov [rsp+8*147], rax
	mov r10, qword [rsp+8*147]
	mov r11,t385
	mov [r10],r11
	mov qword [rsp+8*147],r10
	mov r10, qword [rsp+8*148]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*148],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 72
	mov     rdi, [rsp+8*148]
	call    address
	mov [rsp+8*149], rax
	mov r10, qword [rsp+8*149]
	mov r11,t389
	mov [r10],r11
	mov qword [rsp+8*149],r10
	mov r10, qword [rsp+8*150]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*150],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 73
	mov     rdi, [rsp+8*150]
	call    address
	mov [rsp+8*151], rax
	mov r10, qword [rsp+8*151]
	mov r11,t393
	mov [r10],r11
	mov qword [rsp+8*151],r10
	mov r10, qword [rsp+8*152]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*152],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 74
	mov     rdi, [rsp+8*152]
	call    address
	mov [rsp+8*153], rax
	mov r10, qword [rsp+8*153]
	mov r11,t397
	mov [r10],r11
	mov qword [rsp+8*153],r10
	mov r10, qword [rsp+8*154]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*154],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 75
	mov     rdi, [rsp+8*154]
	call    address
	mov [rsp+8*155], rax
	mov r10, qword [rsp+8*155]
	mov r11,t401
	mov [r10],r11
	mov qword [rsp+8*155],r10
	mov r10, qword [rsp+8*156]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*156],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*156]
	call    address
	mov [rsp+8*157], rax
	mov r10, qword [rsp+8*157]
	mov r11,t405
	mov [r10],r11
	mov qword [rsp+8*157],r10
	mov r10, qword [rsp+8*158]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*158],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 77
	mov     rdi, [rsp+8*158]
	call    address
	mov [rsp+8*159], rax
	mov r10, qword [rsp+8*159]
	mov r11,t409
	mov [r10],r11
	mov qword [rsp+8*159],r10
	mov r10, qword [rsp+8*160]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*160],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 78
	mov     rdi, [rsp+8*160]
	call    address
	mov [rsp+8*161], rax
	mov r10, qword [rsp+8*161]
	mov r11,t413
	mov [r10],r11
	mov qword [rsp+8*161],r10
	mov r10, qword [rsp+8*162]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*162],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 79
	mov     rdi, [rsp+8*162]
	call    address
	mov [rsp+8*163], rax
	mov r10, qword [rsp+8*163]
	mov r11,t417
	mov [r10],r11
	mov qword [rsp+8*163],r10
	mov r10, qword [rsp+8*164]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*164],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*164]
	call    address
	mov [rsp+8*165], rax
	mov r10, qword [rsp+8*165]
	mov r11,t421
	mov [r10],r11
	mov qword [rsp+8*165],r10
	mov r10, qword [rsp+8*166]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*166],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*166]
	call    address
	mov [rsp+8*167], rax
	mov r10, qword [rsp+8*167]
	mov r11,t425
	mov [r10],r11
	mov qword [rsp+8*167],r10
	mov r10, qword [rsp+8*168]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*168],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*168]
	call    address
	mov [rsp+8*169], rax
	mov r10, qword [rsp+8*169]
	mov r11,t429
	mov [r10],r11
	mov qword [rsp+8*169],r10
	mov r10, qword [rsp+8*170]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*170],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 83
	mov     rdi, [rsp+8*170]
	call    address
	mov [rsp+8*171], rax
	mov r10, qword [rsp+8*171]
	mov r11,t433
	mov [r10],r11
	mov qword [rsp+8*171],r10
	mov r10, qword [rsp+8*172]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*172],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 84
	mov     rdi, [rsp+8*172]
	call    address
	mov [rsp+8*173], rax
	mov r10, qword [rsp+8*173]
	mov r11,t437
	mov [r10],r11
	mov qword [rsp+8*173],r10
	mov r10, qword [rsp+8*174]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*174],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 85
	mov     rdi, [rsp+8*174]
	call    address
	mov [rsp+8*175], rax
	mov r10, qword [rsp+8*175]
	mov r11,t441
	mov [r10],r11
	mov qword [rsp+8*175],r10
	mov r10, qword [rsp+8*176]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*176],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 86
	mov     rdi, [rsp+8*176]
	call    address
	mov [rsp+8*177], rax
	mov r10, qword [rsp+8*177]
	mov r11,t445
	mov [r10],r11
	mov qword [rsp+8*177],r10
	mov r10, qword [rsp+8*178]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*178],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 87
	mov     rdi, [rsp+8*178]
	call    address
	mov [rsp+8*179], rax
	mov r10, qword [rsp+8*179]
	mov r11,t449
	mov [r10],r11
	mov qword [rsp+8*179],r10
	mov r10, qword [rsp+8*180]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*180],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 88
	mov     rdi, [rsp+8*180]
	call    address
	mov [rsp+8*181], rax
	mov r10, qword [rsp+8*181]
	mov r11,t453
	mov [r10],r11
	mov qword [rsp+8*181],r10
	mov r10, qword [rsp+8*182]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*182],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 89
	mov     rdi, [rsp+8*182]
	call    address
	mov [rsp+8*183], rax
	mov r10, qword [rsp+8*183]
	mov r11,t457
	mov [r10],r11
	mov qword [rsp+8*183],r10
	mov r10, qword [rsp+8*184]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*184],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 90
	mov     rdi, [rsp+8*184]
	call    address
	mov [rsp+8*185], rax
	mov r10, qword [rsp+8*185]
	mov r11,t461
	mov [r10],r11
	mov qword [rsp+8*185],r10
	mov r10, qword [rsp+8*186]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*186],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 91
	mov     rdi, [rsp+8*186]
	call    address
	mov [rsp+8*187], rax
	mov r10, qword [rsp+8*187]
	mov r11,t465
	mov [r10],r11
	mov qword [rsp+8*187],r10
	mov r10, qword [rsp+8*188]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*188],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 92
	mov     rdi, [rsp+8*188]
	call    address
	mov [rsp+8*189], rax
	mov r10, qword [rsp+8*189]
	mov r11,t469
	mov [r10],r11
	mov qword [rsp+8*189],r10
	mov r10, qword [rsp+8*191]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*191],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*191]
	call    address
	mov [rsp+8*192], rax
	mov r10, qword [rsp+8*192]
	mov r11,t473
	mov [r10],r11
	mov qword [rsp+8*192],r10
	mov r10, qword [rsp+8*193]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*193],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 1
	mov     rdi, [rsp+8*193]
	call    address
	mov [rsp+8*194], rax
	mov r10, qword [rsp+8*194]
	mov r11,t477
	mov [r10],r11
	mov qword [rsp+8*194],r10
	mov r10, qword [rsp+8*195]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*195],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 2
	mov     rdi, [rsp+8*195]
	call    address
	mov [rsp+8*196], rax
	mov r10, qword [rsp+8*196]
	mov r11,t481
	mov [r10],r11
	mov qword [rsp+8*196],r10
	mov r10, qword [rsp+8*197]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*197],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 3
	mov     rdi, [rsp+8*197]
	call    address
	mov [rsp+8*198], rax
	mov r10, qword [rsp+8*198]
	mov r11,t485
	mov [r10],r11
	mov qword [rsp+8*198],r10
	mov r10, qword [rsp+8*199]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*199],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 4
	mov     rdi, [rsp+8*199]
	call    address
	mov [rsp+8*200], rax
	mov r10, qword [rsp+8*200]
	mov r11,t489
	mov [r10],r11
	mov qword [rsp+8*200],r10
	mov r10, qword [rsp+8*201]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*201],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 5
	mov     rdi, [rsp+8*201]
	call    address
	mov [rsp+8*202], rax
	mov r10, qword [rsp+8*202]
	mov r11,t493
	mov [r10],r11
	mov qword [rsp+8*202],r10
	mov r10, qword [rsp+8*203]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*203],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 6
	mov     rdi, [rsp+8*203]
	call    address
	mov [rsp+8*204], rax
	mov r10, qword [rsp+8*204]
	mov r11,t497
	mov [r10],r11
	mov qword [rsp+8*204],r10
	mov r10, qword [rsp+8*205]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*205],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*205]
	call    address
	mov [rsp+8*206], rax
	mov r10, qword [rsp+8*206]
	mov r11,t501
	mov [r10],r11
	mov qword [rsp+8*206],r10
	mov r10, qword [rsp+8*207]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*207],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*207]
	call    address
	mov [rsp+8*208], rax
	mov r10, qword [rsp+8*208]
	mov r11,t505
	mov [r10],r11
	mov qword [rsp+8*208],r10
	mov r10, qword [rsp+8*209]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*209],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 9
	mov     rdi, [rsp+8*209]
	call    address
	mov [rsp+8*210], rax
	mov r10, qword [rsp+8*210]
	mov r11,t509
	mov [r10],r11
	mov qword [rsp+8*210],r10
	mov r10, qword [rsp+8*211]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*211],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 10
	mov     rdi, [rsp+8*211]
	call    address
	mov [rsp+8*212], rax
	mov r10, qword [rsp+8*212]
	mov r11,t513
	mov [r10],r11
	mov qword [rsp+8*212],r10
	mov r10, qword [rsp+8*213]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*213],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 11
	mov     rdi, [rsp+8*213]
	call    address
	mov [rsp+8*214], rax
	mov r10, qword [rsp+8*214]
	mov r11,t517
	mov [r10],r11
	mov qword [rsp+8*214],r10
	mov r10, qword [rsp+8*215]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*215],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 12
	mov     rdi, [rsp+8*215]
	call    address
	mov [rsp+8*216], rax
	mov r10, qword [rsp+8*216]
	mov r11,t521
	mov [r10],r11
	mov qword [rsp+8*216],r10
	mov r10, qword [rsp+8*217]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*217],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 13
	mov     rdi, [rsp+8*217]
	call    address
	mov [rsp+8*218], rax
	mov r10, qword [rsp+8*218]
	mov r11,t525
	mov [r10],r11
	mov qword [rsp+8*218],r10
	mov r10, qword [rsp+8*219]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*219],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 14
	mov     rdi, [rsp+8*219]
	call    address
	mov [rsp+8*220], rax
	mov r10, qword [rsp+8*220]
	mov r11,t529
	mov [r10],r11
	mov qword [rsp+8*220],r10
	mov r10, qword [rsp+8*221]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*221],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 15
	mov     rdi, [rsp+8*221]
	call    address
	mov [rsp+8*222], rax
	mov r10, qword [rsp+8*222]
	mov r11,t533
	mov [r10],r11
	mov qword [rsp+8*222],r10
	mov r10, qword [rsp+8*223]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*223],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 16
	mov     rdi, [rsp+8*223]
	call    address
	mov [rsp+8*224], rax
	mov r10, qword [rsp+8*224]
	mov r11,t537
	mov [r10],r11
	mov qword [rsp+8*224],r10
	mov r10, qword [rsp+8*225]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*225],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 17
	mov     rdi, [rsp+8*225]
	call    address
	mov [rsp+8*226], rax
	mov r10, qword [rsp+8*226]
	mov r11,t541
	mov [r10],r11
	mov qword [rsp+8*226],r10
	mov r10, qword [rsp+8*227]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*227],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 18
	mov     rdi, [rsp+8*227]
	call    address
	mov [rsp+8*228], rax
	mov r10, qword [rsp+8*228]
	mov r11,t545
	mov [r10],r11
	mov qword [rsp+8*228],r10
	mov r10, qword [rsp+8*229]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*229],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 19
	mov     rdi, [rsp+8*229]
	call    address
	mov [rsp+8*230], rax
	mov r10, qword [rsp+8*230]
	mov r11,t549
	mov [r10],r11
	mov qword [rsp+8*230],r10
	mov r10, qword [rsp+8*231]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*231],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 20
	mov     rdi, [rsp+8*231]
	call    address
	mov [rsp+8*232], rax
	mov r10, qword [rsp+8*232]
	mov r11,t553
	mov [r10],r11
	mov qword [rsp+8*232],r10
	mov r10, qword [rsp+8*233]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*233],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 21
	mov     rdi, [rsp+8*233]
	call    address
	mov [rsp+8*234], rax
	mov r10, qword [rsp+8*234]
	mov r11,t557
	mov [r10],r11
	mov qword [rsp+8*234],r10
	mov r10, qword [rsp+8*235]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*235],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 22
	mov     rdi, [rsp+8*235]
	call    address
	mov [rsp+8*236], rax
	mov r10, qword [rsp+8*236]
	mov r11,t561
	mov [r10],r11
	mov qword [rsp+8*236],r10
	mov r10, qword [rsp+8*237]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*237],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 23
	mov     rdi, [rsp+8*237]
	call    address
	mov [rsp+8*238], rax
	mov r10, qword [rsp+8*238]
	mov r11,t565
	mov [r10],r11
	mov qword [rsp+8*238],r10
	mov r10, qword [rsp+8*239]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*239],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 24
	mov     rdi, [rsp+8*239]
	call    address
	mov [rsp+8*240], rax
	mov r10, qword [rsp+8*240]
	mov r11,t569
	mov [r10],r11
	mov qword [rsp+8*240],r10
	mov r10, qword [rsp+8*241]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*241],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 25
	mov     rdi, [rsp+8*241]
	call    address
	mov [rsp+8*242], rax
	mov r10, qword [rsp+8*242]
	mov r11,t573
	mov [r10],r11
	mov qword [rsp+8*242],r10
	mov r10, qword [rsp+8*243]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*243],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*243]
	call    address
	mov [rsp+8*244], rax
	mov r10, qword [rsp+8*244]
	mov r11,t577
	mov [r10],r11
	mov qword [rsp+8*244],r10
	mov r10, qword [rsp+8*245]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*245],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 27
	mov     rdi, [rsp+8*245]
	call    address
	mov [rsp+8*246], rax
	mov r10, qword [rsp+8*246]
	mov r11,t581
	mov [r10],r11
	mov qword [rsp+8*246],r10
	mov r10, qword [rsp+8*247]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*247],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*247]
	call    address
	mov [rsp+8*248], rax
	mov r10, qword [rsp+8*248]
	mov r11,t585
	mov [r10],r11
	mov qword [rsp+8*248],r10
	mov r10, qword [rsp+8*249]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*249],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 29
	mov     rdi, [rsp+8*249]
	call    address
	mov [rsp+8*250], rax
	mov r10, qword [rsp+8*250]
	mov r11,t589
	mov [r10],r11
	mov qword [rsp+8*250],r10
	mov r10, qword [rsp+8*251]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*251],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 30
	mov     rdi, [rsp+8*251]
	call    address
	mov [rsp+8*252], rax
	mov r10, qword [rsp+8*252]
	mov r11,t593
	mov [r10],r11
	mov qword [rsp+8*252],r10
	mov r10, qword [rsp+8*253]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*253],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*253]
	call    address
	mov [rsp+8*254], rax
	mov r10, qword [rsp+8*255]
	mov r11, qword [rsp+8*254]
	mov r10, [r11]
	mov qword [rsp+8*255],r10
	mov qword [rsp+8*254],r11
	mov r10, qword [rsp+8*256]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*256],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*256]
	call    address
	mov [rsp+8*257], rax
	mov r10, qword [rsp+8*258]
	mov r11, qword [rsp+8*257]
	mov r10, [r11]
	mov qword [rsp+8*258],r10
	mov qword [rsp+8*257],r11
	mov     rsi, [rsp+8*258]
	mov     rdi, [rsp+8*255]
	call    concat
	mov [rsp+8*259], rax
	mov r10, qword [rsp+8*260]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*260],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*260]
	call    address
	mov [rsp+8*261], rax
	mov r10, qword [rsp+8*262]
	mov r11, qword [rsp+8*261]
	mov r10, [r11]
	mov qword [rsp+8*262],r10
	mov qword [rsp+8*261],r11
	mov     rsi, [rsp+8*262]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*263], rax
	mov r10, qword [rsp+8*264]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*264],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*264]
	call    address
	mov [rsp+8*265], rax
	mov r10, qword [rsp+8*266]
	mov r11, qword [rsp+8*265]
	mov r10, [r11]
	mov qword [rsp+8*266],r10
	mov qword [rsp+8*265],r11
	mov     rsi, [rsp+8*266]
	mov     rdi, [rsp+8*263]
	call    concat
	mov [rsp+8*267], rax
	mov r10, qword [rsp+8*268]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*268],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*268]
	call    address
	mov [rsp+8*269], rax
	mov r10, qword [rsp+8*270]
	mov r11, qword [rsp+8*269]
	mov r10, [r11]
	mov qword [rsp+8*270],r10
	mov qword [rsp+8*269],r11
	mov     rsi, [rsp+8*270]
	mov     rdi, [rsp+8*267]
	call    concat
	mov [rsp+8*271], rax
	mov r10, qword [rsp+8*272]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*272],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*272]
	call    address
	mov [rsp+8*273], rax
	mov r10, qword [rsp+8*274]
	mov r11, qword [rsp+8*273]
	mov r10, [r11]
	mov qword [rsp+8*274],r10
	mov qword [rsp+8*273],r11
	mov     rsi, [rsp+8*274]
	mov     rdi, [rsp+8*271]
	call    concat
	mov [rsp+8*275], rax
	mov r10, qword [rsp+8*276]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*276],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*276]
	call    address
	mov [rsp+8*277], rax
	mov r10, qword [rsp+8*278]
	mov r11, qword [rsp+8*277]
	mov r10, [r11]
	mov qword [rsp+8*278],r10
	mov qword [rsp+8*277],r11
	mov     rsi, [rsp+8*278]
	mov     rdi, [rsp+8*275]
	call    concat
	mov [rsp+8*279], rax
	mov r10, qword [rsp+8*280]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*280],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 66
	mov     rdi, [rsp+8*280]
	call    address
	mov [rsp+8*281], rax
	mov r10, qword [rsp+8*282]
	mov r11, qword [rsp+8*281]
	mov r10, [r11]
	mov qword [rsp+8*282],r10
	mov qword [rsp+8*281],r11
	mov     rsi, [rsp+8*282]
	mov     rdi, [rsp+8*279]
	call    concat
	mov [rsp+8*283], rax
	mov r10, qword [rsp+8*284]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*284],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*284]
	call    address
	mov [rsp+8*285], rax
	mov r10, qword [rsp+8*286]
	mov r11, qword [rsp+8*285]
	mov r10, [r11]
	mov qword [rsp+8*286],r10
	mov qword [rsp+8*285],r11
	mov     rsi, [rsp+8*286]
	mov     rdi, [rsp+8*283]
	call    concat
	mov [rsp+8*287], rax
	mov r10, qword [rsp+8*288]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*288],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*288]
	call    address
	mov [rsp+8*289], rax
	mov r10, qword [rsp+8*290]
	mov r11, qword [rsp+8*289]
	mov r10, [r11]
	mov qword [rsp+8*290],r10
	mov qword [rsp+8*289],r11
	mov     rsi, [rsp+8*290]
	mov     rdi, [rsp+8*287]
	call    concat
	mov [rsp+8*291], rax
	mov r10, qword [rsp+8*292]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*292],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*292]
	call    address
	mov [rsp+8*293], rax
	mov r10, qword [rsp+8*294]
	mov r11, qword [rsp+8*293]
	mov r10, [r11]
	mov qword [rsp+8*294],r10
	mov qword [rsp+8*293],r11
	mov     rsi, [rsp+8*294]
	mov     rdi, [rsp+8*291]
	call    concat
	mov [rsp+8*295], rax
	mov r10, qword [rsp+8*296]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*296],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*296]
	call    address
	mov [rsp+8*297], rax
	mov r10, qword [rsp+8*298]
	mov r11, qword [rsp+8*297]
	mov r10, [r11]
	mov qword [rsp+8*298],r10
	mov qword [rsp+8*297],r11
	mov     rsi, [rsp+8*298]
	mov     rdi, [rsp+8*295]
	call    concat
	mov [rsp+8*299], rax
	mov r10, qword [rsp+8*300]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*300],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*300]
	call    address
	mov [rsp+8*301], rax
	mov r10, qword [rsp+8*302]
	mov r11, qword [rsp+8*301]
	mov r10, [r11]
	mov qword [rsp+8*302],r10
	mov qword [rsp+8*301],r11
	mov     rsi, [rsp+8*302]
	mov     rdi, [rsp+8*299]
	call    concat
	mov [rsp+8*303], rax
	mov r10, qword [rsp+8*304]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*304],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*304]
	call    address
	mov [rsp+8*305], rax
	mov r10, qword [rsp+8*306]
	mov r11, qword [rsp+8*305]
	mov r10, [r11]
	mov qword [rsp+8*306],r10
	mov qword [rsp+8*305],r11
	mov     rsi, [rsp+8*306]
	mov     rdi, [rsp+8*303]
	call    concat
	mov [rsp+8*307], rax
	mov r10, qword [rsp+8*308]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*308],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*308]
	call    address
	mov [rsp+8*309], rax
	mov r10, qword [rsp+8*310]
	mov r11, qword [rsp+8*309]
	mov r10, [r11]
	mov qword [rsp+8*310],r10
	mov qword [rsp+8*309],r11
	mov     rsi, [rsp+8*310]
	mov     rdi, [rsp+8*307]
	call    concat
	mov [rsp+8*311], rax
	mov r10, qword [rsp+8*312]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*312],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*312]
	call    address
	mov [rsp+8*313], rax
	mov r10, qword [rsp+8*314]
	mov r11, qword [rsp+8*313]
	mov r10, [r11]
	mov qword [rsp+8*314],r10
	mov qword [rsp+8*313],r11
	mov     rsi, [rsp+8*314]
	mov     rdi, [rsp+8*311]
	call    concat
	mov [rsp+8*315], rax
	mov r10, qword [rsp+8*316]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*316],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 86
	mov     rdi, [rsp+8*316]
	call    address
	mov [rsp+8*317], rax
	mov r10, qword [rsp+8*318]
	mov r11, qword [rsp+8*317]
	mov r10, [r11]
	mov qword [rsp+8*318],r10
	mov qword [rsp+8*317],r11
	mov     rsi, [rsp+8*318]
	mov     rdi, [rsp+8*315]
	call    concat
	mov [rsp+8*319], rax
	mov r10, qword [rsp+8*320]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*320],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*320]
	call    address
	mov [rsp+8*321], rax
	mov r10, qword [rsp+8*322]
	mov r11, qword [rsp+8*321]
	mov r10, [r11]
	mov qword [rsp+8*322],r10
	mov qword [rsp+8*321],r11
	mov     rsi, [rsp+8*322]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*323], rax
	mov r10, qword [rsp+8*324]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*324],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 89
	mov     rdi, [rsp+8*324]
	call    address
	mov [rsp+8*325], rax
	mov r10, qword [rsp+8*326]
	mov r11, qword [rsp+8*325]
	mov r10, [r11]
	mov qword [rsp+8*326],r10
	mov qword [rsp+8*325],r11
	mov     rsi, [rsp+8*326]
	mov     rdi, [rsp+8*323]
	call    concat
	mov [rsp+8*327], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*327]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*327],r11
	mov r10, qword [rsp+8*329]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*329],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*329] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*330]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*330],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*330]
	call    address
	mov [rsp+8*331], rax
	mov r10, qword [rsp+8*332]
	mov r11, qword [rsp+8*331]
	mov r10, [r11]
	mov qword [rsp+8*332],r10
	mov qword [rsp+8*331],r11
	mov r10, qword [rsp+8*333]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*333],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 68
	mov     rdi, [rsp+8*333]
	call    address
	mov [rsp+8*334], rax
	mov r10, qword [rsp+8*335]
	mov r11, qword [rsp+8*334]
	mov r10, [r11]
	mov qword [rsp+8*335],r10
	mov qword [rsp+8*334],r11
	mov     rsi, [rsp+8*335]
	mov     rdi, [rsp+8*332]
	call    concat
	mov [rsp+8*336], rax
	mov r10, qword [rsp+8*337]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*337],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*337]
	call    address
	mov [rsp+8*338], rax
	mov r10, qword [rsp+8*339]
	mov r11, qword [rsp+8*338]
	mov r10, [r11]
	mov qword [rsp+8*339],r10
	mov qword [rsp+8*338],r11
	mov     rsi, [rsp+8*339]
	mov     rdi, [rsp+8*336]
	call    concat
	mov [rsp+8*340], rax
	mov r10, qword [rsp+8*341]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*341],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 86
	mov     rdi, [rsp+8*341]
	call    address
	mov [rsp+8*342], rax
	mov r10, qword [rsp+8*343]
	mov r11, qword [rsp+8*342]
	mov r10, [r11]
	mov qword [rsp+8*343],r10
	mov qword [rsp+8*342],r11
	mov     rsi, [rsp+8*343]
	mov     rdi, [rsp+8*340]
	call    concat
	mov [rsp+8*344], rax
	mov r10, qword [rsp+8*345]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*345],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*345]
	call    address
	mov [rsp+8*346], rax
	mov r10, qword [rsp+8*347]
	mov r11, qword [rsp+8*346]
	mov r10, [r11]
	mov qword [rsp+8*347],r10
	mov qword [rsp+8*346],r11
	mov     rsi, [rsp+8*347]
	mov     rdi, [rsp+8*344]
	call    concat
	mov [rsp+8*348], rax
	mov r10, qword [rsp+8*349]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*349],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*349]
	call    address
	mov [rsp+8*350], rax
	mov r10, qword [rsp+8*351]
	mov r11, qword [rsp+8*350]
	mov r10, [r11]
	mov qword [rsp+8*351],r10
	mov qword [rsp+8*350],r11
	mov     rsi, [rsp+8*351]
	mov     rdi, [rsp+8*348]
	call    concat
	mov [rsp+8*352], rax
	mov r10, qword [rsp+8*353]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*353],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 15
	mov     rdi, [rsp+8*353]
	call    address
	mov [rsp+8*354], rax
	mov r10, qword [rsp+8*355]
	mov r11, qword [rsp+8*354]
	mov r10, [r11]
	mov qword [rsp+8*355],r10
	mov qword [rsp+8*354],r11
	mov     rsi, [rsp+8*355]
	mov     rdi, [rsp+8*352]
	call    concat
	mov [rsp+8*356], rax
	mov r10, qword [rsp+8*357]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*357],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*357]
	call    address
	mov [rsp+8*358], rax
	mov r10, qword [rsp+8*359]
	mov r11, qword [rsp+8*358]
	mov r10, [r11]
	mov qword [rsp+8*359],r10
	mov qword [rsp+8*358],r11
	mov     rsi, [rsp+8*359]
	mov     rdi, [rsp+8*356]
	call    concat
	mov [rsp+8*360], rax
	mov r10, qword [rsp+8*361]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*361],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*361]
	call    address
	mov [rsp+8*362], rax
	mov r10, qword [rsp+8*363]
	mov r11, qword [rsp+8*362]
	mov r10, [r11]
	mov qword [rsp+8*363],r10
	mov qword [rsp+8*362],r11
	mov     rsi, [rsp+8*363]
	mov     rdi, [rsp+8*360]
	call    concat
	mov [rsp+8*364], rax
	mov r10, qword [rsp+8*365]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*365],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*365]
	call    address
	mov [rsp+8*366], rax
	mov r10, qword [rsp+8*367]
	mov r11, qword [rsp+8*366]
	mov r10, [r11]
	mov qword [rsp+8*367],r10
	mov qword [rsp+8*366],r11
	mov     rsi, [rsp+8*367]
	mov     rdi, [rsp+8*364]
	call    concat
	mov [rsp+8*368], rax
	mov r10, qword [rsp+8*369]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*369],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*369]
	call    address
	mov [rsp+8*370], rax
	mov r10, qword [rsp+8*371]
	mov r11, qword [rsp+8*370]
	mov r10, [r11]
	mov qword [rsp+8*371],r10
	mov qword [rsp+8*370],r11
	mov     rsi, [rsp+8*371]
	mov     rdi, [rsp+8*368]
	call    concat
	mov [rsp+8*372], rax
	mov r10, qword [rsp+8*373]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*373],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 83
	mov     rdi, [rsp+8*373]
	call    address
	mov [rsp+8*374], rax
	mov r10, qword [rsp+8*375]
	mov r11, qword [rsp+8*374]
	mov r10, [r11]
	mov qword [rsp+8*375],r10
	mov qword [rsp+8*374],r11
	mov     rsi, [rsp+8*375]
	mov     rdi, [rsp+8*372]
	call    concat
	mov [rsp+8*376], rax
	mov r10, qword [rsp+8*377]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*377],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*377]
	call    address
	mov [rsp+8*378], rax
	mov r10, qword [rsp+8*379]
	mov r11, qword [rsp+8*378]
	mov r10, [r11]
	mov qword [rsp+8*379],r10
	mov qword [rsp+8*378],r11
	mov     rsi, [rsp+8*379]
	mov     rdi, [rsp+8*376]
	call    concat
	mov [rsp+8*380], rax
	mov r10, qword [rsp+8*381]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*381],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*381]
	call    address
	mov [rsp+8*382], rax
	mov r10, qword [rsp+8*383]
	mov r11, qword [rsp+8*382]
	mov r10, [r11]
	mov qword [rsp+8*383],r10
	mov qword [rsp+8*382],r11
	mov     rsi, [rsp+8*383]
	mov     rdi, [rsp+8*380]
	call    concat
	mov [rsp+8*384], rax
	mov r10, qword [rsp+8*385]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*385],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*385]
	call    address
	mov [rsp+8*386], rax
	mov r10, qword [rsp+8*387]
	mov r11, qword [rsp+8*386]
	mov r10, [r11]
	mov qword [rsp+8*387],r10
	mov qword [rsp+8*386],r11
	mov     rsi, [rsp+8*387]
	mov     rdi, [rsp+8*384]
	call    concat
	mov [rsp+8*388], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*388]
	call    concat
	mov [rsp+8*390], rax
	mov r10, qword [rsp+8*391]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*391],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 15
	mov     rdi, [rsp+8*391]
	call    address
	mov [rsp+8*392], rax
	mov r10, qword [rsp+8*393]
	mov r11, qword [rsp+8*392]
	mov r10, [r11]
	mov qword [rsp+8*393],r10
	mov qword [rsp+8*392],r11
	mov     rsi, [rsp+8*393]
	mov     rdi, [rsp+8*390]
	call    concat
	mov [rsp+8*394], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*394]
	call    concat
	mov [rsp+8*395], rax
	mov r10, qword [rsp+8*396]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*396],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*396]
	call    address
	mov [rsp+8*397], rax
	mov r10, qword [rsp+8*398]
	mov r11, qword [rsp+8*397]
	mov r10, [r11]
	mov qword [rsp+8*398],r10
	mov qword [rsp+8*397],r11
	mov     rsi, [rsp+8*398]
	mov     rdi, [rsp+8*395]
	call    concat
	mov [rsp+8*399], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*399]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*399],r11
	mov r10, qword [rsp+8*400]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*400],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*400] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*401]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*401],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*401]
	call    address
	mov [rsp+8*402], rax
	mov r10, qword [rsp+8*403]
	mov r11, qword [rsp+8*402]
	mov r10, [r11]
	mov qword [rsp+8*403],r10
	mov qword [rsp+8*402],r11
	mov r10, qword [rsp+8*404]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*404],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 68
	mov     rdi, [rsp+8*404]
	call    address
	mov [rsp+8*405], rax
	mov r10, qword [rsp+8*406]
	mov r11, qword [rsp+8*405]
	mov r10, [r11]
	mov qword [rsp+8*406],r10
	mov qword [rsp+8*405],r11
	mov     rsi, [rsp+8*406]
	mov     rdi, [rsp+8*403]
	call    concat
	mov [rsp+8*407], rax
	mov r10, qword [rsp+8*408]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*408],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*408]
	call    address
	mov [rsp+8*409], rax
	mov r10, qword [rsp+8*410]
	mov r11, qword [rsp+8*409]
	mov r10, [r11]
	mov qword [rsp+8*410],r10
	mov qword [rsp+8*409],r11
	mov     rsi, [rsp+8*410]
	mov     rdi, [rsp+8*407]
	call    concat
	mov [rsp+8*411], rax
	mov r10, qword [rsp+8*412]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*412],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 86
	mov     rdi, [rsp+8*412]
	call    address
	mov [rsp+8*413], rax
	mov r10, qword [rsp+8*414]
	mov r11, qword [rsp+8*413]
	mov r10, [r11]
	mov qword [rsp+8*414],r10
	mov qword [rsp+8*413],r11
	mov     rsi, [rsp+8*414]
	mov     rdi, [rsp+8*411]
	call    concat
	mov [rsp+8*415], rax
	mov r10, qword [rsp+8*416]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*416],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*416]
	call    address
	mov [rsp+8*417], rax
	mov r10, qword [rsp+8*418]
	mov r11, qword [rsp+8*417]
	mov r10, [r11]
	mov qword [rsp+8*418],r10
	mov qword [rsp+8*417],r11
	mov     rsi, [rsp+8*418]
	mov     rdi, [rsp+8*415]
	call    concat
	mov [rsp+8*419], rax
	mov r10, qword [rsp+8*420]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*420],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*420]
	call    address
	mov [rsp+8*421], rax
	mov r10, qword [rsp+8*422]
	mov r11, qword [rsp+8*421]
	mov r10, [r11]
	mov qword [rsp+8*422],r10
	mov qword [rsp+8*421],r11
	mov     rsi, [rsp+8*422]
	mov     rdi, [rsp+8*419]
	call    concat
	mov [rsp+8*423], rax
	mov r10, qword [rsp+8*424]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*424],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 16
	mov     rdi, [rsp+8*424]
	call    address
	mov [rsp+8*425], rax
	mov r10, qword [rsp+8*426]
	mov r11, qword [rsp+8*425]
	mov r10, [r11]
	mov qword [rsp+8*426],r10
	mov qword [rsp+8*425],r11
	mov     rsi, [rsp+8*426]
	mov     rdi, [rsp+8*423]
	call    concat
	mov [rsp+8*427], rax
	mov r10, qword [rsp+8*428]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*428],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*428]
	call    address
	mov [rsp+8*429], rax
	mov r10, qword [rsp+8*430]
	mov r11, qword [rsp+8*429]
	mov r10, [r11]
	mov qword [rsp+8*430],r10
	mov qword [rsp+8*429],r11
	mov     rsi, [rsp+8*430]
	mov     rdi, [rsp+8*427]
	call    concat
	mov [rsp+8*431], rax
	mov r10, qword [rsp+8*432]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*432],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*432]
	call    address
	mov [rsp+8*433], rax
	mov r10, qword [rsp+8*434]
	mov r11, qword [rsp+8*433]
	mov r10, [r11]
	mov qword [rsp+8*434],r10
	mov qword [rsp+8*433],r11
	mov     rsi, [rsp+8*434]
	mov     rdi, [rsp+8*431]
	call    concat
	mov [rsp+8*435], rax
	mov r10, qword [rsp+8*436]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*436],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*436]
	call    address
	mov [rsp+8*437], rax
	mov r10, qword [rsp+8*438]
	mov r11, qword [rsp+8*437]
	mov r10, [r11]
	mov qword [rsp+8*438],r10
	mov qword [rsp+8*437],r11
	mov     rsi, [rsp+8*438]
	mov     rdi, [rsp+8*435]
	call    concat
	mov [rsp+8*439], rax
	mov r10, qword [rsp+8*440]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*440],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*440]
	call    address
	mov [rsp+8*441], rax
	mov r10, qword [rsp+8*442]
	mov r11, qword [rsp+8*441]
	mov r10, [r11]
	mov qword [rsp+8*442],r10
	mov qword [rsp+8*441],r11
	mov     rsi, [rsp+8*442]
	mov     rdi, [rsp+8*439]
	call    concat
	mov [rsp+8*443], rax
	mov r10, qword [rsp+8*444]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*444],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 83
	mov     rdi, [rsp+8*444]
	call    address
	mov [rsp+8*445], rax
	mov r10, qword [rsp+8*446]
	mov r11, qword [rsp+8*445]
	mov r10, [r11]
	mov qword [rsp+8*446],r10
	mov qword [rsp+8*445],r11
	mov     rsi, [rsp+8*446]
	mov     rdi, [rsp+8*443]
	call    concat
	mov [rsp+8*447], rax
	mov r10, qword [rsp+8*448]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*448],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*448]
	call    address
	mov [rsp+8*449], rax
	mov r10, qword [rsp+8*450]
	mov r11, qword [rsp+8*449]
	mov r10, [r11]
	mov qword [rsp+8*450],r10
	mov qword [rsp+8*449],r11
	mov     rsi, [rsp+8*450]
	mov     rdi, [rsp+8*447]
	call    concat
	mov [rsp+8*451], rax
	mov r10, qword [rsp+8*452]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*452],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*452]
	call    address
	mov [rsp+8*453], rax
	mov r10, qword [rsp+8*454]
	mov r11, qword [rsp+8*453]
	mov r10, [r11]
	mov qword [rsp+8*454],r10
	mov qword [rsp+8*453],r11
	mov     rsi, [rsp+8*454]
	mov     rdi, [rsp+8*451]
	call    concat
	mov [rsp+8*455], rax
	mov r10, qword [rsp+8*456]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*456],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*456]
	call    address
	mov [rsp+8*457], rax
	mov r10, qword [rsp+8*458]
	mov r11, qword [rsp+8*457]
	mov r10, [r11]
	mov qword [rsp+8*458],r10
	mov qword [rsp+8*457],r11
	mov     rsi, [rsp+8*458]
	mov     rdi, [rsp+8*455]
	call    concat
	mov [rsp+8*459], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*459]
	call    concat
	mov [rsp+8*460], rax
	mov r10, qword [rsp+8*461]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*461],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 16
	mov     rdi, [rsp+8*461]
	call    address
	mov [rsp+8*462], rax
	mov r10, qword [rsp+8*463]
	mov r11, qword [rsp+8*462]
	mov r10, [r11]
	mov qword [rsp+8*463],r10
	mov qword [rsp+8*462],r11
	mov     rsi, [rsp+8*463]
	mov     rdi, [rsp+8*460]
	call    concat
	mov [rsp+8*464], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*464]
	call    concat
	mov [rsp+8*465], rax
	mov r10, qword [rsp+8*466]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*466],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*466]
	call    address
	mov [rsp+8*467], rax
	mov r10, qword [rsp+8*468]
	mov r11, qword [rsp+8*467]
	mov r10, [r11]
	mov qword [rsp+8*468],r10
	mov qword [rsp+8*467],r11
	mov     rsi, [rsp+8*468]
	mov     rdi, [rsp+8*465]
	call    concat
	mov [rsp+8*469], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*469]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*469],r11
	mov r10, qword [rsp+8*470]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*470],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*470] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*471]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*471],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*471]
	call    address
	mov [rsp+8*472], rax
	mov r10, qword [rsp+8*473]
	mov r11, qword [rsp+8*472]
	mov r10, [r11]
	mov qword [rsp+8*473],r10
	mov qword [rsp+8*472],r11
	mov r10, qword [rsp+8*474]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*474],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 68
	mov     rdi, [rsp+8*474]
	call    address
	mov [rsp+8*475], rax
	mov r10, qword [rsp+8*476]
	mov r11, qword [rsp+8*475]
	mov r10, [r11]
	mov qword [rsp+8*476],r10
	mov qword [rsp+8*475],r11
	mov     rsi, [rsp+8*476]
	mov     rdi, [rsp+8*473]
	call    concat
	mov [rsp+8*477], rax
	mov r10, qword [rsp+8*478]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*478],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*478]
	call    address
	mov [rsp+8*479], rax
	mov r10, qword [rsp+8*480]
	mov r11, qword [rsp+8*479]
	mov r10, [r11]
	mov qword [rsp+8*480],r10
	mov qword [rsp+8*479],r11
	mov     rsi, [rsp+8*480]
	mov     rdi, [rsp+8*477]
	call    concat
	mov [rsp+8*481], rax
	mov r10, qword [rsp+8*482]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*482],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 86
	mov     rdi, [rsp+8*482]
	call    address
	mov [rsp+8*483], rax
	mov r10, qword [rsp+8*484]
	mov r11, qword [rsp+8*483]
	mov r10, [r11]
	mov qword [rsp+8*484],r10
	mov qword [rsp+8*483],r11
	mov     rsi, [rsp+8*484]
	mov     rdi, [rsp+8*481]
	call    concat
	mov [rsp+8*485], rax
	mov r10, qword [rsp+8*486]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*486],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*486]
	call    address
	mov [rsp+8*487], rax
	mov r10, qword [rsp+8*488]
	mov r11, qword [rsp+8*487]
	mov r10, [r11]
	mov qword [rsp+8*488],r10
	mov qword [rsp+8*487],r11
	mov     rsi, [rsp+8*488]
	mov     rdi, [rsp+8*485]
	call    concat
	mov [rsp+8*489], rax
	mov r10, qword [rsp+8*490]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*490],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*490]
	call    address
	mov [rsp+8*491], rax
	mov r10, qword [rsp+8*492]
	mov r11, qword [rsp+8*491]
	mov r10, [r11]
	mov qword [rsp+8*492],r10
	mov qword [rsp+8*491],r11
	mov     rsi, [rsp+8*492]
	mov     rdi, [rsp+8*489]
	call    concat
	mov [rsp+8*493], rax
	mov r10, qword [rsp+8*494]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*494],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 17
	mov     rdi, [rsp+8*494]
	call    address
	mov [rsp+8*495], rax
	mov r10, qword [rsp+8*496]
	mov r11, qword [rsp+8*495]
	mov r10, [r11]
	mov qword [rsp+8*496],r10
	mov qword [rsp+8*495],r11
	mov     rsi, [rsp+8*496]
	mov     rdi, [rsp+8*493]
	call    concat
	mov [rsp+8*497], rax
	mov r10, qword [rsp+8*498]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*498],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*498]
	call    address
	mov [rsp+8*499], rax
	mov r10, qword [rsp+8*500]
	mov r11, qword [rsp+8*499]
	mov r10, [r11]
	mov qword [rsp+8*500],r10
	mov qword [rsp+8*499],r11
	mov     rsi, [rsp+8*500]
	mov     rdi, [rsp+8*497]
	call    concat
	mov [rsp+8*501], rax
	mov r10, qword [rsp+8*502]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*502],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*502]
	call    address
	mov [rsp+8*503], rax
	mov r10, qword [rsp+8*504]
	mov r11, qword [rsp+8*503]
	mov r10, [r11]
	mov qword [rsp+8*504],r10
	mov qword [rsp+8*503],r11
	mov     rsi, [rsp+8*504]
	mov     rdi, [rsp+8*501]
	call    concat
	mov [rsp+8*505], rax
	mov r10, qword [rsp+8*506]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*506],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*506]
	call    address
	mov [rsp+8*507], rax
	mov r10, qword [rsp+8*508]
	mov r11, qword [rsp+8*507]
	mov r10, [r11]
	mov qword [rsp+8*508],r10
	mov qword [rsp+8*507],r11
	mov     rsi, [rsp+8*508]
	mov     rdi, [rsp+8*505]
	call    concat
	mov [rsp+8*509], rax
	mov r10, qword [rsp+8*510]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*510],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*510]
	call    address
	mov [rsp+8*511], rax
	mov r10, qword [rsp+8*512]
	mov r11, qword [rsp+8*511]
	mov r10, [r11]
	mov qword [rsp+8*512],r10
	mov qword [rsp+8*511],r11
	mov     rsi, [rsp+8*512]
	mov     rdi, [rsp+8*509]
	call    concat
	mov [rsp+8*513], rax
	mov r10, qword [rsp+8*514]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*514],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 83
	mov     rdi, [rsp+8*514]
	call    address
	mov [rsp+8*515], rax
	mov r10, qword [rsp+8*516]
	mov r11, qword [rsp+8*515]
	mov r10, [r11]
	mov qword [rsp+8*516],r10
	mov qword [rsp+8*515],r11
	mov     rsi, [rsp+8*516]
	mov     rdi, [rsp+8*513]
	call    concat
	mov [rsp+8*517], rax
	mov r10, qword [rsp+8*518]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*518],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*518]
	call    address
	mov [rsp+8*519], rax
	mov r10, qword [rsp+8*520]
	mov r11, qword [rsp+8*519]
	mov r10, [r11]
	mov qword [rsp+8*520],r10
	mov qword [rsp+8*519],r11
	mov     rsi, [rsp+8*520]
	mov     rdi, [rsp+8*517]
	call    concat
	mov [rsp+8*521], rax
	mov r10, qword [rsp+8*522]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*522],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*522]
	call    address
	mov [rsp+8*523], rax
	mov r10, qword [rsp+8*524]
	mov r11, qword [rsp+8*523]
	mov r10, [r11]
	mov qword [rsp+8*524],r10
	mov qword [rsp+8*523],r11
	mov     rsi, [rsp+8*524]
	mov     rdi, [rsp+8*521]
	call    concat
	mov [rsp+8*525], rax
	mov r10, qword [rsp+8*526]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*526],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*526]
	call    address
	mov [rsp+8*527], rax
	mov r10, qword [rsp+8*528]
	mov r11, qword [rsp+8*527]
	mov r10, [r11]
	mov qword [rsp+8*528],r10
	mov qword [rsp+8*527],r11
	mov     rsi, [rsp+8*528]
	mov     rdi, [rsp+8*525]
	call    concat
	mov [rsp+8*529], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*529]
	call    concat
	mov [rsp+8*530], rax
	mov r10, qword [rsp+8*531]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*531],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 17
	mov     rdi, [rsp+8*531]
	call    address
	mov [rsp+8*532], rax
	mov r10, qword [rsp+8*533]
	mov r11, qword [rsp+8*532]
	mov r10, [r11]
	mov qword [rsp+8*533],r10
	mov qword [rsp+8*532],r11
	mov     rsi, [rsp+8*533]
	mov     rdi, [rsp+8*530]
	call    concat
	mov [rsp+8*534], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*534]
	call    concat
	mov [rsp+8*535], rax
	mov r10, qword [rsp+8*536]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*536],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*536]
	call    address
	mov [rsp+8*537], rax
	mov r10, qword [rsp+8*538]
	mov r11, qword [rsp+8*537]
	mov r10, [r11]
	mov qword [rsp+8*538],r10
	mov qword [rsp+8*537],r11
	mov     rsi, [rsp+8*538]
	mov     rdi, [rsp+8*535]
	call    concat
	mov [rsp+8*539], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*539]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*539],r11
	mov r10, qword [rsp+8*540]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*540],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*540] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*541]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*541],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*541]
	call    address
	mov [rsp+8*542], rax
	mov r10, qword [rsp+8*543]
	mov r11, qword [rsp+8*542]
	mov r10, [r11]
	mov qword [rsp+8*543],r10
	mov qword [rsp+8*542],r11
	mov r10, qword [rsp+8*544]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*544],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 68
	mov     rdi, [rsp+8*544]
	call    address
	mov [rsp+8*545], rax
	mov r10, qword [rsp+8*546]
	mov r11, qword [rsp+8*545]
	mov r10, [r11]
	mov qword [rsp+8*546],r10
	mov qword [rsp+8*545],r11
	mov     rsi, [rsp+8*546]
	mov     rdi, [rsp+8*543]
	call    concat
	mov [rsp+8*547], rax
	mov r10, qword [rsp+8*548]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*548],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*548]
	call    address
	mov [rsp+8*549], rax
	mov r10, qword [rsp+8*550]
	mov r11, qword [rsp+8*549]
	mov r10, [r11]
	mov qword [rsp+8*550],r10
	mov qword [rsp+8*549],r11
	mov     rsi, [rsp+8*550]
	mov     rdi, [rsp+8*547]
	call    concat
	mov [rsp+8*551], rax
	mov r10, qword [rsp+8*552]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*552],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 86
	mov     rdi, [rsp+8*552]
	call    address
	mov [rsp+8*553], rax
	mov r10, qword [rsp+8*554]
	mov r11, qword [rsp+8*553]
	mov r10, [r11]
	mov qword [rsp+8*554],r10
	mov qword [rsp+8*553],r11
	mov     rsi, [rsp+8*554]
	mov     rdi, [rsp+8*551]
	call    concat
	mov [rsp+8*555], rax
	mov r10, qword [rsp+8*556]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*556],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*556]
	call    address
	mov [rsp+8*557], rax
	mov r10, qword [rsp+8*558]
	mov r11, qword [rsp+8*557]
	mov r10, [r11]
	mov qword [rsp+8*558],r10
	mov qword [rsp+8*557],r11
	mov     rsi, [rsp+8*558]
	mov     rdi, [rsp+8*555]
	call    concat
	mov [rsp+8*559], rax
	mov r10, qword [rsp+8*560]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*560],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*560]
	call    address
	mov [rsp+8*561], rax
	mov r10, qword [rsp+8*562]
	mov r11, qword [rsp+8*561]
	mov r10, [r11]
	mov qword [rsp+8*562],r10
	mov qword [rsp+8*561],r11
	mov     rsi, [rsp+8*562]
	mov     rdi, [rsp+8*559]
	call    concat
	mov [rsp+8*563], rax
	mov r10, qword [rsp+8*564]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*564],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 18
	mov     rdi, [rsp+8*564]
	call    address
	mov [rsp+8*565], rax
	mov r10, qword [rsp+8*566]
	mov r11, qword [rsp+8*565]
	mov r10, [r11]
	mov qword [rsp+8*566],r10
	mov qword [rsp+8*565],r11
	mov     rsi, [rsp+8*566]
	mov     rdi, [rsp+8*563]
	call    concat
	mov [rsp+8*567], rax
	mov r10, qword [rsp+8*568]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*568],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*568]
	call    address
	mov [rsp+8*569], rax
	mov r10, qword [rsp+8*570]
	mov r11, qword [rsp+8*569]
	mov r10, [r11]
	mov qword [rsp+8*570],r10
	mov qword [rsp+8*569],r11
	mov     rsi, [rsp+8*570]
	mov     rdi, [rsp+8*567]
	call    concat
	mov [rsp+8*571], rax
	mov r10, qword [rsp+8*572]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*572],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*572]
	call    address
	mov [rsp+8*573], rax
	mov r10, qword [rsp+8*574]
	mov r11, qword [rsp+8*573]
	mov r10, [r11]
	mov qword [rsp+8*574],r10
	mov qword [rsp+8*573],r11
	mov     rsi, [rsp+8*574]
	mov     rdi, [rsp+8*571]
	call    concat
	mov [rsp+8*575], rax
	mov r10, qword [rsp+8*576]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*576],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*576]
	call    address
	mov [rsp+8*577], rax
	mov r10, qword [rsp+8*578]
	mov r11, qword [rsp+8*577]
	mov r10, [r11]
	mov qword [rsp+8*578],r10
	mov qword [rsp+8*577],r11
	mov     rsi, [rsp+8*578]
	mov     rdi, [rsp+8*575]
	call    concat
	mov [rsp+8*579], rax
	mov r10, qword [rsp+8*580]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*580],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*580]
	call    address
	mov [rsp+8*581], rax
	mov r10, qword [rsp+8*582]
	mov r11, qword [rsp+8*581]
	mov r10, [r11]
	mov qword [rsp+8*582],r10
	mov qword [rsp+8*581],r11
	mov     rsi, [rsp+8*582]
	mov     rdi, [rsp+8*579]
	call    concat
	mov [rsp+8*583], rax
	mov r10, qword [rsp+8*584]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*584],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 83
	mov     rdi, [rsp+8*584]
	call    address
	mov [rsp+8*585], rax
	mov r10, qword [rsp+8*586]
	mov r11, qword [rsp+8*585]
	mov r10, [r11]
	mov qword [rsp+8*586],r10
	mov qword [rsp+8*585],r11
	mov     rsi, [rsp+8*586]
	mov     rdi, [rsp+8*583]
	call    concat
	mov [rsp+8*587], rax
	mov r10, qword [rsp+8*588]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*588],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*588]
	call    address
	mov [rsp+8*589], rax
	mov r10, qword [rsp+8*590]
	mov r11, qword [rsp+8*589]
	mov r10, [r11]
	mov qword [rsp+8*590],r10
	mov qword [rsp+8*589],r11
	mov     rsi, [rsp+8*590]
	mov     rdi, [rsp+8*587]
	call    concat
	mov [rsp+8*591], rax
	mov r10, qword [rsp+8*592]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*592],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*592]
	call    address
	mov [rsp+8*593], rax
	mov r10, qword [rsp+8*594]
	mov r11, qword [rsp+8*593]
	mov r10, [r11]
	mov qword [rsp+8*594],r10
	mov qword [rsp+8*593],r11
	mov     rsi, [rsp+8*594]
	mov     rdi, [rsp+8*591]
	call    concat
	mov [rsp+8*595], rax
	mov r10, qword [rsp+8*596]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*596],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*596]
	call    address
	mov [rsp+8*597], rax
	mov r10, qword [rsp+8*598]
	mov r11, qword [rsp+8*597]
	mov r10, [r11]
	mov qword [rsp+8*598],r10
	mov qword [rsp+8*597],r11
	mov     rsi, [rsp+8*598]
	mov     rdi, [rsp+8*595]
	call    concat
	mov [rsp+8*599], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*599]
	call    concat
	mov [rsp+8*600], rax
	mov r10, qword [rsp+8*601]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*601],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 18
	mov     rdi, [rsp+8*601]
	call    address
	mov [rsp+8*602], rax
	mov r10, qword [rsp+8*603]
	mov r11, qword [rsp+8*602]
	mov r10, [r11]
	mov qword [rsp+8*603],r10
	mov qword [rsp+8*602],r11
	mov     rsi, [rsp+8*603]
	mov     rdi, [rsp+8*600]
	call    concat
	mov [rsp+8*604], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*604]
	call    concat
	mov [rsp+8*605], rax
	mov r10, qword [rsp+8*606]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*606],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*606]
	call    address
	mov [rsp+8*607], rax
	mov r10, qword [rsp+8*608]
	mov r11, qword [rsp+8*607]
	mov r10, [r11]
	mov qword [rsp+8*608],r10
	mov qword [rsp+8*607],r11
	mov     rsi, [rsp+8*608]
	mov     rdi, [rsp+8*605]
	call    concat
	mov [rsp+8*609], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*609]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*609],r11
	mov r10, qword [rsp+8*610]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*610],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*610] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*611]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*611],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*611]
	call    address
	mov [rsp+8*612], rax
	mov r10, qword [rsp+8*613]
	mov r11, qword [rsp+8*612]
	mov r10, [r11]
	mov qword [rsp+8*613],r10
	mov qword [rsp+8*612],r11
	mov r10, qword [rsp+8*614]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*614],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 68
	mov     rdi, [rsp+8*614]
	call    address
	mov [rsp+8*615], rax
	mov r10, qword [rsp+8*616]
	mov r11, qword [rsp+8*615]
	mov r10, [r11]
	mov qword [rsp+8*616],r10
	mov qword [rsp+8*615],r11
	mov     rsi, [rsp+8*616]
	mov     rdi, [rsp+8*613]
	call    concat
	mov [rsp+8*617], rax
	mov r10, qword [rsp+8*618]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*618],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*618]
	call    address
	mov [rsp+8*619], rax
	mov r10, qword [rsp+8*620]
	mov r11, qword [rsp+8*619]
	mov r10, [r11]
	mov qword [rsp+8*620],r10
	mov qword [rsp+8*619],r11
	mov     rsi, [rsp+8*620]
	mov     rdi, [rsp+8*617]
	call    concat
	mov [rsp+8*621], rax
	mov r10, qword [rsp+8*622]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*622],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 86
	mov     rdi, [rsp+8*622]
	call    address
	mov [rsp+8*623], rax
	mov r10, qword [rsp+8*624]
	mov r11, qword [rsp+8*623]
	mov r10, [r11]
	mov qword [rsp+8*624],r10
	mov qword [rsp+8*623],r11
	mov     rsi, [rsp+8*624]
	mov     rdi, [rsp+8*621]
	call    concat
	mov [rsp+8*625], rax
	mov r10, qword [rsp+8*626]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*626],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*626]
	call    address
	mov [rsp+8*627], rax
	mov r10, qword [rsp+8*628]
	mov r11, qword [rsp+8*627]
	mov r10, [r11]
	mov qword [rsp+8*628],r10
	mov qword [rsp+8*627],r11
	mov     rsi, [rsp+8*628]
	mov     rdi, [rsp+8*625]
	call    concat
	mov [rsp+8*629], rax
	mov r10, qword [rsp+8*630]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*630],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*630]
	call    address
	mov [rsp+8*631], rax
	mov r10, qword [rsp+8*632]
	mov r11, qword [rsp+8*631]
	mov r10, [r11]
	mov qword [rsp+8*632],r10
	mov qword [rsp+8*631],r11
	mov     rsi, [rsp+8*632]
	mov     rdi, [rsp+8*629]
	call    concat
	mov [rsp+8*633], rax
	mov r10, qword [rsp+8*634]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*634],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 19
	mov     rdi, [rsp+8*634]
	call    address
	mov [rsp+8*635], rax
	mov r10, qword [rsp+8*636]
	mov r11, qword [rsp+8*635]
	mov r10, [r11]
	mov qword [rsp+8*636],r10
	mov qword [rsp+8*635],r11
	mov     rsi, [rsp+8*636]
	mov     rdi, [rsp+8*633]
	call    concat
	mov [rsp+8*637], rax
	mov r10, qword [rsp+8*638]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*638],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*638]
	call    address
	mov [rsp+8*639], rax
	mov r10, qword [rsp+8*640]
	mov r11, qword [rsp+8*639]
	mov r10, [r11]
	mov qword [rsp+8*640],r10
	mov qword [rsp+8*639],r11
	mov     rsi, [rsp+8*640]
	mov     rdi, [rsp+8*637]
	call    concat
	mov [rsp+8*641], rax
	mov r10, qword [rsp+8*642]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*642],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*642]
	call    address
	mov [rsp+8*643], rax
	mov r10, qword [rsp+8*644]
	mov r11, qword [rsp+8*643]
	mov r10, [r11]
	mov qword [rsp+8*644],r10
	mov qword [rsp+8*643],r11
	mov     rsi, [rsp+8*644]
	mov     rdi, [rsp+8*641]
	call    concat
	mov [rsp+8*645], rax
	mov r10, qword [rsp+8*646]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*646],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*646]
	call    address
	mov [rsp+8*647], rax
	mov r10, qword [rsp+8*648]
	mov r11, qword [rsp+8*647]
	mov r10, [r11]
	mov qword [rsp+8*648],r10
	mov qword [rsp+8*647],r11
	mov     rsi, [rsp+8*648]
	mov     rdi, [rsp+8*645]
	call    concat
	mov [rsp+8*649], rax
	mov r10, qword [rsp+8*650]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*650],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*650]
	call    address
	mov [rsp+8*651], rax
	mov r10, qword [rsp+8*652]
	mov r11, qword [rsp+8*651]
	mov r10, [r11]
	mov qword [rsp+8*652],r10
	mov qword [rsp+8*651],r11
	mov     rsi, [rsp+8*652]
	mov     rdi, [rsp+8*649]
	call    concat
	mov [rsp+8*653], rax
	mov r10, qword [rsp+8*654]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*654],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 83
	mov     rdi, [rsp+8*654]
	call    address
	mov [rsp+8*655], rax
	mov r10, qword [rsp+8*656]
	mov r11, qword [rsp+8*655]
	mov r10, [r11]
	mov qword [rsp+8*656],r10
	mov qword [rsp+8*655],r11
	mov     rsi, [rsp+8*656]
	mov     rdi, [rsp+8*653]
	call    concat
	mov [rsp+8*657], rax
	mov r10, qword [rsp+8*658]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*658],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*658]
	call    address
	mov [rsp+8*659], rax
	mov r10, qword [rsp+8*660]
	mov r11, qword [rsp+8*659]
	mov r10, [r11]
	mov qword [rsp+8*660],r10
	mov qword [rsp+8*659],r11
	mov     rsi, [rsp+8*660]
	mov     rdi, [rsp+8*657]
	call    concat
	mov [rsp+8*661], rax
	mov r10, qword [rsp+8*662]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*662],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*662]
	call    address
	mov [rsp+8*663], rax
	mov r10, qword [rsp+8*664]
	mov r11, qword [rsp+8*663]
	mov r10, [r11]
	mov qword [rsp+8*664],r10
	mov qword [rsp+8*663],r11
	mov     rsi, [rsp+8*664]
	mov     rdi, [rsp+8*661]
	call    concat
	mov [rsp+8*665], rax
	mov r10, qword [rsp+8*666]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*666],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*666]
	call    address
	mov [rsp+8*667], rax
	mov r10, qword [rsp+8*668]
	mov r11, qword [rsp+8*667]
	mov r10, [r11]
	mov qword [rsp+8*668],r10
	mov qword [rsp+8*667],r11
	mov     rsi, [rsp+8*668]
	mov     rdi, [rsp+8*665]
	call    concat
	mov [rsp+8*669], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*669]
	call    concat
	mov [rsp+8*670], rax
	mov r10, qword [rsp+8*671]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*671],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 19
	mov     rdi, [rsp+8*671]
	call    address
	mov [rsp+8*672], rax
	mov r10, qword [rsp+8*673]
	mov r11, qword [rsp+8*672]
	mov r10, [r11]
	mov qword [rsp+8*673],r10
	mov qword [rsp+8*672],r11
	mov     rsi, [rsp+8*673]
	mov     rdi, [rsp+8*670]
	call    concat
	mov [rsp+8*674], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*674]
	call    concat
	mov [rsp+8*675], rax
	mov r10, qword [rsp+8*676]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*676],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*676]
	call    address
	mov [rsp+8*677], rax
	mov r10, qword [rsp+8*678]
	mov r11, qword [rsp+8*677]
	mov r10, [r11]
	mov qword [rsp+8*678],r10
	mov qword [rsp+8*677],r11
	mov     rsi, [rsp+8*678]
	mov     rdi, [rsp+8*675]
	call    concat
	mov [rsp+8*679], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*679]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*679],r11
	mov r10, qword [rsp+8*680]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*680],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*680] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*681]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*681],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*681]
	call    address
	mov [rsp+8*682], rax
	mov r10, qword [rsp+8*683]
	mov r11, qword [rsp+8*682]
	mov r10, [r11]
	mov qword [rsp+8*683],r10
	mov qword [rsp+8*682],r11
	mov r10, qword [rsp+8*684]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*684],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 68
	mov     rdi, [rsp+8*684]
	call    address
	mov [rsp+8*685], rax
	mov r10, qword [rsp+8*686]
	mov r11, qword [rsp+8*685]
	mov r10, [r11]
	mov qword [rsp+8*686],r10
	mov qword [rsp+8*685],r11
	mov     rsi, [rsp+8*686]
	mov     rdi, [rsp+8*683]
	call    concat
	mov [rsp+8*687], rax
	mov r10, qword [rsp+8*688]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*688],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*688]
	call    address
	mov [rsp+8*689], rax
	mov r10, qword [rsp+8*690]
	mov r11, qword [rsp+8*689]
	mov r10, [r11]
	mov qword [rsp+8*690],r10
	mov qword [rsp+8*689],r11
	mov     rsi, [rsp+8*690]
	mov     rdi, [rsp+8*687]
	call    concat
	mov [rsp+8*691], rax
	mov r10, qword [rsp+8*692]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*692],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 86
	mov     rdi, [rsp+8*692]
	call    address
	mov [rsp+8*693], rax
	mov r10, qword [rsp+8*694]
	mov r11, qword [rsp+8*693]
	mov r10, [r11]
	mov qword [rsp+8*694],r10
	mov qword [rsp+8*693],r11
	mov     rsi, [rsp+8*694]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*695], rax
	mov r10, qword [rsp+8*696]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*696],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*696]
	call    address
	mov [rsp+8*697], rax
	mov r10, qword [rsp+8*698]
	mov r11, qword [rsp+8*697]
	mov r10, [r11]
	mov qword [rsp+8*698],r10
	mov qword [rsp+8*697],r11
	mov     rsi, [rsp+8*698]
	mov     rdi, [rsp+8*695]
	call    concat
	mov [rsp+8*699], rax
	mov r10, qword [rsp+8*700]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*700],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*700]
	call    address
	mov [rsp+8*701], rax
	mov r10, qword [rsp+8*702]
	mov r11, qword [rsp+8*701]
	mov r10, [r11]
	mov qword [rsp+8*702],r10
	mov qword [rsp+8*701],r11
	mov     rsi, [rsp+8*702]
	mov     rdi, [rsp+8*699]
	call    concat
	mov [rsp+8*703], rax
	mov r10, qword [rsp+8*704]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*704],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 20
	mov     rdi, [rsp+8*704]
	call    address
	mov [rsp+8*705], rax
	mov r10, qword [rsp+8*706]
	mov r11, qword [rsp+8*705]
	mov r10, [r11]
	mov qword [rsp+8*706],r10
	mov qword [rsp+8*705],r11
	mov     rsi, [rsp+8*706]
	mov     rdi, [rsp+8*703]
	call    concat
	mov [rsp+8*707], rax
	mov r10, qword [rsp+8*708]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*708],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*708]
	call    address
	mov [rsp+8*709], rax
	mov r10, qword [rsp+8*710]
	mov r11, qword [rsp+8*709]
	mov r10, [r11]
	mov qword [rsp+8*710],r10
	mov qword [rsp+8*709],r11
	mov     rsi, [rsp+8*710]
	mov     rdi, [rsp+8*707]
	call    concat
	mov [rsp+8*711], rax
	mov r10, qword [rsp+8*712]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*712],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*712]
	call    address
	mov [rsp+8*713], rax
	mov r10, qword [rsp+8*714]
	mov r11, qword [rsp+8*713]
	mov r10, [r11]
	mov qword [rsp+8*714],r10
	mov qword [rsp+8*713],r11
	mov     rsi, [rsp+8*714]
	mov     rdi, [rsp+8*711]
	call    concat
	mov [rsp+8*715], rax
	mov r10, qword [rsp+8*716]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*716],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*716]
	call    address
	mov [rsp+8*717], rax
	mov r10, qword [rsp+8*718]
	mov r11, qword [rsp+8*717]
	mov r10, [r11]
	mov qword [rsp+8*718],r10
	mov qword [rsp+8*717],r11
	mov     rsi, [rsp+8*718]
	mov     rdi, [rsp+8*715]
	call    concat
	mov [rsp+8*719], rax
	mov r10, qword [rsp+8*720]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*720],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*720]
	call    address
	mov [rsp+8*721], rax
	mov r10, qword [rsp+8*722]
	mov r11, qword [rsp+8*721]
	mov r10, [r11]
	mov qword [rsp+8*722],r10
	mov qword [rsp+8*721],r11
	mov     rsi, [rsp+8*722]
	mov     rdi, [rsp+8*719]
	call    concat
	mov [rsp+8*723], rax
	mov r10, qword [rsp+8*724]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*724],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 83
	mov     rdi, [rsp+8*724]
	call    address
	mov [rsp+8*725], rax
	mov r10, qword [rsp+8*726]
	mov r11, qword [rsp+8*725]
	mov r10, [r11]
	mov qword [rsp+8*726],r10
	mov qword [rsp+8*725],r11
	mov     rsi, [rsp+8*726]
	mov     rdi, [rsp+8*723]
	call    concat
	mov [rsp+8*727], rax
	mov r10, qword [rsp+8*728]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*728],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*728]
	call    address
	mov [rsp+8*729], rax
	mov r10, qword [rsp+8*730]
	mov r11, qword [rsp+8*729]
	mov r10, [r11]
	mov qword [rsp+8*730],r10
	mov qword [rsp+8*729],r11
	mov     rsi, [rsp+8*730]
	mov     rdi, [rsp+8*727]
	call    concat
	mov [rsp+8*731], rax
	mov r10, qword [rsp+8*732]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*732],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*732]
	call    address
	mov [rsp+8*733], rax
	mov r10, qword [rsp+8*734]
	mov r11, qword [rsp+8*733]
	mov r10, [r11]
	mov qword [rsp+8*734],r10
	mov qword [rsp+8*733],r11
	mov     rsi, [rsp+8*734]
	mov     rdi, [rsp+8*731]
	call    concat
	mov [rsp+8*735], rax
	mov r10, qword [rsp+8*736]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*736],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*736]
	call    address
	mov [rsp+8*737], rax
	mov r10, qword [rsp+8*738]
	mov r11, qword [rsp+8*737]
	mov r10, [r11]
	mov qword [rsp+8*738],r10
	mov qword [rsp+8*737],r11
	mov     rsi, [rsp+8*738]
	mov     rdi, [rsp+8*735]
	call    concat
	mov [rsp+8*739], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*739]
	call    concat
	mov [rsp+8*740], rax
	mov r10, qword [rsp+8*741]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*741],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 20
	mov     rdi, [rsp+8*741]
	call    address
	mov [rsp+8*742], rax
	mov r10, qword [rsp+8*743]
	mov r11, qword [rsp+8*742]
	mov r10, [r11]
	mov qword [rsp+8*743],r10
	mov qword [rsp+8*742],r11
	mov     rsi, [rsp+8*743]
	mov     rdi, [rsp+8*740]
	call    concat
	mov [rsp+8*744], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*745], rax
	mov r10, qword [rsp+8*746]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*746],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*746]
	call    address
	mov [rsp+8*747], rax
	mov r10, qword [rsp+8*748]
	mov r11, qword [rsp+8*747]
	mov r10, [r11]
	mov qword [rsp+8*748],r10
	mov qword [rsp+8*747],r11
	mov     rsi, [rsp+8*748]
	mov     rdi, [rsp+8*745]
	call    concat
	mov [rsp+8*749], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*749]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*749],r11
	mov r10, qword [rsp+8*750]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*750],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*750] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*751]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*751],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*751]
	call    address
	mov [rsp+8*752], rax
	mov r10, qword [rsp+8*753]
	mov r11, qword [rsp+8*752]
	mov r10, [r11]
	mov qword [rsp+8*753],r10
	mov qword [rsp+8*752],r11
	mov r10, qword [rsp+8*754]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*754],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 68
	mov     rdi, [rsp+8*754]
	call    address
	mov [rsp+8*755], rax
	mov r10, qword [rsp+8*756]
	mov r11, qword [rsp+8*755]
	mov r10, [r11]
	mov qword [rsp+8*756],r10
	mov qword [rsp+8*755],r11
	mov     rsi, [rsp+8*756]
	mov     rdi, [rsp+8*753]
	call    concat
	mov [rsp+8*757], rax
	mov r10, qword [rsp+8*758]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*758],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*758]
	call    address
	mov [rsp+8*759], rax
	mov r10, qword [rsp+8*760]
	mov r11, qword [rsp+8*759]
	mov r10, [r11]
	mov qword [rsp+8*760],r10
	mov qword [rsp+8*759],r11
	mov     rsi, [rsp+8*760]
	mov     rdi, [rsp+8*757]
	call    concat
	mov [rsp+8*761], rax
	mov r10, qword [rsp+8*762]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*762],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 86
	mov     rdi, [rsp+8*762]
	call    address
	mov [rsp+8*763], rax
	mov r10, qword [rsp+8*764]
	mov r11, qword [rsp+8*763]
	mov r10, [r11]
	mov qword [rsp+8*764],r10
	mov qword [rsp+8*763],r11
	mov     rsi, [rsp+8*764]
	mov     rdi, [rsp+8*761]
	call    concat
	mov [rsp+8*765], rax
	mov r10, qword [rsp+8*766]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*766],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*766]
	call    address
	mov [rsp+8*767], rax
	mov r10, qword [rsp+8*768]
	mov r11, qword [rsp+8*767]
	mov r10, [r11]
	mov qword [rsp+8*768],r10
	mov qword [rsp+8*767],r11
	mov     rsi, [rsp+8*768]
	mov     rdi, [rsp+8*765]
	call    concat
	mov [rsp+8*769], rax
	mov r10, qword [rsp+8*770]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*770],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*770]
	call    address
	mov [rsp+8*771], rax
	mov r10, qword [rsp+8*772]
	mov r11, qword [rsp+8*771]
	mov r10, [r11]
	mov qword [rsp+8*772],r10
	mov qword [rsp+8*771],r11
	mov     rsi, [rsp+8*772]
	mov     rdi, [rsp+8*769]
	call    concat
	mov [rsp+8*773], rax
	mov r10, qword [rsp+8*774]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*774],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 21
	mov     rdi, [rsp+8*774]
	call    address
	mov [rsp+8*775], rax
	mov r10, qword [rsp+8*776]
	mov r11, qword [rsp+8*775]
	mov r10, [r11]
	mov qword [rsp+8*776],r10
	mov qword [rsp+8*775],r11
	mov     rsi, [rsp+8*776]
	mov     rdi, [rsp+8*773]
	call    concat
	mov [rsp+8*777], rax
	mov r10, qword [rsp+8*778]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*778],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*778]
	call    address
	mov [rsp+8*779], rax
	mov r10, qword [rsp+8*780]
	mov r11, qword [rsp+8*779]
	mov r10, [r11]
	mov qword [rsp+8*780],r10
	mov qword [rsp+8*779],r11
	mov     rsi, [rsp+8*780]
	mov     rdi, [rsp+8*777]
	call    concat
	mov [rsp+8*781], rax
	mov r10, qword [rsp+8*782]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*782],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*782]
	call    address
	mov [rsp+8*783], rax
	mov r10, qword [rsp+8*784]
	mov r11, qword [rsp+8*783]
	mov r10, [r11]
	mov qword [rsp+8*784],r10
	mov qword [rsp+8*783],r11
	mov     rsi, [rsp+8*784]
	mov     rdi, [rsp+8*781]
	call    concat
	mov [rsp+8*785], rax
	mov r10, qword [rsp+8*786]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*786],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*786]
	call    address
	mov [rsp+8*787], rax
	mov r10, qword [rsp+8*788]
	mov r11, qword [rsp+8*787]
	mov r10, [r11]
	mov qword [rsp+8*788],r10
	mov qword [rsp+8*787],r11
	mov     rsi, [rsp+8*788]
	mov     rdi, [rsp+8*785]
	call    concat
	mov [rsp+8*789], rax
	mov r10, qword [rsp+8*790]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*790],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*790]
	call    address
	mov [rsp+8*791], rax
	mov r10, qword [rsp+8*792]
	mov r11, qword [rsp+8*791]
	mov r10, [r11]
	mov qword [rsp+8*792],r10
	mov qword [rsp+8*791],r11
	mov     rsi, [rsp+8*792]
	mov     rdi, [rsp+8*789]
	call    concat
	mov [rsp+8*793], rax
	mov r10, qword [rsp+8*794]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*794],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 83
	mov     rdi, [rsp+8*794]
	call    address
	mov [rsp+8*795], rax
	mov r10, qword [rsp+8*796]
	mov r11, qword [rsp+8*795]
	mov r10, [r11]
	mov qword [rsp+8*796],r10
	mov qword [rsp+8*795],r11
	mov     rsi, [rsp+8*796]
	mov     rdi, [rsp+8*793]
	call    concat
	mov [rsp+8*797], rax
	mov r10, qword [rsp+8*798]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*798],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*798]
	call    address
	mov [rsp+8*799], rax
	mov r10, qword [rsp+8*800]
	mov r11, qword [rsp+8*799]
	mov r10, [r11]
	mov qword [rsp+8*800],r10
	mov qword [rsp+8*799],r11
	mov     rsi, [rsp+8*800]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*801], rax
	mov r10, qword [rsp+8*802]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*802],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*802]
	call    address
	mov [rsp+8*803], rax
	mov r10, qword [rsp+8*804]
	mov r11, qword [rsp+8*803]
	mov r10, [r11]
	mov qword [rsp+8*804],r10
	mov qword [rsp+8*803],r11
	mov     rsi, [rsp+8*804]
	mov     rdi, [rsp+8*801]
	call    concat
	mov [rsp+8*805], rax
	mov r10, qword [rsp+8*806]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*806],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*806]
	call    address
	mov [rsp+8*807], rax
	mov r10, qword [rsp+8*808]
	mov r11, qword [rsp+8*807]
	mov r10, [r11]
	mov qword [rsp+8*808],r10
	mov qword [rsp+8*807],r11
	mov     rsi, [rsp+8*808]
	mov     rdi, [rsp+8*805]
	call    concat
	mov [rsp+8*809], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*809]
	call    concat
	mov [rsp+8*810], rax
	mov r10, qword [rsp+8*811]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*811],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 21
	mov     rdi, [rsp+8*811]
	call    address
	mov [rsp+8*812], rax
	mov r10, qword [rsp+8*813]
	mov r11, qword [rsp+8*812]
	mov r10, [r11]
	mov qword [rsp+8*813],r10
	mov qword [rsp+8*812],r11
	mov     rsi, [rsp+8*813]
	mov     rdi, [rsp+8*810]
	call    concat
	mov [rsp+8*814], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*814]
	call    concat
	mov [rsp+8*815], rax
	mov r10, qword [rsp+8*816]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*816],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*816]
	call    address
	mov [rsp+8*817], rax
	mov r10, qword [rsp+8*818]
	mov r11, qword [rsp+8*817]
	mov r10, [r11]
	mov qword [rsp+8*818],r10
	mov qword [rsp+8*817],r11
	mov     rsi, [rsp+8*818]
	mov     rdi, [rsp+8*815]
	call    concat
	mov [rsp+8*819], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*819]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*819],r11
	mov r10, qword [rsp+8*820]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*820],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*820] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*821]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*821],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*821]
	call    address
	mov [rsp+8*822], rax
	mov r10, qword [rsp+8*823]
	mov r11, qword [rsp+8*822]
	mov r10, [r11]
	mov qword [rsp+8*823],r10
	mov qword [rsp+8*822],r11
	mov r10, qword [rsp+8*824]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*824],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 68
	mov     rdi, [rsp+8*824]
	call    address
	mov [rsp+8*825], rax
	mov r10, qword [rsp+8*826]
	mov r11, qword [rsp+8*825]
	mov r10, [r11]
	mov qword [rsp+8*826],r10
	mov qword [rsp+8*825],r11
	mov     rsi, [rsp+8*826]
	mov     rdi, [rsp+8*823]
	call    concat
	mov [rsp+8*827], rax
	mov r10, qword [rsp+8*828]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*828],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*828]
	call    address
	mov [rsp+8*829], rax
	mov r10, qword [rsp+8*830]
	mov r11, qword [rsp+8*829]
	mov r10, [r11]
	mov qword [rsp+8*830],r10
	mov qword [rsp+8*829],r11
	mov     rsi, [rsp+8*830]
	mov     rdi, [rsp+8*827]
	call    concat
	mov [rsp+8*831], rax
	mov r10, qword [rsp+8*832]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*832],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 86
	mov     rdi, [rsp+8*832]
	call    address
	mov [rsp+8*833], rax
	mov r10, qword [rsp+8*834]
	mov r11, qword [rsp+8*833]
	mov r10, [r11]
	mov qword [rsp+8*834],r10
	mov qword [rsp+8*833],r11
	mov     rsi, [rsp+8*834]
	mov     rdi, [rsp+8*831]
	call    concat
	mov [rsp+8*835], rax
	mov r10, qword [rsp+8*836]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*836],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*836]
	call    address
	mov [rsp+8*837], rax
	mov r10, qword [rsp+8*838]
	mov r11, qword [rsp+8*837]
	mov r10, [r11]
	mov qword [rsp+8*838],r10
	mov qword [rsp+8*837],r11
	mov     rsi, [rsp+8*838]
	mov     rdi, [rsp+8*835]
	call    concat
	mov [rsp+8*839], rax
	mov r10, qword [rsp+8*840]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*840],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*840]
	call    address
	mov [rsp+8*841], rax
	mov r10, qword [rsp+8*842]
	mov r11, qword [rsp+8*841]
	mov r10, [r11]
	mov qword [rsp+8*842],r10
	mov qword [rsp+8*841],r11
	mov     rsi, [rsp+8*842]
	mov     rdi, [rsp+8*839]
	call    concat
	mov [rsp+8*843], rax
	mov r10, qword [rsp+8*844]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*844],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 22
	mov     rdi, [rsp+8*844]
	call    address
	mov [rsp+8*845], rax
	mov r10, qword [rsp+8*846]
	mov r11, qword [rsp+8*845]
	mov r10, [r11]
	mov qword [rsp+8*846],r10
	mov qword [rsp+8*845],r11
	mov     rsi, [rsp+8*846]
	mov     rdi, [rsp+8*843]
	call    concat
	mov [rsp+8*847], rax
	mov r10, qword [rsp+8*848]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*848],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*848]
	call    address
	mov [rsp+8*849], rax
	mov r10, qword [rsp+8*850]
	mov r11, qword [rsp+8*849]
	mov r10, [r11]
	mov qword [rsp+8*850],r10
	mov qword [rsp+8*849],r11
	mov     rsi, [rsp+8*850]
	mov     rdi, [rsp+8*847]
	call    concat
	mov [rsp+8*851], rax
	mov r10, qword [rsp+8*852]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*852],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*852]
	call    address
	mov [rsp+8*853], rax
	mov r10, qword [rsp+8*854]
	mov r11, qword [rsp+8*853]
	mov r10, [r11]
	mov qword [rsp+8*854],r10
	mov qword [rsp+8*853],r11
	mov     rsi, [rsp+8*854]
	mov     rdi, [rsp+8*851]
	call    concat
	mov [rsp+8*855], rax
	mov r10, qword [rsp+8*856]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*856],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*856]
	call    address
	mov [rsp+8*857], rax
	mov r10, qword [rsp+8*858]
	mov r11, qword [rsp+8*857]
	mov r10, [r11]
	mov qword [rsp+8*858],r10
	mov qword [rsp+8*857],r11
	mov     rsi, [rsp+8*858]
	mov     rdi, [rsp+8*855]
	call    concat
	mov [rsp+8*859], rax
	mov r10, qword [rsp+8*860]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*860],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*860]
	call    address
	mov [rsp+8*861], rax
	mov r10, qword [rsp+8*862]
	mov r11, qword [rsp+8*861]
	mov r10, [r11]
	mov qword [rsp+8*862],r10
	mov qword [rsp+8*861],r11
	mov     rsi, [rsp+8*862]
	mov     rdi, [rsp+8*859]
	call    concat
	mov [rsp+8*863], rax
	mov r10, qword [rsp+8*864]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*864],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 83
	mov     rdi, [rsp+8*864]
	call    address
	mov [rsp+8*865], rax
	mov r10, qword [rsp+8*866]
	mov r11, qword [rsp+8*865]
	mov r10, [r11]
	mov qword [rsp+8*866],r10
	mov qword [rsp+8*865],r11
	mov     rsi, [rsp+8*866]
	mov     rdi, [rsp+8*863]
	call    concat
	mov [rsp+8*867], rax
	mov r10, qword [rsp+8*868]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*868],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*868]
	call    address
	mov [rsp+8*869], rax
	mov r10, qword [rsp+8*870]
	mov r11, qword [rsp+8*869]
	mov r10, [r11]
	mov qword [rsp+8*870],r10
	mov qword [rsp+8*869],r11
	mov     rsi, [rsp+8*870]
	mov     rdi, [rsp+8*867]
	call    concat
	mov [rsp+8*871], rax
	mov r10, qword [rsp+8*872]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*872],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*872]
	call    address
	mov [rsp+8*873], rax
	mov r10, qword [rsp+8*874]
	mov r11, qword [rsp+8*873]
	mov r10, [r11]
	mov qword [rsp+8*874],r10
	mov qword [rsp+8*873],r11
	mov     rsi, [rsp+8*874]
	mov     rdi, [rsp+8*871]
	call    concat
	mov [rsp+8*875], rax
	mov r10, qword [rsp+8*876]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*876],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*876]
	call    address
	mov [rsp+8*877], rax
	mov r10, qword [rsp+8*878]
	mov r11, qword [rsp+8*877]
	mov r10, [r11]
	mov qword [rsp+8*878],r10
	mov qword [rsp+8*877],r11
	mov     rsi, [rsp+8*878]
	mov     rdi, [rsp+8*875]
	call    concat
	mov [rsp+8*879], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*879]
	call    concat
	mov [rsp+8*880], rax
	mov r10, qword [rsp+8*881]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*881],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 22
	mov     rdi, [rsp+8*881]
	call    address
	mov [rsp+8*882], rax
	mov r10, qword [rsp+8*883]
	mov r11, qword [rsp+8*882]
	mov r10, [r11]
	mov qword [rsp+8*883],r10
	mov qword [rsp+8*882],r11
	mov     rsi, [rsp+8*883]
	mov     rdi, [rsp+8*880]
	call    concat
	mov [rsp+8*884], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*884]
	call    concat
	mov [rsp+8*885], rax
	mov r10, qword [rsp+8*886]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*886],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*886]
	call    address
	mov [rsp+8*887], rax
	mov r10, qword [rsp+8*888]
	mov r11, qword [rsp+8*887]
	mov r10, [r11]
	mov qword [rsp+8*888],r10
	mov qword [rsp+8*887],r11
	mov     rsi, [rsp+8*888]
	mov     rdi, [rsp+8*885]
	call    concat
	mov [rsp+8*889], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*889]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*889],r11
	mov r10, qword [rsp+8*890]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*890],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*890] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*891]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*891],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*891]
	call    address
	mov [rsp+8*892], rax
	mov r10, qword [rsp+8*893]
	mov r11, qword [rsp+8*892]
	mov r10, [r11]
	mov qword [rsp+8*893],r10
	mov qword [rsp+8*892],r11
	mov r10, qword [rsp+8*894]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*894],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 68
	mov     rdi, [rsp+8*894]
	call    address
	mov [rsp+8*895], rax
	mov r10, qword [rsp+8*896]
	mov r11, qword [rsp+8*895]
	mov r10, [r11]
	mov qword [rsp+8*896],r10
	mov qword [rsp+8*895],r11
	mov     rsi, [rsp+8*896]
	mov     rdi, [rsp+8*893]
	call    concat
	mov [rsp+8*897], rax
	mov r10, qword [rsp+8*898]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*898],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*898]
	call    address
	mov [rsp+8*899], rax
	mov r10, qword [rsp+8*900]
	mov r11, qword [rsp+8*899]
	mov r10, [r11]
	mov qword [rsp+8*900],r10
	mov qword [rsp+8*899],r11
	mov     rsi, [rsp+8*900]
	mov     rdi, [rsp+8*897]
	call    concat
	mov [rsp+8*901], rax
	mov r10, qword [rsp+8*902]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*902],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 86
	mov     rdi, [rsp+8*902]
	call    address
	mov [rsp+8*903], rax
	mov r10, qword [rsp+8*904]
	mov r11, qword [rsp+8*903]
	mov r10, [r11]
	mov qword [rsp+8*904],r10
	mov qword [rsp+8*903],r11
	mov     rsi, [rsp+8*904]
	mov     rdi, [rsp+8*901]
	call    concat
	mov [rsp+8*905], rax
	mov r10, qword [rsp+8*906]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*906],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*906]
	call    address
	mov [rsp+8*907], rax
	mov r10, qword [rsp+8*908]
	mov r11, qword [rsp+8*907]
	mov r10, [r11]
	mov qword [rsp+8*908],r10
	mov qword [rsp+8*907],r11
	mov     rsi, [rsp+8*908]
	mov     rdi, [rsp+8*905]
	call    concat
	mov [rsp+8*909], rax
	mov r10, qword [rsp+8*910]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*910],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*910]
	call    address
	mov [rsp+8*911], rax
	mov r10, qword [rsp+8*912]
	mov r11, qword [rsp+8*911]
	mov r10, [r11]
	mov qword [rsp+8*912],r10
	mov qword [rsp+8*911],r11
	mov     rsi, [rsp+8*912]
	mov     rdi, [rsp+8*909]
	call    concat
	mov [rsp+8*913], rax
	mov r10, qword [rsp+8*914]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*914],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 23
	mov     rdi, [rsp+8*914]
	call    address
	mov [rsp+8*915], rax
	mov r10, qword [rsp+8*916]
	mov r11, qword [rsp+8*915]
	mov r10, [r11]
	mov qword [rsp+8*916],r10
	mov qword [rsp+8*915],r11
	mov     rsi, [rsp+8*916]
	mov     rdi, [rsp+8*913]
	call    concat
	mov [rsp+8*917], rax
	mov r10, qword [rsp+8*918]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*918],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*918]
	call    address
	mov [rsp+8*919], rax
	mov r10, qword [rsp+8*920]
	mov r11, qword [rsp+8*919]
	mov r10, [r11]
	mov qword [rsp+8*920],r10
	mov qword [rsp+8*919],r11
	mov     rsi, [rsp+8*920]
	mov     rdi, [rsp+8*917]
	call    concat
	mov [rsp+8*921], rax
	mov r10, qword [rsp+8*922]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*922],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*922]
	call    address
	mov [rsp+8*923], rax
	mov r10, qword [rsp+8*924]
	mov r11, qword [rsp+8*923]
	mov r10, [r11]
	mov qword [rsp+8*924],r10
	mov qword [rsp+8*923],r11
	mov     rsi, [rsp+8*924]
	mov     rdi, [rsp+8*921]
	call    concat
	mov [rsp+8*925], rax
	mov r10, qword [rsp+8*926]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*926],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*926]
	call    address
	mov [rsp+8*927], rax
	mov r10, qword [rsp+8*928]
	mov r11, qword [rsp+8*927]
	mov r10, [r11]
	mov qword [rsp+8*928],r10
	mov qword [rsp+8*927],r11
	mov     rsi, [rsp+8*928]
	mov     rdi, [rsp+8*925]
	call    concat
	mov [rsp+8*929], rax
	mov r10, qword [rsp+8*930]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*930],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*930]
	call    address
	mov [rsp+8*931], rax
	mov r10, qword [rsp+8*932]
	mov r11, qword [rsp+8*931]
	mov r10, [r11]
	mov qword [rsp+8*932],r10
	mov qword [rsp+8*931],r11
	mov     rsi, [rsp+8*932]
	mov     rdi, [rsp+8*929]
	call    concat
	mov [rsp+8*933], rax
	mov r10, qword [rsp+8*934]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*934],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 83
	mov     rdi, [rsp+8*934]
	call    address
	mov [rsp+8*935], rax
	mov r10, qword [rsp+8*936]
	mov r11, qword [rsp+8*935]
	mov r10, [r11]
	mov qword [rsp+8*936],r10
	mov qword [rsp+8*935],r11
	mov     rsi, [rsp+8*936]
	mov     rdi, [rsp+8*933]
	call    concat
	mov [rsp+8*937], rax
	mov r10, qword [rsp+8*938]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*938],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*938]
	call    address
	mov [rsp+8*939], rax
	mov r10, qword [rsp+8*940]
	mov r11, qword [rsp+8*939]
	mov r10, [r11]
	mov qword [rsp+8*940],r10
	mov qword [rsp+8*939],r11
	mov     rsi, [rsp+8*940]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*941], rax
	mov r10, qword [rsp+8*942]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*942],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*942]
	call    address
	mov [rsp+8*943], rax
	mov r10, qword [rsp+8*944]
	mov r11, qword [rsp+8*943]
	mov r10, [r11]
	mov qword [rsp+8*944],r10
	mov qword [rsp+8*943],r11
	mov     rsi, [rsp+8*944]
	mov     rdi, [rsp+8*941]
	call    concat
	mov [rsp+8*945], rax
	mov r10, qword [rsp+8*946]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*946],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*946]
	call    address
	mov [rsp+8*947], rax
	mov r10, qword [rsp+8*948]
	mov r11, qword [rsp+8*947]
	mov r10, [r11]
	mov qword [rsp+8*948],r10
	mov qword [rsp+8*947],r11
	mov     rsi, [rsp+8*948]
	mov     rdi, [rsp+8*945]
	call    concat
	mov [rsp+8*949], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*949]
	call    concat
	mov [rsp+8*950], rax
	mov r10, qword [rsp+8*951]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*951],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 23
	mov     rdi, [rsp+8*951]
	call    address
	mov [rsp+8*952], rax
	mov r10, qword [rsp+8*953]
	mov r11, qword [rsp+8*952]
	mov r10, [r11]
	mov qword [rsp+8*953],r10
	mov qword [rsp+8*952],r11
	mov     rsi, [rsp+8*953]
	mov     rdi, [rsp+8*950]
	call    concat
	mov [rsp+8*954], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*954]
	call    concat
	mov [rsp+8*955], rax
	mov r10, qword [rsp+8*956]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*956],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*956]
	call    address
	mov [rsp+8*957], rax
	mov r10, qword [rsp+8*958]
	mov r11, qword [rsp+8*957]
	mov r10, [r11]
	mov qword [rsp+8*958],r10
	mov qword [rsp+8*957],r11
	mov     rsi, [rsp+8*958]
	mov     rdi, [rsp+8*955]
	call    concat
	mov [rsp+8*959], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*959]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*959],r11
	mov r10, qword [rsp+8*960]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*960],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*960] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*961]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*961],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*961]
	call    address
	mov [rsp+8*962], rax
	mov r10, qword [rsp+8*963]
	mov r11, qword [rsp+8*962]
	mov r10, [r11]
	mov qword [rsp+8*963],r10
	mov qword [rsp+8*962],r11
	mov r10, qword [rsp+8*964]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*964],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 68
	mov     rdi, [rsp+8*964]
	call    address
	mov [rsp+8*965], rax
	mov r10, qword [rsp+8*966]
	mov r11, qword [rsp+8*965]
	mov r10, [r11]
	mov qword [rsp+8*966],r10
	mov qword [rsp+8*965],r11
	mov     rsi, [rsp+8*966]
	mov     rdi, [rsp+8*963]
	call    concat
	mov [rsp+8*967], rax
	mov r10, qword [rsp+8*968]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*968],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*968]
	call    address
	mov [rsp+8*969], rax
	mov r10, qword [rsp+8*970]
	mov r11, qword [rsp+8*969]
	mov r10, [r11]
	mov qword [rsp+8*970],r10
	mov qword [rsp+8*969],r11
	mov     rsi, [rsp+8*970]
	mov     rdi, [rsp+8*967]
	call    concat
	mov [rsp+8*971], rax
	mov r10, qword [rsp+8*972]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*972],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 86
	mov     rdi, [rsp+8*972]
	call    address
	mov [rsp+8*973], rax
	mov r10, qword [rsp+8*974]
	mov r11, qword [rsp+8*973]
	mov r10, [r11]
	mov qword [rsp+8*974],r10
	mov qword [rsp+8*973],r11
	mov     rsi, [rsp+8*974]
	mov     rdi, [rsp+8*971]
	call    concat
	mov [rsp+8*975], rax
	mov r10, qword [rsp+8*976]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*976],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*976]
	call    address
	mov [rsp+8*977], rax
	mov r10, qword [rsp+8*978]
	mov r11, qword [rsp+8*977]
	mov r10, [r11]
	mov qword [rsp+8*978],r10
	mov qword [rsp+8*977],r11
	mov     rsi, [rsp+8*978]
	mov     rdi, [rsp+8*975]
	call    concat
	mov [rsp+8*979], rax
	mov r10, qword [rsp+8*980]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*980],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*980]
	call    address
	mov [rsp+8*981], rax
	mov r10, qword [rsp+8*982]
	mov r11, qword [rsp+8*981]
	mov r10, [r11]
	mov qword [rsp+8*982],r10
	mov qword [rsp+8*981],r11
	mov     rsi, [rsp+8*982]
	mov     rdi, [rsp+8*979]
	call    concat
	mov [rsp+8*983], rax
	mov r10, qword [rsp+8*984]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*984],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 24
	mov     rdi, [rsp+8*984]
	call    address
	mov [rsp+8*985], rax
	mov r10, qword [rsp+8*986]
	mov r11, qword [rsp+8*985]
	mov r10, [r11]
	mov qword [rsp+8*986],r10
	mov qword [rsp+8*985],r11
	mov     rsi, [rsp+8*986]
	mov     rdi, [rsp+8*983]
	call    concat
	mov [rsp+8*987], rax
	mov r10, qword [rsp+8*988]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*988],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*988]
	call    address
	mov [rsp+8*989], rax
	mov r10, qword [rsp+8*990]
	mov r11, qword [rsp+8*989]
	mov r10, [r11]
	mov qword [rsp+8*990],r10
	mov qword [rsp+8*989],r11
	mov     rsi, [rsp+8*990]
	mov     rdi, [rsp+8*987]
	call    concat
	mov [rsp+8*991], rax
	mov r10, qword [rsp+8*992]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*992],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*992]
	call    address
	mov [rsp+8*993], rax
	mov r10, qword [rsp+8*994]
	mov r11, qword [rsp+8*993]
	mov r10, [r11]
	mov qword [rsp+8*994],r10
	mov qword [rsp+8*993],r11
	mov     rsi, [rsp+8*994]
	mov     rdi, [rsp+8*991]
	call    concat
	mov [rsp+8*995], rax
	mov r10, qword [rsp+8*996]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*996],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*996]
	call    address
	mov [rsp+8*997], rax
	mov r10, qword [rsp+8*998]
	mov r11, qword [rsp+8*997]
	mov r10, [r11]
	mov qword [rsp+8*998],r10
	mov qword [rsp+8*997],r11
	mov     rsi, [rsp+8*998]
	mov     rdi, [rsp+8*995]
	call    concat
	mov [rsp+8*999], rax
	mov r10, qword [rsp+8*1000]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1000],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1000]
	call    address
	mov [rsp+8*1001], rax
	mov r10, qword [rsp+8*1002]
	mov r11, qword [rsp+8*1001]
	mov r10, [r11]
	mov qword [rsp+8*1002],r10
	mov qword [rsp+8*1001],r11
	mov     rsi, [rsp+8*1002]
	mov     rdi, [rsp+8*999]
	call    concat
	mov [rsp+8*1003], rax
	mov r10, qword [rsp+8*1004]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1004],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 83
	mov     rdi, [rsp+8*1004]
	call    address
	mov [rsp+8*1005], rax
	mov r10, qword [rsp+8*1006]
	mov r11, qword [rsp+8*1005]
	mov r10, [r11]
	mov qword [rsp+8*1006],r10
	mov qword [rsp+8*1005],r11
	mov     rsi, [rsp+8*1006]
	mov     rdi, [rsp+8*1003]
	call    concat
	mov [rsp+8*1007], rax
	mov r10, qword [rsp+8*1008]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1008],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1008]
	call    address
	mov [rsp+8*1009], rax
	mov r10, qword [rsp+8*1010]
	mov r11, qword [rsp+8*1009]
	mov r10, [r11]
	mov qword [rsp+8*1010],r10
	mov qword [rsp+8*1009],r11
	mov     rsi, [rsp+8*1010]
	mov     rdi, [rsp+8*1007]
	call    concat
	mov [rsp+8*1011], rax
	mov r10, qword [rsp+8*1012]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1012],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1012]
	call    address
	mov [rsp+8*1013], rax
	mov r10, qword [rsp+8*1014]
	mov r11, qword [rsp+8*1013]
	mov r10, [r11]
	mov qword [rsp+8*1014],r10
	mov qword [rsp+8*1013],r11
	mov     rsi, [rsp+8*1014]
	mov     rdi, [rsp+8*1011]
	call    concat
	mov [rsp+8*1015], rax
	mov r10, qword [rsp+8*1016]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1016],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*1016]
	call    address
	mov [rsp+8*1017], rax
	mov r10, qword [rsp+8*1018]
	mov r11, qword [rsp+8*1017]
	mov r10, [r11]
	mov qword [rsp+8*1018],r10
	mov qword [rsp+8*1017],r11
	mov     rsi, [rsp+8*1018]
	mov     rdi, [rsp+8*1015]
	call    concat
	mov [rsp+8*1019], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1019]
	call    concat
	mov [rsp+8*1020], rax
	mov r10, qword [rsp+8*1021]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1021],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 24
	mov     rdi, [rsp+8*1021]
	call    address
	mov [rsp+8*1022], rax
	mov r10, qword [rsp+8*1023]
	mov r11, qword [rsp+8*1022]
	mov r10, [r11]
	mov qword [rsp+8*1023],r10
	mov qword [rsp+8*1022],r11
	mov     rsi, [rsp+8*1023]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1024], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1024]
	call    concat
	mov [rsp+8*1025], rax
	mov r10, qword [rsp+8*1026]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1026],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*1026]
	call    address
	mov [rsp+8*1027], rax
	mov r10, qword [rsp+8*1028]
	mov r11, qword [rsp+8*1027]
	mov r10, [r11]
	mov qword [rsp+8*1028],r10
	mov qword [rsp+8*1027],r11
	mov     rsi, [rsp+8*1028]
	mov     rdi, [rsp+8*1025]
	call    concat
	mov [rsp+8*1029], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*1029]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*1029],r11
	mov r10, qword [rsp+8*1030]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*1030],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*1030] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*1031]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1031],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 91
	mov     rdi, [rsp+8*1031]
	call    address
	mov [rsp+8*1032], rax
	mov r10, qword [rsp+8*1033]
	mov r11, qword [rsp+8*1032]
	mov r10, [r11]
	mov qword [rsp+8*1033],r10
	mov qword [rsp+8*1032],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*1033]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*1033],r11
	mov r10, qword [rsp+8*1034]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*1034],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*1034] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*1035]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1035],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1035]
	call    address
	mov [rsp+8*1036], rax
	mov r10, qword [rsp+8*1037]
	mov r11, qword [rsp+8*1036]
	mov r10, [r11]
	mov qword [rsp+8*1037],r10
	mov qword [rsp+8*1036],r11
	mov r10, qword [rsp+8*1038]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1038],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1038]
	call    address
	mov [rsp+8*1039], rax
	mov r10, qword [rsp+8*1040]
	mov r11, qword [rsp+8*1039]
	mov r10, [r11]
	mov qword [rsp+8*1040],r10
	mov qword [rsp+8*1039],r11
	mov     rsi, [rsp+8*1040]
	mov     rdi, [rsp+8*1037]
	call    concat
	mov [rsp+8*1041], rax
	mov r10, qword [rsp+8*1042]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1042],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1042]
	call    address
	mov [rsp+8*1043], rax
	mov r10, qword [rsp+8*1044]
	mov r11, qword [rsp+8*1043]
	mov r10, [r11]
	mov qword [rsp+8*1044],r10
	mov qword [rsp+8*1043],r11
	mov     rsi, [rsp+8*1044]
	mov     rdi, [rsp+8*1041]
	call    concat
	mov [rsp+8*1045], rax
	mov r10, qword [rsp+8*1046]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1046],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1046]
	call    address
	mov [rsp+8*1047], rax
	mov r10, qword [rsp+8*1048]
	mov r11, qword [rsp+8*1047]
	mov r10, [r11]
	mov qword [rsp+8*1048],r10
	mov qword [rsp+8*1047],r11
	mov     rsi, [rsp+8*1048]
	mov     rdi, [rsp+8*1045]
	call    concat
	mov [rsp+8*1049], rax
	mov r10, qword [rsp+8*1050]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1050],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1050]
	call    address
	mov [rsp+8*1051], rax
	mov r10, qword [rsp+8*1052]
	mov r11, qword [rsp+8*1051]
	mov r10, [r11]
	mov qword [rsp+8*1052],r10
	mov qword [rsp+8*1051],r11
	mov     rsi, [rsp+8*1052]
	mov     rdi, [rsp+8*1049]
	call    concat
	mov [rsp+8*1053], rax
	mov r10, qword [rsp+8*1054]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1054],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*1054]
	call    address
	mov [rsp+8*1055], rax
	mov r10, qword [rsp+8*1056]
	mov r11, qword [rsp+8*1055]
	mov r10, [r11]
	mov qword [rsp+8*1056],r10
	mov qword [rsp+8*1055],r11
	mov     rsi, [rsp+8*1056]
	mov     rdi, [rsp+8*1053]
	call    concat
	mov [rsp+8*1057], rax
	mov r10, qword [rsp+8*1058]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1058],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 58
	mov     rdi, [rsp+8*1058]
	call    address
	mov [rsp+8*1059], rax
	mov r10, qword [rsp+8*1060]
	mov r11, qword [rsp+8*1059]
	mov r10, [r11]
	mov qword [rsp+8*1060],r10
	mov qword [rsp+8*1059],r11
	mov     rsi, [rsp+8*1060]
	mov     rdi, [rsp+8*1057]
	call    concat
	mov [rsp+8*1061], rax
	mov r10, qword [rsp+8*1062]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1062],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 59
	mov     rdi, [rsp+8*1062]
	call    address
	mov [rsp+8*1063], rax
	mov r10, qword [rsp+8*1064]
	mov r11, qword [rsp+8*1063]
	mov r10, [r11]
	mov qword [rsp+8*1064],r10
	mov qword [rsp+8*1063],r11
	mov     rsi, [rsp+8*1064]
	mov     rdi, [rsp+8*1061]
	call    concat
	mov [rsp+8*1065], rax
	mov r10, qword [rsp+8*1066]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1066],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*1066]
	call    address
	mov [rsp+8*1067], rax
	mov r10, qword [rsp+8*1068]
	mov r11, qword [rsp+8*1067]
	mov r10, [r11]
	mov qword [rsp+8*1068],r10
	mov qword [rsp+8*1067],r11
	mov     rsi, [rsp+8*1068]
	mov     rdi, [rsp+8*1065]
	call    concat
	mov [rsp+8*1069], rax
	mov r10, qword [rsp+8*1070]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1070],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1070]
	call    address
	mov [rsp+8*1071], rax
	mov r10, qword [rsp+8*1072]
	mov r11, qword [rsp+8*1071]
	mov r10, [r11]
	mov qword [rsp+8*1072],r10
	mov qword [rsp+8*1071],r11
	mov     rsi, [rsp+8*1072]
	mov     rdi, [rsp+8*1069]
	call    concat
	mov [rsp+8*1073], rax
	mov r10, qword [rsp+8*1074]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1074],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*1074]
	call    address
	mov [rsp+8*1075], rax
	mov r10, qword [rsp+8*1076]
	mov r11, qword [rsp+8*1075]
	mov r10, [r11]
	mov qword [rsp+8*1076],r10
	mov qword [rsp+8*1075],r11
	mov     rsi, [rsp+8*1076]
	mov     rdi, [rsp+8*1073]
	call    concat
	mov [rsp+8*1077], rax
	mov r10, qword [rsp+8*1078]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1078],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1078]
	call    address
	mov [rsp+8*1079], rax
	mov r10, qword [rsp+8*1080]
	mov r11, qword [rsp+8*1079]
	mov r10, [r11]
	mov qword [rsp+8*1080],r10
	mov qword [rsp+8*1079],r11
	mov     rsi, [rsp+8*1080]
	mov     rdi, [rsp+8*1077]
	call    concat
	mov [rsp+8*1081], rax
	mov r10, qword [rsp+8*1082]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1082],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*1082]
	call    address
	mov [rsp+8*1083], rax
	mov r10, qword [rsp+8*1084]
	mov r11, qword [rsp+8*1083]
	mov r10, [r11]
	mov qword [rsp+8*1084],r10
	mov qword [rsp+8*1083],r11
	mov     rsi, [rsp+8*1084]
	mov     rdi, [rsp+8*1081]
	call    concat
	mov [rsp+8*1085], rax
	mov r10, qword [rsp+8*1086]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1086],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 85
	mov     rdi, [rsp+8*1086]
	call    address
	mov [rsp+8*1087], rax
	mov r10, qword [rsp+8*1088]
	mov r11, qword [rsp+8*1087]
	mov r10, [r11]
	mov qword [rsp+8*1088],r10
	mov qword [rsp+8*1087],r11
	mov     rsi, [rsp+8*1088]
	mov     rdi, [rsp+8*1085]
	call    concat
	mov [rsp+8*1089], rax
	mov r10, qword [rsp+8*1090]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1090],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*1090]
	call    address
	mov [rsp+8*1091], rax
	mov r10, qword [rsp+8*1092]
	mov r11, qword [rsp+8*1091]
	mov r10, [r11]
	mov qword [rsp+8*1092],r10
	mov qword [rsp+8*1091],r11
	mov     rsi, [rsp+8*1092]
	mov     rdi, [rsp+8*1089]
	call    concat
	mov [rsp+8*1093], rax
	mov r10, qword [rsp+8*1094]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1094],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1094]
	call    address
	mov [rsp+8*1095], rax
	mov r10, qword [rsp+8*1096]
	mov r11, qword [rsp+8*1095]
	mov r10, [r11]
	mov qword [rsp+8*1096],r10
	mov qword [rsp+8*1095],r11
	mov     rsi, [rsp+8*1096]
	mov     rdi, [rsp+8*1093]
	call    concat
	mov [rsp+8*1097], rax
	mov r10, qword [rsp+8*1098]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1098],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1098]
	call    address
	mov [rsp+8*1099], rax
	mov r10, qword [rsp+8*1100]
	mov r11, qword [rsp+8*1099]
	mov r10, [r11]
	mov qword [rsp+8*1100],r10
	mov qword [rsp+8*1099],r11
	mov     rsi, [rsp+8*1100]
	mov     rdi, [rsp+8*1097]
	call    concat
	mov [rsp+8*1101], rax
	mov r10, qword [rsp+8*1102]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1102],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1102]
	call    address
	mov [rsp+8*1103], rax
	mov r10, qword [rsp+8*1104]
	mov r11, qword [rsp+8*1103]
	mov r10, [r11]
	mov qword [rsp+8*1104],r10
	mov qword [rsp+8*1103],r11
	mov     rsi, [rsp+8*1104]
	mov     rdi, [rsp+8*1101]
	call    concat
	mov [rsp+8*1105], rax
	mov r10, qword [rsp+8*1106]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1106],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1106]
	call    address
	mov [rsp+8*1107], rax
	mov r10, qword [rsp+8*1108]
	mov r11, qword [rsp+8*1107]
	mov r10, [r11]
	mov qword [rsp+8*1108],r10
	mov qword [rsp+8*1107],r11
	mov     rsi, [rsp+8*1108]
	mov     rdi, [rsp+8*1105]
	call    concat
	mov [rsp+8*1109], rax
	mov r10, qword [rsp+8*1110]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1110],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1110]
	call    address
	mov [rsp+8*1111], rax
	mov r10, qword [rsp+8*1112]
	mov r11, qword [rsp+8*1111]
	mov r10, [r11]
	mov qword [rsp+8*1112],r10
	mov qword [rsp+8*1111],r11
	mov     rsi, [rsp+8*1112]
	mov     rdi, [rsp+8*1109]
	call    concat
	mov [rsp+8*1113], rax
	mov r10, qword [rsp+8*1114]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1114],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*1114]
	call    address
	mov [rsp+8*1115], rax
	mov r10, qword [rsp+8*1116]
	mov r11, qword [rsp+8*1115]
	mov r10, [r11]
	mov qword [rsp+8*1116],r10
	mov qword [rsp+8*1115],r11
	mov     rsi, [rsp+8*1116]
	mov     rdi, [rsp+8*1113]
	call    concat
	mov [rsp+8*1117], rax
	mov r10, qword [rsp+8*1118]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1118],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 58
	mov     rdi, [rsp+8*1118]
	call    address
	mov [rsp+8*1119], rax
	mov r10, qword [rsp+8*1120]
	mov r11, qword [rsp+8*1119]
	mov r10, [r11]
	mov qword [rsp+8*1120],r10
	mov qword [rsp+8*1119],r11
	mov     rsi, [rsp+8*1120]
	mov     rdi, [rsp+8*1117]
	call    concat
	mov [rsp+8*1121], rax
	mov r10, qword [rsp+8*1122]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1122],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 17
	mov     rdi, [rsp+8*1122]
	call    address
	mov [rsp+8*1123], rax
	mov r10, qword [rsp+8*1124]
	mov r11, qword [rsp+8*1123]
	mov r10, [r11]
	mov qword [rsp+8*1124],r10
	mov qword [rsp+8*1123],r11
	mov     rsi, [rsp+8*1124]
	mov     rdi, [rsp+8*1121]
	call    concat
	mov [rsp+8*1125], rax
	mov r10, qword [rsp+8*1126]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1126],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 20
	mov     rdi, [rsp+8*1126]
	call    address
	mov [rsp+8*1127], rax
	mov r10, qword [rsp+8*1128]
	mov r11, qword [rsp+8*1127]
	mov r10, [r11]
	mov qword [rsp+8*1128],r10
	mov qword [rsp+8*1127],r11
	mov     rsi, [rsp+8*1128]
	mov     rdi, [rsp+8*1125]
	call    concat
	mov [rsp+8*1129], rax
	mov r10, qword [rsp+8*1130]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1130],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 21
	mov     rdi, [rsp+8*1130]
	call    address
	mov [rsp+8*1131], rax
	mov r10, qword [rsp+8*1132]
	mov r11, qword [rsp+8*1131]
	mov r10, [r11]
	mov qword [rsp+8*1132],r10
	mov qword [rsp+8*1131],r11
	mov     rsi, [rsp+8*1132]
	mov     rdi, [rsp+8*1129]
	call    concat
	mov [rsp+8*1133], rax
	mov r10, qword [rsp+8*1134]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1134],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 59
	mov     rdi, [rsp+8*1134]
	call    address
	mov [rsp+8*1135], rax
	mov r10, qword [rsp+8*1136]
	mov r11, qword [rsp+8*1135]
	mov r10, [r11]
	mov qword [rsp+8*1136],r10
	mov qword [rsp+8*1135],r11
	mov     rsi, [rsp+8*1136]
	mov     rdi, [rsp+8*1133]
	call    concat
	mov [rsp+8*1137], rax
	mov r10, qword [rsp+8*1138]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1138],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*1138]
	call    address
	mov [rsp+8*1139], rax
	mov r10, qword [rsp+8*1140]
	mov r11, qword [rsp+8*1139]
	mov r10, [r11]
	mov qword [rsp+8*1140],r10
	mov qword [rsp+8*1139],r11
	mov     rsi, [rsp+8*1140]
	mov     rdi, [rsp+8*1137]
	call    concat
	mov [rsp+8*1141], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*1141]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*1141],r11
	mov r10, qword [rsp+8*1142]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*1142],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*1142] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*1143]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1143],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1143]
	call    address
	mov [rsp+8*1144], rax
	mov r10, qword [rsp+8*1145]
	mov r11, qword [rsp+8*1144]
	mov r10, [r11]
	mov qword [rsp+8*1145],r10
	mov qword [rsp+8*1144],r11
	mov r10, qword [rsp+8*1146]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1146],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1146]
	call    address
	mov [rsp+8*1147], rax
	mov r10, qword [rsp+8*1148]
	mov r11, qword [rsp+8*1147]
	mov r10, [r11]
	mov qword [rsp+8*1148],r10
	mov qword [rsp+8*1147],r11
	mov     rsi, [rsp+8*1148]
	mov     rdi, [rsp+8*1145]
	call    concat
	mov [rsp+8*1149], rax
	mov r10, qword [rsp+8*1150]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1150],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1150]
	call    address
	mov [rsp+8*1151], rax
	mov r10, qword [rsp+8*1152]
	mov r11, qword [rsp+8*1151]
	mov r10, [r11]
	mov qword [rsp+8*1152],r10
	mov qword [rsp+8*1151],r11
	mov     rsi, [rsp+8*1152]
	mov     rdi, [rsp+8*1149]
	call    concat
	mov [rsp+8*1153], rax
	mov r10, qword [rsp+8*1154]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1154],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1154]
	call    address
	mov [rsp+8*1155], rax
	mov r10, qword [rsp+8*1156]
	mov r11, qword [rsp+8*1155]
	mov r10, [r11]
	mov qword [rsp+8*1156],r10
	mov qword [rsp+8*1155],r11
	mov     rsi, [rsp+8*1156]
	mov     rdi, [rsp+8*1153]
	call    concat
	mov [rsp+8*1157], rax
	mov r10, qword [rsp+8*1158]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1158],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1158]
	call    address
	mov [rsp+8*1159], rax
	mov r10, qword [rsp+8*1160]
	mov r11, qword [rsp+8*1159]
	mov r10, [r11]
	mov qword [rsp+8*1160],r10
	mov qword [rsp+8*1159],r11
	mov     rsi, [rsp+8*1160]
	mov     rdi, [rsp+8*1157]
	call    concat
	mov [rsp+8*1161], rax
	mov r10, qword [rsp+8*1162]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1162],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*1162]
	call    address
	mov [rsp+8*1163], rax
	mov r10, qword [rsp+8*1164]
	mov r11, qword [rsp+8*1163]
	mov r10, [r11]
	mov qword [rsp+8*1164],r10
	mov qword [rsp+8*1163],r11
	mov     rsi, [rsp+8*1164]
	mov     rdi, [rsp+8*1161]
	call    concat
	mov [rsp+8*1165], rax
	mov r10, qword [rsp+8*1166]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1166],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 58
	mov     rdi, [rsp+8*1166]
	call    address
	mov [rsp+8*1167], rax
	mov r10, qword [rsp+8*1168]
	mov r11, qword [rsp+8*1167]
	mov r10, [r11]
	mov qword [rsp+8*1168],r10
	mov qword [rsp+8*1167],r11
	mov     rsi, [rsp+8*1168]
	mov     rdi, [rsp+8*1165]
	call    concat
	mov [rsp+8*1169], rax
	mov r10, qword [rsp+8*1170]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1170],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 59
	mov     rdi, [rsp+8*1170]
	call    address
	mov [rsp+8*1171], rax
	mov r10, qword [rsp+8*1172]
	mov r11, qword [rsp+8*1171]
	mov r10, [r11]
	mov qword [rsp+8*1172],r10
	mov qword [rsp+8*1171],r11
	mov     rsi, [rsp+8*1172]
	mov     rdi, [rsp+8*1169]
	call    concat
	mov [rsp+8*1173], rax
	mov r10, qword [rsp+8*1174]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1174],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*1174]
	call    address
	mov [rsp+8*1175], rax
	mov r10, qword [rsp+8*1176]
	mov r11, qword [rsp+8*1175]
	mov r10, [r11]
	mov qword [rsp+8*1176],r10
	mov qword [rsp+8*1175],r11
	mov     rsi, [rsp+8*1176]
	mov     rdi, [rsp+8*1173]
	call    concat
	mov [rsp+8*1177], rax
	mov r10, qword [rsp+8*1178]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1178],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*1178]
	call    address
	mov [rsp+8*1179], rax
	mov r10, qword [rsp+8*1180]
	mov r11, qword [rsp+8*1179]
	mov r10, [r11]
	mov qword [rsp+8*1180],r10
	mov qword [rsp+8*1179],r11
	mov     rsi, [rsp+8*1180]
	mov     rdi, [rsp+8*1177]
	call    concat
	mov [rsp+8*1181], rax
	mov r10, qword [rsp+8*1182]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1182],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*1182]
	call    address
	mov [rsp+8*1183], rax
	mov r10, qword [rsp+8*1184]
	mov r11, qword [rsp+8*1183]
	mov r10, [r11]
	mov qword [rsp+8*1184],r10
	mov qword [rsp+8*1183],r11
	mov     rsi, [rsp+8*1184]
	mov     rdi, [rsp+8*1181]
	call    concat
	mov [rsp+8*1185], rax
	mov r10, qword [rsp+8*1186]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1186],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1186]
	call    address
	mov [rsp+8*1187], rax
	mov r10, qword [rsp+8*1188]
	mov r11, qword [rsp+8*1187]
	mov r10, [r11]
	mov qword [rsp+8*1188],r10
	mov qword [rsp+8*1187],r11
	mov     rsi, [rsp+8*1188]
	mov     rdi, [rsp+8*1185]
	call    concat
	mov [rsp+8*1189], rax
	mov r10, qword [rsp+8*1190]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1190],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*1190]
	call    address
	mov [rsp+8*1191], rax
	mov r10, qword [rsp+8*1192]
	mov r11, qword [rsp+8*1191]
	mov r10, [r11]
	mov qword [rsp+8*1192],r10
	mov qword [rsp+8*1191],r11
	mov     rsi, [rsp+8*1192]
	mov     rdi, [rsp+8*1189]
	call    concat
	mov [rsp+8*1193], rax
	mov r10, qword [rsp+8*1194]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1194],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 85
	mov     rdi, [rsp+8*1194]
	call    address
	mov [rsp+8*1195], rax
	mov r10, qword [rsp+8*1196]
	mov r11, qword [rsp+8*1195]
	mov r10, [r11]
	mov qword [rsp+8*1196],r10
	mov qword [rsp+8*1195],r11
	mov     rsi, [rsp+8*1196]
	mov     rdi, [rsp+8*1193]
	call    concat
	mov [rsp+8*1197], rax
	mov r10, qword [rsp+8*1198]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1198],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*1198]
	call    address
	mov [rsp+8*1199], rax
	mov r10, qword [rsp+8*1200]
	mov r11, qword [rsp+8*1199]
	mov r10, [r11]
	mov qword [rsp+8*1200],r10
	mov qword [rsp+8*1199],r11
	mov     rsi, [rsp+8*1200]
	mov     rdi, [rsp+8*1197]
	call    concat
	mov [rsp+8*1201], rax
	mov r10, qword [rsp+8*1202]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1202],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1202]
	call    address
	mov [rsp+8*1203], rax
	mov r10, qword [rsp+8*1204]
	mov r11, qword [rsp+8*1203]
	mov r10, [r11]
	mov qword [rsp+8*1204],r10
	mov qword [rsp+8*1203],r11
	mov     rsi, [rsp+8*1204]
	mov     rdi, [rsp+8*1201]
	call    concat
	mov [rsp+8*1205], rax
	mov r10, qword [rsp+8*1206]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1206],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1206]
	call    address
	mov [rsp+8*1207], rax
	mov r10, qword [rsp+8*1208]
	mov r11, qword [rsp+8*1207]
	mov r10, [r11]
	mov qword [rsp+8*1208],r10
	mov qword [rsp+8*1207],r11
	mov     rsi, [rsp+8*1208]
	mov     rdi, [rsp+8*1205]
	call    concat
	mov [rsp+8*1209], rax
	mov r10, qword [rsp+8*1210]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1210],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1210]
	call    address
	mov [rsp+8*1211], rax
	mov r10, qword [rsp+8*1212]
	mov r11, qword [rsp+8*1211]
	mov r10, [r11]
	mov qword [rsp+8*1212],r10
	mov qword [rsp+8*1211],r11
	mov     rsi, [rsp+8*1212]
	mov     rdi, [rsp+8*1209]
	call    concat
	mov [rsp+8*1213], rax
	mov r10, qword [rsp+8*1214]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1214],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1214]
	call    address
	mov [rsp+8*1215], rax
	mov r10, qword [rsp+8*1216]
	mov r11, qword [rsp+8*1215]
	mov r10, [r11]
	mov qword [rsp+8*1216],r10
	mov qword [rsp+8*1215],r11
	mov     rsi, [rsp+8*1216]
	mov     rdi, [rsp+8*1213]
	call    concat
	mov [rsp+8*1217], rax
	mov r10, qword [rsp+8*1218]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1218],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1218]
	call    address
	mov [rsp+8*1219], rax
	mov r10, qword [rsp+8*1220]
	mov r11, qword [rsp+8*1219]
	mov r10, [r11]
	mov qword [rsp+8*1220],r10
	mov qword [rsp+8*1219],r11
	mov     rsi, [rsp+8*1220]
	mov     rdi, [rsp+8*1217]
	call    concat
	mov [rsp+8*1221], rax
	mov r10, qword [rsp+8*1222]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1222],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*1222]
	call    address
	mov [rsp+8*1223], rax
	mov r10, qword [rsp+8*1224]
	mov r11, qword [rsp+8*1223]
	mov r10, [r11]
	mov qword [rsp+8*1224],r10
	mov qword [rsp+8*1223],r11
	mov     rsi, [rsp+8*1224]
	mov     rdi, [rsp+8*1221]
	call    concat
	mov [rsp+8*1225], rax
	mov r10, qword [rsp+8*1226]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1226],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 58
	mov     rdi, [rsp+8*1226]
	call    address
	mov [rsp+8*1227], rax
	mov r10, qword [rsp+8*1228]
	mov r11, qword [rsp+8*1227]
	mov r10, [r11]
	mov qword [rsp+8*1228],r10
	mov qword [rsp+8*1227],r11
	mov     rsi, [rsp+8*1228]
	mov     rdi, [rsp+8*1225]
	call    concat
	mov [rsp+8*1229], rax
	mov r10, qword [rsp+8*1230]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1230],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 17
	mov     rdi, [rsp+8*1230]
	call    address
	mov [rsp+8*1231], rax
	mov r10, qword [rsp+8*1232]
	mov r11, qword [rsp+8*1231]
	mov r10, [r11]
	mov qword [rsp+8*1232],r10
	mov qword [rsp+8*1231],r11
	mov     rsi, [rsp+8*1232]
	mov     rdi, [rsp+8*1229]
	call    concat
	mov [rsp+8*1233], rax
	mov r10, qword [rsp+8*1234]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1234],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 20
	mov     rdi, [rsp+8*1234]
	call    address
	mov [rsp+8*1235], rax
	mov r10, qword [rsp+8*1236]
	mov r11, qword [rsp+8*1235]
	mov r10, [r11]
	mov qword [rsp+8*1236],r10
	mov qword [rsp+8*1235],r11
	mov     rsi, [rsp+8*1236]
	mov     rdi, [rsp+8*1233]
	call    concat
	mov [rsp+8*1237], rax
	mov r10, qword [rsp+8*1238]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1238],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 21
	mov     rdi, [rsp+8*1238]
	call    address
	mov [rsp+8*1239], rax
	mov r10, qword [rsp+8*1240]
	mov r11, qword [rsp+8*1239]
	mov r10, [r11]
	mov qword [rsp+8*1240],r10
	mov qword [rsp+8*1239],r11
	mov     rsi, [rsp+8*1240]
	mov     rdi, [rsp+8*1237]
	call    concat
	mov [rsp+8*1241], rax
	mov r10, qword [rsp+8*1242]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1242],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 59
	mov     rdi, [rsp+8*1242]
	call    address
	mov [rsp+8*1243], rax
	mov r10, qword [rsp+8*1244]
	mov r11, qword [rsp+8*1243]
	mov r10, [r11]
	mov qword [rsp+8*1244],r10
	mov qword [rsp+8*1243],r11
	mov     rsi, [rsp+8*1244]
	mov     rdi, [rsp+8*1241]
	call    concat
	mov [rsp+8*1245], rax
	mov r10, qword [rsp+8*1246]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1246],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*1246]
	call    address
	mov [rsp+8*1247], rax
	mov r10, qword [rsp+8*1248]
	mov r11, qword [rsp+8*1247]
	mov r10, [r11]
	mov qword [rsp+8*1248],r10
	mov qword [rsp+8*1247],r11
	mov     rsi, [rsp+8*1248]
	mov     rdi, [rsp+8*1245]
	call    concat
	mov [rsp+8*1249], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*1249]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*1249],r11
	mov r10, qword [rsp+8*1250]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*1250],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*1250] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*1251]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1251],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1251]
	call    address
	mov [rsp+8*1252], rax
	mov r10, qword [rsp+8*1253]
	mov r11, qword [rsp+8*1252]
	mov r10, [r11]
	mov qword [rsp+8*1253],r10
	mov qword [rsp+8*1252],r11
	mov r10, qword [rsp+8*1254]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1254],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1254]
	call    address
	mov [rsp+8*1255], rax
	mov r10, qword [rsp+8*1256]
	mov r11, qword [rsp+8*1255]
	mov r10, [r11]
	mov qword [rsp+8*1256],r10
	mov qword [rsp+8*1255],r11
	mov     rsi, [rsp+8*1256]
	mov     rdi, [rsp+8*1253]
	call    concat
	mov [rsp+8*1257], rax
	mov r10, qword [rsp+8*1258]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1258],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1258]
	call    address
	mov [rsp+8*1259], rax
	mov r10, qword [rsp+8*1260]
	mov r11, qword [rsp+8*1259]
	mov r10, [r11]
	mov qword [rsp+8*1260],r10
	mov qword [rsp+8*1259],r11
	mov     rsi, [rsp+8*1260]
	mov     rdi, [rsp+8*1257]
	call    concat
	mov [rsp+8*1261], rax
	mov r10, qword [rsp+8*1262]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1262],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1262]
	call    address
	mov [rsp+8*1263], rax
	mov r10, qword [rsp+8*1264]
	mov r11, qword [rsp+8*1263]
	mov r10, [r11]
	mov qword [rsp+8*1264],r10
	mov qword [rsp+8*1263],r11
	mov     rsi, [rsp+8*1264]
	mov     rdi, [rsp+8*1261]
	call    concat
	mov [rsp+8*1265], rax
	mov r10, qword [rsp+8*1266]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1266],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1266]
	call    address
	mov [rsp+8*1267], rax
	mov r10, qword [rsp+8*1268]
	mov r11, qword [rsp+8*1267]
	mov r10, [r11]
	mov qword [rsp+8*1268],r10
	mov qword [rsp+8*1267],r11
	mov     rsi, [rsp+8*1268]
	mov     rdi, [rsp+8*1265]
	call    concat
	mov [rsp+8*1269], rax
	mov r10, qword [rsp+8*1270]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1270],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*1270]
	call    address
	mov [rsp+8*1271], rax
	mov r10, qword [rsp+8*1272]
	mov r11, qword [rsp+8*1271]
	mov r10, [r11]
	mov qword [rsp+8*1272],r10
	mov qword [rsp+8*1271],r11
	mov     rsi, [rsp+8*1272]
	mov     rdi, [rsp+8*1269]
	call    concat
	mov [rsp+8*1273], rax
	mov r10, qword [rsp+8*1274]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1274],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*1274]
	call    address
	mov [rsp+8*1275], rax
	mov r10, qword [rsp+8*1276]
	mov r11, qword [rsp+8*1275]
	mov r10, [r11]
	mov qword [rsp+8*1276],r10
	mov qword [rsp+8*1275],r11
	mov     rsi, [rsp+8*1276]
	mov     rdi, [rsp+8*1273]
	call    concat
	mov [rsp+8*1277], rax
	mov r10, qword [rsp+8*1278]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1278],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1278]
	call    address
	mov [rsp+8*1279], rax
	mov r10, qword [rsp+8*1280]
	mov r11, qword [rsp+8*1279]
	mov r10, [r11]
	mov qword [rsp+8*1280],r10
	mov qword [rsp+8*1279],r11
	mov     rsi, [rsp+8*1280]
	mov     rdi, [rsp+8*1277]
	call    concat
	mov [rsp+8*1281], rax
	mov r10, qword [rsp+8*1282]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1282],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 17
	mov     rdi, [rsp+8*1282]
	call    address
	mov [rsp+8*1283], rax
	mov r10, qword [rsp+8*1284]
	mov r11, qword [rsp+8*1283]
	mov r10, [r11]
	mov qword [rsp+8*1284],r10
	mov qword [rsp+8*1283],r11
	mov     rsi, [rsp+8*1284]
	mov     rdi, [rsp+8*1281]
	call    concat
	mov [rsp+8*1285], rax
	mov r10, qword [rsp+8*1286]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1286],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*1286]
	call    address
	mov [rsp+8*1287], rax
	mov r10, qword [rsp+8*1288]
	mov r11, qword [rsp+8*1287]
	mov r10, [r11]
	mov qword [rsp+8*1288],r10
	mov qword [rsp+8*1287],r11
	mov     rsi, [rsp+8*1288]
	mov     rdi, [rsp+8*1285]
	call    concat
	mov [rsp+8*1289], rax
	mov r10, qword [rsp+8*1290]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1290],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1290]
	call    address
	mov [rsp+8*1291], rax
	mov r10, qword [rsp+8*1292]
	mov r11, qword [rsp+8*1291]
	mov r10, [r11]
	mov qword [rsp+8*1292],r10
	mov qword [rsp+8*1291],r11
	mov     rsi, [rsp+8*1292]
	mov     rdi, [rsp+8*1289]
	call    concat
	mov [rsp+8*1293], rax
	mov r10, qword [rsp+8*1294]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1294],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1294]
	call    address
	mov [rsp+8*1295], rax
	mov r10, qword [rsp+8*1296]
	mov r11, qword [rsp+8*1295]
	mov r10, [r11]
	mov qword [rsp+8*1296],r10
	mov qword [rsp+8*1295],r11
	mov     rsi, [rsp+8*1296]
	mov     rdi, [rsp+8*1293]
	call    concat
	mov [rsp+8*1297], rax
	mov r10, qword [rsp+8*1298]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1298],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1298]
	call    address
	mov [rsp+8*1299], rax
	mov r10, qword [rsp+8*1300]
	mov r11, qword [rsp+8*1299]
	mov r10, [r11]
	mov qword [rsp+8*1300],r10
	mov qword [rsp+8*1299],r11
	mov     rsi, [rsp+8*1300]
	mov     rdi, [rsp+8*1297]
	call    concat
	mov [rsp+8*1301], rax
	mov r10, qword [rsp+8*1302]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1302],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*1302]
	call    address
	mov [rsp+8*1303], rax
	mov r10, qword [rsp+8*1304]
	mov r11, qword [rsp+8*1303]
	mov r10, [r11]
	mov qword [rsp+8*1304],r10
	mov qword [rsp+8*1303],r11
	mov     rsi, [rsp+8*1304]
	mov     rdi, [rsp+8*1301]
	call    concat
	mov [rsp+8*1305], rax
	mov r10, qword [rsp+8*1306]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1306],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1306]
	call    address
	mov [rsp+8*1307], rax
	mov r10, qword [rsp+8*1308]
	mov r11, qword [rsp+8*1307]
	mov r10, [r11]
	mov qword [rsp+8*1308],r10
	mov qword [rsp+8*1307],r11
	mov     rsi, [rsp+8*1308]
	mov     rdi, [rsp+8*1305]
	call    concat
	mov [rsp+8*1309], rax
	mov r10, qword [rsp+8*1310]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1310],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1310]
	call    address
	mov [rsp+8*1311], rax
	mov r10, qword [rsp+8*1312]
	mov r11, qword [rsp+8*1311]
	mov r10, [r11]
	mov qword [rsp+8*1312],r10
	mov qword [rsp+8*1311],r11
	mov     rsi, [rsp+8*1312]
	mov     rdi, [rsp+8*1309]
	call    concat
	mov [rsp+8*1313], rax
	mov r10, qword [rsp+8*1314]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1314],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*1314]
	call    address
	mov [rsp+8*1315], rax
	mov r10, qword [rsp+8*1316]
	mov r11, qword [rsp+8*1315]
	mov r10, [r11]
	mov qword [rsp+8*1316],r10
	mov qword [rsp+8*1315],r11
	mov     rsi, [rsp+8*1316]
	mov     rdi, [rsp+8*1313]
	call    concat
	mov [rsp+8*1317], rax
	mov r10, qword [rsp+8*1318]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1318],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 89
	mov     rdi, [rsp+8*1318]
	call    address
	mov [rsp+8*1319], rax
	mov r10, qword [rsp+8*1320]
	mov r11, qword [rsp+8*1319]
	mov r10, [r11]
	mov qword [rsp+8*1320],r10
	mov qword [rsp+8*1319],r11
	mov     rsi, [rsp+8*1320]
	mov     rdi, [rsp+8*1317]
	call    concat
	mov [rsp+8*1321], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*1321]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*1321],r11
	mov r10, qword [rsp+8*1322]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*1322],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*1322] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*1323]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1323],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1323]
	call    address
	mov [rsp+8*1324], rax
	mov r10, qword [rsp+8*1325]
	mov r11, qword [rsp+8*1324]
	mov r10, [r11]
	mov qword [rsp+8*1325],r10
	mov qword [rsp+8*1324],r11
	mov r10, qword [rsp+8*1326]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1326],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 68
	mov     rdi, [rsp+8*1326]
	call    address
	mov [rsp+8*1327], rax
	mov r10, qword [rsp+8*1328]
	mov r11, qword [rsp+8*1327]
	mov r10, [r11]
	mov qword [rsp+8*1328],r10
	mov qword [rsp+8*1327],r11
	mov     rsi, [rsp+8*1328]
	mov     rdi, [rsp+8*1325]
	call    concat
	mov [rsp+8*1329], rax
	mov r10, qword [rsp+8*1330]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1330],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*1330]
	call    address
	mov [rsp+8*1331], rax
	mov r10, qword [rsp+8*1332]
	mov r11, qword [rsp+8*1331]
	mov r10, [r11]
	mov qword [rsp+8*1332],r10
	mov qword [rsp+8*1331],r11
	mov     rsi, [rsp+8*1332]
	mov     rdi, [rsp+8*1329]
	call    concat
	mov [rsp+8*1333], rax
	mov r10, qword [rsp+8*1334]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1334],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1334]
	call    address
	mov [rsp+8*1335], rax
	mov r10, qword [rsp+8*1336]
	mov r11, qword [rsp+8*1335]
	mov r10, [r11]
	mov qword [rsp+8*1336],r10
	mov qword [rsp+8*1335],r11
	mov     rsi, [rsp+8*1336]
	mov     rdi, [rsp+8*1333]
	call    concat
	mov [rsp+8*1337], rax
	mov r10, qword [rsp+8*1338]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1338],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1338]
	call    address
	mov [rsp+8*1339], rax
	mov r10, qword [rsp+8*1340]
	mov r11, qword [rsp+8*1339]
	mov r10, [r11]
	mov qword [rsp+8*1340],r10
	mov qword [rsp+8*1339],r11
	mov     rsi, [rsp+8*1340]
	mov     rdi, [rsp+8*1337]
	call    concat
	mov [rsp+8*1341], rax
	mov r10, qword [rsp+8*1342]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1342],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 27
	mov     rdi, [rsp+8*1342]
	call    address
	mov [rsp+8*1343], rax
	mov r10, qword [rsp+8*1344]
	mov r11, qword [rsp+8*1343]
	mov r10, [r11]
	mov qword [rsp+8*1344],r10
	mov qword [rsp+8*1343],r11
	mov     rsi, [rsp+8*1344]
	mov     rdi, [rsp+8*1341]
	call    concat
	mov [rsp+8*1345], rax
	mov r10, qword [rsp+8*1346]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1346],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*1346]
	call    address
	mov [rsp+8*1347], rax
	mov r10, qword [rsp+8*1348]
	mov r11, qword [rsp+8*1347]
	mov r10, [r11]
	mov qword [rsp+8*1348],r10
	mov qword [rsp+8*1347],r11
	mov     rsi, [rsp+8*1348]
	mov     rdi, [rsp+8*1345]
	call    concat
	mov [rsp+8*1349], rax
	mov r10, qword [rsp+8*1350]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1350],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 24
	mov     rdi, [rsp+8*1350]
	call    address
	mov [rsp+8*1351], rax
	mov r10, qword [rsp+8*1352]
	mov r11, qword [rsp+8*1351]
	mov r10, [r11]
	mov qword [rsp+8*1352],r10
	mov qword [rsp+8*1351],r11
	mov     rsi, [rsp+8*1352]
	mov     rdi, [rsp+8*1349]
	call    concat
	mov [rsp+8*1353], rax
	mov r10, qword [rsp+8*1354]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1354],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*1354]
	call    address
	mov [rsp+8*1355], rax
	mov r10, qword [rsp+8*1356]
	mov r11, qword [rsp+8*1355]
	mov r10, [r11]
	mov qword [rsp+8*1356],r10
	mov qword [rsp+8*1355],r11
	mov     rsi, [rsp+8*1356]
	mov     rdi, [rsp+8*1353]
	call    concat
	mov [rsp+8*1357], rax
	mov r10, qword [rsp+8*1358]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1358],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1358]
	call    address
	mov [rsp+8*1359], rax
	mov r10, qword [rsp+8*1360]
	mov r11, qword [rsp+8*1359]
	mov r10, [r11]
	mov qword [rsp+8*1360],r10
	mov qword [rsp+8*1359],r11
	mov     rsi, [rsp+8*1360]
	mov     rdi, [rsp+8*1357]
	call    concat
	mov [rsp+8*1361], rax
	mov r10, qword [rsp+8*1362]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1362],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*1362]
	call    address
	mov [rsp+8*1363], rax
	mov r10, qword [rsp+8*1364]
	mov r11, qword [rsp+8*1363]
	mov r10, [r11]
	mov qword [rsp+8*1364],r10
	mov qword [rsp+8*1363],r11
	mov     rsi, [rsp+8*1364]
	mov     rdi, [rsp+8*1361]
	call    concat
	mov [rsp+8*1365], rax
	mov r10, qword [rsp+8*1366]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1366],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1366]
	call    address
	mov [rsp+8*1367], rax
	mov r10, qword [rsp+8*1368]
	mov r11, qword [rsp+8*1367]
	mov r10, [r11]
	mov qword [rsp+8*1368],r10
	mov qword [rsp+8*1367],r11
	mov     rsi, [rsp+8*1368]
	mov     rdi, [rsp+8*1365]
	call    concat
	mov [rsp+8*1369], rax
	mov r10, qword [rsp+8*1370]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1370],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 83
	mov     rdi, [rsp+8*1370]
	call    address
	mov [rsp+8*1371], rax
	mov r10, qword [rsp+8*1372]
	mov r11, qword [rsp+8*1371]
	mov r10, [r11]
	mov qword [rsp+8*1372],r10
	mov qword [rsp+8*1371],r11
	mov     rsi, [rsp+8*1372]
	mov     rdi, [rsp+8*1369]
	call    concat
	mov [rsp+8*1373], rax
	mov r10, qword [rsp+8*1374]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1374],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1374]
	call    address
	mov [rsp+8*1375], rax
	mov r10, qword [rsp+8*1376]
	mov r11, qword [rsp+8*1375]
	mov r10, [r11]
	mov qword [rsp+8*1376],r10
	mov qword [rsp+8*1375],r11
	mov     rsi, [rsp+8*1376]
	mov     rdi, [rsp+8*1373]
	call    concat
	mov [rsp+8*1377], rax
	mov r10, qword [rsp+8*1378]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1378],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1378]
	call    address
	mov [rsp+8*1379], rax
	mov r10, qword [rsp+8*1380]
	mov r11, qword [rsp+8*1379]
	mov r10, [r11]
	mov qword [rsp+8*1380],r10
	mov qword [rsp+8*1379],r11
	mov     rsi, [rsp+8*1380]
	mov     rdi, [rsp+8*1377]
	call    concat
	mov [rsp+8*1381], rax
	mov r10, qword [rsp+8*1382]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1382],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*1382]
	call    address
	mov [rsp+8*1383], rax
	mov r10, qword [rsp+8*1384]
	mov r11, qword [rsp+8*1383]
	mov r10, [r11]
	mov qword [rsp+8*1384],r10
	mov qword [rsp+8*1383],r11
	mov     rsi, [rsp+8*1384]
	mov     rdi, [rsp+8*1381]
	call    concat
	mov [rsp+8*1385], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1385]
	call    concat
	mov [rsp+8*1386], rax
	mov r10, qword [rsp+8*1387]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1387],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1387]
	call    address
	mov [rsp+8*1388], rax
	mov r10, qword [rsp+8*1389]
	mov r11, qword [rsp+8*1388]
	mov r10, [r11]
	mov qword [rsp+8*1389],r10
	mov qword [rsp+8*1388],r11
	mov     rsi, [rsp+8*1389]
	mov     rdi, [rsp+8*1386]
	call    concat
	mov [rsp+8*1390], rax
	mov r10, qword [rsp+8*1391]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1391],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 58
	mov     rdi, [rsp+8*1391]
	call    address
	mov [rsp+8*1392], rax
	mov r10, qword [rsp+8*1393]
	mov r11, qword [rsp+8*1392]
	mov r10, [r11]
	mov qword [rsp+8*1393],r10
	mov qword [rsp+8*1392],r11
	mov     rsi, [rsp+8*1393]
	mov     rdi, [rsp+8*1390]
	call    concat
	mov [rsp+8*1394], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1394]
	call    concat
	mov [rsp+8*1395], rax
	mov r10, qword [rsp+8*1396]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1396],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 10
	mov     rdi, [rsp+8*1396]
	call    address
	mov [rsp+8*1397], rax
	mov r10, qword [rsp+8*1398]
	mov r11, qword [rsp+8*1397]
	mov r10, [r11]
	mov qword [rsp+8*1398],r10
	mov qword [rsp+8*1397],r11
	mov     rsi, [rsp+8*1398]
	mov     rdi, [rsp+8*1395]
	call    concat
	mov [rsp+8*1399], rax
	mov r10, qword [rsp+8*1400]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1400],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 66
	mov     rdi, [rsp+8*1400]
	call    address
	mov [rsp+8*1401], rax
	mov r10, qword [rsp+8*1402]
	mov r11, qword [rsp+8*1401]
	mov r10, [r11]
	mov qword [rsp+8*1402],r10
	mov qword [rsp+8*1401],r11
	mov     rsi, [rsp+8*1402]
	mov     rdi, [rsp+8*1399]
	call    concat
	mov [rsp+8*1403], rax
	mov r10, qword [rsp+8*1404]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1404],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1404]
	call    address
	mov [rsp+8*1405], rax
	mov r10, qword [rsp+8*1406]
	mov r11, qword [rsp+8*1405]
	mov r10, [r11]
	mov qword [rsp+8*1406],r10
	mov qword [rsp+8*1405],r11
	mov     rsi, [rsp+8*1406]
	mov     rdi, [rsp+8*1403]
	call    concat
	mov [rsp+8*1407], rax
	mov r10, qword [rsp+8*1408]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1408],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*1408]
	call    address
	mov [rsp+8*1409], rax
	mov r10, qword [rsp+8*1410]
	mov r11, qword [rsp+8*1409]
	mov r10, [r11]
	mov qword [rsp+8*1410],r10
	mov qword [rsp+8*1409],r11
	mov     rsi, [rsp+8*1410]
	mov     rdi, [rsp+8*1407]
	call    concat
	mov [rsp+8*1411], rax
	mov r10, qword [rsp+8*1412]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1412],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1412]
	call    address
	mov [rsp+8*1413], rax
	mov r10, qword [rsp+8*1414]
	mov r11, qword [rsp+8*1413]
	mov r10, [r11]
	mov qword [rsp+8*1414],r10
	mov qword [rsp+8*1413],r11
	mov     rsi, [rsp+8*1414]
	mov     rdi, [rsp+8*1411]
	call    concat
	mov [rsp+8*1415], rax
	mov r10, qword [rsp+8*1416]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1416],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*1416]
	call    address
	mov [rsp+8*1417], rax
	mov r10, qword [rsp+8*1418]
	mov r11, qword [rsp+8*1417]
	mov r10, [r11]
	mov qword [rsp+8*1418],r10
	mov qword [rsp+8*1417],r11
	mov     rsi, [rsp+8*1418]
	mov     rdi, [rsp+8*1415]
	call    concat
	mov [rsp+8*1419], rax
	mov r10, qword [rsp+8*1420]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1420],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1420]
	call    address
	mov [rsp+8*1421], rax
	mov r10, qword [rsp+8*1422]
	mov r11, qword [rsp+8*1421]
	mov r10, [r11]
	mov qword [rsp+8*1422],r10
	mov qword [rsp+8*1421],r11
	mov     rsi, [rsp+8*1422]
	mov     rdi, [rsp+8*1419]
	call    concat
	mov [rsp+8*1423], rax
	mov r10, qword [rsp+8*1424]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1424],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1424]
	call    address
	mov [rsp+8*1425], rax
	mov r10, qword [rsp+8*1426]
	mov r11, qword [rsp+8*1425]
	mov r10, [r11]
	mov qword [rsp+8*1426],r10
	mov qword [rsp+8*1425],r11
	mov     rsi, [rsp+8*1426]
	mov     rdi, [rsp+8*1423]
	call    concat
	mov [rsp+8*1427], rax
	mov r10, qword [rsp+8*1428]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1428],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*1428]
	call    address
	mov [rsp+8*1429], rax
	mov r10, qword [rsp+8*1430]
	mov r11, qword [rsp+8*1429]
	mov r10, [r11]
	mov qword [rsp+8*1430],r10
	mov qword [rsp+8*1429],r11
	mov     rsi, [rsp+8*1430]
	mov     rdi, [rsp+8*1427]
	call    concat
	mov [rsp+8*1431], rax
	mov r10, qword [rsp+8*1432]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1432],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 10
	mov     rdi, [rsp+8*1432]
	call    address
	mov [rsp+8*1433], rax
	mov r10, qword [rsp+8*1434]
	mov r11, qword [rsp+8*1433]
	mov r10, [r11]
	mov qword [rsp+8*1434],r10
	mov qword [rsp+8*1433],r11
	mov     rsi, [rsp+8*1434]
	mov     rdi, [rsp+8*1431]
	call    concat
	mov [rsp+8*1435], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1435]
	call    concat
	mov [rsp+8*1436], rax
	mov r10, qword [rsp+8*1437]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1437],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 59
	mov     rdi, [rsp+8*1437]
	call    address
	mov [rsp+8*1438], rax
	mov r10, qword [rsp+8*1439]
	mov r11, qword [rsp+8*1438]
	mov r10, [r11]
	mov qword [rsp+8*1439],r10
	mov qword [rsp+8*1438],r11
	mov     rsi, [rsp+8*1439]
	mov     rdi, [rsp+8*1436]
	call    concat
	mov [rsp+8*1440], rax
	mov r10, qword [rsp+8*1441]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1441],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*1441]
	call    address
	mov [rsp+8*1442], rax
	mov r10, qword [rsp+8*1443]
	mov r11, qword [rsp+8*1442]
	mov r10, [r11]
	mov qword [rsp+8*1443],r10
	mov qword [rsp+8*1442],r11
	mov     rsi, [rsp+8*1443]
	mov     rdi, [rsp+8*1440]
	call    concat
	mov [rsp+8*1444], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1444]
	call    concat
	mov [rsp+8*1445], rax
	mov r10, qword [rsp+8*1446]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1446],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*1446]
	call    address
	mov [rsp+8*1447], rax
	mov r10, qword [rsp+8*1448]
	mov r11, qword [rsp+8*1447]
	mov r10, [r11]
	mov qword [rsp+8*1448],r10
	mov qword [rsp+8*1447],r11
	mov     rsi, [rsp+8*1448]
	mov     rdi, [rsp+8*1445]
	call    concat
	mov [rsp+8*1449], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*1449]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*1449],r11
	mov r10, qword [rsp+8*1450]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*1450],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*1450] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*1451]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1451],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1451]
	call    address
	mov [rsp+8*1452], rax
	mov r10, qword [rsp+8*1453]
	mov r11, qword [rsp+8*1452]
	mov r10, [r11]
	mov qword [rsp+8*1453],r10
	mov qword [rsp+8*1452],r11
	mov r10, qword [rsp+8*1454]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1454],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*1454]
	call    address
	mov [rsp+8*1455], rax
	mov r10, qword [rsp+8*1456]
	mov r11, qword [rsp+8*1455]
	mov r10, [r11]
	mov qword [rsp+8*1456],r10
	mov qword [rsp+8*1455],r11
	mov     rsi, [rsp+8*1456]
	mov     rdi, [rsp+8*1453]
	call    concat
	mov [rsp+8*1457], rax
	mov r10, qword [rsp+8*1458]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1458],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1458]
	call    address
	mov [rsp+8*1459], rax
	mov r10, qword [rsp+8*1460]
	mov r11, qword [rsp+8*1459]
	mov r10, [r11]
	mov qword [rsp+8*1460],r10
	mov qword [rsp+8*1459],r11
	mov     rsi, [rsp+8*1460]
	mov     rdi, [rsp+8*1457]
	call    concat
	mov [rsp+8*1461], rax
	mov r10, qword [rsp+8*1462]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1462],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 83
	mov     rdi, [rsp+8*1462]
	call    address
	mov [rsp+8*1463], rax
	mov r10, qword [rsp+8*1464]
	mov r11, qword [rsp+8*1463]
	mov r10, [r11]
	mov qword [rsp+8*1464],r10
	mov qword [rsp+8*1463],r11
	mov     rsi, [rsp+8*1464]
	mov     rdi, [rsp+8*1461]
	call    concat
	mov [rsp+8*1465], rax
	mov r10, qword [rsp+8*1466]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1466],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1466]
	call    address
	mov [rsp+8*1467], rax
	mov r10, qword [rsp+8*1468]
	mov r11, qword [rsp+8*1467]
	mov r10, [r11]
	mov qword [rsp+8*1468],r10
	mov qword [rsp+8*1467],r11
	mov     rsi, [rsp+8*1468]
	mov     rdi, [rsp+8*1465]
	call    concat
	mov [rsp+8*1469], rax
	mov r10, qword [rsp+8*1470]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1470],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1470]
	call    address
	mov [rsp+8*1471], rax
	mov r10, qword [rsp+8*1472]
	mov r11, qword [rsp+8*1471]
	mov r10, [r11]
	mov qword [rsp+8*1472],r10
	mov qword [rsp+8*1471],r11
	mov     rsi, [rsp+8*1472]
	mov     rdi, [rsp+8*1469]
	call    concat
	mov [rsp+8*1473], rax
	mov r10, qword [rsp+8*1474]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1474],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*1474]
	call    address
	mov [rsp+8*1475], rax
	mov r10, qword [rsp+8*1476]
	mov r11, qword [rsp+8*1475]
	mov r10, [r11]
	mov qword [rsp+8*1476],r10
	mov qword [rsp+8*1475],r11
	mov     rsi, [rsp+8*1476]
	mov     rdi, [rsp+8*1473]
	call    concat
	mov [rsp+8*1477], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1477]
	call    concat
	mov [rsp+8*1478], rax
	mov r10, qword [rsp+8*1479]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1479],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1479]
	call    address
	mov [rsp+8*1480], rax
	mov r10, qword [rsp+8*1481]
	mov r11, qword [rsp+8*1480]
	mov r10, [r11]
	mov qword [rsp+8*1481],r10
	mov qword [rsp+8*1480],r11
	mov     rsi, [rsp+8*1481]
	mov     rdi, [rsp+8*1478]
	call    concat
	mov [rsp+8*1482], rax
	mov r10, qword [rsp+8*1483]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1483],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 58
	mov     rdi, [rsp+8*1483]
	call    address
	mov [rsp+8*1484], rax
	mov r10, qword [rsp+8*1485]
	mov r11, qword [rsp+8*1484]
	mov r10, [r11]
	mov qword [rsp+8*1485],r10
	mov qword [rsp+8*1484],r11
	mov     rsi, [rsp+8*1485]
	mov     rdi, [rsp+8*1482]
	call    concat
	mov [rsp+8*1486], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1486]
	call    concat
	mov [rsp+8*1487], rax
	mov r10, qword [rsp+8*1488]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1488],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 10
	mov     rdi, [rsp+8*1488]
	call    address
	mov [rsp+8*1489], rax
	mov r10, qword [rsp+8*1490]
	mov r11, qword [rsp+8*1489]
	mov r10, [r11]
	mov qword [rsp+8*1490],r10
	mov qword [rsp+8*1489],r11
	mov     rsi, [rsp+8*1490]
	mov     rdi, [rsp+8*1487]
	call    concat
	mov [rsp+8*1491], rax
	mov r10, qword [rsp+8*1492]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1492],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 66
	mov     rdi, [rsp+8*1492]
	call    address
	mov [rsp+8*1493], rax
	mov r10, qword [rsp+8*1494]
	mov r11, qword [rsp+8*1493]
	mov r10, [r11]
	mov qword [rsp+8*1494],r10
	mov qword [rsp+8*1493],r11
	mov     rsi, [rsp+8*1494]
	mov     rdi, [rsp+8*1491]
	call    concat
	mov [rsp+8*1495], rax
	mov r10, qword [rsp+8*1496]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1496],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1496]
	call    address
	mov [rsp+8*1497], rax
	mov r10, qword [rsp+8*1498]
	mov r11, qword [rsp+8*1497]
	mov r10, [r11]
	mov qword [rsp+8*1498],r10
	mov qword [rsp+8*1497],r11
	mov     rsi, [rsp+8*1498]
	mov     rdi, [rsp+8*1495]
	call    concat
	mov [rsp+8*1499], rax
	mov r10, qword [rsp+8*1500]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1500],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*1500]
	call    address
	mov [rsp+8*1501], rax
	mov r10, qword [rsp+8*1502]
	mov r11, qword [rsp+8*1501]
	mov r10, [r11]
	mov qword [rsp+8*1502],r10
	mov qword [rsp+8*1501],r11
	mov     rsi, [rsp+8*1502]
	mov     rdi, [rsp+8*1499]
	call    concat
	mov [rsp+8*1503], rax
	mov r10, qword [rsp+8*1504]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1504],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1504]
	call    address
	mov [rsp+8*1505], rax
	mov r10, qword [rsp+8*1506]
	mov r11, qword [rsp+8*1505]
	mov r10, [r11]
	mov qword [rsp+8*1506],r10
	mov qword [rsp+8*1505],r11
	mov     rsi, [rsp+8*1506]
	mov     rdi, [rsp+8*1503]
	call    concat
	mov [rsp+8*1507], rax
	mov r10, qword [rsp+8*1508]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1508],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*1508]
	call    address
	mov [rsp+8*1509], rax
	mov r10, qword [rsp+8*1510]
	mov r11, qword [rsp+8*1509]
	mov r10, [r11]
	mov qword [rsp+8*1510],r10
	mov qword [rsp+8*1509],r11
	mov     rsi, [rsp+8*1510]
	mov     rdi, [rsp+8*1507]
	call    concat
	mov [rsp+8*1511], rax
	mov r10, qword [rsp+8*1512]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1512],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1512]
	call    address
	mov [rsp+8*1513], rax
	mov r10, qword [rsp+8*1514]
	mov r11, qword [rsp+8*1513]
	mov r10, [r11]
	mov qword [rsp+8*1514],r10
	mov qword [rsp+8*1513],r11
	mov     rsi, [rsp+8*1514]
	mov     rdi, [rsp+8*1511]
	call    concat
	mov [rsp+8*1515], rax
	mov r10, qword [rsp+8*1516]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1516],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1516]
	call    address
	mov [rsp+8*1517], rax
	mov r10, qword [rsp+8*1518]
	mov r11, qword [rsp+8*1517]
	mov r10, [r11]
	mov qword [rsp+8*1518],r10
	mov qword [rsp+8*1517],r11
	mov     rsi, [rsp+8*1518]
	mov     rdi, [rsp+8*1515]
	call    concat
	mov [rsp+8*1519], rax
	mov r10, qword [rsp+8*1520]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1520],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 14
	mov     rdi, [rsp+8*1520]
	call    address
	mov [rsp+8*1521], rax
	mov r10, qword [rsp+8*1522]
	mov r11, qword [rsp+8*1521]
	mov r10, [r11]
	mov qword [rsp+8*1522],r10
	mov qword [rsp+8*1521],r11
	mov     rsi, [rsp+8*1522]
	mov     rdi, [rsp+8*1519]
	call    concat
	mov [rsp+8*1523], rax
	mov r10, qword [rsp+8*1524]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1524],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 16
	mov     rdi, [rsp+8*1524]
	call    address
	mov [rsp+8*1525], rax
	mov r10, qword [rsp+8*1526]
	mov r11, qword [rsp+8*1525]
	mov r10, [r11]
	mov qword [rsp+8*1526],r10
	mov qword [rsp+8*1525],r11
	mov     rsi, [rsp+8*1526]
	mov     rdi, [rsp+8*1523]
	call    concat
	mov [rsp+8*1527], rax
	mov r10, qword [rsp+8*1528]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1528],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 15
	mov     rdi, [rsp+8*1528]
	call    address
	mov [rsp+8*1529], rax
	mov r10, qword [rsp+8*1530]
	mov r11, qword [rsp+8*1529]
	mov r10, [r11]
	mov qword [rsp+8*1530],r10
	mov qword [rsp+8*1529],r11
	mov     rsi, [rsp+8*1530]
	mov     rdi, [rsp+8*1527]
	call    concat
	mov [rsp+8*1531], rax
	mov r10, qword [rsp+8*1532]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1532],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*1532]
	call    address
	mov [rsp+8*1533], rax
	mov r10, qword [rsp+8*1534]
	mov r11, qword [rsp+8*1533]
	mov r10, [r11]
	mov qword [rsp+8*1534],r10
	mov qword [rsp+8*1533],r11
	mov     rsi, [rsp+8*1534]
	mov     rdi, [rsp+8*1531]
	call    concat
	mov [rsp+8*1535], rax
	mov r10, qword [rsp+8*1536]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1536],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 10
	mov     rdi, [rsp+8*1536]
	call    address
	mov [rsp+8*1537], rax
	mov r10, qword [rsp+8*1538]
	mov r11, qword [rsp+8*1537]
	mov r10, [r11]
	mov qword [rsp+8*1538],r10
	mov qword [rsp+8*1537],r11
	mov     rsi, [rsp+8*1538]
	mov     rdi, [rsp+8*1535]
	call    concat
	mov [rsp+8*1539], rax
	mov r10, qword [rsp+8*1540]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1540],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 66
	mov     rdi, [rsp+8*1540]
	call    address
	mov [rsp+8*1541], rax
	mov r10, qword [rsp+8*1542]
	mov r11, qword [rsp+8*1541]
	mov r10, [r11]
	mov qword [rsp+8*1542],r10
	mov qword [rsp+8*1541],r11
	mov     rsi, [rsp+8*1542]
	mov     rdi, [rsp+8*1539]
	call    concat
	mov [rsp+8*1543], rax
	mov r10, qword [rsp+8*1544]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1544],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1544]
	call    address
	mov [rsp+8*1545], rax
	mov r10, qword [rsp+8*1546]
	mov r11, qword [rsp+8*1545]
	mov r10, [r11]
	mov qword [rsp+8*1546],r10
	mov qword [rsp+8*1545],r11
	mov     rsi, [rsp+8*1546]
	mov     rdi, [rsp+8*1543]
	call    concat
	mov [rsp+8*1547], rax
	mov r10, qword [rsp+8*1548]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1548],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*1548]
	call    address
	mov [rsp+8*1549], rax
	mov r10, qword [rsp+8*1550]
	mov r11, qword [rsp+8*1549]
	mov r10, [r11]
	mov qword [rsp+8*1550],r10
	mov qword [rsp+8*1549],r11
	mov     rsi, [rsp+8*1550]
	mov     rdi, [rsp+8*1547]
	call    concat
	mov [rsp+8*1551], rax
	mov r10, qword [rsp+8*1552]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1552],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1552]
	call    address
	mov [rsp+8*1553], rax
	mov r10, qword [rsp+8*1554]
	mov r11, qword [rsp+8*1553]
	mov r10, [r11]
	mov qword [rsp+8*1554],r10
	mov qword [rsp+8*1553],r11
	mov     rsi, [rsp+8*1554]
	mov     rdi, [rsp+8*1551]
	call    concat
	mov [rsp+8*1555], rax
	mov r10, qword [rsp+8*1556]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1556],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*1556]
	call    address
	mov [rsp+8*1557], rax
	mov r10, qword [rsp+8*1558]
	mov r11, qword [rsp+8*1557]
	mov r10, [r11]
	mov qword [rsp+8*1558],r10
	mov qword [rsp+8*1557],r11
	mov     rsi, [rsp+8*1558]
	mov     rdi, [rsp+8*1555]
	call    concat
	mov [rsp+8*1559], rax
	mov r10, qword [rsp+8*1560]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1560],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1560]
	call    address
	mov [rsp+8*1561], rax
	mov r10, qword [rsp+8*1562]
	mov r11, qword [rsp+8*1561]
	mov r10, [r11]
	mov qword [rsp+8*1562],r10
	mov qword [rsp+8*1561],r11
	mov     rsi, [rsp+8*1562]
	mov     rdi, [rsp+8*1559]
	call    concat
	mov [rsp+8*1563], rax
	mov r10, qword [rsp+8*1564]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1564],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1564]
	call    address
	mov [rsp+8*1565], rax
	mov r10, qword [rsp+8*1566]
	mov r11, qword [rsp+8*1565]
	mov r10, [r11]
	mov qword [rsp+8*1566],r10
	mov qword [rsp+8*1565],r11
	mov     rsi, [rsp+8*1566]
	mov     rdi, [rsp+8*1563]
	call    concat
	mov [rsp+8*1567], rax
	mov r10, qword [rsp+8*1568]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1568],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 4
	mov     rdi, [rsp+8*1568]
	call    address
	mov [rsp+8*1569], rax
	mov r10, qword [rsp+8*1570]
	mov r11, qword [rsp+8*1569]
	mov r10, [r11]
	mov qword [rsp+8*1570],r10
	mov qword [rsp+8*1569],r11
	mov     rsi, [rsp+8*1570]
	mov     rdi, [rsp+8*1567]
	call    concat
	mov [rsp+8*1571], rax
	mov r10, qword [rsp+8*1572]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1572],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 16
	mov     rdi, [rsp+8*1572]
	call    address
	mov [rsp+8*1573], rax
	mov r10, qword [rsp+8*1574]
	mov r11, qword [rsp+8*1573]
	mov r10, [r11]
	mov qword [rsp+8*1574],r10
	mov qword [rsp+8*1573],r11
	mov     rsi, [rsp+8*1574]
	mov     rdi, [rsp+8*1571]
	call    concat
	mov [rsp+8*1575], rax
	mov r10, qword [rsp+8*1576]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1576],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 15
	mov     rdi, [rsp+8*1576]
	call    address
	mov [rsp+8*1577], rax
	mov r10, qword [rsp+8*1578]
	mov r11, qword [rsp+8*1577]
	mov r10, [r11]
	mov qword [rsp+8*1578],r10
	mov qword [rsp+8*1577],r11
	mov     rsi, [rsp+8*1578]
	mov     rdi, [rsp+8*1575]
	call    concat
	mov [rsp+8*1579], rax
	mov r10, qword [rsp+8*1580]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1580],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*1580]
	call    address
	mov [rsp+8*1581], rax
	mov r10, qword [rsp+8*1582]
	mov r11, qword [rsp+8*1581]
	mov r10, [r11]
	mov qword [rsp+8*1582],r10
	mov qword [rsp+8*1581],r11
	mov     rsi, [rsp+8*1582]
	mov     rdi, [rsp+8*1579]
	call    concat
	mov [rsp+8*1583], rax
	mov r10, qword [rsp+8*1584]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1584],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 10
	mov     rdi, [rsp+8*1584]
	call    address
	mov [rsp+8*1585], rax
	mov r10, qword [rsp+8*1586]
	mov r11, qword [rsp+8*1585]
	mov r10, [r11]
	mov qword [rsp+8*1586],r10
	mov qword [rsp+8*1585],r11
	mov     rsi, [rsp+8*1586]
	mov     rdi, [rsp+8*1583]
	call    concat
	mov [rsp+8*1587], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1587]
	call    concat
	mov [rsp+8*1588], rax
	mov r10, qword [rsp+8*1589]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1589],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 59
	mov     rdi, [rsp+8*1589]
	call    address
	mov [rsp+8*1590], rax
	mov r10, qword [rsp+8*1591]
	mov r11, qword [rsp+8*1590]
	mov r10, [r11]
	mov qword [rsp+8*1591],r10
	mov qword [rsp+8*1590],r11
	mov     rsi, [rsp+8*1591]
	mov     rdi, [rsp+8*1588]
	call    concat
	mov [rsp+8*1592], rax
	mov r10, qword [rsp+8*1593]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1593],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*1593]
	call    address
	mov [rsp+8*1594], rax
	mov r10, qword [rsp+8*1595]
	mov r11, qword [rsp+8*1594]
	mov r10, [r11]
	mov qword [rsp+8*1595],r10
	mov qword [rsp+8*1594],r11
	mov     rsi, [rsp+8*1595]
	mov     rdi, [rsp+8*1592]
	call    concat
	mov [rsp+8*1596], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1596]
	call    concat
	mov [rsp+8*1597], rax
	mov r10, qword [rsp+8*1598]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1598],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*1598]
	call    address
	mov [rsp+8*1599], rax
	mov r10, qword [rsp+8*1600]
	mov r11, qword [rsp+8*1599]
	mov r10, [r11]
	mov qword [rsp+8*1600],r10
	mov qword [rsp+8*1599],r11
	mov     rsi, [rsp+8*1600]
	mov     rdi, [rsp+8*1597]
	call    concat
	mov [rsp+8*1601], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*1601]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*1601],r11
	mov r10, qword [rsp+8*1602]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*1602],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*1602] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*1603]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1603],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 91
	mov     rdi, [rsp+8*1603]
	call    address
	mov [rsp+8*1604], rax
	mov r10, qword [rsp+8*1605]
	mov r11, qword [rsp+8*1604]
	mov r10, [r11]
	mov qword [rsp+8*1605],r10
	mov qword [rsp+8*1604],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*1605]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*1605],r11
	mov r10, qword [rsp+8*1606]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*1606],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*1606] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*1607]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1607],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1607]
	call    address
	mov [rsp+8*1608], rax
	mov r10, qword [rsp+8*1609]
	mov r11, qword [rsp+8*1608]
	mov r10, [r11]
	mov qword [rsp+8*1609],r10
	mov qword [rsp+8*1608],r11
	mov r10, qword [rsp+8*1610]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1610],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1610]
	call    address
	mov [rsp+8*1611], rax
	mov r10, qword [rsp+8*1612]
	mov r11, qword [rsp+8*1611]
	mov r10, [r11]
	mov qword [rsp+8*1612],r10
	mov qword [rsp+8*1611],r11
	mov     rsi, [rsp+8*1612]
	mov     rdi, [rsp+8*1609]
	call    concat
	mov [rsp+8*1613], rax
	mov r10, qword [rsp+8*1614]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1614],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1614]
	call    address
	mov [rsp+8*1615], rax
	mov r10, qword [rsp+8*1616]
	mov r11, qword [rsp+8*1615]
	mov r10, [r11]
	mov qword [rsp+8*1616],r10
	mov qword [rsp+8*1615],r11
	mov     rsi, [rsp+8*1616]
	mov     rdi, [rsp+8*1613]
	call    concat
	mov [rsp+8*1617], rax
	mov r10, qword [rsp+8*1618]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1618],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1618]
	call    address
	mov [rsp+8*1619], rax
	mov r10, qword [rsp+8*1620]
	mov r11, qword [rsp+8*1619]
	mov r10, [r11]
	mov qword [rsp+8*1620],r10
	mov qword [rsp+8*1619],r11
	mov     rsi, [rsp+8*1620]
	mov     rdi, [rsp+8*1617]
	call    concat
	mov [rsp+8*1621], rax
	mov r10, qword [rsp+8*1622]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1622],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1622]
	call    address
	mov [rsp+8*1623], rax
	mov r10, qword [rsp+8*1624]
	mov r11, qword [rsp+8*1623]
	mov r10, [r11]
	mov qword [rsp+8*1624],r10
	mov qword [rsp+8*1623],r11
	mov     rsi, [rsp+8*1624]
	mov     rdi, [rsp+8*1621]
	call    concat
	mov [rsp+8*1625], rax
	mov r10, qword [rsp+8*1626]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1626],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*1626]
	call    address
	mov [rsp+8*1627], rax
	mov r10, qword [rsp+8*1628]
	mov r11, qword [rsp+8*1627]
	mov r10, [r11]
	mov qword [rsp+8*1628],r10
	mov qword [rsp+8*1627],r11
	mov     rsi, [rsp+8*1628]
	mov     rdi, [rsp+8*1625]
	call    concat
	mov [rsp+8*1629], rax
	mov r10, qword [rsp+8*1630]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1630],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*1630]
	call    address
	mov [rsp+8*1631], rax
	mov r10, qword [rsp+8*1632]
	mov r11, qword [rsp+8*1631]
	mov r10, [r11]
	mov qword [rsp+8*1632],r10
	mov qword [rsp+8*1631],r11
	mov     rsi, [rsp+8*1632]
	mov     rdi, [rsp+8*1629]
	call    concat
	mov [rsp+8*1633], rax
	mov r10, qword [rsp+8*1634]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1634],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*1634]
	call    address
	mov [rsp+8*1635], rax
	mov r10, qword [rsp+8*1636]
	mov r11, qword [rsp+8*1635]
	mov r10, [r11]
	mov qword [rsp+8*1636],r10
	mov qword [rsp+8*1635],r11
	mov     rsi, [rsp+8*1636]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1637], rax
	mov r10, qword [rsp+8*1638]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1638],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 17
	mov     rdi, [rsp+8*1638]
	call    address
	mov [rsp+8*1639], rax
	mov r10, qword [rsp+8*1640]
	mov r11, qword [rsp+8*1639]
	mov r10, [r11]
	mov qword [rsp+8*1640],r10
	mov qword [rsp+8*1639],r11
	mov     rsi, [rsp+8*1640]
	mov     rdi, [rsp+8*1637]
	call    concat
	mov [rsp+8*1641], rax
	mov r10, qword [rsp+8*1642]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1642],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*1642]
	call    address
	mov [rsp+8*1643], rax
	mov r10, qword [rsp+8*1644]
	mov r11, qword [rsp+8*1643]
	mov r10, [r11]
	mov qword [rsp+8*1644],r10
	mov qword [rsp+8*1643],r11
	mov     rsi, [rsp+8*1644]
	mov     rdi, [rsp+8*1641]
	call    concat
	mov [rsp+8*1645], rax
	mov r10, qword [rsp+8*1646]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1646],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1646]
	call    address
	mov [rsp+8*1647], rax
	mov r10, qword [rsp+8*1648]
	mov r11, qword [rsp+8*1647]
	mov r10, [r11]
	mov qword [rsp+8*1648],r10
	mov qword [rsp+8*1647],r11
	mov     rsi, [rsp+8*1648]
	mov     rdi, [rsp+8*1645]
	call    concat
	mov [rsp+8*1649], rax
	mov r10, qword [rsp+8*1650]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1650],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1650]
	call    address
	mov [rsp+8*1651], rax
	mov r10, qword [rsp+8*1652]
	mov r11, qword [rsp+8*1651]
	mov r10, [r11]
	mov qword [rsp+8*1652],r10
	mov qword [rsp+8*1651],r11
	mov     rsi, [rsp+8*1652]
	mov     rdi, [rsp+8*1649]
	call    concat
	mov [rsp+8*1653], rax
	mov r10, qword [rsp+8*1654]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1654],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1654]
	call    address
	mov [rsp+8*1655], rax
	mov r10, qword [rsp+8*1656]
	mov r11, qword [rsp+8*1655]
	mov r10, [r11]
	mov qword [rsp+8*1656],r10
	mov qword [rsp+8*1655],r11
	mov     rsi, [rsp+8*1656]
	mov     rdi, [rsp+8*1653]
	call    concat
	mov [rsp+8*1657], rax
	mov r10, qword [rsp+8*1658]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1658],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*1658]
	call    address
	mov [rsp+8*1659], rax
	mov r10, qword [rsp+8*1660]
	mov r11, qword [rsp+8*1659]
	mov r10, [r11]
	mov qword [rsp+8*1660],r10
	mov qword [rsp+8*1659],r11
	mov     rsi, [rsp+8*1660]
	mov     rdi, [rsp+8*1657]
	call    concat
	mov [rsp+8*1661], rax
	mov r10, qword [rsp+8*1662]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1662],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*1662]
	call    address
	mov [rsp+8*1663], rax
	mov r10, qword [rsp+8*1664]
	mov r11, qword [rsp+8*1663]
	mov r10, [r11]
	mov qword [rsp+8*1664],r10
	mov qword [rsp+8*1663],r11
	mov     rsi, [rsp+8*1664]
	mov     rdi, [rsp+8*1661]
	call    concat
	mov [rsp+8*1665], rax
	mov r10, qword [rsp+8*1666]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1666],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*1666]
	call    address
	mov [rsp+8*1667], rax
	mov r10, qword [rsp+8*1668]
	mov r11, qword [rsp+8*1667]
	mov r10, [r11]
	mov qword [rsp+8*1668],r10
	mov qword [rsp+8*1667],r11
	mov     rsi, [rsp+8*1668]
	mov     rdi, [rsp+8*1665]
	call    concat
	mov [rsp+8*1669], rax
	mov r10, qword [rsp+8*1670]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1670],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*1670]
	call    address
	mov [rsp+8*1671], rax
	mov r10, qword [rsp+8*1672]
	mov r11, qword [rsp+8*1671]
	mov r10, [r11]
	mov qword [rsp+8*1672],r10
	mov qword [rsp+8*1671],r11
	mov     rsi, [rsp+8*1672]
	mov     rdi, [rsp+8*1669]
	call    concat
	mov [rsp+8*1673], rax
	mov r10, qword [rsp+8*1674]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1674],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 89
	mov     rdi, [rsp+8*1674]
	call    address
	mov [rsp+8*1675], rax
	mov r10, qword [rsp+8*1676]
	mov r11, qword [rsp+8*1675]
	mov r10, [r11]
	mov qword [rsp+8*1676],r10
	mov qword [rsp+8*1675],r11
	mov     rsi, [rsp+8*1676]
	mov     rdi, [rsp+8*1673]
	call    concat
	mov [rsp+8*1677], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*1677]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*1677],r11
	mov r10, qword [rsp+8*1678]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*1678],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*1678] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*1679]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1679],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1679]
	call    address
	mov [rsp+8*1680], rax
	mov r10, qword [rsp+8*1681]
	mov r11, qword [rsp+8*1680]
	mov r10, [r11]
	mov qword [rsp+8*1681],r10
	mov qword [rsp+8*1680],r11
	mov r10, qword [rsp+8*1682]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1682],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 68
	mov     rdi, [rsp+8*1682]
	call    address
	mov [rsp+8*1683], rax
	mov r10, qword [rsp+8*1684]
	mov r11, qword [rsp+8*1683]
	mov r10, [r11]
	mov qword [rsp+8*1684],r10
	mov qword [rsp+8*1683],r11
	mov     rsi, [rsp+8*1684]
	mov     rdi, [rsp+8*1681]
	call    concat
	mov [rsp+8*1685], rax
	mov r10, qword [rsp+8*1686]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1686],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*1686]
	call    address
	mov [rsp+8*1687], rax
	mov r10, qword [rsp+8*1688]
	mov r11, qword [rsp+8*1687]
	mov r10, [r11]
	mov qword [rsp+8*1688],r10
	mov qword [rsp+8*1687],r11
	mov     rsi, [rsp+8*1688]
	mov     rdi, [rsp+8*1685]
	call    concat
	mov [rsp+8*1689], rax
	mov r10, qword [rsp+8*1690]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1690],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*1690]
	call    address
	mov [rsp+8*1691], rax
	mov r10, qword [rsp+8*1692]
	mov r11, qword [rsp+8*1691]
	mov r10, [r11]
	mov qword [rsp+8*1692],r10
	mov qword [rsp+8*1691],r11
	mov     rsi, [rsp+8*1692]
	mov     rdi, [rsp+8*1689]
	call    concat
	mov [rsp+8*1693], rax
	mov r10, qword [rsp+8*1694]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1694],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*1694]
	call    address
	mov [rsp+8*1695], rax
	mov r10, qword [rsp+8*1696]
	mov r11, qword [rsp+8*1695]
	mov r10, [r11]
	mov qword [rsp+8*1696],r10
	mov qword [rsp+8*1695],r11
	mov     rsi, [rsp+8*1696]
	mov     rdi, [rsp+8*1693]
	call    concat
	mov [rsp+8*1697], rax
	mov r10, qword [rsp+8*1698]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1698],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 27
	mov     rdi, [rsp+8*1698]
	call    address
	mov [rsp+8*1699], rax
	mov r10, qword [rsp+8*1700]
	mov r11, qword [rsp+8*1699]
	mov r10, [r11]
	mov qword [rsp+8*1700],r10
	mov qword [rsp+8*1699],r11
	mov     rsi, [rsp+8*1700]
	mov     rdi, [rsp+8*1697]
	call    concat
	mov [rsp+8*1701], rax
	mov r10, qword [rsp+8*1702]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1702],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*1702]
	call    address
	mov [rsp+8*1703], rax
	mov r10, qword [rsp+8*1704]
	mov r11, qword [rsp+8*1703]
	mov r10, [r11]
	mov qword [rsp+8*1704],r10
	mov qword [rsp+8*1703],r11
	mov     rsi, [rsp+8*1704]
	mov     rdi, [rsp+8*1701]
	call    concat
	mov [rsp+8*1705], rax
	mov r10, qword [rsp+8*1706]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1706],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 24
	mov     rdi, [rsp+8*1706]
	call    address
	mov [rsp+8*1707], rax
	mov r10, qword [rsp+8*1708]
	mov r11, qword [rsp+8*1707]
	mov r10, [r11]
	mov qword [rsp+8*1708],r10
	mov qword [rsp+8*1707],r11
	mov     rsi, [rsp+8*1708]
	mov     rdi, [rsp+8*1705]
	call    concat
	mov [rsp+8*1709], rax
	mov r10, qword [rsp+8*1710]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1710],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*1710]
	call    address
	mov [rsp+8*1711], rax
	mov r10, qword [rsp+8*1712]
	mov r11, qword [rsp+8*1711]
	mov r10, [r11]
	mov qword [rsp+8*1712],r10
	mov qword [rsp+8*1711],r11
	mov     rsi, [rsp+8*1712]
	mov     rdi, [rsp+8*1709]
	call    concat
	mov [rsp+8*1713], rax
	mov r10, qword [rsp+8*1714]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1714],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1714]
	call    address
	mov [rsp+8*1715], rax
	mov r10, qword [rsp+8*1716]
	mov r11, qword [rsp+8*1715]
	mov r10, [r11]
	mov qword [rsp+8*1716],r10
	mov qword [rsp+8*1715],r11
	mov     rsi, [rsp+8*1716]
	mov     rdi, [rsp+8*1713]
	call    concat
	mov [rsp+8*1717], rax
	mov r10, qword [rsp+8*1718]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1718],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*1718]
	call    address
	mov [rsp+8*1719], rax
	mov r10, qword [rsp+8*1720]
	mov r11, qword [rsp+8*1719]
	mov r10, [r11]
	mov qword [rsp+8*1720],r10
	mov qword [rsp+8*1719],r11
	mov     rsi, [rsp+8*1720]
	mov     rdi, [rsp+8*1717]
	call    concat
	mov [rsp+8*1721], rax
	mov r10, qword [rsp+8*1722]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1722],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1722]
	call    address
	mov [rsp+8*1723], rax
	mov r10, qword [rsp+8*1724]
	mov r11, qword [rsp+8*1723]
	mov r10, [r11]
	mov qword [rsp+8*1724],r10
	mov qword [rsp+8*1723],r11
	mov     rsi, [rsp+8*1724]
	mov     rdi, [rsp+8*1721]
	call    concat
	mov [rsp+8*1725], rax
	mov r10, qword [rsp+8*1726]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1726],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 83
	mov     rdi, [rsp+8*1726]
	call    address
	mov [rsp+8*1727], rax
	mov r10, qword [rsp+8*1728]
	mov r11, qword [rsp+8*1727]
	mov r10, [r11]
	mov qword [rsp+8*1728],r10
	mov qword [rsp+8*1727],r11
	mov     rsi, [rsp+8*1728]
	mov     rdi, [rsp+8*1725]
	call    concat
	mov [rsp+8*1729], rax
	mov r10, qword [rsp+8*1730]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1730],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1730]
	call    address
	mov [rsp+8*1731], rax
	mov r10, qword [rsp+8*1732]
	mov r11, qword [rsp+8*1731]
	mov r10, [r11]
	mov qword [rsp+8*1732],r10
	mov qword [rsp+8*1731],r11
	mov     rsi, [rsp+8*1732]
	mov     rdi, [rsp+8*1729]
	call    concat
	mov [rsp+8*1733], rax
	mov r10, qword [rsp+8*1734]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1734],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1734]
	call    address
	mov [rsp+8*1735], rax
	mov r10, qword [rsp+8*1736]
	mov r11, qword [rsp+8*1735]
	mov r10, [r11]
	mov qword [rsp+8*1736],r10
	mov qword [rsp+8*1735],r11
	mov     rsi, [rsp+8*1736]
	mov     rdi, [rsp+8*1733]
	call    concat
	mov [rsp+8*1737], rax
	mov r10, qword [rsp+8*1738]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1738],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*1738]
	call    address
	mov [rsp+8*1739], rax
	mov r10, qword [rsp+8*1740]
	mov r11, qword [rsp+8*1739]
	mov r10, [r11]
	mov qword [rsp+8*1740],r10
	mov qword [rsp+8*1739],r11
	mov     rsi, [rsp+8*1740]
	mov     rdi, [rsp+8*1737]
	call    concat
	mov [rsp+8*1741], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1741]
	call    concat
	mov [rsp+8*1742], rax
	mov r10, qword [rsp+8*1743]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1743],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*1743]
	call    address
	mov [rsp+8*1744], rax
	mov r10, qword [rsp+8*1745]
	mov r11, qword [rsp+8*1744]
	mov r10, [r11]
	mov qword [rsp+8*1745],r10
	mov qword [rsp+8*1744],r11
	mov     rsi, [rsp+8*1745]
	mov     rdi, [rsp+8*1742]
	call    concat
	mov [rsp+8*1746], rax
	mov r10, qword [rsp+8*1747]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1747],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 58
	mov     rdi, [rsp+8*1747]
	call    address
	mov [rsp+8*1748], rax
	mov r10, qword [rsp+8*1749]
	mov r11, qword [rsp+8*1748]
	mov r10, [r11]
	mov qword [rsp+8*1749],r10
	mov qword [rsp+8*1748],r11
	mov     rsi, [rsp+8*1749]
	mov     rdi, [rsp+8*1746]
	call    concat
	mov [rsp+8*1750], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1750]
	call    concat
	mov [rsp+8*1751], rax
	mov r10, qword [rsp+8*1752]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1752],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 10
	mov     rdi, [rsp+8*1752]
	call    address
	mov [rsp+8*1753], rax
	mov r10, qword [rsp+8*1754]
	mov r11, qword [rsp+8*1753]
	mov r10, [r11]
	mov qword [rsp+8*1754],r10
	mov qword [rsp+8*1753],r11
	mov     rsi, [rsp+8*1754]
	mov     rdi, [rsp+8*1751]
	call    concat
	mov [rsp+8*1755], rax
	mov r10, qword [rsp+8*1756]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1756],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 66
	mov     rdi, [rsp+8*1756]
	call    address
	mov [rsp+8*1757], rax
	mov r10, qword [rsp+8*1758]
	mov r11, qword [rsp+8*1757]
	mov r10, [r11]
	mov qword [rsp+8*1758],r10
	mov qword [rsp+8*1757],r11
	mov     rsi, [rsp+8*1758]
	mov     rdi, [rsp+8*1755]
	call    concat
	mov [rsp+8*1759], rax
	mov r10, qword [rsp+8*1760]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1760],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1760]
	call    address
	mov [rsp+8*1761], rax
	mov r10, qword [rsp+8*1762]
	mov r11, qword [rsp+8*1761]
	mov r10, [r11]
	mov qword [rsp+8*1762],r10
	mov qword [rsp+8*1761],r11
	mov     rsi, [rsp+8*1762]
	mov     rdi, [rsp+8*1759]
	call    concat
	mov [rsp+8*1763], rax
	mov r10, qword [rsp+8*1764]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1764],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*1764]
	call    address
	mov [rsp+8*1765], rax
	mov r10, qword [rsp+8*1766]
	mov r11, qword [rsp+8*1765]
	mov r10, [r11]
	mov qword [rsp+8*1766],r10
	mov qword [rsp+8*1765],r11
	mov     rsi, [rsp+8*1766]
	mov     rdi, [rsp+8*1763]
	call    concat
	mov [rsp+8*1767], rax
	mov r10, qword [rsp+8*1768]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1768],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1768]
	call    address
	mov [rsp+8*1769], rax
	mov r10, qword [rsp+8*1770]
	mov r11, qword [rsp+8*1769]
	mov r10, [r11]
	mov qword [rsp+8*1770],r10
	mov qword [rsp+8*1769],r11
	mov     rsi, [rsp+8*1770]
	mov     rdi, [rsp+8*1767]
	call    concat
	mov [rsp+8*1771], rax
	mov r10, qword [rsp+8*1772]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1772],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*1772]
	call    address
	mov [rsp+8*1773], rax
	mov r10, qword [rsp+8*1774]
	mov r11, qword [rsp+8*1773]
	mov r10, [r11]
	mov qword [rsp+8*1774],r10
	mov qword [rsp+8*1773],r11
	mov     rsi, [rsp+8*1774]
	mov     rdi, [rsp+8*1771]
	call    concat
	mov [rsp+8*1775], rax
	mov r10, qword [rsp+8*1776]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1776],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*1776]
	call    address
	mov [rsp+8*1777], rax
	mov r10, qword [rsp+8*1778]
	mov r11, qword [rsp+8*1777]
	mov r10, [r11]
	mov qword [rsp+8*1778],r10
	mov qword [rsp+8*1777],r11
	mov     rsi, [rsp+8*1778]
	mov     rdi, [rsp+8*1775]
	call    concat
	mov [rsp+8*1779], rax
	mov r10, qword [rsp+8*1780]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1780],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*1780]
	call    address
	mov [rsp+8*1781], rax
	mov r10, qword [rsp+8*1782]
	mov r11, qword [rsp+8*1781]
	mov r10, [r11]
	mov qword [rsp+8*1782],r10
	mov qword [rsp+8*1781],r11
	mov     rsi, [rsp+8*1782]
	mov     rdi, [rsp+8*1779]
	call    concat
	mov [rsp+8*1783], rax
	mov r10, qword [rsp+8*1784]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1784],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*1784]
	call    address
	mov [rsp+8*1785], rax
	mov r10, qword [rsp+8*1786]
	mov r11, qword [rsp+8*1785]
	mov r10, [r11]
	mov qword [rsp+8*1786],r10
	mov qword [rsp+8*1785],r11
	mov     rsi, [rsp+8*1786]
	mov     rdi, [rsp+8*1783]
	call    concat
	mov [rsp+8*1787], rax
	mov r10, qword [rsp+8*1788]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1788],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 10
	mov     rdi, [rsp+8*1788]
	call    address
	mov [rsp+8*1789], rax
	mov r10, qword [rsp+8*1790]
	mov r11, qword [rsp+8*1789]
	mov r10, [r11]
	mov qword [rsp+8*1790],r10
	mov qword [rsp+8*1789],r11
	mov     rsi, [rsp+8*1790]
	mov     rdi, [rsp+8*1787]
	call    concat
	mov [rsp+8*1791], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1791]
	call    concat
	mov [rsp+8*1792], rax
	mov r10, qword [rsp+8*1793]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1793],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 59
	mov     rdi, [rsp+8*1793]
	call    address
	mov [rsp+8*1794], rax
	mov r10, qword [rsp+8*1795]
	mov r11, qword [rsp+8*1794]
	mov r10, [r11]
	mov qword [rsp+8*1795],r10
	mov qword [rsp+8*1794],r11
	mov     rsi, [rsp+8*1795]
	mov     rdi, [rsp+8*1792]
	call    concat
	mov [rsp+8*1796], rax
	mov r10, qword [rsp+8*1797]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1797],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*1797]
	call    address
	mov [rsp+8*1798], rax
	mov r10, qword [rsp+8*1799]
	mov r11, qword [rsp+8*1798]
	mov r10, [r11]
	mov qword [rsp+8*1799],r10
	mov qword [rsp+8*1798],r11
	mov     rsi, [rsp+8*1799]
	mov     rdi, [rsp+8*1796]
	call    concat
	mov [rsp+8*1800], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1800]
	call    concat
	mov [rsp+8*1801], rax
	mov r10, qword [rsp+8*1802]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1802],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*1802]
	call    address
	mov [rsp+8*1803], rax
	mov r10, qword [rsp+8*1804]
	mov r11, qword [rsp+8*1803]
	mov r10, [r11]
	mov qword [rsp+8*1804],r10
	mov qword [rsp+8*1803],r11
	mov     rsi, [rsp+8*1804]
	mov     rdi, [rsp+8*1801]
	call    concat
	mov [rsp+8*1805], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*1805]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*1805],r11
	mov r10, qword [rsp+8*1806]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*1806],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*1806] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*1807]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1807],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1807]
	call    address
	mov [rsp+8*1808], rax
	mov r10, qword [rsp+8*1809]
	mov r11, qword [rsp+8*1808]
	mov r10, [r11]
	mov qword [rsp+8*1809],r10
	mov qword [rsp+8*1808],r11
	mov r10, qword [rsp+8*1810]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1810],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 67
	mov     rdi, [rsp+8*1810]
	call    address
	mov [rsp+8*1811], rax
	mov r10, qword [rsp+8*1812]
	mov r11, qword [rsp+8*1811]
	mov r10, [r11]
	mov qword [rsp+8*1812],r10
	mov qword [rsp+8*1811],r11
	mov     rsi, [rsp+8*1812]
	mov     rdi, [rsp+8*1809]
	call    concat
	mov [rsp+8*1813], rax
	mov r10, qword [rsp+8*1814]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1814],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1814]
	call    address
	mov [rsp+8*1815], rax
	mov r10, qword [rsp+8*1816]
	mov r11, qword [rsp+8*1815]
	mov r10, [r11]
	mov qword [rsp+8*1816],r10
	mov qword [rsp+8*1815],r11
	mov     rsi, [rsp+8*1816]
	mov     rdi, [rsp+8*1813]
	call    concat
	mov [rsp+8*1817], rax
	mov r10, qword [rsp+8*1818]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1818],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 83
	mov     rdi, [rsp+8*1818]
	call    address
	mov [rsp+8*1819], rax
	mov r10, qword [rsp+8*1820]
	mov r11, qword [rsp+8*1819]
	mov r10, [r11]
	mov qword [rsp+8*1820],r10
	mov qword [rsp+8*1819],r11
	mov     rsi, [rsp+8*1820]
	mov     rdi, [rsp+8*1817]
	call    concat
	mov [rsp+8*1821], rax
	mov r10, qword [rsp+8*1822]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1822],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1822]
	call    address
	mov [rsp+8*1823], rax
	mov r10, qword [rsp+8*1824]
	mov r11, qword [rsp+8*1823]
	mov r10, [r11]
	mov qword [rsp+8*1824],r10
	mov qword [rsp+8*1823],r11
	mov     rsi, [rsp+8*1824]
	mov     rdi, [rsp+8*1821]
	call    concat
	mov [rsp+8*1825], rax
	mov r10, qword [rsp+8*1826]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1826],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1826]
	call    address
	mov [rsp+8*1827], rax
	mov r10, qword [rsp+8*1828]
	mov r11, qword [rsp+8*1827]
	mov r10, [r11]
	mov qword [rsp+8*1828],r10
	mov qword [rsp+8*1827],r11
	mov     rsi, [rsp+8*1828]
	mov     rdi, [rsp+8*1825]
	call    concat
	mov [rsp+8*1829], rax
	mov r10, qword [rsp+8*1830]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1830],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*1830]
	call    address
	mov [rsp+8*1831], rax
	mov r10, qword [rsp+8*1832]
	mov r11, qword [rsp+8*1831]
	mov r10, [r11]
	mov qword [rsp+8*1832],r10
	mov qword [rsp+8*1831],r11
	mov     rsi, [rsp+8*1832]
	mov     rdi, [rsp+8*1829]
	call    concat
	mov [rsp+8*1833], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1833]
	call    concat
	mov [rsp+8*1834], rax
	mov r10, qword [rsp+8*1835]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1835],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*1835]
	call    address
	mov [rsp+8*1836], rax
	mov r10, qword [rsp+8*1837]
	mov r11, qword [rsp+8*1836]
	mov r10, [r11]
	mov qword [rsp+8*1837],r10
	mov qword [rsp+8*1836],r11
	mov     rsi, [rsp+8*1837]
	mov     rdi, [rsp+8*1834]
	call    concat
	mov [rsp+8*1838], rax
	mov r10, qword [rsp+8*1839]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1839],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 58
	mov     rdi, [rsp+8*1839]
	call    address
	mov [rsp+8*1840], rax
	mov r10, qword [rsp+8*1841]
	mov r11, qword [rsp+8*1840]
	mov r10, [r11]
	mov qword [rsp+8*1841],r10
	mov qword [rsp+8*1840],r11
	mov     rsi, [rsp+8*1841]
	mov     rdi, [rsp+8*1838]
	call    concat
	mov [rsp+8*1842], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1842]
	call    concat
	mov [rsp+8*1843], rax
	mov r10, qword [rsp+8*1844]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1844],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 10
	mov     rdi, [rsp+8*1844]
	call    address
	mov [rsp+8*1845], rax
	mov r10, qword [rsp+8*1846]
	mov r11, qword [rsp+8*1845]
	mov r10, [r11]
	mov qword [rsp+8*1846],r10
	mov qword [rsp+8*1845],r11
	mov     rsi, [rsp+8*1846]
	mov     rdi, [rsp+8*1843]
	call    concat
	mov [rsp+8*1847], rax
	mov r10, qword [rsp+8*1848]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1848],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 66
	mov     rdi, [rsp+8*1848]
	call    address
	mov [rsp+8*1849], rax
	mov r10, qword [rsp+8*1850]
	mov r11, qword [rsp+8*1849]
	mov r10, [r11]
	mov qword [rsp+8*1850],r10
	mov qword [rsp+8*1849],r11
	mov     rsi, [rsp+8*1850]
	mov     rdi, [rsp+8*1847]
	call    concat
	mov [rsp+8*1851], rax
	mov r10, qword [rsp+8*1852]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1852],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1852]
	call    address
	mov [rsp+8*1853], rax
	mov r10, qword [rsp+8*1854]
	mov r11, qword [rsp+8*1853]
	mov r10, [r11]
	mov qword [rsp+8*1854],r10
	mov qword [rsp+8*1853],r11
	mov     rsi, [rsp+8*1854]
	mov     rdi, [rsp+8*1851]
	call    concat
	mov [rsp+8*1855], rax
	mov r10, qword [rsp+8*1856]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1856],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*1856]
	call    address
	mov [rsp+8*1857], rax
	mov r10, qword [rsp+8*1858]
	mov r11, qword [rsp+8*1857]
	mov r10, [r11]
	mov qword [rsp+8*1858],r10
	mov qword [rsp+8*1857],r11
	mov     rsi, [rsp+8*1858]
	mov     rdi, [rsp+8*1855]
	call    concat
	mov [rsp+8*1859], rax
	mov r10, qword [rsp+8*1860]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1860],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1860]
	call    address
	mov [rsp+8*1861], rax
	mov r10, qword [rsp+8*1862]
	mov r11, qword [rsp+8*1861]
	mov r10, [r11]
	mov qword [rsp+8*1862],r10
	mov qword [rsp+8*1861],r11
	mov     rsi, [rsp+8*1862]
	mov     rdi, [rsp+8*1859]
	call    concat
	mov [rsp+8*1863], rax
	mov r10, qword [rsp+8*1864]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1864],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*1864]
	call    address
	mov [rsp+8*1865], rax
	mov r10, qword [rsp+8*1866]
	mov r11, qword [rsp+8*1865]
	mov r10, [r11]
	mov qword [rsp+8*1866],r10
	mov qword [rsp+8*1865],r11
	mov     rsi, [rsp+8*1866]
	mov     rdi, [rsp+8*1863]
	call    concat
	mov [rsp+8*1867], rax
	mov r10, qword [rsp+8*1868]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1868],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*1868]
	call    address
	mov [rsp+8*1869], rax
	mov r10, qword [rsp+8*1870]
	mov r11, qword [rsp+8*1869]
	mov r10, [r11]
	mov qword [rsp+8*1870],r10
	mov qword [rsp+8*1869],r11
	mov     rsi, [rsp+8*1870]
	mov     rdi, [rsp+8*1867]
	call    concat
	mov [rsp+8*1871], rax
	mov r10, qword [rsp+8*1872]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1872],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*1872]
	call    address
	mov [rsp+8*1873], rax
	mov r10, qword [rsp+8*1874]
	mov r11, qword [rsp+8*1873]
	mov r10, [r11]
	mov qword [rsp+8*1874],r10
	mov qword [rsp+8*1873],r11
	mov     rsi, [rsp+8*1874]
	mov     rdi, [rsp+8*1871]
	call    concat
	mov [rsp+8*1875], rax
	mov r10, qword [rsp+8*1876]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1876],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 14
	mov     rdi, [rsp+8*1876]
	call    address
	mov [rsp+8*1877], rax
	mov r10, qword [rsp+8*1878]
	mov r11, qword [rsp+8*1877]
	mov r10, [r11]
	mov qword [rsp+8*1878],r10
	mov qword [rsp+8*1877],r11
	mov     rsi, [rsp+8*1878]
	mov     rdi, [rsp+8*1875]
	call    concat
	mov [rsp+8*1879], rax
	mov r10, qword [rsp+8*1880]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1880],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 16
	mov     rdi, [rsp+8*1880]
	call    address
	mov [rsp+8*1881], rax
	mov r10, qword [rsp+8*1882]
	mov r11, qword [rsp+8*1881]
	mov r10, [r11]
	mov qword [rsp+8*1882],r10
	mov qword [rsp+8*1881],r11
	mov     rsi, [rsp+8*1882]
	mov     rdi, [rsp+8*1879]
	call    concat
	mov [rsp+8*1883], rax
	mov r10, qword [rsp+8*1884]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1884],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 15
	mov     rdi, [rsp+8*1884]
	call    address
	mov [rsp+8*1885], rax
	mov r10, qword [rsp+8*1886]
	mov r11, qword [rsp+8*1885]
	mov r10, [r11]
	mov qword [rsp+8*1886],r10
	mov qword [rsp+8*1885],r11
	mov     rsi, [rsp+8*1886]
	mov     rdi, [rsp+8*1883]
	call    concat
	mov [rsp+8*1887], rax
	mov r10, qword [rsp+8*1888]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1888],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*1888]
	call    address
	mov [rsp+8*1889], rax
	mov r10, qword [rsp+8*1890]
	mov r11, qword [rsp+8*1889]
	mov r10, [r11]
	mov qword [rsp+8*1890],r10
	mov qword [rsp+8*1889],r11
	mov     rsi, [rsp+8*1890]
	mov     rdi, [rsp+8*1887]
	call    concat
	mov [rsp+8*1891], rax
	mov r10, qword [rsp+8*1892]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1892],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 10
	mov     rdi, [rsp+8*1892]
	call    address
	mov [rsp+8*1893], rax
	mov r10, qword [rsp+8*1894]
	mov r11, qword [rsp+8*1893]
	mov r10, [r11]
	mov qword [rsp+8*1894],r10
	mov qword [rsp+8*1893],r11
	mov     rsi, [rsp+8*1894]
	mov     rdi, [rsp+8*1891]
	call    concat
	mov [rsp+8*1895], rax
	mov r10, qword [rsp+8*1896]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1896],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 66
	mov     rdi, [rsp+8*1896]
	call    address
	mov [rsp+8*1897], rax
	mov r10, qword [rsp+8*1898]
	mov r11, qword [rsp+8*1897]
	mov r10, [r11]
	mov qword [rsp+8*1898],r10
	mov qword [rsp+8*1897],r11
	mov     rsi, [rsp+8*1898]
	mov     rdi, [rsp+8*1895]
	call    concat
	mov [rsp+8*1899], rax
	mov r10, qword [rsp+8*1900]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1900],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1900]
	call    address
	mov [rsp+8*1901], rax
	mov r10, qword [rsp+8*1902]
	mov r11, qword [rsp+8*1901]
	mov r10, [r11]
	mov qword [rsp+8*1902],r10
	mov qword [rsp+8*1901],r11
	mov     rsi, [rsp+8*1902]
	mov     rdi, [rsp+8*1899]
	call    concat
	mov [rsp+8*1903], rax
	mov r10, qword [rsp+8*1904]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1904],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*1904]
	call    address
	mov [rsp+8*1905], rax
	mov r10, qword [rsp+8*1906]
	mov r11, qword [rsp+8*1905]
	mov r10, [r11]
	mov qword [rsp+8*1906],r10
	mov qword [rsp+8*1905],r11
	mov     rsi, [rsp+8*1906]
	mov     rdi, [rsp+8*1903]
	call    concat
	mov [rsp+8*1907], rax
	mov r10, qword [rsp+8*1908]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1908],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1908]
	call    address
	mov [rsp+8*1909], rax
	mov r10, qword [rsp+8*1910]
	mov r11, qword [rsp+8*1909]
	mov r10, [r11]
	mov qword [rsp+8*1910],r10
	mov qword [rsp+8*1909],r11
	mov     rsi, [rsp+8*1910]
	mov     rdi, [rsp+8*1907]
	call    concat
	mov [rsp+8*1911], rax
	mov r10, qword [rsp+8*1912]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1912],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 7
	mov     rdi, [rsp+8*1912]
	call    address
	mov [rsp+8*1913], rax
	mov r10, qword [rsp+8*1914]
	mov r11, qword [rsp+8*1913]
	mov r10, [r11]
	mov qword [rsp+8*1914],r10
	mov qword [rsp+8*1913],r11
	mov     rsi, [rsp+8*1914]
	mov     rdi, [rsp+8*1911]
	call    concat
	mov [rsp+8*1915], rax
	mov r10, qword [rsp+8*1916]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1916],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*1916]
	call    address
	mov [rsp+8*1917], rax
	mov r10, qword [rsp+8*1918]
	mov r11, qword [rsp+8*1917]
	mov r10, [r11]
	mov qword [rsp+8*1918],r10
	mov qword [rsp+8*1917],r11
	mov     rsi, [rsp+8*1918]
	mov     rdi, [rsp+8*1915]
	call    concat
	mov [rsp+8*1919], rax
	mov r10, qword [rsp+8*1920]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1920],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*1920]
	call    address
	mov [rsp+8*1921], rax
	mov r10, qword [rsp+8*1922]
	mov r11, qword [rsp+8*1921]
	mov r10, [r11]
	mov qword [rsp+8*1922],r10
	mov qword [rsp+8*1921],r11
	mov     rsi, [rsp+8*1922]
	mov     rdi, [rsp+8*1919]
	call    concat
	mov [rsp+8*1923], rax
	mov r10, qword [rsp+8*1924]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1924],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 4
	mov     rdi, [rsp+8*1924]
	call    address
	mov [rsp+8*1925], rax
	mov r10, qword [rsp+8*1926]
	mov r11, qword [rsp+8*1925]
	mov r10, [r11]
	mov qword [rsp+8*1926],r10
	mov qword [rsp+8*1925],r11
	mov     rsi, [rsp+8*1926]
	mov     rdi, [rsp+8*1923]
	call    concat
	mov [rsp+8*1927], rax
	mov r10, qword [rsp+8*1928]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1928],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 16
	mov     rdi, [rsp+8*1928]
	call    address
	mov [rsp+8*1929], rax
	mov r10, qword [rsp+8*1930]
	mov r11, qword [rsp+8*1929]
	mov r10, [r11]
	mov qword [rsp+8*1930],r10
	mov qword [rsp+8*1929],r11
	mov     rsi, [rsp+8*1930]
	mov     rdi, [rsp+8*1927]
	call    concat
	mov [rsp+8*1931], rax
	mov r10, qword [rsp+8*1932]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1932],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 15
	mov     rdi, [rsp+8*1932]
	call    address
	mov [rsp+8*1933], rax
	mov r10, qword [rsp+8*1934]
	mov r11, qword [rsp+8*1933]
	mov r10, [r11]
	mov qword [rsp+8*1934],r10
	mov qword [rsp+8*1933],r11
	mov     rsi, [rsp+8*1934]
	mov     rdi, [rsp+8*1931]
	call    concat
	mov [rsp+8*1935], rax
	mov r10, qword [rsp+8*1936]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1936],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 8
	mov     rdi, [rsp+8*1936]
	call    address
	mov [rsp+8*1937], rax
	mov r10, qword [rsp+8*1938]
	mov r11, qword [rsp+8*1937]
	mov r10, [r11]
	mov qword [rsp+8*1938],r10
	mov qword [rsp+8*1937],r11
	mov     rsi, [rsp+8*1938]
	mov     rdi, [rsp+8*1935]
	call    concat
	mov [rsp+8*1939], rax
	mov r10, qword [rsp+8*1940]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1940],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 10
	mov     rdi, [rsp+8*1940]
	call    address
	mov [rsp+8*1941], rax
	mov r10, qword [rsp+8*1942]
	mov r11, qword [rsp+8*1941]
	mov r10, [r11]
	mov qword [rsp+8*1942],r10
	mov qword [rsp+8*1941],r11
	mov     rsi, [rsp+8*1942]
	mov     rdi, [rsp+8*1939]
	call    concat
	mov [rsp+8*1943], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1943]
	call    concat
	mov [rsp+8*1944], rax
	mov r10, qword [rsp+8*1945]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1945],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 59
	mov     rdi, [rsp+8*1945]
	call    address
	mov [rsp+8*1946], rax
	mov r10, qword [rsp+8*1947]
	mov r11, qword [rsp+8*1946]
	mov r10, [r11]
	mov qword [rsp+8*1947],r10
	mov qword [rsp+8*1946],r11
	mov     rsi, [rsp+8*1947]
	mov     rdi, [rsp+8*1944]
	call    concat
	mov [rsp+8*1948], rax
	mov r10, qword [rsp+8*1949]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1949],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*1949]
	call    address
	mov [rsp+8*1950], rax
	mov r10, qword [rsp+8*1951]
	mov r11, qword [rsp+8*1950]
	mov r10, [r11]
	mov qword [rsp+8*1951],r10
	mov qword [rsp+8*1950],r11
	mov     rsi, [rsp+8*1951]
	mov     rdi, [rsp+8*1948]
	call    concat
	mov [rsp+8*1952], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1952]
	call    concat
	mov [rsp+8*1953], rax
	mov r10, qword [rsp+8*1954]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1954],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*1954]
	call    address
	mov [rsp+8*1955], rax
	mov r10, qword [rsp+8*1956]
	mov r11, qword [rsp+8*1955]
	mov r10, [r11]
	mov qword [rsp+8*1956],r10
	mov qword [rsp+8*1955],r11
	mov     rsi, [rsp+8*1956]
	mov     rdi, [rsp+8*1953]
	call    concat
	mov [rsp+8*1957], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*1957]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*1957],r11
	mov r10, qword [rsp+8*1958]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*1958],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*1958] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*1959]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1959],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 91
	mov     rdi, [rsp+8*1959]
	call    address
	mov [rsp+8*1960], rax
	mov r10, qword [rsp+8*1961]
	mov r11, qword [rsp+8*1960]
	mov r10, [r11]
	mov qword [rsp+8*1961],r10
	mov qword [rsp+8*1960],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*1961]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*1961],r11
	mov r10, qword [rsp+8*1962]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*1962],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*1962] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*1963]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1963],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*1963]
	call    address
	mov [rsp+8*1964], rax
	mov r10, qword [rsp+8*1965]
	mov r11, qword [rsp+8*1964]
	mov r10, [r11]
	mov qword [rsp+8*1965],r10
	mov qword [rsp+8*1964],r11
	mov r10, qword [rsp+8*1966]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1966],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*1966]
	call    address
	mov [rsp+8*1967], rax
	mov r10, qword [rsp+8*1968]
	mov r11, qword [rsp+8*1967]
	mov r10, [r11]
	mov qword [rsp+8*1968],r10
	mov qword [rsp+8*1967],r11
	mov     rsi, [rsp+8*1968]
	mov     rdi, [rsp+8*1965]
	call    concat
	mov [rsp+8*1969], rax
	mov r10, qword [rsp+8*1970]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1970],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*1970]
	call    address
	mov [rsp+8*1971], rax
	mov r10, qword [rsp+8*1972]
	mov r11, qword [rsp+8*1971]
	mov r10, [r11]
	mov qword [rsp+8*1972],r10
	mov qword [rsp+8*1971],r11
	mov     rsi, [rsp+8*1972]
	mov     rdi, [rsp+8*1969]
	call    concat
	mov [rsp+8*1973], rax
	mov r10, qword [rsp+8*1974]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1974],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*1974]
	call    address
	mov [rsp+8*1975], rax
	mov r10, qword [rsp+8*1976]
	mov r11, qword [rsp+8*1975]
	mov r10, [r11]
	mov qword [rsp+8*1976],r10
	mov qword [rsp+8*1975],r11
	mov     rsi, [rsp+8*1976]
	mov     rdi, [rsp+8*1973]
	call    concat
	mov [rsp+8*1977], rax
	mov r10, qword [rsp+8*1978]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1978],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*1978]
	call    address
	mov [rsp+8*1979], rax
	mov r10, qword [rsp+8*1980]
	mov r11, qword [rsp+8*1979]
	mov r10, [r11]
	mov qword [rsp+8*1980],r10
	mov qword [rsp+8*1979],r11
	mov     rsi, [rsp+8*1980]
	mov     rdi, [rsp+8*1977]
	call    concat
	mov [rsp+8*1981], rax
	mov r10, qword [rsp+8*1982]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1982],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*1982]
	call    address
	mov [rsp+8*1983], rax
	mov r10, qword [rsp+8*1984]
	mov r11, qword [rsp+8*1983]
	mov r10, [r11]
	mov qword [rsp+8*1984],r10
	mov qword [rsp+8*1983],r11
	mov     rsi, [rsp+8*1984]
	mov     rdi, [rsp+8*1981]
	call    concat
	mov [rsp+8*1985], rax
	mov r10, qword [rsp+8*1986]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1986],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*1986]
	call    address
	mov [rsp+8*1987], rax
	mov r10, qword [rsp+8*1988]
	mov r11, qword [rsp+8*1987]
	mov r10, [r11]
	mov qword [rsp+8*1988],r10
	mov qword [rsp+8*1987],r11
	mov     rsi, [rsp+8*1988]
	mov     rdi, [rsp+8*1985]
	call    concat
	mov [rsp+8*1989], rax
	mov r10, qword [rsp+8*1990]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1990],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 65
	mov     rdi, [rsp+8*1990]
	call    address
	mov [rsp+8*1991], rax
	mov r10, qword [rsp+8*1992]
	mov r11, qword [rsp+8*1991]
	mov r10, [r11]
	mov qword [rsp+8*1992],r10
	mov qword [rsp+8*1991],r11
	mov     rsi, [rsp+8*1992]
	mov     rdi, [rsp+8*1989]
	call    concat
	mov [rsp+8*1993], rax
	mov r10, qword [rsp+8*1994]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1994],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 77
	mov     rdi, [rsp+8*1994]
	call    address
	mov [rsp+8*1995], rax
	mov r10, qword [rsp+8*1996]
	mov r11, qword [rsp+8*1995]
	mov r10, [r11]
	mov qword [rsp+8*1996],r10
	mov qword [rsp+8*1995],r11
	mov     rsi, [rsp+8*1996]
	mov     rdi, [rsp+8*1993]
	call    concat
	mov [rsp+8*1997], rax
	mov r10, qword [rsp+8*1998]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*1998],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*1998]
	call    address
	mov [rsp+8*1999], rax
	mov r10, qword [rsp+8*2000]
	mov r11, qword [rsp+8*1999]
	mov r10, [r11]
	mov qword [rsp+8*2000],r10
	mov qword [rsp+8*1999],r11
	mov     rsi, [rsp+8*2000]
	mov     rdi, [rsp+8*1997]
	call    concat
	mov [rsp+8*2001], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2001]
	call    concat
	mov [rsp+8*2002], rax
	mov r10, qword [rsp+8*2003]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2003],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*2003]
	call    address
	mov [rsp+8*2004], rax
	mov r10, qword [rsp+8*2005]
	mov r11, qword [rsp+8*2004]
	mov r10, [r11]
	mov qword [rsp+8*2005],r10
	mov qword [rsp+8*2004],r11
	mov     rsi, [rsp+8*2005]
	mov     rdi, [rsp+8*2002]
	call    concat
	mov [rsp+8*2006], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2006]
	call    concat
	mov [rsp+8*2007], rax
	mov r10, qword [rsp+8*2008]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2008],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*2008]
	call    address
	mov [rsp+8*2009], rax
	mov r10, qword [rsp+8*2010]
	mov r11, qword [rsp+8*2009]
	mov r10, [r11]
	mov qword [rsp+8*2010],r10
	mov qword [rsp+8*2009],r11
	mov     rsi, [rsp+8*2010]
	mov     rdi, [rsp+8*2007]
	call    concat
	mov [rsp+8*2011], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*2011]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*2011],r11
	mov r10, qword [rsp+8*2012]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*2012],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*2012] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*2013]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2013],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*2013]
	call    address
	mov [rsp+8*2014], rax
	mov r10, qword [rsp+8*2015]
	mov r11, qword [rsp+8*2014]
	mov r10, [r11]
	mov qword [rsp+8*2015],r10
	mov qword [rsp+8*2014],r11
	mov r10, qword [rsp+8*2016]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2016],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*2016]
	call    address
	mov [rsp+8*2017], rax
	mov r10, qword [rsp+8*2018]
	mov r11, qword [rsp+8*2017]
	mov r10, [r11]
	mov qword [rsp+8*2018],r10
	mov qword [rsp+8*2017],r11
	mov     rsi, [rsp+8*2018]
	mov     rdi, [rsp+8*2015]
	call    concat
	mov [rsp+8*2019], rax
	mov r10, qword [rsp+8*2020]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2020],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*2020]
	call    address
	mov [rsp+8*2021], rax
	mov r10, qword [rsp+8*2022]
	mov r11, qword [rsp+8*2021]
	mov r10, [r11]
	mov qword [rsp+8*2022],r10
	mov qword [rsp+8*2021],r11
	mov     rsi, [rsp+8*2022]
	mov     rdi, [rsp+8*2019]
	call    concat
	mov [rsp+8*2023], rax
	mov r10, qword [rsp+8*2024]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2024],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*2024]
	call    address
	mov [rsp+8*2025], rax
	mov r10, qword [rsp+8*2026]
	mov r11, qword [rsp+8*2025]
	mov r10, [r11]
	mov qword [rsp+8*2026],r10
	mov qword [rsp+8*2025],r11
	mov     rsi, [rsp+8*2026]
	mov     rdi, [rsp+8*2023]
	call    concat
	mov [rsp+8*2027], rax
	mov r10, qword [rsp+8*2028]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2028],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*2028]
	call    address
	mov [rsp+8*2029], rax
	mov r10, qword [rsp+8*2030]
	mov r11, qword [rsp+8*2029]
	mov r10, [r11]
	mov qword [rsp+8*2030],r10
	mov qword [rsp+8*2029],r11
	mov     rsi, [rsp+8*2030]
	mov     rdi, [rsp+8*2027]
	call    concat
	mov [rsp+8*2031], rax
	mov r10, qword [rsp+8*2032]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2032],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*2032]
	call    address
	mov [rsp+8*2033], rax
	mov r10, qword [rsp+8*2034]
	mov r11, qword [rsp+8*2033]
	mov r10, [r11]
	mov qword [rsp+8*2034],r10
	mov qword [rsp+8*2033],r11
	mov     rsi, [rsp+8*2034]
	mov     rdi, [rsp+8*2031]
	call    concat
	mov [rsp+8*2035], rax
	mov r10, qword [rsp+8*2036]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2036],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*2036]
	call    address
	mov [rsp+8*2037], rax
	mov r10, qword [rsp+8*2038]
	mov r11, qword [rsp+8*2037]
	mov r10, [r11]
	mov qword [rsp+8*2038],r10
	mov qword [rsp+8*2037],r11
	mov     rsi, [rsp+8*2038]
	mov     rdi, [rsp+8*2035]
	call    concat
	mov [rsp+8*2039], rax
	mov r10, qword [rsp+8*2040]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2040],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 63
	mov     rdi, [rsp+8*2040]
	call    address
	mov [rsp+8*2041], rax
	mov r10, qword [rsp+8*2042]
	mov r11, qword [rsp+8*2041]
	mov r10, [r11]
	mov qword [rsp+8*2042],r10
	mov qword [rsp+8*2041],r11
	mov     rsi, [rsp+8*2042]
	mov     rdi, [rsp+8*2039]
	call    concat
	mov [rsp+8*2043], rax
	mov r10, qword [rsp+8*2044]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2044],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 17
	mov     rdi, [rsp+8*2044]
	call    address
	mov [rsp+8*2045], rax
	mov r10, qword [rsp+8*2046]
	mov r11, qword [rsp+8*2045]
	mov r10, [r11]
	mov qword [rsp+8*2046],r10
	mov qword [rsp+8*2045],r11
	mov     rsi, [rsp+8*2046]
	mov     rdi, [rsp+8*2043]
	call    concat
	mov [rsp+8*2047], rax
	mov r10, qword [rsp+8*2048]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2048],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 79
	mov     rdi, [rsp+8*2048]
	call    address
	mov [rsp+8*2049], rax
	mov r10, qword [rsp+8*2050]
	mov r11, qword [rsp+8*2049]
	mov r10, [r11]
	mov qword [rsp+8*2050],r10
	mov qword [rsp+8*2049],r11
	mov     rsi, [rsp+8*2050]
	mov     rdi, [rsp+8*2047]
	call    concat
	mov [rsp+8*2051], rax
	mov r10, qword [rsp+8*2052]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2052],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*2052]
	call    address
	mov [rsp+8*2053], rax
	mov r10, qword [rsp+8*2054]
	mov r11, qword [rsp+8*2053]
	mov r10, [r11]
	mov qword [rsp+8*2054],r10
	mov qword [rsp+8*2053],r11
	mov     rsi, [rsp+8*2054]
	mov     rdi, [rsp+8*2051]
	call    concat
	mov [rsp+8*2055], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2055]
	call    concat
	mov [rsp+8*2056], rax
	mov     rsi, [gbl+8*2057]
	mov     rdi, [rsp+8*2056]
	call    concat
	mov [rsp+8*2058], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2058]
	call    concat
	mov [rsp+8*2059], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2059]
	call    concat
	mov [rsp+8*2060], rax
	mov r10, qword [rsp+8*2061]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2061],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*2061]
	call    address
	mov [rsp+8*2062], rax
	mov r10, qword [rsp+8*2063]
	mov r11, qword [rsp+8*2062]
	mov r10, [r11]
	mov qword [rsp+8*2063],r10
	mov qword [rsp+8*2062],r11
	mov     rsi, [rsp+8*2063]
	mov     rdi, [rsp+8*2060]
	call    concat
	mov [rsp+8*2064], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*2064]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*2064],r11
	mov r10, qword [rsp+8*2065]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*2065],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*2065] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*2066]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2066],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 81
	mov     rdi, [rsp+8*2066]
	call    address
	mov [rsp+8*2067], rax
	mov r10, qword [rsp+8*2068]
	mov r11, qword [rsp+8*2067]
	mov r10, [r11]
	mov qword [rsp+8*2068],r10
	mov qword [rsp+8*2067],r11
	mov r10, qword [rsp+8*2069]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2069],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 82
	mov     rdi, [rsp+8*2069]
	call    address
	mov [rsp+8*2070], rax
	mov r10, qword [rsp+8*2071]
	mov r11, qword [rsp+8*2070]
	mov r10, [r11]
	mov qword [rsp+8*2071],r10
	mov qword [rsp+8*2070],r11
	mov     rsi, [rsp+8*2071]
	mov     rdi, [rsp+8*2068]
	call    concat
	mov [rsp+8*2072], rax
	mov r10, qword [rsp+8*2073]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2073],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 80
	mov     rdi, [rsp+8*2073]
	call    address
	mov [rsp+8*2074], rax
	mov r10, qword [rsp+8*2075]
	mov r11, qword [rsp+8*2074]
	mov r10, [r11]
	mov qword [rsp+8*2075],r10
	mov qword [rsp+8*2074],r11
	mov     rsi, [rsp+8*2075]
	mov     rdi, [rsp+8*2072]
	call    concat
	mov [rsp+8*2076], rax
	mov r10, qword [rsp+8*2077]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2077],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 71
	mov     rdi, [rsp+8*2077]
	call    address
	mov [rsp+8*2078], rax
	mov r10, qword [rsp+8*2079]
	mov r11, qword [rsp+8*2078]
	mov r10, [r11]
	mov qword [rsp+8*2079],r10
	mov qword [rsp+8*2078],r11
	mov     rsi, [rsp+8*2079]
	mov     rdi, [rsp+8*2076]
	call    concat
	mov [rsp+8*2080], rax
	mov r10, qword [rsp+8*2081]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2081],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 76
	mov     rdi, [rsp+8*2081]
	call    address
	mov [rsp+8*2082], rax
	mov r10, qword [rsp+8*2083]
	mov r11, qword [rsp+8*2082]
	mov r10, [r11]
	mov qword [rsp+8*2083],r10
	mov qword [rsp+8*2082],r11
	mov     rsi, [rsp+8*2083]
	mov     rdi, [rsp+8*2080]
	call    concat
	mov [rsp+8*2084], rax
	mov r10, qword [rsp+8*2085]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2085],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 69
	mov     rdi, [rsp+8*2085]
	call    address
	mov [rsp+8*2086], rax
	mov r10, qword [rsp+8*2087]
	mov r11, qword [rsp+8*2086]
	mov r10, [r11]
	mov qword [rsp+8*2087],r10
	mov qword [rsp+8*2086],r11
	mov     rsi, [rsp+8*2087]
	mov     rdi, [rsp+8*2084]
	call    concat
	mov [rsp+8*2088], rax
	mov r10, qword [rsp+8*2089]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2089],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*2089]
	call    address
	mov [rsp+8*2090], rax
	mov r10, qword [rsp+8*2091]
	mov r11, qword [rsp+8*2090]
	mov r10, [r11]
	mov qword [rsp+8*2091],r10
	mov qword [rsp+8*2090],r11
	mov     rsi, [rsp+8*2091]
	mov     rdi, [rsp+8*2088]
	call    concat
	mov [rsp+8*2092], rax
	mov r10, qword [rsp+8*2093]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2093],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 63
	mov     rdi, [rsp+8*2093]
	call    address
	mov [rsp+8*2094], rax
	mov r10, qword [rsp+8*2095]
	mov r11, qword [rsp+8*2094]
	mov r10, [r11]
	mov qword [rsp+8*2095],r10
	mov qword [rsp+8*2094],r11
	mov     rsi, [rsp+8*2095]
	mov     rdi, [rsp+8*2092]
	call    concat
	mov [rsp+8*2096], rax
	mov r10, qword [rsp+8*2097]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2097],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 17
	mov     rdi, [rsp+8*2097]
	call    address
	mov [rsp+8*2098], rax
	mov r10, qword [rsp+8*2099]
	mov r11, qword [rsp+8*2098]
	mov r10, [r11]
	mov qword [rsp+8*2099],r10
	mov qword [rsp+8*2098],r11
	mov     rsi, [rsp+8*2099]
	mov     rdi, [rsp+8*2096]
	call    concat
	mov [rsp+8*2100], rax
	mov r10, qword [rsp+8*2101]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2101],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 64
	mov     rdi, [rsp+8*2101]
	call    address
	mov [rsp+8*2102], rax
	mov r10, qword [rsp+8*2103]
	mov r11, qword [rsp+8*2102]
	mov r10, [r11]
	mov qword [rsp+8*2103],r10
	mov qword [rsp+8*2102],r11
	mov     rsi, [rsp+8*2103]
	mov     rdi, [rsp+8*2100]
	call    concat
	mov [rsp+8*2104], rax
	mov r10, qword [rsp+8*2105]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2105],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 28
	mov     rdi, [rsp+8*2105]
	call    address
	mov [rsp+8*2106], rax
	mov r10, qword [rsp+8*2107]
	mov r11, qword [rsp+8*2106]
	mov r10, [r11]
	mov qword [rsp+8*2107],r10
	mov qword [rsp+8*2106],r11
	mov     rsi, [rsp+8*2107]
	mov     rdi, [rsp+8*2104]
	call    concat
	mov [rsp+8*2108], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2108]
	call    concat
	mov [rsp+8*2109], rax
	mov     rsi, [gbl+8*2057]
	mov     rdi, [rsp+8*2109]
	call    concat
	mov [rsp+8*2110], rax
	mov     rsi, [gbl+8*2057]
	mov     rdi, [rsp+8*2110]
	call    concat
	mov [rsp+8*2111], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2111]
	call    concat
	mov [rsp+8*2112], rax
	mov r10, qword [rsp+8*2113]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2113],r10
	mov qword [gbl+8*3],r11
	mov     rsi, 26
	mov     rdi, [rsp+8*2113]
	call    address
	mov [rsp+8*2114], rax
	mov r10, qword [rsp+8*2115]
	mov r11, qword [rsp+8*2114]
	mov r10, [r11]
	mov qword [rsp+8*2115],r10
	mov qword [rsp+8*2114],r11
	mov     rsi, [rsp+8*2115]
	mov     rdi, [rsp+8*2112]
	call    concat
	mov [rsp+8*2116], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*2116]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*2116],r11
	mov r10, qword [rsp+8*2117]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*2117],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*2117] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*2118]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*2118],r10
	mov qword [gbl+8*190],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*2118]
	call    address
	mov [rsp+8*2119], rax
	mov r10, qword [rsp+8*2120]
	mov r11, qword [rsp+8*2119]
	mov r10, [r11]
	mov qword [rsp+8*2120],r10
	mov qword [rsp+8*2119],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*2120]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*2120],r11
	mov r10, qword [rsp+8*2121]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*2121],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*2121] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r10, qword [rsp+8*2]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*2],r10
	
L_655:
	mov r10, qword [rsp+8*2]
	mov r11,93
	cmp r10,r11
	mov r12, qword [rsp+8*2122]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*2],r10
	mov qword [rsp+8*2122],r12
	mov r10, qword [rsp+8*2122]
	cmp r10, 0
	mov qword [rsp+8*2122],r10
	je L_656
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*2],r11
	call c2
	mov r10, qword [rsp+8*2123]
	mov r10 , rax
	mov qword [rsp+8*2123],r10
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2123]
	call    concat
	mov [rsp+8*2124], rax
	mov r10, qword [rsp+8*2125]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*2125],r10
	mov qword [gbl+8*3],r11
	mov     rsi, [rsp+8*2]
	mov     rdi, [rsp+8*2125]
	call    address
	mov [rsp+8*2126], rax
	mov r10, qword [rsp+8*2127]
	mov r11, qword [rsp+8*2126]
	mov r10, [r11]
	mov qword [rsp+8*2127],r10
	mov qword [rsp+8*2126],r11
	mov     rsi, [rsp+8*2127]
	mov     rdi, [rsp+8*2124]
	call    concat
	mov [rsp+8*2128], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2128]
	call    concat
	mov [rsp+8*2129], rax
	mov     rsi, [gbl+8*2130]
	mov     rdi, [rsp+8*2129]
	call    concat
	mov [rsp+8*2131], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*2131]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*2131],r11
	mov r10, qword [rsp+8*2132]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*2132],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*2132] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_657:
	mov r10, qword [rsp+8*2133]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [rsp+8*2133],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [rsp+8*2]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*2],r10
	jmp L_655
	
L_656:
	mov r10, qword [rsp+8*2]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*2],r10
	
L_658:
	mov r10, qword [rsp+8*2]
	mov r11,31
	cmp r10,r11
	mov r12, qword [rsp+8*2134]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*2],r10
	mov qword [rsp+8*2134],r12
	mov r10, qword [rsp+8*2134]
	cmp r10, 0
	mov qword [rsp+8*2134],r10
	je L_659
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*2],r11
	call s2
	mov r10, qword [rsp+8*2135]
	mov r10 , rax
	mov qword [rsp+8*2135],r10
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2135]
	call    concat
	mov [rsp+8*2136], rax
	mov r10, qword [rsp+8*2137]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*2137],r10
	mov qword [gbl+8*190],r11
	mov     rsi, [rsp+8*2]
	mov     rdi, [rsp+8*2137]
	call    address
	mov [rsp+8*2138], rax
	mov r10, qword [rsp+8*2139]
	mov r11, qword [rsp+8*2138]
	mov r10, [r11]
	mov qword [rsp+8*2139],r10
	mov qword [rsp+8*2138],r11
	mov     rsi, [rsp+8*2139]
	mov     rdi, [rsp+8*2136]
	call    concat
	mov [rsp+8*2140], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2140]
	call    concat
	mov [rsp+8*2141], rax
	mov     rsi, [gbl+8*2130]
	mov     rdi, [rsp+8*2141]
	call    concat
	mov [rsp+8*2142], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*2142]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*2142],r11
	mov r10, qword [rsp+8*2143]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*2143],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*2143] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_660:
	mov r10, qword [rsp+8*2144]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [rsp+8*2144],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [rsp+8*2]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*2],r10
	jmp L_658
	
L_659:
	mov r10, qword [rsp+8*2]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*2],r10
	
L_661:
	mov r10, qword [rsp+8*2]
	mov r11,31
	cmp r10,r11
	mov r12, qword [rsp+8*2145]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*2],r10
	mov qword [rsp+8*2145],r12
	mov r10, qword [rsp+8*2145]
	cmp r10, 0
	mov qword [rsp+8*2145],r10
	je L_662
	mov r10, qword [rsp+8*2146]
	mov r11, qword [gbl+8*190]
	mov r10,r11
	mov qword [rsp+8*2146],r10
	mov qword [gbl+8*190],r11
	mov     rsi, [rsp+8*2]
	mov     rdi, [rsp+8*2146]
	call    address
	mov [rsp+8*2147], rax
	mov r10, qword [rsp+8*2148]
	mov r11, qword [rsp+8*2147]
	mov r10, [r11]
	mov qword [rsp+8*2148],r10
	mov qword [rsp+8*2147],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*2148]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*2148],r11
	mov r10, qword [rsp+8*2149]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*2149],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*2149] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_663:
	mov r10, qword [rsp+8*2150]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [rsp+8*2150],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [rsp+8*2]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*2],r10
	jmp L_661
	
L_662:
	mov r10,0
	mov rax,r10
	leave
	ret
	jmp QED
	
digt:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 17568
	mov r10, qword [rsp+8*2151]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*2151],r10
	mov qword [arg+8*0],r11
	mov r10, qword [rsp+8*2151]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*2152]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*2151],r10
	mov qword [rsp+8*2152],r12
	mov r10, qword [rsp+8*2152]
	cmp r10, 0
	mov qword [rsp+8*2152],r10
	je L_632
	mov r10,t18
	mov rax,r10
	leave
	ret
	
L_632:
	mov r10, qword [rsp+8*2151]
	mov r11,1
	cmp r10,r11
	mov r12, qword [rsp+8*2153]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*2151],r10
	mov qword [rsp+8*2153],r12
	mov r10, qword [rsp+8*2153]
	cmp r10, 0
	mov qword [rsp+8*2153],r10
	je L_634
	mov r10,t21
	mov rax,r10
	leave
	ret
	
L_634:
	mov r10, qword [rsp+8*2151]
	mov r11,2
	cmp r10,r11
	mov r12, qword [rsp+8*2154]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*2151],r10
	mov qword [rsp+8*2154],r12
	mov r10, qword [rsp+8*2154]
	cmp r10, 0
	mov qword [rsp+8*2154],r10
	je L_636
	mov r10,t24
	mov rax,r10
	leave
	ret
	
L_636:
	mov r10, qword [rsp+8*2151]
	mov r11,3
	cmp r10,r11
	mov r12, qword [rsp+8*2155]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*2151],r10
	mov qword [rsp+8*2155],r12
	mov r10, qword [rsp+8*2155]
	cmp r10, 0
	mov qword [rsp+8*2155],r10
	je L_638
	mov r10,t27
	mov rax,r10
	leave
	ret
	
L_638:
	mov r10, qword [rsp+8*2151]
	mov r11,4
	cmp r10,r11
	mov r12, qword [rsp+8*2156]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*2151],r10
	mov qword [rsp+8*2156],r12
	mov r10, qword [rsp+8*2156]
	cmp r10, 0
	mov qword [rsp+8*2156],r10
	je L_640
	mov r10,t30
	mov rax,r10
	leave
	ret
	
L_640:
	mov r10, qword [rsp+8*2151]
	mov r11,5
	cmp r10,r11
	mov r12, qword [rsp+8*2157]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*2151],r10
	mov qword [rsp+8*2157],r12
	mov r10, qword [rsp+8*2157]
	cmp r10, 0
	mov qword [rsp+8*2157],r10
	je L_642
	mov r10,t33
	mov rax,r10
	leave
	ret
	
L_642:
	mov r10, qword [rsp+8*2151]
	mov r11,6
	cmp r10,r11
	mov r12, qword [rsp+8*2158]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*2151],r10
	mov qword [rsp+8*2158],r12
	mov r10, qword [rsp+8*2158]
	cmp r10, 0
	mov qword [rsp+8*2158],r10
	je L_644
	mov r10,t36
	mov rax,r10
	leave
	ret
	
L_644:
	mov r10, qword [rsp+8*2151]
	mov r11,7
	cmp r10,r11
	mov r12, qword [rsp+8*2159]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*2151],r10
	mov qword [rsp+8*2159],r12
	mov r10, qword [rsp+8*2159]
	cmp r10, 0
	mov qword [rsp+8*2159],r10
	je L_646
	mov r10,t39
	mov rax,r10
	leave
	ret
	
L_646:
	mov r10, qword [rsp+8*2151]
	mov r11,8
	cmp r10,r11
	mov r12, qword [rsp+8*2160]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*2151],r10
	mov qword [rsp+8*2160],r12
	mov r10, qword [rsp+8*2160]
	cmp r10, 0
	mov qword [rsp+8*2160],r10
	je L_648
	mov r10,t42
	mov rax,r10
	leave
	ret
	
L_648:
	mov r10, qword [rsp+8*2151]
	mov r11,9
	cmp r10,r11
	mov r12, qword [rsp+8*2161]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*2151],r10
	mov qword [rsp+8*2161],r12
	mov r10, qword [rsp+8*2161]
	cmp r10, 0
	mov qword [rsp+8*2161],r10
	je L_650
	mov r10,t45
	mov rax,r10
	leave
	ret
	
L_650:
	mov r10,0
	mov rax,r10
	leave
	ret
	
s2:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 17568
	mov r10, qword [rsp+8*2162]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*2162],r10
	mov qword [arg+8*0],r11
	mov r10, qword [rsp+8*2162]
	mov r11,9
	cmp r10,r11
	mov r12, qword [rsp+8*2163]
	mov r12, 0
	setle r12B
	mov qword [rsp+8*2162],r10
	mov qword [rsp+8*2163],r12
	mov r10, qword [rsp+8*2163]
	cmp r10, 0
	mov qword [rsp+8*2163],r10
	je L_652
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*2162]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*2162],r11
	call digt
	mov r10, qword [rsp+8*2164]
	mov r10 , rax
	mov qword [rsp+8*2164],r10
	mov     rsi, [rsp+8*2164]
	mov     rdi, t55
	call    concat
	mov [rsp+8*2165], rax
	mov     rsi, t59
	mov     rdi, [rsp+8*2165]
	call    concat
	mov [rsp+8*2166], rax
	mov r10, qword [rsp+8*2166]
	mov rax,r10
	mov qword [rsp+8*2166],r10
	leave
	ret
	
L_652:
	xor rdx, rdx
	mov r10, qword [rsp+8*2162]
	mov rax, r10
	mov r11,10
	mov rbx, r11
	cdq
	idiv rbx
	mov r12, qword [rsp+8*2167]
	mov r12, rax
	mov qword [rsp+8*2162],r10
	mov qword [rsp+8*2167],r12
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*2167]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*2167],r11
	call digt
	mov r10, qword [rsp+8*2168]
	mov r10 , rax
	mov qword [rsp+8*2168],r10
	mov     rsi, [rsp+8*2168]
	mov     rdi, t61
	call    concat
	mov [rsp+8*2169], rax
	xor rdx, rdx
	mov r10, qword [rsp+8*2162]
	mov rax, r10
	mov r11,10
	mov rbx, r11
	cdq
	idiv rbx
	mov r12, qword [rsp+8*2170]
	mov r12, rdx
	mov qword [rsp+8*2162],r10
	mov qword [rsp+8*2170],r12
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*2170]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*2170],r11
	call digt
	mov r10, qword [rsp+8*2171]
	mov r10 , rax
	mov qword [rsp+8*2171],r10
	mov     rsi, [rsp+8*2171]
	mov     rdi, [rsp+8*2169]
	call    concat
	mov [rsp+8*2172], rax
	mov     rsi, t72
	mov     rdi, [rsp+8*2172]
	call    concat
	mov [rsp+8*2173], rax
	mov r10, qword [rsp+8*2173]
	mov rax,r10
	mov qword [rsp+8*2173],r10
	leave
	ret
	mov r10,0
	mov rax,r10
	leave
	ret
	
c2:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 17568
	mov r10, qword [rsp+8*2174]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*2174],r10
	mov qword [arg+8*0],r11
	mov r10, qword [rsp+8*2174]
	mov r11,9
	cmp r10,r11
	mov r12, qword [rsp+8*2175]
	mov r12, 0
	setle r12B
	mov qword [rsp+8*2174],r10
	mov qword [rsp+8*2175],r12
	mov r10, qword [rsp+8*2175]
	cmp r10, 0
	mov qword [rsp+8*2175],r10
	je L_654
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*2174]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*2174],r11
	call digt
	mov r10, qword [rsp+8*2176]
	mov r10 , rax
	mov qword [rsp+8*2176],r10
	mov     rsi, [rsp+8*2176]
	mov     rdi, t77
	call    concat
	mov [rsp+8*2177], rax
	mov     rsi, t81
	mov     rdi, [rsp+8*2177]
	call    concat
	mov [rsp+8*2178], rax
	mov r10, qword [rsp+8*2178]
	mov rax,r10
	mov qword [rsp+8*2178],r10
	leave
	ret
	
L_654:
	xor rdx, rdx
	mov r10, qword [rsp+8*2174]
	mov rax, r10
	mov r11,10
	mov rbx, r11
	cdq
	idiv rbx
	mov r12, qword [rsp+8*2179]
	mov r12, rax
	mov qword [rsp+8*2174],r10
	mov qword [rsp+8*2179],r12
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*2179]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*2179],r11
	call digt
	mov r10, qword [rsp+8*2180]
	mov r10 , rax
	mov qword [rsp+8*2180],r10
	mov     rsi, [rsp+8*2180]
	mov     rdi, t83
	call    concat
	mov [rsp+8*2181], rax
	xor rdx, rdx
	mov r10, qword [rsp+8*2174]
	mov rax, r10
	mov r11,10
	mov rbx, r11
	cdq
	idiv rbx
	mov r12, qword [rsp+8*2182]
	mov r12, rdx
	mov qword [rsp+8*2174],r10
	mov qword [rsp+8*2182],r12
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*2182]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*2182],r11
	call digt
	mov r10, qword [rsp+8*2183]
	mov r10 , rax
	mov qword [rsp+8*2183],r10
	mov     rsi, [rsp+8*2183]
	mov     rdi, [rsp+8*2181]
	call    concat
	mov [rsp+8*2184], rax
	mov     rsi, t94
	mov     rdi, [rsp+8*2184]
	call    concat
	mov [rsp+8*2185], rax
	mov r10, qword [rsp+8*2185]
	mov rax,r10
	mov qword [rsp+8*2185],r10
	leave
	ret
	mov r10,0
	mov rax,r10
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 17568
	mov     rdi, 256
	call    mallocArray
	mov     qword [gbl+8*2186], rax
	mov r10, qword [gbl+8*190]
	mov r11, qword [gbl+8*2186]
	mov r10,r11
	mov qword [gbl+8*190],r10
	mov qword [gbl+8*2186],r11
	mov     rdi, 256
	call    mallocArray
	mov     qword [gbl+8*2187], rax
	mov r10, qword [gbl+8*3]
	mov r11, qword [gbl+8*2187]
	mov r10,r11
	mov qword [gbl+8*3],r10
	mov qword [gbl+8*2187],r11
	mov r10, qword [gbl+8*2130]
	mov r11,t97
	mov r10,r11
	mov qword [gbl+8*2130],r10
	mov r10, qword [gbl+8*389]
	mov r11,t98
	mov r10,r11
	mov qword [gbl+8*389],r10
	mov r10, qword [gbl+8*2057]
	mov r11,t99
	mov r10,r11
	mov qword [gbl+8*2057],r10
	mov r10, qword [rsp+8*2188]
	mov rax,r10
	mov qword [rsp+8*2188],r10
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   19552
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
	
t485:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[16]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[16]+a2q+c[26]);" ,0

t121:
	 db 1,"&" ,0

t245:
	 db 1,"E" ,0

t365:
	 db 1,"d" ,0

t481:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[15]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[15]+a2q+c[26]);" ,0

t241:
	 db 1,"D" ,0

t361:
	 db 1,"c" ,0

t517:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[24]+a2q+c[26]);" ,0

t357:
	 db 1,"b" ,0

t55:
	 db 2,"s[" ,0

t477:
	 db 119,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[66]+c[71]+c[69]+c[82]+c[7]+c[71]+c[76]+c[82]+c[0]+c[86]+c[8]+c[89]);" ,0

t117:
	 db 1,"%" ,0

t513:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[23]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[23]+a2q+c[26]);" ,0

t237:
	 db 1,"C" ,0

t59:
	 db 2,"]=" ,0

t193:
	 db 1,"8" ,0

t353:
	 db 1,"a" ,0

t473:
	 db 19,"int main(){int i=0;" ,0

t113:
	 db 1,"$" ,0

t233:
	 db 1,"B" ,0

t61:
	 db 2,"s[" ,0

t197:
	 db 1,"9" ,0

t593:
	 db 1,"}" ,0

t229:
	 db 1,"A" ,0

t349:
	 db 1,"`" ,0

t109:
	 db 1,"#" ,0

t505:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[21]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[21]+a2q+c[26]);" ,0

t225:
	 db 1,"@" ,0

t345:
	 db 1,"_" ,0

t469:
	 db 1,"~" ,0

t105:
	 db 1,"!" ,0

t501:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[20]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[20]+a2q+c[26]);" ,0

t589:
	 db 31,"for(i=1;i<31;i++)println(s[i]);" ,0

t509:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[22]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[22]+a2q+c[26]);" ,0

t265:
	 db 1,"J" ,0

t385:
	 db 1,"i" ,0

t421:
	 db 1,"r" ,0

t145:
	 db 1,"," ,0

t541:
	 db 241,"println(c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[81]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[14]+c[16]+c[15]+c[8]+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[4]+c[16]+c[15]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t261:
	 db 1,"I" ,0

t381:
	 db 1,"h" ,0

t72:
	 db 2,"]=" ,0

t141:
	 db 1,"+" ,0

t537:
	 db 206,"println(c[71]+c[68]+c[7]+c[81]+c[81]+c[27]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[81]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t417:
	 db 1,"q" ,0

t137:
	 db 1,"*" ,0

t533:
	 db 113,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[81]+c[17]+c[7]+c[71]+c[76]+c[82]+c[0]+c[81]+c[81]+c[8]+c[89]);" ,0

t77:
	 db 2,"c[" ,0

t257:
	 db 1,"H" ,0

t413:
	 db 1,"p" ,0

t133:
	 db 1,")" ,0

t253:
	 db 1,"G" ,0

t377:
	 db 1,"g" ,0

t497:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[19]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[19]+a2q+c[26]);" ,0

t81:
	 db 2,"]=" ,0

t83:
	 db 2,"c[" ,0

t373:
	 db 1,"f" ,0

t493:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[18]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[18]+a2q+c[26]);" ,0

t405:
	 db 1,"n" ,0

t129:
	 db 1,"(" ,0

t525:
	 db 169,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[59]+c[0]+c[81]+c[28]+c[76]+c[67]+c[85]+c[0]+c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[17]+c[20]+c[21]+c[59]+c[26]);" ,0

t401:
	 db 1,"m" ,0

t489:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[17]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[17]+a2q+c[26]);" ,0

t125:
	 db 1,"'" ,0

t521:
	 db 15,"println(c[91]);" ,0

t249:
	 db 1,"F" ,0

t369:
	 db 1,"e" ,0

t409:
	 db 1,"o" ,0

t529:
	 db 169,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[59]+c[0]+c[65]+c[28]+c[76]+c[67]+c[85]+c[0]+c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[17]+c[20]+c[21]+c[59]+c[26]);" ,0

t281:
	 db 1,"N" ,0

t441:
	 db 1,"w" ,0

t165:
	 db 1,"1" ,0

t561:
	 db 15,"println(c[91]);" ,0

t201:
	 db 1,":" ,0

t289:
	 db 1,"P" ,0

t321:
	 db 1,"X" ,0

t161:
	 db 1,"0" ,0

t94:
	 db 2,"]=" ,0

t285:
	 db 1,"O" ,0

t317:
	 db 1,"W" ,0

t437:
	 db 1,"v" ,0

t98:
	 db 1,"",34,"" ,0

t97:
	 db 1,";" ,0

t313:
	 db 1,"V" ,0

t99:
	 db 1,"",92,"" ,0

t433:
	 db 1,"u" ,0

t557:
	 db 241,"println(c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[65]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[14]+c[16]+c[15]+c[8]+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[4]+c[16]+c[15]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t18:
	 db 1,"0" ,0

t397:
	 db 1,"l" ,0

t157:
	 db 1,"/" ,0

t553:
	 db 206,"println(c[71]+c[68]+c[7]+c[65]+c[65]+c[27]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[65]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t277:
	 db 1,"M" ,0

t393:
	 db 1,"k" ,0

t153:
	 db 1,"." ,0

t273:
	 db 1,"L" ,0

t305:
	 db 1,"T" ,0

t21:
	 db 1,"1" ,0

t429:
	 db 1,"t" ,0

t549:
	 db 113,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[65]+c[17]+c[7]+c[71]+c[76]+c[82]+c[0]+c[65]+c[65]+c[8]+c[89]);" ,0

t269:
	 db 1,"K" ,0

t301:
	 db 1,"S" ,0

t389:
	 db 1,"j" ,0

t425:
	 db 1,"s" ,0

t24:
	 db 1,"2" ,0

t149:
	 db 1,"-" ,0

t545:
	 db 15,"println(c[91]);" ,0

t27:
	 db 1,"3" ,0

t309:
	 db 1,"U" ,0

t181:
	 db 1,"5" ,0

t221:
	 db 1,"?" ,0

t341:
	 db 1,"^" ,0

t465:
	 db 1,"}" ,0

t101:
	 db 1," " ,0

t189:
	 db 1,"7" ,0

t585:
	 db 48,"for(i=0;i<31;i++)println(s2(i)+a2q+s[i]+a2q+co);" ,0

t461:
	 db 1,"|" ,0

t185:
	 db 1,"6" ,0

t581:
	 db 48,"for(i=0;i<93;i++)println(c2(i)+a2q+c[i]+a2q+co);" ,0

t30:
	 db 1,"4" ,0

t217:
	 db 1,">" ,0

t577:
	 db 14,"println(s[0]);" ,0

t33:
	 db 1,"5" ,0

t213:
	 db 1,"=" ,0

t36:
	 db 1,"6" ,0

t337:
	 db 1,"]" ,0

t457:
	 db 1,"{" ,0

t39:
	 db 1,"7" ,0

t177:
	 db 1,"4" ,0

t573:
	 db 96,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[63]+c[17]+c[64]+c[28]+a2q+a2b+a2b+a2q+c[26]);" ,0

t297:
	 db 1,"R" ,0

t333:
	 db 1,"[" ,0

t453:
	 db 1,"z" ,0

t173:
	 db 1,"3" ,0

t293:
	 db 1,"Q" ,0

t449:
	 db 1,"y" ,0

t569:
	 db 96,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[63]+c[17]+c[79]+c[28]+a2q+a2b+a2q+a2q+c[26]);" ,0

t209:
	 db 1,"<" ,0

t42:
	 db 1,"8" ,0

t329:
	 db 1,"Z" ,0

t45:
	 db 1,"9" ,0

t445:
	 db 1,"x" ,0

t169:
	 db 1,"2" ,0

t565:
	 db 88,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[65]+c[77]+c[28]+a2q+c[26]+a2q+c[26]);" ,0

t205:
	 db 1,";" ,0

t325:
	 db 1,"Y" ,0


