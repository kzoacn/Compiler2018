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
	sub    rsp, 3632
	        mov     eax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 5616
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	call global_init
	mov r8 , rax
	mov r10,40000
	mov r9,r10
	mov r12,40000
	mov r11,r12
	mov r14,9977
	mov r13,r14
	mov r15,0
	mov rax,r15
	mov qword [rsp+8*1],r8
	mov qword [gbl+8*2],r9
	mov qword [gbl+8*3],r11
	mov qword [gbl+8*4],r13
	        mov     rsp, qword [trsp]
	leave
	ret
	mov r9,1
	mov r8,r9
	mov r10,1
	mov r8,r10
	mov qword [rsp+8*5],r8
	
L_78:
	mov r8,  [rsp+8*5]
	mov r9,  [gbl+8*2]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*6],r10
	mov r8,  [rsp+8*6]
	cmp r8, 0
	je L_79
	mov r9,  [gbl+8*4]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword rsi,r8
	mov qword rdi,r10
	call RandRange
	mov r8 , rax
	mov r10,  [gbl+8*10]
	mov r9,r10
	mov r11,  [rsp+8*5]
	mov r12,r11
	add r12,1
	shl r12,4
	add r12,r9
	mov [r12],r8
	mov qword [rsp+8*9],r8
	mov qword [rsp+8*11],r9
	mov qword [rsp+8*12],r12
	
L_80:
	mov r8,  [rsp+8*5]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*5],r8
	jmp L_78
	
L_79:
	call init
	mov r8 , rax
	mov r10,  [gbl+8*2]
	mov r9,r10
	mov r12,1
	mov r11,r12
	mov r14,1
	mov r13,r14
	mov qword [rsp+8*13],r8
	mov qword [arg+8*2],r9
	mov qword rsi,r11
	mov qword rdi,r13
	call build
	mov r8 , rax
	mov qword [rsp+8*15],r8
	
L_81:
	mov r8,  [gbl+8*3]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setg r10B
	mov qword [rsp+8*16],r10
	mov r8,  [rsp+8*16]
	cmp r8, 0
	je L_82
	call Rand
	mov r8 , rax
	xor rdx, rdx
	mov rax, r8
	mov r9,2
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r11,r10
	mov r13,  [gbl+8*2]
	mov r12,r13
	mov r15,1
	mov r14,r15
	mov qword [rsp+8*17],r8
	mov qword [rsp+8*18],r10
	mov qword [gbl+8*19],r11
	mov qword rsi,r12
	mov qword rdi,r14
	call RandRange
	mov r8 , rax
	mov r9,r8
	mov r11,  [gbl+8*2]
	mov r10,r11
	mov r13,1
	mov r12,r13
	mov qword [rsp+8*20],r8
	mov qword [gbl+8*21],r9
	mov qword rsi,r10
	mov qword rdi,r12
	call RandRange
	mov r8 , rax
	mov r9,r8
	mov qword [rsp+8*22],r8
	mov qword [gbl+8*23],r9
	
L_83:
	mov r8,  [gbl+8*23]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*24],r10
	mov r8,  [rsp+8*24]
	cmp r8, 0
	je L_84
	mov r9,  [gbl+8*2]
	mov r8,r9
	mov r11,1
	mov r10,r11
	mov qword rsi,r8
	mov qword rdi,r10
	call RandRange
	mov r8 , rax
	mov r9,r8
	mov qword [rsp+8*25],r8
	mov qword [gbl+8*23],r9
	jmp L_83
	
L_84:
	mov r8,  [gbl+8*19]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*26],r10
	mov r8,  [rsp+8*26]
	cmp r8, 0
	je L_86
	mov r9,  [gbl+8*2]
	mov r8,r9
	mov r11,1
	mov r10,r11
	mov r13,1
	mov r12,r13
	mov qword [arg+8*2],r8
	mov qword rsi,r10
	mov qword rdi,r12
	call update
	mov r8 , rax
	mov qword [rsp+8*27],r8
	
L_86:
	mov r8,  [gbl+8*19]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*28],r10
	mov r8,  [rsp+8*28]
	cmp r8, 0
	je L_88
	mov r9,  [gbl+8*2]
	mov r8,r9
	mov r11,1
	mov r10,r11
	mov r13,1
	mov r12,r13
	mov qword [arg+8*2],r8
	mov qword rsi,r10
	mov qword rdi,r12
	call query
	mov r8 , rax
	mov r9,  [gbl+8*30]
	mov r10,r9
	add r10,r8
	xor rdx, rdx
	mov rax, r10
	mov r11,  [gbl+8*32]
	mov rbx, r11
	cdq
	idiv rbx
	mov r12, rdx
	mov r9,r12
	mov qword [rsp+8*29],r8
	mov qword [gbl+8*30],r9
	mov qword [rsp+8*31],r10
	mov qword [rsp+8*33],r12
	
L_88:
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,1
	mov r9,r9
	sub r9,r10
	mov qword [rsp+8*34],r8
	mov qword [gbl+8*3],r9
	jmp L_81
	
L_82:
	mov r9,  [gbl+8*30]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*35],r10
	mov     rdi, [rsp+8*35]
	call    toString
	mov     qword[rsp+8*36], rax
	mov r9,  [rsp+8*36]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*37],r10
	mov rdi, format
	mov rsi,[rsp+8*37] 
	add rsi, 1 
	xor rax, rax
	call printf
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
	
square:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 3632
	mov r9,  rdi
	mov r8,r9
	xor rdx, rdx
	mov rax, r8
	mov r10,  [gbl+8*4]
	mov rbx, r10
	cdq
	idiv rbx
	mov r11, rdx
	xor rdx, rdx
	mov rax, r8
	mov rbx, r10
	cdq
	idiv rbx
	mov r12, rdx
	mov r13,r11
	imul r13,r12
	mov rax,r13
	mov qword [rsp+8*38],r8
	mov qword [rsp+8*39],r11
	mov qword [rsp+8*40],r12
	mov qword [rsp+8*41],r13
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
gcd:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 3632
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov r12,0
	cmp r10,r12
	mov r13, 0
	sete r13B
	mov qword [rsp+8*42],r8
	mov qword [rsp+8*43],r10
	mov qword [rsp+8*44],r13
	mov r8,  [rsp+8*44]
	cmp r8, 0
	je L_1
	mov r8,  [rsp+8*42]
	mov rax,r8
	leave
	ret
	
L_1:
	mov r8,  [rsp+8*42]
	mov r9,  [rsp+8*43]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*45],r10
	mov r8,  [rsp+8*45]
	cmp r8, 0
	je L_2
	mov r9,  [rsp+8*42]
	mov r8,r9
	mov r11,  [rsp+8*43]
	mov r10,r11
	mov qword rsi,r8
	mov qword rdi,r10
	call gcd
	mov r8 , rax
	mov rax,r8
	mov qword [rsp+8*46],r8
	leave
	ret
	jmp L_3
	
L_2:
	xor rdx, rdx
	mov r8,  [rsp+8*42]
	mov rax, r8
	mov r9,  [rsp+8*43]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r11,r10
	mov r12,r9
	mov qword [rsp+8*47],r10
	mov qword rsi,r11
	mov qword rdi,r12
	call gcd
	mov r8 , rax
	mov rax,r8
	mov qword [rsp+8*48],r8
	leave
	ret
	
L_3:
	mov r8,0
	mov rax,r8
	leave
	ret
	
lcm:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 3632
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov r11,r10
	mov r9,r8
	mov qword [rsp+8*49],r8
	mov qword rdi,r9
	mov qword [rsp+8*50],r10
	mov qword rsi,r11
	call gcd
	mov r8 , rax
	xor rdx, rdx
	mov r9,  [rsp+8*49]
	mov rax, r9
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rax
	mov r11,  [rsp+8*50]
	mov r12,r10
	imul r12,r11
	mov rax,r12
	mov qword [rsp+8*51],r8
	mov qword [rsp+8*52],r10
	mov qword [rsp+8*53],r12
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
Rand:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 3632
	mov r9,1
	mov r8,r9
	mov r10,1
	mov r8,r10
	mov qword [rsp+8*54],r8
	
L_4:
	mov r8,  [rsp+8*54]
	mov r9,3
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*55],r10
	mov r8,  [rsp+8*55]
	cmp r8, 0
	je L_5
	mov r8,  [gbl+8*56]
	mov r9,  [gbl+8*57]
	mov r10,r8
	imul r10,r9
	mov r11,  [gbl+8*59]
	mov r12,r10
	add r12,r11
	xor rdx, rdx
	mov rax, r12
	mov r13,  [gbl+8*32]
	mov rbx, r13
	cdq
	idiv rbx
	mov r14, rdx
	mov r8,r14
	mov qword [gbl+8*56],r8
	mov qword [rsp+8*58],r10
	mov qword [rsp+8*60],r12
	mov qword [rsp+8*61],r14
	
L_6:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*62],r8
	mov qword [rsp+8*54],r9
	jmp L_4
	
L_5:
	mov r8,  [gbl+8*56]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*63],r10
	mov r8,  [rsp+8*63]
	cmp r8, 0
	je L_8
	mov r8,  [gbl+8*56]
	mov r9,r8
	neg r9
	mov r8,r9
	mov qword [gbl+8*56],r8
	mov qword [rsp+8*64],r9
	
L_8:
	mov r8,  [gbl+8*56]
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
RandRange:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 3632
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov qword [rsp+8*65],r8
	mov qword [rsp+8*66],r10
	call Rand
	mov r8 , rax
	mov r9,  [rsp+8*66]
	mov r10,  [rsp+8*65]
	mov r11,r9
	sub r11,r10
	mov r12,1
	mov r13,r11
	add r13,r12
	xor rdx, rdx
	mov rax, r8
	mov rbx, r13
	cdq
	idiv rbx
	mov r14, rdx
	mov r15,r10
	add r15,r14
	mov qword [rsp+8*67],r8
	mov r8,1
	mov r9,r15
	add r9,r8
	mov rax,r9
	mov qword [rsp+8*72],r9
	mov qword [rsp+8*68],r11
	mov qword [rsp+8*69],r13
	mov qword [rsp+8*70],r14
	mov qword [rsp+8*71],r15
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 3632
	mov     rdi, 140005
	call    mallocArray
	mov     qword [rsp+8*73], rax
	mov r9,  [rsp+8*73]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov r13,0
	mov r12,r13
	mov r14,2
	mov r10,r14
	mov qword [rsp+8*74],r8
	mov qword [rsp+8*75],r10
	mov qword [rsp+8*76],r12
	
L_9:
	mov r8,  [rsp+8*75]
	mov r9,  [gbl+8*4]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*77],r10
	mov r8,  [rsp+8*77]
	cmp r8, 0
	je L_10
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,  [rsp+8*75]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov [r11],r10
	mov qword [rsp+8*78],r8
	mov qword [rsp+8*79],r11
	
L_11:
	mov r8,  [rsp+8*75]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*75],r8
	jmp L_9
	
L_10:
	mov r9,2
	mov r8,r9
	mov qword [rsp+8*75],r8
	
L_12:
	mov r8,  [rsp+8*75]
	mov r9,  [gbl+8*4]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*80],r10
	mov r8,  [rsp+8*80]
	cmp r8, 0
	je L_13
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*76],r8
	
L_15:
	mov r8,  [rsp+8*76]
	mov r9,15
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*81],r10
	mov r8,  [rsp+8*81]
	cmp r8, 0
	je L_16
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,  [rsp+8*75]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov qword [rsp+8*82],r8
	mov qword [rsp+8*83],r11
	mov qword [rsp+8*84],r12
	mov qword rdi,r13
	call square
	mov r8 , rax
	xor rdx, rdx
	mov rax, r8
	mov r9,  [gbl+8*4]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r12,  [rsp+8*74]
	mov r11,r12
	mov r13,  [rsp+8*75]
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r11
	mov [r14],r10
	mov qword [rsp+8*85],r8
	mov qword [rsp+8*86],r10
	mov qword [rsp+8*87],r11
	mov qword [rsp+8*88],r14
	
L_17:
	mov r8,  [rsp+8*76]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*76],r8
	jmp L_15
	
L_16:
	
L_14:
	mov r8,  [rsp+8*75]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*75],r8
	jmp L_12
	
L_13:
	mov r9,2
	mov r8,r9
	mov qword [rsp+8*75],r8
	
L_18:
	mov r8,  [rsp+8*75]
	mov r9,  [gbl+8*4]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*89],r10
	mov r8,  [rsp+8*89]
	cmp r8, 0
	je L_19
	mov r9,  [rsp+8*74]
	mov r8,r9
	mov r10,  [rsp+8*75]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov r15,1
	mov r14,r15
	mov qword [rsp+8*90],r8
	mov qword [rsp+8*91],r11
	mov qword [rsp+8*92],r12
	mov qword [rsp+8*93],r13
	mov qword [rsp+8*94],r14
	
L_21:
	mov r9,  [rsp+8*93]
	mov r8,r9
	mov qword rdi,r8
	call square
	mov r8 , rax
	xor rdx, rdx
	mov rax, r8
	mov r9,  [gbl+8*4]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r11,r10
	mov r13,  [gbl+8*97]
	mov r12,r13
	mov r14,r11
	add r14,1
	shl r14,4
	add r14,r12
	mov r15,1
	mov [r14],r15
	mov qword [rsp+8*95],r8
	mov r10,  [rsp+8*74]
	mov r8,r10
	mov r10,  [rsp+8*75]
	mov qword [rsp+8*98],r12
	mov r12,r10
	add r12,1
	shl r12,4
	add r12,r8
	mov qword [rsp+8*100],r8
	mov r8, [r12]
	cmp r11,r8
	mov qword [rsp+8*101],r12
	mov r12, 0
	sete r12B
	mov qword [rsp+8*102],r8
	mov qword [rsp+8*93],r11
	mov qword [rsp+8*103],r12
	mov qword [rsp+8*99],r14
	mov r8,  [rsp+8*103]
	cmp r8, 0
	je L_25
	jmp L_22
	
L_25:
	
L_23:
	mov r8,  [rsp+8*94]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*94],r8
	jmp L_21
	
L_22:
	mov r9,  [rsp+8*94]
	mov r8,r9
	mov r11,  [gbl+8*104]
	mov r10,r11
	mov qword rsi,r8
	mov qword rdi,r10
	call lcm
	mov r8 , rax
	mov r9,r8
	mov qword [rsp+8*105],r8
	mov qword [gbl+8*104],r9
	
L_20:
	mov r8,  [rsp+8*75]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*75],r8
	jmp L_18
	
L_19:
	mov r9,  [gbl+8*97]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,1
	mov [r11],r12
	mov r13,r9
	mov r14,1
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*106],r8
	mov r8,1
	mov [r15],r8
	mov r8,0
	mov rax,r8
	mov qword [rsp+8*107],r11
	mov qword [rsp+8*108],r13
	mov qword [rsp+8*109],r15
	leave
	ret
	
build:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 3632
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov r13,  [arg+8*2]
	mov r12,r13
	mov r15,0
	mov r14,r15
	cmp r10,r12
	mov r15, 0
	sete r15B
	mov qword [rsp+8*110],r8
	mov qword [rsp+8*111],r10
	mov qword [rsp+8*112],r12
	mov qword [rsp+8*113],r14
	mov qword [rsp+8*114],r15
	mov r8,  [rsp+8*114]
	cmp r8, 0
	je L_26
	mov r9,  [gbl+8*10]
	mov r8,r9
	mov r10,  [rsp+8*111]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r14,  [gbl+8*118]
	mov r13,r14
	mov r15,  [rsp+8*110]
	mov qword [rsp+8*115],r8
	mov r8,r15
	add r8,1
	shl r8,4
	add r8,r13
	mov [r8],r12
	mov qword [rsp+8*120],r8
	mov r8,r9
	mov qword [rsp+8*116],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*121],r8
	mov r8, [r11]
	mov qword [rsp+8*122],r11
	mov r11,  [gbl+8*4]
	cmp r8,r11
	mov qword [rsp+8*117],r12
	mov r12, 0
	setl r12B
	mov qword [rsp+8*123],r8
	mov qword [rsp+8*124],r12
	mov qword [rsp+8*119],r13
	mov r8,  [rsp+8*124]
	cmp r8, 0
	jne L_28
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*125],r8
	jmp L_29
	
L_28:
	mov r9,  [gbl+8*10]
	mov r8,r9
	mov r10,  [rsp+8*111]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,0
	cmp r12,r13
	mov r14, 0
	setge r14B
	mov qword [rsp+8*126],r8
	mov qword [rsp+8*127],r11
	mov qword [rsp+8*128],r12
	mov qword [rsp+8*129],r14
	mov r9,  [rsp+8*129]
	mov r8,r9
	mov qword [rsp+8*125],r8
	
L_29:
	mov r8,  [rsp+8*125]
	cmp r8, 0
	jne L_30
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*130],r8
	jmp L_31
	
L_30:
	mov r9,  [gbl+8*10]
	mov r8,r9
	mov r10,  [rsp+8*111]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	xor rdx, rdx
	mov rax, r12
	mov r13,  [gbl+8*4]
	mov rbx, r13
	cdq
	idiv rbx
	mov r14, rdx
	mov qword [rsp+8*131],r8
	mov r8,  [gbl+8*97]
	mov r15,r8
	mov qword [rsp+8*132],r11
	mov r11,r14
	add r11,1
	shl r11,4
	add r11,r15
	mov qword [rsp+8*133],r12
	mov r12, [r11]
	mov qword [rsp+8*136],r11
	mov r11,0
	cmp r12,r11
	mov r14, 0
	setg r14B
	mov qword [rsp+8*137],r12
	mov qword [rsp+8*138],r14
	mov qword [rsp+8*135],r15
	mov r9,  [rsp+8*138]
	mov r8,r9
	mov qword [rsp+8*130],r8
	
L_31:
	mov r8,  [rsp+8*130]
	cmp r8, 0
	je L_33
	mov r9,  [gbl+8*139]
	mov r8,r9
	mov r10,  [rsp+8*110]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,1
	mov [r11],r12
	mov r14,  [gbl+8*10]
	mov r13,r14
	mov r15,  [rsp+8*111]
	mov qword [rsp+8*140],r8
	mov r8,r15
	add r8,1
	shl r8,4
	add r8,r13
	mov qword [rsp+8*141],r11
	mov r11, [r8]
	mov qword [rsp+8*143],r8
	mov r12,  [gbl+8*145]
	mov r8,r12
	mov qword [rsp+8*142],r13
	mov r13,r10
	add r13,1
	shl r13,4
	add r13,r8
	mov r8, [r13]
	mov r12,0
	mov r13,r12
	add r13,1
	shl r13,4
	add r13,r8
	mov [r13],r11
	mov qword [rsp+8*146],r8
	mov qword [rsp+8*144],r11
	mov r11,1
	mov r8,r11
	mov qword [rsp+8*113],r8
	mov qword [rsp+8*147],r13
	
L_34:
	mov r8,  [rsp+8*113]
	mov r9,  [gbl+8*104]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*148],r10
	mov r8,  [rsp+8*148]
	cmp r8, 0
	je L_35
	mov r8,  [rsp+8*113]
	mov r9,1
	mov r10,r8
	sub r10,r9
	mov r12,  [gbl+8*145]
	mov r11,r12
	mov r13,  [rsp+8*110]
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
	mov r9,r15
	mov qword rdi,r9
	mov qword [rsp+8*149],r10
	mov qword [rsp+8*150],r11
	mov qword [rsp+8*151],r14
	mov qword [rsp+8*152],r15
	call square
	mov r8 , rax
	xor rdx, rdx
	mov rax, r8
	mov r9,  [gbl+8*4]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r12,  [gbl+8*145]
	mov r11,r12
	mov r13,  [rsp+8*110]
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r11
	mov r11, [r14]
	mov r15,  [rsp+8*113]
	mov r14,r15
	add r14,1
	shl r14,4
	add r14,r11
	mov [r14],r10
	mov qword [rsp+8*153],r8
	mov qword [rsp+8*154],r10
	mov qword [rsp+8*155],r11
	mov qword [rsp+8*156],r14
	
L_36:
	mov r8,  [rsp+8*113]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*113],r8
	jmp L_34
	
L_35:
	
L_33:
	mov r9,  [gbl+8*157]
	mov r8,r9
	mov r10,  [rsp+8*110]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,0
	mov [r11],r12
	mov qword [rsp+8*158],r8
	mov qword [rsp+8*159],r11
	jmp L_27
	
L_26:
	mov r8,  [rsp+8*110]
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
	mov r9,r15
	mov r10,  [rsp+8*111]
	mov r12,  [rsp+8*112]
	mov r13,r10
	add r13,r12
	xor rdx, rdx
	mov rax, r13
	mov r14,2
	mov rbx, r14
	cdq
	idiv rbx
	mov r15, rax
	mov r13,r15
	mov r14,r13
	mov r15,r10
	mov r10,r11
	mov qword [rsp+8*164],r9
	mov qword rdi,r10
	mov qword [rsp+8*161],r11
	mov qword [rsp+8*167],r13
	mov qword [arg+8*2],r14
	mov qword rsi,r15
	call build
	mov r8 , rax
	mov r9,  [rsp+8*167]
	mov r10,1
	mov r11,r9
	add r11,r10
	mov r13,  [rsp+8*112]
	mov r12,r13
	mov r14,r11
	mov qword [rsp+8*168],r8
	mov r8,  [rsp+8*164]
	mov r15,r8
	mov qword [rsp+8*169],r11
	mov qword [arg+8*2],r12
	mov qword rsi,r14
	mov qword rdi,r15
	call build
	mov r8 , rax
	mov r10,  [gbl+8*118]
	mov r9,r10
	mov r11,  [rsp+8*161]
	mov r12,r11
	add r12,1
	shl r12,4
	add r12,r9
	mov r13, [r12]
	mov r14,r10
	mov r15,  [rsp+8*164]
	mov qword [rsp+8*170],r8
	mov r8,r15
	add r8,1
	shl r8,4
	add r8,r14
	mov qword [rsp+8*171],r9
	mov r9, [r8]
	mov qword [rsp+8*175],r8
	mov r8,r13
	add r8,r9
	mov qword [rsp+8*176],r9
	mov r9,r10
	mov qword [rsp+8*172],r12
	mov r12,  [rsp+8*110]
	mov qword [rsp+8*173],r13
	mov r13,r12
	add r13,1
	shl r13,4
	add r13,r9
	mov [r13],r8
	mov qword [rsp+8*178],r9
	mov r9,  [gbl+8*139]
	mov r8,r9
	mov qword [rsp+8*179],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*180],r8
	mov r8, [r13]
	mov qword [rsp+8*181],r13
	mov r13,r9
	mov qword [rsp+8*174],r14
	mov r14,r15
	add r14,1
	shl r14,4
	add r14,r13
	mov qword [rsp+8*183],r13
	mov r13, [r14]
	mov qword [rsp+8*184],r14
	mov r14,r8
	and r14,r13
	mov qword [rsp+8*182],r8
	mov r8,r9
	mov qword [rsp+8*185],r13
	mov r13,r12
	add r13,1
	shl r13,4
	add r13,r8
	mov [r13],r14
	mov qword [rsp+8*187],r8
	mov r8,r9
	mov qword [rsp+8*188],r13
	mov r13,r12
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*189],r8
	mov r8, [r13]
	mov qword [rsp+8*190],r13
	mov r13,0
	cmp r8,r13
	mov r14, 0
	setg r14B
	mov qword [rsp+8*191],r8
	mov qword [rsp+8*192],r14
	mov r8,  [rsp+8*192]
	cmp r8, 0
	je L_38
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*113],r8
	
L_39:
	mov r8,  [rsp+8*113]
	mov r9,  [gbl+8*104]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*193],r10
	mov r8,  [rsp+8*193]
	cmp r8, 0
	je L_40
	mov r9,  [gbl+8*145]
	mov r8,r9
	mov r10,  [rsp+8*161]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*113]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov r14,r9
	mov r15,  [rsp+8*164]
	mov qword [rsp+8*194],r8
	mov r8,r15
	add r8,1
	shl r8,4
	add r8,r14
	mov r14, [r8]
	mov r8,r12
	add r8,1
	shl r8,4
	add r8,r14
	mov r10, [r8]
	mov qword [rsp+8*198],r8
	mov r8,r13
	add r8,r10
	mov qword [rsp+8*199],r10
	mov r10,r9
	mov qword [rsp+8*195],r11
	mov r11,  [rsp+8*110]
	mov qword [rsp+8*196],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r10
	mov r10, [r13]
	mov r13,r12
	add r13,1
	shl r13,4
	add r13,r10
	mov [r13],r8
	mov qword [rsp+8*200],r8
	mov qword [rsp+8*201],r10
	mov qword [rsp+8*202],r13
	mov qword [rsp+8*197],r14
	
L_41:
	mov r8,  [rsp+8*113]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*113],r8
	jmp L_39
	
L_40:
	mov r9,  [gbl+8*157]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,0
	mov [r11],r12
	mov qword [rsp+8*203],r8
	mov qword [rsp+8*204],r11
	
L_38:
	
L_27:
	mov r8,0
	mov rax,r8
	leave
	ret
	
pushdown:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 3632
	mov r9,  rdi
	mov r8,r9
	mov r11,  [gbl+8*206]
	mov r10,r11
	mov r12,r8
	add r12,1
	shl r12,4
	add r12,r10
	mov r13, [r12]
	mov r14,0
	cmp r13,r14
	mov r15, 0
	setg r15B
	mov qword [rsp+8*205],r8
	mov qword [rsp+8*207],r10
	mov qword [rsp+8*208],r12
	mov qword [rsp+8*209],r13
	mov qword [rsp+8*210],r15
	mov r8,  [rsp+8*210]
	cmp r8, 0
	je L_43
	mov r8,  [rsp+8*205]
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
	mov r9,r15
	mov r12,  [gbl+8*157]
	mov r10,r12
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r10
	mov qword [rsp+8*216],r10
	mov r10, [r13]
	mov qword [rsp+8*217],r13
	mov r14,  [gbl+8*206]
	mov r13,r14
	mov r15,r8
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*219],r13
	mov r13, [r15]
	mov qword [rsp+8*220],r15
	mov r15,r10
	add r15,r13
	xor rdx, rdx
	mov rax, r15
	mov qword [rsp+8*218],r10
	mov r10,  [gbl+8*104]
	mov rbx, r10
	cdq
	idiv rbx
	mov qword [rsp+8*221],r13
	mov r13, rdx
	mov r15,r12
	mov r10,r11
	add r10,1
	shl r10,4
	add r10,r15
	mov [r10],r13
	mov qword [rsp+8*225],r10
	mov r10,r12
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r10
	mov qword [rsp+8*226],r10
	mov r10, [r13]
	mov qword [rsp+8*227],r13
	mov qword [rsp+8*224],r15
	mov r15,  [gbl+8*145]
	mov r13,r15
	mov r15,r11
	add r15,1
	shl r15,4
	add r15,r13
	mov r13, [r15]
	mov r15,r10
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*228],r10
	mov r10, [r15]
	mov qword [rsp+8*229],r13
	mov qword [rsp+8*230],r15
	mov r15,  [gbl+8*118]
	mov r13,r15
	mov r15,r11
	add r15,1
	shl r15,4
	add r15,r13
	mov [r15],r10
	mov qword [rsp+8*231],r10
	mov r10,r14
	mov qword [rsp+8*232],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r10
	mov qword [rsp+8*234],r10
	mov r10, [r13]
	mov qword [rsp+8*235],r13
	mov r13,r14
	mov qword [rsp+8*233],r15
	mov r15,r8
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*237],r13
	mov r13, [r15]
	mov qword [rsp+8*238],r15
	mov r15,r10
	add r15,r13
	xor rdx, rdx
	mov rax, r15
	mov qword [rsp+8*236],r10
	mov r10,  [gbl+8*104]
	mov rbx, r10
	cdq
	idiv rbx
	mov qword [rsp+8*239],r13
	mov r13, rdx
	mov r15,r14
	mov r10,r11
	add r10,1
	shl r10,4
	add r10,r15
	mov [r10],r13
	mov qword [rsp+8*243],r10
	mov r10,r12
	mov qword [rsp+8*212],r11
	mov r11,r9
	add r11,1
	shl r11,4
	add r11,r10
	mov qword [rsp+8*244],r10
	mov r10, [r11]
	mov qword [rsp+8*245],r11
	mov r11,r14
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov qword [rsp+8*247],r11
	mov r11, [r13]
	mov qword [rsp+8*248],r13
	mov r13,r10
	add r13,r11
	xor rdx, rdx
	mov rax, r13
	mov qword [rsp+8*246],r10
	mov r10,  [gbl+8*104]
	mov rbx, r10
	cdq
	idiv rbx
	mov qword [rsp+8*249],r11
	mov r11, rdx
	mov r13,r12
	mov qword [rsp+8*242],r15
	mov r15,r9
	add r15,1
	shl r15,4
	add r15,r13
	mov [r15],r11
	mov r11,r12
	mov qword [rsp+8*252],r13
	mov r13,r9
	add r13,1
	shl r13,4
	add r13,r11
	mov qword [rsp+8*254],r11
	mov r11, [r13]
	mov qword [rsp+8*255],r13
	mov qword [rsp+8*253],r15
	mov r15,  [gbl+8*145]
	mov r13,r15
	mov r15,r9
	add r15,1
	shl r15,4
	add r15,r13
	mov r13, [r15]
	mov r15,r11
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*256],r11
	mov r11, [r15]
	mov qword [rsp+8*257],r13
	mov qword [rsp+8*258],r15
	mov r15,  [gbl+8*118]
	mov r13,r15
	mov r15,r9
	add r15,1
	shl r15,4
	add r15,r13
	mov [r15],r11
	mov qword [rsp+8*259],r11
	mov r11,r14
	mov qword [rsp+8*260],r13
	mov r13,r9
	add r13,1
	shl r13,4
	add r13,r11
	mov qword [rsp+8*262],r11
	mov r11, [r13]
	mov qword [rsp+8*263],r13
	mov r13,r14
	mov qword [rsp+8*261],r15
	mov r15,r8
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*265],r13
	mov r13, [r15]
	mov qword [rsp+8*266],r15
	mov r15,r11
	add r15,r13
	xor rdx, rdx
	mov rax, r15
	mov rbx, r10
	cdq
	idiv rbx
	mov qword [rsp+8*264],r11
	mov r11, rdx
	mov qword [rsp+8*267],r13
	mov r13,r14
	mov r15,r9
	add r15,1
	shl r15,4
	add r15,r13
	mov [r15],r11
	mov qword [rsp+8*215],r9
	mov r9,r14
	mov r11,r8
	add r11,1
	shl r11,4
	add r11,r9
	mov r8,0
	mov [r11],r8
	mov qword [rsp+8*272],r9
	mov qword [rsp+8*273],r11
	mov qword [rsp+8*270],r13
	mov qword [rsp+8*271],r15
	
L_43:
	mov r8,0
	mov rax,r8
	leave
	ret
	
update:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 3632
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov r13,  [arg+8*2]
	mov r12,r13
	mov r14,  [gbl+8*21]
	cmp r14,r10
	mov r15, 0
	setle r15B
	mov qword [rsp+8*274],r8
	mov qword [rsp+8*275],r10
	mov qword [rsp+8*276],r12
	mov qword [rsp+8*277],r15
	mov r8,  [rsp+8*277]
	cmp r8, 0
	jne L_44
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*278],r8
	jmp L_45
	
L_44:
	mov r8,  [gbl+8*23]
	mov r9,  [rsp+8*276]
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*279],r10
	mov r9,  [rsp+8*279]
	mov r8,r9
	mov qword [rsp+8*278],r8
	
L_45:
	mov r8,  [rsp+8*278]
	cmp r8, 0
	jne L_46
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*280],r8
	jmp L_47
	
L_46:
	mov r9,  [gbl+8*139]
	mov r8,r9
	mov r10,  [rsp+8*274]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,0
	cmp r12,r13
	mov r14, 0
	setg r14B
	mov qword [rsp+8*281],r8
	mov qword [rsp+8*282],r11
	mov qword [rsp+8*283],r12
	mov qword [rsp+8*284],r14
	mov r9,  [rsp+8*284]
	mov r8,r9
	mov qword [rsp+8*280],r8
	
L_47:
	mov r8,  [rsp+8*280]
	cmp r8, 0
	je L_49
	mov r9,  [gbl+8*157]
	mov r8,r9
	mov r10,  [rsp+8*274]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,1
	mov r14,r12
	add r14,r13
	xor rdx, rdx
	mov rax, r14
	mov r15,  [gbl+8*104]
	mov rbx, r15
	cdq
	idiv rbx
	mov qword [rsp+8*285],r8
	mov r8, rdx
	mov qword [rsp+8*286],r11
	mov r11,r9
	mov qword [rsp+8*287],r12
	mov r12,r10
	add r12,1
	shl r12,4
	add r12,r11
	mov [r12],r8
	mov r8,r9
	mov qword [rsp+8*290],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*292],r8
	mov r8, [r11]
	mov qword [rsp+8*293],r11
	mov qword [rsp+8*291],r12
	mov r12,  [gbl+8*145]
	mov r11,r12
	mov r13,r10
	add r13,1
	shl r13,4
	add r13,r11
	mov r11, [r13]
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov qword [rsp+8*294],r8
	mov r8, [r13]
	mov qword [rsp+8*295],r11
	mov qword [rsp+8*296],r13
	mov r13,  [gbl+8*118]
	mov r11,r13
	mov r14,r10
	add r14,1
	shl r14,4
	add r14,r11
	mov [r14],r8
	mov qword [rsp+8*297],r8
	mov qword [rsp+8*298],r11
	mov r11,  [gbl+8*206]
	mov r8,r11
	mov qword [rsp+8*299],r14
	mov r14,r10
	add r14,1
	shl r14,4
	add r14,r8
	mov qword [rsp+8*300],r8
	mov r8, [r14]
	mov qword [rsp+8*301],r14
	mov r14,1
	mov r13,r8
	add r13,r14
	xor rdx, rdx
	mov rax, r13
	mov rbx, r15
	cdq
	idiv rbx
	mov qword [rsp+8*302],r8
	mov r8, rdx
	mov r13,r11
	mov r14,r10
	add r14,1
	shl r14,4
	add r14,r13
	mov [r14],r8
	mov r8,0
	mov rax,r8
	mov qword [rsp+8*305],r13
	mov qword [rsp+8*306],r14
	leave
	ret
	
L_49:
	mov r8,  [rsp+8*275]
	mov r9,  [rsp+8*276]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*307],r10
	mov r8,  [rsp+8*307]
	cmp r8, 0
	je L_51
	mov r9,  [gbl+8*118]
	mov r8,r9
	mov r10,  [rsp+8*274]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov qword [rsp+8*308],r8
	mov qword [rsp+8*309],r11
	mov qword [rsp+8*310],r12
	mov qword rdi,r13
	call square
	mov r8 , rax
	xor rdx, rdx
	mov rax, r8
	mov r9,  [gbl+8*4]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r12,  [gbl+8*118]
	mov r11,r12
	mov r13,  [rsp+8*274]
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r11
	mov [r14],r10
	mov r15,r12
	mov qword [rsp+8*311],r8
	mov r8,r13
	add r8,1
	shl r8,4
	add r8,r15
	mov r10, [r8]
	mov qword [rsp+8*316],r8
	mov qword [rsp+8*313],r11
	mov r11,  [gbl+8*97]
	mov r8,r11
	mov qword [rsp+8*314],r14
	mov r14,r10
	add r14,1
	shl r14,4
	add r14,r8
	mov qword [rsp+8*318],r8
	mov r8, [r14]
	mov qword [rsp+8*317],r10
	mov r10,0
	cmp r8,r10
	mov qword [rsp+8*319],r14
	mov r14, 0
	setg r14B
	mov qword [rsp+8*320],r8
	mov qword [rsp+8*321],r14
	mov qword [rsp+8*315],r15
	mov r8,  [rsp+8*321]
	cmp r8, 0
	je L_53
	mov r9,  [gbl+8*139]
	mov r8,r9
	mov r10,  [rsp+8*274]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,1
	mov [r11],r12
	mov r14,  [gbl+8*118]
	mov r13,r14
	mov r15,r10
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*322],r8
	mov r8, [r15]
	mov qword [rsp+8*323],r11
	mov r12,  [gbl+8*145]
	mov r11,r12
	mov qword [rsp+8*324],r13
	mov r13,r10
	add r13,1
	shl r13,4
	add r13,r11
	mov r11, [r13]
	mov qword [rsp+8*325],r15
	mov r15,0
	mov r13,r15
	add r13,1
	shl r13,4
	add r13,r11
	mov [r13],r8
	mov qword [rsp+8*326],r8
	mov qword [rsp+8*327],r11
	mov r11,0
	mov r8,r11
	mov r11,1
	mov r8,r11
	mov qword [rsp+8*329],r8
	mov qword [rsp+8*328],r13
	
L_54:
	mov r8,  [rsp+8*329]
	mov r9,  [gbl+8*104]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*330],r10
	mov r8,  [rsp+8*330]
	cmp r8, 0
	je L_55
	mov r8,  [rsp+8*329]
	mov r9,1
	mov r10,r8
	sub r10,r9
	mov r12,  [gbl+8*145]
	mov r11,r12
	mov r13,  [rsp+8*274]
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
	mov r9,r15
	mov qword rdi,r9
	mov qword [rsp+8*331],r10
	mov qword [rsp+8*332],r11
	mov qword [rsp+8*333],r14
	mov qword [rsp+8*334],r15
	call square
	mov r8 , rax
	xor rdx, rdx
	mov rax, r8
	mov r9,  [gbl+8*4]
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r12,  [gbl+8*145]
	mov r11,r12
	mov r13,  [rsp+8*274]
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r11
	mov r11, [r14]
	mov r15,  [rsp+8*329]
	mov r14,r15
	add r14,1
	shl r14,4
	add r14,r11
	mov [r14],r10
	mov qword [rsp+8*335],r8
	mov qword [rsp+8*336],r10
	mov qword [rsp+8*337],r11
	mov qword [rsp+8*338],r14
	
L_56:
	mov r8,  [rsp+8*329]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*329],r8
	jmp L_54
	
L_55:
	
L_53:
	mov r8,0
	mov rax,r8
	leave
	ret
	
L_51:
	mov r9,  [gbl+8*206]
	mov r8,r9
	mov r10,  [rsp+8*274]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,0
	cmp r12,r13
	mov r14, 0
	setg r14B
	mov qword [rsp+8*339],r8
	mov qword [rsp+8*340],r11
	mov qword [rsp+8*341],r12
	mov qword [rsp+8*342],r14
	mov r8,  [rsp+8*342]
	cmp r8, 0
	je L_58
	mov r9,  [rsp+8*274]
	mov r8,r9
	mov qword rdi,r8
	call pushdown
	mov r8 , rax
	mov qword [rsp+8*343],r8
	
L_58:
	mov r8,  [rsp+8*274]
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
	mov r9,r15
	mov r10,  [rsp+8*275]
	mov r12,  [rsp+8*276]
	mov r13,r10
	add r13,r12
	xor rdx, rdx
	mov rax, r13
	mov r14,2
	mov rbx, r14
	cdq
	idiv rbx
	mov r15, rax
	mov r13,r15
	mov r14,  [gbl+8*21]
	cmp r14,r13
	mov r15, 0
	setle r15B
	mov qword [rsp+8*348],r9
	mov qword [rsp+8*345],r11
	mov qword [rsp+8*351],r13
	mov qword [rsp+8*352],r15
	mov r8,  [rsp+8*352]
	cmp r8, 0
	je L_60
	mov r9,  [rsp+8*351]
	mov r8,r9
	mov r11,  [rsp+8*275]
	mov r10,r11
	mov r13,  [rsp+8*345]
	mov r12,r13
	mov qword [arg+8*2],r8
	mov qword rsi,r10
	mov qword rdi,r12
	call update
	mov r8 , rax
	mov qword [rsp+8*353],r8
	
L_60:
	mov r8,  [rsp+8*351]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r11,  [gbl+8*23]
	cmp r11,r10
	mov r12, 0
	setge r12B
	mov qword [rsp+8*354],r10
	mov qword [rsp+8*355],r12
	mov r8,  [rsp+8*355]
	cmp r8, 0
	je L_62
	mov r8,  [rsp+8*351]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r12,  [rsp+8*276]
	mov r11,r12
	mov r13,r10
	mov r15,  [rsp+8*348]
	mov r14,r15
	mov qword [rsp+8*356],r10
	mov qword [arg+8*2],r11
	mov qword rsi,r13
	mov qword rdi,r14
	call update
	mov r8 , rax
	mov qword [rsp+8*357],r8
	
L_62:
	mov r9,  [gbl+8*118]
	mov r8,r9
	mov r10,  [rsp+8*345]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,  [rsp+8*348]
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*358],r8
	mov r8, [r15]
	mov qword [rsp+8*359],r11
	mov r11,r12
	add r11,r8
	mov qword [rsp+8*363],r8
	mov r8,r9
	mov qword [rsp+8*360],r12
	mov r12,  [rsp+8*274]
	mov qword [rsp+8*361],r13
	mov r13,r12
	add r13,1
	shl r13,4
	add r13,r8
	mov [r13],r11
	mov qword [rsp+8*365],r8
	mov r11,  [gbl+8*139]
	mov r8,r11
	mov qword [rsp+8*366],r13
	mov r13,r10
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*367],r8
	mov r8, [r13]
	mov qword [rsp+8*368],r13
	mov r13,r11
	mov qword [rsp+8*362],r15
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*370],r13
	mov r13, [r15]
	mov qword [rsp+8*371],r15
	mov r15,r8
	and r15,r13
	mov qword [rsp+8*369],r8
	mov r8,r11
	mov qword [rsp+8*372],r13
	mov r13,r12
	add r13,1
	shl r13,4
	add r13,r8
	mov [r13],r15
	mov qword [rsp+8*374],r8
	mov r8,r11
	mov qword [rsp+8*375],r13
	mov r13,r12
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*376],r8
	mov r8, [r13]
	mov qword [rsp+8*377],r13
	mov r13,0
	cmp r8,r13
	mov r15, 0
	setg r15B
	mov qword [rsp+8*378],r8
	mov qword [rsp+8*379],r15
	mov r8,  [rsp+8*379]
	cmp r8, 0
	je L_64
	mov r9,0
	mov r8,r9
	mov r10,0
	mov r8,r10
	mov qword [rsp+8*380],r8
	
L_65:
	mov r8,  [rsp+8*380]
	mov r9,  [gbl+8*104]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*381],r10
	mov r8,  [rsp+8*381]
	cmp r8, 0
	je L_66
	mov r9,  [gbl+8*157]
	mov r8,r9
	mov r10,  [rsp+8*345]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,  [rsp+8*380]
	mov r14,r13
	add r14,r12
	xor rdx, rdx
	mov rax, r14
	mov r15,  [gbl+8*104]
	mov rbx, r15
	cdq
	idiv rbx
	mov qword [rsp+8*382],r8
	mov r8, rdx
	mov qword [rsp+8*383],r11
	mov qword [rsp+8*384],r12
	mov r12,  [gbl+8*145]
	mov r11,r12
	mov r14,r10
	add r14,1
	shl r14,4
	add r14,r11
	mov r11, [r14]
	mov r14,r8
	add r14,1
	shl r14,4
	add r14,r11
	mov r8, [r14]
	mov r10,r9
	mov qword [rsp+8*387],r11
	mov r11,  [rsp+8*348]
	mov qword [rsp+8*388],r14
	mov r14,r11
	add r14,1
	shl r14,4
	add r14,r10
	mov qword [rsp+8*390],r10
	mov r10, [r14]
	mov qword [rsp+8*391],r14
	mov r14,r13
	add r14,r10
	xor rdx, rdx
	mov rax, r14
	mov rbx, r15
	cdq
	idiv rbx
	mov qword [rsp+8*392],r10
	mov r10, rdx
	mov r14,r12
	mov r12,r11
	add r12,1
	shl r12,4
	add r12,r14
	mov r14, [r12]
	mov r12,r10
	add r12,1
	shl r12,4
	add r12,r14
	mov r10, [r12]
	mov r11,r8
	add r11,r10
	mov qword [rsp+8*389],r8
	mov qword [rsp+8*397],r10
	mov r10,  [gbl+8*145]
	mov r8,r10
	mov qword [rsp+8*396],r12
	mov r12,  [rsp+8*274]
	mov qword [rsp+8*395],r14
	mov r14,r12
	add r14,1
	shl r14,4
	add r14,r8
	mov r8, [r14]
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r8
	mov [r14],r11
	mov qword [rsp+8*399],r8
	mov qword [rsp+8*398],r11
	mov qword [rsp+8*400],r14
	
L_67:
	mov r8,  [rsp+8*380]
	mov r9,1
	mov r8,r8
	add r8,r9
	mov qword [rsp+8*380],r8
	jmp L_65
	
L_66:
	mov r9,  [gbl+8*157]
	mov r8,r9
	mov r10,  [rsp+8*274]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,0
	mov [r11],r12
	mov qword [rsp+8*401],r8
	mov qword [rsp+8*402],r11
	
L_64:
	mov r8,0
	mov rax,r8
	leave
	ret
	
query:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 3632
	mov r9,  rdi
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov r13,  [arg+8*2]
	mov r12,r13
	mov r14,  [gbl+8*21]
	cmp r14,r10
	mov r15, 0
	setle r15B
	mov qword [rsp+8*403],r8
	mov qword [rsp+8*404],r10
	mov qword [rsp+8*405],r12
	mov qword [rsp+8*406],r15
	mov r8,  [rsp+8*406]
	cmp r8, 0
	jne L_68
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*407],r8
	jmp L_69
	
L_68:
	mov r8,  [gbl+8*23]
	mov r9,  [rsp+8*405]
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*408],r10
	mov r9,  [rsp+8*408]
	mov r8,r9
	mov qword [rsp+8*407],r8
	
L_69:
	mov r8,  [rsp+8*407]
	cmp r8, 0
	je L_71
	mov r9,  [gbl+8*118]
	mov r8,r9
	mov r10,  [rsp+8*403]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov rax,r12
	mov qword [rsp+8*409],r8
	mov qword [rsp+8*410],r11
	mov qword [rsp+8*411],r12
	leave
	ret
	
L_71:
	mov r8,  [rsp+8*403]
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
	mov r9,r15
	mov r10,  [rsp+8*404]
	mov r12,  [rsp+8*405]
	mov r13,r10
	add r13,r12
	xor rdx, rdx
	mov rax, r13
	mov r14,2
	mov rbx, r14
	cdq
	idiv rbx
	mov r15, rax
	mov r13,r15
	mov r15,0
	mov r14,r15
	mov qword [rsp+8*420],r14
	mov r14,  [gbl+8*206]
	mov r15,r14
	mov r14,r8
	add r14,1
	shl r14,4
	add r14,r15
	mov qword [rsp+8*421],r15
	mov r15, [r14]
	mov qword [rsp+8*422],r14
	mov r14,0
	cmp r15,r14
	mov qword [rsp+8*416],r9
	mov r9, 0
	setg r9B
	mov qword [rsp+8*424],r9
	mov qword [rsp+8*413],r11
	mov qword [rsp+8*419],r13
	mov qword [rsp+8*423],r15
	mov r8,  [rsp+8*424]
	cmp r8, 0
	je L_73
	mov r9,  [rsp+8*403]
	mov r8,r9
	mov qword rdi,r8
	call pushdown
	mov r8 , rax
	mov qword [rsp+8*425],r8
	
L_73:
	mov r8,  [gbl+8*21]
	mov r9,  [rsp+8*419]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*426],r10
	mov r8,  [rsp+8*426]
	cmp r8, 0
	je L_75
	mov r9,  [rsp+8*419]
	mov r8,r9
	mov r11,  [rsp+8*404]
	mov r10,r11
	mov r13,  [rsp+8*413]
	mov r12,r13
	mov qword [arg+8*2],r8
	mov qword rsi,r10
	mov qword rdi,r12
	call query
	mov r8 , rax
	mov r9,  [rsp+8*420]
	mov r10,r9
	add r10,r8
	xor rdx, rdx
	mov rax, r10
	mov r11,  [gbl+8*32]
	mov rbx, r11
	cdq
	idiv rbx
	mov r12, rdx
	mov r9,r12
	mov qword [rsp+8*427],r8
	mov qword [rsp+8*420],r9
	mov qword [rsp+8*428],r10
	mov qword [rsp+8*429],r12
	
L_75:
	mov r8,  [rsp+8*419]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r11,  [gbl+8*23]
	cmp r11,r10
	mov r12, 0
	setge r12B
	mov qword [rsp+8*430],r10
	mov qword [rsp+8*431],r12
	mov r8,  [rsp+8*431]
	cmp r8, 0
	je L_77
	mov r8,  [rsp+8*419]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r12,  [rsp+8*405]
	mov r11,r12
	mov r13,r10
	mov r15,  [rsp+8*416]
	mov r14,r15
	mov qword [rsp+8*432],r10
	mov qword [arg+8*2],r11
	mov qword rsi,r13
	mov qword rdi,r14
	call query
	mov r8 , rax
	mov r9,  [rsp+8*420]
	mov r10,r9
	add r10,r8
	xor rdx, rdx
	mov rax, r10
	mov r11,  [gbl+8*32]
	mov rbx, r11
	cdq
	idiv rbx
	mov r12, rdx
	mov r9,r12
	mov qword [rsp+8*433],r8
	mov qword [rsp+8*420],r9
	mov qword [rsp+8*434],r10
	mov qword [rsp+8*435],r12
	
L_77:
	mov r8,  [rsp+8*420]
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
	sub    rsp, 3632
	mov     rdi, 500005
	call    mallocArray
	mov     qword [gbl+8*436], rax
	mov r9,  [gbl+8*436]
	mov r8,r9
	mov qword [gbl+8*97],r8
	mov     rdi, 500005
	call    mallocArray
	mov     qword [gbl+8*437], rax
	mov r9,  [gbl+8*437]
	mov r8,r9
	mov qword [gbl+8*157],r8
	mov     rdi, 500005
	call    mallocArray
	mov     qword [gbl+8*438], rax
	mov r9,  [gbl+8*438]
	mov r8,r9
	mov qword [gbl+8*206],r8
	mov     rdi, 200005
	call    mallocArray
	mov     qword [gbl+8*439], rax
	mov r9,  [gbl+8*439]
	mov r8,r9
	mov r11,1
	mov r10,r11
	mov qword [gbl+8*10],r8
	mov qword [gbl+8*104],r10
	mov     rdi, 500005
	call    mallocArray
	mov     qword [gbl+8*440], rax
	mov r9,  [gbl+8*440]
	mov r8,r9
	mov qword [gbl+8*139],r8
	mov     rdi, 2
	call    mallocArray
	mov     qword [gbl+8*441], rax
	mov r8,  [gbl+8*441]
	mov r9,0
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r11,500005
	mov [r10],r11
	mov r12,1
	mov r10,r12
	add r10,1
	shl r10,4
	add r10,r8
	mov r13,80
	mov [r10],r13
	mov qword [gbl+8*442],r10
	mov     rdi, [gbl+8*441]
	call    multiArray
	mov     qword [gbl+8*441], rax
	mov r9,  [gbl+8*441]
	mov r8,r9
	mov qword [gbl+8*145],r8
	mov     rdi, 500005
	call    mallocArray
	mov     qword [gbl+8*443], rax
	mov r9,  [gbl+8*443]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov r13,13131
	mov r12,r13
	mov r15,5353
	mov r14,r15
	mov qword [gbl+8*118],r8
	mov r8,2
	mov r9,14
	mov qword [gbl+8*30],r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov r8,7
	mov r9,r10
	sub r9,r8
	mov r8,r9
	mov qword [gbl+8*32],r8
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*56],r8
	mov r9,0
	mov r8,r9
	mov qword [gbl+8*21],r8
	mov r9,0
	mov r8,r9
	mov qword [gbl+8*23],r8
	mov qword [gbl+8*444],r10
	mov qword [gbl+8*57],r12
	mov qword [gbl+8*59],r14
	mov r8,  [rsp+8*446]
	mov rax,r8
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   5616
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
	

