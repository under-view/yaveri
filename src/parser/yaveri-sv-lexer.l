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
"module"       { return SVLOG_MODULE;        }
"endmodule"    { return SVLOG_ENDMODULE;     }
"program"      { return SVLOG_PROGRAM;       }
"endprogram"   { return SVLOG_ENDPROGRAM;    }
"interface"    { return SVLOG_INTERFACE;     }
"endinterface" { return SVLOG_ENDINTERFACE;  }
"checker"      { return SVLOG_CHECKER;       }
"endchecker"   { return SVLOG_ENDCHECKER;    }
"package"      { return SVLOG_PACKAGE;       }
"endpackage"   { return SVLOG_ENDPACKAGE;    }
"primitive"    { return SVLOG_PRIMITIVE;     }
"endprimitive" { return SVLOG_ENDPRIMITIVE;  }
"config"       { return SVLOG_CONFIG;        }
"endconfig"    { return SVLOG_ENDCONFIG;     }
"clocking"     { return SVLOG_CLOCKING;      }
"endclocking"  { return SVLOG_ENDCLOCKING;   }
"randsequence" { return SVLOG_RANDSEQUENCE;  }
"endsequence"  { return SVLOG_ENDSEQUENCE;   }


"$root"        { return SVLOG_ROOT;          }
"$unit"        { return SVLOG_UNIT;          }
"PATHPULSE$"   { return SVLOG_PATHPULSE;     }


"s"            { return SVLOG_SEC;           }
"ms"           { return SVLOG_MILLISEC;      }
"us"           { return SVLOG_MICROSEC;      }
"ns"           { return SVLOG_NANOSEC;       }
"ps"           { return SVLOG_PICOSEC;       }
"fs"           { return SVLOG_fEMTOSEC;      }
"step"         { return SVLOG_STEP;          }
"1step"        { return SVLOG_1STEP;         }


"let"          { return SVLOG_LET;           }
"var"          { return SVLOG_VAR;           }
"std"          { return SVLOG_STD;           }
"this"         { return SVLOG_THIS;          }
"void"         { return SVLOG_VOID;          }
"null"         { return SVLOG_NULL;          }
"with"         { return SVLOG_WITH;          }
"const"        { return SVLOG_CONST;         }
"global"       { return SVLOG_GLOBAL;        }
"import"       { return SVLOG_IMPORT;        }
"export"       { return SVLOG_EXPORT;        }
"randomize"    { return SVLOG_RANDOMIZE;     }
"unique"       { return SVLOG_UNIQUE;        }
"unique0"      { return SVLOG_UNIQUE0;       }
"priority"     { return SVLOG_PRIORITY;      }
"solve"        { return SVLOG_SOLVE;         }
"before"       { return SVLOG_BEFORE;        }
"soft"         { return SVLOG_SOFT;          }
"disable"      { return SVLOG_DISABLE;       }
"fork"         { return SVLOG_FORK;          }
"dist"         { return SVLOG_DIST;          }
"default"      { return SVLOG_DEFAULT;       }
"super"        { return SVLOG_SUPER;         }
"struct"       { return SVLOG_STRUCT;        }
"union"        { return SVLOG_UNION;         }
"tagged"       { return SVLOG_TAGGED;        }
"packed"       { return SVLOG_PACKED;        }
"string"       { return SVLOG_STRING;        }
"chandle"      { return SVLOG_CHANDLE;       }
"virtual"      { return SVLOG_VIRTUAL;       }
"event"        { return SVLOG_EVENT;         }
"new"          { return SVLOG_NEW;           }
"class"        { return SVLOG_CLASS;         }
"enum"         { return SVLOG_ENUM;          }
"type"         { return SVLOG_TYPE;          }
"untyped"      { return SVLOG_UNTYPED;       }
"typedef"      { return SVLOG_TYPEDEF;       }
"nettype"      { return SVLOG_NETTYPE;       }
"static"       { return SVLOG_STATIC;        }
"automatic"    { return SVLOG_AUTOMATIC;     }
"first_match"  { return SVLOG_FIRST_MATCH;   }
"throughout"   { return SVLOG_THROUGHOUT;    }
"within"       { return SVLOG_WITHIN;        }
"join"         { return SVLOG_JOIN;          }
"join_any"     { return SVLOG_JOIN_ANY;      }
"join_none"    { return SVLOG_JOIN_NONE;     }
"parameter"    { return SVLOG_PARAMETER;     }
"specparam"    { return SVLOG_SPECPARAM;     }
"localparam"   { return SVLOG_LOCALPARAM;    }


"iff"          { return SVLOG_IF_AND_ONLY_IF; }
"if"           { return SVLOG_IF;             }
"else"         { return SVLOG_ELSE;           }
"and"          { return SVLOG_AND;            }
"or"           { return SVLOG_OR;             }
"xor"          { return SVLOG_XOR;            }
"intersect"    { return SVLOG_INTERSECT;      }
"matches"      { return SVLOG_MATCHES;        }
"inside"       { return SVLOG_INSIDE;         }
"case"         { return SVLOG_CASE;           }
"casez"        { return SVLOG_CASEZ;          }
"casex"        { return SVLOG_CASEX;          }
"randcase"     { return SVLOG_RANDCASE;       }
"endcase"      { return SVLOG_ENDCASE;        }
"do"           { return SVLOG_DO;             }
"for"          { return SVLOG_FOR;            }
"repeat"       { return SVLOG_REPEAT;         }
"foreach"      { return SVLOG_FOREACH;        }
"forever"      { return SVLOG_FOREVER;        }
"while"        { return SVLOG_WHILE;          }
"return"       { return SVLOG_RETURN;         }
"break"        { return SVLOG_BREAK;          }
"continue"     { return SVLOG_CONTINUE;       }
"wait"         { return SVLOG_WAIT;           }
"wait_order"   { return SVLOG_WAIT_ORDER;     }
"begin"        { return SVLOG_BEGIN;          }
"end"          { return SVLOG_END;            }
"input"        { return SVLOG_INPUT;          }
"output"       { return SVLOG_OUTPUT;         }
"inout"        { return SVLOG_INOUT;          }


"interconnect" { return SVLOG_INTERCONNECT;   }
"genvar"       { return SVLOG_GENVAR;         }
"cover"        { return SVLOG_COVER;          }
"assert"       { return SVLOG_ASSERT;         }
"assume"       { return SVLOG_ASSUME;         }
"assign"       { return SVLOG_ASSIGN;         }
"deassign"     { return SVLOG_DEASSIGN;       }
"property"     { return SVLOG_PROPERTY;       }
"expect"       { return SVLOG_EXPECT;         }
"sequence"     { return SVLOG_SEQUENCE;       }
"restrict"     { return SVLOG_RESTRICT;       }
"final"        { return SVLOG_FINAL;          }
"force"        { return SVLOG_FORCE;          }
"release"      { return SVLOG_RELEASE;        }
"small"        { return SVLOG_SMALL;          }
"medium"       { return SVLOG_MEDIUM;         }
"large"        { return SVLOG_LARGE;          }


"highz0"       { return SVLOG_HIGHZ0;         }
"highz1"       { return SVLOG_HIGHZ1;         }
"supply0"      { return SVLOG_SUPPLY0;        }
"supply1"      { return SVLOG_SUPPLY1;        }
"strong0"      { return SVLOG_STRONG0;        }
"strong1"      { return SVLOG_STRONG1;        }
"pull0"        { return SVLOG_PULL0;          }
"pull1"        { return SVLOG_PULL1;          }
"weak0"        { return SVLOG_WEAK0;          }
"weak1"        { return SVLOG_WEAK1;          }
"tri"          { return SVLOG_TRI;           }
"tri0"         { return SVLOG_TRI0;          }
"tri1"         { return SVLOG_TRI1;          }
"triand"       { return SVLOG_TRIAND;        }
"trior"        { return SVLOG_TRIOR;         }
"trireg"       { return SVLOG_TRIREG;        }
"wand"         { return SVLOG_WAND;          }
"wor"          { return SVLOG_WOR;           }


"reg"          { return SVLOG_REG;           }
"wire"         { return SVLOG_WIRE;          }
"unwire"       { return SVLOG_UNWIRE;        }
"integer"      { return SVLOG_INTEGER;       }
"real"         { return SVLOG_REAL;          }
"time"         { return SVLOG_TIME;          }
"realtime"     { return SVLOG_REAL_TIME;     }
"logic"        { return SVLOG_LOGIC;         }
"bit"          { return SVLOG_BIT;           }
"byte"         { return SVLOG_BYTE;          }
"shortint"     { return SVLOG_SHORT_INT;     }
"int"          { return SVLOG_INT;           }
"longint"      { return SVLOG_LONG_INT;      }
"shortreal"    { return SVLOG_SHORT_REAL;    }
"signed"       { return SVLOG_SIGNED;        }
"unsigned"     { return SVLOG_UNSIGNED;      }
"rand"         { return SVLOG_RAND;          }
"randc"        { return SVLOG_RANDC;         }
"posedge"      { return SVLOG_POSEDGE;       }
"negedge"      { return SVLOG_NEGEDGE;       }
"edge"         { return SVLOG_EDGE;          }
"vectored"     { return SVLOG_VECTORED;      }
"scalared"     { return SVLOG_SCALARED;      }


"#0"           { return POUND_ZERO;          }
"*::*"         { return EXPORT_DECLARATION;  }


"&&&"          { return IF_AND_ONLY_IF;      }
"==="          { return CASE_EQUAL;          }
"!=="          { return CASE_NOT_EQUAL;      }

"==?"          { return WILDCARD_EQUAL;      }
"!=?"          { return WILDCARD_NOT_EQUAL;  }

"~"            { return BIT_WISE_NOT;        }
"&"            { return BIT_WISE_AND;        }
"~&"           { return BIT_WISE_NAND;       }
"|"            { return BIT_WISE_OR;         }
"~|"           { return BIT_WISE_NOR;        }
"^"            { return BIT_WISE_XOR;        }
"~^"           { return BIT_WISE_XNOR;       }
"^~"           { return BIT_WISE_XNOR;       }

"!"            { return LOGICAL_NOT;         }
"=="           { return LOGICAL_EQUAL;       }
"!="           { return LOGICAL_INEQUAL;     }
"&&"           { return LOGICAL_AND;         }
"||"           { return LOGICAL_OR;          }
"<<<"          { return LOGICAL_LEFT_SHIFT;  }
">>>"          { return LOGICAL_RIGHT_SHIFT; }

"+:"           { return ADDITION_OPERATOR;           }
"-:"           { return REDUCTION_OPERATOR;          }
"::"           { return CLASS_SCOPE_OPERATOR;        }
":/"           { return DISTRIBUTED_WEIGHT_OPERATOR; }
":="           { return EQUAL_WEIGHT_OPERATOR;       }

"**"           { return POWER_OF_OPERATOR;    }
"++"           { return INCREMENT_OPERATOR;   }
"--"           { return DECREMENT_OPERATOR;   }
"->>"          { return NONBLOCK_IMPLICATION_OPERATOR; }
"->"           { return IMPLICATION_OPERATOR; }
"<->"          { return EQUIVALANCE_OPERATOR; }
"<<"           { return LEFT_SHIFT;           }
">>"           { return RIGHT_SHIFT;          }
">"            { return '>';                  }
">="           { return GT_OR_EQ;             }
"<"            { return '<';                  }
"<="           { return LT_OR_EQ;             }

"@"            { return '@';                 }
"$"            { return '$';                 }
"#"            { return '#';                 }
"="            { return '=';                 }
";"            { return ';';                 }
":"            { return ':';                 }
"+"            { return '+';                 }
"-"            { return '-';                 }
"*"            { return '*';                 }
"/"            { return '/';                 }
"%"            { return '%';                 }
"_"            { return '_';                 }
"."            { return '.';                 }
","            { return ',';                 }
"'"            { return APOSTROPHE;          }
"\""           { return '"';                 }
"("            { return '(';                 }
")"            { return ')';                 }
"["            { return ']';                 }
"]"            { return ']';                 }

{SVEXP}        { return SVLOG_EXP;           }
{SVDECBASED}   { return SVLOG_DEC_BASE_D;    }
{SVDECBASES}   { return SVLOG_DEC_BASE_S;    }
{SVBINBASE}    { return SVLOG_BIN_BASE;      }
{SVOCTBASE}    { return SVLOG_OCT_BASE;      }
{SVHEXBASE}    { return SVLOG_HEX_BASE;      }
{SVXDIGIT}     { return SVLOG_Z_DIGIT;       }
{SVZDIGIT}     { return SVLOG_X_DIGIT;       }
	/* End of reserved words */

{DIGIT}        { return SVLOG_DIGIT;         }
{HEXCHAR}      { return SVLOG_HEXCHAR;       }
{QUOTEDS}      { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_QUOTED_STRING; }
{TRIPLEQS}     { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_TRIPLE_QUOTED_STRING; }
{STFIDENT}     { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_STFIDENT; }
{SIDENT}       { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_SIDENT;   }
{EIDENT}       { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_EIDENT;   }
{SESCAPESEQ}   { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_ESCAPE_SEQ; }
{SCOMMENT}     {      /* Do nothing */       }
{MCOMMENT}     {      /* Do nothing */       }
[ \n\t\f\v]    {      /* Do nothing */       }
.              { fprintf(stdout, "bad input character '%s' at line %d\n", yytext, yylineno); }

%%
	/************************
	 * End of rules section *
	 ************************/
