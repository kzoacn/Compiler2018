cd "$(dirname "$0")"
cat > test.mx
java -classpath ./lib/antlr-4.7.1-complete.jar:./bin cn.kzoacn.Builder

cat test.mx | grep "getInt" >hasget
cat test.mx | grep "getString" >>hasget
if diff empty hasget >null; then
	nasm -felf64 test.nasm 
	gcc -static test.o 
	./a.out > ans.out
	./inputbuilder < ans.out > tmp.c
	./c2nasm.sh tmp.c 
	cat tmp.c.nasm
else
	./movclear <test.nasm 
fi


