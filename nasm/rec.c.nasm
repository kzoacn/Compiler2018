






global f
global g
global h
global main
global N


SECTION .text   

f:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     dword [rbp-4H], edi
        cmp     dword [rbp-4H], 0
        jg      L_001
        mov     eax, 0
        jmp     L_002

L_001:  mov     eax, dword [ N]
        add     eax, 1
        mov     dword [ N], eax
        mov     eax, dword [rbp-4H]
        sub     eax, 1
        mov     edi, eax
        mov     eax, 0
        call    g
L_002:  leave
        ret


g:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     dword [rbp-4H], edi
        cmp     dword [rbp-4H], 0
        jg      L_003
        mov     eax, 0
        jmp     L_004

L_003:  mov     eax, dword [ N]
        add     eax, 1
        mov     dword [ N], eax
        mov     eax, dword [rbp-4H]
        sub     eax, 1
        mov     edi, eax
        call    h
L_004:  leave
        ret


h:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     dword [rbp-4H], edi
        cmp     dword [rbp-4H], 0
        jg      L_005
        mov     eax, 0
        jmp     L_006

L_005:  mov     eax, dword [ N]
        add     eax, 1
        mov     dword [ N], eax
        mov     eax, dword [rbp-4H]
        sub     eax, 1
        mov     edi, eax
        call    h
L_006:  leave
        ret


main:
        push    rbp
        mov     rbp, rsp
        pop     rbp
        ret



SECTION .data   


SECTION .bss    align=4

N:
        resd    1


