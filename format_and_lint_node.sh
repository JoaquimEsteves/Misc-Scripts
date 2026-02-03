#!/bin/bash

function prettier_and_eslint() {
	npx prettier --write "$1"
	eslint_d --cache "$1" && echo 'ESLINT OK'
}

function entrFind() {
	echo 'Looking for all JS/JSX files'
	fdfind -e js -e jsx -x echo {} | entr -s -p -c 'npx prettier --write $0; eslint_d --cache $0'
}


function entrEslint() {
	echo 'Looking for all JS/JSX files'
	fdfind -e js -e jsx -x echo {} | entr -s -p -c 'eslint_d --cache $0'
}

function entrPrettier() {
	fdfind -e js -e jsx -x echo {} | entr -s -p -c 'npx prettier --write $0'
}

function prettyEverything() {
	fdfind -e js -e jsx -x npx prettier --write ./{}
}

# This file is a modulino! Meaning that it'll do something different depending
# on whether you import it, or run it directly
# Use entr or a similar program to watch for changes in your code
# $ fd -e js -e jsx -x echo {} | entr -c -p ./format_and_lint.sh /_
if [[ "${BASH_SOURCE[0]}" = "${0}" ]]; then
	echo 'running eslint...'
	eslint_d src
	entrFind
fi
