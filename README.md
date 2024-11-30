# xmlsec

## CLI Build

```
export LDFLAGS="-Llib/"
export LIBS="-llzma -liconv -lgcrypt -lcharset"  
./configure --enable-static-linking --without-gnutls --without-gcrypt
```
