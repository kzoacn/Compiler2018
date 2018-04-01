package cn.kzoacn;

public class ConstantPool {



    static final StringBuffer multiArrayFunction = new StringBuffer("_multiArray:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        push    rbx\n" +
            "        sub     rsp, 56\n" +
            "        mov     dword [rbp-34H], edi\n" +
            "        mov     qword [rbp-40H], rsi\n" +
            "        mov     eax, dword [rbp-34H]\n" +
            "        movsxd  rdx, eax\n" +
            "        mov     rax, qword [rbp-40H]\n" +
            "        mov     rax, qword [rax]\n" +
            "        cmp     rdx, rax\n" +
            "        jnz     mA_001\n" +
            "        mov     eax, dword [rbp-34H]\n" +
            "        movsxd  rdx, eax\n" +
            "        mov     rax, qword [rbp-40H]\n" +
            "        mov     rsi, rdx\n" +
            "        mov     rdi, rax\n" +
            "        call    address\n" +
            "        mov     rax, qword [rax]\n" +
            "        mov     rdi, rax\n" +
            "        call    mallocArray\n" +
            "        jmp     mA_004\n" +
            "\n" +
            "mA_001:  mov     eax, dword [rbp-34H]\n" +
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
            "        jmp     mA_003\n" +
            "\n" +
            "mA_002:  mov     eax, dword [rbp-14H]\n" +
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
            "mA_003:  mov     eax, dword [rbp-14H]\n" +
            "        cdqe\n" +
            "        cmp     rax, qword [rbp-20H]\n" +
            "        jl      mA_002\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "mA_004:  add     rsp, 56\n" +
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
            "        mov     edi, 1\n" +
            "        call    _multiArray\n" +
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
            "        call    malloc\n" +
            "        mov     qword [rbp-8H], rax\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        mov     rdx, qword [rbp-18H]\n" +
            "        mov     qword [rax], rdx\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        leave\n" +
            "        ret");
    static final StringBuffer addressFunction = new StringBuffer("address:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        mov     qword [rbp-8H], rdi\n" +
            "        mov     qword [rbp-10H], rsi\n" +
            "        mov     rax, qword [rbp-10H]\n" +
            "        add     rax, 1\n" +
            "        lea     rdx, [rax*8]\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, rdx\n" +
            "        pop     rbp\n" +
            "        ret\n");



    static final StringBuffer concatFunction = new StringBuffer("concat:\n" +
            "        push    rbp\n" +
            "        mov     rbp, rsp\n" +
            "        sub     rsp, 48\n" +
            "        mov     qword [rbp-28H], rdi\n" +
            "        mov     qword [rbp-30H], rsi\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movsx   edx, al\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movsx   eax, al\n" +
            "        add     eax, edx\n" +
            "        add     eax, 1\n" +
            "        cdqe\n" +
            "        mov     rdi, rax\n" +
            "        call    malloc\n" +
            "        mov     qword [rbp-18H], rax\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        mov     edx, eax\n" +
            "        mov     rax, qword [rbp-30H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        add     eax, edx\n" +
            "        mov     edx, eax\n" +
            "        mov     rax, qword [rbp-18H]\n" +
            "        mov     byte [rax], dl\n" +
            "        mov     qword [rbp-8H], 0\n" +
            "        mov     qword [rbp-10H], 0\n" +
            "        mov     qword [rbp-8H], 0\n" +
            "        jmp     cat_02\n" +
            "\n" +
            "cat_01:  add     qword [rbp-10H], 1\n" +
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
            "cat_02:  mov     rax, qword [rbp-28H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movsx   rax, al\n" +
            "        cmp     rax, qword [rbp-8H]\n" +
            "        jg      cat_01\n" +
            "        mov     qword [rbp-8H], 0\n" +
            "        jmp     cat_04\n" +
            "\n" +
            "cat_03:  add     qword [rbp-10H], 1\n" +
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
            "cat_04:  mov     rax, qword [rbp-30H]\n" +
            "        movzx   eax, byte [rax]\n" +
            "        movsx   rax, al\n" +
            "        cmp     rax, qword [rbp-8H]\n" +
            "        jg      cat_03\n" +
            "        mov     rax, qword [rbp-18H]\n" +
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
            "        jnz     toS_01\n" +
            "        mov     qword [rbp-8H], 1\n" +
            "toS_01:  cmp     qword [rbp-38H], 0\n" +
            "        jns     toS_02\n" +
            "        neg     qword [rbp-38H]\n" +
            "        mov     qword [rbp-10H], -1\n" +
            "        add     qword [rbp-8H], 1\n" +
            "toS_02:  mov     rax, qword [rbp-38H]\n" +
            "        mov     qword [rbp-18H], rax\n" +
            "        jmp     toS_04\n" +
            "\n" +
            "toS_03:  add     qword [rbp-8H], 1\n" +
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
            "toS_04:  cmp     qword [rbp-18H], 0\n" +
            "        jg      toS_03\n" +
            "        mov     rax, qword [rbp-8H]\n" +
            "        add     rax, 2\n" +
            "        mov     rdi, rax\n" +
            "        call    malloc\n" +
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
            "        jnz     toS_05\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        mov     byte [rax], 45\n" +
            "toS_05:  mov     rdx, qword [rbp-8H]\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        add     rax, rdx\n" +
            "        mov     qword [rbp-20H], rax\n" +
            "        cmp     qword [rbp-38H], 0\n" +
            "        jnz     toS_06\n" +
            "        mov     rax, qword [rbp-20H]\n" +
            "        mov     byte [rax], 48\n" +
            "        jmp     toS_08\n" +
            "\n" +
            "toS_06:  jmp     toS_08\n" +
            "\n" +
            "toS_07:  mov     rcx, qword [rbp-38H]\n" +
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
            "toS_08:  cmp     qword [rbp-38H], 0\n" +
            "        jg      toS_07\n" +
            "        mov     rax, qword [rbp-28H]\n" +
            "        leave\n" +
            "        ret\n" );
}
