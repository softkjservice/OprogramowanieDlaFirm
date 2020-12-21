*******************************************************************************
* Funkcja wyswietla okienko (pw,pk-gorny lewy rog) i umozliwia wpisanie       *
* obowiazujacego hasla . Zwraca numer hasla (0 - zle haslo)                   *
*******************************************************************************

FUNCTION KJ_HASLO(pw,pk,ptryb)
local lhaslo:=space(10),lhas:=.f.,ldobre:=.f.
local okno:=savescreen(pw,pk,pw+4,pk+30),lcolor:=setcolor()
local licznik:=0
local haslo1:=space(10),haslo2:=space(10)
public zhas:=space(10),zpracownik:=space(30),thas[50]
public kjhas:="kjhas1957"
select &has_sel
*set default to shset
if.not.file("h_gos.dbf")
  h_gos_tworz()
endif
if.not.used()
  if.not.kj_use1("h_gos",.f.,3)
    return .f.
  endif	
endif

*haslo1=has_dekod(1,haslo1)
*haslo2=has_dekod(2,haslo2)
set cursor off
@ pw,pk clear to pw+3,pk+30
set color to gr+
@ pw,pk,pw+3,pk+30 BOX chr(176)
set color to
@ pw+1,pk+9 say "Podaj haslo" 
set color to w/n*
@ pw+1,pk+7 say "*" 
@ pw+1,pk+21 say "*" 
set color to


*if has=space(10).and.lastrec()=0.and.pnum=0
if has=space(10)
  @ pw+1,pk+2 say "        BRAK HASLA !        "
  inkey(2)
  restscreen(pw,pk,pw+4,pk+30,okno)
  return .t.
endif

do while .t.
  setcolor("W/N,N/N")
  lhaslo=space(10)
  @ pw+2,pk+2 get lhaslo
  read
  if lastkey()=27
	exit
  endif
  if lhaslo=kjhas
    lhas=.t.
	exit  
  endif
  lhaslo=kod(lhaslo)
  set color to
  go top
  if ptryb=1
    if has==lhaslo
	  ldobre=.t.
	endif
  else
    locate for has==lhaslo
	if found()
	  ldobre=.t.
	endif
  endif
  
  if ldobre
    lhas=.t.
	exit
  else
    @ pw+1,pk+2 say "Popraw !           "
    @ pw+1,pk+18 say "Proba nr."
    licznik=licznik+1	
    @ pw+1,pk+28 say licznik picture "9"	
    if licznik>2
      @ pw+1,pk+2 say "      BRAK DOSTEPU !        "
      @ pw+2,pk+2 say "Nacisnij dowolny klawisz    "
      inkey(0)
      keyboard chr(205)
      lhas=.f.
      exit
    endif	  
  endif
enddo
zhas_lad()
use
restscreen(pw,pk,pw+4,pk+30,okno)
setcolor(lcolor)
RETURN lhas


*******************************************************************************
* Funkcja obslugi hasla w oparciu o plik setki.dbf                            *
* Znaki przechowywane sa w fornie liczb ASCI                                  *
*******************************************************************************

FUNCTION HAS_NEW(pw,pk,pile)   &&pile: glebokosc okna dialogu
local ltytul:="     DEFINIOWANIE NOWEGO HASLA     ",lcolor:=setcolor(),lhas:=0
local ek,ek1,lhaslo:=space(10),lpotwierdz:=space(10),i:=0,llitera:=" "
local ltab[10],lnum_has:=0,lnum:=0,t[1],q[1]
set confirm off
t[1]:="pracownik"
q[1]:=""
save screen to ek
g_tlo()
kj_okno(pw,pk,pile,ltytul,3)
s_kom("<D>opisz   <P>opraw   <K>asuj   <Esc> - rezygnuj")
save screen to ek1
select &has_sel
if.not.used()
  if.not.kj_use("h_gos",.f.,3)
    set confirm on
    return .f.
  endif
endif
zpw=pw
zpk=pk
zpile=pile
zhas_1=has
dbedit(pw+2,pk+1,pw+pile-1,pk+33,t,"H_SH","",q,"")
set confirm on
use
restore screen from ek
return


FUNCTION H_SH()
local last:=lastkey(),lcolor:=setcolor(),recno,select:=select()
local ek,ek1,lhaslo:=space(10),lpotwierdz:=space(10),i:=0,llitera:=" "
local ltab[10],lnum_has:=0,lnum:=0,t[1],q[1]
do case
  case last=27
    return 0

	
  case chr(last)$"DdPp"
    recno=recno()
	setcolor( "b/W,W/b")
    @ zpw+2,zpk+2 say "Wpisz haslo zarzadcy :   "
    set color to   	
    CLOSE
    if.not.kj_haslo(zpw+4,zpk+2,1)  &&sprawdzenie uprawnien do modyfikacji
	  setcolor(lcolor)
	  return 0
	endif
if.not.used()
  if.not.kj_use("h_gos",.f.,3)
    return .f.
  endif	
endif
*	select &select
	go recno
    
	zhas_lad()
	setcolor( "b/W,W/W")
    @ zpw+1,zpk+1 clear to zpw+zpile-1,zpk+33
    @ zpw+2,zpk+2 say "Haslo prawidlowe.          " 
    @ zpw+5,zpk+2 say "Wpisz nowe haslo:          "

    for i=1 to 10
      setcolor( "b/W,W/W")
      @ zpw+6,zpk+i get llitera
      read
      do case
        case lastkey()=13
          exit	
	    case lastkey()=27
          restore screen from ek1
	      setcolor( "r/W,W/r")
	      @ zpw+4,zpk+2 say "Operacje zmiany hasla przerwano!"
          @ zpw+5,zpk+2 say "Obowiazuje halo dotychczasowe.  "
	      inkey(4)
          setcolor(lcolor)
          restore screen from ek
	      return nil
      endcase
      tone(1000,0.5)
      setcolor( "b/W,W/b")
      @ zpw+6,zpk+i say "*"  
      lhaslo=stuff(lhaslo,i,1,llitera)
    next
    @ zpw+2,zpk+2 say "                        "
    @ zpw+3,zpk+2 say "                        "
    tone(500,1)
    @ zpw+5,zpk+2 say "Potwierdz nowe haslo:"
    for i=1 to 10
      setcolor( "b/W,W/W")
      @ zpw+7,zpk+i get llitera
      read
      do case
        case lastkey()=13
          exit	
	    case lastkey()=27
          restore screen from ek1
	      setcolor( "r/W,W/r")
	      @ zpw+4,zpk+2 say "Operacje zmiany hasla przerwano!"
          @ zpw+5,zpk+2 say "Obowiazuje halo dotychczasowe.  "
	      inkey(4)
          setcolor(lcolor)
          restore screen from ek
	      return nil
      endcase
      tone(1000,0.5)
      setcolor( "b/W,W/b")
      @ zpw+7,zpk+i say "*"  
      lpotwierdz=stuff(lpotwierdz,i,1,llitera)
    next
    tone(500,1)
    if lhaslo=lpotwierdz
      @ zpw+7,zpk+14 say "Haslo potwierdzone."
      @ zpw+9,zpk+2 say "Nazwa hasla :      "
	  set cursor on
	  set color to
	  @ zpw+11,zpk+2 get zpracownik
	  read
	  set color to n/w,w/n
	  set cursor off
	  if lastkey()=27
	    if kj_gkom(12," Uwaga!","Przerwac operacje","",.t.,5)
		  return 0
		endif
	  endif
	  do case
	    case chr(last)$"Dd"
	      zhas=kod(lhaslo)
          kj_append(3)
	      h_replac() 
	      unlock	  		
	    case chr(last)$"Pp"
	      zhas=kod(lhaslo)
		  if reclock(5)
		    h_replac() 
	      else
	        kj_tkom(9," Uwaga ! ","Brak dostepu do rekordu.","Operacja poprawiania nie zostala wykonana.","Sprawdz innych uzytkownikow i ponow probe.",5)
	      endif 	
	      unlock	  				

	  endcase
	  inkey(2)
      restore screen from ek1
      @ zpw+2,zpk+2 say "Operacja zmiany hasla zakonczona"
      @ zpw+3,zpk+2 say "          pomyslnie.            "
      @ zpw+5,zpk+2 say "Obowiazuje nowe haslo !         "
      inkey(3) 
	  @ zpw+1,zpk+1 clear to zpw+zpile-1,zpk+33
      return 0
    else
      setcolor( "r/W,W/r")
      @ zpw+6,zpk+14 say "Uwaga!"
      @ zpw+7,zpk+11 say "Haslo nie potwierdzone."
      inkey(4)
      restore screen from ek1
      @ zpw+4,zpk+1 say "Operacja nie zakonczona pomyslnie"
      @ zpw+5,zpk+2 say "Obowiazuje halo dotychczasowe.  "
      inkey(3) 
      @ zpw+1,zpk+1 clear to zpw+zpile-1,zpk+33
	endif
    setcolor(lcolor)
    restore screen from ek	
*   	keyboard chr(205)
	return 0

  case chr(last)$"Kk"
    recno=recno()
	setcolor( "b/W,W/b")
    @ zpw+2,zpk+2 say "Wpisz haslo zarzadcy :   "
    set color to   	
    if.not.kj_haslo(zpw+4,zpk+2,1)  &&sprawdzenie uprawnien do modyfikacji
	  setcolor(lcolor)

	  return 0
	endif
*	select &select
select &has_sel
if.not.used()
  if.not.kj_use("h_gos",.f.,3)
    return .f.
  endif	
endif
	go recno
    if reclock(5)
      delete
    else
      kj_tkom(9," Uwaga ! ","Brak dostepu do rekordu.","Operacja kasowania nie zostala wykonana.","Sprawdz innych uzytkownikow i ponow probe.",5)
    endif 	
    unlock	  						  
*	keyboard chr(205)
    setcolor(lcolor)
    restore screen from ek	
	return 2
endcase
RETURN 1



*******************************************************************************
* Funkcja zamienia 10 kolejnych rekordow pliku setki na tekst. Pstart - numer *
* rekordu poczatkowego.Rekordy zawieraja litery w postaci liczb.              *
*******************************************************************************

FUNCTION HAS_DEKOD(pstart,ptxt)
local recno:=0, llitera:=" ", lpoz:=0 
ptxt:=space(10)
use setki new
go (1+(pstart-1)*10)
recno=recno()
do while recno()<recno+10
  lpoz=lpoz+1
  if.not.odsetki="   "
    llitera=chr(VAL(odsetki)-57)
  else
    llitera=" "
  endif
  ptxt=stuff(ptxt,lpoz,1,llitera)
	
  skip
enddo
close
*@ 4,0 say ptxt
*inkey(0)
RETURN ptxt

*******************************************************************************
* Funkcja zapisuje tekst w 10 kolejnych rekordach pliku setki poczawszy od    *
* numeru 1+(pstart-1)*10                                                      *
*******************************************************************************

FUNCTION HAS_KOD(pstart,ptab)
local recno:=0, llitera:=" ", lpoz:=1 
use setki new
go 1+(pstart-1)*10
recno=recno()
do while recno()<recno+10
  replace odsetki with ptab[lpoz]
  lpoz=lpoz+1  
  skip
enddo
close
RETURN NIL

FUNCTION NUM_HAS(w,k,num)
local lbelka:=" POZIOM ",ltnaz[2],ltlit[2],ltopis[2],lpoz:=1,i:=0
for i=1 to 2
  ltnaz[i]:=space(10)
  ltlit[i]:=space(10)  
  ltopis[i]:=space(80)  
next
ltnaz[1]:=" PIERWSZY "
ltnaz[2]:=" DRUGI    "
ltlit[1]:=" P        "
ltlit[2]:=" D        "
ltopis[1]:="Uprawnienia pelne"
ltopis[2]:="Uprawnienia ograniczone"
num=men_pion(w+4,k+12,2,lbelka,ltnaz,ltlit,ltopis,num)
return num


*******************************************************************************
***   KODY   *****
*******************************************************************************
FUNCTION KOD(ptxt)
local ltxt:=ptxt,i,lznak
for i=1 to len(ltxt)
  lznak=substr(ptxt,i,1)
  lznak=znak_kod(lznak)
  ltxt=stuff(ltxt,len(ltxt)+1-i,1,lznak)
next
RETURN ltxt

FUNCTION DEKOD(ptxt)
local ltxt:=ptxt,i,lznak
for i=1 to len(ltxt)
  lznak=substr(ptxt,i,1)
  lznak=znak_dekod(lznak)
  ltxt=stuff(ltxt,len(ltxt)+1-i,1,lznak)
next
RETURN ltxt


FUNCTION ZNAK_KOD(pznak)
local lznak:=pznak
do case
  case lznak="1"
    lznak="¿"
  case lznak="2"
    lznak="À"
  case lznak="3"
    lznak="Á"
  case lznak="4"
    lznak="Â"
  case lznak="5"
    lznak="Ã"
  case lznak="6"
    lznak="Ä"
  case lznak="7"
    lznak="Å"

  case lznak="8"
    lznak="È"     &&200
  case lznak="9"
    lznak="É"
  case lznak="0"
    lznak="Ê"
  case lznak="A"
    lznak="F"
  case lznak="B"
    lznak="G"
  case lznak="C"
    lznak="H"
  case lznak="D"
    lznak="I"
  case lznak="E"
    lznak="J"
  case lznak="F"
    lznak="K"
  case lznak="G"
    lznak="L"	
  case lznak="H"
    lznak="M"
  case lznak="I"
    lznak="N"
  case lznak="J"
    lznak="O"
  case lznak="K"
    lznak="P"
  case lznak="L"
    lznak="Q"										
  case lznak="M"
    lznak="R"
  case lznak="N"
    lznak="S"
  case lznak="O"
    lznak="T"
  case lznak="P"
    lznak="U"
  case lznak="Q"
    lznak="V"
  case lznak="R"
    lznak="W"
  case lznak="S"
    lznak="X"
  case lznak="T"
    lznak="Y"
  case lznak="U"
    lznak="Z"
  case lznak="V"
    lznak="A"
  case lznak="W"
    lznak="B"
  case lznak="X"
    lznak="C"
  case lznak="Y"
    lznak="D"
  case lznak="Z"
    lznak="E"

  case lznak="a"
    lznak="f"
  case lznak="b"
    lznak="g"
  case lznak="c"
    lznak="h"
  case lznak="d"
    lznak="i"
  case lznak="e"
    lznak="j"
  case lznak="f"
    lznak="k"
  case lznak="g"
    lznak="l"	
  case lznak="h"
    lznak="m"
  case lznak="i"
    lznak="n"
  case lznak="j"
    lznak="o"
  case lznak="k"
    lznak="p"
  case lznak="l"
    lznak="q"										
  case lznak="m"
    lznak="r"
  case lznak="n"
    lznak="s"
  case lznak="o"
    lznak="t"
  case lznak="p"
    lznak="u"
  case lznak="q"
    lznak="v"
  case lznak="r"
    lznak="w"
  case lznak="s"
    lznak="x"
  case lznak="t"
    lznak="y"
  case lznak="u"
    lznak="z"
  case lznak="v"
    lznak="a"
  case lznak="w"
    lznak="b"
  case lznak="x"
    lznak="c"
  case lznak="y"
    lznak="d"
  case lznak="z"
    lznak="e"	
	
endcase
RETURN lznak

FUNCTION ZNAK_DEKOD(pznak)
local lznak:=pznak
do case
  case lznak="¿"
    lznak="1"
  case lznak="À"
    lznak="2"
  case lznak="Á"
    lznak="3"
  case lznak="Â"
    lznak="4"
  case lznak="Ã"
    lznak="5"
  case lznak="Ä"
    lznak="6"
  case lznak="Å"
    lznak="7"

  case lznak="È"     &&200
    lznak="8"
  case lznak="É"
    lznak="9"
  case lznak="Ê"
    lznak="0"
  case lznak="1"
    lznak="¿"
  case lznak="2"
    lznak="À"
  case lznak="3"
    lznak="Á"
  case lznak="4"
    lznak="Â"
  case lznak="5"
    lznak="Ã"
  case lznak="6"
    lznak="Ä"
  case lznak="7"
    lznak="Å"

  case lznak="8"     &&200
    lznak="È"     &&200
  case lznak="9"
    lznak="É"
  case lznak="0"
    lznak="Ê"	
  case lznak="F"
    lznak="A"
  case lznak="G"
    lznak="B"
  case lznak="H"
    lznak="C"
  case lznak="I"
    lznak="D"
  case lznak="J"
    lznak="E"
  case lznak="K"
    lznak="F"
  case lznak="L"
    lznak="G"	
  case lznak="M"
    lznak="H"
  case lznak="N"
    lznak="I"
  case lznak="O"
    lznak="J"
  case lznak="P"
    lznak="K"
  case lznak="Q"
    lznak="L"										
  case lznak="R"
    lznak="M"
  case lznak="S"
    lznak="N"
  case lznak="T"
    lznak="O"
  case lznak="U"
    lznak="P"
  case lznak="V"
    lznak="Q"
  case lznak="W"
    lznak="R"
  case lznak="X"
    lznak="S"
  case lznak="Y"
    lznak="T"
  case lznak="Z"
    lznak="U"
  case lznak="A"
    lznak="V"
  case lznak="B"
    lznak="W"
  case lznak="C"
    lznak="X"
  case lznak="D"
    lznak="Y"
  case lznak="E"
    lznak="Z"
	
  case lznak="f"
    lznak="a"
  case lznak="g"
    lznak="b"
  case lznak="h"
    lznak="c"
  case lznak="i"
    lznak="d"
  case lznak="j"
    lznak="e"
  case lznak="k"
    lznak="f"
  case lznak="l"
    lznak="g"	
  case lznak="m"
    lznak="h"
  case lznak="n"
    lznak="i"
  case lznak="o"
    lznak="j"
  case lznak="p"
    lznak="k"
  case lznak="q"
    lznak="l"										
  case lznak="r"
    lznak="m"
  case lznak="s"
    lznak="n"
  case lznak="t"
    lznak="o"
  case lznak="u"
    lznak="p"
  case lznak="v"
    lznak="q"
  case lznak="w"
    lznak="r"
  case lznak="x"
    lznak="s"
  case lznak="y"
    lznak="t"
  case lznak="z"
    lznak="u"
  case lznak="a"
    lznak="v"
  case lznak="b"
    lznak="w"
  case lznak="c"
    lznak="x"
  case lznak="d"
    lznak="y"
  case lznak="e"
    lznak="z"	
endcase
RETURN lznak

*******************************************************************************

FUNCTION H_GOS_TWORZ()
create nowa
append blank
replace field_name with "h1"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h2"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h3"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h4"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h5"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h6"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h7"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h8"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h9"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h10"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h11"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h12"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h13"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h14"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h15"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h16"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h17"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h18"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h19"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h20"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h21"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h22"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h23"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h24"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h25"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h26"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h27"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h28"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h29"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h30"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h31"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h32"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h33"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h34"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h35"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h36"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h37"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h38"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h39"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h40"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h41"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h42"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h43"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h44"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h45"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h46"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h47"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h48"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h49"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "h50"
replace field_type with "L"
replace field_len with 1


replace field_name with "has"
replace field_type with "C"
replace field_len with 10
append blank
replace field_name with "pracownik"
replace field_type with "C"
replace field_len with 30
create h_gos from nowa
use
erase nowa.dbf
RETURN nil

FUNCTION ZHAS_LAD()
local i:=1
zhas=has
zpracownik=pracownik
for i=1 to 50
  thas[i]=fieldget(i)
next
RETURN

FUNCTION H_REPLAC()
local i:=1
for i=1 to 50
  fieldput(i,thas[i])
next
replace has with zhas,pracownik with zpracownik
RETURN

FUNCTION ZHAS_PUBLIC()
local i:=1
public zhas:=space(10),zpracownik:=space(30),thas[50]
for i=1 to 50
  thas[i]:=.f.
next
RETURN

