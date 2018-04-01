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


main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 944
	call global_init
	mov [rsp+8*1] , rax
	mov qword [gbl+8*2] ,106
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
	
L_374:
	mov r8, [gbl+8*8]
	mov r9, [gbl+8*4]
	cmp r8, r9
	mov qword [rsp+8*9], 0
	setl [rsp+8*9]
	mov r8, [rsp+8*9]
	cmp r8, 0
	je L_375
	mov qword [gbl+8*10] ,0
	
L_377:
	mov r8, [gbl+8*10]
	mov r9, [gbl+8*4]
	cmp r8, r9
	mov qword [rsp+8*11], 0
	setl [rsp+8*11]
	mov r8, [rsp+8*11]
	cmp r8, 0
	je L_378
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
	
L_379:
	mov r8, [gbl+8*10]
	add r8, 1
	mov qword [gbl+8*10],r8 
	mov r8, [gbl+8*10]
	sub r8, 1
	mov qword [rsp+8*16],r8 
	jmp L_377
	
L_378:
	
L_376:
	mov r8, [gbl+8*8]
	add r8, 1
	mov qword [gbl+8*8],r8 
	mov r8, [gbl+8*8]
	sub r8, 1
	mov qword [rsp+8*17],r8 
	jmp L_374
	
L_375:
	
L_380:
	mov r8, [gbl+8*18]
	mov r9, [gbl+8*19]
	cmp r8, r9
	mov qword [rsp+8*20], 0
	setle [rsp+8*20]
	mov r8, [rsp+8*20]
	cmp r8, 0
	je L_381
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
	mov qword [gbl+8*37] ,r8
	mov r8, [rsp+8*35]
	mov qword [gbl+8*2] ,r8
	call addList
	mov [rsp+8*38] , rax
	mov r8, [gbl+8*25]
	sub r8, 1
	mov qword [rsp+8*39],r8 
	mov r8, [gbl+8*30]
	add r8, 2
	mov qword [rsp+8*40],r8 
	mov r8, [rsp+8*40]
	mov qword [gbl+8*37] ,r8
	mov r8, [rsp+8*39]
	mov qword [gbl+8*2] ,r8
	call addList
	mov [rsp+8*41] , rax
	mov r8, [gbl+8*25]
	add r8, 1
	mov qword [rsp+8*42],r8 
	mov r8, [gbl+8*30]
	sub r8, 2
	mov qword [rsp+8*43],r8 
	mov r8, [rsp+8*43]
	mov qword [gbl+8*37] ,r8
	mov r8, [rsp+8*42]
	mov qword [gbl+8*2] ,r8
	call addList
	mov [rsp+8*44] , rax
	mov r8, [gbl+8*25]
	add r8, 1
	mov qword [rsp+8*45],r8 
	mov r8, [gbl+8*30]
	add r8, 2
	mov qword [rsp+8*46],r8 
	mov r8, [rsp+8*46]
	mov qword [gbl+8*37] ,r8
	mov r8, [rsp+8*45]
	mov qword [gbl+8*2] ,r8
	call addList
	mov [rsp+8*47] , rax
	mov r8, [gbl+8*25]
	sub r8, 2
	mov qword [rsp+8*48],r8 
	mov r8, [gbl+8*30]
	sub r8, 1
	mov qword [rsp+8*49],r8 
	mov r8, [rsp+8*49]
	mov qword [gbl+8*37] ,r8
	mov r8, [rsp+8*48]
	mov qword [gbl+8*2] ,r8
	call addList
	mov [rsp+8*50] , rax
	mov r8, [gbl+8*25]
	sub r8, 2
	mov qword [rsp+8*51],r8 
	mov r8, [gbl+8*30]
	add r8, 1
	mov qword [rsp+8*52],r8 
	mov r8, [rsp+8*52]
	mov qword [gbl+8*37] ,r8
	mov r8, [rsp+8*51]
	mov qword [gbl+8*2] ,r8
	call addList
	mov [rsp+8*53] , rax
	mov r8, [gbl+8*25]
	add r8, 2
	mov qword [rsp+8*54],r8 
	mov r8, [gbl+8*30]
	sub r8, 1
	mov qword [rsp+8*55],r8 
	mov r8, [rsp+8*55]
	mov qword [gbl+8*37] ,r8
	mov r8, [rsp+8*54]
	mov qword [gbl+8*2] ,r8
	call addList
	mov [rsp+8*56] , rax
	mov r8, [gbl+8*25]
	add r8, 2
	mov qword [rsp+8*57],r8 
	mov r8, [gbl+8*30]
	add r8, 1
	mov qword [rsp+8*58],r8 
	mov r8, [rsp+8*58]
	mov qword [gbl+8*37] ,r8
	mov r8, [rsp+8*57]
	mov qword [gbl+8*2] ,r8
	call addList
	mov [rsp+8*59] , rax
	mov r8, [gbl+8*60]
	mov r9, 1
	cmp r8, r9
	mov qword [rsp+8*61], 0
	sete [rsp+8*61]
	mov r8, [rsp+8*61]
	cmp r8, 0
	je L_383
	jmp L_381
	
L_383:
	mov r8, [gbl+8*18]
	add r8, 1
	mov qword [rsp+8*62],r8 
	mov r8, [rsp+8*62]
	mov qword [gbl+8*18] ,r8
	jmp L_380
	
L_381:
	mov r8, [gbl+8*60]
	mov r9, 1
	cmp r8, r9
	mov qword [rsp+8*63], 0
	sete [rsp+8*63]
	mov r8, [rsp+8*63]
	cmp r8, 0
	je L_384
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
	mov qword [gbl+8*2] ,r8
	mov r8, [gbl+8*2]
	mov qword [rsp+8*67] ,r8
	mov     rdi, [rsp+8*67]
	call    toString
	mov     qword[rsp+8*68], rax
	mov r8, [rsp+8*68]
	mov qword [gbl+8*2] ,r8
	mov r8, [gbl+8*2]
	mov qword [rsp+8*69] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*69] 
	add rsi, 1 
	xor rax, rax
	call printf
	jmp L_385
	
L_384:
	mov qword [gbl+8*2] ,t3496
	mov r8, [gbl+8*2]
	mov qword [rsp+8*70] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*70] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_385:
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
	mov r8, [gbl+8*2]
	mov qword [rsp+8*71] ,r8
	mov     rdi, [rsp+8*71]
	call    mallocArray
	mov     qword [rsp+8*72], rax
	mov r8, [rsp+8*72]
	mov qword [gbl+8*13] ,r8
	mov qword [gbl+8*8] ,0
	
L_362:
	mov r8, [gbl+8*8]
	mov r9, [rsp+8*71]
	cmp r8, r9
	mov qword [rsp+8*73], 0
	setl [rsp+8*73]
	mov r8, [rsp+8*73]
	cmp r8, 0
	je L_363
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
	
L_365:
	mov r8, [gbl+8*10]
	mov r9, [rsp+8*71]
	cmp r8, r9
	mov qword [rsp+8*77], 0
	setl [rsp+8*77]
	mov r8, [rsp+8*77]
	cmp r8, 0
	je L_366
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
	
L_367:
	mov r8, [gbl+8*10]
	add r8, 1
	mov qword [gbl+8*10],r8 
	mov r8, [gbl+8*10]
	sub r8, 1
	mov qword [rsp+8*80],r8 
	jmp L_365
	
L_366:
	
L_364:
	mov r8, [gbl+8*8]
	add r8, 1
	mov qword [gbl+8*8],r8 
	mov r8, [gbl+8*8]
	sub r8, 1
	mov qword [rsp+8*81],r8 
	jmp L_362
	
L_363:
	mov rax,0
	leave
	ret
	
check:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 944
	mov r8, [gbl+8*2]
	mov qword [rsp+8*82] ,r8
	mov r8, [gbl+8*37]
	mov qword [rsp+8*83] ,r8
	mov r8, [rsp+8*82]
	mov r9, [rsp+8*83]
	cmp r8, r9
	mov qword [rsp+8*84], 0
	setl [rsp+8*84]
	mov r8, [rsp+8*82]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*85], 0
	setge [rsp+8*85]
	mov r8, [rsp+8*84]
	and r8, [rsp+8*85]
	mov qword [rsp+8*86],r8 
	mov rax,[rsp+8*86]
	leave
	ret
	mov rax,0
	leave
	ret
	
addList:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 944
	mov r8, [gbl+8*2]
	mov qword [rsp+8*87] ,r8
	mov r8, [gbl+8*37]
	mov qword [rsp+8*88] ,r8
	mov r8, [gbl+8*4]
	mov qword [gbl+8*37] ,r8
	mov r8, [rsp+8*87]
	mov qword [gbl+8*2] ,r8
	call check
	mov [rsp+8*89] , rax
	mov r8, [gbl+8*4]
	mov qword [gbl+8*37] ,r8
	mov r8, [rsp+8*88]
	mov qword [gbl+8*2] ,r8
	call check
	mov [rsp+8*90] , rax
	mov r8, [rsp+8*89]
	and r8, [rsp+8*90]
	mov qword [rsp+8*91],r8 
	mov r8, [rsp+8*91]
	cmp r8, 0
	je L_369
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
	je L_371
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
	mov r8, [rsp+8*88]
	mov r9, [gbl+8*6]
	cmp r8, r9
	mov qword [rsp+8*106], 0
	sete [rsp+8*106]
	mov r8, [rsp+8*105]
	and r8, [rsp+8*106]
	mov qword [rsp+8*107],r8 
	mov r8, [rsp+8*107]
	cmp r8, 0
	je L_373
	mov qword [gbl+8*60] ,1
	
L_373:
	
L_371:
	
L_369:
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

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	
t3496:
	 db 12,"no solution!" ,0


