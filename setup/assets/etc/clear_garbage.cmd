rem https://stackoverflow.com/a/97896
cd ..

rd /s /q .\user\userprofile\appdata\roaming\*
del /s /q .\user\userprofile\appdata\roaming\*
rd /s /q .\user\userprofile\appdata\Local\*
del /s /q .\user\userprofile\appdata\Local\*

rd /s /q .\user\gocache\*
del /s /q .\user\gocache\*

rd /s /q .\tools\vscode\data\user-data\Backups
rd /s /q .\tools\vscode\data\user-data\blob_storage
rd /s /q .\tools\vscode\data\user-data\CachedExtensions

rd /s /q .\tools\vscode\data\user-data\clp

rd /s /q .\tools\vscode\data\user-data\GPUCache
rd /s /q .\tools\vscode\data\user-data\logs

rd /s /q .\tools\vscode\data\user-data\User\globalStorage
rd /s /q .\tools\vscode\data\user-data\User\workspaceStorage

rd /s /q .\tools\vscode\data\user-data\webrtc_event_logs

del /s /q .\tools\vscode\data\user-data\Cookies
del /s /q .\tools\vscode\data\user-data\Cookies-journal
del /s /q .\tools\vscode\data\user-data\"Network Persistent State"
del /s /q .\tools\vscode\data\user-data\languagepacks.json
del /s /q .\tools\vscode\data\user-data\machineid
del /s /q .\tools\vscode\data\user-data\storage.json
