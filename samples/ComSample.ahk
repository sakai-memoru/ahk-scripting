#Requires AutoHotkey v2.0
;;; @file ComSample.ahk

;;; global variables
{
  global Console := FileOpen("*", "w")
  global debug_mode := true
  ; debug_mode := false
}


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
;;; Perform
;;;
Perform(){
  ;;; https://www.autohotkey.com/boards/viewtopic.php?style=17&t=66677
  ;;; https://qiita.com/cti1650/items/c0d2de73be45e4e4d10f
  dict := ComObject("Scripting.Dictionary")

  dict.Add("key1", "value A")
  dict.Add("key2", "value B")
  for key in dict
    WriteLine(key " : " dict[key])
  ;
  WriteLine("Length : " dict.Count)
  return
}

Main(){
;;; Main function
WriteLine("// ----------- // start")
Perform()
WriteLine("// ----------- // end .")
}

;;; entry point
Main()
