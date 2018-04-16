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
        mov     rax, qword [rbp-28H]
        mov     qword [rbp-10H], rax
        mov     qword [rbp-8H], 1
        jmp     mAd_006

mAd_005:  mov     rax, qword [rbp-8H]
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
mAd_006:  mov     rax, qword [rbp-8H]
        cmp     rax, qword [rbp-18H]
        jl      mAd_005
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
        leave
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
	sub    rsp, 576
	call global_init
	mov [rsp+8*1] , rax
	mov qword [rsp+8*2] ,233
	mov r8, [rsp+8*2]
	sub r8, 1
	mov qword [rsp+8*3],r8 
	mov r8, [rsp+8*3]
	mov qword [rsp+8*4] ,r8
	mov qword [rsp+8*5] ,1
	mov     rdi, [rsp+8*4]
	call    mallocArray
	mov     qword [rsp+8*6], rax
	mov r8, [rsp+8*6]
	mov qword [rsp+8*7] ,r8
	mov qword [rsp+8*8] ,1
	
L_54:
	mov qword [rsp+8*9] ,1
	mov qword [rsp+8*10] ,0
	
L_57:
	mov r8, [rsp+8*10]
	mov r9, [rsp+8*4]
	cmp r8, r9
	mov qword [rsp+8*11], 0
	setl [rsp+8*11]
	mov r8, [rsp+8*11]
	cmp r8, 0
	je L_58
	mov r8, [rsp+8*7]
	mov qword [rsp+8*12] ,r8
	mov     rsi, [rsp+8*10]
	mov     rdi, [rsp+8*12]
	call    address
	mov [rsp+8*13], rax
	mov r8, [rsp+8*5]
	mov r9, [rsp+8*13]
	mov qword [r9], r8
	mov r8, [rsp+8*5]
	imul r8, [rsp+8*8]
	mov qword [rsp+8*14],r8 
	xor rdx, rdx
	mov rax, [rsp+8*14]
	mov rbx, [rsp+8*2]
	cdq
	idiv rbx
	mov [rsp+8*15], rdx
	mov r8, [rsp+8*15]
	mov qword [rsp+8*5] ,r8
	mov qword [rsp+8*16] ,0
	
L_60:
	mov r8, [rsp+8*16]
	mov r9, [rsp+8*10]
	cmp r8, r9
	mov qword [rsp+8*17], 0
	setl [rsp+8*17]
	mov r8, [rsp+8*17]
	cmp r8, 0
	je L_61
	mov r8, [rsp+8*7]
	mov qword [rsp+8*18] ,r8
	mov     rsi, [rsp+8*10]
	mov     rdi, [rsp+8*18]
	call    address
	mov [rsp+8*19], rax
	mov r8, [rsp+8*19]
	mov r8, [r8]
	mov [rsp+8*20], r8
	mov r8, [rsp+8*7]
	mov qword [rsp+8*21] ,r8
	mov     rsi, [rsp+8*16]
	mov     rdi, [rsp+8*21]
	call    address
	mov [rsp+8*22], rax
	mov r8, [rsp+8*22]
	mov r8, [r8]
	mov [rsp+8*23], r8
	mov r8, [rsp+8*20]
	mov r9, [rsp+8*23]
	cmp r8, r9
	mov qword [rsp+8*24], 0
	sete [rsp+8*24]
	mov r8, [rsp+8*24]
	cmp r8, 0
	je L_64
	mov qword [rsp+8*9] ,0
	jmp L_61
	
L_64:
	
L_62:
	mov r8, [rsp+8*16]
	add r8, 1
	mov qword [rsp+8*16],r8 
	mov r8, [rsp+8*16]
	sub r8, 1
	mov qword [rsp+8*25],r8 
	jmp L_60
	
L_61:
	
L_59:
	mov r8, [rsp+8*10]
	add r8, 1
	mov qword [rsp+8*10],r8 
	mov r8, [rsp+8*10]
	sub r8, 1
	mov qword [rsp+8*26],r8 
	jmp L_57
	
L_58:
	mov r8, [rsp+8*27]
	add r8, [rsp+8*27]
	mov qword [rsp+8*27],r8 
	mov r8, [rsp+8*9]
	cmp r8, 0
	je L_66
	jmp L_55
	
L_66:
	
L_56:
	mov r8, [rsp+8*8]
	add r8, 1
	mov qword [rsp+8*8],r8 
	mov r8, [rsp+8*8]
	sub r8, 1
	mov qword [rsp+8*28],r8 
	jmp L_54
	
L_55:
	mov qword [rsp+8*10] ,0
	
L_67:
	mov r8, [rsp+8*10]
	mov r9, [rsp+8*4]
	cmp r8, r9
	mov qword [rsp+8*29], 0
	setl [rsp+8*29]
	mov r8, [rsp+8*29]
	cmp r8, 0
	je L_68
	mov qword [rsp+8*16] ,0
	
L_70:
	mov r8, [rsp+8*16]
	add r8, 1
	mov qword [rsp+8*30],r8 
	mov r8, [rsp+8*30]
	mov r9, [rsp+8*4]
	cmp r8, r9
	mov qword [rsp+8*31], 0
	setl [rsp+8*31]
	mov r8, [rsp+8*31]
	cmp r8, 0
	je L_71
	mov r8, [rsp+8*7]
	mov qword [rsp+8*32] ,r8
	mov     rsi, [rsp+8*16]
	mov     rdi, [rsp+8*32]
	call    address
	mov [rsp+8*33], rax
	mov r8, [rsp+8*33]
	mov r8, [r8]
	mov [rsp+8*34], r8
	mov r8, [rsp+8*16]
	add r8, 1
	mov qword [rsp+8*35],r8 
	mov r8, [rsp+8*7]
	mov qword [rsp+8*36] ,r8
	mov     rsi, [rsp+8*35]
	mov     rdi, [rsp+8*36]
	call    address
	mov [rsp+8*37], rax
	mov r8, [rsp+8*37]
	mov r8, [r8]
	mov [rsp+8*38], r8
	mov r8, [rsp+8*34]
	mov r9, [rsp+8*38]
	cmp r8, r9
	mov qword [rsp+8*39], 0
	setg [rsp+8*39]
	mov r8, [rsp+8*39]
	cmp r8, 0
	je L_74
	mov r8, [rsp+8*7]
	mov qword [rsp+8*40] ,r8
	mov     rsi, [rsp+8*16]
	mov     rdi, [rsp+8*40]
	call    address
	mov [rsp+8*41], rax
	mov r8, [rsp+8*41]
	mov r8, [r8]
	mov [rsp+8*42], r8
	mov r8, [rsp+8*42]
	mov qword [rsp+8*43] ,r8
	mov r8, [rsp+8*16]
	add r8, 1
	mov qword [rsp+8*44],r8 
	mov r8, [rsp+8*7]
	mov qword [rsp+8*45] ,r8
	mov     rsi, [rsp+8*44]
	mov     rdi, [rsp+8*45]
	call    address
	mov [rsp+8*46], rax
	mov r8, [rsp+8*46]
	mov r8, [r8]
	mov [rsp+8*47], r8
	mov r8, [rsp+8*7]
	mov qword [rsp+8*48] ,r8
	mov     rsi, [rsp+8*16]
	mov     rdi, [rsp+8*48]
	call    address
	mov [rsp+8*49], rax
	mov r8, [rsp+8*47]
	mov r9, [rsp+8*49]
	mov qword [r9], r8
	mov r8, [rsp+8*16]
	add r8, 1
	mov qword [rsp+8*50],r8 
	mov r8, [rsp+8*7]
	mov qword [rsp+8*51] ,r8
	mov     rsi, [rsp+8*50]
	mov     rdi, [rsp+8*51]
	call    address
	mov [rsp+8*52], rax
	mov r8, [rsp+8*43]
	mov r9, [rsp+8*52]
	mov qword [r9], r8
	
L_74:
	
L_72:
	mov r8, [rsp+8*16]
	add r8, 1
	mov qword [rsp+8*16],r8 
	mov r8, [rsp+8*16]
	sub r8, 1
	mov qword [rsp+8*53],r8 
	jmp L_70
	
L_71:
	
L_69:
	mov r8, [rsp+8*10]
	add r8, 1
	mov qword [rsp+8*10],r8 
	mov r8, [rsp+8*10]
	sub r8, 1
	mov qword [rsp+8*54],r8 
	jmp L_67
	
L_68:
	mov qword [rsp+8*10] ,0
	
L_75:
	mov r8, [rsp+8*10]
	mov r9, [rsp+8*4]
	cmp r8, r9
	mov qword [rsp+8*55], 0
	setl [rsp+8*55]
	mov r8, [rsp+8*55]
	cmp r8, 0
	je L_76
	mov r8, [rsp+8*7]
	mov qword [rsp+8*56] ,r8
	mov     rsi, [rsp+8*10]
	mov     rdi, [rsp+8*56]
	call    address
	mov [rsp+8*57], rax
	mov r8, [rsp+8*57]
	mov r8, [r8]
	mov [rsp+8*58], r8
	mov r8, [rsp+8*58]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*60] ,r8
	mov     rdi, [rsp+8*60]
	call    toString
	mov     qword[rsp+8*61], rax
	mov r8, [rsp+8*61]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*62] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*62] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_77:
	mov r8, [rsp+8*10]
	add r8, 1
	mov qword [rsp+8*10],r8 
	mov r8, [rsp+8*10]
	sub r8, 1
	mov qword [rsp+8*63],r8 
	jmp L_75
	
L_76:
	mov rax,0
	leave
	ret
	mov rax,0
	leave
	ret
	jmp QED
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 576
	mov rax,[rsp+8*64]
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   2560
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
	

