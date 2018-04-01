// Generated from /home/kzoacn/Compiler2018/ParserTest/src/test.g4 by ANTLR 4.7
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link testParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface testVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link testParser#functionDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionDefinition(testParser.FunctionDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#functionName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionName(testParser.FunctionNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#constructFunctionDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstructFunctionDefinition(testParser.ConstructFunctionDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#parameterList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParameterList(testParser.ParameterListContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#parameter}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParameter(testParser.ParameterContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(testParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#definition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDefinition(testParser.DefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#classDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassDefinition(testParser.ClassDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#className}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassName(testParser.ClassNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#classVariableDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClassVariableDefinition(testParser.ClassVariableDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#methodDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMethodDefinition(testParser.MethodDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#variableDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableDefinition(testParser.VariableDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#variableType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableType(testParser.VariableTypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#variableBasicType}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableBasicType(testParser.VariableBasicTypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#variableName}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableName(testParser.VariableNameContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#globalVariableDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGlobalVariableDefinition(testParser.GlobalVariableDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#block}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlock(testParser.BlockContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatement(testParser.StatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#ifStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIfStatement(testParser.IfStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#whileStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWhileStatement(testParser.WhileStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#forStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitForStatement(testParser.ForStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpression(testParser.ExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link testParser#expressionList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpressionList(testParser.ExpressionListContext ctx);
}