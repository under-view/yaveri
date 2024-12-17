#ifndef YAVERI_PARSER_H
#define YAVERI_PARSER_H

/*
 * Stores information about the yaveri_parser context.
 */
struct yaveri_parser;


/*
 * @brief
 *
 * @member
 */
struct yaveri_parser_create_info
{
	int blank;
};


/*
 * @brief
 *
 * @param parserCreateInfo - Pointer to a struct yaveri_parser_create_info.
 *                           The use of pointer to a void is to limit amount
 *                           of columns required to define a function.
 *
 * @returns
 * 	on success: Pointer to a struct yaveri_parser
 * 	on failure: NULL
 */
struct yaveri_parser *
yaveri_parser_create (const void *parserCreateInfo);


/*
 * @brief Frees any allocated memory and closes FD's (if open) created after
 *        yaveri_parser_create() call.
 *
 * @param parser - Pointer to a valid struct yaveri_parser
 */
void
yaveri_parser_destroy (struct yaveri_parser *parser);

#endif /* YAVERI_PARSER_H */
