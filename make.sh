#!/bin/bash

filename=${1%.cpp}
# `${1%.cpp}.out` catches file name, delete the suffix `.cpp`, then \
# set the executable file name into `foo.out`.

g++ -g -Wall -Wextra -pedantic --std=c++14 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -fdiagnostics-color=always $1 -o ${filename}.out
# --std=c++14 is the require of CCF - China Cheating-money Foundation
# c++14 for CSP-J/S, NOIp and NOI, etc.

# E.g.: Your file name is `foo.cpp`, then your executable file name is `foo.out`.

tryUsingDefaultTestcase() {
    if test -w ${filename}.in; then
        echo ""
        echo "[Info]: Testcase ${1%.cpp}.in was detected."
        echo "------> Using this testcase? [Y/n]"
        read -r operation

        if [[ "$operation" != [Nn]* ]]; then
            ${filename}.out <${filename}.in >${filename}.ans
            echo "[Info]: Using ${filename}.out as testcase"
            echo "[Info]: Your answer is ${filename}.ans"
            echo -e "\n[Hint]: You can try \"diff ${filename}.ans <Standard Answer>\" to debug"
        fi
    fi
}

if [[ $? == 0 ]]; then
    echo "[Info]: Successfully compiled $1"
    echo "[Info]: Executable file is ${filename}.out"
    tryUsingDefaultTestcase
else
    echo "[Error]: Got trouble in compiling..."
    echo "[Info]: Exiting..."
fi
