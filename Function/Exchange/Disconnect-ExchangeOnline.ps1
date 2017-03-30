Function Disconnect-ExchangeOnline {
	Get-PSSession | Where-Object ComputerName -like "outlook.office365.com" | Remove-PsSession -Confirm:$false
}