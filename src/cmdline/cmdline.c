#include <stdio.h>
#include <stdlib.h>

#include <sys/mman.h>

#include "cmdline.h"

#define MAX_FILENAME_SIZE (1<<9)

/*
 * @brief Structure representing the veridator cmdline interface
 *
 * @member fd       - file descriptor associated with the open @filename
 * @member filename - String of the file to parse
 */
struct veridator_cmdline
{
	int  fd;
	char filename[MAX_FILENAME_SIZE];
};


/*****************************************************
 * Start of veridator_cmdline_process_args functions *
 *****************************************************/

struct veridator_cmdline *
veridator_cmdline_process_args (const void *_processArgsInfo)
{
	struct veridator_cmdline *cmdline = NULL;

	(void) _processArgsInfo;

	cmdline = mmap(NULL,
	               sizeof(struct veridator_cmdline),
	               PROT_READ|PROT_WRITE,
	               MAP_ANONYMOUS|MAP_PRIVATE,
	               -1, 0);
	if (cmdline == (void*)-1) {
		return NULL;
	}

	return cmdline;
}

/***************************************************
 * End of veridator_cmdline_process_args functions *
 ***************************************************/


/************************************************
 * Start of veridator_cmdline_destroy functions *
 ************************************************/

void
veridator_cmdline_destroy (struct veridator_cmdline *cmdline)
{
	if (!cmdline)
		return;

	munmap(cmdline, sizeof(struct veridator_cmdline));
}

/**********************************************
 * End of veridator_cmdline_destroy functions *
 **********************************************/
