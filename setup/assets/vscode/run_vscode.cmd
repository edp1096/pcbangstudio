rem @echo off

rem vscode path
set "VSC_ROOT=%cd%"
set "VSC_DRIVE=%CD:~0,2%"
set "PATH=%cd%\bin;C:\Windows;C:\Windows\System;C:\Windows\System32"
rem Remove existing paths
rem set "PATH=%cd%;%PATH%"

rem Set again UserProfile, Appdata...
cd ..\..
set "HOME=%cd%\user\home"
set "USERPROFILE=%cd%\user\home\userprofile"
set "APPDATA=%cd%\user\home\AppData"
@REM set "TEMP=%cd%\user\tmp"
@REM set "TMP=%cd%\user\tmp"

rmdir "%TMP%\VSCode Crashes" /s /q

cd %VSC_ROOT%

rem git path
cd ..\git
set "PATH=%cd%;%cd%\cmd;%cd%\mingw64\bin;%cd%\usr\bin;%PATH%"

rem goroot path
cd ..\langs\go
set "GOROOT=%cd%"
set "PATH=%cd%;%cd%\bin;%PATH%"

rem python path
cd ..\python3
set "PATH=%cd%;%cd%\Scripts;%PATH%"
set "TCL_LIBRARY=%cd%\tcl\tcl8.6"
set "TK_LIBRARY=%cd%\tcl\tcl8.6"

rem cmake path
cd ..\cmake
set "PATH=%cd%\bin;%PATH%"

rem nodejs path
cd ..\nodejs
set "PATH=%cd%;%PATH%"
rem set "NODE_ENV=production"
rem set "NODE_ENV=development"
set "NODEJS_ROOT=%cd%"
set "NODEJS_CACHE=%NODEJS_ROOT%\npm-cache"
RunHiddenConsole "" npm config set cache %NODEJS_CACHE% --global
echo "cache=%CD%\npm-cache" > etc\npmrc

rem php path
cd ..\php
set "PHP_ROOT=%cd%"
set "PATH=%cd%;%PATH%"

rem mingw path
cd ..\mingw
set "MINGW_ROOT=%cd%"
set "PATH=%cd%;%cd%\bin;%cd%\x86_64-w64-mingw32\bin;%PATH%"
cd ..

rem wmic - because of mingw
set "PATH=C:\Windows\System32\wbem;%PATH%"

rem cmd path eg. dep, go test
cd ..\utils\mycmd
set "PATH=%cd%;%PATH%"

rem upx
rem cd ..\upx
rem set "PATH=%cd%;%PATH%"

rem nginx
cd ..\nginx
set "PATH=%cd%;%PATH%"

rem heidisql
cd ..\heidisql
set "PATH=%cd%;%PATH%"

rem gnuwin - sed, cp, mkdir etc...
cd ..\gnuwin
set "PATH=%cd%;%PATH%"

rem filezilla
cd ..\filezilla
set "PATH=%cd%;%PATH%"
set "FILEZILLA_ROOT=%cd:\=/%"

rem putty
cd ..\putty
set "PATH=%cd%;%PATH%"

cd ..\..\dbms

rem pgsql
cd pgsql
set "PATH=%cd%;%cd%\bin;%PATH%"
set "PGSQL_ROOT=%cd%"

rem mariadb
cd ..\mariadb
set "PATH=%cd%;%cd%\bin;%PATH%"
set "MARIADB_ROOT=%cd%"

rem home dir for Go
cd %VSC_ROOT%
cd ..\..\user\home
set "HOME=%cd%"

rem gopath
cd ..\gopath
set "GOPATH=%cd%"
set "PATH=%cd%\bin;%PATH%"

rem gocache
cd ..\gocache
set "GOCACHE=%cd%"

rem set "CGO_ENABLED=0"

cd %VSC_ROOT%

rem RunHiddenConsole gocode-gomod -s -cache

rem git ssl cert disable
git config --system http.sslverify false

@REM .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data
%SystemRoot%\SysWOW64\WindowsPowerShell\v1.0\powershell.exe -WindowStyle hidden "bin\code.cmd --reuse-window --extensions-dir data/extension --user-data-dir data/user-data"

rem Remove vscode caches when exit
%VSC_DRIVE%
cd %VSC_ROOT%
rmdir .\data\user-data\Cache /s /q
rmdir .\data\user-data\CachedData /s /q

rem rmdir %GOTOOLS%\pkg /s /q
rem rmdir %GOTOOLS%\src /s /q

rem rmdir %GOPATH%\bin /s /q
rem rmdir %GOPATH%\pkg /s /q
rem rmdir %GOPATH%\src /s /q

del /q %HomePath%\*
del /q %AppData%\*
for /d %%x in (%AppData%\*) do @rd /s /q "%%x"
del /q %TMP%\*
for /d %%x in (%TMP%\*) do @rd /s /q "%%x"

go clean -cache

del ..\..\user\gocache\log.txt

rem Kill procs from vscode when exit
taskkill /F /IM gocode-gomod.exe > nul
taskkill /F /IM nginx.exe > nul
taskkill /F /IM php.exe > nul
taskkill /F /IM php-cgi.exe > nul
taskkill /F /IM filezilla.exe > nul
taskkill /F /IM putty.exe > nul
taskkill /F /IM gocode.exe > nul
taskkill /F /IM gocode-gomod.exe > nul
taskkill /F /IM postgres.exe > nul
taskkill /F /IM mysqld.exe > nul
taskkill /F /IM heidisql.exe > nul

exit
