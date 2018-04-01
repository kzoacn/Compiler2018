// Generated from /home/kzoacn/Compiler2018/ParserTest/src/test.g4 by ANTLR 4.7
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class testParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.7", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, Identifier=13, ConstNumber=14, ConstString=15, 
		PrefixUnaryOperator=16, SufixUnaryOperator=17, BinaryOperator=18, CLASS=19, 
		INT=20, STRING=21, RETURN=22, BREAK=23, CONTINUE=24, IF=25, ELSE=26, WHILE=27, 
		FOR=28, NEW=29, DIGIT=30, Whitespace=31, Newline=32, BlockComment=33, 
		LineComment=34;
	public static final int
		RULE_functionDefinition = 0, RULE_functionName = 1, RULE_constructFunctionDefinition = 2, 
		RULE_parameterList = 3, RULE_parameter = 4, RULE_program = 5, RULE_definition = 6, 
		RULE_classDefinition = 7, RULE_className = 8, RULE_classVariableDefinition = 9, 
		RULE_methodDefinition = 10, RULE_variableDefinition = 11, RULE_variableType = 12, 
		RULE_variableBasicType = 13, RULE_variableName = 14, RULE_globalVariableDefinition = 15, 
		RULE_block = 16, RULE_statement = 17, RULE_ifStatement = 18, RULE_whileStatement = 19, 
		RULE_forStatement = 20, RULE_expression = 21, RULE_expressionList = 22;
	public static final String[] ruleNames = {
		"functionDefinition", "functionName", "constructFunctionDefinition", "parameterList", 
		"parameter", "program", "definition", "classDefinition", "className", 
		"classVariableDefinition", "methodDefinition", "variableDefinition", "variableType", 
		"variableBasicType", "variableName", "globalVariableDefinition", "block", 
		"statement", "ifStatement", "whileStatement", "forStatement", "expression", 
		"expressionList"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'('", "')'", "'()'", "','", "'{'", "'}'", "'='", "';'", "'[]'", 
		"'['", "']'", "'.'", null, null, null, null, null, null, "'class'", "'int'", 
		"'string'", "'return'", "'break'", "'continue'", "'if'", "'else'", "'while'", 
		"'for'", "'new'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, "Identifier", "ConstNumber", "ConstString", "PrefixUnaryOperator", 
		"SufixUnaryOperator", "BinaryOperator", "CLASS", "INT", "STRING", "RETURN", 
		"BREAK", "CONTINUE", "IF", "ELSE", "WHILE", "FOR", "NEW", "DIGIT", "Whitespace", 
		"Newline", "BlockComment", "LineComment"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "test.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public testParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class FunctionDefinitionContext extends ParserRuleContext {
		public VariableTypeContext variableType() {
			return getRuleContext(VariableTypeContext.class,0);
		}
		public FunctionNameContext functionName() {
			return getRuleContext(FunctionNameContext.class,0);
		}
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public ParameterListContext parameterList() {
			return getRuleContext(ParameterListContext.class,0);
		}
		public FunctionDefinitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_functionDefinition; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterFunctionDefinition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitFunctionDefinition(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitFunctionDefinition(this);
			else return visitor.visitChildren(this);
		}
	}

	public final FunctionDefinitionContext functionDefinition() throws RecognitionException {
		FunctionDefinitionContext _localctx = new FunctionDefinitionContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_functionDefinition);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(46);
			variableType();
			setState(47);
			functionName();
			setState(48);
			match(T__0);
			setState(50);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Identifier) | (1L << INT) | (1L << STRING))) != 0)) {
				{
				setState(49);
				parameterList();
				}
			}

			setState(52);
			match(T__1);
			setState(53);
			block();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FunctionNameContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(testParser.Identifier, 0); }
		public FunctionNameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_functionName; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterFunctionName(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitFunctionName(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitFunctionName(this);
			else return visitor.visitChildren(this);
		}
	}

	public final FunctionNameContext functionName() throws RecognitionException {
		FunctionNameContext _localctx = new FunctionNameContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_functionName);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(55);
			match(Identifier);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ConstructFunctionDefinitionContext extends ParserRuleContext {
		public ClassNameContext className() {
			return getRuleContext(ClassNameContext.class,0);
		}
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public ConstructFunctionDefinitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_constructFunctionDefinition; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterConstructFunctionDefinition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitConstructFunctionDefinition(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitConstructFunctionDefinition(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ConstructFunctionDefinitionContext constructFunctionDefinition() throws RecognitionException {
		ConstructFunctionDefinitionContext _localctx = new ConstructFunctionDefinitionContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_constructFunctionDefinition);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(57);
			className();
			setState(58);
			match(T__2);
			setState(59);
			block();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ParameterListContext extends ParserRuleContext {
		public List<ParameterContext> parameter() {
			return getRuleContexts(ParameterContext.class);
		}
		public ParameterContext parameter(int i) {
			return getRuleContext(ParameterContext.class,i);
		}
		public ParameterListContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_parameterList; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterParameterList(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitParameterList(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitParameterList(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ParameterListContext parameterList() throws RecognitionException {
		ParameterListContext _localctx = new ParameterListContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_parameterList);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(61);
			parameter();
			setState(66);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__3) {
				{
				{
				setState(62);
				match(T__3);
				setState(63);
				parameter();
				}
				}
				setState(68);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ParameterContext extends ParserRuleContext {
		public VariableTypeContext variableType() {
			return getRuleContext(VariableTypeContext.class,0);
		}
		public VariableNameContext variableName() {
			return getRuleContext(VariableNameContext.class,0);
		}
		public ParameterContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_parameter; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterParameter(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitParameter(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitParameter(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ParameterContext parameter() throws RecognitionException {
		ParameterContext _localctx = new ParameterContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_parameter);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(69);
			variableType();
			setState(70);
			variableName();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ProgramContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(testParser.EOF, 0); }
		public List<DefinitionContext> definition() {
			return getRuleContexts(DefinitionContext.class);
		}
		public DefinitionContext definition(int i) {
			return getRuleContext(DefinitionContext.class,i);
		}
		public ProgramContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_program; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterProgram(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitProgram(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitProgram(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_program);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(73); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(72);
				definition();
				}
				}
				setState(75); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Identifier) | (1L << CLASS) | (1L << INT) | (1L << STRING))) != 0) );
			setState(77);
			match(EOF);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class DefinitionContext extends ParserRuleContext {
		public ClassDefinitionContext classDefinition() {
			return getRuleContext(ClassDefinitionContext.class,0);
		}
		public FunctionDefinitionContext functionDefinition() {
			return getRuleContext(FunctionDefinitionContext.class,0);
		}
		public GlobalVariableDefinitionContext globalVariableDefinition() {
			return getRuleContext(GlobalVariableDefinitionContext.class,0);
		}
		public DefinitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_definition; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterDefinition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitDefinition(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitDefinition(this);
			else return visitor.visitChildren(this);
		}
	}

	public final DefinitionContext definition() throws RecognitionException {
		DefinitionContext _localctx = new DefinitionContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_definition);
		try {
			setState(82);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,3,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(79);
				classDefinition();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(80);
				functionDefinition();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(81);
				globalVariableDefinition();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ClassDefinitionContext extends ParserRuleContext {
		public ClassNameContext className() {
			return getRuleContext(ClassNameContext.class,0);
		}
		public List<ClassDefinitionContext> classDefinition() {
			return getRuleContexts(ClassDefinitionContext.class);
		}
		public ClassDefinitionContext classDefinition(int i) {
			return getRuleContext(ClassDefinitionContext.class,i);
		}
		public List<MethodDefinitionContext> methodDefinition() {
			return getRuleContexts(MethodDefinitionContext.class);
		}
		public MethodDefinitionContext methodDefinition(int i) {
			return getRuleContext(MethodDefinitionContext.class,i);
		}
		public ClassDefinitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classDefinition; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterClassDefinition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitClassDefinition(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitClassDefinition(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ClassDefinitionContext classDefinition() throws RecognitionException {
		ClassDefinitionContext _localctx = new ClassDefinitionContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_classDefinition);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(84);
			match(CLASS);
			setState(85);
			className();
			setState(86);
			match(T__4);
			setState(91);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << Identifier) | (1L << CLASS) | (1L << INT) | (1L << STRING))) != 0)) {
				{
				setState(89);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case CLASS:
					{
					setState(87);
					classDefinition();
					}
					break;
				case Identifier:
				case INT:
				case STRING:
					{
					setState(88);
					methodDefinition();
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				}
				setState(93);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(94);
			match(T__5);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ClassNameContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(testParser.Identifier, 0); }
		public ClassNameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_className; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterClassName(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitClassName(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitClassName(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ClassNameContext className() throws RecognitionException {
		ClassNameContext _localctx = new ClassNameContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_className);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(96);
			match(Identifier);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ClassVariableDefinitionContext extends ParserRuleContext {
		public VariableDefinitionContext variableDefinition() {
			return getRuleContext(VariableDefinitionContext.class,0);
		}
		public ClassVariableDefinitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classVariableDefinition; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterClassVariableDefinition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitClassVariableDefinition(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitClassVariableDefinition(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ClassVariableDefinitionContext classVariableDefinition() throws RecognitionException {
		ClassVariableDefinitionContext _localctx = new ClassVariableDefinitionContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_classVariableDefinition);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(98);
			variableDefinition();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MethodDefinitionContext extends ParserRuleContext {
		public FunctionDefinitionContext functionDefinition() {
			return getRuleContext(FunctionDefinitionContext.class,0);
		}
		public ConstructFunctionDefinitionContext constructFunctionDefinition() {
			return getRuleContext(ConstructFunctionDefinitionContext.class,0);
		}
		public MethodDefinitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_methodDefinition; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterMethodDefinition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitMethodDefinition(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitMethodDefinition(this);
			else return visitor.visitChildren(this);
		}
	}

	public final MethodDefinitionContext methodDefinition() throws RecognitionException {
		MethodDefinitionContext _localctx = new MethodDefinitionContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_methodDefinition);
		try {
			setState(102);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,6,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(100);
				functionDefinition();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(101);
				constructFunctionDefinition();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VariableDefinitionContext extends ParserRuleContext {
		public VariableTypeContext variableType() {
			return getRuleContext(VariableTypeContext.class,0);
		}
		public VariableNameContext variableName() {
			return getRuleContext(VariableNameContext.class,0);
		}
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public VariableDefinitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_variableDefinition; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterVariableDefinition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitVariableDefinition(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitVariableDefinition(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VariableDefinitionContext variableDefinition() throws RecognitionException {
		VariableDefinitionContext _localctx = new VariableDefinitionContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_variableDefinition);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(104);
			variableType();
			setState(105);
			variableName();
			setState(108);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__6) {
				{
				setState(106);
				match(T__6);
				setState(107);
				expression(0);
				}
			}

			setState(110);
			match(T__7);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VariableTypeContext extends ParserRuleContext {
		public TerminalNode INT() { return getToken(testParser.INT, 0); }
		public TerminalNode STRING() { return getToken(testParser.STRING, 0); }
		public VariableBasicTypeContext variableBasicType() {
			return getRuleContext(VariableBasicTypeContext.class,0);
		}
		public VariableTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_variableType; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterVariableType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitVariableType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitVariableType(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VariableTypeContext variableType() throws RecognitionException {
		VariableTypeContext _localctx = new VariableTypeContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_variableType);
		int _la;
		try {
			setState(133);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case INT:
				enterOuterAlt(_localctx, 1);
				{
				setState(112);
				match(INT);
				setState(116);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==T__8) {
					{
					{
					setState(113);
					match(T__8);
					}
					}
					setState(118);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
				break;
			case STRING:
				enterOuterAlt(_localctx, 2);
				{
				setState(119);
				match(STRING);
				setState(123);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==T__8) {
					{
					{
					setState(120);
					match(T__8);
					}
					}
					setState(125);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
				break;
			case Identifier:
				enterOuterAlt(_localctx, 3);
				{
				setState(126);
				variableBasicType();
				setState(130);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==T__8) {
					{
					{
					setState(127);
					match(T__8);
					}
					}
					setState(132);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VariableBasicTypeContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(testParser.Identifier, 0); }
		public VariableBasicTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_variableBasicType; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterVariableBasicType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitVariableBasicType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitVariableBasicType(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VariableBasicTypeContext variableBasicType() throws RecognitionException {
		VariableBasicTypeContext _localctx = new VariableBasicTypeContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_variableBasicType);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(135);
			match(Identifier);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VariableNameContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(testParser.Identifier, 0); }
		public VariableNameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_variableName; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterVariableName(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitVariableName(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitVariableName(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VariableNameContext variableName() throws RecognitionException {
		VariableNameContext _localctx = new VariableNameContext(_ctx, getState());
		enterRule(_localctx, 28, RULE_variableName);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(137);
			match(Identifier);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class GlobalVariableDefinitionContext extends ParserRuleContext {
		public VariableDefinitionContext variableDefinition() {
			return getRuleContext(VariableDefinitionContext.class,0);
		}
		public GlobalVariableDefinitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_globalVariableDefinition; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterGlobalVariableDefinition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitGlobalVariableDefinition(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitGlobalVariableDefinition(this);
			else return visitor.visitChildren(this);
		}
	}

	public final GlobalVariableDefinitionContext globalVariableDefinition() throws RecognitionException {
		GlobalVariableDefinitionContext _localctx = new GlobalVariableDefinitionContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_globalVariableDefinition);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(139);
			variableDefinition();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BlockContext extends ParserRuleContext {
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public BlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_block; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterBlock(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitBlock(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitBlock(this);
			else return visitor.visitChildren(this);
		}
	}

	public final BlockContext block() throws RecognitionException {
		BlockContext _localctx = new BlockContext(_ctx, getState());
		enterRule(_localctx, 32, RULE_block);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(141);
			match(T__4);
			setState(145);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << T__4) | (1L << Identifier) | (1L << ConstNumber) | (1L << ConstString) | (1L << PrefixUnaryOperator) | (1L << INT) | (1L << STRING) | (1L << RETURN) | (1L << BREAK) | (1L << CONTINUE) | (1L << IF) | (1L << WHILE) | (1L << FOR) | (1L << NEW))) != 0)) {
				{
				{
				setState(142);
				statement();
				}
				}
				setState(147);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(148);
			match(T__5);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StatementContext extends ParserRuleContext {
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public VariableDefinitionContext variableDefinition() {
			return getRuleContext(VariableDefinitionContext.class,0);
		}
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public IfStatementContext ifStatement() {
			return getRuleContext(IfStatementContext.class,0);
		}
		public WhileStatementContext whileStatement() {
			return getRuleContext(WhileStatementContext.class,0);
		}
		public ForStatementContext forStatement() {
			return getRuleContext(ForStatementContext.class,0);
		}
		public TerminalNode RETURN() { return getToken(testParser.RETURN, 0); }
		public TerminalNode BREAK() { return getToken(testParser.BREAK, 0); }
		public TerminalNode CONTINUE() { return getToken(testParser.CONTINUE, 0); }
		public StatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_statement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final StatementContext statement() throws RecognitionException {
		StatementContext _localctx = new StatementContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_statement);
		try {
			setState(166);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,13,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(150);
				block();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(151);
				variableDefinition();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(152);
				expression(0);
				setState(153);
				match(T__7);
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(155);
				ifStatement();
				}
				break;
			case 5:
				enterOuterAlt(_localctx, 5);
				{
				setState(156);
				whileStatement();
				}
				break;
			case 6:
				enterOuterAlt(_localctx, 6);
				{
				setState(157);
				forStatement();
				}
				break;
			case 7:
				enterOuterAlt(_localctx, 7);
				{
				setState(158);
				match(RETURN);
				setState(159);
				expression(0);
				setState(160);
				match(T__7);
				}
				break;
			case 8:
				enterOuterAlt(_localctx, 8);
				{
				setState(162);
				match(BREAK);
				setState(163);
				match(T__7);
				}
				break;
			case 9:
				enterOuterAlt(_localctx, 9);
				{
				setState(164);
				match(CONTINUE);
				setState(165);
				match(T__7);
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class IfStatementContext extends ParserRuleContext {
		public TerminalNode IF() { return getToken(testParser.IF, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public List<BlockContext> block() {
			return getRuleContexts(BlockContext.class);
		}
		public BlockContext block(int i) {
			return getRuleContext(BlockContext.class,i);
		}
		public TerminalNode ELSE() { return getToken(testParser.ELSE, 0); }
		public IfStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_ifStatement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterIfStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitIfStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitIfStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final IfStatementContext ifStatement() throws RecognitionException {
		IfStatementContext _localctx = new IfStatementContext(_ctx, getState());
		enterRule(_localctx, 36, RULE_ifStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(168);
			match(IF);
			setState(169);
			match(T__0);
			setState(170);
			expression(0);
			setState(171);
			match(T__1);
			setState(174);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,14,_ctx) ) {
			case 1:
				{
				setState(172);
				statement();
				}
				break;
			case 2:
				{
				setState(173);
				block();
				}
				break;
			}
			setState(181);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,16,_ctx) ) {
			case 1:
				{
				setState(176);
				match(ELSE);
				setState(179);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,15,_ctx) ) {
				case 1:
					{
					setState(177);
					statement();
					}
					break;
				case 2:
					{
					setState(178);
					block();
					}
					break;
				}
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class WhileStatementContext extends ParserRuleContext {
		public TerminalNode WHILE() { return getToken(testParser.WHILE, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public StatementContext statement() {
			return getRuleContext(StatementContext.class,0);
		}
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public WhileStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_whileStatement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterWhileStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitWhileStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitWhileStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final WhileStatementContext whileStatement() throws RecognitionException {
		WhileStatementContext _localctx = new WhileStatementContext(_ctx, getState());
		enterRule(_localctx, 38, RULE_whileStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(183);
			match(WHILE);
			setState(184);
			match(T__0);
			setState(185);
			expression(0);
			setState(186);
			match(T__1);
			setState(189);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,17,_ctx) ) {
			case 1:
				{
				setState(187);
				statement();
				}
				break;
			case 2:
				{
				setState(188);
				block();
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ForStatementContext extends ParserRuleContext {
		public TerminalNode FOR() { return getToken(testParser.FOR, 0); }
		public StatementContext statement() {
			return getRuleContext(StatementContext.class,0);
		}
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public ForStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_forStatement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterForStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitForStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitForStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ForStatementContext forStatement() throws RecognitionException {
		ForStatementContext _localctx = new ForStatementContext(_ctx, getState());
		enterRule(_localctx, 40, RULE_forStatement);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(191);
			match(FOR);
			setState(192);
			match(T__0);
			setState(194);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << Identifier) | (1L << ConstNumber) | (1L << ConstString) | (1L << PrefixUnaryOperator) | (1L << NEW))) != 0)) {
				{
				setState(193);
				expression(0);
				}
			}

			setState(196);
			match(T__7);
			setState(198);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << Identifier) | (1L << ConstNumber) | (1L << ConstString) | (1L << PrefixUnaryOperator) | (1L << NEW))) != 0)) {
				{
				setState(197);
				expression(0);
				}
			}

			setState(200);
			match(T__7);
			setState(202);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << Identifier) | (1L << ConstNumber) | (1L << ConstString) | (1L << PrefixUnaryOperator) | (1L << NEW))) != 0)) {
				{
				setState(201);
				expression(0);
				}
			}

			setState(204);
			match(T__1);
			setState(207);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,21,_ctx) ) {
			case 1:
				{
				setState(205);
				statement();
				}
				break;
			case 2:
				{
				setState(206);
				block();
				}
				break;
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExpressionContext extends ParserRuleContext {
		public FunctionNameContext functionName() {
			return getRuleContext(FunctionNameContext.class,0);
		}
		public ExpressionListContext expressionList() {
			return getRuleContext(ExpressionListContext.class,0);
		}
		public TerminalNode PrefixUnaryOperator() { return getToken(testParser.PrefixUnaryOperator, 0); }
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public VariableNameContext variableName() {
			return getRuleContext(VariableNameContext.class,0);
		}
		public TerminalNode ConstNumber() { return getToken(testParser.ConstNumber, 0); }
		public TerminalNode ConstString() { return getToken(testParser.ConstString, 0); }
		public TerminalNode NEW() { return getToken(testParser.NEW, 0); }
		public TerminalNode BinaryOperator() { return getToken(testParser.BinaryOperator, 0); }
		public TerminalNode SufixUnaryOperator() { return getToken(testParser.SufixUnaryOperator, 0); }
		public ExpressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expression; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterExpression(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitExpression(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitExpression(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExpressionContext expression() throws RecognitionException {
		return expression(0);
	}

	private ExpressionContext expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		ExpressionContext _localctx = new ExpressionContext(_ctx, _parentState);
		ExpressionContext _prevctx = _localctx;
		int _startState = 42;
		enterRecursionRule(_localctx, 42, RULE_expression, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(228);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,23,_ctx) ) {
			case 1:
				{
				setState(210);
				functionName();
				setState(211);
				match(T__0);
				setState(213);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << Identifier) | (1L << ConstNumber) | (1L << ConstString) | (1L << PrefixUnaryOperator) | (1L << NEW))) != 0)) {
					{
					setState(212);
					expressionList();
					}
				}

				setState(215);
				match(T__1);
				}
				break;
			case 2:
				{
				setState(217);
				match(PrefixUnaryOperator);
				setState(218);
				expression(8);
				}
				break;
			case 3:
				{
				setState(219);
				variableName();
				}
				break;
			case 4:
				{
				setState(220);
				match(ConstNumber);
				}
				break;
			case 5:
				{
				setState(221);
				match(ConstString);
				}
				break;
			case 6:
				{
				setState(222);
				match(T__0);
				setState(223);
				expression(0);
				setState(224);
				match(T__1);
				}
				break;
			case 7:
				{
				setState(226);
				match(NEW);
				setState(227);
				expression(1);
				}
				break;
			}
			_ctx.stop = _input.LT(-1);
			setState(245);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,25,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(243);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,24,_ctx) ) {
					case 1:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(230);
						if (!(precpred(_ctx, 9))) throw new FailedPredicateException(this, "precpred(_ctx, 9)");
						setState(231);
						match(T__11);
						setState(232);
						expression(10);
						}
						break;
					case 2:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(233);
						if (!(precpred(_ctx, 6))) throw new FailedPredicateException(this, "precpred(_ctx, 6)");
						setState(234);
						match(BinaryOperator);
						setState(235);
						expression(7);
						}
						break;
					case 3:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(236);
						if (!(precpred(_ctx, 10))) throw new FailedPredicateException(this, "precpred(_ctx, 10)");
						setState(237);
						match(T__9);
						setState(238);
						expression(0);
						setState(239);
						match(T__10);
						}
						break;
					case 4:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(241);
						if (!(precpred(_ctx, 7))) throw new FailedPredicateException(this, "precpred(_ctx, 7)");
						setState(242);
						match(SufixUnaryOperator);
						}
						break;
					}
					} 
				}
				setState(247);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,25,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class ExpressionListContext extends ParserRuleContext {
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public ExpressionListContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expressionList; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).enterExpressionList(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof testListener ) ((testListener)listener).exitExpressionList(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof testVisitor ) return ((testVisitor<? extends T>)visitor).visitExpressionList(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ExpressionListContext expressionList() throws RecognitionException {
		ExpressionListContext _localctx = new ExpressionListContext(_ctx, getState());
		enterRule(_localctx, 44, RULE_expressionList);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(248);
			expression(0);
			setState(253);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__3) {
				{
				{
				setState(249);
				match(T__3);
				setState(250);
				expression(0);
				}
				}
				setState(255);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 21:
			return expression_sempred((ExpressionContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean expression_sempred(ExpressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 9);
		case 1:
			return precpred(_ctx, 6);
		case 2:
			return precpred(_ctx, 10);
		case 3:
			return precpred(_ctx, 7);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3$\u0103\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\3\2\3\2\3"+
		"\2\3\2\5\2\65\n\2\3\2\3\2\3\2\3\3\3\3\3\4\3\4\3\4\3\4\3\5\3\5\3\5\7\5"+
		"C\n\5\f\5\16\5F\13\5\3\6\3\6\3\6\3\7\6\7L\n\7\r\7\16\7M\3\7\3\7\3\b\3"+
		"\b\3\b\5\bU\n\b\3\t\3\t\3\t\3\t\3\t\7\t\\\n\t\f\t\16\t_\13\t\3\t\3\t\3"+
		"\n\3\n\3\13\3\13\3\f\3\f\5\fi\n\f\3\r\3\r\3\r\3\r\5\ro\n\r\3\r\3\r\3\16"+
		"\3\16\7\16u\n\16\f\16\16\16x\13\16\3\16\3\16\7\16|\n\16\f\16\16\16\177"+
		"\13\16\3\16\3\16\7\16\u0083\n\16\f\16\16\16\u0086\13\16\5\16\u0088\n\16"+
		"\3\17\3\17\3\20\3\20\3\21\3\21\3\22\3\22\7\22\u0092\n\22\f\22\16\22\u0095"+
		"\13\22\3\22\3\22\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23"+
		"\3\23\3\23\3\23\3\23\3\23\5\23\u00a9\n\23\3\24\3\24\3\24\3\24\3\24\3\24"+
		"\5\24\u00b1\n\24\3\24\3\24\3\24\5\24\u00b6\n\24\5\24\u00b8\n\24\3\25\3"+
		"\25\3\25\3\25\3\25\3\25\5\25\u00c0\n\25\3\26\3\26\3\26\5\26\u00c5\n\26"+
		"\3\26\3\26\5\26\u00c9\n\26\3\26\3\26\5\26\u00cd\n\26\3\26\3\26\3\26\5"+
		"\26\u00d2\n\26\3\27\3\27\3\27\3\27\5\27\u00d8\n\27\3\27\3\27\3\27\3\27"+
		"\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\5\27\u00e7\n\27\3\27\3\27"+
		"\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\7\27\u00f6\n\27"+
		"\f\27\16\27\u00f9\13\27\3\30\3\30\3\30\7\30\u00fe\n\30\f\30\16\30\u0101"+
		"\13\30\3\30\2\3,\31\2\4\6\b\n\f\16\20\22\24\26\30\32\34\36 \"$&(*,.\2"+
		"\2\2\u0116\2\60\3\2\2\2\49\3\2\2\2\6;\3\2\2\2\b?\3\2\2\2\nG\3\2\2\2\f"+
		"K\3\2\2\2\16T\3\2\2\2\20V\3\2\2\2\22b\3\2\2\2\24d\3\2\2\2\26h\3\2\2\2"+
		"\30j\3\2\2\2\32\u0087\3\2\2\2\34\u0089\3\2\2\2\36\u008b\3\2\2\2 \u008d"+
		"\3\2\2\2\"\u008f\3\2\2\2$\u00a8\3\2\2\2&\u00aa\3\2\2\2(\u00b9\3\2\2\2"+
		"*\u00c1\3\2\2\2,\u00e6\3\2\2\2.\u00fa\3\2\2\2\60\61\5\32\16\2\61\62\5"+
		"\4\3\2\62\64\7\3\2\2\63\65\5\b\5\2\64\63\3\2\2\2\64\65\3\2\2\2\65\66\3"+
		"\2\2\2\66\67\7\4\2\2\678\5\"\22\28\3\3\2\2\29:\7\17\2\2:\5\3\2\2\2;<\5"+
		"\22\n\2<=\7\5\2\2=>\5\"\22\2>\7\3\2\2\2?D\5\n\6\2@A\7\6\2\2AC\5\n\6\2"+
		"B@\3\2\2\2CF\3\2\2\2DB\3\2\2\2DE\3\2\2\2E\t\3\2\2\2FD\3\2\2\2GH\5\32\16"+
		"\2HI\5\36\20\2I\13\3\2\2\2JL\5\16\b\2KJ\3\2\2\2LM\3\2\2\2MK\3\2\2\2MN"+
		"\3\2\2\2NO\3\2\2\2OP\7\2\2\3P\r\3\2\2\2QU\5\20\t\2RU\5\2\2\2SU\5 \21\2"+
		"TQ\3\2\2\2TR\3\2\2\2TS\3\2\2\2U\17\3\2\2\2VW\7\25\2\2WX\5\22\n\2X]\7\7"+
		"\2\2Y\\\5\20\t\2Z\\\5\26\f\2[Y\3\2\2\2[Z\3\2\2\2\\_\3\2\2\2][\3\2\2\2"+
		"]^\3\2\2\2^`\3\2\2\2_]\3\2\2\2`a\7\b\2\2a\21\3\2\2\2bc\7\17\2\2c\23\3"+
		"\2\2\2de\5\30\r\2e\25\3\2\2\2fi\5\2\2\2gi\5\6\4\2hf\3\2\2\2hg\3\2\2\2"+
		"i\27\3\2\2\2jk\5\32\16\2kn\5\36\20\2lm\7\t\2\2mo\5,\27\2nl\3\2\2\2no\3"+
		"\2\2\2op\3\2\2\2pq\7\n\2\2q\31\3\2\2\2rv\7\26\2\2su\7\13\2\2ts\3\2\2\2"+
		"ux\3\2\2\2vt\3\2\2\2vw\3\2\2\2w\u0088\3\2\2\2xv\3\2\2\2y}\7\27\2\2z|\7"+
		"\13\2\2{z\3\2\2\2|\177\3\2\2\2}{\3\2\2\2}~\3\2\2\2~\u0088\3\2\2\2\177"+
		"}\3\2\2\2\u0080\u0084\5\34\17\2\u0081\u0083\7\13\2\2\u0082\u0081\3\2\2"+
		"\2\u0083\u0086\3\2\2\2\u0084\u0082\3\2\2\2\u0084\u0085\3\2\2\2\u0085\u0088"+
		"\3\2\2\2\u0086\u0084\3\2\2\2\u0087r\3\2\2\2\u0087y\3\2\2\2\u0087\u0080"+
		"\3\2\2\2\u0088\33\3\2\2\2\u0089\u008a\7\17\2\2\u008a\35\3\2\2\2\u008b"+
		"\u008c\7\17\2\2\u008c\37\3\2\2\2\u008d\u008e\5\30\r\2\u008e!\3\2\2\2\u008f"+
		"\u0093\7\7\2\2\u0090\u0092\5$\23\2\u0091\u0090\3\2\2\2\u0092\u0095\3\2"+
		"\2\2\u0093\u0091\3\2\2\2\u0093\u0094\3\2\2\2\u0094\u0096\3\2\2\2\u0095"+
		"\u0093\3\2\2\2\u0096\u0097\7\b\2\2\u0097#\3\2\2\2\u0098\u00a9\5\"\22\2"+
		"\u0099\u00a9\5\30\r\2\u009a\u009b\5,\27\2\u009b\u009c\7\n\2\2\u009c\u00a9"+
		"\3\2\2\2\u009d\u00a9\5&\24\2\u009e\u00a9\5(\25\2\u009f\u00a9\5*\26\2\u00a0"+
		"\u00a1\7\30\2\2\u00a1\u00a2\5,\27\2\u00a2\u00a3\7\n\2\2\u00a3\u00a9\3"+
		"\2\2\2\u00a4\u00a5\7\31\2\2\u00a5\u00a9\7\n\2\2\u00a6\u00a7\7\32\2\2\u00a7"+
		"\u00a9\7\n\2\2\u00a8\u0098\3\2\2\2\u00a8\u0099\3\2\2\2\u00a8\u009a\3\2"+
		"\2\2\u00a8\u009d\3\2\2\2\u00a8\u009e\3\2\2\2\u00a8\u009f\3\2\2\2\u00a8"+
		"\u00a0\3\2\2\2\u00a8\u00a4\3\2\2\2\u00a8\u00a6\3\2\2\2\u00a9%\3\2\2\2"+
		"\u00aa\u00ab\7\33\2\2\u00ab\u00ac\7\3\2\2\u00ac\u00ad\5,\27\2\u00ad\u00b0"+
		"\7\4\2\2\u00ae\u00b1\5$\23\2\u00af\u00b1\5\"\22\2\u00b0\u00ae\3\2\2\2"+
		"\u00b0\u00af\3\2\2\2\u00b1\u00b7\3\2\2\2\u00b2\u00b5\7\34\2\2\u00b3\u00b6"+
		"\5$\23\2\u00b4\u00b6\5\"\22\2\u00b5\u00b3\3\2\2\2\u00b5\u00b4\3\2\2\2"+
		"\u00b6\u00b8\3\2\2\2\u00b7\u00b2\3\2\2\2\u00b7\u00b8\3\2\2\2\u00b8\'\3"+
		"\2\2\2\u00b9\u00ba\7\35\2\2\u00ba\u00bb\7\3\2\2\u00bb\u00bc\5,\27\2\u00bc"+
		"\u00bf\7\4\2\2\u00bd\u00c0\5$\23\2\u00be\u00c0\5\"\22\2\u00bf\u00bd\3"+
		"\2\2\2\u00bf\u00be\3\2\2\2\u00c0)\3\2\2\2\u00c1\u00c2\7\36\2\2\u00c2\u00c4"+
		"\7\3\2\2\u00c3\u00c5\5,\27\2\u00c4\u00c3\3\2\2\2\u00c4\u00c5\3\2\2\2\u00c5"+
		"\u00c6\3\2\2\2\u00c6\u00c8\7\n\2\2\u00c7\u00c9\5,\27\2\u00c8\u00c7\3\2"+
		"\2\2\u00c8\u00c9\3\2\2\2\u00c9\u00ca\3\2\2\2\u00ca\u00cc\7\n\2\2\u00cb"+
		"\u00cd\5,\27\2\u00cc\u00cb\3\2\2\2\u00cc\u00cd\3\2\2\2\u00cd\u00ce\3\2"+
		"\2\2\u00ce\u00d1\7\4\2\2\u00cf\u00d2\5$\23\2\u00d0\u00d2\5\"\22\2\u00d1"+
		"\u00cf\3\2\2\2\u00d1\u00d0\3\2\2\2\u00d2+\3\2\2\2\u00d3\u00d4\b\27\1\2"+
		"\u00d4\u00d5\5\4\3\2\u00d5\u00d7\7\3\2\2\u00d6\u00d8\5.\30\2\u00d7\u00d6"+
		"\3\2\2\2\u00d7\u00d8\3\2\2\2\u00d8\u00d9\3\2\2\2\u00d9\u00da\7\4\2\2\u00da"+
		"\u00e7\3\2\2\2\u00db\u00dc\7\22\2\2\u00dc\u00e7\5,\27\n\u00dd\u00e7\5"+
		"\36\20\2\u00de\u00e7\7\20\2\2\u00df\u00e7\7\21\2\2\u00e0\u00e1\7\3\2\2"+
		"\u00e1\u00e2\5,\27\2\u00e2\u00e3\7\4\2\2\u00e3\u00e7\3\2\2\2\u00e4\u00e5"+
		"\7\37\2\2\u00e5\u00e7\5,\27\3\u00e6\u00d3\3\2\2\2\u00e6\u00db\3\2\2\2"+
		"\u00e6\u00dd\3\2\2\2\u00e6\u00de\3\2\2\2\u00e6\u00df\3\2\2\2\u00e6\u00e0"+
		"\3\2\2\2\u00e6\u00e4\3\2\2\2\u00e7\u00f7\3\2\2\2\u00e8\u00e9\f\13\2\2"+
		"\u00e9\u00ea\7\16\2\2\u00ea\u00f6\5,\27\f\u00eb\u00ec\f\b\2\2\u00ec\u00ed"+
		"\7\24\2\2\u00ed\u00f6\5,\27\t\u00ee\u00ef\f\f\2\2\u00ef\u00f0\7\f\2\2"+
		"\u00f0\u00f1\5,\27\2\u00f1\u00f2\7\r\2\2\u00f2\u00f6\3\2\2\2\u00f3\u00f4"+
		"\f\t\2\2\u00f4\u00f6\7\23\2\2\u00f5\u00e8\3\2\2\2\u00f5\u00eb\3\2\2\2"+
		"\u00f5\u00ee\3\2\2\2\u00f5\u00f3\3\2\2\2\u00f6\u00f9\3\2\2\2\u00f7\u00f5"+
		"\3\2\2\2\u00f7\u00f8\3\2\2\2\u00f8-\3\2\2\2\u00f9\u00f7\3\2\2\2\u00fa"+
		"\u00ff\5,\27\2\u00fb\u00fc\7\6\2\2\u00fc\u00fe\5,\27\2\u00fd\u00fb\3\2"+
		"\2\2\u00fe\u0101\3\2\2\2\u00ff\u00fd\3\2\2\2\u00ff\u0100\3\2\2\2\u0100"+
		"/\3\2\2\2\u0101\u00ff\3\2\2\2\35\64DMT[]hnv}\u0084\u0087\u0093\u00a8\u00b0"+
		"\u00b5\u00b7\u00bf\u00c4\u00c8\u00cc\u00d1\u00d7\u00e6\u00f5\u00f7\u00ff";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}