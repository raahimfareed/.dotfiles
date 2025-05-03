#!/bin/bash

if [ ! -z "$1" ]; then
    printf "Creating %s\n" $1
    mkdir -p $1
    cd $1
else
    printf "Initializing current directory (%s)\n" pwd
fi

mkdir src build include assets

if [ ! -f "src/main.cpp" ]; then
    printf "#include <iostream>
int main(int argc, char** argv) {
    std::cout << \"Hello World\" << std::endl;
    return 0;
}" > src/main.cpp
    printf "Created src/main.cpp\n"
fi

printf "cmake_minimum_required(VERSION 3.10)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set (CMAKE_CXX_FLAGS \"\${CMAKE_CXX_FLAGS} -m64 -I include\")

get_filename_component(ProjectId \${CMAKE_CURRENT_SOURCE_DIR} NAME)
string(REPLACE \" \" \"_\" ProjectId \${ProjectId})
project(\${ProjectId} VERSION 1.0)

file(GLOB_RECURSE SRC_FILES src/*.cpp)
add_executable(\${ProjectId} \${SRC_FILES})
target_include_directories(\${ProjectId} PUBLIC \${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_libraries(\${ProjectId} SDL2 SDL2main SDL2_image SDL2_ttf SDL2_mixer SDL2_net)\n
add_custom_target(copy_assets
    COMMAND \${CMAKE_COMMAND} -E copy_directory \${CMAKE_CURRENT_LIST_DIR}/assets \${CMAKE_CURRENT_BINARY_DIR}/assets
)
add_dependencies(\${ProjectId} copy_assets)\n" > CMakeLists.txt
printf "Created CMakeLists.txt\n"


printf "build" > .gitignore
printf "Created .gitignore\n"

printf "# SDL2\n" > README.md
printf "Created README.md\n"

git init
printf "Initialized a git repository\n"

git branch -m main
printf "Changed branch to main\n"

git add .
printf "Added files to git\n"

git commit -m "Initial commit"
printf "Committed files to git\n"

printf "To compile, go to 'build' directory and run 'cmake ../ && make'\n"
printf "Your executable will have the same name as your directory name\n"
