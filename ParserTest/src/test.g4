grammar test;


functionDefinition
    :   variableType functionName '(' parameterList? ')' block
    ;

functionName
    :   Identifier
    ;
constructFunctionDefinition
    :   className '()' block
    ;

parameterList
    :   parameter (',' parameter)*
    ;
parameter
    :   variableType variableName
    ;


program
    :   definition+ EOF
    ;

definition
    :   classDefinition
    |   functionDefinition
    |   globalVariableDefinition
    ;

classDefinition
    :   'class' className '{' ( classDefinition | methodDefinition )* '}'
    ;
className
    :   Identifier
    ;
classVariableDefinition
    :   variableDefinition
    ;
methodDefinition
    :   functionDefinition
    |   constructFunctionDefinition
    ;

variableDefinition
    :   variableType variableName ('=' expression)? ';'
    ;

variableType
    :   INT ('[]')*
    |   STRING ('[]')*
    |   variableBasicType ('[]')*
    ;

variableBasicType
    :   Identifier
    ;

Identifier
	:	[a-zA-Z_] [a-zA-Z_0-9]*
    ;

variableName
    : Identifier
    ;

globalVariableDefinition
    :   variableDefinition
    ;



block
    : '{' statement* '}'
    ;

statement
    :   block
    |   variableDefinition
    |   expression ';'
    |   ifStatement
    |   whileStatement
    |   forStatement
    |   RETURN expression ';'
    |   BREAK ';'
    |   CONTINUE ';'
    ;


ifStatement
    :   IF '(' expression ')' (statement | block) (ELSE (statement | block) )?
    ;

whileStatement
    :   WHILE '(' expression ')' (statement | block)
    ;
forStatement
    :   FOR '(' expression? ';' expression? ';' expression? ')' (statement | block)
    ;

expression
    :   functionName '(' expressionList? ')'
    |   expression '[' expression ']'
    |   expression '.' expression
    |   PrefixUnaryOperator expression
    |   expression SufixUnaryOperator
    |   expression BinaryOperator expression
    |   variableName
    |   ConstNumber
    |   ConstString
    |   '(' expression ')'
    |   NEW expression
    ;

expressionList
    :   expression (',' expression)*
    ;


//key-words

ConstNumber
    :   [0-9]+
    ;
ConstString
    :   '"' ('\\"' | ~'"')* '"'
    ;

PrefixUnaryOperator
    :   '++' | '--'
    |   '-' | '~'
    |   '!'
    ;
SufixUnaryOperator
    :   '++' | '--'
    ;

BinaryOperator
    :   '*' | '/' | '%'
    |   '+' | '-'
    |   '<<' | '>>'
    |   '>' | '>=' | '<' | '<='
    |   '==' | '!='
    |   '&'
    |   '^'
    |   '|'
    |   '&&'
    |   '||'
    |   '='
    |   '+=' | '-=' | '*=' | '/=' | '%=' | '<<=' | '>>=' | '|=' | '&=' | '^='
    ;


CLASS   :   'class';
INT     :   'int';
STRING  :   'string';
RETURN  :   'return';
BREAK   :   'break';
CONTINUE:   'continue';
IF      :   'if';
ELSE    :   'else';
WHILE   :   'while';
FOR     :   'for';
NEW     :   'new';

fragment
LETTER  :   [a-zA-Z];
DIGIT   :   [0-9];

Whitespace: [ \t]+ -> skip;

Newline: ( '\r' '\n'? | '\n' ) -> skip;

BlockComment: '/*' .*? '*/' -> skip;

LineComment: '//' ~[\r\n]* -> skip;