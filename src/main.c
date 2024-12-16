#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <signal.h>

#include "cmdline/cmdline.h"
#include "lexer.h"

struct veridator
{
	struct veridator_cmdline *cmdline;
};


/*
 * Only utilized by graceful_exit()
 */
static void *ptr = NULL;


void
graceful_exit (int signum)
{
	(void)signum;

	struct veridator *veridator = ptr;

	veridator_cmdline_destroy(veridator->cmdline);
}


int
main (const int argc,
      const char *argv[])
{
	struct veridator veridator;

	struct sigaction action, oldAction;

	struct veridator_cmdline_process_args_info processArgsInfo;

	memset(&action, 0, sizeof(action));
	memset(&oldAction, 0, sizeof(oldAction));
	memset(&veridator, 0, sizeof(veridator));
	memset(&processArgsInfo, 0, sizeof(processArgsInfo));

	ptr = &veridator;

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
	veridator.cmdline = veridator_cmdline_process_args(&processArgsInfo);
	if (!(veridator.cmdline))
		return 1;

	graceful_exit(0);

	return 0;
}
