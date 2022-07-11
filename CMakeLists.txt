cmake_minimum_required(VERSION 3.20)

include(FetchContent)

project(wslsdlexample
        VERSION 1.0.0
        DESCRIPTION "A small example demoing Clang cross-compilation on WSL"
        HOMEPAGE_URL "https://github.com/blami/wslsdlexample"
        LANGUAGES CXX)

set_property(GLOBAL PROPERTY CXX_STANDARD 20)
set_property(GLOBAL PROPERTY CXX_STANDARD_REQUIRED ON)
set_property(GLOBAL PROPERTY CMAKE_CXX_EXTENSIONS OFF)

set(FETCHCONTENT_QUIET OFF)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(VERBOSE ON)

set(SDL_SHARED OFF CACHE INTERNAL "")
set(SDL_TEST OFF CACHE INTERNAL "")
set(SDL_MMX OFF CACHE INTERNAL "")
FetchContent_Declare(
    sdl
    GIT_REPOSITORY https://github.com/libsdl-org/SDL.git
    GIT_TAG release-2.0.22
    GIT_SHALLOW ON
    )
FetchContent_MakeAvailable(sdl)

add_executable(${PROJECT_NAME} ${PROJECT_NAME}.cpp)
target_include_directories(${PROJECT_NAME} PRIVATE ${sdl_SOURCE_DIR}/include)
# TODO: Figure out if this can be done better without passing SDL2 libs
# directly
# TODO: See why SDL2 does not include lib references bellow in static lib
target_link_libraries(${PROJECT_NAME}
    ${sdl_BINARY_DIR}/SDL2d.lib ${sdl_BINARY_DIR}/SDL2maind.lib
    setupapi.lib
    winmm.lib
    imm32.lib
    version.lib
    )

