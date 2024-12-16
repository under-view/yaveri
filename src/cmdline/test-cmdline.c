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

#include "cmdline.h"

/****************************************************
 * Start of test_veridator_cmdline_create functions *
 ****************************************************/

static void
test_veridator_cmdline_create (void **state)
{
	(void) state; /* unused */

	const char *argv[] = { "veridator" };

	struct veridator_cmdline *cmdline = NULL;

	struct veridator_cmdline_process_args_info processArgsInfo;

	processArgsInfo.stream = STDOUT_FILENO;
	processArgsInfo.argc = sizeof(argv) / sizeof(char*);
	processArgsInfo.argv = argv;
	cmdline = veridator_cmdline_process_args(&processArgsInfo);
	assert_non_null(cmdline);
}

/**************************************************
 * End of test_veridator_cmdline_create functions *
 **************************************************/

int
main (void)
{
	const struct CMUnitTest tests[] =
	{
		cmocka_unit_test(test_veridator_cmdline_create),
	};

	return cmocka_run_group_tests(tests, NULL, NULL);
}
