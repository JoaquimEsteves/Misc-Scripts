# From: http://paulrougieux.github.io/bash.html
refactor() {
	echo "Replacing $1 by $2 in all files in this git repository."
	git grep -lz $1| xargs -0 perl -i'' -pE "s/$1/$2/g"
}
