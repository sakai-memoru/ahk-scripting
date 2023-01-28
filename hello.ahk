;;; global variables
debug_mode := true
; debug_mode := false

;;; debug method
WriteLine(val){
; debug method
if debug_mode 
{
  dtm_str := FormatTime(, "yy-MM-dd HH:mm:ss")
  send dtm_str " > " val "{Enter}"
}
; end_func
return
}

;;; Main
Main() {
; main process
WriteLine("// ---------- // start")
name := "AutoHotKey"
WriteLine("Hello, " name "{!}{!}")
WriteLine("// ---------- // end..")
; end_func
return
}

;;; entry point
::/run main:: {
; hotstrings = /run main
Main
}

