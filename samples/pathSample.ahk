;;; -------------------------------- Global variables
global debug_mode := true
global Console := FileOpen("*", "w")

;;; -------------------------------- Debug functions
WriteDebug(val){
    dtm_str := FormatTime(, "yy-MM-dd_HH:mm:ss")
    if debug_mode
        Console.WriteLine(dtm_str  " > "  val)
        ; Send dtm_str  " > "  val  "{Enter}"
	    ; Send dtm_str . " > " . val . "{Enter}"
}

;;; -------------------------------- local functions
Perform(val){
    ; Perform func
	userDir := ""
    WriteDebug(A_MyDocuments)
	SplitPath(A_MyDocuments, , &userDir)
	picsDir := userDir "\Pictures"
    Run picsDir
    ; end func
    return
}

;;; -------------------------------- main
Main(){
; main
WriteDebug("// ----------- // start")
name := "AutoHotKey"
Perform(name) ;
WriteDebug("// ----------- // end .")

; end func
return
}

;;; -------------------------------- entry point
;~ ::/run::{
;~ Main()
;~ }

Main
ExitApp
