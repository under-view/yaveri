%define parse.error verbose

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


/* Design Element 'module' */
%token SVLOG_MODULE
%token SVLOG_ENDMODULE
/* Design Element 'program' */
%token SVLOG_PROGRAM
%token SVLOG_ENDPROGRAM
/* Design Element 'interface' */
%token SVLOG_INTERFACE
%token SVLOG_ENDINTERFACE
/* Design Element 'checker' */
%token SVLOG_CHECKER
%token SVLOG_ENDCHECKER
/* Design Element 'package' */
%token SVLOG_PACKAGE
%token SVLOG_ENDPACKAGE
/* Design Element 'primitive' */
%token SVLOG_PRIMITIVE
%token SVLOG_ENDPRIMITIVE
/* Design Element 'config' */
%token SVLOG_CONFIG
%token SVLOG_ENDCONFIG
/* second 's' */
%token SVLOG_SEC
/* millisecond 'ms' */
%token SVLOG_MILLISEC
/* microsecond 'us' */
%token SVLOG_MICROSEC
/* nanosecond 'ns' */
%token SVLOG_NANOSEC
/* picosecond 'ps' */
%token SVLOG_PICOSEC
/* femtosecond 'fs' */
%token SVLOG_fEMTOSEC
/* step 'step' */
%token SVLOG_STEP

/* register 'reg' */
%token SVLOG_REG
%token SVLOG_WIRE
%token SVLOG_INTEGER
%token SVLOG_REAL
%token SVLOG_TIME
%token SVLOG_REAL_TIME
%token SVLOG_LOGIC
%token SVLOG_BIT
%token SVLOG_BYTE
%token SVLOG_SHORT_INT
%token SVLOG_INT
%token SVLOG_LONG_INT
%token SVLOG_SHORT_REAL


/* Left Square Bracket '[' */
%token LSBRAC
/* Right Square Bracket ']' */
%token RSBRAC
/* Colon ':' */
%token COLON
/* Semicolon ';' */
%token SEMICOLON
/* Underscore '_' */
%token UNDERSCORE
/* Plus '+' */
%token PLUS
/* Minus '-' */
%token MINUS
/* Logical NOT '!' */
%token LOGICAL_NOT
/* Bit Wise NOT '~' */
%token BIT_WISE_NOT
/* Bit Wise AND '&' */
%token BIT_WISE_AND
/* Bit Wise NAND '~&' */
%token BIT_WISE_NAND
/* Bit Wise OR '|' */
%token BIT_WISE_OR
/* Bit Wise NOR '~|' */
%token BIT_WISE_NOR
/* Bit Wise XOR '^' */
%token BIT_WISE_XOR
/* Bit Wise XNOR '~^' */
%token BIT_WISE_XNOR


/* Simple Identifier */
%token SVLOG_SIDENT

%start svlog

%%

svlog
	: statements
	| unary_operator
	| %empty

statements
	: statement statements
	| statement

statement
	: SVLOG_SIDENT SEMICOLON

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

%%
