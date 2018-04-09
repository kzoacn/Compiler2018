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
	sub    rsp, 496
	call global_init
	mov [rsp+8*1] , rax
	mov r8, [gbl+8*2]
	add r8, 1
	mov qword [rsp+8*3],r8 
	mov     rdi, [rsp+8*3]
	call    mallocArray
	mov     qword [rsp+8*4], rax
	mov r8, [rsp+8*4]
	mov qword [gbl+8*5] ,r8
	mov qword [rsp+8*6] ,1
	
L_341:
	mov r8, [rsp+8*6]
	mov r9, [gbl+8*2]
	cmp r8, r9
	mov qword [rsp+8*7], 0
	setle [rsp+8*7]
	mov r8, [rsp+8*7]
	cmp r8, 0
	je L_342
	call rnd
	mov [rsp+8*8] , rax
	mov r8, [gbl+8*5]
	mov qword [rsp+8*9] ,r8
	mov     rsi, [rsp+8*6]
	mov     rdi, [rsp+8*9]
	call    address
	mov [rsp+8*10], rax
	mov r8, [rsp+8*8]
	mov r9, [rsp+8*10]
	mov qword [r9], r8
	
L_343:
	mov r8, [rsp+8*6]
	add r8, 1
	mov qword [rsp+8*6],r8 
	mov r8, [rsp+8*6]
	sub r8, 1
	mov qword [rsp+8*11],r8 
	jmp L_341
	
L_342:
	mov r8, [gbl+8*2]
	mov qword [gbl+8*12] ,r8
	mov qword [gbl+8*13] ,1
	call dp
	mov [rsp+8*14] , rax
	mov r8, [rsp+8*14]
	mov qword [gbl+8*13] ,r8
	mov r8, [gbl+8*13]
	mov qword [rsp+8*15] ,r8
	mov     rdi, [rsp+8*15]
	call    toString
	mov     qword[rsp+8*16], rax
	mov r8, [rsp+8*16]
	mov qword [gbl+8*13] ,r8
	mov r8, [gbl+8*13]
	mov qword [rsp+8*17] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*17] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov rax,0
	leave
	ret
	mov rax,0
	leave
	ret
	jmp QED
	
max:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 496
	mov r8, [gbl+8*13]
	mov qword [rsp+8*18] ,r8
	mov r8, [gbl+8*12]
	mov qword [rsp+8*19] ,r8
	mov r8, [rsp+8*18]
	mov r9, [rsp+8*19]
	cmp r8, r9
	mov qword [rsp+8*20], 0
	setg [rsp+8*20]
	mov r8, [rsp+8*20]
	cmp r8, 0
	je L_331
	mov rax,[rsp+8*18]
	leave
	ret
	
L_331:
	mov rax,[rsp+8*19]
	leave
	ret
	mov rax,0
	leave
	ret
	
rnd:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 496
	mov r8, [gbl+8*21]
	imul r8, 7
	mov qword [rsp+8*22],r8 
	mov r8, [rsp+8*22]
	add r8, 4
	mov qword [rsp+8*23],r8 
	xor rdx, rdx
	mov rax, [rsp+8*23]
	mov rbx, 233
	cdq
	idiv rbx
	mov [rsp+8*24], rdx
	mov r8, [rsp+8*24]
	mov qword [gbl+8*21] ,r8
	mov r8, [gbl+8*21]
	add r8, 1
	mov qword [rsp+8*25],r8 
	mov rax,[rsp+8*25]
	leave
	ret
	mov rax,0
	leave
	ret
	
dp:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 496
	mov r8, [gbl+8*13]
	mov qword [rsp+8*26] ,r8
	mov r8, [gbl+8*12]
	mov qword [rsp+8*27] ,r8
	mov r8, [rsp+8*26]
	mov r9, [rsp+8*27]
	cmp r8, r9
	mov qword [rsp+8*28], 0
	setg [rsp+8*28]
	mov r8, [rsp+8*28]
	cmp r8, 0
	je L_333
	mov rax,0
	leave
	ret
	
L_333:
	mov r8, [gbl+8*29]
	mov qword [rsp+8*30] ,r8
	mov     rsi, [rsp+8*26]
	mov     rdi, [rsp+8*30]
	call    address
	mov [rsp+8*31], rax
	mov r8, [rsp+8*31]
	mov r8, [r8]
	mov [rsp+8*30], r8
	mov     rsi, [rsp+8*27]
	mov     rdi, [rsp+8*30]
	call    address
	mov [rsp+8*31], rax
	mov r8, [rsp+8*31]
	mov r8, [r8]
	mov [rsp+8*32], r8
	mov r8, [rsp+8*32]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*33], 0
	setne [rsp+8*33]
	mov r8, [rsp+8*33]
	cmp r8, 0
	je L_335
	mov r8, [gbl+8*29]
	mov qword [rsp+8*34] ,r8
	mov     rsi, [rsp+8*26]
	mov     rdi, [rsp+8*34]
	call    address
	mov [rsp+8*35], rax
	mov r8, [rsp+8*35]
	mov r8, [r8]
	mov [rsp+8*34], r8
	mov     rsi, [rsp+8*27]
	mov     rdi, [rsp+8*34]
	call    address
	mov [rsp+8*35], rax
	mov r8, [rsp+8*35]
	mov r8, [r8]
	mov [rsp+8*36], r8
	mov rax,[rsp+8*36]
	leave
	ret
	
L_335:
	mov r8, [rsp+8*26]
	mov r9, [rsp+8*27]
	cmp r8, r9
	mov qword [rsp+8*37], 0
	sete [rsp+8*37]
	mov r8, [rsp+8*37]
	cmp r8, 0
	je L_337
	mov r8, [gbl+8*5]
	mov qword [rsp+8*38] ,r8
	mov     rsi, [rsp+8*26]
	mov     rdi, [rsp+8*38]
	call    address
	mov [rsp+8*39], rax
	mov r8, [rsp+8*39]
	mov r8, [r8]
	mov [rsp+8*40], r8
	mov rax,[rsp+8*40]
	leave
	ret
	
L_337:
	mov qword [rsp+8*41] ,0
	mov r8, [rsp+8*26]
	mov qword [rsp+8*42] ,r8
	
L_338:
	mov r8, [rsp+8*42]
	mov r9, [rsp+8*27]
	cmp r8, r9
	mov qword [rsp+8*43], 0
	setl [rsp+8*43]
	mov r8, [rsp+8*43]
	cmp r8, 0
	je L_339
	mov r8, [rsp+8*42]
	mov qword [gbl+8*12] ,r8
	mov r8, [rsp+8*26]
	mov qword [gbl+8*13] ,r8
	call dp
	mov [rsp+8*44] , rax
	mov r8, [rsp+8*42]
	add r8, 2
	mov qword [rsp+8*45],r8 
	mov r8, [rsp+8*27]
	mov qword [gbl+8*12] ,r8
	mov r8, [rsp+8*45]
	mov qword [gbl+8*13] ,r8
	call dp
	mov [rsp+8*46] , rax
	mov r8, [rsp+8*44]
	add r8, [rsp+8*46]
	mov qword [rsp+8*47],r8 
	mov r8, [rsp+8*47]
	mov qword [gbl+8*12] ,r8
	mov r8, [rsp+8*41]
	mov qword [gbl+8*13] ,r8
	call max
	mov [rsp+8*48] , rax
	mov r8, [rsp+8*48]
	mov qword [rsp+8*41] ,r8
	
L_340:
	mov r8, [rsp+8*42]
	add r8, 1
	mov qword [rsp+8*42],r8 
	mov r8, [rsp+8*42]
	sub r8, 1
	mov qword [rsp+8*49],r8 
	jmp L_338
	
L_339:
	mov r8, [gbl+8*29]
	mov qword [rsp+8*50] ,r8
	mov     rsi, [rsp+8*26]
	mov     rdi, [rsp+8*50]
	call    address
	mov [rsp+8*51], rax
	mov r8, [rsp+8*51]
	mov r8, [r8]
	mov [rsp+8*50], r8
	mov     rsi, [rsp+8*27]
	mov     rdi, [rsp+8*50]
	call    address
	mov [rsp+8*51], rax
	mov r8, [rsp+8*41]
	mov r9, [rsp+8*51]
	mov qword [r9], r8
	mov rax,[rsp+8*41]
	leave
	ret
	mov rax,0
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 496
	mov qword [gbl+8*2] ,50
	mov     rdi, 2
	call    mallocArray
	mov     qword [gbl+8*52], rax
	mov     rsi, 0
	mov     rdi, [gbl+8*52]
	call    address
	mov [gbl+8*53], rax
	mov r8, 51
	mov r9, [gbl+8*53]
	mov qword [r9], r8
	mov     rsi, 1
	mov     rdi, [gbl+8*52]
	call    address
	mov [gbl+8*53], rax
	mov r8, 51
	mov r9, [gbl+8*53]
	mov qword [r9], r8
	mov     rdi, [gbl+8*52]
	call    multiArray
	mov     qword [gbl+8*52], rax
	mov r8, [gbl+8*52]
	mov qword [gbl+8*29] ,r8
	mov qword [gbl+8*21] ,13
	mov rax,[rsp+8*54]
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   2480

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	

