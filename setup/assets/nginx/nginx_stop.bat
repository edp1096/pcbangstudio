@echo off
echo Stopping nGinX server...

taskkill /F /IM nginx.exe > nul
taskkill /F /IM php-cgi.exe > nul

exit