	 global    main
	 extern    puts
	 extern    printf
	 extern    scanf
	 extern    malloc
	 extern    strlen
	 extern    strcmp
	 extern    memset

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
        shl     rax, 3
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-18H]
        add     rax, 1
        shl     rax, 3
        mov     rdx, rax
        mov     rax, qword [rbp-8H]
        mov     esi, 0
        mov     rdi, rax
        call    memset
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
        jmp     md_2

md_1:  add     qword [rbp-10H], 1
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
md_2:  mov     rax, qword [rbp-28H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      md_1
        mov     qword [rbp-8H], 0
        jmp     md_4

md_3:  add     qword [rbp-10H], 1
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
md_4:  mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      md_3
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
        add     eax, 1
        movsxd  rdx, eax
        mov     rax, qword [rbp-40H]
        mov     rax, qword [rax]
        cmp     rdx, rax
        jnz     md_9
        mov     eax, dword [rbp-34H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-40H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     rdi, rax
        call    mallocArray
        jmp     mdd_012

md_9:  mov     eax, dword [rbp-34H]
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
        jmp     mdd_011

mdd_010:  mov     eax, dword [rbp-14H]
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
mdd_011:  mov     eax, dword [rbp-14H]
        cdqe
        cmp     rax, qword [rbp-20H]
        jl      mdd_010
        mov     rax, qword [rbp-28H]
mdd_012:  add     rsp, 56
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
        cmp     qword [rbp-18H], 0
        jnz     IDG5
        mov     rax, qword [rbp-28H]
        jmp     IDG8

IDG5:  mov     qword [rbp-8H], 1
        jmp     IDG7

IDG6:  mov     rax, qword [rbp-8H]
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
IDG7:  mov     rax, qword [rbp-8H]
        cmp     rax, qword [rbp-18H]
        jl      IDG6
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
IDG8:  leave
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

parseInt:
        push    rbp
        mov     rbp, rsp
        mov     r8,qword [arg+8*63]
        mov     qword [rbp-18H], r8
        mov     qword [rbp-10H], 0
        mov     qword [rbp-8H], 1
        jmp     PSL_025

PSL_023:  mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 47
        jbe     PSL_024
        mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        movzx   eax, byte [rax]
        cmp     al, 57
        ja      PSL_024
        mov     rdx, qword [rbp-10H]
        mov     rax, rdx
        shl     rax, 2
        add     rax, rdx
        add     rax, rax
        mov     rdx, rax
        mov     rcx, qword [rbp-8H]
        mov     rax, qword [rbp-18H]
        add     rax, rcx
        movzx   eax, byte [rax]
        movzx   eax, al
        sub     eax, 48
        cdqe
        add     rax, rdx
        mov     qword [rbp-10H], rax
        add     qword [rbp-8H], 1
        jmp     PSL_025

PSL_024:  mov     rax, qword [rbp-10H]
        jmp     PSL_026

PSL_025:  mov     rax, qword [rbp-18H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jge     PSL_023
        mov     rax, qword [rbp-10H]
PSL_026:  pop     rbp
        ret

substring:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     qword [rbp-28H], rdi
        mov     qword [rbp-30H], rsi
        mov     r8,qword [arg+8*63]
        mov     qword [rbp-18H], r8
        mov     rax, qword [rbp-28H]
        mov     rdx, qword [rbp-30H]
        sub     rdx, rax
        mov     rax, rdx
        add     rax, 3
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-20H], rax
        mov     rax, qword [rbp-30H]
        mov     edx, eax
        mov     rax, qword [rbp-28H]
        sub     edx, eax
        mov     eax, edx
        add     eax, 1
        mov     edx, eax
        mov     rax, qword [rbp-20H]
        mov     byte [rax], dl
        mov     qword [rbp-10H], 0
        mov     rax, qword [rbp-28H]
        mov     qword [rbp-8H], rax
        jmp     PSL_022

PSL_021:  add     qword [rbp-10H], 1
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp-20H]
        add     rdx, rax
        mov     rax, qword [rbp-8H]
        lea     rcx, [rax+1H]
        mov     rax, qword [rbp-18H]
        add     rax, rcx
        movzx   eax, byte [rax]
        mov     byte [rdx], al
        add     qword [rbp-8H], 1
PSL_022:  mov     rax, qword [rbp-8H]
        cmp     rax, qword [rbp-30H]
        jle     PSL_021
        add     qword [rbp-10H], 1
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp-20H]
        add     rax, rdx
        mov     byte [rax], 0
        mov     rax, qword [rbp-20H]
        leave
        ret

ord:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-18H], rdi
        mov     r8,qword [arg+8*63]
        mov     qword [rbp-8H], r8
        mov     rax, qword [rbp-18H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-8H]
        add     rax, rdx
        movzx   eax, byte [rax]
        movzx   eax, al
        pop     rbp
        ret

strls:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-8H]
        add     rax, 1
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        shr     eax, 31
        movzx   eax, al
        leave
        ret


strle:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-8H]
        add     rax, 1
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        setle   al
        movzx   eax, al
        leave
        ret


streq:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-8H]
        add     rax, 1
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        sete    al
        movzx   eax, al
        leave
        ret


strge:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-8H]
        add     rax, 1
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        not     eax
        shr     eax, 31
        movzx   eax, al
        leave
        ret


strgt:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-8H]
        add     rax, 1
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        setg    al
        movzx   eax, al
        leave
        ret


strne:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     qword [rbp-8H], rdi
        mov     qword [rbp-10H], rsi
        mov     rax, qword [rbp-10H]
        lea     rdx, [rax+1H]
        mov     rax, qword [rbp-8H]
        add     rax, 1
        mov     rsi, rdx
        mov     rdi, rax
        call    strcmp
        test    eax, eax
        setne   al
        movzx   eax, al
        leave
        ret


main:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 720
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 2704
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	push r15
	push r14
	push r13
	push r12
	call global_init
	pop r12
	pop r13
	pop r14
	pop r15
	mov r8 , rax
	mov r10,14
	mov r9,r10
	mov r11,0
	mov r15,r11
	mov qword [rsp+8*1],r8
	mov r10,0
	mov r8,r10
	mov qword [rsp+8*4],r8
	mov qword [rsp+8*2],r9
	
L_2170:
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*5],r10
	je L_2171
	mov r8,0
	mov r14,r8
	
L_2173:
	mov r8,  [rsp+8*2]
	cmp r14,r8
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*7],r9
	je L_2174
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*8],r8
	
L_2176:
	mov r8,  [rsp+8*8]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*9],r10
	je L_2177
	mov r8,0
	mov r13,r8
	
L_2179:
	mov r8,  [rsp+8*2]
	cmp r13,r8
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*11],r9
	je L_2180
	mov r8,0
	mov r12,r8
	
L_2182:
	mov r8,  [rsp+8*2]
	cmp r12,r8
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*13],r9
	je L_2183
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*14],r8
	
L_2185:
	mov r8,  [rsp+8*14]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*15],r10
	je L_2186
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*16],r8
	
L_2188:
	mov r8,  [rsp+8*16]
	mov r9,  [rsp+8*2]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*17],r10
	je L_2189
	mov r8,  [rsp+8*4]
	cmp r8,r14
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*18],r9
	jne L_2191
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*18],r8
	jmp L_2192
	
L_2191:
	mov r8,  [rsp+8*8]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	
L_2192:
	mov r8,  [rsp+8*18]
	cmp r8, 0
	je L_2197
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*18],r8
	jmp L_2198
	
L_2197:
	cmp r13,r12
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*20],r8
	jne L_2193
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*20],r8
	jmp L_2194
	
L_2193:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*21],r9
	mov qword [rsp+8*20],r10
	
L_2194:
	mov r8,  [rsp+8*20]
	cmp r8, 0
	jne L_2195
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*20],r8
	jmp L_2196
	
L_2195:
	mov r8,  [rsp+8*16]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*22],r9
	mov qword [rsp+8*20],r10
	
L_2196:
	mov r9,  [rsp+8*20]
	mov r8,r9
	mov qword [rsp+8*18],r8
	
L_2198:
	mov r8,  [rsp+8*18]
	cmp r8, 0
	je L_2199
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*18],r8
	jmp L_2200
	
L_2199:
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*16]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*23],r10
	mov qword [rsp+8*18],r11
	
L_2200:
	mov r8,  [rsp+8*18]
	cmp r8, 0
	je L_2203
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*18],r8
	jmp L_2204
	
L_2203:
	cmp r13,0
	mov r8, 0
	setg r8B
	cmp r8, 0
	mov qword [rsp+8*24],r8
	jne L_2201
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*24],r8
	jmp L_2202
	
L_2201:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*24],r10
	
L_2202:
	mov r9,  [rsp+8*24]
	mov r8,r9
	mov qword [rsp+8*18],r8
	
L_2204:
	mov r9,  [rsp+8*18]
	mov r8,r9
	mov r10,  [rsp+8*4]
	cmp r10,r14
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*26],r8
	mov qword [rsp+8*27],r11
	jne L_2205
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*27],r8
	jmp L_2206
	
L_2205:
	mov r8,  [rsp+8*8]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*27],r10
	
L_2206:
	mov r8,  [rsp+8*27]
	cmp r8, 0
	je L_2211
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*27],r8
	jmp L_2212
	
L_2211:
	cmp r13,r12
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*29],r8
	jne L_2207
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*29],r8
	jmp L_2208
	
L_2207:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*30],r9
	mov qword [rsp+8*29],r10
	
L_2208:
	mov r8,  [rsp+8*29]
	cmp r8, 0
	jne L_2209
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*29],r8
	jmp L_2210
	
L_2209:
	mov r8,  [rsp+8*16]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*31],r9
	mov qword [rsp+8*29],r10
	
L_2210:
	mov r9,  [rsp+8*29]
	mov r8,r9
	mov qword [rsp+8*27],r8
	
L_2212:
	mov r8,  [rsp+8*27]
	cmp r8, 0
	je L_2213
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*27],r8
	jmp L_2214
	
L_2213:
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*16]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*32],r10
	mov qword [rsp+8*27],r11
	
L_2214:
	mov r8,  [rsp+8*27]
	cmp r8, 0
	je L_2217
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*27],r8
	jmp L_2218
	
L_2217:
	cmp r13,0
	mov r8, 0
	setg r8B
	cmp r8, 0
	mov qword [rsp+8*33],r8
	jne L_2215
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*33],r8
	jmp L_2216
	
L_2215:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*34],r9
	mov qword [rsp+8*33],r10
	
L_2216:
	mov r9,  [rsp+8*33]
	mov r8,r9
	mov qword [rsp+8*27],r8
	
L_2218:
	mov r9,  [rsp+8*27]
	mov r8,r9
	mov r10,  [rsp+8*4]
	cmp r10,r14
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*35],r8
	mov qword [rsp+8*36],r11
	jne L_2219
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*36],r8
	jmp L_2220
	
L_2219:
	mov r8,  [rsp+8*8]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*37],r9
	mov qword [rsp+8*36],r10
	
L_2220:
	mov r8,  [rsp+8*36]
	cmp r8, 0
	je L_2225
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*36],r8
	jmp L_2226
	
L_2225:
	cmp r13,r12
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*38],r8
	jne L_2221
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*38],r8
	jmp L_2222
	
L_2221:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*39],r9
	mov qword [rsp+8*38],r10
	
L_2222:
	mov r8,  [rsp+8*38]
	cmp r8, 0
	jne L_2223
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*38],r8
	jmp L_2224
	
L_2223:
	mov r8,  [rsp+8*16]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*40],r9
	mov qword [rsp+8*38],r10
	
L_2224:
	mov r9,  [rsp+8*38]
	mov r8,r9
	mov qword [rsp+8*36],r8
	
L_2226:
	mov r8,  [rsp+8*36]
	cmp r8, 0
	je L_2227
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*36],r8
	jmp L_2228
	
L_2227:
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*16]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*41],r10
	mov qword [rsp+8*36],r11
	
L_2228:
	mov r8,  [rsp+8*36]
	cmp r8, 0
	je L_2231
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*36],r8
	jmp L_2232
	
L_2231:
	cmp r13,0
	mov r8, 0
	setg r8B
	cmp r8, 0
	mov qword [rsp+8*42],r8
	jne L_2229
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*42],r8
	jmp L_2230
	
L_2229:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*43],r9
	mov qword [rsp+8*42],r10
	
L_2230:
	mov r9,  [rsp+8*42]
	mov r8,r9
	mov qword [rsp+8*36],r8
	
L_2232:
	mov r9,  [rsp+8*36]
	mov r8,r9
	mov r10,  [rsp+8*4]
	cmp r10,r14
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*44],r8
	mov qword [rsp+8*45],r11
	jne L_2233
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*45],r8
	jmp L_2234
	
L_2233:
	mov r8,  [rsp+8*8]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*46],r9
	mov qword [rsp+8*45],r10
	
L_2234:
	mov r8,  [rsp+8*45]
	cmp r8, 0
	je L_2239
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*45],r8
	jmp L_2240
	
L_2239:
	cmp r13,r12
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*47],r8
	jne L_2235
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*47],r8
	jmp L_2236
	
L_2235:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*48],r9
	mov qword [rsp+8*47],r10
	
L_2236:
	mov r8,  [rsp+8*47]
	cmp r8, 0
	jne L_2237
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*47],r8
	jmp L_2238
	
L_2237:
	mov r8,  [rsp+8*16]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*49],r9
	mov qword [rsp+8*47],r10
	
L_2238:
	mov r9,  [rsp+8*47]
	mov r8,r9
	mov qword [rsp+8*45],r8
	
L_2240:
	mov r8,  [rsp+8*45]
	cmp r8, 0
	je L_2241
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*45],r8
	jmp L_2242
	
L_2241:
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*16]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*50],r10
	mov qword [rsp+8*45],r11
	
L_2242:
	mov r8,  [rsp+8*45]
	cmp r8, 0
	je L_2245
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*45],r8
	jmp L_2246
	
L_2245:
	cmp r13,0
	mov r8, 0
	setg r8B
	cmp r8, 0
	mov qword [rsp+8*51],r8
	jne L_2243
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*51],r8
	jmp L_2244
	
L_2243:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*52],r9
	mov qword [rsp+8*51],r10
	
L_2244:
	mov r9,  [rsp+8*51]
	mov r8,r9
	mov qword [rsp+8*45],r8
	
L_2246:
	mov r9,  [rsp+8*45]
	mov r8,r9
	mov r10,  [rsp+8*4]
	cmp r10,r14
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*53],r8
	mov qword [rsp+8*54],r11
	jne L_2247
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_2248
	
L_2247:
	mov r8,  [rsp+8*8]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*55],r9
	mov qword [rsp+8*54],r10
	
L_2248:
	mov r8,  [rsp+8*54]
	cmp r8, 0
	je L_2253
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_2254
	
L_2253:
	cmp r13,r12
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*56],r8
	jne L_2249
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*56],r8
	jmp L_2250
	
L_2249:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*57],r9
	mov qword [rsp+8*56],r10
	
L_2250:
	mov r8,  [rsp+8*56]
	cmp r8, 0
	jne L_2251
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*56],r8
	jmp L_2252
	
L_2251:
	mov r8,  [rsp+8*16]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*56],r10
	
L_2252:
	mov r9,  [rsp+8*56]
	mov r8,r9
	mov qword [rsp+8*54],r8
	
L_2254:
	mov r8,  [rsp+8*54]
	cmp r8, 0
	je L_2255
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_2256
	
L_2255:
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*16]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*59],r10
	mov qword [rsp+8*54],r11
	
L_2256:
	mov r8,  [rsp+8*54]
	cmp r8, 0
	je L_2259
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*54],r8
	jmp L_2260
	
L_2259:
	cmp r13,0
	mov r8, 0
	setg r8B
	cmp r8, 0
	mov qword [rsp+8*60],r8
	jne L_2257
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*60],r8
	jmp L_2258
	
L_2257:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*61],r9
	mov qword [rsp+8*60],r10
	
L_2258:
	mov r9,  [rsp+8*60]
	mov r8,r9
	mov qword [rsp+8*54],r8
	
L_2260:
	mov r9,  [rsp+8*54]
	mov r8,r9
	mov r10,  [rsp+8*4]
	cmp r10,r14
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*62],r8
	mov qword [rsp+8*63],r11
	jne L_2261
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*63],r8
	jmp L_2262
	
L_2261:
	mov r8,  [rsp+8*8]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*64],r9
	mov qword [rsp+8*63],r10
	
L_2262:
	mov r8,  [rsp+8*63]
	cmp r8, 0
	je L_2267
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*63],r8
	jmp L_2268
	
L_2267:
	cmp r13,r12
	mov r8, 0
	sete r8B
	cmp r8, 0
	mov qword [rsp+8*65],r8
	jne L_2263
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*65],r8
	jmp L_2264
	
L_2263:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*66],r9
	mov qword [rsp+8*65],r10
	
L_2264:
	mov r8,  [rsp+8*65]
	cmp r8, 0
	jne L_2265
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*65],r8
	jmp L_2266
	
L_2265:
	mov r8,  [rsp+8*16]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*67],r9
	mov qword [rsp+8*65],r10
	
L_2266:
	mov r9,  [rsp+8*65]
	mov r8,r9
	mov qword [rsp+8*63],r8
	
L_2268:
	mov r8,  [rsp+8*63]
	cmp r8, 0
	je L_2269
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*63],r8
	jmp L_2270
	
L_2269:
	mov r8,  [rsp+8*4]
	mov r9,  [rsp+8*16]
	cmp r8,r9
	mov r10, 0
	sete r10B
	mov r11,r10
	mov qword [rsp+8*68],r10
	mov qword [rsp+8*63],r11
	
L_2270:
	mov r8,  [rsp+8*63]
	cmp r8, 0
	je L_2273
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*63],r8
	jmp L_2274
	
L_2273:
	cmp r13,0
	mov r8, 0
	setg r8B
	cmp r8, 0
	mov qword [rsp+8*69],r8
	jne L_2271
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*69],r8
	jmp L_2272
	
L_2271:
	mov r8,  [rsp+8*14]
	cmp r8,0
	mov r9, 0
	setg r9B
	mov r10,r9
	mov qword [rsp+8*70],r9
	mov qword [rsp+8*69],r10
	
L_2272:
	mov r9,  [rsp+8*69]
	mov r8,r9
	mov qword [rsp+8*63],r8
	
L_2274:
	mov r9,  [rsp+8*63]
	mov r8,r9
	mov r10,  [rsp+8*26]
	cmp r10, 0
	mov qword [rsp+8*71],r8
	je L_2276
	mov r8,r15
	inc qword r15 
	mov qword [rsp+8*72],r8
	
L_2276:
	mov r8,  [rsp+8*35]
	cmp r8, 0
	je L_2278
	mov r8,r15
	inc qword r15 
	mov qword [rsp+8*73],r8
	
L_2278:
	mov r8,  [rsp+8*44]
	cmp r8, 0
	je L_2280
	mov r8,r15
	inc qword r15 
	mov qword [rsp+8*74],r8
	
L_2280:
	mov r8,  [rsp+8*53]
	cmp r8, 0
	je L_2282
	mov r8,r15
	inc qword r15 
	mov qword [rsp+8*75],r8
	
L_2282:
	mov r8,  [rsp+8*62]
	cmp r8, 0
	je L_2284
	mov r8,r15
	inc qword r15 
	mov qword [rsp+8*76],r8
	
L_2284:
	mov r8,  [rsp+8*71]
	cmp r8, 0
	je L_2286
	mov r8,r15
	inc qword r15 
	mov qword [rsp+8*77],r8
	
L_2286:
	inc qword[rsp+8*16] 
	jmp L_2188
	
L_2189:
	inc qword[rsp+8*14] 
	jmp L_2185
	
L_2186:
	inc qword r12 
	jmp L_2182
	
L_2183:
	inc qword r13 
	jmp L_2179
	
L_2180:
	inc qword[rsp+8*8] 
	jmp L_2176
	
L_2177:
	inc qword r14 
	jmp L_2173
	
L_2174:
	inc qword[rsp+8*4] 
	jmp L_2170
	
L_2171:
	mov r8,r15
	mov r9,r8
	mov qword rdi,r8
	mov qword [rsp+8*79],r9
	mov     rdi, [rsp+8*79]
	call    toString
	mov     qword[rsp+8*80], rax
	mov r9,  [rsp+8*80]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*81],r10
	mov rdi, format
	mov rsi,[rsp+8*81] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 720
	mov r8,  [rsp+8*82]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   2704
buff.1788:
        resb    256
arg:
        resb    1024

trsp:         resb   1024
	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	
GS_31:
	db 25H, 6CH, 64H, 00H
	
GS_32:
	db 25H, 73H, 00H
	

