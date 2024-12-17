#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <sys/mman.h>

#include <cando/cando.h>

#include "parser.h"

struct yaveri_parser
{
	struct cando_log_error_struct err;
};


struct yaveri_parser *
yaveri_parser_create (const void CANDO_UNUSED *_parserCreateInfo)
{
	int err = -1;

	struct yaveri_parser *parser = NULL;

	parser = mmap(NULL,
	              sizeof(struct yaveri_parser),
	              PROT_READ|PROT_WRITE,
	              MAP_PRIVATE|MAP_ANONYMOUS,
	              -1, 0);
	if (!parser) {
		cando_log_err("mmap: %s\n", strerror(errno));
		return NULL;
	}

	err = CANDO_PAGE_SET_READ(parser, sizeof(struct yaveri_parser));
	if (err == -1) {
		cando_log_err("mprotect: %s\n", strerror(errno));
		return NULL;
	}

	return parser;
}


void
yaveri_parser_destroy (struct yaveri_parser *parser)
{
	if (!parser)
		return;

	munmap(parser, sizeof(struct yaveri_parser));
}
