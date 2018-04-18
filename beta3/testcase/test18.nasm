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
	sub    rsp, 456
	call global_init
	mov r8 , rax
	mov r10,4
	mov r9,r10
	mov r12,3
	mov r11,r12
	mov r14,6
	mov r13,r14
	mov qword [rsp+8*1],r8
	mov qword [rsp+8*2],r9
	mov qword [rsp+8*3],r11
	mov qword [rsp+8*4],r13
	mov     rdi, 3
	call    mallocArray
	mov     qword [rsp+8*5], rax
	mov r8, qword [rsp+8*5]
	mov r9,0
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r11,7
	mov [r10],r11
	mov r12,1
	mov r10,r12
	add r10,1
	shl r10,4
	add r10,r8
	mov r13,7
	mov [r10],r13
	mov r14,2
	mov r10,r14
	add r10,1
	shl r10,4
	add r10,r8
	mov r15,7
	mov [r10],r15
	mov qword [rsp+8*6],r10
	mov     rdi, [rsp+8*5]
	call    multiArray
	mov     qword [rsp+8*5], rax
	mov r9, qword [rsp+8*5]
	mov r8,r9
	mov r10,r8
	mov r11,0
	mov r12,r11
	add r12,1
	shl r12,4
	add r12,r10
	mov r10, [r12]
	mov r13,0
	mov r12,r13
	add r12,1
	shl r12,4
	add r12,r10
	mov r10, [r12]
	mov r14,0
	mov r12,r14
	add r12,1
	shl r12,4
	add r12,r10
	mov r15,1
	mov [r12],r15
	mov qword [rsp+8*7],r8
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*10],r8
	mov qword [rsp+8*8],r10
	mov qword [rsp+8*9],r12
	
L_125:
	mov r8, qword [rsp+8*10]
	mov r9, qword [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*11],r10
	mov r8, qword [rsp+8*11]
	cmp r8, 0
	je L_126
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*12],r8
	
L_128:
	mov r8, qword [rsp+8*12]
	mov r9, qword [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*13],r10
	mov r8, qword [rsp+8*13]
	cmp r8, 0
	je L_129
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_131:
	mov r8, qword [rsp+8*14]
	mov r9, qword [rsp+8*4]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*15],r10
	mov r8, qword [rsp+8*15]
	cmp r8, 0
	je L_132
	mov r8, qword [rsp+8*10]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*16],r10
	mov r8, qword [rsp+8*16]
	cmp r8, 0
	je L_134
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*17],r8
	jmp L_135
	
L_134:
	mov r8, qword [rsp+8*12]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*18],r10
	mov r9, qword [rsp+8*18]
	mov r8,r9
	mov qword [rsp+8*17],r8
	
L_135:
	mov r8, qword [rsp+8*17]
	cmp r8, 0
	je L_136
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*19],r8
	jmp L_137
	
L_136:
	mov r8, qword [rsp+8*14]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*20],r10
	mov r9, qword [rsp+8*20]
	mov r8,r9
	mov qword [rsp+8*19],r8
	
L_137:
	mov r8, qword [rsp+8*19]
	cmp r8, 0
	je L_138
	mov r9, qword [rsp+8*7]
	mov r8,r9
	mov r10, qword [rsp+8*10]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12, qword [rsp+8*12]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r13, qword [rsp+8*14]
	mov r11,r13
	add r11,1
	shl r11,4
	add r11,r8
	mov r14,1
	mov [r11],r14
	mov qword [rsp+8*21],r8
	mov qword [rsp+8*22],r11
	jmp L_139
	
L_138:
	mov r8, qword [rsp+8*10]
	mov r9,1
	mov r10,r8
	sub r10,r9
	mov r12, qword [rsp+8*7]
	mov r11,r12
	mov r13,r10
	add r13,1
	shl r13,4
	add r13,r11
	mov r11, [r13]
	mov r14, qword [rsp+8*12]
	mov r13,r14
	add r13,1
	shl r13,4
	add r13,r11
	mov r11, [r13]
	mov r15, qword [rsp+8*14]
	mov r13,r15
	add r13,1
	shl r13,4
	add r13,r11
	mov r8, [r13]
	mov qword [rsp+8*26],r8
	mov r8,1
	mov r9,r14
	sub r9,r8
	mov r8,r12
	mov qword [rsp+8*27],r9
	mov r9, qword [rsp+8*10]
	mov qword [rsp+8*23],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r8, [r10]
	mov r9, qword [rsp+8*27]
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r8, [r10]
	mov r10,r15
	add r10,1
	shl r10,4
	add r10,r8
	mov qword [rsp+8*28],r8
	mov r8, [r10]
	mov qword [rsp+8*30],r8
	mov r8, qword [rsp+8*26]
	mov r9, qword [rsp+8*30]
	mov qword [rsp+8*29],r10
	mov r10,r8
	add r10,r9
	mov r8,1
	mov r9,r15
	sub r9,r8
	mov r8,r12
	mov qword [rsp+8*32],r9
	mov r9, qword [rsp+8*10]
	mov qword [rsp+8*31],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r8, [r10]
	mov r10,r14
	add r10,1
	shl r10,4
	add r10,r8
	mov r8, [r10]
	mov r9, qword [rsp+8*32]
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov qword [rsp+8*33],r8
	mov r8, [r10]
	mov qword [rsp+8*35],r8
	mov r8, qword [rsp+8*31]
	mov r9, qword [rsp+8*35]
	mov qword [rsp+8*34],r10
	mov r10,r8
	add r10,r9
	mov r8,r12
	mov r9, qword [rsp+8*10]
	mov qword [rsp+8*36],r10
	mov r10,r9
	add r10,1
	shl r10,4
	add r10,r8
	mov r8, [r10]
	mov r10,r14
	add r10,1
	shl r10,4
	add r10,r8
	mov r8, [r10]
	mov r10,r15
	add r10,1
	shl r10,4
	add r10,r8
	mov qword [rsp+8*37],r8
	mov r8, qword [rsp+8*36]
	mov [r10],r8
	mov qword [rsp+8*38],r10
	mov qword [rsp+8*24],r11
	mov qword [rsp+8*25],r13
	
L_139:
	
L_133:
	mov r9, qword [rsp+8*14]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*39],r8
	mov qword [rsp+8*14],r9
	jmp L_131
	
L_132:
	
L_130:
	mov r9, qword [rsp+8*12]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*40],r8
	mov qword [rsp+8*12],r9
	jmp L_128
	
L_129:
	
L_127:
	mov r9, qword [rsp+8*10]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*41],r8
	mov qword [rsp+8*10],r9
	jmp L_125
	
L_126:
	mov r9, qword [rsp+8*7]
	mov r8,r9
	mov r10, qword [rsp+8*2]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12, qword [rsp+8*3]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r13, qword [rsp+8*4]
	mov r11,r13
	add r11,1
	shl r11,4
	add r11,r8
	mov r14, [r11]
	mov r15,r14
	mov qword [rsp+8*42],r8
	mov r8,r15
	mov qword [rsp+8*46],r8
	mov qword [rsp+8*43],r11
	mov qword [rsp+8*44],r14
	mov qword [arg+8*0],r15
	mov     rdi, [rsp+8*46]
	call    toString
	mov     qword[rsp+8*47], rax
	mov r9, qword [rsp+8*47]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*48],r10
	mov rdi, formatln
	mov rsi,[rsp+8*48] 
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
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 456
	mov r8, qword [rsp+8*49]
	mov rax,r8
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   2440
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
	

