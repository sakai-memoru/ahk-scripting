#Requires AutoHotkey v2.0
; sandbox for trying codes

GetMessage(name)
{
  msg := "Hello, " name "!!"
  return msg
}

Main()
{
name := "AHK on Mery"
msg := GetMessage(name)
OutputDebug(Format("{1}`n", msg))

FileMenu := Menu()
FileMenu.Add("Script Icon", MenuHandler)
FileMenu.Add("Suspend Icon", MenuHandler)
FileMenu.Add("Pause Icon", MenuHandler)
FileMenu.SetIcon("Script Icon", A_AhkPath, 2) ; 2nd icon group from the file
FileMenu.SetIcon("Suspend Icon", A_AhkPath, -206) ; icon with resource ID 206
FileMenu.SetIcon("Pause Icon", A_AhkPath, -207) ; icon with resource ID 207
MyMenuBar := MenuBar()
MyMenuBar.Add("&File", FileMenu)
MyGui := Gui()
MyGui.MenuBar := MyMenuBar
MyGui.Add("Button",, "Exit This Example").OnEvent("Click", (*) => WinClose())
MyGui.Show

MenuHandler(*) {
    ; For this example, the menu items don't do anything.
}

}

; ---------------------------- entry point
Main
;ExitApp