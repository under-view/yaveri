
fs = [
  'src/main.c',
  'src/lexer.c'
]

main_lexer = '@0@/src/veridator-lexer-main.l'.format(src_root_dir)
r = run_command('flex', main_lexer, check: true)

fl = cc.find_library('fl')
