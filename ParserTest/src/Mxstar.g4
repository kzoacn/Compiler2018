grammar Mxstar;



program
    :   definition+ EOF
    ;

definition
    :   classDefinition
    |   functionDefinition
    |   globalVariableDefinition
    ;

classDefinition
    :   CLASS className classBody
    ;
classBody
    :   '{' (variableDefinition | methodDefinition)* '}'
    ;

className
    :   Identifier
    ;

methodDefinition
    :   functionDefinition
    |   constructionFunctionDefinition
    ;


variableDefinition
    :   variableType variableName ('=' expression)? ';'
    ;


variableType
    :   INT ('[]')*
    |   BOOL ('[]')*
    |   STRING ('[]')*
    |   VOID
    |   variableBasicType ('[]')*
    ;

variableBasicType
    :   Identifier
    ;




functionDefinition
    :   variableType functionName '(' parameterList? ')' block
    ;

constructionFunctionDefinition
    :   functionName '(' parameterList? ')' block
    ;

functionName
    :   Identifier
    ;

parameterList
    :   parameter (',' parameter)*
    ;
parameter
    :   variableType variableName
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
    |   ifStatement
    |   whileStatement
    |   forStatement
    |   RETURN expression ';'
    |   BREAK ';'
    |   CONTINUE ';'
    |   variableDefinition
    |   expression ';'
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
    |   NEW variableBasicType '(' expressionList? ')'
    |   NEW (Identifier | INT | STRING) ('[' expression ']')+ ('[]')*
    |   NEW (Identifier | INT | STRING) ('[]')+
    |   expression ('[' expression ']')+
    |   expression '.' expression
    |   ('--'|'++'|'-' |'!' |'~') expression
    |   expression ('++' | '--')
    |   expression ('*' | '/' | '%') expression
    |   expression ('+' | '-') expression
    |   expression ('>>' | '<<') expression
    |   expression ('>' | '>=' |'<'| '<=') expression
    |   expression ('!=' | '==') expression
    |   expression '&' expression
    |   expression '^' expression
    |   expression '|' expression
    |   expression '&&' expression
    |   expression '||' expression
    |   variableName
    |   ConstNumber
    |   ConstString
    |   NULL
    |   TRUE
    |   FALSE
    |   '(' expression ')'
    |   <assoc=right> expression '=' expression
    ;

expressionList
    :   expression (',' expression)*
    ;


//key-words




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
NULL    :   'null';
VOID    :   'void';
BOOL    :   'bool';
FALSE   :   'false';
TRUE    :   'true';
THIS    :   'this';

ConstNumber
    :   [0-9]+
    ;
ConstString
    :   '"' ('\\"' | ~'"')* '"'
    ;

Identifier
	:	[a-zA-Z_] [a-zA-Z_0-9]*
    ;

Whitespace: [ \t]+ -> skip;

Newline: ( '\r' '\n'? | '\n' ) -> skip;

BlockComment: '/*' .*? '*/' -> skip;

LineComment: '//' ~[\r\n]* -> skip;