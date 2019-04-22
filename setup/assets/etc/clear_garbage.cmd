rem 삭제 참고 - https://stackoverflow.com/a/97896
cd ..

rd /s /q .\home\userprofile\appdata\roaming\*
del /s /q .\home\userprofile\appdata\roaming\*
rd /s /q .\home\userprofile\appdata\Local\*
del /s /q .\home\userprofile\appdata\Local\*

rd /s /q .\tools\gocache\*
del /s /q .\tools\gocache\*

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
