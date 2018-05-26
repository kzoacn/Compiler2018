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
	inc rax
        shl     rax, 3
        mov     rdi, rax
        call    malloc
        mov     qword [rbp-8H], rax
        mov     rax, qword [rbp-18H]
	inc rax
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
	inc rax
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
	inc eax
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
	inc eax
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
	inc rax
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
	inc rax
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
	inc rax
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
	inc rax
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
	inc rax
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
	inc rax
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
	sub    rsp, 2096
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 4080
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
	mov qword [rsp+8*1],r8
	call    getInt
	mov     [rsp+8*2], rax
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov qword [rsp+8*3],r8
	call    getInt
	mov     [rsp+8*4], rax
	mov r9,  [rsp+8*4]
	mov r8,r9
	mov qword [rsp+8*5],r8
	call    getInt
	mov     [rsp+8*6], rax
	mov r9,  [rsp+8*6]
	mov r8,r9
	mov qword [rsp+8*7],r8
	call    getInt
	mov     [rsp+8*8], rax
	mov r9,  [rsp+8*8]
	mov r8,r9
	mov r10,  [rsp+8*3]
	mov r11,1
	mov r9,r10
	add r9,r11
	mov r11,r9
	mov r9,r11
	mov qword [rsp+8*9],r8
	mov r8,r9
	mov r11,r8
	mov r10,r11
	mov qword [rsp+8*12],r9
	mov r9,r10
	mov qword [rsp+8*13],r8
	mov qword rdi,r11
	mov r11,13
	mov r8,r11
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*14],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov qword rsi,r8
	mov r8,r9
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r11
	mov r11,17
	mov r9,r11
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r10
	mov r10,  [rsp+8*15]
	mov r8,r10
	mov qword rsi,r9
	mov r9,r8
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r11
	mov r11,32767
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov rcx,r9
	shr r11,cl
	mov rcx,1
	shl r11,cl
	inc r11 
	mov r10,r11
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*31],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	mov qword [rsp+8*32],r11
	mov r11,  [rsp+8*31]
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*42],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*43],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*44],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*45],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*46],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*47],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*48],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*49],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*50],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*51],r11
	mov r11,r9
	mov qword [rsp+8*53],r9
	mov qword [rsp+8*13],r10
	mov r10,65535
	mov r9,r10
	mov qword [rsp+8*52],r8
	mov r8,32767
	mov r10,r8
	mov r8,r10
	mov qword [rsp+8*3],r11
	mov r11,r9
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r11
	mov qword rsi,r9
	mov r9,r10
	mov qword [rsp+8*20],r8
	mov r8,r9
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*54],r8
	mov qword [rsp+8*22],r10
	mov r10,0
	mov r8,r10
	mov qword [rsp+8*23],r9
	mov r9,0
	mov r10,r9
	mov qword [rsp+8*55],r11
	mov r11,0
	mov r9,r11
	mov qword [rsp+8*56],r8
	mov r8,0
	mov r11,r8
	mov qword [rsp+8*57],r10
	mov r10,0
	mov r8,r10
	mov qword [rsp+8*60],r8
	mov r10,  [rsp+8*5]
	mov r8,r10
	mov qword [rsp+8*61],r8
	mov qword [rsp+8*58],r9
	mov qword [rsp+8*59],r11
	
L_11:
	mov r8,  [rsp+8*61]
	mov r9,  [rsp+8*7]
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*62],r10
	je L_12
	mov r9,  [rsp+8*3]
	mov r8,r9
	mov r10,r8
	mov r11,r10
	mov qword rdi,r8
	mov r8,13
	mov r9,r8
	mov qword [rsp+8*14],r10
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*18],r9
	mov qword [rsp+8*19],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*63],r11
	mov r11,  [rsp+8*55]
	mov qword [rsp+8*15],r8
	mov r8,r10
	and r8,r11
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov r8,r10
	mov r11,r8
	mov qword [rsp+8*65],r9
	mov r9,r11
	mov qword [rsp+8*3],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*14],r11
	mov r11,  [rsp+8*15]
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*66],r11
	mov r11,  [rsp+8*55]
	mov qword [rsp+8*15],r8
	mov r8,r10
	and r8,r11
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov r8,r10
	mov r11,r8
	mov qword [rsp+8*68],r9
	mov r9,r11
	mov qword [rsp+8*3],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*14],r11
	mov r11,  [rsp+8*15]
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*69],r11
	mov r11,  [rsp+8*55]
	mov qword [rsp+8*15],r8
	mov r8,r10
	and r8,r11
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov r8,r10
	mov r11,r8
	mov qword [rsp+8*71],r9
	mov r9,r11
	mov qword [rsp+8*3],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*14],r11
	mov r11,  [rsp+8*15]
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*72],r11
	mov r11,  [rsp+8*55]
	mov qword [rsp+8*15],r8
	mov r8,r10
	and r8,r11
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov r8,r10
	mov r11,r8
	mov qword [rsp+8*74],r9
	mov r9,r11
	mov qword [rsp+8*3],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*14],r11
	mov r11,  [rsp+8*15]
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*75],r11
	mov r11,  [rsp+8*55]
	mov qword [rsp+8*15],r8
	mov r8,r10
	and r8,r11
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov r8,r10
	mov r11,r8
	mov qword [rsp+8*77],r9
	mov r9,r11
	mov qword [rsp+8*3],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*14],r11
	mov r11,  [rsp+8*15]
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*78],r11
	mov r11,  [rsp+8*55]
	mov qword [rsp+8*15],r8
	mov r8,r10
	and r8,r11
	mov qword [rsp+8*3],r10
	mov r10,r8
	mov r8,  [rsp+8*65]
	mov qword [rsp+8*41],r9
	mov r9,  [rsp+8*68]
	mov r11,r8
	xor r11,r9
	mov qword [rsp+8*80],r10
	mov r10,  [rsp+8*71]
	xor r11,r10
	mov r8,r11
	mov r11,  [rsp+8*74]
	mov r9,  [rsp+8*77]
	mov r10,r11
	xor r10,r9
	mov qword [rsp+8*82],r8
	mov r8,  [rsp+8*80]
	xor r10,r8
	mov r9,  [rsp+8*82]
	xor r10,r9
	mov r9,r10
	mov r10,  [rsp+8*55]
	mov r11,r9
	and r11,r10
	mov r9,r11
	mov r11,  [rsp+8*65]
	mov r8,  [rsp+8*68]
	mov r10,r11
	add r10,r8
	mov qword [rsp+8*82],r9
	mov r9,  [rsp+8*71]
	add r10,r9
	inc r10 
	mov r8,r10
	mov r10,  [rsp+8*74]
	mov r11,  [rsp+8*77]
	mov r9,r10
	add r9,r11
	mov qword [rsp+8*86],r8
	mov r8,  [rsp+8*80]
	add r9,r8
	mov r10,  [rsp+8*86]
	sub r9,r10
	neg r9
	mov r10,r9
	mov r9,  [rsp+8*55]
	mov r11,r10
	and r11,r9
	mov r10,r11
	xor rdx, rdx
	mov r11,  [rsp+8*65]
	mov rax, r11
	mov r8,  [rsp+8*9]
	mov rbx, r8
	cdq
	idiv rbx
	mov r9, rdx
	xor rdx, rdx
	mov qword [rsp+8*86],r10
	mov r10,  [rsp+8*68]
	mov rax, r10
	mov rbx, r8
	cdq
	idiv rbx
	mov qword [rsp+8*89],r9
	mov r9, rdx
	mov r11,  [rsp+8*89]
	mov r8,r11
	imul r8,r9
	xor rdx, rdx
	mov r9,  [rsp+8*71]
	mov rax, r9
	mov r11,  [rsp+8*9]
	mov rbx, r11
	cdq
	idiv rbx
	mov r10, rdx
	mov r9,r8
	imul r9,r10
	mov r8,r9
	xor rdx, rdx
	mov r9,  [rsp+8*74]
	mov rax, r9
	mov rbx, r11
	cdq
	idiv rbx
	mov r10, rdx
	mov r9,r8
	imul r9,r10
	xor rdx, rdx
	mov r10,  [rsp+8*77]
	mov rax, r10
	mov rbx, r11
	cdq
	idiv rbx
	mov qword [rsp+8*94],r8
	mov r8, rdx
	mov r10,r9
	imul r10,r8
	xor rdx, rdx
	mov r8,  [rsp+8*80]
	mov rax, r8
	mov rbx, r11
	cdq
	idiv rbx
	mov r9, rdx
	mov r8,r10
	imul r8,r9
	mov r9,r8
	mov r8,  [rsp+8*55]
	mov r10,r9
	and r10,r8
	mov r9,r10
	mov r10,  [rsp+8*65]
	mov r11,  [rsp+8*68]
	mov r8,r10
	xor r8,r11
	mov qword [rsp+8*94],r9
	mov r9,  [rsp+8*71]
	xor r8,r9
	mov r10,  [rsp+8*74]
	mov r11,  [rsp+8*77]
	mov qword [rsp+8*102],r8
	mov r8,r10
	xor r8,r11
	mov r9,  [rsp+8*80]
	xor r8,r9
	mov r10,  [rsp+8*102]
	cmp r10,r8
	mov r10, 0
	setg r10B
	mov r8,  [rsp+8*104]
	add r8,r8
	cmp r10, 0
	mov qword [rsp+8*104],r8
	mov qword [rsp+8*102],r10
	je L_14
	mov r8,  [rsp+8*65]
	mov r9,  [rsp+8*68]
	mov r10,r8
	add r10,r9
	mov r11,  [rsp+8*55]
	and r10,r11
	xor rdx, rdx
	mov rax, r10
	mov r8,  [rsp+8*9]
	mov rbx, r8
	cdq
	idiv rbx
	mov r9, rdx
	xor rdx, rdx
	mov r10,  [rsp+8*71]
	mov rax, r10
	mov rbx, r8
	cdq
	idiv rbx
	mov r11, rdx
	inc r11 
	xor rdx, rdx
	mov rax, r9
	mov rbx, r11
	cdq
	idiv rbx
	mov r8, rdx
	mov r9,r8
	mov qword [rsp+8*108],r8
	mov qword [rsp+8*109],r9
	mov qword [rsp+8*107],r11
	jmp L_15
	
L_14:
	mov r8,  [rsp+8*71]
	mov r9,  [rsp+8*68]
	mov r10,r8
	add r10,r9
	mov r11,  [rsp+8*55]
	and r10,r11
	xor rdx, rdx
	mov rax, r10
	mov r8,  [rsp+8*9]
	mov rbx, r8
	cdq
	idiv rbx
	mov r9, rdx
	xor rdx, rdx
	mov r10,  [rsp+8*65]
	mov rax, r10
	mov rbx, r8
	cdq
	idiv rbx
	mov r11, rdx
	inc r11 
	xor rdx, rdx
	mov rax, r9
	mov rbx, r11
	cdq
	idiv rbx
	mov r8, rdx
	mov r9,r8
	mov qword [rsp+8*113],r8
	mov qword [rsp+8*109],r9
	mov qword [rsp+8*112],r11
	
L_15:
	mov r8,  [rsp+8*82]
	mov r9,r8
	xor r9,10001
	mov r10,r9
	mov r11,r10
	mov r8,r11
	mov r10,r8
	mov r9,r10
	mov qword [rsp+8*12],r11
	mov r11,r9
	mov qword [rsp+8*13],r8
	mov qword rdi,r10
	mov r10,13
	mov r8,r10
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov qword rsi,r8
	mov r8,r9
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*42],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*43],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*44],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*45],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*46],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*47],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*48],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*49],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*50],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*51],r11
	mov r11,  [rsp+8*56]
	mov qword [rsp+8*13],r10
	mov r10,r11
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*115],r9
	mov r9,  [rsp+8*86]
	mov r10,r9
	xor r10,10002
	mov r9,r10
	mov r10,r9
	mov qword [rsp+8*52],r8
	mov r8,r10
	mov r9,r8
	mov qword [rsp+8*56],r11
	mov r11,r9
	mov qword [rsp+8*12],r10
	mov r10,r11
	mov qword [rsp+8*13],r8
	mov qword rdi,r9
	mov r9,13
	mov r8,r9
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*14],r11
	mov r11,  [rsp+8*15]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*18],r9
	mov qword [rsp+8*19],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*42],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*43],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*44],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*45],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*46],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*47],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*48],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*49],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*50],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*51],r11
	mov r11,  [rsp+8*57]
	mov qword [rsp+8*13],r10
	mov r10,r11
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*118],r9
	mov r9,  [rsp+8*94]
	mov r10,r9
	xor r10,10003
	mov r9,r10
	mov r10,r9
	mov qword [rsp+8*52],r8
	mov r8,r10
	mov r9,r8
	mov qword [rsp+8*57],r11
	mov r11,r9
	mov qword [rsp+8*12],r10
	mov r10,r11
	mov qword [rsp+8*13],r8
	mov qword rdi,r9
	mov r9,13
	mov r8,r9
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*14],r11
	mov r11,  [rsp+8*15]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*18],r9
	mov qword [rsp+8*19],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*42],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*43],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*44],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*45],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*46],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*47],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*48],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*49],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*50],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*51],r11
	mov r11,  [rsp+8*58]
	mov qword [rsp+8*13],r10
	mov r10,r11
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*121],r9
	mov r9,  [rsp+8*109]
	mov r10,r9
	xor r10,10004
	mov r9,r10
	mov r10,r9
	mov qword [rsp+8*52],r8
	mov r8,r10
	mov r9,r8
	mov qword [rsp+8*58],r11
	mov r11,r9
	mov qword [rsp+8*12],r10
	mov r10,r11
	mov qword [rsp+8*13],r8
	mov qword rdi,r9
	mov r9,13
	mov r8,r9
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*14],r11
	mov r11,  [rsp+8*15]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*18],r9
	mov qword [rsp+8*19],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*42],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*43],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*44],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*45],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*46],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*47],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*48],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*49],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*50],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*51],r11
	mov r11,  [rsp+8*59]
	mov qword [rsp+8*13],r10
	mov r10,r11
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*124],r9
	mov r9,  [rsp+8*74]
	mov r10,  [rsp+8*68]
	mov qword [rsp+8*52],r8
	mov r8,r9
	xor r8,r10
	mov qword [rsp+8*59],r11
	mov r11,  [rsp+8*71]
	xor r8,r11
	mov r9,r8
	mov r8,  [rsp+8*65]
	mov r10,r9
	xor r10,r8
	mov r11,  [rsp+8*80]
	xor r10,r11
	mov r8,  [rsp+8*77]
	xor r10,r8
	mov r9,r10
	mov r10,  [rsp+8*55]
	mov r11,r9
	and r11,r10
	mov r9,r11
	mov r11,  [rsp+8*74]
	mov r8,r11
	neg r8
	mov r10,  [rsp+8*68]
	add r8,r10
	mov qword [rsp+8*127],r9
	mov r9,  [rsp+8*71]
	add r8,r9
	mov r11,r8
	mov r8,  [rsp+8*65]
	mov r10,r11
	add r10,r8
	mov r9,  [rsp+8*80]
	sub r10,r9
	mov r8,  [rsp+8*77]
	sub r10,r8
	inc r10 
	mov r11,r10
	mov r10,  [rsp+8*55]
	mov r9,r11
	and r9,r10
	mov r11,r9
	xor rdx, rdx
	mov r9,  [rsp+8*74]
	mov rax, r9
	mov r8,  [rsp+8*9]
	mov rbx, r8
	cdq
	idiv rbx
	mov r10, rdx
	xor rdx, rdx
	mov qword [rsp+8*131],r11
	mov r11,  [rsp+8*68]
	mov rax, r11
	mov rbx, r8
	cdq
	idiv rbx
	mov r9, rdx
	mov r8,r10
	imul r8,r9
	xor rdx, rdx
	mov r9,  [rsp+8*71]
	mov rax, r9
	mov r10,  [rsp+8*9]
	mov rbx, r10
	cdq
	idiv rbx
	mov r11, rdx
	mov r9,r8
	imul r9,r11
	mov r8,r9
	xor rdx, rdx
	mov r9,  [rsp+8*65]
	mov rax, r9
	mov rbx, r10
	cdq
	idiv rbx
	mov r11, rdx
	mov r9,r8
	imul r9,r11
	xor rdx, rdx
	mov r11,  [rsp+8*80]
	mov rax, r11
	mov rbx, r10
	cdq
	idiv rbx
	mov qword [rsp+8*139],r8
	mov r8, rdx
	mov r10,r9
	imul r10,r8
	xor rdx, rdx
	mov r8,  [rsp+8*77]
	mov rax, r8
	mov r9,  [rsp+8*9]
	mov rbx, r9
	cdq
	idiv rbx
	mov r11, rdx
	mov r8,r10
	imul r8,r11
	mov r10,r8
	mov r8,  [rsp+8*55]
	mov r11,r10
	and r11,r8
	mov r10,r11
	mov r11,  [rsp+8*65]
	mov r9,  [rsp+8*68]
	mov r8,r11
	xor r8,r9
	mov qword [rsp+8*139],r10
	mov r10,  [rsp+8*71]
	xor r8,r10
	mov r9,  [rsp+8*74]
	mov r11,  [rsp+8*77]
	mov qword [rsp+8*147],r8
	mov r8,r9
	xor r8,r11
	mov r10,  [rsp+8*80]
	xor r8,r10
	mov r9,  [rsp+8*147]
	cmp r9,r8
	mov r9, 0
	setle r9B
	mov r8,  [rsp+8*104]
	add r8,r8
	cmp r9, 0
	mov qword [rsp+8*104],r8
	mov qword [rsp+8*147],r9
	je L_16
	mov r8,  [rsp+8*71]
	mov r9,  [rsp+8*68]
	mov r10,r8
	add r10,r9
	mov r11,  [rsp+8*55]
	and r10,r11
	xor rdx, rdx
	mov rax, r10
	mov r8,  [rsp+8*9]
	mov rbx, r8
	cdq
	idiv rbx
	mov r9, rdx
	xor rdx, rdx
	mov r10,  [rsp+8*65]
	mov rax, r10
	mov rbx, r8
	cdq
	idiv rbx
	mov r11, rdx
	inc r11 
	xor rdx, rdx
	mov rax, r9
	mov rbx, r11
	cdq
	idiv rbx
	mov r8, rdx
	mov r9,r8
	mov qword [rsp+8*152],r8
	mov qword [rsp+8*153],r9
	mov qword [rsp+8*151],r11
	jmp L_17
	
L_16:
	mov r8,  [rsp+8*65]
	mov r9,  [rsp+8*68]
	mov r10,r8
	add r10,r9
	mov r11,  [rsp+8*55]
	and r10,r11
	xor rdx, rdx
	mov rax, r10
	mov r8,  [rsp+8*9]
	mov rbx, r8
	cdq
	idiv rbx
	mov r9, rdx
	xor rdx, rdx
	mov r10,  [rsp+8*71]
	mov rax, r10
	mov rbx, r8
	cdq
	idiv rbx
	mov r11, rdx
	inc r11 
	xor rdx, rdx
	mov rax, r9
	mov rbx, r11
	cdq
	idiv rbx
	mov r8, rdx
	mov r9,r8
	mov qword [rsp+8*157],r8
	mov qword [rsp+8*153],r9
	mov qword [rsp+8*156],r11
	
L_17:
	mov r8,  [rsp+8*127]
	mov r9,r8
	xor r9,10001
	mov r10,r9
	mov r11,r10
	mov r8,r11
	mov r10,r8
	mov r9,r10
	mov qword [rsp+8*12],r11
	mov r11,r9
	mov qword [rsp+8*13],r8
	mov qword rdi,r10
	mov r10,13
	mov r8,r10
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov qword rsi,r8
	mov r8,r9
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*42],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*43],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*44],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*45],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*46],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*47],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*48],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*49],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*50],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*51],r11
	mov r11,  [rsp+8*56]
	mov qword [rsp+8*13],r10
	mov r10,r11
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*159],r9
	mov r9,  [rsp+8*131]
	mov r10,r9
	xor r10,10002
	mov r9,r10
	mov r10,r9
	mov qword [rsp+8*52],r8
	mov r8,r10
	mov r9,r8
	mov qword [rsp+8*56],r11
	mov r11,r9
	mov qword [rsp+8*12],r10
	mov r10,r11
	mov qword [rsp+8*13],r8
	mov qword rdi,r9
	mov r9,13
	mov r8,r9
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*14],r11
	mov r11,  [rsp+8*15]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*18],r9
	mov qword [rsp+8*19],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*42],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*43],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*44],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*45],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*46],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*47],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*48],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*49],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*50],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*51],r11
	mov r11,  [rsp+8*57]
	mov qword [rsp+8*13],r10
	mov r10,r11
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*162],r9
	mov r9,  [rsp+8*139]
	mov r10,r9
	xor r10,10003
	mov r9,r10
	mov r10,r9
	mov qword [rsp+8*52],r8
	mov r8,r10
	mov r9,r8
	mov qword [rsp+8*57],r11
	mov r11,r9
	mov qword [rsp+8*12],r10
	mov r10,r11
	mov qword [rsp+8*13],r8
	mov qword rdi,r9
	mov r9,13
	mov r8,r9
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*14],r11
	mov r11,  [rsp+8*15]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*18],r9
	mov qword [rsp+8*19],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*42],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*43],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*44],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*45],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*46],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*47],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*48],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*49],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*50],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*51],r11
	mov r11,  [rsp+8*58]
	mov qword [rsp+8*13],r10
	mov r10,r11
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*165],r9
	mov r9,  [rsp+8*153]
	mov r10,r9
	xor r10,10004
	mov r9,r10
	mov r10,r9
	mov qword [rsp+8*52],r8
	mov r8,r10
	mov r9,r8
	mov qword [rsp+8*58],r11
	mov r11,r9
	mov qword [rsp+8*12],r10
	mov r10,r11
	mov qword [rsp+8*13],r8
	mov qword rdi,r9
	mov r9,13
	mov r8,r9
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*14],r11
	mov r11,  [rsp+8*15]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*18],r9
	mov qword [rsp+8*19],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*42],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*43],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*44],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*45],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*46],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*47],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*48],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*49],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*50],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*51],r11
	mov r11,  [rsp+8*59]
	mov qword [rsp+8*13],r10
	mov r10,r11
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*168],r9
	mov r9,  [rsp+8*74]
	mov r10,  [rsp+8*65]
	mov qword [rsp+8*52],r8
	mov r8,r9
	xor r8,r10
	mov qword [rsp+8*59],r11
	mov r11,  [rsp+8*71]
	xor r8,r11
	mov r9,r8
	mov r8,  [rsp+8*68]
	mov r10,r9
	xor r10,r8
	mov r11,  [rsp+8*80]
	xor r10,r11
	mov r8,  [rsp+8*77]
	xor r10,r8
	mov r9,r10
	mov r10,  [rsp+8*55]
	mov r11,r9
	and r11,r10
	mov r9,r11
	mov r11,  [rsp+8*74]
	mov r8,  [rsp+8*68]
	mov r10,r11
	sub r10,r8
	mov qword [rsp+8*171],r9
	mov r9,  [rsp+8*71]
	mov r8,r9
	neg r8
	add r10,r8
	mov r8,r10
	mov r10,  [rsp+8*65]
	mov r11,r8
	sub r11,r10
	mov r9,  [rsp+8*80]
	add r11,r9
	mov qword [rsp+8*176],r8
	mov r8,  [rsp+8*77]
	add r11,r8
	mov r10,1
	sub r11,r10
	mov r10,r11
	mov r11,r10
	neg r11
	mov r9,  [rsp+8*55]
	and r11,r9
	mov r10,r11
	xor rdx, rdx
	mov r11,  [rsp+8*74]
	mov rax, r11
	mov r8,  [rsp+8*9]
	mov rbx, r8
	cdq
	idiv rbx
	mov r9, rdx
	xor rdx, rdx
	mov qword [rsp+8*176],r10
	mov r10,  [rsp+8*77]
	mov rax, r10
	mov rbx, r8
	cdq
	idiv rbx
	mov qword [rsp+8*179],r9
	mov r9, rdx
	mov r11,  [rsp+8*179]
	mov r8,r11
	imul r8,r9
	xor rdx, rdx
	mov r9,  [rsp+8*80]
	mov rax, r9
	mov r11,  [rsp+8*9]
	mov rbx, r11
	cdq
	idiv rbx
	mov r10, rdx
	mov r9,r8
	imul r9,r10
	mov r8,r9
	xor rdx, rdx
	mov r9,  [rsp+8*65]
	mov rax, r9
	mov rbx, r11
	cdq
	idiv rbx
	mov r10, rdx
	mov r9,r8
	imul r9,r10
	xor rdx, rdx
	mov r10,  [rsp+8*68]
	mov rax, r10
	mov rbx, r11
	cdq
	idiv rbx
	mov qword [rsp+8*184],r8
	mov r8, rdx
	mov r10,r9
	imul r10,r8
	xor rdx, rdx
	mov r8,  [rsp+8*71]
	mov rax, r8
	mov rbx, r11
	cdq
	idiv rbx
	mov r9, rdx
	mov r8,r10
	imul r8,r9
	mov r9,r8
	mov r8,  [rsp+8*55]
	mov r10,r9
	and r10,r8
	mov r9,r10
	mov r10,  [rsp+8*74]
	mov r11,  [rsp+8*77]
	mov r8,r10
	xor r8,r11
	mov r10,  [rsp+8*80]
	xor r8,r10
	mov r10,  [rsp+8*71]
	mov r11,  [rsp+8*68]
	mov qword [rsp+8*184],r9
	mov r9,r10
	xor r9,r11
	mov qword [rsp+8*192],r8
	mov r8,  [rsp+8*65]
	xor r9,r8
	mov r10,  [rsp+8*192]
	cmp r10,r9
	mov r10, 0
	setl r10B
	mov r9,  [rsp+8*104]
	add r9,r9
	cmp r10, 0
	mov qword [rsp+8*104],r9
	mov qword [rsp+8*192],r10
	je L_18
	mov r8,  [rsp+8*65]
	mov r9,  [rsp+8*68]
	mov r10,r8
	add r10,r9
	mov r11,  [rsp+8*55]
	and r10,r11
	xor rdx, rdx
	mov rax, r10
	mov r8,  [rsp+8*9]
	mov rbx, r8
	cdq
	idiv rbx
	mov r9, rdx
	xor rdx, rdx
	mov r10,  [rsp+8*71]
	mov rax, r10
	mov rbx, r8
	cdq
	idiv rbx
	mov r11, rdx
	inc r11 
	xor rdx, rdx
	mov rax, r9
	mov rbx, r11
	cdq
	idiv rbx
	mov r8, rdx
	mov r9,r8
	mov qword [rsp+8*197],r8
	mov qword [rsp+8*198],r9
	mov qword [rsp+8*196],r11
	jmp L_19
	
L_18:
	mov r8,  [rsp+8*71]
	mov r9,  [rsp+8*68]
	mov r10,r8
	add r10,r9
	mov r11,  [rsp+8*55]
	and r10,r11
	xor rdx, rdx
	mov rax, r10
	mov r8,  [rsp+8*9]
	mov rbx, r8
	cdq
	idiv rbx
	mov r9, rdx
	xor rdx, rdx
	mov r10,  [rsp+8*65]
	mov rax, r10
	mov rbx, r8
	cdq
	idiv rbx
	mov r11, rdx
	inc r11 
	xor rdx, rdx
	mov rax, r9
	mov rbx, r11
	cdq
	idiv rbx
	mov r8, rdx
	mov r9,r8
	mov qword [rsp+8*202],r8
	mov qword [rsp+8*198],r9
	mov qword [rsp+8*201],r11
	
L_19:
	mov r8,  [rsp+8*171]
	mov r9,r8
	xor r9,10001
	mov r10,r9
	mov r11,r10
	mov r8,r11
	mov r10,r8
	mov r9,r10
	mov qword [rsp+8*12],r11
	mov r11,r9
	mov qword [rsp+8*13],r8
	mov qword rdi,r10
	mov r10,13
	mov r8,r10
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov qword rsi,r8
	mov r8,r9
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*42],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*43],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*44],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*45],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*46],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*47],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*48],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*49],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*50],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*51],r11
	mov r11,  [rsp+8*56]
	mov qword [rsp+8*13],r10
	mov r10,r11
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*204],r9
	mov r9,  [rsp+8*176]
	mov r10,r9
	xor r10,10002
	mov r9,r10
	mov r10,r9
	mov qword [rsp+8*52],r8
	mov r8,r10
	mov r9,r8
	mov qword [rsp+8*56],r11
	mov r11,r9
	mov qword [rsp+8*12],r10
	mov r10,r11
	mov qword [rsp+8*13],r8
	mov qword rdi,r9
	mov r9,13
	mov r8,r9
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*14],r11
	mov r11,  [rsp+8*15]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*18],r9
	mov qword [rsp+8*19],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*42],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*43],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*44],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*45],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*46],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*47],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*48],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*49],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*50],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*51],r11
	mov r11,  [rsp+8*57]
	mov qword [rsp+8*13],r10
	mov r10,r11
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*207],r9
	mov r9,  [rsp+8*184]
	mov r10,r9
	xor r10,10003
	mov r9,r10
	mov r10,r9
	mov qword [rsp+8*52],r8
	mov r8,r10
	mov r9,r8
	mov qword [rsp+8*57],r11
	mov r11,r9
	mov qword [rsp+8*12],r10
	mov r10,r11
	mov qword [rsp+8*13],r8
	mov qword rdi,r9
	mov r9,13
	mov r8,r9
	mov qword [rsp+8*15],r10
	mov qword [rsp+8*14],r11
	mov r11,  [rsp+8*15]
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*18],r9
	mov qword [rsp+8*19],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*42],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*43],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*44],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*45],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*46],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*47],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*48],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*49],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*50],r11
	mov r11,r9
	mov qword [rsp+8*13],r10
	mov qword rdi,r8
	mov r8,13
	mov r10,r8
	mov qword [rsp+8*14],r9
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r10
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*51],r11
	mov r11,  [rsp+8*58]
	mov qword [rsp+8*13],r10
	mov r10,r11
	add r10,r9
	mov r11,r10
	mov qword [rsp+8*210],r9
	mov r9,  [rsp+8*198]
	mov r10,r9
	xor r10,10004
	mov r9,r10
	mov r10,r9
	mov qword [rsp+8*52],r8
	mov r8,r10
	mov r9,r8
	mov qword [rsp+8*12],r10
	mov r10,r9
	mov qword [rsp+8*58],r11
	mov r11,r10
	mov qword [rsp+8*13],r8
	mov qword rdi,r9
	mov r9,13
	mov r8,r9
	mov qword [rsp+8*14],r10
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*15],r11
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,r9
	shl r10,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*18],r9
	mov qword [rsp+8*19],r10
	mov r10,65535
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,  [rsp+8*19]
	and r11,r8
	mov qword [rsp+8*22],r9
	mov r9,r11
	mov qword [rsp+8*23],r10
	mov r10,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*25],r9
	mov qword [rsp+8*26],r10
	mov r10,17
	mov r9,r10
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r11
	mov r11,  [rsp+8*15]
	mov r8,r11
	mov qword rsi,r9
	mov r9,r8
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r8
	mov r8,65535
	mov r11,r8
	mov qword [rsp+8*28],r9
	mov qword [rsp+8*29],r10
	mov r10,32767
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r11
	mov r10,r9
	mov qword [rsp+8*20],r8
	mov r8,r10
	mov qword [rsp+8*21],r11
	mov r11,r8
	mov qword [rsp+8*22],r9
	mov r9,  [rsp+8*29]
	mov qword [rsp+8*23],r10
	mov r10,r11
	mov rcx,r9
	shr r10,cl
	mov rcx,1
	shl r10,cl
	inc r10 
	mov r11,r10
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*32],r10
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	and r10,r11
	mov r11,r10
	mov r9,65535
	mov r8,r9
	mov qword [rsp+8*33],r10
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r10,r11
	mov qword rsi,r8
	mov r8,r10
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r8
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*35],r10
	mov r10,r9
	xor r10,r8
	mov r9,r10
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*15],r9
	mov qword [rsp+8*38],r10
	mov r10,  [rsp+8*15]
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*42],r11
	mov r11,r10
	mov qword [rsp+8*15],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*13],r10
	mov qword rdi,r11
	mov r11,13
	mov r10,r11
	mov qword [rsp+8*14],r8
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov qword [rsp+8*15],r9
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov qword [rsp+8*19],r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*19]
	and r9,r8
	mov qword [rsp+8*22],r10
	mov r10,r9
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r9
	mov r9,r8
	xor r9,r11
	mov r8,r9
	mov qword [rsp+8*25],r10
	mov qword [rsp+8*26],r11
	mov r11,17
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r9
	mov r9,  [rsp+8*15]
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*28],r10
	mov qword [rsp+8*29],r11
	mov r11,32767
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,r8
	mov qword [rsp+8*22],r10
	mov r10,  [rsp+8*29]
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov rcx,r10
	shr r11,cl
	mov rcx,1
	shl r11,cl
	inc r11 
	mov r9,r11
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*31],r9
	mov r9,r8
	mov rcx,r10
	shr r9,cl
	mov qword [rsp+8*32],r11
	mov r11,  [rsp+8*31]
	and r9,r11
	mov r11,r9
	mov r10,65535
	mov r8,r10
	mov qword [rsp+8*33],r9
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r9,r11
	mov qword rsi,r8
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*31]
	mov qword [rsp+8*22],r9
	mov r9,r10
	and r9,r8
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r10,  [rsp+8*15]
	mov qword [rsp+8*35],r9
	mov r9,r10
	xor r9,r8
	mov r10,r9
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*38],r9
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov qword [rsp+8*15],r10
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*43],r11
	mov r11,r10
	mov qword [rsp+8*15],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*13],r10
	mov qword rdi,r11
	mov r11,13
	mov r10,r11
	mov qword [rsp+8*14],r8
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov qword [rsp+8*15],r9
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov qword [rsp+8*19],r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*19]
	and r9,r8
	mov qword [rsp+8*22],r10
	mov r10,r9
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r9
	mov r9,r8
	xor r9,r11
	mov r8,r9
	mov qword [rsp+8*25],r10
	mov qword [rsp+8*26],r11
	mov r11,17
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r9
	mov r9,  [rsp+8*15]
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*28],r10
	mov qword [rsp+8*29],r11
	mov r11,32767
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,r8
	mov qword [rsp+8*22],r10
	mov r10,  [rsp+8*29]
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov rcx,r10
	shr r11,cl
	mov rcx,1
	shl r11,cl
	inc r11 
	mov r9,r11
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*31],r9
	mov r9,r8
	mov rcx,r10
	shr r9,cl
	mov qword [rsp+8*32],r11
	mov r11,  [rsp+8*31]
	and r9,r11
	mov r11,r9
	mov r10,65535
	mov r8,r10
	mov qword [rsp+8*33],r9
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r9,r11
	mov qword rsi,r8
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*31]
	mov qword [rsp+8*22],r9
	mov r9,r10
	and r9,r8
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r10,  [rsp+8*15]
	mov qword [rsp+8*35],r9
	mov r9,r10
	xor r9,r8
	mov r10,r9
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*38],r9
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov qword [rsp+8*15],r10
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*44],r11
	mov r11,r10
	mov qword [rsp+8*15],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*13],r10
	mov qword rdi,r11
	mov r11,13
	mov r10,r11
	mov qword [rsp+8*14],r8
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov qword [rsp+8*15],r9
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov qword [rsp+8*19],r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*19]
	and r9,r8
	mov qword [rsp+8*22],r10
	mov r10,r9
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r9
	mov r9,r8
	xor r9,r11
	mov r8,r9
	mov qword [rsp+8*25],r10
	mov qword [rsp+8*26],r11
	mov r11,17
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r9
	mov r9,  [rsp+8*15]
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*28],r10
	mov qword [rsp+8*29],r11
	mov r11,32767
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,r8
	mov qword [rsp+8*22],r10
	mov r10,  [rsp+8*29]
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov rcx,r10
	shr r11,cl
	mov rcx,1
	shl r11,cl
	inc r11 
	mov r9,r11
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*31],r9
	mov r9,r8
	mov rcx,r10
	shr r9,cl
	mov qword [rsp+8*32],r11
	mov r11,  [rsp+8*31]
	and r9,r11
	mov r11,r9
	mov r10,65535
	mov r8,r10
	mov qword [rsp+8*33],r9
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r9,r11
	mov qword rsi,r8
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*31]
	mov qword [rsp+8*22],r9
	mov r9,r10
	and r9,r8
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r10,  [rsp+8*15]
	mov qword [rsp+8*35],r9
	mov r9,r10
	xor r9,r8
	mov r10,r9
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*38],r9
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov qword [rsp+8*15],r10
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*45],r11
	mov r11,r10
	mov qword [rsp+8*15],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*13],r10
	mov qword rdi,r11
	mov r11,13
	mov r10,r11
	mov qword [rsp+8*14],r8
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov qword [rsp+8*15],r9
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov qword [rsp+8*19],r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*19]
	and r9,r8
	mov qword [rsp+8*22],r10
	mov r10,r9
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r9
	mov r9,r8
	xor r9,r11
	mov r8,r9
	mov qword [rsp+8*25],r10
	mov qword [rsp+8*26],r11
	mov r11,17
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r9
	mov r9,  [rsp+8*15]
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*28],r10
	mov qword [rsp+8*29],r11
	mov r11,32767
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,r8
	mov qword [rsp+8*22],r10
	mov r10,  [rsp+8*29]
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov rcx,r10
	shr r11,cl
	mov rcx,1
	shl r11,cl
	inc r11 
	mov r9,r11
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*31],r9
	mov r9,r8
	mov rcx,r10
	shr r9,cl
	mov qword [rsp+8*32],r11
	mov r11,  [rsp+8*31]
	and r9,r11
	mov r11,r9
	mov r10,65535
	mov r8,r10
	mov qword [rsp+8*33],r9
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r9,r11
	mov qword rsi,r8
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*31]
	mov qword [rsp+8*22],r9
	mov r9,r10
	and r9,r8
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r10,  [rsp+8*15]
	mov qword [rsp+8*35],r9
	mov r9,r10
	xor r9,r8
	mov r10,r9
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*38],r9
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov qword [rsp+8*15],r10
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*46],r11
	mov r11,r10
	mov qword [rsp+8*15],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*13],r10
	mov qword rdi,r11
	mov r11,13
	mov r10,r11
	mov qword [rsp+8*14],r8
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov qword [rsp+8*15],r9
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov qword [rsp+8*19],r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*19]
	and r9,r8
	mov qword [rsp+8*22],r10
	mov r10,r9
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r9
	mov r9,r8
	xor r9,r11
	mov r8,r9
	mov qword [rsp+8*25],r10
	mov qword [rsp+8*26],r11
	mov r11,17
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r9
	mov r9,  [rsp+8*15]
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*28],r10
	mov qword [rsp+8*29],r11
	mov r11,32767
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,r8
	mov qword [rsp+8*22],r10
	mov r10,  [rsp+8*29]
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov rcx,r10
	shr r11,cl
	mov rcx,1
	shl r11,cl
	inc r11 
	mov r9,r11
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*31],r9
	mov r9,r8
	mov rcx,r10
	shr r9,cl
	mov qword [rsp+8*32],r11
	mov r11,  [rsp+8*31]
	and r9,r11
	mov r11,r9
	mov r10,65535
	mov r8,r10
	mov qword [rsp+8*33],r9
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r9,r11
	mov qword rsi,r8
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*31]
	mov qword [rsp+8*22],r9
	mov r9,r10
	and r9,r8
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r10,  [rsp+8*15]
	mov qword [rsp+8*35],r9
	mov r9,r10
	xor r9,r8
	mov r10,r9
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*38],r9
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov qword [rsp+8*15],r10
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*47],r11
	mov r11,r10
	mov qword [rsp+8*15],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*13],r10
	mov qword rdi,r11
	mov r11,13
	mov r10,r11
	mov qword [rsp+8*14],r8
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov qword [rsp+8*15],r9
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov qword [rsp+8*19],r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*19]
	and r9,r8
	mov qword [rsp+8*22],r10
	mov r10,r9
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r9
	mov r9,r8
	xor r9,r11
	mov r8,r9
	mov qword [rsp+8*25],r10
	mov qword [rsp+8*26],r11
	mov r11,17
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r9
	mov r9,  [rsp+8*15]
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*28],r10
	mov qword [rsp+8*29],r11
	mov r11,32767
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,r8
	mov qword [rsp+8*22],r10
	mov r10,  [rsp+8*29]
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov rcx,r10
	shr r11,cl
	mov rcx,1
	shl r11,cl
	inc r11 
	mov r9,r11
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*31],r9
	mov r9,r8
	mov rcx,r10
	shr r9,cl
	mov qword [rsp+8*32],r11
	mov r11,  [rsp+8*31]
	and r9,r11
	mov r11,r9
	mov r10,65535
	mov r8,r10
	mov qword [rsp+8*33],r9
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r9,r11
	mov qword rsi,r8
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*31]
	mov qword [rsp+8*22],r9
	mov r9,r10
	and r9,r8
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r10,  [rsp+8*15]
	mov qword [rsp+8*35],r9
	mov r9,r10
	xor r9,r8
	mov r10,r9
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*38],r9
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov qword [rsp+8*15],r10
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*48],r11
	mov r11,r10
	mov qword [rsp+8*15],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*13],r10
	mov qword rdi,r11
	mov r11,13
	mov r10,r11
	mov qword [rsp+8*14],r8
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov qword [rsp+8*15],r9
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov qword [rsp+8*19],r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*19]
	and r9,r8
	mov qword [rsp+8*22],r10
	mov r10,r9
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r9
	mov r9,r8
	xor r9,r11
	mov r8,r9
	mov qword [rsp+8*25],r10
	mov qword [rsp+8*26],r11
	mov r11,17
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r9
	mov r9,  [rsp+8*15]
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*28],r10
	mov qword [rsp+8*29],r11
	mov r11,32767
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,r8
	mov qword [rsp+8*22],r10
	mov r10,  [rsp+8*29]
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov rcx,r10
	shr r11,cl
	mov rcx,1
	shl r11,cl
	inc r11 
	mov r9,r11
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*31],r9
	mov r9,r8
	mov rcx,r10
	shr r9,cl
	mov qword [rsp+8*32],r11
	mov r11,  [rsp+8*31]
	and r9,r11
	mov r11,r9
	mov r10,65535
	mov r8,r10
	mov qword [rsp+8*33],r9
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r9,r11
	mov qword rsi,r8
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*31]
	mov qword [rsp+8*22],r9
	mov r9,r10
	and r9,r8
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r10,  [rsp+8*15]
	mov qword [rsp+8*35],r9
	mov r9,r10
	xor r9,r8
	mov r10,r9
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*38],r9
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov qword [rsp+8*15],r10
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*49],r11
	mov r11,r10
	mov qword [rsp+8*15],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*13],r10
	mov qword rdi,r11
	mov r11,13
	mov r10,r11
	mov qword [rsp+8*14],r8
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov qword [rsp+8*15],r9
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,r10
	mov rcx,r11
	shl r8,cl
	mov qword [rsp+8*19],r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*19]
	and r9,r8
	mov qword [rsp+8*22],r10
	mov r10,r9
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r9
	mov r9,r8
	xor r9,r11
	mov r8,r9
	mov qword [rsp+8*25],r10
	mov qword [rsp+8*26],r11
	mov r11,17
	mov r10,r11
	mov qword [rsp+8*15],r8
	mov qword [rsp+8*27],r9
	mov r9,  [rsp+8*15]
	mov r8,r9
	mov qword rsi,r10
	mov r10,r8
	mov r9,  rsi
	mov r11,r9
	mov qword rdi,r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*28],r10
	mov qword [rsp+8*29],r11
	mov r11,32767
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,r8
	mov qword [rsp+8*22],r10
	mov r10,  [rsp+8*29]
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov rcx,r10
	shr r11,cl
	mov rcx,1
	shl r11,cl
	inc r11 
	mov r9,r11
	mov qword [rsp+8*30],r8
	mov r8,  [rsp+8*28]
	mov qword [rsp+8*31],r9
	mov r9,r8
	mov rcx,r10
	shr r9,cl
	mov qword [rsp+8*32],r11
	mov r11,  [rsp+8*31]
	and r9,r11
	mov r11,r9
	mov r10,65535
	mov r8,r10
	mov qword [rsp+8*33],r9
	mov qword [rsp+8*31],r11
	mov r11,65535
	mov r9,r11
	mov qword rsi,r8
	mov r8,r9
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*31]
	mov qword [rsp+8*22],r9
	mov r9,r10
	and r9,r8
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*34],r8
	mov r8,r11
	mov r10,  [rsp+8*15]
	mov qword [rsp+8*35],r9
	mov r9,r10
	xor r9,r8
	mov r10,r9
	mov qword [rsp+8*36],r11
	mov qword [rsp+8*37],r8
	mov r8,5
	mov r11,r8
	mov qword [rsp+8*38],r9
	mov r9,r10
	mov r8,r9
	mov qword rsi,r11
	mov qword [rsp+8*15],r10
	mov r10,  rsi
	mov r11,r10
	mov qword rdi,r9
	mov r9,r8
	mov rcx,r11
	shl r9,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r10,r8
	mov qword [rsp+8*19],r9
	mov qword [rsp+8*18],r11
	mov r11,65535
	mov r9,r11
	mov r8,r9
	mov qword rsi,r10
	mov r11,  rsi
	mov r10,r11
	mov qword rdi,r9
	mov r9,r8
	mov rcx,16
	shl r9,cl
	or r9,r10
	mov r11,r9
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*22],r9
	mov r9,r10
	mov qword [rsp+8*23],r11
	mov r11,r9
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r10
	mov r10,r8
	xor r10,r11
	mov r8,r10
	mov qword [rsp+8*25],r9
	mov r9,r8
	mov qword [rsp+8*39],r11
	mov r11,r9
	mov qword [rsp+8*40],r10
	mov r10,r11
	mov qword [rsp+8*50],r11
	mov r11,r10
	mov qword [rsp+8*15],r8
	mov r8,r11
	mov qword [rsp+8*41],r9
	mov r9,r8
	mov qword [rsp+8*14],r8
	mov qword [rsp+8*13],r10
	mov r10,13
	mov r8,r10
	mov r11,r9
	mov r10,r11
	mov qword rsi,r8
	mov qword [rsp+8*15],r9
	mov r9,  rsi
	mov r8,r9
	mov qword rdi,r11
	mov r11,r10
	mov rcx,r8
	shl r11,cl
	mov qword [rsp+8*18],r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*17],r10
	mov qword [rsp+8*19],r11
	mov r11,65535
	mov r10,r11
	mov r8,r10
	mov qword rsi,r9
	mov r11,  rsi
	mov r9,r11
	mov qword rdi,r10
	mov r10,r8
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov r11,r10
	mov qword [rsp+8*20],r8
	mov r8,r11
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*19]
	and r9,r8
	mov qword [rsp+8*22],r10
	mov r10,r9
	mov qword [rsp+8*23],r11
	mov r11,r10
	mov qword [rsp+8*24],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*19],r9
	mov r9,r8
	xor r9,r11
	mov r8,r9
	mov qword [rsp+8*26],r11
	mov r11,17
	mov r9,r11
	mov r11,r8
	mov qword [rsp+8*25],r10
	mov r10,r11
	mov qword rsi,r9
	mov qword [rsp+8*15],r8
	mov r8,  rsi
	mov r9,r8
	mov qword [rsp+8*28],r10
	mov r10,65535
	mov r8,r10
	mov r10,32767
	mov r11,r10
	mov r10,r11
	mov qword [rsp+8*29],r9
	mov r9,r8
	mov qword rdi,r11
	mov r11,r10
	mov rcx,16
	shl r11,cl
	or r11,r9
	mov qword rsi,r8
	mov r8,r11
	mov qword [rsp+8*20],r10
	mov r10,r8
	mov qword [rsp+8*21],r9
	mov r9,r10
	mov qword [rsp+8*30],r10
	mov r10,  [rsp+8*29]
	mov qword [rsp+8*22],r11
	mov r11,r9
	mov rcx,r10
	shr r11,cl
	mov rcx,1
	shl r11,cl
	inc r11 
	mov r9,r11
	mov r11,  [rsp+8*28]
	mov qword [rsp+8*23],r8
	mov r8,r11
	mov rcx,r10
	shr r8,cl
	and r8,r9
	mov r9,r8
	mov r10,65535
	mov r8,r10
	mov r11,65535
	mov r10,r11
	mov r11,r10
	mov qword [rsp+8*31],r9
	mov r9,r8
	mov qword rdi,r10
	mov r10,r11
	mov rcx,16
	shl r10,cl
	or r10,r9
	mov qword rsi,r8
	mov r8,r10
	mov qword [rsp+8*20],r11
	mov r11,r8
	mov qword [rsp+8*21],r9
	mov r9,  [rsp+8*31]
	mov qword [rsp+8*22],r10
	mov r10,r9
	and r10,r11
	mov r9,r10
	mov r10,r9
	mov qword [rsp+8*36],r9
	mov r9,  [rsp+8*15]
	mov qword [rsp+8*34],r11
	mov r11,r9
	xor r11,r10
	mov r9,r11
	mov qword [rsp+8*37],r10
	mov r11,5
	mov r10,r11
	mov r11,r9
	mov qword [rsp+8*23],r8
	mov r8,r11
	mov qword rsi,r10
	mov qword [rsp+8*15],r9
	mov r9,  rsi
	mov r10,r9
	mov qword rdi,r11
	mov r11,r8
	mov rcx,r10
	shl r11,cl
	mov qword [rsp+8*17],r8
	mov r8,65535
	mov r9,r8
	mov qword [rsp+8*18],r10
	mov r10,65535
	mov r8,r10
	mov r10,r8
	mov qword [rsp+8*19],r11
	mov r11,r9
	mov qword rdi,r8
	mov r8,r10
	mov rcx,16
	shl r8,cl
	or r8,r11
	mov qword [rsp+8*20],r10
	mov r10,r8
	mov r8,r10
	mov qword [rsp+8*23],r10
	mov r10,  [rsp+8*19]
	and r10,r8
	mov qword [rsp+8*24],r8
	mov r8,r10
	mov r10,r8
	mov qword [rsp+8*25],r8
	mov r8,  [rsp+8*15]
	mov qword [rsp+8*21],r11
	mov r11,r8
	xor r11,r10
	mov r8,r11
	mov qword [rsp+8*39],r10
	mov r10,r8
	mov qword [rsp+8*15],r8
	mov r8,r10
	mov qword [rsp+8*41],r10
	mov r10,r8
	mov qword [rsp+8*51],r8
	mov r8,r10
	mov qword [rsp+8*13],r10
	mov r10,r8
	mov qword [rsp+8*52],r8
	mov r8,  [rsp+8*59]
	mov r11,r8
	add r11,r10
	mov r8,r11
	mov qword [rsp+8*213],r10
	mov r11,  [rsp+8*61]
	mov r10,r11
	inc r11 
	mov qword [rsp+8*59],r8
	mov qword rsi,r9
	mov qword [rsp+8*215],r10
	mov qword [rsp+8*61],r11
	jmp L_11
	
L_12:
	mov r9,  [rsp+8*56]
	mov r8,r9
	mov r10,r8
	mov r9,t139
	mov r11,r9
	mov qword rdi,r8
	mov qword [rsp+8*216],r10
	mov r10,28
	mov r8,r10
	mov qword [rsp+8*218],r8
	mov qword [rsp+8*217],r11
	
L_89:
	mov r8,  [rsp+8*218]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*219],r10
	je L_90
	mov r8,  [rsp+8*216]
	mov r9,  [rsp+8*218]
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	mov r11,15
	and r10,r11
	mov r8,r10
	mov r9,10
	cmp r8,r9
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*221],r8
	mov qword [rsp+8*220],r10
	mov qword [rsp+8*222],r11
	je L_91
	mov r8,48
	mov r9,  [rsp+8*221]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r8,r11
	mov r9,32
	cmp r8,r9
	mov qword [rsp+8*223],r10
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*224],r8
	mov qword [rsp+8*225],r10
	mov qword rdi,r11
	jne L_92
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*225],r8
	jmp L_93
	
L_92:
	mov r8,  [rsp+8*224]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*226],r10
	mov qword [rsp+8*225],r11
	
L_93:
	mov r8,  [rsp+8*225]
	cmp r8, 0
	je L_94
	mov r9,  [gbl+8*227]
	mov r8,r9
	mov r10,  [rsp+8*224]
	mov r11,32
	mov qword [rsp+8*228],r8
	mov r8,r10
	sub r8,r11
	mov r9,32
	mov qword [rsp+8*229],r8
	mov r8,r10
	sub r8,r9
	mov r11,r8
	mov r10,  [rsp+8*229]
	mov r9,r10
	mov qword [rsp+8*230],r8
	mov qword rsi,r11
	mov r11,  [rsp+8*228]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	call    substring
	mov [rsp+8*232], rax
	mov r9,  [rsp+8*232]
	mov r8,r9
	mov qword [rsp+8*233],r8
	jmp L_96
	
L_94:
	mov r9,t137
	mov r8,r9
	mov qword [rsp+8*233],r8
	
L_96:
	mov r9,  [rsp+8*233]
	mov r8,r9
	mov qword [rsp+8*234],r8
	mov     rsi, [rsp+8*234]
	mov     rdi, [rsp+8*217]
	call    concat
	mov [rsp+8*235], rax
	mov r9,  [rsp+8*235]
	mov r8,r9
	mov qword [rsp+8*217],r8
	jmp L_97
	
L_91:
	mov r8,65
	mov r9,  [rsp+8*221]
	mov r10,r8
	add r10,r9
	mov r11,10
	sub r10,r11
	mov r8,r10
	mov r9,r8
	mov r11,32
	cmp r9,r11
	mov qword [rsp+8*236],r10
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword rdi,r8
	mov qword [rsp+8*224],r9
	mov qword [rsp+8*225],r10
	jne L_98
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*225],r8
	jmp L_99
	
L_98:
	mov r8,  [rsp+8*224]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*226],r10
	mov qword [rsp+8*225],r11
	
L_99:
	mov r8,  [rsp+8*225]
	cmp r8, 0
	je L_100
	mov r9,  [gbl+8*227]
	mov r8,r9
	mov r10,  [rsp+8*224]
	mov r11,32
	mov qword [rsp+8*228],r8
	mov r8,r10
	sub r8,r11
	mov r9,32
	mov qword [rsp+8*229],r8
	mov r8,r10
	sub r8,r9
	mov r11,r8
	mov r10,  [rsp+8*229]
	mov r9,r10
	mov qword [rsp+8*230],r8
	mov qword rsi,r11
	mov r11,  [rsp+8*228]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	call    substring
	mov [rsp+8*232], rax
	mov r9,  [rsp+8*232]
	mov r8,r9
	mov qword [rsp+8*233],r8
	jmp L_102
	
L_100:
	mov r9,t137
	mov r8,r9
	mov qword [rsp+8*233],r8
	
L_102:
	mov r9,  [rsp+8*233]
	mov r8,r9
	mov qword [rsp+8*237],r8
	mov     rsi, [rsp+8*237]
	mov     rdi, [rsp+8*217]
	call    concat
	mov [rsp+8*238], rax
	mov r9,  [rsp+8*238]
	mov r8,r9
	mov qword [rsp+8*217],r8
	
L_97:
	mov r8,  [rsp+8*218]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*218],r8
	mov qword [rsp+8*239],r10
	jmp L_89
	
L_90:
	mov r9,  [rsp+8*217]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*240],r8
	mov qword [rsp+8*241],r10
	mov     rsi, t373
	mov     rdi, [rsp+8*241]
	call    concat
	mov [rsp+8*242], rax
	mov r9,  [rsp+8*242]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*243],r10
	mov rdi, format
	mov rsi,[rsp+8*243] 
	inc rsi
	xor rax, rax
	call printf
	mov r9,  [rsp+8*57]
	mov r8,r9
	mov r10,r8
	mov r9,t139
	mov r11,r9
	mov qword rdi,r8
	mov qword [rsp+8*216],r10
	mov r10,28
	mov r8,r10
	mov qword [rsp+8*218],r8
	mov qword [rsp+8*217],r11
	
L_106:
	mov r8,  [rsp+8*218]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*219],r10
	je L_107
	mov r8,  [rsp+8*216]
	mov r9,  [rsp+8*218]
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	mov r11,15
	and r10,r11
	mov r8,r10
	mov r9,10
	cmp r8,r9
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*221],r8
	mov qword [rsp+8*220],r10
	mov qword [rsp+8*222],r11
	je L_108
	mov r8,48
	mov r9,  [rsp+8*221]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r8,r11
	mov r9,32
	cmp r8,r9
	mov qword [rsp+8*223],r10
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*224],r8
	mov qword [rsp+8*225],r10
	mov qword rdi,r11
	jne L_109
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*225],r8
	jmp L_110
	
L_109:
	mov r8,  [rsp+8*224]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*226],r10
	mov qword [rsp+8*225],r11
	
L_110:
	mov r8,  [rsp+8*225]
	cmp r8, 0
	je L_111
	mov r9,  [gbl+8*227]
	mov r8,r9
	mov r10,  [rsp+8*224]
	mov r11,32
	mov qword [rsp+8*228],r8
	mov r8,r10
	sub r8,r11
	mov r9,32
	mov qword [rsp+8*229],r8
	mov r8,r10
	sub r8,r9
	mov r11,r8
	mov r10,  [rsp+8*229]
	mov r9,r10
	mov qword [rsp+8*230],r8
	mov qword rsi,r11
	mov r11,  [rsp+8*228]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	call    substring
	mov [rsp+8*232], rax
	mov r9,  [rsp+8*232]
	mov r8,r9
	mov qword [rsp+8*233],r8
	jmp L_113
	
L_111:
	mov r9,t137
	mov r8,r9
	mov qword [rsp+8*233],r8
	
L_113:
	mov r9,  [rsp+8*233]
	mov r8,r9
	mov qword [rsp+8*234],r8
	mov     rsi, [rsp+8*234]
	mov     rdi, [rsp+8*217]
	call    concat
	mov [rsp+8*235], rax
	mov r9,  [rsp+8*235]
	mov r8,r9
	mov qword [rsp+8*217],r8
	jmp L_114
	
L_108:
	mov r8,65
	mov r9,  [rsp+8*221]
	mov r10,r8
	add r10,r9
	mov r11,10
	sub r10,r11
	mov r8,r10
	mov r9,r8
	mov r11,32
	cmp r9,r11
	mov qword [rsp+8*236],r10
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword rdi,r8
	mov qword [rsp+8*224],r9
	mov qword [rsp+8*225],r10
	jne L_115
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*225],r8
	jmp L_116
	
L_115:
	mov r8,  [rsp+8*224]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*226],r10
	mov qword [rsp+8*225],r11
	
L_116:
	mov r8,  [rsp+8*225]
	cmp r8, 0
	je L_117
	mov r9,  [gbl+8*227]
	mov r8,r9
	mov r10,  [rsp+8*224]
	mov r11,32
	mov qword [rsp+8*228],r8
	mov r8,r10
	sub r8,r11
	mov r9,32
	mov qword [rsp+8*229],r8
	mov r8,r10
	sub r8,r9
	mov r11,r8
	mov r10,  [rsp+8*229]
	mov r9,r10
	mov qword [rsp+8*230],r8
	mov qword rsi,r11
	mov r11,  [rsp+8*228]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	call    substring
	mov [rsp+8*232], rax
	mov r9,  [rsp+8*232]
	mov r8,r9
	mov qword [rsp+8*233],r8
	jmp L_119
	
L_117:
	mov r9,t137
	mov r8,r9
	mov qword [rsp+8*233],r8
	
L_119:
	mov r9,  [rsp+8*233]
	mov r8,r9
	mov qword [rsp+8*237],r8
	mov     rsi, [rsp+8*237]
	mov     rdi, [rsp+8*217]
	call    concat
	mov [rsp+8*238], rax
	mov r9,  [rsp+8*238]
	mov r8,r9
	mov qword [rsp+8*217],r8
	
L_114:
	mov r8,  [rsp+8*218]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*218],r8
	mov qword [rsp+8*239],r10
	jmp L_106
	
L_107:
	mov r9,  [rsp+8*217]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*240],r8
	mov qword [rsp+8*244],r10
	mov     rsi, t380
	mov     rdi, [rsp+8*244]
	call    concat
	mov [rsp+8*245], rax
	mov r9,  [rsp+8*245]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*246],r10
	mov rdi, format
	mov rsi,[rsp+8*246] 
	inc rsi
	xor rax, rax
	call printf
	mov r9,  [rsp+8*58]
	mov r8,r9
	mov r10,r8
	mov r9,t139
	mov r11,r9
	mov qword rdi,r8
	mov qword [rsp+8*216],r10
	mov r10,28
	mov r8,r10
	mov qword [rsp+8*218],r8
	mov qword [rsp+8*217],r11
	
L_123:
	mov r8,  [rsp+8*218]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*219],r10
	je L_124
	mov r8,  [rsp+8*216]
	mov r9,  [rsp+8*218]
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	mov r11,15
	and r10,r11
	mov r8,r10
	mov r9,10
	cmp r8,r9
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*221],r8
	mov qword [rsp+8*220],r10
	mov qword [rsp+8*222],r11
	je L_125
	mov r8,48
	mov r9,  [rsp+8*221]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r8,r11
	mov r9,32
	cmp r8,r9
	mov qword [rsp+8*223],r10
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*224],r8
	mov qword [rsp+8*225],r10
	mov qword rdi,r11
	jne L_126
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*225],r8
	jmp L_127
	
L_126:
	mov r8,  [rsp+8*224]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*226],r10
	mov qword [rsp+8*225],r11
	
L_127:
	mov r8,  [rsp+8*225]
	cmp r8, 0
	je L_128
	mov r9,  [gbl+8*227]
	mov r8,r9
	mov r10,  [rsp+8*224]
	mov r11,32
	mov qword [rsp+8*228],r8
	mov r8,r10
	sub r8,r11
	mov r9,32
	mov qword [rsp+8*229],r8
	mov r8,r10
	sub r8,r9
	mov r11,r8
	mov r10,  [rsp+8*229]
	mov r9,r10
	mov qword [rsp+8*230],r8
	mov qword rsi,r11
	mov r11,  [rsp+8*228]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	call    substring
	mov [rsp+8*232], rax
	mov r9,  [rsp+8*232]
	mov r8,r9
	mov qword [rsp+8*233],r8
	jmp L_130
	
L_128:
	mov r9,t137
	mov r8,r9
	mov qword [rsp+8*233],r8
	
L_130:
	mov r9,  [rsp+8*233]
	mov r8,r9
	mov qword [rsp+8*234],r8
	mov     rsi, [rsp+8*234]
	mov     rdi, [rsp+8*217]
	call    concat
	mov [rsp+8*235], rax
	mov r9,  [rsp+8*235]
	mov r8,r9
	mov qword [rsp+8*217],r8
	jmp L_131
	
L_125:
	mov r8,65
	mov r9,  [rsp+8*221]
	mov r10,r8
	add r10,r9
	mov r11,10
	sub r10,r11
	mov r8,r10
	mov r9,r8
	mov r11,32
	cmp r9,r11
	mov qword [rsp+8*236],r10
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword rdi,r8
	mov qword [rsp+8*224],r9
	mov qword [rsp+8*225],r10
	jne L_132
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*225],r8
	jmp L_133
	
L_132:
	mov r8,  [rsp+8*224]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*226],r10
	mov qword [rsp+8*225],r11
	
L_133:
	mov r8,  [rsp+8*225]
	cmp r8, 0
	je L_134
	mov r9,  [gbl+8*227]
	mov r8,r9
	mov r10,  [rsp+8*224]
	mov r11,32
	mov qword [rsp+8*228],r8
	mov r8,r10
	sub r8,r11
	mov r9,32
	mov qword [rsp+8*229],r8
	mov r8,r10
	sub r8,r9
	mov r11,r8
	mov r10,  [rsp+8*229]
	mov r9,r10
	mov qword [rsp+8*230],r8
	mov qword rsi,r11
	mov r11,  [rsp+8*228]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	call    substring
	mov [rsp+8*232], rax
	mov r9,  [rsp+8*232]
	mov r8,r9
	mov qword [rsp+8*233],r8
	jmp L_136
	
L_134:
	mov r9,t137
	mov r8,r9
	mov qword [rsp+8*233],r8
	
L_136:
	mov r9,  [rsp+8*233]
	mov r8,r9
	mov qword [rsp+8*237],r8
	mov     rsi, [rsp+8*237]
	mov     rdi, [rsp+8*217]
	call    concat
	mov [rsp+8*238], rax
	mov r9,  [rsp+8*238]
	mov r8,r9
	mov qword [rsp+8*217],r8
	
L_131:
	mov r8,  [rsp+8*218]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*218],r8
	mov qword [rsp+8*239],r10
	jmp L_123
	
L_124:
	mov r9,  [rsp+8*217]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*240],r8
	mov qword [rsp+8*247],r10
	mov     rsi, t387
	mov     rdi, [rsp+8*247]
	call    concat
	mov [rsp+8*248], rax
	mov r9,  [rsp+8*248]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*249],r10
	mov rdi, format
	mov rsi,[rsp+8*249] 
	inc rsi
	xor rax, rax
	call printf
	mov r9,  [rsp+8*59]
	mov r8,r9
	mov r10,r8
	mov r9,t139
	mov r11,r9
	mov qword rdi,r8
	mov r8,28
	mov r9,r8
	mov qword [rsp+8*218],r9
	mov qword [rsp+8*216],r10
	mov qword [rsp+8*217],r11
	
L_140:
	mov r8,  [rsp+8*218]
	mov r9,0
	cmp r8,r9
	mov r10, 0
	setge r10B
	cmp r10, 0
	mov qword [rsp+8*219],r10
	je L_141
	mov r8,  [rsp+8*216]
	mov r9,  [rsp+8*218]
	mov r10,r8
	mov rcx,r9
	shr r10,cl
	mov r11,15
	and r10,r11
	mov r8,r10
	mov r10,10
	cmp r8,r10
	mov r11, 0
	setl r11B
	cmp r11, 0
	mov qword [rsp+8*221],r8
	mov qword [rsp+8*222],r11
	je L_142
	mov r8,48
	mov r9,  [rsp+8*221]
	mov r10,r8
	add r10,r9
	mov r11,r10
	mov r8,r11
	mov r10,32
	cmp r8,r10
	mov r9, 0
	setge r9B
	cmp r9, 0
	mov qword [rsp+8*224],r8
	mov qword [rsp+8*225],r9
	mov qword rdi,r11
	jne L_143
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*225],r8
	jmp L_144
	
L_143:
	mov r8,  [rsp+8*224]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*226],r10
	mov qword [rsp+8*225],r11
	
L_144:
	mov r8,  [rsp+8*225]
	cmp r8, 0
	je L_145
	mov r9,  [gbl+8*227]
	mov r8,r9
	mov r10,  [rsp+8*224]
	mov r11,32
	mov qword [rsp+8*228],r8
	mov r8,r10
	sub r8,r11
	mov r9,32
	mov qword [rsp+8*229],r8
	mov r8,r10
	sub r8,r9
	mov r11,r8
	mov r10,  [rsp+8*229]
	mov r9,r10
	mov qword [rsp+8*230],r8
	mov qword rsi,r11
	mov r11,  [rsp+8*228]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	call    substring
	mov [rsp+8*232], rax
	mov r9,  [rsp+8*232]
	mov r8,r9
	mov qword [rsp+8*233],r8
	jmp L_147
	
L_145:
	mov r9,t137
	mov r8,r9
	mov qword [rsp+8*233],r8
	
L_147:
	mov r9,  [rsp+8*233]
	mov r8,r9
	mov qword [rsp+8*234],r8
	mov     rsi, [rsp+8*234]
	mov     rdi, [rsp+8*217]
	call    concat
	mov [rsp+8*235], rax
	mov r9,  [rsp+8*235]
	mov r8,r9
	mov qword [rsp+8*217],r8
	jmp L_148
	
L_142:
	mov r8,65
	mov r9,  [rsp+8*221]
	mov r10,r8
	add r10,r9
	mov r11,10
	sub r10,r11
	mov r8,r10
	mov r9,r8
	mov r10,32
	cmp r9,r10
	mov r11, 0
	setge r11B
	cmp r11, 0
	mov qword rdi,r8
	mov qword [rsp+8*224],r9
	mov qword [rsp+8*225],r11
	jne L_149
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*225],r8
	jmp L_150
	
L_149:
	mov r8,  [rsp+8*224]
	mov r9,126
	cmp r8,r9
	mov r10, 0
	setle r10B
	mov r11,r10
	mov qword [rsp+8*226],r10
	mov qword [rsp+8*225],r11
	
L_150:
	mov r8,  [rsp+8*225]
	cmp r8, 0
	je L_151
	mov r9,  [gbl+8*227]
	mov r8,r9
	mov r10,  [rsp+8*224]
	mov r11,32
	mov qword [rsp+8*228],r8
	mov r8,r10
	sub r8,r11
	mov r11,32
	mov r9,r10
	sub r9,r11
	mov r10,r9
	mov r9,r8
	mov r11,  [rsp+8*228]
	mov r8,r11
	mov qword [arg+8*63],r8
	mov qword rdi,r9
	mov qword rsi,r10
	call    substring
	mov [rsp+8*232], rax
	mov r9,  [rsp+8*232]
	mov r8,r9
	mov qword [rsp+8*233],r8
	jmp L_153
	
L_151:
	mov r9,t137
	mov r8,r9
	mov qword [rsp+8*233],r8
	
L_153:
	mov r9,  [rsp+8*233]
	mov r8,r9
	mov qword [rsp+8*237],r8
	mov     rsi, [rsp+8*237]
	mov     rdi, [rsp+8*217]
	call    concat
	mov [rsp+8*238], rax
	mov r9,  [rsp+8*238]
	mov r8,r9
	mov qword [rsp+8*217],r8
	
L_148:
	mov r8,  [rsp+8*218]
	mov r9,4
	mov r10,r8
	sub r10,r9
	mov r8,r10
	mov qword [rsp+8*218],r8
	mov qword [rsp+8*239],r10
	jmp L_140
	
L_141:
	mov r9,  [rsp+8*217]
	mov r8,r9
	mov r10,r8
	mov qword [rsp+8*240],r8
	mov qword [rsp+8*250],r10
	mov     rsi, t394
	mov     rdi, [rsp+8*250]
	call    concat
	mov [rsp+8*251], rax
	mov r9,  [rsp+8*251]
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*252],r10
	mov rdi, format
	mov rsi,[rsp+8*252] 
	inc rsi
	xor rax, rax
	call printf
	mov r9,t399
	mov r8,r9
	mov r10,r8
	mov qword rdi,r8
	mov qword [rsp+8*253],r10
	mov rdi,[rsp+8*253] 
	inc rdi
	call puts
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 2096
	mov r9,t121
	mov r8,r9
	mov qword [gbl+8*227],r8
	mov r8,  [rsp+8*254]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   4080
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
	
t380:
	 db 1," " ,0

t137:
	 db 0,"" ,0

t139:
	 db 0,"" ,0

t121:
	 db 95," !",34,"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[",92,"]^_`abcdefghijklmnopqrstuvwxyz{|}~" ,0

t399:
	 db 0,"" ,0

t387:
	 db 1," " ,0

t162:
	 db 17,"Assertion Failed!" ,0

t373:
	 db 1," " ,0

t394:
	 db 1," " ,0


