Function Connect-ExchangeOnline {
	param ( $UserCredential )
	$exoSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
	Import-PSSession $exoSession -AllowClobber
    Start-Sleep 5
	return $?
}