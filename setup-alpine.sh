#!/bin/sh

. ./common.sh

cat /dev/null > /etc/mot

ask "Upgrade packages" && apk upgrade -U
ask "Install util packages (vim, git, etc)" && apk add git vim neofetch
ask "Install developer packages (cmake, clang, etc)" && apk add build-base cmake clang
