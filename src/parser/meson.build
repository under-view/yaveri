# For main executable
fs += [
  'src/parser/parser.c',
  'src/parser/yaveri-sv-lexer.c',
  'src/parser/yaveri-sv-parser.tab.c',
]

# For test executables
parser_fs = [
  'parser.c',
  'yaveri-sv-lexer.c',
  'yaveri-sv-parser.tab.c',
]

parser_inc = include_directories('.')

main_lexer = '@0@/src/parser/yaveri-sv-lexer.l'.format(src_root_dir)
r = run_command('flex', main_lexer, check: true)

main_parser = '@0@/src/parser/yaveri-sv-parser.y'.format(src_root_dir)
r = run_command('bison', '-d', main_parser, check: true)

if tests
  progs = [ 'test-parser.c' ]

  original_args = pargs
  foreach p : progs
    exec_name = p.substring(0,-2) # remove .c extension from name

    exec = executable(exec_name,
                      files([p, parser_fs]),
                      dependencies: [libcmocka,yaveri_deps],
                      include_directories: [inc, parser_inc],
                      c_args: pargs,
                      install: false)

    test(exec_name, exec)
    pargs = original_args
  endforeach
endif
