#!/bin/sh

#  add-key.sh
#  XcodeTravis
#
#  Created by V2Solutions on 16/03/15.
#  Copyright (c) 2014 ___v2Tech Ventures___. All rights reserved.

# Create a custom keychain


KEY_CHAIN_NAME=ios-build.keychain
security create-keychain -p secret $KEY_CHAIN_NAME

KEY_CHAIN_PATH=~/Library/Keychains/ios-build.keychain

# Make the custom keychain default, so xcodebuild will use it for signing
security default-keychain -s $KEY_CHAIN_PATH

# Unlock the keychain
security unlock-keychain -p travis $KEY_CHAIN_PATH

# Set keychain timeout to 1 hour for long builds
# see http://www.egeek.me/2013/02/23/jenkins-and-xcode-user-interaction-is-not-allowed/
#security set-keychain-settings -t 3600 -l $KEY_CHAIN_PATH



# Add certificates to keychain and allow codesign to access them
security import "$APP_SCRIPT_PATH$APP_APPLE_CERTIFICATE" -k $KEY_CHAIN_PATH -T /usr/bin/codesign
security import "$APP_SCRIPT_PATH$APP_TEAM_AGENT_DISTRIBUTION_CERTIFICATE" -k $KEY_CHAIN_PATH -T /usr/bin/codesign
security import "$APP_SCRIPT_PATH$APP_TEAM_DISTRIBUTION_PRIVATE_KEYS" -k $KEY_CHAIN_PATH -P '' -T /usr/bin/codesign
#security import ./scripts/certs/Key.p12 -k $KEY_CHAIN_PATH -P $KEY_PASSWORD -T /usr/bin/codesign


# Put the provisioning profile in place
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp "$APP_PROFILE_PATH$PROFILE_NAME.mobileprovision" ~/Library/MobileDevice/Provisioning\ Profiles/

echo "Unlock keychain"
security unlock-keychain -p secret $KEY_CHAIN_NAME

echo "Increase keychain unlock timeout"
security set-keychain-settings -lut 7200 $KEY_CHAIN_NAME

echo "Add keychain to keychain-list"
security list-keychains -s $KEY_CHAIN_NAME
