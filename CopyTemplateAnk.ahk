#Requires AutoHotkey v2.0
; sandbox for trying codes
;
SetWorkingDir A_ScriptDir
global Console := FileOpen("*","w")

GetTemplate(template_name){
    template_str := FileRead(template_name)
    A_Clipboard := template_str
}

; ---------------------------- local function

; ---------------------------- subroutine
Perform()
{
    TEMPLATE_DIR := "./templates/"
    TEMPLATE_FILE := "template_ahk.ahk"
    GetTemplate(TEMPLATE_DIR TEMPLATE_FILE)
    return
}

; ---------------------------- main
Main(){
Console.WriteLine("// --------------- start .")
Perform()
Run "Mery"
Sleep 1000
Send "^v"
Console.WriteLine("// --------------- end ...")
}

; ---------------------------- entry point
Main
ExitApp
