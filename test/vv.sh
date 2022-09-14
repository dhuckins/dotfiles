#!/bin/bash

function vv() {
	local python="python3.10"
	local directory=".venv"
	while [[ $# -gt 0 ]]; do
		case $1 in
			-d|--directory)
				directory="$(pwd)/$2"
				shift
				shift
				;;
			-p|--python)
				python="$(command -v $2)"
				shift
				shift
				;;
		esac
	done
	echo "python: $python"
    echo "directory: $directory"
}

vv "$@"