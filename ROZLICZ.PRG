FUNCTION ROZLICZ_DRUK(pilosc)
local lilosc:=1
rozlicz_public_txt()
w=prow()
k=0
@ w,k say &zdr_kkond
do while.t.
  if zdtyp$stopabezvat_gr
    k_export_dr()  
  else
    r_export_dr()  
  endif	
  lilosc=lilosc+1
  if lilosc>pilosc
    exit
  endif
enddo
RETURN

FUNCTION K_EXPORT_DR()
local ltxt:=" R O Z L I C Z E N I E    F A K T U R Y    E K S P O R T O W E J    "
local ltxt1:="---------------------------------------------------------------    "
local ltxt2:="S P R Z E D A W C A  :                 N A B Y W C A  :               "
local lwartosc:=0
if zdtyp$import_gr
  ltxt=" R O Z L I C Z E N I E    F A K T U R Y    I M P O R T O W E J    "
  ltxt1:="-------------------------------------------------------------    "
  ltxt2="N A B Y W C A  :                       S P R Z E D A W C A  :         "
endif
w=prow()
k=7
@ w,k say ltxt 
w=w+1
@ w,k say ltxt1
w=w+5
@ w,6 say ltxt2
w=w+2
@ w,k say zlic1
@ w,k+40 say zknaz1
w=w+1
@ w,k say zlic2
@ w,k+40 say zknaz2
w=w+1
@ w,k say zlic3+"  "+zlic4
@ w,k+40 say zkkod+"  "+zkmiasto
w=w+1
@ w,k say zlic5
@ w,k+40 say zkulica
w=w+7
@ w,k+10 say "DOTYCZY FAKTURY NR ......."
@ w,k+37 say zdndok
w=w+2
*@ w,k+10 say "DATA KSI®GOWANIA ........."
@ w,k+10 say data_ksiegowania
@ w,k+37 say zddatdok
if zdtyp$import_gr
  w=w+2
  *@ w,k+10 say "DATA PRZYJ®CIA NA MAGAZYN"
  @ w,k+10 say data_przyjecia
  @ w,k+37 say zddatgranic
endif
w=w+7
*@ w,k say "TABELA KURS‡W óREDNICH NBP  NR ........"
@ w,k say tabela_kursow
@ w,k+40 say zkursnbp_numer
w=w+2
@ w,k say "WALUTA ................................"
@ w,k+40 say zwaluta+" ("+zdwaluta+")"
w=w+2
*@ w,k say "KURS óREDNI ..........................."
@ w,k say kurs_sredni
w=w+2
k=k-18
@ w,k+40 say zprzelicznik picture "999"
@ w,k+44 say zdwaluta  
@ w,k+49 say "=" 
@ w,k+51 say zdkurs picture "999.9999"
*@ w,k+61 say "zà" 
@ w,k+61 say zloty 
w=w+2
k=k+18
*@ w,k say "WARTOóè FAKTURY WG KURSU óREDNIEGO ...."
@ w,k say kursu_sredniego
w=w+2
k=k-30
@ w,k+40 say ztnet_all picture "999999.99"
@ w,k+50 say "x"
@ w,k+52 say zdkurs/zprzelicznik picture "999.9999"
@ w,k+61 say "="
lwartosc=kj_round((zdkurs/zprzelicznik)*ztnet_all,2)
@ w,k+63 say lwartosc picture "99999999.99"
@ w,k+76 say "zà"
k=k+30
w=w+2
do case
  case zpolznak="L"
    ks_pslownie(w,k,lwartosc)
  case zpolznak=" "
    empty_ks_pslownie(w,k,lwartosc)	
  case zpolznak="M"
    maz_ks_pslownie(w,k,lwartosc)	
endcase

w=w+9
* w,k say "Rozliczenie sporz•dzià: "
@ w,k say sporzadzil
w=w+2
@ w,23 say zwystawil
@ w,54 say "..............."
w=w+1
@ w,54 say "    podpis     "

eject
RETURN 


FUNCTION R_EXPORT_DR()
local ltxt:=" R O Z L I C Z E N I E    F A K T U R Y    E K S P O R T O W E J    "
local ltxt1:="---------------------------------------------------------------    "
local ltxt2:="S P R Z E D A W C A  :                 N A B Y W C A  :               "
local lwartosc:=0
if zdtyp$import_gr
  ltxt=" R O Z L I C Z E N I E    F A K T U R Y    I M P O R T O W E J    "
  ltxt1:="-------------------------------------------------------------    "
  ltxt2="N A B Y W C A  :                       S P R Z E D A W C A  :         "
endif
w=prow()
k=7
@ w,k say ltxt 
w=w+1
@ w,k say ltxt1
w=w+5
@ w,6 say ltxt2
w=w+2
@ w,k say zlic1
@ w,k+40 say zknaz1
w=w+1
@ w,k say zlic2
@ w,k+40 say zknaz2
w=w+1
@ w,k say zlic3+"  "+zlic4
@ w,k+40 say zkkod+"  "+zkmiasto
w=w+1
@ w,k say zlic5
@ w,k+40 say zkulica
w=w+7
@ w,k+10 say "DOTYCZY FAKTURY NR ......."
@ w,k+37 say alltrim(zdndok)
w=w+2
*@ w,k+10 say "DATA KSI®GOWANIA ........."
@ w,k+10 say data_ksiegowania
@ w,k+37 say zddatdok

w=w+7
@ w,k say "SAD NR "
@ w,k+9 say zsad_numer
*@ w,k+30 say "Z DNIA ..."
*@ w,k+40 say zddatsad
w=w+2
@ w,k say "WALUTA ................................"
@ w,k+40 say zwaluta+" ("+zdwaluta+")"
w=w+2
@ w,k say "KURS WG SAD ..........................."
w=w+2
k=k-18
@ w,k+40 say zprzelicznik picture "999"
@ w,k+44 say zdwaluta  
@ w,k+49 say "=" 
@ w,k+51 say zdkurs picture "999.9999"
*@ w,k+61 say "zà" 
@ w,k+61 say zloty
w=w+2
k=k+18
*@ w,k say "WARTOóè FAKTURY WG KURSU SAD .........."
@ w,k say kursu_sad
w=w+2
k=k-30
@ w,k+40 say ztnet_all picture "999999.99"
@ w,k+50 say "x"
@ w,k+52 say zdkurs/zprzelicznik picture "999.9999"
@ w,k+61 say "="
lwartosc=kj_round((zdkurs/zprzelicznik)*ztnet_all,2)
@ w,k+63 say lwartosc picture "99999999.99"
*@ w,k+76 say "zà"
@ w,k+76 say zloty
k=k+30
w=w+2
do case
  case zpolznak="L"
    ks_pslownie(w,k,lwartosc)
  case zpolznak=" "
    empty_ks_pslownie(w,k,lwartosc)	
  case zpolznak="M"
    maz_ks_pslownie(w,k,lwartosc)	
endcase
w=w+9
*@ w,0 say "Rozliczenie sporz•dzià: "
@ w,0 say sporzadzil
w=w+2
@ w,23 say zwystawil
@ w,54 say "..............."
w=w+1
@ w,54 say "    podpis     "
eject
RETURN 


FUNCTION ROZLICZ_MENU(pw,pk,ppoz1)
local topis[7],ek
local lbelka:="∞ Drukuj ∞ Zapami©taj ∞ Nowy ∞ A_wz¢r ∞ B_wz¢r ∞ Popraw ∞ Zrezygnuj ∞"
local lliter:="  D        Z            N      A        B        P        Z          "
topis[1]:="Zapami©taj i wydrukuj dokument."
topis[2]:="Zapami©taj dokument bez drukowania."
topis[3]:="Zapami©taj bieæ•cy dokument i utw¢rz nowy."
topis[4]:="Zapami©taj i utw¢rz nowy dokument na wz¢r poprzedniego."
topis[5]:="Zapami©taj i utw¢rz nowy dokument na wz¢r poprzedniego bez zmiany kontrahenta."
topis[6]:="Popraw aktualnie redagowany dokument."
topis[7]:="Anuluj ostatni dokument."
ppoz1=menu_poziom(pw,pk,7,lbelka,lliter,topis,ppoz1,.f.,.f.)
RETURN ppoz1




FUNCTION NOWY_ROZLICZ_DOK()
local ek,ltyt:=substr(zopis_dok,1,80),lpoz:=1,ltryb:=1
local lknaz1:=""
save screen to ek
do while.t.
  
  zdndow=space(15)
  z_zdok_def_lad()
  
  rozlicz_tlo()
  if.not.lpoz=5
    kontrah(zk_serwer,.t.,lknaz1,1,.T.,ltryb)
  else
    set color to n/w,w/n
  endif	
  if lastkey()=27
    exit
  endif
  ltryb=1
  lknaz1=zknaz1
  k_w=2
  k_k=12
  vksiega=.t.
  k_dop_tlo()
  k_say()
  dokrozlicz()
  if lastkey()=27
    exit
  endif
  zdef_przelicznik=zprzelicznik
  zdkurs_def=zdkurs
  zwaluta_def=zwaluta
  zdwaluta_def=zdwaluta
  zdopis2=stuff(zdopis2,1,30,zsad_numer)
  zdopis2=stuff(zdopis2,31,30,zkursnbp_numer)
  zdopis2=stuff(zdopis2,61,10,zwaluta)
  zdopis2=stuff(zdopis2,71,6,str(zprzelicznik,6))
  wystawil(.f.)
  buf_use()
  go top
  tplik_sum(".not.eof()")
  zkwota=ztbrut_all
  set color to  
  @ 0,0 say space(80)
  lpoz=rozlicz_menu(0,0,lpoz)
  do case
    case lastkey()=27
	  exit
	case lpoz=1
	  zap_dok(.f.)
	  vdok_plik=.f.
	  select &buf_sel	 
	  dok_druk(vdok_plik,.t.)
	  exit
    case lpoz=2
	  zap_dok(.f.)
	  exit
    case lpoz=3
	  zap_dok(.f.)	  
      d_zer()	
      k_zer()
      tow_zer()
    case lpoz=4
	  zap_dok(.f.)	  
	  ztcen=ztcen_dewiz
      ltryb=2
    case lpoz=5
	  zap_dok(.f.)	  
	  ztcen=ztcen_dewiz
    case lpoz=6
      ltryb=2	  
    case lpoz=7
      exit	  	  
  endcase
  close_all("SH")
enddo
restore screen from ek
RETURN 

FUNCTION ROZLICZ_TLO()
local ltyt:=substr(zopis_dok,1,80)
ks_tlo()
kj_okno(0,0,24,ltyt,2)
g_tlo()
RETURN


FUNCTION DOKROZLICZ()
ltnaz:="IMPORT TOWAR‡W W DEWIZACH **    "
  ks_tlo() 
  ks_get()
  if buf_use()
    zap
	pack
	append blank
	replace tnaz with ltnaz, til with 1, tcen with ztcen
	close
  endif
RETURN

FUNCTION KS_TLO()
local ltyt:="                               D O K U M E N T                                  "
set color to n/w,w/n
kj_okno(13,0,10,ltyt,2)
@ 15,3 say "Numer .............................."
@ 16,3 say "WartoòÜ w walucie .................."
@ 17,3 say "Data ..............................."
if zdtyp$stopabezvat_gr
  @ 18,3 say "Tabela kurs¢w òrednich NBP Nr ......"
else
  @ 18,3 say "Numer dokumentu SAD ................"
endif
*@ 19,3 say "Data przekroczenia granicy ........."
@ 20,3 say "Waluta / skr¢t ....................."
@ 20,52 say "/"
@ 21,3 say "IloòÜ jednostek  =  kurs òredni ...."
@ 21,52 say "="
@ 22,3 say "WartoòÜ w zàot¢wkach ..............."
RETURN

FUNCTION KS_GET()
local lcolor:=setcolor()
set cursor on
set color to n/w,w/n
*ztcen=ztcen*zprzelicznik/zdkurs
@ 15,40 get zdndok when s_kom("Wpisz numer dokumentu")
@ 16,40 get ztcen picture "9999999.99" when s_kom("Wpisz wartoòÜ dokumentu w niæej podanej walucie")
@ 17,40 get zddatdow when s_kom("Wpisz dat© wystawienia dokumentu")
*@ 17,40 get zdatdow when s_kom("Wpisz dat© wystawienia dokumentu")
if zdtyp$stopabezvat_gr
  @ 18,40 get zkursnbp_numer when s_kom("Wpisz numer tabeli kurs¢w òrednich NBP")
else
  @ 18,40 get zsad_numer when s_kom("Wpisz numer SAD-u")
endif
*@ 19,40 get zddatgranic when s_kom("Wpisz dat© przekroczenia granicy")
@ 20,40 get zwaluta when s_kom("Wpisz nazw© waluty")
@ 20,55 get zdwaluta when s_kom("Wpisz skr¢t nazwy waluty")
@ 21,40 get zprzelicznik picture "9999999999" when s_kom("Wpisz iloòÜ jednostek obj©tych podanym kursem")
@ 21,55 get zdkurs picture "99999.9999" when s_kom("Wpisz kurs")
read
ks_say()
set cursor off
setcolor(lcolor)
RETURN

FUNCTION KS_SAY()
local lcolor:=setcolor()
set cursor on
set color to n/w,w/n
@ 15,40 say zdndok 
@ 16,40 say ztcen 
@ 17,40 say zddatdow 
*@ 17,40 say zdatdow
if zdtyp$stopabezvat_gr
  @ 18,40 say zkursnbp_numer
else
  @ 18,40 say zsad_numer
endif
*@ 19,40 say zddatgranic
@ 20,40 say zwaluta 
@ 20,55 say zdwaluta 
@ 21,40 say zprzelicznik picture "9999999999" 
@ 21,55 say zdkurs picture "99999.9999"
@ 22,40 say ztcen*(zdkurs/zprzelicznik) picture "999999999.99"
read
set cursor off
setcolor(lcolor)
RETURN


FUNCTION POPRAW_ROZLICZ_DOK()
local ltnaz:="IMPORT TOWAR‡W W DEWIZACH **    "
local recno:=recno()
vksiega=.t.
k_w=2
k_k=12
zdok_lad()
kj_dok_say(.f.)
zkwota=ztbrut_all
ztcen=ztbrut_all
rozlicz_tlo()
k_dop_tlo()
ks_tlo() 
k_say()
ks_get()


if.not.lastkey()=27
  if buf_use()
    zap
	pack
	append blank
	replace tnaz with ltnaz, til with 1, tcen with ztcen
	close
  endif
  ztcen_dewiz=ztcen
  ztcen = kj_round(ztcen*zdkurs/zprzelicznik,2)

  if.not.lastkey()=3
    wystawil(.f.)
    if kj_gkom(12,"","Czy chcesz poprawiÜ dane kontrahenta ? ","",.t.,5) 
      kontrah(zk_serwer,.t.,zknaz1,1,.T.,1)
    endif	
  endif

  zdef_przelicznik=zprzelicznik
  zdkurs_def=zdkurs
  zwaluta_def=zwaluta
  zdwaluta_def=zdwaluta
  zdopis2=stuff(zdopis2,1,30,zsad_numer)
  zdopis2=stuff(zdopis2,31,30,zkursnbp_numer)
  zdopis2=stuff(zdopis2,61,10,zwaluta)
  zdopis2=stuff(zdopis2,71,6,str(zprzelicznik,6))

  close_all("SH")
  dok_default()
  if tow_use(.f.)
    seek zdndow
    if found()
      if reclock(5)      
        tow_replac()
        unlock
      else
        return
      endif 
    else
      kj_tkom(12,"Uwaga","","","",5)
    endif
    close
  endif
  select &dok_sel
  if kj_use("dokum",.f.,3)
    set index to dok_ident,dok_num,dow_num
              if zdok_filtr
				set filter to dsymbol=zdsymbol
                go top
				go recno
              else
                seek zdsymbol
              endif  	
  endif  
    if zsiec
      if reclock(5)      
        dok_replac()  
        unlock
      else
        return
      endif 
    else
      dok_replac()
    endif 
endif
keyboard chr(205)
set cursor off
RETURN	  
	  
	  
FUNCTION ROZLICZ_PREZENT(ptryb)
local ek
save screen to ek
vksiega=.t.
k_w=2
k_k=12
zdok_lad()
kj_dok_say(.f.)
zkwota=ztbrut_all
rozlicz_tlo()
k_dop_tlo()
ks_tlo() 
k_say()
ks_say()
s_kom("Naciònij dowolny klawisz !")
inkey(0)
do case
  case ptryb=1
  anul_dok()	
endcase
vksiega=.F.
restore screen from ek
RETURN	  

FUNCTION ROZLICZ_PUBLIC_TXT()
public data_ksiegowania:="DATA KSI®GOWANIA ........."
public data_przyjecia:= "DATA PRZYJ®CIA NA MAGAZYN"
public tabela_kursow:="TABELA KURS‡W óREDNICH NBP  NR ........"
public kurs_sredni:="KURS óREDNI ..........................."
public zloty:="zà" 
public kursu_sredniego:="WARTOóè FAKTURY WG KURSU óREDNIEGO ...."
public sporzadzil:="Rozliczenie sporz•dzià: "
public kursu_sad:="WARTOóè FAKTURY WG KURSU SAD .........."
do case
  case empty(zpolznak)
	data_ksiegowania:="DATA KSIEGOWANIA ........."
	data_przyjecia:= "DATA PRZYJECIA NA MAGAZYN"
	tabela_kursow:="TABELA KURSOW SREDNICH NBP  NR ........"
	kurs_sredni:="KURS SREDNI ..........................."
	zloty:="zl" 
	kursu_sredniego:="WARTOSC FAKTURY WG KURSU SREDNIEGO ...."
	sporzadzil:="Rozliczenie sporzadzil: "
	kursu_sad:="WARTOSC FAKTURY WG KURSU SAD .........."
  case zpolznak="M"
	data_ksiegowania:="DATA KSIêGOWANIA ........."
	data_przyjecia:= "DATA PRZYJêCIA NA MAGAZYN"
	tabela_kursow:="TABELA KURS£W òREDNICH NBP  NR ........"
	kurs_sredni:="KURS òREDNI ..........................."
	zloty:="zí" 
	kursu_sredniego:="WARTOòï FAKTURY WG KURSU òREDNIEGO ...."
	sporzadzil:="Rozliczenie sporzÜdzií: "
	kursu_sad:="WARTOòï FAKTURY WG KURSU SAD .........."  
endcase
RETURN