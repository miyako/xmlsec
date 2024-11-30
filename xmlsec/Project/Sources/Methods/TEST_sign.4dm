//%attributes = {}
#DECLARE($params : Object)

If ($params=Null:C1517)
	
/*
async calls must be performed in a worker or form
*/
	
	CALL WORKER:C1389(1; Current method name:C684; {})
	
Else 
	
	var $xmlsec : cs:C1710.xmlsec
	
	$xmlsec:=cs:C1710.xmlsec.new(cs:C1710._xmlsec_Controller)
	
	$xml:=File:C1566("/DATA/wifi.xml")
	$xml:=OB Class:C1730($xml).new($xml.platformPath; fk platform path:K87:2)
	
	$pem:=File:C1566("/DATA/private.pem")
	$pem:=OB Class:C1730($pem).new($pem.platformPath; fk platform path:K87:2)
	
	$out:=Folder:C1567(fk desktop folder:K87:19).file("signed-wifi.xml")
	
	$xmlsec.perform(["--sign"; "--output"; $out; "--privkey-pem"; $pem; "--pwd"; "1234"; "--lax-key-search"; $xml])
	
/*
https://www.aleksey.com/xmlsec/faq.html
*/
	
End if 