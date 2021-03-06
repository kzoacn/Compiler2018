	 global    main
	 extern    puts
	 extern    printf
	 extern    scanf
	 extern    malloc

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
        movsx   edx, al
        mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        movsx   eax, al
        add     eax, edx
        add     eax, 1
        cdqe
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-18H], rax
        mov     rax, qword [rbp-28H]
        movzx   eax, byte [rax]
        mov     edx, eax
        mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        add     eax, edx
        mov     edx, eax
        mov     rax, qword [rbp-18H]
        mov     byte [rax], dl
        mov     qword [rbp-8H], 0
        mov     qword [rbp-10H], 0
        mov     qword [rbp-8H], 0
        jmp     cat_02

cat_01:  add     qword [rbp-10H], 1
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
cat_02:  mov     rax, qword [rbp-28H]
        movzx   eax, byte [rax]
        movsx   rax, al
        cmp     rax, qword [rbp-8H]
        jg      cat_01
        mov     qword [rbp-8H], 0
        jmp     cat_04

cat_03:  add     qword [rbp-10H], 1
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
cat_04:  mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        movsx   rax, al
        cmp     rax, qword [rbp-8H]
        jg      cat_03
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

main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 312
	call global_init
	mov [rsp+8*1] , rax
	mov     rdi, 5
	call    mallocArray
	mov     qword [rsp+8*2], rax
	mov r8, [rsp+8*2]
	mov qword [rsp+8*3] ,r8
	mov qword [rsp+8*4] ,0
	
L_0:
	mov r8, [rsp+8*4]
	mov r9, 5
	cmp r8, r9
	mov qword [rsp+8*5], 0
	setl [rsp+8*5]
	mov r8, [rsp+8*5]
	cmp r8, 0
	je L_1
	mov     rdi, 3
	call    mallocArray
	mov     qword [rsp+8*6], rax
	mov r8, [rsp+8*3]
	mov qword [rsp+8*7] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*7]
	call    address
	mov [rsp+8*8], rax
	mov r8, [rsp+8*6]
	mov r9, [rsp+8*8]
	mov qword [r9], r8
	mov qword [rsp+8*9] ,0
	
L_3:
	mov r8, [rsp+8*9]
	mov r9, 3
	cmp r8, r9
	mov qword [rsp+8*10], 0
	setl [rsp+8*10]
	mov r8, [rsp+8*10]
	cmp r8, 0
	je L_4
	mov     rdi, 2
	call    mallocArray
	mov     qword [rsp+8*11], rax
	mov r8, [rsp+8*3]
	mov qword [rsp+8*12] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*12]
	call    address
	mov [rsp+8*13], rax
	mov r8, [rsp+8*13]
	mov r8, [r8]
	mov [rsp+8*12], r8
	mov     rsi, [rsp+8*9]
	mov     rdi, [rsp+8*12]
	call    address
	mov [rsp+8*13], rax
	mov r8, [rsp+8*11]
	mov r9, [rsp+8*13]
	mov qword [r9], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*14] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*14]
	call    address
	mov [rsp+8*15], rax
	mov r8, [rsp+8*15]
	mov r8, [r8]
	mov [rsp+8*14], r8
	mov     rsi, [rsp+8*9]
	mov     rdi, [rsp+8*14]
	call    address
	mov [rsp+8*15], rax
	mov r8, [rsp+8*15]
	mov r8, [r8]
	mov [rsp+8*14], r8
	mov     rsi, 0
	mov     rdi, [rsp+8*14]
	call    address
	mov [rsp+8*15], rax
	mov r8, 1
	mov r9, [rsp+8*15]
	mov qword [r9], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*16] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*16]
	call    address
	mov [rsp+8*17], rax
	mov r8, [rsp+8*17]
	mov r8, [r8]
	mov [rsp+8*16], r8
	mov     rsi, [rsp+8*9]
	mov     rdi, [rsp+8*16]
	call    address
	mov [rsp+8*17], rax
	mov r8, [rsp+8*17]
	mov r8, [r8]
	mov [rsp+8*16], r8
	mov     rsi, 1
	mov     rdi, [rsp+8*16]
	call    address
	mov [rsp+8*17], rax
	mov r8, 2
	mov r9, [rsp+8*17]
	mov qword [r9], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*18] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*18]
	call    address
	mov [rsp+8*19], rax
	mov r8, [rsp+8*19]
	mov r8, [r8]
	mov [rsp+8*18], r8
	mov     rsi, [rsp+8*9]
	mov     rdi, [rsp+8*18]
	call    address
	mov [rsp+8*19], rax
	mov r8, [rsp+8*19]
	mov r8, [r8]
	mov [rsp+8*18], r8
	mov     rsi, 0
	mov     rdi, [rsp+8*18]
	call    address
	mov [rsp+8*19], rax
	mov r8, [rsp+8*19]
	mov r8, [r8]
	mov [rsp+8*20], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*21] ,r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*21]
	call    address
	mov [rsp+8*22], rax
	mov r8, [rsp+8*22]
	mov r8, [r8]
	mov [rsp+8*21], r8
	mov     rsi, [rsp+8*9]
	mov     rdi, [rsp+8*21]
	call    address
	mov [rsp+8*22], rax
	mov r8, [rsp+8*22]
	mov r8, [r8]
	mov [rsp+8*21], r8
	mov     rsi, 1
	mov     rdi, [rsp+8*21]
	call    address
	mov [rsp+8*22], rax
	mov r8, [rsp+8*22]
	mov r8, [r8]
	mov [rsp+8*23], r8
	mov r8, [rsp+8*20]
	add r8, [rsp+8*23]
	mov qword [rsp+8*24],r8 
	mov r8, [rsp+8*24]
	mov qword [gbl+8*25] ,r8
	mov r8, [gbl+8*25]
	mov qword [rsp+8*26] ,r8
	mov     rdi, [rsp+8*26]
	call    toString
	mov     qword[rsp+8*27], rax
	mov r8, [rsp+8*27]
	mov qword [gbl+8*25] ,r8
	mov r8, [gbl+8*25]
	mov qword [rsp+8*28] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*28] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_5:
	mov r8, [rsp+8*9]
	add r8, 1
	mov qword [rsp+8*9],r8 
	mov r8, [rsp+8*9]
	sub r8, 1
	mov qword [rsp+8*29],r8 
	jmp L_3
	
L_4:
	
L_2:
	mov r8, [rsp+8*4]
	add r8, 1
	mov qword [rsp+8*4],r8 
	mov r8, [rsp+8*4]
	sub r8, 1
	mov qword [rsp+8*30],r8 
	jmp L_0
	
L_1:
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
	sub    rsp, 312
	mov rax,[rsp+8*31]
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   2296

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	

