%option noinput nounput 8bit nodefault

%option always-interactive

	/*******************************
	 * Start of definition section *
	 *******************************/
%{

#include "yaveri-sv-parser.tab.h"

#include "parser/parser.h"

%}
	/*****************************
	 * End of definition section *
	 *****************************/


	/**************************
	 * Start of rules section *
	 **************************/

	/* Simple identifier regex */
SIDENT [_a-zA-Z][_$0-9a-zA-Z]+|[_a-zA-Z]
	/* Escape identifier regex */
	/* WILL NEED TO BE UPDATED WHEN UNDERSTOOD MORE */
EIDENT [\\\S* ]
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
"["            { return LSBRAC;             }
"]"            { return RSBRAC;             }
":"            { return COLON;              }
";"            { return SEMICOLON;          }
"_"            { return UNDERSCORE;         }
"+"            { return PLUS;               }
"-"            { return MINUS;              }
"!"            { return LOGICAL_NOT;        }
"~"            { return BIT_WISE_NOT;       }
"&"            { return BIT_WISE_AND;       }
"~&"           { return BIT_WISE_NAND;      }
"|"            { return BIT_WISE_OR;        }
"~|"           { return BIT_WISE_NOR;       }
"^"            { return BIT_WISE_XOR;       }
"~^"           { return BIT_WISE_XNOR;      }
"^~"           { return BIT_WISE_XNOR;      }
	/* End of reserved words */

{SIDENT}       { return SVLOG_SIDENT;       }
{EIDENT}       { return SVLOG_EIDENT;       }
{SCOMMENT}     {      /* Do nothing */      }
{MCOMMENT}     {      /* Do nothing */      }
[ \n\t\f\v]    {      /* Do nothing */      }
.              { fprintf(stdout, "bad input character '%s' at line %d\n", yytext, yylineno); }

%%
	/************************
	 * End of rules section *
	 ************************/
