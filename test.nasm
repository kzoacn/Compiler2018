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
        mov     rax, qword [rbp-28H]
        mov     qword [rbp-10H], rax
        mov     qword [rbp-8H], 1
        jmp     mAd_006

mAd_005:  mov     rax, qword [rbp-8H]
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
mAd_006:  mov     rax, qword [rbp-8H]
        cmp     rax, qword [rbp-18H]
        jl      mAd_005
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
        leave
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
	sub    rsp, 1168
	call global_init
	mov [rsp+8*1] , rax
	call    getString
	mov     [rsp+8*2], rax
	mov r8, [rsp+8*2]
	mov qword [arg+8*15] ,r8
	call    parseInt
	mov     qword [rsp+8*4], rax
	mov r8, [rsp+8*4]
	mov qword [rsp+8*2] ,r8
	mov r8, [rsp+8*2]
	mov qword [gbl+8*5] ,r8
	mov     rdi, [gbl+8*5]
	call    mallocArray
	mov     qword [rsp+8*6], rax
	mov r8, [rsp+8*6]
	mov qword [gbl+8*7] ,r8
	mov qword [rsp+8*8] ,0
	
L_19:
	mov r8, [gbl+8*7]
	mov qword [rsp+8*9] ,r8
	mov r8, [rsp+8*9]
	mov qword [arg+8*15] ,r8
	mov r8, [arg+8*15]
	mov qword [rsp+8*10] ,r8
	mov r8, [rsp+8*10]
	mov r8, [r8]
	mov [rsp+8*10], r8
	mov r8, [rsp+8*8]
	mov r9, [rsp+8*10]
	cmp r8, r9
	mov qword [rsp+8*11], 0
	setl [rsp+8*11]
	mov r8, [rsp+8*11]
	cmp r8, 0
	je L_20
	mov r8, [gbl+8*7]
	mov qword [rsp+8*12] ,r8
	mov     rsi, [rsp+8*8]
	mov     rdi, [rsp+8*12]
	call    address
	mov [rsp+8*13], rax
	mov r8, [rsp+8*8]
	mov r9, [rsp+8*13]
	mov qword [r9], r8
	
L_21:
	mov r8, [rsp+8*8]
	add r8, 1
	mov qword [rsp+8*14],r8 
	mov r8, [rsp+8*14]
	mov qword [rsp+8*8] ,r8
	jmp L_19
	
L_20:
	call makeHeap
	mov [rsp+8*15] , rax
	call heapSort
	mov [rsp+8*16] , rax
	mov qword [rsp+8*8] ,0
	
L_22:
	mov r8, [gbl+8*7]
	mov qword [rsp+8*17] ,r8
	mov r8, [rsp+8*17]
	mov qword [arg+8*15] ,r8
	mov r8, [arg+8*15]
	mov qword [rsp+8*18] ,r8
	mov r8, [rsp+8*18]
	mov r8, [r8]
	mov [rsp+8*18], r8
	mov r8, [rsp+8*8]
	mov r9, [rsp+8*18]
	cmp r8, r9
	mov qword [rsp+8*19], 0
	setl [rsp+8*19]
	mov r8, [rsp+8*19]
	cmp r8, 0
	je L_23
	mov r8, [gbl+8*7]
	mov qword [rsp+8*20] ,r8
	mov     rsi, [rsp+8*8]
	mov     rdi, [rsp+8*20]
	call    address
	mov [rsp+8*21], rax
	mov r8, [rsp+8*21]
	mov r8, [r8]
	mov [rsp+8*22], r8
	mov r8, [rsp+8*22]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*24] ,r8
	mov     rdi, [rsp+8*24]
	call    toString
	mov     qword[rsp+8*25], rax
	mov     rsi, t195
	mov     rdi, [rsp+8*25]
	call    concat
	mov [rsp+8*26], rax
	mov r8, [rsp+8*26]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*27] ,r8
	mov rdi, format
	mov rsi,[rsp+8*27] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_24:
	mov r8, [rsp+8*8]
	add r8, 1
	mov qword [rsp+8*28],r8 
	mov r8, [rsp+8*28]
	mov qword [rsp+8*8] ,r8
	jmp L_22
	
L_23:
	mov qword [arg+8*0] ,t200
	mov r8, [arg+8*0]
	mov qword [rsp+8*29] ,r8
	mov rdi, format
	mov rsi,[rsp+8*29] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov rax,0
	leave
	ret
	mov rax,0
	leave
	ret
	jmp QED
	
exchange:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1168
	mov r8, [arg+8*0]
	mov qword [rsp+8*30] ,r8
	mov r8, [arg+8*1]
	mov qword [rsp+8*32] ,r8
	mov r8, [gbl+8*7]
	mov qword [rsp+8*33] ,r8
	mov     rsi, [rsp+8*30]
	mov     rdi, [rsp+8*33]
	call    address
	mov [rsp+8*34], rax
	mov r8, [rsp+8*34]
	mov r8, [r8]
	mov [rsp+8*35], r8
	mov r8, [rsp+8*35]
	mov qword [rsp+8*36] ,r8
	mov r8, [gbl+8*7]
	mov qword [rsp+8*37] ,r8
	mov     rsi, [rsp+8*32]
	mov     rdi, [rsp+8*37]
	call    address
	mov [rsp+8*38], rax
	mov r8, [rsp+8*38]
	mov r8, [r8]
	mov [rsp+8*39], r8
	mov r8, [gbl+8*7]
	mov qword [rsp+8*40] ,r8
	mov     rsi, [rsp+8*30]
	mov     rdi, [rsp+8*40]
	call    address
	mov [rsp+8*41], rax
	mov r8, [rsp+8*39]
	mov r9, [rsp+8*41]
	mov qword [r9], r8
	mov r8, [gbl+8*7]
	mov qword [rsp+8*42] ,r8
	mov     rsi, [rsp+8*32]
	mov     rdi, [rsp+8*42]
	call    address
	mov [rsp+8*43], rax
	mov r8, [rsp+8*36]
	mov r9, [rsp+8*43]
	mov qword [r9], r8
	mov rax,0
	leave
	ret
	
makeHeap:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1168
	mov r8, [gbl+8*5]
	sub r8, 1
	mov qword [rsp+8*44],r8 
	xor rdx, rdx
	mov rax, [rsp+8*44]
	mov rbx, 2
	cdq
	idiv rbx
	mov [rsp+8*45], rax
	mov r8, [rsp+8*45]
	mov qword [rsp+8*46] ,r8
	mov qword [rsp+8*47] ,0
	mov qword [rsp+8*48] ,0
	
L_0:
	mov r8, [rsp+8*46]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*49], 0
	setge [rsp+8*49]
	mov r8, [rsp+8*49]
	cmp r8, 0
	je L_1
	mov r8, [rsp+8*46]
	imul r8, 2
	mov qword [rsp+8*50],r8 
	mov r8, [rsp+8*50]
	mov qword [rsp+8*48] ,r8
	mov r8, [rsp+8*46]
	imul r8, 2
	mov qword [rsp+8*51],r8 
	mov r8, [rsp+8*51]
	add r8, 1
	mov qword [rsp+8*52],r8 
	mov r8, [rsp+8*52]
	mov r9, [gbl+8*5]
	cmp r8, r9
	mov qword [rsp+8*53], 0
	setl [rsp+8*53]
	mov r8, [rsp+8*53]
	cmp r8, 0
	jne L_2
	mov qword [rsp+8*54] ,0
	jmp L_3
	
L_2:
	mov r8, [rsp+8*46]
	imul r8, 2
	mov qword [rsp+8*55],r8 
	mov r8, [rsp+8*55]
	add r8, 1
	mov qword [rsp+8*56],r8 
	mov r8, [gbl+8*7]
	mov qword [rsp+8*57] ,r8
	mov     rsi, [rsp+8*56]
	mov     rdi, [rsp+8*57]
	call    address
	mov [rsp+8*58], rax
	mov r8, [rsp+8*58]
	mov r8, [r8]
	mov [rsp+8*59], r8
	mov r8, [rsp+8*46]
	imul r8, 2
	mov qword [rsp+8*60],r8 
	mov r8, [gbl+8*7]
	mov qword [rsp+8*61] ,r8
	mov     rsi, [rsp+8*60]
	mov     rdi, [rsp+8*61]
	call    address
	mov [rsp+8*62], rax
	mov r8, [rsp+8*62]
	mov r8, [r8]
	mov [rsp+8*63], r8
	mov r8, [rsp+8*59]
	mov r9, [rsp+8*63]
	cmp r8, r9
	mov qword [rsp+8*64], 0
	setl [rsp+8*64]
	mov r8, [rsp+8*64]
	mov qword [rsp+8*54] ,r8
	
L_3:
	mov r8, [rsp+8*54]
	cmp r8, 0
	je L_5
	mov r8, [rsp+8*46]
	imul r8, 2
	mov qword [rsp+8*65],r8 
	mov r8, [rsp+8*65]
	add r8, 1
	mov qword [rsp+8*66],r8 
	mov r8, [rsp+8*66]
	mov qword [rsp+8*48] ,r8
	
L_5:
	mov r8, [gbl+8*7]
	mov qword [rsp+8*67] ,r8
	mov     rsi, [rsp+8*46]
	mov     rdi, [rsp+8*67]
	call    address
	mov [rsp+8*68], rax
	mov r8, [rsp+8*68]
	mov r8, [r8]
	mov [rsp+8*69], r8
	mov r8, [gbl+8*7]
	mov qword [rsp+8*70] ,r8
	mov     rsi, [rsp+8*48]
	mov     rdi, [rsp+8*70]
	call    address
	mov [rsp+8*71], rax
	mov r8, [rsp+8*71]
	mov r8, [r8]
	mov [rsp+8*72], r8
	mov r8, [rsp+8*69]
	mov r9, [rsp+8*72]
	cmp r8, r9
	mov qword [rsp+8*73], 0
	setg [rsp+8*73]
	mov r8, [rsp+8*73]
	cmp r8, 0
	je L_7
	mov r8, [rsp+8*48]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*46]
	mov qword [arg+8*0] ,r8
	call exchange
	mov [rsp+8*74] , rax
	
L_7:
	mov r8, [rsp+8*46]
	sub r8, 1
	mov qword [rsp+8*75],r8 
	mov r8, [rsp+8*75]
	mov qword [rsp+8*46] ,r8
	jmp L_0
	
L_1:
	mov rax,0
	leave
	ret
	mov rax,0
	leave
	ret
	
adjustHeap:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1168
	mov r8, [arg+8*0]
	mov qword [rsp+8*76] ,r8
	mov qword [rsp+8*77] ,0
	mov qword [rsp+8*78] ,0
	mov qword [rsp+8*79] ,0
	
L_8:
	mov r8, [rsp+8*77]
	imul r8, 2
	mov qword [rsp+8*80],r8 
	mov r8, [rsp+8*80]
	mov r9, [rsp+8*76]
	cmp r8, r9
	mov qword [rsp+8*81], 0
	setl [rsp+8*81]
	mov r8, [rsp+8*81]
	cmp r8, 0
	je L_9
	mov r8, [rsp+8*77]
	imul r8, 2
	mov qword [rsp+8*82],r8 
	mov r8, [rsp+8*82]
	mov qword [rsp+8*78] ,r8
	mov r8, [rsp+8*77]
	imul r8, 2
	mov qword [rsp+8*83],r8 
	mov r8, [rsp+8*83]
	add r8, 1
	mov qword [rsp+8*84],r8 
	mov r8, [rsp+8*84]
	mov r9, [rsp+8*76]
	cmp r8, r9
	mov qword [rsp+8*85], 0
	setl [rsp+8*85]
	mov r8, [rsp+8*85]
	cmp r8, 0
	jne L_10
	mov qword [rsp+8*86] ,0
	jmp L_11
	
L_10:
	mov r8, [rsp+8*77]
	imul r8, 2
	mov qword [rsp+8*87],r8 
	mov r8, [rsp+8*87]
	add r8, 1
	mov qword [rsp+8*88],r8 
	mov r8, [gbl+8*7]
	mov qword [rsp+8*89] ,r8
	mov     rsi, [rsp+8*88]
	mov     rdi, [rsp+8*89]
	call    address
	mov [rsp+8*90], rax
	mov r8, [rsp+8*90]
	mov r8, [r8]
	mov [rsp+8*91], r8
	mov r8, [rsp+8*77]
	imul r8, 2
	mov qword [rsp+8*92],r8 
	mov r8, [gbl+8*7]
	mov qword [rsp+8*93] ,r8
	mov     rsi, [rsp+8*92]
	mov     rdi, [rsp+8*93]
	call    address
	mov [rsp+8*94], rax
	mov r8, [rsp+8*94]
	mov r8, [r8]
	mov [rsp+8*95], r8
	mov r8, [rsp+8*91]
	mov r9, [rsp+8*95]
	cmp r8, r9
	mov qword [rsp+8*96], 0
	setl [rsp+8*96]
	mov r8, [rsp+8*96]
	mov qword [rsp+8*86] ,r8
	
L_11:
	mov r8, [rsp+8*86]
	cmp r8, 0
	je L_13
	mov r8, [rsp+8*77]
	imul r8, 2
	mov qword [rsp+8*97],r8 
	mov r8, [rsp+8*97]
	add r8, 1
	mov qword [rsp+8*98],r8 
	mov r8, [rsp+8*98]
	mov qword [rsp+8*78] ,r8
	
L_13:
	mov r8, [gbl+8*7]
	mov qword [rsp+8*99] ,r8
	mov     rsi, [rsp+8*77]
	mov     rdi, [rsp+8*99]
	call    address
	mov [rsp+8*100], rax
	mov r8, [rsp+8*100]
	mov r8, [r8]
	mov [rsp+8*101], r8
	mov r8, [gbl+8*7]
	mov qword [rsp+8*102] ,r8
	mov     rsi, [rsp+8*78]
	mov     rdi, [rsp+8*102]
	call    address
	mov [rsp+8*103], rax
	mov r8, [rsp+8*103]
	mov r8, [r8]
	mov [rsp+8*104], r8
	mov r8, [rsp+8*101]
	mov r9, [rsp+8*104]
	cmp r8, r9
	mov qword [rsp+8*105], 0
	setg [rsp+8*105]
	mov r8, [rsp+8*105]
	cmp r8, 0
	je L_14
	mov r8, [gbl+8*7]
	mov qword [rsp+8*106] ,r8
	mov     rsi, [rsp+8*77]
	mov     rdi, [rsp+8*106]
	call    address
	mov [rsp+8*107], rax
	mov r8, [rsp+8*107]
	mov r8, [r8]
	mov [rsp+8*108], r8
	mov r8, [rsp+8*108]
	mov qword [rsp+8*109] ,r8
	mov r8, [gbl+8*7]
	mov qword [rsp+8*110] ,r8
	mov     rsi, [rsp+8*78]
	mov     rdi, [rsp+8*110]
	call    address
	mov [rsp+8*111], rax
	mov r8, [rsp+8*111]
	mov r8, [r8]
	mov [rsp+8*112], r8
	mov r8, [gbl+8*7]
	mov qword [rsp+8*113] ,r8
	mov     rsi, [rsp+8*77]
	mov     rdi, [rsp+8*113]
	call    address
	mov [rsp+8*114], rax
	mov r8, [rsp+8*112]
	mov r9, [rsp+8*114]
	mov qword [r9], r8
	mov r8, [gbl+8*7]
	mov qword [rsp+8*115] ,r8
	mov     rsi, [rsp+8*78]
	mov     rdi, [rsp+8*115]
	call    address
	mov [rsp+8*116], rax
	mov r8, [rsp+8*109]
	mov r9, [rsp+8*116]
	mov qword [r9], r8
	mov r8, [rsp+8*78]
	mov qword [rsp+8*77] ,r8
	jmp L_15
	
L_14:
	jmp L_9
	
L_15:
	jmp L_8
	
L_9:
	mov rax,0
	leave
	ret
	mov rax,0
	leave
	ret
	
heapSort:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1168
	mov qword [rsp+8*117] ,0
	mov qword [rsp+8*118] ,0
	
L_16:
	mov r8, [rsp+8*118]
	mov r9, [gbl+8*5]
	cmp r8, r9
	mov qword [rsp+8*119], 0
	setl [rsp+8*119]
	mov r8, [rsp+8*119]
	cmp r8, 0
	je L_17
	mov r8, [gbl+8*7]
	mov qword [rsp+8*120] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*120]
	call    address
	mov [rsp+8*121], rax
	mov r8, [rsp+8*121]
	mov r8, [r8]
	mov [rsp+8*122], r8
	mov r8, [rsp+8*122]
	mov qword [rsp+8*117] ,r8
	mov r8, [gbl+8*5]
	sub r8, [rsp+8*118]
	mov qword [rsp+8*123],r8 
	mov r8, [rsp+8*123]
	sub r8, 1
	mov qword [rsp+8*124],r8 
	mov r8, [gbl+8*7]
	mov qword [rsp+8*125] ,r8
	mov     rsi, [rsp+8*124]
	mov     rdi, [rsp+8*125]
	call    address
	mov [rsp+8*126], rax
	mov r8, [rsp+8*126]
	mov r8, [r8]
	mov [rsp+8*127], r8
	mov r8, [gbl+8*7]
	mov qword [rsp+8*128] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*128]
	call    address
	mov [rsp+8*129], rax
	mov r8, [rsp+8*127]
	mov r9, [rsp+8*129]
	mov qword [r9], r8
	mov r8, [gbl+8*5]
	sub r8, [rsp+8*118]
	mov qword [rsp+8*130],r8 
	mov r8, [rsp+8*130]
	sub r8, 1
	mov qword [rsp+8*131],r8 
	mov r8, [gbl+8*7]
	mov qword [rsp+8*132] ,r8
	mov     rsi, [rsp+8*131]
	mov     rdi, [rsp+8*132]
	call    address
	mov [rsp+8*133], rax
	mov r8, [rsp+8*117]
	mov r9, [rsp+8*133]
	mov qword [r9], r8
	mov r8, [gbl+8*5]
	sub r8, [rsp+8*118]
	mov qword [rsp+8*134],r8 
	mov r8, [rsp+8*134]
	sub r8, 1
	mov qword [rsp+8*135],r8 
	mov r8, [rsp+8*135]
	mov qword [arg+8*0] ,r8
	call adjustHeap
	mov [rsp+8*136] , rax
	
L_18:
	mov r8, [rsp+8*118]
	add r8, 1
	mov qword [rsp+8*137],r8 
	mov r8, [rsp+8*137]
	mov qword [rsp+8*118] ,r8
	jmp L_16
	
L_17:
	mov rax,0
	leave
	ret
	mov rax,0
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1168
	mov rax,[rsp+8*138]
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   3152
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
	
t200:
	 db 1,"",10,"" ,0

t195:
	 db 1," " ,0


