@echo off

echo This will remove existing vscode binaries.
echo If you not want update, Ctrl+C or close this cmd window.
echo.
pause

cd ..\tools\vscode

call del_vscode_bin.cmd

..\utils\notgnu\curl.exe -Lo vscode.zip https://go.microsoft.com/fwlink/?Linkid=850641

..\utils\gnuwin\unzip.exe vscode.zip

del vscode.zip /q /s

cd ..\..

echo.
echo Update done.
echo.
pause
