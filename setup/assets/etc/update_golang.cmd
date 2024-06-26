@echo off

echo This will remove existing Go binaries.
echo If you not want update, Ctrl+C or close this cmd window
echo.
pause

cd ..\tools\langs

rmdir go /s /q

@rem For /f %%i in ('..\utils\gnuwin\curl.exe "https://go.dev/VERSION?m=text"') do echo. && echo Download %%i && set "gover=https://go.dev/dl/%%i.windows-amd64.zip"
for /f "tokens=1 delims=" %%i in ('..\utils\gnuwin\curl.exe "https://go.dev/VERSION?m=text"') do (
    echo Download %%i
    set "gover=https://go.dev/dl/%%i.windows-amd64.zip"
    goto :next
)
:next

..\utils\gnuwin\curl.exe --progress-bar -Lo go.zip %gover%

echo. && echo Extracting.. && echo.

..\utils\gnuwin\unzip.exe go.zip
del go.zip

echo. && echo "Check go version" && echo.
go\bin\go version

cd ..\..\etc

echo. && echo "Update Go finished" && echo.
pause
