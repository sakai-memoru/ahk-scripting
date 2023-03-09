;;; Global variables
global Console := FileOpen("*", "w")

;;; Debug functions
WriteLine(val){
    dtm_str := FormatTime(, "yy-MM-dd_HH:mm:ss")
    if debug_mode
        ; Console.WriteLine(Type(val))
        if(IsObject(val)){
            if(type(val) = "Array"){
                Console.WriteLine(dtm_str  " > "  ArrayToString(val) )
            } else if(type(val) = "Map") {
                Console.WriteLine(dtm_str  " > "  MapToString(val) )
            } else if(type(val) = "Object") {
                Console.WriteLine(dtm_str  " > "  ObjectToString(val) )
            }
        } else {
            if(IsNumber(val)) {
                Console.WriteLine(dtm_str  " > "  val)
            } else if(type(val) = "string") {
                Console.WriteLine(dtm_str  " > "  SetQuate(val))
            }
        }
}

ArrayToString(ary){
    joined := Join(", ", ary*)
    strAry := "[ " joined " ]"
    return strAry
}

Join(sep, params*) {
    str := ""
    for index,param in params
        str .= SetQuate(param)  sep
    
    return SubStr(str, 1, -StrLen(sep))
}

JoinRaw(sep, params*) {
    str := ""
    for index,param in params
        str .= param  sep
    
    ; WriteLine(str)
    return SubStr(str, 1, -StrLen(sep))
}

MapToString(map){
    strMap := ""
    ary := []
    For ky, val in map
    {
        appended := ky ":" SetQuate(val)
        ary.Push appended
    }
    joined := JoinRaw(", ", ary*)
    strMap := "{ " joined " }"
    return strMap
}

ObjectToString(obj){
    strObj := ""
    ary := []
    For prop, val in obj.OwnProps()
    {
        appended := prop ":" SetQuate(val)
        ary.Push appended
    }
    joined := JoinRaw(", ", ary*)  ; Set params as ary*
    strObj := "{ " joined " }"
    return strObj
}

;;; Commons
SetQuate(val){
    if IsNumber(val) {
        return val
    } else if IsObject(val) {
        return val
    } else {
        return "`"" val "`""
    }
}

StrChomp(str, num:=1){
    retStr := ""
    trimmed := RTrim(str)
    len := StrLen(trimmed)
    retStr := Substr(trimmed, 1, len - num)
    return retStr
}

StrChop(str, num:=1){
    retStr := ""
    trimmed := LTrim(str)
    len := StrLen(trimmed)
    retStr := Substr(trimmed, num+1, len)
    return retStr
}

StartsWith(str, prefix, CaseSense:="Off"){
    len := StrLen(prefix)
    ; WriteLine(Substr(str, 1, len))
    result := StrCompare(Substr(str, 1, len), prefix, CaseSense)
    if result = 0 {
        return true
    } else {
        return false
    }
}

EndsWith(str, suffix, CaseSense:="Off"){
    len := StrLen(suffix)
    ; WriteLine(Substr(str, StrLen(str)-len+1, StrLen(str)))
    result := StrCompare(Substr(str, StrLen(str)-len+1, StrLen(str)), suffix, CaseSense)
    if result = 0 {
        return true
    } else {
        return false
    }
}
