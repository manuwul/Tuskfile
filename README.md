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
default() {
	log help
}
```

### Change or disable colors (and other text decorations)
`NO_COLOR=1 Tuskfile my_task`

### Disable logs
`NO_LOG=1 Tuskfile my_task`

### Change time and ignore format
```bash
IGNOREFORMAT=(
	"_*"
	"log"
	"default"
)

TIMEFORMAT="Task completed in %3lR"
```

# Compatibility
Pretty sure it is compatible with bash 3.x and if you manage to install bash on Windows via cygwin it might work there too.

# Inspiration
This script is heavily inspired by `adriancooney/Taskfile` and fork `polyrand/Taskfile`
