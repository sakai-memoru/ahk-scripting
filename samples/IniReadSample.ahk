#Requires AutoHotkey v2.0
; sandbox for trying codes
; 
SetWorkingDir A_ScriptDir
global Console := FileOpen("*","w")

GetConf(){
    aryScriptName := StrSplit(A_ScriptName, ".")
    iniName := aryScriptName[1] ".ini"
    ; Console.WriteLine(iniName)
     APP_NAME := IniRead(iniName, "conf", "APP_NAME")
    LOG_FILE_FMT := IniRead(iniName, "conf", "LOG_FILE")
    LOG_FILE_FMT2 := IniRead(iniName, "conf", "LOG_FILE2")
    TEMPLATE_FILE := IniRead(iniName, "conf", "TEMPLATE_FILE")
    log_file := FormatTime(, LOG_FILE_FMT) "_.log"
    Console.WriteLine(log_file)
    Console.WriteLine(APP_NAME)
    Console.WriteLine(LOG_FILE_FMT2)
    Console.WriteLine(TEMPLATE_FILE)
    ;;global LogFile := FileOpen(log_file,"w")
    return TEMPLATE_FILE

}

GetTemplate(template_name){
    ; template_buf := FileRead(template_name, "RAW")
    ; template_str := StrGet(template_buf,"UTF-8")
    template_str := FileRead(template_name)
    A_Clipboard := template_str
}

; ---------------------------- local function

; ---------------------------- subroutine
Perform()
{
    template_name := GetConf()
    GetTemplate("../" template_name)
    return
}

; ---------------------------- main
Main()
{
global name := "AHK"
Console.WriteLine("Hello, " name "!!")
; Send("{#} " "Hello, " name "{!}{!}" "{Enter}")
Perform()
}

; ---------------------------- entry point
Main
ExitApp
