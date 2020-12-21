local t[25],lhas_num:=0,ltak:=.f.
select 0
kj_use("f_setup",.f.,3)
zk_serwer=k_serwer
zm_serwer=m_serwer
zd_serwer=d_serwer
zp_serwer=p_serwer
zk_tryb=k_tryb
zm_tryb=m_tryb
zd_tryb=d_tryb
zp_tryb=p_tryb
use
plikdruk=.f.
dlugosc=57
for i=1 to 25
  t[i]:=space(30)
next
t[1]:="TEST"
t[2]:="Menu pionowe"
t[3]:="Okno uniwersalne"
t[4]:="Pasek realizacji zadania"
t[5]:="Okienko realizacji zadan"
t[6]:="Menu poziome   "
t[7]:="*           "
clear
poz2_1:=0
do while.t.
  s=achoice(0,0,24,30,t)
  do case
    case s=0
	  clear
	  exit
	case s=1
	  psciezka="\anplus98                    "
      pokno=.f.
	  ptxt="               "
	  pklucz=1
	  pksiega=.f.
      siec=.f.
	  tryb=1
	  clear
*	  @ 0,0 say "Sciezka ......"
	  @ 1,0 say "Pokno ........"
	  @ 2,0 say "Ptxt ........."
	  @ 3,0 say "Pklucz ......."
	  @ 4,0 say "Pksiega ......"
	  @ 5,0 say "Siec .. ......"
      @ 6,0 say "Tryb ........."
	  set cursor on
*	  @ 0,15 get psciezka
	  @ 1,15 get pokno
	  @ 2,15 get ptxt
	  @ 3,15 get pklucz
	  @ 4,15 get pksiega
	  @ 5,15 get siec   
	  @ 6,15 get tryb range 1,2  picture "9"
	  read
	  set cursor off
*FUNCTION KONTRAH(psciezka,pokno,ptxt,pklucz,pksiega)	  
      KONTRAH(zk_serwer,pokno,ptxt,pklucz,pksiega,siec,tryb)	   
      
*	  kontrah(testsciezka,.t.,"",1,.f.)	  
*    case s=2
*	  kon_edit(.f.,1)


	case s=2
      clear
	  wek=space(10)
	  set cursor on
	  @ 3,10 get wek
	  read
	  set cursor off
	  wek=taknie_pion(10,10,wek,3)
	  @ 5,10 say wek
	  inkey(0)
	  
	case s=111
      select 1
	  lsukces=kj_use("magazyn",.t.,3)
	  if lsukces
	    browse()
	  else
	    do tkom with "Brak dostepu. Przerywam !!!"
	  endif
    case s=22
      do men_piot            &&menu pionowe
    case s=3
      do kj_oknot            &&Okno uniwersalne
    case s=4
      do k_pasekt            &&Pasek realizacji zadania
    case s=5
      do kj_3juzt            &&Okienko realizacji zadan (x3)
    case s=6
	      do kj_menut           &&menu poziome

    case s=66
      lhas_num=kj_haslo(11,30,lhas_num)
	  @ 0,0 say lhas_num
	  inkey(0)
  endcase
  clear
enddo  
RETURN

FUNCTION TD_MEN2_1(ppoz2_1)
local tn[2],tl[2],to[2],belka:=""
ppoz2_1:=1
tn[1]:=" Zrodlowy "
tn[2]:=" Docelowy "
tl[1]:=" Z        "
tl[2]:=" D        "
to[1]:=" Zatwierdz katalog zrodlowy "
to[2]:=" Zatwierdz katalog docelowy "
ppoz2_1=men_pion(2,8,2,belka,tn,tl,to,ppoz2_1)
RETURN ppoz2_1


PROCEDURE KJ_MENUT
local lbelka:="° Dopisz ° Popraw ° Kasuj ° kOncz °"
local lliter:="  D        P        K        O     "
local lpoz:=1, topis[20], i:=0, lwyjdz:=.f.
for i=1 to 20
  topis[i]=space(80)
next
topis[1]="Dopisz nowa pozycje magazynowa"
topis[2]="Popraw aktualnie podswietlona pozycje magazynowa"
topis[3]="Kasuj aktualnie podswietlona pozycje magazynowa"
topis[4]="Koncz operacja magazynowe"
clear
do while .t.
  lpoz=menu_poziom(2,5,4,lbelka,lliter,topis,lpoz,lwyjdz,.f.)
  do case
    case lastkey()=27.or.lpoz=4
	  exit
	case lpoz=1
	  @ 1,0 say "Dopisuje"  
	case lpoz=2
	  @ 2,0 say "Poprawiam" 
	case lpoz=3
	  @ 3,0 say "Kasuje"  	  	  
  endcase
  inkey(0)
enddo
return

PROCEDURE MEN_PIOT
local lbelka:=" Wybierz ",ltnaz[5],ltlit[5],ltopis[5]
local lpoz:=1,i:=0
for i=1 to 5
  ltnaz[i]:=space(15)
  ltlit[i]:=space(15)
  ltopis[i]=space(80)
next
ltnaz[1]="* Nowy        *"
ltnaz[2]="* Otworz      *"
ltnaz[3]="* Szukaj      *"
ltnaz[4]="* Zapanietaj  *"
ltnaz[5]="* Wyjdz       *"
ltlit[1]="  N            "
ltlit[2]="   T           "
ltlit[3]="  S            "
ltlit[4]="    P          "
ltlit[5]="      Z        "
ltopis[1]="Dopisz nowa pozycje magazynowa"
ltopis[2]="Popraw aktualnie podswietlona pozycje magazynowa"
ltopis[3]="Kasuj aktualnie podswietlona pozycje magazynowa"
ltopis[4]="Koncz operacja magazynowe"
clear
do while .t.
  lpoz=men_pion(2,10,5,lbelka,ltnaz,ltlit,ltopis,lpoz)
  do case
    case lastkey()=27.or.lpoz=4
	  exit
	case lpoz=1
	  @ 1,0 say "Dopisuje"  
	case lpoz=2
	  @ 2,0 say "Poprawiam" 
	case lpoz=3
	  @ 3,0 say "Kasuje"  	  	  
  endcase
  inkey(0)
enddo
return

PROCEDURE KJ_OKNOT
local ltytul:="   T Y T U L   O K N A   "   
kj_okno(2,30,10,ltytul,2)
inkey(0)
return



PROCEDURE K_PASEKT
local k_last,k_aktual,ltlo:=.f.,lcolor:=setcolor()
set cursor off
color="GR+/b+,R+/G+,,,GR+/B+"
setcolor(color)
k_aktual:=0
k_last:=100
do while lastkey()#27
  ltlo=kj_pasek(17,3," Opis wykonywanej operacji ",k_last,k_aktual,ltlo)
  inkey(0.01)
  k_aktual=k_aktual+1
  if k_aktual>k_last
    tone(1000,0.5)
	inkey(0)
	exit
  endif
enddo
setcolor(lcolor)
RETURN

PROCEDURE KJ_3JUZT
local lcolor:=setcolor()
set cursor off
color="GR+/b+,R+/G+,,,GR+/B+"
setcolor(color)
kj_3juz(17,55," ARCHIWIZACJA "," DOKUMENTY"," MAGAZYN",.T.,.T.,.T.,.N.,.t.,.N.)
setcolor(lcolor)
INKEY(0)
RETURN


