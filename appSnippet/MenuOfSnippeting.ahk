#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode 'Input'
SetTitleMatchMode 2
SetCapsLockState "AlwaysOff"

#include %A_ScriptDir%\localScripts\SnippetingScript.ahk ; include Util
#include %A_ScriptDir%\config\settings.ahk

snp_get_ahk_dir(subdir := ""){
    baseDir := A_MyDocuments SNP_Config.MY_DIR
    if (subdir = ""){
        return baseDir
    } else {
        OutputDebug(baseDir subdir)
        return baseDir subdir
    }
}

snp_get_ahkrepo_dir(){
    return EnvGet("WORKSPACE") SNP_Config.MY_REPO
}

snp_get_template_path(key) {
    return SNP_Config.MY_DICT[key]
}

SNP_HandlerGetBatchTempl(Item, *){
    target := snp_get_template_path("batch")
    str := Util.GetContent(target)
    A_Clipboard := str
    tempPath := Util.GetTempFileName()
    FileAppend str, tempPath
    Sleep 10
    Run tempPath
}

SNP_HandlerGetFrontTempl(Item, *){
    target := snp_get_template_path("front")
    str := Util.GetContent(target)
    A_Clipboard := str
    tempPath := Util.GetTempFileName()
    FileAppend str, tempPath
    Sleep 10
    Run tempPath
}

SNP_HandlerGetMenuTempl(Item, *){
    target := snp_get_template_path("menu")
    str := Util.GetContent(target)
    A_Clipboard := str
    tempPath := Util.GetTempFileName()
    FileAppend str, tempPath
    Sleep 10
    Run tempPath
}

SNP_HandlerOpenExplorer(Item, *){
    target := snp_get_ahk_dir()
    Run target
}

SNP_HandlerOpenSnippetDir(Item, *){
    target := snp_get_ahk_dir(SNP_Config.MY_DICT["snippets"])
    Run target
}

SNP_HandlerExplorerLib(Item, *){
    target := snp_get_ahk_dir(SNP_Config.MY_DICT["lib"])
    Run target
}

SNP_HandlerOpenGitHub(Item, *){
    target := snp_get_ahkrepo_dir()
	Run "github.bat" A_Space target
}

SNP_HandlerExplorerReference(Item, *){
    target := SNP_Config.MY_REFSITE
	Run target
    Sleep 100
}

SNP_HandlerOpenHelp(Item, *){
    ahkexe_dir := ""
    SplitPath(A_AhkPath,,&ahkexe_dir)
	Run ahkexe_dir SNP_Config.MY_DICT["helpfile"]
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
    myMenu.Add "Help", SNP_HandlerOpenHelp
    myMenu.Add "References", SNP_HandlerExplorerReference
    myMenu.Add "Template", SNP_HandlerOpenSubmenu
    myMenu.Add "Snippets", SNP_HandlerOpenSnippetDir
    myMenu.Show
}


;;; local functions
SNP_Perform(val){
	; OutputDebug(Format("val is {1}.`n", vsal))
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
