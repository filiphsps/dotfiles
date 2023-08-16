#!/bin/sh

. ./common.sh

if [ ! "$IS_ROOT" ]; then
    SUDO="sudo"
else
    SUDO=""
fi

# resources
URL_NVM='https://raw.githubusercontent.com/nvm-sh/nvm/HEAD/install.sh'

# utils
install_node() {
    echo | /bin/bash -c "$(curl -fsSL $URL_NVM)" > /dev/null
    (
        # TODO: Load nvm
        nvm install node > /dev/null
        npm install -g npm > /dev/null
    )
}
install_flatpack() {
    echo "TODO"
}
remove_snap() {
    echo "TODO"
}

ask "Install node (latest)" && install_node
ask "Remove snap" && remove_snap
ask "Install flatpack" && install_flatpack
