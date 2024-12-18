#include <stdlib.h>
#include <stdio.h>
#include <string.h>
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

/************************************************
 * Start of test_yaveri_parser_create functions *
 ************************************************/

static void CANDO_UNUSED
test_yaveri_parser_create (void CANDO_UNUSED **state)
{
	struct yaveri_parser *parser = NULL;

	struct yaveri_parser_create_info parserCreateInfo;
	memset(&parserCreateInfo, 0, sizeof(parserCreateInfo));

	parser = yaveri_parser_create(&parserCreateInfo);
	assert_non_null(parser);

	yaveri_parser_destroy(parser);
}

/**********************************************
 * End of test_yaveri_parser_create functions *
 **********************************************/


/**********************************************
 * Start of test_yaveri_parser_scan functions *
 **********************************************/

static void CANDO_UNUSED
test_yaveri_parser_parse_comments (void CANDO_UNUSED **state)
{
	int err = -1;

	struct yaveri_parser *parser = NULL;

	struct yaveri_parser_create_info parserCreateInfo;
	memset(&parserCreateInfo, 0, sizeof(parserCreateInfo));

	parser = yaveri_parser_create(&parserCreateInfo);
	assert_non_null(parser);

	err = yaveri_parser_parse(parser, NULL);
	assert_int_equal(err, 0);

	yaveri_parser_destroy(parser);
}

/********************************************
 * End of test_yaveri_parser_scan functions *
 ********************************************/

int
main (void)
{
	const struct CMUnitTest tests[] =
	{
		cmocka_unit_test(test_yaveri_parser_create),
	};

	return cmocka_run_group_tests(tests, NULL, NULL);
}
