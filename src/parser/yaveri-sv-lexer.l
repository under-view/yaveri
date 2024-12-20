%option noinput nounput 8bit nodefault

%option always-interactive

%option noyywrap

%{

#include "yaveri-sv-parser.tab.h"

#include "parser/parser.h"

%}


%%
	/* Start of reserved words */
"s"         { return SVLOG_SEC;        }
"ms"        { return SVLOG_MILLISEC;   }
"us"        { return SVLOG_MICROSEC;   }
"ns"        { return SVLOG_NANOSEC;    }
"ps"        { return SVLOG_PICOSEC;    }
"fs"        { return SVLOG_fEMTOSEC;   }
"step"      { return SVLOG_STEP;       }
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
"["         { return LSBRAC;           }
"]"         { return RSBRAC;           }
":"         { return COLON;            }
";"         { return SEMICOLON;        }
"_"         { return UNDERSCORE;       }
"+"         { return PLUS;             }
"-"         { return MINUS;            }
"!"         { return LOGICAL_NOT;      }
"~"         { return BIT_WISE_NOT;     }
"&"         { return BIT_WISE_AND;     }
"~&"        { return BIT_WISE_NAND;    }
"|"         { return BIT_WISE_OR;      }
"~|"        { return BIT_WISE_NOR;     }
"^"         { return BIT_WISE_XOR;     }
"~^"        { return BIT_WISE_XNOR;    }
"^~"        { return BIT_WISE_XNOR;    }
	/* End of reserved words */


[ \n\t\f\v] { /* skip blanks */ }

	/* Regular expression for single line comment*/
\/\/(.*) {};

	/* Regular expression for multi line comment*/
\/\*(.*\n)*.*\*\/  {};

%%
