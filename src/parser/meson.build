# For main executable
fs += [
  'src/parser/parser.c',
]

# For test executables
parser_fs = [
  'parser.c',
]

parser_inc = include_directories('.')

flex = find_program('flex', required: true)
bison = find_program('bison', required: true)

main_lexer = '@0@/src/parser/yaveri-sv-lexer.l'.format(src_root_dir)
build_lexer = custom_target('build-lexer',
                            output: ['yaveri-sv-lexer.c', 'yaveri-sv-lexer.h'],
                            input: main_lexer,
                            command: [
                                flex,
                                '--outfile', '@OUTPUT0@',
                                '--header-file=@OUTPUT1@',
                                '@INPUT@'
                            ],
                            install: false,
                            build_always_stale: true,
                            build_by_default: true)

main_parser = '@0@/src/parser/yaveri-sv-parser.y'.format(src_root_dir)
build_parser = custom_target('build-parser',
                             output: ['yaveri-sv-parser.tab.c', 'yaveri-sv-parser.tab.h'],
                             input: main_parser,
                             command: [
                                 bison, '-d',
                                 '--output', '@OUTPUT0@',
                                 '--header=@OUTPUT1@',
                                 '@INPUT@'
                             ],
                             install: false,
                             build_always_stale: true,
                             build_by_default: true)

extra_ctgt += [build_lexer, build_parser]

if tests
  progs = [ 'test-parser.c' ]

  original_args = pargs
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
