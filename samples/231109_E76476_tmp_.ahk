#Requires AutoHotkey v2.0
; sandbox for trying codes

GetMessage(name)
{
  msg := "Hello, " name "!!"
  return msg
}

Main()
{
name := "AHK on Mery"
msg := GetMessage(name)
OutputDebug(Format("{1}`n", msg))
}

; ---------------------------- entry point
Main
ExitApp