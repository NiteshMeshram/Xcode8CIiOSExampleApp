#!/bin/sh
# sign-and-upload.sh
# XcodeTravis
#
# Created by V2Solutions on 16/03/15.
# Copyright (c) 2014 ___v2Tech Ventures___. All rights reserved.
# http://www.objc.io/issue-6/travis-ci.html


# APP_BUILD_ENV : To configure the build scheme environment for defining the app build path
APP_BUILD_ENV=""

# HOCKEY_APP_ID & HOCKEY_APP_TOKEN : To configure the Hockey App Id and Token for uploading the build
HOCKEY_APP_TOKEN=""
HOCKEY_APP_ID=""
export OUTPUT_FILE_NAME='./release_notes/V2 - LT - MyLendingTree - iOS-'
export LABEL_ID=''
export ALL_STORIES_WITH_ID=''

## Condition which defines the Build Env used and based on that selection of the Hockey App Id and Hockey App token
##if ([ "$TRAVIS_BRANCH"  = "develop" ]); then
#if ([ "$TRAVIS_BRANCH"  = "133580663-Travis_Integration_R_D_confi__" ]); then
#    APP_BUILD_ENV=DEV;
#    HOCKEY_APP_ID=$DEV_HOCKEY_APP_ID;
#    HOCKEY_APP_TOKEN=$DEV_HOCKEY_APP_TOKEN;
#    echo "DEV Scheme Selected.";
#elif ([ "$TRAVIS_BRANCH" = "QA" ]); then
#    APP_BUILD_ENV=QA;
#    HOCKEY_APP_ID=$QA_HOCKEY_APP_ID;
#    HOCKEY_APP_TOKEN=$QA_HOCKEY_APP_TOKEN;
#    echo "QA Scheme Selected.";
#elif ([ "$TRAVIS_BRANCH" = "master" ]); then
#    APP_BUILD_ENV=UAT;
#    HOCKEY_APP_ID=$UAT_HOCKEY_APP_ID;
#    HOCKEY_APP_TOKEN=$UAT_HOCKEY_APP_TOKEN;
#    echo "UAT Scheme Selected.";
#else
#    echo "No deployment will be done."
#    exit 0
#fi

# PROVISIONING_PROFILE : Provition profile selction
PROVISIONING_PROFILE="$HOME/Library/MobileDevice/Provisioning Profiles/$PROFILE_NAME.mobileprovision"

# OUTPUTDIR: App build path
OUTPUTDIR="$PWD/build/Release-iphoneos"

echo "***************************"
echo "* Signing *"
echo "***************************"

# command to package the appliacation and create the .ipa file
#xcrun -log -sdk iphoneos PackageApplication "$OUTPUTDIR/$APP_NAME.app" -o "$OUTPUTDIR/$APP_NAME.ipa" -sign "$DEVELOPER_NAME" -embed "$PROVISIONING_PROFILE"



#xcodebuild -scheme Xcode8CIiOSExampleApp -workspace Xcode8CIiOSExampleApp.xcworkspace clean archive -archivePath "$OUTPUTDIR"
#xcodebuild -exportArchive -exportFormat ipa -archivePath "$OUTPUTDIR/Xcode8CIiOSExampleApp.xcarchive" -exportPath "$OUTPUTDIR/Xcode8CIiOSExampleApp.ipa" -exportProvisioningProfile "$PROVISIONING_PROFILE"

xcodebuild -workspace Xcode8CIiOSExampleApp.xcworkspace -scheme Xcode8CIiOSExampleApp -sdk iphoneos -configuration AppStoreDistribution archive -archivePath $PWD/build/Xcode8CIiOSExampleApp.xcarchive

xcodebuild -exportArchive -archivePath $PWD/build/Xcode8CIiOSExampleApp.xcarchive -exportOptionsPlist Xcode8CIiOSExampleApp/exportOptionsPlist.plist -exportPath $PWD/build


echo "Output PWD"
ls $PWD/build

#/Users/nitesh.meshram/Documents/v2Apps/Xcode8CIiOSExampleApp/Xcode8CIiOSExampleApp/exportOptionsPlist.plist


#export INFOPLIST_FILE="Xcode8CIiOSExampleApp/exportOptionsPlist.plist"

####Suggested by Jeff #############

#xcodebuild -project "$APP_WORKSPACE_PATH" -scheme "$APP_SCHEME.$APP_BUILD_ENV" -sdk iphoneos -configuration AppStoreDistribution archive -archivePath "$PWD/build/$APP_SCHEME.$APP_BUILD_ENV.xcarchive"

#xcodebuild -exportArchive -archivePath "$PWD/build/$APP_SCHEME.$APP_BUILD_ENV.xcarchive" -exportOptionsPlist "$OPTIONSPLIST_FILE" -exportPath "$OUTPUTDIR/$APP_NAME.ipa"

#######Suggested by Jeff###########



#xcodebuild clean -project "$APP_WORKSPACE_PATH" -scheme "$APP_SCHEME.$APP_BUILD_ENV" -sdk iphoneos -configuration "$APP_BUILD_ENV"
#
#xcodebuild -project "$APP_WORKSPACE_PATH" -scheme "$APP_SCHEME.$APP_BUILD_ENV" -archivePath "$PWD/build/$APP_SCHEME.$APP_BUILD_ENV.xcarchive" archive
#
#xcodebuild -verbose  -exportArchive -archivePath "$PWD/build/$APP_SCHEME.$APP_BUILD_ENV.xcarchive" -exportOptionsPlist "$OPTIONSPLIST_FILE" -configuration "$APP_BUILD_ENV" -exportPath build DEPLOYMENT_POSTPROCESSING=YES STRIP_INSTALLED_PRODUCT=YES SEPARATE_STRIP=YES COPY_PHASE_STRIP=YES EMBEDDED_CONTENT_CONTAINS_SWIFT=NO RETAIN_RAW_BINARIES=NO


#In Xcode8, xcrun PackageApplication is deplecated, so I was successful with the use of this way.

#archive
#xcodebuild -sdk iphoneos10.0 -project "$APP_WORKSPACE_PATH" -scheme "$APP_SCHEME.$APP_BUILD_ENV" -configuration "$APP_BUILD_ENV" build -archivePath "$PWD/build/$APP_SCHEME.$APP_BUILD_ENV.xcarchive" archive

#export ipa
#xcodebuild -exportArchive -archivePath "$PWD/build/$APP_SCHEME.$APP_BUILD_ENV.xcarchive" -exportPath "$OUTPUTDIR" -exportOptionsPlist "$OPTIONSPLIST_FILE"






####Workarund by Nitesh #############
# Build the application
#1. xcodebuild -scheme "$APP_SCHEME.$APP_BUILD_ENV" -sdk iphoneos -configuration Release build

# Package the application
#2.xcrun -log -sdk iphoneos PackageApplication -v "$OUTPUTDIR/$APP_NAME.app" -o "$OUTPUTDIR/$APP_NAME.ipa" -sign "$DEVELOPER_NAME" -embed "$PROVISIONING_PROFILE"


# Archive the application
#3.xcodebuild -scheme "$APP_SCHEME.$APP_BUILD_ENV" -sdk iphoneos -archivePath "$PWD/build/$APP_SCHEME.$APP_BUILD_ENV.xcarchive" -configuration Release PROVISIONING_PROFILE="$PROVISIONING_PROFILE" archive

# Export the archive to an ipa
#4.xcodebuild -exportArchive -archivePath "$PWD/build/$APP_SCHEME.$APP_BUILD_ENV.xcarchive" -exportOptionsPlist "$OPTIONSPLIST_FILE" -exportPath "$OUTPUTDIR/$APP_NAME.ipa"

#xcodebuild -exportArchive  -archivePath  "$PWD/build/$APP_SCHEME.$APP_BUILD_ENV.xcarchive" -exportOptionsPlist "$OPTIONSPLIST_FILE" -exportPath "$OUTPUTDIR/$APP_NAME.ipa" -exportFormat ipa -exportProvisioningProfile "$PROVISIONING_PROFILE"

####Workarund by Nitesh #############

echo "Output Directory Path"
echo "$OUTPUTDIR/$APP_NAME.app"

echo "Output Directory All files"
ls $OUTPUTDIR

# Condition to check the application's .ipa file is avaialable in build path
# If the .ipa file is available then zip the app.dysm file


#if ([ -f "$OUTPUTDIR/$APP_NAME.ipa" ]); then
#    zip -r -9 "$OUTPUTDIR/$APP_NAME.app.dsym.zip" "$OUTPUTDIR/$APP_NAME.app.dSYM"
#else
#    echo "Error : dSYM or IPA is not generated.."
#    exit 0
#fi

# RELEASE_DATE : To specify the relase date of the build
RELEASE_DATE='date '+%Y-%m-%d %H:%M:%S''

# RELEASE_NOTES : To specify the release notes, including the relase date and build number
#RELEASE_NOTES="Travis Integration: $TRAVIS_BUILD_NUMBER\nUploaded: $RELEASE_DATE"


# 'b is label prefix coded as standard prefix for all project'
if [ ! -z "$INFOPLIST_FILE" ]; then
LABEL_ID=b`/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" "$INFOPLIST_FILE"`
echo " $INFOPLIST_FILE => Label ID ="$LABEL_ID
fi

OUTPUT_FILE_NAME="$OUTPUT_FILE_NAME$LABEL_ID"


# Condition to check the stories file is avaialable in release path
# If file is available then read the text from the file
if ([ -f "$OUTPUT_FILE_NAME" ]); then
    ALL_STORIES_WITH_ID=`cat "$OUTPUT_FILE_NAME"`
else
    echo "Error : File not found on path $OUTPUT_FILE_NAME .."
fi


RELEASE_NOTES="$ALL_STORIES_WITH_ID <br> Travis Integration Build: $TRAVIS_BUILD_NUMBER"

echo $RELEASE_NOTES

if ([ -f "$OUTPUTDIR/$APP_NAME.ipa" ]); then
    if [ ! -z "$HOCKEY_APP_ID" ] && [ ! -z "$HOCKEY_APP_TOKEN" ]; then
        echo ""
        echo "***************************"
        echo "* Uploading to Hockeyapp *"
        echo "***************************"
        curl \
        -F "status=2" \
        -F "notify=0" \
        -F "notes_type=0" \
        -F "ipa=@$OUTPUTDIR/$APP_NAME.ipa" \
        -H "X-HockeyAppToken: $HOCKEY_APP_TOKEN" \
        https://rink.hockeyapp.net/api/2/apps/upload
        echo "Upload finish HockeyApp "
    fi
else
    echo "Failed to Upload Build on Hockeyapp"
fi
#        -F "notes=$RELEASE_NOTES" \
# -F "dsym=@$OUTPUTDIR/$APP_NAME.app.dsym.zip" \
