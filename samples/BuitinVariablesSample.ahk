#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode 'Input'

;;; Global variables
global debug_mode := true
global Console := FileOpen("*", "w")

;;; Debug functions
WriteLine(val){
    dtm_str := FormatTime(, "yy-MM-dd_HH:mm:ss")
    if debug_mode
        Console.WriteLine(dtm_str  " > "  val)
        ; Send dtm_str  " > "  val  "{Enter}"
	    ; Send dtm_str . " > " . val . "{Enter}"
}


GetScriptProperties() {
    obj := {
        A_WrokingDir : A_WorkingDir, 
        A_ScriptDir : A_ScriptDir, 
        A_ScriptName : A_ScriptName, 
        A_ScriptFullPath : A_ScriptFullPath, 
        A_ScriptHwnd : A_ScriptHwnd, 
        A_LineFile : A_LineFile ,
        A_ThisFunc : A_ThisFunc 
    }
    return obj
}

ObjDump(obj) {
    ;; ◎-Loop
    For nm, val in obj.OwnProps() {
        WriteLine(nm " - " val)
    }
}


;;; local functions
Perform(val){
    ; Perform func
    WriteLine("// ----------- // start")
    WriteLine("Hello, " val  " !!")
    obj := GetScriptProperties()
    ObjDump(obj)
    ; end func
    WriteLine("// ----------- // end .")
    return
}

;;; main
Main(){
; main
name := A_ScriptName
Perform(name) ;

; end func
return
}

Main
ExitApp
