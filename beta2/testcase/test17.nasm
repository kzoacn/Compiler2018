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
	sub    rsp, 344
	call global_init
	mov qword [rsp+8*0] ,7
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
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*4], rax
	mov     rsi, 0
	mov     rdi, [rsp+8*4]
	call    address
	mov [rsp+8*5], rax
	mov r8, 2
	mov r9, [rsp+8*5]
	mov qword [r9], r8
	mov     rdi, [rsp+8*4]
	call    multiArray
	mov     qword [rsp+8*4], rax
	mov r8, [rsp+8*3]
	mov qword [rsp+8*6] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*6]
	call    address
	mov [rsp+8*7], rax
	mov r8, [rsp+8*4]
	mov r9, [rsp+8*7]
	mov qword [r9], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*8] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*8]
	call    address
	mov [rsp+8*9], rax
	mov r8, [rsp+8*9]
	mov r8, [r8]
	mov [rsp+8*8], r8
	mov     rsi, 0
	mov     rdi, [rsp+8*8]
	call    address
	mov [rsp+8*9], rax
	mov r8, 1
	mov r9, [rsp+8*9]
	mov qword [r9], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*10] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*10]
	call    address
	mov [rsp+8*11], rax
	mov r8, [rsp+8*11]
	mov r8, [r8]
	mov [rsp+8*10], r8
	mov     rsi, 1
	mov     rdi, [rsp+8*10]
	call    address
	mov [rsp+8*11], rax
	mov r8, 0
	mov r9, [rsp+8*11]
	mov qword [r9], r8
	mov qword [rsp+8*12] ,1
	
L_89:
	mov r8, [rsp+8*12]
	mov r9, [rsp+8*0]
	cmp r8, r9
	mov qword [rsp+8*13], 0
	setl [rsp+8*13]
	mov r8, [rsp+8*13]
	cmp r8, 0
	je L_90
	mov r8, [rsp+8*12]
	add r8, 2
	mov qword [rsp+8*14],r8 
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*15], rax
	mov     rsi, 0
	mov     rdi, [rsp+8*15]
	call    address
	mov [rsp+8*16], rax
	mov r8, [rsp+8*14]
	mov r9, [rsp+8*16]
	mov qword [r9], r8
	mov     rdi, [rsp+8*15]
	call    multiArray
	mov     qword [rsp+8*15], rax
	mov r8, [rsp+8*3]
	mov qword [rsp+8*17] ,r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*17]
	call    address
	mov [rsp+8*18], rax
	mov r8, [rsp+8*15]
	mov r9, [rsp+8*18]
	mov qword [r9], r8
	mov r8, [rsp+8*3]
	mov qword [rsp+8*19] ,r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*19]
	call    address
	mov [rsp+8*20], rax
	mov r8, [rsp+8*20]
	mov r8, [r8]
	mov [rsp+8*19], r8
	mov     rsi, 0
	mov     rdi, [rsp+8*19]
	call    address
	mov [rsp+8*20], rax
	mov r8, 1
	mov r9, [rsp+8*20]
	mov qword [r9], r8
	mov qword [rsp+8*21] ,1
	
L_92:
	mov r8, [rsp+8*21]
	mov r9, [rsp+8*12]
	cmp r8, r9
	mov qword [rsp+8*22], 0
	setle [rsp+8*22]
	mov r8, [rsp+8*22]
	cmp r8, 0
	je L_93
	mov r8, [rsp+8*12]
	sub r8, 1
	mov qword [rsp+8*23],r8 
	mov r8, [rsp+8*3]
	mov qword [rsp+8*24] ,r8
	mov     rsi, [rsp+8*23]
	mov     rdi, [rsp+8*24]
	call    address
	mov [rsp+8*25], rax
	mov r8, [rsp+8*25]
	mov r8, [r8]
	mov [rsp+8*24], r8
	mov     rsi, [rsp+8*21]
	mov     rdi, [rsp+8*24]
	call    address
	mov [rsp+8*25], rax
	mov r8, [rsp+8*25]
	mov r8, [r8]
	mov [rsp+8*26], r8
	mov r8, [rsp+8*12]
	sub r8, 1
	mov qword [rsp+8*27],r8 
	mov r8, [rsp+8*21]
	sub r8, 1
	mov qword [rsp+8*28],r8 
	mov r8, [rsp+8*3]
	mov qword [rsp+8*29] ,r8
	mov     rsi, [rsp+8*27]
	mov     rdi, [rsp+8*29]
	call    address
	mov [rsp+8*30], rax
	mov r8, [rsp+8*30]
	mov r8, [r8]
	mov [rsp+8*29], r8
	mov     rsi, [rsp+8*28]
	mov     rdi, [rsp+8*29]
	call    address
	mov [rsp+8*30], rax
	mov r8, [rsp+8*30]
	mov r8, [r8]
	mov [rsp+8*31], r8
	mov r8, [rsp+8*26]
	add r8, [rsp+8*31]
	mov qword [rsp+8*32],r8 
	mov r8, [rsp+8*3]
	mov qword [rsp+8*33] ,r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*33]
	call    address
	mov [rsp+8*34], rax
	mov r8, [rsp+8*34]
	mov r8, [r8]
	mov [rsp+8*33], r8
	mov     rsi, [rsp+8*21]
	mov     rdi, [rsp+8*33]
	call    address
	mov [rsp+8*34], rax
	mov r8, [rsp+8*32]
	mov r9, [rsp+8*34]
	mov qword [r9], r8
	
L_94:
	mov r8, [rsp+8*21]
	add r8, 1
	mov qword [rsp+8*21],r8 
	mov r8, [rsp+8*21]
	sub r8, 1
	mov qword [rsp+8*35],r8 
	jmp L_92
	
L_93:
	
L_91:
	mov r8, [rsp+8*12]
	add r8, 1
	mov qword [rsp+8*12],r8 
	mov r8, [rsp+8*12]
	mov qword [rsp+8*36] ,r8
	jmp L_89
	
L_90:
	mov r8, [rsp+8*3]
	mov qword [rsp+8*37] ,r8
	mov     rsi, 6
	mov     rdi, [rsp+8*37]
	call    address
	mov [rsp+8*38], rax
	mov r8, [rsp+8*38]
	mov r8, [r8]
	mov [rsp+8*37], r8
	mov     rsi, 3
	mov     rdi, [rsp+8*37]
	call    address
	mov [rsp+8*38], rax
	mov r8, [rsp+8*38]
	mov r8, [r8]
	mov [rsp+8*39], r8
	push qword [rsp+8*39]
	pop qword [rsp+8*40]
	mov     rdi, [rsp+8*40]
	call    toString
	mov     qword[rsp+8*41], rax
	push qword [rsp+8*41]
	pop qword [rsp+8*42]
	mov rdi, formatln
	mov rsi,[rsp+8*42] 
	add rsi, 1 
	xor rax, rax
	call printf
	push qword 0
	leave
	ret
	push qword 0
	leave
	ret
	jmp QED
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 344
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   344

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	

