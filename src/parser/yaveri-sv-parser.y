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

%token <itoken> SVLOG_SYNC_ACCEPT_ON
%token <itoken> SVLOG_SYNC_REJECT_ON
%token <itoken> SVLOG_ENDINTERFACE
%token <itoken> SVLOG_ENDPRIMITIVE
%token <itoken> SVLOG_INTERCONNECT
%token <itoken> SVLOG_RANDSEQUENCE
%token <itoken> SVLOG_S_EVENTUALLY
%token <itoken> SVLOG_S_UNTIL_WITH
%token <itoken> SVLOG_ENDCLOCKING
%token <itoken> SVLOG_ENDFUNCTION
%token <itoken> SVLOG_ENDPROPERTY
%token <itoken> SVLOG_ENDSEQUENCE
%token <itoken> SVLOG_FIRST_MATCH
%token <itoken> SVLOG_ENDCHECKER
%token <itoken> SVLOG_ENDPACKAGE
%token <itoken> SVLOG_ENDPROGRAM
%token <itoken> SVLOG_EVENTUALLY
%token <itoken> SVLOG_LOCALPARAM
%token <itoken> SVLOG_PATHPULSE
%token <itoken> SVLOG_S_NEXTTIME
%token <itoken> SVLOG_THROUGHOUT
%token <itoken> SVLOG_UNTIL_WITH
%token <itoken> SVLOG_WAIT_ORDER
%token <itoken> SVLOG_ACCEPT_ON
%token <itoken> SVLOG_AUTOMATIC
%token <itoken> SVLOG_ENDCONFIG
%token <itoken> SVLOG_ENDMODULE
%token <itoken> SVLOG_INTERFACE
%token <itoken> SVLOG_INTERSECT
%token <itoken> SVLOG_JOIN_NONE
%token <itoken> SVLOG_PARAMETER
%token <itoken> SVLOG_PRIMITIVE
%token <itoken> SVLOG_RANDOMIZE
%token <itoken> SVLOG_REJECT_ON
%token <itoken> SVLOG_SHORTREAL
%token <itoken> SVLOG_SPECPARAM
%token <itoken> SVLOG_CLOCKING
%token <itoken> SVLOG_CONTINUE
%token <itoken> SVLOG_DEASSIGN
%token <itoken> SVLOG_EXTENDES
%token <itoken> SVLOG_FUNCTION
%token <itoken> SVLOG_JOIN_ANY
%token <itoken> SVLOG_NEXTTIME
%token <itoken> SVLOG_PRIORITY
%token <itoken> SVLOG_PROPERTY
%token <itoken> SVLOG_RANDCASE
%token <itoken> SVLOG_REALTIME
%token <itoken> SVLOG_RESTRICT
%token <itoken> SVLOG_SCALARED
%token <itoken> SVLOG_SEQUENCE
%token <itoken> SVLOG_SHORTINT
%token <itoken> SVLOG_S_ALWAYS
%token <itoken> SVLOG_UNSIGNED
%token <itoken> SVLOG_VECTORED
%token <itoken> SVLOG_CHANDLE
%token <itoken> SVLOG_CHECKER
%token <itoken> SVLOG_CONTEXT
%token <itoken> SVLOG_DEFAULT
%token <itoken> SVLOG_DISABLE
%token <itoken> SVLOG_ENDCASE
%token <itoken> SVLOG_ENDTASK
%token <itoken> SVLOG_FOREACH
%token <itoken> SVLOG_FOREVER
%token <itoken> SVLOG_IMPLIES
%token <itoken> SVLOG_INITIAL
%token <itoken> SVLOG_INTEGER
%token <itoken> SVLOG_LONGINT
%token <itoken> SVLOG_MATCHES
%token <itoken> SVLOG_NEGEDGE
%token <itoken> SVLOG_NETTYPE
%token <itoken> SVLOG_PACKAGE
%token <itoken> SVLOG_POSEDGE
%token <itoken> SVLOG_PROGRAM
%token <itoken> SVLOG_RELEASE
%token <itoken> SVLOG_TYPEDEF
%token <itoken> SVLOG_STRONG0
%token <itoken> SVLOG_STRONG1
%token <itoken> SVLOG_SUPPLY0
%token <itoken> SVLOG_SUPPLY1
%token <itoken> SVLOG_S_UNTIL
%token <itoken> SVLOG_UNIQUE0
%token <itoken> SVLOG_UNTYPED
%token <itoken> SVLOG_VIRTUAL
%token <itoken> SVLOG_ALWAYS
%token <itoken> SVLOG_ASSERT
%token <itoken> SVLOG_ASSIGN
%token <itoken> SVLOG_ASSUME
%token <itoken> SVLOG_BEFORE
%token <itoken> SVLOG_CONFIG
%token <itoken> SVLOG_EXPECT
%token <itoken> SVLOG_EXPORT
%token <itoken> SVLOG_GENVAR
%token <itoken> SVLOG_GLOBAL
%token <itoken> SVLOG_HIGHZ0
%token <itoken> SVLOG_HIGHZ1
%token <itoken> SVLOG_IMPORT
%token <itoken> SVLOG_INSIDE
%token <itoken> SVLOG_MEDIUM
%token <itoken> SVLOG_MODULE
%token <itoken> SVLOG_OUTPUT
%token <itoken> SVLOG_PACKED
%token <itoken> SVLOG_REPEAT
%token <itoken> SVLOG_RETURN
%token <itoken> SVLOG_SIGNED
%token <itoken> SVLOG_STATIC
%token <itoken> SVLOG_STRING
%token <itoken> SVLOG_STRONG
%token <itoken> SVLOG_STRUCT
%token <itoken> SVLOG_TAGGED
%token <itoken> SVLOG_TRIAND
%token <itoken> SVLOG_TRIREG
%token <itoken> SVLOG_UNIQUE
%token <itoken> SVLOG_UNWIRE
%token <itoken> SVLOG_WITHIN
%token <itoken> SVLOG_BEGIN
%token <itoken> SVLOG_BREAK
%token <itoken> SVLOG_CASEX
%token <itoken> SVLOG_CASEZ
%token <itoken> SVLOG_CLASS
%token <itoken> SVLOG_CONST
%token <itoken> SVLOG_COVER
%token <itoken> SVLOG_DPI_C
%token <itoken> SVLOG_EVENT
%token <itoken> SVLOG_FORCE
%token <itoken> SVLOG_FINAL
%token <itoken> SVLOG_INOUT
%token <itoken> SVLOG_INPUT
%token <itoken> SVLOG_LARGE
%token <itoken> SVLOG_LOCAL
%token <itoken> SVLOG_LOGIC
%token <itoken> SVLOG_PULL0
%token <itoken> SVLOG_PULL1
%token <itoken> SVLOG_RANDC
%token <itoken> SVLOG_SOLVE
%token <itoken> SVLOG_SMALL
%token <itoken> SVLOG_SUPER
%token <itoken> SVLOG_TRIOR
%token <itoken> SVLOG_UNION
%token <itoken> SVLOG_UNTIL
%token <itoken> SVLOG_WEAK0
%token <itoken> SVLOG_WEAK1
%token <itoken> SVLOG_WHILE
%token <itoken> SVLOG_1STEP
%token <itoken> SVLOG_ROOT
%token <itoken> SVLOG_UNIT
%token <itoken> SVLOG_BYTE
%token <itoken> SVLOG_CASE
%token <itoken> SVLOG_DIST
%token <itoken> SVLOG_EDGE
%token <itoken> SVLOG_ELSE
%token <itoken> SVLOG_ENUM
%token <itoken> SVLOG_FORK
%token <itoken> SVLOG_JOIN
%token <itoken> SVLOG_NULL
%token <itoken> SVLOG_PURE
%token <itoken> SVLOG_RAND
%token <itoken> SVLOG_REAL
%token <itoken> SVLOG_SOFT
%token <itoken> SVLOG_STEP
%token <itoken> SVLOG_TASK
%token <itoken> SVLOG_THIS
%token <itoken> SVLOG_TIME
%token <itoken> SVLOG_TRI0
%token <itoken> SVLOG_TRI1
%token <itoken> SVLOG_TYPE
%token <itoken> SVLOG_VOID
%token <itoken> SVLOG_WAIT
%token <itoken> SVLOG_WAND
%token <itoken> SVLOG_WEAK
%token <itoken> SVLOG_WIRE
%token <itoken> SVLOG_WITH
%token <itoken> SVLOG_AND
%token <itoken> SVLOG_BIT
%token <itoken> SVLOG_DPI
%token <itoken> SVLOG_END
%token <itoken> SVLOG_FOR
%token <itoken> SVLOG_IF_AND_ONLY_IF
%token <itoken> SVLOG_INT
%token <itoken> SVLOG_LET
%token <itoken> SVLOG_NEW
%token <itoken> SVLOG_NOT
%token <itoken> SVLOG_REF
%token <itoken> SVLOG_REG
%token <itoken> SVLOG_STD
%token <itoken> SVLOG_TRI
%token <itoken> SVLOG_VAR
%token <itoken> SVLOG_WOR
%token <itoken> SVLOG_XOR
%token <itoken> SVLOG_DO
%token <itoken> SVLOG_fEMTOSEC
%token <itoken> SVLOG_IF
%token <itoken> SVLOG_MILLISEC
%token <itoken> SVLOG_NANOSEC
%token <itoken> SVLOG_OR
%token <itoken> SVLOG_PICOSEC
%token <itoken> SVLOG_MICROSEC
%token <itoken> SVLOG_SEC



%token <itoken> EXPORT_DECLARATION
%token <itoken> CASE_EQUAL
%token <itoken> CASE_NOT_EQUAL
%token <itoken> LOGICAL_LEFT_SHIFT
%token <itoken> LOGICAL_RIGHT_SHIFT
%token <itoken> GOTO_REPETITION_OPERATOR
%token <itoken> OVERLAPPED_OPERATOR
%token <itoken> OVERLAPPED_OPERATOR_FOLLOWED_BY
%token <itoken> NONOVERLAPPED_OPERATOR
%token <itoken> NONOVERLAPPED_OPERATOR_FOLLOWED_BY
%token <itoken> NONBLOCK_IMPLICATION_OPERATOR
%token <itoken> EQUIVALANCE_OPERATOR
%token <itoken> WILDCARD_EQUAL
%token <itoken> WILDCARD_NOT_EQUAL
%token <itoken> QUEUE_INITIALIZE
%token <itoken> BOUNDED_QUEUE_INITIALIZE
%token <itoken> REPEAT_ZERO_OR_MORE /* [*] is an abbreviation for [*0:$] */
%token <itoken> REPEAT_ONE_OR_MORE  /* [+] is an abbreviation for [*1:$] */
%token <itoken> CONSECUTIVE_REPEAT_OPERATOR
%token <itoken> NON_CONSECUTIVE_REPEAT_OPERATOR
%token <itoken> BIT_WISE_NAND
%token <itoken> BIT_WISE_NOR
%token <itoken> POUND_ZERO
%token <itoken> BIT_WISE_XNOR
%token <itoken> LOGICAL_EQUAL
%token <itoken> LOGICAL_INEQUAL
%token <itoken> LOGICAL_AND
%token <itoken> LOGICAL_OR
%token <itoken> ADDITION_OPERATOR
%token <itoken> REDUCTION_OPERATOR
%token <itoken> CLASS_SCOPE_OPERATOR
%token <itoken> DISTRIBUTED_WEIGHT_OPERATOR
%token <itoken> EQUAL_WEIGHT_OPERATOR
%token <itoken> POWER_OF_OPERATOR
%token <itoken> INCREMENT_OPERATOR
%token <itoken> DECREMENT_OPERATOR
%token <itoken> IMPLICATION_OPERATOR
%token <itoken> LEFT_SHIFT
%token <itoken> RIGHT_SHIFT
%token <itoken> GT_OR_EQ
%token <itoken> LT_OR_EQ
%token <itoken> LOGICAL_NOT
%token <itoken> BIT_WISE_XOR
%token <itoken> BIT_WISE_OR
%token <itoken> BIT_WISE_NOT
%token <itoken> BIT_WISE_AND
%token <itoken> APOSTROPHE


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
/* c_identifier */
%token <stoken> SVLOG_CIDENT
/* Quoted Strings */
%token <stoken> SVLOG_QUOTED_STRING
/* String Escape Sequence */
%token <stoken> SVLOG_ESCAPE_SEQ
/* Triple Quoted Strings */
%token <stoken> SVLOG_TRIPLE_QUOTED_STRING
/* numbers between 0-9 */
%token <itoken> SVLOG_DIGIT


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

expression_or_dist_seq_list
	: expression_or_dist
	| expression_or_dist_seq_list ',' expression_or_dist
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


/***************************************************************
 * Start of 'Module parameter declarations' Grammer Rules      *
 * Based off section: (A.2.1.1 Module parameter declarations). *
 ***************************************************************/

local_parameter_declaration
	: SVLOG_LOCALPARAM data_type_or_implicit list_of_param_assignments
	| SVLOG_PARAMETER type_parameter_declaration
	;

parameter_declaration
	: SVLOG_PARAMETER data_type_or_implicit list_of_param_assignments
	| SVLOG_PARAMETER type_parameter_declaration
	;

type_parameter_declaration
	: SVLOG_TYPE list_of_type_assignments
	| SVLOG_TYPE forward_type list_of_type_assignments
	;

specparam_declaration
	: SVLOG_SPECPARAM list_of_specparam_assignments ';'
	| SVLOG_SPECPARAM packed_dimension list_of_specparam_assignments ';'
	;

/***************************************************************
 * End of 'Module parameter declarations' Grammer Rules        *
 * Based off section: (A.2.1.1 Module parameter declarations). *
 ***************************************************************/


/***************************************************
 * Start of 'Type declarations' Grammer Rules      *
 * Based off section: (A.2.1.3 Type declarations). *
 ***************************************************/

data_declaration_options
	: SVLOG_CONST
	| SVLOG_VAR
	| lifetime
	| SVLOG_CONST SVLOG_VAR
	| SVLOG_CONST lifetime
	| SVLOG_CONST SVLOG_VAR lifetime
	| SVLOG_VAR lifetime
	;

data_declaration
	: data_declaration_options data_type_or_implicit list_of_variable_decl_assignments ';'
	| type_declaration
	| package_import_declaration
	| nettype_declaration
	;

data_declaration_recurse
	: data_declaration
	| data_declaration_recurse data_declaration
	;

data_declaration_recurse_or_null
	: %empty
	| data_declaration_recurse
	;

package_import_declaration
	: SVLOG_IMPORT package_import_item_seq_list ';'
	;

package_export_declaration
	: SVLOG_EXPORT EXPORT_DECLARATION ';'
	| SVLOG_EXPORT package_import_item_seq_list ';'
	;

package_import_item
	: identifier CLASS_SCOPE_OPERATOR identifier
	| identifier CLASS_SCOPE_OPERATOR '*'
	;

package_import_item_seq_list
	: package_import_item
	| package_import_item_seq_list ',' package_import_item
	;

genvar_declaration
	: SVLOG_GENVAR list_of_genvar_identifiers ';'
	;

drive_or_charge_strength
	: %empty
	| drive_strength
	| charge_strength
	;

vectored_or_scalared
	: %empty
	| SVLOG_VECTORED
	| SVLOG_SCALARED
	;

delay3_or_null
	: %empty
	| delay3
	;

delay_control_or_null
	: %empty
	| delay_control
	;

delay_value_or_null
	: %empty
	| '#' delay_value
	;

net_ident_ud_seq_list
	: identifier unpacked_dimension_recurse
	| net_ident_ud_seq_list ',' identifier unpacked_dimension_recurse
	;

net_declaration
	: net_type drive_or_charge_strength vectored_or_scalared data_type_or_implicit delay3_or_null list_of_net_decl_assignments ';'
	| identifier delay_control_or_null list_of_net_decl_assignments ';'
	| SVLOG_INTERCONNECT implicit_data_type delay_value_or_null net_ident_ud_seq_list ';'
	;

type_declaration
	: SVLOG_TYPEDEF data_type_or_incomplete_class_scoped_type identifier variable_dimension_recurse ';'
	| SVLOG_TYPEDEF identifier constant_bit_select '.' identifier identifier ';'
	| SVLOG_TYPEDEF forward_type_or_null identifier ';'
	;

forward_type
	: SVLOG_ENUM
	| SVLOG_STRUCT
	| SVLOG_UNION
	| SVLOG_CLASS
	| SVLOG_INTERFACE SVLOG_CLASS
	;

forward_type_or_null
	: %empty
	| forward_type
	;

nettype_declaration_with_or_null
	: %empty
	| SVLOG_WITH identifier
	| SVLOG_WITH package_scope identifier
	| SVLOG_WITH class_scope identifier
	;

nettype_declaration
	: SVLOG_NETTYPE data_type identifier nettype_declaration_with_or_null ';'
	| SVLOG_NETTYPE identifier identifier ';'
	| SVLOG_NETTYPE package_scope identifier identifier ';'
	| SVLOG_NETTYPE class_scope identifier identifier ';'
	;

lifetime
	: SVLOG_STATIC
	| SVLOG_AUTOMATIC
	;

lifetime_or_null
	: %empty
	| lifetime
	;

/***************************************************
 * End of 'Type declarations' Grammer Rules        *
 * Based off section: (A.2.1.3 Type declarations). *
 ***************************************************/


/********************************************************
 * Start of 'Net and variable types' Grammer Rules      *
 * Based off section: (A.2.2.1 Net and variable types). *
 ********************************************************/

casting_type
	: simple_type
	| constant_primary
	| signing
	| SVLOG_STRING
	| SVLOG_CONST
	;

packed_signed_or_null
	: %empty
	| SVLOG_PACKED
	| SVLOG_PACKED signing
	;

data_type
	: integer_vector_type packed_dimension_recurse_or_null
	| integer_vector_type signing packed_dimension_recurse_or_null
	| integer_atom_type
	| integer_atom_type signing
	| non_integer_type
	| struct_union packed_signed_or_null '{' struct_union_member_recurse '}' packed_dimension_recurse_or_null
	| SVLOG_ENUM enum_base_type_or_null '{' enum_name_declaration_seq_list '}' packed_dimension_recurse_or_null
	| SVLOG_STRING
	| SVLOG_CHANDLE
	| SVLOG_VIRTUAL interface_or_null identifier parameter_value_assignment_or_null period_ident_or_null
	| class_or_package_scope_or_null identifier packed_dimension_recurse_or_null
	| class_type
	| SVLOG_EVENT
	| ps_covergroup_identifier
	| type_reference
	;

data_type_or_implicit
	: data_type
	| implicit_data_type
	;

implicit_data_type
	: packed_dimension_recurse_or_null
	| signing packed_dimension_recurse_or_null
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

enum_base_type_or_null
	: %empty
	| enum_base_type
	;

enum_name_declaration
	: identifier
	| identifier '[' integral_number ']'
	| identifier '[' integral_number ':' integral_number ']'
	| identifier '[' integral_number ':' integral_number ']' '=' constant_expression
	| identifier '=' constant_expression
	;

enum_name_declaration_seq_list
	: %empty
	| enum_name_declaration
	| enum_name_declaration_seq_list ',' enum_name_declaration
	;

class_scope
	: class_type CLASS_SCOPE_OPERATOR
	;

class_type_ident_seq_list
	: CLASS_SCOPE_OPERATOR identifier parameter_value_assignment_or_null
	| class_type_ident_seq_list CLASS_SCOPE_OPERATOR identifier parameter_value_assignment_or_null
	;

class_type_ident_seq_list_or_null
	: %empty
	| class_type_ident_seq_list
	;

class_type
	: ps_class_identifier parameter_value_assignment_or_null class_type_ident_seq_list_or_null
	;

interface_class_type
	: ps_class_identifier parameter_value_assignment_or_null
	;

integer_type
	: integer_vector_type
	| integer_atom_type
	;

integer_atom_type
	: SVLOG_BYTE
	| SVLOG_SHORTINT
	| SVLOG_INT
	| SVLOG_LONGINT
	| SVLOG_INTEGER
	| SVLOG_TIME
	;

integer_vector_type
	: SVLOG_BIT
	| SVLOG_LOGIC
	| SVLOG_REG
	;

non_integer_type
	: SVLOG_SHORTREAL
	| SVLOG_REAL
	| SVLOG_REALTIME
	;

net_type
	: SVLOG_SUPPLY0
	| SVLOG_SUPPLY1
	| SVLOG_TRI
	| SVLOG_TRIAND
	| SVLOG_TRIOR
	| SVLOG_TRIREG
	| SVLOG_TRI0
	| SVLOG_TRI1
	| SVLOG_UNWIRE
	| SVLOG_WIRE
	| SVLOG_WAND
	| SVLOG_WOR
	;

net_port_type
	: data_type_or_implicit
	| net_type data_type_or_implicit
	| identifier
	| SVLOG_INTERCONNECT implicit_data_type
	;

variable_port_type
	: var_data_type
	;

var_data_type
	: data_type
	| SVLOG_VAR data_type_or_implicit
	;

signing
	:
	| SVLOG_SIGNED
	| SVLOG_UNSIGNED
	;

simple_type
	: integer_type
	| non_integer_type
	| ps_type_identifier
	| ps_parameter_identifier
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
	: attribute_instance_recurse_or_null data_type_or_void list_of_variable_decl_assignments ';'
	| attribute_instance_recurse_or_null random_qualifier data_type_or_void list_of_variable_decl_assignments ';'
	;

data_type_or_void
	: data_type
	| SVLOG_VOID
	;

data_type_or_void_or_null
	: %empty
	| data_type_or_void
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


/*******************************************
 * Start of 'Strengths' Grammer Rules      *
 * Based off section: (A.2.2.2 Strengths). *
 *******************************************/

drive_strength
	: '(' strength0 ',' strength1 ')'
	| '(' strength1 ',' strength0 ')'
	| '(' strength0 ',' SVLOG_HIGHZ1 ')'
	| '(' strength1 ',' SVLOG_HIGHZ0 ')'
	| '(' SVLOG_HIGHZ0 ',' strength1 ')'
	| '(' SVLOG_HIGHZ1 ',' strength0 ')'
	;

strength0
	: SVLOG_SUPPLY0
	| SVLOG_STRONG0
	| SVLOG_PULL0
	| SVLOG_WEAK0
	;

strength1
	: SVLOG_SUPPLY1
	| SVLOG_STRONG1
	| SVLOG_PULL1
	| SVLOG_WEAK1
	;

charge_strength
	: '(' SVLOG_SMALL ')'
	| '(' SVLOG_MEDIUM ')'
	| '(' SVLOG_LARGE ')'
	;

/*******************************************
 * End of 'Strengths' Grammer Rules        *
 * Based off section: (A.2.2.2 Strengths). *
 *******************************************/


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

list_of_genvar_identifiers
	: identifier
	| list_of_genvar_identifiers ',' identifier
	;

list_of_net_decl_assignments
	: net_decl_assignment
	| list_of_net_decl_assignments ',' net_decl_assignment
	;

list_of_param_assignments
	: param_assignment
	| list_of_param_assignments ',' param_assignment
	;

list_of_specparam_assignments
	: specparam_assignment
	| list_of_specparam_assignments ',' specparam_assignment
	;

list_of_type_assignments
	: type_assignment
	| list_of_type_assignments ',' type_assignment
	;

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

net_decl_assignment
	: identifier unpacked_dimension_recurse_or_null
	| identifier unpacked_dimension_recurse_or_null '=' expression
	;

param_assignment
	: identifier variable_dimension_recurse_or_null
	| identifier variable_dimension_recurse_or_null '=' constant_param_expression
	;

specparam_assignment
	: identifier '=' constant_mintypmax_expression
	| pulse_control_specparam
	;

pulse_control_specparam
	: SVLOG_PATHPULSE '=' '(' reject_limit_value ')'
	| SVLOG_PATHPULSE '=' '(' reject_limit_value ',' error_limit_value ')'
	| SVLOG_PATHPULSE specify_input_terminal_descriptor '$' specify_output_terminal_descriptor '=' '(' reject_limit_value ')'
	| SVLOG_PATHPULSE specify_input_terminal_descriptor '$' specify_output_terminal_descriptor '=' '(' reject_limit_value ',' error_limit_value ')'
	;

error_limit_value
	: constant_mintypmax_expression
	;

reject_limit_value
	: constant_mintypmax_expression
	;

type_assignment
	: identifier
	| identifier '=' data_type_or_incomplete_class_scoped_type
	;

variable_decl_assignment
	: identifier
	| identifier variable_dimension_recurse
	| identifier variable_dimension_recurse '=' expression
	| identifier unsized_dimension variable_dimension_recurse_or_null
	| identifier unsized_dimension variable_dimension_recurse_or_null '=' dynamic_array_new
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

unpacked_dimension_recurse
	: unpacked_dimension
	| unpacked_dimension_recurse unpacked_dimension
	;

unpacked_dimension_recurse_or_null
	: %empty
	| unpacked_dimension_recurse
	;

packed_dimension
	: '[' constant_range ']'
	| unsized_dimension
	;

packed_dimension_recurse
	: packed_dimension
	| packed_dimension_recurse packed_dimension
	;

packed_dimension_recurse_or_null
	: %empty
	| packed_dimension_recurse
	;

associative_dimension
	: '[' data_type ']'
	| REPEAT_ZERO_OR_MORE
	;

variable_dimension
	: unsized_dimension
	| unpacked_dimension
	| associative_dimension
	| queue_dimension
	;

variable_dimension_recurse
	: variable_dimension
	| variable_dimension_recurse variable_dimension
	;

variable_dimension_recurse_or_null
	: %empty
	| variable_dimension_recurse
	;

queue_dimension
	: QUEUE_INITIALIZE
	| BOUNDED_QUEUE_INITIALIZE constant_expression ']'
	;

unsized_dimension
	: '[' ']'
	;

/**************************************************
 * End of 'Declaration ranges' Grammer Rules      *
 * Based off section: (A.2.5 Declaration ranges). *
 **************************************************/


/*****************************************************
 * Start of 'Function declarations' Grammer Rules    *
 * Based off section: (A.2.6 Function declarations). *
 *****************************************************/

function_data_type_or_implicit
	: data_type_or_void
	| implicit_data_type
	;

function_declaration
	: SVLOG_FUNCTION dynamic_override_specifiers_or_null lifetime_or_null function_body_declaration
	;

function_body_declaration
	: function_data_type_or_implicit
	  ident_or_class_scope_or_null identifier ';'
	  tf_item_declaration_recurse_or_null
	  function_statement_or_null_recurse_or_null
	  SVLOG_ENDFUNCTION colon_ident_or_null
	| function_data_type_or_implicit
	  ident_or_class_scope_or_null identifier '(' tf_port_list_or_null ')' ';'
	  block_item_declaration_recurse_or_null
	  function_statement_or_null_recurse_or_null
	  SVLOG_ENDFUNCTION colon_ident_or_null
	;

function_prototype
	: SVLOG_FUNCTION dynamic_override_specifiers_or_null data_type_or_void identifier
	| SVLOG_FUNCTION dynamic_override_specifiers_or_null data_type_or_void identifier '(' tf_port_list_or_null ')'
	;

c_ident_equal_or_null
	: %empty
	| SVLOG_CIDENT '='
	;

dpi_import_export
	: SVLOG_IMPORT dpi_spec_string dpi_function_import_property_or_null c_ident_equal_or_null function_prototype ';'
	| SVLOG_IMPORT dpi_spec_string dpi_task_import_property_or_null c_ident_equal_or_null task_prototype ';'
	| SVLOG_EXPORT dpi_spec_string c_ident_equal_or_null SVLOG_FUNCTION identifier ';'
	| SVLOG_EXPORT dpi_spec_string c_ident_equal_or_null SVLOG_TASK identifier ';'
	;

dpi_spec_string
	: '"' SVLOG_DPI_C '"'
	| '"' SVLOG_DPI '"'
	;

dpi_function_import_property
	: SVLOG_CONTEXT
	| SVLOG_PURE
	;

dpi_function_import_property_or_null
	: %empty
	| dpi_function_import_property
	;

dpi_task_import_property
	: SVLOG_CONTEXT
	;

dpi_task_import_property_or_null
	: %empty
	| dpi_task_import_property
	;

/*****************************************************
 * End of 'Function declarations' Grammer Rules      *
 * Based off section: (A.2.6 Function declarations). *
 *****************************************************/


/***************************************************
 * Start of 'Task declarations' Grammer Rules      *
 * Based off section: (A.2.7 Task declarations).   *
 ***************************************************/

task_declaration
	: SVLOG_TASK dynamic_override_specifiers_or_null lifetime_or_null task_body_declaration
	;

task_body_declaration
	: ident_or_class_scope_or_null identifier ';'
		tf_item_declaration_recurse_or_null
		statement_or_null_recurse_or_null
	  SVLOG_ENDTASK colon_ident_or_null
	| ident_or_class_scope_or_null identifier '(' tf_port_list_or_null ')' ';'
		block_item_declaration_recurse_or_null
		statement_or_null_recurse_or_null
	  SVLOG_ENDTASK colon_ident_or_null
	;

tf_item_declaration
	: block_item_declaration
	| tf_port_declaration
	;

tf_item_declaration_recurse
	: tf_item_declaration
	| tf_item_declaration_recurse tf_item_declaration
	;

tf_item_declaration_recurse_or_null
	: tf_item_declaration_recurse
	| %empty
	;

tf_port_list
	: tf_port_item
	| tf_port_list ',' tf_port_item
	;

tf_port_list_or_null
	: tf_port_list
	| %empty
	;

tf_port_item_var_dimension_expr_or_null
	: identifier variable_dimension_recurse_or_null equal_expression_or_null
	| %empty
	;

tf_port_item
	: attribute_instance_recurse_or_null tf_port_direction_or_null
	  var_or_null data_type_or_implicit
	  tf_port_item_var_dimension_expr_or_null
	;

tf_port_direction
	: port_direction
	| const_or_null SVLOG_REF static_or_null
	;

tf_port_direction_or_null
	: tf_port_direction
	| %empty
	;

tf_port_declaration
	: attribute_instance_recurse_or_null tf_port_direction
	  var_or_null data_type_or_implicit list_of_tf_variable_identifiers ';'
	;

task_prototype
	: SVLOG_TASK dynamic_override_specifiers_or_null identifier
	| SVLOG_TASK dynamic_override_specifiers_or_null identifier '(' tf_port_list ')'
	;

dynamic_override_specifiers
	: initial_or_extends_specifier_or_null final_specifier_or_null
	;

dynamic_override_specifiers_or_null
	: dynamic_override_specifiers
	| %empty
	;

initial_or_extends_specifier
	: ':' SVLOG_INITIAL
	| ':' SVLOG_EXTENDES
	;

initial_or_extends_specifier_or_null
	: initial_or_extends_specifier
	| %empty
	;

final_specifier
	: ':' SVLOG_FINAL
	;

final_specifier_or_null
	: final_specifier
	| %empty
	;

/*************************************************
 * End of 'Task declarations' Grammer Rules      *
 * Based off section: (A.2.7 Task declarations). *
 *************************************************/


/*******************************************************
 * Start of 'Block item declarations' Grammer Rules    *
 * Based off section: (A.2.8 Block item declarations). *
 *******************************************************/

block_item_declaration
	: attribute_instance_recurse_or_null data_declaration
	| attribute_instance_recurse_or_null local_parameter_declaration ';'
	| attribute_instance_recurse_or_null parameter_declaration ';'
	| attribute_instance_recurse_or_null let_declaration
	;

block_item_declaration_recurse
	: block_item_declaration
	| block_item_declaration_recurse block_item_declaration
	;

block_item_declaration_recurse_or_null
	: %empty
	| block_item_declaration_recurse
	;

/*******************************************************
 * End of 'Block item declarations' Grammer Rules      *
 * Based off section: (A.2.8 Block item declarations). *
 *******************************************************/


/*******************************************************
 * Start of 'Assertion declarations' Grammer Rules     *
 * Based off section: (A.2.10 Assertion declarations). *
 *******************************************************/

concurrent_assertion_item
	: concurrent_assertion_statement
	| identifier ':' concurrent_assertion_statement
	| checker_instantiation
	;

concurrent_assertion_statement
	: assert_property_statement
	| assume_property_statement
	| cover_property_statement
	| cover_sequence_statement
	| restrict_property_statement
	;

assert_property_statement
	: SVLOG_ASSERT SVLOG_PROPERTY '(' property_spec ')' action_block
	;

assume_property_statement
	: SVLOG_ASSUME SVLOG_PROPERTY '(' property_spec ')' action_block
	;

cover_property_statement
	: SVLOG_COVER SVLOG_PROPERTY '(' property_spec ')' statement_or_null
	;

expect_property_statement
	: SVLOG_EXPECT '(' property_spec ')' action_block
	;

cover_sequence_statement
	: SVLOG_COVER SVLOG_SEQUENCE '(' sequence_expr ')' statement_or_null
	| SVLOG_COVER SVLOG_SEQUENCE '('
		clocking_event sequence_expr
	  ')' statement_or_null
	| SVLOG_COVER SVLOG_SEQUENCE '('
		clocking_event disable_iff_expr_or_dist sequence_expr
	  ')' statement_or_null
	| SVLOG_COVER SVLOG_SEQUENCE '('
		disable_iff_expr_or_dist sequence_expr
	  ')' statement_or_null
	;

restrict_property_statement
	: SVLOG_RESTRICT SVLOG_PROPERTY '(' property_spec ')' ';'
	;

property_instance
	: ps_or_hierarchical_property_identifier
	| ps_or_hierarchical_property_identifier '(' property_list_of_arguments_or_null ')'
	;

property_list_of_arguments
	: property_actual_arg_seq_list ident_property_actual_arg_seq_list
	| '.' identifier '(' property_actual_arg_or_null ')' ident_property_actual_arg_seq_list
	;

property_list_of_arguments_or_null
	: %empty
	| property_list_of_arguments
	;

property_actual_arg_or_null
	: %empty
	| property_actual_arg
	;

property_actual_arg
	: property_expr
	| sequence_actual_arg
	;

property_actual_arg_seq_list
	: property_actual_arg
	| property_actual_arg_seq_list ',' property_actual_arg
	;

ident_property_actual_arg_seq_list
	: %empty
	| ',' '.' identifier '(' property_actual_arg_or_null ')'
	| ident_property_actual_arg_seq_list ',' '.' identifier '(' property_actual_arg_or_null ')'
	;

assertion_item_declaration
	: property_declaration
	| sequence_declaration
	| let_declaration
	;

property_declaration
	: SVLOG_PROPERTY identifier property_decl_pp_list_or_null ';'
		assertion_variable_declaration_recurse
		property_spec semicolon_or_null
	  SVLOG_ENDPROPERTY colon_ident_or_null
	;

property_decl_pp_list_or_null
	: %empty
	| '(' ')'
	| '(' property_port_list ')'
	;

property_port_list
	: property_port_item
	| property_port_list ',' property_port_item
	;

property_port_item
	: attribute_instance_recurse_or_null pp_item_local_direction_or_null property_formal_type
	  identifier variable_dimension_recurse_or_null
	| attribute_instance_recurse_or_null pp_item_local_direction_or_null property_formal_type
	  identifier variable_dimension_recurse_or_null '=' property_actual_arg
	;

pp_item_local_direction_or_null
	: SVLOG_LOCAL
	| SVLOG_LOCAL SVLOG_INPUT
	| %empty
	;

property_formal_type
	: sequence_formal_type
	| SVLOG_PROPERTY
	;

property_spec
	: clocking_event_or_null disable_iff_expr_or_dist_or_null property_expr
	;

property_expr
	: sequence_expr
	| SVLOG_STRONG '(' sequence_expr ')'
	| SVLOG_WEAK '(' sequence_expr ')'
	| '(' property_expr ')'
	| SVLOG_NOT property_expr
	| property_expr SVLOG_OR property_expr
	| property_expr SVLOG_AND property_expr
	| sequence_expr OVERLAPPED_OPERATOR property_expr
	| sequence_expr NONOVERLAPPED_OPERATOR property_expr
	| SVLOG_IF '(' expression_or_dist ')' property_expr
	| SVLOG_IF '(' expression_or_dist ')' property_expr SVLOG_ELSE property_expr
	| SVLOG_CASE '(' expression_or_dist ')' property_case_item_recurse SVLOG_ENDCASE
	| sequence_expr OVERLAPPED_OPERATOR_FOLLOWED_BY property_expr
	| sequence_expr NONOVERLAPPED_OPERATOR_FOLLOWED_BY property_expr
	| SVLOG_NEXTTIME property_expr
	| SVLOG_NEXTTIME '[' constant_expression ']' property_expr
	| SVLOG_S_NEXTTIME property_expr
	| SVLOG_S_NEXTTIME '[' constant_expression ']' property_expr
	| SVLOG_ALWAYS property_expr
	| SVLOG_ALWAYS '[' cycle_delay_const_range_expression ']' property_expr
	| SVLOG_S_ALWAYS '[' constant_range ']' property_expr
	| SVLOG_S_EVENTUALLY property_expr
	| SVLOG_EVENTUALLY '[' constant_range ']' property_expr
	| SVLOG_S_EVENTUALLY '[' cycle_delay_const_range_expression ']' property_expr
	| property_expr SVLOG_UNTIL property_expr
	| property_expr SVLOG_S_UNTIL property_expr
	| property_expr SVLOG_UNTIL_WITH property_expr
	| property_expr SVLOG_S_UNTIL_WITH property_expr
	| property_expr SVLOG_IMPLIES property_expr
	| property_expr SVLOG_IF_AND_ONLY_IF property_expr
	| SVLOG_ACCEPT_ON '(' expression_or_dist ')' property_expr
	| SVLOG_REJECT_ON '(' expression_or_dist ')' property_expr
	| SVLOG_SYNC_ACCEPT_ON '(' expression_or_dist ')' property_expr
	| SVLOG_SYNC_REJECT_ON '(' expression_or_dist ')' property_expr
	| property_instance
	| clocking_event property_expr
	;

property_case_item
	: expression_or_dist_seq_list ':' property_expr ';'
	| SVLOG_DEFAULT property_expr ';'
	| SVLOG_DEFAULT ':' property_expr ';'
	;

property_case_item_recurse
	: property_case_item
	| property_case_item_recurse property_case_item
	;

sequence_declaration_port_list_or_null
	: %empty
	| '(' ')'
	| '(' sequence_port_list ')'
	;

sequence_declaration
	: SVLOG_SEQUENCE identifier sequence_declaration_port_list_or_null ';'
		assertion_variable_declaration_recurse_or_null
		sequence_expr semicolon_or_null
	  SVLOG_ENDSEQUENCE colon_ident_or_null
	;

sequence_port_list
	: sequence_port_item
	| sequence_port_list sequence_port_item
	;

sp_item_local_slp_direction_or_null
	: %empty
	| SVLOG_LOCAL
	| SVLOG_LOCAL sequence_lvar_port_direction
	;

sequence_port_item
	: attribute_instance_recurse_or_null sp_item_local_slp_direction_or_null
          sequence_formal_type identifier variable_dimension_recurse_or_null
	| attribute_instance_recurse_or_null sp_item_local_slp_direction_or_null
          sequence_formal_type identifier variable_dimension_recurse_or_null '=' sequence_actual_arg
	;

sequence_lvar_port_direction
	: SVLOG_INPUT
	| SVLOG_INOUT
	| SVLOG_OUTPUT
	;

sequence_formal_type
	: data_type_or_implicit
	| SVLOG_SEQUENCE
	| SVLOG_UNTYPED
	;

sequence_expr
	: cycle_delay_range sequence_expr
	| sequence_expr cycle_delay_range sequence_expr
	| expression_or_dist
	| expression_or_dist boolean_abbrev
	| sequence_instance
	| sequence_instance sequence_abbrev
	| '(' sequence_expr sequence_match_item_seq_list ')'
	| '(' sequence_expr sequence_match_item_seq_list ')' sequence_abbrev
	| sequence_expr SVLOG_AND sequence_expr
	| sequence_expr SVLOG_INTERSECT sequence_expr
	| sequence_expr SVLOG_OR sequence_expr
	| SVLOG_FIRST_MATCH '(' sequence_expr sequence_match_item_seq_list ')'
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

sequence_method_call
	: sequence_instance '.' identifier
	;

sequence_match_item
	: operator_assignment
	| inc_or_dec_expression
	| subroutine_call
	;

sequence_match_item_seq_list
	: ',' sequence_match_item
	| sequence_match_item_seq_list ',' sequence_match_item
	;

sequence_match_item_seq_list_or_null
	: %empty
	| sequence_match_item_seq_list
	;

sequence_instance
	: ps_or_hierarchical_sequence_identifier
	| ps_or_hierarchical_sequence_identifier '(' ')'
	| ps_or_hierarchical_sequence_identifier '(' sequence_list_of_arguments ')'
	;

sequence_list_of_arguments
	: sequence_actual_arg_seq_list_or_null sequence_actual_arg_ident_seq_list_or_null
	| '.' identifier '(' ')' sequence_actual_arg_ident_seq_list_or_null
	| '.' identifier '(' sequence_actual_arg ')' sequence_actual_arg_ident_seq_list_or_null
	;

sequence_actual_arg
	: event_expression
	| sequence_expr
	| '$'
	;

sequence_actual_arg_ident_seq_list
	: ',' '.' identifier '(' ')'
	| ',' '.' identifier '(' sequence_actual_arg ')'
	| sequence_actual_arg_ident_seq_list ',' '.' identifier '(' ')'
	| sequence_actual_arg_ident_seq_list ',' '.' identifier '(' sequence_actual_arg ')'
	;

sequence_actual_arg_ident_seq_list_or_null
	: %empty
	| sequence_actual_arg_ident_seq_list
	;

sequence_actual_arg_seq_list
	: sequence_actual_arg
	| sequence_actual_arg_seq_list ',' sequence_actual_arg
	;

sequence_actual_arg_seq_list_or_null
	: %empty
	| sequence_actual_arg_seq_list
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
	: CONSECUTIVE_REPEAT_OPERATOR const_or_range_expression ']'
	| REPEAT_ZERO_OR_MORE
	| REPEAT_ONE_OR_MORE
	;

nonconsecutive_repetition
	: NON_CONSECUTIVE_REPEAT_OPERATOR const_or_range_expression ']'
	;

goto_repetition
	: GOTO_REPETITION_OPERATOR const_or_range_expression ']'
	;

const_or_range_expression
	: constant_expression
	| cycle_delay_const_range_expression
	;

cycle_delay_const_range_expression
	: constant_expression ':' constant_expression
	| constant_expression ':' '$'
	;

assertion_variable_declaration
	: var_data_type list_of_variable_decl_assignments ';'
	;

assertion_variable_declaration_recurse
	: assertion_variable_declaration
	| assertion_variable_declaration_recurse assertion_variable_declaration
	;

assertion_variable_declaration_recurse_or_null
	: %empty
	| assertion_variable_declaration_recurse
	;

/*******************************************************
 * End of 'Assertion declarations' Grammer Rules       *
 * Based off section: (A.2.10 Assertion declarations). *
 *******************************************************/


/*************************************************
 * Start of 'Let declarations' Grammer Rules     *
 * Based off section: (A.2.12 Let declarations). *
 *************************************************/

let_declaration
	: SVLOG_LET identifier equal_expression ';'
	| SVLOG_LET identifier '(' ')' equal_expression ';'
	| SVLOG_LET identifier '(' let_port_list ')' equal_expression ';'
	;

let_port_list
	: let_port_item
	| let_port_list ',' let_port_item
	;

let_port_item
	: attribute_instance_recurse_or_null let_formal_type identifier variable_dimension_recurse equal_expression_or_null
	;

let_formal_type
	: data_type_or_implicit
	| SVLOG_UNTYPED
	;

let_expression
	: identifier
	| identifier '(' let_list_of_arguments ')'
	| package_scope identifier
	| package_scope identifier '(' let_list_of_arguments ')'
	;

let_list_of_arguments
	: %empty
	| let_actual_arg_seq_list let_list_of_arguments_ident_seq_list
	| '.' identifier '(' let_actual_arg ')' let_list_of_arguments_ident_seq_list
	;

let_list_of_arguments_ident_seq_list
	: %empty
	| ',' '.' identifier '(' let_actual_arg ')'
	| let_list_of_arguments_ident_seq_list ',' '.' identifier '(' let_actual_arg ')'
	;

let_actual_arg
	: %empty
	| expression
	;

let_actual_arg_seq_list
	: let_actual_arg
	| let_actual_arg_seq_list ',' let_actual_arg
	;

/*************************************************
 * End of 'Let declarations' Grammer Rules       *
 * Based off section: (A.2.12 Let declarations). *
 *************************************************/


/******************************************************
 * Start of 'Module instantiation' Grammer Rules      *
 * Based off section: (A.4.1.1 Module instantiation). *
 ******************************************************/

module_instantiation
	: identifier hierarchical_instance_seq_list
	| identifier parameter_value_assignment hierarchical_instance_seq_list
	;

parameter_value_assignment
	: '#' '(' ')'
	| '#' '(' list_of_parameter_value_assignments ')'
	;

parameter_value_assignment_or_null
	: %empty
	| parameter_value_assignment
	;

list_of_parameter_value_assignments
	: ordered_parameter_assignment_seq_list
	| named_parameter_assignment_seq_list
	;

ordered_parameter_assignment
	: param_expression
	;

ordered_parameter_assignment_seq_list
	: ordered_parameter_assignment
	| ordered_parameter_assignment_seq_list ',' ordered_parameter_assignment
	;

named_parameter_assignment
	: '.' identifier '(' ')'
	| '.' identifier '(' param_expression ')'
	;

named_parameter_assignment_seq_list
	: named_parameter_assignment
	| named_parameter_assignment_seq_list ',' named_parameter_assignment
	;

hierarchical_instance
	: name_of_instance '(' ')'
	| name_of_instance '(' list_of_port_connections ')'
	;

hierarchical_instance_seq_list
	: hierarchical_instance
	| hierarchical_instance_seq_list ',' hierarchical_instance
	;

name_of_instance
	: identifier unpacked_dimension_recurse_or_null
	;

list_of_port_connections
	: ordered_port_connection_seq_list
	| named_port_connection_seq_list
	;

ordered_port_connection
	: attribute_instance_recurse_or_null expression_or_null
	;

ordered_port_connection_seq_list
	: ordered_port_connection
	| ordered_port_connection_seq_list ',' ordered_port_connection
	;

named_port_connection
	: attribute_instance_recurse_or_null '.' identifier
	| attribute_instance_recurse_or_null '.' identifier '(' expression_or_null ')'
	| attribute_instance_recurse_or_null '.' '*'
	;

named_port_connection_seq_list
	: named_port_connection
	| named_port_connection_seq_list ',' named_port_connection
	;

/******************************************************
 * End of 'Module instantiation' Grammer Rules        *
 * Based off section: (A.4.1.1 Module instantiation). *
 ******************************************************/


/*******************************************************
 * Start of 'Checker instantiation' Grammer Rules      *
 * Based off section: (A.4.1.4 Checker instantiation). *
 *******************************************************/

checker_instantiation
	: ps_checker_identifier name_of_instance '(' ')' ';'
	| ps_checker_identifier name_of_instance '(' list_of_checker_port_connections ')' ';'
	;

list_of_checker_port_connections
	: ordered_checker_port_connection_seq_list
	| named_checker_port_connection_seq_list
	;

ordered_checker_port_connection
	: attribute_instance_recurse_or_null property_actual_arg_or_null
	;

ordered_checker_port_connection_seq_list
	: ordered_checker_port_connection
	| ordered_checker_port_connection_seq_list ',' ordered_checker_port_connection
	;

named_checker_port_connection
	: attribute_instance_recurse_or_null '.' identifier
	| attribute_instance_recurse_or_null '.' identifier '(' property_actual_arg_or_null ')'
	| attribute_instance_recurse_or_null '.' '*'
	;

named_checker_port_connection_seq_list
	: named_checker_port_connection
	| named_checker_port_connection_seq_list ',' named_checker_port_connection
	;

/*******************************************************
 * End of 'Checker instantiation' Grammer Rules        *
 * Based off section: (A.4.1.4 Checker instantiation). *
 *******************************************************/


/******************************************************************************
 * Start of 'Continuous assignment and net alias statements' Grammer Rules    *
 * Based off section: (A.6.1 Continuous assignment and net alias statements). *
 ******************************************************************************/

list_of_variable_assignments
	: variable_assignment
	| list_of_variable_assignments ',' variable_assignment
	;

net_assignment
	: net_lvalue equal_expression
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
	: variable_lvalue equal_expression

/*****************************************************************
 * End of 'Procedural blocks and assignments' Grammer Rules      *
 * Based off section: (A.6.2 Procedural blocks and assignments). *
 *****************************************************************/


/**************************************************************
 * Start of 'Parallel and sequential blocks' Grammer Rules    *
 * Based off section: (A.6.3 Parallel and sequential blocks). *
 **************************************************************/

action_block
	: statement_or_null
	| SVLOG_ELSE statement_or_null
	| statement SVLOG_ELSE statement_or_null
	;

seq_par_bident
	: %empty
	| ':' identifier
	;

seq_par_bid
	: %empty
	| block_item_declaration
	| seq_par_bid block_item_declaration
	;

seq_par_sonull
	: %empty
	| statement_or_null
	| seq_par_sonull statement_or_null
	;

seq_block
	: SVLOG_BEGIN seq_par_bident seq_par_bid seq_par_sonull SVLOG_END seq_par_bident
	;

par_block
	: SVLOG_FORK seq_par_bident seq_par_bid seq_par_sonull join_keyword seq_par_bident
	;

join_keyword
	: SVLOG_JOIN
	| SVLOG_JOIN_ANY
	| SVLOG_JOIN_NONE
	;

/**************************************************************
 * End of 'Parallel and sequential blocks' Grammer Rules      *
 * Based off section: (A.6.3 Parallel and sequential blocks). *
 **************************************************************/


/******************************************
 * Start of 'Statements' Grammer Rules    *
 * Based off section: (A.6.4 Statements). *
 ******************************************/

statement_or_null
	: statement
	| attribute_instance_recurse_or_null ';'
	;

statement_or_null_recurse
	: statement_or_null
	| statement_or_null_recurse statement_or_null
	;

statement_or_null_recurse_or_null
	: %empty
	| statement_or_null
	;

statement
	: attribute_instance_recurse_or_null statement_item
	| identifier ':' attribute_instance_recurse_or_null statement_item
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
	| attribute_instance_recurse_or_null ';'
	;

function_statement_or_null_recurse
	: function_statement_or_null
	| function_statement_or_null_recurse function_statement_or_null
	;

function_statement_or_null_recurse_or_null
	: %empty
	| function_statement_or_null_recurse
	;

/******************************************
 * End of 'Statements' Grammer Rules      *
 * Based off section: (A.6.4 Statements). *
 ******************************************/


/*********************************************************
 * Start of 'Timing control statements' Grammer Rules    *
 * Based off section: (A.6.5 Timing control statements). *
 *********************************************************/

procedural_timing_control_statement
	: procedural_timing_control statement_or_null
	;

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

clocking_event_or_null
	: clocking_event
	| %empty
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

procedural_timing_control
	: delay_control
	| event_control
	| cycle_delay
	;

jump_statement
	: SVLOG_RETURN ';'
	| SVLOG_RETURN expression ';'
	| SVLOG_BREAK ';'
	| SVLOG_CONTINUE ';'
	;

wait_statement
	: SVLOG_WAIT '(' expression ')' statement_or_null
	| SVLOG_WAIT SVLOG_FORK ';'
	| SVLOG_WAIT_ORDER '(' hierarchical_identifier_seq_list ')' action_block
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

/*********************************************************
 * End of 'Timing control statements' Grammer Rules      *
 * Based off section: (A.6.5 Timing control statements). *
 *********************************************************/


/******************************************************
 * Start of 'Conditional statements' Grammer Rules    *
 * Based off section: (A.6.6 Conditional statements). *
 ******************************************************/

cs_else_if_seq_list
	: SVLOG_ELSE SVLOG_IF '(' cond_predicate ')' statement_or_null
	| cs_else_if_seq_list SVLOG_ELSE SVLOG_IF '(' cond_predicate ')' statement_or_null
	;

cs_else_if_seq_list_or_null
	: %empty
	| cs_else_if_seq_list
	;

cs_else
	: %empty
	| SVLOG_ELSE statement_or_null
	;

conditional_statement
	: unique_priority_or_null SVLOG_IF '(' cond_predicate ')'
	  statement_or_null cs_else_if_seq_list_or_null cs_else
	;

unique_priority
	: SVLOG_UNIQUE
	| SVLOG_UNIQUE0
	| SVLOG_PRIORITY
	;

unique_priority_or_null
	: %empty
	| unique_priority
	;

cond_predicate
	: expression_or_cond_pattern expression_or_cond_pattern_seq_list_or_null
	;

expression_or_cond_pattern
	: expression
	| cond_pattern
	;

expression_or_cond_pattern_seq_list
	: SVLOG_IF_AND_ONLY_IF expression_or_cond_pattern
	| expression_or_cond_pattern_seq_list SVLOG_IF_AND_ONLY_IF expression_or_cond_pattern
	;

expression_or_cond_pattern_seq_list_or_null
	: %empty
	| expression_or_cond_pattern_seq_list
	;

cond_pattern
	: expression SVLOG_MATCHES pattern
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
	: case_item_expression_seq_list ':' statement_or_null
	| SVLOG_DEFAULT statement_or_null
	| SVLOG_DEFAULT ':' statement_or_null
	;

case_item_recurse
	: case_item
	| case_item_recurse case_item
	;

case_item_expression_seq_list
	: expression
	| case_item_expression_seq_list ',' expression
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


/******************************************
 * Start of 'Patterns' Grammer Rules      *
 * Based off section: (A.6.7.1 Patterns). *
 ******************************************/

pattern
	: '(' pattern ')'
	| period_ident
	| '.' '*'
	| constant_expression
	| SVLOG_TAGGED identifier
	| SVLOG_TAGGED identifier pattern
	| APOSTROPHE '{' pattern_seq_list '}'
	| APOSTROPHE '{' pattern_ident_seq_list '}'
	;

pattern_recurse
	: pattern
	| pattern_recurse pattern
	;

pattern_seq_list
	: pattern
	| pattern_seq_list ',' pattern
	;

pattern_ident_seq_list
	: identifier ':' pattern
	| pattern_ident_seq_list ',' identifier ':' pattern
	;

assignment_pattern
	: APOSTROPHE '{' expression_seq_list '}'
	| APOSTROPHE '{' structure_pattern_key_expression_seq_list '}'
	| APOSTROPHE '{' array_pattern_key_expression_seq_list '}'
	| APOSTROPHE '{' constant_expression '{' expression_seq_list '}' '}'
	;

structure_pattern_key
	: identifier
	| assignment_pattern_key
	;

structure_pattern_key_recurse
	: structure_pattern_key
	| structure_pattern_key_recurse structure_pattern_key
	;

structure_pattern_key_expression_seq_list
	: structure_pattern_key ':' expression
	| structure_pattern_key_expression_seq_list ',' structure_pattern_key ':' expression
	;

array_pattern_key
	: constant_expression
	| assignment_pattern_key
	;

array_pattern_key_recurse
	: array_pattern_key
	| array_pattern_key_recurse array_pattern_key
	;

array_pattern_key_expression_seq_list
	: array_pattern_key ':' expression
	| array_pattern_key_expression_seq_list ',' array_pattern_key ':' expression
	;

assignment_pattern_key
	: simple_type
	| SVLOG_DEFAULT
	;

assignment_pattern_expression
	: assignment_pattern
	| assignment_pattern_expression_type assignment_pattern
	;

assignment_pattern_expression_type
	: ps_type_identifier
	| ps_parameter_identifier
	| integer_atom_type
	| type_reference
	;

constant_assignment_pattern_expression
	: assignment_pattern_expression
	;

assignment_pattern_net_lvalue
	: APOSTROPHE '{' net_lvalue_seq_list '}'
	;

assignment_pattern_variable_lvalue
	: APOSTROPHE '{' variable_lvalue_seq_list '}'
	;

/******************************************
 * End of 'Patterns' Grammer Rules        *
 * Based off section: (A.6.7.1 Patterns). *
 ******************************************/


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
	| for_variable_declaration_seq_list
	;

for_variable_declaration
	: data_type identifier equal_expression variable_identifier_expression_seq_list
	| SVLOG_VAR data_type identifier equal_expression variable_identifier_expression_seq_list
	;

for_variable_declaration_seq_list
	: for_variable_declaration
	| for_variable_declaration_seq_list ',' for_variable_declaration
	;

variable_identifier_expression_seq_list
	: %empty
	| ',' identifier equal_expression
	| variable_identifier_expression_seq_list ',' identifier equal_expression
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
	: APOSTROPHE '{' net_lvalue_seq_list '}'
	;

assignment_pattern_variable_lvalue
	:  APOSTROPHE '{' variable_lvalue_seq_list '}'
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


/*****************************************************
 * Start of 'Assertion statements' Grammer Rules     *
 * Based off section: (A.6.10 Assertion statements). *
 *****************************************************/

assertion_item
	: concurrent_assertion_item
	| deferred_immediate_assertion_item
	;

deferred_immediate_assertion_item
	: deferred_immediate_assertion_statement
	| identifier ':' deferred_immediate_assertion_statement
	;

procedural_assertion_statement
	: concurrent_assertion_statement
	| immediate_assertion_statement
	| checker_instantiation
	;

immediate_assertion_statement
	: simple_immediate_assertion_statement
	| deferred_immediate_assertion_statement
	;

simple_immediate_assertion_statement
	: simple_immediate_assert_statement
	| simple_immediate_assume_statement
	| simple_immediate_cover_statement
	;

deferred_immediate_assertion_statement
	: deferred_immediate_assert_statement
	| deferred_immediate_assume_statement
	| deferred_immediate_cover_statement
	;

simple_immediate_assert_statement
	: SVLOG_ASSERT '(' expression ')' action_block
	;

simple_immediate_assume_statement
	: SVLOG_ASSUME '(' expression ')' action_block
	;

simple_immediate_cover_statement
	: SVLOG_COVER '(' expression ')' statement_or_null
	;

deferred_immediate_assert_statement
	: SVLOG_ASSERT POUND_ZERO '(' expression ')' action_block
	| SVLOG_ASSERT SVLOG_FINAL '(' expression ')' action_block
	;

deferred_immediate_assume_statement
	: SVLOG_ASSUME POUND_ZERO '(' expression ')' action_block
	| SVLOG_ASSUME SVLOG_FINAL '(' expression ')' action_block
	;

deferred_immediate_cover_statement
	: SVLOG_COVER POUND_ZERO '(' expression ')' statement_or_null
	| SVLOG_COVER SVLOG_FINAL '(' expression ')' statement_or_null
	;

/*****************************************************
 * End of 'Assertion statements' Grammer Rules       *
 * Based off section: (A.6.10 Assertion statements). *
 *****************************************************/


/***********************************************
 * Start of 'Clocking block' Grammer Rules     *
 * Based off section: (A.6.11 Clocking block). *
 ***********************************************/

default_or_null
	: %empty
	| SVLOG_DEFAULT
	;

clocking_identifier
	: %empty
	| identifier
	| ':' identifier
	;

clocking_declaration
	: default_or_null SVLOG_CLOCKING clocking_identifier clocking_event ';'
		clocking_item_recurse_or_null
	  SVLOG_ENDCLOCKING clocking_identifier
	| SVLOG_GLOBAL SVLOG_CLOCKING clocking_identifier clocking_event ';'
	  SVLOG_ENDCLOCKING clocking_identifier
	;

clocking_item
	: SVLOG_DEFAULT default_skew ';'
	| clocking_direction list_of_clocking_decl_assign ';'
	| attribute_instance_recurse_or_null assertion_item_declaration
	;

clocking_item_recurse
	: clocking_item
	| clocking_item_recurse clocking_item
	;

clocking_item_recurse_or_null
	: %empty
	| clocking_item_recurse
	;

default_skew
	: SVLOG_INPUT clocking_skew
	| SVLOG_OUTPUT clocking_skew
	| SVLOG_INPUT clocking_skew SVLOG_OUTPUT clocking_skew
	;

clocking_direction
	: SVLOG_INPUT clocking_skew_or_null
	| SVLOG_OUTPUT clocking_skew_or_null
	| SVLOG_INPUT clocking_skew_or_null SVLOG_OUTPUT clocking_skew_or_null
	| SVLOG_INOUT
	;

list_of_clocking_decl_assign
	: clocking_decl_assign
	| list_of_clocking_decl_assign ',' clocking_decl_assign
	;

clocking_decl_assign
	: identifier equal_expression_or_null
	;

clocking_skew_or_null
	: %empty
	| clocking_skew
	;

clocking_skew
	: edge_identifier delay_control_or_null
	| delay_control
	;

clocking_drive
	: clockvar_expression LT_OR_EQ cycle_delay_or_null expression
	;

cycle_delay
	: '#' '#' integral_number
	| '#' '#' identifier
	| '#' '#' '(' expression ')'
	;

cycle_delay_or_null
	: %empty
	| cycle_delay
	;

clockvar
	: hierarchical_identifier
	;

clockvar_expression
	: clockvar select
	;

/***********************************************
 * End of 'Clocking block' Grammer Rules       *
 * Based off section: (A.6.11 Clocking block). *
 ***********************************************/


/*********************************************
 * Start of 'Randsequence' Grammer Rules     *
 * Based off section: (A.6.12 Randsequence). *
 *********************************************/

randsequence_statement
	: SVLOG_RANDSEQUENCE '(' rs_production_identifier_or_null ')'
		rs_production_recurse
	  SVLOG_ENDSEQUENCE
	;

rs_production_recurse
	: rs_production
	| rs_production_recurse rs_production
	;

rs_production
	: data_type_or_void_or_null identifier ':' rs_rule_seq_list ';'
	| data_type_or_void_or_null identifier '(' tf_port_list ')' ':' rs_rule_seq_list ';'
	;

rs_rule
	: rs_production_list
	| rs_production_list EQUAL_WEIGHT_OPERATOR rs_weight_specification
	| rs_production_list EQUAL_WEIGHT_OPERATOR rs_weight_specification rs_code_block
	;

rs_rule_seq_list
	: rs_rule
	| rs_rule_seq_list '|' rs_rule
	;

rs_production_list
	: rs_prod_recurse
	| SVLOG_RAND SVLOG_JOIN rs_production_item rs_production_item rs_production_item_recurse_or_null
	| SVLOG_RAND SVLOG_JOIN '(' expression ')' rs_production_item rs_production_item rs_production_item_recurse_or_null
	;

rs_weight_specification
	: integral_number
	| ps_identifier
	| '(' expression ')'
	;

rs_code_block
	: '{' data_declaration_recurse_or_null statement_or_null_recurse_or_null '}'
	;

rs_prod
	: rs_production_item
	| rs_code_block
	| rs_if_else
	| rs_repeat
	| rs_case
	;

rs_prod_recurse
	: rs_prod
	| rs_prod_recurse rs_prod
	;

rs_production_item
	: identifier
	| identifier '(' list_of_arguments ')'
	;

rs_production_item_recurse
	: rs_production_item
	| rs_production_item_recurse rs_production_item
	;

rs_production_item_recurse_or_null
	: %empty
	| rs_production_item_recurse
	;

rs_if_else
	: SVLOG_IF '(' expression ')' rs_production_item
	| SVLOG_IF '(' expression ')' rs_production_item SVLOG_ELSE rs_production_item
	;

rs_repeat
	: SVLOG_REPEAT '(' expression ')' rs_production_item
	;

rs_case
	: SVLOG_CASE '(' expression ')' rs_case_item_recurse SVLOG_ENDCASE
	;

rs_case_item
	: expression_seq_list ':' rs_production_item ';'
	| SVLOG_DEFAULT rs_production_item ';'
	| SVLOG_DEFAULT ':' rs_production_item ';'
	;

rs_case_item_recurse
	: rs_case_item
	| rs_case_item_recurse rs_case_item
	;

/*********************************************
 * End of 'Randsequence' Grammer Rules       *
 * Based off section: (A.6.12 Randsequence). *
 *********************************************/


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


/*******************************************************
 * Start of 'Specify block terminals' Grammer Rules    *
 * Based off section: (A.7.3 Specify block terminals). *
 *******************************************************/

list_of_path_inputs
	: specify_input_terminal_descriptor
	| list_of_path_inputs ',' specify_input_terminal_descriptor
	;

list_of_path_outputs
	: specify_output_terminal_descriptor
	| list_of_path_outputs ',' specify_output_terminal_descriptor
	;

specify_input_terminal_descriptor
	: input_identifier
	| input_identifier '[' constant_range_expression ']'
	;

specify_output_terminal_descriptor
	: output_identifier
	| output_identifier '[' constant_range_expression ']'
	;

input_identifier
	: identifier
	| identifier '.' identifier
	;

output_identifier
	: identifier
	| identifier '.' identifier
	;

/*******************************************************
 * End of 'Specify block terminals' Grammer Rules      *
 * Based off section: (A.7.3 Specify block terminals). *
 *******************************************************/


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
	: ps_or_hierarchical_tf_identifier attribute_instance_recurse_or_null
	| ps_or_hierarchical_tf_identifier attribute_instance_recurse_or_null '(' list_of_arguments ')'
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
	| identifier attribute_instance_recurse_or_null '(' list_of_arguments ')'
	| built_in_method_call
	;

built_in_method_call
	: array_manipulation_call
	| randomize_call
	;

am_call_helper
	: %empty
	| '(' list_of_arguments ')'
	| SVLOG_WITH '(' expression ')'
	| '(' list_of_arguments ')' SVLOG_WITH '(' expression ')'
	;

array_manipulation_call
	: array_method_name attribute_instance_recurse_or_null am_call_helper
	;

randomize_call_helper
	: %empty
	| '(' ')'
	| '(' ')' SVLOG_WITH constraint_block
	| '(' ')' SVLOG_WITH '(' ')' constraint_block
	| '(' ')' SVLOG_WITH '(' identifier_list ')' constraint_block
	| '(' variable_identifier_list ')'
	| '(' variable_identifier_list ')' SVLOG_WITH constraint_block
	| '(' variable_identifier_list ')' SVLOG_WITH '(' ')' constraint_block
	| '(' variable_identifier_list ')' SVLOG_WITH '(' identifier_list ')' constraint_block
	| '(' SVLOG_NULL ')'
	| '(' SVLOG_NULL ')' SVLOG_WITH constraint_block
	| '(' SVLOG_NULL ')' SVLOG_WITH '(' ')' constraint_block
	| '(' SVLOG_NULL ')' SVLOG_WITH '(' identifier_list ')' constraint_block
	| SVLOG_WITH constraint_block
	| SVLOG_WITH '(' ')' constraint_block
	| SVLOG_WITH '(' identifier_list ')' constraint_block
	;

randomize_call
	: SVLOG_RANDOMIZE attribute_instance_recurse_or_null randomize_call_helper
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
	: inc_or_dec_operator attribute_instance_recurse_or_null variable_lvalue
	| variable_lvalue attribute_instance_recurse_or_null inc_or_dec_operator
	;

conditional_expression
	: cond_predicate '?' attribute_instance_recurse_or_null expression ':' expression
	;

constant_expression
	: constant_primary
	| unary_operator attribute_instance_recurse_or_null constant_primary
	| constant_expression binary_operator attribute_instance_recurse_or_null constant_expression
	| constant_expression '?' attribute_instance_recurse_or_null constant_expression ':' constant_expression
	;

constant_mintypmax_expression
	: constant_expression
	| constant_expression ':' constant_expression ':' constant_expression
	;

constant_param_expression
	: constant_mintypmax_expression
	| data_type
	| '$'
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
	| unary_operator attribute_instance_recurse_or_null primary
	| inc_or_dec_expression
	| '(' operator_assignment ')'
	| expression binary_operator attribute_instance_recurse_or_null expression
	| conditional_expression
	| inside_expression
	| tagged_union_expression
	;

expression_or_null
	: %empty
	| expression
	;

expression_seq_list
	: expression
	| expression_seq_list ',' expression
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

mident_bit_select_seq_list
	: %empty
	| '.' identifier bit_select
	| mident_bit_select_seq_list '.' identifier bit_select

select
	: bit_select
	| bit_select '[' part_select_range ']'
	| mident_bit_select_seq_list '.' identifier bit_select
	| mident_bit_select_seq_list '.' identifier bit_select '[' part_select_range ']'
	;

nonrange_select
	: bit_select
	| mident_bit_select_seq_list '.' identifier bit_select
	;

constant_bit_select
	: '[' constant_expression ']'
	| constant_bit_select '[' constant_expression ']'
	;

constant_select_seq_list
	: '.' identifier constant_bit_select
	| constant_select_seq_list '.' identifier constant_bit_select
	;

constant_select
	: constant_bit_select
	| constant_bit_select '[' constant_part_select_range ']'
	| constant_select_seq_list
	| constant_select_seq_list '[' constant_part_select_range ']'
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
	| '{' net_lvalue_seq_list '}'
	| assignment_pattern_net_lvalue
	| assignment_pattern_expression_type assignment_pattern_net_lvalue
	;

net_lvalue_seq_list
	: net_lvalue
	| net_lvalue_seq_list ',' net_lvalue
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

variable_lvalue_seq_list
	: variable_lvalue
	| variable_lvalue_seq_list ',' variable_lvalue
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
	| unsigned_number SVLOG_EXP unsigned_number
	| unsigned_number SVLOG_EXP sign unsigned_number
	| unsigned_number '.' unsigned_number SVLOG_EXP unsigned_number
	| unsigned_number '.' unsigned_number SVLOG_EXP sign unsigned_number
	;

fixed_point_number
	: unsigned_number '.' unsigned_number
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
	: APOSTROPHE SVLOG_DIGIT
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
	: '(' '*' attribute_spec_seq_list '*' ')'
	;

attribute_instance_recurse
	: attribute_instance
	| attribute_instance_recurse attribute_instance
	;

attribute_instance_recurse_or_null
	: %empty
	| attribute_instance_recurse
	;

attr_spec
	: attr_name
	| attr_name  '=' constant_expression
	;

attribute_spec_seq_list
	: attr_spec
	| attribute_instance_recurse ',' attr_spec
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
	: identifier
	| SVLOG_ROOT '.' identifier
	| hierarchical_identifier identifier constant_bit_select '.'
	;

hierarchical_identifier_seq_list
	: hierarchical_identifier
	| hierarchical_identifier_seq_list ',' hierarchical_identifier
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
	: class_or_package_scope_or_null identifier
	| implicit_class_handle '.' identifier
	;

ps_or_hierarchical_net_identifier
	: identifier
	| package_scope identifier
	| hierarchical_identifier
	;

ps_or_hierarchical_property_identifier
	: identifier
	| package_scope identifier
	| hierarchical_property_identifier
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

rs_production_identifier_or_null
	: %empty
	| identifier
	;

ps_parameter_identifier
	: class_or_package_scope_or_null identifier
	| ps_param_ident_seq_list identifier
	;

ps_param_ident_seq_list
	: generate_block_identifier '.'
	| generate_block_identifier  '[' constant_expression ']' '.'
	| ps_param_ident_seq_list generate_block_identifier '.'
	| ps_param_ident_seq_list generate_block_identifier  '[' constant_expression ']' '.'
	;

ps_type_identifier
	: class_or_package_scope_or_null identifier
	| SVLOG_LOCAL CLASS_SCOPE_OPERATOR identifier
	;

system_tf_identifier
	: SVLOG_STFIDENT { fprintf(stdout, "%s\n", $1); }
	;

/*******************************************
 * End of 'Identifiers' grammer rules.     *
 * Based off section: (A.9.3 Identifiers). *
 *******************************************/


/***********************************
 * Start of 'helper' grammer rules *
 ***********************************/

semicolon_or_null
	: ';'
	| %empty
	;

colon_ident_or_null
	: ':' identifier
	| %empty
	;

disable_iff_expr_or_dist
	: SVLOG_DISABLE SVLOG_IF_AND_ONLY_IF '(' expression_or_dist ')'
	;

disable_iff_expr_or_dist_or_null
	: disable_iff_expr_or_dist
	| %empty
	;

interface_or_null
	: SVLOG_INTERFACE
	| %empty
	;

period_ident
	: '.' identifier
	| identifier '.'
	;

period_ident_or_null
	: period_ident
	| %empty
	;

class_or_package_scope_or_null
	: class_scope
	| package_scope
	| %empty
	;

ident_or_class_scope_or_null
	: period_ident
	| class_scope
	| %empty
	;

var_or_null
	: SVLOG_VAR
	| %empty
	;

equal_expression
	: '=' expression
	;

equal_expression_or_null
	: equal_expression
	| %empty
	;

const_or_null
	: SVLOG_CONST
	| %empty
	;

static_or_null
	: SVLOG_STATIC
	| %empty
	;

/*********************************
 * End of 'helper' grammer rules *
 *********************************/

%%
