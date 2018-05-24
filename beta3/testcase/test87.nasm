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
	sub    rsp, 2648
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 4632
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	push r14
	call global_init
	pop r14
	pop r15
	mov r8 , rax
	mov qword [rsp+8*1],r8
	
L_1216:
	mov r8,1
	mov r9,r8
	mov rcx,29
	shl r9,cl
	mov r10,  [gbl+8*3]
	cmp r10,r9
	mov r11, 0
	setl r11B
	mov qword [rsp+8*2],r9
	mov qword [rsp+8*4],r11
	mov r8,  [rsp+8*4]
	cmp r8, 0
	jne L_1218
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*5],r8
	jmp L_1219
	
L_1218:
	mov r8,1
	mov r9,r8
	mov rcx,29
	shl r9,cl
	mov r10,r9
	neg r10
	mov r11,  [gbl+8*3]
	cmp r11,r10
	mov r8, 0
	setg r8B
	mov qword [rsp+8*8],r8
	mov qword [rsp+8*6],r9
	mov qword [rsp+8*7],r10
	mov r9,  [rsp+8*8]
	mov r8,r9
	mov qword [rsp+8*5],r8
	
L_1219:
	mov r8,  [rsp+8*5]
	cmp r8, 0
	je L_1217
	mov r8,  [gbl+8*3]
	mov r9,  [gbl+8*9]
	mov r10,r8
	sub r10,r9
	mov r11,  [gbl+8*11]
	mov r10,r10
	add r10,r11
	mov r8,r9
	add r8,r11
	mov r10,r10
	sub r10,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r9
	mov qword [rsp+8*10],r10
	mov r10,  [gbl+8*11]
	mov r11,r11
	add r11,r10
	mov r8,r9
	add r8,r10
	mov r11,r11
	sub r11,r8
	mov r8,  [rsp+8*10]
	mov r8,r8
	add r8,r11
	mov r11,  [gbl+8*3]
	mov r10,r11
	sub r10,r9
	mov qword [rsp+8*10],r8
	mov r8,  [gbl+8*11]
	mov r10,r10
	add r10,r8
	mov r11,r9
	add r11,r8
	mov r10,r10
	sub r10,r11
	mov r11,  [gbl+8*3]
	mov r8,r11
	sub r8,r9
	mov qword [rsp+8*15],r10
	mov r10,  [gbl+8*11]
	mov r8,r8
	add r8,r10
	mov r9,  [rsp+8*15]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*10]
	mov r8,r8
	add r8,r9
	mov r9,  [gbl+8*9]
	mov r11,r9
	add r11,r10
	mov qword [rsp+8*10],r8
	mov r8,  [gbl+8*3]
	mov r10,r8
	sub r10,r9
	mov qword [rsp+8*18],r11
	mov r11,  [gbl+8*11]
	mov r10,r10
	add r10,r11
	mov r8,  [rsp+8*18]
	mov r8,r8
	add r8,r10
	mov r10,r9
	add r10,r11
	mov r8,r8
	sub r8,r10
	mov r10,  [gbl+8*3]
	mov r11,r10
	sub r11,r9
	mov qword [rsp+8*18],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r10,r9
	add r10,r8
	mov r11,r11
	sub r11,r10
	mov r10,  [gbl+8*3]
	mov r8,r10
	sub r8,r9
	mov qword [rsp+8*21],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*21]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*18]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*10]
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*9]
	mov r10,r8
	add r10,r11
	mov qword [rsp+8*10],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*24],r10
	mov r10,r9
	sub r10,r8
	mov r10,r10
	add r10,r11
	mov r8,  [rsp+8*24]
	mov r8,r8
	add r8,r10
	mov r10,  [gbl+8*9]
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*24],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*26],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*26]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*24]
	mov r9,r9
	sub r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*24],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*28],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*28]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*24]
	mov r8,r8
	sub r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*24],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*31],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*31]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*31],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*34],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*34]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*31]
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*24]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*10]
	mov r8,r8
	sub r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*10],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*37],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*37]
	mov r9,r9
	add r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*37],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*41],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*41]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*37]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*37],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*44],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*44]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*44],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*47],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*47]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*44]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*37]
	mov r8,r8
	sub r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*37],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*50],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*50]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*50],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*53],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*53]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*50]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*50],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*56],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*56]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*56],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*59],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*59]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*56]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*50]
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*37]
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*10]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*10],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*62],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*62]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*62],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*64],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*64]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*62]
	mov r8,r8
	sub r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*62],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*66],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*66]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*62]
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*62],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*69],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*69]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*69],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*72],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*72]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*69]
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*62]
	mov r8,r8
	add r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*62],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*75],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*75]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*75],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*78],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*78]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*75]
	mov r8,r8
	sub r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*75],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*81],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*81]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*81],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*84],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*84]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*81]
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*75]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*62]
	mov r8,r8
	add r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*62],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*87],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*87]
	mov r9,r9
	add r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*87],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*91],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*91]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*87]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*87],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*94],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*94]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*94],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*97],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*97]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*94]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*87]
	mov r8,r8
	sub r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*87],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*100],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*100]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*100],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*103],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*103]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*100]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*100],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*106],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*106]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*106],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*109],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*109]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*106]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*100]
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*87]
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*62]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*10]
	mov r8,r8
	sub r8,r9
	mov r10,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*112],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [rsp+8*112]
	mov r8,r8
	add r8,r11
	mov r11,  [gbl+8*3]
	mov r9,r11
	sub r9,r10
	mov qword [rsp+8*112],r8
	mov r8,  [gbl+8*11]
	mov r9,r9
	add r9,r8
	mov r11,r10
	add r11,r8
	mov r9,r9
	sub r9,r11
	mov r11,  [gbl+8*3]
	mov r8,r11
	sub r8,r10
	mov qword [rsp+8*116],r9
	mov r9,  [gbl+8*11]
	mov r8,r8
	add r8,r9
	mov qword [gbl+8*9],r10
	mov r10,  [rsp+8*116]
	mov r10,r10
	add r10,r8
	mov r8,  [rsp+8*112]
	mov r8,r8
	add r8,r10
	mov r10,  [gbl+8*9]
	mov r11,r10
	add r11,r9
	mov qword [rsp+8*112],r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*119],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*119]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*119],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*122],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*122]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*119]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*112]
	mov r9,r9
	sub r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*112],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*125],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*125]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*125],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*127],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*127]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*125]
	mov r8,r8
	sub r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*125],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*129],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*129]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*125]
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*125],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*132],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*132]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*132],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*135],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*135]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*132]
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*125]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*112]
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*112],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*138],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*138]
	mov r8,r8
	add r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*138],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*142],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*142]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*138]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*138],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*145],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*145]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*145],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*148],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*148]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*145]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*138]
	mov r9,r9
	sub r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*138],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*151],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*151]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*151],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*154],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*154]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*151]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*151],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*157],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*157]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*157],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*160],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*160]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*157]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*151]
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*138]
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*112]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*112],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*163],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*163]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*163],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*165],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*165]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*163]
	mov r9,r9
	sub r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*163],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*167],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*167]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*163]
	mov r8,r8
	sub r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*163],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*170],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*170]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*170],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*173],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*173]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*170]
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*163]
	mov r9,r9
	add r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*163],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*176],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*176]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*176],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*179],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*179]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*176]
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*176],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*182],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*182]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*182],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*185],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*185]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*182]
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*176]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*163]
	mov r9,r9
	add r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*163],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*188],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*188]
	mov r8,r8
	add r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*188],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*192],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*192]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*188]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*188],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*195],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*195]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*195],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*198],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*198]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*195]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*188]
	mov r9,r9
	sub r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*188],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*201],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*201]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*201],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*204],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*204]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*201]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*201],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*207],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*207]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*207],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*210],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*210]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*207]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*201]
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*188]
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*163]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*112]
	mov r9,r9
	sub r9,r8
	mov r11,r9
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov qword [gbl+8*11],r11
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*213],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [rsp+8*213]
	mov r8,r8
	add r8,r11
	mov r11,  [gbl+8*3]
	mov r9,r11
	sub r9,r10
	mov qword [rsp+8*213],r8
	mov r8,  [gbl+8*11]
	mov r9,r9
	add r9,r8
	mov r11,r10
	add r11,r8
	mov r9,r9
	sub r9,r11
	mov r11,  [gbl+8*3]
	mov r8,r11
	sub r8,r10
	mov qword [rsp+8*217],r9
	mov r9,  [gbl+8*11]
	mov r8,r8
	add r8,r9
	mov r10,  [rsp+8*217]
	mov r10,r10
	add r10,r8
	mov r8,  [rsp+8*213]
	mov r8,r8
	add r8,r10
	mov r10,  [gbl+8*9]
	mov r11,r10
	add r11,r9
	mov qword [rsp+8*213],r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*220],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*220]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*220],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*223],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*223]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*220]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*213]
	mov r9,r9
	sub r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*213],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*226],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*226]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*226],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*228],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*228]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*226]
	mov r8,r8
	sub r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*226],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*230],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*230]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*226]
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*226],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*233],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*233]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*233],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*236],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*236]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*233]
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*226]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*213]
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*213],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*239],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*239]
	mov r8,r8
	add r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*239],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*243],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*243]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*239]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*239],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*246],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*246]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*246],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*249],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*249]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*246]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*239]
	mov r9,r9
	sub r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*239],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*252],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*252]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*252],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*255],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*255]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*252]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*252],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*258],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*258]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*258],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*261],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*261]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*258]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*252]
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*239]
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*213]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*213],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*264],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*264]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*264],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*266],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*266]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*264]
	mov r9,r9
	sub r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*264],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*268],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*268]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*264]
	mov r8,r8
	sub r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*264],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*271],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*271]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*271],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*274],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*274]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*271]
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*264]
	mov r9,r9
	add r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*264],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*277],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*277]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*277],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*280],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*280]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*277]
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*277],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*283],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*283]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*283],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*286],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*286]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*283]
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*277]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*264]
	mov r9,r9
	add r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*264],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*289],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*289]
	mov r8,r8
	add r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*289],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*293],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*293]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*289]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*289],r8
	mov r8,  [gbl+8*3]
	mov qword [rsp+8*296],r9
	mov r9,r8
	sub r9,r10
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*296]
	mov r8,r8
	add r8,r9
	mov r9,r10
	add r9,r11
	mov r8,r8
	sub r8,r9
	mov r9,  [gbl+8*3]
	mov r11,r9
	sub r11,r10
	mov qword [rsp+8*296],r8
	mov r8,  [gbl+8*11]
	mov r11,r11
	add r11,r8
	mov r9,r10
	add r9,r8
	mov r11,r11
	sub r11,r9
	mov r9,  [gbl+8*3]
	mov r8,r9
	sub r8,r10
	mov qword [rsp+8*299],r11
	mov r11,  [gbl+8*11]
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*299]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*296]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*289]
	mov r9,r9
	sub r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*289],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*302],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*302]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*302],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*305],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*305]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*302]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov qword [rsp+8*302],r9
	mov r9,  [gbl+8*3]
	mov qword [rsp+8*308],r8
	mov r8,r9
	sub r8,r10
	mov r8,r8
	add r8,r11
	mov r9,  [rsp+8*308]
	mov r9,r9
	add r9,r8
	mov r8,r10
	add r8,r11
	mov r9,r9
	sub r9,r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	sub r11,r10
	mov qword [rsp+8*308],r9
	mov r9,  [gbl+8*11]
	mov r11,r11
	add r11,r9
	mov r8,r10
	add r8,r9
	mov r11,r11
	sub r11,r8
	mov r8,  [gbl+8*3]
	mov r9,r8
	sub r9,r10
	mov qword [rsp+8*311],r11
	mov r11,  [gbl+8*11]
	mov r9,r9
	add r9,r11
	mov r8,  [rsp+8*311]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*308]
	mov r9,r9
	add r9,r8
	mov r8,  [rsp+8*302]
	mov r8,r8
	sub r8,r9
	mov r9,  [rsp+8*289]
	mov r9,r9
	sub r9,r8
	mov r8,  [rsp+8*264]
	mov r8,r8
	add r8,r9
	mov r9,  [rsp+8*213]
	mov r9,r9
	sub r9,r8
	mov r8,r9
	mov qword [gbl+8*3],r8
	mov qword [rsp+8*213],r9
	jmp L_1216
	
L_1217:
	mov r9,  [gbl+8*9]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*315],r10
	mov     rdi, [rsp+8*315]
	call    toString
	mov     qword[rsp+8*316], rax
	mov     rsi, t384
	mov     rdi, [rsp+8*316]
	call    concat
	mov [rsp+8*317], rax
	mov r9,  [gbl+8*11]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*318],r10
	mov     rdi, [rsp+8*318]
	call    toString
	mov     qword[rsp+8*319], rax
	mov     rsi, [rsp+8*319]
	mov     rdi, [rsp+8*317]
	call    concat
	mov [rsp+8*317], rax
	mov     rsi, t389
	mov     rdi, [rsp+8*317]
	call    concat
	mov [rsp+8*317], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*320],r10
	mov     rdi, [rsp+8*320]
	call    toString
	mov     qword[rsp+8*321], rax
	mov     rsi, [rsp+8*321]
	mov     rdi, [rsp+8*317]
	call    concat
	mov [rsp+8*317], rax
	mov r9,  [rsp+8*317]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*322],r10
	mov rdi,[rsp+8*322] 
	add rdi, 1 
	call puts
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2648
	mov r9,1
	mov r8,r9
	mov r11,1
	mov r10,r11
	mov qword [gbl+8*9],r8
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*3],r8
	mov qword [gbl+8*11],r10
	mov r8,  [rsp+8*323]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   4632
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
	
t389:
	 db 1," " ,0

t384:
	 db 1," " ,0


