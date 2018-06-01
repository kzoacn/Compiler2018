	 global    main
	 extern    puts
	 extern    printf
	 extern    scanf
	 extern    malloc
	 extern    calloc
	 extern    strlen
	 extern    strcmp
	 extern    memset
	 extern    memcpy
	 extern    sprintf

	 section   .text
myalloc:
        push    rbp
        mov     rbp, rsp
        mov     qword [rbp-18H], rdi
        mov     rax, qword [rel cur.1759]
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-18H]
        add     rax, 8
        and     rax, 0FFFFFFFFFFFFFFF8H
        mov     qword [rbp-18H], rax
        mov     rdx, qword [rel cur.1759]
        mov     rax, qword [rbp-18H]
        add     rax, rdx
        mov     qword [rel cur.1759], rax
        mov     rax, qword [rbp-8H]
        pop     rbp
        ret

toString:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 56
        mov     qword [rbp-38H], rdi
        mov     qword [rbp-8H], 0
        mov     qword [rbp-10H], 1
        cmp     qword [rbp-38H], 0
        jnz     TS_013
        mov     qword [rbp-8H], 1
TS_013:  cmp     qword [rbp-38H], 0
        jns     TS_014
        neg     qword [rbp-38H]
        mov     qword [rbp-10H], -1
        add     qword [rbp-8H], 1
TS_014:  mov     rax, qword [rbp-38H]
        mov     qword [rbp-18H], rax
        jmp     TS_016

TS_015:  add     qword [rbp-8H], 1
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
TS_016:  cmp     qword [rbp-18H], 0
        jg      TS_015
        mov     rax, qword [rbp-8H]
        add     rax, 2
        mov     rdi, rax
        call    myalloc
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
        jnz     TS_017
        mov     rax, qword [rbp-20H]
        mov     byte [rax], 45
TS_017:  mov     rdx, qword [rbp-8H]
        mov     rax, qword [rbp-28H]
        add     rax, rdx
        mov     qword [rbp-20H], rax
        cmp     qword [rbp-38H], 0
        jnz     TS_019
        mov     rax, qword [rbp-20H]
        mov     byte [rax], 48
        jmp     TS_019

TS_018:  mov     rcx, qword [rbp-38H]
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
TS_019:  cmp     qword [rbp-38H], 0
        jg      TS_018
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
        call    myalloc
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
        call    myalloc
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
        jmp     ML_02

ML_01:  add     qword [rbp-10H], 1
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
ML_02:  mov     rax, qword [rbp-28H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      ML_01
        mov     qword [rbp-8H], 0
        jmp     ML_04

ML_03:  add     qword [rbp-10H], 1
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
ML_04:  mov     rax, qword [rbp-30H]
        movzx   eax, byte [rax]
        movzx   eax, al
        cmp     rax, qword [rbp-8H]
        jg      ML_03
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
        jnz     ML_09
        mov     eax, dword [rbp-34H]
        movsxd  rdx, eax
        mov     rax, qword [rbp-40H]
        mov     rsi, rdx
        mov     rdi, rax
        call    address
        mov     rax, qword [rax]
        mov     rdi, rax
        call    mallocArray
        jmp     ML_12

ML_09:  mov     eax, dword [rbp-34H]
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
        jmp     ML_11

ML_10:  mov     eax, dword [rbp-14H]
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
ML_11:  mov     eax, dword [rbp-14H]
        cdqe
        cmp     rax, qword [rbp-20H]
        jl      ML_10
        mov     rax, qword [rbp-28H]
ML_12:  add     rsp, 56
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
	sub    rsp, 14352
	mov     rax, 936870912
        cdqe
        mov     rdi, rax
        call    malloc
	        mov rbx,0
	        mov rsi,0
	        mov rdi,0
	        mov rcx,0
	        mov rdx,0
			mov r8,0
			mov r9,0
			mov r10,0
			mov r11,0
			mov r12,0
			mov r13,0
			mov r14,0
			mov r15,0
        mov     edx, dword 936870912
        movsxd  rdx, edx
        sub     rdx, 16336
        add     rax, rdx
        mov     qword [trsp], rsp
        mov     rsp, rax
        mov     eax, 0
	call global_init
	mov rbx , rax
	mov rax,0
	mov rdx,rax
	mov qword [rsp+8*1],rbx
	mov rax,  [gbl+8*3]
	mov rbx,rax
	mov qword [rsp+8*2],rdx
	mov rdx,0
	lea rax,[rbx+rdx*8+8H]
	mov qword [rsp+8*4],rbx
	mov rbx,t143
	mov [rax],rbx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov qword [rsp+8*5],rax
	mov rax,1
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*6],rbx
	mov rbx,t147
	mov [rdx],rbx
	mov qword [rsp+8*7],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,2
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*8],rbx
	mov rbx,t151
	mov [rdx],rbx
	mov qword [rsp+8*9],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,3
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*10],rbx
	mov rbx,t155
	mov [rdx],rbx
	mov qword [rsp+8*11],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,4
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*12],rbx
	mov rbx,t159
	mov [rdx],rbx
	mov qword [rsp+8*13],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,5
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*14],rbx
	mov rbx,t163
	mov [rdx],rbx
	mov qword [rsp+8*15],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,6
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*16],rbx
	mov rbx,t167
	mov [rdx],rbx
	mov qword [rsp+8*17],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*18],rbx
	mov rbx,t171
	mov [rdx],rbx
	mov qword [rsp+8*19],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*20],rbx
	mov rbx,t175
	mov [rdx],rbx
	mov qword [rsp+8*21],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,9
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*22],rbx
	mov rbx,t179
	mov [rdx],rbx
	mov qword [rsp+8*23],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*24],rbx
	mov rbx,t183
	mov [rdx],rbx
	mov qword [rsp+8*25],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,11
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*26],rbx
	mov rbx,t187
	mov [rdx],rbx
	mov qword [rsp+8*27],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,12
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*28],rbx
	mov rbx,t191
	mov [rdx],rbx
	mov qword [rsp+8*29],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,13
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*30],rbx
	mov rbx,t195
	mov [rdx],rbx
	mov qword [rsp+8*31],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,14
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*32],rbx
	mov rbx,t199
	mov [rdx],rbx
	mov qword [rsp+8*33],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*34],rbx
	mov rbx,t203
	mov [rdx],rbx
	mov qword [rsp+8*35],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*36],rbx
	mov rbx,t207
	mov [rdx],rbx
	mov qword [rsp+8*37],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*38],rbx
	mov rbx,t211
	mov [rdx],rbx
	mov qword [rsp+8*39],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,18
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*40],rbx
	mov rbx,t215
	mov [rdx],rbx
	mov qword [rsp+8*41],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,19
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*42],rbx
	mov rbx,t219
	mov [rdx],rbx
	mov qword [rsp+8*43],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,20
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*44],rbx
	mov rbx,t223
	mov [rdx],rbx
	mov qword [rsp+8*45],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,21
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*46],rbx
	mov rbx,t227
	mov [rdx],rbx
	mov qword [rsp+8*47],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,22
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*48],rbx
	mov rbx,t231
	mov [rdx],rbx
	mov qword [rsp+8*49],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,23
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*50],rbx
	mov rbx,t235
	mov [rdx],rbx
	mov qword [rsp+8*51],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,24
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*52],rbx
	mov rbx,t239
	mov [rdx],rbx
	mov qword [rsp+8*53],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,25
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*54],rbx
	mov rbx,t243
	mov [rdx],rbx
	mov qword [rsp+8*55],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*56],rbx
	mov rbx,t247
	mov [rdx],rbx
	mov qword [rsp+8*57],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,27
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*58],rbx
	mov rbx,t251
	mov [rdx],rbx
	mov qword [rsp+8*59],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*60],rbx
	mov rbx,t255
	mov [rdx],rbx
	mov qword [rsp+8*61],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,29
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*62],rbx
	mov rbx,t259
	mov [rdx],rbx
	mov qword [rsp+8*63],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,30
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*64],rbx
	mov rbx,t263
	mov [rdx],rbx
	mov qword [rsp+8*65],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,31
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*66],rbx
	mov rbx,t267
	mov [rdx],rbx
	mov qword [rsp+8*67],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,32
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*68],rbx
	mov rbx,t271
	mov [rdx],rbx
	mov qword [rsp+8*69],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,33
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*70],rbx
	mov rbx,t275
	mov [rdx],rbx
	mov qword [rsp+8*71],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,34
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*72],rbx
	mov rbx,t279
	mov [rdx],rbx
	mov qword [rsp+8*73],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,35
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*74],rbx
	mov rbx,t283
	mov [rdx],rbx
	mov qword [rsp+8*75],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,36
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*76],rbx
	mov rbx,t287
	mov [rdx],rbx
	mov qword [rsp+8*77],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,37
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*78],rbx
	mov rbx,t291
	mov [rdx],rbx
	mov qword [rsp+8*79],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,38
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*80],rbx
	mov rbx,t295
	mov [rdx],rbx
	mov qword [rsp+8*81],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,39
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*82],rbx
	mov rbx,t299
	mov [rdx],rbx
	mov qword [rsp+8*83],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,40
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*84],rbx
	mov rbx,t303
	mov [rdx],rbx
	mov qword [rsp+8*85],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,41
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*86],rbx
	mov rbx,t307
	mov [rdx],rbx
	mov qword [rsp+8*87],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,42
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*88],rbx
	mov rbx,t311
	mov [rdx],rbx
	mov qword [rsp+8*89],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,43
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*90],rbx
	mov rbx,t315
	mov [rdx],rbx
	mov qword [rsp+8*91],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,44
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*92],rbx
	mov rbx,t319
	mov [rdx],rbx
	mov qword [rsp+8*93],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,45
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*94],rbx
	mov rbx,t323
	mov [rdx],rbx
	mov qword [rsp+8*95],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,46
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*96],rbx
	mov rbx,t327
	mov [rdx],rbx
	mov qword [rsp+8*97],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,47
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*98],rbx
	mov rbx,t331
	mov [rdx],rbx
	mov qword [rsp+8*99],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,48
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*100],rbx
	mov rbx,t335
	mov [rdx],rbx
	mov qword [rsp+8*101],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,49
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*102],rbx
	mov rbx,t339
	mov [rdx],rbx
	mov qword [rsp+8*103],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,50
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*104],rbx
	mov rbx,t343
	mov [rdx],rbx
	mov qword [rsp+8*105],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,51
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*106],rbx
	mov rbx,t347
	mov [rdx],rbx
	mov qword [rsp+8*107],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,52
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*108],rbx
	mov rbx,t351
	mov [rdx],rbx
	mov qword [rsp+8*109],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,53
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*110],rbx
	mov rbx,t355
	mov [rdx],rbx
	mov qword [rsp+8*111],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,54
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*112],rbx
	mov rbx,t359
	mov [rdx],rbx
	mov qword [rsp+8*113],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,55
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*114],rbx
	mov rbx,t363
	mov [rdx],rbx
	mov qword [rsp+8*115],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,56
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*116],rbx
	mov rbx,t367
	mov [rdx],rbx
	mov qword [rsp+8*117],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,57
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*118],rbx
	mov rbx,t371
	mov [rdx],rbx
	mov qword [rsp+8*119],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*120],rbx
	mov rbx,t375
	mov [rdx],rbx
	mov qword [rsp+8*121],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*122],rbx
	mov rbx,t379
	mov [rdx],rbx
	mov qword [rsp+8*123],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,60
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*124],rbx
	mov rbx,t383
	mov [rdx],rbx
	mov qword [rsp+8*125],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,61
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*126],rbx
	mov rbx,t387
	mov [rdx],rbx
	mov qword [rsp+8*127],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,62
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*128],rbx
	mov rbx,t391
	mov [rdx],rbx
	mov qword [rsp+8*129],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,63
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*130],rbx
	mov rbx,t395
	mov [rdx],rbx
	mov qword [rsp+8*131],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,64
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*132],rbx
	mov rbx,t399
	mov [rdx],rbx
	mov qword [rsp+8*133],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*134],rbx
	mov rbx,t403
	mov [rdx],rbx
	mov qword [rsp+8*135],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*136],rbx
	mov rbx,t407
	mov [rdx],rbx
	mov qword [rsp+8*137],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*138],rbx
	mov rbx,t411
	mov [rdx],rbx
	mov qword [rsp+8*139],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,68
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*140],rbx
	mov rbx,t415
	mov [rdx],rbx
	mov qword [rsp+8*141],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*142],rbx
	mov rbx,t419
	mov [rdx],rbx
	mov qword [rsp+8*143],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,70
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*144],rbx
	mov rbx,t423
	mov [rdx],rbx
	mov qword [rsp+8*145],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*146],rbx
	mov rbx,t427
	mov [rdx],rbx
	mov qword [rsp+8*147],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,72
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*148],rbx
	mov rbx,t431
	mov [rdx],rbx
	mov qword [rsp+8*149],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,73
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*150],rbx
	mov rbx,t435
	mov [rdx],rbx
	mov qword [rsp+8*151],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,74
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*152],rbx
	mov rbx,t439
	mov [rdx],rbx
	mov qword [rsp+8*153],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,75
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*154],rbx
	mov rbx,t443
	mov [rdx],rbx
	mov qword [rsp+8*155],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*156],rbx
	mov rbx,t447
	mov [rdx],rbx
	mov qword [rsp+8*157],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,77
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*158],rbx
	mov rbx,t451
	mov [rdx],rbx
	mov qword [rsp+8*159],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,78
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*160],rbx
	mov rbx,t455
	mov [rdx],rbx
	mov qword [rsp+8*161],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,79
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*162],rbx
	mov rbx,t459
	mov [rdx],rbx
	mov qword [rsp+8*163],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*164],rbx
	mov rbx,t463
	mov [rdx],rbx
	mov qword [rsp+8*165],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*166],rbx
	mov rbx,t467
	mov [rdx],rbx
	mov qword [rsp+8*167],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*168],rbx
	mov rbx,t471
	mov [rdx],rbx
	mov qword [rsp+8*169],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*170],rbx
	mov rbx,t475
	mov [rdx],rbx
	mov qword [rsp+8*171],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,84
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*172],rbx
	mov rbx,t479
	mov [rdx],rbx
	mov qword [rsp+8*173],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,85
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*174],rbx
	mov rbx,t483
	mov [rdx],rbx
	mov qword [rsp+8*175],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*176],rbx
	mov rbx,t487
	mov [rdx],rbx
	mov qword [rsp+8*177],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,87
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*178],rbx
	mov rbx,t491
	mov [rdx],rbx
	mov qword [rsp+8*179],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,88
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*180],rbx
	mov rbx,t495
	mov [rdx],rbx
	mov qword [rsp+8*181],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,89
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*182],rbx
	mov rbx,t499
	mov [rdx],rbx
	mov qword [rsp+8*183],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,90
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*184],rbx
	mov rbx,t503
	mov [rdx],rbx
	mov qword [rsp+8*185],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,91
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*186],rbx
	mov rbx,t507
	mov [rdx],rbx
	mov qword [rsp+8*187],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,92
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*188],rbx
	mov rbx,t511
	mov [rdx],rbx
	mov qword [rsp+8*189],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*191],rbx
	mov rbx,t515
	mov [rdx],rbx
	mov qword [rsp+8*192],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,1
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*193],rbx
	mov rbx,t519
	mov [rdx],rbx
	mov qword [rsp+8*194],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,2
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*195],rbx
	mov rbx,t523
	mov [rdx],rbx
	mov qword [rsp+8*196],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,3
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*197],rbx
	mov rbx,t527
	mov [rdx],rbx
	mov qword [rsp+8*198],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,4
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*199],rbx
	mov rbx,t531
	mov [rdx],rbx
	mov qword [rsp+8*200],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,5
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*201],rbx
	mov rbx,t535
	mov [rdx],rbx
	mov qword [rsp+8*202],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,6
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*203],rbx
	mov rbx,t539
	mov [rdx],rbx
	mov qword [rsp+8*204],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*205],rbx
	mov rbx,t543
	mov [rdx],rbx
	mov qword [rsp+8*206],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*207],rbx
	mov rbx,t547
	mov [rdx],rbx
	mov qword [rsp+8*208],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,9
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*209],rbx
	mov rbx,t551
	mov [rdx],rbx
	mov qword [rsp+8*210],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*211],rbx
	mov rbx,t555
	mov [rdx],rbx
	mov qword [rsp+8*212],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,11
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*213],rbx
	mov rbx,t559
	mov [rdx],rbx
	mov qword [rsp+8*214],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,12
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*215],rbx
	mov rbx,t563
	mov [rdx],rbx
	mov qword [rsp+8*216],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,13
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*217],rbx
	mov rbx,t567
	mov [rdx],rbx
	mov qword [rsp+8*218],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,14
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*219],rbx
	mov rbx,t571
	mov [rdx],rbx
	mov qword [rsp+8*220],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*221],rbx
	mov rbx,t575
	mov [rdx],rbx
	mov qword [rsp+8*222],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*223],rbx
	mov rbx,t579
	mov [rdx],rbx
	mov qword [rsp+8*224],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*225],rbx
	mov rbx,t583
	mov [rdx],rbx
	mov qword [rsp+8*226],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,18
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*227],rbx
	mov rbx,t587
	mov [rdx],rbx
	mov qword [rsp+8*228],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,19
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*229],rbx
	mov rbx,t591
	mov [rdx],rbx
	mov qword [rsp+8*230],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,20
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*231],rbx
	mov rbx,t595
	mov [rdx],rbx
	mov qword [rsp+8*232],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,21
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*233],rbx
	mov rbx,t599
	mov [rdx],rbx
	mov qword [rsp+8*234],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,22
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*235],rbx
	mov rbx,t603
	mov [rdx],rbx
	mov qword [rsp+8*236],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,23
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*237],rbx
	mov rbx,t607
	mov [rdx],rbx
	mov qword [rsp+8*238],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,24
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*239],rbx
	mov rbx,t611
	mov [rdx],rbx
	mov qword [rsp+8*240],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,25
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*241],rbx
	mov rbx,t615
	mov [rdx],rbx
	mov qword [rsp+8*242],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*243],rbx
	mov rbx,t619
	mov [rdx],rbx
	mov qword [rsp+8*244],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,27
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*245],rbx
	mov rbx,t623
	mov [rdx],rbx
	mov qword [rsp+8*246],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*247],rbx
	mov rbx,t627
	mov [rdx],rbx
	mov qword [rsp+8*248],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,29
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*249],rbx
	mov rbx,t631
	mov [rdx],rbx
	mov qword [rsp+8*250],rdx
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,30
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*251],rbx
	mov rbx,t635
	mov [rdx],rbx
	mov qword [rsp+8*252],rdx
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*253],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*254],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*255],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*258],rbx
	mov qword [rsp+8*256],rdx
	mov qword [rsp+8*257],rax
	mov     rsi, [rsp+8*258]
	mov     rdi, [rsp+8*255]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*260],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*262],rbx
	mov qword [rsp+8*261],rdx
	mov     rsi, [rsp+8*262]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*263],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*265],rbx
	mov qword [rsp+8*264],rdx
	mov     rsi, [rsp+8*265]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*266],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*268],rbx
	mov qword [rsp+8*267],rdx
	mov     rsi, [rsp+8*268]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*269],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*271],rbx
	mov qword [rsp+8*270],rdx
	mov     rsi, [rsp+8*271]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*272],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*274],rbx
	mov qword [rsp+8*273],rdx
	mov     rsi, [rsp+8*274]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*275],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*277],rbx
	mov qword [rsp+8*276],rdx
	mov     rsi, [rsp+8*277]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*278],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*280],rbx
	mov qword [rsp+8*279],rdx
	mov     rsi, [rsp+8*280]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*281],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*283],rbx
	mov qword [rsp+8*282],rdx
	mov     rsi, [rsp+8*283]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*284],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*286],rbx
	mov qword [rsp+8*285],rdx
	mov     rsi, [rsp+8*286]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*287],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*289],rbx
	mov qword [rsp+8*288],rdx
	mov     rsi, [rsp+8*289]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*290],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*292],rbx
	mov qword [rsp+8*291],rdx
	mov     rsi, [rsp+8*292]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*293],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*295],rbx
	mov qword [rsp+8*294],rdx
	mov     rsi, [rsp+8*295]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*296],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*298],rbx
	mov qword [rsp+8*297],rdx
	mov     rsi, [rsp+8*298]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*299],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*301],rbx
	mov qword [rsp+8*300],rdx
	mov     rsi, [rsp+8*301]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*302],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*304],rbx
	mov qword [rsp+8*303],rdx
	mov     rsi, [rsp+8*304]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*305],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*307],rbx
	mov qword [rsp+8*306],rdx
	mov     rsi, [rsp+8*307]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,89
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*308],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*310],rbx
	mov qword [rsp+8*309],rdx
	mov     rsi, [rsp+8*310]
	mov     rdi, [rsp+8*259]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*259], rax
	mov rbx,  [rsp+8*259]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*312],rdx
	mov rdi,[rsp+8*312] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*313],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*314],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*315],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*318],rbx
	mov qword [rsp+8*316],rdx
	mov qword [rsp+8*317],rax
	mov     rsi, [rsp+8*318]
	mov     rdi, [rsp+8*315]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*320],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*322],rbx
	mov qword [rsp+8*321],rdx
	mov     rsi, [rsp+8*322]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*323],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*325],rbx
	mov qword [rsp+8*324],rdx
	mov     rsi, [rsp+8*325]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*326],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*328],rbx
	mov qword [rsp+8*327],rdx
	mov     rsi, [rsp+8*328]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*329],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*331],rbx
	mov qword [rsp+8*330],rdx
	mov     rsi, [rsp+8*331]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*332],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*334],rbx
	mov qword [rsp+8*333],rdx
	mov     rsi, [rsp+8*334]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*335],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*337],rbx
	mov qword [rsp+8*336],rdx
	mov     rsi, [rsp+8*337]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*338],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*340],rbx
	mov qword [rsp+8*339],rdx
	mov     rsi, [rsp+8*340]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*341],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*343],rbx
	mov qword [rsp+8*342],rdx
	mov     rsi, [rsp+8*343]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*344],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*346],rbx
	mov qword [rsp+8*345],rdx
	mov     rsi, [rsp+8*346]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*347],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*349],rbx
	mov qword [rsp+8*348],rdx
	mov     rsi, [rsp+8*349]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*350],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*352],rbx
	mov qword [rsp+8*351],rdx
	mov     rsi, [rsp+8*352]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*353],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*355],rbx
	mov qword [rsp+8*354],rdx
	mov     rsi, [rsp+8*355]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*356],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*358],rbx
	mov qword [rsp+8*357],rdx
	mov     rsi, [rsp+8*358]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*360],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*362],rbx
	mov qword [rsp+8*361],rdx
	mov     rsi, [rsp+8*362]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*363],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*365],rbx
	mov qword [rsp+8*364],rdx
	mov     rsi, [rsp+8*365]
	mov     rdi, [rsp+8*319]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*319], rax
	mov rbx,  [rsp+8*319]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*366],rdx
	mov rdi,[rsp+8*366] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*367],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*368],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*369],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*372],rbx
	mov qword [rsp+8*370],rdx
	mov qword [rsp+8*371],rax
	mov     rsi, [rsp+8*372]
	mov     rdi, [rsp+8*369]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*374],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*376],rbx
	mov qword [rsp+8*375],rdx
	mov     rsi, [rsp+8*376]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*377],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*379],rbx
	mov qword [rsp+8*378],rdx
	mov     rsi, [rsp+8*379]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*380],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*382],rbx
	mov qword [rsp+8*381],rdx
	mov     rsi, [rsp+8*382]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*383],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*385],rbx
	mov qword [rsp+8*384],rdx
	mov     rsi, [rsp+8*385]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*386],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*388],rbx
	mov qword [rsp+8*387],rdx
	mov     rsi, [rsp+8*388]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*389],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*391],rbx
	mov qword [rsp+8*390],rdx
	mov     rsi, [rsp+8*391]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*392],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*394],rbx
	mov qword [rsp+8*393],rdx
	mov     rsi, [rsp+8*394]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*395],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*397],rbx
	mov qword [rsp+8*396],rdx
	mov     rsi, [rsp+8*397]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*398],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*400],rbx
	mov qword [rsp+8*399],rdx
	mov     rsi, [rsp+8*400]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*401],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*403],rbx
	mov qword [rsp+8*402],rdx
	mov     rsi, [rsp+8*403]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*404],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*406],rbx
	mov qword [rsp+8*405],rdx
	mov     rsi, [rsp+8*406]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*407],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*409],rbx
	mov qword [rsp+8*408],rdx
	mov     rsi, [rsp+8*409]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*410],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*412],rbx
	mov qword [rsp+8*411],rdx
	mov     rsi, [rsp+8*412]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*413],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*415],rbx
	mov qword [rsp+8*414],rdx
	mov     rsi, [rsp+8*415]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*416],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*418],rbx
	mov qword [rsp+8*417],rdx
	mov     rsi, [rsp+8*418]
	mov     rdi, [rsp+8*373]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*373], rax
	mov rbx,  [rsp+8*373]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*419],rdx
	mov rdi,[rsp+8*419] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*420],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*421],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*422],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*425],rbx
	mov qword [rsp+8*423],rdx
	mov qword [rsp+8*424],rax
	mov     rsi, [rsp+8*425]
	mov     rdi, [rsp+8*422]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*427],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*429],rbx
	mov qword [rsp+8*428],rdx
	mov     rsi, [rsp+8*429]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*430],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*432],rbx
	mov qword [rsp+8*431],rdx
	mov     rsi, [rsp+8*432]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*433],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*435],rbx
	mov qword [rsp+8*434],rdx
	mov     rsi, [rsp+8*435]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*436],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*438],rbx
	mov qword [rsp+8*437],rdx
	mov     rsi, [rsp+8*438]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*439],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*441],rbx
	mov qword [rsp+8*440],rdx
	mov     rsi, [rsp+8*441]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*442],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*444],rbx
	mov qword [rsp+8*443],rdx
	mov     rsi, [rsp+8*444]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*445],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*447],rbx
	mov qword [rsp+8*446],rdx
	mov     rsi, [rsp+8*447]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*448],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*450],rbx
	mov qword [rsp+8*449],rdx
	mov     rsi, [rsp+8*450]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*451],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*453],rbx
	mov qword [rsp+8*452],rdx
	mov     rsi, [rsp+8*453]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*454],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*456],rbx
	mov qword [rsp+8*455],rdx
	mov     rsi, [rsp+8*456]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*457],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*459],rbx
	mov qword [rsp+8*458],rdx
	mov     rsi, [rsp+8*459]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*460],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*462],rbx
	mov qword [rsp+8*461],rdx
	mov     rsi, [rsp+8*462]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*463],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*465],rbx
	mov qword [rsp+8*464],rdx
	mov     rsi, [rsp+8*465]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*466],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*468],rbx
	mov qword [rsp+8*467],rdx
	mov     rsi, [rsp+8*468]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*469],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*471],rbx
	mov qword [rsp+8*470],rdx
	mov     rsi, [rsp+8*471]
	mov     rdi, [rsp+8*426]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*426], rax
	mov rbx,  [rsp+8*426]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*472],rdx
	mov rdi,[rsp+8*472] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*473],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*474],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*475],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*478],rbx
	mov qword [rsp+8*476],rdx
	mov qword [rsp+8*477],rax
	mov     rsi, [rsp+8*478]
	mov     rdi, [rsp+8*475]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*480],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*482],rbx
	mov qword [rsp+8*481],rdx
	mov     rsi, [rsp+8*482]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*483],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*485],rbx
	mov qword [rsp+8*484],rdx
	mov     rsi, [rsp+8*485]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*486],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*488],rbx
	mov qword [rsp+8*487],rdx
	mov     rsi, [rsp+8*488]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*489],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*491],rbx
	mov qword [rsp+8*490],rdx
	mov     rsi, [rsp+8*491]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,18
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*492],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*494],rbx
	mov qword [rsp+8*493],rdx
	mov     rsi, [rsp+8*494]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*495],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*497],rbx
	mov qword [rsp+8*496],rdx
	mov     rsi, [rsp+8*497]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*498],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*500],rbx
	mov qword [rsp+8*499],rdx
	mov     rsi, [rsp+8*500]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*501],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*503],rbx
	mov qword [rsp+8*502],rdx
	mov     rsi, [rsp+8*503]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*504],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*506],rbx
	mov qword [rsp+8*505],rdx
	mov     rsi, [rsp+8*506]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*507],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*509],rbx
	mov qword [rsp+8*508],rdx
	mov     rsi, [rsp+8*509]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*510],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*512],rbx
	mov qword [rsp+8*511],rdx
	mov     rsi, [rsp+8*512]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*513],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*515],rbx
	mov qword [rsp+8*514],rdx
	mov     rsi, [rsp+8*515]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*516],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*518],rbx
	mov qword [rsp+8*517],rdx
	mov     rsi, [rsp+8*518]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,18
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*519],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*521],rbx
	mov qword [rsp+8*520],rdx
	mov     rsi, [rsp+8*521]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*522],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*524],rbx
	mov qword [rsp+8*523],rdx
	mov     rsi, [rsp+8*524]
	mov     rdi, [rsp+8*479]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*479], rax
	mov rbx,  [rsp+8*479]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*525],rdx
	mov rdi,[rsp+8*525] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*526],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*527],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*528],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*531],rbx
	mov qword [rsp+8*529],rdx
	mov qword [rsp+8*530],rax
	mov     rsi, [rsp+8*531]
	mov     rdi, [rsp+8*528]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*533],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*535],rbx
	mov qword [rsp+8*534],rdx
	mov     rsi, [rsp+8*535]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*536],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*538],rbx
	mov qword [rsp+8*537],rdx
	mov     rsi, [rsp+8*538]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*539],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*541],rbx
	mov qword [rsp+8*540],rdx
	mov     rsi, [rsp+8*541]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*542],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*544],rbx
	mov qword [rsp+8*543],rdx
	mov     rsi, [rsp+8*544]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,19
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*545],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*547],rbx
	mov qword [rsp+8*546],rdx
	mov     rsi, [rsp+8*547]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*548],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*550],rbx
	mov qword [rsp+8*549],rdx
	mov     rsi, [rsp+8*550]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*551],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*553],rbx
	mov qword [rsp+8*552],rdx
	mov     rsi, [rsp+8*553]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*554],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*556],rbx
	mov qword [rsp+8*555],rdx
	mov     rsi, [rsp+8*556]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*557],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*559],rbx
	mov qword [rsp+8*558],rdx
	mov     rsi, [rsp+8*559]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*560],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*562],rbx
	mov qword [rsp+8*561],rdx
	mov     rsi, [rsp+8*562]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*563],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*565],rbx
	mov qword [rsp+8*564],rdx
	mov     rsi, [rsp+8*565]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*566],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*568],rbx
	mov qword [rsp+8*567],rdx
	mov     rsi, [rsp+8*568]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*569],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*571],rbx
	mov qword [rsp+8*570],rdx
	mov     rsi, [rsp+8*571]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,19
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*572],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*574],rbx
	mov qword [rsp+8*573],rdx
	mov     rsi, [rsp+8*574]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*575],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*577],rbx
	mov qword [rsp+8*576],rdx
	mov     rsi, [rsp+8*577]
	mov     rdi, [rsp+8*532]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*532], rax
	mov rbx,  [rsp+8*532]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*578],rdx
	mov rdi,[rsp+8*578] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*579],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*580],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*581],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*584],rbx
	mov qword [rsp+8*582],rdx
	mov qword [rsp+8*583],rax
	mov     rsi, [rsp+8*584]
	mov     rdi, [rsp+8*581]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*586],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*588],rbx
	mov qword [rsp+8*587],rdx
	mov     rsi, [rsp+8*588]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*589],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*591],rbx
	mov qword [rsp+8*590],rdx
	mov     rsi, [rsp+8*591]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*592],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*594],rbx
	mov qword [rsp+8*593],rdx
	mov     rsi, [rsp+8*594]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*595],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*597],rbx
	mov qword [rsp+8*596],rdx
	mov     rsi, [rsp+8*597]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,20
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*598],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*600],rbx
	mov qword [rsp+8*599],rdx
	mov     rsi, [rsp+8*600]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*601],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*603],rbx
	mov qword [rsp+8*602],rdx
	mov     rsi, [rsp+8*603]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*604],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*606],rbx
	mov qword [rsp+8*605],rdx
	mov     rsi, [rsp+8*606]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*607],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*609],rbx
	mov qword [rsp+8*608],rdx
	mov     rsi, [rsp+8*609]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*610],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*612],rbx
	mov qword [rsp+8*611],rdx
	mov     rsi, [rsp+8*612]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*613],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*615],rbx
	mov qword [rsp+8*614],rdx
	mov     rsi, [rsp+8*615]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*616],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*618],rbx
	mov qword [rsp+8*617],rdx
	mov     rsi, [rsp+8*618]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*619],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*621],rbx
	mov qword [rsp+8*620],rdx
	mov     rsi, [rsp+8*621]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*622],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*624],rbx
	mov qword [rsp+8*623],rdx
	mov     rsi, [rsp+8*624]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,20
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*625],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*627],rbx
	mov qword [rsp+8*626],rdx
	mov     rsi, [rsp+8*627]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*628],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*630],rbx
	mov qword [rsp+8*629],rdx
	mov     rsi, [rsp+8*630]
	mov     rdi, [rsp+8*585]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*585], rax
	mov rbx,  [rsp+8*585]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*631],rdx
	mov rdi,[rsp+8*631] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*632],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*633],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*634],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*637],rbx
	mov qword [rsp+8*635],rdx
	mov qword [rsp+8*636],rax
	mov     rsi, [rsp+8*637]
	mov     rdi, [rsp+8*634]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*639],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*641],rbx
	mov qword [rsp+8*640],rdx
	mov     rsi, [rsp+8*641]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*642],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*644],rbx
	mov qword [rsp+8*643],rdx
	mov     rsi, [rsp+8*644]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*645],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*647],rbx
	mov qword [rsp+8*646],rdx
	mov     rsi, [rsp+8*647]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*648],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*650],rbx
	mov qword [rsp+8*649],rdx
	mov     rsi, [rsp+8*650]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,21
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*651],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*653],rbx
	mov qword [rsp+8*652],rdx
	mov     rsi, [rsp+8*653]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*654],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*656],rbx
	mov qword [rsp+8*655],rdx
	mov     rsi, [rsp+8*656]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*657],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*659],rbx
	mov qword [rsp+8*658],rdx
	mov     rsi, [rsp+8*659]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*660],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*662],rbx
	mov qword [rsp+8*661],rdx
	mov     rsi, [rsp+8*662]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*663],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*665],rbx
	mov qword [rsp+8*664],rdx
	mov     rsi, [rsp+8*665]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*666],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*668],rbx
	mov qword [rsp+8*667],rdx
	mov     rsi, [rsp+8*668]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*669],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*671],rbx
	mov qword [rsp+8*670],rdx
	mov     rsi, [rsp+8*671]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*672],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*674],rbx
	mov qword [rsp+8*673],rdx
	mov     rsi, [rsp+8*674]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*675],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*677],rbx
	mov qword [rsp+8*676],rdx
	mov     rsi, [rsp+8*677]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,21
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*678],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*680],rbx
	mov qword [rsp+8*679],rdx
	mov     rsi, [rsp+8*680]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*681],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*683],rbx
	mov qword [rsp+8*682],rdx
	mov     rsi, [rsp+8*683]
	mov     rdi, [rsp+8*638]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*638], rax
	mov rbx,  [rsp+8*638]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*684],rdx
	mov rdi,[rsp+8*684] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*685],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*686],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*687],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*690],rbx
	mov qword [rsp+8*688],rdx
	mov qword [rsp+8*689],rax
	mov     rsi, [rsp+8*690]
	mov     rdi, [rsp+8*687]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*692],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*694],rbx
	mov qword [rsp+8*693],rdx
	mov     rsi, [rsp+8*694]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*695],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*697],rbx
	mov qword [rsp+8*696],rdx
	mov     rsi, [rsp+8*697]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*698],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*700],rbx
	mov qword [rsp+8*699],rdx
	mov     rsi, [rsp+8*700]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*701],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*703],rbx
	mov qword [rsp+8*702],rdx
	mov     rsi, [rsp+8*703]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,22
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*704],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*706],rbx
	mov qword [rsp+8*705],rdx
	mov     rsi, [rsp+8*706]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*707],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*709],rbx
	mov qword [rsp+8*708],rdx
	mov     rsi, [rsp+8*709]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*710],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*712],rbx
	mov qword [rsp+8*711],rdx
	mov     rsi, [rsp+8*712]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*713],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*715],rbx
	mov qword [rsp+8*714],rdx
	mov     rsi, [rsp+8*715]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*716],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*718],rbx
	mov qword [rsp+8*717],rdx
	mov     rsi, [rsp+8*718]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*719],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*721],rbx
	mov qword [rsp+8*720],rdx
	mov     rsi, [rsp+8*721]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*722],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*724],rbx
	mov qword [rsp+8*723],rdx
	mov     rsi, [rsp+8*724]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*725],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*727],rbx
	mov qword [rsp+8*726],rdx
	mov     rsi, [rsp+8*727]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*728],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*730],rbx
	mov qword [rsp+8*729],rdx
	mov     rsi, [rsp+8*730]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,22
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*731],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*733],rbx
	mov qword [rsp+8*732],rdx
	mov     rsi, [rsp+8*733]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*734],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*736],rbx
	mov qword [rsp+8*735],rdx
	mov     rsi, [rsp+8*736]
	mov     rdi, [rsp+8*691]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*691], rax
	mov rbx,  [rsp+8*691]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*737],rdx
	mov rdi,[rsp+8*737] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*738],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*739],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*740],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*743],rbx
	mov qword [rsp+8*741],rdx
	mov qword [rsp+8*742],rax
	mov     rsi, [rsp+8*743]
	mov     rdi, [rsp+8*740]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*745],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*747],rbx
	mov qword [rsp+8*746],rdx
	mov     rsi, [rsp+8*747]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*748],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*750],rbx
	mov qword [rsp+8*749],rdx
	mov     rsi, [rsp+8*750]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*751],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*753],rbx
	mov qword [rsp+8*752],rdx
	mov     rsi, [rsp+8*753]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*754],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*756],rbx
	mov qword [rsp+8*755],rdx
	mov     rsi, [rsp+8*756]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,23
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*757],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*759],rbx
	mov qword [rsp+8*758],rdx
	mov     rsi, [rsp+8*759]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*760],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*762],rbx
	mov qword [rsp+8*761],rdx
	mov     rsi, [rsp+8*762]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*763],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*765],rbx
	mov qword [rsp+8*764],rdx
	mov     rsi, [rsp+8*765]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*766],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*768],rbx
	mov qword [rsp+8*767],rdx
	mov     rsi, [rsp+8*768]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*769],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*771],rbx
	mov qword [rsp+8*770],rdx
	mov     rsi, [rsp+8*771]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*772],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*774],rbx
	mov qword [rsp+8*773],rdx
	mov     rsi, [rsp+8*774]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*775],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*777],rbx
	mov qword [rsp+8*776],rdx
	mov     rsi, [rsp+8*777]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*778],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*780],rbx
	mov qword [rsp+8*779],rdx
	mov     rsi, [rsp+8*780]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*781],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*783],rbx
	mov qword [rsp+8*782],rdx
	mov     rsi, [rsp+8*783]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,23
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*784],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*786],rbx
	mov qword [rsp+8*785],rdx
	mov     rsi, [rsp+8*786]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*787],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*789],rbx
	mov qword [rsp+8*788],rdx
	mov     rsi, [rsp+8*789]
	mov     rdi, [rsp+8*744]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*744], rax
	mov rbx,  [rsp+8*744]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*790],rdx
	mov rdi,[rsp+8*790] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*791],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*792],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*793],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*796],rbx
	mov qword [rsp+8*794],rdx
	mov qword [rsp+8*795],rax
	mov     rsi, [rsp+8*796]
	mov     rdi, [rsp+8*793]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*798],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*800],rbx
	mov qword [rsp+8*799],rdx
	mov     rsi, [rsp+8*800]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,86
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*801],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*803],rbx
	mov qword [rsp+8*802],rdx
	mov     rsi, [rsp+8*803]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*804],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*806],rbx
	mov qword [rsp+8*805],rdx
	mov     rsi, [rsp+8*806]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*807],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*809],rbx
	mov qword [rsp+8*808],rdx
	mov     rsi, [rsp+8*809]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,24
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*810],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*812],rbx
	mov qword [rsp+8*811],rdx
	mov     rsi, [rsp+8*812]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*813],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*815],rbx
	mov qword [rsp+8*814],rdx
	mov     rsi, [rsp+8*815]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*816],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*818],rbx
	mov qword [rsp+8*817],rdx
	mov     rsi, [rsp+8*818]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*819],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*821],rbx
	mov qword [rsp+8*820],rdx
	mov     rsi, [rsp+8*821]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*822],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*824],rbx
	mov qword [rsp+8*823],rdx
	mov     rsi, [rsp+8*824]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*825],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*827],rbx
	mov qword [rsp+8*826],rdx
	mov     rsi, [rsp+8*827]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*828],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*830],rbx
	mov qword [rsp+8*829],rdx
	mov     rsi, [rsp+8*830]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*831],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*833],rbx
	mov qword [rsp+8*832],rdx
	mov     rsi, [rsp+8*833]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*834],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*836],rbx
	mov qword [rsp+8*835],rdx
	mov     rsi, [rsp+8*836]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,24
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*837],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*839],rbx
	mov qword [rsp+8*838],rdx
	mov     rsi, [rsp+8*839]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*840],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*842],rbx
	mov qword [rsp+8*841],rdx
	mov     rsi, [rsp+8*842]
	mov     rdi, [rsp+8*797]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*797], rax
	mov rbx,  [rsp+8*797]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*843],rdx
	mov rdi,[rsp+8*843] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,91
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*844],rbx
	mov rbx, [rdx]
	mov rdi,rbx
	mov qword [rsp+8*846],rbx
	mov rbx,rdi
	mov qword [rsp+8*847],rbx
	mov qword [rsp+8*845],rdx
	mov rdi,[rsp+8*847] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*848],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*849],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*850],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*853],rbx
	mov qword [rsp+8*851],rdx
	mov qword [rsp+8*852],rax
	mov     rsi, [rsp+8*853]
	mov     rdi, [rsp+8*850]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*855],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*857],rbx
	mov qword [rsp+8*856],rdx
	mov     rsi, [rsp+8*857]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*858],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*860],rbx
	mov qword [rsp+8*859],rdx
	mov     rsi, [rsp+8*860]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*861],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*863],rbx
	mov qword [rsp+8*862],rdx
	mov     rsi, [rsp+8*863]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*864],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*866],rbx
	mov qword [rsp+8*865],rdx
	mov     rsi, [rsp+8*866]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*867],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*869],rbx
	mov qword [rsp+8*868],rdx
	mov     rsi, [rsp+8*869]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*870],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*872],rbx
	mov qword [rsp+8*871],rdx
	mov     rsi, [rsp+8*872]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*873],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*875],rbx
	mov qword [rsp+8*874],rdx
	mov     rsi, [rsp+8*875]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*876],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*878],rbx
	mov qword [rsp+8*877],rdx
	mov     rsi, [rsp+8*878]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*879],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*881],rbx
	mov qword [rsp+8*880],rdx
	mov     rsi, [rsp+8*881]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*882],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*884],rbx
	mov qword [rsp+8*883],rdx
	mov     rsi, [rsp+8*884]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*885],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*887],rbx
	mov qword [rsp+8*886],rdx
	mov     rsi, [rsp+8*887]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,85
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*888],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*890],rbx
	mov qword [rsp+8*889],rdx
	mov     rsi, [rsp+8*890]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*891],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*893],rbx
	mov qword [rsp+8*892],rdx
	mov     rsi, [rsp+8*893]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*894],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*896],rbx
	mov qword [rsp+8*895],rdx
	mov     rsi, [rsp+8*896]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*897],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*899],rbx
	mov qword [rsp+8*898],rdx
	mov     rsi, [rsp+8*899]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*900],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*902],rbx
	mov qword [rsp+8*901],rdx
	mov     rsi, [rsp+8*902]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*903],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*905],rbx
	mov qword [rsp+8*904],rdx
	mov     rsi, [rsp+8*905]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*906],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*908],rbx
	mov qword [rsp+8*907],rdx
	mov     rsi, [rsp+8*908]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*909],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*911],rbx
	mov qword [rsp+8*910],rdx
	mov     rsi, [rsp+8*911]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*912],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*914],rbx
	mov qword [rsp+8*913],rdx
	mov     rsi, [rsp+8*914]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*915],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*917],rbx
	mov qword [rsp+8*916],rdx
	mov     rsi, [rsp+8*917]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,20
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*918],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*920],rbx
	mov qword [rsp+8*919],rdx
	mov     rsi, [rsp+8*920]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,21
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*921],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*923],rbx
	mov qword [rsp+8*922],rdx
	mov     rsi, [rsp+8*923]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*924],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*926],rbx
	mov qword [rsp+8*925],rdx
	mov     rsi, [rsp+8*926]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*927],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*929],rbx
	mov qword [rsp+8*928],rdx
	mov     rsi, [rsp+8*929]
	mov     rdi, [rsp+8*854]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*854], rax
	mov rbx,  [rsp+8*854]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*930],rdx
	mov rdi,[rsp+8*930] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*931],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*932],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*933],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*936],rbx
	mov qword [rsp+8*934],rdx
	mov qword [rsp+8*935],rax
	mov     rsi, [rsp+8*936]
	mov     rdi, [rsp+8*933]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*938],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*940],rbx
	mov qword [rsp+8*939],rdx
	mov     rsi, [rsp+8*940]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*941],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*943],rbx
	mov qword [rsp+8*942],rdx
	mov     rsi, [rsp+8*943]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*944],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*946],rbx
	mov qword [rsp+8*945],rdx
	mov     rsi, [rsp+8*946]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*947],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*949],rbx
	mov qword [rsp+8*948],rdx
	mov     rsi, [rsp+8*949]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*950],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*952],rbx
	mov qword [rsp+8*951],rdx
	mov     rsi, [rsp+8*952]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*953],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*955],rbx
	mov qword [rsp+8*954],rdx
	mov     rsi, [rsp+8*955]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*956],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*958],rbx
	mov qword [rsp+8*957],rdx
	mov     rsi, [rsp+8*958]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*959],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*961],rbx
	mov qword [rsp+8*960],rdx
	mov     rsi, [rsp+8*961]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*962],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*964],rbx
	mov qword [rsp+8*963],rdx
	mov     rsi, [rsp+8*964]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*965],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*967],rbx
	mov qword [rsp+8*966],rdx
	mov     rsi, [rsp+8*967]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*968],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*970],rbx
	mov qword [rsp+8*969],rdx
	mov     rsi, [rsp+8*970]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,85
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*971],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*973],rbx
	mov qword [rsp+8*972],rdx
	mov     rsi, [rsp+8*973]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*974],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*976],rbx
	mov qword [rsp+8*975],rdx
	mov     rsi, [rsp+8*976]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*977],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*979],rbx
	mov qword [rsp+8*978],rdx
	mov     rsi, [rsp+8*979]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*980],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*982],rbx
	mov qword [rsp+8*981],rdx
	mov     rsi, [rsp+8*982]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*983],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*985],rbx
	mov qword [rsp+8*984],rdx
	mov     rsi, [rsp+8*985]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*986],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*988],rbx
	mov qword [rsp+8*987],rdx
	mov     rsi, [rsp+8*988]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*989],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*991],rbx
	mov qword [rsp+8*990],rdx
	mov     rsi, [rsp+8*991]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*992],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*994],rbx
	mov qword [rsp+8*993],rdx
	mov     rsi, [rsp+8*994]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*995],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*997],rbx
	mov qword [rsp+8*996],rdx
	mov     rsi, [rsp+8*997]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*998],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1000],rbx
	mov qword [rsp+8*999],rdx
	mov     rsi, [rsp+8*1000]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,20
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1001],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1003],rbx
	mov qword [rsp+8*1002],rdx
	mov     rsi, [rsp+8*1003]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,21
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1004],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1006],rbx
	mov qword [rsp+8*1005],rdx
	mov     rsi, [rsp+8*1006]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1007],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1009],rbx
	mov qword [rsp+8*1008],rdx
	mov     rsi, [rsp+8*1009]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1010],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1012],rbx
	mov qword [rsp+8*1011],rdx
	mov     rsi, [rsp+8*1012]
	mov     rdi, [rsp+8*937]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*937], rax
	mov rbx,  [rsp+8*937]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1013],rdx
	mov rdi,[rsp+8*1013] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1014],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1015],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1016],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1019],rbx
	mov qword [rsp+8*1017],rdx
	mov qword [rsp+8*1018],rax
	mov     rsi, [rsp+8*1019]
	mov     rdi, [rsp+8*1016]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1021],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1023],rbx
	mov qword [rsp+8*1022],rdx
	mov     rsi, [rsp+8*1023]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1024],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1026],rbx
	mov qword [rsp+8*1025],rdx
	mov     rsi, [rsp+8*1026]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1027],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1029],rbx
	mov qword [rsp+8*1028],rdx
	mov     rsi, [rsp+8*1029]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1030],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1032],rbx
	mov qword [rsp+8*1031],rdx
	mov     rsi, [rsp+8*1032]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1033],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1035],rbx
	mov qword [rsp+8*1034],rdx
	mov     rsi, [rsp+8*1035]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1036],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1038],rbx
	mov qword [rsp+8*1037],rdx
	mov     rsi, [rsp+8*1038]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1039],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1041],rbx
	mov qword [rsp+8*1040],rdx
	mov     rsi, [rsp+8*1041]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1042],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1044],rbx
	mov qword [rsp+8*1043],rdx
	mov     rsi, [rsp+8*1044]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1045],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1047],rbx
	mov qword [rsp+8*1046],rdx
	mov     rsi, [rsp+8*1047]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1048],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1050],rbx
	mov qword [rsp+8*1049],rdx
	mov     rsi, [rsp+8*1050]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1051],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1053],rbx
	mov qword [rsp+8*1052],rdx
	mov     rsi, [rsp+8*1053]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1054],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1056],rbx
	mov qword [rsp+8*1055],rdx
	mov     rsi, [rsp+8*1056]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1057],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1059],rbx
	mov qword [rsp+8*1058],rdx
	mov     rsi, [rsp+8*1059]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1060],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1062],rbx
	mov qword [rsp+8*1061],rdx
	mov     rsi, [rsp+8*1062]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1063],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1065],rbx
	mov qword [rsp+8*1064],rdx
	mov     rsi, [rsp+8*1065]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,89
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1066],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1068],rbx
	mov qword [rsp+8*1067],rdx
	mov     rsi, [rsp+8*1068]
	mov     rdi, [rsp+8*1020]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1020], rax
	mov rbx,  [rsp+8*1020]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1069],rdx
	mov rdi,[rsp+8*1069] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1070],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1071],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1072],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1075],rbx
	mov qword [rsp+8*1073],rdx
	mov qword [rsp+8*1074],rax
	mov     rsi, [rsp+8*1075]
	mov     rdi, [rsp+8*1072]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1077],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1079],rbx
	mov qword [rsp+8*1078],rdx
	mov     rsi, [rsp+8*1079]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1080],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1082],rbx
	mov qword [rsp+8*1081],rdx
	mov     rsi, [rsp+8*1082]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1083],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1085],rbx
	mov qword [rsp+8*1084],rdx
	mov     rsi, [rsp+8*1085]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,27
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1086],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1088],rbx
	mov qword [rsp+8*1087],rdx
	mov     rsi, [rsp+8*1088]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1089],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1091],rbx
	mov qword [rsp+8*1090],rdx
	mov     rsi, [rsp+8*1091]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,24
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1092],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1094],rbx
	mov qword [rsp+8*1093],rdx
	mov     rsi, [rsp+8*1094]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1095],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1097],rbx
	mov qword [rsp+8*1096],rdx
	mov     rsi, [rsp+8*1097]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1098],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1100],rbx
	mov qword [rsp+8*1099],rdx
	mov     rsi, [rsp+8*1100]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1101],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1103],rbx
	mov qword [rsp+8*1102],rdx
	mov     rsi, [rsp+8*1103]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1104],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1106],rbx
	mov qword [rsp+8*1105],rdx
	mov     rsi, [rsp+8*1106]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1107],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1109],rbx
	mov qword [rsp+8*1108],rdx
	mov     rsi, [rsp+8*1109]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1110],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1112],rbx
	mov qword [rsp+8*1111],rdx
	mov     rsi, [rsp+8*1112]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1113],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1115],rbx
	mov qword [rsp+8*1114],rdx
	mov     rsi, [rsp+8*1115]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1116],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1118],rbx
	mov qword [rsp+8*1117],rdx
	mov     rsi, [rsp+8*1118]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1119],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1121],rbx
	mov qword [rsp+8*1120],rdx
	mov     rsi, [rsp+8*1121]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1122],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1124],rbx
	mov qword [rsp+8*1123],rdx
	mov     rsi, [rsp+8*1124]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1125],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1127],rbx
	mov qword [rsp+8*1126],rdx
	mov     rsi, [rsp+8*1127]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1128],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1130],rbx
	mov qword [rsp+8*1129],rdx
	mov     rsi, [rsp+8*1130]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1131],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1133],rbx
	mov qword [rsp+8*1132],rdx
	mov     rsi, [rsp+8*1133]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1134],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1136],rbx
	mov qword [rsp+8*1135],rdx
	mov     rsi, [rsp+8*1136]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1137],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1139],rbx
	mov qword [rsp+8*1138],rdx
	mov     rsi, [rsp+8*1139]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1140],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1142],rbx
	mov qword [rsp+8*1141],rdx
	mov     rsi, [rsp+8*1142]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1143],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1145],rbx
	mov qword [rsp+8*1144],rdx
	mov     rsi, [rsp+8*1145]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1146],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1148],rbx
	mov qword [rsp+8*1147],rdx
	mov     rsi, [rsp+8*1148]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1149],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1151],rbx
	mov qword [rsp+8*1150],rdx
	mov     rsi, [rsp+8*1151]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1152],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1154],rbx
	mov qword [rsp+8*1153],rdx
	mov     rsi, [rsp+8*1154]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1155],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1157],rbx
	mov qword [rsp+8*1156],rdx
	mov     rsi, [rsp+8*1157]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1158],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1160],rbx
	mov qword [rsp+8*1159],rdx
	mov     rsi, [rsp+8*1160]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1161],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1163],rbx
	mov qword [rsp+8*1162],rdx
	mov     rsi, [rsp+8*1163]
	mov     rdi, [rsp+8*1076]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1076], rax
	mov rbx,  [rsp+8*1076]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1164],rdx
	mov rdi,[rsp+8*1164] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1165],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1166],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1167],rbx
	mov rbx,67
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1170],rbx
	mov qword [rsp+8*1168],rdx
	mov qword [rsp+8*1169],rax
	mov     rsi, [rsp+8*1170]
	mov     rdi, [rsp+8*1167]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1172],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1174],rbx
	mov qword [rsp+8*1173],rdx
	mov     rsi, [rsp+8*1174]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1175],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1177],rbx
	mov qword [rsp+8*1176],rdx
	mov     rsi, [rsp+8*1177]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1178],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1180],rbx
	mov qword [rsp+8*1179],rdx
	mov     rsi, [rsp+8*1180]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1181],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1183],rbx
	mov qword [rsp+8*1182],rdx
	mov     rsi, [rsp+8*1183]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1184],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1186],rbx
	mov qword [rsp+8*1185],rdx
	mov     rsi, [rsp+8*1186]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1187],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1189],rbx
	mov qword [rsp+8*1188],rdx
	mov     rsi, [rsp+8*1189]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1190],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1192],rbx
	mov qword [rsp+8*1191],rdx
	mov     rsi, [rsp+8*1192]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1193],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1195],rbx
	mov qword [rsp+8*1194],rdx
	mov     rsi, [rsp+8*1195]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1196],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1198],rbx
	mov qword [rsp+8*1197],rdx
	mov     rsi, [rsp+8*1198]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1199],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1201],rbx
	mov qword [rsp+8*1200],rdx
	mov     rsi, [rsp+8*1201]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1202],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1204],rbx
	mov qword [rsp+8*1203],rdx
	mov     rsi, [rsp+8*1204]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1205],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1207],rbx
	mov qword [rsp+8*1206],rdx
	mov     rsi, [rsp+8*1207]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1208],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1210],rbx
	mov qword [rsp+8*1209],rdx
	mov     rsi, [rsp+8*1210]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1211],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1213],rbx
	mov qword [rsp+8*1212],rdx
	mov     rsi, [rsp+8*1213]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1214],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1216],rbx
	mov qword [rsp+8*1215],rdx
	mov     rsi, [rsp+8*1216]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,14
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1217],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1219],rbx
	mov qword [rsp+8*1218],rdx
	mov     rsi, [rsp+8*1219]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1220],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1222],rbx
	mov qword [rsp+8*1221],rdx
	mov     rsi, [rsp+8*1222]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1223],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1225],rbx
	mov qword [rsp+8*1224],rdx
	mov     rsi, [rsp+8*1225]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1226],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1228],rbx
	mov qword [rsp+8*1227],rdx
	mov     rsi, [rsp+8*1228]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1229],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1231],rbx
	mov qword [rsp+8*1230],rdx
	mov     rsi, [rsp+8*1231]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1232],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1234],rbx
	mov qword [rsp+8*1233],rdx
	mov     rsi, [rsp+8*1234]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1235],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1237],rbx
	mov qword [rsp+8*1236],rdx
	mov     rsi, [rsp+8*1237]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1238],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1240],rbx
	mov qword [rsp+8*1239],rdx
	mov     rsi, [rsp+8*1240]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1241],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1243],rbx
	mov qword [rsp+8*1242],rdx
	mov     rsi, [rsp+8*1243]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1244],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1246],rbx
	mov qword [rsp+8*1245],rdx
	mov     rsi, [rsp+8*1246]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1247],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1249],rbx
	mov qword [rsp+8*1248],rdx
	mov     rsi, [rsp+8*1249]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1250],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1252],rbx
	mov qword [rsp+8*1251],rdx
	mov     rsi, [rsp+8*1252]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,4
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1253],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1255],rbx
	mov qword [rsp+8*1254],rdx
	mov     rsi, [rsp+8*1255]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1256],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1258],rbx
	mov qword [rsp+8*1257],rdx
	mov     rsi, [rsp+8*1258]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1259],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1261],rbx
	mov qword [rsp+8*1260],rdx
	mov     rsi, [rsp+8*1261]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1262],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1264],rbx
	mov qword [rsp+8*1263],rdx
	mov     rsi, [rsp+8*1264]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1265],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1267],rbx
	mov qword [rsp+8*1266],rdx
	mov     rsi, [rsp+8*1267]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1268],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1270],rbx
	mov qword [rsp+8*1269],rdx
	mov     rsi, [rsp+8*1270]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1271],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1273],rbx
	mov qword [rsp+8*1272],rdx
	mov     rsi, [rsp+8*1273]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1274],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1276],rbx
	mov qword [rsp+8*1275],rdx
	mov     rsi, [rsp+8*1276]
	mov     rdi, [rsp+8*1171]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1171], rax
	mov rbx,  [rsp+8*1171]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1277],rdx
	mov rdi,[rsp+8*1277] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,91
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1278],rbx
	mov rbx, [rdx]
	mov rdi,rbx
	mov qword [rsp+8*1280],rbx
	mov rbx,rdi
	mov qword [rsp+8*1281],rbx
	mov qword [rsp+8*1279],rdx
	mov rdi,[rsp+8*1281] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1282],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1283],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1284],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1287],rbx
	mov qword [rsp+8*1285],rdx
	mov qword [rsp+8*1286],rax
	mov     rsi, [rsp+8*1287]
	mov     rdi, [rsp+8*1284]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1289],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1291],rbx
	mov qword [rsp+8*1290],rdx
	mov     rsi, [rsp+8*1291]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1292],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1294],rbx
	mov qword [rsp+8*1293],rdx
	mov     rsi, [rsp+8*1294]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1295],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1297],rbx
	mov qword [rsp+8*1296],rdx
	mov     rsi, [rsp+8*1297]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1298],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1300],rbx
	mov qword [rsp+8*1299],rdx
	mov     rsi, [rsp+8*1300]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1301],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1303],rbx
	mov qword [rsp+8*1302],rdx
	mov     rsi, [rsp+8*1303]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1304],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1306],rbx
	mov qword [rsp+8*1305],rdx
	mov     rsi, [rsp+8*1306]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1307],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1309],rbx
	mov qword [rsp+8*1308],rdx
	mov     rsi, [rsp+8*1309]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1310],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1312],rbx
	mov qword [rsp+8*1311],rdx
	mov     rsi, [rsp+8*1312]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1313],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1315],rbx
	mov qword [rsp+8*1314],rdx
	mov     rsi, [rsp+8*1315]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1316],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1318],rbx
	mov qword [rsp+8*1317],rdx
	mov     rsi, [rsp+8*1318]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1319],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1321],rbx
	mov qword [rsp+8*1320],rdx
	mov     rsi, [rsp+8*1321]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1322],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1324],rbx
	mov qword [rsp+8*1323],rdx
	mov     rsi, [rsp+8*1324]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1325],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1327],rbx
	mov qword [rsp+8*1326],rdx
	mov     rsi, [rsp+8*1327]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1328],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1330],rbx
	mov qword [rsp+8*1329],rdx
	mov     rsi, [rsp+8*1330]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1331],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1333],rbx
	mov qword [rsp+8*1332],rdx
	mov     rsi, [rsp+8*1333]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,89
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1334],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1336],rbx
	mov qword [rsp+8*1335],rdx
	mov     rsi, [rsp+8*1336]
	mov     rdi, [rsp+8*1288]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1288], rax
	mov rbx,  [rsp+8*1288]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1337],rdx
	mov rdi,[rsp+8*1337] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1338],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1339],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1340],rbx
	mov rbx,68
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1343],rbx
	mov qword [rsp+8*1341],rdx
	mov qword [rsp+8*1342],rax
	mov     rsi, [rsp+8*1343]
	mov     rdi, [rsp+8*1340]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1345],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1347],rbx
	mov qword [rsp+8*1346],rdx
	mov     rsi, [rsp+8*1347]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1348],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1350],rbx
	mov qword [rsp+8*1349],rdx
	mov     rsi, [rsp+8*1350]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1351],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1353],rbx
	mov qword [rsp+8*1352],rdx
	mov     rsi, [rsp+8*1353]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,27
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1354],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1356],rbx
	mov qword [rsp+8*1355],rdx
	mov     rsi, [rsp+8*1356]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1357],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1359],rbx
	mov qword [rsp+8*1358],rdx
	mov     rsi, [rsp+8*1359]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,24
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1360],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1362],rbx
	mov qword [rsp+8*1361],rdx
	mov     rsi, [rsp+8*1362]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1363],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1365],rbx
	mov qword [rsp+8*1364],rdx
	mov     rsi, [rsp+8*1365]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1366],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1368],rbx
	mov qword [rsp+8*1367],rdx
	mov     rsi, [rsp+8*1368]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,67
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1369],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1371],rbx
	mov qword [rsp+8*1370],rdx
	mov     rsi, [rsp+8*1371]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1372],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1374],rbx
	mov qword [rsp+8*1373],rdx
	mov     rsi, [rsp+8*1374]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1375],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1377],rbx
	mov qword [rsp+8*1376],rdx
	mov     rsi, [rsp+8*1377]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1378],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1380],rbx
	mov qword [rsp+8*1379],rdx
	mov     rsi, [rsp+8*1380]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1381],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1383],rbx
	mov qword [rsp+8*1382],rdx
	mov     rsi, [rsp+8*1383]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1384],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1386],rbx
	mov qword [rsp+8*1385],rdx
	mov     rsi, [rsp+8*1386]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1387],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1389],rbx
	mov qword [rsp+8*1388],rdx
	mov     rsi, [rsp+8*1389]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1390],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1392],rbx
	mov qword [rsp+8*1391],rdx
	mov     rsi, [rsp+8*1392]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1393],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1395],rbx
	mov qword [rsp+8*1394],rdx
	mov     rsi, [rsp+8*1395]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1396],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1398],rbx
	mov qword [rsp+8*1397],rdx
	mov     rsi, [rsp+8*1398]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1399],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1401],rbx
	mov qword [rsp+8*1400],rdx
	mov     rsi, [rsp+8*1401]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1402],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1404],rbx
	mov qword [rsp+8*1403],rdx
	mov     rsi, [rsp+8*1404]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1405],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1407],rbx
	mov qword [rsp+8*1406],rdx
	mov     rsi, [rsp+8*1407]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1408],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1410],rbx
	mov qword [rsp+8*1409],rdx
	mov     rsi, [rsp+8*1410]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1411],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1413],rbx
	mov qword [rsp+8*1412],rdx
	mov     rsi, [rsp+8*1413]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1414],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1416],rbx
	mov qword [rsp+8*1415],rdx
	mov     rsi, [rsp+8*1416]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1417],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1419],rbx
	mov qword [rsp+8*1418],rdx
	mov     rsi, [rsp+8*1419]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1420],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1422],rbx
	mov qword [rsp+8*1421],rdx
	mov     rsi, [rsp+8*1422]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1423],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1425],rbx
	mov qword [rsp+8*1424],rdx
	mov     rsi, [rsp+8*1425]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1426],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1428],rbx
	mov qword [rsp+8*1427],rdx
	mov     rsi, [rsp+8*1428]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1429],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1431],rbx
	mov qword [rsp+8*1430],rdx
	mov     rsi, [rsp+8*1431]
	mov     rdi, [rsp+8*1344]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1344], rax
	mov rbx,  [rsp+8*1344]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1432],rdx
	mov rdi,[rsp+8*1432] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1433],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1434],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1435],rbx
	mov rbx,67
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1438],rbx
	mov qword [rsp+8*1436],rdx
	mov qword [rsp+8*1437],rax
	mov     rsi, [rsp+8*1438]
	mov     rdi, [rsp+8*1435]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1440],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1442],rbx
	mov qword [rsp+8*1441],rdx
	mov     rsi, [rsp+8*1442]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,83
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1443],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1445],rbx
	mov qword [rsp+8*1444],rdx
	mov     rsi, [rsp+8*1445]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1446],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1448],rbx
	mov qword [rsp+8*1447],rdx
	mov     rsi, [rsp+8*1448]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1449],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1451],rbx
	mov qword [rsp+8*1450],rdx
	mov     rsi, [rsp+8*1451]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1452],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1454],rbx
	mov qword [rsp+8*1453],rdx
	mov     rsi, [rsp+8*1454]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1455],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1457],rbx
	mov qword [rsp+8*1456],rdx
	mov     rsi, [rsp+8*1457]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,58
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1458],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1460],rbx
	mov qword [rsp+8*1459],rdx
	mov     rsi, [rsp+8*1460]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1461],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1463],rbx
	mov qword [rsp+8*1462],rdx
	mov     rsi, [rsp+8*1463]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1464],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1466],rbx
	mov qword [rsp+8*1465],rdx
	mov     rsi, [rsp+8*1466]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1467],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1469],rbx
	mov qword [rsp+8*1468],rdx
	mov     rsi, [rsp+8*1469]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1470],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1472],rbx
	mov qword [rsp+8*1471],rdx
	mov     rsi, [rsp+8*1472]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1473],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1475],rbx
	mov qword [rsp+8*1474],rdx
	mov     rsi, [rsp+8*1475]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1476],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1478],rbx
	mov qword [rsp+8*1477],rdx
	mov     rsi, [rsp+8*1478]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1479],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1481],rbx
	mov qword [rsp+8*1480],rdx
	mov     rsi, [rsp+8*1481]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1482],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1484],rbx
	mov qword [rsp+8*1483],rdx
	mov     rsi, [rsp+8*1484]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,14
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1485],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1487],rbx
	mov qword [rsp+8*1486],rdx
	mov     rsi, [rsp+8*1487]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1488],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1490],rbx
	mov qword [rsp+8*1489],rdx
	mov     rsi, [rsp+8*1490]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1491],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1493],rbx
	mov qword [rsp+8*1492],rdx
	mov     rsi, [rsp+8*1493]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1494],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1496],rbx
	mov qword [rsp+8*1495],rdx
	mov     rsi, [rsp+8*1496]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1497],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1499],rbx
	mov qword [rsp+8*1498],rdx
	mov     rsi, [rsp+8*1499]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,66
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1500],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1502],rbx
	mov qword [rsp+8*1501],rdx
	mov     rsi, [rsp+8*1502]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1503],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1505],rbx
	mov qword [rsp+8*1504],rdx
	mov     rsi, [rsp+8*1505]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1506],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1508],rbx
	mov qword [rsp+8*1507],rdx
	mov     rsi, [rsp+8*1508]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,82
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1509],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1511],rbx
	mov qword [rsp+8*1510],rdx
	mov     rsi, [rsp+8*1511]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,7
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1512],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1514],rbx
	mov qword [rsp+8*1513],rdx
	mov     rsi, [rsp+8*1514]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1515],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1517],rbx
	mov qword [rsp+8*1516],rdx
	mov     rsi, [rsp+8*1517]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1518],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1520],rbx
	mov qword [rsp+8*1519],rdx
	mov     rsi, [rsp+8*1520]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,4
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1521],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1523],rbx
	mov qword [rsp+8*1522],rdx
	mov     rsi, [rsp+8*1523]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,16
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1524],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1526],rbx
	mov qword [rsp+8*1525],rdx
	mov     rsi, [rsp+8*1526]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,15
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1527],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1529],rbx
	mov qword [rsp+8*1528],rdx
	mov     rsi, [rsp+8*1529]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,8
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1530],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1532],rbx
	mov qword [rsp+8*1531],rdx
	mov     rsi, [rsp+8*1532]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,10
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1533],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1535],rbx
	mov qword [rsp+8*1534],rdx
	mov     rsi, [rsp+8*1535]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,59
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1536],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1538],rbx
	mov qword [rsp+8*1537],rdx
	mov     rsi, [rsp+8*1538]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1539],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1541],rbx
	mov qword [rsp+8*1540],rdx
	mov     rsi, [rsp+8*1541]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1542],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1544],rbx
	mov qword [rsp+8*1543],rdx
	mov     rsi, [rsp+8*1544]
	mov     rdi, [rsp+8*1439]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1439], rax
	mov rbx,  [rsp+8*1439]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1545],rdx
	mov rdi,[rsp+8*1545] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,91
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1546],rbx
	mov rbx, [rdx]
	mov rdi,rbx
	mov qword [rsp+8*1548],rbx
	mov rbx,rdi
	mov qword [rsp+8*1549],rbx
	mov qword [rsp+8*1547],rdx
	mov rdi,[rsp+8*1549] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1550],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1551],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1552],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1555],rbx
	mov qword [rsp+8*1553],rdx
	mov qword [rsp+8*1554],rax
	mov     rsi, [rsp+8*1555]
	mov     rdi, [rsp+8*1552]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1556], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1557],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1559],rbx
	mov qword [rsp+8*1558],rdx
	mov     rsi, [rsp+8*1559]
	mov     rdi, [rsp+8*1556]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1556], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1560],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1562],rbx
	mov qword [rsp+8*1561],rdx
	mov     rsi, [rsp+8*1562]
	mov     rdi, [rsp+8*1556]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1556], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1563],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1565],rbx
	mov qword [rsp+8*1564],rdx
	mov     rsi, [rsp+8*1565]
	mov     rdi, [rsp+8*1556]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1556], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1566],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1568],rbx
	mov qword [rsp+8*1567],rdx
	mov     rsi, [rsp+8*1568]
	mov     rdi, [rsp+8*1556]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1556], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1569],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1571],rbx
	mov qword [rsp+8*1570],rdx
	mov     rsi, [rsp+8*1571]
	mov     rdi, [rsp+8*1556]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1556], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,65
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1572],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1574],rbx
	mov qword [rsp+8*1573],rdx
	mov     rsi, [rsp+8*1574]
	mov     rdi, [rsp+8*1556]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1556], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,77
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1575],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1577],rbx
	mov qword [rsp+8*1576],rdx
	mov     rsi, [rsp+8*1577]
	mov     rdi, [rsp+8*1556]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1556], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1578],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1580],rbx
	mov qword [rsp+8*1579],rdx
	mov     rsi, [rsp+8*1580]
	mov     rdi, [rsp+8*1556]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1556], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1556]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1556], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1581],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1583],rbx
	mov qword [rsp+8*1582],rdx
	mov     rsi, [rsp+8*1583]
	mov     rdi, [rsp+8*1556]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1556], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1556]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1556], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1584],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1586],rbx
	mov qword [rsp+8*1585],rdx
	mov     rsi, [rsp+8*1586]
	mov     rdi, [rsp+8*1556]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1556], rax
	mov rbx,  [rsp+8*1556]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1587],rdx
	mov rdi,[rsp+8*1587] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1588],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1589],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1590],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1593],rbx
	mov qword [rsp+8*1591],rdx
	mov qword [rsp+8*1592],rax
	mov     rsi, [rsp+8*1593]
	mov     rdi, [rsp+8*1590]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1594], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1595],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1597],rbx
	mov qword [rsp+8*1596],rdx
	mov     rsi, [rsp+8*1597]
	mov     rdi, [rsp+8*1594]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1594], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1598],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1600],rbx
	mov qword [rsp+8*1599],rdx
	mov     rsi, [rsp+8*1600]
	mov     rdi, [rsp+8*1594]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1594], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1601],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1603],rbx
	mov qword [rsp+8*1602],rdx
	mov     rsi, [rsp+8*1603]
	mov     rdi, [rsp+8*1594]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1594], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1604],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1606],rbx
	mov qword [rsp+8*1605],rdx
	mov     rsi, [rsp+8*1606]
	mov     rdi, [rsp+8*1594]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1594], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1607],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1609],rbx
	mov qword [rsp+8*1608],rdx
	mov     rsi, [rsp+8*1609]
	mov     rdi, [rsp+8*1594]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1594], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,63
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1610],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1612],rbx
	mov qword [rsp+8*1611],rdx
	mov     rsi, [rsp+8*1612]
	mov     rdi, [rsp+8*1594]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1594], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1613],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1615],rbx
	mov qword [rsp+8*1614],rdx
	mov     rsi, [rsp+8*1615]
	mov     rdi, [rsp+8*1594]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1594], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,79
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1616],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1618],rbx
	mov qword [rsp+8*1617],rdx
	mov     rsi, [rsp+8*1618]
	mov     rdi, [rsp+8*1594]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1594], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1619],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1621],rbx
	mov qword [rsp+8*1620],rdx
	mov     rsi, [rsp+8*1621]
	mov     rdi, [rsp+8*1594]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1594], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1594]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1594], rax
	mov     rsi, [gbl+8*1622]
	mov     rdi, [rsp+8*1594]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1594], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1594]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1594], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1594]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1594], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1623],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1625],rbx
	mov qword [rsp+8*1624],rdx
	mov     rsi, [rsp+8*1625]
	mov     rdi, [rsp+8*1594]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1594], rax
	mov rbx,  [rsp+8*1594]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1626],rdx
	mov rdi,[rsp+8*1626] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,81
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1627],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1628],rdx
	mov rax,  [gbl+8*3]
	mov rdx,rax
	mov qword [rsp+8*1629],rbx
	mov rbx,82
	lea rax,[rdx+rbx*8+8H]
	mov rbx, [rax]
	mov qword [rsp+8*1632],rbx
	mov qword [rsp+8*1630],rdx
	mov qword [rsp+8*1631],rax
	mov     rsi, [rsp+8*1632]
	mov     rdi, [rsp+8*1629]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1633], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,80
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1634],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1636],rbx
	mov qword [rsp+8*1635],rdx
	mov     rsi, [rsp+8*1636]
	mov     rdi, [rsp+8*1633]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1633], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,71
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1637],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1639],rbx
	mov qword [rsp+8*1638],rdx
	mov     rsi, [rsp+8*1639]
	mov     rdi, [rsp+8*1633]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1633], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,76
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1640],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1642],rbx
	mov qword [rsp+8*1641],rdx
	mov     rsi, [rsp+8*1642]
	mov     rdi, [rsp+8*1633]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1633], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,69
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1643],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1645],rbx
	mov qword [rsp+8*1644],rdx
	mov     rsi, [rsp+8*1645]
	mov     rdi, [rsp+8*1633]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1633], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1646],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1648],rbx
	mov qword [rsp+8*1647],rdx
	mov     rsi, [rsp+8*1648]
	mov     rdi, [rsp+8*1633]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1633], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,63
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1649],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1651],rbx
	mov qword [rsp+8*1650],rdx
	mov     rsi, [rsp+8*1651]
	mov     rdi, [rsp+8*1633]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1633], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,17
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1652],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1654],rbx
	mov qword [rsp+8*1653],rdx
	mov     rsi, [rsp+8*1654]
	mov     rdi, [rsp+8*1633]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1633], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,64
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1655],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1657],rbx
	mov qword [rsp+8*1656],rdx
	mov     rsi, [rsp+8*1657]
	mov     rdi, [rsp+8*1633]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1633], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,28
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1658],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1660],rbx
	mov qword [rsp+8*1659],rdx
	mov     rsi, [rsp+8*1660]
	mov     rdi, [rsp+8*1633]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1633], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1633]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1633], rax
	mov     rsi, [gbl+8*1622]
	mov     rdi, [rsp+8*1633]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1633], rax
	mov     rsi, [gbl+8*1622]
	mov     rdi, [rsp+8*1633]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1633], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1633]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1633], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,26
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1661],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1663],rbx
	mov qword [rsp+8*1662],rdx
	mov     rsi, [rsp+8*1663]
	mov     rdi, [rsp+8*1633]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1633], rax
	mov rbx,  [rsp+8*1633]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1664],rdx
	mov rdi,[rsp+8*1664] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,0
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1665],rbx
	mov rbx, [rdx]
	mov rdi,rbx
	mov qword [rsp+8*1667],rbx
	mov rbx,rdi
	mov qword [rsp+8*1668],rbx
	mov qword [rsp+8*1666],rdx
	mov rdi,[rsp+8*1668] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*2],rbx
	
L_3043:
	mov rbx,  [rsp+8*2]
	mov rdx,93
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*1669],rax
	je L_3044
	mov rbx,  [rsp+8*2]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,9
	cmp rdx,rax
	mov rbx, 0
	setle bl
	cmp rbx, 0
	mov qword [rsp+8*1671],rbx
	mov qword [rsp+8*1670],rdx
	je L_3214
	mov rbx,  [rsp+8*1670]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,0
	cmp rdx,rax
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*1673],rbx
	mov qword [rsp+8*1672],rdx
	je L_3215
	mov rdx,t66
	mov rbx,rdx
	mov qword [rsp+8*1674],rbx
	jmp L_3217
	
L_3215:
	mov rbx,  [rsp+8*1672]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1675],rax
	je L_3218
	mov rdx,t69
	mov rbx,rdx
	mov qword [rsp+8*1674],rbx
	jmp L_3217
	
L_3218:
	mov rbx,  [rsp+8*1672]
	mov rdx,2
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1676],rax
	je L_3219
	mov rdx,t72
	mov rbx,rdx
	mov qword [rsp+8*1674],rbx
	jmp L_3217
	
L_3219:
	mov rbx,  [rsp+8*1672]
	mov rdx,3
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1677],rax
	je L_3220
	mov rdx,t75
	mov rbx,rdx
	mov qword [rsp+8*1674],rbx
	jmp L_3217
	
L_3220:
	mov rbx,  [rsp+8*1672]
	mov rdx,4
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1678],rax
	je L_3221
	mov rdx,t78
	mov rbx,rdx
	mov qword [rsp+8*1674],rbx
	jmp L_3217
	
L_3221:
	mov rbx,  [rsp+8*1672]
	mov rdx,5
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1679],rax
	je L_3222
	mov rdx,t81
	mov rbx,rdx
	mov qword [rsp+8*1674],rbx
	jmp L_3217
	
L_3222:
	mov rbx,  [rsp+8*1672]
	mov rdx,6
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1680],rax
	je L_3223
	mov rdx,t84
	mov rbx,rdx
	mov qword [rsp+8*1674],rbx
	jmp L_3217
	
L_3223:
	mov rbx,  [rsp+8*1672]
	mov rdx,7
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1681],rax
	je L_3224
	mov rdx,t87
	mov rbx,rdx
	mov qword [rsp+8*1674],rbx
	jmp L_3217
	
L_3224:
	mov rbx,  [rsp+8*1672]
	mov rdx,8
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1682],rax
	je L_3225
	mov rdx,t90
	mov rbx,rdx
	mov qword [rsp+8*1674],rbx
	jmp L_3217
	
L_3225:
	mov rbx,  [rsp+8*1672]
	mov rdx,9
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1683],rax
	je L_3226
	mov rdx,t93
	mov rbx,rdx
	mov qword [rsp+8*1674],rbx
	jmp L_3217
	
L_3226:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*1674],rbx
	
L_3217:
	mov rdx,  [rsp+8*1674]
	mov rbx,rdx
	mov qword [rsp+8*1684],rbx
	mov     rsi, [rsp+8*1684]
	mov     rdi, t122
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1685], rax
	mov     rsi, t126
	mov     rdi, [rsp+8*1685]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1685], rax
	mov rdx,  [rsp+8*1685]
	mov rbx,rdx
	mov qword [rsp+8*1686],rbx
	jmp L_3228
	
L_3214:
	xor rdx, rdx
	mov rax, [rsp+8*1670]
	mov rbx, 10
	cdq
	idiv ebx
	mov [rsp+8*1687], rax
	mov rbx,  [rsp+8*1687]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,0
	cmp rdx,rax
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*1689],rbx
	mov qword [rsp+8*1688],rdx
	je L_3229
	mov rdx,t66
	mov rbx,rdx
	mov qword [rsp+8*1690],rbx
	jmp L_3231
	
L_3229:
	mov rbx,  [rsp+8*1688]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1691],rax
	je L_3232
	mov rdx,t69
	mov rbx,rdx
	mov qword [rsp+8*1690],rbx
	jmp L_3231
	
L_3232:
	mov rbx,  [rsp+8*1688]
	mov rdx,2
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1692],rax
	je L_3233
	mov rdx,t72
	mov rbx,rdx
	mov qword [rsp+8*1690],rbx
	jmp L_3231
	
L_3233:
	mov rbx,  [rsp+8*1688]
	mov rdx,3
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1693],rax
	je L_3234
	mov rdx,t75
	mov rbx,rdx
	mov qword [rsp+8*1690],rbx
	jmp L_3231
	
L_3234:
	mov rbx,  [rsp+8*1688]
	mov rdx,4
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1694],rax
	je L_3235
	mov rdx,t78
	mov rbx,rdx
	mov qword [rsp+8*1690],rbx
	jmp L_3231
	
L_3235:
	mov rbx,  [rsp+8*1688]
	mov rdx,5
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1695],rax
	je L_3236
	mov rdx,t81
	mov rbx,rdx
	mov qword [rsp+8*1690],rbx
	jmp L_3231
	
L_3236:
	mov rbx,  [rsp+8*1688]
	mov rdx,6
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1696],rax
	je L_3237
	mov rdx,t84
	mov rbx,rdx
	mov qword [rsp+8*1690],rbx
	jmp L_3231
	
L_3237:
	mov rbx,  [rsp+8*1688]
	mov rdx,7
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1697],rax
	je L_3238
	mov rdx,t87
	mov rbx,rdx
	mov qword [rsp+8*1690],rbx
	jmp L_3231
	
L_3238:
	mov rbx,  [rsp+8*1688]
	mov rdx,8
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1698],rax
	je L_3239
	mov rdx,t90
	mov rbx,rdx
	mov qword [rsp+8*1690],rbx
	jmp L_3231
	
L_3239:
	mov rbx,  [rsp+8*1688]
	mov rdx,9
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1699],rax
	je L_3240
	mov rdx,t93
	mov rbx,rdx
	mov qword [rsp+8*1690],rbx
	jmp L_3231
	
L_3240:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*1690],rbx
	
L_3231:
	mov rdx,  [rsp+8*1690]
	mov rbx,rdx
	mov qword [rsp+8*1700],rbx
	mov     rsi, [rsp+8*1700]
	mov     rdi, t127
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1701], rax
	xor rdx, rdx
	mov rax, [rsp+8*1670]
	mov rbx, 10
	cdq
	idiv ebx
	mov [rsp+8*1702], rdx
	mov rbx,  [rsp+8*1702]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,0
	cmp rdx,rax
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*1704],rbx
	mov qword [rsp+8*1703],rdx
	je L_3241
	mov rdx,t66
	mov rbx,rdx
	mov qword [rsp+8*1705],rbx
	jmp L_3243
	
L_3241:
	mov rbx,  [rsp+8*1703]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1706],rax
	je L_3244
	mov rdx,t69
	mov rbx,rdx
	mov qword [rsp+8*1705],rbx
	jmp L_3243
	
L_3244:
	mov rbx,  [rsp+8*1703]
	mov rdx,2
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1707],rax
	je L_3245
	mov rdx,t72
	mov rbx,rdx
	mov qword [rsp+8*1705],rbx
	jmp L_3243
	
L_3245:
	mov rbx,  [rsp+8*1703]
	mov rdx,3
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1708],rax
	je L_3246
	mov rdx,t75
	mov rbx,rdx
	mov qword [rsp+8*1705],rbx
	jmp L_3243
	
L_3246:
	mov rbx,  [rsp+8*1703]
	mov rdx,4
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1709],rax
	je L_3247
	mov rdx,t78
	mov rbx,rdx
	mov qword [rsp+8*1705],rbx
	jmp L_3243
	
L_3247:
	mov rbx,  [rsp+8*1703]
	mov rdx,5
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1710],rax
	je L_3248
	mov rdx,t81
	mov rbx,rdx
	mov qword [rsp+8*1705],rbx
	jmp L_3243
	
L_3248:
	mov rbx,  [rsp+8*1703]
	mov rdx,6
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1711],rax
	je L_3249
	mov rdx,t84
	mov rbx,rdx
	mov qword [rsp+8*1705],rbx
	jmp L_3243
	
L_3249:
	mov rbx,  [rsp+8*1703]
	mov rdx,7
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1712],rax
	je L_3250
	mov rdx,t87
	mov rbx,rdx
	mov qword [rsp+8*1705],rbx
	jmp L_3243
	
L_3250:
	mov rbx,  [rsp+8*1703]
	mov rdx,8
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1713],rax
	je L_3251
	mov rdx,t90
	mov rbx,rdx
	mov qword [rsp+8*1705],rbx
	jmp L_3243
	
L_3251:
	mov rbx,  [rsp+8*1703]
	mov rdx,9
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1714],rax
	je L_3252
	mov rdx,t93
	mov rbx,rdx
	mov qword [rsp+8*1705],rbx
	jmp L_3243
	
L_3252:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*1705],rbx
	
L_3243:
	mov rdx,  [rsp+8*1705]
	mov rbx,rdx
	mov qword [rsp+8*1715],rbx
	mov     rsi, [rsp+8*1715]
	mov     rdi, [rsp+8*1701]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1701], rax
	mov     rsi, t137
	mov     rdi, [rsp+8*1701]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1701], rax
	mov rdx,  [rsp+8*1701]
	mov rbx,rdx
	mov qword [rsp+8*1686],rbx
	
L_3228:
	mov rdx,  [rsp+8*1686]
	mov rbx,rdx
	mov qword [rsp+8*1716],rbx
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1716]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1717], rax
	mov rdx,  [gbl+8*3]
	mov rbx,rdx
	mov rax,  [rsp+8*2]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1718],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1720],rbx
	mov qword [rsp+8*1719],rdx
	mov     rsi, [rsp+8*1720]
	mov     rdi, [rsp+8*1717]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1717], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1717]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1717], rax
	mov     rsi, [gbl+8*1721]
	mov     rdi, [rsp+8*1717]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1717], rax
	mov rbx,  [rsp+8*1717]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1722],rdx
	mov rdi,[rsp+8*1722] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [rsp+8*2]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*1723],rbx
	mov qword [rsp+8*2],rdx
	jmp L_3043
	
L_3044:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*2],rbx
	
L_3046:
	mov rbx,  [rsp+8*2]
	mov rdx,31
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*1724],rax
	je L_3047
	mov rbx,  [rsp+8*2]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,9
	cmp rdx,rax
	mov rbx, 0
	setle bl
	cmp rbx, 0
	mov qword [rsp+8*1726],rbx
	mov qword [rsp+8*1725],rdx
	je L_3253
	mov rbx,  [rsp+8*1725]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,0
	cmp rdx,rax
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*1728],rbx
	mov qword [rsp+8*1727],rdx
	je L_3254
	mov rdx,t66
	mov rbx,rdx
	mov qword [rsp+8*1729],rbx
	jmp L_3256
	
L_3254:
	mov rbx,  [rsp+8*1727]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1730],rax
	je L_3257
	mov rdx,t69
	mov rbx,rdx
	mov qword [rsp+8*1729],rbx
	jmp L_3256
	
L_3257:
	mov rbx,  [rsp+8*1727]
	mov rdx,2
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1731],rax
	je L_3258
	mov rdx,t72
	mov rbx,rdx
	mov qword [rsp+8*1729],rbx
	jmp L_3256
	
L_3258:
	mov rbx,  [rsp+8*1727]
	mov rdx,3
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1732],rax
	je L_3259
	mov rdx,t75
	mov rbx,rdx
	mov qword [rsp+8*1729],rbx
	jmp L_3256
	
L_3259:
	mov rbx,  [rsp+8*1727]
	mov rdx,4
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1733],rax
	je L_3260
	mov rdx,t78
	mov rbx,rdx
	mov qword [rsp+8*1729],rbx
	jmp L_3256
	
L_3260:
	mov rbx,  [rsp+8*1727]
	mov rdx,5
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1734],rax
	je L_3261
	mov rdx,t81
	mov rbx,rdx
	mov qword [rsp+8*1729],rbx
	jmp L_3256
	
L_3261:
	mov rbx,  [rsp+8*1727]
	mov rdx,6
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1735],rax
	je L_3262
	mov rdx,t84
	mov rbx,rdx
	mov qword [rsp+8*1729],rbx
	jmp L_3256
	
L_3262:
	mov rbx,  [rsp+8*1727]
	mov rdx,7
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1736],rax
	je L_3263
	mov rdx,t87
	mov rbx,rdx
	mov qword [rsp+8*1729],rbx
	jmp L_3256
	
L_3263:
	mov rbx,  [rsp+8*1727]
	mov rdx,8
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1737],rax
	je L_3264
	mov rdx,t90
	mov rbx,rdx
	mov qword [rsp+8*1729],rbx
	jmp L_3256
	
L_3264:
	mov rbx,  [rsp+8*1727]
	mov rdx,9
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1738],rax
	je L_3265
	mov rdx,t93
	mov rbx,rdx
	mov qword [rsp+8*1729],rbx
	jmp L_3256
	
L_3265:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*1729],rbx
	
L_3256:
	mov rdx,  [rsp+8*1729]
	mov rbx,rdx
	mov qword [rsp+8*1739],rbx
	mov     rsi, [rsp+8*1739]
	mov     rdi, t103
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1740], rax
	mov     rsi, t107
	mov     rdi, [rsp+8*1740]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1740], rax
	mov rdx,  [rsp+8*1740]
	mov rbx,rdx
	mov qword [rsp+8*1741],rbx
	jmp L_3267
	
L_3253:
	xor rdx, rdx
	mov rax, [rsp+8*1725]
	mov rbx, 10
	cdq
	idiv ebx
	mov [rsp+8*1742], rax
	mov rbx,  [rsp+8*1742]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,0
	cmp rdx,rax
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*1744],rbx
	mov qword [rsp+8*1743],rdx
	je L_3268
	mov rdx,t66
	mov rbx,rdx
	mov qword [rsp+8*1745],rbx
	jmp L_3270
	
L_3268:
	mov rbx,  [rsp+8*1743]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1746],rax
	je L_3271
	mov rdx,t69
	mov rbx,rdx
	mov qword [rsp+8*1745],rbx
	jmp L_3270
	
L_3271:
	mov rbx,  [rsp+8*1743]
	mov rdx,2
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1747],rax
	je L_3272
	mov rdx,t72
	mov rbx,rdx
	mov qword [rsp+8*1745],rbx
	jmp L_3270
	
L_3272:
	mov rbx,  [rsp+8*1743]
	mov rdx,3
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1748],rax
	je L_3273
	mov rdx,t75
	mov rbx,rdx
	mov qword [rsp+8*1745],rbx
	jmp L_3270
	
L_3273:
	mov rbx,  [rsp+8*1743]
	mov rdx,4
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1749],rax
	je L_3274
	mov rdx,t78
	mov rbx,rdx
	mov qword [rsp+8*1745],rbx
	jmp L_3270
	
L_3274:
	mov rbx,  [rsp+8*1743]
	mov rdx,5
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1750],rax
	je L_3275
	mov rdx,t81
	mov rbx,rdx
	mov qword [rsp+8*1745],rbx
	jmp L_3270
	
L_3275:
	mov rbx,  [rsp+8*1743]
	mov rdx,6
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1751],rax
	je L_3276
	mov rdx,t84
	mov rbx,rdx
	mov qword [rsp+8*1745],rbx
	jmp L_3270
	
L_3276:
	mov rbx,  [rsp+8*1743]
	mov rdx,7
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1752],rax
	je L_3277
	mov rdx,t87
	mov rbx,rdx
	mov qword [rsp+8*1745],rbx
	jmp L_3270
	
L_3277:
	mov rbx,  [rsp+8*1743]
	mov rdx,8
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1753],rax
	je L_3278
	mov rdx,t90
	mov rbx,rdx
	mov qword [rsp+8*1745],rbx
	jmp L_3270
	
L_3278:
	mov rbx,  [rsp+8*1743]
	mov rdx,9
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1754],rax
	je L_3279
	mov rdx,t93
	mov rbx,rdx
	mov qword [rsp+8*1745],rbx
	jmp L_3270
	
L_3279:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*1745],rbx
	
L_3270:
	mov rdx,  [rsp+8*1745]
	mov rbx,rdx
	mov qword [rsp+8*1755],rbx
	mov     rsi, [rsp+8*1755]
	mov     rdi, t108
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1756], rax
	xor rdx, rdx
	mov rax, [rsp+8*1725]
	mov rbx, 10
	cdq
	idiv ebx
	mov [rsp+8*1757], rdx
	mov rbx,  [rsp+8*1757]
	mov rdi,rbx
	mov rdx,rdi
	mov rax,0
	cmp rdx,rax
	mov rbx, 0
	sete bl
	cmp rbx, 0
	mov qword [rsp+8*1759],rbx
	mov qword [rsp+8*1758],rdx
	je L_3280
	mov rdx,t66
	mov rbx,rdx
	mov qword [rsp+8*1760],rbx
	jmp L_3282
	
L_3280:
	mov rbx,  [rsp+8*1758]
	mov rdx,1
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1761],rax
	je L_3283
	mov rdx,t69
	mov rbx,rdx
	mov qword [rsp+8*1760],rbx
	jmp L_3282
	
L_3283:
	mov rbx,  [rsp+8*1758]
	mov rdx,2
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1762],rax
	je L_3284
	mov rdx,t72
	mov rbx,rdx
	mov qword [rsp+8*1760],rbx
	jmp L_3282
	
L_3284:
	mov rbx,  [rsp+8*1758]
	mov rdx,3
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1763],rax
	je L_3285
	mov rdx,t75
	mov rbx,rdx
	mov qword [rsp+8*1760],rbx
	jmp L_3282
	
L_3285:
	mov rbx,  [rsp+8*1758]
	mov rdx,4
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1764],rax
	je L_3286
	mov rdx,t78
	mov rbx,rdx
	mov qword [rsp+8*1760],rbx
	jmp L_3282
	
L_3286:
	mov rbx,  [rsp+8*1758]
	mov rdx,5
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1765],rax
	je L_3287
	mov rdx,t81
	mov rbx,rdx
	mov qword [rsp+8*1760],rbx
	jmp L_3282
	
L_3287:
	mov rbx,  [rsp+8*1758]
	mov rdx,6
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1766],rax
	je L_3288
	mov rdx,t84
	mov rbx,rdx
	mov qword [rsp+8*1760],rbx
	jmp L_3282
	
L_3288:
	mov rbx,  [rsp+8*1758]
	mov rdx,7
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1767],rax
	je L_3289
	mov rdx,t87
	mov rbx,rdx
	mov qword [rsp+8*1760],rbx
	jmp L_3282
	
L_3289:
	mov rbx,  [rsp+8*1758]
	mov rdx,8
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1768],rax
	je L_3290
	mov rdx,t90
	mov rbx,rdx
	mov qword [rsp+8*1760],rbx
	jmp L_3282
	
L_3290:
	mov rbx,  [rsp+8*1758]
	mov rdx,9
	cmp rbx,rdx
	mov rax, 0
	sete al
	cmp rax, 0
	mov qword [rsp+8*1769],rax
	je L_3291
	mov rdx,t93
	mov rbx,rdx
	mov qword [rsp+8*1760],rbx
	jmp L_3282
	
L_3291:
	mov rdx,0
	mov rbx,rdx
	mov qword [rsp+8*1760],rbx
	
L_3282:
	mov rdx,  [rsp+8*1760]
	mov rbx,rdx
	mov qword [rsp+8*1770],rbx
	mov     rsi, [rsp+8*1770]
	mov     rdi, [rsp+8*1756]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1756], rax
	mov     rsi, t118
	mov     rdi, [rsp+8*1756]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1756], rax
	mov rdx,  [rsp+8*1756]
	mov rbx,rdx
	mov qword [rsp+8*1741],rbx
	
L_3267:
	mov rdx,  [rsp+8*1741]
	mov rbx,rdx
	mov qword [rsp+8*1771],rbx
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1771]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1772], rax
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,  [rsp+8*2]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1773],rbx
	mov rbx, [rdx]
	mov qword [rsp+8*1775],rbx
	mov qword [rsp+8*1774],rdx
	mov     rsi, [rsp+8*1775]
	mov     rdi, [rsp+8*1772]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1772], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1772]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1772], rax
	mov     rsi, [gbl+8*1721]
	mov     rdi, [rsp+8*1772]
	push r11
	push r10
	push r9
	push r8
	call    concat
	pop r8
	pop r9
	pop r10
	pop r11
	mov [rsp+8*1772], rax
	mov rbx,  [rsp+8*1772]
	mov rdi,rbx
	mov rdx,rdi
	mov qword [rsp+8*1776],rdx
	mov rdi,[rsp+8*1776] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [rsp+8*2]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*1777],rbx
	mov qword [rsp+8*2],rdx
	jmp L_3046
	
L_3047:
	mov rdx,1
	mov rbx,rdx
	mov qword [rsp+8*2],rbx
	
L_3049:
	mov rbx,  [rsp+8*2]
	mov rdx,31
	cmp rbx,rdx
	mov rax, 0
	setl al
	cmp rax, 0
	mov qword [rsp+8*1778],rax
	je L_3050
	mov rdx,  [gbl+8*190]
	mov rbx,rdx
	mov rax,  [rsp+8*2]
	lea rdx,[rbx+rax*8+8H]
	mov qword [rsp+8*1779],rbx
	mov rbx, [rdx]
	mov rdi,rbx
	mov qword [rsp+8*1781],rbx
	mov rbx,rdi
	mov qword [rsp+8*1782],rbx
	mov qword [rsp+8*1780],rdx
	mov rdi,[rsp+8*1782] 
	add rdi, 1 
	push r11
	push r10
	push r9
	push r8
	call puts
	pop r8
	pop r9
	pop r10
	pop r11
	mov rdx,  [rsp+8*2]
	mov rbx,rdx
	mov rax,1
	add rdx,rax
	mov qword [rsp+8*1783],rbx
	mov qword [rsp+8*2],rdx
	jmp L_3049
	
L_3050:
	mov rbx,0
	mov rax,rbx
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 14352
	mov     rdi, 256
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*1784], rax
	mov rdx,  [gbl+8*1784]
	mov rbx,rdx
	mov qword [gbl+8*190],rbx
	mov     rdi, 256
	push r11
	push r10
	push r9
	push r8
	call    mallocArray
	pop r8
	pop r9
	pop r10
	pop r11
	mov     qword [gbl+8*1785], rax
	mov rdx,  [gbl+8*1785]
	mov rbx,rdx
	mov qword [gbl+8*3],rbx
	mov rbx,t139
	mov rax,rbx
	mov rdx,t140
	mov rbx,rdx
	mov qword [gbl+8*359],rbx
	mov rdx,t141
	mov rbx,rdx
	mov qword [gbl+8*1622],rbx
	mov qword [gbl+8*1721],rax
	mov rbx,  [rsp+8*1786]
	mov rax,rbx
	leave
	ret
	
	 section   .bss
gbl:         resb   16336
buff.1788:
        resb    256
arg:
        resb    1024

trsp:         resb   1024
s.1809:
        resb    1

ML_31:
        resb    319
mem.1758:
        resb    536870912
	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	
GS_31:
	db 25H, 6CH, 64H, 00H
	
GS_32:
	db 25H, 73H, 00H
	ML_32:
        db 25H, 6CH, 64H, 00H

t122:
	 db 2,"c[" ,0

t243:
	 db 1,":" ,0

t363:
	 db 1,"X" ,0

t487:
	 db 1,"x" ,0

t483:
	 db 1,"w" ,0

t515:
	 db 19,"int main(){int i=0;" ,0

t118:
	 db 2,"]=" ,0

t239:
	 db 1,"9" ,0

t635:
	 db 1,"}" ,0

t511:
	 db 1,"~" ,0

t599:
	 db 241,"println(c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[65]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[14]+c[16]+c[15]+c[8]+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[4]+c[16]+c[15]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t235:
	 db 1,"8" ,0

t631:
	 db 31,"for(i=1;i<31;i++)println(s[i]);" ,0

t359:
	 db 1,"W" ,0

t479:
	 db 1,"v" ,0

t519:
	 db 119,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[66]+c[71]+c[69]+c[82]+c[7]+c[71]+c[76]+c[82]+c[0]+c[86]+c[8]+c[89]);" ,0

t191:
	 db 1,"-" ,0

t199:
	 db 1,"/" ,0

t595:
	 db 206,"println(c[71]+c[68]+c[7]+c[65]+c[65]+c[27]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[65]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t231:
	 db 1,"7" ,0

t355:
	 db 1,"V" ,0

t475:
	 db 1,"u" ,0

t195:
	 db 1,"." ,0

t591:
	 db 113,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[65]+c[17]+c[7]+c[71]+c[76]+c[82]+c[0]+c[65]+c[65]+c[8]+c[89]);" ,0

t351:
	 db 1,"U" ,0

t471:
	 db 1,"t" ,0

t108:
	 db 2,"s[" ,0

t107:
	 db 2,"]=" ,0

t503:
	 db 1,"|" ,0

t627:
	 db 48,"for(i=0;i<31;i++)println(s2(i)+a2q+s[i]+a2q+co);" ,0

t467:
	 db 1,"s" ,0

t66:
	 db 1,"0" ,0

t103:
	 db 2,"s[" ,0

t587:
	 db 15,"println(c[91]);" ,0

t69:
	 db 1,"1" ,0

t227:
	 db 1,"6" ,0

t623:
	 db 48,"for(i=0;i<93;i++)println(c2(i)+a2q+c[i]+a2q+co);" ,0

t347:
	 db 1,"T" ,0

t507:
	 db 1,"}" ,0

t143:
	 db 1," " ,0

t267:
	 db 1,"@" ,0

t387:
	 db 1,"_" ,0

t140:
	 db 1,"",34,"" ,0

t72:
	 db 1,"2" ,0

t263:
	 db 1,"?" ,0

t141:
	 db 1,"",92,"" ,0

t383:
	 db 1,"^" ,0

t415:
	 db 1,"f" ,0

t539:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[19]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[19]+a2q+c[26]);" ,0

t75:
	 db 1,"3" ,0

t78:
	 db 1,"4" ,0

t137:
	 db 2,"]=" ,0

t379:
	 db 1,"]" ,0

t411:
	 db 1,"e" ,0

t499:
	 db 1,"{" ,0

t139:
	 db 1,";" ,0

t535:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[18]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[18]+a2q+c[26]);" ,0

t259:
	 db 1,">" ,0

t419:
	 db 1,"g" ,0

t375:
	 db 1,"[" ,0

t495:
	 db 1,"z" ,0

t531:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[17]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[17]+a2q+c[26]);" ,0

t255:
	 db 1,"=" ,0

t81:
	 db 1,"5" ,0

t371:
	 db 1,"Z" ,0

t491:
	 db 1,"y" ,0

t251:
	 db 1,"<" ,0

t84:
	 db 1,"6" ,0

t87:
	 db 1,"7" ,0

t407:
	 db 1,"d" ,0

t527:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[16]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[16]+a2q+c[26]);" ,0

t126:
	 db 2,"]=" ,0

t247:
	 db 1,";" ,0

t367:
	 db 1,"Y" ,0

t403:
	 db 1,"c" ,0

t127:
	 db 2,"c[" ,0

t523:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[15]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[15]+a2q+c[26]);" ,0

t287:
	 db 1,"E" ,0

t90:
	 db 1,"8" ,0

t443:
	 db 1,"m" ,0

t167:
	 db 1,"'" ,0

t563:
	 db 15,"println(c[91]);" ,0

t283:
	 db 1,"D" ,0

t93:
	 db 1,"9" ,0

t163:
	 db 1,"&" ,0

t559:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[24]+a2q+c[26]);" ,0

t319:
	 db 1,"M" ,0

t439:
	 db 1,"l" ,0

t159:
	 db 1,"%" ,0

t555:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[23]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[23]+a2q+c[26]);" ,0

t279:
	 db 1,"C" ,0

t315:
	 db 1,"L" ,0

t435:
	 db 1,"k" ,0

t391:
	 db 1,"`" ,0

t155:
	 db 1,"$" ,0

t551:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[22]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[22]+a2q+c[26]);" ,0

t275:
	 db 1,"B" ,0

t311:
	 db 1,"K" ,0

t399:
	 db 1,"b" ,0

t431:
	 db 1,"j" ,0

t151:
	 db 1,"#" ,0

t271:
	 db 1,"A" ,0

t395:
	 db 1,"a" ,0

t427:
	 db 1,"i" ,0

t547:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[21]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[21]+a2q+c[26]);" ,0

t307:
	 db 1,"J" ,0

t423:
	 db 1,"h" ,0

t147:
	 db 1,"!" ,0

t543:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[20]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[20]+a2q+c[26]);" ,0

t303:
	 db 1,"I" ,0

t463:
	 db 1,"r" ,0

t187:
	 db 1,"," ,0

t583:
	 db 241,"println(c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[81]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[14]+c[16]+c[15]+c[8]+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[4]+c[16]+c[15]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t223:
	 db 1,"5" ,0

t343:
	 db 1,"S" ,0

t183:
	 db 1,"+" ,0

t339:
	 db 1,"R" ,0

t459:
	 db 1,"q" ,0

t219:
	 db 1,"4" ,0

t615:
	 db 96,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[63]+c[17]+c[64]+c[28]+a2q+a2b+a2b+a2q+c[26]);" ,0

t335:
	 db 1,"Q" ,0

t455:
	 db 1,"p" ,0

t579:
	 db 206,"println(c[71]+c[68]+c[7]+c[81]+c[81]+c[27]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[81]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t215:
	 db 1,"3" ,0

t611:
	 db 96,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[63]+c[17]+c[79]+c[28]+a2q+a2b+a2q+a2q+c[26]);" ,0

t619:
	 db 14,"println(s[0]);" ,0

t171:
	 db 1,"(" ,0

t291:
	 db 1,"F" ,0

t331:
	 db 1,"P" ,0

t451:
	 db 1,"o" ,0

t179:
	 db 1,"*" ,0

t575:
	 db 113,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[81]+c[17]+c[7]+c[71]+c[76]+c[82]+c[0]+c[81]+c[81]+c[8]+c[89]);" ,0

t211:
	 db 1,"2" ,0

t299:
	 db 1,"H" ,0

t175:
	 db 1,")" ,0

t571:
	 db 169,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[59]+c[0]+c[65]+c[28]+c[76]+c[67]+c[85]+c[0]+c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[17]+c[20]+c[21]+c[59]+c[26]);" ,0

t295:
	 db 1,"G" ,0

t207:
	 db 1,"1" ,0

t603:
	 db 15,"println(c[91]);" ,0

t327:
	 db 1,"O" ,0

t203:
	 db 1,"0" ,0

t323:
	 db 1,"N" ,0

t447:
	 db 1,"n" ,0

t567:
	 db 169,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[59]+c[0]+c[81]+c[28]+c[76]+c[67]+c[85]+c[0]+c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[17]+c[20]+c[21]+c[59]+c[26]);" ,0

t607:
	 db 88,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[65]+c[77]+c[28]+a2q+c[26]+a2q+c[26]);" ,0

SECTION .data.rel.local align=8

cur.1759: dq mem.1758

