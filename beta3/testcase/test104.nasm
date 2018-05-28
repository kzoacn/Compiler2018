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
	push r11
	push r10
	push r9
	push r8
	call global_init
	pop r8
	pop r9
	pop r10
	pop r11
	pop r12
	pop r13
	pop r14
	pop r15
	mov r15 , rax
	mov rdx,0
	mov rbx,rdx
	mov rdx,0
	mov rax,rdx
	mov qword [rsp+8*2],rbx
	mov rbx,0
	mov rdx,rbx
	mov rbx,3
	mov qword [rsp+8*3],rax
	mov rax,7
	mov r15,rbx
	imul r15,rax
	mov rbx,10
	imul r15,rbx
	mov r11,r15
	mov rbx,0
	mov r12,rbx
	mov qword [rsp+8*4],rdx
	mov     rdi, 100
	push r11
	push r10
	call    mallocArray
	pop r10
	pop r11
	mov     qword  r15, rax
	mov r13,r15
	xor rdx, rdx
	mov rax, [gbl+8*11]
	mov rbx, [gbl+8*12]
	cdq
	idiv rbx
	mov  r15, rax
	mov r15,r15
	xor rdx, rdx
	mov rax, [gbl+8*11]
	mov rbx, [gbl+8*12]
	cdq
	idiv rbx
	mov  r14, rdx
	mov r14,r14
	mov rdi,r11
	mov rbx,rdi
	mov qword [rsp+8*18],rbx
	
L_159:
	mov rbx,  [rsp+8*18]
	cmp r12,rbx
	mov rdx, 0
	setle dl
	cmp rdx, 0
	mov qword [rsp+8*19],rdx
	je L_160
	mov rbx,1
	mov rdx,r12
	add rdx,rbx
	mov rax,r12
	imul rax,rdx
	mov qword [rsp+8*20],rdx
	mov qword [rsp+8*21],rax
	xor rdx, rdx
	mov rax, [rsp+8*21]
	mov rbx, 2
	cdq
	idiv rbx
	mov [rsp+8*22], rax
	mov rbx,  [rsp+8*18]
	mov rdx,  [rsp+8*22]
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*23],rax
	je L_161
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*24],rbx
	jmp L_163
	
L_161:
	mov rbx,1
	add r12,rbx
	jmp L_159
	
L_160:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*24],rbx
	
L_163:
	mov rdx,  [rsp+8*24]
	mov rbx,rdx
	mov rax, 0
	cmp rbx, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*25],rbx
	mov qword [rsp+8*26],rax
	je L_127
	mov rbx,t225
	mov rdi,rbx
	mov r15,rdi
	mov rdi, r15 
	add rdi, 1 
	push r11
	push r10
	call puts
	pop r10
	pop r11
	mov rbx,1
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
L_127:
	mov rbx,t230
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*28],rdx
	mov rdi,[rsp+8*28] 
	add rdi, 1 
	push r11
	push r10
	call puts
	pop r10
	pop r11
	mov rbx,3654898
	mov rdi,rbx
	mov rdx,rdi
	mov rax,rdx
	mov qword [rsp+8*29],rdx
	mov rdx,0
	mov rbx,rdx
	mov rdx,rbx
	mov qword [rsp+8*31],rbx
	mov qword [rsp+8*32],rdx
	mov qword [gbl+8*30],rax
	xor rdx, rdx
	mov rax, [gbl+8*30]
	mov rbx,  r15
	cdq
	idiv rbx
	mov [rsp+8*33], rdx
	mov rbx,  [gbl+8*12]
	mov rdx,  [rsp+8*33]
	mov rax,rbx
	imul rax,rdx
	mov qword [rsp+8*34],rax
	xor rdx, rdx
	mov rax, [gbl+8*30]
	mov rbx,  r15
	cdq
	idiv rbx
	mov [rsp+8*35], rax
	mov rbx,  [rsp+8*35]
	mov rdx,r14
	imul rdx,rbx
	mov rax,  [rsp+8*34]
	sub rax,rdx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,0
	cmp rbx,rdx
	mov qword [rsp+8*34],rax
	mov rax, 0
	setge al
	cmp rax, 0
	mov qword [rsp+8*37],rbx
	mov qword [rsp+8*38],rax
	je L_165
	mov rdx,  [rsp+8*37]
	mov rbx,rdx
	mov qword [gbl+8*30],rbx
	jmp L_166
	
L_165:
	mov rbx,  [rsp+8*37]
	mov rdx,  [gbl+8*11]
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*30],rbx
	mov qword [rsp+8*39],rax
	
L_166:
	mov rdx,  [gbl+8*30]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*40],rbx
	mov qword [rsp+8*41],rax
	xor rdx, rdx
	mov rax, [rsp+8*41]
	mov rbx, 10
	cdq
	idiv rbx
	mov [rsp+8*42], rdx
	mov rbx,  [rsp+8*42]
	mov rdx,1
	add rbx,rdx
	mov rax,rbx
	mov rdi,rax
	mov rbx,rdi
	mov qword [rsp+8*44],rbx
	mov qword [gbl+8*43],rax
	mov     rdi, [rsp+8*44]
	call    toString
	mov     qword[rsp+8*45], rax
	mov rbx,  [rsp+8*45]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*46],rdx
	mov rdi,[rsp+8*46] 
	add rdi, 1 
	push r11
	push r10
	call puts
	pop r10
	pop r11
	
L_128:
	mov rbx,  [gbl+8*43]
	mov rdx,1
	mov rax,rbx
	sub rax,rdx
	mov rdx,  [rsp+8*2]
	cmp rdx,rax
	mov rax, 0
	setl al
	mov rbx,  [rsp+8*48]
	add rbx,rbx
	cmp rax, 0
	mov qword [rsp+8*48],rbx
	mov qword [rsp+8*47],rax
	je L_129
	xor rdx, rdx
	mov rax, [gbl+8*30]
	mov rbx,  r15
	cdq
	idiv rbx
	mov [rsp+8*33], rdx
	mov rbx,  [gbl+8*12]
	mov rdx,  [rsp+8*33]
	mov rax,rbx
	imul rax,rdx
	mov qword [rsp+8*34],rax
	xor rdx, rdx
	mov rax, [gbl+8*30]
	mov rbx,  r15
	cdq
	idiv rbx
	mov [rsp+8*35], rax
	mov rbx,  [rsp+8*35]
	mov rdx,r14
	imul rdx,rbx
	mov rax,  [rsp+8*34]
	sub rax,rdx
	mov rbx,rax
	mov qword [rsp+8*36],rdx
	mov rdx,0
	cmp rbx,rdx
	mov qword [rsp+8*34],rax
	mov rax, 0
	setge al
	cmp rax, 0
	mov qword [rsp+8*37],rbx
	mov qword [rsp+8*38],rax
	je L_169
	mov rdx,  [rsp+8*37]
	mov rbx,rdx
	mov qword [gbl+8*30],rbx
	jmp L_170
	
L_169:
	mov rbx,  [rsp+8*37]
	mov rdx,  [gbl+8*11]
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*30],rbx
	mov qword [rsp+8*39],rax
	
L_170:
	mov rdx,  [gbl+8*30]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*40],rbx
	mov qword [rsp+8*49],rax
	xor rdx, rdx
	mov rax, [rsp+8*49]
	mov rbx, 10
	cdq
	idiv rbx
	mov [rsp+8*50], rdx
	mov rbx,  [rsp+8*50]
	mov rdx,1
	add rbx,rdx
	mov rax,r13
	mov rdx,  [rsp+8*2]
	mov qword [rsp+8*50],rbx
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*51],rax
	mov rax,  [rsp+8*50]
	mov [rbx],rax
	mov qword [rsp+8*52],rbx
	
L_131:
	mov rbx,r13
	mov rdx,  [rsp+8*2]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*53],rbx
	mov rbx, [rax]
	mov qword [rsp+8*54],rax
	mov rax,  [rsp+8*3]
	mov rdx,rbx
	add rdx,rax
	cmp rdx,r11
	mov rdx, 0
	setg dl
	mov qword [rsp+8*55],rbx
	mov rbx,  [rsp+8*48]
	add rbx,rbx
	cmp rdx, 0
	mov qword [rsp+8*48],rbx
	mov qword [rsp+8*56],rdx
	je L_132
	xor rdx, rdx
	mov rax, [gbl+8*30]
	mov rbx,  r15
	cdq
	idiv rbx
	mov [rsp+8*33], rdx
	mov rbx,  [gbl+8*12]
	mov rdx,  [rsp+8*33]
	mov rax,rbx
	imul rax,rdx
	mov qword [rsp+8*34],rax
	xor rdx, rdx
	mov rax, [gbl+8*30]
	mov rbx,  r15
	cdq
	idiv rbx
	mov [rsp+8*35], rax
	mov rbx,  [rsp+8*35]
	mov rdx,r14
	imul rdx,rbx
	mov rax,  [rsp+8*34]
	sub rax,rdx
	mov rbx,rax
	mov rdx,0
	cmp rbx,rdx
	mov rax, 0
	setge al
	cmp rax, 0
	mov qword [rsp+8*37],rbx
	mov qword [rsp+8*38],rax
	je L_173
	mov rdx,  [rsp+8*37]
	mov rbx,rdx
	mov qword [gbl+8*30],rbx
	jmp L_174
	
L_173:
	mov rbx,  [rsp+8*37]
	mov rdx,  [gbl+8*11]
	mov rax,rbx
	add rax,rdx
	mov rbx,rax
	mov qword [gbl+8*30],rbx
	mov qword [rsp+8*39],rax
	
L_174:
	mov rdx,  [gbl+8*30]
	mov rbx,rdx
	mov rax,rbx
	mov qword [rsp+8*40],rbx
	mov qword [rsp+8*57],rax
	xor rdx, rdx
	mov rax, [rsp+8*57]
	mov rbx, 10
	cdq
	idiv rbx
	mov [rsp+8*58], rdx
	mov rbx,  [rsp+8*58]
	mov rdx,1
	add rbx,rdx
	mov rax,r13
	mov rdx,  [rsp+8*2]
	mov qword [rsp+8*58],rbx
	lea rbx,[rax+rdx*8+8H]
	mov qword [rsp+8*59],rax
	mov rax,  [rsp+8*58]
	mov [rbx],rax
	mov qword [rsp+8*60],rbx
	jmp L_131
	
L_132:
	mov rbx,r13
	mov rdx,  [rsp+8*2]
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*61],rbx
	mov rbx, [rax]
	mov qword [rsp+8*62],rax
	mov rax,  [rsp+8*3]
	mov rdx,rax
	add rdx,rbx
	mov rax,rdx
	mov qword [rsp+8*63],rbx
	mov rbx,  [rsp+8*2]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*2],rbx
	mov qword [rsp+8*3],rax
	jmp L_128
	
L_129:
	mov rbx,  [rsp+8*3]
	sub r11,rbx
	mov rdx,  [gbl+8*43]
	mov rax,1
	mov r15,rdx
	sub r15,rax
	mov r14,r13
	lea r15,[r14+r15*8+8H]
	mov [r15],r11
	mov rbx,0
	mov r15,rbx
	
L_177:
	mov rbx,  [gbl+8*43]
	cmp r15,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*70],rdx
	je L_178
	mov rbx,r13
	lea rdx,[rbx+r15*8+8H]
	mov rax, [rdx]
	mov rdi,rax
	mov qword [rsp+8*71],rbx
	mov rbx,rdi
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*72],rdx
	mov qword [rsp+8*73],rax
	mov     rdi, [rsp+8*74]
	call    toString
	mov     qword[rsp+8*75], rax
	mov     rsi, t107
	mov     rdi, [rsp+8*75]
	call    concat
	mov [rsp+8*76], rax
	mov rbx,  [rsp+8*76]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*77],rdx
	mov rdi, format
	mov rsi,[rsp+8*77] 
	add rsi, 1 
	xor rax, rax
	push r11
	push r10
	call printf
	pop r10
	pop r11
	mov rbx,1
	add r15,rbx
	jmp L_177
	
L_178:
	mov rbx,t112
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*78],rdx
	mov rdi,[rsp+8*78] 
	add rdi, 1 
	push r11
	push r10
	call puts
	pop r10
	pop r11
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,0
	mov r15,rdx
	
L_230:
	mov rbx,  [gbl+8*43]
	cmp r15,rbx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_231
	mov r14,r13
	lea r14,[r14+r15*8+8H]
	mov r14, [r14]
	mov rbx,0
	cmp r14,rbx
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_232
	mov rbx,1
	mov r14,r15
	add r14,rbx
	mov r14,r14
	
L_233:
	mov rbx,  [gbl+8*43]
	cmp r14,rbx
	mov r11, 0
	setl r11B
	cmp r11, 0
	je L_234
	mov r11,r13
	lea r11,[r11+r14*8+8H]
	mov r11, [r11]
	mov rbx,0
	cmp r11,rbx
	mov r11, 0
	setne r11B
	cmp r11, 0
	je L_235
	mov rsi,r14
	mov rdi,r15
	mov r14,rdi
	mov r11,rsi
	mov rbx,r13
	lea rdx,[rbx+r14*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*97],rbx
	mov rbx,rax
	mov qword [rsp+8*98],rdx
	mov rdx,r13
	mov qword [rsp+8*100],rbx
	lea rbx,[rdx+r11*8+8H]
	mov qword [rsp+8*99],rax
	mov rax, [rbx]
	mov qword [rsp+8*101],rdx
	mov rdx,r13
	mov qword [rsp+8*102],rbx
	lea rbx,[rdx+r14*8+8H]
	mov [rbx],rax
	mov qword [rsp+8*104],rdx
	mov rdx,r13
	mov qword [rsp+8*105],rbx
	lea rbx,[rdx+r11*8+8H]
	mov qword [rsp+8*103],rax
	mov rax,  [rsp+8*100]
	mov [rbx],rax
	mov qword [rsp+8*106],rdx
	mov rdx,0
	mov r14,rdx
	mov r14,r14
	mov qword [rsp+8*107],rbx
	jmp L_234
	
L_235:
	mov rbx,1
	add r14,rbx
	jmp L_233
	
L_234:
	
L_232:
	mov rbx,1
	add r15,rbx
	jmp L_230
	
L_231:
	mov rbx,0
	mov r15,rbx
	
L_240:
	mov rbx,  [gbl+8*43]
	cmp r15,rbx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_241
	mov r14,r13
	lea r14,[r14+r15*8+8H]
	mov r14, [r14]
	mov rbx,0
	cmp r14,rbx
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_242
	mov rbx,r15
	mov qword [gbl+8*43],rbx
	jmp L_241
	
L_242:
	mov rbx,1
	add r15,rbx
	jmp L_240
	
L_241:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	
L_133:
	mov     rdi, 100
	push r11
	push r10
	call    mallocArray
	pop r10
	pop r11
	mov     qword [rsp+8*117], rax
	mov rbx,  [rsp+8*117]
	mov r15,rbx
	mov rdx,  [gbl+8*43]
	cmp rdx,r12
	mov rax, 0
	setne al
	cmp rax, 0
	mov qword [rsp+8*119],rax
	je L_246
	mov rbx,0
	mov r15,rbx
	jmp L_248
	
L_246:
	mov rbx,0
	mov r14,rbx
	
L_249:
	mov rbx,  [gbl+8*43]
	cmp r14,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*122],rdx
	je L_250
	mov rbx,r13
	lea rdx,[rbx+r14*8+8H]
	mov rax, [rdx]
	mov r11,r15
	lea r11,[r11+r14*8+8H]
	mov [r11],rax
	mov qword [rsp+8*123],rbx
	mov rbx,1
	add r14,rbx
	mov qword [rsp+8*124],rdx
	mov qword [rsp+8*125],rax
	jmp L_249
	
L_250:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*128],rbx
	
L_252:
	mov rbx,  [gbl+8*43]
	mov rdx,1
	mov r14,rbx
	sub r14,rdx
	mov rax,  [rsp+8*128]
	cmp rax,r14
	mov r14, 0
	setl r14B
	mov rdx,  [rsp+8*48]
	add rdx,rdx
	cmp r14, 0
	mov qword [rsp+8*48],rdx
	je L_254
	mov rbx,  [rsp+8*128]
	mov rdx,1
	mov r14,rbx
	add r14,rdx
	mov r14,r14
	
L_255:
	mov rbx,  [gbl+8*43]
	cmp r14,rbx
	mov r11, 0
	setl r11B
	cmp r11, 0
	je L_256
	mov r11,r15
	mov rbx,  [rsp+8*128]
	lea r11,[r11+rbx*8+8H]
	mov rdx, [r11]
	mov r11,r15
	lea r11,[r11+r14*8+8H]
	mov r11, [r11]
	cmp rdx,r11
	mov r11, 0
	setg r11B
	cmp r11, 0
	mov qword [rsp+8*134],rdx
	je L_257
	mov r11,r15
	mov rbx,  [rsp+8*128]
	lea r11,[r11+rbx*8+8H]
	mov r11, [r11]
	mov r11,r11
	mov rdx,r15
	lea rax,[rdx+r14*8+8H]
	mov qword [rsp+8*143],rdx
	mov rdx, [rax]
	mov qword [rsp+8*144],rax
	mov rax,r15
	mov qword [rsp+8*145],rdx
	lea rdx,[rax+rbx*8+8H]
	mov qword [rsp+8*146],rax
	mov rax,  [rsp+8*145]
	mov [rdx],rax
	mov qword [rsp+8*147],rdx
	mov rdx,r15
	lea rax,[rdx+r14*8+8H]
	mov [rax],r11
	mov qword [rsp+8*148],rdx
	mov qword [rsp+8*149],rax
	
L_257:
	mov rbx,1
	add r14,rbx
	jmp L_255
	
L_256:
	mov rbx,  [rsp+8*128]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*128],rbx
	jmp L_252
	
L_254:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*128],rbx
	
L_260:
	mov rbx,  [rsp+8*128]
	mov rdx,  [gbl+8*43]
	cmp rbx,rdx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_261
	mov r14,r15
	mov rbx,  [rsp+8*128]
	lea r14,[r14+rbx*8+8H]
	mov r14, [r14]
	mov rdx,1
	mov r11,rbx
	add r11,rdx
	cmp r14,r11
	mov r14, 0
	setne r14B
	cmp r14, 0
	je L_262
	mov rbx,0
	mov r15,rbx
	jmp L_248
	
L_262:
	mov rbx,  [rsp+8*128]
	mov rdx,1
	add rbx,rdx
	mov qword [rsp+8*128],rbx
	jmp L_260
	
L_261:
	mov rbx,1
	mov r15,rbx
	
L_248:
	mov r15,r15
	cmp r15, 0
	sete r15B
	cmp r15, 0
	je L_134
	mov rbx,  [rsp+8*4]
	mov rdx,1
	add rbx,rdx
	mov rdi,rbx
	mov r15,rdi
	mov qword [rsp+8*4],rbx
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
	push r11
	push r10
	call puts
	pop r10
	pop r11
	mov rbx,0
	mov r11,rbx
	
L_182:
	mov rbx,  [gbl+8*43]
	cmp r11,rbx
	mov r15, 0
	setl r15B
	cmp r15, 0
	je L_183
	mov r15,r13
	lea r14,[r15+r11*8+8H]
	mov r15, [r14]
	mov rbx,1
	sub r15,rbx
	mov [r14],r15
	mov rdx,1
	mov r15,r11
	add r15,rdx
	mov r11,r15
	jmp L_182
	
L_183:
	mov r15,r13
	mov rbx,  [gbl+8*43]
	lea r15,[r15+rbx*8+8H]
	mov [r15],rbx
	mov r15,rbx
	mov rdx,1
	add rbx,rdx
	mov rax,0
	mov r15,rax
	mov r15,r15
	mov rdx,0
	mov r15,rdx
	mov qword [gbl+8*43],rbx
	
L_264:
	mov rbx,  [gbl+8*43]
	cmp r15,rbx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_265
	mov r14,r13
	lea r14,[r14+r15*8+8H]
	mov r14, [r14]
	mov rbx,0
	cmp r14,rbx
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_266
	mov rbx,1
	mov r14,r15
	add r14,rbx
	mov r14,r14
	
L_267:
	mov rbx,  [gbl+8*43]
	cmp r14,rbx
	mov r11, 0
	setl r11B
	cmp r11, 0
	je L_268
	mov r11,r13
	lea r11,[r11+r14*8+8H]
	mov r11, [r11]
	mov rbx,0
	cmp r11,rbx
	mov r11, 0
	setne r11B
	cmp r11, 0
	je L_269
	mov rsi,r14
	mov rdi,r15
	mov r14,rdi
	mov r11,rsi
	mov rbx,r13
	lea rdx,[rbx+r14*8+8H]
	mov rax, [rdx]
	mov qword [rsp+8*97],rbx
	mov rbx,rax
	mov qword [rsp+8*98],rdx
	mov rdx,r13
	mov qword [rsp+8*99],rax
	lea rax,[rdx+r11*8+8H]
	mov qword [rsp+8*101],rdx
	mov rdx, [rax]
	mov qword [rsp+8*102],rax
	mov rax,r13
	mov qword [rsp+8*100],rbx
	lea rbx,[rax+r14*8+8H]
	mov [rbx],rdx
	mov qword [rsp+8*105],rbx
	mov rbx,r13
	mov qword [rsp+8*103],rdx
	lea rdx,[rbx+r11*8+8H]
	mov qword [rsp+8*106],rbx
	mov rbx,  [rsp+8*100]
	mov [rdx],rbx
	mov rbx,0
	mov r14,rbx
	mov r14,r14
	mov qword [rsp+8*107],rdx
	mov qword [rsp+8*104],rax
	jmp L_268
	
L_269:
	mov rbx,1
	add r14,rbx
	jmp L_267
	
L_268:
	
L_266:
	mov rbx,1
	add r15,rbx
	jmp L_264
	
L_265:
	mov rbx,0
	mov r15,rbx
	
L_274:
	mov rbx,  [gbl+8*43]
	cmp r15,rbx
	mov r14, 0
	setl r14B
	cmp r14, 0
	je L_275
	mov r14,r13
	lea r14,[r14+r15*8+8H]
	mov r14, [r14]
	mov rbx,0
	cmp r14,rbx
	mov r14, 0
	sete r14B
	cmp r14, 0
	je L_276
	mov rbx,r15
	mov qword [gbl+8*43],rbx
	jmp L_275
	
L_276:
	mov rbx,1
	add r15,rbx
	jmp L_274
	
L_275:
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	mov rdx,0
	mov r15,rdx
	
L_187:
	mov rbx,  [gbl+8*43]
	cmp r15,rbx
	mov rdx, 0
	setl dl
	cmp rdx, 0
	mov qword [rsp+8*70],rdx
	je L_188
	mov rbx,r13
	lea rdx,[rbx+r15*8+8H]
	mov rax, [rdx]
	mov rdi,rax
	mov qword [rsp+8*71],rbx
	mov rbx,rdi
	mov qword [rsp+8*74],rbx
	mov qword [rsp+8*72],rdx
	mov qword [rsp+8*73],rax
	mov     rdi, [rsp+8*74]
	call    toString
	mov     qword[rsp+8*75], rax
	mov     rsi, t107
	mov     rdi, [rsp+8*75]
	call    concat
	mov [rsp+8*76], rax
	mov rbx,  [rsp+8*76]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*77],rdx
	mov rdi, format
	mov rsi,[rsp+8*77] 
	add rsi, 1 
	xor rax, rax
	push r11
	push r10
	call printf
	pop r10
	pop r11
	mov rbx,1
	add r15,rbx
	jmp L_187
	
L_188:
	mov rbx,t112
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*78],rdx
	mov rdi,[rsp+8*78] 
	add rdi, 1 
	push r11
	push r10
	call puts
	pop r10
	pop r11
	mov rbx,0
	mov r15,rbx
	mov r15,r15
	jmp L_133
	
L_134:
	mov rbx,  [rsp+8*4]
	mov rdi,rbx
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
	push r11
	push r10
	call puts
	pop r10
	pop r11
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 1496
	mov rdx,48271
	mov rbx,rdx
	mov qword [gbl+8*12],rbx
	mov rbx,2147483647
	mov rax,rbx
	mov rdx,1
	mov rbx,rdx
	mov qword [gbl+8*30],rbx
	mov qword [gbl+8*11],rax
	mov rbx,  [rsp+8*179]
	mov rax,rbx
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


