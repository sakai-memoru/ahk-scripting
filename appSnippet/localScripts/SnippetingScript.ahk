GetContent(path){
	try {
		content := FileRead(path)
		str := content
		content := "" ; Free the memory
		return str
	}
	catch as Err
	{
		OutputDebug(Format("Can't open {1}", path))
		OutputDebug(Format("{1}", Err.Message))
	}
}

GetGuid(){
	tlObj := ComObject("Scriptlet.TypeLib")
	return tlObj.GUID
}

GetTempFileName(){
    ; retPath := A_Temp "\tmp_" FormatTime( , "yyMMdd_HHmmss") ".ahk"
    ; retPath := A_ScriptDir "\tmp_" FormatTime( , "yyMMdd_HHmmss") ".ahk"
    retPath := A_WorkingDir "\tmp_" Substr(GetGuid(), 2, 6) ".ahk"
    OutputDebug(retPath "`n")
    return retPath

}

