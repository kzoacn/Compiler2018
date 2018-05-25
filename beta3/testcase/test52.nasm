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
	sub    rsp, 952
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 2936
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	push r14
	push r13
	push r12
	call global_init
	pop r12
	pop r13
	pop r14
	pop r15
	mov r8 , rax
	mov r10,106
	mov r9,r10
	mov r14,r9
	mov qword [rsp+8*1],r8
	mov qword rdi,r9
	mov     rdi,  r14
	call    mallocArray
	mov     qword [rsp+8*4], rax
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [gbl+8*5],r8
	mov qword [gbl+8*6],r10
	
L_612:
	mov r8,  [gbl+8*6]
	cmp r8,r14
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*7],r9
	je L_613
	mov     rdi,  r14
	call    mallocArray
	mov     qword [rsp+8*8], rax
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*6]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*9],r8
	mov r8,  [rsp+8*8]
	mov [r11],r8
	mov r8,0
	mov r15,r8
	mov qword [rsp+8*10],r11
	
L_614:
	cmp r15,r14
	mov r8, 0
	setl r8B
	cmp r8, 0
	mov qword [rsp+8*12],r8
	je L_615
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*6]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r11,r15
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*13],r8
	mov r8,0
	mov [r11],r8
	mov r8,r15
	inc qword r15 
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*14],r11
	jmp L_614
	
L_615:
	mov r9,  [gbl+8*6]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*16],r8
	mov qword [gbl+8*6],r9
	jmp L_612
	
L_613:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*17],r8
	mov r8,101
	mov r11,r8
	mov r8,1
	mov r9,r11
	sub r9,r8
	mov r8,r9
	mov r9,r8
	mov qword [rsp+8*18],r10
	mov qword [gbl+8*19],r11
	mov r11,0
	mov r10,r11
	mov qword [gbl+8*21],r8
	mov qword [gbl+8*22],r9
	mov qword [gbl+8*6],r10
	
L_592:
	mov r8,  [gbl+8*6]
	mov r9,  [gbl+8*19]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*23],r10
	je L_593
	mov r8,0
	mov r15,r8
	
L_595:
	mov r8,  [gbl+8*19]
	cmp r15,r8
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*24],r9
	je L_596
	mov r8,1
	mov r9,r8
	neg r9
	mov r11,  [gbl+8*5]
	mov r10,r11
	mov r8,  [gbl+8*6]
	mov qword [rsp+8*25],r9
	mov r9,r8
	add r9,1
	shl r9,4
	add r9,r10
	mov r10, [r9]
	mov r9,r15
	add r9,1
	shl r9,4
	add r9,r10
	mov qword [rsp+8*26],r10
	mov r10,  [rsp+8*25]
	mov [r9],r10
	mov qword [rsp+8*27],r9
	mov r9,r15
	inc qword r15 
	mov qword [rsp+8*28],r9
	jmp L_595
	
L_596:
	mov r9,  [gbl+8*6]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*29],r8
	mov qword [gbl+8*6],r9
	jmp L_592
	
L_593:
	
L_598:
	mov r8,  [gbl+8*30]
	mov r9,  [gbl+8*31]
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*32],r10
	je L_599
	mov r9,  [gbl+8*33]
	mov r8,r9
	mov r10,  [gbl+8*30]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*34],r8
	mov r8, [r11]
	mov qword [rsp+8*35],r11
	mov r11,r8
	mov qword [rsp+8*36],r8
	mov r9,  [gbl+8*38]
	mov r8,r9
	mov qword [gbl+8*37],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*39],r8
	mov r8, [r11]
	mov qword [rsp+8*40],r11
	mov r11,r8
	mov qword [rsp+8*41],r8
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*37]
	mov qword [gbl+8*42],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r9,  [gbl+8*42]
	mov r11,r9
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*43],r8
	mov r8, [r11]
	mov qword [rsp+8*44],r11
	mov r11,r8
	mov qword [rsp+8*45],r8
	mov r8,1
	mov r9,r10
	sub r9,r8
	mov r8,  [gbl+8*42]
	mov qword [gbl+8*46],r11
	mov r11,2
	mov qword [rsp+8*47],r9
	mov r9,r8
	sub r9,r11
	mov r11,r9
	mov r10,  [rsp+8*47]
	mov r9,r10
	mov r10,r9
	mov r8,r11
	mov qword rdi,r9
	mov r9,  [gbl+8*19]
	mov r11,r9
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*51],r8
	mov r8,  [rsp+8*50]
	mov r10,r8
	mov r9,r10
	mov qword rsi,r11
	mov r8,  rsi
	mov r11,r8
	cmp r9,r11
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r9
	mov qword [rsp+8*54],r10
	mov qword [rsp+8*53],r11
	jne L_649
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_650
	
L_649:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_650:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_653
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_654
	
L_653:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	cmp r8,r9
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r10
	jne L_655
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_656
	
L_655:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_656:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_654:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_659
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	mov r11,r9
	add r11,1
	shl r11,4
	add r11,r8
	mov r10, [r11]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r9,r8
	neg r9
	cmp r10,r9
	mov qword [rsp+8*61],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*64],r11
	je L_660
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r11
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r8,  [gbl+8*5]
	mov r11,r8
	mov r9,  [rsp+8*50]
	mov qword [rsp+8*70],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r11
	mov r11, [r10]
	mov r8,  [rsp+8*51]
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r11
	mov r9,  [rsp+8*70]
	mov [r10],r9
	mov r8,  [rsp+8*50]
	mov qword [rsp+8*71],r11
	mov r11,  [gbl+8*22]
	cmp r8,r11
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*73],r9
	mov qword [rsp+8*72],r10
	jne L_661
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_662
	
L_661:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_662:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_663
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_663:
	
L_660:
	
L_659:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov qword [rsp+8*77],r10
	mov r10,1
	mov r9,r11
	sub r9,r10
	mov r10,  [gbl+8*42]
	mov qword [rsp+8*76],r8
	mov r8,2
	mov qword [rsp+8*78],r9
	mov r9,r10
	add r9,r8
	mov r8,r9
	mov r11,  [rsp+8*78]
	mov r9,r11
	mov r11,r9
	mov r10,r8
	mov qword rdi,r9
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov qword [rsp+8*50],r11
	mov qword [rsp+8*51],r10
	mov r10,  [rsp+8*50]
	mov r11,r10
	mov qword rsi,r8
	mov r8,r11
	mov r10,  rsi
	mov r9,r10
	cmp r8,r9
	mov qword rdi,r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r11
	jne L_666
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_667
	
L_666:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_667:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_670
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_671
	
L_670:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	cmp r8,r9
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r10
	jne L_672
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_673
	
L_672:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_673:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_671:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_676
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	mov r11,r9
	add r11,1
	shl r11,4
	add r11,r8
	mov r10, [r11]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r9,r8
	neg r9
	cmp r10,r9
	mov qword [rsp+8*61],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*64],r11
	je L_677
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r11
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r8,  [gbl+8*5]
	mov r11,r8
	mov r9,  [rsp+8*50]
	mov qword [rsp+8*70],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r11
	mov r11, [r10]
	mov r8,  [rsp+8*51]
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r11
	mov r9,  [rsp+8*70]
	mov [r10],r9
	mov r8,  [rsp+8*50]
	mov qword [rsp+8*71],r11
	mov r11,  [gbl+8*22]
	cmp r8,r11
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*73],r9
	mov qword [rsp+8*72],r10
	jne L_678
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_679
	
L_678:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_679:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_680
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_680:
	
L_677:
	
L_676:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov qword [rsp+8*80],r10
	mov r10,1
	mov r9,r11
	add r9,r10
	mov r10,  [gbl+8*42]
	mov qword [rsp+8*76],r8
	mov r8,2
	mov qword [rsp+8*81],r9
	mov r9,r10
	sub r9,r8
	mov r8,r9
	mov r11,  [rsp+8*81]
	mov r9,r11
	mov r11,r9
	mov r10,r8
	mov qword rdi,r9
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov qword [rsp+8*50],r11
	mov qword [rsp+8*51],r10
	mov r10,  [rsp+8*50]
	mov r11,r10
	mov qword rsi,r8
	mov r8,r11
	mov r10,  rsi
	mov r9,r10
	cmp r8,r9
	mov qword rdi,r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r11
	jne L_683
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_684
	
L_683:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_684:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_687
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_688
	
L_687:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	cmp r8,r9
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r10
	jne L_689
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_690
	
L_689:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_690:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_688:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_693
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	mov r11,r9
	add r11,1
	shl r11,4
	add r11,r8
	mov r10, [r11]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r9,r8
	neg r9
	cmp r10,r9
	mov qword [rsp+8*61],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*64],r11
	je L_694
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r11
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r8,  [gbl+8*5]
	mov r11,r8
	mov r9,  [rsp+8*50]
	mov qword [rsp+8*70],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r11
	mov r11, [r10]
	mov r8,  [rsp+8*51]
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r11
	mov r9,  [rsp+8*70]
	mov [r10],r9
	mov r8,  [rsp+8*50]
	mov qword [rsp+8*71],r11
	mov r11,  [gbl+8*22]
	cmp r8,r11
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*73],r9
	mov qword [rsp+8*72],r10
	jne L_695
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_696
	
L_695:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_696:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_697
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_697:
	
L_694:
	
L_693:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov qword [rsp+8*83],r10
	mov r10,1
	mov r9,r11
	add r9,r10
	mov r10,  [gbl+8*42]
	mov qword [rsp+8*76],r8
	mov r8,2
	mov qword [rsp+8*84],r9
	mov r9,r10
	add r9,r8
	mov r8,r9
	mov r11,  [rsp+8*84]
	mov r9,r11
	mov r11,r9
	mov r10,r8
	mov qword rdi,r9
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov qword [rsp+8*50],r11
	mov qword [rsp+8*51],r10
	mov r10,  [rsp+8*50]
	mov r11,r10
	mov qword rsi,r8
	mov r8,r11
	mov r10,  rsi
	mov r9,r10
	cmp r8,r9
	mov qword rdi,r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r11
	jne L_700
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_701
	
L_700:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_701:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_704
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_705
	
L_704:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	cmp r8,r9
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r10
	jne L_706
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_707
	
L_706:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_707:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_705:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_710
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	mov r11,r9
	add r11,1
	shl r11,4
	add r11,r8
	mov r10, [r11]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r9,r8
	neg r9
	cmp r10,r9
	mov qword [rsp+8*61],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*64],r11
	je L_711
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r11
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r8,  [gbl+8*5]
	mov r11,r8
	mov r9,  [rsp+8*50]
	mov qword [rsp+8*70],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r11
	mov r11, [r10]
	mov r8,  [rsp+8*51]
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r11
	mov r9,  [rsp+8*70]
	mov [r10],r9
	mov r8,  [rsp+8*50]
	mov qword [rsp+8*71],r11
	mov r11,  [gbl+8*22]
	cmp r8,r11
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*73],r9
	mov qword [rsp+8*72],r10
	jne L_712
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_713
	
L_712:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_713:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_714
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_714:
	
L_711:
	
L_710:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov qword [rsp+8*86],r10
	mov r10,2
	mov r9,r11
	sub r9,r10
	mov r10,  [gbl+8*42]
	mov qword [rsp+8*76],r8
	mov r8,1
	mov qword [rsp+8*87],r9
	mov r9,r10
	sub r9,r8
	mov r8,r9
	mov r11,  [rsp+8*87]
	mov r9,r11
	mov r11,r9
	mov r10,r8
	mov qword rdi,r9
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov qword [rsp+8*50],r11
	mov qword [rsp+8*51],r10
	mov r10,  [rsp+8*50]
	mov r11,r10
	mov qword rsi,r8
	mov r8,r11
	mov r10,  rsi
	mov r9,r10
	cmp r8,r9
	mov qword rdi,r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r11
	jne L_717
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_718
	
L_717:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_718:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_721
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_722
	
L_721:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	cmp r8,r9
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r10
	jne L_723
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_724
	
L_723:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_724:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_722:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_727
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	mov r11,r9
	add r11,1
	shl r11,4
	add r11,r8
	mov r10, [r11]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r9,r8
	neg r9
	cmp r10,r9
	mov qword [rsp+8*61],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*64],r11
	je L_728
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r11
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r8,  [gbl+8*5]
	mov r11,r8
	mov r9,  [rsp+8*50]
	mov qword [rsp+8*70],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r11
	mov r11, [r10]
	mov r8,  [rsp+8*51]
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r11
	mov r9,  [rsp+8*70]
	mov [r10],r9
	mov r8,  [rsp+8*50]
	mov qword [rsp+8*71],r11
	mov r11,  [gbl+8*22]
	cmp r8,r11
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*73],r9
	mov qword [rsp+8*72],r10
	jne L_729
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_730
	
L_729:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_730:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_731
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_731:
	
L_728:
	
L_727:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov qword [rsp+8*89],r10
	mov r10,2
	mov r9,r11
	sub r9,r10
	mov r10,  [gbl+8*42]
	mov qword [rsp+8*76],r8
	mov r8,1
	mov qword [rsp+8*90],r9
	mov r9,r10
	add r9,r8
	mov r8,r9
	mov r11,  [rsp+8*90]
	mov r9,r11
	mov r11,r9
	mov r10,r8
	mov qword rdi,r9
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov qword [rsp+8*50],r11
	mov qword [rsp+8*51],r10
	mov r10,  [rsp+8*50]
	mov r11,r10
	mov qword rsi,r8
	mov r8,r11
	mov r10,  rsi
	mov r9,r10
	cmp r8,r9
	mov qword rdi,r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r11
	jne L_734
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_735
	
L_734:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_735:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_738
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_739
	
L_738:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	cmp r8,r9
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r10
	jne L_740
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_741
	
L_740:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_741:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_739:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_744
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	mov r11,r9
	add r11,1
	shl r11,4
	add r11,r8
	mov r10, [r11]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r9,r8
	neg r9
	cmp r10,r9
	mov qword [rsp+8*61],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*64],r11
	je L_745
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r11
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r8,  [gbl+8*5]
	mov r11,r8
	mov r9,  [rsp+8*50]
	mov qword [rsp+8*70],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r11
	mov r11, [r10]
	mov r8,  [rsp+8*51]
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r11
	mov r9,  [rsp+8*70]
	mov [r10],r9
	mov r8,  [rsp+8*50]
	mov qword [rsp+8*71],r11
	mov r11,  [gbl+8*22]
	cmp r8,r11
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*73],r9
	mov qword [rsp+8*72],r10
	jne L_746
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_747
	
L_746:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_747:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_748
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_748:
	
L_745:
	
L_744:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov qword [rsp+8*92],r10
	mov r10,2
	mov r9,r11
	add r9,r10
	mov r10,  [gbl+8*42]
	mov qword [rsp+8*76],r8
	mov r8,1
	mov qword [rsp+8*93],r9
	mov r9,r10
	sub r9,r8
	mov r8,r9
	mov r11,  [rsp+8*93]
	mov r9,r11
	mov r11,r9
	mov r10,r8
	mov qword rdi,r9
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov qword [rsp+8*50],r11
	mov qword [rsp+8*51],r10
	mov r10,  [rsp+8*50]
	mov r11,r10
	mov qword rsi,r8
	mov r8,r11
	mov r10,  rsi
	mov r9,r10
	cmp r8,r9
	mov qword rdi,r11
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r11
	jne L_751
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_752
	
L_751:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_752:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_755
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_756
	
L_755:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	cmp r8,r9
	mov qword rdi,r10
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*54],r10
	jne L_757
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_758
	
L_757:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_758:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_756:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_761
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	mov r11,r9
	add r11,1
	shl r11,4
	add r11,r8
	mov r10, [r11]
	mov qword [rsp+8*60],r8
	mov r8,1
	mov r9,r8
	neg r9
	cmp r10,r9
	mov qword [rsp+8*61],r11
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*64],r11
	je L_762
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r11
	mov r9,  [rsp+8*50]
	mov [r10],r9
	mov qword [gbl+8*31],r8
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*38]
	mov r8,r11
	mov r9,  [gbl+8*31]
	mov qword [rsp+8*67],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r11,  [rsp+8*51]
	mov [r10],r11
	mov qword [rsp+8*68],r8
	mov r8,  [gbl+8*46]
	mov r9,1
	mov qword [rsp+8*69],r10
	mov r10,r8
	add r10,r9
	mov r8,  [gbl+8*5]
	mov r11,r8
	mov r9,  [rsp+8*50]
	mov qword [rsp+8*70],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r11
	mov r11, [r10]
	mov r8,  [rsp+8*51]
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r11
	mov r9,  [rsp+8*70]
	mov [r10],r9
	mov r8,  [rsp+8*50]
	mov qword [rsp+8*71],r11
	mov r11,  [gbl+8*22]
	cmp r8,r11
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*73],r9
	mov qword [rsp+8*72],r10
	jne L_763
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_764
	
L_763:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_764:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_765
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_765:
	
L_762:
	
L_761:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov qword [rsp+8*95],r10
	mov r10,2
	mov r9,r11
	add r9,r10
	mov r10,  [gbl+8*42]
	mov r11,1
	mov qword [rsp+8*76],r8
	mov r8,r10
	add r8,r11
	mov r10,r8
	mov r8,r9
	mov r9,r8
	mov r11,r10
	mov qword rdi,r8
	mov r8,  [gbl+8*19]
	mov r10,r8
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*51],r11
	mov r11,  [rsp+8*50]
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	cmp r8,r10
	mov qword rdi,r9
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*54],r9
	mov qword [rsp+8*53],r10
	jne L_768
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_769
	
L_768:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_769:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_772
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_773
	
L_772:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r9,r10
	mov qword rsi,r8
	mov r11,  rsi
	mov r8,r11
	cmp r9,r8
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*53],r8
	mov qword [rsp+8*52],r9
	mov qword rdi,r10
	mov qword [rsp+8*54],r11
	jne L_774
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_775
	
L_774:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_775:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_773:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_778
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r9,  [rsp+8*51]
	mov r11,r9
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*60],r8
	mov r8, [r11]
	mov qword [rsp+8*61],r11
	mov r11,1
	mov r10,r11
	neg r10
	cmp r8,r10
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*62],r8
	mov qword [rsp+8*63],r10
	mov qword [rsp+8*64],r11
	je L_779
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r9,  [gbl+8*33]
	mov r11,r9
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r11
	mov qword [rsp+8*66],r11
	mov r11,  [rsp+8*50]
	mov [r10],r11
	mov qword [rsp+8*67],r10
	mov r9,  [gbl+8*38]
	mov r10,r9
	mov r11,r8
	add r11,1
	shl r11,4
	add r11,r10
	mov qword [gbl+8*31],r8
	mov r8,  [rsp+8*51]
	mov [r11],r8
	mov qword [rsp+8*68],r10
	mov r10,  [gbl+8*46]
	mov qword [rsp+8*69],r11
	mov r11,1
	mov r9,r10
	add r9,r11
	mov r11,  [gbl+8*5]
	mov r10,r11
	mov r8,  [rsp+8*50]
	mov qword [rsp+8*70],r9
	mov r9,r8
	add r9,1
	shl r9,4
	add r9,r10
	mov r10, [r9]
	mov r11,  [rsp+8*51]
	mov r9,r11
	add r9,1
	shl r9,4
	add r9,r10
	mov qword [rsp+8*71],r10
	mov r10,  [rsp+8*70]
	mov [r9],r10
	mov qword [rsp+8*72],r9
	mov r9,  [gbl+8*22]
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*73],r10
	jne L_780
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_781
	
L_780:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_781:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_782
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_782:
	
L_779:
	
L_778:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*75]
	mov qword [rsp+8*76],r8
	mov r8,1
	cmp r11,r8
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*99],r9
	mov qword [rsp+8*98],r10
	je L_601
	jmp L_599
	
L_601:
	mov r8,  [gbl+8*30]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov qword [gbl+8*30],r8
	mov qword [rsp+8*100],r10
	jmp L_598
	
L_599:
	mov r8,  [gbl+8*75]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*101],r10
	je L_602
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*22]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r9,  [gbl+8*21]
	mov r11,r9
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*102],r8
	mov r8, [r11]
	mov r9,r8
	mov qword [rsp+8*104],r8
	mov r8,r9
	mov qword [rsp+8*105],r8
	mov qword rdi,r9
	mov qword [rsp+8*103],r11
	mov     rdi, [rsp+8*105]
	call    toString
	mov     qword[rsp+8*106], rax
	mov r9,  [rsp+8*106]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*107],r10
	mov rdi,[rsp+8*107] 
	add rdi, 1 
	call puts
	jmp L_603
	
L_602:
	mov r9,t211
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*108],r10
	mov rdi,[rsp+8*108] 
	add rdi, 1 
	call puts
	
L_603:
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 952
	mov     rdi, 12000
	call    mallocArray
	mov     qword [gbl+8*109], rax
	mov r9,  [gbl+8*109]
	mov r8,r9
	mov qword [gbl+8*33],r8
	mov     rdi, 12000
	call    mallocArray
	mov     qword [gbl+8*110], rax
	mov r9,  [gbl+8*110]
	mov r8,r9
	mov qword [gbl+8*38],r8
	mov r8,  [rsp+8*111]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   2936
buff.1788:
        resb    256
arg:
        resb    1024

trsp:         resb   1024
	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	
GS_31:
	db 25H, 6CH, 64H, 00H
	
GS_32:
	db 25H, 73H, 00H
	
t211:
	 db 12,"no solution!" ,0


