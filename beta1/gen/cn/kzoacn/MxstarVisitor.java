// Generated from /home/kzoacn/Compiler2018/beta1/src/cn/kzoacn/Mxstar.g4 by ANTLR 4.7
package cn.kzoacn;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link MxstarParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface MxstarVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link MxstarParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(MxstarParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#definition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDefinition(MxstarParser.DefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#classDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassDefinition(MxstarParser.ClassDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#classBody}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassBody(MxstarParser.ClassBodyContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#className}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassName(MxstarParser.ClassNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#methodDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMethodDefinition(MxstarParser.MethodDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#variableDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableDefinition(MxstarParser.VariableDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#variableType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableType(MxstarParser.VariableTypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#variableBasicType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableBasicType(MxstarParser.VariableBasicTypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#functionDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionDefinition(MxstarParser.FunctionDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#constructionFunctionDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstructionFunctionDefinition(MxstarParser.ConstructionFunctionDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#functionName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionName(MxstarParser.FunctionNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#parameterList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParameterList(MxstarParser.ParameterListContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#parameter}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParameter(MxstarParser.ParameterContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#variableName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableName(MxstarParser.VariableNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#globalVariableDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGlobalVariableDefinition(MxstarParser.GlobalVariableDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#block}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlock(MxstarParser.BlockContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatement(MxstarParser.StatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#ifStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIfStatement(MxstarParser.IfStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#whileStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWhileStatement(MxstarParser.WhileStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#forStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitForStatement(MxstarParser.ForStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpression(MxstarParser.ExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#expressionList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpressionList(MxstarParser.ExpressionListContext ctx);
}