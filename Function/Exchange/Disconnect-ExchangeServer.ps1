Function Disconnect-ExchangeServer{
    Param(
        [Parameter(Mandatory = $True, Position = 1)][String]$ExchangeServer
    )
	Get-PSSession | Where-Object computerName -Like $ExchangeServer | Remove-PsSession -Confirm:$false
}