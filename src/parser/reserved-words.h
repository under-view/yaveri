#ifndef RESERVED_WORDS_H
#define RESERVED_WORDS_H

/*
 * When bison creates a parser, bison will assign
 * token numbers automatically starting at 258.
 */
enum svlog_reserved_words
{
	SVLOG_REG        = 258,
	SVLOG_WIRE       = 259,
	SVLOG_INTEGER    = 260,
	SVLOG_REAL       = 261,
	SVLOG_TIME       = 262,
	SVLOG_REAL_TIME  = 263,
	SVLOG_LOGIC      = 264,
	SVLOG_BIT        = 265,
	SVLOG_BYTE       = 266,
	SVLOG_SHORT_INT  = 267,
	SVLOG_INT        = 268,
	SVLOG_LONG_INT   = 269,
	SVLOG_SHORT_REAL = 270,
};

#endif /* RESERVED_WORDS_H */
