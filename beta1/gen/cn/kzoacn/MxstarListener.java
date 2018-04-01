// Generated from /home/kzoacn/Compiler2018/beta1/src/cn/kzoacn/Mxstar.g4 by ANTLR 4.7
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
	 * Enter a parse tree produced by {@link MxstarParser#definition}.
	 * @param ctx the parse tree
	 */
	void enterDefinition(MxstarParser.DefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#definition}.
	 * @param ctx the parse tree
	 */
	void exitDefinition(MxstarParser.DefinitionContext ctx);
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
	 * Enter a parse tree produced by {@link MxstarParser#variableDefinition}.
	 * @param ctx the parse tree
	 */
	void enterVariableDefinition(MxstarParser.VariableDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#variableDefinition}.
	 * @param ctx the parse tree
	 */
	void exitVariableDefinition(MxstarParser.VariableDefinitionContext ctx);
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
	 * Enter a parse tree produced by {@link MxstarParser#constructionFunctionDefinition}.
	 * @param ctx the parse tree
	 */
	void enterConstructionFunctionDefinition(MxstarParser.ConstructionFunctionDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#constructionFunctionDefinition}.
	 * @param ctx the parse tree
	 */
	void exitConstructionFunctionDefinition(MxstarParser.ConstructionFunctionDefinitionContext ctx);
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
	 * Enter a parse tree produced by {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterStatement(MxstarParser.StatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitStatement(MxstarParser.StatementContext ctx);
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
	 * Enter a parse tree produced by {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(MxstarParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(MxstarParser.ExpressionContext ctx);
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