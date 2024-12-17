#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>

#include <sys/mman.h>

#include <cando/cando.h>

#include "cmdline.h"

#define MAX_FILENAME_SIZE (1<<9)

/*
 * @brief Structure representing the yaveri cmdline interface
 *
 * @member err      - Stores information about the error that occured
 *                    for the given instance and may later be retrieved
 *                    by caller.
 * @member fd       - file descriptor associated with the open @filename
 * @member filename - String of the file to parse
 */
struct yaveri_cmdline
{
	struct cando_log_error_struct err;
	int                           fd;
	char                          filename[MAX_FILENAME_SIZE];
};


/**************************************************
 * Start of yaveri_cmdline_process_args functions *
 **************************************************/

struct yaveri_cmdline *
yaveri_cmdline_process_args (const void CANDO_UNUSED *_processArgsInfo)
{
	int err = -1;

	struct yaveri_cmdline *cmdline = NULL;

	cmdline = mmap(NULL,
	               sizeof(struct yaveri_cmdline),
	               PROT_READ|PROT_WRITE,
	               MAP_ANONYMOUS|MAP_PRIVATE,
	               -1, 0);
	if (cmdline == (void*)-1) {
		return NULL;
	}

	err = CANDO_PAGE_SET_READ(cmdline, sizeof(struct yaveri_cmdline));
	if (err == -1) {
		yaveri_cmdline_destroy(cmdline);
		cando_log_err("mprotect: %s\n", strerror(errno));
		return NULL;
	}

	return cmdline;
}

/************************************************
 * End of yaveri_cmdline_process_args functions *
 ************************************************/


/*********************************************
 * Start of yaveri_cmdline_destroy functions *
 *********************************************/

void
yaveri_cmdline_destroy (struct yaveri_cmdline *cmdline)
{
	if (!cmdline)
		return;

	munmap(cmdline, sizeof(struct yaveri_cmdline));
}

/*******************************************
 * End of yaveri_cmdline_destroy functions *
 *******************************************/
