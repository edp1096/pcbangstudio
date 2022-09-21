set WORKBENCH_DESKTOP_MAIN_CSS=%cd%\..\tools\vscode\resources\app\out\vs\workbench\workbench.desktop.main.css

echo.>> %WORKBENCH_DESKTOP_MAIN_CSS%
echo @font-face{ font-family: 'D2Coding ligature'; src: url('https://cdn.jsdelivr.net/gh/joungkyun/font-d2coding-ligature/D2Coding-ligature.eot?#iefix') format('embedded-opentype'),>> %WORKBENCH_DESKTOP_MAIN_CSS%
echo url('https://cdn.jsdelivr.net/gh/joungkyun/font-d2coding-ligature/D2Coding-ligature.woff2') format('woff2'),>> %WORKBENCH_DESKTOP_MAIN_CSS%
echo url('https://cdn.jsdelivr.net/gh/joungkyun/font-d2coding-ligature/D2Coding-ligature.woff') format('woff'),>> %WORKBENCH_DESKTOP_MAIN_CSS%
echo url('https://cdn.jsdelivr.net/gh/joungkyun/font-d2coding-ligature/D2Coding-ligature.ttf') format('truetype'); font-weight: normal; font-style: normal;>> %WORKBENCH_DESKTOP_MAIN_CSS%
echo }>> %WORKBENCH_DESKTOP_MAIN_CSS%
echo @import url("http://fonts.cdnfonts.com/css/cascadia-code");>> %WORKBENCH_DESKTOP_MAIN_CSS%

%SystemRoot%\SysWOW64\WindowsPowerShell\v1.0\powershell.exe ".\vscode_checksum_fix.ps1"