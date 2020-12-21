*******************************************************************************
* Modul glownuy programu sh.exe
*******************************************************************************
local lcolor
set date to german
public sh_upraw:=0
druk_public()
public zkoncz5:=.f.,zkoncz24:=.f.
public zkey10:=.f.    &&w polaczeniu z [Ctrl-Enter] konczy instrukcje get
set key 10 to koncz()
zk_5=2
zk_24=19
select 0
set color to
if zla_instal()
  kj_tkom(12," Uwaga! "," Wykryto bledy instalacyjne!","Program nie moze pracowac poprawnie.","Nacisnij dowolny klawisz.",5)
  clear
  return
endif

if demo_end()
  kj_tkom(3," Uwaga!  Korzystaliscie Panstwo z wersji   D E M O "," Dalsza praca z programem bedzie mozliwa po wykupieniu LICENCJI","Producent: Soft_KJ_Service  Tel: 0 604 219 784 ","Nacisnij dowolny klawisz.",5)
  clear
  return
endif
*
set default to leg01
if kj_use("leg01",.f.,3)
  zleg_lad()
  use
else
  set color to
  clear
  return    
endif	  
*
if file("drukarki.dbf")
  if kj_use("drukarki",.f.,3)
    locate for dr="*"
	if.not.found()
	  go top
	endif
    druk_lad()	
    use
  endif
endif

set default to lpset
sh_upraw=kj_haslo(0,46,sh_upraw)
if sh_upraw=0
  clear
  return
endif
*set default to
setcolor(lcolor)
set color to "n/w,w/n"
*set default to lpset

if file("lset.dbf")
  select 0
  if kj_use("lset",.t.,3)
    zw_lp=w_lp
    zi_lp=i_lp
	use
  endif	
endif
if file("plik_dru.dbf")
  select 0
  if kj_use("plik_dru",.f.,3)
    plik_dru_lad()
	use
  endif	
endif

if file("administ.dbf")
  select 0
  if kj_use("administ",.f.,3)
    administ_lad()
	use
  endif	
endif

if zw_lp
  wybor_fir()
else
  if kj_use("lpfirma",.f.,3)
    fir_lad()
	use
  endif	
  zfnaz1=zlic1  
  zfnaz2=zlic2
  zfkod=zlic3
  zfmiasto=zlic4
  zfulica=zlic5
  zfnip=zlic6
  zfregon=zlic_regon
  zfpesel=zlic_pesel
  zfkonto=zlic_konto
endif


set default to &zlurzad_server
if kj_use("progi",.t.,3)
  lset_lad()  
  use
else
  set color to
  clear
  return  
endif

prac_default()
lp_paramsay()
lp_gmenu()
set color to
clear
RETURN

************************PRACOWNIK
******************************************************************************
* Moduˆ obsˆugi kontrahenta                                                  *
* psciezka: katalog z plikami pokno=.t.:kontrahent w oknie                   *
* ptxt:tekstowa posta† klucza do szukania, pklucz: =1/po nazwie              *
* =2/po nipie =3/po numerze ,pksiega=.t.: wersja z kr¢tsz¥ nazw¥             *
* ptryb=1 - aktualizacja plikow lokalnych na biezaco                         *
* ptryb=2 - aktualizacja plikow lokalnych wymuszana                          *
******************************************************************************
FUNCTION PRACOWNIK(psciezka,pokno,ptxt,pklucz,pksiega,ptryb)
local ek,lsukces,select:=select(),t[9],q[9],to[3],qo[3],ltyt:=space(80)
public enter:=.f.,fwar:=".t."
public f_nip:=space(15),f_naz1:=space(30),f_naz2:=space(30),f_miasto:=space(30)
public f_ulica:=space(30),f_grupa:=space(5),f_odebral:=space(30)
public vmenu_end:=.f.
private klucz:=pklucz,okno:=pokno,k_sciezka:=space(100)
private k_w:=0,k_k:=0
*if zsiec.and.zk_siec
*  siec=.t.
*endif
t[1]:="pnazwisko"
t[2]:="pimie1"
t[3]:="ppesel"
t[4]:="pzasadn"
t[5]:="pdodatek"
t[6]:="ppremia"
t[7]:="pza_chor"
t[8]:="pkoszty"
t[9]:="pkw_wolna"
q[1]:="Nazwisko"
q[2]:="Imie"
q[3]:="Pesel"
q[4]:="Placa zas."
q[5]:="Dodatek"
q[6]:="Premia"
q[7]:="Za chorobe"
q[8]:="Koszty"
q[9]:="Kwota wol."
select 0
*if siec
*  k_sciezka=alltrim(psciezka)
*  k_plik=k_sciezka+"\kon.dbf"
*  k_naz=k_sciezka+"\k_naz.ntx"
*  k_num=k_sciezka+"\k_num.ntx"
*  k_nip=k_sciezka+"\k_nip.ntx"
*  if.not.kj_use(k_plik,.t.,3)
*    return
*  else
*	use
*  endif
*endif
*set default to pracow
prac_default()
*if siec.and.ptryb=1
*  copy file &k_plik to kon.dbf
*  copy file &k_naz to k_naz.ntx
*  copy file &k_num to k_num.ntx
*  copy file &k_nip to k_nip.ntx
*endif
**
ltyt=stuff(ltyt,20,23,"LISTA PALC ZA MIESIAC :")
ltyt=stuff(ltyt,50,len(alltrim(zmies_nazwa)),alltrim(zmies_nazwa))
kj_okno(0,0,24,ltyt,1)
p_menu(1,.f.)
*set default to pracow
prac_default()
lsukces=prac_use(zmiesiac)
prac_sel=select()
if.not.lsukces
  select=&select
  return nil
endif
save screen to ek
setcolor("n/w,w/n") 
keyboard chr(205)
**
setcolor("n/w,w/n") 
do while.t.
  do skom with "[Tab]-MENU    Klawisze aktywne:{ S,D,P,U,K,R }  [Enter]-zatw. [Esc]-rezygn."
  set color to g/gr+ 
  @ 3,1 say replicate("°",78)
  setcolor("n/w,w/n") 
  dbedit(4,1,19,78,t,"LP_FU","",q,"ß")
  if vmenu_end
    exit
  endif
enddo
select &prac_sel
use
restore screen from ek
RETURN NIL




FUNCTION PUBLIC_LSET()
public zlkw_wolna:=0,zlprog2:=0,zlprog3:=0,zlstopa1:=0,zlstopa2:=0,zlstopa3:=0
public zlodlicz1:=0,zlodlicz2:=0,zlodlicz3:=0,zlsr_placa:=0,zlsk_emeryt:=0
public zlsk_rent:=0,zlsk_chorob:=0,zlsk_zdrow:=0
public zlsk_wypad:=0,zlpodstawp:=0,zlpodstaw1:=0,zlpodstaw2:=0
public zlpodstaw3:=0,zlsk_fundus:=0
RETURN nil

FUNCTION LSET_LAD()
zlkw_wolna=lkw_wolna
zlprog2=lprog2
zlprog3=lprog3
zlstopa1=lstopa1
zlstopa2=lstopa2
zlstopa3=lstopa3
zlodlicz1=lodlicz1
zlodlicz2=lodlicz2
zlodlicz3=lodlicz3
zlsr_placa=lsr_placa
zlsk_emeryt=lsk_emeryt
zlsk_rent:=lsk_rent
zlsk_chorob=lsk_chorob
zlsk_zdrow=lsk_zdrow
zlsk_wypad=lsk_wypad
zlpodstawp=lpodstawp
zlpodstaw1=lpodstaw1
zlpodstaw2=lpodstaw2
zlpodstaw3=lpodstaw3
zlsk_fundus=lsk_fundus

RETURN nil

FUNCTION LSET_REPLAC()
replace lkw_wolna with zlkw_wolna,lprog2 with zlprog2,lprog3 with zlprog3
replace lstopa1 with zlstopa1,lstopa2 with zlstopa2,lstopa3 with zlstopa3
replace lodlicz1 with zlodlicz1,lodlicz2 with zlodlicz2,lodlicz3 with zlodlicz3
replace lsr_placa with zlsr_placa,lsk_emeryt with zlsk_emeryt
replace lsk_rent with zlsk_rent,lsk_chorob with zlsk_chorob,lsk_zdrow with zlsk_zdrow
replace lsk_wypad with zlsk_wypad,lpodstawp with zlpodstawp
replace lpodstaw1 with zlpodstaw1,lpodstaw2 with zlpodstaw2
replace lpodstaw3 with zlpodstaw3,lsk_fundus with zlsk_fundus
RETURN nil

FUNCTION  L_PARAM()
zk_5=2
zk_24=16
set default to &zlurzad_server
select 0
*use lsetup
if.not.kj_use("progi",.t.,3)
  return nil
endif
lset_lad()
k_w=5
k_w=0
*k_k=29
k_k=0
lpar_tlo()
l_say()
if l_get()
  lset_replac()
endif
use
prac_default()
RETURN nil

FUNCTION LPAR_TLO()
local ltytul:="             *   P A R A M E T R Y   *             "   
local lcolor:=setcolor()
kj_okno(k_w,k_k,22,ltytul,7)	
set color to gr+	
@ k_w+2,k_k+4 say "Podstawa pracodawcy ......."
@ k_w+3,k_k+4 say "Podstawa wspolpracownika 1."
@ k_w+4,k_k+4 say "Podstawa wspolpracownika 2."
@ k_w+5,k_k+4 say "Srednia placa ............."

@ k_w+6,k_k+4 say  "Kwota wolna od podatku ...."
@ k_w+7,k_k+4 say  "Prog 2 ...................."
@ k_w+8,k_k+4 say  "Prog 3 ...................."
@ k_w+9,k_k+4 say  "Pierwsza stopa podatkowa .."
@ k_w+10,k_k+4 say  "Druga stopa podatkowa......"
@ k_w+11,k_k+4 say  "Trzecia stopa podatkowa...."
@ k_w+12,k_k+4 say  "Pierwsze odliczenie........"
@ k_w+13,k_k+4 say  "Drugie odliczenie.........."
@ k_w+14,k_k+4 say "Trzecie odliczenie........."

@ k_w+15,k_k+4 say "Skladka emerytalna ........"
@ k_w+16,k_k+4 say "Skladka rentowa ..........."
@ k_w+17,k_k+4 say "Skladka chorobowa ........."
@ k_w+18,k_k+4 say "Skladka zdrowotna ........."
@ k_w+19,k_k+4 say "Skladka wypadkowa ........."
@ k_w+20,k_k+4 say "Skladka na fundusz pracy .."
setcolor(lcolor)
RETURN nil

FUNCTION L_GET()
local lcolor:=setcolor(),las,las1,lget
public vrow:=k_w+2
*set confirm off
*zk_5=2
*zk_24=19
zk_5=2
zk_24=20
set key 5 to koncz5()
set key 24 to koncz24()
set color to	
set cursor on
do while.t.
  do case
    case vrow=k_w+2
      @ k_w+2,k_k+31 get zlpodstawp when s_kom("Posdtawa wyliczania skladek ubezp. pracodawcy. (minimalna podawana przez ZUS)")
    case vrow=k_w+3
      @ k_w+3,k_k+31 get zlpodstaw1 when s_kom("Posdtawa pierwszego wspolpracownika jesli istnieje, w przeciwnym razie 0")
    case vrow=k_w+4
      @ k_w+4,k_k+31 get zlpodstaw2 when s_kom("Posdtawa drugiego wspolpracownika jesli istnieje, w przeciwnym razie 0")	  	  
	case vrow=k_w+5  
      @ k_w+5,k_k+31 get zlsr_placa when s_kom("Srednia placa.")

    case vrow=k_w+6
      @ k_w+6,k_k+31 get zlkw_wolna when s_kom("Kwota dochodu zwolniona od podatku (pierwszy prog podatkowy)")
	case vrow=k_w+7  
      @ k_w+7,k_k+31 get zlprog2 when s_kom("Drugi prog podatkowy")
	case vrow=k_w+8  
      @ k_w+8,k_k+31 get zlprog3 when s_kom("Trzeci prog podatkowy")
    case vrow=k_w+9	  
      @ k_w+9,k_k+35 get zlstopa1 when s_kom("Pierwsza stopa procentowa podatku dochodowego")
	case vrow=k_w+10 
      @ k_w+10,k_k+35 get zlstopa2 when s_kom("Druga stopa procentowa podatku dochodowego")
	case vrow=k_w+11  
      @ k_w+11,k_k+35 get zlstopa3 when s_kom("Trzecia stopa procentowa podatku dochodowego")
	case vrow=k_w+12  
	  @ k_w+12,k_k+31 get zlodlicz1 when s_kom("Pierwsza odliczenie")
    case vrow=k_w+13	  
      @ k_w+13,k_k+31 get zlodlicz2 when s_kom("Drugie odliczenie")
	case vrow=k_w+14  
      @ k_w+14,k_k+31 get zlodlicz3 when s_kom("Trzecie odliczenie")

    case vrow=k_w+15
      @ k_w+15,k_k+35 get zlsk_emeryt when s_kom("1/2 skladki emerytalnej podana w %")
	case vrow=k_w+16  
      @ k_w+16,k_k+35 get zlsk_rent when s_kom("1/2 skladki rentowej podana w %")
	case vrow=k_w+17  
      @ k_w+17,k_k+35 get zlsk_chorob when s_kom("Skladka chorobowa podana w %")
	case vrow=k_w+18  
      @ k_w+18,k_k+35 get zlsk_zdrow when s_kom("Skladka zdrowotna podana w %")
	case vrow=k_w+19  
      @ k_w+19,k_k+35 get zlsk_wypad when s_kom("Skladka wypadkowa podana w %")	  
	case vrow=k_w+20  
      @ k_w+20,k_k+35 get zlsk_fundus when s_kom("Skladka funduszu pracy podana w %")  	  
  endcase
  read
  tone(1000,0.5)

  do case
    case lastkey()=3.and.zkey10=.t.
	  zkey10=.f.
	  exit
	case lastkey()=27.or.(lastkey()=13.and.vrow=k_w+20.or.lastkey()=18)
	  exit  
    case lastkey()=13.or.lastkey()=24  &&nastepna
	  vrow=vrow+1
    case lastkey()=5                   &&poprzednia
      if vrow>k_w+2
	    vrow=vrow-1	  
	  endif	
  endcase
  l_say()
enddo
if.not.lastkey()=27
  lget=.t.
else
  lget=.f.
endif
set cursor off
setcolor(lcolor)
set key 24 to
set key 5 to
*set confirm on
RETURN lget


FUNCTION L_SAY()
local lcolor:=setcolor()
set color to W+	
@ k_w+2,k_k+31 say zlpodstawp
@ k_w+3,k_k+31 say zlpodstaw1
@ k_w+4,k_k+31 say zlpodstaw2
@ k_w+5,k_k+31 say zlsr_placa

@ k_w+6,k_k+31 say zlkw_wolna
@ k_w+7,k_k+31 say zlprog2
@ k_w+8,k_k+31 say zlprog3
@ k_w+9,k_k+35 say zlstopa1 
@ k_w+10,k_k+35 say zlstopa2
@ k_w+11,k_k+35 say zlstopa3
@ k_w+12,k_k+31 say zlodlicz1
@ k_w+13,k_k+31 say zlodlicz2
@ k_w+14,k_k+31 say zlodlicz3

@ k_w+15,k_k+35 say zlsk_emeryt
@ k_w+16,k_k+35 say zlsk_rent
@ k_w+17,k_k+35 say zlsk_chorob
@ k_w+18,k_k+35 say zlsk_zdrow 
@ k_w+19,k_k+35 say zlsk_wypad 
@ k_w+20,k_k+35 say zlsk_fundus
setcolor(lcolor)
RETURN nil

FUNCTION P_INDEX()
close all
*set default to pracow
prac_default()
select 0
if kj_use("place_01",.t.,3)
  index on pnazwisko to place_01
  use
else
  kj_tkom(12," Uwaga!","Brak dostepu do pliku place_01","Indeksacja za styczen nie zostala przeprowadzona","Nacisnij dowolny klawisz aby kontynuowac lub [Esc] aby zrezygnowac",5)
  if lastkey()=27
    return nil
  endif
endif
if kj_use("place_02",.t.,3)
  index on pnazwisko to place_02
  use
else
  kj_tkom(12," Uwaga!","Brak dostepu do pliku place_02","Indeksacja za luty nie zostala przeprowadzona","Nacisnij dowolny klawisz aby kontynuowac lub [Esc] aby zrezygnowac",5)
  if lastkey()=27
    return nil
  endif
endif
if kj_use("place_03",.t.,3)
  index on pnazwisko to place_03
  use
else
  kj_tkom(12," Uwaga!","Brak dostepu do pliku place_03","Indeksacja za marzec nie zostala przeprowadzona","Nacisnij dowolny klawisz aby kontynuowac lub [Esc] aby zrezygnowac",5)
  if lastkey()=27
    return nil
  endif
endif
if kj_use("place_04",.t.,3)
  index on pnazwisko to place_04
  use
else
  kj_tkom(12," Uwaga!","Brak dostepu do pliku place_04","Indeksacja za kwiecien nie zostala przeprowadzona","Nacisnij dowolny klawisz aby kontynuowac lub [Esc] aby zrezygnowac",5)
  if lastkey()=27
    return nil
  endif
endif
if kj_use("place_05",.t.,3)
  index on pnazwisko to place_05
  use
else
  kj_tkom(12," Uwaga!","Brak dostepu do pliku place_05","Indeksacja za maj nie zostala przeprowadzona","Nacisnij dowolny klawisz aby kontynuowac lub [Esc] aby zrezygnowac",5)
  if lastkey()=27
    return nil
  endif
endif
if kj_use("place_06",.t.,3)
  index on pnazwisko to place_06
  use
else
  kj_tkom(12," Uwaga!","Brak dostepu do pliku place_06","Indeksacja za czerwiec nie zostala przeprowadzona","Nacisnij dowolny klawisz aby kontynuowac lub [Esc] aby zrezygnowac",5)
  if lastkey()=27
    return nil
  endif
endif
if kj_use("place_07",.t.,3)
  index on pnazwisko to place_07
  use
else
  kj_tkom(12," Uwaga!","Brak dostepu do pliku place_07","Indeksacja za lipiec nie zostala przeprowadzona","Nacisnij dowolny klawisz aby kontynuowac lub [Esc] aby zrezygnowac",5)
  if lastkey()=27
    return nil
  endif
endif
if kj_use("place_08",.t.,3)
  index on pnazwisko to place_08
  use
else
  kj_tkom(12," Uwaga!","Brak dostepu do pliku place_08","Indeksacja za sierpien nie zostala przeprowadzona","Nacisnij dowolny klawisz aby kontynuowac lub [Esc] aby zrezygnowac",5)
  if lastkey()=27
    return nil
  endif
endif
if kj_use("place_09",.t.,3)
  index on pnazwisko to place_09
  use
else
  kj_tkom(12," Uwaga!","Brak dostepu do pliku place_09","Indeksacja za wrzesian nie zostala przeprowadzona","Nacisnij dowolny klawisz aby kontynuowac lub [Esc] aby zrezygnowac",5)
  if lastkey()=27
    return nil
  endif
endif
if kj_use("place_10",.t.,3)
  index on pnazwisko to place_10
  use
else
  kj_tkom(12," Uwaga!","Brak dostepu do pliku place_10","Indeksacja za pazdziernik nie zostala przeprowadzona","Nacisnij dowolny klawisz aby kontynuowac lub [Esc] aby zrezygnowac",5)
  if lastkey()=27
    return nil
  endif
endif
if kj_use("place_11",.t.,3)
  index on pnazwisko to place_11
  use
else
  kj_tkom(12," Uwaga!","Brak dostepu do pliku place_11","Indeksacja za listopad nie zostala przeprowadzona","Nacisnij dowolny klawisz aby kontynuowac lub [Esc] aby zrezygnowac",5)
  if lastkey()=27
    return nil
  endif
endif
if kj_use("place_12",.t.,3)
  index on pnazwisko to place_12
  use
else
  kj_tkom(12," Uwaga!","Brak dostepu do pliku place_12","Indeksacja za grudzien nie zostala przeprowadzona","Nacisnij dowolny klawisz aby kontynuowac lub [Esc] aby zrezygnowac",5)
  if lastkey()=27
    return nil
  endif
endif
kj_tkom(12," Ok! ","","Indeksacja zakonczona","Nacisnij dowolny klawisz.",5)
RETURN nil


FUNCTION L_MENU(ppoz1,pster)
local topis[10],ek
local lbelka:="° Szukaj ° Wpisz kwoty ° dRukuj liste plac °  [Tab]°[Esc]°"
local lliter:="  S        W              R                               "
topis[1]:="Szukaj pracownika po nazwie"
topis[2]:="Wpisz kwoty: placa, dodatek, premia, chorobowe, koszty, kwota wolna"
topis[3]:="Wydrukuj liste plac na drukarce domyslnej"
topis[4]:="Powrot z menu do tabeli"
topis[5]:="Wyjdz do poprzedniego menu"
if ppoz1=0
  ppoz1=1
endif
if pster
    ppoz1=menu_poziom(1,0,5,lbelka,lliter,topis,ppoz1,.f.,.f.)
else
   plac_tlo()
    ppoz1=menu_poziom(1,0,5,lbelka,lliter,topis,ppoz1,.t.,.f.)
endif
RETURN ppoz1





FUNCTION P_FUL_ENTER()
local recno:=recno(),ek,lcolor:=setcolor()
k_w=3
k_k=29
save screen to ek
p_dop_tlo()
p_say()
do tkom with "Nacisnij dowolny klawisz."
restore screen from ek
setcolor(lcolor)
RETURN (NIL)		

*******************************************************************************
* Opisz pomocniczy biezacego kontrahenta                                      *
*******************************************************************************
FUNCTION L_OKNOPOM()
local lcolor:=setcolor()
  set color to GR+
  @ 20,1 say replicate(chr(176),78)
  @ 21,54 say "°"
  @ 22,54 say "°"
  @ 23,54 say "°"
  set color to
  @ 21,2 say "Nazwa (cd).."
  @ 22,2 say "Adres : ...."
  @ 21,15 say zknaz2
  @ 23,6 say zkkod
  @ 22,15 say zkulica
  @ 23,15 say zkmiasto
  @ 21,55 say " Tel...."
  @ 22,55 say " Fax...."
  @ 23,55 say " Grupa ."
  @ 21,64 say zktel
  @ 22,64 say zkfax
  @ 23,64 say zkgrupa
setcolor(lcolor)
RETURN NIL


FUNCTION P_KWOTY(prow,pcol)
local ek,lnip_byl:=.f.,lnaz_byl:=.f.,lkoncz:=.f.
local select:=select(),lcolor:=setcolor()
local lkget:=.f.       &&Wynik funkcji k_get()
*k_w:=3
k_w:=1
*k_k:=29  
k_k:=0  
save screen to ek
pk_dop_tlo()
*if enter
  pk_say()
*  licz_say()
*else
*  p_zer()
*endif  
lkget=pk_get(.t.)
    if lastkey()#27
        pk_replac()
    endif  
restore screen from ek
RETURN lkget

FUNCTION PK_DOP_TLO()
local ltytul:=" Pracownik:                                        "   
local lcolor:=setcolor()
ltytul=stuff(ltytul,14,20,zpnazwisko)
ltytul=stuff(ltytul,16+len(alltrim(zpnazwisko)),len(alltrim(zpimie1)),alltrim(zpimie1))
kj_okno(k_w,k_k,17,ltytul,7)	
set color to gr+	
@ k_w+2,k_k+2 say  "PRZYCHOD:   Wynagrodzenie zasadnicze .."
@ k_w+3,k_k+2 say  "            Dodatek ..................."
@ k_w+4,k_k+2 say  "            Premia ...................."
@ k_w+5,k_k+2 say  "            Za czas choroby ..........."
@ k_w+6,k_k+2 say  "KOSZTY:     Uzyskania przychodow ......"
@ k_w+7,k_k+2 say  "POTRACENIA: Skladka ubezp. na zycie ..."
@ k_w+8,k_k+2 say  "            Inne ......................"
@ k_w+9,k_k+2 say "DODATKI:    Zasilek rodzinny .........."
@ k_w+10,k_k+2 say "            Inne nieopodatkowane ......"
@ k_w+11,k_k+2 say "NALICZANIE SKLADEK:  Emerytalna [T/N].."
@ k_w+12,k_k+2 say "                     Rentowa    [T/N].."
@ k_w+13,k_k+2 say "                     Chorobowa  [T/N].."
@ k_w+14,k_k+2 say "                     Zdrowotna  [T/N].."
@ k_w+15,k_k+2 say  "KWOTA WOLNA OD PODATKU          [T/N].."

setcolor(lcolor)
RETURN nil

FUNCTION PK_GET(pdopisz)
local lcolor:=setcolor(),las,las1,lget
zk_5=2
zk_24=15
public vrow:=k_w+2
set key 5 to koncz5()
set key 24 to koncz24()
set color to	

do while.t.
  set color to	
  set cursor on
  do case
    case vrow=k_w+2
      @ k_w+2,k_k+41 get zpzasadn picture "999999.99" when s_kom("[Enter]-zatwierdz.pozycji   [Ctrl-Enter]-zatwierdz.wszystkiego   [Esc]-rezygn.")
	case vrow=k_w+3  
      @ k_w+3,k_k+41 get zpdodatek picture "999999.99"
	case vrow=k_w+4  
      @ k_w+4,k_k+41 get zppremia picture "999999.99"
    case vrow=k_w+5	  
      @ k_w+5,k_k+41 get zpza_chor picture "999999.99"
	case vrow=k_w+6  
      @ k_w+6,k_k+41 get zpkoszty picture "999999.99"
	case vrow=k_w+7  
	  @ k_w+7,k_k+41 get zpsk_zycie picture "999999.99"
    case vrow=k_w+8  
      @ k_w+8,k_k+41 get zpsk_inne picture "999999.99"
	case vrow=k_w+9  
      @ k_w+9,k_k+41 get zpzasilek picture "999999.99"
	case vrow=k_w+10  
      @ k_w+10,k_k+41 get zpzas_inne picture "999999.99" when s_kom("[Enter]-zatwierdz.pozycji   [Ctrl-Enter]-zatwierdz.wszystkiego   [Esc]-rezygn.")
    case vrow=k_w+11
      @ k_w+11,k_k+41 get zplog_e when s_kom("Litera [ T ] - skladka naliczana      litera [ F ] - skladka nie naliczana")
	case vrow=k_w+12  
      @ k_w+12,k_k+41 get zplog_r
	case vrow=k_w+13  
      @ k_w+13,k_k+41 get zplog_c
	case vrow=k_w+14  
      @ k_w+14,k_k+41 get zplog_z
	case vrow=k_w+15 
      @ k_w+15,k_k+41 get zpkw_wolna	  
  endcase
  read
  do case
    case lastkey()=3.and.zkey10=.t.
	  zkey10=.f.
	  exit
	case lastkey()=27
	  exit  
	case (lastkey()=13.and.vrow=k_w+15)
	  tone(1000,0.5)
	  licz_say()
      inkey(0)
	  exit
    case lastkey()=13
	  tone(1000,0.5)
	  licz_say()
	  vrow=vrow+1
	case lastkey()=18  
	  exit
	case lastkey()=24  &&nastepna  
	  vrow=vrow+1
    case lastkey()=5                   &&poprzednia
      if vrow>k_w+2
	    vrow=vrow-1	  
	  endif	
    case chr(lastkey())$"Rr"
  endcase
  setcolor(lcolor)
  pk_say()
enddo
set cursor off
if.not.lastkey()=27
  lget=.t.
else
  lget=.f.
endif
set cursor off
setcolor(lcolor)
set key 24 to
set key 5 to
*set confirm on
RETURN lget


FUNCTION PK_SAY()
local lcolor:=setcolor()
set color to W+	
@ k_w+2,k_k+41 say zpzasadn picture "999999.99"
@ k_w+3,k_k+41 say zpdodatek picture "999999.99"
@ k_w+4,k_k+41 say zppremia picture "999999.99"
@ k_w+5,k_k+41 say zpza_chor picture "999999.99"
@ k_w+6,k_k+41 say zpkoszty picture "999999.99"
@ k_w+7,k_k+41 say zpsk_zycie picture "999999.99"
@ k_w+8,k_k+41 say zpsk_inne picture "999999.99"
@ k_w+9,k_k+41 say zpzasilek picture "999999.99"
@ k_w+10,k_k+41 say zpzas_inne picture "999999.99"
@ k_w+11,k_k+41 say zplog_e
@ k_w+12,k_k+41 say zplog_r
@ k_w+13,k_k+41 say zplog_c
@ k_w+14,k_k+41 say zplog_z
@ k_w+15,k_k+41 say zpkw_wolna
setcolor(lcolor)
RETURN nil

FUNCTION PK_REPLAC()
replace pzasadn with zpzasadn,pdodatek with zpdodatek,ppremia with zppremia
replace pza_chor with zpza_chor,pkoszty with zpkoszty,pkw_wolna with zpkw_wolna
replace psk_zycie with zpsk_zycie,psk_inne with zpsk_inne,pzasilek with zpzasilek
replace pzas_inne with zpzas_inne, plog_e with zplog_e,plog_r with zplog_r
replace plog_c with zplog_c, plog_z with zplog_z 
RETURN nil

FUNCTION PLAC_TLO()
set color to
@ 20,1 clear to 23,78
@ 20,1 say replicate(chr(176),78)
RETURN nil

FUNCTION LICZ_SAY()
zlicz()
set color to n/w,w/n
kj_okno(1,51,22,"    P O D S U M O W A N I E  ",1)
kj_okno(19,0,4,"         K W O T A   D O   W Y P L A T Y           ",1)
@ 3,53 say "Podstawa ubezpieczenia:"
@ 4,70 say plicz_d7() picture "999999.99"
@ 6,53 say "Ogolem przychod:"
@ 6,70 say  plicz_m8() picture "999999.99"
@ 8,53 say "SKLADKI:"
@ 9,53 say  "Emerytalna ....."
@ 10,53 say "Rentowa ........"
@ 11,53 say "Chorobowa ......"
@ 12,53 say "Razem E+R+Ch ..."
@ 13,53 say "Zdrowotna ......"
@ 14,53 say "Zdrow. pobrana ."
@ 15,53 say "Wypadkowa ......"
@ 16,53 say "Suma skladek :  "
@ 9,70 say  plicz_d9() picture "999999.99"
@ 10,70 say  plicz_d10() picture "999999.99"
@ 11,70 say  plicz_d11() picture "999999.99"
@ 12,70 say  plicz_d9()+plicz_d10()+plicz_d11() picture "999999.99"
@ 13,70 say  plicz_d14() picture "999999.99"
@ 14,70 say plicz_d30() picture "999999.99"
@ 15,70 say plicz_d31() picture "999999.99"
@ 16,70 say plicz_d32() picture "999999.99"

@ 18,53 say "Podstawa ub.zdrow"
@ 18,70 say  plicz_d13() picture "999999.99"
@ 19,53 say "Nalezna stopa:        % "
@ 19,70 say zstopa picture "999"
*@ 16,70 say  plicz_m13() picture "999999.99"
@ 20,53 say "Zaliczka potracona"
@ 20,70 say  plicz_d15() picture "999999.99"
@ 21,53 say "Zaliczka nalezna"
@ 21,70 say plicz_d16() picture "999999.99"
@ 21,20 say plicz_d23() picture "999999.99"
RETURN nil

******************************************************************************
* FUNKCJE OBLICZENIOWE                                                       *
******************************************************************************

*******************************************************************************
* Funkcja analizuje zarobki pracownika od poczatku roku i przydziela          * 
* odpowiednia stope podatku dochodowego, zgodnie z zasada ze w pierwszym      *
* miesiacu o wyborze stopyb decydyja zarobki w tym miesiacu, natomiast w      *
* kazdym nastepnym suma zarobkow ze wszystkich miesiecy poprzednich (z wyla-  * 
* czeniem zarobkow z biezacego miesiaca
*******************************************************************************
FUNCTION STOPA()
local lstopa:=zlstopa1,select:=select(),i,lsum_7:=0,lrecno:=recno()
local lpnazwisko:=zpnazwisko,lpimie1:=zpimie1,lppesel:=zppesel
if zmiesiac=1.or..not.prac_byl()
  lsum_7=plicz_d7()+pza_chor
else
  for i=1 to zmiesiac-1
    select 0
    lsukces=prac_use(i)
    locate for pnumer=zpnumer
	if found()
	  lsum_7=lsum_7+pzasadn+pdodatek+ppremia+pza_chor
	endif
	use
  next
  select &select
  go lrecno
endif
do case
  case lsum_7>zlprog2.and.lsum_7<=zlprog3
    lstopa=zlstopa2
  case lsum_7>zlprog3
    lstopa=zlstopa3	  
endcase
RETURN lstopa

*******************************************************************************
* Funkcja zlicza zarobki pracownika i porownuje z trzydziestokrotna srednia   *
* krajowa. Jesli zarobki te sa wieksze, program automatycznie przestaje       *
* naliczac skladke ubezpieczenia spolecznego. Przyjeto zasade, ze w pierwszym *
* miesiacu porownaniu podlegaja dochody z tego miesiaca, w kazdym zastepnym - *
* dochody z miesiecy poprzednich z wylaczeniem biezacego                      *
*******************************************************************************
FUNCTION WAR_30()
local lwar_30:=.f.
local select:=select(),i,lsum_war30:=0,lrecno:=recno()
if zmiesiac=1.or..not.prac_byl()
  lsum_war30=plicz_d7()+pza_chor
else
  for i=1 to zmiesiac-1
    select 0
    lsukces=prac_use(i)
    locate for pnumer=zpnumer
	if found()
	  lsum_war30=lsum_war30+pzasadn+pdodatek+ppremia+pza_chor
	endif
	use
  next
  select &select
  go lrecno
endif
if lsum_war30>30*zlsr_placa
  lwar_30=.t.
endif
RETURN lwar_30

*******************************************************************************
* Funkcja analizujac zarobki od poczatku roku wylicza odpowiednia dla danego  *
* przcownika stope % oraz okresla warunek przekroczenia 30 srednich wynagrodze*
*******************************************************************************
FUNCTION ZLICZ()
zwar_30=war_30()
zstopa=stopa()
RETURN nil


*******************************************************************************
* Funkcja wylicza sume wynagrodzenia - podstawe ubezpieczenia spolecznego     *
* pracownika: wyn.zasadnicze+dodatek+premia                                   *
*******************************************************************************
FUNCTION PLICZ_D7()
local llicz_d7:=zpzasadn+zpdodatek+zppremia
RETURN llicz_d7



*******************************************************************************
* Funkcja sprawdza warunek przekroczenia trzydziestokrotnej sredniej placy    *
* Jesli placa nie przekracza wyliczonej w warunku, naliczana jest skladka     *
* emerytalna jako iloczyn lacznego wynagrodzenia i stopy %. W przeciwnym      *
* wypadku funkcja zwraca 0                                                    *
* zplog_e=.f. - programowo wylaczpne obliczanie slkadki                       *
*******************************************************************************
FUNCTION PLICZ_D9()
local llicz_d9:=0
if.not.zwar_30      &&jesli nie przekroczono 30-krotnej placy sredniej 
  if zplog_e
    llicz_d9:=KJ_ROUND(plicz_d7()*(zlsk_emeryt/100),2)
  endif
endif
RETURN llicz_d9

*******************************************************************************
* Funkcja sprawdza warunek przekroczenia trzydziestokrotnej sredniej placy    *
* Jesli placa nie przekracza wyliczonej w warunku, naliczana jest skladka     *
* rentowa    jako iloczyn lacznego wynagrodzenia i stopy %. W przeciwnym      *
* wypadku funkcja zwraca 0                                                    *
* zplog_r=.f. - programowo wylaczpne obliczanie slkadki                       *
*******************************************************************************
FUNCTION PLICZ_D10()
local llicz_d10:=0
if.not.zwar_30      &&jesli nie przekroczono 30-krotnej placy sredniej 
  if zplog_r
    llicz_d10:=KJ_ROUND(plicz_d7()*(zlsk_rent/100),2)
  endif  
endif
RETURN llicz_d10

*******************************************************************************
* Funkcja sprawdza warunek przekroczenia trzydziestokrotnej sredniej placy    *
* Jesli placa nie przekracza wyliczonej w warunku, naliczana jest skladka     *
* chorobowa  jako iloczyn lacznego wynagrodzenia i stopy %. W przeciwnym      *
* wypadku funkcja zwraca 0                                                    *
* zplog_c=.f. - programowo wylaczpne obliczanie slkadki                       *
*******************************************************************************
FUNCTION PLICZ_D11()
local llicz_d11:=0
if.not.zwar_30      &&jesli nie przekroczono 30-krotnej placy sredniej 
  if zplog_c
    llicz_d11:=KJ_ROUND(plicz_d7()*(zlsk_chorob/100),2)
  endif
endif
RETURN llicz_d11

*******************************************************************************
* Suma skladek ubezpieczenia spolecznego pracownika                           *
*******************************************************************************
FUNCTION PLICZ_D12()
local llicz_d12:=plicz_d9()+plicz_d10()+plicz_d11()
RETURN llicz_d12

*******************************************************************************
* Podstawa ubezpieczenia zdrowotnego i podatku docodowego                     *
* (Wynagrodzenie razem+chorobowe-suma skladek ub.spolecznego pracownika)      *
*******************************************************************************
FUNCTION PLICZ_D13()
local llicz_d13:=plicz_d7()+zpza_chor-plicz_d9()-plicz_d10()-plicz_d11()
RETURN llicz_d13

*******************************************************************************
* Skladka ubezpieczenia zdrowotnego nalezna                                   *
*******************************************************************************
FUNCTION PLICZ_D14()
local llicz_d14:=0
if zplog_z
  llicz_d14:=KJ_ROUND(plicz_d13()*(zlsk_zdrow/100),2)
endif
RETURN llicz_d14

*******************************************************************************
* Funkcja wylicz zaliczke na podatek dochodowy. Korzysta z wczesniej policzo- *
* nej stopy odpowiednij do zarobkow od poczatku roku oraz widelek procentowych*
* zpkw_wolna=.t. - pracownikowi przysluguje prawo do odliczenia kwoty wolnej  *
* Jesli wyliczona zaliczka jest mniejsza od zera funkcja zwraca 0             *
*******************************************************************************
FUNCTION PLICZ_D15()
local lstopa:=zstopa,llicz_d15
if zpkw_wolna
  llicz_d15=KJ_ROUND(plicz_m13()*(lstopa/100),2)-KJ_ROUND(zlkw_wolna/12,2)
else
  llicz_d15=KJ_ROUND(plicz_m13()*(lstopa/100),2)
endif
if llicz_d15<0
  llicz_d15=0
endif  
RETURN llicz_d15

*******************************************************************************
* Zaliczka na podatek dochodowy po potraceniu skladki na ubezpieczenie zdrowo-*
* tne. Jesli skladka wieksza od zaliczki funkcja zwraca 0                     *
*******************************************************************************
FUNCTION PLICZ_D16()
local llicz_d16:=KJ_ROUND(plicz_d15()-plicz_d14(),1)
if llicz_d16<0
  llicz_d16=0
endif
RETURN llicz_d16

*******************************************************************************
* Kwota do wyplaty. (Przychod ogolem-skladki spoleczne-zdrowotne faktycznie   *
* pobrane-zaliczka na podatek dochodowy-skladki{na zycie,inne}+zasilki        *
*******************************************************************************
FUNCTION PLICZ_D23()
local llicz_d23:=plicz_m8()-plicz_d9()-plicz_d10()-plicz_d11()-plicz_d30()-plicz_d16()-zpsk_zycie-zpsk_inne+zpzasilek+zpzas_inne
RETURN llicz_d23

*******************************************************************************
* Skladka ubezpieczenia zdrowotnego faktycznie pobrana w danym miesiacu       *
* do wysokosci podatku dochodowego                                            *
*******************************************************************************
FUNCTION PLICZ_D30()
local llicz_d30:=plicz_d14()
if plicz_d14()>plicz_d15()
  llicz_d30:=plicz_d15()
endif
RETURN llicz_d30

*******************************************************************************
* Funkcja wylicza nalezna skladke wypadkowa pracownika                        *
*******************************************************************************
FUNCTION PLICZ_D31()
local llicz_d31:=KJ_ROUND(plicz_d7()*(zlsk_wypad/100),2)
RETURN llicz_d31

*******************************************************************************
* Funkcja wylicza sume skladek ubezp.spol. + skladka zdrowotna faktycznie     *
* pobrana w danym miesiacu                                                    *
*******************************************************************************
FUNCTION PLICZ_D32()
local llicz_d32:=2*plicz_d9()+2*plicz_d10()+plicz_d11()+plicz_d31()+plicz_d30()
RETURN llicz_d32

*******************************************************************************
* Funkcja wylicza sume skladek ubezp.spol. (konto 51) dla wybranego pracownika*
*******************************************************************************
FUNCTION PLICZ_D33()
local llicz_d33:=2*plicz_d9()+2*plicz_d10()+plicz_d11()+plicz_d31()
RETURN llicz_d33

*******************************************************************************
* Funkcja wylicza przychod ogolem : suma wynagrodzenia+chorobowe  pracownika  *
*******************************************************************************
FUNCTION PLICZ_M8()
local llicz_m8:=plicz_d7()+zpza_chor
RETURN llicz_m8

*******************************************************************************
* Podstawa naliczania podatku dochodowego: od przychodu ogolem odjeto koszty  *
* uzyskania oraz sume skladek ubezpieczenia spolecznego poniesionych przez    *
* pracownika (m8-m9-d9-d10-d11)
*******************************************************************************
FUNCTION PLICZ_m13()
local llicz_m13:=KJ_ROUND(plicz_m8()-zpkoszty-plicz_d9()-plicz_d10()-plicz_d11(),0)
RETURN llicz_m13


*******************************************************************************
* Funkcja podlicza sume wynagrodzen wszystkich pracownikow                    *
*******************************************************************************
FUNCTION PLICZ_S7()
local llicz_s7:=0,lrecno:=recno()
go top
do while.not.eof()
  p_lad()
  llicz_s7=llicz_s7+plicz_d7()
  skip
enddo  
go lrecno
p_lad()
RETURN llicz_s7

*******************************************************************************
* Funkcja podlicza sume skladek usezpieczen spolecznych wszystkich pracownikow*
*******************************************************************************
FUNCTION PLICZ_S12()
local llicz_s12:=0,lrecno:=recno()
go top
do while.not.eof()
  p_lad()
  llicz_s12=llicz_s12+plicz_d12()
  skip
enddo  
go lrecno
p_lad()
RETURN llicz_s12

*******************************************************************************
* Funkcja podlicza sume naleznych skladek na ubezpieczenie zdrowotne          *
* (nie sa to skladki faktycznie pobrane!)
*******************************************************************************
FUNCTION PLICZ_S14()
local llicz_s14:=0,lrecno:=recno()
go top
do while.not.eof()
  p_lad()
  llicz_s14=llicz_s14+plicz_d14()
  skip
enddo  
go lrecno
p_lad()
RETURN llicz_s14

*******************************************************************************
* Funkcja podlicza sume zaliczek na podatek dochodowy do potracenia           *
* (obejmuje zaliczke na podatek zgodnie z widelkami pomniejszona o kwote      *
* skladki na ubezpieczenie zdrowotne                                          *
*******************************************************************************
FUNCTION PLICZ_S16()
local llicz_s16:=0,lrecno:=recno()
go top
do while.not.eof()
  p_lad()
  llicz_s16=llicz_s16+plicz_d16()
  skip
enddo  
go lrecno
p_lad()
RETURN llicz_s16

*******************************************************************************
* Laczna kwota zasilkow rodzinnych i zasilkow innych dla wszystkich pracownik *
*******************************************************************************
FUNCTION PLICZ_S22()
local llicz_s22:=0,lrecno:=recno()
go top
do while.not.eof()
  p_lad()
  llicz_s22=llicz_s22+zpzasilek  
  skip
enddo  
go lrecno
p_lad()
RETURN llicz_s22

*******************************************************************************
* Laczna kwota wyplaty dla wszystkich pracownikow                             *
*******************************************************************************
FUNCTION PLICZ_S23()
local llicz_s23:=0,lrecno:=recno()
go top
do while.not.eof()
  p_lad()
  llicz_s23=llicz_s23+plicz_d23()
  skip
enddo  
go lrecno
p_lad()
RETURN llicz_s23


*******************************************************************************
* Funkcja podlicza sume pobranych skladek na ubezpieczenie zdrowotne          *
*     (sa to skladki faktycznie pobrane!)
*******************************************************************************
FUNCTION PLICZ_S30()
local llicz_s30:=0,lrecno:=recno()
go top
do while.not.eof()
  p_lad()
  llicz_s30=llicz_s30+plicz_d30()
  skip
enddo  
go lrecno
p_lad()
RETURN llicz_s30


******************************************************************************



FUNCTION LP_NEW(pmiesiac)
local prac_sel,prac_last
prac_default()
select 0
lsukces=prac_use(pmiesiac)
prac_sel=select()
if.not.lsukces
  return .f.
endif
if lastrec()=0.and.kj_gkom(12," Uwaga ! ","Otwieram nowy miesiac na bazie miesiaca poprzedniego.","Wykonac ?",.t.,5)
  select 0
  lsukces=prac_use(pmiesiac-1)
  prac_last=select()
  if.not.lsukces
    return .f.
  endif
  do while.not.eof()
    p_lad()
	select &prac_sel
	append blank
    p_replac()
	pk_replac()
	select &prac_last	    
    skip
  enddo
endif
close all
RETURN .t.

FUNCTION P_DEFAULT()
set default to
*set default to pracow
prac_default()
RETURN

FUNCTION PRAC_BYL()
local lbyl:=.t.,select:=select(),lrecno:=recno()
if zmiesiac>1
  select 0
  prac_use(zmiesiac-1)
  locate for pnumer=zpnumer
  if.not.found()
	lbyl=.f.
  endif
  use  
endif
select &select
go lrecno
RETURN lbyl


FUNCTION P_FULL_TLO()
local ltytul:="                      S P I S     P R A C O W N I K O W                         "  
clear
kj_okno(0,0,24,ltytul,1)
set color to
@ 20,1 clear to 23,78
@ 20,1 say replicate(chr(176),78)
RETURN nil


FUNCTION P_MENU(ppoz1,pster)
local topis[10],ek
local lbelka:="° Szukaj ° Dopisz ° Uzupelnij ° Popraw ° Kasuj ° dRukuj °[Esc]°"
local lliter:="  S        D        U           P        K        R                   "
topis[1]:="Szukaj pracownika po nazwie"
topis[2]:="Dopisz nowego pracownuka"
topis[3]:="Uzupelnij dane pracownika : Kasa Chorych, ZUS, US, konto, zatrudnienie"
topis[4]:="Popraw podswietlona pozycje"
topis[5]:="Kasuj podswietlona pozycje"
topis[6]:="Wydruki indywidualne"
topis[7]:="Powrot z menu do tabeli"
*topis[8]:="Wyjdz do poprzedniego menu"
if ppoz1=0
  ppoz1=1
endif
if pster
  ppoz1=menu_poziom(1,1,7,lbelka,lliter,topis,ppoz1,.f.,.f.)
else
  plac_tlo()
  ppoz1=menu_poziom(1,1,7,lbelka,lliter,topis,ppoz1,.t.,.f.)
endif
RETURN ppoz1



FUNCTION LP_FU(tryb,numer)
local last:=lastkey(),lpoz:=1,lpoz_pom:=1,recno:=recno(),topis[8],lind:=1
topis[1]:="Podaj nazwe kontrahenta"
topis[2]:="Podaj NIP kontrahenta"
topis[3]:="Podaj szukana sekwencje znakow"
topis[4]:="Ustaw warunki filtrujace"
topis[5]:="Nowy kontrahent"
topis[6]:="Zmiana parametrow kontrahenta"
topis[7]:="Usuwanie kontrahenta z kartoteki"
topis[8]:="Wydruk spisu kontrahentow"
p_lad()
do skom with "[Tab]-MENU    Klawisze aktywne:{ S,D,P,U,K,R }  [Enter]-zatw. [Esc]-rezygn."
do case
  case last=27
    vmenu_end=.t.	  
    return 0	  
  case last=13
    do skom with topis[5]
    p_lad()
	if p_kwoty(k_w,k_k)
      keyboard chr(205)
	  return 2
	else
	  vmenu_end=.t.
      keyboard chr(205)
      return 2	  
	endif  

  case chr(last)$"Ss"
    do skom with topis[1]
	p_naz_szuk()
    keyboard chr(19)
	return 2	  	
  case chr(last)$"Dd"
    do skom with topis[5]
    p_lad()
	if p_dopisz(k_w,k_k)
	  enter=.f.
      keyboard chr(205)
	  return 2
	else
	  vmenu_end=.t.
	  enter=.f.
	  keyboard chr(205)
      return 2	  
	endif  
  case chr(last)$"Uu"
    do skom with topis[5]
    p_lad()	
	p_uzup()
    keyboard chr(205)
	return 2	
  case chr(last)$"Pp"
    do skom with topis[6]
	p_popraw(7,25)
	enter=.f.
    keyboard chr(205)
	return 2
  case chr(last)$"Kk"
    do skom with topis[7]
    skip
	recno=recno()
	skip -1
    p_kasuj()
	keyboard chr(205)
    go recno
	return 2		

  case chr(last)$"Rr"
    do skom with topis[8]
    *karta_druk()
	
	ind_druk()
	
    keyboard chr(205)	
	return 2			
  
  case lastkey()=9
	lpoz=p_menu(lpoz,.t.)
	if lastkey()=27
	  keyboard chr(205)
	  return 2
	endif
	do case
      case lpoz=1
	    p_naz_szuk()
        p_menu(lpoz_pom,.f.) 
        keyboard chr(205)
        return 2
	  case lpoz=2
        p_dopisz(7,25)  		
		keyboard chr(205)
	    return 2		
      case lpoz=3
	    p_lad()
		p_uzup()
      case lpoz=4	  
        p_popraw(7,25)
		keyboard chr(205)
	    return 2		
      case lpoz=5
	    p_kasuj()
		keyboard chr(205)
	    return 2				
      case lpoz=6
        *karta_druk()
		ind_druk()
		keyboard chr(205)
	    return 2						
      case lpoz=7
	    keyboard chr(205)
      case lpoz=7.or.lastkey()=27
        vmenu_end=.t.	  
        return 0	
    endcase
endcase
p_oknopom()
RETURN 1



FUNCTION P_UZUP()
local ek,select:=select(),lcolor:=setcolor(),lmenu:=1
local lkget:=.f.       &&Wynik funkcji k_get()
save screen to ek
do while.t.
  lmenu=prac_menu(lmenu)
  if lastkey()=27
    exit
  endif
  do case
    case lmenu=1
      us_baza(1,.f.)
    case lmenu=2
      us_baza(2,.f.)
    case lmenu=3
      us_baza(3,.f.)	  	  
    case lmenu=4
      pkonto()
    case lmenu=5
      pzatrud()	  
    case lmenu=6
	  pzasilki()
  endcase
enddo
restore screen from ek
RETURN lkget

FUNCTION P_DOPISZ(prow,pcol)
local ek,lnip_byl:=.f.,lnaz_byl:=.f.,lkoncz:=.f.
local select:=select(),lcolor:=setcolor()
local lkget:=.f.       &&Wynik funkcji k_get()
k_w:=3
k_k:=29  
save screen to ek
p_zer()
p_dop_tlo()
if enter
  p_say()
else
  p_zer()
endif  
lkget=p_get(.t.)
if lkget
  if.not.prac_jest()
    select 0
    if kj_use("praclast",.t.,3)
      replace prac_num with prac_num+1
      zpnumer=prac_num
      use
    else
      restore screen from ek
      return .f.
    endif
    select &select
    append blank
    p_replac()
    p_uzup()     
  endif
endif  
restore screen from ek
RETURN lkget

FUNCTION P_POPRAW(prow,pcol)
local ek,lnip_byl:=.f.,lnaz_byl:=.f.,lkoncz:=.f.,lkon_byl:=.f.
local select:=select(),recno:=recno()
k_w:=3
k_k:=29
save screen to ek
p_dop_tlo()
p_say()
*if p_get(.f.).and..not.prac_jest()
if p_get(.f.)
  go recno
  p_replac()
  if zsiec
    select 0
    set default to &k_sciezka
    if kj_use("kon",.t.,3)
      set index to k_num,k_naz,k_nip  
	  seek zknum
	  if found()
	    p_replac()
	  endif	
	  use
    endif	
    select &select
  endif
endif  
restore screen from ek
RETURN (NIL)


FUNCTION P_KASUJ()
local select:=select(),ek,recno:=recno()
save screen to ek
k_w=3
k_k=12
p_dop_tlo()
p_say()
zz=.t.
do gkom with "Usunac ?  [T/N] ",zz
if zz.and.lastkey()#27
  delete
  pack
  go recno
endif
*if siec
*  select 0
*  set default to &k_sciezka
*  if kj_use("kon",.t.,3)
*    set index to k_num,k_naz,k_nip  
*    seek zknum
*	if found()
*	  delete
*	  pack
*	endif	
*	use
*  endif	
*  select &select
*endif
restore screen from ek
RETURN NIL



FUNCTION P_NAZ_SZUK()
local ltxt:=space(30),ek,lcolor:=setcolor(),recno:=recno()
save screen to ek
set color to
@ 21,1 clear to 23,78
@ 22,16 say "Podaj nazwisko:"
set cursor on
@ 22,35 get ltxt picture "@!"
read
set cursor off
if lastkey()#27
  seek alltrim(ltxt)
  if.not.found()
    do tkom with "Pozycja nie odnaleziona.  Nacisnij dowolny klawisz."
	go recno
  endif
endif
restore screen from ek
setcolor(lcolor)
RETURN NIL



FUNCTION P_DOP_TLO()
local ltytul:="             *   P R A C O W N I K   *             "   
local lcolor:=setcolor()
g_tlo()
kj_okno(k_w,k_k,20,ltytul,7)	
set color to gr+	
@ k_w+2,k_k+4 say "Nazwisko ............."  &&28
@ k_w+3,k_k+4 say "Imie pierwsze ........"         &&10
@ k_w+4,k_k+4 say "Imie drugie .........."         &&12
@ k_w+5,k_k+4 say "Data ur. (dd.mm.rr) .."         &&12
@ k_w+6,k_k+4 say "Miejsce urodzenia ...."         &&12
@ k_w+7,k_k+4 say "Imie ojca ............"         &&12
@ k_w+8,k_k+4 say "Imie matki ..........."         &&12
@ k_w+9,k_k+4 say "Pesel ................"          &&12
@ k_w+10,k_k+4 say "Nip .................."          &&12	
@ k_w+11,k_k+4 say "Adres: Miejscowosc ..."          &&12	
@ k_w+12,k_k+4 say "       Ulica ........."          &&12	
@ k_w+13,k_k+4 say "       Numer domu ...."          &&12	
@ k_w+14,k_k+4 say "       Numer lokalu .."          &&12	
@ k_w+15,k_k+4 say "       Kod pocztowy .."          &&12	
@ k_w+16,k_k+4 say "       Poczta ........"          &&12	
@ k_w+17,k_k+4 say "       Gmina ........."          &&12	
@ k_w+18,k_k+4 say "       Wojewodztwo ..."          &&12	
*@ k_w+19,k_k+4 say "Uwagi ................"          &&12	

setcolor(lcolor)
RETURN nil

FUNCTION P_SAY()
local lcolor:=setcolor()
set color to W+	
@ k_w+2,k_k+26 say zpnazwisko
@ k_w+3,k_k+26 say zpimie1
@ k_w+4,k_k+26 say zpimie2
@ k_w+5,k_k+26 say zpdata_ur
@ k_w+6,k_k+26 say SUBSTR(zpmiejsc_ur,1,20)
@ k_w+7,k_k+26 say zpimie_ojca
@ k_w+8,k_k+26 say zpimie_matk
@ k_w+9,k_k+26 say zppesel
@ k_w+10,k_k+26 say zpnip
@ k_w+11,k_k+26 say zpmiejscow
@ k_w+12,k_k+26 say zpulica
@ k_w+13,k_k+26 say zpdom_nr
@ k_w+14,k_k+26 say zplokal_nr
@ k_w+15,k_k+26 say zpkod      
@ k_w+16,k_k+26 say zppoczta   
@ k_w+17,k_k+26 say zpgmina    
@ k_w+18,k_k+26 say zpwojew    
*@ k_w+19,k_k+26 say SUBSTR(zpuwagi,1,20)    

setcolor(lcolor)
RETURN nil



FUNCTION P_GET(pdopisz)
local lcolor:=setcolor(),las,las1,lget,select:=select()
public vrow:=k_w+2
*set confirm off
zk_5=2
zk_24=18
set key 5 to koncz5()
set key 24 to koncz24()
set color to	
set cursor on
do while.t.
  do case
    case vrow=k_w+2
      @ k_w+2,k_k+26 get zpnazwisko picture "@!"
	case vrow=k_w+3  
      @ k_w+3,k_k+26 get zpimie1 picture "@!"
	case vrow=k_w+4  
      @ k_w+4,k_k+26 get zpimie2 picture "@!"
    case vrow=k_w+5	  
      @ k_w+5,k_k+26 get zpdata_ur
	case vrow=k_w+6  
      @ k_w+6,k_k+26 get zpmiejsc_ur picture "@S20!"
	case vrow=k_w+7  
      @ k_w+7,k_k+26 get zpimie_ojca picture "@!"	  
	case vrow=k_w+8  
	  @ k_w+8,k_k+26 get zpimie_matk picture "@!"	  
    case vrow=k_w+9	  
      @ k_w+9,k_k+26 get zppesel
	case vrow=k_w+10  
      @ k_w+10,k_k+26 get zpnip
	case vrow=k_w+11  
      @ k_w+11,k_k+26 get zpmiejscow picture "@!"	  
    case vrow=k_w+12
      @ k_w+12,k_k+26 get zpulica picture "@!"	  
	case vrow=k_w+13  
      @ k_w+13,k_k+26 get zpdom_nr picture "@!"	  
	case vrow=k_w+14  
      @ k_w+14,k_k+26 get zplokal_nr picture "@!"	  
	case vrow=k_w+15  
      @ k_w+15,k_k+26 get zpkod picture "@!"	  
	case vrow=k_w+16  
      @ k_w+16,k_k+26 get zppoczta picture "@!"	    
	case vrow=k_w+17  
      @ k_w+17,k_k+26 get zpgmina picture "@!"	     
	case vrow=k_w+18  
      @ k_w+18,k_k+26 get zpwojew picture "@!"	     
*	case vrow=k_w+19  
*      @ k_w+19,k_k+26 get zpuwagi picture "@S20!"  	  	  	  	  	  
  endcase
  read
  tone(1000,0.5)

  do case
    case lastkey()=3.and.zkey10=.t.
	  zkey10=.f.
	  exit
	case lastkey()=27.or.(lastkey()=13.and.vrow=k_w+18).or.lastkey()=18
	  exit  
    case lastkey()=13.or.lastkey()=24  &&nastepna
	  vrow=vrow+1
    case lastkey()=5                   &&poprzednia
      if vrow>k_w+2
	    vrow=vrow-1	  
	  endif	
  endcase
  p_say()
enddo
if.not.lastkey()=27
  lget=.t.
else
  lget=.f.
endif
set cursor off
setcolor(lcolor)
set key 24 to
set key 5 to
*set confirm on
RETURN lget


FUNCTION P_REPLAC()
replace pnazwisko with zpnazwisko,pimie1 with zpimie1,pimie2 with zpimie2
replace pdata_ur with zpdata_ur,pmiejsc_ur with zpmiejsc_ur
replace pimie_ojca with zpimie_ojca,pimie_matk with zpimie_matk
replace ppesel with zppesel,pnip with zpnip,pmiejscow with zpmiejscow
replace pulica with zpulica,pdom_nr with zpdom_nr,plokal_nr with zplokal_nr
replace pkod with zpkod,ppoczta with zppoczta,pgmina with zpgmina
replace pwojew with zpwojew,pgrupa with zpgrupa,pmagazyn with zpmagazyn
replace puwagi with zpuwagi,pnumer with zpnumer
*replace plog_e with .t.,plog_r with .t.,plog_c with .t., plog_z with .t.
*replace pkw_wolna with .t.
replace plog_e with zplog_e, plog_r with zplog_r, plog_c with zplog_c
replace plog_z with zplog_z,pkw_wolna with zpkw_wolna
replace pstart with zpstart,pend with zpend,petat with zpetat
replace pkonto with zpkonto,pkas_kod with zpkas_kod,pus_kod with zpus_kod
replace pzus_kod with zpzus_kod,pstart with zpstart,pend with zpend
replace petat with zpetat
RETURN nil

FUNCTION P_ZER()  
zpnazwisko=space(20)
zpimie1=space(12)
zpimie2=space(12)
zpdata_ur=ctod("  .  .  ")
zpmiejsc_ur=space(30)
zpimie_ojca=space(12)
zpimie_matk=space(12)
zppesel=space(11)
zpnip=space(13)
zpmiejscow=space(20)
zpulica=space(20)
zpdom_nr=space(10)
zplokal_nr=space(10)
zpkod=space(6)
zppoczta=space(20)
zpgmina=space(20)
zpwojew=space(20)
zpzasadn=0
zpdodatek=0
zppremia=0
zpza_chor=0
zpkoszty=0
zpkw_wolna=.t.
zpsk_zycie=0
zpsk_inne=0
zpzasilek=0
zpzas_inne=0
zplog_e=.t.
zplog_r=.t.
zplog_c=.t.
zplog_z=.t.
zpgrupa=space(5)
zpmagazyn=0
zpuwagi=space(30)
zpnumer=0
zpetat=1
zpstart=date()
zpend=ctod(space(8))
zpkonto=space(60)
zpkas_kod=space(3)
zpus_kod=space(3)
zpzus_kod=space(3)
RETURN  nil

FUNCTION US_ZER()
zkod=space(3)
znazwa=space(30)
zmiasto=space(30)
zulica=space(30)
znumer=space(10)
zkod_poczt=space(6)
zkonto1=space(60)
zkonto2=space(60)
zkonto3=space(60)
RETURN nil

FUNCTION US_LAD()
zkod=kod
znazwa=nazwa
zmiasto=miasto
zulica=ulica
znumer=numer
zkod_poczt=kod_poczt
zkonto1=konto1
zkonto2=konto2
zkonto3=konto3
RETURN nil

FUNCTION US_REPLAC()
replace kod with zkod,miasto with zmiasto,ulica with zulica,numer with znumer
replace kod_poczt with zkod_poczt,konto1 with zkonto1,konto2 with zkonto2
replace konto3 with zkonto3,nazwa with znazwa 
RETURN nil

FUNCTION P_LAD()  
zpnazwisko=pnazwisko
zpimie1=pimie1
zpimie2=pimie2
zpdata_ur=pdata_ur
zpmiejsc_ur=pmiejsc_ur
zpimie_ojca=pimie_ojca
zpimie_matk=pimie_matk
zppesel=ppesel
zpnip=pnip
zpmiejscow=pmiejscow
zpulica=pulica   
zpdom_nr=pdom_nr  
zplokal_nr=plokal_nr
zpkod=pkod    
zppoczta=ppoczta  
zpgmina=pgmina   
zpwojew=pwojew   
zpzasadn=pzasadn
zpdodatek=pdodatek
zppremia=ppremia
zpza_chor=pza_chor
zpkoszty=pkoszty
zpkw_wolna=pkw_wolna
zpsk_zycie=psk_zycie
zpsk_inne=psk_inne
zpzasilek=pzasilek
zpzas_inne=pzas_inne
zplog_e=plog_e
zplog_r=plog_r
zplog_c=plog_c
zplog_z=plog_z
zpgrupa=pgrupa
zpmagazyn=pmagazyn
zpuwagi=puwagi   
zpnumer=pnumer
zpstart=pstart
zpend=pend
zpetat=petat
zpkonto=pkonto
zpkas_kod=pkas_kod
zpus_kod=pus_kod
zpzus_kod=pzus_kod
RETURN  nil


FUNCTION PUBLIC_PRAC
public zpnazwisko:=space(20),zpimie1:=space(12),zpimie2:=space(12)
public zpdata_ur:=ctod("  .  .  "),zpmiejsc_ur:=space(30)
public zpimie_ojca:=space(12),zpimie_matk:=space(12),zppesel:=space(11)
public zpnip:=space(13),zpmiejscow:=space(20),zpulica:=space(20)
public zpdom_nr:=space(10),zplokal_nr:=space(10),zpkod:=space(6)
public zppoczta:=space(20),zpgmina:=space(20),zpwojew:=space(20)
public zpzasadn:=0,zpdodatek:=0,zppremia:=0,zpza_chor:=0,zpkoszty:=0,zpkw_wolna:=0
public zpgrupa:=space(5),zpmagazyn:=0,zpuwagi:=space(30),zpnumer:=0
public zpsk_zycie:=0,zpsk_inne:=0,zpzasilek:=0,zpzas_inne:=0
public zplog_e:=.t.,zplog_r:=.t.,zplog_c:=.t.,zplog_z:=.t.
public zpstart:=date(),zpend:=ctod(space(8)),zpetat:=1,zpkonto:=space(60)
public zpkas_kod:=space(3),zpus_kod:=space(3),zpzus_kod:=space(3)
RETURN nil

FUNCTION PUBLIC_US()
public zkod:=space(3),znazwa:=space(30),zmiasto:=space(30),zulica:=space(30)
public znumer:=space(10),zkod_poczt:=space(6),zkonto1:=space(60)
public zkonto2:=space(30),zkonto3:=space(30)
RETURN nil


FUNCTION PRAC_USE(pmiesiac)
local lsukces:=.f.
do case
  case pmiesiac=1
    if kj_use("place_01",.t.,3)
      set index to place_01
      lsukces=.t.
	endif  
  case pmiesiac=2
    if kj_use("place_02",.t.,3)
      set index to place_02
	  lsukces=.t.
	endif  
  case pmiesiac=3
    if kj_use("place_03",.t.,3)
      set index to place_03
	  lsukces=.t.
	endif  
  case pmiesiac=4
    if kj_use("place_04",.t.,3)
      set index to place_04
	  lsukces=.t.
	endif  
  case pmiesiac=5
    if kj_use("place_05",.t.,3)
      set index to place_05
	  lsukces=.t.
	endif  
  case pmiesiac=6
    if kj_use("place_06",.t.,3)
      set index to place_06
	  lsukces=.t.
	endif  
  case pmiesiac=7
    if kj_use("place_07",.t.,3)
      set index to place_07
	  lsukces=.t.
	endif  
  case pmiesiac=8
    if kj_use("place_08",.t.,3)
      set index to place_08
	  lsukces=.t.
	endif  
  case pmiesiac=9
    if kj_use("place_09",.t.,3)
      set index to place_09
	  lsukces=.t.
	endif  
  case pmiesiac=10
    if kj_use("place_10",.t.,3)
      set index to place_10
	  lsukces=.t.
	endif  
  case pmiesiac=11
    if kj_use("place_11",.t.,3)
      set index to place_11
	  lsukces=.t.
	endif  
  case pmiesiac=12
    if kj_use("place_12",.t.,3)
      set index to place_12											
	  lsukces=.t.
	endif  
endcase
RETURN lsukces


FUNCTION PRAC_USE1(pmiesiac)
local lsukces:=.f.
do case
  case pmiesiac=1
    lsukces=kj_use("place_01",.t.,3)
    set index to place_01
  case pmiesiac=2
    lsukces=kj_use("place_02",.t.,3)
    set index to place_02
  case pmiesiac=3
    lsukces=kj_use("place_03",.t.,3)
    set index to place_03
  case pmiesiac=4
    lsukces=kj_use("place_04",.t.,3)
    set index to place_04
  case pmiesiac=5
    lsukces=kj_use("place_05",.t.,3)
    set index to place_05
  case pmiesiac=6
    lsukces=kj_use("place_06",.t.,3)
    set index to place_06
  case pmiesiac=7
    lsukces=kj_use("place_07",.t.,3)
    set index to place_07
  case pmiesiac=8
    lsukces=kj_use("place_08",.t.,3)
    set index to place_08
  case pmiesiac=9
    lsukces=kj_use("place_09",.t.,3)
    set index to place_09
  case pmiesiac=10
    lsukces=kj_use("place_10",.t.,3)
    set index to place_10
  case pmiesiac=11
    lsukces=kj_use("place_11",.t.,3)
    set index to place_11
  case pmiesiac=12
    lsukces=kj_use("place_12",.t.,3)
    set index to place_12											
endcase
RETURN lsukces


FUNCTION WYBOR_FIR()
local lnum:=zfnum,t[2],q[2],ek,lcolor:=setcolor()
t[1]:="fnum"
t[2]:="fnaz1"
q[1]:="Numer"
q[2]:="Nazwa firmy"
save screen to ek
do skom with "[PgUp]-wybor        [Enter]-zatwierdzenie numeru firmy "
@ 4,27 to 6,53
@ 5,29 say "Podaj numer firmy:    "
set cursor on
@ 5,48 get lnum picture "999" range 1,zi_lp
read
set cursor off
set default to lpset
if kj_use("lpfirma",.t.,3)
  locate for fnum=lnum
  if.not.lastkey()=18
    if.not.found()
      kj_tkom(11," Uwaga! ","Firma o numerze "+str(lnum,3),"nie zostala zdefiniowana.","Nacisnij dowolny klawisz.",5) 
    else
      fir_lad()
	  use
	  restore screen from ek
	  prac_default()
	  return
    endif
  endif
  g_tlo()
  kj_okno(3,40,20,"             F  I  R  M  A              ",7)
  kj_okno(3,40,18,"             F  I  R  M  A              ",7)  
  do skom with "Dopisz    Popraw    [Enter]-zatwierdz    [Esc]-zrezygnuj"
  keyboard chr(205)
  dbedit(4,41,20,78,t,"FL_FU","",q,"ß")
endif
restore screen from ek
use
prac_default()
RETURN nil

FUNCTION FL_FU(tryb,numer)
local last:=lastkey(),lfnaz1:=space(30),ek
do case
  case last=27
    return 0
  case last=13
    fir_lad()  	
    return 0
  case chr(lastkey())$"Dd"
    save screen to ek
    fir_dopisz()
	if lastkey()#27
	  go bottom
	  zfnum=fnum+1
	  append blank
	  fir_replac()
	endif  
	keyboard chr(205)
	restore screen from ek
  case chr(lastkey())$"Pp"
    save screen to ek
	k_w:=0
    k_k:=0  
    fir_lad()
    fir_dop_tlo()
	fir_say()
	fir_get()
	if lastkey()#27
      fir_replac()
	endif
	restore screen from ek	
endcase
RETURN 1


FUNCTION PUBLIC_FIR()
public zfnum:=1,zfnaz1:=space(30),zfnaz2:=space(30),zfkod:=space(6)
public zfmiasto:=space(30),zfulica:=space(30),zfnip:=space(13),zfregon:=space(10)
public zfkonto:=space(90),zskarbowy:=space(30),zsk_kod:=space(6),zfpesel:=space(11)
public zsk_miasto:=space(30),zsk_ulica:=space(30),zsk_konto:=space(90)
public zzus:=space(30),zzus_kod:=space(6),zzus_miasto:=space(30)
public zzus_ulica:=space(30),zzus_k1:=space(90),zzus_k2:=space(90)
public zzus_k3:=space(90),zzus_k4:=space(90)
RETURN

FUNCTION FIR_REPLAC()
replace fnum with zfnum,fnaz1 with zfnaz1, fnaz2 with zfnaz2,fkod with zfkod
replace fmiasto with zfmiasto,fulica with zfulica,fnip with zfnip
replace fregon with zfregon,fpesel with zfpesel,fkonto with zfkonto
replace skarbowy with zskarbowy,sk_kod with zsk_kod,sk_miasto with zsk_miasto
replace sk_ulica with zsk_ulica,sk_konto with zsk_konto,zus with zzus
replace zus_kod with zzus_kod,zus_miasto with zzus_miasto
replace zus_ulica with zzus_ulica,zus_konto1 with zzus_k1
replace zus_konto2 with zzus_k2,zus_konto3 with zzus_k3
replace zus_konto4 with zzus_k4
RETURN nil


FUNCTION FIR_LAD()
zfnum=fnum
zfnaz1=fnaz1  
zfnaz2=fnaz2
zfkod=fkod
zfmiasto=fmiasto
zfulica=fulica
zfnip=fnip
zfregon=fregon
zfpesel=fpesel
zfkonto=fkonto
zskarbowy=skarbowy
zsk_kod=sk_kod
zsk_miasto=sk_miasto
zsk_ulica=sk_ulica
zsk_konto=sk_konto
zzus=zus
zzus_kod=zus_kod
zzus_miasto=zus_miasto
zzus_ulica=zus_ulica
zzus_k1=zus_konto1
zzus_k2=zus_konto2
zzus_k3=zus_konto3
zzus_k4=zus_konto4
RETURN

FUNCTION FIR_ZER()
zfnum=0
zfnaz1=space(30)
zfnaz2=space(30)
zfkod=space(6)
zfmiasto=space(30)
zfulica=space(30)
zfnip=space(13)
zfregon=space(10)
zfpesel=space(11)
zfkonto=space(90)
zskarbowy=space(30)
zsk_kod=space(6)
zsk_miasto=space(30)
zsk_ulica=space(30)
zsk_konto=space(90)
zzus=space(30)
zzus_kod=space(6)
zzus_miasto=space(30)
zzus_ulica=space(30)
zzus_k1=space(90)
zzus_k2=space(90)
zzus_k3=space(90)
zzus_k4=space(90)
RETURN

FUNCTION PRAC_DEFAULT()
local ldefault:="lp000"
set default to
do case
  case zfnum<10
    ldefault=stuff(ldefault,5,1,str(zfnum,1))
  case zfnum>=10.and.zfnum<100
    ldefault=stuff(ldefault,4,2,str(zfnum,2))	
  case zfnum>=100
    ldefault=stuff(ldefault,3,3,str(zfnum,3))		
endcase
set default to &ldefault
RETURN


*******************************************************************************
* Tworzy menu uaktywniajace funkcje techniczne programu                       *
*******************************************************************************
FUNCTION PRAC_MENU(ppoz)
local ltnaz[6],ltlit[6],ltopis[6],lbelka:="",lpoz:=ppoz
lbelka=   " DANE UZUPELNIAJACE  "
ltnaz[1]:=" Urzad Skarbowy       "
ltnaz[2]:=" Z U S                "
ltnaz[3]:=" Kasa Chorych         "
ltnaz[4]:=" Konto bankowe        "
ltnaz[5]:=" Zatrudnienie         "
ltnaz[6]:=" zAsilki              "
ltlit[1]:="       S      "
ltlit[2]:=" Z            "
ltlit[3]:="      C       "
ltlit[4]:=" K            "
ltlit[5]:=" Z            "
ltlit[6]:="  A           "
ltopis[1]:="Urzad Skarbowy wlasciwy w sprawie podatku dochodowego pracownika"
ltopis[2]:="Zaklad Ubezpieczen Spolecznych wlasciwy dla pracownika"
ltopis[3]:="Kasa Chorych do ktorej nalezy pracownik"
ltopis[4]:="Konto bankowe pracownika"
ltopis[5]:="Data zatrudnienia, etat, data zwolnienia"
ltopis[6]:="Liczba osob na ktore wyplacany jest zasilek rodzinny i pielegnacyjny"
g_tlo()
save screen to ek
*set color to
*@ 6,24 clear to 14,49
@ 6,24,15,49 box chr(176)
  lpoz=men_pion(7,25,6,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz


*******************************************************************************
* Tworzy menu wydruku indywidualnego                                          *
*******************************************************************************
FUNCTION IND_DRUK_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz
lbelka=   ""
ltnaz[1]:=" Karta pracownicza  "
ltnaz[2]:=" Raport  R M U A    "
ltnaz[3]:=" Raport  R  N  A    "
ltlit[1]:=" K                  "
ltlit[2]:=" R                  "
ltlit[3]:="            N       "
ltopis[1]:="Indywidualna karta pracownicza"
ltopis[2]:="Raport miesieczny  RMUA"
ltopis[2]:="Raport imienny  RNA"
  lpoz=men_pion(2,49,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz


FUNCTION PKONTO()
local ek,lcolor:=setcolor()
save screen to ek
kj_okno(16,9,2, "              Nazwa i numer konta bankowego                   ",2)
@ 18,10 say ">"
@ 18,40 say ">"
set cursor on
set color to
@ 17,10 get zpkonto picture "@!"
read 
set cursor off
if lastkey()#27
  replace pkonto with zpkonto	
endif  
restore screen from ek
setcolor(lcolor)
RETURN nil


FUNCTION PZATRUD()
local ek,lcolor:=setcolor(),select:=select()
local ltytul:="",lkod:=""
public ztyt_num:=val(alltrim(substr(zpuwagi,7,2))),zkod_num:=val(alltrim(substr(zpuwagi,10,2)))
save screen to ek
set default to lpset
select 0
if file("ub_tytul.dbf")
  if kj_use("ub_tytul",.f.,3)
    tyt_sel=select()
    locate for num=ztyt_num
	if found()
      ltytul=tytul
	else
	  go top
	endif  
  endif
endif

select 0
if file("ub_kod.dbf")
  if kj_use("ub_kod",.f.,3)
    kod_sel=select()
    locate for num=zkod_num
	if found()
	  lkod=kod
	else
	  go top
	endif  
  endif
endif

kj_okno(12,31,10, "              Zatrudnienie                ",2)
@ 14,34 say "Nazwisko:"
@ 14,44 say zpnazwisko
@ 15,34 say "Imie:"
@ 15,44 say zpimie1
@ 16,34 say "Data rozpoczecia pracy:"
@ 17,34 say "Zatrudnienie w wymiarze       etatu"
@ 18,34 say "Tytul ubezpieczenia:   "+substr(ltytul,1,15)   
@ 19,34 say "Kod tytulu ubezp.  :       "+substr(lkod,1,15)   
@ 20,34 say "Data zakonczenia pracy:"
set cursor on
set color to
@ 16,58 get zpstart when s_kom("Data rozpoczecia pracy w formacie  (dd.mm.rr)")
@ 17,58 get zpetat picture "9.99" when s_kom("Wymiar czasu pracy przeliczony na etaty")
@ 18,54 get ztyt_num picture "99" when tyt_slow()
@ 19,54 get zkod_num  picture "99" when kod_slow()
@ 20,58 get zpend when s_kom("Data zakonczenia pracy w formacie  (dd.mm.rr)")
read 
set cursor off
select &tyt_sel
use
select &kod_sel
use
prac_default()
select &select
zpuwagi=stuff(puwagi,7,2,str(ztyt_num,2))
zpuwagi=stuff(zpuwagi,9,1,",")
zpuwagi=stuff(zpuwagi,10,2,str(zkod_num,2))
zpuwagi=stuff(zpuwagi,12,1,",")

if lastkey()#27
  replace pstart with zpstart,petat with zpetat,pend with zpend
  replace puwagi with zpuwagi
endif
restore screen from ek
setcolor(lcolor)

RETURN nil


FUNCTION PZASILKI()
local ek,lcolor:=setcolor(),select:=select()
public zrodz_ile:=val(alltrim(substr(zpuwagi,1,2))),zpiel_ile:=val(alltrim(substr(zpuwagi,4,2)))
save screen to ek
kj_okno(12,31,9,"                 Zasilki                  ",2)
@ 14,34 say "Nazwisko:"
@ 14,44 say zpnazwisko
@ 15,34 say "Imie:"
@ 15,44 say zpimie1
@ 17,34 say "Z A S I L E K :" 
@ 18,34 say "Rodzinny  -  liczba osob :"   
@ 18,65 say zrodz_ile picture "99"
@ 19,34 say "Pielegnacyjny - liczba osob :"
@ 19,65 say zpiel_ile picture "99"
set cursor on
set color to
@ 18,65 get zrodz_ile picture "99" when s_kom("Liczba osob na ktore wyplacany jest zasilek rodzinny.")
@ 19,65 get zpiel_ile picture "99" when s_kom("Liczba osob na ktore wyplacany jest zasilek pielegnacyjny.")
read 
set cursor off
zpuwagi=stuff(puwagi,1,2,str(zrodz_ile,2))
zpuwagi=stuff(zpuwagi,3,1,",")
zpuwagi=stuff(zpuwagi,4,2,str(zpiel_ile,2))
zpuwagi=stuff(zpuwagi,6,1,",")

if lastkey()#27
  replace puwagi with zpuwagi
endif
restore screen from ek
setcolor(lcolor)

RETURN nil




FUNCTION US_BAZA(pbaz,pkatal)
local ek,ltyt:=space(80),t[9],q[9],select:=select(),recno:=recno()
t[1]:="kod"
t[2]:="nazwa"
t[3]:="miasto"
t[4]:="ulica"
t[5]:="numer"
t[6]:="kod_poczt"
t[7]:="konto1"
t[8]:="konto2"
t[9]:="konto3"

q[1]:="Kod"
q[2]:="Nazwa"
q[3]:="Adres: miejscowosc"
q[4]:="Ulica"
q[5]:="Numer"
q[6]:="Kod_pocztowy"
q[7]:="Konto 1"
q[8]:="Konto 2"
q[9]:="Konto 3"
save screen to ek
g_tlo()
set default to &zlurzad_server
select 0
do case
  case pbaz=1
    ltyt="           URZAD    SKARBOWY            "
	if.not.kj_use("us",.t.,3)
	  prac_default()
	  select &select
	  return 
	endif
  case pbaz=2
    ltyt="    ZAKLAD UBEZPIECZEN SPOLECZNYCH      "
	if.not.kj_use("zus",.t.,3)
	  prac_default()
	  select &select
	  return 
	endif
  case pbaz=3
    ltyt="            KASA    CHORYCH             "
	if.not.kj_use("kasa_ch",.t.,3)
	  prac_default()
	  select &select
	  return 
	endif		
endcase

kj_okno(10,0,13,ltyt,1)
setcolor("n/w,w/n") 
keyboard chr(205)
do skom with "Dopisz   Popraw   Kasuj   [Enter]-zatw. [Esc]-rezygn."
dbedit(11,1,22,38,t,"US_FU","",q,"ß")
use
prac_default()
if pkatal
  restore screen from ek
  RETURN nil
endif
select &select
go recno
if lastkey()=13
  do case
    case pbaz=1
      zpus_kod=zkod
	  replace pus_kod with zpus_kod
    case pbaz=2
	  zpzus_kod=zkod
      replace pzus_kod with zpzus_kod
    case pbaz=3
	  zpkas_kod=zkod
      replace pkas_kod with zpkas_kod
  endcase 
endif
restore screen from ek
RETURN nil

FUNCTION US_FU(tryb,numer)
local last:=lastkey(),ek
us_lad()
do case
  case chr(last)$"Dd"
    save screen to ek
	us_zer()
	us_dop_tlo()
    if us_get()
      append blank
	  us_replac()	
	endif
    restore screen from ek
	keyboard chr(205)
	return 2
  case chr(last)$"Pp"
    save screen to ek
	us_dop_tlo()
	us_say()
	if us_get()
	  us_replac()	
	endif
    restore screen from ek
	keyboard chr(205)
	return 2	
  case chr(last)$"Kk"
    save screen to ek
	us_dop_tlo()
    us_say()
	if kj_gkom(17," Uwaga ! ","Usunac pozycje",znazwa,.t.,5) 
	  delete
	  pack
	endif
    restore screen from ek
	keyboard chr(205)
	return 2
  case last=13
    return 0    
  case last=27
    return 0
endcase
RETURN 1

FUNCTION US_DOP_TLO()
kj_okno(8,17,10, "                                                ",5)
@ 10,19 say "Indeks ......"
@ 11,19 say "Nazwa ......."
@ 12,19 say "Kod pocztowy "
@ 13,19 say "Miejscowosc  "
@ 14,19 say "Ulica ......."
@ 15,19 say "Numer ......."
@ 16,19 say "Konto ......."
RETURN nil

FUNCTION US_GET()
local lcolor:=setcolor(),lget,luskod_byl:=.f.,lkod:=zkod
public vrow:=10
k_w=0
zk_5=10
zk_24=16
set key 5 to koncz5()
set key 24 to koncz24()
set cursor on
do while .t.
  do case
    case vrow=10
     @ 10,33 get zkod picture "@!" 
    case vrow=11    	 
      @ 11,33 get znazwa picture "@!"
    case vrow=12	  
      @ 12,33 get zkod_poczt picture "@!"
    case vrow=13	  
      @ 13,33 get zmiasto picture "@!"
    case vrow=14	  
      @ 14,33 get zulica picture "@!"
    case vrow=15	  
      @ 15,33 get znumer picture "@!"
    case vrow=16	  
      @ 16,33 get zkonto1 picture "@!S30"
  endcase
  read
  if vrow=10.and.lkod#zkod
    luskod_byl=uskod_byl()
  endif	

  do case
    case lastkey()=3.and.zkey10=.t.
	  zkey10=.f.
	  exit
	case lastkey()=27.or.(lastkey()=13.and.vrow=k_w+16).or.lastkey()=18
	  exit  
    case lastkey()=13.or.lastkey()=24  &&nastepna
	  vrow=vrow+1
    case lastkey()=5                   &&poprzednia
      if vrow>10
	    vrow=vrow-1	  
	  endif	
  endcase
  us_say()
enddo
tone(1000,0.5)
set key 24 to
set key 5 to
setcolor(lcolor)
if.not.lastkey()=27
  lget=.t.
else
  lget=.f.
endif
if zkod#lkod.and.luskod_byl
  kj_tkom(12," Uwaga ! ","Bledny kod urzedu. Nie bedzie zapamietany","","Nacisnij dowolny klawisz.",5)
  zkod=lkod
endif
set cursor off
RETURN lget

FUNCTION US_SAY()
local lcolor:=setcolor(),lrow:=10
set color to n/w,w/n
@ lrow,33 say zkod
@ lrow+1,33 say znazwa
@ lrow+2,33 say zkod_poczt
@ lrow+3,33 say zmiasto
@ lrow+4,33 say zulica
@ lrow+5,33 say znumer
@ lrow+6,33 say substr(zkonto1,1,30)
setcolor(lcolor)
RETURN nil

FUNCTION P_OKNOPOM()
local lcolor:=setcolor()
set color to g/gr+ 
@ 20,1 say replicate("°",78)
set color to
@ 21,2 say zpmiejscow
@ 22,2 say zpulica
@ 23,2 say zpuwagi
@ 21,40 say "Kod:  URZEDU SKARBOWEGO ........"
@ 22,40 say "      ZAKLADU UB.SPOLECZNYCH ..."
@ 23,40 say "      KASY CHORYCH ............."
@ 21,73 say zpus_kod
@ 22,73 say zpzus_kod
@ 23,73 say zpkas_kod
setcolor(lcolor)
RETURN nil

FUNCTION FIR_DOPISZ()
local ek,lnip_byl:=.f.,lnaz_byl:=.f.,lkoncz:=.f.
local select:=select(),lcolor:=setcolor()
local lkget:=.f.       &&Wynik funkcji k_get()
k_w:=0
k_k:=0  
save screen to ek
fir_zer()
fir_dop_tlo()
fir_get()
RETURN
 

FUNCTION FIR_DOP_TLO()
local ltytul:="             P A R A M E T R Y     F I R M Y                 "   
local lcolor:=setcolor()
kj_okno(k_w,k_k,17,ltytul,7)	
set color to gr+	
@ k_w+2,k_k+4  say "Nazwa ................"
@ k_w+3,k_k+4  say "Nazwa / cd / ........."
@ k_w+4,k_k+4  say "Nip .................."
@ k_w+5,k_k+4  say "Regon ................"
@ k_w+6,k_k+4  say "Pesel ................"
@ k_w+7,k_k+4  say "Kod pocztowy ........."
@ k_w+8,k_k+4  say "Miejscowosc .........."
@ k_w+9,k_k+4  say "Ulica ................"
@ k_w+10,k_k+4  say "Konto bankowe ........"
@ k_w+11,k_k+4 say "Wspolpracownicy ......"
@ k_w+12,k_k+4 say "ZUS: przelew ........."
@ k_w+13,k_k+4 say "ZUS: pieczec ........."
@ k_w+14,k_k+4 say "ZUS: nazwa platnika .."
@ k_w+15,k_k+4 say "ZUS:typ identyfikacji "
setcolor(lcolor)
RETURN nil

FUNCTION FIR_GET()
local lcolor:=setcolor(),las,las1,lget,lwspol_ile:=val(substr(zskarbowy,1,1))
local lprzelew:=substr(zskarbowy,2,1), lpieczec:=substr(zskarbowy,3,1)
local lnaz_czlon:=substr(zskarbowy,4,1), ltyp_ident:=substr(zskarbowy,5,1)
public vrow:=k_w+2
*set confirm off
zk_5=2
zk_24=15
set key 5 to koncz5()
set key 24 to koncz24()
set color to	
set cursor on
do while.t.
  do case
    case vrow=k_w+2
      @ k_w+2,k_k+26 get zfnaz1 picture "@!" when s_kom("[Enter]-zatwierdz.pozycji   [Ctrl-Enter]-zatwierdz.wszystkiego   [Esc]-rezygn.")
	case vrow=k_w+3  
      @ k_w+3,k_k+26 get zfnaz2 picture "@!"	  
	case vrow=k_w+4  
      @ k_w+4,k_k+26 get zfnip picture "@!"  	  	  	  	  	   
    case vrow=k_w+5	  
      @ k_w+5,k_k+26 get zfregon picture "@!"  	  	  	  	  	  
	case vrow=k_w+6  
      @ k_w+6,k_k+26 get zfpesel picture "@!"  	  	  	  	  	  
	case vrow=k_w+7  
      @ k_w+7,k_k+26 get zfkod picture "@!"  	  	  	  	  	  
	case vrow=k_w+8  
	  @ k_w+8,k_k+26 get zfmiasto picture "@!"	  
    case vrow=k_w+9	  
      @ k_w+9,k_k+26 get zfulica picture "@!"	  
	case vrow=k_w+10  
      @ k_w+10,k_k+26 get zfkonto  picture "@S30!" when s_kom("[Enter]-zatwierdz.pozycji   [Ctrl-Enter]-zatwierdz.wszystkiego   [Esc]-rezygn.")
	case vrow=k_w+11  
      @ k_w+11,k_k+26 get lwspol_ile picture "9" range 0,2 when s_kom("0 - brak,   1 - jedna,    2 - dwie osoby wspolpracujace)")	  
	case vrow=k_w+12  
      @ k_w+12,k_k+26 get lprzelew picture "!"  when s_kom("T - platne przelewem   F - platne gotowka.")
	case vrow=k_w+13  
      @ k_w+13,k_k+26 get lpieczec picture "!" when s_kom("T - drukuj dane wplacajacego    F - pozostaw puste miejsce na pieczatke.")
	case vrow=k_w+14  
      @ k_w+14,k_k+26 get lnaz_czlon picture "!" when s_kom("1 - drukuj pierwsza czesc      2 - drukuj druga czesc nazwy platmikadane wplacajacego    F - pozostaw puste miejsce na pieczatke.")	  
	case vrow=k_w+15  
      @ k_w+15,k_k+26 get ltyp_ident picture "!" when s_kom("R - regon     P - pesel")
  endcase
  read
  tone(1000,0.5)

  do case
    case lastkey()=3.and.zkey10=.t.
	  zkey10=.f.
	  if lwspol_ile>0
	    wspol_get()
	  endif
	  exit
	case lastkey()=27.or.(lastkey()=13.and.vrow=k_w+15).or.lastkey()=18
	  if lwspol_ile>0
	    wspol_get()
	  endif
	  exit  
    case lastkey()=13.or.lastkey()=24  &&nastepna
	  vrow=vrow+1
    case lastkey()=5                   &&poprzednia
      if vrow>k_w+2
	    vrow=vrow-1	  
	  endif	
  endcase
  fir_say()
enddo
if.not.lastkey()=27
  lget=.t.
  if.not.lprzelew="T"
    lprzelew="F"
  endif
  if.not.lpieczec="T"
    lpieczec="F"
  endif  
  zskarbowy=stuff(zskarbowy,1,1,str(lwspol_ile,1))
  zskarbowy=stuff(zskarbowy,2,1,lprzelew)
  zskarbowy=stuff(zskarbowy,3,1,lpieczec)
  zskarbowy=stuff(zskarbowy,4,1,lnaz_czlon)
  zskarbowy=stuff(zskarbowy,5,1,ltyp_ident)
else
  lget=.f.
endif
set cursor off
setcolor(lcolor)
set key 24 to
set key 5 to
*set confirm on
RETURN lget


FUNCTION FIR_SAY()
local lcolor:=setcolor()
set color to W+	

@ k_w+2,k_k+26 say zfnaz1 picture "@!"	  
@ k_w+3,k_k+26 say zfnaz2 picture "@!"	  
@ k_w+4,k_k+26 say zfnip picture "@!"  	  	  	  	  	   
@ k_w+5,k_k+26 say zfregon picture "@!"  	  	  	  	  	  
@ k_w+6,k_k+26 say zfpesel picture "@!"  	  	  	  	  	  
@ k_w+7,k_k+26 say zfkod picture "@!"  	  	  	  	  	  
@ k_w+8,k_k+26 say zfmiasto picture "@!"	  
@ k_w+9,k_k+26 say zfulica picture "@!"	  
@ k_w+10,k_k+26 say zfkonto  picture "@S30!"
*@ k_w+11,k_k+26 say substr(zskarbowy,1,1)
*@ k_w+12,k_k+26 say substr(zskarbowy,2,1)
*@ k_w+13,k_k+26 say substr(zskarbowy,3,1)

setcolor(lcolor)
RETURN nil


FUNCTION BIL_MIES()
local lprac_sum:=0,lbrutto_sum:=0,lzdrow_sum:=0,lpodat_sum:=0,ek,lcolor:=setcolor()
local lpodstawa_sum:=0
local ltyt:=space(80)
select 0
if.not.prac_use(zmiesiac)
  return
endif
lprac_sum=lastrec()
do while.not.eof()
  p_lad()
  zlicz()
  lpodstawa_sum=lpodstawa_sum+plicz_d13()
*  lbrutto_sum=lbrutto_sum+plicz_d7()+zpza_chor
  lzdrow_sum=lzdrow_sum+plicz_d30()
  lpodat_sum=lpodat_sum+plicz_d16()
  skip
enddo
use
save screen to ek
ltyt=stuff(ltyt,22,25,"Podsumowanie za miesiac: ")
ltyt=stuff(ltyt,49,len(alltrim(mies_nazwa(zmiesiac))),alltrim(mies_nazwa(zmiesiac)))
kj_okno(0,0,24,ltyt,2)
@ 2,2 say "PLATNIK:"
@ 3,2 say "========"
@ 5,2 say alltrim(zfnaz1)+"  "+alltrim(zfnaz2)
@ 8,2  say "Liczba pracownikow ..........................."
*@ 10,2 say "Wynagrodzenie brutto ........................."
@ 10,2 say "Suma wyplat podlegajacych opodatkowaniu ......"
@ 12,2 say "Skladki ubezpieczenia zdrowotnego (pobrane) .." 
@ 14,2 say "Zaliczka na podatek dochodowy (potracona) ...."
@ 8,55 say lprac_sum picture "99 999 999"
*@ 10,55 say lbrutto_sum picture "99 999 999.99"
@ 10,55 say lpodstawa_sum picture "99 999 999.99"
@ 12,55 say lzdrow_sum picture "99 999 999.99"
@ 14,55 say lpodat_sum picture "99 999 999.99"
if kj_gkom(16,"                          ","Wydrukowac ?","",.t.,5)
*  bil_druk(lprac_sum,lbrutto_sum,lzdrow_sum,lpodat_sum)
  bil_druk(lprac_sum,lpodstawa_sum,lzdrow_sum,lpodat_sum)
endif
restore screen from ek
setcolor(lcolor)
RETURN nil



FUNCTION ZLA_INSTAL()
lzla:=.t.
select 0
set default to leg01
if kj_use("leg01",.f.,3)
  locate for leg_kod="LP010"
  if found()
    lzla=.f.
  endif
  use
endif
RETURN lzla

FUNCTION LICENCJA()
l_licencja:=.f.
select 0
set default to leg01
if kj_use("leg01",.f.,3)
  locate for leg_kod="LP010"
  if found().and.l123.and.lkod=1010
    l_licencja=.t.
  endif
  use
endif
RETURN l_licencja

FUNCTION DEMO_END()
ldemo_end:=.t.
select 0
set default to leg01
if kj_use("leg01",.t.,3)
  locate for leg_kod="LP010"
  if found().and.(l123.and.lkod=1010.or.((date()-ldat)<=ld.and.lkod=2222))
    ldemo_end=.f.
  else
    replace lkod with 11111
  endif
  use
endif
RETURN ldemo_end

FUNCTION KONCZ()
set key 24 to
set key 5 to
zkey10=.t.
keyboard chr(3)
RETURN NIL

FUNCTION PRAC_JEST()
local lbyl:=.f.
seek zpnazwisko
if found()
  do while pnazwisko=zpnazwisko
    if pimie1=zpimie1.and.pimie2=zpimie2.and.pdata_ur=zpdata_ur.and.ppesel=zppesel
	  kj_tkom(12," Uwaga! ","Pracownik o tym nazwisku, imionach, dacie urodzenia","oraz numerze PESEL juz istnieje w bazie.","Nie bedzie ponownie wpisany. Nacisnij dowolny klawisz",5)
	  lbyl=.t.
	endif
    skip
  enddo
endif
RETURN lbyl

FUNCTION SKLADKI_MIES(ptryb)
local lprac_sum:=0,lbrutto_sum:=0,lzdrow_sum:=0,lpodat_sum:=0,ek,lcolor:=setcolor()
local lpodstawa_sum:=0
local ltyt:=space(80)
local L51_dawca,L51_wspol1,L51_wspol2,L52_dawca,L52_wspol1,L52_wspol2
local L51_wnik_all:=0,L51_all:=0,lzasilek_all:=0
local L52_wnik_all:=0,llicz_d7_all:=0,L53_all:=0
local llpodstawp:=zlpodstawp,llpodstaw1:=zlpodstaw1,llpodstaw2:=zlpodstaw2
*
if zw_lp
  if substr(zskarbowy,1,1)="0".or.substr(zskarbowy,1,1)=" "
    llpodstaw1=0.00
    llpodstaw2=0.00
  endif
  if substr(zskarbowy,1,1)="1"
    llpodstaw2=0.00
  endif  

endif
*
L51_dawca=KJ_ROUND(llpodstawp*(2*zlsk_emeryt/100),2)+KJ_ROUND(llpodstawp*(2*zlsk_rent/100),2)+KJ_ROUND(llpodstawp*zlsk_chorob/100,2)+KJ_ROUND(llpodstawp*zlsk_wypad/100,2)
L51_wspol1=2*KJ_ROUND(llpodstaw1*zlsk_emeryt/100,2)+2*KJ_ROUND(llpodstaw1*zlsk_rent/100,2)+KJ_ROUND(llpodstaw1*zlsk_chorob/100,2)+KJ_ROUND(llpodstaw1*zlsk_wypad/100,2)
L51_wspol2=2*KJ_ROUND(llpodstaw2*zlsk_emeryt/100,2)+2*KJ_ROUND(llpodstaw2*zlsk_rent/100,2)+KJ_ROUND(llpodstaw2*zlsk_chorob/100,2)+KJ_ROUND(llpodstaw2*zlsk_wypad/100,2)

L52_dawca=KJ_ROUND(llpodstawp*zlsk_zdrow/100,2)
L52_wspol1=KJ_ROUND((llpodstaw1 -(KJ_ROUND(llpodstaw1*zlsk_emeryt/100,2)+KJ_ROUND(llpodstaw1*zlsk_rent/100,2)+KJ_ROUND(llpodstaw1*zlsk_chorob/100,2)))*(zlsk_zdrow/100),2)
L52_wspol2=KJ_ROUND((llpodstaw2 -(KJ_ROUND(llpodstaw2*zlsk_emeryt/100,2)+KJ_ROUND(llpodstaw2*zlsk_rent/100,2)+KJ_ROUND(llpodstaw2*zlsk_chorob/100,2)))*(zlsk_zdrow/100),2)

select 0
if.not.prac_use(zmiesiac)
  return
endif
lprac_sum=lastrec()
do while.not.eof()
  p_lad()
  zlicz()
  L51_wnik_all=L51_wnik_all+plicz_d33()
  lzasilek_all=lzasilek_all+zpzasilek+zpzas_inne
  L52_wnik_all=L52_wnik_all+plicz_d30()
  llicz_d7_all=llicz_d7_all+plicz_d7()
  
  skip
enddo
use
L51_all=L51_dawca+L51_wspol1+L51_wspol2+L51_wnik_all
L52_all=L52_dawca+L52_wspol1+L52_wspol2+L52_wnik_all
L53_all=KJ_ROUND((llicz_d7_all+llpodstawp+llpodstaw1+llpodstaw2)*(zlsk_fundus/100),2)
save screen to ek
do case
  case ptryb=1
    ltyt=stuff(ltyt,22,25,"Podsumowanie skladek za miesiac: ")
    ltyt=stuff(ltyt,57,len(alltrim(mies_nazwa(zmiesiac))),alltrim(mies_nazwa(zmiesiac)))
    kj_okno(0,0,24,ltyt,2)
    @ 1,2 say "PLATNIK:"
    @ 1,12 say alltrim(zfnaz1)+"  "+alltrim(zfnaz2)
    @ 2,2 say replicate("=",len(alltrim(zfnaz1))+len(alltrim(zfnaz2))+12)
    @ 4,2  say "                                      SKLADKI UBEZPIECZENIA"
    @ 5,2 say  "                        SPOLECZNEGO  (Konto 51)      ZDROWOTNEGO  (Konto 52)"
    @ 6,2 say "Pracodawca ............"
    @ 7,2 say "Wspolpracownik (1) ...."
    @ 8,2 say "Wspolpracownik (2) ...."
    @ 9,2 say "Pracownicy ............"
    @ 10,2 say"                         -------------                 ---------------"
    @ 11,2 say"          Razem:   " 
    @ 12,2 say"          - odliczenia"
    @ 13,2 say"          Do zaplaty"
    @ 15,2 say"SKLADKI NA FUNDUSZ PRACY  (Konto 53)  ................ "
    @ 17,2 say"RAZEM: (Spoleczne)-(odliczenia)+(Zdrowotne)+(Fundusz) ="
    @ 6,27 say L51_dawca picture "99 999 999.99"
    @ 7,27 say L51_wspol1 picture "99 999 999.99"
    @ 8,27 say L51_wspol2 picture "99 999 999.99"
    @ 9,27 say L51_wnik_all picture "99 999 999.99"
    @ 11,27 say L51_all picture "99 999 999.99"
    @ 12,27 say lzasilek_all picture "99 999 999.99"
    @ 13,27 say L51_all-lzasilek_all picture "99 999 999.99"
    @ 6,59 say L52_dawca picture "99 999 999.99"
    @ 7,59 say L52_wspol1 picture "99 999 999.99"
    @ 8,59 say L52_wspol2 picture "99 999 999.99"
    @ 9,59 say L52_wnik_all picture "99 999 999.99"
    @ 11,59 say L52_all picture "99 999 999.99"
    @ 15,59 say L53_all picture "99 999 999.99"
    @ 17,59 say L51_all-lzasilek_all+L52_all+L53_all picture "99 999 999.99"
    if kj_gkom(19,"                          ","Wydrukowac ?","",.t.,5)
      skladki_druk(L51_dawca,L51_wspol1,L51_wspol2,L51_wnik_all,L52_dawca,L52_wspol1,L52_wspol2,L52_wnik_all,L53_all,lzasilek_all)
    endif
  
  case ptryb=2
    * Szczegoly skladek
	
  case ptryb=3      && wydruk przelewow
    przel_druk(l51_all,l52_all,l53_all)		
endcase
restore screen from ek
setcolor(lcolor)
RETURN nil

FUNCTION USKOD_BYL()
local lbyl:=.f.,recno:=recno()
if zkod=space(3)
  kj_tkom(12," Uwaga! ","Urzad musi miec nadany kod","Wpisz kod!","Nacisnij dowolny klawisz.",5)     
  lbyl=.t.
  return lbyl
endif
go top

do while.not.eof()
  if zkod=kod
    kj_tkom(12," Uwaga! ","Urzad o podanym kodzie juz istnieje","Zmien kod!","Nacisnij dowolny klawisz.",5)  
    lbyl=.T.
	exit
  endif
  skip
enddo
go recno
set cursor on
RETURN lbyl

FUNCTION ZLEG_PUBLIC()
public zlic1:=space(50),zlic2:=space(50),zlic3:=space(6)
public zlic4:=space(50),zlic5:=space(50),zlic6:=space(13)
public zlic0:=space(15)
public zleg_kod:=space(5),zlz1:=.f.,zlz2:=.f.,zlz3:=.f.,zl123:=.f.
public zlkod:=0,zldat:=date(),zld:=14
public zlic_regon:=space(10),zlic_pesel:=space(11),zlic_konto:=space(60)
public zlic_tel:=space(15),zlic_fax:=space(15)
RETURN nil

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

FUNCTION PLIK_DRU_LAD()
zlista_plik=lista_plik
zkarta_plik=karta_plik
zkasa_plik=kasa_plik
zbilmies_plik=bilmies_pl
zskladki_plik=skladki_pl
RETURN nil

FUNCTION ADMINIST_LAD()
local lsukces:=.f.
if kj_use("administ",.f.,3)
  do while.not.eof()
    do case
	  case serwer="URZEDY"
	    zlurzad_serwer=l_serwer
		zsurzad_serwer=s_serwer
		zurzad_siec=siec
		zurzad_tryb=tryb  
	endcase
    skip
  enddo
  lsukces=.t.
endif
RETURN lsukces

FUNCTION ZADMIN_PUBLIC()
public zserwer:=space(8), zlurzad_serwer:="urzedy", zsurzad_serwer:="urzedy"
public zsiec:=.f.,zurzad_tryb:=0,zurzad_siec:=.f.
RETURN

FUNCTION ZPRZEL_PUBLIC()
public zrow:=0,zcol:=0,zdruk_il:=2,zprzelew:=.f.,zpieczec:=.f.,zk_spol:=space(2)
public zk_zdrow:=space(2),zk_fundusz:=space(2),znaz_czlon:=space(1)
public ztyp_ident:=space(1),ztyp_wplaty:=space(1),znum_deklar:=space(2)
public zprzel_mies:=space(2),zprzel_rok:=space(4),ztyp_pdruk:=1
RETURN

FUNCTION ZPRZEL_LAD()
zrow=row
zcol=col
zdruk_il=druk_il
zprzelew=przelew
zpieczec=pieczec
zk_spol=k_spol
zk_zdrow=k_zdrow
zk_fundusz=k_fundusz
znaz_czlon=naz_czlon
ztyp_ident=typ_ident
ztyp_wplaty=typ_wplaty
znum_deklar=num_deklar
ztyp_pdruk=typ_pdruk
RETURN 

FUNCTION PRZEL_REPLAC()
replace row with zrow, col with zcol, druk_il with zdruk_il
replace przelew with zprzelew, pieczec with zpieczec
replace k_spol with zk_spol, k_zdrow with zk_zdrow, k_fundusz with zk_fundusz
replace naz_czlon with znaz_czlon, typ_ident with ztyp_ident
replace typ_wplaty with ztyp_wplaty, num_deklar with znum_deklar
replace typ_pdruk with ztyp_pdruk
RETURN nil


* ptryb=0 - tylko pokaz (_SAY)
FUNCTION PRZEL_PAR(ptryb)
local lrow,lcol,ldruk_il,lprzelew,lpieczec,lcolor:=setcolor(),ltyp_pdruk
local lk_spol,lk_zdrow,lk_fundusz,lnaz_czlon,ltyp_ident,ltyp_wplaty,lnum_deklar 
local ltyt:="* P A R A M E T R Y    W Y D R U K U *"
g_tlo()
select 0
set default to lpset
if.not.kj_use("przelew",.f.,3)
  return .f.
endif
zprzel_lad()
zprzel_mies=zp_mies()
zprzel_rok=zp_rok()
lprzel_mies=zprzel_mies
lprzel_rok=zprzel_rok
lrow=row
lcol=col
ldruk_il=druk_il
lprzelew=przelew
lpieczec=pieczec
lk_spol=k_spol
lk_zdrow=k_zdrow
lk_fundusz=k_fundusz
lnaz_czlon=naz_czlon
ltyp_ident=typ_ident
ltyp_wplaty=typ_wplaty
lnum_deklar=num_deklar
ltyp_pdruk=typ_pdruk
use

    if zw_lp
      if kj_use("lpfirma",.f.,3)
        locate for fnum=zfnum
		if found()
          if substr(skarbowy,2,1)="T"
		    lprzelew=.t.
		  else
		    lprzelew=.f.
		  endif	
		  if substr(skarbowy,3,1)="T"
		    lpieczec=.t.
		  else
		    lpieczec=.f.
		  endif	
		endif	  
	  endif	  
	  znaz_czlon=substr(skarbowy,4,1)
	  ztyp_ident=substr(skarbowy,5,1)
	  zprzelew=lprzelew
      zpieczec=lpieczec
	  lnaz_czlon=znaz_czlon
	  ltyp_ident=ztyp_ident
	  use
	endif


kj_okno(5,0,18,ltyt,8)
@ 7,3 say "Numer deklaracji .........."
@ 8,3  say "Data: miesiac ............."
@ 9,3  say "Data: rok ................."
@ 10,3 say "Przesuniecie w pionie ....."
@ 11,3 say "Przesuniecie w poziomie ..."
@ 12,3 say "Ilosc wydrukow ............"
@ 13,3 say "Przelew bankowy ........ .."
@ 14,3 say "Wydruk pieczeci ..........." 
@ 15,3 say "Ub.spoleczne:  konto ......"
@ 16,3 say "Ub.zdrowotne:  konto ......"
@ 17,3 say "Fundusz pracy: konto ......"
@ 18,3 say "Nazwa platnika ............"
@ 19,3 say "Typ id. uzupelniajacego ..."
@ 20,3 say "Typ wplaty ................"
@ 21,3 say "Typ drukarki .............."
set color to n/w,w/n
if ptryb=1
  do while.t.
    set cursor on
    @ 7,31 get znum_deklar when s_kom("Numer deklaracji zwiazanej z powyzsza wplata (w postaci dwuznakowej np. 00 01 02")
    @ 8, 31 get zprzel_mies when s_kom("Numer miesiaca ktorego dotyczy wplata.") 
    @ 9, 29 get zprzel_rok when s_kom("Rok ktorego dotyczy wplata.") 
	@ 10,30 get zrow picture "999" when s_kom("Przesuniecie w pionie - ilosc wierszy.")
    @ 11,30 get zcol picture "999" when s_kom("Przesuniecie w poziomie -  ilosc kolumn.")
    @ 12,30 get zdruk_il picture "999"when s_kom("Ilosc wydrukow tego samego typu.")
    @ 13,32 get zprzelew when s_kom("T - platne w formie przelewu bankowego   F - platne gotowka")
    @ 14,32 get zpieczec when s_kom("T - drukuj dane wplacajacego   F - pozostaw puste miejsce na pieczatke")
    @ 15,31 get zk_spol when s_kom("Koncowka konta ubezpieczen spolecznych") 
    @ 16,31 get zk_zdrow when s_kom("Koncowka konta ubezpieczen zdrowotnych") 
    @ 17,31 get zk_fundusz when s_kom("Koncowka konta funduszu pracy")
    @ 18,32 get znaz_czlon when s_kom("1 - drukuj pierwszy czlon nazwy  2 - drukuj drugi czlon nazwy ")
    @ 19,32 get ztyp_ident  picture "!" when s_kom("P - pesel      R - regon")
    @ 20,32 get ztyp_wplaty  picture "!" when s_kom("S-skladka za 1 miesiac,  {M,U,T,D,E,K}-zgodnie z opisem na poleceniu przelewu") 
    @ 21,31 get ztyp_pdruk range 1,2 when s_kom("1 - drukarka atramentowa CANON     2 - drukarka atramentowa HP")
    read
	if.not.ztyp_ident$"RP12"
      do while.t.
	    @ 19,32 get ztyp_ident picture "!" when s_kom("Wpisz znak ze zbioru {P,R,1,2} zgodnie z opisem na druku polecenia przelewu.")
	    read
	    if ztyp_ident$"RP12".or.lastkey()=27
	      exit
	    endif
	  enddo	  
	endif		
	if.not.ztyp_wplaty$"SMUTDEK"
      do while.t.
	    @ 20,32 get ztyp_wplaty picture "!" when s_kom("Wpisz znak ze zbioru {S,M,U,T,D,E,K} zgodnie z opisem na druku polecenia przel.")
	    read
	    if ztyp_ident$"RP12".or.lastkey()=27
	      exit
	    endif
	  enddo	  
	endif			
    exit
  enddo
  set cursor off
endif 
if lastkey()=27
  setcolor(lcolor)
  prac_default()
  return
endif
@ 7,31 say znum_deklar
@ 8, 31 say zprzel_mies
@ 9, 29 say zprzel_rok
@ 10,30 say zrow picture "999"
@ 11,30 say zcol picture "999"
@ 12,30 say zdruk_il picture "999"
@ 13,32 say zprzelew
@ 14,32 say zpieczec  
@ 15,31 say zk_spol
@ 16,31 say zk_zdrow
@ 17,31 say zk_fundusz
@ 18,32 say znaz_czlon
@ 19,32 say ztyp_ident
@ 20,32 say ztyp_wplaty
@ 21,31 say ztyp_pdruk
if zrow#lrow.or.zcol#lcol.or.zdruk_il#ldruk_il.or.zprzelew#lprzelew.or.zpieczec#lpieczec;
   .or.zk_spol#lk_spol.or.zk_zdrow#lk_zdrow.or.zk_fundusz#lk_fundusz.or.;
   znaz_czlon#lnaz_czlon.or.ztyp_ident#ltyp_ident.or.ztyp_wplaty#ltyp_wplaty;
   .or.znum_deklar#lnum_deklar.or.ztyp_pdruk#ltyp_pdruk
  if kj_gkom(12,"","Zapamietac wprowadzone zmiany ?","",.t.,5)
    if kj_use("przelew",.t.,3)
      przel_replac()
      use
	endif         
    if zw_lp
      if kj_use("lpfirma",.t.,3)
        locate for fnum=zfnum
		if found()
		  if zprzelew
		    replace skarbowy with stuff(skarbowy,2,1,"T")
		  else
		    replace skarbowy with stuff(skarbowy,2,1,"F")		  
		  endif
		  if zpieczec
		    replace skarbowy with stuff(skarbowy,3,1,"T")
		  else
		    replace skarbowy with stuff(skarbowy,3,1,"F")		  
		  endif		  
          replace skarbowy with stuff(skarbowy,4,1,znaz_czlon)
		  replace skarbowy with stuff(skarbowy,5,1,ztyp_ident)
		endif	  
	    use
	  endif	  
	endif
  endif
endif
setcolor(lcolor)
prac_default()
RETURN .t.


FUNCTION ZP_MIES()
local lmies:=space(2)
do case
  case month(date())=1
    lmies="12"
  case month(date())=2
    lmies="01"
  case month(date())=3
    lmies="02"
  case month(date())=4
    lmies="03"
  case month(date())=5
    lmies="04"
  case month(date())=6
    lmies="05"
  case month(date())=7
    lmies="06"
  case month(date())=8
    lmies="07"
  case month(date())=9
    lmies="08"
  case month(date())=10
    lmies="09"
  case month(date())=11
    lmies="10"
  case month(date())=12
    lmies="11"										
endcase
RETURN lmies

FUNCTION ZP_ROK()
local lrok:=space(4)
if month(date())=1
  lrok=str(year(date())-1,4)
else
  lrok=str(year(date()),4)
endif
RETURN lrok

FUNCTION UZYT_PAR()
local llic0:=zlic0,llic1:=zlic1,llic2:=zlic2,llic3:=zlic3,llic4:=zlic4,ek
local llic5:=zlic5,llic6:=zlic6,llic_regon:=zlic_regon,llic_pesel:=zlic_pesel
local llic_konto:=zlic_konto,llic_tel:=zlic_tel,llic_fax:=zlic_fax
local ltyt:="    Wlasciciel  LICENCJI :                                                      "
local lcolor:=setcolor()
save screen to ek
clear
kj_okno(0,0,22,ltyt,8)
@ 2,2 say "Nazwa (cz.1)........."
@ 3,2 say "Nazwa (cz.2) ........"
@ 5,2 say "Adres: Kod .........."
@ 6,2 say "       Miejscowosc .."
@ 7,2 say "       Ulica ........"
@ 9,2 say "N I P  .............."
@ 2,24 say llic1 
@ 3,24 say llic2 
@ 5,24 say llic3 
@ 6,24 say llic4 
@ 7,24 say llic5 
@ 9,24 say llic6 
@ 10,1 say replicate("-",78)
@ 12,2 say "Regon ..............."
@ 14,2 say "Pesel ..............."
@ 16,2 say "Konto ..............."
@ 18,2 say "Telefon ............."
@ 20,2 say "Tel/fax ............."

@ 23,5 say "Uwaga! Do zmiany nazwy, adresu lub nipu uzyj dyskietki instalacyjnej."
set cursor on

@ 12,24 get llic_regon when s_kom("Regon firmy")
@ 14,24 get llic_pesel when s_kom("Pesel plasciciela firmy")
@ 16,24 get llic_konto picture "@S50" when s_kom("Konto bankowe firmy")
@ 18,24 get llic_tel when s_kom("Telefon firmowy")
@ 20,24 get llic_fax when s_kom("Drugi telefon lub fax")
read
if llic_regon#zlic_regon.or.llic_pesel#zlic_pesel.or.;
	 llic_konto#zlic_konto.or.llic_tel#zlic_tel.or.llic_fax#zlic_fax
  if kj_gkom(11,"","Zapamietac wprowadzone zmiany ?","",.t.,5)	 
    set default to leg01
	select 0
	if kj_use("leg01",.t.,3)
      replace lic_regon with llic_regon,lic_pesel with llic_pesel
	  replace lic_konto with llic_konto,lic_tel with llic_tel,lic_fax with llic_fax      
      zleg_lad()
      use
	endif
	prac_default()  
  endif
endif	 
if.not.zw_lp
  set default to lpset
  wspol_get()
    if kj_use("lpfirma",.t.,3)
	fir_replac()	
	use
  endif	
  prac_default()  
endif
set cursor off
setcolor(lcolor)
restore screen from ek
RETURN nil


FUNCTION ZRMUA_PUBLIC()
public zrow:=0,zcol:=0,zdruk_il:=2,zpion_ster:="",znum_deklar:=space(2)
public zrmnazwisko:=space(30),zrmimie:=space(30),zrmnazwa:=space(30) 
public zrmdata_ur:=ctod("  .  .  ")
public zrmdat:=date(),zrmua_mies:="",zrmua_rok:=""
RETURN

FUNCTION ZRMUA_LAD()
zrow=row
zcol=col
zdruk_il=druk_il
znum_deklar=num_deklar
zpion_ster=pion_ster
zrmnazwisko=rmnazwisko
zrmimie=rmimie
zrmnazwa=rmnazwa
zrmdata_ur=rmdata_ur
RETURN 

FUNCTION RMUA_REPLAC()
replace row with zrow, col with zcol, druk_il with zdruk_il
replace num_deklar with znum_deklar,pion_ster with zpion_ster
replace rmnazwisko with zrmnazwisko,rmimie with zrmimie
replace rmnazwa with zrmnazwa,rmdata_ur with zrmdata_ur
RETURN nil


* ptryb=0 - tylko pokaz (_SAY)
FUNCTION RMUA_PAR(ptryb,pdok)
local lrow,lcol,ldruk_il,lnum_deklar,lnazwisko,limie,lnazwa,ldata_ur 
local lrmua_mies,lrmua_rok,lrmdat,lcolor:=setcolor(),ek,lbaza:=""
local ltyt:="* P A R A M E T R Y    W Y D R U K U    R A P O R T U   R M U A *"
do case
  case pdok=1
    lbaza="rmua"
  case pdok=2
    lbaza="rna"	
endcase
save screen to ek
g_tlo()
select 0
set default to lpset
if.not.kj_use(lbaza,.f.,3)
  return .f.
endif
zrmua_lad()
zrmua_mies=zp_mies()
zrmua_rok=zp_rok()
lrmua_mies=zrmua_mies
lrmua_rok=zrmua_rok
lrmdat=zrmdat
lrow=row
lcol=col
ldruk_il=druk_il
lnum_deklar=num_deklar
lnazwisko=rmnazwisko
limie=rmimie
lnazwa=rmnazwa
ldata_ur=rmdata_ur

use

    if zw_lp
      if kj_use("lpfirma",.f.,3)
        locate for fnum=zfnum
		if found()
          zrmnazwisko=sk_miasto
		  zrmimie=sk_ulica
		  zrmnazwa=zus
		  zrmdata_ur=ctod(substr(zus_miasto,1,8))
		  lnazwisko=zrmnazwisko
		  limie=zrmimie
		  lnazwa=zrmnazwa
		  ldata_ur=zrmdata_ur
		endif	  
	  use
	  endif	  

	endif


kj_okno(9,0,14,ltyt,8)
@ 11,3 say "Numer deklaracji .........."
@ 12,3  say "Za miesiac .. ............."
@ 13,3  say "W roku ...................."
@ 14,3 say "Data wypelnienia .... ....."
@ 15,3 say "Przesuniecie w pionie ....."
@ 16,3 say "Przesuniecie w poziomie ..."
@ 17,3 say "Ilosc wydrukow ............"
@ 18,3 say "Platnik: Nazwisko ........."
@ 19,3 say "         Imie ............."
@ 20,3 say "         Data urodzenia ..."
@ 21,3 say "         Nazwa skrocona ..."
set color to n/w,w/n
if ptryb=1
  do while.t.
    set cursor on
    @ 11,31 get znum_deklar when s_kom("Numer raportu miesiecznego (w postaci dwuznakowej np. 00 01 02)")
    @ 12, 31 get zrmua_mies when s_kom("Numer miesiaca ktorego dotyczy raport.") 
    @ 13, 29 get zrmua_rok when s_kom("Rok ktorego dotyczy raport.") 
	@ 14,25 get zrmdat  when s_kom("Data wypelnienia raportu (dd/mm/rr).")
	@ 15,30 get zrow picture "999" when s_kom("Przesuniecie w pionie - ilosc wierszy.")	
    @ 16,30 get zcol picture "999" when s_kom("Przesuniecie w poziomie -  ilosc kolumn.")
    @ 17,30 get zdruk_il picture "999"when s_kom("Ilosc wydrukow tego samego typu.")
	@ 18,30 get zrmnazwisko  when s_kom("Dane identyfikacyjne platnika skladek - II/06 Nazwisko")
	@ 19,30 get zrmimie  when s_kom("Dane identyfikacyjne platnika skladek - II/07 	Imie pierwsze")
	@ 20,30 get zrmdata_ur when s_kom("Dane identyfikacyjne platnika skladek - II/09 Data urodzenia")		
	@ 21,30 get zrmnazwa  when s_kom("Dane identyfikacyjne platnika skladek - II/08 Nazwa skrocona")	
    read
    exit
  enddo
  set cursor off
endif 
if lastkey()=27
  setcolor(lcolor)
  restore screen from ek
  prac_default()
  return
endif
@ 11,31 say znum_deklar
@ 12, 31 say zrmua_mies
@ 13, 29 say zrmua_rok
@ 14,25 say zrmdat 
@ 15,30 say zrow picture "999"
@ 16,30 say zcol picture "999"
@ 17,30 say zdruk_il picture "999"
@ 18,30 say zrmnazwisko
@ 19,30 say zrmimie
@ 20,30 say zrmdata_ur
@ 21,30 say zrmnazwa
if zrow#lrow.or.zcol#lcol.or.zdruk_il#ldruk_il.or.znum_deklar#lnum_deklar;
     .or.zrmua_mies#lrmua_mies.or.zrmua_rok#lrmua_rok.or.zrmdat#lrmdat;
 	 .or.zrmnazwisko#lnazwisko.or.zrmimie#limie.or.zrmdata_ur#ldata_ur;
 	 .or.zrmnazwa#lnazwa
  if kj_gkom(12,"","Zapamietac wprowadzone zmiany ?","",.t.,5)
    if kj_use(lbaza,.t.,3)
      rmua_replac()
      use
	endif         
    if zw_lp
      if kj_use("lpfirma",.t.,3)
        locate for fnum=zfnum
	    if found()
          replace sk_miasto with zrmnazwisko,sk_ulica with zrmimie
		  replace zus with zrmnazwa
          replace  zus_miasto with stuff(zus_miasto,1,8,dtoc(zrmdata_ur))
	    endif	  
        use
      endif	  
    endif      
  endif
endif
setcolor(lcolor)
*if.not.ptryb=0
*  restore screen from ek
*endif  
prac_default()
RETURN .t.



FUNCTION IND_DRUK()
local lind:=1,ek
save screen to ek
g1_tlo()
lind=ind_druk_menu(lind)
if.not.lastkey()=27
  do case
    case lind=1
      karta_druk()
    case lind=2
      rmua_zus(1)
    case lind=3
      rna_zus(1)	  
  endcase
endif  
restore screen from ek
RETURN nil

FUNCTION TYT_SLOW(pnum)
local lnum:=pnum,ek,lznak:=lastkey(),lcolor:=setcolor()
select &tyt_sel
save screen to ek
keyboard chr(205)
dbedit(14,1,22,51,"tytul","TYT_FU","","Tytul ubezpieczenia" ,"ß")
restore screen from ek
do case
  case lastkey()=13
    ztyt_num=recno()    	
	set color to n/w,w/n
    @ 18,57 say substr(tytul,1,15)
endcase	
keyboard chr(lznak)
setcolor(lcolor)
RETURN .T.

FUNCTION KOD_SLOW(pnum)
local lnum:=pnum,ek,lznak:=lastkey(),lcolor:=setcolor()
select &kod_sel
save screen to ek
keyboard chr(205)
dbedit(14,1,22,25,"kod","TYT_FU","","Kod tytulu ubezpieczenia" ,"ß")
restore screen from ek
do case
  case lastkey()=13
    zkod_num=recno()
	set color to n/w,w/n
    @ 19,61 say kod
endcase	
keyboard chr(lznak)
setcolor(lcolor)
RETURN .T.

FUNCTION TYT_FU()
if lastkey()=27.or.lastkey()=13
  return 0
endif
RETURN 1

FUNCTION WSPOL_GET()
local lw1_naz:=substr(zzus_k1,1,31),lw1_imie:=substr(zzus_k1,32,22)
local lw1_typ:=substr(zzus_k1,54,1),lw1_iden:=substr(zzus_k1,55,11)
local lw2_naz:=substr(zzus_k2,1,31),lw2_imie:=substr(zzus_k2,32,22)
local lw2_typ:=substr(zzus_k2,54,1),lw2_iden:=substr(zzus_k2,55,11)
local ek,lcolor:=setcolor(),lwspol:=" "
g_tlo()
kj_okno(6,7,14, "          DANE IDENTYFIKACYJNE OSOB WSPOLPRACUJACYCH             ",8)
set color to n/w,w/n
@ 8,9 say  "Osoba wspolpracujaca - I"
@ 9,9 say  "   Nazwisko ............"
@ 10,9 say "   Imie ................"
@ 11,9 say "   Typ identyfikatora .."
@ 12,9 say "   Identyfikator........"  
set cursor on
@ 9,34 get lw1_naz when s_kom("Nazwisko pierwszej osoby wspolpracujacej")
@ 10,34 get lw1_imie when s_kom("Imie pierwszej osoby wspolpracujacej")
@ 11,34 get lw1_typ when s_kom("Typ identyfikatora pierwszej osoby wspolpracujacej")
@ 12,34 get lw1_iden when s_kom("Identyfikator pierwszej osoby wspolpracujacej")

@ 14,9 say  "Osoba wspolpracujaca - II"
@ 15,9 say  "   Nazwisko ............"
@ 16,9 say "   Imie ................"
@ 17,9 say "   Typ identyfikatora .."
@ 18,9 say "   Identyfikator........"  
set cursor on
@ 15,34 get lw2_naz when s_kom("Nazwisko pierwszej osoby wspolpracujacej")
@ 16,34 get lw2_imie when s_kom("Imie pierwszej osoby wspolpracujacej")
@ 17,34 get lw2_typ when s_kom("Typ identyfikatora pierwszej osoby wspolpracujacej")
@ 18,34 get lw2_iden when s_kom("Identyfikator pierwszej osoby wspolpracujacej")
read
if lastkey()#27
  zzus_k1=stuff(zzus_k1,1,31,lw1_naz)
  zzus_k1=stuff(zzus_k1,32,22,lw1_imie)
  zzus_k1=stuff(zzus_k1,54,1,lw1_typ)
  zzus_k1=stuff(zzus_k1,55,11,lw1_iden)
  zzus_k2=stuff(zzus_k2,1,31,lw2_naz)
  zzus_k2=stuff(zzus_k2,32,22,lw2_imie)
  zzus_k2=stuff(zzus_k2,54,1,lw2_typ)
  zzus_k2=stuff(zzus_k2,55,11,lw2_iden)  
  
endif
do case
  case empty(lw1_naz).and.empty(lw2_naz)
    lwspol="0"
  case.not.empty(lw1_naz).and.empty(lw2_naz)
    lwspol="1"
  case.not.empty(lw1_naz).and..not.empty(lw2_naz)
    lwspol="2"		
endcase
zskarbowy=stuff(zskarbowy,1,1,lwspol)
set cursor off
setcolor(lcolor)
RETURN nil