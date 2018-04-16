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
	sub    rsp, 2416
	call global_init
	mov [rsp+8*1] , rax
	mov qword [rsp+8*2] ,102
	mov qword [rsp+8*3] ,0
	mov qword [rsp+8*4] ,0
	mov qword [rsp+8*5] ,0
	mov qword [rsp+8*6] ,0
	mov r8, [rsp+8*2]
	sub r8, 1
	mov qword [rsp+8*7],r8 
	mov r8, [rsp+8*7]
	mov qword [rsp+8*8] ,r8
	mov r8, [rsp+8*2]
	sub r8, 1
	mov qword [rsp+8*9],r8 
	mov r8, [rsp+8*9]
	mov qword [rsp+8*10] ,r8
	mov qword [rsp+8*11] ,0
	mov qword [rsp+8*12] ,0
	mov qword [rsp+8*13] ,0
	mov qword [rsp+8*14] ,0
	mov r8, [rsp+8*2]
	imul r8, [rsp+8*2]
	mov qword [rsp+8*15],r8 
	mov     rdi, [rsp+8*15]
	call    mallocArray
	mov     qword [rsp+8*16], rax
	mov r8, [rsp+8*16]
	mov qword [rsp+8*17] ,r8
	mov qword [rsp+8*18] ,0
	
L_211:
	mov r8, [rsp+8*2]
	imul r8, [rsp+8*2]
	mov qword [rsp+8*19],r8 
	mov r8, [rsp+8*18]
	mov r9, [rsp+8*19]
	cmp r8, r9
	mov qword [rsp+8*20], 0
	setl [rsp+8*20]
	mov r8, [rsp+8*20]
	cmp r8, 0
	je L_212
	mov r8, [rsp+8*17]
	mov qword [rsp+8*21] ,r8
	mov     rsi, [rsp+8*18]
	mov     rdi, [rsp+8*21]
	call    address
	mov [rsp+8*22], rax
	mov r8, 0
	mov r9, [rsp+8*22]
	mov qword [r9], r8
	
L_213:
	mov r8, [rsp+8*18]
	mov qword [rsp+8*23] ,r8
	mov r8, [rsp+8*18]
	add r8, 1
	mov qword [rsp+8*18],r8 
	jmp L_211
	
L_212:
	mov r8, [rsp+8*2]
	imul r8, [rsp+8*2]
	mov qword [rsp+8*24],r8 
	mov     rdi, [rsp+8*24]
	call    mallocArray
	mov     qword [rsp+8*25], rax
	mov r8, [rsp+8*25]
	mov qword [rsp+8*26] ,r8
	mov qword [rsp+8*18] ,0
	
L_214:
	mov r8, [rsp+8*2]
	imul r8, [rsp+8*2]
	mov qword [rsp+8*27],r8 
	mov r8, [rsp+8*18]
	mov r9, [rsp+8*27]
	cmp r8, r9
	mov qword [rsp+8*28], 0
	setl [rsp+8*28]
	mov r8, [rsp+8*28]
	cmp r8, 0
	je L_215
	mov r8, [rsp+8*26]
	mov qword [rsp+8*29] ,r8
	mov     rsi, [rsp+8*18]
	mov     rdi, [rsp+8*29]
	call    address
	mov [rsp+8*30], rax
	mov r8, 0
	mov r9, [rsp+8*30]
	mov qword [r9], r8
	
L_216:
	mov r8, [rsp+8*18]
	mov qword [rsp+8*31] ,r8
	mov r8, [rsp+8*18]
	add r8, 1
	mov qword [rsp+8*18],r8 
	jmp L_214
	
L_215:
	mov     rdi, [rsp+8*2]
	call    mallocArray
	mov     qword [rsp+8*32], rax
	mov r8, [rsp+8*32]
	mov qword [rsp+8*33] ,r8
	mov qword [rsp+8*18] ,0
	
L_217:
	mov r8, [rsp+8*18]
	mov r9, [rsp+8*2]
	cmp r8, r9
	mov qword [rsp+8*34], 0
	setl [rsp+8*34]
	mov r8, [rsp+8*34]
	cmp r8, 0
	je L_218
	mov     rdi, [rsp+8*2]
	call    mallocArray
	mov     qword [rsp+8*35], rax
	mov r8, [rsp+8*33]
	mov qword [rsp+8*36] ,r8
	mov     rsi, [rsp+8*18]
	mov     rdi, [rsp+8*36]
	call    address
	mov [rsp+8*37], rax
	mov r8, [rsp+8*35]
	mov r9, [rsp+8*37]
	mov qword [r9], r8
	mov qword [rsp+8*38] ,0
	
L_220:
	mov r8, [rsp+8*38]
	mov r9, [rsp+8*2]
	cmp r8, r9
	mov qword [rsp+8*39], 0
	setl [rsp+8*39]
	mov r8, [rsp+8*39]
	cmp r8, 0
	je L_221
	mov r8, 1
	neg r8
	mov [rsp+8*40], r8
	mov r8, [rsp+8*33]
	mov qword [rsp+8*41] ,r8
	mov     rsi, [rsp+8*18]
	mov     rdi, [rsp+8*41]
	call    address
	mov [rsp+8*42], rax
	mov r8, [rsp+8*42]
	mov r8, [r8]
	mov [rsp+8*41], r8
	mov     rsi, [rsp+8*38]
	mov     rdi, [rsp+8*41]
	call    address
	mov [rsp+8*42], rax
	mov r8, [rsp+8*40]
	mov r9, [rsp+8*42]
	mov qword [r9], r8
	
L_222:
	mov r8, [rsp+8*38]
	mov qword [rsp+8*43] ,r8
	mov r8, [rsp+8*38]
	add r8, 1
	mov qword [rsp+8*38],r8 
	jmp L_220
	
L_221:
	
L_219:
	mov r8, [rsp+8*18]
	mov qword [rsp+8*44] ,r8
	mov r8, [rsp+8*18]
	add r8, 1
	mov qword [rsp+8*18],r8 
	jmp L_217
	
L_218:
	mov r8, [rsp+8*17]
	mov qword [rsp+8*45] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*45]
	call    address
	mov [rsp+8*46], rax
	mov r8, [rsp+8*5]
	mov r9, [rsp+8*46]
	mov qword [r9], r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*47] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*47]
	call    address
	mov [rsp+8*48], rax
	mov r8, [rsp+8*6]
	mov r9, [rsp+8*48]
	mov qword [r9], r8
	mov r8, [rsp+8*33]
	mov qword [rsp+8*49] ,r8
	mov     rsi, [rsp+8*5]
	mov     rdi, [rsp+8*49]
	call    address
	mov [rsp+8*50], rax
	mov r8, [rsp+8*50]
	mov r8, [r8]
	mov [rsp+8*49], r8
	mov     rsi, [rsp+8*6]
	mov     rdi, [rsp+8*49]
	call    address
	mov [rsp+8*50], rax
	mov r8, 0
	mov r9, [rsp+8*50]
	mov qword [r9], r8
	
L_223:
	mov r8, [rsp+8*3]
	mov r9, [rsp+8*4]
	cmp r8, r9
	mov qword [rsp+8*51], 0
	setle [rsp+8*51]
	mov r8, [rsp+8*51]
	cmp r8, 0
	je L_224
	mov r8, [rsp+8*17]
	mov qword [rsp+8*52] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*52]
	call    address
	mov [rsp+8*53], rax
	mov r8, [rsp+8*53]
	mov r8, [r8]
	mov [rsp+8*54], r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*55] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*55]
	call    address
	mov [rsp+8*56], rax
	mov r8, [rsp+8*56]
	mov r8, [r8]
	mov [rsp+8*57], r8
	mov r8, [rsp+8*33]
	mov qword [rsp+8*58] ,r8
	mov     rsi, [rsp+8*54]
	mov     rdi, [rsp+8*58]
	call    address
	mov [rsp+8*59], rax
	mov r8, [rsp+8*59]
	mov r8, [r8]
	mov [rsp+8*58], r8
	mov     rsi, [rsp+8*57]
	mov     rdi, [rsp+8*58]
	call    address
	mov [rsp+8*59], rax
	mov r8, [rsp+8*59]
	mov r8, [r8]
	mov [rsp+8*60], r8
	mov r8, [rsp+8*60]
	mov qword [rsp+8*13] ,r8
	mov r8, [rsp+8*17]
	mov qword [rsp+8*61] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*61]
	call    address
	mov [rsp+8*62], rax
	mov r8, [rsp+8*62]
	mov r8, [r8]
	mov [rsp+8*63], r8
	mov r8, [rsp+8*63]
	sub r8, 1
	mov qword [rsp+8*64],r8 
	mov r8, [rsp+8*64]
	mov qword [rsp+8*11] ,r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*65] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*65]
	call    address
	mov [rsp+8*66], rax
	mov r8, [rsp+8*66]
	mov r8, [r8]
	mov [rsp+8*67], r8
	mov r8, [rsp+8*67]
	sub r8, 2
	mov qword [rsp+8*68],r8 
	mov r8, [rsp+8*68]
	mov qword [rsp+8*12] ,r8
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*11]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*71] , rax
	mov r8, [rsp+8*71]
	cmp r8, 0
	jne L_225
	mov qword [rsp+8*72] ,0
	jmp L_226
	
L_225:
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*12]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*73] , rax
	mov r8, [rsp+8*73]
	mov qword [rsp+8*72] ,r8
	
L_226:
	mov r8, [rsp+8*72]
	cmp r8, 0
	je L_228
	mov r8, [rsp+8*33]
	mov qword [rsp+8*74] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*74]
	call    address
	mov [rsp+8*75], rax
	mov r8, [rsp+8*75]
	mov r8, [r8]
	mov [rsp+8*74], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*74]
	call    address
	mov [rsp+8*75], rax
	mov r8, [rsp+8*75]
	mov r8, [r8]
	mov [rsp+8*76], r8
	mov r8, 1
	neg r8
	mov [rsp+8*77], r8
	mov r8, [rsp+8*76]
	mov r9, [rsp+8*77]
	cmp r8, r9
	mov qword [rsp+8*78], 0
	sete [rsp+8*78]
	mov r8, [rsp+8*78]
	cmp r8, 0
	je L_230
	mov r8, [rsp+8*4]
	add r8, 1
	mov qword [rsp+8*79],r8 
	mov r8, [rsp+8*79]
	mov qword [rsp+8*4] ,r8
	mov r8, [rsp+8*17]
	mov qword [rsp+8*80] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*80]
	call    address
	mov [rsp+8*81], rax
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*81]
	mov qword [r9], r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*82] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*82]
	call    address
	mov [rsp+8*83], rax
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*83]
	mov qword [r9], r8
	mov r8, [rsp+8*13]
	add r8, 1
	mov qword [rsp+8*84],r8 
	mov r8, [rsp+8*33]
	mov qword [rsp+8*85] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*85]
	call    address
	mov [rsp+8*86], rax
	mov r8, [rsp+8*86]
	mov r8, [r8]
	mov [rsp+8*85], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*85]
	call    address
	mov [rsp+8*86], rax
	mov r8, [rsp+8*84]
	mov r9, [rsp+8*86]
	mov qword [r9], r8
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*8]
	cmp r8, r9
	mov qword [rsp+8*87], 0
	sete [rsp+8*87]
	mov r8, [rsp+8*87]
	cmp r8, 0
	jne L_231
	mov qword [rsp+8*88] ,0
	jmp L_232
	
L_231:
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*10]
	cmp r8, r9
	mov qword [rsp+8*89], 0
	sete [rsp+8*89]
	mov r8, [rsp+8*89]
	mov qword [rsp+8*88] ,r8
	
L_232:
	mov r8, [rsp+8*88]
	cmp r8, 0
	je L_234
	mov qword [rsp+8*14] ,1
	
L_234:
	
L_230:
	
L_228:
	mov r8, [rsp+8*17]
	mov qword [rsp+8*90] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*90]
	call    address
	mov [rsp+8*91], rax
	mov r8, [rsp+8*91]
	mov r8, [r8]
	mov [rsp+8*92], r8
	mov r8, [rsp+8*92]
	sub r8, 1
	mov qword [rsp+8*93],r8 
	mov r8, [rsp+8*93]
	mov qword [rsp+8*11] ,r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*94] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*94]
	call    address
	mov [rsp+8*95], rax
	mov r8, [rsp+8*95]
	mov r8, [r8]
	mov [rsp+8*96], r8
	mov r8, [rsp+8*96]
	add r8, 2
	mov qword [rsp+8*97],r8 
	mov r8, [rsp+8*97]
	mov qword [rsp+8*12] ,r8
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*11]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*98] , rax
	mov r8, [rsp+8*98]
	cmp r8, 0
	jne L_235
	mov qword [rsp+8*99] ,0
	jmp L_236
	
L_235:
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*12]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*100] , rax
	mov r8, [rsp+8*100]
	mov qword [rsp+8*99] ,r8
	
L_236:
	mov r8, [rsp+8*99]
	cmp r8, 0
	je L_238
	mov r8, [rsp+8*33]
	mov qword [rsp+8*101] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*101]
	call    address
	mov [rsp+8*102], rax
	mov r8, [rsp+8*102]
	mov r8, [r8]
	mov [rsp+8*101], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*101]
	call    address
	mov [rsp+8*102], rax
	mov r8, [rsp+8*102]
	mov r8, [r8]
	mov [rsp+8*103], r8
	mov r8, 1
	neg r8
	mov [rsp+8*104], r8
	mov r8, [rsp+8*103]
	mov r9, [rsp+8*104]
	cmp r8, r9
	mov qword [rsp+8*105], 0
	sete [rsp+8*105]
	mov r8, [rsp+8*105]
	cmp r8, 0
	je L_240
	mov r8, [rsp+8*4]
	add r8, 1
	mov qword [rsp+8*106],r8 
	mov r8, [rsp+8*106]
	mov qword [rsp+8*4] ,r8
	mov r8, [rsp+8*17]
	mov qword [rsp+8*107] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*107]
	call    address
	mov [rsp+8*108], rax
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*108]
	mov qword [r9], r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*109] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*109]
	call    address
	mov [rsp+8*110], rax
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*110]
	mov qword [r9], r8
	mov r8, [rsp+8*13]
	add r8, 1
	mov qword [rsp+8*111],r8 
	mov r8, [rsp+8*33]
	mov qword [rsp+8*112] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*112]
	call    address
	mov [rsp+8*113], rax
	mov r8, [rsp+8*113]
	mov r8, [r8]
	mov [rsp+8*112], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*112]
	call    address
	mov [rsp+8*113], rax
	mov r8, [rsp+8*111]
	mov r9, [rsp+8*113]
	mov qword [r9], r8
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*8]
	cmp r8, r9
	mov qword [rsp+8*114], 0
	sete [rsp+8*114]
	mov r8, [rsp+8*114]
	cmp r8, 0
	jne L_241
	mov qword [rsp+8*115] ,0
	jmp L_242
	
L_241:
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*10]
	cmp r8, r9
	mov qword [rsp+8*116], 0
	sete [rsp+8*116]
	mov r8, [rsp+8*116]
	mov qword [rsp+8*115] ,r8
	
L_242:
	mov r8, [rsp+8*115]
	cmp r8, 0
	je L_244
	mov qword [rsp+8*14] ,1
	
L_244:
	
L_240:
	
L_238:
	mov r8, [rsp+8*17]
	mov qword [rsp+8*117] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*117]
	call    address
	mov [rsp+8*118], rax
	mov r8, [rsp+8*118]
	mov r8, [r8]
	mov [rsp+8*119], r8
	mov r8, [rsp+8*119]
	add r8, 1
	mov qword [rsp+8*120],r8 
	mov r8, [rsp+8*120]
	mov qword [rsp+8*11] ,r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*121] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*121]
	call    address
	mov [rsp+8*122], rax
	mov r8, [rsp+8*122]
	mov r8, [r8]
	mov [rsp+8*123], r8
	mov r8, [rsp+8*123]
	sub r8, 2
	mov qword [rsp+8*124],r8 
	mov r8, [rsp+8*124]
	mov qword [rsp+8*12] ,r8
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*11]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*125] , rax
	mov r8, [rsp+8*125]
	cmp r8, 0
	jne L_245
	mov qword [rsp+8*126] ,0
	jmp L_246
	
L_245:
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*12]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*127] , rax
	mov r8, [rsp+8*127]
	mov qword [rsp+8*126] ,r8
	
L_246:
	mov r8, [rsp+8*126]
	cmp r8, 0
	je L_248
	mov r8, [rsp+8*33]
	mov qword [rsp+8*128] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*128]
	call    address
	mov [rsp+8*129], rax
	mov r8, [rsp+8*129]
	mov r8, [r8]
	mov [rsp+8*128], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*128]
	call    address
	mov [rsp+8*129], rax
	mov r8, [rsp+8*129]
	mov r8, [r8]
	mov [rsp+8*130], r8
	mov r8, 1
	neg r8
	mov [rsp+8*131], r8
	mov r8, [rsp+8*130]
	mov r9, [rsp+8*131]
	cmp r8, r9
	mov qword [rsp+8*132], 0
	sete [rsp+8*132]
	mov r8, [rsp+8*132]
	cmp r8, 0
	je L_250
	mov r8, [rsp+8*4]
	add r8, 1
	mov qword [rsp+8*133],r8 
	mov r8, [rsp+8*133]
	mov qword [rsp+8*4] ,r8
	mov r8, [rsp+8*17]
	mov qword [rsp+8*134] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*134]
	call    address
	mov [rsp+8*135], rax
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*135]
	mov qword [r9], r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*136] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*136]
	call    address
	mov [rsp+8*137], rax
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*137]
	mov qword [r9], r8
	mov r8, [rsp+8*13]
	add r8, 1
	mov qword [rsp+8*138],r8 
	mov r8, [rsp+8*33]
	mov qword [rsp+8*139] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*139]
	call    address
	mov [rsp+8*140], rax
	mov r8, [rsp+8*140]
	mov r8, [r8]
	mov [rsp+8*139], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*139]
	call    address
	mov [rsp+8*140], rax
	mov r8, [rsp+8*138]
	mov r9, [rsp+8*140]
	mov qword [r9], r8
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*8]
	cmp r8, r9
	mov qword [rsp+8*141], 0
	sete [rsp+8*141]
	mov r8, [rsp+8*141]
	cmp r8, 0
	jne L_251
	mov qword [rsp+8*142] ,0
	jmp L_252
	
L_251:
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*10]
	cmp r8, r9
	mov qword [rsp+8*143], 0
	sete [rsp+8*143]
	mov r8, [rsp+8*143]
	mov qword [rsp+8*142] ,r8
	
L_252:
	mov r8, [rsp+8*142]
	cmp r8, 0
	je L_254
	mov qword [rsp+8*14] ,1
	
L_254:
	
L_250:
	
L_248:
	mov r8, [rsp+8*17]
	mov qword [rsp+8*144] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*144]
	call    address
	mov [rsp+8*145], rax
	mov r8, [rsp+8*145]
	mov r8, [r8]
	mov [rsp+8*146], r8
	mov r8, [rsp+8*146]
	add r8, 1
	mov qword [rsp+8*147],r8 
	mov r8, [rsp+8*147]
	mov qword [rsp+8*11] ,r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*148] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*148]
	call    address
	mov [rsp+8*149], rax
	mov r8, [rsp+8*149]
	mov r8, [r8]
	mov [rsp+8*150], r8
	mov r8, [rsp+8*150]
	add r8, 2
	mov qword [rsp+8*151],r8 
	mov r8, [rsp+8*151]
	mov qword [rsp+8*12] ,r8
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*11]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*152] , rax
	mov r8, [rsp+8*152]
	cmp r8, 0
	jne L_255
	mov qword [rsp+8*153] ,0
	jmp L_256
	
L_255:
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*12]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*154] , rax
	mov r8, [rsp+8*154]
	mov qword [rsp+8*153] ,r8
	
L_256:
	mov r8, [rsp+8*153]
	cmp r8, 0
	je L_258
	mov r8, [rsp+8*33]
	mov qword [rsp+8*155] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*155]
	call    address
	mov [rsp+8*156], rax
	mov r8, [rsp+8*156]
	mov r8, [r8]
	mov [rsp+8*155], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*155]
	call    address
	mov [rsp+8*156], rax
	mov r8, [rsp+8*156]
	mov r8, [r8]
	mov [rsp+8*157], r8
	mov r8, 1
	neg r8
	mov [rsp+8*158], r8
	mov r8, [rsp+8*157]
	mov r9, [rsp+8*158]
	cmp r8, r9
	mov qword [rsp+8*159], 0
	sete [rsp+8*159]
	mov r8, [rsp+8*159]
	cmp r8, 0
	je L_260
	mov r8, [rsp+8*4]
	add r8, 1
	mov qword [rsp+8*160],r8 
	mov r8, [rsp+8*160]
	mov qword [rsp+8*4] ,r8
	mov r8, [rsp+8*17]
	mov qword [rsp+8*161] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*161]
	call    address
	mov [rsp+8*162], rax
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*162]
	mov qword [r9], r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*163] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*163]
	call    address
	mov [rsp+8*164], rax
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*164]
	mov qword [r9], r8
	mov r8, [rsp+8*13]
	add r8, 1
	mov qword [rsp+8*165],r8 
	mov r8, [rsp+8*33]
	mov qword [rsp+8*166] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*166]
	call    address
	mov [rsp+8*167], rax
	mov r8, [rsp+8*167]
	mov r8, [r8]
	mov [rsp+8*166], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*166]
	call    address
	mov [rsp+8*167], rax
	mov r8, [rsp+8*165]
	mov r9, [rsp+8*167]
	mov qword [r9], r8
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*8]
	cmp r8, r9
	mov qword [rsp+8*168], 0
	sete [rsp+8*168]
	mov r8, [rsp+8*168]
	cmp r8, 0
	jne L_261
	mov qword [rsp+8*169] ,0
	jmp L_262
	
L_261:
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*10]
	cmp r8, r9
	mov qword [rsp+8*170], 0
	sete [rsp+8*170]
	mov r8, [rsp+8*170]
	mov qword [rsp+8*169] ,r8
	
L_262:
	mov r8, [rsp+8*169]
	cmp r8, 0
	je L_264
	mov qword [rsp+8*14] ,1
	
L_264:
	
L_260:
	
L_258:
	mov r8, [rsp+8*17]
	mov qword [rsp+8*171] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*171]
	call    address
	mov [rsp+8*172], rax
	mov r8, [rsp+8*172]
	mov r8, [r8]
	mov [rsp+8*173], r8
	mov r8, [rsp+8*173]
	sub r8, 2
	mov qword [rsp+8*174],r8 
	mov r8, [rsp+8*174]
	mov qword [rsp+8*11] ,r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*175] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*175]
	call    address
	mov [rsp+8*176], rax
	mov r8, [rsp+8*176]
	mov r8, [r8]
	mov [rsp+8*177], r8
	mov r8, [rsp+8*177]
	sub r8, 1
	mov qword [rsp+8*178],r8 
	mov r8, [rsp+8*178]
	mov qword [rsp+8*12] ,r8
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*11]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*179] , rax
	mov r8, [rsp+8*179]
	cmp r8, 0
	jne L_265
	mov qword [rsp+8*180] ,0
	jmp L_266
	
L_265:
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*12]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*181] , rax
	mov r8, [rsp+8*181]
	mov qword [rsp+8*180] ,r8
	
L_266:
	mov r8, [rsp+8*180]
	cmp r8, 0
	je L_268
	mov r8, [rsp+8*33]
	mov qword [rsp+8*182] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*182]
	call    address
	mov [rsp+8*183], rax
	mov r8, [rsp+8*183]
	mov r8, [r8]
	mov [rsp+8*182], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*182]
	call    address
	mov [rsp+8*183], rax
	mov r8, [rsp+8*183]
	mov r8, [r8]
	mov [rsp+8*184], r8
	mov r8, 1
	neg r8
	mov [rsp+8*185], r8
	mov r8, [rsp+8*184]
	mov r9, [rsp+8*185]
	cmp r8, r9
	mov qword [rsp+8*186], 0
	sete [rsp+8*186]
	mov r8, [rsp+8*186]
	cmp r8, 0
	je L_270
	mov r8, [rsp+8*4]
	add r8, 1
	mov qword [rsp+8*187],r8 
	mov r8, [rsp+8*187]
	mov qword [rsp+8*4] ,r8
	mov r8, [rsp+8*17]
	mov qword [rsp+8*188] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*188]
	call    address
	mov [rsp+8*189], rax
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*189]
	mov qword [r9], r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*190] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*190]
	call    address
	mov [rsp+8*191], rax
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*191]
	mov qword [r9], r8
	mov r8, [rsp+8*13]
	add r8, 1
	mov qword [rsp+8*192],r8 
	mov r8, [rsp+8*33]
	mov qword [rsp+8*193] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*193]
	call    address
	mov [rsp+8*194], rax
	mov r8, [rsp+8*194]
	mov r8, [r8]
	mov [rsp+8*193], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*193]
	call    address
	mov [rsp+8*194], rax
	mov r8, [rsp+8*192]
	mov r9, [rsp+8*194]
	mov qword [r9], r8
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*8]
	cmp r8, r9
	mov qword [rsp+8*195], 0
	sete [rsp+8*195]
	mov r8, [rsp+8*195]
	cmp r8, 0
	jne L_271
	mov qword [rsp+8*196] ,0
	jmp L_272
	
L_271:
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*10]
	cmp r8, r9
	mov qword [rsp+8*197], 0
	sete [rsp+8*197]
	mov r8, [rsp+8*197]
	mov qword [rsp+8*196] ,r8
	
L_272:
	mov r8, [rsp+8*196]
	cmp r8, 0
	je L_274
	mov qword [rsp+8*14] ,1
	
L_274:
	
L_270:
	
L_268:
	mov r8, [rsp+8*17]
	mov qword [rsp+8*198] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*198]
	call    address
	mov [rsp+8*199], rax
	mov r8, [rsp+8*199]
	mov r8, [r8]
	mov [rsp+8*200], r8
	mov r8, [rsp+8*200]
	sub r8, 2
	mov qword [rsp+8*201],r8 
	mov r8, [rsp+8*201]
	mov qword [rsp+8*11] ,r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*202] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*202]
	call    address
	mov [rsp+8*203], rax
	mov r8, [rsp+8*203]
	mov r8, [r8]
	mov [rsp+8*204], r8
	mov r8, [rsp+8*204]
	add r8, 1
	mov qword [rsp+8*205],r8 
	mov r8, [rsp+8*205]
	mov qword [rsp+8*12] ,r8
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*11]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*206] , rax
	mov r8, [rsp+8*206]
	cmp r8, 0
	jne L_275
	mov qword [rsp+8*207] ,0
	jmp L_276
	
L_275:
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*12]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*208] , rax
	mov r8, [rsp+8*208]
	mov qword [rsp+8*207] ,r8
	
L_276:
	mov r8, [rsp+8*207]
	cmp r8, 0
	je L_278
	mov r8, [rsp+8*33]
	mov qword [rsp+8*209] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*209]
	call    address
	mov [rsp+8*210], rax
	mov r8, [rsp+8*210]
	mov r8, [r8]
	mov [rsp+8*209], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*209]
	call    address
	mov [rsp+8*210], rax
	mov r8, [rsp+8*210]
	mov r8, [r8]
	mov [rsp+8*211], r8
	mov r8, 1
	neg r8
	mov [rsp+8*212], r8
	mov r8, [rsp+8*211]
	mov r9, [rsp+8*212]
	cmp r8, r9
	mov qword [rsp+8*213], 0
	sete [rsp+8*213]
	mov r8, [rsp+8*213]
	cmp r8, 0
	je L_280
	mov r8, [rsp+8*4]
	add r8, 1
	mov qword [rsp+8*214],r8 
	mov r8, [rsp+8*214]
	mov qword [rsp+8*4] ,r8
	mov r8, [rsp+8*17]
	mov qword [rsp+8*215] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*215]
	call    address
	mov [rsp+8*216], rax
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*216]
	mov qword [r9], r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*217] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*217]
	call    address
	mov [rsp+8*218], rax
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*218]
	mov qword [r9], r8
	mov r8, [rsp+8*13]
	add r8, 1
	mov qword [rsp+8*219],r8 
	mov r8, [rsp+8*33]
	mov qword [rsp+8*220] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*220]
	call    address
	mov [rsp+8*221], rax
	mov r8, [rsp+8*221]
	mov r8, [r8]
	mov [rsp+8*220], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*220]
	call    address
	mov [rsp+8*221], rax
	mov r8, [rsp+8*219]
	mov r9, [rsp+8*221]
	mov qword [r9], r8
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*8]
	cmp r8, r9
	mov qword [rsp+8*222], 0
	sete [rsp+8*222]
	mov r8, [rsp+8*222]
	cmp r8, 0
	jne L_281
	mov qword [rsp+8*223] ,0
	jmp L_282
	
L_281:
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*10]
	cmp r8, r9
	mov qword [rsp+8*224], 0
	sete [rsp+8*224]
	mov r8, [rsp+8*224]
	mov qword [rsp+8*223] ,r8
	
L_282:
	mov r8, [rsp+8*223]
	cmp r8, 0
	je L_284
	mov qword [rsp+8*14] ,1
	
L_284:
	
L_280:
	
L_278:
	mov r8, [rsp+8*17]
	mov qword [rsp+8*225] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*225]
	call    address
	mov [rsp+8*226], rax
	mov r8, [rsp+8*226]
	mov r8, [r8]
	mov [rsp+8*227], r8
	mov r8, [rsp+8*227]
	add r8, 2
	mov qword [rsp+8*228],r8 
	mov r8, [rsp+8*228]
	mov qword [rsp+8*11] ,r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*229] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*229]
	call    address
	mov [rsp+8*230], rax
	mov r8, [rsp+8*230]
	mov r8, [r8]
	mov [rsp+8*231], r8
	mov r8, [rsp+8*231]
	sub r8, 1
	mov qword [rsp+8*232],r8 
	mov r8, [rsp+8*232]
	mov qword [rsp+8*12] ,r8
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*11]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*233] , rax
	mov r8, [rsp+8*233]
	cmp r8, 0
	jne L_285
	mov qword [rsp+8*234] ,0
	jmp L_286
	
L_285:
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*12]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*235] , rax
	mov r8, [rsp+8*235]
	mov qword [rsp+8*234] ,r8
	
L_286:
	mov r8, [rsp+8*234]
	cmp r8, 0
	je L_288
	mov r8, [rsp+8*33]
	mov qword [rsp+8*236] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*236]
	call    address
	mov [rsp+8*237], rax
	mov r8, [rsp+8*237]
	mov r8, [r8]
	mov [rsp+8*236], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*236]
	call    address
	mov [rsp+8*237], rax
	mov r8, [rsp+8*237]
	mov r8, [r8]
	mov [rsp+8*238], r8
	mov r8, 1
	neg r8
	mov [rsp+8*239], r8
	mov r8, [rsp+8*238]
	mov r9, [rsp+8*239]
	cmp r8, r9
	mov qword [rsp+8*240], 0
	sete [rsp+8*240]
	mov r8, [rsp+8*240]
	cmp r8, 0
	je L_290
	mov r8, [rsp+8*4]
	add r8, 1
	mov qword [rsp+8*241],r8 
	mov r8, [rsp+8*241]
	mov qword [rsp+8*4] ,r8
	mov r8, [rsp+8*17]
	mov qword [rsp+8*242] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*242]
	call    address
	mov [rsp+8*243], rax
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*243]
	mov qword [r9], r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*244] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*244]
	call    address
	mov [rsp+8*245], rax
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*245]
	mov qword [r9], r8
	mov r8, [rsp+8*13]
	add r8, 1
	mov qword [rsp+8*246],r8 
	mov r8, [rsp+8*33]
	mov qword [rsp+8*247] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*247]
	call    address
	mov [rsp+8*248], rax
	mov r8, [rsp+8*248]
	mov r8, [r8]
	mov [rsp+8*247], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*247]
	call    address
	mov [rsp+8*248], rax
	mov r8, [rsp+8*246]
	mov r9, [rsp+8*248]
	mov qword [r9], r8
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*8]
	cmp r8, r9
	mov qword [rsp+8*249], 0
	sete [rsp+8*249]
	mov r8, [rsp+8*249]
	cmp r8, 0
	jne L_291
	mov qword [rsp+8*250] ,0
	jmp L_292
	
L_291:
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*10]
	cmp r8, r9
	mov qword [rsp+8*251], 0
	sete [rsp+8*251]
	mov r8, [rsp+8*251]
	mov qword [rsp+8*250] ,r8
	
L_292:
	mov r8, [rsp+8*250]
	cmp r8, 0
	je L_294
	mov qword [rsp+8*14] ,1
	
L_294:
	
L_290:
	
L_288:
	mov r8, [rsp+8*17]
	mov qword [rsp+8*252] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*252]
	call    address
	mov [rsp+8*253], rax
	mov r8, [rsp+8*253]
	mov r8, [r8]
	mov [rsp+8*254], r8
	mov r8, [rsp+8*254]
	add r8, 2
	mov qword [rsp+8*255],r8 
	mov r8, [rsp+8*255]
	mov qword [rsp+8*11] ,r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*256] ,r8
	mov     rsi, [rsp+8*3]
	mov     rdi, [rsp+8*256]
	call    address
	mov [rsp+8*257], rax
	mov r8, [rsp+8*257]
	mov r8, [r8]
	mov [rsp+8*258], r8
	mov r8, [rsp+8*258]
	add r8, 1
	mov qword [rsp+8*259],r8 
	mov r8, [rsp+8*259]
	mov qword [rsp+8*12] ,r8
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*11]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*260] , rax
	mov r8, [rsp+8*260]
	cmp r8, 0
	jne L_295
	mov qword [rsp+8*261] ,0
	jmp L_296
	
L_295:
	mov r8, [rsp+8*2]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*12]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*262] , rax
	mov r8, [rsp+8*262]
	mov qword [rsp+8*261] ,r8
	
L_296:
	mov r8, [rsp+8*261]
	cmp r8, 0
	je L_298
	mov r8, [rsp+8*33]
	mov qword [rsp+8*263] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*263]
	call    address
	mov [rsp+8*264], rax
	mov r8, [rsp+8*264]
	mov r8, [r8]
	mov [rsp+8*263], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*263]
	call    address
	mov [rsp+8*264], rax
	mov r8, [rsp+8*264]
	mov r8, [r8]
	mov [rsp+8*265], r8
	mov r8, 1
	neg r8
	mov [rsp+8*266], r8
	mov r8, [rsp+8*265]
	mov r9, [rsp+8*266]
	cmp r8, r9
	mov qword [rsp+8*267], 0
	sete [rsp+8*267]
	mov r8, [rsp+8*267]
	cmp r8, 0
	je L_300
	mov r8, [rsp+8*4]
	add r8, 1
	mov qword [rsp+8*268],r8 
	mov r8, [rsp+8*268]
	mov qword [rsp+8*4] ,r8
	mov r8, [rsp+8*17]
	mov qword [rsp+8*269] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*269]
	call    address
	mov [rsp+8*270], rax
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*270]
	mov qword [r9], r8
	mov r8, [rsp+8*26]
	mov qword [rsp+8*271] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*271]
	call    address
	mov [rsp+8*272], rax
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*272]
	mov qword [r9], r8
	mov r8, [rsp+8*13]
	add r8, 1
	mov qword [rsp+8*273],r8 
	mov r8, [rsp+8*33]
	mov qword [rsp+8*274] ,r8
	mov     rsi, [rsp+8*11]
	mov     rdi, [rsp+8*274]
	call    address
	mov [rsp+8*275], rax
	mov r8, [rsp+8*275]
	mov r8, [r8]
	mov [rsp+8*274], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*274]
	call    address
	mov [rsp+8*275], rax
	mov r8, [rsp+8*273]
	mov r9, [rsp+8*275]
	mov qword [r9], r8
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*8]
	cmp r8, r9
	mov qword [rsp+8*276], 0
	sete [rsp+8*276]
	mov r8, [rsp+8*276]
	cmp r8, 0
	jne L_301
	mov qword [rsp+8*277] ,0
	jmp L_302
	
L_301:
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*10]
	cmp r8, r9
	mov qword [rsp+8*278], 0
	sete [rsp+8*278]
	mov r8, [rsp+8*278]
	mov qword [rsp+8*277] ,r8
	
L_302:
	mov r8, [rsp+8*277]
	cmp r8, 0
	je L_304
	mov qword [rsp+8*14] ,1
	
L_304:
	
L_300:
	
L_298:
	mov r8, [rsp+8*14]
	mov r9, 1
	cmp r8, r9
	mov qword [rsp+8*279], 0
	sete [rsp+8*279]
	mov r8, [rsp+8*279]
	cmp r8, 0
	je L_306
	jmp L_224
	
L_306:
	mov r8, [rsp+8*3]
	add r8, 1
	mov qword [rsp+8*280],r8 
	mov r8, [rsp+8*280]
	mov qword [rsp+8*3] ,r8
	jmp L_223
	
L_224:
	mov r8, [rsp+8*14]
	mov r9, 1
	cmp r8, r9
	mov qword [rsp+8*281], 0
	sete [rsp+8*281]
	mov r8, [rsp+8*281]
	cmp r8, 0
	je L_307
	mov r8, [rsp+8*33]
	mov qword [rsp+8*282] ,r8
	mov     rsi, [rsp+8*8]
	mov     rdi, [rsp+8*282]
	call    address
	mov [rsp+8*283], rax
	mov r8, [rsp+8*283]
	mov r8, [r8]
	mov [rsp+8*282], r8
	mov     rsi, [rsp+8*10]
	mov     rdi, [rsp+8*282]
	call    address
	mov [rsp+8*283], rax
	mov r8, [rsp+8*283]
	mov r8, [r8]
	mov [rsp+8*284], r8
	mov r8, [rsp+8*284]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*285] ,r8
	mov     rdi, [rsp+8*285]
	call    toString
	mov     qword[rsp+8*286], rax
	mov r8, [rsp+8*286]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*287] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*287] 
	add rsi, 1 
	xor rax, rax
	call printf
	jmp L_308
	
L_307:
	mov qword [arg+8*0] ,t405
	mov r8, [arg+8*0]
	mov qword [rsp+8*288] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*288] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_308:
	mov rax,0
	leave
	ret
	mov rax,0
	leave
	ret
	jmp QED
	
check:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2416
	mov r8, [arg+8*0]
	mov qword [rsp+8*289] ,r8
	mov r8, [arg+8*1]
	mov qword [rsp+8*290] ,r8
	mov r8, [rsp+8*289]
	mov r9, [rsp+8*290]
	cmp r8, r9
	mov qword [rsp+8*291], 0
	setl [rsp+8*291]
	mov r8, [rsp+8*291]
	cmp r8, 0
	jne L_209
	mov qword [rsp+8*292] ,0
	jmp L_210
	
L_209:
	mov r8, [rsp+8*289]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*293], 0
	setge [rsp+8*293]
	mov r8, [rsp+8*293]
	mov qword [rsp+8*292] ,r8
	
L_210:
	mov rax,[rsp+8*292]
	leave
	ret
	mov rax,0
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2416
	mov rax,[rsp+8*294]
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
	
t405:
	 db 12,"no solution!" ,0


