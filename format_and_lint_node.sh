#!/bin/bash

function prettier_and_eslint() {
	npx prettier --write "$1"
	npx eslint --cache "$1" && echo 'ESLINT OK'
}

function entrFind() {
	fdfind -e js -e jsx -x echo {} | entr -s -p -c 'npx prettier --write $0; npx eslint --cache $0'
}

# Use entr or a similar program to watch for changes in your code
# $ fd -e js -e jsx -x echo {} | entr -c -p ./format_and_lint.sh /_
if [[ "${BASH_SOURCE[0]}" = "${0}" ]]; then
	echo 'running eslint...'
	npx eslint src
	entrFind
fi
