#ifndef YAVERI_CMDLINE_H
#define YAVERI_CMDLINE_H

/*
 * Stores information about the yaveri_cmdline context.
 */
struct yaveri_cmdline;


/*
 * @brief Struct passed to yaveri_cmdline_process_args().
 *
 * @member stream - File descriptor to open file to write to.
 * @member argc   - Array size of @argv. Amount of command line
 *                  arguments where passed to executable.
 * @member argv   - Array of commandline arguments in string format.
 */
struct yaveri_cmdline_process_args_info
{
	int        stream;
	int        argc;
	const char **argv;
};


/*
 * @brief Parses and stores arguments.
 *
 * @param procArgInfo - Pointer to a struct yaveri_cmdline_process_args_info.
 *                      The use of pointer to a void is to limit amount
 *                      of columns required to define a function.
 *
 * @returns
 * 	on success: Pointer to a struct yaveri_cmdline
 * 	on failure: NULL
 */
struct yaveri_cmdline *
yaveri_cmdline_process_args (const void *procArgInfo);


/*
 * @brief Frees any allocated memory and closes FD's (if open) created after
 *        yaveri_cmdline_process_args() call.
 *
 * @param cmdline - Pointer to a valid struct yaveri_cmdline
 */
void
yaveri_cmdline_destroy (struct yaveri_cmdline *cmdline);

#endif /* YAVERI_CMDLINE_H */
