#Requires AutoHotkey v2.0
; array sample for trying codes

global Console := FileOpen("*","w")

Perform()
{
	ary := ["one", "two", "three"]

	;; ◎-Loop iterate with idx
	Loop ary.Length
		Console.WriteLine(ary[A_Index])

	;; ◎-Loop iterate with index, value
	For idx, val in ary
		Console.WriteLine(idx " - " val)

	;; ◎-Loop iterate with index, value
	For val in ary
		Console.WriteLine(A_Index " - " val)
}

Main()
{
Console.WriteLine("// --------------------------- start .")
Perform()
Console.WriteLine("// --------------------------- end ...")
}

; ---------------------------- entry point
Main
