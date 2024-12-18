#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <sys/mman.h>

#include <cando/cando.h>

#include "reserved-words.h"
#include "yaveri-sv-lexer.h"
#include "parser.h"

#define FILE_PATH_NAME_MAX (1<<9)

/*
 * @brief
 *
 * @member err - Stores information about the error that occured
 *               for the given instance and may later be retrieved
 *               by caller.
 */
struct yaveri_parser
{
	struct cando_log_error_struct err;
	FILE                          *file;
};


/*******************************************
 * Start of yaveri_parser_create functions *
 *******************************************/

struct yaveri_parser *
yaveri_parser_create (const void *_parserCreateInfo)
{
	struct yaveri_parser *parser = NULL;

	const struct yaveri_parser_create_info *parserCreateInfo = _parserCreateInfo;

	if (!parserCreateInfo)
	{
		cando_log_err("Incorrect data passed\n");
		return NULL;
	}

	parser = mmap(NULL,
	              sizeof(struct yaveri_parser),
	              PROT_READ|PROT_WRITE,
	              MAP_PRIVATE|MAP_ANONYMOUS,
	              -1, 0);
	if (!parser) {
		cando_log_err("mmap: %s\n", strerror(errno));
		return NULL;
	}

	return parser;
}

/*****************************************
 * End of yaveri_parser_create functions *
 *****************************************/


/*****************************************
 * Start of yaveri_parser_scan functions *
 *****************************************/

int
yaveri_parser_scan (struct yaveri_parser *parser,
                    const char *file)
{
	int token = 0;

	if (!parser)
	{
		cando_log_set_err(parser, CANDO_LOG_ERR_INCORRECT_DATA, "");
		return -1;
	}

	parser->file = fopen(file, "rw");
	if (!(parser->file)) {
		cando_log_set_err(parser, errno, "fopen: %s", strerror(errno));
		return -1;
	}

	yyin = parser->file;

	while ((token = yylex()))
	{
		fprintf(stdout, "%s\n", yytext);
		switch (token)
		{
			case SVLOG_REG:
				break;
			case SVLOG_WIRE:
				break;
			case SVLOG_INTEGER:
				break;
			case SVLOG_REAL:
				break;
			case SVLOG_TIME:
				break;
			case SVLOG_REAL_TIME:
				break;
			case SVLOG_LOGIC:
				break;
			case SVLOG_BIT:
				break;
			case SVLOG_BYTE:
				break;
			case SVLOG_SHORT_INT:
				break;
			case SVLOG_INT:
				break;
			case SVLOG_LONG_INT:
				break;
			case SVLOG_SHORT_REAL:
				break;
			default:
				return -1;
		}
	}

	fclose(parser->file);
	parser->file = NULL;

	return 0;
}

/***************************************
 * End of yaveri_parser_scan functions *
 ***************************************/


/********************************************
 * Start of yaveri_parser_destroy functions *
 ********************************************/

void
yaveri_parser_destroy (struct yaveri_parser *parser)
{
	if (!parser)
		return;

	fclose(parser->file);
	yylex_destroy();
	munmap(parser, sizeof(struct yaveri_parser));
}

/******************************************
 * End of yaveri_parser_destroy functions *
 ******************************************/

void
yyerror (const char *s)
{
   fprintf(stderr, "%s\n", s);
}
