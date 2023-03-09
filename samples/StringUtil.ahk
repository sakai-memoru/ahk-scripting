class StringUtil
{
    static Chomp(str, num:=1){
        retStr := ""
        trimmed := RTrim(str)
        len := StrLen(trimmed)
        retStr := Substr(trimmed, 1, len - num)
        return retStr
    }
}
