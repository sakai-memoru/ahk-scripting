global debug_mode := true
global Console := FileOpen("*", "w")

;;; -------------------------------- Debug functions
WriteDebug(val){
    dtm_str := FormatTime(, "yy-MM-dd_HH:mm:ss")
    if debug_mode
        if (Type(val) = "Array") {
            WriteArrayDebug(val)
        } else if (Type(val) = "Map") {
            WriteMapDebug(val)
        } else if (Type(val) = "Object") {
            WriteObjectDebug(val)
        } else if (Type(val) = "String") {
            Console.WriteLine(dtm_str  " > "  val)
        } else {
            WriteDebug(val.ToString())
        }


}

WriteArrayDebug(ary){
    Loop ary.Length
        WriteDebug(ary[A_Index])

    return
}

WriteMapDebug(mp){
    For ky, val in mp
        WriteDebug(ky " : " val)

    return
}

WriteObjectDebug(obj){
    For nm, val in obj.OwnProps()
        WriteDebug(nm " : " val)

    return
}


