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
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD

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
	sub    rsp, 488
	call global_init
	mov qword [gbl+8*0] ,1
=======
mov qword [gbl+8*0] ,233
	mov r8, [gbl+8*0]
	sub r8, 1
	mov qword [gbl+8*1],r8 
	mov r8, [gbl+8*1]
	mov qword [gbl+8*2] ,r8
	mov qword [gbl+8*3] ,1
	mov     rdi, [gbl+8*2]
	call    mallocArray
	mov     qword [gbl+8*4], rax
	mov r8, [gbl+8*4]
	mov qword [gbl+8*5] ,r8
	
main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 480
	mov qword [gbl+8*6] ,1
>>>>>>> parent of 7ef4276... multiarray
=======
mov qword [gbl+8*0] ,233
	mov r8, [gbl+8*0]
	sub r8, 1
	mov qword [gbl+8*1],r8 
	mov r8, [gbl+8*1]
	mov qword [gbl+8*2] ,r8
	mov qword [gbl+8*3] ,1
	mov     rdi, [gbl+8*2]
	call    mallocArray
	mov     qword [gbl+8*4], rax
	mov r8, [gbl+8*4]
	mov qword [gbl+8*5] ,r8
	
main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 480
	mov qword [gbl+8*6] ,1
>>>>>>> parent of 7ef4276... multiarray
=======
mov qword [gbl+8*0] ,233
	mov r8, [gbl+8*0]
	sub r8, 1
	mov qword [gbl+8*1],r8 
	mov r8, [gbl+8*1]
	mov qword [gbl+8*2] ,r8
	mov qword [gbl+8*3] ,1
	mov     rdi, [gbl+8*2]
	call    mallocArray
	mov     qword [gbl+8*4], rax
	mov r8, [gbl+8*4]
	mov qword [gbl+8*5] ,r8
	
main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 480
	mov qword [gbl+8*6] ,1
>>>>>>> parent of 7ef4276... multiarray
=======
mov qword [gbl+8*0] ,233
	mov r8, [gbl+8*0]
	sub r8, 1
	mov qword [gbl+8*1],r8 
	mov r8, [gbl+8*1]
	mov qword [gbl+8*2] ,r8
	mov qword [gbl+8*3] ,1
	mov     rdi, [gbl+8*2]
	call    mallocArray
	mov     qword [gbl+8*4], rax
	mov r8, [gbl+8*4]
	mov qword [gbl+8*5] ,r8
	
main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 480
	mov qword [gbl+8*6] ,1
>>>>>>> parent of 7ef4276... multiarray
=======
mov qword [gbl+8*0] ,233
	mov r8, [gbl+8*0]
	sub r8, 1
	mov qword [gbl+8*1],r8 
	mov r8, [gbl+8*1]
	mov qword [gbl+8*2] ,r8
	mov qword [gbl+8*3] ,1
	mov     rdi, [gbl+8*2]
	call    mallocArray
	mov     qword [gbl+8*4], rax
	mov r8, [gbl+8*4]
	mov qword [gbl+8*5] ,r8
	
main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 480
	mov qword [gbl+8*6] ,1
>>>>>>> parent of 7ef4276... multiarray
	
L_51:
	mov qword [rsp+8*7] ,1
	mov qword [gbl+8*8] ,0
	
L_54:
	mov r8, [gbl+8*8]
	mov r9, [gbl+8*2]
	cmp r8, r9
	mov qword [rsp+8*9], 0
	setl [rsp+8*9]
	mov r8, [rsp+8*9]
	cmp r8, 0
	je L_55
	mov r8, [gbl+8*5]
	mov qword [rsp+8*10] ,r8
	mov     rsi, [gbl+8*8]
	mov     rdi, [rsp+8*10]
	call    address
	mov [rsp+8*11], rax
	mov r8, [gbl+8*3]
	mov r9, [rsp+8*11]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	imul r8, [gbl+8*6]
	mov qword [rsp+8*12],r8 
	xor rdx, rdx
	mov rax, [rsp+8*12]
	mov rbx, [gbl+8*0]
	cdq
	idiv rbx
	mov [rsp+8*13], rdx
	mov r8, [rsp+8*13]
	mov qword [gbl+8*3] ,r8
	mov qword [gbl+8*14] ,0
	
L_57:
	mov r8, [gbl+8*14]
	mov r9, [gbl+8*8]
	cmp r8, r9
	mov qword [rsp+8*15], 0
	setl [rsp+8*15]
	mov r8, [rsp+8*15]
	cmp r8, 0
	je L_58
	mov r8, [gbl+8*5]
	mov qword [rsp+8*16] ,r8
	mov     rsi, [gbl+8*8]
	mov     rdi, [rsp+8*16]
	call    address
	mov [rsp+8*17], rax
	mov r8, [rsp+8*17]
	mov r8, [r8]
	mov [rsp+8*18], r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*19] ,r8
	mov     rsi, [gbl+8*14]
	mov     rdi, [rsp+8*19]
	call    address
	mov [rsp+8*20], rax
	mov r8, [rsp+8*20]
	mov r8, [r8]
	mov [rsp+8*21], r8
	mov r8, [rsp+8*18]
	mov r9, [rsp+8*21]
	cmp r8, r9
	mov qword [rsp+8*22], 0
	sete [rsp+8*22]
	mov r8, [rsp+8*22]
	cmp r8, 0
	je L_61
	mov qword [rsp+8*7] ,0
	jmp L_58
	
L_61:
	
L_59:
	mov r8, [gbl+8*14]
	add r8, 1
	mov qword [gbl+8*14],r8 
	mov r8, [gbl+8*14]
	sub r8, 1
	mov qword [rsp+8*23],r8 
	jmp L_57
	
L_58:
	
L_56:
	mov r8, [gbl+8*8]
	add r8, 1
	mov qword [gbl+8*8],r8 
	mov r8, [gbl+8*8]
	sub r8, 1
	mov qword [rsp+8*24],r8 
	jmp L_54
	
L_55:
	mov r8, [rsp+8*7]
	cmp r8, 0
	je L_63
	jmp L_52
	
L_63:
	
L_53:
	mov r8, [gbl+8*6]
	add r8, 1
	mov qword [gbl+8*6],r8 
	mov r8, [gbl+8*6]
	sub r8, 1
	mov qword [rsp+8*25],r8 
	jmp L_51
	
L_52:
	mov qword [gbl+8*8] ,0
	
L_64:
	mov r8, [gbl+8*8]
	mov r9, [gbl+8*2]
	cmp r8, r9
	mov qword [rsp+8*26], 0
	setl [rsp+8*26]
	mov r8, [rsp+8*26]
	cmp r8, 0
	je L_65
	mov qword [gbl+8*14] ,0
	
L_67:
	mov r8, [gbl+8*14]
	add r8, 1
	mov qword [rsp+8*27],r8 
	mov r8, [rsp+8*27]
	mov r9, [gbl+8*2]
	cmp r8, r9
	mov qword [rsp+8*28], 0
	setl [rsp+8*28]
	mov r8, [rsp+8*28]
	cmp r8, 0
	je L_68
	mov r8, [gbl+8*5]
	mov qword [rsp+8*29] ,r8
	mov     rsi, [gbl+8*14]
	mov     rdi, [rsp+8*29]
	call    address
	mov [rsp+8*30], rax
	mov r8, [rsp+8*30]
	mov r8, [r8]
	mov [rsp+8*31], r8
	mov r8, [gbl+8*14]
	add r8, 1
	mov qword [rsp+8*32],r8 
	mov r8, [gbl+8*5]
	mov qword [rsp+8*33] ,r8
	mov     rsi, [rsp+8*32]
	mov     rdi, [rsp+8*33]
	call    address
	mov [rsp+8*34], rax
	mov r8, [rsp+8*34]
	mov r8, [r8]
	mov [rsp+8*35], r8
	mov r8, [rsp+8*31]
	mov r9, [rsp+8*35]
	cmp r8, r9
	mov qword [rsp+8*36], 0
	setg [rsp+8*36]
	mov r8, [rsp+8*36]
	cmp r8, 0
	je L_71
	mov r8, [gbl+8*5]
	mov qword [rsp+8*37] ,r8
	mov     rsi, [gbl+8*14]
	mov     rdi, [rsp+8*37]
	call    address
	mov [rsp+8*38], rax
	mov r8, [rsp+8*38]
	mov r8, [r8]
	mov [rsp+8*39], r8
	mov r8, [rsp+8*39]
	mov qword [rsp+8*40] ,r8
	mov r8, [gbl+8*14]
	add r8, 1
	mov qword [rsp+8*41],r8 
	mov r8, [gbl+8*5]
	mov qword [rsp+8*42] ,r8
	mov     rsi, [rsp+8*41]
	mov     rdi, [rsp+8*42]
	call    address
	mov [rsp+8*43], rax
	mov r8, [rsp+8*43]
	mov r8, [r8]
	mov [rsp+8*44], r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*45] ,r8
	mov     rsi, [gbl+8*14]
	mov     rdi, [rsp+8*45]
	call    address
	mov [rsp+8*46], rax
	mov r8, [rsp+8*44]
	mov r9, [rsp+8*46]
	mov qword [r9], r8
	mov r8, [gbl+8*14]
	add r8, 1
	mov qword [rsp+8*47],r8 
	mov r8, [gbl+8*5]
	mov qword [rsp+8*48] ,r8
	mov     rsi, [rsp+8*47]
	mov     rdi, [rsp+8*48]
	call    address
	mov [rsp+8*49], rax
	mov r8, [rsp+8*40]
	mov r9, [rsp+8*49]
	mov qword [r9], r8
	
L_71:
	
L_69:
	mov r8, [gbl+8*14]
	add r8, 1
	mov qword [gbl+8*14],r8 
	mov r8, [gbl+8*14]
	sub r8, 1
	mov qword [rsp+8*50],r8 
	jmp L_67
	
L_68:
	
L_66:
	mov r8, [gbl+8*8]
	add r8, 1
	mov qword [gbl+8*8],r8 
	mov r8, [gbl+8*8]
	sub r8, 1
	mov qword [rsp+8*51],r8 
	jmp L_64
	
L_65:
	mov qword [gbl+8*8] ,0
	
L_72:
	mov r8, [gbl+8*8]
	mov r9, [gbl+8*2]
	cmp r8, r9
	mov qword [rsp+8*52], 0
	setl [rsp+8*52]
	mov r8, [rsp+8*52]
	cmp r8, 0
	je L_73
	mov r8, [gbl+8*5]
	mov qword [rsp+8*53] ,r8
	mov     rsi, [gbl+8*8]
	mov     rdi, [rsp+8*53]
	call    address
	mov [rsp+8*54], rax
	mov r8, [rsp+8*54]
	mov r8, [r8]
	mov [rsp+8*55], r8
	push qword [rsp+8*55]
	pop qword [rsp+8*56]
	mov     rdi, [rsp+8*56]
	call    toString
	mov     qword[rsp+8*57], rax
	push qword [rsp+8*57]
	pop qword [rsp+8*58]
	mov rdi, formatln
	mov rsi,[rsp+8*58] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_74:
	mov r8, [gbl+8*8]
	add r8, 1
	mov qword [gbl+8*8],r8 
	mov r8, [gbl+8*8]
	sub r8, 1
	mov qword [rsp+8*59],r8 
	jmp L_72
	
L_73:
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
	sub    rsp, 488
	mov qword [gbl+8*10] ,233
	mov r8, [gbl+8*10]
	sub r8, 1
	mov qword [gbl+8*58],r8 
	mov r8, [gbl+8*58]
	mov qword [gbl+8*3] ,r8
	mov qword [gbl+8*8] ,1
	mov     rdi, 1
	call    mallocArray
	mov     qword [gbl+8*59], rax
	mov     rsi, 0
	mov     rdi, [gbl+8*59]
	call    address
	mov [gbl+8*60], rax
	mov r8, [gbl+8*3]
	mov r9, [gbl+8*60]
	mov qword [r9], r8
	mov     rdi, [gbl+8*59]
	call    multiArray
	mov     qword [gbl+8*59], rax
	mov r8, [gbl+8*59]
	mov qword [gbl+8*5] ,r8
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
gbl:         resb   488

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	

