@echo off

SET SDK=C:\dev\tools\air_sdk\
SET WIN_FILE=WebViewChromeANE.dll
SET NAME=WebViewANE

SET THIS=%~dp0
SET ACOMPC=%SDK%bin\acompc.bat
SET ADT=%SDK%bin\adt.bat
SET SWFVERSION=14
SET SRC=%THIS%..\src\
SET SWC=%THIS%%NAME%.swc
SET ZIP=%THIS%7z
SET ANE=%THIS%%NAME%.ane

SET WIN_FILE=%THIS%%WIN_FILE%

REM //ECHO sdk is %SDK%
REM //ECHO acompc is %ACOMPC%
REM //ECHO adt is %ADT%
REM //ECHO source %SRC%
REM //ECHO %THIS%

echo "GENERATING SWC"
call "%ACOMPC%" -source-path %SRC% -include-sources %SRC% -swf-version=%SWFVERSION% -output %SWC%

echo "DECOMPRESSING LIBRARY"
%ZIP% e %SWC% -y
DEL catalog.xml

echo GENERATING ANE
call "%ADT%" -package -target ane %NAME%.ane ./extension.xml -swc %NAME%.swc -platform Windows-x86 library.swf %WIN_FILE% -platform default library.swf

copy "%NAME%.ane" "../../../lib/%NAME%.ane"

DEL %SWC%
DEL library.swf
