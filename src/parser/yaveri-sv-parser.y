%{
#include <stdio.h>

#include "yaveri-sv-parser.tab.h"

extern int yylex(void);
extern int yyerror(char *message);
%}

/* declare tokens */
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

%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%
calclist: /* nothing */
	| calclist exp EOL { printf("= %d\n", $2); }
	;

exp: factor
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }
	;

factor: term
	| factor MUL term { $$ = $1 * $3; }
	| factor DIV term { $$ = $1 / $3; }
	;

term: NUMBER
	| ABS term   { $$ = $2 >= 0? $2 : - $2; }
	;
%%
