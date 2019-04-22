@echo off
chcp 65001 > nul
rmdir %GOPATH%\pkg /s /q
rmdir %GOPATH%\src /s /q
del %GOCACHE%\log.txt /q /f

del /q %GOCACHE%\*
for /D %%p in (%GOCACHE%\*.*) do rmdir "%%p" /s /q

del /q %tmp%\*
for /D %%p in (%tmp%\*.*) do rmdir "%%p" /s /q

echo Done to flush $GOPATH.