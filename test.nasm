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
	sub    rsp, 1456
	call global_init
	mov r8 , rax
	mov r10,0
	mov r9,r10
	mov qword [rsp+8*1],r8
	mov qword [rsp+8*2],r9
	
L_46:
	mov r8, qword [rsp+8*2]
	mov r9,100
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*3],r10
	mov r8, qword [rsp+8*3]
	cmp r8, 0
	je L_47
	mov r9,0
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov r13,0
	mov r12,r13
	mov r15,5050
	mov r14,r15
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*4],r8
	mov qword [gbl+8*8],r9
	mov qword [rsp+8*5],r10
	mov qword [rsp+8*6],r12
	mov qword [gbl+8*7],r14
	mov     rdi, 101
	call    mallocArray
	mov     qword [rsp+8*9], rax
	mov r9, qword [rsp+8*9]
	mov r8,r9
	xor rdx, rdx
	mov r10, qword [gbl+8*11]
	mov rax, r10
	mov r11, qword [gbl+8*12]
	mov rbx, r11
	cdq
	idiv rbx
	mov r12, rax
	mov r13,r12
	xor rdx, rdx
	mov rax, r10
	mov rbx, r11
	cdq
	idiv rbx
	mov r14, rdx
	mov r15,r14
	mov r12, qword [gbl+8*7]
	mov r9,r12
	mov qword [gbl+8*10],r8
	mov qword [arg+8*0],r9
	mov qword [gbl+8*14],r13
	mov qword [rsp+8*15],r14
	mov qword [gbl+8*16],r15
	call pd
	mov r8 , rax
	mov r9, 0
	cmp r8, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*18],r8
	mov qword [rsp+8*19],r9
	je L_50
	mov r9,t227
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*20],r10
	mov rdi,[rsp+8*20] 
	add rdi, 1 
	call puts
	mov r8,1
	mov rax,r8
	leave
	ret
	
L_50:
	mov r9,t232
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*21],r10
	mov rdi,[rsp+8*21] 
	add rdi, 1 
	call puts
	call random
	mov r8 , rax
	mov r9,r8
	mov qword [rsp+8*22],r8
	mov qword [arg+8*0],r9
	call initialize
	mov r8 , rax
	mov qword [rsp+8*23],r8
	call random
	mov r8 , rax
	xor rdx, rdx
	mov rax, r8
	mov r9,10
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r13,r12
	mov r14,r13
	mov r15,r14
	mov qword [rsp+8*24],r8
	mov qword [rsp+8*25],r10
	mov qword [rsp+8*26],r12
	mov qword [gbl+8*27],r13
	mov qword [arg+8*0],r14
	mov qword [rsp+8*28],r15
	mov     rdi, [rsp+8*28]
	call    toString
	mov     qword[rsp+8*29], rax
	mov r9, qword [rsp+8*29]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*30],r10
	mov rdi,[rsp+8*30] 
	add rdi, 1 
	call puts
	
L_51:
	mov r8, qword [gbl+8*27]
	mov r9,1
	mov r10,r8
	sub r10,r9
	mov r11, qword [rsp+8*4]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*31],r10
	mov qword [rsp+8*32],r12
	mov r8, qword [rsp+8*32]
	cmp r8, 0
	je L_52
	call random
	mov r8 , rax
	xor rdx, rdx
	mov rax, r8
	mov r9,10
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r14, qword [gbl+8*10]
	mov r13,r14
	mov r15, qword [rsp+8*4]
	mov qword [rsp+8*33],r8
	mov r8,r15
	add r8,1
	shl r8,4
	add r8,r13
	mov [r8],r12
	mov qword [rsp+8*37],r8
	mov qword [rsp+8*34],r10
	mov qword [rsp+8*35],r12
	mov qword [rsp+8*36],r13
	
L_54:
	mov r9, qword [gbl+8*10]
	mov r8,r9
	mov r10, qword [rsp+8*4]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13, qword [rsp+8*5]
	mov r14,r12
	add r14,r13
	mov r15, qword [gbl+8*7]
	cmp r14,r15
	mov qword [rsp+8*38],r8
	mov r8, 0
	setg r8B
	mov qword [rsp+8*42],r8
	mov qword [rsp+8*39],r11
	mov qword [rsp+8*40],r12
	mov qword [rsp+8*41],r14
	mov r8, qword [rsp+8*42]
	cmp r8, 0
	je L_55
	call random
	mov r8 , rax
	xor rdx, rdx
	mov rax, r8
	mov r9,10
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r14, qword [gbl+8*10]
	mov r13,r14
	mov r15, qword [rsp+8*4]
	mov qword [rsp+8*43],r8
	mov r8,r15
	add r8,1
	shl r8,4
	add r8,r13
	mov [r8],r12
	mov qword [rsp+8*47],r8
	mov qword [rsp+8*44],r10
	mov qword [rsp+8*45],r12
	mov qword [rsp+8*46],r13
	jmp L_54
	
L_55:
	mov r9, qword [gbl+8*10]
	mov r8,r9
	mov r10, qword [rsp+8*4]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13, qword [rsp+8*5]
	mov r14,r13
	add r14,r12
	mov r13,r14
	mov qword [rsp+8*48],r8
	mov qword [rsp+8*49],r11
	mov qword [rsp+8*50],r12
	mov qword [rsp+8*5],r13
	mov qword [rsp+8*51],r14
	
L_53:
	mov r8, qword [rsp+8*4]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*4],r8
	jmp L_51
	
L_52:
	mov r8, qword [gbl+8*7]
	mov r9, qword [rsp+8*5]
	mov r10,r8
	sub r10,r9
	mov r11, qword [gbl+8*27]
	mov r12,1
	mov r13,r11
	sub r13,r12
	mov r15, qword [gbl+8*10]
	mov r14,r15
	mov r8,r13
	add r8,1
	shl r8,4
	add r8,r14
	mov [r8],r10
	mov qword [rsp+8*55],r8
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*53],r13
	mov qword [rsp+8*54],r14
	call show
	mov r8 , rax
	mov qword [rsp+8*56],r8
	call merge
	mov r8 , rax
	mov qword [rsp+8*57],r8
	
L_56:
	call win
	mov r8 , rax
	mov r9, 0
	cmp r8, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*58],r8
	mov qword [rsp+8*59],r9
	je L_57
	mov r8, qword [rsp+8*6]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*6],r8
	call move
	mov r8 , rax
	mov qword [rsp+8*60],r8
	call merge
	mov r8 , rax
	mov qword [rsp+8*61],r8
	jmp L_56
	
L_57:
	mov r9, qword [rsp+8*6]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*62],r10
	mov     rdi, [rsp+8*62]
	call    toString
	mov     qword[rsp+8*63], rax
	mov     rsi, [rsp+8*63]
	mov     rdi, t298
	call    concat
	mov [rsp+8*64], rax
	mov     rsi, t303
	mov     rdi, [rsp+8*64]
	call    concat
	mov [rsp+8*65], rax
	mov r9, qword [rsp+8*65]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*66],r10
	mov rdi,[rsp+8*66] 
	add rdi, 1 
	call puts
	
L_48:
	mov r8, qword [rsp+8*2]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*2],r8
	jmp L_46
	
L_47:
	mov r8,0
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	jmp QED
	
random:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1456
	xor rdx, rdx
	mov r8, qword [gbl+8*67]
	mov rax, r8
	mov r9, qword [gbl+8*14]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r11, qword [gbl+8*12]
	mov r12,r11
	imul r12,r10
	xor rdx, rdx
	mov rax, r8
	mov rbx, r9
	cdq
	idiv rbx
	mov r13, rax
	mov r14, qword [gbl+8*16]
	mov r15,r14
	imul r15,r13
	mov r9,r12
	sub r9,r15
	mov r10,r9
	mov r9,0
	cmp r10,r9
	mov r12, 0
	setge r12B
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*74],r12
	mov qword [rsp+8*70],r13
	mov qword [rsp+8*71],r15
	mov r8, qword [rsp+8*74]
	cmp r8, 0
	je L_0
	mov r9, qword [rsp+8*73]
	mov r8,r9
	mov qword [gbl+8*67],r8
	jmp L_1
	
L_0:
	mov r8, qword [rsp+8*73]
	mov r9, qword [gbl+8*11]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*75],r10
	mov qword [gbl+8*67],r11
	
L_1:
	mov r8, qword [gbl+8*67]
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
initialize:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1456
	mov r9, qword [arg+8*0]
	mov r8,r9
	mov r10,r8
	mov r11,0
	mov rax,r11
	mov qword [rsp+8*76],r8
	mov qword [gbl+8*67],r10
	leave
	ret
	
swap:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1456
	mov r9, qword [arg+8*0]
	mov r8,r9
	mov r11, qword [arg+8*1]
	mov r10,r11
	mov r13, qword [gbl+8*10]
	mov r12,r13
	mov r14,r8
	add r14,1
	shl r14,4
	add r14,r12
	mov r15, [r14]
	mov qword [rsp+8*80],r12
	mov r12,r15
	mov qword [rsp+8*81],r14
	mov r14,r13
	mov qword [rsp+8*82],r15
	mov r15,r10
	add r15,1
	shl r15,4
	add r15,r14
	mov qword [rsp+8*84],r14
	mov r14, [r15]
	mov qword [rsp+8*85],r15
	mov r15,r13
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r15
	mov [r13],r14
	mov qword [rsp+8*77],r8
	mov qword [rsp+8*88],r13
	mov r13, qword [gbl+8*10]
	mov r8,r13
	mov qword [rsp+8*86],r14
	mov r14,r10
	add r14,1
	shl r14,4
	add r14,r8
	mov [r14],r12
	mov qword [rsp+8*89],r8
	mov r8,0
	mov rax,r8
	mov qword [rsp+8*79],r10
	mov qword [rsp+8*83],r12
	mov qword [rsp+8*90],r14
	mov qword [rsp+8*87],r15
	leave
	ret
	
pd:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1456
	mov r9, qword [arg+8*0]
	mov r8,r9
	mov qword [rsp+8*91],r8
	
L_2:
	mov r8, qword [gbl+8*8]
	mov r9, qword [rsp+8*91]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*92],r10
	mov r8, qword [rsp+8*92]
	cmp r8, 0
	je L_3
	mov r8, qword [gbl+8*8]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r11,r8
	imul r11,r10
	xor rdx, rdx
	mov rax, r11
	mov r12,2
	mov rbx, r12
	cdq
	idiv rbx
	mov r13, rax
	mov r14, qword [rsp+8*91]
	cmp r14,r13
	mov r15, 0
	sete r15B
	mov qword [rsp+8*93],r10
	mov qword [rsp+8*94],r11
	mov qword [rsp+8*95],r13
	mov qword [rsp+8*96],r15
	mov r8, qword [rsp+8*96]
	cmp r8, 0
	je L_6
	mov r8,1
	mov rax,r8
	leave
	ret
	
L_6:
	
L_4:
	mov r8, qword [gbl+8*8]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [gbl+8*8],r8
	jmp L_2
	
L_3:
	mov r8,0
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
show:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1456
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*97],r8
	
L_7:
	mov r8, qword [rsp+8*97]
	mov r9, qword [gbl+8*27]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*98],r10
	mov r8, qword [rsp+8*98]
	cmp r8, 0
	je L_8
	mov r9, qword [gbl+8*10]
	mov r8,r9
	mov r10, qword [rsp+8*97]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov r14,r13
	mov qword [rsp+8*99],r8
	mov qword [rsp+8*100],r11
	mov qword [rsp+8*101],r12
	mov qword [arg+8*0],r13
	mov qword [rsp+8*102],r14
	mov     rdi, [rsp+8*102]
	call    toString
	mov     qword[rsp+8*103], rax
	mov     rsi, t108
	mov     rdi, [rsp+8*103]
	call    concat
	mov [rsp+8*104], rax
	mov r9, qword [rsp+8*104]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*105],r10
	mov rdi, format
	mov rsi,[rsp+8*105] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_9:
	mov r8, qword [rsp+8*97]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*97],r8
	jmp L_7
	
L_8:
	mov r9,t113
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*106],r10
	mov rdi,[rsp+8*106] 
	add rdi, 1 
	call puts
	mov r8,0
	mov rax,r8
	leave
	ret
	
win:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1456
	mov     rdi, 101
	call    mallocArray
	mov     qword [rsp+8*107], rax
	mov r9, qword [rsp+8*107]
	mov r8,r9
	mov r10, qword [gbl+8*27]
	mov r11, qword [gbl+8*8]
	cmp r10,r11
	mov r12, 0
	setne r12B
	mov qword [rsp+8*108],r8
	mov qword [rsp+8*109],r12
	mov r8, qword [rsp+8*109]
	cmp r8, 0
	je L_11
	mov r8,0
	mov rax,r8
	leave
	ret
	
L_11:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*110],r8
	
L_12:
	mov r8, qword [rsp+8*110]
	mov r9, qword [gbl+8*27]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*111],r10
	mov r8, qword [rsp+8*111]
	cmp r8, 0
	je L_13
	mov r9, qword [gbl+8*10]
	mov r8,r9
	mov r10, qword [rsp+8*110]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r14, qword [rsp+8*108]
	mov r13,r14
	mov r15,r10
	add r15,1
	shl r15,4
	add r15,r13
	mov [r15],r12
	mov qword [rsp+8*112],r8
	mov qword [rsp+8*113],r11
	mov qword [rsp+8*114],r12
	mov qword [rsp+8*115],r13
	mov qword [rsp+8*116],r15
	
L_14:
	mov r8, qword [rsp+8*110]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*110],r8
	jmp L_12
	
L_13:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*117],r8
	
L_15:
	mov r8, qword [gbl+8*27]
	mov r9,1
	mov r10,r8
	sub r10,r9
	mov r11, qword [rsp+8*117]
	cmp r11,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*118],r10
	mov qword [rsp+8*119],r12
	mov r8, qword [rsp+8*119]
	cmp r8, 0
	je L_16
	mov r8, qword [rsp+8*117]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*120],r10
	mov qword [rsp+8*110],r11
	
L_18:
	mov r8, qword [rsp+8*110]
	mov r9, qword [gbl+8*27]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*121],r10
	mov r8, qword [rsp+8*121]
	cmp r8, 0
	je L_19
	mov r9, qword [rsp+8*108]
	mov r8,r9
	mov r10, qword [rsp+8*117]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14, qword [rsp+8*110]
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*122],r8
	mov r8, [r15]
	cmp r12,r8
	mov qword [rsp+8*123],r11
	mov r11, 0
	setg r11B
	mov qword [rsp+8*127],r8
	mov qword [rsp+8*128],r11
	mov qword [rsp+8*124],r12
	mov qword [rsp+8*125],r13
	mov qword [rsp+8*126],r15
	mov r8, qword [rsp+8*128]
	cmp r8, 0
	je L_22
	mov r9, qword [rsp+8*108]
	mov r8,r9
	mov r10, qword [rsp+8*117]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov r14,r9
	mov r15, qword [rsp+8*110]
	mov qword [rsp+8*129],r8
	mov r8,r15
	add r8,1
	shl r8,4
	add r8,r14
	mov qword [rsp+8*130],r11
	mov r11, [r8]
	mov qword [rsp+8*134],r8
	mov r8,r9
	mov qword [rsp+8*131],r12
	mov r12,r10
	add r12,1
	shl r12,4
	add r12,r8
	mov [r12],r11
	mov qword [rsp+8*136],r8
	mov r8,r9
	mov qword [rsp+8*135],r11
	mov r11,r15
	add r11,1
	shl r11,4
	add r11,r8
	mov [r11],r13
	mov qword [rsp+8*138],r8
	mov qword [rsp+8*139],r11
	mov qword [rsp+8*137],r12
	mov qword [rsp+8*132],r13
	mov qword [rsp+8*133],r14
	
L_22:
	
L_20:
	mov r8, qword [rsp+8*110]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*110],r8
	jmp L_18
	
L_19:
	
L_17:
	mov r8, qword [rsp+8*117]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*117],r8
	jmp L_15
	
L_16:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*117],r8
	
L_23:
	mov r8, qword [rsp+8*117]
	mov r9, qword [gbl+8*27]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*140],r10
	mov r8, qword [rsp+8*140]
	cmp r8, 0
	je L_24
	mov r9, qword [rsp+8*108]
	mov r8,r9
	mov r10, qword [rsp+8*117]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,1
	mov r14,r10
	add r14,r13
	cmp r12,r14
	mov r15, 0
	setne r15B
	mov qword [rsp+8*141],r8
	mov qword [rsp+8*142],r11
	mov qword [rsp+8*143],r12
	mov qword [rsp+8*144],r14
	mov qword [rsp+8*145],r15
	mov r8, qword [rsp+8*145]
	cmp r8, 0
	je L_27
	mov r8,0
	mov rax,r8
	leave
	ret
	
L_27:
	
L_25:
	mov r8, qword [rsp+8*117]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*117],r8
	jmp L_23
	
L_24:
	mov r8,1
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
merge:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1456
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*146],r8
	
L_28:
	mov r8, qword [rsp+8*146]
	mov r9, qword [gbl+8*27]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*147],r10
	mov r8, qword [rsp+8*147]
	cmp r8, 0
	je L_29
	mov r9, qword [gbl+8*10]
	mov r8,r9
	mov r10, qword [rsp+8*146]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,0
	cmp r12,r13
	mov r14, 0
	sete r14B
	mov qword [rsp+8*148],r8
	mov qword [rsp+8*149],r11
	mov qword [rsp+8*150],r12
	mov qword [rsp+8*151],r14
	mov r8, qword [rsp+8*151]
	cmp r8, 0
	je L_32
	mov r8, qword [rsp+8*146]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*152],r10
	mov qword [rsp+8*153],r11
	
L_33:
	mov r8, qword [rsp+8*153]
	mov r9, qword [gbl+8*27]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*154],r10
	mov r8, qword [rsp+8*154]
	cmp r8, 0
	je L_34
	mov r9, qword [gbl+8*10]
	mov r8,r9
	mov r10, qword [rsp+8*153]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,0
	cmp r12,r13
	mov r14, 0
	setne r14B
	mov qword [rsp+8*155],r8
	mov qword [rsp+8*156],r11
	mov qword [rsp+8*157],r12
	mov qword [rsp+8*158],r14
	mov r8, qword [rsp+8*158]
	cmp r8, 0
	je L_37
	mov r9, qword [rsp+8*153]
	mov r8,r9
	mov r11, qword [rsp+8*146]
	mov r10,r11
	mov qword [arg+8*1],r8
	mov qword [arg+8*0],r10
	call swap
	mov r8 , rax
	mov qword [rsp+8*159],r8
	jmp L_34
	
L_37:
	
L_35:
	mov r8, qword [rsp+8*153]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*153],r8
	jmp L_33
	
L_34:
	
L_32:
	
L_30:
	mov r8, qword [rsp+8*146]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*146],r8
	jmp L_28
	
L_29:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*146],r8
	
L_38:
	mov r8, qword [rsp+8*146]
	mov r9, qword [gbl+8*27]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*160],r10
	mov r8, qword [rsp+8*160]
	cmp r8, 0
	je L_39
	mov r9, qword [gbl+8*10]
	mov r8,r9
	mov r10, qword [rsp+8*146]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,0
	cmp r12,r13
	mov r14, 0
	sete r14B
	mov qword [rsp+8*161],r8
	mov qword [rsp+8*162],r11
	mov qword [rsp+8*163],r12
	mov qword [rsp+8*164],r14
	mov r8, qword [rsp+8*164]
	cmp r8, 0
	je L_42
	mov r9, qword [rsp+8*146]
	mov r8,r9
	mov qword [gbl+8*27],r8
	jmp L_39
	
L_42:
	
L_40:
	mov r8, qword [rsp+8*146]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*146],r8
	jmp L_38
	
L_39:
	mov r8,0
	mov rax,r8
	leave
	ret
	
move:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1456
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*165],r8
	
L_43:
	mov r8, qword [rsp+8*165]
	mov r9, qword [gbl+8*27]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*166],r10
	mov r8, qword [rsp+8*166]
	cmp r8, 0
	je L_44
	mov r9, qword [gbl+8*10]
	mov r8,r9
	mov r10, qword [rsp+8*165]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,1
	mov r12,r12
	sub r12,r13
	mov [r11],r12
	mov r14,1
	mov r15,r10
	add r15,r14
	mov r10,r15
	mov qword [rsp+8*167],r8
	mov qword [rsp+8*165],r10
	mov qword [rsp+8*168],r11
	mov qword [rsp+8*169],r12
	mov qword [rsp+8*170],r15
	
L_45:
	jmp L_43
	
L_44:
	mov r9, qword [gbl+8*10]
	mov r8,r9
	mov r10, qword [gbl+8*27]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov [r11],r10
	mov r12,r10
	mov r13,1
	mov r10,r10
	add r10,r13
	mov r14,0
	mov rax,r14
	mov qword [rsp+8*171],r8
	mov qword [gbl+8*27],r10
	mov qword [rsp+8*172],r11
	mov qword [rsp+8*173],r12
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1456
	mov r9,48271
	mov r8,r9
	mov r11,2147483647
	mov r10,r11
	mov r13,1
	mov r12,r13
	mov qword [gbl+8*12],r8
	mov qword [gbl+8*11],r10
	mov qword [gbl+8*67],r12
	mov r8, qword [rsp+8*174]
	mov rax,r8
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   3440
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
	
t108:
	 db 1," " ,0

t227:
	 db 79,"Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i" ,0

t303:
	 db 8," step(s)" ,0

t232:
	 db 12,"Let's start!" ,0

t298:
	 db 7,"Total: " ,0

t113:
	 db 0,"" ,0


