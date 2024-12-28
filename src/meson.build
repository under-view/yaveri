yaveri_deps = []

fs = [
  'src/main.c',
  'src/cmdline/cmdline.c',
]

# flex libraries are only needed to get
# the default yywrap definition
fl = cc.find_library('fl')
libcando = dependency('cando', required: true, version: '>=0.1.2')

if tests
  libcmocka = dependency('cmocka', required: true)
endif

yaveri_deps += [fl,libcando]

subdir('cmdline')
subdir('parser')
