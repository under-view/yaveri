project(
  'yaveri',
  'c',
  version: '0.0.1',
  license: 'MIT',
  meson_version: '>=1.3.1',
  default_options: [
    'c_std=c11',
    'warning_level=2',
    'werror=true',
  ],
)

pargs = []
cc = meson.get_compiler('c')
project_name = meson.project_name()
src_root_dir = meson.current_source_dir()
build_root_dir = meson.current_build_dir()

inc = include_directories('src')

tests = get_option('tests')

subdir('src')

pargs += [ '-D_GNU_SOURCE' ]

executable(project_name,
           files(fs),
           dependencies: yaveri_deps,
           include_directories: [inc],
           c_args: pargs,
           install: true)
