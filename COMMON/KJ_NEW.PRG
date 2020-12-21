*******************************************************************************
* Funkcja tworzy menu poziome pierwszego stopnia                              *
* prow - numer wiersza, pcol - lewa kolumna, pilepoz - ilosc pozycji menu     *
* pbelka belka tytulowa menu, plitery - belka zawierajaca wyroznione litery   *
* ppoz - narzucona/wybrana pozycja menu, popis - tablica opisow menu          *
* ptest - parametr pomocniczy : .t. - podaje numery kolumn z separatorami     *
* pwyjdz- wyswietla menu na ekranie i opuszcza je bez akcji                   *
*******************************************************************************
FUNCTION MENU_POZIOM(prow,pcol,pilepoz,pbelka,plitery,popis,ppoz,pwyjdz,ptest)

local k:=1,i:=1,lznak:="",lcolor:=setcolor(),t_col[30],t_len[30]
local lbelscreen,ltyt:="",last:=0, lzmien:=.t., m_enter:=.f.,ek

set cursor off
psep="°"
for k=1 to len(pbelka)          && Analiza tytulow - t_col: tablica zawierajaca
  if substr(pbelka,k,1)=psep    && numery kolumny z separatorem psep
    t_col[i]=pcol+k
    i=i+1 
  endif
next
if kolor=0
  set color to "n/W,W/n"
else
  set color to "b/W,W/b"
endif
@ prow,pcol say pbelka
set color to 
@ prow+1,pcol say replicate(chr(220),len(pbelka))

if.not.kolor=0
  for k=1 to len(plitery)         && Modyfikacja belki menu - zmiana koloru
    lznak=substr(plitery,k,1)     && litery okreslonej w parametrze plitery
    if.not.lznak=" "
	  set color to "r/w,w/r" 
      @ prow,pcol+k-1 say lznak
    endif	
  next
endif

for k=1 to len(pbelka)         && Modyfikacja belki menu - zmiana koloru
  lznak=substr(pbelka,k,1)     && separatora
  if lznak=psep
	set color to gr+
    @ prow,pcol+k-1 say lznak
  endif	
next
if pwyjdz
  setcolor(lcolor)
  return (0)
endif


lbelscreen=savescreen(prow,pcol,prow,pcol+len(pbelka))
keyboard chr(205)
do while.t.

  inkey(0)
  if lastkey()=27.or.lastkey()=13.or.m_enter.or.lastkey()=-21
    exit
  endif


*****************   && Ustalanie pozycji menu po literce
  for k=1 to len(pbelka)                
     lznak=substr(plitery,k,1) 
	 if upper(chr(lastkey(0)))=lznak
       for i=1 to pilepoz
	     if k+pcol>t_col[i].and.k+pcol<t_col[i+1]
		   ppoz=i
           lzmien=.t.
		   exit
		 endif  
	   next
      exit
	 endif
  next
*****************

*****************    && Ustalanie pozycji menu strzalkami
  do case
    case lastkey()=9
	  return (0)
    case lastkey()=4
      lzmien=.t.
	  ppoz=ppoz+1
	  if ppoz>pilepoz
	    ppoz=1
	  endif
    case lastkey()=19
      lzmien=.t.	
	  ppoz=ppoz-1
	  if ppoz<1
	    ppoz=pilepoz
	  endif	  
  endcase
******************
  if lzmien  
    ltyt=substr(pbelka,t_col[ppoz]-pcol+1,t_col[ppoz+1]-t_col[ppoz]-1)  &&tworzenie
    restscreen(prow,pcol,prow,pcol+len(pbelka),lbelscreen)
    set color to                              && pola wybranego 
    @ prow,t_col[ppoz] say ltyt
*	@ 24,0 say popis[ppoz]
    set cursor off
    do skom with popis[ppoz]
    lzmien=.f.
  endif
enddo
if ptest
  clear
  for i=1 to pilepoz+1
    @ 0+i,0 say t_col[i]
  next
  inkey(0)
endif
setcolor(lcolor)
*restore screen from ek
RETURN (ppoz)   

   

FUNCTION MENU1_POZIOM(prow,pcol,pilepoz,pbelka,plitery,popis,ppoz,pwyjdz,ptest)

local k:=1,i:=1,lznak:="",lcolor:=setcolor(),t_col[30],t_len[30]
local lbelscreen,ltyt:="",last:=0, lzmien:=.t., m_enter:=.f.,ek

set cursor off
psep="°"
for k=1 to len(pbelka)          && Analiza tytulow - t_col: tablica zawierajaca
  if substr(pbelka,k,1)=psep    && numery kolumny z separatorem psep
    t_col[i]=pcol+k
    i=i+1 
  endif
next
if kolor=0
  *set color to "n/W,W/n"
  
else
  set color to "b/W,W/b"
endif
set color to 
@ prow,pcol say pbelka
*set color to 
*set color to "n/W,W/n"
@ prow+1,pcol say replicate(chr(220),len(pbelka))

if.not.kolor=0
  for k=1 to len(plitery)         && Modyfikacja belki menu - zmiana koloru
    lznak=substr(plitery,k,1)     && litery okreslonej w parametrze plitery
    if.not.lznak=" "
	  set color to "r/n,n/r" 
	  *set color to "N/W,W/N" 
      @ prow,pcol+k-1 say lznak
    endif	
  next
endif

for k=1 to len(pbelka)         && Modyfikacja belki menu - zmiana koloru
  lznak=substr(pbelka,k,1)     && separatora
  if lznak=psep
	set color to gr+
    @ prow,pcol+k-1 say lznak
  endif	
next
if pwyjdz
  setcolor(lcolor)
  return (0)
endif


lbelscreen=savescreen(prow,pcol,prow,pcol+len(pbelka))
keyboard chr(205)
do while.t.

  inkey(0)
  if lastkey()=27.or.lastkey()=13.or.m_enter.or.lastkey()=-21
    exit
  endif


*****************   && Ustalanie pozycji menu po literce
  for k=1 to len(pbelka)                
     lznak=substr(plitery,k,1) 
	 if upper(chr(lastkey(0)))=lznak
       for i=1 to pilepoz
	     if k+pcol>t_col[i].and.k+pcol<t_col[i+1]
		   ppoz=i
           lzmien=.t.
		   exit
		 endif  
	   next
      exit
	 endif
  next
*****************

*****************    && Ustalanie pozycji menu strzalkami
  do case
    case lastkey()=9
	  return (0)
    case lastkey()=4
      lzmien=.t.
	  ppoz=ppoz+1
	  if ppoz>pilepoz
	    ppoz=1
	  endif
    case lastkey()=19
      lzmien=.t.	
	  ppoz=ppoz-1
	  if ppoz<1
	    ppoz=pilepoz
	  endif	  
  endcase
******************
  if lzmien  
    ltyt=substr(pbelka,t_col[ppoz]-pcol+1,t_col[ppoz+1]-t_col[ppoz]-1)  &&tworzenie
    restscreen(prow,pcol,prow,pcol+len(pbelka),lbelscreen)
    set color to "N/W,W/N"                              && pola wybranego 
    @ prow,t_col[ppoz] say ltyt
*	@ 24,0 say popis[ppoz]
    set cursor off
    do skom with popis[ppoz]
    lzmien=.f.
  endif
enddo
if ptest
  clear
  for i=1 to pilepoz+1
    @ 0+i,0 say t_col[i]
  next
  inkey(0)
endif
setcolor(lcolor)
*restore screen from ek
RETURN (ppoz)   



*******************************************************************************
* Funkcja tworzy menu poziome pierwszego stopnia                              *
* prow - numer wiersza, pcol - lewa kolumna, pilepoz - ilosc pozycji menu     *
* pbelka belka tytulowa menu, plitery - belka zawierajaca wyroznione litery   *
* ppoz - narzucona/wybrana pozycja menu, popis - tablica opisow menu          *
* ptest - parametr pomocniczy : .t. - podaje numery kolumn z separatorami     *
* ppoz=-1 to wychodz z nenu rowniez strzalkami po przekroczeniu pocz.lub konca*
*******************************************************************************
   
FUNCTION MEN_PION(prow,pcol,pilepoz,pbelka,ptnaz,ptlit,popis,ppoz)
local k:=1,i:=1,lznak:="",lcolor:=setcolor(),ek1
local lbelscreen,ltyt:="",last:=0, lzmien:=.t., m_enter:=.f.
local lilekol:=max(len(ptnaz[1]),len(pbelka))+1
local ek,lpoz:=ppoz,lkoncz:=.f.
*save screen to ek
set cursor off
do case
  case ppoz=0
    ppoz=1
  case ppoz<0
    lkoncz=.t.
    ppoz=-1*ppoz  	
endcase
pbelka=stuff(space(len(pbelka)+2),2,len(pbelka),pbelka)
do skom with popis[ppoz]
setcolor("n/w,w/n")
@ prow,pcol clear to prow+pilepoz+1,pcol+lilekol
if kolor=0
 
else
  setcolor( "b/W,W/b")
endif
@ prow,pcol to prow+pilepoz+1,pcol+lilekol 

if.not.len(alltrim(pbelka))=0    &&dopasowanie i wyswietlenie belki tytulowej
  pbelka=stuff(space(len(ptnaz[1])+2),2,len(pbelka),pbelka)
  set color to "gr+/b+,b+/gr+"
  @ prow,pcol say pbelka 
endif  

prow=prow+1
setcolor("n/W,W/n")
for i=1 to pilepoz                   &&Wypisanie tabeli nazw menu 
  @ prow+i-1,pcol+1 say ptnaz[i]
  for k=1 to len(ptnaz[i])           &&Zmiana koloru liter wyroznionych
    lznak=substr(ptlit[i],k,1)
	if.not.lznak=" "
*      set color to "r/w,w/r" 
      set color to "w+/w,w/w+" 
      @ prow+i-1,pcol+k say lznak
	  setcolor("n/W,W/n")
	endif
  next  
next
ek1:=savescreen(prow,pcol,prow+pilepoz,pcol+lilekol)
set color to

do while.t.

  if lzmien 
    restscreen(prow,pcol,prow+pilepoz,pcol+lilekol,ek1)
    if ppoz>0
	  @ prow+ppoz-1,pcol+1 say ptnaz[ppoz]
	endif  
	lzmien=.f.
  endif	
  inkey(0)


*****************   && Ustalanie pozycji menu po literce
  for k=1 to pilepoz                
       for i=1 to len(ptlit[k])
	     lznak=substr(ptlit[k],i,1) 
         if upper(chr(lastkey(0)))=lznak
	       ppoz=k
		   lzmien=.t.
		   exit	 
		 endif	   
	   next
  next
*****************



  do case
*    case lastkey(0)=27.or.lastkey()=13.or.m_enter
    case lastkey(0)=27.or.lastkey()=13
	  exit
    case lastkey()=24        &&strzalka w dol
	  ppoz=ppoz+1
	  if ppoz>pilepoz
        if lkoncz          && wyjdz z menu strzalkami
          ppoz=ppoz-1
          exit
	    else
	      ppoz=1
	    endif
	  endif
	  lzmien=.t.
    case lastkey()=5        &&strzalka do gory
	  ppoz=ppoz-1
	  if ppoz<1
	    if lkoncz         && wyjdz z menu strzalkami
          ppoz=ppoz+1
		  exit
		else
		  ppoz=pilepoz
		endif  
	  endif	  
	  lzmien=.t.
  endcase
  if ppoz>0
    do skom with popis[ppoz]
  endif	
enddo
setcolor(lcolor)
*restore screen from ek
RETURN (ppoz)   


*******************************************************************************
* Funkcja tworzy okienko z tytulem                                            *
* Parametry :  prow - gorny wiersz, pcol - lewa kolumna, pile - ilosc wierszy *
* w dol (glebokosc okienka), ptytul - tytul okna narzucajacy szerokosc okna   *
*******************************************************************************
   
FUNCTION KJ_OKNO(prow,pcol,pile,ptytul,pcolor)
local lcolor:=setcolor(),ek
set cursor off
*psep="°"
psep="±"
do case
  case pcolor=7
    set color to
  case pcolor=24
    set color to w/b
*    set color to b/w
  otherwise	
    set color to n/w,w/n
endcase	
@ prow,pcol clear to prow+pile,pcol-1+len(ptytul) 
do case
  case pcolor=1.or.pcolor=3
    set color to "b/W,W/b"
  case pcolor=2.or.pcolor=0
  	    set color to	
  case pcolor=4
    set color to "bg+/W,W/bg+"		
  case pcolor=5
    set color to "R/W,W/R"			
  case pcolor=15
	set color to "G/W,W/G"				
  case pcolor=25
	set color to "GR+/W,W/GR+"					
  case pcolor=6
    set color to
	@ prow,pcol clear to prow+pile,pcol-1+len(ptytul) 
*   set color to "b/W,W/b"
  case pcolor=7
    setcolor("gr+/n,n/gr+") 
  case pcolor=8
    setcolor("gr+/w,w/gr+") 	
endcase

do case
  case pcolor=0
    set color to "n/w,w/n"
  case pcolor=1.or.pcolor=2
    @ prow,pcol,prow+pile,pcol-1+len(ptytul) box psep
    set color to "gr+/b+,b+/gr+"
  case pcolor=3
    @ prow,pcol to prow+pile,pcol-1+len(ptytul) 
    set color to "gr+/b+,b+/gr+"
  case pcolor=4
    @ prow,pcol to prow+pile,pcol-1+len(ptytul) 
    set color to "W+/BG+,BG+/W+"
  case pcolor=5
    @ prow,pcol to prow+pile,pcol-1+len(ptytul) 
    set color to "W+/R,R/W+"	
  case pcolor=15
    @ prow,pcol to prow+pile,pcol-1+len(ptytul) 
    set color to "W+/G,G/W+"	
  case pcolor=25
    @ prow,pcol to prow+pile,pcol-1+len(ptytul) 
    set color to "W+/GR+,GR+/W+"		
  case pcolor=6
     @ prow,pcol to prow+pile,pcol-1+len(ptytul) 
     set color to "W/b,b/w"
  case pcolor=7	 
    @ prow,pcol,prow+pile,pcol-1+len(ptytul) box psep  
	set color to "W+/R,R/W+"	
  case pcolor=8	 
    @ prow,pcol,prow+pile,pcol-1+len(ptytul) box psep  
	set color to "W+/R,R/W+"		
  case pcolor=9	 
    set color to r+
	@ prow,pcol,prow+pile,pcol-1+len(ptytul) box "°°°°°°°°°"  
*	@ prow,pcol,prow+pile,pcol-1+len(ptytul) box "²²²²²²²²²"  
   set color to "W+/R,R/W+"			
  case pcolor=10	 
    set color to R+
	@ prow,pcol,prow+pile,pcol-1+len(ptytul) box "°°°°°°°°°"  
  case pcolor=24	 
    set color to W/B
	*@ prow,pcol,prow+pile,pcol-1+len(ptytul) box "°°°°°°°°°"  	
	@ prow,pcol to prow+pile,pcol-1+len(ptytul)   	
endcase
if.not.pcolor=10
  do case
    case pcolor=24
	  set color to b/w
  endcase
      @ prow,pcol say space(len(ptytul))
      @ prow,pcol say ptytul	  
endif  

setcolor(lcolor)
RETURN (NIL)   



*******************************************************************************
* Realizacja paska wskazujacego zaawansowanie czynnosci                       *
* Parametry : prow pcol - lewy gorny rog  ptext  - tytul okienka              *
* plast - wartosc koncowa  paktual - wartosc aktualna                         *
*******************************************************************************

FUNCTION KJ_PASEK(prow,pcol,ptext,plast,paktual,ptlo)
local ek,lcolor,lcolor_tlo,lrepl,lproc
lproc:=round((paktual/plast)*100,0)
lrepl:=round((lproc-1.99)/4,0)
save screen to ek
set cursor off
if prow>19
  prow=19
endif
if pcol>29
  pcol=29
endif
lcolor:=setcolor()
lcolor_tlo:="GR+/b+,R+/G+,,,GR+/B+"
if.not.ptlo
  setcolor(lcolor_tlo)
  @ prow,pcol clear to prow+4,pcol+50 
  @ prow,pcol+40 to prow+4,pcol+50 
  @ prow,pcol to prow+4,pcol+50 double
  setcolor("w/b+,R+/G+,n+,,GR+/B+")
  @ prow+1,pcol+42 say "WYKONANO"
  @ prow+3,pcol+2 say "Esc - rezygnacja"
  @ prow+1,pcol+2 say "Czekaj !"
  @ prow+1,pcol+12 say ptext
  ptlo=.t.
endif
setcolor(lcolor)
@ prow+3,pcol+42 say "      % "
@ prow+3,pcol+44 say lproc picture "999"
@ prow+2,pcol+7 say "°"
@ prow+2,pcol+33 say "°"
@ prow+2,pcol+8 say replicate("²",lrepl)
@ prow+2,pcol+42 say ". . . . "
setcolor(lcolor)
*restore screen from ek
RETURN ptlo


*******************************************************************************
* Funkcja rysuje tabelke trzypozycyjna. prow-gorny wiersz, pcol-lewa kolumna  *
* ptxt1 - ptxt3 : opis tabelki , ptak1-ptak3 : gwiazdka informujaca o uwzgled-*
* nieniu pozycj, pjuz1-pjuz3 - informacja o zakonczeniu operacji              *
* Szerokosc tabeli okresla najdluzszy tekst                                   *
*******************************************************************************
FUNCTION KJ_3JUZ(prow,pcol,ptxt1,ptxt2,ptxt3,ptak1,ptak2,ptak3,pjuz1,pjuz2,pjuz3)
local lcolor:=setcolor(),len:=0,ek
len=max(len,len(ptxt1))
len=max(len,len(ptxt2))
len=max(len,len(ptxt3))
save screen to ek
set cursor off
color="GR+/b+,R+/G+,,,GR+/B+"
set color to (color)
@ prow,pcol clear to prow+4,pcol+len+7
@ prow,pcol to prow+4,pcol+3 
@ prow,pcol+len+4 to prow+4,pcol+len+7
@ prow,pcol to prow+4,pcol+len+7 double
setcolor("w+/b")
@ prow+1,pcol+4 say ptxt1
@ prow+2,pcol+4 say ptxt2
@ prow+3,pcol+4 say ptxt3
if ptak1
  @ prow+1,pcol+len+5 say "*"
endif
if ptak2
  @ prow+2,pcol+len+5 say "*"
endif
if ptak3
  @ prow+3,pcol+len+5 say "*"
endif
if pjuz1
  @ prow+1,pcol+1 say "OK"
endif
if pjuz2
  @ prow+2,pcol+1 say "OK"
endif
if pjuz3
  @ prow+3,pcol+1 say "ok"
endif
setcolor(lcolor)
restore screen from ek
RETURN (NIL)


PROCEDURE MIESIAC
parameters prow,pcol,pmies,pnazwa
local tn[12],tl[12],to[12],belka:=" Zatwierdz ",i:=1
tn[1]:=" Styczen     "
tn[2]:=" Luty        "
tn[3]:=" maRzec      "
tn[4]:=" Kwiecien    "
tn[5]:=" Maj         "
tn[6]:=" Czerwiec    "
tn[7]:=" Lipiec      "
tn[8]:=" siErpien    "
tn[9]:=" Wrzesien    "
tn[10]:=" Pazdziernik "
tn[11]:=" lisTopad    "
tn[12]:=" Grudzien    "
tl[1]:=" S           "
tl[2]:=" L           "
tl[3]:="   R         "
tl[4]:=" K           "
tl[5]:=" M           "
tl[6]:=" C           "
tl[7]:="  I          "
tl[8]:="   E         "
tl[9]:=" W           "
tl[10]:=" P           "
tl[11]:="    T        "
tl[12]:=" G           "
for i=1 to 12
  to[i]:=" Zatwierdz klawiszem [Enter] wybrany miesac     [Esc] - rezygnacja "
next
pmies=men_pion(prow,pcol,12,belka,tn,tl,to,pmies)
do case
  case pmies=1
    pnazwa="Styczen"
  case pmies=2
    pnazwa="Luty"
  case pmies=3
    pnazwa="Marzec"
  case pmies=4
    pnazwa="Kwiecien"
  case pmies=5
    pnazwa="Maj"
  case pmies=6
    pnazwa="Czerwiec"
  case pmies=7
    pnazwa="Lipiec"
  case pmies=8
    pnazwa="Sierpien"
  case pmies=9
    pnazwa="Wrzesien"
  case pmies=10
    pnazwa="Pazdziernik"
  case pmies=11
    pnazwa="Listopad"
  case pmies=12
    pnazwa="Grudzien"										
endcase
RETURN

FUNCTION MIES_NAZWA(pmies)
do case
  case pmies=1
    pnazwa="Styczen"
  case pmies=2
    pnazwa="Luty"
  case pmies=3
    pnazwa="Marzec"
  case pmies=4
    pnazwa="Kwiecien"
  case pmies=5
    pnazwa="Maj"
  case pmies=6
    pnazwa="Czerwiec"
  case pmies=7
    pnazwa="Lipiec"
  case pmies=8
    pnazwa="Sierpien"
  case pmies=9
    pnazwa="Wrzesien"
  case pmies=10
    pnazwa="Pazdziernik"
  case pmies=11
    pnazwa="Listopad"
  case pmies=12
    pnazwa="Grudzien"										
endcase
RETURN pnazwa

FUNCTION KJ_SKOM(prow,ptyt,ptxt1,ptxt2,ptxt3,pcolor)
local lcolor:=setcolor(),ek,len,lcol,lcol1,lcol2,lcol3
local len_tyt:=len(ptyt),len1:=len(ptxt1),len2:=len(ptxt2),len3:=len(ptxt3)
len=max(len_tyt,len1)
len=max(len,len2)
len=max(len,len3)+4
if len>len_tyt
  ptyt=stuff(space(len),1,len_tyt,ptyt)
endif
save screen to ek
tone(800,0.5)
lcol=round((79-len)/2,0)
lcol1=round((79-len1)/2,0)
lcol2=round((79-len2)/2,0)
lcol3=round((79-len3)/2,0)
kj_okno(prow,lcol,4,ptyt,pcolor)
set color to "n/w,w/n"
@ prow+1,lcol1 say ptxt1
@ prow+2,lcol2 say ptxt2
@ prow+3,lcol3 say ptxt3
setcolor(lcolor)
RETURN nil


FUNCTION KJ_TKOM(prow,ptyt,ptxt1,ptxt2,ptxt3,pcolor)
local lcolor:=setcolor(),ek,len,lcol,lcol1,lcol2,lcol3
local len_tyt:=len(ptyt),len1:=len(ptxt1),len2:=len(ptxt2),len3:=len(ptxt3)
len=max(len_tyt,len1)
len=max(len,len2)
len=max(len,len3)+4
if len>len_tyt
  ptyt=stuff(space(len),1,len_tyt,ptyt)
endif
save screen to ek
tone(500,1)
lcol=round((79-len)/2,0)
lcol1=round((79-len1)/2,0)
lcol2=round((79-len2)/2,0)
lcol3=round((79-len3)/2,0)

kj_okno(prow,lcol,4,ptyt,pcolor)
do skom with "Nacisnij dowolny klawisz !"
if.not.pcolor=24
  set color to "n/w,w/n"
endif  
@ prow+1,lcol1 say ptxt1
@ prow+2,lcol2 say ptxt2
@ prow+3,lcol3 say ptxt3
inkey(0)
restore screen from ek
setcolor(lcolor)
RETURN nil

FUNCTION KJ_GKOM(prow,ptyt,ptxt1,ptxt2,ptak,pcolor)
local lcolor:=setcolor(),ek,len,lcol,lcol1,lcol2,lcol3
local len_tyt:=len(ptyt),len1:=len(ptxt1),len2:=len(ptxt2)
local lbelka:="°<TAK>°<NIE>°",llitery:="  T     N    "
local lopis[2],lpoz:=1
lopis[1]:="Akceptacja <TAK> - Zatwierdz klawiszem [Enter]    [Esc] - Rezygnacja"
lopis[2]:="Rezygnacja <NIE> - Zatwierdz klawiszem [Enter] lub [Esc] "
len=max(len_tyt,len1)
len=max(len,len2)+4
if len>len_tyt
  ptyt=stuff(space(len),1,len_tyt,ptyt)
endif
save screen to ek
tone(750,1)
lcol=round((79-len)/2,0)
lcol1=round((79-len1)/2,0)
lcol2=round((79-len2)/2,0)

kj_okno(prow,lcol,4,ptyt,pcolor)
set color to "W+/B,B/W+"
@ prow+1,lcol+1 clear to prow+3,lcol+len-2
@ prow+1,lcol1 say ptxt1
@ prow+2,lcol2 say ptxt2
lpoz=menu1_poziom(prow+3,33,2,lbelka,llitery,lopis,lpoz,.f.,.F.)
if lpoz=1.and..not.lastkey()=27
  ptak=.t.
else
  ptak=.f.
endif
restore screen from ek
setcolor(lcolor)
RETURN ptak




FUNCTION GRAF(prow,pcol,pznak,pcolor)
local lcolor:=setcolor()
do case
  case pznak="K"
    @ prow,  pcol say "ÍË ÉÍ "
	@ prow+1,pcol say " ºÉ¼  "
	@ prow+2,pcol say " Ì¼»  "
	@ prow+3,pcol say "ÍÊ ÈÍ "
	@ prow+4,pcol say "Û     "
  case pznak="J"
    @ prow,  pcol say "ÉÍÍÍ» "
	@ prow+1,pcol say "    º "
	@ prow+2,pcol say "    º "
	@ prow+3,pcol say "    º "
	@ prow+4,pcol say "ÉÍÍÍÎÍÍÍÍ"
	@ prow+4,pcol say "ÈÍÍÍ¼ "		
	
endcase
setcolor(lcolor)
RETURN nil

FUNCTION TLO(prow1,pcol1,prow2,pcol2,pznak,pcolor)
local lcolor:=setcolor(),i
setcolor(pcolor)
for i=prow1 to prow2
  @ i,pcol1 say replicate(pznak,pcol2-pcol1+1)
next
setcolor(lcolor)
RETURN NIL


FUNCTION KJ_USE(pbaz,psolo,psek)
local ltytul:=" Uwaga!    Brak dostepu do bazy:",lzz:=.f.,lsolo:=psolo
if.not.zsiec
  lsolo=.t.
endif
do while !netuse(pbaz,lsolo,psek)
  lzz=kj_gkom(10,ltytul,pbaz," P o n o w i c    p r o b e  ?",lzz,5)
  if.not.lzz
    do skom with "Przerywam zadanie"
    inkey(2)
    return .f.
  endif  
enddo
RETURN .t.

FUNCTION KJ_USE1(pbaz,psolo,psek)
local ltytul:=" Uwaga!    Brak dostepu do bazy:",lzz:=.f.,lsolo:=psolo
do while !netuse(pbaz,lsolo,psek)
  lzz=kj_gkom(10,ltytul,pbaz," P o n o w i c    p r o b e  ?",lzz,5)
  if.not.lzz
    do skom with "Przerywam zadanie"
    inkey(2)
    return .f.
  endif  
enddo
RETURN .t.


FUNCTION KJ1_APPEND(psek)
local ltytul:=" Uwaga!    Blokada bazy przez innych uzytkownikow.",lzz:=.f.
do while !addrec(psek)
  lzz=kj_gkom(10,ltytul,pbaz," P o n o w i c    p r o b e  ?",lzz,5)
  if.not.lzz
    do skom with "Przerywam zadanie"
    inkey(2)
    return .f.
  endif  
enddo
RETURN .t.

FUNCTION KJ_APPEND(psek)
local ltytul:=" Uwaga!    Blokada bazy przez innych u¾ytkownik¢w.",lzz:=.f.
append blank
if.not.neterr()
  return .t.
endif
RETURN .f.

FUNCTION KJ_RAT(ptxt,pnum_pol,pgo_top)
local lpole:="",recno:=recno()
pjest=.f.
if pgo_top
  go top
else
  skip
endif
do while.not.eof()
  lpole=FIELDGET(pnum_pol)
  if rat(alltrim(ptxt),lpole)#0
    pjest=.t.
	exit
  endif
  skip
enddo
if !pjest
  go recno
endif
return pjest

*******************************************************************************
* pwektor - ciag zer i jedynek                                                *
* funkcja umozliwia przyporzadkowanie 0=nie 1=tak                             *
*******************************************************************************
FUNCTION TAKNIE_PION(prow,pcol,pwektor,pcolor)
local t[len(pwektor)],q[len(pwektor)],i:=1,lpoz:=1
local lrow:=prow,lcolor:=setcolor()
set cursor off
do skom with "[Enter] - zatwierdzenie    [Spacja] - zmiana ustawienia na przeciwne"
for i=1 to len(pwektor)
  t[i]:=" " 
* q[i]:="Nie"
next
  for i=1 to len(pwektor)
    t[i]=substr(pwektor,i,1)
    if t[i]="1"
      q[i]="Tak"
    else
      q[i]="Nie"
    endif
  next
k=1
do while.t.
  set color to n/w
  for i=1 to len(pwektor)
    @ prow-1+i,pcol say q[i]
  next
  set color to
  @ lrow-1+k,pcol say q[k]
  inkey(0)
  do case
    case lastkey()=5
	  if k>1
	    k=k-1
	  else
	    exit
	  endif
    case lastkey()=24
	  if k<len(pwektor)
	    k=k+1
      else
	    exit
	  endif	  
    case chr(lastkey())=" "
	  if t[k]="1"
	    t[k]="0"
        q[k]="Nie"
	  else
	    t[k]="1"
		q[k]="Tak"
	  endif
    case lastkey()=27.or.lastkey()=13.or.lastkey()=18.or.lastkey()=3
	  exit	  
  endcase
enddo
for i=1 to len(pwektor)
  if t[i]="1"
    pwektor=stuff(pwektor,i,1,"1")
  else
    pwektor=stuff(pwektor,i,1,"0")
  endif
next
setcolor(lcolor)
RETURN pwektor

*******************************************************************************
* Funkcja  bada istnienie rekordu po zafiltrowaniu                           *
*******************************************************************************
FUNCTION KJ_PUSTY()
local recno:=recno(),i
go top
for i=1 to fcount()
  if.not.empty(FIELDGET(i))
	return .f.
  endif
next
  skip
  if eof()
    go recno
    return .T.
  else
    go recno
	return .F.  
  endif	
RETURN 

*******************************************************************************
* Funkcja wyszukuje pozycje w magazynie po nazwie i kodzie                    *
*******************************************************************************
FUNCTION KJ_MSEEK(pnaz,pkod,pjm)
local ljest:=.f.
seek pnaz
if found()
  do while mnaz=pnaz
    if mkod=pkod.and.mjm=pjm
	  ljest=.t.
	  exit
	endif
	skip
  enddo
endif
RETURN ljest

*******************************************************************************
* Funkcja wyszukuje pozycje w magazynie po nazwie i kodzie                    *
*******************************************************************************
FUNCTION KJ_NK_MSEEK(pnaz,pkod)
local ljest:=.f.
seek pnaz
if found()
  do while mnaz=pnaz
    if mkod=pkod
	  ljest=.t.
	  exit
	endif
	skip
  enddo
endif
RETURN ljest


*******************************************************************************
* Funkcja wyszukuje pozycje w magazynie po nazwie i kodzie                    *
*******************************************************************************
FUNCTION KJ_MNK_MSEEK(pnaz,pkod,pmagaz)
local ljest:=.f.
seek pnaz
if found()
  do while mnaz=pnaz
    if mkod=pkod
	  if mmagaz=pmagaz
	    ljest=.t.
	    exit
	  endif	
	endif
	skip
  enddo
endif
RETURN ljest


*******************************************************************************
* Funkcja wyszukuje pozycje w magazynie po nazwie,  kodzie i cenie zakupu     *
*******************************************************************************
FUNCTION KJ_NKC_MSEEK(pnaz,pkod,pcen_m)
local ljest:=.f.
seek pnaz
if found()
  do while mnaz=pnaz
    if mkod=pkod.and.mcen_m=pcen_m
	  ljest=.t.
	  exit
	endif
	skip
  enddo
endif
RETURN ljest


*******************************************************************************
* Funkcja wyszukuje pozycje w plikach o strukturze np. sprzedaz.dbf           *
*******************************************************************************
FUNCTION KJ_TSEEK(pnaz,pkod,pjm)
local ljest:=.f.
seek pnaz
if found()
  do while tnaz=pnaz
    if tkod=pkod.and.tjm=pjm
	  ljest=.t.
	  exit
	endif
	skip
  enddo
endif
RETURN ljest

*******************************************************************************
* Funkcja wyszukuje pozycje w plikach o strukturze np. sprzedaz.dbf           *
*******************************************************************************
FUNCTION KJ_NK_TSEEK(pnaz,pkod)
local ljest:=.f.
seek pnaz
if found()
  do while tnaz=pnaz
    if tkod=pkod
	  ljest=.t.
	  exit
	endif
	skip
  enddo
endif
RETURN ljest


*******************************************************************************
* Funkcja wyszukuje pozycje w plikau defin.dbf                                *
*******************************************************************************
FUNCTION KJ_DSEEK(pnaz,pkod)
local ljest:=.f.
seek pnaz
if found()
  do while gnazwa=pnaz
    if gkod=pkod
	  ljest=.t.
	  exit
	endif
	skip
  enddo
endif
RETURN ljest

*******************************************************************************
* Funkcja wyszukuje pozycje w plikau defin.dbf                                *
*******************************************************************************
FUNCTION KJ_S_DSEEK(pnaz,pkod,pjm)
local ljest:=.f.
seek pnaz
if found()
  do while snazwa=pnaz
    if skod=pkod.and.sjm=pjm
	  ljest=.t.
	  exit
	endif
	skip
  enddo
endif
RETURN ljest



*******************************************************************************
* Nadanie wartosci poczatkowych zmiennym sterujacym drukarka                  *
*******************************************************************************
FUNCTION PUBLIC_DRUK()
public zgesto:=15,znormal:=18,zmocno:=69,zslabo:=70
RETURN nil

FUNCTION SLOWNIE()
local kwota:=ALLTRIM(str(ztbrut_all))
local cyfra:=" "
@ w,vcol say "Sˆownie : "
for i=1 to len(kwota)
  do case
    case substr(kwota,i,1)="0"
	  cyfra="*zero"
    case substr(kwota,i,1)="1"
	  cyfra="*jeden"
    case substr(kwota,i,1)="2"
	  cyfra="*dwa"
    case substr(kwota,i,1)="3"
      cyfra="*trzy"
    case substr(kwota,i,1)="4"
	  cyfra="*cztery"
    case substr(kwota,i,1)="5"
      cyfra="*pi©†"
    case substr(kwota,i,1)="6"
	  cyfra="*sze˜†"
    case substr(kwota,i,1)="7"
	  cyfra="*siedem"
    case substr(kwota,i,1)="8"
	  cyfra="*osiem"
    case substr(kwota,i,1)="9"
	  cyfra="*dziewi©†"
    case substr(kwota,i,1)="."
	  cyfra="*Zˆ "	  
  endcase
  @ prow(),pcol() say cyfra
next
  @ prow(),pcol() say " GR "
RETURN

FUNCTION EMPTY_SLOWNIE()
local kwota:=ALLTRIM(str(ztbrut_all))
local cyfra:=" "
@ w,vcol say "Slownie : "
for i=1 to len(kwota)
  do case
    case substr(kwota,i,1)="0"
	  cyfra="*zero"
    case substr(kwota,i,1)="1"
	  cyfra="*jeden"
    case substr(kwota,i,1)="2"
	  cyfra="*dwa"
    case substr(kwota,i,1)="3"
      cyfra="*trzy"
    case substr(kwota,i,1)="4"
	  cyfra="*cztery"
    case substr(kwota,i,1)="5"
      cyfra="*pi©c"
    case substr(kwota,i,1)="6"
	  cyfra="*szesc"
    case substr(kwota,i,1)="7"
	  cyfra="*siedem"
    case substr(kwota,i,1)="8"
	  cyfra="*osiem"
    case substr(kwota,i,1)="9"
	  cyfra="*dziewiec"
    case substr(kwota,i,1)="."
	  cyfra="*Zl "	  
  endcase
  @ prow(),pcol() say cyfra
next
  @ prow(),pcol() say " GR "
RETURN

FUNCTION MAZ_SLOWNIE()
local kwota:=ALLTRIM(str(ztbrut_all))
local cyfra:=" "
@ w,vcol say "S’ownie : "
for i=1 to len(kwota)
  do case
    case substr(kwota,i,1)="0"
	  cyfra="*zero"
    case substr(kwota,i,1)="1"
	  cyfra="*jeden"
    case substr(kwota,i,1)="2"
	  cyfra="*dwa"
    case substr(kwota,i,1)="3"
      cyfra="*trzy"
    case substr(kwota,i,1)="4"
	  cyfra="*cztery"
    case substr(kwota,i,1)="5"
      cyfra="*pi‘"
    case substr(kwota,i,1)="6"
	  cyfra="*szež"
    case substr(kwota,i,1)="7"
	  cyfra="*siedem"
    case substr(kwota,i,1)="8"
	  cyfra="*osiem"
    case substr(kwota,i,1)="9"
	  cyfra="*dziewi‘"
    case substr(kwota,i,1)="."
	  cyfra="*Z’ "	  
  endcase
  @ prow(),pcol() say cyfra
next
  @ prow(),pcol() say " GR "
RETURN

FUNCTION P_SLOWNIE(pnaz1,pnaz2)
local kwota:=ALLTRIM(str(ztbrut_all))
local cyfra:=" "
@ w,vcol say "Sˆownie : "
for i=1 to len(kwota)
  do case
    case substr(kwota,i,1)="0"
	  cyfra="*zero"
    case substr(kwota,i,1)="1"
	  cyfra="*jeden"
    case substr(kwota,i,1)="2"
	  cyfra="*dwa"
    case substr(kwota,i,1)="3"
      cyfra="*trzy"
    case substr(kwota,i,1)="4"
	  cyfra="*cztery"
    case substr(kwota,i,1)="5"
      cyfra="*pi©†"
    case substr(kwota,i,1)="6"
	  cyfra="*sze˜†"
    case substr(kwota,i,1)="7"
	  cyfra="*siedem"
    case substr(kwota,i,1)="8"
	  cyfra="*osiem"
    case substr(kwota,i,1)="9"
	  cyfra="*dziewi©†"
    case substr(kwota,i,1)="."
	  cyfra="*"+pnaz1
  endcase
  @ prow(),pcol() say cyfra
next
  @ prow(),pcol() say pnaz2
RETURN

FUNCTION EMPTY_P_SLOWNIE(pnaz1,pnaz2)
local kwota:=ALLTRIM(str(ztbrut_all))
local cyfra:=" "
@ w,vcol say "Slownie : "
for i=1 to len(kwota)
  do case
    case substr(kwota,i,1)="0"
	  cyfra="*zero"
    case substr(kwota,i,1)="1"
	  cyfra="*jeden"
    case substr(kwota,i,1)="2"
	  cyfra="*dwa"
    case substr(kwota,i,1)="3"
      cyfra="*trzy"
    case substr(kwota,i,1)="4"
	  cyfra="*cztery"
    case substr(kwota,i,1)="5"
      cyfra="*piec"
    case substr(kwota,i,1)="6"
	  cyfra="*szesc"
    case substr(kwota,i,1)="7"
	  cyfra="*siedem"
    case substr(kwota,i,1)="8"
	  cyfra="*osiem"
    case substr(kwota,i,1)="9"
	  cyfra="*dziewiec"
    case substr(kwota,i,1)="."
	  cyfra="*"+pnaz1
  endcase
  @ prow(),pcol() say cyfra
next
  @ prow(),pcol() say pnaz2
RETURN

FUNCTION MAZ_P_SLOWNIE(pnaz1,pnaz2)
local kwota:=ALLTRIM(str(ztbrut_all))
local cyfra:=" "
@ w,vcol say "S’ownie : "
for i=1 to len(kwota)
  do case
    case substr(kwota,i,1)="0"
	  cyfra="*zero"
    case substr(kwota,i,1)="1"
	  cyfra="*jeden"
    case substr(kwota,i,1)="2"
	  cyfra="*dwa"
    case substr(kwota,i,1)="3"
      cyfra="*trzy"
    case substr(kwota,i,1)="4"
	  cyfra="*cztery"
    case substr(kwota,i,1)="5"
      cyfra="*pi‘"
    case substr(kwota,i,1)="6"
	  cyfra="*szež"
    case substr(kwota,i,1)="7"
	  cyfra="*siedem"
    case substr(kwota,i,1)="8"
	  cyfra="*osiem"
    case substr(kwota,i,1)="9"
	  cyfra="*dziewi‘"
    case substr(kwota,i,1)="."
	  cyfra="*"+pnaz1
  endcase
  @ prow(),pcol() say cyfra
next
  @ prow(),pcol() say pnaz2
RETURN

FUNCTION PSLOWNIE(prow,pcol,pkwota)
local kwota:=ALLTRIM(str(pkwota))
local cyfra:=" ",ltxt:=""
@ prow,pcol say "Sˆownie : "
for i=1 to len(kwota)
  do case
    case substr(kwota,i,1)="0"
	  cyfra="*zero"
    case substr(kwota,i,1)="1"
	  cyfra="*jeden"
    case substr(kwota,i,1)="2"
	  cyfra="*dwa"
    case substr(kwota,i,1)="3"
      cyfra="*trzy"
    case substr(kwota,i,1)="4"
	  cyfra="*cztery"
    case substr(kwota,i,1)="5"
      cyfra="*pi©†"
    case substr(kwota,i,1)="6"
	  cyfra="*sze˜†"
    case substr(kwota,i,1)="7"
	  cyfra="*siedem"
    case substr(kwota,i,1)="8"
	  cyfra="*osiem"
    case substr(kwota,i,1)="9"
	  cyfra="*dziewi©†"
    case substr(kwota,i,1)="."
	  cyfra="*Zˆ "	  
  endcase
  @ prow(),pcol() say cyfra
next
  @ prow(),pcol() say " GR "
RETURN ltxt

FUNCTION EMPTY_PSLOWNIE(prow,pcol,pkwota)
local kwota:=ALLTRIM(str(pkwota))
local cyfra:=" ",ltxt:=""
@ prow,pcol say "Slownie : "
for i=1 to len(kwota)
  do case
    case substr(kwota,i,1)="0"
	  cyfra="*zero"
    case substr(kwota,i,1)="1"
	  cyfra="*jeden"
    case substr(kwota,i,1)="2"
	  cyfra="*dwa"
    case substr(kwota,i,1)="3"
      cyfra="*trzy"
    case substr(kwota,i,1)="4"
	  cyfra="*cztery"
    case substr(kwota,i,1)="5"
      cyfra="*piec"
    case substr(kwota,i,1)="6"
	  cyfra="*szesc"
    case substr(kwota,i,1)="7"
	  cyfra="*siedem"
    case substr(kwota,i,1)="8"
	  cyfra="*osiem"
    case substr(kwota,i,1)="9"
	  cyfra="*dziewiec"
    case substr(kwota,i,1)="."
	  cyfra="*Zl "	  
  endcase
  @ prow(),pcol() say cyfra
next
  @ prow(),pcol() say " GR "
RETURN ltxt

FUNCTION MAZ_PSLOWNIE(prow,pcol,pkwota)
local kwota:=ALLTRIM(str(pkwota))
local cyfra:=" ",ltxt:=""
@ prow,pcol say "S’ownie : "
for i=1 to len(kwota)
  do case
    case substr(kwota,i,1)="0"
	  cyfra="*zero"
    case substr(kwota,i,1)="1"
	  cyfra="*jeden"
    case substr(kwota,i,1)="2"
	  cyfra="*dwa"
    case substr(kwota,i,1)="3"
      cyfra="*trzy"
    case substr(kwota,i,1)="4"
	  cyfra="*cztery"
    case substr(kwota,i,1)="5"
      cyfra="*pi‘"
    case substr(kwota,i,1)="6"
	  cyfra="*szež"
    case substr(kwota,i,1)="7"
	  cyfra="*siedem"
    case substr(kwota,i,1)="8"
	  cyfra="*osiem"
    case substr(kwota,i,1)="9"
	  cyfra="*dziewi‘"
    case substr(kwota,i,1)="."
	  cyfra="*Z’ "	  
  endcase
  @ prow(),pcol() say cyfra
next
  @ prow(),pcol() say " GR "
RETURN ltxt

FUNCTION KS_PSLOWNIE(prow,pcol,pkwota)
local kwota:=ALLTRIM(str(pkwota))
local cyfra:=" ",ltxt:=""
@ prow,pcol say "SOWNIE : "
for i=1 to len(kwota)
  do case
    case substr(kwota,i,1)="0"
	  cyfra="*zero"
    case substr(kwota,i,1)="1"
	  cyfra="*jeden"
    case substr(kwota,i,1)="2"
	  cyfra="*dwa"
    case substr(kwota,i,1)="3"
      cyfra="*trzy"
    case substr(kwota,i,1)="4"
	  cyfra="*cztery"
    case substr(kwota,i,1)="5"
      cyfra="*pi©†"
    case substr(kwota,i,1)="6"
	  cyfra="*sze˜†"
    case substr(kwota,i,1)="7"
	  cyfra="*siedem"
    case substr(kwota,i,1)="8"
	  cyfra="*osiem"
    case substr(kwota,i,1)="9"
	  cyfra="*dziewi©†"
    case substr(kwota,i,1)="."
	  cyfra="*Z "	  
  endcase
  @ prow(),pcol() say cyfra
next
  @ prow(),pcol() say " GR "
RETURN ltxt

FUNCTION EMPTY_KS_PSLOWNIE(prow,pcol,pkwota)
local kwota:=ALLTRIM(str(pkwota))
local cyfra:=" ",ltxt:=""
@ prow,pcol say "SLOWNIE : "
for i=1 to len(kwota)
  do case
    case substr(kwota,i,1)="0"
	  cyfra="*zero"
    case substr(kwota,i,1)="1"
	  cyfra="*jeden"
    case substr(kwota,i,1)="2"
	  cyfra="*dwa"
    case substr(kwota,i,1)="3"
      cyfra="*trzy"
    case substr(kwota,i,1)="4"
	  cyfra="*cztery"
    case substr(kwota,i,1)="5"
      cyfra="*piec"
    case substr(kwota,i,1)="6"
	  cyfra="*szesc"
    case substr(kwota,i,1)="7"
	  cyfra="*siedem"
    case substr(kwota,i,1)="8"
	  cyfra="*osiem"
    case substr(kwota,i,1)="9"
	  cyfra="*dziewiec"
    case substr(kwota,i,1)="."
	  cyfra="*ZL "	  
  endcase
  @ prow(),pcol() say cyfra
next
  @ prow(),pcol() say " GR "
RETURN ltxt

FUNCTION MAZ_KS_PSLOWNIE(prow,pcol,pkwota)
local kwota:=ALLTRIM(str(pkwota))
local cyfra:=" ",ltxt:=""
@ prow,pcol say "S’ownie : "
for i=1 to len(kwota)
  do case
    case substr(kwota,i,1)="0"
	  cyfra="*zero"
    case substr(kwota,i,1)="1"
	  cyfra="*jeden"
    case substr(kwota,i,1)="2"
	  cyfra="*dwa"
    case substr(kwota,i,1)="3"
      cyfra="*trzy"
    case substr(kwota,i,1)="4"
	  cyfra="*cztery"
    case substr(kwota,i,1)="5"
      cyfra="*pi‘"
    case substr(kwota,i,1)="6"
	  cyfra="*szež"
    case substr(kwota,i,1)="7"
	  cyfra="*siedem"
    case substr(kwota,i,1)="8"
	  cyfra="*osiem"
    case substr(kwota,i,1)="9"
	  cyfra="*dziewi‘"
    case substr(kwota,i,1)="."
	  cyfra="*Z’ "	  
  endcase
  @ prow(),pcol() say cyfra
next
  @ prow(),pcol() say " GR "
RETURN ltxt




FUNCTION START_DRUK()
local ldruk:=.t.
if.not.empty(zdr_port).and..not.(alltrim(zdr_port)="LPT1".or.alltrim(zdr_port)="lpt1".or.alltrim(zdr_port)="Lpt1")
  set device to printer
  set printer to 
 do case
   case alltrim(zdr_port)="LPT2".or.alltrim(zdr_port)="lpt2".or.alltrim(zdr_port)="Lpt2"
      set printer to lpt2
    case alltrim(zdr_port)="LPT3".or.alltrim(zdr_port)="lpt3".or.alltrim(zdr_port)="Lpt3"
      set printer to lpt3
    case alltrim(zdr_port)="LPT4".or.alltrim(zdr_port)="lpt4".or.alltrim(zdr_port)="Lpt4"
      set printer to lpt4
    case alltrim(zdr_port)="LPT5".or.alltrim(zdr_port)="lpt5".or.alltrim(zdr_port)="Lpt5"
      set printer to lpt5			
  endcase
  set device to screen
else
  set printer to
* Instrukcja niedozwolona to: set printer to lpt1 - zast©puje j¥ : set printer to
  do while.not. isprinter()
    do tkom with "Przygotuj drukarke i nacisnij dowolny klawisz.  Esc-Rezygnacja"
    if lastkey()=27
      ldruk=.f.  
	  exit
    endif
  enddo
endif  
RETURN ldruk

FUNCTION PSTART_DRUK()
local ldruk:=.t.
port_def()
if.not.(zdznak$lpt2_gr.or.zdznak$lpt3_gr.or.zdznak$lpt4_gr.or.zdznak$lpt5_gr) 
  do while.not. isprinter()
    set device to screen
	do tkom with "Przygotuj drukarke i nacisnij dowolny klawisz.  Esc-Rezygnacja"
    if lastkey()=27
      ldruk=.f.  
	  exit
    endif
	port_def()
  enddo
endif  
RETURN ldruk

*****************************************************************************
* Funkcja wymaga zdefiniowanych zmiennych lpt2_gr - lpt5_gr
*****************************************************************************
FUNCTION PORT_DEF()
set device to printer
set printer to 
do case
  case zdznak $ lpt2_gr
    set printer to lpt2
  case zdznak $ lpt3_gr
    set printer to lpt3
  case zdznak $ lpt4_gr
    set printer to lpt4
  case zdznak $ lpt5_gr
    set printer to lpt5			
endcase
RETURN 

*******************************************************************************
* Funkcja definiuje znaki sterujace drukarki                                  *
*******************************************************************************
FUNCTION DRUK_PUBLIC()
public zdr:=space(1),zdr_nazwa:=space(30),zdr_port:="LPT1",zdr_kond:="chr(15)"
public zdr_kkond:="chr(18)",zdr_grubo:="chr(27)+chr(71)"
public zdr_kgrubo:="chr(27)+chr(72)",zdr_strona:="chr(12)",zdr_mgor:=""
public zdr_mlew:="",zdr_cpi20:="",zdr_szer:="chr(14)",zdr_kszer:="chr(20)"
public zdr_6w:="chr(27)+chr(50)",zdr_8w:="chr(27)+chr(48)"
public zdr_odstpio:="chr(27)+chr(74)",zdr_odstpoz:="chr(27)+chr(75)"
public zdr_orpozio:="",zdr_orpiono:="",zdr_reset:="chr(27)+chr(64)"
public zdr_draft:="",zdr_ster1:="",zdr_ster2:=""
RETURN nil


*******************************************************************************
* Funkcja laduje znaki sterujace drukarki domyslnej                           *
*******************************************************************************
FUNCTION DRUK_LAD()
zdr=dr
zdr_nazwa=dr_nazwa
zdr_port=alltrim(dr_port)
zdr_kond=alltrim(dr_kond)
zdr_kkond=alltrim(dr_kkond)
zdr_grubo=alltrim(dr_grubo)
zdr_kgrubo=alltrim(dr_kgrubo)
zdr_strona=alltrim(dr_strona)
zdr_mgor=alltrim(dr_mgor)
zdr_cpi20=alltrim(dr_cpi20)
zdr_szer=alltrim(dr_szer)
zdr_kszer=alltrim(dr_kszer)
zdr_6w=alltrim(dr_6w)
zdr_8w=alltrim(dr_8w)
zdr_odstpio=alltrim(dr_odstpio)
zdr_odstpoz=alltrim(dr_odstpoz)
zdr_orpozio=alltrim(dr_orpozio)
zdr_orpiono=alltrim(dr_orpiono)
zdr_reset=alltrim(dr_reset)
zdr_ster1=alltrim(dr_ster1)
zdr_ster2=alltrim(dr_ster2)
RETURN nil

FUNCTION DRUK_WYBOR(prow,pcol)
local ek,t[2],q[2]
t[1]:="dr_nazwa"
t[2]:="dr"
q[1]:=""
q[2]:=""
save screen to ek
@ prow,pcol clear to prow+7,pcol+35
@ prow,pcol to prow+7,pcol+35
select 0
set default to leg01
if file("drukarki.dbf")
  if kj_use("drukarki",.t.,3)
    keyboard chr(205)
	
    dbedit(prow+1,pcol+1,prow+7,pcol+34,t,"DRUK_FU","",q,"ß",,"ß")
  endif
else
  kj_tkom(12," Uwaga! ","Brak pliku DRUKARKI.DBF","Obowiazuja nastawy dla typowej drukarki iglowej","Nacisnij dowolny klawisz.",5)
endif
use
restore screen from ek
*prac_default()
RETURN nil

FUNCTION DRUK_FU(ptryb,pp)
local last:=lastkey(),recno,recno1
do case
  case last=27
    return 0
  case last=13
    recno=recno()
	go top
	locate for dr="*"
	if found()
      replace dr with " "
	  go recno
	  replace dr with "*"
      druk_lad()	  
	endif
    return 0    
endcase
RETURN 1

FUNCTION G_prop_TLO()
local lcolor:=setcolor()
do case
  case kolor=0
    set color to
  case kolor=1
    set color to "gr+/gr+"	
  case kolor=2
    set color to "gr/gr"
  case kolor=3
    set color to "r+/r+"
  case kolor=4
    set color to "b/b"						
  case kolor=5
    set color to "b+/b+"
  case kolor=6
    set color to "bg/bg"
  case kolor=7
    set color to "rb/rb"
  case kolor=8
    set color to "g+/g+"
  case kolor=9
    set color to "bg+/bg+"
  case kolor=10
    set color to "rb+/rb+"
  case kolor=11
    set color to "n+/n+"																																			
endcase
*@ 1,0 clear to 23,79
*@ 1,0,23,97 box "²²²²²²²²²"
*@ 1,0,23,97 box "°°°°°°°°°"
@ 1,0 clear to 24,79
setcolor(lcolor)
RETURN nil

FUNCTION G_TLO()
local lcolor:=setcolor()
do case
  case kolor=0
    set color to
  case kolor=1
    set color to gr+	
  case kolor=2
    set color to gr
  case kolor=3
    set color to r+
  case kolor=4
    set color to b						
  case kolor=5
    set color to b+
  case kolor=6
    set color to bg
  case kolor=7
    set color to rb
  case kolor=8
    set color to g+
  case kolor=9
    set color to bg+
  case kolor=10
    set color to rb+
  case kolor=111
    set color to n+	
  case kolor=20
    set color to n/n
  case kolor=21
    set color to gr+/gr+	
  case kolor=22
    set color to gr/gr
  case kolor=23
    set color to r+/r+
  case kolor=24
    set color to b/b						
  case kolor=25
    set color to b+/b+
  case kolor=26
    set color to bg/bg
  case kolor=27
    set color to rb/rb
  case kolor=28
    set color to g+/g+
  case kolor=29
    set color to bg+/bg+
  case kolor=30
    set color to w+/w+
endcase
*@ 1,0 clear to 23,79
*@ 1,0,23,97 box "²²²²²²²²²"
if kolor<20
  @ 1,0,23,97 box "°°°°°°°°°"
else
  @ 1,0 clear to 24,79  
endif  

setcolor(lcolor)
RETURN nil

FUNCTION G11_TLO()
local lcolor:=setcolor()
set color to r/gr+
@ 1,0 clear to 23,79
setcolor(lcolor)
RETURN nil


FUNCTION G1_TLO()
local lcolor:=setcolor()
*set color to r/g
do case
  case kolor=0
    set color to
  case kolor=1
    set color to gr+	
  case kolor=2
    set color to gr
  case kolor=3
    set color to r+
  case kolor=4
    set color to b						
  case kolor=5
    set color to b+
  case kolor=6
    set color to bg
  case kolor=7
    set color to rb
  case kolor=8
    set color to g+
  case kolor=9
    set color to bg+
  case kolor=10
    set color to rb+
  case kolor=11
    set color to n+
endcase
*@ 2,0 clear to 23,79
@ 2,0,23,79 box "°°°°°°°°°"
setcolor(lcolor)
RETURN nil

FUNCTION G2_TLO()
local lcolor:=setcolor()
*set color to r/g
do case
  case kolor=0
    set color to
  case kolor=1
    set color to gr+/gr+	
  case kolor=2
    set color to gr/gr
  case kolor=3
    set color to r+/r+
  case kolor=4
    set color to b/b						
  case kolor=5
    set color to b+/b+
  case kolor=6
    set color to bg/bg
  case kolor=7
    set color to rb/rb
  case kolor=8
    set color to g+/g+
  case kolor=9
    set color to bg+/bg+
  case kolor=10
    set color to rb+/rb+
  case kolor=11
    set color to n+/n+
endcase
@ 0,0 clear to 23,79
setcolor(lcolor)
RETURN nil

FUNCTION W_TLO(pfullscreen,pkolor)
local lcolor:=setcolor()
*set color to r/g
do case
  case pkolor=0
    set color to
  case pkolor=1
    set color to gr+/gr+	
  case pkolor=2
    set color to gr/gr
  case pkolor=3
    set color to r+/r+
  case pkolor=4
    set color to b/b						
  case pkolor=5
    set color to b+/b+
  case pkolor=6
    set color to bg/bg
  case pkolor=7
    set color to rb/rb
  case pkolor=8
    set color to g+/g+
  case pkolor=9
    set color to bg+/bg+
  case pkolor=10
    set color to rb+/rb+
  case pkolor=11
    set color to n+/n+
endcase
if pfullscree
  @ 0,0 clear to 24,79
else
  @ 1,0 clear to 24,79
endif  
setcolor(lcolor)
RETURN nil

FUNCTION G0_TLO()
local lcolor:=setcolor()
*set color to r/g
do case
  case kolor=0
    set color to
  case kolor=1
    set color to gr+	
  case kolor=2
    set color to gr
  case kolor=3
    set color to r+
  case kolor=4
    set color to b						
  case kolor=5
    set color to b+
  case kolor=6
    set color to bg
  case kolor=7
    set color to rb
  case kolor=8
    set color to g+
  case kolor=9
    set color to bg+
  case kolor=10
    set color to rb+
  case kolor=11
    set color to n+
endcase
*@ 2,0 clear to 23,79
@ 0,0,23,79 box "°°°°°°°°°"
setcolor(lcolor)
RETURN nil

FUNCTION ZLA_INSTAL(pmodul)
local lzla:=.t.,mod_kod
do case
  case pmodul="LP"
    mod_kod="LP010"
  case pmodul="SH"
    mod_kod="SH010"	
endcase
select 0
set default to leg01
if kj_use("leg01",.f.,3)
  locate for leg_kod=mod_kod
  if found()
    lzla=.f.
  endif
  use
endif
RETURN lzla

FUNCTION DEMO_END(pmodul)
local ldemo_end:=.t.,mod_kod
do case
  case pmodul="LP"
    mod_kod="LP010"
  case pmodul="SH"
    mod_kod="SH010"	
endcase
select 0
set default to leg01
if kj_use("leg01",.t.,3)
  locate for alltrim(leg_kod)==alltrim(mod_kod)
  if found().and.(l123.and.lkod=1010.or.((date()-ldat)<=ld.and.lkod=2222))
    zl123=l123
	ldemo_end=.f.
  else
    replace lkod with 11111
  endif
  use
endif
RETURN ldemo_end

FUNCTION DEMO_LEGALIZUJ(pmodul)
local ldemo_end:=.t.,mod_kod,llic0:=zlic0, ldni:=0
local ltyt:=" KJ_Legos / inter001    -   legalizacja                              "
do case
  case pmodul="LP"
    mod_kod="LP010"
  case pmodul="SH"
    mod_kod="SH010"	
endcase
select 0
set default to leg01
if kj_use("leg01",.t.,3)
  locate for leg_kod=mod_kod
*  if found().and.(l123.and.lkod=1010.or.((date()-ldat)<=ld.and.lkod=2222))
*    replace lkod with 11111
*  endif
  if found().and.(.not.l123).and.((date()-ldat)>=(ld-10))
    zl123=l123
	ldni=ld-(date()-ldat)    
	clear
	kj_okno(3,5,20,ltyt,1)
	set color to n/w,w/n
	do case
      case ldni<0
	    @ 5,7 say "      Uwaga !   Dobiegˆ koäca czas prezentacji programu."	  
	  case ldni=0
	    @ 5,7 say "      Uwaga !   Dobiega koäca czas prezentacji programu."
	    @ 6,7 say "                    To ju¾ ostatni dzieä !" 	  
	  case ldni=1
	    @ 5,7 say "      Uwaga !   Dobiega koäca czas prezentacji programu."
	    @ 6,7 say "               Pozostaˆ jeszcze tylko jeden dzieä !"
	  case ldni>1
	    @ 5,7 say "      Uwaga !   Dobiega koäca czas prezentacji programu."
	    @ 6,7 say "             Pozostaˆo jeszcze "+str(ldni)+" dni." 	  		  
	endcase
	@ 8,7 say "        Aby nadal korzysta† z programu prosz© o dokonanie "
	@ 9,7 say "      rejestracji u producenta. Uzyskany w wyniku rejestracji"
	@ 10,7 say "          numer licencji usunie zainstalowane blokady."
	@ 12,7 say 'Kontakt: "Soft-KJ-Service" Tel/fax (022) 784 59 19'
	@ 13,7 say "         mgr in¾. Krzysztof Jaworski  Tel: 0604 219 784 "
	@ 14,7 say "         www.kj.z.pl      e-mail: kj@z.pl"       
    if kj_gkom(16,"","Czy chcesz wprowadzi† numer licencji teraz ?","",.t.,5)    
	  @ 21,7 say "Wpisz numer licencji ..."
	  set cursor on
      @ 21,32 get llic0 picture "@!" when s_kom("Wpisz numer podany na dolaczonej do programu licencji",4)
	  read
	  if.not.lastkey()=27
	    zlic0=llic0
	  endif
	  set cursor off
	  if lic_potwierdz()
        replace l123 with .t.,lkod with 1010
		kj_skom(12," Ok! ","Numer licencji potwierdzony.","Program przechodzi do nastepnych czynnosci instalacyjnych","Nacisnij dowolny klawisz.",5)
                
		inkey(3)
      else
        kj_tkom(12," Uwaga! ","Brak potwierdzenia numeru licencji.","Przerywam instalacje programu","Nacisnij dowolny klawisz.",5)
        clear
        close
	    return
      endif	
	endif
  endif
  use
endif
clear
RETURN ldemo_end

FUNCTION KONCZ()
set key 24 to
set key 5 to
zkey10=.t.
keyboard chr(3)
RETURN NIL

FUNCTION ZLEG_LAD()
zlic0=dekod(lic0)
zlic1=dekod(lic1)
zlic2=dekod(lic2)
zlic3=dekod(lic3)
zlic4=dekod(lic4)
zlic5=dekod(lic5)
zlic6=dekod(lic6)
zleg_kod=leg_kod
zlz1=lz1
zlz2=lz2
zlz3=lz3
zl123=l123
zlkod=lkod
zld=ld
zlic_regon=lic_regon
zlic_pesel=lic_pesel
zlic_konto=lic_konto
zlic_tel=lic_tel
zlic_fax=lic_fax
RETURN

FUNCTION NAZWA_MIESIACA(pnum)
local lnazwa:=space(20)
do case
  case pnum=1
    lnazwa="Styczeä"
  case pnum=2
    lnazwa="Luty"
  case pnum=3
    lnazwa="Marzec"
  case pnum=4
    lnazwa="Kwiecieä"
  case pnum=5
    lnazwa="Maj"
  case pnum=6
    lnazwa="Czerwiec"
  case pnum=7
    lnazwa="Lipiec"
  case pnum=8
    lnazwa="Sierpieä"
  case pnum=9
    lnazwa="Wrzesieä"
  case pnum=10
    lnazwa="Pa«dziernik"
  case pnum=11
    lnazwa="Listopad"
  case pnum=12
    lnazwa="Grudzieä"										
endcase
RETURN lnazwa



FUNCTION LIC_POTWIERDZ()
local ldobra:=.f.,l08,l09,l10
if substr(zlic0,8,1)$"0123456789"
  l08:=val(substr(zlic0,8,1))
endif  
if substr(zlic0,9,1)$"0123456789"
  l09:=val(substr(zlic0,9,1))
endif  
if substr(zlic0,10,1)$"0123456789"
  l10:=val(substr(zlic0,10,1))
endif  
if substr(zlic0,1,7)="M82J84K"
  if l08+l09+l10=10
    ldobra=.t.
  endif 
endif
RETURN ldobra


