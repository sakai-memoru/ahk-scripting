#Requires AutoHotkey v2.0
; sandbox for trying codes

;;; coding sample -------------------------------------
;;;  - Loop Parse
;;;  - Join Array or Params
;;;  - Get YYMMDD

GetMessage(name)
{
  msg := "Hello, " name "!!"
  return msg
}

GetYYMMDD()
{
  return SubStr(A_YYYY, 3,2) "/" A_MM "/" A_DD "(" A_DDD ")"
}

Sum(params*)
{
  ret := 0
  for idx, param  in params
  {
    ret += param
  }
  return ret
}

Join(sep, params*) {
    for index,param in params
        str .= param . sep
    return SubStr(str, 1, -StrLen(sep))
}

returnByRef(&val1, &val2, val3) ; FIXME
{
    val1 := "A"
    val2 := 100
    %val3% := 3.3  ; % is used because & was omitted.
    return
}

Main()
{
name := "AHK on Mery"
msg := GetMessage(name)
OutputDebug(Format("{1}`n", msg))

OutputDebug(Format("{1}`n", A_AhkPath))
OutputDebug(Format("{1}`n", A_AhkVersion))
; OutputDebug(String(Object()))

Colors := "red,green,blue"
Loop parse, Colors, ","
{
  OutputDebug "Color number " A_Index " is " A_LoopField "`n"
}

; Initialize string to search.
Colors := "red,green|blue;yellow|cyan,magenta"
; Initialize counter to keep track of our position in the string.
Position := 0

Loop Parse, Colors, ",|;"
{
  ; Calculate the position of the delimiter at the end of this field.
  Position += StrLen(A_LoopField) + 1
  ; Retrieve the delimiter found by the parsing loop.
  Delimiter := SubStr(Colors, Position, 1)

  OutputDebug  "Field: " A_LoopField " - Delimiter: " Delimiter "`n"

}

total1 := Sum(1,2,3,4,5)
OutputDebug Format("total1={1}`n",total1)

ary := [1,2,3,4,5, 6,7,8]
total2 := Sum(ary*)
OutputDebug Format("total2={1}`n",total2)


v1 := 0
v2 := 1
v3 := 2
returnByRef &v1, &v2, &v3

OutputDebug Format("{1}-{2}-{3:.3f}`n",v1, v2, v3)

OutputDebug Join("`t", "one", "two", "three") "`n"
substrings := ["one", "two", "three"]
OutputDebug Join("-", substrings*)  "`n"

OutputDebug GetYYMMDD()

}

; ---------------------------- entry point
Main
ExitApp