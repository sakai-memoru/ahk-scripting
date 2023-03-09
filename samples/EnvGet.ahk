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
Perform(){
  ; Perform func
  workspace_folder := EnvGet("TEMP")
  WriteLine(workspace_folder)
  ; end func
  return
}

;;; main
Main(){
  ; main
  WriteLine("// ----------- // start")
  Perform()
  WriteLine("// ----------- // end .")
  
  ; end func
  return
}

;;; entry point
Main()
