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
	call global_init
	push   rbp
	mov    rbp, rsp
	sub    rsp, 368
	mov qword [rsp+8*0] ,12
	mov qword [rsp+8*1] ,7
	mov r8, [rsp+8*0]
	add r8, [rsp+8*1]
	mov qword [rsp+8*2],r8 
	push qword [rsp+8*2]
	pop qword [rsp+8*3]
	mov     rdi, [rsp+8*3]
	call    toString
	mov     qword[rsp+8*4], rax
	push qword [rsp+8*4]
	pop qword [rsp+8*5]
	mov rdi, formatln
	mov rsi,[rsp+8*5] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*0]
	sub r8, [rsp+8*1]
	mov qword [rsp+8*6],r8 
	push qword [rsp+8*6]
	pop qword [rsp+8*7]
	mov     rdi, [rsp+8*7]
	call    toString
	mov     qword[rsp+8*8], rax
	push qword [rsp+8*8]
	pop qword [rsp+8*9]
	mov rdi, formatln
	mov rsi,[rsp+8*9] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*0]
	imul r8, [rsp+8*1]
	mov qword [rsp+8*10],r8 
	push qword [rsp+8*10]
	pop qword [rsp+8*11]
	mov     rdi, [rsp+8*11]
	call    toString
	mov     qword[rsp+8*12], rax
	push qword [rsp+8*12]
	pop qword [rsp+8*13]
	mov rdi, formatln
	mov rsi,[rsp+8*13] 
	add rsi, 1 
	xor rax, rax
	call printf
	xor rdx, rdx
	mov rax, [rsp+8*0]
	mov rbx, [rsp+8*1]
	cdq
	idiv rbx
	mov [rsp+8*14], rax
	push qword [rsp+8*14]
	pop qword [rsp+8*15]
	mov     rdi, [rsp+8*15]
	call    toString
	mov     qword[rsp+8*16], rax
	push qword [rsp+8*16]
	pop qword [rsp+8*17]
	mov rdi, formatln
	mov rsi,[rsp+8*17] 
	add rsi, 1 
	xor rax, rax
	call printf
	xor rdx, rdx
	mov rax, [rsp+8*0]
	mov rbx, [rsp+8*1]
	cdq
	idiv rbx
	mov [rsp+8*18], rdx
	push qword [rsp+8*18]
	pop qword [rsp+8*19]
	mov     rdi, [rsp+8*19]
	call    toString
	mov     qword[rsp+8*20], rax
	push qword [rsp+8*20]
	pop qword [rsp+8*21]
	mov rdi, formatln
	mov rsi,[rsp+8*21] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*0]
	and r8, [rsp+8*1]
	mov qword [rsp+8*22],r8 
	push qword [rsp+8*22]
	pop qword [rsp+8*23]
	mov     rdi, [rsp+8*23]
	call    toString
	mov     qword[rsp+8*24], rax
	push qword [rsp+8*24]
	pop qword [rsp+8*25]
	mov rdi, formatln
	mov rsi,[rsp+8*25] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*0]
	or r8, [rsp+8*1]
	mov qword [rsp+8*26],r8 
	push qword [rsp+8*26]
	pop qword [rsp+8*27]
	mov     rdi, [rsp+8*27]
	call    toString
	mov     qword[rsp+8*28], rax
	push qword [rsp+8*28]
	pop qword [rsp+8*29]
	mov rdi, formatln
	mov rsi,[rsp+8*29] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*0]
	xor r8, [rsp+8*1]
	mov qword [rsp+8*30],r8 
	push qword [rsp+8*30]
	pop qword [rsp+8*31]
	mov     rdi, [rsp+8*31]
	call    toString
	mov     qword[rsp+8*32], rax
	push qword [rsp+8*32]
	pop qword [rsp+8*33]
	mov rdi, formatln
	mov rsi,[rsp+8*33] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*0]
	mov qword [rsp+8*34], 0
	cmp r8, 0
	sete [rsp+8*34]
	push qword [rsp+8*34]
	pop qword [rsp+8*35]
	mov     rdi, [rsp+8*35]
	call    toString
	mov     qword[rsp+8*36], rax
	push qword [rsp+8*36]
	pop qword [rsp+8*37]
	mov rdi, formatln
	mov rsi,[rsp+8*37] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*0]
	neg r8
	mov [rsp+8*38], r8
	push qword [rsp+8*38]
	pop qword [rsp+8*39]
	mov     rdi, [rsp+8*39]
	call    toString
	mov     qword[rsp+8*40], rax
	push qword [rsp+8*40]
	pop qword [rsp+8*41]
	mov rdi, formatln
	mov rsi,[rsp+8*41] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [rsp+8*0]
	not r8
	mov [rsp+8*42], r8
	push qword [rsp+8*42]
	pop qword [rsp+8*43]
	mov     rdi, [rsp+8*43]
	call    toString
	mov     qword[rsp+8*44], rax
	push qword [rsp+8*44]
	pop qword [rsp+8*45]
	mov rdi, formatln
	mov rsi,[rsp+8*45] 
	add rsi, 1 
	xor rax, rax
	call printf
	push qword 0
	leave
	ret
	jmp QED
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 368
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   368

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	

