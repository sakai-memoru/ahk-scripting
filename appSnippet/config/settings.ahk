class SNP_Config
{
	static MY_DIR := "\AutoHotKey"
	static MY_REPO := "\ahk-scripting"
	static MY_TEMPLDIR := A_ScriptDir "\templates"
	static MY_REFSITE := "https://www.autohotkey.com/docs/v2/"

	;; intensionaly change an extension into "vbs" from "ahk"
	static MY_DICT := Map(
        "batch", SNP_Config.MY_TEMPLDIR "\template_batch.vbs" ,
        "menu", SNP_Config.MY_TEMPLDIR "\template_menu.vbs" ,
        "front", SNP_Config.MY_TEMPLDIR "\template.vbs",
		"helpfile", "\AutoHotkey.chm",
        "snippets", "\snippets",
        "lib", "\lib",
    )


}
