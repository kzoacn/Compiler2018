
set -e
cd "$(dirname "$0")"
mkdir -p bin
mkdir -p sbin
cat fileList | javac -d bin -classpath "lib/antlr-4.7.1-complete.jar" @/dev/stdin
cat sematicfileList | javac -d sbin -classpath "lib/antlr-4.7.1-complete.jar" @/dev/stdin
