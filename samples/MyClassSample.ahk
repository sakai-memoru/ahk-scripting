#Requires AutoHotkey v2.0
; sandbox for trying codes
; 
SetWorkingDir A_ScriptDir
#Include ".\common.ahk"
#Include ".\C_String.ahk"

global debug_mode := true


Perform(val){
    
    WriteLine("Hello, " C_String.Chomp(val, 4) "!!")
    
}

;;; main
Main(){
; main
WriteLine("// ----------- // start .")
name := "AutoHotKey"
Perform(name) ;
WriteLine("// ----------- // end ...")

; end func
return
}

;;; entry point
Main
ExitApp
