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
	sub    rsp, 2416
	call global_init
	mov r10, qword [rsp+8*1]
	mov r10 , rax
	mov qword [rsp+8*1],r10
	mov r10, qword [rsp+8*2]
	mov r11,102
	mov r10,r11
	mov qword [rsp+8*2],r10
	mov r10, qword [rsp+8*3]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*3],r10
	mov r10, qword [rsp+8*4]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*4],r10
	mov r10, qword [rsp+8*5]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*5],r10
	mov r10, qword [rsp+8*6]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*6],r10
	mov r10, qword [rsp+8*7]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov r12,1
	sub r10,r12
	mov qword [rsp+8*7],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [rsp+8*8]
	mov r11, qword [rsp+8*7]
	mov r10,r11
	mov qword [rsp+8*8],r10
	mov qword [rsp+8*7],r11
	mov r10, qword [rsp+8*9]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov r12,1
	sub r10,r12
	mov qword [rsp+8*9],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [rsp+8*10]
	mov r11, qword [rsp+8*9]
	mov r10,r11
	mov qword [rsp+8*10],r10
	mov qword [rsp+8*9],r11
	mov r10, qword [rsp+8*11]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*11],r10
	mov r10, qword [rsp+8*12]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*12],r10
	mov r10, qword [rsp+8*13]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*13],r10
	mov r10, qword [rsp+8*14]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*14],r10
	mov r10, qword [rsp+8*15]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	imul r10,r11
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*2],r11
	mov     rdi, [rsp+8*15]
	call    mallocArray
	mov     qword [rsp+8*16], rax
	mov r10, qword [rsp+8*17]
	mov r11, qword [rsp+8*16]
	mov r10,r11
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*16],r11
	mov r10, qword [rsp+8*18]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*18],r10
	
L_211:
	mov r10, qword [rsp+8*19]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	imul r10,r11
	mov qword [rsp+8*19],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [rsp+8*18]
	mov r11, qword [rsp+8*19]
	cmp r10,r11
	mov r12, qword [rsp+8*20]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*18],r10
	mov qword [rsp+8*19],r11
	mov qword [rsp+8*20],r12
	mov r10, qword [rsp+8*20]
	cmp r10, 0
	mov qword [rsp+8*20],r10
	je L_212
	mov r10, qword [rsp+8*21]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*21],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*18]
	mov     rdi, [rsp+8*21]
	call    address
	mov [rsp+8*22], rax
	mov r10, qword [rsp+8*22]
	mov r11,0
	mov [r10],r11
	mov qword [rsp+8*22],r10
	
L_213:
	mov r10, qword [rsp+8*23]
	mov r11, qword [rsp+8*18]
	mov r10,r11
	mov qword [rsp+8*23],r10
	mov qword [rsp+8*18],r11
	mov r10, qword [rsp+8*18]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*18],r10
	jmp L_211
	
L_212:
	mov r10, qword [rsp+8*24]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	imul r10,r11
	mov qword [rsp+8*24],r10
	mov qword [rsp+8*2],r11
	mov     rdi, [rsp+8*24]
	call    mallocArray
	mov     qword [rsp+8*25], rax
	mov r10, qword [rsp+8*26]
	mov r11, qword [rsp+8*25]
	mov r10,r11
	mov qword [rsp+8*26],r10
	mov qword [rsp+8*25],r11
	mov r10, qword [rsp+8*18]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*18],r10
	
L_214:
	mov r10, qword [rsp+8*27]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	imul r10,r11
	mov qword [rsp+8*27],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [rsp+8*18]
	mov r11, qword [rsp+8*27]
	cmp r10,r11
	mov r12, qword [rsp+8*28]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*18],r10
	mov qword [rsp+8*27],r11
	mov qword [rsp+8*28],r12
	mov r10, qword [rsp+8*28]
	cmp r10, 0
	mov qword [rsp+8*28],r10
	je L_215
	mov r10, qword [rsp+8*29]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*29],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*18]
	mov     rdi, [rsp+8*29]
	call    address
	mov [rsp+8*30], rax
	mov r10, qword [rsp+8*30]
	mov r11,0
	mov [r10],r11
	mov qword [rsp+8*30],r10
	
L_216:
	mov r10, qword [rsp+8*31]
	mov r11, qword [rsp+8*18]
	mov r10,r11
	mov qword [rsp+8*31],r10
	mov qword [rsp+8*18],r11
	mov r10, qword [rsp+8*18]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*18],r10
	jmp L_214
	
L_215:
	mov     rdi, [rsp+8*2]
	call    mallocArray
	mov     qword [rsp+8*32], rax
	mov r10, qword [rsp+8*33]
	mov r11, qword [rsp+8*32]
	mov r10,r11
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*32],r11
	mov r10, qword [rsp+8*18]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*18],r10
	
L_217:
	mov r10, qword [rsp+8*18]
	mov r11, qword [rsp+8*2]
	cmp r10,r11
	mov r12, qword [rsp+8*34]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*18],r10
	mov qword [rsp+8*2],r11
	mov qword [rsp+8*34],r12
	mov r10, qword [rsp+8*34]
	cmp r10, 0
	mov qword [rsp+8*34],r10
	je L_218
	mov     rdi, [rsp+8*2]
	call    mallocArray
	mov     qword [rsp+8*35], rax
	mov r10, qword [rsp+8*36]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*36],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*18]
	mov     rdi, [rsp+8*36]
	call    address
	mov [rsp+8*37], rax
	mov r10, qword [rsp+8*37]
	mov r11, qword [rsp+8*35]
	mov [r10],r11
	mov qword [rsp+8*37],r10
	mov qword [rsp+8*35],r11
	mov r10, qword [rsp+8*38]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*38],r10
	
L_220:
	mov r10, qword [rsp+8*38]
	mov r11, qword [rsp+8*2]
	cmp r10,r11
	mov r12, qword [rsp+8*39]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*38],r10
	mov qword [rsp+8*2],r11
	mov qword [rsp+8*39],r12
	mov r10, qword [rsp+8*39]
	cmp r10, 0
	mov qword [rsp+8*39],r10
	je L_221
	mov r10, qword [rsp+8*40]
	mov r11,1
	mov r10,r11
	neg r10
	mov qword [rsp+8*40],r10
	mov r10, qword [rsp+8*41]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*41],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*18]
	mov     rdi, [rsp+8*41]
	call    address
	mov [rsp+8*42], rax
	mov r10, qword [rsp+8*41]
	mov r11, qword [rsp+8*42]
	mov r10, [r11]
	mov qword [rsp+8*41],r10
	mov qword [rsp+8*42],r11
	mov     rsi, [rsp+8*38]
	mov     rdi, [rsp+8*41]
	call    address
	mov [rsp+8*42], rax
	mov r10, qword [rsp+8*42]
	mov r11, qword [rsp+8*40]
	mov [r10],r11
	mov qword [rsp+8*42],r10
	mov qword [rsp+8*40],r11
	
L_222:
	mov r10, qword [rsp+8*43]
	mov r11, qword [rsp+8*38]
	mov r10,r11
	mov qword [rsp+8*43],r10
	mov qword [rsp+8*38],r11
	mov r10, qword [rsp+8*38]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*38],r10
	jmp L_220
	
L_221:
	
L_219:
	mov r10, qword [rsp+8*44]
	mov r11, qword [rsp+8*18]
	mov r10,r11
	mov qword [rsp+8*44],r10
	mov qword [rsp+8*18],r11
	mov r10, qword [rsp+8*18]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*18],r10
	jmp L_217
	
L_218:
	mov r10, qword [rsp+8*45]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*45],r10
	mov qword [rsp+8*17],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*45]
	call    address
	mov [rsp+8*46], rax
	mov r10, qword [rsp+8*46]
	mov r11, qword [rsp+8*5]
	mov [r10],r11
	mov qword [rsp+8*46],r10
	mov qword [rsp+8*5],r11
	mov r10, qword [rsp+8*47]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*47],r10
	mov qword [rsp+8*26],r11
	mov     rsi, 0
	mov     rdi, [rsp+8*47]
	call    address
	mov [rsp+8*48], rax
	mov r10, qword [rsp+8*48]
	mov r11, qword [rsp+8*6]
	mov [r10],r11
	mov qword [rsp+8*48],r10
	mov qword [rsp+8*6],r11
	mov r10, qword [rsp+8*49]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*49],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*5]
	mov     rdi, [rsp+8*49]
	call    address
	mov [rsp+8*50], rax
	mov r10, qword [rsp+8*49]
	mov r11, qword [rsp+8*50]
	mov r10, [r11]
	mov qword [rsp+8*49],r10
	mov qword [rsp+8*50],r11
	mov     rsi, [rsp+8*6]
	mov     rdi, [rsp+8*49]
	call    address
	mov [rsp+8*50], rax
	mov r10, qword [rsp+8*50]
	mov r11,0
	mov [r10],r11
	mov qword [rsp+8*50],r10
	
L_223:
	mov r10, qword [rsp+8*3]
	mov r11, qword [rsp+8*4]
	cmp r10,r11
	mov r12, qword [rsp+8*51]
	mov r12, 0
	setle r12B
	mov qword [rsp+8*3],r10
	mov qword [rsp+8*4],r11
	mov qword [rsp+8*51],r12
	mov r10, qword [rsp+8*51]
	cmp r10, 0
	mov qword [rsp+8*51],r10
	je L_224
	mov r10, qword [rsp+8*52]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*52]
	call    address
	mov [rsp+8*53], rax
	mov r10, qword [rsp+8*54]
	mov r11, qword [rsp+8*53]
	mov r10, [r11]
	mov qword [rsp+8*54],r10
	mov qword [rsp+8*53],r11
	mov r10, qword [rsp+8*55]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*55]
	call    address
	mov [rsp+8*56], rax
	mov r10, qword [rsp+8*57]
	mov r11, qword [rsp+8*56]
	mov r10, [r11]
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*56],r11
	mov r10, qword [rsp+8*58]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*58],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*54]
	mov     rdi, [rsp+8*58]
	call    address
	mov [rsp+8*59], rax
	mov r10, qword [rsp+8*58]
	mov r11, qword [rsp+8*59]
	mov r10, [r11]
	mov qword [rsp+8*58],r10
	mov qword [rsp+8*59],r11
	mov     rsi, [rsp+8*57]
	mov     rdi, [rsp+8*58]
	call    address
	mov [rsp+8*59], rax
	mov r10, qword [rsp+8*60]
	mov r11, qword [rsp+8*59]
	mov r10, [r11]
	mov qword [rsp+8*60],r10
	mov qword [rsp+8*59],r11
	mov r10, qword [rsp+8*13]
	mov r11, qword [rsp+8*60]
	mov r10,r11
	mov qword [rsp+8*13],r10
	mov qword [rsp+8*60],r11
	mov r10, qword [rsp+8*61]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*61],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*61]
	call    address
	mov [rsp+8*62], rax
	mov r10, qword [rsp+8*63]
	mov r11, qword [rsp+8*62]
	mov r10, [r11]
	mov qword [rsp+8*63],r10
	mov qword [rsp+8*62],r11
	mov r10, qword [rsp+8*64]
	mov r11, qword [rsp+8*63]
	mov r10,r11
	mov r12,1
	sub r10,r12
	mov qword [rsp+8*64],r10
	mov qword [rsp+8*63],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*64]
	mov r10,r11
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*64],r11
	mov r10, qword [rsp+8*65]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*65],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*65]
	call    address
	mov [rsp+8*66], rax
	mov r10, qword [rsp+8*67]
	mov r11, qword [rsp+8*66]
	mov r10, [r11]
	mov qword [rsp+8*67],r10
	mov qword [rsp+8*66],r11
	mov r10, qword [rsp+8*68]
	mov r11, qword [rsp+8*67]
	mov r10,r11
	mov r12,2
	sub r10,r12
	mov qword [rsp+8*68],r10
	mov qword [rsp+8*67],r11
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*68]
	mov r10,r11
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*68],r11
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*11]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*11],r11
	call check
	mov r10, qword [rsp+8*71]
	mov r10 , rax
	mov qword [rsp+8*71],r10
	mov r10, qword [rsp+8*71]
	cmp r10, 0
	mov qword [rsp+8*71],r10
	jne L_225
	mov r10, qword [rsp+8*72]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*72],r10
	jmp L_226
	
L_225:
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*12],r11
	call check
	mov r10, qword [rsp+8*73]
	mov r10 , rax
	mov qword [rsp+8*73],r10
	mov r10, qword [rsp+8*72]
	mov r11, qword [rsp+8*73]
	mov r10,r11
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r11
	
L_226:
	mov r10, qword [rsp+8*72]
	cmp r10, 0
	mov qword [rsp+8*72],r10
	je L_228
	mov r10, qword [rsp+8*74]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*74]
	call    address
	mov [rsp+8*75], rax
	mov r10, qword [rsp+8*74]
	mov r11, qword [rsp+8*75]
	mov r10, [r11]
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*75],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*74]
	call    address
	mov [rsp+8*75], rax
	mov r10, qword [rsp+8*76]
	mov r11, qword [rsp+8*75]
	mov r10, [r11]
	mov qword [rsp+8*76],r10
	mov qword [rsp+8*75],r11
	mov r10, qword [rsp+8*77]
	mov r11,1
	mov r10,r11
	neg r10
	mov qword [rsp+8*77],r10
	mov r10, qword [rsp+8*76]
	mov r11, qword [rsp+8*77]
	cmp r10,r11
	mov r12, qword [rsp+8*78]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*76],r10
	mov qword [rsp+8*77],r11
	mov qword [rsp+8*78],r12
	mov r10, qword [rsp+8*78]
	cmp r10, 0
	mov qword [rsp+8*78],r10
	je L_230
	mov r10, qword [rsp+8*79]
	mov r11, qword [rsp+8*4]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*79],r10
	mov qword [rsp+8*4],r11
	mov r10, qword [rsp+8*4]
	mov r11, qword [rsp+8*79]
	mov r10,r11
	mov qword [rsp+8*4],r10
	mov qword [rsp+8*79],r11
	mov r10, qword [rsp+8*80]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*80],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*80]
	call    address
	mov [rsp+8*81], rax
	mov r10, qword [rsp+8*81]
	mov r11, qword [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*81],r10
	mov qword [rsp+8*11],r11
	mov r10, qword [rsp+8*82]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*82],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*82]
	call    address
	mov [rsp+8*83], rax
	mov r10, qword [rsp+8*83]
	mov r11, qword [rsp+8*12]
	mov [r10],r11
	mov qword [rsp+8*83],r10
	mov qword [rsp+8*12],r11
	mov r10, qword [rsp+8*84]
	mov r11, qword [rsp+8*13]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*84],r10
	mov qword [rsp+8*13],r11
	mov r10, qword [rsp+8*85]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*85],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*85]
	call    address
	mov [rsp+8*86], rax
	mov r10, qword [rsp+8*85]
	mov r11, qword [rsp+8*86]
	mov r10, [r11]
	mov qword [rsp+8*85],r10
	mov qword [rsp+8*86],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*85]
	call    address
	mov [rsp+8*86], rax
	mov r10, qword [rsp+8*86]
	mov r11, qword [rsp+8*84]
	mov [r10],r11
	mov qword [rsp+8*86],r10
	mov qword [rsp+8*84],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, qword [rsp+8*87]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*8],r11
	mov qword [rsp+8*87],r12
	mov r10, qword [rsp+8*87]
	cmp r10, 0
	mov qword [rsp+8*87],r10
	jne L_231
	mov r10, qword [rsp+8*88]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*88],r10
	jmp L_232
	
L_231:
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*10]
	cmp r10,r11
	mov r12, qword [rsp+8*89]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*10],r11
	mov qword [rsp+8*89],r12
	mov r10, qword [rsp+8*88]
	mov r11, qword [rsp+8*89]
	mov r10,r11
	mov qword [rsp+8*88],r10
	mov qword [rsp+8*89],r11
	
L_232:
	mov r10, qword [rsp+8*88]
	cmp r10, 0
	mov qword [rsp+8*88],r10
	je L_234
	mov r10, qword [rsp+8*14]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*14],r10
	
L_234:
	
L_230:
	
L_228:
	mov r10, qword [rsp+8*90]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*90],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*90]
	call    address
	mov [rsp+8*91], rax
	mov r10, qword [rsp+8*92]
	mov r11, qword [rsp+8*91]
	mov r10, [r11]
	mov qword [rsp+8*92],r10
	mov qword [rsp+8*91],r11
	mov r10, qword [rsp+8*93]
	mov r11, qword [rsp+8*92]
	mov r10,r11
	mov r12,1
	sub r10,r12
	mov qword [rsp+8*93],r10
	mov qword [rsp+8*92],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*93]
	mov r10,r11
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*93],r11
	mov r10, qword [rsp+8*94]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*94],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*94]
	call    address
	mov [rsp+8*95], rax
	mov r10, qword [rsp+8*96]
	mov r11, qword [rsp+8*95]
	mov r10, [r11]
	mov qword [rsp+8*96],r10
	mov qword [rsp+8*95],r11
	mov r10, qword [rsp+8*97]
	mov r11, qword [rsp+8*96]
	mov r10,r11
	mov r12,2
	add r10,r12
	mov qword [rsp+8*97],r10
	mov qword [rsp+8*96],r11
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*97]
	mov r10,r11
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*97],r11
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*11]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*11],r11
	call check
	mov r10, qword [rsp+8*98]
	mov r10 , rax
	mov qword [rsp+8*98],r10
	mov r10, qword [rsp+8*98]
	cmp r10, 0
	mov qword [rsp+8*98],r10
	jne L_235
	mov r10, qword [rsp+8*99]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*99],r10
	jmp L_236
	
L_235:
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*12],r11
	call check
	mov r10, qword [rsp+8*100]
	mov r10 , rax
	mov qword [rsp+8*100],r10
	mov r10, qword [rsp+8*99]
	mov r11, qword [rsp+8*100]
	mov r10,r11
	mov qword [rsp+8*99],r10
	mov qword [rsp+8*100],r11
	
L_236:
	mov r10, qword [rsp+8*99]
	cmp r10, 0
	mov qword [rsp+8*99],r10
	je L_238
	mov r10, qword [rsp+8*101]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*101],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*101]
	call    address
	mov [rsp+8*102], rax
	mov r10, qword [rsp+8*101]
	mov r11, qword [rsp+8*102]
	mov r10, [r11]
	mov qword [rsp+8*101],r10
	mov qword [rsp+8*102],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*101]
	call    address
	mov [rsp+8*102], rax
	mov r10, qword [rsp+8*103]
	mov r11, qword [rsp+8*102]
	mov r10, [r11]
	mov qword [rsp+8*103],r10
	mov qword [rsp+8*102],r11
	mov r10, qword [rsp+8*104]
	mov r11,1
	mov r10,r11
	neg r10
	mov qword [rsp+8*104],r10
	mov r10, qword [rsp+8*103]
	mov r11, qword [rsp+8*104]
	cmp r10,r11
	mov r12, qword [rsp+8*105]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*103],r10
	mov qword [rsp+8*104],r11
	mov qword [rsp+8*105],r12
	mov r10, qword [rsp+8*105]
	cmp r10, 0
	mov qword [rsp+8*105],r10
	je L_240
	mov r10, qword [rsp+8*106]
	mov r11, qword [rsp+8*4]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*106],r10
	mov qword [rsp+8*4],r11
	mov r10, qword [rsp+8*4]
	mov r11, qword [rsp+8*106]
	mov r10,r11
	mov qword [rsp+8*4],r10
	mov qword [rsp+8*106],r11
	mov r10, qword [rsp+8*107]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*107]
	call    address
	mov [rsp+8*108], rax
	mov r10, qword [rsp+8*108]
	mov r11, qword [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*108],r10
	mov qword [rsp+8*11],r11
	mov r10, qword [rsp+8*109]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*109],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*109]
	call    address
	mov [rsp+8*110], rax
	mov r10, qword [rsp+8*110]
	mov r11, qword [rsp+8*12]
	mov [r10],r11
	mov qword [rsp+8*110],r10
	mov qword [rsp+8*12],r11
	mov r10, qword [rsp+8*111]
	mov r11, qword [rsp+8*13]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*111],r10
	mov qword [rsp+8*13],r11
	mov r10, qword [rsp+8*112]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*112],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*112]
	call    address
	mov [rsp+8*113], rax
	mov r10, qword [rsp+8*112]
	mov r11, qword [rsp+8*113]
	mov r10, [r11]
	mov qword [rsp+8*112],r10
	mov qword [rsp+8*113],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*112]
	call    address
	mov [rsp+8*113], rax
	mov r10, qword [rsp+8*113]
	mov r11, qword [rsp+8*111]
	mov [r10],r11
	mov qword [rsp+8*113],r10
	mov qword [rsp+8*111],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, qword [rsp+8*114]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*8],r11
	mov qword [rsp+8*114],r12
	mov r10, qword [rsp+8*114]
	cmp r10, 0
	mov qword [rsp+8*114],r10
	jne L_241
	mov r10, qword [rsp+8*115]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*115],r10
	jmp L_242
	
L_241:
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*10]
	cmp r10,r11
	mov r12, qword [rsp+8*116]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*10],r11
	mov qword [rsp+8*116],r12
	mov r10, qword [rsp+8*115]
	mov r11, qword [rsp+8*116]
	mov r10,r11
	mov qword [rsp+8*115],r10
	mov qword [rsp+8*116],r11
	
L_242:
	mov r10, qword [rsp+8*115]
	cmp r10, 0
	mov qword [rsp+8*115],r10
	je L_244
	mov r10, qword [rsp+8*14]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*14],r10
	
L_244:
	
L_240:
	
L_238:
	mov r10, qword [rsp+8*117]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*117],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*117]
	call    address
	mov [rsp+8*118], rax
	mov r10, qword [rsp+8*119]
	mov r11, qword [rsp+8*118]
	mov r10, [r11]
	mov qword [rsp+8*119],r10
	mov qword [rsp+8*118],r11
	mov r10, qword [rsp+8*120]
	mov r11, qword [rsp+8*119]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*120],r10
	mov qword [rsp+8*119],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*120]
	mov r10,r11
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*120],r11
	mov r10, qword [rsp+8*121]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*121],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*121]
	call    address
	mov [rsp+8*122], rax
	mov r10, qword [rsp+8*123]
	mov r11, qword [rsp+8*122]
	mov r10, [r11]
	mov qword [rsp+8*123],r10
	mov qword [rsp+8*122],r11
	mov r10, qword [rsp+8*124]
	mov r11, qword [rsp+8*123]
	mov r10,r11
	mov r12,2
	sub r10,r12
	mov qword [rsp+8*124],r10
	mov qword [rsp+8*123],r11
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*124]
	mov r10,r11
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*124],r11
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*11]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*11],r11
	call check
	mov r10, qword [rsp+8*125]
	mov r10 , rax
	mov qword [rsp+8*125],r10
	mov r10, qword [rsp+8*125]
	cmp r10, 0
	mov qword [rsp+8*125],r10
	jne L_245
	mov r10, qword [rsp+8*126]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*126],r10
	jmp L_246
	
L_245:
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*12],r11
	call check
	mov r10, qword [rsp+8*127]
	mov r10 , rax
	mov qword [rsp+8*127],r10
	mov r10, qword [rsp+8*126]
	mov r11, qword [rsp+8*127]
	mov r10,r11
	mov qword [rsp+8*126],r10
	mov qword [rsp+8*127],r11
	
L_246:
	mov r10, qword [rsp+8*126]
	cmp r10, 0
	mov qword [rsp+8*126],r10
	je L_248
	mov r10, qword [rsp+8*128]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*128],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*128]
	call    address
	mov [rsp+8*129], rax
	mov r10, qword [rsp+8*128]
	mov r11, qword [rsp+8*129]
	mov r10, [r11]
	mov qword [rsp+8*128],r10
	mov qword [rsp+8*129],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*128]
	call    address
	mov [rsp+8*129], rax
	mov r10, qword [rsp+8*130]
	mov r11, qword [rsp+8*129]
	mov r10, [r11]
	mov qword [rsp+8*130],r10
	mov qword [rsp+8*129],r11
	mov r10, qword [rsp+8*131]
	mov r11,1
	mov r10,r11
	neg r10
	mov qword [rsp+8*131],r10
	mov r10, qword [rsp+8*130]
	mov r11, qword [rsp+8*131]
	cmp r10,r11
	mov r12, qword [rsp+8*132]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*130],r10
	mov qword [rsp+8*131],r11
	mov qword [rsp+8*132],r12
	mov r10, qword [rsp+8*132]
	cmp r10, 0
	mov qword [rsp+8*132],r10
	je L_250
	mov r10, qword [rsp+8*133]
	mov r11, qword [rsp+8*4]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*133],r10
	mov qword [rsp+8*4],r11
	mov r10, qword [rsp+8*4]
	mov r11, qword [rsp+8*133]
	mov r10,r11
	mov qword [rsp+8*4],r10
	mov qword [rsp+8*133],r11
	mov r10, qword [rsp+8*134]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*134],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*134]
	call    address
	mov [rsp+8*135], rax
	mov r10, qword [rsp+8*135]
	mov r11, qword [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*135],r10
	mov qword [rsp+8*11],r11
	mov r10, qword [rsp+8*136]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*136],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*136]
	call    address
	mov [rsp+8*137], rax
	mov r10, qword [rsp+8*137]
	mov r11, qword [rsp+8*12]
	mov [r10],r11
	mov qword [rsp+8*137],r10
	mov qword [rsp+8*12],r11
	mov r10, qword [rsp+8*138]
	mov r11, qword [rsp+8*13]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*138],r10
	mov qword [rsp+8*13],r11
	mov r10, qword [rsp+8*139]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*139],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*139]
	call    address
	mov [rsp+8*140], rax
	mov r10, qword [rsp+8*139]
	mov r11, qword [rsp+8*140]
	mov r10, [r11]
	mov qword [rsp+8*139],r10
	mov qword [rsp+8*140],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*139]
	call    address
	mov [rsp+8*140], rax
	mov r10, qword [rsp+8*140]
	mov r11, qword [rsp+8*138]
	mov [r10],r11
	mov qword [rsp+8*140],r10
	mov qword [rsp+8*138],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, qword [rsp+8*141]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*8],r11
	mov qword [rsp+8*141],r12
	mov r10, qword [rsp+8*141]
	cmp r10, 0
	mov qword [rsp+8*141],r10
	jne L_251
	mov r10, qword [rsp+8*142]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*142],r10
	jmp L_252
	
L_251:
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*10]
	cmp r10,r11
	mov r12, qword [rsp+8*143]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*10],r11
	mov qword [rsp+8*143],r12
	mov r10, qword [rsp+8*142]
	mov r11, qword [rsp+8*143]
	mov r10,r11
	mov qword [rsp+8*142],r10
	mov qword [rsp+8*143],r11
	
L_252:
	mov r10, qword [rsp+8*142]
	cmp r10, 0
	mov qword [rsp+8*142],r10
	je L_254
	mov r10, qword [rsp+8*14]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*14],r10
	
L_254:
	
L_250:
	
L_248:
	mov r10, qword [rsp+8*144]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*144],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*144]
	call    address
	mov [rsp+8*145], rax
	mov r10, qword [rsp+8*146]
	mov r11, qword [rsp+8*145]
	mov r10, [r11]
	mov qword [rsp+8*146],r10
	mov qword [rsp+8*145],r11
	mov r10, qword [rsp+8*147]
	mov r11, qword [rsp+8*146]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*147],r10
	mov qword [rsp+8*146],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*147]
	mov r10,r11
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*147],r11
	mov r10, qword [rsp+8*148]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*148],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*148]
	call    address
	mov [rsp+8*149], rax
	mov r10, qword [rsp+8*150]
	mov r11, qword [rsp+8*149]
	mov r10, [r11]
	mov qword [rsp+8*150],r10
	mov qword [rsp+8*149],r11
	mov r10, qword [rsp+8*151]
	mov r11, qword [rsp+8*150]
	mov r10,r11
	mov r12,2
	add r10,r12
	mov qword [rsp+8*151],r10
	mov qword [rsp+8*150],r11
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*151]
	mov r10,r11
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*151],r11
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*11]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*11],r11
	call check
	mov r10, qword [rsp+8*152]
	mov r10 , rax
	mov qword [rsp+8*152],r10
	mov r10, qword [rsp+8*152]
	cmp r10, 0
	mov qword [rsp+8*152],r10
	jne L_255
	mov r10, qword [rsp+8*153]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*153],r10
	jmp L_256
	
L_255:
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*12],r11
	call check
	mov r10, qword [rsp+8*154]
	mov r10 , rax
	mov qword [rsp+8*154],r10
	mov r10, qword [rsp+8*153]
	mov r11, qword [rsp+8*154]
	mov r10,r11
	mov qword [rsp+8*153],r10
	mov qword [rsp+8*154],r11
	
L_256:
	mov r10, qword [rsp+8*153]
	cmp r10, 0
	mov qword [rsp+8*153],r10
	je L_258
	mov r10, qword [rsp+8*155]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*155],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*155]
	call    address
	mov [rsp+8*156], rax
	mov r10, qword [rsp+8*155]
	mov r11, qword [rsp+8*156]
	mov r10, [r11]
	mov qword [rsp+8*155],r10
	mov qword [rsp+8*156],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*155]
	call    address
	mov [rsp+8*156], rax
	mov r10, qword [rsp+8*157]
	mov r11, qword [rsp+8*156]
	mov r10, [r11]
	mov qword [rsp+8*157],r10
	mov qword [rsp+8*156],r11
	mov r10, qword [rsp+8*158]
	mov r11,1
	mov r10,r11
	neg r10
	mov qword [rsp+8*158],r10
	mov r10, qword [rsp+8*157]
	mov r11, qword [rsp+8*158]
	cmp r10,r11
	mov r12, qword [rsp+8*159]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*157],r10
	mov qword [rsp+8*158],r11
	mov qword [rsp+8*159],r12
	mov r10, qword [rsp+8*159]
	cmp r10, 0
	mov qword [rsp+8*159],r10
	je L_260
	mov r10, qword [rsp+8*160]
	mov r11, qword [rsp+8*4]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*160],r10
	mov qword [rsp+8*4],r11
	mov r10, qword [rsp+8*4]
	mov r11, qword [rsp+8*160]
	mov r10,r11
	mov qword [rsp+8*4],r10
	mov qword [rsp+8*160],r11
	mov r10, qword [rsp+8*161]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*161],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*161]
	call    address
	mov [rsp+8*162], rax
	mov r10, qword [rsp+8*162]
	mov r11, qword [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*162],r10
	mov qword [rsp+8*11],r11
	mov r10, qword [rsp+8*163]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*163],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*163]
	call    address
	mov [rsp+8*164], rax
	mov r10, qword [rsp+8*164]
	mov r11, qword [rsp+8*12]
	mov [r10],r11
	mov qword [rsp+8*164],r10
	mov qword [rsp+8*12],r11
	mov r10, qword [rsp+8*165]
	mov r11, qword [rsp+8*13]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*165],r10
	mov qword [rsp+8*13],r11
	mov r10, qword [rsp+8*166]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*166],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*166]
	call    address
	mov [rsp+8*167], rax
	mov r10, qword [rsp+8*166]
	mov r11, qword [rsp+8*167]
	mov r10, [r11]
	mov qword [rsp+8*166],r10
	mov qword [rsp+8*167],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*166]
	call    address
	mov [rsp+8*167], rax
	mov r10, qword [rsp+8*167]
	mov r11, qword [rsp+8*165]
	mov [r10],r11
	mov qword [rsp+8*167],r10
	mov qword [rsp+8*165],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, qword [rsp+8*168]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*8],r11
	mov qword [rsp+8*168],r12
	mov r10, qword [rsp+8*168]
	cmp r10, 0
	mov qword [rsp+8*168],r10
	jne L_261
	mov r10, qword [rsp+8*169]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*169],r10
	jmp L_262
	
L_261:
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*10]
	cmp r10,r11
	mov r12, qword [rsp+8*170]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*10],r11
	mov qword [rsp+8*170],r12
	mov r10, qword [rsp+8*169]
	mov r11, qword [rsp+8*170]
	mov r10,r11
	mov qword [rsp+8*169],r10
	mov qword [rsp+8*170],r11
	
L_262:
	mov r10, qword [rsp+8*169]
	cmp r10, 0
	mov qword [rsp+8*169],r10
	je L_264
	mov r10, qword [rsp+8*14]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*14],r10
	
L_264:
	
L_260:
	
L_258:
	mov r10, qword [rsp+8*171]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*171],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*171]
	call    address
	mov [rsp+8*172], rax
	mov r10, qword [rsp+8*173]
	mov r11, qword [rsp+8*172]
	mov r10, [r11]
	mov qword [rsp+8*173],r10
	mov qword [rsp+8*172],r11
	mov r10, qword [rsp+8*174]
	mov r11, qword [rsp+8*173]
	mov r10,r11
	mov r12,2
	sub r10,r12
	mov qword [rsp+8*174],r10
	mov qword [rsp+8*173],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*174]
	mov r10,r11
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*174],r11
	mov r10, qword [rsp+8*175]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*175],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*175]
	call    address
	mov [rsp+8*176], rax
	mov r10, qword [rsp+8*177]
	mov r11, qword [rsp+8*176]
	mov r10, [r11]
	mov qword [rsp+8*177],r10
	mov qword [rsp+8*176],r11
	mov r10, qword [rsp+8*178]
	mov r11, qword [rsp+8*177]
	mov r10,r11
	mov r12,1
	sub r10,r12
	mov qword [rsp+8*178],r10
	mov qword [rsp+8*177],r11
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*178]
	mov r10,r11
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*178],r11
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*11]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*11],r11
	call check
	mov r10, qword [rsp+8*179]
	mov r10 , rax
	mov qword [rsp+8*179],r10
	mov r10, qword [rsp+8*179]
	cmp r10, 0
	mov qword [rsp+8*179],r10
	jne L_265
	mov r10, qword [rsp+8*180]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*180],r10
	jmp L_266
	
L_265:
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*12],r11
	call check
	mov r10, qword [rsp+8*181]
	mov r10 , rax
	mov qword [rsp+8*181],r10
	mov r10, qword [rsp+8*180]
	mov r11, qword [rsp+8*181]
	mov r10,r11
	mov qword [rsp+8*180],r10
	mov qword [rsp+8*181],r11
	
L_266:
	mov r10, qword [rsp+8*180]
	cmp r10, 0
	mov qword [rsp+8*180],r10
	je L_268
	mov r10, qword [rsp+8*182]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*182],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*182]
	call    address
	mov [rsp+8*183], rax
	mov r10, qword [rsp+8*182]
	mov r11, qword [rsp+8*183]
	mov r10, [r11]
	mov qword [rsp+8*182],r10
	mov qword [rsp+8*183],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*182]
	call    address
	mov [rsp+8*183], rax
	mov r10, qword [rsp+8*184]
	mov r11, qword [rsp+8*183]
	mov r10, [r11]
	mov qword [rsp+8*184],r10
	mov qword [rsp+8*183],r11
	mov r10, qword [rsp+8*185]
	mov r11,1
	mov r10,r11
	neg r10
	mov qword [rsp+8*185],r10
	mov r10, qword [rsp+8*184]
	mov r11, qword [rsp+8*185]
	cmp r10,r11
	mov r12, qword [rsp+8*186]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*184],r10
	mov qword [rsp+8*185],r11
	mov qword [rsp+8*186],r12
	mov r10, qword [rsp+8*186]
	cmp r10, 0
	mov qword [rsp+8*186],r10
	je L_270
	mov r10, qword [rsp+8*187]
	mov r11, qword [rsp+8*4]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*187],r10
	mov qword [rsp+8*4],r11
	mov r10, qword [rsp+8*4]
	mov r11, qword [rsp+8*187]
	mov r10,r11
	mov qword [rsp+8*4],r10
	mov qword [rsp+8*187],r11
	mov r10, qword [rsp+8*188]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*188],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*188]
	call    address
	mov [rsp+8*189], rax
	mov r10, qword [rsp+8*189]
	mov r11, qword [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*189],r10
	mov qword [rsp+8*11],r11
	mov r10, qword [rsp+8*190]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*190],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*190]
	call    address
	mov [rsp+8*191], rax
	mov r10, qword [rsp+8*191]
	mov r11, qword [rsp+8*12]
	mov [r10],r11
	mov qword [rsp+8*191],r10
	mov qword [rsp+8*12],r11
	mov r10, qword [rsp+8*192]
	mov r11, qword [rsp+8*13]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*192],r10
	mov qword [rsp+8*13],r11
	mov r10, qword [rsp+8*193]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*193],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*193]
	call    address
	mov [rsp+8*194], rax
	mov r10, qword [rsp+8*193]
	mov r11, qword [rsp+8*194]
	mov r10, [r11]
	mov qword [rsp+8*193],r10
	mov qword [rsp+8*194],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*193]
	call    address
	mov [rsp+8*194], rax
	mov r10, qword [rsp+8*194]
	mov r11, qword [rsp+8*192]
	mov [r10],r11
	mov qword [rsp+8*194],r10
	mov qword [rsp+8*192],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, qword [rsp+8*195]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*8],r11
	mov qword [rsp+8*195],r12
	mov r10, qword [rsp+8*195]
	cmp r10, 0
	mov qword [rsp+8*195],r10
	jne L_271
	mov r10, qword [rsp+8*196]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*196],r10
	jmp L_272
	
L_271:
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*10]
	cmp r10,r11
	mov r12, qword [rsp+8*197]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*10],r11
	mov qword [rsp+8*197],r12
	mov r10, qword [rsp+8*196]
	mov r11, qword [rsp+8*197]
	mov r10,r11
	mov qword [rsp+8*196],r10
	mov qword [rsp+8*197],r11
	
L_272:
	mov r10, qword [rsp+8*196]
	cmp r10, 0
	mov qword [rsp+8*196],r10
	je L_274
	mov r10, qword [rsp+8*14]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*14],r10
	
L_274:
	
L_270:
	
L_268:
	mov r10, qword [rsp+8*198]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*198],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*198]
	call    address
	mov [rsp+8*199], rax
	mov r10, qword [rsp+8*200]
	mov r11, qword [rsp+8*199]
	mov r10, [r11]
	mov qword [rsp+8*200],r10
	mov qword [rsp+8*199],r11
	mov r10, qword [rsp+8*201]
	mov r11, qword [rsp+8*200]
	mov r10,r11
	mov r12,2
	sub r10,r12
	mov qword [rsp+8*201],r10
	mov qword [rsp+8*200],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*201]
	mov r10,r11
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*201],r11
	mov r10, qword [rsp+8*202]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*202],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*202]
	call    address
	mov [rsp+8*203], rax
	mov r10, qword [rsp+8*204]
	mov r11, qword [rsp+8*203]
	mov r10, [r11]
	mov qword [rsp+8*204],r10
	mov qword [rsp+8*203],r11
	mov r10, qword [rsp+8*205]
	mov r11, qword [rsp+8*204]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*205],r10
	mov qword [rsp+8*204],r11
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*205]
	mov r10,r11
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*205],r11
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*11]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*11],r11
	call check
	mov r10, qword [rsp+8*206]
	mov r10 , rax
	mov qword [rsp+8*206],r10
	mov r10, qword [rsp+8*206]
	cmp r10, 0
	mov qword [rsp+8*206],r10
	jne L_275
	mov r10, qword [rsp+8*207]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*207],r10
	jmp L_276
	
L_275:
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*12],r11
	call check
	mov r10, qword [rsp+8*208]
	mov r10 , rax
	mov qword [rsp+8*208],r10
	mov r10, qword [rsp+8*207]
	mov r11, qword [rsp+8*208]
	mov r10,r11
	mov qword [rsp+8*207],r10
	mov qword [rsp+8*208],r11
	
L_276:
	mov r10, qword [rsp+8*207]
	cmp r10, 0
	mov qword [rsp+8*207],r10
	je L_278
	mov r10, qword [rsp+8*209]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*209],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*209]
	call    address
	mov [rsp+8*210], rax
	mov r10, qword [rsp+8*209]
	mov r11, qword [rsp+8*210]
	mov r10, [r11]
	mov qword [rsp+8*209],r10
	mov qword [rsp+8*210],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*209]
	call    address
	mov [rsp+8*210], rax
	mov r10, qword [rsp+8*211]
	mov r11, qword [rsp+8*210]
	mov r10, [r11]
	mov qword [rsp+8*211],r10
	mov qword [rsp+8*210],r11
	mov r10, qword [rsp+8*212]
	mov r11,1
	mov r10,r11
	neg r10
	mov qword [rsp+8*212],r10
	mov r10, qword [rsp+8*211]
	mov r11, qword [rsp+8*212]
	cmp r10,r11
	mov r12, qword [rsp+8*213]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*211],r10
	mov qword [rsp+8*212],r11
	mov qword [rsp+8*213],r12
	mov r10, qword [rsp+8*213]
	cmp r10, 0
	mov qword [rsp+8*213],r10
	je L_280
	mov r10, qword [rsp+8*214]
	mov r11, qword [rsp+8*4]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*214],r10
	mov qword [rsp+8*4],r11
	mov r10, qword [rsp+8*4]
	mov r11, qword [rsp+8*214]
	mov r10,r11
	mov qword [rsp+8*4],r10
	mov qword [rsp+8*214],r11
	mov r10, qword [rsp+8*215]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*215],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*215]
	call    address
	mov [rsp+8*216], rax
	mov r10, qword [rsp+8*216]
	mov r11, qword [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*216],r10
	mov qword [rsp+8*11],r11
	mov r10, qword [rsp+8*217]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*217],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*217]
	call    address
	mov [rsp+8*218], rax
	mov r10, qword [rsp+8*218]
	mov r11, qword [rsp+8*12]
	mov [r10],r11
	mov qword [rsp+8*218],r10
	mov qword [rsp+8*12],r11
	mov r10, qword [rsp+8*219]
	mov r11, qword [rsp+8*13]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*219],r10
	mov qword [rsp+8*13],r11
	mov r10, qword [rsp+8*220]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*220],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*220]
	call    address
	mov [rsp+8*221], rax
	mov r10, qword [rsp+8*220]
	mov r11, qword [rsp+8*221]
	mov r10, [r11]
	mov qword [rsp+8*220],r10
	mov qword [rsp+8*221],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*220]
	call    address
	mov [rsp+8*221], rax
	mov r10, qword [rsp+8*221]
	mov r11, qword [rsp+8*219]
	mov [r10],r11
	mov qword [rsp+8*221],r10
	mov qword [rsp+8*219],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, qword [rsp+8*222]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*8],r11
	mov qword [rsp+8*222],r12
	mov r10, qword [rsp+8*222]
	cmp r10, 0
	mov qword [rsp+8*222],r10
	jne L_281
	mov r10, qword [rsp+8*223]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*223],r10
	jmp L_282
	
L_281:
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*10]
	cmp r10,r11
	mov r12, qword [rsp+8*224]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*10],r11
	mov qword [rsp+8*224],r12
	mov r10, qword [rsp+8*223]
	mov r11, qword [rsp+8*224]
	mov r10,r11
	mov qword [rsp+8*223],r10
	mov qword [rsp+8*224],r11
	
L_282:
	mov r10, qword [rsp+8*223]
	cmp r10, 0
	mov qword [rsp+8*223],r10
	je L_284
	mov r10, qword [rsp+8*14]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*14],r10
	
L_284:
	
L_280:
	
L_278:
	mov r10, qword [rsp+8*225]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*225],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*225]
	call    address
	mov [rsp+8*226], rax
	mov r10, qword [rsp+8*227]
	mov r11, qword [rsp+8*226]
	mov r10, [r11]
	mov qword [rsp+8*227],r10
	mov qword [rsp+8*226],r11
	mov r10, qword [rsp+8*228]
	mov r11, qword [rsp+8*227]
	mov r10,r11
	mov r12,2
	add r10,r12
	mov qword [rsp+8*228],r10
	mov qword [rsp+8*227],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*228]
	mov r10,r11
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*228],r11
	mov r10, qword [rsp+8*229]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*229],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*229]
	call    address
	mov [rsp+8*230], rax
	mov r10, qword [rsp+8*231]
	mov r11, qword [rsp+8*230]
	mov r10, [r11]
	mov qword [rsp+8*231],r10
	mov qword [rsp+8*230],r11
	mov r10, qword [rsp+8*232]
	mov r11, qword [rsp+8*231]
	mov r10,r11
	mov r12,1
	sub r10,r12
	mov qword [rsp+8*232],r10
	mov qword [rsp+8*231],r11
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*232]
	mov r10,r11
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*232],r11
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*11]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*11],r11
	call check
	mov r10, qword [rsp+8*233]
	mov r10 , rax
	mov qword [rsp+8*233],r10
	mov r10, qword [rsp+8*233]
	cmp r10, 0
	mov qword [rsp+8*233],r10
	jne L_285
	mov r10, qword [rsp+8*234]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*234],r10
	jmp L_286
	
L_285:
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*12],r11
	call check
	mov r10, qword [rsp+8*235]
	mov r10 , rax
	mov qword [rsp+8*235],r10
	mov r10, qword [rsp+8*234]
	mov r11, qword [rsp+8*235]
	mov r10,r11
	mov qword [rsp+8*234],r10
	mov qword [rsp+8*235],r11
	
L_286:
	mov r10, qword [rsp+8*234]
	cmp r10, 0
	mov qword [rsp+8*234],r10
	je L_288
	mov r10, qword [rsp+8*236]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*236],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*236]
	call    address
	mov [rsp+8*237], rax
	mov r10, qword [rsp+8*236]
	mov r11, qword [rsp+8*237]
	mov r10, [r11]
	mov qword [rsp+8*236],r10
	mov qword [rsp+8*237],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*236]
	call    address
	mov [rsp+8*237], rax
	mov r10, qword [rsp+8*238]
	mov r11, qword [rsp+8*237]
	mov r10, [r11]
	mov qword [rsp+8*238],r10
	mov qword [rsp+8*237],r11
	mov r10, qword [rsp+8*239]
	mov r11,1
	mov r10,r11
	neg r10
	mov qword [rsp+8*239],r10
	mov r10, qword [rsp+8*238]
	mov r11, qword [rsp+8*239]
	cmp r10,r11
	mov r12, qword [rsp+8*240]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*238],r10
	mov qword [rsp+8*239],r11
	mov qword [rsp+8*240],r12
	mov r10, qword [rsp+8*240]
	cmp r10, 0
	mov qword [rsp+8*240],r10
	je L_290
	mov r10, qword [rsp+8*241]
	mov r11, qword [rsp+8*4]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*241],r10
	mov qword [rsp+8*4],r11
	mov r10, qword [rsp+8*4]
	mov r11, qword [rsp+8*241]
	mov r10,r11
	mov qword [rsp+8*4],r10
	mov qword [rsp+8*241],r11
	mov r10, qword [rsp+8*242]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*242],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*242]
	call    address
	mov [rsp+8*243], rax
	mov r10, qword [rsp+8*243]
	mov r11, qword [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*243],r10
	mov qword [rsp+8*11],r11
	mov r10, qword [rsp+8*244]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*244],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*244]
	call    address
	mov [rsp+8*245], rax
	mov r10, qword [rsp+8*245]
	mov r11, qword [rsp+8*12]
	mov [r10],r11
	mov qword [rsp+8*245],r10
	mov qword [rsp+8*12],r11
	mov r10, qword [rsp+8*246]
	mov r11, qword [rsp+8*13]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*246],r10
	mov qword [rsp+8*13],r11
	mov r10, qword [rsp+8*247]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*247],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*247]
	call    address
	mov [rsp+8*248], rax
	mov r10, qword [rsp+8*247]
	mov r11, qword [rsp+8*248]
	mov r10, [r11]
	mov qword [rsp+8*247],r10
	mov qword [rsp+8*248],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*247]
	call    address
	mov [rsp+8*248], rax
	mov r10, qword [rsp+8*248]
	mov r11, qword [rsp+8*246]
	mov [r10],r11
	mov qword [rsp+8*248],r10
	mov qword [rsp+8*246],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, qword [rsp+8*249]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*8],r11
	mov qword [rsp+8*249],r12
	mov r10, qword [rsp+8*249]
	cmp r10, 0
	mov qword [rsp+8*249],r10
	jne L_291
	mov r10, qword [rsp+8*250]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*250],r10
	jmp L_292
	
L_291:
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*10]
	cmp r10,r11
	mov r12, qword [rsp+8*251]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*10],r11
	mov qword [rsp+8*251],r12
	mov r10, qword [rsp+8*250]
	mov r11, qword [rsp+8*251]
	mov r10,r11
	mov qword [rsp+8*250],r10
	mov qword [rsp+8*251],r11
	
L_292:
	mov r10, qword [rsp+8*250]
	cmp r10, 0
	mov qword [rsp+8*250],r10
	je L_294
	mov r10, qword [rsp+8*14]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*14],r10
	
L_294:
	
L_290:
	
L_288:
	mov r10, qword [rsp+8*252]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*252],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*252]
	call    address
	mov [rsp+8*253], rax
	mov r10, qword [rsp+8*254]
	mov r11, qword [rsp+8*253]
	mov r10, [r11]
	mov qword [rsp+8*254],r10
	mov qword [rsp+8*253],r11
	mov r10, qword [rsp+8*255]
	mov r11, qword [rsp+8*254]
	mov r10,r11
	mov r12,2
	add r10,r12
	mov qword [rsp+8*255],r10
	mov qword [rsp+8*254],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*255]
	mov r10,r11
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*255],r11
	mov r10, qword [rsp+8*256]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*256],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*256]
	call    address
	mov [rsp+8*257], rax
	mov r10, qword [rsp+8*258]
	mov r11, qword [rsp+8*257]
	mov r10, [r11]
	mov qword [rsp+8*258],r10
	mov qword [rsp+8*257],r11
	mov r10, qword [rsp+8*259]
	mov r11, qword [rsp+8*258]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*259],r10
	mov qword [rsp+8*258],r11
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*259]
	mov r10,r11
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*259],r11
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*11]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*11],r11
	call check
	mov r10, qword [rsp+8*260]
	mov r10 , rax
	mov qword [rsp+8*260],r10
	mov r10, qword [rsp+8*260]
	cmp r10, 0
	mov qword [rsp+8*260],r10
	jne L_295
	mov r10, qword [rsp+8*261]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*261],r10
	jmp L_296
	
L_295:
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*12],r11
	call check
	mov r10, qword [rsp+8*262]
	mov r10 , rax
	mov qword [rsp+8*262],r10
	mov r10, qword [rsp+8*261]
	mov r11, qword [rsp+8*262]
	mov r10,r11
	mov qword [rsp+8*261],r10
	mov qword [rsp+8*262],r11
	
L_296:
	mov r10, qword [rsp+8*261]
	cmp r10, 0
	mov qword [rsp+8*261],r10
	je L_298
	mov r10, qword [rsp+8*263]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*263],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*263]
	call    address
	mov [rsp+8*264], rax
	mov r10, qword [rsp+8*263]
	mov r11, qword [rsp+8*264]
	mov r10, [r11]
	mov qword [rsp+8*263],r10
	mov qword [rsp+8*264],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*263]
	call    address
	mov [rsp+8*264], rax
	mov r10, qword [rsp+8*265]
	mov r11, qword [rsp+8*264]
	mov r10, [r11]
	mov qword [rsp+8*265],r10
	mov qword [rsp+8*264],r11
	mov r10, qword [rsp+8*266]
	mov r11,1
	mov r10,r11
	neg r10
	mov qword [rsp+8*266],r10
	mov r10, qword [rsp+8*265]
	mov r11, qword [rsp+8*266]
	cmp r10,r11
	mov r12, qword [rsp+8*267]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*265],r10
	mov qword [rsp+8*266],r11
	mov qword [rsp+8*267],r12
	mov r10, qword [rsp+8*267]
	cmp r10, 0
	mov qword [rsp+8*267],r10
	je L_300
	mov r10, qword [rsp+8*268]
	mov r11, qword [rsp+8*4]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*268],r10
	mov qword [rsp+8*4],r11
	mov r10, qword [rsp+8*4]
	mov r11, qword [rsp+8*268]
	mov r10,r11
	mov qword [rsp+8*4],r10
	mov qword [rsp+8*268],r11
	mov r10, qword [rsp+8*269]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [rsp+8*269],r10
	mov qword [rsp+8*17],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*269]
	call    address
	mov [rsp+8*270], rax
	mov r10, qword [rsp+8*270]
	mov r11, qword [rsp+8*11]
	mov [r10],r11
	mov qword [rsp+8*270],r10
	mov qword [rsp+8*11],r11
	mov r10, qword [rsp+8*271]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*271],r10
	mov qword [rsp+8*26],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*271]
	call    address
	mov [rsp+8*272], rax
	mov r10, qword [rsp+8*272]
	mov r11, qword [rsp+8*12]
	mov [r10],r11
	mov qword [rsp+8*272],r10
	mov qword [rsp+8*12],r11
	mov r10, qword [rsp+8*273]
	mov r11, qword [rsp+8*13]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*273],r10
	mov qword [rsp+8*13],r11
	mov r10, qword [rsp+8*274]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*274],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*274]
	call    address
	mov [rsp+8*275], rax
	mov r10, qword [rsp+8*274]
	mov r11, qword [rsp+8*275]
	mov r10, [r11]
	mov qword [rsp+8*274],r10
	mov qword [rsp+8*275],r11
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*274]
	call    address
	mov [rsp+8*275], rax
	mov r10, qword [rsp+8*275]
	mov r11, qword [rsp+8*273]
	mov [r10],r11
	mov qword [rsp+8*275],r10
	mov qword [rsp+8*273],r11
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, qword [rsp+8*276]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*11],r10
	mov qword [rsp+8*8],r11
	mov qword [rsp+8*276],r12
	mov r10, qword [rsp+8*276]
	cmp r10, 0
	mov qword [rsp+8*276],r10
	jne L_301
	mov r10, qword [rsp+8*277]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*277],r10
	jmp L_302
	
L_301:
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*10]
	cmp r10,r11
	mov r12, qword [rsp+8*278]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*10],r11
	mov qword [rsp+8*278],r12
	mov r10, qword [rsp+8*277]
	mov r11, qword [rsp+8*278]
	mov r10,r11
	mov qword [rsp+8*277],r10
	mov qword [rsp+8*278],r11
	
L_302:
	mov r10, qword [rsp+8*277]
	cmp r10, 0
	mov qword [rsp+8*277],r10
	je L_304
	mov r10, qword [rsp+8*14]
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*14],r10
	
L_304:
	
L_300:
	
L_298:
	mov r10, qword [rsp+8*14]
	mov r11,1
	cmp r10,r11
	mov r12, qword [rsp+8*279]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*14],r10
	mov qword [rsp+8*279],r12
	mov r10, qword [rsp+8*279]
	cmp r10, 0
	mov qword [rsp+8*279],r10
	je L_306
	jmp L_224
	
L_306:
	mov r10, qword [rsp+8*280]
	mov r11, qword [rsp+8*3]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov qword [rsp+8*280],r10
	mov qword [rsp+8*3],r11
	mov r10, qword [rsp+8*3]
	mov r11, qword [rsp+8*280]
	mov r10,r11
	mov qword [rsp+8*3],r10
	mov qword [rsp+8*280],r11
	jmp L_223
	
L_224:
	mov r10, qword [rsp+8*14]
	mov r11,1
	cmp r10,r11
	mov r12, qword [rsp+8*281]
	mov r12, 0
	sete r12B
	mov qword [rsp+8*14],r10
	mov qword [rsp+8*281],r12
	mov r10, qword [rsp+8*281]
	cmp r10, 0
	mov qword [rsp+8*281],r10
	je L_307
	mov r10, qword [rsp+8*282]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*282],r10
	mov qword [rsp+8*33],r11
	mov     rsi, [rsp+8*8]
	mov     rdi, [rsp+8*282]
	call    address
	mov [rsp+8*283], rax
	mov r10, qword [rsp+8*282]
	mov r11, qword [rsp+8*283]
	mov r10, [r11]
	mov qword [rsp+8*282],r10
	mov qword [rsp+8*283],r11
	mov     rsi, [rsp+8*10]
	mov     rdi, [rsp+8*282]
	call    address
	mov [rsp+8*283], rax
	mov r10, qword [rsp+8*284]
	mov r11, qword [rsp+8*283]
	mov r10, [r11]
	mov qword [rsp+8*284],r10
	mov qword [rsp+8*283],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*284]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*284],r11
	mov r10, qword [rsp+8*285]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*285],r10
	mov qword [arg+8*0],r11
	mov     rdi, [rsp+8*285]
	call    toString
	mov     qword[rsp+8*286], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*286]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*286],r11
	mov r10, qword [rsp+8*287]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*287],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*287] 
	add rsi, 1 
	xor rax, rax
	call printf
	jmp L_308
	
L_307:
	mov r10, qword [arg+8*0]
	mov r11,t405
	mov r10,r11
	mov qword [arg+8*0],r10
	mov r10, qword [rsp+8*288]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*288],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*288] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_308:
	mov r10,0
	mov rax,r10
	leave
	ret
	mov r10,0
	mov rax,r10
	leave
	ret
	jmp QED
	
check:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2416
	mov r10, qword [rsp+8*289]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*289],r10
	mov qword [arg+8*0],r11
	mov r10, qword [rsp+8*290]
	mov r11, qword [arg+8*1]
	mov r10,r11
	mov qword [rsp+8*290],r10
	mov qword [arg+8*1],r11
	mov r10, qword [rsp+8*289]
	mov r11, qword [rsp+8*290]
	cmp r10,r11
	mov r12, qword [rsp+8*291]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*289],r10
	mov qword [rsp+8*290],r11
	mov qword [rsp+8*291],r12
	mov r10, qword [rsp+8*291]
	cmp r10, 0
	mov qword [rsp+8*291],r10
	jne L_209
	mov r10, qword [rsp+8*292]
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*292],r10
	jmp L_210
	
L_209:
	mov r10, qword [rsp+8*289]
	mov r11,0
	cmp r10,r11
	mov r12, qword [rsp+8*293]
	mov r12, 0
	setge r12B
	mov qword [rsp+8*289],r10
	mov qword [rsp+8*293],r12
	mov r10, qword [rsp+8*292]
	mov r11, qword [rsp+8*293]
	mov r10,r11
	mov qword [rsp+8*292],r10
	mov qword [rsp+8*293],r11
	
L_210:
	mov r10, qword [rsp+8*292]
	mov rax,r10
	mov qword [rsp+8*292],r10
	leave
	ret
	mov r10,0
	mov rax,r10
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2416
	mov r10, qword [rsp+8*294]
	mov rax,r10
	mov qword [rsp+8*294],r10
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   4400
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
	
t405:
	 db 12,"no solution!" ,0


