#!/bin/sh

# This script is to be exected from the taichi repo folder i.e. `./scripts/run_clang_tidy.sh`
rm -rf build_clang_tidy
mkdir -p build_clang_tidy/
cd build_clang_tidy
cmake .. -DCMAKE_CXX_COMPILER=clang -DCMAKE_C_COMPILER=clang -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
cd ..
python3 scripts/run-clang-tidy.py $PWD/taichi -header-filter="$PWD/taichi/" -p build_clang_tidy -j16 -fix
