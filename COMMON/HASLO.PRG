
*******************************************************************************
* Funkcja wyswietla okienko (pw,pk-gorny lewy rog) i umozliwia wpisanie       *
* obowiazujacego hasla . Zwraca numer hasla (0 - zle haslo)                   *
*******************************************************************************

FUNCTION KJ_HASLO(pw,pk,pnum)
local lhaslo:=space(10),lnum:=pnum
local okno:=savescreen(pw,pk,pw+4,pk+30),lcolor:=setcolor()
local licznik:=0
local haslo1:=space(10),haslo2:=space(10)
*pnum=0
kjhas="kjhas1957"
haslo1=has_dekod(1,haslo1)
haslo2=has_dekod(2,haslo2)
set cursor off
@ pw,pk clear to pw+3,pk+30
*@ pw,pk to pw+3,pk+30 double
set color to gr+
@ pw,pk,pw+3,pk+30 BOX chr(176)
set color to
@ pw+1,pk+9 say "Podaj haslo" 
set color to w/n*
@ pw+1,pk+7 say "*" 
@ pw+1,pk+21 say "*" 
set color to


if (haslo1=space(10).and.pnum=1).or.(haslo2=space(10).and.pnum=2).or.(pnum=0.and.;
                        (haslo1=space(10).and.haslo2=space(10)))
  @ pw+1,pk+2 say "        BRAK HASLA !        "
*  pnum=1
  inkey(2)
  restscreen(pw,pk,pw+4,pk+30,okno)
  return -1
endif

do while .t.
  setcolor("W/N,N/N")
  @ pw+2,pk+2 get lhaslo
  read
  if lastkey()=27
	exit
  endif
  set color to
  do case
    case lhaslo=kjhas
	  lnum=1
      exit
	case lhaslo=haslo1
	  lnum=1
	  exit
	case lhaslo=haslo2.and..not.haslo2=space(10)
	  lnum=2    
	  exit
    otherwise
      @ pw+1,pk+2 say "Popraw !           "
	  @ pw+1,pk+18 say "Proba nr."
      licznik=licznik+1	
	  @ pw+1,pk+28 say licznik picture "9"	
      if licznik>2
        @ pw+1,pk+2 say "      BRAK DOSTEPU !        "
	    @ pw+2,pk+2 say "Nacisnij dowolny klawisz    "
	    inkey(0)
        keyboard chr(205)
        lnum=0
		exit
      endif	  
  endcase
enddo
restscreen(pw,pk,pw+4,pk+30,okno)
setcolor(lcolor)
RETURN lnum


*******************************************************************************
* Funkcja obslugi hasla w oparciu o plik setki.dbf                            *
* Znaki przechowywane sa w fornie liczb ASCI                                  *
*******************************************************************************

FUNCTION HAS_NEW(pw,pk,pile)   &&pile: glebokosc okna dialogu
local ltytul:="     DEFINIOWANIE NOWEGO HASLA     ",lcolor:=setcolor(),lhas:=0
local ek,ek1,lhaslo:=space(10),lpotwierdz:=space(10),i:=0,llitera:=" "
local ltab[10],lnum_has:=0,lnum:=0
for i=1 to 10
  ltab[i]:=space(3)
next
save screen to ek
kj_okno(pw,pk,pile,ltytul,3)
save screen to ek1
lnum_has=num_has(pw,pk,lnum_has)     &&wybor obslugiwanego hasla
if lastkey()=27
    setcolor(lcolor)
    restore screen from ek
	return nil
endif
setcolor( "b/W,W/b")
@ pw+2,pk+2 say "Wpisz dotychczsowe haslo:"
set color to
lnum=lnum_has
lnum=kj_haslo(pw+4,pk+2,lnum)  &&sprawdzenie uprawnien do modyfikacji
restore screen from ek1
setcolor( "b/W,W/b")
do case
  case (lnum=0.or.(lnum#1.and.lnum#lnum_has)).and.lnum#-1.or.lastkey()=27
    setcolor(lcolor)
    restore screen from ek
	return nil
  case lnum=1
    @ pw+3,pk+2 say "Pozion nr 1            "
  case lnum=2
    @ pw+3,pk+2 say "Pozion nr 2            "	

endcase
if lnum#-1
  @ pw+2,pk+2 say "Haslo podane prawidlowo."
endif  
@ pw+5,pk+2 say "Wpisz nowe haslo:"
*setcolor( "b/W,W/W")
for i=1 to 10
  setcolor( "b/W,W/W")
  @ pw+6,pk+i get llitera
  read
  do case
    case lastkey()=13
      exit	
	case lastkey()=27
      restore screen from ek1
	  setcolor( "r/W,W/r")
	  @ pw+4,pk+2 say "Operacje zmiany hasla przerwano!"
      @ pw+5,pk+2 say "Obowiazuje halo dotychczasowe.  "
	  inkey(4)
      setcolor(lcolor)
      restore screen from ek
	  return nil
  endcase
  tone(1000,0.5)
  setcolor( "b/W,W/b")
  @ pw+6,pk+i say "*"  
  lhaslo=stuff(lhaslo,i,1,llitera)
next
@ pw+2,pk+2 say "                        "
@ pw+3,pk+2 say "                        "
tone(500,1)
@ pw+5,pk+2 say "Potwierdz nowe haslo:"
for i=1 to 10
  setcolor( "b/W,W/W")
  @ pw+7,pk+i get llitera
  read
  do case
    case lastkey()=13
      exit	
	case lastkey()=27
      restore screen from ek1
	  setcolor( "r/W,W/r")
	  @ pw+4,pk+2 say "Operacje zmiany hasla przerwano!"
      @ pw+5,pk+2 say "Obowiazuje halo dotychczasowe.  "
	  inkey(4)
      setcolor(lcolor)
      restore screen from ek
	  return nil
  endcase
  tone(1000,0.5)
  setcolor( "b/W,W/b")
  @ pw+7,pk+i say "*"  
  lpotwierdz=stuff(lpotwierdz,i,1,llitera)
  ltab[i]=str(lastkey()+57,3)
next
tone(500,1)
if lhaslo=lpotwierdz
  @ pw+7,pk+14 say "Haslo potwierdzone."
  inkey(3)
  restore screen from ek1
  @ pw+2,pk+2 say "Operacja zmiany hasla zakonczona"
  @ pw+3,pk+2 say "          pomyslnie.            "
  @ pw+5,pk+2 say "Obowiazuje nowe haslo !         "
  has_kod(lnum_has,ltab)
  inkey(3) 
else
  setcolor( "r/W,W/r")
  @ pw+6,pk+14 say "Uwaga!"
  @ pw+7,pk+11 say "Haslo nie potwierdzone."
  inkey(4)
  restore screen from ek1
  @ pw+4,pk+1 say "Operacja nie zakonczona pomyslnie"
  @ pw+5,pk+2 say "Obowiazuje halo dotychczasowe.  "
  inkey(3) 
endif
setcolor(lcolor)
restore screen from ek
RETURN NIL

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

*******************************************************************************