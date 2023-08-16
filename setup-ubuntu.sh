#!/bin/sh

. ./common.sh

# ========== URLs ==========
URL_NVM='https://raw.githubusercontent.com/nvm-sh/nvm/HEAD/install.sh

install_node() {
	set -x

    echo | /bin/bash -c "$(curl -fsSL $URL_NVM)"
    (
        nvm install node
        npm install -g npm
    )
    
	{ set +x; } 2>/dev/null
 }
