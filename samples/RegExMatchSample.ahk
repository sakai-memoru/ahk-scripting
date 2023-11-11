#Requires AutoHotkey v2.0
; sandbox for trying codes

GetMessage(name)
{
  msg := "Hello, " name "!!"
  return msg
}

;;; ---------------------------------------------
;;; @param haystack: String
;;; @param needleRegex: String - RegEx format
;;; @return [Match] - Array of Match Object
;;;
GetRegExMatches(haystack, needleRegex)
{
  retMatches := Array()
  pos := 1
  ; matchObj := RegExMatchInfo()
  ;
  While (pos != 0)
  {
    mpos := RegExMatch(haystack, needleRegex, &matchObj, pos)

    if (mpos != 0){
      retMatches.Push(matchObj)
      pos := mpos + StrLen(matchObj[])
      ; OutputDebug(matchObj[] "`n")
    } else {
      pos := 0
    }
  }
  return retMatches
}

Main()
{
name := "AHK on Mery"
msg := GetMessage(name)
;OutputDebug(Format("{1}`n", msg))
OutputDebug ";; ------------------------------------ start.`n"

templ := "Hi, %%Greeting%%, %%name%% !!"
regex := "%%Greeting%%"

ary := GetRegExMatches("xxabc12xyz", ".x")

for obj in ary {
  ; OutputDebug A_Index " - " ary[A_Index][] "`n"
  OutputDebug A_Index " - " obj[0] "`n"
}

loop ary.Length
{
  OutputDebug A_Index " - " ary[A_Index][] "`n"
}

;OutputDebug matchObj.Len "-"  matchObj.Name[1] "`n"
;findPos := RegExMatch(templ, regex, &matchObj)
;MsgBox RegExMatch("xxxabc123xyz", "abc.*xyz")
;OutputDebug(Format("Motch count = {1}`n", matchObj.Count))

FoundPos := RegExMatch("Hello Michiganroad", "(\w+)", &matchObj)
;OutputDebug matchObj.Len "-"  matchObj.Name[1] "-" matchObj.Name[2] "`n"

OutputDebug ";; ------------------------------------ end...`n"
}

; ---------------------------- entry point
Main
;ExitApp