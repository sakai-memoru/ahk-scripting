#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode 'Input'
SetTitleMatchMode 2
SetCapsLockState "AlwaysOff"

snp_get_ahk_dir(){
    return A_MyDocuments "\AutoHotKey"
}


SNP_HandlerOpenExplorer(Item, *){
    target := snp_get_ahk_dir()
    Run target
}

SNP_HandlerOpenMenu(Item, *){
}

SNP_DisplayMenu(){
    myMenu := Menu()
    myMenu.Add "AHK dir", SNP_HandlerOpenExplorer
    myMenu.Add
    myMenu.Add "Menu", SNP_HandlerOpenMenu
    myMenu.Show
}


;;; local functions
SNP_Perform(val){
	OutputDebug(Format("val is {1}.`n", val))
    SNP_DisplayMenu()
    return
}

;;; main
Main(){
; main
name := A_ScriptName
SNP_Perform(name) ;

; end func
return
}

Main
ExitApp
