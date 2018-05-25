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
	sub    rsp, 952
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 2936
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
	mov r10,106
	mov r9,r10
	mov r11,r9
	mov qword [rsp+8*1],r8
	mov qword rdi,r9
	mov qword [rsp+8*3],r11
	mov     rdi, [rsp+8*3]
	call    mallocArray
	mov     qword [rsp+8*4], rax
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov qword [gbl+8*5],r8
	mov qword [gbl+8*6],r10
	
L_160:
	mov r8,  [gbl+8*6]
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*7],r10
	je L_161
	mov     rdi, [rsp+8*3]
	call    mallocArray
	mov     qword [rsp+8*8], rax
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*6]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12,  [rsp+8*8]
	mov [r11],r12
	mov r14,0
	mov r13,r14
	mov qword [rsp+8*9],r8
	mov qword [rsp+8*10],r11
	mov qword [gbl+8*11],r13
	
L_162:
	mov r8,  [gbl+8*11]
	mov r9,  [rsp+8*3]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*12],r10
	je L_163
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*6]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [gbl+8*11]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13,0
	mov [r11],r13
	mov r14,r12
	inc r12 
	mov qword [rsp+8*13],r8
	mov qword [rsp+8*14],r11
	mov qword [gbl+8*11],r12
	mov qword [rsp+8*15],r14
	jmp L_162
	
L_163:
	mov r9,  [gbl+8*6]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*16],r8
	mov qword [gbl+8*6],r9
	jmp L_160
	
L_161:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r12,101
	mov r11,r12
	mov r13,1
	mov r14,r11
	sub r14,r13
	mov r15,r14
	mov qword [rsp+8*17],r8
	mov r8,r15
	mov qword [rsp+8*18],r10
	mov r10,0
	mov r9,r10
	mov qword [gbl+8*22],r8
	mov qword [gbl+8*6],r9
	mov qword [gbl+8*19],r11
	mov qword [rsp+8*20],r14
	mov qword [gbl+8*21],r15
	
L_140:
	mov r8,  [gbl+8*6]
	mov r9,  [gbl+8*19]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*23],r10
	je L_141
	mov r9,0
	mov r8,r9
	mov qword [gbl+8*11],r8
	
L_143:
	mov r8,  [gbl+8*11]
	mov r9,  [gbl+8*19]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*24],r10
	je L_144
	mov r8,1
	mov r9,r8
	neg r9
	mov r11,  [gbl+8*5]
	mov r10,r11
	mov r12,  [gbl+8*6]
	mov r13,r12
	add r13,1
	shl r13,4
	add r13,r10
	mov r10, [r13]
	mov r14,  [gbl+8*11]
	mov r13,r14
	add r13,1
	shl r13,4
	add r13,r10
	mov [r13],r9
	mov r15,r14
	inc r14 
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov qword [rsp+8*27],r13
	mov qword [gbl+8*11],r14
	mov qword [rsp+8*28],r15
	jmp L_143
	
L_144:
	mov r9,  [gbl+8*6]
	mov r8,r9
	inc r9 
	mov qword [rsp+8*29],r8
	mov qword [gbl+8*6],r9
	jmp L_140
	
L_141:
	
L_146:
	mov r8,  [gbl+8*30]
	mov r9,  [gbl+8*31]
	cmp r8,r9
	mov r10, 0
	setle r10B
	cmp r10, 0
	mov qword [rsp+8*32],r10
	je L_147
	mov r9,  [gbl+8*33]
	mov r8,r9
	mov r10,  [gbl+8*30]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r12, [r11]
	mov r13,r12
	mov r15,  [gbl+8*38]
	mov r14,r15
	mov qword [rsp+8*34],r8
	mov r8,r10
	add r8,1
	shl r8,4
	add r8,r14
	mov qword [rsp+8*35],r11
	mov r11, [r8]
	mov qword [rsp+8*40],r8
	mov r8,r11
	mov qword [rsp+8*41],r11
	mov qword [rsp+8*36],r12
	mov r12,  [gbl+8*5]
	mov r11,r12
	mov qword [rsp+8*39],r14
	mov r14,r13
	add r14,1
	shl r14,4
	add r14,r11
	mov r11, [r14]
	mov r14,r8
	add r14,1
	shl r14,4
	add r14,r11
	mov qword [rsp+8*43],r11
	mov r11, [r14]
	mov qword [rsp+8*44],r14
	mov r14,r11
	mov qword [rsp+8*45],r11
	mov r11,1
	mov r9,r13
	sub r9,r11
	mov r11,2
	mov r15,r8
	sub r15,r11
	mov r11,r15
	mov r15,r9
	mov r9,r15
	mov r10,r11
	mov r12,  [gbl+8*19]
	mov r11,r12
	mov r15,r9
	mov qword [gbl+8*46],r14
	mov r14,r15
	mov qword [gbl+8*37],r13
	mov r13,r11
	cmp r14,r13
	mov qword [gbl+8*42],r8
	mov r8, 0
	setl r8B
	cmp r8, 0
	mov qword [rsp+8*54],r8
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*51],r10
	mov qword rsi,r11
	mov qword [rsp+8*53],r13
	mov qword [rsp+8*52],r14
	mov qword rdi,r15
	jne L_197
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_198
	
L_197:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_198:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_201
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_202
	
L_201:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov r14, 0
	setl r14B
	cmp r14, 0
	mov qword rsi,r8
	mov qword rdi,r10
	mov qword [rsp+8*52],r12
	mov qword [rsp+8*53],r13
	mov qword [rsp+8*54],r14
	jne L_203
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_204
	
L_203:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_204:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_202:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_207
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*51]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov r14,1
	mov r15,r14
	neg r15
	cmp r13,r15
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*60],r8
	mov qword [rsp+8*64],r9
	mov qword [rsp+8*61],r11
	mov qword [rsp+8*62],r13
	mov qword [rsp+8*63],r15
	je L_208
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [gbl+8*33]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r14,  [rsp+8*50]
	mov [r13],r14
	mov r9,  [gbl+8*38]
	mov r15,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r15
	mov r12,  [rsp+8*51]
	mov [r10],r12
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*46]
	mov qword [rsp+8*67],r13
	mov r13,1
	mov r14,r11
	add r14,r13
	mov qword [gbl+8*31],r8
	mov r8,  [gbl+8*5]
	mov r9,r8
	mov qword [rsp+8*68],r15
	mov r15,  [rsp+8*50]
	mov qword [rsp+8*69],r10
	mov r10,r15
	add r10,1
	shl r10,4
	add r10,r9
	mov r9, [r10]
	mov r10,r12
	add r10,1
	shl r10,4
	add r10,r9
	mov [r10],r14
	mov r11,  [gbl+8*22]
	cmp r15,r11
	mov r13, 0
	sete r13B
	cmp r13, 0
	mov qword [rsp+8*71],r9
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r13
	mov qword [rsp+8*70],r14
	jne L_209
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_210
	
L_209:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_210:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_211
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_211:
	
L_208:
	
L_207:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov r12,1
	mov r13,r11
	sub r13,r12
	mov r14,  [gbl+8*42]
	mov r15,2
	mov qword [rsp+8*77],r10
	mov r10,r14
	add r10,r15
	mov r12,r10
	mov r10,r13
	mov r13,r10
	mov r15,r12
	mov r9,  [gbl+8*19]
	mov r12,r9
	mov r10,r13
	mov qword [rsp+8*76],r8
	mov r8,r10
	mov r11,r12
	cmp r8,r11
	mov r14, 0
	setl r14B
	cmp r14, 0
	mov qword [rsp+8*52],r8
	mov qword rdi,r10
	mov qword [rsp+8*53],r11
	mov qword rsi,r12
	mov qword [rsp+8*50],r13
	mov qword [rsp+8*54],r14
	mov qword [rsp+8*51],r15
	jne L_214
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_215
	
L_214:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_215:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_218
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_219
	
L_218:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov r14, 0
	setl r14B
	cmp r14, 0
	mov qword rsi,r8
	mov qword rdi,r10
	mov qword [rsp+8*52],r12
	mov qword [rsp+8*53],r13
	mov qword [rsp+8*54],r14
	jne L_220
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_221
	
L_220:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_221:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_219:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_224
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*51]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov r14,1
	mov r15,r14
	neg r15
	cmp r13,r15
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*60],r8
	mov qword [rsp+8*64],r9
	mov qword [rsp+8*61],r11
	mov qword [rsp+8*62],r13
	mov qword [rsp+8*63],r15
	je L_225
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [gbl+8*33]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r14,  [rsp+8*50]
	mov [r13],r14
	mov r9,  [gbl+8*38]
	mov r15,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r15
	mov r12,  [rsp+8*51]
	mov [r10],r12
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*46]
	mov qword [rsp+8*67],r13
	mov r13,1
	mov r14,r11
	add r14,r13
	mov qword [gbl+8*31],r8
	mov r8,  [gbl+8*5]
	mov r9,r8
	mov qword [rsp+8*68],r15
	mov r15,  [rsp+8*50]
	mov qword [rsp+8*69],r10
	mov r10,r15
	add r10,1
	shl r10,4
	add r10,r9
	mov r9, [r10]
	mov r10,r12
	add r10,1
	shl r10,4
	add r10,r9
	mov [r10],r14
	mov r11,  [gbl+8*22]
	cmp r15,r11
	mov r13, 0
	sete r13B
	cmp r13, 0
	mov qword [rsp+8*71],r9
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r13
	mov qword [rsp+8*70],r14
	jne L_226
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_227
	
L_226:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_227:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_228
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_228:
	
L_225:
	
L_224:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov r12,1
	mov r13,r11
	add r13,r12
	mov r14,  [gbl+8*42]
	mov r15,2
	mov qword [rsp+8*80],r10
	mov r10,r14
	sub r10,r15
	mov r12,r10
	mov r10,r13
	mov r13,r10
	mov r15,r12
	mov r9,  [gbl+8*19]
	mov r12,r9
	mov r10,r13
	mov qword [rsp+8*76],r8
	mov r8,r10
	mov r11,r12
	cmp r8,r11
	mov r14, 0
	setl r14B
	cmp r14, 0
	mov qword [rsp+8*52],r8
	mov qword rdi,r10
	mov qword [rsp+8*53],r11
	mov qword rsi,r12
	mov qword [rsp+8*50],r13
	mov qword [rsp+8*54],r14
	mov qword [rsp+8*51],r15
	jne L_231
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_232
	
L_231:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_232:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_235
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_236
	
L_235:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov r14, 0
	setl r14B
	cmp r14, 0
	mov qword rsi,r8
	mov qword rdi,r10
	mov qword [rsp+8*52],r12
	mov qword [rsp+8*53],r13
	mov qword [rsp+8*54],r14
	jne L_237
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_238
	
L_237:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_238:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_236:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_241
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*51]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov r14,1
	mov r15,r14
	neg r15
	cmp r13,r15
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*60],r8
	mov qword [rsp+8*64],r9
	mov qword [rsp+8*61],r11
	mov qword [rsp+8*62],r13
	mov qword [rsp+8*63],r15
	je L_242
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [gbl+8*33]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r14,  [rsp+8*50]
	mov [r13],r14
	mov r9,  [gbl+8*38]
	mov r15,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r15
	mov r12,  [rsp+8*51]
	mov [r10],r12
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*46]
	mov qword [rsp+8*67],r13
	mov r13,1
	mov r14,r11
	add r14,r13
	mov qword [gbl+8*31],r8
	mov r8,  [gbl+8*5]
	mov r9,r8
	mov qword [rsp+8*68],r15
	mov r15,  [rsp+8*50]
	mov qword [rsp+8*69],r10
	mov r10,r15
	add r10,1
	shl r10,4
	add r10,r9
	mov r9, [r10]
	mov r10,r12
	add r10,1
	shl r10,4
	add r10,r9
	mov [r10],r14
	mov r11,  [gbl+8*22]
	cmp r15,r11
	mov r13, 0
	sete r13B
	cmp r13, 0
	mov qword [rsp+8*71],r9
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r13
	mov qword [rsp+8*70],r14
	jne L_243
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_244
	
L_243:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_244:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_245
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_245:
	
L_242:
	
L_241:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov r12,1
	mov r13,r11
	add r13,r12
	mov r14,  [gbl+8*42]
	mov r15,2
	mov qword [rsp+8*83],r10
	mov r10,r14
	add r10,r15
	mov r12,r10
	mov r10,r13
	mov r13,r10
	mov r15,r12
	mov r9,  [gbl+8*19]
	mov r12,r9
	mov r10,r13
	mov qword [rsp+8*76],r8
	mov r8,r10
	mov r11,r12
	cmp r8,r11
	mov r14, 0
	setl r14B
	cmp r14, 0
	mov qword [rsp+8*52],r8
	mov qword rdi,r10
	mov qword [rsp+8*53],r11
	mov qword rsi,r12
	mov qword [rsp+8*50],r13
	mov qword [rsp+8*54],r14
	mov qword [rsp+8*51],r15
	jne L_248
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_249
	
L_248:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_249:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_252
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_253
	
L_252:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov r14, 0
	setl r14B
	cmp r14, 0
	mov qword rsi,r8
	mov qword rdi,r10
	mov qword [rsp+8*52],r12
	mov qword [rsp+8*53],r13
	mov qword [rsp+8*54],r14
	jne L_254
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_255
	
L_254:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_255:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_253:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_258
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*51]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov r14,1
	mov r15,r14
	neg r15
	cmp r13,r15
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*60],r8
	mov qword [rsp+8*64],r9
	mov qword [rsp+8*61],r11
	mov qword [rsp+8*62],r13
	mov qword [rsp+8*63],r15
	je L_259
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [gbl+8*33]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r14,  [rsp+8*50]
	mov [r13],r14
	mov r9,  [gbl+8*38]
	mov r15,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r15
	mov r12,  [rsp+8*51]
	mov [r10],r12
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*46]
	mov qword [rsp+8*67],r13
	mov r13,1
	mov r14,r11
	add r14,r13
	mov qword [gbl+8*31],r8
	mov r8,  [gbl+8*5]
	mov r9,r8
	mov qword [rsp+8*68],r15
	mov r15,  [rsp+8*50]
	mov qword [rsp+8*69],r10
	mov r10,r15
	add r10,1
	shl r10,4
	add r10,r9
	mov r9, [r10]
	mov r10,r12
	add r10,1
	shl r10,4
	add r10,r9
	mov [r10],r14
	mov r11,  [gbl+8*22]
	cmp r15,r11
	mov r13, 0
	sete r13B
	cmp r13, 0
	mov qword [rsp+8*71],r9
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r13
	mov qword [rsp+8*70],r14
	jne L_260
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_261
	
L_260:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_261:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_262
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_262:
	
L_259:
	
L_258:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov r12,2
	mov r13,r11
	sub r13,r12
	mov r14,  [gbl+8*42]
	mov r15,1
	mov qword [rsp+8*86],r10
	mov r10,r14
	sub r10,r15
	mov r12,r10
	mov r10,r13
	mov r13,r10
	mov r15,r12
	mov r9,  [gbl+8*19]
	mov r12,r9
	mov r10,r13
	mov qword [rsp+8*76],r8
	mov r8,r10
	mov r11,r12
	cmp r8,r11
	mov r14, 0
	setl r14B
	cmp r14, 0
	mov qword [rsp+8*52],r8
	mov qword rdi,r10
	mov qword [rsp+8*53],r11
	mov qword rsi,r12
	mov qword [rsp+8*50],r13
	mov qword [rsp+8*54],r14
	mov qword [rsp+8*51],r15
	jne L_265
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_266
	
L_265:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_266:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_269
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_270
	
L_269:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov r14, 0
	setl r14B
	cmp r14, 0
	mov qword rsi,r8
	mov qword rdi,r10
	mov qword [rsp+8*52],r12
	mov qword [rsp+8*53],r13
	mov qword [rsp+8*54],r14
	jne L_271
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_272
	
L_271:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_272:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_270:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_275
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*51]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov r14,1
	mov r15,r14
	neg r15
	cmp r13,r15
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*60],r8
	mov qword [rsp+8*64],r9
	mov qword [rsp+8*61],r11
	mov qword [rsp+8*62],r13
	mov qword [rsp+8*63],r15
	je L_276
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [gbl+8*33]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r14,  [rsp+8*50]
	mov [r13],r14
	mov r9,  [gbl+8*38]
	mov r15,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r15
	mov r12,  [rsp+8*51]
	mov [r10],r12
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*46]
	mov qword [rsp+8*67],r13
	mov r13,1
	mov r14,r11
	add r14,r13
	mov qword [gbl+8*31],r8
	mov r8,  [gbl+8*5]
	mov r9,r8
	mov qword [rsp+8*68],r15
	mov r15,  [rsp+8*50]
	mov qword [rsp+8*69],r10
	mov r10,r15
	add r10,1
	shl r10,4
	add r10,r9
	mov r9, [r10]
	mov r10,r12
	add r10,1
	shl r10,4
	add r10,r9
	mov [r10],r14
	mov r11,  [gbl+8*22]
	cmp r15,r11
	mov r13, 0
	sete r13B
	cmp r13, 0
	mov qword [rsp+8*71],r9
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r13
	mov qword [rsp+8*70],r14
	jne L_277
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_278
	
L_277:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_278:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_279
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_279:
	
L_276:
	
L_275:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov r12,2
	mov r13,r11
	sub r13,r12
	mov r14,  [gbl+8*42]
	mov r15,1
	mov qword [rsp+8*89],r10
	mov r10,r14
	add r10,r15
	mov r12,r10
	mov r10,r13
	mov r13,r10
	mov r15,r12
	mov r9,  [gbl+8*19]
	mov r12,r9
	mov r10,r13
	mov qword [rsp+8*76],r8
	mov r8,r10
	mov r11,r12
	cmp r8,r11
	mov r14, 0
	setl r14B
	cmp r14, 0
	mov qword [rsp+8*52],r8
	mov qword rdi,r10
	mov qword [rsp+8*53],r11
	mov qword rsi,r12
	mov qword [rsp+8*50],r13
	mov qword [rsp+8*54],r14
	mov qword [rsp+8*51],r15
	jne L_282
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_283
	
L_282:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_283:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_286
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_287
	
L_286:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov r14, 0
	setl r14B
	cmp r14, 0
	mov qword rsi,r8
	mov qword rdi,r10
	mov qword [rsp+8*52],r12
	mov qword [rsp+8*53],r13
	mov qword [rsp+8*54],r14
	jne L_288
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_289
	
L_288:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_289:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_287:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_292
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*51]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov r14,1
	mov r15,r14
	neg r15
	cmp r13,r15
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*60],r8
	mov qword [rsp+8*64],r9
	mov qword [rsp+8*61],r11
	mov qword [rsp+8*62],r13
	mov qword [rsp+8*63],r15
	je L_293
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [gbl+8*33]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r14,  [rsp+8*50]
	mov [r13],r14
	mov r9,  [gbl+8*38]
	mov r15,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r15
	mov r12,  [rsp+8*51]
	mov [r10],r12
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*46]
	mov qword [rsp+8*67],r13
	mov r13,1
	mov r14,r11
	add r14,r13
	mov qword [gbl+8*31],r8
	mov r8,  [gbl+8*5]
	mov r9,r8
	mov qword [rsp+8*68],r15
	mov r15,  [rsp+8*50]
	mov qword [rsp+8*69],r10
	mov r10,r15
	add r10,1
	shl r10,4
	add r10,r9
	mov r9, [r10]
	mov r10,r12
	add r10,1
	shl r10,4
	add r10,r9
	mov [r10],r14
	mov r11,  [gbl+8*22]
	cmp r15,r11
	mov r13, 0
	sete r13B
	cmp r13, 0
	mov qword [rsp+8*71],r9
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r13
	mov qword [rsp+8*70],r14
	jne L_294
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_295
	
L_294:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_295:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_296
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_296:
	
L_293:
	
L_292:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov r12,2
	mov r13,r11
	add r13,r12
	mov r14,  [gbl+8*42]
	mov r15,1
	mov qword [rsp+8*92],r10
	mov r10,r14
	sub r10,r15
	mov r12,r10
	mov r10,r13
	mov r13,r10
	mov r15,r12
	mov r9,  [gbl+8*19]
	mov r12,r9
	mov r10,r13
	mov qword [rsp+8*76],r8
	mov r8,r10
	mov r11,r12
	cmp r8,r11
	mov r14, 0
	setl r14B
	cmp r14, 0
	mov qword [rsp+8*52],r8
	mov qword rdi,r10
	mov qword [rsp+8*53],r11
	mov qword rsi,r12
	mov qword [rsp+8*50],r13
	mov qword [rsp+8*54],r14
	mov qword [rsp+8*51],r15
	jne L_299
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_300
	
L_299:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_300:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_303
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_304
	
L_303:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov r14, 0
	setl r14B
	cmp r14, 0
	mov qword rsi,r8
	mov qword rdi,r10
	mov qword [rsp+8*52],r12
	mov qword [rsp+8*53],r13
	mov qword [rsp+8*54],r14
	jne L_305
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_306
	
L_305:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_306:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_304:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_309
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*51]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov r14,1
	mov r15,r14
	neg r15
	cmp r13,r15
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*60],r8
	mov qword [rsp+8*64],r9
	mov qword [rsp+8*61],r11
	mov qword [rsp+8*62],r13
	mov qword [rsp+8*63],r15
	je L_310
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [gbl+8*33]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r14,  [rsp+8*50]
	mov [r13],r14
	mov r9,  [gbl+8*38]
	mov r15,r9
	mov qword [rsp+8*65],r10
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r15
	mov r12,  [rsp+8*51]
	mov [r10],r12
	mov qword [rsp+8*66],r11
	mov r11,  [gbl+8*46]
	mov qword [rsp+8*67],r13
	mov r13,1
	mov r14,r11
	add r14,r13
	mov qword [gbl+8*31],r8
	mov r8,  [gbl+8*5]
	mov r9,r8
	mov qword [rsp+8*68],r15
	mov r15,  [rsp+8*50]
	mov qword [rsp+8*69],r10
	mov r10,r15
	add r10,1
	shl r10,4
	add r10,r9
	mov r9, [r10]
	mov r10,r12
	add r10,1
	shl r10,4
	add r10,r9
	mov [r10],r14
	mov r11,  [gbl+8*22]
	cmp r15,r11
	mov r13, 0
	sete r13B
	cmp r13, 0
	mov qword [rsp+8*71],r9
	mov qword [rsp+8*72],r10
	mov qword [rsp+8*73],r13
	mov qword [rsp+8*70],r14
	jne L_311
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_312
	
L_311:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_312:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_313
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_313:
	
L_310:
	
L_309:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*37]
	mov r12,2
	mov r13,r11
	add r13,r12
	mov r14,  [gbl+8*42]
	mov r15,1
	mov qword [rsp+8*95],r10
	mov r10,r14
	add r10,r15
	mov r11,r10
	mov r10,r13
	mov r12,r10
	mov r13,r11
	mov r14,  [gbl+8*19]
	mov r11,r14
	mov r10,r12
	mov r15,r10
	mov r9,r11
	cmp r15,r9
	mov qword [rsp+8*76],r8
	mov r8, 0
	setl r8B
	cmp r8, 0
	mov qword [rsp+8*54],r8
	mov qword [rsp+8*53],r9
	mov qword rdi,r10
	mov qword rsi,r11
	mov qword [rsp+8*50],r12
	mov qword [rsp+8*51],r13
	mov qword [rsp+8*52],r15
	jne L_316
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_317
	
L_316:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_317:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	cmp r10, 0
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*57],r10
	jne L_320
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*58],r8
	jmp L_321
	
L_320:
	mov r9,  [gbl+8*19]
	mov r8,r9
	mov r11,  [rsp+8*51]
	mov r10,r11
	mov r12,r10
	mov r13,r8
	cmp r12,r13
	mov r14, 0
	setl r14B
	cmp r14, 0
	mov qword rsi,r8
	mov qword rdi,r10
	mov qword [rsp+8*52],r12
	mov qword [rsp+8*53],r13
	mov qword [rsp+8*54],r14
	jne L_322
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_323
	
L_322:
	mov r8,  [rsp+8*52]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	mov r11,r10
	mov qword [rsp+8*55],r10
	mov qword [rsp+8*54],r11
	
L_323:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword [rsp+8*56],r8
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*58],r11
	
L_321:
	mov r8,  [rsp+8*58]
	cmp r8, 0
	je L_326
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [rsp+8*50]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [rsp+8*51]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov r14,1
	mov r15,r14
	neg r15
	cmp r13,r15
	mov qword [rsp+8*60],r8
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*64],r8
	mov qword [rsp+8*61],r11
	mov qword [rsp+8*62],r13
	mov qword [rsp+8*63],r15
	je L_327
	mov r8,  [gbl+8*31]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov r12,  [gbl+8*33]
	mov r11,r12
	mov r13,r8
	add r13,1
	shl r13,4
	add r13,r11
	mov r14,  [rsp+8*50]
	mov [r13],r14
	mov r9,  [gbl+8*38]
	mov r15,r9
	mov r10,r8
	add r10,1
	shl r10,4
	add r10,r15
	mov qword [gbl+8*31],r8
	mov r8,  [rsp+8*51]
	mov [r10],r8
	mov qword [rsp+8*69],r10
	mov r10,  [gbl+8*46]
	mov qword [rsp+8*66],r11
	mov r11,1
	mov qword [rsp+8*67],r13
	mov r13,r10
	add r13,r11
	mov r11,  [gbl+8*5]
	mov r10,r11
	mov qword [rsp+8*68],r15
	mov r15,r14
	add r15,1
	shl r15,4
	add r15,r10
	mov r10, [r15]
	mov r15,r8
	add r15,1
	shl r15,4
	add r15,r10
	mov [r15],r13
	mov qword [rsp+8*71],r10
	mov r10,  [gbl+8*22]
	cmp r14,r10
	mov r13, 0
	sete r13B
	cmp r13, 0
	mov qword [rsp+8*73],r13
	mov qword [rsp+8*72],r15
	jne L_328
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*73],r8
	jmp L_329
	
L_328:
	mov r8,  [rsp+8*51]
	mov r9,  [gbl+8*21]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*74],r10
	mov qword [rsp+8*73],r11
	
L_329:
	mov r8,  [rsp+8*73]
	cmp r8, 0
	je L_330
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*75],r8
	
L_330:
	
L_327:
	
L_326:
	mov r9,0
	mov r8,r9
	mov r10,r8
	mov r11,  [gbl+8*75]
	mov r12,1
	cmp r11,r12
	mov r13, 0
	sete r13B
	cmp r13, 0
	mov qword [rsp+8*76],r8
	mov qword [rsp+8*98],r10
	mov qword [rsp+8*99],r13
	je L_149
	jmp L_147
	
L_149:
	mov r8,  [gbl+8*30]
	mov r9,1
	mov r10,r8
	add r10,r9
	mov r8,r10
	mov qword [gbl+8*30],r8
	mov qword [rsp+8*100],r10
	jmp L_146
	
L_147:
	mov r8,  [gbl+8*75]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*101],r10
	je L_150
	mov r9,  [gbl+8*5]
	mov r8,r9
	mov r10,  [gbl+8*22]
	mov r11,r10
	add r11,1
	shl r11,4
	add r11,r8
	mov r8, [r11]
	mov r12,  [gbl+8*21]
	mov r11,r12
	add r11,1
	shl r11,4
	add r11,r8
	mov r13, [r11]
	mov r14,r13
	mov r15,r14
	mov qword [rsp+8*102],r8
	mov qword [rsp+8*103],r11
	mov qword [rsp+8*104],r13
	mov qword rdi,r14
	mov qword [rsp+8*105],r15
	mov     rdi, [rsp+8*105]
	call    toString
	mov     qword[rsp+8*106], rax
	mov r9,  [rsp+8*106]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*107],r10
	mov rdi,[rsp+8*107] 
	add rdi, 1 
	call puts
	jmp L_151
	
L_150:
	mov r9,t211
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*108],r10
	mov rdi,[rsp+8*108] 
	add rdi, 1 
	call puts
	
L_151:
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 952
	mov     rdi, 12000
	call    mallocArray
	mov     qword [gbl+8*109], rax
	mov r9,  [gbl+8*109]
	mov r8,r9
	mov qword [gbl+8*33],r8
	mov     rdi, 12000
	call    mallocArray
	mov     qword [gbl+8*110], rax
	mov r9,  [gbl+8*110]
	mov r8,r9
	mov qword [gbl+8*38],r8
	mov r8,  [rsp+8*111]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   2936
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
	
t211:
	 db 12,"no solution!" ,0


