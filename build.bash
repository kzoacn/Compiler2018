set -e
cd "$(dirname "$0")"
mkdir -p bin
find ./beta3/src -name [^EIU]*.java | javac -d bin -classpath "lib/antlr-4.7.1-complete.jar" @/dev/stdin
