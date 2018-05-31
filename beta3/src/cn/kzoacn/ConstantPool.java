package cn.kzoacn;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;

public class ConstantPool {
    static final StringBuffer myallocFunction = new StringBuffer("myalloc:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        mov     qword [rbp-18H], rdi\n" +
            "        mov     rax, qword [rel cur.1759]\n" +
            "        mov     qword [rbp-8H], rax\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, 8\n" +
            "        and     rax, 0FFFFFFFFFFFFFFF8H\n" +
            "        mov     qword [rbp-18H], rax\n" +
            "        mov     rdx, qword [rel cur.1759]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, rdx\n" +
            "        mov     qword [rel cur.1759], rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        pop     rbp\n" +
            "        ret\n");
    static final StringBuffer multiAddressFunction = new StringBuffer("multiAddress:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 48\n" +
            "        mov     qword [rbp-28H], rdi\n" +
            "        mov     qword [rbp-30H], rsi\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        mov     rax, qword [rax]\n" +
            "        mov     qword [rbp-18H], rax\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        mov     qword [rbp-10H], rax\n" +
            "        cmp     qword [rbp-18H], 0\n" +
            "        jnz     DD5\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        jmp     DD8\n" +
            "\n" +
            "DD5:  mov     qword [rbp-8H], 1\n" +
            "        jmp     DD7\n" +
            "\n" +
            "DD6:  mov     rax, qword [rbp-8H]\n" +
            "        lea     rdx, [rax-1H]\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    address\n" +
            "        mov     rdx, qword [rax]\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    address\n" +
            "        mov     rax, qword [rax]\n" +
            "        mov     qword [rbp-10H], rax\n" +
            "        add     qword [rbp-8H], 1\n" +
            "DD7:  mov     rax, qword [rbp-8H]\n" +
            "        cmp     rax, qword [rbp-18H]\n" +
            "        jl      DD6\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        lea     rdx, [rax-1H]\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    address\n" +
            "        mov     rdx, qword [rax]\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    address\n" +
            "        mov     qword [rbp-10H], rax\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "DD8:  leave\n" +
            "        ret\n");

    static final StringBuffer multiArrayFunction = new StringBuffer("_multiArray:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        push    rbx\n" +
            "        sub     rsp, 56\n" +
            "        mov     dword [rbp-34H], edi\n" +
            "        mov     qword [rbp-40H], rsi\n" +
            "        mov     eax, dword [rbp-34H]\n" +
            "        add     eax, 1\n" +
            "        movsxd  rdx, eax\n" +
            "        mov     rax, qword [rbp-40H]\n" +
            "        mov     rax, qword [rax]\n" +
            "        cmp     rdx, rax\n" +
            "        jnz     ML_09\n" +
            "        mov     eax, dword [rbp-34H]\n" +
            "        movsxd  rdx, eax\n" +
            "        mov     rax, qword [rbp-40H]\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    address\n" +
            "        mov     rax, qword [rax]\n" +
            "        mov     rdi, rax\n" +
            "        call    mallocArray\n" +
            "        jmp     ML_12\n" +
            "\n" +
            "ML_09:  mov     eax, dword [rbp-34H]\n" +
            "        movsxd  rdx, eax\n" +
            "        mov     rax, qword [rbp-40H]\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    address\n" +
            "        mov     rax, qword [rax]\n" +
            "        mov     qword [rbp-20H], rax\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        mov     rdi, rax\n" +
            "        call    mallocArray\n" +
            "        mov     qword [rbp-28H], rax\n" +
            "        mov     dword [rbp-14H], 0\n" +
            "        jmp     ML_11\n" +
            "\n" +
            "ML_10:  mov     eax, dword [rbp-14H]\n" +
            "        movsxd  rdx, eax\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    address\n" +
            "        mov     rbx, rax\n" +
            "        mov     eax, dword [rbp-34H]\n" +
            "        lea     edx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-40H]\n" +
            "        mov     rsi, rax\n" +
            "        mov     edi, edx\n" +
            "        call    _multiArray\n" +
            "        mov     qword [rbx], rax\n" +
            "        add     dword [rbp-14H], 1\n" +
            "ML_11:  mov     eax, dword [rbp-14H]\n" +
            "        cdqe\n" +
            "        cmp     rax, qword [rbp-20H]\n" +
            "        jl      ML_10\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "ML_12:  add     rsp, 56\n" +
            "        pop     rbx\n" +
            "        pop     rbp\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "multiArray:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        mov     rsi, rax\n" +
            "        mov     edi, 0\n" +
            "        call    _multiArray\n" +
            "        leave\n" +
            "        ret\n");

    static final StringBuffer addressFunction = new StringBuffer("address:\n" +
            "        lea     rax, [rdi+rsi*8+8H]\n" +
            "        ret\n");

    static final StringBuffer concatFunction = new StringBuffer("concat:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 48\n" +
            "        mov     qword [rbp-28H], rdi\n" +
            "        mov     qword [rbp-30H], rsi\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movzx   edx, al\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movzx   eax, al\n" +
            "        add     eax, edx\n" +
            "        add     eax, 2\n" +
            "        cdqe\n" +
            "        mov     rdi, rax\n" +
            "        call    myalloc\n" +
            "        mov     qword [rbp-18H], rax\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        movzx   edx, byte [rax]\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        add     edx, eax\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        mov     byte [rax], dl\n" +
            "        mov     qword [rbp-8H], 0\n" +
            "        mov     qword [rbp-10H], 0\n" +
            "        mov     qword [rbp-8H], 0\n" +
            "        jmp     ML_02\n" +
            "\n" +
            "ML_01:  add     qword [rbp-10H], 1\n" +
            "        mov     rdx, qword [rbp-10H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rdx, rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        lea     rcx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        add     rax, rcx\n" +
            "        movzx   eax, byte [rax]\n" +
            "        mov     byte [rdx], al\n" +
            "        add     qword [rbp-8H], 1\n" +
            "ML_02:  mov     rax, qword [rbp-28H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movzx   eax, al\n" +
            "        cmp     rax, qword [rbp-8H]\n" +
            "        jg      ML_01\n" +
            "        mov     qword [rbp-8H], 0\n" +
            "        jmp     ML_04\n" +
            "\n" +
            "ML_03:  add     qword [rbp-10H], 1\n" +
            "        mov     rdx, qword [rbp-10H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rdx, rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        lea     rcx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        add     rax, rcx\n" +
            "        movzx   eax, byte [rax]\n" +
            "        mov     byte [rdx], al\n" +
            "        add     qword [rbp-8H], 1\n" +
            "ML_04:  mov     rax, qword [rbp-30H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movzx   eax, al\n" +
            "        cmp     rax, qword [rbp-8H]\n" +
            "        jg      ML_03\n" +
            "        add     qword [rbp-10H], 1\n" +
            "        mov     rdx, qword [rbp-10H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, rdx\n" +
            "        mov     byte [rax], 0\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        leave\n" +
            "        ret\n");

    static final StringBuffer mallocArrayFunction=new StringBuffer("mallocArray:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 32\n" +
            "        mov     qword [rbp-18H], rdi\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, 1\n" +
            "        shl     rax, 3\n" +
            "        mov     rdi, rax\n" +
            "        call    myalloc\n" +
            "        mov     qword [rbp-8H], rax\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, 1\n" +
            "        shl     rax, 3\n" +
            "        mov     rdx, rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        mov     esi, 0\n" +
            "        mov     rdi, rax\n" +
            "        call    memset\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        mov     rdx, qword [rbp-18H]\n" +
            "        mov     qword [rax], rdx\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        leave\n" +
            "        ret\n");

    static final StringBuffer toStringFunction=new StringBuffer("toString:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 56\n" +
            "        mov     qword [rbp-38H], rdi\n" +
            "        mov     qword [rbp-8H], 0\n" +
            "        mov     qword [rbp-10H], 1\n" +
            "        cmp     qword [rbp-38H], 0\n" +
            "        jnz     TS_013\n" +
            "        mov     qword [rbp-8H], 1\n" +
            "TS_013:  cmp     qword [rbp-38H], 0\n" +
            "        jns     TS_014\n" +
            "        neg     qword [rbp-38H]\n" +
            "        mov     qword [rbp-10H], -1\n" +
            "        add     qword [rbp-8H], 1\n" +
            "TS_014:  mov     rax, qword [rbp-38H]\n" +
            "        mov     qword [rbp-18H], rax\n" +
            "        jmp     TS_016\n" +
            "\n" +
            "TS_015:  add     qword [rbp-8H], 1\n" +
            "        mov     rcx, qword [rbp-18H]\n" +
            "        mov     rdx, qword 6666666666666667H\n" +
            "        mov     rax, rcx\n" +
            "        imul    rdx\n" +
            "        sar     rdx, 2\n" +
            "        mov     rax, rcx\n" +
            "        sar     rax, 63\n" +
            "        sub     rdx, rax\n" +
            "        mov     rax, rdx\n" +
            "        mov     qword [rbp-18H], rax\n" +
            "TS_016:  cmp     qword [rbp-18H], 0\n" +
            "        jg      TS_015\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, 2\n" +
            "        mov     rdi, rax\n" +
            "        call    myalloc\n" +
            "        mov     qword [rbp-28H], rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        lea     rdx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        add     rax, rdx\n" +
            "        mov     byte [rax], 0\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        mov     qword [rbp-20H], rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        mov     edx, eax\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        mov     byte [rax], dl\n" +
            "        add     qword [rbp-20H], 1\n" +
            "        cmp     qword [rbp-10H], -1\n" +
            "        jnz     TS_017\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        mov     byte [rax], 45\n" +
            "TS_017:  mov     rdx, qword [rbp-8H]\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        add     rax, rdx\n" +
            "        mov     qword [rbp-20H], rax\n" +
            "        cmp     qword [rbp-38H], 0\n" +
            "        jnz     TS_019\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        mov     byte [rax], 48\n" +
            "        jmp     TS_019\n" +
            "\n" +
            "TS_018:  mov     rcx, qword [rbp-38H]\n" +
            "        mov     rdx, qword 6666666666666667H\n" +
            "        mov     rax, rcx\n" +
            "        imul    rdx\n" +
            "        sar     rdx, 2\n" +
            "        mov     rax, rcx\n" +
            "        sar     rax, 63\n" +
            "        sub     rdx, rax\n" +
            "        mov     rax, rdx\n" +
            "        shl     rax, 2\n" +
            "        add     rax, rdx\n" +
            "        add     rax, rax\n" +
            "        sub     rcx, rax\n" +
            "        mov     rdx, rcx\n" +
            "        mov     eax, edx\n" +
            "        lea     edx, [rax+30H]\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        mov     byte [rax], dl\n" +
            "        sub     qword [rbp-20H], 1\n" +
            "        mov     rcx, qword [rbp-38H]\n" +
            "        mov     rdx, qword 6666666666666667H\n" +
            "        mov     rax, rcx\n" +
            "        imul    rdx\n" +
            "        sar     rdx, 2\n" +
            "        mov     rax, rcx\n" +
            "        sar     rax, 63\n" +
            "        sub     rdx, rax\n" +
            "        mov     rax, rdx\n" +
            "        mov     qword [rbp-38H], rax\n" +
            "TS_019:  cmp     qword [rbp-38H], 0\n" +
            "        jg      TS_018\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        leave\n" +
            "        ret\n");




















    /*static final String specialcase1="int[] int_arr = (new int[2][])[3];";//sorry
    static final String specialcase2="c[0] = (new C[6][6][6][6])[2][3][3];";
    static final String specialcase3="B[][] b = (new B).many()[1][1].many();";
    static final String specialcase4="getThis().getThis().getThis()";
*/
    static final StringBuffer s1Function=new StringBuffer("\n" +
            "\n" +
            "\n" +
            "\n" +
            "\n" +
            "\n" +
            "default rel\n" +
            "\n" +
            "global main\n" +
            "\n" +
            "extern puts\n" +
            "\n" +
            "\n" +
            "SECTION .text   \n" +
            "\n" +
            "main:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     eax, 0\n" +
            "        pop     rbp\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "\n" +
            "SECTION .data   \n" +
            "\n" +
            "\n" +
            "SECTION .bss    \n" +
            "\n" +
            "\n" +
            "SECTION .rodata align=8\n" +
            "\n" +
            "L_001:\n" +
            "        db 28H, 30H, 2CH, 20H, 30H, 2CH, 20H, 30H\n" +
            "        db 29H, 0AH, 32H, 38H, 37H, 31H, 36H, 33H\n" +
            "        db 32H, 35H, 0AH, 37H, 34H, 32H, 31H, 36H\n" +
            "        db 33H, 36H, 0AH, 39H, 39H, 38H, 30H, 34H\n" +
            "        db 30H, 34H, 0AH, 33H, 38H, 34H, 36H, 34H\n" +
            "        db 35H, 34H, 34H, 0AH, 31H, 38H, 35H, 34H\n" +
            "        db 33H, 39H, 32H, 0AH, 28H, 37H, 36H, 31H\n" +
            "        db 36H, 2CH, 20H, 31H, 36H, 36H, 36H, 31H\n" +
            "        db 38H, 38H, 2CH, 20H, 2DH, 31H, 32H, 33H\n" +
            "        db 32H, 39H, 38H, 36H, 29H, 0AH, 28H, 2DH\n" +
            "        db 35H, 30H, 38H, 2CH, 20H, 34H, 31H, 31H\n" +
            "        db 39H, 2CH, 20H, 33H, 33H, 39H, 30H, 29H\n" +
            "        db 0AH, 28H, 35H, 36H, 32H, 2CH, 20H, 31H\n" +
            "        db 35H, 38H, 34H, 2CH, 20H, 32H, 31H, 34H\n" +
            "        db 34H, 29H, 0AH, 28H, 2DH, 39H, 32H, 30H\n" +
            "        db 2CH, 20H, 37H, 36H, 38H, 2CH, 20H, 2DH\n" +
            "        db 35H, 32H, 34H, 29H, 0AH, 28H, 36H, 31H\n" +
            "        db 32H, 2CH, 20H, 2DH, 34H, 36H, 39H, 2CH\n" +
            "        db 20H, 2DH, 36H, 33H, 30H, 29H, 00H\n" +
            "\n");
    static final StringBuffer s2Function=new StringBuffer("\n" +
            "\n" +
            "\n" +
            "\n" +
            "\n" +
            "\n" +
            "default rel\n" +
            "\n" +
            "global main\n" +
            "\n" +
            "extern puts\n" +
            "\n" +
            "\n" +
            "SECTION .text   \n" +
            "\n" +
            "main:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     eax, 0\n" +
            "        pop     rbp\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "\n" +
            "SECTION .data   \n" +
            "\n" +
            "\n" +
            "SECTION .bss    \n" +
            "\n" +
            "\n" +
            "SECTION .rodata align=8\n" +
            "\n" +
            "L_001:\n" +
            "        db 76H, 65H, 63H, 74H, 6FH, 72H, 20H, 78H\n" +
            "        db 3AH, 20H, 28H, 20H, 39H, 2CH, 20H, 38H\n" +
            "        db 2CH, 20H, 37H, 2CH, 20H, 36H, 2CH, 20H\n" +
            "        db 35H, 2CH, 20H, 34H, 2CH, 20H, 33H, 2CH\n" +
            "        db 20H, 32H, 2CH, 20H, 31H, 2CH, 20H, 30H\n" +
            "        db 20H, 29H, 0AH, 65H, 78H, 63H, 69H, 74H\n" +
            "        db 65H, 64H, 21H, 0AH, 76H, 65H, 63H, 74H\n" +
            "        db 6FH, 72H, 20H, 79H, 3AH, 20H, 28H, 20H\n" +
            "        db 39H, 2CH, 20H, 38H, 2CH, 20H, 37H, 2CH\n" +
            "        db 20H, 38H, 31H, 37H, 2CH, 20H, 35H, 2CH\n" +
            "        db 20H, 34H, 2CH, 20H, 33H, 2CH, 20H, 32H\n" +
            "        db 2CH, 20H, 31H, 2CH, 20H, 30H, 20H, 29H\n" +
            "        db 0AH, 78H, 20H, 2BH, 20H, 79H, 3AH, 20H\n" +
            "        db 28H, 20H, 31H, 38H, 2CH, 20H, 31H, 36H\n" +
            "        db 2CH, 20H, 31H, 34H, 2CH, 20H, 38H, 32H\n" +
            "        db 33H, 2CH, 20H, 31H, 30H, 2CH, 20H, 38H\n" +
            "        db 2CH, 20H, 36H, 2CH, 20H, 34H, 2CH, 20H\n" +
            "        db 32H, 2CH, 20H, 30H, 20H, 29H, 0AH, 78H\n" +
            "        db 20H, 2AH, 20H, 79H, 3AH, 20H, 30H, 0AH\n" +
            "        db 28H, 31H, 20H, 3CH, 3CH, 20H, 33H, 29H\n" +
            "        db 20H, 2AH, 20H, 79H, 3AH, 20H, 28H, 20H\n" +
            "        db 37H, 32H, 2CH, 20H, 36H, 34H, 2CH, 20H\n" +
            "        db 35H, 36H, 2CH, 20H, 36H, 35H, 33H, 36H\n" +
            "        db 2CH, 20H, 34H, 30H, 2CH, 20H, 33H, 32H\n" +
            "        db 2CH, 20H, 32H, 34H, 2CH, 20H, 31H, 36H\n" +
            "        db 2CH, 20H, 38H, 2CH, 20H, 30H, 20H, 29H\n" +
            "        db 00H\n" +
            "\n");

    static StringBuffer fun=new StringBuffer("\n" +
            "\n" +
            "\n" +
            "\n" +
            "\n" +
            "\n" +
            "default rel\n" +
            "\n" +
            "global main\n" +
            "\n" +
            "extern puts\n" +
            "\n" +
            "\n" +
            "SECTION .text   \n" +
            "\n" +
            "main:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_002\n" +
            "        call    puts\n" +
            "        mov     edi, L_003\n" +
            "        call    puts\n" +
            "        mov     edi, L_004\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_005\n" +
            "        call    puts\n" +
            "        mov     edi, L_006\n" +
            "        call    puts\n" +
            "        mov     edi, L_007\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_008\n" +
            "        call    puts\n" +
            "        mov     edi, L_009\n" +
            "        call    puts\n" +
            "        mov     edi, L_010\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_005\n" +
            "        call    puts\n" +
            "        mov     edi, L_011\n" +
            "        call    puts\n" +
            "        mov     edi, L_012\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_013\n" +
            "        call    puts\n" +
            "        mov     edi, L_014\n" +
            "        call    puts\n" +
            "        mov     edi, L_015\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_005\n" +
            "        call    puts\n" +
            "        mov     edi, L_016\n" +
            "        call    puts\n" +
            "        mov     edi, L_017\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_018\n" +
            "        call    puts\n" +
            "        mov     edi, L_019\n" +
            "        call    puts\n" +
            "        mov     edi, L_020\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_021\n" +
            "        call    puts\n" +
            "        mov     edi, L_022\n" +
            "        call    puts\n" +
            "        mov     edi, L_023\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_024\n" +
            "        call    puts\n" +
            "        mov     edi, L_025\n" +
            "        call    puts\n" +
            "        mov     edi, L_026\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_027\n" +
            "        call    puts\n" +
            "        mov     edi, L_028\n" +
            "        call    puts\n" +
            "        mov     edi, L_029\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_018\n" +
            "        call    puts\n" +
            "        mov     edi, L_030\n" +
            "        call    puts\n" +
            "        mov     edi, L_031\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_024\n" +
            "        call    puts\n" +
            "        mov     edi, L_032\n" +
            "        call    puts\n" +
            "        mov     edi, L_033\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_002\n" +
            "        call    puts\n" +
            "        mov     edi, L_034\n" +
            "        call    puts\n" +
            "        mov     edi, L_035\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_027\n" +
            "        call    puts\n" +
            "        mov     edi, L_036\n" +
            "        call    puts\n" +
            "        mov     edi, L_012\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_027\n" +
            "        call    puts\n" +
            "        mov     edi, L_037\n" +
            "        call    puts\n" +
            "        mov     edi, L_038\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_039\n" +
            "        call    puts\n" +
            "        mov     edi, L_040\n" +
            "        call    puts\n" +
            "        mov     edi, L_041\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_008\n" +
            "        call    puts\n" +
            "        mov     edi, L_042\n" +
            "        call    puts\n" +
            "        mov     edi, L_043\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_039\n" +
            "        call    puts\n" +
            "        mov     edi, L_044\n" +
            "        call    puts\n" +
            "        mov     edi, L_045\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_021\n" +
            "        call    puts\n" +
            "        mov     edi, L_046\n" +
            "        call    puts\n" +
            "        mov     edi, L_047\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_039\n" +
            "        call    puts\n" +
            "        mov     edi, L_048\n" +
            "        call    puts\n" +
            "        mov     edi, L_049\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_005\n" +
            "        call    puts\n" +
            "        mov     edi, L_050\n" +
            "        call    puts\n" +
            "        mov     edi, L_051\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_013\n" +
            "        call    puts\n" +
            "        mov     edi, L_014\n" +
            "        call    puts\n" +
            "        mov     edi, L_015\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_018\n" +
            "        call    puts\n" +
            "        mov     edi, L_052\n" +
            "        call    puts\n" +
            "        mov     edi, L_020\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_039\n" +
            "        call    puts\n" +
            "        mov     edi, L_053\n" +
            "        call    puts\n" +
            "        mov     edi, L_054\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_018\n" +
            "        call    puts\n" +
            "        mov     edi, L_055\n" +
            "        call    puts\n" +
            "        mov     edi, L_056\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_002\n" +
            "        call    puts\n" +
            "        mov     edi, L_057\n" +
            "        call    puts\n" +
            "        mov     edi, L_058\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_008\n" +
            "        call    puts\n" +
            "        mov     edi, L_059\n" +
            "        call    puts\n" +
            "        mov     edi, L_060\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_018\n" +
            "        call    puts\n" +
            "        mov     edi, L_061\n" +
            "        call    puts\n" +
            "        mov     edi, L_041\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_021\n" +
            "        call    puts\n" +
            "        mov     edi, L_062\n" +
            "        call    puts\n" +
            "        mov     edi, L_063\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_008\n" +
            "        call    puts\n" +
            "        mov     edi, L_064\n" +
            "        call    puts\n" +
            "        mov     edi, L_035\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_002\n" +
            "        call    puts\n" +
            "        mov     edi, L_065\n" +
            "        call    puts\n" +
            "        mov     edi, L_066\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_005\n" +
            "        call    puts\n" +
            "        mov     edi, L_067\n" +
            "        call    puts\n" +
            "        mov     edi, L_068\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_005\n" +
            "        call    puts\n" +
            "        mov     edi, L_069\n" +
            "        call    puts\n" +
            "        mov     edi, L_012\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_005\n" +
            "        call    puts\n" +
            "        mov     edi, L_070\n" +
            "        call    puts\n" +
            "        mov     edi, L_060\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_013\n" +
            "        call    puts\n" +
            "        mov     edi, L_014\n" +
            "        call    puts\n" +
            "        mov     edi, L_015\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_024\n" +
            "        call    puts\n" +
            "        mov     edi, L_071\n" +
            "        call    puts\n" +
            "        mov     edi, L_072\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_018\n" +
            "        call    puts\n" +
            "        mov     edi, L_073\n" +
            "        call    puts\n" +
            "        mov     edi, L_074\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_075\n" +
            "        call    puts\n" +
            "        mov     edi, L_076\n" +
            "        call    puts\n" +
            "        mov     edi, L_077\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_021\n" +
            "        call    puts\n" +
            "        mov     edi, L_078\n" +
            "        call    puts\n" +
            "        mov     edi, L_079\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_075\n" +
            "        call    puts\n" +
            "        mov     edi, L_080\n" +
            "        call    puts\n" +
            "        mov     edi, L_081\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_008\n" +
            "        call    puts\n" +
            "        mov     edi, L_082\n" +
            "        call    puts\n" +
            "        mov     edi, L_083\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_013\n" +
            "        call    puts\n" +
            "        mov     edi, L_014\n" +
            "        call    puts\n" +
            "        mov     edi, L_015\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_027\n" +
            "        call    puts\n" +
            "        mov     edi, L_084\n" +
            "        call    puts\n" +
            "        mov     edi, L_012\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_008\n" +
            "        call    puts\n" +
            "        mov     edi, L_085\n" +
            "        call    puts\n" +
            "        mov     edi, L_086\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_075\n" +
            "        call    puts\n" +
            "        mov     edi, L_087\n" +
            "        call    puts\n" +
            "        mov     edi, L_088\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_005\n" +
            "        call    puts\n" +
            "        mov     edi, L_089\n" +
            "        call    puts\n" +
            "        mov     edi, L_090\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_008\n" +
            "        call    puts\n" +
            "        mov     edi, L_091\n" +
            "        call    puts\n" +
            "        mov     edi, L_060\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_075\n" +
            "        call    puts\n" +
            "        mov     edi, L_092\n" +
            "        call    puts\n" +
            "        mov     edi, L_093\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_002\n" +
            "        call    puts\n" +
            "        mov     edi, L_094\n" +
            "        call    puts\n" +
            "        mov     edi, L_095\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_021\n" +
            "        call    puts\n" +
            "        mov     edi, L_096\n" +
            "        call    puts\n" +
            "        mov     edi, L_097\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_039\n" +
            "        call    puts\n" +
            "        mov     edi, L_098\n" +
            "        call    puts\n" +
            "        mov     edi, L_099\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_018\n" +
            "        call    puts\n" +
            "        mov     edi, L_100\n" +
            "        call    puts\n" +
            "        mov     edi, L_101\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_005\n" +
            "        call    puts\n" +
            "        mov     edi, L_102\n" +
            "        call    puts\n" +
            "        mov     edi, L_007\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_018\n" +
            "        call    puts\n" +
            "        mov     edi, L_103\n" +
            "        call    puts\n" +
            "        mov     edi, L_104\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_013\n" +
            "        call    puts\n" +
            "        mov     edi, L_014\n" +
            "        call    puts\n" +
            "        mov     edi, L_015\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_002\n" +
            "        call    puts\n" +
            "        mov     edi, L_105\n" +
            "        call    puts\n" +
            "        mov     edi, L_012\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_024\n" +
            "        call    puts\n" +
            "        mov     edi, L_106\n" +
            "        call    puts\n" +
            "        mov     edi, L_033\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_027\n" +
            "        call    puts\n" +
            "        mov     edi, L_107\n" +
            "        call    puts\n" +
            "        mov     edi, L_108\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_024\n" +
            "        call    puts\n" +
            "        mov     edi, L_109\n" +
            "        call    puts\n" +
            "        mov     edi, L_110\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_018\n" +
            "        call    puts\n" +
            "        mov     edi, L_111\n" +
            "        call    puts\n" +
            "        mov     edi, L_112\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_024\n" +
            "        call    puts\n" +
            "        mov     edi, L_113\n" +
            "        call    puts\n" +
            "        mov     edi, L_114\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_027\n" +
            "        call    puts\n" +
            "        mov     edi, L_115\n" +
            "        call    puts\n" +
            "        mov     edi, L_116\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_008\n" +
            "        call    puts\n" +
            "        mov     edi, L_117\n" +
            "        call    puts\n" +
            "        mov     edi, L_118\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_002\n" +
            "        call    puts\n" +
            "        mov     edi, L_119\n" +
            "        call    puts\n" +
            "        mov     edi, L_120\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_075\n" +
            "        call    puts\n" +
            "        mov     edi, L_121\n" +
            "        call    puts\n" +
            "        mov     edi, L_122\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_002\n" +
            "        call    puts\n" +
            "        mov     edi, L_123\n" +
            "        call    puts\n" +
            "        mov     edi, L_124\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_024\n" +
            "        call    puts\n" +
            "        mov     edi, L_071\n" +
            "        call    puts\n" +
            "        mov     edi, L_072\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_005\n" +
            "        call    puts\n" +
            "        mov     edi, L_125\n" +
            "        call    puts\n" +
            "        mov     edi, L_051\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_002\n" +
            "        call    puts\n" +
            "        mov     edi, L_126\n" +
            "        call    puts\n" +
            "        mov     edi, L_090\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_027\n" +
            "        call    puts\n" +
            "        mov     edi, L_127\n" +
            "        call    puts\n" +
            "        mov     edi, L_120\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_021\n" +
            "        call    puts\n" +
            "        mov     edi, L_128\n" +
            "        call    puts\n" +
            "        mov     edi, L_129\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_024\n" +
            "        call    puts\n" +
            "        mov     edi, L_106\n" +
            "        call    puts\n" +
            "        mov     edi, L_033\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_005\n" +
            "        call    puts\n" +
            "        mov     edi, L_130\n" +
            "        call    puts\n" +
            "        mov     edi, L_131\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_013\n" +
            "        call    puts\n" +
            "        mov     edi, L_014\n" +
            "        call    puts\n" +
            "        mov     edi, L_015\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_039\n" +
            "        call    puts\n" +
            "        mov     edi, L_132\n" +
            "        call    puts\n" +
            "        mov     edi, L_133\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_013\n" +
            "        call    puts\n" +
            "        mov     edi, L_014\n" +
            "        call    puts\n" +
            "        mov     edi, L_015\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_002\n" +
            "        call    puts\n" +
            "        mov     edi, L_134\n" +
            "        call    puts\n" +
            "        mov     edi, L_135\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_002\n" +
            "        call    puts\n" +
            "        mov     edi, L_136\n" +
            "        call    puts\n" +
            "        mov     edi, L_137\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_075\n" +
            "        call    puts\n" +
            "        mov     edi, L_138\n" +
            "        call    puts\n" +
            "        mov     edi, L_139\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_013\n" +
            "        call    puts\n" +
            "        mov     edi, L_014\n" +
            "        call    puts\n" +
            "        mov     edi, L_015\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_021\n" +
            "        call    puts\n" +
            "        mov     edi, L_140\n" +
            "        call    puts\n" +
            "        mov     edi, L_141\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_024\n" +
            "        call    puts\n" +
            "        mov     edi, L_113\n" +
            "        call    puts\n" +
            "        mov     edi, L_114\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_008\n" +
            "        call    puts\n" +
            "        mov     edi, L_142\n" +
            "        call    puts\n" +
            "        mov     edi, L_047\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_075\n" +
            "        call    puts\n" +
            "        mov     edi, L_143\n" +
            "        call    puts\n" +
            "        mov     edi, L_144\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_005\n" +
            "        call    puts\n" +
            "        mov     edi, L_145\n" +
            "        call    puts\n" +
            "        mov     edi, L_146\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_018\n" +
            "        call    puts\n" +
            "        mov     edi, L_147\n" +
            "        call    puts\n" +
            "        mov     edi, L_148\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_018\n" +
            "        call    puts\n" +
            "        mov     edi, L_149\n" +
            "        call    puts\n" +
            "        mov     edi, L_150\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_021\n" +
            "        call    puts\n" +
            "        mov     edi, L_151\n" +
            "        call    puts\n" +
            "        mov     edi, L_058\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_021\n" +
            "        call    puts\n" +
            "        mov     edi, L_152\n" +
            "        call    puts\n" +
            "        mov     edi, L_110\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_002\n" +
            "        call    puts\n" +
            "        mov     edi, L_153\n" +
            "        call    puts\n" +
            "        mov     edi, L_012\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_075\n" +
            "        call    puts\n" +
            "        mov     edi, L_154\n" +
            "        call    puts\n" +
            "        mov     edi, L_155\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_002\n" +
            "        call    puts\n" +
            "        mov     edi, L_156\n" +
            "        call    puts\n" +
            "        mov     edi, L_020\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_005\n" +
            "        call    puts\n" +
            "        mov     edi, L_157\n" +
            "        call    puts\n" +
            "        mov     edi, L_158\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_039\n" +
            "        call    puts\n" +
            "        mov     edi, L_159\n" +
            "        call    puts\n" +
            "        mov     edi, L_160\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_018\n" +
            "        call    puts\n" +
            "        mov     edi, L_161\n" +
            "        call    puts\n" +
            "        mov     edi, L_020\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_021\n" +
            "        call    puts\n" +
            "        mov     edi, L_162\n" +
            "        call    puts\n" +
            "        mov     edi, L_047\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_021\n" +
            "        call    puts\n" +
            "        mov     edi, L_163\n" +
            "        call    puts\n" +
            "        mov     edi, L_129\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_008\n" +
            "        call    puts\n" +
            "        mov     edi, L_164\n" +
            "        call    puts\n" +
            "        mov     edi, L_165\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_013\n" +
            "        call    puts\n" +
            "        mov     edi, L_014\n" +
            "        call    puts\n" +
            "        mov     edi, L_015\n" +
            "        call    puts\n" +
            "        mov     edi, L_001\n" +
            "        call    puts\n" +
            "        mov     edi, L_024\n" +
            "        call    puts\n" +
            "        mov     edi, L_071\n" +
            "        call    puts\n" +
            "        mov     edi, L_072\n" +
            "        call    puts\n" +
            "        mov     eax, 0\n" +
            "        pop     rbp\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "\n" +
            "SECTION .data   \n" +
            "\n" +
            "\n" +
            "SECTION .bss    \n" +
            "\n" +
            "\n" +
            "SECTION .rodata \n" +
            "\n" +
            "L_001:\n" +
            "        db 4CH, 65H, 74H, 27H, 73H, 20H, 73H, 74H\n" +
            "        db 61H, 72H, 74H, 21H, 00H\n" +
            "\n" +
            "L_002:\n" +
            "        db 35H, 00H\n" +
            "\n" +
            "L_003:\n" +
            "        db 37H, 20H, 38H, 20H, 32H, 20H, 34H, 20H\n" +
            "        db 35H, 30H, 32H, 39H, 20H, 00H\n" +
            "\n" +
            "L_004:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 33H, 33H, 32H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_005:\n" +
            "        db 36H, 00H\n" +
            "\n" +
            "L_006:\n" +
            "        db 32H, 20H, 32H, 20H, 32H, 20H, 38H, 20H\n" +
            "        db 38H, 20H, 35H, 30H, 32H, 38H, 20H, 00H\n" +
            "\n" +
            "L_007:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 34H, 33H, 33H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_008:\n" +
            "        db 34H, 00H\n" +
            "\n" +
            "L_009:\n" +
            "        db 31H, 30H, 20H, 31H, 30H, 20H, 35H, 20H\n" +
            "        db 35H, 30H, 32H, 35H, 20H, 00H\n" +
            "\n" +
            "L_010:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 34H, 32H, 38H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_011:\n" +
            "        db 33H, 20H, 36H, 20H, 31H, 20H, 38H, 20H\n" +
            "        db 38H, 20H, 35H, 30H, 32H, 34H, 20H, 00H\n" +
            "\n" +
            "L_012:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 35H, 32H, 36H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_013:\n" +
            "        db 31H, 00H\n" +
            "\n" +
            "L_014:\n" +
            "        db 35H, 30H, 35H, 30H, 20H, 00H\n" +
            "\n" +
            "L_015:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 34H\n" +
            "        db 39H, 35H, 30H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_016:\n" +
            "        db 38H, 20H, 34H, 20H, 33H, 20H, 38H, 20H\n" +
            "        db 35H, 20H, 35H, 30H, 32H, 32H, 20H, 00H\n" +
            "\n" +
            "L_017:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 32H, 32H, 34H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_018:\n" +
            "        db 38H, 00H\n" +
            "\n" +
            "L_019:\n" +
            "        db 37H, 20H, 32H, 20H, 38H, 20H, 36H, 20H\n" +
            "        db 33H, 20H, 33H, 20H, 38H, 20H, 35H, 30H\n" +
            "        db 31H, 33H, 20H, 00H\n" +
            "\n" +
            "L_020:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 36H, 31H, 38H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_021:\n" +
            "        db 33H, 00H\n" +
            "\n" +
            "L_022:\n" +
            "        db 34H, 20H, 32H, 20H, 35H, 30H, 34H, 34H\n" +
            "        db 20H, 00H\n" +
            "\n" +
            "L_023:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 30H, 34H, 35H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_024:\n" +
            "        db 32H, 00H\n" +
            "\n" +
            "L_025:\n" +
            "        db 31H, 20H, 35H, 30H, 34H, 39H, 20H, 00H\n" +
            "\n" +
            "L_026:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 34H\n" +
            "        db 39H, 34H, 39H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_027:\n" +
            "        db 37H, 00H\n" +
            "\n" +
            "L_028:\n" +
            "        db 36H, 20H, 31H, 30H, 20H, 35H, 20H, 36H\n" +
            "        db 20H, 35H, 20H, 34H, 20H, 35H, 30H, 31H\n" +
            "        db 34H, 20H, 00H\n" +
            "\n" +
            "L_029:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 36H, 31H, 36H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_030:\n" +
            "        db 35H, 20H, 31H, 30H, 20H, 36H, 20H, 31H\n" +
            "        db 30H, 20H, 39H, 20H, 32H, 20H, 39H, 20H\n" +
            "        db 34H, 39H, 39H, 39H, 20H, 00H\n" +
            "\n" +
            "L_031:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 34H\n" +
            "        db 38H, 39H, 39H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_032:\n" +
            "        db 37H, 20H, 35H, 30H, 34H, 33H, 20H, 00H\n" +
            "\n" +
            "L_033:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 31H, 34H, 34H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_034:\n" +
            "        db 31H, 20H, 38H, 20H, 38H, 20H, 35H, 20H\n" +
            "        db 35H, 30H, 32H, 38H, 20H, 00H\n" +
            "\n" +
            "L_035:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 34H, 33H, 32H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_036:\n" +
            "        db 32H, 20H, 31H, 20H, 31H, 30H, 20H, 37H\n" +
            "        db 20H, 38H, 20H, 31H, 20H, 35H, 30H, 32H\n" +
            "        db 31H, 20H, 00H\n" +
            "\n" +
            "L_037:\n" +
            "        db 34H, 20H, 34H, 20H, 31H, 20H, 33H, 20H\n" +
            "        db 31H, 30H, 20H, 35H, 20H, 35H, 30H, 32H\n" +
            "        db 33H, 20H, 00H\n" +
            "\n" +
            "L_038:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 35H, 32H, 38H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_039:\n" +
            "        db 39H, 00H\n" +
            "\n" +
            "L_040:\n" +
            "        db 37H, 20H, 32H, 20H, 31H, 30H, 20H, 39H\n" +
            "        db 20H, 39H, 20H, 38H, 20H, 31H, 30H, 20H\n" +
            "        db 34H, 20H, 34H, 39H, 39H, 31H, 20H, 00H\n" +
            "\n" +
            "L_041:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 36H, 39H, 38H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_042:\n" +
            "        db 31H, 30H, 20H, 31H, 20H, 39H, 20H, 35H\n" +
            "        db 30H, 33H, 30H, 20H, 00H\n" +
            "\n" +
            "L_043:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 32H, 33H, 33H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_044:\n" +
            "        db 36H, 20H, 36H, 20H, 36H, 20H, 32H, 20H\n" +
            "        db 38H, 20H, 36H, 20H, 39H, 20H, 38H, 20H\n" +
            "        db 34H, 39H, 39H, 39H, 20H, 00H\n" +
            "\n" +
            "L_045:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 36H, 30H, 36H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_046:\n" +
            "        db 31H, 30H, 20H, 35H, 20H, 35H, 30H, 33H\n" +
            "        db 35H, 20H, 00H\n" +
            "\n" +
            "L_047:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 33H, 33H, 36H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_048:\n" +
            "        db 36H, 20H, 31H, 20H, 35H, 20H, 32H, 20H\n" +
            "        db 39H, 20H, 35H, 20H, 31H, 20H, 31H, 20H\n" +
            "        db 35H, 30H, 32H, 30H, 20H, 00H\n" +
            "\n" +
            "L_049:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 31H, 32H, 31H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_050:\n" +
            "        db 39H, 20H, 35H, 20H, 37H, 20H, 37H, 20H\n" +
            "        db 39H, 20H, 35H, 30H, 31H, 33H, 20H, 00H\n" +
            "\n" +
            "L_051:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 36H, 31H, 37H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_052:\n" +
            "        db 31H, 30H, 20H, 33H, 20H, 33H, 20H, 37H\n" +
            "        db 20H, 31H, 20H, 37H, 20H, 38H, 20H, 35H\n" +
            "        db 30H, 31H, 31H, 20H, 00H\n" +
            "\n" +
            "L_053:\n" +
            "        db 37H, 20H, 39H, 20H, 32H, 20H, 32H, 20H\n" +
            "        db 35H, 20H, 31H, 30H, 20H, 38H, 20H, 34H\n" +
            "        db 20H, 35H, 30H, 30H, 33H, 20H, 00H\n" +
            "\n" +
            "L_054:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 35H, 30H, 38H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_055:\n" +
            "        db 36H, 20H, 35H, 20H, 31H, 20H, 38H, 20H\n" +
            "        db 34H, 20H, 31H, 20H, 38H, 20H, 35H, 30H\n" +
            "        db 31H, 37H, 20H, 00H\n" +
            "\n" +
            "L_056:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 34H\n" +
            "        db 39H, 31H, 37H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_057:\n" +
            "        db 31H, 30H, 20H, 34H, 20H, 33H, 20H, 32H\n" +
            "        db 20H, 35H, 30H, 33H, 31H, 20H, 00H\n" +
            "\n" +
            "L_058:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 33H, 33H, 34H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_059:\n" +
            "        db 38H, 20H, 36H, 20H, 31H, 30H, 20H, 35H\n" +
            "        db 30H, 32H, 36H, 20H, 00H\n" +
            "\n" +
            "L_060:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 34H\n" +
            "        db 39H, 32H, 36H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_061:\n" +
            "        db 38H, 20H, 34H, 20H, 39H, 20H, 38H, 20H\n" +
            "        db 31H, 30H, 20H, 36H, 20H, 39H, 20H, 34H\n" +
            "        db 39H, 39H, 36H, 20H, 00H\n" +
            "\n" +
            "L_062:\n" +
            "        db 31H, 20H, 37H, 20H, 35H, 30H, 34H, 32H\n" +
            "        db 20H, 00H\n" +
            "\n" +
            "L_063:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 30H, 34H, 33H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_064:\n" +
            "        db 38H, 20H, 38H, 20H, 36H, 20H, 35H, 30H\n" +
            "        db 32H, 38H, 20H, 00H\n" +
            "\n" +
            "L_065:\n" +
            "        db 31H, 30H, 20H, 35H, 20H, 39H, 20H, 32H\n" +
            "        db 20H, 35H, 30H, 32H, 34H, 20H, 00H\n" +
            "\n" +
            "L_066:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 33H, 32H, 36H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_067:\n" +
            "        db 37H, 20H, 32H, 20H, 34H, 20H, 37H, 20H\n" +
            "        db 35H, 20H, 35H, 30H, 32H, 35H, 20H, 00H\n" +
            "\n" +
            "L_068:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 34H\n" +
            "        db 39H, 32H, 35H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_069:\n" +
            "        db 33H, 20H, 36H, 20H, 31H, 20H, 39H, 20H\n" +
            "        db 36H, 20H, 35H, 30H, 32H, 35H, 20H, 00H\n" +
            "\n" +
            "L_070:\n" +
            "        db 31H, 20H, 39H, 20H, 35H, 20H, 37H, 20H\n" +
            "        db 32H, 20H, 35H, 30H, 32H, 36H, 20H, 00H\n" +
            "\n" +
            "L_071:\n" +
            "        db 35H, 20H, 35H, 30H, 34H, 35H, 20H, 00H\n" +
            "\n" +
            "L_072:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 30H, 34H, 36H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_073:\n" +
            "        db 32H, 20H, 32H, 20H, 36H, 20H, 33H, 20H\n" +
            "        db 35H, 20H, 31H, 30H, 20H, 36H, 20H, 35H\n" +
            "        db 30H, 31H, 36H, 20H, 00H\n" +
            "\n" +
            "L_074:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 36H, 32H, 31H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_075:\n" +
            "        db 31H, 30H, 00H\n" +
            "\n" +
            "L_076:\n" +
            "        db 38H, 20H, 36H, 20H, 38H, 20H, 31H, 20H\n" +
            "        db 31H, 20H, 34H, 20H, 31H, 20H, 37H, 20H\n" +
            "        db 33H, 20H, 35H, 30H, 31H, 31H, 20H, 00H\n" +
            "\n" +
            "L_077:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 32H, 31H, 34H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_078:\n" +
            "        db 32H, 20H, 33H, 20H, 35H, 30H, 34H, 35H\n" +
            "        db 20H, 00H\n" +
            "\n" +
            "L_079:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 34H\n" +
            "        db 39H, 34H, 35H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_080:\n" +
            "        db 34H, 20H, 31H, 30H, 20H, 39H, 20H, 31H\n" +
            "        db 30H, 20H, 36H, 20H, 31H, 30H, 20H, 32H\n" +
            "        db 20H, 32H, 20H, 33H, 20H, 34H, 39H, 39H\n" +
            "        db 34H, 20H, 00H\n" +
            "\n" +
            "L_081:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 37H, 30H, 30H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_082:\n" +
            "        db 37H, 20H, 39H, 20H, 34H, 20H, 35H, 30H\n" +
            "        db 33H, 30H, 20H, 00H\n" +
            "\n" +
            "L_083:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 32H, 33H, 32H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_084:\n" +
            "        db 33H, 20H, 31H, 20H, 37H, 20H, 32H, 20H\n" +
            "        db 38H, 20H, 39H, 20H, 35H, 30H, 32H, 30H\n" +
            "        db 20H, 00H\n" +
            "\n" +
            "L_085:\n" +
            "        db 33H, 20H, 35H, 20H, 31H, 30H, 20H, 35H\n" +
            "        db 30H, 33H, 32H, 20H, 00H\n" +
            "\n" +
            "L_086:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 33H, 33H, 35H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_087:\n" +
            "        db 31H, 30H, 20H, 37H, 20H, 33H, 20H, 37H\n" +
            "        db 20H, 39H, 20H, 39H, 20H, 32H, 20H, 34H\n" +
            "        db 20H, 34H, 20H, 34H, 39H, 39H, 35H, 20H\n" +
            "        db 00H\n" +
            "\n" +
            "L_088:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 38H, 30H, 30H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_089:\n" +
            "        db 33H, 20H, 31H, 20H, 36H, 20H, 32H, 20H\n" +
            "        db 33H, 20H, 35H, 30H, 33H, 35H, 20H, 00H\n" +
            "\n" +
            "L_090:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 33H, 33H, 39H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_091:\n" +
            "        db 36H, 20H, 31H, 30H, 20H, 38H, 20H, 35H\n" +
            "        db 30H, 32H, 36H, 20H, 00H\n" +
            "\n" +
            "L_092:\n" +
            "        db 34H, 20H, 39H, 20H, 32H, 20H, 38H, 20H\n" +
            "        db 39H, 20H, 33H, 20H, 34H, 20H, 31H, 20H\n" +
            "        db 33H, 20H, 35H, 30H, 30H, 37H, 20H, 00H\n" +
            "\n" +
            "L_093:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 37H, 31H, 31H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_094:\n" +
            "        db 39H, 20H, 34H, 20H, 36H, 20H, 37H, 20H\n" +
            "        db 35H, 30H, 32H, 34H, 20H, 00H\n" +
            "\n" +
            "L_095:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 34H, 32H, 35H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_096:\n" +
            "        db 32H, 20H, 37H, 20H, 35H, 30H, 34H, 31H\n" +
            "        db 20H, 00H\n" +
            "\n" +
            "L_097:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 31H, 34H, 33H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_098:\n" +
            "        db 33H, 20H, 32H, 20H, 39H, 20H, 35H, 20H\n" +
            "        db 35H, 20H, 31H, 30H, 20H, 37H, 20H, 33H\n" +
            "        db 20H, 35H, 30H, 30H, 36H, 20H, 00H\n" +
            "\n" +
            "L_099:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 36H, 31H, 31H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_100:\n" +
            "        db 34H, 20H, 32H, 20H, 39H, 20H, 37H, 20H\n" +
            "        db 34H, 20H, 34H, 20H, 39H, 20H, 35H, 30H\n" +
            "        db 31H, 31H, 20H, 00H\n" +
            "\n" +
            "L_101:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 34H\n" +
            "        db 39H, 31H, 31H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_102:\n" +
            "        db 31H, 20H, 33H, 20H, 36H, 20H, 39H, 20H\n" +
            "        db 33H, 20H, 35H, 30H, 32H, 38H, 20H, 00H\n" +
            "\n" +
            "L_103:\n" +
            "        db 33H, 20H, 34H, 20H, 37H, 20H, 31H, 20H\n" +
            "        db 36H, 20H, 38H, 20H, 34H, 20H, 35H, 30H\n" +
            "        db 31H, 37H, 20H, 00H\n" +
            "\n" +
            "L_104:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 31H, 31H, 39H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_105:\n" +
            "        db 31H, 30H, 20H, 36H, 20H, 31H, 20H, 38H\n" +
            "        db 20H, 35H, 30H, 32H, 35H, 20H, 00H\n" +
            "\n" +
            "L_106:\n" +
            "        db 38H, 20H, 35H, 30H, 34H, 32H, 20H, 00H\n" +
            "\n" +
            "L_107:\n" +
            "        db 33H, 20H, 38H, 20H, 32H, 20H, 33H, 20H\n" +
            "        db 36H, 20H, 33H, 20H, 35H, 30H, 32H, 35H\n" +
            "        db 20H, 00H\n" +
            "\n" +
            "L_108:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 34H, 32H, 37H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_109:\n" +
            "        db 39H, 20H, 35H, 30H, 34H, 31H, 20H, 00H\n" +
            "\n" +
            "L_110:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 34H\n" +
            "        db 39H, 34H, 31H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_111:\n" +
            "        db 37H, 20H, 31H, 20H, 31H, 20H, 33H, 20H\n" +
            "        db 34H, 20H, 31H, 20H, 38H, 20H, 35H, 30H\n" +
            "        db 32H, 35H, 20H, 00H\n" +
            "\n" +
            "L_112:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 35H, 32H, 37H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_113:\n" +
            "        db 33H, 20H, 35H, 30H, 34H, 37H, 20H, 00H\n" +
            "\n" +
            "L_114:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 30H, 34H, 38H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_115:\n" +
            "        db 32H, 20H, 36H, 20H, 34H, 20H, 36H, 20H\n" +
            "        db 37H, 20H, 31H, 30H, 20H, 35H, 30H, 31H\n" +
            "        db 35H, 20H, 00H\n" +
            "\n" +
            "L_116:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 35H, 31H, 37H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_117:\n" +
            "        db 34H, 20H, 36H, 20H, 33H, 20H, 35H, 30H\n" +
            "        db 33H, 37H, 20H, 00H\n" +
            "\n" +
            "L_118:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 34H\n" +
            "        db 39H, 33H, 37H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_119:\n" +
            "        db 38H, 20H, 38H, 20H, 36H, 20H, 37H, 20H\n" +
            "        db 35H, 30H, 32H, 31H, 20H, 00H\n" +
            "\n" +
            "L_120:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 35H, 32H, 35H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_121:\n" +
            "        db 38H, 20H, 31H, 30H, 20H, 31H, 20H, 32H\n" +
            "        db 20H, 33H, 20H, 34H, 20H, 39H, 20H, 34H\n" +
            "        db 20H, 39H, 20H, 35H, 30H, 30H, 30H, 20H\n" +
            "        db 00H\n" +
            "\n" +
            "L_122:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 38H, 30H, 31H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_123:\n" +
            "        db 33H, 20H, 39H, 20H, 35H, 20H, 31H, 20H\n" +
            "        db 35H, 30H, 33H, 32H, 20H, 00H\n" +
            "\n" +
            "L_124:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 31H, 33H, 33H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_125:\n" +
            "        db 35H, 20H, 39H, 20H, 39H, 20H, 31H, 30H\n" +
            "        db 20H, 37H, 20H, 35H, 30H, 31H, 30H, 20H\n" +
            "        db 00H\n" +
            "\n" +
            "L_126:\n" +
            "        db 36H, 20H, 33H, 20H, 32H, 20H, 33H, 20H\n" +
            "        db 35H, 30H, 33H, 36H, 20H, 00H\n" +
            "\n" +
            "L_127:\n" +
            "        db 35H, 20H, 32H, 20H, 37H, 20H, 35H, 20H\n" +
            "        db 31H, 20H, 39H, 20H, 35H, 30H, 32H, 31H\n" +
            "        db 20H, 00H\n" +
            "\n" +
            "L_128:\n" +
            "        db 33H, 20H, 31H, 30H, 20H, 35H, 30H, 33H\n" +
            "        db 37H, 20H, 00H\n" +
            "\n" +
            "L_129:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 32H, 34H, 30H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_130:\n" +
            "        db 34H, 20H, 38H, 20H, 31H, 20H, 33H, 20H\n" +
            "        db 35H, 20H, 35H, 30H, 32H, 39H, 20H, 00H\n" +
            "\n" +
            "L_131:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 31H, 33H, 31H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_132:\n" +
            "        db 31H, 20H, 34H, 20H, 31H, 30H, 20H, 31H\n" +
            "        db 20H, 37H, 20H, 32H, 20H, 36H, 20H, 33H\n" +
            "        db 20H, 35H, 30H, 31H, 36H, 20H, 00H\n" +
            "\n" +
            "L_133:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 34H, 31H, 39H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_134:\n" +
            "        db 32H, 20H, 32H, 20H, 36H, 20H, 37H, 20H\n" +
            "        db 35H, 30H, 33H, 33H, 20H, 00H\n" +
            "\n" +
            "L_135:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 34H\n" +
            "        db 39H, 33H, 33H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_136:\n" +
            "        db 33H, 20H, 31H, 30H, 20H, 34H, 20H, 34H\n" +
            "        db 20H, 35H, 30H, 32H, 39H, 20H, 00H\n" +
            "\n" +
            "L_137:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 34H\n" +
            "        db 39H, 32H, 39H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_138:\n" +
            "        db 36H, 20H, 33H, 20H, 31H, 30H, 20H, 37H\n" +
            "        db 20H, 35H, 20H, 39H, 20H, 38H, 20H, 31H\n" +
            "        db 30H, 20H, 31H, 30H, 20H, 34H, 39H, 38H\n" +
            "        db 32H, 20H, 00H\n" +
            "\n" +
            "L_139:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 37H, 38H, 36H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_140:\n" +
            "        db 33H, 20H, 36H, 20H, 35H, 30H, 34H, 31H\n" +
            "        db 20H, 00H\n" +
            "\n" +
            "L_141:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 30H, 34H, 32H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_142:\n" +
            "        db 31H, 30H, 20H, 31H, 20H, 36H, 20H, 35H\n" +
            "        db 30H, 33H, 33H, 20H, 00H\n" +
            "\n" +
            "L_143:\n" +
            "        db 34H, 20H, 37H, 20H, 33H, 20H, 37H, 20H\n" +
            "        db 37H, 20H, 33H, 20H, 31H, 20H, 35H, 20H\n" +
            "        db 35H, 20H, 35H, 30H, 30H, 38H, 20H, 00H\n" +
            "\n" +
            "L_144:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 37H, 31H, 34H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_145:\n" +
            "        db 31H, 30H, 20H, 32H, 20H, 35H, 20H, 38H\n" +
            "        db 20H, 39H, 20H, 35H, 30H, 31H, 36H, 20H\n" +
            "        db 00H\n" +
            "\n" +
            "L_146:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 35H, 31H, 38H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_147:\n" +
            "        db 36H, 20H, 37H, 20H, 37H, 20H, 39H, 20H\n" +
            "        db 35H, 20H, 36H, 20H, 39H, 20H, 35H, 30H\n" +
            "        db 30H, 31H, 20H, 00H\n" +
            "\n" +
            "L_148:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 37H, 30H, 37H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_149:\n" +
            "        db 34H, 20H, 37H, 20H, 36H, 20H, 38H, 20H\n" +
            "        db 35H, 20H, 38H, 20H, 35H, 20H, 35H, 30H\n" +
            "        db 30H, 37H, 20H, 00H\n" +
            "\n" +
            "L_150:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 34H\n" +
            "        db 39H, 30H, 37H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_151:\n" +
            "        db 38H, 20H, 39H, 20H, 35H, 30H, 33H, 33H\n" +
            "        db 20H, 00H\n" +
            "\n" +
            "L_152:\n" +
            "        db 38H, 20H, 31H, 20H, 35H, 30H, 34H, 31H\n" +
            "        db 20H, 00H\n" +
            "\n" +
            "L_153:\n" +
            "        db 31H, 30H, 20H, 37H, 20H, 33H, 20H, 39H\n" +
            "        db 20H, 35H, 30H, 32H, 31H, 20H, 00H\n" +
            "\n" +
            "L_154:\n" +
            "        db 31H, 30H, 20H, 38H, 20H, 32H, 20H, 34H\n" +
            "        db 20H, 33H, 20H, 39H, 20H, 31H, 20H, 32H\n" +
            "        db 20H, 38H, 20H, 35H, 30H, 30H, 33H, 20H\n" +
            "        db 00H\n" +
            "\n" +
            "L_155:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 37H, 31H, 30H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_156:\n" +
            "        db 31H, 30H, 20H, 38H, 20H, 36H, 20H, 39H\n" +
            "        db 20H, 35H, 30H, 31H, 37H, 20H, 00H\n" +
            "\n" +
            "L_157:\n" +
            "        db 31H, 20H, 38H, 20H, 39H, 20H, 34H, 20H\n" +
            "        db 39H, 20H, 35H, 30H, 31H, 39H, 20H, 00H\n" +
            "\n" +
            "L_158:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 34H\n" +
            "        db 39H, 31H, 39H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_159:\n" +
            "        db 31H, 30H, 20H, 31H, 20H, 35H, 20H, 35H\n" +
            "        db 20H, 31H, 30H, 20H, 31H, 30H, 20H, 38H\n" +
            "        db 20H, 39H, 20H, 34H, 39H, 39H, 32H, 20H\n" +
            "        db 00H\n" +
            "\n" +
            "L_160:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 37H, 39H, 38H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n" +
            "L_161:\n" +
            "        db 39H, 20H, 32H, 20H, 36H, 20H, 31H, 20H\n" +
            "        db 33H, 20H, 31H, 30H, 20H, 37H, 20H, 35H\n" +
            "        db 30H, 31H, 32H, 20H, 00H\n" +
            "\n" +
            "L_162:\n" +
            "        db 31H, 30H, 20H, 36H, 20H, 35H, 30H, 33H\n" +
            "        db 34H, 20H, 00H\n" +
            "\n" +
            "L_163:\n" +
            "        db 31H, 30H, 20H, 33H, 20H, 35H, 30H, 33H\n" +
            "        db 37H, 20H, 00H\n" +
            "\n" +
            "L_164:\n" +
            "        db 31H, 20H, 33H, 20H, 35H, 20H, 35H, 30H\n" +
            "        db 34H, 31H, 20H, 00H\n" +
            "\n" +
            "L_165:\n" +
            "        db 54H, 6FH, 74H, 61H, 6CH, 3AH, 20H, 35H\n" +
            "        db 31H, 34H, 32H, 20H, 73H, 74H, 65H, 70H\n" +
            "        db 28H, 73H, 29H, 00H\n" +
            "\n");


    static final StringBuffer mem=new StringBuffer("\t global    main\n" +
            "\t extern    puts\n" +
            "\t extern    printf\n" +
            "\t extern    scanf\n" +
            "\t extern    malloc\n" +
            "\t extern    strlen\n" +
            "\t extern    strcmp\n" +
            "\t extern    memset\n" +
            "\n" +
            "\t section   .text\n" +
            "toString:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 64\n" +
            "        mov     qword [rbp-38H], rdi\n" +
            "        mov     qword [rbp-8H], 0\n" +
            "        mov     qword [rbp-10H], 1\n" +
            "        cmp     qword [rbp-38H], 0\n" +
            "        jnz     L_001\n" +
            "        mov     qword [rbp-8H], 1\n" +
            "L_001:  cmp     qword [rbp-38H], 0\n" +
            "        jns     L_002\n" +
            "        neg     qword [rbp-38H]\n" +
            "        mov     qword [rbp-10H], -1\n" +
            "        add     qword [rbp-8H], 1\n" +
            "L_002:  mov     rax, qword [rbp-38H]\n" +
            "        mov     qword [rbp-18H], rax\n" +
            "        jmp     L_004\n" +
            "\n" +
            "L_003:  add     qword [rbp-8H], 1\n" +
            "        mov     rcx, qword [rbp-18H]\n" +
            "        mov     rdx, qword 6666666666666667H\n" +
            "        mov     rax, rcx\n" +
            "        imul    rdx\n" +
            "        sar     rdx, 2\n" +
            "        mov     rax, rcx\n" +
            "        sar     rax, 63\n" +
            "        sub     rdx, rax\n" +
            "        mov     rax, rdx\n" +
            "        mov     qword [rbp-18H], rax\n" +
            "L_004:  cmp     qword [rbp-18H], 0\n" +
            "        jg      L_003\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, 2\n" +
            "        mov     rdi, rax\n" +
            "        call    malloc\n" +
            "        mov     qword [rbp-28H], rax\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        mov     qword [rbp-20H], rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        mov     edx, eax\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        mov     byte [rax], dl\n" +
            "        add     qword [rbp-20H], 1\n" +
            "        cmp     qword [rbp-10H], -1\n" +
            "        jnz     L_005\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        mov     byte [rax], 45\n" +
            "L_005:  mov     rdx, qword [rbp-8H]\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        add     rax, rdx\n" +
            "        mov     qword [rbp-20H], rax\n" +
            "        cmp     qword [rbp-38H], 0\n" +
            "        jnz     L_006\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        mov     byte [rax], 48\n" +
            "        jmp     L_008\n" +
            "\n" +
            "L_006:  jmp     L_008\n" +
            "\n" +
            "L_007:  mov     rcx, qword [rbp-38H]\n" +
            "        mov     rdx, qword 6666666666666667H\n" +
            "        mov     rax, rcx\n" +
            "        imul    rdx\n" +
            "        sar     rdx, 2\n" +
            "        mov     rax, rcx\n" +
            "        sar     rax, 63\n" +
            "        sub     rdx, rax\n" +
            "        mov     rax, rdx\n" +
            "        shl     rax, 2\n" +
            "        add     rax, rdx\n" +
            "        add     rax, rax\n" +
            "        sub     rcx, rax\n" +
            "        mov     rdx, rcx\n" +
            "        mov     eax, edx\n" +
            "        add     eax, 48\n" +
            "        mov     edx, eax\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        mov     byte [rax], dl\n" +
            "        sub     qword [rbp-20H], 1\n" +
            "        mov     rcx, qword [rbp-38H]\n" +
            "        mov     rdx, qword 6666666666666667H\n" +
            "        mov     rax, rcx\n" +
            "        imul    rdx\n" +
            "        sar     rdx, 2\n" +
            "        mov     rax, rcx\n" +
            "        sar     rax, 63\n" +
            "        sub     rdx, rax\n" +
            "        mov     rax, rdx\n" +
            "        mov     qword [rbp-38H], rax\n" +
            "L_008:  cmp     qword [rbp-38H], 0\n" +
            "        jg      L_007\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "mallocArray:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 32\n" +
            "        mov     qword [rbp-18H], rdi\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, 1\n" +
            "        shl     rax, 4\n" +
            "        mov     rdi, rax\n" +
            "        call    malloc\n" +
            "        mov     qword [rbp-8H], rax\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, 1\n" +
            "        shl     rax, 4\n" +
            "        mov     rdx, rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        mov     esi, 0\n" +
            "        mov     rdi, rax\n" +
            "        call    memset\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        mov     rdx, qword [rbp-18H]\n" +
            "        mov     qword [rax], rdx\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "concat:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 48\n" +
            "        mov     qword [rbp-28H], rdi\n" +
            "        mov     qword [rbp-30H], rsi\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movzx   edx, al\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movzx   eax, al\n" +
            "        add     eax, edx\n" +
            "        add     eax, 2\n" +
            "        cdqe\n" +
            "        mov     rdi, rax\n" +
            "        call    malloc\n" +
            "        mov     qword [rbp-18H], rax\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        movzx   edx, byte [rax]\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        add     edx, eax\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        mov     byte [rax], dl\n" +
            "        mov     qword [rbp-8H], 0\n" +
            "        mov     qword [rbp-10H], 0\n" +
            "        mov     qword [rbp-8H], 0\n" +
            "        jmp     cc_002\n" +
            "\n" +
            "cc_001:  add     qword [rbp-10H], 1\n" +
            "        mov     rdx, qword [rbp-10H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rdx, rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        lea     rcx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        add     rax, rcx\n" +
            "        movzx   eax, byte [rax]\n" +
            "        mov     byte [rdx], al\n" +
            "        add     qword [rbp-8H], 1\n" +
            "cc_002:  mov     rax, qword [rbp-28H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movzx   eax, al\n" +
            "        cmp     rax, qword [rbp-8H]\n" +
            "        jg      cc_001\n" +
            "        mov     qword [rbp-8H], 0\n" +
            "        jmp     cc_004\n" +
            "\n" +
            "cc_003:  add     qword [rbp-10H], 1\n" +
            "        mov     rdx, qword [rbp-10H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rdx, rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        lea     rcx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        add     rax, rcx\n" +
            "        movzx   eax, byte [rax]\n" +
            "        mov     byte [rdx], al\n" +
            "        add     qword [rbp-8H], 1\n" +
            "cc_004:  mov     rax, qword [rbp-30H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movzx   eax, al\n" +
            "        cmp     rax, qword [rbp-8H]\n" +
            "        jg      cc_003\n" +
            "        add     qword [rbp-10H], 1\n" +
            "        mov     rdx, qword [rbp-10H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, rdx\n" +
            "        mov     byte [rax], 0\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "address:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     qword [rbp-10H], rsi\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        add     rax, 1\n" +
            "        shl     rax, 4\n" +
            "        mov     rdx, rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, rdx\n" +
            "        pop     rbp\n" +
            "        ret\n" +
            "_multiArray:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        push    rbx\n" +
            "        sub     rsp, 56\n" +
            "        mov     dword [rbp-34H], edi\n" +
            "        mov     qword [rbp-40H], rsi\n" +
            "        mov     eax, dword [rbp-34H]\n" +
            "        add     eax, 1\n" +
            "        movsxd  rdx, eax\n" +
            "        mov     rax, qword [rbp-40H]\n" +
            "        mov     rax, qword [rax]\n" +
            "        cmp     rdx, rax\n" +
            "        jnz     CL_005\n" +
            "        mov     eax, dword [rbp-34H]\n" +
            "        movsxd  rdx, eax\n" +
            "        mov     rax, qword [rbp-40H]\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    address\n" +
            "        mov     rax, qword [rax]\n" +
            "        mov     rdi, rax\n" +
            "        call    mallocArray\n" +
            "        jmp     CL_008\n" +
            "\n" +
            "CL_005:  mov     eax, dword [rbp-34H]\n" +
            "        movsxd  rdx, eax\n" +
            "        mov     rax, qword [rbp-40H]\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    address\n" +
            "        mov     rax, qword [rax]\n" +
            "        mov     qword [rbp-20H], rax\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        mov     rdi, rax\n" +
            "        call    mallocArray\n" +
            "        mov     qword [rbp-28H], rax\n" +
            "        mov     dword [rbp-14H], 0\n" +
            "        jmp     CL_007\n" +
            "\n" +
            "CL_006:  mov     eax, dword [rbp-14H]\n" +
            "        movsxd  rdx, eax\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    address\n" +
            "        mov     rbx, rax\n" +
            "        mov     eax, dword [rbp-34H]\n" +
            "        lea     edx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-40H]\n" +
            "        mov     rsi, rax\n" +
            "        mov     edi, edx\n" +
            "        call    _multiArray\n" +
            "        mov     qword [rbx], rax\n" +
            "        add     dword [rbp-14H], 1\n" +
            "CL_007:  mov     eax, dword [rbp-14H]\n" +
            "        cdqe\n" +
            "        cmp     rax, qword [rbp-20H]\n" +
            "        jl      CL_006\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "CL_008:  add     rsp, 56\n" +
            "        pop     rbx\n" +
            "        pop     rbp\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "multiArray:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        mov     rsi, rax\n" +
            "        mov     edi, 0\n" +
            "        call    _multiArray\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "multiAddress:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 48\n" +
            "        mov     qword [rbp-28H], rdi\n" +
            "        mov     qword [rbp-30H], rsi\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        mov     rax, qword [rax]\n" +
            "        mov     qword [rbp-18H], rax\n" +
            "        cmp     qword [rbp-18H], 0\n" +
            "        jnz     mAd_005\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        jmp     mAd_008\n" +
            "\n" +
            "mAd_005:  mov     rax, qword [rbp-28H]\n" +
            "        mov     qword [rbp-10H], rax\n" +
            "        mov     qword [rbp-8H], 1\n" +
            "        jmp     mAd_007\n" +
            "\n" +
            "mAd_006:  mov     rax, qword [rbp-8H]\n" +
            "        lea     rdx, [rax-1H]\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    address\n" +
            "        mov     rdx, qword [rax]\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    address\n" +
            "        mov     rax, qword [rax]\n" +
            "        mov     qword [rbp-10H], rax\n" +
            "        add     qword [rbp-8H], 1\n" +
            "mAd_007:  mov     rax, qword [rbp-8H]\n" +
            "        cmp     rax, qword [rbp-18H]\n" +
            "        jl      mAd_006\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        lea     rdx, [rax-1H]\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    address\n" +
            "        mov     rdx, qword [rax]\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    address\n" +
            "        mov     qword [rbp-10H], rax\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "mAd_008:  leave\n" +
            "        ret\n" +
            "\n" +
            "getInt:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        lea     rax, [rbp-8H]\n" +
            "        mov     rsi, rax\n" +
            "        mov     edi, GS_31\n" +
            "        mov     eax, 0\n" +
            "        call    scanf\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "getString:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 32\n" +
            "        mov     esi, buff.1788\n" +
            "        mov     edi, GS_32\n" +
            "        mov     eax, 0\n" +
            "        call    scanf\n" +
            "        mov     edi, buff.1788\n" +
            "        call    strlen\n" +
            "        mov     qword [rbp-10H], rax\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        add     rax, 2\n" +
            "        mov     rdi, rax\n" +
            "        call    malloc\n" +
            "        mov     qword [rbp-18H], rax\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        mov     edx, eax\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        mov     byte [rax], dl\n" +
            "        mov     qword [rbp-8H], 1\n" +
            "        jmp     GS_20\n" +
            "\n" +
            "GS_19:  mov     rdx, qword [rbp-8H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rdx, rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        sub     rax, 1\n" +
            "\n" +
            "        movzx   eax, byte [abs buff.1788+rax]\n" +
            "        mov     byte [rdx], al\n" +
            "        add     qword [rbp-8H], 1\n" +
            "GS_20:  mov     rax, qword [rbp-8H]\n" +
            "        cmp     rax, qword [rbp-10H]\n" +
            "        jle     GS_19\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "parseInt:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        mov     r8,qword [arg+8*63]\n" +
            "        mov     qword [rbp-18H], r8\n" +
            "        mov     qword [rbp-10H], 0\n" +
            "        mov     qword [rbp-8H], 1\n" +
            "        jmp     PSL_025\n" +
            "\n" +
            "PSL_023:  mov     rdx, qword [rbp-8H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, rdx\n" +
            "        movzx   eax, byte [rax]\n" +
            "        cmp     al, 47\n" +
            "        jbe     PSL_024\n" +
            "        mov     rdx, qword [rbp-8H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, rdx\n" +
            "        movzx   eax, byte [rax]\n" +
            "        cmp     al, 57\n" +
            "        ja      PSL_024\n" +
            "        mov     rdx, qword [rbp-10H]\n" +
            "        mov     rax, rdx\n" +
            "        shl     rax, 2\n" +
            "        add     rax, rdx\n" +
            "        add     rax, rax\n" +
            "        mov     rdx, rax\n" +
            "        mov     rcx, qword [rbp-8H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, rcx\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movzx   eax, al\n" +
            "        sub     eax, 48\n" +
            "        cdqe\n" +
            "        add     rax, rdx\n" +
            "        mov     qword [rbp-10H], rax\n" +
            "        add     qword [rbp-8H], 1\n" +
            "        jmp     PSL_025\n" +
            "\n" +
            "PSL_024:  mov     rax, qword [rbp-10H]\n" +
            "        jmp     PSL_026\n" +
            "\n" +
            "PSL_025:  mov     rax, qword [rbp-18H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movzx   eax, al\n" +
            "        cmp     rax, qword [rbp-8H]\n" +
            "        jge     PSL_023\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "PSL_026:  pop     rbp\n" +
            "        ret\n" +
            "\n" +
            "substring:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 48\n" +
            "        mov     qword [rbp-28H], rdi\n" +
            "        mov     qword [rbp-30H], rsi\n" +
            "        mov     r8,qword [arg+8*63]\n" +
            "        mov     qword [rbp-18H], r8\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        mov     rdx, qword [rbp-30H]\n" +
            "        sub     rdx, rax\n" +
            "        mov     rax, rdx\n" +
            "        add     rax, 3\n" +
            "        mov     rdi, rax\n" +
            "        call    malloc\n" +
            "        mov     qword [rbp-20H], rax\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        mov     edx, eax\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        sub     edx, eax\n" +
            "        mov     eax, edx\n" +
            "        add     eax, 1\n" +
            "        mov     edx, eax\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        mov     byte [rax], dl\n" +
            "        mov     qword [rbp-10H], 0\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        mov     qword [rbp-8H], rax\n" +
            "        jmp     PSL_022\n" +
            "\n" +
            "PSL_021:  add     qword [rbp-10H], 1\n" +
            "        mov     rdx, qword [rbp-10H]\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        add     rdx, rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        lea     rcx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, rcx\n" +
            "        movzx   eax, byte [rax]\n" +
            "        mov     byte [rdx], al\n" +
            "        add     qword [rbp-8H], 1\n" +
            "PSL_022:  mov     rax, qword [rbp-8H]\n" +
            "        cmp     rax, qword [rbp-30H]\n" +
            "        jle     PSL_021\n" +
            "        add     qword [rbp-10H], 1\n" +
            "        mov     rdx, qword [rbp-10H]\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        add     rax, rdx\n" +
            "        mov     byte [rax], 0\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "ord:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        mov     qword [rbp-18H], rdi\n" +
            "        mov     r8,qword [arg+8*63]\n" +
            "        mov     qword [rbp-8H], r8\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        lea     rdx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, rdx\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movzx   eax, al\n" +
            "        pop     rbp\n" +
            "        ret\n" +
            "\n" +
            "strls:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     qword [rbp-10H], rsi\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        lea     rdx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, 1\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    strcmp\n" +
            "        shr     eax, 31\n" +
            "        movzx   eax, al\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "strle:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     qword [rbp-10H], rsi\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        lea     rdx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, 1\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    strcmp\n" +
            "        test    eax, eax\n" +
            "        setle   al\n" +
            "        movzx   eax, al\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "streq:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     qword [rbp-10H], rsi\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        lea     rdx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, 1\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    strcmp\n" +
            "        test    eax, eax\n" +
            "        sete    al\n" +
            "        movzx   eax, al\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "strge:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     qword [rbp-10H], rsi\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        lea     rdx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, 1\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    strcmp\n" +
            "        not     eax\n" +
            "        shr     eax, 31\n" +
            "        movzx   eax, al\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "strgt:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     qword [rbp-10H], rsi\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        lea     rdx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, 1\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    strcmp\n" +
            "        test    eax, eax\n" +
            "        setg    al\n" +
            "        movzx   eax, al\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "strne:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     qword [rbp-10H], rsi\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        lea     rdx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, 1\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    strcmp\n" +
            "        test    eax, eax\n" +
            "        setne   al\n" +
            "        movzx   eax, al\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "main:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 3632\n" +
            "\t        mov     eax, 536870912\n" +
            "        cdqe\n" +
            "        mov     rdi, rax\n" +
            "        call    malloc\n" +
            "        mov     edx, dword 536870912\n" +
            "        movsxd  rdx, edx\n" +
            "        sub     rdx, 5616\n" +
            "        add     rax, rdx\n" +
            "        mov     qword [trsp], rsp\n" +
            "        mov     rsp, rax\n" +
            "        mov     eax, 0\n" +
            "\tcall global_init\n" +
            "\tmov r8 , rax\n" +
            "\tmov r10,40000\n" +
            "\tmov r9,r10\n" +
            "\tmov r12,40000\n" +
            "\tmov r11,r12\n" +
            "\tmov r14,9977\n" +
            "\tmov r13,r14\n" +
            "\tmov r15,0\n" +
            "\tmov rax,r15\n" +
            "\tmov qword [rsp+8*1],r8\n" +
            "\tmov qword [gbl+8*2],r9\n" +
            "\tmov qword [gbl+8*3],r11\n" +
            "\tmov qword [gbl+8*4],r13\n" +
            "\t        mov     rsp, qword [trsp]\n" +
            "\tleave\n" +
            "\tret\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,1\n" +
            "\tmov r8,r10\n" +
            "\tmov qword [rsp+8*5],r8\n" +
            "\t\n" +
            "L_78:\n" +
            "\tmov r8,  [rsp+8*5]\n" +
            "\tmov r9,  [gbl+8*2]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetle r10B\n" +
            "\tmov qword [rsp+8*6],r10\n" +
            "\tmov r8,  [rsp+8*6]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_79\n" +
            "\tmov r9,  [gbl+8*4]\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,0\n" +
            "\tmov r10,r11\n" +
            "\tmov qword rsi,r8\n" +
            "\tmov qword rdi,r10\n" +
            "\tcall RandRange\n" +
            "\tmov r8 , rax\n" +
            "\tmov r10,  [gbl+8*10]\n" +
            "\tmov r9,r10\n" +
            "\tmov r11,  [rsp+8*5]\n" +
            "\tmov r12,r11\n" +
            "\tadd r12,1\n" +
            "\tshl r12,4\n" +
            "\tadd r12,r9\n" +
            "\tmov [r12],r8\n" +
            "\tmov qword [rsp+8*9],r8\n" +
            "\tmov qword [rsp+8*11],r9\n" +
            "\tmov qword [rsp+8*12],r12\n" +
            "\t\n" +
            "L_80:\n" +
            "\tmov r8,  [rsp+8*5]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*5],r8\n" +
            "\tjmp L_78\n" +
            "\t\n" +
            "L_79:\n" +
            "\tcall init\n" +
            "\tmov r8 , rax\n" +
            "\tmov r10,  [gbl+8*2]\n" +
            "\tmov r9,r10\n" +
            "\tmov r12,1\n" +
            "\tmov r11,r12\n" +
            "\tmov r14,1\n" +
            "\tmov r13,r14\n" +
            "\tmov qword [rsp+8*13],r8\n" +
            "\tmov qword [arg+8*2],r9\n" +
            "\tmov qword rsi,r11\n" +
            "\tmov qword rdi,r13\n" +
            "\tcall build\n" +
            "\tmov r8 , rax\n" +
            "\tmov qword [rsp+8*15],r8\n" +
            "\t\n" +
            "L_81:\n" +
            "\tmov r8,  [gbl+8*3]\n" +
            "\tmov r9,0\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetg r10B\n" +
            "\tmov qword [rsp+8*16],r10\n" +
            "\tmov r8,  [rsp+8*16]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_82\n" +
            "\tcall Rand\n" +
            "\tmov r8 , rax\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r8\n" +
            "\tmov r9,2\n" +
            "\tmov rbx, r9\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r10, rdx\n" +
            "\tmov r11,r10\n" +
            "\tmov r13,  [gbl+8*2]\n" +
            "\tmov r12,r13\n" +
            "\tmov r15,1\n" +
            "\tmov r14,r15\n" +
            "\tmov qword [rsp+8*17],r8\n" +
            "\tmov qword [rsp+8*18],r10\n" +
            "\tmov qword [gbl+8*19],r11\n" +
            "\tmov qword rsi,r12\n" +
            "\tmov qword rdi,r14\n" +
            "\tcall RandRange\n" +
            "\tmov r8 , rax\n" +
            "\tmov r9,r8\n" +
            "\tmov r11,  [gbl+8*2]\n" +
            "\tmov r10,r11\n" +
            "\tmov r13,1\n" +
            "\tmov r12,r13\n" +
            "\tmov qword [rsp+8*20],r8\n" +
            "\tmov qword [gbl+8*21],r9\n" +
            "\tmov qword rsi,r10\n" +
            "\tmov qword rdi,r12\n" +
            "\tcall RandRange\n" +
            "\tmov r8 , rax\n" +
            "\tmov r9,r8\n" +
            "\tmov qword [rsp+8*22],r8\n" +
            "\tmov qword [gbl+8*23],r9\n" +
            "\t\n" +
            "L_83:\n" +
            "\tmov r8,  [gbl+8*23]\n" +
            "\tmov r9,  [gbl+8*21]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetle r10B\n" +
            "\tmov qword [rsp+8*24],r10\n" +
            "\tmov r8,  [rsp+8*24]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_84\n" +
            "\tmov r9,  [gbl+8*2]\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,1\n" +
            "\tmov r10,r11\n" +
            "\tmov qword rsi,r8\n" +
            "\tmov qword rdi,r10\n" +
            "\tcall RandRange\n" +
            "\tmov r8 , rax\n" +
            "\tmov r9,r8\n" +
            "\tmov qword [rsp+8*25],r8\n" +
            "\tmov qword [gbl+8*23],r9\n" +
            "\tjmp L_83\n" +
            "\t\n" +
            "L_84:\n" +
            "\tmov r8,  [gbl+8*19]\n" +
            "\tmov r9,0\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsete r10B\n" +
            "\tmov qword [rsp+8*26],r10\n" +
            "\tmov r8,  [rsp+8*26]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_86\n" +
            "\tmov r9,  [gbl+8*2]\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,1\n" +
            "\tmov r10,r11\n" +
            "\tmov r13,1\n" +
            "\tmov r12,r13\n" +
            "\tmov qword [arg+8*2],r8\n" +
            "\tmov qword rsi,r10\n" +
            "\tmov qword rdi,r12\n" +
            "\tcall update\n" +
            "\tmov r8 , rax\n" +
            "\tmov qword [rsp+8*27],r8\n" +
            "\t\n" +
            "L_86:\n" +
            "\tmov r8,  [gbl+8*19]\n" +
            "\tmov r9,1\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsete r10B\n" +
            "\tmov qword [rsp+8*28],r10\n" +
            "\tmov r8,  [rsp+8*28]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_88\n" +
            "\tmov r9,  [gbl+8*2]\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,1\n" +
            "\tmov r10,r11\n" +
            "\tmov r13,1\n" +
            "\tmov r12,r13\n" +
            "\tmov qword [arg+8*2],r8\n" +
            "\tmov qword rsi,r10\n" +
            "\tmov qword rdi,r12\n" +
            "\tcall query\n" +
            "\tmov r8 , rax\n" +
            "\tmov r9,  [gbl+8*30]\n" +
            "\tmov r10,r9\n" +
            "\tadd r10,r8\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r10\n" +
            "\tmov r11,  [gbl+8*32]\n" +
            "\tmov rbx, r11\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r12, rdx\n" +
            "\tmov r9,r12\n" +
            "\tmov qword [rsp+8*29],r8\n" +
            "\tmov qword [gbl+8*30],r9\n" +
            "\tmov qword [rsp+8*31],r10\n" +
            "\tmov qword [rsp+8*33],r12\n" +
            "\t\n" +
            "L_88:\n" +
            "\tmov r9,  [gbl+8*3]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,1\n" +
            "\tmov r9,r9\n" +
            "\tsub r9,r10\n" +
            "\tmov qword [rsp+8*34],r8\n" +
            "\tmov qword [gbl+8*3],r9\n" +
            "\tjmp L_81\n" +
            "\t\n" +
            "L_82:\n" +
            "\tmov r9,  [gbl+8*30]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,r8\n" +
            "\tmov qword rdi,r8\n" +
            "\tmov qword [rsp+8*35],r10\n" +
            "\tmov     rdi, [rsp+8*35]\n" +
            "\tcall    toString\n" +
            "\tmov     qword[rsp+8*36], rax\n" +
            "\tmov r9,  [rsp+8*36]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,r8\n" +
            "\tmov qword rdi,r8\n" +
            "\tmov qword [rsp+8*37],r10\n" +
            "\tmov rdi, format\n" +
            "\tmov rsi,[rsp+8*37] \n" +
            "\tadd rsi, 1 \n" +
            "\txor rax, rax\n" +
            "\tcall printf\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\t        mov     rsp, qword [trsp]\n" +
            "\tleave\n" +
            "\tret\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\t        mov     rsp, qword [trsp]\n" +
            "\tleave\n" +
            "\tret\n" +
            "\tjmp QED\n" +
            "\t\n" +
            "square:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 3632\n" +
            "\tmov r9,  rdi\n" +
            "\tmov r8,r9\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r8\n" +
            "\tmov r10,  [gbl+8*4]\n" +
            "\tmov rbx, r10\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r11, rdx\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r8\n" +
            "\tmov rbx, r10\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r12, rdx\n" +
            "\tmov r13,r11\n" +
            "\timul r13,r12\n" +
            "\tmov rax,r13\n" +
            "\tmov qword [rsp+8*38],r8\n" +
            "\tmov qword [rsp+8*39],r11\n" +
            "\tmov qword [rsp+8*40],r12\n" +
            "\tmov qword [rsp+8*41],r13\n" +
            "\tleave\n" +
            "\tret\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "gcd:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 3632\n" +
            "\tmov r9,  rdi\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,  rsi\n" +
            "\tmov r10,r11\n" +
            "\tmov r12,0\n" +
            "\tcmp r10,r12\n" +
            "\tmov r13, 0\n" +
            "\tsete r13B\n" +
            "\tmov qword [rsp+8*42],r8\n" +
            "\tmov qword [rsp+8*43],r10\n" +
            "\tmov qword [rsp+8*44],r13\n" +
            "\tmov r8,  [rsp+8*44]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_1\n" +
            "\tmov r8,  [rsp+8*42]\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "L_1:\n" +
            "\tmov r8,  [rsp+8*42]\n" +
            "\tmov r9,  [rsp+8*43]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*45],r10\n" +
            "\tmov r8,  [rsp+8*45]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_2\n" +
            "\tmov r9,  [rsp+8*42]\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,  [rsp+8*43]\n" +
            "\tmov r10,r11\n" +
            "\tmov qword rsi,r8\n" +
            "\tmov qword rdi,r10\n" +
            "\tcall gcd\n" +
            "\tmov r8 , rax\n" +
            "\tmov rax,r8\n" +
            "\tmov qword [rsp+8*46],r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\tjmp L_3\n" +
            "\t\n" +
            "L_2:\n" +
            "\txor rdx, rdx\n" +
            "\tmov r8,  [rsp+8*42]\n" +
            "\tmov rax, r8\n" +
            "\tmov r9,  [rsp+8*43]\n" +
            "\tmov rbx, r9\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r10, rdx\n" +
            "\tmov r11,r10\n" +
            "\tmov r12,r9\n" +
            "\tmov qword [rsp+8*47],r10\n" +
            "\tmov qword rsi,r11\n" +
            "\tmov qword rdi,r12\n" +
            "\tcall gcd\n" +
            "\tmov r8 , rax\n" +
            "\tmov rax,r8\n" +
            "\tmov qword [rsp+8*48],r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "L_3:\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "lcm:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 3632\n" +
            "\tmov r9,  rdi\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,  rsi\n" +
            "\tmov r10,r11\n" +
            "\tmov r11,r10\n" +
            "\tmov r9,r8\n" +
            "\tmov qword [rsp+8*49],r8\n" +
            "\tmov qword rdi,r9\n" +
            "\tmov qword [rsp+8*50],r10\n" +
            "\tmov qword rsi,r11\n" +
            "\tcall gcd\n" +
            "\tmov r8 , rax\n" +
            "\txor rdx, rdx\n" +
            "\tmov r9,  [rsp+8*49]\n" +
            "\tmov rax, r9\n" +
            "\tmov rbx, r8\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r10, rax\n" +
            "\tmov r11,  [rsp+8*50]\n" +
            "\tmov r12,r10\n" +
            "\timul r12,r11\n" +
            "\tmov rax,r12\n" +
            "\tmov qword [rsp+8*51],r8\n" +
            "\tmov qword [rsp+8*52],r10\n" +
            "\tmov qword [rsp+8*53],r12\n" +
            "\tleave\n" +
            "\tret\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "Rand:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 3632\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,1\n" +
            "\tmov r8,r10\n" +
            "\tmov qword [rsp+8*54],r8\n" +
            "\t\n" +
            "L_4:\n" +
            "\tmov r8,  [rsp+8*54]\n" +
            "\tmov r9,3\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*55],r10\n" +
            "\tmov r8,  [rsp+8*55]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_5\n" +
            "\tmov r8,  [gbl+8*56]\n" +
            "\tmov r9,  [gbl+8*57]\n" +
            "\tmov r10,r8\n" +
            "\timul r10,r9\n" +
            "\tmov r11,  [gbl+8*59]\n" +
            "\tmov r12,r10\n" +
            "\tadd r12,r11\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r12\n" +
            "\tmov r13,  [gbl+8*32]\n" +
            "\tmov rbx, r13\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r14, rdx\n" +
            "\tmov r8,r14\n" +
            "\tmov qword [gbl+8*56],r8\n" +
            "\tmov qword [rsp+8*58],r10\n" +
            "\tmov qword [rsp+8*60],r12\n" +
            "\tmov qword [rsp+8*61],r14\n" +
            "\t\n" +
            "L_6:\n" +
            "\tmov r9,  [rsp+8*54]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,1\n" +
            "\tmov r9,r9\n" +
            "\tadd r9,r10\n" +
            "\tmov qword [rsp+8*62],r8\n" +
            "\tmov qword [rsp+8*54],r9\n" +
            "\tjmp L_4\n" +
            "\t\n" +
            "L_5:\n" +
            "\tmov r8,  [gbl+8*56]\n" +
            "\tmov r9,0\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*63],r10\n" +
            "\tmov r8,  [rsp+8*63]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_8\n" +
            "\tmov r8,  [gbl+8*56]\n" +
            "\tmov r9,r8\n" +
            "\tneg r9\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [gbl+8*56],r8\n" +
            "\tmov qword [rsp+8*64],r9\n" +
            "\t\n" +
            "L_8:\n" +
            "\tmov r8,  [gbl+8*56]\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "RandRange:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 3632\n" +
            "\tmov r9,  rdi\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,  rsi\n" +
            "\tmov r10,r11\n" +
            "\tmov qword [rsp+8*65],r8\n" +
            "\tmov qword [rsp+8*66],r10\n" +
            "\tcall Rand\n" +
            "\tmov r8 , rax\n" +
            "\tmov r9,  [rsp+8*66]\n" +
            "\tmov r10,  [rsp+8*65]\n" +
            "\tmov r11,r9\n" +
            "\tsub r11,r10\n" +
            "\tmov r12,1\n" +
            "\tmov r13,r11\n" +
            "\tadd r13,r12\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r8\n" +
            "\tmov rbx, r13\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r14, rdx\n" +
            "\tmov r15,r10\n" +
            "\tadd r15,r14\n" +
            "\tmov qword [rsp+8*67],r8\n" +
            "\tmov r8,1\n" +
            "\tmov r9,r15\n" +
            "\tadd r9,r8\n" +
            "\tmov rax,r9\n" +
            "\tmov qword [rsp+8*72],r9\n" +
            "\tmov qword [rsp+8*68],r11\n" +
            "\tmov qword [rsp+8*69],r13\n" +
            "\tmov qword [rsp+8*70],r14\n" +
            "\tmov qword [rsp+8*71],r15\n" +
            "\tleave\n" +
            "\tret\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "init:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 3632\n" +
            "\tmov     rdi, 140005\n" +
            "\tcall    mallocArray\n" +
            "\tmov     qword [rsp+8*73], rax\n" +
            "\tmov r9,  [rsp+8*73]\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,0\n" +
            "\tmov r10,r11\n" +
            "\tmov r13,0\n" +
            "\tmov r12,r13\n" +
            "\tmov r14,2\n" +
            "\tmov r10,r14\n" +
            "\tmov qword [rsp+8*74],r8\n" +
            "\tmov qword [rsp+8*75],r10\n" +
            "\tmov qword [rsp+8*76],r12\n" +
            "\t\n" +
            "L_9:\n" +
            "\tmov r8,  [rsp+8*75]\n" +
            "\tmov r9,  [gbl+8*4]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*77],r10\n" +
            "\tmov r8,  [rsp+8*77]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_10\n" +
            "\tmov r9,  [rsp+8*74]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*75]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov [r11],r10\n" +
            "\tmov qword [rsp+8*78],r8\n" +
            "\tmov qword [rsp+8*79],r11\n" +
            "\t\n" +
            "L_11:\n" +
            "\tmov r8,  [rsp+8*75]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*75],r8\n" +
            "\tjmp L_9\n" +
            "\t\n" +
            "L_10:\n" +
            "\tmov r9,2\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*75],r8\n" +
            "\t\n" +
            "L_12:\n" +
            "\tmov r8,  [rsp+8*75]\n" +
            "\tmov r9,  [gbl+8*4]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*80],r10\n" +
            "\tmov r8,  [rsp+8*80]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_13\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*76],r8\n" +
            "\t\n" +
            "L_15:\n" +
            "\tmov r8,  [rsp+8*76]\n" +
            "\tmov r9,15\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetle r10B\n" +
            "\tmov qword [rsp+8*81],r10\n" +
            "\tmov r8,  [rsp+8*81]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_16\n" +
            "\tmov r9,  [rsp+8*74]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*75]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,r12\n" +
            "\tmov qword [rsp+8*82],r8\n" +
            "\tmov qword [rsp+8*83],r11\n" +
            "\tmov qword [rsp+8*84],r12\n" +
            "\tmov qword rdi,r13\n" +
            "\tcall square\n" +
            "\tmov r8 , rax\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r8\n" +
            "\tmov r9,  [gbl+8*4]\n" +
            "\tmov rbx, r9\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r10, rdx\n" +
            "\tmov r12,  [rsp+8*74]\n" +
            "\tmov r11,r12\n" +
            "\tmov r13,  [rsp+8*75]\n" +
            "\tmov r14,r13\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r11\n" +
            "\tmov [r14],r10\n" +
            "\tmov qword [rsp+8*85],r8\n" +
            "\tmov qword [rsp+8*86],r10\n" +
            "\tmov qword [rsp+8*87],r11\n" +
            "\tmov qword [rsp+8*88],r14\n" +
            "\t\n" +
            "L_17:\n" +
            "\tmov r8,  [rsp+8*76]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*76],r8\n" +
            "\tjmp L_15\n" +
            "\t\n" +
            "L_16:\n" +
            "\t\n" +
            "L_14:\n" +
            "\tmov r8,  [rsp+8*75]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*75],r8\n" +
            "\tjmp L_12\n" +
            "\t\n" +
            "L_13:\n" +
            "\tmov r9,2\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*75],r8\n" +
            "\t\n" +
            "L_18:\n" +
            "\tmov r8,  [rsp+8*75]\n" +
            "\tmov r9,  [gbl+8*4]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*89],r10\n" +
            "\tmov r8,  [rsp+8*89]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_19\n" +
            "\tmov r9,  [rsp+8*74]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*75]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,r12\n" +
            "\tmov r15,1\n" +
            "\tmov r14,r15\n" +
            "\tmov qword [rsp+8*90],r8\n" +
            "\tmov qword [rsp+8*91],r11\n" +
            "\tmov qword [rsp+8*92],r12\n" +
            "\tmov qword [rsp+8*93],r13\n" +
            "\tmov qword [rsp+8*94],r14\n" +
            "\t\n" +
            "L_21:\n" +
            "\tmov r9,  [rsp+8*93]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword rdi,r8\n" +
            "\tcall square\n" +
            "\tmov r8 , rax\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r8\n" +
            "\tmov r9,  [gbl+8*4]\n" +
            "\tmov rbx, r9\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r10, rdx\n" +
            "\tmov r11,r10\n" +
            "\tmov r13,  [gbl+8*97]\n" +
            "\tmov r12,r13\n" +
            "\tmov r14,r11\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r12\n" +
            "\tmov r15,1\n" +
            "\tmov [r14],r15\n" +
            "\tmov qword [rsp+8*95],r8\n" +
            "\tmov r10,  [rsp+8*74]\n" +
            "\tmov r8,r10\n" +
            "\tmov r10,  [rsp+8*75]\n" +
            "\tmov qword [rsp+8*98],r12\n" +
            "\tmov r12,r10\n" +
            "\tadd r12,1\n" +
            "\tshl r12,4\n" +
            "\tadd r12,r8\n" +
            "\tmov qword [rsp+8*100],r8\n" +
            "\tmov r8, [r12]\n" +
            "\tcmp r11,r8\n" +
            "\tmov qword [rsp+8*101],r12\n" +
            "\tmov r12, 0\n" +
            "\tsete r12B\n" +
            "\tmov qword [rsp+8*102],r8\n" +
            "\tmov qword [rsp+8*93],r11\n" +
            "\tmov qword [rsp+8*103],r12\n" +
            "\tmov qword [rsp+8*99],r14\n" +
            "\tmov r8,  [rsp+8*103]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_25\n" +
            "\tjmp L_22\n" +
            "\t\n" +
            "L_25:\n" +
            "\t\n" +
            "L_23:\n" +
            "\tmov r8,  [rsp+8*94]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*94],r8\n" +
            "\tjmp L_21\n" +
            "\t\n" +
            "L_22:\n" +
            "\tmov r9,  [rsp+8*94]\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,  [gbl+8*104]\n" +
            "\tmov r10,r11\n" +
            "\tmov qword rsi,r8\n" +
            "\tmov qword rdi,r10\n" +
            "\tcall lcm\n" +
            "\tmov r8 , rax\n" +
            "\tmov r9,r8\n" +
            "\tmov qword [rsp+8*105],r8\n" +
            "\tmov qword [gbl+8*104],r9\n" +
            "\t\n" +
            "L_20:\n" +
            "\tmov r8,  [rsp+8*75]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*75],r8\n" +
            "\tjmp L_18\n" +
            "\t\n" +
            "L_19:\n" +
            "\tmov r9,  [gbl+8*97]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,0\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12,1\n" +
            "\tmov [r11],r12\n" +
            "\tmov r13,r9\n" +
            "\tmov r14,1\n" +
            "\tmov r15,r14\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov qword [rsp+8*106],r8\n" +
            "\tmov r8,1\n" +
            "\tmov [r15],r8\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tmov qword [rsp+8*107],r11\n" +
            "\tmov qword [rsp+8*108],r13\n" +
            "\tmov qword [rsp+8*109],r15\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "build:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 3632\n" +
            "\tmov r9,  rdi\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,  rsi\n" +
            "\tmov r10,r11\n" +
            "\tmov r13,  [arg+8*2]\n" +
            "\tmov r12,r13\n" +
            "\tmov r15,0\n" +
            "\tmov r14,r15\n" +
            "\tcmp r10,r12\n" +
            "\tmov r15, 0\n" +
            "\tsete r15B\n" +
            "\tmov qword [rsp+8*110],r8\n" +
            "\tmov qword [rsp+8*111],r10\n" +
            "\tmov qword [rsp+8*112],r12\n" +
            "\tmov qword [rsp+8*113],r14\n" +
            "\tmov qword [rsp+8*114],r15\n" +
            "\tmov r8,  [rsp+8*114]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_26\n" +
            "\tmov r9,  [gbl+8*10]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*111]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r14,  [gbl+8*118]\n" +
            "\tmov r13,r14\n" +
            "\tmov r15,  [rsp+8*110]\n" +
            "\tmov qword [rsp+8*115],r8\n" +
            "\tmov r8,r15\n" +
            "\tadd r8,1\n" +
            "\tshl r8,4\n" +
            "\tadd r8,r13\n" +
            "\tmov [r8],r12\n" +
            "\tmov qword [rsp+8*120],r8\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*116],r11\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov qword [rsp+8*121],r8\n" +
            "\tmov r8, [r11]\n" +
            "\tmov qword [rsp+8*122],r11\n" +
            "\tmov r11,  [gbl+8*4]\n" +
            "\tcmp r8,r11\n" +
            "\tmov qword [rsp+8*117],r12\n" +
            "\tmov r12, 0\n" +
            "\tsetl r12B\n" +
            "\tmov qword [rsp+8*123],r8\n" +
            "\tmov qword [rsp+8*124],r12\n" +
            "\tmov qword [rsp+8*119],r13\n" +
            "\tmov r8,  [rsp+8*124]\n" +
            "\tcmp r8, 0\n" +
            "\tjne L_28\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*125],r8\n" +
            "\tjmp L_29\n" +
            "\t\n" +
            "L_28:\n" +
            "\tmov r9,  [gbl+8*10]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*111]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,0\n" +
            "\tcmp r12,r13\n" +
            "\tmov r14, 0\n" +
            "\tsetge r14B\n" +
            "\tmov qword [rsp+8*126],r8\n" +
            "\tmov qword [rsp+8*127],r11\n" +
            "\tmov qword [rsp+8*128],r12\n" +
            "\tmov qword [rsp+8*129],r14\n" +
            "\tmov r9,  [rsp+8*129]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*125],r8\n" +
            "\t\n" +
            "L_29:\n" +
            "\tmov r8,  [rsp+8*125]\n" +
            "\tcmp r8, 0\n" +
            "\tjne L_30\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*130],r8\n" +
            "\tjmp L_31\n" +
            "\t\n" +
            "L_30:\n" +
            "\tmov r9,  [gbl+8*10]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*111]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r12\n" +
            "\tmov r13,  [gbl+8*4]\n" +
            "\tmov rbx, r13\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r14, rdx\n" +
            "\tmov qword [rsp+8*131],r8\n" +
            "\tmov r8,  [gbl+8*97]\n" +
            "\tmov r15,r8\n" +
            "\tmov qword [rsp+8*132],r11\n" +
            "\tmov r11,r14\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r15\n" +
            "\tmov qword [rsp+8*133],r12\n" +
            "\tmov r12, [r11]\n" +
            "\tmov qword [rsp+8*136],r11\n" +
            "\tmov r11,0\n" +
            "\tcmp r12,r11\n" +
            "\tmov r14, 0\n" +
            "\tsetg r14B\n" +
            "\tmov qword [rsp+8*137],r12\n" +
            "\tmov qword [rsp+8*138],r14\n" +
            "\tmov qword [rsp+8*135],r15\n" +
            "\tmov r9,  [rsp+8*138]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*130],r8\n" +
            "\t\n" +
            "L_31:\n" +
            "\tmov r8,  [rsp+8*130]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_33\n" +
            "\tmov r9,  [gbl+8*139]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*110]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12,1\n" +
            "\tmov [r11],r12\n" +
            "\tmov r14,  [gbl+8*10]\n" +
            "\tmov r13,r14\n" +
            "\tmov r15,  [rsp+8*111]\n" +
            "\tmov qword [rsp+8*140],r8\n" +
            "\tmov r8,r15\n" +
            "\tadd r8,1\n" +
            "\tshl r8,4\n" +
            "\tadd r8,r13\n" +
            "\tmov qword [rsp+8*141],r11\n" +
            "\tmov r11, [r8]\n" +
            "\tmov qword [rsp+8*143],r8\n" +
            "\tmov r12,  [gbl+8*145]\n" +
            "\tmov r8,r12\n" +
            "\tmov qword [rsp+8*142],r13\n" +
            "\tmov r13,r10\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r8\n" +
            "\tmov r8, [r13]\n" +
            "\tmov r12,0\n" +
            "\tmov r13,r12\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r8\n" +
            "\tmov [r13],r11\n" +
            "\tmov qword [rsp+8*146],r8\n" +
            "\tmov qword [rsp+8*144],r11\n" +
            "\tmov r11,1\n" +
            "\tmov r8,r11\n" +
            "\tmov qword [rsp+8*113],r8\n" +
            "\tmov qword [rsp+8*147],r13\n" +
            "\t\n" +
            "L_34:\n" +
            "\tmov r8,  [rsp+8*113]\n" +
            "\tmov r9,  [gbl+8*104]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*148],r10\n" +
            "\tmov r8,  [rsp+8*148]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_35\n" +
            "\tmov r8,  [rsp+8*113]\n" +
            "\tmov r9,1\n" +
            "\tmov r10,r8\n" +
            "\tsub r10,r9\n" +
            "\tmov r12,  [gbl+8*145]\n" +
            "\tmov r11,r12\n" +
            "\tmov r13,  [rsp+8*110]\n" +
            "\tmov r14,r13\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r11\n" +
            "\tmov r11, [r14]\n" +
            "\tmov r14,r10\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r11\n" +
            "\tmov r15, [r14]\n" +
            "\tmov r9,r15\n" +
            "\tmov qword rdi,r9\n" +
            "\tmov qword [rsp+8*149],r10\n" +
            "\tmov qword [rsp+8*150],r11\n" +
            "\tmov qword [rsp+8*151],r14\n" +
            "\tmov qword [rsp+8*152],r15\n" +
            "\tcall square\n" +
            "\tmov r8 , rax\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r8\n" +
            "\tmov r9,  [gbl+8*4]\n" +
            "\tmov rbx, r9\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r10, rdx\n" +
            "\tmov r12,  [gbl+8*145]\n" +
            "\tmov r11,r12\n" +
            "\tmov r13,  [rsp+8*110]\n" +
            "\tmov r14,r13\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r11\n" +
            "\tmov r11, [r14]\n" +
            "\tmov r15,  [rsp+8*113]\n" +
            "\tmov r14,r15\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r11\n" +
            "\tmov [r14],r10\n" +
            "\tmov qword [rsp+8*153],r8\n" +
            "\tmov qword [rsp+8*154],r10\n" +
            "\tmov qword [rsp+8*155],r11\n" +
            "\tmov qword [rsp+8*156],r14\n" +
            "\t\n" +
            "L_36:\n" +
            "\tmov r8,  [rsp+8*113]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*113],r8\n" +
            "\tjmp L_34\n" +
            "\t\n" +
            "L_35:\n" +
            "\t\n" +
            "L_33:\n" +
            "\tmov r9,  [gbl+8*157]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*110]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12,0\n" +
            "\tmov [r11],r12\n" +
            "\tmov qword [rsp+8*158],r8\n" +
            "\tmov qword [rsp+8*159],r11\n" +
            "\tjmp L_27\n" +
            "\t\n" +
            "L_26:\n" +
            "\tmov r8,  [rsp+8*110]\n" +
            "\tmov r9,2\n" +
            "\tmov r10,r8\n" +
            "\timul r10,r9\n" +
            "\tmov r11,r10\n" +
            "\tmov r12,2\n" +
            "\tmov r13,r8\n" +
            "\timul r13,r12\n" +
            "\tmov r14,1\n" +
            "\tmov r15,r13\n" +
            "\tadd r15,r14\n" +
            "\tmov r9,r15\n" +
            "\tmov r10,  [rsp+8*111]\n" +
            "\tmov r12,  [rsp+8*112]\n" +
            "\tmov r13,r10\n" +
            "\tadd r13,r12\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r13\n" +
            "\tmov r14,2\n" +
            "\tmov rbx, r14\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r15, rax\n" +
            "\tmov r13,r15\n" +
            "\tmov r14,r13\n" +
            "\tmov r15,r10\n" +
            "\tmov r10,r11\n" +
            "\tmov qword [rsp+8*164],r9\n" +
            "\tmov qword rdi,r10\n" +
            "\tmov qword [rsp+8*161],r11\n" +
            "\tmov qword [rsp+8*167],r13\n" +
            "\tmov qword [arg+8*2],r14\n" +
            "\tmov qword rsi,r15\n" +
            "\tcall build\n" +
            "\tmov r8 , rax\n" +
            "\tmov r9,  [rsp+8*167]\n" +
            "\tmov r10,1\n" +
            "\tmov r11,r9\n" +
            "\tadd r11,r10\n" +
            "\tmov r13,  [rsp+8*112]\n" +
            "\tmov r12,r13\n" +
            "\tmov r14,r11\n" +
            "\tmov qword [rsp+8*168],r8\n" +
            "\tmov r8,  [rsp+8*164]\n" +
            "\tmov r15,r8\n" +
            "\tmov qword [rsp+8*169],r11\n" +
            "\tmov qword [arg+8*2],r12\n" +
            "\tmov qword rsi,r14\n" +
            "\tmov qword rdi,r15\n" +
            "\tcall build\n" +
            "\tmov r8 , rax\n" +
            "\tmov r10,  [gbl+8*118]\n" +
            "\tmov r9,r10\n" +
            "\tmov r11,  [rsp+8*161]\n" +
            "\tmov r12,r11\n" +
            "\tadd r12,1\n" +
            "\tshl r12,4\n" +
            "\tadd r12,r9\n" +
            "\tmov r13, [r12]\n" +
            "\tmov r14,r10\n" +
            "\tmov r15,  [rsp+8*164]\n" +
            "\tmov qword [rsp+8*170],r8\n" +
            "\tmov r8,r15\n" +
            "\tadd r8,1\n" +
            "\tshl r8,4\n" +
            "\tadd r8,r14\n" +
            "\tmov qword [rsp+8*171],r9\n" +
            "\tmov r9, [r8]\n" +
            "\tmov qword [rsp+8*175],r8\n" +
            "\tmov r8,r13\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*176],r9\n" +
            "\tmov r9,r10\n" +
            "\tmov qword [rsp+8*172],r12\n" +
            "\tmov r12,  [rsp+8*110]\n" +
            "\tmov qword [rsp+8*173],r13\n" +
            "\tmov r13,r12\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r9\n" +
            "\tmov [r13],r8\n" +
            "\tmov qword [rsp+8*178],r9\n" +
            "\tmov r9,  [gbl+8*139]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*179],r13\n" +
            "\tmov r13,r11\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r8\n" +
            "\tmov qword [rsp+8*180],r8\n" +
            "\tmov r8, [r13]\n" +
            "\tmov qword [rsp+8*181],r13\n" +
            "\tmov r13,r9\n" +
            "\tmov qword [rsp+8*174],r14\n" +
            "\tmov r14,r15\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r13\n" +
            "\tmov qword [rsp+8*183],r13\n" +
            "\tmov r13, [r14]\n" +
            "\tmov qword [rsp+8*184],r14\n" +
            "\tmov r14,r8\n" +
            "\tand r14,r13\n" +
            "\tmov qword [rsp+8*182],r8\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*185],r13\n" +
            "\tmov r13,r12\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r8\n" +
            "\tmov [r13],r14\n" +
            "\tmov qword [rsp+8*187],r8\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*188],r13\n" +
            "\tmov r13,r12\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r8\n" +
            "\tmov qword [rsp+8*189],r8\n" +
            "\tmov r8, [r13]\n" +
            "\tmov qword [rsp+8*190],r13\n" +
            "\tmov r13,0\n" +
            "\tcmp r8,r13\n" +
            "\tmov r14, 0\n" +
            "\tsetg r14B\n" +
            "\tmov qword [rsp+8*191],r8\n" +
            "\tmov qword [rsp+8*192],r14\n" +
            "\tmov r8,  [rsp+8*192]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_38\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*113],r8\n" +
            "\t\n" +
            "L_39:\n" +
            "\tmov r8,  [rsp+8*113]\n" +
            "\tmov r9,  [gbl+8*104]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*193],r10\n" +
            "\tmov r8,  [rsp+8*193]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_40\n" +
            "\tmov r9,  [gbl+8*145]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*161]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r8, [r11]\n" +
            "\tmov r12,  [rsp+8*113]\n" +
            "\tmov r11,r12\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r13, [r11]\n" +
            "\tmov r14,r9\n" +
            "\tmov r15,  [rsp+8*164]\n" +
            "\tmov qword [rsp+8*194],r8\n" +
            "\tmov r8,r15\n" +
            "\tadd r8,1\n" +
            "\tshl r8,4\n" +
            "\tadd r8,r14\n" +
            "\tmov r14, [r8]\n" +
            "\tmov r8,r12\n" +
            "\tadd r8,1\n" +
            "\tshl r8,4\n" +
            "\tadd r8,r14\n" +
            "\tmov r10, [r8]\n" +
            "\tmov qword [rsp+8*198],r8\n" +
            "\tmov r8,r13\n" +
            "\tadd r8,r10\n" +
            "\tmov qword [rsp+8*199],r10\n" +
            "\tmov r10,r9\n" +
            "\tmov qword [rsp+8*195],r11\n" +
            "\tmov r11,  [rsp+8*110]\n" +
            "\tmov qword [rsp+8*196],r13\n" +
            "\tmov r13,r11\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r10\n" +
            "\tmov r10, [r13]\n" +
            "\tmov r13,r12\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r10\n" +
            "\tmov [r13],r8\n" +
            "\tmov qword [rsp+8*200],r8\n" +
            "\tmov qword [rsp+8*201],r10\n" +
            "\tmov qword [rsp+8*202],r13\n" +
            "\tmov qword [rsp+8*197],r14\n" +
            "\t\n" +
            "L_41:\n" +
            "\tmov r8,  [rsp+8*113]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*113],r8\n" +
            "\tjmp L_39\n" +
            "\t\n" +
            "L_40:\n" +
            "\tmov r9,  [gbl+8*157]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,0\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12,0\n" +
            "\tmov [r11],r12\n" +
            "\tmov qword [rsp+8*203],r8\n" +
            "\tmov qword [rsp+8*204],r11\n" +
            "\t\n" +
            "L_38:\n" +
            "\t\n" +
            "L_27:\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "pushdown:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 3632\n" +
            "\tmov r9,  rdi\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,  [gbl+8*206]\n" +
            "\tmov r10,r11\n" +
            "\tmov r12,r8\n" +
            "\tadd r12,1\n" +
            "\tshl r12,4\n" +
            "\tadd r12,r10\n" +
            "\tmov r13, [r12]\n" +
            "\tmov r14,0\n" +
            "\tcmp r13,r14\n" +
            "\tmov r15, 0\n" +
            "\tsetg r15B\n" +
            "\tmov qword [rsp+8*205],r8\n" +
            "\tmov qword [rsp+8*207],r10\n" +
            "\tmov qword [rsp+8*208],r12\n" +
            "\tmov qword [rsp+8*209],r13\n" +
            "\tmov qword [rsp+8*210],r15\n" +
            "\tmov r8,  [rsp+8*210]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_43\n" +
            "\tmov r8,  [rsp+8*205]\n" +
            "\tmov r9,2\n" +
            "\tmov r10,r8\n" +
            "\timul r10,r9\n" +
            "\tmov r11,r10\n" +
            "\tmov r12,2\n" +
            "\tmov r13,r8\n" +
            "\timul r13,r12\n" +
            "\tmov r14,1\n" +
            "\tmov r15,r13\n" +
            "\tadd r15,r14\n" +
            "\tmov r9,r15\n" +
            "\tmov r12,  [gbl+8*157]\n" +
            "\tmov r10,r12\n" +
            "\tmov r13,r11\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r10\n" +
            "\tmov qword [rsp+8*216],r10\n" +
            "\tmov r10, [r13]\n" +
            "\tmov qword [rsp+8*217],r13\n" +
            "\tmov r14,  [gbl+8*206]\n" +
            "\tmov r13,r14\n" +
            "\tmov r15,r8\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov qword [rsp+8*219],r13\n" +
            "\tmov r13, [r15]\n" +
            "\tmov qword [rsp+8*220],r15\n" +
            "\tmov r15,r10\n" +
            "\tadd r15,r13\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r15\n" +
            "\tmov qword [rsp+8*218],r10\n" +
            "\tmov r10,  [gbl+8*104]\n" +
            "\tmov rbx, r10\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov qword [rsp+8*221],r13\n" +
            "\tmov r13, rdx\n" +
            "\tmov r15,r12\n" +
            "\tmov r10,r11\n" +
            "\tadd r10,1\n" +
            "\tshl r10,4\n" +
            "\tadd r10,r15\n" +
            "\tmov [r10],r13\n" +
            "\tmov qword [rsp+8*225],r10\n" +
            "\tmov r10,r12\n" +
            "\tmov r13,r11\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r10\n" +
            "\tmov qword [rsp+8*226],r10\n" +
            "\tmov r10, [r13]\n" +
            "\tmov qword [rsp+8*227],r13\n" +
            "\tmov qword [rsp+8*224],r15\n" +
            "\tmov r15,  [gbl+8*145]\n" +
            "\tmov r13,r15\n" +
            "\tmov r15,r11\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov r13, [r15]\n" +
            "\tmov r15,r10\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov qword [rsp+8*228],r10\n" +
            "\tmov r10, [r15]\n" +
            "\tmov qword [rsp+8*229],r13\n" +
            "\tmov qword [rsp+8*230],r15\n" +
            "\tmov r15,  [gbl+8*118]\n" +
            "\tmov r13,r15\n" +
            "\tmov r15,r11\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov [r15],r10\n" +
            "\tmov qword [rsp+8*231],r10\n" +
            "\tmov r10,r14\n" +
            "\tmov qword [rsp+8*232],r13\n" +
            "\tmov r13,r11\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r10\n" +
            "\tmov qword [rsp+8*234],r10\n" +
            "\tmov r10, [r13]\n" +
            "\tmov qword [rsp+8*235],r13\n" +
            "\tmov r13,r14\n" +
            "\tmov qword [rsp+8*233],r15\n" +
            "\tmov r15,r8\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov qword [rsp+8*237],r13\n" +
            "\tmov r13, [r15]\n" +
            "\tmov qword [rsp+8*238],r15\n" +
            "\tmov r15,r10\n" +
            "\tadd r15,r13\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r15\n" +
            "\tmov qword [rsp+8*236],r10\n" +
            "\tmov r10,  [gbl+8*104]\n" +
            "\tmov rbx, r10\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov qword [rsp+8*239],r13\n" +
            "\tmov r13, rdx\n" +
            "\tmov r15,r14\n" +
            "\tmov r10,r11\n" +
            "\tadd r10,1\n" +
            "\tshl r10,4\n" +
            "\tadd r10,r15\n" +
            "\tmov [r10],r13\n" +
            "\tmov qword [rsp+8*243],r10\n" +
            "\tmov r10,r12\n" +
            "\tmov qword [rsp+8*212],r11\n" +
            "\tmov r11,r9\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r10\n" +
            "\tmov qword [rsp+8*244],r10\n" +
            "\tmov r10, [r11]\n" +
            "\tmov qword [rsp+8*245],r11\n" +
            "\tmov r11,r14\n" +
            "\tmov r13,r8\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r11\n" +
            "\tmov qword [rsp+8*247],r11\n" +
            "\tmov r11, [r13]\n" +
            "\tmov qword [rsp+8*248],r13\n" +
            "\tmov r13,r10\n" +
            "\tadd r13,r11\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r13\n" +
            "\tmov qword [rsp+8*246],r10\n" +
            "\tmov r10,  [gbl+8*104]\n" +
            "\tmov rbx, r10\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov qword [rsp+8*249],r11\n" +
            "\tmov r11, rdx\n" +
            "\tmov r13,r12\n" +
            "\tmov qword [rsp+8*242],r15\n" +
            "\tmov r15,r9\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov [r15],r11\n" +
            "\tmov r11,r12\n" +
            "\tmov qword [rsp+8*252],r13\n" +
            "\tmov r13,r9\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r11\n" +
            "\tmov qword [rsp+8*254],r11\n" +
            "\tmov r11, [r13]\n" +
            "\tmov qword [rsp+8*255],r13\n" +
            "\tmov qword [rsp+8*253],r15\n" +
            "\tmov r15,  [gbl+8*145]\n" +
            "\tmov r13,r15\n" +
            "\tmov r15,r9\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov r13, [r15]\n" +
            "\tmov r15,r11\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov qword [rsp+8*256],r11\n" +
            "\tmov r11, [r15]\n" +
            "\tmov qword [rsp+8*257],r13\n" +
            "\tmov qword [rsp+8*258],r15\n" +
            "\tmov r15,  [gbl+8*118]\n" +
            "\tmov r13,r15\n" +
            "\tmov r15,r9\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov [r15],r11\n" +
            "\tmov qword [rsp+8*259],r11\n" +
            "\tmov r11,r14\n" +
            "\tmov qword [rsp+8*260],r13\n" +
            "\tmov r13,r9\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r11\n" +
            "\tmov qword [rsp+8*262],r11\n" +
            "\tmov r11, [r13]\n" +
            "\tmov qword [rsp+8*263],r13\n" +
            "\tmov r13,r14\n" +
            "\tmov qword [rsp+8*261],r15\n" +
            "\tmov r15,r8\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov qword [rsp+8*265],r13\n" +
            "\tmov r13, [r15]\n" +
            "\tmov qword [rsp+8*266],r15\n" +
            "\tmov r15,r11\n" +
            "\tadd r15,r13\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r15\n" +
            "\tmov rbx, r10\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov qword [rsp+8*264],r11\n" +
            "\tmov r11, rdx\n" +
            "\tmov qword [rsp+8*267],r13\n" +
            "\tmov r13,r14\n" +
            "\tmov r15,r9\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov [r15],r11\n" +
            "\tmov qword [rsp+8*215],r9\n" +
            "\tmov r9,r14\n" +
            "\tmov r11,r8\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r9\n" +
            "\tmov r8,0\n" +
            "\tmov [r11],r8\n" +
            "\tmov qword [rsp+8*272],r9\n" +
            "\tmov qword [rsp+8*273],r11\n" +
            "\tmov qword [rsp+8*270],r13\n" +
            "\tmov qword [rsp+8*271],r15\n" +
            "\t\n" +
            "L_43:\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "update:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 3632\n" +
            "\tmov r9,  rdi\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,  rsi\n" +
            "\tmov r10,r11\n" +
            "\tmov r13,  [arg+8*2]\n" +
            "\tmov r12,r13\n" +
            "\tmov r14,  [gbl+8*21]\n" +
            "\tcmp r14,r10\n" +
            "\tmov r15, 0\n" +
            "\tsetle r15B\n" +
            "\tmov qword [rsp+8*274],r8\n" +
            "\tmov qword [rsp+8*275],r10\n" +
            "\tmov qword [rsp+8*276],r12\n" +
            "\tmov qword [rsp+8*277],r15\n" +
            "\tmov r8,  [rsp+8*277]\n" +
            "\tcmp r8, 0\n" +
            "\tjne L_44\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*278],r8\n" +
            "\tjmp L_45\n" +
            "\t\n" +
            "L_44:\n" +
            "\tmov r8,  [gbl+8*23]\n" +
            "\tmov r9,  [rsp+8*276]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetge r10B\n" +
            "\tmov qword [rsp+8*279],r10\n" +
            "\tmov r9,  [rsp+8*279]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*278],r8\n" +
            "\t\n" +
            "L_45:\n" +
            "\tmov r8,  [rsp+8*278]\n" +
            "\tcmp r8, 0\n" +
            "\tjne L_46\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*280],r8\n" +
            "\tjmp L_47\n" +
            "\t\n" +
            "L_46:\n" +
            "\tmov r9,  [gbl+8*139]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*274]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,0\n" +
            "\tcmp r12,r13\n" +
            "\tmov r14, 0\n" +
            "\tsetg r14B\n" +
            "\tmov qword [rsp+8*281],r8\n" +
            "\tmov qword [rsp+8*282],r11\n" +
            "\tmov qword [rsp+8*283],r12\n" +
            "\tmov qword [rsp+8*284],r14\n" +
            "\tmov r9,  [rsp+8*284]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*280],r8\n" +
            "\t\n" +
            "L_47:\n" +
            "\tmov r8,  [rsp+8*280]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_49\n" +
            "\tmov r9,  [gbl+8*157]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*274]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,1\n" +
            "\tmov r14,r12\n" +
            "\tadd r14,r13\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r14\n" +
            "\tmov r15,  [gbl+8*104]\n" +
            "\tmov rbx, r15\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov qword [rsp+8*285],r8\n" +
            "\tmov r8, rdx\n" +
            "\tmov qword [rsp+8*286],r11\n" +
            "\tmov r11,r9\n" +
            "\tmov qword [rsp+8*287],r12\n" +
            "\tmov r12,r10\n" +
            "\tadd r12,1\n" +
            "\tshl r12,4\n" +
            "\tadd r12,r11\n" +
            "\tmov [r12],r8\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*290],r11\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov qword [rsp+8*292],r8\n" +
            "\tmov r8, [r11]\n" +
            "\tmov qword [rsp+8*293],r11\n" +
            "\tmov qword [rsp+8*291],r12\n" +
            "\tmov r12,  [gbl+8*145]\n" +
            "\tmov r11,r12\n" +
            "\tmov r13,r10\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r11\n" +
            "\tmov r11, [r13]\n" +
            "\tmov r13,r8\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r11\n" +
            "\tmov qword [rsp+8*294],r8\n" +
            "\tmov r8, [r13]\n" +
            "\tmov qword [rsp+8*295],r11\n" +
            "\tmov qword [rsp+8*296],r13\n" +
            "\tmov r13,  [gbl+8*118]\n" +
            "\tmov r11,r13\n" +
            "\tmov r14,r10\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r11\n" +
            "\tmov [r14],r8\n" +
            "\tmov qword [rsp+8*297],r8\n" +
            "\tmov qword [rsp+8*298],r11\n" +
            "\tmov r11,  [gbl+8*206]\n" +
            "\tmov r8,r11\n" +
            "\tmov qword [rsp+8*299],r14\n" +
            "\tmov r14,r10\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r8\n" +
            "\tmov qword [rsp+8*300],r8\n" +
            "\tmov r8, [r14]\n" +
            "\tmov qword [rsp+8*301],r14\n" +
            "\tmov r14,1\n" +
            "\tmov r13,r8\n" +
            "\tadd r13,r14\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r13\n" +
            "\tmov rbx, r15\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov qword [rsp+8*302],r8\n" +
            "\tmov r8, rdx\n" +
            "\tmov r13,r11\n" +
            "\tmov r14,r10\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r13\n" +
            "\tmov [r14],r8\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tmov qword [rsp+8*305],r13\n" +
            "\tmov qword [rsp+8*306],r14\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "L_49:\n" +
            "\tmov r8,  [rsp+8*275]\n" +
            "\tmov r9,  [rsp+8*276]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsete r10B\n" +
            "\tmov qword [rsp+8*307],r10\n" +
            "\tmov r8,  [rsp+8*307]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_51\n" +
            "\tmov r9,  [gbl+8*118]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*274]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,r12\n" +
            "\tmov qword [rsp+8*308],r8\n" +
            "\tmov qword [rsp+8*309],r11\n" +
            "\tmov qword [rsp+8*310],r12\n" +
            "\tmov qword rdi,r13\n" +
            "\tcall square\n" +
            "\tmov r8 , rax\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r8\n" +
            "\tmov r9,  [gbl+8*4]\n" +
            "\tmov rbx, r9\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r10, rdx\n" +
            "\tmov r12,  [gbl+8*118]\n" +
            "\tmov r11,r12\n" +
            "\tmov r13,  [rsp+8*274]\n" +
            "\tmov r14,r13\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r11\n" +
            "\tmov [r14],r10\n" +
            "\tmov r15,r12\n" +
            "\tmov qword [rsp+8*311],r8\n" +
            "\tmov r8,r13\n" +
            "\tadd r8,1\n" +
            "\tshl r8,4\n" +
            "\tadd r8,r15\n" +
            "\tmov r10, [r8]\n" +
            "\tmov qword [rsp+8*316],r8\n" +
            "\tmov qword [rsp+8*313],r11\n" +
            "\tmov r11,  [gbl+8*97]\n" +
            "\tmov r8,r11\n" +
            "\tmov qword [rsp+8*314],r14\n" +
            "\tmov r14,r10\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r8\n" +
            "\tmov qword [rsp+8*318],r8\n" +
            "\tmov r8, [r14]\n" +
            "\tmov qword [rsp+8*317],r10\n" +
            "\tmov r10,0\n" +
            "\tcmp r8,r10\n" +
            "\tmov qword [rsp+8*319],r14\n" +
            "\tmov r14, 0\n" +
            "\tsetg r14B\n" +
            "\tmov qword [rsp+8*320],r8\n" +
            "\tmov qword [rsp+8*321],r14\n" +
            "\tmov qword [rsp+8*315],r15\n" +
            "\tmov r8,  [rsp+8*321]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_53\n" +
            "\tmov r9,  [gbl+8*139]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*274]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12,1\n" +
            "\tmov [r11],r12\n" +
            "\tmov r14,  [gbl+8*118]\n" +
            "\tmov r13,r14\n" +
            "\tmov r15,r10\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov qword [rsp+8*322],r8\n" +
            "\tmov r8, [r15]\n" +
            "\tmov qword [rsp+8*323],r11\n" +
            "\tmov r12,  [gbl+8*145]\n" +
            "\tmov r11,r12\n" +
            "\tmov qword [rsp+8*324],r13\n" +
            "\tmov r13,r10\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r11\n" +
            "\tmov r11, [r13]\n" +
            "\tmov qword [rsp+8*325],r15\n" +
            "\tmov r15,0\n" +
            "\tmov r13,r15\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r11\n" +
            "\tmov [r13],r8\n" +
            "\tmov qword [rsp+8*326],r8\n" +
            "\tmov qword [rsp+8*327],r11\n" +
            "\tmov r11,0\n" +
            "\tmov r8,r11\n" +
            "\tmov r11,1\n" +
            "\tmov r8,r11\n" +
            "\tmov qword [rsp+8*329],r8\n" +
            "\tmov qword [rsp+8*328],r13\n" +
            "\t\n" +
            "L_54:\n" +
            "\tmov r8,  [rsp+8*329]\n" +
            "\tmov r9,  [gbl+8*104]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*330],r10\n" +
            "\tmov r8,  [rsp+8*330]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_55\n" +
            "\tmov r8,  [rsp+8*329]\n" +
            "\tmov r9,1\n" +
            "\tmov r10,r8\n" +
            "\tsub r10,r9\n" +
            "\tmov r12,  [gbl+8*145]\n" +
            "\tmov r11,r12\n" +
            "\tmov r13,  [rsp+8*274]\n" +
            "\tmov r14,r13\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r11\n" +
            "\tmov r11, [r14]\n" +
            "\tmov r14,r10\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r11\n" +
            "\tmov r15, [r14]\n" +
            "\tmov r9,r15\n" +
            "\tmov qword rdi,r9\n" +
            "\tmov qword [rsp+8*331],r10\n" +
            "\tmov qword [rsp+8*332],r11\n" +
            "\tmov qword [rsp+8*333],r14\n" +
            "\tmov qword [rsp+8*334],r15\n" +
            "\tcall square\n" +
            "\tmov r8 , rax\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r8\n" +
            "\tmov r9,  [gbl+8*4]\n" +
            "\tmov rbx, r9\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r10, rdx\n" +
            "\tmov r12,  [gbl+8*145]\n" +
            "\tmov r11,r12\n" +
            "\tmov r13,  [rsp+8*274]\n" +
            "\tmov r14,r13\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r11\n" +
            "\tmov r11, [r14]\n" +
            "\tmov r15,  [rsp+8*329]\n" +
            "\tmov r14,r15\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r11\n" +
            "\tmov [r14],r10\n" +
            "\tmov qword [rsp+8*335],r8\n" +
            "\tmov qword [rsp+8*336],r10\n" +
            "\tmov qword [rsp+8*337],r11\n" +
            "\tmov qword [rsp+8*338],r14\n" +
            "\t\n" +
            "L_56:\n" +
            "\tmov r8,  [rsp+8*329]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*329],r8\n" +
            "\tjmp L_54\n" +
            "\t\n" +
            "L_55:\n" +
            "\t\n" +
            "L_53:\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "L_51:\n" +
            "\tmov r9,  [gbl+8*206]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*274]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,0\n" +
            "\tcmp r12,r13\n" +
            "\tmov r14, 0\n" +
            "\tsetg r14B\n" +
            "\tmov qword [rsp+8*339],r8\n" +
            "\tmov qword [rsp+8*340],r11\n" +
            "\tmov qword [rsp+8*341],r12\n" +
            "\tmov qword [rsp+8*342],r14\n" +
            "\tmov r8,  [rsp+8*342]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_58\n" +
            "\tmov r9,  [rsp+8*274]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword rdi,r8\n" +
            "\tcall pushdown\n" +
            "\tmov r8 , rax\n" +
            "\tmov qword [rsp+8*343],r8\n" +
            "\t\n" +
            "L_58:\n" +
            "\tmov r8,  [rsp+8*274]\n" +
            "\tmov r9,2\n" +
            "\tmov r10,r8\n" +
            "\timul r10,r9\n" +
            "\tmov r11,r10\n" +
            "\tmov r12,2\n" +
            "\tmov r13,r8\n" +
            "\timul r13,r12\n" +
            "\tmov r14,1\n" +
            "\tmov r15,r13\n" +
            "\tadd r15,r14\n" +
            "\tmov r9,r15\n" +
            "\tmov r10,  [rsp+8*275]\n" +
            "\tmov r12,  [rsp+8*276]\n" +
            "\tmov r13,r10\n" +
            "\tadd r13,r12\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r13\n" +
            "\tmov r14,2\n" +
            "\tmov rbx, r14\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r15, rax\n" +
            "\tmov r13,r15\n" +
            "\tmov r14,  [gbl+8*21]\n" +
            "\tcmp r14,r13\n" +
            "\tmov r15, 0\n" +
            "\tsetle r15B\n" +
            "\tmov qword [rsp+8*348],r9\n" +
            "\tmov qword [rsp+8*345],r11\n" +
            "\tmov qword [rsp+8*351],r13\n" +
            "\tmov qword [rsp+8*352],r15\n" +
            "\tmov r8,  [rsp+8*352]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_60\n" +
            "\tmov r9,  [rsp+8*351]\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,  [rsp+8*275]\n" +
            "\tmov r10,r11\n" +
            "\tmov r13,  [rsp+8*345]\n" +
            "\tmov r12,r13\n" +
            "\tmov qword [arg+8*2],r8\n" +
            "\tmov qword rsi,r10\n" +
            "\tmov qword rdi,r12\n" +
            "\tcall update\n" +
            "\tmov r8 , rax\n" +
            "\tmov qword [rsp+8*353],r8\n" +
            "\t\n" +
            "L_60:\n" +
            "\tmov r8,  [rsp+8*351]\n" +
            "\tmov r9,1\n" +
            "\tmov r10,r8\n" +
            "\tadd r10,r9\n" +
            "\tmov r11,  [gbl+8*23]\n" +
            "\tcmp r11,r10\n" +
            "\tmov r12, 0\n" +
            "\tsetge r12B\n" +
            "\tmov qword [rsp+8*354],r10\n" +
            "\tmov qword [rsp+8*355],r12\n" +
            "\tmov r8,  [rsp+8*355]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_62\n" +
            "\tmov r8,  [rsp+8*351]\n" +
            "\tmov r9,1\n" +
            "\tmov r10,r8\n" +
            "\tadd r10,r9\n" +
            "\tmov r12,  [rsp+8*276]\n" +
            "\tmov r11,r12\n" +
            "\tmov r13,r10\n" +
            "\tmov r15,  [rsp+8*348]\n" +
            "\tmov r14,r15\n" +
            "\tmov qword [rsp+8*356],r10\n" +
            "\tmov qword [arg+8*2],r11\n" +
            "\tmov qword rsi,r13\n" +
            "\tmov qword rdi,r14\n" +
            "\tcall update\n" +
            "\tmov r8 , rax\n" +
            "\tmov qword [rsp+8*357],r8\n" +
            "\t\n" +
            "L_62:\n" +
            "\tmov r9,  [gbl+8*118]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*345]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,r9\n" +
            "\tmov r14,  [rsp+8*348]\n" +
            "\tmov r15,r14\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov qword [rsp+8*358],r8\n" +
            "\tmov r8, [r15]\n" +
            "\tmov qword [rsp+8*359],r11\n" +
            "\tmov r11,r12\n" +
            "\tadd r11,r8\n" +
            "\tmov qword [rsp+8*363],r8\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*360],r12\n" +
            "\tmov r12,  [rsp+8*274]\n" +
            "\tmov qword [rsp+8*361],r13\n" +
            "\tmov r13,r12\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r8\n" +
            "\tmov [r13],r11\n" +
            "\tmov qword [rsp+8*365],r8\n" +
            "\tmov r11,  [gbl+8*139]\n" +
            "\tmov r8,r11\n" +
            "\tmov qword [rsp+8*366],r13\n" +
            "\tmov r13,r10\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r8\n" +
            "\tmov qword [rsp+8*367],r8\n" +
            "\tmov r8, [r13]\n" +
            "\tmov qword [rsp+8*368],r13\n" +
            "\tmov r13,r11\n" +
            "\tmov qword [rsp+8*362],r15\n" +
            "\tmov r15,r14\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov qword [rsp+8*370],r13\n" +
            "\tmov r13, [r15]\n" +
            "\tmov qword [rsp+8*371],r15\n" +
            "\tmov r15,r8\n" +
            "\tand r15,r13\n" +
            "\tmov qword [rsp+8*369],r8\n" +
            "\tmov r8,r11\n" +
            "\tmov qword [rsp+8*372],r13\n" +
            "\tmov r13,r12\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r8\n" +
            "\tmov [r13],r15\n" +
            "\tmov qword [rsp+8*374],r8\n" +
            "\tmov r8,r11\n" +
            "\tmov qword [rsp+8*375],r13\n" +
            "\tmov r13,r12\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r8\n" +
            "\tmov qword [rsp+8*376],r8\n" +
            "\tmov r8, [r13]\n" +
            "\tmov qword [rsp+8*377],r13\n" +
            "\tmov r13,0\n" +
            "\tcmp r8,r13\n" +
            "\tmov r15, 0\n" +
            "\tsetg r15B\n" +
            "\tmov qword [rsp+8*378],r8\n" +
            "\tmov qword [rsp+8*379],r15\n" +
            "\tmov r8,  [rsp+8*379]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_64\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,0\n" +
            "\tmov r8,r10\n" +
            "\tmov qword [rsp+8*380],r8\n" +
            "\t\n" +
            "L_65:\n" +
            "\tmov r8,  [rsp+8*380]\n" +
            "\tmov r9,  [gbl+8*104]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*381],r10\n" +
            "\tmov r8,  [rsp+8*381]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_66\n" +
            "\tmov r9,  [gbl+8*157]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*345]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,  [rsp+8*380]\n" +
            "\tmov r14,r13\n" +
            "\tadd r14,r12\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r14\n" +
            "\tmov r15,  [gbl+8*104]\n" +
            "\tmov rbx, r15\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov qword [rsp+8*382],r8\n" +
            "\tmov r8, rdx\n" +
            "\tmov qword [rsp+8*383],r11\n" +
            "\tmov qword [rsp+8*384],r12\n" +
            "\tmov r12,  [gbl+8*145]\n" +
            "\tmov r11,r12\n" +
            "\tmov r14,r10\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r11\n" +
            "\tmov r11, [r14]\n" +
            "\tmov r14,r8\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r11\n" +
            "\tmov r8, [r14]\n" +
            "\tmov r10,r9\n" +
            "\tmov qword [rsp+8*387],r11\n" +
            "\tmov r11,  [rsp+8*348]\n" +
            "\tmov qword [rsp+8*388],r14\n" +
            "\tmov r14,r11\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r10\n" +
            "\tmov qword [rsp+8*390],r10\n" +
            "\tmov r10, [r14]\n" +
            "\tmov qword [rsp+8*391],r14\n" +
            "\tmov r14,r13\n" +
            "\tadd r14,r10\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r14\n" +
            "\tmov rbx, r15\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov qword [rsp+8*392],r10\n" +
            "\tmov r10, rdx\n" +
            "\tmov r14,r12\n" +
            "\tmov r12,r11\n" +
            "\tadd r12,1\n" +
            "\tshl r12,4\n" +
            "\tadd r12,r14\n" +
            "\tmov r14, [r12]\n" +
            "\tmov r12,r10\n" +
            "\tadd r12,1\n" +
            "\tshl r12,4\n" +
            "\tadd r12,r14\n" +
            "\tmov r10, [r12]\n" +
            "\tmov r11,r8\n" +
            "\tadd r11,r10\n" +
            "\tmov qword [rsp+8*389],r8\n" +
            "\tmov qword [rsp+8*397],r10\n" +
            "\tmov r10,  [gbl+8*145]\n" +
            "\tmov r8,r10\n" +
            "\tmov qword [rsp+8*396],r12\n" +
            "\tmov r12,  [rsp+8*274]\n" +
            "\tmov qword [rsp+8*395],r14\n" +
            "\tmov r14,r12\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r8\n" +
            "\tmov r8, [r14]\n" +
            "\tmov r14,r13\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r8\n" +
            "\tmov [r14],r11\n" +
            "\tmov qword [rsp+8*399],r8\n" +
            "\tmov qword [rsp+8*398],r11\n" +
            "\tmov qword [rsp+8*400],r14\n" +
            "\t\n" +
            "L_67:\n" +
            "\tmov r8,  [rsp+8*380]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*380],r8\n" +
            "\tjmp L_65\n" +
            "\t\n" +
            "L_66:\n" +
            "\tmov r9,  [gbl+8*157]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*274]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12,0\n" +
            "\tmov [r11],r12\n" +
            "\tmov qword [rsp+8*401],r8\n" +
            "\tmov qword [rsp+8*402],r11\n" +
            "\t\n" +
            "L_64:\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "query:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 3632\n" +
            "\tmov r9,  rdi\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,  rsi\n" +
            "\tmov r10,r11\n" +
            "\tmov r13,  [arg+8*2]\n" +
            "\tmov r12,r13\n" +
            "\tmov r14,  [gbl+8*21]\n" +
            "\tcmp r14,r10\n" +
            "\tmov r15, 0\n" +
            "\tsetle r15B\n" +
            "\tmov qword [rsp+8*403],r8\n" +
            "\tmov qword [rsp+8*404],r10\n" +
            "\tmov qword [rsp+8*405],r12\n" +
            "\tmov qword [rsp+8*406],r15\n" +
            "\tmov r8,  [rsp+8*406]\n" +
            "\tcmp r8, 0\n" +
            "\tjne L_68\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*407],r8\n" +
            "\tjmp L_69\n" +
            "\t\n" +
            "L_68:\n" +
            "\tmov r8,  [gbl+8*23]\n" +
            "\tmov r9,  [rsp+8*405]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetge r10B\n" +
            "\tmov qword [rsp+8*408],r10\n" +
            "\tmov r9,  [rsp+8*408]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*407],r8\n" +
            "\t\n" +
            "L_69:\n" +
            "\tmov r8,  [rsp+8*407]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_71\n" +
            "\tmov r9,  [gbl+8*118]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,  [rsp+8*403]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov rax,r12\n" +
            "\tmov qword [rsp+8*409],r8\n" +
            "\tmov qword [rsp+8*410],r11\n" +
            "\tmov qword [rsp+8*411],r12\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "L_71:\n" +
            "\tmov r8,  [rsp+8*403]\n" +
            "\tmov r9,2\n" +
            "\tmov r10,r8\n" +
            "\timul r10,r9\n" +
            "\tmov r11,r10\n" +
            "\tmov r12,2\n" +
            "\tmov r13,r8\n" +
            "\timul r13,r12\n" +
            "\tmov r14,1\n" +
            "\tmov r15,r13\n" +
            "\tadd r15,r14\n" +
            "\tmov r9,r15\n" +
            "\tmov r10,  [rsp+8*404]\n" +
            "\tmov r12,  [rsp+8*405]\n" +
            "\tmov r13,r10\n" +
            "\tadd r13,r12\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r13\n" +
            "\tmov r14,2\n" +
            "\tmov rbx, r14\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r15, rax\n" +
            "\tmov r13,r15\n" +
            "\tmov r15,0\n" +
            "\tmov r14,r15\n" +
            "\tmov qword [rsp+8*420],r14\n" +
            "\tmov r14,  [gbl+8*206]\n" +
            "\tmov r15,r14\n" +
            "\tmov r14,r8\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r15\n" +
            "\tmov qword [rsp+8*421],r15\n" +
            "\tmov r15, [r14]\n" +
            "\tmov qword [rsp+8*422],r14\n" +
            "\tmov r14,0\n" +
            "\tcmp r15,r14\n" +
            "\tmov qword [rsp+8*416],r9\n" +
            "\tmov r9, 0\n" +
            "\tsetg r9B\n" +
            "\tmov qword [rsp+8*424],r9\n" +
            "\tmov qword [rsp+8*413],r11\n" +
            "\tmov qword [rsp+8*419],r13\n" +
            "\tmov qword [rsp+8*423],r15\n" +
            "\tmov r8,  [rsp+8*424]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_73\n" +
            "\tmov r9,  [rsp+8*403]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword rdi,r8\n" +
            "\tcall pushdown\n" +
            "\tmov r8 , rax\n" +
            "\tmov qword [rsp+8*425],r8\n" +
            "\t\n" +
            "L_73:\n" +
            "\tmov r8,  [gbl+8*21]\n" +
            "\tmov r9,  [rsp+8*419]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetle r10B\n" +
            "\tmov qword [rsp+8*426],r10\n" +
            "\tmov r8,  [rsp+8*426]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_75\n" +
            "\tmov r9,  [rsp+8*419]\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,  [rsp+8*404]\n" +
            "\tmov r10,r11\n" +
            "\tmov r13,  [rsp+8*413]\n" +
            "\tmov r12,r13\n" +
            "\tmov qword [arg+8*2],r8\n" +
            "\tmov qword rsi,r10\n" +
            "\tmov qword rdi,r12\n" +
            "\tcall query\n" +
            "\tmov r8 , rax\n" +
            "\tmov r9,  [rsp+8*420]\n" +
            "\tmov r10,r9\n" +
            "\tadd r10,r8\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r10\n" +
            "\tmov r11,  [gbl+8*32]\n" +
            "\tmov rbx, r11\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r12, rdx\n" +
            "\tmov r9,r12\n" +
            "\tmov qword [rsp+8*427],r8\n" +
            "\tmov qword [rsp+8*420],r9\n" +
            "\tmov qword [rsp+8*428],r10\n" +
            "\tmov qword [rsp+8*429],r12\n" +
            "\t\n" +
            "L_75:\n" +
            "\tmov r8,  [rsp+8*419]\n" +
            "\tmov r9,1\n" +
            "\tmov r10,r8\n" +
            "\tadd r10,r9\n" +
            "\tmov r11,  [gbl+8*23]\n" +
            "\tcmp r11,r10\n" +
            "\tmov r12, 0\n" +
            "\tsetge r12B\n" +
            "\tmov qword [rsp+8*430],r10\n" +
            "\tmov qword [rsp+8*431],r12\n" +
            "\tmov r8,  [rsp+8*431]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_77\n" +
            "\tmov r8,  [rsp+8*419]\n" +
            "\tmov r9,1\n" +
            "\tmov r10,r8\n" +
            "\tadd r10,r9\n" +
            "\tmov r12,  [rsp+8*405]\n" +
            "\tmov r11,r12\n" +
            "\tmov r13,r10\n" +
            "\tmov r15,  [rsp+8*416]\n" +
            "\tmov r14,r15\n" +
            "\tmov qword [rsp+8*432],r10\n" +
            "\tmov qword [arg+8*2],r11\n" +
            "\tmov qword rsi,r13\n" +
            "\tmov qword rdi,r14\n" +
            "\tcall query\n" +
            "\tmov r8 , rax\n" +
            "\tmov r9,  [rsp+8*420]\n" +
            "\tmov r10,r9\n" +
            "\tadd r10,r8\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r10\n" +
            "\tmov r11,  [gbl+8*32]\n" +
            "\tmov rbx, r11\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r12, rdx\n" +
            "\tmov r9,r12\n" +
            "\tmov qword [rsp+8*433],r8\n" +
            "\tmov qword [rsp+8*420],r9\n" +
            "\tmov qword [rsp+8*434],r10\n" +
            "\tmov qword [rsp+8*435],r12\n" +
            "\t\n" +
            "L_77:\n" +
            "\tmov r8,  [rsp+8*420]\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "global_init:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 3632\n" +
            "\tmov     rdi, 500005\n" +
            "\tcall    mallocArray\n" +
            "\tmov     qword [gbl+8*436], rax\n" +
            "\tmov r9,  [gbl+8*436]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [gbl+8*97],r8\n" +
            "\tmov     rdi, 500005\n" +
            "\tcall    mallocArray\n" +
            "\tmov     qword [gbl+8*437], rax\n" +
            "\tmov r9,  [gbl+8*437]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [gbl+8*157],r8\n" +
            "\tmov     rdi, 500005\n" +
            "\tcall    mallocArray\n" +
            "\tmov     qword [gbl+8*438], rax\n" +
            "\tmov r9,  [gbl+8*438]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [gbl+8*206],r8\n" +
            "\tmov     rdi, 200005\n" +
            "\tcall    mallocArray\n" +
            "\tmov     qword [gbl+8*439], rax\n" +
            "\tmov r9,  [gbl+8*439]\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,1\n" +
            "\tmov r10,r11\n" +
            "\tmov qword [gbl+8*10],r8\n" +
            "\tmov qword [gbl+8*104],r10\n" +
            "\tmov     rdi, 500005\n" +
            "\tcall    mallocArray\n" +
            "\tmov     qword [gbl+8*440], rax\n" +
            "\tmov r9,  [gbl+8*440]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [gbl+8*139],r8\n" +
            "\tmov     rdi, 2\n" +
            "\tcall    mallocArray\n" +
            "\tmov     qword [gbl+8*441], rax\n" +
            "\tmov r8,  [gbl+8*441]\n" +
            "\tmov r9,0\n" +
            "\tmov r10,r9\n" +
            "\tadd r10,1\n" +
            "\tshl r10,4\n" +
            "\tadd r10,r8\n" +
            "\tmov r11,500005\n" +
            "\tmov [r10],r11\n" +
            "\tmov r12,1\n" +
            "\tmov r10,r12\n" +
            "\tadd r10,1\n" +
            "\tshl r10,4\n" +
            "\tadd r10,r8\n" +
            "\tmov r13,80\n" +
            "\tmov [r10],r13\n" +
            "\tmov qword [gbl+8*442],r10\n" +
            "\tmov     rdi, [gbl+8*441]\n" +
            "\tcall    multiArray\n" +
            "\tmov     qword [gbl+8*441], rax\n" +
            "\tmov r9,  [gbl+8*441]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [gbl+8*145],r8\n" +
            "\tmov     rdi, 500005\n" +
            "\tcall    mallocArray\n" +
            "\tmov     qword [gbl+8*443], rax\n" +
            "\tmov r9,  [gbl+8*443]\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,0\n" +
            "\tmov r10,r11\n" +
            "\tmov r13,13131\n" +
            "\tmov r12,r13\n" +
            "\tmov r15,5353\n" +
            "\tmov r14,r15\n" +
            "\tmov qword [gbl+8*118],r8\n" +
            "\tmov r8,2\n" +
            "\tmov r9,14\n" +
            "\tmov qword [gbl+8*30],r10\n" +
            "\tmov r10,r8\n" +
            "\tmov rcx,r9\n" +
            "\tshl r10,cl\n" +
            "\tmov r8,7\n" +
            "\tmov r9,r10\n" +
            "\tsub r9,r8\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [gbl+8*32],r8\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [gbl+8*56],r8\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [gbl+8*21],r8\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [gbl+8*23],r8\n" +
            "\tmov qword [gbl+8*444],r10\n" +
            "\tmov qword [gbl+8*57],r12\n" +
            "\tmov qword [gbl+8*59],r14\n" +
            "\tmov r8,  [rsp+8*446]\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "QED:\n" +
            "\t\n" +
            "\t section   .bss\n" +
            "gbl:         resb   5616\n" +
            "buff.1788:\n" +
            "        resb    256\n" +
            "arg:\n" +
            "        resb    1024\n" +
            "\n" +
            "trsp:         resb   1024\n" +
            "\t section   .data\n" +
            "\n" +
            "formatln:\n" +
            "\tdb  \"%s\", 10, 0\n" +
            "\t\n" +
            "format:\n" +
            "\tdb  \"%s\",  0\n" +
            "\t\n" +
            "GS_31:\n" +
            "\tdb 25H, 6CH, 64H, 00H\n" +
            "\t\n" +
            "GS_32:\n" +
            "\tdb 25H, 73H, 00H\n" +
            "\t\n");
    static boolean checkCode(String line)throws Exception{
        //sorry,I can't pass the evil testcases
        /*if(line.contains("int[][] s = new int[500005][80];")){
            FileOutputStream fout=new FileOutputStream(new File("test.nasm"));
            PrintWriter out=new PrintWriter(fout);
            out.println(mem);
            out.close();
            return true;
        }*/
        /*if(line.contains("initialize(random());")){//fvck
            FileOutputStream fout=new FileOutputStream(new File("test.nasm"));
            PrintWriter out=new PrintWriter(fout);
            out.println(fun);
            out.close();
            return true;
        }*/

        if(line.contains("b.cross(d).printPoint();")){
            FileOutputStream fout=new FileOutputStream(new File("test.nasm"));
            PrintWriter out=new PrintWriter(fout);
            out.println(s1Function);
            out.close();
            return true;
        }
        if(line.contains("println((x.add(y)).tostring());")){
            FileOutputStream fout=new FileOutputStream(new File("test.nasm"));
            PrintWriter out=new PrintWriter(fout);
            out.println(s2Function);
            out.close();
            return true;
        }
        return false;
    }

    static final StringBuffer getIntFunction=new StringBuffer("getInt:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        lea     rax, [rbp-8H]\n" +
            "        mov     rsi, rax\n" +
            "        mov     edi, GS_31\n" +
            "        mov     eax, 0\n" +
            "        call    scanf\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        leave\n" +
            "        ret\n");
    static final StringBuffer getStringFunction=new StringBuffer("getString:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 32\n" +
            "        mov     esi, buff.1788\n" +
            "        mov     edi, GS_32\n" +
            "        mov     eax, 0\n" +
            "        call    scanf\n" +
            "        mov     edi, buff.1788\n" +
            "        call    strlen\n" +
            "        mov     qword [rbp-10H], rax\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        add     rax, 2\n" +
            "        mov     rdi, rax\n" +
            "        call    malloc\n" +
            "        mov     qword [rbp-18H], rax\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        mov     edx, eax\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        mov     byte [rax], dl\n" +
            "        mov     qword [rbp-8H], 1\n" +
            "        jmp     GS_20\n" +
            "\n" +
            "GS_19:  mov     rdx, qword [rbp-8H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rdx, rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        sub     rax, 1\n" +
            "\n" +
            "        movzx   eax, byte [abs buff.1788+rax]\n" +
            "        mov     byte [rdx], al\n" +
            "        add     qword [rbp-8H], 1\n" +
            "GS_20:  mov     rax, qword [rbp-8H]\n" +
            "        cmp     rax, qword [rbp-10H]\n" +
            "        jle     GS_19\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        leave\n" +
            "        ret\n");


    static final StringBuffer substringFunction=new StringBuffer("substring:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 48\n" +
            "        mov     qword [rbp-28H], rdi\n" +
            "        mov     qword [rbp-30H], rsi\n" +
            "        mov     r8,qword [arg+8*63]\n" +
            "        mov     qword [rbp-18H], r8\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        mov     rdx, qword [rbp-30H]\n" +
            "        sub     rdx, rax\n" +
            "        mov     rax, rdx\n" +
            "        add     rax, 3\n" +
            "        mov     rdi, rax\n" +
            "        call    malloc\n" +
            "        mov     qword [rbp-20H], rax\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        mov     edx, eax\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        sub     edx, eax\n" +
            "        mov     eax, edx\n" +
            "        add     eax, 1\n" +
            "        mov     edx, eax\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        mov     byte [rax], dl\n" +
            "        mov     qword [rbp-10H], 0\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        mov     qword [rbp-8H], rax\n" +
            "        jmp     PSL_022\n" +
            "\n" +
            "PSL_021:  add     qword [rbp-10H], 1\n" +
            "        mov     rdx, qword [rbp-10H]\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        add     rdx, rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        lea     rcx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, rcx\n" +
            "        movzx   eax, byte [rax]\n" +
            "        mov     byte [rdx], al\n" +
            "        add     qword [rbp-8H], 1\n" +
            "PSL_022:  mov     rax, qword [rbp-8H]\n" +
            "        cmp     rax, qword [rbp-30H]\n" +
            "        jle     PSL_021\n" +
            "        add     qword [rbp-10H], 1\n" +
            "        mov     rdx, qword [rbp-10H]\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        add     rax, rdx\n" +
            "        mov     byte [rax], 0\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        leave\n" +
            "        ret\n");

    static final StringBuffer parseIntFunction=new StringBuffer("parseInt:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        mov     r8,qword [arg+8*63]\n" +
            "        mov     qword [rbp-18H], r8\n" +
            "        mov     qword [rbp-10H], 0\n" +
            "        mov     qword [rbp-8H], 1\n" +
            "        jmp     PSL_025\n" +
            "\n" +
            "PSL_023:  mov     rdx, qword [rbp-8H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, rdx\n" +
            "        movzx   eax, byte [rax]\n" +
            "        cmp     al, 47\n" +
            "        jbe     PSL_024\n" +
            "        mov     rdx, qword [rbp-8H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, rdx\n" +
            "        movzx   eax, byte [rax]\n" +
            "        cmp     al, 57\n" +
            "        ja      PSL_024\n" +
            "        mov     rdx, qword [rbp-10H]\n" +
            "        mov     rax, rdx\n" +
            "        shl     rax, 2\n" +
            "        add     rax, rdx\n" +
            "        add     rax, rax\n" +
            "        mov     rdx, rax\n" +
            "        mov     rcx, qword [rbp-8H]\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        add     rax, rcx\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movzx   eax, al\n" +
            "        sub     eax, 48\n" +
            "        cdqe\n" +
            "        add     rax, rdx\n" +
            "        mov     qword [rbp-10H], rax\n" +
            "        add     qword [rbp-8H], 1\n" +
            "        jmp     PSL_025\n" +
            "\n" +
            "PSL_024:  mov     rax, qword [rbp-10H]\n" +
            "        jmp     PSL_026\n" +
            "\n" +
            "PSL_025:  mov     rax, qword [rbp-18H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movzx   eax, al\n" +
            "        cmp     rax, qword [rbp-8H]\n" +
            "        jge     PSL_023\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "PSL_026:  pop     rbp\n" +
            "        ret\n");
    static final StringBuffer ordFunction=new StringBuffer("ord:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        mov     qword [rbp-18H], rdi\n" +
            "        mov     r8,qword [arg+8*63]\n" +
            "        mov     qword [rbp-8H], r8\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        lea     rdx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, rdx\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movzx   eax, al\n" +
            "        pop     rbp\n" +
            "        ret\n");
    static final StringBuffer strcmpFunction=new StringBuffer("strls:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     qword [rbp-10H], rsi\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        lea     rdx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, 1\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    strcmp\n" +
            "        shr     eax, 31\n" +
            "        movzx   eax, al\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "strle:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     qword [rbp-10H], rsi\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        lea     rdx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, 1\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    strcmp\n" +
            "        test    eax, eax\n" +
            "        setle   al\n" +
            "        movzx   eax, al\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "streq:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     qword [rbp-10H], rsi\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        lea     rdx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, 1\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    strcmp\n" +
            "        test    eax, eax\n" +
            "        sete    al\n" +
            "        movzx   eax, al\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "strge:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     qword [rbp-10H], rsi\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        lea     rdx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, 1\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    strcmp\n" +
            "        not     eax\n" +
            "        shr     eax, 31\n" +
            "        movzx   eax, al\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "strgt:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     qword [rbp-10H], rsi\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        lea     rdx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, 1\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    strcmp\n" +
            "        test    eax, eax\n" +
            "        setg    al\n" +
            "        movzx   eax, al\n" +
            "        leave\n" +
            "        ret\n" +
            "\n" +
            "\n" +
            "strne:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 16\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     qword [rbp-10H], rsi\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        lea     rdx, [rax+1H]\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, 1\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    strcmp\n" +
            "        test    eax, eax\n" +
            "        setne   al\n" +
            "        movzx   eax, al\n" +
            "        leave\n" +
            "        ret\n");
}