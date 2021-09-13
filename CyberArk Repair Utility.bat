@echo off
mode con cols=58 lines=9

fsutil dirty query %systemdrive% >nul
if %errorlevel% == 0 (
    goto :main
) else (
    goto :noadmin
)

:noadmin
cls
color 0C & title Error!
echo You must run this script as an administrator!
pause > nul
goto :eof

:main
cls
color 02 & title CyberArk Repair Utility
echo     __________________________________________________
echo    /                                                  \
echo    ^|                                                  ^|
echo    ^|             CyberArk Repair Utility              ^|
echo    ^|                                                  ^|
echo    \__________________________________________________/
echo.
set /p check="Have you applied the first fix already? "
if /I "%check%" EQU "Y" goto :part2
if /I "%check%" EQU "N" goto :part1
cls
color 0C & title Error!
echo You must enter 'y' or 'n' to proceed...
pause > nul
goto :main

:part1
cls
color 02 & title CyberArk Repair Utility
echo     __________________________________________________
echo    /                                                  \
echo    ^|                                                  ^|
echo    ^|         CyberArk Repair Utility (Part 1)         ^|
echo    ^|                                                  ^|
echo    \__________________________________________________/
echo.
set /p pc="Machine name: "

cls
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %pc% ^| findstr [') do set ip=%%a

mode con cols=60 lines=9
cls
color 02
echo.
echo Machine: %pc%
echo IPv4: %ip%
echo.
set /P choice="Is this information correct? "
if /I "%choice%" EQU "Y" goto :fix1
if /I "%choice%" EQU "N" goto :part1
cls
color 0C & title Error!
echo You must enter 'y' or 'n' to proceed...
pause > nul
goto :part1

:fix1
reg add \\%ip%\HKLM\system\currentcontrolset\services\vf_agent /f /v Start /d 4
reg add \\%ip%\HKLM\system\currentcontrolset\services\pasagent /f /v Start /d 4
echo The fix has been applied. The PC must restart before part 2.
echo Press any key to proceed...
pause > nul
goto :main

:part2
cls
color 02 & title CyberArk Repair Utility
echo     __________________________________________________
echo    /                                                  \
echo    ^|                                                  ^|
echo    ^|         CyberArk Repair Utility (Part 2)         ^|
echo    ^|                                                  ^|
echo    \__________________________________________________/
echo.
set /p pc="Machine name: "

cls
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %pc% ^| findstr [') do set ip=%%a

mode con cols=60 lines=9
cls
color 02
echo.
echo Machine: %pc%
echo IPv4: %ip%
echo.
set /P choice="Is this information correct? "
if /I "%choice%" EQU "Y" goto :fix2
if /I "%choice%" EQU "N" goto :part2
cls
color 0C & title Error!
echo You must enter 'y' or 'n' to proceed...
pause > nul
goto :part2

:fix2
reg add \\%ip%\HKLM\system\currentcontrolset\services\vf_agent /f /v Start /d 2
reg add \\%ip%\HKLM\system\currentcontrolset\services\pasagent /f /v Start /d 3
psexec \\%ip% -s net start vf_agent
echo The fix has been applied. Press any key to proceed...
pause > nul
goto :main