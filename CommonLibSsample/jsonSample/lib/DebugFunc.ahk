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
            Console.WriteLine(Format("{1} > {2}", dtm_str, val))
        } else if (Type(val) = "Integer") {
            Console.WriteLine(Format("{1} > {2:x}", dtm_str, val))
        } else if (Type(val) = "Float") {
            Console.WriteLine(Format("{1} > {2:.5f}", dtm_str, val))
        } else {
            WriteDebug(val.ToString()) ;; Dump class object ,
                                       ;; necessary class def has a ToString instance method
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


