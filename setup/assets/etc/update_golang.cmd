@echo off

echo This will remove existing Go binaries.
echo If you not want update, Ctrl+C or close this cmd window
echo.
pause

cd ..\tools\langs

rmdir go /s /q

For /f %%i in ('..\utils\gnuwin\curl.exe "https://go.dev/VERSION?m=text"') do echo. && echo Download %%i && set "gover=https://golang.org/dl/%%i.windows-amd64.zip"

..\utils\gnuwin\curl.exe --progress-bar -Lo go.zip %gover%

echo. && echo Extracting.. && echo.

..\utils\gnuwin\unzip.exe -q go.zip
del go.zip

echo. && echo "Check go version" && echo.
go\bin\go version

cd ..\..\etc

echo. && echo "Update Go finished" && echo.
pause
