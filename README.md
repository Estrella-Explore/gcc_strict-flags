# Description

> This is a single file compile script which enables the **STRICTEST compiler flags** for OIers.

# How to use

```bash
sh make.sh demo/foo.cpp
```

The executable program `foo.out` is in the same directory as your source code file.

# News

- User-friendly prompts.

- If test case `foo.in` was found, you can pass it as `stdin` to your program.\
  Your answer will be output, and be saved as `foo.ans` by default.

# Tips

1. You can name your test case `foo.in` and put it in the same directory as `foo.cpp` and enjoy easy input!

2. Don't want to type choices? \
   Just keep it **_empty_** and press `Enter` to use default choice.

3. `sh make.sh foo.cpp` is too loooooong? \
   Rename `make.sh` as your favourite name `fkccf.sh`, and copy it to `/usr/bin/`. \
   Once you restart your terminal, you can enjoy `fkccf foo.cpp` in any directory you want!
