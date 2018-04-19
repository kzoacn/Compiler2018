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
	sub    rsp, 4368
	call global_init
	mov r8 , rax
	mov qword [rsp+8*1],r8
	call    getInt
	mov     [rsp+8*2], rax
	mov r9, qword [rsp+8*2]
	mov r8,r9
	mov qword [gbl+8*3],r8
	call    getInt
	mov     [rsp+8*4], rax
	mov r9, qword [rsp+8*4]
	mov r8,r9
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*5],r8
	mov qword [rsp+8*6],r10
	
L_69:
	mov r8, qword [rsp+8*6]
	mov r9, qword [gbl+8*3]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*7],r10
	mov r8, qword [rsp+8*7]
	cmp r8, 0
	je L_70
	mov r9, qword [gbl+8*8]
	mov r8,r9
	mov r10, qword [rsp+8*6]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov [r11],r10
	mov r12, qword [rsp+8*5]
	cmp r10,r12
	mov r13, 0
	setle r13B
	mov qword [rsp+8*9],r8
	mov qword [rsp+8*10],r11
	mov qword [rsp+8*11],r13
	mov r8, qword [rsp+8*11]
	cmp r8, 0
	je L_73
	mov r8, qword [rsp+8*5]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r11, qword [rsp+8*6]
	mov r12,r10
	sub r12,r11
	mov r14, qword [gbl+8*8]
	mov r13,r14
	mov r15,r11
	add r15,1
	shl r15,4
	add r15,r13
	mov [r15],r12
	mov qword [rsp+8*12],r10
	mov qword [rsp+8*13],r12
	mov qword [rsp+8*14],r13
	mov qword [rsp+8*15],r15
	
L_73:
	mov r9, qword [gbl+8*8]
	mov r8,r9
	mov r10, qword [rsp+8*6]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r14, qword [gbl+8*19]
	mov r13,r14
	mov r15,r10
	add r15,1
	shl r15,4
	add r15,r13
	mov [r15],r12
	mov qword [rsp+8*16],r8
	mov qword [rsp+8*17],r11
	mov qword [rsp+8*18],r12
	mov qword [rsp+8*20],r13
	mov qword [rsp+8*21],r15
	
L_71:
	mov r9, qword [rsp+8*6]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*22],r8
	mov qword [rsp+8*6],r9
	jmp L_69
	
L_70:
	mov r8, qword [gbl+8*3]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r13,1
	mov r12,r13
	mov qword [rsp+8*23],r10
	mov qword [arg+8*1],r11
	mov qword [arg+8*0],r12
	call quicksort
	mov r8 , rax
	mov r9,r8
	mov qword [rsp+8*26],r8
	mov qword [rsp+8*27],r9
	call restore
	mov r8 , rax
	mov qword [rsp+8*28],r8
	call calc
	mov r8 , rax
	mov r9,r8
	mov qword [rsp+8*29],r8
	mov qword [rsp+8*30],r9
	call restore
	mov r8 , rax
	mov r9, qword [gbl+8*3]
	mov r10,1
	mov r11,r9
	add r11,r10
	mov r12,r11
	mov r14,1
	mov r13,r14
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*32],r11
	mov qword [arg+8*1],r12
	mov qword [arg+8*0],r13
	call mergesort
	mov r8 , rax
	mov r9,r8
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*34],r9
	call restore
	mov r8 , rax
	mov qword [rsp+8*35],r8
	call heapsort
	mov r8 , rax
	mov r9,r8
	mov r11, qword [rsp+8*27]
	mov r10,r11
	mov r12,r10
	mov qword [rsp+8*36],r8
	mov qword [rsp+8*37],r9
	mov qword [arg+8*0],r10
	mov qword [rsp+8*38],r12
	mov     rdi, [rsp+8*38]
	call    toString
	mov     qword[rsp+8*39], rax
	mov r9, qword [rsp+8*39]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*40],r10
	mov rdi,[rsp+8*40] 
	add rdi, 1 
	call puts
	mov r9, qword [rsp+8*30]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*41],r10
	mov     rdi, [rsp+8*41]
	call    toString
	mov     qword[rsp+8*42], rax
	mov r9, qword [rsp+8*42]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*43],r10
	mov rdi,[rsp+8*43] 
	add rdi, 1 
	call puts
	mov r9, qword [rsp+8*34]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*44],r10
	mov     rdi, [rsp+8*44]
	call    toString
	mov     qword[rsp+8*45], rax
	mov r9, qword [rsp+8*45]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*46],r10
	mov rdi,[rsp+8*46] 
	add rdi, 1 
	call puts
	mov r9, qword [rsp+8*37]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*47],r10
	mov     rdi, [rsp+8*47]
	call    toString
	mov     qword[rsp+8*48], rax
	mov r9, qword [rsp+8*48]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*49],r10
	mov rdi,[rsp+8*49] 
	add rdi, 1 
	call puts
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*50], rax
	mov r9, qword [rsp+8*50]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*51],r8
	mov qword [rsp+8*52],r10
	mov qword [arg+8*63],r11
	call A_Optimizer
	mov r8 , rax
	mov r9,0
	mov rax,r9
	mov qword [rsp+8*54],r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	jmp QED
	
A_Optimizer:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 4368
	mov r9, qword [arg+8*63]
	mov r8,r9
	mov qword [rsp+8*55],r8
	mov     rdi, 10
	call    mallocArray
	mov     qword [rsp+8*56], rax
	mov r8, qword [rsp+8*56]
	mov r9,0
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r11,2
	mov [r10],r11
	mov r12,1
	mov r10,r12
	add r10,1
	shl r10,4
	add r10,r8
	mov r13,2
	mov [r10],r13
	mov r14,2
	mov r10,r14
	add r10,1
	shl r10,4
	add r10,r8
	mov r15,2
	mov [r10],r15
	mov r9,3
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r9,2
	mov [r10],r9
	mov r9,4
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r9,2
	mov [r10],r9
	mov r9,5
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r9,2
	mov [r10],r9
	mov r9,6
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r9,2
	mov [r10],r9
	mov r9,7
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r9,2
	mov [r10],r9
	mov r9,8
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r9,2
	mov [r10],r9
	mov r9,9
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r9,2
	mov [r10],r9
	mov qword [rsp+8*57],r10
	mov     rdi, [rsp+8*56]
	call    multiArray
	mov     qword [rsp+8*56], rax
	mov r9, qword [rsp+8*56]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov r13,1
	mov r12,r13
	mov qword [rsp+8*58],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*60],r12
	
L_0:
	mov r8, qword [rsp+8*60]
	mov r9,1000
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*61],r10
	mov r8, qword [rsp+8*61]
	cmp r8, 0
	je L_1
	mov r8,123
	mov r9, qword [rsp+8*60]
	mov r10,r8
	add r10,r9
	mov r12, qword [rsp+8*58]
	mov r11,r12
	mov r13,0
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r11
	mov r11, [r14]
	mov r15,1
	mov r14,r15
	add r14,1
	shl r14,4
	add r14,r11
	mov r11, [r14]
	mov r8,0
	mov r14,r8
	add r14,1
	shl r14,4
	add r14,r11
	mov r11, [r14]
	mov r8,1
	mov r14,r8
	add r14,1
	shl r14,4
	add r14,r11
	mov r11, [r14]
	mov r8,0
	mov r14,r8
	add r14,1
	shl r14,4
	add r14,r11
	mov r11, [r14]
	mov r8,1
	mov r14,r8
	add r14,1
	shl r14,4
	add r14,r11
	mov r11, [r14]
	mov r8,0
	mov r14,r8
	add r14,1
	shl r14,4
	add r14,r11
	mov r11, [r14]
	mov r8,1
	mov r14,r8
	add r14,1
	shl r14,4
	add r14,r11
	mov r11, [r14]
	mov r8,0
	mov r14,r8
	add r14,1
	shl r14,4
	add r14,r11
	mov r11, [r14]
	mov r8,1
	mov r14,r8
	add r14,1
	shl r14,4
	add r14,r11
	mov [r14],r10
	mov r8,r12
	mov r10,0
	mov qword [rsp+8*63],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r10,1
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r10,1
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r10,1
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r10,1
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r10,1
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*65],r8
	mov r8, [r11]
	mov r10, qword [rsp+8*59]
	mov qword [rsp+8*66],r11
	mov r11,r10
	add r11,r8
	mov r10,r11
	mov qword [rsp+8*67],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*68],r11
	mov qword [rsp+8*64],r14
	
L_2:
	mov r9, qword [rsp+8*60]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*69],r8
	mov qword [rsp+8*60],r9
	jmp L_0
	
L_1:
	mov r9, qword [rsp+8*59]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*70],r10
	mov     rdi, [rsp+8*70]
	call    toString
	mov     qword[rsp+8*71], rax
	mov r9, qword [rsp+8*71]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*72],r10
	mov rdi,[rsp+8*72] 
	add rdi, 1 
	call puts
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*60],r8
	
L_3:
	mov r8, qword [rsp+8*60]
	mov r9,1000000
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*73],r10
	mov r8, qword [rsp+8*73]
	cmp r8, 0
	je L_4
	xor rdx, rdx
	mov r8,9876
	mov rax, r8
	mov r9,1234
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r11,2345
	mov r12,r10
	imul r12,r11
	xor rdx, rdx
	mov rax, r12
	mov r13,1234
	mov rbx, r13
	cdq
	idiv rbx
	mov r14, rdx
	mov r15,2345
	mov r8,r14
	imul r8,r15
	xor rdx, rdx
	mov rax, r8
	mov r9,1234
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	mov r8,2345
	mov r9,r10
	imul r9,r8
	xor rdx, rdx
	mov rax, r9
	mov r8,1234
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	xor rdx, rdx
	mov rax, r10
	mov r8,11
	mov rbx, r8
	cdq
	idiv rbx
	mov r9, rdx
	mov r8, qword [rsp+8*59]
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov qword [rsp+8*59],r8
	mov qword [rsp+8*255],r9
	mov qword [rsp+8*256],r10
	mov qword [rsp+8*75],r12
	mov qword [rsp+8*76],r14
	
L_5:
	mov r9, qword [rsp+8*60]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*257],r8
	mov qword [rsp+8*60],r9
	jmp L_3
	
L_4:
	mov r9, qword [rsp+8*59]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*258],r10
	mov     rdi, [rsp+8*258]
	call    toString
	mov     qword[rsp+8*259], rax
	mov r9, qword [rsp+8*259]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*260],r10
	mov rdi,[rsp+8*260] 
	add rdi, 1 
	call puts
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*60],r8
	
L_6:
	mov r8, qword [rsp+8*60]
	mov r9,200000000
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*261],r10
	mov r8, qword [rsp+8*261]
	cmp r8, 0
	je L_7
	
L_8:
	mov r9, qword [rsp+8*60]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*262],r8
	mov qword [rsp+8*60],r9
	jmp L_6
	
L_7:
	mov r8, qword [rsp+8*263]
	mov rax,r8
	leave
	ret
	
A_A:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 4368
	mov r9, qword [arg+8*63]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*264],r8
	mov qword [rsp+8*265],r11
	mov     rdi, 0
	call    mallocArray
	mov     qword [rsp+8*266], rax
	mov r9, qword [rsp+8*266]
	mov r8,r9
	mov qword [rsp+8*267],r8
	mov     rsi, [rsp+8*266]
	mov     rdi, [rsp+8*265]
	call    multiAddress
	mov [rsp+8*268], rax
	mov     rdi, 10
	call    mallocArray
	mov     qword [rsp+8*269], rax
	mov r8, qword [rsp+8*269]
	mov r9,0
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r11,2
	mov [r10],r11
	mov r12,1
	mov r10,r12
	add r10,1
	shl r10,4
	add r10,r8
	mov r13,2
	mov [r10],r13
	mov r14,2
	mov r10,r14
	add r10,1
	shl r10,4
	add r10,r8
	mov r15,3
	mov [r10],r15
	mov r9,3
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r9,2
	mov [r10],r9
	mov r9,4
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r9,3
	mov [r10],r9
	mov r9,5
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r9,2
	mov [r10],r9
	mov r9,6
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r9,2
	mov [r10],r9
	mov r9,7
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r9,3
	mov [r10],r9
	mov r9,8
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r9,2
	mov [r10],r9
	mov r9,9
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r9,2
	mov [r10],r9
	mov qword [rsp+8*270],r10
	mov     rdi, [rsp+8*269]
	call    multiArray
	mov     qword [rsp+8*269], rax
	mov r8, qword [rsp+8*268]
	mov r9, qword [rsp+8*269]
	mov [r8],r9
	mov r10, qword [rsp+8*271]
	mov rax,r10
	leave
	ret
	
restore:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 4368
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*272],r8
	
L_9:
	mov r8, qword [rsp+8*272]
	mov r9, qword [gbl+8*3]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*273],r10
	mov r8, qword [rsp+8*273]
	cmp r8, 0
	je L_10
	mov r9, qword [gbl+8*19]
	mov r8,r9
	mov r10, qword [rsp+8*272]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r14, qword [gbl+8*8]
	mov r13,r14
	mov r15,r10
	add r15,1
	shl r15,4
	add r15,r13
	mov [r15],r12
	mov qword [rsp+8*274],r8
	mov qword [rsp+8*275],r11
	mov qword [rsp+8*276],r12
	mov qword [rsp+8*277],r13
	mov qword [rsp+8*278],r15
	
L_11:
	mov r9, qword [rsp+8*272]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*279],r8
	mov qword [rsp+8*272],r9
	jmp L_9
	
L_10:
	mov r8,0
	mov rax,r8
	leave
	ret
	
quicksort:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 4368
	mov r9, qword [arg+8*0]
	mov r8,r9
	mov r11, qword [arg+8*1]
	mov r10,r11
	mov r13,0
	mov r12,r13
	mov r15, qword [gbl+8*8]
	mov r14,r15
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r14
	mov qword [rsp+8*283],r14
	mov r14, [r13]
	mov qword [rsp+8*284],r13
	mov r13,r14
	mov qword [rsp+8*285],r14
	mov r15,0
	mov r14,r15
	mov r9,0
	mov r15,r9
	mov r9,1
	mov r11,r8
	add r11,r9
	mov r9,r11
	mov qword [rsp+8*280],r8
	mov qword [rsp+8*290],r9
	mov qword [rsp+8*281],r10
	mov qword [rsp+8*289],r11
	mov qword [rsp+8*282],r12
	mov qword [rsp+8*286],r13
	mov qword [rsp+8*287],r14
	mov qword [rsp+8*288],r15
	
L_12:
	mov r8, qword [rsp+8*290]
	mov r9, qword [rsp+8*281]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*291],r10
	mov r8, qword [rsp+8*291]
	cmp r8, 0
	je L_13
	mov r9, qword [rsp+8*282]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov r12, qword [gbl+8*8]
	mov r11,r12
	mov r13, qword [rsp+8*290]
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r11
	mov r15, [r14]
	mov qword [rsp+8*292],r8
	mov r8, qword [rsp+8*286]
	cmp r15,r8
	mov r10, 0
	setl r10B
	mov qword [rsp+8*282],r9
	mov qword [rsp+8*296],r10
	mov qword [rsp+8*293],r11
	mov qword [rsp+8*294],r14
	mov qword [rsp+8*295],r15
	mov r8, qword [rsp+8*296]
	cmp r8, 0
	je L_15
	mov r9, qword [gbl+8*8]
	mov r8,r9
	mov r10, qword [rsp+8*290]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r14, qword [rsp+8*287]
	mov r13,r14
	mov r15,1
	mov r14,r14
	add r14,r15
	mov qword [rsp+8*297],r8
	mov qword [rsp+8*298],r11
	mov r11, qword [gbl+8*301]
	mov r8,r11
	mov r15,r13
	add r15,1
	shl r15,4
	add r15,r8
	mov [r15],r12
	mov qword [rsp+8*302],r8
	mov qword [rsp+8*299],r12
	mov qword [rsp+8*300],r13
	mov qword [rsp+8*287],r14
	mov qword [rsp+8*303],r15
	jmp L_16
	
L_15:
	mov r9, qword [gbl+8*8]
	mov r8,r9
	mov r10, qword [rsp+8*290]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r14, qword [rsp+8*288]
	mov r13,r14
	mov r15,1
	mov r14,r14
	add r14,r15
	mov qword [rsp+8*304],r8
	mov qword [rsp+8*305],r11
	mov r11, qword [gbl+8*308]
	mov r8,r11
	mov r15,r13
	add r15,1
	shl r15,4
	add r15,r8
	mov [r15],r12
	mov qword [rsp+8*309],r8
	mov qword [rsp+8*306],r12
	mov qword [rsp+8*307],r13
	mov qword [rsp+8*288],r14
	mov qword [rsp+8*310],r15
	
L_16:
	
L_14:
	mov r9, qword [rsp+8*290]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*311],r8
	mov qword [rsp+8*290],r9
	jmp L_12
	
L_13:
	mov r9, qword [rsp+8*280]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*312],r8
	mov qword [rsp+8*290],r10
	
L_17:
	mov r8, qword [rsp+8*290]
	mov r9, qword [rsp+8*287]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*313],r10
	mov r8, qword [rsp+8*313]
	cmp r8, 0
	je L_18
	mov r9, qword [gbl+8*301]
	mov r8,r9
	mov r10, qword [rsp+8*290]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r14, qword [rsp+8*312]
	mov r13,r14
	mov r15,1
	mov r14,r14
	add r14,r15
	mov qword [rsp+8*314],r8
	mov qword [rsp+8*315],r11
	mov r11, qword [gbl+8*8]
	mov r8,r11
	mov r15,r13
	add r15,1
	shl r15,4
	add r15,r8
	mov [r15],r12
	mov qword [rsp+8*318],r8
	mov qword [rsp+8*316],r12
	mov qword [rsp+8*317],r13
	mov qword [rsp+8*312],r14
	mov qword [rsp+8*319],r15
	
L_19:
	mov r9, qword [rsp+8*290]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*320],r8
	mov qword [rsp+8*290],r9
	jmp L_17
	
L_18:
	mov r9, qword [rsp+8*312]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov r12, qword [gbl+8*8]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r14, qword [rsp+8*286]
	mov [r13],r14
	mov qword [rsp+8*321],r8
	mov r8,0
	mov r15,r8
	mov qword [rsp+8*312],r9
	mov qword [rsp+8*322],r11
	mov qword [rsp+8*323],r13
	mov qword [rsp+8*290],r15
	
L_20:
	mov r8, qword [rsp+8*290]
	mov r9, qword [rsp+8*288]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*324],r10
	mov r8, qword [rsp+8*324]
	cmp r8, 0
	je L_21
	mov r9, qword [gbl+8*308]
	mov r8,r9
	mov r10, qword [rsp+8*290]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r14, qword [rsp+8*312]
	mov r13,r14
	mov r15,1
	mov r14,r14
	add r14,r15
	mov qword [rsp+8*325],r8
	mov qword [rsp+8*326],r11
	mov r11, qword [gbl+8*8]
	mov r8,r11
	mov qword [rsp+8*312],r14
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r8
	mov [r14],r12
	mov qword [rsp+8*329],r8
	mov qword [rsp+8*327],r12
	mov qword [rsp+8*328],r13
	mov qword [rsp+8*330],r14
	
L_22:
	mov r9, qword [rsp+8*290]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*331],r8
	mov qword [rsp+8*290],r9
	jmp L_20
	
L_21:
	mov r8, qword [rsp+8*287]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*332],r10
	mov r8, qword [rsp+8*332]
	cmp r8, 0
	je L_24
	mov r8, qword [rsp+8*280]
	mov r9, qword [rsp+8*287]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r12,r8
	mov qword [rsp+8*333],r10
	mov qword [arg+8*1],r11
	mov qword [arg+8*0],r12
	call quicksort
	mov r8 , rax
	mov r9, qword [rsp+8*282]
	mov r10,r9
	add r10,r8
	mov r9,r10
	mov qword [rsp+8*334],r8
	mov qword [rsp+8*282],r9
	mov qword [rsp+8*335],r10
	
L_24:
	mov r8, qword [rsp+8*288]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*336],r10
	mov r8, qword [rsp+8*336]
	cmp r8, 0
	je L_26
	mov r8, qword [rsp+8*281]
	mov r9, qword [rsp+8*288]
	mov r10,r8
	sub r10,r9
	mov r11,r8
	mov r12,r10
	mov qword [rsp+8*337],r10
	mov qword [arg+8*1],r11
	mov qword [arg+8*0],r12
	call quicksort
	mov r8 , rax
	mov r9, qword [rsp+8*282]
	mov r10,r9
	add r10,r8
	mov r9,r10
	mov qword [rsp+8*338],r8
	mov qword [rsp+8*282],r9
	mov qword [rsp+8*339],r10
	
L_26:
	mov r8, qword [rsp+8*282]
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
calc:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 4368
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*340],r8
	
L_27:
	mov r8, qword [rsp+8*340]
	mov r9, qword [gbl+8*3]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*341],r10
	mov r8, qword [rsp+8*341]
	cmp r8, 0
	je L_28
	mov r8, qword [rsp+8*340]
	mov r9,1
	mov r10,r8
	sub r10,r9
	mov r12, qword [gbl+8*301]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov [r13],r10
	mov r14,1
	mov r15,r8
	add r15,r14
	mov r10, qword [gbl+8*308]
	mov r9,r10
	mov qword [rsp+8*343],r11
	mov r11,r8
	add r11,1
	shl r11,4
	add r11,r9
	mov [r11],r15
	mov qword [rsp+8*346],r9
	mov qword [rsp+8*347],r11
	mov qword [rsp+8*344],r13
	mov qword [rsp+8*345],r15
	
L_29:
	mov r9, qword [rsp+8*340]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*348],r8
	mov qword [rsp+8*340],r9
	jmp L_27
	
L_28:
	mov r9,0
	mov r8,r9
	mov r11, qword [gbl+8*3]
	mov r10,r11
	mov qword [rsp+8*349],r8
	mov qword [rsp+8*340],r10
	
L_30:
	mov r8, qword [rsp+8*340]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*350],r10
	mov r8, qword [rsp+8*350]
	cmp r8, 0
	je L_31
	mov r9, qword [gbl+8*8]
	mov r8,r9
	mov r10, qword [rsp+8*340]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r14, qword [gbl+8*301]
	mov r13,r14
	mov r15,r12
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*351],r8
	mov r8, [r15]
	mov qword [rsp+8*352],r11
	mov r11,r8
	mov qword [rsp+8*356],r8
	mov r8,r9
	mov qword [rsp+8*353],r12
	mov r12,r10
	add r12,1
	shl r12,4
	add r12,r8
	mov qword [rsp+8*358],r8
	mov r8, [r12]
	mov qword [rsp+8*359],r12
	mov qword [rsp+8*354],r13
	mov r13, qword [gbl+8*308]
	mov r12,r13
	mov qword [rsp+8*355],r15
	mov r15,r8
	add r15,1
	shl r15,4
	add r15,r12
	mov qword [rsp+8*360],r8
	mov r8, [r15]
	mov qword [rsp+8*361],r12
	mov r12,r8
	mov qword [rsp+8*363],r8
	mov r8,r13
	mov qword [rsp+8*362],r15
	mov r15,r11
	add r15,1
	shl r15,4
	add r15,r8
	mov [r15],r12
	mov qword [rsp+8*365],r8
	mov r8,r14
	mov qword [rsp+8*366],r15
	mov r15,r12
	add r15,1
	shl r15,4
	add r15,r8
	mov [r15],r11
	mov qword [rsp+8*367],r8
	mov r8, qword [rsp+8*349]
	mov qword [rsp+8*368],r15
	mov r15,r8
	add r15,r12
	mov qword [rsp+8*364],r12
	mov r12,r15
	sub r12,r11
	mov qword [rsp+8*357],r11
	mov r11,2
	mov r15,r12
	sub r15,r11
	mov r8,r15
	mov qword [rsp+8*349],r8
	mov qword [rsp+8*370],r12
	mov qword [rsp+8*371],r15
	
L_32:
	mov r9, qword [rsp+8*340]
	mov r8,r9
	mov r10,1
	mov r9,r9
	sub r9,r10
	mov qword [rsp+8*372],r8
	mov qword [rsp+8*340],r9
	jmp L_30
	
L_31:
	mov r8, qword [rsp+8*349]
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
mergesort:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 4368
	mov r9, qword [arg+8*0]
	mov r8,r9
	mov r11, qword [arg+8*1]
	mov r10,r11
	mov r12,1
	mov r13,r8
	add r13,r12
	cmp r13,r10
	mov r14, 0
	sete r14B
	mov qword [rsp+8*373],r8
	mov qword [rsp+8*374],r10
	mov qword [rsp+8*375],r13
	mov qword [rsp+8*376],r14
	mov r8, qword [rsp+8*376]
	cmp r8, 0
	je L_34
	mov r8,0
	mov rax,r8
	leave
	ret
	
L_34:
	mov r8, qword [rsp+8*373]
	mov r9, qword [rsp+8*374]
	mov r10,r8
	add r10,r9
	mov r11,1
	mov r12,r10
	mov rcx,r11
	shr r12,cl
	mov r13,r12
	mov r15,0
	mov r14,r15
	mov r10,r13
	mov r11,r8
	mov qword [arg+8*1],r10
	mov qword [arg+8*0],r11
	mov qword [rsp+8*378],r12
	mov qword [rsp+8*379],r13
	mov qword [rsp+8*380],r14
	call mergesort
	mov r8 , rax
	mov r9, qword [rsp+8*380]
	mov r10,r9
	add r10,r8
	mov r9,r10
	mov r12, qword [rsp+8*374]
	mov r11,r12
	mov r14, qword [rsp+8*379]
	mov r13,r14
	mov qword [rsp+8*381],r8
	mov qword [rsp+8*380],r9
	mov qword [rsp+8*382],r10
	mov qword [arg+8*1],r11
	mov qword [arg+8*0],r13
	call mergesort
	mov r8 , rax
	mov r9, qword [rsp+8*380]
	mov r10,r9
	add r10,r8
	mov r9,r10
	mov r12,0
	mov r11,r12
	mov r14,0
	mov r13,r14
	mov qword [rsp+8*383],r8
	mov r8, qword [rsp+8*373]
	mov r15,r8
	mov qword [rsp+8*380],r9
	mov qword [rsp+8*384],r10
	mov qword [rsp+8*385],r11
	mov qword [rsp+8*386],r13
	mov qword [rsp+8*387],r15
	
L_35:
	mov r8, qword [rsp+8*387]
	mov r9, qword [rsp+8*379]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*388],r10
	mov r8, qword [rsp+8*388]
	cmp r8, 0
	je L_36
	mov r9, qword [gbl+8*8]
	mov r8,r9
	mov r10, qword [rsp+8*387]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r14, qword [rsp+8*385]
	mov r13,r14
	mov r15,1
	mov r14,r14
	add r14,r15
	mov qword [rsp+8*389],r8
	mov qword [rsp+8*390],r11
	mov r11, qword [gbl+8*301]
	mov r8,r11
	mov r15,r13
	add r15,1
	shl r15,4
	add r15,r8
	mov [r15],r12
	mov qword [rsp+8*393],r8
	mov qword [rsp+8*391],r12
	mov qword [rsp+8*392],r13
	mov qword [rsp+8*385],r14
	mov qword [rsp+8*394],r15
	
L_37:
	mov r9, qword [rsp+8*387]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*395],r8
	mov qword [rsp+8*387],r9
	jmp L_35
	
L_36:
	mov r9, qword [rsp+8*379]
	mov r8,r9
	mov qword [rsp+8*387],r8
	
L_38:
	mov r8, qword [rsp+8*387]
	mov r9, qword [rsp+8*374]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*396],r10
	mov r8, qword [rsp+8*396]
	cmp r8, 0
	je L_39
	mov r9, qword [gbl+8*8]
	mov r8,r9
	mov r10, qword [rsp+8*387]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r14, qword [rsp+8*386]
	mov r13,r14
	mov r15,1
	mov r14,r14
	add r14,r15
	mov qword [rsp+8*397],r8
	mov qword [rsp+8*398],r11
	mov r11, qword [gbl+8*308]
	mov r8,r11
	mov r15,r13
	add r15,1
	shl r15,4
	add r15,r8
	mov [r15],r12
	mov qword [rsp+8*401],r8
	mov qword [rsp+8*399],r12
	mov qword [rsp+8*400],r13
	mov qword [rsp+8*386],r14
	mov qword [rsp+8*402],r15
	
L_40:
	mov r9, qword [rsp+8*387]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*403],r8
	mov qword [rsp+8*387],r9
	jmp L_38
	
L_39:
	mov r9,0
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov r13, qword [rsp+8*373]
	mov r12,r13
	mov qword [rsp+8*404],r8
	mov qword [rsp+8*405],r10
	mov qword [rsp+8*406],r12
	
L_41:
	mov r8, qword [rsp+8*404]
	mov r9, qword [rsp+8*385]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*407],r10
	mov r8, qword [rsp+8*407]
	cmp r8, 0
	jne L_43
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*408],r8
	jmp L_44
	
L_43:
	mov r8, qword [rsp+8*405]
	mov r9, qword [rsp+8*386]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*409],r10
	mov r9, qword [rsp+8*409]
	mov r8,r9
	mov qword [rsp+8*408],r8
	
L_44:
	mov r8, qword [rsp+8*408]
	cmp r8, 0
	je L_42
	mov r9, qword [rsp+8*380]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov r12, qword [gbl+8*301]
	mov r11,r12
	mov r13, qword [rsp+8*404]
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r11
	mov r15, [r14]
	mov qword [rsp+8*410],r8
	mov r10, qword [gbl+8*308]
	mov r8,r10
	mov qword [rsp+8*411],r11
	mov r11, qword [rsp+8*405]
	mov qword [rsp+8*412],r14
	mov r14,r11
	add r14,1
	shl r14,4
	add r14,r8
	mov qword [rsp+8*414],r8
	mov r8, [r14]
	cmp r15,r8
	mov qword [rsp+8*415],r14
	mov r14, 0
	setl r14B
	mov qword [rsp+8*416],r8
	mov qword [rsp+8*380],r9
	mov qword [rsp+8*417],r14
	mov qword [rsp+8*413],r15
	mov r8, qword [rsp+8*417]
	cmp r8, 0
	je L_45
	mov r9, qword [rsp+8*404]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov r12, qword [gbl+8*301]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r14, [r13]
	mov qword [rsp+8*418],r8
	mov r8, qword [rsp+8*406]
	mov r15,r8
	mov r10,1
	mov r8,r8
	add r8,r10
	mov qword [rsp+8*419],r11
	mov r11, qword [gbl+8*8]
	mov r10,r11
	mov qword [rsp+8*420],r13
	mov r13,r15
	add r13,1
	shl r13,4
	add r13,r10
	mov [r13],r14
	mov qword [rsp+8*406],r8
	mov qword [rsp+8*404],r9
	mov qword [rsp+8*423],r10
	mov qword [rsp+8*424],r13
	mov qword [rsp+8*421],r14
	mov qword [rsp+8*422],r15
	jmp L_46
	
L_45:
	mov r9, qword [rsp+8*405]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov r12, qword [gbl+8*308]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r14, [r13]
	mov qword [rsp+8*425],r8
	mov r8, qword [rsp+8*406]
	mov r15,r8
	mov r10,1
	mov r8,r8
	add r8,r10
	mov qword [rsp+8*426],r11
	mov r11, qword [gbl+8*8]
	mov r10,r11
	mov qword [rsp+8*427],r13
	mov r13,r15
	add r13,1
	shl r13,4
	add r13,r10
	mov [r13],r14
	mov qword [rsp+8*406],r8
	mov qword [rsp+8*405],r9
	mov qword [rsp+8*430],r10
	mov qword [rsp+8*431],r13
	mov qword [rsp+8*428],r14
	mov qword [rsp+8*429],r15
	
L_46:
	jmp L_41
	
L_42:
	
L_47:
	mov r8, qword [rsp+8*404]
	mov r9, qword [rsp+8*385]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*432],r10
	mov r8, qword [rsp+8*432]
	cmp r8, 0
	je L_48
	mov r9, qword [rsp+8*404]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov r12, qword [gbl+8*301]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r14, [r13]
	mov qword [rsp+8*433],r8
	mov r8, qword [rsp+8*406]
	mov r15,r8
	mov qword [rsp+8*404],r9
	mov r9,1
	mov r8,r8
	add r8,r9
	mov r10, qword [gbl+8*8]
	mov r9,r10
	mov qword [rsp+8*434],r11
	mov r11,r15
	add r11,1
	shl r11,4
	add r11,r9
	mov [r11],r14
	mov qword [rsp+8*406],r8
	mov qword [rsp+8*438],r9
	mov qword [rsp+8*439],r11
	mov qword [rsp+8*435],r13
	mov qword [rsp+8*436],r14
	mov qword [rsp+8*437],r15
	jmp L_47
	
L_48:
	
L_49:
	mov r8, qword [rsp+8*405]
	mov r9, qword [rsp+8*386]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*440],r10
	mov r8, qword [rsp+8*440]
	cmp r8, 0
	je L_50
	mov r9, qword [rsp+8*405]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov r12, qword [gbl+8*308]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r14, [r13]
	mov qword [rsp+8*441],r8
	mov r8, qword [rsp+8*406]
	mov r15,r8
	mov qword [rsp+8*405],r9
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*406],r8
	mov r9, qword [gbl+8*8]
	mov r8,r9
	mov r10,r15
	add r10,1
	shl r10,4
	add r10,r8
	mov [r10],r14
	mov qword [rsp+8*446],r8
	mov qword [rsp+8*447],r10
	mov qword [rsp+8*442],r11
	mov qword [rsp+8*443],r13
	mov qword [rsp+8*444],r14
	mov qword [rsp+8*445],r15
	jmp L_49
	
L_50:
	mov r8, qword [rsp+8*380]
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
heapsort:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 4368
	mov r9,0
	mov r8,r9
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*448],r8
	mov qword [rsp+8*449],r10
	
L_51:
	mov r8, qword [rsp+8*449]
	mov r9, qword [gbl+8*3]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*450],r10
	mov r8, qword [rsp+8*450]
	cmp r8, 0
	je L_52
	mov r9, qword [gbl+8*8]
	mov r8,r9
	mov r10, qword [rsp+8*449]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r14, qword [gbl+8*454]
	mov r13,r14
	mov r15,r10
	add r15,1
	shl r15,4
	add r15,r13
	mov [r15],r12
	mov qword [rsp+8*451],r8
	mov r8,r10
	mov qword [rsp+8*457],r8
	mov qword [rsp+8*452],r11
	mov qword [rsp+8*453],r12
	mov qword [rsp+8*455],r13
	mov qword [rsp+8*456],r15
	
L_54:
	mov r8, qword [rsp+8*457]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	setne r10B
	mov qword [rsp+8*458],r10
	mov r8, qword [rsp+8*458]
	cmp r8, 0
	je L_55
	mov r9, qword [rsp+8*448]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov r12, qword [gbl+8*454]
	mov r11,r12
	mov r13, qword [rsp+8*457]
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r11
	mov r15, [r14]
	mov qword [rsp+8*459],r8
	mov r8,1
	mov r10,r13
	mov rcx,r8
	shr r10,cl
	mov r8,r12
	mov qword [rsp+8*460],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*464],r8
	mov r8, [r11]
	cmp r15,r8
	mov r10, 0
	setg r10B
	mov qword [rsp+8*466],r8
	mov qword [rsp+8*448],r9
	mov qword [rsp+8*467],r10
	mov qword [rsp+8*465],r11
	mov qword [rsp+8*461],r14
	mov qword [rsp+8*462],r15
	mov r8, qword [rsp+8*467]
	cmp r8, 0
	je L_57
	jmp L_55
	
L_57:
	mov r9, qword [gbl+8*454]
	mov r8,r9
	mov r10, qword [rsp+8*457]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov r14,1
	mov r15,r10
	mov rcx,r14
	shr r15,cl
	mov qword [rsp+8*468],r8
	mov r8,r9
	mov qword [rsp+8*469],r11
	mov r11,r15
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*473],r8
	mov r8, [r11]
	mov qword [rsp+8*474],r11
	mov r11,r9
	mov qword [rsp+8*470],r12
	mov r12,r10
	add r12,1
	shl r12,4
	add r12,r11
	mov [r12],r8
	mov qword [rsp+8*475],r8
	mov r8,1
	mov qword [rsp+8*476],r11
	mov r11,r10
	mov rcx,r8
	shr r11,cl
	mov r8,r9
	mov qword [rsp+8*477],r12
	mov r12,r11
	add r12,1
	shl r12,4
	add r12,r8
	mov [r12],r13
	mov qword [rsp+8*479],r8
	mov r8,1
	mov r11,r10
	mov rcx,r8
	shr r11,cl
	mov r10,r11
	mov qword [rsp+8*457],r10
	mov qword [rsp+8*481],r11
	mov qword [rsp+8*480],r12
	mov qword [rsp+8*471],r13
	mov qword [rsp+8*472],r15
	jmp L_54
	
L_55:
	
L_53:
	mov r9, qword [rsp+8*449]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*482],r8
	mov qword [rsp+8*449],r9
	jmp L_51
	
L_52:
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r11,1
	mov r10,r11
	mov qword [rsp+8*483],r8
	mov qword [rsp+8*449],r10
	
L_58:
	mov r8, qword [rsp+8*449]
	mov r9, qword [gbl+8*3]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*484],r10
	mov r8, qword [rsp+8*484]
	cmp r8, 0
	je L_59
	mov r9, qword [gbl+8*454]
	mov r8,r9
	mov r10,1
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r14, qword [gbl+8*8]
	mov r13,r14
	mov r15, qword [rsp+8*449]
	mov qword [rsp+8*485],r8
	mov r8,r15
	add r8,1
	shl r8,4
	add r8,r13
	mov [r8],r12
	mov qword [rsp+8*489],r8
	mov r10, qword [rsp+8*483]
	mov r8,r10
	mov qword [rsp+8*486],r11
	mov r11,1
	mov r10,r10
	sub r10,r11
	mov r11,r9
	mov qword [rsp+8*487],r12
	mov r12,r8
	add r12,1
	shl r12,4
	add r12,r11
	mov qword [rsp+8*490],r8
	mov r8, [r12]
	mov qword [rsp+8*491],r11
	mov r11,r9
	mov qword [rsp+8*492],r12
	mov r12,1
	mov qword [rsp+8*488],r13
	mov r13,r12
	add r13,1
	shl r13,4
	add r13,r11
	mov [r13],r8
	mov qword [rsp+8*493],r8
	mov qword [rsp+8*494],r11
	mov r11,1
	mov r8,r11
	mov qword [rsp+8*496],r8
	mov qword [rsp+8*483],r10
	mov qword [rsp+8*495],r13
	
L_61:
	mov r8, qword [rsp+8*496]
	mov r9,1
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov r11, qword [rsp+8*483]
	cmp r10,r11
	mov r12, 0
	setle r12B
	mov qword [rsp+8*497],r10
	mov qword [rsp+8*498],r12
	mov r8, qword [rsp+8*498]
	cmp r8, 0
	je L_62
	mov r8, qword [rsp+8*496]
	mov r9,1
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov r11,r10
	mov r12,1
	mov r13,r11
	add r13,r12
	mov r14,r13
	mov r15,r11
	mov r9, qword [rsp+8*483]
	cmp r14,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*504],r10
	mov qword [rsp+8*500],r11
	mov qword [rsp+8*501],r13
	mov qword [rsp+8*502],r14
	mov qword [rsp+8*503],r15
	mov r8, qword [rsp+8*504]
	cmp r8, 0
	je L_64
	mov r9, qword [rsp+8*448]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov r12, qword [gbl+8*454]
	mov r11,r12
	mov r13, qword [rsp+8*502]
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r11
	mov r15, [r14]
	mov qword [rsp+8*505],r8
	mov r8,r12
	mov r10, qword [rsp+8*500]
	mov qword [rsp+8*506],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*509],r8
	mov r8, [r11]
	cmp r15,r8
	mov r10, 0
	setl r10B
	mov qword [rsp+8*511],r8
	mov qword [rsp+8*448],r9
	mov qword [rsp+8*512],r10
	mov qword [rsp+8*510],r11
	mov qword [rsp+8*507],r14
	mov qword [rsp+8*508],r15
	mov r8, qword [rsp+8*512]
	cmp r8, 0
	je L_66
	mov r9, qword [rsp+8*502]
	mov r8,r9
	mov qword [rsp+8*503],r8
	
L_66:
	
L_64:
	mov r9, qword [rsp+8*448]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov r12, qword [gbl+8*454]
	mov r11,r12
	mov r13, qword [rsp+8*496]
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r11
	mov r15, [r14]
	mov qword [rsp+8*513],r8
	mov r8,r12
	mov r10, qword [rsp+8*503]
	mov qword [rsp+8*514],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*517],r8
	mov r8, [r11]
	cmp r15,r8
	mov qword [rsp+8*518],r11
	mov r11, 0
	setl r11B
	mov qword [rsp+8*519],r8
	mov qword [rsp+8*448],r9
	mov qword [rsp+8*520],r11
	mov qword [rsp+8*515],r14
	mov qword [rsp+8*516],r15
	mov r8, qword [rsp+8*520]
	cmp r8, 0
	je L_68
	jmp L_62
	
L_68:
	mov r9, qword [gbl+8*454]
	mov r8,r9
	mov r10, qword [rsp+8*496]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov r14,r9
	mov r15, qword [rsp+8*503]
	mov qword [rsp+8*521],r8
	mov r8,r15
	add r8,1
	shl r8,4
	add r8,r14
	mov qword [rsp+8*522],r11
	mov r11, [r8]
	mov qword [rsp+8*525],r8
	mov r8,r9
	mov qword [rsp+8*523],r12
	mov r12,r10
	add r12,1
	shl r12,4
	add r12,r8
	mov [r12],r11
	mov qword [rsp+8*527],r8
	mov r8,r9
	mov qword [rsp+8*526],r11
	mov r11,r15
	add r11,1
	shl r11,4
	add r11,r8
	mov [r11],r13
	mov r13,r10
	mov r10,r15
	mov r15,r13
	mov qword [rsp+8*529],r8
	mov qword [rsp+8*496],r10
	mov qword [rsp+8*530],r11
	mov qword [rsp+8*528],r12
	mov qword [rsp+8*471],r13
	mov qword [rsp+8*524],r14
	mov qword [rsp+8*503],r15
	jmp L_61
	
L_62:
	
L_60:
	mov r9, qword [rsp+8*449]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*531],r8
	mov qword [rsp+8*449],r9
	jmp L_58
	
L_59:
	mov r8, qword [rsp+8*448]
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
	sub    rsp, 4368
	mov r9,100000
	mov r8,r9
	mov qword [gbl+8*532],r8
	mov     rdi, [gbl+8*532]
	call    mallocArray
	mov     qword [gbl+8*533], rax
	mov r9, qword [gbl+8*533]
	mov r8,r9
	mov qword [gbl+8*8],r8
	mov     rdi, [gbl+8*532]
	call    mallocArray
	mov     qword [gbl+8*534], rax
	mov r9, qword [gbl+8*534]
	mov r8,r9
	mov qword [gbl+8*19],r8
	mov     rdi, [gbl+8*532]
	call    mallocArray
	mov     qword [gbl+8*535], rax
	mov r9, qword [gbl+8*535]
	mov r8,r9
	mov qword [gbl+8*301],r8
	mov     rdi, [gbl+8*532]
	call    mallocArray
	mov     qword [gbl+8*536], rax
	mov r9, qword [gbl+8*536]
	mov r8,r9
	mov qword [gbl+8*308],r8
	mov     rdi, [gbl+8*532]
	call    mallocArray
	mov     qword [gbl+8*537], rax
	mov r9, qword [gbl+8*537]
	mov r8,r9
	mov qword [gbl+8*454],r8
	mov r8, qword [rsp+8*538]
	mov rax,r8
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   6352
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
	

