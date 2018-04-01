; Disassembly of file: hello.o
; Sat Mar 17 13:02:15 2018
; Mode: 64 bits
; Syntax: YASM/NASM
; Instruction set: 8086, x64

default rel

global main


SECTION .text   align=1 execute                         ; section number 1, code

main:   ; Function begin
        push    rbp                                     ; 0000 _ 55
        mov     rbp, rsp                                ; 0001 _ 48: 89. E5
        mov     dword [rbp-4H], 1                       ; 0004 _ C7. 45, FC, 00000001
        mov     dword [rbp-8H], 2                       ; 000B _ C7. 45, F8, 00000002
        mov     eax, dword [rbp-4H]                     ; 0012 _ 8B. 45, FC
        pop     rbp                                     ; 0015 _ 5D
        ret                                             ; 0016 _ C3
; main End of function


SECTION .data   align=1 noexecute                       ; section number 2, data


SECTION .bss    align=1 noexecute                       ; section number 3, bss


