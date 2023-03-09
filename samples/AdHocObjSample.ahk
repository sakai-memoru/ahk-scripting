#Requires AutoHotkey v2.0
; sandbox for trying codes

global Console := FileOpen("*","w")

SetObject(name)
{
obj := {}
obj.name := name
obj.Hello := Hello

Hello(this) {
  Console.WriteLine("Hello, " this.name "!!")
}

return obj
}

Main()
{
;global name := "AHK on Mery"
Console.WriteLine(";; ----------------------- // start .")

myObj := SetObject("AHK")
myObj.Hello()
Console.WriteLine(";; ----------------------- // end ...")
}

; ---------------------------- entry point
Main
