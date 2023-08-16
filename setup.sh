#!/bin/sh

set -eu

. ./common.sh

check_for_bash() {
	printf "Checking if Bash..."
	if [ "${BASH_VERSION:-}" ]; then
		export HAS_BASH=1
		echo "yes, $BASH_VERSION"
	else
		export HAS_BASH=
		echo "no"
	fi
}

check_root()  {
	if [ "$(id -u)" -eq 0 ]; then
		export IS_ROOT=1
	else
		export IS_ROOT=
	fi
}

check_os() {
	printf "Detecting OS..."
	case "$(uname)" in
		"Darwin")
			export OS="macOS"
			;;
		"Linux")
			export OS="Linux"
			case "$(cat /etc/os-release)" in
				*Ubuntu*)
					export OS="Ubuntu $OS"
					;;
				*Alpine*)
					export OS="Alpine $OS"
					;;
			esac
			;;
	esac
	echo "$OS"
}

check_for_bash
check_os

if [ "$HAS_BASH" ]; then
	set -o pipefail
fi

if [ ! -d ~/bin ]; then
	set -x
	mkdir ~/bin || true
	{ set +x; } 2>/dev/null
fi

ask "Run platform-specific steps?" && case "$OS" in
	"macOS")
		./setup-macos.sh
		;;
	"Ubuntu Linux")
		./setup-ubuntu.sh
		;;
	"Alpine Linux")
		./setup-alpine.sh
		;;
esac

ask "Copy gitconfig?" && checked_copy .gitconfig ~/.gitconfig
ask "Copy gitattributes?" && checked_copy .gitattributes ~/.gitattributes
