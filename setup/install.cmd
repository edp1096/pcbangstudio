@echo off

rem Config

rem set silent7z=-bsp0 -bso0
set silent7z=-bso0
rem set silentcurl=-s
set silentcurl=--progress-bar

set download_url_git="https://github.com/git-for-windows/git/releases/download/v2.21.0.windows.1/PortableGit-2.21.0-64-bit.7z.exe"
set download_url_heidisql="https://www.heidisql.com/downloads/releases/HeidiSQL_10.1_64_Portable.zip"
set download_url_putty="https://the.earth.li/~sgtatham/putty/latest/w64/putty.zip"
set download_url_filezilla="https://download.filezilla-project.org/client/FileZilla_3.41.2_win64.zip"
set download_url_notepad2="https://github.com/zufuliu/notepad2/releases/download/v4.19.04r2016/Notepad2_x64_v4.19.04r2016.zip"
set download_url_gnuwin="https://www.dropbox.com/s/2q3x5o2wzug1hbc/gnuwin.zip?dl=1"
set download_url_nginx="https://nginx.org/download/nginx-1.14.2.zip"

rem set download_url_mariadb="https://downloads.mariadb.org/interstitial/mariadb-10.3.14/winx64-packages/mariadb-10.3.14-winx64.zip"
set download_url_mariadb="https://downloads.mariadb.org/interstitial/mariadb-10.3.14/winx64-packages/mariadb-10.3.14-winx64.zip/from/http://ftp.kaist.ac.kr/mariadb/"
set download_url_pgsql="http://sbp.enterprisedb.com/getfile.jsp?fileid=11456&_ga=2.250821382.1635364127.1555943192-1012790724.1555943192"

set download_url_mingw="https://sourceforge.net/projects/mingw-w64/files/Toolchains targetting Win64/Personal Builds/mingw-builds/8.1.0/threads-posix/seh/x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z/download"
set download_url_golang="https://dl.google.com/go/go1.12.4.windows-amd64.zip"
set download_url_nodejs="https://nodejs.org/dist/v10.15.3/node-v10.15.3-win-x64.zip"
set download_url_php="https://windows.php.net/downloads/releases/php-7.2.17-nts-Win32-VC15-x64.zip"
set download_url_xdebug="https://xdebug.org/files/php_xdebug-2.7.1-7.2-vc15-nts-x86_64.dll"
set download_url_python="https://www.dropbox.com/s/sjlvd69abjdh02x/python354.7z?dl=1"
set download_url_cmake="https://github.com/Kitware/CMake/releases/download/v3.14.2/cmake-3.14.2-win64-x64.zip"

set download_url_vscode="https://go.microsoft.com/fwlink/?Linkid=850641"

rem Check whether folders are dirty
if exist ..\tools if exist ..\user set stop_job=true
if "%stop_job%"=="true" (
  echo.
  echo Perhaps installation is already done
  echo If you want to install again, remove folders - tools, user
  echo Closing..
  pause
  exit
) else (
  echo If you don't want to install, please press Ctrl+C or close this cmd window.
  echo Ready..
  echo.
  pause
)

rem download & unpacking tools
cd utils
set path=%cd%;C:\Windows;C:\Windows\System;C:\Windows\System32;C:\Windows\SysWOW64
cd ..\..

set pcbangstudio_root=%cd%

echo.
echo # Entering Tools
if not exist %cd%\tools md tools
cd tools

echo.
echo ### Download Git
curl.exe %silentcurl% -Lo portablegit.exe %download_url_git%
if not exist %cd%\git md git
cd git
7za x ../portablegit.exe -aoa %silent7z%
cd ..
del portablegit.exe

echo.
echo ## Entering Tools/Languages
if not exist %cd%\langs md langs
cd langs

echo ### MinGW
curl.exe %silentcurl% -Lo mingw.7z %download_url_mingw%
7za x mingw.7z -aoa %silent7z%
ren mingw64 mingw
del mingw.7z

echo ### Go
if not exist %cd%\go md go
curl.exe %silentcurl% -Lo go.zip %download_url_golang%
rem arc unarchive go.zip
7za x go.zip -aoa %silent7z%
del go.zip

echo ### Nodejs
curl.exe %silentcurl% -Lo nodejs.zip %download_url_nodejs%
rem arc unarchive nodejs.zip
7za x nodejs.zip -aoa %silent7z%
del nodejs.zip
for /f "tokens=1-4 delims=-" %%F IN ('dir /b /a:d "node*"') do ren "%%~F-%%~G-%%~H-%%~I" "%%~Fjs"
md nodejs\npm-cache
md nodejs\etc
copy %pcbangstudio_root%\setup\assets\nodejs\etc\npmrc .\nodejs\etc /y 1>NUL

echo ### PHP
if not exist %cd%\php md php
cd php
curl.exe %silentcurl% -Lo php.zip %download_url_php%
7za x php.zip -aoa %silent7z%
xcopy %pcbangstudio_root%\setup\assets\php\* .\ /y/e 1>NUL
del php.zip
cd ext
curl.exe %silentcurl% -Lo php_xdebug.dll %download_url_xdebug%
cd ..\..

echo ### Python
if not exist %cd%\python3 md python3
cd python3
curl.exe %silentcurl% -Lo python3.7z %download_url_python%
7za x python3.7z -aoa %silent7z%
del python3.7z
cd ..

echo ### CMake
curl.exe %silentcurl% -Lo cmake.zip %download_url_cmake%
7za x cmake.zip -aoa %silent7z%
del cmake.zip
for /f "tokens=1-4 delims=-" %%F IN ('dir /b /a:d "cmake*"') do ren "%%~F-%%~G-%%~H-%%~I" "%%~F"


cd %pcbangstudio_root%
cd tools

echo.
echo # Entering Tools/Utils
if not exist %cd%\utils md utils
cd utils

echo ## mycmd
md mycmd
cd mycmd
xcopy %pcbangstudio_root%\setup\assets\mycmd .\ /y/e 1>NUL
cd ..

echo ## NginX
curl.exe %silentcurl% -Lo nginx.zip %download_url_nginx%
7za x nginx.zip -aoa %silent7z%
del nginx.zip
for /f "tokens=1-2 delims=-" %%F IN ('dir /b /a:d "nginx*"') do ren "%%~F-%%~G" "%%~F"
cd nginx
cd conf
ren nginx.conf nginx.conf_orig
cd ..
xcopy %pcbangstudio_root%\setup\assets\nginx\* .\ /y/e 1>NUL
cd ..

echo ## HeidiSQL
if not exist %cd%\heidisql md heidisql
cd heidisql
curl.exe %silentcurl% -Lo heidisql.zip %download_url_heidisql%
7za x heidisql.zip -aoa %silent7z%
del heidisql.zip
cd ..

echo ## PUTTY
if not exist %cd%\putty md putty
cd putty
curl.exe %silentcurl% -Lo putty.zip %download_url_putty%
7za x putty.zip -aoa %silent7z%
del putty.zip
cd ..

echo ## Filezilla
if not exist %cd%\filezilla md filezilla
curl.exe %silentcurl% -Lo filezilla.zip %download_url_filezilla%
7za x filezilla.zip -aoa %silent7z%
del filezilla.zip
for /f "tokens=1-2 delims=-" %%F IN ('dir /b /a:d "filezilla*"') do ren "%%~F-%%~G" "%%~F"
cd filezilla
xcopy %pcbangstudio_root%\setup\assets\filezilla\* .\ /y/e 1>NUL
cd ..

echo ## Notepad2
if not exist %cd%\notepad2 md notepad2
cd notepad2
curl.exe %silentcurl% -Lo notepad2.zip %download_url_notepad2%
7za x notepad2.zip -aoa %silent7z%
copy %pcbangstudio_root%\setup\assets\notepad2\* .\ /y 1>NUL
del notepad2.zip
cd ..

echo ## GNUWin
if not exist %cd%\gnuwin md gnuwin
cd gnuwin
curl.exe %silentcurl% -Lo gnuwin.zip %download_url_gnuwin%
7za x gnuwin.zip -aoa %silent7z%
del gnuwin.zip
cd ..


cd %pcbangstudio_root%
cd tools
echo.
echo # Entering DBMS
if not exist %cd%\dbms md dbms
cd dbms

echo # MariaDB
curl.exe %silentcurl% -Lo mariadb.zip %download_url_mariadb%
7za x mariadb.zip -aoa %silent7z%
for /f "tokens=1-3 delims=-" %%F IN ('dir /b /a:d "mariadb*"') do ren "%%~F-%%~G-%%~H" "%%~F"
del mariadb.zip
rem rd data /q/s

echo # PostgreSQL
if not exist %cd%\pgsql md pgsql
curl.exe %silentcurl% -Lo pgsql.zip %download_url_pgsql%
7za x pgsql.zip -aoa %silent7z%
 del pgsql.zip
cd pgsql
rmdir "pgAdmin 4" /q/s
rmdir doc /q/s
rmdir symbols /q/s
cd ..


cd ..
echo.
echo # Download VSCode
if not exist %cd%\vscode md vscode
cd vscode
curl.exe %silentcurl% -Lo vscode.zip %download_url_vscode%
7za x vscode.zip -aoa %silent7z%
del vscode.zip
xcopy %pcbangstudio_root%\setup\assets\vscode\* .\ /y/e 1>NUL
cd ..


cd %pcbangstudio_root%

echo # Copy run.exe and etc to Root
copy %pcbangstudio_root%\setup\assets\run.exe .\ /y 1>NUL
if not exist %cd%\etc md etc
cd etc
xcopy %pcbangstudio_root%\setup\assets\etc .\ /y/e 1>NUL
cd ..


echo.
echo # Entering Home
if not exist %cd%\user md user
cd user

echo.
echo ## Create gopath, gocache
if not exist gocache md gocache
if not exist gopath md gopath

echo.
echo ## Create userprofile
if not exist userprofile md userprofile
cd userprofile
set UserProfile=%cd%
md AppData
md AppData\Roaming
md AppData\Local
cd ..

echo.
echo ## Create tmp
if not exist tmp md tmp
cd tmp
set TMP=%cd%
set TEMP=%cd%
cd ..

echo.
echo ## Create home
if not exist home md home
cd home
set HOME=%cd%
cd ..

cd ..
echo.
echo ## Create workspace
if not exist workspace md workspace


cd %pcbangstudio_root%

echo.
echo ## Download vscode extensions
set VSCODE_DEV=
set ELECTRON_RUN_AS_NODE=1
set NODE_NO_WARNINGS=1
cd tools\vscode
echo ### launcher
Code.exe ".\resources\app\out\cli.js" --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension ilich8086.launcher
echo ### bracket-pair-colorizer
Code.exe ".\resources\app\out\cli.js" --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension CoenraadS.bracket-pair-colorizer
echo ### disableligatures
Code.exe ".\resources\app\out\cli.js" --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension CoenraadS.disableligatures
echo ### go
Code.exe ".\resources\app\out\cli.js" --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension ms-vscode.Go
echo ### vetur
Code.exe ".\resources\app\out\cli.js" --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension octref.vetur
echo ### postgres
Code.exe ".\resources\app\out\cli.js" --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension ckolkman.vscode-postgres
echo ### rest-client
Code.exe ".\resources\app\out\cli.js" --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension humao.rest-client

rem echo ### asp
rem Code.exe ".\resources\app\out\cli.js" --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension jtjoo.classic-asp-html
rem echo ### python
rem Code.exe ".\resources\app\out\cli.js" --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension ms-python.python
rem echo ### intelephense
rem Code.exe ".\resources\app\out\cli.js" --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension bmewburn.vscode-intelephense-client
rem echo ### git history-diff
rem Code.exe ".\resources\app\out\cli.js" --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension huizhou.githd
rem echo ### css-compact
rem Code.exe ".\resources\app\out\cli.js" --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension jsonchou.css-compact
echo ### settings-cycler
Code.exe ".\resources\app\out\cli.js" --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension hoovercj.vscode-settings-cycler
echo ### icons
Code.exe ".\resources\app\out\cli.js" --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension vscode-icons-team.vscode-icons

echo.
echo Done to installation
echo.
pause

