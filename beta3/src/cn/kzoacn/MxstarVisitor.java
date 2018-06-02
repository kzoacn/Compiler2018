// Generated from /home/kzoacn/tester/Compiler2018/beta3/src/cn/kzoacn/Mxstar.g4 by ANTLR 4.7
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
	 * Visit a parse tree produced by {@link MxstarParser#memberDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMemberDefinition(MxstarParser.MemberDefinitionContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#bracket}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBracket(MxstarParser.BracketContext ctx);
	/**
	 * Visit a parse tree produced by the {@code variableDefinitionWithoutAssignment}
	 * labeled alternative in {@link MxstarParser#variableDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableDefinitionWithoutAssignment(MxstarParser.VariableDefinitionWithoutAssignmentContext ctx);
	/**
	 * Visit a parse tree produced by the {@code variableDefinitionWithAssignment}
	 * labeled alternative in {@link MxstarParser#variableDefinition}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableDefinitionWithAssignment(MxstarParser.VariableDefinitionWithAssignmentContext ctx);
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
	 * Visit a parse tree produced by {@link MxstarParser#functionBody}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionBody(MxstarParser.FunctionBodyContext ctx);
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
	 * Visit a parse tree produced by the {@code blockStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBlockStatement(MxstarParser.BlockStatementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code ifStmt}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIfStmt(MxstarParser.IfStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code whileStmt}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWhileStmt(MxstarParser.WhileStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code forStmt}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitForStmt(MxstarParser.ForStmtContext ctx);
	/**
	 * Visit a parse tree produced by the {@code returnStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReturnStatement(MxstarParser.ReturnStatementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code breakStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBreakStatement(MxstarParser.BreakStatementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code continueStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitContinueStatement(MxstarParser.ContinueStatementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code variableDefinitionStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariableDefinitionStatement(MxstarParser.VariableDefinitionStatementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code expressionStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpressionStatement(MxstarParser.ExpressionStatementContext ctx);
	/**
	 * Visit a parse tree produced by the {@code emptyStatement}
	 * labeled alternative in {@link MxstarParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEmptyStatement(MxstarParser.EmptyStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#statementOrBlock}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatementOrBlock(MxstarParser.StatementOrBlockContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#ifStatement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIfStatement(MxstarParser.IfStatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#elseBlock}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitElseBlock(MxstarParser.ElseBlockContext ctx);
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
	 * Visit a parse tree produced by {@link MxstarParser#dotAtom}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDotAtom(MxstarParser.DotAtomContext ctx);
	/**
	 * Visit a parse tree produced by the {@code hyperDotExpression}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitHyperDotExpression(MxstarParser.HyperDotExpressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code logicOr}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogicOr(MxstarParser.LogicOrContext ctx);
	/**
	 * Visit a parse tree produced by the {@code shift}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitShift(MxstarParser.ShiftContext ctx);
	/**
	 * Visit a parse tree produced by the {@code relationOperator}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRelationOperator(MxstarParser.RelationOperatorContext ctx);
	/**
	 * Visit a parse tree produced by the {@code newVariableWithoutExp}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewVariableWithoutExp(MxstarParser.NewVariableWithoutExpContext ctx);
	/**
	 * Visit a parse tree produced by the {@code prefixLvalueOperator}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPrefixLvalueOperator(MxstarParser.PrefixLvalueOperatorContext ctx);
	/**
	 * Visit a parse tree produced by the {@code newVariable}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewVariable(MxstarParser.NewVariableContext ctx);
	/**
	 * Visit a parse tree produced by the {@code logicAnd}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogicAnd(MxstarParser.LogicAndContext ctx);
	/**
	 * Visit a parse tree produced by the {@code and}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAnd(MxstarParser.AndContext ctx);
	/**
	 * Visit a parse tree produced by the {@code prefixOperator}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPrefixOperator(MxstarParser.PrefixOperatorContext ctx);
	/**
	 * Visit a parse tree produced by the {@code xor}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitXor(MxstarParser.XorContext ctx);
	/**
	 * Visit a parse tree produced by the {@code mulDivMod}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMulDivMod(MxstarParser.MulDivModContext ctx);
	/**
	 * Visit a parse tree produced by the {@code parentheses}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParentheses(MxstarParser.ParenthesesContext ctx);
	/**
	 * Visit a parse tree produced by the {@code dotExpression}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDotExpression(MxstarParser.DotExpressionContext ctx);
	/**
	 * Visit a parse tree produced by the {@code or}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitOr(MxstarParser.OrContext ctx);
	/**
	 * Visit a parse tree produced by the {@code constNumber}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstNumber(MxstarParser.ConstNumberContext ctx);
	/**
	 * Visit a parse tree produced by the {@code false}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFalse(MxstarParser.FalseContext ctx);
	/**
	 * Visit a parse tree produced by the {@code newArray}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNewArray(MxstarParser.NewArrayContext ctx);
	/**
	 * Visit a parse tree produced by the {@code getValue}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGetValue(MxstarParser.GetValueContext ctx);
	/**
	 * Visit a parse tree produced by the {@code constString}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstString(MxstarParser.ConstStringContext ctx);
	/**
	 * Visit a parse tree produced by the {@code equalOrNot}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitEqualOrNot(MxstarParser.EqualOrNotContext ctx);
	/**
	 * Visit a parse tree produced by the {@code null}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitNull(MxstarParser.NullContext ctx);
	/**
	 * Visit a parse tree produced by the {@code addSubtract}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAddSubtract(MxstarParser.AddSubtractContext ctx);
	/**
	 * Visit a parse tree produced by the {@code functionCall}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunctionCall(MxstarParser.FunctionCallContext ctx);
	/**
	 * Visit a parse tree produced by the {@code suffixOperator}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSuffixOperator(MxstarParser.SuffixOperatorContext ctx);
	/**
	 * Visit a parse tree produced by the {@code true}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTrue(MxstarParser.TrueContext ctx);
	/**
	 * Visit a parse tree produced by the {@code methodCall}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMethodCall(MxstarParser.MethodCallContext ctx);
	/**
	 * Visit a parse tree produced by the {@code assign}
	 * labeled alternative in {@link MxstarParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssign(MxstarParser.AssignContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#index}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIndex(MxstarParser.IndexContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#variable}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVariable(MxstarParser.VariableContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#pointerValue}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPointerValue(MxstarParser.PointerValueContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#leftValue}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLeftValue(MxstarParser.LeftValueContext ctx);
	/**
	 * Visit a parse tree produced by {@link MxstarParser#expressionList}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpressionList(MxstarParser.ExpressionListContext ctx);
}