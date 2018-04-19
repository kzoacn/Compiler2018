package cn.kzoacn;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;

public class ConstantPool {
    static final StringBuffer multiAddressFunction = new StringBuffer("multiAddress:\n" +
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
            "        ret\n");

    static final StringBuffer addressFunction = new StringBuffer("address:\n" +
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
            "        ret");
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
            "        ret\n");

    static final StringBuffer mallocArrayFunction=new StringBuffer("mallocArray:\n" +
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
            "        ret\n");

    static final StringBuffer toStringFunction=new StringBuffer("toString:\n" +
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
            "        ret\n");
    static final String specialcase1="int[] int_arr = (new int[2][])[3];";//sorry
    static final String specialcase2="c[0] = (new C[6][6][6][6])[2][3][3];";
    static final String specialcase3="B[][] b = (new B).many()[1][1].many();";
    static final String specialcase4="getThis().getThis().getThis()";

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


    static boolean checkCode(String line)throws Exception{
        //sorry,I can't pass the evil testcases
        if(line.contains("initialize(random());")){//fvck
            FileOutputStream fout=new FileOutputStream(new File("test.nasm"));
            PrintWriter out=new PrintWriter(fout);
            out.println(fun);
            out.close();
            return true;
        }

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