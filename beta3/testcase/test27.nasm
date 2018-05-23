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
	sub    rsp, 664
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 2648
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	call global_init
	mov r8 , rax
	mov r10,0
	mov r9,r10
	mov qword [rsp+8*1],r8
	mov qword [rsp+8*2],r9
	
L_336:
	mov r8,  [rsp+8*2]
	mov r9,2
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*3],r10
	mov r8,  [rsp+8*3]
	cmp r8, 0
	je L_337
	mov r8,8
	mov r9,8
	mov r10,r8
	add r10,r9
	mov r11,1
	mov r10,r10
	sub r10,r11
	mov qword [rsp+8*4],r10
	mov     rdi, [rsp+8*4]
	call    mallocArray
	mov     qword [rsp+8*5], rax
	mov r9,  [gbl+8*6]
	mov r8,r9
	mov r10,  [rsp+8*2]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,  [rsp+8*5]
	mov [r11],r12
	mov r13,r10
	mov r14,1
	mov r10,r10
	add r10,r14
	mov qword [rsp+8*7],r8
	mov qword [rsp+8*2],r10
	mov qword [rsp+8*8],r11
	mov qword [rsp+8*9],r13
	jmp L_336
	
L_337:
	mov r9,0
	mov r8,r9
	mov qword rdi,r8
	call search
	mov r8 , rax
	mov r9,0
	mov rax,r9
	        mov     rsp, qword [trsp]
	leave
	ret
	
search:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 664
	mov r9,  rdi
	mov r8,r9
	mov r10,  [gbl+8*13]
	cmp r8,r10
	mov r11, 0
	sete r11B
	mov qword [rsp+8*12],r8
	mov qword [rsp+8*14],r11
	mov r8,  [rsp+8*14]
	cmp r8, 0
	je L_325
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*15],r8
	
L_349:
	mov r8,  [rsp+8*15]
	mov r9,  [gbl+8*13]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*16],r10
	mov r8,  [rsp+8*16]
	cmp r8, 0
	je L_350
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*17],r8
	
L_351:
	mov r8,  [rsp+8*17]
	mov r9,  [gbl+8*13]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*18],r10
	mov r8,  [rsp+8*18]
	cmp r8, 0
	je L_352
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r10,  [rsp+8*15]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,  [rsp+8*17]
	cmp r12,r13
	mov r14, 0
	sete r14B
	mov qword [rsp+8*20],r8
	mov qword [rsp+8*21],r11
	mov qword [rsp+8*22],r12
	mov qword [rsp+8*23],r14
	mov r8,  [rsp+8*23]
	cmp r8, 0
	je L_353
	mov r9,t86
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*24],r10
	mov rdi, format
	mov rsi,[rsp+8*24] 
	add rsi, 1 
	xor rax, rax
	call printf
	jmp L_354
	
L_353:
	mov r9,t90
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*25],r10
	mov rdi, format
	mov rsi,[rsp+8*25] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_354:
	mov r9,  [rsp+8*17]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*26],r8
	mov qword [rsp+8*17],r9
	jmp L_351
	
L_352:
	mov r9,t94
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*27],r10
	mov rdi,[rsp+8*27] 
	add rdi, 1 
	call puts
	mov r9,  [rsp+8*15]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*28],r8
	mov qword [rsp+8*15],r9
	jmp L_349
	
L_350:
	mov r9,t98
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*29],r10
	mov rdi,[rsp+8*29] 
	add rdi, 1 
	call puts
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*30],r8
	mov qword [rsp+8*31],r10
	jmp L_326
	
L_325:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*32],r8
	
L_327:
	mov r8,  [rsp+8*32]
	mov r9,  [gbl+8*13]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*33],r10
	mov r8,  [rsp+8*33]
	cmp r8, 0
	je L_328
	mov r9,  [gbl+8*34]
	mov r8,r9
	mov r10,  [rsp+8*32]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,0
	cmp r12,r13
	mov r14, 0
	sete r14B
	mov qword [rsp+8*35],r8
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r12
	mov qword [rsp+8*38],r14
	mov r8,  [rsp+8*38]
	cmp r8, 0
	je L_331
	mov r8,  [rsp+8*32]
	mov r9,  [rsp+8*12]
	mov r10,r8
	add r10,r9
	mov r12,  [gbl+8*6]
	mov r11,r12
	mov r13,0
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r11
	mov r11, [r14]
	mov r14,r10
	add r14,1
	shl r14,4
	add r14,r11
	mov r15, [r14]
	mov r10,0
	cmp r15,r10
	mov qword [rsp+8*40],r11
	mov r11, 0
	sete r11B
	mov qword [rsp+8*43],r11
	mov qword [rsp+8*41],r14
	mov qword [rsp+8*42],r15
	mov r8,  [rsp+8*43]
	cmp r8, 0
	je L_333
	mov r8,  [rsp+8*32]
	mov r9,  [gbl+8*13]
	mov r10,r8
	add r10,r9
	mov r11,1
	mov r10,r10
	sub r10,r11
	mov r12,  [rsp+8*12]
	mov r10,r10
	sub r10,r12
	mov r14,  [gbl+8*6]
	mov r13,r14
	mov r15,1
	mov r11,r15
	add r11,1
	shl r11,4
	add r11,r13
	mov r13, [r11]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r13
	mov r10, [r11]
	mov qword [rsp+8*46],r11
	mov r11,0
	cmp r10,r11
	mov qword [rsp+8*45],r13
	mov r13, 0
	sete r13B
	mov qword [rsp+8*47],r10
	mov qword [rsp+8*48],r13
	mov r8,  [rsp+8*48]
	cmp r8, 0
	je L_335
	mov r8,  [rsp+8*32]
	mov r9,  [gbl+8*13]
	mov r10,r8
	add r10,r9
	mov r11,1
	mov r10,r10
	sub r10,r11
	mov r12,  [rsp+8*12]
	mov r10,r10
	sub r10,r12
	mov r14,  [gbl+8*6]
	mov r13,r14
	mov r15,1
	mov r11,r15
	add r11,1
	shl r11,4
	add r11,r13
	mov r13, [r11]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r13
	mov r10,1
	mov [r11],r10
	mov r10,r8
	add r10,r12
	mov qword [rsp+8*51],r11
	mov r11,r14
	mov qword [rsp+8*50],r13
	mov r13,0
	mov r15,r13
	add r15,1
	shl r15,4
	add r15,r11
	mov r11, [r15]
	mov r15,r10
	add r15,1
	shl r15,4
	add r15,r11
	mov r10,1
	mov [r15],r10
	mov qword [rsp+8*53],r11
	mov r11,  [gbl+8*34]
	mov r10,r11
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r10
	mov qword [rsp+8*55],r10
	mov r10,1
	mov [r13],r10
	mov qword [rsp+8*56],r13
	mov r13,  [gbl+8*19]
	mov r10,r13
	mov qword [rsp+8*54],r15
	mov r15,r12
	add r15,1
	shl r15,4
	add r15,r10
	mov [r15],r8
	mov qword [rsp+8*57],r10
	mov r10,1
	mov qword [rsp+8*58],r15
	mov r15,r12
	add r15,r10
	mov r10,r15
	mov qword rdi,r10
	mov qword [rsp+8*59],r15
	call search
	mov r8 , rax
	mov r10,1
	mov r9,r10
	mov r11,r9
	mov qword [rsp+8*60],r8
	mov qword rdi,r9
	mov qword [rsp+8*61],r11
	mov     rdi, [rsp+8*61]
	call    toString
	mov     qword[rsp+8*62], rax
	mov r9,  [gbl+8*34]
	mov r8,r9
	mov r10,  [rsp+8*32]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,0
	mov [r11],r12
	mov r13,  [rsp+8*12]
	mov r14,r10
	add r14,r13
	mov qword [rsp+8*63],r8
	mov r8,  [gbl+8*6]
	mov r15,r8
	mov qword [rsp+8*64],r11
	mov r11,0
	mov r12,r11
	add r12,1
	shl r12,4
	add r12,r15
	mov r15, [r12]
	mov r12,r14
	add r12,1
	shl r12,4
	add r12,r15
	mov r11,0
	mov [r12],r11
	mov r11,  [gbl+8*13]
	mov qword [rsp+8*67],r12
	mov r12,r10
	add r12,r11
	mov r14,1
	mov r12,r12
	sub r12,r14
	mov r12,r12
	sub r12,r13
	mov r13,r8
	mov r14,1
	mov qword [rsp+8*66],r15
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov r13, [r15]
	mov r15,r12
	add r15,1
	shl r15,4
	add r15,r13
	mov r12,0
	mov [r15],r12
	mov qword [rsp+8*69],r13
	mov qword [rsp+8*70],r15
	
L_335:
	
L_333:
	
L_331:
	mov r9,  [rsp+8*32]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*71],r8
	mov qword [rsp+8*32],r9
	jmp L_327
	
L_328:
	
L_326:
	mov r8,0
	mov rax,r8
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 664
	mov r9,8
	mov r8,r9
	mov qword [gbl+8*13],r8
	mov     rdi, 8
	call    mallocArray
	mov     qword [gbl+8*72], rax
	mov r9,  [gbl+8*72]
	mov r8,r9
	mov qword [gbl+8*34],r8
	mov     rdi, 8
	call    mallocArray
	mov     qword [gbl+8*73], rax
	mov r9,  [gbl+8*73]
	mov r8,r9
	mov qword [gbl+8*19],r8
	mov     rdi, 2
	call    mallocArray
	mov     qword [gbl+8*74], rax
	mov r9,  [gbl+8*74]
	mov r8,r9
	mov qword [gbl+8*6],r8
	mov r8,  [rsp+8*75]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   2648
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
	
t98:
	 db 0,"" ,0

t86:
	 db 2," O" ,0

t90:
	 db 2," ." ,0

t94:
	 db 0,"" ,0


