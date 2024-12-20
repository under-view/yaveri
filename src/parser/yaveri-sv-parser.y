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

%start svlog

%%

svlog: %empty

%%
