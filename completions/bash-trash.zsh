if [[ ! -o interactive ]]; then
	return
fi

compctl -K _bash-trash bash-trash

_bash-trash() {
	local word words completions
	read -cA words
	word="${words[2]}"

	if [ "${#words}" -eq 2 ]; then
		completions="$(bash-trash commands)"
	else
		completions="$(bash-trash completions "${word}")"
	fi

	reply=("${(ps:\n:)completions}")
}
