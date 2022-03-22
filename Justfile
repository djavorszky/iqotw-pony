# just manual: https://github.com/casey/just/#readme

_default:
  @just --list

# Compiles the binary with a given name
compile name='solution' dir='.':
  ponyc -b {{name}} {{invocation_directory()}}/{{dir}}

# Compiles and runs the program
run: (compile 'solution')
  ./solution

test: (compile 'test' '_test')
  ./test
  rm test

