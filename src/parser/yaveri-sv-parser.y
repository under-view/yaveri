%define parse.error verbose
%locations

%{

#include <stdio.h>

/*
 * Bison expects you to implement the function yylex(),
 * used to get the next token. Our yylex() is provided
 * by the flex scanner.
 */
extern int yylex(void);

/*
 * Bison expects you to implement the function yyerror(),
 * invoked whenever the parser step into an error.
 */
extern int yyerror(const char *message);
%}

/* declare tokens */


/*
 * Comment from: https://aquamentus.com/flex_bison.html
 *
 * Bison fundamentally works by asking flex to get the next token, which it
 * returns as an object of type "yystype". Initially (by default), yystype
 * is merely a typedef of "int", but for non-trivial projects, tokens could
 * be of any arbitrary data type. So, to deal with that, the idea is to
 * override yystype's default typedef to be a C union instead. Unions can
 * hold all of the types of tokens that Flex could return, and this this means
 * we can return ints or floats or strings cleanly. Bison implements this
 * mechanism with the %union directive:
 */
%union {
	int itoken; // Integer token
}


/* Design Element 'module' */
%token <itoken> SVLOG_MODULE
%token <itoken> SVLOG_ENDMODULE
/* Design Element 'program' */
%token <itoken> SVLOG_PROGRAM
%token <itoken> SVLOG_ENDPROGRAM
/* Design Element 'interface' */
%token <itoken> SVLOG_INTERFACE
%token <itoken> SVLOG_ENDINTERFACE
/* Design Element 'checker' */
%token <itoken> SVLOG_CHECKER
%token <itoken> SVLOG_ENDCHECKER
/* Design Element 'package' */
%token <itoken> SVLOG_PACKAGE
%token <itoken> SVLOG_ENDPACKAGE
/* Design Element 'primitive' */
%token <itoken> SVLOG_PRIMITIVE
%token <itoken> SVLOG_ENDPRIMITIVE
/* Design Element 'config' */
%token <itoken> SVLOG_CONFIG
%token <itoken> SVLOG_ENDCONFIG
/* second 's' */
%token <itoken> SVLOG_SEC
/* millisecond 'ms' */
%token <itoken> SVLOG_MILLISEC
/* microsecond 'us' */
%token <itoken> SVLOG_MICROSEC
/* nanosecond 'ns' */
%token <itoken> SVLOG_NANOSEC
/* picosecond 'ps' */
%token <itoken> SVLOG_PICOSEC
/* femtosecond 'fs' */
%token <itoken> SVLOG_fEMTOSEC
/* step 'step' */
%token <itoken> SVLOG_STEP
/* register 'reg' */
%token <itoken> SVLOG_REG
%token <itoken> SVLOG_WIRE
%token <itoken> SVLOG_INTEGER
%token <itoken> SVLOG_REAL
%token <itoken> SVLOG_TIME
%token <itoken> SVLOG_REAL_TIME
%token <itoken> SVLOG_LOGIC
%token <itoken> SVLOG_BIT
%token <itoken> SVLOG_BYTE
%token <itoken> SVLOG_SHORT_INT
%token <itoken> SVLOG_INT
%token <itoken> SVLOG_LONG_INT
%token <itoken> SVLOG_SHORT_REAL
/* Left Square Bracket '[' */
%token <itoken> LSBRAC
/* Right Square Bracket ']' */
%token <itoken> RSBRAC
/* Colon ':' */
%token <itoken> COLON
/* Semicolon ';' */
%token <itoken> SEMICOLON
/* Underscore '_' */
%token <itoken> UNDERSCORE
/* Plus '+' */
%token <itoken> PLUS
/* Minus '-' */
%token <itoken> MINUS
/* Logical NOT '!' */
%token <itoken> LOGICAL_NOT
/* Bit Wise NOT '~' */
%token <itoken> BIT_WISE_NOT
/* Bit Wise AND '&' */
%token <itoken> BIT_WISE_AND
/* Bit Wise NAND '~&' */
%token <itoken> BIT_WISE_NAND
/* Bit Wise OR '|' */
%token <itoken> BIT_WISE_OR
/* Bit Wise NOR '~|' */
%token <itoken> BIT_WISE_NOR
/* Bit Wise XOR '^' */
%token <itoken> BIT_WISE_XOR
/* Bit Wise XNOR '~^' */
%token <itoken> BIT_WISE_XNOR
/* Simple Identifier */
%token <itoken> SVLOG_SIDENT
/* Escaped identifiers */
%token <itoken> SVLOG_EIDENT

%start svlog

%%

svlog
	: statements
	| unary_operator
	| %empty
	;

statements
	: statement statements
	| statement
	;

statement
	: SVLOG_SIDENT SEMICOLON
	| SVLOG_EIDENT
	;

unary_operator
	: PLUS
	| MINUS
	| LOGICAL_NOT
	| BIT_WISE_NOT
	| BIT_WISE_AND
	| BIT_WISE_NAND
	| BIT_WISE_OR
	| BIT_WISE_NOR
	| BIT_WISE_XOR
	| BIT_WISE_XNOR
	;

%%
