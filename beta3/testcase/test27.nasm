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
        movzx   edx, al
        mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        movzx   eax, al
        add     eax, edx
        add     eax, 2
        cdqe
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-18H], rax
        mov     rax, qword [rbp-28H]
        movzx   edx, byte [rax]
        mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        add     edx, eax
        mov     rax, qword [rbp-18H]
        mov     byte [rax], dl
        mov     qword [rbp-8H], 0
        mov     qword [rbp-10H], 0
        mov     qword [rbp-8H], 0
        jmp     cc_002

cc_001:  add     qword [rbp-10H], 1
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
cc_002:  mov     rax, qword [rbp-28H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      cc_001
        mov     qword [rbp-8H], 0
        jmp     cc_004

cc_003:  add     qword [rbp-10H], 1
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
cc_004:  mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      cc_003
        add     qword [rbp-10H], 1
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        mov     byte [rax], 0
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
	sub    rsp, 720
	call global_init
	mov [rsp+8*1] , rax
	mov qword [rsp+8*2] ,0
	
L_280:
	mov r8, [rsp+8*2]
	mov r9, 2
	cmp r8, r9
	mov qword [rsp+8*3], 0
	setl [rsp+8*3]
	mov r8, [rsp+8*3]
	cmp r8, 0
	je L_281
	mov r8, 8
	add r8, 8
	mov qword [rsp+8*4],r8 
	mov r8, [rsp+8*4]
	sub r8, 1
	mov qword [rsp+8*5],r8 
	mov     rdi, [rsp+8*5]
	call    mallocArray
	mov     qword [rsp+8*6], rax
	mov r8, [gbl+8*7]
	mov qword [rsp+8*8] ,r8
	mov     rsi, [rsp+8*2]
	mov     rdi, [rsp+8*8]
	call    address
	mov [rsp+8*9], rax
	mov r8, [rsp+8*6]
	mov r9, [rsp+8*9]
	mov qword [r9], r8
	
L_282:
	mov r8, [rsp+8*2]
	add r8, 1
	mov qword [rsp+8*2],r8 
	mov r8, [rsp+8*2]
	sub r8, 1
	mov qword [rsp+8*10],r8 
	jmp L_280
	
L_281:
	mov qword [gbl+8*11] ,0
	call search
	mov [rsp+8*12] , rax
	mov rax,0
	leave
	ret
	mov rax,0
	leave
	ret
	jmp QED
	mov r8, [rsp+8*13]
	add r8, [rsp+8*13]
	mov qword [rsp+8*13],r8 
	
printBoard:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 720
	mov qword [rsp+8*14] ,0
	
L_261:
	mov r8, [rsp+8*14]
	mov r9, [gbl+8*15]
	cmp r8, r9
	mov qword [rsp+8*16], 0
	setl [rsp+8*16]
	mov r8, [rsp+8*16]
	cmp r8, 0
	je L_262
	mov qword [rsp+8*17] ,0
	
L_264:
	mov r8, [rsp+8*17]
	mov r9, [gbl+8*15]
	cmp r8, r9
	mov qword [rsp+8*18], 0
	setl [rsp+8*18]
	mov r8, [rsp+8*18]
	cmp r8, 0
	je L_265
	mov r8, [gbl+8*19]
	mov qword [rsp+8*20] ,r8
	mov     rsi, [rsp+8*14]
	mov     rdi, [rsp+8*20]
	call    address
	mov [rsp+8*21], rax
	mov r8, [rsp+8*21]
	mov r8, [r8]
	mov [rsp+8*22], r8
	mov r8, [rsp+8*22]
	mov r9, [rsp+8*17]
	cmp r8, r9
	mov qword [rsp+8*23], 0
	sete [rsp+8*23]
	mov r8, [rsp+8*23]
	cmp r8, 0
	je L_267
	mov qword [gbl+8*11] ,t2062
	mov r8, [gbl+8*11]
	mov qword [rsp+8*24] ,r8
	mov rdi, format
	mov rsi,[rsp+8*24] 
	add rsi, 1 
	xor rax, rax
	call printf
	jmp L_268
	
L_267:
	mov qword [gbl+8*11] ,t2066
	mov r8, [gbl+8*11]
	mov qword [rsp+8*25] ,r8
	mov rdi, format
	mov rsi,[rsp+8*25] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_268:
	
L_266:
	mov r8, [rsp+8*17]
	add r8, 1
	mov qword [rsp+8*17],r8 
	mov r8, [rsp+8*17]
	sub r8, 1
	mov qword [rsp+8*26],r8 
	jmp L_264
	
L_265:
	mov qword [gbl+8*11] ,t2070
	mov r8, [gbl+8*11]
	mov qword [rsp+8*27] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*27] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_263:
	mov r8, [rsp+8*14]
	add r8, 1
	mov qword [rsp+8*14],r8 
	mov r8, [rsp+8*14]
	sub r8, 1
	mov qword [rsp+8*28],r8 
	jmp L_261
	
L_262:
	mov qword [gbl+8*11] ,t2074
	mov r8, [gbl+8*11]
	mov qword [rsp+8*29] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*29] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov rax,0
	leave
	ret
	mov r8, [rsp+8*13]
	add r8, [rsp+8*13]
	mov qword [rsp+8*13],r8 
	
search:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 720
	mov r8, [gbl+8*11]
	mov qword [rsp+8*30] ,r8
	mov r8, [rsp+8*30]
	mov r9, [gbl+8*15]
	cmp r8, r9
	mov qword [rsp+8*31], 0
	sete [rsp+8*31]
	mov r8, [rsp+8*31]
	cmp r8, 0
	je L_269
	call printBoard
	mov [rsp+8*32] , rax
	jmp L_270
	
L_269:
	mov qword [rsp+8*33] ,0
	
L_271:
	mov r8, [rsp+8*33]
	mov r9, [gbl+8*15]
	cmp r8, r9
	mov qword [rsp+8*34], 0
	setl [rsp+8*34]
	mov r8, [rsp+8*34]
	cmp r8, 0
	je L_272
	mov r8, [gbl+8*35]
	mov qword [rsp+8*36] ,r8
	mov     rsi, [rsp+8*33]
	mov     rdi, [rsp+8*36]
	call    address
	mov [rsp+8*37], rax
	mov r8, [rsp+8*37]
	mov r8, [r8]
	mov [rsp+8*38], r8
	mov r8, [rsp+8*38]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*39], 0
	sete [rsp+8*39]
	mov r8, [rsp+8*39]
	cmp r8, 0
	je L_275
	mov r8, [rsp+8*33]
	add r8, [rsp+8*30]
	mov qword [rsp+8*40],r8 
	mov r8, [gbl+8*7]
	mov qword [rsp+8*41] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*41]
	call    address
	mov [rsp+8*42], rax
	mov r8, [rsp+8*42]
	mov r8, [r8]
	mov [rsp+8*41], r8
	mov     rsi, [rsp+8*40]
	mov     rdi, [rsp+8*41]
	call    address
	mov [rsp+8*42], rax
	mov r8, [rsp+8*42]
	mov r8, [r8]
	mov [rsp+8*43], r8
	mov r8, [rsp+8*43]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*44], 0
	sete [rsp+8*44]
	mov r8, [rsp+8*44]
	cmp r8, 0
	je L_277
	mov r8, [rsp+8*33]
	add r8, [gbl+8*15]
	mov qword [rsp+8*45],r8 
	mov r8, [rsp+8*45]
	sub r8, 1
	mov qword [rsp+8*46],r8 
	mov r8, [rsp+8*46]
	sub r8, [rsp+8*30]
	mov qword [rsp+8*47],r8 
	mov r8, [gbl+8*7]
	mov qword [rsp+8*48] ,r8
	mov     rsi, 1
	mov     rdi, [rsp+8*48]
	call    address
	mov [rsp+8*49], rax
	mov r8, [rsp+8*49]
	mov r8, [r8]
	mov [rsp+8*48], r8
	mov     rsi, [rsp+8*47]
	mov     rdi, [rsp+8*48]
	call    address
	mov [rsp+8*49], rax
	mov r8, [rsp+8*49]
	mov r8, [r8]
	mov [rsp+8*50], r8
	mov r8, [rsp+8*50]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*51], 0
	sete [rsp+8*51]
	mov r8, [rsp+8*51]
	cmp r8, 0
	je L_279
	mov r8, [rsp+8*33]
	add r8, [gbl+8*15]
	mov qword [rsp+8*52],r8 
	mov r8, [rsp+8*52]
	sub r8, 1
	mov qword [rsp+8*53],r8 
	mov r8, [rsp+8*53]
	sub r8, [rsp+8*30]
	mov qword [rsp+8*54],r8 
	mov r8, [gbl+8*7]
	mov qword [rsp+8*55] ,r8
	mov     rsi, 1
	mov     rdi, [rsp+8*55]
	call    address
	mov [rsp+8*56], rax
	mov r8, [rsp+8*56]
	mov r8, [r8]
	mov [rsp+8*55], r8
	mov     rsi, [rsp+8*54]
	mov     rdi, [rsp+8*55]
	call    address
	mov [rsp+8*56], rax
	mov r8, 1
	mov r9, [rsp+8*56]
	mov qword [r9], r8
	mov r8, [rsp+8*33]
	add r8, [rsp+8*30]
	mov qword [rsp+8*57],r8 
	mov r8, [gbl+8*7]
	mov qword [rsp+8*58] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*58]
	call    address
	mov [rsp+8*59], rax
	mov r8, [rsp+8*59]
	mov r8, [r8]
	mov [rsp+8*58], r8
	mov     rsi, [rsp+8*57]
	mov     rdi, [rsp+8*58]
	call    address
	mov [rsp+8*59], rax
	mov r8, 1
	mov r9, [rsp+8*59]
	mov qword [r9], r8
	mov r8, [gbl+8*35]
	mov qword [rsp+8*60] ,r8
	mov     rsi, [rsp+8*33]
	mov     rdi, [rsp+8*60]
	call    address
	mov [rsp+8*61], rax
	mov r8, 1
	mov r9, [rsp+8*61]
	mov qword [r9], r8
	mov r8, [gbl+8*19]
	mov qword [rsp+8*62] ,r8
	mov     rsi, [rsp+8*30]
	mov     rdi, [rsp+8*62]
	call    address
	mov [rsp+8*63], rax
	mov r8, [rsp+8*33]
	mov r9, [rsp+8*63]
	mov qword [r9], r8
	mov r8, [rsp+8*30]
	add r8, 1
	mov qword [rsp+8*64],r8 
	mov r8, [rsp+8*64]
	mov qword [gbl+8*11] ,r8
	call search
	mov [rsp+8*65] , rax
	mov qword [gbl+8*11] ,1
	mov r8, [gbl+8*11]
	mov qword [rsp+8*66] ,r8
	mov     rdi, [rsp+8*66]
	call    toString
	mov     qword[rsp+8*67], rax
	mov r8, [gbl+8*35]
	mov qword [rsp+8*68] ,r8
	mov     rsi, [rsp+8*33]
	mov     rdi, [rsp+8*68]
	call    address
	mov [rsp+8*69], rax
	mov r8, 0
	mov r9, [rsp+8*69]
	mov qword [r9], r8
	mov r8, [rsp+8*33]
	add r8, [rsp+8*30]
	mov qword [rsp+8*70],r8 
	mov r8, [gbl+8*7]
	mov qword [rsp+8*71] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*71]
	call    address
	mov [rsp+8*72], rax
	mov r8, [rsp+8*72]
	mov r8, [r8]
	mov [rsp+8*71], r8
	mov     rsi, [rsp+8*70]
	mov     rdi, [rsp+8*71]
	call    address
	mov [rsp+8*72], rax
	mov r8, 0
	mov r9, [rsp+8*72]
	mov qword [r9], r8
	mov r8, [rsp+8*33]
	add r8, [gbl+8*15]
	mov qword [rsp+8*73],r8 
	mov r8, [rsp+8*73]
	sub r8, 1
	mov qword [rsp+8*74],r8 
	mov r8, [rsp+8*74]
	sub r8, [rsp+8*30]
	mov qword [rsp+8*75],r8 
	mov r8, [gbl+8*7]
	mov qword [rsp+8*76] ,r8
	mov     rsi, 1
	mov     rdi, [rsp+8*76]
	call    address
	mov [rsp+8*77], rax
	mov r8, [rsp+8*77]
	mov r8, [r8]
	mov [rsp+8*76], r8
	mov     rsi, [rsp+8*75]
	mov     rdi, [rsp+8*76]
	call    address
	mov [rsp+8*77], rax
	mov r8, 0
	mov r9, [rsp+8*77]
	mov qword [r9], r8
	
L_279:
	
L_277:
	
L_275:
	
L_273:
	mov r8, [rsp+8*33]
	add r8, 1
	mov qword [rsp+8*33],r8 
	mov r8, [rsp+8*33]
	sub r8, 1
	mov qword [rsp+8*78],r8 
	jmp L_271
	
L_272:
	
L_270:
	mov rax,0
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 720
	mov qword [gbl+8*15] ,8
	mov     rdi, 8
	call    mallocArray
	mov     qword [gbl+8*79], rax
	mov r8, [gbl+8*79]
	mov qword [gbl+8*35] ,r8
	mov     rdi, 8
	call    mallocArray
	mov     qword [gbl+8*80], rax
	mov r8, [gbl+8*80]
	mov qword [gbl+8*19] ,r8
	mov     rdi, 2
	call    mallocArray
	mov     qword [gbl+8*81], rax
	mov r8, [gbl+8*81]
	mov qword [gbl+8*7] ,r8
	mov rax,[rsp+8*82]
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   2704

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	
t2070:
	 db 0,"" ,0

t2062:
	 db 2," O" ,0

t2074:
	 db 0,"" ,0

t2066:
	 db 2," ." ,0


