#!/bin/bash

# `${1%.cpp}` catches the whole file name(include path), delete the suffix `.cpp`
filename=${1%.cpp}

# Remove the old `${filename}.out` if it exists.
if test -f ${filename}.out;then
    rm ${filename}.out
fi

# Remove the old `${filename}.ans` if it exists.
if test -f ${filename}.ans;then
    rm ${filename}.ans
fi

# @brief: Compile `${filename}.cpp`
# --std=c++14 is the require of CCF - China Cheating-money Foundation
# c++14 for CSP-J/S, NOIp and NOI, etc.
# E.g.: Your file name is `foo.cpp`, then your executable file name is `foo.out`.
g++ -g -Wall -Wextra -pedantic --std=c++14 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -fdiagnostics-color=always $1 -o ${filename}.out

# @brief: Receive a string as parameter, output it in blue.
# `\033[34m` sets the color to blue, \
# `\033[0m` clear all the colors
blueOutput () {
    echo -e "\033[34m${1}\033[0m"
}

# @brief: Receive a string as parameter, output it in red.
# `\033[31m` sets the color to red, \
# `\033[0m` clear all the colors
redOutput () {
    echo -e "\033[31m${1}\033[0m"
}

# @brief: read default test as `stdin`, redirect `stdout` to `${filename}.ans` .
# If found `${filename}.in`, \
# ask user if they want to use `${filename}.in` as testcase. \
# Output was been redirected to `${filename}.ans`
tryUsingDefaultTestcase() {
    if test -r ${filename}.in; then # Test if `${filename}.in` exists and readable.
        echo ""
        blueOutput "[Info]:\033[0m Testcase ${filename}.in was detected."
        echo "------> Using this testcase? [Y/n]"
        read -r operation

        if [[ "$operation" != [Nn]* ]]; then                   # If `$operation` is not "N" or "n", include empty input.
            ./${filename}.out <${filename}.in >${filename}.ans # Run program.

            blueOutput "[Info]:\033[0m Reading ${filename}.in as testcase."
            blueOutput "[Info]:\033[0m Your answer is below, which will be saved as ${filename}.ans.\n"

            cat ${filename}.ans

            blueOutput "\n[Hint]:\033[0m You can try \"diff ${filename}.ans <Standard Answer>\" to debug."
        fi
    fi
}

# ---------- Functions definitions finished ----------

# if [[ $? == 0 ]]; then
# HINT: Sometimes `g++` will return 0 even if got trouble.
if test -x ${filename}.out; then # If `${filename}.out` exists and can be executed.
    blueOutput "[Info]:\033[0m Successfully compiled $1"
    blueOutput "[Info]:\033[0m Executable file is ${filename}.out"
    tryUsingDefaultTestcase
else
    # TODO: Output the above compile informations to `${filename}.log`
    redOutput "[Error]: Got trouble in compiling...\a"
    blueOutput "[Info]:\033[0m Exiting..."
fi
