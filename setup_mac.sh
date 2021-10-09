#!/bin/bash
# ========== URLs ==========
URL_BREW='https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh'

# ========== Xcode tools ==========
echo -n '- Installing xcode tools...'
xcode-select --install > /dev/null
if [ $? -eq 0 ]; then echo 'OK'; else echo 'FAIL'; fi

# ========== Settings ==========
echo -n '- Configuring settings...'
# Use right instead of two finger-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
echo 'OK'

# ========== Homebrew ==========
echo -n '- Installing homebrew...'
echo | /bin/bash -c "$(curl -fsSL $URL_BREW)" > /dev/null
if [ $? -eq 0 ]; then echo 'OK'; else echo 'FAIL'; fi
