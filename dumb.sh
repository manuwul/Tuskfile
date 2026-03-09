#!/usr/bin/env bash
# ========================= SHELL CONFIG =========================
set -euo pipefail
shopt -s inherit_errexit 2>/dev/null || true


# ========================= SCRIPT CONFIG =========================
TIMEFORMAT="Task completed in %3lR"
COMMENT_LEFT=": '"
COMMENT_RIGHT="'"


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
		printf "\t%d) \e[38;5;165m%-12s\e[0m \e[38;5;229m%s\e[0m\n" "$i" "$func_name" "$body"
		((i++)) || true
	done
}


# ========================= TASK EXECUTION =========================
task=${1:-help}
shift || true

if (! declare -F "$task" >/dev/null); then
    echo -e "\e[38;5;196mUnknown task: $task\e[0m\n"
    help
    exit 1
fi

time $task "$@"
