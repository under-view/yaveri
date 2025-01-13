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
/* exp lowercase 'e' or upercase 'E' */
%token <itoken> SVLOG_EXP
/* decimal_base 'd','D' */
%token <itoken> SVLOG_DEC_BASE_D
/* decimal_base 's','S' */
%token <itoken> SVLOG_DEC_BASE_S
/* binary_base 'b','B' */
%token <itoken> SVLOG_BIN_BASE
/* octal_base 'o','O' */
%token <itoken> SVLOG_OCT_BASE
/* hex_base 'h','H' */
%token <itoken> SVLOG_HEX_BASE
/* x digit 'x','X' */
%token <itoken> SVLOG_X_DIGIT
/* z digit 'z','Z' */
%token <itoken> SVLOG_Z_DIGIT
/* letters between a-fA-F */
%token <itoken> SVLOG_HEXCHAR
/* numbers between 0-9 */
%token <itoken> SVLOG_DIGIT
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
/* Period '.' */
%token <itoken> PERIOD
/* Apostrophe ' */
%token <itoken> APOSTROPHE
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
	| primary_literal
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

primary_literal
	: number
	| time_literal
	| unbased_unsized_literal
	;

time_literal
	: unsigned_number time_unit
	| fixed_point_number time_unit
	;

time_unit
	: SVLOG_SEC
	| SVLOG_MILLISEC
	| SVLOG_MICROSEC
	| SVLOG_NANOSEC
	| SVLOG_PICOSEC
	| SVLOG_fEMTOSEC
	;

number
	: integral_number
	| real_number
	;

integral_number
	: decimal_number
	| octal_number
	| binary_number
	| hex_number
	;

decimal_number
	: unsigned_number
	| decimal_base_unsigned_number
	| decimal_base_x_digit
	| decimal_base_z_digit
	;

decimal_base_unsigned_number
	: decimal_base unsigned_number
	| size decimal_base unsigned_number
	;

decimal_base_x_digit
	: decimal_base x_digit UNDERSCORE decimal_base_x_digit
	| decimal_base x_digit
	| size decimal_base x_digit UNDERSCORE decimal_base_x_digit
	| size decimal_base x_digit
	;

decimal_base_z_digit
	: decimal_base z_digit UNDERSCORE decimal_base_z_digit
	| decimal_base z_digit
	| size decimal_base z_digit UNDERSCORE decimal_base_z_digit
	| size decimal_base z_digit
	;

binary_number
	: binary_base binary_value
	| size binary_base binary_value
	;

octal_number
	: octal_base octal_value
	| size octal_base octal_value
	;

hex_number
	: hex_base hex_value
	| size hex_base hex_value
	;

size
	: unsigned_number
	;

real_number
	: fixed_point_number
	| unsigned_number exp unsigned_number
	| unsigned_number exp sign unsigned_number
	| unsigned_number PERIOD unsigned_number exp unsigned_number
	| unsigned_number PERIOD unsigned_number exp sign unsigned_number
	;

fixed_point_number
	: unsigned_number PERIOD unsigned_number
	;

unsigned_number
	: decimal_digit UNDERSCORE unsigned_number
	| decimal_digit unsigned_number
	| decimal_digit
	;

binary_value
	: binary_digit UNDERSCORE binary_value
	| binary_digit binary_value
	| binary_digit
	;

octal_value
	: octal_digit UNDERSCORE octal_value
	| octal_digit octal_value
	| octal_digit
	;

hex_value
	: hex_digit UNDERSCORE hex_value
	| hex_digit hex_value
	| hex_digit
	;

decimal_base
	: APOSTROPHE SVLOG_DEC_BASE_S SVLOG_DEC_BASE_D
	| APOSTROPHE SVLOG_DEC_BASE_D
	;

binary_base
	: APOSTROPHE SVLOG_DEC_BASE_S SVLOG_BIN_BASE
	| APOSTROPHE SVLOG_BIN_BASE
	;

octal_base
	: APOSTROPHE SVLOG_DEC_BASE_S SVLOG_OCT_BASE
	| APOSTROPHE SVLOG_OCT_BASE
	;

hex_base
	: APOSTROPHE SVLOG_DEC_BASE_S SVLOG_HEX_BASE
	| APOSTROPHE SVLOG_HEX_BASE
	;

// make sure it's between 0-9
decimal_digit
	: SVLOG_DIGIT { fprintf(stdout, "decimal_digit %d\n", $1); }
	;

// make sure it's between 0-1
binary_digit
	: x_digit
	| z_digit
	| SVLOG_DIGIT
	;

// make sure it's between 0-7
octal_digit
	: x_digit
	| z_digit
	| SVLOG_DIGIT
	;

// make sure it's between 0-9a-fA-F
hex_digit
	: x_digit
	| z_digit
	| SVLOG_DIGIT
	| SVLOG_HEXCHAR
	;

x_digit
	: SVLOG_X_DIGIT
	;

z_digit
	: SVLOG_Z_DIGIT
	;

exp
	: SVLOG_EXP
	;

sign
	: PLUS
	| MINUS
	;

// make sure digit between 0 and 1
unbased_unsized_literal
	: APOSTROPHE SVLOG_DIGIT
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
