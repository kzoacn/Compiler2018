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
	sub    rsp, 480
	mov qword [gbl+8*0] ,1
	
L_51:
	mov qword [rsp+8*1] ,1
	mov qword [gbl+8*2] ,0
	
L_54:
	mov r8, [gbl+8*2]
	mov r9, [gbl+8*3]
	cmp r8, r9
	mov qword [rsp+8*4], 0
	setl [rsp+8*4]
	mov r8, [rsp+8*4]
	cmp r8, 0
	je L_55
	mov r8, [gbl+8*5]
	mov qword [rsp+8*6] ,r8
	mov     rsi, [gbl+8*2]
	mov     rdi, [rsp+8*6]
	call    address
	mov [rsp+8*7], rax
	mov r8, [gbl+8*8]
	mov r9, [rsp+8*7]
	mov qword [r9], r8
	mov r8, [gbl+8*8]
	imul r8, [gbl+8*0]
	mov qword [rsp+8*9],r8 
	xor rdx, rdx
	mov rax, [rsp+8*9]
	mov rbx, [gbl+8*10]
	cdq
	idiv rbx
	mov [rsp+8*11], rdx
	mov r8, [rsp+8*11]
	mov qword [gbl+8*8] ,r8
	mov qword [gbl+8*12] ,0
	
L_57:
	mov r8, [gbl+8*12]
	mov r9, [gbl+8*2]
	cmp r8, r9
	mov qword [rsp+8*13], 0
	setl [rsp+8*13]
	mov r8, [rsp+8*13]
	cmp r8, 0
	je L_58
	mov r8, [gbl+8*5]
	mov qword [rsp+8*14] ,r8
	mov     rsi, [gbl+8*2]
	mov     rdi, [rsp+8*14]
	call    address
	mov [rsp+8*15], rax
	mov r8, [rsp+8*15]
	mov r8, [r8]
	mov [rsp+8*16], r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*17] ,r8
	mov     rsi, [gbl+8*12]
	mov     rdi, [rsp+8*17]
	call    address
	mov [rsp+8*18], rax
	mov r8, [rsp+8*18]
	mov r8, [r8]
	mov [rsp+8*19], r8
	mov r8, [rsp+8*16]
	mov r9, [rsp+8*19]
	cmp r8, r9
	mov qword [rsp+8*20], 0
	sete [rsp+8*20]
	mov r8, [rsp+8*20]
	cmp r8, 0
	je L_61
	mov qword [rsp+8*1] ,0
	jmp L_58
	
L_61:
	
L_59:
	mov r8, [gbl+8*12]
	add r8, 1
	mov qword [gbl+8*12],r8 
	mov r8, [gbl+8*12]
	sub r8, 1
	mov qword [rsp+8*21],r8 
	jmp L_57
	
L_58:
	
L_56:
	mov r8, [gbl+8*2]
	add r8, 1
	mov qword [gbl+8*2],r8 
	mov r8, [gbl+8*2]
	sub r8, 1
	mov qword [rsp+8*22],r8 
	jmp L_54
	
L_55:
	mov r8, [rsp+8*1]
	cmp r8, 0
	je L_63
	jmp L_52
	
L_63:
	
L_53:
	mov r8, [gbl+8*0]
	add r8, 1
	mov qword [gbl+8*0],r8 
	mov r8, [gbl+8*0]
	sub r8, 1
	mov qword [rsp+8*23],r8 
	jmp L_51
	
L_52:
	mov qword [gbl+8*2] ,0
	
L_64:
	mov r8, [gbl+8*2]
	mov r9, [gbl+8*3]
	cmp r8, r9
	mov qword [rsp+8*24], 0
	setl [rsp+8*24]
	mov r8, [rsp+8*24]
	cmp r8, 0
	je L_65
	mov qword [gbl+8*12] ,0
	
L_67:
	mov r8, [gbl+8*12]
	add r8, 1
	mov qword [rsp+8*25],r8 
	mov r8, [rsp+8*25]
	mov r9, [gbl+8*3]
	cmp r8, r9
	mov qword [rsp+8*26], 0
	setl [rsp+8*26]
	mov r8, [rsp+8*26]
	cmp r8, 0
	je L_68
	mov r8, [gbl+8*5]
	mov qword [rsp+8*27] ,r8
	mov     rsi, [gbl+8*12]
	mov     rdi, [rsp+8*27]
	call    address
	mov [rsp+8*28], rax
	mov r8, [rsp+8*28]
	mov r8, [r8]
	mov [rsp+8*29], r8
	mov r8, [gbl+8*12]
	add r8, 1
	mov qword [rsp+8*30],r8 
	mov r8, [gbl+8*5]
	mov qword [rsp+8*31] ,r8
	mov     rsi, [rsp+8*30]
	mov     rdi, [rsp+8*31]
	call    address
	mov [rsp+8*32], rax
	mov r8, [rsp+8*32]
	mov r8, [r8]
	mov [rsp+8*33], r8
	mov r8, [rsp+8*29]
	mov r9, [rsp+8*33]
	cmp r8, r9
	mov qword [rsp+8*34], 0
	setg [rsp+8*34]
	mov r8, [rsp+8*34]
	cmp r8, 0
	je L_71
	mov r8, [gbl+8*5]
	mov qword [rsp+8*35] ,r8
	mov     rsi, [gbl+8*12]
	mov     rdi, [rsp+8*35]
	call    address
	mov [rsp+8*36], rax
	mov r8, [rsp+8*36]
	mov r8, [r8]
	mov [rsp+8*37], r8
	mov r8, [rsp+8*37]
	mov qword [rsp+8*38] ,r8
	mov r8, [gbl+8*12]
	add r8, 1
	mov qword [rsp+8*39],r8 
	mov r8, [gbl+8*5]
	mov qword [rsp+8*40] ,r8
	mov     rsi, [rsp+8*39]
	mov     rdi, [rsp+8*40]
	call    address
	mov [rsp+8*41], rax
	mov r8, [rsp+8*41]
	mov r8, [r8]
	mov [rsp+8*42], r8
	mov r8, [gbl+8*5]
	mov qword [rsp+8*43] ,r8
	mov     rsi, [gbl+8*12]
	mov     rdi, [rsp+8*43]
	call    address
	mov [rsp+8*44], rax
	mov r8, [rsp+8*42]
	mov r9, [rsp+8*44]
	mov qword [r9], r8
	mov r8, [gbl+8*12]
	add r8, 1
	mov qword [rsp+8*45],r8 
	mov r8, [gbl+8*5]
	mov qword [rsp+8*46] ,r8
	mov     rsi, [rsp+8*45]
	mov     rdi, [rsp+8*46]
	call    address
	mov [rsp+8*47], rax
	mov r8, [rsp+8*38]
	mov r9, [rsp+8*47]
	mov qword [r9], r8
	
L_71:
	
L_69:
	mov r8, [gbl+8*12]
	add r8, 1
	mov qword [gbl+8*12],r8 
	mov r8, [gbl+8*12]
	sub r8, 1
	mov qword [rsp+8*48],r8 
	jmp L_67
	
L_68:
	
L_66:
	mov r8, [gbl+8*2]
	add r8, 1
	mov qword [gbl+8*2],r8 
	mov r8, [gbl+8*2]
	sub r8, 1
	mov qword [rsp+8*49],r8 
	jmp L_64
	
L_65:
	mov qword [gbl+8*2] ,0
	
L_72:
	mov r8, [gbl+8*2]
	mov r9, [gbl+8*3]
	cmp r8, r9
	mov qword [rsp+8*50], 0
	setl [rsp+8*50]
	mov r8, [rsp+8*50]
	cmp r8, 0
	je L_73
	mov r8, [gbl+8*5]
	mov qword [rsp+8*51] ,r8
	mov     rsi, [gbl+8*2]
	mov     rdi, [rsp+8*51]
	call    address
	mov [rsp+8*52], rax
	mov r8, [rsp+8*52]
	mov r8, [r8]
	mov [rsp+8*53], r8
	push qword [rsp+8*53]
	pop qword [rsp+8*54]
	mov     rdi, [rsp+8*54]
	call    toString
	mov     qword[rsp+8*55], rax
	push qword [rsp+8*55]
	pop qword [rsp+8*56]
	mov rdi, formatln
	mov rsi,[rsp+8*56] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_74:
	mov r8, [gbl+8*2]
	add r8, 1
	mov qword [gbl+8*2],r8 
	mov r8, [gbl+8*2]
	sub r8, 1
	mov qword [rsp+8*57],r8 
	jmp L_72
	
L_73:
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
	sub    rsp, 480
	mov qword [gbl+8*10] ,233
	mov r8, [gbl+8*10]
	sub r8, 1
	mov qword [gbl+8*58],r8 
	mov r8, [gbl+8*58]
	mov qword [gbl+8*3] ,r8
	mov qword [gbl+8*8] ,1
	mov     rdi, [gbl+8*3]
	call    mallocArray
	mov     qword [gbl+8*59], rax
	mov r8, [gbl+8*59]
	mov qword [gbl+8*5] ,r8
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   480

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	

