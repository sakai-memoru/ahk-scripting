#Requires AutoHotkey v2.0
; sandbox for trying codes
; 
SetWorkingDir A_ScriptDir
#Include ".\common.ahk"

;;; local functions
GetArray(){
    ary := Array()
    ary.Push A_Now
    ary.Push A_YYYY
    ary.Push A_MM
    ary.Push A_DD
    ary.Push A_MMMM
    ary.Push A_MMM
    ary.Push A_DDDD
    ary.Push A_DDD
    ary.Push A_Hour
    ary.Push A_Min
    ary.Push A_Sec
    ary.Push A_MSec
    return ary
}

GetArrayFromLiteral(){
    ary := [ 
        A_Now, 
        A_YYYY,
        A_MM,
        A_DD,
        A_MMMM,
        A_MMM,
        A_DDDD,
        A_DDD,
        A_Hour,
        A_Min,
        A_Sec,
        A_MSec
    ]
    
    return ary
}

LoopArray(ary){
    Loop ary.Length {
        WriteLine(A_Index " - " ary[A_Index])
    }
    return
}

LoopArray2(ary){
    For idx, val in ary {
        WriteLine(idx " - " val)
    }
    return
}

Perform(val){
    ; Perform func
    ; WriteLine("Hello," val  "!!")
    ;; ---------------------------------
    ary := GetArray()
    ; WriteLine(ary[1])
    ; LoopArray(ary)
    ary2 := GetArrayFromLiteral()
    ; LoopArray2(ary2)
    ; WriteLine(ary2[2])
    
    ary3 := Array()
    ary3.Capacity := 3
    ary3.Default := "N/A"
    WriteLine(Type(ary2))
    WriteLine(ary2)
    ; end func
    return
}

;;; main
Main(){
; main
WriteLine("// ----------- // start")
name := "AutoHotKey"
Perform(name) ;
WriteLine("// ----------- // end .")

; end func
return
}

;;; entry point
;~ ::/run::{
;~ Main()
;~ }

Main
ExitApp
