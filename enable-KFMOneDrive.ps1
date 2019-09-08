
$path = "HKLM:\SOFTWARE\Policies\Microsoft\"
$onedrivepath = "HKLM:\SOFTWARE\Policies\Microsoft\OneDrive"
$testpath = Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\OneDrive"
if ($testpath -eq $false) {
    Install-Module AzureAD -Scope CurrentUser -Force
    Import-Module AzureAD -Force 
    $login = Connect-AzureAD
    $tentantid = ($login.TenantId.Guid)
    Disconnect-AzureAD
    New-Item -Path "$path" -Name OneDrive -Force 
    New-ItemProperty -Path "$onedrivepath" -Name "KFMOptInWithWizard" -Value "$tentantid" -Force
} else {
    Write-Host "registry key already exists, nothing's done!" -ForegroundColor Yellow
}