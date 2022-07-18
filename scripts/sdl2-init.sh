#!/bin/bash

if [ ! -z "$1" ]; then
    printf "Creating %s\n" $1
    mkdir -p $1
    cd $1
else
    printf "Initializing current directory (%s)\n" pwd
fi

mkdir src build include assets

printf "#include <iostream>
int main(int argc, char** argv) {
    printf(\"Hello world\\n\");
    return 0;
}" > src/main.cpp
printf "Created src/main.cpp\n"

printf "cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set (CMAKE_CXX_FLAGS \"\${CMAKE_CXX_FLAGS} -m64 -g -Wall -I include\")

get_filename_component(ProjectId \${CMAKE_CURRENT_SOURCE_DIR} NAME)
string(REPLACE \" \" \"_\" ProjectId \${ProjectId})
project(\${ProjectId} VERSION 1.0)

file(GLOB_RECURSE SRC_FILES src/*.cpp)
add_executable(\${ProjectId} \${SRC_FILES})
target_include_directories(\${ProjectId} PUBLIC \${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_libraries(\${ProjectId} SDL2 SDL2main SDL2_image)\n
add_custom_target(copy_assets
    COMMAND \${CMAKE_COMMAND} -E copy_directory \${CMAKE_CURRENT_LIST_DIR}/assets \${CMAKE_CURRENT_BINARY_DIR}/assets
)
add_dependencies(\${ProjectId} copy_assets)\n" > CMakeLists.txt

printf "Created CMakeLists.txt\n"
printf "To compile, go to 'build' directory and run 'cmake ../ && make'\n"
printf "Your executable will have the same name as your directory name\n"
