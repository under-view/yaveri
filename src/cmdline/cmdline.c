#include <stdio.h>
#include <stdlib.h>

#include <sys/mman.h>

#include "cmdline.h"

#define MAX_FILENAME_SIZE (1<<9)

/*
 * @brief Structure representing the yaveri cmdline interface
 *
 * @member fd       - file descriptor associated with the open @filename
 * @member filename - String of the file to parse
 */
struct yaveri_cmdline
{
	int  fd;
	char filename[MAX_FILENAME_SIZE];
};


/**************************************************
 * Start of yaveri_cmdline_process_args functions *
 **************************************************/

struct yaveri_cmdline *
yaveri_cmdline_process_args (const void *_processArgsInfo)
{
	struct yaveri_cmdline *cmdline = NULL;

	(void) _processArgsInfo;

	cmdline = mmap(NULL,
	               sizeof(struct yaveri_cmdline),
	               PROT_READ|PROT_WRITE,
	               MAP_ANONYMOUS|MAP_PRIVATE,
	               -1, 0);
	if (cmdline == (void*)-1) {
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
