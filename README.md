# VSCode Portable

Portable `vscode` creation toolset for using on `MS-Windows` `amd64` machine at public place

## Install
* Download this repository
* Run `cmd` then move to unziped repository path
    ```sh
    $ cd setup
    $ install.cmd
    ```
* You can break the job by press `Ctrl+C` then resume by run above `install.cmd` again

## Tools
* Git
* Compiler, others
    * MinGW
    * Go
    * NodeJS
    * PHP
    * Python 3.5.4
    * CMake
* DB
    * MariaDB - run with local db data which can be created at project root
        * Shift + F2 > MairDB init db / Shift + F2 > MairDB Start
    * PostgreSQL - run with local db data which can be created at project root
        * Shift + F2 > PgSQL init db / Shift + F2 > PgSQL Start
    * HeidiSQL
* NgiNX - Project root is html root instead of `nginx/html` folder
* Filezilla
* PuTTY
* Notepad2
* Others
    * mycmd - some `powershell` commands. please run on `integrated terminal` of `vscode`
* VSCode

## Usage
* Run `vscode` - execute `run.exe` at root
* Run `Launcher` in `vscode` - Shift + F2

Each location of `AppData` and `UserProfile` and `Home` will be set to new place when run `vscode`
 - See `user` folder

## Update `VSCode`
* <b>Don't click `Gear` icon > `download` or click `Help` > `Download update`</b>
* exit `vscode`
* move to `etc` folder
* run `update_vscode.cmd`

## Cleanup home, userprofile, tmp..
* run `etc/clear_garbage.cmd`
