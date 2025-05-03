#! /usr/bin/env sh

cpp_code="#include <bits/stdc++.h>

using namespace std;

int main() {
    printf(\"Hello, World!\\n\");
    return 1;
}
"

if [ ! -z "$1" ]
then
    if [ ! -z "$2" ] && [ "-f" = "$2" ]
    then
        printf "Creating a file %s\n" "$1.cpp"
        touch "$1.cpp"
        printf "%s" "$cpp_code" > "$1.cpp"
        printf "Created file %s\n" $1
        exit 1
    fi

    mkdir $1
    cd $1
    touch main.cpp
    printf "%s" "$cpp_code" > main.cpp

    exit 1
fi

printf "Using C++ format to setup!"
mkdir $(date -d "$(date)" +%Y%m%d)
cd $(date -d "$(date)" +%Y%m%d)
touch main.cpp
printf "%s" "$cpp_code" > main.cpp


