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


/* 'std' keyword */
%token <itoken> SVLOG_STD
/* 'this' keyword */
%token <itoken> SVLOG_THIS
/* 'null' keyword */
%token <itoken> SVLOG_NULL
/* 'with' keyword */
%token <itoken> SVLOG_WITH
/* 'randomize' keyword */
%token <itoken> SVLOG_RANDOMIZE
/* 'unique' keyword */
%token <itoken> SVLOG_UNIQUE
/* 'solve' keyword */
%token <itoken> SVLOG_SOLVE
/* 'before' keyword */
%token <itoken> SVLOG_BEFORE
/* 'soft' keyword */
%token <itoken> SVLOG_SOFT
/* 'disable' keyword */
%token <itoken> SVLOG_DISABLE
/* 'dist' keyword */
%token <itoken> SVLOG_DIST
/* 'default' keyword */
%token <itoken> SVLOG_DEFAULT
/* 'super' keyword */
%token <itoken> SVLOG_SUPER


/* 'if' keyword */
%token <itoken> SVLOG_IF
/* 'else' keyword */
%token <itoken> SVLOG_ELSE
/* 'foreach' keyword */
%token <itoken> SVLOG_FOREACH
/* 'and' keyword */
%token <itoken> SVLOG_AND
/* 'or' keyword */
%token <itoken> SVLOG_OR
/* 'xor' keyword */
%token <itoken> SVLOG_XOR


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
/* numbers between 0-9 */
%token <itoken> SVLOG_DIGIT


/* $root */
%token <itoken> SVLOG_ROOT
/* $unit */
%token <itoken> SVLOG_UNIT


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


/* Logical NOT '!' */
%token <itoken> LOGICAL_NOT
/* Logical Equality '==' */
%token <itoken> LOGICAL_EQUAL
/* Logical Inequality '!=' */
%token <itoken> LOGICAL_INEQUAL
/* Logical And '&&' */
%token <itoken> LOGICAL_AND
/* Logical Or '||' */
%token <itoken> LOGICAL_OR
/* Logical Left Shift '<<<' */
%token <itoken> LOGICAL_LEFT_SHIFT
/* Logical Right Shift '>>>' */
%token <itoken> LOGICAL_RIGHT_SHIFT


/* Case equality operator '===' */
%token <itoken> CASE_EQUAL
/* Case inequality operator '!==' */
%token <itoken> CASE_NOT_EQUAL


/* Wildcard equality operator '==?' */
%token <itoken> WILDCARD_EQUAL
/* Wildcard inequality operator '!=?' */
%token <itoken> WILDCARD_NOT_EQUAL


/* Addition Operator '+:' */
%token <itoken> ADDITION_OPERATOR
/* Reduction Operator '-:' */
%token <itoken> REDUCTION_OPERATOR
/* Class Scope Operator '::' */
%token <itoken> CLASS_SCOPE_OPERATOR
/* Distributed Weight Operator used by dist ':/' */
%token <itoken> DISTRIBUTED_WEIGHT_OPERATOR
/* Equal Weight Operator used by dist ':=' */
%token <itoken> EQUAL_WEIGHT_OPERATOR


/* Power Of operation '**' */
%token <itoken> POWER_OF_OPERATOR
/* Increment operation '++' */
%token <itoken> INCREMENT_OPERATOR
/* Decrement operation '--' */
%token <itoken> DECREMENT_OPERATOR
/* Implication operation '->' */
%token <itoken> IMPLICATION_OPERATOR
/* Equivalance operation '<->' */
%token <itoken> EQUIVALANCE_OPERATOR
/* Left Shift '<<' */
%token <itoken> LEFT_SHIFT
/* Right Shift '>>' */
%token <itoken> RIGHT_SHIFT

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


/********************************************
 * Start of 'Constraints' Grammer Rules     *
 * Based off section: (A.1.10 Constraints). *
 ********************************************/

constraint_block
	: '{' constraint_block_item_recursive '}'
	;

constraint_block_item_recurse
	: constraint_block_item
	| constraint_block_item_recurse constraint_block_item
	;

constraint_block_item
	: SVLOG_SOLVE solve_before_list SVLOG_BEFORE solve_before_list ';'
	| constraint_expression
	;

solve_before_list
	: constraint_primary
	| solve_before_list ',' constraint_primary
	;

constraint_primary
	: hierarchical_identifier select
	| hierarchical_identifier select '(' ')'
	| implicit_class_handle '.' hierarchical_identifier select
	| implicit_class_handle '.' hierarchical_identifier select '(' ')'
	| class_scope hierarchical_identifier select
	| class_scope hierarchical_identifier select '(' ')'
	;

constraint_expression_recurse
	: constraint_expression
	| constraint_expression_recurse constraint_expression
	;

constraint_expression
	: expression_or_dist ';'
	| SVLOG_SOFT expression_or_dist ';'
	| uniqueness_constraint ';'
	| expression IMPLICATION_OPERATOR constraint_set
	| SVLOG_IF '(' expression ')' constraint_set
	| SVLOG_IF '(' expression ')' constraint_set SVLOG_ELSE constraint_set
	| SVLOG_FOREACH '(' ps_or_hierarchical_array_identifier '[' loop_variables ']' ')' constraint_set
	| SVLOG_DISABLE SVLOG_SOFT constraint_primary ';'
	;

uniqueness_constraint
	: SVLOG_UNIQUE '{' range_list '}'
	;

constraint_set
	: constraint_expression
	| '{' constraint_expression_recurse '}'
	;

expression_or_dist
	: expression
	| expression SVLOG_DIST '{' dist_list '}'
	;

dist_list
	: dist_item
	| dist_list ',' dist_item
	;

dist_item
	: value_range
	| value_range dist_weight
	| SVLOG_DEFAULT DISTRIBUTED_WEIGHT_OPERATOR expression
	;

dist_weight
	: EQUAL_WEIGHT_OPERATOR expression
	| DISTRIBUTED_WEIGHT_OPERATOR expression
	;

/********************************************
 * End of 'Constraints' Grammer Rules       *
 * Based off section: (A.1.10 Constraints). *
 ********************************************/


/********************************************************
 * Start of 'Net and variable types' Grammer Rules      *
 * Based off section: (A.2.2.1 Net and variable types). *
 ********************************************************/

class_scope
	: class_type CLASS_SCOPE_OPERATOR
	;

class_type_ident_loop
	: CLASS_SCOPE_OPERATOR identifier
	| CLASS_SCOPE_OPERATOR identifier parameter_value_assignment
	| class_type_ident_loop CLASS_SCOPE_OPERATOR identifier
	| class_type_ident_loop LASS_SCOPE_OPERATOR identifier parameter_value_assignment
	;

class_type
	: ps_class_identifier
	| ps_class_identifier parameter_value_assignment
	| ps_class_identifier class_type_ident_loop
	;

/********************************************************
 * End of 'Net and variable types' Grammer Rules        *
 * Based off section: (A.2.2.1 Net and variable types). *
 ********************************************************/


/*************************************************
 * Start of 'Let declarations' Grammer Rules     *
 * Based off section: (A.2.12 Let declarations). *
 *************************************************/

let_expression
	: identifier
	| identifier '(' let_list_of_arguments ')'
	| package_scope identifier
	| package_scope identifier '(' let_list_of_arguments ')'
	;

let_list_of_arguments
	: %empty
	| let_actual_arg_recurse let_list_of_arguments_ident_recurse
	| '.' identifier '(' let_actual_arg ')' let_list_of_arguments_ident_recurse
	;

let_list_of_arguments_ident_recurse
	: %empty
	| ',' '.' identifier '(' let_actual_arg ')'
	| let_list_of_arguments_ident_recurse ',' '.' identifier '(' let_actual_arg ')'
	;

let_actual_arg_recurse
	: let_actual_arg
	| let_actual_arg_recurse ',' let_actual_arg
	;

let_actual_arg
	: %empty
	| expression
	;

/*************************************************
 * End of 'Let declarations' Grammer Rules       *
 * Based off section: (A.2.12 Let declarations). *
 *************************************************/


/******************************************************
 * Start of 'Module instantiation' Grammer Rules      *
 * Based off section: (A.4.1.1 Module instantiation). *
 ******************************************************/

parameter_value_assignment
	: '#' '(' ')'
	| '#' '(' list_of_parameter_value_assignments ')'
	;

list_of_parameter_value_assignments
	: ordered_parameter_assignment_loop
	| named_parameter_assignment_loop
	;

ordered_parameter_assignment_loop
	: ordered_parameter_assignment
	| ordered_parameter_assignment_loop ',' ordered_parameter_assignment
	;

ordered_parameter_assignment
	: param_expression
	;

named_parameter_assignment_loop
	: named_parameter_assignment
	| named_parameter_assignment_loop ',' named_parameter_assignment
	;

named_parameter_assignment
	: '.' identifier '(' ')'
	| '.' identifier '(' param_expression ')'
	;

/******************************************************
 * End of 'Module instantiation' Grammer Rules        *
 * Based off section: (A.4.1.1 Module instantiation). *
 ******************************************************/


/*****************************************************************
 * Start of 'Procedural blocks and assignments' Grammer Rules    *
 * Based off section: (A.6.2 Procedural blocks and assignments). *
 *****************************************************************/

operator_assignment
	: variable_lvalue assignment_operator expression
	;

assignment_operator
	: '='
	| '+' '='
	| '-' '='
	| '*' '='
	| '/' '='
	| '%' '='
	| BIT_WISE_AND '='
	| BIT_WISE_OR '='
	| BIT_WISE_XOR '='
	| LEFT_SHIFT '='
	| RIGHT_SHIFT '='
	| LOGICAL_LEFT_SHIFT '='
	| LOGICAL_RIGHT_SHIFT '='
	;

/*****************************************************************
 * End of 'Procedural blocks and assignments' Grammer Rules      *
 * Based off section: (A.6.2 Procedural blocks and assignments). *
 *****************************************************************/


/***********************************************
 * Start of 'Case statements' Grammer Rules    *
 * Based off section: (A.6.7 Case statements). *
 ***********************************************/

range_list
	: value_range
	| range_list ',' value_range
	;

value_range
	: expression
	| '[' expression ':' expression ']'
	| '[' '$' ':' expression ']'
	| '[' expression ':' '$' ']'
	| '[' expression '+' '/' '-' expression ']'
	| '[' expression '+' '%' '-' expression ']'
	;

/***********************************************
 * End of 'Case statements' Grammer Rules      *
 * Based off section: (A.6.7 Case statements). *
 ***********************************************/


/**********************************************
 * Start of 'Concatenations' Grammer Rules    *
 * Based off section: (A.8.1 Concatenations). *
 **********************************************/

concatenation
	: %empty
	| expression
	| concatenation expression
	| concatenation ',' expression
	;

constant_concatenation
	: %empty
	| constant_expression
	| constant_concatenation constant_expression
	| constant_concatenation ',' constant_expression
	;

constant_multiple_concatenation
	: '{' constant_expression constant_concatenation '}'
	;

multiple_concatenation
	: '{' expression concatenation '}'
	;

empty_unpacked_array_concatenation
	: '{' '}'
	;

/**********************************************
 * End of 'Concatenations' Grammer Rules      *
 * Based off section: (A.8.1 Concatenations). *
 **********************************************/


/************************************************
 * Start of 'Subroutine Calls' Grammer Rules    *
 * Based off section: (A.8.2 Subroutine calls). *
 ************************************************/

constant_function_call
	: function_subroutine_call
	;

tf_call
	: ps_or_hierarchical_tf_identifier attribute_instances
	| ps_or_hierarchical_tf_identifier attribute_instances '(' list_of_arguments ')'
	;

system_tf_call
	: system_tf_identifier ';'
	| system_tf_identifier '(' list_of_arguments ')' ';'
	| system_tf_identifier '(' data_type ')' ';'
	| system_tf_identifier '(' data_type ',' expression ')' ';'
	| system_tf_identifier '(' expression ',' clocking_event ')' ';'
	;

subroutine_call
	: tf_call
	| system_tf_call
	| method_call
	| randomize_call
	| SVLOG_STD CLASS_SCOPE_OPERATOR randomize_call
	;

function_subroutine_call
	: subroutine_call
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

method_call
	: method_call_root '.' method_call_body
	;

method_call_body
	: identifier
	| identifier attribute_instances '(' list_of_arguments ')'
	| built_in_method_call
	;

built_in_method_call
	: array_manipulation_call
	| randomize_call
	;

array_manipulation_call
	: array_method_name
	| array_method_name '(' list_of_arguments ')'
	| array_method_name '(' expression ')'
	| array_method_name '(' list_of_arguments ')' SVLOG_WITH '(' expression ')'
	| array_method_name attribute_instances
	| array_method_name attribute_instances '(' list_of_arguments ')'
	| array_method_name attribute_instances SVLOG_WITH '(' expression ')'
	| array_method_name attribute_instances '(' list_of_arguments ')' SVLOG_WITH '(' expression ')'
	;

randomize_call
	: SVLOG_RANDOMIZE attribute_instances
	| SVLOG_RANDOMIZE attribute_instances '(' variable_identifier_list ')'
	| SVLOG_RANDOMIZE attribute_instances '(' SVLOG_NULL ')'
	| SVLOG_RANDOMIZE attribute_instances SVLOG_WITH constraint_block
	| SVLOG_RANDOMIZE attribute_instances SVLOG_WITH '(' identifier_list ')' constraint_block
	| SVLOG_RANDOMIZE attribute_instances '(' variable_identifier_list ')' SVLOG_WITH constraint_block
	| SVLOG_RANDOMIZE attribute_instances '(' variable_identifier_list ')' SVLOG_WITH '(' identifier_list ')' constraint_block
	| SVLOG_RANDOMIZE attribute_instances '(' SVLOG_NULL ')' SVLOG_WITH constraint_block
	| SVLOG_RANDOMIZE attribute_instances '(' SVLOG_NULL ')' SVLOG_WITH '(' identifier_list ')' constraint_block
	;

method_call_root
	: primary
	| implicit_class_handle
	;

array_method_name
	: identifier
	| SVLOG_UNIQUE
	| SVLOG_AND
	| SVLOG_OR
	| SVLOG_XOR
	;

/************************************************
 * End of 'Subroutine Calls' Grammer Rules      *
 * Based off section: (A.8.2 Subroutine calls). *
 ************************************************/


/*******************************************
 * Start of 'Expressions' Grammer Rules    *
 * Based off section: (A.8.3 Expressions). *
 *******************************************/

inc_or_dec_expression
	: inc_or_dec_operator variable_lvalue
	| inc_or_dec_operator attribute_instances variable_lvalue
	| variable_lvalue inc_or_dec_operator
	| variable_lvalue attribute_instances inc_or_dec_operator
	;

constant_expression
	: constant_primary
	| unary_operator constant_primary
	| unary_operator attribute_instances constant_primary
	| constant_expression binary_operator constant_expression
	| constant_expression binary_operator attribute_instances constant_expression
	| constant_expression '?' constant_expression ':' constant_expression
	| constant_expression '?' attribute_instances constant_expression ':' constant_expression
	;

param_expression
	: mintypmax_expression
	| data_type
	| '$'
	;

constant_part_select_range
	: constant_range
	| constant_indexed_range
	;

constant_range
	: constant_expression ':' constant_expression
	;

constant_indexed_range
	: constant_expression ADDITION_OPERATOR constant_expression
	| constant_expression REDUCTION_OPERATOR constant_expression
	;

expression
	:	
	| primary
	| unary_operator primary
	| unary_operator attribute_instances primary
	| inc_or_dec_expression
	| '(' operator_assignment ')'
	| expression binary_operator expression
	| expression binary_operator attribute_instances expression
	| conditional_expression
	| inside_expression
	| tagged_union_expression
	;

mintypmax_expression
	: expression
	| expression ':' expression ':' expression
	;

part_select_range 
	: constant_range
	| indexed_range
	;

indexed_range
	: expression ADDITION_OPERATOR constant_expression
	| expression REDUCTION_OPERATOR constant_expression
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
	| identifier
	| identifier '[' constant_range_expression ']'
	| primary_literal
	| ps_parameter_identifier constant_select
	| identifier constant_select
	| package_scope identifier
	| class_scope identifier
	| empty_unpacked_array_concatenation
	| constant_concatenation
	| constant_concatenation '[' constant_range_expression ']'
	| constant_multiple_concatenation
	| constant_multiple_concatenation '[' constant_range_expression ']'
	| constant_function_call
	| constant_function_call '[' constant_range_expression ']'
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
	| concatenation
	| concatenation '[' range_expression ']'
	| multiple_concatenation
	| multiple_concatenation '[' range_expression ']'
	| function_subroutine_call
	| function_subroutine_call '[' range_expression ']'
	| let_expression
	| '(' mintypmax_expression ')'
	| cast
	| assignment_pattern_expression
	| streaming_concatenation
	| sequence_method_call
	;

range_expression 
	: expression
	| part_select_range
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

implicit_class_handle
	: SVLOG_THIS
	| SVLOG_SUPER
	| SVLOG_THIS '.' SVLOG_SUPER
	;

bit_select
	: %empty
	| '[' expression ']'
	| bit_select '[' expression ']'
	;

member_identifier_bit_select_recurse
	: %empty
	| '.' identifier bit_select
	| member_identifier_bit_select_recurse '.' identifier bit_select

select
	: bit_select
	| bit_select '[' part_select_range ']'
	| member_identifier_bit_select_recurse '.' identifier bit_select
	| member_identifier_bit_select_recurse '.' identifier bit_select '[' part_select_range ']'
	;

constant_bit_select
	: '[' constant_expression ']'
	| constant_bit_select '[' constant_expression ']'
	;

constant_select_loop
	: '.' identifier constant_bit_select
	| constant_select_loop '.' identifier constant_bit_select
	;

constant_select
	: constant_bit_select
	| constant_bit_select '[' constant_part_select_range ']'
	| constant_select_loop
	| constant_select_loop '[' constant_part_select_range ']'
	;

/*****************************************
 * End of 'Primaries' Grammer Rules      *
 * Based off section: (A.8.4 Primaries). *
 *****************************************/


/***********************************************************
 * Start of 'Expression left-side values' Grammer Rules    *
 * Based off section: (A.8.5 Expression left-side values). *
 ***********************************************************/

variable_lvalue
	: hierarchical_variable_identifier select
	| implicit_class_handle '.' hierarchical_variable_identifier select
	| package_scope hierarchical_variable_identifier select
	| streaming_concatenation
	| assignment_pattern_variable_lvalue
	| assignment_pattern_expression_type assignment_pattern_variable_lvalue
	| variable_lvalue ',' variable_lvalue
	;

/***********************************************************
 * End of 'Expression left-side values' Grammer Rules      *
 * Based off section: (A.8.5 Expression left-side values). *
 ***********************************************************/


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

binary_operator
	: '+'
	| '-'
	| '*'
	| '/'
	| '%'
	| LOGICAL_EQUAL
	| LOGICAL_INEQUAL
	| CASE_EQUAL
	| CASE_NOT_EQUAL
	| WILDCARD_EQUAL
	| WILDCARD_NOT_EQUAL
	| LOGICAL_ADD
	| LOGICAL_OR
	| POWER_OF_OPERATOR
	| '<'
	| LT_OR_EQ
	| '>'
	| GT_OR_EQ
	| BIT_WISE_AND
	| BIT_WISE_OR
	| BIT_WISE_XOR
	| BIT_WISE_XNOR
	| RIGHT_SHIFT
	| LEFT_SHIFT
	| LOGICAL_LEFT_SHIFT
	| LOGICAL_RIGHT_SHIFT
	| IMPLICATION_OPERATOR
	| EQUIVALANCE_OPERATOR
	;

inc_or_dec_operator
	: INCREMENT_OPERATOR
	| DECREMENT_OPERATOR
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

attribute_instances
	: attribute_instance
	| attribute_instances attribute_instance
	| %empty
	;

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
	| SVLOG_ROOT '.' identifier
	| hierarchical_identifier identifier constant_bit_select '.'
	;

identifier
	: SVLOG_SIDENT { fprintf(stdout, "statement(SVLOG_SIDENT) -> %s\n", $1); }
	| SVLOG_EIDENT { fprintf(stdout, "statement(SVLOG_EIDENT) -> %s\n", $1); }
	;

package_scope
	: identifier CLASS_SCOPE_OPERATOR
	| SVLOG_UNIT CLASS_SCOPE_OPERATOR
	;

ps_class_identifier
	: identifier
	| package_scope identifier
	;

ps_or_hierarchical_array_identifier
	: identifier
	| implicit_class_handle '.' identifier
	| class_scope identifier
	| package_scope identifier
	;

ps_or_hierarchical_tf_identifier
	: identifier
	| package_scope identifier
	| hierarchical_identifier
	;

ps_param_ident_loop
	: generate_block_identifier '.'
	| generate_block_identifier  '[' constant_expression ']' '.'
	| ps_param_ident_loop generate_block_identifier '.'
	| ps_param_ident_loop generate_block_identifier  '[' constant_expression ']' '.'
	;

ps_parameter_identifier
	: identifier
	| package_scope identifier
	| class_scope identifier
	| ps_param_ident_loop identifier
	;

system_tf_identifier
	: SVLOG_STFIDENT { fprintf(stdout, "%s\n", $1); }
	;

/*******************************************
 * End of 'Identifiers' grammer rules.     *
 * Based off section: (A.9.3 Identifiers). *
 *******************************************/

%%
