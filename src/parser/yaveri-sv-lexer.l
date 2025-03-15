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
	/* c_identifer regex */
CIDENT [a-zA-Z_][a-zA-Z0-9_]*[^;]
	/* Simple identifier regex */
SIDENT ^[_a-zA-Z][_$0-9a-zA-Z]*[^;]
	/* Quoted String regex */
QUOTEDS [^\\\n]*
	/* Triple Quoted String regex */
TRIPLEQS [^\\]*
	/* String Escape Sequence regex */
SESCAPESEQ ^[\\].*
	/* System task and functions identifier regex */
STFIDENT ^[$][a-zA-Z0-9_$]+[^;]
	/* Single comment regex */
SCOMMENT \/\/(.*)
	/* Multi comment regex */
MCOMMENT \/\*(.*\n)*.*\*\/

%%
	/* Start of reserved words */
"sync_accept_on" { return SVLOG_SYNC_ACCEPT_ON; }
"sync_reject_on" { return SVLOG_SYNC_REJECT_ON; }
"timeprecision"  { return SVLOG_TIMEPRECISION;  }
"always_latch"   { return SVLOG_ALWAYS_LATCH;   }
"endinterface"   { return SVLOG_ENDINTERFACE;   }
"endprimitive"   { return SVLOG_ENDPRIMITIVE;   }
"illegal_bins"   { return SVLOG_ILLEGAL_BINS;   }
"interconnect"   { return SVLOG_INTERCONNECT;   }
"randsequence"   { return SVLOG_RANDSEQUENCE;   }
"s_eventually"   { return SVLOG_S_EVENTUALLY;   }
"s_until_with"   { return SVLOG_S_UNTIL_WITH;   }
"always_comb"    { return SVLOG_ALWAYS_COMB;    }
"endclocking"    { return SVLOG_ENDCLOCKING;    }
"endfunction"    { return SVLOG_ENDFUNCTION;    }
"endgenerate"    { return SVLOG_ENDGENERATE;    }
"endproperty"    { return SVLOG_ENDPROPERTY;    }
"endsequence"    { return SVLOG_ENDSEQUENCE;    }
"first_match"    { return SVLOG_FIRST_MATCH;    }
"ignore_bins"    { return SVLOG_IGNORE_BINS;    }
"macromodule"    { return SVLOG_MACROMODULE;    }
"type_option"    { return SVLOG_TYPE_OPTION;    }
"constraint"     { return SVLOG_CONSTRAINT;     }
"covergroup"     { return SVLOG_COVERGROUP;     }
"coverpoint"     { return SVLOG_COVERPOINT;     }
"endchecker"     { return SVLOG_ENDCHECKER;     }
"endpackage"     { return SVLOG_ENDPACKAGE;     }
"endprogram"     { return SVLOG_ENDPROGRAM;     }
"eventually"     { return SVLOG_EVENTUALLY;     }
"implements"     { return SVLOG_IMPLEMENTS;     }
"localparam"     { return SVLOG_LOCALPARAM;     }
"s_nexttime"     { return SVLOG_S_NEXTTIME;     }
"throughout"     { return SVLOG_THROUGHOUT;     }
"until_with"     { return SVLOG_UNTIL_WITH;     }
"wait_order"     { return SVLOG_WAIT_ORDER;     }
"always_ff"      { return SVLOG_ALWAYS_FF;      }
"accept_on"      { return SVLOG_ACCEPT_ON;      }
"automatic"      { return SVLOG_AUTOMATIC;      }
"endconfig"      { return SVLOG_ENDCONFIG;      }
"endmodule"      { return SVLOG_ENDMODULE;      }
"interface"      { return SVLOG_INTERFACE;      }
"intersect"      { return SVLOG_INTERSECT;      }
"join_none"      { return SVLOG_JOIN_NONE;      }
"parameter"      { return SVLOG_PARAMETER;      }
"primitive"      { return SVLOG_PRIMITIVE;      }
"protected"      { return SVLOG_PROTECTED;      }
"randomize"      { return SVLOG_RANDOMIZE;      }
"reject_on"      { return SVLOG_REJECT_ON;      }
"shortreal"      { return SVLOG_SHORTREAL;      }
"specparam"      { return SVLOG_SPECPARAM;      }
"clocking"       { return SVLOG_CLOCKING;       }
"continue"       { return SVLOG_CONTINUE;       }
"deassign"       { return SVLOG_DEASSIGN;       }
"defparam"       { return SVLOG_DEFPARAM;       }
"endclass"       { return SVLOG_ENDCLASS;       }
"endgroup"       { return SVLOG_ENDGROUP;       }
"endtable"       { return SVLOG_ENDTABLE;       }
"extendes"       { return SVLOG_EXTENDES;       }
"forkjoin"       { return SVLOG_FORKJOIN;       }
"function"       { return SVLOG_FUNCTION;       }
"generate"       { return SVLOG_GENERATE;       }
"instance"       { return SVLOG_INSTANCE;       }
"join_any"       { return SVLOG_JOIN_ANY;       }
"nexttime"       { return SVLOG_NEXTTIME;       }
"priority"       { return SVLOG_PRIORITY;       }
"property"       { return SVLOG_PROPERTY;       }
"pulldown"       { return SVLOG_PULLDOWN;       }
"randcase"       { return SVLOG_RANDCASE;       }
"realtime"       { return SVLOG_REALTIME;       }
"restrict"       { return SVLOG_RESTRICT;       }
"rtranif0"       { return SVLOG_RTRANIF0;       }
"rtranif1"       { return SVLOG_RTRANIF1;       }
"scalared"       { return SVLOG_SCALARED;       }
"sequence"       { return SVLOG_SEQUENCE;       }
"shortint"       { return SVLOG_SHORTINT;       }
"s_always"       { return SVLOG_S_ALWAYS;       }
"timeunit"       { return SVLOG_TIMEUNIT;       }
"unsigned"       { return SVLOG_UNSIGNED;       }
"vectored"       { return SVLOG_VECTORED;       }
"wildcard"       { return SVLOG_WILDCARD;       }
"chandle"        { return SVLOG_CHANDLE;        }
"checker"        { return SVLOG_CHECKER;        }
"context"        { return SVLOG_CONTEXT;        }
"default"        { return SVLOG_DEFAULT;        }
"disable"        { return SVLOG_DISABLE;        }
"endcase"        { return SVLOG_ENDCASE;        }
"endtask"        { return SVLOG_ENDTASK;        }
"foreach"        { return SVLOG_FOREACH;        }
"forever"        { return SVLOG_FOREVER;        }
"implies"        { return SVLOG_IMPLIES;        }
"include"        { return SVLOG_INCLUDE;        }
"initial"        { return SVLOG_INITIAL;        }
"integer"        { return SVLOG_INTEGER;        }
"library"        { return SVLOG_LIBRARY;        }
"liblist"        { return SVLOG_LIBLIST;        }
"longint"        { return SVLOG_LONGINT;        }
"matches"        { return SVLOG_MATCHES;        }
"modport"        { return SVLOG_MODPORT;        }
"negedge"        { return SVLOG_NEGEDGE;        }
"nettype"        { return SVLOG_NETTYPE;        }
"package"        { return SVLOG_PACKAGE;        }
"posedge"        { return SVLOG_POSEDGE;        }
"program"        { return SVLOG_PROGRAM;        }
"release"        { return SVLOG_RELEASE;        }
"typedef"        { return SVLOG_TYPEDEF;        }
"strong0"        { return SVLOG_STRONG0;        }
"strong1"        { return SVLOG_STRONG1;        }
"supply0"        { return SVLOG_SUPPLY0;        }
"supply1"        { return SVLOG_SUPPLY1;        }
"s_until"        { return SVLOG_S_UNTIL;        }
"tranif0"        { return SVLOG_TRANIF0;        }
"tranif1"        { return SVLOG_TRANIF1;        }
"unique0"        { return SVLOG_UNIQUE0;        }
"untyped"        { return SVLOG_UNTYPED;        }
"virtual"        { return SVLOG_VIRTUAL;        }
"always"         { return SVLOG_ALWAYS;         }
"assert"         { return SVLOG_ASSERT;         }
"assign"         { return SVLOG_ASSIGN;         }
"assume"         { return SVLOG_ASSUME;         }
"before"         { return SVLOG_BEFORE;         }
"binsof"         { return SVLOG_BINSOF;         }
"bufif0"         { return SVLOG_BUFIF0;         }
"bufif1"         { return SVLOG_BUFIF1;         }
"config"         { return SVLOG_CONFIG;         }
"design"         { return SVLOG_DESIGN;         }
"expect"         { return SVLOG_EXPECT;         }
"export"         { return SVLOG_EXPORT;         }
"extern"         { return SVLOG_EXTERN;         }
"genvar"         { return SVLOG_GENVAR;         }
"global"         { return SVLOG_GLOBAL;         }
"highz0"         { return SVLOG_HIGHZ0;         }
"highz1"         { return SVLOG_HIGHZ1;         }
"import"         { return SVLOG_IMPORT;         }
"inside"         { return SVLOG_INSIDE;         }
"medium"         { return SVLOG_MEDIUM;         }
"module"         { return SVLOG_MODULE;         }
"notif0"         { return SVLOG_NOTIF0;         }
"notif1"         { return SVLOG_NOTIF1;         }
"option"         { return SVLOG_OPTION;         }
"output"         { return SVLOG_OUTPUT;         }
"packed"         { return SVLOG_PACKED;         }
"pullup"         { return SVLOG_PULLUP;         }
"repeat"         { return SVLOG_REPEAT;         }
"return"         { return SVLOG_RETURN;         }
"sample"         { return SVLOG_SAMPLE;         }
"signed"         { return SVLOG_SIGNED;         }
"static"         { return SVLOG_STATIC;         }
"string"         { return SVLOG_STRING;         }
"strong"         { return SVLOG_STRONG;         }
"struct"         { return SVLOG_STRUCT;         }
"tagged"         { return SVLOG_TAGGED;         }
"triand"         { return SVLOG_TRIAND;         }
"trireg"         { return SVLOG_TRIREG;         }
"unique"         { return SVLOG_UNIQUE;         }
"unwire"         { return SVLOG_UNWIRE;         }
"within"         { return SVLOG_WITHIN;         }
"alias"          { return SVLOG_ALIAS;          }
"begin"          { return SVLOG_BEGIN;          }
"break"          { return SVLOG_BREAK;          }
"casex"          { return SVLOG_CASEX;          }
"casez"          { return SVLOG_CASEZ;          }
"class"          { return SVLOG_CLASS;          }
"const"          { return SVLOG_CONST;          }
"cover"          { return SVLOG_COVER;          }
"cross"          { return SVLOG_CROSS;          }
"event"          { return SVLOG_EVENT;          }
"force"          { return SVLOG_FORCE;          }
"final"          { return SVLOG_FINAL;          }
"inout"          { return SVLOG_INOUT;          }
"input"          { return SVLOG_INPUT;          }
"large"          { return SVLOG_LARGE;          }
"local"          { return SVLOG_LOCAL;          }
"logic"          { return SVLOG_LOGIC;          }
"pull0"          { return SVLOG_PULL0;          }
"pull1"          { return SVLOG_PULL1;          }
"randc"          { return SVLOG_RANDC;          }
"rcmos"          { return SVLOG_RCMOS;          }
"rpmos"          { return SVLOG_RPMOS;          }
"rnmos"          { return SVLOG_RNMOS;          }
"rtran"          { return SVLOG_RTRAN;          }
"solve"          { return SVLOG_SOLVE;          }
"small"          { return SVLOG_SMALL;          }
"super"          { return SVLOG_SUPER;          }
"table"          { return SVLOG_TABLE;          }
"trior"          { return SVLOG_TRIOR;          }
"union"          { return SVLOG_UNION;          }
"until"          { return SVLOG_UNTIL;          }
"weak0"          { return SVLOG_WEAK0;          }
"weak1"          { return SVLOG_WEAK1;          }
"while"          { return SVLOG_WHILE;          }
"bind"           { return SVLOG_BIND;           }
"bins"           { return SVLOG_BINS;           }
"byte"           { return SVLOG_BYTE;           }
"case"           { return SVLOG_CASE;           }
"cell"           { return SVLOG_CELL;           }
"cmos"           { return SVLOG_CMOS;           }
"dist"           { return SVLOG_DIST;           }
"edge"           { return SVLOG_EDGE;           }
"else"           { return SVLOG_ELSE;           }
"enum"           { return SVLOG_ENUM;           }
"fork"           { return SVLOG_FORK;           }
"join"           { return SVLOG_JOIN;           }
"nand"           { return SVLOG_NAND;           }
"nmos"           { return SVLOG_NMOS;           }
"null"           { return SVLOG_NULL;           }
"pmos"           { return SVLOG_PMOS;           }
"pure"           { return SVLOG_PURE;           }
"rand"           { return SVLOG_RAND;           }
"real"           { return SVLOG_REAL;           }
"soft"           { return SVLOG_SOFT;           }
"step"           { return SVLOG_STEP;           }
"task"           { return SVLOG_TASK;           }
"this"           { return SVLOG_THIS;           }
"time"           { return SVLOG_TIME;           }
"tran"           { return SVLOG_TRAN;           }
"tri0"           { return SVLOG_TRI0;           }
"tri1"           { return SVLOG_TRI1;           }
"type"           { return SVLOG_TYPE;           }
"void"           { return SVLOG_VOID;           }
"wait"           { return SVLOG_WAIT;           }
"wand"           { return SVLOG_WAND;           }
"weak"           { return SVLOG_WEAK;           }
"wire"           { return SVLOG_WIRE;           }
"with"           { return SVLOG_WITH;           }
"xnor"           { return SVLOG_XNOR;           }
"and"            { return SVLOG_AND;            }
"bit"            { return SVLOG_BIT;            }
"buf"            { return SVLOG_BUF;            }
"DPI"            { return SVLOG_DPI;            }
"end"            { return SVLOG_END;            }
"for"            { return SVLOG_FOR;            }
"iff"            { return SVLOG_IF_AND_ONLY_IF; }
"int"            { return SVLOG_INT;            }
"let"            { return SVLOG_LET;            }
"new"            { return SVLOG_NEW;            }
"nor"            { return SVLOG_NOR;            }
"not"            { return SVLOG_NOT;            }
"ref"            { return SVLOG_REF;            }
"reg"            { return SVLOG_REG;            }
"std"            { return SVLOG_STD;            }
"tri"            { return SVLOG_TRI;            }
"use"            { return SVLOG_USE;            }
"var"            { return SVLOG_VAR;            }
"wor"            { return SVLOG_WOR;            }
"xor"            { return SVLOG_XOR;            }
"do"             { return SVLOG_DO;             }
"fs"             { return SVLOG_fEMTOSEC;       }
"if"             { return SVLOG_IF;             }
"ms"             { return SVLOG_MILLISEC;       }
"ns"             { return SVLOG_NANOSEC;        }
"or"             { return SVLOG_OR;             }
"ps"             { return SVLOG_PICOSEC;        }
"us"             { return SVLOG_MICROSEC;       }


"PATHPULSE$"   { return SVLOG_PATHPULSEDS;               }
"$warning"     { return SVLOG_DSWARNING;                 }
"-incdir"      { return SVLOG_HINCDIR;                   }
"$error"       { return SVLOG_DSERROR;                   }
"$fatal"       { return SVLOG_DSFATAL;                   }
"DPI-C"        { return SVLOG_DPI_C;                     }
"1step"        { return SVLOG_1STEP;                     }
"$info"        { return SVLOG_DSINFO;                    }
"$root"        { return SVLOG_DSROOT;                    }
"$unit"        { return SVLOG_DSUNIT;                    }
"1'b0"         { return SVLOG_INIT_VAL_APOST_LB0;        }
"1'b1"         { return SVLOG_INIT_VAL_APOST_LB1;        }
"1'bx"         { return SVLOG_INIT_VAL_APOST_LBLX;       }
"1'bX"         { return SVLOG_INIT_VAL_APOST_LBCX;       }
"1'B0"         { return SVLOG_INIT_VAL_APOST_CB0;        }
"1'B1"         { return SVLOG_INIT_VAL_APOST_CB1;        }
"1'Bx"         { return SVLOG_INIT_VAL_APOST_CBLX;       }
"1'BX"         { return SVLOG_INIT_VAL_APOST_CBCX;       }


"<<<="         { return LOGICAL_LEFT_SHIFT_ASSIGN;          }
">>>="         { return LOGICAL_RIGHT_SHIFT_ASSIGN;         }
"##[*]"        { return CYCLE_DELAY_ZERO_OR_MORE;           }
"##[+]"        { return CYCLE_DELAY_ONE_OR_MORE;            }
"*::*"         { return EXPORT_DECLARATION;                 }
"&&&"          { return IF_AND_ONLY_IF;                     }
"==="          { return CASE_EQUAL;                         }
"!=="          { return CASE_NOT_EQUAL;                     }
"<<<"          { return LOGICAL_LEFT_SHIFT;                 }
">>>"          { return LOGICAL_RIGHT_SHIFT;                }
"<<="          { return LEFT_SHIFT_ASSIGN;                  }
">>="          { return RIGHT_SHIFT_ASSIGN;                 }
"[->"          { return GOTO_REPETITION_OPERATOR;           }
"|->"          { return OVERLAPPED_OPERATOR;                }
"#-#"          { return OVERLAPPED_OPERATOR_FOLLOWED_BY;    }
"|=>"          { return NONOVERLAPPED_OPERATOR;             }
"#=#"          { return NONOVERLAPPED_OPERATOR_FOLLOWED_BY; }
"->>"          { return NONBLOCK_IMPLICATION_OPERATOR;      }
"<->"          { return EQUIVALANCE_OPERATOR;               }
"==?"          { return WILDCARD_EQUAL;                     }
"!=?"          { return WILDCARD_NOT_EQUAL;                 }
"[$]"          { return QUEUE_INITIALIZE;                   }
"[$:"          { return BOUNDED_QUEUE_INITIALIZE;           }
":$]"          { return BOUNDED_QUEUE_FINALIZE;             }
"+/-"          { return ABSOLUTE_TOLERANCE_RANGE;           }
"+%-"          { return RELATIVE_TOLERANCE_RANGE;           }
"[*]"          { return REPEAT_ZERO_OR_MORE; /* [*0:$] */   }
"[+]"          { return REPEAT_ONE_OR_MORE; /* [*1:$] */    }
"[*"           { return CONSECUTIVE_REPEAT_OPERATOR;        }
"[="           { return NON_CONSECUTIVE_REPEAT_OPERATOR;    }
"~&"           { return BIT_WISE_NAND;                      }
"~|"           { return BIT_WISE_NOR;                       }
"#0"           { return POUND_ZERO;                         }
"##"           { return DELAY_EXEC_OPERATOR;                }
"~^"           { return BIT_WISE_XNOR;                      }
"^~"           { return BIT_WISE_XNOR;                      }
"=="           { return LOGICAL_EQUAL;                      }
"!="           { return LOGICAL_INEQUAL;                    }
"&&"           { return LOGICAL_AND;                        }
"||"           { return LOGICAL_OR;                         }
"+:"           { return ADDITION_OPERATOR;                  }
"-:"           { return REDUCTION_OPERATOR;                 }
"::"           { return CLASS_SCOPE_OPERATOR;               }
":/"           { return DISTRIBUTED_WEIGHT_OPERATOR;        }
":="           { return EQUAL_WEIGHT_OPERATOR;              }
"**"           { return POWER_OF_OPERATOR;                  }
"++"           { return INCREMENT_OPERATOR;                 }
"--"           { return DECREMENT_OPERATOR;                 }
"->"           { return IMPLICATION_OPERATOR;               }
"<<"           { return LEFT_SHIFT;                         }
">>"           { return RIGHT_SHIFT;                        }
">="           { return GT_OR_EQ;                           }
"<="           { return NON_BLOCK_ASSIGNMENT;               }
"=>"           { return PARALLEL_CONNECTION;                }
"@@"           { return DOUBLE_AT_SIGN;                     }
"&="           { return BIT_WISE_AND_ASSIGN;                }
"|="           { return BIT_WISE_OR_ASSIGN;                 }
"^="           { return BIT_WISE_XOR_ASSIGN;                }
"%="           { return MODULUS_ASSIGN;                     }
"/="           { return DIVIDE_ASSIGN;                      }
"*="           { return MULTIPLY_ASSIGN;                    }
"-="           { return REDUCTION_ASSIGN;                   }
"+="           { return ADDITION_ASSIGN;                    }
"!"            { return LOGICAL_NOT;                        }
"^"            { return BIT_WISE_XOR;                       }
"|"            { return BIT_WISE_OR;                        }
"~"            { return BIT_WISE_NOT;                       } 
"&"            { return BIT_WISE_AND;                       }
"'"            { return APOSTROPHE;                         }


"B"  { return 'B'; }
"D"  { return 'D'; }
"E"  { return 'E'; }
"F"  { return 'F'; }
"H"  { return 'H'; }
"N"  { return 'N'; }
"O"  { return 'O'; }
"P"  { return 'P'; }
"R"  { return 'R'; }
"S"  { return 'S'; }
"X"  { return 'X'; }
"Z"  { return 'Z'; }
"b"  { return 'b'; }
"d"  { return 'd'; }
"e"  { return 'e'; }
"f"  { return 'f'; }
"h"  { return 'h'; }
"n"  { return 'n'; }
"o"  { return 'o'; }
"p"  { return 'p'; }
"r"  { return 'r'; }
"s"  { return 's'; }
"x"  { return 'x'; }
"z"  { return 'z'; }
"<"  { return '<'; }
">"  { return '>'; }
"@"  { return '@'; }
"$"  { return '$'; }
"#"  { return '#'; }
"="  { return '='; }
";"  { return ';'; }
":"  { return ':'; }
"+"  { return '+'; }
"-"  { return '-'; }
"*"  { return '*'; }
"/"  { return '/'; }
"%"  { return '%'; }
"_"  { return '_'; }
"."  { return '.'; }
","  { return ','; }
"\"" { return '"'; }
"("  { return '('; }
")"  { return ')'; }
"["  { return '['; }
"]"  { return ']'; }
"?"  { return '?'; }

	/* End of reserved words */


{DIGIT}        { return SVLOG_DIGIT;                                                           }
{HEXCHAR}      { return SVLOG_HEXCHAR;                                                         }
{QUOTEDS}      { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_QUOTED_STRING;        }
{TRIPLEQS}     { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_TRIPLE_QUOTED_STRING; }
{STFIDENT}     { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_STFIDENT;             }
{CIDENT}       { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_CIDENT;               }
{SIDENT}       { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_SIDENT;               }
{EIDENT}       { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_EIDENT;               }
{SESCAPESEQ}   { strncpy(yylval_param->stoken,yytext,4095); return SVLOG_ESCAPE_SEQ;           }
{SCOMMENT}     {      /* Do nothing */                                                         }
{MCOMMENT}     {      /* Do nothing */                                                         }
[ \n\t\f\v]    {      /* Do nothing */                                                         }
.              { fprintf(stdout, "bad input character '%s' at line %d\n", yytext, yylineno);   }

%%
	/************************
	 * End of rules section *
	 ************************/
