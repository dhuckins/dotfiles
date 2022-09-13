#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

cd "$(dirname "${BASH_SOURCE[0]}")";

git pull origin main;

function _sync() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE" \
		-avh --no-perms . ~;
    # shellcheck source=/dev/null
	source ~/.zshrc;
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
	_sync;
else
	read -r -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		_sync;
	fi;
fi;
unset _sync;
