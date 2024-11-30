![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)
[![license](https://img.shields.io/github/license/miyako/xmlsec)](LICENSE)
![downloads](https://img.shields.io/github/downloads/miyako/xmlsec/total)

### Licensing

* the source code of this component is licensed under the [MIT license](https://github.com/miyako/cpdf/blob/master/LICENSE).
* see [aleksey.com](https://www.aleksey.com/xmlsec/) for the licensing of **xmlsec**.

# xmlsec

## dependencies.json

 ```json
{
    "dependencies": {
        "xmlsec": {
            "github": "miyako/xmlsec",
            "version": "*"
        }
    }
}
```

## Usage

```4d
#DECLARE($params : Object)

If ($params=Null)
	
	/*
		async calls must be performed in a worker or form
	*/
	
	CALL WORKER(1; Current method name; {})
	
Else 
	
	var $xmlsec : cs.xmlsec
	
	$xmlsec:=cs.xmlsec.new(cs._xmlsec_Controller)
	
	$xml:=File("/DATA/wifi.xml")
	$xml:=OB Class($xml).new($xml.platformPath; fk platform path)
	
	$pem:=File("/DATA/private.pem")
	$pem:=OB Class($pem).new($pem.platformPath; fk platform path)
	
	$out:=Folder(fk desktop folder).file("signed-wifi.xml")
	
	$xmlsec.perform(["--sign"; "--output"; $out; "--privkey-pem"; $pem; "--pwd"; "1234"; "--lax-key-search"; $xml])
	
	/*
		https://www.aleksey.com/xmlsec/faq.html
	*/
	
End if
```

## CLI Build

```
export LDFLAGS="-Llib/"
export LIBS="-llzma -liconv -lgcrypt -lcharset"  
./configure --enable-static-linking --without-gnutls --without-gcrypt
```
