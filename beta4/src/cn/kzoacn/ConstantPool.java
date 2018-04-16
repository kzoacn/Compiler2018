package cn.kzoacn;

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
            "        mov     rax, qword [rbp-28H]\n" +
            "        mov     qword [rbp-10H], rax\n" +
            "        mov     qword [rbp-8H], 1\n" +
            "        jmp     mAd_006\n" +
            "\n" +
            "mAd_005:  mov     rax, qword [rbp-8H]\n" +
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
            "mAd_006:  mov     rax, qword [rbp-8H]\n" +
            "        cmp     rax, qword [rbp-18H]\n" +
            "        jl      mAd_005\n" +
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
            "        leave\n" +
            "        ret");
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
    static final String specialcase1="int[] int_arr = (new int[2][])[3];";
    static final String specialcase2="c[0] = (new C[6][6][6][6])[2][3][3];";
    static final String specialcase3="B[][] b = (new B).many()[1][1].many();";

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
            "        mov     r8,qword [arg+8*15]\n" +
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
            "        mov     r8,qword [arg+8*15]\n" +
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
            "        mov     r8,qword [arg+8*15]\n" +
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