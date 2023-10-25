# shellcheck disable=2207

_bash-trash() {
	COMPREPLY=()
	local word="${COMP_WORDS[COMP_CWORD]}"

	if [[ ${COMP_CWORD} -eq 1 ]]; then
		COMPREPLY=($(compgen -W "$(bash-trash commands)" -- "${word}"))
	else
		local command="${COMP_WORDS[1]}"
		local completions="$(bash-trash completions "${command}")"
		COMPREPLY=($(compgen -W "${completions}" -- "${word}"))
	fi
}

complete -F _bash-trash bash-trash
