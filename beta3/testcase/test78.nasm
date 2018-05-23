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
	sub    rsp, 968
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 2952
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	call global_init
	mov r8 , rax
	mov r10,110
	mov r9,r10
	mov qword [rsp+8*1],r8
	mov qword rdi,r9
	call origin
	mov r8 , rax
	mov r10,0
	mov r9,r10
	mov r12,99
	mov r11,r12
	mov r14,100
	mov r13,r14
	mov qword [rsp+8*3],r8
	mov r8,0
	mov r15,r8
	mov r8,r13
	mov qword [rsp+8*4],r9
	mov r9,r11
	mov qword rsi,r8
	mov qword rdi,r9
	mov qword [rsp+8*5],r11
	mov qword [rsp+8*6],r13
	mov qword [rsp+8*7],r15
	call build
	mov r8 , rax
	mov qword [rsp+8*9],r8
	
L_597:
	mov r9,  [rsp+8*7]
	mov r8,r9
	mov r11,  [rsp+8*5]
	mov r10,r11
	mov r13,  [rsp+8*6]
	mov r12,r13
	mov qword [arg+8*2],r8
	mov qword rsi,r10
	mov qword rdi,r12
	call find
	mov r8 , rax
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*11],r8
	mov qword [rsp+8*12],r10
	mov r8,  [rsp+8*12]
	cmp r8, 0
	je L_598
	mov r9,  [rsp+8*6]
	mov r8,r9
	mov qword rdi,r8
	call improve
	mov r8 , rax
	mov qword [rsp+8*13],r8
	jmp L_597
	
L_598:
	mov r9,  [gbl+8*14]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*15],r10
	mov     rdi, [rsp+8*15]
	call    toString
	mov     qword[rsp+8*16], rax
	mov r9,  [rsp+8*16]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*17],r10
	mov rdi,[rsp+8*17] 
	add rdi, 1 
	call puts
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	jmp QED
	
origin:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 968
	mov r9,  rdi
	mov r8,r9
	mov qword [rsp+8*18],r8
	mov     rdi, [rsp+8*18]
	call    mallocArray
	mov     qword [rsp+8*19], rax
	mov r9,  [rsp+8*19]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [gbl+8*20],r8
	mov qword [gbl+8*21],r10
	
L_561:
	mov r8,  [gbl+8*21]
	mov r9,  [rsp+8*18]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*22],r10
	mov r8,  [rsp+8*22]
	cmp r8, 0
	je L_562
	mov     rdi, [rsp+8*18]
	call    mallocArray
	mov     qword [rsp+8*23], rax
	mov r9,  [gbl+8*20]
	mov r8,r9
	mov r10,  [gbl+8*21]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,  [rsp+8*23]
	mov [r11],r12
	mov r14,0
	mov r13,r14
	mov qword [rsp+8*24],r8
	mov qword [rsp+8*25],r11
	mov qword [gbl+8*26],r13
	
L_564:
	mov r8,  [gbl+8*26]
	mov r9,  [rsp+8*18]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*27],r10
	mov r8,  [rsp+8*27]
	cmp r8, 0
	je L_565
	mov r9,  [gbl+8*20]
	mov r8,r9
	mov r10,  [gbl+8*21]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [gbl+8*26]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13,0
	mov [r11],r13
	mov qword [rsp+8*28],r8
	mov qword [rsp+8*29],r11
	
L_566:
	mov r9,  [gbl+8*26]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*30],r8
	mov qword [gbl+8*26],r9
	jmp L_564
	
L_565:
	
L_563:
	mov r9,  [gbl+8*21]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*31],r8
	mov qword [gbl+8*21],r9
	jmp L_561
	
L_562:
	mov r8,0
	mov rax,r8
	leave
	ret
	
build:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 968
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov r13,1
	mov r12,r13
	mov qword [rsp+8*32],r8
	mov qword [rsp+8*33],r10
	mov qword [gbl+8*21],r12
	
L_567:
	mov r8,  [gbl+8*21]
	mov r9,49
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*34],r10
	mov r8,  [rsp+8*34]
	cmp r8, 0
	je L_568
	mov r9,50
	mov r8,r9
	mov qword [gbl+8*26],r8
	
L_570:
	mov r8,98
	mov r9,  [gbl+8*21]
	mov r10,r8
	sub r10,r9
	mov r11,1
	mov r10,r10
	add r10,r11
	mov r12,  [gbl+8*26]
	cmp r12,r10
	mov r13, 0
	setle r13B
	mov qword [rsp+8*35],r10
	mov qword [rsp+8*36],r13
	mov r8,  [rsp+8*36]
	cmp r8, 0
	je L_571
	mov r9,  [gbl+8*20]
	mov r8,r9
	mov r10,  [gbl+8*21]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [gbl+8*26]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13,1
	mov [r11],r13
	mov qword [rsp+8*37],r8
	mov qword [rsp+8*38],r11
	
L_572:
	mov r9,  [gbl+8*26]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*39],r8
	mov qword [gbl+8*26],r9
	jmp L_570
	
L_571:
	
L_569:
	mov r9,  [gbl+8*21]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*40],r8
	mov qword [gbl+8*21],r9
	jmp L_567
	
L_568:
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*21],r8
	
L_573:
	mov r8,  [gbl+8*21]
	mov r9,49
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*41],r10
	mov r8,  [rsp+8*41]
	cmp r8, 0
	je L_574
	mov r9,  [gbl+8*20]
	mov r8,r9
	mov r10,  [rsp+8*32]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [gbl+8*21]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13,1
	mov [r11],r13
	mov qword [rsp+8*42],r8
	mov qword [rsp+8*43],r11
	
L_575:
	mov r9,  [gbl+8*21]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*44],r8
	mov qword [gbl+8*21],r9
	jmp L_573
	
L_574:
	mov r9,50
	mov r8,r9
	mov qword [gbl+8*21],r8
	
L_576:
	mov r8,  [gbl+8*21]
	mov r9,98
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*45],r10
	mov r8,  [rsp+8*45]
	cmp r8, 0
	je L_577
	mov r9,  [gbl+8*20]
	mov r8,r9
	mov r10,  [gbl+8*21]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*33]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13,1
	mov [r11],r13
	mov qword [rsp+8*46],r8
	mov qword [rsp+8*47],r11
	
L_578:
	mov r9,  [gbl+8*21]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*48],r8
	mov qword [gbl+8*21],r9
	jmp L_576
	
L_577:
	mov r8,0
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
find:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 968
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov r13,  [arg+8*2]
	mov r12,r13
	mov r15,0
	mov r14,r15
	mov r13,1
	mov r11,r13
	mov r15,1
	mov r13,r15
	mov qword [rsp+8*49],r8
	mov qword [rsp+8*50],r10
	mov qword [gbl+8*53],r11
	mov qword [rsp+8*51],r12
	mov qword [gbl+8*21],r13
	mov qword [gbl+8*52],r14
	
L_579:
	mov r8,  [gbl+8*21]
	mov r9,  [rsp+8*49]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*54],r10
	mov r8,  [rsp+8*54]
	cmp r8, 0
	je L_580
	mov r9,  [gbl+8*55]
	mov r8,r9
	mov r10,  [gbl+8*21]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,0
	mov [r11],r12
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r11
	
L_581:
	mov r9,  [gbl+8*21]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*58],r8
	mov qword [gbl+8*21],r9
	jmp L_579
	
L_580:
	mov r9,  [gbl+8*59]
	mov r8,r9
	mov r10,1
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,  [rsp+8*50]
	mov [r11],r12
	mov r14,  [gbl+8*55]
	mov r13,r14
	mov r15,r12
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*60],r8
	mov r8,1
	mov [r15],r8
	mov r10,  [gbl+8*64]
	mov r8,r10
	mov qword [rsp+8*61],r11
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*65],r8
	mov r8,0
	mov [r11],r8
	mov qword [rsp+8*66],r11
	mov r11,0
	mov r8,r11
	mov qword [rsp+8*51],r8
	mov qword [rsp+8*62],r13
	mov qword [rsp+8*63],r15
	
L_582:
	mov r8,  [gbl+8*52]
	mov r9,  [gbl+8*53]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*67],r10
	mov r8,  [rsp+8*67]
	cmp r8, 0
	jne L_584
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*68],r8
	jmp L_585
	
L_584:
	mov r8,  [rsp+8*51]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*69],r10
	mov r9,  [rsp+8*69]
	mov r8,r9
	mov qword [rsp+8*68],r8
	
L_585:
	mov r8,  [rsp+8*68]
	cmp r8, 0
	je L_583
	mov r9,  [gbl+8*52]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov r12,  [gbl+8*59]
	mov r11,r12
	mov r13,r9
	add r13,1
	shl r13,4
	add r13,r11
	mov r14, [r13]
	mov r15,r14
	mov qword [rsp+8*70],r8
	mov qword [gbl+8*52],r9
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*26],r8
	mov qword [rsp+8*71],r11
	mov qword [rsp+8*72],r13
	mov qword [rsp+8*73],r14
	mov qword [gbl+8*21],r15
	
L_586:
	mov r8,  [gbl+8*26]
	mov r9,  [rsp+8*49]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*74],r10
	mov r8,  [rsp+8*74]
	cmp r8, 0
	je L_587
	mov r9,  [gbl+8*20]
	mov r8,r9
	mov r10,  [gbl+8*21]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [gbl+8*26]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov r14,0
	cmp r13,r14
	mov r15, 0
	setg r15B
	mov qword [rsp+8*75],r8
	mov qword [rsp+8*76],r11
	mov qword [rsp+8*77],r13
	mov qword [rsp+8*78],r15
	mov r8,  [rsp+8*78]
	cmp r8, 0
	jne L_589
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*79],r8
	jmp L_590
	
L_589:
	mov r9,  [gbl+8*55]
	mov r8,r9
	mov r10,  [gbl+8*26]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,0
	cmp r12,r13
	mov r14, 0
	sete r14B
	mov qword [rsp+8*80],r8
	mov qword [rsp+8*81],r11
	mov qword [rsp+8*82],r12
	mov qword [rsp+8*83],r14
	mov r9,  [rsp+8*83]
	mov r8,r9
	mov qword [rsp+8*79],r8
	
L_590:
	mov r8,  [rsp+8*79]
	cmp r8, 0
	je L_592
	mov r9,  [gbl+8*55]
	mov r8,r9
	mov r10,  [gbl+8*26]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,1
	mov [r11],r12
	mov r14,  [gbl+8*53]
	mov r13,r14
	mov r15,1
	mov r14,r14
	add r14,r15
	mov qword [rsp+8*84],r8
	mov qword [rsp+8*85],r11
	mov r11,  [gbl+8*59]
	mov r8,r11
	mov r12,r14
	add r12,1
	shl r12,4
	add r12,r8
	mov [r12],r10
	mov qword [rsp+8*87],r8
	mov qword [rsp+8*88],r12
	mov r12,  [gbl+8*64]
	mov r8,r12
	mov qword [rsp+8*86],r13
	mov r13,r10
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*89],r8
	mov r8,  [gbl+8*21]
	mov [r13],r8
	mov qword [rsp+8*90],r13
	mov r13,  [rsp+8*49]
	cmp r14,r13
	mov r15, 0
	sete r15B
	mov qword [gbl+8*53],r14
	mov qword [rsp+8*91],r15
	mov r8,  [rsp+8*91]
	cmp r8, 0
	je L_594
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*51],r8
	
L_594:
	
L_592:
	
L_588:
	mov r9,  [gbl+8*26]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*92],r8
	mov qword [gbl+8*26],r9
	jmp L_586
	
L_587:
	jmp L_582
	
L_583:
	mov r8,  [rsp+8*51]
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
improve:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 968
	mov r9,  rdi
	mov r8,r9
	mov r10,r8
	mov r12,  [gbl+8*14]
	mov r11,r12
	mov r13,1
	mov r12,r12
	add r12,r13
	mov qword [rsp+8*93],r8
	mov qword [gbl+8*21],r10
	mov qword [rsp+8*94],r11
	mov qword [gbl+8*14],r12
	
L_595:
	mov r9,  [gbl+8*64]
	mov r8,r9
	mov r10,  [gbl+8*21]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,0
	cmp r12,r13
	mov r14, 0
	setg r14B
	mov qword [rsp+8*95],r8
	mov qword [rsp+8*96],r11
	mov qword [rsp+8*97],r12
	mov qword [rsp+8*98],r14
	mov r8,  [rsp+8*98]
	cmp r8, 0
	je L_596
	mov r9,  [gbl+8*64]
	mov r8,r9
	mov r10,  [gbl+8*21]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov r15,  [gbl+8*20]
	mov r14,r15
	mov qword [rsp+8*99],r8
	mov r8,r13
	add r8,1
	shl r8,4
	add r8,r14
	mov r14, [r8]
	mov r8,r10
	add r8,1
	shl r8,4
	add r8,r14
	mov qword [rsp+8*100],r11
	mov r11, [r8]
	mov qword [rsp+8*101],r12
	mov r12,r11
	mov qword [rsp+8*105],r12
	mov r12,1
	mov r11,r11
	sub r11,r12
	mov [r8],r11
	mov qword [rsp+8*103],r8
	mov r8,r15
	mov qword [rsp+8*104],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r11,r13
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*106],r8
	mov r8, [r11]
	mov r12,r8
	mov qword [rsp+8*109],r12
	mov r12,1
	mov r8,r8
	add r8,r12
	mov [r11],r8
	mov r10,r13
	mov qword [rsp+8*108],r8
	mov qword [gbl+8*21],r10
	mov qword [rsp+8*107],r11
	mov qword [gbl+8*26],r13
	mov qword [rsp+8*102],r14
	jmp L_595
	
L_596:
	mov r8,0
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 968
	mov r9,0
	mov r8,r9
	mov qword [gbl+8*14],r8
	mov     rdi, 110
	call    mallocArray
	mov     qword [gbl+8*110], rax
	mov r9,  [gbl+8*110]
	mov r8,r9
	mov qword [gbl+8*55],r8
	mov     rdi, 110
	call    mallocArray
	mov     qword [gbl+8*111], rax
	mov r9,  [gbl+8*111]
	mov r8,r9
	mov qword [gbl+8*64],r8
	mov     rdi, 110
	call    mallocArray
	mov     qword [gbl+8*112], rax
	mov r9,  [gbl+8*112]
	mov r8,r9
	mov qword [gbl+8*59],r8
	mov r8,  [rsp+8*113]
	mov rax,r8
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   2952
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
	

