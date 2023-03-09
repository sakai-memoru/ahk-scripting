#Include "%A_ScriptDir%\..\libs\JSON.ahk2"
; https://github.com/Chunjee/json.ahk

;#Include "%A_ScriptDir%\..\libs\JSON.ah2"
;#Include %A_ScriptDir%\..\libs\JSON_parse.ah2

global Console := FileOpen("*", "w")

Main(){
	json_str := FileRead("AutoHotkey_L releases.json")
	;obj := JSON_parse(json_str)
	; obj := JSON_load(json_str)
	; obj := JSON.Load(json_str)
	obj := JSON.parse(json_str)
	Console.WriteLine(obj[1]["assets"][1]["browser_download_url"])
	Console.WriteLine(obj[2]["assets"][1]["browser_download_url"])
	;json_str2 := JSON_dump(obj)
	;json_str2 := JSON.Dump(obj)
	json_str2 := JSON.stringify(obj)
	Console.WriteLine(json_str2)

}

;;; --------------------- entry point
Main