yaveri_deps = []

fs = [
  'src/main.c',
  'src/cmdline/cmdline.c',
  'src/lexer.c'
]

main_lexer = '@0@/src/yaveri-lexer-main.l'.format(src_root_dir)
r = run_command('flex', main_lexer, check: true)

fl = cc.find_library('fl')

if tests
  libcmocka = dependency('cmocka', required: true)
endif

yaveri_deps += [fl]
subdir('cmdline')
