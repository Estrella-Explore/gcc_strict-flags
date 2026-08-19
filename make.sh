#!/bin/bash

# `${1%.cpp}` extracts the file name (including path) by removing the `.cpp` suffix.
filename="${1%.cpp}"

# Definitions for colors
BLUE="\033[34m"
RED="\033[31m"
RESET="\033[0m"

# @brief: Outputs the provided string in blue.
# `\033[34m` sets the color to blue.
# `\033[0m` resets the text color to default.
blueOutput() {
    echo -e "${BLUE}${1}${RESET}"
}

# @brief: Outputs the provided string in red.
# `\033[31m` sets the color to red.
# `\033[0m` resets the text color to default.
redOutput() {
    echo -e "${RED}${1}${RESET}"
}

# @brief: Reads the default test case as `stdin` and redirects `stdout` to `${filename}.ans`.
# If `${filename}.in` exists, prompts the user to use it as the test case.
tryUsingDefaultTestcase() {
    if [[ -r ${filename}.in ]]; then # Checks if `${filename}.in` exists and is readable.
        echo ""
        blueOutput "[Info]:${RESET} Test case ${filename}.in detected."
        echo "------> Use this test case as stdin? [Y/n]"
        read -r operation

        if [[ "$operation" != [Nn]* ]]; then # Proceed if the user input is not "N" or "n".
            blueOutput "[Info]:${RESET} Using ${filename}.in as the test case."

            # Run the program once, splitting the output cleanly:
            #   - stdout -> inner `tee .ans`: saved to .ans (for diff / CI) and
            #     forwarded to the outer pipe;
            #   - the group's stderr (`2>&1`) is merged with the forwarded
            #     stdout into ONE real-time stream;
            #   - outer `tee -a .log`: shown live on the terminal and appended
            #     to .log, so the log records stdout + stderr exactly as shown.
            # No process substitution is used (avoids the bash `2> >(tee ...)`
            # bug that leaks stderr into the stdout target).
            { "./${filename}.out" < "${filename}.in" | tee "${filename}.ans"; } 2>&1 | tee -a "${filename}.log"

            blueOutput "[Info]:${RESET} Output is shown below and saved as ${filename}.ans.\n"

            cat "${filename}.ans"

            blueOutput "\n[Hint]:${RESET} You can use \"diff ${filename}.ans <Standard Answer>\" to compare with the expected output."
        fi
    fi
}

# @brief: Removes old files if they exist.
# Deletes `${filename}.out`, `${filename}.ans`, and `${filename}.log`.
initCleanup() {
    # Remove the old `${filename}.out` if it exists.
    if [[ -f "${filename}.out" ]]; then
        rm "${filename}.out"
    fi

    # Remove the old `${filename}.ans` if it exists.
    if [[ -f "${filename}.ans" ]]; then
        rm "${filename}.ans"
    fi

    # Remove the old `${filename}.log` if it exists.
    if [[ -f "${filename}.log" ]]; then
        rm "${filename}.log"
    fi
}

# @brief: Removes empty files if they exist.
# Specifically checks `${filename}.ans` and `${filename}.log`.
cleanupEmptyFiles() {
    # Check if the `.ans` file exists and is empty.
    if [[ -f "${filename}.ans" && ! -s "${filename}.ans" ]]; then
        rm "${filename}.ans"
    fi

    # Check if the `.log` file exists and is empty.
    if [[ -f "${filename}.log" && ! -s "${filename}.log" ]]; then
        rm "${filename}.log"
    fi
}

# ---------- Function definitions complete ----------

initCleanup

# @brief: Makes a pipeline's exit status reflect the last command that failed.
# Without `pipefail`, a pipeline only reports the exit status of its last
# command (`tee`, which always succeeds), so a failed `g++` would go unnoticed.
# With it, `$?` correctly reports g++'s failure instead.
set -o pipefail

# @brief: Compiles `${filename}.cpp` using `g++` with detailed warnings and debugging flags.
# --std=c++14 is the require of CCF - China Cheating-money Foundation
# c++14 for CSP-J/S, NOIp and NOI, etc.
#
# The compile output is piped through `tee`:
#   - stdout of `tee` reaches the terminal, showing the colored diagnostics
#     from `-fdiagnostics-color=always`. This works with or without a tty, so
#     it is GitHub Actions friendly - no `/dev/tty` needed.
#   - the process substitution `>(sed ...)` strips ANSI escape codes and saves
#     plain text to `${filename}.log`.
# If successful, the output executable is named `${filename}.out`.
g++ -g -Wall -Wextra -pedantic --std=c++14 -Og \
    -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 \
    -Wduplicated-cond -Wcast-qual -Wcast-align -Wnoexcept -Winline -Wdouble-promotion \
    -fsanitize=undefined -fsanitize=address -fanalyzer \
    -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC \
    -fdiagnostics-color=always \
    "$1" -o "${filename}.out" 2>&1 \
    | tee >(sed "s/\x1B\[[0-9;]*[a-zA-Z]//g" > "${filename}.log")

# Check if the output file was successfully created and is executable.
if [[ -x "${filename}.out" ]]; then 
    blueOutput "[Info]:${RESET} Compilation of $1 succeeded."
    blueOutput "[Info]:${RESET} Executable file: ${filename}.out"
    tryUsingDefaultTestcase
else
    redOutput "[Error]: Compilation failed.\a"
    blueOutput "[Info]:${RESET} Check '${filename}.log' for details."
fi

cleanupEmptyFiles

exit
