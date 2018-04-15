	 global    main
	 extern    puts
	 extern    printf
	 extern    scanf
	 extern    malloc
	 extern    strlen

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


main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 944
	call global_init
	mov [rsp+8*1] , rax
	mov qword [arg+8*0] ,106
	call origin
	mov [rsp+8*3] , rax
	mov qword [gbl+8*4] ,101
	mov r8, [gbl+8*4]
	sub r8, 1
	mov qword [rsp+8*5],r8 
	mov r8, [rsp+8*5]
	mov qword [gbl+8*6] ,r8
	mov r8, [gbl+8*6]
	mov qword [gbl+8*7] ,r8
	mov qword [gbl+8*8] ,0
	
L_447:
	mov r8, [gbl+8*8]
	mov r9, [gbl+8*4]
	cmp r8, r9
	mov qword [rsp+8*9], 0
	setl [rsp+8*9]
	mov r8, [rsp+8*9]
	cmp r8, 0
	je L_448
	mov qword [gbl+8*10] ,0
	
L_450:
	mov r8, [gbl+8*10]
	mov r9, [gbl+8*4]
	cmp r8, r9
	mov qword [rsp+8*11], 0
	setl [rsp+8*11]
	mov r8, [rsp+8*11]
	cmp r8, 0
	je L_451
	mov r8, 1
	neg r8
	mov [rsp+8*12], r8
	mov r8, [gbl+8*13]
	mov qword [rsp+8*14] ,r8
	mov     rsi, [gbl+8*8]
	mov     rdi, [rsp+8*14]
	call    address
	mov [rsp+8*15], rax
	mov r8, [rsp+8*15]
	mov r8, [r8]
	mov [rsp+8*14], r8
	mov     rsi, [gbl+8*10]
	mov     rdi, [rsp+8*14]
	call    address
	mov [rsp+8*15], rax
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*15]
	mov qword [r9], r8
	
L_452:
	mov r8, [gbl+8*10]
	add r8, 1
	mov qword [gbl+8*10],r8 
	mov r8, [gbl+8*10]
	sub r8, 1
	mov qword [rsp+8*16],r8 
	jmp L_450
	
L_451:
	
L_449:
	mov r8, [gbl+8*8]
	add r8, 1
	mov qword [gbl+8*8],r8 
	mov r8, [gbl+8*8]
	sub r8, 1
	mov qword [rsp+8*17],r8 
	jmp L_447
	
L_448:
	
L_453:
	mov r8, [gbl+8*18]
	mov r9, [gbl+8*19]
	cmp r8, r9
	mov qword [rsp+8*20], 0
	setle [rsp+8*20]
	mov r8, [rsp+8*20]
	cmp r8, 0
	je L_454
	mov r8, [gbl+8*21]
	mov qword [rsp+8*22] ,r8
	mov     rsi, [gbl+8*18]
	mov     rdi, [rsp+8*22]
	call    address
	mov [rsp+8*23], rax
	mov r8, [rsp+8*23]
	mov r8, [r8]
	mov [rsp+8*24], r8
	mov r8, [rsp+8*24]
	mov qword [gbl+8*25] ,r8
	mov r8, [gbl+8*26]
	mov qword [rsp+8*27] ,r8
	mov     rsi, [gbl+8*18]
	mov     rdi, [rsp+8*27]
	call    address
	mov [rsp+8*28], rax
	mov r8, [rsp+8*28]
	mov r8, [r8]
	mov [rsp+8*29], r8
	mov r8, [rsp+8*29]
	mov qword [gbl+8*30] ,r8
	mov r8, [gbl+8*13]
	mov qword [rsp+8*31] ,r8
	mov     rsi, [gbl+8*25]
	mov     rdi, [rsp+8*31]
	call    address
	mov [rsp+8*32], rax
	mov r8, [rsp+8*32]
	mov r8, [r8]
	mov [rsp+8*31], r8
	mov     rsi, [gbl+8*30]
	mov     rdi, [rsp+8*31]
	call    address
	mov [rsp+8*32], rax
	mov r8, [rsp+8*32]
	mov r8, [r8]
	mov [rsp+8*33], r8
	mov r8, [rsp+8*33]
	mov qword [gbl+8*34] ,r8
	mov r8, [gbl+8*25]
	sub r8, 1
	mov qword [rsp+8*35],r8 
	mov r8, [gbl+8*30]
	sub r8, 2
	mov qword [rsp+8*36],r8 
	mov r8, [rsp+8*36]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*35]
	mov qword [arg+8*0] ,r8
	call addList
	mov [rsp+8*38] , rax
	mov r8, [gbl+8*25]
	sub r8, 1
	mov qword [rsp+8*39],r8 
	mov r8, [gbl+8*30]
	add r8, 2
	mov qword [rsp+8*40],r8 
	mov r8, [rsp+8*40]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*39]
	mov qword [arg+8*0] ,r8
	call addList
	mov [rsp+8*41] , rax
	mov r8, [gbl+8*25]
	add r8, 1
	mov qword [rsp+8*42],r8 
	mov r8, [gbl+8*30]
	sub r8, 2
	mov qword [rsp+8*43],r8 
	mov r8, [rsp+8*43]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*42]
	mov qword [arg+8*0] ,r8
	call addList
	mov [rsp+8*44] , rax
	mov r8, [gbl+8*25]
	add r8, 1
	mov qword [rsp+8*45],r8 
	mov r8, [gbl+8*30]
	add r8, 2
	mov qword [rsp+8*46],r8 
	mov r8, [rsp+8*46]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*45]
	mov qword [arg+8*0] ,r8
	call addList
	mov [rsp+8*47] , rax
	mov r8, [gbl+8*25]
	sub r8, 2
	mov qword [rsp+8*48],r8 
	mov r8, [gbl+8*30]
	sub r8, 1
	mov qword [rsp+8*49],r8 
	mov r8, [rsp+8*49]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*48]
	mov qword [arg+8*0] ,r8
	call addList
	mov [rsp+8*50] , rax
	mov r8, [gbl+8*25]
	sub r8, 2
	mov qword [rsp+8*51],r8 
	mov r8, [gbl+8*30]
	add r8, 1
	mov qword [rsp+8*52],r8 
	mov r8, [rsp+8*52]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*51]
	mov qword [arg+8*0] ,r8
	call addList
	mov [rsp+8*53] , rax
	mov r8, [gbl+8*25]
	add r8, 2
	mov qword [rsp+8*54],r8 
	mov r8, [gbl+8*30]
	sub r8, 1
	mov qword [rsp+8*55],r8 
	mov r8, [rsp+8*55]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*54]
	mov qword [arg+8*0] ,r8
	call addList
	mov [rsp+8*56] , rax
	mov r8, [gbl+8*25]
	add r8, 2
	mov qword [rsp+8*57],r8 
	mov r8, [gbl+8*30]
	add r8, 1
	mov qword [rsp+8*58],r8 
	mov r8, [rsp+8*58]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*57]
	mov qword [arg+8*0] ,r8
	call addList
	mov [rsp+8*59] , rax
	mov r8, [gbl+8*60]
	mov r9, 1
	cmp r8, r9
	mov qword [rsp+8*61], 0
	sete [rsp+8*61]
	mov r8, [rsp+8*61]
	cmp r8, 0
	je L_456
	jmp L_454
	
L_456:
	mov r8, [gbl+8*18]
	add r8, 1
	mov qword [rsp+8*62],r8 
	mov r8, [rsp+8*62]
	mov qword [gbl+8*18] ,r8
	jmp L_453
	
L_454:
	mov r8, [gbl+8*60]
	mov r9, 1
	cmp r8, r9
	mov qword [rsp+8*63], 0
	sete [rsp+8*63]
	mov r8, [rsp+8*63]
	cmp r8, 0
	je L_457
	mov r8, [gbl+8*13]
	mov qword [rsp+8*64] ,r8
	mov     rsi, [gbl+8*7]
	mov     rdi, [rsp+8*64]
	call    address
	mov [rsp+8*65], rax
	mov r8, [rsp+8*65]
	mov r8, [r8]
	mov [rsp+8*64], r8
	mov     rsi, [gbl+8*6]
	mov     rdi, [rsp+8*64]
	call    address
	mov [rsp+8*65], rax
	mov r8, [rsp+8*65]
	mov r8, [r8]
	mov [rsp+8*66], r8
	mov r8, [rsp+8*66]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*67] ,r8
	mov     rdi, [rsp+8*67]
	call    toString
	mov     qword[rsp+8*68], rax
	mov r8, [rsp+8*68]
	mov qword [arg+8*0] ,r8
	mov r8, [arg+8*0]
	mov qword [rsp+8*69] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*69] 
	add rsi, 1 
	xor rax, rax
	call printf
	jmp L_458
	
L_457:
	mov qword [arg+8*0] ,t169
	mov r8, [arg+8*0]
	mov qword [rsp+8*70] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*70] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_458:
	mov rax,0
	leave
	ret
	mov rax,0
	leave
	ret
	jmp QED
	
origin:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 944
	mov r8, [arg+8*0]
	mov qword [rsp+8*71] ,r8
	mov     rdi, [rsp+8*71]
	call    mallocArray
	mov     qword [rsp+8*72], rax
	mov r8, [rsp+8*72]
	mov qword [gbl+8*13] ,r8
	mov qword [gbl+8*8] ,0
	
L_429:
	mov r8, [gbl+8*8]
	mov r9, [rsp+8*71]
	cmp r8, r9
	mov qword [rsp+8*73], 0
	setl [rsp+8*73]
	mov r8, [rsp+8*73]
	cmp r8, 0
	je L_430
	mov     rdi, [rsp+8*71]
	call    mallocArray
	mov     qword [rsp+8*74], rax
	mov r8, [gbl+8*13]
	mov qword [rsp+8*75] ,r8
	mov     rsi, [gbl+8*8]
	mov     rdi, [rsp+8*75]
	call    address
	mov [rsp+8*76], rax
	mov r8, [rsp+8*74]
	mov r9, [rsp+8*76]
	mov qword [r9], r8
	mov qword [gbl+8*10] ,0
	
L_432:
	mov r8, [gbl+8*10]
	mov r9, [rsp+8*71]
	cmp r8, r9
	mov qword [rsp+8*77], 0
	setl [rsp+8*77]
	mov r8, [rsp+8*77]
	cmp r8, 0
	je L_433
	mov r8, [gbl+8*13]
	mov qword [rsp+8*78] ,r8
	mov     rsi, [gbl+8*8]
	mov     rdi, [rsp+8*78]
	call    address
	mov [rsp+8*79], rax
	mov r8, [rsp+8*79]
	mov r8, [r8]
	mov [rsp+8*78], r8
	mov     rsi, [gbl+8*10]
	mov     rdi, [rsp+8*78]
	call    address
	mov [rsp+8*79], rax
	mov r8, 0
	mov r9, [rsp+8*79]
	mov qword [r9], r8
	
L_434:
	mov r8, [gbl+8*10]
	add r8, 1
	mov qword [gbl+8*10],r8 
	mov r8, [gbl+8*10]
	sub r8, 1
	mov qword [rsp+8*80],r8 
	jmp L_432
	
L_433:
	
L_431:
	mov r8, [gbl+8*8]
	add r8, 1
	mov qword [gbl+8*8],r8 
	mov r8, [gbl+8*8]
	sub r8, 1
	mov qword [rsp+8*81],r8 
	jmp L_429
	
L_430:
	mov rax,0
	leave
	ret
	
check:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 944
	mov r8, [arg+8*0]
	mov qword [rsp+8*82] ,r8
	mov r8, [arg+8*1]
	mov qword [rsp+8*83] ,r8
	mov r8, [rsp+8*82]
	mov r9, [rsp+8*83]
	cmp r8, r9
	mov qword [rsp+8*84], 0
	setl [rsp+8*84]
	mov r8, [rsp+8*84]
	cmp r8, 0
	jne L_435
	mov qword [rsp+8*85] ,0
	jmp L_436
	
L_435:
	mov r8, [rsp+8*82]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*86], 0
	setge [rsp+8*86]
	mov r8, [rsp+8*86]
	mov qword [rsp+8*85] ,r8
	
L_436:
	mov rax,[rsp+8*85]
	leave
	ret
	mov rax,0
	leave
	ret
	
addList:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 944
	mov r8, [arg+8*0]
	mov qword [rsp+8*87] ,r8
	mov r8, [arg+8*1]
	mov qword [rsp+8*88] ,r8
	mov r8, [gbl+8*4]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*87]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*89] , rax
	mov r8, [rsp+8*89]
	cmp r8, 0
	jne L_437
	mov qword [rsp+8*90] ,0
	jmp L_438
	
L_437:
	mov r8, [gbl+8*4]
	mov qword [arg+8*1] ,r8
	mov r8, [rsp+8*88]
	mov qword [arg+8*0] ,r8
	call check
	mov [rsp+8*91] , rax
	mov r8, [rsp+8*91]
	mov qword [rsp+8*90] ,r8
	
L_438:
	mov r8, [rsp+8*90]
	cmp r8, 0
	je L_440
	mov r8, [gbl+8*13]
	mov qword [rsp+8*92] ,r8
	mov     rsi, [rsp+8*87]
	mov     rdi, [rsp+8*92]
	call    address
	mov [rsp+8*93], rax
	mov r8, [rsp+8*93]
	mov r8, [r8]
	mov [rsp+8*92], r8
	mov     rsi, [rsp+8*88]
	mov     rdi, [rsp+8*92]
	call    address
	mov [rsp+8*93], rax
	mov r8, [rsp+8*93]
	mov r8, [r8]
	mov [rsp+8*94], r8
	mov r8, 1
	neg r8
	mov [rsp+8*95], r8
	mov r8, [rsp+8*94]
	mov r9, [rsp+8*95]
	cmp r8, r9
	mov qword [rsp+8*96], 0
	sete [rsp+8*96]
	mov r8, [rsp+8*96]
	cmp r8, 0
	je L_442
	mov r8, [gbl+8*19]
	add r8, 1
	mov qword [rsp+8*97],r8 
	mov r8, [rsp+8*97]
	mov qword [gbl+8*19] ,r8
	mov r8, [gbl+8*21]
	mov qword [rsp+8*98] ,r8
	mov     rsi, [gbl+8*19]
	mov     rdi, [rsp+8*98]
	call    address
	mov [rsp+8*99], rax
	mov r8, [rsp+8*87]
	mov r9, [rsp+8*99]
	mov qword [r9], r8
	mov r8, [gbl+8*26]
	mov qword [rsp+8*100] ,r8
	mov     rsi, [gbl+8*19]
	mov     rdi, [rsp+8*100]
	call    address
	mov [rsp+8*101], rax
	mov r8, [rsp+8*88]
	mov r9, [rsp+8*101]
	mov qword [r9], r8
	mov r8, [gbl+8*34]
	add r8, 1
	mov qword [rsp+8*102],r8 
	mov r8, [gbl+8*13]
	mov qword [rsp+8*103] ,r8
	mov     rsi, [rsp+8*87]
	mov     rdi, [rsp+8*103]
	call    address
	mov [rsp+8*104], rax
	mov r8, [rsp+8*104]
	mov r8, [r8]
	mov [rsp+8*103], r8
	mov     rsi, [rsp+8*88]
	mov     rdi, [rsp+8*103]
	call    address
	mov [rsp+8*104], rax
	mov r8, [rsp+8*102]
	mov r9, [rsp+8*104]
	mov qword [r9], r8
	mov r8, [rsp+8*87]
	mov r9, [gbl+8*7]
	cmp r8, r9
	mov qword [rsp+8*105], 0
	sete [rsp+8*105]
	mov r8, [rsp+8*105]
	cmp r8, 0
	jne L_443
	mov qword [rsp+8*106] ,0
	jmp L_444
	
L_443:
	mov r8, [rsp+8*88]
	mov r9, [gbl+8*6]
	cmp r8, r9
	mov qword [rsp+8*107], 0
	sete [rsp+8*107]
	mov r8, [rsp+8*107]
	mov qword [rsp+8*106] ,r8
	
L_444:
	mov r8, [rsp+8*106]
	cmp r8, 0
	je L_446
	mov qword [gbl+8*60] ,1
	
L_446:
	
L_442:
	
L_440:
	mov rax,0
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 944
	mov     rdi, 12000
	call    mallocArray
	mov     qword [gbl+8*108], rax
	mov r8, [gbl+8*108]
	mov qword [gbl+8*21] ,r8
	mov     rdi, 12000
	call    mallocArray
	mov     qword [gbl+8*109], rax
	mov r8, [gbl+8*109]
	mov qword [gbl+8*26] ,r8
	mov rax,[rsp+8*110]
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   2928
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
	
t169:
	 db 12,"no solution!" ,0


