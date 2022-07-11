# wslsdlexample
This is my lunch break project to explore compiling of Windows GUI (SDL)
binaries from within WSL Linux environment using Linux Clang.

## Prequisities
This uses CMake toolchain file feature to setup Clang-cl for producing Windows
based all-in-one binary with SDL library included. To produce such binary Linux
Clang (running inside in WSL) depends on Windows SDK and MSVC standard library
headers installed on Windows host. For this project I had Visual Studio 2022 
Build Tools and Windows 10 SDK 10.0.19041.0 installed in standard locations in
Program Files (x86).

* `CMake` 3.20 (Linux version in WSL)
* `Clang` 15 (Linux version in WSL)
* `ninja` (Linux version in WSL, optional)
* Microsoft Visual Studio 2022 Build Tools (on Windows)
* Windows 10 SDK ver. 10.0.19041.0 (on Windows)

To modify either version/path to Visual Studio 2022 or Windows 10 SDK edit file
`ClangMSVC.toolchain.cmake`.

## Build
``` shell
mkdir build && cmake -S . -B build/ -G Ninja --toolchain ClangMSVC.toolchain.cmake
cmake --build build/
```
Above should bootstrap `build/` directory and clone and configure SDL2 from
Github. Then it should build `wslsdlexample.exe` binary.
