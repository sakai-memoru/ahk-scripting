#Requires AutoHotkey v2.0
; sandbox for trying codes
;
SetWorkingDir A_ScriptDir
global Console := FileOpen("*","w")

; ---------------------------- local function
ExecuteCmd()
{
	ps1_path := "../pwsh-scripting/tryCode.ps1"
	cmd_str := "pwsh.exe"
	Run cmd_str A_Space ps1_path
	return
}


; ---------------------------- subroutine
Perform()
{
	;;ExecuteCmd
	name := "AutoHotKey"
	; Console.WriteLine("Hello, %%name%% !!")
	Console.WriteLine(Format("Hello, {1} !!", name))
	Console.WriteLine(Type(true))
	Console.WriteLine(Type(12))
	Console.WriteLine(Type(12.0))
	Console.WriteLine(Type('c'))
	Console.WriteLine(Type("String"))
	Console.WriteLine(Type([]))
	Console.WriteLine(Type({}))
	Console.WriteLine(Type(Map()))
	Console.WriteLine(Type(Array()))



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
