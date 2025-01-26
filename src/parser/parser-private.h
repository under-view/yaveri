#ifndef PARSER_PRIVATE
#define PARSER_PRIVATE

#include <cando/macros.h>

/*
 * Comment from: https://aquamentus.com/flex_bison.html
 *
 * Bison fundamentally works by asking flex to get the next token, which it
 * returns as an object of type "yystype". Initially (by default), yystype
 * is merely a typedef of "int", but for non-trivial projects, tokens could
 * be of any arbitrary data type. So, to deal with that, the idea is to
 * override yystype's default typedef to be a C union instead. Unions can
 * hold all of the types of tokens that Flex could return, and this this means
 * we can return ints or floats or strings cleanly. Bison implements this
 * mechanism with the %union directive:
 */
typedef union YYSTYPE {
	int itoken;        /* Integer token */
	char stoken[4096]; /* String token */
} YYSTYPE;


/*
 * Bison expects you to implement the function yylex(),
 * used to get the next token. Our yylex() is provided
 * by the flex scanner, but we override the function call
 * here so that it's a reentrant function.
 */
extern int
yylex (YYSTYPE *yylval_param,
       void *yylloc,
       void *yyscanner);

#define YY_DECL int yylex \
	(YYSTYPE *yylval_param, \
         void CANDO_UNUSED *yylloc, \
         void CANDO_UNUSED *yyscanner)

/*
 * Bison expects you to implement the function yyerror(),
 * invoked whenever the parser step into an error.
 */
extern void
yyerror (void *yylloc,
         void *scanner,
         const char *message);

#endif /* PARSER_PRIVATE */
