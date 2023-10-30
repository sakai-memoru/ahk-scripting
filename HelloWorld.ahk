#Requires AutoHotkey v2.0

;;; global variables
Console := FileOpen("*", "w")
debug_mode := true
; debug_mode := false

;;; debug method
WriteLine(val){
  ; debug method
  if debug_mode
  {
    dtm_str := FormatTime(, "yy-MM-dd HH:mm:ss")
    Console.WriteLine(dtm_str " > " val)
  }
  ; end_func
  return
}

;;; local functions

;;;
;;; GetMessage
;;; @param {string} name
;;; @return {string} message
;;;
GetMessage(name){
  ;;;
  message := "Hello, " name "!!"
  ;
  return message
}

Main(){
  ;;; Main function
  WriteLine("// ----------- // start")
  msg := GetMessage("AHK")
  WriteLine(msg)
  WriteLine(True)
  WriteLine("// ----------- // end .")
}

;;; entry point
Main()