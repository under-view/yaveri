	// output file definitions
%option outfile="lexer.c" header-file="lexer.h"

%option noinput nounput 8bit nodefault

%option always-interactive

%option noyywrap

%{

%}

%%
[ \n\t\f\v]   { /* skip blanks */ }
  /*Regular expression for single line comment*/
\/\/(.*) {};
  /*Regular expression for multi line comment*/
\/\*(.*\n)*.*\*\/  {};
.             { fprintf(yyout, "%s", yytext); }
%%
