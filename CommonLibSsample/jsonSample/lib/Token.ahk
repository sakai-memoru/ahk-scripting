class Token {
    __New(type, value) {
        this.type := type
        this.value := value
    }

    static TextToken(textBuffer) {
        return this("T", textBuffer)
    }

    static VariableToken(variable) {
        return this("V", variable)
    }

    static EscapedVariableToken(variable) {
        return this("&", variable)
    }

    static SectionToken(variable, childTokens) {
        t := this("S", variable)
        t.tokens := childTokens

        return t
    }

    static InvertedToken(variable, childTokens) {
        t := this("I", variable)
        t.tokens := childTokens

        return t
    }

    static ElementToken() {
        return this("E", ".")
    }

    static StringifyTokens(tokens, indentLevel := 0) {
        output := ""

        for _, t in tokens {
            v := RegExReplace(t.value, "`n", "\n")
            v := RegExReplace(v, " ", ".")

            Loop indentLevel
                output .= " "

            output .= Format("[{1:} : {2:}]", t.type, v) . "`n"

            if (t.tokens)
                output .= this.StringifyTokens(t.tokens, (indentLevel+2))
        }

        return output
    }

    ToString() {
        v := RegExReplace(this.value, "`n", "\n")
        v := RegExReplace(v, " ", ".")
        return this.Type " - " v

    }
}
