#!/bin/bash
set -e
set -x

[[ $(basename `pwd`) == "C" ]] && cd ..

readonly FORMATCMD="clang-format -style=\"{BasedOnStyle: llvm, IndentWidth: 4}\" -i"

find C -type f -name "*.h" -or -name "*.c" -exec sh -c "$FORMATCMD {}" \;

