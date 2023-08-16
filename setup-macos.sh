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

defaults write com.apple.dock show-recents -bool NO # Disable recent apps
killall Dock 2> /dev/null

defaults write com.apple.finder AppleShowAllFiles -bool YES # Show all files
defaults write com.apple.finder ShowPathbar -bool YES # Show the path bar
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool NO # Disable the extension change warning
killall Finder 2> /dev/null

defaults write -g AppleICUForce24HourTime -bool NO # Use 12-hour time
defaults write -g com.apple.sound.beep.feedback -bool YES # Make noise when using the volume keys
echo 'OK'

# ========== Homebrew ==========
echo -n '- Installing homebrew...'
echo | /bin/bash -c "$(curl -fsSL $URL_BREW)" > /dev/null
if [ $? -eq 0 ]; then echo 'OK'; else echo 'FAIL'; fi
