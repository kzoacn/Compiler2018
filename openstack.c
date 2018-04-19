register char *_sp __asm__("rsp");
void _main(){}
int main() {
        int size = 64 << 20;//400MB
        char *sys, *mine=malloc(size) + size - 4096;
        sys = _sp; _sp = mine; _main(); _sp = sys; return 0;
}
