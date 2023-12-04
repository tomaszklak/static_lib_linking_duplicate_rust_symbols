To reproduce run

```
$ ./run.sh && PROFILE='debug' ./run.sh
```
Until the problem is fixed, the result will be something like:
```
$ ./run.sh && PROFILE='debug' ./run.sh
+ P=release
+ '[' release = debug ']'
+ opt=--release
+ cd lib1
+ cargo clean
+ cargo build --verbose --all --release
   Compiling lib1 v0.1.0 (/Users/tomaszklak/Development/static_lib_linking/lib1)
     Running `/Users/tomaszklak/.rustup/toolchains/1.72.0-aarch64-apple-darwin/bin/rustc --crate-name lib1 --edition=2021 src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --diagnostic-width=150 --crate-type staticlib --crate-type cdylib --emit=dep-info,link -C opt-level=3 -C lto=fat -C metadata=203bec303322af27 --out-dir /Users/tomaszklak/Development/static_lib_linking/lib1/target/release/deps -L dependency=/Users/tomaszklak/Development/static_lib_linking/lib1/target/release/deps`
    Finished release [optimized] target(s) in 2.04s
+ cd ../lib2
+ cargo clean
+ cargo build --verbose --all --release
   Compiling lib2 v0.1.0 (/Users/tomaszklak/Development/static_lib_linking/lib2)
     Running `/Users/tomaszklak/.rustup/toolchains/1.72.0-aarch64-apple-darwin/bin/rustc --crate-name lib2 --edition=2021 src/lib.rs --error-format=json --json=diagnostic-rendered-ansi,artifacts,future-incompat --diagnostic-width=150 --crate-type staticlib --crate-type cdylib --emit=dep-info,link -C opt-level=3 -C embed-bitcode=no -C metadata=918cfb21296e0f6a --out-dir /Users/tomaszklak/Development/static_lib_linking/lib2/target/release/deps -L dependency=/Users/tomaszklak/Development/static_lib_linking/lib2/target/release/deps`
    Finished release [optimized] target(s) in 0.26s
+ cd ..
+ clang main.c ./lib1/target/release/liblib1.a ./lib2/target/release/liblib2.a
duplicate symbol '_rust_eh_personality' in:
    ./lib1/target/release/liblib1.a[2](lib1.lib1.4947d09128ca5de2-cgu.0.rcgu.o)
    ./lib2/target/release/liblib2.a[4](std-d7b0465d1109e375.std.5f883c90b3b6ecb9-cgu.0.rcgu.o)
ld: 1 duplicate symbols
clang: error: linker command failed with exit code 1 (use -v to see invocation)
```
