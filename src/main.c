#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <signal.h>

#include <cando/cando.h>

#include "cmdline/cmdline.h"
#include "lang/lexer.h"

struct yaveri
{
	struct yaveri_cmdline *cmdline;
};


/*
 * Only utilized by graceful_exit()
 */
static void *ptr = NULL;


void
graceful_exit (int CANDO_UNUSED signum)
{
	struct yaveri *yaveri = ptr;

	yaveri_cmdline_destroy(yaveri->cmdline);
}


int
main (const int argc,
      const char *argv[])
{
	struct yaveri yaveri;

	struct sigaction action, oldAction;

	struct yaveri_cmdline_process_args_info processArgsInfo;

	memset(&action, 0, sizeof(action));
	memset(&oldAction, 0, sizeof(oldAction));
	memset(&yaveri, 0, sizeof(yaveri));
	memset(&processArgsInfo, 0, sizeof(processArgsInfo));

	ptr = &yaveri;

	action.sa_handler = graceful_exit;
	sigemptyset(&action.sa_mask);
	action.sa_flags = 0;

	sigaction(SIGINT, NULL, &oldAction);
	if (oldAction.sa_handler != SIG_IGN)
		sigaction(SIGINT, &action, NULL);

	sigaction(SIGHUP, NULL, &oldAction);
	if (oldAction.sa_handler != SIG_IGN)
		sigaction(SIGHUP, &action, NULL);

	sigaction(SIGTERM, NULL, &oldAction);
	if (oldAction.sa_handler != SIG_IGN)
		sigaction(SIGTERM, &action, NULL);

	processArgsInfo.argv = argv;
	processArgsInfo.argc = argc;
	processArgsInfo.stream = STDOUT_FILENO;
	yaveri.cmdline = yaveri_cmdline_process_args(&processArgsInfo);
	if (!(yaveri.cmdline))
		return 1;

	graceful_exit(0);

	return 0;
}
