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
	ExecuteCmd
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
