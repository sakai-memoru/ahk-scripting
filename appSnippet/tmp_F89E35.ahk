;;; -------------------------------- Global variables
global debug_mode := true
global Console := FileOpen("*", "w")

;;; -------------------------------- Debug functions
WriteDebug(val){
    dtm_str := FormatTime(, "yy-MM-dd_HH:mm:ss")
    if debug_mode
        Console.WriteLine(dtm_str  " >[DEBUG] "  val)
        ; Send dtm_str  " > "  val  "{Enter}"
	    ; Send dtm_str . " > " . val . "{Enter}"
}

WriteInfo(val){
    dtm_str := FormatTime(, "yy-MM-dd_HH:mm:ss")
    Console.WriteLine(dtm_str  " >[INFO] "  val)
}

StrStartWith(str, prefix){
    lenPrefix := StrLen(prefix)
    temp := SubStr(str,1, lenPrefix)
    return (temp = prefix)
}

;;; -------------------------------- local functions
Perform(val){
    ; Perform func
    ; WriteDebug("Hello, " val  " !!")
    str := "``````Hello"
    prefix := "``````"
    bool := StrStartWith(str, prefix)
    ; WriteDebug(bool)
    ;;
    filePath := ".\snippets\loop.cs"
    ;;
    cnt := 0
    ary := Array()
    Loop Read filePath
    {
        if(StrStartWith(A_LoopReadLine, prefix)){
            cnt := cnt + 1
        }
        if (cnt = 1) {
            if(!StrStartWith(A_LoopReadLine, prefix)){
                ; WriteDebug(Format("{1} - {2}", cnt, A_LoopReadLine))
                ary.Push(A_LoopReadLine)
            }
        } else if (cnt >= 2) {
            break
        }
    }

    out := ""
    For itm in ary {
        out := out . itm . "`n"
    }
    WriteDebug(out)
    ; end func
    return
}

;;; -------------------------------- main
Main(){
; main
WriteInfo("// ----------- // start")
name := "AutoHotKey"
Perform(name) ;
WriteInfo("// ----------- // end .")

; end func
return
}

;;; -------------------------------- entry point
Main
ExitApp
