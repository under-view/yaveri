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
"sync_accept_on" { return SVLOG_SYNC_ACCEPT_ON; }
"sync_reject_on" { return SVLOG_SYNC_REJECT_ON; }
"endinterface"   { return SVLOG_ENDINTERFACE;   }
"endprimitive"   { return SVLOG_ENDPRIMITIVE;   }
"interconnect"   { return SVLOG_INTERCONNECT;   }
"randsequence"   { return SVLOG_RANDSEQUENCE;   }
"s_eventually"   { return SVLOG_S_EVENTUALLY;   }
"s_until_with"   { return SVLOG_S_UNTIL_WITH;   }
"endclocking"    { return SVLOG_ENDCLOCKING;    }
"endproperty"    { return SVLOG_ENDPROPERTY;    }
"endsequence"    { return SVLOG_ENDSEQUENCE;    }
"first_match"    { return SVLOG_FIRST_MATCH;    }
"endchecker"     { return SVLOG_ENDCHECKER;     }
"endpackage"     { return SVLOG_ENDPACKAGE;     }
"endprogram"     { return SVLOG_ENDPROGRAM;     }
"eventually"     { return SVLOG_EVENTUALLY;     }
"localparam"     { return SVLOG_LOCALPARAM;     }
"PATHPULSE$"     { return SVLOG_PATHPULSE;      }
"s_nexttime"     { return SVLOG_S_NEXTTIME;     }
"throughout"     { return SVLOG_THROUGHOUT;     }
"until_with"     { return SVLOG_UNTIL_WITH;     }
"wait_order"     { return SVLOG_WAIT_ORDER;     }
"accept_on"      { return SVLOG_ACCEPT_ON;      }
"automatic"      { return SVLOG_AUTOMATIC;      }
"endconfig"      { return SVLOG_ENDCONFIG;      }
"endmodule"      { return SVLOG_ENDMODULE;      }
"interface"      { return SVLOG_INTERFACE;      }
"intersect"      { return SVLOG_INTERSECT;      }
"join_none"      { return SVLOG_JOIN_NONE;      }
"parameter"      { return SVLOG_PARAMETER;      }
"primitive"      { return SVLOG_PRIMITIVE;      }
"randomize"      { return SVLOG_RANDOMIZE;      }
"reject_on"      { return SVLOG_REJECT_ON;      }
"shortreal"      { return SVLOG_SHORT_REAL;     }
"specparam"      { return SVLOG_SPECPARAM;      }
"clocking"       { return SVLOG_CLOCKING;       }
"continue"       { return SVLOG_CONTINUE;       }
"deassign"       { return SVLOG_DEASSIGN;       }
"join_any"       { return SVLOG_JOIN_ANY;       }
"nexttime"       { return SVLOG_NEXTTIME;       }
"priority"       { return SVLOG_PRIORITY;       }
"property"       { return SVLOG_PROPERTY;       }
"randcase"       { return SVLOG_RANDCASE;       }
"realtime"       { return SVLOG_REAL_TIME;      }
"restrict"       { return SVLOG_RESTRICT;       }
"scalared"       { return SVLOG_SCALARED;       }
"sequence"       { return SVLOG_SEQUENCE;       }
"shortint"       { return SVLOG_SHORT_INT;      }
"s_always"       { return SVLOG_S_ALWAYS;       }
"unsigned"       { return SVLOG_UNSIGNED;       }
"vectored"       { return SVLOG_VECTORED;       }
"chandle"        { return SVLOG_CHANDLE;        }
"checker"        { return SVLOG_CHECKER;        }
"default"        { return SVLOG_DEFAULT;        }
"disable"        { return SVLOG_DISABLE;        }
"endcase"        { return SVLOG_ENDCASE;        }
"foreach"        { return SVLOG_FOREACH;        }
"forever"        { return SVLOG_FOREVER;        }
"implies"        { return SVLOG_IMPLIES;        }
"integer"        { return SVLOG_INTEGER;        }
"longint"        { return SVLOG_LONG_INT;       }
"matches"        { return SVLOG_MATCHES;        }
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
"unique0"        { return SVLOG_UNIQUE0;        }
"untyped"        { return SVLOG_UNTYPED;        }
"virtual"        { return SVLOG_VIRTUAL;        }
"always"         { return SVLOG_ALWAYS;         }
"assert"         { return SVLOG_ASSERT;         }
"assign"         { return SVLOG_ASSIGN;         }
"assume"         { return SVLOG_ASSUME;         }
"before"         { return SVLOG_BEFORE;         }
"config"         { return SVLOG_CONFIG;         }
"expect"         { return SVLOG_EXPECT;         }
"export"         { return SVLOG_EXPORT;         }
"genvar"         { return SVLOG_GENVAR;         }
"global"         { return SVLOG_GLOBAL;         }
"highz0"         { return SVLOG_HIGHZ0;         }
"highz1"         { return SVLOG_HIGHZ1;         }
"import"         { return SVLOG_IMPORT;         }
"inside"         { return SVLOG_INSIDE;         }
"medium"         { return SVLOG_MEDIUM;         }
"module"         { return SVLOG_MODULE;         }
"output"         { return SVLOG_OUTPUT;         }
"packed"         { return SVLOG_PACKED;         }
"repeat"         { return SVLOG_REPEAT;         }
"return"         { return SVLOG_RETURN;         }
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
"begin"          { return SVLOG_BEGIN;          }
"break"          { return SVLOG_BREAK;          }
"casex"          { return SVLOG_CASEX;          }
"casez"          { return SVLOG_CASEZ;          }
"class"          { return SVLOG_CLASS;          }
"const"          { return SVLOG_CONST;          }
"cover"          { return SVLOG_COVER;          }
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
"solve"          { return SVLOG_SOLVE;          }
"small"          { return SVLOG_SMALL;          }
"super"          { return SVLOG_SUPER;          }
"trior"          { return SVLOG_TRIOR;          }
"union"          { return SVLOG_UNION;          }
"until"          { return SVLOG_UNTIL;          }
"weak0"          { return SVLOG_WEAK0;          }
"weak1"          { return SVLOG_WEAK1;          }
"while"          { return SVLOG_WHILE;          }
"1step"          { return SVLOG_1STEP;          }
"$root"          { return SVLOG_ROOT;           }
"$unit"          { return SVLOG_UNIT;           }
"byte"           { return SVLOG_BYTE;           }
"case"           { return SVLOG_CASE;           }
"dist"           { return SVLOG_DIST;           }
"edge"           { return SVLOG_EDGE;           }
"else"           { return SVLOG_ELSE;           }
"enum"           { return SVLOG_ENUM;           }
"fork"           { return SVLOG_FORK;           }
"join"           { return SVLOG_JOIN;           }
"null"           { return SVLOG_NULL;           }
"rand"           { return SVLOG_RAND;           }
"real"           { return SVLOG_REAL;           }
"soft"           { return SVLOG_SOFT;           }
"step"           { return SVLOG_STEP;           }
"this"           { return SVLOG_THIS;           }
"time"           { return SVLOG_TIME;           }
"tri0"           { return SVLOG_TRI0;           }
"tri1"           { return SVLOG_TRI1;           }
"type"           { return SVLOG_TYPE;           }
"void"           { return SVLOG_VOID;           }
"wait"           { return SVLOG_WAIT;           }
"wand"           { return SVLOG_WAND;           }
"weak"           { return SVLOG_WEAK;           }
"wire"           { return SVLOG_WIRE;           }
"with"           { return SVLOG_WITH;           }
"and"            { return SVLOG_AND;            }
"bit"            { return SVLOG_BIT;            }
"end"            { return SVLOG_END;            }
"for"            { return SVLOG_FOR;            }
"iff"            { return SVLOG_IF_AND_ONLY_IF; }
"int"            { return SVLOG_INT;            }
"let"            { return SVLOG_LET;            }
"new"            { return SVLOG_NEW;            }
"not"            { return SVLOG_NOT;            }
"reg"            { return SVLOG_REG;            }
"std"            { return SVLOG_STD;            }
"tri"            { return SVLOG_TRI;            }
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
"s"              { return SVLOG_SEC;            }


"*::*"         { return EXPORT_DECLARATION;                 }
"&&&"          { return IF_AND_ONLY_IF;                     }
"==="          { return CASE_EQUAL;                         }
"!=="          { return CASE_NOT_EQUAL;                     }
"<<<"          { return LOGICAL_LEFT_SHIFT;                 }
">>>"          { return LOGICAL_RIGHT_SHIFT;                }
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
"[*]"          { return REPEAT_ZERO_OR_MORE; /* [*0:$] */   }
"[+]"          { return REPEAT_ONE_OR_MORE; /* [*1:$] */    }
"[*"           { return CONSECUTIVE_REPEAT_OPERATOR;        }
"[="           { return NON_CONSECUTIVE_REPEAT_OPERATOR;    }
"~&"           { return BIT_WISE_NAND;                      }
"~|"           { return BIT_WISE_NOR;                       }
"#0"           { return POUND_ZERO;                         }
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
"<="           { return LT_OR_EQ;                           }
"!"            { return LOGICAL_NOT;                        }
"^"            { return BIT_WISE_XOR;                       }
"|"            { return BIT_WISE_OR;                        }
"~"            { return BIT_WISE_NOT;                       } 
"&"            { return BIT_WISE_AND;                       }
"'"            { return APOSTROPHE;                         }
"<"            { return '<';                                }
">"            { return '>';                                }
"@"            { return '@';                                }
"$"            { return '$';                                }
"#"            { return '#';                                }
"="            { return '=';                                }
";"            { return ';';                                }
":"            { return ':';                                }
"+"            { return '+';                                }
"-"            { return '-';                                }
"*"            { return '*';                                }
"/"            { return '/';                                }
"%"            { return '%';                                }
"_"            { return '_';                                }
"."            { return '.';                                }
","            { return ',';                                }
"\""           { return '"';                                }
"("            { return '(';                                }
")"            { return ')';                                }
"["            { return '[';                                }
"]"            { return ']';                                }


{SVEXP}        { return SVLOG_EXP;        }
{SVDECBASED}   { return SVLOG_DEC_BASE_D; }
{SVDECBASES}   { return SVLOG_DEC_BASE_S; }
{SVBINBASE}    { return SVLOG_BIN_BASE;   }
{SVOCTBASE}    { return SVLOG_OCT_BASE;   }
{SVHEXBASE}    { return SVLOG_HEX_BASE;   }
{SVXDIGIT}     { return SVLOG_Z_DIGIT;    }
{SVZDIGIT}     { return SVLOG_X_DIGIT;    }

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
