@echo off

rem Config

rem set silent7z=-bsp0 -bso0
set silent7z=-bso0
rem set silentcurl=-s
set silentcurl=--progress-bar

@REM Git for windows
set download_url_git="https://github.com/git-for-windows/git/releases/download/v2.44.0.windows.1/MinGit-2.44.0-busybox-64-bit.zip"
set download_url_heidisql="https://www.heidisql.com/downloads/releases/HeidiSQL_12.6_64_Portable.zip"

REM PuTTY
set download_url_putty="https://the.earth.li/~sgtatham/putty/latest/w64/putty.zip"
REM PuTTYtray - feature for saving session to file
set download_url_puttytray="https://puttytray.goeswhere.com/download/putty.exe"

set download_url_filezilla="https://www.dropbox.com/scl/fi/jnjo5alk95k6sqm4014ry/FileZilla_3.68.1_win64.zip?rlkey=y86ue6fnqai6boijjc5y7o58k&e=1&st=5pfuwcrg&dl=1"
@REM set download_url_notepad2="https://github.com/zufuliu/notepad2/releases/download/v4.19.04r2016/Notepad2_x64_v4.19.04r2016.zip"
set download_url_notepad2="https://github.com/zufuliu/notepad2/releases/download/v4.24.03r5146/Notepad2_en_AVX2_v4.24.03r5146.zip"
set download_url_gnuwin="https://www.dropbox.com/s/2q3x5o2wzug1hbc/gnuwin.zip?dl=1"
set download_url_nginx="https://nginx.org/download/nginx-1.18.0.zip"

REM set download_url_mariadb="https://downloads.mariadb.org/interstitial/mariadb-10.5.12/winx64-packages/mariadb-10.5.12-winx64.zip"
set download_url_mariadb="https://archive.mariadb.org/mariadb-10.6.17/winx64-packages/mariadb-10.6.17-winx64.zip"
REM set download_url_pgsql="https://get.enterprisedb.com/postgresql/postgresql-12.3-2-windows-x64-binaries.zip"
set download_url_pgsql="https://get.enterprisedb.com/postgresql/postgresql-13.14-1-windows-x64-binaries.zip"

@REM set download_url_mingw="https://sourceforge.mirrorservice.org/m/mi/mingw-w64/Toolchains%%20targetting%%20Win64/Personal%%20Builds/mingw-builds/8.1.0/threads-posix/seh/x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z"
@REM set download_url_mingw="https://sourceforge.net/projects/mingw-w64/files/Toolchains targetting Win64/Personal Builds/mingw-builds/8.1.0/threads-posix/seh/x86_64-8.1.0-release-posix-seh-rt_v6-rev0.7z/download"
set download_url_mingw="https://github.com/brechtsanders/winlibs_mingw/releases/download/13.2.0posix-18.1.3-11.0.1-msvcrt-r7/winlibs-x86_64-posix-seh-gcc-13.2.0-mingw-w64msvcrt-11.0.1-r7.7z"

@REM Go latest stable release
@REM set download_url_golang="https://go.dev/dl/go1.17.3.windows-amd64.zip"
For /f "tokens=1 delims=" %%i in ('.\utils\curl.exe "https://go.dev/VERSION?m=text"') do (
  set "download_url_golang=https://go.dev/dl/%%i.windows-amd64.zip"
  goto :next
)
:next
set download_url_nodejs="https://nodejs.org/dist/v18.20.2/node-v18.20.2-win-x64.zip"
set download_url_php="https://windows.php.net/downloads/releases/archives/php-7.4.29-nts-Win32-vc15-x64.zip"
set download_url_xdebug="https://xdebug.org/files/php_xdebug-3.1.6-7.4-vc15-nts-x86_64.dll"
REM set download_url_python="https://www.dropbox.com/s/sjlvd69abjdh02x/python354.7z?dl=1"
set download_url_python="https://www.dropbox.com/s/2v6i1pskojhh1sk/python373.7z?dl=1"
@REM set download_url_cmake="https://github.com/Kitware/CMake/releases/download/v3.19.3/cmake-3.19.3-win64-x64.zip"
set download_url_cmake="https://github.com/Kitware/CMake/releases/download/v3.29.2/cmake-3.29.2-windows-x86_64.zip"

@REM Cannot install extensions with Code.exe version > v1.61.2
@REM set download_url_vscode="https://update.code.visualstudio.com/1.61.2/win32-x64-archive/stable"
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

rem echo.
rem echo ### Git
rem if exist %cd%\portablegit.exe (
rem   set do_git=1
rem   if exist %cd%\git rmdir git /q/s
rem ) else (
rem   if not exist %cd%\git set do_git=1
rem )
rem if defined do_git (
rem   curl.exe %silentcurl% -Lo portablegit.exe %download_url_git%
rem   if not exist %cd%\git md git
rem   cd git
rem     7za x ../portablegit.exe -aoa %silent7z%
rem   cd ..
rem   del portablegit.exe
rem )

echo ### Git
if exist %cd%\git.zip (
  set do_git=1
  if exist %cd%\git rmdir go /q/s
) else (
  if not exist %cd%\git set do_git=1
)
if defined do_git (
  if not exist %cd%\git md git
  cd git
    curl.exe %silentcurl% -Lo git.zip %download_url_git%
    7za x git.zip -aoa %silent7z%
    del git.zip
  cd ..
)

echo.
echo ## Entering Tools/Languages
if not exist %cd%\langs md langs
cd langs

echo ### MinGW
if exist %cd%\mingw.7z (
  set do_mingw=1
  if exist %cd%\mingw rmdir mingw /q/s
) else (
  if not exist %cd%\mingw set do_mingw=1
)
if defined do_mingw (
  curl.exe %silentcurl% -Lo mingw.7z %download_url_mingw%
  7za x mingw.7z -aoa %silent7z%
  ren mingw64 mingw
  del mingw.7z
)

echo ### Go
if exist %cd%\go.zip (
  set do_go=1
  if exist %cd%\go rmdir go /q/s
) else (
  if not exist %cd%\go set do_go=1
)
if defined do_go (
  if not exist %cd%\go md go
  curl.exe %silentcurl% -Lo go.zip %download_url_golang%
  7za x go.zip -aoa %silent7z%
  del go.zip
)

echo ### Nodejs
if exist %cd%\nodejs.zip (
  set do_nodejs=1
  if exist %cd%\nodejs rmdir nodejs /q/s
) else (
  if not exist %cd%\nodejs set do_nodejs=1
)
if defined do_nodejs (
  curl.exe %silentcurl% -Lo nodejs.zip %download_url_nodejs%
  7za x nodejs.zip -aoa %silent7z%
  del nodejs.zip
  for /f "tokens=1-4 delims=-" %%F IN ('dir /b /a:d "node*"') do ren "%%~F-%%~G-%%~H-%%~I" "%%~Fjs"
  md nodejs\npm-cache
  md nodejs\etc
  copy %pcbangstudio_root%\setup\assets\nodejs\etc\npmrc .\nodejs\etc /y 1>NUL
)

echo ### Php
if exist %cd%\php\php.zip (
  set do_php=1
  if exist %cd%\php rmdir php /q/s
) else (
  if not exist %cd%\php set do_php=1
)
if defined do_php (
  if not exist %cd%\php md php
  cd php
    curl.exe %silentcurl% -Lo php.zip %download_url_php%
    7za x php.zip -aoa %silent7z%
    xcopy %pcbangstudio_root%\setup\assets\php\* .\ /y/e 1>NUL
    del php.zip
    cd ext
      curl.exe %silentcurl% -Lo php_xdebug.dll %download_url_xdebug%
  cd ..\..
)

echo ### Python
if exist %cd%\python3\python3.7z (
  set do_python=1
  if exist %cd%\python3 rmdir python3 /q/s
) else (
  if not exist %cd%\python3 set do_python=1
)
if defined do_python (
  if not exist %cd%\python3 md python3
  cd python3
    curl.exe %silentcurl% -Lo python3.7z %download_url_python%
    7za x python3.7z -aoa %silent7z%
    del python3.7z
  cd ..
)

echo ### CMake
if exist %cd%\cmake.zip (
  set do_cmake=1
  if exist %cd%\cmake rmdir cmake /q/s
) else (
  if not exist %cd%\cmake set do_cmake=1
)
if defined do_cmake (
  curl.exe %silentcurl% -Lo cmake.zip %download_url_cmake%
  7za x cmake.zip -aoa %silent7z%
  del cmake.zip
  for /f "tokens=1-4 delims=-" %%F IN ('dir /b /a:d "cmake*"') do ren "%%~F-%%~G-%%~H-%%~I" "%%~F"
)

cd %pcbangstudio_root%
cd tools

echo.
echo # Entering Tools/Utils
if not exist %cd%\utils md utils
cd utils

echo ## mycmd
if not exist mycmd (
  md mycmd
  cd mycmd
  xcopy %pcbangstudio_root%\setup\assets\mycmd .\ /y/e 1>NUL
  cd ..
)

echo ## NginX
if exist %cd%\nginx.zip (
  set do_nginx=1
  if exist %cd%\nginx rmdir nginx /q/s
) else (
  if not exist %cd%\nginx set do_nginx=1
)
if defined do_nginx (
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
)

echo ## HeidiSQL
if exist %cd%\heidisql\heidisql.zip (
  set do_heidisql=1
  if exist %cd%\heidisql rmdir heidisql /q/s
) else (
  if not exist %cd%\heidisql set do_heidisql=1
)
if defined do_heidisql (
  if not exist %cd%\heidisql md heidisql
  cd heidisql
    curl.exe %silentcurl% -Lo heidisql.zip %download_url_heidisql%
    7za x heidisql.zip -aoa %silent7z%
    del heidisql.zip
  cd ..
)

echo ## PUTTY
if exist %cd%\putty\putty.zip (
  set do_putty=1
  if exist %cd%\putty rmdir putty /q/s
) else (
  if not exist %cd%\putty set do_putty=1
)
if defined do_putty (
  if not exist %cd%\putty md putty
  cd putty
    curl.exe %silentcurl% -Lo putty.zip %download_url_putty%
    7za x putty.zip -aoa %silent7z%
    del putty.zip

    if defined download_url_puttytray (
      del putty.exe
      curl.exe %silentcurl% -Lo putty.exe %download_url_puttytray%
    )
  cd ..
)

echo ## Filezilla
if exist %cd%\filezilla.zip (
  set do_filezilla=1
  if exist %cd%\filezilla rmdir filezilla /q/s
) else (
  if not exist %cd%\filezilla set do_filezilla=1
)
if defined do_filezilla (
  curl.exe %silentcurl% -Lo filezilla.zip %download_url_filezilla%
  7za x filezilla.zip -aoa %silent7z%
  del filezilla.zip
  for /f "tokens=1-2 delims=-" %%F IN ('dir /b /a:d "filezilla*"') do ren "%%~F-%%~G" "%%~F"
  cd filezilla
    xcopy %pcbangstudio_root%\setup\assets\filezilla\* .\ /y/e 1>NUL
  cd ..
)

echo ## Notepad2
if exist %cd%\notepad2\notepad2.zip (
  set do_notepad2=1
  if exist %cd%\notepad2 rmdir notepad2 /q/s
) else (
  if not exist %cd%\notepad2 set do_notepad2=1
)
if defined do_notepad2 (
  if not exist %cd%\notepad2 md notepad2
  cd notepad2
    curl.exe %silentcurl% -Lo notepad2.zip %download_url_notepad2%
    7za x notepad2.zip -aoa %silent7z%
    copy %pcbangstudio_root%\setup\assets\notepad2\* .\ /y 1>NUL
    del notepad2.zip
  cd ..
)

echo ## GNUWin
if exist %cd%\gnuwin\gnuwin.zip (
  set do_gnuwin=1
  if exist %cd%\gnuwin rmdir gnuwin /q/s
) else (
  if not exist %cd%\gnuwin set do_gnuwin=1
)
if defined do_gnuwin (
  if not exist %cd%\gnuwin md gnuwin
  cd gnuwin
    curl.exe %silentcurl% -Lo gnuwin.zip %download_url_gnuwin%
    7za x gnuwin.zip -aoa %silent7z%
    del gnuwin.zip
  cd ..
)

cd %pcbangstudio_root%
cd tools
echo.
echo # Entering DBMS
if not exist %cd%\dbms md dbms
cd dbms

echo # MariaDB
if exist %cd%\mariadb.zip (
  set do_mariadb=1
  if exist %cd%\mariadb rmdir mariadb /q/s
) else (
  if not exist %cd%\mariadb set do_mariadb=1
)
if defined do_mariadb (
  curl.exe %silentcurl% -Lo mariadb.zip %download_url_mariadb%
  7za x mariadb.zip -aoa %silent7z%
  for /f "tokens=1-3 delims=-" %%F IN ('dir /b /a:d "mariadb*"') do ren "%%~F-%%~G-%%~H" "%%~F"

  REM if not exist .\mariadb\data\ cd mariadb\bin && mariadb-install-db.exe && del ..\data\aria_log* /q && del ..\data\*.err && del ..\data\*.ini /q && cd ..\..
  if not exist .\mariadb\data\ cd mariadb\bin && mariadb-install-db.exe && cd ..\..

  md .\mariadb\data_init
  xcopy .\mariadb\data .\mariadb\data_init /y/e 1>NUL
  del .\mariadb\data_init\ib* /q
  del mariadb.zip
  rd mariadb\data /q/s
  cd mariadb\bin
    for /f %%F in ('dir . /b /a-d ^| findstr /vile "mysql.exe mysqld.exe mysqldump.exe server.dll"') do (del "%%F")
    for /f %%D in ('dir /b /ad ^| findstr /vile "mysql.exe mysqld.exe mysqldump.exe server.dll"') do (rmdir "%%D"/q/s)
    cd ..
  rmdir lib /q/s
  cd..
)

echo # PostgreSQL
if exist %cd%\pgsql.zip (
  set do_pgsql=1
  if exist %cd%\pgsql rmdir pgsql /q/s
) else (
  if not exist %cd%\pgsql set do_pgsql=1
)
if defined do_pgsql (
  rem if not exist %cd%\pgsql md pgsql
  curl.exe %silentcurl% -Lo pgsql.zip %download_url_pgsql%
  7za x pgsql.zip -aoa %silent7z%
  del pgsql.zip
  cd pgsql
    rmdir "pgAdmin 4" /q/s
    rmdir doc /q/s
    rmdir symbols /q/s
  cd ..
)


cd ..
echo.
echo # Download VSCode
if exist %cd%\vscode\vscode.zip (
  set do_vscode=1
  if exist %cd%\vscode rmdir vscode /q/s
) else (
  if not exist %cd%\vscode set do_vscode=1
)
if defined do_vscode (
  if not exist %cd%\vscode md vscode
  cd vscode
    curl.exe %silentcurl% -Lo vscode.zip %download_url_vscode%
    7za x vscode.zip -aoa %silent7z%
    del vscode.zip
    xcopy %pcbangstudio_root%\setup\assets\vscode\* .\ /y/e 1>NUL
  cd ..
)


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
md Desktop
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
@REM Code.exe ".\resources\app\out\cli.js"
RunHiddenConsole .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension ilich8086.launcher
echo ### disableligatures
RunHiddenConsole .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension CoenraadS.disableligatures

REM echo ### postgres
REM RunHiddenConsole .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension ckolkman.vscode-postgres
REM echo ### ERD Editor
REM RunHiddenConsole .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension dineug.vuerd-vscode

echo ### go
RunHiddenConsole .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension golang.Go
REM echo ### vetur
REM RunHiddenConsole .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension octref.vetur
REM echo ### asp
REM RunHiddenConsole .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension jtjoo.classic-asp-html
REM echo ### python
REM RunHiddenConsole .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension ms-python.python

echo ### intelephense
RunHiddenConsole .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension bmewburn.vscode-intelephense-client

REM echo ### css-compact
REM RunHiddenConsole .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension jsonchou.css-compact

REM echo ### File tree generator
REM RunHiddenConsole .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension shinotatwu-ds.file-tree-generator

echo ### git graph
RunHiddenConsole .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension mhutchie.git-graph

echo ### rest-client
RunHiddenConsole .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension humao.rest-client
echo ### settings-cycler
RunHiddenConsole .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension hoovercj.vscode-settings-cycler
echo ### icons
RunHiddenConsole .\bin\code.cmd --extensions-dir .\data\extension --user-data-dir .\data\user-data --install-extension vscode-icons-team.vscode-icons


echo.
echo Done to installation
echo Please install D2Coding font yourself. - https://github.com/naver/d2codingfont/releases
echo Or change your favorite font in settings.json of vscode
echo.
pause
