./codegen.bash < input.mx >out.nasm
nasm -felf64 out.nasm
gcc out.o
time ./a.out < input.in
