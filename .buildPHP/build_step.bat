@ECHO OFF
REM build_step.bat
REM like build_develop but does increase minor 'build' number 
CLS

REM Path for calling
set ExePath=C:\Program Files\php82\
REM ECHO ExePath: "%ExePath%"

if exist "%ExePath%php.exe" (
    REM path known (WT)
    ECHO ExePath: "%ExePath%"
) else (
    REM Direct call
    ECHO PHP in path variable
    set ExePath=
)

REM "C:\Program Files\php82\php.exe" --version
"%ExePath%php.exe" --version
ECHO ----------------------------------------------
ECHO.

pushd  ..\..\buildComponentPhp\src
dir /one /b *.tsk
echo --- "%ExePath%php.exe" buildReleaseCmd.php -f ../../J_LangMan4ExtDevProject/.buildPHP/build_step.tsk %1
"%ExePath%php.exe" buildReleaseCmd.php -f ../../J_LangMan4ExtDevProject/.buildPHP/build_step.tsk %1
popd

GOTO :EOF

REM ------------------------------------------
REM Adds given argument to the already known command arguments
:AddNextArg
    Set NextArg=%*
    Set CmdArgs=%CmdArgs% %NextArg%
    ECHO  '%NextArg%'
GOTO :EOF

