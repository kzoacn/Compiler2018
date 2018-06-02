grammar Mxstar;



program
    : (classDefinition | functionDefinition | globalVariableDefinition)+
    ;

classDefinition
    :   CLASS className classBody
    ;
classBody
    :   '{' (memberDefinition | methodDefinition)* '}'
    ;

className
    :   Identifier
    ;

methodDefinition
    :   variableType? functionName '(' parameterList? ')' block
    ;

memberDefinition
    :   variableType variableName  ';'
    ;

bracket
    :   '[' ']'
    |   '[]'
    ;
variableDefinition
    :   variableType variableName  ';'                  # variableDefinitionWithoutAssignment
    |   variableType variableName '=' expression ';'    # variableDefinitionWithAssignment
    ;


variableType
    :   variableBasicType ( bracket )*
    ;

variableBasicType
    :   INT
    |   BOOL
    |   STRING
    |   VOID
    |   Identifier
    ;




functionDefinition
    :   variableType functionName '(' parameterList? ')' functionBody
    ;
functionBody
    : '{' statement* '}'
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
    :   Identifier
    |   THIS
    ;

globalVariableDefinition
    :   variableDefinition
    ;


block
    : '{' statement* '}'
    ;

statement
    :   block                       #blockStatement
    |   ifStatement                 #ifStmt
    |   whileStatement              #whileStmt
    |   forStatement                #forStmt
    |   RETURN expression? ';'      #returnStatement
    |   BREAK ';'                   #breakStatement
    |   CONTINUE ';'                #continueStatement
    |   variableDefinition          #variableDefinitionStatement
    |   expression ';'              #expressionStatement
    |   ';'                         #emptyStatement
    ;

statementOrBlock
    :   statement | block
    ;

ifStatement
    :   IF '(' expression ')' statementOrBlock elseBlock?
    ;

elseBlock
    :   ELSE statementOrBlock
    ;

whileStatement
    :   WHILE '(' expression ')' statementOrBlock
    ;
forStatement
    :   FOR '(' A=expression? ';' B=expression? ';' C=expression? ')' statementOrBlock
    ;


dotAtom
    :   functionName '(' expressionList? ')'
    |   variable
    ;

expression
    :   functionName '(' expressionList? ')'                                        # functionCall
    |   pointerValue '.' functionName '(' expressionList? ')'                       # methodCall
//    |   expression '.' functionName '(' expressionList? ')'                         # methodCallWithExp
    |   NEW variableBasicType '(' expressionList? ')'                               # newVariable
    |   NEW variableBasicType                                                       # newVariableWithoutExp
    |   NEW type=variableBasicType (index)+ (bracket)*                              # newArray
    |   variable ('.' variable)+                                                    # dotExpression
    |   expression ('.' dotAtom)+                                                   # hyperDotExpression
    |   variableName ('[' expression ']')*                                          # getValue
    |   op=('!' |'~'|'-') expression                                                # prefixOperator
    |   op=('--'|'++' ) leftValue                                                   # prefixLvalueOperator
    |   leftValue op=('++' | '--')                                                  # suffixOperator
    |   expression op=('*' | '/' | '%') expression                                  # mulDivMod
    |   expression op=('+' | '-') expression                                        # addSubtract
    |   expression op=('>>' | '<<') expression                                      # shift
    |   expression op=('>' | '>=' |'<'| '<=') expression                            # relationOperator
    |   expression op=('!=' | '==') expression                                      # equalOrNot
    |   expression '&' expression                                                   # and
    |   expression '^' expression                                                   # xor
    |   expression '|' expression                                                   # or
    |   <assoc=right> expression '&&' expression                                                  # logicAnd
    |   <assoc=right> expression '||' expression                                                  # logicOr
    |   ConstNumber                                                                 # constNumber
    |   ConstString                                                                 # constString
    |   NULL                                                                        # null
    |   TRUE                                                                        # true
    |   FALSE                                                                       # false
    |   '(' expression ')'                                                          # parentheses
    |   leftValue '=' expression                                                    # assign
    ;

index
    :   '[' expression ']'
    ;

variable
    :   variableName index*
    |   '(' NEW type=variableBasicType (index)+ ')'
    ;

pointerValue
    :   variable ('.' variable)*
    ;

leftValue
    :   variable ('.' variable)*
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
BRACKET :   '[]';

ConstNumber
    :   [0-9]+
    ;
ConstString
    :   '"' ('\\"' | ~('"'|'\n') )* '"'
    ;

Identifier
	:	[a-zA-Z_] [a-zA-Z_0-9]*
    ;

Whitespace: [ \t]+ -> skip;

Newline: ( '\r' '\n'? | '\n' ) -> skip;

BlockComment: '/*' .*? '*/' -> skip;

LineComment: '//' ~[\r\n]* -> skip;