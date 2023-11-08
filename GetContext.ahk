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
GetPath(){
	return "G:\workspace\ahk-scripting\templates\Template_batch.ahk"
}

Perform(val){
    ; Perform func
    templPath := GetPath()
	try {
		templstr := FileRead(templPath)
		Console.WriteLine(templstr)
	}
	catch as Err
	{
		Console.WriteLine(Format("Can't open {1}"), templPath)
		Console.WriteLine(Format("{1}"), Err.Message)
	}



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
