#Requires AutoHotkey v2.0
; sandbox for trying codes
;
SetWorkingDir A_ScriptDir
global Console := FileOpen("*","w")

class C_String
{
    static Chomp(str, num:=1){
        retStr := ""
        trimmed := RTrim(str)
        len := StrLen(trimmed)
        retStr := Substr(trimmed, 1, len - num)
        return retStr
    }
}


; ---------------------------- subroutine
Perform()
{
	str := "abcdefg"
    Console.WriteLine(C_String.Chomp(str))
    Console.WriteLine(C_String.Chomp(str, 3))
	return
}

; ---------------------------- main
Main()
{
Console.WriteLine("// --------------------------- start .")
Perform()
Console.WriteLine("// --------------------------- end ...")
}

; ---------------------------- entry point
Main
ExitApp
