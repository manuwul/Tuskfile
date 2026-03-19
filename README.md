# Tuskfile
Simple bash task runner script to replace Makefile

# How to

## add new task?
Just add function in `TASKS` section. It will be automatically shown in help

```bash
my_task() {
    echo "Hello, World!"
}
```

## log function execution?
Just call `log` function. You may also want to set `FANCY_LOG=1` before starting task

```bash
my_task() { : "Optional function description"
    log echo "Hello, World!"
}
```

`FANCY_LOG` makes logs ... well, _fancy_  

Normal logs from `./Tuskfile log first`
```
+ first
  + second a
    + third b
      + fourth "Hello world"
    + third_ c
  + third
    + fourth "Hello world"
```

_FaNcY_ logs from `FANCY_LOG=1 ./Tuskfile log first`. Only works in when not piped or redirected, though
```
first
┣━second a
┃ ┣━third b
┃ ┃ ┗━fourth "Hello world"
┃ ┗━third_ c
┗━third
  ┗━fourth "Hello world"
```

If you don't want logs at all, just add `NO_LOG=1` befor starting task

You can also change log format by editing (no way!) `LOGFORMAT`, but such customization is very limited  
Example: removed indent, changed `+` to `~>`
```bash
LOGFORMAT="%.s~> %s"
```

```
~> first
~> second a
~> third b
~> fourth "Hello world"
~> third_ c
~> third
~> fourth "Hello world"
```

## make hidden function?
Just add _underscore or add your function to `IGNOREFORMAT`

```bash
IGNOREFORMAT=(
    "_*"
    "log"
    "default"
    "my_func"
)

# OR

_my_func() {
    echo "Hello, World!"
}
```

## change colo(u)rs?
Just change `COLOR_*` in code. Colo(u)rs are simply [ANSI ESCAPE SEQUENCES](https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797) (fnky/ANSI.md)  
Colo(u)rs are disabled when piped or disabled or `NO_COLOR` is set (like `NO_LOG`)

# Compatibility
Tested with bash:
- 5.3.9
- 5.2.37 Git Bash on Windows 10
- 3.2.57
(TODO: check for older bash)

# Inspiration
This script is heavily inspired by `adriancooney/Taskfile` and fork `polyrand/Taskfile`
