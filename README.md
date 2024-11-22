# Start wsl on boot and keep it alive
According to this [comment](https://github.com/microsoft/WSL/issues/9667#issuecomment-1440651201). Wsl will shutdown when there is no active session. This is really annoying for anyone trying to host services from wsl. Plus wsl will not start on boot.

This script registers a task triggered when the user logs on. And run `wsl sleep infinity` in the background. This should start wsl and keep it running.
## Usage
* Install (register)
```Powershell
./WslOnBoot.ps1 install
```
* Uninstall (un-register)
```Powershell
./WslOnBoot.ps1 uninstall
```

## For laptop users
There are some power saving options not exposed (AFAIK) to PowerShell. If you would like wsl to boot on battery. You need to
1. Open `Task Scheduler`
2. Find the task `WslOnBoot` under `Task Scheduler Library`
3. Right click on the task and open `Properties`
4. Uncheck `Start the task only if the computer is on AC power` under `Conditions`

## If you cannot execute scripts in powershell
Please refer to [Set-ExecutionPolity](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.4)

Or just yolo it 
```Powershell
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process
```
