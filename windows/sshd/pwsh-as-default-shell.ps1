$NewItemPropertyParams = @{
    Path         = "HKLM:\SOFTWARE\OpenSSH"
    Name         = "DefaultShell"
    Value        = (Get-Command pwsh).Path
    PropertyType = "String"
    Force        = $true
}
New-ItemProperty @NewItemPropertyParams
