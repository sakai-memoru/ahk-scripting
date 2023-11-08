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
        } else {
            Console.WriteLine(dtm_str  " > "  val)
        }


}

WriteArrayDebug(ary){
    Loop ary.Length
        Console.WriteLine(ary[A_Index])

    return
}

WriteMapDebug(mp){
    For ky, val in mp
        Console.WriteLine(ky " : " val)

    return
}

WriteObjectDebug(obj){
    For nm, val in obj.OwnProps()
        Console.WriteLine(nm " : " val)

    return
}


