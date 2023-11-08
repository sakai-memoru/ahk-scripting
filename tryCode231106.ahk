; #Include %A_MyDocuments%\AutoHotKey\Config\Settings.ahk ; Regularly Use EnvGet
#Warn

LOCAL_FUNC_LBL:
open_explorer(dir_name) {
	OutputDebug(Format("My path is {1}. `n", dir_name))
	run "explorer" A_Space dir_name
}


ENTRY_POINT_LBL:
{
str := "`:`:`\mydir"
OutputDebug(Format("`"{1}`"`n", str))
;;Hotstring("`:`:mydir", open_explorer(Config().MY_DIR)) ;; - FIXME not work
;%str%::{ ;; - can not use a variable

colours := {red: 0xFF0000, blue: 0x0000FF, green: 0x00FF00}
; The above expression could be used directly in place of "colours" below:
str := ""
for k, v in colours.OwnProps()
    str .= k "=" v "`n"

OutputDebug(Format("{1}`n", str))

;~ ::\mydir::{
	;~ open_explorer(Config().MY_DIR)
	;~ }
}
