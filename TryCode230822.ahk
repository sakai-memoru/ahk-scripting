#Requires AutoHotkey v2.0
; sandbox for trying codes
;
SetWorkingDir A_ScriptDir
global Console := FileOpen("*","w")

; ---------------------------- local function
Execute()
{
    A_Clipboard := "Hello, AHK Clipboard"
	return
}


; ---------------------------- subroutine
Perform()
{
	Execute
	A_Clipboard := StrReplace(A_Clipboard,"AHK", "AutoHotKey")
	A_Clipboard .= ". Today is fine."
	Console.WriteLine(A_Clipboard)
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
