# Tuskfile
Simple bash task runner script to replace Makefile.

# Usage
Just clone Tuskfile to project directory and run it! You will figure out the rest.

# Functionality

## You can:

### Create task with comment
```bash
my_task() { : 'Does something'
    do_a_flip
    ...
}
```

### Log commands
```bash
another_task() {
    log foo bar buzz
    log echo "Log me!"
}
```

### Get automatic help
`Tuskfile help`

### Set default task
```bash
# ========================= TASK EXECUTION =========================
task=${1:-default_task}
```

### Change or disable colors (and other text decorations)
`NO_COLOR=1 Tuskfile my_task`

```bash
if [[ -t 1 ]] && [[ -z "${NO_COLOR:-}" ]]; then
    COLOR_RESET="\033[0m"
	COLOR_ERROR="my ansi escape color sequence"
	COLOR_FUNCTION="my ansi escape color sequence"
	COLOR_COMMENT="my ansi escape color sequence"
	COLOR_LOG="my ansi escape color sequence"
else
    COLOR_RESET=""
    COLOR_ERROR=""
    COLOR_FUNCTION=""
    COLOR_COMMENT=""
    COLOR_LOG=""
fi
```

### Change time, comment and log format
```bash
TIMEFORMAT="Task completed in %3lR"
COMMENT_LEFT=": '"
COMMENT_RIGHT="'" # comment format < : 'My comment' >
LOGFORMAT="${COLOR_LOG}+ @${COLOR_RESET}" # log format: + command "arg 1" arg2
```

# Compatibility
Pretty sure it is compatible with bash 3.x and if you manage to install bash on Windows via cygwin it might work there too.

# Inspiration
This script is heavily inspired by `adriancooney/Taskfile` and fork `polyrand/Taskfile`
