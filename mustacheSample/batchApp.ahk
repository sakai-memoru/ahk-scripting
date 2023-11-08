#Requires AutoHotkey v2.0
#SingleInstance Force

;;; -------------------------------- Include CONF
#Include %A_ScriptDir%\config\settings.ahk
#Include %A_ScriptDir%\lib\Mustache.ahk
; #Include %A_ScriptDir%\lib\DebugFunc.ahk


;;; -------------------------------- Global variables
global input_dir := A_ScriptDir Config.INPUT_DIR
global backup_dir := A_ScriptDir Config.BACKUP_DIR
debug_mode := Config.DEBUG_MODE


;;; -------------------------------- sample class
Class User{
    __New(name, postno , age)
    {
        this.name := name
        this.postno := postno
        this.age := age
    }
}

;;; -------------------------------- local functions
Process(val){
    ; Perform func
    ; WriteDebug("Hello, " val  " !!!")
    customer := User("Hot Mura", "123-4567", 33)
    ; WriteDebug(Type(customer))
    ; WriteDebug(customer)

    ;;
    template := "Hi Hi {{desc}}, {{name}} !!" ;; --- Object
    ; WriteDebug(template)
    ;;
    dataObject := {name: "AHK and Mustache", desc: "Hello"}
    WriteDebug(Type(dataObject))
    WriteDebug(dataObject)


    ; This template can be stored and re-used for better performance
    compiledTemplate := Mustache.Compile(template)
    writeDebug(compiledTemplate)

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
