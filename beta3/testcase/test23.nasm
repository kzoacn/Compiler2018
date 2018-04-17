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
	sub    rsp, 560
	call global_init
	mov r10, qword [rsp+8*1]
	mov r10 , rax
	mov r11, qword [rsp+8*2]
	mov r12,1
	mov r11,r12
	mov qword [rsp+8*1],r10
	mov qword [rsp+8*2],r11
	
L_184:
	mov r10, qword [rsp+8*2]
	mov r11, qword [gbl+8*3]
	cmp r10,r11
	mov r12, qword [rsp+8*4]
	mov r12, 0
	setle r12B
	mov qword [rsp+8*2],r10
	mov qword [gbl+8*3],r11
	mov qword [rsp+8*4],r12
	mov r10, qword [rsp+8*4]
	cmp r10, 0
	mov qword [rsp+8*4],r10
	je L_185
	mov r10, qword [rsp+8*5]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov r12,1
	add r10,r12
	mov r13, qword [rsp+8*6]
	mov r13,r10
	mov r14, qword [rsp+8*2]
	sub r13,r14
	mov r15, qword [rsp+8*8]
	mov qword [gbl+8*3],r11
	mov r11, qword [gbl+8*7]
	mov r15,r11
	mov qword [rsp+8*5],r10
	mov qword [gbl+8*7],r11
	mov qword [rsp+8*6],r13
	mov qword [rsp+8*2],r14
	mov qword [rsp+8*8],r15
	mov     rsi, [rsp+8*2]
	mov     rdi, [rsp+8*8]
	call    address
	mov [rsp+8*9], rax
	mov r10, qword [rsp+8*9]
	mov r11, qword [rsp+8*6]
	mov [r10],r11
	mov qword [rsp+8*9],r10
	mov qword [rsp+8*6],r11
	
L_186:
	mov r10, qword [rsp+8*10]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [rsp+8*10],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [rsp+8*2]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*2],r10
	jmp L_184
	
L_185:
	mov r10, qword [arg+8*1]
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [gbl+8*3],r11
	mov r10, qword [arg+8*0]
	mov r11,1
	mov r10,r11
	mov qword [arg+8*0],r10
	call qsrt
	mov r10, qword [rsp+8*13]
	mov r10 , rax
	mov r11, qword [rsp+8*2]
	mov r12,1
	mov r11,r12
	mov qword [rsp+8*13],r10
	mov qword [rsp+8*2],r11
	
L_187:
	mov r10, qword [rsp+8*2]
	mov r11, qword [gbl+8*3]
	cmp r10,r11
	mov r12, qword [rsp+8*14]
	mov r12, 0
	setle r12B
	mov qword [rsp+8*2],r10
	mov qword [gbl+8*3],r11
	mov qword [rsp+8*14],r12
	mov r10, qword [rsp+8*14]
	cmp r10, 0
	mov qword [rsp+8*14],r10
	je L_188
	mov r10, qword [rsp+8*15]
	mov r11, qword [gbl+8*7]
	mov r10,r11
	mov qword [rsp+8*15],r10
	mov qword [gbl+8*7],r11
	mov     rsi, [rsp+8*2]
	mov     rdi, [rsp+8*15]
	call    address
	mov [rsp+8*16], rax
	mov r10, qword [rsp+8*17]
	mov r11, qword [rsp+8*16]
	mov r10, [r11]
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*16],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*17]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*17],r11
	mov r10, qword [rsp+8*18]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*18],r10
	mov qword [arg+8*0],r11
	mov     rdi, [rsp+8*18]
	call    toString
	mov     qword[rsp+8*19], rax
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*19]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*19],r11
	mov r10, qword [rsp+8*20]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*20],r10
	mov qword [arg+8*0],r11
	mov rdi, formatln
	mov rsi,[rsp+8*20] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_189:
	mov r10, qword [rsp+8*21]
	mov r11, qword [rsp+8*2]
	mov r10,r11
	mov qword [rsp+8*21],r10
	mov qword [rsp+8*2],r11
	mov r10, qword [rsp+8*2]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*2],r10
	jmp L_187
	
L_188:
	mov r10,0
	mov rax,r10
	leave
	ret
	mov r10,0
	mov rax,r10
	leave
	ret
	jmp QED
	
qsrt:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 560
	mov r10, qword [rsp+8*22]
	mov r11, qword [arg+8*0]
	mov r10,r11
	mov qword [rsp+8*22],r10
	mov qword [arg+8*0],r11
	mov r10, qword [rsp+8*23]
	mov r11, qword [arg+8*1]
	mov r10,r11
	mov qword [rsp+8*23],r10
	mov qword [arg+8*1],r11
	mov r10, qword [rsp+8*24]
	mov r11, qword [rsp+8*22]
	mov r10,r11
	mov qword [rsp+8*24],r10
	mov qword [rsp+8*22],r11
	mov r10, qword [rsp+8*25]
	mov r11, qword [rsp+8*23]
	mov r10,r11
	mov qword [rsp+8*25],r10
	mov qword [rsp+8*23],r11
	mov r10, qword [rsp+8*26]
	mov r11, qword [rsp+8*22]
	mov r10,r11
	mov r12, qword [rsp+8*23]
	add r10,r12
	xor rdx, rdx
	mov rax, r10
	mov r13,2
	mov rbx, r13
	cdq
	idiv rbx
	mov r14, qword [rsp+8*27]
	mov r14, rax
	mov qword [rsp+8*26],r10
	mov qword [rsp+8*22],r11
	mov qword [rsp+8*23],r12
	mov qword [rsp+8*27],r14
	mov r10, qword [rsp+8*28]
	mov r11, qword [gbl+8*7]
	mov r10,r11
	mov qword [rsp+8*28],r10
	mov qword [gbl+8*7],r11
	mov     rsi, [rsp+8*27]
	mov     rdi, [rsp+8*28]
	call    address
	mov [rsp+8*29], rax
	mov r10, qword [rsp+8*30]
	mov r11, qword [rsp+8*29]
	mov r10, [r11]
	mov qword [rsp+8*30],r10
	mov qword [rsp+8*29],r11
	mov r10, qword [rsp+8*31]
	mov r11, qword [rsp+8*30]
	mov r10,r11
	mov qword [rsp+8*31],r10
	mov qword [rsp+8*30],r11
	
L_172:
	mov r10, qword [rsp+8*24]
	mov r11, qword [rsp+8*25]
	cmp r10,r11
	mov r12, qword [rsp+8*32]
	mov r12, 0
	setle r12B
	mov qword [rsp+8*24],r10
	mov qword [rsp+8*25],r11
	mov qword [rsp+8*32],r12
	mov r10, qword [rsp+8*32]
	cmp r10, 0
	mov qword [rsp+8*32],r10
	je L_173
	
L_174:
	mov r10, qword [rsp+8*33]
	mov r11, qword [gbl+8*7]
	mov r10,r11
	mov qword [rsp+8*33],r10
	mov qword [gbl+8*7],r11
	mov     rsi, [rsp+8*24]
	mov     rdi, [rsp+8*33]
	call    address
	mov [rsp+8*34], rax
	mov r10, qword [rsp+8*35]
	mov r11, qword [rsp+8*34]
	mov r10, [r11]
	mov qword [rsp+8*35],r10
	mov qword [rsp+8*34],r11
	mov r10, qword [rsp+8*35]
	mov r11, qword [rsp+8*31]
	cmp r10,r11
	mov r12, qword [rsp+8*36]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*35],r10
	mov qword [rsp+8*31],r11
	mov qword [rsp+8*36],r12
	mov r10, qword [rsp+8*36]
	cmp r10, 0
	mov qword [rsp+8*36],r10
	je L_175
	mov r10, qword [rsp+8*37]
	mov r11, qword [rsp+8*24]
	mov r10,r11
	mov qword [rsp+8*37],r10
	mov qword [rsp+8*24],r11
	mov r10, qword [rsp+8*24]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov qword [rsp+8*24],r10
	jmp L_174
	
L_175:
	
L_176:
	mov r10, qword [rsp+8*38]
	mov r11, qword [gbl+8*7]
	mov r10,r11
	mov qword [rsp+8*38],r10
	mov qword [gbl+8*7],r11
	mov     rsi, [rsp+8*25]
	mov     rdi, [rsp+8*38]
	call    address
	mov [rsp+8*39], rax
	mov r10, qword [rsp+8*40]
	mov r11, qword [rsp+8*39]
	mov r10, [r11]
	mov qword [rsp+8*40],r10
	mov qword [rsp+8*39],r11
	mov r10, qword [rsp+8*40]
	mov r11, qword [rsp+8*31]
	cmp r10,r11
	mov r12, qword [rsp+8*41]
	mov r12, 0
	setg r12B
	mov qword [rsp+8*40],r10
	mov qword [rsp+8*31],r11
	mov qword [rsp+8*41],r12
	mov r10, qword [rsp+8*41]
	cmp r10, 0
	mov qword [rsp+8*41],r10
	je L_177
	mov r10, qword [rsp+8*42]
	mov r11, qword [rsp+8*25]
	mov r10,r11
	mov qword [rsp+8*42],r10
	mov qword [rsp+8*25],r11
	mov r10, qword [rsp+8*25]
	mov r10,r10
	mov r11,1
	sub r10,r11
	mov qword [rsp+8*25],r10
	jmp L_176
	
L_177:
	mov r10, qword [rsp+8*24]
	mov r11, qword [rsp+8*25]
	cmp r10,r11
	mov r12, qword [rsp+8*43]
	mov r12, 0
	setle r12B
	mov qword [rsp+8*24],r10
	mov qword [rsp+8*25],r11
	mov qword [rsp+8*43],r12
	mov r10, qword [rsp+8*43]
	cmp r10, 0
	mov qword [rsp+8*43],r10
	je L_179
	mov r10, qword [rsp+8*44]
	mov r11, qword [gbl+8*7]
	mov r10,r11
	mov qword [rsp+8*44],r10
	mov qword [gbl+8*7],r11
	mov     rsi, [rsp+8*24]
	mov     rdi, [rsp+8*44]
	call    address
	mov [rsp+8*45], rax
	mov r10, qword [rsp+8*46]
	mov r11, qword [rsp+8*45]
	mov r10, [r11]
	mov qword [rsp+8*46],r10
	mov qword [rsp+8*45],r11
	mov r10, qword [rsp+8*47]
	mov r11, qword [rsp+8*46]
	mov r10,r11
	mov qword [rsp+8*47],r10
	mov qword [rsp+8*46],r11
	mov r10, qword [rsp+8*48]
	mov r11, qword [gbl+8*7]
	mov r10,r11
	mov qword [rsp+8*48],r10
	mov qword [gbl+8*7],r11
	mov     rsi, [rsp+8*25]
	mov     rdi, [rsp+8*48]
	call    address
	mov [rsp+8*49], rax
	mov r10, qword [rsp+8*50]
	mov r11, qword [rsp+8*49]
	mov r10, [r11]
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*49],r11
	mov r10, qword [rsp+8*51]
	mov r11, qword [gbl+8*7]
	mov r10,r11
	mov qword [rsp+8*51],r10
	mov qword [gbl+8*7],r11
	mov     rsi, [rsp+8*24]
	mov     rdi, [rsp+8*51]
	call    address
	mov [rsp+8*52], rax
	mov r10, qword [rsp+8*52]
	mov r11, qword [rsp+8*50]
	mov [r10],r11
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*50],r11
	mov r10, qword [rsp+8*53]
	mov r11, qword [gbl+8*7]
	mov r10,r11
	mov qword [rsp+8*53],r10
	mov qword [gbl+8*7],r11
	mov     rsi, [rsp+8*25]
	mov     rdi, [rsp+8*53]
	call    address
	mov [rsp+8*54], rax
	mov r10, qword [rsp+8*54]
	mov r11, qword [rsp+8*47]
	mov [r10],r11
	mov qword [rsp+8*54],r10
	mov qword [rsp+8*47],r11
	mov r10, qword [rsp+8*55]
	mov r11, qword [rsp+8*24]
	mov r10,r11
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*24],r11
	mov r10, qword [rsp+8*24]
	mov r10,r10
	mov r11,1
	add r10,r11
	mov r12, qword [rsp+8*56]
	mov r13, qword [rsp+8*25]
	mov r12,r13
	mov qword [rsp+8*24],r10
	mov qword [rsp+8*56],r12
	mov qword [rsp+8*25],r13
	mov r10, qword [rsp+8*25]
	mov r10,r10
	mov r11,1
	sub r10,r11
	mov qword [rsp+8*25],r10
	
L_179:
	jmp L_172
	
L_173:
	mov r10, qword [rsp+8*22]
	mov r11, qword [rsp+8*25]
	cmp r10,r11
	mov r12, qword [rsp+8*57]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*22],r10
	mov qword [rsp+8*25],r11
	mov qword [rsp+8*57],r12
	mov r10, qword [rsp+8*57]
	cmp r10, 0
	mov qword [rsp+8*57],r10
	je L_181
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*25]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*25],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*22]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*22],r11
	call qsrt
	mov r10, qword [rsp+8*58]
	mov r10 , rax
	mov qword [rsp+8*58],r10
	
L_181:
	mov r10, qword [rsp+8*24]
	mov r11, qword [rsp+8*23]
	cmp r10,r11
	mov r12, qword [rsp+8*59]
	mov r12, 0
	setl r12B
	mov qword [rsp+8*24],r10
	mov qword [rsp+8*23],r11
	mov qword [rsp+8*59],r12
	mov r10, qword [rsp+8*59]
	cmp r10, 0
	mov qword [rsp+8*59],r10
	je L_183
	mov r10, qword [arg+8*1]
	mov r11, qword [rsp+8*23]
	mov r10,r11
	mov qword [arg+8*1],r10
	mov qword [rsp+8*23],r11
	mov r10, qword [arg+8*0]
	mov r11, qword [rsp+8*24]
	mov r10,r11
	mov qword [arg+8*0],r10
	mov qword [rsp+8*24],r11
	call qsrt
	mov r10, qword [rsp+8*60]
	mov r10 , rax
	mov qword [rsp+8*60],r10
	
L_183:
	mov r10,0
	mov rax,r10
	leave
	ret
	mov r10,0
	mov rax,r10
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 560
	mov     rdi, 101
	call    mallocArray
	mov     qword [gbl+8*61], rax
	mov r10, qword [gbl+8*7]
	mov r11, qword [gbl+8*61]
	mov r10,r11
	mov qword [gbl+8*7],r10
	mov qword [gbl+8*61],r11
	mov r10, qword [gbl+8*3]
	mov r11,100
	mov r10,r11
	mov qword [gbl+8*3],r10
	mov r10, qword [rsp+8*62]
	mov rax,r10
	mov qword [rsp+8*62],r10
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   2544
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
	

