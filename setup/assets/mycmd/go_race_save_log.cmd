@echo off

go run -race ./... > race.log 2>&1
