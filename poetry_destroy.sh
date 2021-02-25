#!/bin/bash
poetry-destroy () {
	local venv
	if ! venv=$(poetry env list -n --no-ansi 2>/dev/null | \
		awk '{ print $1; exit }')  || [[ -z "$venv" ]]
	then
		echo "Failed to determine poetry env name"
		return 1
	fi
	poetry env remove "$venv"
}


poetry-destroy
