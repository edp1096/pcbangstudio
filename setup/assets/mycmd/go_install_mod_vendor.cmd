@echo off
set GOBIN=%1
go install -mod vendor

echo Done to install.