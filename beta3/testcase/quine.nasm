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
	sub    rsp, 13872
	mov     rax, 536870912
        cdqe
        mov     rdi, rax
        call    malloc
        mov     edx, dword 536870912
        movsxd  rdx, edx
        sub     rdx, 15856
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
	mov r10,0
	mov r9,r10
	mov qword [rsp+8*1],r8
	mov r8,  [gbl+8*3]
	mov r11,r8
	mov r10,0
	mov qword [rsp+8*2],r9
	lea r9,[r11+r10*8+8H]
	mov r10,t143
	mov [r9],r10
	mov qword [rsp+8*5],r9
	mov r9,r8
	mov r10,1
	mov qword [rsp+8*4],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*6],r9
	mov r9,t147
	mov [r11],r9
	mov r9,r8
	mov r10,2
	mov qword [rsp+8*7],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*8],r9
	mov r9,t151
	mov [r11],r9
	mov r9,r8
	mov r10,3
	mov qword [rsp+8*9],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*10],r9
	mov r9,t155
	mov [r11],r9
	mov r9,r8
	mov r10,4
	mov qword [rsp+8*11],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*12],r9
	mov r9,t159
	mov [r11],r9
	mov r9,r8
	mov r10,5
	mov qword [rsp+8*13],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*14],r9
	mov r9,t163
	mov [r11],r9
	mov r9,r8
	mov r10,6
	mov qword [rsp+8*15],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*16],r9
	mov r9,t167
	mov [r11],r9
	mov r9,r8
	mov r10,7
	mov qword [rsp+8*17],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*18],r9
	mov r9,t171
	mov [r11],r9
	mov r9,r8
	mov r10,8
	mov qword [rsp+8*19],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*20],r9
	mov r9,t175
	mov [r11],r9
	mov r9,r8
	mov r10,9
	mov qword [rsp+8*21],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*22],r9
	mov r9,t179
	mov [r11],r9
	mov r9,r8
	mov r10,10
	mov qword [rsp+8*23],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*24],r9
	mov r9,t183
	mov [r11],r9
	mov r9,r8
	mov r10,11
	mov qword [rsp+8*25],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*26],r9
	mov r9,t187
	mov [r11],r9
	mov r9,r8
	mov r10,12
	mov qword [rsp+8*27],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*28],r9
	mov r9,t191
	mov [r11],r9
	mov r9,r8
	mov r10,13
	mov qword [rsp+8*29],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*30],r9
	mov r9,t195
	mov [r11],r9
	mov r9,r8
	mov r10,14
	mov qword [rsp+8*31],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*32],r9
	mov r9,t199
	mov [r11],r9
	mov r9,r8
	mov r10,15
	mov qword [rsp+8*33],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*34],r9
	mov r9,t203
	mov [r11],r9
	mov r9,r8
	mov r10,16
	mov qword [rsp+8*35],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*36],r9
	mov r9,t207
	mov [r11],r9
	mov r9,r8
	mov r10,17
	mov qword [rsp+8*37],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*38],r9
	mov r9,t211
	mov [r11],r9
	mov r9,r8
	mov r10,18
	mov qword [rsp+8*39],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*40],r9
	mov r9,t215
	mov [r11],r9
	mov r9,r8
	mov r10,19
	mov qword [rsp+8*41],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*42],r9
	mov r9,t219
	mov [r11],r9
	mov r9,r8
	mov r10,20
	mov qword [rsp+8*43],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*44],r9
	mov r9,t223
	mov [r11],r9
	mov r9,r8
	mov r10,21
	mov qword [rsp+8*45],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*46],r9
	mov r9,t227
	mov [r11],r9
	mov r9,r8
	mov r10,22
	mov qword [rsp+8*47],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*48],r9
	mov r9,t231
	mov [r11],r9
	mov r9,r8
	mov r10,23
	mov qword [rsp+8*49],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*50],r9
	mov r9,t235
	mov [r11],r9
	mov r9,r8
	mov r10,24
	mov qword [rsp+8*51],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*52],r9
	mov r9,t239
	mov [r11],r9
	mov r9,r8
	mov r10,25
	mov qword [rsp+8*53],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*54],r9
	mov r9,t243
	mov [r11],r9
	mov r9,r8
	mov r10,26
	mov qword [rsp+8*55],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*56],r9
	mov r9,t247
	mov [r11],r9
	mov r9,r8
	mov r10,27
	mov qword [rsp+8*57],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*58],r9
	mov r9,t251
	mov [r11],r9
	mov r9,r8
	mov r10,28
	mov qword [rsp+8*59],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*60],r9
	mov r9,t255
	mov [r11],r9
	mov r9,r8
	mov r10,29
	mov qword [rsp+8*61],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*62],r9
	mov r9,t259
	mov [r11],r9
	mov r9,r8
	mov r10,30
	mov qword [rsp+8*63],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*64],r9
	mov r9,t263
	mov [r11],r9
	mov r9,r8
	mov r10,31
	mov qword [rsp+8*65],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*66],r9
	mov r9,t267
	mov [r11],r9
	mov r9,r8
	mov r10,32
	mov qword [rsp+8*67],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*68],r9
	mov r9,t271
	mov [r11],r9
	mov r9,r8
	mov r10,33
	mov qword [rsp+8*69],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*70],r9
	mov r9,t275
	mov [r11],r9
	mov r9,r8
	mov r10,34
	mov qword [rsp+8*71],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*72],r9
	mov r9,t279
	mov [r11],r9
	mov r9,r8
	mov r10,35
	mov qword [rsp+8*73],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*74],r9
	mov r9,t283
	mov [r11],r9
	mov r9,r8
	mov r10,36
	mov qword [rsp+8*75],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*76],r9
	mov r9,t287
	mov [r11],r9
	mov r9,r8
	mov r10,37
	mov qword [rsp+8*77],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*78],r9
	mov r9,t291
	mov [r11],r9
	mov r9,r8
	mov r10,38
	mov qword [rsp+8*79],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*80],r9
	mov r9,t295
	mov [r11],r9
	mov r9,r8
	mov r10,39
	mov qword [rsp+8*81],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*82],r9
	mov r9,t299
	mov [r11],r9
	mov r9,r8
	mov r10,40
	mov qword [rsp+8*83],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*84],r9
	mov r9,t303
	mov [r11],r9
	mov r9,r8
	mov r10,41
	mov qword [rsp+8*85],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*86],r9
	mov r9,t307
	mov [r11],r9
	mov r9,r8
	mov r10,42
	mov qword [rsp+8*87],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*88],r9
	mov r9,t311
	mov [r11],r9
	mov r9,r8
	mov r10,43
	mov qword [rsp+8*89],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*90],r9
	mov r9,t315
	mov [r11],r9
	mov r9,r8
	mov r10,44
	mov qword [rsp+8*91],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*92],r9
	mov r9,t319
	mov [r11],r9
	mov r9,r8
	mov r10,45
	mov qword [rsp+8*93],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*94],r9
	mov r9,t323
	mov [r11],r9
	mov r9,r8
	mov r10,46
	mov qword [rsp+8*95],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*96],r9
	mov r9,t327
	mov [r11],r9
	mov r9,r8
	mov r10,47
	mov qword [rsp+8*97],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*98],r9
	mov r9,t331
	mov [r11],r9
	mov r9,r8
	mov r10,48
	mov qword [rsp+8*99],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*100],r9
	mov r9,t335
	mov [r11],r9
	mov r9,r8
	mov r10,49
	mov qword [rsp+8*101],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*102],r9
	mov r9,t339
	mov [r11],r9
	mov r9,r8
	mov r10,50
	mov qword [rsp+8*103],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*104],r9
	mov r9,t343
	mov [r11],r9
	mov r9,r8
	mov r10,51
	mov qword [rsp+8*105],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*106],r9
	mov r9,t347
	mov [r11],r9
	mov r9,r8
	mov r10,52
	mov qword [rsp+8*107],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*108],r9
	mov r9,t351
	mov [r11],r9
	mov r9,r8
	mov r10,53
	mov qword [rsp+8*109],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*110],r9
	mov r9,t355
	mov [r11],r9
	mov r9,r8
	mov r10,54
	mov qword [rsp+8*111],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*112],r9
	mov r9,t359
	mov [r11],r9
	mov r9,r8
	mov r10,55
	mov qword [rsp+8*113],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*114],r9
	mov r9,t363
	mov [r11],r9
	mov r9,r8
	mov r10,56
	mov qword [rsp+8*115],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*116],r9
	mov r9,t367
	mov [r11],r9
	mov r9,r8
	mov r10,57
	mov qword [rsp+8*117],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*118],r9
	mov r9,t371
	mov [r11],r9
	mov r9,r8
	mov r10,58
	mov qword [rsp+8*119],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*120],r9
	mov r9,t375
	mov [r11],r9
	mov r9,r8
	mov r10,59
	mov qword [rsp+8*121],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*122],r9
	mov r9,t379
	mov [r11],r9
	mov r9,r8
	mov r10,60
	mov qword [rsp+8*123],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*124],r9
	mov r9,t383
	mov [r11],r9
	mov r9,r8
	mov r10,61
	mov qword [rsp+8*125],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*126],r9
	mov r9,t387
	mov [r11],r9
	mov r9,r8
	mov r10,62
	mov qword [rsp+8*127],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*128],r9
	mov r9,t391
	mov [r11],r9
	mov r9,r8
	mov r10,63
	mov qword [rsp+8*129],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*130],r9
	mov r9,t395
	mov [r11],r9
	mov r9,r8
	mov r10,64
	mov qword [rsp+8*131],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*132],r9
	mov r9,t399
	mov [r11],r9
	mov r9,r8
	mov r10,65
	mov qword [rsp+8*133],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*134],r9
	mov r9,t403
	mov [r11],r9
	mov r9,r8
	mov r10,66
	mov qword [rsp+8*135],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*136],r9
	mov r9,t407
	mov [r11],r9
	mov r9,r8
	mov r10,67
	mov qword [rsp+8*137],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*138],r9
	mov r9,t411
	mov [r11],r9
	mov r9,r8
	mov r10,68
	mov qword [rsp+8*139],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*140],r9
	mov r9,t415
	mov [r11],r9
	mov r9,r8
	mov r10,69
	mov qword [rsp+8*141],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*142],r9
	mov r9,t419
	mov [r11],r9
	mov r9,r8
	mov r10,70
	mov qword [rsp+8*143],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*144],r9
	mov r9,t423
	mov [r11],r9
	mov r9,r8
	mov r10,71
	mov qword [rsp+8*145],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*146],r9
	mov r9,t427
	mov [r11],r9
	mov r9,r8
	mov r10,72
	mov qword [rsp+8*147],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*148],r9
	mov r9,t431
	mov [r11],r9
	mov r9,r8
	mov r10,73
	mov qword [rsp+8*149],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*150],r9
	mov r9,t435
	mov [r11],r9
	mov r9,r8
	mov r10,74
	mov qword [rsp+8*151],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*152],r9
	mov r9,t439
	mov [r11],r9
	mov r9,r8
	mov r10,75
	mov qword [rsp+8*153],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*154],r9
	mov r9,t443
	mov [r11],r9
	mov r9,r8
	mov r10,76
	mov qword [rsp+8*155],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*156],r9
	mov r9,t447
	mov [r11],r9
	mov r9,r8
	mov r10,77
	mov qword [rsp+8*157],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*158],r9
	mov r9,t451
	mov [r11],r9
	mov r9,r8
	mov r10,78
	mov qword [rsp+8*159],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*160],r9
	mov r9,t455
	mov [r11],r9
	mov r9,r8
	mov r10,79
	mov qword [rsp+8*161],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*162],r9
	mov r9,t459
	mov [r11],r9
	mov r9,r8
	mov r10,80
	mov qword [rsp+8*163],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*164],r9
	mov r9,t463
	mov [r11],r9
	mov r9,r8
	mov r10,81
	mov qword [rsp+8*165],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*166],r9
	mov r9,t467
	mov [r11],r9
	mov r9,r8
	mov r10,82
	mov qword [rsp+8*167],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*168],r9
	mov r9,t471
	mov [r11],r9
	mov r9,r8
	mov r10,83
	mov qword [rsp+8*169],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*170],r9
	mov r9,t475
	mov [r11],r9
	mov r9,r8
	mov r10,84
	mov qword [rsp+8*171],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*172],r9
	mov r9,t479
	mov [r11],r9
	mov r9,r8
	mov r10,85
	mov qword [rsp+8*173],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*174],r9
	mov r9,t483
	mov [r11],r9
	mov r9,r8
	mov r10,86
	mov qword [rsp+8*175],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*176],r9
	mov r9,t487
	mov [r11],r9
	mov r9,r8
	mov r10,87
	mov qword [rsp+8*177],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*178],r9
	mov r9,t491
	mov [r11],r9
	mov r9,r8
	mov r10,88
	mov qword [rsp+8*179],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*180],r9
	mov r9,t495
	mov [r11],r9
	mov r9,r8
	mov r10,89
	mov qword [rsp+8*181],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*182],r9
	mov r9,t499
	mov [r11],r9
	mov r9,r8
	mov r10,90
	mov qword [rsp+8*183],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*184],r9
	mov r9,t503
	mov [r11],r9
	mov r9,r8
	mov r10,91
	mov qword [rsp+8*185],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*186],r9
	mov r9,t507
	mov [r11],r9
	mov r9,r8
	mov r10,92
	mov qword [rsp+8*187],r11
	lea r11,[r9+r10*8+8H]
	mov qword [rsp+8*188],r9
	mov r9,t511
	mov [r11],r9
	mov r10,  [gbl+8*190]
	mov r9,r10
	mov qword [rsp+8*189],r11
	mov r11,0
	lea r8,[r9+r11*8+8H]
	mov qword [rsp+8*191],r9
	mov r9,t515
	mov [r8],r9
	mov qword [rsp+8*192],r8
	mov r8,r10
	mov r9,1
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*193],r8
	mov r8,t519
	mov [r11],r8
	mov r8,r10
	mov r9,2
	mov qword [rsp+8*194],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*195],r8
	mov r8,t523
	mov [r11],r8
	mov r8,r10
	mov r9,3
	mov qword [rsp+8*196],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*197],r8
	mov r8,t527
	mov [r11],r8
	mov r8,r10
	mov r9,4
	mov qword [rsp+8*198],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*199],r8
	mov r8,t531
	mov [r11],r8
	mov r8,r10
	mov r9,5
	mov qword [rsp+8*200],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*201],r8
	mov r8,t535
	mov [r11],r8
	mov r8,r10
	mov r9,6
	mov qword [rsp+8*202],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*203],r8
	mov r8,t539
	mov [r11],r8
	mov r8,r10
	mov r9,7
	mov qword [rsp+8*204],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*205],r8
	mov r8,t543
	mov [r11],r8
	mov r8,r10
	mov r9,8
	mov qword [rsp+8*206],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*207],r8
	mov r8,t547
	mov [r11],r8
	mov r8,r10
	mov r9,9
	mov qword [rsp+8*208],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*209],r8
	mov r8,t551
	mov [r11],r8
	mov r8,r10
	mov r9,10
	mov qword [rsp+8*210],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*211],r8
	mov r8,t555
	mov [r11],r8
	mov r8,r10
	mov r9,11
	mov qword [rsp+8*212],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*213],r8
	mov r8,t559
	mov [r11],r8
	mov r8,r10
	mov r9,12
	mov qword [rsp+8*214],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*215],r8
	mov r8,t563
	mov [r11],r8
	mov r8,r10
	mov r9,13
	mov qword [rsp+8*216],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*217],r8
	mov r8,t567
	mov [r11],r8
	mov r8,r10
	mov r9,14
	mov qword [rsp+8*218],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*219],r8
	mov r8,t571
	mov [r11],r8
	mov r8,r10
	mov r9,15
	mov qword [rsp+8*220],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*221],r8
	mov r8,t575
	mov [r11],r8
	mov r8,r10
	mov r9,16
	mov qword [rsp+8*222],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*223],r8
	mov r8,t579
	mov [r11],r8
	mov r8,r10
	mov r9,17
	mov qword [rsp+8*224],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*225],r8
	mov r8,t583
	mov [r11],r8
	mov r8,r10
	mov r9,18
	mov qword [rsp+8*226],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*227],r8
	mov r8,t587
	mov [r11],r8
	mov r8,r10
	mov r9,19
	mov qword [rsp+8*228],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*229],r8
	mov r8,t591
	mov [r11],r8
	mov r8,r10
	mov r9,20
	mov qword [rsp+8*230],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*231],r8
	mov r8,t595
	mov [r11],r8
	mov r8,r10
	mov r9,21
	mov qword [rsp+8*232],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*233],r8
	mov r8,t599
	mov [r11],r8
	mov r8,r10
	mov r9,22
	mov qword [rsp+8*234],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*235],r8
	mov r8,t603
	mov [r11],r8
	mov r8,r10
	mov r9,23
	mov qword [rsp+8*236],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*237],r8
	mov r8,t607
	mov [r11],r8
	mov r8,r10
	mov r9,24
	mov qword [rsp+8*238],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*239],r8
	mov r8,t611
	mov [r11],r8
	mov r8,r10
	mov r9,25
	mov qword [rsp+8*240],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*241],r8
	mov r8,t615
	mov [r11],r8
	mov r8,r10
	mov r9,26
	mov qword [rsp+8*242],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*243],r8
	mov r8,t619
	mov [r11],r8
	mov r8,r10
	mov r9,27
	mov qword [rsp+8*244],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*245],r8
	mov r8,t623
	mov [r11],r8
	mov r8,r10
	mov r9,28
	mov qword [rsp+8*246],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*247],r8
	mov r8,t627
	mov [r11],r8
	mov r8,r10
	mov r9,29
	mov qword [rsp+8*248],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*249],r8
	mov r8,t631
	mov [r11],r8
	mov r8,r10
	mov r9,30
	mov qword [rsp+8*250],r11
	lea r11,[r8+r9*8+8H]
	mov qword [rsp+8*251],r8
	mov r8,t635
	mov [r11],r8
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov qword [rsp+8*252],r11
	mov r11,81
	lea r10,[r8+r11*8+8H]
	mov qword [rsp+8*253],r8
	mov r8, [r10]
	mov qword [rsp+8*254],r10
	mov r10,r9
	mov r11,82
	mov qword [rsp+8*255],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*256],r10
	mov r10, [r8]
	mov qword [rsp+8*257],r8
	mov qword [rsp+8*258],r10
	mov     rsi, [rsp+8*258]
	mov     rdi, [rsp+8*255]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*260],r8
	mov r8, [r11]
	mov qword [rsp+8*262],r8
	mov qword [rsp+8*261],r11
	mov     rsi, [rsp+8*262]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*263],r8
	mov r8, [r11]
	mov qword [rsp+8*265],r8
	mov qword [rsp+8*264],r11
	mov     rsi, [rsp+8*265]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*266],r8
	mov r8, [r11]
	mov qword [rsp+8*268],r8
	mov qword [rsp+8*267],r11
	mov     rsi, [rsp+8*268]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*269],r8
	mov r8, [r11]
	mov qword [rsp+8*271],r8
	mov qword [rsp+8*270],r11
	mov     rsi, [rsp+8*271]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*272],r8
	mov r8, [r11]
	mov qword [rsp+8*274],r8
	mov qword [rsp+8*273],r11
	mov     rsi, [rsp+8*274]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,66
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*275],r8
	mov r8, [r11]
	mov qword [rsp+8*277],r8
	mov qword [rsp+8*276],r11
	mov     rsi, [rsp+8*277]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*278],r8
	mov r8, [r11]
	mov qword [rsp+8*280],r8
	mov qword [rsp+8*279],r11
	mov     rsi, [rsp+8*280]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*281],r8
	mov r8, [r11]
	mov qword [rsp+8*283],r8
	mov qword [rsp+8*282],r11
	mov     rsi, [rsp+8*283]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*284],r8
	mov r8, [r11]
	mov qword [rsp+8*286],r8
	mov qword [rsp+8*285],r11
	mov     rsi, [rsp+8*286]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*287],r8
	mov r8, [r11]
	mov qword [rsp+8*289],r8
	mov qword [rsp+8*288],r11
	mov     rsi, [rsp+8*289]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*290],r8
	mov r8, [r11]
	mov qword [rsp+8*292],r8
	mov qword [rsp+8*291],r11
	mov     rsi, [rsp+8*292]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*293],r8
	mov r8, [r11]
	mov qword [rsp+8*295],r8
	mov qword [rsp+8*294],r11
	mov     rsi, [rsp+8*295]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*296],r8
	mov r8, [r11]
	mov qword [rsp+8*298],r8
	mov qword [rsp+8*297],r11
	mov     rsi, [rsp+8*298]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*299],r8
	mov r8, [r11]
	mov qword [rsp+8*301],r8
	mov qword [rsp+8*300],r11
	mov     rsi, [rsp+8*301]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,86
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*302],r8
	mov r8, [r11]
	mov qword [rsp+8*304],r8
	mov qword [rsp+8*303],r11
	mov     rsi, [rsp+8*304]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*305],r8
	mov r8, [r11]
	mov qword [rsp+8*307],r8
	mov qword [rsp+8*306],r11
	mov     rsi, [rsp+8*307]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,89
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*308],r8
	mov r8, [r11]
	mov qword [rsp+8*310],r8
	mov qword [rsp+8*309],r11
	mov     rsi, [rsp+8*310]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*259], rax
	mov r8,  [rsp+8*259]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*312],r9
	mov rdi,[rsp+8*312] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*313],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*314],r11
	mov r11,68
	mov qword [rsp+8*315],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*316],r10
	mov r10, [r8]
	mov qword [rsp+8*317],r8
	mov qword [rsp+8*318],r10
	mov     rsi, [rsp+8*318]
	mov     rdi, [rsp+8*315]
	call    concat
	mov [rsp+8*319], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*320],r8
	mov r8, [r11]
	mov qword [rsp+8*322],r8
	mov qword [rsp+8*321],r11
	mov     rsi, [rsp+8*322]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,86
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*323],r8
	mov r8, [r11]
	mov qword [rsp+8*325],r8
	mov qword [rsp+8*324],r11
	mov     rsi, [rsp+8*325]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*326],r8
	mov r8, [r11]
	mov qword [rsp+8*328],r8
	mov qword [rsp+8*327],r11
	mov     rsi, [rsp+8*328]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*329],r8
	mov r8, [r11]
	mov qword [rsp+8*331],r8
	mov qword [rsp+8*330],r11
	mov     rsi, [rsp+8*331]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,15
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*332],r8
	mov r8, [r11]
	mov qword [rsp+8*334],r8
	mov qword [rsp+8*333],r11
	mov     rsi, [rsp+8*334]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*335],r8
	mov r8, [r11]
	mov qword [rsp+8*337],r8
	mov qword [rsp+8*336],r11
	mov     rsi, [rsp+8*337]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*338],r8
	mov r8, [r11]
	mov qword [rsp+8*340],r8
	mov qword [rsp+8*339],r11
	mov     rsi, [rsp+8*340]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,67
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*341],r8
	mov r8, [r11]
	mov qword [rsp+8*343],r8
	mov qword [rsp+8*342],r11
	mov     rsi, [rsp+8*343]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*344],r8
	mov r8, [r11]
	mov qword [rsp+8*346],r8
	mov qword [rsp+8*345],r11
	mov     rsi, [rsp+8*346]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,83
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*347],r8
	mov r8, [r11]
	mov qword [rsp+8*349],r8
	mov qword [rsp+8*348],r11
	mov     rsi, [rsp+8*349]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*350],r8
	mov r8, [r11]
	mov qword [rsp+8*352],r8
	mov qword [rsp+8*351],r11
	mov     rsi, [rsp+8*352]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*353],r8
	mov r8, [r11]
	mov qword [rsp+8*355],r8
	mov qword [rsp+8*354],r11
	mov     rsi, [rsp+8*355]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*356],r8
	mov r8, [r11]
	mov qword [rsp+8*358],r8
	mov qword [rsp+8*357],r11
	mov     rsi, [rsp+8*358]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,15
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*360],r8
	mov r8, [r11]
	mov qword [rsp+8*362],r8
	mov qword [rsp+8*361],r11
	mov     rsi, [rsp+8*362]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*363],r8
	mov r8, [r11]
	mov qword [rsp+8*365],r8
	mov qword [rsp+8*364],r11
	mov     rsi, [rsp+8*365]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*319], rax
	mov r8,  [rsp+8*319]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*366],r9
	mov rdi,[rsp+8*366] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*367],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*368],r11
	mov r11,68
	mov qword [rsp+8*369],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*370],r10
	mov r10, [r8]
	mov qword [rsp+8*371],r8
	mov qword [rsp+8*372],r10
	mov     rsi, [rsp+8*372]
	mov     rdi, [rsp+8*369]
	call    concat
	mov [rsp+8*373], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*374],r8
	mov r8, [r11]
	mov qword [rsp+8*376],r8
	mov qword [rsp+8*375],r11
	mov     rsi, [rsp+8*376]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,86
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*377],r8
	mov r8, [r11]
	mov qword [rsp+8*379],r8
	mov qword [rsp+8*378],r11
	mov     rsi, [rsp+8*379]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*380],r8
	mov r8, [r11]
	mov qword [rsp+8*382],r8
	mov qword [rsp+8*381],r11
	mov     rsi, [rsp+8*382]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*383],r8
	mov r8, [r11]
	mov qword [rsp+8*385],r8
	mov qword [rsp+8*384],r11
	mov     rsi, [rsp+8*385]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,16
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*386],r8
	mov r8, [r11]
	mov qword [rsp+8*388],r8
	mov qword [rsp+8*387],r11
	mov     rsi, [rsp+8*388]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*389],r8
	mov r8, [r11]
	mov qword [rsp+8*391],r8
	mov qword [rsp+8*390],r11
	mov     rsi, [rsp+8*391]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*392],r8
	mov r8, [r11]
	mov qword [rsp+8*394],r8
	mov qword [rsp+8*393],r11
	mov     rsi, [rsp+8*394]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,67
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*395],r8
	mov r8, [r11]
	mov qword [rsp+8*397],r8
	mov qword [rsp+8*396],r11
	mov     rsi, [rsp+8*397]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*398],r8
	mov r8, [r11]
	mov qword [rsp+8*400],r8
	mov qword [rsp+8*399],r11
	mov     rsi, [rsp+8*400]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,83
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*401],r8
	mov r8, [r11]
	mov qword [rsp+8*403],r8
	mov qword [rsp+8*402],r11
	mov     rsi, [rsp+8*403]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*404],r8
	mov r8, [r11]
	mov qword [rsp+8*406],r8
	mov qword [rsp+8*405],r11
	mov     rsi, [rsp+8*406]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*407],r8
	mov r8, [r11]
	mov qword [rsp+8*409],r8
	mov qword [rsp+8*408],r11
	mov     rsi, [rsp+8*409]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*410],r8
	mov r8, [r11]
	mov qword [rsp+8*412],r8
	mov qword [rsp+8*411],r11
	mov     rsi, [rsp+8*412]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,16
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*413],r8
	mov r8, [r11]
	mov qword [rsp+8*415],r8
	mov qword [rsp+8*414],r11
	mov     rsi, [rsp+8*415]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*416],r8
	mov r8, [r11]
	mov qword [rsp+8*418],r8
	mov qword [rsp+8*417],r11
	mov     rsi, [rsp+8*418]
	mov     rdi, [rsp+8*373]
	call    concat
	mov [rsp+8*373], rax
	mov r8,  [rsp+8*373]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*419],r9
	mov rdi,[rsp+8*419] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*420],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*421],r11
	mov r11,68
	mov qword [rsp+8*422],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*423],r10
	mov r10, [r8]
	mov qword [rsp+8*424],r8
	mov qword [rsp+8*425],r10
	mov     rsi, [rsp+8*425]
	mov     rdi, [rsp+8*422]
	call    concat
	mov [rsp+8*426], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*427],r8
	mov r8, [r11]
	mov qword [rsp+8*429],r8
	mov qword [rsp+8*428],r11
	mov     rsi, [rsp+8*429]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,86
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*430],r8
	mov r8, [r11]
	mov qword [rsp+8*432],r8
	mov qword [rsp+8*431],r11
	mov     rsi, [rsp+8*432]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*433],r8
	mov r8, [r11]
	mov qword [rsp+8*435],r8
	mov qword [rsp+8*434],r11
	mov     rsi, [rsp+8*435]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*436],r8
	mov r8, [r11]
	mov qword [rsp+8*438],r8
	mov qword [rsp+8*437],r11
	mov     rsi, [rsp+8*438]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,17
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*439],r8
	mov r8, [r11]
	mov qword [rsp+8*441],r8
	mov qword [rsp+8*440],r11
	mov     rsi, [rsp+8*441]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*442],r8
	mov r8, [r11]
	mov qword [rsp+8*444],r8
	mov qword [rsp+8*443],r11
	mov     rsi, [rsp+8*444]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*445],r8
	mov r8, [r11]
	mov qword [rsp+8*447],r8
	mov qword [rsp+8*446],r11
	mov     rsi, [rsp+8*447]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,67
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*448],r8
	mov r8, [r11]
	mov qword [rsp+8*450],r8
	mov qword [rsp+8*449],r11
	mov     rsi, [rsp+8*450]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*451],r8
	mov r8, [r11]
	mov qword [rsp+8*453],r8
	mov qword [rsp+8*452],r11
	mov     rsi, [rsp+8*453]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,83
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*454],r8
	mov r8, [r11]
	mov qword [rsp+8*456],r8
	mov qword [rsp+8*455],r11
	mov     rsi, [rsp+8*456]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*457],r8
	mov r8, [r11]
	mov qword [rsp+8*459],r8
	mov qword [rsp+8*458],r11
	mov     rsi, [rsp+8*459]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*460],r8
	mov r8, [r11]
	mov qword [rsp+8*462],r8
	mov qword [rsp+8*461],r11
	mov     rsi, [rsp+8*462]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*463],r8
	mov r8, [r11]
	mov qword [rsp+8*465],r8
	mov qword [rsp+8*464],r11
	mov     rsi, [rsp+8*465]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,17
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*466],r8
	mov r8, [r11]
	mov qword [rsp+8*468],r8
	mov qword [rsp+8*467],r11
	mov     rsi, [rsp+8*468]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*469],r8
	mov r8, [r11]
	mov qword [rsp+8*471],r8
	mov qword [rsp+8*470],r11
	mov     rsi, [rsp+8*471]
	mov     rdi, [rsp+8*426]
	call    concat
	mov [rsp+8*426], rax
	mov r8,  [rsp+8*426]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*472],r9
	mov rdi,[rsp+8*472] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*473],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*474],r11
	mov r11,68
	mov qword [rsp+8*475],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*476],r10
	mov r10, [r8]
	mov qword [rsp+8*477],r8
	mov qword [rsp+8*478],r10
	mov     rsi, [rsp+8*478]
	mov     rdi, [rsp+8*475]
	call    concat
	mov [rsp+8*479], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*480],r8
	mov r8, [r11]
	mov qword [rsp+8*482],r8
	mov qword [rsp+8*481],r11
	mov     rsi, [rsp+8*482]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,86
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*483],r8
	mov r8, [r11]
	mov qword [rsp+8*485],r8
	mov qword [rsp+8*484],r11
	mov     rsi, [rsp+8*485]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*486],r8
	mov r8, [r11]
	mov qword [rsp+8*488],r8
	mov qword [rsp+8*487],r11
	mov     rsi, [rsp+8*488]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*489],r8
	mov r8, [r11]
	mov qword [rsp+8*491],r8
	mov qword [rsp+8*490],r11
	mov     rsi, [rsp+8*491]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,18
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*492],r8
	mov r8, [r11]
	mov qword [rsp+8*494],r8
	mov qword [rsp+8*493],r11
	mov     rsi, [rsp+8*494]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*495],r8
	mov r8, [r11]
	mov qword [rsp+8*497],r8
	mov qword [rsp+8*496],r11
	mov     rsi, [rsp+8*497]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*498],r8
	mov r8, [r11]
	mov qword [rsp+8*500],r8
	mov qword [rsp+8*499],r11
	mov     rsi, [rsp+8*500]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,67
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*501],r8
	mov r8, [r11]
	mov qword [rsp+8*503],r8
	mov qword [rsp+8*502],r11
	mov     rsi, [rsp+8*503]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*504],r8
	mov r8, [r11]
	mov qword [rsp+8*506],r8
	mov qword [rsp+8*505],r11
	mov     rsi, [rsp+8*506]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,83
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*507],r8
	mov r8, [r11]
	mov qword [rsp+8*509],r8
	mov qword [rsp+8*508],r11
	mov     rsi, [rsp+8*509]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*510],r8
	mov r8, [r11]
	mov qword [rsp+8*512],r8
	mov qword [rsp+8*511],r11
	mov     rsi, [rsp+8*512]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*513],r8
	mov r8, [r11]
	mov qword [rsp+8*515],r8
	mov qword [rsp+8*514],r11
	mov     rsi, [rsp+8*515]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*516],r8
	mov r8, [r11]
	mov qword [rsp+8*518],r8
	mov qword [rsp+8*517],r11
	mov     rsi, [rsp+8*518]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,18
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*519],r8
	mov r8, [r11]
	mov qword [rsp+8*521],r8
	mov qword [rsp+8*520],r11
	mov     rsi, [rsp+8*521]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*522],r8
	mov r8, [r11]
	mov qword [rsp+8*524],r8
	mov qword [rsp+8*523],r11
	mov     rsi, [rsp+8*524]
	mov     rdi, [rsp+8*479]
	call    concat
	mov [rsp+8*479], rax
	mov r8,  [rsp+8*479]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*525],r9
	mov rdi,[rsp+8*525] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*526],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*527],r11
	mov r11,68
	mov qword [rsp+8*528],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*529],r10
	mov r10, [r8]
	mov qword [rsp+8*530],r8
	mov qword [rsp+8*531],r10
	mov     rsi, [rsp+8*531]
	mov     rdi, [rsp+8*528]
	call    concat
	mov [rsp+8*532], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*533],r8
	mov r8, [r11]
	mov qword [rsp+8*535],r8
	mov qword [rsp+8*534],r11
	mov     rsi, [rsp+8*535]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,86
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*536],r8
	mov r8, [r11]
	mov qword [rsp+8*538],r8
	mov qword [rsp+8*537],r11
	mov     rsi, [rsp+8*538]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*539],r8
	mov r8, [r11]
	mov qword [rsp+8*541],r8
	mov qword [rsp+8*540],r11
	mov     rsi, [rsp+8*541]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*542],r8
	mov r8, [r11]
	mov qword [rsp+8*544],r8
	mov qword [rsp+8*543],r11
	mov     rsi, [rsp+8*544]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,19
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*545],r8
	mov r8, [r11]
	mov qword [rsp+8*547],r8
	mov qword [rsp+8*546],r11
	mov     rsi, [rsp+8*547]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*548],r8
	mov r8, [r11]
	mov qword [rsp+8*550],r8
	mov qword [rsp+8*549],r11
	mov     rsi, [rsp+8*550]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*551],r8
	mov r8, [r11]
	mov qword [rsp+8*553],r8
	mov qword [rsp+8*552],r11
	mov     rsi, [rsp+8*553]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,67
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*554],r8
	mov r8, [r11]
	mov qword [rsp+8*556],r8
	mov qword [rsp+8*555],r11
	mov     rsi, [rsp+8*556]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*557],r8
	mov r8, [r11]
	mov qword [rsp+8*559],r8
	mov qword [rsp+8*558],r11
	mov     rsi, [rsp+8*559]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,83
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*560],r8
	mov r8, [r11]
	mov qword [rsp+8*562],r8
	mov qword [rsp+8*561],r11
	mov     rsi, [rsp+8*562]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*563],r8
	mov r8, [r11]
	mov qword [rsp+8*565],r8
	mov qword [rsp+8*564],r11
	mov     rsi, [rsp+8*565]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*566],r8
	mov r8, [r11]
	mov qword [rsp+8*568],r8
	mov qword [rsp+8*567],r11
	mov     rsi, [rsp+8*568]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*569],r8
	mov r8, [r11]
	mov qword [rsp+8*571],r8
	mov qword [rsp+8*570],r11
	mov     rsi, [rsp+8*571]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,19
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*572],r8
	mov r8, [r11]
	mov qword [rsp+8*574],r8
	mov qword [rsp+8*573],r11
	mov     rsi, [rsp+8*574]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*575],r8
	mov r8, [r11]
	mov qword [rsp+8*577],r8
	mov qword [rsp+8*576],r11
	mov     rsi, [rsp+8*577]
	mov     rdi, [rsp+8*532]
	call    concat
	mov [rsp+8*532], rax
	mov r8,  [rsp+8*532]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*578],r9
	mov rdi,[rsp+8*578] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*579],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*580],r11
	mov r11,68
	mov qword [rsp+8*581],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*582],r10
	mov r10, [r8]
	mov qword [rsp+8*583],r8
	mov qword [rsp+8*584],r10
	mov     rsi, [rsp+8*584]
	mov     rdi, [rsp+8*581]
	call    concat
	mov [rsp+8*585], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*586],r8
	mov r8, [r11]
	mov qword [rsp+8*588],r8
	mov qword [rsp+8*587],r11
	mov     rsi, [rsp+8*588]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,86
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*589],r8
	mov r8, [r11]
	mov qword [rsp+8*591],r8
	mov qword [rsp+8*590],r11
	mov     rsi, [rsp+8*591]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*592],r8
	mov r8, [r11]
	mov qword [rsp+8*594],r8
	mov qword [rsp+8*593],r11
	mov     rsi, [rsp+8*594]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*595],r8
	mov r8, [r11]
	mov qword [rsp+8*597],r8
	mov qword [rsp+8*596],r11
	mov     rsi, [rsp+8*597]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,20
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*598],r8
	mov r8, [r11]
	mov qword [rsp+8*600],r8
	mov qword [rsp+8*599],r11
	mov     rsi, [rsp+8*600]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*601],r8
	mov r8, [r11]
	mov qword [rsp+8*603],r8
	mov qword [rsp+8*602],r11
	mov     rsi, [rsp+8*603]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*604],r8
	mov r8, [r11]
	mov qword [rsp+8*606],r8
	mov qword [rsp+8*605],r11
	mov     rsi, [rsp+8*606]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,67
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*607],r8
	mov r8, [r11]
	mov qword [rsp+8*609],r8
	mov qword [rsp+8*608],r11
	mov     rsi, [rsp+8*609]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*610],r8
	mov r8, [r11]
	mov qword [rsp+8*612],r8
	mov qword [rsp+8*611],r11
	mov     rsi, [rsp+8*612]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,83
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*613],r8
	mov r8, [r11]
	mov qword [rsp+8*615],r8
	mov qword [rsp+8*614],r11
	mov     rsi, [rsp+8*615]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*616],r8
	mov r8, [r11]
	mov qword [rsp+8*618],r8
	mov qword [rsp+8*617],r11
	mov     rsi, [rsp+8*618]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*619],r8
	mov r8, [r11]
	mov qword [rsp+8*621],r8
	mov qword [rsp+8*620],r11
	mov     rsi, [rsp+8*621]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*622],r8
	mov r8, [r11]
	mov qword [rsp+8*624],r8
	mov qword [rsp+8*623],r11
	mov     rsi, [rsp+8*624]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,20
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*625],r8
	mov r8, [r11]
	mov qword [rsp+8*627],r8
	mov qword [rsp+8*626],r11
	mov     rsi, [rsp+8*627]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*628],r8
	mov r8, [r11]
	mov qword [rsp+8*630],r8
	mov qword [rsp+8*629],r11
	mov     rsi, [rsp+8*630]
	mov     rdi, [rsp+8*585]
	call    concat
	mov [rsp+8*585], rax
	mov r8,  [rsp+8*585]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*631],r9
	mov rdi,[rsp+8*631] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*632],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*633],r11
	mov r11,68
	mov qword [rsp+8*634],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*635],r10
	mov r10, [r8]
	mov qword [rsp+8*636],r8
	mov qword [rsp+8*637],r10
	mov     rsi, [rsp+8*637]
	mov     rdi, [rsp+8*634]
	call    concat
	mov [rsp+8*638], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*639],r8
	mov r8, [r11]
	mov qword [rsp+8*641],r8
	mov qword [rsp+8*640],r11
	mov     rsi, [rsp+8*641]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,86
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*642],r8
	mov r8, [r11]
	mov qword [rsp+8*644],r8
	mov qword [rsp+8*643],r11
	mov     rsi, [rsp+8*644]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*645],r8
	mov r8, [r11]
	mov qword [rsp+8*647],r8
	mov qword [rsp+8*646],r11
	mov     rsi, [rsp+8*647]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*648],r8
	mov r8, [r11]
	mov qword [rsp+8*650],r8
	mov qword [rsp+8*649],r11
	mov     rsi, [rsp+8*650]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,21
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*651],r8
	mov r8, [r11]
	mov qword [rsp+8*653],r8
	mov qword [rsp+8*652],r11
	mov     rsi, [rsp+8*653]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*654],r8
	mov r8, [r11]
	mov qword [rsp+8*656],r8
	mov qword [rsp+8*655],r11
	mov     rsi, [rsp+8*656]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*657],r8
	mov r8, [r11]
	mov qword [rsp+8*659],r8
	mov qword [rsp+8*658],r11
	mov     rsi, [rsp+8*659]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,67
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*660],r8
	mov r8, [r11]
	mov qword [rsp+8*662],r8
	mov qword [rsp+8*661],r11
	mov     rsi, [rsp+8*662]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*663],r8
	mov r8, [r11]
	mov qword [rsp+8*665],r8
	mov qword [rsp+8*664],r11
	mov     rsi, [rsp+8*665]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,83
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*666],r8
	mov r8, [r11]
	mov qword [rsp+8*668],r8
	mov qword [rsp+8*667],r11
	mov     rsi, [rsp+8*668]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*669],r8
	mov r8, [r11]
	mov qword [rsp+8*671],r8
	mov qword [rsp+8*670],r11
	mov     rsi, [rsp+8*671]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*672],r8
	mov r8, [r11]
	mov qword [rsp+8*674],r8
	mov qword [rsp+8*673],r11
	mov     rsi, [rsp+8*674]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*675],r8
	mov r8, [r11]
	mov qword [rsp+8*677],r8
	mov qword [rsp+8*676],r11
	mov     rsi, [rsp+8*677]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,21
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*678],r8
	mov r8, [r11]
	mov qword [rsp+8*680],r8
	mov qword [rsp+8*679],r11
	mov     rsi, [rsp+8*680]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*681],r8
	mov r8, [r11]
	mov qword [rsp+8*683],r8
	mov qword [rsp+8*682],r11
	mov     rsi, [rsp+8*683]
	mov     rdi, [rsp+8*638]
	call    concat
	mov [rsp+8*638], rax
	mov r8,  [rsp+8*638]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*684],r9
	mov rdi,[rsp+8*684] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*685],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*686],r11
	mov r11,68
	mov qword [rsp+8*687],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*688],r10
	mov r10, [r8]
	mov qword [rsp+8*689],r8
	mov qword [rsp+8*690],r10
	mov     rsi, [rsp+8*690]
	mov     rdi, [rsp+8*687]
	call    concat
	mov [rsp+8*691], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*692],r8
	mov r8, [r11]
	mov qword [rsp+8*694],r8
	mov qword [rsp+8*693],r11
	mov     rsi, [rsp+8*694]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,86
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*695],r8
	mov r8, [r11]
	mov qword [rsp+8*697],r8
	mov qword [rsp+8*696],r11
	mov     rsi, [rsp+8*697]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*698],r8
	mov r8, [r11]
	mov qword [rsp+8*700],r8
	mov qword [rsp+8*699],r11
	mov     rsi, [rsp+8*700]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*701],r8
	mov r8, [r11]
	mov qword [rsp+8*703],r8
	mov qword [rsp+8*702],r11
	mov     rsi, [rsp+8*703]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,22
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*704],r8
	mov r8, [r11]
	mov qword [rsp+8*706],r8
	mov qword [rsp+8*705],r11
	mov     rsi, [rsp+8*706]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*707],r8
	mov r8, [r11]
	mov qword [rsp+8*709],r8
	mov qword [rsp+8*708],r11
	mov     rsi, [rsp+8*709]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*710],r8
	mov r8, [r11]
	mov qword [rsp+8*712],r8
	mov qword [rsp+8*711],r11
	mov     rsi, [rsp+8*712]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,67
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*713],r8
	mov r8, [r11]
	mov qword [rsp+8*715],r8
	mov qword [rsp+8*714],r11
	mov     rsi, [rsp+8*715]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*716],r8
	mov r8, [r11]
	mov qword [rsp+8*718],r8
	mov qword [rsp+8*717],r11
	mov     rsi, [rsp+8*718]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,83
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*719],r8
	mov r8, [r11]
	mov qword [rsp+8*721],r8
	mov qword [rsp+8*720],r11
	mov     rsi, [rsp+8*721]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*722],r8
	mov r8, [r11]
	mov qword [rsp+8*724],r8
	mov qword [rsp+8*723],r11
	mov     rsi, [rsp+8*724]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*725],r8
	mov r8, [r11]
	mov qword [rsp+8*727],r8
	mov qword [rsp+8*726],r11
	mov     rsi, [rsp+8*727]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*728],r8
	mov r8, [r11]
	mov qword [rsp+8*730],r8
	mov qword [rsp+8*729],r11
	mov     rsi, [rsp+8*730]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,22
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*731],r8
	mov r8, [r11]
	mov qword [rsp+8*733],r8
	mov qword [rsp+8*732],r11
	mov     rsi, [rsp+8*733]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*734],r8
	mov r8, [r11]
	mov qword [rsp+8*736],r8
	mov qword [rsp+8*735],r11
	mov     rsi, [rsp+8*736]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*691], rax
	mov r8,  [rsp+8*691]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*737],r9
	mov rdi,[rsp+8*737] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*738],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*739],r11
	mov r11,68
	mov qword [rsp+8*740],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*741],r10
	mov r10, [r8]
	mov qword [rsp+8*742],r8
	mov qword [rsp+8*743],r10
	mov     rsi, [rsp+8*743]
	mov     rdi, [rsp+8*740]
	call    concat
	mov [rsp+8*744], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*745],r8
	mov r8, [r11]
	mov qword [rsp+8*747],r8
	mov qword [rsp+8*746],r11
	mov     rsi, [rsp+8*747]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,86
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*748],r8
	mov r8, [r11]
	mov qword [rsp+8*750],r8
	mov qword [rsp+8*749],r11
	mov     rsi, [rsp+8*750]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*751],r8
	mov r8, [r11]
	mov qword [rsp+8*753],r8
	mov qword [rsp+8*752],r11
	mov     rsi, [rsp+8*753]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*754],r8
	mov r8, [r11]
	mov qword [rsp+8*756],r8
	mov qword [rsp+8*755],r11
	mov     rsi, [rsp+8*756]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,23
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*757],r8
	mov r8, [r11]
	mov qword [rsp+8*759],r8
	mov qword [rsp+8*758],r11
	mov     rsi, [rsp+8*759]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*760],r8
	mov r8, [r11]
	mov qword [rsp+8*762],r8
	mov qword [rsp+8*761],r11
	mov     rsi, [rsp+8*762]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*763],r8
	mov r8, [r11]
	mov qword [rsp+8*765],r8
	mov qword [rsp+8*764],r11
	mov     rsi, [rsp+8*765]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,67
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*766],r8
	mov r8, [r11]
	mov qword [rsp+8*768],r8
	mov qword [rsp+8*767],r11
	mov     rsi, [rsp+8*768]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*769],r8
	mov r8, [r11]
	mov qword [rsp+8*771],r8
	mov qword [rsp+8*770],r11
	mov     rsi, [rsp+8*771]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,83
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*772],r8
	mov r8, [r11]
	mov qword [rsp+8*774],r8
	mov qword [rsp+8*773],r11
	mov     rsi, [rsp+8*774]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*775],r8
	mov r8, [r11]
	mov qword [rsp+8*777],r8
	mov qword [rsp+8*776],r11
	mov     rsi, [rsp+8*777]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*778],r8
	mov r8, [r11]
	mov qword [rsp+8*780],r8
	mov qword [rsp+8*779],r11
	mov     rsi, [rsp+8*780]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*781],r8
	mov r8, [r11]
	mov qword [rsp+8*783],r8
	mov qword [rsp+8*782],r11
	mov     rsi, [rsp+8*783]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,23
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*784],r8
	mov r8, [r11]
	mov qword [rsp+8*786],r8
	mov qword [rsp+8*785],r11
	mov     rsi, [rsp+8*786]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*787],r8
	mov r8, [r11]
	mov qword [rsp+8*789],r8
	mov qword [rsp+8*788],r11
	mov     rsi, [rsp+8*789]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*744], rax
	mov r8,  [rsp+8*744]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*790],r9
	mov rdi,[rsp+8*790] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*791],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*792],r11
	mov r11,68
	mov qword [rsp+8*793],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*794],r10
	mov r10, [r8]
	mov qword [rsp+8*795],r8
	mov qword [rsp+8*796],r10
	mov     rsi, [rsp+8*796]
	mov     rdi, [rsp+8*793]
	call    concat
	mov [rsp+8*797], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*798],r8
	mov r8, [r11]
	mov qword [rsp+8*800],r8
	mov qword [rsp+8*799],r11
	mov     rsi, [rsp+8*800]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,86
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*801],r8
	mov r8, [r11]
	mov qword [rsp+8*803],r8
	mov qword [rsp+8*802],r11
	mov     rsi, [rsp+8*803]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*804],r8
	mov r8, [r11]
	mov qword [rsp+8*806],r8
	mov qword [rsp+8*805],r11
	mov     rsi, [rsp+8*806]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*807],r8
	mov r8, [r11]
	mov qword [rsp+8*809],r8
	mov qword [rsp+8*808],r11
	mov     rsi, [rsp+8*809]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,24
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*810],r8
	mov r8, [r11]
	mov qword [rsp+8*812],r8
	mov qword [rsp+8*811],r11
	mov     rsi, [rsp+8*812]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*813],r8
	mov r8, [r11]
	mov qword [rsp+8*815],r8
	mov qword [rsp+8*814],r11
	mov     rsi, [rsp+8*815]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*816],r8
	mov r8, [r11]
	mov qword [rsp+8*818],r8
	mov qword [rsp+8*817],r11
	mov     rsi, [rsp+8*818]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,67
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*819],r8
	mov r8, [r11]
	mov qword [rsp+8*821],r8
	mov qword [rsp+8*820],r11
	mov     rsi, [rsp+8*821]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*822],r8
	mov r8, [r11]
	mov qword [rsp+8*824],r8
	mov qword [rsp+8*823],r11
	mov     rsi, [rsp+8*824]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,83
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*825],r8
	mov r8, [r11]
	mov qword [rsp+8*827],r8
	mov qword [rsp+8*826],r11
	mov     rsi, [rsp+8*827]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*828],r8
	mov r8, [r11]
	mov qword [rsp+8*830],r8
	mov qword [rsp+8*829],r11
	mov     rsi, [rsp+8*830]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*831],r8
	mov r8, [r11]
	mov qword [rsp+8*833],r8
	mov qword [rsp+8*832],r11
	mov     rsi, [rsp+8*833]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*834],r8
	mov r8, [r11]
	mov qword [rsp+8*836],r8
	mov qword [rsp+8*835],r11
	mov     rsi, [rsp+8*836]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,24
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*837],r8
	mov r8, [r11]
	mov qword [rsp+8*839],r8
	mov qword [rsp+8*838],r11
	mov     rsi, [rsp+8*839]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*840],r8
	mov r8, [r11]
	mov qword [rsp+8*842],r8
	mov qword [rsp+8*841],r11
	mov     rsi, [rsp+8*842]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*797], rax
	mov r8,  [rsp+8*797]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*843],r9
	mov rdi,[rsp+8*843] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,91
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*844],r8
	mov r8, [r11]
	mov rdi,r8
	mov qword [rsp+8*846],r8
	mov r8,rdi
	mov qword [rsp+8*847],r8
	mov qword [rsp+8*845],r11
	mov rdi,[rsp+8*847] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*848],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*849],r11
	mov r11,82
	mov qword [rsp+8*850],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*851],r10
	mov r10, [r8]
	mov qword [rsp+8*852],r8
	mov qword [rsp+8*853],r10
	mov     rsi, [rsp+8*853]
	mov     rdi, [rsp+8*850]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*855],r8
	mov r8, [r11]
	mov qword [rsp+8*857],r8
	mov qword [rsp+8*856],r11
	mov     rsi, [rsp+8*857]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*858],r8
	mov r8, [r11]
	mov qword [rsp+8*860],r8
	mov qword [rsp+8*859],r11
	mov     rsi, [rsp+8*860]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*861],r8
	mov r8, [r11]
	mov qword [rsp+8*863],r8
	mov qword [rsp+8*862],r11
	mov     rsi, [rsp+8*863]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*864],r8
	mov r8, [r11]
	mov qword [rsp+8*866],r8
	mov qword [rsp+8*865],r11
	mov     rsi, [rsp+8*866]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,58
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*867],r8
	mov r8, [r11]
	mov qword [rsp+8*869],r8
	mov qword [rsp+8*868],r11
	mov     rsi, [rsp+8*869]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,59
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*870],r8
	mov r8, [r11]
	mov qword [rsp+8*872],r8
	mov qword [rsp+8*871],r11
	mov     rsi, [rsp+8*872]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*873],r8
	mov r8, [r11]
	mov qword [rsp+8*875],r8
	mov qword [rsp+8*874],r11
	mov     rsi, [rsp+8*875]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*876],r8
	mov r8, [r11]
	mov qword [rsp+8*878],r8
	mov qword [rsp+8*877],r11
	mov     rsi, [rsp+8*878]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*879],r8
	mov r8, [r11]
	mov qword [rsp+8*881],r8
	mov qword [rsp+8*880],r11
	mov     rsi, [rsp+8*881]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*882],r8
	mov r8, [r11]
	mov qword [rsp+8*884],r8
	mov qword [rsp+8*883],r11
	mov     rsi, [rsp+8*884]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,67
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*885],r8
	mov r8, [r11]
	mov qword [rsp+8*887],r8
	mov qword [rsp+8*886],r11
	mov     rsi, [rsp+8*887]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,85
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*888],r8
	mov r8, [r11]
	mov qword [rsp+8*890],r8
	mov qword [rsp+8*889],r11
	mov     rsi, [rsp+8*890]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*891],r8
	mov r8, [r11]
	mov qword [rsp+8*893],r8
	mov qword [rsp+8*892],r11
	mov     rsi, [rsp+8*893]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*894],r8
	mov r8, [r11]
	mov qword [rsp+8*896],r8
	mov qword [rsp+8*895],r11
	mov     rsi, [rsp+8*896]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*897],r8
	mov r8, [r11]
	mov qword [rsp+8*899],r8
	mov qword [rsp+8*898],r11
	mov     rsi, [rsp+8*899]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*900],r8
	mov r8, [r11]
	mov qword [rsp+8*902],r8
	mov qword [rsp+8*901],r11
	mov     rsi, [rsp+8*902]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*903],r8
	mov r8, [r11]
	mov qword [rsp+8*905],r8
	mov qword [rsp+8*904],r11
	mov     rsi, [rsp+8*905]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*906],r8
	mov r8, [r11]
	mov qword [rsp+8*908],r8
	mov qword [rsp+8*907],r11
	mov     rsi, [rsp+8*908]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*909],r8
	mov r8, [r11]
	mov qword [rsp+8*911],r8
	mov qword [rsp+8*910],r11
	mov     rsi, [rsp+8*911]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,58
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*912],r8
	mov r8, [r11]
	mov qword [rsp+8*914],r8
	mov qword [rsp+8*913],r11
	mov     rsi, [rsp+8*914]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,17
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*915],r8
	mov r8, [r11]
	mov qword [rsp+8*917],r8
	mov qword [rsp+8*916],r11
	mov     rsi, [rsp+8*917]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,20
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*918],r8
	mov r8, [r11]
	mov qword [rsp+8*920],r8
	mov qword [rsp+8*919],r11
	mov     rsi, [rsp+8*920]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,21
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*921],r8
	mov r8, [r11]
	mov qword [rsp+8*923],r8
	mov qword [rsp+8*922],r11
	mov     rsi, [rsp+8*923]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,59
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*924],r8
	mov r8, [r11]
	mov qword [rsp+8*926],r8
	mov qword [rsp+8*925],r11
	mov     rsi, [rsp+8*926]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*927],r8
	mov r8, [r11]
	mov qword [rsp+8*929],r8
	mov qword [rsp+8*928],r11
	mov     rsi, [rsp+8*929]
	mov     rdi, [rsp+8*854]
	call    concat
	mov [rsp+8*854], rax
	mov r8,  [rsp+8*854]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*930],r9
	mov rdi,[rsp+8*930] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*931],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*932],r11
	mov r11,82
	mov qword [rsp+8*933],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*934],r10
	mov r10, [r8]
	mov qword [rsp+8*935],r8
	mov qword [rsp+8*936],r10
	mov     rsi, [rsp+8*936]
	mov     rdi, [rsp+8*933]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*938],r8
	mov r8, [r11]
	mov qword [rsp+8*940],r8
	mov qword [rsp+8*939],r11
	mov     rsi, [rsp+8*940]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*941],r8
	mov r8, [r11]
	mov qword [rsp+8*943],r8
	mov qword [rsp+8*942],r11
	mov     rsi, [rsp+8*943]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*944],r8
	mov r8, [r11]
	mov qword [rsp+8*946],r8
	mov qword [rsp+8*945],r11
	mov     rsi, [rsp+8*946]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*947],r8
	mov r8, [r11]
	mov qword [rsp+8*949],r8
	mov qword [rsp+8*948],r11
	mov     rsi, [rsp+8*949]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,58
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*950],r8
	mov r8, [r11]
	mov qword [rsp+8*952],r8
	mov qword [rsp+8*951],r11
	mov     rsi, [rsp+8*952]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,59
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*953],r8
	mov r8, [r11]
	mov qword [rsp+8*955],r8
	mov qword [rsp+8*954],r11
	mov     rsi, [rsp+8*955]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*956],r8
	mov r8, [r11]
	mov qword [rsp+8*958],r8
	mov qword [rsp+8*957],r11
	mov     rsi, [rsp+8*958]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,65
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*959],r8
	mov r8, [r11]
	mov qword [rsp+8*961],r8
	mov qword [rsp+8*960],r11
	mov     rsi, [rsp+8*961]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*962],r8
	mov r8, [r11]
	mov qword [rsp+8*964],r8
	mov qword [rsp+8*963],r11
	mov     rsi, [rsp+8*964]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*965],r8
	mov r8, [r11]
	mov qword [rsp+8*967],r8
	mov qword [rsp+8*966],r11
	mov     rsi, [rsp+8*967]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,67
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*968],r8
	mov r8, [r11]
	mov qword [rsp+8*970],r8
	mov qword [rsp+8*969],r11
	mov     rsi, [rsp+8*970]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,85
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*971],r8
	mov r8, [r11]
	mov qword [rsp+8*973],r8
	mov qword [rsp+8*972],r11
	mov     rsi, [rsp+8*973]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*974],r8
	mov r8, [r11]
	mov qword [rsp+8*976],r8
	mov qword [rsp+8*975],r11
	mov     rsi, [rsp+8*976]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*977],r8
	mov r8, [r11]
	mov qword [rsp+8*979],r8
	mov qword [rsp+8*978],r11
	mov     rsi, [rsp+8*979]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*980],r8
	mov r8, [r11]
	mov qword [rsp+8*982],r8
	mov qword [rsp+8*981],r11
	mov     rsi, [rsp+8*982]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*983],r8
	mov r8, [r11]
	mov qword [rsp+8*985],r8
	mov qword [rsp+8*984],r11
	mov     rsi, [rsp+8*985]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*986],r8
	mov r8, [r11]
	mov qword [rsp+8*988],r8
	mov qword [rsp+8*987],r11
	mov     rsi, [rsp+8*988]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*989],r8
	mov r8, [r11]
	mov qword [rsp+8*991],r8
	mov qword [rsp+8*990],r11
	mov     rsi, [rsp+8*991]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*992],r8
	mov r8, [r11]
	mov qword [rsp+8*994],r8
	mov qword [rsp+8*993],r11
	mov     rsi, [rsp+8*994]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,58
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*995],r8
	mov r8, [r11]
	mov qword [rsp+8*997],r8
	mov qword [rsp+8*996],r11
	mov     rsi, [rsp+8*997]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,17
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*998],r8
	mov r8, [r11]
	mov qword [rsp+8*1000],r8
	mov qword [rsp+8*999],r11
	mov     rsi, [rsp+8*1000]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,20
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1001],r8
	mov r8, [r11]
	mov qword [rsp+8*1003],r8
	mov qword [rsp+8*1002],r11
	mov     rsi, [rsp+8*1003]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,21
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1004],r8
	mov r8, [r11]
	mov qword [rsp+8*1006],r8
	mov qword [rsp+8*1005],r11
	mov     rsi, [rsp+8*1006]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,59
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1007],r8
	mov r8, [r11]
	mov qword [rsp+8*1009],r8
	mov qword [rsp+8*1008],r11
	mov     rsi, [rsp+8*1009]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1010],r8
	mov r8, [r11]
	mov qword [rsp+8*1012],r8
	mov qword [rsp+8*1011],r11
	mov     rsi, [rsp+8*1012]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*937], rax
	mov r8,  [rsp+8*937]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*1013],r9
	mov rdi,[rsp+8*1013] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1014],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*1015],r11
	mov r11,82
	mov qword [rsp+8*1016],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*1017],r10
	mov r10, [r8]
	mov qword [rsp+8*1018],r8
	mov qword [rsp+8*1019],r10
	mov     rsi, [rsp+8*1019]
	mov     rdi, [rsp+8*1016]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1021],r8
	mov r8, [r11]
	mov qword [rsp+8*1023],r8
	mov qword [rsp+8*1022],r11
	mov     rsi, [rsp+8*1023]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1024],r8
	mov r8, [r11]
	mov qword [rsp+8*1026],r8
	mov qword [rsp+8*1025],r11
	mov     rsi, [rsp+8*1026]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1027],r8
	mov r8, [r11]
	mov qword [rsp+8*1029],r8
	mov qword [rsp+8*1028],r11
	mov     rsi, [rsp+8*1029]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1030],r8
	mov r8, [r11]
	mov qword [rsp+8*1032],r8
	mov qword [rsp+8*1031],r11
	mov     rsi, [rsp+8*1032]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1033],r8
	mov r8, [r11]
	mov qword [rsp+8*1035],r8
	mov qword [rsp+8*1034],r11
	mov     rsi, [rsp+8*1035]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1036],r8
	mov r8, [r11]
	mov qword [rsp+8*1038],r8
	mov qword [rsp+8*1037],r11
	mov     rsi, [rsp+8*1038]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,17
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1039],r8
	mov r8, [r11]
	mov qword [rsp+8*1041],r8
	mov qword [rsp+8*1040],r11
	mov     rsi, [rsp+8*1041]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1042],r8
	mov r8, [r11]
	mov qword [rsp+8*1044],r8
	mov qword [rsp+8*1043],r11
	mov     rsi, [rsp+8*1044]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1045],r8
	mov r8, [r11]
	mov qword [rsp+8*1047],r8
	mov qword [rsp+8*1046],r11
	mov     rsi, [rsp+8*1047]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1048],r8
	mov r8, [r11]
	mov qword [rsp+8*1050],r8
	mov qword [rsp+8*1049],r11
	mov     rsi, [rsp+8*1050]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1051],r8
	mov r8, [r11]
	mov qword [rsp+8*1053],r8
	mov qword [rsp+8*1052],r11
	mov     rsi, [rsp+8*1053]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1054],r8
	mov r8, [r11]
	mov qword [rsp+8*1056],r8
	mov qword [rsp+8*1055],r11
	mov     rsi, [rsp+8*1056]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1057],r8
	mov r8, [r11]
	mov qword [rsp+8*1059],r8
	mov qword [rsp+8*1058],r11
	mov     rsi, [rsp+8*1059]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1060],r8
	mov r8, [r11]
	mov qword [rsp+8*1062],r8
	mov qword [rsp+8*1061],r11
	mov     rsi, [rsp+8*1062]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1063],r8
	mov r8, [r11]
	mov qword [rsp+8*1065],r8
	mov qword [rsp+8*1064],r11
	mov     rsi, [rsp+8*1065]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,89
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1066],r8
	mov r8, [r11]
	mov qword [rsp+8*1068],r8
	mov qword [rsp+8*1067],r11
	mov     rsi, [rsp+8*1068]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1020], rax
	mov r8,  [rsp+8*1020]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*1069],r9
	mov rdi,[rsp+8*1069] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1070],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*1071],r11
	mov r11,68
	mov qword [rsp+8*1072],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*1073],r10
	mov r10, [r8]
	mov qword [rsp+8*1074],r8
	mov qword [rsp+8*1075],r10
	mov     rsi, [rsp+8*1075]
	mov     rdi, [rsp+8*1072]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1077],r8
	mov r8, [r11]
	mov qword [rsp+8*1079],r8
	mov qword [rsp+8*1078],r11
	mov     rsi, [rsp+8*1079]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1080],r8
	mov r8, [r11]
	mov qword [rsp+8*1082],r8
	mov qword [rsp+8*1081],r11
	mov     rsi, [rsp+8*1082]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1083],r8
	mov r8, [r11]
	mov qword [rsp+8*1085],r8
	mov qword [rsp+8*1084],r11
	mov     rsi, [rsp+8*1085]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,27
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1086],r8
	mov r8, [r11]
	mov qword [rsp+8*1088],r8
	mov qword [rsp+8*1087],r11
	mov     rsi, [rsp+8*1088]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1089],r8
	mov r8, [r11]
	mov qword [rsp+8*1091],r8
	mov qword [rsp+8*1090],r11
	mov     rsi, [rsp+8*1091]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,24
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1092],r8
	mov r8, [r11]
	mov qword [rsp+8*1094],r8
	mov qword [rsp+8*1093],r11
	mov     rsi, [rsp+8*1094]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1095],r8
	mov r8, [r11]
	mov qword [rsp+8*1097],r8
	mov qword [rsp+8*1096],r11
	mov     rsi, [rsp+8*1097]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1098],r8
	mov r8, [r11]
	mov qword [rsp+8*1100],r8
	mov qword [rsp+8*1099],r11
	mov     rsi, [rsp+8*1100]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,67
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1101],r8
	mov r8, [r11]
	mov qword [rsp+8*1103],r8
	mov qword [rsp+8*1102],r11
	mov     rsi, [rsp+8*1103]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1104],r8
	mov r8, [r11]
	mov qword [rsp+8*1106],r8
	mov qword [rsp+8*1105],r11
	mov     rsi, [rsp+8*1106]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,83
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1107],r8
	mov r8, [r11]
	mov qword [rsp+8*1109],r8
	mov qword [rsp+8*1108],r11
	mov     rsi, [rsp+8*1109]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1110],r8
	mov r8, [r11]
	mov qword [rsp+8*1112],r8
	mov qword [rsp+8*1111],r11
	mov     rsi, [rsp+8*1112]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1113],r8
	mov r8, [r11]
	mov qword [rsp+8*1115],r8
	mov qword [rsp+8*1114],r11
	mov     rsi, [rsp+8*1115]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1116],r8
	mov r8, [r11]
	mov qword [rsp+8*1118],r8
	mov qword [rsp+8*1117],r11
	mov     rsi, [rsp+8*1118]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1119],r8
	mov r8, [r11]
	mov qword [rsp+8*1121],r8
	mov qword [rsp+8*1120],r11
	mov     rsi, [rsp+8*1121]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,58
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1122],r8
	mov r8, [r11]
	mov qword [rsp+8*1124],r8
	mov qword [rsp+8*1123],r11
	mov     rsi, [rsp+8*1124]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,10
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1125],r8
	mov r8, [r11]
	mov qword [rsp+8*1127],r8
	mov qword [rsp+8*1126],r11
	mov     rsi, [rsp+8*1127]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,66
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1128],r8
	mov r8, [r11]
	mov qword [rsp+8*1130],r8
	mov qword [rsp+8*1129],r11
	mov     rsi, [rsp+8*1130]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1131],r8
	mov r8, [r11]
	mov qword [rsp+8*1133],r8
	mov qword [rsp+8*1132],r11
	mov     rsi, [rsp+8*1133]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1134],r8
	mov r8, [r11]
	mov qword [rsp+8*1136],r8
	mov qword [rsp+8*1135],r11
	mov     rsi, [rsp+8*1136]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1137],r8
	mov r8, [r11]
	mov qword [rsp+8*1139],r8
	mov qword [rsp+8*1138],r11
	mov     rsi, [rsp+8*1139]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1140],r8
	mov r8, [r11]
	mov qword [rsp+8*1142],r8
	mov qword [rsp+8*1141],r11
	mov     rsi, [rsp+8*1142]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1143],r8
	mov r8, [r11]
	mov qword [rsp+8*1145],r8
	mov qword [rsp+8*1144],r11
	mov     rsi, [rsp+8*1145]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1146],r8
	mov r8, [r11]
	mov qword [rsp+8*1148],r8
	mov qword [rsp+8*1147],r11
	mov     rsi, [rsp+8*1148]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1149],r8
	mov r8, [r11]
	mov qword [rsp+8*1151],r8
	mov qword [rsp+8*1150],r11
	mov     rsi, [rsp+8*1151]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,10
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1152],r8
	mov r8, [r11]
	mov qword [rsp+8*1154],r8
	mov qword [rsp+8*1153],r11
	mov     rsi, [rsp+8*1154]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,59
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1155],r8
	mov r8, [r11]
	mov qword [rsp+8*1157],r8
	mov qword [rsp+8*1156],r11
	mov     rsi, [rsp+8*1157]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1158],r8
	mov r8, [r11]
	mov qword [rsp+8*1160],r8
	mov qword [rsp+8*1159],r11
	mov     rsi, [rsp+8*1160]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1161],r8
	mov r8, [r11]
	mov qword [rsp+8*1163],r8
	mov qword [rsp+8*1162],r11
	mov     rsi, [rsp+8*1163]
	mov     rdi, [rsp+8*1076]
	call    concat
	mov [rsp+8*1076], rax
	mov r8,  [rsp+8*1076]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*1164],r9
	mov rdi,[rsp+8*1164] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1165],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*1166],r11
	mov r11,67
	mov qword [rsp+8*1167],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*1168],r10
	mov r10, [r8]
	mov qword [rsp+8*1169],r8
	mov qword [rsp+8*1170],r10
	mov     rsi, [rsp+8*1170]
	mov     rdi, [rsp+8*1167]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1172],r8
	mov r8, [r11]
	mov qword [rsp+8*1174],r8
	mov qword [rsp+8*1173],r11
	mov     rsi, [rsp+8*1174]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,83
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1175],r8
	mov r8, [r11]
	mov qword [rsp+8*1177],r8
	mov qword [rsp+8*1176],r11
	mov     rsi, [rsp+8*1177]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1178],r8
	mov r8, [r11]
	mov qword [rsp+8*1180],r8
	mov qword [rsp+8*1179],r11
	mov     rsi, [rsp+8*1180]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1181],r8
	mov r8, [r11]
	mov qword [rsp+8*1183],r8
	mov qword [rsp+8*1182],r11
	mov     rsi, [rsp+8*1183]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1184],r8
	mov r8, [r11]
	mov qword [rsp+8*1186],r8
	mov qword [rsp+8*1185],r11
	mov     rsi, [rsp+8*1186]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1187],r8
	mov r8, [r11]
	mov qword [rsp+8*1189],r8
	mov qword [rsp+8*1188],r11
	mov     rsi, [rsp+8*1189]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,58
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1190],r8
	mov r8, [r11]
	mov qword [rsp+8*1192],r8
	mov qword [rsp+8*1191],r11
	mov     rsi, [rsp+8*1192]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,10
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1193],r8
	mov r8, [r11]
	mov qword [rsp+8*1195],r8
	mov qword [rsp+8*1194],r11
	mov     rsi, [rsp+8*1195]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,66
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1196],r8
	mov r8, [r11]
	mov qword [rsp+8*1198],r8
	mov qword [rsp+8*1197],r11
	mov     rsi, [rsp+8*1198]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1199],r8
	mov r8, [r11]
	mov qword [rsp+8*1201],r8
	mov qword [rsp+8*1200],r11
	mov     rsi, [rsp+8*1201]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1202],r8
	mov r8, [r11]
	mov qword [rsp+8*1204],r8
	mov qword [rsp+8*1203],r11
	mov     rsi, [rsp+8*1204]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1205],r8
	mov r8, [r11]
	mov qword [rsp+8*1207],r8
	mov qword [rsp+8*1206],r11
	mov     rsi, [rsp+8*1207]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1208],r8
	mov r8, [r11]
	mov qword [rsp+8*1210],r8
	mov qword [rsp+8*1209],r11
	mov     rsi, [rsp+8*1210]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1211],r8
	mov r8, [r11]
	mov qword [rsp+8*1213],r8
	mov qword [rsp+8*1212],r11
	mov     rsi, [rsp+8*1213]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1214],r8
	mov r8, [r11]
	mov qword [rsp+8*1216],r8
	mov qword [rsp+8*1215],r11
	mov     rsi, [rsp+8*1216]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,14
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1217],r8
	mov r8, [r11]
	mov qword [rsp+8*1219],r8
	mov qword [rsp+8*1218],r11
	mov     rsi, [rsp+8*1219]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,16
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1220],r8
	mov r8, [r11]
	mov qword [rsp+8*1222],r8
	mov qword [rsp+8*1221],r11
	mov     rsi, [rsp+8*1222]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,15
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1223],r8
	mov r8, [r11]
	mov qword [rsp+8*1225],r8
	mov qword [rsp+8*1224],r11
	mov     rsi, [rsp+8*1225]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1226],r8
	mov r8, [r11]
	mov qword [rsp+8*1228],r8
	mov qword [rsp+8*1227],r11
	mov     rsi, [rsp+8*1228]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,10
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1229],r8
	mov r8, [r11]
	mov qword [rsp+8*1231],r8
	mov qword [rsp+8*1230],r11
	mov     rsi, [rsp+8*1231]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,66
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1232],r8
	mov r8, [r11]
	mov qword [rsp+8*1234],r8
	mov qword [rsp+8*1233],r11
	mov     rsi, [rsp+8*1234]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1235],r8
	mov r8, [r11]
	mov qword [rsp+8*1237],r8
	mov qword [rsp+8*1236],r11
	mov     rsi, [rsp+8*1237]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1238],r8
	mov r8, [r11]
	mov qword [rsp+8*1240],r8
	mov qword [rsp+8*1239],r11
	mov     rsi, [rsp+8*1240]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1241],r8
	mov r8, [r11]
	mov qword [rsp+8*1243],r8
	mov qword [rsp+8*1242],r11
	mov     rsi, [rsp+8*1243]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1244],r8
	mov r8, [r11]
	mov qword [rsp+8*1246],r8
	mov qword [rsp+8*1245],r11
	mov     rsi, [rsp+8*1246]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1247],r8
	mov r8, [r11]
	mov qword [rsp+8*1249],r8
	mov qword [rsp+8*1248],r11
	mov     rsi, [rsp+8*1249]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1250],r8
	mov r8, [r11]
	mov qword [rsp+8*1252],r8
	mov qword [rsp+8*1251],r11
	mov     rsi, [rsp+8*1252]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,4
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1253],r8
	mov r8, [r11]
	mov qword [rsp+8*1255],r8
	mov qword [rsp+8*1254],r11
	mov     rsi, [rsp+8*1255]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,16
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1256],r8
	mov r8, [r11]
	mov qword [rsp+8*1258],r8
	mov qword [rsp+8*1257],r11
	mov     rsi, [rsp+8*1258]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,15
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1259],r8
	mov r8, [r11]
	mov qword [rsp+8*1261],r8
	mov qword [rsp+8*1260],r11
	mov     rsi, [rsp+8*1261]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1262],r8
	mov r8, [r11]
	mov qword [rsp+8*1264],r8
	mov qword [rsp+8*1263],r11
	mov     rsi, [rsp+8*1264]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,10
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1265],r8
	mov r8, [r11]
	mov qword [rsp+8*1267],r8
	mov qword [rsp+8*1266],r11
	mov     rsi, [rsp+8*1267]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,59
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1268],r8
	mov r8, [r11]
	mov qword [rsp+8*1270],r8
	mov qword [rsp+8*1269],r11
	mov     rsi, [rsp+8*1270]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1271],r8
	mov r8, [r11]
	mov qword [rsp+8*1273],r8
	mov qword [rsp+8*1272],r11
	mov     rsi, [rsp+8*1273]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1274],r8
	mov r8, [r11]
	mov qword [rsp+8*1276],r8
	mov qword [rsp+8*1275],r11
	mov     rsi, [rsp+8*1276]
	mov     rdi, [rsp+8*1171]
	call    concat
	mov [rsp+8*1171], rax
	mov r8,  [rsp+8*1171]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*1277],r9
	mov rdi,[rsp+8*1277] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,91
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1278],r8
	mov r8, [r11]
	mov rdi,r8
	mov qword [rsp+8*1280],r8
	mov r8,rdi
	mov qword [rsp+8*1281],r8
	mov qword [rsp+8*1279],r11
	mov rdi,[rsp+8*1281] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1282],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*1283],r11
	mov r11,82
	mov qword [rsp+8*1284],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*1285],r10
	mov r10, [r8]
	mov qword [rsp+8*1286],r8
	mov qword [rsp+8*1287],r10
	mov     rsi, [rsp+8*1287]
	mov     rdi, [rsp+8*1284]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1289],r8
	mov r8, [r11]
	mov qword [rsp+8*1291],r8
	mov qword [rsp+8*1290],r11
	mov     rsi, [rsp+8*1291]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1292],r8
	mov r8, [r11]
	mov qword [rsp+8*1294],r8
	mov qword [rsp+8*1293],r11
	mov     rsi, [rsp+8*1294]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1295],r8
	mov r8, [r11]
	mov qword [rsp+8*1297],r8
	mov qword [rsp+8*1296],r11
	mov     rsi, [rsp+8*1297]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1298],r8
	mov r8, [r11]
	mov qword [rsp+8*1300],r8
	mov qword [rsp+8*1299],r11
	mov     rsi, [rsp+8*1300]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1301],r8
	mov r8, [r11]
	mov qword [rsp+8*1303],r8
	mov qword [rsp+8*1302],r11
	mov     rsi, [rsp+8*1303]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,65
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1304],r8
	mov r8, [r11]
	mov qword [rsp+8*1306],r8
	mov qword [rsp+8*1305],r11
	mov     rsi, [rsp+8*1306]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,17
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1307],r8
	mov r8, [r11]
	mov qword [rsp+8*1309],r8
	mov qword [rsp+8*1308],r11
	mov     rsi, [rsp+8*1309]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1310],r8
	mov r8, [r11]
	mov qword [rsp+8*1312],r8
	mov qword [rsp+8*1311],r11
	mov     rsi, [rsp+8*1312]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1313],r8
	mov r8, [r11]
	mov qword [rsp+8*1315],r8
	mov qword [rsp+8*1314],r11
	mov     rsi, [rsp+8*1315]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1316],r8
	mov r8, [r11]
	mov qword [rsp+8*1318],r8
	mov qword [rsp+8*1317],r11
	mov     rsi, [rsp+8*1318]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1319],r8
	mov r8, [r11]
	mov qword [rsp+8*1321],r8
	mov qword [rsp+8*1320],r11
	mov     rsi, [rsp+8*1321]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1322],r8
	mov r8, [r11]
	mov qword [rsp+8*1324],r8
	mov qword [rsp+8*1323],r11
	mov     rsi, [rsp+8*1324]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,65
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1325],r8
	mov r8, [r11]
	mov qword [rsp+8*1327],r8
	mov qword [rsp+8*1326],r11
	mov     rsi, [rsp+8*1327]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,65
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1328],r8
	mov r8, [r11]
	mov qword [rsp+8*1330],r8
	mov qword [rsp+8*1329],r11
	mov     rsi, [rsp+8*1330]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1331],r8
	mov r8, [r11]
	mov qword [rsp+8*1333],r8
	mov qword [rsp+8*1332],r11
	mov     rsi, [rsp+8*1333]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,89
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1334],r8
	mov r8, [r11]
	mov qword [rsp+8*1336],r8
	mov qword [rsp+8*1335],r11
	mov     rsi, [rsp+8*1336]
	mov     rdi, [rsp+8*1288]
	call    concat
	mov [rsp+8*1288], rax
	mov r8,  [rsp+8*1288]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*1337],r9
	mov rdi,[rsp+8*1337] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1338],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*1339],r11
	mov r11,68
	mov qword [rsp+8*1340],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*1341],r10
	mov r10, [r8]
	mov qword [rsp+8*1342],r8
	mov qword [rsp+8*1343],r10
	mov     rsi, [rsp+8*1343]
	mov     rdi, [rsp+8*1340]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1345],r8
	mov r8, [r11]
	mov qword [rsp+8*1347],r8
	mov qword [rsp+8*1346],r11
	mov     rsi, [rsp+8*1347]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,65
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1348],r8
	mov r8, [r11]
	mov qword [rsp+8*1350],r8
	mov qword [rsp+8*1349],r11
	mov     rsi, [rsp+8*1350]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,65
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1351],r8
	mov r8, [r11]
	mov qword [rsp+8*1353],r8
	mov qword [rsp+8*1352],r11
	mov     rsi, [rsp+8*1353]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,27
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1354],r8
	mov r8, [r11]
	mov qword [rsp+8*1356],r8
	mov qword [rsp+8*1355],r11
	mov     rsi, [rsp+8*1356]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1357],r8
	mov r8, [r11]
	mov qword [rsp+8*1359],r8
	mov qword [rsp+8*1358],r11
	mov     rsi, [rsp+8*1359]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,24
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1360],r8
	mov r8, [r11]
	mov qword [rsp+8*1362],r8
	mov qword [rsp+8*1361],r11
	mov     rsi, [rsp+8*1362]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1363],r8
	mov r8, [r11]
	mov qword [rsp+8*1365],r8
	mov qword [rsp+8*1364],r11
	mov     rsi, [rsp+8*1365]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1366],r8
	mov r8, [r11]
	mov qword [rsp+8*1368],r8
	mov qword [rsp+8*1367],r11
	mov     rsi, [rsp+8*1368]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,67
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1369],r8
	mov r8, [r11]
	mov qword [rsp+8*1371],r8
	mov qword [rsp+8*1370],r11
	mov     rsi, [rsp+8*1371]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1372],r8
	mov r8, [r11]
	mov qword [rsp+8*1374],r8
	mov qword [rsp+8*1373],r11
	mov     rsi, [rsp+8*1374]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,83
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1375],r8
	mov r8, [r11]
	mov qword [rsp+8*1377],r8
	mov qword [rsp+8*1376],r11
	mov     rsi, [rsp+8*1377]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1378],r8
	mov r8, [r11]
	mov qword [rsp+8*1380],r8
	mov qword [rsp+8*1379],r11
	mov     rsi, [rsp+8*1380]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1381],r8
	mov r8, [r11]
	mov qword [rsp+8*1383],r8
	mov qword [rsp+8*1382],r11
	mov     rsi, [rsp+8*1383]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1384],r8
	mov r8, [r11]
	mov qword [rsp+8*1386],r8
	mov qword [rsp+8*1385],r11
	mov     rsi, [rsp+8*1386]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,65
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1387],r8
	mov r8, [r11]
	mov qword [rsp+8*1389],r8
	mov qword [rsp+8*1388],r11
	mov     rsi, [rsp+8*1389]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,58
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1390],r8
	mov r8, [r11]
	mov qword [rsp+8*1392],r8
	mov qword [rsp+8*1391],r11
	mov     rsi, [rsp+8*1392]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,10
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1393],r8
	mov r8, [r11]
	mov qword [rsp+8*1395],r8
	mov qword [rsp+8*1394],r11
	mov     rsi, [rsp+8*1395]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,66
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1396],r8
	mov r8, [r11]
	mov qword [rsp+8*1398],r8
	mov qword [rsp+8*1397],r11
	mov     rsi, [rsp+8*1398]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1399],r8
	mov r8, [r11]
	mov qword [rsp+8*1401],r8
	mov qword [rsp+8*1400],r11
	mov     rsi, [rsp+8*1401]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1402],r8
	mov r8, [r11]
	mov qword [rsp+8*1404],r8
	mov qword [rsp+8*1403],r11
	mov     rsi, [rsp+8*1404]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1405],r8
	mov r8, [r11]
	mov qword [rsp+8*1407],r8
	mov qword [rsp+8*1406],r11
	mov     rsi, [rsp+8*1407]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1408],r8
	mov r8, [r11]
	mov qword [rsp+8*1410],r8
	mov qword [rsp+8*1409],r11
	mov     rsi, [rsp+8*1410]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,65
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1411],r8
	mov r8, [r11]
	mov qword [rsp+8*1413],r8
	mov qword [rsp+8*1412],r11
	mov     rsi, [rsp+8*1413]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,65
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1414],r8
	mov r8, [r11]
	mov qword [rsp+8*1416],r8
	mov qword [rsp+8*1415],r11
	mov     rsi, [rsp+8*1416]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1417],r8
	mov r8, [r11]
	mov qword [rsp+8*1419],r8
	mov qword [rsp+8*1418],r11
	mov     rsi, [rsp+8*1419]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,10
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1420],r8
	mov r8, [r11]
	mov qword [rsp+8*1422],r8
	mov qword [rsp+8*1421],r11
	mov     rsi, [rsp+8*1422]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,59
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1423],r8
	mov r8, [r11]
	mov qword [rsp+8*1425],r8
	mov qword [rsp+8*1424],r11
	mov     rsi, [rsp+8*1425]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1426],r8
	mov r8, [r11]
	mov qword [rsp+8*1428],r8
	mov qword [rsp+8*1427],r11
	mov     rsi, [rsp+8*1428]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1429],r8
	mov r8, [r11]
	mov qword [rsp+8*1431],r8
	mov qword [rsp+8*1430],r11
	mov     rsi, [rsp+8*1431]
	mov     rdi, [rsp+8*1344]
	call    concat
	mov [rsp+8*1344], rax
	mov r8,  [rsp+8*1344]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*1432],r9
	mov rdi,[rsp+8*1432] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1433],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*1434],r11
	mov r11,67
	mov qword [rsp+8*1435],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*1436],r10
	mov r10, [r8]
	mov qword [rsp+8*1437],r8
	mov qword [rsp+8*1438],r10
	mov     rsi, [rsp+8*1438]
	mov     rdi, [rsp+8*1435]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1440],r8
	mov r8, [r11]
	mov qword [rsp+8*1442],r8
	mov qword [rsp+8*1441],r11
	mov     rsi, [rsp+8*1442]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,83
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1443],r8
	mov r8, [r11]
	mov qword [rsp+8*1445],r8
	mov qword [rsp+8*1444],r11
	mov     rsi, [rsp+8*1445]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1446],r8
	mov r8, [r11]
	mov qword [rsp+8*1448],r8
	mov qword [rsp+8*1447],r11
	mov     rsi, [rsp+8*1448]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1449],r8
	mov r8, [r11]
	mov qword [rsp+8*1451],r8
	mov qword [rsp+8*1450],r11
	mov     rsi, [rsp+8*1451]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1452],r8
	mov r8, [r11]
	mov qword [rsp+8*1454],r8
	mov qword [rsp+8*1453],r11
	mov     rsi, [rsp+8*1454]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,65
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1455],r8
	mov r8, [r11]
	mov qword [rsp+8*1457],r8
	mov qword [rsp+8*1456],r11
	mov     rsi, [rsp+8*1457]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,58
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1458],r8
	mov r8, [r11]
	mov qword [rsp+8*1460],r8
	mov qword [rsp+8*1459],r11
	mov     rsi, [rsp+8*1460]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,10
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1461],r8
	mov r8, [r11]
	mov qword [rsp+8*1463],r8
	mov qword [rsp+8*1462],r11
	mov     rsi, [rsp+8*1463]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,66
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1464],r8
	mov r8, [r11]
	mov qword [rsp+8*1466],r8
	mov qword [rsp+8*1465],r11
	mov     rsi, [rsp+8*1466]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1467],r8
	mov r8, [r11]
	mov qword [rsp+8*1469],r8
	mov qword [rsp+8*1468],r11
	mov     rsi, [rsp+8*1469]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1470],r8
	mov r8, [r11]
	mov qword [rsp+8*1472],r8
	mov qword [rsp+8*1471],r11
	mov     rsi, [rsp+8*1472]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1473],r8
	mov r8, [r11]
	mov qword [rsp+8*1475],r8
	mov qword [rsp+8*1474],r11
	mov     rsi, [rsp+8*1475]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1476],r8
	mov r8, [r11]
	mov qword [rsp+8*1478],r8
	mov qword [rsp+8*1477],r11
	mov     rsi, [rsp+8*1478]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,65
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1479],r8
	mov r8, [r11]
	mov qword [rsp+8*1481],r8
	mov qword [rsp+8*1480],r11
	mov     rsi, [rsp+8*1481]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,65
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1482],r8
	mov r8, [r11]
	mov qword [rsp+8*1484],r8
	mov qword [rsp+8*1483],r11
	mov     rsi, [rsp+8*1484]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,14
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1485],r8
	mov r8, [r11]
	mov qword [rsp+8*1487],r8
	mov qword [rsp+8*1486],r11
	mov     rsi, [rsp+8*1487]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,16
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1488],r8
	mov r8, [r11]
	mov qword [rsp+8*1490],r8
	mov qword [rsp+8*1489],r11
	mov     rsi, [rsp+8*1490]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,15
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1491],r8
	mov r8, [r11]
	mov qword [rsp+8*1493],r8
	mov qword [rsp+8*1492],r11
	mov     rsi, [rsp+8*1493]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1494],r8
	mov r8, [r11]
	mov qword [rsp+8*1496],r8
	mov qword [rsp+8*1495],r11
	mov     rsi, [rsp+8*1496]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,10
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1497],r8
	mov r8, [r11]
	mov qword [rsp+8*1499],r8
	mov qword [rsp+8*1498],r11
	mov     rsi, [rsp+8*1499]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,66
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1500],r8
	mov r8, [r11]
	mov qword [rsp+8*1502],r8
	mov qword [rsp+8*1501],r11
	mov     rsi, [rsp+8*1502]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1503],r8
	mov r8, [r11]
	mov qword [rsp+8*1505],r8
	mov qword [rsp+8*1504],r11
	mov     rsi, [rsp+8*1505]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1506],r8
	mov r8, [r11]
	mov qword [rsp+8*1508],r8
	mov qword [rsp+8*1507],r11
	mov     rsi, [rsp+8*1508]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,82
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1509],r8
	mov r8, [r11]
	mov qword [rsp+8*1511],r8
	mov qword [rsp+8*1510],r11
	mov     rsi, [rsp+8*1511]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,7
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1512],r8
	mov r8, [r11]
	mov qword [rsp+8*1514],r8
	mov qword [rsp+8*1513],r11
	mov     rsi, [rsp+8*1514]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,65
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1515],r8
	mov r8, [r11]
	mov qword [rsp+8*1517],r8
	mov qword [rsp+8*1516],r11
	mov     rsi, [rsp+8*1517]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,65
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1518],r8
	mov r8, [r11]
	mov qword [rsp+8*1520],r8
	mov qword [rsp+8*1519],r11
	mov     rsi, [rsp+8*1520]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,4
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1521],r8
	mov r8, [r11]
	mov qword [rsp+8*1523],r8
	mov qword [rsp+8*1522],r11
	mov     rsi, [rsp+8*1523]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,16
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1524],r8
	mov r8, [r11]
	mov qword [rsp+8*1526],r8
	mov qword [rsp+8*1525],r11
	mov     rsi, [rsp+8*1526]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,15
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1527],r8
	mov r8, [r11]
	mov qword [rsp+8*1529],r8
	mov qword [rsp+8*1528],r11
	mov     rsi, [rsp+8*1529]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,8
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1530],r8
	mov r8, [r11]
	mov qword [rsp+8*1532],r8
	mov qword [rsp+8*1531],r11
	mov     rsi, [rsp+8*1532]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,10
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1533],r8
	mov r8, [r11]
	mov qword [rsp+8*1535],r8
	mov qword [rsp+8*1534],r11
	mov     rsi, [rsp+8*1535]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,59
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1536],r8
	mov r8, [r11]
	mov qword [rsp+8*1538],r8
	mov qword [rsp+8*1537],r11
	mov     rsi, [rsp+8*1538]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1539],r8
	mov r8, [r11]
	mov qword [rsp+8*1541],r8
	mov qword [rsp+8*1540],r11
	mov     rsi, [rsp+8*1541]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1542],r8
	mov r8, [r11]
	mov qword [rsp+8*1544],r8
	mov qword [rsp+8*1543],r11
	mov     rsi, [rsp+8*1544]
	mov     rdi, [rsp+8*1439]
	call    concat
	mov [rsp+8*1439], rax
	mov r8,  [rsp+8*1439]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*1545],r9
	mov rdi,[rsp+8*1545] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,91
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1546],r8
	mov r8, [r11]
	mov rdi,r8
	mov qword [rsp+8*1548],r8
	mov r8,rdi
	mov qword [rsp+8*1549],r8
	mov qword [rsp+8*1547],r11
	mov rdi,[rsp+8*1549] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1550],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*1551],r11
	mov r11,82
	mov qword [rsp+8*1552],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*1553],r10
	mov r10, [r8]
	mov qword [rsp+8*1554],r8
	mov qword [rsp+8*1555],r10
	mov     rsi, [rsp+8*1555]
	mov     rdi, [rsp+8*1552]
	call    concat
	mov [rsp+8*1556], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1557],r8
	mov r8, [r11]
	mov qword [rsp+8*1559],r8
	mov qword [rsp+8*1558],r11
	mov     rsi, [rsp+8*1559]
	mov     rdi, [rsp+8*1556]
	call    concat
	mov [rsp+8*1556], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1560],r8
	mov r8, [r11]
	mov qword [rsp+8*1562],r8
	mov qword [rsp+8*1561],r11
	mov     rsi, [rsp+8*1562]
	mov     rdi, [rsp+8*1556]
	call    concat
	mov [rsp+8*1556], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1563],r8
	mov r8, [r11]
	mov qword [rsp+8*1565],r8
	mov qword [rsp+8*1564],r11
	mov     rsi, [rsp+8*1565]
	mov     rdi, [rsp+8*1556]
	call    concat
	mov [rsp+8*1556], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1566],r8
	mov r8, [r11]
	mov qword [rsp+8*1568],r8
	mov qword [rsp+8*1567],r11
	mov     rsi, [rsp+8*1568]
	mov     rdi, [rsp+8*1556]
	call    concat
	mov [rsp+8*1556], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1569],r8
	mov r8, [r11]
	mov qword [rsp+8*1571],r8
	mov qword [rsp+8*1570],r11
	mov     rsi, [rsp+8*1571]
	mov     rdi, [rsp+8*1556]
	call    concat
	mov [rsp+8*1556], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,65
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1572],r8
	mov r8, [r11]
	mov qword [rsp+8*1574],r8
	mov qword [rsp+8*1573],r11
	mov     rsi, [rsp+8*1574]
	mov     rdi, [rsp+8*1556]
	call    concat
	mov [rsp+8*1556], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,77
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1575],r8
	mov r8, [r11]
	mov qword [rsp+8*1577],r8
	mov qword [rsp+8*1576],r11
	mov     rsi, [rsp+8*1577]
	mov     rdi, [rsp+8*1556]
	call    concat
	mov [rsp+8*1556], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1578],r8
	mov r8, [r11]
	mov qword [rsp+8*1580],r8
	mov qword [rsp+8*1579],r11
	mov     rsi, [rsp+8*1580]
	mov     rdi, [rsp+8*1556]
	call    concat
	mov [rsp+8*1556], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1556]
	call    concat
	mov [rsp+8*1556], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1581],r8
	mov r8, [r11]
	mov qword [rsp+8*1583],r8
	mov qword [rsp+8*1582],r11
	mov     rsi, [rsp+8*1583]
	mov     rdi, [rsp+8*1556]
	call    concat
	mov [rsp+8*1556], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1556]
	call    concat
	mov [rsp+8*1556], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1584],r8
	mov r8, [r11]
	mov qword [rsp+8*1586],r8
	mov qword [rsp+8*1585],r11
	mov     rsi, [rsp+8*1586]
	mov     rdi, [rsp+8*1556]
	call    concat
	mov [rsp+8*1556], rax
	mov r8,  [rsp+8*1556]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*1587],r9
	mov rdi,[rsp+8*1587] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1588],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*1589],r11
	mov r11,82
	mov qword [rsp+8*1590],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*1591],r10
	mov r10, [r8]
	mov qword [rsp+8*1592],r8
	mov qword [rsp+8*1593],r10
	mov     rsi, [rsp+8*1593]
	mov     rdi, [rsp+8*1590]
	call    concat
	mov [rsp+8*1594], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1595],r8
	mov r8, [r11]
	mov qword [rsp+8*1597],r8
	mov qword [rsp+8*1596],r11
	mov     rsi, [rsp+8*1597]
	mov     rdi, [rsp+8*1594]
	call    concat
	mov [rsp+8*1594], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1598],r8
	mov r8, [r11]
	mov qword [rsp+8*1600],r8
	mov qword [rsp+8*1599],r11
	mov     rsi, [rsp+8*1600]
	mov     rdi, [rsp+8*1594]
	call    concat
	mov [rsp+8*1594], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1601],r8
	mov r8, [r11]
	mov qword [rsp+8*1603],r8
	mov qword [rsp+8*1602],r11
	mov     rsi, [rsp+8*1603]
	mov     rdi, [rsp+8*1594]
	call    concat
	mov [rsp+8*1594], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1604],r8
	mov r8, [r11]
	mov qword [rsp+8*1606],r8
	mov qword [rsp+8*1605],r11
	mov     rsi, [rsp+8*1606]
	mov     rdi, [rsp+8*1594]
	call    concat
	mov [rsp+8*1594], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1607],r8
	mov r8, [r11]
	mov qword [rsp+8*1609],r8
	mov qword [rsp+8*1608],r11
	mov     rsi, [rsp+8*1609]
	mov     rdi, [rsp+8*1594]
	call    concat
	mov [rsp+8*1594], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,63
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1610],r8
	mov r8, [r11]
	mov qword [rsp+8*1612],r8
	mov qword [rsp+8*1611],r11
	mov     rsi, [rsp+8*1612]
	mov     rdi, [rsp+8*1594]
	call    concat
	mov [rsp+8*1594], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,17
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1613],r8
	mov r8, [r11]
	mov qword [rsp+8*1615],r8
	mov qword [rsp+8*1614],r11
	mov     rsi, [rsp+8*1615]
	mov     rdi, [rsp+8*1594]
	call    concat
	mov [rsp+8*1594], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,79
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1616],r8
	mov r8, [r11]
	mov qword [rsp+8*1618],r8
	mov qword [rsp+8*1617],r11
	mov     rsi, [rsp+8*1618]
	mov     rdi, [rsp+8*1594]
	call    concat
	mov [rsp+8*1594], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1619],r8
	mov r8, [r11]
	mov qword [rsp+8*1621],r8
	mov qword [rsp+8*1620],r11
	mov     rsi, [rsp+8*1621]
	mov     rdi, [rsp+8*1594]
	call    concat
	mov [rsp+8*1594], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1594]
	call    concat
	mov [rsp+8*1594], rax
	mov     rsi, [gbl+8*1622]
	mov     rdi, [rsp+8*1594]
	call    concat
	mov [rsp+8*1594], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1594]
	call    concat
	mov [rsp+8*1594], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1594]
	call    concat
	mov [rsp+8*1594], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1623],r8
	mov r8, [r11]
	mov qword [rsp+8*1625],r8
	mov qword [rsp+8*1624],r11
	mov     rsi, [rsp+8*1625]
	mov     rdi, [rsp+8*1594]
	call    concat
	mov [rsp+8*1594], rax
	mov r8,  [rsp+8*1594]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*1626],r9
	mov rdi,[rsp+8*1626] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,81
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1627],r8
	mov r8, [r11]
	mov r10,r9
	mov qword [rsp+8*1628],r11
	mov r11,82
	mov qword [rsp+8*1629],r8
	lea r8,[r10+r11*8+8H]
	mov qword [rsp+8*1630],r10
	mov r10, [r8]
	mov qword [rsp+8*1631],r8
	mov qword [rsp+8*1632],r10
	mov     rsi, [rsp+8*1632]
	mov     rdi, [rsp+8*1629]
	call    concat
	mov [rsp+8*1633], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,80
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1634],r8
	mov r8, [r11]
	mov qword [rsp+8*1636],r8
	mov qword [rsp+8*1635],r11
	mov     rsi, [rsp+8*1636]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1633], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,71
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1637],r8
	mov r8, [r11]
	mov qword [rsp+8*1639],r8
	mov qword [rsp+8*1638],r11
	mov     rsi, [rsp+8*1639]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1633], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,76
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1640],r8
	mov r8, [r11]
	mov qword [rsp+8*1642],r8
	mov qword [rsp+8*1641],r11
	mov     rsi, [rsp+8*1642]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1633], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,69
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1643],r8
	mov r8, [r11]
	mov qword [rsp+8*1645],r8
	mov qword [rsp+8*1644],r11
	mov     rsi, [rsp+8*1645]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1633], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1646],r8
	mov r8, [r11]
	mov qword [rsp+8*1648],r8
	mov qword [rsp+8*1647],r11
	mov     rsi, [rsp+8*1648]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1633], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,63
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1649],r8
	mov r8, [r11]
	mov qword [rsp+8*1651],r8
	mov qword [rsp+8*1650],r11
	mov     rsi, [rsp+8*1651]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1633], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,17
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1652],r8
	mov r8, [r11]
	mov qword [rsp+8*1654],r8
	mov qword [rsp+8*1653],r11
	mov     rsi, [rsp+8*1654]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1633], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,64
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1655],r8
	mov r8, [r11]
	mov qword [rsp+8*1657],r8
	mov qword [rsp+8*1656],r11
	mov     rsi, [rsp+8*1657]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1633], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,28
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1658],r8
	mov r8, [r11]
	mov qword [rsp+8*1660],r8
	mov qword [rsp+8*1659],r11
	mov     rsi, [rsp+8*1660]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1633], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1633], rax
	mov     rsi, [gbl+8*1622]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1633], rax
	mov     rsi, [gbl+8*1622]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1633], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1633], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,26
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1661],r8
	mov r8, [r11]
	mov qword [rsp+8*1663],r8
	mov qword [rsp+8*1662],r11
	mov     rsi, [rsp+8*1663]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1633], rax
	mov r8,  [rsp+8*1633]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*1664],r9
	mov rdi,[rsp+8*1664] 
	add rdi, 1 
	call puts
	mov r9,  [gbl+8*190]
	mov r8,r9
	mov r10,0
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1665],r8
	mov r8, [r11]
	mov rdi,r8
	mov qword [rsp+8*1667],r8
	mov r8,rdi
	mov qword [rsp+8*1668],r8
	mov qword [rsp+8*1666],r11
	mov rdi,[rsp+8*1668] 
	add rdi, 1 
	call puts
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*2],r8
	
L_2838:
	mov r8,  [rsp+8*2]
	mov r9,93
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*1669],r10
	je L_2839
	mov r8,  [rsp+8*2]
	mov rdi,r8
	mov r9,rdi
	mov r10,9
	cmp r9,r10
	mov r11, 0
	setle r11B
	cmp r11, 0
	mov qword [rsp+8*1670],r9
	mov qword [rsp+8*1671],r11
	je L_3009
	mov r8,  [rsp+8*1670]
	mov rdi,r8
	mov r9,rdi
	mov r10,0
	cmp r9,r10
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*1672],r9
	mov qword [rsp+8*1673],r11
	je L_3010
	mov r9,t66
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3012
	
L_3010:
	mov r8,  [rsp+8*1672]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1675],r10
	je L_3013
	mov r9,t69
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3012
	
L_3013:
	mov r8,  [rsp+8*1672]
	mov r9,2
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1676],r10
	je L_3014
	mov r9,t72
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3012
	
L_3014:
	mov r8,  [rsp+8*1672]
	mov r9,3
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1677],r10
	je L_3015
	mov r9,t75
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3012
	
L_3015:
	mov r8,  [rsp+8*1672]
	mov r9,4
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1678],r10
	je L_3016
	mov r9,t78
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3012
	
L_3016:
	mov r8,  [rsp+8*1672]
	mov r9,5
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1679],r10
	je L_3017
	mov r9,t81
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3012
	
L_3017:
	mov r8,  [rsp+8*1672]
	mov r9,6
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1680],r10
	je L_3018
	mov r9,t84
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3012
	
L_3018:
	mov r8,  [rsp+8*1672]
	mov r9,7
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1681],r10
	je L_3019
	mov r9,t87
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3012
	
L_3019:
	mov r8,  [rsp+8*1672]
	mov r9,8
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1682],r10
	je L_3020
	mov r9,t90
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3012
	
L_3020:
	mov r8,  [rsp+8*1672]
	mov r9,9
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1683],r10
	je L_3021
	mov r9,t93
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3012
	
L_3021:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*1674],r8
	
L_3012:
	mov r9,  [rsp+8*1674]
	mov r8,r9
	mov qword [rsp+8*1684],r8
	mov     rsi, [rsp+8*1684]
	mov     rdi, t122
	call    concat
	mov [rsp+8*1685], rax
	mov     rsi, t126
	mov     rdi, [rsp+8*1685]
	call    concat
	mov [rsp+8*1685], rax
	mov r9,  [rsp+8*1685]
	mov r8,r9
	mov qword [rsp+8*1686],r8
	jmp L_3023
	
L_3009:
	xor rdx, rdx
	mov r8,  [rsp+8*1670]
	mov rax, r8
	mov r9,10
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rax
	mov rdi,r10
	mov r11,rdi
	mov r9,0
	cmp r11,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1673],r10
	mov qword [rsp+8*1672],r11
	je L_3024
	mov r9,t66
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3026
	
L_3024:
	mov r8,  [rsp+8*1672]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1675],r10
	je L_3027
	mov r9,t69
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3026
	
L_3027:
	mov r8,  [rsp+8*1672]
	mov r9,2
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1676],r10
	je L_3028
	mov r9,t72
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3026
	
L_3028:
	mov r8,  [rsp+8*1672]
	mov r9,3
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1677],r10
	je L_3029
	mov r9,t75
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3026
	
L_3029:
	mov r8,  [rsp+8*1672]
	mov r9,4
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1678],r10
	je L_3030
	mov r9,t78
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3026
	
L_3030:
	mov r8,  [rsp+8*1672]
	mov r9,5
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1679],r10
	je L_3031
	mov r9,t81
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3026
	
L_3031:
	mov r8,  [rsp+8*1672]
	mov r9,6
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1680],r10
	je L_3032
	mov r9,t84
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3026
	
L_3032:
	mov r8,  [rsp+8*1672]
	mov r9,7
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1681],r10
	je L_3033
	mov r9,t87
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3026
	
L_3033:
	mov r8,  [rsp+8*1672]
	mov r9,8
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1682],r10
	je L_3034
	mov r9,t90
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3026
	
L_3034:
	mov r8,  [rsp+8*1672]
	mov r9,9
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1683],r10
	je L_3035
	mov r9,t93
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3026
	
L_3035:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*1674],r8
	
L_3026:
	mov r9,  [rsp+8*1674]
	mov r8,r9
	mov qword [rsp+8*1688],r8
	mov     rsi, [rsp+8*1688]
	mov     rdi, t127
	call    concat
	mov [rsp+8*1689], rax
	xor rdx, rdx
	mov r8,  [rsp+8*1670]
	mov rax, r8
	mov r9,10
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov rdi,r10
	mov r11,rdi
	mov r8,0
	cmp r11,r8
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*1673],r9
	mov qword [rsp+8*1690],r10
	mov qword [rsp+8*1672],r11
	je L_3036
	mov r9,t66
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3038
	
L_3036:
	mov r8,  [rsp+8*1672]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1675],r10
	je L_3039
	mov r9,t69
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3038
	
L_3039:
	mov r8,  [rsp+8*1672]
	mov r9,2
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1676],r10
	je L_3040
	mov r9,t72
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3038
	
L_3040:
	mov r8,  [rsp+8*1672]
	mov r9,3
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1677],r10
	je L_3041
	mov r9,t75
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3038
	
L_3041:
	mov r8,  [rsp+8*1672]
	mov r9,4
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1678],r10
	je L_3042
	mov r9,t78
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3038
	
L_3042:
	mov r8,  [rsp+8*1672]
	mov r9,5
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1679],r10
	je L_3043
	mov r9,t81
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3038
	
L_3043:
	mov r8,  [rsp+8*1672]
	mov r9,6
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1680],r10
	je L_3044
	mov r9,t84
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3038
	
L_3044:
	mov r8,  [rsp+8*1672]
	mov r9,7
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1681],r10
	je L_3045
	mov r9,t87
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3038
	
L_3045:
	mov r8,  [rsp+8*1672]
	mov r9,8
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1682],r10
	je L_3046
	mov r9,t90
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3038
	
L_3046:
	mov r8,  [rsp+8*1672]
	mov r9,9
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1683],r10
	je L_3047
	mov r9,t93
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3038
	
L_3047:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*1674],r8
	
L_3038:
	mov r9,  [rsp+8*1674]
	mov r8,r9
	mov qword [rsp+8*1691],r8
	mov     rsi, [rsp+8*1691]
	mov     rdi, [rsp+8*1689]
	call    concat
	mov [rsp+8*1689], rax
	mov     rsi, t137
	mov     rdi, [rsp+8*1689]
	call    concat
	mov [rsp+8*1689], rax
	mov r9,  [rsp+8*1689]
	mov r8,r9
	mov qword [rsp+8*1686],r8
	
L_3023:
	mov r9,  [rsp+8*1686]
	mov r8,r9
	mov qword [rsp+8*1692],r8
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1692]
	call    concat
	mov [rsp+8*1693], rax
	mov r9,  [gbl+8*3]
	mov r8,r9
	mov r10,  [rsp+8*2]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1694],r8
	mov r8, [r11]
	mov qword [rsp+8*1696],r8
	mov qword [rsp+8*1695],r11
	mov     rsi, [rsp+8*1696]
	mov     rdi, [rsp+8*1693]
	call    concat
	mov [rsp+8*1693], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1693]
	call    concat
	mov [rsp+8*1693], rax
	mov     rsi, [gbl+8*1697]
	mov     rdi, [rsp+8*1693]
	call    concat
	mov [rsp+8*1693], rax
	mov r8,  [rsp+8*1693]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*1698],r9
	mov rdi,[rsp+8*1698] 
	add rdi, 1 
	call puts
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r10,1
	add r9,r10
	mov qword [rsp+8*1699],r8
	mov qword [rsp+8*2],r9
	jmp L_2838
	
L_2839:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*2],r8
	
L_2841:
	mov r8,  [rsp+8*2]
	mov r9,31
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*1700],r10
	je L_2842
	mov r8,  [rsp+8*2]
	mov rdi,r8
	mov r9,rdi
	mov r10,9
	cmp r9,r10
	mov r11, 0
	setle r11B
	cmp r11, 0
	mov qword [rsp+8*1701],r9
	mov qword [rsp+8*1702],r11
	je L_3048
	mov r8,  [rsp+8*1701]
	mov rdi,r8
	mov r9,rdi
	mov r10,0
	cmp r9,r10
	mov r11, 0
	sete r11B
	cmp r11, 0
	mov qword [rsp+8*1672],r9
	mov qword [rsp+8*1673],r11
	je L_3049
	mov r9,t66
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3051
	
L_3049:
	mov r8,  [rsp+8*1672]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1675],r10
	je L_3052
	mov r9,t69
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3051
	
L_3052:
	mov r8,  [rsp+8*1672]
	mov r9,2
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1676],r10
	je L_3053
	mov r9,t72
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3051
	
L_3053:
	mov r8,  [rsp+8*1672]
	mov r9,3
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1677],r10
	je L_3054
	mov r9,t75
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3051
	
L_3054:
	mov r8,  [rsp+8*1672]
	mov r9,4
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1678],r10
	je L_3055
	mov r9,t78
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3051
	
L_3055:
	mov r8,  [rsp+8*1672]
	mov r9,5
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1679],r10
	je L_3056
	mov r9,t81
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3051
	
L_3056:
	mov r8,  [rsp+8*1672]
	mov r9,6
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1680],r10
	je L_3057
	mov r9,t84
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3051
	
L_3057:
	mov r8,  [rsp+8*1672]
	mov r9,7
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1681],r10
	je L_3058
	mov r9,t87
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3051
	
L_3058:
	mov r8,  [rsp+8*1672]
	mov r9,8
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1682],r10
	je L_3059
	mov r9,t90
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3051
	
L_3059:
	mov r8,  [rsp+8*1672]
	mov r9,9
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1683],r10
	je L_3060
	mov r9,t93
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3051
	
L_3060:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*1674],r8
	
L_3051:
	mov r9,  [rsp+8*1674]
	mov r8,r9
	mov qword [rsp+8*1703],r8
	mov     rsi, [rsp+8*1703]
	mov     rdi, t103
	call    concat
	mov [rsp+8*1704], rax
	mov     rsi, t107
	mov     rdi, [rsp+8*1704]
	call    concat
	mov [rsp+8*1704], rax
	mov r9,  [rsp+8*1704]
	mov r8,r9
	mov qword [rsp+8*1705],r8
	jmp L_3062
	
L_3048:
	xor rdx, rdx
	mov r8,  [rsp+8*1701]
	mov rax, r8
	mov r9,10
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rax
	mov rdi,r10
	mov r11,rdi
	mov r9,0
	cmp r11,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1673],r10
	mov qword [rsp+8*1672],r11
	je L_3063
	mov r9,t66
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3065
	
L_3063:
	mov r8,  [rsp+8*1672]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1675],r10
	je L_3066
	mov r9,t69
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3065
	
L_3066:
	mov r8,  [rsp+8*1672]
	mov r9,2
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1676],r10
	je L_3067
	mov r9,t72
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3065
	
L_3067:
	mov r8,  [rsp+8*1672]
	mov r9,3
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1677],r10
	je L_3068
	mov r9,t75
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3065
	
L_3068:
	mov r8,  [rsp+8*1672]
	mov r9,4
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1678],r10
	je L_3069
	mov r9,t78
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3065
	
L_3069:
	mov r8,  [rsp+8*1672]
	mov r9,5
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1679],r10
	je L_3070
	mov r9,t81
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3065
	
L_3070:
	mov r8,  [rsp+8*1672]
	mov r9,6
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1680],r10
	je L_3071
	mov r9,t84
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3065
	
L_3071:
	mov r8,  [rsp+8*1672]
	mov r9,7
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1681],r10
	je L_3072
	mov r9,t87
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3065
	
L_3072:
	mov r8,  [rsp+8*1672]
	mov r9,8
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1682],r10
	je L_3073
	mov r9,t90
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3065
	
L_3073:
	mov r8,  [rsp+8*1672]
	mov r9,9
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1683],r10
	je L_3074
	mov r9,t93
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3065
	
L_3074:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*1674],r8
	
L_3065:
	mov r9,  [rsp+8*1674]
	mov r8,r9
	mov qword [rsp+8*1707],r8
	mov     rsi, [rsp+8*1707]
	mov     rdi, t108
	call    concat
	mov [rsp+8*1708], rax
	xor rdx, rdx
	mov r8,  [rsp+8*1701]
	mov rax, r8
	mov r9,10
	mov rbx, r9
	cdq
	idiv rbx
	mov r10, rdx
	mov rdi,r10
	mov r11,rdi
	mov r8,0
	cmp r11,r8
	mov r9, 0
	sete r9B
	cmp r9, 0
	mov qword [rsp+8*1673],r9
	mov qword [rsp+8*1709],r10
	mov qword [rsp+8*1672],r11
	je L_3075
	mov r9,t66
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3077
	
L_3075:
	mov r8,  [rsp+8*1672]
	mov r9,1
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1675],r10
	je L_3078
	mov r9,t69
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3077
	
L_3078:
	mov r8,  [rsp+8*1672]
	mov r9,2
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1676],r10
	je L_3079
	mov r9,t72
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3077
	
L_3079:
	mov r8,  [rsp+8*1672]
	mov r9,3
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1677],r10
	je L_3080
	mov r9,t75
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3077
	
L_3080:
	mov r8,  [rsp+8*1672]
	mov r9,4
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1678],r10
	je L_3081
	mov r9,t78
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3077
	
L_3081:
	mov r8,  [rsp+8*1672]
	mov r9,5
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1679],r10
	je L_3082
	mov r9,t81
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3077
	
L_3082:
	mov r8,  [rsp+8*1672]
	mov r9,6
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1680],r10
	je L_3083
	mov r9,t84
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3077
	
L_3083:
	mov r8,  [rsp+8*1672]
	mov r9,7
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1681],r10
	je L_3084
	mov r9,t87
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3077
	
L_3084:
	mov r8,  [rsp+8*1672]
	mov r9,8
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1682],r10
	je L_3085
	mov r9,t90
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3077
	
L_3085:
	mov r8,  [rsp+8*1672]
	mov r9,9
	cmp r8,r9
	mov r10, 0
	sete r10B
	cmp r10, 0
	mov qword [rsp+8*1683],r10
	je L_3086
	mov r9,t93
	mov r8,r9
	mov qword [rsp+8*1674],r8
	jmp L_3077
	
L_3086:
	mov r9,0
	mov r8,r9
	mov qword [rsp+8*1674],r8
	
L_3077:
	mov r9,  [rsp+8*1674]
	mov r8,r9
	mov qword [rsp+8*1710],r8
	mov     rsi, [rsp+8*1710]
	mov     rdi, [rsp+8*1708]
	call    concat
	mov [rsp+8*1708], rax
	mov     rsi, t118
	mov     rdi, [rsp+8*1708]
	call    concat
	mov [rsp+8*1708], rax
	mov r9,  [rsp+8*1708]
	mov r8,r9
	mov qword [rsp+8*1705],r8
	
L_3062:
	mov r9,  [rsp+8*1705]
	mov r8,r9
	mov qword [rsp+8*1711],r8
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1711]
	call    concat
	mov [rsp+8*1712], rax
	mov r9,  [gbl+8*190]
	mov r8,r9
	mov r10,  [rsp+8*2]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1713],r8
	mov r8, [r11]
	mov qword [rsp+8*1715],r8
	mov qword [rsp+8*1714],r11
	mov     rsi, [rsp+8*1715]
	mov     rdi, [rsp+8*1712]
	call    concat
	mov [rsp+8*1712], rax
	mov     rsi, [gbl+8*359]
	mov     rdi, [rsp+8*1712]
	call    concat
	mov [rsp+8*1712], rax
	mov     rsi, [gbl+8*1697]
	mov     rdi, [rsp+8*1712]
	call    concat
	mov [rsp+8*1712], rax
	mov r8,  [rsp+8*1712]
	mov rdi,r8
	mov r9,rdi
	mov qword [rsp+8*1716],r9
	mov rdi,[rsp+8*1716] 
	add rdi, 1 
	call puts
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r10,1
	add r9,r10
	mov qword [rsp+8*1717],r8
	mov qword [rsp+8*2],r9
	jmp L_2841
	
L_2842:
	mov r9,1
	mov r8,r9
	mov qword [rsp+8*2],r8
	
L_2844:
	mov r8,  [rsp+8*2]
	mov r9,31
	cmp r8,r9
	mov r10, 0
	setl r10B
	cmp r10, 0
	mov qword [rsp+8*1718],r10
	je L_2845
	mov r9,  [gbl+8*190]
	mov r8,r9
	mov r10,  [rsp+8*2]
	lea r11,[r8+r10*8+8H]
	mov qword [rsp+8*1719],r8
	mov r8, [r11]
	mov rdi,r8
	mov qword [rsp+8*1721],r8
	mov r8,rdi
	mov qword [rsp+8*1722],r8
	mov qword [rsp+8*1720],r11
	mov rdi,[rsp+8*1722] 
	add rdi, 1 
	call puts
	mov r9,  [rsp+8*2]
	mov r8,r9
	mov r10,1
	add r9,r10
	mov qword [rsp+8*1723],r8
	mov qword [rsp+8*2],r9
	jmp L_2844
	
L_2845:
	mov r8,0
	mov rax,r8
	        mov     rsp, qword [trsp]
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 13872
	mov     rdi, 256
	call    mallocArray
	mov     qword [gbl+8*1724], rax
	mov r9,  [gbl+8*1724]
	mov r8,r9
	mov qword [gbl+8*190],r8
	mov     rdi, 256
	call    mallocArray
	mov     qword [gbl+8*1725], rax
	mov r9,  [gbl+8*1725]
	mov r8,r9
	mov r11,t139
	mov r10,r11
	mov qword [gbl+8*3],r8
	mov r9,t140
	mov r8,r9
	mov qword [gbl+8*359],r8
	mov r9,t141
	mov r8,r9
	mov qword [gbl+8*1622],r8
	mov qword [gbl+8*1697],r10
	mov r8,  [rsp+8*1726]
	mov rax,r8
	leave
	ret
	
	 section   .bss
gbl:         resb   15856
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


