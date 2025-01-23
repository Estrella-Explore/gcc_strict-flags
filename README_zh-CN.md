# **gcc_strict-flags**

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/e96d8a94cfce436aa957c8fe416c9e77)](https://app.codacy.com/gh/Estrella-Explore/gcc_strict-flags/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)

> [!TIP]
> 这是一个为竞争性编程领域（如：OI、ACM）设计的启用 **最严格的编译参数** 的单文件编译脚本。 🚀 

<div align="center">
  <a href="README.md"
     style="
       display: inline-block;
       padding: 5px 12px;
       font-size: 14px;
       color: white;
       background-color: #007bff;
       border-radius: 4px;
       text-decoration: none;
       ">
    English</a>
  &nbsp|&nbsp 简体中文
</div>

---

## **功能特点**

- 使用最严格的编译参数编译 C++ 文件，并附加一些辅助调试标志。
- 自动检测测试样例文件（`*.in`），并将输出重定向到 `*.ans`。

---

## **使用方法**

1. **从[发布页面](https://github.com/Estrella-Explore/gcc_strict-flags/releases)下载 `make.sh` 文件：**

    > 您可以先把该仓库 clone 到本地，并尝试 `./demo` 文件夹下的各种示例文件。
    
    你也可以用 `curl` 直接下载最新版的文件：
    ```bash
    curl -O https://raw.githubusercontent.com/Estrella-Explore/gcc_strict-flags/main/make.sh
    ```

2. **安装方法**

    ```bash
    chmod +x ./make.sh
    sudo cp ./make.sh /usr/bin/fkccf
    ```

3. **使用 C++ 文件运行脚本：**

   ```bash
   fkccf <your_file.cpp>
   ```

4. **功能：**
   - **编译：** 脚本将编译提供的 C++ 文件并生成可执行文件（`*.out`）。
   - **自动化测试：** 如果存在 `<filename>.in` 文件，脚本会提示是否将其作为标准输入提供给你的程序，并将输出保存为 `<filename>.ans`。

---

## **运行环境要求**

- **g++：** 确保已安装支持 C++14 或更高版本的 `g++`（推荐使用 `g++` 的最新版本，目前为 `g++ 14.2.1`）。\
      注：在 Windows 下你可以选择 MinGW 或者 CygWin。
- **Bash：** 该脚本适用于 Bash 环境（Linux、macOS、WSL、Git Bash 等）。

---

## **示例用法**

假设有一个文件 `example.cpp`：

1. 运行脚本：
   ```bash
   fkccf example.cpp
   ```

2. 如果存在 `example.in` 文件，脚本会提示：
   ```text
   [Info]: Test case example.in detected.
   ------> Use this test case as stdin? [Y/n]
   ```

3. 如果输入 `y` 或者直接按下 `Enter`，程序会把 `example.in` 作为输入文件，而输出将保存到 `example.ans` 并显示在终端中。

---

## **许可协议**

该项目基于 [GPLv3 许可证](./LICENCE) 进行授权。

## Star 历史

<a href="https://star-history.com/#estrella-explore/gcc_strict-flags&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=estrella-explore/gcc_strict-flags&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=estrella-explore/gcc_strict-flags&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=estrella-explore/gcc_strict-flags&type=Date" />
 </picture>
</a>
