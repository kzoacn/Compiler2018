// Generated from /home/kzoacn/Compiler2018/beta3/src/cn/kzoacn/Mxstar.g4 by ANTLR 4.7
package cn.kzoacn;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link MxstarParser}.
 */
public interface MxstarListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link MxstarParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(MxstarParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(MxstarParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#classDefinition}.
	 * @param ctx the parse tree
	 */
	void enterClassDefinition(MxstarParser.ClassDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#classDefinition}.
	 * @param ctx the parse tree
	 */
	void exitClassDefinition(MxstarParser.ClassDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#classBody}.
	 * @param ctx the parse tree
	 */
	void enterClassBody(MxstarParser.ClassBodyContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#classBody}.
	 * @param ctx the parse tree
	 */
	void exitClassBody(MxstarParser.ClassBodyContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#className}.
	 * @param ctx the parse tree
	 */
	void enterClassName(MxstarParser.ClassNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#className}.
	 * @param ctx the parse tree
	 */
	void exitClassName(MxstarParser.ClassNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#methodDefinition}.
	 * @param ctx the parse tree
	 */
	void enterMethodDefinition(MxstarParser.MethodDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#methodDefinition}.
	 * @param ctx the parse tree
	 */
	void exitMethodDefinition(MxstarParser.MethodDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#memberDefinition}.
	 * @param ctx the parse tree
	 */
	void enterMemberDefinition(MxstarParser.MemberDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#memberDefinition}.
	 * @param ctx the parse tree
	 */
	void exitMemberDefinition(MxstarParser.MemberDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code variableDefinitionWithoutAssignment}
	 * labeled alternative in {@link MxstarParser#variableDefinition}.
	 * @param ctx the parse tree
	 */
	void enterVariableDefinitionWithoutAssignment(MxstarParser.VariableDefinitionWithoutAssignmentContext ctx);
	/**
	 * Exit a parse tree produced by the {@code variableDefinitionWithoutAssignment}
	 * labeled alternative in {@link MxstarParser#variableDefinition}.
	 * @param ctx the parse tree
	 */
	void exitVariableDefinitionWithoutAssignment(MxstarParser.VariableDefinitionWithoutAssignmentContext ctx);
	/**
	 * Enter a parse tree produced by the {@code variableDefinitionWithAssignment}
	 * labeled alternative in {@link MxstarParser#variableDefinition}.
	 * @param ctx the parse tree
	 */
	void enterVariableDefinitionWithAssignment(MxstarParser.VariableDefinitionWithAssignmentContext ctx);
	/**
	 * Exit a parse tree produced by the {@code variableDefinitionWithAssignment}
	 * labeled alternative in {@link MxstarParser#variableDefinition}.
	 * @param ctx the parse tree
	 */
	void exitVariableDefinitionWithAssignment(MxstarParser.VariableDefinitionWithAssignmentContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#variableType}.
	 * @param ctx the parse tree
	 */
	void enterVariableType(MxstarParser.VariableTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#variableType}.
	 * @param ctx the parse tree
	 */
	void exitVariableType(MxstarParser.VariableTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#variableBasicType}.
	 * @param ctx the parse tree
	 */
	void enterVariableBasicType(MxstarParser.VariableBasicTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#variableBasicType}.
	 * @param ctx the parse tree
	 */
	void exitVariableBasicType(MxstarParser.VariableBasicTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#functionDefinition}.
	 * @param ctx the parse tree
	 */
	void enterFunctionDefinition(MxstarParser.FunctionDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#functionDefinition}.
	 * @param ctx the parse tree
	 */
	void exitFunctionDefinition(MxstarParser.FunctionDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#functionName}.
	 * @param ctx the parse tree
	 */
	void enterFunctionName(MxstarParser.FunctionNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#functionName}.
	 * @param ctx the parse tree
	 */
	void exitFunctionName(MxstarParser.FunctionNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void enterParameterList(MxstarParser.ParameterListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void exitParameterList(MxstarParser.ParameterListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#parameter}.
	 * @param ctx the parse tree
	 */
	void enterParameter(MxstarParser.ParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#parameter}.
	 * @param ctx the parse tree
	 */
	void exitParameter(MxstarParser.ParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#variableName}.
	 * @param ctx the parse tree
	 */
	void enterVariableName(MxstarParser.VariableNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#variableName}.
	 * @param ctx the parse tree
	 */
	void exitVariableName(MxstarParser.VariableNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#globalVariableDefinition}.
	 * @param ctx the parse tree
	 */
	void enterGlobalVariableDefinition(MxstarParser.GlobalVariableDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#globalVariableDefinition}.
	 * @param ctx the parse tree
	 */
	void exitGlobalVariableDefinition(MxstarParser.GlobalVariableDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(MxstarParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(MxstarParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by the {@code blockStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterBlockStatement(MxstarParser.BlockStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code blockStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitBlockStatement(MxstarParser.BlockStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ifStmt}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterIfStmt(MxstarParser.IfStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ifStmt}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitIfStmt(MxstarParser.IfStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code whileStmt}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterWhileStmt(MxstarParser.WhileStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code whileStmt}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitWhileStmt(MxstarParser.WhileStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code forStmt}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterForStmt(MxstarParser.ForStmtContext ctx);
	/**
	 * Exit a parse tree produced by the {@code forStmt}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitForStmt(MxstarParser.ForStmtContext ctx);
	/**
	 * Enter a parse tree produced by the {@code returnStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterReturnStatement(MxstarParser.ReturnStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code returnStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitReturnStatement(MxstarParser.ReturnStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code breakStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterBreakStatement(MxstarParser.BreakStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code breakStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitBreakStatement(MxstarParser.BreakStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code continueStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterContinueStatement(MxstarParser.ContinueStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code continueStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitContinueStatement(MxstarParser.ContinueStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code variableDefinitionStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterVariableDefinitionStatement(MxstarParser.VariableDefinitionStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code variableDefinitionStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitVariableDefinitionStatement(MxstarParser.VariableDefinitionStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expressionStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterExpressionStatement(MxstarParser.ExpressionStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expressionStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitExpressionStatement(MxstarParser.ExpressionStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code emptyStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterEmptyStatement(MxstarParser.EmptyStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code emptyStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitEmptyStatement(MxstarParser.EmptyStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#statementOrBlock}.
	 * @param ctx the parse tree
	 */
	void enterStatementOrBlock(MxstarParser.StatementOrBlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#statementOrBlock}.
	 * @param ctx the parse tree
	 */
	void exitStatementOrBlock(MxstarParser.StatementOrBlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void enterIfStatement(MxstarParser.IfStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void exitIfStatement(MxstarParser.IfStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#elseBlock}.
	 * @param ctx the parse tree
	 */
	void enterElseBlock(MxstarParser.ElseBlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#elseBlock}.
	 * @param ctx the parse tree
	 */
	void exitElseBlock(MxstarParser.ElseBlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#whileStatement}.
	 * @param ctx the parse tree
	 */
	void enterWhileStatement(MxstarParser.WhileStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#whileStatement}.
	 * @param ctx the parse tree
	 */
	void exitWhileStatement(MxstarParser.WhileStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#forStatement}.
	 * @param ctx the parse tree
	 */
	void enterForStatement(MxstarParser.ForStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#forStatement}.
	 * @param ctx the parse tree
	 */
	void exitForStatement(MxstarParser.ForStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code logicOr}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterLogicOr(MxstarParser.LogicOrContext ctx);
	/**
	 * Exit a parse tree produced by the {@code logicOr}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitLogicOr(MxstarParser.LogicOrContext ctx);
	/**
	 * Enter a parse tree produced by the {@code shift}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterShift(MxstarParser.ShiftContext ctx);
	/**
	 * Exit a parse tree produced by the {@code shift}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitShift(MxstarParser.ShiftContext ctx);
	/**
	 * Enter a parse tree produced by the {@code relationOperator}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterRelationOperator(MxstarParser.RelationOperatorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code relationOperator}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitRelationOperator(MxstarParser.RelationOperatorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code newVariableWithoutExp}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterNewVariableWithoutExp(MxstarParser.NewVariableWithoutExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code newVariableWithoutExp}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitNewVariableWithoutExp(MxstarParser.NewVariableWithoutExpContext ctx);
	/**
	 * Enter a parse tree produced by the {@code newVariable}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterNewVariable(MxstarParser.NewVariableContext ctx);
	/**
	 * Exit a parse tree produced by the {@code newVariable}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitNewVariable(MxstarParser.NewVariableContext ctx);
	/**
	 * Enter a parse tree produced by the {@code logicAnd}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterLogicAnd(MxstarParser.LogicAndContext ctx);
	/**
	 * Exit a parse tree produced by the {@code logicAnd}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitLogicAnd(MxstarParser.LogicAndContext ctx);
	/**
	 * Enter a parse tree produced by the {@code and}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterAnd(MxstarParser.AndContext ctx);
	/**
	 * Exit a parse tree produced by the {@code and}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitAnd(MxstarParser.AndContext ctx);
	/**
	 * Enter a parse tree produced by the {@code prefixOperator}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterPrefixOperator(MxstarParser.PrefixOperatorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code prefixOperator}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitPrefixOperator(MxstarParser.PrefixOperatorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code xor}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterXor(MxstarParser.XorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code xor}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitXor(MxstarParser.XorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code mulDivMod}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterMulDivMod(MxstarParser.MulDivModContext ctx);
	/**
	 * Exit a parse tree produced by the {@code mulDivMod}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitMulDivMod(MxstarParser.MulDivModContext ctx);
	/**
	 * Enter a parse tree produced by the {@code parentheses}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterParentheses(MxstarParser.ParenthesesContext ctx);
	/**
	 * Exit a parse tree produced by the {@code parentheses}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitParentheses(MxstarParser.ParenthesesContext ctx);
	/**
	 * Enter a parse tree produced by the {@code dotExpression}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterDotExpression(MxstarParser.DotExpressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code dotExpression}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitDotExpression(MxstarParser.DotExpressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code or}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterOr(MxstarParser.OrContext ctx);
	/**
	 * Exit a parse tree produced by the {@code or}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitOr(MxstarParser.OrContext ctx);
	/**
	 * Enter a parse tree produced by the {@code constNumber}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterConstNumber(MxstarParser.ConstNumberContext ctx);
	/**
	 * Exit a parse tree produced by the {@code constNumber}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitConstNumber(MxstarParser.ConstNumberContext ctx);
	/**
	 * Enter a parse tree produced by the {@code false}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterFalse(MxstarParser.FalseContext ctx);
	/**
	 * Exit a parse tree produced by the {@code false}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitFalse(MxstarParser.FalseContext ctx);
	/**
	 * Enter a parse tree produced by the {@code newArray}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterNewArray(MxstarParser.NewArrayContext ctx);
	/**
	 * Exit a parse tree produced by the {@code newArray}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitNewArray(MxstarParser.NewArrayContext ctx);
	/**
	 * Enter a parse tree produced by the {@code getValue}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterGetValue(MxstarParser.GetValueContext ctx);
	/**
	 * Exit a parse tree produced by the {@code getValue}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitGetValue(MxstarParser.GetValueContext ctx);
	/**
	 * Enter a parse tree produced by the {@code constString}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterConstString(MxstarParser.ConstStringContext ctx);
	/**
	 * Exit a parse tree produced by the {@code constString}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitConstString(MxstarParser.ConstStringContext ctx);
	/**
	 * Enter a parse tree produced by the {@code equalOrNot}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterEqualOrNot(MxstarParser.EqualOrNotContext ctx);
	/**
	 * Exit a parse tree produced by the {@code equalOrNot}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitEqualOrNot(MxstarParser.EqualOrNotContext ctx);
	/**
	 * Enter a parse tree produced by the {@code null}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterNull(MxstarParser.NullContext ctx);
	/**
	 * Exit a parse tree produced by the {@code null}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitNull(MxstarParser.NullContext ctx);
	/**
	 * Enter a parse tree produced by the {@code addSubtract}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterAddSubtract(MxstarParser.AddSubtractContext ctx);
	/**
	 * Exit a parse tree produced by the {@code addSubtract}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitAddSubtract(MxstarParser.AddSubtractContext ctx);
	/**
	 * Enter a parse tree produced by the {@code functionCall}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterFunctionCall(MxstarParser.FunctionCallContext ctx);
	/**
	 * Exit a parse tree produced by the {@code functionCall}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitFunctionCall(MxstarParser.FunctionCallContext ctx);
	/**
	 * Enter a parse tree produced by the {@code suffixOperator}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterSuffixOperator(MxstarParser.SuffixOperatorContext ctx);
	/**
	 * Exit a parse tree produced by the {@code suffixOperator}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitSuffixOperator(MxstarParser.SuffixOperatorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code true}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterTrue(MxstarParser.TrueContext ctx);
	/**
	 * Exit a parse tree produced by the {@code true}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitTrue(MxstarParser.TrueContext ctx);
	/**
	 * Enter a parse tree produced by the {@code methodCall}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterMethodCall(MxstarParser.MethodCallContext ctx);
	/**
	 * Exit a parse tree produced by the {@code methodCall}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitMethodCall(MxstarParser.MethodCallContext ctx);
	/**
	 * Enter a parse tree produced by the {@code assign}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterAssign(MxstarParser.AssignContext ctx);
	/**
	 * Exit a parse tree produced by the {@code assign}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitAssign(MxstarParser.AssignContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#index}.
	 * @param ctx the parse tree
	 */
	void enterIndex(MxstarParser.IndexContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#index}.
	 * @param ctx the parse tree
	 */
	void exitIndex(MxstarParser.IndexContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#variable}.
	 * @param ctx the parse tree
	 */
	void enterVariable(MxstarParser.VariableContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#variable}.
	 * @param ctx the parse tree
	 */
	void exitVariable(MxstarParser.VariableContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#pointerValue}.
	 * @param ctx the parse tree
	 */
	void enterPointerValue(MxstarParser.PointerValueContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#pointerValue}.
	 * @param ctx the parse tree
	 */
	void exitPointerValue(MxstarParser.PointerValueContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#leftValue}.
	 * @param ctx the parse tree
	 */
	void enterLeftValue(MxstarParser.LeftValueContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#leftValue}.
	 * @param ctx the parse tree
	 */
	void exitLeftValue(MxstarParser.LeftValueContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxstarParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void enterExpressionList(MxstarParser.ExpressionListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void exitExpressionList(MxstarParser.ExpressionListContext ctx);
}