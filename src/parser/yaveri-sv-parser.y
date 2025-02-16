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
/* 1step '1step' */
%token <itoken> SVLOG_1STEP


/* 'var' keyword */
%token <itoken> SVLOG_VAR
/* 'std' keyword */
%token <itoken> SVLOG_STD
/* 'this' keyword */
%token <itoken> SVLOG_THIS
/* 'void' keyword */
%token <itoken> SVLOG_VOID
/* 'null' keyword */
%token <itoken> SVLOG_NULL
/* 'with' keyword */
%token <itoken> SVLOG_WITH
/* 'randomize' keyword */
%token <itoken> SVLOG_RANDOMIZE
/* 'unique' keyword */
%token <itoken> SVLOG_UNIQUE
/* 'unique0' keyword */
%token <itoken> SVLOG_UNIQUE0
/* 'priority' keyword */
%token <itoken> SVLOG_PRIORITY
/* 'solve' keyword */
%token <itoken> SVLOG_SOLVE
/* 'before' keyword */
%token <itoken> SVLOG_BEFORE
/* 'soft' keyword */
%token <itoken> SVLOG_SOFT
/* 'disable' keyword */
%token <itoken> SVLOG_DISABLE
/* 'fork' keyword */
%token <itoken> SVLOG_FORK
/* 'dist' keyword */
%token <itoken> SVLOG_DIST
/* 'default' keyword */
%token <itoken> SVLOG_DEFAULT
/* 'super' keyword */
%token <itoken> SVLOG_SUPER
/* 'struct' keyword */
%token <itoken> SVLOG_STRUCT
/* 'union' keyword */
%token <itoken> SVLOG_UNION
/* 'tagged' keyword */
%token <itoken> SVLOG_TAGGED
/* 'packed' keyword */
%token <itoken> SVLOG_PACKED
/* 'enum' keyword */
%token <itoken> SVLOG_ENUM
/* 'string' keyword */
%token <itoken> SVLOG_STRING
/* 'chandle' keyword */
%token <itoken> SVLOG_CHANDLE
/* 'virtual' keyword */
%token <itoken> SVLOG_VIRTUAL
/* 'event' keyword */
%token <itoken> SVLOG_EVENT
/* 'new' keyword */
%token <itoken> SVLOG_NEW
/* 'type' keyword */
%token <itoken> SVLOG_TYPE
/* 'first_match' keyword */
%token <itoken> SVLOG_FIRST_MATCH
/* 'throughout' keyword */
%token <itoken> SVLOG_THROUGHOUT
/* 'within' keyword */
%token <itoken> SVLOG_WITHIN


/* 'iff'|'&&&' If and only if */
%token <itoken> SVLOG_IF_AND_ONLY_IF
/* 'if' keyword */
%token <itoken> SVLOG_IF
/* 'else' keyword */
%token <itoken> SVLOG_ELSE
/* 'and' keyword */
%token <itoken> SVLOG_AND
/* 'or' keyword */
%token <itoken> SVLOG_OR
/* 'xor' keyword */
%token <itoken> SVLOG_XOR
/* 'intersect' keyword */
%token <itoken> SVLOG_INTERSECT
/* 'matches' keyword */
%token <itoken> SVLOG_MATCHES
/* 'inside' keyword */
%token <itoken> SVLOG_INSIDE
/* 'case' keyword */
%token <itoken> SVLOG_CASE
/* 'casez' keyword */
%token <itoken> SVLOG_CASEZ
/* 'casex' keyword */
%token <itoken> SVLOG_CASEX
/* 'randcase' keyword */
%token <itoken> SVLOG_RANDCASE
/* 'endcase' keyword */
%token <itoken> SVLOG_ENDCASE
/* 'do' keyword */
%token <itoken> SVLOG_DO
/* 'for' keyword */
%token <itoken> SVLOG_FOR
/* 'repeat' keyword */
%token <itoken> SVLOG_REPEAT
/* 'foreach' keyword */
%token <itoken> SVLOG_FOREACH
/* 'forever' keyword */
%token <itoken> SVLOG_FOREVER
/* 'while' keyword */
%token <itoken> SVLOG_WHILE


/* 'assign' keyword */
%token <itoken> SVLOG_ASSIGN
/* 'deassign' keyword */
%token <itoken> SVLOG_DEASSIGN
/* 'force' keyword */
%token <itoken> SVLOG_FORCE
/* 'release' keyword */
%token <itoken> SVLOG_RELEASE


/* 'reg' keyword */
%token <itoken> SVLOG_REG
/* 'wire' keyword */
%token <itoken> SVLOG_WIRE
/* 'integer' keyword */
%token <itoken> SVLOG_INTEGER
/* 'real' keyword */
%token <itoken> SVLOG_REAL
/* 'time' keyword */
%token <itoken> SVLOG_TIME
/* 'realtime' keyword */
%token <itoken> SVLOG_REAL_TIME
/* 'logic' keyword */
%token <itoken> SVLOG_LOGIC
/* 'bit' keyword */
%token <itoken> SVLOG_BIT
/* 'byte' keyword */
%token <itoken> SVLOG_BYTE
/* 'shortint' keyword */
%token <itoken> SVLOG_SHORT_INT
/* 'int' keyword */
%token <itoken> SVLOG_INT
/* 'longint' keyword */
%token <itoken> SVLOG_LONG_INT
/* 'shortreal' keyword */
%token <itoken> SVLOG_SHORT_REAL
/* 'signed' keyword */
%token <itoken> SVLOG_SIGNED
/* 'unsigned' keyword */
%token <itoken> SVLOG_UNSIGNED
/* 'rand' keyword */
%token <itoken> SVLOG_RAND
/* 'randc' keyword */
%token <itoken> SVLOG_RANDC
/* 'posedge' keyword */
%token <itoken> SVLOG_POSEDGE
/* 'negedge' keyword */
%token <itoken> SVLOG_NEGEDGE
/* 'edge' keyword */
%token <itoken> SVLOG_EDGE


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


/* Case equality operator '===' */
%token <itoken> CASE_EQUAL
/* Case inequality operator '!==' */
%token <itoken> CASE_NOT_EQUAL


/* Wildcard equality operator '==?' */
%token <itoken> WILDCARD_EQUAL
/* Wildcard inequality operator '!=?' */
%token <itoken> WILDCARD_NOT_EQUAL


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
/* Non-blocking Implication operation '->>' */
%token <itoken> NONBLOCK_IMPLICATION_OPERATOR
/* Implication operation '->' */
%token <itoken> IMPLICATION_OPERATOR
/* Equivalance operation '<->' */
%token <itoken> EQUIVALANCE_OPERATOR
/* Left Shift '<<' */
%token <itoken> LEFT_SHIFT
/* Right Shift '>>' */
%token <itoken> RIGHT_SHIFT
/* Greater Than Or Equal '>=' */
%token <itoken> GT_OR_EQ
/* Less Than Or Equal '<=' */
%token <itoken> LT_OR_EQ


/* apostrophe token ' */
%token <itoken> APOSTROPHE


%start svlog

%%

svlog
	: primary_literal
	| system_tf_call
	| %empty
	;

/*******************************************
 * Start of 'Class items' Grammer Rules    *
 * Based off section: (A.1.9 Class items). *
 *******************************************/

random_qualifier
	: SVLOG_RAND
	| SVLOG_RANDC
	;

/*******************************************
 * End of 'Class items' Grammer Rules      *
 * Based off section: (A.1.9 Class items). *
 *******************************************/


/********************************************
 * Start of 'Constraints' Grammer Rules     *
 * Based off section: (A.1.10 Constraints). *
 ********************************************/

constraint_block
	: '{' constraint_block_item_recurse '}'
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

data_type
	: SVLOG_STRING
	| SVLOG_CHANDLE
	| SVLOG_EVENT
	| integer_vector_type
	| integer_vector_type signing packed_dimesion_recurse
	| integer_atom_type
	| integer_atom_type signing
	| non_integer_type
	| struct_union '{' struct_union_member_recurse '}' packed_dimesion_recurse
	| struct_union SVLOG_TAGGED '{' struct_union_member_recurse '}' packed_dimesion_recurse
	| struct_union SVLOG_TAGGED signing '{' struct_union_member_recurse '}' packed_dimesion_recurse
	| SVLOG_ENUM enum_name_declaration_recurse packed_dimesion_recurse
	| SVLOG_ENUM enum_base_type enum_name_declaration_recurse packed_dimesion_recurse
	| SVLOG_VIRTUAL identifier
	| SVLOG_VIRTUAL SVLOG_INTERFACE identifier
	| SVLOG_VIRTUAL identifier parameter_value_assignment
	| SVLOG_VIRTUAL SVLOG_INTERFACE identifier parameter_value_assignment
	| SVLOG_VIRTUAL identifier '.' identifier
	| SVLOG_VIRTUAL SVLOG_INTERFACE identifier '.' identifier
	| SVLOG_VIRTUAL identifier parameter_value_assignment '.' identifier
	| SVLOG_VIRTUAL SVLOG_INTERFACE identifier parameter_value_assignment '.' identifier
	| class_scope identifier packed_dimesion_recurse
	| package_scope identifier packed_dimesion_recurse
	| class_type
	| ps_covergroup_identifier
	| type_reference
	;

enum_base_type
	: integer_atom_type
	| integer_atom_type signing
	| integer_vector_type
	| integer_vector_type signing
	| integer_vector_type packed_dimension
	| integer_vector_type signing packed_dimension
	| identifier
	| identifier packed_dimension
	;

enum_name_declaration_recurse
	: %empty
	| enum_name_declaration
	| enum_name_declaration_recurse ',' enum_name_declaration
	;

enum_name_declaration
	: identifier
	| identifier '[' integral_number ']'
	| identifier '[' integral_number ':' integral_number ']'
	| identifier '[' integral_number ':' integral_number ']' '=' constant_expression
	| identifier '=' constant_expression
	;

class_scope
	: class_type CLASS_SCOPE_OPERATOR
	;

class_type_ident_recurse
	: CLASS_SCOPE_OPERATOR identifier
	| CLASS_SCOPE_OPERATOR identifier parameter_value_assignment
	| class_type_ident_recurse CLASS_SCOPE_OPERATOR identifier
	| class_type_ident_recurse CLASS_SCOPE_OPERATOR identifier parameter_value_assignment
	;

class_type
	: ps_class_identifier
	| ps_class_identifier parameter_value_assignment
	| ps_class_identifier class_type_ident_recurse
	;

integer_atom_type
	: SVLOG_BYTE
	| SVLOG_SHORT_INT
	| SVLOG_INT
	| SVLOG_LONG_INT
	| SVLOG_INT
	| SVLOG_TIME
	;

integer_vector_type
	: SVLOG_BIT
	| SVLOG_LOGIC
	| SVLOG_REG
	;

non_integer_type
	: SVLOG_SHORT_REAL
	| SVLOG_REAL
	| SVLOG_REAL_TIME
	;

signing
	:
	| SVLOG_SIGNED
	| SVLOG_UNSIGNED
	;

struct_union
	: SVLOG_STRUCT
	| SVLOG_UNION SVLOG_SOFT
	| SVLOG_UNION SVLOG_TAGGED
	;

struct_union_member_recurse
	: struct_union_member
	| struct_union_member_recurse struct_union_member
	;

struct_union_member
	: attribute_instance_recurse data_type_or_void list_of_variable_decl_assignments ';'
	| attribute_instance_recurse random_qualifier data_type_or_void list_of_variable_decl_assignments ';'
	;

data_type_or_void
	: data_type
	| SVLOG_VOID
	;

type_reference
	: SVLOG_TYPE '(' expression ')'
	| SVLOG_TYPE '(' data_type_or_incomplete_class_scoped_type ')'
	;

data_type_or_incomplete_class_scoped_type
	: data_type
	| incomplete_class_scoped_type
	;

incomplete_class_scoped_type
	: identifier CLASS_SCOPE_OPERATOR type_identifier_or_class_type
	| incomplete_class_scoped_type CLASS_SCOPE_OPERATOR type_identifier_or_class_type
	;

type_identifier_or_class_type
	: identifier
	| class_type
	;

/********************************************************
 * End of 'Net and variable types' Grammer Rules        *
 * Based off section: (A.2.2.1 Net and variable types). *
 ********************************************************/


/****************************************
 * Start of 'Delays' Grammer Rules      *
 * Based off section: (A.2.2.3 Delays). *
 ****************************************/

delay2
	: '#' delay_value
	| '#' '(' mintypmax_expression ')'
	| '#' '(' mintypmax_expression ',' mintypmax_expression ')'
	;

delay3
	: '#' delay_value
	| '#' '(' mintypmax_expression ')'
	| '#' '(' mintypmax_expression ',' mintypmax_expression ')'
	| '#' '(' mintypmax_expression ',' mintypmax_expression ',' mintypmax_expression ')'
	;

delay_value
	: unsigned_number
	| real_number
	| ps_identifier
	| time_literal
	| SVLOG_1STEP
	;

/****************************************
 * End of 'Delays' Grammer Rules        *
 * Based off section: (A.2.2.3 Delays). *
 ****************************************/


/*************************************************
 * Start of 'Declaration lists' Grammer Rules    *
 * Based off section: (A.2.3 Declaration lists). *
 *************************************************/

list_of_variable_decl_assignments
	: variable_decl_assignment
	| list_of_variable_decl_assignments ',' variable_decl_assignment
	;

/*************************************************
 * End of 'Declaration lists' Grammer Rules      *
 * Based off section: (A.2.3 Declaration lists). *
 *************************************************/


/*******************************************************
 * Start of 'Declaration assignments' Grammer Rules    *
 * Based off section: (A.2.4 Declaration assignments). *
 ******************************************************/

variable_decl_assignment
	: identifier
	| identifier variable_dimension_recurse
	| identifier variable_dimension_recurse '=' expression
	| identifier unsized_dimension variable_dimension_recurse
	| identifier unsized_dimension variable_dimension_recurse '=' dynamic_array_new
	| identifier '=' class_new
	;

class_new
	: SVLOG_NEW
	| SVLOG_NEW '(' list_of_arguments ')'
	| class_scope SVLOG_NEW '(' list_of_arguments ')'
	| SVLOG_NEW expression
	;

dynamic_array_new
	: SVLOG_NEW '[' expression ']'
	| SVLOG_NEW '[' expression ']' '(' expression ')'
	;

/*******************************************************
 * End of 'Declaration assignments' Grammer Rules      *
 * Based off section: (A.2.4 Declaration assignments). *
 *******************************************************/


/**************************************************
 * Start of 'Declaration ranges' Grammer Rules    *
 * Based off section: (A.2.5 Declaration ranges). *
 **************************************************/

unpacked_dimension
	: '[' constant_range ']'
	| '[' constant_expression ']'
	;

packed_dimesion_recurse
	: %empty
	| packed_dimension
	| packed_dimesion_recurse packed_dimension
	;

packed_dimension
	: '[' constant_range ']'
	| unsized_dimension
	;

associative_dimension
	: '[' data_type ']'
	| '[' '*' ']'
	;

variable_dimension_recurse
	: %empty
	| variable_dimension
	| variable_dimension_recurse variable_dimension
	;

variable_dimension
	: unsized_dimension
	| unpacked_dimension
	| associative_dimension
	| queue_dimension
	;

queue_dimension
	: '[' '$' ']'
	| '[' '$' ':' constant_expression ']'
	;

unsized_dimension
	: '[' ']'
	;

/**************************************************
 * End of 'Declaration ranges' Grammer Rules      *
 * Based off section: (A.2.5 Declaration ranges). *
 **************************************************/


/*******************************************************
 * Start of 'Assertion declarations' Grammer Rules     *
 * Based off section: (A.2.10 Assertion declarations). *
 *******************************************************/

sequence_expr
	: cycle_delay_range sequence_expr
	| sequence_expr cycle_delay_range sequence_expr
	| expression_or_dist
	| expression_or_dist boolean_abbrev
	| sequence_instance
	| sequence_instance sequence_abbrev
	| '(' sequence_expr sequence_match_item_recurse ')'
	| '(' sequence_expr sequence_match_item_recurse ')' sequence_abbrev
	| sequence_expr SVLOG_AND sequence_expr
	| sequence_expr SVLOG_INTERSECT sequence_expr
	| sequence_expr SVLOG_OR sequence_expr
	| SVLOG_FIRST_MATCH '(' sequence_expr sequence_match_item_recurse ')'
	| expression_or_dist SVLOG_THROUGHOUT sequence_expr
	| sequence_expr SVLOG_WITHIN sequence_expr
	| clocking_event sequence_expr
	;

cycle_delay_range
	: '#' '#' constant_primary
	| '#' '#' '[' cycle_delay_const_range_expression ']'
	| '#' '#' '[' '*' ']'
	| '#' '#' '[' '+' ']'
	;

sequence_match_item_recurse
	: %empty
	| ',' sequence_match_item
	| sequence_match_item_recurse ',' sequence_match_item
	;

sequence_match_item
	: operator_assignment
	| inc_or_dec_expression
	| subroutine_call
	;

sequence_instance
	: ps_or_hierarchical_sequence_identifier
	| ps_or_hierarchical_sequence_identifier '(' ')'
	| ps_or_hierarchical_sequence_identifier '(' sequence_list_of_arguments ')'
	;

sequence_list_of_arguments
	: sequence_actual_arg_recurse ident_seq_actual_arg_recurse
	| '.' identifier '(' ')' ident_seq_actual_arg_recurse
	| '.' identifier '(' sequence_actual_arg ')' ident_seq_actual_arg_recurse
	;

ident_seq_actual_arg_recurse
	: %empty
	| ',' '.' identifier '(' ')'
	| ',' '.' identifier '(' sequence_actual_arg ')'
	| ident_seq_actual_arg_recurse ',' '.' identifier '(' ')'
	| ident_seq_actual_arg_recurse ',' '.' identifier '(' sequence_actual_arg ')'
	;

sequence_actual_arg_recurse
	: %empty
	| sequence_actual_arg
	| sequence_actual_arg_recurse ',' sequence_actual_arg
	;

sequence_actual_arg
	: event_expression
	| sequence_expr
	| '$'
	;

boolean_abbrev
	: consecutive_repetition
	| nonconsecutive_repetition
	| goto_repetition
	;

sequence_abbrev
	: consecutive_repetition
	;

consecutive_repetition
	: '[' '*' const_or_range_expression ']'
	| '[' '*' ']'
	| '[' '+' ']'
	;

nonconsecutive_repetition
	: '[' '=' const_or_range_expression ']'
	;

goto_repetition
	: '[' IMPLICATION_OPERATOR const_or_range_expression ']'
	;

const_or_range_expression
	: constant_expression
	| cycle_delay_const_range_expression
	;

cycle_delay_const_range_expression
	: constant_expression ':' constant_expression
	| constant_expression ':' '$'
	;

/*******************************************************
 * End of 'Assertion declarations' Grammer Rules       *
 * Based off section: (A.2.10 Assertion declarations). *
 *******************************************************/


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
	: ordered_parameter_assignment_recurse
	| named_parameter_assignment_recurse
	;

ordered_parameter_assignment_recurse
	: ordered_parameter_assignment
	| ordered_parameter_assignment_recurse ',' ordered_parameter_assignment
	;

ordered_parameter_assignment
	: param_expression
	;

named_parameter_assignment_recurse
	: named_parameter_assignment
	| named_parameter_assignment_recurse ',' named_parameter_assignment
	;

named_parameter_assignment
	: '.' identifier '(' ')'
	| '.' identifier '(' param_expression ')'
	;

/******************************************************
 * End of 'Module instantiation' Grammer Rules        *
 * Based off section: (A.4.1.1 Module instantiation). *
 ******************************************************/


/******************************************************************************
 * Start of 'Continuous assignment and net alias statements' Grammer Rules    *
 * Based off section: (A.6.1 Continuous assignment and net alias statements). *
 ******************************************************************************/

list_of_variable_assignments
	: variable_assignment
	| list_of_variable_assignments ',' variable_assignment
	;

net_assignment
	: net_lvalue '=' expression
	;

/******************************************************************************
 * End of 'Continuous assignment and net alias statements' Grammer Rules      *
 * Based off section: (A.6.1 Continuous assignment and net alias statements). *
 ******************************************************************************/


/*****************************************************************
 * Start of 'Procedural blocks and assignments' Grammer Rules    *
 * Based off section: (A.6.2 Procedural blocks and assignments). *
 *****************************************************************/

blocking_assignment
	: variable_lvalue '=' delay_or_event_control expression
	| nonrange_variable_lvalue '=' dynamic_array_new
	| hierarchical_identifier select '=' class_new
	| implicit_class_handle '.' hierarchical_identifier select '=' class_new
	| class_scope hierarchical_identifier select '=' class_new
	| package_scope hierarchical_identifier select '=' class_new
	| operator_assignment
	| inc_or_dec_expression
	;

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

nonblocking_assignment
	: variable_lvalue LT_OR_EQ expression
	| variable_lvalue LT_OR_EQ delay_or_event_control expression
	;

procedural_continuous_assignment
	: SVLOG_ASSIGN variable_assignment
	| SVLOG_DEASSIGN variable_lvalue
	| SVLOG_FORCE variable_assignment
	| SVLOG_FORCE net_assignment
	| SVLOG_RELEASE variable_lvalue
	| SVLOG_RELEASE net_lvalue
	;

variable_assignment
	: variable_lvalue '=' expression

/*****************************************************************
 * End of 'Procedural blocks and assignments' Grammer Rules      *
 * Based off section: (A.6.2 Procedural blocks and assignments). *
 *****************************************************************/


/******************************************
 * Start of 'Statements' Grammer Rules    *
 * Based off section: (A.6.4 Statements). *
 ******************************************/

statement_or_null
	: statement
	| attribute_instance_recurse ';'
	;

statement
	: attribute_instance_recurse statement_item
	| identifier ':' attribute_instance_recurse statement_item
	;

statement_item
	: blocking_assignment ';'
	| nonblocking_assignment ';'
	| procedural_continuous_assignment ';'
	| case_statement
	| conditional_statement
	| subroutine_call_statement
	| disable_statement
	| event_trigger
	| loop_statement
	| jump_statement
	| par_block
	| procedural_timing_control_statement
	| seq_block
	| wait_statement
	| procedural_assertion_statement
	| clocking_drive ';'
	| randsequence_statement
	| randcase_statement
	| expect_property_statement
	;

function_statement
	: statement
	;

function_statement_or_null
	: function_statement
	| attribute_instance_recurse ';'
	;

/******************************************
 * End of 'Statements' Grammer Rules      *
 * Based off section: (A.6.4 Statements). *
 ******************************************/


/*********************************************************
 * Start of 'Timing control statements' Grammer Rules    *
 * Based off section: (A.6.5 Timing control statements). *
 *********************************************************/

delay_or_event_control
	: delay_control
	| event_control
	| SVLOG_REPEAT '(' expression ')' event_control
	;

delay_control
	: '#' delay_value
	| '#' '(' mintypmax_expression ')'
	;

event_control
	: clocking_event
	| '@' '*'
	| '@' '(' '*' ')'
	;

clocking_event
	: '@' ps_identifier
	| '@' hierarchical_identifier
	| '@' '(' event_expression ')'
	;

event_expression
	: expression
	| edge_identifier expression
	| expression SVLOG_IF_AND_ONLY_IF expression
	| edge_identifier expression SVLOG_IF_AND_ONLY_IF expression
	| sequence_instance
	| sequence_instance SVLOG_IF_AND_ONLY_IF expression
	| event_expression SVLOG_OR event_expression
	| event_expression ',' event_expression
	| '(' event_expression ')'
	;

/*********************************************************
 * End of 'Timing control statements' Grammer Rules      *
 * Based off section: (A.6.5 Timing control statements). *
 *********************************************************/


/******************************************************
 * Start of 'Conditional statements' Grammer Rules    *
 * Based off section: (A.6.6 Conditional statements). *
 ******************************************************/

conditional_statement
	: SVLOG_IF '(' cond_predicate ')' statement_or_null
	| unique_priority SVLOG_IF '(' cond_predicate ')' cs_else_if_resurse cs_else
	;

cs_else
	: %empty
	| SVLOG_ELSE statement_or_null
	;

cs_else_if_resurse
	: %empty
	| SVLOG_ELSE SVLOG_IF '(' cond_predicate ')' statement_or_null
	| conditional_statement_else_if_resurse SVLOG_ELSE SVLOG_IF '(' cond_predicate ')' statement_or_null
	;

unique_priority
	: SVLOG_UNIQUE
	| SVLOG_UNIQUE0
	| SVLOG_PRIORITY
	;

cond_predicate
	: expression_or_cond_pattern expression_or_cond_pattern_recurse
	;

expression_or_cond_pattern_recurse
	: %empty
	| SVLOG_IF_AND_ONLY_IF expression_or_cond_pattern
	| expression_or_cond_pattern_recurse SVLOG_IF_AND_ONLY_IF expression_or_cond_pattern
	;

expression_or_cond_pattern
	: expression
	| cond_pattern
	;

cond_pattern
	: expression SVLOG_MATCHES pattern
	;

event_trigger
	: IMPLICATION_OPERATOR hierarchical_identifier nonrange_select ';'
	| NONBLOCK_IMPLICATION_OPERATOR hierarchical_identifier nonrange_select ';'
	| NONBLOCK_IMPLICATION_OPERATOR delay_or_event_control hierarchical_identifier nonrange_select ';'
	;

disable_statement
	: SVLOG_DISABLE  hierarchical_identifier ';'
	| SVLOG_DISABLE SVLOG_FORK ';'
	;

/******************************************************
 * End of 'Conditional statements' Grammer Rules      *
 * Based off section: (A.6.6 Conditional statements). *
 ******************************************************/


/***********************************************
 * Start of 'Case statements' Grammer Rules    *
 * Based off section: (A.6.7 Case statements). *
 ***********************************************/

case_statement
	: case_keyword '(' expression ')' case_item_recurse SVLOG_ENDCASE
	| unique_priority case_keyword '(' expression ')' case_item_recurse SVLOG_ENDCASE
	| case_keyword '(' expression ')' SVLOG_MATCHES case_pattern_item_recurse SVLOG_ENDCASE
	| unique_priority case_keyword '(' expression ')' SVLOG_MATCHES case_pattern_item_recurse SVLOG_ENDCASE
	| SVLOG_CASE '(' expression ')' SVLOG_INSIDE case_inside_item_recurse SVLOG_ENDCASE
	| unique_priority SVLOG_CASE '(' expression ')' SVLOG_INSIDE case_inside_item_recurse SVLOG_ENDCASE
	;

case_keyword
	: SVLOG_CASE
	| SVLOG_CASEZ
	| SVLOG_CASEX
	;

case_item
	: case_item_expression_recurse ':' statement_or_null
	| SVLOG_DEFAULT statement_or_null
	| SVLOG_DEFAULT ':' statement_or_null
	;

case_item_recurse
	: case_item
	| case_item_recurse case_item
	;

case_item_expression_recurse
	: expression
	| case_item_expression_recurse ',' expression
	;

case_pattern_item
	: pattern ':' statement_or_null
	| pattern SVLOG_IF_AND_ONLY_IF expression ':' statement_or_null
	| SVLOG_DEFAULT statement_or_null
	| SVLOG_DEFAULT ':' statement_or_null
	;

case_pattern_item_recurse
	: case_pattern_item
	| case_pattern_item_recurse case_pattern_item
	;

case_inside_item
	: range_list ':' statement_or_null
	| SVLOG_DEFAULT statement_or_null
	| SVLOG_DEFAULT ':' statement_or_null
	;

case_inside_item_recurse
	: case_inside_item
	| case_inside_item_recurse case_inside_item
	;

randcase_statement
	: SVLOG_RANDCASE randcase_item_recurse SVLOG_ENDCASE
	;

randcase_item
	: expression ':' statement_or_null
	;

randcase_item_recurse
	: randcase_item
	| randcase_item_recurse randcase_item
	;

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


/**************************************************
 * Start of 'Looping statements' Grammer Rules    *
 * Based off section: (A.6.8 Looping statements). *
 **************************************************/

loop_statement
	: SVLOG_FOREVER statement_or_null
	| SVLOG_REPEAT '(' expression ')' statement_or_null
	| SVLOG_WHILE '(' expression ')' statement_or_null
	| SVLOG_FOR '(' for_initialization ';' expression ';' for_step ')' statement_or_null
	| SVLOG_DO statement_or_null SVLOG_WHILE '(' expression ')' ';'
	| SVLOG_FOREACH '(' ps_or_hierarchical_array_identifier '[' loop_variables ']' ')' statement
	;

for_initialization
	: %empty
	| list_of_variable_assignments
	| for_variable_declaration_recurse
	;

for_variable_declaration_recurse
	: for_variable_declaration
	| for_variable_declaration_recurse ',' for_variable_declaration
	;

for_variable_declaration
	: data_type identifier '=' expression variable_identifier_expression_recurse
	| SVLOG_VAR data_type identifier '=' expression variable_identifier_expression_recurse
	;

variable_identifier_expression_recurse
	: %empty
	| ',' identifier '=' expression
	| variable_identifier_expression_recurse ',' identifier '=' expression
	;

for_step
	: %empty
	| for_step_assignment
	| for_step ',' for_step_assignment
	;

for_step_assignment
	: operator_assignment
	| inc_or_dec_expression
	| function_subroutine_call
	;

loop_variables
	: identifier
	| loop_variables ',' identifier
	;

/**************************************************
 * End of 'Looping statements' Grammer Rules      *
 * Based off section: (A.6.8 Looping statements). *
 **************************************************/


/******************************************
 * End of 'Patterns' Grammer Rules        *
 * Based off section: (A.6.7.1 Patterns). *
 ******************************************/

assignment_pattern_net_lvalue
	: APOSTROPHE '{' net_lvalue_recurse '}'
	;

assignment_pattern_variable_lvalue
	:  APOSTROPHE '{' variable_lvalue_recurse '}'
	;

/******************************************
 * End of 'Patterns' Grammer Rules        *
 * Based off section: (A.6.7.1 Patterns). *
 ******************************************/


/**********************************************************
 * Start of 'Subroutine call statements' Grammer Rules    *
 * Based off section: (A.6.9 Subroutine call statements). *
 **********************************************************/

subroutine_call_statement
	: subroutine_call ';'
	| SVLOG_VOID APOSTROPHE '(' function_subroutine_call ')' ';'
	;

/**********************************************************
 * End of 'Subroutine call statements' Grammer Rules      *
 * Based off section: (A.6.9 Subroutine call statements). *
 **********************************************************/


/*********************************************************
 * Start of 'Specify path declarations' Grammer Rules    *
 * Based off section: (A.7.2 Specify path declarations). *
 *********************************************************/

data_source_expression
	: expression
	;

edge_identifier
	: SVLOG_POSEDGE
	| SVLOG_NEGEDGE
	| SVLOG_EDGE
	;

polarity_operator
	: '+'
	| '-'
	;

/*********************************************************
 * End of 'Specify path declarations' Grammer Rules      *
 * Based off section: (A.7.2 Specify path declarations). *
 *********************************************************/


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
	: ps_or_hierarchical_tf_identifier attribute_instance_recurse
	| ps_or_hierarchical_tf_identifier attribute_instance_recurse '(' list_of_arguments ')'
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
	| identifier attribute_instance_recurse '(' list_of_arguments ')'
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
	| array_method_name attribute_instance_recurse
	| array_method_name attribute_instance_recurse '(' list_of_arguments ')'
	| array_method_name attribute_instance_recurse SVLOG_WITH '(' expression ')'
	| array_method_name attribute_instance_recurse '(' list_of_arguments ')' SVLOG_WITH '(' expression ')'
	;

randomize_call
	: SVLOG_RANDOMIZE attribute_instance_recurse
	| SVLOG_RANDOMIZE attribute_instance_recurse '(' variable_identifier_list ')'
	| SVLOG_RANDOMIZE attribute_instance_recurse '(' SVLOG_NULL ')'
	| SVLOG_RANDOMIZE attribute_instance_recurse SVLOG_WITH constraint_block
	| SVLOG_RANDOMIZE attribute_instance_recurse SVLOG_WITH '(' identifier_list ')' constraint_block
	| SVLOG_RANDOMIZE attribute_instance_recurse '(' variable_identifier_list ')' SVLOG_WITH constraint_block
	| SVLOG_RANDOMIZE attribute_instance_recurse '(' variable_identifier_list ')' SVLOG_WITH '(' identifier_list ')' constraint_block
	| SVLOG_RANDOMIZE attribute_instance_recurse '(' SVLOG_NULL ')' SVLOG_WITH constraint_block
	| SVLOG_RANDOMIZE attribute_instance_recurse '(' SVLOG_NULL ')' SVLOG_WITH '(' identifier_list ')' constraint_block
	;

variable_identifier_list
	: identifier
	| variable_identifier_list ',' identifier
	;

identifier_list
	: identifier
	| identifier_list ',' identifier
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
	| inc_or_dec_operator attribute_instance_recurse variable_lvalue
	| variable_lvalue inc_or_dec_operator
	| variable_lvalue attribute_instance_recurse inc_or_dec_operator
	;

conditional_expression
	: cond_predicate '?' attribute_instance_recurse expression ':' expression
	;

constant_expression
	: constant_primary
	| unary_operator constant_primary
	| unary_operator attribute_instance_recurse constant_primary
	| constant_expression binary_operator constant_expression
	| constant_expression binary_operator attribute_instance_recurse constant_expression
	| constant_expression '?' constant_expression ':' constant_expression
	| constant_expression '?' attribute_instance_recurse constant_expression ':' constant_expression
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
	| unary_operator attribute_instance_recurse primary
	| inc_or_dec_expression
	| '(' operator_assignment ')'
	| expression binary_operator expression
	| expression binary_operator attribute_instance_recurse expression
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

mident_bit_select_recurse
	: %empty
	| '.' identifier bit_select
	| mident_bit_select_recurse '.' identifier bit_select
	;

nonrange_select
	: bit_select
	| mident_bit_select_recurse '.' identifier bit_select
	;

constant_bit_select
	: '[' constant_expression ']'
	| constant_bit_select '[' constant_expression ']'
	;

constant_select_recurse
	: '.' identifier constant_bit_select
	| constant_select_recurse '.' identifier constant_bit_select
	;

constant_select
	: constant_bit_select
	| constant_bit_select '[' constant_part_select_range ']'
	| constant_select_recurse
	| constant_select_recurse '[' constant_part_select_range ']'
	;

/*****************************************
 * End of 'Primaries' Grammer Rules      *
 * Based off section: (A.8.4 Primaries). *
 *****************************************/


/***********************************************************
 * Start of 'Expression left-side values' Grammer Rules    *
 * Based off section: (A.8.5 Expression left-side values). *
 ***********************************************************/

net_lvalue
	: ps_or_hierarchical_net_identifier constant_select
	| '{' net_lvalue_recurse '}'
	| assignment_pattern_net_lvalue
	| assignment_pattern_expression_type assignment_pattern_net_lvalue
	;

net_lvalue_recurse
	: net_lvalue
	| net_lvalue_recurse ',' net_lvalue
	;

variable_lvalue
	: hierarchical_identifier select
	| implicit_class_handle '.' hierarchical_identifier select
	| package_scope hierarchical_identifier select
	| streaming_concatenation
	| assignment_pattern_variable_lvalue
	| assignment_pattern_expression_type assignment_pattern_variable_lvalue
	| variable_lvalue ',' variable_lvalue
	;

variable_lvalue_recurse
	: variable_lvalue
	| variable_lvalue_recurse ',' variable_lvalue
	;

nonrange_variable_lvalue
	: hierarchical_identifier nonrange_select
	| implicit_class_handle '.' hierarchical_identifier nonrange_select
	| package_scope hierarchical_identifier nonrange_select
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
	| LOGICAL_AND
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

attribute_instance_recurse
	: %empty
	| attribute_instance
	| attribute_instance_recurse attribute_instance
	;

attribute_instance
	:
	| '(' '*' attribute_specs '*' ')'
	;

attribute_specs
	: attr_spec
	| attribute_instance_recurse ',' attr_spec
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

ps_covergroup_identifier
	: identifier
	| package_scope identifier
	;

ps_checker_identifier
	: identifier
	| package_scope identifier
	;

ps_identifier
	: identifier
	| package_scope identifier
	;

ps_or_hierarchical_array_identifier
	: identifier
	| implicit_class_handle '.' identifier
	| class_scope identifier
	| package_scope identifier
	;

ps_or_hierarchical_net_identifier
	: identifier
	| package_scope identifier
	| hierarchical_identifier
	;

ps_or_hierarchical_sequence_identifier
	: identifier
	| package_scope identifier
	| hierarchical_identifier
	;

ps_or_hierarchical_tf_identifier
	: identifier
	| package_scope identifier
	| hierarchical_identifier
	;

ps_param_ident_recurse
	: generate_block_identifier '.'
	| generate_block_identifier  '[' constant_expression ']' '.'
	| ps_param_ident_recurse generate_block_identifier '.'
	| ps_param_ident_recurse generate_block_identifier  '[' constant_expression ']' '.'
	;

ps_parameter_identifier
	: identifier
	| package_scope identifier
	| class_scope identifier
	| ps_param_ident_recurse identifier
	;

system_tf_identifier
	: SVLOG_STFIDENT { fprintf(stdout, "%s\n", $1); }
	;

/*******************************************
 * End of 'Identifiers' grammer rules.     *
 * Based off section: (A.9.3 Identifiers). *
 *******************************************/

%%
