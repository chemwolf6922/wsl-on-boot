
param (
    [string]$operation
)

$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument 'Start-Process -WindowStyle Hidden -FilePath "wsl.exe" -ArgumentList "sleep","infinity"'
$trigger = New-ScheduledTaskTrigger -AtLogOn -User $currentUser
$taskName = 'WslOnBootTask'

if ($operation -eq 'install') {
    Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -User $currentUser -Force
} elseif ($operation -eq 'uninstall') {
    Unregister-ScheduledTask -TaskName $taskName -Confirm:$false
} else {
    Write-Host "Invalid parameter. Use 'install' or 'uninstall'."
}
