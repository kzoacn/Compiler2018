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
	sub    rsp, 2416
	call global_init
	mov r8 , rax
	mov r10,102
	mov r9,r10
	mov r12,0
	mov r11,r12
	mov r14,0
	mov r13,r14
	mov qword [rsp+8*1],r8
	mov r8,0
	mov r15,r8
	mov qword [rsp+8*2],r9
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*6],r8
	mov r8, qword [rsp+8*2]
	mov r9,1
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*8],r8
	mov r8, qword [rsp+8*2]
	mov r9,1
	mov qword [rsp+8*7],r10
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*10],r8
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*11],r8
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*12],r8
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*13],r8
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*14],r8
	mov r8, qword [rsp+8*2]
	mov r9,r8
	imul r9,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*9],r10
	mov qword [rsp+8*3],r11
	mov qword [rsp+8*4],r13
	mov qword [rsp+8*5],r15
	mov     rdi, [rsp+8*15]
	call    mallocArray
	mov     qword [rsp+8*16], rax
	mov r9, qword [rsp+8*16]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*17],r8
	mov qword [rsp+8*18],r10
	
L_211:
	mov r8, qword [rsp+8*2]
	mov r9,r8
	imul r9,r8
	mov r10, qword [rsp+8*18]
	cmp r10,r9
	mov r11, 0
	setl r11B
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*20],r11
	mov r8, qword [rsp+8*20]
	cmp r8, 0
	je L_212
	mov r9, qword [rsp+8*17]
	mov r8,r9
	mov qword [rsp+8*21],r8
	mov     rsi, [rsp+8*18]
	mov     rdi, [rsp+8*21]
	call    address
	mov [rsp+8*22], rax
	mov r8, qword [rsp+8*22]
	mov r9,0
	mov [r8],r9
	
L_213:
	mov r9, qword [rsp+8*18]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*23],r8
	mov qword [rsp+8*18],r9
	jmp L_211
	
L_212:
	mov r8, qword [rsp+8*2]
	mov r9,r8
	imul r9,r8
	mov qword [rsp+8*24],r9
	mov     rdi, [rsp+8*24]
	call    mallocArray
	mov     qword [rsp+8*25], rax
	mov r9, qword [rsp+8*25]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*26],r8
	mov qword [rsp+8*18],r10
	
L_214:
	mov r8, qword [rsp+8*2]
	mov r9,r8
	imul r9,r8
	mov r10, qword [rsp+8*18]
	cmp r10,r9
	mov r11, 0
	setl r11B
	mov qword [rsp+8*27],r9
	mov qword [rsp+8*28],r11
	mov r8, qword [rsp+8*28]
	cmp r8, 0
	je L_215
	mov r9, qword [rsp+8*26]
	mov r8,r9
	mov qword [rsp+8*29],r8
	mov     rsi, [rsp+8*18]
	mov     rdi, [rsp+8*29]
	call    address
	mov [rsp+8*30], rax
	mov r8, qword [rsp+8*30]
	mov r9,0
	mov [r8],r9
	
L_216:
	mov r9, qword [rsp+8*18]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*31],r8
	mov qword [rsp+8*18],r9
	jmp L_214
	
L_215:
	mov     rdi, [rsp+8*2]
	call    mallocArray
	mov     qword [rsp+8*32], rax
	mov r9, qword [rsp+8*32]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*33],r8
	mov qword [rsp+8*18],r10
	
L_217:
	mov r8, qword [rsp+8*18]
	mov r9, qword [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*34],r10
	mov r8, qword [rsp+8*34]
	cmp r8, 0
	je L_218
	mov     rdi, [rsp+8*2]
	call    mallocArray
	mov     qword [rsp+8*35], rax
	mov r9, qword [rsp+8*33]
	mov r8,r9
	mov qword [rsp+8*36],r8
	mov     rsi, [rsp+8*18]
	mov     rdi, [rsp+8*36]
	call    address
	mov [rsp+8*37], rax
	mov r8, qword [rsp+8*37]
	mov r9, qword [rsp+8*35]
	mov [r8],r9
	mov r11,0
	mov r10,r11
	mov qword [rsp+8*38],r10
	
L_220:
	mov r8, qword [rsp+8*38]
	mov r9, qword [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	mov qword [rsp+8*39],r10
	mov r8, qword [rsp+8*39]
	cmp r8, 0
	je L_221
	mov r8,1
	mov r9,r8
	neg r9
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*40],r9
	mov qword [rsp+8*41],r10
	mov     rsi, [rsp+8*18]
	mov     rdi, [rsp+8*41]
	call    address
	mov [rsp+8*42], rax
	mov r8, qword [rsp+8*42]
	mov r9, [r8]
	mov qword [rsp+8*42],r8
	mov qword [rsp+8*41],r9
	mov     rsi, [rsp+8*38]
	mov     rdi, [rsp+8*41]
	call    address
	mov [rsp+8*42], rax
	mov r8, qword [rsp+8*42]
	mov r9, qword [rsp+8*40]
	mov [r8],r9
	
L_222:
	mov r9, qword [rsp+8*38]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*43],r8
	mov qword [rsp+8*38],r9
	jmp L_220
	
L_221:
	
L_219:
	mov r9, qword [rsp+8*18]
	mov r8,r9
	mov r10,1
	mov r9,r9
	add r9,r10
	mov qword [rsp+8*44],r8
	mov qword [rsp+8*18],r9
	jmp L_217
	
L_218:
	mov r9, qword [rsp+8*17]
	mov r8,r9
	mov qword [rsp+8*45],r8
	mov     rsi, 0
	mov     rdi, [rsp+8*45]
	call    address
	mov [rsp+8*46], rax
	mov r8, qword [rsp+8*46]
	mov r9, qword [rsp+8*5]
	mov [r8],r9
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*47],r10
	mov     rsi, 0
	mov     rdi, [rsp+8*47]
	call    address
	mov [rsp+8*48], rax
	mov r8, qword [rsp+8*48]
	mov r9, qword [rsp+8*6]
	mov [r8],r9
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*49],r10
	mov     rsi, [rsp+8*5]
	mov     rdi, [rsp+8*49]
	call    address
	mov [rsp+8*50], rax
	mov r8, qword [rsp+8*50]
	mov r9, [r8]
	mov qword [rsp+8*50],r8
	mov qword [rsp+8*49],r9
	mov     rsi, [rsp+8*6]
	mov     rdi, [rsp+8*49]
	call    address
	mov [rsp+8*50], rax
	mov r8, qword [rsp+8*50]
	mov r9,0
	mov [r8],r9
	
L_223:
	mov r8, qword [rsp+8*3]
	mov r9, qword [rsp+8*4]
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov qword [rsp+8*51],r10
	mov r8, qword [rsp+8*51]
	cmp r8, 0
	je L_224
	mov r9, qword [rsp+8*17]
	mov r8,r9
	mov qword [rsp+8*52],r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*52]
	call    address
	mov [rsp+8*53], rax
	mov r8, qword [rsp+8*53]
	mov r9, [r8]
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*53],r8
	mov qword [rsp+8*54],r9
	mov qword [rsp+8*55],r10
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*55]
	call    address
	mov [rsp+8*56], rax
	mov r8, qword [rsp+8*56]
	mov r9, [r8]
	mov r11, qword [rsp+8*33]
	mov r10,r11
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r9
	mov qword [rsp+8*58],r10
	mov     rsi, [rsp+8*54]
	mov     rdi, [rsp+8*58]
	call    address
	mov [rsp+8*59], rax
	mov r8, qword [rsp+8*59]
	mov r9, [r8]
	mov qword [rsp+8*59],r8
	mov qword [rsp+8*58],r9
	mov     rsi, [rsp+8*57]
	mov     rdi, [rsp+8*58]
	call    address
	mov [rsp+8*59], rax
	mov r8, qword [rsp+8*59]
	mov r9, [r8]
	mov r10,r9
	mov r12, qword [rsp+8*17]
	mov r11,r12
	mov qword [rsp+8*59],r8
	mov qword [rsp+8*60],r9
	mov qword [rsp+8*13],r10
	mov qword [rsp+8*61],r11
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*61]
	call    address
	mov [rsp+8*62], rax
	mov r8, qword [rsp+8*62]
	mov r9, [r8]
	mov r10,1
	mov r11,r9
	sub r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*26]
	mov r13,r14
	mov qword [rsp+8*62],r8
	mov qword [rsp+8*63],r9
	mov qword [rsp+8*64],r11
	mov qword [rsp+8*11],r12
	mov qword [rsp+8*65],r13
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*65]
	call    address
	mov [rsp+8*66], rax
	mov r8, qword [rsp+8*66]
	mov r9, [r8]
	mov r10,2
	mov r11,r9
	sub r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*2]
	mov r13,r14
	mov qword [rsp+8*66],r8
	mov r8, qword [rsp+8*11]
	mov r15,r8
	mov qword [rsp+8*67],r9
	mov qword [rsp+8*68],r11
	mov qword [rsp+8*12],r12
	mov qword [arg+8*1],r13
	mov qword [arg+8*0],r15
	call check
	mov r8 , rax
	cmp r8, 0
	mov qword [rsp+8*71],r8
	jne L_225
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*72],r8
	jmp L_226
	
L_225:
	mov r9, qword [rsp+8*2]
	mov r8,r9
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*1],r8
	mov qword [arg+8*0],r10
	call check
	mov r8 , rax
	mov r9,r8
	mov qword [rsp+8*73],r8
	mov qword [rsp+8*72],r9
	
L_226:
	mov r8, qword [rsp+8*72]
	cmp r8, 0
	je L_228
	mov r9, qword [rsp+8*33]
	mov r8,r9
	mov qword [rsp+8*74],r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*74]
	call    address
	mov [rsp+8*75], rax
	mov r8, qword [rsp+8*75]
	mov r9, [r8]
	mov qword [rsp+8*75],r8
	mov qword [rsp+8*74],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*74]
	call    address
	mov [rsp+8*75], rax
	mov r8, qword [rsp+8*75]
	mov r9, [r8]
	mov r10,1
	mov r11,r10
	neg r11
	cmp r9,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*75],r8
	mov qword [rsp+8*76],r9
	mov qword [rsp+8*77],r11
	mov qword [rsp+8*78],r12
	mov r8, qword [rsp+8*78]
	cmp r8, 0
	je L_230
	mov r8, qword [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12, qword [rsp+8*17]
	mov r11,r12
	mov qword [rsp+8*4],r8
	mov qword [rsp+8*79],r10
	mov qword [rsp+8*80],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*80]
	call    address
	mov [rsp+8*81], rax
	mov r8, qword [rsp+8*81]
	mov r9, qword [rsp+8*11]
	mov [r8],r9
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*82],r10
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*82]
	call    address
	mov [rsp+8*83], rax
	mov r8, qword [rsp+8*83]
	mov r9, qword [rsp+8*12]
	mov [r8],r9
	mov r10, qword [rsp+8*13]
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r14, qword [rsp+8*33]
	mov r13,r14
	mov qword [rsp+8*84],r12
	mov qword [rsp+8*85],r13
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*85]
	call    address
	mov [rsp+8*86], rax
	mov r8, qword [rsp+8*86]
	mov r9, [r8]
	mov qword [rsp+8*86],r8
	mov qword [rsp+8*85],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*85]
	call    address
	mov [rsp+8*86], rax
	mov r8, qword [rsp+8*86]
	mov r9, qword [rsp+8*84]
	mov [r8],r9
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*87],r12
	mov r8, qword [rsp+8*87]
	cmp r8, 0
	jne L_231
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*88],r8
	jmp L_232
	
L_231:
	mov r8, qword [rsp+8*12]
	mov r9, qword [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*89],r10
	mov r9, qword [rsp+8*89]
	mov r8,r9
	mov qword [rsp+8*88],r8
	
L_232:
	mov r8, qword [rsp+8*88]
	cmp r8, 0
	je L_234
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_234:
	
L_230:
	
L_228:
	mov r9, qword [rsp+8*17]
	mov r8,r9
	mov qword [rsp+8*90],r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*90]
	call    address
	mov [rsp+8*91], rax
	mov r8, qword [rsp+8*91]
	mov r9, [r8]
	mov r10,1
	mov r11,r9
	sub r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*26]
	mov r13,r14
	mov qword [rsp+8*91],r8
	mov qword [rsp+8*92],r9
	mov qword [rsp+8*93],r11
	mov qword [rsp+8*11],r12
	mov qword [rsp+8*94],r13
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*94]
	call    address
	mov [rsp+8*95], rax
	mov r8, qword [rsp+8*95]
	mov r9, [r8]
	mov r10,2
	mov r11,r9
	add r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*2]
	mov r13,r14
	mov qword [rsp+8*95],r8
	mov r8, qword [rsp+8*11]
	mov r15,r8
	mov qword [rsp+8*96],r9
	mov qword [rsp+8*97],r11
	mov qword [rsp+8*12],r12
	mov qword [arg+8*1],r13
	mov qword [arg+8*0],r15
	call check
	mov r8 , rax
	cmp r8, 0
	mov qword [rsp+8*98],r8
	jne L_235
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*99],r8
	jmp L_236
	
L_235:
	mov r9, qword [rsp+8*2]
	mov r8,r9
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*1],r8
	mov qword [arg+8*0],r10
	call check
	mov r8 , rax
	mov r9,r8
	mov qword [rsp+8*100],r8
	mov qword [rsp+8*99],r9
	
L_236:
	mov r8, qword [rsp+8*99]
	cmp r8, 0
	je L_238
	mov r9, qword [rsp+8*33]
	mov r8,r9
	mov qword [rsp+8*101],r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*101]
	call    address
	mov [rsp+8*102], rax
	mov r8, qword [rsp+8*102]
	mov r9, [r8]
	mov qword [rsp+8*102],r8
	mov qword [rsp+8*101],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*101]
	call    address
	mov [rsp+8*102], rax
	mov r8, qword [rsp+8*102]
	mov r9, [r8]
	mov r10,1
	mov r11,r10
	neg r11
	cmp r9,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*102],r8
	mov qword [rsp+8*103],r9
	mov qword [rsp+8*104],r11
	mov qword [rsp+8*105],r12
	mov r8, qword [rsp+8*105]
	cmp r8, 0
	je L_240
	mov r8, qword [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12, qword [rsp+8*17]
	mov r11,r12
	mov qword [rsp+8*4],r8
	mov qword [rsp+8*106],r10
	mov qword [rsp+8*107],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*107]
	call    address
	mov [rsp+8*108], rax
	mov r8, qword [rsp+8*108]
	mov r9, qword [rsp+8*11]
	mov [r8],r9
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*109],r10
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*109]
	call    address
	mov [rsp+8*110], rax
	mov r8, qword [rsp+8*110]
	mov r9, qword [rsp+8*12]
	mov [r8],r9
	mov r10, qword [rsp+8*13]
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r14, qword [rsp+8*33]
	mov r13,r14
	mov qword [rsp+8*111],r12
	mov qword [rsp+8*112],r13
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*112]
	call    address
	mov [rsp+8*113], rax
	mov r8, qword [rsp+8*113]
	mov r9, [r8]
	mov qword [rsp+8*113],r8
	mov qword [rsp+8*112],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*112]
	call    address
	mov [rsp+8*113], rax
	mov r8, qword [rsp+8*113]
	mov r9, qword [rsp+8*111]
	mov [r8],r9
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*114],r12
	mov r8, qword [rsp+8*114]
	cmp r8, 0
	jne L_241
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*115],r8
	jmp L_242
	
L_241:
	mov r8, qword [rsp+8*12]
	mov r9, qword [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*116],r10
	mov r9, qword [rsp+8*116]
	mov r8,r9
	mov qword [rsp+8*115],r8
	
L_242:
	mov r8, qword [rsp+8*115]
	cmp r8, 0
	je L_244
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_244:
	
L_240:
	
L_238:
	mov r9, qword [rsp+8*17]
	mov r8,r9
	mov qword [rsp+8*117],r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*117]
	call    address
	mov [rsp+8*118], rax
	mov r8, qword [rsp+8*118]
	mov r9, [r8]
	mov r10,1
	mov r11,r9
	add r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*26]
	mov r13,r14
	mov qword [rsp+8*118],r8
	mov qword [rsp+8*119],r9
	mov qword [rsp+8*120],r11
	mov qword [rsp+8*11],r12
	mov qword [rsp+8*121],r13
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*121]
	call    address
	mov [rsp+8*122], rax
	mov r8, qword [rsp+8*122]
	mov r9, [r8]
	mov r10,2
	mov r11,r9
	sub r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*2]
	mov r13,r14
	mov qword [rsp+8*122],r8
	mov r8, qword [rsp+8*11]
	mov r15,r8
	mov qword [rsp+8*123],r9
	mov qword [rsp+8*124],r11
	mov qword [rsp+8*12],r12
	mov qword [arg+8*1],r13
	mov qword [arg+8*0],r15
	call check
	mov r8 , rax
	cmp r8, 0
	mov qword [rsp+8*125],r8
	jne L_245
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*126],r8
	jmp L_246
	
L_245:
	mov r9, qword [rsp+8*2]
	mov r8,r9
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*1],r8
	mov qword [arg+8*0],r10
	call check
	mov r8 , rax
	mov r9,r8
	mov qword [rsp+8*127],r8
	mov qword [rsp+8*126],r9
	
L_246:
	mov r8, qword [rsp+8*126]
	cmp r8, 0
	je L_248
	mov r9, qword [rsp+8*33]
	mov r8,r9
	mov qword [rsp+8*128],r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*128]
	call    address
	mov [rsp+8*129], rax
	mov r8, qword [rsp+8*129]
	mov r9, [r8]
	mov qword [rsp+8*129],r8
	mov qword [rsp+8*128],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*128]
	call    address
	mov [rsp+8*129], rax
	mov r8, qword [rsp+8*129]
	mov r9, [r8]
	mov r10,1
	mov r11,r10
	neg r11
	cmp r9,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*129],r8
	mov qword [rsp+8*130],r9
	mov qword [rsp+8*131],r11
	mov qword [rsp+8*132],r12
	mov r8, qword [rsp+8*132]
	cmp r8, 0
	je L_250
	mov r8, qword [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12, qword [rsp+8*17]
	mov r11,r12
	mov qword [rsp+8*4],r8
	mov qword [rsp+8*133],r10
	mov qword [rsp+8*134],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*134]
	call    address
	mov [rsp+8*135], rax
	mov r8, qword [rsp+8*135]
	mov r9, qword [rsp+8*11]
	mov [r8],r9
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*136],r10
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*136]
	call    address
	mov [rsp+8*137], rax
	mov r8, qword [rsp+8*137]
	mov r9, qword [rsp+8*12]
	mov [r8],r9
	mov r10, qword [rsp+8*13]
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r14, qword [rsp+8*33]
	mov r13,r14
	mov qword [rsp+8*138],r12
	mov qword [rsp+8*139],r13
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*139]
	call    address
	mov [rsp+8*140], rax
	mov r8, qword [rsp+8*140]
	mov r9, [r8]
	mov qword [rsp+8*140],r8
	mov qword [rsp+8*139],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*139]
	call    address
	mov [rsp+8*140], rax
	mov r8, qword [rsp+8*140]
	mov r9, qword [rsp+8*138]
	mov [r8],r9
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*141],r12
	mov r8, qword [rsp+8*141]
	cmp r8, 0
	jne L_251
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*142],r8
	jmp L_252
	
L_251:
	mov r8, qword [rsp+8*12]
	mov r9, qword [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*143],r10
	mov r9, qword [rsp+8*143]
	mov r8,r9
	mov qword [rsp+8*142],r8
	
L_252:
	mov r8, qword [rsp+8*142]
	cmp r8, 0
	je L_254
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_254:
	
L_250:
	
L_248:
	mov r9, qword [rsp+8*17]
	mov r8,r9
	mov qword [rsp+8*144],r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*144]
	call    address
	mov [rsp+8*145], rax
	mov r8, qword [rsp+8*145]
	mov r9, [r8]
	mov r10,1
	mov r11,r9
	add r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*26]
	mov r13,r14
	mov qword [rsp+8*145],r8
	mov qword [rsp+8*146],r9
	mov qword [rsp+8*147],r11
	mov qword [rsp+8*11],r12
	mov qword [rsp+8*148],r13
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*148]
	call    address
	mov [rsp+8*149], rax
	mov r8, qword [rsp+8*149]
	mov r9, [r8]
	mov r10,2
	mov r11,r9
	add r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*2]
	mov r13,r14
	mov qword [rsp+8*149],r8
	mov r8, qword [rsp+8*11]
	mov r15,r8
	mov qword [rsp+8*150],r9
	mov qword [rsp+8*151],r11
	mov qword [rsp+8*12],r12
	mov qword [arg+8*1],r13
	mov qword [arg+8*0],r15
	call check
	mov r8 , rax
	cmp r8, 0
	mov qword [rsp+8*152],r8
	jne L_255
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*153],r8
	jmp L_256
	
L_255:
	mov r9, qword [rsp+8*2]
	mov r8,r9
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*1],r8
	mov qword [arg+8*0],r10
	call check
	mov r8 , rax
	mov r9,r8
	mov qword [rsp+8*154],r8
	mov qword [rsp+8*153],r9
	
L_256:
	mov r8, qword [rsp+8*153]
	cmp r8, 0
	je L_258
	mov r9, qword [rsp+8*33]
	mov r8,r9
	mov qword [rsp+8*155],r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*155]
	call    address
	mov [rsp+8*156], rax
	mov r8, qword [rsp+8*156]
	mov r9, [r8]
	mov qword [rsp+8*156],r8
	mov qword [rsp+8*155],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*155]
	call    address
	mov [rsp+8*156], rax
	mov r8, qword [rsp+8*156]
	mov r9, [r8]
	mov r10,1
	mov r11,r10
	neg r11
	cmp r9,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*156],r8
	mov qword [rsp+8*157],r9
	mov qword [rsp+8*158],r11
	mov qword [rsp+8*159],r12
	mov r8, qword [rsp+8*159]
	cmp r8, 0
	je L_260
	mov r8, qword [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12, qword [rsp+8*17]
	mov r11,r12
	mov qword [rsp+8*4],r8
	mov qword [rsp+8*160],r10
	mov qword [rsp+8*161],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*161]
	call    address
	mov [rsp+8*162], rax
	mov r8, qword [rsp+8*162]
	mov r9, qword [rsp+8*11]
	mov [r8],r9
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*163],r10
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*163]
	call    address
	mov [rsp+8*164], rax
	mov r8, qword [rsp+8*164]
	mov r9, qword [rsp+8*12]
	mov [r8],r9
	mov r10, qword [rsp+8*13]
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r14, qword [rsp+8*33]
	mov r13,r14
	mov qword [rsp+8*165],r12
	mov qword [rsp+8*166],r13
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*166]
	call    address
	mov [rsp+8*167], rax
	mov r8, qword [rsp+8*167]
	mov r9, [r8]
	mov qword [rsp+8*167],r8
	mov qword [rsp+8*166],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*166]
	call    address
	mov [rsp+8*167], rax
	mov r8, qword [rsp+8*167]
	mov r9, qword [rsp+8*165]
	mov [r8],r9
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*168],r12
	mov r8, qword [rsp+8*168]
	cmp r8, 0
	jne L_261
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*169],r8
	jmp L_262
	
L_261:
	mov r8, qword [rsp+8*12]
	mov r9, qword [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*170],r10
	mov r9, qword [rsp+8*170]
	mov r8,r9
	mov qword [rsp+8*169],r8
	
L_262:
	mov r8, qword [rsp+8*169]
	cmp r8, 0
	je L_264
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_264:
	
L_260:
	
L_258:
	mov r9, qword [rsp+8*17]
	mov r8,r9
	mov qword [rsp+8*171],r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*171]
	call    address
	mov [rsp+8*172], rax
	mov r8, qword [rsp+8*172]
	mov r9, [r8]
	mov r10,2
	mov r11,r9
	sub r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*26]
	mov r13,r14
	mov qword [rsp+8*172],r8
	mov qword [rsp+8*173],r9
	mov qword [rsp+8*174],r11
	mov qword [rsp+8*11],r12
	mov qword [rsp+8*175],r13
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*175]
	call    address
	mov [rsp+8*176], rax
	mov r8, qword [rsp+8*176]
	mov r9, [r8]
	mov r10,1
	mov r11,r9
	sub r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*2]
	mov r13,r14
	mov qword [rsp+8*176],r8
	mov r8, qword [rsp+8*11]
	mov r15,r8
	mov qword [rsp+8*177],r9
	mov qword [rsp+8*178],r11
	mov qword [rsp+8*12],r12
	mov qword [arg+8*1],r13
	mov qword [arg+8*0],r15
	call check
	mov r8 , rax
	cmp r8, 0
	mov qword [rsp+8*179],r8
	jne L_265
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*180],r8
	jmp L_266
	
L_265:
	mov r9, qword [rsp+8*2]
	mov r8,r9
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*1],r8
	mov qword [arg+8*0],r10
	call check
	mov r8 , rax
	mov r9,r8
	mov qword [rsp+8*181],r8
	mov qword [rsp+8*180],r9
	
L_266:
	mov r8, qword [rsp+8*180]
	cmp r8, 0
	je L_268
	mov r9, qword [rsp+8*33]
	mov r8,r9
	mov qword [rsp+8*182],r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*182]
	call    address
	mov [rsp+8*183], rax
	mov r8, qword [rsp+8*183]
	mov r9, [r8]
	mov qword [rsp+8*183],r8
	mov qword [rsp+8*182],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*182]
	call    address
	mov [rsp+8*183], rax
	mov r8, qword [rsp+8*183]
	mov r9, [r8]
	mov r10,1
	mov r11,r10
	neg r11
	cmp r9,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*183],r8
	mov qword [rsp+8*184],r9
	mov qword [rsp+8*185],r11
	mov qword [rsp+8*186],r12
	mov r8, qword [rsp+8*186]
	cmp r8, 0
	je L_270
	mov r8, qword [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12, qword [rsp+8*17]
	mov r11,r12
	mov qword [rsp+8*4],r8
	mov qword [rsp+8*187],r10
	mov qword [rsp+8*188],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*188]
	call    address
	mov [rsp+8*189], rax
	mov r8, qword [rsp+8*189]
	mov r9, qword [rsp+8*11]
	mov [r8],r9
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*190],r10
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*190]
	call    address
	mov [rsp+8*191], rax
	mov r8, qword [rsp+8*191]
	mov r9, qword [rsp+8*12]
	mov [r8],r9
	mov r10, qword [rsp+8*13]
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r14, qword [rsp+8*33]
	mov r13,r14
	mov qword [rsp+8*192],r12
	mov qword [rsp+8*193],r13
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*193]
	call    address
	mov [rsp+8*194], rax
	mov r8, qword [rsp+8*194]
	mov r9, [r8]
	mov qword [rsp+8*194],r8
	mov qword [rsp+8*193],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*193]
	call    address
	mov [rsp+8*194], rax
	mov r8, qword [rsp+8*194]
	mov r9, qword [rsp+8*192]
	mov [r8],r9
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*195],r12
	mov r8, qword [rsp+8*195]
	cmp r8, 0
	jne L_271
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*196],r8
	jmp L_272
	
L_271:
	mov r8, qword [rsp+8*12]
	mov r9, qword [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*197],r10
	mov r9, qword [rsp+8*197]
	mov r8,r9
	mov qword [rsp+8*196],r8
	
L_272:
	mov r8, qword [rsp+8*196]
	cmp r8, 0
	je L_274
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_274:
	
L_270:
	
L_268:
	mov r9, qword [rsp+8*17]
	mov r8,r9
	mov qword [rsp+8*198],r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*198]
	call    address
	mov [rsp+8*199], rax
	mov r8, qword [rsp+8*199]
	mov r9, [r8]
	mov r10,2
	mov r11,r9
	sub r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*26]
	mov r13,r14
	mov qword [rsp+8*199],r8
	mov qword [rsp+8*200],r9
	mov qword [rsp+8*201],r11
	mov qword [rsp+8*11],r12
	mov qword [rsp+8*202],r13
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*202]
	call    address
	mov [rsp+8*203], rax
	mov r8, qword [rsp+8*203]
	mov r9, [r8]
	mov r10,1
	mov r11,r9
	add r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*2]
	mov r13,r14
	mov qword [rsp+8*203],r8
	mov r8, qword [rsp+8*11]
	mov r15,r8
	mov qword [rsp+8*204],r9
	mov qword [rsp+8*205],r11
	mov qword [rsp+8*12],r12
	mov qword [arg+8*1],r13
	mov qword [arg+8*0],r15
	call check
	mov r8 , rax
	cmp r8, 0
	mov qword [rsp+8*206],r8
	jne L_275
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*207],r8
	jmp L_276
	
L_275:
	mov r9, qword [rsp+8*2]
	mov r8,r9
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*1],r8
	mov qword [arg+8*0],r10
	call check
	mov r8 , rax
	mov r9,r8
	mov qword [rsp+8*208],r8
	mov qword [rsp+8*207],r9
	
L_276:
	mov r8, qword [rsp+8*207]
	cmp r8, 0
	je L_278
	mov r9, qword [rsp+8*33]
	mov r8,r9
	mov qword [rsp+8*209],r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*209]
	call    address
	mov [rsp+8*210], rax
	mov r8, qword [rsp+8*210]
	mov r9, [r8]
	mov qword [rsp+8*210],r8
	mov qword [rsp+8*209],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*209]
	call    address
	mov [rsp+8*210], rax
	mov r8, qword [rsp+8*210]
	mov r9, [r8]
	mov r10,1
	mov r11,r10
	neg r11
	cmp r9,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*210],r8
	mov qword [rsp+8*211],r9
	mov qword [rsp+8*212],r11
	mov qword [rsp+8*213],r12
	mov r8, qword [rsp+8*213]
	cmp r8, 0
	je L_280
	mov r8, qword [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12, qword [rsp+8*17]
	mov r11,r12
	mov qword [rsp+8*4],r8
	mov qword [rsp+8*214],r10
	mov qword [rsp+8*215],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*215]
	call    address
	mov [rsp+8*216], rax
	mov r8, qword [rsp+8*216]
	mov r9, qword [rsp+8*11]
	mov [r8],r9
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*217],r10
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*217]
	call    address
	mov [rsp+8*218], rax
	mov r8, qword [rsp+8*218]
	mov r9, qword [rsp+8*12]
	mov [r8],r9
	mov r10, qword [rsp+8*13]
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r14, qword [rsp+8*33]
	mov r13,r14
	mov qword [rsp+8*219],r12
	mov qword [rsp+8*220],r13
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*220]
	call    address
	mov [rsp+8*221], rax
	mov r8, qword [rsp+8*221]
	mov r9, [r8]
	mov qword [rsp+8*221],r8
	mov qword [rsp+8*220],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*220]
	call    address
	mov [rsp+8*221], rax
	mov r8, qword [rsp+8*221]
	mov r9, qword [rsp+8*219]
	mov [r8],r9
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*222],r12
	mov r8, qword [rsp+8*222]
	cmp r8, 0
	jne L_281
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*223],r8
	jmp L_282
	
L_281:
	mov r8, qword [rsp+8*12]
	mov r9, qword [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*224],r10
	mov r9, qword [rsp+8*224]
	mov r8,r9
	mov qword [rsp+8*223],r8
	
L_282:
	mov r8, qword [rsp+8*223]
	cmp r8, 0
	je L_284
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_284:
	
L_280:
	
L_278:
	mov r9, qword [rsp+8*17]
	mov r8,r9
	mov qword [rsp+8*225],r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*225]
	call    address
	mov [rsp+8*226], rax
	mov r8, qword [rsp+8*226]
	mov r9, [r8]
	mov r10,2
	mov r11,r9
	add r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*26]
	mov r13,r14
	mov qword [rsp+8*226],r8
	mov qword [rsp+8*227],r9
	mov qword [rsp+8*228],r11
	mov qword [rsp+8*11],r12
	mov qword [rsp+8*229],r13
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*229]
	call    address
	mov [rsp+8*230], rax
	mov r8, qword [rsp+8*230]
	mov r9, [r8]
	mov r10,1
	mov r11,r9
	sub r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*2]
	mov r13,r14
	mov qword [rsp+8*230],r8
	mov r8, qword [rsp+8*11]
	mov r15,r8
	mov qword [rsp+8*231],r9
	mov qword [rsp+8*232],r11
	mov qword [rsp+8*12],r12
	mov qword [arg+8*1],r13
	mov qword [arg+8*0],r15
	call check
	mov r8 , rax
	cmp r8, 0
	mov qword [rsp+8*233],r8
	jne L_285
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*234],r8
	jmp L_286
	
L_285:
	mov r9, qword [rsp+8*2]
	mov r8,r9
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*1],r8
	mov qword [arg+8*0],r10
	call check
	mov r8 , rax
	mov r9,r8
	mov qword [rsp+8*235],r8
	mov qword [rsp+8*234],r9
	
L_286:
	mov r8, qword [rsp+8*234]
	cmp r8, 0
	je L_288
	mov r9, qword [rsp+8*33]
	mov r8,r9
	mov qword [rsp+8*236],r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*236]
	call    address
	mov [rsp+8*237], rax
	mov r8, qword [rsp+8*237]
	mov r9, [r8]
	mov qword [rsp+8*237],r8
	mov qword [rsp+8*236],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*236]
	call    address
	mov [rsp+8*237], rax
	mov r8, qword [rsp+8*237]
	mov r9, [r8]
	mov r10,1
	mov r11,r10
	neg r11
	cmp r9,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*237],r8
	mov qword [rsp+8*238],r9
	mov qword [rsp+8*239],r11
	mov qword [rsp+8*240],r12
	mov r8, qword [rsp+8*240]
	cmp r8, 0
	je L_290
	mov r8, qword [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12, qword [rsp+8*17]
	mov r11,r12
	mov qword [rsp+8*4],r8
	mov qword [rsp+8*241],r10
	mov qword [rsp+8*242],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*242]
	call    address
	mov [rsp+8*243], rax
	mov r8, qword [rsp+8*243]
	mov r9, qword [rsp+8*11]
	mov [r8],r9
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*244],r10
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*244]
	call    address
	mov [rsp+8*245], rax
	mov r8, qword [rsp+8*245]
	mov r9, qword [rsp+8*12]
	mov [r8],r9
	mov r10, qword [rsp+8*13]
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r14, qword [rsp+8*33]
	mov r13,r14
	mov qword [rsp+8*246],r12
	mov qword [rsp+8*247],r13
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*247]
	call    address
	mov [rsp+8*248], rax
	mov r8, qword [rsp+8*248]
	mov r9, [r8]
	mov qword [rsp+8*248],r8
	mov qword [rsp+8*247],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*247]
	call    address
	mov [rsp+8*248], rax
	mov r8, qword [rsp+8*248]
	mov r9, qword [rsp+8*246]
	mov [r8],r9
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*249],r12
	mov r8, qword [rsp+8*249]
	cmp r8, 0
	jne L_291
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*250],r8
	jmp L_292
	
L_291:
	mov r8, qword [rsp+8*12]
	mov r9, qword [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*251],r10
	mov r9, qword [rsp+8*251]
	mov r8,r9
	mov qword [rsp+8*250],r8
	
L_292:
	mov r8, qword [rsp+8*250]
	cmp r8, 0
	je L_294
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_294:
	
L_290:
	
L_288:
	mov r9, qword [rsp+8*17]
	mov r8,r9
	mov qword [rsp+8*252],r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*252]
	call    address
	mov [rsp+8*253], rax
	mov r8, qword [rsp+8*253]
	mov r9, [r8]
	mov r10,2
	mov r11,r9
	add r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*26]
	mov r13,r14
	mov qword [rsp+8*253],r8
	mov qword [rsp+8*254],r9
	mov qword [rsp+8*255],r11
	mov qword [rsp+8*11],r12
	mov qword [rsp+8*256],r13
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*256]
	call    address
	mov [rsp+8*257], rax
	mov r8, qword [rsp+8*257]
	mov r9, [r8]
	mov r10,1
	mov r11,r9
	add r11,r10
	mov r12,r11
	mov r14, qword [rsp+8*2]
	mov r13,r14
	mov qword [rsp+8*257],r8
	mov r8, qword [rsp+8*11]
	mov r15,r8
	mov qword [rsp+8*258],r9
	mov qword [rsp+8*259],r11
	mov qword [rsp+8*12],r12
	mov qword [arg+8*1],r13
	mov qword [arg+8*0],r15
	call check
	mov r8 , rax
	cmp r8, 0
	mov qword [rsp+8*260],r8
	jne L_295
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*261],r8
	jmp L_296
	
L_295:
	mov r9, qword [rsp+8*2]
	mov r8,r9
	mov r11, qword [rsp+8*12]
	mov r10,r11
	mov qword [arg+8*1],r8
	mov qword [arg+8*0],r10
	call check
	mov r8 , rax
	mov r9,r8
	mov qword [rsp+8*262],r8
	mov qword [rsp+8*261],r9
	
L_296:
	mov r8, qword [rsp+8*261]
	cmp r8, 0
	je L_298
	mov r9, qword [rsp+8*33]
	mov r8,r9
	mov qword [rsp+8*263],r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*263]
	call    address
	mov [rsp+8*264], rax
	mov r8, qword [rsp+8*264]
	mov r9, [r8]
	mov qword [rsp+8*264],r8
	mov qword [rsp+8*263],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*263]
	call    address
	mov [rsp+8*264], rax
	mov r8, qword [rsp+8*264]
	mov r9, [r8]
	mov r10,1
	mov r11,r10
	neg r11
	cmp r9,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*264],r8
	mov qword [rsp+8*265],r9
	mov qword [rsp+8*266],r11
	mov qword [rsp+8*267],r12
	mov r8, qword [rsp+8*267]
	cmp r8, 0
	je L_300
	mov r8, qword [rsp+8*4]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12, qword [rsp+8*17]
	mov r11,r12
	mov qword [rsp+8*4],r8
	mov qword [rsp+8*268],r10
	mov qword [rsp+8*269],r11
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*269]
	call    address
	mov [rsp+8*270], rax
	mov r8, qword [rsp+8*270]
	mov r9, qword [rsp+8*11]
	mov [r8],r9
	mov r11, qword [rsp+8*26]
	mov r10,r11
	mov qword [rsp+8*271],r10
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*271]
	call    address
	mov [rsp+8*272], rax
	mov r8, qword [rsp+8*272]
	mov r9, qword [rsp+8*12]
	mov [r8],r9
	mov r10, qword [rsp+8*13]
	mov r11,1
	mov r12,r10
	add r12,r11
	mov r14, qword [rsp+8*33]
	mov r13,r14
	mov qword [rsp+8*273],r12
	mov qword [rsp+8*274],r13
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*274]
	call    address
	mov [rsp+8*275], rax
	mov r8, qword [rsp+8*275]
	mov r9, [r8]
	mov qword [rsp+8*275],r8
	mov qword [rsp+8*274],r9
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*274]
	call    address
	mov [rsp+8*275], rax
	mov r8, qword [rsp+8*275]
	mov r9, qword [rsp+8*273]
	mov [r8],r9
	mov r10, qword [rsp+8*11]
	mov r11, qword [rsp+8*8]
	cmp r10,r11
	mov r12, 0
	sete r12B
	mov qword [rsp+8*276],r12
	mov r8, qword [rsp+8*276]
	cmp r8, 0
	jne L_301
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*277],r8
	jmp L_302
	
L_301:
	mov r8, qword [rsp+8*12]
	mov r9, qword [rsp+8*10]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*278],r10
	mov r9, qword [rsp+8*278]
	mov r8,r9
	mov qword [rsp+8*277],r8
	
L_302:
	mov r8, qword [rsp+8*277]
	cmp r8, 0
	je L_304
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_304:
	
L_300:
	
L_298:
	mov r8, qword [rsp+8*14]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*279],r10
	mov r8, qword [rsp+8*279]
	cmp r8, 0
	je L_306
	jmp L_224
	
L_306:
	mov r8, qword [rsp+8*3]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov qword [rsp+8*3],r8
	mov qword [rsp+8*280],r10
	jmp L_223
	
L_224:
	mov r8, qword [rsp+8*14]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov qword [rsp+8*281],r10
	mov r8, qword [rsp+8*281]
	cmp r8, 0
	je L_307
	mov r9, qword [rsp+8*33]
	mov r8,r9
	mov qword [rsp+8*282],r8
	mov     rsi, [rsp+8*8]
	mov     rdi, [rsp+8*282]
	call    address
	mov [rsp+8*283], rax
	mov r8, qword [rsp+8*283]
	mov r9, [r8]
	mov qword [rsp+8*283],r8
	mov qword [rsp+8*282],r9
	mov     rsi, [rsp+8*10]
	mov     rdi, [rsp+8*282]
	call    address
	mov [rsp+8*283], rax
	mov r8, qword [rsp+8*283]
	mov r9, [r8]
	mov r10,r9
	mov r11,r10
	mov qword [rsp+8*283],r8
	mov qword [rsp+8*284],r9
	mov qword [arg+8*0],r10
	mov qword [rsp+8*285],r11
	mov     rdi, [rsp+8*285]
	call    toString
	mov     qword[rsp+8*286], rax
	mov r9, qword [rsp+8*286]
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*287],r10
	mov rdi, formatln
	mov rsi,[rsp+8*287] 
	add rsi, 1 
	xor rax, rax
	call printf
	jmp L_308
	
L_307:
	mov r9,t453
	mov r8,r9
	mov r10,r8
	mov qword [arg+8*0],r8
	mov qword [rsp+8*288],r10
	mov rdi, formatln
	mov rsi,[rsp+8*288] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_308:
	mov r8,0
	mov rax,r8
	leave
	ret
	mov r8,0
	mov rax,r8
	leave
	ret
	jmp QED
	
check:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2416
	mov r9, qword [arg+8*0]
	mov r8,r9
	mov r11, qword [arg+8*1]
	mov r10,r11
	cmp r8,r10
	mov r12, 0
	setl r12B
	mov qword [rsp+8*289],r8
	mov qword [rsp+8*290],r10
	mov qword [rsp+8*291],r12
	mov r8, qword [rsp+8*291]
	cmp r8, 0
	jne L_209
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*292],r8
	jmp L_210
	
L_209:
	mov r8, qword [rsp+8*289]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov qword [rsp+8*293],r10
	mov r9, qword [rsp+8*293]
	mov r8,r9
	mov qword [rsp+8*292],r8
	
L_210:
	mov r8, qword [rsp+8*292]
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
	sub    rsp, 2416
	mov r8, qword [rsp+8*294]
	mov rax,r8
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   4400
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
	
t453:
	 db 12,"no solution!" ,0


