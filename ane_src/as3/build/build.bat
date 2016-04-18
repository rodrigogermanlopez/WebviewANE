@echo off

SET SDK=C:\AIRSDK_Compiler\
SET WIN_FILE=UniversalWinWebViewANE.dll
SET NAME=WebViewANE

rem SET THIS=%~dp0
SET ACOMPC=%SDK%bin\acompc.bat
SET ADT=%SDK%bin\adt.bat
SET SWFVERSION=14
SET SRC=..\src\
SET SWC=%NAME%.swc
SET ZIP=7z
SET ANE=%NAME%.ane

REM SET WIN_FILE=%WIN_FILE%

REM //ECHO sdk is %SDK%
REM //ECHO acompc is %ACOMPC%
REM //ECHO adt is %ADT%
REM //ECHO source %SRC%
REM //ECHO %THIS%

echo "GENERATING SWC"
call "%ACOMPC%" -source-path %SRC% -include-sources %SRC% -swf-version=%SWFVERSION% -output %SWC%

echo "DECOMPRESSING LIBRARY"
%ZIP% e %SWC% -y
rem DEL catalog.xml

echo GENERATING ANE
call "%ADT%" -package -target ane %NAME%.ane ./extension.xml -swc %NAME%.swc -platform Windows-x86 library.swf %WIN_FILE% -platform default library.swf

copy "%NAME%.ane" "../../../lib/%NAME%.ane"

rem DEL %SWC%
rem DEL library.swf
