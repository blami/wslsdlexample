# This is toolchain file for use on WSL

set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_VERSION 10.0.19041.0)
set(CMAKE_SYSTEM_PROCESSOR amd64)

set(CMAKE_C_COMPILER clang-cl-15)
set(CMAKE_CXX_COMPILER clang-cl-15)
set(CMAKE_LINKER lld-link)

set(CMAKE_C_COMPILER_TARGET x86_64-pc-win32)
set(CMAKE_CXX_COMPILER_TARGET x86_64-pc-win32)

set(CMAKE_INSTALL_SYSTEM_RUNTIME_LIBS_NO_WARNINGS ON)

set(MSVC_PATH "/mnt/c/Program Files (x86)/Microsoft Visual Studio/2022/BuildTools/VC/Tools/MSVC/14.32.31326")
set(WINSDK_PATH "/mnt/c/Program Files (x86)/Windows Kits/10")
set(WINSDK_VER 10.0.19041.0)

# These are temporary
set(COMPILE_FLAGS
    -D_CRT_SECURE_NO_WARNINGS
    -imsvc \"${MSVC_PATH}/include\"
    -imsvc \"${WINSDK_PATH}/Include/${WINSDK_VER}/ucrt\"
    -imsvc \"${WINSDK_PATH}/Include/${WINSDK_VER}/shared\"
    -imsvc \"${WINSDK_PATH}/Include/${WINSDK_VER}/um\"
    -imsvc \"${WINSDK_PATH}/Include/${WINSDK_VER}/winrt\"
    )
string(REPLACE ";" " " COMPILE_FLAGS "${COMPILE_FLAGS}")

set(LINK_FLAGS
    -libpath:\"${MSVC_PATH}/lib/x64\"
    -libpath:\"${WINSDK_PATH}/Lib/${WINSDK_VER}/ucrt/x64\"
    -libpath:\"${WINSDK_PATH}/Lib/${WINSDK_VER}/um/x64\"
    )
string(REPLACE ";" " " LINK_FLAGS "${LINK_FLAGS}")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COMPILE_FLAGS}" CACHE STRING "")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COMPILE_FLAGS}" CACHE STRING "")
set(CMAKE_EXE_LINKER_FLAGS_INIT "${CMAKE_EXE_LINKER_FLAGS} ${LINK_FLAGS}" CACHE STRING "")
set(CMAKE_SHARED_LINKER_FLAGS_INIT "${CMAKE_SHARED_LINKER_FLAGS} ${LINK_FLAGS}" CACHE STRING "")
set(CMAKE_STATIC_LINKER_FLAGS_INIT "${CMAKE_STATIC_LINKER_FLAGS} ${LINK_FLAGS}" CACHE STRING "")
