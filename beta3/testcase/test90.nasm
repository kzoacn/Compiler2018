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
	sub    rsp, 2008
	call global_init
	mov r8 , rax
	mov r10,58
	mov r9,r10
	mov r12,56
	mov r11,r12
	mov r14,54
	mov r13,r14
	mov qword [rsp+8*1],r8
	mov r8,52
	mov r15,r8
	mov qword [arg+8*31],r9
	mov r9,50
	mov r8,r9
	mov qword [arg+8*27],r8
	mov r9,48
	mov r8,r9
	mov qword [arg+8*26],r8
	mov r9,46
	mov r8,r9
	mov qword [arg+8*25],r8
	mov r9,44
	mov r8,r9
	mov qword [arg+8*24],r8
	mov r9,42
	mov r8,r9
	mov qword [arg+8*23],r8
	mov r9,40
	mov r8,r9
	mov qword [arg+8*22],r8
	mov r9,38
	mov r8,r9
	mov qword [arg+8*21],r8
	mov r9,36
	mov r8,r9
	mov qword [arg+8*20],r8
	mov r9,34
	mov r8,r9
	mov qword [arg+8*19],r8
	mov r9,32
	mov r8,r9
	mov qword [arg+8*18],r8
	mov r9,30
	mov r8,r9
	mov qword [arg+8*17],r8
	mov r9,28
	mov r8,r9
	mov qword [arg+8*16],r8
	mov r9,26
	mov r8,r9
	mov qword [arg+8*15],r8
	mov r9,24
	mov r8,r9
	mov qword [arg+8*14],r8
	mov r9,22
	mov r8,r9
	mov qword [arg+8*13],r8
	mov r9,20
	mov r8,r9
	mov qword [arg+8*12],r8
	mov r9,18
	mov r8,r9
	mov qword [arg+8*11],r8
	mov r9,16
	mov r8,r9
	mov qword [arg+8*10],r8
	mov r9,14
	mov r8,r9
	mov qword [arg+8*9],r8
	mov r9,12
	mov r8,r9
	mov qword [arg+8*8],r8
	mov r9,10
	mov r8,r9
	mov qword [arg+8*7],r8
	mov r9,8
	mov r8,r9
	mov qword [arg+8*6],r8
	mov r9,6
	mov r8,r9
	mov qword [arg+8*5],r8
	mov r9,4
	mov r8,r9
	mov qword [arg+8*4],r8
	mov r9,2
	mov r8,r9
	mov qword [arg+8*3],r8
	mov r9,0
	mov r8,r9
	mov qword [arg+8*2],r8
	mov r9,1
	mov r8,r9
	mov qword [arg+8*1],r8
	mov r9,10
	mov r8,r9
	mov qword [arg+8*0],r8
	mov qword [arg+8*30],r11
	mov qword [arg+8*29],r13
	mov qword [arg+8*28],r15
	call gcd
	mov r8 , rax
	mov r9,1024
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r12,r11
	mov qword [rsp+8*34],r8
	mov qword [rsp+8*35],r10
	mov qword [arg+8*0],r11
	mov qword [rsp+8*36],r12
	mov     rdi, [rsp+8*36]
	call    toString
	mov     qword[rsp+8*37], rax
	mov r9, qword [rsp+8*37]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*38],r10
	mov rdi,[rsp+8*38] 
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
	
gcd:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2008
	mov r9, qword [arg+8*0]
	mov r8,r9
	mov r11, qword [arg+8*1]
	mov r10,r11
	mov r13, qword [arg+8*2]
	mov r12,r13
	mov r15, qword [arg+8*3]
	mov r14,r15
	mov qword [rsp+8*39],r8
	mov r9, qword [arg+8*4]
	mov r8,r9
	mov qword [rsp+8*43],r8
	mov r9, qword [arg+8*5]
	mov r8,r9
	mov qword [rsp+8*44],r8
	mov r9, qword [arg+8*6]
	mov r8,r9
	mov qword [rsp+8*45],r8
	mov r9, qword [arg+8*7]
	mov r8,r9
	mov qword [rsp+8*46],r8
	mov r9, qword [arg+8*8]
	mov r8,r9
	mov qword [rsp+8*47],r8
	mov r9, qword [arg+8*9]
	mov r8,r9
	mov qword [rsp+8*48],r8
	mov r9, qword [arg+8*10]
	mov r8,r9
	mov qword [rsp+8*49],r8
	mov r9, qword [arg+8*11]
	mov r8,r9
	mov qword [rsp+8*50],r8
	mov r9, qword [arg+8*12]
	mov r8,r9
	mov qword [rsp+8*51],r8
	mov r9, qword [arg+8*13]
	mov r8,r9
	mov qword [rsp+8*52],r8
	mov r9, qword [arg+8*14]
	mov r8,r9
	mov qword [rsp+8*53],r8
	mov r9, qword [arg+8*15]
	mov r8,r9
	mov qword [rsp+8*54],r8
	mov r9, qword [arg+8*16]
	mov r8,r9
	mov qword [rsp+8*55],r8
	mov r9, qword [arg+8*17]
	mov r8,r9
	mov qword [rsp+8*56],r8
	mov r9, qword [arg+8*18]
	mov r8,r9
	mov qword [rsp+8*57],r8
	mov r9, qword [arg+8*19]
	mov r8,r9
	mov qword [rsp+8*58],r8
	mov r9, qword [arg+8*20]
	mov r8,r9
	mov qword [rsp+8*59],r8
	mov r9, qword [arg+8*21]
	mov r8,r9
	mov qword [rsp+8*60],r8
	mov r9, qword [arg+8*22]
	mov r8,r9
	mov qword [rsp+8*61],r8
	mov r9, qword [arg+8*23]
	mov r8,r9
	mov qword [rsp+8*62],r8
	mov r9, qword [arg+8*24]
	mov r8,r9
	mov qword [rsp+8*63],r8
	mov r9, qword [arg+8*25]
	mov r8,r9
	mov qword [rsp+8*64],r8
	mov r9, qword [arg+8*26]
	mov r8,r9
	mov qword [rsp+8*65],r8
	mov r9, qword [arg+8*27]
	mov r8,r9
	mov qword [rsp+8*66],r8
	mov r9, qword [arg+8*28]
	mov r8,r9
	mov qword [rsp+8*67],r8
	mov r9, qword [arg+8*29]
	mov r8,r9
	mov qword [rsp+8*68],r8
	mov r9, qword [arg+8*30]
	mov r8,r9
	mov qword [rsp+8*69],r8
	mov r9, qword [arg+8*31]
	mov r8,r9
	mov qword [rsp+8*70],r8
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*71],r8
	mov qword [rsp+8*40],r10
	mov qword [rsp+8*41],r12
	mov qword [rsp+8*42],r14
	
L_631:
	mov r8, qword [rsp+8*71]
	mov r9,10
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*72],r10
	mov r8, qword [rsp+8*72]
	cmp r8, 0
	je L_632
	mov r8, qword [rsp+8*41]
	mov r9, qword [rsp+8*42]
	mov r10,r8
	add r10,r9
	mov r11, qword [rsp+8*43]
	mov r12,r10
	add r12,r11
	mov r13, qword [rsp+8*44]
	mov r14,r12
	add r14,r13
	mov r15, qword [rsp+8*45]
	mov r8,r14
	add r8,r15
	mov r9, qword [rsp+8*46]
	mov qword [rsp+8*73],r10
	mov r10,r8
	add r10,r9
	mov qword [rsp+8*76],r8
	mov r8, qword [rsp+8*47]
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*48]
	mov qword [rsp+8*77],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*49]
	mov qword [rsp+8*78],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*50]
	mov qword [rsp+8*79],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*51]
	mov qword [rsp+8*80],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*52]
	mov qword [rsp+8*81],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*53]
	mov qword [rsp+8*82],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*54]
	mov qword [rsp+8*83],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*55]
	mov qword [rsp+8*84],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*56]
	mov qword [rsp+8*85],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*57]
	mov qword [rsp+8*86],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*58]
	mov qword [rsp+8*87],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*59]
	mov qword [rsp+8*88],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*60]
	mov qword [rsp+8*89],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*61]
	mov qword [rsp+8*90],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*62]
	mov qword [rsp+8*91],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*63]
	mov qword [rsp+8*92],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*64]
	mov qword [rsp+8*93],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*65]
	mov qword [rsp+8*94],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*66]
	mov qword [rsp+8*95],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*67]
	mov qword [rsp+8*96],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*68]
	mov qword [rsp+8*97],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*69]
	mov qword [rsp+8*98],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*70]
	mov qword [rsp+8*99],r10
	mov r10,r9
	add r10,r8
	xor rdx, rdx
	mov rax, r10
	mov r8,100
	mov rbx, r8
	cdq
	idiv rbx
	mov qword [rsp+8*100],r9
	mov r9, rdx
	mov r8,r9
	mov qword [rsp+8*103],r8
	mov qword [rsp+8*102],r9
	mov qword [rsp+8*101],r10
	mov qword [rsp+8*74],r12
	mov qword [rsp+8*75],r14
	
L_633:
	mov r8, qword [rsp+8*71]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*71],r8
	jmp L_631
	
L_632:
	xor rdx, rdx
	mov r8, qword [rsp+8*39]
	mov rax, r8
	mov r9, qword [rsp+8*40]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r11,0
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*104],r10
	mov qword [rsp+8*105],r12
	mov r8, qword [rsp+8*105]
	cmp r8, 0
	je L_634
	mov r8, qword [rsp+8*40]
	mov rax,r8
	leave
	ret
	jmp L_635
	
L_634:
	xor rdx, rdx
	mov r8, qword [rsp+8*39]
	mov rax, r8
	mov r9, qword [rsp+8*40]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r12,58
	mov r11,r12
	mov r14,56
	mov r13,r14
	mov r8,54
	mov r15,r8
	mov r9,52
	mov r8,r9
	mov qword [arg+8*28],r8
	mov r9,50
	mov r8,r9
	mov qword [arg+8*27],r8
	mov r9,48
	mov r8,r9
	mov qword [arg+8*26],r8
	mov r9,46
	mov r8,r9
	mov qword [arg+8*25],r8
	mov r9,44
	mov r8,r9
	mov qword [arg+8*24],r8
	mov r9,42
	mov r8,r9
	mov qword [arg+8*23],r8
	mov r9,40
	mov r8,r9
	mov qword [arg+8*22],r8
	mov r9,38
	mov r8,r9
	mov qword [arg+8*21],r8
	mov r9,36
	mov r8,r9
	mov qword [arg+8*20],r8
	mov r9,34
	mov r8,r9
	mov qword [arg+8*19],r8
	mov r9,32
	mov r8,r9
	mov qword [arg+8*18],r8
	mov r9,30
	mov r8,r9
	mov qword [arg+8*17],r8
	mov r9,28
	mov r8,r9
	mov qword [arg+8*16],r8
	mov r9,26
	mov r8,r9
	mov qword [arg+8*15],r8
	mov r9,24
	mov r8,r9
	mov qword [arg+8*14],r8
	mov r9,22
	mov r8,r9
	mov qword [arg+8*13],r8
	mov r9,20
	mov r8,r9
	mov qword [arg+8*12],r8
	mov r9,18
	mov r8,r9
	mov qword [arg+8*11],r8
	mov r9,16
	mov r8,r9
	mov qword [arg+8*10],r8
	mov r9,14
	mov r8,r9
	mov qword [arg+8*9],r8
	mov r9,12
	mov r8,r9
	mov qword [arg+8*8],r8
	mov r9,10
	mov r8,r9
	mov qword [arg+8*7],r8
	mov r9,8
	mov r8,r9
	mov qword [arg+8*6],r8
	mov r9,6
	mov r8,r9
	mov qword [arg+8*5],r8
	mov r9,4
	mov r8,r9
	mov qword [arg+8*4],r8
	mov r9,2
	mov r8,r9
	mov qword [arg+8*3],r8
	mov r9,0
	mov r8,r9
	mov qword [arg+8*2],r8
	mov r9,68
	mov r8,r9
	mov qword [arg+8*1],r8
	mov r9,10
	mov r8,r9
	mov qword [arg+8*0],r8
	mov qword [rsp+8*106],r10
	mov qword [arg+8*31],r11
	mov qword [arg+8*30],r13
	mov qword [arg+8*29],r15
	call gcd
	mov r8 , rax
	mov r10, qword [rsp+8*70]
	mov r9,r10
	mov r12, qword [rsp+8*69]
	mov r11,r12
	mov r14, qword [rsp+8*68]
	mov r13,r14
	mov qword [rsp+8*107],r8
	mov r8, qword [rsp+8*67]
	mov r15,r8
	mov qword [arg+8*31],r9
	mov r9, qword [rsp+8*66]
	mov r8,r9
	mov qword [arg+8*27],r8
	mov r9, qword [rsp+8*65]
	mov r8,r9
	mov qword [arg+8*26],r8
	mov r9, qword [rsp+8*64]
	mov r8,r9
	mov qword [arg+8*25],r8
	mov r9, qword [rsp+8*63]
	mov r8,r9
	mov qword [arg+8*24],r8
	mov r9, qword [rsp+8*62]
	mov r8,r9
	mov qword [arg+8*23],r8
	mov r9, qword [rsp+8*61]
	mov r8,r9
	mov qword [arg+8*22],r8
	mov r9, qword [rsp+8*60]
	mov r8,r9
	mov qword [arg+8*21],r8
	mov r9, qword [rsp+8*59]
	mov r8,r9
	mov qword [arg+8*20],r8
	mov r9, qword [rsp+8*58]
	mov r8,r9
	mov qword [arg+8*19],r8
	mov r9, qword [rsp+8*57]
	mov r8,r9
	mov qword [arg+8*18],r8
	mov r9, qword [rsp+8*56]
	mov r8,r9
	mov qword [arg+8*17],r8
	mov r9, qword [rsp+8*55]
	mov r8,r9
	mov qword [arg+8*16],r8
	mov r9, qword [rsp+8*54]
	mov r8,r9
	mov qword [arg+8*15],r8
	mov r9, qword [rsp+8*53]
	mov r8,r9
	mov qword [arg+8*14],r8
	mov r9, qword [rsp+8*52]
	mov r8,r9
	mov qword [arg+8*13],r8
	mov r9, qword [rsp+8*51]
	mov r8,r9
	mov qword [arg+8*12],r8
	mov r9, qword [rsp+8*50]
	mov r8,r9
	mov qword [arg+8*11],r8
	mov r9, qword [rsp+8*49]
	mov r8,r9
	mov qword [arg+8*10],r8
	mov r9, qword [rsp+8*48]
	mov r8,r9
	mov qword [arg+8*9],r8
	mov r9, qword [rsp+8*47]
	mov r8,r9
	mov qword [arg+8*8],r8
	mov r9, qword [rsp+8*46]
	mov r8,r9
	mov qword [arg+8*7],r8
	mov r9, qword [rsp+8*45]
	mov r8,r9
	mov qword [arg+8*6],r8
	mov r9, qword [rsp+8*44]
	mov r8,r9
	mov qword [arg+8*5],r8
	mov r9, qword [rsp+8*43]
	mov r8,r9
	mov qword [arg+8*4],r8
	mov r9, qword [rsp+8*107]
	mov r8,r9
	mov qword [arg+8*3],r8
	mov r9, qword [rsp+8*103]
	mov r8,r9
	mov qword [arg+8*2],r8
	mov r9, qword [rsp+8*106]
	mov r8,r9
	mov qword [arg+8*1],r8
	mov r9, qword [rsp+8*40]
	mov r8,r9
	mov qword [arg+8*0],r8
	mov qword [arg+8*30],r11
	mov qword [arg+8*29],r13
	mov qword [arg+8*28],r15
	call gcd1
	mov r8 , rax
	mov rax,r8
	mov qword [rsp+8*108],r8
	leave
	ret
	
L_635:
	mov r8,0
	mov rax,r8
	leave
	ret
	
gcd1:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2008
	mov r9, qword [arg+8*0]
	mov r8,r9
	mov r11, qword [arg+8*1]
	mov r10,r11
	mov r13, qword [arg+8*2]
	mov r12,r13
	mov r15, qword [arg+8*3]
	mov r14,r15
	mov qword [rsp+8*109],r8
	mov r9, qword [arg+8*4]
	mov r8,r9
	mov qword [rsp+8*113],r8
	mov r9, qword [arg+8*5]
	mov r8,r9
	mov qword [rsp+8*114],r8
	mov r9, qword [arg+8*6]
	mov r8,r9
	mov qword [rsp+8*115],r8
	mov r9, qword [arg+8*7]
	mov r8,r9
	mov qword [rsp+8*116],r8
	mov r9, qword [arg+8*8]
	mov r8,r9
	mov qword [rsp+8*117],r8
	mov r9, qword [arg+8*9]
	mov r8,r9
	mov qword [rsp+8*118],r8
	mov r9, qword [arg+8*10]
	mov r8,r9
	mov qword [rsp+8*119],r8
	mov r9, qword [arg+8*11]
	mov r8,r9
	mov qword [rsp+8*120],r8
	mov r9, qword [arg+8*12]
	mov r8,r9
	mov qword [rsp+8*121],r8
	mov r9, qword [arg+8*13]
	mov r8,r9
	mov qword [rsp+8*122],r8
	mov r9, qword [arg+8*14]
	mov r8,r9
	mov qword [rsp+8*123],r8
	mov r9, qword [arg+8*15]
	mov r8,r9
	mov qword [rsp+8*124],r8
	mov r9, qword [arg+8*16]
	mov r8,r9
	mov qword [rsp+8*125],r8
	mov r9, qword [arg+8*17]
	mov r8,r9
	mov qword [rsp+8*126],r8
	mov r9, qword [arg+8*18]
	mov r8,r9
	mov qword [rsp+8*127],r8
	mov r9, qword [arg+8*19]
	mov r8,r9
	mov qword [rsp+8*128],r8
	mov r9, qword [arg+8*20]
	mov r8,r9
	mov qword [rsp+8*129],r8
	mov r9, qword [arg+8*21]
	mov r8,r9
	mov qword [rsp+8*130],r8
	mov r9, qword [arg+8*22]
	mov r8,r9
	mov qword [rsp+8*131],r8
	mov r9, qword [arg+8*23]
	mov r8,r9
	mov qword [rsp+8*132],r8
	mov r9, qword [arg+8*24]
	mov r8,r9
	mov qword [rsp+8*133],r8
	mov r9, qword [arg+8*25]
	mov r8,r9
	mov qword [rsp+8*134],r8
	mov r9, qword [arg+8*26]
	mov r8,r9
	mov qword [rsp+8*135],r8
	mov r9, qword [arg+8*27]
	mov r8,r9
	mov qword [rsp+8*136],r8
	mov r9, qword [arg+8*28]
	mov r8,r9
	mov qword [rsp+8*137],r8
	mov r9, qword [arg+8*29]
	mov r8,r9
	mov qword [rsp+8*138],r8
	mov r9, qword [arg+8*30]
	mov r8,r9
	mov qword [rsp+8*139],r8
	mov r9, qword [arg+8*31]
	mov r8,r9
	mov qword [rsp+8*140],r8
	mov r8,r12
	add r8,r14
	mov r9, qword [rsp+8*113]
	mov qword [rsp+8*110],r10
	mov r10,r8
	add r10,r9
	mov qword [rsp+8*141],r8
	mov r8, qword [rsp+8*114]
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*115]
	mov qword [rsp+8*142],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*116]
	mov qword [rsp+8*143],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*117]
	mov qword [rsp+8*144],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*118]
	mov qword [rsp+8*145],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*119]
	mov qword [rsp+8*146],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*120]
	mov qword [rsp+8*147],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*121]
	mov qword [rsp+8*148],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*122]
	mov qword [rsp+8*149],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*123]
	mov qword [rsp+8*150],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*124]
	mov qword [rsp+8*151],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*125]
	mov qword [rsp+8*152],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*126]
	mov qword [rsp+8*153],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*127]
	mov qword [rsp+8*154],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*128]
	mov qword [rsp+8*155],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*129]
	mov qword [rsp+8*156],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*130]
	mov qword [rsp+8*157],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*131]
	mov qword [rsp+8*158],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*132]
	mov qword [rsp+8*159],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*133]
	mov qword [rsp+8*160],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*134]
	mov qword [rsp+8*161],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*135]
	mov qword [rsp+8*162],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*136]
	mov qword [rsp+8*163],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*137]
	mov qword [rsp+8*164],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*138]
	mov qword [rsp+8*165],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*139]
	mov qword [rsp+8*166],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*140]
	mov qword [rsp+8*167],r9
	mov r9,r10
	add r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,100
	mov rbx, r8
	cdq
	idiv rbx
	mov qword [rsp+8*168],r10
	mov r10, rdx
	mov r8,r10
	xor rdx, rdx
	mov qword [rsp+8*171],r8
	mov r8, qword [rsp+8*109]
	mov rax, r8
	mov qword [rsp+8*169],r9
	mov r9, qword [rsp+8*110]
	mov rbx, r9
	cdq
	idiv rbx
	mov qword [rsp+8*170],r10
	mov r10, rdx
	mov r8,0
	cmp r10,r8
	mov r9, 0
	sete r9B
	mov qword [rsp+8*173],r9
	mov qword [rsp+8*172],r10
	mov qword [rsp+8*111],r12
	mov qword [rsp+8*112],r14
	mov r8, qword [rsp+8*173]
	cmp r8, 0
	je L_636
	mov r8, qword [rsp+8*110]
	mov rax,r8
	leave
	ret
	jmp L_637
	
L_636:
	xor rdx, rdx
	mov r8, qword [rsp+8*109]
	mov rax, r8
	mov r9, qword [rsp+8*110]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r12, qword [rsp+8*140]
	mov r11,r12
	mov r14, qword [rsp+8*139]
	mov r13,r14
	mov r8, qword [rsp+8*138]
	mov r15,r8
	mov r9, qword [rsp+8*137]
	mov r8,r9
	mov qword [arg+8*28],r8
	mov r9, qword [rsp+8*136]
	mov r8,r9
	mov qword [arg+8*27],r8
	mov r9, qword [rsp+8*135]
	mov r8,r9
	mov qword [arg+8*26],r8
	mov r9, qword [rsp+8*134]
	mov r8,r9
	mov qword [arg+8*25],r8
	mov r9, qword [rsp+8*133]
	mov r8,r9
	mov qword [arg+8*24],r8
	mov r9, qword [rsp+8*132]
	mov r8,r9
	mov qword [arg+8*23],r8
	mov r9, qword [rsp+8*131]
	mov r8,r9
	mov qword [arg+8*22],r8
	mov r9, qword [rsp+8*130]
	mov r8,r9
	mov qword [arg+8*21],r8
	mov r9, qword [rsp+8*129]
	mov r8,r9
	mov qword [arg+8*20],r8
	mov r9, qword [rsp+8*128]
	mov r8,r9
	mov qword [arg+8*19],r8
	mov r9, qword [rsp+8*127]
	mov r8,r9
	mov qword [arg+8*18],r8
	mov r9, qword [rsp+8*126]
	mov r8,r9
	mov qword [arg+8*17],r8
	mov r9, qword [rsp+8*125]
	mov r8,r9
	mov qword [arg+8*16],r8
	mov r9, qword [rsp+8*124]
	mov r8,r9
	mov qword [arg+8*15],r8
	mov r9, qword [rsp+8*123]
	mov r8,r9
	mov qword [arg+8*14],r8
	mov r9, qword [rsp+8*122]
	mov r8,r9
	mov qword [arg+8*13],r8
	mov r9, qword [rsp+8*121]
	mov r8,r9
	mov qword [arg+8*12],r8
	mov r9, qword [rsp+8*120]
	mov r8,r9
	mov qword [arg+8*11],r8
	mov r9, qword [rsp+8*119]
	mov r8,r9
	mov qword [arg+8*10],r8
	mov r9, qword [rsp+8*118]
	mov r8,r9
	mov qword [arg+8*9],r8
	mov r9, qword [rsp+8*117]
	mov r8,r9
	mov qword [arg+8*8],r8
	mov r9, qword [rsp+8*116]
	mov r8,r9
	mov qword [arg+8*7],r8
	mov r9, qword [rsp+8*115]
	mov r8,r9
	mov qword [arg+8*6],r8
	mov r9, qword [rsp+8*114]
	mov r8,r9
	mov qword [arg+8*5],r8
	mov r9, qword [rsp+8*113]
	mov r8,r9
	mov qword [arg+8*4],r8
	mov r9, qword [rsp+8*112]
	mov r8,r9
	mov qword [arg+8*3],r8
	mov r9, qword [rsp+8*171]
	mov r8,r9
	mov qword [arg+8*2],r8
	mov r8,r10
	mov qword [arg+8*1],r8
	mov r9, qword [rsp+8*110]
	mov r8,r9
	mov qword [arg+8*0],r8
	mov qword [rsp+8*174],r10
	mov qword [arg+8*31],r11
	mov qword [arg+8*30],r13
	mov qword [arg+8*29],r15
	call gcd2
	mov r8 , rax
	mov rax,r8
	mov qword [rsp+8*175],r8
	leave
	ret
	
L_637:
	mov r8,0
	mov rax,r8
	leave
	ret
	
gcd2:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2008
	mov r9, qword [arg+8*0]
	mov r8,r9
	mov r11, qword [arg+8*1]
	mov r10,r11
	mov r13, qword [arg+8*2]
	mov r12,r13
	mov r15, qword [arg+8*3]
	mov r14,r15
	mov qword [rsp+8*176],r8
	mov r9, qword [arg+8*4]
	mov r8,r9
	mov qword [rsp+8*180],r8
	mov r9, qword [arg+8*5]
	mov r8,r9
	mov qword [rsp+8*181],r8
	mov r9, qword [arg+8*6]
	mov r8,r9
	mov qword [rsp+8*182],r8
	mov r9, qword [arg+8*7]
	mov r8,r9
	mov qword [rsp+8*183],r8
	mov r9, qword [arg+8*8]
	mov r8,r9
	mov qword [rsp+8*184],r8
	mov r9, qword [arg+8*9]
	mov r8,r9
	mov qword [rsp+8*185],r8
	mov r9, qword [arg+8*10]
	mov r8,r9
	mov qword [rsp+8*186],r8
	mov r9, qword [arg+8*11]
	mov r8,r9
	mov qword [rsp+8*187],r8
	mov r9, qword [arg+8*12]
	mov r8,r9
	mov qword [rsp+8*188],r8
	mov r9, qword [arg+8*13]
	mov r8,r9
	mov qword [rsp+8*189],r8
	mov r9, qword [arg+8*14]
	mov r8,r9
	mov qword [rsp+8*190],r8
	mov r9, qword [arg+8*15]
	mov r8,r9
	mov qword [rsp+8*191],r8
	mov r9, qword [arg+8*16]
	mov r8,r9
	mov qword [rsp+8*192],r8
	mov r9, qword [arg+8*17]
	mov r8,r9
	mov qword [rsp+8*193],r8
	mov r9, qword [arg+8*18]
	mov r8,r9
	mov qword [rsp+8*194],r8
	mov r9, qword [arg+8*19]
	mov r8,r9
	mov qword [rsp+8*195],r8
	mov r9, qword [arg+8*20]
	mov r8,r9
	mov qword [rsp+8*196],r8
	mov r9, qword [arg+8*21]
	mov r8,r9
	mov qword [rsp+8*197],r8
	mov r9, qword [arg+8*22]
	mov r8,r9
	mov qword [rsp+8*198],r8
	mov r9, qword [arg+8*23]
	mov r8,r9
	mov qword [rsp+8*199],r8
	mov r9, qword [arg+8*24]
	mov r8,r9
	mov qword [rsp+8*200],r8
	mov r9, qword [arg+8*25]
	mov r8,r9
	mov qword [rsp+8*201],r8
	mov r9, qword [arg+8*26]
	mov r8,r9
	mov qword [rsp+8*202],r8
	mov r9, qword [arg+8*27]
	mov r8,r9
	mov qword [rsp+8*203],r8
	mov r9, qword [arg+8*28]
	mov r8,r9
	mov qword [rsp+8*204],r8
	mov r9, qword [arg+8*29]
	mov r8,r9
	mov qword [rsp+8*205],r8
	mov r9, qword [arg+8*30]
	mov r8,r9
	mov qword [rsp+8*206],r8
	mov r9, qword [arg+8*31]
	mov r8,r9
	mov qword [rsp+8*207],r8
	mov r8,r12
	add r8,r14
	mov r9, qword [rsp+8*180]
	mov qword [rsp+8*177],r10
	mov r10,r8
	add r10,r9
	mov qword [rsp+8*208],r8
	mov r8, qword [rsp+8*181]
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*182]
	mov qword [rsp+8*209],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*183]
	mov qword [rsp+8*210],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*184]
	mov qword [rsp+8*211],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*185]
	mov qword [rsp+8*212],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*186]
	mov qword [rsp+8*213],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*187]
	mov qword [rsp+8*214],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*188]
	mov qword [rsp+8*215],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*189]
	mov qword [rsp+8*216],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*190]
	mov qword [rsp+8*217],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*191]
	mov qword [rsp+8*218],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*192]
	mov qword [rsp+8*219],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*193]
	mov qword [rsp+8*220],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*194]
	mov qword [rsp+8*221],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*195]
	mov qword [rsp+8*222],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*196]
	mov qword [rsp+8*223],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*197]
	mov qword [rsp+8*224],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*198]
	mov qword [rsp+8*225],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*199]
	mov qword [rsp+8*226],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*200]
	mov qword [rsp+8*227],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*201]
	mov qword [rsp+8*228],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*202]
	mov qword [rsp+8*229],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*203]
	mov qword [rsp+8*230],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*204]
	mov qword [rsp+8*231],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*205]
	mov qword [rsp+8*232],r9
	mov r9,r10
	add r9,r8
	mov r8, qword [rsp+8*206]
	mov qword [rsp+8*233],r10
	mov r10,r9
	add r10,r8
	mov r8, qword [rsp+8*207]
	mov qword [rsp+8*234],r9
	mov r9,r10
	add r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,100
	mov rbx, r8
	cdq
	idiv rbx
	mov qword [rsp+8*235],r10
	mov r10, rdx
	mov r8,r10
	xor rdx, rdx
	mov qword [rsp+8*238],r8
	mov r8, qword [rsp+8*176]
	mov rax, r8
	mov qword [rsp+8*236],r9
	mov r9, qword [rsp+8*177]
	mov rbx, r9
	cdq
	idiv rbx
	mov qword [rsp+8*237],r10
	mov r10, rdx
	mov r8,0
	cmp r10,r8
	mov r9, 0
	sete r9B
	mov qword [rsp+8*240],r9
	mov qword [rsp+8*239],r10
	mov qword [rsp+8*178],r12
	mov qword [rsp+8*179],r14
	mov r8, qword [rsp+8*240]
	cmp r8, 0
	je L_638
	mov r8, qword [rsp+8*177]
	mov rax,r8
	leave
	ret
	jmp L_639
	
L_638:
	xor rdx, rdx
	mov r8, qword [rsp+8*176]
	mov rax, r8
	mov r9, qword [rsp+8*177]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r12, qword [rsp+8*207]
	mov r11,r12
	mov r14, qword [rsp+8*206]
	mov r13,r14
	mov r8, qword [rsp+8*205]
	mov r15,r8
	mov r9, qword [rsp+8*204]
	mov r8,r9
	mov qword [arg+8*28],r8
	mov r9, qword [rsp+8*203]
	mov r8,r9
	mov qword [arg+8*27],r8
	mov r9, qword [rsp+8*202]
	mov r8,r9
	mov qword [arg+8*26],r8
	mov r9, qword [rsp+8*201]
	mov r8,r9
	mov qword [arg+8*25],r8
	mov r9, qword [rsp+8*200]
	mov r8,r9
	mov qword [arg+8*24],r8
	mov r9, qword [rsp+8*199]
	mov r8,r9
	mov qword [arg+8*23],r8
	mov r9, qword [rsp+8*198]
	mov r8,r9
	mov qword [arg+8*22],r8
	mov r9, qword [rsp+8*197]
	mov r8,r9
	mov qword [arg+8*21],r8
	mov r9, qword [rsp+8*196]
	mov r8,r9
	mov qword [arg+8*20],r8
	mov r9, qword [rsp+8*195]
	mov r8,r9
	mov qword [arg+8*19],r8
	mov r9, qword [rsp+8*194]
	mov r8,r9
	mov qword [arg+8*18],r8
	mov r9, qword [rsp+8*193]
	mov r8,r9
	mov qword [arg+8*17],r8
	mov r9, qword [rsp+8*192]
	mov r8,r9
	mov qword [arg+8*16],r8
	mov r9, qword [rsp+8*191]
	mov r8,r9
	mov qword [arg+8*15],r8
	mov r9, qword [rsp+8*190]
	mov r8,r9
	mov qword [arg+8*14],r8
	mov r9, qword [rsp+8*189]
	mov r8,r9
	mov qword [arg+8*13],r8
	mov r9, qword [rsp+8*188]
	mov r8,r9
	mov qword [arg+8*12],r8
	mov r9, qword [rsp+8*187]
	mov r8,r9
	mov qword [arg+8*11],r8
	mov r9, qword [rsp+8*186]
	mov r8,r9
	mov qword [arg+8*10],r8
	mov r9, qword [rsp+8*185]
	mov r8,r9
	mov qword [arg+8*9],r8
	mov r9, qword [rsp+8*184]
	mov r8,r9
	mov qword [arg+8*8],r8
	mov r9, qword [rsp+8*183]
	mov r8,r9
	mov qword [arg+8*7],r8
	mov r9, qword [rsp+8*182]
	mov r8,r9
	mov qword [arg+8*6],r8
	mov r9, qword [rsp+8*181]
	mov r8,r9
	mov qword [arg+8*5],r8
	mov r9, qword [rsp+8*180]
	mov r8,r9
	mov qword [arg+8*4],r8
	mov r9, qword [rsp+8*179]
	mov r8,r9
	mov qword [arg+8*3],r8
	mov r9, qword [rsp+8*178]
	mov r8,r9
	mov qword [arg+8*2],r8
	mov r8,r10
	mov qword [arg+8*1],r8
	mov r9, qword [rsp+8*177]
	mov r8,r9
	mov qword [arg+8*0],r8
	mov qword [rsp+8*241],r10
	mov qword [arg+8*31],r11
	mov qword [arg+8*30],r13
	mov qword [arg+8*29],r15
	call gcd
	mov r8 , rax
	mov rax,r8
	mov qword [rsp+8*242],r8
	leave
	ret
	
L_639:
	mov r8,0
	mov rax,r8
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2008
	mov r8, qword [rsp+8*243]
	mov rax,r8
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   3992
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
	

