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
	sub    rsp, 576
	call global_init
	mov [rsp+8*1] , rax
	mov qword [rsp+8*2] ,1
	
L_152:
	mov r8, [rsp+8*2]
	mov r9, [gbl+8*3]
	cmp r8, r9
	mov qword [rsp+8*4], 0
	setle [rsp+8*4]
	mov r8, [rsp+8*4]
	cmp r8, 0
	je L_153
	mov r8, [gbl+8*3]
	add r8, 1
	mov qword [rsp+8*5],r8 
	mov r8, [rsp+8*5]
	sub r8, [rsp+8*2]
	mov qword [rsp+8*6],r8 
	mov r8, [gbl+8*7]
	mov qword [rsp+8*8] ,r8
	mov     rsi, [rsp+8*2]
	mov     rdi, [rsp+8*8]
	call    address
	mov [rsp+8*9], rax
	mov r8, [rsp+8*6]
	mov r9, [rsp+8*9]
	mov qword [r9], r8
	
L_154:
	mov r8, [rsp+8*2]
	add r8, 1
	mov qword [rsp+8*2],r8 
	mov r8, [rsp+8*2]
	sub r8, 1
	mov qword [rsp+8*10],r8 
	jmp L_152
	
L_153:
	mov r8, [gbl+8*3]
	mov qword [gbl+8*11] ,r8
	mov qword [gbl+8*12] ,1
	call qsrt
	mov [rsp+8*13] , rax
	mov qword [rsp+8*2] ,1
	
L_155:
	mov r8, [rsp+8*2]
	mov r9, [gbl+8*3]
	cmp r8, r9
	mov qword [rsp+8*14], 0
	setle [rsp+8*14]
	mov r8, [rsp+8*14]
	cmp r8, 0
	je L_156
	mov r8, [gbl+8*7]
	mov qword [rsp+8*15] ,r8
	mov     rsi, [rsp+8*2]
	mov     rdi, [rsp+8*15]
	call    address
	mov [rsp+8*16], rax
	mov r8, [rsp+8*16]
	mov r8, [r8]
	mov [rsp+8*17], r8
	mov r8, [rsp+8*17]
	mov qword [gbl+8*12] ,r8
	mov r8, [gbl+8*12]
	mov qword [rsp+8*18] ,r8
	mov     rdi, [rsp+8*18]
	call    toString
	mov     qword[rsp+8*19], rax
	mov r8, [rsp+8*19]
	mov qword [gbl+8*12] ,r8
	mov r8, [gbl+8*12]
	mov qword [rsp+8*20] ,r8
	mov rdi, format
	mov rsi,[rsp+8*20] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov qword [gbl+8*12] ,t1386
	mov r8, [gbl+8*12]
	mov qword [rsp+8*21] ,r8
	mov rdi, format
	mov rsi,[rsp+8*21] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_157:
	mov r8, [rsp+8*2]
	add r8, 1
	mov qword [rsp+8*2],r8 
	mov r8, [rsp+8*2]
	sub r8, 1
	mov qword [rsp+8*22],r8 
	jmp L_155
	
L_156:
	mov qword [gbl+8*12] ,t1390
	mov r8, [gbl+8*12]
	mov qword [rsp+8*23] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*23] 
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
	
qsrt:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 576
	mov r8, [gbl+8*12]
	mov qword [rsp+8*24] ,r8
	mov r8, [gbl+8*11]
	mov qword [rsp+8*25] ,r8
	mov r8, [rsp+8*24]
	mov qword [rsp+8*26] ,r8
	mov r8, [rsp+8*25]
	mov qword [rsp+8*27] ,r8
	mov r8, [rsp+8*24]
	add r8, [rsp+8*25]
	mov qword [rsp+8*28],r8 
	xor rdx, rdx
	mov rax, [rsp+8*28]
	mov rbx, 2
	cdq
	idiv rbx
	mov [rsp+8*29], rax
	mov r8, [gbl+8*7]
	mov qword [rsp+8*30] ,r8
	mov     rsi, [rsp+8*29]
	mov     rdi, [rsp+8*30]
	call    address
	mov [rsp+8*31], rax
	mov r8, [rsp+8*31]
	mov r8, [r8]
	mov [rsp+8*32], r8
	mov r8, [rsp+8*32]
	mov qword [rsp+8*33] ,r8
	
L_140:
	mov r8, [rsp+8*26]
	mov r9, [rsp+8*27]
	cmp r8, r9
	mov qword [rsp+8*34], 0
	setle [rsp+8*34]
	mov r8, [rsp+8*34]
	cmp r8, 0
	je L_141
	
L_142:
	mov r8, [gbl+8*7]
	mov qword [rsp+8*35] ,r8
	mov     rsi, [rsp+8*26]
	mov     rdi, [rsp+8*35]
	call    address
	mov [rsp+8*36], rax
	mov r8, [rsp+8*36]
	mov r8, [r8]
	mov [rsp+8*37], r8
	mov r8, [rsp+8*37]
	mov r9, [rsp+8*33]
	cmp r8, r9
	mov qword [rsp+8*38], 0
	setl [rsp+8*38]
	mov r8, [rsp+8*38]
	cmp r8, 0
	je L_143
	mov r8, [rsp+8*26]
	add r8, 1
	mov qword [rsp+8*26],r8 
	mov r8, [rsp+8*26]
	sub r8, 1
	mov qword [rsp+8*39],r8 
	jmp L_142
	
L_143:
	
L_144:
	mov r8, [gbl+8*7]
	mov qword [rsp+8*40] ,r8
	mov     rsi, [rsp+8*27]
	mov     rdi, [rsp+8*40]
	call    address
	mov [rsp+8*41], rax
	mov r8, [rsp+8*41]
	mov r8, [r8]
	mov [rsp+8*42], r8
	mov r8, [rsp+8*42]
	mov r9, [rsp+8*33]
	cmp r8, r9
	mov qword [rsp+8*43], 0
	setg [rsp+8*43]
	mov r8, [rsp+8*43]
	cmp r8, 0
	je L_145
	mov r8, [rsp+8*27]
	sub r8, 1
	mov qword [rsp+8*27],r8 
	mov r8, [rsp+8*27]
	add r8, 1
	mov qword [rsp+8*44],r8 
	jmp L_144
	
L_145:
	mov r8, [rsp+8*26]
	mov r9, [rsp+8*27]
	cmp r8, r9
	mov qword [rsp+8*45], 0
	setle [rsp+8*45]
	mov r8, [rsp+8*45]
	cmp r8, 0
	je L_147
	mov r8, [gbl+8*7]
	mov qword [rsp+8*46] ,r8
	mov     rsi, [rsp+8*26]
	mov     rdi, [rsp+8*46]
	call    address
	mov [rsp+8*47], rax
	mov r8, [rsp+8*47]
	mov r8, [r8]
	mov [rsp+8*48], r8
	mov r8, [rsp+8*48]
	mov qword [rsp+8*49] ,r8
	mov r8, [gbl+8*7]
	mov qword [rsp+8*50] ,r8
	mov     rsi, [rsp+8*27]
	mov     rdi, [rsp+8*50]
	call    address
	mov [rsp+8*51], rax
	mov r8, [rsp+8*51]
	mov r8, [r8]
	mov [rsp+8*52], r8
	mov r8, [gbl+8*7]
	mov qword [rsp+8*53] ,r8
	mov     rsi, [rsp+8*26]
	mov     rdi, [rsp+8*53]
	call    address
	mov [rsp+8*54], rax
	mov r8, [rsp+8*52]
	mov r9, [rsp+8*54]
	mov qword [r9], r8
	mov r8, [gbl+8*7]
	mov qword [rsp+8*55] ,r8
	mov     rsi, [rsp+8*27]
	mov     rdi, [rsp+8*55]
	call    address
	mov [rsp+8*56], rax
	mov r8, [rsp+8*49]
	mov r9, [rsp+8*56]
	mov qword [r9], r8
	mov r8, [rsp+8*26]
	add r8, 1
	mov qword [rsp+8*26],r8 
	mov r8, [rsp+8*26]
	sub r8, 1
	mov qword [rsp+8*57],r8 
	mov r8, [rsp+8*27]
	sub r8, 1
	mov qword [rsp+8*27],r8 
	mov r8, [rsp+8*27]
	add r8, 1
	mov qword [rsp+8*58],r8 
	
L_147:
	jmp L_140
	
L_141:
	mov r8, [rsp+8*24]
	mov r9, [rsp+8*27]
	cmp r8, r9
	mov qword [rsp+8*59], 0
	setl [rsp+8*59]
	mov r8, [rsp+8*59]
	cmp r8, 0
	je L_149
	mov r8, [rsp+8*27]
	mov qword [gbl+8*11] ,r8
	mov r8, [rsp+8*24]
	mov qword [gbl+8*12] ,r8
	call qsrt
	mov [rsp+8*60] , rax
	
L_149:
	mov r8, [rsp+8*26]
	mov r9, [rsp+8*25]
	cmp r8, r9
	mov qword [rsp+8*61], 0
	setl [rsp+8*61]
	mov r8, [rsp+8*61]
	cmp r8, 0
	je L_151
	mov r8, [rsp+8*25]
	mov qword [gbl+8*11] ,r8
	mov r8, [rsp+8*26]
	mov qword [gbl+8*12] ,r8
	call qsrt
	mov [rsp+8*62] , rax
	
L_151:
	mov rax,0
	leave
	ret
	mov rax,0
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 576
	mov     rdi, 11
	call    mallocArray
	mov     qword [gbl+8*63], rax
	mov r8, [gbl+8*63]
	mov qword [gbl+8*7] ,r8
	mov qword [gbl+8*3] ,4
	mov rax,[rsp+8*64]
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   2560

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	
t1390:
	 db 0,"" ,0

t1386:
	 db 1," " ,0


