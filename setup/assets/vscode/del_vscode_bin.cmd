@echo off
rem Source: https://www.windows-commandline.com/delete-directory-from-command-line

for /f %%F in ('dir . /b /a-d ^| findstr /vile "data del_vscode_bin.cmd run_vscode.cmd RunHiddenConsole.exe"') do (del "%%F")
for /f %%D in ('dir /b /ad ^| findstr /vile "data del_vscode_bin.cmd run_vscode.cmd RunHiddenConsole.exe"') do (rmdir "%%D"/q/s)
