#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <sys/mman.h>

#include <cando/cando.h>

#include "parser-private.h"

#include "yaveri-sv-lexer.h"
#include "yaveri-sv-parser.tab.h"

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
		cando_log_error("Incorrect data passed\n");
		return NULL;
	}

	parser = mmap(NULL,
	              sizeof(struct yaveri_parser),
	              PROT_READ|PROT_WRITE,
	              MAP_PRIVATE|MAP_ANONYMOUS,
	              -1, 0);
	if (!parser) {
		cando_log_error("mmap: %s\n", strerror(errno));
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
	yyscan_t scanner;

	YY_BUFFER_STATE buff = NULL;

	const void *data = NULL;

	struct cando_file_ops *flops = NULL;
	struct cando_file_ops_create_info flopsCreateInfo;

	if (!parser || \
	    !file)
	{
		cando_log_set_error(parser, CANDO_LOG_ERR_INCORRECT_DATA, "");
		return -1;
	}

	memset(&flopsCreateInfo, 0, sizeof(flopsCreateInfo));

	flopsCreateInfo.fileName = file;
	flops = cando_file_ops_create(&flopsCreateInfo);
	if (!flops)
		return -1;

	data = cando_file_ops_get_data(flops, 0);

	yylex_init(&scanner);
	buff = yy_scan_string(data, scanner);
	yyparse(scanner);
	yy_delete_buffer(buff, scanner);
	yylex_destroy(scanner);

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

	munmap(parser, sizeof(struct yaveri_parser));
}

/******************************************
 * End of yaveri_parser_destroy functions *
 ******************************************/


/*******************************************
 * Start of functions used by flex & bison *
 *******************************************/

void
yyerror (void CANDO_UNUSED *type,
         void CANDO_UNUSED *yylloc,
         const char *message)
{
	fprintf(stderr, "%s\n", message);
}

/*****************************************
 * End of functions used by flex & bison *
 *****************************************/
