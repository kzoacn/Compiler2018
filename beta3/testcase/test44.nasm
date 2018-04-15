	 global    main
	 extern    puts
	 extern    printf
	 extern    scanf
	 extern    malloc
	 extern    strlen

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
getInt:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        lea     rax, [rbp-8H]
        mov     rsi, rax
        mov     edi, GS_31
        mov     eax, 0
        call    scanf
        mov     rax, qword [rbp-8H]
        leave
        ret

getString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     esi, buff.1788
        mov     edi, GS_32
        mov     eax, 0
        call    scanf
        mov     edi, buff.1788
        call    strlen
        mov     qword [rbp-10H], rax
        mov     rax, qword [rbp-10H]
        add     rax, 2
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-18H], rax
        mov     rax, qword [rbp-10H]
        mov     edx, eax
        mov     rax, qword [rbp-18H]
        mov     byte [rax], dl
        mov     qword [rbp-8H], 1
        jmp     GS_20

GS_19:  mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-18H]
        add     rdx, rax
        mov     rax, qword [rbp-8H]
        sub     rax, 1

        movzx   eax, byte [abs buff.1788+rax]
        mov     byte [rdx], al
        add     qword [rbp-8H], 1
GS_20:  mov     rax, qword [rbp-8H]
        cmp     rax, qword [rbp-10H]
        jle     GS_19
        mov     rax, qword [rbp-18H]
        leave
        ret


main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 368
	call global_init
	mov [rsp+8*1] , rax
	mov     rdi, 2
	call    mallocArray
	mov     qword [rsp+8*2], rax
	mov r8, [rsp+8*2]
	mov qword [rsp+8*3] ,r8
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*4], rax
	mov r8, [rsp+8*4]
	mov qword [rsp+8*5] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*4]
	call    address
	mov [rsp+8*5], rax
	mov r8, 0
	mov r9, [rsp+8*5]
	mov qword [r9], r8
	mov     rsi, [rsp+8*4]
	mov     rdi, [rsp+8*3]
	call    multiAddress
	mov [rsp+8*6], rax
	mov r8, tmpVariableslcomrcitx
	mov r9, [rsp+8*6]
	mov qword [r9], r8
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*7], rax
	mov r8, [rsp+8*7]
	mov qword [rsp+8*8] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*7]
	call    address
	mov [rsp+8*8], rax
	mov r8, 1
	mov r9, [rsp+8*8]
	mov qword [r9], r8
	mov     rsi, [rsp+8*7]
	mov     rdi, [rsp+8*3]
	call    multiAddress
	mov [rsp+8*9], rax
	mov r8, 20
	mov r9, [rsp+8*9]
	mov qword [r9], r8
	mov     rdi, 2
	call    mallocArray
	mov     qword [rsp+8*10], rax
	mov r8, [rsp+8*10]
	mov qword [rsp+8*11] ,r8
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*12], rax
	mov r8, [rsp+8*12]
	mov qword [rsp+8*13] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*12]
	call    address
	mov [rsp+8*13], rax
	mov r8, 0
	mov r9, [rsp+8*13]
	mov qword [r9], r8
	mov     rsi, [rsp+8*12]
	mov     rdi, [rsp+8*11]
	call    multiAddress
	mov [rsp+8*14], rax
	mov r8, tmpVariableizrceoyesy
	mov r9, [rsp+8*14]
	mov qword [r9], r8
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*15], rax
	mov r8, [rsp+8*15]
	mov qword [rsp+8*16] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*15]
	call    address
	mov [rsp+8*16], rax
	mov r8, 1
	mov r9, [rsp+8*16]
	mov qword [r9], r8
	mov     rsi, [rsp+8*15]
	mov     rdi, [rsp+8*11]
	call    multiAddress
	mov [rsp+8*17], rax
	mov r8, 20
	mov r9, [rsp+8*17]
	mov qword [r9], r8
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*18], rax
	mov r8, [rsp+8*18]
	mov qword [rsp+8*19] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*18]
	call    address
	mov [rsp+8*19], rax
	mov r8, 0
	mov r9, [rsp+8*19]
	mov qword [r9], r8
	mov     rsi, [rsp+8*18]
	mov     rdi, [rsp+8*3]
	call    multiAddress
	mov [rsp+8*20], rax
	mov r8, [rsp+8*20]
	mov r8, [r8]
	mov [rsp+8*20], r8
	mov     rsi, tmpVariablexwrgwymhug
	mov     rdi, [rsp+8*20]
	call    concat
	mov [rsp+8*21], rax
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*22], rax
	mov r8, [rsp+8*22]
	mov qword [rsp+8*23] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*22]
	call    address
	mov [rsp+8*23], rax
	mov r8, 0
	mov r9, [rsp+8*23]
	mov qword [r9], r8
	mov     rsi, [rsp+8*22]
	mov     rdi, [rsp+8*11]
	call    multiAddress
	mov [rsp+8*24], rax
	mov r8, [rsp+8*24]
	mov r8, [r8]
	mov [rsp+8*24], r8
	mov     rsi, [rsp+8*24]
	mov     rdi, [rsp+8*21]
	call    concat
	mov [rsp+8*25], rax
	mov r8, [rsp+8*25]
	mov qword [gbl+8*26] ,r8
	mov r8, [gbl+8*26]
	mov qword [rsp+8*27] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*27] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*28], rax
	mov r8, [rsp+8*28]
	mov qword [rsp+8*29] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*28]
	call    address
	mov [rsp+8*29], rax
	mov r8, 1
	mov r9, [rsp+8*29]
	mov qword [r9], r8
	mov     rsi, [rsp+8*28]
	mov     rdi, [rsp+8*3]
	call    multiAddress
	mov [rsp+8*30], rax
	mov r8, [rsp+8*30]
	mov r8, [r8]
	mov [rsp+8*30], r8
	mov     rdi, 1
	call    mallocArray
	mov     qword [rsp+8*31], rax
	mov r8, [rsp+8*31]
	mov qword [rsp+8*32] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*31]
	call    address
	mov [rsp+8*32], rax
	mov r8, 1
	mov r9, [rsp+8*32]
	mov qword [r9], r8
	mov     rsi, [rsp+8*31]
	mov     rdi, [rsp+8*11]
	call    multiAddress
	mov [rsp+8*33], rax
	mov r8, [rsp+8*33]
	mov r8, [r8]
	mov [rsp+8*33], r8
	mov r8, [rsp+8*30]
	sub r8, [rsp+8*33]
	mov qword [rsp+8*34],r8 
	mov r8, [rsp+8*34]
	mov qword [gbl+8*26] ,r8
	mov r8, [gbl+8*26]
	mov qword [rsp+8*35] ,r8
	mov     rdi, [rsp+8*35]
	call    toString
	mov     qword[rsp+8*36], rax
	mov r8, [rsp+8*36]
	mov qword [gbl+8*26] ,r8
	mov r8, [gbl+8*26]
	mov qword [rsp+8*37] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*37] 
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
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 368
	mov rax,[rsp+8*38]
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   2352
buff.1788:
        resb    256

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	
GS_31:
	db 25H, 6CH, 64H, 00H
	
GS_32:
	db 25H, 73H, 00H
	
tmpVariablexwrgwymhug:
	 db 11," xiang yao " ,0

tmpVariableslcomrcitx:
	 db 6,"kzoacn" ,0

tmpVariableizrceoyesy:
	 db 10,"xiaojiejie" ,0


