
MYHOT_LBL:
{	; Win Key
	#y::{
		hello()
		return
	}
	+#y::{
		;Goto HELLO_LBL
		Goto("HELLO_LBL")
		;
		HELLO_LBL:
		{
			; Popup a message
			MsgBox("Hello, world!!!!")
			return
		}
	}
}

hello() {
	; Popup a message
	MsgBox("Hello, world!!")
	return
}



