%option noinput nounput 8bit nodefault
%option reentrant bison-bridge
%option always-interactive

	/*******************************
	 * Start of definition section *
	 *******************************/
%{

#include "parser/parser-private.h"

#include "yaveri-sv-parser.tab.h"

%}
	/*****************************
	 * End of definition section *
	 *****************************/


	/**************************
	 * Start of rules section *
	 **************************/

	/* Digit */
DIGIT [0-9]
	/* Hex characters */
HEXCHAR [a-fA-F]
	/* Escape identifier regex */
EIDENT ^[\\][^ ]*
	/* Simple identifier regex */
SIDENT ^[_a-zA-Z][_$0-9a-zA-Z]*[^;]
	/* Quoted String regex */
QUOTEDS [^\n"\\]+
	/* Triple Quoted String regex */
TRIPLEQS [^\\]+
	/* String Escape Sequence regex */
SESCAPESEQ ^[\\].*
	/* System task and functions identifier regex */
STFIDENT ^[$][a-zA-Z0-9_$]+[^;]
	/* system-verilog exp regex */
SVEXP [e|E]
	/* decimal-base D regex */
SVDECBASED [d|D]
	/* decimal-base S regex */
SVDECBASES [s|S]
	/* binary-base B regex */
SVBINBASE [b|B]
	/* octal-base O regex */
SVOCTBASE [o|O]
	/* hex-base H regex */
SVHEXBASE [h|H]
	/* X digit regex */
SVXDIGIT [x|X]
	/* Z digit regex */
SVZDIGIT [z|Z|?]
	/* Single comment regex */
SCOMMENT \/\/(.*)
	/* Multi comment regex */
MCOMMENT \/\*(.*\n)*.*\*\/

%%
	/* Start of reserved words */
"module"       { return SVLOG_MODULE;       }
"endmodule"    { return SVLOG_ENDMODULE;    }
"program"      { return SVLOG_PROGRAM;      }
"endprogram"   { return SVLOG_ENDPROGRAM;   }
"interface"    { return SVLOG_INTERFACE;    }
"endinterface" { return SVLOG_ENDINTERFACE; }
"checker"      { return SVLOG_CHECKER;      }
"endchecker"   { return SVLOG_ENDCHECKER;   }
"package"      { return SVLOG_PACKAGE;      }
"endpackage"   { return SVLOG_ENDPACKAGE;   }
"primitive"    { return SVLOG_PRIMITIVE;    }
"endprimitive" { return SVLOG_ENDPRIMITIVE; }
"config"       { return SVLOG_CONFIG;       }
"endconfig"    { return SVLOG_ENDCONFIG;    }

"s"            { return SVLOG_SEC;          }
"ms"           { return SVLOG_MILLISEC;     }
"us"           { return SVLOG_MICROSEC;     }
"ns"           { return SVLOG_NANOSEC;      }
"ps"           { return SVLOG_PICOSEC;      }
"fs"           { return SVLOG_fEMTOSEC;     }
"step"         { return SVLOG_STEP;         }

"this"         { return SVLOG_THIS;         }
"null"         { return SVLOG_NULL;         }

"reg"          { return SVLOG_REG;          }
"wire"         { return SVLOG_WIRE;         }
"integer"      { return SVLOG_INTEGER;      }
"real"         { return SVLOG_REAL;         }
"time"         { return SVLOG_TIME;         }
"realtime"     { return SVLOG_REAL_TIME;    }
"logic"        { return SVLOG_LOGIC;        }
"bit"          { return SVLOG_BIT;          }
"byte"         { return SVLOG_BYTE;         }
"shortint"     { return SVLOG_SHORT_INT;    }
"int"          { return SVLOG_INT;          }
"longint"      { return SVLOG_LONG_INT;     }
"shortreal"    { return SVLOG_SHORT_REAL;   }
"!"            { return LOGICAL_NOT;        }
"~"            { return BIT_WISE_NOT;       }
"&"            { return BIT_WISE_AND;       }
"~&"           { return BIT_WISE_NAND;      }
"|"            { return BIT_WISE_OR;        }
"~|"           { return BIT_WISE_NOR;       }
"^"            { return BIT_WISE_XOR;       }
"~^"           { return BIT_WISE_XNOR;      }
"^~"           { return BIT_WISE_XNOR;      }

";"            { return ';';                }
"+"            { return '+';                }
"-"            { return '-';                }
"_"            { return '_';                }
"."            { return '.';                }
","            { return ',';                }
"'"            { return '\'';               }
"\""           { return '"';                }
"("            { return '(';                }
")"            { return ')';                }

{SVEXP}        { return SVLOG_EXP;          }
{SVDECBASED}   { return SVLOG_DEC_BASE_D;   }
{SVDECBASES}   { return SVLOG_DEC_BASE_S;   }
{SVBINBASE}    { return SVLOG_BIN_BASE;     }
{SVOCTBASE}    { return SVLOG_OCT_BASE;     }
{SVHEXBASE}    { return SVLOG_HEX_BASE;     }
{SVXDIGIT}     { return SVLOG_Z_DIGIT;      }
{SVZDIGIT}     { return SVLOG_X_DIGIT;      }
	/* End of reserved words */

{DIGIT}        { return SVLOG_DIGIT;        }
{HEXCHAR}      { return SVLOG_HEXCHAR;      }
{QUOTEDS}      { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_QUOTED_STRING; }
{TRIPLEQS}     { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_TRIPLE_QUOTED_STRING; }
{STFIDENT}     { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_STFIDENT; }
{SIDENT}       { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_SIDENT;   }
{EIDENT}       { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_EIDENT;   }
{SESCAPESEQ}   { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_ESCAPE_SEQ; }
{SCOMMENT}     {      /* Do nothing */      }
{MCOMMENT}     {      /* Do nothing */      }
[ \n\t\f\v]    {      /* Do nothing */      }
.              { fprintf(stdout, "bad input character '%s' at line %d\n", yytext, yylineno); }

%%
	/************************
	 * End of rules section *
	 ************************/
