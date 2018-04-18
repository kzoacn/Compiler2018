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
	sub    rsp, 1152
	call global_init
	mov r8 , rax
	mov r10,9987
	mov r9,r10
	mov qword [rsp+8*1],r8
	mov qword [gbl+8*2],r9
	mov     rdi, [gbl+8*2]
	call    mallocArray
	mov     qword [rsp+8*3], rax
	mov r9, qword [rsp+8*3]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [gbl+8*4],r8
	mov qword [rsp+8*5],r10
	
L_618:
	mov r9, qword [gbl+8*4]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov r11, [r11]
	mov r12, qword [rsp+8*5]
	cmp r12,r11
	mov r13, 0
	setl r13B
	mov qword [rsp+8*6],r8
	mov qword [arg+8*63],r10
	mov qword [rsp+8*8],r11
	mov qword [rsp+8*9],r13
	mov r8, qword [rsp+8*9]
	cmp r8, 0
	je L_619
	mov r9, qword [gbl+8*4]
	mov r8,r9
	mov r10, qword [rsp+8*5]
	mov     rsi, r10
	mov     rdi, r8
	call    address
	mov r11, rax
	mov [r11],r10
	mov qword [rsp+8*10],r8
	mov qword [rsp+8*11],r11
	
L_620:
	mov r8, qword [rsp+8*5]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov qword [rsp+8*5],r8
	mov qword [rsp+8*12],r10
	jmp L_618
	
L_619:
	call makeHeap
	mov r8 , rax
	mov qword [rsp+8*13],r8
	call heapSort
	mov r8 , rax
	mov r10,0
	mov r9,r10
	mov qword [rsp+8*14],r8
	mov qword [rsp+8*5],r9
	
L_621:
	mov r9, qword [gbl+8*4]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov r11, [r11]
	mov r12, qword [rsp+8*5]
	cmp r12,r11
	mov r13, 0
	setl r13B
	mov qword [rsp+8*15],r8
	mov qword [arg+8*63],r10
	mov qword [rsp+8*16],r11
	mov qword [rsp+8*17],r13
	mov r8, qword [rsp+8*17]
	cmp r8, 0
	je L_622
	mov r9, qword [gbl+8*4]
	mov r8,r9
	mov r10, qword [rsp+8*5]
	mov     rsi, r10
	mov     rdi, r8
	call    address
	mov r11, rax
	mov r12, [r11]
	mov r13,r12
	mov r14,r13
	mov qword [rsp+8*18],r8
	mov qword [rsp+8*19],r11
	mov qword [rsp+8*20],r12
	mov qword [arg+8*0],r13
	mov qword [rsp+8*22],r14
	mov     rdi, [rsp+8*22]
	call    toString
	mov     qword[rsp+8*23], rax
	mov     rsi, t236
	mov     rdi, [rsp+8*23]
	call    concat
	mov [rsp+8*24], rax
	mov r9, qword [rsp+8*24]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*25],r10
	mov rdi, format
	mov rsi,[rsp+8*25] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_623:
	mov r8, qword [rsp+8*5]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov qword [rsp+8*5],r8
	mov qword [rsp+8*26],r10
	jmp L_621
	
L_622:
	mov r9,t241
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*27],r10
	mov rdi, format
	mov rsi,[rsp+8*27] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8,0
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	jmp QED
	
exchange:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1152
	mov r9, qword [arg+8*0]
	mov r8,r9
	mov r11, qword [arg+8*1]
	mov r10,r11
	mov r13, qword [gbl+8*4]
	mov r12,r13
	mov     rsi, r8
	mov     rdi, r12
	call    address
	mov r14, rax
	mov r15, [r14]
	mov qword [rsp+8*28],r8
	mov r8,r15
	mov qword [rsp+8*34],r8
	mov r8,r13
	mov     rsi, r10
	mov     rdi, r8
	call    address
	mov r9, rax
	mov qword [rsp+8*35],r8
	mov r8, [r9]
	mov qword [rsp+8*37],r8
	mov r8,r13
	mov qword [rsp+8*36],r9
	mov r9, qword [rsp+8*28]
	mov qword [rsp+8*30],r10
	mov     rsi, r9
	mov     rdi, r8
	call    address
	mov r10, rax
	mov qword [rsp+8*38],r8
	mov r8, qword [rsp+8*37]
	mov [r10],r8
	mov r8,r13
	mov r9, qword [rsp+8*30]
	mov qword [rsp+8*39],r10
	mov     rsi, r9
	mov     rdi, r8
	call    address
	mov r10, rax
	mov qword [rsp+8*40],r8
	mov r8, qword [rsp+8*34]
	mov [r10],r8
	mov r8,0
	mov rax,r8
	mov qword [rsp+8*41],r10
	mov qword [rsp+8*31],r12
	mov qword [rsp+8*32],r14
	mov qword [rsp+8*33],r15
	leave
	ret
	
makeHeap:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1152
	mov r8, qword [gbl+8*2]
	mov r9,1
	mov r10,r8
	sub r10,r9
	xor rdx, rdx
	mov rax, r10
	mov r11,2
	mov rbx, r11
	cdq
	idiv rbx
	mov r12, rax
	mov r13,r12
	mov r15,0
	mov r14,r15
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*46],r8
	mov qword [rsp+8*42],r10
	mov qword [rsp+8*43],r12
	mov qword [rsp+8*44],r13
	mov qword [rsp+8*45],r14
	
L_599:
	mov r8, qword [rsp+8*44]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*47],r10
	mov r8, qword [rsp+8*47]
	cmp r8, 0
	je L_600
	mov r8, qword [rsp+8*44]
	mov r9,2
	mov r10,r8
	imul r10,r9
	mov r11,r10
	mov r12,2
	mov r13,r8
	imul r13,r12
	mov r14,1
	mov r15,r13
	add r15,r14
	mov r8, qword [gbl+8*2]
	cmp r15,r8
	mov r9, 0
	setl r9B
	mov qword [rsp+8*51],r9
	mov qword [rsp+8*48],r10
	mov qword [rsp+8*46],r11
	mov qword [rsp+8*49],r13
	mov qword [rsp+8*50],r15
	mov r8, qword [rsp+8*51]
	cmp r8, 0
	jne L_601
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*52],r8
	jmp L_602
	
L_601:
	mov r8, qword [rsp+8*44]
	mov r9,2
	mov r10,r8
	imul r10,r9
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r14, qword [gbl+8*4]
	mov r13,r14
	mov     rsi, r12
	mov     rdi, r13
	call    address
	mov r15, rax
	mov r8, [r15]
	mov qword [rsp+8*57],r8
	mov r8, qword [rsp+8*44]
	mov r9,2
	mov qword [rsp+8*53],r10
	mov r10,r8
	imul r10,r9
	mov r8,r14
	mov     rsi, r10
	mov     rdi, r8
	call    address
	mov r9, rax
	mov qword [rsp+8*59],r8
	mov r8, [r9]
	mov qword [rsp+8*61],r8
	mov r8, qword [rsp+8*57]
	mov qword [rsp+8*60],r9
	mov r9, qword [rsp+8*61]
	cmp r8,r9
	mov qword [rsp+8*58],r10
	mov r10, 0
	setl r10B
	mov qword [rsp+8*62],r10
	mov qword [rsp+8*54],r12
	mov qword [rsp+8*55],r13
	mov qword [rsp+8*56],r15
	mov r9, qword [rsp+8*62]
	mov r8,r9
	mov qword [rsp+8*52],r8
	
L_602:
	mov r8, qword [rsp+8*52]
	cmp r8, 0
	je L_604
	mov r8, qword [rsp+8*44]
	mov r9,2
	mov r10,r8
	imul r10,r9
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r13,r12
	mov qword [rsp+8*63],r10
	mov qword [rsp+8*64],r12
	mov qword [rsp+8*46],r13
	
L_604:
	mov r9, qword [gbl+8*4]
	mov r8,r9
	mov r10, qword [rsp+8*44]
	mov     rsi, r10
	mov     rdi, r8
	call    address
	mov r11, rax
	mov r12, [r11]
	mov r13,r9
	mov r14, qword [rsp+8*46]
	mov     rsi, r14
	mov     rdi, r13
	call    address
	mov r15, rax
	mov qword [rsp+8*65],r8
	mov r8, [r15]
	cmp r12,r8
	mov r9, 0
	setg r9B
	mov qword [rsp+8*70],r8
	mov qword [rsp+8*71],r9
	mov qword [rsp+8*66],r11
	mov qword [rsp+8*67],r12
	mov qword [rsp+8*68],r13
	mov qword [rsp+8*69],r15
	mov r8, qword [rsp+8*71]
	cmp r8, 0
	je L_606
	mov r9, qword [rsp+8*46]
	mov r8,r9
	mov r11, qword [rsp+8*44]
	mov r10,r11
	mov qword [arg+8*1],r8
	mov qword [arg+8*0],r10
	call exchange
	mov r8 , rax
	mov qword [rsp+8*72],r8
	
L_606:
	mov r8, qword [rsp+8*44]
	mov r9,1
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*44],r8
	mov qword [rsp+8*73],r10
	jmp L_599
	
L_600:
	mov r8,0
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
adjustHeap:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1152
	mov r9, qword [arg+8*0]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov r13,0
	mov r12,r13
	mov r15,0
	mov r14,r15
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*75],r10
	mov qword [rsp+8*76],r12
	mov qword [rsp+8*77],r14
	
L_607:
	mov r8, qword [rsp+8*75]
	mov r9,2
	mov r10,r8
	imul r10,r9
	mov r11, qword [rsp+8*74]
	cmp r10,r11
	mov r12, 0
	setl r12B
	mov qword [rsp+8*78],r10
	mov qword [rsp+8*79],r12
	mov r8, qword [rsp+8*79]
	cmp r8, 0
	je L_608
	mov r8, qword [rsp+8*75]
	mov r9,2
	mov r10,r8
	imul r10,r9
	mov r11,r10
	mov r12,2
	mov r13,r8
	imul r13,r12
	mov r14,1
	mov r15,r13
	add r15,r14
	mov r8, qword [rsp+8*74]
	cmp r15,r8
	mov r9, 0
	setl r9B
	mov qword [rsp+8*83],r9
	mov qword [rsp+8*80],r10
	mov qword [rsp+8*76],r11
	mov qword [rsp+8*81],r13
	mov qword [rsp+8*82],r15
	mov r8, qword [rsp+8*83]
	cmp r8, 0
	jne L_609
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*84],r8
	jmp L_610
	
L_609:
	mov r8, qword [rsp+8*75]
	mov r9,2
	mov r10,r8
	imul r10,r9
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r14, qword [gbl+8*4]
	mov r13,r14
	mov     rsi, r12
	mov     rdi, r13
	call    address
	mov r15, rax
	mov r8, [r15]
	mov qword [rsp+8*89],r8
	mov r8, qword [rsp+8*75]
	mov r9,2
	mov qword [rsp+8*85],r10
	mov r10,r8
	imul r10,r9
	mov r8,r14
	mov     rsi, r10
	mov     rdi, r8
	call    address
	mov r9, rax
	mov qword [rsp+8*91],r8
	mov r8, [r9]
	mov qword [rsp+8*93],r8
	mov r8, qword [rsp+8*89]
	mov qword [rsp+8*92],r9
	mov r9, qword [rsp+8*93]
	cmp r8,r9
	mov qword [rsp+8*90],r10
	mov r10, 0
	setl r10B
	mov qword [rsp+8*94],r10
	mov qword [rsp+8*86],r12
	mov qword [rsp+8*87],r13
	mov qword [rsp+8*88],r15
	mov r9, qword [rsp+8*94]
	mov r8,r9
	mov qword [rsp+8*84],r8
	
L_610:
	mov r8, qword [rsp+8*84]
	cmp r8, 0
	je L_612
	mov r8, qword [rsp+8*75]
	mov r9,2
	mov r10,r8
	imul r10,r9
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r13,r12
	mov qword [rsp+8*95],r10
	mov qword [rsp+8*96],r12
	mov qword [rsp+8*76],r13
	
L_612:
	mov r9, qword [gbl+8*4]
	mov r8,r9
	mov r10, qword [rsp+8*75]
	mov     rsi, r10
	mov     rdi, r8
	call    address
	mov r11, rax
	mov r12, [r11]
	mov r13,r9
	mov r14, qword [rsp+8*76]
	mov     rsi, r14
	mov     rdi, r13
	call    address
	mov r15, rax
	mov qword [rsp+8*97],r8
	mov r8, [r15]
	cmp r12,r8
	mov r9, 0
	setg r9B
	mov qword [rsp+8*102],r8
	mov qword [rsp+8*103],r9
	mov qword [rsp+8*98],r11
	mov qword [rsp+8*99],r12
	mov qword [rsp+8*100],r13
	mov qword [rsp+8*101],r15
	mov r8, qword [rsp+8*103]
	cmp r8, 0
	je L_613
	mov r9, qword [gbl+8*4]
	mov r8,r9
	mov r10, qword [rsp+8*75]
	mov     rsi, r10
	mov     rdi, r8
	call    address
	mov r11, rax
	mov r12, [r11]
	mov r13,r12
	mov r14,r9
	mov r15, qword [rsp+8*76]
	mov qword [rsp+8*104],r8
	mov     rsi, r15
	mov     rdi, r14
	call    address
	mov r8, rax
	mov r9, [r8]
	mov qword [rsp+8*109],r8
	mov qword [rsp+8*110],r9
	mov r9, qword [gbl+8*4]
	mov r8,r9
	mov     rsi, r10
	mov     rdi, r8
	call    address
	mov r9, rax
	mov qword [rsp+8*111],r8
	mov r8, qword [rsp+8*110]
	mov [r9],r8
	mov qword [rsp+8*112],r9
	mov r9, qword [gbl+8*4]
	mov r8,r9
	mov     rsi, r15
	mov     rdi, r8
	call    address
	mov r9, rax
	mov [r9],r13
	mov r10,r15
	mov qword [rsp+8*113],r8
	mov qword [rsp+8*114],r9
	mov qword [rsp+8*75],r10
	mov qword [rsp+8*105],r11
	mov qword [rsp+8*106],r12
	mov qword [rsp+8*107],r13
	mov qword [rsp+8*108],r14
	jmp L_614
	
L_613:
	jmp L_608
	
L_614:
	jmp L_607
	
L_608:
	mov r8,0
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
heapSort:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1152
	mov r9,0
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*115],r8
	mov qword [rsp+8*116],r10
	
L_615:
	mov r8, qword [rsp+8*116]
	mov r9, qword [gbl+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*117],r10
	mov r8, qword [rsp+8*117]
	cmp r8, 0
	je L_616
	mov r9, qword [gbl+8*4]
	mov r8,r9
	mov r10,0
	mov     rsi, r10
	mov     rdi, r8
	call    address
	mov r11, rax
	mov r12, [r11]
	mov r13,r12
	mov r14, qword [gbl+8*2]
	mov r15, qword [rsp+8*116]
	mov qword [rsp+8*118],r8
	mov r8,r14
	sub r8,r15
	mov r9,1
	mov r10,r8
	sub r10,r9
	mov qword [rsp+8*121],r8
	mov r9, qword [gbl+8*4]
	mov r8,r9
	mov     rsi, r10
	mov     rdi, r8
	call    address
	mov r9, rax
	mov qword [rsp+8*123],r8
	mov r8, [r9]
	mov qword [rsp+8*125],r8
	mov qword [rsp+8*124],r9
	mov r9, qword [gbl+8*4]
	mov r8,r9
	mov r9,0
	mov qword [rsp+8*122],r10
	mov     rsi, r9
	mov     rdi, r8
	call    address
	mov r10, rax
	mov qword [rsp+8*126],r8
	mov r8, qword [rsp+8*125]
	mov [r10],r8
	mov r8,r14
	sub r8,r15
	mov r9,1
	mov qword [rsp+8*127],r10
	mov r10,r8
	sub r10,r9
	mov qword [rsp+8*128],r8
	mov r9, qword [gbl+8*4]
	mov r8,r9
	mov     rsi, r10
	mov     rdi, r8
	call    address
	mov r9, rax
	mov [r9],r13
	mov qword [rsp+8*130],r8
	mov r8,r14
	sub r8,r15
	mov qword [rsp+8*131],r9
	mov r9,1
	mov qword [rsp+8*129],r10
	mov r10,r8
	sub r10,r9
	mov qword [rsp+8*132],r8
	mov r8,r10
	mov qword [arg+8*0],r8
	mov qword [rsp+8*133],r10
	mov qword [rsp+8*119],r11
	mov qword [rsp+8*120],r12
	mov qword [rsp+8*115],r13
	call adjustHeap
	mov r8 , rax
	mov qword [rsp+8*134],r8
	
L_617:
	mov r8, qword [rsp+8*116]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov qword [rsp+8*116],r8
	mov qword [rsp+8*135],r10
	jmp L_615
	
L_616:
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
	sub    rsp, 1152
	mov r8, qword [rsp+8*136]
	mov rax,r8
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   3136
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
	
t236:
	 db 1," " ,0

t241:
	 db 1,"",10,"" ,0


