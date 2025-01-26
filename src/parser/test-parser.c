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
test_yaveri_parser_scan_comments (void CANDO_UNUSED **state)
{
	int err = -1;

	struct yaveri_parser *parser = NULL;

	struct yaveri_parser_create_info parserCreateInfo;
	memset(&parserCreateInfo, 0, sizeof(parserCreateInfo));

	cando_log_set_level(CANDO_LOG_ALL);

	parser = yaveri_parser_create(&parserCreateInfo);
	assert_non_null(parser);

	err = yaveri_parser_scan(parser, COMMENTS_TEST_FILE);
	assert_int_equal(err, 0);

	yaveri_parser_destroy(parser);
}


static void CANDO_UNUSED
test_yaveri_parser_scan_identifier (void CANDO_UNUSED **state)
{
	int err = -1;

	struct yaveri_parser *parser = NULL;

	struct yaveri_parser_create_info parserCreateInfo;
	memset(&parserCreateInfo, 0, sizeof(parserCreateInfo));

	cando_log_set_level(CANDO_LOG_ALL);

	parser = yaveri_parser_create(&parserCreateInfo);
	assert_non_null(parser);

	err = yaveri_parser_scan(parser, IDENTIFIER_TEST_FILE);
	assert_int_equal(err, 0);

	yaveri_parser_destroy(parser);
}


static void CANDO_UNUSED
test_yaveri_parser_scan_escape_identifier (void CANDO_UNUSED **state)
{
	int err = -1;

	struct yaveri_parser *parser = NULL;

	struct yaveri_parser_create_info parserCreateInfo;
	memset(&parserCreateInfo, 0, sizeof(parserCreateInfo));

	cando_log_set_level(CANDO_LOG_ALL);

	parser = yaveri_parser_create(&parserCreateInfo);
	assert_non_null(parser);

	/* Purposely fail for now */
	err = yaveri_parser_scan(parser, ESCAPE_IDENTIFIER_TEST_FILE);
	assert_int_equal(err, 0);

	yaveri_parser_destroy(parser);
}


static void CANDO_UNUSED
test_yaveri_parser_scan_system_tf_call (void CANDO_UNUSED **state)
{
	int err = -1;

	struct yaveri_parser *parser = NULL;

	struct yaveri_parser_create_info parserCreateInfo;
	memset(&parserCreateInfo, 0, sizeof(parserCreateInfo));

	cando_log_set_level(CANDO_LOG_ALL);

	parser = yaveri_parser_create(&parserCreateInfo);
	assert_non_null(parser);

	err = yaveri_parser_scan(parser, SYSTEM_TF_CALL_TEST_FILE);
	assert_int_equal(err, -1);

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
		cmocka_unit_test(test_yaveri_parser_scan_comments),
		cmocka_unit_test(test_yaveri_parser_scan_identifier),
		//cmocka_unit_test(test_yaveri_parser_scan_escape_identifier),
		//cmocka_unit_test(test_yaveri_parser_scan_system_tf_call),
	};

	return cmocka_run_group_tests(tests, NULL, NULL);
}
