#!/usr/bin/env bash
set -euxo pipefail

P=${PROFILE:-release}
if [ "$P" = "debug" ]; then
    opt=''
else
    opt='--release'
fi

cd lib1
cargo clean
cargo build --verbose --all $opt

cd ../lib2
cargo clean
cargo build --verbose --all $opt
cd ..

clang main.c ./lib1/target/$P/liblib1.a ./lib2/target/$P/liblib2.a
./a.out
