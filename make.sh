#!/bin/bash
g++ -g -Wall -Wextra -pedantic --std=c++14 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -fdiagnostics-color=always $1 -o ${1%.cpp}.out
# --std=c++14 is the require of CCF - China Cheating-money Foundation
# c++14 for CSP-J/S, NOIp and NOI, etc.

# `-o ${1%.cpp}.out` catches file name, delete the suffix `.cpp`, then \
# set the executable file name into `foo.out`.
# E.g.: Your file name is `foo.cpp`, then your executable file name is `foo.out`.
