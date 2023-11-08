#Requires AutoHotkey v2.0
#SingleInstance Force

;; https://github.com/TheArkive/JXON_ahk2
;;
;;; -------------------------------- Include CONF
#Include %A_ScriptDir%\config\settings.ahk
#Include %A_ScriptDir%\lib\DebugFunc.ahk
#Include <json>


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

    ToString() {
        return "{ name: " this.name " , postno: " this.postno " , age: " this.age " }"
    }
}

;;; -------------------------------- local functions
Process(val){
    ; Perform func
    ; WriteDebug("Hello, " val  " !!!")
    customer := User("Hot Mura", "123-4567", 33)
    ; WriteDebug(Type(customer))
    ; WriteDebug(customer)

    jsonsrc := '{ "name": "Hot JS" , "postno": "123-3333" , "age": 44 }'
    obj := jxon_load(&jsonsrc)
    ; WriteDebug(Type(obj))
    ; WriteDebug(obj)

    dict := Map("name", "Hot JS Map", "postno", "123-5555", "age", 55 )
    ; WriteDebug(Type(dict))
    ; WriteDebug(dict)
    outStr := jxon_dump(dict, 2)
    ; WriteDebug(outStr)

    ; outStr2 := jxon_dump(customer, 2)
    ; WriteDebug(outStr2)

    ;;
    ary := Array()
    ary.Push("One")
    ary.Push("Two")
    ary.Push("Three")
    ary.Push(4)
    jsonstr_ary := jxon_dump(ary, 0)
    WriteDebug(jsonstr_ary)

    WriteDebug(100)
    WriteDebug(10.005)

    ary2 := ["One","Two","Three","Four", "Five"]
    jsonstr_ary2 := jxon_dump(ary2, 0)
    WriteDebug(jsonstr_ary2)


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
