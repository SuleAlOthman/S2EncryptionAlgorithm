# S2EncryptionAlgorithm
S2 Encrypton Algorithm for text in php, swift and java

## Examples

###### PHP

tested on php 7

```
$text = 'Any text ..';
$enc = S2Encrypt($text, 'password');
$dec = S2Decrypt($enc, 'password');
```

###### Swift

tested on swift 4 and later

```
var Sv2 = S2v2()
var str = "Any text .."
var enc = Sv2.S2Encrypt(Text: str,Password: "password")
var dec = Sv2.S2Decrypt(Text: enc,Password: "password")
```

###### Java

tested on java 8

```
String msg = "Any text ..";
S2v2 Sv2 = new S2v2();
String enc = Sv2.S2Encrypt(msg, "password");
String dec = Sv2.S2Decrypt(enc, "password");
```
