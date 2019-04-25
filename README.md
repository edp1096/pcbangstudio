# VSCode Portable

Portable `vscode` creation toolset for using on `MS-Windows` `amd64` machine at public place

## Install
* Download this repository
* Run `cmd` then move to unziped repository path
    ```sh
    $ cd setup
    $ install.cmd
    ```

## Usage
* Run `vscode` - execute `run.exe` at root
* Run `Launcher` in `vscode` - Shift + F2

Each location of `AppData` and `UserProfile` and `Home` will be set to new place when run `vscode`
 - See `user` folder

## Update `VSCode` - Don't click `Gear` icon > `download` or `Help` > `Download update`
* exit `vscode`
* move to `etc` folder
* run `update_vscode.cmd`
