set -e
cd "$(dirname "$0")"
cat > test.mx
java -classpath ./lib/antlr-4.7.1-complete.jar:./cbin cn.kzoacn.Builder
cat test.nasm

