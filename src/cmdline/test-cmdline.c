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

#include "cmdline.h"

/*************************************************
 * Start of test_yaveri_cmdline_create functions *
 *************************************************/

static void
test_yaveri_cmdline_create (void CANDO_UNUSED **state)
{
	const char *argv[] = { "yaveri" };

	struct yaveri_cmdline *cmdline = NULL;

	struct yaveri_cmdline_process_args_info processArgsInfo;

	processArgsInfo.stream = STDOUT_FILENO;
	processArgsInfo.argc = sizeof(argv) / sizeof(char*);
	processArgsInfo.argv = argv;
	cmdline = yaveri_cmdline_process_args(&processArgsInfo);
	assert_non_null(cmdline);
}

/***********************************************
 * End of test_yaveri_cmdline_create functions *
 ***********************************************/

int
main (void)
{
	const struct CMUnitTest tests[] =
	{
		cmocka_unit_test(test_yaveri_cmdline_create),
	};

	return cmocka_run_group_tests(tests, NULL, NULL);
}
