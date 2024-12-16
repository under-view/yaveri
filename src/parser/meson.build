parser_fs = [
  'parser.c',
  'lexer.c'
]

parser_inc = include_directories('.')

main_lexer = '@0@/src/parser/yaveri-lexer-main.l'.format(src_root_dir)
r = run_command('flex', main_lexer, check: true)

if tests
  progs = [ 'test-parser.c' ]

  original_args = pargs
  foreach p : progs
    exec_name = p.substring(0,-2) # remove .c extension from name

    exec = executable(exec_name,
                      files([p, parser_fs]),
                      dependencies: [libcmocka],
                      include_directories: [inc, parser_inc],
                      c_args: pargs,
                      install: false)

    test(exec_name, exec)
    pargs = original_args
  endforeach
endif
