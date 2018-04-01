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
        jnz     toS_01
        mov     qword [rbp-8H], 1
toS_01:  cmp     qword [rbp-38H], 0
        jns     toS_02
        neg     qword [rbp-38H]
        mov     qword [rbp-10H], -1
        add     qword [rbp-8H], 1
toS_02:  mov     rax, qword [rbp-38H]
        mov     qword [rbp-18H], rax
        jmp     toS_04

toS_03:  add     qword [rbp-8H], 1
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
toS_04:  cmp     qword [rbp-18H], 0
        jg      toS_03
        mov     rax, qword [rbp-8H]
        add     rax, 2
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-28H], rax
        mov     rax, qword [rbp-8H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-28H]
        add     rax, rdx
        mov     byte [rax], 0
        mov     rax, qword [rbp-28H]
        mov     qword [rbp-20H], rax
        mov     rax, qword [rbp-8H]
        mov     edx, eax
        mov     rax, qword [rbp-20H]
        mov     byte [rax], dl
        add     qword [rbp-20H], 1
        cmp     qword [rbp-10H], -1
        jnz     toS_05
        mov     rax, qword [rbp-20H]
        mov     byte [rax], 45
toS_05:  mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-28H]
        add     rax, rdx
        mov     qword [rbp-20H], rax
        cmp     qword [rbp-38H], 0
        jnz     toS_06
        mov     rax, qword [rbp-20H]
        mov     byte [rax], 48
        jmp     toS_08

toS_06:  jmp     toS_08

toS_07:  mov     rcx, qword [rbp-38H]
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
toS_08:  cmp     qword [rbp-38H], 0
        jg      toS_07
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
        shl     rax, 3
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
        lea     rdx, [rax*8]
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
        movsxd  rdx, eax
        mov     rax, qword [rbp-40H]
        mov     rax, qword [rax]
        cmp     rdx, rax
        jnz     mA_001
        mov     eax, dword [rbp-34H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-40H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     rdi, rax
        call    mallocArray
        jmp     mA_004

mA_001:  mov     eax, dword [rbp-34H]
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
        jmp     mA_003

mA_002:  mov     eax, dword [rbp-14H]
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
mA_003:  mov     eax, dword [rbp-14H]
        cdqe
        cmp     rax, qword [rbp-20H]
        jl      mA_002
        mov     rax, qword [rbp-28H]
mA_004:  add     rsp, 56
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
        mov     edi, 1
        call    _multiArray
        leave
        ret


main:
	push   rbp
	mov    rbp, rsp
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	sub    rsp, 472
	call global_init
=======
	sub    rsp, 464
>>>>>>> parent of 7ef4276... multiarray
=======
	sub    rsp, 464
>>>>>>> parent of 7ef4276... multiarray
=======
	sub    rsp, 464
>>>>>>> parent of 7ef4276... multiarray
=======
	sub    rsp, 464
>>>>>>> parent of 7ef4276... multiarray
=======
	sub    rsp, 464
>>>>>>> parent of 7ef4276... multiarray
	mov qword [rsp+8*0] ,6
	mov qword [rsp+8*1] ,1
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*2], rax
	mov     rsi, 0
	mov     rdi, [rsp+8*2]
	call    address
	mov [rsp+8*3], rax
	mov r8, [rsp+8*0]
	mov r9, [rsp+8*3]
	mov qword [r9], r8
	mov     rdi, [rsp+8*2]
	call    multiArray
	mov     qword [rsp+8*2], rax
	mov r8, [rsp+8*2]
	mov qword [rsp+8*4] ,r8
	mov qword [rsp+8*5] ,1
	
L_0:
	mov qword [rsp+8*6] ,1
	mov qword [rsp+8*7] ,0
	
L_3:
	mov r8, [rsp+8*7]
	mov r9, [rsp+8*0]
	cmp r8, r9
	mov qword [rsp+8*8], 0
	setl [rsp+8*8]
	mov r8, [rsp+8*8]
	cmp r8, 0
	je L_4
	mov r8, [rsp+8*4]
	mov qword [rsp+8*9] ,r8
	mov     rsi, [rsp+8*7]
	mov     rdi, [rsp+8*9]
	call    address
	mov [rsp+8*10], rax
	mov r8, [rsp+8*1]
	mov r9, [rsp+8*10]
	mov qword [r9], r8
	mov r8, [rsp+8*1]
	imul r8, [rsp+8*5]
	mov qword [rsp+8*11],r8 
	xor rdx, rdx
	mov rax, [rsp+8*11]
	mov rbx, 7
	cdq
	idiv rbx
	mov [rsp+8*12], rdx
	mov r8, [rsp+8*12]
	mov qword [rsp+8*1] ,r8
	mov qword [rsp+8*13] ,0
	
L_6:
	mov r8, [rsp+8*13]
	mov r9, [rsp+8*7]
	cmp r8, r9
	mov qword [rsp+8*14], 0
	setl [rsp+8*14]
	mov r8, [rsp+8*14]
	cmp r8, 0
	je L_7
	mov r8, [rsp+8*4]
	mov qword [rsp+8*15] ,r8
	mov     rsi, [rsp+8*7]
	mov     rdi, [rsp+8*15]
	call    address
	mov [rsp+8*16], rax
	mov r8, [rsp+8*16]
	mov r8, [r8]
	mov [rsp+8*17], r8
	mov r8, [rsp+8*4]
	mov qword [rsp+8*18] ,r8
	mov     rsi, [rsp+8*13]
	mov     rdi, [rsp+8*18]
	call    address
	mov [rsp+8*19], rax
	mov r8, [rsp+8*19]
	mov r8, [r8]
	mov [rsp+8*20], r8
	mov r8, [rsp+8*17]
	mov r9, [rsp+8*20]
	cmp r8, r9
	mov qword [rsp+8*21], 0
	sete [rsp+8*21]
	mov r8, [rsp+8*21]
	cmp r8, 0
	je L_10
	mov qword [rsp+8*6] ,0
	jmp L_7
	
L_10:
	
L_8:
	mov r8, [rsp+8*13]
	add r8, 1
	mov qword [rsp+8*13],r8 
	mov r8, [rsp+8*13]
	sub r8, 1
	mov qword [rsp+8*22],r8 
	jmp L_6
	
L_7:
	
L_5:
	mov r8, [rsp+8*7]
	add r8, 1
	mov qword [rsp+8*7],r8 
	mov r8, [rsp+8*7]
	sub r8, 1
	mov qword [rsp+8*23],r8 
	jmp L_3
	
L_4:
	mov r8, [rsp+8*6]
	cmp r8, 0
	je L_12
	jmp L_1
	
L_12:
	
L_2:
	mov r8, [rsp+8*5]
	add r8, 1
	mov qword [rsp+8*5],r8 
	mov r8, [rsp+8*5]
	sub r8, 1
	mov qword [rsp+8*24],r8 
	jmp L_0
	
L_1:
	mov qword [rsp+8*7] ,0
	
L_13:
	mov r8, [rsp+8*7]
	mov r9, [rsp+8*0]
	cmp r8, r9
	mov qword [rsp+8*25], 0
	setl [rsp+8*25]
	mov r8, [rsp+8*25]
	cmp r8, 0
	je L_14
	mov qword [rsp+8*13] ,0
	
L_16:
	mov r8, [rsp+8*13]
	add r8, 1
	mov qword [rsp+8*26],r8 
	mov r8, [rsp+8*26]
	mov r9, [rsp+8*0]
	cmp r8, r9
	mov qword [rsp+8*27], 0
	setl [rsp+8*27]
	mov r8, [rsp+8*27]
	cmp r8, 0
	je L_17
	mov r8, [rsp+8*4]
	mov qword [rsp+8*28] ,r8
	mov     rsi, [rsp+8*13]
	mov     rdi, [rsp+8*28]
	call    address
	mov [rsp+8*29], rax
	mov r8, [rsp+8*29]
	mov r8, [r8]
	mov [rsp+8*30], r8
	mov r8, [rsp+8*13]
	add r8, 1
	mov qword [rsp+8*31],r8 
	mov r8, [rsp+8*4]
	mov qword [rsp+8*32] ,r8
	mov     rsi, [rsp+8*31]
	mov     rdi, [rsp+8*32]
	call    address
	mov [rsp+8*33], rax
	mov r8, [rsp+8*33]
	mov r8, [r8]
	mov [rsp+8*34], r8
	mov r8, [rsp+8*30]
	mov r9, [rsp+8*34]
	cmp r8, r9
	mov qword [rsp+8*35], 0
	setg [rsp+8*35]
	mov r8, [rsp+8*35]
	cmp r8, 0
	je L_20
	mov r8, [rsp+8*4]
	mov qword [rsp+8*36] ,r8
	mov     rsi, [rsp+8*13]
	mov     rdi, [rsp+8*36]
	call    address
	mov [rsp+8*37], rax
	mov r8, [rsp+8*37]
	mov r8, [r8]
	mov [rsp+8*38], r8
	mov r8, [rsp+8*38]
	mov qword [rsp+8*39] ,r8
	mov r8, [rsp+8*13]
	add r8, 1
	mov qword [rsp+8*40],r8 
	mov r8, [rsp+8*4]
	mov qword [rsp+8*41] ,r8
	mov     rsi, [rsp+8*40]
	mov     rdi, [rsp+8*41]
	call    address
	mov [rsp+8*42], rax
	mov r8, [rsp+8*42]
	mov r8, [r8]
	mov [rsp+8*43], r8
	mov r8, [rsp+8*4]
	mov qword [rsp+8*44] ,r8
	mov     rsi, [rsp+8*13]
	mov     rdi, [rsp+8*44]
	call    address
	mov [rsp+8*45], rax
	mov r8, [rsp+8*43]
	mov r9, [rsp+8*45]
	mov qword [r9], r8
	mov r8, [rsp+8*13]
	add r8, 1
	mov qword [rsp+8*46],r8 
	mov r8, [rsp+8*4]
	mov qword [rsp+8*47] ,r8
	mov     rsi, [rsp+8*46]
	mov     rdi, [rsp+8*47]
	call    address
	mov [rsp+8*48], rax
	mov r8, [rsp+8*39]
	mov r9, [rsp+8*48]
	mov qword [r9], r8
	
L_20:
	
L_18:
	mov r8, [rsp+8*13]
	add r8, 1
	mov qword [rsp+8*13],r8 
	mov r8, [rsp+8*13]
	sub r8, 1
	mov qword [rsp+8*49],r8 
	jmp L_16
	
L_17:
	
L_15:
	mov r8, [rsp+8*7]
	add r8, 1
	mov qword [rsp+8*7],r8 
	mov r8, [rsp+8*7]
	sub r8, 1
	mov qword [rsp+8*50],r8 
	jmp L_13
	
L_14:
	mov qword [rsp+8*7] ,0
	
L_21:
	mov r8, [rsp+8*7]
	mov r9, [rsp+8*0]
	cmp r8, r9
	mov qword [rsp+8*51], 0
	setl [rsp+8*51]
	mov r8, [rsp+8*51]
	cmp r8, 0
	je L_22
	mov r8, [rsp+8*4]
	mov qword [rsp+8*52] ,r8
	mov     rsi, [rsp+8*7]
	mov     rdi, [rsp+8*52]
	call    address
	mov [rsp+8*53], rax
	mov r8, [rsp+8*53]
	mov r8, [r8]
	mov [rsp+8*54], r8
	push qword [rsp+8*54]
	pop qword [rsp+8*55]
	mov     rdi, [rsp+8*55]
	call    toString
	mov     qword[rsp+8*56], rax
	push qword [rsp+8*56]
	pop qword [rsp+8*57]
	mov rdi, formatln
	mov rsi,[rsp+8*57] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_23:
	mov r8, [rsp+8*7]
	add r8, 1
	mov qword [rsp+8*7],r8 
	mov r8, [rsp+8*7]
	sub r8, 1
	mov qword [rsp+8*58],r8 
	jmp L_21
	
L_22:
	push qword 0
	leave
	ret
	push qword 0
	leave
	ret
	jmp QED
	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 472
	leave
	ret
	
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
QED:
	
	 section   .bss
gbl:         resb   472

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	

