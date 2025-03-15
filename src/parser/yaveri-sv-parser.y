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
%token <itoken> SVLOG_TIMEPRECISION
%token <itoken> SVLOG_ALWAYS_LATCH
%token <itoken> SVLOG_ENDINTERFACE
%token <itoken> SVLOG_ENDPRIMITIVE
%token <itoken> SVLOG_ILLEGAL_BINS
%token <itoken> SVLOG_INTERCONNECT
%token <itoken> SVLOG_RANDSEQUENCE
%token <itoken> SVLOG_S_EVENTUALLY
%token <itoken> SVLOG_S_UNTIL_WITH
%token <itoken> SVLOG_ALWAYS_COMB
%token <itoken> SVLOG_ENDCLOCKING
%token <itoken> SVLOG_ENDFUNCTION
%token <itoken> SVLOG_ENDGENERATE
%token <itoken> SVLOG_ENDPROPERTY
%token <itoken> SVLOG_ENDSEQUENCE
%token <itoken> SVLOG_FIRST_MATCH
%token <itoken> SVLOG_IGNORE_BINS
%token <itoken> SVLOG_MACROMODULE
%token <itoken> SVLOG_TYPE_OPTION
%token <itoken> SVLOG_CONSTRAINT
%token <itoken> SVLOG_COVERGROUP
%token <itoken> SVLOG_COVERPOINT
%token <itoken> SVLOG_ENDCHECKER
%token <itoken> SVLOG_ENDPACKAGE
%token <itoken> SVLOG_ENDPROGRAM
%token <itoken> SVLOG_EVENTUALLY
%token <itoken> SVLOG_IMPLEMENTS
%token <itoken> SVLOG_LOCALPARAM
%token <itoken> SVLOG_S_NEXTTIME
%token <itoken> SVLOG_THROUGHOUT
%token <itoken> SVLOG_UNTIL_WITH
%token <itoken> SVLOG_WAIT_ORDER
%token <itoken> SVLOG_ALWAYS_FF
%token <itoken> SVLOG_ACCEPT_ON
%token <itoken> SVLOG_AUTOMATIC
%token <itoken> SVLOG_ENDCONFIG
%token <itoken> SVLOG_ENDMODULE
%token <itoken> SVLOG_INTERFACE
%token <itoken> SVLOG_INTERSECT
%token <itoken> SVLOG_JOIN_NONE
%token <itoken> SVLOG_PARAMETER
%token <itoken> SVLOG_PRIMITIVE
%token <itoken> SVLOG_PROTECTED
%token <itoken> SVLOG_RANDOMIZE
%token <itoken> SVLOG_REJECT_ON
%token <itoken> SVLOG_SHORTREAL
%token <itoken> SVLOG_SPECPARAM
%token <itoken> SVLOG_CLOCKING
%token <itoken> SVLOG_CONTINUE
%token <itoken> SVLOG_DEASSIGN
%token <itoken> SVLOG_DEFPARAM
%token <itoken> SVLOG_ENDCLASS
%token <itoken> SVLOG_ENDGROUP
%token <itoken> SVLOG_ENDTABLE
%token <itoken> SVLOG_EXTENDES
%token <itoken> SVLOG_FORKJOIN
%token <itoken> SVLOG_FUNCTION
%token <itoken> SVLOG_GENERATE
%token <itoken> SVLOG_INSTANCE
%token <itoken> SVLOG_JOIN_ANY
%token <itoken> SVLOG_NEXTTIME
%token <itoken> SVLOG_PRIORITY
%token <itoken> SVLOG_PROPERTY
%token <itoken> SVLOG_PULLDOWN
%token <itoken> SVLOG_RANDCASE
%token <itoken> SVLOG_REALTIME
%token <itoken> SVLOG_RESTRICT
%token <itoken> SVLOG_RTRANIF0
%token <itoken> SVLOG_RTRANIF1
%token <itoken> SVLOG_SCALARED
%token <itoken> SVLOG_SEQUENCE
%token <itoken> SVLOG_SHORTINT
%token <itoken> SVLOG_S_ALWAYS
%token <itoken> SVLOG_TIMEUNIT
%token <itoken> SVLOG_UNSIGNED
%token <itoken> SVLOG_VECTORED
%token <itoken> SVLOG_WILDCARD
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
%token <itoken> SVLOG_INCLUDE
%token <itoken> SVLOG_INITIAL
%token <itoken> SVLOG_INTEGER
%token <itoken> SVLOG_LIBRARY
%token <itoken> SVLOG_LIBLIST
%token <itoken> SVLOG_LONGINT
%token <itoken> SVLOG_MATCHES
%token <itoken> SVLOG_MODPORT
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
%token <itoken> SVLOG_TRANIF0
%token <itoken> SVLOG_TRANIF1
%token <itoken> SVLOG_UNIQUE0
%token <itoken> SVLOG_UNTYPED
%token <itoken> SVLOG_VIRTUAL
%token <itoken> SVLOG_ALWAYS
%token <itoken> SVLOG_ASSERT
%token <itoken> SVLOG_ASSIGN
%token <itoken> SVLOG_ASSUME
%token <itoken> SVLOG_BEFORE
%token <itoken> SVLOG_BINSOF
%token <itoken> SVLOG_BUFIF0
%token <itoken> SVLOG_BUFIF1
%token <itoken> SVLOG_CONFIG
%token <itoken> SVLOG_DESIGN
%token <itoken> SVLOG_EXPECT
%token <itoken> SVLOG_EXPORT
%token <itoken> SVLOG_EXTERN
%token <itoken> SVLOG_GENVAR
%token <itoken> SVLOG_GLOBAL
%token <itoken> SVLOG_HIGHZ0
%token <itoken> SVLOG_HIGHZ1
%token <itoken> SVLOG_IMPORT
%token <itoken> SVLOG_INSIDE
%token <itoken> SVLOG_MEDIUM
%token <itoken> SVLOG_MODULE
%token <itoken> SVLOG_NOTIF0
%token <itoken> SVLOG_NOTIF1
%token <itoken> SVLOG_OPTION
%token <itoken> SVLOG_OUTPUT
%token <itoken> SVLOG_PACKED
%token <itoken> SVLOG_PULLUP
%token <itoken> SVLOG_REPEAT
%token <itoken> SVLOG_RETURN
%token <itoken> SVLOG_SAMPLE
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
%token <itoken> SVLOG_ALIAS
%token <itoken> SVLOG_BEGIN
%token <itoken> SVLOG_BREAK
%token <itoken> SVLOG_CASEX
%token <itoken> SVLOG_CASEZ
%token <itoken> SVLOG_CLASS
%token <itoken> SVLOG_CONST
%token <itoken> SVLOG_COVER
%token <itoken> SVLOG_CROSS
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
%token <itoken> SVLOG_RCMOS
%token <itoken> SVLOG_RPMOS
%token <itoken> SVLOG_RNMOS
%token <itoken> SVLOG_RTRAN
%token <itoken> SVLOG_SOLVE
%token <itoken> SVLOG_SMALL
%token <itoken> SVLOG_SUPER
%token <itoken> SVLOG_TABLE
%token <itoken> SVLOG_TRIOR
%token <itoken> SVLOG_UNION
%token <itoken> SVLOG_UNTIL
%token <itoken> SVLOG_WEAK0
%token <itoken> SVLOG_WEAK1
%token <itoken> SVLOG_WHILE
%token <itoken> SVLOG_BIND
%token <itoken> SVLOG_BINS
%token <itoken> SVLOG_BYTE
%token <itoken> SVLOG_CASE
%token <itoken> SVLOG_CELL
%token <itoken> SVLOG_CMOS
%token <itoken> SVLOG_DIST
%token <itoken> SVLOG_EDGE
%token <itoken> SVLOG_ELSE
%token <itoken> SVLOG_ENUM
%token <itoken> SVLOG_FORK
%token <itoken> SVLOG_JOIN
%token <itoken> SVLOG_NAND
%token <itoken> SVLOG_NMOS
%token <itoken> SVLOG_NULL
%token <itoken> SVLOG_PMOS
%token <itoken> SVLOG_PURE
%token <itoken> SVLOG_RAND
%token <itoken> SVLOG_REAL
%token <itoken> SVLOG_SOFT
%token <itoken> SVLOG_STEP
%token <itoken> SVLOG_TASK
%token <itoken> SVLOG_THIS
%token <itoken> SVLOG_TIME
%token <itoken> SVLOG_TRAN
%token <itoken> SVLOG_TRI0
%token <itoken> SVLOG_TRI1
%token <itoken> SVLOG_TYPE
%token <itoken> SVLOG_VOID
%token <itoken> SVLOG_WAIT
%token <itoken> SVLOG_WAND
%token <itoken> SVLOG_WEAK
%token <itoken> SVLOG_WIRE
%token <itoken> SVLOG_WITH
%token <itoken> SVLOG_XNOR
%token <itoken> SVLOG_AND
%token <itoken> SVLOG_BIT
%token <itoken> SVLOG_BUF
%token <itoken> SVLOG_DPI
%token <itoken> SVLOG_END
%token <itoken> SVLOG_FOR
%token <itoken> SVLOG_IF_AND_ONLY_IF
%token <itoken> SVLOG_INT
%token <itoken> SVLOG_LET
%token <itoken> SVLOG_NEW
%token <itoken> SVLOG_NOR
%token <itoken> SVLOG_NOT
%token <itoken> SVLOG_REF
%token <itoken> SVLOG_REG
%token <itoken> SVLOG_STD
%token <itoken> SVLOG_TRI
%token <itoken> SVLOG_USE
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


%token <itoken> SVLOG_PATHPULSEDS
%token <itoken> SVLOG_DSWARNING
%token <itoken> SVLOG_HINCDIR
%token <itoken> SVLOG_DSERROR
%token <itoken> SVLOG_DSFATAL
%token <itoken> SVLOG_DPI_C
%token <itoken> SVLOG_1STEP
%token <itoken> SVLOG_DSINFO
%token <itoken> SVLOG_DSROOT
%token <itoken> SVLOG_DSUNIT
%token <itoken> SVLOG_INIT_VAL_APOST_LB0
%token <itoken> SVLOG_INIT_VAL_APOST_LB1
%token <itoken> SVLOG_INIT_VAL_APOST_LBLX
%token <itoken> SVLOG_INIT_VAL_APOST_LBCX
%token <itoken> SVLOG_INIT_VAL_APOST_CB0
%token <itoken> SVLOG_INIT_VAL_APOST_CB1
%token <itoken> SVLOG_INIT_VAL_APOST_CBLX
%token <itoken> SVLOG_INIT_VAL_APOST_CBCX


%token <itoken> LOGICAL_LEFT_SHIFT_ASSIGN
%token <itoken> LOGICAL_RIGHT_SHIFT_ASSIGN
%token <itoken> CYCLE_DELAY_ZERO_OR_MORE
%token <itoken> CYCLE_DELAY_ONE_OR_MORE
%token <itoken> EXPORT_DECLARATION
%token <itoken> CASE_EQUAL
%token <itoken> CASE_NOT_EQUAL
%token <itoken> LOGICAL_LEFT_SHIFT
%token <itoken> LOGICAL_RIGHT_SHIFT
%token <itoken> LEFT_SHIFT_ASSIGN
%token <itoken> RIGHT_SHIFT_ASSIGN
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
%token <itoken> BOUNDED_QUEUE_FINALIZE
%token <itoken> ABSOLUTE_TOLERANCE_RANGE
%token <itoken> RELATIVE_TOLERANCE_RANGE
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
%token <itoken> NON_BLOCK_ASSIGNMENT
%token <itoken> PARALLEL_CONNECTION
%token <itoken> DOUBLE_AT_SIGN
%token <itoken> BIT_WISE_AND_ASSIGN
%token <itoken> BIT_WISE_OR_ASSIGN
%token <itoken> BIT_WISE_XOR_ASSIGN
%token <itoken> MODULUS_ASSIGN
%token <itoken> DIVIDE_ASSIGN
%token <itoken> MULTIPLY_ASSIGN
%token <itoken> REDUCTION_ASSIGN
%token <itoken> ADDITION_ASSIGN
%token <itoken> LOGICAL_NOT
%token <itoken> BIT_WISE_XOR
%token <itoken> BIT_WISE_OR
%token <itoken> BIT_WISE_NOT
%token <itoken> BIT_WISE_AND
%token <itoken> APOSTROPHE


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

/***************************************************
 * Start of 'Library source text' Grammer Rules    *
 * Based off section: (A.1.1 Library source text). *
 ***************************************************/

/* Start of 'library_text' grammer rules */

library_text
	: library_description_recurse_or_null
	;

/* End of 'library_text' grammer rules */


/* Start of 'library_description' grammer rules */

library_description
	: library_declaration
	| include_statement
	| config_declaration
	| ';'
	;

library_description_recurse
	: library_description
	| library_description_recurse library_description
	;

library_description_recurse_or_null
	: %empty
	| library_description_recurse
	;

/* End of 'library_description' grammer rules */


/* Start of 'library_declaration' grammer rules */

incdir_file_path_spec_seq_list
	: SVLOG_HINCDIR file_path_spec_seq_list
	;

incdir_file_path_spec_seq_list_or_null
	: %empty
	| incdir_file_path_spec_seq_list
	;

library_declaration
	: SVLOG_LIBRARY identifier
		file_path_spec_seq_list
			incdir_file_path_spec_seq_list_or_null
	;

/* End of 'library_declaration' grammer rules */


/* Start of 'include_statement' grammer rules */

include_statement
	: SVLOG_INCLUDE file_path_spec ';'
	;

/* End of 'include_statement' grammer rules */

/***************************************************
 * End of 'Library source text' Grammer Rules      *
 * Based off section: (A.1.1 Library source text). *
 ***************************************************/


/*********************************************************
 * Start of 'SystemVerilog source text' Grammer Rules    *
 * Based off section: (A.1.2 SystemVerilog source text). *
 *********************************************************/

/* Start of 'source_text' grammer rules */

source_text
	: timeunits_declaration_or_null description_recurse_or_null
	;

/* End of 'source_text' grammer rules */


/* Start of 'description' grammer rules */

description
	: module_declaration
	| udp_declaration
	| interface_declaration
	| program_declaration
	| package_declaration
	| attribute_instance_recurse_or_null package_item
	| attribute_instance_recurse_or_null bind_directive
	| config_declaration
	;

description_recurse
	: description
	| description_recurse description
	;

description_recurse_or_null
	: %empty
	| description_recurse
	;

/* End of 'description' grammer rules */


/* Start of 'module_nonansi_header' grammer rules */

module_nonansi_header
	: attribute_instance_recurse_or_null module_keyword lifetime_or_null
		identifier package_import_declaration_recurse_or_null
			parameter_port_list_or_null list_of_ports ';'
	;

/* End of 'module_nonansi_header' grammer rules */


/* Start of 'module_ansi_header' grammer rules */

module_ansi_header
	: attribute_instance_recurse_or_null module_keyword lifetime_or_null
		identifier package_import_declaration_recurse_or_null
			parameter_port_list_or_null list_of_port_declarations_or_null ';'
	;

/* End of 'module_ansi_header' grammer rules */


/* Start of 'module_declaration' grammer rules */

module_declaration
	: module_nonansi_header timeunits_declaration_or_null
		module_item_recurse_or_null
			SVLOG_ENDMODULE colon_ident_or_null
	| module_ansi_header timeunits_declaration_or_null
		non_port_module_item_recurse_or_null
			SVLOG_ENDMODULE colon_ident_or_null
	| attribute_instance_recurse_or_null module_keyword
		lifetime_or_null identifier '(' '.' '*' ')' ';'
			timeunits_declaration_or_null module_item_recurse_or_null
				SVLOG_ENDMODULE colon_ident_or_null
	| SVLOG_EXTERN module_nonansi_header
	| SVLOG_EXTERN module_ansi_header
	;

/* End of 'module_declaration' grammer rules */


/* Start of 'module_keyword' grammer rules */

module_keyword
	: SVLOG_MODULE
	| SVLOG_MACROMODULE
	;

/* End of 'module_keyword' grammer rules */


/* Start of 'interface_declaration' grammer rules */

interface_declaration
	: interface_nonansi_header timeunits_declaration_or_null
		interface_item_recurse_or_null
			SVLOG_ENDINTERFACE colon_ident_or_null
	| interface_ansi_header timeunits_declaration_or_null
		non_port_interface_item_recurse_or_null
			SVLOG_ENDINTERFACE colon_ident_or_null
	| attribute_instance_recurse_or_null
		SVLOG_INTERFACE identifier '(' '.' '*' ')' ';'
			timeunits_declaration_or_null interface_item_recurse_or_null
				SVLOG_ENDINTERFACE colon_ident_or_null
	| SVLOG_EXTERN interface_nonansi_header
	| SVLOG_EXTERN interface_ansi_header
	;

/* End of 'interface_declaration' grammer rules */


/* Start of 'interface_nonansi_header' grammer rules */

interface_nonansi_header
	: attribute_instance_recurse_or_null
		SVLOG_INTERFACE lifetime_or_null identifier
			package_import_declaration_recurse_or_null
				parameter_port_list_or_null list_of_ports ';'
	;

/* End of 'interface_nonansi_header' grammer rules */


/* Start of 'interface_ansi_header' grammer rules */

interface_ansi_header
	: attribute_instance_recurse_or_null
		SVLOG_INTERFACE lifetime_or_null identifier
			package_import_declaration_recurse_or_null
				parameter_port_list_or_null
					list_of_port_declarations_or_null ';'
	;

/* End of 'interface_ansi_header' grammer rules */


/* Start of 'program_declaration' grammer rules */

program_declaration
	: program_nonansi_header timeunits_declaration_or_null
		program_item_recurse_or_null
			SVLOG_ENDPROGRAM colon_ident_or_null
	| program_ansi_header timeunits_declaration_or_null
		non_port_program_item_recurse_or_null
			SVLOG_ENDPROGRAM colon_ident_or_null
	| attribute_instance_recurse_or_null
		SVLOG_PROGRAM identifier '(' '.' '*' ')' ';'
			timeunits_declaration_or_null program_item_recurse_or_null
				SVLOG_ENDPROGRAM colon_ident_or_null
	| SVLOG_EXTERN program_nonansi_header
	| SVLOG_EXTERN program_ansi_header
	;

/* End of 'program_declaration' grammer rules */


/* Start of 'program_nonansi_header' grammer rules */

program_nonansi_header
	: attribute_instance_recurse_or_null
		SVLOG_PROGRAM lifetime_or_null identifier
			package_import_declaration_recurse_or_null
				parameter_port_list_or_null list_of_ports ';'
	;

/* End of 'program_nonansi_header' grammer rules */


/* Start of 'program_ansi_header' grammer rules */

program_ansi_header
	: attribute_instance_recurse_or_null
		SVLOG_PROGRAM lifetime_or_null identifier
			package_import_declaration_recurse_or_null
				parameter_port_list_or_null
					list_of_port_declarations_or_null ';'
	;

/* End of 'program_ansi_header' grammer rules */


/* Start of 'checker_declaration' grammer rules */

checker_declaration_cpl_or_null
	: %empty
	| '(' checker_port_list_or_null ')'
	;

checker_declaration_at_cogi
	: attribute_instance_recurse_or_null checker_or_generate_item
	;

checker_declaration_at_cogi_recurse
	: checker_declaration_at_cogi
	| checker_declaration_at_cogi_recurse checker_declaration_at_cogi
	;

checker_declaration_at_cogi_recurse_or_null
	: %empty
	| checker_declaration_at_cogi_recurse
	;

checker_declaration
	: SVLOG_CHECKER identifier checker_declaration_cpl_or_null ';'
		checker_declaration_at_cogi_recurse_or_null
			SVLOG_ENDCHECKER colon_ident_or_null
	;

/* End of 'checker_declaration' grammer rules */


/* Start of 'class_declaration' grammer rules */

class_decl_implements_interface_class_type_or_null
	: %empty
	| SVLOG_IMPLEMENTS interface_class_type_seq_list
	;

class_decl_loa_or_default_or_null
	: %empty
	| list_of_arguments
	| SVLOG_DEFAULT
	;

class_decl_extends_class_type_or_null
	: %empty
	| SVLOG_EXTENDES class_type
	| SVLOG_EXTENDES class_type '(' class_decl_loa_or_default_or_null ')'
	;

class_declaration
	: virtual_or_null SVLOG_CLASS final_specifier_or_null identifier
		parameter_port_list_or_null class_decl_extends_class_type_or_null
			class_decl_implements_interface_class_type_or_null ';'
				class_item_recurse_or_null SVLOG_ENDCLASS colon_ident_or_null
	;

/* End of 'class_declaration' grammer rules */


/* Start of 'interface_class_declaration' grammer rules */

interface_class_decl_extends_interface_class_type_or_null
	: %empty
	| SVLOG_EXTENDES interface_class_type_seq_list
	;

interface_class_declaration
	: SVLOG_INTERFACE SVLOG_CLASS identifier parameter_port_list_or_null
		interface_class_decl_extends_interface_class_type_or_null ';'
			interface_class_item_recurse_or_null
				SVLOG_ENDCLASS colon_ident_or_null
	;

/* End of 'interface_class_declaration' grammer rules */


/* Start of 'package_declaration' grammer rules */

package_decl_aipi
	: attribute_instance_recurse_or_null package_item
	;

package_decl_aipi_recurse
	: package_decl_aipi
	| package_decl_aipi_recurse package_decl_aipi
	;

package_decl_aipi_recurse_or_null
	: %empty
	| package_decl_aipi
	;

package_declaration
	: attribute_instance_recurse_or_null SVLOG_PACKAGE lifetime_or_null identifier ';'
		timeunits_declaration_or_null package_decl_aipi_recurse_or_null
				SVLOG_ENDPACKAGE colon_ident_or_null
	;

/* End of 'package_declaration' grammer rules */


/* Start of 'timeunits_declaration' grammer rules */

tdecl_forward_time_literal_or_null
	: %empty
	| '/' time_literal
	;

timeunits_declaration
	: SVLOG_TIMEUNIT time_literal tdecl_forward_time_literal_or_null ';'
	| SVLOG_TIMEPRECISION time_literal ';'
	| SVLOG_TIMEUNIT time_literal ';' SVLOG_TIMEPRECISION time_literal ';'
	| SVLOG_TIMEPRECISION time_literal ';' SVLOG_TIMEUNIT time_literal ;
	;

timeunits_declaration_or_null
	: %empty
	| timeunits_declaration
	;

/* End of 'timeunits_declaration' grammer rules */

/*********************************************************
 * End of 'SystemVerilog source text' Grammer Rules      *
 * Based off section: (A.1.2 SystemVerilog source text). *
 *********************************************************/


/***********************************************************
 * Start of 'Module parameters and ports' Grammer Rules    *
 * Based off section: (A.1.3 Module parameters and ports). *
 ***********************************************************/

/* Start of 'parameter_port_list' grammer rules */

parameter_port_list
	: '#' '(' ')'
	| '#' '(' list_of_param_assignments parameter_port_declaration_seq_list ')'
	| '#' '(' parameter_port_declaration_seq_list ')'
	;

parameter_port_list_or_null
	: %empty
	| parameter_port_list
	;

/* End of 'parameter_port_list' grammer rules */


/* Start of 'parameter_port_declaration' grammer rules */

parameter_port_declaration
	: parameter_declaration
	| local_parameter_declaration
	| data_type list_of_param_assignments
	| type_parameter_declaration
	;

parameter_port_declaration_seq_list
	: parameter_port_declaration
	| ',' parameter_port_declaration
	| parameter_port_declaration_seq_list ',' parameter_port_declaration
	;

/* End of 'parameter_port_declaration' grammer rules */


/* Start of 'list_of_ports' grammer rules */

list_of_ports
	: '(' port_seq_list ')'
	;

/* End of 'list_of_ports' grammer rules */


/* Start of 'list_of_port_declarations' grammer rules */

att_inst_ansi_port_decl_seq_list
	: attribute_instance_recurse_or_null ansi_port_declaration
	| att_inst_ansi_port_decl_seq_list ',' attribute_instance_recurse_or_null ansi_port_declaration
	;

list_of_port_declarations
	: '(' ')'
	| '(' att_inst_ansi_port_decl_seq_list ')'
	;

list_of_port_declarations_or_null
	: %empty
	| list_of_port_declarations
	;

/* End of 'list_of_port_declarations' grammer rules */


/* Start of 'port_declaration' grammer rules */

port_declaration
	: attribute_instance_recurse_or_null inout_declaration
	| attribute_instance_recurse_or_null input_declaration
	| attribute_instance_recurse_or_null output_declaration
	| attribute_instance_recurse_or_null ref_declaration
	| attribute_instance_recurse_or_null interface_port_declaration
	;

/* End of 'port_declaration' grammer rules */


/* Start of 'port' grammer rules */

port
	: port_expression_or_null
	| period_ident '(' port_expression_or_null ')'
	;

port_seq_list
	: port
	| port_seq_list ',' port
	;

/* End of 'port' grammer rules */


/* Start of 'port_expression' grammer rules */

port_expression
	: port_reference
	| '{' port_reference_seq_list '}'
	;

port_expression_or_null
	: %empty
	| port_expression
	;

/* End of 'port_expression' grammer rules */


/* Start of 'port_reference' grammer rules */

port_reference
	: identifier constant_select
	;

port_reference_seq_list
	: port_reference
	| port_reference_seq_list ',' port_reference
	;

/* End of 'port_reference' grammer rules */


/* Start of 'port_direction' grammer rules */

port_direction
	: SVLOG_INPUT
	| SVLOG_OUTPUT
	| SVLOG_INOUT
	| SVLOG_REF
	;

port_direction_or_null
	: %empty
	| port_direction
	;

/* End of 'port_direction' grammer rules */


/* Start of 'net_port_header' grammer rules */

net_port_header
	: port_direction_or_null net_port_type
	;

/* End of 'net_port_header' grammer rules */


/* Start of 'variable_port_header' grammer rules */

variable_port_header
	: port_direction_or_null variable_port_type
	;

variable_port_header_or_null
	: %empty
	| variable_port_header
	;

/* End of 'variable_port_header' grammer rules */


/* Start of 'interface_port_header' grammer rules */

interface_port_header
	: identifier period_ident_or_null
	| SVLOG_INTERFACE period_ident_or_null
	;

interface_port_header_or_null
	: %empty
	| interface_port_header
	;

/* End of 'interface_port_header' grammer rules */


/* Start of 'ansi_port_declaration' grammer rules */

net_or_interface_port_header
	: net_port_header
	| interface_port_header
	;

net_or_interface_port_header_or_null
	: %empty
	| net_or_interface_port_header
	;

ansi_port_declaration
	: net_or_interface_port_header_or_null identifier
		unpacked_dimension_recurse_or_null
			equal_constant_expression_or_null
	| variable_port_header_or_null identifier
		variable_dimension_recurse_or_null
			equal_constant_expression_or_null
	| port_direction_or_null period_ident '(' expression_or_null ')'
	;

/* End of 'ansi_port_declaration' grammer rules */

/***********************************************************
 * End of 'Module parameters and ports' Grammer Rules      *
 * Based off section: (A.1.3 Module parameters and ports). *
 ***********************************************************/


/********************************************
 * Start of 'Module items' Grammer Rules    *
 * Based off section: (A.1.4 Module items). *
 ********************************************/

/* Start of 'severity_system_task' grammer rules */

severity_system_task_loa_or_null
	: %empty
	| '(' list_of_arguments_or_null ')'
	;

severity_system_task_finish_num_loa_or_null
	: %empty
	| '(' finish_number ')'
	| '(' finish_number ',' list_of_arguments ')'
	;

severity_system_task
	: SVLOG_DSFATAL severity_system_task_finish_num_loa_or_null ';'
	| SVLOG_DSERROR severity_system_task_loa_or_null ';'
	| SVLOG_DSWARNING severity_system_task_loa_or_null ';'
	| SVLOG_DSINFO severity_system_task_loa_or_null ';'
	;

/* End of 'severity_system_task' grammer rules */


/* Start of 'finish_number' grammer rules */

finish_number
	: SVLOG_DIGIT
	;

/* End of 'finish_number' grammer rules */


/* Start of 'module_common_item' grammer rules */

module_common_item
	: module_or_generate_item_declaration
	| interface_instantiation
	| program_instantiation
	| assertion_item
	| bind_directive
	| continuous_assign
	| net_alias
	| initial_construct
	| final_construct
	| always_construct
	| loop_generate_construct
	| conditional_generate_construct
	| severity_system_task
	;

/* End of 'module_common_item' grammer rules */


/* Start of 'module_item' grammer rules */

module_item
	: port_declaration ';'
	| non_port_module_item
	;

module_item_recurse
	: module_item
	| module_item_recurse module_item
	;

module_item_recurse_or_null
	: %empty
	| module_item_recurse
	;

/* End of 'module_item' grammer rules */


/* Start of 'module_or_generate_item' grammer rules */

module_or_generate_item
	: attribute_instance_recurse_or_null parameter_override
	| attribute_instance_recurse_or_null gate_instantiation
	| attribute_instance_recurse_or_null udp_instantiation
	| attribute_instance_recurse_or_null module_instantiation
	| attribute_instance_recurse_or_null module_common_item
	;

/* End of 'module_or_generate_item' grammer rules */


/* Start of 'module_or_generate_item_declaration' grammer rules */

module_or_generate_item_declaration
	: package_or_generate_item_declaration
	| genvar_declaration
	| clocking_declaration
	| SVLOG_DEFAULT SVLOG_CLOCKING identifier ';'
	| SVLOG_DEFAULT SVLOG_DISABLE SVLOG_IF_AND_ONLY_IF expression_or_dist ';'
	;

/* End of 'module_or_generate_item_declaration' grammer rules */


/* Start of 'non_port_module_item' grammer rules */

non_port_module_item
	: generate_region
	| module_or_generate_item
	| specify_block
	| attribute_instance_recurse_or_null specparam_declaration
	| program_declaration
	| module_declaration
	| interface_declaration
	| timeunits_declaration
	;

non_port_module_item_recurse
	: non_port_module_item
	| non_port_module_item_recurse non_port_module_item
	;

non_port_module_item_recurse_or_null
	: %empty
	| non_port_module_item_recurse
	;

/* End of 'non_port_module_item' grammer rules */


/* Start of 'parameter_override' grammer rules */

parameter_override
	: SVLOG_DEFPARAM list_of_defparam_assignments ';'
	;

/* End of 'parameter_override' grammer rules */


/* Start of 'parameter_override' grammer rules */

colon_bind_ti_list_or_null
	: %empty
	| ':' bind_target_instance_list
	;

bind_directive
	: SVLOG_BIND identifier colon_bind_ti_list_or_null bind_instantiation ';'
	| SVLOG_BIND bind_target_instance bind_instantiation ';'
	;

/* End of 'parameter_override' grammer rules */


/* Start of 'bind_target_instance' grammer rules */

bind_target_instance
	: hierarchical_identifier constant_bit_select
	;

bind_target_instance_list
	: bind_target_instance
	| bind_target_instance_list ',' bind_target_instance
	;

/* End of 'bind_target_instance' grammer rules */


/* Start of 'bind_instantiation' grammer rules */

bind_instantiation
	: program_instantiation
	| module_instantiation
	| interface_instantiation
	| checker_instantiation
	;

/* End of 'bind_instantiation' grammer rules */

/********************************************
 * End of 'Module items' Grammer Rules      *
 * Based off section: (A.1.4 Module items). *
 ********************************************/


/*********************************************************
 * Start of 'Configuration source text' Grammer Rules    *
 * Based off section: (A.1.5 Configuration source text). *
 *********************************************************/

/* Start of 'config_declaration' grammer rules */

config_decl_local_param_decl
	: local_parameter_declaration ';'
	;

config_decl_local_param_decl_recurse
	: config_decl_local_param_decl
	| config_decl_local_param_decl_recurse config_decl_local_param_decl
	;

config_decl_local_param_decl_recurse_or_null
	: %empty
	| config_decl_local_param_decl_recurse
	;

config_declaration
	: SVLOG_CONFIG identifier ';'
		config_decl_local_param_decl_recurse_or_null
			design_statement config_rule_statement_recurse_or_null
				SVLOG_ENDCONFIG colon_ident_or_null
	;

/* End of 'config_declaration' grammer rules */


/* Start of 'design_statement' grammer rules */

design_statement_ident_recurse
	: ident_period_or_null identifier
	| design_statement_ident_recurse ident_period_or_null identifier
	;

design_statement_ident_recurse_or_null
	: %empty
	| design_statement_ident_recurse
	;

design_statement
	: SVLOG_DESIGN design_statement_ident_recurse_or_null ';'
	;

/* End of 'design_statement' grammer rules */


/* Start of 'config_rule_statement' grammer rules */

config_rule_statement
	: SVLOG_DEFAULT liblist_clause ';'
	| inst_clause liblist_clause ';'
	| inst_clause use_clause ';'
	| cell_clause liblist_clause ';'
	| cell_clause use_clause ';'
	;

config_rule_statement_recurse
	: config_rule_statement
	| config_rule_statement_recurse config_rule_statement
	;

config_rule_statement_recurse_or_null
	: %empty
	| config_rule_statement_recurse
	;

/* End of 'config_rule_statement' grammer rules */


/* Start of 'inst_clause' grammer rules */

inst_clause
	: SVLOG_INSTANCE inst_name
	;

/* End of 'inst_clause' grammer rules */


/* Start of 'inst_name' grammer rules */

inst_name
	: identifier period_ident_recurse_or_null
	;

/* End of 'inst_name' grammer rules */


/* Start of 'cell_clause' grammer rules */

cell_clause
	: SVLOG_CELL ident_period_or_null identifier
	;

/* End of 'cell_clause' grammer rules */


/* Start of 'liblist_clause' grammer rules */

liblist_clause
	: SVLOG_LIBLIST identifier_recurse_or_null
	;

/* End of 'liblist_clause' grammer rules */


/* Start of 'use_clause' grammer rules */

use_clause
	: SVLOG_USE period_ident_or_null
		identifier colon_config_or_null
	| SVLOG_USE named_parameter_assignment_seq_list
		colon_config_or_null
	| SVLOG_USE period_ident_or_null identifier
		named_parameter_assignment_seq_list colon_config_or_null
	;

/* End of 'use_clause' grammer rules */

/*********************************************************
 * End of 'Configuration source text' Grammer Rules      *
 * Based off section: (A.1.5 Configuration source text). *
 *********************************************************/


/***********************************************
 * Start of 'Interface items' Grammer Rules    *
 * Based off section: (A.1.6 Interface items). *
 ***********************************************/

/* Start of 'interface_or_generate_item' grammer rules */

interface_or_generate_item
	: attribute_instance_recurse_or_null module_common_item
	| attribute_instance_recurse_or_null extern_tf_declaration
	;

/* End of 'interface_or_generate_item' grammer rules */


/* Start of 'extern_tf_declaration' grammer rules */

extern_tf_declaration
	: SVLOG_EXTERN method_prototype ';'
	| SVLOG_EXTERN SVLOG_FORKJOIN task_prototype ';'
	;

/* End of 'extern_tf_declaration' grammer rules */


/* Start of 'interface_item' grammer rules */

interface_item
	: port_declaration ';'
	| non_port_interface_item
	;

interface_item_recurse
	: interface_item
	| interface_item_recurse interface_item
	;

interface_item_recurse_or_null
	: %empty
	| interface_item_recurse
	;

/* End of 'interface_item' grammer rules */


/* Start of 'non_port_interface_item' grammer rules */

non_port_interface_item
	: generate_region
	| interface_or_generate_item
	| program_declaration
	| modport_declaration
	| interface_declaration
	| timeunits_declaration
	;

non_port_interface_item_recurse
	: non_port_interface_item
	| non_port_interface_item_recurse non_port_interface_item
	;

non_port_interface_item_recurse_or_null
	: %empty
	| non_port_interface_item_recurse
	;

/* End of 'non_port_interface_item' grammer rules */

/***********************************************
 * End of 'Interface items' Grammer Rules      *
 * Based off section: (A.1.6 Interface items). *
 ***********************************************/


/*********************************************
 * Start of 'Program items' Grammer Rules    *
 * Based off section: (A.1.7 Program items). *
 *********************************************/

/* Start of 'program_item' grammer rules */

program_item
	: port_declaration ';'
	| non_port_program_item
	;

program_item_recurse
	: program_item
	| program_item_recurse program_item
	;

program_item_recurse_or_null
	: %empty
	| program_item_recurse
	;

/* End of 'program_item' grammer rules */


/* Start of 'non_port_program_item' grammer rules */

non_port_program_item
	: attribute_instance_recurse_or_null continuous_assign
	| attribute_instance_recurse_or_null module_or_generate_item_declaration
	| attribute_instance_recurse_or_null initial_construct
	| attribute_instance_recurse_or_null final_construct
	| attribute_instance_recurse_or_null concurrent_assertion_item
	| timeunits_declaration
	| program_generate_item
	;

non_port_program_item_recurse
	: non_port_program_item
	| non_port_program_item_recurse non_port_program_item
	;

non_port_program_item_recurse_or_null
	: %empty
	| non_port_program_item_recurse
	;

/* End of 'non_port_program_item' grammer rules */


/* Start of 'program_generate_item' grammer rules */

program_generate_item
	: loop_generate_construct
	| conditional_generate_construct
	| generate_region
	| severity_system_task
	;

/* End of 'program_generate_item' grammer rules */

/*********************************************
 * End of 'Program items' Grammer Rules      *
 * Based off section: (A.1.7 Program items). *
 *********************************************/


/*********************************************
 * Start of 'Checker items' Grammer Rules    *
 * Based off section: (A.1.8 Checker items). *
 *********************************************/

/* Start of 'checker_port_list' grammer rules */

checker_port_list
	: checker_port_item
	| checker_port_list ',' checker_port_item
	;

checker_port_list_or_null
	: %empty
	| checker_port_list
	;

/* End of 'checker_port_list' grammer rules */


/* Start of 'checker_port_item' grammer rules */

checker_port_item
	: attribute_instance_recurse_or_null checker_port_direction_or_null
		property_formal_type identifier variable_dimension_recurse_or_null
			equal_property_actual_arg_or_null
	;

/* End of 'checker_port_item' grammer rules */


/* Start of 'checker_port_direction' grammer rules */

checker_port_direction
	: SVLOG_INPUT
	| SVLOG_OUTPUT
	;

checker_port_direction_or_null
	: %empty
	| checker_port_direction
	;

/* End of 'checker_port_direction' grammer rules */


/* Start of 'checker_or_generate_item' grammer rules */

checker_or_generate_item
	: checker_or_generate_item_declaration
	| initial_construct
	| always_construct
	| final_construct
	| assertion_item
	| continuous_assign
	| checker_generate_item
	;

/* End of 'checker_or_generate_item' grammer rules */


/* Start of 'checker_or_generate_item_declaration' grammer rules */

checker_or_generate_item_declaration
	: rand_or_null data_declaration
	| function_declaration
	| checker_declaration
	| assertion_item_declaration
	| covergroup_declaration
	| genvar_declaration
	| clocking_declaration
	| SVLOG_DEFAULT SVLOG_CLOCKING identifier ';'
	| SVLOG_DEFAULT SVLOG_DISABLE SVLOG_IF_AND_ONLY_IF expression_or_dist ';'
	| ';'
	;

/* End of 'checker_or_generate_item_declaration' grammer rules */


/* Start of 'checker_generate_item' grammer rules */

checker_generate_item
	: loop_generate_construct
	| conditional_generate_construct
	| generate_region
	| severity_system_task
	;

/* End of 'checker_generate_item' grammer rules */

/*********************************************
 * End of 'Checker items' Grammer Rules      *
 * Based off section: (A.1.8 Checker items). *
 *********************************************/


/*******************************************
 * Start of 'Class items' Grammer Rules    *
 * Based off section: (A.1.9 Class items). *
 *******************************************/

/* Start of 'class_item' grammer rules */

class_item
	: attribute_instance_recurse_or_null class_property
	| attribute_instance_recurse_or_null class_method
	| attribute_instance_recurse_or_null class_constraint
	| attribute_instance_recurse_or_null class_declaration
	| attribute_instance_recurse_or_null interface_class_declaration
	| attribute_instance_recurse_or_null covergroup_declaration
	| local_parameter_declaration ';'
	| parameter_declaration ';'
	| ';'
	;

class_item_recurse
	: class_item
	| class_item_recurse class_item
	;

class_item_recurse_or_null
	: %empty
	| class_item_recurse
	;

/* End of 'class_item' grammer rules */


/* Start of 'class_property' grammer rules */

class_property
	: property_qualifier_recurse_or_null data_declaration
	| SVLOG_CONST class_item_qualifier_recurse_or_null data_type
		identifier equal_constant_expression ';'
	;

/* End of 'class_property' grammer rules */


/* Start of 'class_method' grammer rules */

class_method
	: method_qualifier_recurse_or_null task_declaration
	| method_qualifier_recurse_or_null function_declaration
	| SVLOG_PURE SVLOG_VIRTUAL class_item_qualifier_recurse_or_null method_prototype ';'
	| SVLOG_EXTERN method_qualifier_recurse_or_null method_prototype ';'
	| method_qualifier_recurse_or_null class_constructor_declaration
	| SVLOG_EXTERN method_qualifier_recurse_or_null class_constructor_declaration
	;

/* End of 'class_method' grammer rules */


/* Start of 'class_constructor_declaration' grammer rules */

class_const_decl_super_new_loa_default
	: SVLOG_SUPER '.' SVLOG_NEW ';'
	| SVLOG_SUPER '.' SVLOG_NEW '(' ')' ';'
	| SVLOG_SUPER '.' SVLOG_NEW '(' SVLOG_DEFAULT ')' ';'
	| SVLOG_SUPER '.' SVLOG_NEW '(' list_of_arguments ')' ';'
	;

class_const_decl_super_new_loa_default_or_null
	: %empty
	| class_const_decl_super_new_loa_default
	;

class_const_decl_cc_arg_list
	: '(' ')'
	| '(' class_constructor_arg_list ')'
	;

class_const_decl_cc_arg_list_or_null
	: %empty
	| class_const_decl_cc_arg_list
	;

class_constructor_declaration
	: SVLOG_FUNCTION class_scope_or_null SVLOG_NEW class_const_decl_cc_arg_list_or_null ';'
		block_item_declaration_recurse_or_null class_const_decl_super_new_loa_default_or_null
			function_statement_or_null_recurse_or_null
				SVLOG_ENDFUNCTION colon_new_or_null
	;

/* End of 'class_constructor_declaration' grammer rules */


/* Start of 'class_constructor_prototype' grammer rules */

class_constructor_prototype
	: SVLOG_FUNCTION SVLOG_NEW ';'
	| SVLOG_FUNCTION SVLOG_NEW '(' ')' ';'
	| SVLOG_FUNCTION SVLOG_NEW '(' class_constructor_arg_list ')' ';'
	;

/* End of 'class_constructor_prototype' grammer rules */


/* Start of 'class_constructor_arg_list' grammer rules */

class_constructor_arg_list
	: class_constructor_arg
	| class_constructor_arg_list ',' class_constructor_arg
	;

/* End of 'class_constructor_arg_list' grammer rules */


/* Start of 'class_constructor_arg' grammer rules */

class_constructor_arg
	: tf_port_item
	| SVLOG_DEFAULT
	;

/* End of 'class_constructor_arg' grammer rules */


/* Start of 'interface_class_item' grammer rules */

interface_class_item
	: type_declaration
	| attribute_instance_recurse_or_null interface_class_method
	| local_parameter_declaration ';'
	| parameter_declaration ';'
	| ';'
	;

interface_class_item_recurse
	: interface_class_item
	| interface_class_item_recurse interface_class_item
	;

interface_class_item_recurse_or_null
	: %empty
	| interface_class_item_recurse
	;

/* End of 'interface_class_item' grammer rules */


/* Start of 'interface_class_method' grammer rules */

interface_class_method
	: SVLOG_PURE SVLOG_VIRTUAL method_prototype ';'
	;

/* End of 'interface_class_method' grammer rules */


/* Start of 'class_constraint' grammer rules */

class_constraint
	: constraint_prototype
	| constraint_declaration
	;

/* End of 'class_constraint' grammer rules */


/* Start of 'class_item_qualifier' grammer rules */

class_item_qualifier
	: SVLOG_STATIC
	| SVLOG_PROTECTED
	| SVLOG_LOCAL
	;

class_item_qualifier_recurse
	: class_item_qualifier
	| class_item_qualifier_recurse class_item_qualifier
	;

class_item_qualifier_recurse_or_null
	: %empty
	| class_item_qualifier_recurse
	;

/* End of 'class_item_qualifier' grammer rules */


/* Start of 'property_qualifier' grammer rules */

property_qualifier
	: random_qualifier
	| class_item_qualifier
	;

property_qualifier_recurse
	: property_qualifier
	| property_qualifier_recurse property_qualifier
	;

property_qualifier_recurse_or_null
	: %empty
	| property_qualifier_recurse
	;

/* End of 'property_qualifier' grammer rules */


/* Start of 'random_qualifier' grammer rules */

random_qualifier
	: SVLOG_RAND
	| SVLOG_RANDC
	;

random_qualifier_or_null
	: %empty
	| random_qualifier
	;

/* End of 'random_qualifier' grammer rules */


/* Start of 'method_qualifier' grammer rules */

method_qualifier
	: SVLOG_VIRTUAL
	| SVLOG_PURE SVLOG_VIRTUAL
	| class_item_qualifier
	;

method_qualifier_recurse
	: method_qualifier
	| method_qualifier_recurse method_qualifier
	;

method_qualifier_recurse_or_null
	: %empty
	| method_qualifier_recurse
	;

/* End of 'method_qualifier' grammer rules */


/* Start of 'method_prototype' grammer rules */

method_prototype
	: task_prototype
	| function_prototype
	;

/* End of 'method_prototype' grammer rules */

/*******************************************
 * End of 'Class items' Grammer Rules      *
 * Based off section: (A.1.9 Class items). *
 *******************************************/


/********************************************
 * Start of 'Constraints' Grammer Rules     *
 * Based off section: (A.1.10 Constraints). *
 ********************************************/

/* Start of 'constraint_declaration' grammer rules */

constraint_declaration
	: static_or_null SVLOG_CONSTRAINT
		dynamic_override_specifiers_or_null
			identifier constraint_block
	;

/* End of 'constraint_declaration' grammer rules */


/* Start of 'constraint_block' grammer rules */

constraint_block
	: '{' constraint_block_item_recurse_or_null '}'
	;

/* End of 'constraint_block' grammer rules */


/* Start of 'constraint_block_item' grammer rules */

constraint_block_item
	: SVLOG_SOLVE solve_before_list SVLOG_BEFORE solve_before_list ';'
	| constraint_expression
	;

constraint_block_item_recurse
	: constraint_block_item
	| constraint_block_item_recurse constraint_block_item
	;

constraint_block_item_recurse_or_null
	: %empty
	| constraint_block_item_recurse
	;

/* End of 'constraint_block_item' grammer rules */


/* Start of 'solve_before_list' grammer rules */

solve_before_list
	: constraint_primary
	| solve_before_list ',' constraint_primary
	;

/* End of 'solve_before_list' grammer rules */


/* Start of 'constraint_primary' grammer rules */

constraint_primary_hident_select
	: hierarchical_identifier select
	| hierarchical_identifier select '(' ')'
	;

constraint_primary_impl_class_handle_or_class_scope
	: implicit_class_handle '.'
	| class_scope
	;

constraint_primary
	: constraint_primary_impl_class_handle_or_class_scope
		constraint_primary_hident_select
	;

/* End of 'constraint_primary' grammer rules */


/* Start of 'constraint_expression' grammer rules */

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

constraint_expression_recurse
	: constraint_expression
	| constraint_expression_recurse constraint_expression
	;

constraint_expression_recurse_or_null
	: %empty
	| constraint_expression_recurse
	;

/* End of 'constraint_expression' grammer rules */


/* Start of 'uniqueness_constraint' grammer rules */

uniqueness_constraint
	: SVLOG_UNIQUE '{' range_list '}'
	;

/* End of 'uniqueness_constraint' grammer rules */


/* Start of 'constraint_set' grammer rules */

constraint_set
	: constraint_expression
	| '{' constraint_expression_recurse_or_null '}'
	;

/* End of 'constraint_set' grammer rules */


/* Start of 'expression_or_dist' grammer rules */

expression_or_dist
	: expression
	| expression SVLOG_DIST '{' dist_list '}'
	;

expression_or_dist_seq_list
	: expression_or_dist
	| expression_or_dist_seq_list ',' expression_or_dist
	;

/* End of 'expression_or_dist' grammer rules */


/* Start of 'dist_list' grammer rules */

dist_list
	: dist_item
	| dist_list ',' dist_item
	;

/* End of 'dist_list' grammer rules */


/* Start of 'dist_item' grammer rules */

dist_item
	: value_range
	| value_range dist_weight
	| SVLOG_DEFAULT DISTRIBUTED_WEIGHT_OPERATOR expression
	;

/* End of 'dist_item' grammer rules */


/* Start of 'dist_weight' grammer rules */

dist_weight
	: EQUAL_WEIGHT_OPERATOR expression
	| DISTRIBUTED_WEIGHT_OPERATOR expression
	;

/* End of 'dist_weight' grammer rules */


/* Start of 'constraint_prototype' grammer rules */

constraint_prototype
	: constraint_prototype_qualifier_or_null static_or_null
		SVLOG_CONSTRAINT dynamic_override_specifiers_or_null
			identifier ';'
	;

/* End of 'constraint_prototype' grammer rules */


/* Start of 'constraint_prototype_qualifier' grammer rules */

constraint_prototype_qualifier
	: SVLOG_EXTERN
	| SVLOG_PURE
	;

constraint_prototype_qualifier_or_null
	: %empty
	| constraint_prototype_qualifier
	;

/* End of 'constraint_prototype_qualifier' grammer rules */


/* Start of 'extern_constraint_declaration' grammer rules */

extern_constraint_declaration
	: static_or_null SVLOG_CONSTRAINT
		dynamic_override_specifiers_or_null
			class_scope identifier constraint_block
	;

/* End of 'extern_constraint_declaration' grammer rules */

/********************************************
 * End of 'Constraints' Grammer Rules       *
 * Based off section: (A.1.10 Constraints). *
 ********************************************/


/**********************************************
 * Start of 'Package items' Grammer Rules     *
 * Based off section: (A.1.11 Package items). *
 **********************************************/

/* Start of 'package_item' grammer rules */

package_item
	: package_or_generate_item_declaration
	| anonymous_program
	| package_export_declaration
	| timeunits_declaration
	;

/* End of 'package_item' grammer rules */


/* Start of 'package_or_generate_item_declaration' grammer rules */

package_or_generate_item_declaration
	: net_declaration
	| data_declaration
	| task_declaration
	| function_declaration
	| checker_declaration
	| dpi_import_export
	| extern_constraint_declaration
	| class_declaration
	| interface_class_declaration
	| class_constructor_declaration
	| local_parameter_declaration ';'
	| parameter_declaration ';'
	| covergroup_declaration
	| assertion_item_declaration
	| ';'
	;

/* End of 'package_or_generate_item_declaration' grammer rules */


/* Start of 'anonymous_program' grammer rules */

anonymous_program
	: SVLOG_PROGRAM ';'
		anonymous_program_item_recurse_or_null
			SVLOG_ENDPROGRAM
	;

/* End of 'anonymous_program' grammer rules */


/* Start of 'anonymous_program_item' grammer rules */

anonymous_program_item
	: task_declaration
	| function_declaration
	| class_declaration
	| interface_class_declaration
	| covergroup_declaration
	| class_constructor_declaration
	| ';'
	;

anonymous_program_item_recurse
	: anonymous_program_item
	| anonymous_program_item_recurse anonymous_program_item
	;

anonymous_program_item_recurse_or_null
	: %empty
	| anonymous_program_item_recurse
	;

/* End of 'anonymous_program_item' grammer rules */

/**********************************************
 * End of 'Package items' Grammer Rules       *
 * Based off section: (A.1.11 Package items). *
 **********************************************/


/***************************************************************
 * Start of 'Module parameter declarations' Grammer Rules      *
 * Based off section: (A.2.1.1 Module parameter declarations). *
 ***************************************************************/

/* Start of 'local_parameter_declaration' grammer rules */

local_parameter_declaration
	: SVLOG_LOCALPARAM data_type_or_implicit list_of_param_assignments
	| SVLOG_PARAMETER type_parameter_declaration
	;

/* End of 'local_parameter_declaration' grammer rules */


/* Start of 'parameter_declaration' grammer rules */

parameter_declaration
	: SVLOG_PARAMETER data_type_or_implicit list_of_param_assignments
	| SVLOG_PARAMETER type_parameter_declaration
	;

/* End of 'parameter_declaration' grammer rules */


/* Start of 'type_parameter_declaration' grammer rules */

type_parameter_declaration
	: SVLOG_TYPE list_of_type_assignments
	| SVLOG_TYPE forward_type list_of_type_assignments
	;

/* End of 'type_parameter_declaration' grammer rules */


/* Start of 'specparam_declaration' grammer rules */

specparam_declaration
	: SVLOG_SPECPARAM list_of_specparam_assignments ';'
	| SVLOG_SPECPARAM packed_dimension list_of_specparam_assignments ';'
	;

/* End of 'specparam_declaration' grammer rules */

/***************************************************************
 * End of 'Module parameter declarations' Grammer Rules        *
 * Based off section: (A.2.1.1 Module parameter declarations). *
 ***************************************************************/


/***************************************************
 * Start of 'Port declarations' Grammer Rules      *
 * Based off section: (A.2.1.2 Port declarations). *
 ***************************************************/

/* Start of 'inout_declaration' grammer rules */

inout_declaration
	: SVLOG_INOUT net_port_type list_of_port_identifiers
	;

/* End of 'inout_declaration' grammer rules */


/* Start of 'input_declaration' grammer rules */

input_declaration
	: SVLOG_INPUT net_port_type list_of_port_identifiers
	| SVLOG_INPUT variable_port_type list_of_variable_identifiers
	;

/* End of 'input_declaration' grammer rules */


/* Start of 'output_declaration' grammer rules */

output_declaration
	: SVLOG_OUTPUT net_port_type list_of_port_identifiers
	| SVLOG_OUTPUT variable_port_type list_of_variable_port_identifiers
	;

/* End of 'output_declaration' grammer rules */


/* Start of 'interface_port_declaration' grammer rules */

interface_port_declaration
	: identifier list_of_interface_identifiers
	| ident_period identifier list_of_interface_identifiers
	;

/* End of 'interface_port_declaration' grammer rules */


/* Start of 'ref_declaration' grammer rules */

ref_declaration
	: SVLOG_REF variable_port_type list_of_variable_identifiers
	;

/* End of 'ref_declaration' grammer rules */

/***************************************************
 * End of 'Port declarations' Grammer Rules        *
 * Based off section: (A.2.1.2 Port declarations). *
 ***************************************************/


/***************************************************
 * Start of 'Type declarations' Grammer Rules      *
 * Based off section: (A.2.1.3 Type declarations). *
 ***************************************************/

/* Start of 'data_declaration' grammer rules */

data_declaration
	: const_or_null var_or_null lifetime_or_null
		data_type_or_implicit list_of_variable_decl_assignments ';'
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

/* End of 'data_declaration' grammer rules */


/* Start of 'package_import_declaration' grammer rules */

package_import_declaration
	: SVLOG_IMPORT package_import_item_seq_list ';'
	;

package_import_declaration_recurse
	: package_import_declaration
	| package_import_declaration_recurse package_import_declaration
	;

package_import_declaration_recurse_or_null
	: %empty
	| package_import_declaration_recurse
	;

/* End of 'package_import_declaration' grammer rules */


/* Start of 'package_export_declaration' grammer rules */

package_export_declaration
	: SVLOG_EXPORT EXPORT_DECLARATION ';'
	| SVLOG_EXPORT package_import_item_seq_list ';'
	;

package_export_declaration_recurse
	: package_export_declaration
	| package_export_declaration_recurse package_export_declaration
	;

package_export_declaration_recurse_or_null
	: %empty
	| package_export_declaration_recurse
	;

/* End of 'package_export_declaration' grammer rules */


/* Start of 'package_import_item' grammer rules */

package_import_item
	: identifier CLASS_SCOPE_OPERATOR identifier
	| identifier CLASS_SCOPE_OPERATOR '*'
	;

package_import_item_seq_list
	: package_import_item
	| package_import_item_seq_list ',' package_import_item
	;

/* End of 'package_import_item' grammer rules */


/* Start of 'genvar_declaration' grammer rules */

genvar_declaration
	: SVLOG_GENVAR list_of_genvar_identifiers ';'
	;

/* End of 'genvar_declaration' grammer rules */


/* Start of 'net_declaration' grammer rules */

vectored_or_scalared
	: SVLOG_VECTORED
	| SVLOG_SCALARED
	;

vectored_or_scalared_or_null
	: %empty
	| vectored_or_scalared
	;

net_ident_ud_seq_list
	: identifier unpacked_dimension_recurse_or_null
	| net_ident_ud_seq_list ',' identifier unpacked_dimension_recurse_or_null
	;

net_declaration
	: net_type drive_or_charge_strength_or_null vectored_or_scalared_or_null
		data_type_or_implicit delay3_or_null list_of_net_decl_assignments ';'
	| identifier delay_control_or_null
		list_of_net_decl_assignments ';'
	| SVLOG_INTERCONNECT implicit_data_type
		delay_or_null net_ident_ud_seq_list ';'
	;

/* End of 'net_declaration' grammer rules */


/* Start of 'type_declaration' grammer rules */

type_declaration
	: SVLOG_TYPEDEF data_type_or_incomplete_class_scoped_type
		identifier variable_dimension_recurse_or_null ';'
	| SVLOG_TYPEDEF identifier constant_bit_select
		period_ident identifier ';'
	| SVLOG_TYPEDEF forward_type_or_null identifier ';'
	;

/* End of 'type_declaration' grammer rules */


/* Start of 'forward_type' grammer rules */

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

/* End of 'forward_type' grammer rules */


/* Start of 'nettype_declaration' grammer rules */

nettype_declaration_with
	: SVLOG_WITH class_or_package_scope_or_null identifier
	;

nettype_declaration_with_or_null
	: %empty
	| nettype_declaration_with
	;

nettype_declaration
	: SVLOG_NETTYPE data_type identifier
		nettype_declaration_with_or_null ';'
	| SVLOG_NETTYPE class_or_package_scope_or_null
		identifier identifier ';'
	;

/* End of 'nettype_declaration' grammer rules */


/* Start of 'lifetime' grammer rules */

lifetime
	: SVLOG_STATIC
	| SVLOG_AUTOMATIC
	;

lifetime_or_null
	: %empty
	| lifetime
	;

/* End of 'lifetime' grammer rules */

/***************************************************
 * End of 'Type declarations' Grammer Rules        *
 * Based off section: (A.2.1.3 Type declarations). *
 ***************************************************/


/********************************************************
 * Start of 'Net and variable types' Grammer Rules      *
 * Based off section: (A.2.2.1 Net and variable types). *
 ********************************************************/

/* Start of 'casting_type' grammer rules */

casting_type
	: simple_type
	| constant_primary
	| signing
	| SVLOG_STRING
	| SVLOG_CONST
	;

/* End of 'casting_type' grammer rules */


/* Start of 'data_type' grammer rules */

packed_signing
	: SVLOG_PACKED
	| SVLOG_PACKED signing
	;

packed_signing_or_null
	: %empty
	| packed_signing
	;

data_type
	: integer_vector_type signing_or_null
		packed_dimension_recurse_or_null
	| integer_atom_type signing_or_null
	| non_integer_type
	| struct_union packed_signing_or_null
		'{' struct_union_member_recurse '}'
			packed_dimension_recurse_or_null
	| SVLOG_ENUM enum_base_type_or_null
		'{' enum_name_declaration_seq_list '}'
			packed_dimension_recurse_or_null
	| SVLOG_STRING
	| SVLOG_CHANDLE
	| SVLOG_VIRTUAL interface_or_null identifier
		parameter_value_assignment_or_null
			period_ident_or_null
	| class_or_package_scope_or_null identifier
		packed_dimension_recurse_or_null
	| class_type
	| SVLOG_EVENT
	| ps_covergroup_identifier
	| type_reference
	;

/* End of 'data_type' grammer rules */


/* Start of 'data_type_or_implicit' grammer rules */

data_type_or_implicit
	: data_type
	| implicit_data_type
	;

data_type_or_implicit_or_null
	: %empty
	| data_type_or_implicit
	;

/* End of 'data_type_or_implicit' grammer rules */


/* Start of 'implicit_data_type' grammer rules */

implicit_data_type
	: signing_or_null packed_dimension_recurse_or_null
	;

/* End of 'implicit_data_type' grammer rules */


/* Start of 'enum_base_type' grammer rules */

enum_base_type
	: integer_atom_type signing_or_null
	| integer_vector_type signing_or_null
		packed_dimension_or_null
	| identifier packed_dimension_or_null
	;

enum_base_type_or_null
	: %empty
	| enum_base_type
	;

/* End of 'enum_base_type' grammer rules */


/* Start of 'enum_name_declaration' grammer rules */

enum_name_declaration
	: identifier
	| identifier '[' integral_number ']'
	| identifier '[' integral_number ':' integral_number ']'
	| identifier '[' integral_number ':' integral_number ']' '=' constant_expression
	| identifier '=' constant_expression
	;

enum_name_declaration_seq_list
	: enum_name_declaration
	| enum_name_declaration_seq_list ',' enum_name_declaration
	;

enum_name_declaration_seq_list_or_null
	: %empty
	| enum_name_declaration_seq_list
	;

/* End of 'enum_name_declaration' grammer rules */


/* Start of 'class_scope' grammer rules */

class_scope
	: class_type CLASS_SCOPE_OPERATOR
	;

class_scope_or_null
	: %empty
	| class_scope
	;

/* End of 'class_scope' grammer rules */


/* Start of 'class_type' grammer rules */

class_type_ident_seq_list
	: CLASS_SCOPE_OPERATOR identifier
		parameter_value_assignment_or_null
	| class_type_ident_seq_list CLASS_SCOPE_OPERATOR
		identifier parameter_value_assignment_or_null
	;

class_type_ident_seq_list_or_null
	: %empty
	| class_type_ident_seq_list
	;

class_type
	: ps_class_identifier
		parameter_value_assignment_or_null
			class_type_ident_seq_list_or_null
	;

/* End of 'class_type' grammer rules */


/* Start of 'interface_class_type' grammer rules */

interface_class_type
	: ps_class_identifier parameter_value_assignment_or_null
	;

interface_class_type_or_null
	: %empty
	| interface_class_type
	;

interface_class_type_seq_list
	: interface_class_type
	| interface_class_type_seq_list ',' interface_class_type
	;

interface_class_type_seq_list_or_null
	: %empty
	| interface_class_type_seq_list
	;

/* End of 'interface_class_type' grammer rules */


/* Start of 'integer_type' grammer rules */

integer_type
	: integer_vector_type
	| integer_atom_type
	;

/* End of 'integer_type' grammer rules */


/* Start of 'integer_atom_type' grammer rules */

integer_atom_type
	: SVLOG_BYTE
	| SVLOG_SHORTINT
	| SVLOG_INT
	| SVLOG_LONGINT
	| SVLOG_INTEGER
	| SVLOG_TIME
	;

/* End of 'integer_atom_type' grammer rules */


/* Start of 'integer_vector_type' grammer rules */

integer_vector_type
	: SVLOG_BIT
	| SVLOG_LOGIC
	| SVLOG_REG
	;

/* End of 'integer_vector_type' grammer rules */


/* Start of 'non_integer_type' grammer rules */

non_integer_type
	: SVLOG_SHORTREAL
	| SVLOG_REAL
	| SVLOG_REALTIME
	;

/* End of 'non_integer_type' grammer rules */


/* Start of 'net_type' grammer rules */

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

net_type_or_null
	: %empty
	| net_type
	;

/* End of 'net_type' grammer rules */


/* Start of 'net_port_type' grammer rules */

net_port_type
	: net_type_or_null data_type_or_implicit
	| identifier
	| SVLOG_INTERCONNECT implicit_data_type
	;

/* End of 'net_port_type' grammer rules */


/* Start of 'variable_port_type' grammer rules */

variable_port_type
	: var_data_type
	;

/* End of 'variable_port_type' grammer rules */


/* Start of 'var_data_type' grammer rules */

var_data_type
	: data_type
	| SVLOG_VAR data_type_or_implicit
	;

/* End of 'var_data_type' grammer rules */


/* Start of 'signing' grammer rules */

signing
	: SVLOG_SIGNED
	| SVLOG_UNSIGNED
	;

signing_or_null
	: %empty
	| signing
	;

/* End of 'signing' grammer rules */


/* Start of 'simple_type' grammer rules */

simple_type
	: integer_type
	| non_integer_type
	| ps_type_identifier
	| ps_parameter_identifier
	;

/* End of 'simple_type' grammer rules */


/* Start of 'struct_union' grammer rules */

struct_union
	: SVLOG_STRUCT
	| SVLOG_UNION SVLOG_SOFT
	| SVLOG_UNION SVLOG_TAGGED
	;

/* End of 'struct_union' grammer rules */


/* Start of 'struct_union_member' grammer rules */

struct_union_member
	: attribute_instance_recurse_or_null random_qualifier_or_null
		data_type_or_void list_of_variable_decl_assignments ';'
	;

struct_union_member_recurse
	: struct_union_member
	| struct_union_member_recurse struct_union_member
	;

struct_union_member_recurse_or_null
	: %empty
	| struct_union_member_recurse
	;

/* End of 'struct_union_member' grammer rules */


/* Start of 'data_type_or_void' grammer rules */

data_type_or_void
	: data_type
	| SVLOG_VOID
	;

data_type_or_void_or_null
	: %empty
	| data_type_or_void
	;

/* End of 'data_type_or_void' grammer rules */


/* Start of 'type_reference' grammer rules */

type_reference
	: SVLOG_TYPE '(' expression ')'
	| SVLOG_TYPE '(' data_type_or_incomplete_class_scoped_type ')'
	;

/* End of 'type_reference' grammer rules */


/* Start of 'data_type_or_incomplete_class_scoped_type' grammer rules */

data_type_or_incomplete_class_scoped_type
	: data_type
	| incomplete_class_scoped_type
	;

/* End of 'data_type_or_incomplete_class_scoped_type' grammer rules */


/* Start of 'incomplete_class_scoped_type' grammer rules */

incomplete_class_scoped_type
	: identifier CLASS_SCOPE_OPERATOR
		type_identifier_or_class_type
	| incomplete_class_scoped_type
		CLASS_SCOPE_OPERATOR
			type_identifier_or_class_type
	;

/* End of 'incomplete_class_scoped_type' grammer rules */


/* Start of 'type_identifier_or_class_type' grammer rules */

type_identifier_or_class_type
	: identifier
	| class_type
	;

/* End of 'type_identifier_or_class_type' grammer rules */

/********************************************************
 * End of 'Net and variable types' Grammer Rules        *
 * Based off section: (A.2.2.1 Net and variable types). *
 ********************************************************/


/*******************************************
 * Start of 'Strengths' Grammer Rules      *
 * Based off section: (A.2.2.2 Strengths). *
 *******************************************/

/* Start of 'drive_strength' grammer rules */

drive_strength
	: '(' strength0 ',' strength1 ')'
	| '(' strength1 ',' strength0 ')'
	| '(' strength0 ',' SVLOG_HIGHZ1 ')'
	| '(' strength1 ',' SVLOG_HIGHZ0 ')'
	| '(' SVLOG_HIGHZ0 ',' strength1 ')'
	| '(' SVLOG_HIGHZ1 ',' strength0 ')'
	;

drive_strength_or_null
	: %empty
	| drive_strength
	;

/* End of 'drive_strength' grammer rules */


/* Start of 'strength0' grammer rules */

strength0
	: SVLOG_SUPPLY0
	| SVLOG_STRONG0
	| SVLOG_PULL0
	| SVLOG_WEAK0
	;

/* End of 'strength0' grammer rules */


/* Start of 'strength1' grammer rules */

strength1
	: SVLOG_SUPPLY1
	| SVLOG_STRONG1
	| SVLOG_PULL1
	| SVLOG_WEAK1
	;

/* End of 'strength1' grammer rules */


/* Start of 'charge_strength' grammer rules */

charge_strength
	: '(' SVLOG_SMALL ')'
	| '(' SVLOG_MEDIUM ')'
	| '(' SVLOG_LARGE ')'
	;

/* End of 'charge_strength' grammer rules */


/* Start of 'drive_or_charge_strength' grammer rules */

drive_or_charge_strength
	: drive_strength
	| charge_strength
	;

drive_or_charge_strength_or_null
	: %empty
	| drive_or_charge_strength
	;

/* End of 'drive_or_charge_strength' grammer rules */

/*******************************************
 * End of 'Strengths' Grammer Rules        *
 * Based off section: (A.2.2.2 Strengths). *
 *******************************************/


/****************************************
 * Start of 'Delays' Grammer Rules      *
 * Based off section: (A.2.2.3 Delays). *
 ****************************************/

/* Start of 'delay' grammer rules */

delay
	: '#' delay_value
	;

delay_or_null
	: %empty
	| delay
	;

/* End of 'delay' grammer rules */


/* Start of 'delay2' grammer rules */

delay2
	: delay
	| '#' '(' mintypmax_expression ')'
	| '#' '(' mintypmax_expression ',' mintypmax_expression ')'
	;

delay2_or_null
	: %empty
	| delay2
	;

/* End of 'delay2' grammer rules */


/* Start of 'delay3' grammer rules */

delay3
	: delay2
	| '#' '(' mintypmax_expression ',' mintypmax_expression ',' mintypmax_expression ')'
	;

delay3_or_null
	: %empty
	| delay3
	;

/* End of 'delay3' grammer rules */


/* Start of 'delay_value' grammer rules */

delay_value
	: unsigned_number
	| real_number
	| ps_identifier
	| time_literal
	| SVLOG_1STEP
	;

delay_value_or_null
	: %empty
	| delay_value
	;

/* End of 'delay_value' grammer rules */

/****************************************
 * End of 'Delays' Grammer Rules        *
 * Based off section: (A.2.2.3 Delays). *
 ****************************************/


/*************************************************
 * Start of 'Declaration lists' Grammer Rules    *
 * Based off section: (A.2.3 Declaration lists). *
 *************************************************/

/* Start of 'list_of_defparam_assignments' grammer rules */

list_of_defparam_assignments
	: defparam_assignment
	| list_of_defparam_assignments ',' defparam_assignment
	;

/* End of 'list_of_defparam_assignments' grammer rules */


/* Start of 'list_of_genvar_identifiers' grammer rules */

list_of_genvar_identifiers
	: identifier
	| list_of_genvar_identifiers ',' identifier
	;

/* End of 'list_of_genvar_identifiers' grammer rules */


/* Start of 'list_of_interface_identifiers' grammer rules */

list_of_interface_identifiers
	: identifier unpacked_dimension_recurse_or_null
	| list_of_interface_identifiers ',' identifier
		unpacked_dimension_recurse_or_null
	;

/* End of 'list_of_interface_identifiers' grammer rules */


/* Start of 'list_of_net_decl_assignments' grammer rules */

list_of_net_decl_assignments
	: net_decl_assignment
	| list_of_net_decl_assignments ',' net_decl_assignment
	;

/* End of 'list_of_net_decl_assignments' grammer rules */


/* Start of 'list_of_param_assignments' grammer rules */

list_of_param_assignments
	: param_assignment
	| list_of_param_assignments ',' param_assignment
	;

/* End of 'list_of_param_assignments' grammer rules */


/* Start of 'list_of_port_identifiers' grammer rules */

list_of_port_identifiers
	: identifier unpacked_dimension_recurse_or_null
	| list_of_port_identifiers ',' identifier
		unpacked_dimension_recurse_or_null
	;

/* End of 'list_of_port_identifiers' grammer rules */


/* Start of 'list_of_udp_port_identifiers' grammer rules */

list_of_udp_port_identifiers
	: identifier
	| list_of_udp_port_identifiers ',' identifier
	;

/* End of 'list_of_udp_port_identifiers' grammer rules */


/* Start of 'list_of_specparam_assignments' grammer rules */

list_of_specparam_assignments
	: specparam_assignment
	| list_of_specparam_assignments ',' specparam_assignment
	;

/* End of 'list_of_specparam_assignments' grammer rules */


/* Start of 'list_of_tf_variable_identifiers' grammer rules */

list_of_tf_variable_identifiers
	: identifier variable_dimension_recurse_or_null
		equal_expression_or_null
	| list_of_tf_variable_identifiers ',' identifier
		variable_dimension_recurse_or_null equal_expression_or_null
	;

/* End of 'list_of_tf_variable_identifiers' grammer rules */


/* Start of 'list_of_type_assignments' grammer rules */

list_of_type_assignments
	: type_assignment
	| list_of_type_assignments ',' type_assignment
	;

/* End of 'list_of_type_assignments' grammer rules */


/* Start of 'list_of_variable_decl_assignments' grammer rules */

list_of_variable_decl_assignments
	: variable_decl_assignment
	| list_of_variable_decl_assignments ',' variable_decl_assignment
	;

/* End of 'list_of_variable_decl_assignments' grammer rules */


/* Start of 'list_of_variable_identifiers' grammer rules */

list_of_variable_identifiers
	: identifier variable_dimension_recurse_or_null
	| list_of_variable_identifiers ',' identifier
		variable_dimension_recurse_or_null
	;

/* End of 'list_of_variable_identifiers' grammer rules */


/* Start of 'list_of_variable_port_identifiers' grammer rules */

list_of_variable_port_identifiers
	: identifier variable_dimension_recurse_or_null
		equal_constant_expression_or_null
	| list_of_variable_port_identifiers ',' identifier
		variable_dimension_recurse_or_null equal_constant_expression_or_null
	;

/* End of 'list_of_variable_port_identifiers' grammer rules */

/*************************************************
 * End of 'Declaration lists' Grammer Rules      *
 * Based off section: (A.2.3 Declaration lists). *
 *************************************************/


/*******************************************************
 * Start of 'Declaration assignments' Grammer Rules    *
 * Based off section: (A.2.4 Declaration assignments). *
 ******************************************************/

/* Start of 'defparam_assignment' grammer rules */

defparam_assignment
	: hierarchical_identifier equal_constant_mintypmax_expression
	;

/* End of 'defparam_assignment' grammer rules */


/* Start of 'net_decl_assignment' grammer rules */

net_decl_assignment
	: identifier unpacked_dimension_recurse_or_null
		equal_expression_or_null
	;

/* End of 'net_decl_assignment' grammer rules */


/* Start of 'param_assignment' grammer rules */

param_assignment
	: identifier variable_dimension_recurse_or_null
		equal_constant_param_expression_or_null
	;

/* End of 'param_assignment' grammer rules */


/* Start of 'specparam_assignment' grammer rules */

specparam_assignment
	: identifier equal_constant_mintypmax_expression
	| pulse_control_specparam
	;

/* End of 'specparam_assignment' grammer rules */


/* Start of 'pulse_control_specparam' grammer rules */

equal_reject_limit_value
	: '=' '(' constant_mintypmax_expression ')'
	| '=' '(' constant_mintypmax_expression ',' constant_mintypmax_expression ')'
	;

pulse_control_specparam
	: SVLOG_PATHPULSEDS equal_reject_limit_value
	| SVLOG_PATHPULSEDS specify_input_terminal_descriptor '$'
		specify_output_terminal_descriptor equal_reject_limit_value
	;

/* End of 'pulse_control_specparam' grammer rules */


/* Start of 'type_assignment' grammer rules */

type_assignment
	: identifier
	| identifier '=' data_type_or_incomplete_class_scoped_type
	;

/* End of 'type_assignment' grammer rules */


/* Start of 'variable_decl_assignment' grammer rules */

variable_decl_assignment
	: identifier variable_dimension_recurse_or_null equal_expression_or_null
	| identifier unsized_dimension
		variable_dimension_recurse_or_null
			equal_dynamic_array_new_or_null
	| identifier '=' class_new
	;

/* End of 'variable_decl_assignment' grammer rules */


/* Start of 'class_new' grammer rules */

class_new_loa
	: '(' ')'
	| '(' list_of_arguments ')'
	;

class_new_loa_or_null
	: %empty
	| class_new_loa
	;

class_new
	: class_scope_or_null SVLOG_NEW class_new_loa_or_null
	| SVLOG_NEW expression
	;

/* End of 'class_new' grammer rules */


/* Start of 'dynamic_array_new' grammer rules */

dynamic_array_new
	: SVLOG_NEW '[' expression ']'
	| SVLOG_NEW '[' expression ']' '(' expression ')'
	;

equal_dynamic_array_new
	: '=' dynamic_array_new
	;

equal_dynamic_array_new_or_null
	: %empty
	| equal_dynamic_array_new
	;

/* End of 'dynamic_array_new' grammer rules */

/*******************************************************
 * End of 'Declaration assignments' Grammer Rules      *
 * Based off section: (A.2.4 Declaration assignments). *
 *******************************************************/


/**************************************************
 * Start of 'Declaration ranges' Grammer Rules    *
 * Based off section: (A.2.5 Declaration ranges). *
 **************************************************/

/* Start of 'unpacked_dimension' grammer rules */

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

/* End of 'unpacked_dimension' grammer rules */


/* Start of 'packed_dimension' grammer rules */

packed_dimension
	: '[' constant_range ']'
	| unsized_dimension
	;

packed_dimension_or_null
	: %empty
	| packed_dimension
	;

packed_dimension_recurse
	: packed_dimension
	| packed_dimension_recurse packed_dimension
	;

packed_dimension_recurse_or_null
	: %empty
	| packed_dimension_recurse
	;

/* End of 'packed_dimension' grammer rules */


/* Start of 'associative_dimension' grammer rules */

associative_dimension
	: '[' data_type ']'
	| REPEAT_ZERO_OR_MORE
	;

associative_dimension_or_null
	: %empty
	| associative_dimension
	;

/* End of 'associative_dimension' grammer rules */


/* Start of 'variable_dimension' grammer rules */

variable_dimension
	: unsized_dimension
	| unpacked_dimension
	| associative_dimension
	| queue_dimension
	;

variable_dimension_or_null
	: %empty
	| variable_dimension
	;

variable_dimension_recurse
	: variable_dimension
	| variable_dimension_recurse variable_dimension
	;

variable_dimension_recurse_or_null
	: %empty
	| variable_dimension_recurse
	;

/* End of 'variable_dimension' grammer rules */


/* Start of 'queue_dimension' grammer rules */

queue_dimension
	: QUEUE_INITIALIZE
	| BOUNDED_QUEUE_INITIALIZE constant_expression ']'
	;

queue_dimension_or_null
	: %empty
	| queue_dimension
	;

/* End of 'queue_dimension' grammer rules */


/* Start of 'unsized_dimension' grammer rules */

unsized_dimension
	: '[' ']'
	;

unsized_dimension_or_null
	: %empty
	| unsized_dimension
	;

/* End of 'unsized_dimension' grammer rules */

/**************************************************
 * End of 'Declaration ranges' Grammer Rules      *
 * Based off section: (A.2.5 Declaration ranges). *
 **************************************************/


/*****************************************************
 * Start of 'Function declarations' Grammer Rules    *
 * Based off section: (A.2.6 Function declarations). *
 *****************************************************/

/* Start of 'function_data_type_or_implicit' grammer rules */

function_data_type_or_implicit
	: data_type_or_void
	| implicit_data_type
	;

/* End of 'function_data_type_or_implicit' grammer rules */


/* Start of 'function_declaration' grammer rules */

function_declaration
	: SVLOG_FUNCTION dynamic_override_specifiers_or_null
		lifetime_or_null function_body_declaration
	;

/* End of 'function_declaration' grammer rules */


/* Start of 'function_body_declaration' grammer rules */

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

/* End of 'function_body_declaration' grammer rules */


/* Start of 'function_prototype' grammer rules */

function_prototype
	: SVLOG_FUNCTION
		dynamic_override_specifiers_or_null
			data_type_or_void identifier
	| SVLOG_FUNCTION
		dynamic_override_specifiers_or_null
			data_type_or_void identifier
				'(' tf_port_list_or_null ')'
	;

/* End of 'function_prototype' grammer rules */


/* Start of 'dpi_import_export' grammer rules */

c_ident_equal
	: SVLOG_CIDENT '='
	;

c_ident_equal_or_null
	: %empty
	| c_ident_equal
	;

dpi_import_export
	: SVLOG_IMPORT dpi_spec_string
		dpi_function_import_property_or_null
			 c_ident_equal_or_null function_prototype ';'
	| SVLOG_IMPORT dpi_spec_string
		dpi_task_import_property_or_null
			c_ident_equal_or_null task_prototype ';'
	| SVLOG_EXPORT dpi_spec_string
		c_ident_equal_or_null
			SVLOG_FUNCTION identifier ';'
	| SVLOG_EXPORT dpi_spec_string
		c_ident_equal_or_null
			SVLOG_TASK identifier ';'
	;

/* End of 'dpi_import_export' grammer rules */


/* Start of 'dpi_spec_string' grammer rules */

dpi_spec_string
	: '"' SVLOG_DPI_C '"'
	| '"' SVLOG_DPI '"'
	;

/* End of 'dpi_spec_string' grammer rules */


/* Start of 'dpi_function_import_property' grammer rules */

dpi_function_import_property
	: SVLOG_CONTEXT
	| SVLOG_PURE
	;

dpi_function_import_property_or_null
	: %empty
	| dpi_function_import_property
	;

/* End of 'dpi_function_import_property' grammer rules */


/* Start of 'dpi_task_import_property' grammer rules */

dpi_task_import_property
	: SVLOG_CONTEXT
	;

dpi_task_import_property_or_null
	: %empty
	| dpi_task_import_property
	;

/* End of 'dpi_task_import_property' grammer rules */

/*****************************************************
 * End of 'Function declarations' Grammer Rules      *
 * Based off section: (A.2.6 Function declarations). *
 *****************************************************/


/***************************************************
 * Start of 'Task declarations' Grammer Rules      *
 * Based off section: (A.2.7 Task declarations).   *
 ***************************************************/

/* Start of 'task_declaration' grammer rules */

task_declaration
	: SVLOG_TASK dynamic_override_specifiers_or_null
		lifetime_or_null task_body_declaration
	;

/* End of 'task_declaration' grammer rules */


/* Start of 'task_body_declaration' grammer rules */

task_body_declaration
	: ident_or_class_scope_or_null identifier ';'
		tf_item_declaration_recurse_or_null
			statement_or_null_recurse_or_null
				SVLOG_ENDTASK colon_ident_or_null
	| ident_or_class_scope_or_null identifier
		'(' tf_port_list_or_null ')' ';'
			block_item_declaration_recurse_or_null
				statement_or_null_recurse_or_null
					SVLOG_ENDTASK colon_ident_or_null
	;

/* End of 'task_declaration' grammer rules */


/* Start of 'tf_item_declaration' grammer rules */

tf_item_declaration
	: block_item_declaration
	| tf_port_declaration
	;

tf_item_declaration_recurse
	: tf_item_declaration
	| tf_item_declaration_recurse tf_item_declaration
	;

tf_item_declaration_recurse_or_null
	: %empty
	| tf_item_declaration_recurse
	;

/* End of 'tf_item_declaration' grammer rules */


/* Start of 'tf_port_list' grammer rules */

tf_port_list
	: tf_port_item
	| tf_port_list ',' tf_port_item
	;

tf_port_list_or_null
	: %empty
	| tf_port_list
	;

/* End of 'tf_port_list' grammer rules */


/* Start of 'tf_port_item' grammer rules */

tf_port_item_var_dimension_expr_or_null
	: %empty
	| identifier variable_dimension_recurse_or_null
		equal_expression_or_null
	;

tf_port_item
	: attribute_instance_recurse_or_null
		tf_port_direction_or_null
			var_or_null data_type_or_implicit
				tf_port_item_var_dimension_expr_or_null
	;

/* End of 'tf_port_item' grammer rules */


/* Start of 'tf_port_direction' grammer rules */

tf_port_direction
	: port_direction
	| const_or_null SVLOG_REF static_or_null
	;

tf_port_direction_or_null
	: %empty
	| tf_port_direction
	;

/* End of 'tf_port_direction' grammer rules */


/* Start of 'tf_port_declaration' grammer rules */

tf_port_declaration
	: attribute_instance_recurse_or_null
		tf_port_direction var_or_null
			data_type_or_implicit
				list_of_tf_variable_identifiers ';'
	;

/* End of 'tf_port_declaration' grammer rules */


/* Start of 'task_prototype' grammer rules */

task_prototype
	: SVLOG_TASK
		dynamic_override_specifiers_or_null
			identifier
	| SVLOG_TASK
		dynamic_override_specifiers_or_null
			identifier '(' tf_port_list ')'
	;

/* End of 'task_prototype' grammer rules */


/* Start of 'dynamic_override_specifiers' grammer rules */

dynamic_override_specifiers
	: initial_or_extends_specifier_or_null
		final_specifier_or_null
	;

dynamic_override_specifiers_or_null
	: %empty
	| dynamic_override_specifiers
	;

/* End of 'dynamic_override_specifiers' grammer rules */


/* Start of 'initial_or_extends_specifier' grammer rules */

initial_or_extends_specifier
	: ':' SVLOG_INITIAL
	| ':' SVLOG_EXTENDES
	;

initial_or_extends_specifier_or_null
	: %empty
	| initial_or_extends_specifier
	;

/* End of 'initial_or_extends_specifier' grammer rules */


/* Start of 'final_specifier' grammer rules */

final_specifier
	: ':' SVLOG_FINAL
	;

final_specifier_or_null
	: %empty
	| final_specifier
	;

/* End of 'final_specifier' grammer rules */

/*************************************************
 * End of 'Task declarations' Grammer Rules      *
 * Based off section: (A.2.7 Task declarations). *
 *************************************************/


/*******************************************************
 * Start of 'Block item declarations' Grammer Rules    *
 * Based off section: (A.2.8 Block item declarations). *
 *******************************************************/

/* Start of 'block_item_declaration' grammer rules */

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

/* End of 'block_item_declaration' grammer rules */

/*******************************************************
 * End of 'Block item declarations' Grammer Rules      *
 * Based off section: (A.2.8 Block item declarations). *
 *******************************************************/


/******************************************************
 * Start of 'Interface declarations' Grammer Rules    *
 * Based off section: (A.2.9 Interface declarations). *
 ******************************************************/

/* Start of 'modport_declaration' grammer rules */

modport_declaration
	: SVLOG_MODPORT modport_item_seq_list
	;

/* End of 'modport_declaration' grammer rules */


/* Start of 'modport_item' grammer rules */

modport_item
	: identifier '(' modport_ports_declaration_seq_list ')'
	;

modport_item_seq_list
	: modport_item
	| modport_item_seq_list ',' modport_item
	;

/* End of 'modport_item' grammer rules */


/* Start of 'modport_ports_declaration' grammer rules */

modport_ports_declaration
	: attribute_instance_recurse_or_null modport_simple_ports_declaration
	| attribute_instance_recurse_or_null modport_tf_ports_declaration
	| attribute_instance_recurse_or_null modport_clocking_declaration
	;

modport_ports_declaration_seq_list
	: modport_ports_declaration
	| modport_ports_declaration_seq_list ',' modport_ports_declaration
	;

/* End of 'modport_ports_declaration' grammer rules */


/* Start of 'modport_clocking_declaration' grammer rules */

modport_clocking_declaration
	: SVLOG_CLOCKING identifier
	;

/* End of 'modport_clocking_declaration' grammer rules */


/* Start of 'modport_simple_ports_declaration' grammer rules */

modport_simple_ports_declaration
	: port_direction modport_simple_port_seq_list
	;

/* End of 'modport_simple_ports_declaration' grammer rules */


/* Start of 'modport_simple_port' grammer rules */

modport_simple_port
	: identifier
	| period_ident '(' expression_or_null ')'
	;

modport_simple_port_seq_list
	: modport_simple_port
	| modport_simple_port_seq_list ',' modport_simple_port
	;

/* End of 'modport_simple_port' grammer rules */


/* Start of 'modport_tf_ports_declaration' grammer rules */

modport_tf_ports_declaration
	: import_export modport_tf_port_seq_list
	;

/* End of 'modport_tf_ports_declaration' grammer rules */


/* Start of 'modport_tf_port' grammer rules */

modport_tf_port
	: method_prototype
	| identifier
	;

modport_tf_port_seq_list
	: modport_tf_port
	| modport_tf_port_seq_list ',' modport_tf_port
	;

/* End of 'modport_tf_port' grammer rules */


/* Start of 'import_export' grammer rules */

import_export
	: SVLOG_IMPORT
	| SVLOG_EXPORT
	;

/* End of 'import_export' grammer rules */

/******************************************************
 * End of 'Interface declarations' Grammer Rules      *
 * Based off section: (A.2.9 Interface declarations). *
 ******************************************************/


/*******************************************************
 * Start of 'Assertion declarations' Grammer Rules     *
 * Based off section: (A.2.10 Assertion declarations). *
 *******************************************************/

/* Start of 'concurrent_assertion_item' grammer rules */

concurrent_assertion_item
	: ident_colon_or_null concurrent_assertion_statement
	| checker_instantiation
	;

/* End of 'concurrent_assertion_item' grammer rules */


/* Start of 'concurrent_assertion_statement' grammer rules */

concurrent_assertion_statement
	: assert_property_statement
	| assume_property_statement
	| cover_property_statement
	| cover_sequence_statement
	| restrict_property_statement
	;

/* End of 'concurrent_assertion_statement' grammer rules */


/* Start of 'assert_property_statement' grammer rules */

assert_property_statement
	: SVLOG_ASSERT SVLOG_PROPERTY '(' property_spec ')' action_block
	;

/* End of 'assert_property_statement' grammer rules */


/* Start of 'assume_property_statement' grammer rules */

assume_property_statement
	: SVLOG_ASSUME SVLOG_PROPERTY '(' property_spec ')' action_block
	;

/* End of 'assume_property_statement' grammer rules */


/* Start of 'cover_property_statement' grammer rules */

cover_property_statement
	: SVLOG_COVER SVLOG_PROPERTY '(' property_spec ')' statement_or_null
	;

/* End of 'cover_property_statement' grammer rules */


/* Start of 'expect_property_statement' grammer rules */

expect_property_statement
	: SVLOG_EXPECT '(' property_spec ')' action_block
	;

/* End of 'expect_property_statement' grammer rules */


/* Start of 'cover_sequence_statement' grammer rules */

cover_sequence_statement
	: SVLOG_COVER SVLOG_SEQUENCE '('
		clocking_event_or_null disable_iff_expr_or_dist_or_null
			sequence_expr ')' statement_or_null
	;

/* End of 'cover_sequence_statement' grammer rules */


/* Start of 'restrict_property_statement' grammer rules */

restrict_property_statement
	: SVLOG_RESTRICT SVLOG_PROPERTY '(' property_spec ')' ';'
	;

/* End of 'restrict_property_statement' grammer rules */


/* Start of 'property_instance' grammer rules */

property_instance
	: ps_or_hierarchical_property_identifier
	| ps_or_hierarchical_property_identifier
		'(' property_list_of_arguments_or_null ')'
	;

/* End of 'property_instance' grammer rules */


/* Start of 'property_list_of_arguments' grammer rules */

property_list_of_arguments
	: property_actual_arg_seq_list_or_null
		property_actual_arg_ident_seq_list_or_null
	| period_ident '(' property_actual_arg_or_null ')'
		property_actual_arg_ident_seq_list_or_null
	;

property_list_of_arguments_or_null
	: %empty
	| property_list_of_arguments
	;

/* End of 'property_list_of_arguments' grammer rules */


/* Start of 'property_actual_arg' grammer rules */

property_actual_arg
	: property_expr
	| sequence_actual_arg
	;

property_actual_arg_or_null
	: %empty
	| property_actual_arg
	;

equal_property_actual_arg
	: '=' property_actual_arg
	;

equal_property_actual_arg_or_null
	: %empty
	| equal_property_actual_arg
	;

property_actual_arg_seq_list
	: property_actual_arg
	| property_actual_arg_seq_list ',' property_actual_arg
	;

property_actual_arg_seq_list_or_null
	: %empty
	| property_actual_arg_seq_list
	;

property_actual_arg_ident_seq_list
	: ',' '.' identifier '(' property_actual_arg_or_null ')'
	| property_actual_arg_ident_seq_list ',' '.' identifier '(' property_actual_arg_or_null ')'
	;

property_actual_arg_ident_seq_list_or_null
	: %empty
	| property_actual_arg_ident_seq_list
	;

/* End of 'property_actual_arg' grammer rules */


/* Start of 'assertion_item_declaration' grammer rules */

assertion_item_declaration
	: property_declaration
	| sequence_declaration
	| let_declaration
	;

/* End of 'assertion_item_declaration' grammer rules */


/* Start of 'property_declaration' grammer rules */

property_decl_pp_list
	: '(' ')'
	| '(' property_port_list ')'
	;

property_decl_pp_list_or_null
	: %empty
	| property_decl_pp_list
	;

property_declaration
	: SVLOG_PROPERTY identifier property_decl_pp_list_or_null ';'
		assertion_variable_declaration_recurse
			property_spec semicolon_or_null
				SVLOG_ENDPROPERTY colon_ident_or_null
	;

/* End of 'property_declaration' grammer rules */


/* Start of 'property_port_list' grammer rules */

property_port_list
	: property_port_item
	| property_port_list ',' property_port_item
	;

/* End of 'property_port_list' grammer rules */


/* Start of 'property_port_item' grammer rules */

pp_item_local_direction
	: SVLOG_LOCAL
	| SVLOG_LOCAL SVLOG_INPUT
	;

pp_item_local_direction_or_null
	: %empty
	| pp_item_local_direction
	;

property_port_item
	: attribute_instance_recurse_or_null
		pp_item_local_direction_or_null
			property_formal_type identifier
				variable_dimension_recurse_or_null
					equal_property_actual_arg_or_null
	;

/* End of 'property_port_item' grammer rules */


/* Start of 'property_formal_type' grammer rules */

property_formal_type
	: sequence_formal_type
	| SVLOG_PROPERTY
	;

/* End of 'property_formal_type' grammer rules */


/* Start of 'property_spec' grammer rules */

property_spec
	: clocking_event_or_null
		disable_iff_expr_or_dist_or_null
			property_expr
	;

/* End of 'property_spec' grammer rules */


/* Start of 'property_expr' grammer rules */

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

/* End of 'property_expr' grammer rules */


/* Start of 'property_case_item' grammer rules */

property_case_item
	: expression_or_dist_seq_list ':' property_expr ';'
	| SVLOG_DEFAULT colon_or_null property_expr ';'
	;

property_case_item_recurse
	: property_case_item
	| property_case_item_recurse property_case_item
	;

/* End of 'property_expr' grammer rules */


/* Start of 'sequence_declaration' grammer rules */

sequence_declaration_port_list
	: '(' ')'
	| '(' sequence_port_list ')'
	;

sequence_declaration_port_list_or_null
	: %empty
	| sequence_declaration_port_list
	;

sequence_declaration
	: SVLOG_SEQUENCE identifier
		sequence_declaration_port_list_or_null ';'
			assertion_variable_declaration_recurse_or_null
				sequence_expr semicolon_or_null
					SVLOG_ENDSEQUENCE colon_ident_or_null
	;

/* End of 'sequence_declaration' grammer rules */


/* Start of 'sequence_port_list' grammer rules */

sequence_port_list
	: sequence_port_item
	| sequence_port_list sequence_port_item
	;

/* End of 'sequence_port_list' grammer rules */


/* Start of 'sequence_port_item' grammer rules */

sp_item_local_slp_direction
	: SVLOG_LOCAL
	| SVLOG_LOCAL sequence_lvar_port_direction
	;

sp_item_local_slp_direction_or_null
	: %empty
	| sp_item_local_slp_direction
	;

sequence_port_item
	: attribute_instance_recurse_or_null
		sp_item_local_slp_direction_or_null
          		sequence_formal_type identifier
				variable_dimension_recurse_or_null
					equal_sequence_actual_arg_or_null
	;

/* End of 'sequence_port_item' grammer rules */


/* Start of 'sequence_lvar_port_direction' grammer rules */

sequence_lvar_port_direction
	: SVLOG_INPUT
	| SVLOG_INOUT
	| SVLOG_OUTPUT
	;

/* End of 'sequence_lvar_port_direction' grammer rules */


/* Start of 'sequence_formal_type' grammer rules */

sequence_formal_type
	: data_type_or_implicit
	| SVLOG_SEQUENCE
	| SVLOG_UNTYPED
	;

/* End of 'sequence_formal_type' grammer rules */


/* Start of 'sequence_expr' grammer rules */

sequence_expr_cdelay_range_sexpr
	: cycle_delay_range sequence_expr
	| sequence_expr_cdelay_range_sexpr
		cycle_delay_range sequence_expr
	;

sequence_expr_sexpr_cdelay_range
	: sequence_expr cycle_delay_range
	| sequence_expr_cdelay_range_sexpr
		sequence_expr cycle_delay_range
	;

sequence_expr
	: sequence_expr_cdelay_range_sexpr
	| sequence_expr_sexpr_cdelay_range
	| expression_or_dist boolean_abbrev_or_null
	| sequence_instance sequence_abbrev_or_null
	| '(' sequence_expr
		sequence_match_item_seq_list_or_null ')'
			sequence_abbrev_or_null
	| sequence_expr SVLOG_AND sequence_expr
	| sequence_expr SVLOG_INTERSECT sequence_expr
	| sequence_expr SVLOG_OR sequence_expr
	| SVLOG_FIRST_MATCH '(' sequence_expr
		sequence_match_item_seq_list_or_null ')'
	| expression_or_dist SVLOG_THROUGHOUT sequence_expr
	| sequence_expr SVLOG_WITHIN sequence_expr
	| clocking_event sequence_expr
	;

/* End of 'sequence_expr' grammer rules */


/* Start of 'cycle_delay_range' grammer rules */

cycle_delay_range
	: '#' '#' constant_primary
	| '#' '#' '[' cycle_delay_const_range_expression ']'
	| CYCLE_DELAY_ZERO_OR_MORE
	| CYCLE_DELAY_ONE_OR_MORE
	;

/* End of 'cycle_delay_range' grammer rules */


/* Start of 'sequence_method_call' grammer rules */

sequence_method_call
	: sequence_instance period_ident
	;

/* End of 'sequence_method_call' grammer rules */


/* Start of 'sequence_match_item' grammer rules */

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

/* End of 'sequence_match_item' grammer rules */


/* Start of 'sequence_instance' grammer rules */

sequence_instance
	: ps_or_hierarchical_sequence_identifier
	| ps_or_hierarchical_sequence_identifier '(' ')'
	| ps_or_hierarchical_sequence_identifier '(' sequence_list_of_arguments ')'
	;

/* End of 'sequence_instance' grammer rules */


/* Start of 'sequence_list_of_arguments' grammer rules */

sequence_list_of_arguments
	: sequence_actual_arg_seq_list_or_null
		sequence_actual_arg_ident_seq_list_or_null
	| period_ident '(' sequence_actual_arg_or_null ')'
		sequence_actual_arg_ident_seq_list_or_null
	;

/* End of 'sequence_list_of_arguments' grammer rules */


/* Start of 'sequence_actual_arg' grammer rules */

sequence_actual_arg
	: event_expression
	| sequence_expr
	| '$'
	;

sequence_actual_arg_or_null
	: %empty
	| sequence_actual_arg
	;

equal_sequence_actual_arg
	: '=' sequence_actual_arg
	;

equal_sequence_actual_arg_or_null
	: %empty
	| equal_sequence_actual_arg
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

/* End of 'sequence_actual_arg' grammer rules */


/* Start of 'boolean_abbrev' grammer rules */

boolean_abbrev
	: consecutive_repetition
	| nonconsecutive_repetition
	| goto_repetition
	;

boolean_abbrev_or_null
	: %empty
	| boolean_abbrev
	;

/* End of 'boolean_abbrev' grammer rules */


/* Start of 'sequence_abbrev' grammer rules */

sequence_abbrev
	: consecutive_repetition
	;

sequence_abbrev_or_null
	: %empty
	| sequence_abbrev
	;

/* End of 'sequence_abbrev' grammer rules */


/* Start of 'consecutive_repetition' grammer rules */

consecutive_repetition
	: CONSECUTIVE_REPEAT_OPERATOR const_or_range_expression ']'
	| REPEAT_ZERO_OR_MORE
	| REPEAT_ONE_OR_MORE
	;

/* End of 'consecutive_repetition' grammer rules */


/* Start of 'nonconsecutive_repetition' grammer rules */

nonconsecutive_repetition
	: NON_CONSECUTIVE_REPEAT_OPERATOR const_or_range_expression ']'
	;

/* End of 'nonconsecutive_repetition' grammer rules */


/* Start of 'goto_repetition' grammer rules */

goto_repetition
	: GOTO_REPETITION_OPERATOR const_or_range_expression ']'
	;

/* End of 'goto_repetition' grammer rules */


/* Start of 'const_or_range_expression' grammer rules */

const_or_range_expression
	: constant_expression
	| cycle_delay_const_range_expression
	;

/* End of 'const_or_range_expression' grammer rules */


/* Start of 'cycle_delay_const_range_expression' grammer rules */

cycle_delay_const_range_expression
	: constant_expression ':' constant_expression
	| constant_expression ':' '$'
	;

/* End of 'cycle_delay_const_range_expression' grammer rules */


/* Start of 'assertion_variable_declaration' grammer rules */

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

/* End of 'assertion_variable_declaration' grammer rules */

/*******************************************************
 * End of 'Assertion declarations' Grammer Rules       *
 * Based off section: (A.2.10 Assertion declarations). *
 *******************************************************/


/********************************************************
 * Start of 'Covergroup declarations' Grammer Rules     *
 * Based off section: (A.2.11 Covergroup declarations). *
 ********************************************************/

/* Start of 'covergroup_declaration' grammer rules */

cgroup_decl_tf_port_list
	: '(' tf_port_list_or_null ')'
	;

cgroup_decl_tf_port_list_or_null
	: %empty
	| cgroup_decl_tf_port_list
	;

covergroup_declaration
	: SVLOG_COVERGROUP identifier
		cgroup_decl_tf_port_list_or_null
			coverage_event_or_null ';'
				coverage_spec_or_option_recurse_or_null
					SVLOG_ENDGROUP colon_ident_or_null
	| SVLOG_COVERGROUP SVLOG_EXTENDES identifier ';'
		coverage_spec_or_option_recurse_or_null
			SVLOG_ENDGROUP colon_ident_or_null
	;

/* End of 'covergroup_declaration' grammer rules */


/* Start of 'coverage_spec_or_option' grammer rules */

coverage_spec_or_option
	: attribute_instance_recurse_or_null coverage_spec
	| attribute_instance_recurse_or_null coverage_option ';'
	;

coverage_spec_or_option_recurse
	: coverage_spec_or_option
	| coverage_spec_or_option_recurse coverage_spec_or_option
	;

coverage_spec_or_option_recurse_or_null
	: %empty
	| coverage_spec_or_option
	;

/* End of 'coverage_spec_or_option' grammer rules */


/* Start of 'coverage_option' grammer rules */

coverage_option
	: SVLOG_OPTION period_ident equal_expression
	| SVLOG_TYPE_OPTION period_ident equal_constant_expression
	;

/* End of 'coverage_option' grammer rules */


/* Start of 'coverage_spec' grammer rules */

coverage_spec
	: cover_point
	| cover_cross
	;

/* End of 'coverage_spec' grammer rules */


/* Start of 'coverage_event' grammer rules */

coverage_event
	: clocking_event
	| SVLOG_WITH SVLOG_FUNCTION SVLOG_SAMPLE
		'(' tf_port_list_or_null ')'
	| DOUBLE_AT_SIGN '(' block_event_expression ')'
	;

coverage_event_or_null
	: %empty
	| coverage_event
	;

/* End of 'coverage_event' grammer rules */


/* Start of 'block_event_expression' grammer rules */

block_event_expression
	: block_event_expression SVLOG_OR block_event_expression
	| SVLOG_BEGIN hierarchical_btf_identifier
	| SVLOG_END hierarchical_btf_identifier
	;

/* End of 'block_event_expression' grammer rules */


/* Start of 'hierarchical_btf_identifier' grammer rules */

hierarchical_btf_identifier
	: hierarchical_tf_identifier
	| hierarchical_block_identifier
	| hierarchical_identifier_period_or_class_scope_or_null identifier
	;

/* End of 'hierarchical_btf_identifier' grammer rules */


/* Start of 'cover_point' grammer rules */

cover_point_dt_or_imp_ident_colon_or_null
	: %empty
	| data_type_or_implicit_or_null ident_colon
	;

cover_point
	: cover_point_dt_or_imp_ident_colon_or_null
		SVLOG_COVERPOINT expression iff_expression_or_null
			bins_or_empty
	;

/* End of 'cover_point' grammer rules */


/* Start of 'bins_or_empty' grammer rules */

bins_or_empty
	: '{' attribute_instance_recurse_or_null
		bins_or_options_semicolon_recurse_or_null '}'
	| ';'
	;

/* End of 'bins_or_empty' grammer rules */


/* Start of 'bins_or_options' grammer rules */

with_paren_expression
	: SVLOG_WITH paren_expression
	;

with_paren_expression_or_null
	: %empty
	| with_paren_expression
	;

bins_or_options
	: coverage_option
	| wildcard_or_null bins_keyword identifier
		square_brackets_expression_or_null '=' '{' covergroup_range_list '}'
			with_paren_expression_or_null iff_expression_or_null
	| wildcard_or_null bins_keyword identifier
		square_brackets_expression_or_null '=' identifier
			with_paren_expression iff_expression_or_null
	| wildcard_or_null bins_keyword identifier
		square_brackets_expression_or_null '=' expression
			iff_expression_or_null
	| wildcard_or_null bins_keyword identifier
		square_brackets_or_null '=' trans_list
			iff_expression_or_null
	| bins_keyword identifier
		square_brackets_expression_or_null '=' SVLOG_DEFAULT
			iff_expression_or_null
	| bins_keyword identifier
		'=' SVLOG_DEFAULT SVLOG_SEQUENCE
			iff_expression_or_null
	;

bins_or_options_semicolon
	: bins_or_options ';'
	;

bins_or_options_semicolon_recurse
	: bins_or_options_semicolon
	| bins_or_options_semicolon_recurse bins_or_options_semicolon
	;

bins_or_options_semicolon_recurse_or_null
	: %empty
	| bins_or_options_semicolon_recurse
	;

/* End of 'bins_or_options' grammer rules */


/* Start of 'bins_keyword' grammer rules */

bins_keyword
	: SVLOG_BINS
	| SVLOG_ILLEGAL_BINS
	| SVLOG_IGNORE_BINS
	;

/* End of 'bins_keyword' grammer rules */


/* Start of 'trans_list' grammer rules */

trans_list
	: '(' trans_set ')'
	| trans_list ',' '(' trans_set ')'
	;

/* End of 'trans_list' grammer rules */


/* Start of 'trans_set' grammer rules */

trans_set
	: trans_range_list
	| trans_set PARALLEL_CONNECTION trans_range_list
	;

/* End of 'trans_set' grammer rules */


/* Start of 'trans_range_list' grammer rules */

trans_range_list
	: covergroup_range_list
	| covergroup_range_list CONSECUTIVE_REPEAT_OPERATOR repeat_range ']'
	| covergroup_range_list GOTO_REPETITION_OPERATOR repeat_range ']'
	| covergroup_range_list NON_CONSECUTIVE_REPEAT_OPERATOR repeat_range ']'
	;

/* End of 'trans_range_list' grammer rules */


/* Start of 'repeat_range' grammer rules */

repeat_range
	: expression
	| expression ':' expression
	;

/* End of 'repeat_range' grammer rules */


/* Start of 'cover_cross' grammer rules */

cover_cross
	: ident_colon_or_null SVLOG_CROSS list_of_cross_items
		iff_expression_or_null cross_body
	;

/* End of 'cover_cross' grammer rules */


/* Start of 'list_of_cross_items' grammer rules */

list_of_cross_items
	: cross_item ',' cross_item_seq_list
	;

/* End of 'list_of_cross_items' grammer rules */


/* Start of 'cross_item' grammer rules */

cross_item
	: identifier
	;

cross_item_seq_list
	: identifier
	| cross_item_seq_list ',' identifier
	;

/* End of 'cross_item' grammer rules */


/* Start of 'cross_body' grammer rules */

cross_body
	: '{' cross_body_item_recurse_or_null '}'
	| ';'
	;

/* End of 'cross_body' grammer rules */


/* Start of 'cross_body_item' grammer rules */

cross_body_item
	: function_declaration
	| bins_selection_or_option ';'
	;

cross_body_item_recurse
	: cross_body_item
	| cross_body_item_recurse cross_body_item
	;

cross_body_item_recurse_or_null
	: %empty
	| cross_body_item_recurse
	;

/* End of 'cross_body_item' grammer rules */


/* Start of 'bins_selection_or_option' grammer rules */

bins_selection_or_option
	: attribute_instance_recurse_or_null coverage_option
	| attribute_instance_recurse_or_null bins_selection
	;

/* End of 'bins_selection_or_option' grammer rules */


/* Start of 'bins_selection' grammer rules */

bins_selection
	: bins_keyword identifier '='
		select_expression iff_expression_or_null
	;

/* End of 'bins_selection' grammer rules */


/* Start of 'select_expression' grammer rules */

select_expression_matches_ice_or_null
	: %empty
	| SVLOG_MATCHES integer_covergroup_expression
	;

select_expression
	: select_condition
	| LOGICAL_NOT select_condition
	| select_expression LOGICAL_AND select_expression
	| select_expression LOGICAL_OR select_expression
	| '(' select_expression ')'
	| select_expression SVLOG_WITH '(' expression ')'
		select_expression_matches_ice_or_null
	| identifier
	| expression select_expression_matches_ice_or_null
	;

/* End of 'select_expression' grammer rules */


/* Start of 'select_condition' grammer rules */

intersect_covergroup_range_list_or_null
	: %empty
	| SVLOG_INTERSECT '{' covergroup_range_list '}'
	;

select_condition
	: SVLOG_BINSOF '(' bins_expression ')'
		intersect_covergroup_range_list_or_null
	;

/* End of 'select_condition' grammer rules */


/* Start of 'bins_expression' grammer rules */

bins_expression
	: identifier period_ident_or_null
	;

/* End of 'bins_expression' grammer rules */


/* Start of 'covergroup_range_list' grammer rules */

covergroup_range_list
	: covergroup_value_range
	| covergroup_range_list ',' covergroup_value_range
	;

/* End of 'covergroup_range_list' grammer rules */


/* Start of 'covergroup_value_range' grammer rules */

covergroup_value_range
	: expression
	| '[' expression ':' expression ']'
	| BOUNDED_QUEUE_INITIALIZE expression ']'
	| '[' expression BOUNDED_QUEUE_FINALIZE
	| '[' expression ABSOLUTE_TOLERANCE_RANGE expression ']'
	| '[' expression RELATIVE_TOLERANCE_RANGE expression ']'
	;

/* End of 'covergroup_value_range' grammer rules */


/* Start of 'integer_covergroup_expression' grammer rules */

integer_covergroup_expression
	: expression
	| '$'
	;

/* End of 'integer_covergroup_expression' grammer rules */

/********************************************************
 * End of 'Covergroup declarations' Grammer Rules       *
 * Based off section: (A.2.11 Covergroup declarations). *
 ********************************************************/


/*************************************************
 * Start of 'Let declarations' Grammer Rules     *
 * Based off section: (A.2.12 Let declarations). *
 *************************************************/

/* Start of 'let_declaration' grammer rules */

let_declaration
	: SVLOG_LET identifier equal_expression ';'
	| SVLOG_LET identifier
		'(' let_port_list_or_null ')'
			equal_expression ';'
	;

/* End of 'let_declaration' grammer rules */


/* Start of 'let_port_list' grammer rules */

let_port_list
	: let_port_item
	| let_port_list ',' let_port_item
	;

let_port_list_or_null
	: %empty
	| let_port_list
	;

/* End of 'let_port_list' grammer rules */


/* Start of 'let_port_item' grammer rules */

let_port_item
	: attribute_instance_recurse_or_null
		let_formal_type identifier
			variable_dimension_recurse
				equal_expression_or_null
	;

/* End of 'let_port_item' grammer rules */


/* Start of 'let_formal_type' grammer rules */

let_formal_type
	: data_type_or_implicit
	| SVLOG_UNTYPED
	;

/* End of 'let_formal_type' grammer rules */


/* Start of 'let_expression' grammer rules */

let_expression
	: package_scope_or_null identifier
	| package_scope_or_null identifier
		'(' let_list_of_arguments_or_null ')'
	;

/* End of 'let_expression' grammer rules */


/* Start of 'let_list_of_arguments' grammer rules */

let_list_of_arguments_ident_seq_list
	: %empty
	| ',' '.' identifier '(' expression_or_null ')'
	| let_list_of_arguments_ident_seq_list ',' '.' identifier '(' expression_or_null ')'
	;

let_actual_arg_seq_list
	: expression_or_null
	| let_actual_arg_seq_list ',' expression_or_null
	;

let_list_of_arguments
	: let_actual_arg_seq_list
		let_list_of_arguments_ident_seq_list
	| '.' identifier
		'(' expression_or_null ')'
			let_list_of_arguments_ident_seq_list
	;

let_list_of_arguments_or_null
	: %empty
	| let_list_of_arguments
	;

/* End of 'let_list_of_arguments' grammer rules */

/*************************************************
 * End of 'Let declarations' Grammer Rules       *
 * Based off section: (A.2.12 Let declarations). *
 *************************************************/


/*********************************************************************
 * Start of 'Primitive instantiation and instances' Grammer Rules    *
 * Based off section: (A.3.1 Primitive instantiation and instances). *
 *********************************************************************/

/* Start of 'gate_instantiation' grammer rules */

gate_instantiation
	: cmos_switchtype delay3_or_null
		cmos_switch_instance_seq_list ';'
	| mos_switchtype delay3_or_null
		mos_switch_instance_seq_list ';'
	| enable_gatetype drive_strength_or_null
		delay3_or_null enable_gate_instance_seq_list ';'
	| n_input_gatetype drive_strength_or_null
		delay2_or_null n_input_gate_instance_seq_list ';'
	| n_output_gatetype drive_strength_or_null
		delay2_or_null n_output_gate_instance_seq_list ';'
	| pass_en_switchtype delay2_or_null
		pass_enable_switch_instance_seq_list ';'
	| pass_switchtype pass_switch_instance_seq_list ';'
	| SVLOG_PULLDOWN pulldown_strength_or_null
		pull_gate_instance_seq_list ';'
	| SVLOG_PULLUP pullup_strength_or_null
		pull_gate_instance_seq_list ';'
	;

/* End of 'gate_instantiation' grammer rules */


/* Start of 'cmos_switch_instance' grammer rules */

cmos_switch_instance
	: name_of_instance_or_null
		'(' output_terminal ','
			input_terminal ','
				ncontrol_terminal ','
					pcontrol_terminal ')'
	;

cmos_switch_instance_seq_list
	: cmos_switch_instance
	| cmos_switch_instance_seq_list ',' cmos_switch_instance
	;

/* End of 'cmos_switch_instance' grammer rules */


/* Start of 'enable_gate_instance' grammer rules */

enable_gate_instance
	: name_of_instance_or_null
		'(' output_terminal ','
			input_terminal ','
				enable_terminal ')'
	;

enable_gate_instance_seq_list
	: enable_gate_instance
	| enable_gate_instance_seq_list ',' enable_gate_instance
	;

/* End of 'enable_gate_instance' grammer rules */


/* Start of 'mos_switch_instance' grammer rules */

mos_switch_instance
	: name_of_instance_or_null
		'(' output_terminal ','
			input_terminal ','
				enable_terminal ')'
	;

mos_switch_instance_seq_list
	: mos_switch_instance
	| mos_switch_instance_seq_list ',' mos_switch_instance
	;

/* End of 'mos_switch_instance' grammer rules */


/* Start of 'n_input_gate_instance' grammer rules */

n_input_gate_instance
	: name_of_instance_or_null
		'(' output_terminal ','
			input_terminal_seq_list ')'
	;

n_input_gate_instance_seq_list
	: n_input_gate_instance
	| n_input_gate_instance_seq_list ',' n_input_gate_instance
	;

/* End of 'n_input_gate_instance' grammer rules */


/* Start of 'n_output_gate_instance' grammer rules */

n_output_gate_instance
	: name_of_instance_or_null
		'(' output_terminal_seq_list ','
			input_terminal ')'
	;

n_output_gate_instance_seq_list
	: n_output_gate_instance
	| n_output_gate_instance_seq_list ',' n_output_gate_instance
	;

/* End of 'n_output_gate_instance' grammer rules */


/* Start of 'pass_switch_instance' grammer rules */

pass_switch_instance
	: name_of_instance_or_null
		'(' inout_terminal ',' inout_terminal ')'
	;

pass_switch_instance_seq_list
	: pass_switch_instance
	| pass_switch_instance_seq_list ',' pass_switch_instance
	;

/* End of 'pass_switch_instance' grammer rules */


/* Start of 'pass_enable_switch_instance' grammer rules */

pass_enable_switch_instance
	: name_of_instance_or_null
		'(' inout_terminal ','
			inout_terminal ','
				enable_terminal ')'
	;

pass_enable_switch_instance_seq_list
	: pass_enable_switch_instance
	| pass_enable_switch_instance_seq_list ',' pass_enable_switch_instance
	;

/* End of 'pass_enable_switch_instance' grammer rules */


/* Start of 'pull_gate_instance' grammer rules */

pull_gate_instance
	: name_of_instance_or_null
		'(' output_terminal ')'
	;

pull_gate_instance_seq_list
	: pull_gate_instance
	| pull_gate_instance_seq_list pull_gate_instance
	;

/* End of 'pull_gate_instance' grammer rules */

/*********************************************************************
 * End of 'Primitive instantiation and instances' Grammer Rules      *
 * Based off section: (A.3.1 Primitive instantiation and instances). *
 *********************************************************************/


/***************************************************
 * Start of 'Primitive strengths' Grammer Rules    *
 * Based off section: (A.3.2 Primitive strengths). *
 ***************************************************/

/* Start of 'pulldown_strength' grammer rules */

pulldown_strength
	: '(' strength0 ',' strength1 ')'
	| '(' strength1 ',' strength0 ')'
	| '(' strength0 ')'
	;

pulldown_strength_or_null
	: %empty
	| pulldown_strength
	;

/* End of 'pulldown_strength' grammer rules */


/* Start of 'pullup_strength' grammer rules */

pullup_strength
	: '(' strength0 ',' strength1 ')'
	| '(' strength1 ',' strength0 ')'
	| '(' strength1 ')'
	;

pullup_strength_or_null
	: %empty
	| pullup_strength
	;

/* End of 'pullup_strength' grammer rules */

/***************************************************
 * End of 'Primitive strengths' Grammer Rules      *
 * Based off section: (A.3.2 Primitive strengths). *
 ***************************************************/


/***************************************************
 * Start of 'Primitive terminals' Grammer Rules    *
 * Based off section: (A.3.3 Primitive terminals). *
 ***************************************************/

/* Start of 'enable_terminal' grammer rules */

enable_terminal
	: expression
	;

/* End of 'enable_terminal' grammer rules */


/* Start of 'inout_terminal' grammer rules */

inout_terminal
	: net_lvalue
	;

/* End of 'inout_terminal' grammer rules */


/* Start of 'input_terminal' grammer rules */

input_terminal
	: expression
	;

input_terminal_seq_list
	: expression
	| input_terminal_seq_list ',' expression
	;

/* End of 'input_terminal' grammer rules */


/* Start of 'ncontrol_terminal' grammer rules */

ncontrol_terminal
	: expression
	;

/* End of 'ncontrol_terminal' grammer rules */


/* Start of 'output_terminal' grammer rules */

output_terminal
	: net_lvalue
	;

output_terminal_seq_list
	: expression
	| output_terminal_seq_list ',' expression
	;

/* End of 'output_terminal' grammer rules */


/* Start of 'pcontrol_terminal' grammer rules */

pcontrol_terminal
	: expression
	;

/* End of 'pcontrol_terminal' grammer rules */

/***************************************************
 * End of 'Primitive terminals' Grammer Rules      *
 * Based off section: (A.3.3 Primitive terminals). *
 ***************************************************/


/***************************************************************
 * Start of 'Primitive gate and switch types' Grammer Rules    *
 * Based off section: (A.3.4 Primitive gate and switch types). *
 ***************************************************************/

/* Start of 'cmos_switchtype' grammer rules */

cmos_switchtype
	: SVLOG_CMOS
	| SVLOG_RCMOS
	;

/* End of 'cmos_switchtype' grammer rules */


/* Start of 'enable_gatetype' grammer rules */

enable_gatetype
	: SVLOG_BUFIF0
	| SVLOG_BUFIF1
	| SVLOG_NOTIF0
	| SVLOG_NOTIF1
	;

/* End of 'enable_gatetype' grammer rules */


/* Start of 'mos_switchtype' grammer rules */

mos_switchtype
	: SVLOG_NMOS
	| SVLOG_PMOS
	| SVLOG_RNMOS
	| SVLOG_RPMOS
	;

/* End of 'mos_switchtype' grammer rules */


/* Start of 'n_input_gatetype' grammer rules */

n_input_gatetype
	: SVLOG_AND
	| SVLOG_NAND
	| SVLOG_OR
	| SVLOG_NOR
	| SVLOG_XOR
	| SVLOG_XNOR
	;

/* End of 'n_input_gatetype' grammer rules */


/* Start of 'n_output_gatetype' grammer rules */

n_output_gatetype
	: SVLOG_BUF
	| SVLOG_NOT
	;

/* End of 'n_output_gatetype' grammer rules */


/* Start of 'pass_en_switchtype' grammer rules */

pass_en_switchtype
	: SVLOG_TRANIF0
	| SVLOG_TRANIF1
	| SVLOG_RTRANIF1
	| SVLOG_RTRANIF0
	;

/* End of 'pass_en_switchtype' grammer rules */


/* Start of 'pass_switchtype' grammer rules */

pass_switchtype
	: SVLOG_TRAN
	| SVLOG_RTRAN
	;

/* End of 'pass_switchtype' grammer rules */

/***************************************************************
 * End of 'Primitive gate and switch types' Grammer Rules      *
 * Based off section: (A.3.4 Primitive gate and switch types). *
 ***************************************************************/


/******************************************************
 * Start of 'Module instantiation' Grammer Rules      *
 * Based off section: (A.4.1.1 Module instantiation). *
 ******************************************************/

/* Start of 'module_instantiation' grammer rules */

module_instantiation
	: identifier
		parameter_value_assignment_or_null
			hierarchical_instance_seq_list
	;

/* End of 'module_instantiation' grammer rules */


/* Start of 'parameter_value_assignment' grammer rules */

parameter_value_assignment
	: '#' '(' ')'
	| '#' '(' list_of_parameter_value_assignments ')'
	;

parameter_value_assignment_or_null
	: %empty
	| parameter_value_assignment
	;

/* End of 'parameter_value_assignment' grammer rules */


/* Start of 'list_of_parameter_value_assignments' grammer rules */

list_of_parameter_value_assignments
	: ordered_parameter_assignment_seq_list
	| named_parameter_assignment_seq_list
	;

/* End of 'list_of_parameter_value_assignments' grammer rules */


/* Start of 'ordered_parameter_assignment' grammer rules */

ordered_parameter_assignment
	: param_expression
	;

ordered_parameter_assignment_seq_list
	: ordered_parameter_assignment
	| ordered_parameter_assignment_seq_list ',' ordered_parameter_assignment
	;

/* End of 'ordered_parameter_assignment' grammer rules */


/* Start of 'named_parameter_assignment' grammer rules */

named_parameter_assignment
	: period_ident '(' param_expression_or_null ')'
	;

named_parameter_assignment_seq_list
	: named_parameter_assignment
	| named_parameter_assignment_seq_list ',' named_parameter_assignment
	;

/* End of 'named_parameter_assignment' grammer rules */


/* Start of 'hierarchical_instance' grammer rules */

hierarchical_instance
	: name_of_instance '(' list_of_port_connections_or_null ')'
	;

hierarchical_instance_seq_list
	: hierarchical_instance
	| hierarchical_instance_seq_list ',' hierarchical_instance
	;

/* End of 'hierarchical_instance' grammer rules */


/* Start of 'name_of_instance' grammer rules */

name_of_instance
	: identifier
		unpacked_dimension_recurse_or_null
	;

name_of_instance_or_null
	: %empty
	| name_of_instance
	;

/* End of 'name_of_instance' grammer rules */


/* Start of 'list_of_port_connections' grammer rules */

list_of_port_connections
	: ordered_port_connection_seq_list
	| named_port_connection_seq_list
	;

list_of_port_connections_or_null
	: %empty
	| list_of_port_connections
	;

/* End of 'list_of_port_connections' grammer rules */


/* Start of 'ordered_port_connection' grammer rules */

ordered_port_connection
	: attribute_instance_recurse_or_null expression_or_null
	;

ordered_port_connection_seq_list
	: ordered_port_connection
	| ordered_port_connection_seq_list ',' ordered_port_connection
	;

/* End of 'ordered_port_connection' grammer rules */


/* Start of 'named_port_connection' grammer rules */

named_port_connection
	: attribute_instance_recurse_or_null period_ident 
	| attribute_instance_recurse_or_null period_ident '(' expression_or_null ')'
	| attribute_instance_recurse_or_null '.' '*'
	;

named_port_connection_seq_list
	: named_port_connection
	| named_port_connection_seq_list ',' named_port_connection
	;

/* End of 'named_port_connection' grammer rules */

/******************************************************
 * End of 'Module instantiation' Grammer Rules        *
 * Based off section: (A.4.1.1 Module instantiation). *
 ******************************************************/


/*********************************************************
 * Start of 'Interface instantiation' Grammer Rules      *
 * Based off section: (A.4.1.2 Interface instantiation). *
 *********************************************************/

/* Start of 'interface_instantiation' grammer rules */

interface_instantiation
	: identifier
		parameter_value_assignment_or_null
			hierarchical_instance_seq_list ';'
	;

/* End of 'interface_instantiation' grammer rules */

/*********************************************************
 * End of 'Interface instantiation' Grammer Rules        *
 * Based off section: (A.4.1.2 Interface instantiation). *
 *********************************************************/


/*******************************************************
 * Start of 'Program instantiation' Grammer Rules      *
 * Based off section: (A.4.1.3 Program instantiation). *
 *******************************************************/

/* Start of 'program_instantiation' grammer rules */

program_instantiation
	: identifier
		parameter_value_assignment_or_null
			hierarchical_instance_seq_list ';'
	;

/* End of 'program_instantiation' grammer rules */

/*******************************************************
 * End of 'Program instantiation' Grammer Rules        *
 * Based off section: (A.4.1.3 Program instantiation). *
 *******************************************************/


/*******************************************************
 * Start of 'Checker instantiation' Grammer Rules      *
 * Based off section: (A.4.1.4 Checker instantiation). *
 *******************************************************/

/* Start of 'checker_instantiation' grammer rules */

checker_instantiation
	: ps_checker_identifier name_of_instance
		'(' list_of_checker_port_connections_or_null ')' ';'
	;

/* End of 'checker_instantiation' grammer rules */


/* Start of 'list_of_checker_port_connections' grammer rules */

list_of_checker_port_connections
	: ordered_checker_port_connection_seq_list
	| named_checker_port_connection_seq_list
	;

list_of_checker_port_connections_or_null
	: %empty
	| list_of_checker_port_connections
	;

/* End of 'list_of_checker_port_connections' grammer rules */


/* Start of 'ordered_checker_port_connection' grammer rules */

ordered_checker_port_connection
	: attribute_instance_recurse_or_null
		property_actual_arg_or_null
	;

ordered_checker_port_connection_seq_list
	: ordered_checker_port_connection
	| ordered_checker_port_connection_seq_list ','
		ordered_checker_port_connection
	;

/* End of 'ordered_checker_port_connection' grammer rules */


/* Start of 'named_checker_port_connection' grammer rules */

named_checker_port_connection
	: attribute_instance_recurse_or_null period_ident 
	| attribute_instance_recurse_or_null period_ident
		'(' property_actual_arg_or_null ')'
	| attribute_instance_recurse_or_null '.' '*'
	;

named_checker_port_connection_seq_list
	: named_checker_port_connection
	| named_checker_port_connection_seq_list ','
		named_checker_port_connection
	;

/* End of 'named_checker_port_connection' grammer rules */

/*******************************************************
 * End of 'Checker instantiation' Grammer Rules        *
 * Based off section: (A.4.1.4 Checker instantiation). *
 *******************************************************/


/*******************************************************
 * Start of 'Generated instantiation' Grammer Rules    *
 * Based off section: (A.4.2 Generated instantiation). *
 *******************************************************/

/* Start of 'generate_region' grammer rules */

generate_region
	: SVLOG_GENERATE
		generate_item_recurse_or_null
			SVLOG_ENDGENERATE
	;

/* End of 'generate_region' grammer rules */


/* Start of 'loop_generate_construct' grammer rules */

loop_generate_construct
	: SVLOG_FOR '(' genvar_initialization ';'
		constant_expression ';' genvar_iteration ')'
			generate_block
	;

/* End of 'loop_generate_construct' grammer rules */


/* Start of 'genvar_initialization' grammer rules */

genvar_initialization
	: genvar_or_null identifier '=' constant_expression
	;

/* End of 'genvar_initialization' grammer rules */


/* Start of 'genvar_iteration' grammer rules */

genvar_iteration
	: identifier assignment_operator constant_expression
	| inc_or_dec_operator identifier
	| identifier inc_or_dec_operator
	;

/* End of 'genvar_iteration' grammer rules */


/* Start of 'conditional_generate_construct' grammer rules */

conditional_generate_construct
	: if_generate_construct
	| case_generate_construct
	;

/* End of 'conditional_generate_construct' grammer rules */


/* Start of 'if_generate_construct' grammer rules */

else_generate_block_or_null
	: %empty
	| SVLOG_ELSE generate_block
	;

if_generate_construct
	: SVLOG_IF '(' constant_expression ')'
		generate_block else_generate_block_or_null
	;

/* End of 'if_generate_construct' grammer rules */


/* Start of 'case_generate_construct' grammer rules */

case_generate_construct
	: SVLOG_CASE '(' constant_expression ')'
		case_generate_item_recurse SVLOG_ENDCASE
	;

/* End of 'case_generate_construct' grammer rules */


/* Start of 'case_generate_item' grammer rules */

case_generate_item
	: constant_expression_seq_list ':' generate_block
	| SVLOG_DEFAULT colon_or_null generate_block
	;

case_generate_item_recurse
	: case_generate_item
	| case_generate_item_recurse case_generate_item
	;

/* End of 'case_generate_item' grammer rules */


/* Start of 'generate_block' grammer rules */

generate_block
	: generate_item
	| ident_colon_or_null SVLOG_BEGIN colon_ident_or_null
		generate_item_recurse_or_null
			SVLOG_END colon_ident_or_null
	;

/* End of 'generate_block' grammer rules */


/* Start of 'generate_item' grammer rules */

generate_item
	: module_or_generate_item
	| interface_or_generate_item
	| checker_or_generate_item
	;

generate_item_recurse
	: generate_item
	| generate_item_recurse generate_item
	;

generate_item_recurse_or_null
	: %empty
	| generate_item_recurse
	;

/* End of 'generate_item' grammer rules */

/*******************************************************
 * End of 'Generated instantiation' Grammer Rules        *
 * Based off section: (A.4.2 Generated instantiation). *
 *******************************************************/


/***********************************************
 * Start of 'UDP declaration' Grammer Rules    *
 * Based off section: (A.5.1 UDP declaration). *
 ***********************************************/

/* Start of 'udp_nonansi_declaration' grammer rules */

udp_nonansi_declaration
	: attribute_instance_recurse_or_null
		SVLOG_PRIMITIVE identifier
			'(' udp_port_list ')' ';'
	;

/* End of 'udp_nonansi_declaration' grammer rules */


/* Start of 'udp_ansi_declaration' grammer rules */

udp_ansi_declaration
	: attribute_instance_recurse_or_null
		SVLOG_PRIMITIVE identifier
			'(' udp_declaration_port_list ')' ';'
	;

/* End of 'udp_ansi_declaration' grammer rules */


/* Start of 'udp_declaration' grammer rules */

udp_declaration
	: udp_nonansi_declaration
		udp_port_declaration_recurse udp_body
			SVLOG_ENDPRIMITIVE colon_ident_or_null
	| udp_ansi_declaration udp_body
		SVLOG_ENDPRIMITIVE colon_ident_or_null
	| SVLOG_EXTERN udp_nonansi_declaration
	| SVLOG_EXTERN udp_ansi_declaration
	| attribute_instance_recurse_or_null
		SVLOG_PRIMITIVE identifier '(' '.' '*' ')' ';'
			udp_port_declaration_recurse_or_null udp_body
				SVLOG_ENDPRIMITIVE colon_ident_or_null
	;

/* End of 'udp_declaration' grammer rules */

/***********************************************
 * End of 'UDP declaration' Grammer Rules      *
 * Based off section: (A.5.1 UDP declaration). *
 ***********************************************/


/*****************************************
 * Start of 'UDP ports' Grammer Rules    *
 * Based off section: (A.5.2 UDP ports). *
 *****************************************/

/* Start of 'udp_port_list' grammer rules */

udp_port_list
	: identifier ',' identifier_seq_list
	;

/* End of 'udp_port_list' grammer rules */


/* Start of 'udp_declaration_port_list' grammer rules */

udp_declaration_port_list
	: udp_output_declaration ','
		udp_input_declaration_seq_list
	;

/* End of 'udp_declaration_port_list' grammer rules */


/* Start of 'udp_port_declaration' grammer rules */

udp_port_declaration
	: udp_output_declaration ';'
	| udp_input_declaration ';'
	| udp_reg_declaration ';'
	;

udp_port_declaration_recurse
	: udp_port_declaration
	| udp_port_declaration_recurse udp_port_declaration
	;

udp_port_declaration_recurse_or_null
	: %empty
	| udp_port_declaration_recurse
	;

/* End of 'udp_port_declaration' grammer rules */


/* Start of 'udp_output_declaration' grammer rules */

udp_output_declaration
	: attribute_instance_recurse_or_null
		SVLOG_OUTPUT identifier
	| attribute_instance_recurse_or_null
		SVLOG_OUTPUT SVLOG_REG identifier
			equal_constant_expression_or_null
	;

/* End of 'udp_output_declaration' grammer rules */


/* Start of 'udp_input_declaration' grammer rules */

udp_input_declaration
	: attribute_instance_recurse_or_null
		SVLOG_INPUT list_of_udp_port_identifiers
	;

udp_input_declaration_seq_list
	: udp_input_declaration
	| udp_input_declaration_seq_list ',' udp_input_declaration
	;

/* End of 'udp_input_declaration' grammer rules */


/* Start of 'udp_reg_declaration' grammer rules */

udp_reg_declaration
	: attribute_instance_recurse_or_null
		SVLOG_REG identifier
	;

/* End of 'udp_reg_declaration' grammer rules */

/*****************************************
 * End of 'UDP Ports' Grammer Rules      *
 * Based off section: (A.5.2 UDP ports). *
 *****************************************/


/****************************************
 * Start of 'UDP body' Grammer Rules    *
 * Based off section: (A.5.3 UDP body). *
 ****************************************/

/* Start of 'udp_body' grammer rules */

udp_body
	: combinational_body
	| sequential_body
	;

/* End of 'udp_body' grammer rules */


/* Start of 'combinational_body' grammer rules */

combinational_body
	: SVLOG_TABLE
		combinational_entry_recurse
			SVLOG_ENDTABLE
	;

/* End of 'combinational_body' grammer rules */


/* Start of 'combinational_entry' grammer rules */

combinational_entry
	: level_symbol_recurse ':' output_symbol ';'
	;

combinational_entry_recurse
	: combinational_entry
	| combinational_entry_recurse combinational_entry
	;

/* End of 'combinational_entry' grammer rules */


/* Start of 'sequential_body' grammer rules */

sequential_body
	: udp_initial_statement_or_null SVLOG_TABLE
		sequential_entry_recurse SVLOG_ENDTABLE
	;

/* End of 'sequential_body' grammer rules */


/* Start of 'udp_initial_statement' grammer rules */

udp_initial_statement
	: SVLOG_INITIAL identifier '=' init_val ';'
	;

udp_initial_statement_or_null
	: %empty
	| udp_initial_statement
	;

/* End of 'udp_initial_statement' grammer rules */


/* Start of 'init_val' grammer rules */

init_val
	: SVLOG_INIT_VAL_APOST_LB0
	| SVLOG_INIT_VAL_APOST_LB1
	| SVLOG_INIT_VAL_APOST_LBLX
	| SVLOG_INIT_VAL_APOST_LBCX
	| SVLOG_INIT_VAL_APOST_CB0
	| SVLOG_INIT_VAL_APOST_CB1
	| SVLOG_INIT_VAL_APOST_CBLX
	| SVLOG_INIT_VAL_APOST_CBCX
	| SVLOG_DIGIT /* Must be either '1' or '0 */
	;

/* End of 'init_val' grammer rules */


/* Start of 'sequential_entry' grammer rules */

sequential_entry
	: seq_input_list ':' level_symbol ':' next_state ';'
	;

sequential_entry_recurse
	: sequential_entry
	| sequential_entry_recurse sequential_entry
	;

/* End of 'sequential_entry' grammer rules */


/* Start of 'seq_input_list' grammer rules */

seq_input_list
	: level_symbol_recurse
	| edge_input_list
	;

/* End of 'seq_input_list' grammer rules */


/* Start of 'edge_input_list' grammer rules */

edge_input_list
	: level_symbol_recurse_or_null
		edge_indicator
			level_symbol_recurse_or_null
	;

/* End of 'edge_input_list' grammer rules */


/* Start of 'edge_indicator' grammer rules */

edge_indicator
	: '(' level_symbol level_symbol ')'
	| edge_symbol
	;

/* End of 'edge_indicator' grammer rules */


/* Start of 'next_state' grammer rules */

next_state
	: output_symbol
	| '-'
	;

/* End of 'next_state' grammer rules */


/* Start of 'output_symbol' grammer rules */

output_symbol
	: SVLOG_DIGIT /* Must be 0 or 1 */
	| 'x'
	| 'X'
	;

/* End of 'output_symbol' grammer rules */


/* Start of 'level_symbol' grammer rules */

level_symbol
	: SVLOG_DIGIT /* Must be 0 or 1 */
	| 'x'
	| 'X'
	| '?'
	| 'b'
	| 'B'
	;

level_symbol_recurse
	: level_symbol
	| level_symbol_recurse level_symbol
	;

level_symbol_recurse_or_null
	: %empty
	| level_symbol_recurse
	;

/* End of 'level_symbol' grammer rules */


/* Start of 'edge_symbol' grammer rules */

edge_symbol
	: 'r'
	| 'R'
	| 'f'
	| 'F'
	| 'p'
	| 'P'
	| 'n'
	| 'N'
	| '*'
	;

/* End of 'edge_symbol' grammer rules */

/****************************************
 * End of 'UDP body' Grammer Rules      *
 * Based off section: (A.5.3 UDP body). *
 ****************************************/


/*************************************************
 * Start of 'UDP instantiation' Grammer Rules    *
 * Based off section: (A.5.4 UDP instantiation). *
 *************************************************/

/* Start of 'udp_instantiation' grammer rules */

udp_instantiation
	: identifier drive_strength_or_null
		delay2_or_null udp_instance_seq_list ';'
	;

/* End of 'udp_instantiation' grammer rules */


/* Start of 'udp_instance' grammer rules */

udp_instance
	: name_of_instance_or_null
		'(' output_terminal ',' input_terminal_seq_list ')'
	;

udp_instance_seq_list
	: udp_instance
	| udp_instance_seq_list ',' udp_instance
	;

/* End of 'udp_instance' grammer rules */

/*************************************************
 * End of 'UDP instantiation' Grammer Rules      *
 * Based off section: (A.5.4 UDP instantiation). *
 *************************************************/


/******************************************************************************
 * Start of 'Continuous assignment and net alias statements' Grammer Rules    *
 * Based off section: (A.6.1 Continuous assignment and net alias statements). *
 ******************************************************************************/

/* Start of 'continuous_assign' grammer rules */

continuous_assign
	: SVLOG_ASSIGN drive_strength_or_null
		delay3_or_null list_of_net_assignments ';'
	| SVLOG_ASSIGN delay_control_or_null
		list_of_variable_assignments ';'
	;

/* End of 'continuous_assign' grammer rules */


/* Start of 'list_of_net_assignments' grammer rules */

list_of_net_assignments
	: net_assignment_seq_list
	;

/* End of 'list_of_net_assignments' grammer rules */


/* Start of 'list_of_variable_assignments' grammer rules */

list_of_variable_assignments
	: variable_assignment
	| list_of_variable_assignments ',' variable_assignment
	;

/* End of 'list_of_variable_assignments' grammer rules */


/* Start of 'net_alias' grammer rules */

net_alias
	: SVLOG_ALIAS net_lvalue
		equal_net_lvalue_recurse ';'
	;

/* End of 'net_alias' grammer rules */


/* Start of 'net_assignment_seq_list' grammer rules */

net_assignment
	: net_lvalue equal_expression
	;

net_assignment_seq_list
	: net_assignment
	| net_assignment_seq_list ',' net_assignment
	;

/* End of 'net_assignment_seq_list' grammer rules */

/******************************************************************************
 * End of 'Continuous assignment and net alias statements' Grammer Rules      *
 * Based off section: (A.6.1 Continuous assignment and net alias statements). *
 ******************************************************************************/


/*****************************************************************
 * Start of 'Procedural blocks and assignments' Grammer Rules    *
 * Based off section: (A.6.2 Procedural blocks and assignments). *
 *****************************************************************/

/* Start of 'initial_construct' grammer rules */

initial_construct
	: SVLOG_INITIAL statement_or_null
	;

/* End of 'initial_construct' grammer rules */


/* Start of 'always_construct' grammer rules */

always_construct
	: always_keyword statement
	;

/* End of 'always_construct' grammer rules */


/* Start of 'always_keyword' grammer rules */

always_keyword
	: SVLOG_ALWAYS
	| SVLOG_ALWAYS_COMB
	| SVLOG_ALWAYS_LATCH
	| SVLOG_ALWAYS_FF
	;

/* End of 'always_keyword' grammer rules */


/* Start of 'final_construct' grammer rules */

final_construct
	: SVLOG_FINAL statement
	;

/* End of 'final_construct' grammer rules */


/* Start of 'blocking_assignment' grammer rules */

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

/* End of 'blocking_assignment' grammer rules */


/* Start of 'operator_assignment' grammer rules */

operator_assignment
	: variable_lvalue assignment_operator expression
	;

/* End of 'operator_assignment' grammer rules */


/* Start of 'assignment_operator' grammer rules */

assignment_operator
	: '='
	| ADDITION_ASSIGN
	| REDUCTION_ASSIGN
	| MULTIPLY_ASSIGN
	| DIVIDE_ASSIGN
	| MODULUS_ASSIGN
	| BIT_WISE_AND_ASSIGN 
	| BIT_WISE_OR_ASSIGN 
	| BIT_WISE_XOR_ASSIGN 
	| LEFT_SHIFT_ASSIGN
	| RIGHT_SHIFT_ASSIGN
	| LOGICAL_LEFT_SHIFT_ASSIGN
	| LOGICAL_RIGHT_SHIFT_ASSIGN
	;

/* End of 'assignment_operator' grammer rules */


/* Start of 'nonblocking_assignment' grammer rules */

nonblocking_assignment
	: variable_lvalue NON_BLOCK_ASSIGNMENT
		delay_or_event_control_or_null expression
	;

/* End of 'nonblocking_assignment' grammer rules */


/* Start of 'procedural_continuous_assignment' grammer rules */

procedural_continuous_assignment
	: SVLOG_ASSIGN variable_assignment
	| SVLOG_DEASSIGN variable_lvalue
	| SVLOG_FORCE variable_assignment
	| SVLOG_FORCE net_assignment
	| SVLOG_RELEASE variable_lvalue
	| SVLOG_RELEASE net_lvalue
	;

/* End of 'procedural_continuous_assignment' grammer rules */


/* Start of 'variable_assignment' grammer rules */

variable_assignment
	: variable_lvalue equal_expression
	;

/* End of 'variable_assignment' grammer rules */

/*****************************************************************
 * End of 'Procedural blocks and assignments' Grammer Rules      *
 * Based off section: (A.6.2 Procedural blocks and assignments). *
 *****************************************************************/


/**************************************************************
 * Start of 'Parallel and sequential blocks' Grammer Rules    *
 * Based off section: (A.6.3 Parallel and sequential blocks). *
 **************************************************************/

/* Start of 'action_block' grammer rules */

action_block
	: statement_or_null
	| SVLOG_ELSE statement_or_null
	| statement SVLOG_ELSE statement_or_null
	;

/* End of 'action_block' grammer rules */


/* Start of 'seq_block' grammer rules */

seq_block
	: SVLOG_BEGIN colon_ident_or_null
		block_item_declaration_recurse_or_null
			statement_or_null_recurse_or_null
				SVLOG_END colon_ident_or_null
	;

/* End of 'seq_block' grammer rules */


/* Start of 'par_block' grammer rules */

par_block
	: SVLOG_FORK colon_ident_or_null
		block_item_declaration_recurse_or_null
			statement_or_null_recurse_or_null
				join_keyword colon_ident_or_null
	;

/* End of 'par_block' grammer rules */


/* Start of 'join_keyword' grammer rules */

join_keyword
	: SVLOG_JOIN
	| SVLOG_JOIN_ANY
	| SVLOG_JOIN_NONE
	;

/* End of 'join_keyword' grammer rules */

/**************************************************************
 * End of 'Parallel and sequential blocks' Grammer Rules      *
 * Based off section: (A.6.3 Parallel and sequential blocks). *
 **************************************************************/


/******************************************
 * Start of 'Statements' Grammer Rules    *
 * Based off section: (A.6.4 Statements). *
 ******************************************/

/* Start of 'statement_or_null' grammer rules */

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

/* End of 'statement_or_null' grammer rules */


/* Start of 'statement' grammer rules */

statement
	: ident_colon_or_null
		attribute_instance_recurse_or_null
			statement_item
	;

/* End of 'statement' grammer rules */


/* Start of 'statement_item' grammer rules */

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

/* End of 'statement_item' grammer rules */


/* Start of 'function_statement_or_null' grammer rules */

function_statement_or_null
	: statement
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

/* End of 'function_statement_or_null' grammer rules */

/******************************************
 * End of 'Statements' Grammer Rules      *
 * Based off section: (A.6.4 Statements). *
 ******************************************/


/*********************************************************
 * Start of 'Timing control statements' Grammer Rules    *
 * Based off section: (A.6.5 Timing control statements). *
 *********************************************************/

/* Start of 'procedural_timing_control_statement' grammer rules */

procedural_timing_control_statement
	: procedural_timing_control statement_or_null
	;

/* End of 'procedural_timing_control_statement' grammer rules */


/* Start of 'delay_or_event_control' grammer rules */

delay_or_event_control
	: delay_control
	| event_control
	| SVLOG_REPEAT '(' expression ')' event_control
	;

delay_or_event_control_or_null
	: %empty
	| delay_or_event_control
	;

/* End of 'delay_or_event_control' grammer rules */


/* Start of 'delay_control' grammer rules */

delay_control
	: delay
	| '#' '(' mintypmax_expression ')'
	;

delay_control_or_null
	: %empty
	| delay_control
	;

/* End of 'delay_control' grammer rules */


/* Start of 'event_control' grammer rules */

event_control
	: clocking_event
	| '@' '*'
	| '@' '(' '*' ')'
	;

/* End of 'event_control' grammer rules */


/* Start of 'clocking_event' grammer rules */

clocking_event
	: '@' ps_identifier
	| '@' hierarchical_identifier
	| '@' '(' event_expression ')'
	;

clocking_event_or_null
	: %empty
	| clocking_event
	;

/* End of 'clocking_event' grammer rules */


/* Start of 'event_expression' grammer rules */

event_expression
	: edge_identifier_or_null iff_expression_or_null
	| sequence_instance iff_expression_or_null
	| event_expression SVLOG_OR event_expression
	| event_expression ',' event_expression
	| '(' event_expression ')'
	;

/* End of 'event_expression' grammer rules */


/* Start of 'procedural_timing_control' grammer rules */

procedural_timing_control
	: delay_control
	| event_control
	| cycle_delay
	;

/* End of 'procedural_timing_control' grammer rules */


/* Start of 'jump_statement' grammer rules */

jump_statement
	: SVLOG_RETURN expression_or_null ';'
	| SVLOG_BREAK ';'
	| SVLOG_CONTINUE ';'
	;

/* End of 'jump_statement' grammer rules */


/* Start of 'wait_statement' grammer rules */

wait_statement
	: SVLOG_WAIT '(' expression ')' statement_or_null
	| SVLOG_WAIT SVLOG_FORK ';'
	| SVLOG_WAIT_ORDER '(' hierarchical_identifier_seq_list ')' action_block
	;

/* End of 'wait_statement' grammer rules */


/* Start of 'event_trigger' grammer rules */

event_trigger
	: IMPLICATION_OPERATOR
		hierarchical_identifier
			nonrange_select ';'
	| NONBLOCK_IMPLICATION_OPERATOR
		delay_or_event_control_or_null
			hierarchical_identifier
				nonrange_select ';'
	;

/* End of 'event_trigger' grammer rules */


/* Start of 'disable_statement' grammer rules */

disable_statement
	: SVLOG_DISABLE hierarchical_identifier ';'
	| SVLOG_DISABLE SVLOG_FORK ';'
	;

/* End of 'disable_statement' grammer rules */

/*********************************************************
 * End of 'Timing control statements' Grammer Rules      *
 * Based off section: (A.6.5 Timing control statements). *
 *********************************************************/


/******************************************************
 * Start of 'Conditional statements' Grammer Rules    *
 * Based off section: (A.6.6 Conditional statements). *
 ******************************************************/

/* Start of 'conditional_statement' grammer rules */

cs_else_if_seq_list
	: SVLOG_ELSE SVLOG_IF '(' cond_predicate ')' statement_or_null
	| cs_else_if_seq_list SVLOG_ELSE SVLOG_IF '(' cond_predicate ')' statement_or_null
	;

cs_else_if_seq_list_or_null
	: %empty
	| cs_else_if_seq_list
	;

cs_else_or_null
	: %empty
	| SVLOG_ELSE statement_or_null
	;

conditional_statement
	: unique_priority_or_null SVLOG_IF '(' cond_predicate ')'
		statement_or_null cs_else_if_seq_list_or_null cs_else_or_null
	;

/* End of 'conditional_statement' grammer rules */


/* Start of 'unique_priority' grammer rules */

unique_priority
	: SVLOG_UNIQUE
	| SVLOG_UNIQUE0
	| SVLOG_PRIORITY
	;

unique_priority_or_null
	: %empty
	| unique_priority
	;

/* End of 'unique_priority' grammer rules */


/* Start of 'cond_predicate' grammer rules */

cond_predicate
	: expression_or_cond_pattern
		iff_expression_or_cond_pattern_seq_list_or_null
	;

/* End of 'cond_predicate' grammer rules */


/* Start of 'expression_or_cond_pattern' grammer rules */

expression_or_cond_pattern
	: expression
	| cond_pattern
	;

iff_expression_or_cond_pattern_seq_list
	: SVLOG_IF_AND_ONLY_IF expression_or_cond_pattern
	| iff_expression_or_cond_pattern_seq_list
		SVLOG_IF_AND_ONLY_IF expression_or_cond_pattern
	;

iff_expression_or_cond_pattern_seq_list_or_null
	: %empty
	| iff_expression_or_cond_pattern_seq_list
	;

/* End of 'expression_or_cond_pattern' grammer rules */


/* Start of 'cond_pattern' grammer rules */

cond_pattern
	: expression SVLOG_MATCHES pattern
	;

/* End of 'cond_pattern' grammer rules */

/******************************************************
 * End of 'Conditional statements' Grammer Rules      *
 * Based off section: (A.6.6 Conditional statements). *
 ******************************************************/


/***********************************************
 * Start of 'Case statements' Grammer Rules    *
 * Based off section: (A.6.7 Case statements). *
 ***********************************************/

/* Start of 'case_statement' grammer rules */

case_statement
	: unique_priority_or_null
		case_keyword '(' expression ')'
			case_item_recurse SVLOG_ENDCASE
	| unique_priority_or_null
		case_keyword '(' expression ')' SVLOG_MATCHES
			case_pattern_item_recurse SVLOG_ENDCASE
	| unique_priority_or_null
		SVLOG_CASE '(' expression ')' SVLOG_INSIDE
			case_inside_item_recurse SVLOG_ENDCASE
	;

/* End of 'case_statement' grammer rules */


/* Start of 'case_keyword' grammer rules */

case_keyword
	: SVLOG_CASE
	| SVLOG_CASEZ
	| SVLOG_CASEX
	;

/* End of 'case_keyword' grammer rules */


/* Start of 'case_item' grammer rules */

case_item
	: case_item_expression_seq_list ':' statement_or_null
	| SVLOG_DEFAULT colon_or_null statement_or_null
	;

case_item_recurse
	: case_item
	| case_item_recurse case_item
	;

case_item_expression_seq_list
	: expression
	| case_item_expression_seq_list ',' expression
	;

/* End of 'case_item' grammer rules */


/* Start of 'case_pattern_item' grammer rules */

case_pattern_item
	: pattern iff_expression_or_null ':' statement_or_null
	| SVLOG_DEFAULT colon_or_null statement_or_null
	;

case_pattern_item_recurse
	: case_pattern_item
	| case_pattern_item_recurse case_pattern_item
	;

/* End of 'case_pattern_item' grammer rules */


/* Start of 'case_inside_item' grammer rules */

case_inside_item
	: range_list ':' statement_or_null
	| SVLOG_DEFAULT colon_or_null statement_or_null
	;

case_inside_item_recurse
	: case_inside_item
	| case_inside_item_recurse case_inside_item
	;

/* End of 'case_inside_item' grammer rules */


/* Start of 'randcase_statement' grammer rules */

randcase_statement
	: SVLOG_RANDCASE randcase_item_recurse SVLOG_ENDCASE
	;

/* End of 'randcase_statement' grammer rules */


/* Start of 'randcase_item' grammer rules */

randcase_item
	: expression ':' statement_or_null
	;

randcase_item_recurse
	: randcase_item
	| randcase_item_recurse randcase_item
	;

/* End of 'randcase_item' grammer rules */


/* Start of 'range_list' grammer rules */

range_list
	: value_range
	| range_list ',' value_range
	;

/* End of 'range_list' grammer rules */


/* Start of 'value_range' grammer rules */

value_range
	: expression
	| '[' expression ':' expression ']'
	| BOUNDED_QUEUE_INITIALIZE expression ']'
	| '[' expression BOUNDED_QUEUE_FINALIZE
	| '[' expression ABSOLUTE_TOLERANCE_RANGE expression ']'
	| '[' expression RELATIVE_TOLERANCE_RANGE expression ']'
	;

/* End of 'value_range' grammer rules */

/***********************************************
 * End of 'Case statements' Grammer Rules      *
 * Based off section: (A.6.7 Case statements). *
 ***********************************************/


/******************************************
 * Start of 'Patterns' Grammer Rules      *
 * Based off section: (A.6.7.1 Patterns). *
 ******************************************/

/* Start of 'pattern' grammer rules */

pattern
	: '(' pattern ')'
	| period_ident
	| '.' '*'
	| constant_expression
	| SVLOG_TAGGED identifier pattern_or_null
	| APOSTROPHE '{' pattern_seq_list '}'
	| APOSTROPHE '{' pattern_ident_seq_list '}'
	;

pattern_or_null
	: %empty
	| pattern
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

/* End of 'pattern' grammer rules */


/* Start of 'assignment_pattern' grammer rules */

assignment_pattern
	: APOSTROPHE '{' expression_seq_list '}'
	| APOSTROPHE '{' structure_pattern_key_expression_seq_list '}'
	| APOSTROPHE '{' array_pattern_key_expression_seq_list '}'
	| APOSTROPHE '{' constant_expression '{' expression_seq_list '}' '}'
	;

/* End of 'assignment_pattern' grammer rules */


/* Start of 'structure_pattern_key' grammer rules */

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

/* End of 'structure_pattern_key' grammer rules */


/* Start of 'array_pattern_key' grammer rules */

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

/* End of 'array_pattern_key' grammer rules */


/* Start of 'assignment_pattern_key' grammer rules */

assignment_pattern_key
	: simple_type
	| SVLOG_DEFAULT
	;

/* End of 'assignment_pattern_key' grammer rules */


/* Start of 'assignment_pattern_expression' grammer rules */

assignment_pattern_expression
	: assignment_pattern_expression_type_or_null
		assignment_pattern
	;

/* End of 'assignment_pattern_expression' grammer rules */


/* Start of 'assignment_pattern_expression_type' grammer rules */

assignment_pattern_expression_type
	: ps_type_identifier
	| ps_parameter_identifier
	| integer_atom_type
	| type_reference
	;

assignment_pattern_expression_type_or_null
	: %empty
	| assignment_pattern_expression_type
	;

/* End of 'assignment_pattern_expression_type' grammer rules */


/* Start of 'assignment_pattern_net_lvalue' grammer rules */

assignment_pattern_net_lvalue
	: APOSTROPHE '{' net_lvalue_seq_list '}'
	;

/* End of 'assignment_pattern_net_lvalue' grammer rules */


/* Start of 'assignment_pattern_variable_lvalue' grammer rules */

assignment_pattern_variable_lvalue
	: APOSTROPHE '{' variable_lvalue_seq_list '}'
	;

/* End of 'assignment_pattern_variable_lvalue' grammer rules */

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
	: clockvar_expression NON_BLOCK_ASSIGNMENT cycle_delay_or_null expression
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

edge_identifier_or_null
	: %empty
	| edge_identifier
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
	: expression
	| '.' identifier '(' ')'
	| '.' identifier '(' expression ')'
	| list_of_arguments ',' expression
	| list_of_arguments ',' '.' identifier '(' ')'
	| list_of_arguments ',' '.' identifier '(' expression ')'
	;

list_of_arguments_or_null
	: %empty
	| list_of_arguments
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
	| '(' ')' SVLOG_WITH '(' identifier_seq_list ')' constraint_block
	| '(' identifier_seq_list ')'
	| '(' identifier_seq_list ')' SVLOG_WITH constraint_block
	| '(' identifier_seq_list ')' SVLOG_WITH '(' ')' constraint_block
	| '(' identifier_seq_list ')' SVLOG_WITH '(' identifier_seq_list ')' constraint_block
	| '(' SVLOG_NULL ')'
	| '(' SVLOG_NULL ')' SVLOG_WITH constraint_block
	| '(' SVLOG_NULL ')' SVLOG_WITH '(' ')' constraint_block
	| '(' SVLOG_NULL ')' SVLOG_WITH '(' identifier_seq_list ')' constraint_block
	| SVLOG_WITH constraint_block
	| SVLOG_WITH '(' ')' constraint_block
	| SVLOG_WITH '(' identifier_seq_list ')' constraint_block
	;

randomize_call
	: SVLOG_RANDOMIZE attribute_instance_recurse_or_null randomize_call_helper
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

constant_expression_seq_list
	: constant_expression
	| constant_expression_seq_list ',' constant_expression
	;

constant_mintypmax_expression
	: constant_expression
	| constant_expression ':' constant_expression ':' constant_expression
	;

equal_constant_mintypmax_expression
	: '=' constant_mintypmax_expression
	;

equal_constant_mintypmax_expression_or_null
	: %empty
	| equal_constant_mintypmax_expression
	;

constant_param_expression
	: constant_mintypmax_expression
	| data_type
	| '$'
	;

equal_constant_param_expression
	: '=' constant_param_expression
	;

equal_constant_param_expression_or_null
	: %empty
	| equal_constant_param_expression
	;

param_expression
	: mintypmax_expression
	| data_type
	| '$'
	;

param_expression_or_null
	: %empty
	| param_expression
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

/* Start of 'expression' grammer rules */

expression
	: primary
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

equal_expression
	: '=' expression
	;

equal_expression_or_null
	: %empty
	| equal_expression
	;

square_brackets_expression
	: '[' expression ']'
	;

square_brackets_expression_or_null
	: %empty
	| square_brackets_expression
	;

paren_expression
	: '(' expression ')'
	;

paren_expression_or_null
	: %empty
	| paren_expression
	;

iff_expression
	: SVLOG_IF_AND_ONLY_IF '(' expression ')'
	| SVLOG_IF_AND_ONLY_IF expression
	;

iff_expression_or_null
	: %empty
	| iff_expression
	;

/* End of 'expression' grammer rules */

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
	| assignment_pattern_expression
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
	: 's'
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

equal_net_lvalue
	: '=' net_lvalue
	;

equal_net_lvalue_recurse
	: equal_net_lvalue
	| equal_net_lvalue_recurse equal_net_lvalue
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
	| NON_BLOCK_ASSIGNMENT
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
	: 'e'
	| 'E'
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
	: APOSTROPHE 'd'
	| APOSTROPHE 'D'
	| APOSTROPHE 's' 'd'
	| APOSTROPHE 'S' 'd'
	| APOSTROPHE 's' 'D'
	| APOSTROPHE 'S' 'D'
	;

binary_base
	: APOSTROPHE 'b'
	| APOSTROPHE 'B'
	| APOSTROPHE 's' 'b'
	| APOSTROPHE 's' 'B'
	| APOSTROPHE 'S' 'b'
	| APOSTROPHE 'S' 'B'
	;

octal_base
	: APOSTROPHE 'o'
	| APOSTROPHE 'O'
	| APOSTROPHE 's' 'o'
	| APOSTROPHE 's' 'O'
	| APOSTROPHE 'S' 'o'
	| APOSTROPHE 'S' 'O'
	;

hex_base
	: APOSTROPHE 'h'
	| APOSTROPHE 'H'
	| APOSTROPHE 's' 'h'
	| APOSTROPHE 's' 'H'
	| APOSTROPHE 'S' 'h'
	| APOSTROPHE 'S' 'H'
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
	: 'x'
	| 'X'
	;

z_digit
	: 'z'
	| 'Z'
	| '?'
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
	| SVLOG_DSROOT '.' identifier
	| hierarchical_identifier identifier constant_bit_select '.'
	;

hierarchical_identifier_seq_list
	: hierarchical_identifier
	| hierarchical_identifier_seq_list ',' hierarchical_identifier
	;

hierarchical_identifier_period_or_class_scope
	: hierarchical_identifier '.'
	| class_scope
	;

hierarchical_identifier_period_or_class_scope_or_null
	: %empty
	| hierarchical_identifier_period_or_class_scope
	;

identifier
	: SVLOG_SIDENT { fprintf(stdout, "statement(SVLOG_SIDENT) -> %s\n", $1); }
	| SVLOG_EIDENT { fprintf(stdout, "statement(SVLOG_EIDENT) -> %s\n", $1); }
	;

identifier_seq_list
	: identifier
	| identifier_seq_list ',' identifier
	;

identifier_recurse
	: identifier
	| identifier_recurse identifier
	;

identifier_recurse_or_null
	: %empty
	| identifier_recurse
	;

package_scope
	: identifier CLASS_SCOPE_OPERATOR
	| SVLOG_DSUNIT CLASS_SCOPE_OPERATOR
	;

package_scope_or_null
	: %empty
	| package_scope
	;

ps_class_identifier
	: package_scope_or_null identifier
	;

ps_covergroup_identifier
	: package_scope_or_null identifier
	;

ps_checker_identifier
	: package_scope_or_null identifier
	;

ps_identifier
	: package_scope_or_null identifier
	;

ps_or_hierarchical_array_identifier
	: class_or_package_scope_or_null identifier
	| implicit_class_handle '.' identifier
	;

ps_or_hierarchical_net_identifier
	: package_scope_or_null identifier
	| hierarchical_identifier
	;

ps_or_hierarchical_property_identifier
	: package_scope_or_null identifier
	| hierarchical_property_identifier
	;

ps_or_hierarchical_sequence_identifier
	: package_scope_or_null identifier
	| hierarchical_identifier
	;

ps_or_hierarchical_tf_identifier
	: package_scope_or_null identifier
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

colon_or_null
	: %empty
	| ':'
	;

semicolon_or_null
	: %empty
	| ';'
	;

ident_colon
	: identifier ':'
	;

ident_colon_or_null
	: %empty
	| ident_colon
	;

colon_ident
	: ':' identifier
	;

colon_ident_or_null
	: %empty
	| colon_ident
	;

disable_iff_expr_or_dist
	: SVLOG_DISABLE SVLOG_IF_AND_ONLY_IF '(' expression_or_dist ')'
	;

disable_iff_expr_or_dist_or_null
	: %empty
	| disable_iff_expr_or_dist
	;

interface_or_null
	: SVLOG_INTERFACE
	| %empty
	;

/* Start of 'ident_period' grammer rules */

ident_period
	: identifier '.'
	;

ident_period_or_null
	: %empty
	| ident_period
	;

ident_period_recurse
	: ident_period
	| ident_period_recurse ident_period
	;

ident_period_recurse_or_null
	: %empty
	| ident_period_recurse
	;

/* End of 'ident_period' grammer rules */


/* Start of 'period_ident' grammer rules */

period_ident
	: '.' identifier
	;

period_ident_or_null
	: %empty
	| period_ident
	;

period_ident_recurse
	: period_ident
	| period_ident_recurse period_ident
	;

period_ident_recurse_or_null
	: %empty
	| period_ident_recurse
	;

/* End of 'period_ident' grammer rules */

class_or_package_scope_or_null
	: class_scope
	| package_scope
	| %empty
	;

ident_or_class_scope_or_null
	: %empty
	| period_ident
	| class_scope
	;

var_or_null
	: SVLOG_VAR
	| %empty
	;

equal_constant_expression
	: '=' constant_expression
	;

equal_constant_expression_or_null
	: equal_constant_expression
	| %empty
	;

const_or_null
	: SVLOG_CONST
	| %empty
	;

static_or_null
	: %empty
	| SVLOG_STATIC
	;

virtual_or_null
	: %empty
	| SVLOG_VIRTUAL
	;

wildcard_or_null
	: %empty
	| SVLOG_WILDCARD
	;

rand_or_null
	: %empty
	| SVLOG_RAND
	;

genvar_or_null
	: %empty
	| SVLOG_GENVAR
	;

colon_config
	: ':' SVLOG_CONFIG
	;

colon_config_or_null
	: %empty
	| colon_config
	;

colon_new
	: ':' SVLOG_NEW
	;

colon_new_or_null
	: %empty
	| colon_new
	;

square_brackets_or_null
	: %empty
	| '[' ']'
	;

/*********************************
 * End of 'helper' grammer rules *
 *********************************/

%%
