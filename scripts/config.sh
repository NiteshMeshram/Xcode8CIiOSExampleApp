#!/bin/sh
export APP_FULLNAME="Mobile-CI-iOS"

#DEVELOPER_NAME : must have the name appeared on the certificate used. Generally this should not be changed.
export DEVELOPER_NAME="iPhone Distribution: V2Solutions, Inc."

#APP_PROFILE_PATH : GITHUB repository relative path for the provisioning profile.
#                   Standard file already available in respective folder.
#                   DO not change until scripts or profile folder name changed.
export APP_PROFILE_PATH="$PWD/scripts/profile/"
#APP_SCRIPT_PATH : Shell script path which is referred internally. Do not change until scripts folder name changed.
export APP_SCRIPT_PATH="$PWD/scripts/certs/"


#APP_NAME : Name of the .app and .ipa file
export APP_NAME="Xcode8CIiOSExampleApp"
#APP_WORKSPACE_PATH : Relative path of the .xcworkspace file
#export APP_WORKSPACE_PATH="./Mobile-CI-iOS/Mobile-CI-iOS.xcworkspace"

export APP_WORKSPACE_PATH="Xcode8CIiOSExampleApp.xcworkspace"
#APP_SCHEME : Name of the xCode scheme. It is assume that all the scheme has the same name.
#             It is automatically suffixed by scheme (DEV/QA/UAT)
export APP_SCHEME="Xcode8CIiOSExampleApp"
#Settings For Getting Pivotal Notes : Settings For Getting Pivotal Notes
export INFOPLIST_FILE="Xcode8CIiOSExampleApp/Info.plist"
#export OPTIONSPLIST_FILE="Mobile-CI-iOS/exportOptions.plist"



export PIVOTAL_PROJECT_ID=1909739
export PIVOTAL_TOKEN='881a90e2e986a63bc867e17d25cfc5d4'
export OUTPUT_FILE_NAME='jsonresponse.text'

#DEV_HOCKEY_APP_ID : HOCKEY APP ID and Token for DEV scheme
export DEV_HOCKEY_APP_ID="8830801680884111bd108437101f6557"
export DEV_HOCKEY_APP_TOKEN="923aaca4311c4412b7758dea55020bb8"
#QA_HOCKEY_APP_ID : HOCKEY APP ID and Token for QA scheme
export QA_HOCKEY_APP_ID="2adee082f45342b186b9bc3f439f7832"
export QA_HOCKEY_APP_TOKEN="923aaca4311c4412b7758dea55020bb8"
#UAT_HOCKEY_APP_ID : HOCKEY APP ID and Token for UAT scheme
export UAT_HOCKEY_APP_ID="5726937faf0241c8a672951c00065c36"
export UAT_HOCKEY_APP_TOKEN="923aaca4311c4412b7758dea55020bb8"




#APP_APPLE_CERTIFICATE : Apple standard certificate. Do not changed until required.
export APP_APPLE_CERTIFICATE="apple.cer"

#*****************************Swift Certificates**********************

#APP_TEAM_AGENT_DISTRIBUTION_CERTIFICATE : Certificated generated from Apple portal.
#                                          Do not change until certificate is expired / regenerated
export APP_TEAM_AGENT_DISTRIBUTION_CERTIFICATE="Certificates_Swift.cer"
#APP_TEAM_DISTRIBUTION_PRIVATE_KEYS :  Private key generated using key chain. Do not change until regenerated.
export APP_TEAM_DISTRIBUTION_PRIVATE_KEYS="Key_Swift.p12"

#3. PROFILE_NAME : Certificate profile name. Generally this should not be changed
export PROFILE_NAME="Distribution_Swift"

#*****************************Swift Certificates**********************



