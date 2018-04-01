// Generated from /home/kzoacn/Compiler2018/beta1/src/cn/kzoacn/Mxstar.g4 by ANTLR 4.7
package cn.kzoacn;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MxstarParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.7", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, T__8=9, 
		T__9=10, T__10=11, T__11=12, T__12=13, T__13=14, T__14=15, T__15=16, T__16=17, 
		T__17=18, T__18=19, T__19=20, T__20=21, T__21=22, T__22=23, T__23=24, 
		T__24=25, T__25=26, T__26=27, T__27=28, T__28=29, T__29=30, T__30=31, 
		T__31=32, T__32=33, CLASS=34, INT=35, STRING=36, RETURN=37, BREAK=38, 
		CONTINUE=39, IF=40, ELSE=41, WHILE=42, FOR=43, NEW=44, NULL=45, VOID=46, 
		BOOL=47, FALSE=48, TRUE=49, THIS=50, ConstNumber=51, ConstString=52, Identifier=53, 
		Whitespace=54, Newline=55, BlockComment=56, LineComment=57;
	public static final int
		RULE_program = 0, RULE_definition = 1, RULE_classDefinition = 2, RULE_classBody = 3, 
		RULE_className = 4, RULE_methodDefinition = 5, RULE_variableDefinition = 6, 
		RULE_variableType = 7, RULE_variableBasicType = 8, RULE_functionDefinition = 9, 
		RULE_constructionFunctionDefinition = 10, RULE_functionName = 11, RULE_parameterList = 12, 
		RULE_parameter = 13, RULE_variableName = 14, RULE_globalVariableDefinition = 15, 
		RULE_block = 16, RULE_statement = 17, RULE_ifStatement = 18, RULE_whileStatement = 19, 
		RULE_forStatement = 20, RULE_expression = 21, RULE_expressionList = 22;
	public static final String[] ruleNames = {
		"program", "definition", "classDefinition", "classBody", "className", 
		"methodDefinition", "variableDefinition", "variableType", "variableBasicType", 
		"functionDefinition", "constructionFunctionDefinition", "functionName", 
		"parameterList", "parameter", "variableName", "globalVariableDefinition", 
		"block", "statement", "ifStatement", "whileStatement", "forStatement", 
		"expression", "expressionList"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'{'", "'}'", "'='", "';'", "'[]'", "'('", "')'", "','", "'['", 
		"']'", "'.'", "'--'", "'++'", "'-'", "'!'", "'~'", "'*'", "'/'", "'%'", 
		"'+'", "'>>'", "'<<'", "'>'", "'>='", "'<'", "'<='", "'!='", "'=='", "'&'", 
		"'^'", "'|'", "'&&'", "'||'", "'class'", "'int'", "'string'", "'return'", 
		"'break'", "'continue'", "'if'", "'else'", "'while'", "'for'", "'new'", 
		"'null'", "'void'", "'bool'", "'false'", "'true'", "'this'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, null, null, null, null, null, 
		null, null, null, null, null, null, null, null, null, null, "CLASS", "INT", 
		"STRING", "RETURN", "BREAK", "CONTINUE", "IF", "ELSE", "WHILE", "FOR", 
		"NEW", "NULL", "VOID", "BOOL", "FALSE", "TRUE", "THIS", "ConstNumber", 
		"ConstString", "Identifier", "Whitespace", "Newline", "BlockComment", 
		"LineComment"
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
	public String getGrammarFileName() { return "Mxstar.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public MxstarParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class ProgramContext extends ParserRuleContext {
		public TerminalNode EOF() { return getToken(MxstarParser.EOF, 0); }
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
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterProgram(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitProgram(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitProgram(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_program);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(47); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(46);
				definition();
				}
				}
				setState(49); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << CLASS) | (1L << INT) | (1L << STRING) | (1L << VOID) | (1L << BOOL) | (1L << Identifier))) != 0) );
			setState(51);
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
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterDefinition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitDefinition(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitDefinition(this);
			else return visitor.visitChildren(this);
		}
	}

	public final DefinitionContext definition() throws RecognitionException {
		DefinitionContext _localctx = new DefinitionContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_definition);
		try {
			setState(56);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,1,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(53);
				classDefinition();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(54);
				functionDefinition();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(55);
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
		public TerminalNode CLASS() { return getToken(MxstarParser.CLASS, 0); }
		public ClassNameContext className() {
			return getRuleContext(ClassNameContext.class,0);
		}
		public ClassBodyContext classBody() {
			return getRuleContext(ClassBodyContext.class,0);
		}
		public ClassDefinitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classDefinition; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterClassDefinition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitClassDefinition(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitClassDefinition(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ClassDefinitionContext classDefinition() throws RecognitionException {
		ClassDefinitionContext _localctx = new ClassDefinitionContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_classDefinition);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(58);
			match(CLASS);
			setState(59);
			className();
			setState(60);
			classBody();
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

	public static class ClassBodyContext extends ParserRuleContext {
		public List<VariableDefinitionContext> variableDefinition() {
			return getRuleContexts(VariableDefinitionContext.class);
		}
		public VariableDefinitionContext variableDefinition(int i) {
			return getRuleContext(VariableDefinitionContext.class,i);
		}
		public List<MethodDefinitionContext> methodDefinition() {
			return getRuleContexts(MethodDefinitionContext.class);
		}
		public MethodDefinitionContext methodDefinition(int i) {
			return getRuleContext(MethodDefinitionContext.class,i);
		}
		public ClassBodyContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classBody; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterClassBody(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitClassBody(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitClassBody(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ClassBodyContext classBody() throws RecognitionException {
		ClassBodyContext _localctx = new ClassBodyContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_classBody);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(62);
			match(T__0);
			setState(67);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << INT) | (1L << STRING) | (1L << VOID) | (1L << BOOL) | (1L << Identifier))) != 0)) {
				{
				setState(65);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,2,_ctx) ) {
				case 1:
					{
					setState(63);
					variableDefinition();
					}
					break;
				case 2:
					{
					setState(64);
					methodDefinition();
					}
					break;
				}
				}
				setState(69);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(70);
			match(T__1);
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
		public TerminalNode Identifier() { return getToken(MxstarParser.Identifier, 0); }
		public ClassNameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_className; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterClassName(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitClassName(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitClassName(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ClassNameContext className() throws RecognitionException {
		ClassNameContext _localctx = new ClassNameContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_className);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(72);
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

	public static class MethodDefinitionContext extends ParserRuleContext {
		public FunctionDefinitionContext functionDefinition() {
			return getRuleContext(FunctionDefinitionContext.class,0);
		}
		public ConstructionFunctionDefinitionContext constructionFunctionDefinition() {
			return getRuleContext(ConstructionFunctionDefinitionContext.class,0);
		}
		public MethodDefinitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_methodDefinition; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterMethodDefinition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitMethodDefinition(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitMethodDefinition(this);
			else return visitor.visitChildren(this);
		}
	}

	public final MethodDefinitionContext methodDefinition() throws RecognitionException {
		MethodDefinitionContext _localctx = new MethodDefinitionContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_methodDefinition);
		try {
			setState(76);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,4,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(74);
				functionDefinition();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(75);
				constructionFunctionDefinition();
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
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterVariableDefinition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitVariableDefinition(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitVariableDefinition(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VariableDefinitionContext variableDefinition() throws RecognitionException {
		VariableDefinitionContext _localctx = new VariableDefinitionContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_variableDefinition);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(78);
			variableType();
			setState(79);
			variableName();
			setState(82);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==T__2) {
				{
				setState(80);
				match(T__2);
				setState(81);
				expression(0);
				}
			}

			setState(84);
			match(T__3);
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
		public TerminalNode INT() { return getToken(MxstarParser.INT, 0); }
		public TerminalNode BOOL() { return getToken(MxstarParser.BOOL, 0); }
		public TerminalNode STRING() { return getToken(MxstarParser.STRING, 0); }
		public TerminalNode VOID() { return getToken(MxstarParser.VOID, 0); }
		public VariableBasicTypeContext variableBasicType() {
			return getRuleContext(VariableBasicTypeContext.class,0);
		}
		public VariableTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_variableType; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterVariableType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitVariableType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitVariableType(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VariableTypeContext variableType() throws RecognitionException {
		VariableTypeContext _localctx = new VariableTypeContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_variableType);
		int _la;
		try {
			setState(115);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case INT:
				enterOuterAlt(_localctx, 1);
				{
				setState(86);
				match(INT);
				setState(90);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==T__4) {
					{
					{
					setState(87);
					match(T__4);
					}
					}
					setState(92);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
				break;
			case BOOL:
				enterOuterAlt(_localctx, 2);
				{
				setState(93);
				match(BOOL);
				setState(97);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==T__4) {
					{
					{
					setState(94);
					match(T__4);
					}
					}
					setState(99);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
				break;
			case STRING:
				enterOuterAlt(_localctx, 3);
				{
				setState(100);
				match(STRING);
				setState(104);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==T__4) {
					{
					{
					setState(101);
					match(T__4);
					}
					}
					setState(106);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
				break;
			case VOID:
				enterOuterAlt(_localctx, 4);
				{
				setState(107);
				match(VOID);
				}
				break;
			case Identifier:
				enterOuterAlt(_localctx, 5);
				{
				setState(108);
				variableBasicType();
				setState(112);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==T__4) {
					{
					{
					setState(109);
					match(T__4);
					}
					}
					setState(114);
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
		public TerminalNode Identifier() { return getToken(MxstarParser.Identifier, 0); }
		public VariableBasicTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_variableBasicType; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterVariableBasicType(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitVariableBasicType(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitVariableBasicType(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VariableBasicTypeContext variableBasicType() throws RecognitionException {
		VariableBasicTypeContext _localctx = new VariableBasicTypeContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_variableBasicType);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(117);
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
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterFunctionDefinition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitFunctionDefinition(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitFunctionDefinition(this);
			else return visitor.visitChildren(this);
		}
	}

	public final FunctionDefinitionContext functionDefinition() throws RecognitionException {
		FunctionDefinitionContext _localctx = new FunctionDefinitionContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_functionDefinition);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(119);
			variableType();
			setState(120);
			functionName();
			setState(121);
			match(T__5);
			setState(123);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << INT) | (1L << STRING) | (1L << VOID) | (1L << BOOL) | (1L << Identifier))) != 0)) {
				{
				setState(122);
				parameterList();
				}
			}

			setState(125);
			match(T__6);
			setState(126);
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

	public static class ConstructionFunctionDefinitionContext extends ParserRuleContext {
		public FunctionNameContext functionName() {
			return getRuleContext(FunctionNameContext.class,0);
		}
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public ParameterListContext parameterList() {
			return getRuleContext(ParameterListContext.class,0);
		}
		public ConstructionFunctionDefinitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_constructionFunctionDefinition; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterConstructionFunctionDefinition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitConstructionFunctionDefinition(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitConstructionFunctionDefinition(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ConstructionFunctionDefinitionContext constructionFunctionDefinition() throws RecognitionException {
		ConstructionFunctionDefinitionContext _localctx = new ConstructionFunctionDefinitionContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_constructionFunctionDefinition);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(128);
			functionName();
			setState(129);
			match(T__5);
			setState(131);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << INT) | (1L << STRING) | (1L << VOID) | (1L << BOOL) | (1L << Identifier))) != 0)) {
				{
				setState(130);
				parameterList();
				}
			}

			setState(133);
			match(T__6);
			setState(134);
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
		public TerminalNode Identifier() { return getToken(MxstarParser.Identifier, 0); }
		public FunctionNameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_functionName; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterFunctionName(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitFunctionName(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitFunctionName(this);
			else return visitor.visitChildren(this);
		}
	}

	public final FunctionNameContext functionName() throws RecognitionException {
		FunctionNameContext _localctx = new FunctionNameContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_functionName);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(136);
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
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterParameterList(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitParameterList(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitParameterList(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ParameterListContext parameterList() throws RecognitionException {
		ParameterListContext _localctx = new ParameterListContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_parameterList);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(138);
			parameter();
			setState(143);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__7) {
				{
				{
				setState(139);
				match(T__7);
				setState(140);
				parameter();
				}
				}
				setState(145);
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
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterParameter(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitParameter(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitParameter(this);
			else return visitor.visitChildren(this);
		}
	}

	public final ParameterContext parameter() throws RecognitionException {
		ParameterContext _localctx = new ParameterContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_parameter);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(146);
			variableType();
			setState(147);
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

	public static class VariableNameContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MxstarParser.Identifier, 0); }
		public VariableNameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_variableName; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterVariableName(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitVariableName(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitVariableName(this);
			else return visitor.visitChildren(this);
		}
	}

	public final VariableNameContext variableName() throws RecognitionException {
		VariableNameContext _localctx = new VariableNameContext(_ctx, getState());
		enterRule(_localctx, 28, RULE_variableName);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(149);
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
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterGlobalVariableDefinition(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitGlobalVariableDefinition(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitGlobalVariableDefinition(this);
			else return visitor.visitChildren(this);
		}
	}

	public final GlobalVariableDefinitionContext globalVariableDefinition() throws RecognitionException {
		GlobalVariableDefinitionContext _localctx = new GlobalVariableDefinitionContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_globalVariableDefinition);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(151);
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
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterBlock(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitBlock(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitBlock(this);
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
			setState(153);
			match(T__0);
			setState(157);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__0) | (1L << T__5) | (1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__15) | (1L << INT) | (1L << STRING) | (1L << RETURN) | (1L << BREAK) | (1L << CONTINUE) | (1L << IF) | (1L << WHILE) | (1L << FOR) | (1L << NEW) | (1L << NULL) | (1L << VOID) | (1L << BOOL) | (1L << FALSE) | (1L << TRUE) | (1L << ConstNumber) | (1L << ConstString) | (1L << Identifier))) != 0)) {
				{
				{
				setState(154);
				statement();
				}
				}
				setState(159);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(160);
			match(T__1);
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
		public IfStatementContext ifStatement() {
			return getRuleContext(IfStatementContext.class,0);
		}
		public WhileStatementContext whileStatement() {
			return getRuleContext(WhileStatementContext.class,0);
		}
		public ForStatementContext forStatement() {
			return getRuleContext(ForStatementContext.class,0);
		}
		public TerminalNode RETURN() { return getToken(MxstarParser.RETURN, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode BREAK() { return getToken(MxstarParser.BREAK, 0); }
		public TerminalNode CONTINUE() { return getToken(MxstarParser.CONTINUE, 0); }
		public VariableDefinitionContext variableDefinition() {
			return getRuleContext(VariableDefinitionContext.class,0);
		}
		public StatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_statement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final StatementContext statement() throws RecognitionException {
		StatementContext _localctx = new StatementContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_statement);
		try {
			setState(178);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,15,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(162);
				block();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(163);
				ifStatement();
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(164);
				whileStatement();
				}
				break;
			case 4:
				enterOuterAlt(_localctx, 4);
				{
				setState(165);
				forStatement();
				}
				break;
			case 5:
				enterOuterAlt(_localctx, 5);
				{
				setState(166);
				match(RETURN);
				setState(167);
				expression(0);
				setState(168);
				match(T__3);
				}
				break;
			case 6:
				enterOuterAlt(_localctx, 6);
				{
				setState(170);
				match(BREAK);
				setState(171);
				match(T__3);
				}
				break;
			case 7:
				enterOuterAlt(_localctx, 7);
				{
				setState(172);
				match(CONTINUE);
				setState(173);
				match(T__3);
				}
				break;
			case 8:
				enterOuterAlt(_localctx, 8);
				{
				setState(174);
				variableDefinition();
				}
				break;
			case 9:
				enterOuterAlt(_localctx, 9);
				{
				setState(175);
				expression(0);
				setState(176);
				match(T__3);
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
		public TerminalNode IF() { return getToken(MxstarParser.IF, 0); }
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
		public TerminalNode ELSE() { return getToken(MxstarParser.ELSE, 0); }
		public IfStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_ifStatement; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterIfStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitIfStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitIfStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final IfStatementContext ifStatement() throws RecognitionException {
		IfStatementContext _localctx = new IfStatementContext(_ctx, getState());
		enterRule(_localctx, 36, RULE_ifStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(180);
			match(IF);
			setState(181);
			match(T__5);
			setState(182);
			expression(0);
			setState(183);
			match(T__6);
			setState(186);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,16,_ctx) ) {
			case 1:
				{
				setState(184);
				statement();
				}
				break;
			case 2:
				{
				setState(185);
				block();
				}
				break;
			}
			setState(193);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,18,_ctx) ) {
			case 1:
				{
				setState(188);
				match(ELSE);
				setState(191);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,17,_ctx) ) {
				case 1:
					{
					setState(189);
					statement();
					}
					break;
				case 2:
					{
					setState(190);
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
		public TerminalNode WHILE() { return getToken(MxstarParser.WHILE, 0); }
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
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterWhileStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitWhileStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitWhileStatement(this);
			else return visitor.visitChildren(this);
		}
	}

	public final WhileStatementContext whileStatement() throws RecognitionException {
		WhileStatementContext _localctx = new WhileStatementContext(_ctx, getState());
		enterRule(_localctx, 38, RULE_whileStatement);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(195);
			match(WHILE);
			setState(196);
			match(T__5);
			setState(197);
			expression(0);
			setState(198);
			match(T__6);
			setState(201);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,19,_ctx) ) {
			case 1:
				{
				setState(199);
				statement();
				}
				break;
			case 2:
				{
				setState(200);
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
		public TerminalNode FOR() { return getToken(MxstarParser.FOR, 0); }
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
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterForStatement(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitForStatement(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitForStatement(this);
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
			setState(203);
			match(FOR);
			setState(204);
			match(T__5);
			setState(206);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__5) | (1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__15) | (1L << NEW) | (1L << NULL) | (1L << FALSE) | (1L << TRUE) | (1L << ConstNumber) | (1L << ConstString) | (1L << Identifier))) != 0)) {
				{
				setState(205);
				expression(0);
				}
			}

			setState(208);
			match(T__3);
			setState(210);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__5) | (1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__15) | (1L << NEW) | (1L << NULL) | (1L << FALSE) | (1L << TRUE) | (1L << ConstNumber) | (1L << ConstString) | (1L << Identifier))) != 0)) {
				{
				setState(209);
				expression(0);
				}
			}

			setState(212);
			match(T__3);
			setState(214);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__5) | (1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__15) | (1L << NEW) | (1L << NULL) | (1L << FALSE) | (1L << TRUE) | (1L << ConstNumber) | (1L << ConstString) | (1L << Identifier))) != 0)) {
				{
				setState(213);
				expression(0);
				}
			}

			setState(216);
			match(T__6);
			setState(219);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,23,_ctx) ) {
			case 1:
				{
				setState(217);
				statement();
				}
				break;
			case 2:
				{
				setState(218);
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
		public TerminalNode NEW() { return getToken(MxstarParser.NEW, 0); }
		public VariableBasicTypeContext variableBasicType() {
			return getRuleContext(VariableBasicTypeContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MxstarParser.Identifier, 0); }
		public TerminalNode INT() { return getToken(MxstarParser.INT, 0); }
		public TerminalNode STRING() { return getToken(MxstarParser.STRING, 0); }
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public VariableNameContext variableName() {
			return getRuleContext(VariableNameContext.class,0);
		}
		public TerminalNode ConstNumber() { return getToken(MxstarParser.ConstNumber, 0); }
		public TerminalNode ConstString() { return getToken(MxstarParser.ConstString, 0); }
		public TerminalNode NULL() { return getToken(MxstarParser.NULL, 0); }
		public TerminalNode TRUE() { return getToken(MxstarParser.TRUE, 0); }
		public TerminalNode FALSE() { return getToken(MxstarParser.FALSE, 0); }
		public ExpressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expression; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterExpression(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitExpression(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitExpression(this);
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
			setState(272);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,29,_ctx) ) {
			case 1:
				{
				setState(222);
				functionName();
				setState(223);
				match(T__5);
				setState(225);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__5) | (1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__15) | (1L << NEW) | (1L << NULL) | (1L << FALSE) | (1L << TRUE) | (1L << ConstNumber) | (1L << ConstString) | (1L << Identifier))) != 0)) {
					{
					setState(224);
					expressionList();
					}
				}

				setState(227);
				match(T__6);
				}
				break;
			case 2:
				{
				setState(229);
				match(NEW);
				setState(230);
				variableBasicType();
				setState(231);
				match(T__5);
				setState(233);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if ((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__5) | (1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__15) | (1L << NEW) | (1L << NULL) | (1L << FALSE) | (1L << TRUE) | (1L << ConstNumber) | (1L << ConstString) | (1L << Identifier))) != 0)) {
					{
					setState(232);
					expressionList();
					}
				}

				setState(235);
				match(T__6);
				}
				break;
			case 3:
				{
				setState(237);
				match(NEW);
				setState(238);
				_la = _input.LA(1);
				if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << INT) | (1L << STRING) | (1L << Identifier))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(243); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(239);
						match(T__8);
						setState(240);
						expression(0);
						setState(241);
						match(T__9);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(245); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,26,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				setState(250);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,27,_ctx);
				while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1 ) {
						{
						{
						setState(247);
						match(T__4);
						}
						} 
					}
					setState(252);
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,27,_ctx);
				}
				}
				break;
			case 4:
				{
				setState(253);
				match(NEW);
				setState(254);
				_la = _input.LA(1);
				if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << INT) | (1L << STRING) | (1L << Identifier))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(256); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						{
						setState(255);
						match(T__4);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(258); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,28,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				}
				break;
			case 5:
				{
				setState(260);
				_la = _input.LA(1);
				if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__11) | (1L << T__12) | (1L << T__13) | (1L << T__14) | (1L << T__15))) != 0)) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(261);
				expression(20);
				}
				break;
			case 6:
				{
				setState(262);
				variableName();
				}
				break;
			case 7:
				{
				setState(263);
				match(ConstNumber);
				}
				break;
			case 8:
				{
				setState(264);
				match(ConstString);
				}
				break;
			case 9:
				{
				setState(265);
				match(NULL);
				}
				break;
			case 10:
				{
				setState(266);
				match(TRUE);
				}
				break;
			case 11:
				{
				setState(267);
				match(FALSE);
				}
				break;
			case 12:
				{
				setState(268);
				match(T__5);
				setState(269);
				expression(0);
				setState(270);
				match(T__6);
				}
				break;
			}
			_ctx.stop = _input.LT(-1);
			setState(323);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,32,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(321);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,31,_ctx) ) {
					case 1:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(274);
						if (!(precpred(_ctx, 21))) throw new FailedPredicateException(this, "precpred(_ctx, 21)");
						setState(275);
						match(T__10);
						setState(276);
						expression(22);
						}
						break;
					case 2:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(277);
						if (!(precpred(_ctx, 18))) throw new FailedPredicateException(this, "precpred(_ctx, 18)");
						setState(278);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__16) | (1L << T__17) | (1L << T__18))) != 0)) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(279);
						expression(19);
						}
						break;
					case 3:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(280);
						if (!(precpred(_ctx, 17))) throw new FailedPredicateException(this, "precpred(_ctx, 17)");
						setState(281);
						_la = _input.LA(1);
						if ( !(_la==T__13 || _la==T__19) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(282);
						expression(18);
						}
						break;
					case 4:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(283);
						if (!(precpred(_ctx, 16))) throw new FailedPredicateException(this, "precpred(_ctx, 16)");
						setState(284);
						_la = _input.LA(1);
						if ( !(_la==T__20 || _la==T__21) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(285);
						expression(17);
						}
						break;
					case 5:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(286);
						if (!(precpred(_ctx, 15))) throw new FailedPredicateException(this, "precpred(_ctx, 15)");
						setState(287);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << T__22) | (1L << T__23) | (1L << T__24) | (1L << T__25))) != 0)) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(288);
						expression(16);
						}
						break;
					case 6:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(289);
						if (!(precpred(_ctx, 14))) throw new FailedPredicateException(this, "precpred(_ctx, 14)");
						setState(290);
						_la = _input.LA(1);
						if ( !(_la==T__26 || _la==T__27) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(291);
						expression(15);
						}
						break;
					case 7:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(292);
						if (!(precpred(_ctx, 13))) throw new FailedPredicateException(this, "precpred(_ctx, 13)");
						setState(293);
						match(T__28);
						setState(294);
						expression(14);
						}
						break;
					case 8:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(295);
						if (!(precpred(_ctx, 12))) throw new FailedPredicateException(this, "precpred(_ctx, 12)");
						setState(296);
						match(T__29);
						setState(297);
						expression(13);
						}
						break;
					case 9:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(298);
						if (!(precpred(_ctx, 11))) throw new FailedPredicateException(this, "precpred(_ctx, 11)");
						setState(299);
						match(T__30);
						setState(300);
						expression(12);
						}
						break;
					case 10:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(301);
						if (!(precpred(_ctx, 10))) throw new FailedPredicateException(this, "precpred(_ctx, 10)");
						setState(302);
						match(T__31);
						setState(303);
						expression(11);
						}
						break;
					case 11:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(304);
						if (!(precpred(_ctx, 9))) throw new FailedPredicateException(this, "precpred(_ctx, 9)");
						setState(305);
						match(T__32);
						setState(306);
						expression(10);
						}
						break;
					case 12:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(307);
						if (!(precpred(_ctx, 1))) throw new FailedPredicateException(this, "precpred(_ctx, 1)");
						setState(308);
						match(T__2);
						setState(309);
						expression(1);
						}
						break;
					case 13:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(310);
						if (!(precpred(_ctx, 22))) throw new FailedPredicateException(this, "precpred(_ctx, 22)");
						setState(315); 
						_errHandler.sync(this);
						_alt = 1;
						do {
							switch (_alt) {
							case 1:
								{
								{
								setState(311);
								match(T__8);
								setState(312);
								expression(0);
								setState(313);
								match(T__9);
								}
								}
								break;
							default:
								throw new NoViableAltException(this);
							}
							setState(317); 
							_errHandler.sync(this);
							_alt = getInterpreter().adaptivePredict(_input,30,_ctx);
						} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
						}
						break;
					case 14:
						{
						_localctx = new ExpressionContext(_parentctx, _parentState);
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(319);
						if (!(precpred(_ctx, 19))) throw new FailedPredicateException(this, "precpred(_ctx, 19)");
						setState(320);
						_la = _input.LA(1);
						if ( !(_la==T__11 || _la==T__12) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						}
						break;
					}
					} 
				}
				setState(325);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,32,_ctx);
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
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).enterExpressionList(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof MxstarListener ) ((MxstarListener)listener).exitExpressionList(this);
		}
		@Override
		public <T> T accept(ParseTreeVisitor<? extends T> visitor) {
			if ( visitor instanceof MxstarVisitor ) return ((MxstarVisitor<? extends T>)visitor).visitExpressionList(this);
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
			setState(326);
			expression(0);
			setState(331);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==T__7) {
				{
				{
				setState(327);
				match(T__7);
				setState(328);
				expression(0);
				}
				}
				setState(333);
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
			return precpred(_ctx, 21);
		case 1:
			return precpred(_ctx, 18);
		case 2:
			return precpred(_ctx, 17);
		case 3:
			return precpred(_ctx, 16);
		case 4:
			return precpred(_ctx, 15);
		case 5:
			return precpred(_ctx, 14);
		case 6:
			return precpred(_ctx, 13);
		case 7:
			return precpred(_ctx, 12);
		case 8:
			return precpred(_ctx, 11);
		case 9:
			return precpred(_ctx, 10);
		case 10:
			return precpred(_ctx, 9);
		case 11:
			return precpred(_ctx, 1);
		case 12:
			return precpred(_ctx, 22);
		case 13:
			return precpred(_ctx, 19);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3;\u0151\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\3\2\6\2\62"+
		"\n\2\r\2\16\2\63\3\2\3\2\3\3\3\3\3\3\5\3;\n\3\3\4\3\4\3\4\3\4\3\5\3\5"+
		"\3\5\7\5D\n\5\f\5\16\5G\13\5\3\5\3\5\3\6\3\6\3\7\3\7\5\7O\n\7\3\b\3\b"+
		"\3\b\3\b\5\bU\n\b\3\b\3\b\3\t\3\t\7\t[\n\t\f\t\16\t^\13\t\3\t\3\t\7\t"+
		"b\n\t\f\t\16\te\13\t\3\t\3\t\7\ti\n\t\f\t\16\tl\13\t\3\t\3\t\3\t\7\tq"+
		"\n\t\f\t\16\tt\13\t\5\tv\n\t\3\n\3\n\3\13\3\13\3\13\3\13\5\13~\n\13\3"+
		"\13\3\13\3\13\3\f\3\f\3\f\5\f\u0086\n\f\3\f\3\f\3\f\3\r\3\r\3\16\3\16"+
		"\3\16\7\16\u0090\n\16\f\16\16\16\u0093\13\16\3\17\3\17\3\17\3\20\3\20"+
		"\3\21\3\21\3\22\3\22\7\22\u009e\n\22\f\22\16\22\u00a1\13\22\3\22\3\22"+
		"\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\23"+
		"\3\23\3\23\5\23\u00b5\n\23\3\24\3\24\3\24\3\24\3\24\3\24\5\24\u00bd\n"+
		"\24\3\24\3\24\3\24\5\24\u00c2\n\24\5\24\u00c4\n\24\3\25\3\25\3\25\3\25"+
		"\3\25\3\25\5\25\u00cc\n\25\3\26\3\26\3\26\5\26\u00d1\n\26\3\26\3\26\5"+
		"\26\u00d5\n\26\3\26\3\26\5\26\u00d9\n\26\3\26\3\26\3\26\5\26\u00de\n\26"+
		"\3\27\3\27\3\27\3\27\5\27\u00e4\n\27\3\27\3\27\3\27\3\27\3\27\3\27\5\27"+
		"\u00ec\n\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\6\27\u00f6\n\27\r"+
		"\27\16\27\u00f7\3\27\7\27\u00fb\n\27\f\27\16\27\u00fe\13\27\3\27\3\27"+
		"\3\27\6\27\u0103\n\27\r\27\16\27\u0104\3\27\3\27\3\27\3\27\3\27\3\27\3"+
		"\27\3\27\3\27\3\27\3\27\3\27\5\27\u0113\n\27\3\27\3\27\3\27\3\27\3\27"+
		"\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27"+
		"\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27"+
		"\3\27\3\27\3\27\3\27\3\27\3\27\3\27\3\27\6\27\u013e\n\27\r\27\16\27\u013f"+
		"\3\27\3\27\7\27\u0144\n\27\f\27\16\27\u0147\13\27\3\30\3\30\3\30\7\30"+
		"\u014c\n\30\f\30\16\30\u014f\13\30\3\30\2\3,\31\2\4\6\b\n\f\16\20\22\24"+
		"\26\30\32\34\36 \"$&(*,.\2\n\4\2%&\67\67\3\2\16\22\3\2\23\25\4\2\20\20"+
		"\26\26\3\2\27\30\3\2\31\34\3\2\35\36\3\2\16\17\2\u017c\2\61\3\2\2\2\4"+
		":\3\2\2\2\6<\3\2\2\2\b@\3\2\2\2\nJ\3\2\2\2\fN\3\2\2\2\16P\3\2\2\2\20u"+
		"\3\2\2\2\22w\3\2\2\2\24y\3\2\2\2\26\u0082\3\2\2\2\30\u008a\3\2\2\2\32"+
		"\u008c\3\2\2\2\34\u0094\3\2\2\2\36\u0097\3\2\2\2 \u0099\3\2\2\2\"\u009b"+
		"\3\2\2\2$\u00b4\3\2\2\2&\u00b6\3\2\2\2(\u00c5\3\2\2\2*\u00cd\3\2\2\2,"+
		"\u0112\3\2\2\2.\u0148\3\2\2\2\60\62\5\4\3\2\61\60\3\2\2\2\62\63\3\2\2"+
		"\2\63\61\3\2\2\2\63\64\3\2\2\2\64\65\3\2\2\2\65\66\7\2\2\3\66\3\3\2\2"+
		"\2\67;\5\6\4\28;\5\24\13\29;\5 \21\2:\67\3\2\2\2:8\3\2\2\2:9\3\2\2\2;"+
		"\5\3\2\2\2<=\7$\2\2=>\5\n\6\2>?\5\b\5\2?\7\3\2\2\2@E\7\3\2\2AD\5\16\b"+
		"\2BD\5\f\7\2CA\3\2\2\2CB\3\2\2\2DG\3\2\2\2EC\3\2\2\2EF\3\2\2\2FH\3\2\2"+
		"\2GE\3\2\2\2HI\7\4\2\2I\t\3\2\2\2JK\7\67\2\2K\13\3\2\2\2LO\5\24\13\2M"+
		"O\5\26\f\2NL\3\2\2\2NM\3\2\2\2O\r\3\2\2\2PQ\5\20\t\2QT\5\36\20\2RS\7\5"+
		"\2\2SU\5,\27\2TR\3\2\2\2TU\3\2\2\2UV\3\2\2\2VW\7\6\2\2W\17\3\2\2\2X\\"+
		"\7%\2\2Y[\7\7\2\2ZY\3\2\2\2[^\3\2\2\2\\Z\3\2\2\2\\]\3\2\2\2]v\3\2\2\2"+
		"^\\\3\2\2\2_c\7\61\2\2`b\7\7\2\2a`\3\2\2\2be\3\2\2\2ca\3\2\2\2cd\3\2\2"+
		"\2dv\3\2\2\2ec\3\2\2\2fj\7&\2\2gi\7\7\2\2hg\3\2\2\2il\3\2\2\2jh\3\2\2"+
		"\2jk\3\2\2\2kv\3\2\2\2lj\3\2\2\2mv\7\60\2\2nr\5\22\n\2oq\7\7\2\2po\3\2"+
		"\2\2qt\3\2\2\2rp\3\2\2\2rs\3\2\2\2sv\3\2\2\2tr\3\2\2\2uX\3\2\2\2u_\3\2"+
		"\2\2uf\3\2\2\2um\3\2\2\2un\3\2\2\2v\21\3\2\2\2wx\7\67\2\2x\23\3\2\2\2"+
		"yz\5\20\t\2z{\5\30\r\2{}\7\b\2\2|~\5\32\16\2}|\3\2\2\2}~\3\2\2\2~\177"+
		"\3\2\2\2\177\u0080\7\t\2\2\u0080\u0081\5\"\22\2\u0081\25\3\2\2\2\u0082"+
		"\u0083\5\30\r\2\u0083\u0085\7\b\2\2\u0084\u0086\5\32\16\2\u0085\u0084"+
		"\3\2\2\2\u0085\u0086\3\2\2\2\u0086\u0087\3\2\2\2\u0087\u0088\7\t\2\2\u0088"+
		"\u0089\5\"\22\2\u0089\27\3\2\2\2\u008a\u008b\7\67\2\2\u008b\31\3\2\2\2"+
		"\u008c\u0091\5\34\17\2\u008d\u008e\7\n\2\2\u008e\u0090\5\34\17\2\u008f"+
		"\u008d\3\2\2\2\u0090\u0093\3\2\2\2\u0091\u008f\3\2\2\2\u0091\u0092\3\2"+
		"\2\2\u0092\33\3\2\2\2\u0093\u0091\3\2\2\2\u0094\u0095\5\20\t\2\u0095\u0096"+
		"\5\36\20\2\u0096\35\3\2\2\2\u0097\u0098\7\67\2\2\u0098\37\3\2\2\2\u0099"+
		"\u009a\5\16\b\2\u009a!\3\2\2\2\u009b\u009f\7\3\2\2\u009c\u009e\5$\23\2"+
		"\u009d\u009c\3\2\2\2\u009e\u00a1\3\2\2\2\u009f\u009d\3\2\2\2\u009f\u00a0"+
		"\3\2\2\2\u00a0\u00a2\3\2\2\2\u00a1\u009f\3\2\2\2\u00a2\u00a3\7\4\2\2\u00a3"+
		"#\3\2\2\2\u00a4\u00b5\5\"\22\2\u00a5\u00b5\5&\24\2\u00a6\u00b5\5(\25\2"+
		"\u00a7\u00b5\5*\26\2\u00a8\u00a9\7\'\2\2\u00a9\u00aa\5,\27\2\u00aa\u00ab"+
		"\7\6\2\2\u00ab\u00b5\3\2\2\2\u00ac\u00ad\7(\2\2\u00ad\u00b5\7\6\2\2\u00ae"+
		"\u00af\7)\2\2\u00af\u00b5\7\6\2\2\u00b0\u00b5\5\16\b\2\u00b1\u00b2\5,"+
		"\27\2\u00b2\u00b3\7\6\2\2\u00b3\u00b5\3\2\2\2\u00b4\u00a4\3\2\2\2\u00b4"+
		"\u00a5\3\2\2\2\u00b4\u00a6\3\2\2\2\u00b4\u00a7\3\2\2\2\u00b4\u00a8\3\2"+
		"\2\2\u00b4\u00ac\3\2\2\2\u00b4\u00ae\3\2\2\2\u00b4\u00b0\3\2\2\2\u00b4"+
		"\u00b1\3\2\2\2\u00b5%\3\2\2\2\u00b6\u00b7\7*\2\2\u00b7\u00b8\7\b\2\2\u00b8"+
		"\u00b9\5,\27\2\u00b9\u00bc\7\t\2\2\u00ba\u00bd\5$\23\2\u00bb\u00bd\5\""+
		"\22\2\u00bc\u00ba\3\2\2\2\u00bc\u00bb\3\2\2\2\u00bd\u00c3\3\2\2\2\u00be"+
		"\u00c1\7+\2\2\u00bf\u00c2\5$\23\2\u00c0\u00c2\5\"\22\2\u00c1\u00bf\3\2"+
		"\2\2\u00c1\u00c0\3\2\2\2\u00c2\u00c4\3\2\2\2\u00c3\u00be\3\2\2\2\u00c3"+
		"\u00c4\3\2\2\2\u00c4\'\3\2\2\2\u00c5\u00c6\7,\2\2\u00c6\u00c7\7\b\2\2"+
		"\u00c7\u00c8\5,\27\2\u00c8\u00cb\7\t\2\2\u00c9\u00cc\5$\23\2\u00ca\u00cc"+
		"\5\"\22\2\u00cb\u00c9\3\2\2\2\u00cb\u00ca\3\2\2\2\u00cc)\3\2\2\2\u00cd"+
		"\u00ce\7-\2\2\u00ce\u00d0\7\b\2\2\u00cf\u00d1\5,\27\2\u00d0\u00cf\3\2"+
		"\2\2\u00d0\u00d1\3\2\2\2\u00d1\u00d2\3\2\2\2\u00d2\u00d4\7\6\2\2\u00d3"+
		"\u00d5\5,\27\2\u00d4\u00d3\3\2\2\2\u00d4\u00d5\3\2\2\2\u00d5\u00d6\3\2"+
		"\2\2\u00d6\u00d8\7\6\2\2\u00d7\u00d9\5,\27\2\u00d8\u00d7\3\2\2\2\u00d8"+
		"\u00d9\3\2\2\2\u00d9\u00da\3\2\2\2\u00da\u00dd\7\t\2\2\u00db\u00de\5$"+
		"\23\2\u00dc\u00de\5\"\22\2\u00dd\u00db\3\2\2\2\u00dd\u00dc\3\2\2\2\u00de"+
		"+\3\2\2\2\u00df\u00e0\b\27\1\2\u00e0\u00e1\5\30\r\2\u00e1\u00e3\7\b\2"+
		"\2\u00e2\u00e4\5.\30\2\u00e3\u00e2\3\2\2\2\u00e3\u00e4\3\2\2\2\u00e4\u00e5"+
		"\3\2\2\2\u00e5\u00e6\7\t\2\2\u00e6\u0113\3\2\2\2\u00e7\u00e8\7.\2\2\u00e8"+
		"\u00e9\5\22\n\2\u00e9\u00eb\7\b\2\2\u00ea\u00ec\5.\30\2\u00eb\u00ea\3"+
		"\2\2\2\u00eb\u00ec\3\2\2\2\u00ec\u00ed\3\2\2\2\u00ed\u00ee\7\t\2\2\u00ee"+
		"\u0113\3\2\2\2\u00ef\u00f0\7.\2\2\u00f0\u00f5\t\2\2\2\u00f1\u00f2\7\13"+
		"\2\2\u00f2\u00f3\5,\27\2\u00f3\u00f4\7\f\2\2\u00f4\u00f6\3\2\2\2\u00f5"+
		"\u00f1\3\2\2\2\u00f6\u00f7\3\2\2\2\u00f7\u00f5\3\2\2\2\u00f7\u00f8\3\2"+
		"\2\2\u00f8\u00fc\3\2\2\2\u00f9\u00fb\7\7\2\2\u00fa\u00f9\3\2\2\2\u00fb"+
		"\u00fe\3\2\2\2\u00fc\u00fa\3\2\2\2\u00fc\u00fd\3\2\2\2\u00fd\u0113\3\2"+
		"\2\2\u00fe\u00fc\3\2\2\2\u00ff\u0100\7.\2\2\u0100\u0102\t\2\2\2\u0101"+
		"\u0103\7\7\2\2\u0102\u0101\3\2\2\2\u0103\u0104\3\2\2\2\u0104\u0102\3\2"+
		"\2\2\u0104\u0105\3\2\2\2\u0105\u0113\3\2\2\2\u0106\u0107\t\3\2\2\u0107"+
		"\u0113\5,\27\26\u0108\u0113\5\36\20\2\u0109\u0113\7\65\2\2\u010a\u0113"+
		"\7\66\2\2\u010b\u0113\7/\2\2\u010c\u0113\7\63\2\2\u010d\u0113\7\62\2\2"+
		"\u010e\u010f\7\b\2\2\u010f\u0110\5,\27\2\u0110\u0111\7\t\2\2\u0111\u0113"+
		"\3\2\2\2\u0112\u00df\3\2\2\2\u0112\u00e7\3\2\2\2\u0112\u00ef\3\2\2\2\u0112"+
		"\u00ff\3\2\2\2\u0112\u0106\3\2\2\2\u0112\u0108\3\2\2\2\u0112\u0109\3\2"+
		"\2\2\u0112\u010a\3\2\2\2\u0112\u010b\3\2\2\2\u0112\u010c\3\2\2\2\u0112"+
		"\u010d\3\2\2\2\u0112\u010e\3\2\2\2\u0113\u0145\3\2\2\2\u0114\u0115\f\27"+
		"\2\2\u0115\u0116\7\r\2\2\u0116\u0144\5,\27\30\u0117\u0118\f\24\2\2\u0118"+
		"\u0119\t\4\2\2\u0119\u0144\5,\27\25\u011a\u011b\f\23\2\2\u011b\u011c\t"+
		"\5\2\2\u011c\u0144\5,\27\24\u011d\u011e\f\22\2\2\u011e\u011f\t\6\2\2\u011f"+
		"\u0144\5,\27\23\u0120\u0121\f\21\2\2\u0121\u0122\t\7\2\2\u0122\u0144\5"+
		",\27\22\u0123\u0124\f\20\2\2\u0124\u0125\t\b\2\2\u0125\u0144\5,\27\21"+
		"\u0126\u0127\f\17\2\2\u0127\u0128\7\37\2\2\u0128\u0144\5,\27\20\u0129"+
		"\u012a\f\16\2\2\u012a\u012b\7 \2\2\u012b\u0144\5,\27\17\u012c\u012d\f"+
		"\r\2\2\u012d\u012e\7!\2\2\u012e\u0144\5,\27\16\u012f\u0130\f\f\2\2\u0130"+
		"\u0131\7\"\2\2\u0131\u0144\5,\27\r\u0132\u0133\f\13\2\2\u0133\u0134\7"+
		"#\2\2\u0134\u0144\5,\27\f\u0135\u0136\f\3\2\2\u0136\u0137\7\5\2\2\u0137"+
		"\u0144\5,\27\3\u0138\u013d\f\30\2\2\u0139\u013a\7\13\2\2\u013a\u013b\5"+
		",\27\2\u013b\u013c\7\f\2\2\u013c\u013e\3\2\2\2\u013d\u0139\3\2\2\2\u013e"+
		"\u013f\3\2\2\2\u013f\u013d\3\2\2\2\u013f\u0140\3\2\2\2\u0140\u0144\3\2"+
		"\2\2\u0141\u0142\f\25\2\2\u0142\u0144\t\t\2\2\u0143\u0114\3\2\2\2\u0143"+
		"\u0117\3\2\2\2\u0143\u011a\3\2\2\2\u0143\u011d\3\2\2\2\u0143\u0120\3\2"+
		"\2\2\u0143\u0123\3\2\2\2\u0143\u0126\3\2\2\2\u0143\u0129\3\2\2\2\u0143"+
		"\u012c\3\2\2\2\u0143\u012f\3\2\2\2\u0143\u0132\3\2\2\2\u0143\u0135\3\2"+
		"\2\2\u0143\u0138\3\2\2\2\u0143\u0141\3\2\2\2\u0144\u0147\3\2\2\2\u0145"+
		"\u0143\3\2\2\2\u0145\u0146\3\2\2\2\u0146-\3\2\2\2\u0147\u0145\3\2\2\2"+
		"\u0148\u014d\5,\27\2\u0149\u014a\7\n\2\2\u014a\u014c\5,\27\2\u014b\u0149"+
		"\3\2\2\2\u014c\u014f\3\2\2\2\u014d\u014b\3\2\2\2\u014d\u014e\3\2\2\2\u014e"+
		"/\3\2\2\2\u014f\u014d\3\2\2\2$\63:CENT\\cjru}\u0085\u0091\u009f\u00b4"+
		"\u00bc\u00c1\u00c3\u00cb\u00d0\u00d4\u00d8\u00dd\u00e3\u00eb\u00f7\u00fc"+
		"\u0104\u0112\u013f\u0143\u0145\u014d";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}