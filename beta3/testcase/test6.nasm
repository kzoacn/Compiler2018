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

main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 456
	call global_init
	mov [rsp+8*1] , rax
	mov qword [rsp+8*2] ,12
	mov qword [rsp+8*3] ,7
	mov r8, [rsp+8*2]
	add r8, [rsp+8*3]
	mov qword [rsp+8*4],r8 
	mov r8, [rsp+8*4]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*6] ,r8
	mov     rdi, [rsp+8*6]
	call    toString
	mov     qword[rsp+8*7], rax
	mov r8, [rsp+8*7]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*8] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*8] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*2]
	sub r8, [rsp+8*3]
	mov qword [rsp+8*9],r8 
	mov r8, [rsp+8*9]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*10] ,r8
	mov     rdi, [rsp+8*10]
	call    toString
	mov     qword[rsp+8*11], rax
	mov r8, [rsp+8*11]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*12] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*12] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*2]
	imul r8, [rsp+8*3]
	mov qword [rsp+8*13],r8 
	mov r8, [rsp+8*13]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*14] ,r8
	mov     rdi, [rsp+8*14]
	call    toString
	mov     qword[rsp+8*15], rax
	mov r8, [rsp+8*15]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*16] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*16] 
	add rsi, 1 
	xor rax, rax
	call printf
	xor rdx, rdx
	mov rax, [rsp+8*2]
	mov rbx, [rsp+8*3]
	cdq
	idiv rbx
	mov [rsp+8*17], rax
	mov r8, [rsp+8*17]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*18] ,r8
	mov     rdi, [rsp+8*18]
	call    toString
	mov     qword[rsp+8*19], rax
	mov r8, [rsp+8*19]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*20] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*20] 
	add rsi, 1 
	xor rax, rax
	call printf
	xor rdx, rdx
	mov rax, [rsp+8*2]
	mov rbx, [rsp+8*3]
	cdq
	idiv rbx
	mov [rsp+8*21], rdx
	mov r8, [rsp+8*21]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*22] ,r8
	mov     rdi, [rsp+8*22]
	call    toString
	mov     qword[rsp+8*23], rax
	mov r8, [rsp+8*23]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*24] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*24] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*2]
	and r8, [rsp+8*3]
	mov qword [rsp+8*25],r8 
	mov r8, [rsp+8*25]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*26] ,r8
	mov     rdi, [rsp+8*26]
	call    toString
	mov     qword[rsp+8*27], rax
	mov r8, [rsp+8*27]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*28] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*28] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*2]
	or r8, [rsp+8*3]
	mov qword [rsp+8*29],r8 
	mov r8, [rsp+8*29]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*30] ,r8
	mov     rdi, [rsp+8*30]
	call    toString
	mov     qword[rsp+8*31], rax
	mov r8, [rsp+8*31]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*32] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*32] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*2]
	xor r8, [rsp+8*3]
	mov qword [rsp+8*33],r8 
	mov r8, [rsp+8*33]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*34] ,r8
	mov     rdi, [rsp+8*34]
	call    toString
	mov     qword[rsp+8*35], rax
	mov r8, [rsp+8*35]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*36] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*36] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*2]
	mov qword [rsp+8*37], 0
	cmp r8, 0
	sete [rsp+8*37]
	mov r8, [rsp+8*37]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*38] ,r8
	mov     rdi, [rsp+8*38]
	call    toString
	mov     qword[rsp+8*39], rax
	mov r8, [rsp+8*39]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*40] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*40] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*2]
	neg r8
	mov [rsp+8*41], r8
	mov r8, [rsp+8*41]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*42] ,r8
	mov     rdi, [rsp+8*42]
	call    toString
	mov     qword[rsp+8*43], rax
	mov r8, [rsp+8*43]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*44] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*44] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*2]
	not r8
	mov [rsp+8*45], r8
	mov r8, [rsp+8*45]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*46] ,r8
	mov     rdi, [rsp+8*46]
	call    toString
	mov     qword[rsp+8*47], rax
	mov r8, [rsp+8*47]
	mov qword [gbl+8*5] ,r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*48] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*48] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov rax,0
	leave
	ret
	jmp QED
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 456
	mov rax,[rsp+8*49]
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   2440

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	

