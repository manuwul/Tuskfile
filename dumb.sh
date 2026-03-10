#!/usr/bin/env bash
# ========================= SHELL CONFIG =========================
set -euo pipefail
shopt -s inherit_errexit 2>/dev/null || true


# ========================= SCRIPT CONFIG =========================
TIMEFORMAT="Task completed in %3lR"
COMMENT_LEFT=": '"
COMMENT_RIGHT="'"
COLOR_RESET="\e[0m"
COLOR_ERROR="\e[38;5;196m"
COLOR_FUNCTION="\e[38;5;165m"
COLOR_COMMENT="\e[38;5;229m"

# ========================= YOUR TASKS =========================
_maybe() { : 'Hidden function'
	return -1
}

coin_toss() { : '
	Returns -1 or 1 (almost) randomly
	!!!MULTILINE COMMENT!!!
'
	_maybe
}

hello() { : 'Greets first argument'
	echo "Hello, ${1:-World}!"
}


# ========================= HELP FUNCTION =========================
help() { : 'Prints this help message'
	echo "Usage: $0 <task> <args>"
	echo "Tasks:"

	local i=1
	for func_name in $(compgen -A function); do
		[[ "$func_name" == _* ]] && continue
		local body=$(declare -f "$func_name")
		[[ $body != *"$COMMENT_LEFT"*"$COMMENT_RIGHT"* ]] && body=""
		body="${body#*$COMMENT_LEFT}"
		body="${body%%$COMMENT_RIGHT*}"
		printf "\t%d) $COLOR_FUNCTION%-12s$COLOR_RESET $COLOR_COMMENT%s$COLOR_RESET\n" "$i" "$func_name" "$body"
		((i++)) || true
	done
}


# ========================= TASK EXECUTION =========================
task=${1:-help}
shift || true

if (! declare -F "$task" >/dev/null); then
	echo -en "$COLOR_ERROR"
	echo -n "Unknown task: $task"
	echo -e "$COLOR_RESET"
    help
    exit 1
fi

time $task "$@"
