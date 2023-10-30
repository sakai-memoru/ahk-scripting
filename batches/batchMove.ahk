#Requires AutoHotkey v2.0
#SingleInstance Force

;;; -------------------------------- Include CONF
#Include %A_ScriptDir%\config\settings.ahk
#Include %A_ScriptDir%\Mustache.ahk

;;; -------------------------------- Global variables
global debug_mode := Config.DEBUG_MODE
global Console := FileOpen("*", "w")
global input_dir := A_ScriptDir Config.INPUT_DIR
global backup_dir := A_ScriptDir Config.BACKUP_DIR


;;; -------------------------------- Debug functions
WriteDebug(val){
    dtm_str := FormatTime(, "yy-MM-dd_HH:mm:ss")
    if debug_mode
        if (Type(val) = "Array") {
            WriteArrayDebug(val)
        } else if (Type(val) = "Map") {
            WriteMapDebug(val)
        } else if (Type(val) = "Object") {
            WriteObjectDebug(val)
        } else {
            Console.WriteLine(dtm_str  " > "  val)
        }


}

WriteArrayDebug(ary){
    Loop ary.Length
        Console.WriteLine(ary[A_Index])

    return
}

WriteMapDebug(mp){
    For ky, val in mp
        Console.WriteLine(ky " : " val)

    return
}

WriteObjectDebug(obj){
    For nm, val in obj.OwnProps()
        Console.WriteLine(nm " : " val)

    return
}


;;; -------------------------------- local functions
GetFiles(dir, likeopt := "*.*"){
    retAry := Array()
    Loop Files, (dir likeopt)
        ; WriteDebug(dir A_LoopFileName)
        retAry.Push(dir A_LoopFileName)

    return retAry
}

MoveFiles(ary, to_dir) {
    Loop ary.Length
        FileMove(ary[A_Index], to_dir)

    return
}

Process(val){
    ; Perform func
    ; WriteDebug("Hello, " val  " !!!")
    ; WriteDebug(input_dir)
    ; WriteDebug(backup_dir)
    ary := Array()
    ary := GetFiles(input_dir, "*.txt")

    WriteDebug(ary)
    MoveFiles(ary, backup_dir)

    ;; -------------------------
    clrs := Map()
    clrs["Red"] := "ff0000"
    clrs["Green"] := "00ff00"
    clrs["Blue"] := "0000ff"
    WriteDebug(clrs)
    ;;
    template := "{{desc}}, {{name}} !!"
    dataObject := {name: "AHK and Mustache", desc: "Hello"}
    ;WriteDebug(compiledTemplate)
    WriteDebug(Type(dataObject))
    WriteDebug(dataObject)

    ; This template can be stored and re-used for better performance
    compiledTemplate := Mustache.Compile(template)

    ; Render in the data
    renderedTemplate := Mustache.Render(compiledTemplate, dataObject)
    WriteDebug(renderedTemplate)

    ; Let's change the data
    dataObject.data := "user"

    renderedTemplate := Mustache.Render(compiledTemplate, dataObject)
    WriteDebug(renderedTemplate)

    ; end func
    return
}

;;; -------------------------------- main
Main(){
WriteDebug("// ----------- // start")
; main
name := "AutoHotKey"
Process(name) ;

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
