#SingleInstance Force

global Console := FileOpen("*", "w")
;global debug_mode := true
global debug_mode := false

;; name := "AHK"
;; Console.WriteLine(Format("Hello, {1}!!",name))
;; Console.WriteLine("Hello, " . name .  "!!!!")
OutProcessHeader()
{
WriteDebug("// ahk ver " A_AhkVersion)
WriteDebug("// Path " A_ScriptFullPath)
WriteDebug("// Execute " A_ScriptName " ...")
}

WriteDebug(str)
{
;;;
if debug_mode
{
  dtm := FormatTime(, "yy-MM-dd ddd HH:mm")
  Console.WriteLine(dtm " > [debug] " str)
}
;;;
}

WriteInformation(str)
{
;;;
dtm := FormatTime(, "yy-MM-dd ddd HH:mm")
Console.WriteLine(dtm " > [info]  " str)
;;;
}

FileAppendSample()
{
  file_name := "sample.txt"
  file_folder := A_ScriptDir "\output"

}

Perform()
{
str := "--- sample process ---"
WriteDebug(str)

}

;;; -----------------------------------// main process
Main()
{
  OutProcessHeader
  WriteInformation("// -------------// Main started ...")
  Perform()
  WriteInformation("// -------------// Main ended .....")
}

;;; -----------------------------------// entry point
Main