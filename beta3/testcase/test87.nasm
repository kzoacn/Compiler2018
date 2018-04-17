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
	mov qword [rsp+8*10],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*12]
	mov r11, qword [rsp+8*10]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*10],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*13]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*13],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*14]
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov r12, qword [rsp+8*13]
	sub r10,r12
	mov qword [rsp+8*14],r10
	mov qword [rsp+8*12],r11
	mov qword [rsp+8*13],r12
	mov r10, qword [rsp+8*15]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*15],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*16]
	mov r11, qword [rsp+8*15]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*16],r10
	mov qword [rsp+8*15],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*17]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*17],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*18]
	mov r11, qword [rsp+8*16]
	mov r10,r11
	mov r12, qword [rsp+8*17]
	sub r10,r12
	mov qword [rsp+8*18],r10
	mov qword [rsp+8*16],r11
	mov qword [rsp+8*17],r12
	mov r10, qword [rsp+8*19]
	mov r11, qword [rsp+8*14]
	mov r10,r11
	mov r12, qword [rsp+8*18]
	add r10,r12
	mov qword [rsp+8*19],r10
	mov qword [rsp+8*14],r11
	mov qword [rsp+8*18],r12
	mov r10, qword [rsp+8*20]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*20],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*21]
	mov r11, qword [rsp+8*20]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*21],r10
	mov qword [rsp+8*20],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*22]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*22],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*23]
	mov r11, qword [rsp+8*21]
	mov r10,r11
	mov r12, qword [rsp+8*22]
	sub r10,r12
	mov qword [rsp+8*23],r10
	mov qword [rsp+8*21],r11
	mov qword [rsp+8*22],r12
	mov r10, qword [rsp+8*24]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*24],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*25]
	mov r11, qword [rsp+8*24]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*25],r10
	mov qword [rsp+8*24],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*26]
	mov r11, qword [rsp+8*23]
	mov r10,r11
	mov r12, qword [rsp+8*25]
	add r10,r12
	mov qword [rsp+8*26],r10
	mov qword [rsp+8*23],r11
	mov qword [rsp+8*25],r12
	mov r10, qword [rsp+8*27]
	mov r11, qword [rsp+8*19]
	mov r10,r11
	mov r12, qword [rsp+8*26]
	add r10,r12
	mov qword [rsp+8*27],r10
	mov qword [rsp+8*19],r11
	mov qword [rsp+8*26],r12
	mov r10, qword [rsp+8*28]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*28],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*29]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*29],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*30]
	mov r11, qword [rsp+8*29]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*30],r10
	mov qword [rsp+8*29],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*31]
	mov r11, qword [rsp+8*28]
	mov r10,r11
	mov r12, qword [rsp+8*30]
	add r10,r12
	mov qword [rsp+8*31],r10
	mov qword [rsp+8*28],r11
	mov qword [rsp+8*30],r12
	mov r10, qword [rsp+8*32]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*32],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*33]
	mov r11, qword [rsp+8*31]
	mov r10,r11
	mov r12, qword [rsp+8*32]
	sub r10,r12
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov qword [rsp+8*32],r12
	mov r10, qword [rsp+8*34]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*34],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*35]
	mov r11, qword [rsp+8*34]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*35],r10
	mov qword [rsp+8*34],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*36]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*36],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*37]
	mov r11, qword [rsp+8*35]
	mov r10,r11
	mov r12, qword [rsp+8*36]
	sub r10,r12
	mov qword [rsp+8*37],r10
	mov qword [rsp+8*35],r11
	mov qword [rsp+8*36],r12
	mov r10, qword [rsp+8*38]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*38],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*39]
	mov r11, qword [rsp+8*38]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*39],r10
	mov qword [rsp+8*38],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*40]
	mov r11, qword [rsp+8*37]
	mov r10,r11
	mov r12, qword [rsp+8*39]
	add r10,r12
	mov qword [rsp+8*40],r10
	mov qword [rsp+8*37],r11
	mov qword [rsp+8*39],r12
	mov r10, qword [rsp+8*41]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov r12, qword [rsp+8*40]
	add r10,r12
	mov qword [rsp+8*41],r10
	mov qword [rsp+8*33],r11
	mov qword [rsp+8*40],r12
	mov r10, qword [rsp+8*42]
	mov r11, qword [rsp+8*27]
	mov r10,r11
	mov r12, qword [rsp+8*41]
	sub r10,r12
	mov qword [rsp+8*42],r10
	mov qword [rsp+8*27],r11
	mov qword [rsp+8*41],r12
	mov r10, qword [rsp+8*43]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*43],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*44]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*44],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*45]
	mov r11, qword [rsp+8*44]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*45],r10
	mov qword [rsp+8*44],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*46]
	mov r11, qword [rsp+8*43]
	mov r10,r11
	mov r12, qword [rsp+8*45]
	add r10,r12
	mov qword [rsp+8*46],r10
	mov qword [rsp+8*43],r11
	mov qword [rsp+8*45],r12
	mov r10, qword [rsp+8*47]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*47],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*48]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*48],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*49]
	mov r11, qword [rsp+8*48]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*49],r10
	mov qword [rsp+8*48],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*50]
	mov r11, qword [rsp+8*47]
	mov r10,r11
	mov r12, qword [rsp+8*49]
	add r10,r12
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*47],r11
	mov qword [rsp+8*49],r12
	mov r10, qword [rsp+8*51]
	mov r11, qword [rsp+8*46]
	mov r10,r11
	mov r12, qword [rsp+8*50]
	sub r10,r12
	mov qword [rsp+8*51],r10
	mov qword [rsp+8*46],r11
	mov qword [rsp+8*50],r12
	mov r10, qword [rsp+8*52]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*52],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*53]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*53],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*54]
	mov r11, qword [rsp+8*53]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*54],r10
	mov qword [rsp+8*53],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*55]
	mov r11, qword [rsp+8*52]
	mov r10,r11
	mov r12, qword [rsp+8*54]
	add r10,r12
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*52],r11
	mov qword [rsp+8*54],r12
	mov r10, qword [rsp+8*56]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*56],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*57]
	mov r11, qword [rsp+8*55]
	mov r10,r11
	mov r12, qword [rsp+8*56]
	sub r10,r12
	mov qword [rsp+8*57],r10
	mov qword [rsp+8*55],r11
	mov qword [rsp+8*56],r12
	mov r10, qword [rsp+8*58]
	mov r11, qword [rsp+8*51]
	mov r10,r11
	mov r12, qword [rsp+8*57]
	sub r10,r12
	mov qword [rsp+8*58],r10
	mov qword [rsp+8*51],r11
	mov qword [rsp+8*57],r12
	mov r10, qword [rsp+8*59]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*59],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*60]
	mov r11, qword [rsp+8*59]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*60],r10
	mov qword [rsp+8*59],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*61]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*61],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*62]
	mov r11, qword [rsp+8*60]
	mov r10,r11
	mov r12, qword [rsp+8*61]
	sub r10,r12
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*60],r11
	mov qword [rsp+8*61],r12
	mov r10, qword [rsp+8*63]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*63],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*64]
	mov r11, qword [rsp+8*63]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*64],r10
	mov qword [rsp+8*63],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*65]
	mov r11, qword [rsp+8*62]
	mov r10,r11
	mov r12, qword [rsp+8*64]
	add r10,r12
	mov qword [rsp+8*65],r10
	mov qword [rsp+8*62],r11
	mov qword [rsp+8*64],r12
	mov r10, qword [rsp+8*66]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*66],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*67]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*67],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*68]
	mov r11, qword [rsp+8*67]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*68],r10
	mov qword [rsp+8*67],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*69]
	mov r11, qword [rsp+8*66]
	mov r10,r11
	mov r12, qword [rsp+8*68]
	add r10,r12
	mov qword [rsp+8*69],r10
	mov qword [rsp+8*66],r11
	mov qword [rsp+8*68],r12
	mov r10, qword [rsp+8*70]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*70],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*71]
	mov r11, qword [rsp+8*69]
	mov r10,r11
	mov r12, qword [rsp+8*70]
	sub r10,r12
	mov qword [rsp+8*71],r10
	mov qword [rsp+8*69],r11
	mov qword [rsp+8*70],r12
	mov r10, qword [rsp+8*72]
	mov r11, qword [rsp+8*65]
	mov r10,r11
	mov r12, qword [rsp+8*71]
	sub r10,r12
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*65],r11
	mov qword [rsp+8*71],r12
	mov r10, qword [rsp+8*73]
	mov r11, qword [rsp+8*58]
	mov r10,r11
	mov r12, qword [rsp+8*72]
	add r10,r12
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*58],r11
	mov qword [rsp+8*72],r12
	mov r10, qword [rsp+8*74]
	mov r11, qword [rsp+8*42]
	mov r10,r11
	mov r12, qword [rsp+8*73]
	sub r10,r12
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*42],r11
	mov qword [rsp+8*73],r12
	mov r10, qword [rsp+8*75]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*75],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*76]
	mov r11, qword [rsp+8*75]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*76],r10
	mov qword [rsp+8*75],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*77]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*77],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*78]
	mov r11, qword [rsp+8*76]
	mov r10,r11
	mov r12, qword [rsp+8*77]
	sub r10,r12
	mov qword [rsp+8*78],r10
	mov qword [rsp+8*76],r11
	mov qword [rsp+8*77],r12
	mov r10, qword [rsp+8*79]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*79],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*80]
	mov r11, qword [rsp+8*79]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*80],r10
	mov qword [rsp+8*79],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*81]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*81],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*82]
	mov r11, qword [rsp+8*80]
	mov r10,r11
	mov r12, qword [rsp+8*81]
	sub r10,r12
	mov qword [rsp+8*82],r10
	mov qword [rsp+8*80],r11
	mov qword [rsp+8*81],r12
	mov r10, qword [rsp+8*83]
	mov r11, qword [rsp+8*78]
	mov r10,r11
	mov r12, qword [rsp+8*82]
	add r10,r12
	mov qword [rsp+8*83],r10
	mov qword [rsp+8*78],r11
	mov qword [rsp+8*82],r12
	mov r10, qword [rsp+8*84]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*84],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*85]
	mov r11, qword [rsp+8*84]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*85],r10
	mov qword [rsp+8*84],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*86]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*86],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*87]
	mov r11, qword [rsp+8*85]
	mov r10,r11
	mov r12, qword [rsp+8*86]
	sub r10,r12
	mov qword [rsp+8*87],r10
	mov qword [rsp+8*85],r11
	mov qword [rsp+8*86],r12
	mov r10, qword [rsp+8*88]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*88],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*89]
	mov r11, qword [rsp+8*88]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*89],r10
	mov qword [rsp+8*88],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*90]
	mov r11, qword [rsp+8*87]
	mov r10,r11
	mov r12, qword [rsp+8*89]
	add r10,r12
	mov qword [rsp+8*90],r10
	mov qword [rsp+8*87],r11
	mov qword [rsp+8*89],r12
	mov r10, qword [rsp+8*91]
	mov r11, qword [rsp+8*83]
	mov r10,r11
	mov r12, qword [rsp+8*90]
	add r10,r12
	mov qword [rsp+8*91],r10
	mov qword [rsp+8*83],r11
	mov qword [rsp+8*90],r12
	mov r10, qword [rsp+8*92]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*92],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*93]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*93],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*94]
	mov r11, qword [rsp+8*93]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*94],r10
	mov qword [rsp+8*93],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*95]
	mov r11, qword [rsp+8*92]
	mov r10,r11
	mov r12, qword [rsp+8*94]
	add r10,r12
	mov qword [rsp+8*95],r10
	mov qword [rsp+8*92],r11
	mov qword [rsp+8*94],r12
	mov r10, qword [rsp+8*96]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*96],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*97]
	mov r11, qword [rsp+8*95]
	mov r10,r11
	mov r12, qword [rsp+8*96]
	sub r10,r12
	mov qword [rsp+8*97],r10
	mov qword [rsp+8*95],r11
	mov qword [rsp+8*96],r12
	mov r10, qword [rsp+8*98]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*98],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*99]
	mov r11, qword [rsp+8*98]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*99],r10
	mov qword [rsp+8*98],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*100]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*100],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*101]
	mov r11, qword [rsp+8*99]
	mov r10,r11
	mov r12, qword [rsp+8*100]
	sub r10,r12
	mov qword [rsp+8*101],r10
	mov qword [rsp+8*99],r11
	mov qword [rsp+8*100],r12
	mov r10, qword [rsp+8*102]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*102],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*103]
	mov r11, qword [rsp+8*102]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*103],r10
	mov qword [rsp+8*102],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*104]
	mov r11, qword [rsp+8*101]
	mov r10,r11
	mov r12, qword [rsp+8*103]
	add r10,r12
	mov qword [rsp+8*104],r10
	mov qword [rsp+8*101],r11
	mov qword [rsp+8*103],r12
	mov r10, qword [rsp+8*105]
	mov r11, qword [rsp+8*97]
	mov r10,r11
	mov r12, qword [rsp+8*104]
	add r10,r12
	mov qword [rsp+8*105],r10
	mov qword [rsp+8*97],r11
	mov qword [rsp+8*104],r12
	mov r10, qword [rsp+8*106]
	mov r11, qword [rsp+8*91]
	mov r10,r11
	mov r12, qword [rsp+8*105]
	sub r10,r12
	mov qword [rsp+8*106],r10
	mov qword [rsp+8*91],r11
	mov qword [rsp+8*105],r12
	mov r10, qword [rsp+8*107]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*107],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*108]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*108],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*109]
	mov r11, qword [rsp+8*108]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*109],r10
	mov qword [rsp+8*108],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*110]
	mov r11, qword [rsp+8*107]
	mov r10,r11
	mov r12, qword [rsp+8*109]
	add r10,r12
	mov qword [rsp+8*110],r10
	mov qword [rsp+8*107],r11
	mov qword [rsp+8*109],r12
	mov r10, qword [rsp+8*111]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*111],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*112]
	mov r11, qword [rsp+8*110]
	mov r10,r11
	mov r12, qword [rsp+8*111]
	sub r10,r12
	mov qword [rsp+8*112],r10
	mov qword [rsp+8*110],r11
	mov qword [rsp+8*111],r12
	mov r10, qword [rsp+8*113]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*113],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*114]
	mov r11, qword [rsp+8*113]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*114],r10
	mov qword [rsp+8*113],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*115]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*115],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*116]
	mov r11, qword [rsp+8*114]
	mov r10,r11
	mov r12, qword [rsp+8*115]
	sub r10,r12
	mov qword [rsp+8*116],r10
	mov qword [rsp+8*114],r11
	mov qword [rsp+8*115],r12
	mov r10, qword [rsp+8*117]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*117],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*118]
	mov r11, qword [rsp+8*117]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*118],r10
	mov qword [rsp+8*117],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*119]
	mov r11, qword [rsp+8*116]
	mov r10,r11
	mov r12, qword [rsp+8*118]
	add r10,r12
	mov qword [rsp+8*119],r10
	mov qword [rsp+8*116],r11
	mov qword [rsp+8*118],r12
	mov r10, qword [rsp+8*120]
	mov r11, qword [rsp+8*112]
	mov r10,r11
	mov r12, qword [rsp+8*119]
	add r10,r12
	mov qword [rsp+8*120],r10
	mov qword [rsp+8*112],r11
	mov qword [rsp+8*119],r12
	mov r10, qword [rsp+8*121]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*121],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*122]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*122],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*123]
	mov r11, qword [rsp+8*122]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*123],r10
	mov qword [rsp+8*122],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*124]
	mov r11, qword [rsp+8*121]
	mov r10,r11
	mov r12, qword [rsp+8*123]
	add r10,r12
	mov qword [rsp+8*124],r10
	mov qword [rsp+8*121],r11
	mov qword [rsp+8*123],r12
	mov r10, qword [rsp+8*125]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*125],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*126]
	mov r11, qword [rsp+8*124]
	mov r10,r11
	mov r12, qword [rsp+8*125]
	sub r10,r12
	mov qword [rsp+8*126],r10
	mov qword [rsp+8*124],r11
	mov qword [rsp+8*125],r12
	mov r10, qword [rsp+8*127]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*127],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*128]
	mov r11, qword [rsp+8*127]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*128],r10
	mov qword [rsp+8*127],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*129]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*129],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*130]
	mov r11, qword [rsp+8*128]
	mov r10,r11
	mov r12, qword [rsp+8*129]
	sub r10,r12
	mov qword [rsp+8*130],r10
	mov qword [rsp+8*128],r11
	mov qword [rsp+8*129],r12
	mov r10, qword [rsp+8*131]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*131],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*132]
	mov r11, qword [rsp+8*131]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*132],r10
	mov qword [rsp+8*131],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*133]
	mov r11, qword [rsp+8*130]
	mov r10,r11
	mov r12, qword [rsp+8*132]
	add r10,r12
	mov qword [rsp+8*133],r10
	mov qword [rsp+8*130],r11
	mov qword [rsp+8*132],r12
	mov r10, qword [rsp+8*134]
	mov r11, qword [rsp+8*126]
	mov r10,r11
	mov r12, qword [rsp+8*133]
	add r10,r12
	mov qword [rsp+8*134],r10
	mov qword [rsp+8*126],r11
	mov qword [rsp+8*133],r12
	mov r10, qword [rsp+8*135]
	mov r11, qword [rsp+8*120]
	mov r10,r11
	mov r12, qword [rsp+8*134]
	sub r10,r12
	mov qword [rsp+8*135],r10
	mov qword [rsp+8*120],r11
	mov qword [rsp+8*134],r12
	mov r10, qword [rsp+8*136]
	mov r11, qword [rsp+8*106]
	mov r10,r11
	mov r12, qword [rsp+8*135]
	sub r10,r12
	mov qword [rsp+8*136],r10
	mov qword [rsp+8*106],r11
	mov qword [rsp+8*135],r12
	mov r10, qword [rsp+8*137]
	mov r11, qword [rsp+8*74]
	mov r10,r11
	mov r12, qword [rsp+8*136]
	add r10,r12
	mov qword [rsp+8*137],r10
	mov qword [rsp+8*74],r11
	mov qword [rsp+8*136],r12
	mov r10, qword [rsp+8*138]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*138],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*139]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*139],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*140]
	mov r11, qword [rsp+8*139]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*140],r10
	mov qword [rsp+8*139],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*141]
	mov r11, qword [rsp+8*138]
	mov r10,r11
	mov r12, qword [rsp+8*140]
	add r10,r12
	mov qword [rsp+8*141],r10
	mov qword [rsp+8*138],r11
	mov qword [rsp+8*140],r12
	mov r10, qword [rsp+8*142]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*142],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*143]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*143],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*144]
	mov r11, qword [rsp+8*143]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*144],r10
	mov qword [rsp+8*143],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*145]
	mov r11, qword [rsp+8*142]
	mov r10,r11
	mov r12, qword [rsp+8*144]
	add r10,r12
	mov qword [rsp+8*145],r10
	mov qword [rsp+8*142],r11
	mov qword [rsp+8*144],r12
	mov r10, qword [rsp+8*146]
	mov r11, qword [rsp+8*141]
	mov r10,r11
	mov r12, qword [rsp+8*145]
	sub r10,r12
	mov qword [rsp+8*146],r10
	mov qword [rsp+8*141],r11
	mov qword [rsp+8*145],r12
	mov r10, qword [rsp+8*147]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*147],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*148]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*148],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*149]
	mov r11, qword [rsp+8*148]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*149],r10
	mov qword [rsp+8*148],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*150]
	mov r11, qword [rsp+8*147]
	mov r10,r11
	mov r12, qword [rsp+8*149]
	add r10,r12
	mov qword [rsp+8*150],r10
	mov qword [rsp+8*147],r11
	mov qword [rsp+8*149],r12
	mov r10, qword [rsp+8*151]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*151],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*152]
	mov r11, qword [rsp+8*150]
	mov r10,r11
	mov r12, qword [rsp+8*151]
	sub r10,r12
	mov qword [rsp+8*152],r10
	mov qword [rsp+8*150],r11
	mov qword [rsp+8*151],r12
	mov r10, qword [rsp+8*153]
	mov r11, qword [rsp+8*146]
	mov r10,r11
	mov r12, qword [rsp+8*152]
	sub r10,r12
	mov qword [rsp+8*153],r10
	mov qword [rsp+8*146],r11
	mov qword [rsp+8*152],r12
	mov r10, qword [rsp+8*154]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*154],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*155]
	mov r11, qword [rsp+8*154]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*155],r10
	mov qword [rsp+8*154],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*156]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*156],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*157]
	mov r11, qword [rsp+8*155]
	mov r10,r11
	mov r12, qword [rsp+8*156]
	sub r10,r12
	mov qword [rsp+8*157],r10
	mov qword [rsp+8*155],r11
	mov qword [rsp+8*156],r12
	mov r10, qword [rsp+8*158]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*158],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*159]
	mov r11, qword [rsp+8*158]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*159],r10
	mov qword [rsp+8*158],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*160]
	mov r11, qword [rsp+8*157]
	mov r10,r11
	mov r12, qword [rsp+8*159]
	add r10,r12
	mov qword [rsp+8*160],r10
	mov qword [rsp+8*157],r11
	mov qword [rsp+8*159],r12
	mov r10, qword [rsp+8*161]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*161],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*162]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*162],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*163]
	mov r11, qword [rsp+8*162]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*163],r10
	mov qword [rsp+8*162],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*164]
	mov r11, qword [rsp+8*161]
	mov r10,r11
	mov r12, qword [rsp+8*163]
	add r10,r12
	mov qword [rsp+8*164],r10
	mov qword [rsp+8*161],r11
	mov qword [rsp+8*163],r12
	mov r10, qword [rsp+8*165]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*165],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*166]
	mov r11, qword [rsp+8*164]
	mov r10,r11
	mov r12, qword [rsp+8*165]
	sub r10,r12
	mov qword [rsp+8*166],r10
	mov qword [rsp+8*164],r11
	mov qword [rsp+8*165],r12
	mov r10, qword [rsp+8*167]
	mov r11, qword [rsp+8*160]
	mov r10,r11
	mov r12, qword [rsp+8*166]
	sub r10,r12
	mov qword [rsp+8*167],r10
	mov qword [rsp+8*160],r11
	mov qword [rsp+8*166],r12
	mov r10, qword [rsp+8*168]
	mov r11, qword [rsp+8*153]
	mov r10,r11
	mov r12, qword [rsp+8*167]
	add r10,r12
	mov qword [rsp+8*168],r10
	mov qword [rsp+8*153],r11
	mov qword [rsp+8*167],r12
	mov r10, qword [rsp+8*169]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*169],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*170]
	mov r11, qword [rsp+8*169]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*170],r10
	mov qword [rsp+8*169],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*171]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*171],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*172]
	mov r11, qword [rsp+8*170]
	mov r10,r11
	mov r12, qword [rsp+8*171]
	sub r10,r12
	mov qword [rsp+8*172],r10
	mov qword [rsp+8*170],r11
	mov qword [rsp+8*171],r12
	mov r10, qword [rsp+8*173]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*173],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*174]
	mov r11, qword [rsp+8*173]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*174],r10
	mov qword [rsp+8*173],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*175]
	mov r11, qword [rsp+8*172]
	mov r10,r11
	mov r12, qword [rsp+8*174]
	add r10,r12
	mov qword [rsp+8*175],r10
	mov qword [rsp+8*172],r11
	mov qword [rsp+8*174],r12
	mov r10, qword [rsp+8*176]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*176],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*177]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*177],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*178]
	mov r11, qword [rsp+8*177]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*178],r10
	mov qword [rsp+8*177],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*179]
	mov r11, qword [rsp+8*176]
	mov r10,r11
	mov r12, qword [rsp+8*178]
	add r10,r12
	mov qword [rsp+8*179],r10
	mov qword [rsp+8*176],r11
	mov qword [rsp+8*178],r12
	mov r10, qword [rsp+8*180]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*180],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*181]
	mov r11, qword [rsp+8*179]
	mov r10,r11
	mov r12, qword [rsp+8*180]
	sub r10,r12
	mov qword [rsp+8*181],r10
	mov qword [rsp+8*179],r11
	mov qword [rsp+8*180],r12
	mov r10, qword [rsp+8*182]
	mov r11, qword [rsp+8*175]
	mov r10,r11
	mov r12, qword [rsp+8*181]
	sub r10,r12
	mov qword [rsp+8*182],r10
	mov qword [rsp+8*175],r11
	mov qword [rsp+8*181],r12
	mov r10, qword [rsp+8*183]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*183],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*184]
	mov r11, qword [rsp+8*183]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*184],r10
	mov qword [rsp+8*183],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*185]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*185],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*186]
	mov r11, qword [rsp+8*184]
	mov r10,r11
	mov r12, qword [rsp+8*185]
	sub r10,r12
	mov qword [rsp+8*186],r10
	mov qword [rsp+8*184],r11
	mov qword [rsp+8*185],r12
	mov r10, qword [rsp+8*187]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*187],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*188]
	mov r11, qword [rsp+8*187]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*188],r10
	mov qword [rsp+8*187],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*189]
	mov r11, qword [rsp+8*186]
	mov r10,r11
	mov r12, qword [rsp+8*188]
	add r10,r12
	mov qword [rsp+8*189],r10
	mov qword [rsp+8*186],r11
	mov qword [rsp+8*188],r12
	mov r10, qword [rsp+8*190]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*190],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*191]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*191],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*192]
	mov r11, qword [rsp+8*191]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*192],r10
	mov qword [rsp+8*191],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*193]
	mov r11, qword [rsp+8*190]
	mov r10,r11
	mov r12, qword [rsp+8*192]
	add r10,r12
	mov qword [rsp+8*193],r10
	mov qword [rsp+8*190],r11
	mov qword [rsp+8*192],r12
	mov r10, qword [rsp+8*194]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*194],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*195]
	mov r11, qword [rsp+8*193]
	mov r10,r11
	mov r12, qword [rsp+8*194]
	sub r10,r12
	mov qword [rsp+8*195],r10
	mov qword [rsp+8*193],r11
	mov qword [rsp+8*194],r12
	mov r10, qword [rsp+8*196]
	mov r11, qword [rsp+8*189]
	mov r10,r11
	mov r12, qword [rsp+8*195]
	sub r10,r12
	mov qword [rsp+8*196],r10
	mov qword [rsp+8*189],r11
	mov qword [rsp+8*195],r12
	mov r10, qword [rsp+8*197]
	mov r11, qword [rsp+8*182]
	mov r10,r11
	mov r12, qword [rsp+8*196]
	add r10,r12
	mov qword [rsp+8*197],r10
	mov qword [rsp+8*182],r11
	mov qword [rsp+8*196],r12
	mov r10, qword [rsp+8*198]
	mov r11, qword [rsp+8*168]
	mov r10,r11
	mov r12, qword [rsp+8*197]
	add r10,r12
	mov qword [rsp+8*198],r10
	mov qword [rsp+8*168],r11
	mov qword [rsp+8*197],r12
	mov r10, qword [rsp+8*199]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*199],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*200]
	mov r11, qword [rsp+8*199]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*200],r10
	mov qword [rsp+8*199],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*201]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*201],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*202]
	mov r11, qword [rsp+8*200]
	mov r10,r11
	mov r12, qword [rsp+8*201]
	sub r10,r12
	mov qword [rsp+8*202],r10
	mov qword [rsp+8*200],r11
	mov qword [rsp+8*201],r12
	mov r10, qword [rsp+8*203]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*203],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*204]
	mov r11, qword [rsp+8*203]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*204],r10
	mov qword [rsp+8*203],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*205]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*205],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*206]
	mov r11, qword [rsp+8*204]
	mov r10,r11
	mov r12, qword [rsp+8*205]
	sub r10,r12
	mov qword [rsp+8*206],r10
	mov qword [rsp+8*204],r11
	mov qword [rsp+8*205],r12
	mov r10, qword [rsp+8*207]
	mov r11, qword [rsp+8*202]
	mov r10,r11
	mov r12, qword [rsp+8*206]
	add r10,r12
	mov qword [rsp+8*207],r10
	mov qword [rsp+8*202],r11
	mov qword [rsp+8*206],r12
	mov r10, qword [rsp+8*208]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*208],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*209]
	mov r11, qword [rsp+8*208]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*209],r10
	mov qword [rsp+8*208],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*210]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*210],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*211]
	mov r11, qword [rsp+8*209]
	mov r10,r11
	mov r12, qword [rsp+8*210]
	sub r10,r12
	mov qword [rsp+8*211],r10
	mov qword [rsp+8*209],r11
	mov qword [rsp+8*210],r12
	mov r10, qword [rsp+8*212]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*212],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*213]
	mov r11, qword [rsp+8*212]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*213],r10
	mov qword [rsp+8*212],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*214]
	mov r11, qword [rsp+8*211]
	mov r10,r11
	mov r12, qword [rsp+8*213]
	add r10,r12
	mov qword [rsp+8*214],r10
	mov qword [rsp+8*211],r11
	mov qword [rsp+8*213],r12
	mov r10, qword [rsp+8*215]
	mov r11, qword [rsp+8*207]
	mov r10,r11
	mov r12, qword [rsp+8*214]
	add r10,r12
	mov qword [rsp+8*215],r10
	mov qword [rsp+8*207],r11
	mov qword [rsp+8*214],r12
	mov r10, qword [rsp+8*216]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*216],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*217]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*217],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*218]
	mov r11, qword [rsp+8*217]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*218],r10
	mov qword [rsp+8*217],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*219]
	mov r11, qword [rsp+8*216]
	mov r10,r11
	mov r12, qword [rsp+8*218]
	add r10,r12
	mov qword [rsp+8*219],r10
	mov qword [rsp+8*216],r11
	mov qword [rsp+8*218],r12
	mov r10, qword [rsp+8*220]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*220],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*221]
	mov r11, qword [rsp+8*219]
	mov r10,r11
	mov r12, qword [rsp+8*220]
	sub r10,r12
	mov qword [rsp+8*221],r10
	mov qword [rsp+8*219],r11
	mov qword [rsp+8*220],r12
	mov r10, qword [rsp+8*222]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*222],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*223]
	mov r11, qword [rsp+8*222]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*223],r10
	mov qword [rsp+8*222],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*224]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*224],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*225]
	mov r11, qword [rsp+8*223]
	mov r10,r11
	mov r12, qword [rsp+8*224]
	sub r10,r12
	mov qword [rsp+8*225],r10
	mov qword [rsp+8*223],r11
	mov qword [rsp+8*224],r12
	mov r10, qword [rsp+8*226]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*226],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*227]
	mov r11, qword [rsp+8*226]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*227],r10
	mov qword [rsp+8*226],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*228]
	mov r11, qword [rsp+8*225]
	mov r10,r11
	mov r12, qword [rsp+8*227]
	add r10,r12
	mov qword [rsp+8*228],r10
	mov qword [rsp+8*225],r11
	mov qword [rsp+8*227],r12
	mov r10, qword [rsp+8*229]
	mov r11, qword [rsp+8*221]
	mov r10,r11
	mov r12, qword [rsp+8*228]
	add r10,r12
	mov qword [rsp+8*229],r10
	mov qword [rsp+8*221],r11
	mov qword [rsp+8*228],r12
	mov r10, qword [rsp+8*230]
	mov r11, qword [rsp+8*215]
	mov r10,r11
	mov r12, qword [rsp+8*229]
	sub r10,r12
	mov qword [rsp+8*230],r10
	mov qword [rsp+8*215],r11
	mov qword [rsp+8*229],r12
	mov r10, qword [rsp+8*231]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*231],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*232]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*232],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*233]
	mov r11, qword [rsp+8*232]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*233],r10
	mov qword [rsp+8*232],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*234]
	mov r11, qword [rsp+8*231]
	mov r10,r11
	mov r12, qword [rsp+8*233]
	add r10,r12
	mov qword [rsp+8*234],r10
	mov qword [rsp+8*231],r11
	mov qword [rsp+8*233],r12
	mov r10, qword [rsp+8*235]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*235],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*236]
	mov r11, qword [rsp+8*234]
	mov r10,r11
	mov r12, qword [rsp+8*235]
	sub r10,r12
	mov qword [rsp+8*236],r10
	mov qword [rsp+8*234],r11
	mov qword [rsp+8*235],r12
	mov r10, qword [rsp+8*237]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*237],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*238]
	mov r11, qword [rsp+8*237]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*238],r10
	mov qword [rsp+8*237],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*239]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*239],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*240]
	mov r11, qword [rsp+8*238]
	mov r10,r11
	mov r12, qword [rsp+8*239]
	sub r10,r12
	mov qword [rsp+8*240],r10
	mov qword [rsp+8*238],r11
	mov qword [rsp+8*239],r12
	mov r10, qword [rsp+8*241]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*241],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*242]
	mov r11, qword [rsp+8*241]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*242],r10
	mov qword [rsp+8*241],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*243]
	mov r11, qword [rsp+8*240]
	mov r10,r11
	mov r12, qword [rsp+8*242]
	add r10,r12
	mov qword [rsp+8*243],r10
	mov qword [rsp+8*240],r11
	mov qword [rsp+8*242],r12
	mov r10, qword [rsp+8*244]
	mov r11, qword [rsp+8*236]
	mov r10,r11
	mov r12, qword [rsp+8*243]
	add r10,r12
	mov qword [rsp+8*244],r10
	mov qword [rsp+8*236],r11
	mov qword [rsp+8*243],r12
	mov r10, qword [rsp+8*245]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*245],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*246]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*246],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*247]
	mov r11, qword [rsp+8*246]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*247],r10
	mov qword [rsp+8*246],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*248]
	mov r11, qword [rsp+8*245]
	mov r10,r11
	mov r12, qword [rsp+8*247]
	add r10,r12
	mov qword [rsp+8*248],r10
	mov qword [rsp+8*245],r11
	mov qword [rsp+8*247],r12
	mov r10, qword [rsp+8*249]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*249],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*250]
	mov r11, qword [rsp+8*248]
	mov r10,r11
	mov r12, qword [rsp+8*249]
	sub r10,r12
	mov qword [rsp+8*250],r10
	mov qword [rsp+8*248],r11
	mov qword [rsp+8*249],r12
	mov r10, qword [rsp+8*251]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*251],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*252]
	mov r11, qword [rsp+8*251]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*252],r10
	mov qword [rsp+8*251],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*253]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*253],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*254]
	mov r11, qword [rsp+8*252]
	mov r10,r11
	mov r12, qword [rsp+8*253]
	sub r10,r12
	mov qword [rsp+8*254],r10
	mov qword [rsp+8*252],r11
	mov qword [rsp+8*253],r12
	mov r10, qword [rsp+8*255]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*255],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*256]
	mov r11, qword [rsp+8*255]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*256],r10
	mov qword [rsp+8*255],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*257]
	mov r11, qword [rsp+8*254]
	mov r10,r11
	mov r12, qword [rsp+8*256]
	add r10,r12
	mov qword [rsp+8*257],r10
	mov qword [rsp+8*254],r11
	mov qword [rsp+8*256],r12
	mov r10, qword [rsp+8*258]
	mov r11, qword [rsp+8*250]
	mov r10,r11
	mov r12, qword [rsp+8*257]
	add r10,r12
	mov qword [rsp+8*258],r10
	mov qword [rsp+8*250],r11
	mov qword [rsp+8*257],r12
	mov r10, qword [rsp+8*259]
	mov r11, qword [rsp+8*244]
	mov r10,r11
	mov r12, qword [rsp+8*258]
	sub r10,r12
	mov qword [rsp+8*259],r10
	mov qword [rsp+8*244],r11
	mov qword [rsp+8*258],r12
	mov r10, qword [rsp+8*260]
	mov r11, qword [rsp+8*230]
	mov r10,r11
	mov r12, qword [rsp+8*259]
	sub r10,r12
	mov qword [rsp+8*260],r10
	mov qword [rsp+8*230],r11
	mov qword [rsp+8*259],r12
	mov r10, qword [rsp+8*261]
	mov r11, qword [rsp+8*198]
	mov r10,r11
	mov r12, qword [rsp+8*260]
	add r10,r12
	mov qword [rsp+8*261],r10
	mov qword [rsp+8*198],r11
	mov qword [rsp+8*260],r12
	mov r10, qword [rsp+8*262]
	mov r11, qword [rsp+8*137]
	mov r10,r11
	mov r12, qword [rsp+8*261]
	sub r10,r12
	mov qword [rsp+8*262],r10
	mov qword [rsp+8*137],r11
	mov qword [rsp+8*261],r12
	mov r10, qword [gbl+8*9]
	mov r11, qword [rsp+8*262]
	mov r10,r11
	mov qword [gbl+8*9],r10
	mov qword [rsp+8*262],r11
	mov r10, qword [rsp+8*263]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*263],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*264]
	mov r11, qword [rsp+8*263]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*264],r10
	mov qword [rsp+8*263],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*265]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*265],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*266]
	mov r11, qword [rsp+8*264]
	mov r10,r11
	mov r12, qword [rsp+8*265]
	sub r10,r12
	mov qword [rsp+8*266],r10
	mov qword [rsp+8*264],r11
	mov qword [rsp+8*265],r12
	mov r10, qword [rsp+8*267]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*267],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*268]
	mov r11, qword [rsp+8*267]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*268],r10
	mov qword [rsp+8*267],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*269]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*269],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*270]
	mov r11, qword [rsp+8*268]
	mov r10,r11
	mov r12, qword [rsp+8*269]
	sub r10,r12
	mov qword [rsp+8*270],r10
	mov qword [rsp+8*268],r11
	mov qword [rsp+8*269],r12
	mov r10, qword [rsp+8*271]
	mov r11, qword [rsp+8*266]
	mov r10,r11
	mov r12, qword [rsp+8*270]
	add r10,r12
	mov qword [rsp+8*271],r10
	mov qword [rsp+8*266],r11
	mov qword [rsp+8*270],r12
	mov r10, qword [rsp+8*272]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*272],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*273]
	mov r11, qword [rsp+8*272]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*273],r10
	mov qword [rsp+8*272],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*274]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*274],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*275]
	mov r11, qword [rsp+8*273]
	mov r10,r11
	mov r12, qword [rsp+8*274]
	sub r10,r12
	mov qword [rsp+8*275],r10
	mov qword [rsp+8*273],r11
	mov qword [rsp+8*274],r12
	mov r10, qword [rsp+8*276]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*276],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*277]
	mov r11, qword [rsp+8*276]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*277],r10
	mov qword [rsp+8*276],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*278]
	mov r11, qword [rsp+8*275]
	mov r10,r11
	mov r12, qword [rsp+8*277]
	add r10,r12
	mov qword [rsp+8*278],r10
	mov qword [rsp+8*275],r11
	mov qword [rsp+8*277],r12
	mov r10, qword [rsp+8*279]
	mov r11, qword [rsp+8*271]
	mov r10,r11
	mov r12, qword [rsp+8*278]
	add r10,r12
	mov qword [rsp+8*279],r10
	mov qword [rsp+8*271],r11
	mov qword [rsp+8*278],r12
	mov r10, qword [rsp+8*280]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*280],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*281]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*281],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*282]
	mov r11, qword [rsp+8*281]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*282],r10
	mov qword [rsp+8*281],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*283]
	mov r11, qword [rsp+8*280]
	mov r10,r11
	mov r12, qword [rsp+8*282]
	add r10,r12
	mov qword [rsp+8*283],r10
	mov qword [rsp+8*280],r11
	mov qword [rsp+8*282],r12
	mov r10, qword [rsp+8*284]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*284],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*285]
	mov r11, qword [rsp+8*283]
	mov r10,r11
	mov r12, qword [rsp+8*284]
	sub r10,r12
	mov qword [rsp+8*285],r10
	mov qword [rsp+8*283],r11
	mov qword [rsp+8*284],r12
	mov r10, qword [rsp+8*286]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*286],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*287]
	mov r11, qword [rsp+8*286]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*287],r10
	mov qword [rsp+8*286],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*288]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*288],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*289]
	mov r11, qword [rsp+8*287]
	mov r10,r11
	mov r12, qword [rsp+8*288]
	sub r10,r12
	mov qword [rsp+8*289],r10
	mov qword [rsp+8*287],r11
	mov qword [rsp+8*288],r12
	mov r10, qword [rsp+8*290]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*290],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*291]
	mov r11, qword [rsp+8*290]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*291],r10
	mov qword [rsp+8*290],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*292]
	mov r11, qword [rsp+8*289]
	mov r10,r11
	mov r12, qword [rsp+8*291]
	add r10,r12
	mov qword [rsp+8*292],r10
	mov qword [rsp+8*289],r11
	mov qword [rsp+8*291],r12
	mov r10, qword [rsp+8*293]
	mov r11, qword [rsp+8*285]
	mov r10,r11
	mov r12, qword [rsp+8*292]
	add r10,r12
	mov qword [rsp+8*293],r10
	mov qword [rsp+8*285],r11
	mov qword [rsp+8*292],r12
	mov r10, qword [rsp+8*294]
	mov r11, qword [rsp+8*279]
	mov r10,r11
	mov r12, qword [rsp+8*293]
	sub r10,r12
	mov qword [rsp+8*294],r10
	mov qword [rsp+8*279],r11
	mov qword [rsp+8*293],r12
	mov r10, qword [rsp+8*295]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*295],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*296]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*296],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*297]
	mov r11, qword [rsp+8*296]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*297],r10
	mov qword [rsp+8*296],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*298]
	mov r11, qword [rsp+8*295]
	mov r10,r11
	mov r12, qword [rsp+8*297]
	add r10,r12
	mov qword [rsp+8*298],r10
	mov qword [rsp+8*295],r11
	mov qword [rsp+8*297],r12
	mov r10, qword [rsp+8*299]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*299],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*300]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*300],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*301]
	mov r11, qword [rsp+8*300]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*301],r10
	mov qword [rsp+8*300],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*302]
	mov r11, qword [rsp+8*299]
	mov r10,r11
	mov r12, qword [rsp+8*301]
	add r10,r12
	mov qword [rsp+8*302],r10
	mov qword [rsp+8*299],r11
	mov qword [rsp+8*301],r12
	mov r10, qword [rsp+8*303]
	mov r11, qword [rsp+8*298]
	mov r10,r11
	mov r12, qword [rsp+8*302]
	sub r10,r12
	mov qword [rsp+8*303],r10
	mov qword [rsp+8*298],r11
	mov qword [rsp+8*302],r12
	mov r10, qword [rsp+8*304]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*304],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*305]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*305],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*306]
	mov r11, qword [rsp+8*305]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*306],r10
	mov qword [rsp+8*305],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*307]
	mov r11, qword [rsp+8*304]
	mov r10,r11
	mov r12, qword [rsp+8*306]
	add r10,r12
	mov qword [rsp+8*307],r10
	mov qword [rsp+8*304],r11
	mov qword [rsp+8*306],r12
	mov r10, qword [rsp+8*308]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*308],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*309]
	mov r11, qword [rsp+8*307]
	mov r10,r11
	mov r12, qword [rsp+8*308]
	sub r10,r12
	mov qword [rsp+8*309],r10
	mov qword [rsp+8*307],r11
	mov qword [rsp+8*308],r12
	mov r10, qword [rsp+8*310]
	mov r11, qword [rsp+8*303]
	mov r10,r11
	mov r12, qword [rsp+8*309]
	sub r10,r12
	mov qword [rsp+8*310],r10
	mov qword [rsp+8*303],r11
	mov qword [rsp+8*309],r12
	mov r10, qword [rsp+8*311]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*311],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*312]
	mov r11, qword [rsp+8*311]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*312],r10
	mov qword [rsp+8*311],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*313]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*313],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*314]
	mov r11, qword [rsp+8*312]
	mov r10,r11
	mov r12, qword [rsp+8*313]
	sub r10,r12
	mov qword [rsp+8*314],r10
	mov qword [rsp+8*312],r11
	mov qword [rsp+8*313],r12
	mov r10, qword [rsp+8*315]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*315],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*316]
	mov r11, qword [rsp+8*315]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*316],r10
	mov qword [rsp+8*315],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*317]
	mov r11, qword [rsp+8*314]
	mov r10,r11
	mov r12, qword [rsp+8*316]
	add r10,r12
	mov qword [rsp+8*317],r10
	mov qword [rsp+8*314],r11
	mov qword [rsp+8*316],r12
	mov r10, qword [rsp+8*318]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*318],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*319]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*319],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*320]
	mov r11, qword [rsp+8*319]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*320],r10
	mov qword [rsp+8*319],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*321]
	mov r11, qword [rsp+8*318]
	mov r10,r11
	mov r12, qword [rsp+8*320]
	add r10,r12
	mov qword [rsp+8*321],r10
	mov qword [rsp+8*318],r11
	mov qword [rsp+8*320],r12
	mov r10, qword [rsp+8*322]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*322],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*323]
	mov r11, qword [rsp+8*321]
	mov r10,r11
	mov r12, qword [rsp+8*322]
	sub r10,r12
	mov qword [rsp+8*323],r10
	mov qword [rsp+8*321],r11
	mov qword [rsp+8*322],r12
	mov r10, qword [rsp+8*324]
	mov r11, qword [rsp+8*317]
	mov r10,r11
	mov r12, qword [rsp+8*323]
	sub r10,r12
	mov qword [rsp+8*324],r10
	mov qword [rsp+8*317],r11
	mov qword [rsp+8*323],r12
	mov r10, qword [rsp+8*325]
	mov r11, qword [rsp+8*310]
	mov r10,r11
	mov r12, qword [rsp+8*324]
	add r10,r12
	mov qword [rsp+8*325],r10
	mov qword [rsp+8*310],r11
	mov qword [rsp+8*324],r12
	mov r10, qword [rsp+8*326]
	mov r11, qword [rsp+8*294]
	mov r10,r11
	mov r12, qword [rsp+8*325]
	sub r10,r12
	mov qword [rsp+8*326],r10
	mov qword [rsp+8*294],r11
	mov qword [rsp+8*325],r12
	mov r10, qword [rsp+8*327]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*327],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*328]
	mov r11, qword [rsp+8*327]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*328],r10
	mov qword [rsp+8*327],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*329]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*329],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*330]
	mov r11, qword [rsp+8*328]
	mov r10,r11
	mov r12, qword [rsp+8*329]
	sub r10,r12
	mov qword [rsp+8*330],r10
	mov qword [rsp+8*328],r11
	mov qword [rsp+8*329],r12
	mov r10, qword [rsp+8*331]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*331],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*332]
	mov r11, qword [rsp+8*331]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*332],r10
	mov qword [rsp+8*331],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*333]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*333],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*334]
	mov r11, qword [rsp+8*332]
	mov r10,r11
	mov r12, qword [rsp+8*333]
	sub r10,r12
	mov qword [rsp+8*334],r10
	mov qword [rsp+8*332],r11
	mov qword [rsp+8*333],r12
	mov r10, qword [rsp+8*335]
	mov r11, qword [rsp+8*330]
	mov r10,r11
	mov r12, qword [rsp+8*334]
	add r10,r12
	mov qword [rsp+8*335],r10
	mov qword [rsp+8*330],r11
	mov qword [rsp+8*334],r12
	mov r10, qword [rsp+8*336]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*336],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*337]
	mov r11, qword [rsp+8*336]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*337],r10
	mov qword [rsp+8*336],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*338]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*338],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*339]
	mov r11, qword [rsp+8*337]
	mov r10,r11
	mov r12, qword [rsp+8*338]
	sub r10,r12
	mov qword [rsp+8*339],r10
	mov qword [rsp+8*337],r11
	mov qword [rsp+8*338],r12
	mov r10, qword [rsp+8*340]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*340],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*341]
	mov r11, qword [rsp+8*340]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*341],r10
	mov qword [rsp+8*340],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*342]
	mov r11, qword [rsp+8*339]
	mov r10,r11
	mov r12, qword [rsp+8*341]
	add r10,r12
	mov qword [rsp+8*342],r10
	mov qword [rsp+8*339],r11
	mov qword [rsp+8*341],r12
	mov r10, qword [rsp+8*343]
	mov r11, qword [rsp+8*335]
	mov r10,r11
	mov r12, qword [rsp+8*342]
	add r10,r12
	mov qword [rsp+8*343],r10
	mov qword [rsp+8*335],r11
	mov qword [rsp+8*342],r12
	mov r10, qword [rsp+8*344]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*344],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*345]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*345],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*346]
	mov r11, qword [rsp+8*345]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*346],r10
	mov qword [rsp+8*345],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*347]
	mov r11, qword [rsp+8*344]
	mov r10,r11
	mov r12, qword [rsp+8*346]
	add r10,r12
	mov qword [rsp+8*347],r10
	mov qword [rsp+8*344],r11
	mov qword [rsp+8*346],r12
	mov r10, qword [rsp+8*348]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*348],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*349]
	mov r11, qword [rsp+8*347]
	mov r10,r11
	mov r12, qword [rsp+8*348]
	sub r10,r12
	mov qword [rsp+8*349],r10
	mov qword [rsp+8*347],r11
	mov qword [rsp+8*348],r12
	mov r10, qword [rsp+8*350]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*350],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*351]
	mov r11, qword [rsp+8*350]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*351],r10
	mov qword [rsp+8*350],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*352]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*352],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*353]
	mov r11, qword [rsp+8*351]
	mov r10,r11
	mov r12, qword [rsp+8*352]
	sub r10,r12
	mov qword [rsp+8*353],r10
	mov qword [rsp+8*351],r11
	mov qword [rsp+8*352],r12
	mov r10, qword [rsp+8*354]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*354],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*355]
	mov r11, qword [rsp+8*354]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*355],r10
	mov qword [rsp+8*354],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*356]
	mov r11, qword [rsp+8*353]
	mov r10,r11
	mov r12, qword [rsp+8*355]
	add r10,r12
	mov qword [rsp+8*356],r10
	mov qword [rsp+8*353],r11
	mov qword [rsp+8*355],r12
	mov r10, qword [rsp+8*357]
	mov r11, qword [rsp+8*349]
	mov r10,r11
	mov r12, qword [rsp+8*356]
	add r10,r12
	mov qword [rsp+8*357],r10
	mov qword [rsp+8*349],r11
	mov qword [rsp+8*356],r12
	mov r10, qword [rsp+8*358]
	mov r11, qword [rsp+8*343]
	mov r10,r11
	mov r12, qword [rsp+8*357]
	sub r10,r12
	mov qword [rsp+8*358],r10
	mov qword [rsp+8*343],r11
	mov qword [rsp+8*357],r12
	mov r10, qword [rsp+8*359]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*359],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*360]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*360],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*361]
	mov r11, qword [rsp+8*360]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*361],r10
	mov qword [rsp+8*360],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*362]
	mov r11, qword [rsp+8*359]
	mov r10,r11
	mov r12, qword [rsp+8*361]
	add r10,r12
	mov qword [rsp+8*362],r10
	mov qword [rsp+8*359],r11
	mov qword [rsp+8*361],r12
	mov r10, qword [rsp+8*363]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*363],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*364]
	mov r11, qword [rsp+8*362]
	mov r10,r11
	mov r12, qword [rsp+8*363]
	sub r10,r12
	mov qword [rsp+8*364],r10
	mov qword [rsp+8*362],r11
	mov qword [rsp+8*363],r12
	mov r10, qword [rsp+8*365]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*365],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*366]
	mov r11, qword [rsp+8*365]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*366],r10
	mov qword [rsp+8*365],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*367]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*367],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*368]
	mov r11, qword [rsp+8*366]
	mov r10,r11
	mov r12, qword [rsp+8*367]
	sub r10,r12
	mov qword [rsp+8*368],r10
	mov qword [rsp+8*366],r11
	mov qword [rsp+8*367],r12
	mov r10, qword [rsp+8*369]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*369],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*370]
	mov r11, qword [rsp+8*369]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*370],r10
	mov qword [rsp+8*369],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*371]
	mov r11, qword [rsp+8*368]
	mov r10,r11
	mov r12, qword [rsp+8*370]
	add r10,r12
	mov qword [rsp+8*371],r10
	mov qword [rsp+8*368],r11
	mov qword [rsp+8*370],r12
	mov r10, qword [rsp+8*372]
	mov r11, qword [rsp+8*364]
	mov r10,r11
	mov r12, qword [rsp+8*371]
	add r10,r12
	mov qword [rsp+8*372],r10
	mov qword [rsp+8*364],r11
	mov qword [rsp+8*371],r12
	mov r10, qword [rsp+8*373]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*373],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*374]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*374],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*375]
	mov r11, qword [rsp+8*374]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*375],r10
	mov qword [rsp+8*374],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*376]
	mov r11, qword [rsp+8*373]
	mov r10,r11
	mov r12, qword [rsp+8*375]
	add r10,r12
	mov qword [rsp+8*376],r10
	mov qword [rsp+8*373],r11
	mov qword [rsp+8*375],r12
	mov r10, qword [rsp+8*377]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*377],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*378]
	mov r11, qword [rsp+8*376]
	mov r10,r11
	mov r12, qword [rsp+8*377]
	sub r10,r12
	mov qword [rsp+8*378],r10
	mov qword [rsp+8*376],r11
	mov qword [rsp+8*377],r12
	mov r10, qword [rsp+8*379]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*379],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*380]
	mov r11, qword [rsp+8*379]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*380],r10
	mov qword [rsp+8*379],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*381]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*381],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*382]
	mov r11, qword [rsp+8*380]
	mov r10,r11
	mov r12, qword [rsp+8*381]
	sub r10,r12
	mov qword [rsp+8*382],r10
	mov qword [rsp+8*380],r11
	mov qword [rsp+8*381],r12
	mov r10, qword [rsp+8*383]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*383],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*384]
	mov r11, qword [rsp+8*383]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*384],r10
	mov qword [rsp+8*383],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*385]
	mov r11, qword [rsp+8*382]
	mov r10,r11
	mov r12, qword [rsp+8*384]
	add r10,r12
	mov qword [rsp+8*385],r10
	mov qword [rsp+8*382],r11
	mov qword [rsp+8*384],r12
	mov r10, qword [rsp+8*386]
	mov r11, qword [rsp+8*378]
	mov r10,r11
	mov r12, qword [rsp+8*385]
	add r10,r12
	mov qword [rsp+8*386],r10
	mov qword [rsp+8*378],r11
	mov qword [rsp+8*385],r12
	mov r10, qword [rsp+8*387]
	mov r11, qword [rsp+8*372]
	mov r10,r11
	mov r12, qword [rsp+8*386]
	sub r10,r12
	mov qword [rsp+8*387],r10
	mov qword [rsp+8*372],r11
	mov qword [rsp+8*386],r12
	mov r10, qword [rsp+8*388]
	mov r11, qword [rsp+8*358]
	mov r10,r11
	mov r12, qword [rsp+8*387]
	sub r10,r12
	mov qword [rsp+8*388],r10
	mov qword [rsp+8*358],r11
	mov qword [rsp+8*387],r12
	mov r10, qword [rsp+8*389]
	mov r11, qword [rsp+8*326]
	mov r10,r11
	mov r12, qword [rsp+8*388]
	add r10,r12
	mov qword [rsp+8*389],r10
	mov qword [rsp+8*326],r11
	mov qword [rsp+8*388],r12
	mov r10, qword [rsp+8*390]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*390],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*391]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*391],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*392]
	mov r11, qword [rsp+8*391]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*392],r10
	mov qword [rsp+8*391],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*393]
	mov r11, qword [rsp+8*390]
	mov r10,r11
	mov r12, qword [rsp+8*392]
	add r10,r12
	mov qword [rsp+8*393],r10
	mov qword [rsp+8*390],r11
	mov qword [rsp+8*392],r12
	mov r10, qword [rsp+8*394]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*394],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*395]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*395],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*396]
	mov r11, qword [rsp+8*395]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*396],r10
	mov qword [rsp+8*395],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*397]
	mov r11, qword [rsp+8*394]
	mov r10,r11
	mov r12, qword [rsp+8*396]
	add r10,r12
	mov qword [rsp+8*397],r10
	mov qword [rsp+8*394],r11
	mov qword [rsp+8*396],r12
	mov r10, qword [rsp+8*398]
	mov r11, qword [rsp+8*393]
	mov r10,r11
	mov r12, qword [rsp+8*397]
	sub r10,r12
	mov qword [rsp+8*398],r10
	mov qword [rsp+8*393],r11
	mov qword [rsp+8*397],r12
	mov r10, qword [rsp+8*399]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*399],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*400]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*400],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*401]
	mov r11, qword [rsp+8*400]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*401],r10
	mov qword [rsp+8*400],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*402]
	mov r11, qword [rsp+8*399]
	mov r10,r11
	mov r12, qword [rsp+8*401]
	add r10,r12
	mov qword [rsp+8*402],r10
	mov qword [rsp+8*399],r11
	mov qword [rsp+8*401],r12
	mov r10, qword [rsp+8*403]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*403],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*404]
	mov r11, qword [rsp+8*402]
	mov r10,r11
	mov r12, qword [rsp+8*403]
	sub r10,r12
	mov qword [rsp+8*404],r10
	mov qword [rsp+8*402],r11
	mov qword [rsp+8*403],r12
	mov r10, qword [rsp+8*405]
	mov r11, qword [rsp+8*398]
	mov r10,r11
	mov r12, qword [rsp+8*404]
	sub r10,r12
	mov qword [rsp+8*405],r10
	mov qword [rsp+8*398],r11
	mov qword [rsp+8*404],r12
	mov r10, qword [rsp+8*406]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*406],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*407]
	mov r11, qword [rsp+8*406]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*407],r10
	mov qword [rsp+8*406],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*408]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*408],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*409]
	mov r11, qword [rsp+8*407]
	mov r10,r11
	mov r12, qword [rsp+8*408]
	sub r10,r12
	mov qword [rsp+8*409],r10
	mov qword [rsp+8*407],r11
	mov qword [rsp+8*408],r12
	mov r10, qword [rsp+8*410]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*410],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*411]
	mov r11, qword [rsp+8*410]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*411],r10
	mov qword [rsp+8*410],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*412]
	mov r11, qword [rsp+8*409]
	mov r10,r11
	mov r12, qword [rsp+8*411]
	add r10,r12
	mov qword [rsp+8*412],r10
	mov qword [rsp+8*409],r11
	mov qword [rsp+8*411],r12
	mov r10, qword [rsp+8*413]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*413],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*414]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*414],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*415]
	mov r11, qword [rsp+8*414]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*415],r10
	mov qword [rsp+8*414],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*416]
	mov r11, qword [rsp+8*413]
	mov r10,r11
	mov r12, qword [rsp+8*415]
	add r10,r12
	mov qword [rsp+8*416],r10
	mov qword [rsp+8*413],r11
	mov qword [rsp+8*415],r12
	mov r10, qword [rsp+8*417]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*417],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*418]
	mov r11, qword [rsp+8*416]
	mov r10,r11
	mov r12, qword [rsp+8*417]
	sub r10,r12
	mov qword [rsp+8*418],r10
	mov qword [rsp+8*416],r11
	mov qword [rsp+8*417],r12
	mov r10, qword [rsp+8*419]
	mov r11, qword [rsp+8*412]
	mov r10,r11
	mov r12, qword [rsp+8*418]
	sub r10,r12
	mov qword [rsp+8*419],r10
	mov qword [rsp+8*412],r11
	mov qword [rsp+8*418],r12
	mov r10, qword [rsp+8*420]
	mov r11, qword [rsp+8*405]
	mov r10,r11
	mov r12, qword [rsp+8*419]
	add r10,r12
	mov qword [rsp+8*420],r10
	mov qword [rsp+8*405],r11
	mov qword [rsp+8*419],r12
	mov r10, qword [rsp+8*421]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*421],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*422]
	mov r11, qword [rsp+8*421]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*422],r10
	mov qword [rsp+8*421],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*423]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*423],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*424]
	mov r11, qword [rsp+8*422]
	mov r10,r11
	mov r12, qword [rsp+8*423]
	sub r10,r12
	mov qword [rsp+8*424],r10
	mov qword [rsp+8*422],r11
	mov qword [rsp+8*423],r12
	mov r10, qword [rsp+8*425]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*425],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*426]
	mov r11, qword [rsp+8*425]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*426],r10
	mov qword [rsp+8*425],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*427]
	mov r11, qword [rsp+8*424]
	mov r10,r11
	mov r12, qword [rsp+8*426]
	add r10,r12
	mov qword [rsp+8*427],r10
	mov qword [rsp+8*424],r11
	mov qword [rsp+8*426],r12
	mov r10, qword [rsp+8*428]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*428],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*429]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*429],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*430]
	mov r11, qword [rsp+8*429]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*430],r10
	mov qword [rsp+8*429],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*431]
	mov r11, qword [rsp+8*428]
	mov r10,r11
	mov r12, qword [rsp+8*430]
	add r10,r12
	mov qword [rsp+8*431],r10
	mov qword [rsp+8*428],r11
	mov qword [rsp+8*430],r12
	mov r10, qword [rsp+8*432]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*432],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*433]
	mov r11, qword [rsp+8*431]
	mov r10,r11
	mov r12, qword [rsp+8*432]
	sub r10,r12
	mov qword [rsp+8*433],r10
	mov qword [rsp+8*431],r11
	mov qword [rsp+8*432],r12
	mov r10, qword [rsp+8*434]
	mov r11, qword [rsp+8*427]
	mov r10,r11
	mov r12, qword [rsp+8*433]
	sub r10,r12
	mov qword [rsp+8*434],r10
	mov qword [rsp+8*427],r11
	mov qword [rsp+8*433],r12
	mov r10, qword [rsp+8*435]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*435],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*436]
	mov r11, qword [rsp+8*435]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*436],r10
	mov qword [rsp+8*435],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*437]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*437],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*438]
	mov r11, qword [rsp+8*436]
	mov r10,r11
	mov r12, qword [rsp+8*437]
	sub r10,r12
	mov qword [rsp+8*438],r10
	mov qword [rsp+8*436],r11
	mov qword [rsp+8*437],r12
	mov r10, qword [rsp+8*439]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*439],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*440]
	mov r11, qword [rsp+8*439]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*440],r10
	mov qword [rsp+8*439],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*441]
	mov r11, qword [rsp+8*438]
	mov r10,r11
	mov r12, qword [rsp+8*440]
	add r10,r12
	mov qword [rsp+8*441],r10
	mov qword [rsp+8*438],r11
	mov qword [rsp+8*440],r12
	mov r10, qword [rsp+8*442]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*442],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*443]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*443],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*444]
	mov r11, qword [rsp+8*443]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*444],r10
	mov qword [rsp+8*443],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*445]
	mov r11, qword [rsp+8*442]
	mov r10,r11
	mov r12, qword [rsp+8*444]
	add r10,r12
	mov qword [rsp+8*445],r10
	mov qword [rsp+8*442],r11
	mov qword [rsp+8*444],r12
	mov r10, qword [rsp+8*446]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*446],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*447]
	mov r11, qword [rsp+8*445]
	mov r10,r11
	mov r12, qword [rsp+8*446]
	sub r10,r12
	mov qword [rsp+8*447],r10
	mov qword [rsp+8*445],r11
	mov qword [rsp+8*446],r12
	mov r10, qword [rsp+8*448]
	mov r11, qword [rsp+8*441]
	mov r10,r11
	mov r12, qword [rsp+8*447]
	sub r10,r12
	mov qword [rsp+8*448],r10
	mov qword [rsp+8*441],r11
	mov qword [rsp+8*447],r12
	mov r10, qword [rsp+8*449]
	mov r11, qword [rsp+8*434]
	mov r10,r11
	mov r12, qword [rsp+8*448]
	add r10,r12
	mov qword [rsp+8*449],r10
	mov qword [rsp+8*434],r11
	mov qword [rsp+8*448],r12
	mov r10, qword [rsp+8*450]
	mov r11, qword [rsp+8*420]
	mov r10,r11
	mov r12, qword [rsp+8*449]
	add r10,r12
	mov qword [rsp+8*450],r10
	mov qword [rsp+8*420],r11
	mov qword [rsp+8*449],r12
	mov r10, qword [rsp+8*451]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*451],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*452]
	mov r11, qword [rsp+8*451]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*452],r10
	mov qword [rsp+8*451],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*453]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*453],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*454]
	mov r11, qword [rsp+8*452]
	mov r10,r11
	mov r12, qword [rsp+8*453]
	sub r10,r12
	mov qword [rsp+8*454],r10
	mov qword [rsp+8*452],r11
	mov qword [rsp+8*453],r12
	mov r10, qword [rsp+8*455]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*455],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*456]
	mov r11, qword [rsp+8*455]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*456],r10
	mov qword [rsp+8*455],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*457]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*457],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*458]
	mov r11, qword [rsp+8*456]
	mov r10,r11
	mov r12, qword [rsp+8*457]
	sub r10,r12
	mov qword [rsp+8*458],r10
	mov qword [rsp+8*456],r11
	mov qword [rsp+8*457],r12
	mov r10, qword [rsp+8*459]
	mov r11, qword [rsp+8*454]
	mov r10,r11
	mov r12, qword [rsp+8*458]
	add r10,r12
	mov qword [rsp+8*459],r10
	mov qword [rsp+8*454],r11
	mov qword [rsp+8*458],r12
	mov r10, qword [rsp+8*460]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*460],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*461]
	mov r11, qword [rsp+8*460]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*461],r10
	mov qword [rsp+8*460],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*462]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*462],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*463]
	mov r11, qword [rsp+8*461]
	mov r10,r11
	mov r12, qword [rsp+8*462]
	sub r10,r12
	mov qword [rsp+8*463],r10
	mov qword [rsp+8*461],r11
	mov qword [rsp+8*462],r12
	mov r10, qword [rsp+8*464]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*464],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*465]
	mov r11, qword [rsp+8*464]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*465],r10
	mov qword [rsp+8*464],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*466]
	mov r11, qword [rsp+8*463]
	mov r10,r11
	mov r12, qword [rsp+8*465]
	add r10,r12
	mov qword [rsp+8*466],r10
	mov qword [rsp+8*463],r11
	mov qword [rsp+8*465],r12
	mov r10, qword [rsp+8*467]
	mov r11, qword [rsp+8*459]
	mov r10,r11
	mov r12, qword [rsp+8*466]
	add r10,r12
	mov qword [rsp+8*467],r10
	mov qword [rsp+8*459],r11
	mov qword [rsp+8*466],r12
	mov r10, qword [rsp+8*468]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*468],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*469]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*469],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*470]
	mov r11, qword [rsp+8*469]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*470],r10
	mov qword [rsp+8*469],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*471]
	mov r11, qword [rsp+8*468]
	mov r10,r11
	mov r12, qword [rsp+8*470]
	add r10,r12
	mov qword [rsp+8*471],r10
	mov qword [rsp+8*468],r11
	mov qword [rsp+8*470],r12
	mov r10, qword [rsp+8*472]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*472],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*473]
	mov r11, qword [rsp+8*471]
	mov r10,r11
	mov r12, qword [rsp+8*472]
	sub r10,r12
	mov qword [rsp+8*473],r10
	mov qword [rsp+8*471],r11
	mov qword [rsp+8*472],r12
	mov r10, qword [rsp+8*474]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*474],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*475]
	mov r11, qword [rsp+8*474]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*475],r10
	mov qword [rsp+8*474],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*476]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*476],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*477]
	mov r11, qword [rsp+8*475]
	mov r10,r11
	mov r12, qword [rsp+8*476]
	sub r10,r12
	mov qword [rsp+8*477],r10
	mov qword [rsp+8*475],r11
	mov qword [rsp+8*476],r12
	mov r10, qword [rsp+8*478]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*478],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*479]
	mov r11, qword [rsp+8*478]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*479],r10
	mov qword [rsp+8*478],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*480]
	mov r11, qword [rsp+8*477]
	mov r10,r11
	mov r12, qword [rsp+8*479]
	add r10,r12
	mov qword [rsp+8*480],r10
	mov qword [rsp+8*477],r11
	mov qword [rsp+8*479],r12
	mov r10, qword [rsp+8*481]
	mov r11, qword [rsp+8*473]
	mov r10,r11
	mov r12, qword [rsp+8*480]
	add r10,r12
	mov qword [rsp+8*481],r10
	mov qword [rsp+8*473],r11
	mov qword [rsp+8*480],r12
	mov r10, qword [rsp+8*482]
	mov r11, qword [rsp+8*467]
	mov r10,r11
	mov r12, qword [rsp+8*481]
	sub r10,r12
	mov qword [rsp+8*482],r10
	mov qword [rsp+8*467],r11
	mov qword [rsp+8*481],r12
	mov r10, qword [rsp+8*483]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*483],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*484]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*484],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*485]
	mov r11, qword [rsp+8*484]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*485],r10
	mov qword [rsp+8*484],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*486]
	mov r11, qword [rsp+8*483]
	mov r10,r11
	mov r12, qword [rsp+8*485]
	add r10,r12
	mov qword [rsp+8*486],r10
	mov qword [rsp+8*483],r11
	mov qword [rsp+8*485],r12
	mov r10, qword [rsp+8*487]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*487],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*488]
	mov r11, qword [rsp+8*486]
	mov r10,r11
	mov r12, qword [rsp+8*487]
	sub r10,r12
	mov qword [rsp+8*488],r10
	mov qword [rsp+8*486],r11
	mov qword [rsp+8*487],r12
	mov r10, qword [rsp+8*489]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*489],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*490]
	mov r11, qword [rsp+8*489]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*490],r10
	mov qword [rsp+8*489],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*491]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*491],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*492]
	mov r11, qword [rsp+8*490]
	mov r10,r11
	mov r12, qword [rsp+8*491]
	sub r10,r12
	mov qword [rsp+8*492],r10
	mov qword [rsp+8*490],r11
	mov qword [rsp+8*491],r12
	mov r10, qword [rsp+8*493]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*493],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*494]
	mov r11, qword [rsp+8*493]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*494],r10
	mov qword [rsp+8*493],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*495]
	mov r11, qword [rsp+8*492]
	mov r10,r11
	mov r12, qword [rsp+8*494]
	add r10,r12
	mov qword [rsp+8*495],r10
	mov qword [rsp+8*492],r11
	mov qword [rsp+8*494],r12
	mov r10, qword [rsp+8*496]
	mov r11, qword [rsp+8*488]
	mov r10,r11
	mov r12, qword [rsp+8*495]
	add r10,r12
	mov qword [rsp+8*496],r10
	mov qword [rsp+8*488],r11
	mov qword [rsp+8*495],r12
	mov r10, qword [rsp+8*497]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*497],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*498]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*498],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*499]
	mov r11, qword [rsp+8*498]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*499],r10
	mov qword [rsp+8*498],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*500]
	mov r11, qword [rsp+8*497]
	mov r10,r11
	mov r12, qword [rsp+8*499]
	add r10,r12
	mov qword [rsp+8*500],r10
	mov qword [rsp+8*497],r11
	mov qword [rsp+8*499],r12
	mov r10, qword [rsp+8*501]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*501],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*502]
	mov r11, qword [rsp+8*500]
	mov r10,r11
	mov r12, qword [rsp+8*501]
	sub r10,r12
	mov qword [rsp+8*502],r10
	mov qword [rsp+8*500],r11
	mov qword [rsp+8*501],r12
	mov r10, qword [rsp+8*503]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*503],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*504]
	mov r11, qword [rsp+8*503]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*504],r10
	mov qword [rsp+8*503],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*505]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*505],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*506]
	mov r11, qword [rsp+8*504]
	mov r10,r11
	mov r12, qword [rsp+8*505]
	sub r10,r12
	mov qword [rsp+8*506],r10
	mov qword [rsp+8*504],r11
	mov qword [rsp+8*505],r12
	mov r10, qword [rsp+8*507]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*507],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*508]
	mov r11, qword [rsp+8*507]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*508],r10
	mov qword [rsp+8*507],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*509]
	mov r11, qword [rsp+8*506]
	mov r10,r11
	mov r12, qword [rsp+8*508]
	add r10,r12
	mov qword [rsp+8*509],r10
	mov qword [rsp+8*506],r11
	mov qword [rsp+8*508],r12
	mov r10, qword [rsp+8*510]
	mov r11, qword [rsp+8*502]
	mov r10,r11
	mov r12, qword [rsp+8*509]
	add r10,r12
	mov qword [rsp+8*510],r10
	mov qword [rsp+8*502],r11
	mov qword [rsp+8*509],r12
	mov r10, qword [rsp+8*511]
	mov r11, qword [rsp+8*496]
	mov r10,r11
	mov r12, qword [rsp+8*510]
	sub r10,r12
	mov qword [rsp+8*511],r10
	mov qword [rsp+8*496],r11
	mov qword [rsp+8*510],r12
	mov r10, qword [rsp+8*512]
	mov r11, qword [rsp+8*482]
	mov r10,r11
	mov r12, qword [rsp+8*511]
	sub r10,r12
	mov qword [rsp+8*512],r10
	mov qword [rsp+8*482],r11
	mov qword [rsp+8*511],r12
	mov r10, qword [rsp+8*513]
	mov r11, qword [rsp+8*450]
	mov r10,r11
	mov r12, qword [rsp+8*512]
	add r10,r12
	mov qword [rsp+8*513],r10
	mov qword [rsp+8*450],r11
	mov qword [rsp+8*512],r12
	mov r10, qword [rsp+8*514]
	mov r11, qword [rsp+8*389]
	mov r10,r11
	mov r12, qword [rsp+8*513]
	sub r10,r12
	mov qword [rsp+8*514],r10
	mov qword [rsp+8*389],r11
	mov qword [rsp+8*513],r12
	mov r10, qword [gbl+8*11]
	mov r11, qword [rsp+8*514]
	mov r10,r11
	mov qword [gbl+8*11],r10
	mov qword [rsp+8*514],r11
	mov r10, qword [rsp+8*515]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*515],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*516]
	mov r11, qword [rsp+8*515]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*516],r10
	mov qword [rsp+8*515],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*517]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*517],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*518]
	mov r11, qword [rsp+8*516]
	mov r10,r11
	mov r12, qword [rsp+8*517]
	sub r10,r12
	mov qword [rsp+8*518],r10
	mov qword [rsp+8*516],r11
	mov qword [rsp+8*517],r12
	mov r10, qword [rsp+8*519]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*519],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*520]
	mov r11, qword [rsp+8*519]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*520],r10
	mov qword [rsp+8*519],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*521]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*521],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*522]
	mov r11, qword [rsp+8*520]
	mov r10,r11
	mov r12, qword [rsp+8*521]
	sub r10,r12
	mov qword [rsp+8*522],r10
	mov qword [rsp+8*520],r11
	mov qword [rsp+8*521],r12
	mov r10, qword [rsp+8*523]
	mov r11, qword [rsp+8*518]
	mov r10,r11
	mov r12, qword [rsp+8*522]
	add r10,r12
	mov qword [rsp+8*523],r10
	mov qword [rsp+8*518],r11
	mov qword [rsp+8*522],r12
	mov r10, qword [rsp+8*524]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*524],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*525]
	mov r11, qword [rsp+8*524]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*525],r10
	mov qword [rsp+8*524],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*526]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*526],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*527]
	mov r11, qword [rsp+8*525]
	mov r10,r11
	mov r12, qword [rsp+8*526]
	sub r10,r12
	mov qword [rsp+8*527],r10
	mov qword [rsp+8*525],r11
	mov qword [rsp+8*526],r12
	mov r10, qword [rsp+8*528]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*528],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*529]
	mov r11, qword [rsp+8*528]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*529],r10
	mov qword [rsp+8*528],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*530]
	mov r11, qword [rsp+8*527]
	mov r10,r11
	mov r12, qword [rsp+8*529]
	add r10,r12
	mov qword [rsp+8*530],r10
	mov qword [rsp+8*527],r11
	mov qword [rsp+8*529],r12
	mov r10, qword [rsp+8*531]
	mov r11, qword [rsp+8*523]
	mov r10,r11
	mov r12, qword [rsp+8*530]
	add r10,r12
	mov qword [rsp+8*531],r10
	mov qword [rsp+8*523],r11
	mov qword [rsp+8*530],r12
	mov r10, qword [rsp+8*532]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*532],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*533]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*533],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*534]
	mov r11, qword [rsp+8*533]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*534],r10
	mov qword [rsp+8*533],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*535]
	mov r11, qword [rsp+8*532]
	mov r10,r11
	mov r12, qword [rsp+8*534]
	add r10,r12
	mov qword [rsp+8*535],r10
	mov qword [rsp+8*532],r11
	mov qword [rsp+8*534],r12
	mov r10, qword [rsp+8*536]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*536],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*537]
	mov r11, qword [rsp+8*535]
	mov r10,r11
	mov r12, qword [rsp+8*536]
	sub r10,r12
	mov qword [rsp+8*537],r10
	mov qword [rsp+8*535],r11
	mov qword [rsp+8*536],r12
	mov r10, qword [rsp+8*538]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*538],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*539]
	mov r11, qword [rsp+8*538]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*539],r10
	mov qword [rsp+8*538],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*540]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*540],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*541]
	mov r11, qword [rsp+8*539]
	mov r10,r11
	mov r12, qword [rsp+8*540]
	sub r10,r12
	mov qword [rsp+8*541],r10
	mov qword [rsp+8*539],r11
	mov qword [rsp+8*540],r12
	mov r10, qword [rsp+8*542]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*542],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*543]
	mov r11, qword [rsp+8*542]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*543],r10
	mov qword [rsp+8*542],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*544]
	mov r11, qword [rsp+8*541]
	mov r10,r11
	mov r12, qword [rsp+8*543]
	add r10,r12
	mov qword [rsp+8*544],r10
	mov qword [rsp+8*541],r11
	mov qword [rsp+8*543],r12
	mov r10, qword [rsp+8*545]
	mov r11, qword [rsp+8*537]
	mov r10,r11
	mov r12, qword [rsp+8*544]
	add r10,r12
	mov qword [rsp+8*545],r10
	mov qword [rsp+8*537],r11
	mov qword [rsp+8*544],r12
	mov r10, qword [rsp+8*546]
	mov r11, qword [rsp+8*531]
	mov r10,r11
	mov r12, qword [rsp+8*545]
	sub r10,r12
	mov qword [rsp+8*546],r10
	mov qword [rsp+8*531],r11
	mov qword [rsp+8*545],r12
	mov r10, qword [rsp+8*547]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*547],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*548]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*548],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*549]
	mov r11, qword [rsp+8*548]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*549],r10
	mov qword [rsp+8*548],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*550]
	mov r11, qword [rsp+8*547]
	mov r10,r11
	mov r12, qword [rsp+8*549]
	add r10,r12
	mov qword [rsp+8*550],r10
	mov qword [rsp+8*547],r11
	mov qword [rsp+8*549],r12
	mov r10, qword [rsp+8*551]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*551],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*552]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*552],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*553]
	mov r11, qword [rsp+8*552]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*553],r10
	mov qword [rsp+8*552],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*554]
	mov r11, qword [rsp+8*551]
	mov r10,r11
	mov r12, qword [rsp+8*553]
	add r10,r12
	mov qword [rsp+8*554],r10
	mov qword [rsp+8*551],r11
	mov qword [rsp+8*553],r12
	mov r10, qword [rsp+8*555]
	mov r11, qword [rsp+8*550]
	mov r10,r11
	mov r12, qword [rsp+8*554]
	sub r10,r12
	mov qword [rsp+8*555],r10
	mov qword [rsp+8*550],r11
	mov qword [rsp+8*554],r12
	mov r10, qword [rsp+8*556]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*556],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*557]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*557],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*558]
	mov r11, qword [rsp+8*557]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*558],r10
	mov qword [rsp+8*557],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*559]
	mov r11, qword [rsp+8*556]
	mov r10,r11
	mov r12, qword [rsp+8*558]
	add r10,r12
	mov qword [rsp+8*559],r10
	mov qword [rsp+8*556],r11
	mov qword [rsp+8*558],r12
	mov r10, qword [rsp+8*560]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*560],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*561]
	mov r11, qword [rsp+8*559]
	mov r10,r11
	mov r12, qword [rsp+8*560]
	sub r10,r12
	mov qword [rsp+8*561],r10
	mov qword [rsp+8*559],r11
	mov qword [rsp+8*560],r12
	mov r10, qword [rsp+8*562]
	mov r11, qword [rsp+8*555]
	mov r10,r11
	mov r12, qword [rsp+8*561]
	sub r10,r12
	mov qword [rsp+8*562],r10
	mov qword [rsp+8*555],r11
	mov qword [rsp+8*561],r12
	mov r10, qword [rsp+8*563]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*563],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*564]
	mov r11, qword [rsp+8*563]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*564],r10
	mov qword [rsp+8*563],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*565]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*565],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*566]
	mov r11, qword [rsp+8*564]
	mov r10,r11
	mov r12, qword [rsp+8*565]
	sub r10,r12
	mov qword [rsp+8*566],r10
	mov qword [rsp+8*564],r11
	mov qword [rsp+8*565],r12
	mov r10, qword [rsp+8*567]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*567],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*568]
	mov r11, qword [rsp+8*567]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*568],r10
	mov qword [rsp+8*567],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*569]
	mov r11, qword [rsp+8*566]
	mov r10,r11
	mov r12, qword [rsp+8*568]
	add r10,r12
	mov qword [rsp+8*569],r10
	mov qword [rsp+8*566],r11
	mov qword [rsp+8*568],r12
	mov r10, qword [rsp+8*570]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*570],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*571]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*571],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*572]
	mov r11, qword [rsp+8*571]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*572],r10
	mov qword [rsp+8*571],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*573]
	mov r11, qword [rsp+8*570]
	mov r10,r11
	mov r12, qword [rsp+8*572]
	add r10,r12
	mov qword [rsp+8*573],r10
	mov qword [rsp+8*570],r11
	mov qword [rsp+8*572],r12
	mov r10, qword [rsp+8*574]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*574],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*575]
	mov r11, qword [rsp+8*573]
	mov r10,r11
	mov r12, qword [rsp+8*574]
	sub r10,r12
	mov qword [rsp+8*575],r10
	mov qword [rsp+8*573],r11
	mov qword [rsp+8*574],r12
	mov r10, qword [rsp+8*576]
	mov r11, qword [rsp+8*569]
	mov r10,r11
	mov r12, qword [rsp+8*575]
	sub r10,r12
	mov qword [rsp+8*576],r10
	mov qword [rsp+8*569],r11
	mov qword [rsp+8*575],r12
	mov r10, qword [rsp+8*577]
	mov r11, qword [rsp+8*562]
	mov r10,r11
	mov r12, qword [rsp+8*576]
	add r10,r12
	mov qword [rsp+8*577],r10
	mov qword [rsp+8*562],r11
	mov qword [rsp+8*576],r12
	mov r10, qword [rsp+8*578]
	mov r11, qword [rsp+8*546]
	mov r10,r11
	mov r12, qword [rsp+8*577]
	sub r10,r12
	mov qword [rsp+8*578],r10
	mov qword [rsp+8*546],r11
	mov qword [rsp+8*577],r12
	mov r10, qword [rsp+8*579]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*579],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*580]
	mov r11, qword [rsp+8*579]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*580],r10
	mov qword [rsp+8*579],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*581]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*581],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*582]
	mov r11, qword [rsp+8*580]
	mov r10,r11
	mov r12, qword [rsp+8*581]
	sub r10,r12
	mov qword [rsp+8*582],r10
	mov qword [rsp+8*580],r11
	mov qword [rsp+8*581],r12
	mov r10, qword [rsp+8*583]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*583],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*584]
	mov r11, qword [rsp+8*583]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*584],r10
	mov qword [rsp+8*583],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*585]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*585],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*586]
	mov r11, qword [rsp+8*584]
	mov r10,r11
	mov r12, qword [rsp+8*585]
	sub r10,r12
	mov qword [rsp+8*586],r10
	mov qword [rsp+8*584],r11
	mov qword [rsp+8*585],r12
	mov r10, qword [rsp+8*587]
	mov r11, qword [rsp+8*582]
	mov r10,r11
	mov r12, qword [rsp+8*586]
	add r10,r12
	mov qword [rsp+8*587],r10
	mov qword [rsp+8*582],r11
	mov qword [rsp+8*586],r12
	mov r10, qword [rsp+8*588]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*588],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*589]
	mov r11, qword [rsp+8*588]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*589],r10
	mov qword [rsp+8*588],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*590]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*590],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*591]
	mov r11, qword [rsp+8*589]
	mov r10,r11
	mov r12, qword [rsp+8*590]
	sub r10,r12
	mov qword [rsp+8*591],r10
	mov qword [rsp+8*589],r11
	mov qword [rsp+8*590],r12
	mov r10, qword [rsp+8*592]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*592],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*593]
	mov r11, qword [rsp+8*592]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*593],r10
	mov qword [rsp+8*592],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*594]
	mov r11, qword [rsp+8*591]
	mov r10,r11
	mov r12, qword [rsp+8*593]
	add r10,r12
	mov qword [rsp+8*594],r10
	mov qword [rsp+8*591],r11
	mov qword [rsp+8*593],r12
	mov r10, qword [rsp+8*595]
	mov r11, qword [rsp+8*587]
	mov r10,r11
	mov r12, qword [rsp+8*594]
	add r10,r12
	mov qword [rsp+8*595],r10
	mov qword [rsp+8*587],r11
	mov qword [rsp+8*594],r12
	mov r10, qword [rsp+8*596]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*596],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*597]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*597],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*598]
	mov r11, qword [rsp+8*597]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*598],r10
	mov qword [rsp+8*597],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*599]
	mov r11, qword [rsp+8*596]
	mov r10,r11
	mov r12, qword [rsp+8*598]
	add r10,r12
	mov qword [rsp+8*599],r10
	mov qword [rsp+8*596],r11
	mov qword [rsp+8*598],r12
	mov r10, qword [rsp+8*600]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*600],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*601]
	mov r11, qword [rsp+8*599]
	mov r10,r11
	mov r12, qword [rsp+8*600]
	sub r10,r12
	mov qword [rsp+8*601],r10
	mov qword [rsp+8*599],r11
	mov qword [rsp+8*600],r12
	mov r10, qword [rsp+8*602]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*602],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*603]
	mov r11, qword [rsp+8*602]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*603],r10
	mov qword [rsp+8*602],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*604]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*604],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*605]
	mov r11, qword [rsp+8*603]
	mov r10,r11
	mov r12, qword [rsp+8*604]
	sub r10,r12
	mov qword [rsp+8*605],r10
	mov qword [rsp+8*603],r11
	mov qword [rsp+8*604],r12
	mov r10, qword [rsp+8*606]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*606],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*607]
	mov r11, qword [rsp+8*606]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*607],r10
	mov qword [rsp+8*606],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*608]
	mov r11, qword [rsp+8*605]
	mov r10,r11
	mov r12, qword [rsp+8*607]
	add r10,r12
	mov qword [rsp+8*608],r10
	mov qword [rsp+8*605],r11
	mov qword [rsp+8*607],r12
	mov r10, qword [rsp+8*609]
	mov r11, qword [rsp+8*601]
	mov r10,r11
	mov r12, qword [rsp+8*608]
	add r10,r12
	mov qword [rsp+8*609],r10
	mov qword [rsp+8*601],r11
	mov qword [rsp+8*608],r12
	mov r10, qword [rsp+8*610]
	mov r11, qword [rsp+8*595]
	mov r10,r11
	mov r12, qword [rsp+8*609]
	sub r10,r12
	mov qword [rsp+8*610],r10
	mov qword [rsp+8*595],r11
	mov qword [rsp+8*609],r12
	mov r10, qword [rsp+8*611]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*611],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*612]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*612],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*613]
	mov r11, qword [rsp+8*612]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*613],r10
	mov qword [rsp+8*612],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*614]
	mov r11, qword [rsp+8*611]
	mov r10,r11
	mov r12, qword [rsp+8*613]
	add r10,r12
	mov qword [rsp+8*614],r10
	mov qword [rsp+8*611],r11
	mov qword [rsp+8*613],r12
	mov r10, qword [rsp+8*615]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*615],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*616]
	mov r11, qword [rsp+8*614]
	mov r10,r11
	mov r12, qword [rsp+8*615]
	sub r10,r12
	mov qword [rsp+8*616],r10
	mov qword [rsp+8*614],r11
	mov qword [rsp+8*615],r12
	mov r10, qword [rsp+8*617]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*617],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*618]
	mov r11, qword [rsp+8*617]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*618],r10
	mov qword [rsp+8*617],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*619]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*619],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*620]
	mov r11, qword [rsp+8*618]
	mov r10,r11
	mov r12, qword [rsp+8*619]
	sub r10,r12
	mov qword [rsp+8*620],r10
	mov qword [rsp+8*618],r11
	mov qword [rsp+8*619],r12
	mov r10, qword [rsp+8*621]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*621],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*622]
	mov r11, qword [rsp+8*621]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*622],r10
	mov qword [rsp+8*621],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*623]
	mov r11, qword [rsp+8*620]
	mov r10,r11
	mov r12, qword [rsp+8*622]
	add r10,r12
	mov qword [rsp+8*623],r10
	mov qword [rsp+8*620],r11
	mov qword [rsp+8*622],r12
	mov r10, qword [rsp+8*624]
	mov r11, qword [rsp+8*616]
	mov r10,r11
	mov r12, qword [rsp+8*623]
	add r10,r12
	mov qword [rsp+8*624],r10
	mov qword [rsp+8*616],r11
	mov qword [rsp+8*623],r12
	mov r10, qword [rsp+8*625]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*625],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*626]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*626],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*627]
	mov r11, qword [rsp+8*626]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*627],r10
	mov qword [rsp+8*626],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*628]
	mov r11, qword [rsp+8*625]
	mov r10,r11
	mov r12, qword [rsp+8*627]
	add r10,r12
	mov qword [rsp+8*628],r10
	mov qword [rsp+8*625],r11
	mov qword [rsp+8*627],r12
	mov r10, qword [rsp+8*629]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*629],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*630]
	mov r11, qword [rsp+8*628]
	mov r10,r11
	mov r12, qword [rsp+8*629]
	sub r10,r12
	mov qword [rsp+8*630],r10
	mov qword [rsp+8*628],r11
	mov qword [rsp+8*629],r12
	mov r10, qword [rsp+8*631]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*631],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*632]
	mov r11, qword [rsp+8*631]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*632],r10
	mov qword [rsp+8*631],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*633]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*633],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*634]
	mov r11, qword [rsp+8*632]
	mov r10,r11
	mov r12, qword [rsp+8*633]
	sub r10,r12
	mov qword [rsp+8*634],r10
	mov qword [rsp+8*632],r11
	mov qword [rsp+8*633],r12
	mov r10, qword [rsp+8*635]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*635],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*636]
	mov r11, qword [rsp+8*635]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*636],r10
	mov qword [rsp+8*635],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*637]
	mov r11, qword [rsp+8*634]
	mov r10,r11
	mov r12, qword [rsp+8*636]
	add r10,r12
	mov qword [rsp+8*637],r10
	mov qword [rsp+8*634],r11
	mov qword [rsp+8*636],r12
	mov r10, qword [rsp+8*638]
	mov r11, qword [rsp+8*630]
	mov r10,r11
	mov r12, qword [rsp+8*637]
	add r10,r12
	mov qword [rsp+8*638],r10
	mov qword [rsp+8*630],r11
	mov qword [rsp+8*637],r12
	mov r10, qword [rsp+8*639]
	mov r11, qword [rsp+8*624]
	mov r10,r11
	mov r12, qword [rsp+8*638]
	sub r10,r12
	mov qword [rsp+8*639],r10
	mov qword [rsp+8*624],r11
	mov qword [rsp+8*638],r12
	mov r10, qword [rsp+8*640]
	mov r11, qword [rsp+8*610]
	mov r10,r11
	mov r12, qword [rsp+8*639]
	sub r10,r12
	mov qword [rsp+8*640],r10
	mov qword [rsp+8*610],r11
	mov qword [rsp+8*639],r12
	mov r10, qword [rsp+8*641]
	mov r11, qword [rsp+8*578]
	mov r10,r11
	mov r12, qword [rsp+8*640]
	add r10,r12
	mov qword [rsp+8*641],r10
	mov qword [rsp+8*578],r11
	mov qword [rsp+8*640],r12
	mov r10, qword [rsp+8*642]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*642],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*643]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*643],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*644]
	mov r11, qword [rsp+8*643]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*644],r10
	mov qword [rsp+8*643],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*645]
	mov r11, qword [rsp+8*642]
	mov r10,r11
	mov r12, qword [rsp+8*644]
	add r10,r12
	mov qword [rsp+8*645],r10
	mov qword [rsp+8*642],r11
	mov qword [rsp+8*644],r12
	mov r10, qword [rsp+8*646]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*646],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*647]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*647],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*648]
	mov r11, qword [rsp+8*647]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*648],r10
	mov qword [rsp+8*647],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*649]
	mov r11, qword [rsp+8*646]
	mov r10,r11
	mov r12, qword [rsp+8*648]
	add r10,r12
	mov qword [rsp+8*649],r10
	mov qword [rsp+8*646],r11
	mov qword [rsp+8*648],r12
	mov r10, qword [rsp+8*650]
	mov r11, qword [rsp+8*645]
	mov r10,r11
	mov r12, qword [rsp+8*649]
	sub r10,r12
	mov qword [rsp+8*650],r10
	mov qword [rsp+8*645],r11
	mov qword [rsp+8*649],r12
	mov r10, qword [rsp+8*651]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*651],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*652]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*652],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*653]
	mov r11, qword [rsp+8*652]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*653],r10
	mov qword [rsp+8*652],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*654]
	mov r11, qword [rsp+8*651]
	mov r10,r11
	mov r12, qword [rsp+8*653]
	add r10,r12
	mov qword [rsp+8*654],r10
	mov qword [rsp+8*651],r11
	mov qword [rsp+8*653],r12
	mov r10, qword [rsp+8*655]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*655],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*656]
	mov r11, qword [rsp+8*654]
	mov r10,r11
	mov r12, qword [rsp+8*655]
	sub r10,r12
	mov qword [rsp+8*656],r10
	mov qword [rsp+8*654],r11
	mov qword [rsp+8*655],r12
	mov r10, qword [rsp+8*657]
	mov r11, qword [rsp+8*650]
	mov r10,r11
	mov r12, qword [rsp+8*656]
	sub r10,r12
	mov qword [rsp+8*657],r10
	mov qword [rsp+8*650],r11
	mov qword [rsp+8*656],r12
	mov r10, qword [rsp+8*658]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*658],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*659]
	mov r11, qword [rsp+8*658]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*659],r10
	mov qword [rsp+8*658],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*660]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*660],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*661]
	mov r11, qword [rsp+8*659]
	mov r10,r11
	mov r12, qword [rsp+8*660]
	sub r10,r12
	mov qword [rsp+8*661],r10
	mov qword [rsp+8*659],r11
	mov qword [rsp+8*660],r12
	mov r10, qword [rsp+8*662]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*662],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*663]
	mov r11, qword [rsp+8*662]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*663],r10
	mov qword [rsp+8*662],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*664]
	mov r11, qword [rsp+8*661]
	mov r10,r11
	mov r12, qword [rsp+8*663]
	add r10,r12
	mov qword [rsp+8*664],r10
	mov qword [rsp+8*661],r11
	mov qword [rsp+8*663],r12
	mov r10, qword [rsp+8*665]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*665],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*666]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*666],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*667]
	mov r11, qword [rsp+8*666]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*667],r10
	mov qword [rsp+8*666],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*668]
	mov r11, qword [rsp+8*665]
	mov r10,r11
	mov r12, qword [rsp+8*667]
	add r10,r12
	mov qword [rsp+8*668],r10
	mov qword [rsp+8*665],r11
	mov qword [rsp+8*667],r12
	mov r10, qword [rsp+8*669]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*669],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*670]
	mov r11, qword [rsp+8*668]
	mov r10,r11
	mov r12, qword [rsp+8*669]
	sub r10,r12
	mov qword [rsp+8*670],r10
	mov qword [rsp+8*668],r11
	mov qword [rsp+8*669],r12
	mov r10, qword [rsp+8*671]
	mov r11, qword [rsp+8*664]
	mov r10,r11
	mov r12, qword [rsp+8*670]
	sub r10,r12
	mov qword [rsp+8*671],r10
	mov qword [rsp+8*664],r11
	mov qword [rsp+8*670],r12
	mov r10, qword [rsp+8*672]
	mov r11, qword [rsp+8*657]
	mov r10,r11
	mov r12, qword [rsp+8*671]
	add r10,r12
	mov qword [rsp+8*672],r10
	mov qword [rsp+8*657],r11
	mov qword [rsp+8*671],r12
	mov r10, qword [rsp+8*673]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*673],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*674]
	mov r11, qword [rsp+8*673]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*674],r10
	mov qword [rsp+8*673],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*675]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*675],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*676]
	mov r11, qword [rsp+8*674]
	mov r10,r11
	mov r12, qword [rsp+8*675]
	sub r10,r12
	mov qword [rsp+8*676],r10
	mov qword [rsp+8*674],r11
	mov qword [rsp+8*675],r12
	mov r10, qword [rsp+8*677]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*677],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*678]
	mov r11, qword [rsp+8*677]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*678],r10
	mov qword [rsp+8*677],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*679]
	mov r11, qword [rsp+8*676]
	mov r10,r11
	mov r12, qword [rsp+8*678]
	add r10,r12
	mov qword [rsp+8*679],r10
	mov qword [rsp+8*676],r11
	mov qword [rsp+8*678],r12
	mov r10, qword [rsp+8*680]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*680],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*681]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*681],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*682]
	mov r11, qword [rsp+8*681]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*682],r10
	mov qword [rsp+8*681],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*683]
	mov r11, qword [rsp+8*680]
	mov r10,r11
	mov r12, qword [rsp+8*682]
	add r10,r12
	mov qword [rsp+8*683],r10
	mov qword [rsp+8*680],r11
	mov qword [rsp+8*682],r12
	mov r10, qword [rsp+8*684]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*684],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*685]
	mov r11, qword [rsp+8*683]
	mov r10,r11
	mov r12, qword [rsp+8*684]
	sub r10,r12
	mov qword [rsp+8*685],r10
	mov qword [rsp+8*683],r11
	mov qword [rsp+8*684],r12
	mov r10, qword [rsp+8*686]
	mov r11, qword [rsp+8*679]
	mov r10,r11
	mov r12, qword [rsp+8*685]
	sub r10,r12
	mov qword [rsp+8*686],r10
	mov qword [rsp+8*679],r11
	mov qword [rsp+8*685],r12
	mov r10, qword [rsp+8*687]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*687],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*688]
	mov r11, qword [rsp+8*687]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*688],r10
	mov qword [rsp+8*687],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*689]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*689],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*690]
	mov r11, qword [rsp+8*688]
	mov r10,r11
	mov r12, qword [rsp+8*689]
	sub r10,r12
	mov qword [rsp+8*690],r10
	mov qword [rsp+8*688],r11
	mov qword [rsp+8*689],r12
	mov r10, qword [rsp+8*691]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*691],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*692]
	mov r11, qword [rsp+8*691]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*692],r10
	mov qword [rsp+8*691],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*693]
	mov r11, qword [rsp+8*690]
	mov r10,r11
	mov r12, qword [rsp+8*692]
	add r10,r12
	mov qword [rsp+8*693],r10
	mov qword [rsp+8*690],r11
	mov qword [rsp+8*692],r12
	mov r10, qword [rsp+8*694]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*694],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*695]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*695],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*696]
	mov r11, qword [rsp+8*695]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*696],r10
	mov qword [rsp+8*695],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*697]
	mov r11, qword [rsp+8*694]
	mov r10,r11
	mov r12, qword [rsp+8*696]
	add r10,r12
	mov qword [rsp+8*697],r10
	mov qword [rsp+8*694],r11
	mov qword [rsp+8*696],r12
	mov r10, qword [rsp+8*698]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*698],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*699]
	mov r11, qword [rsp+8*697]
	mov r10,r11
	mov r12, qword [rsp+8*698]
	sub r10,r12
	mov qword [rsp+8*699],r10
	mov qword [rsp+8*697],r11
	mov qword [rsp+8*698],r12
	mov r10, qword [rsp+8*700]
	mov r11, qword [rsp+8*693]
	mov r10,r11
	mov r12, qword [rsp+8*699]
	sub r10,r12
	mov qword [rsp+8*700],r10
	mov qword [rsp+8*693],r11
	mov qword [rsp+8*699],r12
	mov r10, qword [rsp+8*701]
	mov r11, qword [rsp+8*686]
	mov r10,r11
	mov r12, qword [rsp+8*700]
	add r10,r12
	mov qword [rsp+8*701],r10
	mov qword [rsp+8*686],r11
	mov qword [rsp+8*700],r12
	mov r10, qword [rsp+8*702]
	mov r11, qword [rsp+8*672]
	mov r10,r11
	mov r12, qword [rsp+8*701]
	add r10,r12
	mov qword [rsp+8*702],r10
	mov qword [rsp+8*672],r11
	mov qword [rsp+8*701],r12
	mov r10, qword [rsp+8*703]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*703],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*704]
	mov r11, qword [rsp+8*703]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*704],r10
	mov qword [rsp+8*703],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*705]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*705],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*706]
	mov r11, qword [rsp+8*704]
	mov r10,r11
	mov r12, qword [rsp+8*705]
	sub r10,r12
	mov qword [rsp+8*706],r10
	mov qword [rsp+8*704],r11
	mov qword [rsp+8*705],r12
	mov r10, qword [rsp+8*707]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*707],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*708]
	mov r11, qword [rsp+8*707]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*708],r10
	mov qword [rsp+8*707],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*709]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*709],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*710]
	mov r11, qword [rsp+8*708]
	mov r10,r11
	mov r12, qword [rsp+8*709]
	sub r10,r12
	mov qword [rsp+8*710],r10
	mov qword [rsp+8*708],r11
	mov qword [rsp+8*709],r12
	mov r10, qword [rsp+8*711]
	mov r11, qword [rsp+8*706]
	mov r10,r11
	mov r12, qword [rsp+8*710]
	add r10,r12
	mov qword [rsp+8*711],r10
	mov qword [rsp+8*706],r11
	mov qword [rsp+8*710],r12
	mov r10, qword [rsp+8*712]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*712],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*713]
	mov r11, qword [rsp+8*712]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*713],r10
	mov qword [rsp+8*712],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*714]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*714],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*715]
	mov r11, qword [rsp+8*713]
	mov r10,r11
	mov r12, qword [rsp+8*714]
	sub r10,r12
	mov qword [rsp+8*715],r10
	mov qword [rsp+8*713],r11
	mov qword [rsp+8*714],r12
	mov r10, qword [rsp+8*716]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*716],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*717]
	mov r11, qword [rsp+8*716]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*717],r10
	mov qword [rsp+8*716],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*718]
	mov r11, qword [rsp+8*715]
	mov r10,r11
	mov r12, qword [rsp+8*717]
	add r10,r12
	mov qword [rsp+8*718],r10
	mov qword [rsp+8*715],r11
	mov qword [rsp+8*717],r12
	mov r10, qword [rsp+8*719]
	mov r11, qword [rsp+8*711]
	mov r10,r11
	mov r12, qword [rsp+8*718]
	add r10,r12
	mov qword [rsp+8*719],r10
	mov qword [rsp+8*711],r11
	mov qword [rsp+8*718],r12
	mov r10, qword [rsp+8*720]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*720],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*721]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*721],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*722]
	mov r11, qword [rsp+8*721]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*722],r10
	mov qword [rsp+8*721],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*723]
	mov r11, qword [rsp+8*720]
	mov r10,r11
	mov r12, qword [rsp+8*722]
	add r10,r12
	mov qword [rsp+8*723],r10
	mov qword [rsp+8*720],r11
	mov qword [rsp+8*722],r12
	mov r10, qword [rsp+8*724]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*724],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*725]
	mov r11, qword [rsp+8*723]
	mov r10,r11
	mov r12, qword [rsp+8*724]
	sub r10,r12
	mov qword [rsp+8*725],r10
	mov qword [rsp+8*723],r11
	mov qword [rsp+8*724],r12
	mov r10, qword [rsp+8*726]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*726],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*727]
	mov r11, qword [rsp+8*726]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*727],r10
	mov qword [rsp+8*726],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*728]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*728],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*729]
	mov r11, qword [rsp+8*727]
	mov r10,r11
	mov r12, qword [rsp+8*728]
	sub r10,r12
	mov qword [rsp+8*729],r10
	mov qword [rsp+8*727],r11
	mov qword [rsp+8*728],r12
	mov r10, qword [rsp+8*730]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*730],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*731]
	mov r11, qword [rsp+8*730]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*731],r10
	mov qword [rsp+8*730],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*732]
	mov r11, qword [rsp+8*729]
	mov r10,r11
	mov r12, qword [rsp+8*731]
	add r10,r12
	mov qword [rsp+8*732],r10
	mov qword [rsp+8*729],r11
	mov qword [rsp+8*731],r12
	mov r10, qword [rsp+8*733]
	mov r11, qword [rsp+8*725]
	mov r10,r11
	mov r12, qword [rsp+8*732]
	add r10,r12
	mov qword [rsp+8*733],r10
	mov qword [rsp+8*725],r11
	mov qword [rsp+8*732],r12
	mov r10, qword [rsp+8*734]
	mov r11, qword [rsp+8*719]
	mov r10,r11
	mov r12, qword [rsp+8*733]
	sub r10,r12
	mov qword [rsp+8*734],r10
	mov qword [rsp+8*719],r11
	mov qword [rsp+8*733],r12
	mov r10, qword [rsp+8*735]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*735],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*736]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*736],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*737]
	mov r11, qword [rsp+8*736]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*737],r10
	mov qword [rsp+8*736],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*738]
	mov r11, qword [rsp+8*735]
	mov r10,r11
	mov r12, qword [rsp+8*737]
	add r10,r12
	mov qword [rsp+8*738],r10
	mov qword [rsp+8*735],r11
	mov qword [rsp+8*737],r12
	mov r10, qword [rsp+8*739]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*739],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*740]
	mov r11, qword [rsp+8*738]
	mov r10,r11
	mov r12, qword [rsp+8*739]
	sub r10,r12
	mov qword [rsp+8*740],r10
	mov qword [rsp+8*738],r11
	mov qword [rsp+8*739],r12
	mov r10, qword [rsp+8*741]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*741],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*742]
	mov r11, qword [rsp+8*741]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*742],r10
	mov qword [rsp+8*741],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*743]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*743],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*744]
	mov r11, qword [rsp+8*742]
	mov r10,r11
	mov r12, qword [rsp+8*743]
	sub r10,r12
	mov qword [rsp+8*744],r10
	mov qword [rsp+8*742],r11
	mov qword [rsp+8*743],r12
	mov r10, qword [rsp+8*745]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*745],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*746]
	mov r11, qword [rsp+8*745]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*746],r10
	mov qword [rsp+8*745],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*747]
	mov r11, qword [rsp+8*744]
	mov r10,r11
	mov r12, qword [rsp+8*746]
	add r10,r12
	mov qword [rsp+8*747],r10
	mov qword [rsp+8*744],r11
	mov qword [rsp+8*746],r12
	mov r10, qword [rsp+8*748]
	mov r11, qword [rsp+8*740]
	mov r10,r11
	mov r12, qword [rsp+8*747]
	add r10,r12
	mov qword [rsp+8*748],r10
	mov qword [rsp+8*740],r11
	mov qword [rsp+8*747],r12
	mov r10, qword [rsp+8*749]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*749],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*750]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*750],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*751]
	mov r11, qword [rsp+8*750]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*751],r10
	mov qword [rsp+8*750],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*752]
	mov r11, qword [rsp+8*749]
	mov r10,r11
	mov r12, qword [rsp+8*751]
	add r10,r12
	mov qword [rsp+8*752],r10
	mov qword [rsp+8*749],r11
	mov qword [rsp+8*751],r12
	mov r10, qword [rsp+8*753]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*753],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*754]
	mov r11, qword [rsp+8*752]
	mov r10,r11
	mov r12, qword [rsp+8*753]
	sub r10,r12
	mov qword [rsp+8*754],r10
	mov qword [rsp+8*752],r11
	mov qword [rsp+8*753],r12
	mov r10, qword [rsp+8*755]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*755],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*756]
	mov r11, qword [rsp+8*755]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*756],r10
	mov qword [rsp+8*755],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*757]
	mov r11, qword [gbl+8*9]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*757],r10
	mov qword [gbl+8*9],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*758]
	mov r11, qword [rsp+8*756]
	mov r10,r11
	mov r12, qword [rsp+8*757]
	sub r10,r12
	mov qword [rsp+8*758],r10
	mov qword [rsp+8*756],r11
	mov qword [rsp+8*757],r12
	mov r10, qword [rsp+8*759]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12, qword [gbl+8*9]
	sub r10,r12
	mov qword [rsp+8*759],r10
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*9],r12
	mov r10, qword [rsp+8*760]
	mov r11, qword [rsp+8*759]
	mov r10,r11
	mov r12, qword [gbl+8*11]
	add r10,r12
	mov qword [rsp+8*760],r10
	mov qword [rsp+8*759],r11
	mov qword [gbl+8*11],r12
	mov r10, qword [rsp+8*761]
	mov r11, qword [rsp+8*758]
	mov r10,r11
	mov r12, qword [rsp+8*760]
	add r10,r12
	mov qword [rsp+8*761],r10
	mov qword [rsp+8*758],r11
	mov qword [rsp+8*760],r12
	mov r10, qword [rsp+8*762]
	mov r11, qword [rsp+8*754]
	mov r10,r11
	mov r12, qword [rsp+8*761]
	add r10,r12
	mov qword [rsp+8*762],r10
	mov qword [rsp+8*754],r11
	mov qword [rsp+8*761],r12
	mov r10, qword [rsp+8*763]
	mov r11, qword [rsp+8*748]
	mov r10,r11
	mov r12, qword [rsp+8*762]
	sub r10,r12
	mov qword [rsp+8*763],r10
	mov qword [rsp+8*748],r11
	mov qword [rsp+8*762],r12
	mov r10, qword [rsp+8*764]
	mov r11, qword [rsp+8*734]
	mov r10,r11
	mov r12, qword [rsp+8*763]
	sub r10,r12
	mov qword [rsp+8*764],r10
	mov qword [rsp+8*734],r11
	mov qword [rsp+8*763],r12
	mov r10, qword [rsp+8*765]
	mov r11, qword [rsp+8*702]
	mov r10,r11
	mov r12, qword [rsp+8*764]
	add r10,r12
	mov qword [rsp+8*765],r10
	mov qword [rsp+8*702],r11
	mov qword [rsp+8*764],r12
	mov r10, qword [rsp+8*766]
	mov r11, qword [rsp+8*641]
	mov r10,r11
	mov r12, qword [rsp+8*765]
	sub r10,r12
	mov qword [rsp+8*766],r10
	mov qword [rsp+8*641],r11
	mov qword [rsp+8*765],r12
	mov r10, qword [gbl+8*3]
	mov r11, qword [rsp+8*766]
	mov r10,r11
	mov qword [gbl+8*3],r10
	mov qword [rsp+8*766],r11
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


