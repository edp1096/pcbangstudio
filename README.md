# VSCode Portable

Portable `vscode` creation toolset for using on `MS-Windows 10 / amd64` machine at public place

After installation, just zip & unzip then use it at public windows pc

[![pcbangstudio](https://img.youtube.com/vi/fNm3Kd-UASM/0.jpg)](https://www.youtube.com/watch?v=fNm3Kd-UASM)

## Install
* Download this repository
* Remove `.git` folder in root of downloaded repository of exist
* Run `cmd` then move to unziped repository path
    ```sh
    $ cd setup
    $ install.cmd
    ```
* You can break the job by press `Ctrl+C` then resume by run above `install.cmd` again

## Tools
* Git
* Compiler, others - All can be run on integrated terminal. Press Ctrl + `
    * MinGW
    * Go - Press Shift + F2 > Module init / Shift + F2 > Install to workspace
    * NodeJS
    * PHP
    * Python 3.5.4
    * CMake
* DB
    * MariaDB - run with local db data which can be created at project root
        * Shift + F2 > MairDB init db / Shift + F2 > MairDB Start
    * PostgreSQL - run with local db data which can be created at project root
        * Shift + F2 > PgSQL init db / Shift + F2 > PgSQL Start
        * PgAdmin will be removed. I'm using `HeidiSQL` instead of it
    * HeidiSQL
* NgiNX - Press Shift + F2 . html root is current project root instead of `nginx/html` folder
* Filezilla - Press Shift + F2
* PuTTY - Press Shift + F2
* Notepad2 - Use for edit command at `Filezilla`
* Others
    * mycmd - some `powershell` commands. please try on `integrated terminal` of `vscode`
* VSCode

## Usage
* Run `vscode` - execute `run.exe` at root
* Run `Launcher` in `vscode` - Shift + F2
* Each location of `AppData` and `UserProfile` and `Home` will be set to separated places
    * See `user` folder

## Update `VSCode`
* <b>Don't click `Gear` icon > `download` nor click `Help` > `Download update`</b>
* exit `vscode`
* move to `etc` folder
* run `update_vscode.cmd`

## Update others
* First, you should find download link from each websites
* Modify `download_url_???` in `setup/install.cmd`
* Remove existing target tool folder
* Remove `user` Folder or rename it for restore data
* Execute `setup/install.cmd` again

## Cleanup home, userprofile, tmp..
* run `etc/clear_garbage.cmd`
