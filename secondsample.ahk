;;; Global variables
; global Console := FileOpen("*", "w")

;;; local functions
Perform(val := "AHK"){
    Msgbox "Hello, " val  " !!"
    return
}

;;; main
Main(){
; main
name := A_ScriptName
Perform(name) ;

return
}

;;; ----------------------- entry point

#/::{
;; ------ hotkey
Main()
}

::/Main::{
;; ------ hotstrings
Main()
}


