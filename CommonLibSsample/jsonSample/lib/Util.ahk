class Util {

    static IsWhitespaceChar(char) {
        if (StrLen(char) > 1) {
            length := StrLen(char)

            msg := Format("Invalid param: {1:}, expected 1 char, received {2:} chars"
                , char, length)

            throw Error(msg, -1)
        }

        return (char == A_Space || char == A_Tab || char == "`r")
    }

    static IsEmptyLine(value) {
        for _, char in StrSplit(value) {
            if (!this.IsWhitespaceChar(char) && char != "`n") {
                return false
            }
        }

        return true
    }

    static ContainsLinebreak(value) {
        ; Works on both \n and `n
        return RegExMatch(value, "\n")
    }

    static SliceArray(array, fromInclusive, toExclusive := false) {
        newArray := []
        toExclusive := (toExclusive) ? toExclusive : array.Length()

        i := fromInclusive
        while (i <= array.Length()) {
            if (toExclusive < i)
                break

            newArray.Push(array[i])
            i++
        }

        return newArray
    }

    /**
     * Stolen from the JSON lib created by Coco
     * https://github.com/cocobelgica/AutoHotkey-JSON
     */
    static IsArray(value) {
        isArray := 0

        ; Check indexes until they stop
        ; being numbers. Pretty clever.
        for k in value {
            isArray := (k == A_Index)
        }
        until (!isArray)

        return isArray
    }

    static IsEmptyObject(value) {
        return IsObject(value) && !value.NewEnum().Next()
    }

    static TrimFloat(floatValue) {
        ; We do what we must to pass
        ; the damn tests!
        floatValue := RTRim(floatValue, 0)
        decimalCount := StrLen(StrSplit(floatValue, ".")[2])
        floatValue := Round(floatValue, decimalCount)

        return floatValue
    }

    static IsFloat(value) {
        if value is float
            return true

        return false
    }
}
