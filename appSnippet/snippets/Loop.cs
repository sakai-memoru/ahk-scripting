## Loop 

```
colours := {red: 0xFF0000, blue: 0x0000FF, green: 0x00FF00}
; The above expression could be used directly in place of "colours" below:
str := ""
for k, v in colours.OwnProps()
    str .= k "=" v "`n"

OutputDebug(Format("{1}`n", str))

```

```
blue=255
green=65280
red=16711680
```