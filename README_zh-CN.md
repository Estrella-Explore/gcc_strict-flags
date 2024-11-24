# **gcc_strict-flags**

> 这是一个适用于竞争性编程的启用 **最严格的编译器标志** 单文件编译脚本。

<div style="text-align:center;">
  <a href="README.md" 
     style="
       display: inline-block;
       padding: 2px 8px;
       font-size: 14px;
       color: white;
       background-color: #1d6ea3;
       border: none;
       border-radius: 4px;
       text-decoration: none;
       box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
       transition: background-color 0.3s, transform 0.2s;
     "
     onmouseover="this.style.backgroundColor='#0056b3'; this.style.transform='scale(1.05)';"
     onmouseout="this.style.backgroundColor='#007BFF'; this.style.transform='scale(1)';">
    English
  </a>
</div>

---

## **功能特点**

- 使用最严格的编译器标志编译 C++ 文件，并附加一些辅助调试标志。
- 自动检测测试样例文件（`*.in`），并将输出重定向到 `*.ans`。

---

## **使用方法**

1. **从发布页面下载 `make.sh` 文件：**
    > 您可以先把该仓库 clone 到本地，并尝试 `./demo` 文件夹下的各种示例文件。

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
   - **自动化测试：** 如果存在 `<filename>.in` 文件，脚本会提示是否将其作为 `stdin` 使用，输出将保存为 `<filename>.ans`。

---

## **运行环境要求**

- **g++：** 确保已安装支持 C++14 或更高版本的 `g++`（推荐使用 `g++` 的最新版本，目前为 `g++ 14.2.1`）。
- **Bash：** 该脚本适用于 Bash 环境（MinGW、WSL、Linux、macOS 等）。

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

## **许可证**

该项目基于 [GPLv3 许可证](./LICENCE) 进行授权。

# Star History

<a href="https://star-history.com/#estrella-explore/gcc_strict-flags&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=estrella-explore/gcc_strict-flags&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=estrella-explore/gcc_strict-flags&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=estrella-explore/gcc_strict-flags&type=Date" />
 </picture>
</a>
