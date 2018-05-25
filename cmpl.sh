./optim.bash < input.mx >out.nasm
nasm -felf64 out.nasm
gcc -static out.o


