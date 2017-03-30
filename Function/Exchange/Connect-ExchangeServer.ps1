Function Connect-ExchangeServer {
    Param(
        [Parameter(Mandatory = $True, Position = 1)]$UserCredential,
        [Parameter(Mandatory = $True, Position = 2)][String]$ExchangeServer,
        [Parameter(Mandatory = $True, Position = 2)][String]$AuthMethode = "Basic"
    )
    [string]$URL = "http://$ExchangeServer/PowerShell/"
	$sessionOption = New-PSSessionOption -SkipRevocationCheck -IdleTimeout 600000
    If ($AuthMethode -eq "Basic"){
        $ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $URL -Authentication Basic -Credential $UserCredential -SessionOption $sessionOption -AllowRedirection
    } ElseIf ($AuthMethode -eq "Kerberos") {
        $ExchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $URL -Authentication Kerberos -SessionOption $sessionOption -AllowRedirection
    }
	Import-PSSession $ExchangeSession -AllowClobber
    Start-Sleep 5
	return $?
}