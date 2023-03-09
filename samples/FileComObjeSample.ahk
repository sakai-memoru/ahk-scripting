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

;;; local functions
TryLoopFile(dir, likeopt := "*.*"){
    retAry := Array()
    Loop Files, dir likeopt
        WriteLine(dir A_LoopFileName)
        retAry.Push(dir A_LoopFileName)
    
    return retAry
}


Perform(val){
    ; Perform func
    WriteLine("Hello," val  "!!")
    path := "..\journals\"
    opt := "*.md"
    ary := TryLoopFile(path, opt)
    Loop ary 
        WriteLine(ary[A_Index])
    ; end func
    return
}

;;; main
Main(){
; main
WriteLine("// ----------- // start")
name := "AutoHotKey"
Perform(name) ;
WriteLine("// ----------- // end .")

; end func
return
}

;;; entry point
;~ ::/run::{
;~ Main()
;~ }

Main
ExitApp
