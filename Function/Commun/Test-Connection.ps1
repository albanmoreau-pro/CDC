function Test-Connection {
    Param(
        [Parameter(Mandatory = $True, Position = 1)][String]$Server,
        [Parameter(Mandatory = $True, Position = 2)][String]$Port

    )
    $Socket = New-Object Net.Sockets.TcpClient		# Create a new Net.Sockets.TcpClient object to use for testing open TCP ports
    $ErrorActionPreference = 'SilentlyContinue' 	# Suppress error messages
    $Socket.Connect($Server,$Port)			 	    # Try to connect
    $ErrorActionPreference = $MyEAP					# Make error messages visible again
    if ($Socket.Connected) {
        Return $True
        LogMessage "Info : Test Connectivy server $Server : $Port = SUCCESS"
        # Close the socket.
        $Socket.Close()
        $Socket = $null								# Reset the variable. Apparently necessary.
    }else {
        Return $false
        LogMessage "ERROR : Test Connectivy server $Server : $Port = ERROR" "ERROR"
        $Socket = $null								# Reset the variable. Apparently necessary.
        Exit
    }
}