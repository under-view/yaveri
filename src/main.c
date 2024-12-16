#include <stdio.h>
#include <stdlib.h>

#include "lexer.h"

int
main (int argc, char *argv[])
{
	(void)argc;

	int vtoken;

	yyin = fopen(argv[1], "r");
	if (!yyin)
		return 1;

	while ((vtoken = yylex()))

	fclose(yyin);

	yylex_destroy();

	return 0;
}
