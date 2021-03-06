set -e
cd "$(dirname "$0")"
mkdir -p bin
mkdir -p sbin
mkdir -p cbin
g++ inputbuilder.cpp -o inputbuilder
g++ movclear.cpp -o movclear -std=c++11
chmod +x c2nasm.sh
chmod +x ./objc/src/build.sh
g++ -o objconv ./objc/src/*.cpp -std=c++03
cat fileList | javac -d bin -classpath "lib/antlr-4.7.1-complete.jar" @/dev/stdin
cat cfileList | javac -d cbin -classpath "lib/antlr-4.7.1-complete.jar" @/dev/stdin
cat sematicfileList | javac -d sbin -classpath "lib/antlr-4.7.1-complete.jar" @/dev/stdin
