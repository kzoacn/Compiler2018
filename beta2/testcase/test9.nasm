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
	sub    rsp, 208
	call global_init
=======
	sub    rsp, 200
>>>>>>> parent of 7ef4276... multiarray
=======
	sub    rsp, 200
>>>>>>> parent of 7ef4276... multiarray
=======
	sub    rsp, 200
>>>>>>> parent of 7ef4276... multiarray
=======
	sub    rsp, 200
>>>>>>> parent of 7ef4276... multiarray
=======
	sub    rsp, 200
>>>>>>> parent of 7ef4276... multiarray
	mov qword [rsp+8*0] ,5
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*1], rax
	mov     rsi, 0
	mov     rdi, [rsp+8*1]
	call    address
	mov [rsp+8*2], rax
	mov r8, [rsp+8*0]
	mov r9, [rsp+8*2]
	mov qword [r9], r8
	mov     rdi, [rsp+8*1]
	call    multiArray
	mov     qword [rsp+8*1], rax
	mov r8, [rsp+8*1]
	mov qword [rsp+8*3] ,r8
	mov r8, 1
	neg r8
	mov [rsp+8*4], r8
	mov r8, [rsp+8*4]
	mov qword [rsp+8*5] ,r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*6] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*6]
	call    address
	mov [rsp+8*7], rax
	mov r8, 3
	mov r9, [rsp+8*7]
	mov qword [r9], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*8] ,r8
	mov     rsi, 1
	mov     rdi, [rsp+8*8]
	call    address
	mov [rsp+8*9], rax
	mov r8, 1
	mov r9, [rsp+8*9]
	mov qword [r9], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*10] ,r8
	mov     rsi, 2
	mov     rdi, [rsp+8*10]
	call    address
	mov [rsp+8*11], rax
	mov r8, 3
	mov r9, [rsp+8*11]
	mov qword [r9], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*12] ,r8
	mov     rsi, 3
	mov     rdi, [rsp+8*12]
	call    address
	mov [rsp+8*13], rax
	mov r8, 2
	mov r9, [rsp+8*13]
	mov qword [r9], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*14] ,r8
	mov     rsi, 4
	mov     rdi, [rsp+8*14]
	call    address
	mov [rsp+8*15], rax
	mov r8, 6
	mov r9, [rsp+8*15]
	mov qword [r9], r8
	mov qword [rsp+8*16] ,0
	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
L_118:
	mov r8, [rsp+8*16]
=======
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
L_113:
	mov r8, [rsp+8*15]
>>>>>>> parent of 7ef4276... multiarray
	mov r9, [rsp+8*0]
	cmp r8, r9
	mov qword [rsp+8*17], 0
	setl [rsp+8*17]
	mov r8, [rsp+8*17]
	cmp r8, 0
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	je L_119
	mov r8, [rsp+8*3]
	mov qword [rsp+8*18] ,r8
	mov     rsi, [rsp+8*16]
	mov     rdi, [rsp+8*18]
=======
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
	je L_114
	mov r8, [rsp+8*2]
	mov qword [rsp+8*17] ,r8
	mov     rsi, [rsp+8*15]
	mov     rdi, [rsp+8*17]
>>>>>>> parent of 7ef4276... multiarray
	call    address
	mov [rsp+8*19], rax
	mov r8, [rsp+8*19]
	mov r8, [r8]
	mov [rsp+8*20], r8
	mov r8, [rsp+8*20]
	mov r9, 2
	cmp r8, r9
	mov qword [rsp+8*21], 0
	sete [rsp+8*21]
	mov r8, [rsp+8*21]
	cmp r8, 0
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	je L_122
	mov r8, [rsp+8*16]
	mov qword [rsp+8*5] ,r8
	jmp L_119
	
L_122:
	
L_120:
	mov r8, [rsp+8*16]
=======
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
	je L_117
	mov r8, [rsp+8*15]
	mov qword [rsp+8*4] ,r8
	jmp L_114
	
L_117:
	
L_115:
	mov r8, [rsp+8*15]
>>>>>>> parent of 7ef4276... multiarray
	add r8, 1
	mov qword [rsp+8*16],r8 
	mov r8, [rsp+8*16]
	sub r8, 1
<<<<<<< HEAD
	mov qword [rsp+8*22],r8 
	jmp L_118
	
L_119:
	push qword [rsp+8*5]
	pop qword [rsp+8*23]
	mov     rdi, [rsp+8*23]
=======
	mov qword [rsp+8*21],r8 
	jmp L_113
	
L_114:
	push qword [rsp+8*4]
	pop qword [rsp+8*22]
	mov     rdi, [rsp+8*22]
>>>>>>> parent of 7ef4276... multiarray
	call    toString
	mov     qword[rsp+8*24], rax
	push qword [rsp+8*24]
	pop qword [rsp+8*25]
	mov rdi, formatln
	mov rsi,[rsp+8*25] 
	add rsi, 1 
	xor rax, rax
	call printf
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
	sub    rsp, 208
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
gbl:         resb   208

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	

