;;; Environment
dir := A_MyDocuments "\RequestForPayment\expenses_yearly23"
bookFile := "\CashAccount-Receipts_2301-2312-.xlsx"
sheetName := "Books"

;;; processes
xlObj := ComObjActive("Excel.Application")

path := dir bookFile
bk := xlObj.Workbooks.Open(path)

bk.Sheets(sheetName).Select
xlObj.Visible := true

ExitApp
