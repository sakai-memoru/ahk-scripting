class Util
{
	static GetContent(path){
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

	static GetGuid(){
		tlObj := ComObject("Scriptlet.TypeLib")
		return tlObj.GUID
	}

	static GetTempFileName(){
		; retPath := A_Temp "\tmp_" FormatTime( , "yyMMdd_HHmmss") ".ahk"
		; retPath := A_ScriptDir "\tmp_" FormatTime( , "yyMMdd_HHmmss") ".ahk"
		dtmstr := FormatTime( , "yyMMdd_")
		retPath := A_WorkingDir "\" dtmstr Substr(Util.GetGuid(), 2, 6) "_tmp.ahk"
		OutputDebug(retPath "`n")
		return retPath

	}

}