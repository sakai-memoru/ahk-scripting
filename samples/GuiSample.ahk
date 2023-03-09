#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode 'Input'

;;; Global variables
global debug_mode := true
global Console := FileOpen("*", "w")
global MyGui := Gui()

;;; Debug functions4
WriteLine(val){
    dtm_str := FormatTime(, "yy-MM-dd_HH:mm:ss")
    if debug_mode
        Console.WriteLine(dtm_str  " > "  val)
        ; Send dtm_str  " > "  val  "{Enter}"
	    ; Send dtm_str . " > " . val . "{Enter}"
}

DisplayGui() {
    MyGui.Title := "AHK GUI Sample"
    MyGui.Name := "SampleGui"
    MyGui.Add("Text",, "Enter your name")
    MyGui.Add("Edit", "w150 vName")
    MyGui.Add("Button",, "OK").OnEvent("Click", SayHello)
    MyGui.Show()
}

SayHello(*) {
    Saved := MyGui.Submit()
    MsgBox "Hello " Saved.Name
    ExitApp
}

;;; local functions
Perform(val){
    ; Perform func
    WriteLine("Hello," val  "!!")
    DisplayGui
    Return
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
Main
;ExitApp
