cmdline_fs = [ 'cmdline.c' ]

cmdline_inc = include_directories('.')

if tests
  progs = [ 'test-cmdline.c' ]

  original_args = pargs
  foreach p : progs
    exec_name = p.substring(0,-2) # remove .c extension from name

    exec = executable(exec_name,
                      files([p, cmdline_fs]),
                      dependencies: [libcmocka,yaveri_deps],
                      include_directories: [inc, cmdline_inc],
                      c_args: pargs,
                      install: false)

    test(exec_name, exec)
    pargs = original_args
  endforeach
endif
