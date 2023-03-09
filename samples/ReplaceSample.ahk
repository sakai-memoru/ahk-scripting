#Requires AutoHotkey v2.0
; sandbox for trying codes
; 
SetWorkingDir A_ScriptDir
#Include ".\common.ahk"

global debug_mode := true

;;; local functions
; ReplaceAll(str, targetted, replaced){
;     retStr := StrReplace(str, targetted, replaced,, &Count)
;     return retStr
; }

GetDateMap(){
    hash := Map()
    hash["yyyy"] := A_YYYY
    hash["yy"] := Substr(A_YYYY,3,2)
    hash["MM"] := A_MM
    hash["dd"] := A_DD
    hash["MMMM"] := A_MMMM
    hash["MMM"] := A_MMM
    hash["ddd"] := A_DDD
    hash["dddd"] := A_DDDD
    hash["hh"] := A_Hour
    hash["mm"] := A_Min
    hash["ss"] := A_Sec
    hash["sss"] := A_MSec
    return hash
}

GetDateObj(){
    obj := {
        A_YYYY: A_YYYY,
        A_YY: Substr(A_YYYY,3,2),
        A_MM: A_MM,
        A_DD: A_DD,
        A_MMMM: A_MMMM,
        A_MMM: A_MMM,
        A_DDD: A_DDD,
        A_DDDD: A_DDDD,
        A_HH: A_Hour,
        A_Min: A_Min,
        A_SS: A_Sec,
        A_SSS: A_MSec
    }
    return obj
}

Perform(val){
    ; Perform func
    str := "Hello, world!!"
    targetted := "o"
    replaced := "X"
    ; replacedStr := StrReplace(str, targetted, replaced)
    ; WriteLine(replacedStr)
    replacedStr := StrReplace(str, targetted, replaced,,,1)
    ; WriteLine(replacedStr)
    ;;
    map := GetDateMap()
    WriteLine(Type(map))
    ; WriteLine(map)
    ;WriteLine(map["yy"])
    ; For ky, val in map
    ; {
    ;     WriteLine(ky " - " val)
    ; }
        
    ;;
    obj := GetDateObj()
    WriteLine(Type(obj))
    ;WriteLine(ObjectToString(obj))
    ; 
    ; For nm, val in obj.OwnProps()
    ; {
    ;     WriteLine(nm " - " val)
    ; }
    
    WriteLine("`"" StrChop(" abcd ") "`"")
    WriteLine("`"" StrChop(" abcd ", 2) "`"")
    WriteLine("`"" StrChomp(" abcd ") "`"")
    WriteLine("`"" StrChomp(" abcd ", 2) "`"")
    WriteLine(StartsWith("strTemp", "str"))
    WriteLine(StartsWith("strTemp", "St2r"))
    WriteLine(EndsWith("strTemp", "Temp"))
    WriteLine(EndsWith("strTemp", "Temp2"))
    
    WriteLine(Type(debug_mode))
    WriteLine(debug_mode)
    WriteLine(Type(10))
    WriteLine(Type(10.0))
    ; end func
    return
}

;;; main
Main(){
; main
WriteLine("// ----------- // start .")
name := "AutoHotKey"
Perform(name) ;
WriteLine("// ----------- // end ...")

; end func
return
}

;;; entry point

;~ ::/run::{
;~ Main()
;~ }

Main
ExitApp
