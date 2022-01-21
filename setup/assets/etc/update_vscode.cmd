@echo off

echo This will remove existing vscode binaries.
echo If you not want update, Ctrl+C or close this cmd window.
echo.
pause

cd ..\tools\vscode

call del_vscode_bin.cmd

@REM vscode >= 1.62.0 have bugs for extensions installation with cli
@REM If want to roll back to 1.61.2, comment line latest link and uncomment the following line
@REM ..\utils\gnuwin\curl.exe -Lo vscode.zip https://update.code.visualstudio.com/1.61.2/win32-x64-archive/stable
..\utils\gnuwin\curl.exe -Lo vscode.zip https://go.microsoft.com/fwlink/?Linkid=850641

..\utils\gnuwin\unzip.exe vscode.zip

del vscode.zip /q /s

cd ..\..

echo.
echo Update done.
echo.
pause
