	 global    main
	 extern    puts
	 extern    printf
	 extern    scanf
	 extern    malloc
	 extern    calloc
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
        jnz     DD13
        mov     qword [rbp-8H], 1
DD13:  cmp     qword [rbp-38H], 0
        jns     DD14
        neg     qword [rbp-38H]
        mov     qword [rbp-10H], -1
        add     qword [rbp-8H], 1
DD14:  mov     rax, qword [rbp-38H]
        mov     qword [rbp-18H], rax
        jmp     DD16

DD15:  add     qword [rbp-8H], 1
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
DD16:  cmp     qword [rbp-18H], 0
        jg      DD15
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
        jnz     DD17
        mov     rax, qword [rbp-20H]
        mov     byte [rax], 45
DD17:  mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-28H]
        add     rax, rdx
        mov     qword [rbp-20H], rax
        cmp     qword [rbp-38H], 0
        jnz     DD19
        mov     rax, qword [rbp-20H]
        mov     byte [rax], 48
        jmp     DD19

DD18:  mov     rcx, qword [rbp-38H]
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
        lea     edx, [rax+30H]
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
DD19:  cmp     qword [rbp-38H], 0
        jg      DD18
        mov     rax, qword [rbp-28H]
        leave
        ret

mallocArray:
        push    rbx
        mov     rbx, rdi
        lea     rdi, [rdi*8+8H]
        mov     esi, 1
        call    calloc
        mov     qword [rax], rbx
        pop     rbx
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
        jmp     DD2

DD1:  add     qword [rbp-10H], 1
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
DD2:  mov     rax, qword [rbp-28H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      DD1
        mov     qword [rbp-8H], 0
        jmp     DD4

DD3:  add     qword [rbp-10H], 1
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
DD4:  mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      DD3
        add     qword [rbp-10H], 1
        mov     rdx, qword [rbp-10H]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        mov     byte [rax], 0
        mov     rax, qword [rbp-18H]
        leave
        ret

address:
        lea     rax, [rdi+rsi*8+8H]
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
        jnz     L_009
        mov     eax, dword [rbp-34H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-40H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     rdi, rax
        call    mallocArray
        jmp     L_012

L_009:  mov     eax, dword [rbp-34H]
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
        jmp     L_011

L_010:  mov     eax, dword [rbp-14H]
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
L_011:  mov     eax, dword [rbp-14H]
        cdqe
        cmp     rax, qword [rbp-20H]
        jl      L_010
        mov     rax, qword [rbp-28H]
L_012:  add     rsp, 56
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
        jnz     DD5
        mov     rax, qword [rbp-28H]
        jmp     DD8

DD5:  mov     qword [rbp-8H], 1
        jmp     DD7

DD6:  mov     rax, qword [rbp-8H]
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
DD7:  mov     rax, qword [rbp-8H]
        cmp     rax, qword [rbp-18H]
        jl      DD6
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
DD8:  leave
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
	sub    rsp, 1496
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 3480
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
	mov r15 , rax
	mov r9,0
	mov r8,r9
	mov r11,0
	mov r10,r11
	mov r11,0
	mov r9,r11
	mov r11,3
	mov qword [rsp+8*2],r8
	mov r8,7
	mov r15,r11
	imul r15,r8
	mov r8,10
	imul r15,r8
	mov r8,r15
	mov r11,0
	mov r12,r11
	mov qword [gbl+8*7],r8
	mov qword [rsp+8*4],r9
	mov qword [rsp+8*3],r10
	mov     rdi, 100
	call    mallocArray
	mov     qword  r15, rax
	mov r13,r15
	xor rdx, rdx
	mov r8,  [gbl+8*11]
	mov rax, r8
	mov r9,  [gbl+8*12]
	mov rbx, r9
	cdq
	idiv rbx
	mov r15, rax
	mov r15,r15
	xor rdx, rdx
	mov rax, r8
	mov rbx, r9
	cdq
	idiv rbx
	mov r14, rdx
	mov r14,r14
	mov r10,  [gbl+8*7]
	mov rdi,r10
	mov r11,rdi
	mov qword [rsp+8*18],r11
	
L_159:
	mov r8,  [rsp+8*18]
	cmp r12,r8
	mov r9, 0
	setle r9B
	cmp r9, 0
	mov qword [rsp+8*19],r9
	je L_160
	mov r8,1
	mov r9,r12
	add r9,r8
	mov r10,r12
	imul r10,r9
	xor rdx, rdx
	mov rax, r10
	mov r11,2
	mov rbx, r11
	cdq
	idiv rbx
	mov r8, rax
	mov r9,  [rsp+8*18]
	cmp r9,r8
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*22],r8
	mov qword [rsp+8*23],r10
	je L_161
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*24],r8
	jmp L_163
	
L_161:
	mov r8,1
	add r12,r8
	jmp L_159
	
L_160:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*24],r8
	
L_163:
	mov r9,  [rsp+8*24]
	mov r8,r9
	mov r10, 0
	cmp r8, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*25],r8
	mov qword [rsp+8*26],r10
	je L_127
	mov r8,t225
	mov rdi,r8
	mov r15,rdi
	mov rdi, r15 
	add rdi, 1 
	call puts
	mov r8,1
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
L_127:
	mov r8,t230
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*28],r9
	mov rdi,[rsp+8*28] 
	add rdi, 1 
	call puts
	mov r8,3654898
	mov rdi,r8
	mov r9,rdi
	mov r10,r9
	mov r8,0
	mov r11,r8
	mov r8,r11
	xor rdx, rdx
	mov rax, r10
	mov rbx, r15
	cdq
	idiv rbx
	mov qword [rsp+8*32],r8
	mov r8, rdx
	mov qword [rsp+8*29],r9
	mov r9,  [gbl+8*12]
	mov qword [rsp+8*31],r11
	mov r11,r9
	imul r11,r8
	xor rdx, rdx
	mov rax, r10
	mov rbx, r15
	cdq
	idiv rbx
	mov qword [rsp+8*33],r8
	mov r8, rax
	mov r9,r14
	imul r9,r8
	sub r11,r9
	mov qword [gbl+8*30],r10
	mov r10,r11
	mov qword [rsp+8*35],r8
	mov r8,0
	cmp r10,r8
	mov qword [rsp+8*36],r9
	mov r9, 0
	setge r9B
	cmp r9, 0
	mov qword [rsp+8*38],r9
	mov qword [rsp+8*37],r10
	mov qword [rsp+8*34],r11
	je L_165
	mov r9,  [rsp+8*37]
	mov r8,r9
	mov qword [gbl+8*30],r8
	jmp L_166
	
L_165:
	mov r8,  [rsp+8*37]
	mov r9,  [gbl+8*11]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*39],r10
	mov qword [gbl+8*30],r11
	
L_166:
	mov r9,  [gbl+8*30]
	mov r8,r9
	mov r10,r8
	xor rdx, rdx
	mov rax, r10
	mov r11,10
	mov rbx, r11
	cdq
	idiv rbx
	mov r9, rdx
	mov qword [rsp+8*41],r10
	mov r10,1
	add r9,r10
	mov r10,r9
	mov rdi,r10
	mov r9,rdi
	mov qword [rsp+8*40],r8
	mov qword [rsp+8*44],r9
	mov qword [gbl+8*43],r10
	mov     rdi, [rsp+8*44]
	call    toString
	mov     qword[rsp+8*45], rax
	mov r8,  [rsp+8*45]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*46],r9
	mov rdi,[rsp+8*46] 
	add rdi, 1 
	call puts
	
L_128:
	mov r8,  [gbl+8*43]
	mov r9,1
	mov r10,r8
	sub r10,r9
	mov r11,  [rsp+8*2]
	cmp r11,r10
	mov r10, 0
	setl r10B
	mov r9,  [rsp+8*48]
	add r9,r9
	cmp r10, 0
	mov qword [rsp+8*48],r9
	mov qword [rsp+8*47],r10
	je L_129
	xor rdx, rdx
	mov r8,  [gbl+8*30]
	mov rax, r8
	mov rbx, r15
	cdq
	idiv rbx
	mov r9, rdx
	mov r10,  [gbl+8*12]
	mov r11,r10
	imul r11,r9
	xor rdx, rdx
	mov rax, r8
	mov rbx, r15
	cdq
	idiv rbx
	mov qword [rsp+8*33],r9
	mov r9, rax
	mov r10,r14
	imul r10,r9
	sub r11,r10
	mov r8,r11
	mov qword [rsp+8*35],r9
	mov r9,0
	cmp r8,r9
	mov qword [rsp+8*36],r10
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*37],r8
	mov qword [rsp+8*38],r10
	mov qword [rsp+8*34],r11
	je L_169
	mov r9,  [rsp+8*37]
	mov r8,r9
	mov qword [gbl+8*30],r8
	jmp L_170
	
L_169:
	mov r8,  [rsp+8*37]
	mov r9,  [gbl+8*11]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*39],r10
	mov qword [gbl+8*30],r11
	
L_170:
	mov r9,  [gbl+8*30]
	mov r8,r9
	mov r10,r8
	xor rdx, rdx
	mov rax, r10
	mov r11,10
	mov rbx, r11
	cdq
	idiv rbx
	mov r9, rdx
	mov qword [rsp+8*49],r10
	mov r10,1
	add r9,r10
	mov r10,r13
	mov r11,  [rsp+8*2]
	mov qword [rsp+8*40],r8
	lea r8,[r10+r11*8+8H]
	mov [r8],r9
	mov qword [rsp+8*52],r8
	mov qword [rsp+8*50],r9
	mov qword [rsp+8*51],r10
	
L_131:
	mov r8,r13
	mov r9,  [rsp+8*2]
	lea r10,[r8+r9*8+8H]
	mov r11, [r10]
	mov qword [rsp+8*53],r8
	mov r8,  [rsp+8*3]
	mov qword [rsp+8*54],r10
	mov r10,r11
	add r10,r8
	mov qword [rsp+8*55],r11
	mov r11,  [gbl+8*7]
	cmp r10,r11
	mov r10, 0
	setg r10B
	mov r9,  [rsp+8*48]
	add r9,r9
	cmp r10, 0
	mov qword [rsp+8*48],r9
	mov qword [rsp+8*56],r10
	je L_132
	xor rdx, rdx
	mov r8,  [gbl+8*30]
	mov rax, r8
	mov rbx, r15
	cdq
	idiv rbx
	mov r9, rdx
	mov r10,  [gbl+8*12]
	mov r11,r10
	imul r11,r9
	xor rdx, rdx
	mov rax, r8
	mov rbx, r15
	cdq
	idiv rbx
	mov r9, rax
	mov r10,r14
	imul r10,r9
	sub r11,r10
	mov r9,r11
	mov r10,0
	cmp r9,r10
	mov r11, 0
	setge r11B
	cmp r11, 0
	mov qword [rsp+8*37],r9
	mov qword [rsp+8*38],r11
	je L_173
	mov r9,  [rsp+8*37]
	mov r8,r9
	mov qword [gbl+8*30],r8
	jmp L_174
	
L_173:
	mov r8,  [rsp+8*37]
	mov r9,  [gbl+8*11]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*39],r10
	mov qword [gbl+8*30],r11
	
L_174:
	mov r9,  [gbl+8*30]
	mov r8,r9
	mov r10,r8
	xor rdx, rdx
	mov rax, r10
	mov r11,10
	mov rbx, r11
	cdq
	idiv rbx
	mov qword [rsp+8*40],r8
	mov r8, rdx
	mov qword [rsp+8*57],r10
	mov r10,1
	add r8,r10
	mov r10,r13
	mov r11,  [rsp+8*2]
	lea r9,[r10+r11*8+8H]
	mov [r9],r8
	mov qword [rsp+8*58],r8
	mov qword [rsp+8*60],r9
	mov qword [rsp+8*59],r10
	jmp L_131
	
L_132:
	mov r8,r13
	mov r9,  [rsp+8*2]
	lea r10,[r8+r9*8+8H]
	mov r11, [r10]
	mov qword [rsp+8*61],r8
	mov r8,  [rsp+8*3]
	mov qword [rsp+8*62],r10
	mov r10,r8
	add r10,r11
	mov r8,r10
	mov r10,1
	add r9,r10
	mov qword [rsp+8*3],r8
	mov qword [rsp+8*2],r9
	mov qword [rsp+8*63],r11
	jmp L_128
	
L_129:
	mov r8,  [gbl+8*7]
	mov r9,  [rsp+8*3]
	mov r10,r8
	sub r10,r9
	mov r11,  [gbl+8*43]
	mov r8,1
	mov r15,r11
	sub r15,r8
	mov r14,r13
	lea r15,[r14+r15*8+8H]
	mov [r15],r10
	mov r8,0
	mov r15,r8
	mov qword [rsp+8*65],r10
	
L_177:
	mov r8,  [gbl+8*43]
	cmp r15,r8
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*70],r9
	je L_178
	mov r8,r13
	lea r9,[r8+r15*8+8H]
	mov r10, [r9]
	mov rdi,r10
	mov r11,rdi
	mov qword [rsp+8*71],r8
	mov qword [rsp+8*72],r9
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*74],r11
	mov     rdi, [rsp+8*74]
	call    toString
	mov     qword[rsp+8*75], rax
	mov     rsi, t107
	mov     rdi, [rsp+8*75]
	call    concat
	mov [rsp+8*76], rax
	mov r8,  [rsp+8*76]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*77],r9
	mov rdi, format
	mov rsi,[rsp+8*77] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8,1
	add r15,r8
	jmp L_177
	
L_178:
	mov r8,t112
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*78],r9
	mov rdi,[rsp+8*78] 
	add rdi, 1 
	call puts
	mov r8,0
	mov r15,r8
	mov r15,r15
	mov r9,0
	mov r15,r9
	
L_230:
	mov r8,  [gbl+8*43]
	cmp r15,r8
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_231
	mov r14,r13
	lea r14,[r14+r15*8+8H]
	mov r14, [r14]
	mov r8,0
	cmp r14,r8
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_232
	mov r8,1
	mov r14,r15
	add r14,r8
	mov r14,r14
	
L_233:
	mov r8,  [gbl+8*43]
	cmp r14,r8
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*89],r9
	je L_234
	mov r8,r13
	lea r9,[r8+r14*8+8H]
	mov r10, [r9]
	mov r11,0
	cmp r10,r11
	mov qword [rsp+8*90],r8
	mov r8, 0
	setne r8B
	cmp r8, 0
	mov qword [rsp+8*93],r8
	mov qword [rsp+8*91],r9
	mov qword [rsp+8*92],r10
	je L_235
	mov rsi,r14
	mov rdi,r15
	mov r14,rdi
	mov r8,rsi
	mov r9,r13
	lea r10,[r9+r14*8+8H]
	mov r11, [r10]
	mov qword [rsp+8*96],r8
	mov r8,r11
	mov qword [rsp+8*97],r9
	mov r9,r13
	mov qword [rsp+8*98],r10
	mov r10,  [rsp+8*96]
	mov qword [rsp+8*100],r8
	lea r8,[r9+r10*8+8H]
	mov qword [rsp+8*99],r11
	mov r11, [r8]
	mov qword [rsp+8*101],r9
	mov r9,r13
	lea r10,[r9+r14*8+8H]
	mov [r10],r11
	mov qword [rsp+8*102],r8
	mov r8,r13
	mov qword [rsp+8*104],r9
	mov r9,  [rsp+8*96]
	mov qword [rsp+8*105],r10
	lea r10,[r8+r9*8+8H]
	mov qword [rsp+8*103],r11
	mov r11,  [rsp+8*100]
	mov [r10],r11
	mov qword [rsp+8*106],r8
	mov r8,0
	mov r14,r8
	mov r14,r14
	mov qword [rsp+8*107],r10
	jmp L_234
	
L_235:
	mov r8,1
	add r14,r8
	jmp L_233
	
L_234:
	
L_232:
	mov r8,1
	add r15,r8
	jmp L_230
	
L_231:
	mov r8,0
	mov r15,r8
	
L_240:
	mov r8,  [gbl+8*43]
	cmp r15,r8
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_241
	mov r14,r13
	lea r14,[r14+r15*8+8H]
	mov r14, [r14]
	mov r8,0
	cmp r14,r8
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_242
	mov r8,r15
	mov qword [gbl+8*43],r8
	jmp L_241
	
L_242:
	mov r8,1
	add r15,r8
	jmp L_240
	
L_241:
	mov r8,0
	mov r15,r8
	mov r15,r15
	
L_133:
	mov     rdi, 100
	call    mallocArray
	mov     qword [rsp+8*117], rax
	mov r8,  [rsp+8*117]
	mov r15,r8
	mov r9,  [gbl+8*43]
	cmp r9,r12
	mov r10, 0
	setne r10B
	cmp r10, 0
	mov qword [rsp+8*119],r10
	je L_246
	mov r8,0
	mov r15,r8
	jmp L_248
	
L_246:
	mov r8,0
	mov r14,r8
	
L_249:
	mov r8,  [gbl+8*43]
	cmp r14,r8
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*122],r9
	je L_250
	mov r8,r13
	lea r9,[r8+r14*8+8H]
	mov r10, [r9]
	mov r11,r15
	mov qword [rsp+8*123],r8
	lea r8,[r11+r14*8+8H]
	mov [r8],r10
	mov qword [rsp+8*127],r8
	mov r8,1
	add r14,r8
	mov qword [rsp+8*124],r9
	mov qword [rsp+8*125],r10
	mov qword [rsp+8*126],r11
	jmp L_249
	
L_250:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*128],r8
	
L_252:
	mov r8,  [gbl+8*43]
	mov r9,1
	mov r14,r8
	sub r14,r9
	mov r10,  [rsp+8*128]
	cmp r10,r14
	mov r14, 0
	setl r14B
	mov r11,  [rsp+8*48]
	add r11,r11
	cmp r14, 0
	mov qword [rsp+8*48],r11
	je L_254
	mov r8,  [rsp+8*128]
	mov r9,1
	mov r14,r8
	add r14,r9
	mov r14,r14
	
L_255:
	mov r8,  [gbl+8*43]
	cmp r14,r8
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*131],r9
	je L_256
	mov r8,r15
	mov r9,  [rsp+8*128]
	lea r10,[r8+r9*8+8H]
	mov r11, [r10]
	mov qword [rsp+8*132],r8
	mov r8,r15
	mov qword [rsp+8*133],r10
	lea r10,[r8+r14*8+8H]
	mov qword [rsp+8*135],r8
	mov r8, [r10]
	cmp r11,r8
	mov qword [rsp+8*136],r10
	mov r10, 0
	setg r10B
	cmp r10, 0
	mov qword [rsp+8*137],r8
	mov qword [rsp+8*138],r10
	mov qword [rsp+8*134],r11
	je L_257
	mov r8,r15
	mov r9,  [rsp+8*128]
	lea r10,[r8+r9*8+8H]
	mov r11, [r10]
	mov qword [rsp+8*139],r8
	mov r8,r11
	mov qword [rsp+8*140],r10
	mov r10,r15
	mov qword [rsp+8*141],r11
	lea r11,[r10+r14*8+8H]
	mov qword [rsp+8*143],r10
	mov r10, [r11]
	mov qword [rsp+8*144],r11
	mov r11,r15
	mov qword [rsp+8*142],r8
	lea r8,[r11+r9*8+8H]
	mov [r8],r10
	mov qword [rsp+8*147],r8
	mov r8,r15
	mov qword [rsp+8*145],r10
	lea r10,[r8+r14*8+8H]
	mov qword [rsp+8*148],r8
	mov r8,  [rsp+8*142]
	mov [r10],r8
	mov qword [rsp+8*149],r10
	mov qword [rsp+8*146],r11
	
L_257:
	mov r8,1
	add r14,r8
	jmp L_255
	
L_256:
	mov r8,  [rsp+8*128]
	mov r9,1
	add r8,r9
	mov qword [rsp+8*128],r8
	jmp L_252
	
L_254:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*128],r8
	
L_260:
	mov r8,  [rsp+8*128]
	mov r9,  [gbl+8*43]
	cmp r8,r9
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_261
	mov r14,r15
	mov r8,  [rsp+8*128]
	lea r14,[r14+r8*8+8H]
	mov r14, [r14]
	mov r9,1
	mov r10,r8
	add r10,r9
	cmp r14,r10
	mov r14, 0
	setne r14B
	cmp r14, 0
	mov qword [rsp+8*154],r10
	je L_262
	mov r8,0
	mov r15,r8
	jmp L_248
	
L_262:
	mov r8,  [rsp+8*128]
	mov r9,1
	add r8,r9
	mov qword [rsp+8*128],r8
	jmp L_260
	
L_261:
	mov r8,1
	mov r15,r8
	
L_248:
	mov r15,r15
	cmp r15, 0
	sete r15B
	cmp r15, 0
	je L_134
	mov r8,  [rsp+8*4]
	mov r9,1
	add r8,r9
	mov rdi,r8
	mov r15,rdi
	mov qword [rsp+8*4],r8
	mov     rdi,  r15
	call    toString
	mov     qword r15, rax
	mov     rsi,  r15
	mov     rdi, t285
	call    concat
	mov  r15, rax
	mov     rsi, t291
	mov     rdi,  r15
	call    concat
	mov  r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, r15 
	add rdi, 1 
	call puts
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*162],r8
	
L_182:
	mov r8,  [rsp+8*162]
	mov r9,  [gbl+8*43]
	cmp r8,r9
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_183
	mov r15,r13
	mov r8,  [rsp+8*162]
	lea r14,[r15+r8*8+8H]
	mov r15, [r14]
	mov r9,1
	sub r15,r9
	mov [r14],r15
	mov r10,1
	mov r15,r8
	add r15,r10
	mov r8,r15
	mov qword [rsp+8*162],r8
	jmp L_182
	
L_183:
	mov r15,r13
	mov r8,  [gbl+8*43]
	lea r15,[r15+r8*8+8H]
	mov [r15],r8
	mov r15,r8
	mov r9,1
	add r8,r9
	mov r10,0
	mov r15,r10
	mov r15,r15
	mov r11,0
	mov r15,r11
	mov qword [gbl+8*43],r8
	
L_264:
	mov r8,  [gbl+8*43]
	cmp r15,r8
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_265
	mov r14,r13
	lea r14,[r14+r15*8+8H]
	mov r14, [r14]
	mov r8,0
	cmp r14,r8
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_266
	mov r8,1
	mov r14,r15
	add r14,r8
	mov r14,r14
	
L_267:
	mov r8,  [gbl+8*43]
	cmp r14,r8
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*89],r9
	je L_268
	mov r8,r13
	lea r9,[r8+r14*8+8H]
	mov r10, [r9]
	mov r11,0
	cmp r10,r11
	mov qword [rsp+8*90],r8
	mov r8, 0
	setne r8B
	cmp r8, 0
	mov qword [rsp+8*93],r8
	mov qword [rsp+8*91],r9
	mov qword [rsp+8*92],r10
	je L_269
	mov rsi,r14
	mov rdi,r15
	mov r14,rdi
	mov r8,rsi
	mov r9,r13
	lea r10,[r9+r14*8+8H]
	mov r11, [r10]
	mov qword [rsp+8*97],r9
	mov r9,r11
	mov qword [rsp+8*98],r10
	mov r10,r13
	mov qword [rsp+8*99],r11
	lea r11,[r10+r8*8+8H]
	mov qword [rsp+8*101],r10
	mov r10, [r11]
	mov qword [rsp+8*102],r11
	mov r11,r13
	mov qword [rsp+8*100],r9
	lea r9,[r11+r14*8+8H]
	mov [r9],r10
	mov qword [rsp+8*105],r9
	mov r9,r13
	mov qword [rsp+8*103],r10
	lea r10,[r9+r8*8+8H]
	mov qword [rsp+8*96],r8
	mov r8,  [rsp+8*100]
	mov [r10],r8
	mov r8,0
	mov r14,r8
	mov r14,r14
	mov qword [rsp+8*106],r9
	mov qword [rsp+8*107],r10
	mov qword [rsp+8*104],r11
	jmp L_268
	
L_269:
	mov r8,1
	add r14,r8
	jmp L_267
	
L_268:
	
L_266:
	mov r8,1
	add r15,r8
	jmp L_264
	
L_265:
	mov r8,0
	mov r15,r8
	
L_274:
	mov r8,  [gbl+8*43]
	cmp r15,r8
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_275
	mov r14,r13
	lea r14,[r14+r15*8+8H]
	mov r14, [r14]
	mov r8,0
	cmp r14,r8
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_276
	mov r8,r15
	mov qword [gbl+8*43],r8
	jmp L_275
	
L_276:
	mov r8,1
	add r15,r8
	jmp L_274
	
L_275:
	mov r8,0
	mov r15,r8
	mov r15,r15
	mov r9,0
	mov r15,r9
	
L_187:
	mov r8,  [gbl+8*43]
	cmp r15,r8
	mov r9, 0
	setl r9B
	cmp r9, 0
	mov qword [rsp+8*70],r9
	je L_188
	mov r8,r13
	lea r9,[r8+r15*8+8H]
	mov r10, [r9]
	mov rdi,r10
	mov r11,rdi
	mov qword [rsp+8*71],r8
	mov qword [rsp+8*72],r9
	mov qword [rsp+8*73],r10
	mov qword [rsp+8*74],r11
	mov     rdi, [rsp+8*74]
	call    toString
	mov     qword[rsp+8*75], rax
	mov     rsi, t107
	mov     rdi, [rsp+8*75]
	call    concat
	mov [rsp+8*76], rax
	mov r8,  [rsp+8*76]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*77],r9
	mov rdi, format
	mov rsi,[rsp+8*77] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8,1
	add r15,r8
	jmp L_187
	
L_188:
	mov r8,t112
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*78],r9
	mov rdi,[rsp+8*78] 
	add rdi, 1 
	call puts
	mov r8,0
	mov r15,r8
	mov r15,r15
	jmp L_133
	
L_134:
	mov r8,  [rsp+8*4]
	mov rdi,r8
	mov r15,rdi
	mov     rdi,  r15
	call    toString
	mov     qword r15, rax
	mov     rsi,  r15
	mov     rdi, t301
	call    concat
	mov  r15, rax
	mov     rsi, t306
	mov     rdi,  r15
	call    concat
	mov  r15, rax
	mov rdi,r15
	mov r15,rdi
	mov rdi, r15 
	add rdi, 1 
	call puts
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1496
	mov r9,48271
	mov r8,r9
	mov r11,2147483647
	mov r10,r11
	mov qword [gbl+8*12],r8
	mov r9,1
	mov r8,r9
	mov qword [gbl+8*30],r8
	mov qword [gbl+8*11],r10
	mov r8,  [rsp+8*179]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   3480
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
	
t306:
	 db 8," step(s)" ,0

t107:
	 db 1," " ,0

t291:
	 db 1,":" ,0

t225:
	 db 79,"Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i" ,0

t301:
	 db 7,"Total: " ,0

t112:
	 db 0,"" ,0

t230:
	 db 12,"Let's start!" ,0

t285:
	 db 5,"step " ,0


