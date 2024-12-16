#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

/*
 * For cmocka
 */
#include <stdarg.h>
#include <stddef.h>
#include <stdint.h>
#include <setjmp.h>
#include <cmocka.h>

#include <cando/cando.h>

#include "parser.h"
#include "lexer.h"

/************************************************
 * Start of test_yaveri_parser_create functions *
 ************************************************/

static void
test_yaveri_parser_create (void CANDO_UNUSED **state)
{

}

/**********************************************
 * End of test_yaveri_parser_create functions *
 **********************************************/

int
main (void)
{
	const struct CMUnitTest tests[] =
	{
		cmocka_unit_test(test_yaveri_parser_create),
	};

	return cmocka_run_group_tests(tests, NULL, NULL);
}
