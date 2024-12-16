#ifndef VERIDATOR_CMDLINE_H
#define VERIDATOR_CMDLINE_H

/*
 * Stores information about the veridator_cmdline context.
 */
struct veridator_cmdline;


/*
 * @brief Struct passed to veridator_cmdline_process_args().
 *
 * @member stream - File descriptor to open file to write to.
 * @member argc   - Array size of @argv. Amount of command line
 *                  arguments where passed to executable.
 * @member argv   - Array of commandline arguments in string format.
 *
 */
struct veridator_cmdline_process_args_info
{
	int        stream;
	int        argc;
	const char **argv;
};


/*
 * @brief Parses and stores arguments.
 *
 * @param fileInfo - Pointer to a struct veridator_cmdline_process_args_info.
 *                   The use of pointer to a void is to limit amount
 *                   of columns required to define a function.
 *
 * @returns
 * 	on success: Pointer to a struct cando_file_ops
 * 	on failure: NULL
 */
struct veridator_cmdline *
veridator_cmdline_process_args (const void *procInfo);


/*
 * @brief Frees any allocated memory and closes FD's (if open) created after
 *        veridator_cmdline_process_args() call.
 *
 * @param cmdline - Pointer to a valid struct veridator_cmdline
 */
void
veridator_cmdline_destroy (struct veridator_cmdline *cmdline);

#endif /* VERIDATOR_CMDLINE_H */
