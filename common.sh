#!/bin/sh

ask() {
	printf "%s " "$1"
	read -r reply
	case "$reply" in
		"Y")
			return 0
			;;
		"y")
			return 0
			;;
		*)
			return 1
			;;
	esac
}
