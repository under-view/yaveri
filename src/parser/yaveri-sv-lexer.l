	/* output file definitions */
%option outfile="yaveri-sv-lexer.c" header-file="yaveri-sv-lexer.h"

%option noinput nounput 8bit nodefault

%option always-interactive

%option noyywrap

	/********************************
	 * Start of definitions section *
	 ********************************/
%{

#include "parser/reserved-words.h"
#include "parser/parser.h"

%}
	/******************************
	 * End of definitions section *
	 ******************************/


	/**************************
	 * Start of rules section *
	 **************************/
%%
	/* Start of reserved words */
"reg"       { return SVLOG_REG;        } 
"wire"      { return SVLOG_WIRE;       }
"integer"   { return SVLOG_INTEGER;    }
"real"      { return SVLOG_REAL;       }
"time"      { return SVLOG_TIME;       }
"realtime"  { return SVLOG_REAL_TIME;  }
"logic"     { return SVLOG_LOGIC;      }
"bit"       { return SVLOG_BIT;        }
"byte"      { return SVLOG_BYTE;       }
"shortint"  { return SVLOG_SHORT_INT;  }
"int"       { return SVLOG_INT;        }
"longint"   { return SVLOG_LONG_INT;   }
"shortreal" { return SVLOG_SHORT_REAL; }
	/* End of reserved words */


[ \n\t\f\v] { /* skip blanks */ }

	/* Regular expression for single line comment*/
\/\/(.*) {};

	/* Regular expression for multi line comment*/
\/\*(.*\n)*.*\*\/  {};

%%
	/************************
	 * End of rules section *
	 ************************/
