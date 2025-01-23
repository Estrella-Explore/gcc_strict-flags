# **gcc_strict-flags**

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/e96d8a94cfce436aa957c8fe416c9e77)](https://app.codacy.com/gh/Estrella-Explore/gcc_strict-flags/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

> [!Overview]
> This is a single file compile script which enables the **STRICTEST compiler flags** for competitive programming. 🚀 

<div align="center">
  English 
  <a href="README_zh-CN.md"
     style="
       display: inline-block;
       padding: 5px 12px;
       font-size: 14px;
       color: white;
       background-color: #d3445e;
       border-radius: 4px;
       text-decoration: none;
     ">
    简体中文
  </a>
</div>

---

## **Features**

- Compiles C++ files with strictest flags ever and some assist debugging flags.
- Detects test case files (`*.in`) and automatically redirects output to `*.ans`.

---

## **Usage**

1. **Download `make.sh` from [release](https://github.com/Estrella-Explore/gcc_strict-flags/releases):**

    > You may clone this repo and try the demos first.
    
    You could also download the latest version via `curl`:
    ```bash
    curl -O https://raw.githubusercontent.com/Estrella-Explore/gcc_strict-flags/main/make.sh
    ```

2. **Installation**

    ```bash
    chmod +x ./make.sh
    sudo cp ./make.sh /usr/bin/fkccf
    ```

3. **Run the script with your C++ file:**

   ```bash
   fkccf <your_file.cpp>
   ```

4. **Key functionalities:**
   - **Compilation:** The script compiles the provided C++ file and generates an executable (`*.out`).
   - **Automatical test:** If `<filename>.in` exists, you will be prompted to use it as `stdin`. Output is saved as `<filename>.ans`.

---

## **Requirements**

- **g++:** Ensure `g++` is installed with support for C++14 or later.
- **Bash:** The script is written for Bash environments (Linux, macOS, WSL, Git Bash, etc.).

---

## **Example Workflow**

Given a file `example.cpp`:

1. Run the script:
   ```bash
   fkccf example.cpp
   ```

2. If `example.in` exists, the script prompts:
   ```text
   [Info]: Test case example.in detected.
   ------> Use this test case as stdin? [Y/n]
   ```

3. If confirmed, output is saved in `example.ans` and displayed in the terminal.

---

## **License**

This repo is licensed under the [GPLv3 License](./LICENCE).  


## Star History

<a href="https://star-history.com/#estrella-explore/gcc_strict-flags&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=estrella-explore/gcc_strict-flags&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=estrella-explore/gcc_strict-flags&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=estrella-explore/gcc_strict-flags&type=Date" />
 </picture>
</a>
