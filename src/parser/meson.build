# For main executable
fs += [
  'src/parser/parser.c',
]

# For test executables
parser_fs = [
  'parser.c',
]

parser_inc = include_directories('.')

parser_src_dir = meson.current_source_dir()

flex = find_program('flex', required: true)
bison = find_program('bison', required: true)

lexer_outputs = ['yaveri-sv-lexer.c', 'yaveri-sv-lexer.h']
main_lexer = '@0@/yaveri-sv-lexer.l'.format(parser_src_dir)
build_lexer = custom_target('build-lexer',
                            output: lexer_outputs,
                            input: main_lexer,
                            command: [
                                flex,
                                '--outfile', '@OUTPUT0@',
                                '--header-file=@OUTPUT1@',
                                '@INPUT@'
                            ],
                            install: false,
                            build_always_stale: false,
                            build_by_default: true)

parser_outputs = ['yaveri-sv-parser.tab.c', 'yaveri-sv-parser.tab.h']
main_parser = '@0@/yaveri-sv-parser.y'.format(parser_src_dir)
build_parser = custom_target('build-parser',
                             output: parser_outputs,
                             input: main_parser,
                             command: [
                                 bison, '-t', '-d',
                                 '-Wcounterexamples',
                                 '--output', '@OUTPUT0@',
                                 '--header=@OUTPUT1@',
                                 '@INPUT@'
                             ],
                             install: false,
                             build_always_stale: false,
                             build_by_default: true)

extra_ctgt += [build_lexer, build_parser]

if tests
  original_args = pargs

  progs = [ 'test-parser.c' ]

  pargs += ['-DCOMMENTS_TEST_FILE="@0@/test-files/@1@"'.format(parser_src_dir, 'comment.sv')]
  pargs += ['-DIDENTIFIER_TEST_FILE="@0@/test-files/@1@"'.format(parser_src_dir, 'identifier.sv')]
  pargs += ['-DESCAPE_IDENTIFIER_TEST_FILE="@0@/test-files/@1@"'.format(parser_src_dir, 'escape-identifier.sv')]
  foreach p : progs
    exec_name = p.substring(0,-2) # remove .c extension from name

    exec = executable(exec_name,
                      files([p, parser_fs]),
                      sources: extra_ctgt,
                      dependencies: [libcmocka,yaveri_deps],
                      include_directories: [inc, parser_inc],
                      c_args: pargs,
                      install: false)

    test(exec_name, exec)
    pargs = original_args
  endforeach
endif
