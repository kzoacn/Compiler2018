// Generated from /home/kzoacn/Compiler2018/ParserTest/src/test.g4 by ANTLR 4.7
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link testParser}.
 */
public interface testListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link testParser#functionDefinition}.
	 * @param ctx the parse tree
	 */
	void enterFunctionDefinition(testParser.FunctionDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#functionDefinition}.
	 * @param ctx the parse tree
	 */
	void exitFunctionDefinition(testParser.FunctionDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#functionName}.
	 * @param ctx the parse tree
	 */
	void enterFunctionName(testParser.FunctionNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#functionName}.
	 * @param ctx the parse tree
	 */
	void exitFunctionName(testParser.FunctionNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#constructFunctionDefinition}.
	 * @param ctx the parse tree
	 */
	void enterConstructFunctionDefinition(testParser.ConstructFunctionDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#constructFunctionDefinition}.
	 * @param ctx the parse tree
	 */
	void exitConstructFunctionDefinition(testParser.ConstructFunctionDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void enterParameterList(testParser.ParameterListContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#parameterList}.
	 * @param ctx the parse tree
	 */
	void exitParameterList(testParser.ParameterListContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#parameter}.
	 * @param ctx the parse tree
	 */
	void enterParameter(testParser.ParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#parameter}.
	 * @param ctx the parse tree
	 */
	void exitParameter(testParser.ParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(testParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(testParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#definition}.
	 * @param ctx the parse tree
	 */
	void enterDefinition(testParser.DefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#definition}.
	 * @param ctx the parse tree
	 */
	void exitDefinition(testParser.DefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#classDefinition}.
	 * @param ctx the parse tree
	 */
	void enterClassDefinition(testParser.ClassDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#classDefinition}.
	 * @param ctx the parse tree
	 */
	void exitClassDefinition(testParser.ClassDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#className}.
	 * @param ctx the parse tree
	 */
	void enterClassName(testParser.ClassNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#className}.
	 * @param ctx the parse tree
	 */
	void exitClassName(testParser.ClassNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#classVariableDefinition}.
	 * @param ctx the parse tree
	 */
	void enterClassVariableDefinition(testParser.ClassVariableDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#classVariableDefinition}.
	 * @param ctx the parse tree
	 */
	void exitClassVariableDefinition(testParser.ClassVariableDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#methodDefinition}.
	 * @param ctx the parse tree
	 */
	void enterMethodDefinition(testParser.MethodDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#methodDefinition}.
	 * @param ctx the parse tree
	 */
	void exitMethodDefinition(testParser.MethodDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#variableDefinition}.
	 * @param ctx the parse tree
	 */
	void enterVariableDefinition(testParser.VariableDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#variableDefinition}.
	 * @param ctx the parse tree
	 */
	void exitVariableDefinition(testParser.VariableDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#variableType}.
	 * @param ctx the parse tree
	 */
	void enterVariableType(testParser.VariableTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#variableType}.
	 * @param ctx the parse tree
	 */
	void exitVariableType(testParser.VariableTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#variableBasicType}.
	 * @param ctx the parse tree
	 */
	void enterVariableBasicType(testParser.VariableBasicTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#variableBasicType}.
	 * @param ctx the parse tree
	 */
	void exitVariableBasicType(testParser.VariableBasicTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#variableName}.
	 * @param ctx the parse tree
	 */
	void enterVariableName(testParser.VariableNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#variableName}.
	 * @param ctx the parse tree
	 */
	void exitVariableName(testParser.VariableNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#globalVariableDefinition}.
	 * @param ctx the parse tree
	 */
	void enterGlobalVariableDefinition(testParser.GlobalVariableDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#globalVariableDefinition}.
	 * @param ctx the parse tree
	 */
	void exitGlobalVariableDefinition(testParser.GlobalVariableDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(testParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(testParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(testParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(testParser.StatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void enterIfStatement(testParser.IfStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#ifStatement}.
	 * @param ctx the parse tree
	 */
	void exitIfStatement(testParser.IfStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#whileStatement}.
	 * @param ctx the parse tree
	 */
	void enterWhileStatement(testParser.WhileStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#whileStatement}.
	 * @param ctx the parse tree
	 */
	void exitWhileStatement(testParser.WhileStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#forStatement}.
	 * @param ctx the parse tree
	 */
	void enterForStatement(testParser.ForStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#forStatement}.
	 * @param ctx the parse tree
	 */
	void exitForStatement(testParser.ForStatementContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(testParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(testParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link testParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void enterExpressionList(testParser.ExpressionListContext ctx);
	/**
	 * Exit a parse tree produced by {@link testParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void exitExpressionList(testParser.ExpressionListContext ctx);
}