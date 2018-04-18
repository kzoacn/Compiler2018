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

    static StringBuffer fun=new StringBuffer("\t global    main\n" +
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
            "\tsub    rsp, 1456\n" +
            "\tcall global_init\n" +
            "\tmov r8 , rax\n" +
            "\tmov r10,0\n" +
            "\tmov r9,r10\n" +
            "\tmov qword [rsp+8*1],r8\n" +
            "\tmov qword [rsp+8*2],r9\n" +
            "\t\n" +
            "L_46:\n" +
            "\tmov r8, qword [rsp+8*2]\n" +
            "\tmov r9,100\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*3],r10\n" +
            "\tmov r8, qword [rsp+8*3]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_47\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,0\n" +
            "\tmov r10,r11\n" +
            "\tmov r13,0\n" +
            "\tmov r12,r13\n" +
            "\tmov r15,5050\n" +
            "\tmov r14,r15\n" +
            "\tmov r11,0\n" +
            "\tmov r9,r11\n" +
            "\tmov qword [rsp+8*4],r8\n" +
            "\tmov qword [gbl+8*8],r9\n" +
            "\tmov qword [rsp+8*5],r10\n" +
            "\tmov qword [rsp+8*6],r12\n" +
            "\tmov qword [gbl+8*7],r14\n" +
            "\tmov     rdi, 101\n" +
            "\tcall    mallocArray\n" +
            "\tmov     qword [rsp+8*9], rax\n" +
            "\tmov r9, qword [rsp+8*9]\n" +
            "\tmov r8,r9\n" +
            "\txor rdx, rdx\n" +
            "\tmov r10, qword [gbl+8*11]\n" +
            "\tmov rax, r10\n" +
            "\tmov r11, qword [gbl+8*12]\n" +
            "\tmov rbx, r11\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r12, rax\n" +
            "\tmov r13,r12\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r10\n" +
            "\tmov rbx, r11\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r14, rdx\n" +
            "\tmov r15,r14\n" +
            "\tmov r12, qword [gbl+8*7]\n" +
            "\tmov r9,r12\n" +
            "\tmov qword [gbl+8*10],r8\n" +
            "\tmov qword [arg+8*0],r9\n" +
            "\tmov qword [gbl+8*14],r13\n" +
            "\tmov qword [rsp+8*15],r14\n" +
            "\tmov qword [gbl+8*16],r15\n" +
            "\tcall pd\n" +
            "\tmov r8 , rax\n" +
            "\tmov r9, 0\n" +
            "\tcmp r8, 0\n" +
            "\tsete r9B\n" +
            "\tcmp r9, 0\n" +
            "\tmov qword [rsp+8*18],r8\n" +
            "\tmov qword [rsp+8*19],r9\n" +
            "\tje L_50\n" +
            "\tmov r9,t227\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,r8\n" +
            "\tmov qword [arg+8*0],r8\n" +
            "\tmov qword [rsp+8*20],r10\n" +
            "\tmov rdi,[rsp+8*20] \n" +
            "\tadd rdi, 1 \n" +
            "\tcall puts\n" +
            "\tmov r8,1\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "L_50:\n" +
            "\tmov r9,t232\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,r8\n" +
            "\tmov qword [arg+8*0],r8\n" +
            "\tmov qword [rsp+8*21],r10\n" +
            "\tmov rdi,[rsp+8*21] \n" +
            "\tadd rdi, 1 \n" +
            "\tcall puts\n" +
            "\tcall random\n" +
            "\tmov r8 , rax\n" +
            "\tmov r9,r8\n" +
            "\tmov qword [rsp+8*22],r8\n" +
            "\tmov qword [arg+8*0],r9\n" +
            "\tcall initialize\n" +
            "\tmov r8 , rax\n" +
            "\tmov qword [rsp+8*23],r8\n" +
            "\tcall random\n" +
            "\tmov r8 , rax\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r8\n" +
            "\tmov r9,10\n" +
            "\tmov rbx, r9\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r10, rdx\n" +
            "\tmov r11,1\n" +
            "\tmov r12,r10\n" +
            "\tadd r12,r11\n" +
            "\tmov r13,r12\n" +
            "\tmov r14,r13\n" +
            "\tmov r15,r14\n" +
            "\tmov qword [rsp+8*24],r8\n" +
            "\tmov qword [rsp+8*25],r10\n" +
            "\tmov qword [rsp+8*26],r12\n" +
            "\tmov qword [gbl+8*27],r13\n" +
            "\tmov qword [arg+8*0],r14\n" +
            "\tmov qword [rsp+8*28],r15\n" +
            "\tmov     rdi, [rsp+8*28]\n" +
            "\tcall    toString\n" +
            "\tmov     qword[rsp+8*29], rax\n" +
            "\tmov r9, qword [rsp+8*29]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,r8\n" +
            "\tmov qword [arg+8*0],r8\n" +
            "\tmov qword [rsp+8*30],r10\n" +
            "\tmov rdi,[rsp+8*30] \n" +
            "\tadd rdi, 1 \n" +
            "\tcall puts\n" +
            "\t\n" +
            "L_51:\n" +
            "\tmov r8, qword [gbl+8*27]\n" +
            "\tmov r9,1\n" +
            "\tmov r10,r8\n" +
            "\tsub r10,r9\n" +
            "\tmov r11, qword [rsp+8*4]\n" +
            "\tcmp r11,r10\n" +
            "\tmov r12, 0\n" +
            "\tsetl r12B\n" +
            "\tmov qword [rsp+8*31],r10\n" +
            "\tmov qword [rsp+8*32],r12\n" +
            "\tmov r8, qword [rsp+8*32]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_52\n" +
            "\tcall random\n" +
            "\tmov r8 , rax\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r8\n" +
            "\tmov r9,10\n" +
            "\tmov rbx, r9\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r10, rdx\n" +
            "\tmov r11,1\n" +
            "\tmov r12,r10\n" +
            "\tadd r12,r11\n" +
            "\tmov r14, qword [gbl+8*10]\n" +
            "\tmov r13,r14\n" +
            "\tmov r15, qword [rsp+8*4]\n" +
            "\tmov qword [rsp+8*33],r8\n" +
            "\tmov r8,r15\n" +
            "\tadd r8,1\n" +
            "\tshl r8,4\n" +
            "\tadd r8,r13\n" +
            "\tmov [r8],r12\n" +
            "\tmov qword [rsp+8*37],r8\n" +
            "\tmov qword [rsp+8*34],r10\n" +
            "\tmov qword [rsp+8*35],r12\n" +
            "\tmov qword [rsp+8*36],r13\n" +
            "\t\n" +
            "L_54:\n" +
            "\tmov r9, qword [gbl+8*10]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10, qword [rsp+8*4]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13, qword [rsp+8*5]\n" +
            "\tmov r14,r12\n" +
            "\tadd r14,r13\n" +
            "\tmov r15, qword [gbl+8*7]\n" +
            "\tcmp r14,r15\n" +
            "\tmov qword [rsp+8*38],r8\n" +
            "\tmov r8, 0\n" +
            "\tsetg r8B\n" +
            "\tmov qword [rsp+8*42],r8\n" +
            "\tmov qword [rsp+8*39],r11\n" +
            "\tmov qword [rsp+8*40],r12\n" +
            "\tmov qword [rsp+8*41],r14\n" +
            "\tmov r8, qword [rsp+8*42]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_55\n" +
            "\tcall random\n" +
            "\tmov r8 , rax\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r8\n" +
            "\tmov r9,10\n" +
            "\tmov rbx, r9\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r10, rdx\n" +
            "\tmov r11,1\n" +
            "\tmov r12,r10\n" +
            "\tadd r12,r11\n" +
            "\tmov r14, qword [gbl+8*10]\n" +
            "\tmov r13,r14\n" +
            "\tmov r15, qword [rsp+8*4]\n" +
            "\tmov qword [rsp+8*43],r8\n" +
            "\tmov r8,r15\n" +
            "\tadd r8,1\n" +
            "\tshl r8,4\n" +
            "\tadd r8,r13\n" +
            "\tmov [r8],r12\n" +
            "\tmov qword [rsp+8*47],r8\n" +
            "\tmov qword [rsp+8*44],r10\n" +
            "\tmov qword [rsp+8*45],r12\n" +
            "\tmov qword [rsp+8*46],r13\n" +
            "\tjmp L_54\n" +
            "\t\n" +
            "L_55:\n" +
            "\tmov r9, qword [gbl+8*10]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10, qword [rsp+8*4]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13, qword [rsp+8*5]\n" +
            "\tmov r14,r13\n" +
            "\tadd r14,r12\n" +
            "\tmov r13,r14\n" +
            "\tmov qword [rsp+8*48],r8\n" +
            "\tmov qword [rsp+8*49],r11\n" +
            "\tmov qword [rsp+8*50],r12\n" +
            "\tmov qword [rsp+8*5],r13\n" +
            "\tmov qword [rsp+8*51],r14\n" +
            "\t\n" +
            "L_53:\n" +
            "\tmov r8, qword [rsp+8*4]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*4],r8\n" +
            "\tjmp L_51\n" +
            "\t\n" +
            "L_52:\n" +
            "\tmov r8, qword [gbl+8*7]\n" +
            "\tmov r9, qword [rsp+8*5]\n" +
            "\tmov r10,r8\n" +
            "\tsub r10,r9\n" +
            "\tmov r11, qword [gbl+8*27]\n" +
            "\tmov r12,1\n" +
            "\tmov r13,r11\n" +
            "\tsub r13,r12\n" +
            "\tmov r15, qword [gbl+8*10]\n" +
            "\tmov r14,r15\n" +
            "\tmov r8,r13\n" +
            "\tadd r8,1\n" +
            "\tshl r8,4\n" +
            "\tadd r8,r14\n" +
            "\tmov [r8],r10\n" +
            "\tmov qword [rsp+8*55],r8\n" +
            "\tmov qword [rsp+8*52],r10\n" +
            "\tmov qword [rsp+8*53],r13\n" +
            "\tmov qword [rsp+8*54],r14\n" +
            "\tcall show\n" +
            "\tmov r8 , rax\n" +
            "\tmov qword [rsp+8*56],r8\n" +
            "\tcall merge\n" +
            "\tmov r8 , rax\n" +
            "\tmov qword [rsp+8*57],r8\n" +
            "\t\n" +
            "L_56:\n" +
            "\tcall win\n" +
            "\tmov r8 , rax\n" +
            "\tmov r9, 0\n" +
            "\tcmp r8, 0\n" +
            "\tsete r9B\n" +
            "\tcmp r9, 0\n" +
            "\tmov qword [rsp+8*58],r8\n" +
            "\tmov qword [rsp+8*59],r9\n" +
            "\tje L_57\n" +
            "\tmov r8, qword [rsp+8*6]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*6],r8\n" +
            "\tcall move\n" +
            "\tmov r8 , rax\n" +
            "\tmov qword [rsp+8*60],r8\n" +
            "\tcall merge\n" +
            "\tmov r8 , rax\n" +
            "\tmov qword [rsp+8*61],r8\n" +
            "\tjmp L_56\n" +
            "\t\n" +
            "L_57:\n" +
            "\tmov r9, qword [rsp+8*6]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,r8\n" +
            "\tmov qword [arg+8*0],r8\n" +
            "\tmov qword [rsp+8*62],r10\n" +
            "\tmov     rdi, [rsp+8*62]\n" +
            "\tcall    toString\n" +
            "\tmov     qword[rsp+8*63], rax\n" +
            "\tmov     rsi, [rsp+8*63]\n" +
            "\tmov     rdi, t298\n" +
            "\tcall    concat\n" +
            "\tmov [rsp+8*64], rax\n" +
            "\tmov     rsi, t303\n" +
            "\tmov     rdi, [rsp+8*64]\n" +
            "\tcall    concat\n" +
            "\tmov [rsp+8*65], rax\n" +
            "\tmov r9, qword [rsp+8*65]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,r8\n" +
            "\tmov qword [arg+8*0],r8\n" +
            "\tmov qword [rsp+8*66],r10\n" +
            "\tmov rdi,[rsp+8*66] \n" +
            "\tadd rdi, 1 \n" +
            "\tcall puts\n" +
            "\t\n" +
            "L_48:\n" +
            "\tmov r8, qword [rsp+8*2]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*2],r8\n" +
            "\tjmp L_46\n" +
            "\t\n" +
            "L_47:\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\tjmp QED\n" +
            "\t\n" +
            "random:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 1456\n" +
            "\txor rdx, rdx\n" +
            "\tmov r8, qword [gbl+8*67]\n" +
            "\tmov rax, r8\n" +
            "\tmov r9, qword [gbl+8*14]\n" +
            "\tmov rbx, r9\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r10, rdx\n" +
            "\tmov r11, qword [gbl+8*12]\n" +
            "\tmov r12,r11\n" +
            "\timul r12,r10\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r8\n" +
            "\tmov rbx, r9\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r13, rax\n" +
            "\tmov r14, qword [gbl+8*16]\n" +
            "\tmov r15,r14\n" +
            "\timul r15,r13\n" +
            "\tmov r9,r12\n" +
            "\tsub r9,r15\n" +
            "\tmov r10,r9\n" +
            "\tmov r9,0\n" +
            "\tcmp r10,r9\n" +
            "\tmov r12, 0\n" +
            "\tsetge r12B\n" +
            "\tmov qword [rsp+8*73],r10\n" +
            "\tmov qword [rsp+8*74],r12\n" +
            "\tmov qword [rsp+8*70],r13\n" +
            "\tmov qword [rsp+8*71],r15\n" +
            "\tmov r8, qword [rsp+8*74]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_0\n" +
            "\tmov r9, qword [rsp+8*73]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [gbl+8*67],r8\n" +
            "\tjmp L_1\n" +
            "\t\n" +
            "L_0:\n" +
            "\tmov r8, qword [rsp+8*73]\n" +
            "\tmov r9, qword [gbl+8*11]\n" +
            "\tmov r10,r8\n" +
            "\tadd r10,r9\n" +
            "\tmov r11,r10\n" +
            "\tmov qword [rsp+8*75],r10\n" +
            "\tmov qword [gbl+8*67],r11\n" +
            "\t\n" +
            "L_1:\n" +
            "\tmov r8, qword [gbl+8*67]\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "initialize:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 1456\n" +
            "\tmov r9, qword [arg+8*0]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,r8\n" +
            "\tmov r11,0\n" +
            "\tmov rax,r11\n" +
            "\tmov qword [rsp+8*76],r8\n" +
            "\tmov qword [gbl+8*67],r10\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "swap:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 1456\n" +
            "\tmov r9, qword [arg+8*0]\n" +
            "\tmov r8,r9\n" +
            "\tmov r11, qword [arg+8*1]\n" +
            "\tmov r10,r11\n" +
            "\tmov r13, qword [gbl+8*10]\n" +
            "\tmov r12,r13\n" +
            "\tmov r14,r8\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r12\n" +
            "\tmov r15, [r14]\n" +
            "\tmov qword [rsp+8*80],r12\n" +
            "\tmov r12,r15\n" +
            "\tmov qword [rsp+8*81],r14\n" +
            "\tmov r14,r13\n" +
            "\tmov qword [rsp+8*82],r15\n" +
            "\tmov r15,r10\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r14\n" +
            "\tmov qword [rsp+8*84],r14\n" +
            "\tmov r14, [r15]\n" +
            "\tmov qword [rsp+8*85],r15\n" +
            "\tmov r15,r13\n" +
            "\tmov r13,r8\n" +
            "\tadd r13,1\n" +
            "\tshl r13,4\n" +
            "\tadd r13,r15\n" +
            "\tmov [r13],r14\n" +
            "\tmov qword [rsp+8*77],r8\n" +
            "\tmov qword [rsp+8*88],r13\n" +
            "\tmov r13, qword [gbl+8*10]\n" +
            "\tmov r8,r13\n" +
            "\tmov qword [rsp+8*86],r14\n" +
            "\tmov r14,r10\n" +
            "\tadd r14,1\n" +
            "\tshl r14,4\n" +
            "\tadd r14,r8\n" +
            "\tmov [r14],r12\n" +
            "\tmov qword [rsp+8*89],r8\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tmov qword [rsp+8*79],r10\n" +
            "\tmov qword [rsp+8*83],r12\n" +
            "\tmov qword [rsp+8*90],r14\n" +
            "\tmov qword [rsp+8*87],r15\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "pd:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 1456\n" +
            "\tmov r9, qword [arg+8*0]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*91],r8\n" +
            "\t\n" +
            "L_2:\n" +
            "\tmov r8, qword [gbl+8*8]\n" +
            "\tmov r9, qword [rsp+8*91]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetle r10B\n" +
            "\tmov qword [rsp+8*92],r10\n" +
            "\tmov r8, qword [rsp+8*92]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_3\n" +
            "\tmov r8, qword [gbl+8*8]\n" +
            "\tmov r9,1\n" +
            "\tmov r10,r8\n" +
            "\tadd r10,r9\n" +
            "\tmov r11,r8\n" +
            "\timul r11,r10\n" +
            "\txor rdx, rdx\n" +
            "\tmov rax, r11\n" +
            "\tmov r12,2\n" +
            "\tmov rbx, r12\n" +
            "\tcdq\n" +
            "\tidiv rbx\n" +
            "\tmov r13, rax\n" +
            "\tmov r14, qword [rsp+8*91]\n" +
            "\tcmp r14,r13\n" +
            "\tmov r15, 0\n" +
            "\tsete r15B\n" +
            "\tmov qword [rsp+8*93],r10\n" +
            "\tmov qword [rsp+8*94],r11\n" +
            "\tmov qword [rsp+8*95],r13\n" +
            "\tmov qword [rsp+8*96],r15\n" +
            "\tmov r8, qword [rsp+8*96]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_6\n" +
            "\tmov r8,1\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "L_6:\n" +
            "\t\n" +
            "L_4:\n" +
            "\tmov r8, qword [gbl+8*8]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [gbl+8*8],r8\n" +
            "\tjmp L_2\n" +
            "\t\n" +
            "L_3:\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "show:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 1456\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*97],r8\n" +
            "\t\n" +
            "L_7:\n" +
            "\tmov r8, qword [rsp+8*97]\n" +
            "\tmov r9, qword [gbl+8*27]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*98],r10\n" +
            "\tmov r8, qword [rsp+8*98]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_8\n" +
            "\tmov r9, qword [gbl+8*10]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10, qword [rsp+8*97]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,r12\n" +
            "\tmov r14,r13\n" +
            "\tmov qword [rsp+8*99],r8\n" +
            "\tmov qword [rsp+8*100],r11\n" +
            "\tmov qword [rsp+8*101],r12\n" +
            "\tmov qword [arg+8*0],r13\n" +
            "\tmov qword [rsp+8*102],r14\n" +
            "\tmov     rdi, [rsp+8*102]\n" +
            "\tcall    toString\n" +
            "\tmov     qword[rsp+8*103], rax\n" +
            "\tmov     rsi, t108\n" +
            "\tmov     rdi, [rsp+8*103]\n" +
            "\tcall    concat\n" +
            "\tmov [rsp+8*104], rax\n" +
            "\tmov r9, qword [rsp+8*104]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,r8\n" +
            "\tmov qword [arg+8*0],r8\n" +
            "\tmov qword [rsp+8*105],r10\n" +
            "\tmov rdi, format\n" +
            "\tmov rsi,[rsp+8*105] \n" +
            "\tadd rsi, 1 \n" +
            "\txor rax, rax\n" +
            "\tcall printf\n" +
            "\t\n" +
            "L_9:\n" +
            "\tmov r8, qword [rsp+8*97]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*97],r8\n" +
            "\tjmp L_7\n" +
            "\t\n" +
            "L_8:\n" +
            "\tmov r9,t113\n" +
            "\tmov r8,r9\n" +
            "\tmov r10,r8\n" +
            "\tmov qword [arg+8*0],r8\n" +
            "\tmov qword [rsp+8*106],r10\n" +
            "\tmov rdi,[rsp+8*106] \n" +
            "\tadd rdi, 1 \n" +
            "\tcall puts\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "win:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 1456\n" +
            "\tmov     rdi, 101\n" +
            "\tcall    mallocArray\n" +
            "\tmov     qword [rsp+8*107], rax\n" +
            "\tmov r9, qword [rsp+8*107]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10, qword [gbl+8*27]\n" +
            "\tmov r11, qword [gbl+8*8]\n" +
            "\tcmp r10,r11\n" +
            "\tmov r12, 0\n" +
            "\tsetne r12B\n" +
            "\tmov qword [rsp+8*108],r8\n" +
            "\tmov qword [rsp+8*109],r12\n" +
            "\tmov r8, qword [rsp+8*109]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_11\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "L_11:\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*110],r8\n" +
            "\t\n" +
            "L_12:\n" +
            "\tmov r8, qword [rsp+8*110]\n" +
            "\tmov r9, qword [gbl+8*27]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*111],r10\n" +
            "\tmov r8, qword [rsp+8*111]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_13\n" +
            "\tmov r9, qword [gbl+8*10]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10, qword [rsp+8*110]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r14, qword [rsp+8*108]\n" +
            "\tmov r13,r14\n" +
            "\tmov r15,r10\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov [r15],r12\n" +
            "\tmov qword [rsp+8*112],r8\n" +
            "\tmov qword [rsp+8*113],r11\n" +
            "\tmov qword [rsp+8*114],r12\n" +
            "\tmov qword [rsp+8*115],r13\n" +
            "\tmov qword [rsp+8*116],r15\n" +
            "\t\n" +
            "L_14:\n" +
            "\tmov r8, qword [rsp+8*110]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*110],r8\n" +
            "\tjmp L_12\n" +
            "\t\n" +
            "L_13:\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*117],r8\n" +
            "\t\n" +
            "L_15:\n" +
            "\tmov r8, qword [gbl+8*27]\n" +
            "\tmov r9,1\n" +
            "\tmov r10,r8\n" +
            "\tsub r10,r9\n" +
            "\tmov r11, qword [rsp+8*117]\n" +
            "\tcmp r11,r10\n" +
            "\tmov r12, 0\n" +
            "\tsetl r12B\n" +
            "\tmov qword [rsp+8*118],r10\n" +
            "\tmov qword [rsp+8*119],r12\n" +
            "\tmov r8, qword [rsp+8*119]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_16\n" +
            "\tmov r8, qword [rsp+8*117]\n" +
            "\tmov r9,1\n" +
            "\tmov r10,r8\n" +
            "\tadd r10,r9\n" +
            "\tmov r11,r10\n" +
            "\tmov qword [rsp+8*120],r10\n" +
            "\tmov qword [rsp+8*110],r11\n" +
            "\t\n" +
            "L_18:\n" +
            "\tmov r8, qword [rsp+8*110]\n" +
            "\tmov r9, qword [gbl+8*27]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*121],r10\n" +
            "\tmov r8, qword [rsp+8*121]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_19\n" +
            "\tmov r9, qword [rsp+8*108]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10, qword [rsp+8*117]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,r9\n" +
            "\tmov r14, qword [rsp+8*110]\n" +
            "\tmov r15,r14\n" +
            "\tadd r15,1\n" +
            "\tshl r15,4\n" +
            "\tadd r15,r13\n" +
            "\tmov qword [rsp+8*122],r8\n" +
            "\tmov r8, [r15]\n" +
            "\tcmp r12,r8\n" +
            "\tmov qword [rsp+8*123],r11\n" +
            "\tmov r11, 0\n" +
            "\tsetg r11B\n" +
            "\tmov qword [rsp+8*127],r8\n" +
            "\tmov qword [rsp+8*128],r11\n" +
            "\tmov qword [rsp+8*124],r12\n" +
            "\tmov qword [rsp+8*125],r13\n" +
            "\tmov qword [rsp+8*126],r15\n" +
            "\tmov r8, qword [rsp+8*128]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_22\n" +
            "\tmov r9, qword [rsp+8*108]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10, qword [rsp+8*117]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,r12\n" +
            "\tmov r14,r9\n" +
            "\tmov r15, qword [rsp+8*110]\n" +
            "\tmov qword [rsp+8*129],r8\n" +
            "\tmov r8,r15\n" +
            "\tadd r8,1\n" +
            "\tshl r8,4\n" +
            "\tadd r8,r14\n" +
            "\tmov qword [rsp+8*130],r11\n" +
            "\tmov r11, [r8]\n" +
            "\tmov qword [rsp+8*134],r8\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*131],r12\n" +
            "\tmov r12,r10\n" +
            "\tadd r12,1\n" +
            "\tshl r12,4\n" +
            "\tadd r12,r8\n" +
            "\tmov [r12],r11\n" +
            "\tmov qword [rsp+8*136],r8\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*135],r11\n" +
            "\tmov r11,r15\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov [r11],r13\n" +
            "\tmov qword [rsp+8*138],r8\n" +
            "\tmov qword [rsp+8*139],r11\n" +
            "\tmov qword [rsp+8*137],r12\n" +
            "\tmov qword [rsp+8*132],r13\n" +
            "\tmov qword [rsp+8*133],r14\n" +
            "\t\n" +
            "L_22:\n" +
            "\t\n" +
            "L_20:\n" +
            "\tmov r8, qword [rsp+8*110]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*110],r8\n" +
            "\tjmp L_18\n" +
            "\t\n" +
            "L_19:\n" +
            "\t\n" +
            "L_17:\n" +
            "\tmov r8, qword [rsp+8*117]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*117],r8\n" +
            "\tjmp L_15\n" +
            "\t\n" +
            "L_16:\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*117],r8\n" +
            "\t\n" +
            "L_23:\n" +
            "\tmov r8, qword [rsp+8*117]\n" +
            "\tmov r9, qword [gbl+8*27]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*140],r10\n" +
            "\tmov r8, qword [rsp+8*140]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_24\n" +
            "\tmov r9, qword [rsp+8*108]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10, qword [rsp+8*117]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,1\n" +
            "\tmov r14,r10\n" +
            "\tadd r14,r13\n" +
            "\tcmp r12,r14\n" +
            "\tmov r15, 0\n" +
            "\tsetne r15B\n" +
            "\tmov qword [rsp+8*141],r8\n" +
            "\tmov qword [rsp+8*142],r11\n" +
            "\tmov qword [rsp+8*143],r12\n" +
            "\tmov qword [rsp+8*144],r14\n" +
            "\tmov qword [rsp+8*145],r15\n" +
            "\tmov r8, qword [rsp+8*145]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_27\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "L_27:\n" +
            "\t\n" +
            "L_25:\n" +
            "\tmov r8, qword [rsp+8*117]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*117],r8\n" +
            "\tjmp L_23\n" +
            "\t\n" +
            "L_24:\n" +
            "\tmov r8,1\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "merge:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 1456\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*146],r8\n" +
            "\t\n" +
            "L_28:\n" +
            "\tmov r8, qword [rsp+8*146]\n" +
            "\tmov r9, qword [gbl+8*27]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*147],r10\n" +
            "\tmov r8, qword [rsp+8*147]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_29\n" +
            "\tmov r9, qword [gbl+8*10]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10, qword [rsp+8*146]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,0\n" +
            "\tcmp r12,r13\n" +
            "\tmov r14, 0\n" +
            "\tsete r14B\n" +
            "\tmov qword [rsp+8*148],r8\n" +
            "\tmov qword [rsp+8*149],r11\n" +
            "\tmov qword [rsp+8*150],r12\n" +
            "\tmov qword [rsp+8*151],r14\n" +
            "\tmov r8, qword [rsp+8*151]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_32\n" +
            "\tmov r8, qword [rsp+8*146]\n" +
            "\tmov r9,1\n" +
            "\tmov r10,r8\n" +
            "\tadd r10,r9\n" +
            "\tmov r11,r10\n" +
            "\tmov qword [rsp+8*152],r10\n" +
            "\tmov qword [rsp+8*153],r11\n" +
            "\t\n" +
            "L_33:\n" +
            "\tmov r8, qword [rsp+8*153]\n" +
            "\tmov r9, qword [gbl+8*27]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*154],r10\n" +
            "\tmov r8, qword [rsp+8*154]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_34\n" +
            "\tmov r9, qword [gbl+8*10]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10, qword [rsp+8*153]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,0\n" +
            "\tcmp r12,r13\n" +
            "\tmov r14, 0\n" +
            "\tsetne r14B\n" +
            "\tmov qword [rsp+8*155],r8\n" +
            "\tmov qword [rsp+8*156],r11\n" +
            "\tmov qword [rsp+8*157],r12\n" +
            "\tmov qword [rsp+8*158],r14\n" +
            "\tmov r8, qword [rsp+8*158]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_37\n" +
            "\tmov r9, qword [rsp+8*153]\n" +
            "\tmov r8,r9\n" +
            "\tmov r11, qword [rsp+8*146]\n" +
            "\tmov r10,r11\n" +
            "\tmov qword [arg+8*1],r8\n" +
            "\tmov qword [arg+8*0],r10\n" +
            "\tcall swap\n" +
            "\tmov r8 , rax\n" +
            "\tmov qword [rsp+8*159],r8\n" +
            "\tjmp L_34\n" +
            "\t\n" +
            "L_37:\n" +
            "\t\n" +
            "L_35:\n" +
            "\tmov r8, qword [rsp+8*153]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*153],r8\n" +
            "\tjmp L_33\n" +
            "\t\n" +
            "L_34:\n" +
            "\t\n" +
            "L_32:\n" +
            "\t\n" +
            "L_30:\n" +
            "\tmov r8, qword [rsp+8*146]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*146],r8\n" +
            "\tjmp L_28\n" +
            "\t\n" +
            "L_29:\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*146],r8\n" +
            "\t\n" +
            "L_38:\n" +
            "\tmov r8, qword [rsp+8*146]\n" +
            "\tmov r9, qword [gbl+8*27]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*160],r10\n" +
            "\tmov r8, qword [rsp+8*160]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_39\n" +
            "\tmov r9, qword [gbl+8*10]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10, qword [rsp+8*146]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,0\n" +
            "\tcmp r12,r13\n" +
            "\tmov r14, 0\n" +
            "\tsete r14B\n" +
            "\tmov qword [rsp+8*161],r8\n" +
            "\tmov qword [rsp+8*162],r11\n" +
            "\tmov qword [rsp+8*163],r12\n" +
            "\tmov qword [rsp+8*164],r14\n" +
            "\tmov r8, qword [rsp+8*164]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_42\n" +
            "\tmov r9, qword [rsp+8*146]\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [gbl+8*27],r8\n" +
            "\tjmp L_39\n" +
            "\t\n" +
            "L_42:\n" +
            "\t\n" +
            "L_40:\n" +
            "\tmov r8, qword [rsp+8*146]\n" +
            "\tmov r9,1\n" +
            "\tmov r8,r8\n" +
            "\tadd r8,r9\n" +
            "\tmov qword [rsp+8*146],r8\n" +
            "\tjmp L_38\n" +
            "\t\n" +
            "L_39:\n" +
            "\tmov r8,0\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "move:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 1456\n" +
            "\tmov r9,0\n" +
            "\tmov r8,r9\n" +
            "\tmov qword [rsp+8*165],r8\n" +
            "\t\n" +
            "L_43:\n" +
            "\tmov r8, qword [rsp+8*165]\n" +
            "\tmov r9, qword [gbl+8*27]\n" +
            "\tcmp r8,r9\n" +
            "\tmov r10, 0\n" +
            "\tsetl r10B\n" +
            "\tmov qword [rsp+8*166],r10\n" +
            "\tmov r8, qword [rsp+8*166]\n" +
            "\tcmp r8, 0\n" +
            "\tje L_44\n" +
            "\tmov r9, qword [gbl+8*10]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10, qword [rsp+8*165]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov r12, [r11]\n" +
            "\tmov r13,1\n" +
            "\tmov r12,r12\n" +
            "\tsub r12,r13\n" +
            "\tmov [r11],r12\n" +
            "\tmov r14,1\n" +
            "\tmov r15,r10\n" +
            "\tadd r15,r14\n" +
            "\tmov r10,r15\n" +
            "\tmov qword [rsp+8*167],r8\n" +
            "\tmov qword [rsp+8*165],r10\n" +
            "\tmov qword [rsp+8*168],r11\n" +
            "\tmov qword [rsp+8*169],r12\n" +
            "\tmov qword [rsp+8*170],r15\n" +
            "\t\n" +
            "L_45:\n" +
            "\tjmp L_43\n" +
            "\t\n" +
            "L_44:\n" +
            "\tmov r9, qword [gbl+8*10]\n" +
            "\tmov r8,r9\n" +
            "\tmov r10, qword [gbl+8*27]\n" +
            "\tmov r11,r10\n" +
            "\tadd r11,1\n" +
            "\tshl r11,4\n" +
            "\tadd r11,r8\n" +
            "\tmov [r11],r10\n" +
            "\tmov r12,r10\n" +
            "\tmov r13,1\n" +
            "\tmov r10,r10\n" +
            "\tadd r10,r13\n" +
            "\tmov r14,0\n" +
            "\tmov rax,r14\n" +
            "\tmov qword [rsp+8*171],r8\n" +
            "\tmov qword [gbl+8*27],r10\n" +
            "\tmov qword [rsp+8*172],r11\n" +
            "\tmov qword [rsp+8*173],r12\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "global_init:\n" +
            "\tpush   rbp\n" +
            "\tmov    rbp, rsp\n" +
            "\tsub    rsp, 1456\n" +
            "\tmov r9,48271\n" +
            "\tmov r8,r9\n" +
            "\tmov r11,2147483647\n" +
            "\tmov r10,r11\n" +
            "\tmov r13,1\n" +
            "\tmov r12,r13\n" +
            "\tmov qword [gbl+8*12],r8\n" +
            "\tmov qword [gbl+8*11],r10\n" +
            "\tmov qword [gbl+8*67],r12\n" +
            "\tmov r8, qword [rsp+8*174]\n" +
            "\tmov rax,r8\n" +
            "\tleave\n" +
            "\tret\n" +
            "\t\n" +
            "QED:\n" +
            "\t\n" +
            "\t section   .bss\n" +
            "gbl:         resb   3440\n" +
            "buff.1788:\n" +
            "        resb    256\n" +
            "arg:\n" +
            "        resb    1024\n" +
            "\n" +
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
            "\t\n" +
            "t108:\n" +
            "\t db 1,\" \" ,0\n" +
            "\n" +
            "t227:\n" +
            "\t db 79,\"Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i\" ,0\n" +
            "\n" +
            "t303:\n" +
            "\t db 8,\" step(s)\" ,0\n" +
            "\n" +
            "t232:\n" +
            "\t db 12,\"Let's start!\" ,0\n" +
            "\n" +
            "t298:\n" +
            "\t db 7,\"Total: \" ,0\n" +
            "\n" +
            "t113:\n" +
            "\t db 0,\"\" ,0\n" +
            "\n");
    static boolean checkCode(String line)throws Exception{

        if(line.contains("g_useless[i][j] = func(g[i][j], f[i][k], f[k][j]);")){
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