* Program kopiuje magazyn i kontrahenta z katalogu Legos do Legosnew
* oraz zmienia stawki 22 na 23, 7 na 8, 3 na 5
public zvat_22:=23,zvat_07:=8,zvat_03:=5
clear
zz=.t.
@ 5,10 say "Program przygotuje bazy do pracy z nowymi stawkami VAT."
set cursor on
@ 7,10 say "Wykona† ? " get zz
read
if .not. zz
  clear
  Return
endif 
set cursor off
select 1
if file("new.dbf")
  use new
  if byl=1
    @ 10,10 say "Transmisja jest czynno˜ci¥ jednorazow¥ i byˆa ju¾ wykonana w dniu"
	@ 11,10 say data
	@ 14,10 say "Skontaktuj si© z serwisem - tel. 604 219 784"
	@ 15,10 say "Naci˜nij dowolny klawisz"
	inkey(0)
	close
	return
  endif
else
  @ 10,10 say "Brak pliku  NEW.DBF - operacja przerwana."
	@ 14,10 say "Skontaktuj si© z serwisem - tel. 604 219 784"
	@ 15,10 say "Naci˜nij dowolny klawisz"
	inkey(0)  
endif 

clear

run new_bat

clear
@ 5,10 say "Zamieä stwk©: "
set cursor on
@ 8,10 say "22% na " get zvat_22
@ 10,10 say " 7% na " get zvat_07
@ 12,10 say " 3% na " get zvat_03
read
set cursor off
select 2
use 001mag\magaz
do while .not. eof()
  
  do case
    case mstawka=22
	  @ 20,5 say mnaz + " " + mkod + " ze stawki 22% na "+str(zvat_22)
	  replace mstawka with zvat_22
	case mstawka=7
	  @ 20,5 say mnaz + " " + mkod + " ze stawki 7% na "+str(zvat_07)
	  replace mstawka with zvat_07
	case mstawka=3
	  @ 20,5 say mnaz + " " + mkod + " ze stawki 3% na "+str(zvat_03)	
	  replace mstawka with zvat_03    
  endcase
  skip
enddo


select 1

*append blank
replace byl with 1, data with date()

close all
clear
@ 10,10 say "Operacja zakoäczona poprawnie."
inkey(2)
clear
RETURN