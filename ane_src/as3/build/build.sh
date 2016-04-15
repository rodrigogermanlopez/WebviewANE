#!/usr/bin/env bash
#!/bin/sh
#!/bin/bash

SDK="/Users/rodrigo/developer/tools/air_sdk_21.0.0.176"

ACOMPC="$SDK/bin/acompc"
ADT="$SDK/bin/adt"

SWFVERSION=14

INCLUDE_SOURCES="../src/"
NAME="WebViewANE"

WIN_FILE="StudioNorth.WebView.dll"
#IOS_FILE="StudioNorth.WebView.a"

echo "GENERATING SWC"
$ACOMPC -source-path $INCLUDE_SOURCES -include-sources $INCLUDE_SOURCES -swf-version=$SWFVERSION -output $NAME.swc
sleep 1

echo "GENERATING LIBRARY from SWC"
unzip $NAME.swc

sleep 1
[[ -f "catalog.xml" ]] && rm -f "catalog.xml"

echo "GENERATING ANE $NAME.ane"
## use this for platforms dirs
# -platform Windows-x86 -C ../temp/win/
#$ADT -package -target ane $NAME.ane ./extension.xml -swc $NAME.swc -platform iPhone-ARM library.swf $IOS_FILE -platformoptions platform.xml -platform default library.swf
$ADT -package -target ane $NAME.ane ./extension.xml -swc $NAME.swc -platform Windows-x86 library.swf $WIN_FILE -platform default library.swf
sleep 1

[[ -f "library.swf" ]] && rm -f "library.swf"
[[ -f $NAME.swc ]] && rm -f $NAME.swc

echo "DONE!"

cp ./$NAME.ane ../../../lib/$NAME.ane
mv ./$NAME.ane ../$NAME.ane

echo "WebView ANE Build Complete"