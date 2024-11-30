Class extends _CLI

Class constructor()
	
	Super:C1705(Is macOS:C1572 ? "xmlsec1" : "xmlsec"; cs:C1710._xmlsec_Controller)
	
Function _terminate()
	
	This:C1470.controller.terminate()
	
Function version() : Text
	
	$command:=This:C1470.escape(This:C1470.executablePath)
	$command+=" --version"
	
	This:C1470.controller.execute($command)
	This:C1470.controller.worker.wait()
	
	$version:=Split string:C1554(This:C1470.data; This:C1470.EOL; sk trim spaces:K86:2 | sk ignore empty strings:K86:1)
	
	return $version.length#0 ? $version[0] : ""