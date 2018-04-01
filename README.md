# Compiler2018


## 2018-04-01
编译器的大厦已经建成，就只有几十朵乌云还……



这里杂乱无章地堆放着许多东西，就连这篇readme都是杂乱的

/test是一个简单的将四则运算编译到IR再到NASM的完整的编译器，于2018-03-18完成

antlr-4.7.1-complete.jar是antlr4

intellij-plugin-v4是antlr4的插件

grammars-v4-master是好东西

算术右移...

词法分析语法分析基本完成，详情请见/ParserTest 2018-03-18

沉思:
a.f(x) <=> f(a,x)
string类的表现完全等价于用户自定义的class String;
bool当然就是int了

三步走战略
1.实现int和函数
2.实现class
3.实现string 与内建函数

思考:
1.实现char以实现string
2.强行用int写string
3.所有东西都是32位整数，不是int就是一个指针(char  -> skip) ?
4.我觉得第三条太美了，以至于我认为一个char应该是一个int(哎呀呀，就当是char可以存储utf-8编码好了)

IR设计:
四元组

add,subtract ... 运算

|OpCode|var1|var2|dest|
|-|-|-|-|
|set_label|label|_|_|
|jmp|_|_|label|
|jez|var1|_|label|
|jne|var1|var2|label|
|jxx|var1|var2|label|
|push|var|_|_|
|pop|_|_|_|



2018-3-26的扯淡

所有的变量都存储一个32位整数，我们不关心变量的地址，但我们有时会用变量的值去取地址


现在的IR设计如下

X表示使用这一字段，_表示不使用

Quad


|OpCode|var1|var2|dest|name|备注|
|-|-|-|-|-|-|
|add|X|X|X|_|dest=var1+var2|
|...|X|X|X|_|dest=var1 op var2|
|not|X|_|X|_|dest=!var1|
|...|X|_|X|_|dest=op var1|
|move|X|_|X|_|dest=var1|
|push|X|_|_|_||
|pop|_|_|X|_||
|label|_|_|_|X||
|call|_|_|_|_||
|ret|_|_|_|_||
|jmp|_|_|_|X||
|jz|X|_|_|X||
|jnz|X|_|_|X||
|malloc|X|_|X|_||
|load|X|_|X|_|dest=mem[var1]|
|store|X|_|X|_|mem[dest]=var1|


函数一律用栈传输

在/beta2/testcase中存放了数十个非常简单的测试代码和答案

2018-03-28
不含class的IR基本通过测试
递归函数压栈问题待解决


2018-03-29
函数问题完全解决，开始写class
class比想象中复杂

2018-03-31

虽然bug百出，但IR基本功能似乎已经齐全了

2018-04-01
不小心回档了一次
