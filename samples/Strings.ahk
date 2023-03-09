#Requires AutoHotkey v2.0
; sandbox for trying codes

global Console := FileOpen("*","w")

StringLength(str)
{
;;; string length
return StrLen(str)
}

StringUpper(str)
{
;;; string length
return StrUpper(str)
}

Main()
{
;global name := "AHK on Mery"
Console.WriteLine(";; ----------------------- // start .")
str := "Hello, ANK!!"
Console.WriteLine(Format("'{1}' is '{2}'.", str, Type(str)))
num := StringLength(str)
Console.WriteLine(Format("'{1}' is {2}.", str, num))
stm := StringUpper(str)
Console.WriteLine(Format("{1}", stm))
Console.WriteLine(";; ----------------------- // end ...")
}

; ---------------------------- entry point
Main
