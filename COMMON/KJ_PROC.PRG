PROCEDURE STARTDRUK
parameters pilosc,pdrukuj,pwek
pdrukuj=.t.
pilosc=1
if.not.plikdruk
*  set printer to &drukarka      && wylaczono ze wzgledu na windows 95
  do while.not. isprinter()
    do tkom with "Przygotuj drukarke i nacisnij dowolny klawisz.  Esc-Rezygnacja"
    if lastkey()=27
      pdrukuj=.f.  
	  return
    endif
  enddo
else
  delete file &plik
  set printer to &plik
endif
RETURN


PROCEDURE SKOM
parameters ptxt
local lcolor:=setcolor()
local kol:=0
ptxt=alltrim(ptxt)
if len(ptxt)>80
  ptxt=substr(ptxt,1,80)
endif
kol=(80-len(ptxt))/2
kol=round(kol,0)
setcolor("N/W,W/N")
@ 24,0 say space(80)
@ 24,kol say ptxt
setcolor(lcolor)
RETURN

FUNCTION S_KOM(ptxt,pcolor)
local lcolor:=setcolor()
local kol:=0
do case
  case pcolor=1
    set color to n/w,w/n
  case pcolor=2
    set color to 
  case pcolor=3
    set color to R+/W,W/R+		
  case pcolor=4
    set color to BG+/W,W/BG+
  case pcolor=5
    set color to R/W,W/R						
endcase
ptxt=alltrim(ptxt)
if len(ptxt)>80
  ptxt=substr(ptxt,1,80)
endif
kol=(80-len(ptxt))/2
kol=round(kol,0)
setcolor("N/W,W/N")
@ 24,0 say space(80)
@ 24,kol say ptxt
setcolor(lcolor)
RETURN .t.



PROCEDURE TKOM
parameters ptxt
local ek:=savescreen(24,0,24,79)
local kol:=0
local lcolor:=setcolor()
clear typeahead
ptxt=alltrim(ptxt)
if len(ptxt)>78
  ptxt=substr(ptxt,1,78)
endif
kol=(80-len(ptxt))/2
kol=round(kol,0)
set color to N/W,W/N
@ 24,0 say space(80)
@ 24,kol say ptxt 
inkey(0)
restscreen(24,0,24,79,ek)
setcolor(lcolor)
RETURN

PROCEDURE GKOM
parameters ptxt,pzatwierdz
local ek:=savescreen(24,0,24,79)
local kol:=0
local lcolor:=setcolor()
ptxt=alltrim(ptxt)
if len(ptxt)>78
  ptxt=substr(ptxt,1,78)
endif
kol=(78-len(ptxt))/2
kol=round(kol,0)
set color to N/W,W/N
set cursor on
@ 24,0 say space(80)
set confirm off
@ 24,kol say ptxt get pzatwierdz
read
set confirm on
set cursor off
restscreen(24,0,24,79,ek)
setcolor(lcolor)
RETURN


FUNCTION KONCZ5()
if vrow>k_w+zk_5
  vrow=vrow-1
endif
keyboard chr(3)
zkoncz5=.t.
zkoncz24=.f.
RETURN nil

FUNCTION KONCZ24()
if vrow<k_w+zk_24
  vrow=vrow+1
endif
keyboard chr(3)
zkoncz5=.f.
zkoncz24=.t.
RETURN nil


FUNCTION CLOSE_ALL(pmodul)
local lplik:=""
close all
set default to leg01
do case
  case pmodul=="SH"
	set default to shset
	lplik="shset.dbf"
    select &sh_sel
    if kj_use(lplik,.t.,3)
      return .t.
    endif
  case pmodul=="LP"
    lplik="lpset.dbf"	
    select 0
    if kj_use(lplik,.t.,3)
      return .t.
    endif	
endcase

RETURN .f.

*******************************************************************************
* Funkcja usrednia cene zakupu. Zalozenie: otwarty plik magazynowy            *
* wmagil - ilosc magazynow, pmcen - dotychczasowa cena magazynowa             *
* ptil - ilosc zakupiona  ptcen - cena zakupu                                 * 
*******************************************************************************
FUNCTION CENA_SREDNIA(pmcen,ptil,ptcen)
local select,m_num:=1,recno,lmil:=mil
local lmnaz:=mnaz,lmkod:=mkod,lmjm:=mjm
if wmagil>1
  lmil=0
  select=select()
  recno=recno()
  close
  do while.t.
    pmagdefault(m_num)
	use magazyn index mag_naz new
	if kj_mseek(lmnaz,lmkod,lmjm) 
	  lmil=lmil+mil
	endif
	close
	m_num=m_num+1
	if m_num>wmagil
	  exit
	endif
  enddo
  select &select
endif
if.not.lmil=0
  pcena_srednia=((lmil-ptil)*pmcen+ptil*ptcen)/lmil   &&lmil zawiera sume (mil+til)
else
  pcena_srednia=ptcen
endif
if wmagil>1
  m_num=2
  do while.t.
    pmagdefault(m_num)
	use magazyn index mag_naz new
	if kj_mseek(lmnaz,lmkod,lmjm) 
	  replace mcen_m with pcena_srednia
	endif
	close
	m_num=m_num+1
	if m_num>wmagil
	  exit
	endif
  enddo
  select &select
  pmagdefault(1)
  use magazyn index mag_naz,mag_kod
  go recno  
endif
RETURN pcena_srednia


FUNCTION OLD_KJ_ROUND(pliczba,pile)
local lliczba:=pliczba
lliczba=ROUND(lliczba,pile+1)
lliczba=ROUND(lliczba,pile)
RETURN lliczba

FUNCTION KJ_ROUND(pliczba,pile)
local lliczba:=pliczba,ltxt,ldodaj:=0,lile:=20-(pile+3)
*lile: liczba okreslajaca polozenie kropki w 20-stoznakowej liczbie
if pliczba>999999999999.or.pile>6.or.pile<0
  lliczba=round(pliczba,pile)
else
  ltxt=str(lliczba,20,pile+3)
  if pliczba<0
    do case
      case pile=6
	    if substr(ltxt,lile+pile+1,1)$"56789"
	      ldodaj=-0.000001
	    endif	  	  	  	  
      case pile=5
	    if substr(ltxt,lile+pile+1,1)$"56789"
	      ldodaj=-0.00001
	    endif	  	  	  	  
      case pile=4
	    if substr(ltxt,lile+pile+1,1)$"56789"
	      ldodaj=-0.0001
	    endif	  	  	  	  
      case pile=3
	    if substr(ltxt,lile+pile+1,1)$"56789"
	      ldodaj=-0.001
	    endif	  	  	  	  
      case pile=2
	    if substr(ltxt,lile+pile+1,1)$"56789"
	      ldodaj=-0.01
	    endif	  	  	  	  
      case pile=1
	    if substr(ltxt,lile+pile+1,1)$"56789"
	      ldodaj=-0.1
	    endif	  	  	  	  
      case pile=0
	    if substr(ltxt,lile+pile+1,1)$"56789"
	      ldodaj=-1
	    endif	  	  	  	  	  	  	  	  	  
    endcase  
  else
    do case
      case pile=6
	    if substr(ltxt,lile+pile+1,1)$"56789"
	      ldodaj=0.000001
	    endif	  	  	  	  
      case pile=5
	    if substr(ltxt,lile+pile+1,1)$"56789"
	      ldodaj=0.00001
	    endif	  	  	  	  
      case pile=4
	    if substr(ltxt,lile+pile+1,1)$"56789"
	      ldodaj=0.0001
	    endif	  	  	  	  
      case pile=3
	    if substr(ltxt,lile+pile+1,1)$"56789"
	      ldodaj=0.001
	    endif	  	  	  	  
      case pile=2
	    if substr(ltxt,lile+pile+1,1)$"56789"
	      ldodaj=0.01
	    endif	  	  	  	  
      case pile=1
	    if substr(ltxt,lile+pile+1,1)$"56789"
	      ldodaj=0.1
	    endif	  	  	  	  
      case pile=0
	    if substr(ltxt,lile+pile+1,1)$"56789"
	      ldodaj=1
	    endif	  	  	  	  	  	  	  	  	  
    endcase
  endif
  ltxt=substr(ltxt,1,17)
  lliczba=val(ltxt)+ldodaj
endif
RETURN lliczba
