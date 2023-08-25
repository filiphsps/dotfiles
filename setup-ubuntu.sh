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
remove_snap() {
    echo "TODO"
}
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
install_git() {
    
}
configure_git() {
    git config --global init.defaultBranch
}

ask "Remove snap" && remove_snap
ask "Install node (latest)" && install_node
ask "Install flatpack" && install_flatpack
ask "Install git" && install_git
ask "Configure git" && configure_git
