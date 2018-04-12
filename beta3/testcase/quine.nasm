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
	sub    rsp, 17568
	call global_init
	mov [rsp+8*1] , rax
	mov qword [rsp+8*2] ,0
	mov r8, [gbl+8*3]
	mov qword [rsp+8*4] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*4]
	call    address
	mov [rsp+8*5], rax
	mov r8, t2197
	mov r9, [rsp+8*5]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*6] ,r8
	mov     rsi, 1
	mov     rdi, [rsp+8*6]
	call    address
	mov [rsp+8*7], rax
	mov r8, t2201
	mov r9, [rsp+8*7]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*8] ,r8
	mov     rsi, 2
	mov     rdi, [rsp+8*8]
	call    address
	mov [rsp+8*9], rax
	mov r8, t2205
	mov r9, [rsp+8*9]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*10] ,r8
	mov     rsi, 3
	mov     rdi, [rsp+8*10]
	call    address
	mov [rsp+8*11], rax
	mov r8, t2209
	mov r9, [rsp+8*11]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*12] ,r8
	mov     rsi, 4
	mov     rdi, [rsp+8*12]
	call    address
	mov [rsp+8*13], rax
	mov r8, t2213
	mov r9, [rsp+8*13]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*14] ,r8
	mov     rsi, 5
	mov     rdi, [rsp+8*14]
	call    address
	mov [rsp+8*15], rax
	mov r8, t2217
	mov r9, [rsp+8*15]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*16] ,r8
	mov     rsi, 6
	mov     rdi, [rsp+8*16]
	call    address
	mov [rsp+8*17], rax
	mov r8, t2221
	mov r9, [rsp+8*17]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*18] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*18]
	call    address
	mov [rsp+8*19], rax
	mov r8, t2225
	mov r9, [rsp+8*19]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*20] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*20]
	call    address
	mov [rsp+8*21], rax
	mov r8, t2229
	mov r9, [rsp+8*21]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*22] ,r8
	mov     rsi, 9
	mov     rdi, [rsp+8*22]
	call    address
	mov [rsp+8*23], rax
	mov r8, t2233
	mov r9, [rsp+8*23]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*24] ,r8
	mov     rsi, 10
	mov     rdi, [rsp+8*24]
	call    address
	mov [rsp+8*25], rax
	mov r8, t2237
	mov r9, [rsp+8*25]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*26] ,r8
	mov     rsi, 11
	mov     rdi, [rsp+8*26]
	call    address
	mov [rsp+8*27], rax
	mov r8, t2241
	mov r9, [rsp+8*27]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*28] ,r8
	mov     rsi, 12
	mov     rdi, [rsp+8*28]
	call    address
	mov [rsp+8*29], rax
	mov r8, t2245
	mov r9, [rsp+8*29]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*30] ,r8
	mov     rsi, 13
	mov     rdi, [rsp+8*30]
	call    address
	mov [rsp+8*31], rax
	mov r8, t2249
	mov r9, [rsp+8*31]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*32] ,r8
	mov     rsi, 14
	mov     rdi, [rsp+8*32]
	call    address
	mov [rsp+8*33], rax
	mov r8, t2253
	mov r9, [rsp+8*33]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*34] ,r8
	mov     rsi, 15
	mov     rdi, [rsp+8*34]
	call    address
	mov [rsp+8*35], rax
	mov r8, t2257
	mov r9, [rsp+8*35]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*36] ,r8
	mov     rsi, 16
	mov     rdi, [rsp+8*36]
	call    address
	mov [rsp+8*37], rax
	mov r8, t2261
	mov r9, [rsp+8*37]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*38] ,r8
	mov     rsi, 17
	mov     rdi, [rsp+8*38]
	call    address
	mov [rsp+8*39], rax
	mov r8, t2265
	mov r9, [rsp+8*39]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*40] ,r8
	mov     rsi, 18
	mov     rdi, [rsp+8*40]
	call    address
	mov [rsp+8*41], rax
	mov r8, t2269
	mov r9, [rsp+8*41]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*42] ,r8
	mov     rsi, 19
	mov     rdi, [rsp+8*42]
	call    address
	mov [rsp+8*43], rax
	mov r8, t2273
	mov r9, [rsp+8*43]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*44] ,r8
	mov     rsi, 20
	mov     rdi, [rsp+8*44]
	call    address
	mov [rsp+8*45], rax
	mov r8, t2277
	mov r9, [rsp+8*45]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*46] ,r8
	mov     rsi, 21
	mov     rdi, [rsp+8*46]
	call    address
	mov [rsp+8*47], rax
	mov r8, t2281
	mov r9, [rsp+8*47]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*48] ,r8
	mov     rsi, 22
	mov     rdi, [rsp+8*48]
	call    address
	mov [rsp+8*49], rax
	mov r8, t2285
	mov r9, [rsp+8*49]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*50] ,r8
	mov     rsi, 23
	mov     rdi, [rsp+8*50]
	call    address
	mov [rsp+8*51], rax
	mov r8, t2289
	mov r9, [rsp+8*51]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*52] ,r8
	mov     rsi, 24
	mov     rdi, [rsp+8*52]
	call    address
	mov [rsp+8*53], rax
	mov r8, t2293
	mov r9, [rsp+8*53]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*54] ,r8
	mov     rsi, 25
	mov     rdi, [rsp+8*54]
	call    address
	mov [rsp+8*55], rax
	mov r8, t2297
	mov r9, [rsp+8*55]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*56] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*56]
	call    address
	mov [rsp+8*57], rax
	mov r8, t2301
	mov r9, [rsp+8*57]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*58] ,r8
	mov     rsi, 27
	mov     rdi, [rsp+8*58]
	call    address
	mov [rsp+8*59], rax
	mov r8, t2305
	mov r9, [rsp+8*59]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*60] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*60]
	call    address
	mov [rsp+8*61], rax
	mov r8, t2309
	mov r9, [rsp+8*61]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*62] ,r8
	mov     rsi, 29
	mov     rdi, [rsp+8*62]
	call    address
	mov [rsp+8*63], rax
	mov r8, t2313
	mov r9, [rsp+8*63]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*64] ,r8
	mov     rsi, 30
	mov     rdi, [rsp+8*64]
	call    address
	mov [rsp+8*65], rax
	mov r8, t2317
	mov r9, [rsp+8*65]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*66] ,r8
	mov     rsi, 31
	mov     rdi, [rsp+8*66]
	call    address
	mov [rsp+8*67], rax
	mov r8, t2321
	mov r9, [rsp+8*67]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*68] ,r8
	mov     rsi, 32
	mov     rdi, [rsp+8*68]
	call    address
	mov [rsp+8*69], rax
	mov r8, t2325
	mov r9, [rsp+8*69]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*70] ,r8
	mov     rsi, 33
	mov     rdi, [rsp+8*70]
	call    address
	mov [rsp+8*71], rax
	mov r8, t2329
	mov r9, [rsp+8*71]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*72] ,r8
	mov     rsi, 34
	mov     rdi, [rsp+8*72]
	call    address
	mov [rsp+8*73], rax
	mov r8, t2333
	mov r9, [rsp+8*73]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*74] ,r8
	mov     rsi, 35
	mov     rdi, [rsp+8*74]
	call    address
	mov [rsp+8*75], rax
	mov r8, t2337
	mov r9, [rsp+8*75]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*76] ,r8
	mov     rsi, 36
	mov     rdi, [rsp+8*76]
	call    address
	mov [rsp+8*77], rax
	mov r8, t2341
	mov r9, [rsp+8*77]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*78] ,r8
	mov     rsi, 37
	mov     rdi, [rsp+8*78]
	call    address
	mov [rsp+8*79], rax
	mov r8, t2345
	mov r9, [rsp+8*79]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*80] ,r8
	mov     rsi, 38
	mov     rdi, [rsp+8*80]
	call    address
	mov [rsp+8*81], rax
	mov r8, t2349
	mov r9, [rsp+8*81]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*82] ,r8
	mov     rsi, 39
	mov     rdi, [rsp+8*82]
	call    address
	mov [rsp+8*83], rax
	mov r8, t2353
	mov r9, [rsp+8*83]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*84] ,r8
	mov     rsi, 40
	mov     rdi, [rsp+8*84]
	call    address
	mov [rsp+8*85], rax
	mov r8, t2357
	mov r9, [rsp+8*85]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*86] ,r8
	mov     rsi, 41
	mov     rdi, [rsp+8*86]
	call    address
	mov [rsp+8*87], rax
	mov r8, t2361
	mov r9, [rsp+8*87]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*88] ,r8
	mov     rsi, 42
	mov     rdi, [rsp+8*88]
	call    address
	mov [rsp+8*89], rax
	mov r8, t2365
	mov r9, [rsp+8*89]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*90] ,r8
	mov     rsi, 43
	mov     rdi, [rsp+8*90]
	call    address
	mov [rsp+8*91], rax
	mov r8, t2369
	mov r9, [rsp+8*91]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*92] ,r8
	mov     rsi, 44
	mov     rdi, [rsp+8*92]
	call    address
	mov [rsp+8*93], rax
	mov r8, t2373
	mov r9, [rsp+8*93]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*94] ,r8
	mov     rsi, 45
	mov     rdi, [rsp+8*94]
	call    address
	mov [rsp+8*95], rax
	mov r8, t2377
	mov r9, [rsp+8*95]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*96] ,r8
	mov     rsi, 46
	mov     rdi, [rsp+8*96]
	call    address
	mov [rsp+8*97], rax
	mov r8, t2381
	mov r9, [rsp+8*97]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*98] ,r8
	mov     rsi, 47
	mov     rdi, [rsp+8*98]
	call    address
	mov [rsp+8*99], rax
	mov r8, t2385
	mov r9, [rsp+8*99]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*100] ,r8
	mov     rsi, 48
	mov     rdi, [rsp+8*100]
	call    address
	mov [rsp+8*101], rax
	mov r8, t2389
	mov r9, [rsp+8*101]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*102] ,r8
	mov     rsi, 49
	mov     rdi, [rsp+8*102]
	call    address
	mov [rsp+8*103], rax
	mov r8, t2393
	mov r9, [rsp+8*103]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*104] ,r8
	mov     rsi, 50
	mov     rdi, [rsp+8*104]
	call    address
	mov [rsp+8*105], rax
	mov r8, t2397
	mov r9, [rsp+8*105]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*106] ,r8
	mov     rsi, 51
	mov     rdi, [rsp+8*106]
	call    address
	mov [rsp+8*107], rax
	mov r8, t2401
	mov r9, [rsp+8*107]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*108] ,r8
	mov     rsi, 52
	mov     rdi, [rsp+8*108]
	call    address
	mov [rsp+8*109], rax
	mov r8, t2405
	mov r9, [rsp+8*109]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*110] ,r8
	mov     rsi, 53
	mov     rdi, [rsp+8*110]
	call    address
	mov [rsp+8*111], rax
	mov r8, t2409
	mov r9, [rsp+8*111]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*112] ,r8
	mov     rsi, 54
	mov     rdi, [rsp+8*112]
	call    address
	mov [rsp+8*113], rax
	mov r8, t2413
	mov r9, [rsp+8*113]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*114] ,r8
	mov     rsi, 55
	mov     rdi, [rsp+8*114]
	call    address
	mov [rsp+8*115], rax
	mov r8, t2417
	mov r9, [rsp+8*115]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*116] ,r8
	mov     rsi, 56
	mov     rdi, [rsp+8*116]
	call    address
	mov [rsp+8*117], rax
	mov r8, t2421
	mov r9, [rsp+8*117]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*118] ,r8
	mov     rsi, 57
	mov     rdi, [rsp+8*118]
	call    address
	mov [rsp+8*119], rax
	mov r8, t2425
	mov r9, [rsp+8*119]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*120] ,r8
	mov     rsi, 58
	mov     rdi, [rsp+8*120]
	call    address
	mov [rsp+8*121], rax
	mov r8, t2429
	mov r9, [rsp+8*121]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*122] ,r8
	mov     rsi, 59
	mov     rdi, [rsp+8*122]
	call    address
	mov [rsp+8*123], rax
	mov r8, t2433
	mov r9, [rsp+8*123]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*124] ,r8
	mov     rsi, 60
	mov     rdi, [rsp+8*124]
	call    address
	mov [rsp+8*125], rax
	mov r8, t2437
	mov r9, [rsp+8*125]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*126] ,r8
	mov     rsi, 61
	mov     rdi, [rsp+8*126]
	call    address
	mov [rsp+8*127], rax
	mov r8, t2441
	mov r9, [rsp+8*127]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*128] ,r8
	mov     rsi, 62
	mov     rdi, [rsp+8*128]
	call    address
	mov [rsp+8*129], rax
	mov r8, t2445
	mov r9, [rsp+8*129]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*130] ,r8
	mov     rsi, 63
	mov     rdi, [rsp+8*130]
	call    address
	mov [rsp+8*131], rax
	mov r8, t2449
	mov r9, [rsp+8*131]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*132] ,r8
	mov     rsi, 64
	mov     rdi, [rsp+8*132]
	call    address
	mov [rsp+8*133], rax
	mov r8, t2453
	mov r9, [rsp+8*133]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*134] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*134]
	call    address
	mov [rsp+8*135], rax
	mov r8, t2457
	mov r9, [rsp+8*135]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*136] ,r8
	mov     rsi, 66
	mov     rdi, [rsp+8*136]
	call    address
	mov [rsp+8*137], rax
	mov r8, t2461
	mov r9, [rsp+8*137]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*138] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*138]
	call    address
	mov [rsp+8*139], rax
	mov r8, t2465
	mov r9, [rsp+8*139]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*140] ,r8
	mov     rsi, 68
	mov     rdi, [rsp+8*140]
	call    address
	mov [rsp+8*141], rax
	mov r8, t2469
	mov r9, [rsp+8*141]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*142] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*142]
	call    address
	mov [rsp+8*143], rax
	mov r8, t2473
	mov r9, [rsp+8*143]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*144] ,r8
	mov     rsi, 70
	mov     rdi, [rsp+8*144]
	call    address
	mov [rsp+8*145], rax
	mov r8, t2477
	mov r9, [rsp+8*145]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*146] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*146]
	call    address
	mov [rsp+8*147], rax
	mov r8, t2481
	mov r9, [rsp+8*147]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*148] ,r8
	mov     rsi, 72
	mov     rdi, [rsp+8*148]
	call    address
	mov [rsp+8*149], rax
	mov r8, t2485
	mov r9, [rsp+8*149]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*150] ,r8
	mov     rsi, 73
	mov     rdi, [rsp+8*150]
	call    address
	mov [rsp+8*151], rax
	mov r8, t2489
	mov r9, [rsp+8*151]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*152] ,r8
	mov     rsi, 74
	mov     rdi, [rsp+8*152]
	call    address
	mov [rsp+8*153], rax
	mov r8, t2493
	mov r9, [rsp+8*153]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*154] ,r8
	mov     rsi, 75
	mov     rdi, [rsp+8*154]
	call    address
	mov [rsp+8*155], rax
	mov r8, t2497
	mov r9, [rsp+8*155]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*156] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*156]
	call    address
	mov [rsp+8*157], rax
	mov r8, t2501
	mov r9, [rsp+8*157]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*158] ,r8
	mov     rsi, 77
	mov     rdi, [rsp+8*158]
	call    address
	mov [rsp+8*159], rax
	mov r8, t2505
	mov r9, [rsp+8*159]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*160] ,r8
	mov     rsi, 78
	mov     rdi, [rsp+8*160]
	call    address
	mov [rsp+8*161], rax
	mov r8, t2509
	mov r9, [rsp+8*161]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*162] ,r8
	mov     rsi, 79
	mov     rdi, [rsp+8*162]
	call    address
	mov [rsp+8*163], rax
	mov r8, t2513
	mov r9, [rsp+8*163]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*164] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*164]
	call    address
	mov [rsp+8*165], rax
	mov r8, t2517
	mov r9, [rsp+8*165]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*166] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*166]
	call    address
	mov [rsp+8*167], rax
	mov r8, t2521
	mov r9, [rsp+8*167]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*168] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*168]
	call    address
	mov [rsp+8*169], rax
	mov r8, t2525
	mov r9, [rsp+8*169]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*170] ,r8
	mov     rsi, 83
	mov     rdi, [rsp+8*170]
	call    address
	mov [rsp+8*171], rax
	mov r8, t2529
	mov r9, [rsp+8*171]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*172] ,r8
	mov     rsi, 84
	mov     rdi, [rsp+8*172]
	call    address
	mov [rsp+8*173], rax
	mov r8, t2533
	mov r9, [rsp+8*173]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*174] ,r8
	mov     rsi, 85
	mov     rdi, [rsp+8*174]
	call    address
	mov [rsp+8*175], rax
	mov r8, t2537
	mov r9, [rsp+8*175]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*176] ,r8
	mov     rsi, 86
	mov     rdi, [rsp+8*176]
	call    address
	mov [rsp+8*177], rax
	mov r8, t2541
	mov r9, [rsp+8*177]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*178] ,r8
	mov     rsi, 87
	mov     rdi, [rsp+8*178]
	call    address
	mov [rsp+8*179], rax
	mov r8, t2545
	mov r9, [rsp+8*179]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*180] ,r8
	mov     rsi, 88
	mov     rdi, [rsp+8*180]
	call    address
	mov [rsp+8*181], rax
	mov r8, t2549
	mov r9, [rsp+8*181]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*182] ,r8
	mov     rsi, 89
	mov     rdi, [rsp+8*182]
	call    address
	mov [rsp+8*183], rax
	mov r8, t2553
	mov r9, [rsp+8*183]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*184] ,r8
	mov     rsi, 90
	mov     rdi, [rsp+8*184]
	call    address
	mov [rsp+8*185], rax
	mov r8, t2557
	mov r9, [rsp+8*185]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*186] ,r8
	mov     rsi, 91
	mov     rdi, [rsp+8*186]
	call    address
	mov [rsp+8*187], rax
	mov r8, t2561
	mov r9, [rsp+8*187]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*188] ,r8
	mov     rsi, 92
	mov     rdi, [rsp+8*188]
	call    address
	mov [rsp+8*189], rax
	mov r8, t2565
	mov r9, [rsp+8*189]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*191] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*191]
	call    address
	mov [rsp+8*192], rax
	mov r8, t2569
	mov r9, [rsp+8*192]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*193] ,r8
	mov     rsi, 1
	mov     rdi, [rsp+8*193]
	call    address
	mov [rsp+8*194], rax
	mov r8, t2573
	mov r9, [rsp+8*194]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*195] ,r8
	mov     rsi, 2
	mov     rdi, [rsp+8*195]
	call    address
	mov [rsp+8*196], rax
	mov r8, t2577
	mov r9, [rsp+8*196]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*197] ,r8
	mov     rsi, 3
	mov     rdi, [rsp+8*197]
	call    address
	mov [rsp+8*198], rax
	mov r8, t2581
	mov r9, [rsp+8*198]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*199] ,r8
	mov     rsi, 4
	mov     rdi, [rsp+8*199]
	call    address
	mov [rsp+8*200], rax
	mov r8, t2585
	mov r9, [rsp+8*200]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*201] ,r8
	mov     rsi, 5
	mov     rdi, [rsp+8*201]
	call    address
	mov [rsp+8*202], rax
	mov r8, t2589
	mov r9, [rsp+8*202]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*203] ,r8
	mov     rsi, 6
	mov     rdi, [rsp+8*203]
	call    address
	mov [rsp+8*204], rax
	mov r8, t2593
	mov r9, [rsp+8*204]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*205] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*205]
	call    address
	mov [rsp+8*206], rax
	mov r8, t2597
	mov r9, [rsp+8*206]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*207] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*207]
	call    address
	mov [rsp+8*208], rax
	mov r8, t2601
	mov r9, [rsp+8*208]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*209] ,r8
	mov     rsi, 9
	mov     rdi, [rsp+8*209]
	call    address
	mov [rsp+8*210], rax
	mov r8, t2605
	mov r9, [rsp+8*210]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*211] ,r8
	mov     rsi, 10
	mov     rdi, [rsp+8*211]
	call    address
	mov [rsp+8*212], rax
	mov r8, t2609
	mov r9, [rsp+8*212]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*213] ,r8
	mov     rsi, 11
	mov     rdi, [rsp+8*213]
	call    address
	mov [rsp+8*214], rax
	mov r8, t2613
	mov r9, [rsp+8*214]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*215] ,r8
	mov     rsi, 12
	mov     rdi, [rsp+8*215]
	call    address
	mov [rsp+8*216], rax
	mov r8, t2617
	mov r9, [rsp+8*216]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*217] ,r8
	mov     rsi, 13
	mov     rdi, [rsp+8*217]
	call    address
	mov [rsp+8*218], rax
	mov r8, t2621
	mov r9, [rsp+8*218]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*219] ,r8
	mov     rsi, 14
	mov     rdi, [rsp+8*219]
	call    address
	mov [rsp+8*220], rax
	mov r8, t2625
	mov r9, [rsp+8*220]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*221] ,r8
	mov     rsi, 15
	mov     rdi, [rsp+8*221]
	call    address
	mov [rsp+8*222], rax
	mov r8, t2629
	mov r9, [rsp+8*222]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*223] ,r8
	mov     rsi, 16
	mov     rdi, [rsp+8*223]
	call    address
	mov [rsp+8*224], rax
	mov r8, t2633
	mov r9, [rsp+8*224]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*225] ,r8
	mov     rsi, 17
	mov     rdi, [rsp+8*225]
	call    address
	mov [rsp+8*226], rax
	mov r8, t2637
	mov r9, [rsp+8*226]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*227] ,r8
	mov     rsi, 18
	mov     rdi, [rsp+8*227]
	call    address
	mov [rsp+8*228], rax
	mov r8, t2641
	mov r9, [rsp+8*228]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*229] ,r8
	mov     rsi, 19
	mov     rdi, [rsp+8*229]
	call    address
	mov [rsp+8*230], rax
	mov r8, t2645
	mov r9, [rsp+8*230]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*231] ,r8
	mov     rsi, 20
	mov     rdi, [rsp+8*231]
	call    address
	mov [rsp+8*232], rax
	mov r8, t2649
	mov r9, [rsp+8*232]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*233] ,r8
	mov     rsi, 21
	mov     rdi, [rsp+8*233]
	call    address
	mov [rsp+8*234], rax
	mov r8, t2653
	mov r9, [rsp+8*234]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*235] ,r8
	mov     rsi, 22
	mov     rdi, [rsp+8*235]
	call    address
	mov [rsp+8*236], rax
	mov r8, t2657
	mov r9, [rsp+8*236]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*237] ,r8
	mov     rsi, 23
	mov     rdi, [rsp+8*237]
	call    address
	mov [rsp+8*238], rax
	mov r8, t2661
	mov r9, [rsp+8*238]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*239] ,r8
	mov     rsi, 24
	mov     rdi, [rsp+8*239]
	call    address
	mov [rsp+8*240], rax
	mov r8, t2665
	mov r9, [rsp+8*240]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*241] ,r8
	mov     rsi, 25
	mov     rdi, [rsp+8*241]
	call    address
	mov [rsp+8*242], rax
	mov r8, t2669
	mov r9, [rsp+8*242]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*243] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*243]
	call    address
	mov [rsp+8*244], rax
	mov r8, t2673
	mov r9, [rsp+8*244]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*245] ,r8
	mov     rsi, 27
	mov     rdi, [rsp+8*245]
	call    address
	mov [rsp+8*246], rax
	mov r8, t2677
	mov r9, [rsp+8*246]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*247] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*247]
	call    address
	mov [rsp+8*248], rax
	mov r8, t2681
	mov r9, [rsp+8*248]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*249] ,r8
	mov     rsi, 29
	mov     rdi, [rsp+8*249]
	call    address
	mov [rsp+8*250], rax
	mov r8, t2685
	mov r9, [rsp+8*250]
	mov qword [r9], r8
	mov r8, [gbl+8*190]
	mov qword [rsp+8*251] ,r8
	mov     rsi, 30
	mov     rdi, [rsp+8*251]
	call    address
	mov [rsp+8*252], rax
	mov r8, t2689
	mov r9, [rsp+8*252]
	mov qword [r9], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*253] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*253]
	call    address
	mov [rsp+8*254], rax
	mov r8, [rsp+8*254]
	mov r8, [r8]
	mov [rsp+8*255], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*256] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*256]
	call    address
	mov [rsp+8*257], rax
	mov r8, [rsp+8*257]
	mov r8, [r8]
	mov [rsp+8*258], r8
	mov     rsi, [rsp+8*258]
	mov     rdi, [rsp+8*255]
	call    concat
	mov [rsp+8*259], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*260] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*260]
	call    address
	mov [rsp+8*261], rax
	mov r8, [rsp+8*261]
	mov r8, [r8]
	mov [rsp+8*262], r8
	mov     rsi, [rsp+8*262]
	mov     rdi, [rsp+8*259]
	call    concat
	mov [rsp+8*263], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*264] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*264]
	call    address
	mov [rsp+8*265], rax
	mov r8, [rsp+8*265]
	mov r8, [r8]
	mov [rsp+8*266], r8
	mov     rsi, [rsp+8*266]
	mov     rdi, [rsp+8*263]
	call    concat
	mov [rsp+8*267], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*268] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*268]
	call    address
	mov [rsp+8*269], rax
	mov r8, [rsp+8*269]
	mov r8, [r8]
	mov [rsp+8*270], r8
	mov     rsi, [rsp+8*270]
	mov     rdi, [rsp+8*267]
	call    concat
	mov [rsp+8*271], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*272] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*272]
	call    address
	mov [rsp+8*273], rax
	mov r8, [rsp+8*273]
	mov r8, [r8]
	mov [rsp+8*274], r8
	mov     rsi, [rsp+8*274]
	mov     rdi, [rsp+8*271]
	call    concat
	mov [rsp+8*275], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*276] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*276]
	call    address
	mov [rsp+8*277], rax
	mov r8, [rsp+8*277]
	mov r8, [r8]
	mov [rsp+8*278], r8
	mov     rsi, [rsp+8*278]
	mov     rdi, [rsp+8*275]
	call    concat
	mov [rsp+8*279], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*280] ,r8
	mov     rsi, 66
	mov     rdi, [rsp+8*280]
	call    address
	mov [rsp+8*281], rax
	mov r8, [rsp+8*281]
	mov r8, [r8]
	mov [rsp+8*282], r8
	mov     rsi, [rsp+8*282]
	mov     rdi, [rsp+8*279]
	call    concat
	mov [rsp+8*283], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*284] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*284]
	call    address
	mov [rsp+8*285], rax
	mov r8, [rsp+8*285]
	mov r8, [r8]
	mov [rsp+8*286], r8
	mov     rsi, [rsp+8*286]
	mov     rdi, [rsp+8*283]
	call    concat
	mov [rsp+8*287], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*288] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*288]
	call    address
	mov [rsp+8*289], rax
	mov r8, [rsp+8*289]
	mov r8, [r8]
	mov [rsp+8*290], r8
	mov     rsi, [rsp+8*290]
	mov     rdi, [rsp+8*287]
	call    concat
	mov [rsp+8*291], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*292] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*292]
	call    address
	mov [rsp+8*293], rax
	mov r8, [rsp+8*293]
	mov r8, [r8]
	mov [rsp+8*294], r8
	mov     rsi, [rsp+8*294]
	mov     rdi, [rsp+8*291]
	call    concat
	mov [rsp+8*295], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*296] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*296]
	call    address
	mov [rsp+8*297], rax
	mov r8, [rsp+8*297]
	mov r8, [r8]
	mov [rsp+8*298], r8
	mov     rsi, [rsp+8*298]
	mov     rdi, [rsp+8*295]
	call    concat
	mov [rsp+8*299], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*300] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*300]
	call    address
	mov [rsp+8*301], rax
	mov r8, [rsp+8*301]
	mov r8, [r8]
	mov [rsp+8*302], r8
	mov     rsi, [rsp+8*302]
	mov     rdi, [rsp+8*299]
	call    concat
	mov [rsp+8*303], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*304] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*304]
	call    address
	mov [rsp+8*305], rax
	mov r8, [rsp+8*305]
	mov r8, [r8]
	mov [rsp+8*306], r8
	mov     rsi, [rsp+8*306]
	mov     rdi, [rsp+8*303]
	call    concat
	mov [rsp+8*307], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*308] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*308]
	call    address
	mov [rsp+8*309], rax
	mov r8, [rsp+8*309]
	mov r8, [r8]
	mov [rsp+8*310], r8
	mov     rsi, [rsp+8*310]
	mov     rdi, [rsp+8*307]
	call    concat
	mov [rsp+8*311], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*312] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*312]
	call    address
	mov [rsp+8*313], rax
	mov r8, [rsp+8*313]
	mov r8, [r8]
	mov [rsp+8*314], r8
	mov     rsi, [rsp+8*314]
	mov     rdi, [rsp+8*311]
	call    concat
	mov [rsp+8*315], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*316] ,r8
	mov     rsi, 86
	mov     rdi, [rsp+8*316]
	call    address
	mov [rsp+8*317], rax
	mov r8, [rsp+8*317]
	mov r8, [r8]
	mov [rsp+8*318], r8
	mov     rsi, [rsp+8*318]
	mov     rdi, [rsp+8*315]
	call    concat
	mov [rsp+8*319], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*320] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*320]
	call    address
	mov [rsp+8*321], rax
	mov r8, [rsp+8*321]
	mov r8, [r8]
	mov [rsp+8*322], r8
	mov     rsi, [rsp+8*322]
	mov     rdi, [rsp+8*319]
	call    concat
	mov [rsp+8*323], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*324] ,r8
	mov     rsi, 89
	mov     rdi, [rsp+8*324]
	call    address
	mov [rsp+8*325], rax
	mov r8, [rsp+8*325]
	mov r8, [r8]
	mov [rsp+8*326], r8
	mov     rsi, [rsp+8*326]
	mov     rdi, [rsp+8*323]
	call    concat
	mov [rsp+8*327], rax
	mov r8, [rsp+8*327]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*329] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*329] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*330] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*330]
	call    address
	mov [rsp+8*331], rax
	mov r8, [rsp+8*331]
	mov r8, [r8]
	mov [rsp+8*332], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*333] ,r8
	mov     rsi, 68
	mov     rdi, [rsp+8*333]
	call    address
	mov [rsp+8*334], rax
	mov r8, [rsp+8*334]
	mov r8, [r8]
	mov [rsp+8*335], r8
	mov     rsi, [rsp+8*335]
	mov     rdi, [rsp+8*332]
	call    concat
	mov [rsp+8*336], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*337] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*337]
	call    address
	mov [rsp+8*338], rax
	mov r8, [rsp+8*338]
	mov r8, [r8]
	mov [rsp+8*339], r8
	mov     rsi, [rsp+8*339]
	mov     rdi, [rsp+8*336]
	call    concat
	mov [rsp+8*340], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*341] ,r8
	mov     rsi, 86
	mov     rdi, [rsp+8*341]
	call    address
	mov [rsp+8*342], rax
	mov r8, [rsp+8*342]
	mov r8, [r8]
	mov [rsp+8*343], r8
	mov     rsi, [rsp+8*343]
	mov     rdi, [rsp+8*340]
	call    concat
	mov [rsp+8*344], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*345] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*345]
	call    address
	mov [rsp+8*346], rax
	mov r8, [rsp+8*346]
	mov r8, [r8]
	mov [rsp+8*347], r8
	mov     rsi, [rsp+8*347]
	mov     rdi, [rsp+8*344]
	call    concat
	mov [rsp+8*348], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*349] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*349]
	call    address
	mov [rsp+8*350], rax
	mov r8, [rsp+8*350]
	mov r8, [r8]
	mov [rsp+8*351], r8
	mov     rsi, [rsp+8*351]
	mov     rdi, [rsp+8*348]
	call    concat
	mov [rsp+8*352], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*353] ,r8
	mov     rsi, 15
	mov     rdi, [rsp+8*353]
	call    address
	mov [rsp+8*354], rax
	mov r8, [rsp+8*354]
	mov r8, [r8]
	mov [rsp+8*355], r8
	mov     rsi, [rsp+8*355]
	mov     rdi, [rsp+8*352]
	call    concat
	mov [rsp+8*356], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*357] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*357]
	call    address
	mov [rsp+8*358], rax
	mov r8, [rsp+8*358]
	mov r8, [r8]
	mov [rsp+8*359], r8
	mov     rsi, [rsp+8*359]
	mov     rdi, [rsp+8*356]
	call    concat
	mov [rsp+8*360], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*361] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*361]
	call    address
	mov [rsp+8*362], rax
	mov r8, [rsp+8*362]
	mov r8, [r8]
	mov [rsp+8*363], r8
	mov     rsi, [rsp+8*363]
	mov     rdi, [rsp+8*360]
	call    concat
	mov [rsp+8*364], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*365] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*365]
	call    address
	mov [rsp+8*366], rax
	mov r8, [rsp+8*366]
	mov r8, [r8]
	mov [rsp+8*367], r8
	mov     rsi, [rsp+8*367]
	mov     rdi, [rsp+8*364]
	call    concat
	mov [rsp+8*368], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*369] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*369]
	call    address
	mov [rsp+8*370], rax
	mov r8, [rsp+8*370]
	mov r8, [r8]
	mov [rsp+8*371], r8
	mov     rsi, [rsp+8*371]
	mov     rdi, [rsp+8*368]
	call    concat
	mov [rsp+8*372], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*373] ,r8
	mov     rsi, 83
	mov     rdi, [rsp+8*373]
	call    address
	mov [rsp+8*374], rax
	mov r8, [rsp+8*374]
	mov r8, [r8]
	mov [rsp+8*375], r8
	mov     rsi, [rsp+8*375]
	mov     rdi, [rsp+8*372]
	call    concat
	mov [rsp+8*376], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*377] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*377]
	call    address
	mov [rsp+8*378], rax
	mov r8, [rsp+8*378]
	mov r8, [r8]
	mov [rsp+8*379], r8
	mov     rsi, [rsp+8*379]
	mov     rdi, [rsp+8*376]
	call    concat
	mov [rsp+8*380], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*381] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*381]
	call    address
	mov [rsp+8*382], rax
	mov r8, [rsp+8*382]
	mov r8, [r8]
	mov [rsp+8*383], r8
	mov     rsi, [rsp+8*383]
	mov     rdi, [rsp+8*380]
	call    concat
	mov [rsp+8*384], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*385] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*385]
	call    address
	mov [rsp+8*386], rax
	mov r8, [rsp+8*386]
	mov r8, [r8]
	mov [rsp+8*387], r8
	mov     rsi, [rsp+8*387]
	mov     rdi, [rsp+8*384]
	call    concat
	mov [rsp+8*388], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*388]
	call    concat
	mov [rsp+8*390], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*391] ,r8
	mov     rsi, 15
	mov     rdi, [rsp+8*391]
	call    address
	mov [rsp+8*392], rax
	mov r8, [rsp+8*392]
	mov r8, [r8]
	mov [rsp+8*393], r8
	mov     rsi, [rsp+8*393]
	mov     rdi, [rsp+8*390]
	call    concat
	mov [rsp+8*394], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*394]
	call    concat
	mov [rsp+8*395], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*396] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*396]
	call    address
	mov [rsp+8*397], rax
	mov r8, [rsp+8*397]
	mov r8, [r8]
	mov [rsp+8*398], r8
	mov     rsi, [rsp+8*398]
	mov     rdi, [rsp+8*395]
	call    concat
	mov [rsp+8*399], rax
	mov r8, [rsp+8*399]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*400] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*400] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*401] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*401]
	call    address
	mov [rsp+8*402], rax
	mov r8, [rsp+8*402]
	mov r8, [r8]
	mov [rsp+8*403], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*404] ,r8
	mov     rsi, 68
	mov     rdi, [rsp+8*404]
	call    address
	mov [rsp+8*405], rax
	mov r8, [rsp+8*405]
	mov r8, [r8]
	mov [rsp+8*406], r8
	mov     rsi, [rsp+8*406]
	mov     rdi, [rsp+8*403]
	call    concat
	mov [rsp+8*407], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*408] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*408]
	call    address
	mov [rsp+8*409], rax
	mov r8, [rsp+8*409]
	mov r8, [r8]
	mov [rsp+8*410], r8
	mov     rsi, [rsp+8*410]
	mov     rdi, [rsp+8*407]
	call    concat
	mov [rsp+8*411], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*412] ,r8
	mov     rsi, 86
	mov     rdi, [rsp+8*412]
	call    address
	mov [rsp+8*413], rax
	mov r8, [rsp+8*413]
	mov r8, [r8]
	mov [rsp+8*414], r8
	mov     rsi, [rsp+8*414]
	mov     rdi, [rsp+8*411]
	call    concat
	mov [rsp+8*415], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*416] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*416]
	call    address
	mov [rsp+8*417], rax
	mov r8, [rsp+8*417]
	mov r8, [r8]
	mov [rsp+8*418], r8
	mov     rsi, [rsp+8*418]
	mov     rdi, [rsp+8*415]
	call    concat
	mov [rsp+8*419], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*420] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*420]
	call    address
	mov [rsp+8*421], rax
	mov r8, [rsp+8*421]
	mov r8, [r8]
	mov [rsp+8*422], r8
	mov     rsi, [rsp+8*422]
	mov     rdi, [rsp+8*419]
	call    concat
	mov [rsp+8*423], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*424] ,r8
	mov     rsi, 16
	mov     rdi, [rsp+8*424]
	call    address
	mov [rsp+8*425], rax
	mov r8, [rsp+8*425]
	mov r8, [r8]
	mov [rsp+8*426], r8
	mov     rsi, [rsp+8*426]
	mov     rdi, [rsp+8*423]
	call    concat
	mov [rsp+8*427], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*428] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*428]
	call    address
	mov [rsp+8*429], rax
	mov r8, [rsp+8*429]
	mov r8, [r8]
	mov [rsp+8*430], r8
	mov     rsi, [rsp+8*430]
	mov     rdi, [rsp+8*427]
	call    concat
	mov [rsp+8*431], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*432] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*432]
	call    address
	mov [rsp+8*433], rax
	mov r8, [rsp+8*433]
	mov r8, [r8]
	mov [rsp+8*434], r8
	mov     rsi, [rsp+8*434]
	mov     rdi, [rsp+8*431]
	call    concat
	mov [rsp+8*435], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*436] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*436]
	call    address
	mov [rsp+8*437], rax
	mov r8, [rsp+8*437]
	mov r8, [r8]
	mov [rsp+8*438], r8
	mov     rsi, [rsp+8*438]
	mov     rdi, [rsp+8*435]
	call    concat
	mov [rsp+8*439], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*440] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*440]
	call    address
	mov [rsp+8*441], rax
	mov r8, [rsp+8*441]
	mov r8, [r8]
	mov [rsp+8*442], r8
	mov     rsi, [rsp+8*442]
	mov     rdi, [rsp+8*439]
	call    concat
	mov [rsp+8*443], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*444] ,r8
	mov     rsi, 83
	mov     rdi, [rsp+8*444]
	call    address
	mov [rsp+8*445], rax
	mov r8, [rsp+8*445]
	mov r8, [r8]
	mov [rsp+8*446], r8
	mov     rsi, [rsp+8*446]
	mov     rdi, [rsp+8*443]
	call    concat
	mov [rsp+8*447], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*448] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*448]
	call    address
	mov [rsp+8*449], rax
	mov r8, [rsp+8*449]
	mov r8, [r8]
	mov [rsp+8*450], r8
	mov     rsi, [rsp+8*450]
	mov     rdi, [rsp+8*447]
	call    concat
	mov [rsp+8*451], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*452] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*452]
	call    address
	mov [rsp+8*453], rax
	mov r8, [rsp+8*453]
	mov r8, [r8]
	mov [rsp+8*454], r8
	mov     rsi, [rsp+8*454]
	mov     rdi, [rsp+8*451]
	call    concat
	mov [rsp+8*455], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*456] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*456]
	call    address
	mov [rsp+8*457], rax
	mov r8, [rsp+8*457]
	mov r8, [r8]
	mov [rsp+8*458], r8
	mov     rsi, [rsp+8*458]
	mov     rdi, [rsp+8*455]
	call    concat
	mov [rsp+8*459], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*459]
	call    concat
	mov [rsp+8*460], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*461] ,r8
	mov     rsi, 16
	mov     rdi, [rsp+8*461]
	call    address
	mov [rsp+8*462], rax
	mov r8, [rsp+8*462]
	mov r8, [r8]
	mov [rsp+8*463], r8
	mov     rsi, [rsp+8*463]
	mov     rdi, [rsp+8*460]
	call    concat
	mov [rsp+8*464], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*464]
	call    concat
	mov [rsp+8*465], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*466] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*466]
	call    address
	mov [rsp+8*467], rax
	mov r8, [rsp+8*467]
	mov r8, [r8]
	mov [rsp+8*468], r8
	mov     rsi, [rsp+8*468]
	mov     rdi, [rsp+8*465]
	call    concat
	mov [rsp+8*469], rax
	mov r8, [rsp+8*469]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*470] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*470] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*471] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*471]
	call    address
	mov [rsp+8*472], rax
	mov r8, [rsp+8*472]
	mov r8, [r8]
	mov [rsp+8*473], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*474] ,r8
	mov     rsi, 68
	mov     rdi, [rsp+8*474]
	call    address
	mov [rsp+8*475], rax
	mov r8, [rsp+8*475]
	mov r8, [r8]
	mov [rsp+8*476], r8
	mov     rsi, [rsp+8*476]
	mov     rdi, [rsp+8*473]
	call    concat
	mov [rsp+8*477], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*478] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*478]
	call    address
	mov [rsp+8*479], rax
	mov r8, [rsp+8*479]
	mov r8, [r8]
	mov [rsp+8*480], r8
	mov     rsi, [rsp+8*480]
	mov     rdi, [rsp+8*477]
	call    concat
	mov [rsp+8*481], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*482] ,r8
	mov     rsi, 86
	mov     rdi, [rsp+8*482]
	call    address
	mov [rsp+8*483], rax
	mov r8, [rsp+8*483]
	mov r8, [r8]
	mov [rsp+8*484], r8
	mov     rsi, [rsp+8*484]
	mov     rdi, [rsp+8*481]
	call    concat
	mov [rsp+8*485], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*486] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*486]
	call    address
	mov [rsp+8*487], rax
	mov r8, [rsp+8*487]
	mov r8, [r8]
	mov [rsp+8*488], r8
	mov     rsi, [rsp+8*488]
	mov     rdi, [rsp+8*485]
	call    concat
	mov [rsp+8*489], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*490] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*490]
	call    address
	mov [rsp+8*491], rax
	mov r8, [rsp+8*491]
	mov r8, [r8]
	mov [rsp+8*492], r8
	mov     rsi, [rsp+8*492]
	mov     rdi, [rsp+8*489]
	call    concat
	mov [rsp+8*493], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*494] ,r8
	mov     rsi, 17
	mov     rdi, [rsp+8*494]
	call    address
	mov [rsp+8*495], rax
	mov r8, [rsp+8*495]
	mov r8, [r8]
	mov [rsp+8*496], r8
	mov     rsi, [rsp+8*496]
	mov     rdi, [rsp+8*493]
	call    concat
	mov [rsp+8*497], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*498] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*498]
	call    address
	mov [rsp+8*499], rax
	mov r8, [rsp+8*499]
	mov r8, [r8]
	mov [rsp+8*500], r8
	mov     rsi, [rsp+8*500]
	mov     rdi, [rsp+8*497]
	call    concat
	mov [rsp+8*501], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*502] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*502]
	call    address
	mov [rsp+8*503], rax
	mov r8, [rsp+8*503]
	mov r8, [r8]
	mov [rsp+8*504], r8
	mov     rsi, [rsp+8*504]
	mov     rdi, [rsp+8*501]
	call    concat
	mov [rsp+8*505], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*506] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*506]
	call    address
	mov [rsp+8*507], rax
	mov r8, [rsp+8*507]
	mov r8, [r8]
	mov [rsp+8*508], r8
	mov     rsi, [rsp+8*508]
	mov     rdi, [rsp+8*505]
	call    concat
	mov [rsp+8*509], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*510] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*510]
	call    address
	mov [rsp+8*511], rax
	mov r8, [rsp+8*511]
	mov r8, [r8]
	mov [rsp+8*512], r8
	mov     rsi, [rsp+8*512]
	mov     rdi, [rsp+8*509]
	call    concat
	mov [rsp+8*513], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*514] ,r8
	mov     rsi, 83
	mov     rdi, [rsp+8*514]
	call    address
	mov [rsp+8*515], rax
	mov r8, [rsp+8*515]
	mov r8, [r8]
	mov [rsp+8*516], r8
	mov     rsi, [rsp+8*516]
	mov     rdi, [rsp+8*513]
	call    concat
	mov [rsp+8*517], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*518] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*518]
	call    address
	mov [rsp+8*519], rax
	mov r8, [rsp+8*519]
	mov r8, [r8]
	mov [rsp+8*520], r8
	mov     rsi, [rsp+8*520]
	mov     rdi, [rsp+8*517]
	call    concat
	mov [rsp+8*521], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*522] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*522]
	call    address
	mov [rsp+8*523], rax
	mov r8, [rsp+8*523]
	mov r8, [r8]
	mov [rsp+8*524], r8
	mov     rsi, [rsp+8*524]
	mov     rdi, [rsp+8*521]
	call    concat
	mov [rsp+8*525], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*526] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*526]
	call    address
	mov [rsp+8*527], rax
	mov r8, [rsp+8*527]
	mov r8, [r8]
	mov [rsp+8*528], r8
	mov     rsi, [rsp+8*528]
	mov     rdi, [rsp+8*525]
	call    concat
	mov [rsp+8*529], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*529]
	call    concat
	mov [rsp+8*530], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*531] ,r8
	mov     rsi, 17
	mov     rdi, [rsp+8*531]
	call    address
	mov [rsp+8*532], rax
	mov r8, [rsp+8*532]
	mov r8, [r8]
	mov [rsp+8*533], r8
	mov     rsi, [rsp+8*533]
	mov     rdi, [rsp+8*530]
	call    concat
	mov [rsp+8*534], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*534]
	call    concat
	mov [rsp+8*535], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*536] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*536]
	call    address
	mov [rsp+8*537], rax
	mov r8, [rsp+8*537]
	mov r8, [r8]
	mov [rsp+8*538], r8
	mov     rsi, [rsp+8*538]
	mov     rdi, [rsp+8*535]
	call    concat
	mov [rsp+8*539], rax
	mov r8, [rsp+8*539]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*540] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*540] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*541] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*541]
	call    address
	mov [rsp+8*542], rax
	mov r8, [rsp+8*542]
	mov r8, [r8]
	mov [rsp+8*543], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*544] ,r8
	mov     rsi, 68
	mov     rdi, [rsp+8*544]
	call    address
	mov [rsp+8*545], rax
	mov r8, [rsp+8*545]
	mov r8, [r8]
	mov [rsp+8*546], r8
	mov     rsi, [rsp+8*546]
	mov     rdi, [rsp+8*543]
	call    concat
	mov [rsp+8*547], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*548] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*548]
	call    address
	mov [rsp+8*549], rax
	mov r8, [rsp+8*549]
	mov r8, [r8]
	mov [rsp+8*550], r8
	mov     rsi, [rsp+8*550]
	mov     rdi, [rsp+8*547]
	call    concat
	mov [rsp+8*551], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*552] ,r8
	mov     rsi, 86
	mov     rdi, [rsp+8*552]
	call    address
	mov [rsp+8*553], rax
	mov r8, [rsp+8*553]
	mov r8, [r8]
	mov [rsp+8*554], r8
	mov     rsi, [rsp+8*554]
	mov     rdi, [rsp+8*551]
	call    concat
	mov [rsp+8*555], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*556] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*556]
	call    address
	mov [rsp+8*557], rax
	mov r8, [rsp+8*557]
	mov r8, [r8]
	mov [rsp+8*558], r8
	mov     rsi, [rsp+8*558]
	mov     rdi, [rsp+8*555]
	call    concat
	mov [rsp+8*559], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*560] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*560]
	call    address
	mov [rsp+8*561], rax
	mov r8, [rsp+8*561]
	mov r8, [r8]
	mov [rsp+8*562], r8
	mov     rsi, [rsp+8*562]
	mov     rdi, [rsp+8*559]
	call    concat
	mov [rsp+8*563], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*564] ,r8
	mov     rsi, 18
	mov     rdi, [rsp+8*564]
	call    address
	mov [rsp+8*565], rax
	mov r8, [rsp+8*565]
	mov r8, [r8]
	mov [rsp+8*566], r8
	mov     rsi, [rsp+8*566]
	mov     rdi, [rsp+8*563]
	call    concat
	mov [rsp+8*567], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*568] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*568]
	call    address
	mov [rsp+8*569], rax
	mov r8, [rsp+8*569]
	mov r8, [r8]
	mov [rsp+8*570], r8
	mov     rsi, [rsp+8*570]
	mov     rdi, [rsp+8*567]
	call    concat
	mov [rsp+8*571], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*572] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*572]
	call    address
	mov [rsp+8*573], rax
	mov r8, [rsp+8*573]
	mov r8, [r8]
	mov [rsp+8*574], r8
	mov     rsi, [rsp+8*574]
	mov     rdi, [rsp+8*571]
	call    concat
	mov [rsp+8*575], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*576] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*576]
	call    address
	mov [rsp+8*577], rax
	mov r8, [rsp+8*577]
	mov r8, [r8]
	mov [rsp+8*578], r8
	mov     rsi, [rsp+8*578]
	mov     rdi, [rsp+8*575]
	call    concat
	mov [rsp+8*579], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*580] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*580]
	call    address
	mov [rsp+8*581], rax
	mov r8, [rsp+8*581]
	mov r8, [r8]
	mov [rsp+8*582], r8
	mov     rsi, [rsp+8*582]
	mov     rdi, [rsp+8*579]
	call    concat
	mov [rsp+8*583], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*584] ,r8
	mov     rsi, 83
	mov     rdi, [rsp+8*584]
	call    address
	mov [rsp+8*585], rax
	mov r8, [rsp+8*585]
	mov r8, [r8]
	mov [rsp+8*586], r8
	mov     rsi, [rsp+8*586]
	mov     rdi, [rsp+8*583]
	call    concat
	mov [rsp+8*587], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*588] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*588]
	call    address
	mov [rsp+8*589], rax
	mov r8, [rsp+8*589]
	mov r8, [r8]
	mov [rsp+8*590], r8
	mov     rsi, [rsp+8*590]
	mov     rdi, [rsp+8*587]
	call    concat
	mov [rsp+8*591], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*592] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*592]
	call    address
	mov [rsp+8*593], rax
	mov r8, [rsp+8*593]
	mov r8, [r8]
	mov [rsp+8*594], r8
	mov     rsi, [rsp+8*594]
	mov     rdi, [rsp+8*591]
	call    concat
	mov [rsp+8*595], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*596] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*596]
	call    address
	mov [rsp+8*597], rax
	mov r8, [rsp+8*597]
	mov r8, [r8]
	mov [rsp+8*598], r8
	mov     rsi, [rsp+8*598]
	mov     rdi, [rsp+8*595]
	call    concat
	mov [rsp+8*599], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*599]
	call    concat
	mov [rsp+8*600], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*601] ,r8
	mov     rsi, 18
	mov     rdi, [rsp+8*601]
	call    address
	mov [rsp+8*602], rax
	mov r8, [rsp+8*602]
	mov r8, [r8]
	mov [rsp+8*603], r8
	mov     rsi, [rsp+8*603]
	mov     rdi, [rsp+8*600]
	call    concat
	mov [rsp+8*604], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*604]
	call    concat
	mov [rsp+8*605], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*606] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*606]
	call    address
	mov [rsp+8*607], rax
	mov r8, [rsp+8*607]
	mov r8, [r8]
	mov [rsp+8*608], r8
	mov     rsi, [rsp+8*608]
	mov     rdi, [rsp+8*605]
	call    concat
	mov [rsp+8*609], rax
	mov r8, [rsp+8*609]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*610] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*610] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*611] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*611]
	call    address
	mov [rsp+8*612], rax
	mov r8, [rsp+8*612]
	mov r8, [r8]
	mov [rsp+8*613], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*614] ,r8
	mov     rsi, 68
	mov     rdi, [rsp+8*614]
	call    address
	mov [rsp+8*615], rax
	mov r8, [rsp+8*615]
	mov r8, [r8]
	mov [rsp+8*616], r8
	mov     rsi, [rsp+8*616]
	mov     rdi, [rsp+8*613]
	call    concat
	mov [rsp+8*617], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*618] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*618]
	call    address
	mov [rsp+8*619], rax
	mov r8, [rsp+8*619]
	mov r8, [r8]
	mov [rsp+8*620], r8
	mov     rsi, [rsp+8*620]
	mov     rdi, [rsp+8*617]
	call    concat
	mov [rsp+8*621], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*622] ,r8
	mov     rsi, 86
	mov     rdi, [rsp+8*622]
	call    address
	mov [rsp+8*623], rax
	mov r8, [rsp+8*623]
	mov r8, [r8]
	mov [rsp+8*624], r8
	mov     rsi, [rsp+8*624]
	mov     rdi, [rsp+8*621]
	call    concat
	mov [rsp+8*625], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*626] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*626]
	call    address
	mov [rsp+8*627], rax
	mov r8, [rsp+8*627]
	mov r8, [r8]
	mov [rsp+8*628], r8
	mov     rsi, [rsp+8*628]
	mov     rdi, [rsp+8*625]
	call    concat
	mov [rsp+8*629], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*630] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*630]
	call    address
	mov [rsp+8*631], rax
	mov r8, [rsp+8*631]
	mov r8, [r8]
	mov [rsp+8*632], r8
	mov     rsi, [rsp+8*632]
	mov     rdi, [rsp+8*629]
	call    concat
	mov [rsp+8*633], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*634] ,r8
	mov     rsi, 19
	mov     rdi, [rsp+8*634]
	call    address
	mov [rsp+8*635], rax
	mov r8, [rsp+8*635]
	mov r8, [r8]
	mov [rsp+8*636], r8
	mov     rsi, [rsp+8*636]
	mov     rdi, [rsp+8*633]
	call    concat
	mov [rsp+8*637], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*638] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*638]
	call    address
	mov [rsp+8*639], rax
	mov r8, [rsp+8*639]
	mov r8, [r8]
	mov [rsp+8*640], r8
	mov     rsi, [rsp+8*640]
	mov     rdi, [rsp+8*637]
	call    concat
	mov [rsp+8*641], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*642] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*642]
	call    address
	mov [rsp+8*643], rax
	mov r8, [rsp+8*643]
	mov r8, [r8]
	mov [rsp+8*644], r8
	mov     rsi, [rsp+8*644]
	mov     rdi, [rsp+8*641]
	call    concat
	mov [rsp+8*645], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*646] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*646]
	call    address
	mov [rsp+8*647], rax
	mov r8, [rsp+8*647]
	mov r8, [r8]
	mov [rsp+8*648], r8
	mov     rsi, [rsp+8*648]
	mov     rdi, [rsp+8*645]
	call    concat
	mov [rsp+8*649], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*650] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*650]
	call    address
	mov [rsp+8*651], rax
	mov r8, [rsp+8*651]
	mov r8, [r8]
	mov [rsp+8*652], r8
	mov     rsi, [rsp+8*652]
	mov     rdi, [rsp+8*649]
	call    concat
	mov [rsp+8*653], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*654] ,r8
	mov     rsi, 83
	mov     rdi, [rsp+8*654]
	call    address
	mov [rsp+8*655], rax
	mov r8, [rsp+8*655]
	mov r8, [r8]
	mov [rsp+8*656], r8
	mov     rsi, [rsp+8*656]
	mov     rdi, [rsp+8*653]
	call    concat
	mov [rsp+8*657], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*658] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*658]
	call    address
	mov [rsp+8*659], rax
	mov r8, [rsp+8*659]
	mov r8, [r8]
	mov [rsp+8*660], r8
	mov     rsi, [rsp+8*660]
	mov     rdi, [rsp+8*657]
	call    concat
	mov [rsp+8*661], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*662] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*662]
	call    address
	mov [rsp+8*663], rax
	mov r8, [rsp+8*663]
	mov r8, [r8]
	mov [rsp+8*664], r8
	mov     rsi, [rsp+8*664]
	mov     rdi, [rsp+8*661]
	call    concat
	mov [rsp+8*665], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*666] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*666]
	call    address
	mov [rsp+8*667], rax
	mov r8, [rsp+8*667]
	mov r8, [r8]
	mov [rsp+8*668], r8
	mov     rsi, [rsp+8*668]
	mov     rdi, [rsp+8*665]
	call    concat
	mov [rsp+8*669], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*669]
	call    concat
	mov [rsp+8*670], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*671] ,r8
	mov     rsi, 19
	mov     rdi, [rsp+8*671]
	call    address
	mov [rsp+8*672], rax
	mov r8, [rsp+8*672]
	mov r8, [r8]
	mov [rsp+8*673], r8
	mov     rsi, [rsp+8*673]
	mov     rdi, [rsp+8*670]
	call    concat
	mov [rsp+8*674], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*674]
	call    concat
	mov [rsp+8*675], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*676] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*676]
	call    address
	mov [rsp+8*677], rax
	mov r8, [rsp+8*677]
	mov r8, [r8]
	mov [rsp+8*678], r8
	mov     rsi, [rsp+8*678]
	mov     rdi, [rsp+8*675]
	call    concat
	mov [rsp+8*679], rax
	mov r8, [rsp+8*679]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*680] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*680] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*681] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*681]
	call    address
	mov [rsp+8*682], rax
	mov r8, [rsp+8*682]
	mov r8, [r8]
	mov [rsp+8*683], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*684] ,r8
	mov     rsi, 68
	mov     rdi, [rsp+8*684]
	call    address
	mov [rsp+8*685], rax
	mov r8, [rsp+8*685]
	mov r8, [r8]
	mov [rsp+8*686], r8
	mov     rsi, [rsp+8*686]
	mov     rdi, [rsp+8*683]
	call    concat
	mov [rsp+8*687], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*688] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*688]
	call    address
	mov [rsp+8*689], rax
	mov r8, [rsp+8*689]
	mov r8, [r8]
	mov [rsp+8*690], r8
	mov     rsi, [rsp+8*690]
	mov     rdi, [rsp+8*687]
	call    concat
	mov [rsp+8*691], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*692] ,r8
	mov     rsi, 86
	mov     rdi, [rsp+8*692]
	call    address
	mov [rsp+8*693], rax
	mov r8, [rsp+8*693]
	mov r8, [r8]
	mov [rsp+8*694], r8
	mov     rsi, [rsp+8*694]
	mov     rdi, [rsp+8*691]
	call    concat
	mov [rsp+8*695], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*696] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*696]
	call    address
	mov [rsp+8*697], rax
	mov r8, [rsp+8*697]
	mov r8, [r8]
	mov [rsp+8*698], r8
	mov     rsi, [rsp+8*698]
	mov     rdi, [rsp+8*695]
	call    concat
	mov [rsp+8*699], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*700] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*700]
	call    address
	mov [rsp+8*701], rax
	mov r8, [rsp+8*701]
	mov r8, [r8]
	mov [rsp+8*702], r8
	mov     rsi, [rsp+8*702]
	mov     rdi, [rsp+8*699]
	call    concat
	mov [rsp+8*703], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*704] ,r8
	mov     rsi, 20
	mov     rdi, [rsp+8*704]
	call    address
	mov [rsp+8*705], rax
	mov r8, [rsp+8*705]
	mov r8, [r8]
	mov [rsp+8*706], r8
	mov     rsi, [rsp+8*706]
	mov     rdi, [rsp+8*703]
	call    concat
	mov [rsp+8*707], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*708] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*708]
	call    address
	mov [rsp+8*709], rax
	mov r8, [rsp+8*709]
	mov r8, [r8]
	mov [rsp+8*710], r8
	mov     rsi, [rsp+8*710]
	mov     rdi, [rsp+8*707]
	call    concat
	mov [rsp+8*711], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*712] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*712]
	call    address
	mov [rsp+8*713], rax
	mov r8, [rsp+8*713]
	mov r8, [r8]
	mov [rsp+8*714], r8
	mov     rsi, [rsp+8*714]
	mov     rdi, [rsp+8*711]
	call    concat
	mov [rsp+8*715], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*716] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*716]
	call    address
	mov [rsp+8*717], rax
	mov r8, [rsp+8*717]
	mov r8, [r8]
	mov [rsp+8*718], r8
	mov     rsi, [rsp+8*718]
	mov     rdi, [rsp+8*715]
	call    concat
	mov [rsp+8*719], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*720] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*720]
	call    address
	mov [rsp+8*721], rax
	mov r8, [rsp+8*721]
	mov r8, [r8]
	mov [rsp+8*722], r8
	mov     rsi, [rsp+8*722]
	mov     rdi, [rsp+8*719]
	call    concat
	mov [rsp+8*723], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*724] ,r8
	mov     rsi, 83
	mov     rdi, [rsp+8*724]
	call    address
	mov [rsp+8*725], rax
	mov r8, [rsp+8*725]
	mov r8, [r8]
	mov [rsp+8*726], r8
	mov     rsi, [rsp+8*726]
	mov     rdi, [rsp+8*723]
	call    concat
	mov [rsp+8*727], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*728] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*728]
	call    address
	mov [rsp+8*729], rax
	mov r8, [rsp+8*729]
	mov r8, [r8]
	mov [rsp+8*730], r8
	mov     rsi, [rsp+8*730]
	mov     rdi, [rsp+8*727]
	call    concat
	mov [rsp+8*731], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*732] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*732]
	call    address
	mov [rsp+8*733], rax
	mov r8, [rsp+8*733]
	mov r8, [r8]
	mov [rsp+8*734], r8
	mov     rsi, [rsp+8*734]
	mov     rdi, [rsp+8*731]
	call    concat
	mov [rsp+8*735], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*736] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*736]
	call    address
	mov [rsp+8*737], rax
	mov r8, [rsp+8*737]
	mov r8, [r8]
	mov [rsp+8*738], r8
	mov     rsi, [rsp+8*738]
	mov     rdi, [rsp+8*735]
	call    concat
	mov [rsp+8*739], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*739]
	call    concat
	mov [rsp+8*740], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*741] ,r8
	mov     rsi, 20
	mov     rdi, [rsp+8*741]
	call    address
	mov [rsp+8*742], rax
	mov r8, [rsp+8*742]
	mov r8, [r8]
	mov [rsp+8*743], r8
	mov     rsi, [rsp+8*743]
	mov     rdi, [rsp+8*740]
	call    concat
	mov [rsp+8*744], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*744]
	call    concat
	mov [rsp+8*745], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*746] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*746]
	call    address
	mov [rsp+8*747], rax
	mov r8, [rsp+8*747]
	mov r8, [r8]
	mov [rsp+8*748], r8
	mov     rsi, [rsp+8*748]
	mov     rdi, [rsp+8*745]
	call    concat
	mov [rsp+8*749], rax
	mov r8, [rsp+8*749]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*750] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*750] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*751] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*751]
	call    address
	mov [rsp+8*752], rax
	mov r8, [rsp+8*752]
	mov r8, [r8]
	mov [rsp+8*753], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*754] ,r8
	mov     rsi, 68
	mov     rdi, [rsp+8*754]
	call    address
	mov [rsp+8*755], rax
	mov r8, [rsp+8*755]
	mov r8, [r8]
	mov [rsp+8*756], r8
	mov     rsi, [rsp+8*756]
	mov     rdi, [rsp+8*753]
	call    concat
	mov [rsp+8*757], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*758] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*758]
	call    address
	mov [rsp+8*759], rax
	mov r8, [rsp+8*759]
	mov r8, [r8]
	mov [rsp+8*760], r8
	mov     rsi, [rsp+8*760]
	mov     rdi, [rsp+8*757]
	call    concat
	mov [rsp+8*761], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*762] ,r8
	mov     rsi, 86
	mov     rdi, [rsp+8*762]
	call    address
	mov [rsp+8*763], rax
	mov r8, [rsp+8*763]
	mov r8, [r8]
	mov [rsp+8*764], r8
	mov     rsi, [rsp+8*764]
	mov     rdi, [rsp+8*761]
	call    concat
	mov [rsp+8*765], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*766] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*766]
	call    address
	mov [rsp+8*767], rax
	mov r8, [rsp+8*767]
	mov r8, [r8]
	mov [rsp+8*768], r8
	mov     rsi, [rsp+8*768]
	mov     rdi, [rsp+8*765]
	call    concat
	mov [rsp+8*769], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*770] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*770]
	call    address
	mov [rsp+8*771], rax
	mov r8, [rsp+8*771]
	mov r8, [r8]
	mov [rsp+8*772], r8
	mov     rsi, [rsp+8*772]
	mov     rdi, [rsp+8*769]
	call    concat
	mov [rsp+8*773], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*774] ,r8
	mov     rsi, 21
	mov     rdi, [rsp+8*774]
	call    address
	mov [rsp+8*775], rax
	mov r8, [rsp+8*775]
	mov r8, [r8]
	mov [rsp+8*776], r8
	mov     rsi, [rsp+8*776]
	mov     rdi, [rsp+8*773]
	call    concat
	mov [rsp+8*777], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*778] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*778]
	call    address
	mov [rsp+8*779], rax
	mov r8, [rsp+8*779]
	mov r8, [r8]
	mov [rsp+8*780], r8
	mov     rsi, [rsp+8*780]
	mov     rdi, [rsp+8*777]
	call    concat
	mov [rsp+8*781], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*782] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*782]
	call    address
	mov [rsp+8*783], rax
	mov r8, [rsp+8*783]
	mov r8, [r8]
	mov [rsp+8*784], r8
	mov     rsi, [rsp+8*784]
	mov     rdi, [rsp+8*781]
	call    concat
	mov [rsp+8*785], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*786] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*786]
	call    address
	mov [rsp+8*787], rax
	mov r8, [rsp+8*787]
	mov r8, [r8]
	mov [rsp+8*788], r8
	mov     rsi, [rsp+8*788]
	mov     rdi, [rsp+8*785]
	call    concat
	mov [rsp+8*789], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*790] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*790]
	call    address
	mov [rsp+8*791], rax
	mov r8, [rsp+8*791]
	mov r8, [r8]
	mov [rsp+8*792], r8
	mov     rsi, [rsp+8*792]
	mov     rdi, [rsp+8*789]
	call    concat
	mov [rsp+8*793], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*794] ,r8
	mov     rsi, 83
	mov     rdi, [rsp+8*794]
	call    address
	mov [rsp+8*795], rax
	mov r8, [rsp+8*795]
	mov r8, [r8]
	mov [rsp+8*796], r8
	mov     rsi, [rsp+8*796]
	mov     rdi, [rsp+8*793]
	call    concat
	mov [rsp+8*797], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*798] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*798]
	call    address
	mov [rsp+8*799], rax
	mov r8, [rsp+8*799]
	mov r8, [r8]
	mov [rsp+8*800], r8
	mov     rsi, [rsp+8*800]
	mov     rdi, [rsp+8*797]
	call    concat
	mov [rsp+8*801], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*802] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*802]
	call    address
	mov [rsp+8*803], rax
	mov r8, [rsp+8*803]
	mov r8, [r8]
	mov [rsp+8*804], r8
	mov     rsi, [rsp+8*804]
	mov     rdi, [rsp+8*801]
	call    concat
	mov [rsp+8*805], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*806] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*806]
	call    address
	mov [rsp+8*807], rax
	mov r8, [rsp+8*807]
	mov r8, [r8]
	mov [rsp+8*808], r8
	mov     rsi, [rsp+8*808]
	mov     rdi, [rsp+8*805]
	call    concat
	mov [rsp+8*809], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*809]
	call    concat
	mov [rsp+8*810], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*811] ,r8
	mov     rsi, 21
	mov     rdi, [rsp+8*811]
	call    address
	mov [rsp+8*812], rax
	mov r8, [rsp+8*812]
	mov r8, [r8]
	mov [rsp+8*813], r8
	mov     rsi, [rsp+8*813]
	mov     rdi, [rsp+8*810]
	call    concat
	mov [rsp+8*814], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*814]
	call    concat
	mov [rsp+8*815], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*816] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*816]
	call    address
	mov [rsp+8*817], rax
	mov r8, [rsp+8*817]
	mov r8, [r8]
	mov [rsp+8*818], r8
	mov     rsi, [rsp+8*818]
	mov     rdi, [rsp+8*815]
	call    concat
	mov [rsp+8*819], rax
	mov r8, [rsp+8*819]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*820] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*820] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*821] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*821]
	call    address
	mov [rsp+8*822], rax
	mov r8, [rsp+8*822]
	mov r8, [r8]
	mov [rsp+8*823], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*824] ,r8
	mov     rsi, 68
	mov     rdi, [rsp+8*824]
	call    address
	mov [rsp+8*825], rax
	mov r8, [rsp+8*825]
	mov r8, [r8]
	mov [rsp+8*826], r8
	mov     rsi, [rsp+8*826]
	mov     rdi, [rsp+8*823]
	call    concat
	mov [rsp+8*827], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*828] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*828]
	call    address
	mov [rsp+8*829], rax
	mov r8, [rsp+8*829]
	mov r8, [r8]
	mov [rsp+8*830], r8
	mov     rsi, [rsp+8*830]
	mov     rdi, [rsp+8*827]
	call    concat
	mov [rsp+8*831], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*832] ,r8
	mov     rsi, 86
	mov     rdi, [rsp+8*832]
	call    address
	mov [rsp+8*833], rax
	mov r8, [rsp+8*833]
	mov r8, [r8]
	mov [rsp+8*834], r8
	mov     rsi, [rsp+8*834]
	mov     rdi, [rsp+8*831]
	call    concat
	mov [rsp+8*835], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*836] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*836]
	call    address
	mov [rsp+8*837], rax
	mov r8, [rsp+8*837]
	mov r8, [r8]
	mov [rsp+8*838], r8
	mov     rsi, [rsp+8*838]
	mov     rdi, [rsp+8*835]
	call    concat
	mov [rsp+8*839], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*840] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*840]
	call    address
	mov [rsp+8*841], rax
	mov r8, [rsp+8*841]
	mov r8, [r8]
	mov [rsp+8*842], r8
	mov     rsi, [rsp+8*842]
	mov     rdi, [rsp+8*839]
	call    concat
	mov [rsp+8*843], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*844] ,r8
	mov     rsi, 22
	mov     rdi, [rsp+8*844]
	call    address
	mov [rsp+8*845], rax
	mov r8, [rsp+8*845]
	mov r8, [r8]
	mov [rsp+8*846], r8
	mov     rsi, [rsp+8*846]
	mov     rdi, [rsp+8*843]
	call    concat
	mov [rsp+8*847], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*848] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*848]
	call    address
	mov [rsp+8*849], rax
	mov r8, [rsp+8*849]
	mov r8, [r8]
	mov [rsp+8*850], r8
	mov     rsi, [rsp+8*850]
	mov     rdi, [rsp+8*847]
	call    concat
	mov [rsp+8*851], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*852] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*852]
	call    address
	mov [rsp+8*853], rax
	mov r8, [rsp+8*853]
	mov r8, [r8]
	mov [rsp+8*854], r8
	mov     rsi, [rsp+8*854]
	mov     rdi, [rsp+8*851]
	call    concat
	mov [rsp+8*855], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*856] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*856]
	call    address
	mov [rsp+8*857], rax
	mov r8, [rsp+8*857]
	mov r8, [r8]
	mov [rsp+8*858], r8
	mov     rsi, [rsp+8*858]
	mov     rdi, [rsp+8*855]
	call    concat
	mov [rsp+8*859], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*860] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*860]
	call    address
	mov [rsp+8*861], rax
	mov r8, [rsp+8*861]
	mov r8, [r8]
	mov [rsp+8*862], r8
	mov     rsi, [rsp+8*862]
	mov     rdi, [rsp+8*859]
	call    concat
	mov [rsp+8*863], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*864] ,r8
	mov     rsi, 83
	mov     rdi, [rsp+8*864]
	call    address
	mov [rsp+8*865], rax
	mov r8, [rsp+8*865]
	mov r8, [r8]
	mov [rsp+8*866], r8
	mov     rsi, [rsp+8*866]
	mov     rdi, [rsp+8*863]
	call    concat
	mov [rsp+8*867], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*868] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*868]
	call    address
	mov [rsp+8*869], rax
	mov r8, [rsp+8*869]
	mov r8, [r8]
	mov [rsp+8*870], r8
	mov     rsi, [rsp+8*870]
	mov     rdi, [rsp+8*867]
	call    concat
	mov [rsp+8*871], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*872] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*872]
	call    address
	mov [rsp+8*873], rax
	mov r8, [rsp+8*873]
	mov r8, [r8]
	mov [rsp+8*874], r8
	mov     rsi, [rsp+8*874]
	mov     rdi, [rsp+8*871]
	call    concat
	mov [rsp+8*875], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*876] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*876]
	call    address
	mov [rsp+8*877], rax
	mov r8, [rsp+8*877]
	mov r8, [r8]
	mov [rsp+8*878], r8
	mov     rsi, [rsp+8*878]
	mov     rdi, [rsp+8*875]
	call    concat
	mov [rsp+8*879], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*879]
	call    concat
	mov [rsp+8*880], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*881] ,r8
	mov     rsi, 22
	mov     rdi, [rsp+8*881]
	call    address
	mov [rsp+8*882], rax
	mov r8, [rsp+8*882]
	mov r8, [r8]
	mov [rsp+8*883], r8
	mov     rsi, [rsp+8*883]
	mov     rdi, [rsp+8*880]
	call    concat
	mov [rsp+8*884], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*884]
	call    concat
	mov [rsp+8*885], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*886] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*886]
	call    address
	mov [rsp+8*887], rax
	mov r8, [rsp+8*887]
	mov r8, [r8]
	mov [rsp+8*888], r8
	mov     rsi, [rsp+8*888]
	mov     rdi, [rsp+8*885]
	call    concat
	mov [rsp+8*889], rax
	mov r8, [rsp+8*889]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*890] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*890] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*891] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*891]
	call    address
	mov [rsp+8*892], rax
	mov r8, [rsp+8*892]
	mov r8, [r8]
	mov [rsp+8*893], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*894] ,r8
	mov     rsi, 68
	mov     rdi, [rsp+8*894]
	call    address
	mov [rsp+8*895], rax
	mov r8, [rsp+8*895]
	mov r8, [r8]
	mov [rsp+8*896], r8
	mov     rsi, [rsp+8*896]
	mov     rdi, [rsp+8*893]
	call    concat
	mov [rsp+8*897], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*898] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*898]
	call    address
	mov [rsp+8*899], rax
	mov r8, [rsp+8*899]
	mov r8, [r8]
	mov [rsp+8*900], r8
	mov     rsi, [rsp+8*900]
	mov     rdi, [rsp+8*897]
	call    concat
	mov [rsp+8*901], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*902] ,r8
	mov     rsi, 86
	mov     rdi, [rsp+8*902]
	call    address
	mov [rsp+8*903], rax
	mov r8, [rsp+8*903]
	mov r8, [r8]
	mov [rsp+8*904], r8
	mov     rsi, [rsp+8*904]
	mov     rdi, [rsp+8*901]
	call    concat
	mov [rsp+8*905], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*906] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*906]
	call    address
	mov [rsp+8*907], rax
	mov r8, [rsp+8*907]
	mov r8, [r8]
	mov [rsp+8*908], r8
	mov     rsi, [rsp+8*908]
	mov     rdi, [rsp+8*905]
	call    concat
	mov [rsp+8*909], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*910] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*910]
	call    address
	mov [rsp+8*911], rax
	mov r8, [rsp+8*911]
	mov r8, [r8]
	mov [rsp+8*912], r8
	mov     rsi, [rsp+8*912]
	mov     rdi, [rsp+8*909]
	call    concat
	mov [rsp+8*913], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*914] ,r8
	mov     rsi, 23
	mov     rdi, [rsp+8*914]
	call    address
	mov [rsp+8*915], rax
	mov r8, [rsp+8*915]
	mov r8, [r8]
	mov [rsp+8*916], r8
	mov     rsi, [rsp+8*916]
	mov     rdi, [rsp+8*913]
	call    concat
	mov [rsp+8*917], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*918] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*918]
	call    address
	mov [rsp+8*919], rax
	mov r8, [rsp+8*919]
	mov r8, [r8]
	mov [rsp+8*920], r8
	mov     rsi, [rsp+8*920]
	mov     rdi, [rsp+8*917]
	call    concat
	mov [rsp+8*921], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*922] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*922]
	call    address
	mov [rsp+8*923], rax
	mov r8, [rsp+8*923]
	mov r8, [r8]
	mov [rsp+8*924], r8
	mov     rsi, [rsp+8*924]
	mov     rdi, [rsp+8*921]
	call    concat
	mov [rsp+8*925], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*926] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*926]
	call    address
	mov [rsp+8*927], rax
	mov r8, [rsp+8*927]
	mov r8, [r8]
	mov [rsp+8*928], r8
	mov     rsi, [rsp+8*928]
	mov     rdi, [rsp+8*925]
	call    concat
	mov [rsp+8*929], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*930] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*930]
	call    address
	mov [rsp+8*931], rax
	mov r8, [rsp+8*931]
	mov r8, [r8]
	mov [rsp+8*932], r8
	mov     rsi, [rsp+8*932]
	mov     rdi, [rsp+8*929]
	call    concat
	mov [rsp+8*933], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*934] ,r8
	mov     rsi, 83
	mov     rdi, [rsp+8*934]
	call    address
	mov [rsp+8*935], rax
	mov r8, [rsp+8*935]
	mov r8, [r8]
	mov [rsp+8*936], r8
	mov     rsi, [rsp+8*936]
	mov     rdi, [rsp+8*933]
	call    concat
	mov [rsp+8*937], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*938] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*938]
	call    address
	mov [rsp+8*939], rax
	mov r8, [rsp+8*939]
	mov r8, [r8]
	mov [rsp+8*940], r8
	mov     rsi, [rsp+8*940]
	mov     rdi, [rsp+8*937]
	call    concat
	mov [rsp+8*941], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*942] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*942]
	call    address
	mov [rsp+8*943], rax
	mov r8, [rsp+8*943]
	mov r8, [r8]
	mov [rsp+8*944], r8
	mov     rsi, [rsp+8*944]
	mov     rdi, [rsp+8*941]
	call    concat
	mov [rsp+8*945], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*946] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*946]
	call    address
	mov [rsp+8*947], rax
	mov r8, [rsp+8*947]
	mov r8, [r8]
	mov [rsp+8*948], r8
	mov     rsi, [rsp+8*948]
	mov     rdi, [rsp+8*945]
	call    concat
	mov [rsp+8*949], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*949]
	call    concat
	mov [rsp+8*950], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*951] ,r8
	mov     rsi, 23
	mov     rdi, [rsp+8*951]
	call    address
	mov [rsp+8*952], rax
	mov r8, [rsp+8*952]
	mov r8, [r8]
	mov [rsp+8*953], r8
	mov     rsi, [rsp+8*953]
	mov     rdi, [rsp+8*950]
	call    concat
	mov [rsp+8*954], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*954]
	call    concat
	mov [rsp+8*955], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*956] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*956]
	call    address
	mov [rsp+8*957], rax
	mov r8, [rsp+8*957]
	mov r8, [r8]
	mov [rsp+8*958], r8
	mov     rsi, [rsp+8*958]
	mov     rdi, [rsp+8*955]
	call    concat
	mov [rsp+8*959], rax
	mov r8, [rsp+8*959]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*960] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*960] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*961] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*961]
	call    address
	mov [rsp+8*962], rax
	mov r8, [rsp+8*962]
	mov r8, [r8]
	mov [rsp+8*963], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*964] ,r8
	mov     rsi, 68
	mov     rdi, [rsp+8*964]
	call    address
	mov [rsp+8*965], rax
	mov r8, [rsp+8*965]
	mov r8, [r8]
	mov [rsp+8*966], r8
	mov     rsi, [rsp+8*966]
	mov     rdi, [rsp+8*963]
	call    concat
	mov [rsp+8*967], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*968] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*968]
	call    address
	mov [rsp+8*969], rax
	mov r8, [rsp+8*969]
	mov r8, [r8]
	mov [rsp+8*970], r8
	mov     rsi, [rsp+8*970]
	mov     rdi, [rsp+8*967]
	call    concat
	mov [rsp+8*971], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*972] ,r8
	mov     rsi, 86
	mov     rdi, [rsp+8*972]
	call    address
	mov [rsp+8*973], rax
	mov r8, [rsp+8*973]
	mov r8, [r8]
	mov [rsp+8*974], r8
	mov     rsi, [rsp+8*974]
	mov     rdi, [rsp+8*971]
	call    concat
	mov [rsp+8*975], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*976] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*976]
	call    address
	mov [rsp+8*977], rax
	mov r8, [rsp+8*977]
	mov r8, [r8]
	mov [rsp+8*978], r8
	mov     rsi, [rsp+8*978]
	mov     rdi, [rsp+8*975]
	call    concat
	mov [rsp+8*979], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*980] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*980]
	call    address
	mov [rsp+8*981], rax
	mov r8, [rsp+8*981]
	mov r8, [r8]
	mov [rsp+8*982], r8
	mov     rsi, [rsp+8*982]
	mov     rdi, [rsp+8*979]
	call    concat
	mov [rsp+8*983], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*984] ,r8
	mov     rsi, 24
	mov     rdi, [rsp+8*984]
	call    address
	mov [rsp+8*985], rax
	mov r8, [rsp+8*985]
	mov r8, [r8]
	mov [rsp+8*986], r8
	mov     rsi, [rsp+8*986]
	mov     rdi, [rsp+8*983]
	call    concat
	mov [rsp+8*987], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*988] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*988]
	call    address
	mov [rsp+8*989], rax
	mov r8, [rsp+8*989]
	mov r8, [r8]
	mov [rsp+8*990], r8
	mov     rsi, [rsp+8*990]
	mov     rdi, [rsp+8*987]
	call    concat
	mov [rsp+8*991], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*992] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*992]
	call    address
	mov [rsp+8*993], rax
	mov r8, [rsp+8*993]
	mov r8, [r8]
	mov [rsp+8*994], r8
	mov     rsi, [rsp+8*994]
	mov     rdi, [rsp+8*991]
	call    concat
	mov [rsp+8*995], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*996] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*996]
	call    address
	mov [rsp+8*997], rax
	mov r8, [rsp+8*997]
	mov r8, [r8]
	mov [rsp+8*998], r8
	mov     rsi, [rsp+8*998]
	mov     rdi, [rsp+8*995]
	call    concat
	mov [rsp+8*999], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1000] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1000]
	call    address
	mov [rsp+8*1001], rax
	mov r8, [rsp+8*1001]
	mov r8, [r8]
	mov [rsp+8*1002], r8
	mov     rsi, [rsp+8*1002]
	mov     rdi, [rsp+8*999]
	call    concat
	mov [rsp+8*1003], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1004] ,r8
	mov     rsi, 83
	mov     rdi, [rsp+8*1004]
	call    address
	mov [rsp+8*1005], rax
	mov r8, [rsp+8*1005]
	mov r8, [r8]
	mov [rsp+8*1006], r8
	mov     rsi, [rsp+8*1006]
	mov     rdi, [rsp+8*1003]
	call    concat
	mov [rsp+8*1007], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1008] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1008]
	call    address
	mov [rsp+8*1009], rax
	mov r8, [rsp+8*1009]
	mov r8, [r8]
	mov [rsp+8*1010], r8
	mov     rsi, [rsp+8*1010]
	mov     rdi, [rsp+8*1007]
	call    concat
	mov [rsp+8*1011], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1012] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1012]
	call    address
	mov [rsp+8*1013], rax
	mov r8, [rsp+8*1013]
	mov r8, [r8]
	mov [rsp+8*1014], r8
	mov     rsi, [rsp+8*1014]
	mov     rdi, [rsp+8*1011]
	call    concat
	mov [rsp+8*1015], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1016] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*1016]
	call    address
	mov [rsp+8*1017], rax
	mov r8, [rsp+8*1017]
	mov r8, [r8]
	mov [rsp+8*1018], r8
	mov     rsi, [rsp+8*1018]
	mov     rdi, [rsp+8*1015]
	call    concat
	mov [rsp+8*1019], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1019]
	call    concat
	mov [rsp+8*1020], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1021] ,r8
	mov     rsi, 24
	mov     rdi, [rsp+8*1021]
	call    address
	mov [rsp+8*1022], rax
	mov r8, [rsp+8*1022]
	mov r8, [r8]
	mov [rsp+8*1023], r8
	mov     rsi, [rsp+8*1023]
	mov     rdi, [rsp+8*1020]
	call    concat
	mov [rsp+8*1024], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1024]
	call    concat
	mov [rsp+8*1025], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1026] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*1026]
	call    address
	mov [rsp+8*1027], rax
	mov r8, [rsp+8*1027]
	mov r8, [r8]
	mov [rsp+8*1028], r8
	mov     rsi, [rsp+8*1028]
	mov     rdi, [rsp+8*1025]
	call    concat
	mov [rsp+8*1029], rax
	mov r8, [rsp+8*1029]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*1030] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*1030] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1031] ,r8
	mov     rsi, 91
	mov     rdi, [rsp+8*1031]
	call    address
	mov [rsp+8*1032], rax
	mov r8, [rsp+8*1032]
	mov r8, [r8]
	mov [rsp+8*1033], r8
	mov r8, [rsp+8*1033]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*1034] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*1034] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1035] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1035]
	call    address
	mov [rsp+8*1036], rax
	mov r8, [rsp+8*1036]
	mov r8, [r8]
	mov [rsp+8*1037], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1038] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1038]
	call    address
	mov [rsp+8*1039], rax
	mov r8, [rsp+8*1039]
	mov r8, [r8]
	mov [rsp+8*1040], r8
	mov     rsi, [rsp+8*1040]
	mov     rdi, [rsp+8*1037]
	call    concat
	mov [rsp+8*1041], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1042] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1042]
	call    address
	mov [rsp+8*1043], rax
	mov r8, [rsp+8*1043]
	mov r8, [r8]
	mov [rsp+8*1044], r8
	mov     rsi, [rsp+8*1044]
	mov     rdi, [rsp+8*1041]
	call    concat
	mov [rsp+8*1045], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1046] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1046]
	call    address
	mov [rsp+8*1047], rax
	mov r8, [rsp+8*1047]
	mov r8, [r8]
	mov [rsp+8*1048], r8
	mov     rsi, [rsp+8*1048]
	mov     rdi, [rsp+8*1045]
	call    concat
	mov [rsp+8*1049], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1050] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1050]
	call    address
	mov [rsp+8*1051], rax
	mov r8, [rsp+8*1051]
	mov r8, [r8]
	mov [rsp+8*1052], r8
	mov     rsi, [rsp+8*1052]
	mov     rdi, [rsp+8*1049]
	call    concat
	mov [rsp+8*1053], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1054] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*1054]
	call    address
	mov [rsp+8*1055], rax
	mov r8, [rsp+8*1055]
	mov r8, [r8]
	mov [rsp+8*1056], r8
	mov     rsi, [rsp+8*1056]
	mov     rdi, [rsp+8*1053]
	call    concat
	mov [rsp+8*1057], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1058] ,r8
	mov     rsi, 58
	mov     rdi, [rsp+8*1058]
	call    address
	mov [rsp+8*1059], rax
	mov r8, [rsp+8*1059]
	mov r8, [r8]
	mov [rsp+8*1060], r8
	mov     rsi, [rsp+8*1060]
	mov     rdi, [rsp+8*1057]
	call    concat
	mov [rsp+8*1061], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1062] ,r8
	mov     rsi, 59
	mov     rdi, [rsp+8*1062]
	call    address
	mov [rsp+8*1063], rax
	mov r8, [rsp+8*1063]
	mov r8, [r8]
	mov [rsp+8*1064], r8
	mov     rsi, [rsp+8*1064]
	mov     rdi, [rsp+8*1061]
	call    concat
	mov [rsp+8*1065], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1066] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*1066]
	call    address
	mov [rsp+8*1067], rax
	mov r8, [rsp+8*1067]
	mov r8, [r8]
	mov [rsp+8*1068], r8
	mov     rsi, [rsp+8*1068]
	mov     rdi, [rsp+8*1065]
	call    concat
	mov [rsp+8*1069], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1070] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1070]
	call    address
	mov [rsp+8*1071], rax
	mov r8, [rsp+8*1071]
	mov r8, [r8]
	mov [rsp+8*1072], r8
	mov     rsi, [rsp+8*1072]
	mov     rdi, [rsp+8*1069]
	call    concat
	mov [rsp+8*1073], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1074] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*1074]
	call    address
	mov [rsp+8*1075], rax
	mov r8, [rsp+8*1075]
	mov r8, [r8]
	mov [rsp+8*1076], r8
	mov     rsi, [rsp+8*1076]
	mov     rdi, [rsp+8*1073]
	call    concat
	mov [rsp+8*1077], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1078] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1078]
	call    address
	mov [rsp+8*1079], rax
	mov r8, [rsp+8*1079]
	mov r8, [r8]
	mov [rsp+8*1080], r8
	mov     rsi, [rsp+8*1080]
	mov     rdi, [rsp+8*1077]
	call    concat
	mov [rsp+8*1081], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1082] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*1082]
	call    address
	mov [rsp+8*1083], rax
	mov r8, [rsp+8*1083]
	mov r8, [r8]
	mov [rsp+8*1084], r8
	mov     rsi, [rsp+8*1084]
	mov     rdi, [rsp+8*1081]
	call    concat
	mov [rsp+8*1085], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1086] ,r8
	mov     rsi, 85
	mov     rdi, [rsp+8*1086]
	call    address
	mov [rsp+8*1087], rax
	mov r8, [rsp+8*1087]
	mov r8, [r8]
	mov [rsp+8*1088], r8
	mov     rsi, [rsp+8*1088]
	mov     rdi, [rsp+8*1085]
	call    concat
	mov [rsp+8*1089], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1090] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*1090]
	call    address
	mov [rsp+8*1091], rax
	mov r8, [rsp+8*1091]
	mov r8, [r8]
	mov [rsp+8*1092], r8
	mov     rsi, [rsp+8*1092]
	mov     rdi, [rsp+8*1089]
	call    concat
	mov [rsp+8*1093], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1094] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1094]
	call    address
	mov [rsp+8*1095], rax
	mov r8, [rsp+8*1095]
	mov r8, [r8]
	mov [rsp+8*1096], r8
	mov     rsi, [rsp+8*1096]
	mov     rdi, [rsp+8*1093]
	call    concat
	mov [rsp+8*1097], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1098] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1098]
	call    address
	mov [rsp+8*1099], rax
	mov r8, [rsp+8*1099]
	mov r8, [r8]
	mov [rsp+8*1100], r8
	mov     rsi, [rsp+8*1100]
	mov     rdi, [rsp+8*1097]
	call    concat
	mov [rsp+8*1101], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1102] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1102]
	call    address
	mov [rsp+8*1103], rax
	mov r8, [rsp+8*1103]
	mov r8, [r8]
	mov [rsp+8*1104], r8
	mov     rsi, [rsp+8*1104]
	mov     rdi, [rsp+8*1101]
	call    concat
	mov [rsp+8*1105], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1106] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1106]
	call    address
	mov [rsp+8*1107], rax
	mov r8, [rsp+8*1107]
	mov r8, [r8]
	mov [rsp+8*1108], r8
	mov     rsi, [rsp+8*1108]
	mov     rdi, [rsp+8*1105]
	call    concat
	mov [rsp+8*1109], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1110] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1110]
	call    address
	mov [rsp+8*1111], rax
	mov r8, [rsp+8*1111]
	mov r8, [r8]
	mov [rsp+8*1112], r8
	mov     rsi, [rsp+8*1112]
	mov     rdi, [rsp+8*1109]
	call    concat
	mov [rsp+8*1113], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1114] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*1114]
	call    address
	mov [rsp+8*1115], rax
	mov r8, [rsp+8*1115]
	mov r8, [r8]
	mov [rsp+8*1116], r8
	mov     rsi, [rsp+8*1116]
	mov     rdi, [rsp+8*1113]
	call    concat
	mov [rsp+8*1117], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1118] ,r8
	mov     rsi, 58
	mov     rdi, [rsp+8*1118]
	call    address
	mov [rsp+8*1119], rax
	mov r8, [rsp+8*1119]
	mov r8, [r8]
	mov [rsp+8*1120], r8
	mov     rsi, [rsp+8*1120]
	mov     rdi, [rsp+8*1117]
	call    concat
	mov [rsp+8*1121], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1122] ,r8
	mov     rsi, 17
	mov     rdi, [rsp+8*1122]
	call    address
	mov [rsp+8*1123], rax
	mov r8, [rsp+8*1123]
	mov r8, [r8]
	mov [rsp+8*1124], r8
	mov     rsi, [rsp+8*1124]
	mov     rdi, [rsp+8*1121]
	call    concat
	mov [rsp+8*1125], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1126] ,r8
	mov     rsi, 20
	mov     rdi, [rsp+8*1126]
	call    address
	mov [rsp+8*1127], rax
	mov r8, [rsp+8*1127]
	mov r8, [r8]
	mov [rsp+8*1128], r8
	mov     rsi, [rsp+8*1128]
	mov     rdi, [rsp+8*1125]
	call    concat
	mov [rsp+8*1129], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1130] ,r8
	mov     rsi, 21
	mov     rdi, [rsp+8*1130]
	call    address
	mov [rsp+8*1131], rax
	mov r8, [rsp+8*1131]
	mov r8, [r8]
	mov [rsp+8*1132], r8
	mov     rsi, [rsp+8*1132]
	mov     rdi, [rsp+8*1129]
	call    concat
	mov [rsp+8*1133], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1134] ,r8
	mov     rsi, 59
	mov     rdi, [rsp+8*1134]
	call    address
	mov [rsp+8*1135], rax
	mov r8, [rsp+8*1135]
	mov r8, [r8]
	mov [rsp+8*1136], r8
	mov     rsi, [rsp+8*1136]
	mov     rdi, [rsp+8*1133]
	call    concat
	mov [rsp+8*1137], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1138] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*1138]
	call    address
	mov [rsp+8*1139], rax
	mov r8, [rsp+8*1139]
	mov r8, [r8]
	mov [rsp+8*1140], r8
	mov     rsi, [rsp+8*1140]
	mov     rdi, [rsp+8*1137]
	call    concat
	mov [rsp+8*1141], rax
	mov r8, [rsp+8*1141]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*1142] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*1142] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1143] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1143]
	call    address
	mov [rsp+8*1144], rax
	mov r8, [rsp+8*1144]
	mov r8, [r8]
	mov [rsp+8*1145], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1146] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1146]
	call    address
	mov [rsp+8*1147], rax
	mov r8, [rsp+8*1147]
	mov r8, [r8]
	mov [rsp+8*1148], r8
	mov     rsi, [rsp+8*1148]
	mov     rdi, [rsp+8*1145]
	call    concat
	mov [rsp+8*1149], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1150] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1150]
	call    address
	mov [rsp+8*1151], rax
	mov r8, [rsp+8*1151]
	mov r8, [r8]
	mov [rsp+8*1152], r8
	mov     rsi, [rsp+8*1152]
	mov     rdi, [rsp+8*1149]
	call    concat
	mov [rsp+8*1153], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1154] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1154]
	call    address
	mov [rsp+8*1155], rax
	mov r8, [rsp+8*1155]
	mov r8, [r8]
	mov [rsp+8*1156], r8
	mov     rsi, [rsp+8*1156]
	mov     rdi, [rsp+8*1153]
	call    concat
	mov [rsp+8*1157], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1158] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1158]
	call    address
	mov [rsp+8*1159], rax
	mov r8, [rsp+8*1159]
	mov r8, [r8]
	mov [rsp+8*1160], r8
	mov     rsi, [rsp+8*1160]
	mov     rdi, [rsp+8*1157]
	call    concat
	mov [rsp+8*1161], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1162] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*1162]
	call    address
	mov [rsp+8*1163], rax
	mov r8, [rsp+8*1163]
	mov r8, [r8]
	mov [rsp+8*1164], r8
	mov     rsi, [rsp+8*1164]
	mov     rdi, [rsp+8*1161]
	call    concat
	mov [rsp+8*1165], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1166] ,r8
	mov     rsi, 58
	mov     rdi, [rsp+8*1166]
	call    address
	mov [rsp+8*1167], rax
	mov r8, [rsp+8*1167]
	mov r8, [r8]
	mov [rsp+8*1168], r8
	mov     rsi, [rsp+8*1168]
	mov     rdi, [rsp+8*1165]
	call    concat
	mov [rsp+8*1169], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1170] ,r8
	mov     rsi, 59
	mov     rdi, [rsp+8*1170]
	call    address
	mov [rsp+8*1171], rax
	mov r8, [rsp+8*1171]
	mov r8, [r8]
	mov [rsp+8*1172], r8
	mov     rsi, [rsp+8*1172]
	mov     rdi, [rsp+8*1169]
	call    concat
	mov [rsp+8*1173], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1174] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*1174]
	call    address
	mov [rsp+8*1175], rax
	mov r8, [rsp+8*1175]
	mov r8, [r8]
	mov [rsp+8*1176], r8
	mov     rsi, [rsp+8*1176]
	mov     rdi, [rsp+8*1173]
	call    concat
	mov [rsp+8*1177], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1178] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*1178]
	call    address
	mov [rsp+8*1179], rax
	mov r8, [rsp+8*1179]
	mov r8, [r8]
	mov [rsp+8*1180], r8
	mov     rsi, [rsp+8*1180]
	mov     rdi, [rsp+8*1177]
	call    concat
	mov [rsp+8*1181], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1182] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*1182]
	call    address
	mov [rsp+8*1183], rax
	mov r8, [rsp+8*1183]
	mov r8, [r8]
	mov [rsp+8*1184], r8
	mov     rsi, [rsp+8*1184]
	mov     rdi, [rsp+8*1181]
	call    concat
	mov [rsp+8*1185], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1186] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1186]
	call    address
	mov [rsp+8*1187], rax
	mov r8, [rsp+8*1187]
	mov r8, [r8]
	mov [rsp+8*1188], r8
	mov     rsi, [rsp+8*1188]
	mov     rdi, [rsp+8*1185]
	call    concat
	mov [rsp+8*1189], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1190] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*1190]
	call    address
	mov [rsp+8*1191], rax
	mov r8, [rsp+8*1191]
	mov r8, [r8]
	mov [rsp+8*1192], r8
	mov     rsi, [rsp+8*1192]
	mov     rdi, [rsp+8*1189]
	call    concat
	mov [rsp+8*1193], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1194] ,r8
	mov     rsi, 85
	mov     rdi, [rsp+8*1194]
	call    address
	mov [rsp+8*1195], rax
	mov r8, [rsp+8*1195]
	mov r8, [r8]
	mov [rsp+8*1196], r8
	mov     rsi, [rsp+8*1196]
	mov     rdi, [rsp+8*1193]
	call    concat
	mov [rsp+8*1197], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1198] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*1198]
	call    address
	mov [rsp+8*1199], rax
	mov r8, [rsp+8*1199]
	mov r8, [r8]
	mov [rsp+8*1200], r8
	mov     rsi, [rsp+8*1200]
	mov     rdi, [rsp+8*1197]
	call    concat
	mov [rsp+8*1201], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1202] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1202]
	call    address
	mov [rsp+8*1203], rax
	mov r8, [rsp+8*1203]
	mov r8, [r8]
	mov [rsp+8*1204], r8
	mov     rsi, [rsp+8*1204]
	mov     rdi, [rsp+8*1201]
	call    concat
	mov [rsp+8*1205], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1206] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1206]
	call    address
	mov [rsp+8*1207], rax
	mov r8, [rsp+8*1207]
	mov r8, [r8]
	mov [rsp+8*1208], r8
	mov     rsi, [rsp+8*1208]
	mov     rdi, [rsp+8*1205]
	call    concat
	mov [rsp+8*1209], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1210] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1210]
	call    address
	mov [rsp+8*1211], rax
	mov r8, [rsp+8*1211]
	mov r8, [r8]
	mov [rsp+8*1212], r8
	mov     rsi, [rsp+8*1212]
	mov     rdi, [rsp+8*1209]
	call    concat
	mov [rsp+8*1213], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1214] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1214]
	call    address
	mov [rsp+8*1215], rax
	mov r8, [rsp+8*1215]
	mov r8, [r8]
	mov [rsp+8*1216], r8
	mov     rsi, [rsp+8*1216]
	mov     rdi, [rsp+8*1213]
	call    concat
	mov [rsp+8*1217], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1218] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1218]
	call    address
	mov [rsp+8*1219], rax
	mov r8, [rsp+8*1219]
	mov r8, [r8]
	mov [rsp+8*1220], r8
	mov     rsi, [rsp+8*1220]
	mov     rdi, [rsp+8*1217]
	call    concat
	mov [rsp+8*1221], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1222] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*1222]
	call    address
	mov [rsp+8*1223], rax
	mov r8, [rsp+8*1223]
	mov r8, [r8]
	mov [rsp+8*1224], r8
	mov     rsi, [rsp+8*1224]
	mov     rdi, [rsp+8*1221]
	call    concat
	mov [rsp+8*1225], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1226] ,r8
	mov     rsi, 58
	mov     rdi, [rsp+8*1226]
	call    address
	mov [rsp+8*1227], rax
	mov r8, [rsp+8*1227]
	mov r8, [r8]
	mov [rsp+8*1228], r8
	mov     rsi, [rsp+8*1228]
	mov     rdi, [rsp+8*1225]
	call    concat
	mov [rsp+8*1229], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1230] ,r8
	mov     rsi, 17
	mov     rdi, [rsp+8*1230]
	call    address
	mov [rsp+8*1231], rax
	mov r8, [rsp+8*1231]
	mov r8, [r8]
	mov [rsp+8*1232], r8
	mov     rsi, [rsp+8*1232]
	mov     rdi, [rsp+8*1229]
	call    concat
	mov [rsp+8*1233], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1234] ,r8
	mov     rsi, 20
	mov     rdi, [rsp+8*1234]
	call    address
	mov [rsp+8*1235], rax
	mov r8, [rsp+8*1235]
	mov r8, [r8]
	mov [rsp+8*1236], r8
	mov     rsi, [rsp+8*1236]
	mov     rdi, [rsp+8*1233]
	call    concat
	mov [rsp+8*1237], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1238] ,r8
	mov     rsi, 21
	mov     rdi, [rsp+8*1238]
	call    address
	mov [rsp+8*1239], rax
	mov r8, [rsp+8*1239]
	mov r8, [r8]
	mov [rsp+8*1240], r8
	mov     rsi, [rsp+8*1240]
	mov     rdi, [rsp+8*1237]
	call    concat
	mov [rsp+8*1241], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1242] ,r8
	mov     rsi, 59
	mov     rdi, [rsp+8*1242]
	call    address
	mov [rsp+8*1243], rax
	mov r8, [rsp+8*1243]
	mov r8, [r8]
	mov [rsp+8*1244], r8
	mov     rsi, [rsp+8*1244]
	mov     rdi, [rsp+8*1241]
	call    concat
	mov [rsp+8*1245], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1246] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*1246]
	call    address
	mov [rsp+8*1247], rax
	mov r8, [rsp+8*1247]
	mov r8, [r8]
	mov [rsp+8*1248], r8
	mov     rsi, [rsp+8*1248]
	mov     rdi, [rsp+8*1245]
	call    concat
	mov [rsp+8*1249], rax
	mov r8, [rsp+8*1249]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*1250] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*1250] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1251] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1251]
	call    address
	mov [rsp+8*1252], rax
	mov r8, [rsp+8*1252]
	mov r8, [r8]
	mov [rsp+8*1253], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1254] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1254]
	call    address
	mov [rsp+8*1255], rax
	mov r8, [rsp+8*1255]
	mov r8, [r8]
	mov [rsp+8*1256], r8
	mov     rsi, [rsp+8*1256]
	mov     rdi, [rsp+8*1253]
	call    concat
	mov [rsp+8*1257], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1258] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1258]
	call    address
	mov [rsp+8*1259], rax
	mov r8, [rsp+8*1259]
	mov r8, [r8]
	mov [rsp+8*1260], r8
	mov     rsi, [rsp+8*1260]
	mov     rdi, [rsp+8*1257]
	call    concat
	mov [rsp+8*1261], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1262] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1262]
	call    address
	mov [rsp+8*1263], rax
	mov r8, [rsp+8*1263]
	mov r8, [r8]
	mov [rsp+8*1264], r8
	mov     rsi, [rsp+8*1264]
	mov     rdi, [rsp+8*1261]
	call    concat
	mov [rsp+8*1265], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1266] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1266]
	call    address
	mov [rsp+8*1267], rax
	mov r8, [rsp+8*1267]
	mov r8, [r8]
	mov [rsp+8*1268], r8
	mov     rsi, [rsp+8*1268]
	mov     rdi, [rsp+8*1265]
	call    concat
	mov [rsp+8*1269], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1270] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*1270]
	call    address
	mov [rsp+8*1271], rax
	mov r8, [rsp+8*1271]
	mov r8, [r8]
	mov [rsp+8*1272], r8
	mov     rsi, [rsp+8*1272]
	mov     rdi, [rsp+8*1269]
	call    concat
	mov [rsp+8*1273], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1274] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*1274]
	call    address
	mov [rsp+8*1275], rax
	mov r8, [rsp+8*1275]
	mov r8, [r8]
	mov [rsp+8*1276], r8
	mov     rsi, [rsp+8*1276]
	mov     rdi, [rsp+8*1273]
	call    concat
	mov [rsp+8*1277], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1278] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1278]
	call    address
	mov [rsp+8*1279], rax
	mov r8, [rsp+8*1279]
	mov r8, [r8]
	mov [rsp+8*1280], r8
	mov     rsi, [rsp+8*1280]
	mov     rdi, [rsp+8*1277]
	call    concat
	mov [rsp+8*1281], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1282] ,r8
	mov     rsi, 17
	mov     rdi, [rsp+8*1282]
	call    address
	mov [rsp+8*1283], rax
	mov r8, [rsp+8*1283]
	mov r8, [r8]
	mov [rsp+8*1284], r8
	mov     rsi, [rsp+8*1284]
	mov     rdi, [rsp+8*1281]
	call    concat
	mov [rsp+8*1285], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1286] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*1286]
	call    address
	mov [rsp+8*1287], rax
	mov r8, [rsp+8*1287]
	mov r8, [r8]
	mov [rsp+8*1288], r8
	mov     rsi, [rsp+8*1288]
	mov     rdi, [rsp+8*1285]
	call    concat
	mov [rsp+8*1289], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1290] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1290]
	call    address
	mov [rsp+8*1291], rax
	mov r8, [rsp+8*1291]
	mov r8, [r8]
	mov [rsp+8*1292], r8
	mov     rsi, [rsp+8*1292]
	mov     rdi, [rsp+8*1289]
	call    concat
	mov [rsp+8*1293], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1294] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1294]
	call    address
	mov [rsp+8*1295], rax
	mov r8, [rsp+8*1295]
	mov r8, [r8]
	mov [rsp+8*1296], r8
	mov     rsi, [rsp+8*1296]
	mov     rdi, [rsp+8*1293]
	call    concat
	mov [rsp+8*1297], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1298] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1298]
	call    address
	mov [rsp+8*1299], rax
	mov r8, [rsp+8*1299]
	mov r8, [r8]
	mov [rsp+8*1300], r8
	mov     rsi, [rsp+8*1300]
	mov     rdi, [rsp+8*1297]
	call    concat
	mov [rsp+8*1301], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1302] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*1302]
	call    address
	mov [rsp+8*1303], rax
	mov r8, [rsp+8*1303]
	mov r8, [r8]
	mov [rsp+8*1304], r8
	mov     rsi, [rsp+8*1304]
	mov     rdi, [rsp+8*1301]
	call    concat
	mov [rsp+8*1305], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1306] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1306]
	call    address
	mov [rsp+8*1307], rax
	mov r8, [rsp+8*1307]
	mov r8, [r8]
	mov [rsp+8*1308], r8
	mov     rsi, [rsp+8*1308]
	mov     rdi, [rsp+8*1305]
	call    concat
	mov [rsp+8*1309], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1310] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1310]
	call    address
	mov [rsp+8*1311], rax
	mov r8, [rsp+8*1311]
	mov r8, [r8]
	mov [rsp+8*1312], r8
	mov     rsi, [rsp+8*1312]
	mov     rdi, [rsp+8*1309]
	call    concat
	mov [rsp+8*1313], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1314] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*1314]
	call    address
	mov [rsp+8*1315], rax
	mov r8, [rsp+8*1315]
	mov r8, [r8]
	mov [rsp+8*1316], r8
	mov     rsi, [rsp+8*1316]
	mov     rdi, [rsp+8*1313]
	call    concat
	mov [rsp+8*1317], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1318] ,r8
	mov     rsi, 89
	mov     rdi, [rsp+8*1318]
	call    address
	mov [rsp+8*1319], rax
	mov r8, [rsp+8*1319]
	mov r8, [r8]
	mov [rsp+8*1320], r8
	mov     rsi, [rsp+8*1320]
	mov     rdi, [rsp+8*1317]
	call    concat
	mov [rsp+8*1321], rax
	mov r8, [rsp+8*1321]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*1322] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*1322] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1323] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1323]
	call    address
	mov [rsp+8*1324], rax
	mov r8, [rsp+8*1324]
	mov r8, [r8]
	mov [rsp+8*1325], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1326] ,r8
	mov     rsi, 68
	mov     rdi, [rsp+8*1326]
	call    address
	mov [rsp+8*1327], rax
	mov r8, [rsp+8*1327]
	mov r8, [r8]
	mov [rsp+8*1328], r8
	mov     rsi, [rsp+8*1328]
	mov     rdi, [rsp+8*1325]
	call    concat
	mov [rsp+8*1329], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1330] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*1330]
	call    address
	mov [rsp+8*1331], rax
	mov r8, [rsp+8*1331]
	mov r8, [r8]
	mov [rsp+8*1332], r8
	mov     rsi, [rsp+8*1332]
	mov     rdi, [rsp+8*1329]
	call    concat
	mov [rsp+8*1333], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1334] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1334]
	call    address
	mov [rsp+8*1335], rax
	mov r8, [rsp+8*1335]
	mov r8, [r8]
	mov [rsp+8*1336], r8
	mov     rsi, [rsp+8*1336]
	mov     rdi, [rsp+8*1333]
	call    concat
	mov [rsp+8*1337], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1338] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1338]
	call    address
	mov [rsp+8*1339], rax
	mov r8, [rsp+8*1339]
	mov r8, [r8]
	mov [rsp+8*1340], r8
	mov     rsi, [rsp+8*1340]
	mov     rdi, [rsp+8*1337]
	call    concat
	mov [rsp+8*1341], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1342] ,r8
	mov     rsi, 27
	mov     rdi, [rsp+8*1342]
	call    address
	mov [rsp+8*1343], rax
	mov r8, [rsp+8*1343]
	mov r8, [r8]
	mov [rsp+8*1344], r8
	mov     rsi, [rsp+8*1344]
	mov     rdi, [rsp+8*1341]
	call    concat
	mov [rsp+8*1345], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1346] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*1346]
	call    address
	mov [rsp+8*1347], rax
	mov r8, [rsp+8*1347]
	mov r8, [r8]
	mov [rsp+8*1348], r8
	mov     rsi, [rsp+8*1348]
	mov     rdi, [rsp+8*1345]
	call    concat
	mov [rsp+8*1349], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1350] ,r8
	mov     rsi, 24
	mov     rdi, [rsp+8*1350]
	call    address
	mov [rsp+8*1351], rax
	mov r8, [rsp+8*1351]
	mov r8, [r8]
	mov [rsp+8*1352], r8
	mov     rsi, [rsp+8*1352]
	mov     rdi, [rsp+8*1349]
	call    concat
	mov [rsp+8*1353], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1354] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*1354]
	call    address
	mov [rsp+8*1355], rax
	mov r8, [rsp+8*1355]
	mov r8, [r8]
	mov [rsp+8*1356], r8
	mov     rsi, [rsp+8*1356]
	mov     rdi, [rsp+8*1353]
	call    concat
	mov [rsp+8*1357], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1358] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1358]
	call    address
	mov [rsp+8*1359], rax
	mov r8, [rsp+8*1359]
	mov r8, [r8]
	mov [rsp+8*1360], r8
	mov     rsi, [rsp+8*1360]
	mov     rdi, [rsp+8*1357]
	call    concat
	mov [rsp+8*1361], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1362] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*1362]
	call    address
	mov [rsp+8*1363], rax
	mov r8, [rsp+8*1363]
	mov r8, [r8]
	mov [rsp+8*1364], r8
	mov     rsi, [rsp+8*1364]
	mov     rdi, [rsp+8*1361]
	call    concat
	mov [rsp+8*1365], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1366] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1366]
	call    address
	mov [rsp+8*1367], rax
	mov r8, [rsp+8*1367]
	mov r8, [r8]
	mov [rsp+8*1368], r8
	mov     rsi, [rsp+8*1368]
	mov     rdi, [rsp+8*1365]
	call    concat
	mov [rsp+8*1369], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1370] ,r8
	mov     rsi, 83
	mov     rdi, [rsp+8*1370]
	call    address
	mov [rsp+8*1371], rax
	mov r8, [rsp+8*1371]
	mov r8, [r8]
	mov [rsp+8*1372], r8
	mov     rsi, [rsp+8*1372]
	mov     rdi, [rsp+8*1369]
	call    concat
	mov [rsp+8*1373], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1374] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1374]
	call    address
	mov [rsp+8*1375], rax
	mov r8, [rsp+8*1375]
	mov r8, [r8]
	mov [rsp+8*1376], r8
	mov     rsi, [rsp+8*1376]
	mov     rdi, [rsp+8*1373]
	call    concat
	mov [rsp+8*1377], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1378] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1378]
	call    address
	mov [rsp+8*1379], rax
	mov r8, [rsp+8*1379]
	mov r8, [r8]
	mov [rsp+8*1380], r8
	mov     rsi, [rsp+8*1380]
	mov     rdi, [rsp+8*1377]
	call    concat
	mov [rsp+8*1381], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1382] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*1382]
	call    address
	mov [rsp+8*1383], rax
	mov r8, [rsp+8*1383]
	mov r8, [r8]
	mov [rsp+8*1384], r8
	mov     rsi, [rsp+8*1384]
	mov     rdi, [rsp+8*1381]
	call    concat
	mov [rsp+8*1385], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1385]
	call    concat
	mov [rsp+8*1386], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1387] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1387]
	call    address
	mov [rsp+8*1388], rax
	mov r8, [rsp+8*1388]
	mov r8, [r8]
	mov [rsp+8*1389], r8
	mov     rsi, [rsp+8*1389]
	mov     rdi, [rsp+8*1386]
	call    concat
	mov [rsp+8*1390], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1391] ,r8
	mov     rsi, 58
	mov     rdi, [rsp+8*1391]
	call    address
	mov [rsp+8*1392], rax
	mov r8, [rsp+8*1392]
	mov r8, [r8]
	mov [rsp+8*1393], r8
	mov     rsi, [rsp+8*1393]
	mov     rdi, [rsp+8*1390]
	call    concat
	mov [rsp+8*1394], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1394]
	call    concat
	mov [rsp+8*1395], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1396] ,r8
	mov     rsi, 10
	mov     rdi, [rsp+8*1396]
	call    address
	mov [rsp+8*1397], rax
	mov r8, [rsp+8*1397]
	mov r8, [r8]
	mov [rsp+8*1398], r8
	mov     rsi, [rsp+8*1398]
	mov     rdi, [rsp+8*1395]
	call    concat
	mov [rsp+8*1399], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1400] ,r8
	mov     rsi, 66
	mov     rdi, [rsp+8*1400]
	call    address
	mov [rsp+8*1401], rax
	mov r8, [rsp+8*1401]
	mov r8, [r8]
	mov [rsp+8*1402], r8
	mov     rsi, [rsp+8*1402]
	mov     rdi, [rsp+8*1399]
	call    concat
	mov [rsp+8*1403], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1404] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1404]
	call    address
	mov [rsp+8*1405], rax
	mov r8, [rsp+8*1405]
	mov r8, [r8]
	mov [rsp+8*1406], r8
	mov     rsi, [rsp+8*1406]
	mov     rdi, [rsp+8*1403]
	call    concat
	mov [rsp+8*1407], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1408] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*1408]
	call    address
	mov [rsp+8*1409], rax
	mov r8, [rsp+8*1409]
	mov r8, [r8]
	mov [rsp+8*1410], r8
	mov     rsi, [rsp+8*1410]
	mov     rdi, [rsp+8*1407]
	call    concat
	mov [rsp+8*1411], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1412] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1412]
	call    address
	mov [rsp+8*1413], rax
	mov r8, [rsp+8*1413]
	mov r8, [r8]
	mov [rsp+8*1414], r8
	mov     rsi, [rsp+8*1414]
	mov     rdi, [rsp+8*1411]
	call    concat
	mov [rsp+8*1415], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1416] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*1416]
	call    address
	mov [rsp+8*1417], rax
	mov r8, [rsp+8*1417]
	mov r8, [r8]
	mov [rsp+8*1418], r8
	mov     rsi, [rsp+8*1418]
	mov     rdi, [rsp+8*1415]
	call    concat
	mov [rsp+8*1419], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1420] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1420]
	call    address
	mov [rsp+8*1421], rax
	mov r8, [rsp+8*1421]
	mov r8, [r8]
	mov [rsp+8*1422], r8
	mov     rsi, [rsp+8*1422]
	mov     rdi, [rsp+8*1419]
	call    concat
	mov [rsp+8*1423], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1424] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1424]
	call    address
	mov [rsp+8*1425], rax
	mov r8, [rsp+8*1425]
	mov r8, [r8]
	mov [rsp+8*1426], r8
	mov     rsi, [rsp+8*1426]
	mov     rdi, [rsp+8*1423]
	call    concat
	mov [rsp+8*1427], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1428] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*1428]
	call    address
	mov [rsp+8*1429], rax
	mov r8, [rsp+8*1429]
	mov r8, [r8]
	mov [rsp+8*1430], r8
	mov     rsi, [rsp+8*1430]
	mov     rdi, [rsp+8*1427]
	call    concat
	mov [rsp+8*1431], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1432] ,r8
	mov     rsi, 10
	mov     rdi, [rsp+8*1432]
	call    address
	mov [rsp+8*1433], rax
	mov r8, [rsp+8*1433]
	mov r8, [r8]
	mov [rsp+8*1434], r8
	mov     rsi, [rsp+8*1434]
	mov     rdi, [rsp+8*1431]
	call    concat
	mov [rsp+8*1435], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1435]
	call    concat
	mov [rsp+8*1436], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1437] ,r8
	mov     rsi, 59
	mov     rdi, [rsp+8*1437]
	call    address
	mov [rsp+8*1438], rax
	mov r8, [rsp+8*1438]
	mov r8, [r8]
	mov [rsp+8*1439], r8
	mov     rsi, [rsp+8*1439]
	mov     rdi, [rsp+8*1436]
	call    concat
	mov [rsp+8*1440], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1441] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*1441]
	call    address
	mov [rsp+8*1442], rax
	mov r8, [rsp+8*1442]
	mov r8, [r8]
	mov [rsp+8*1443], r8
	mov     rsi, [rsp+8*1443]
	mov     rdi, [rsp+8*1440]
	call    concat
	mov [rsp+8*1444], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1444]
	call    concat
	mov [rsp+8*1445], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1446] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*1446]
	call    address
	mov [rsp+8*1447], rax
	mov r8, [rsp+8*1447]
	mov r8, [r8]
	mov [rsp+8*1448], r8
	mov     rsi, [rsp+8*1448]
	mov     rdi, [rsp+8*1445]
	call    concat
	mov [rsp+8*1449], rax
	mov r8, [rsp+8*1449]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*1450] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*1450] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1451] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1451]
	call    address
	mov [rsp+8*1452], rax
	mov r8, [rsp+8*1452]
	mov r8, [r8]
	mov [rsp+8*1453], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1454] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*1454]
	call    address
	mov [rsp+8*1455], rax
	mov r8, [rsp+8*1455]
	mov r8, [r8]
	mov [rsp+8*1456], r8
	mov     rsi, [rsp+8*1456]
	mov     rdi, [rsp+8*1453]
	call    concat
	mov [rsp+8*1457], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1458] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1458]
	call    address
	mov [rsp+8*1459], rax
	mov r8, [rsp+8*1459]
	mov r8, [r8]
	mov [rsp+8*1460], r8
	mov     rsi, [rsp+8*1460]
	mov     rdi, [rsp+8*1457]
	call    concat
	mov [rsp+8*1461], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1462] ,r8
	mov     rsi, 83
	mov     rdi, [rsp+8*1462]
	call    address
	mov [rsp+8*1463], rax
	mov r8, [rsp+8*1463]
	mov r8, [r8]
	mov [rsp+8*1464], r8
	mov     rsi, [rsp+8*1464]
	mov     rdi, [rsp+8*1461]
	call    concat
	mov [rsp+8*1465], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1466] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1466]
	call    address
	mov [rsp+8*1467], rax
	mov r8, [rsp+8*1467]
	mov r8, [r8]
	mov [rsp+8*1468], r8
	mov     rsi, [rsp+8*1468]
	mov     rdi, [rsp+8*1465]
	call    concat
	mov [rsp+8*1469], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1470] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1470]
	call    address
	mov [rsp+8*1471], rax
	mov r8, [rsp+8*1471]
	mov r8, [r8]
	mov [rsp+8*1472], r8
	mov     rsi, [rsp+8*1472]
	mov     rdi, [rsp+8*1469]
	call    concat
	mov [rsp+8*1473], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1474] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*1474]
	call    address
	mov [rsp+8*1475], rax
	mov r8, [rsp+8*1475]
	mov r8, [r8]
	mov [rsp+8*1476], r8
	mov     rsi, [rsp+8*1476]
	mov     rdi, [rsp+8*1473]
	call    concat
	mov [rsp+8*1477], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1477]
	call    concat
	mov [rsp+8*1478], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1479] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1479]
	call    address
	mov [rsp+8*1480], rax
	mov r8, [rsp+8*1480]
	mov r8, [r8]
	mov [rsp+8*1481], r8
	mov     rsi, [rsp+8*1481]
	mov     rdi, [rsp+8*1478]
	call    concat
	mov [rsp+8*1482], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1483] ,r8
	mov     rsi, 58
	mov     rdi, [rsp+8*1483]
	call    address
	mov [rsp+8*1484], rax
	mov r8, [rsp+8*1484]
	mov r8, [r8]
	mov [rsp+8*1485], r8
	mov     rsi, [rsp+8*1485]
	mov     rdi, [rsp+8*1482]
	call    concat
	mov [rsp+8*1486], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1486]
	call    concat
	mov [rsp+8*1487], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1488] ,r8
	mov     rsi, 10
	mov     rdi, [rsp+8*1488]
	call    address
	mov [rsp+8*1489], rax
	mov r8, [rsp+8*1489]
	mov r8, [r8]
	mov [rsp+8*1490], r8
	mov     rsi, [rsp+8*1490]
	mov     rdi, [rsp+8*1487]
	call    concat
	mov [rsp+8*1491], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1492] ,r8
	mov     rsi, 66
	mov     rdi, [rsp+8*1492]
	call    address
	mov [rsp+8*1493], rax
	mov r8, [rsp+8*1493]
	mov r8, [r8]
	mov [rsp+8*1494], r8
	mov     rsi, [rsp+8*1494]
	mov     rdi, [rsp+8*1491]
	call    concat
	mov [rsp+8*1495], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1496] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1496]
	call    address
	mov [rsp+8*1497], rax
	mov r8, [rsp+8*1497]
	mov r8, [r8]
	mov [rsp+8*1498], r8
	mov     rsi, [rsp+8*1498]
	mov     rdi, [rsp+8*1495]
	call    concat
	mov [rsp+8*1499], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1500] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*1500]
	call    address
	mov [rsp+8*1501], rax
	mov r8, [rsp+8*1501]
	mov r8, [r8]
	mov [rsp+8*1502], r8
	mov     rsi, [rsp+8*1502]
	mov     rdi, [rsp+8*1499]
	call    concat
	mov [rsp+8*1503], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1504] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1504]
	call    address
	mov [rsp+8*1505], rax
	mov r8, [rsp+8*1505]
	mov r8, [r8]
	mov [rsp+8*1506], r8
	mov     rsi, [rsp+8*1506]
	mov     rdi, [rsp+8*1503]
	call    concat
	mov [rsp+8*1507], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1508] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*1508]
	call    address
	mov [rsp+8*1509], rax
	mov r8, [rsp+8*1509]
	mov r8, [r8]
	mov [rsp+8*1510], r8
	mov     rsi, [rsp+8*1510]
	mov     rdi, [rsp+8*1507]
	call    concat
	mov [rsp+8*1511], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1512] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1512]
	call    address
	mov [rsp+8*1513], rax
	mov r8, [rsp+8*1513]
	mov r8, [r8]
	mov [rsp+8*1514], r8
	mov     rsi, [rsp+8*1514]
	mov     rdi, [rsp+8*1511]
	call    concat
	mov [rsp+8*1515], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1516] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1516]
	call    address
	mov [rsp+8*1517], rax
	mov r8, [rsp+8*1517]
	mov r8, [r8]
	mov [rsp+8*1518], r8
	mov     rsi, [rsp+8*1518]
	mov     rdi, [rsp+8*1515]
	call    concat
	mov [rsp+8*1519], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1520] ,r8
	mov     rsi, 14
	mov     rdi, [rsp+8*1520]
	call    address
	mov [rsp+8*1521], rax
	mov r8, [rsp+8*1521]
	mov r8, [r8]
	mov [rsp+8*1522], r8
	mov     rsi, [rsp+8*1522]
	mov     rdi, [rsp+8*1519]
	call    concat
	mov [rsp+8*1523], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1524] ,r8
	mov     rsi, 16
	mov     rdi, [rsp+8*1524]
	call    address
	mov [rsp+8*1525], rax
	mov r8, [rsp+8*1525]
	mov r8, [r8]
	mov [rsp+8*1526], r8
	mov     rsi, [rsp+8*1526]
	mov     rdi, [rsp+8*1523]
	call    concat
	mov [rsp+8*1527], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1528] ,r8
	mov     rsi, 15
	mov     rdi, [rsp+8*1528]
	call    address
	mov [rsp+8*1529], rax
	mov r8, [rsp+8*1529]
	mov r8, [r8]
	mov [rsp+8*1530], r8
	mov     rsi, [rsp+8*1530]
	mov     rdi, [rsp+8*1527]
	call    concat
	mov [rsp+8*1531], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1532] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*1532]
	call    address
	mov [rsp+8*1533], rax
	mov r8, [rsp+8*1533]
	mov r8, [r8]
	mov [rsp+8*1534], r8
	mov     rsi, [rsp+8*1534]
	mov     rdi, [rsp+8*1531]
	call    concat
	mov [rsp+8*1535], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1536] ,r8
	mov     rsi, 10
	mov     rdi, [rsp+8*1536]
	call    address
	mov [rsp+8*1537], rax
	mov r8, [rsp+8*1537]
	mov r8, [r8]
	mov [rsp+8*1538], r8
	mov     rsi, [rsp+8*1538]
	mov     rdi, [rsp+8*1535]
	call    concat
	mov [rsp+8*1539], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1540] ,r8
	mov     rsi, 66
	mov     rdi, [rsp+8*1540]
	call    address
	mov [rsp+8*1541], rax
	mov r8, [rsp+8*1541]
	mov r8, [r8]
	mov [rsp+8*1542], r8
	mov     rsi, [rsp+8*1542]
	mov     rdi, [rsp+8*1539]
	call    concat
	mov [rsp+8*1543], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1544] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1544]
	call    address
	mov [rsp+8*1545], rax
	mov r8, [rsp+8*1545]
	mov r8, [r8]
	mov [rsp+8*1546], r8
	mov     rsi, [rsp+8*1546]
	mov     rdi, [rsp+8*1543]
	call    concat
	mov [rsp+8*1547], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1548] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*1548]
	call    address
	mov [rsp+8*1549], rax
	mov r8, [rsp+8*1549]
	mov r8, [r8]
	mov [rsp+8*1550], r8
	mov     rsi, [rsp+8*1550]
	mov     rdi, [rsp+8*1547]
	call    concat
	mov [rsp+8*1551], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1552] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1552]
	call    address
	mov [rsp+8*1553], rax
	mov r8, [rsp+8*1553]
	mov r8, [r8]
	mov [rsp+8*1554], r8
	mov     rsi, [rsp+8*1554]
	mov     rdi, [rsp+8*1551]
	call    concat
	mov [rsp+8*1555], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1556] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*1556]
	call    address
	mov [rsp+8*1557], rax
	mov r8, [rsp+8*1557]
	mov r8, [r8]
	mov [rsp+8*1558], r8
	mov     rsi, [rsp+8*1558]
	mov     rdi, [rsp+8*1555]
	call    concat
	mov [rsp+8*1559], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1560] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1560]
	call    address
	mov [rsp+8*1561], rax
	mov r8, [rsp+8*1561]
	mov r8, [r8]
	mov [rsp+8*1562], r8
	mov     rsi, [rsp+8*1562]
	mov     rdi, [rsp+8*1559]
	call    concat
	mov [rsp+8*1563], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1564] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1564]
	call    address
	mov [rsp+8*1565], rax
	mov r8, [rsp+8*1565]
	mov r8, [r8]
	mov [rsp+8*1566], r8
	mov     rsi, [rsp+8*1566]
	mov     rdi, [rsp+8*1563]
	call    concat
	mov [rsp+8*1567], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1568] ,r8
	mov     rsi, 4
	mov     rdi, [rsp+8*1568]
	call    address
	mov [rsp+8*1569], rax
	mov r8, [rsp+8*1569]
	mov r8, [r8]
	mov [rsp+8*1570], r8
	mov     rsi, [rsp+8*1570]
	mov     rdi, [rsp+8*1567]
	call    concat
	mov [rsp+8*1571], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1572] ,r8
	mov     rsi, 16
	mov     rdi, [rsp+8*1572]
	call    address
	mov [rsp+8*1573], rax
	mov r8, [rsp+8*1573]
	mov r8, [r8]
	mov [rsp+8*1574], r8
	mov     rsi, [rsp+8*1574]
	mov     rdi, [rsp+8*1571]
	call    concat
	mov [rsp+8*1575], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1576] ,r8
	mov     rsi, 15
	mov     rdi, [rsp+8*1576]
	call    address
	mov [rsp+8*1577], rax
	mov r8, [rsp+8*1577]
	mov r8, [r8]
	mov [rsp+8*1578], r8
	mov     rsi, [rsp+8*1578]
	mov     rdi, [rsp+8*1575]
	call    concat
	mov [rsp+8*1579], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1580] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*1580]
	call    address
	mov [rsp+8*1581], rax
	mov r8, [rsp+8*1581]
	mov r8, [r8]
	mov [rsp+8*1582], r8
	mov     rsi, [rsp+8*1582]
	mov     rdi, [rsp+8*1579]
	call    concat
	mov [rsp+8*1583], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1584] ,r8
	mov     rsi, 10
	mov     rdi, [rsp+8*1584]
	call    address
	mov [rsp+8*1585], rax
	mov r8, [rsp+8*1585]
	mov r8, [r8]
	mov [rsp+8*1586], r8
	mov     rsi, [rsp+8*1586]
	mov     rdi, [rsp+8*1583]
	call    concat
	mov [rsp+8*1587], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1587]
	call    concat
	mov [rsp+8*1588], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1589] ,r8
	mov     rsi, 59
	mov     rdi, [rsp+8*1589]
	call    address
	mov [rsp+8*1590], rax
	mov r8, [rsp+8*1590]
	mov r8, [r8]
	mov [rsp+8*1591], r8
	mov     rsi, [rsp+8*1591]
	mov     rdi, [rsp+8*1588]
	call    concat
	mov [rsp+8*1592], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1593] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*1593]
	call    address
	mov [rsp+8*1594], rax
	mov r8, [rsp+8*1594]
	mov r8, [r8]
	mov [rsp+8*1595], r8
	mov     rsi, [rsp+8*1595]
	mov     rdi, [rsp+8*1592]
	call    concat
	mov [rsp+8*1596], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1596]
	call    concat
	mov [rsp+8*1597], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1598] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*1598]
	call    address
	mov [rsp+8*1599], rax
	mov r8, [rsp+8*1599]
	mov r8, [r8]
	mov [rsp+8*1600], r8
	mov     rsi, [rsp+8*1600]
	mov     rdi, [rsp+8*1597]
	call    concat
	mov [rsp+8*1601], rax
	mov r8, [rsp+8*1601]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*1602] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*1602] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1603] ,r8
	mov     rsi, 91
	mov     rdi, [rsp+8*1603]
	call    address
	mov [rsp+8*1604], rax
	mov r8, [rsp+8*1604]
	mov r8, [r8]
	mov [rsp+8*1605], r8
	mov r8, [rsp+8*1605]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*1606] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*1606] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1607] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1607]
	call    address
	mov [rsp+8*1608], rax
	mov r8, [rsp+8*1608]
	mov r8, [r8]
	mov [rsp+8*1609], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1610] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1610]
	call    address
	mov [rsp+8*1611], rax
	mov r8, [rsp+8*1611]
	mov r8, [r8]
	mov [rsp+8*1612], r8
	mov     rsi, [rsp+8*1612]
	mov     rdi, [rsp+8*1609]
	call    concat
	mov [rsp+8*1613], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1614] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1614]
	call    address
	mov [rsp+8*1615], rax
	mov r8, [rsp+8*1615]
	mov r8, [r8]
	mov [rsp+8*1616], r8
	mov     rsi, [rsp+8*1616]
	mov     rdi, [rsp+8*1613]
	call    concat
	mov [rsp+8*1617], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1618] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1618]
	call    address
	mov [rsp+8*1619], rax
	mov r8, [rsp+8*1619]
	mov r8, [r8]
	mov [rsp+8*1620], r8
	mov     rsi, [rsp+8*1620]
	mov     rdi, [rsp+8*1617]
	call    concat
	mov [rsp+8*1621], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1622] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1622]
	call    address
	mov [rsp+8*1623], rax
	mov r8, [rsp+8*1623]
	mov r8, [r8]
	mov [rsp+8*1624], r8
	mov     rsi, [rsp+8*1624]
	mov     rdi, [rsp+8*1621]
	call    concat
	mov [rsp+8*1625], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1626] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*1626]
	call    address
	mov [rsp+8*1627], rax
	mov r8, [rsp+8*1627]
	mov r8, [r8]
	mov [rsp+8*1628], r8
	mov     rsi, [rsp+8*1628]
	mov     rdi, [rsp+8*1625]
	call    concat
	mov [rsp+8*1629], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1630] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*1630]
	call    address
	mov [rsp+8*1631], rax
	mov r8, [rsp+8*1631]
	mov r8, [r8]
	mov [rsp+8*1632], r8
	mov     rsi, [rsp+8*1632]
	mov     rdi, [rsp+8*1629]
	call    concat
	mov [rsp+8*1633], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1634] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*1634]
	call    address
	mov [rsp+8*1635], rax
	mov r8, [rsp+8*1635]
	mov r8, [r8]
	mov [rsp+8*1636], r8
	mov     rsi, [rsp+8*1636]
	mov     rdi, [rsp+8*1633]
	call    concat
	mov [rsp+8*1637], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1638] ,r8
	mov     rsi, 17
	mov     rdi, [rsp+8*1638]
	call    address
	mov [rsp+8*1639], rax
	mov r8, [rsp+8*1639]
	mov r8, [r8]
	mov [rsp+8*1640], r8
	mov     rsi, [rsp+8*1640]
	mov     rdi, [rsp+8*1637]
	call    concat
	mov [rsp+8*1641], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1642] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*1642]
	call    address
	mov [rsp+8*1643], rax
	mov r8, [rsp+8*1643]
	mov r8, [r8]
	mov [rsp+8*1644], r8
	mov     rsi, [rsp+8*1644]
	mov     rdi, [rsp+8*1641]
	call    concat
	mov [rsp+8*1645], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1646] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1646]
	call    address
	mov [rsp+8*1647], rax
	mov r8, [rsp+8*1647]
	mov r8, [r8]
	mov [rsp+8*1648], r8
	mov     rsi, [rsp+8*1648]
	mov     rdi, [rsp+8*1645]
	call    concat
	mov [rsp+8*1649], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1650] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1650]
	call    address
	mov [rsp+8*1651], rax
	mov r8, [rsp+8*1651]
	mov r8, [r8]
	mov [rsp+8*1652], r8
	mov     rsi, [rsp+8*1652]
	mov     rdi, [rsp+8*1649]
	call    concat
	mov [rsp+8*1653], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1654] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1654]
	call    address
	mov [rsp+8*1655], rax
	mov r8, [rsp+8*1655]
	mov r8, [r8]
	mov [rsp+8*1656], r8
	mov     rsi, [rsp+8*1656]
	mov     rdi, [rsp+8*1653]
	call    concat
	mov [rsp+8*1657], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1658] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*1658]
	call    address
	mov [rsp+8*1659], rax
	mov r8, [rsp+8*1659]
	mov r8, [r8]
	mov [rsp+8*1660], r8
	mov     rsi, [rsp+8*1660]
	mov     rdi, [rsp+8*1657]
	call    concat
	mov [rsp+8*1661], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1662] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*1662]
	call    address
	mov [rsp+8*1663], rax
	mov r8, [rsp+8*1663]
	mov r8, [r8]
	mov [rsp+8*1664], r8
	mov     rsi, [rsp+8*1664]
	mov     rdi, [rsp+8*1661]
	call    concat
	mov [rsp+8*1665], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1666] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*1666]
	call    address
	mov [rsp+8*1667], rax
	mov r8, [rsp+8*1667]
	mov r8, [r8]
	mov [rsp+8*1668], r8
	mov     rsi, [rsp+8*1668]
	mov     rdi, [rsp+8*1665]
	call    concat
	mov [rsp+8*1669], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1670] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*1670]
	call    address
	mov [rsp+8*1671], rax
	mov r8, [rsp+8*1671]
	mov r8, [r8]
	mov [rsp+8*1672], r8
	mov     rsi, [rsp+8*1672]
	mov     rdi, [rsp+8*1669]
	call    concat
	mov [rsp+8*1673], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1674] ,r8
	mov     rsi, 89
	mov     rdi, [rsp+8*1674]
	call    address
	mov [rsp+8*1675], rax
	mov r8, [rsp+8*1675]
	mov r8, [r8]
	mov [rsp+8*1676], r8
	mov     rsi, [rsp+8*1676]
	mov     rdi, [rsp+8*1673]
	call    concat
	mov [rsp+8*1677], rax
	mov r8, [rsp+8*1677]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*1678] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*1678] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1679] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1679]
	call    address
	mov [rsp+8*1680], rax
	mov r8, [rsp+8*1680]
	mov r8, [r8]
	mov [rsp+8*1681], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1682] ,r8
	mov     rsi, 68
	mov     rdi, [rsp+8*1682]
	call    address
	mov [rsp+8*1683], rax
	mov r8, [rsp+8*1683]
	mov r8, [r8]
	mov [rsp+8*1684], r8
	mov     rsi, [rsp+8*1684]
	mov     rdi, [rsp+8*1681]
	call    concat
	mov [rsp+8*1685], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1686] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*1686]
	call    address
	mov [rsp+8*1687], rax
	mov r8, [rsp+8*1687]
	mov r8, [r8]
	mov [rsp+8*1688], r8
	mov     rsi, [rsp+8*1688]
	mov     rdi, [rsp+8*1685]
	call    concat
	mov [rsp+8*1689], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1690] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*1690]
	call    address
	mov [rsp+8*1691], rax
	mov r8, [rsp+8*1691]
	mov r8, [r8]
	mov [rsp+8*1692], r8
	mov     rsi, [rsp+8*1692]
	mov     rdi, [rsp+8*1689]
	call    concat
	mov [rsp+8*1693], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1694] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*1694]
	call    address
	mov [rsp+8*1695], rax
	mov r8, [rsp+8*1695]
	mov r8, [r8]
	mov [rsp+8*1696], r8
	mov     rsi, [rsp+8*1696]
	mov     rdi, [rsp+8*1693]
	call    concat
	mov [rsp+8*1697], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1698] ,r8
	mov     rsi, 27
	mov     rdi, [rsp+8*1698]
	call    address
	mov [rsp+8*1699], rax
	mov r8, [rsp+8*1699]
	mov r8, [r8]
	mov [rsp+8*1700], r8
	mov     rsi, [rsp+8*1700]
	mov     rdi, [rsp+8*1697]
	call    concat
	mov [rsp+8*1701], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1702] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*1702]
	call    address
	mov [rsp+8*1703], rax
	mov r8, [rsp+8*1703]
	mov r8, [r8]
	mov [rsp+8*1704], r8
	mov     rsi, [rsp+8*1704]
	mov     rdi, [rsp+8*1701]
	call    concat
	mov [rsp+8*1705], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1706] ,r8
	mov     rsi, 24
	mov     rdi, [rsp+8*1706]
	call    address
	mov [rsp+8*1707], rax
	mov r8, [rsp+8*1707]
	mov r8, [r8]
	mov [rsp+8*1708], r8
	mov     rsi, [rsp+8*1708]
	mov     rdi, [rsp+8*1705]
	call    concat
	mov [rsp+8*1709], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1710] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*1710]
	call    address
	mov [rsp+8*1711], rax
	mov r8, [rsp+8*1711]
	mov r8, [r8]
	mov [rsp+8*1712], r8
	mov     rsi, [rsp+8*1712]
	mov     rdi, [rsp+8*1709]
	call    concat
	mov [rsp+8*1713], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1714] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1714]
	call    address
	mov [rsp+8*1715], rax
	mov r8, [rsp+8*1715]
	mov r8, [r8]
	mov [rsp+8*1716], r8
	mov     rsi, [rsp+8*1716]
	mov     rdi, [rsp+8*1713]
	call    concat
	mov [rsp+8*1717], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1718] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*1718]
	call    address
	mov [rsp+8*1719], rax
	mov r8, [rsp+8*1719]
	mov r8, [r8]
	mov [rsp+8*1720], r8
	mov     rsi, [rsp+8*1720]
	mov     rdi, [rsp+8*1717]
	call    concat
	mov [rsp+8*1721], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1722] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1722]
	call    address
	mov [rsp+8*1723], rax
	mov r8, [rsp+8*1723]
	mov r8, [r8]
	mov [rsp+8*1724], r8
	mov     rsi, [rsp+8*1724]
	mov     rdi, [rsp+8*1721]
	call    concat
	mov [rsp+8*1725], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1726] ,r8
	mov     rsi, 83
	mov     rdi, [rsp+8*1726]
	call    address
	mov [rsp+8*1727], rax
	mov r8, [rsp+8*1727]
	mov r8, [r8]
	mov [rsp+8*1728], r8
	mov     rsi, [rsp+8*1728]
	mov     rdi, [rsp+8*1725]
	call    concat
	mov [rsp+8*1729], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1730] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1730]
	call    address
	mov [rsp+8*1731], rax
	mov r8, [rsp+8*1731]
	mov r8, [r8]
	mov [rsp+8*1732], r8
	mov     rsi, [rsp+8*1732]
	mov     rdi, [rsp+8*1729]
	call    concat
	mov [rsp+8*1733], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1734] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1734]
	call    address
	mov [rsp+8*1735], rax
	mov r8, [rsp+8*1735]
	mov r8, [r8]
	mov [rsp+8*1736], r8
	mov     rsi, [rsp+8*1736]
	mov     rdi, [rsp+8*1733]
	call    concat
	mov [rsp+8*1737], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1738] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*1738]
	call    address
	mov [rsp+8*1739], rax
	mov r8, [rsp+8*1739]
	mov r8, [r8]
	mov [rsp+8*1740], r8
	mov     rsi, [rsp+8*1740]
	mov     rdi, [rsp+8*1737]
	call    concat
	mov [rsp+8*1741], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1741]
	call    concat
	mov [rsp+8*1742], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1743] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*1743]
	call    address
	mov [rsp+8*1744], rax
	mov r8, [rsp+8*1744]
	mov r8, [r8]
	mov [rsp+8*1745], r8
	mov     rsi, [rsp+8*1745]
	mov     rdi, [rsp+8*1742]
	call    concat
	mov [rsp+8*1746], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1747] ,r8
	mov     rsi, 58
	mov     rdi, [rsp+8*1747]
	call    address
	mov [rsp+8*1748], rax
	mov r8, [rsp+8*1748]
	mov r8, [r8]
	mov [rsp+8*1749], r8
	mov     rsi, [rsp+8*1749]
	mov     rdi, [rsp+8*1746]
	call    concat
	mov [rsp+8*1750], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1750]
	call    concat
	mov [rsp+8*1751], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1752] ,r8
	mov     rsi, 10
	mov     rdi, [rsp+8*1752]
	call    address
	mov [rsp+8*1753], rax
	mov r8, [rsp+8*1753]
	mov r8, [r8]
	mov [rsp+8*1754], r8
	mov     rsi, [rsp+8*1754]
	mov     rdi, [rsp+8*1751]
	call    concat
	mov [rsp+8*1755], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1756] ,r8
	mov     rsi, 66
	mov     rdi, [rsp+8*1756]
	call    address
	mov [rsp+8*1757], rax
	mov r8, [rsp+8*1757]
	mov r8, [r8]
	mov [rsp+8*1758], r8
	mov     rsi, [rsp+8*1758]
	mov     rdi, [rsp+8*1755]
	call    concat
	mov [rsp+8*1759], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1760] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1760]
	call    address
	mov [rsp+8*1761], rax
	mov r8, [rsp+8*1761]
	mov r8, [r8]
	mov [rsp+8*1762], r8
	mov     rsi, [rsp+8*1762]
	mov     rdi, [rsp+8*1759]
	call    concat
	mov [rsp+8*1763], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1764] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*1764]
	call    address
	mov [rsp+8*1765], rax
	mov r8, [rsp+8*1765]
	mov r8, [r8]
	mov [rsp+8*1766], r8
	mov     rsi, [rsp+8*1766]
	mov     rdi, [rsp+8*1763]
	call    concat
	mov [rsp+8*1767], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1768] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1768]
	call    address
	mov [rsp+8*1769], rax
	mov r8, [rsp+8*1769]
	mov r8, [r8]
	mov [rsp+8*1770], r8
	mov     rsi, [rsp+8*1770]
	mov     rdi, [rsp+8*1767]
	call    concat
	mov [rsp+8*1771], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1772] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*1772]
	call    address
	mov [rsp+8*1773], rax
	mov r8, [rsp+8*1773]
	mov r8, [r8]
	mov [rsp+8*1774], r8
	mov     rsi, [rsp+8*1774]
	mov     rdi, [rsp+8*1771]
	call    concat
	mov [rsp+8*1775], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1776] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*1776]
	call    address
	mov [rsp+8*1777], rax
	mov r8, [rsp+8*1777]
	mov r8, [r8]
	mov [rsp+8*1778], r8
	mov     rsi, [rsp+8*1778]
	mov     rdi, [rsp+8*1775]
	call    concat
	mov [rsp+8*1779], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1780] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*1780]
	call    address
	mov [rsp+8*1781], rax
	mov r8, [rsp+8*1781]
	mov r8, [r8]
	mov [rsp+8*1782], r8
	mov     rsi, [rsp+8*1782]
	mov     rdi, [rsp+8*1779]
	call    concat
	mov [rsp+8*1783], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1784] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*1784]
	call    address
	mov [rsp+8*1785], rax
	mov r8, [rsp+8*1785]
	mov r8, [r8]
	mov [rsp+8*1786], r8
	mov     rsi, [rsp+8*1786]
	mov     rdi, [rsp+8*1783]
	call    concat
	mov [rsp+8*1787], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1788] ,r8
	mov     rsi, 10
	mov     rdi, [rsp+8*1788]
	call    address
	mov [rsp+8*1789], rax
	mov r8, [rsp+8*1789]
	mov r8, [r8]
	mov [rsp+8*1790], r8
	mov     rsi, [rsp+8*1790]
	mov     rdi, [rsp+8*1787]
	call    concat
	mov [rsp+8*1791], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1791]
	call    concat
	mov [rsp+8*1792], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1793] ,r8
	mov     rsi, 59
	mov     rdi, [rsp+8*1793]
	call    address
	mov [rsp+8*1794], rax
	mov r8, [rsp+8*1794]
	mov r8, [r8]
	mov [rsp+8*1795], r8
	mov     rsi, [rsp+8*1795]
	mov     rdi, [rsp+8*1792]
	call    concat
	mov [rsp+8*1796], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1797] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*1797]
	call    address
	mov [rsp+8*1798], rax
	mov r8, [rsp+8*1798]
	mov r8, [r8]
	mov [rsp+8*1799], r8
	mov     rsi, [rsp+8*1799]
	mov     rdi, [rsp+8*1796]
	call    concat
	mov [rsp+8*1800], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1800]
	call    concat
	mov [rsp+8*1801], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1802] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*1802]
	call    address
	mov [rsp+8*1803], rax
	mov r8, [rsp+8*1803]
	mov r8, [r8]
	mov [rsp+8*1804], r8
	mov     rsi, [rsp+8*1804]
	mov     rdi, [rsp+8*1801]
	call    concat
	mov [rsp+8*1805], rax
	mov r8, [rsp+8*1805]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*1806] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*1806] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1807] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1807]
	call    address
	mov [rsp+8*1808], rax
	mov r8, [rsp+8*1808]
	mov r8, [r8]
	mov [rsp+8*1809], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1810] ,r8
	mov     rsi, 67
	mov     rdi, [rsp+8*1810]
	call    address
	mov [rsp+8*1811], rax
	mov r8, [rsp+8*1811]
	mov r8, [r8]
	mov [rsp+8*1812], r8
	mov     rsi, [rsp+8*1812]
	mov     rdi, [rsp+8*1809]
	call    concat
	mov [rsp+8*1813], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1814] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1814]
	call    address
	mov [rsp+8*1815], rax
	mov r8, [rsp+8*1815]
	mov r8, [r8]
	mov [rsp+8*1816], r8
	mov     rsi, [rsp+8*1816]
	mov     rdi, [rsp+8*1813]
	call    concat
	mov [rsp+8*1817], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1818] ,r8
	mov     rsi, 83
	mov     rdi, [rsp+8*1818]
	call    address
	mov [rsp+8*1819], rax
	mov r8, [rsp+8*1819]
	mov r8, [r8]
	mov [rsp+8*1820], r8
	mov     rsi, [rsp+8*1820]
	mov     rdi, [rsp+8*1817]
	call    concat
	mov [rsp+8*1821], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1822] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1822]
	call    address
	mov [rsp+8*1823], rax
	mov r8, [rsp+8*1823]
	mov r8, [r8]
	mov [rsp+8*1824], r8
	mov     rsi, [rsp+8*1824]
	mov     rdi, [rsp+8*1821]
	call    concat
	mov [rsp+8*1825], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1826] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1826]
	call    address
	mov [rsp+8*1827], rax
	mov r8, [rsp+8*1827]
	mov r8, [r8]
	mov [rsp+8*1828], r8
	mov     rsi, [rsp+8*1828]
	mov     rdi, [rsp+8*1825]
	call    concat
	mov [rsp+8*1829], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1830] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*1830]
	call    address
	mov [rsp+8*1831], rax
	mov r8, [rsp+8*1831]
	mov r8, [r8]
	mov [rsp+8*1832], r8
	mov     rsi, [rsp+8*1832]
	mov     rdi, [rsp+8*1829]
	call    concat
	mov [rsp+8*1833], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1833]
	call    concat
	mov [rsp+8*1834], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1835] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*1835]
	call    address
	mov [rsp+8*1836], rax
	mov r8, [rsp+8*1836]
	mov r8, [r8]
	mov [rsp+8*1837], r8
	mov     rsi, [rsp+8*1837]
	mov     rdi, [rsp+8*1834]
	call    concat
	mov [rsp+8*1838], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1839] ,r8
	mov     rsi, 58
	mov     rdi, [rsp+8*1839]
	call    address
	mov [rsp+8*1840], rax
	mov r8, [rsp+8*1840]
	mov r8, [r8]
	mov [rsp+8*1841], r8
	mov     rsi, [rsp+8*1841]
	mov     rdi, [rsp+8*1838]
	call    concat
	mov [rsp+8*1842], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1842]
	call    concat
	mov [rsp+8*1843], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1844] ,r8
	mov     rsi, 10
	mov     rdi, [rsp+8*1844]
	call    address
	mov [rsp+8*1845], rax
	mov r8, [rsp+8*1845]
	mov r8, [r8]
	mov [rsp+8*1846], r8
	mov     rsi, [rsp+8*1846]
	mov     rdi, [rsp+8*1843]
	call    concat
	mov [rsp+8*1847], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1848] ,r8
	mov     rsi, 66
	mov     rdi, [rsp+8*1848]
	call    address
	mov [rsp+8*1849], rax
	mov r8, [rsp+8*1849]
	mov r8, [r8]
	mov [rsp+8*1850], r8
	mov     rsi, [rsp+8*1850]
	mov     rdi, [rsp+8*1847]
	call    concat
	mov [rsp+8*1851], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1852] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1852]
	call    address
	mov [rsp+8*1853], rax
	mov r8, [rsp+8*1853]
	mov r8, [r8]
	mov [rsp+8*1854], r8
	mov     rsi, [rsp+8*1854]
	mov     rdi, [rsp+8*1851]
	call    concat
	mov [rsp+8*1855], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1856] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*1856]
	call    address
	mov [rsp+8*1857], rax
	mov r8, [rsp+8*1857]
	mov r8, [r8]
	mov [rsp+8*1858], r8
	mov     rsi, [rsp+8*1858]
	mov     rdi, [rsp+8*1855]
	call    concat
	mov [rsp+8*1859], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1860] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1860]
	call    address
	mov [rsp+8*1861], rax
	mov r8, [rsp+8*1861]
	mov r8, [r8]
	mov [rsp+8*1862], r8
	mov     rsi, [rsp+8*1862]
	mov     rdi, [rsp+8*1859]
	call    concat
	mov [rsp+8*1863], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1864] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*1864]
	call    address
	mov [rsp+8*1865], rax
	mov r8, [rsp+8*1865]
	mov r8, [r8]
	mov [rsp+8*1866], r8
	mov     rsi, [rsp+8*1866]
	mov     rdi, [rsp+8*1863]
	call    concat
	mov [rsp+8*1867], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1868] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*1868]
	call    address
	mov [rsp+8*1869], rax
	mov r8, [rsp+8*1869]
	mov r8, [r8]
	mov [rsp+8*1870], r8
	mov     rsi, [rsp+8*1870]
	mov     rdi, [rsp+8*1867]
	call    concat
	mov [rsp+8*1871], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1872] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*1872]
	call    address
	mov [rsp+8*1873], rax
	mov r8, [rsp+8*1873]
	mov r8, [r8]
	mov [rsp+8*1874], r8
	mov     rsi, [rsp+8*1874]
	mov     rdi, [rsp+8*1871]
	call    concat
	mov [rsp+8*1875], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1876] ,r8
	mov     rsi, 14
	mov     rdi, [rsp+8*1876]
	call    address
	mov [rsp+8*1877], rax
	mov r8, [rsp+8*1877]
	mov r8, [r8]
	mov [rsp+8*1878], r8
	mov     rsi, [rsp+8*1878]
	mov     rdi, [rsp+8*1875]
	call    concat
	mov [rsp+8*1879], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1880] ,r8
	mov     rsi, 16
	mov     rdi, [rsp+8*1880]
	call    address
	mov [rsp+8*1881], rax
	mov r8, [rsp+8*1881]
	mov r8, [r8]
	mov [rsp+8*1882], r8
	mov     rsi, [rsp+8*1882]
	mov     rdi, [rsp+8*1879]
	call    concat
	mov [rsp+8*1883], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1884] ,r8
	mov     rsi, 15
	mov     rdi, [rsp+8*1884]
	call    address
	mov [rsp+8*1885], rax
	mov r8, [rsp+8*1885]
	mov r8, [r8]
	mov [rsp+8*1886], r8
	mov     rsi, [rsp+8*1886]
	mov     rdi, [rsp+8*1883]
	call    concat
	mov [rsp+8*1887], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1888] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*1888]
	call    address
	mov [rsp+8*1889], rax
	mov r8, [rsp+8*1889]
	mov r8, [r8]
	mov [rsp+8*1890], r8
	mov     rsi, [rsp+8*1890]
	mov     rdi, [rsp+8*1887]
	call    concat
	mov [rsp+8*1891], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1892] ,r8
	mov     rsi, 10
	mov     rdi, [rsp+8*1892]
	call    address
	mov [rsp+8*1893], rax
	mov r8, [rsp+8*1893]
	mov r8, [r8]
	mov [rsp+8*1894], r8
	mov     rsi, [rsp+8*1894]
	mov     rdi, [rsp+8*1891]
	call    concat
	mov [rsp+8*1895], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1896] ,r8
	mov     rsi, 66
	mov     rdi, [rsp+8*1896]
	call    address
	mov [rsp+8*1897], rax
	mov r8, [rsp+8*1897]
	mov r8, [r8]
	mov [rsp+8*1898], r8
	mov     rsi, [rsp+8*1898]
	mov     rdi, [rsp+8*1895]
	call    concat
	mov [rsp+8*1899], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1900] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1900]
	call    address
	mov [rsp+8*1901], rax
	mov r8, [rsp+8*1901]
	mov r8, [r8]
	mov [rsp+8*1902], r8
	mov     rsi, [rsp+8*1902]
	mov     rdi, [rsp+8*1899]
	call    concat
	mov [rsp+8*1903], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1904] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*1904]
	call    address
	mov [rsp+8*1905], rax
	mov r8, [rsp+8*1905]
	mov r8, [r8]
	mov [rsp+8*1906], r8
	mov     rsi, [rsp+8*1906]
	mov     rdi, [rsp+8*1903]
	call    concat
	mov [rsp+8*1907], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1908] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1908]
	call    address
	mov [rsp+8*1909], rax
	mov r8, [rsp+8*1909]
	mov r8, [r8]
	mov [rsp+8*1910], r8
	mov     rsi, [rsp+8*1910]
	mov     rdi, [rsp+8*1907]
	call    concat
	mov [rsp+8*1911], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1912] ,r8
	mov     rsi, 7
	mov     rdi, [rsp+8*1912]
	call    address
	mov [rsp+8*1913], rax
	mov r8, [rsp+8*1913]
	mov r8, [r8]
	mov [rsp+8*1914], r8
	mov     rsi, [rsp+8*1914]
	mov     rdi, [rsp+8*1911]
	call    concat
	mov [rsp+8*1915], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1916] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*1916]
	call    address
	mov [rsp+8*1917], rax
	mov r8, [rsp+8*1917]
	mov r8, [r8]
	mov [rsp+8*1918], r8
	mov     rsi, [rsp+8*1918]
	mov     rdi, [rsp+8*1915]
	call    concat
	mov [rsp+8*1919], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1920] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*1920]
	call    address
	mov [rsp+8*1921], rax
	mov r8, [rsp+8*1921]
	mov r8, [r8]
	mov [rsp+8*1922], r8
	mov     rsi, [rsp+8*1922]
	mov     rdi, [rsp+8*1919]
	call    concat
	mov [rsp+8*1923], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1924] ,r8
	mov     rsi, 4
	mov     rdi, [rsp+8*1924]
	call    address
	mov [rsp+8*1925], rax
	mov r8, [rsp+8*1925]
	mov r8, [r8]
	mov [rsp+8*1926], r8
	mov     rsi, [rsp+8*1926]
	mov     rdi, [rsp+8*1923]
	call    concat
	mov [rsp+8*1927], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1928] ,r8
	mov     rsi, 16
	mov     rdi, [rsp+8*1928]
	call    address
	mov [rsp+8*1929], rax
	mov r8, [rsp+8*1929]
	mov r8, [r8]
	mov [rsp+8*1930], r8
	mov     rsi, [rsp+8*1930]
	mov     rdi, [rsp+8*1927]
	call    concat
	mov [rsp+8*1931], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1932] ,r8
	mov     rsi, 15
	mov     rdi, [rsp+8*1932]
	call    address
	mov [rsp+8*1933], rax
	mov r8, [rsp+8*1933]
	mov r8, [r8]
	mov [rsp+8*1934], r8
	mov     rsi, [rsp+8*1934]
	mov     rdi, [rsp+8*1931]
	call    concat
	mov [rsp+8*1935], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1936] ,r8
	mov     rsi, 8
	mov     rdi, [rsp+8*1936]
	call    address
	mov [rsp+8*1937], rax
	mov r8, [rsp+8*1937]
	mov r8, [r8]
	mov [rsp+8*1938], r8
	mov     rsi, [rsp+8*1938]
	mov     rdi, [rsp+8*1935]
	call    concat
	mov [rsp+8*1939], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1940] ,r8
	mov     rsi, 10
	mov     rdi, [rsp+8*1940]
	call    address
	mov [rsp+8*1941], rax
	mov r8, [rsp+8*1941]
	mov r8, [r8]
	mov [rsp+8*1942], r8
	mov     rsi, [rsp+8*1942]
	mov     rdi, [rsp+8*1939]
	call    concat
	mov [rsp+8*1943], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1943]
	call    concat
	mov [rsp+8*1944], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1945] ,r8
	mov     rsi, 59
	mov     rdi, [rsp+8*1945]
	call    address
	mov [rsp+8*1946], rax
	mov r8, [rsp+8*1946]
	mov r8, [r8]
	mov [rsp+8*1947], r8
	mov     rsi, [rsp+8*1947]
	mov     rdi, [rsp+8*1944]
	call    concat
	mov [rsp+8*1948], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1949] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*1949]
	call    address
	mov [rsp+8*1950], rax
	mov r8, [rsp+8*1950]
	mov r8, [r8]
	mov [rsp+8*1951], r8
	mov     rsi, [rsp+8*1951]
	mov     rdi, [rsp+8*1948]
	call    concat
	mov [rsp+8*1952], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*1952]
	call    concat
	mov [rsp+8*1953], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1954] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*1954]
	call    address
	mov [rsp+8*1955], rax
	mov r8, [rsp+8*1955]
	mov r8, [r8]
	mov [rsp+8*1956], r8
	mov     rsi, [rsp+8*1956]
	mov     rdi, [rsp+8*1953]
	call    concat
	mov [rsp+8*1957], rax
	mov r8, [rsp+8*1957]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*1958] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*1958] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1959] ,r8
	mov     rsi, 91
	mov     rdi, [rsp+8*1959]
	call    address
	mov [rsp+8*1960], rax
	mov r8, [rsp+8*1960]
	mov r8, [r8]
	mov [rsp+8*1961], r8
	mov r8, [rsp+8*1961]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*1962] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*1962] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1963] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*1963]
	call    address
	mov [rsp+8*1964], rax
	mov r8, [rsp+8*1964]
	mov r8, [r8]
	mov [rsp+8*1965], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1966] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*1966]
	call    address
	mov [rsp+8*1967], rax
	mov r8, [rsp+8*1967]
	mov r8, [r8]
	mov [rsp+8*1968], r8
	mov     rsi, [rsp+8*1968]
	mov     rdi, [rsp+8*1965]
	call    concat
	mov [rsp+8*1969], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1970] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*1970]
	call    address
	mov [rsp+8*1971], rax
	mov r8, [rsp+8*1971]
	mov r8, [r8]
	mov [rsp+8*1972], r8
	mov     rsi, [rsp+8*1972]
	mov     rdi, [rsp+8*1969]
	call    concat
	mov [rsp+8*1973], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1974] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*1974]
	call    address
	mov [rsp+8*1975], rax
	mov r8, [rsp+8*1975]
	mov r8, [r8]
	mov [rsp+8*1976], r8
	mov     rsi, [rsp+8*1976]
	mov     rdi, [rsp+8*1973]
	call    concat
	mov [rsp+8*1977], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1978] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*1978]
	call    address
	mov [rsp+8*1979], rax
	mov r8, [rsp+8*1979]
	mov r8, [r8]
	mov [rsp+8*1980], r8
	mov     rsi, [rsp+8*1980]
	mov     rdi, [rsp+8*1977]
	call    concat
	mov [rsp+8*1981], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1982] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*1982]
	call    address
	mov [rsp+8*1983], rax
	mov r8, [rsp+8*1983]
	mov r8, [r8]
	mov [rsp+8*1984], r8
	mov     rsi, [rsp+8*1984]
	mov     rdi, [rsp+8*1981]
	call    concat
	mov [rsp+8*1985], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1986] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*1986]
	call    address
	mov [rsp+8*1987], rax
	mov r8, [rsp+8*1987]
	mov r8, [r8]
	mov [rsp+8*1988], r8
	mov     rsi, [rsp+8*1988]
	mov     rdi, [rsp+8*1985]
	call    concat
	mov [rsp+8*1989], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1990] ,r8
	mov     rsi, 65
	mov     rdi, [rsp+8*1990]
	call    address
	mov [rsp+8*1991], rax
	mov r8, [rsp+8*1991]
	mov r8, [r8]
	mov [rsp+8*1992], r8
	mov     rsi, [rsp+8*1992]
	mov     rdi, [rsp+8*1989]
	call    concat
	mov [rsp+8*1993], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1994] ,r8
	mov     rsi, 77
	mov     rdi, [rsp+8*1994]
	call    address
	mov [rsp+8*1995], rax
	mov r8, [rsp+8*1995]
	mov r8, [r8]
	mov [rsp+8*1996], r8
	mov     rsi, [rsp+8*1996]
	mov     rdi, [rsp+8*1993]
	call    concat
	mov [rsp+8*1997], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*1998] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*1998]
	call    address
	mov [rsp+8*1999], rax
	mov r8, [rsp+8*1999]
	mov r8, [r8]
	mov [rsp+8*2000], r8
	mov     rsi, [rsp+8*2000]
	mov     rdi, [rsp+8*1997]
	call    concat
	mov [rsp+8*2001], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2001]
	call    concat
	mov [rsp+8*2002], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2003] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*2003]
	call    address
	mov [rsp+8*2004], rax
	mov r8, [rsp+8*2004]
	mov r8, [r8]
	mov [rsp+8*2005], r8
	mov     rsi, [rsp+8*2005]
	mov     rdi, [rsp+8*2002]
	call    concat
	mov [rsp+8*2006], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2006]
	call    concat
	mov [rsp+8*2007], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2008] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*2008]
	call    address
	mov [rsp+8*2009], rax
	mov r8, [rsp+8*2009]
	mov r8, [r8]
	mov [rsp+8*2010], r8
	mov     rsi, [rsp+8*2010]
	mov     rdi, [rsp+8*2007]
	call    concat
	mov [rsp+8*2011], rax
	mov r8, [rsp+8*2011]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*2012] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*2012] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2013] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*2013]
	call    address
	mov [rsp+8*2014], rax
	mov r8, [rsp+8*2014]
	mov r8, [r8]
	mov [rsp+8*2015], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2016] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*2016]
	call    address
	mov [rsp+8*2017], rax
	mov r8, [rsp+8*2017]
	mov r8, [r8]
	mov [rsp+8*2018], r8
	mov     rsi, [rsp+8*2018]
	mov     rdi, [rsp+8*2015]
	call    concat
	mov [rsp+8*2019], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2020] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*2020]
	call    address
	mov [rsp+8*2021], rax
	mov r8, [rsp+8*2021]
	mov r8, [r8]
	mov [rsp+8*2022], r8
	mov     rsi, [rsp+8*2022]
	mov     rdi, [rsp+8*2019]
	call    concat
	mov [rsp+8*2023], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2024] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*2024]
	call    address
	mov [rsp+8*2025], rax
	mov r8, [rsp+8*2025]
	mov r8, [r8]
	mov [rsp+8*2026], r8
	mov     rsi, [rsp+8*2026]
	mov     rdi, [rsp+8*2023]
	call    concat
	mov [rsp+8*2027], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2028] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*2028]
	call    address
	mov [rsp+8*2029], rax
	mov r8, [rsp+8*2029]
	mov r8, [r8]
	mov [rsp+8*2030], r8
	mov     rsi, [rsp+8*2030]
	mov     rdi, [rsp+8*2027]
	call    concat
	mov [rsp+8*2031], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2032] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*2032]
	call    address
	mov [rsp+8*2033], rax
	mov r8, [rsp+8*2033]
	mov r8, [r8]
	mov [rsp+8*2034], r8
	mov     rsi, [rsp+8*2034]
	mov     rdi, [rsp+8*2031]
	call    concat
	mov [rsp+8*2035], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2036] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*2036]
	call    address
	mov [rsp+8*2037], rax
	mov r8, [rsp+8*2037]
	mov r8, [r8]
	mov [rsp+8*2038], r8
	mov     rsi, [rsp+8*2038]
	mov     rdi, [rsp+8*2035]
	call    concat
	mov [rsp+8*2039], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2040] ,r8
	mov     rsi, 63
	mov     rdi, [rsp+8*2040]
	call    address
	mov [rsp+8*2041], rax
	mov r8, [rsp+8*2041]
	mov r8, [r8]
	mov [rsp+8*2042], r8
	mov     rsi, [rsp+8*2042]
	mov     rdi, [rsp+8*2039]
	call    concat
	mov [rsp+8*2043], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2044] ,r8
	mov     rsi, 17
	mov     rdi, [rsp+8*2044]
	call    address
	mov [rsp+8*2045], rax
	mov r8, [rsp+8*2045]
	mov r8, [r8]
	mov [rsp+8*2046], r8
	mov     rsi, [rsp+8*2046]
	mov     rdi, [rsp+8*2043]
	call    concat
	mov [rsp+8*2047], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2048] ,r8
	mov     rsi, 79
	mov     rdi, [rsp+8*2048]
	call    address
	mov [rsp+8*2049], rax
	mov r8, [rsp+8*2049]
	mov r8, [r8]
	mov [rsp+8*2050], r8
	mov     rsi, [rsp+8*2050]
	mov     rdi, [rsp+8*2047]
	call    concat
	mov [rsp+8*2051], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2052] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*2052]
	call    address
	mov [rsp+8*2053], rax
	mov r8, [rsp+8*2053]
	mov r8, [r8]
	mov [rsp+8*2054], r8
	mov     rsi, [rsp+8*2054]
	mov     rdi, [rsp+8*2051]
	call    concat
	mov [rsp+8*2055], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2055]
	call    concat
	mov [rsp+8*2056], rax
	mov     rsi, [gbl+8*2057]
	mov     rdi, [rsp+8*2056]
	call    concat
	mov [rsp+8*2058], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2058]
	call    concat
	mov [rsp+8*2059], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2059]
	call    concat
	mov [rsp+8*2060], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2061] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*2061]
	call    address
	mov [rsp+8*2062], rax
	mov r8, [rsp+8*2062]
	mov r8, [r8]
	mov [rsp+8*2063], r8
	mov     rsi, [rsp+8*2063]
	mov     rdi, [rsp+8*2060]
	call    concat
	mov [rsp+8*2064], rax
	mov r8, [rsp+8*2064]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*2065] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*2065] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2066] ,r8
	mov     rsi, 81
	mov     rdi, [rsp+8*2066]
	call    address
	mov [rsp+8*2067], rax
	mov r8, [rsp+8*2067]
	mov r8, [r8]
	mov [rsp+8*2068], r8
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2069] ,r8
	mov     rsi, 82
	mov     rdi, [rsp+8*2069]
	call    address
	mov [rsp+8*2070], rax
	mov r8, [rsp+8*2070]
	mov r8, [r8]
	mov [rsp+8*2071], r8
	mov     rsi, [rsp+8*2071]
	mov     rdi, [rsp+8*2068]
	call    concat
	mov [rsp+8*2072], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2073] ,r8
	mov     rsi, 80
	mov     rdi, [rsp+8*2073]
	call    address
	mov [rsp+8*2074], rax
	mov r8, [rsp+8*2074]
	mov r8, [r8]
	mov [rsp+8*2075], r8
	mov     rsi, [rsp+8*2075]
	mov     rdi, [rsp+8*2072]
	call    concat
	mov [rsp+8*2076], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2077] ,r8
	mov     rsi, 71
	mov     rdi, [rsp+8*2077]
	call    address
	mov [rsp+8*2078], rax
	mov r8, [rsp+8*2078]
	mov r8, [r8]
	mov [rsp+8*2079], r8
	mov     rsi, [rsp+8*2079]
	mov     rdi, [rsp+8*2076]
	call    concat
	mov [rsp+8*2080], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2081] ,r8
	mov     rsi, 76
	mov     rdi, [rsp+8*2081]
	call    address
	mov [rsp+8*2082], rax
	mov r8, [rsp+8*2082]
	mov r8, [r8]
	mov [rsp+8*2083], r8
	mov     rsi, [rsp+8*2083]
	mov     rdi, [rsp+8*2080]
	call    concat
	mov [rsp+8*2084], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2085] ,r8
	mov     rsi, 69
	mov     rdi, [rsp+8*2085]
	call    address
	mov [rsp+8*2086], rax
	mov r8, [rsp+8*2086]
	mov r8, [r8]
	mov [rsp+8*2087], r8
	mov     rsi, [rsp+8*2087]
	mov     rdi, [rsp+8*2084]
	call    concat
	mov [rsp+8*2088], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2089] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*2089]
	call    address
	mov [rsp+8*2090], rax
	mov r8, [rsp+8*2090]
	mov r8, [r8]
	mov [rsp+8*2091], r8
	mov     rsi, [rsp+8*2091]
	mov     rdi, [rsp+8*2088]
	call    concat
	mov [rsp+8*2092], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2093] ,r8
	mov     rsi, 63
	mov     rdi, [rsp+8*2093]
	call    address
	mov [rsp+8*2094], rax
	mov r8, [rsp+8*2094]
	mov r8, [r8]
	mov [rsp+8*2095], r8
	mov     rsi, [rsp+8*2095]
	mov     rdi, [rsp+8*2092]
	call    concat
	mov [rsp+8*2096], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2097] ,r8
	mov     rsi, 17
	mov     rdi, [rsp+8*2097]
	call    address
	mov [rsp+8*2098], rax
	mov r8, [rsp+8*2098]
	mov r8, [r8]
	mov [rsp+8*2099], r8
	mov     rsi, [rsp+8*2099]
	mov     rdi, [rsp+8*2096]
	call    concat
	mov [rsp+8*2100], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2101] ,r8
	mov     rsi, 64
	mov     rdi, [rsp+8*2101]
	call    address
	mov [rsp+8*2102], rax
	mov r8, [rsp+8*2102]
	mov r8, [r8]
	mov [rsp+8*2103], r8
	mov     rsi, [rsp+8*2103]
	mov     rdi, [rsp+8*2100]
	call    concat
	mov [rsp+8*2104], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2105] ,r8
	mov     rsi, 28
	mov     rdi, [rsp+8*2105]
	call    address
	mov [rsp+8*2106], rax
	mov r8, [rsp+8*2106]
	mov r8, [r8]
	mov [rsp+8*2107], r8
	mov     rsi, [rsp+8*2107]
	mov     rdi, [rsp+8*2104]
	call    concat
	mov [rsp+8*2108], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2108]
	call    concat
	mov [rsp+8*2109], rax
	mov     rsi, [gbl+8*2057]
	mov     rdi, [rsp+8*2109]
	call    concat
	mov [rsp+8*2110], rax
	mov     rsi, [gbl+8*2057]
	mov     rdi, [rsp+8*2110]
	call    concat
	mov [rsp+8*2111], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2111]
	call    concat
	mov [rsp+8*2112], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2113] ,r8
	mov     rsi, 26
	mov     rdi, [rsp+8*2113]
	call    address
	mov [rsp+8*2114], rax
	mov r8, [rsp+8*2114]
	mov r8, [r8]
	mov [rsp+8*2115], r8
	mov     rsi, [rsp+8*2115]
	mov     rdi, [rsp+8*2112]
	call    concat
	mov [rsp+8*2116], rax
	mov r8, [rsp+8*2116]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*2117] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*2117] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov r8, [gbl+8*190]
	mov qword [rsp+8*2118] ,r8
	mov     rsi, 0
	mov     rdi, [rsp+8*2118]
	call    address
	mov [rsp+8*2119], rax
	mov r8, [rsp+8*2119]
	mov r8, [r8]
	mov [rsp+8*2120], r8
	mov r8, [rsp+8*2120]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*2121] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*2121] 
	add rsi, 1 
	xor rax, rax
	call printf
	mov qword [rsp+8*2] ,0
	
L_115:
	mov r8, [rsp+8*2]
	mov r9, 93
	cmp r8, r9
	mov qword [rsp+8*2122], 0
	setl [rsp+8*2122]
	mov r8, [rsp+8*2122]
	cmp r8, 0
	je L_116
	mov r8, [rsp+8*2]
	mov qword [gbl+8*328] ,r8
	call c2
	mov [rsp+8*2123] , rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2123]
	call    concat
	mov [rsp+8*2124], rax
	mov r8, [gbl+8*3]
	mov qword [rsp+8*2125] ,r8
	mov     rsi, [rsp+8*2]
	mov     rdi, [rsp+8*2125]
	call    address
	mov [rsp+8*2126], rax
	mov r8, [rsp+8*2126]
	mov r8, [r8]
	mov [rsp+8*2127], r8
	mov     rsi, [rsp+8*2127]
	mov     rdi, [rsp+8*2124]
	call    concat
	mov [rsp+8*2128], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2128]
	call    concat
	mov [rsp+8*2129], rax
	mov     rsi, [gbl+8*2130]
	mov     rdi, [rsp+8*2129]
	call    concat
	mov [rsp+8*2131], rax
	mov r8, [rsp+8*2131]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*2132] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*2132] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_117:
	mov r8, [rsp+8*2]
	add r8, 1
	mov qword [rsp+8*2],r8 
	mov r8, [rsp+8*2]
	sub r8, 1
	mov qword [rsp+8*2133],r8 
	jmp L_115
	
L_116:
	mov qword [rsp+8*2] ,0
	
L_118:
	mov r8, [rsp+8*2]
	mov r9, 31
	cmp r8, r9
	mov qword [rsp+8*2134], 0
	setl [rsp+8*2134]
	mov r8, [rsp+8*2134]
	cmp r8, 0
	je L_119
	mov r8, [rsp+8*2]
	mov qword [gbl+8*328] ,r8
	call s2
	mov [rsp+8*2135] , rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2135]
	call    concat
	mov [rsp+8*2136], rax
	mov r8, [gbl+8*190]
	mov qword [rsp+8*2137] ,r8
	mov     rsi, [rsp+8*2]
	mov     rdi, [rsp+8*2137]
	call    address
	mov [rsp+8*2138], rax
	mov r8, [rsp+8*2138]
	mov r8, [r8]
	mov [rsp+8*2139], r8
	mov     rsi, [rsp+8*2139]
	mov     rdi, [rsp+8*2136]
	call    concat
	mov [rsp+8*2140], rax
	mov     rsi, [gbl+8*389]
	mov     rdi, [rsp+8*2140]
	call    concat
	mov [rsp+8*2141], rax
	mov     rsi, [gbl+8*2130]
	mov     rdi, [rsp+8*2141]
	call    concat
	mov [rsp+8*2142], rax
	mov r8, [rsp+8*2142]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*2143] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*2143] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_120:
	mov r8, [rsp+8*2]
	add r8, 1
	mov qword [rsp+8*2],r8 
	mov r8, [rsp+8*2]
	sub r8, 1
	mov qword [rsp+8*2144],r8 
	jmp L_118
	
L_119:
	mov qword [rsp+8*2] ,1
	
L_121:
	mov r8, [rsp+8*2]
	mov r9, 31
	cmp r8, r9
	mov qword [rsp+8*2145], 0
	setl [rsp+8*2145]
	mov r8, [rsp+8*2145]
	cmp r8, 0
	je L_122
	mov r8, [gbl+8*190]
	mov qword [rsp+8*2146] ,r8
	mov     rsi, [rsp+8*2]
	mov     rdi, [rsp+8*2146]
	call    address
	mov [rsp+8*2147], rax
	mov r8, [rsp+8*2147]
	mov r8, [r8]
	mov [rsp+8*2148], r8
	mov r8, [rsp+8*2148]
	mov qword [gbl+8*328] ,r8
	mov r8, [gbl+8*328]
	mov qword [rsp+8*2149] ,r8
	mov rdi, formatln
	mov rsi,[rsp+8*2149] 
	add rsi, 1 
	xor rax, rax
	call printf
	
L_123:
	mov r8, [rsp+8*2]
	add r8, 1
	mov qword [rsp+8*2],r8 
	mov r8, [rsp+8*2]
	sub r8, 1
	mov qword [rsp+8*2150],r8 
	jmp L_121
	
L_122:
	mov rax,0
	leave
	ret
	jmp QED
	
digt:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 17568
	mov r8, [gbl+8*328]
	mov qword [rsp+8*2151] ,r8
	mov r8, [rsp+8*2151]
	mov r9, 0
	cmp r8, r9
	mov qword [rsp+8*2152], 0
	sete [rsp+8*2152]
	mov r8, [rsp+8*2152]
	cmp r8, 0
	je L_92
	mov rax,t2114
	leave
	ret
	
L_92:
	mov r8, [rsp+8*2151]
	mov r9, 1
	cmp r8, r9
	mov qword [rsp+8*2153], 0
	sete [rsp+8*2153]
	mov r8, [rsp+8*2153]
	cmp r8, 0
	je L_94
	mov rax,t2117
	leave
	ret
	
L_94:
	mov r8, [rsp+8*2151]
	mov r9, 2
	cmp r8, r9
	mov qword [rsp+8*2154], 0
	sete [rsp+8*2154]
	mov r8, [rsp+8*2154]
	cmp r8, 0
	je L_96
	mov rax,t2120
	leave
	ret
	
L_96:
	mov r8, [rsp+8*2151]
	mov r9, 3
	cmp r8, r9
	mov qword [rsp+8*2155], 0
	sete [rsp+8*2155]
	mov r8, [rsp+8*2155]
	cmp r8, 0
	je L_98
	mov rax,t2123
	leave
	ret
	
L_98:
	mov r8, [rsp+8*2151]
	mov r9, 4
	cmp r8, r9
	mov qword [rsp+8*2156], 0
	sete [rsp+8*2156]
	mov r8, [rsp+8*2156]
	cmp r8, 0
	je L_100
	mov rax,t2126
	leave
	ret
	
L_100:
	mov r8, [rsp+8*2151]
	mov r9, 5
	cmp r8, r9
	mov qword [rsp+8*2157], 0
	sete [rsp+8*2157]
	mov r8, [rsp+8*2157]
	cmp r8, 0
	je L_102
	mov rax,t2129
	leave
	ret
	
L_102:
	mov r8, [rsp+8*2151]
	mov r9, 6
	cmp r8, r9
	mov qword [rsp+8*2158], 0
	sete [rsp+8*2158]
	mov r8, [rsp+8*2158]
	cmp r8, 0
	je L_104
	mov rax,t2132
	leave
	ret
	
L_104:
	mov r8, [rsp+8*2151]
	mov r9, 7
	cmp r8, r9
	mov qword [rsp+8*2159], 0
	sete [rsp+8*2159]
	mov r8, [rsp+8*2159]
	cmp r8, 0
	je L_106
	mov rax,t2135
	leave
	ret
	
L_106:
	mov r8, [rsp+8*2151]
	mov r9, 8
	cmp r8, r9
	mov qword [rsp+8*2160], 0
	sete [rsp+8*2160]
	mov r8, [rsp+8*2160]
	cmp r8, 0
	je L_108
	mov rax,t2138
	leave
	ret
	
L_108:
	mov r8, [rsp+8*2151]
	mov r9, 9
	cmp r8, r9
	mov qword [rsp+8*2161], 0
	sete [rsp+8*2161]
	mov r8, [rsp+8*2161]
	cmp r8, 0
	je L_110
	mov rax,t2141
	leave
	ret
	
L_110:
	mov rax,0
	leave
	ret
	
s2:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 17568
	mov r8, [gbl+8*328]
	mov qword [rsp+8*2162] ,r8
	mov r8, [rsp+8*2162]
	mov r9, 9
	cmp r8, r9
	mov qword [rsp+8*2163], 0
	setle [rsp+8*2163]
	mov r8, [rsp+8*2163]
	cmp r8, 0
	je L_112
	mov r8, [rsp+8*2162]
	mov qword [gbl+8*328] ,r8
	call digt
	mov [rsp+8*2164] , rax
	mov     rsi, [rsp+8*2164]
	mov     rdi, t2151
	call    concat
	mov [rsp+8*2165], rax
	mov     rsi, t2155
	mov     rdi, [rsp+8*2165]
	call    concat
	mov [rsp+8*2166], rax
	mov rax,[rsp+8*2166]
	leave
	ret
	
L_112:
	xor rdx, rdx
	mov rax, [rsp+8*2162]
	mov rbx, 10
	cdq
	idiv rbx
	mov [rsp+8*2167], rax
	mov r8, [rsp+8*2167]
	mov qword [gbl+8*328] ,r8
	call digt
	mov [rsp+8*2168] , rax
	mov     rsi, [rsp+8*2168]
	mov     rdi, t2157
	call    concat
	mov [rsp+8*2169], rax
	xor rdx, rdx
	mov rax, [rsp+8*2162]
	mov rbx, 10
	cdq
	idiv rbx
	mov [rsp+8*2170], rdx
	mov r8, [rsp+8*2170]
	mov qword [gbl+8*328] ,r8
	call digt
	mov [rsp+8*2171] , rax
	mov     rsi, [rsp+8*2171]
	mov     rdi, [rsp+8*2169]
	call    concat
	mov [rsp+8*2172], rax
	mov     rsi, t2168
	mov     rdi, [rsp+8*2172]
	call    concat
	mov [rsp+8*2173], rax
	mov rax,[rsp+8*2173]
	leave
	ret
	mov rax,0
	leave
	ret
	
c2:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 17568
	mov r8, [gbl+8*328]
	mov qword [rsp+8*2174] ,r8
	mov r8, [rsp+8*2174]
	mov r9, 9
	cmp r8, r9
	mov qword [rsp+8*2175], 0
	setle [rsp+8*2175]
	mov r8, [rsp+8*2175]
	cmp r8, 0
	je L_114
	mov r8, [rsp+8*2174]
	mov qword [gbl+8*328] ,r8
	call digt
	mov [rsp+8*2176] , rax
	mov     rsi, [rsp+8*2176]
	mov     rdi, t2173
	call    concat
	mov [rsp+8*2177], rax
	mov     rsi, t2177
	mov     rdi, [rsp+8*2177]
	call    concat
	mov [rsp+8*2178], rax
	mov rax,[rsp+8*2178]
	leave
	ret
	
L_114:
	xor rdx, rdx
	mov rax, [rsp+8*2174]
	mov rbx, 10
	cdq
	idiv rbx
	mov [rsp+8*2179], rax
	mov r8, [rsp+8*2179]
	mov qword [gbl+8*328] ,r8
	call digt
	mov [rsp+8*2180] , rax
	mov     rsi, [rsp+8*2180]
	mov     rdi, t2179
	call    concat
	mov [rsp+8*2181], rax
	xor rdx, rdx
	mov rax, [rsp+8*2174]
	mov rbx, 10
	cdq
	idiv rbx
	mov [rsp+8*2182], rdx
	mov r8, [rsp+8*2182]
	mov qword [gbl+8*328] ,r8
	call digt
	mov [rsp+8*2183] , rax
	mov     rsi, [rsp+8*2183]
	mov     rdi, [rsp+8*2181]
	call    concat
	mov [rsp+8*2184], rax
	mov     rsi, t2190
	mov     rdi, [rsp+8*2184]
	call    concat
	mov [rsp+8*2185], rax
	mov rax,[rsp+8*2185]
	leave
	ret
	mov rax,0
	leave
	ret
	
global_init:
	push   rbp
	mov    rbp, rsp
	sub    rsp, 17568
	mov     rdi, 256
	call    mallocArray
	mov     qword [gbl+8*2186], rax
	mov r8, [gbl+8*2186]
	mov qword [gbl+8*190] ,r8
	mov     rdi, 256
	call    mallocArray
	mov     qword [gbl+8*2187], rax
	mov r8, [gbl+8*2187]
	mov qword [gbl+8*3] ,r8
	mov qword [gbl+8*2130] ,t2193
	mov qword [gbl+8*389] ,t2194
	mov qword [gbl+8*2057] ,t2195
	mov rax,[rsp+8*2188]
	leave
	ret
	
QED:
	
	 section   .bss
gbl:         resb   19552

	 section   .data

formatln:
	db  "%s", 10, 0
	
format:
	db  "%s",  0
	
t2305:
	 db 1,"<" ,0

t2669:
	 db 96,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[63]+c[17]+c[64]+c[28]+a2q+a2b+a2b+a2q+c[26]);" ,0

t2545:
	 db 1,"y" ,0

t2425:
	 db 1,"Z" ,0

t2309:
	 db 1,"=" ,0

t2549:
	 db 1,"z" ,0

t2429:
	 db 1,"[" ,0

t2385:
	 db 1,"P" ,0

t2265:
	 db 1,"2" ,0

t2661:
	 db 88,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[65]+c[77]+c[28]+a2q+c[26]+a2q+c[26]);" ,0

t2141:
	 db 1,"9" ,0

t2301:
	 db 1,";" ,0

t2389:
	 db 1,"Q" ,0

t2269:
	 db 1,"3" ,0

t2665:
	 db 96,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[63]+c[17]+c[79]+c[28]+a2q+a2b+a2q+a2q+c[26]);" ,0

t2541:
	 db 1,"x" ,0

t2421:
	 db 1,"Y" ,0

t2381:
	 db 1,"O" ,0

t2261:
	 db 1,"1" ,0

t2657:
	 db 15,"println(c[91]);" ,0

t2537:
	 db 1,"w" ,0

t2138:
	 db 1,"8" ,0

t2413:
	 db 1,"W" ,0

t2417:
	 db 1,"X" ,0

t2132:
	 db 1,"6" ,0

t2253:
	 db 1,"/" ,0

t2493:
	 db 1,"l" ,0

t2373:
	 db 1,"M" ,0

t2257:
	 db 1,"0" ,0

t2653:
	 db 241,"println(c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[65]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[14]+c[16]+c[15]+c[8]+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[4]+c[16]+c[15]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t2533:
	 db 1,"v" ,0

t2497:
	 db 1,"m" ,0

t2135:
	 db 1,"7" ,0

t2377:
	 db 1,"N" ,0

t2129:
	 db 1,"5" ,0

t2525:
	 db 1,"t" ,0

t2405:
	 db 1,"U" ,0

t2369:
	 db 1,"L" ,0

t2249:
	 db 1,"." ,0

t2645:
	 db 113,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[65]+c[17]+c[7]+c[71]+c[76]+c[82]+c[0]+c[65]+c[65]+c[8]+c[89]);" ,0

t2529:
	 db 1,"u" ,0

t2409:
	 db 1,"V" ,0

t2649:
	 db 206,"println(c[71]+c[68]+c[7]+c[65]+c[65]+c[27]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[65]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[65]+c[65]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t2485:
	 db 1,"j" ,0

t2361:
	 db 1,"J" ,0

t2120:
	 db 1,"2" ,0

t2241:
	 db 1,"," ,0

t2521:
	 db 1,"s" ,0

t2126:
	 db 1,"4" ,0

t2401:
	 db 1,"T" ,0

t2489:
	 db 1,"k" ,0

t2123:
	 db 1,"3" ,0

t2365:
	 db 1,"K" ,0

t2245:
	 db 1,"-" ,0

t2641:
	 db 15,"println(c[91]);" ,0

t2481:
	 db 1,"i" ,0

t2237:
	 db 1,"+" ,0

t2633:
	 db 206,"println(c[71]+c[68]+c[7]+c[81]+c[81]+c[27]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[81]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t2117:
	 db 1,"1" ,0

t2513:
	 db 1,"q" ,0

t2637:
	 db 241,"println(c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[81]+c[58]+a2q+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[14]+c[16]+c[15]+c[8]+c[10]+c[66]+c[71]+c[69]+c[82]+c[7]+c[81]+c[81]+c[4]+c[16]+c[15]+c[8]+c[10]+a2q+c[59]+c[28]+a2q+c[26]);" ,0

t2517:
	 db 1,"r" ,0

t2473:
	 db 1,"g" ,0

t2353:
	 db 1,"H" ,0

t2197:
	 db 1," " ,0

t2593:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[19]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[19]+a2q+c[26]);" ,0

t2114:
	 db 1,"0" ,0

t2477:
	 db 1,"h" ,0

t2357:
	 db 1,"I" ,0

t2233:
	 db 1,"*" ,0

t2597:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[20]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[20]+a2q+c[26]);" ,0

t2190:
	 db 2,"]=" ,0

t2194:
	 db 1,"",34,"" ,0

t2195:
	 db 1,"",92,"" ,0

t2193:
	 db 1,";" ,0

t2509:
	 db 1,"p" ,0

t2349:
	 db 1,"G" ,0

t2229:
	 db 1,")" ,0

t2625:
	 db 169,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[59]+c[0]+c[65]+c[28]+c[76]+c[67]+c[85]+c[0]+c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[17]+c[20]+c[21]+c[59]+c[26]);" ,0

t2501:
	 db 1,"n" ,0

t2589:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[18]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[18]+a2q+c[26]);" ,0

t2469:
	 db 1,"f" ,0

t2629:
	 db 113,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[81]+c[17]+c[7]+c[71]+c[76]+c[82]+c[0]+c[81]+c[81]+c[8]+c[89]);" ,0

t2505:
	 db 1,"o" ,0

t2341:
	 db 1,"E" ,0

t2221:
	 db 1,"'" ,0

t2581:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[16]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[16]+a2q+c[26]);" ,0

t2461:
	 db 1,"d" ,0

t2345:
	 db 1,"F" ,0

t2225:
	 db 1,"(" ,0

t2621:
	 db 169,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[59]+c[0]+c[81]+c[28]+c[76]+c[67]+c[85]+c[0]+c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[58]+c[17]+c[20]+c[21]+c[59]+c[26]);" ,0

t2585:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[17]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[17]+a2q+c[26]);" ,0

t2465:
	 db 1,"e" ,0

t2217:
	 db 1,"&" ,0

t2613:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[24]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[24]+a2q+c[26]);" ,0

t2457:
	 db 1,"c" ,0

t2337:
	 db 1,"D" ,0

t2617:
	 db 15,"println(c[91]);" ,0

t2297:
	 db 1,":" ,0

t2177:
	 db 2,"]=" ,0

t2573:
	 db 119,"println(c[81]+c[82]+c[80]+c[71]+c[76]+c[69]+c[0]+c[66]+c[71]+c[69]+c[82]+c[7]+c[71]+c[76]+c[82]+c[0]+c[86]+c[8]+c[89]);" ,0

t2213:
	 db 1,"%" ,0

t2577:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[15]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[15]+a2q+c[26]);" ,0

t2453:
	 db 1,"b" ,0

t2179:
	 db 2,"c[" ,0

t2333:
	 db 1,"C" ,0

t2293:
	 db 1,"9" ,0

t2173:
	 db 2,"c[" ,0

t2609:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[23]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[23]+a2q+c[26]);" ,0

t2569:
	 db 19,"int main(){int i=0;" ,0

t2449:
	 db 1,"a" ,0

t2325:
	 db 1,"A" ,0

t2205:
	 db 1,"#" ,0

t2601:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[21]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[21]+a2q+c[26]);" ,0

t2689:
	 db 1,"}" ,0

t2329:
	 db 1,"B" ,0

t2209:
	 db 1,"$" ,0

t2605:
	 db 116,"println(c[71]+c[68]+c[7]+c[86]+c[28]+c[28]+c[22]+c[8]+c[80]+c[67]+c[82]+c[83]+c[80]+c[76]+c[0]+a2q+c[22]+a2q+c[26]);" ,0

t2561:
	 db 1,"}" ,0

t2441:
	 db 1,"_" ,0

t2285:
	 db 1,"7" ,0

t2681:
	 db 48,"for(i=0;i<31;i++)println(s2(i)+a2q+s[i]+a2q+co);" ,0

t2565:
	 db 1,"~" ,0

t2445:
	 db 1,"`" ,0

t2321:
	 db 1,"@" ,0

t2168:
	 db 2,"]=" ,0

t2201:
	 db 1,"!" ,0

t2289:
	 db 1,"8" ,0

t2685:
	 db 31,"for(i=1;i<31;i++)println(s[i]);" ,0

t2281:
	 db 1,"6" ,0

t2437:
	 db 1,"^" ,0

t2317:
	 db 1,"?" ,0

t2677:
	 db 48,"for(i=0;i<93;i++)println(c2(i)+a2q+c[i]+a2q+co);" ,0

t2557:
	 db 1,"|" ,0

t2155:
	 db 2,"]=" ,0

t2397:
	 db 1,"S" ,0

t2273:
	 db 1,"4" ,0

t2433:
	 db 1,"]" ,0

t2313:
	 db 1,">" ,0

t2277:
	 db 1,"5" ,0

t2673:
	 db 14,"println(s[0]);" ,0

t2157:
	 db 2,"s[" ,0

t2553:
	 db 1,"{" ,0

t2151:
	 db 2,"s[" ,0

t2393:
	 db 1,"R" ,0


