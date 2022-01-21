# VSCode Portable working set

Portable `vscode` creation working set on `MS-Windows 10, 11 / amd64` machine

After installation, just zip & unzip then use it at public windows pc

[![pcbangstudio](https://img.youtube.com/vi/fNm3Kd-UASM/0.jpg)](https://www.youtube.com/watch?v=fNm3Kd-UASM)

## Install
* Download this repository
* Remove `.git` folder in root of downloaded repository if exist
* Run `cmd` then move to unziped repository path
    ```sh
    $ cd setup
    $ install.cmd
    ```
* You can break the job by press `Ctrl+C` then resume by run above `install.cmd` again

## Usage
* Run `vscode` - execute `run.exe` at root
* Install [Launcher](https://marketplace.visualstudio.com/items?itemName=ilich8086.launcher) then, Press `Shift+F2`
* Each env path - see `/user` for `AppData`, `UserProfile`, `Home`
* Git first commit error `user.name` `user.email` - See and set `/tools/utils/mycmd/iam*.cmd`

## Update `VSCode`
* <b>Do not click `Gear` icon > `download` nor click `Help` > `Download update`</b>
* exit `vscode` and run `/etc/update_vscode.cmd`

## Update others
* First, you should find download link from each websites
* Modify `download_url_..` in `setup/install.cmd`
* Remove existing target tool folder
* Remove `/user` Folder or rename it for restore data
* Execute `/setup/install.cmd` again

## Cleanup home, userprofile, tmp..
* run `/etc/clear_garbage.cmd`

## Manage settings
* See [setting-sample](https://github.com/edp1096/setting-sample)

## Block vscode update notice and trust check
* Add following lines to `settings.json`
```json
"update.mode": "none",
"security.workspace.trust.enabled": false,
```
