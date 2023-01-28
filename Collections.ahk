;;; Global variables
debug_mode := true

;;; Debug functions
WriteLine(val)
{
dtm_str := FormatTime(, "yy-MM-dd_HH:mm:ss")
if debug_mode
	Send dtm_str  " > "  val  "{Enter}"
	; Send dtm_str . " > " . val . "{Enter}"
}

;;; local functions
Perform(val){
WriteLine("Hello," val  "{!}{!}")

}

;;; Array sample
WriteArray(ary){
;
Loop ary.Length
	WriteLine(A_Index " : " ary[A_Index])

; end func
return
}

;;; main
Main(){
;
WriteLine("// ----------- // start")
ary :=[1,2,3,"Four",5]
ary.Push(66)
WriteArray ary
WriteLine("// ----------- // end .")
; end func
return
}

;;; entry point
::/run::{
Main()
}
