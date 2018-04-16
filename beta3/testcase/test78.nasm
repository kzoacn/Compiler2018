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
	sub    rsp, 976
	call global_init
	mov [rsp+8*1] , rax
	mov qword [arg+8*0] ,110
	call origin
	mov [rsp+8*3] , rax
	mov qword [rsp+8*4] ,0
	mov qword [rsp+8*5] ,99
	mov qword [rsp+8*6] ,100
	mov qword [rsp+8*7] ,0
	mov r8, [rsp+8*6]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*5]
	mov qword [arg+8*0] ,r8
	call build
	mov [rsp+8*9] , rax
	
L_597:
	mov r8, [rsp+8*7]
	mov qword [arg+8*2] ,r8
	mov r8, [rsp+8*5]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*6]
	mov qword [arg+8*0] ,r8
	call find
	mov [rsp+8*11] , rax
	mov r8, [rsp+8*11]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*12], 0
	setg [rsp+8*12]
	mov r8, [rsp+8*12]
	cmp r8, 0
	je L_598
	mov r8, [rsp+8*6]
	mov qword [arg+8*0] ,r8
	call improve
	mov [rsp+8*13] , rax
	jmp L_597
	
L_598:
	mov r8, [gbl+8*14]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*15] ,r8
	mov     rdi, [rsp+8*15]
	call    toString
	mov     qword[rsp+8*16], rax
	mov r8, [rsp+8*16]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*17] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*17] 
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
	
origin:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 976
	mov r8, [arg+8*0]
	mov qword [rsp+8*18] ,r8
	mov     rdi, [rsp+8*18]
	call    mallocArray
	mov     qword [rsp+8*19], rax
	mov r8, [rsp+8*19]
	mov qword [gbl+8*20] ,r8
	mov qword [gbl+8*21] ,0
	
L_561:
	mov r8, [gbl+8*21]
	mov r9, [rsp+8*18]
	cmp r8, r9
	mov qword [rsp+8*22], 0
	setl [rsp+8*22]
	mov r8, [rsp+8*22]
	cmp r8, 0
	je L_562
	mov     rdi, [rsp+8*18]
	call    mallocArray
	mov     qword [rsp+8*23], rax
	mov r8, [gbl+8*20]
	mov qword [rsp+8*24] ,r8
	mov     rsi, [gbl+8*21]
	mov     rdi, [rsp+8*24]
	call    address
	mov [rsp+8*25], rax
	mov r8, [rsp+8*23]
	mov r9, [rsp+8*25]
	mov qword [r9], r8
	mov qword [gbl+8*26] ,0
	
L_564:
	mov r8, [gbl+8*26]
	mov r9, [rsp+8*18]
	cmp r8, r9
	mov qword [rsp+8*27], 0
	setl [rsp+8*27]
	mov r8, [rsp+8*27]
	cmp r8, 0
	je L_565
	mov r8, [gbl+8*20]
	mov qword [rsp+8*28] ,r8
	mov     rsi, [gbl+8*21]
	mov     rdi, [rsp+8*28]
	call    address
	mov [rsp+8*29], rax
	mov r8, [rsp+8*29]
	mov r8, [r8]
	mov [rsp+8*28], r8
	mov     rsi, [gbl+8*26]
	mov     rdi, [rsp+8*28]
	call    address
	mov [rsp+8*29], rax
	mov r8, 0
	mov r9, [rsp+8*29]
	mov qword [r9], r8
	
L_566:
	mov r8, [gbl+8*26]
	mov qword [rsp+8*30] ,r8
	mov r8, [gbl+8*26]
	add r8, 1
	mov qword [gbl+8*26],r8 
	jmp L_564
	
L_565:
	
L_563:
	mov r8, [gbl+8*21]
	mov qword [rsp+8*31] ,r8
	mov r8, [gbl+8*21]
	add r8, 1
	mov qword [gbl+8*21],r8 
	jmp L_561
	
L_562:
	mov rax,0
	leave
	ret
	
build:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 976
	mov r8, [arg+8*0]
	mov qword [rsp+8*32] ,r8
	mov r8, [arg+8*1]
	mov qword [rsp+8*33] ,r8
	mov qword [gbl+8*21] ,1
	
L_567:
	mov r8, [gbl+8*21]
	mov r9, 49
	cmp r8, r9
	mov qword [rsp+8*34], 0
	setle [rsp+8*34]
	mov r8, [rsp+8*34]
	cmp r8, 0
	je L_568
	mov qword [gbl+8*26] ,50
	
L_570:
	mov r8, 98
	sub r8, [gbl+8*21]
	mov qword [rsp+8*35],r8 
	mov r8, [rsp+8*35]
	add r8, 1
	mov qword [rsp+8*36],r8 
	mov r8, [gbl+8*26]
	mov r9, [rsp+8*36]
	cmp r8, r9
	mov qword [rsp+8*37], 0
	setle [rsp+8*37]
	mov r8, [rsp+8*37]
	cmp r8, 0
	je L_571
	mov r8, [gbl+8*20]
	mov qword [rsp+8*38] ,r8
	mov     rsi, [gbl+8*21]
	mov     rdi, [rsp+8*38]
	call    address
	mov [rsp+8*39], rax
	mov r8, [rsp+8*39]
	mov r8, [r8]
	mov [rsp+8*38], r8
	mov     rsi, [gbl+8*26]
	mov     rdi, [rsp+8*38]
	call    address
	mov [rsp+8*39], rax
	mov r8, 1
	mov r9, [rsp+8*39]
	mov qword [r9], r8
	
L_572:
	mov r8, [gbl+8*26]
	mov qword [rsp+8*40] ,r8
	mov r8, [gbl+8*26]
	add r8, 1
	mov qword [gbl+8*26],r8 
	jmp L_570
	
L_571:
	
L_569:
	mov r8, [gbl+8*21]
	mov qword [rsp+8*41] ,r8
	mov r8, [gbl+8*21]
	add r8, 1
	mov qword [gbl+8*21],r8 
	jmp L_567
	
L_568:
	mov qword [gbl+8*21] ,1
	
L_573:
	mov r8, [gbl+8*21]
	mov r9, 49
	cmp r8, r9
	mov qword [rsp+8*42], 0
	setle [rsp+8*42]
	mov r8, [rsp+8*42]
	cmp r8, 0
	je L_574
	mov r8, [gbl+8*20]
	mov qword [rsp+8*43] ,r8
	mov     rsi, [rsp+8*32]
	mov     rdi, [rsp+8*43]
	call    address
	mov [rsp+8*44], rax
	mov r8, [rsp+8*44]
	mov r8, [r8]
	mov [rsp+8*43], r8
	mov     rsi, [gbl+8*21]
	mov     rdi, [rsp+8*43]
	call    address
	mov [rsp+8*44], rax
	mov r8, 1
	mov r9, [rsp+8*44]
	mov qword [r9], r8
	
L_575:
	mov r8, [gbl+8*21]
	mov qword [rsp+8*45] ,r8
	mov r8, [gbl+8*21]
	add r8, 1
	mov qword [gbl+8*21],r8 
	jmp L_573
	
L_574:
	mov qword [gbl+8*21] ,50
	
L_576:
	mov r8, [gbl+8*21]
	mov r9, 98
	cmp r8, r9
	mov qword [rsp+8*46], 0
	setle [rsp+8*46]
	mov r8, [rsp+8*46]
	cmp r8, 0
	je L_577
	mov r8, [gbl+8*20]
	mov qword [rsp+8*47] ,r8
	mov     rsi, [gbl+8*21]
	mov     rdi, [rsp+8*47]
	call    address
	mov [rsp+8*48], rax
	mov r8, [rsp+8*48]
	mov r8, [r8]
	mov [rsp+8*47], r8
	mov     rsi, [rsp+8*33]
	mov     rdi, [rsp+8*47]
	call    address
	mov [rsp+8*48], rax
	mov r8, 1
	mov r9, [rsp+8*48]
	mov qword [r9], r8
	
L_578:
	mov r8, [gbl+8*21]
	mov qword [rsp+8*49] ,r8
	mov r8, [gbl+8*21]
	add r8, 1
	mov qword [gbl+8*21],r8 
	jmp L_576
	
L_577:
	mov rax,0
	leave
	ret
	mov rax,0
	leave
	ret
	
find:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 976
	mov r8, [arg+8*0]
	mov qword [rsp+8*50] ,r8
	mov r8, [arg+8*1]
	mov qword [rsp+8*51] ,r8
	mov r8, [arg+8*2]
	mov qword [rsp+8*52] ,r8
	mov qword [gbl+8*53] ,0
	mov qword [gbl+8*54] ,1
	mov qword [gbl+8*21] ,1
	
L_579:
	mov r8, [gbl+8*21]
	mov r9, [rsp+8*50]
	cmp r8, r9
	mov qword [rsp+8*55], 0
	setle [rsp+8*55]
	mov r8, [rsp+8*55]
	cmp r8, 0
	je L_580
	mov r8, [gbl+8*56]
	mov qword [rsp+8*57] ,r8
	mov     rsi, [gbl+8*21]
	mov     rdi, [rsp+8*57]
	call    address
	mov [rsp+8*58], rax
	mov r8, 0
	mov r9, [rsp+8*58]
	mov qword [r9], r8
	
L_581:
	mov r8, [gbl+8*21]
	mov qword [rsp+8*59] ,r8
	mov r8, [gbl+8*21]
	add r8, 1
	mov qword [gbl+8*21],r8 
	jmp L_579
	
L_580:
	mov r8, [gbl+8*60]
	mov qword [rsp+8*61] ,r8
	mov     rsi, 1
	mov     rdi, [rsp+8*61]
	call    address
	mov [rsp+8*62], rax
	mov r8, [rsp+8*51]
	mov r9, [rsp+8*62]
	mov qword [r9], r8
	mov r8, [gbl+8*56]
	mov qword [rsp+8*63] ,r8
	mov     rsi, [rsp+8*51]
	mov     rdi, [rsp+8*63]
	call    address
	mov [rsp+8*64], rax
	mov r8, 1
	mov r9, [rsp+8*64]
	mov qword [r9], r8
	mov r8, [gbl+8*65]
	mov qword [rsp+8*66] ,r8
	mov     rsi, [rsp+8*51]
	mov     rdi, [rsp+8*66]
	call    address
	mov [rsp+8*67], rax
	mov r8, 0
	mov r9, [rsp+8*67]
	mov qword [r9], r8
	mov qword [rsp+8*52] ,0
	
L_582:
	mov r8, [gbl+8*53]
	mov r9, [gbl+8*54]
	cmp r8, r9
	mov qword [rsp+8*68], 0
	setl [rsp+8*68]
	mov r8, [rsp+8*68]
	cmp r8, 0
	jne L_584
	mov qword [rsp+8*69] ,0
	jmp L_585
	
L_584:
	mov r8, [rsp+8*52]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*70], 0
	sete [rsp+8*70]
	mov r8, [rsp+8*70]
	mov qword [rsp+8*69] ,r8
	
L_585:
	mov r8, [rsp+8*69]
	cmp r8, 0
	je L_583
	mov r8, [gbl+8*53]
	mov qword [rsp+8*71] ,r8
	mov r8, [gbl+8*53]
	add r8, 1
	mov qword [gbl+8*53],r8 
	mov r8, [gbl+8*60]
	mov qword [rsp+8*72] ,r8
	mov     rsi, [gbl+8*53]
	mov     rdi, [rsp+8*72]
	call    address
	mov [rsp+8*73], rax
	mov r8, [rsp+8*73]
	mov r8, [r8]
	mov [rsp+8*74], r8
	mov r8, [rsp+8*74]
	mov qword [gbl+8*21] ,r8
	mov qword [gbl+8*26] ,1
	
L_586:
	mov r8, [gbl+8*26]
	mov r9, [rsp+8*50]
	cmp r8, r9
	mov qword [rsp+8*75], 0
	setle [rsp+8*75]
	mov r8, [rsp+8*75]
	cmp r8, 0
	je L_587
	mov r8, [gbl+8*20]
	mov qword [rsp+8*76] ,r8
	mov     rsi, [gbl+8*21]
	mov     rdi, [rsp+8*76]
	call    address
	mov [rsp+8*77], rax
	mov r8, [rsp+8*77]
	mov r8, [r8]
	mov [rsp+8*76], r8
	mov     rsi, [gbl+8*26]
	mov     rdi, [rsp+8*76]
	call    address
	mov [rsp+8*77], rax
	mov r8, [rsp+8*77]
	mov r8, [r8]
	mov [rsp+8*78], r8
	mov r8, [rsp+8*78]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*79], 0
	setg [rsp+8*79]
	mov r8, [rsp+8*79]
	cmp r8, 0
	jne L_589
	mov qword [rsp+8*80] ,0
	jmp L_590
	
L_589:
	mov r8, [gbl+8*56]
	mov qword [rsp+8*81] ,r8
	mov     rsi, [gbl+8*26]
	mov     rdi, [rsp+8*81]
	call    address
	mov [rsp+8*82], rax
	mov r8, [rsp+8*82]
	mov r8, [r8]
	mov [rsp+8*83], r8
	mov r8, [rsp+8*83]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*84], 0
	sete [rsp+8*84]
	mov r8, [rsp+8*84]
	mov qword [rsp+8*80] ,r8
	
L_590:
	mov r8, [rsp+8*80]
	cmp r8, 0
	je L_592
	mov r8, [gbl+8*56]
	mov qword [rsp+8*85] ,r8
	mov     rsi, [gbl+8*26]
	mov     rdi, [rsp+8*85]
	call    address
	mov [rsp+8*86], rax
	mov r8, 1
	mov r9, [rsp+8*86]
	mov qword [r9], r8
	mov r8, [gbl+8*54]
	mov qword [rsp+8*87] ,r8
	mov r8, [gbl+8*54]
	add r8, 1
	mov qword [gbl+8*54],r8 
	mov r8, [gbl+8*60]
	mov qword [rsp+8*88] ,r8
	mov     rsi, [gbl+8*54]
	mov     rdi, [rsp+8*88]
	call    address
	mov [rsp+8*89], rax
	mov r8, [gbl+8*26]
	mov r9, [rsp+8*89]
	mov qword [r9], r8
	mov r8, [gbl+8*65]
	mov qword [rsp+8*90] ,r8
	mov     rsi, [gbl+8*26]
	mov     rdi, [rsp+8*90]
	call    address
	mov [rsp+8*91], rax
	mov r8, [gbl+8*21]
	mov r9, [rsp+8*91]
	mov qword [r9], r8
	mov r8, [gbl+8*54]
	mov r9, [rsp+8*50]
	cmp r8, r9
	mov qword [rsp+8*92], 0
	sete [rsp+8*92]
	mov r8, [rsp+8*92]
	cmp r8, 0
	je L_594
	mov qword [rsp+8*52] ,1
	
L_594:
	
L_592:
	
L_588:
	mov r8, [gbl+8*26]
	mov qword [rsp+8*93] ,r8
	mov r8, [gbl+8*26]
	add r8, 1
	mov qword [gbl+8*26],r8 
	jmp L_586
	
L_587:
	jmp L_582
	
L_583:
	mov rax,[rsp+8*52]
	leave
	ret
	mov rax,0
	leave
	ret
	
improve:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 976
	mov r8, [arg+8*0]
	mov qword [rsp+8*94] ,r8
	mov r8, [rsp+8*94]
	mov qword [gbl+8*21] ,r8
	mov r8, [gbl+8*14]
	mov qword [rsp+8*95] ,r8
	mov r8, [gbl+8*14]
	add r8, 1
	mov qword [gbl+8*14],r8 
	
L_595:
	mov r8, [gbl+8*65]
	mov qword [rsp+8*96] ,r8
	mov     rsi, [gbl+8*21]
	mov     rdi, [rsp+8*96]
	call    address
	mov [rsp+8*97], rax
	mov r8, [rsp+8*97]
	mov r8, [r8]
	mov [rsp+8*98], r8
	mov r8, [rsp+8*98]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*99], 0
	setg [rsp+8*99]
	mov r8, [rsp+8*99]
	cmp r8, 0
	je L_596
	mov r8, [gbl+8*65]
	mov qword [rsp+8*100] ,r8
	mov     rsi, [gbl+8*21]
	mov     rdi, [rsp+8*100]
	call    address
	mov [rsp+8*101], rax
	mov r8, [rsp+8*101]
	mov r8, [r8]
	mov [rsp+8*102], r8
	mov r8, [rsp+8*102]
	mov qword [gbl+8*26] ,r8
	mov r8, [gbl+8*20]
	mov qword [rsp+8*103] ,r8
	mov     rsi, [gbl+8*26]
	mov     rdi, [rsp+8*103]
	call    address
	mov [rsp+8*104], rax
	mov r8, [rsp+8*104]
	mov r8, [r8]
	mov [rsp+8*103], r8
	mov     rsi, [gbl+8*21]
	mov     rdi, [rsp+8*103]
	call    address
	mov [rsp+8*104], rax
	mov r8, [rsp+8*104]
	mov r8, [r8]
	mov [rsp+8*105], r8
	mov r8, [rsp+8*105]
	mov qword [rsp+8*106] ,r8
	mov r8, [rsp+8*105]
	sub r8, 1
	mov qword [rsp+8*105],r8 
	mov r8, [rsp+8*105]
	mov r9, [rsp+8*104]
	mov qword [r9], r8
	mov r8, [gbl+8*20]
	mov qword [rsp+8*107] ,r8
	mov     rsi, [gbl+8*21]
	mov     rdi, [rsp+8*107]
	call    address
	mov [rsp+8*108], rax
	mov r8, [rsp+8*108]
	mov r8, [r8]
	mov [rsp+8*107], r8
	mov     rsi, [gbl+8*26]
	mov     rdi, [rsp+8*107]
	call    address
	mov [rsp+8*108], rax
	mov r8, [rsp+8*108]
	mov r8, [r8]
	mov [rsp+8*109], r8
	mov r8, [rsp+8*109]
	mov qword [rsp+8*110] ,r8
	mov r8, [rsp+8*109]
	add r8, 1
	mov qword [rsp+8*109],r8 
	mov r8, [rsp+8*109]
	mov r9, [rsp+8*108]
	mov qword [r9], r8
	mov r8, [gbl+8*26]
	mov qword [gbl+8*21] ,r8
	jmp L_595
	
L_596:
	mov rax,0
	leave
	ret
	mov rax,0
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 976
	mov qword [gbl+8*14] ,0
	mov     rdi, 110
	call    mallocArray
	mov     qword [gbl+8*111], rax
	mov r8, [gbl+8*111]
	mov qword [gbl+8*56] ,r8
	mov     rdi, 110
	call    mallocArray
	mov     qword [gbl+8*112], rax
	mov r8, [gbl+8*112]
	mov qword [gbl+8*65] ,r8
	mov     rdi, 110
	call    mallocArray
	mov     qword [gbl+8*113], rax
	mov r8, [gbl+8*113]
	mov qword [gbl+8*60] ,r8
	mov rax,[rsp+8*114]
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   2960
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
	

