#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode 'Input'
SetTitleMatchMode 2
SetCapsLockState "AlwaysOff"

#include ".\localScripts\SnippetingScript.ahk"

snp_get_ahk_dir(subdir := ""){
    baseDir := A_MyDocuments "\AutoHotKey"
    if (subdir = ""){
        return baseDir
    } else {
        OutputDebug(baseDir subdir)
        return baseDir subdir
    }
}

snp_get_ahkrepo_dir(){
    return EnvGet("WORKSPACE") "\ahk-scripting"
}

snp_get_template_path(key) {
    templdir := A_ScriptDir "\templates"
    ;;
    ;; intensionaly change an extension into "vbs" from "ahk"
    dict := Map(
        "batch", templdir "\template_batch.vbs" ,
        "menu", templdir "\template_menu.vbs" ,
        "front", templdir "\template.vbs"
    )
    return dict[key]
}

SNP_HandlerGetBatchTempl(Item, *){
    target := snp_get_template_path("batch")
    str := GetContent(target)
    A_Clipboard := str
    tempPath := GetTempFileName()
    FileAppend str, tempPath
    Sleep 10
    Run tempPath
}

SNP_HandlerGetFrontTempl(Item, *){
    target := snp_get_template_path("front")
    str := GetContent(target)
    A_Clipboard := str
    tempPath := GetTempFileName()
    FileAppend str, tempPath
    Sleep 10
    Run tempPath
}

SNP_HandlerGetMenuTempl(Item, *){
    target := snp_get_template_path("menu")
    str := GetContent(target)
    A_Clipboard := str
    tempPath := GetTempFileName()
    FileAppend str, tempPath
    Sleep 10
    Run tempPath
}

SNP_HandlerOpenExplorer(Item, *){
    target := snp_get_ahk_dir()
    Run target
}

SNP_HandlerOpenSnippetDir(Item, *){
    target := snp_get_ahk_dir("\snippets")
    Run target
}

SNP_HandlerExplorerLib(Item, *){
    target := snp_get_ahk_dir("\lib")
    Run target
}

SNP_HandlerOpenGitHub(Item, *){
    target := snp_get_ahkrepo_dir()
	Run "github.bat" A_Space target
}

SNP_HandlerExplorerReference(Item, *){
    target := "https://www.autohotkey.com/docs/v2/"
	Run target
    Sleep 100
}


SNP_HandlerOpenSubmenu(Item, *){
    mySubMenu := Menu()
    mySubMenu.Add "front", SNP_HandlerGetFrontTempl
    mySubMenu.Add "batch", SNP_HandlerGetBatchTempl
    mySubMenu.Add "menu", SNP_HandlerGetMenuTempl
    mySubMenu.Show

}


SNP_DisplayMenu(){
    myMenu := Menu()
    myMenu.Add "AHK dir", SNP_HandlerOpenExplorer
    myMenu.Add "AHK libdir", SNP_HandlerExplorerLib
    myMenu.Add "Repo dir", SNP_HandlerOpenGitHub
    myMenu.Add
    myMenu.Add "References", SNP_HandlerExplorerReference
    myMenu.Add "Template", SNP_HandlerOpenSubmenu
    myMenu.Add "Snippets", SNP_HandlerOpenSnippetDir
    myMenu.Show
}


;;; local functions
SNP_Perform(val){
	; OutputDebug(Format("val is {1}.`n", val))
    ; OutputDebug(Format("GUID is {1}.`n", GetGuid()))
    SNP_DisplayMenu()
    return
}

;;; main
SNP_Main(){
; main
name := A_ScriptName
SNP_Perform(name) ;

; end func
return ; - redundant
}

;; -------------------------------------------------- entry point
SNP_Main
ExitApp
