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
	sub    rsp, 17568
	        mov     eax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 19552
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	call global_init
	mov r8 , rax
	mov r10,0
	mov r9,r10
	mov r12, qword [gbl+8*3]
	mov r11,r12
	mov r13,0
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r11
	mov r15,t149
	mov [r14],r15
	mov qword [rsp+8*1],r8
	mov r8,r12
	mov r10,1
	mov qword [rsp+8*4],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*6],r8
	mov r8,t153
	mov [r11],r8
	mov r8,r12
	mov r10,2
	mov qword [rsp+8*7],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*8],r8
	mov r8,t157
	mov [r11],r8
	mov r8,r12
	mov r10,3
	mov qword [rsp+8*9],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*10],r8
	mov r8,t161
	mov [r11],r8
	mov r8,r12
	mov r10,4
	mov qword [rsp+8*11],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*12],r8
	mov r8,t165
	mov [r11],r8
	mov r8,r12
	mov r10,5
	mov qword [rsp+8*13],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*14],r8
	mov r8,t169
	mov [r11],r8
	mov r8,r12
	mov r10,6
	mov qword [rsp+8*15],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*16],r8
	mov r8,t173
	mov [r11],r8
	mov r8,r12
	mov r10,7
	mov qword [rsp+8*17],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*18],r8
	mov r8,t177
	mov [r11],r8
	mov r8,r12
	mov r10,8
	mov qword [rsp+8*19],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*20],r8
	mov r8,t181
	mov [r11],r8
	mov r8,r12
	mov r10,9
	mov qword [rsp+8*21],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*22],r8
	mov r8,t185
	mov [r11],r8
	mov r8,r12
	mov r10,10
	mov qword [rsp+8*23],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*24],r8
	mov r8,t189
	mov [r11],r8
	mov r8,r12
	mov r10,11
	mov qword [rsp+8*25],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*26],r8
	mov r8,t193
	mov [r11],r8
	mov r8,r12
	mov r10,12
	mov qword [rsp+8*27],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*28],r8
	mov r8,t197
	mov [r11],r8
	mov r8,r12
	mov r10,13
	mov qword [rsp+8*29],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*30],r8
	mov r8,t201
	mov [r11],r8
	mov r8,r12
	mov r10,14
	mov qword [rsp+8*31],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*32],r8
	mov r8,t205
	mov [r11],r8
	mov r8,r12
	mov r10,15
	mov qword [rsp+8*33],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*34],r8
	mov r8,t209
	mov [r11],r8
	mov r8,r12
	mov r10,16
	mov qword [rsp+8*35],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*36],r8
	mov r8,t213
	mov [r11],r8
	mov r8,r12
	mov r10,17
	mov qword [rsp+8*37],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*38],r8
	mov r8,t217
	mov [r11],r8
	mov r8,r12
	mov r10,18
	mov qword [rsp+8*39],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*40],r8
	mov r8,t221
	mov [r11],r8
	mov r8,r12
	mov r10,19
	mov qword [rsp+8*41],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*42],r8
	mov r8,t225
	mov [r11],r8
	mov r8,r12
	mov r10,20
	mov qword [rsp+8*43],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*44],r8
	mov r8,t229
	mov [r11],r8
	mov r8,r12
	mov r10,21
	mov qword [rsp+8*45],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*46],r8
	mov r8,t233
	mov [r11],r8
	mov r8,r12
	mov r10,22
	mov qword [rsp+8*47],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*48],r8
	mov r8,t237
	mov [r11],r8
	mov r8,r12
	mov r10,23
	mov qword [rsp+8*49],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*50],r8
	mov r8,t241
	mov [r11],r8
	mov r8,r12
	mov r10,24
	mov qword [rsp+8*51],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*52],r8
	mov r8,t245
	mov [r11],r8
	mov r8,r12
	mov r10,25
	mov qword [rsp+8*53],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*54],r8
	mov r8,t249
	mov [r11],r8
	mov r8,r12
	mov r10,26
	mov qword [rsp+8*55],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*56],r8
	mov r8,t253
	mov [r11],r8
	mov r8,r12
	mov r10,27
	mov qword [rsp+8*57],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*58],r8
	mov r8,t257
	mov [r11],r8
	mov r8,r12
	mov r10,28
	mov qword [rsp+8*59],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*60],r8
	mov r8,t261
	mov [r11],r8
	mov r8,r12
	mov r10,29
	mov qword [rsp+8*61],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*62],r8
	mov r8,t265
	mov [r11],r8
	mov r8,r12
	mov r10,30
	mov qword [rsp+8*63],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*64],r8
	mov r8,t269
	mov [r11],r8
	mov r8,r12
	mov r10,31
	mov qword [rsp+8*65],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*66],r8
	mov r8,t273
	mov [r11],r8
	mov r8,r12
	mov r10,32
	mov qword [rsp+8*67],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*68],r8
	mov r8,t277
	mov [r11],r8
	mov r8,r12
	mov r10,33
	mov qword [rsp+8*69],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*70],r8
	mov r8,t281
	mov [r11],r8
	mov r8,r12
	mov r10,34
	mov qword [rsp+8*71],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*72],r8
	mov r8,t285
	mov [r11],r8
	mov r8,r12
	mov r10,35
	mov qword [rsp+8*73],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*74],r8
	mov r8,t289
	mov [r11],r8
	mov r8,r12
	mov r10,36
	mov qword [rsp+8*75],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*76],r8
	mov r8,t293
	mov [r11],r8
	mov r8,r12
	mov r10,37
	mov qword [rsp+8*77],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*78],r8
	mov r8,t297
	mov [r11],r8
	mov r8,r12
	mov r10,38
	mov qword [rsp+8*79],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*80],r8
	mov r8,t301
	mov [r11],r8
	mov r8,r12
	mov r10,39
	mov qword [rsp+8*81],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*82],r8
	mov r8,t305
	mov [r11],r8
	mov r8,r12
	mov r10,40
	mov qword [rsp+8*83],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*84],r8
	mov r8,t309
	mov [r11],r8
	mov r8,r12
	mov r10,41
	mov qword [rsp+8*85],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*86],r8
	mov r8,t313
	mov [r11],r8
	mov r8,r12
	mov r10,42
	mov qword [rsp+8*87],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*88],r8
	mov r8,t317
	mov [r11],r8
	mov r8,r12
	mov r10,43
	mov qword [rsp+8*89],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*90],r8
	mov r8,t321
	mov [r11],r8
	mov r8,r12
	mov r10,44
	mov qword [rsp+8*91],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*92],r8
	mov r8,t325
	mov [r11],r8
	mov r8,r12
	mov r10,45
	mov qword [rsp+8*93],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*94],r8
	mov r8,t329
	mov [r11],r8
	mov r8,r12
	mov r10,46
	mov qword [rsp+8*95],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*96],r8
	mov r8,t333
	mov [r11],r8
	mov r8,r12
	mov r10,47
	mov qword [rsp+8*97],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*98],r8
	mov r8,t337
	mov [r11],r8
	mov r8,r12
	mov r10,48
	mov qword [rsp+8*99],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*100],r8
	mov r8,t341
	mov [r11],r8
	mov r8,r12
	mov r10,49
	mov qword [rsp+8*101],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*102],r8
	mov r8,t345
	mov [r11],r8
	mov r8,r12
	mov r10,50
	mov qword [rsp+8*103],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*104],r8
	mov r8,t349
	mov [r11],r8
	mov r8,r12
	mov r10,51
	mov qword [rsp+8*105],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*106],r8
	mov r8,t353
	mov [r11],r8
	mov r8,r12
	mov r10,52
	mov qword [rsp+8*107],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*108],r8
	mov r8,t357
	mov [r11],r8
	mov r8,r12
	mov r10,53
	mov qword [rsp+8*109],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*110],r8
	mov r8,t361
	mov [r11],r8
	mov r8,r12
	mov r10,54
	mov qword [rsp+8*111],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*112],r8
	mov r8,t365
	mov [r11],r8
	mov r8,r12
	mov r10,55
	mov qword [rsp+8*113],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*114],r8
	mov r8,t369
	mov [r11],r8
	mov r8,r12
	mov r10,56
	mov qword [rsp+8*115],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*116],r8
	mov r8,t373
	mov [r11],r8
	mov r8,r12
	mov r10,57
	mov qword [rsp+8*117],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*118],r8
	mov r8,t377
	mov [r11],r8
	mov r8,r12
	mov r10,58
	mov qword [rsp+8*119],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*120],r8
	mov r8,t381
	mov [r11],r8
	mov r8,r12
	mov r10,59
	mov qword [rsp+8*121],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*122],r8
	mov r8,t385
	mov [r11],r8
	mov r8,r12
	mov r10,60
	mov qword [rsp+8*123],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*124],r8
	mov r8,t389
	mov [r11],r8
	mov r8,r12
	mov r10,61
	mov qword [rsp+8*125],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*126],r8
	mov r8,t393
	mov [r11],r8
	mov r8,r12
	mov r10,62
	mov qword [rsp+8*127],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*128],r8
	mov r8,t397
	mov [r11],r8
	mov r8,r12
	mov r10,63
	mov qword [rsp+8*129],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*130],r8
	mov r8,t401
	mov [r11],r8
	mov r8,r12
	mov r10,64
	mov qword [rsp+8*131],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*132],r8
	mov r8,t405
	mov [r11],r8
	mov r8,r12
	mov r10,65
	mov qword [rsp+8*133],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*134],r8
	mov r8,t409
	mov [r11],r8
	mov r8,r12
	mov r10,66
	mov qword [rsp+8*135],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*136],r8
	mov r8,t413
	mov [r11],r8
	mov r8,r12
	mov r10,67
	mov qword [rsp+8*137],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*138],r8
	mov r8,t417
	mov [r11],r8
	mov r8,r12
	mov r10,68
	mov qword [rsp+8*139],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*140],r8
	mov r8,t421
	mov [r11],r8
	mov r8,r12
	mov r10,69
	mov qword [rsp+8*141],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*142],r8
	mov r8,t425
	mov [r11],r8
	mov r8,r12
	mov r10,70
	mov qword [rsp+8*143],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*144],r8
	mov r8,t429
	mov [r11],r8
	mov r8,r12
	mov r10,71
	mov qword [rsp+8*145],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*146],r8
	mov r8,t433
	mov [r11],r8
	mov r8,r12
	mov r10,72
	mov qword [rsp+8*147],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*148],r8
	mov r8,t437
	mov [r11],r8
	mov r8,r12
	mov r10,73
	mov qword [rsp+8*149],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*150],r8
	mov r8,t441
	mov [r11],r8
	mov r8,r12
	mov r10,74
	mov qword [rsp+8*151],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*152],r8
	mov r8,t445
	mov [r11],r8
	mov r8,r12
	mov r10,75
	mov qword [rsp+8*153],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*154],r8
	mov r8,t449
	mov [r11],r8
	mov r8,r12
	mov r10,76
	mov qword [rsp+8*155],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*156],r8
	mov r8,t453
	mov [r11],r8
	mov r8,r12
	mov r10,77
	mov qword [rsp+8*157],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*158],r8
	mov r8,t457
	mov [r11],r8
	mov r8,r12
	mov r10,78
	mov qword [rsp+8*159],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*160],r8
	mov r8,t461
	mov [r11],r8
	mov r8,r12
	mov r10,79
	mov qword [rsp+8*161],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*162],r8
	mov r8,t465
	mov [r11],r8
	mov r8,r12
	mov r10,80
	mov qword [rsp+8*163],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*164],r8
	mov r8,t469
	mov [r11],r8
	mov r8,r12
	mov r10,81
	mov qword [rsp+8*165],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*166],r8
	mov r8,t473
	mov [r11],r8
	mov r8,r12
	mov r10,82
	mov qword [rsp+8*167],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*168],r8
	mov r8,t477
	mov [r11],r8
	mov r8,r12
	mov r10,83
	mov qword [rsp+8*169],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*170],r8
	mov r8,t481
	mov [r11],r8
	mov r8,r12
	mov r10,84
	mov qword [rsp+8*171],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*172],r8
	mov r8,t485
	mov [r11],r8
	mov r8,r12
	mov r10,85
	mov qword [rsp+8*173],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*174],r8
	mov r8,t489
	mov [r11],r8
	mov r8,r12
	mov r10,86
	mov qword [rsp+8*175],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*176],r8
	mov r8,t493
	mov [r11],r8
	mov r8,r12
	mov r10,87
	mov qword [rsp+8*177],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*178],r8
	mov r8,t497
	mov [r11],r8
	mov r8,r12
	mov r10,88
	mov qword [rsp+8*179],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*180],r8
	mov r8,t501
	mov [r11],r8
	mov r8,r12
	mov r10,89
	mov qword [rsp+8*181],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*182],r8
	mov r8,t505
	mov [r11],r8
	mov r8,r12
	mov r10,90
	mov qword [rsp+8*183],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*184],r8
	mov r8,t509
	mov [r11],r8
	mov r8,r12
	mov r10,91
	mov qword [rsp+8*185],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*186],r8
	mov r8,t513
	mov [r11],r8
	mov r8,r12
	mov r10,92
	mov qword [rsp+8*187],r11
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov qword [rsp+8*188],r8
	mov r8,t517
	mov [r11],r8
	mov r10, qword [gbl+8*190]
	mov r8,r10
	mov qword [rsp+8*189],r11
	mov r11,0
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*191],r8
	mov r8,t521
	mov [r13],r8
	mov r8,r10
	mov r11,1
	mov qword [rsp+8*192],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*193],r8
	mov r8,t525
	mov [r13],r8
	mov r8,r10
	mov r11,2
	mov qword [rsp+8*194],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*195],r8
	mov r8,t529
	mov [r13],r8
	mov r8,r10
	mov r11,3
	mov qword [rsp+8*196],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*197],r8
	mov r8,t533
	mov [r13],r8
	mov r8,r10
	mov r11,4
	mov qword [rsp+8*198],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*199],r8
	mov r8,t537
	mov [r13],r8
	mov r8,r10
	mov r11,5
	mov qword [rsp+8*200],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*201],r8
	mov r8,t541
	mov [r13],r8
	mov r8,r10
	mov r11,6
	mov qword [rsp+8*202],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*203],r8
	mov r8,t545
	mov [r13],r8
	mov r8,r10
	mov r11,7
	mov qword [rsp+8*204],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*205],r8
	mov r8,t549
	mov [r13],r8
	mov r8,r10
	mov r11,8
	mov qword [rsp+8*206],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*207],r8
	mov r8,t553
	mov [r13],r8
	mov r8,r10
	mov r11,9
	mov qword [rsp+8*208],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*209],r8
	mov r8,t557
	mov [r13],r8
	mov r8,r10
	mov r11,10
	mov qword [rsp+8*210],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*211],r8
	mov r8,t561
	mov [r13],r8
	mov r8,r10
	mov r11,11
	mov qword [rsp+8*212],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*213],r8
	mov r8,t565
	mov [r13],r8
	mov r8,r10
	mov r11,12
	mov qword [rsp+8*214],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*215],r8
	mov r8,t569
	mov [r13],r8
	mov r8,r10
	mov r11,13
	mov qword [rsp+8*216],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*217],r8
	mov r8,t573
	mov [r13],r8
	mov r8,r10
	mov r11,14
	mov qword [rsp+8*218],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*219],r8
	mov r8,t577
	mov [r13],r8
	mov r8,r10
	mov r11,15
	mov qword [rsp+8*220],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*221],r8
	mov r8,t581
	mov [r13],r8
	mov r8,r10
	mov r11,16
	mov qword [rsp+8*222],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*223],r8
	mov r8,t585
	mov [r13],r8
	mov r8,r10
	mov r11,17
	mov qword [rsp+8*224],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*225],r8
	mov r8,t589
	mov [r13],r8
	mov r8,r10
	mov r11,18
	mov qword [rsp+8*226],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*227],r8
	mov r8,t593
	mov [r13],r8
	mov r8,r10
	mov r11,19
	mov qword [rsp+8*228],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*229],r8
	mov r8,t597
	mov [r13],r8
	mov r8,r10
	mov r11,20
	mov qword [rsp+8*230],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*231],r8
	mov r8,t601
	mov [r13],r8
	mov r8,r10
	mov r11,21
	mov qword [rsp+8*232],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*233],r8
	mov r8,t605
	mov [r13],r8
	mov r8,r10
	mov r11,22
	mov qword [rsp+8*234],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*235],r8
	mov r8,t609
	mov [r13],r8
	mov r8,r10
	mov r11,23
	mov qword [rsp+8*236],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*237],r8
	mov r8,t613
	mov [r13],r8
	mov r8,r10
	mov r11,24
	mov qword [rsp+8*238],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*239],r8
	mov r8,t617
	mov [r13],r8
	mov r8,r10
	mov r11,25
	mov qword [rsp+8*240],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*241],r8
	mov r8,t621
	mov [r13],r8
	mov r8,r10
	mov r11,26
	mov qword [rsp+8*242],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*243],r8
	mov r8,t625
	mov [r13],r8
	mov r8,r10
	mov r11,27
	mov qword [rsp+8*244],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*245],r8
	mov r8,t629
	mov [r13],r8
	mov r8,r10
	mov r11,28
	mov qword [rsp+8*246],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*247],r8
	mov r8,t633
	mov [r13],r8
	mov r8,r10
	mov r11,29
	mov qword [rsp+8*248],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*249],r8
	mov r8,t637
	mov [r13],r8
	mov r8,r10
	mov r11,30
	mov qword [rsp+8*250],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*251],r8
	mov r8,t641
	mov [r13],r8
	mov r8,r12
	mov r11,81
	mov qword [rsp+8*252],r13
	mov r13,r11
	add r13,1
	shl r13,4
	add r13,r8
	mov qword [rsp+8*253],r8
	mov r8, [r13]
	mov r11,r12
	mov qword [rsp+8*254],r13
	mov r13,82
	mov qword [rsp+8*5],r14
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r11
	mov qword [rsp+8*256],r11
	mov r11, [r14]
	mov qword [rsp+8*255],r8
	mov qword [rsp+8*2],r9
	mov qword [rsp+8*258],r11
	mov qword [rsp+8*257],r14
	mov     rsi, [rsp+8*258]
	mov     rdi, [rsp+8*255]
	call    concat
	mov [rsp+8*259], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*260],r8
	mov qword [rsp+8*261],r11
	mov qword [rsp+8*262],r12
	mov     rsi, [rsp+8*262]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*263], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*264],r8
	mov qword [rsp+8*265],r11
	mov qword [rsp+8*266],r12
	mov     rsi, [rsp+8*266]
	mov     rdi, [rsp+8*263]
	call    concat
	mov [rsp+8*267], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*268],r8
	mov qword [rsp+8*269],r11
	mov qword [rsp+8*270],r12
	mov     rsi, [rsp+8*270]
	mov     rdi, [rsp+8*267]
	call    concat
	mov [rsp+8*271], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*272],r8
	mov qword [rsp+8*273],r11
	mov qword [rsp+8*274],r12
	mov     rsi, [rsp+8*274]
	mov     rdi, [rsp+8*271]
	call    concat
	mov [rsp+8*275], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*276],r8
	mov qword [rsp+8*277],r11
	mov qword [rsp+8*278],r12
	mov     rsi, [rsp+8*278]
	mov     rdi, [rsp+8*275]
	call    concat
	mov [rsp+8*279], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,66
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*280],r8
	mov qword [rsp+8*281],r11
	mov qword [rsp+8*282],r12
	mov     rsi, [rsp+8*282]
	mov     rdi, [rsp+8*279]
	call    concat
	mov [rsp+8*283], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*284],r8
	mov qword [rsp+8*285],r11
	mov qword [rsp+8*286],r12
	mov     rsi, [rsp+8*286]
	mov     rdi, [rsp+8*283]
	call    concat
	mov [rsp+8*287], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*288],r8
	mov qword [rsp+8*289],r11
	mov qword [rsp+8*290],r12
	mov     rsi, [rsp+8*290]
	mov     rdi, [rsp+8*287]
	call    concat
	mov [rsp+8*291], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*292],r8
	mov qword [rsp+8*293],r11
	mov qword [rsp+8*294],r12
	mov     rsi, [rsp+8*294]
	mov     rdi, [rsp+8*291]
	call    concat
	mov [rsp+8*295], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*296],r8
	mov qword [rsp+8*297],r11
	mov qword [rsp+8*298],r12
	mov     rsi, [rsp+8*298]
	mov     rdi, [rsp+8*295]
	call    concat
	mov [rsp+8*299], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*300],r8
	mov qword [rsp+8*301],r11
	mov qword [rsp+8*302],r12
	mov     rsi, [rsp+8*302]
	mov     rdi, [rsp+8*299]
	call    concat
	mov [rsp+8*303], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*304],r8
	mov qword [rsp+8*305],r11
	mov qword [rsp+8*306],r12
	mov     rsi, [rsp+8*306]
	mov     rdi, [rsp+8*303]
	call    concat
	mov [rsp+8*307], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*308],r8
	mov qword [rsp+8*309],r11
	mov qword [rsp+8*310],r12
	mov     rsi, [rsp+8*310]
	mov     rdi, [rsp+8*307]
	call    concat
	mov [rsp+8*311], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*312],r8
	mov qword [rsp+8*313],r11
	mov qword [rsp+8*314],r12
	mov     rsi, [rsp+8*314]
	mov     rdi, [rsp+8*311]
	call    concat
	mov [rsp+8*315], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,86
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*316],r8
	mov qword [rsp+8*317],r11
	mov qword [rsp+8*318],r12
	mov     rsi, [rsp+8*318]
	mov     rdi, [rsp+8*315]
	call    concat
	mov [rsp+8*319], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*320],r8
	mov qword [rsp+8*321],r11
	mov qword [rsp+8*322],r12
	mov     rsi, [rsp+8*322]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*323], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,89
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*324],r8
	mov qword [rsp+8*325],r11
	mov qword [rsp+8*326],r12
	mov     rsi, [rsp+8*326]
	mov     rdi, [rsp+8*323]
	call    concat
	mov [rsp+8*327], rax
	mov r9, qword [rsp+8*327]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*329],r10
	mov rdi,[rsp+8*329] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,68
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*330],r8
	mov r8, [r15]
	mov qword [rsp+8*335],r8
	mov qword [rsp+8*331],r11
	mov qword [rsp+8*332],r12
	mov qword [rsp+8*333],r13
	mov qword [rsp+8*334],r15
	mov     rsi, [rsp+8*335]
	mov     rdi, [rsp+8*332]
	call    concat
	mov [rsp+8*336], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*337],r8
	mov qword [rsp+8*338],r11
	mov qword [rsp+8*339],r12
	mov     rsi, [rsp+8*339]
	mov     rdi, [rsp+8*336]
	call    concat
	mov [rsp+8*340], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,86
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*341],r8
	mov qword [rsp+8*342],r11
	mov qword [rsp+8*343],r12
	mov     rsi, [rsp+8*343]
	mov     rdi, [rsp+8*340]
	call    concat
	mov [rsp+8*344], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*345],r8
	mov qword [rsp+8*346],r11
	mov qword [rsp+8*347],r12
	mov     rsi, [rsp+8*347]
	mov     rdi, [rsp+8*344]
	call    concat
	mov [rsp+8*348], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*349],r8
	mov qword [rsp+8*350],r11
	mov qword [rsp+8*351],r12
	mov     rsi, [rsp+8*351]
	mov     rdi, [rsp+8*348]
	call    concat
	mov [rsp+8*352], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,15
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*353],r8
	mov qword [rsp+8*354],r11
	mov qword [rsp+8*355],r12
	mov     rsi, [rsp+8*355]
	mov     rdi, [rsp+8*352]
	call    concat
	mov [rsp+8*356], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*357],r8
	mov qword [rsp+8*358],r11
	mov qword [rsp+8*359],r12
	mov     rsi, [rsp+8*359]
	mov     rdi, [rsp+8*356]
	call    concat
	mov [rsp+8*360], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*361],r8
	mov qword [rsp+8*362],r11
	mov qword [rsp+8*363],r12
	mov     rsi, [rsp+8*363]
	mov     rdi, [rsp+8*360]
	call    concat
	mov [rsp+8*364], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,67
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*365],r8
	mov qword [rsp+8*366],r11
	mov qword [rsp+8*367],r12
	mov     rsi, [rsp+8*367]
	mov     rdi, [rsp+8*364]
	call    concat
	mov [rsp+8*368], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*369],r8
	mov qword [rsp+8*370],r11
	mov qword [rsp+8*371],r12
	mov     rsi, [rsp+8*371]
	mov     rdi, [rsp+8*368]
	call    concat
	mov [rsp+8*372], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,83
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*373],r8
	mov qword [rsp+8*374],r11
	mov qword [rsp+8*375],r12
	mov     rsi, [rsp+8*375]
	mov     rdi, [rsp+8*372]
	call    concat
	mov [rsp+8*376], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*377],r8
	mov qword [rsp+8*378],r11
	mov qword [rsp+8*379],r12
	mov     rsi, [rsp+8*379]
	mov     rdi, [rsp+8*376]
	call    concat
	mov [rsp+8*380], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*381],r8
	mov qword [rsp+8*382],r11
	mov qword [rsp+8*383],r12
	mov     rsi, [rsp+8*383]
	mov     rdi, [rsp+8*380]
	call    concat
	mov [rsp+8*384], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*385],r8
	mov qword [rsp+8*386],r11
	mov qword [rsp+8*387],r12
	mov     rsi, [rsp+8*387]
	mov     rdi, [rsp+8*384]
	call    concat
	mov [rsp+8*388], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*388]
	call    concat
	mov [rsp+8*390], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,15
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*391],r8
	mov qword [rsp+8*392],r11
	mov qword [rsp+8*393],r12
	mov     rsi, [rsp+8*393]
	mov     rdi, [rsp+8*390]
	call    concat
	mov [rsp+8*394], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*394]
	call    concat
	mov [rsp+8*395], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*396],r8
	mov qword [rsp+8*397],r11
	mov qword [rsp+8*398],r12
	mov     rsi, [rsp+8*398]
	mov     rdi, [rsp+8*395]
	call    concat
	mov [rsp+8*399], rax
	mov r9, qword [rsp+8*399]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*400],r10
	mov rdi,[rsp+8*400] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,68
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*401],r8
	mov r8, [r15]
	mov qword [rsp+8*406],r8
	mov qword [rsp+8*402],r11
	mov qword [rsp+8*403],r12
	mov qword [rsp+8*404],r13
	mov qword [rsp+8*405],r15
	mov     rsi, [rsp+8*406]
	mov     rdi, [rsp+8*403]
	call    concat
	mov [rsp+8*407], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*408],r8
	mov qword [rsp+8*409],r11
	mov qword [rsp+8*410],r12
	mov     rsi, [rsp+8*410]
	mov     rdi, [rsp+8*407]
	call    concat
	mov [rsp+8*411], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,86
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*412],r8
	mov qword [rsp+8*413],r11
	mov qword [rsp+8*414],r12
	mov     rsi, [rsp+8*414]
	mov     rdi, [rsp+8*411]
	call    concat
	mov [rsp+8*415], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*416],r8
	mov qword [rsp+8*417],r11
	mov qword [rsp+8*418],r12
	mov     rsi, [rsp+8*418]
	mov     rdi, [rsp+8*415]
	call    concat
	mov [rsp+8*419], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*420],r8
	mov qword [rsp+8*421],r11
	mov qword [rsp+8*422],r12
	mov     rsi, [rsp+8*422]
	mov     rdi, [rsp+8*419]
	call    concat
	mov [rsp+8*423], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,16
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*424],r8
	mov qword [rsp+8*425],r11
	mov qword [rsp+8*426],r12
	mov     rsi, [rsp+8*426]
	mov     rdi, [rsp+8*423]
	call    concat
	mov [rsp+8*427], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*428],r8
	mov qword [rsp+8*429],r11
	mov qword [rsp+8*430],r12
	mov     rsi, [rsp+8*430]
	mov     rdi, [rsp+8*427]
	call    concat
	mov [rsp+8*431], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*432],r8
	mov qword [rsp+8*433],r11
	mov qword [rsp+8*434],r12
	mov     rsi, [rsp+8*434]
	mov     rdi, [rsp+8*431]
	call    concat
	mov [rsp+8*435], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,67
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*436],r8
	mov qword [rsp+8*437],r11
	mov qword [rsp+8*438],r12
	mov     rsi, [rsp+8*438]
	mov     rdi, [rsp+8*435]
	call    concat
	mov [rsp+8*439], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*440],r8
	mov qword [rsp+8*441],r11
	mov qword [rsp+8*442],r12
	mov     rsi, [rsp+8*442]
	mov     rdi, [rsp+8*439]
	call    concat
	mov [rsp+8*443], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,83
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*444],r8
	mov qword [rsp+8*445],r11
	mov qword [rsp+8*446],r12
	mov     rsi, [rsp+8*446]
	mov     rdi, [rsp+8*443]
	call    concat
	mov [rsp+8*447], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*448],r8
	mov qword [rsp+8*449],r11
	mov qword [rsp+8*450],r12
	mov     rsi, [rsp+8*450]
	mov     rdi, [rsp+8*447]
	call    concat
	mov [rsp+8*451], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*452],r8
	mov qword [rsp+8*453],r11
	mov qword [rsp+8*454],r12
	mov     rsi, [rsp+8*454]
	mov     rdi, [rsp+8*451]
	call    concat
	mov [rsp+8*455], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*456],r8
	mov qword [rsp+8*457],r11
	mov qword [rsp+8*458],r12
	mov     rsi, [rsp+8*458]
	mov     rdi, [rsp+8*455]
	call    concat
	mov [rsp+8*459], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*459]
	call    concat
	mov [rsp+8*460], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,16
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*461],r8
	mov qword [rsp+8*462],r11
	mov qword [rsp+8*463],r12
	mov     rsi, [rsp+8*463]
	mov     rdi, [rsp+8*460]
	call    concat
	mov [rsp+8*464], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*464]
	call    concat
	mov [rsp+8*465], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*466],r8
	mov qword [rsp+8*467],r11
	mov qword [rsp+8*468],r12
	mov     rsi, [rsp+8*468]
	mov     rdi, [rsp+8*465]
	call    concat
	mov [rsp+8*469], rax
	mov r9, qword [rsp+8*469]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*470],r10
	mov rdi,[rsp+8*470] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,68
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*471],r8
	mov r8, [r15]
	mov qword [rsp+8*476],r8
	mov qword [rsp+8*472],r11
	mov qword [rsp+8*473],r12
	mov qword [rsp+8*474],r13
	mov qword [rsp+8*475],r15
	mov     rsi, [rsp+8*476]
	mov     rdi, [rsp+8*473]
	call    concat
	mov [rsp+8*477], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*478],r8
	mov qword [rsp+8*479],r11
	mov qword [rsp+8*480],r12
	mov     rsi, [rsp+8*480]
	mov     rdi, [rsp+8*477]
	call    concat
	mov [rsp+8*481], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,86
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*482],r8
	mov qword [rsp+8*483],r11
	mov qword [rsp+8*484],r12
	mov     rsi, [rsp+8*484]
	mov     rdi, [rsp+8*481]
	call    concat
	mov [rsp+8*485], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*486],r8
	mov qword [rsp+8*487],r11
	mov qword [rsp+8*488],r12
	mov     rsi, [rsp+8*488]
	mov     rdi, [rsp+8*485]
	call    concat
	mov [rsp+8*489], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*490],r8
	mov qword [rsp+8*491],r11
	mov qword [rsp+8*492],r12
	mov     rsi, [rsp+8*492]
	mov     rdi, [rsp+8*489]
	call    concat
	mov [rsp+8*493], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,17
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*494],r8
	mov qword [rsp+8*495],r11
	mov qword [rsp+8*496],r12
	mov     rsi, [rsp+8*496]
	mov     rdi, [rsp+8*493]
	call    concat
	mov [rsp+8*497], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*498],r8
	mov qword [rsp+8*499],r11
	mov qword [rsp+8*500],r12
	mov     rsi, [rsp+8*500]
	mov     rdi, [rsp+8*497]
	call    concat
	mov [rsp+8*501], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*502],r8
	mov qword [rsp+8*503],r11
	mov qword [rsp+8*504],r12
	mov     rsi, [rsp+8*504]
	mov     rdi, [rsp+8*501]
	call    concat
	mov [rsp+8*505], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,67
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*506],r8
	mov qword [rsp+8*507],r11
	mov qword [rsp+8*508],r12
	mov     rsi, [rsp+8*508]
	mov     rdi, [rsp+8*505]
	call    concat
	mov [rsp+8*509], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*510],r8
	mov qword [rsp+8*511],r11
	mov qword [rsp+8*512],r12
	mov     rsi, [rsp+8*512]
	mov     rdi, [rsp+8*509]
	call    concat
	mov [rsp+8*513], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,83
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*514],r8
	mov qword [rsp+8*515],r11
	mov qword [rsp+8*516],r12
	mov     rsi, [rsp+8*516]
	mov     rdi, [rsp+8*513]
	call    concat
	mov [rsp+8*517], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*518],r8
	mov qword [rsp+8*519],r11
	mov qword [rsp+8*520],r12
	mov     rsi, [rsp+8*520]
	mov     rdi, [rsp+8*517]
	call    concat
	mov [rsp+8*521], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*522],r8
	mov qword [rsp+8*523],r11
	mov qword [rsp+8*524],r12
	mov     rsi, [rsp+8*524]
	mov     rdi, [rsp+8*521]
	call    concat
	mov [rsp+8*525], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*526],r8
	mov qword [rsp+8*527],r11
	mov qword [rsp+8*528],r12
	mov     rsi, [rsp+8*528]
	mov     rdi, [rsp+8*525]
	call    concat
	mov [rsp+8*529], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*529]
	call    concat
	mov [rsp+8*530], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,17
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*531],r8
	mov qword [rsp+8*532],r11
	mov qword [rsp+8*533],r12
	mov     rsi, [rsp+8*533]
	mov     rdi, [rsp+8*530]
	call    concat
	mov [rsp+8*534], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*534]
	call    concat
	mov [rsp+8*535], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*536],r8
	mov qword [rsp+8*537],r11
	mov qword [rsp+8*538],r12
	mov     rsi, [rsp+8*538]
	mov     rdi, [rsp+8*535]
	call    concat
	mov [rsp+8*539], rax
	mov r9, qword [rsp+8*539]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*540],r10
	mov rdi,[rsp+8*540] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,68
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*541],r8
	mov r8, [r15]
	mov qword [rsp+8*546],r8
	mov qword [rsp+8*542],r11
	mov qword [rsp+8*543],r12
	mov qword [rsp+8*544],r13
	mov qword [rsp+8*545],r15
	mov     rsi, [rsp+8*546]
	mov     rdi, [rsp+8*543]
	call    concat
	mov [rsp+8*547], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*548],r8
	mov qword [rsp+8*549],r11
	mov qword [rsp+8*550],r12
	mov     rsi, [rsp+8*550]
	mov     rdi, [rsp+8*547]
	call    concat
	mov [rsp+8*551], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,86
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*552],r8
	mov qword [rsp+8*553],r11
	mov qword [rsp+8*554],r12
	mov     rsi, [rsp+8*554]
	mov     rdi, [rsp+8*551]
	call    concat
	mov [rsp+8*555], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*556],r8
	mov qword [rsp+8*557],r11
	mov qword [rsp+8*558],r12
	mov     rsi, [rsp+8*558]
	mov     rdi, [rsp+8*555]
	call    concat
	mov [rsp+8*559], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*560],r8
	mov qword [rsp+8*561],r11
	mov qword [rsp+8*562],r12
	mov     rsi, [rsp+8*562]
	mov     rdi, [rsp+8*559]
	call    concat
	mov [rsp+8*563], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,18
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*564],r8
	mov qword [rsp+8*565],r11
	mov qword [rsp+8*566],r12
	mov     rsi, [rsp+8*566]
	mov     rdi, [rsp+8*563]
	call    concat
	mov [rsp+8*567], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*568],r8
	mov qword [rsp+8*569],r11
	mov qword [rsp+8*570],r12
	mov     rsi, [rsp+8*570]
	mov     rdi, [rsp+8*567]
	call    concat
	mov [rsp+8*571], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*572],r8
	mov qword [rsp+8*573],r11
	mov qword [rsp+8*574],r12
	mov     rsi, [rsp+8*574]
	mov     rdi, [rsp+8*571]
	call    concat
	mov [rsp+8*575], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,67
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*576],r8
	mov qword [rsp+8*577],r11
	mov qword [rsp+8*578],r12
	mov     rsi, [rsp+8*578]
	mov     rdi, [rsp+8*575]
	call    concat
	mov [rsp+8*579], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*580],r8
	mov qword [rsp+8*581],r11
	mov qword [rsp+8*582],r12
	mov     rsi, [rsp+8*582]
	mov     rdi, [rsp+8*579]
	call    concat
	mov [rsp+8*583], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,83
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*584],r8
	mov qword [rsp+8*585],r11
	mov qword [rsp+8*586],r12
	mov     rsi, [rsp+8*586]
	mov     rdi, [rsp+8*583]
	call    concat
	mov [rsp+8*587], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*588],r8
	mov qword [rsp+8*589],r11
	mov qword [rsp+8*590],r12
	mov     rsi, [rsp+8*590]
	mov     rdi, [rsp+8*587]
	call    concat
	mov [rsp+8*591], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*592],r8
	mov qword [rsp+8*593],r11
	mov qword [rsp+8*594],r12
	mov     rsi, [rsp+8*594]
	mov     rdi, [rsp+8*591]
	call    concat
	mov [rsp+8*595], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*596],r8
	mov qword [rsp+8*597],r11
	mov qword [rsp+8*598],r12
	mov     rsi, [rsp+8*598]
	mov     rdi, [rsp+8*595]
	call    concat
	mov [rsp+8*599], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*599]
	call    concat
	mov [rsp+8*600], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,18
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*601],r8
	mov qword [rsp+8*602],r11
	mov qword [rsp+8*603],r12
	mov     rsi, [rsp+8*603]
	mov     rdi, [rsp+8*600]
	call    concat
	mov [rsp+8*604], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*604]
	call    concat
	mov [rsp+8*605], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*606],r8
	mov qword [rsp+8*607],r11
	mov qword [rsp+8*608],r12
	mov     rsi, [rsp+8*608]
	mov     rdi, [rsp+8*605]
	call    concat
	mov [rsp+8*609], rax
	mov r9, qword [rsp+8*609]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*610],r10
	mov rdi,[rsp+8*610] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,68
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*611],r8
	mov r8, [r15]
	mov qword [rsp+8*616],r8
	mov qword [rsp+8*612],r11
	mov qword [rsp+8*613],r12
	mov qword [rsp+8*614],r13
	mov qword [rsp+8*615],r15
	mov     rsi, [rsp+8*616]
	mov     rdi, [rsp+8*613]
	call    concat
	mov [rsp+8*617], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*618],r8
	mov qword [rsp+8*619],r11
	mov qword [rsp+8*620],r12
	mov     rsi, [rsp+8*620]
	mov     rdi, [rsp+8*617]
	call    concat
	mov [rsp+8*621], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,86
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*622],r8
	mov qword [rsp+8*623],r11
	mov qword [rsp+8*624],r12
	mov     rsi, [rsp+8*624]
	mov     rdi, [rsp+8*621]
	call    concat
	mov [rsp+8*625], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*626],r8
	mov qword [rsp+8*627],r11
	mov qword [rsp+8*628],r12
	mov     rsi, [rsp+8*628]
	mov     rdi, [rsp+8*625]
	call    concat
	mov [rsp+8*629], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*630],r8
	mov qword [rsp+8*631],r11
	mov qword [rsp+8*632],r12
	mov     rsi, [rsp+8*632]
	mov     rdi, [rsp+8*629]
	call    concat
	mov [rsp+8*633], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,19
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*634],r8
	mov qword [rsp+8*635],r11
	mov qword [rsp+8*636],r12
	mov     rsi, [rsp+8*636]
	mov     rdi, [rsp+8*633]
	call    concat
	mov [rsp+8*637], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*638],r8
	mov qword [rsp+8*639],r11
	mov qword [rsp+8*640],r12
	mov     rsi, [rsp+8*640]
	mov     rdi, [rsp+8*637]
	call    concat
	mov [rsp+8*641], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*642],r8
	mov qword [rsp+8*643],r11
	mov qword [rsp+8*644],r12
	mov     rsi, [rsp+8*644]
	mov     rdi, [rsp+8*641]
	call    concat
	mov [rsp+8*645], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,67
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*646],r8
	mov qword [rsp+8*647],r11
	mov qword [rsp+8*648],r12
	mov     rsi, [rsp+8*648]
	mov     rdi, [rsp+8*645]
	call    concat
	mov [rsp+8*649], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*650],r8
	mov qword [rsp+8*651],r11
	mov qword [rsp+8*652],r12
	mov     rsi, [rsp+8*652]
	mov     rdi, [rsp+8*649]
	call    concat
	mov [rsp+8*653], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,83
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*654],r8
	mov qword [rsp+8*655],r11
	mov qword [rsp+8*656],r12
	mov     rsi, [rsp+8*656]
	mov     rdi, [rsp+8*653]
	call    concat
	mov [rsp+8*657], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*658],r8
	mov qword [rsp+8*659],r11
	mov qword [rsp+8*660],r12
	mov     rsi, [rsp+8*660]
	mov     rdi, [rsp+8*657]
	call    concat
	mov [rsp+8*661], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*662],r8
	mov qword [rsp+8*663],r11
	mov qword [rsp+8*664],r12
	mov     rsi, [rsp+8*664]
	mov     rdi, [rsp+8*661]
	call    concat
	mov [rsp+8*665], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*666],r8
	mov qword [rsp+8*667],r11
	mov qword [rsp+8*668],r12
	mov     rsi, [rsp+8*668]
	mov     rdi, [rsp+8*665]
	call    concat
	mov [rsp+8*669], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*669]
	call    concat
	mov [rsp+8*670], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,19
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*671],r8
	mov qword [rsp+8*672],r11
	mov qword [rsp+8*673],r12
	mov     rsi, [rsp+8*673]
	mov     rdi, [rsp+8*670]
	call    concat
	mov [rsp+8*674], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*674]
	call    concat
	mov [rsp+8*675], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*676],r8
	mov qword [rsp+8*677],r11
	mov qword [rsp+8*678],r12
	mov     rsi, [rsp+8*678]
	mov     rdi, [rsp+8*675]
	call    concat
	mov [rsp+8*679], rax
	mov r9, qword [rsp+8*679]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*680],r10
	mov rdi,[rsp+8*680] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,68
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*681],r8
	mov r8, [r15]
	mov qword [rsp+8*686],r8
	mov qword [rsp+8*682],r11
	mov qword [rsp+8*683],r12
	mov qword [rsp+8*684],r13
	mov qword [rsp+8*685],r15
	mov     rsi, [rsp+8*686]
	mov     rdi, [rsp+8*683]
	call    concat
	mov [rsp+8*687], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*688],r8
	mov qword [rsp+8*689],r11
	mov qword [rsp+8*690],r12
	mov     rsi, [rsp+8*690]
	mov     rdi, [rsp+8*687]
	call    concat
	mov [rsp+8*691], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,86
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*692],r8
	mov qword [rsp+8*693],r11
	mov qword [rsp+8*694],r12
	mov     rsi, [rsp+8*694]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*695], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*696],r8
	mov qword [rsp+8*697],r11
	mov qword [rsp+8*698],r12
	mov     rsi, [rsp+8*698]
	mov     rdi, [rsp+8*695]
	call    concat
	mov [rsp+8*699], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*700],r8
	mov qword [rsp+8*701],r11
	mov qword [rsp+8*702],r12
	mov     rsi, [rsp+8*702]
	mov     rdi, [rsp+8*699]
	call    concat
	mov [rsp+8*703], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,20
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*704],r8
	mov qword [rsp+8*705],r11
	mov qword [rsp+8*706],r12
	mov     rsi, [rsp+8*706]
	mov     rdi, [rsp+8*703]
	call    concat
	mov [rsp+8*707], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*708],r8
	mov qword [rsp+8*709],r11
	mov qword [rsp+8*710],r12
	mov     rsi, [rsp+8*710]
	mov     rdi, [rsp+8*707]
	call    concat
	mov [rsp+8*711], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*712],r8
	mov qword [rsp+8*713],r11
	mov qword [rsp+8*714],r12
	mov     rsi, [rsp+8*714]
	mov     rdi, [rsp+8*711]
	call    concat
	mov [rsp+8*715], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,67
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*716],r8
	mov qword [rsp+8*717],r11
	mov qword [rsp+8*718],r12
	mov     rsi, [rsp+8*718]
	mov     rdi, [rsp+8*715]
	call    concat
	mov [rsp+8*719], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*720],r8
	mov qword [rsp+8*721],r11
	mov qword [rsp+8*722],r12
	mov     rsi, [rsp+8*722]
	mov     rdi, [rsp+8*719]
	call    concat
	mov [rsp+8*723], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,83
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*724],r8
	mov qword [rsp+8*725],r11
	mov qword [rsp+8*726],r12
	mov     rsi, [rsp+8*726]
	mov     rdi, [rsp+8*723]
	call    concat
	mov [rsp+8*727], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*728],r8
	mov qword [rsp+8*729],r11
	mov qword [rsp+8*730],r12
	mov     rsi, [rsp+8*730]
	mov     rdi, [rsp+8*727]
	call    concat
	mov [rsp+8*731], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*732],r8
	mov qword [rsp+8*733],r11
	mov qword [rsp+8*734],r12
	mov     rsi, [rsp+8*734]
	mov     rdi, [rsp+8*731]
	call    concat
	mov [rsp+8*735], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*736],r8
	mov qword [rsp+8*737],r11
	mov qword [rsp+8*738],r12
	mov     rsi, [rsp+8*738]
	mov     rdi, [rsp+8*735]
	call    concat
	mov [rsp+8*739], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*739]
	call    concat
	mov [rsp+8*740], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,20
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*741],r8
	mov qword [rsp+8*742],r11
	mov qword [rsp+8*743],r12
	mov     rsi, [rsp+8*743]
	mov     rdi, [rsp+8*740]
	call    concat
	mov [rsp+8*744], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*745], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*746],r8
	mov qword [rsp+8*747],r11
	mov qword [rsp+8*748],r12
	mov     rsi, [rsp+8*748]
	mov     rdi, [rsp+8*745]
	call    concat
	mov [rsp+8*749], rax
	mov r9, qword [rsp+8*749]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*750],r10
	mov rdi,[rsp+8*750] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,68
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*751],r8
	mov r8, [r15]
	mov qword [rsp+8*756],r8
	mov qword [rsp+8*752],r11
	mov qword [rsp+8*753],r12
	mov qword [rsp+8*754],r13
	mov qword [rsp+8*755],r15
	mov     rsi, [rsp+8*756]
	mov     rdi, [rsp+8*753]
	call    concat
	mov [rsp+8*757], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*758],r8
	mov qword [rsp+8*759],r11
	mov qword [rsp+8*760],r12
	mov     rsi, [rsp+8*760]
	mov     rdi, [rsp+8*757]
	call    concat
	mov [rsp+8*761], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,86
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*762],r8
	mov qword [rsp+8*763],r11
	mov qword [rsp+8*764],r12
	mov     rsi, [rsp+8*764]
	mov     rdi, [rsp+8*761]
	call    concat
	mov [rsp+8*765], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*766],r8
	mov qword [rsp+8*767],r11
	mov qword [rsp+8*768],r12
	mov     rsi, [rsp+8*768]
	mov     rdi, [rsp+8*765]
	call    concat
	mov [rsp+8*769], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*770],r8
	mov qword [rsp+8*771],r11
	mov qword [rsp+8*772],r12
	mov     rsi, [rsp+8*772]
	mov     rdi, [rsp+8*769]
	call    concat
	mov [rsp+8*773], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,21
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*774],r8
	mov qword [rsp+8*775],r11
	mov qword [rsp+8*776],r12
	mov     rsi, [rsp+8*776]
	mov     rdi, [rsp+8*773]
	call    concat
	mov [rsp+8*777], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*778],r8
	mov qword [rsp+8*779],r11
	mov qword [rsp+8*780],r12
	mov     rsi, [rsp+8*780]
	mov     rdi, [rsp+8*777]
	call    concat
	mov [rsp+8*781], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*782],r8
	mov qword [rsp+8*783],r11
	mov qword [rsp+8*784],r12
	mov     rsi, [rsp+8*784]
	mov     rdi, [rsp+8*781]
	call    concat
	mov [rsp+8*785], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,67
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*786],r8
	mov qword [rsp+8*787],r11
	mov qword [rsp+8*788],r12
	mov     rsi, [rsp+8*788]
	mov     rdi, [rsp+8*785]
	call    concat
	mov [rsp+8*789], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*790],r8
	mov qword [rsp+8*791],r11
	mov qword [rsp+8*792],r12
	mov     rsi, [rsp+8*792]
	mov     rdi, [rsp+8*789]
	call    concat
	mov [rsp+8*793], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,83
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*794],r8
	mov qword [rsp+8*795],r11
	mov qword [rsp+8*796],r12
	mov     rsi, [rsp+8*796]
	mov     rdi, [rsp+8*793]
	call    concat
	mov [rsp+8*797], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*798],r8
	mov qword [rsp+8*799],r11
	mov qword [rsp+8*800],r12
	mov     rsi, [rsp+8*800]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*801], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*802],r8
	mov qword [rsp+8*803],r11
	mov qword [rsp+8*804],r12
	mov     rsi, [rsp+8*804]
	mov     rdi, [rsp+8*801]
	call    concat
	mov [rsp+8*805], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*806],r8
	mov qword [rsp+8*807],r11
	mov qword [rsp+8*808],r12
	mov     rsi, [rsp+8*808]
	mov     rdi, [rsp+8*805]
	call    concat
	mov [rsp+8*809], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*809]
	call    concat
	mov [rsp+8*810], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,21
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*811],r8
	mov qword [rsp+8*812],r11
	mov qword [rsp+8*813],r12
	mov     rsi, [rsp+8*813]
	mov     rdi, [rsp+8*810]
	call    concat
	mov [rsp+8*814], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*814]
	call    concat
	mov [rsp+8*815], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*816],r8
	mov qword [rsp+8*817],r11
	mov qword [rsp+8*818],r12
	mov     rsi, [rsp+8*818]
	mov     rdi, [rsp+8*815]
	call    concat
	mov [rsp+8*819], rax
	mov r9, qword [rsp+8*819]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*820],r10
	mov rdi,[rsp+8*820] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,68
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*821],r8
	mov r8, [r15]
	mov qword [rsp+8*826],r8
	mov qword [rsp+8*822],r11
	mov qword [rsp+8*823],r12
	mov qword [rsp+8*824],r13
	mov qword [rsp+8*825],r15
	mov     rsi, [rsp+8*826]
	mov     rdi, [rsp+8*823]
	call    concat
	mov [rsp+8*827], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*828],r8
	mov qword [rsp+8*829],r11
	mov qword [rsp+8*830],r12
	mov     rsi, [rsp+8*830]
	mov     rdi, [rsp+8*827]
	call    concat
	mov [rsp+8*831], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,86
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*832],r8
	mov qword [rsp+8*833],r11
	mov qword [rsp+8*834],r12
	mov     rsi, [rsp+8*834]
	mov     rdi, [rsp+8*831]
	call    concat
	mov [rsp+8*835], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*836],r8
	mov qword [rsp+8*837],r11
	mov qword [rsp+8*838],r12
	mov     rsi, [rsp+8*838]
	mov     rdi, [rsp+8*835]
	call    concat
	mov [rsp+8*839], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*840],r8
	mov qword [rsp+8*841],r11
	mov qword [rsp+8*842],r12
	mov     rsi, [rsp+8*842]
	mov     rdi, [rsp+8*839]
	call    concat
	mov [rsp+8*843], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,22
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*844],r8
	mov qword [rsp+8*845],r11
	mov qword [rsp+8*846],r12
	mov     rsi, [rsp+8*846]
	mov     rdi, [rsp+8*843]
	call    concat
	mov [rsp+8*847], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*848],r8
	mov qword [rsp+8*849],r11
	mov qword [rsp+8*850],r12
	mov     rsi, [rsp+8*850]
	mov     rdi, [rsp+8*847]
	call    concat
	mov [rsp+8*851], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*852],r8
	mov qword [rsp+8*853],r11
	mov qword [rsp+8*854],r12
	mov     rsi, [rsp+8*854]
	mov     rdi, [rsp+8*851]
	call    concat
	mov [rsp+8*855], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,67
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*856],r8
	mov qword [rsp+8*857],r11
	mov qword [rsp+8*858],r12
	mov     rsi, [rsp+8*858]
	mov     rdi, [rsp+8*855]
	call    concat
	mov [rsp+8*859], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*860],r8
	mov qword [rsp+8*861],r11
	mov qword [rsp+8*862],r12
	mov     rsi, [rsp+8*862]
	mov     rdi, [rsp+8*859]
	call    concat
	mov [rsp+8*863], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,83
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*864],r8
	mov qword [rsp+8*865],r11
	mov qword [rsp+8*866],r12
	mov     rsi, [rsp+8*866]
	mov     rdi, [rsp+8*863]
	call    concat
	mov [rsp+8*867], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*868],r8
	mov qword [rsp+8*869],r11
	mov qword [rsp+8*870],r12
	mov     rsi, [rsp+8*870]
	mov     rdi, [rsp+8*867]
	call    concat
	mov [rsp+8*871], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*872],r8
	mov qword [rsp+8*873],r11
	mov qword [rsp+8*874],r12
	mov     rsi, [rsp+8*874]
	mov     rdi, [rsp+8*871]
	call    concat
	mov [rsp+8*875], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*876],r8
	mov qword [rsp+8*877],r11
	mov qword [rsp+8*878],r12
	mov     rsi, [rsp+8*878]
	mov     rdi, [rsp+8*875]
	call    concat
	mov [rsp+8*879], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*879]
	call    concat
	mov [rsp+8*880], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,22
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*881],r8
	mov qword [rsp+8*882],r11
	mov qword [rsp+8*883],r12
	mov     rsi, [rsp+8*883]
	mov     rdi, [rsp+8*880]
	call    concat
	mov [rsp+8*884], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*884]
	call    concat
	mov [rsp+8*885], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*886],r8
	mov qword [rsp+8*887],r11
	mov qword [rsp+8*888],r12
	mov     rsi, [rsp+8*888]
	mov     rdi, [rsp+8*885]
	call    concat
	mov [rsp+8*889], rax
	mov r9, qword [rsp+8*889]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*890],r10
	mov rdi,[rsp+8*890] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,68
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*891],r8
	mov r8, [r15]
	mov qword [rsp+8*896],r8
	mov qword [rsp+8*892],r11
	mov qword [rsp+8*893],r12
	mov qword [rsp+8*894],r13
	mov qword [rsp+8*895],r15
	mov     rsi, [rsp+8*896]
	mov     rdi, [rsp+8*893]
	call    concat
	mov [rsp+8*897], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*898],r8
	mov qword [rsp+8*899],r11
	mov qword [rsp+8*900],r12
	mov     rsi, [rsp+8*900]
	mov     rdi, [rsp+8*897]
	call    concat
	mov [rsp+8*901], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,86
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*902],r8
	mov qword [rsp+8*903],r11
	mov qword [rsp+8*904],r12
	mov     rsi, [rsp+8*904]
	mov     rdi, [rsp+8*901]
	call    concat
	mov [rsp+8*905], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*906],r8
	mov qword [rsp+8*907],r11
	mov qword [rsp+8*908],r12
	mov     rsi, [rsp+8*908]
	mov     rdi, [rsp+8*905]
	call    concat
	mov [rsp+8*909], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*910],r8
	mov qword [rsp+8*911],r11
	mov qword [rsp+8*912],r12
	mov     rsi, [rsp+8*912]
	mov     rdi, [rsp+8*909]
	call    concat
	mov [rsp+8*913], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,23
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*914],r8
	mov qword [rsp+8*915],r11
	mov qword [rsp+8*916],r12
	mov     rsi, [rsp+8*916]
	mov     rdi, [rsp+8*913]
	call    concat
	mov [rsp+8*917], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*918],r8
	mov qword [rsp+8*919],r11
	mov qword [rsp+8*920],r12
	mov     rsi, [rsp+8*920]
	mov     rdi, [rsp+8*917]
	call    concat
	mov [rsp+8*921], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*922],r8
	mov qword [rsp+8*923],r11
	mov qword [rsp+8*924],r12
	mov     rsi, [rsp+8*924]
	mov     rdi, [rsp+8*921]
	call    concat
	mov [rsp+8*925], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,67
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*926],r8
	mov qword [rsp+8*927],r11
	mov qword [rsp+8*928],r12
	mov     rsi, [rsp+8*928]
	mov     rdi, [rsp+8*925]
	call    concat
	mov [rsp+8*929], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*930],r8
	mov qword [rsp+8*931],r11
	mov qword [rsp+8*932],r12
	mov     rsi, [rsp+8*932]
	mov     rdi, [rsp+8*929]
	call    concat
	mov [rsp+8*933], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,83
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*934],r8
	mov qword [rsp+8*935],r11
	mov qword [rsp+8*936],r12
	mov     rsi, [rsp+8*936]
	mov     rdi, [rsp+8*933]
	call    concat
	mov [rsp+8*937], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*938],r8
	mov qword [rsp+8*939],r11
	mov qword [rsp+8*940],r12
	mov     rsi, [rsp+8*940]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*941], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*942],r8
	mov qword [rsp+8*943],r11
	mov qword [rsp+8*944],r12
	mov     rsi, [rsp+8*944]
	mov     rdi, [rsp+8*941]
	call    concat
	mov [rsp+8*945], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*946],r8
	mov qword [rsp+8*947],r11
	mov qword [rsp+8*948],r12
	mov     rsi, [rsp+8*948]
	mov     rdi, [rsp+8*945]
	call    concat
	mov [rsp+8*949], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*949]
	call    concat
	mov [rsp+8*950], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,23
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*951],r8
	mov qword [rsp+8*952],r11
	mov qword [rsp+8*953],r12
	mov     rsi, [rsp+8*953]
	mov     rdi, [rsp+8*950]
	call    concat
	mov [rsp+8*954], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*954]
	call    concat
	mov [rsp+8*955], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*956],r8
	mov qword [rsp+8*957],r11
	mov qword [rsp+8*958],r12
	mov     rsi, [rsp+8*958]
	mov     rdi, [rsp+8*955]
	call    concat
	mov [rsp+8*959], rax
	mov r9, qword [rsp+8*959]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*960],r10
	mov rdi,[rsp+8*960] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,68
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*961],r8
	mov r8, [r15]
	mov qword [rsp+8*966],r8
	mov qword [rsp+8*962],r11
	mov qword [rsp+8*963],r12
	mov qword [rsp+8*964],r13
	mov qword [rsp+8*965],r15
	mov     rsi, [rsp+8*966]
	mov     rdi, [rsp+8*963]
	call    concat
	mov [rsp+8*967], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*968],r8
	mov qword [rsp+8*969],r11
	mov qword [rsp+8*970],r12
	mov     rsi, [rsp+8*970]
	mov     rdi, [rsp+8*967]
	call    concat
	mov [rsp+8*971], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,86
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*972],r8
	mov qword [rsp+8*973],r11
	mov qword [rsp+8*974],r12
	mov     rsi, [rsp+8*974]
	mov     rdi, [rsp+8*971]
	call    concat
	mov [rsp+8*975], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*976],r8
	mov qword [rsp+8*977],r11
	mov qword [rsp+8*978],r12
	mov     rsi, [rsp+8*978]
	mov     rdi, [rsp+8*975]
	call    concat
	mov [rsp+8*979], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*980],r8
	mov qword [rsp+8*981],r11
	mov qword [rsp+8*982],r12
	mov     rsi, [rsp+8*982]
	mov     rdi, [rsp+8*979]
	call    concat
	mov [rsp+8*983], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,24
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*984],r8
	mov qword [rsp+8*985],r11
	mov qword [rsp+8*986],r12
	mov     rsi, [rsp+8*986]
	mov     rdi, [rsp+8*983]
	call    concat
	mov [rsp+8*987], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*988],r8
	mov qword [rsp+8*989],r11
	mov qword [rsp+8*990],r12
	mov     rsi, [rsp+8*990]
	mov     rdi, [rsp+8*987]
	call    concat
	mov [rsp+8*991], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*992],r8
	mov qword [rsp+8*993],r11
	mov qword [rsp+8*994],r12
	mov     rsi, [rsp+8*994]
	mov     rdi, [rsp+8*991]
	call    concat
	mov [rsp+8*995], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,67
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*996],r8
	mov qword [rsp+8*997],r11
	mov qword [rsp+8*998],r12
	mov     rsi, [rsp+8*998]
	mov     rdi, [rsp+8*995]
	call    concat
	mov [rsp+8*999], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1000],r8
	mov qword [rsp+8*1001],r11
	mov qword [rsp+8*1002],r12
	mov     rsi, [rsp+8*1002]
	mov     rdi, [rsp+8*999]
	call    concat
	mov [rsp+8*1003], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,83
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1004],r8
	mov qword [rsp+8*1005],r11
	mov qword [rsp+8*1006],r12
	mov     rsi, [rsp+8*1006]
	mov     rdi, [rsp+8*1003]
	call    concat
	mov [rsp+8*1007], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1008],r8
	mov qword [rsp+8*1009],r11
	mov qword [rsp+8*1010],r12
	mov     rsi, [rsp+8*1010]
	mov     rdi, [rsp+8*1007]
	call    concat
	mov [rsp+8*1011], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1012],r8
	mov qword [rsp+8*1013],r11
	mov qword [rsp+8*1014],r12
	mov     rsi, [rsp+8*1014]
	mov     rdi, [rsp+8*1011]
	call    concat
	mov [rsp+8*1015], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1016],r8
	mov qword [rsp+8*1017],r11
	mov qword [rsp+8*1018],r12
	mov     rsi, [rsp+8*1018]
	mov     rdi, [rsp+8*1015]
	call    concat
	mov [rsp+8*1019], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1019]
	call    concat
	mov [rsp+8*1020], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,24
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1021],r8
	mov qword [rsp+8*1022],r11
	mov qword [rsp+8*1023],r12
	mov     rsi, [rsp+8*1023]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1024], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1024]
	call    concat
	mov [rsp+8*1025], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1026],r8
	mov qword [rsp+8*1027],r11
	mov qword [rsp+8*1028],r12
	mov     rsi, [rsp+8*1028]
	mov     rdi, [rsp+8*1025]
	call    concat
	mov [rsp+8*1029], rax
	mov r9, qword [rsp+8*1029]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*1030],r10
	mov rdi,[rsp+8*1030] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,91
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov r14,r13
	mov qword [rsp+8*1031],r8
	mov qword [rsp+8*1032],r11
	mov qword [rsp+8*1033],r12
	mov qword [arg+8*0],r13
	mov qword [rsp+8*1034],r14
	mov rdi,[rsp+8*1034] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,82
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*1035],r8
	mov r8, [r15]
	mov qword [rsp+8*1040],r8
	mov qword [rsp+8*1036],r11
	mov qword [rsp+8*1037],r12
	mov qword [rsp+8*1038],r13
	mov qword [rsp+8*1039],r15
	mov     rsi, [rsp+8*1040]
	mov     rdi, [rsp+8*1037]
	call    concat
	mov [rsp+8*1041], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1042],r8
	mov qword [rsp+8*1043],r11
	mov qword [rsp+8*1044],r12
	mov     rsi, [rsp+8*1044]
	mov     rdi, [rsp+8*1041]
	call    concat
	mov [rsp+8*1045], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1046],r8
	mov qword [rsp+8*1047],r11
	mov qword [rsp+8*1048],r12
	mov     rsi, [rsp+8*1048]
	mov     rdi, [rsp+8*1045]
	call    concat
	mov [rsp+8*1049], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1050],r8
	mov qword [rsp+8*1051],r11
	mov qword [rsp+8*1052],r12
	mov     rsi, [rsp+8*1052]
	mov     rdi, [rsp+8*1049]
	call    concat
	mov [rsp+8*1053], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1054],r8
	mov qword [rsp+8*1055],r11
	mov qword [rsp+8*1056],r12
	mov     rsi, [rsp+8*1056]
	mov     rdi, [rsp+8*1053]
	call    concat
	mov [rsp+8*1057], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,58
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1058],r8
	mov qword [rsp+8*1059],r11
	mov qword [rsp+8*1060],r12
	mov     rsi, [rsp+8*1060]
	mov     rdi, [rsp+8*1057]
	call    concat
	mov [rsp+8*1061], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,59
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1062],r8
	mov qword [rsp+8*1063],r11
	mov qword [rsp+8*1064],r12
	mov     rsi, [rsp+8*1064]
	mov     rdi, [rsp+8*1061]
	call    concat
	mov [rsp+8*1065], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1066],r8
	mov qword [rsp+8*1067],r11
	mov qword [rsp+8*1068],r12
	mov     rsi, [rsp+8*1068]
	mov     rdi, [rsp+8*1065]
	call    concat
	mov [rsp+8*1069], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1070],r8
	mov qword [rsp+8*1071],r11
	mov qword [rsp+8*1072],r12
	mov     rsi, [rsp+8*1072]
	mov     rdi, [rsp+8*1069]
	call    concat
	mov [rsp+8*1073], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1074],r8
	mov qword [rsp+8*1075],r11
	mov qword [rsp+8*1076],r12
	mov     rsi, [rsp+8*1076]
	mov     rdi, [rsp+8*1073]
	call    concat
	mov [rsp+8*1077], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1078],r8
	mov qword [rsp+8*1079],r11
	mov qword [rsp+8*1080],r12
	mov     rsi, [rsp+8*1080]
	mov     rdi, [rsp+8*1077]
	call    concat
	mov [rsp+8*1081], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,67
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1082],r8
	mov qword [rsp+8*1083],r11
	mov qword [rsp+8*1084],r12
	mov     rsi, [rsp+8*1084]
	mov     rdi, [rsp+8*1081]
	call    concat
	mov [rsp+8*1085], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,85
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1086],r8
	mov qword [rsp+8*1087],r11
	mov qword [rsp+8*1088],r12
	mov     rsi, [rsp+8*1088]
	mov     rdi, [rsp+8*1085]
	call    concat
	mov [rsp+8*1089], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1090],r8
	mov qword [rsp+8*1091],r11
	mov qword [rsp+8*1092],r12
	mov     rsi, [rsp+8*1092]
	mov     rdi, [rsp+8*1089]
	call    concat
	mov [rsp+8*1093], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1094],r8
	mov qword [rsp+8*1095],r11
	mov qword [rsp+8*1096],r12
	mov     rsi, [rsp+8*1096]
	mov     rdi, [rsp+8*1093]
	call    concat
	mov [rsp+8*1097], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1098],r8
	mov qword [rsp+8*1099],r11
	mov qword [rsp+8*1100],r12
	mov     rsi, [rsp+8*1100]
	mov     rdi, [rsp+8*1097]
	call    concat
	mov [rsp+8*1101], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1102],r8
	mov qword [rsp+8*1103],r11
	mov qword [rsp+8*1104],r12
	mov     rsi, [rsp+8*1104]
	mov     rdi, [rsp+8*1101]
	call    concat
	mov [rsp+8*1105], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1106],r8
	mov qword [rsp+8*1107],r11
	mov qword [rsp+8*1108],r12
	mov     rsi, [rsp+8*1108]
	mov     rdi, [rsp+8*1105]
	call    concat
	mov [rsp+8*1109], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1110],r8
	mov qword [rsp+8*1111],r11
	mov qword [rsp+8*1112],r12
	mov     rsi, [rsp+8*1112]
	mov     rdi, [rsp+8*1109]
	call    concat
	mov [rsp+8*1113], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1114],r8
	mov qword [rsp+8*1115],r11
	mov qword [rsp+8*1116],r12
	mov     rsi, [rsp+8*1116]
	mov     rdi, [rsp+8*1113]
	call    concat
	mov [rsp+8*1117], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,58
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1118],r8
	mov qword [rsp+8*1119],r11
	mov qword [rsp+8*1120],r12
	mov     rsi, [rsp+8*1120]
	mov     rdi, [rsp+8*1117]
	call    concat
	mov [rsp+8*1121], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,17
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1122],r8
	mov qword [rsp+8*1123],r11
	mov qword [rsp+8*1124],r12
	mov     rsi, [rsp+8*1124]
	mov     rdi, [rsp+8*1121]
	call    concat
	mov [rsp+8*1125], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,20
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1126],r8
	mov qword [rsp+8*1127],r11
	mov qword [rsp+8*1128],r12
	mov     rsi, [rsp+8*1128]
	mov     rdi, [rsp+8*1125]
	call    concat
	mov [rsp+8*1129], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,21
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1130],r8
	mov qword [rsp+8*1131],r11
	mov qword [rsp+8*1132],r12
	mov     rsi, [rsp+8*1132]
	mov     rdi, [rsp+8*1129]
	call    concat
	mov [rsp+8*1133], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,59
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1134],r8
	mov qword [rsp+8*1135],r11
	mov qword [rsp+8*1136],r12
	mov     rsi, [rsp+8*1136]
	mov     rdi, [rsp+8*1133]
	call    concat
	mov [rsp+8*1137], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1138],r8
	mov qword [rsp+8*1139],r11
	mov qword [rsp+8*1140],r12
	mov     rsi, [rsp+8*1140]
	mov     rdi, [rsp+8*1137]
	call    concat
	mov [rsp+8*1141], rax
	mov r9, qword [rsp+8*1141]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*1142],r10
	mov rdi,[rsp+8*1142] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,82
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*1143],r8
	mov r8, [r15]
	mov qword [rsp+8*1148],r8
	mov qword [rsp+8*1144],r11
	mov qword [rsp+8*1145],r12
	mov qword [rsp+8*1146],r13
	mov qword [rsp+8*1147],r15
	mov     rsi, [rsp+8*1148]
	mov     rdi, [rsp+8*1145]
	call    concat
	mov [rsp+8*1149], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1150],r8
	mov qword [rsp+8*1151],r11
	mov qword [rsp+8*1152],r12
	mov     rsi, [rsp+8*1152]
	mov     rdi, [rsp+8*1149]
	call    concat
	mov [rsp+8*1153], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1154],r8
	mov qword [rsp+8*1155],r11
	mov qword [rsp+8*1156],r12
	mov     rsi, [rsp+8*1156]
	mov     rdi, [rsp+8*1153]
	call    concat
	mov [rsp+8*1157], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1158],r8
	mov qword [rsp+8*1159],r11
	mov qword [rsp+8*1160],r12
	mov     rsi, [rsp+8*1160]
	mov     rdi, [rsp+8*1157]
	call    concat
	mov [rsp+8*1161], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1162],r8
	mov qword [rsp+8*1163],r11
	mov qword [rsp+8*1164],r12
	mov     rsi, [rsp+8*1164]
	mov     rdi, [rsp+8*1161]
	call    concat
	mov [rsp+8*1165], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,58
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1166],r8
	mov qword [rsp+8*1167],r11
	mov qword [rsp+8*1168],r12
	mov     rsi, [rsp+8*1168]
	mov     rdi, [rsp+8*1165]
	call    concat
	mov [rsp+8*1169], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,59
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1170],r8
	mov qword [rsp+8*1171],r11
	mov qword [rsp+8*1172],r12
	mov     rsi, [rsp+8*1172]
	mov     rdi, [rsp+8*1169]
	call    concat
	mov [rsp+8*1173], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1174],r8
	mov qword [rsp+8*1175],r11
	mov qword [rsp+8*1176],r12
	mov     rsi, [rsp+8*1176]
	mov     rdi, [rsp+8*1173]
	call    concat
	mov [rsp+8*1177], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,65
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1178],r8
	mov qword [rsp+8*1179],r11
	mov qword [rsp+8*1180],r12
	mov     rsi, [rsp+8*1180]
	mov     rdi, [rsp+8*1177]
	call    concat
	mov [rsp+8*1181], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1182],r8
	mov qword [rsp+8*1183],r11
	mov qword [rsp+8*1184],r12
	mov     rsi, [rsp+8*1184]
	mov     rdi, [rsp+8*1181]
	call    concat
	mov [rsp+8*1185], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1186],r8
	mov qword [rsp+8*1187],r11
	mov qword [rsp+8*1188],r12
	mov     rsi, [rsp+8*1188]
	mov     rdi, [rsp+8*1185]
	call    concat
	mov [rsp+8*1189], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,67
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1190],r8
	mov qword [rsp+8*1191],r11
	mov qword [rsp+8*1192],r12
	mov     rsi, [rsp+8*1192]
	mov     rdi, [rsp+8*1189]
	call    concat
	mov [rsp+8*1193], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,85
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1194],r8
	mov qword [rsp+8*1195],r11
	mov qword [rsp+8*1196],r12
	mov     rsi, [rsp+8*1196]
	mov     rdi, [rsp+8*1193]
	call    concat
	mov [rsp+8*1197], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1198],r8
	mov qword [rsp+8*1199],r11
	mov qword [rsp+8*1200],r12
	mov     rsi, [rsp+8*1200]
	mov     rdi, [rsp+8*1197]
	call    concat
	mov [rsp+8*1201], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1202],r8
	mov qword [rsp+8*1203],r11
	mov qword [rsp+8*1204],r12
	mov     rsi, [rsp+8*1204]
	mov     rdi, [rsp+8*1201]
	call    concat
	mov [rsp+8*1205], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1206],r8
	mov qword [rsp+8*1207],r11
	mov qword [rsp+8*1208],r12
	mov     rsi, [rsp+8*1208]
	mov     rdi, [rsp+8*1205]
	call    concat
	mov [rsp+8*1209], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1210],r8
	mov qword [rsp+8*1211],r11
	mov qword [rsp+8*1212],r12
	mov     rsi, [rsp+8*1212]
	mov     rdi, [rsp+8*1209]
	call    concat
	mov [rsp+8*1213], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1214],r8
	mov qword [rsp+8*1215],r11
	mov qword [rsp+8*1216],r12
	mov     rsi, [rsp+8*1216]
	mov     rdi, [rsp+8*1213]
	call    concat
	mov [rsp+8*1217], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1218],r8
	mov qword [rsp+8*1219],r11
	mov qword [rsp+8*1220],r12
	mov     rsi, [rsp+8*1220]
	mov     rdi, [rsp+8*1217]
	call    concat
	mov [rsp+8*1221], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1222],r8
	mov qword [rsp+8*1223],r11
	mov qword [rsp+8*1224],r12
	mov     rsi, [rsp+8*1224]
	mov     rdi, [rsp+8*1221]
	call    concat
	mov [rsp+8*1225], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,58
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1226],r8
	mov qword [rsp+8*1227],r11
	mov qword [rsp+8*1228],r12
	mov     rsi, [rsp+8*1228]
	mov     rdi, [rsp+8*1225]
	call    concat
	mov [rsp+8*1229], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,17
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1230],r8
	mov qword [rsp+8*1231],r11
	mov qword [rsp+8*1232],r12
	mov     rsi, [rsp+8*1232]
	mov     rdi, [rsp+8*1229]
	call    concat
	mov [rsp+8*1233], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,20
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1234],r8
	mov qword [rsp+8*1235],r11
	mov qword [rsp+8*1236],r12
	mov     rsi, [rsp+8*1236]
	mov     rdi, [rsp+8*1233]
	call    concat
	mov [rsp+8*1237], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,21
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1238],r8
	mov qword [rsp+8*1239],r11
	mov qword [rsp+8*1240],r12
	mov     rsi, [rsp+8*1240]
	mov     rdi, [rsp+8*1237]
	call    concat
	mov [rsp+8*1241], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,59
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1242],r8
	mov qword [rsp+8*1243],r11
	mov qword [rsp+8*1244],r12
	mov     rsi, [rsp+8*1244]
	mov     rdi, [rsp+8*1241]
	call    concat
	mov [rsp+8*1245], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1246],r8
	mov qword [rsp+8*1247],r11
	mov qword [rsp+8*1248],r12
	mov     rsi, [rsp+8*1248]
	mov     rdi, [rsp+8*1245]
	call    concat
	mov [rsp+8*1249], rax
	mov r9, qword [rsp+8*1249]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*1250],r10
	mov rdi,[rsp+8*1250] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,82
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*1251],r8
	mov r8, [r15]
	mov qword [rsp+8*1256],r8
	mov qword [rsp+8*1252],r11
	mov qword [rsp+8*1253],r12
	mov qword [rsp+8*1254],r13
	mov qword [rsp+8*1255],r15
	mov     rsi, [rsp+8*1256]
	mov     rdi, [rsp+8*1253]
	call    concat
	mov [rsp+8*1257], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1258],r8
	mov qword [rsp+8*1259],r11
	mov qword [rsp+8*1260],r12
	mov     rsi, [rsp+8*1260]
	mov     rdi, [rsp+8*1257]
	call    concat
	mov [rsp+8*1261], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1262],r8
	mov qword [rsp+8*1263],r11
	mov qword [rsp+8*1264],r12
	mov     rsi, [rsp+8*1264]
	mov     rdi, [rsp+8*1261]
	call    concat
	mov [rsp+8*1265], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1266],r8
	mov qword [rsp+8*1267],r11
	mov qword [rsp+8*1268],r12
	mov     rsi, [rsp+8*1268]
	mov     rdi, [rsp+8*1265]
	call    concat
	mov [rsp+8*1269], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1270],r8
	mov qword [rsp+8*1271],r11
	mov qword [rsp+8*1272],r12
	mov     rsi, [rsp+8*1272]
	mov     rdi, [rsp+8*1269]
	call    concat
	mov [rsp+8*1273], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1274],r8
	mov qword [rsp+8*1275],r11
	mov qword [rsp+8*1276],r12
	mov     rsi, [rsp+8*1276]
	mov     rdi, [rsp+8*1273]
	call    concat
	mov [rsp+8*1277], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1278],r8
	mov qword [rsp+8*1279],r11
	mov qword [rsp+8*1280],r12
	mov     rsi, [rsp+8*1280]
	mov     rdi, [rsp+8*1277]
	call    concat
	mov [rsp+8*1281], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,17
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1282],r8
	mov qword [rsp+8*1283],r11
	mov qword [rsp+8*1284],r12
	mov     rsi, [rsp+8*1284]
	mov     rdi, [rsp+8*1281]
	call    concat
	mov [rsp+8*1285], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1286],r8
	mov qword [rsp+8*1287],r11
	mov qword [rsp+8*1288],r12
	mov     rsi, [rsp+8*1288]
	mov     rdi, [rsp+8*1285]
	call    concat
	mov [rsp+8*1289], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1290],r8
	mov qword [rsp+8*1291],r11
	mov qword [rsp+8*1292],r12
	mov     rsi, [rsp+8*1292]
	mov     rdi, [rsp+8*1289]
	call    concat
	mov [rsp+8*1293], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1294],r8
	mov qword [rsp+8*1295],r11
	mov qword [rsp+8*1296],r12
	mov     rsi, [rsp+8*1296]
	mov     rdi, [rsp+8*1293]
	call    concat
	mov [rsp+8*1297], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1298],r8
	mov qword [rsp+8*1299],r11
	mov qword [rsp+8*1300],r12
	mov     rsi, [rsp+8*1300]
	mov     rdi, [rsp+8*1297]
	call    concat
	mov [rsp+8*1301], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1302],r8
	mov qword [rsp+8*1303],r11
	mov qword [rsp+8*1304],r12
	mov     rsi, [rsp+8*1304]
	mov     rdi, [rsp+8*1301]
	call    concat
	mov [rsp+8*1305], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1306],r8
	mov qword [rsp+8*1307],r11
	mov qword [rsp+8*1308],r12
	mov     rsi, [rsp+8*1308]
	mov     rdi, [rsp+8*1305]
	call    concat
	mov [rsp+8*1309], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1310],r8
	mov qword [rsp+8*1311],r11
	mov qword [rsp+8*1312],r12
	mov     rsi, [rsp+8*1312]
	mov     rdi, [rsp+8*1309]
	call    concat
	mov [rsp+8*1313], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1314],r8
	mov qword [rsp+8*1315],r11
	mov qword [rsp+8*1316],r12
	mov     rsi, [rsp+8*1316]
	mov     rdi, [rsp+8*1313]
	call    concat
	mov [rsp+8*1317], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,89
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1318],r8
	mov qword [rsp+8*1319],r11
	mov qword [rsp+8*1320],r12
	mov     rsi, [rsp+8*1320]
	mov     rdi, [rsp+8*1317]
	call    concat
	mov [rsp+8*1321], rax
	mov r9, qword [rsp+8*1321]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*1322],r10
	mov rdi,[rsp+8*1322] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,68
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*1323],r8
	mov r8, [r15]
	mov qword [rsp+8*1328],r8
	mov qword [rsp+8*1324],r11
	mov qword [rsp+8*1325],r12
	mov qword [rsp+8*1326],r13
	mov qword [rsp+8*1327],r15
	mov     rsi, [rsp+8*1328]
	mov     rdi, [rsp+8*1325]
	call    concat
	mov [rsp+8*1329], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1330],r8
	mov qword [rsp+8*1331],r11
	mov qword [rsp+8*1332],r12
	mov     rsi, [rsp+8*1332]
	mov     rdi, [rsp+8*1329]
	call    concat
	mov [rsp+8*1333], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1334],r8
	mov qword [rsp+8*1335],r11
	mov qword [rsp+8*1336],r12
	mov     rsi, [rsp+8*1336]
	mov     rdi, [rsp+8*1333]
	call    concat
	mov [rsp+8*1337], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1338],r8
	mov qword [rsp+8*1339],r11
	mov qword [rsp+8*1340],r12
	mov     rsi, [rsp+8*1340]
	mov     rdi, [rsp+8*1337]
	call    concat
	mov [rsp+8*1341], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,27
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1342],r8
	mov qword [rsp+8*1343],r11
	mov qword [rsp+8*1344],r12
	mov     rsi, [rsp+8*1344]
	mov     rdi, [rsp+8*1341]
	call    concat
	mov [rsp+8*1345], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1346],r8
	mov qword [rsp+8*1347],r11
	mov qword [rsp+8*1348],r12
	mov     rsi, [rsp+8*1348]
	mov     rdi, [rsp+8*1345]
	call    concat
	mov [rsp+8*1349], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,24
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1350],r8
	mov qword [rsp+8*1351],r11
	mov qword [rsp+8*1352],r12
	mov     rsi, [rsp+8*1352]
	mov     rdi, [rsp+8*1349]
	call    concat
	mov [rsp+8*1353], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1354],r8
	mov qword [rsp+8*1355],r11
	mov qword [rsp+8*1356],r12
	mov     rsi, [rsp+8*1356]
	mov     rdi, [rsp+8*1353]
	call    concat
	mov [rsp+8*1357], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1358],r8
	mov qword [rsp+8*1359],r11
	mov qword [rsp+8*1360],r12
	mov     rsi, [rsp+8*1360]
	mov     rdi, [rsp+8*1357]
	call    concat
	mov [rsp+8*1361], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,67
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1362],r8
	mov qword [rsp+8*1363],r11
	mov qword [rsp+8*1364],r12
	mov     rsi, [rsp+8*1364]
	mov     rdi, [rsp+8*1361]
	call    concat
	mov [rsp+8*1365], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1366],r8
	mov qword [rsp+8*1367],r11
	mov qword [rsp+8*1368],r12
	mov     rsi, [rsp+8*1368]
	mov     rdi, [rsp+8*1365]
	call    concat
	mov [rsp+8*1369], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,83
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1370],r8
	mov qword [rsp+8*1371],r11
	mov qword [rsp+8*1372],r12
	mov     rsi, [rsp+8*1372]
	mov     rdi, [rsp+8*1369]
	call    concat
	mov [rsp+8*1373], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1374],r8
	mov qword [rsp+8*1375],r11
	mov qword [rsp+8*1376],r12
	mov     rsi, [rsp+8*1376]
	mov     rdi, [rsp+8*1373]
	call    concat
	mov [rsp+8*1377], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1378],r8
	mov qword [rsp+8*1379],r11
	mov qword [rsp+8*1380],r12
	mov     rsi, [rsp+8*1380]
	mov     rdi, [rsp+8*1377]
	call    concat
	mov [rsp+8*1381], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1382],r8
	mov qword [rsp+8*1383],r11
	mov qword [rsp+8*1384],r12
	mov     rsi, [rsp+8*1384]
	mov     rdi, [rsp+8*1381]
	call    concat
	mov [rsp+8*1385], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1385]
	call    concat
	mov [rsp+8*1386], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1387],r8
	mov qword [rsp+8*1388],r11
	mov qword [rsp+8*1389],r12
	mov     rsi, [rsp+8*1389]
	mov     rdi, [rsp+8*1386]
	call    concat
	mov [rsp+8*1390], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,58
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1391],r8
	mov qword [rsp+8*1392],r11
	mov qword [rsp+8*1393],r12
	mov     rsi, [rsp+8*1393]
	mov     rdi, [rsp+8*1390]
	call    concat
	mov [rsp+8*1394], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1394]
	call    concat
	mov [rsp+8*1395], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,10
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1396],r8
	mov qword [rsp+8*1397],r11
	mov qword [rsp+8*1398],r12
	mov     rsi, [rsp+8*1398]
	mov     rdi, [rsp+8*1395]
	call    concat
	mov [rsp+8*1399], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,66
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1400],r8
	mov qword [rsp+8*1401],r11
	mov qword [rsp+8*1402],r12
	mov     rsi, [rsp+8*1402]
	mov     rdi, [rsp+8*1399]
	call    concat
	mov [rsp+8*1403], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1404],r8
	mov qword [rsp+8*1405],r11
	mov qword [rsp+8*1406],r12
	mov     rsi, [rsp+8*1406]
	mov     rdi, [rsp+8*1403]
	call    concat
	mov [rsp+8*1407], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1408],r8
	mov qword [rsp+8*1409],r11
	mov qword [rsp+8*1410],r12
	mov     rsi, [rsp+8*1410]
	mov     rdi, [rsp+8*1407]
	call    concat
	mov [rsp+8*1411], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1412],r8
	mov qword [rsp+8*1413],r11
	mov qword [rsp+8*1414],r12
	mov     rsi, [rsp+8*1414]
	mov     rdi, [rsp+8*1411]
	call    concat
	mov [rsp+8*1415], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1416],r8
	mov qword [rsp+8*1417],r11
	mov qword [rsp+8*1418],r12
	mov     rsi, [rsp+8*1418]
	mov     rdi, [rsp+8*1415]
	call    concat
	mov [rsp+8*1419], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1420],r8
	mov qword [rsp+8*1421],r11
	mov qword [rsp+8*1422],r12
	mov     rsi, [rsp+8*1422]
	mov     rdi, [rsp+8*1419]
	call    concat
	mov [rsp+8*1423], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1424],r8
	mov qword [rsp+8*1425],r11
	mov qword [rsp+8*1426],r12
	mov     rsi, [rsp+8*1426]
	mov     rdi, [rsp+8*1423]
	call    concat
	mov [rsp+8*1427], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1428],r8
	mov qword [rsp+8*1429],r11
	mov qword [rsp+8*1430],r12
	mov     rsi, [rsp+8*1430]
	mov     rdi, [rsp+8*1427]
	call    concat
	mov [rsp+8*1431], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,10
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1432],r8
	mov qword [rsp+8*1433],r11
	mov qword [rsp+8*1434],r12
	mov     rsi, [rsp+8*1434]
	mov     rdi, [rsp+8*1431]
	call    concat
	mov [rsp+8*1435], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1435]
	call    concat
	mov [rsp+8*1436], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,59
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1437],r8
	mov qword [rsp+8*1438],r11
	mov qword [rsp+8*1439],r12
	mov     rsi, [rsp+8*1439]
	mov     rdi, [rsp+8*1436]
	call    concat
	mov [rsp+8*1440], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1441],r8
	mov qword [rsp+8*1442],r11
	mov qword [rsp+8*1443],r12
	mov     rsi, [rsp+8*1443]
	mov     rdi, [rsp+8*1440]
	call    concat
	mov [rsp+8*1444], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1444]
	call    concat
	mov [rsp+8*1445], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1446],r8
	mov qword [rsp+8*1447],r11
	mov qword [rsp+8*1448],r12
	mov     rsi, [rsp+8*1448]
	mov     rdi, [rsp+8*1445]
	call    concat
	mov [rsp+8*1449], rax
	mov r9, qword [rsp+8*1449]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*1450],r10
	mov rdi,[rsp+8*1450] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,67
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*1451],r8
	mov r8, [r15]
	mov qword [rsp+8*1456],r8
	mov qword [rsp+8*1452],r11
	mov qword [rsp+8*1453],r12
	mov qword [rsp+8*1454],r13
	mov qword [rsp+8*1455],r15
	mov     rsi, [rsp+8*1456]
	mov     rdi, [rsp+8*1453]
	call    concat
	mov [rsp+8*1457], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1458],r8
	mov qword [rsp+8*1459],r11
	mov qword [rsp+8*1460],r12
	mov     rsi, [rsp+8*1460]
	mov     rdi, [rsp+8*1457]
	call    concat
	mov [rsp+8*1461], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,83
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1462],r8
	mov qword [rsp+8*1463],r11
	mov qword [rsp+8*1464],r12
	mov     rsi, [rsp+8*1464]
	mov     rdi, [rsp+8*1461]
	call    concat
	mov [rsp+8*1465], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1466],r8
	mov qword [rsp+8*1467],r11
	mov qword [rsp+8*1468],r12
	mov     rsi, [rsp+8*1468]
	mov     rdi, [rsp+8*1465]
	call    concat
	mov [rsp+8*1469], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1470],r8
	mov qword [rsp+8*1471],r11
	mov qword [rsp+8*1472],r12
	mov     rsi, [rsp+8*1472]
	mov     rdi, [rsp+8*1469]
	call    concat
	mov [rsp+8*1473], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1474],r8
	mov qword [rsp+8*1475],r11
	mov qword [rsp+8*1476],r12
	mov     rsi, [rsp+8*1476]
	mov     rdi, [rsp+8*1473]
	call    concat
	mov [rsp+8*1477], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1477]
	call    concat
	mov [rsp+8*1478], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1479],r8
	mov qword [rsp+8*1480],r11
	mov qword [rsp+8*1481],r12
	mov     rsi, [rsp+8*1481]
	mov     rdi, [rsp+8*1478]
	call    concat
	mov [rsp+8*1482], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,58
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1483],r8
	mov qword [rsp+8*1484],r11
	mov qword [rsp+8*1485],r12
	mov     rsi, [rsp+8*1485]
	mov     rdi, [rsp+8*1482]
	call    concat
	mov [rsp+8*1486], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1486]
	call    concat
	mov [rsp+8*1487], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,10
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1488],r8
	mov qword [rsp+8*1489],r11
	mov qword [rsp+8*1490],r12
	mov     rsi, [rsp+8*1490]
	mov     rdi, [rsp+8*1487]
	call    concat
	mov [rsp+8*1491], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,66
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1492],r8
	mov qword [rsp+8*1493],r11
	mov qword [rsp+8*1494],r12
	mov     rsi, [rsp+8*1494]
	mov     rdi, [rsp+8*1491]
	call    concat
	mov [rsp+8*1495], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1496],r8
	mov qword [rsp+8*1497],r11
	mov qword [rsp+8*1498],r12
	mov     rsi, [rsp+8*1498]
	mov     rdi, [rsp+8*1495]
	call    concat
	mov [rsp+8*1499], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1500],r8
	mov qword [rsp+8*1501],r11
	mov qword [rsp+8*1502],r12
	mov     rsi, [rsp+8*1502]
	mov     rdi, [rsp+8*1499]
	call    concat
	mov [rsp+8*1503], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1504],r8
	mov qword [rsp+8*1505],r11
	mov qword [rsp+8*1506],r12
	mov     rsi, [rsp+8*1506]
	mov     rdi, [rsp+8*1503]
	call    concat
	mov [rsp+8*1507], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1508],r8
	mov qword [rsp+8*1509],r11
	mov qword [rsp+8*1510],r12
	mov     rsi, [rsp+8*1510]
	mov     rdi, [rsp+8*1507]
	call    concat
	mov [rsp+8*1511], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1512],r8
	mov qword [rsp+8*1513],r11
	mov qword [rsp+8*1514],r12
	mov     rsi, [rsp+8*1514]
	mov     rdi, [rsp+8*1511]
	call    concat
	mov [rsp+8*1515], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1516],r8
	mov qword [rsp+8*1517],r11
	mov qword [rsp+8*1518],r12
	mov     rsi, [rsp+8*1518]
	mov     rdi, [rsp+8*1515]
	call    concat
	mov [rsp+8*1519], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,14
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1520],r8
	mov qword [rsp+8*1521],r11
	mov qword [rsp+8*1522],r12
	mov     rsi, [rsp+8*1522]
	mov     rdi, [rsp+8*1519]
	call    concat
	mov [rsp+8*1523], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,16
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1524],r8
	mov qword [rsp+8*1525],r11
	mov qword [rsp+8*1526],r12
	mov     rsi, [rsp+8*1526]
	mov     rdi, [rsp+8*1523]
	call    concat
	mov [rsp+8*1527], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,15
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1528],r8
	mov qword [rsp+8*1529],r11
	mov qword [rsp+8*1530],r12
	mov     rsi, [rsp+8*1530]
	mov     rdi, [rsp+8*1527]
	call    concat
	mov [rsp+8*1531], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1532],r8
	mov qword [rsp+8*1533],r11
	mov qword [rsp+8*1534],r12
	mov     rsi, [rsp+8*1534]
	mov     rdi, [rsp+8*1531]
	call    concat
	mov [rsp+8*1535], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,10
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1536],r8
	mov qword [rsp+8*1537],r11
	mov qword [rsp+8*1538],r12
	mov     rsi, [rsp+8*1538]
	mov     rdi, [rsp+8*1535]
	call    concat
	mov [rsp+8*1539], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,66
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1540],r8
	mov qword [rsp+8*1541],r11
	mov qword [rsp+8*1542],r12
	mov     rsi, [rsp+8*1542]
	mov     rdi, [rsp+8*1539]
	call    concat
	mov [rsp+8*1543], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1544],r8
	mov qword [rsp+8*1545],r11
	mov qword [rsp+8*1546],r12
	mov     rsi, [rsp+8*1546]
	mov     rdi, [rsp+8*1543]
	call    concat
	mov [rsp+8*1547], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1548],r8
	mov qword [rsp+8*1549],r11
	mov qword [rsp+8*1550],r12
	mov     rsi, [rsp+8*1550]
	mov     rdi, [rsp+8*1547]
	call    concat
	mov [rsp+8*1551], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1552],r8
	mov qword [rsp+8*1553],r11
	mov qword [rsp+8*1554],r12
	mov     rsi, [rsp+8*1554]
	mov     rdi, [rsp+8*1551]
	call    concat
	mov [rsp+8*1555], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1556],r8
	mov qword [rsp+8*1557],r11
	mov qword [rsp+8*1558],r12
	mov     rsi, [rsp+8*1558]
	mov     rdi, [rsp+8*1555]
	call    concat
	mov [rsp+8*1559], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1560],r8
	mov qword [rsp+8*1561],r11
	mov qword [rsp+8*1562],r12
	mov     rsi, [rsp+8*1562]
	mov     rdi, [rsp+8*1559]
	call    concat
	mov [rsp+8*1563], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1564],r8
	mov qword [rsp+8*1565],r11
	mov qword [rsp+8*1566],r12
	mov     rsi, [rsp+8*1566]
	mov     rdi, [rsp+8*1563]
	call    concat
	mov [rsp+8*1567], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,4
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1568],r8
	mov qword [rsp+8*1569],r11
	mov qword [rsp+8*1570],r12
	mov     rsi, [rsp+8*1570]
	mov     rdi, [rsp+8*1567]
	call    concat
	mov [rsp+8*1571], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,16
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1572],r8
	mov qword [rsp+8*1573],r11
	mov qword [rsp+8*1574],r12
	mov     rsi, [rsp+8*1574]
	mov     rdi, [rsp+8*1571]
	call    concat
	mov [rsp+8*1575], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,15
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1576],r8
	mov qword [rsp+8*1577],r11
	mov qword [rsp+8*1578],r12
	mov     rsi, [rsp+8*1578]
	mov     rdi, [rsp+8*1575]
	call    concat
	mov [rsp+8*1579], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1580],r8
	mov qword [rsp+8*1581],r11
	mov qword [rsp+8*1582],r12
	mov     rsi, [rsp+8*1582]
	mov     rdi, [rsp+8*1579]
	call    concat
	mov [rsp+8*1583], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,10
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1584],r8
	mov qword [rsp+8*1585],r11
	mov qword [rsp+8*1586],r12
	mov     rsi, [rsp+8*1586]
	mov     rdi, [rsp+8*1583]
	call    concat
	mov [rsp+8*1587], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1587]
	call    concat
	mov [rsp+8*1588], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,59
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1589],r8
	mov qword [rsp+8*1590],r11
	mov qword [rsp+8*1591],r12
	mov     rsi, [rsp+8*1591]
	mov     rdi, [rsp+8*1588]
	call    concat
	mov [rsp+8*1592], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1593],r8
	mov qword [rsp+8*1594],r11
	mov qword [rsp+8*1595],r12
	mov     rsi, [rsp+8*1595]
	mov     rdi, [rsp+8*1592]
	call    concat
	mov [rsp+8*1596], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1596]
	call    concat
	mov [rsp+8*1597], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1598],r8
	mov qword [rsp+8*1599],r11
	mov qword [rsp+8*1600],r12
	mov     rsi, [rsp+8*1600]
	mov     rdi, [rsp+8*1597]
	call    concat
	mov [rsp+8*1601], rax
	mov r9, qword [rsp+8*1601]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*1602],r10
	mov rdi,[rsp+8*1602] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,91
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov r14,r13
	mov qword [rsp+8*1603],r8
	mov qword [rsp+8*1604],r11
	mov qword [rsp+8*1605],r12
	mov qword [arg+8*0],r13
	mov qword [rsp+8*1606],r14
	mov rdi,[rsp+8*1606] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,82
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*1607],r8
	mov r8, [r15]
	mov qword [rsp+8*1612],r8
	mov qword [rsp+8*1608],r11
	mov qword [rsp+8*1609],r12
	mov qword [rsp+8*1610],r13
	mov qword [rsp+8*1611],r15
	mov     rsi, [rsp+8*1612]
	mov     rdi, [rsp+8*1609]
	call    concat
	mov [rsp+8*1613], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1614],r8
	mov qword [rsp+8*1615],r11
	mov qword [rsp+8*1616],r12
	mov     rsi, [rsp+8*1616]
	mov     rdi, [rsp+8*1613]
	call    concat
	mov [rsp+8*1617], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1618],r8
	mov qword [rsp+8*1619],r11
	mov qword [rsp+8*1620],r12
	mov     rsi, [rsp+8*1620]
	mov     rdi, [rsp+8*1617]
	call    concat
	mov [rsp+8*1621], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1622],r8
	mov qword [rsp+8*1623],r11
	mov qword [rsp+8*1624],r12
	mov     rsi, [rsp+8*1624]
	mov     rdi, [rsp+8*1621]
	call    concat
	mov [rsp+8*1625], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1626],r8
	mov qword [rsp+8*1627],r11
	mov qword [rsp+8*1628],r12
	mov     rsi, [rsp+8*1628]
	mov     rdi, [rsp+8*1625]
	call    concat
	mov [rsp+8*1629], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1630],r8
	mov qword [rsp+8*1631],r11
	mov qword [rsp+8*1632],r12
	mov     rsi, [rsp+8*1632]
	mov     rdi, [rsp+8*1629]
	call    concat
	mov [rsp+8*1633], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,65
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1634],r8
	mov qword [rsp+8*1635],r11
	mov qword [rsp+8*1636],r12
	mov     rsi, [rsp+8*1636]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1637], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,17
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1638],r8
	mov qword [rsp+8*1639],r11
	mov qword [rsp+8*1640],r12
	mov     rsi, [rsp+8*1640]
	mov     rdi, [rsp+8*1637]
	call    concat
	mov [rsp+8*1641], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1642],r8
	mov qword [rsp+8*1643],r11
	mov qword [rsp+8*1644],r12
	mov     rsi, [rsp+8*1644]
	mov     rdi, [rsp+8*1641]
	call    concat
	mov [rsp+8*1645], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1646],r8
	mov qword [rsp+8*1647],r11
	mov qword [rsp+8*1648],r12
	mov     rsi, [rsp+8*1648]
	mov     rdi, [rsp+8*1645]
	call    concat
	mov [rsp+8*1649], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1650],r8
	mov qword [rsp+8*1651],r11
	mov qword [rsp+8*1652],r12
	mov     rsi, [rsp+8*1652]
	mov     rdi, [rsp+8*1649]
	call    concat
	mov [rsp+8*1653], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1654],r8
	mov qword [rsp+8*1655],r11
	mov qword [rsp+8*1656],r12
	mov     rsi, [rsp+8*1656]
	mov     rdi, [rsp+8*1653]
	call    concat
	mov [rsp+8*1657], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1658],r8
	mov qword [rsp+8*1659],r11
	mov qword [rsp+8*1660],r12
	mov     rsi, [rsp+8*1660]
	mov     rdi, [rsp+8*1657]
	call    concat
	mov [rsp+8*1661], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,65
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1662],r8
	mov qword [rsp+8*1663],r11
	mov qword [rsp+8*1664],r12
	mov     rsi, [rsp+8*1664]
	mov     rdi, [rsp+8*1661]
	call    concat
	mov [rsp+8*1665], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,65
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1666],r8
	mov qword [rsp+8*1667],r11
	mov qword [rsp+8*1668],r12
	mov     rsi, [rsp+8*1668]
	mov     rdi, [rsp+8*1665]
	call    concat
	mov [rsp+8*1669], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1670],r8
	mov qword [rsp+8*1671],r11
	mov qword [rsp+8*1672],r12
	mov     rsi, [rsp+8*1672]
	mov     rdi, [rsp+8*1669]
	call    concat
	mov [rsp+8*1673], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,89
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1674],r8
	mov qword [rsp+8*1675],r11
	mov qword [rsp+8*1676],r12
	mov     rsi, [rsp+8*1676]
	mov     rdi, [rsp+8*1673]
	call    concat
	mov [rsp+8*1677], rax
	mov r9, qword [rsp+8*1677]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*1678],r10
	mov rdi,[rsp+8*1678] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,68
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*1679],r8
	mov r8, [r15]
	mov qword [rsp+8*1684],r8
	mov qword [rsp+8*1680],r11
	mov qword [rsp+8*1681],r12
	mov qword [rsp+8*1682],r13
	mov qword [rsp+8*1683],r15
	mov     rsi, [rsp+8*1684]
	mov     rdi, [rsp+8*1681]
	call    concat
	mov [rsp+8*1685], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1686],r8
	mov qword [rsp+8*1687],r11
	mov qword [rsp+8*1688],r12
	mov     rsi, [rsp+8*1688]
	mov     rdi, [rsp+8*1685]
	call    concat
	mov [rsp+8*1689], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,65
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1690],r8
	mov qword [rsp+8*1691],r11
	mov qword [rsp+8*1692],r12
	mov     rsi, [rsp+8*1692]
	mov     rdi, [rsp+8*1689]
	call    concat
	mov [rsp+8*1693], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,65
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1694],r8
	mov qword [rsp+8*1695],r11
	mov qword [rsp+8*1696],r12
	mov     rsi, [rsp+8*1696]
	mov     rdi, [rsp+8*1693]
	call    concat
	mov [rsp+8*1697], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,27
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1698],r8
	mov qword [rsp+8*1699],r11
	mov qword [rsp+8*1700],r12
	mov     rsi, [rsp+8*1700]
	mov     rdi, [rsp+8*1697]
	call    concat
	mov [rsp+8*1701], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1702],r8
	mov qword [rsp+8*1703],r11
	mov qword [rsp+8*1704],r12
	mov     rsi, [rsp+8*1704]
	mov     rdi, [rsp+8*1701]
	call    concat
	mov [rsp+8*1705], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,24
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1706],r8
	mov qword [rsp+8*1707],r11
	mov qword [rsp+8*1708],r12
	mov     rsi, [rsp+8*1708]
	mov     rdi, [rsp+8*1705]
	call    concat
	mov [rsp+8*1709], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1710],r8
	mov qword [rsp+8*1711],r11
	mov qword [rsp+8*1712],r12
	mov     rsi, [rsp+8*1712]
	mov     rdi, [rsp+8*1709]
	call    concat
	mov [rsp+8*1713], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1714],r8
	mov qword [rsp+8*1715],r11
	mov qword [rsp+8*1716],r12
	mov     rsi, [rsp+8*1716]
	mov     rdi, [rsp+8*1713]
	call    concat
	mov [rsp+8*1717], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,67
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1718],r8
	mov qword [rsp+8*1719],r11
	mov qword [rsp+8*1720],r12
	mov     rsi, [rsp+8*1720]
	mov     rdi, [rsp+8*1717]
	call    concat
	mov [rsp+8*1721], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1722],r8
	mov qword [rsp+8*1723],r11
	mov qword [rsp+8*1724],r12
	mov     rsi, [rsp+8*1724]
	mov     rdi, [rsp+8*1721]
	call    concat
	mov [rsp+8*1725], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,83
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1726],r8
	mov qword [rsp+8*1727],r11
	mov qword [rsp+8*1728],r12
	mov     rsi, [rsp+8*1728]
	mov     rdi, [rsp+8*1725]
	call    concat
	mov [rsp+8*1729], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1730],r8
	mov qword [rsp+8*1731],r11
	mov qword [rsp+8*1732],r12
	mov     rsi, [rsp+8*1732]
	mov     rdi, [rsp+8*1729]
	call    concat
	mov [rsp+8*1733], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1734],r8
	mov qword [rsp+8*1735],r11
	mov qword [rsp+8*1736],r12
	mov     rsi, [rsp+8*1736]
	mov     rdi, [rsp+8*1733]
	call    concat
	mov [rsp+8*1737], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1738],r8
	mov qword [rsp+8*1739],r11
	mov qword [rsp+8*1740],r12
	mov     rsi, [rsp+8*1740]
	mov     rdi, [rsp+8*1737]
	call    concat
	mov [rsp+8*1741], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1741]
	call    concat
	mov [rsp+8*1742], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,65
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1743],r8
	mov qword [rsp+8*1744],r11
	mov qword [rsp+8*1745],r12
	mov     rsi, [rsp+8*1745]
	mov     rdi, [rsp+8*1742]
	call    concat
	mov [rsp+8*1746], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,58
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1747],r8
	mov qword [rsp+8*1748],r11
	mov qword [rsp+8*1749],r12
	mov     rsi, [rsp+8*1749]
	mov     rdi, [rsp+8*1746]
	call    concat
	mov [rsp+8*1750], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1750]
	call    concat
	mov [rsp+8*1751], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,10
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1752],r8
	mov qword [rsp+8*1753],r11
	mov qword [rsp+8*1754],r12
	mov     rsi, [rsp+8*1754]
	mov     rdi, [rsp+8*1751]
	call    concat
	mov [rsp+8*1755], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,66
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1756],r8
	mov qword [rsp+8*1757],r11
	mov qword [rsp+8*1758],r12
	mov     rsi, [rsp+8*1758]
	mov     rdi, [rsp+8*1755]
	call    concat
	mov [rsp+8*1759], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1760],r8
	mov qword [rsp+8*1761],r11
	mov qword [rsp+8*1762],r12
	mov     rsi, [rsp+8*1762]
	mov     rdi, [rsp+8*1759]
	call    concat
	mov [rsp+8*1763], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1764],r8
	mov qword [rsp+8*1765],r11
	mov qword [rsp+8*1766],r12
	mov     rsi, [rsp+8*1766]
	mov     rdi, [rsp+8*1763]
	call    concat
	mov [rsp+8*1767], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1768],r8
	mov qword [rsp+8*1769],r11
	mov qword [rsp+8*1770],r12
	mov     rsi, [rsp+8*1770]
	mov     rdi, [rsp+8*1767]
	call    concat
	mov [rsp+8*1771], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1772],r8
	mov qword [rsp+8*1773],r11
	mov qword [rsp+8*1774],r12
	mov     rsi, [rsp+8*1774]
	mov     rdi, [rsp+8*1771]
	call    concat
	mov [rsp+8*1775], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,65
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1776],r8
	mov qword [rsp+8*1777],r11
	mov qword [rsp+8*1778],r12
	mov     rsi, [rsp+8*1778]
	mov     rdi, [rsp+8*1775]
	call    concat
	mov [rsp+8*1779], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,65
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1780],r8
	mov qword [rsp+8*1781],r11
	mov qword [rsp+8*1782],r12
	mov     rsi, [rsp+8*1782]
	mov     rdi, [rsp+8*1779]
	call    concat
	mov [rsp+8*1783], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1784],r8
	mov qword [rsp+8*1785],r11
	mov qword [rsp+8*1786],r12
	mov     rsi, [rsp+8*1786]
	mov     rdi, [rsp+8*1783]
	call    concat
	mov [rsp+8*1787], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,10
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1788],r8
	mov qword [rsp+8*1789],r11
	mov qword [rsp+8*1790],r12
	mov     rsi, [rsp+8*1790]
	mov     rdi, [rsp+8*1787]
	call    concat
	mov [rsp+8*1791], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1791]
	call    concat
	mov [rsp+8*1792], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,59
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1793],r8
	mov qword [rsp+8*1794],r11
	mov qword [rsp+8*1795],r12
	mov     rsi, [rsp+8*1795]
	mov     rdi, [rsp+8*1792]
	call    concat
	mov [rsp+8*1796], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1797],r8
	mov qword [rsp+8*1798],r11
	mov qword [rsp+8*1799],r12
	mov     rsi, [rsp+8*1799]
	mov     rdi, [rsp+8*1796]
	call    concat
	mov [rsp+8*1800], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1800]
	call    concat
	mov [rsp+8*1801], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1802],r8
	mov qword [rsp+8*1803],r11
	mov qword [rsp+8*1804],r12
	mov     rsi, [rsp+8*1804]
	mov     rdi, [rsp+8*1801]
	call    concat
	mov [rsp+8*1805], rax
	mov r9, qword [rsp+8*1805]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*1806],r10
	mov rdi,[rsp+8*1806] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,67
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*1807],r8
	mov r8, [r15]
	mov qword [rsp+8*1812],r8
	mov qword [rsp+8*1808],r11
	mov qword [rsp+8*1809],r12
	mov qword [rsp+8*1810],r13
	mov qword [rsp+8*1811],r15
	mov     rsi, [rsp+8*1812]
	mov     rdi, [rsp+8*1809]
	call    concat
	mov [rsp+8*1813], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1814],r8
	mov qword [rsp+8*1815],r11
	mov qword [rsp+8*1816],r12
	mov     rsi, [rsp+8*1816]
	mov     rdi, [rsp+8*1813]
	call    concat
	mov [rsp+8*1817], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,83
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1818],r8
	mov qword [rsp+8*1819],r11
	mov qword [rsp+8*1820],r12
	mov     rsi, [rsp+8*1820]
	mov     rdi, [rsp+8*1817]
	call    concat
	mov [rsp+8*1821], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1822],r8
	mov qword [rsp+8*1823],r11
	mov qword [rsp+8*1824],r12
	mov     rsi, [rsp+8*1824]
	mov     rdi, [rsp+8*1821]
	call    concat
	mov [rsp+8*1825], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1826],r8
	mov qword [rsp+8*1827],r11
	mov qword [rsp+8*1828],r12
	mov     rsi, [rsp+8*1828]
	mov     rdi, [rsp+8*1825]
	call    concat
	mov [rsp+8*1829], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1830],r8
	mov qword [rsp+8*1831],r11
	mov qword [rsp+8*1832],r12
	mov     rsi, [rsp+8*1832]
	mov     rdi, [rsp+8*1829]
	call    concat
	mov [rsp+8*1833], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1833]
	call    concat
	mov [rsp+8*1834], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,65
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1835],r8
	mov qword [rsp+8*1836],r11
	mov qword [rsp+8*1837],r12
	mov     rsi, [rsp+8*1837]
	mov     rdi, [rsp+8*1834]
	call    concat
	mov [rsp+8*1838], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,58
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1839],r8
	mov qword [rsp+8*1840],r11
	mov qword [rsp+8*1841],r12
	mov     rsi, [rsp+8*1841]
	mov     rdi, [rsp+8*1838]
	call    concat
	mov [rsp+8*1842], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1842]
	call    concat
	mov [rsp+8*1843], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,10
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1844],r8
	mov qword [rsp+8*1845],r11
	mov qword [rsp+8*1846],r12
	mov     rsi, [rsp+8*1846]
	mov     rdi, [rsp+8*1843]
	call    concat
	mov [rsp+8*1847], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,66
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1848],r8
	mov qword [rsp+8*1849],r11
	mov qword [rsp+8*1850],r12
	mov     rsi, [rsp+8*1850]
	mov     rdi, [rsp+8*1847]
	call    concat
	mov [rsp+8*1851], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1852],r8
	mov qword [rsp+8*1853],r11
	mov qword [rsp+8*1854],r12
	mov     rsi, [rsp+8*1854]
	mov     rdi, [rsp+8*1851]
	call    concat
	mov [rsp+8*1855], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1856],r8
	mov qword [rsp+8*1857],r11
	mov qword [rsp+8*1858],r12
	mov     rsi, [rsp+8*1858]
	mov     rdi, [rsp+8*1855]
	call    concat
	mov [rsp+8*1859], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1860],r8
	mov qword [rsp+8*1861],r11
	mov qword [rsp+8*1862],r12
	mov     rsi, [rsp+8*1862]
	mov     rdi, [rsp+8*1859]
	call    concat
	mov [rsp+8*1863], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1864],r8
	mov qword [rsp+8*1865],r11
	mov qword [rsp+8*1866],r12
	mov     rsi, [rsp+8*1866]
	mov     rdi, [rsp+8*1863]
	call    concat
	mov [rsp+8*1867], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,65
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1868],r8
	mov qword [rsp+8*1869],r11
	mov qword [rsp+8*1870],r12
	mov     rsi, [rsp+8*1870]
	mov     rdi, [rsp+8*1867]
	call    concat
	mov [rsp+8*1871], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,65
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1872],r8
	mov qword [rsp+8*1873],r11
	mov qword [rsp+8*1874],r12
	mov     rsi, [rsp+8*1874]
	mov     rdi, [rsp+8*1871]
	call    concat
	mov [rsp+8*1875], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,14
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1876],r8
	mov qword [rsp+8*1877],r11
	mov qword [rsp+8*1878],r12
	mov     rsi, [rsp+8*1878]
	mov     rdi, [rsp+8*1875]
	call    concat
	mov [rsp+8*1879], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,16
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1880],r8
	mov qword [rsp+8*1881],r11
	mov qword [rsp+8*1882],r12
	mov     rsi, [rsp+8*1882]
	mov     rdi, [rsp+8*1879]
	call    concat
	mov [rsp+8*1883], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,15
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1884],r8
	mov qword [rsp+8*1885],r11
	mov qword [rsp+8*1886],r12
	mov     rsi, [rsp+8*1886]
	mov     rdi, [rsp+8*1883]
	call    concat
	mov [rsp+8*1887], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1888],r8
	mov qword [rsp+8*1889],r11
	mov qword [rsp+8*1890],r12
	mov     rsi, [rsp+8*1890]
	mov     rdi, [rsp+8*1887]
	call    concat
	mov [rsp+8*1891], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,10
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1892],r8
	mov qword [rsp+8*1893],r11
	mov qword [rsp+8*1894],r12
	mov     rsi, [rsp+8*1894]
	mov     rdi, [rsp+8*1891]
	call    concat
	mov [rsp+8*1895], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,66
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1896],r8
	mov qword [rsp+8*1897],r11
	mov qword [rsp+8*1898],r12
	mov     rsi, [rsp+8*1898]
	mov     rdi, [rsp+8*1895]
	call    concat
	mov [rsp+8*1899], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1900],r8
	mov qword [rsp+8*1901],r11
	mov qword [rsp+8*1902],r12
	mov     rsi, [rsp+8*1902]
	mov     rdi, [rsp+8*1899]
	call    concat
	mov [rsp+8*1903], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1904],r8
	mov qword [rsp+8*1905],r11
	mov qword [rsp+8*1906],r12
	mov     rsi, [rsp+8*1906]
	mov     rdi, [rsp+8*1903]
	call    concat
	mov [rsp+8*1907], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,82
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1908],r8
	mov qword [rsp+8*1909],r11
	mov qword [rsp+8*1910],r12
	mov     rsi, [rsp+8*1910]
	mov     rdi, [rsp+8*1907]
	call    concat
	mov [rsp+8*1911], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,7
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1912],r8
	mov qword [rsp+8*1913],r11
	mov qword [rsp+8*1914],r12
	mov     rsi, [rsp+8*1914]
	mov     rdi, [rsp+8*1911]
	call    concat
	mov [rsp+8*1915], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,65
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1916],r8
	mov qword [rsp+8*1917],r11
	mov qword [rsp+8*1918],r12
	mov     rsi, [rsp+8*1918]
	mov     rdi, [rsp+8*1915]
	call    concat
	mov [rsp+8*1919], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,65
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1920],r8
	mov qword [rsp+8*1921],r11
	mov qword [rsp+8*1922],r12
	mov     rsi, [rsp+8*1922]
	mov     rdi, [rsp+8*1919]
	call    concat
	mov [rsp+8*1923], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,4
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1924],r8
	mov qword [rsp+8*1925],r11
	mov qword [rsp+8*1926],r12
	mov     rsi, [rsp+8*1926]
	mov     rdi, [rsp+8*1923]
	call    concat
	mov [rsp+8*1927], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,16
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1928],r8
	mov qword [rsp+8*1929],r11
	mov qword [rsp+8*1930],r12
	mov     rsi, [rsp+8*1930]
	mov     rdi, [rsp+8*1927]
	call    concat
	mov [rsp+8*1931], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,15
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1932],r8
	mov qword [rsp+8*1933],r11
	mov qword [rsp+8*1934],r12
	mov     rsi, [rsp+8*1934]
	mov     rdi, [rsp+8*1931]
	call    concat
	mov [rsp+8*1935], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,8
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1936],r8
	mov qword [rsp+8*1937],r11
	mov qword [rsp+8*1938],r12
	mov     rsi, [rsp+8*1938]
	mov     rdi, [rsp+8*1935]
	call    concat
	mov [rsp+8*1939], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,10
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1940],r8
	mov qword [rsp+8*1941],r11
	mov qword [rsp+8*1942],r12
	mov     rsi, [rsp+8*1942]
	mov     rdi, [rsp+8*1939]
	call    concat
	mov [rsp+8*1943], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1943]
	call    concat
	mov [rsp+8*1944], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,59
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1945],r8
	mov qword [rsp+8*1946],r11
	mov qword [rsp+8*1947],r12
	mov     rsi, [rsp+8*1947]
	mov     rdi, [rsp+8*1944]
	call    concat
	mov [rsp+8*1948], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1949],r8
	mov qword [rsp+8*1950],r11
	mov qword [rsp+8*1951],r12
	mov     rsi, [rsp+8*1951]
	mov     rdi, [rsp+8*1948]
	call    concat
	mov [rsp+8*1952], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1952]
	call    concat
	mov [rsp+8*1953], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1954],r8
	mov qword [rsp+8*1955],r11
	mov qword [rsp+8*1956],r12
	mov     rsi, [rsp+8*1956]
	mov     rdi, [rsp+8*1953]
	call    concat
	mov [rsp+8*1957], rax
	mov r9, qword [rsp+8*1957]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*1958],r10
	mov rdi,[rsp+8*1958] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,91
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov r14,r13
	mov qword [rsp+8*1959],r8
	mov qword [rsp+8*1960],r11
	mov qword [rsp+8*1961],r12
	mov qword [arg+8*0],r13
	mov qword [rsp+8*1962],r14
	mov rdi,[rsp+8*1962] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,82
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*1963],r8
	mov r8, [r15]
	mov qword [rsp+8*1968],r8
	mov qword [rsp+8*1964],r11
	mov qword [rsp+8*1965],r12
	mov qword [rsp+8*1966],r13
	mov qword [rsp+8*1967],r15
	mov     rsi, [rsp+8*1968]
	mov     rdi, [rsp+8*1965]
	call    concat
	mov [rsp+8*1969], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1970],r8
	mov qword [rsp+8*1971],r11
	mov qword [rsp+8*1972],r12
	mov     rsi, [rsp+8*1972]
	mov     rdi, [rsp+8*1969]
	call    concat
	mov [rsp+8*1973], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1974],r8
	mov qword [rsp+8*1975],r11
	mov qword [rsp+8*1976],r12
	mov     rsi, [rsp+8*1976]
	mov     rdi, [rsp+8*1973]
	call    concat
	mov [rsp+8*1977], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1978],r8
	mov qword [rsp+8*1979],r11
	mov qword [rsp+8*1980],r12
	mov     rsi, [rsp+8*1980]
	mov     rdi, [rsp+8*1977]
	call    concat
	mov [rsp+8*1981], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1982],r8
	mov qword [rsp+8*1983],r11
	mov qword [rsp+8*1984],r12
	mov     rsi, [rsp+8*1984]
	mov     rdi, [rsp+8*1981]
	call    concat
	mov [rsp+8*1985], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1986],r8
	mov qword [rsp+8*1987],r11
	mov qword [rsp+8*1988],r12
	mov     rsi, [rsp+8*1988]
	mov     rdi, [rsp+8*1985]
	call    concat
	mov [rsp+8*1989], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,65
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1990],r8
	mov qword [rsp+8*1991],r11
	mov qword [rsp+8*1992],r12
	mov     rsi, [rsp+8*1992]
	mov     rdi, [rsp+8*1989]
	call    concat
	mov [rsp+8*1993], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,77
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1994],r8
	mov qword [rsp+8*1995],r11
	mov qword [rsp+8*1996],r12
	mov     rsi, [rsp+8*1996]
	mov     rdi, [rsp+8*1993]
	call    concat
	mov [rsp+8*1997], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*1998],r8
	mov qword [rsp+8*1999],r11
	mov qword [rsp+8*2000],r12
	mov     rsi, [rsp+8*2000]
	mov     rdi, [rsp+8*1997]
	call    concat
	mov [rsp+8*2001], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2001]
	call    concat
	mov [rsp+8*2002], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2003],r8
	mov qword [rsp+8*2004],r11
	mov qword [rsp+8*2005],r12
	mov     rsi, [rsp+8*2005]
	mov     rdi, [rsp+8*2002]
	call    concat
	mov [rsp+8*2006], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2006]
	call    concat
	mov [rsp+8*2007], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2008],r8
	mov qword [rsp+8*2009],r11
	mov qword [rsp+8*2010],r12
	mov     rsi, [rsp+8*2010]
	mov     rdi, [rsp+8*2007]
	call    concat
	mov [rsp+8*2011], rax
	mov r9, qword [rsp+8*2011]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*2012],r10
	mov rdi,[rsp+8*2012] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,82
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*2013],r8
	mov r8, [r15]
	mov qword [rsp+8*2018],r8
	mov qword [rsp+8*2014],r11
	mov qword [rsp+8*2015],r12
	mov qword [rsp+8*2016],r13
	mov qword [rsp+8*2017],r15
	mov     rsi, [rsp+8*2018]
	mov     rdi, [rsp+8*2015]
	call    concat
	mov [rsp+8*2019], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2020],r8
	mov qword [rsp+8*2021],r11
	mov qword [rsp+8*2022],r12
	mov     rsi, [rsp+8*2022]
	mov     rdi, [rsp+8*2019]
	call    concat
	mov [rsp+8*2023], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2024],r8
	mov qword [rsp+8*2025],r11
	mov qword [rsp+8*2026],r12
	mov     rsi, [rsp+8*2026]
	mov     rdi, [rsp+8*2023]
	call    concat
	mov [rsp+8*2027], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2028],r8
	mov qword [rsp+8*2029],r11
	mov qword [rsp+8*2030],r12
	mov     rsi, [rsp+8*2030]
	mov     rdi, [rsp+8*2027]
	call    concat
	mov [rsp+8*2031], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2032],r8
	mov qword [rsp+8*2033],r11
	mov qword [rsp+8*2034],r12
	mov     rsi, [rsp+8*2034]
	mov     rdi, [rsp+8*2031]
	call    concat
	mov [rsp+8*2035], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2036],r8
	mov qword [rsp+8*2037],r11
	mov qword [rsp+8*2038],r12
	mov     rsi, [rsp+8*2038]
	mov     rdi, [rsp+8*2035]
	call    concat
	mov [rsp+8*2039], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,63
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2040],r8
	mov qword [rsp+8*2041],r11
	mov qword [rsp+8*2042],r12
	mov     rsi, [rsp+8*2042]
	mov     rdi, [rsp+8*2039]
	call    concat
	mov [rsp+8*2043], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,17
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2044],r8
	mov qword [rsp+8*2045],r11
	mov qword [rsp+8*2046],r12
	mov     rsi, [rsp+8*2046]
	mov     rdi, [rsp+8*2043]
	call    concat
	mov [rsp+8*2047], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,79
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2048],r8
	mov qword [rsp+8*2049],r11
	mov qword [rsp+8*2050],r12
	mov     rsi, [rsp+8*2050]
	mov     rdi, [rsp+8*2047]
	call    concat
	mov [rsp+8*2051], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2052],r8
	mov qword [rsp+8*2053],r11
	mov qword [rsp+8*2054],r12
	mov     rsi, [rsp+8*2054]
	mov     rdi, [rsp+8*2051]
	call    concat
	mov [rsp+8*2055], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2055]
	call    concat
	mov [rsp+8*2056], rax
	mov     rsi, [gbl+8*2057]
	mov     rdi, [rsp+8*2056]
	call    concat
	mov [rsp+8*2058], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2058]
	call    concat
	mov [rsp+8*2059], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2059]
	call    concat
	mov [rsp+8*2060], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2061],r8
	mov qword [rsp+8*2062],r11
	mov qword [rsp+8*2063],r12
	mov     rsi, [rsp+8*2063]
	mov     rdi, [rsp+8*2060]
	call    concat
	mov [rsp+8*2064], rax
	mov r9, qword [rsp+8*2064]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*2065],r10
	mov rdi,[rsp+8*2065] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,81
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r9
	mov r14,82
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r13
	mov qword [rsp+8*2066],r8
	mov r8, [r15]
	mov qword [rsp+8*2071],r8
	mov qword [rsp+8*2067],r11
	mov qword [rsp+8*2068],r12
	mov qword [rsp+8*2069],r13
	mov qword [rsp+8*2070],r15
	mov     rsi, [rsp+8*2071]
	mov     rdi, [rsp+8*2068]
	call    concat
	mov [rsp+8*2072], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,80
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2073],r8
	mov qword [rsp+8*2074],r11
	mov qword [rsp+8*2075],r12
	mov     rsi, [rsp+8*2075]
	mov     rdi, [rsp+8*2072]
	call    concat
	mov [rsp+8*2076], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,71
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2077],r8
	mov qword [rsp+8*2078],r11
	mov qword [rsp+8*2079],r12
	mov     rsi, [rsp+8*2079]
	mov     rdi, [rsp+8*2076]
	call    concat
	mov [rsp+8*2080], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,76
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2081],r8
	mov qword [rsp+8*2082],r11
	mov qword [rsp+8*2083],r12
	mov     rsi, [rsp+8*2083]
	mov     rdi, [rsp+8*2080]
	call    concat
	mov [rsp+8*2084], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,69
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2085],r8
	mov qword [rsp+8*2086],r11
	mov qword [rsp+8*2087],r12
	mov     rsi, [rsp+8*2087]
	mov     rdi, [rsp+8*2084]
	call    concat
	mov [rsp+8*2088], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2089],r8
	mov qword [rsp+8*2090],r11
	mov qword [rsp+8*2091],r12
	mov     rsi, [rsp+8*2091]
	mov     rdi, [rsp+8*2088]
	call    concat
	mov [rsp+8*2092], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,63
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2093],r8
	mov qword [rsp+8*2094],r11
	mov qword [rsp+8*2095],r12
	mov     rsi, [rsp+8*2095]
	mov     rdi, [rsp+8*2092]
	call    concat
	mov [rsp+8*2096], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,17
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2097],r8
	mov qword [rsp+8*2098],r11
	mov qword [rsp+8*2099],r12
	mov     rsi, [rsp+8*2099]
	mov     rdi, [rsp+8*2096]
	call    concat
	mov [rsp+8*2100], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,64
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2101],r8
	mov qword [rsp+8*2102],r11
	mov qword [rsp+8*2103],r12
	mov     rsi, [rsp+8*2103]
	mov     rdi, [rsp+8*2100]
	call    concat
	mov [rsp+8*2104], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,28
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2105],r8
	mov qword [rsp+8*2106],r11
	mov qword [rsp+8*2107],r12
	mov     rsi, [rsp+8*2107]
	mov     rdi, [rsp+8*2104]
	call    concat
	mov [rsp+8*2108], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2108]
	call    concat
	mov [rsp+8*2109], rax
	mov     rsi, [gbl+8*2057]
	mov     rdi, [rsp+8*2109]
	call    concat
	mov [rsp+8*2110], rax
	mov     rsi, [gbl+8*2057]
	mov     rdi, [rsp+8*2110]
	call    concat
	mov [rsp+8*2111], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2111]
	call    concat
	mov [rsp+8*2112], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10,26
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2113],r8
	mov qword [rsp+8*2114],r11
	mov qword [rsp+8*2115],r12
	mov     rsi, [rsp+8*2115]
	mov     rdi, [rsp+8*2112]
	call    concat
	mov [rsp+8*2116], rax
	mov r9, qword [rsp+8*2116]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*2117],r10
	mov rdi,[rsp+8*2117] 
	add rdi, 1 
	call puts
	mov r9, qword [gbl+8*190]
	mov r8,r9
	mov r10,0
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov r14,r13
	mov qword [rsp+8*2118],r8
	mov qword [rsp+8*2119],r11
	mov qword [rsp+8*2120],r12
	mov qword [arg+8*0],r13
	mov qword [rsp+8*2121],r14
	mov rdi,[rsp+8*2121] 
	add rdi, 1 
	call puts
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*2],r8
	
L_666:
	mov r8, qword [rsp+8*2]
	mov r9,93
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*2122],r10
	mov r8, qword [rsp+8*2122]
	cmp r8, 0
	je L_667
	mov r9, qword [rsp+8*2]
	mov r8,r9
	mov qword [arg+8*0],r8
	call c2
	mov r8 , rax
	mov qword [rsp+8*2123],r8
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2123]
	call    concat
	mov [rsp+8*2124], rax
	mov r9, qword [gbl+8*3]
	mov r8,r9
	mov r10, qword [rsp+8*2]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2125],r8
	mov qword [rsp+8*2126],r11
	mov qword [rsp+8*2127],r12
	mov     rsi, [rsp+8*2127]
	mov     rdi, [rsp+8*2124]
	call    concat
	mov [rsp+8*2128], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2128]
	call    concat
	mov [rsp+8*2129], rax
	mov     rsi, [gbl+8*2130]
	mov     rdi, [rsp+8*2129]
	call    concat
	mov [rsp+8*2131], rax
	mov r9, qword [rsp+8*2131]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*2132],r10
	mov rdi,[rsp+8*2132] 
	add rdi, 1 
	call puts
	
L_668:
	mov r9, qword [rsp+8*2]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*2133],r8
	mov qword [rsp+8*2],r9
	jmp L_666
	
L_667:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*2],r8
	
L_669:
	mov r8, qword [rsp+8*2]
	mov r9,31
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*2134],r10
	mov r8, qword [rsp+8*2134]
	cmp r8, 0
	je L_670
	mov r9, qword [rsp+8*2]
	mov r8,r9
	mov qword [arg+8*0],r8
	call s2
	mov r8 , rax
	mov qword [rsp+8*2135],r8
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2135]
	call    concat
	mov [rsp+8*2136], rax
	mov r9, qword [gbl+8*190]
	mov r8,r9
	mov r10, qword [rsp+8*2]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov qword [rsp+8*2137],r8
	mov qword [rsp+8*2138],r11
	mov qword [rsp+8*2139],r12
	mov     rsi, [rsp+8*2139]
	mov     rdi, [rsp+8*2136]
	call    concat
	mov [rsp+8*2140], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2140]
	call    concat
	mov [rsp+8*2141], rax
	mov     rsi, [gbl+8*2130]
	mov     rdi, [rsp+8*2141]
	call    concat
	mov [rsp+8*2142], rax
	mov r9, qword [rsp+8*2142]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*2143],r10
	mov rdi,[rsp+8*2143] 
	add rdi, 1 
	call puts
	
L_671:
	mov r9, qword [rsp+8*2]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*2144],r8
	mov qword [rsp+8*2],r9
	jmp L_669
	
L_670:
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*2],r8
	
L_672:
	mov r8, qword [rsp+8*2]
	mov r9,31
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*2145],r10
	mov r8, qword [rsp+8*2145]
	cmp r8, 0
	je L_673
	mov r9, qword [gbl+8*190]
	mov r8,r9
	mov r10, qword [rsp+8*2]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov r14,r13
	mov qword [rsp+8*2146],r8
	mov qword [rsp+8*2147],r11
	mov qword [rsp+8*2148],r12
	mov qword [arg+8*0],r13
	mov qword [rsp+8*2149],r14
	mov rdi,[rsp+8*2149] 
	add rdi, 1 
	call puts
	
L_674:
	mov r9, qword [rsp+8*2]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*2150],r8
	mov qword [rsp+8*2],r9
	jmp L_672
	
L_673:
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	jmp QED
	
digt:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 17568
	mov r9, qword [arg+8*0]
	mov r8,r9
	mov r10,0
	cmp r8,r10
	mov r11, 0
	sete r11B
	mov qword [rsp+8*2151],r8
	mov qword [rsp+8*2152],r11
	mov r8, qword [rsp+8*2152]
	cmp r8, 0
	je L_643
	mov r8,t66
	mov rax,r8
	leave
	ret
	
L_643:
	mov r8, qword [rsp+8*2151]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*2153],r10
	mov r8, qword [rsp+8*2153]
	cmp r8, 0
	je L_645
	mov r8,t69
	mov rax,r8
	leave
	ret
	
L_645:
	mov r8, qword [rsp+8*2151]
	mov r9,2
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*2154],r10
	mov r8, qword [rsp+8*2154]
	cmp r8, 0
	je L_647
	mov r8,t72
	mov rax,r8
	leave
	ret
	
L_647:
	mov r8, qword [rsp+8*2151]
	mov r9,3
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*2155],r10
	mov r8, qword [rsp+8*2155]
	cmp r8, 0
	je L_649
	mov r8,t75
	mov rax,r8
	leave
	ret
	
L_649:
	mov r8, qword [rsp+8*2151]
	mov r9,4
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*2156],r10
	mov r8, qword [rsp+8*2156]
	cmp r8, 0
	je L_651
	mov r8,t78
	mov rax,r8
	leave
	ret
	
L_651:
	mov r8, qword [rsp+8*2151]
	mov r9,5
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*2157],r10
	mov r8, qword [rsp+8*2157]
	cmp r8, 0
	je L_653
	mov r8,t81
	mov rax,r8
	leave
	ret
	
L_653:
	mov r8, qword [rsp+8*2151]
	mov r9,6
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*2158],r10
	mov r8, qword [rsp+8*2158]
	cmp r8, 0
	je L_655
	mov r8,t84
	mov rax,r8
	leave
	ret
	
L_655:
	mov r8, qword [rsp+8*2151]
	mov r9,7
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*2159],r10
	mov r8, qword [rsp+8*2159]
	cmp r8, 0
	je L_657
	mov r8,t87
	mov rax,r8
	leave
	ret
	
L_657:
	mov r8, qword [rsp+8*2151]
	mov r9,8
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*2160],r10
	mov r8, qword [rsp+8*2160]
	cmp r8, 0
	je L_659
	mov r8,t90
	mov rax,r8
	leave
	ret
	
L_659:
	mov r8, qword [rsp+8*2151]
	mov r9,9
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*2161],r10
	mov r8, qword [rsp+8*2161]
	cmp r8, 0
	je L_661
	mov r8,t93
	mov rax,r8
	leave
	ret
	
L_661:
	mov r8,0
	mov rax,r8
	leave
	ret
	
s2:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 17568
	mov r9, qword [arg+8*0]
	mov r8,r9
	mov r10,9
	cmp r8,r10
	mov r11, 0
	setle r11B
	mov qword [rsp+8*2162],r8
	mov qword [rsp+8*2163],r11
	mov r8, qword [rsp+8*2163]
	cmp r8, 0
	je L_663
	mov r9, qword [rsp+8*2162]
	mov r8,r9
	mov qword [arg+8*0],r8
	call digt
	mov r8 , rax
	mov qword [rsp+8*2164],r8
	mov     rsi, [rsp+8*2164]
	mov     rdi, t103
	call    concat
	mov [rsp+8*2165], rax
	mov     rsi, t107
	mov     rdi, [rsp+8*2165]
	call    concat
	mov [rsp+8*2166], rax
	mov r8, qword [rsp+8*2166]
	mov rax,r8
	leave
	ret
	
L_663:
	xor rdx, rdx
	mov r8, qword [rsp+8*2162]
	mov rax, r8
	mov r9,10
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rax
	mov r11,r10
	mov qword [rsp+8*2167],r10
	mov qword [arg+8*0],r11
	call digt
	mov r8 , rax
	mov qword [rsp+8*2168],r8
	mov     rsi, [rsp+8*2168]
	mov     rdi, t109
	call    concat
	mov [rsp+8*2169], rax
	xor rdx, rdx
	mov r8, qword [rsp+8*2162]
	mov rax, r8
	mov r9,10
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r11,r10
	mov qword [rsp+8*2170],r10
	mov qword [arg+8*0],r11
	call digt
	mov r8 , rax
	mov qword [rsp+8*2171],r8
	mov     rsi, [rsp+8*2171]
	mov     rdi, [rsp+8*2169]
	call    concat
	mov [rsp+8*2172], rax
	mov     rsi, t120
	mov     rdi, [rsp+8*2172]
	call    concat
	mov [rsp+8*2173], rax
	mov r8, qword [rsp+8*2173]
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	
c2:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 17568
	mov r9, qword [arg+8*0]
	mov r8,r9
	mov r10,9
	cmp r8,r10
	mov r11, 0
	setle r11B
	mov qword [rsp+8*2174],r8
	mov qword [rsp+8*2175],r11
	mov r8, qword [rsp+8*2175]
	cmp r8, 0
	je L_665
	mov r9, qword [rsp+8*2174]
	mov r8,r9
	mov qword [arg+8*0],r8
	call digt
	mov r8 , rax
	mov qword [rsp+8*2176],r8
	mov     rsi, [rsp+8*2176]
	mov     rdi, t125
	call    concat
	mov [rsp+8*2177], rax
	mov     rsi, t129
	mov     rdi, [rsp+8*2177]
	call    concat
	mov [rsp+8*2178], rax
	mov r8, qword [rsp+8*2178]
	mov rax,r8
	leave
	ret
	
L_665:
	xor rdx, rdx
	mov r8, qword [rsp+8*2174]
	mov rax, r8
	mov r9,10
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rax
	mov r11,r10
	mov qword [rsp+8*2179],r10
	mov qword [arg+8*0],r11
	call digt
	mov r8 , rax
	mov qword [rsp+8*2180],r8
	mov     rsi, [rsp+8*2180]
	mov     rdi, t131
	call    concat
	mov [rsp+8*2181], rax
	xor rdx, rdx
	mov r8, qword [rsp+8*2174]
	mov rax, r8
	mov r9,10
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov r11,r10
	mov qword [rsp+8*2182],r10
	mov qword [arg+8*0],r11
	call digt
	mov r8 , rax
	mov qword [rsp+8*2183],r8
	mov     rsi, [rsp+8*2183]
	mov     rdi, [rsp+8*2181]
	call    concat
	mov [rsp+8*2184], rax
	mov     rsi, t142
	mov     rdi, [rsp+8*2184]
	call    concat
	mov [rsp+8*2185], rax
	mov r8, qword [rsp+8*2185]
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
	sub    rsp, 17568
	mov     rdi, 256
	call    mallocArray
	mov     qword [gbl+8*2186], rax
	mov r9, qword [gbl+8*2186]
	mov r8,r9
	mov qword [gbl+8*190],r8
	mov     rdi, 256
	call    mallocArray
	mov     qword [gbl+8*2187], rax
	mov r9, qword [gbl+8*2187]
	mov r8,r9
	mov r11,t145
	mov r10,r11
	mov r13,t146
	mov r12,r13
	mov r15,t147
	mov r14,r15
	mov qword [gbl+8*3],r8
	mov qword [gbl+8*2130],r10
	mov qword [gbl+8*389],r12
	mov qword [gbl+8*2057],r14
	mov r8, qword [rsp+8*2188]
	mov rax,r8
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   19552
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
	
t485:
	 db 1,"v" ,0

t245:
	 db 1,"9" ,0

t641:
	 db 1,"}" ,0

t365:
	 db 1,"W" ,0

t481:
	 db 1,"u" ,0

t120:
	 db 2,"]=" ,0

t241:
	 db 1,"8" ,0

t361:
	 db 1,"V" ,0

t517:
	 db 1,"~" ,0

t637:
	 db 31,"for(i=1;i<31;i++)println(s[i]);" ,0

t357:
	 db 1,"U" ,0

t477:
	 db 1,"t" ,0

t513:
	 db 1,"}" ,0

t237:
	 db 1,"7" ,0

t633:
	 db 48,"for(i=0;i<31;i++)println(s2(i)+a2q+s[i]+a2q+co);" ,0

t193:
	 db 1,"," ,0

t353:
	 db 1,"T" ,0

t473:
	 db 1,"s" ,0

t597:
	 db 113,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[65]+c[17]+c[7]+c[71]+c[76]+c[82]+c[0]+c[65]+c[65]+c[8]+c[89]);" ,0

t233:
	 db 1,"6" ,0

t197:
	 db 1,"-" ,0

t593:
	 db 15,"println(c[91]);" ,0

t229:
	 db 1,"5" ,0

t625:
	 db 14,"println(s[0]);" ,0

t107:
	 db 2,"]=" ,0

t349:
	 db 1,"S" ,0

t109:
	 db 2,"s[" ,0

t505:
	 db 1,"{" ,0

t225:
	 db 1,"4" ,0

t621:
	 db 96,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[63]+c[17]+c[64]+c[28]+a2q+a2b+a2b+a2q+c[26]);" ,0

t66:
	 db 1,"0" ,0

t103:
	 db 2,"s[" ,0

t345:
	 db 1,"R" ,0

t69:
	 db 1,"1" ,0

t469:
	 db 1,"r" ,0

t501:
	 db 1,"z" ,0

t589:
	 db 241,"println(c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[81]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[14]+c[16]+c[15]+c[8]+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[4]+c[16]+c[15]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t629:
	 db 48,"for(i=0;i<93;i++)println(c2(i)+a2q+c[i]+a2q+co);" ,0

t509:
	 db 1,"|" ,0

t265:
	 db 1,">" ,0

t385:
	 db 1,"]" ,0

t146:
	 db 1,"",34,"" ,0

t421:
	 db 1,"f" ,0

t145:
	 db 1,";" ,0

t541:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[18]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[18]+a2q+c[26]);" ,0

t261:
	 db 1,"=" ,0

t381:
	 db 1,"[" ,0

t72:
	 db 1,"2" ,0

t142:
	 db 2,"]=" ,0

t537:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[17]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[17]+a2q+c[26]);" ,0

t75:
	 db 1,"3" ,0

t417:
	 db 1,"e" ,0

t78:
	 db 1,"4" ,0

t533:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[16]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[16]+a2q+c[26]);" ,0

t257:
	 db 1,"<" ,0

t413:
	 db 1,"d" ,0

t253:
	 db 1,";" ,0

t377:
	 db 1,"Z" ,0

t497:
	 db 1,"y" ,0

t81:
	 db 1,"5" ,0

t131:
	 db 2,"c[" ,0

t373:
	 db 1,"Y" ,0

t493:
	 db 1,"x" ,0

t405:
	 db 1,"b" ,0

t84:
	 db 1,"6" ,0

t129:
	 db 2,"]=" ,0

t525:
	 db 119,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[66]+c[71]+c[69]+c[82]+c[7]+c[71]+c[76]+c[82]+c[0]+c[86]+c[8]+c[89]);" ,0

t87:
	 db 1,"7" ,0

t401:
	 db 1,"a" ,0

t489:
	 db 1,"w" ,0

t125:
	 db 2,"c[" ,0

t521:
	 db 19,"int main(){int i=0;" ,0

t249:
	 db 1,":" ,0

t369:
	 db 1,"X" ,0

t409:
	 db 1,"c" ,0

t529:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[15]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[15]+a2q+c[26]);" ,0

t281:
	 db 1,"B" ,0

t441:
	 db 1,"k" ,0

t165:
	 db 1,"%" ,0

t561:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[23]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[23]+a2q+c[26]);" ,0

t90:
	 db 1,"8" ,0

t201:
	 db 1,"." ,0

t289:
	 db 1,"D" ,0

t321:
	 db 1,"L" ,0

t161:
	 db 1,"$" ,0

t285:
	 db 1,"C" ,0

t93:
	 db 1,"9" ,0

t317:
	 db 1,"K" ,0

t437:
	 db 1,"j" ,0

t313:
	 db 1,"J" ,0

t433:
	 db 1,"i" ,0

t557:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[22]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[22]+a2q+c[26]);" ,0

t397:
	 db 1,"`" ,0

t157:
	 db 1,"#" ,0

t553:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[21]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[21]+a2q+c[26]);" ,0

t277:
	 db 1,"A" ,0

t393:
	 db 1,"_" ,0

t153:
	 db 1,"!" ,0

t273:
	 db 1,"@" ,0

t305:
	 db 1,"H" ,0

t429:
	 db 1,"h" ,0

t549:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[20]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[20]+a2q+c[26]);" ,0

t269:
	 db 1,"?" ,0

t147:
	 db 1,"",92,"" ,0

t301:
	 db 1,"G" ,0

t389:
	 db 1,"^" ,0

t425:
	 db 1,"g" ,0

t149:
	 db 1," " ,0

t545:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[19]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[19]+a2q+c[26]);" ,0

t309:
	 db 1,"I" ,0

t181:
	 db 1,")" ,0

t221:
	 db 1,"3" ,0

t341:
	 db 1,"Q" ,0

t465:
	 db 1,"q" ,0

t189:
	 db 1,"+" ,0

t585:
	 db 206,"println(c[71]+c[68]+c[7]+c[81]+c[81]+c[27]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[81]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t461:
	 db 1,"p" ,0

t185:
	 db 1,"*" ,0

t581:
	 db 113,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[81]+c[17]+c[7]+c[71]+c[76]+c[82]+c[0]+c[81]+c[81]+c[8]+c[89]);" ,0

t217:
	 db 1,"2" ,0

t613:
	 db 88,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[65]+c[77]+c[28]+a2q+c[26]+a2q+c[26]);" ,0

t577:
	 db 169,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[59]+c[0]+c[65]+c[28]+c[76]+c[67]+c[85]+c[0]+c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[17]+c[20]+c[21]+c[59]+c[26]);" ,0

t213:
	 db 1,"1" ,0

t337:
	 db 1,"P" ,0

t457:
	 db 1,"o" ,0

t617:
	 db 96,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[63]+c[17]+c[79]+c[28]+a2q+a2b+a2q+a2q+c[26]);" ,0

t177:
	 db 1,"(" ,0

t573:
	 db 169,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[59]+c[0]+c[81]+c[28]+c[76]+c[67]+c[85]+c[0]+c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[17]+c[20]+c[21]+c[59]+c[26]);" ,0

t297:
	 db 1,"F" ,0

t333:
	 db 1,"O" ,0

t453:
	 db 1,"n" ,0

t173:
	 db 1,"'" ,0

t293:
	 db 1,"E" ,0

t449:
	 db 1,"m" ,0

t569:
	 db 15,"println(c[91]);" ,0

t209:
	 db 1,"0" ,0

t605:
	 db 241,"println(c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[65]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[14]+c[16]+c[15]+c[8]+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[4]+c[16]+c[15]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t329:
	 db 1,"N" ,0

t445:
	 db 1,"l" ,0

t169:
	 db 1,"&" ,0

t565:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[24]+a2q+c[26]);" ,0

t205:
	 db 1,"/" ,0

t601:
	 db 206,"println(c[71]+c[68]+c[7]+c[65]+c[65]+c[27]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[65]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t325:
	 db 1,"M" ,0

t609:
	 db 15,"println(c[91]);" ,0


