set -e
cd "$(dirname "$0")"
mkdir -p bin
cat fileList | javac -d bin -classpath "lib/antlr-4.7.1-complete.jar" @/dev/stdin
