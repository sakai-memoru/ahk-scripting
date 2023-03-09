#Requires AutoHotkey v2.0
; sandbox for trying codes

global Console := FileOpen("*","w")

GetMessage(name)
{
  msg := "Hello, " name "!!"
  return msg
}

Main()
{
name := "AHK on Mery"
msg := GetMessage(name)
Console.WriteLine(msg)
}

; ---------------------------- entry point
Main
