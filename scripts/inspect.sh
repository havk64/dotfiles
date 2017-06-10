#!/usr/bin/env bash
# Gather several different kinds of info about a given command

usage()
{
	echo "Usage: $(basename $0) <command>"
	exit 1
}

[[ $# -ne 1 ]] && usage

cmd_path=$(which "$1")

file "$cmd_path"
stat "$cmd_path"

echo -n "Display more info? (Options: {edit, man, info} or "q" to quit) "
read answer

case $answer in
	edit)
		${EDITOR-vim} "$cmd_path"
		;;
	man)
		man "$1"
		;;
	info)
		info "$1"
		;;
	q)
		exit 0
		;;
	*)
		usage
		;;
esac

# builtin `echo ${0##*/} | tr \[:upper:] \[:lower:]` ${1+"$@"}

