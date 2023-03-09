#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode 'Input'

;;; Global variables
global debug_mode := true
global Console := FileOpen("*", "w")

;;; Debug functions
WriteLine(val){
    dtm_str := FormatTime(, "yy-MM-dd_HH:mm:ss")
    if debug_mode
        Console.WriteLine(dtm_str  " > "  val)
        ; Send dtm_str  " > "  val  "{Enter}"
	    ; Send dtm_str . " > " . val . "{Enter}"
}

HandlerOpenVisa(Item, *){
    Run 'chrome.exe "https://www.smbc-card.com/mem/index.jsp"'
}

HandlerOpenJcb(Item, *){
    Run 'chrome.exe "https://my.jcb.co.jp/Login"'
}

HandlerOpenMsbc(Item, *){
    Run 'chrome.exe "https://www.smbc.co.jp/"'
}

HandlerOpenMizuho(Item, *){
    Run 'chrome.exe "https://www.mizuhobank.co.jp/retail/products/direct/index.html"'
}

HandlerOpenAmazon(Item, *){
    Run 'msedge.exe "https://www.amazon.co.jp/-/en/gp/css/order-history?ref_=nav_orders_first"'
}

HandlerOpenPaypal(Item, *){
    Run 'chrome.exe "https://www.paypal.com/signin?country.x=JP&locale.x=en_US&langTgl=en"'
}

DisplayMenu(){
    myMenu := Menu()
    myMenu.Add "Mizuho", HandlerOpenMizuho
    myMenu.Add "MSBC", HandlerOpenMsbc
    myMenu.Add "VISA", HandlerOpenVisa
    myMenu.Add "JCB", HandlerOpenJcb
    myMenu.Add  
    myMenu.Add "Amazon", HandlerOpenAmazon
    myMenu.Add "Paypal", HandlerOpenPayPal
    myMenu.Show
}


;;; local functions
Perform(val){
    ; Perform func
    DisplayMenu() 
    ; end func
    return
}

;;; main
Main(){
; main
WriteLine("// ----------- // start")
name := "AutoHotKey"
Perform(name) ;
WriteLine("// ----------- // end .")

; end func
return
}

;;; entry point
;~ ::/run::{
;~ Main()
;~ }

Main
ExitApp

