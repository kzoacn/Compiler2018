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
	sub    rsp, 400
	call global_init
=======
	sub    rsp, 392
>>>>>>> parent of 7ef4276... multiarray
=======
	sub    rsp, 392
>>>>>>> parent of 7ef4276... multiarray
=======
	sub    rsp, 392
>>>>>>> parent of 7ef4276... multiarray
=======
	sub    rsp, 392
>>>>>>> parent of 7ef4276... multiarray
=======
	sub    rsp, 392
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
	mov r8, [rsp+8*3]
	mov qword [rsp+8*4] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*4]
	call    address
	mov [rsp+8*5], rax
	mov r8, 1
	mov r9, [rsp+8*5]
	mov qword [r9], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*6] ,r8
	mov     rsi, 1
	mov     rdi, [rsp+8*6]
	call    address
	mov [rsp+8*7], rax
	mov r8, 5
	mov r9, [rsp+8*7]
	mov qword [r9], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*8] ,r8
	mov     rsi, 2
	mov     rdi, [rsp+8*8]
	call    address
	mov [rsp+8*9], rax
	mov r8, 2
	mov r9, [rsp+8*9]
	mov qword [r9], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*10] ,r8
	mov     rsi, 3
	mov     rdi, [rsp+8*10]
	call    address
	mov [rsp+8*11], rax
	mov r8, 4
	mov r9, [rsp+8*11]
	mov qword [r9], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*12] ,r8
	mov     rsi, 4
	mov     rdi, [rsp+8*12]
	call    address
	mov [rsp+8*13], rax
	mov r8, 3
	mov r9, [rsp+8*13]
	mov qword [r9], r8
	mov qword [rsp+8*14] ,0
	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
L_107:
	mov r8, [rsp+8*14]
=======
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
L_102:
	mov r8, [rsp+8*13]
>>>>>>> parent of 7ef4276... multiarray
	mov r9, [rsp+8*0]
	cmp r8, r9
	mov qword [rsp+8*15], 0
	setl [rsp+8*15]
	mov r8, [rsp+8*15]
	cmp r8, 0
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	je L_108
	mov qword [rsp+8*16] ,0
	
L_110:
=======
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
	je L_103
	mov qword [rsp+8*15] ,0
	
L_105:
	mov r8, [rsp+8*15]
	add r8, 1
	mov qword [rsp+8*16],r8 
>>>>>>> parent of 7ef4276... multiarray
	mov r8, [rsp+8*16]
	add r8, 1
	mov qword [rsp+8*17],r8 
	mov r8, [rsp+8*17]
	mov r9, [rsp+8*0]
	cmp r8, r9
	mov qword [rsp+8*18], 0
	setl [rsp+8*18]
	mov r8, [rsp+8*18]
	cmp r8, 0
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	je L_111
	mov r8, [rsp+8*3]
	mov qword [rsp+8*19] ,r8
	mov     rsi, [rsp+8*16]
	mov     rdi, [rsp+8*19]
=======
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
	je L_106
	mov r8, [rsp+8*2]
	mov qword [rsp+8*18] ,r8
	mov     rsi, [rsp+8*15]
	mov     rdi, [rsp+8*18]
>>>>>>> parent of 7ef4276... multiarray
	call    address
	mov [rsp+8*20], rax
	mov r8, [rsp+8*20]
	mov r8, [r8]
	mov [rsp+8*21], r8
	mov r8, [rsp+8*16]
	add r8, 1
	mov qword [rsp+8*22],r8 
	mov r8, [rsp+8*3]
	mov qword [rsp+8*23] ,r8
	mov     rsi, [rsp+8*22]
	mov     rdi, [rsp+8*23]
	call    address
	mov [rsp+8*24], rax
	mov r8, [rsp+8*24]
	mov r8, [r8]
	mov [rsp+8*25], r8
	mov r8, [rsp+8*21]
	mov r9, [rsp+8*25]
	cmp r8, r9
	mov qword [rsp+8*26], 0
	setg [rsp+8*26]
	mov r8, [rsp+8*26]
	cmp r8, 0
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	je L_114
	mov r8, [rsp+8*3]
	mov qword [rsp+8*27] ,r8
	mov     rsi, [rsp+8*16]
	mov     rdi, [rsp+8*27]
=======
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
	je L_109
	mov r8, [rsp+8*2]
	mov qword [rsp+8*26] ,r8
	mov     rsi, [rsp+8*15]
	mov     rdi, [rsp+8*26]
>>>>>>> parent of 7ef4276... multiarray
	call    address
	mov [rsp+8*28], rax
	mov r8, [rsp+8*28]
	mov r8, [r8]
	mov [rsp+8*29], r8
	mov r8, [rsp+8*29]
	mov qword [rsp+8*30] ,r8
	mov r8, [rsp+8*16]
	add r8, 1
	mov qword [rsp+8*31],r8 
	mov r8, [rsp+8*3]
	mov qword [rsp+8*32] ,r8
	mov     rsi, [rsp+8*31]
	mov     rdi, [rsp+8*32]
	call    address
	mov [rsp+8*33], rax
	mov r8, [rsp+8*33]
	mov r8, [r8]
	mov [rsp+8*34], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*35] ,r8
	mov     rsi, [rsp+8*16]
	mov     rdi, [rsp+8*35]
	call    address
	mov [rsp+8*36], rax
	mov r8, [rsp+8*34]
	mov r9, [rsp+8*36]
	mov qword [r9], r8
	mov r8, [rsp+8*16]
	add r8, 1
	mov qword [rsp+8*37],r8 
	mov r8, [rsp+8*3]
	mov qword [rsp+8*38] ,r8
	mov     rsi, [rsp+8*37]
	mov     rdi, [rsp+8*38]
	call    address
	mov [rsp+8*39], rax
	mov r8, [rsp+8*30]
	mov r9, [rsp+8*39]
	mov qword [r9], r8
	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
L_114:
	
L_112:
	mov r8, [rsp+8*16]
=======
L_109:
	
=======
L_109:
	
>>>>>>> parent of 7ef4276... multiarray
=======
L_109:
	
>>>>>>> parent of 7ef4276... multiarray
=======
L_109:
	
>>>>>>> parent of 7ef4276... multiarray
=======
L_109:
	
>>>>>>> parent of 7ef4276... multiarray
L_107:
	mov r8, [rsp+8*15]
>>>>>>> parent of 7ef4276... multiarray
	add r8, 1
	mov qword [rsp+8*16],r8 
	mov r8, [rsp+8*16]
	sub r8, 1
<<<<<<< HEAD
	mov qword [rsp+8*40],r8 
	jmp L_110
	
L_111:
	
L_109:
	mov r8, [rsp+8*14]
=======
	mov qword [rsp+8*39],r8 
	jmp L_105
	
L_106:
	
L_104:
	mov r8, [rsp+8*13]
>>>>>>> parent of 7ef4276... multiarray
	add r8, 1
	mov qword [rsp+8*14],r8 
	mov r8, [rsp+8*14]
	sub r8, 1
<<<<<<< HEAD
	mov qword [rsp+8*41],r8 
	jmp L_107
	
L_108:
	mov qword [rsp+8*14] ,0
	
L_115:
	mov r8, [rsp+8*14]
=======
	mov qword [rsp+8*40],r8 
	jmp L_102
	
L_103:
	mov qword [rsp+8*13] ,0
	
L_110:
	mov r8, [rsp+8*13]
>>>>>>> parent of 7ef4276... multiarray
	mov r9, [rsp+8*0]
	cmp r8, r9
	mov qword [rsp+8*42], 0
	setl [rsp+8*42]
	mov r8, [rsp+8*42]
	cmp r8, 0
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
	je L_116
	mov r8, [rsp+8*3]
	mov qword [rsp+8*43] ,r8
	mov     rsi, [rsp+8*14]
	mov     rdi, [rsp+8*43]
=======
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
	je L_111
	mov r8, [rsp+8*2]
	mov qword [rsp+8*42] ,r8
	mov     rsi, [rsp+8*13]
	mov     rdi, [rsp+8*42]
>>>>>>> parent of 7ef4276... multiarray
	call    address
	mov [rsp+8*44], rax
	mov r8, [rsp+8*44]
	mov r8, [r8]
	mov [rsp+8*45], r8
	push qword [rsp+8*45]
	pop qword [rsp+8*46]
	mov     rdi, [rsp+8*46]
	call    toString
	mov     qword[rsp+8*47], rax
	push qword [rsp+8*47]
	pop qword [rsp+8*48]
	mov rdi, formatln
	mov rsi,[rsp+8*48] 
	add rsi, 1 
	xor rax, rax
	call printf
	
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
L_117:
	mov r8, [rsp+8*14]
=======
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
L_112:
	mov r8, [rsp+8*13]
>>>>>>> parent of 7ef4276... multiarray
	add r8, 1
	mov qword [rsp+8*14],r8 
	mov r8, [rsp+8*14]
	sub r8, 1
<<<<<<< HEAD
	mov qword [rsp+8*49],r8 
	jmp L_115
	
L_116:
=======
	mov qword [rsp+8*48],r8 
	jmp L_110
	
L_111:
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
=======
>>>>>>> parent of 7ef4276... multiarray
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
	sub    rsp, 400
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
gbl:         resb   400

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	

