%{

#include <stdio.h>

#include "parser/parser-private.h"

%}

%define parse.error verbose
%define api.pure full
%define api.value.type {union YYSTYPE}
%parse-param {void *scanner}
%lex-param {void *scanner}
%locations

/* declare tokens */

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
/* 'this' keyword */
%token <itoken> SVLOG_THIS
/* 'null' keyword */
%token <itoken> SVLOG_NULL
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
/* Simple Identifier */
%token <stoken> SVLOG_SIDENT
/* Escaped identifiers */
%token <stoken> SVLOG_EIDENT
/* System task and functions identifier */
%token <stoken> SVLOG_STFIDENT
/* Quoted Strings */
%token <stoken> SVLOG_QUOTED_STRING
/* String Escape Sequence */
%token <stoken> SVLOG_ESCAPE_SEQ
/* Triple Quoted Strings */
%token <stoken> SVLOG_TRIPLE_QUOTED_STRING
/* Hierarchical Identifier */
%token <itoken> SVLOG_HIDENT
/* numbers between 0-9 */
%token <itoken> SVLOG_DIGIT
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

%start svlog

%%

svlog
	: statements
	| primary_literal
	| unary_operator
	| system_tf_call
	| %empty
	;

statements
	: statement
	| statements statement
	;

statement
	: identifier
	| identifier ';'
	;


/************************************************
 * Start of 'Subroutine Calls' Grammer Rules    *
 * Based off section: (A.8.2 Subroutine calls). *
 ************************************************/

system_tf_call
	: system_tf_identifier ';'
	| system_tf_identifier '(' list_of_arguments ')' ';'
	| system_tf_identifier '(' data_type ')' ';'
	| system_tf_identifier '(' data_type ',' expression ')' ';'
	| system_tf_identifier '(' expression ',' clocking_event ')' ';'
	;

list_of_arguments
	: 
	| expression
	| '.' identifier '(' ')'
	| '.' identifier '(' expression ')'
	| list_of_arguments ',' expression
	| list_of_arguments ',' '.' identifier '(' ')'
	| list_of_arguments ',' '.' identifier '(' expression ')'
	;

/************************************************
 * End of 'Subroutine Calls' Grammer Rules      *
 * Based off section: (A.8.2 Subroutine calls). *
 ************************************************/


/*******************************************
 * Start of 'Expressions' Grammer Rules    *
 * Based off section: (A.8.3 Expressions). *
 *******************************************/

constant_expression
	: constant_primary
	| unary_operator constant_primary
	| unary_operator attribute_instance constant_primary
	| constant_expression binary_operator constant_expression
	| constant_expression binary_operator attribute_instance constant_expression
	| constant_expression '?' constant_expression ':' constant_expression
	| constant_expression '?' attribute_instance constant_expression ':' constant_expression
	;

expression
	:	
	| primary
	| unary_operator { attribute_instance } primary
	| inc_or_dec_expression
	| '(' operator_assignment ')'
	| expression binary_operator { attribute_instance } expression
	| conditional_expression
	| inside_expression
	| tagged_union_expression
	;

/*******************************************
 * End of 'Expressions' Grammer Rules      *
 * Based off section: (A.8.3 Expressions). *
 *******************************************/


/*****************************************
 * Start of 'Primaries' Grammer Rules    *
 * Based off section: (A.8.4 Primaries). *
 *****************************************/

constant_primary
	: SVLOG_NULL
	| primary_literal
	| ps_parameter_identifier constant_select
	| specparam_identifier [ '[' constant_range_expression ']' ]
	| genvar_identifier
	| formal_port_identifier constant_select
	| [ package_scope | class_scope ] enum_identifier
	| empty_unpacked_array_concatenation
	| constant_concatenation [ '[' constant_range_expression ']' ]
	| constant_multiple_concatenation [ '[' constant_range_expression ']' ]
	| constant_function_call [ '[' constant_range_expression ']' ]
	| constant_let_expression
	| '(' constant_mintypmax_expression ')'
	| constant_cast
	| constant_assignment_pattern_expression
	| type_reference
	;

primary
	: '$'
	| SVLOG_THIS
	| SVLOG_NULL
	| primary_literal
	| hierarchical_identifier select
	| class_qualifier hierarchical_identifier select
	| package_scope hierarchical_identifier select
	| empty_unpacked_array_concatenation
	| concatenation [ [ range_expression ] ]
	| multiple_concatenation [ [ range_expression ] ]
	| function_subroutine_call [ [ range_expression ] ]
	| let_expression
	| ( mintypmax_expression )
	| cast
	| assignment_pattern_expression
	| streaming_concatenation
	| sequence_method_call
	;

primary_literal
	: number
	| time_literal
	| unbased_unsized_literal
	| string_literal
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

constant_bit_select
	: '[' constant_expression ']'
	| constant_bit_select '[' constant_expression ']'
	;

/*****************************************
 * End of 'Primaries' Grammer Rules      *
 * Based off section: (A.8.4 Primaries). *
 *****************************************/


/*****************************************
 * Start of 'Operators' Grammer Rules    *
 * Based off section: (A.8.6 Operators). *
 *****************************************/

unary_operator
	: sign
	| LOGICAL_NOT
	| BIT_WISE_NOT
	| BIT_WISE_AND
	| BIT_WISE_NAND
	| BIT_WISE_OR
	| BIT_WISE_NOR
	| BIT_WISE_XOR
	| BIT_WISE_XNOR
	;

/*****************************************
 * End of 'Operators' Grammer Rules      *
 * Based off section: (A.8.6 Operators). *
 *****************************************/


/***************************************
 * Start of 'Numbers' Grammer Rules    *
 * Based off section: (A.8.7 Numbers). *
 ***************************************/

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
	: decimal_base x_digit
	| decimal_base_x_digit decimal_base x_digit '_'
	| size decimal_base x_digit
	| decimal_base_x_digit size decimal_base x_digit '_'
	;

decimal_base_z_digit
	: decimal_base z_digit
	| decimal_base_z_digit decimal_base z_digit '_'
	| size decimal_base z_digit
	| decimal_base_z_digit size decimal_base z_digit '_'
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

sign
	: '+'
	| '-'
	;

size
	: unsigned_number
	;

real_number
	: fixed_point_number
	| unsigned_number exp unsigned_number
	| unsigned_number exp sign unsigned_number
	| unsigned_number '.' unsigned_number exp unsigned_number
	| unsigned_number '.' unsigned_number exp sign unsigned_number
	;

fixed_point_number
	: unsigned_number '.' unsigned_number
	;

exp
	: SVLOG_EXP
	;

unsigned_number
	: decimal_digit
	| unsigned_number decimal_digit
	| unsigned_number decimal_digit '_'
	;

binary_value
	: binary_digit
	| binary_value binary_digit
	| binary_value binary_digit '_'
	;

octal_value
	: octal_digit
	| octal_value octal_digit
	| octal_value octal_digit '_'
	;

hex_value
	: hex_digit
	| hex_value hex_digit
	| hex_value hex_digit '_'
	;

decimal_base
	: '\'' SVLOG_DEC_BASE_S SVLOG_DEC_BASE_D
	| '\'' SVLOG_DEC_BASE_D
	;

binary_base
	: '\'' SVLOG_DEC_BASE_S SVLOG_BIN_BASE
	| '\'' SVLOG_BIN_BASE
	;

octal_base
	: '\'' SVLOG_DEC_BASE_S SVLOG_OCT_BASE
	| '\'' SVLOG_OCT_BASE
	;

hex_base
	: '\'' SVLOG_DEC_BASE_S SVLOG_HEX_BASE
	| '\'' SVLOG_HEX_BASE
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

// make sure digit between 0 and 1
unbased_unsized_literal
	: '\'' SVLOG_DIGIT
	;

/***************************************
 * End of 'Numbers' Grammer Rules      *
 * Based off section: (A.8.7 Numbers). *
 ***************************************/


/***************************************
 * Start of 'Strings' Grammer Rules    *
 * Based off section: (A.8.8 Strings). *
 ***************************************/

string_literal
	: quoted_string
	| triple_quoted_string
	;

quoted_string
	: '"' quoted_string_item '"'
	| '"' string_escape_seq '"'
	;

triple_quoted_string 
	:
	| '"' '"' '"' triple_quoted_string_item '"' '"' '"'
	| '"' '"' '"' string_escape_seq '"' '"' '"'
	;

quoted_string_item
	: SVLOG_QUOTED_STRING
	| %empty
	;

triple_quoted_string_item
	: SVLOG_TRIPLE_QUOTED_STRING
	| %empty
	;

string_escape_seq
	: SVLOG_ESCAPE_SEQ
	| %empty
	;

/***************************************
 * End of 'Strings' Grammer Rules      *
 * Based off section: (A.8.8 Strings). *
 ***************************************/


/******************************************
 * Start of 'Attributes' grammer rules.   *
 * Based off section: (A.9.1 Attributes). *
 ******************************************/

attribute_instance
	:
	| '(' '*' attribute_specs '*' ')'
	;

attribute_specs
	: attr_spec
	| attribute_instace_loop ',' attr_spec
	;

attr_spec
	: attr_name
	| attr_name  '=' constant_expression
	;

attr_name
	: identifier
	;

/******************************************
 * Start of 'Attributes' grammer rules.   *
 * Based off section: (A.9.1 Attributes). *
 ******************************************/


/*******************************************
 * Start of 'Identifiers' grammer rules.   *
 * Based off section: (A.9.3 Identifiers). *
 *******************************************/

hierarchical_identifier
	:
	| identifier
	| SVLOG_HIDENT '.' identifier
	| hierarchical_identifier identifier constant_bit_select '.'
	;

identifier
	: SVLOG_SIDENT { fprintf(stdout, "statement(SVLOG_SIDENT) -> %s\n", $1); }
	| SVLOG_EIDENT { fprintf(stdout, "statement(SVLOG_EIDENT) -> %s\n", $1); }
	;

system_tf_identifier
	: SVLOG_STFIDENT { fprintf(stdout, "%s\n", $1); }
	;

/*******************************************
 * End of 'Identifiers' grammer rules.     *
 * Based off section: (A.9.3 Identifiers). *
 *******************************************/

%%
