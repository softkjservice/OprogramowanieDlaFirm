*******************************************************************************
* Program instalacyjny systemu LEGOS                                          *
* Przyjeto: licencja="M82J84Kxxx",gdzie suma x+x+x=10                         *
* Kod programu lp_legos: LEG_KOD="LP010", LKOD=1010,(LKOD dla DEMO=2222)      *
* Istnienie pliku yy_dem.dbf w katalogu LEGOS decyduje o instalacji wersji DEMO* 
*******************************************************************************
local ek,demo_kod
public zdysk:="C",zkatalog:="KJ_LEGOS"
public zpierwsza:=.t.,zplik_byl:=.f.,zdemo:=.f.
public zsiec:=.f.,kolor:=1
zleg_public()
sleg_public()
select 0
if file("legos\lp_lic.dbf")
  if kj_use("legos\lp_lic",.t.,3)
    zleg_lad()
    sleg_lad()
    local_sel:=select()
  endif
else
  zdemo=.t.
  if kj_use("legos\lp_dem",.t.,3)
    zleg_lad()
    sleg_lad()
    local_sel:=select()
  endif
endif
instal_tlo()

save screen to ek

instal_gdzie()
if lastkey()=27
  if kj_gkom(12," Uwaga!","      Przerwac instalacje programu ?       ","",.t.,5)
    close all
	clear
    set color to
	return
  endif
endif

if.not.zdemo
**  if.not. lic_potwierdz()
  if lic_potwierdz()
    kj_skom(12," Ok! ","Numer licencji potwierdzony.","Program przechodzi do nastepnych czynnosci instalacyjnych","Nacisnij dowolny klawisz.",5)
    inkey(3)
  else
    kj_tkom(12," Uwaga! ","Brak potwierdzenia numeru licencji.","Przerywam instalacje programu","Nacisnij dowolny klawisz.",5)
    clear
    return
  endif
endif
lleg01=zdysk+":\"+zkatalog+"\leg01\leg01.dbf"
if file(lleg01)
  zplik_byl=.t.
  select 0
  if kj_use(lleg01,.t.,3)
	locate for leg_kod=zleg_kod
	if found()
	  zpierwsza=.f.
	  zleg_lad()
      sleg_lad()
    else
	  go top
	  zlic1=dekod(lic1)
	  zlic2=dekod(lic2)
	  zlic3=dekod(lic3)
	  zlic4=dekod(lic4)
	  zlic5=dekod(lic5)
	  zlic6=dekod(lic6)
	endif  
    byl_sel=select()
  else
    close all
    clear
    set color to
    return      
  endif
  
endif
if.not.uzyt_kto()
  close all
  clear
  set color to
  return  
endif
if lastkey()=27
  if kj_gkom(12," Uwaga!","      Przerwac instalacje programu ?       ","",.t.,5)
    close all
	clear
    set color to
	return
  endif
endif


*lic1=kod(zlic1)
*@ 22,0 say lic1
*lic11=dekod(lic1)
*@ 23,0 say lic11
*inkey(0)

uzyt_uzup()
if lastkey()=27
  if kj_gkom(12," Uwaga!","      Przerwac instalacje programu ?       ","",.t.,5)
    close all
	clear
    set color to
	return
  endif
endif

select &local_sel
do while.t.
  if zapis_test()
    leg_replac()
	replace lic0 with space(15)
	exit
  else
    kj_tkom(3," Uwaga! "," System wykryl blad zapisu.","Usun zabezpieczenie dyskietki przed zapisem i nacisnij dowolny klawisz.","[Esc] - przerwanie instalacji.",5)
    if lastkey()=27
	  close all
	  clear
	  set color to
	  return
	endif
  endif
enddo
if zplik_byl
  select &byl_sel
  if zpierwsza
	append blank
	leg_replac()
  else
	demo_kod=lkod
	leg_replac() 
	if zdemo
	  replace l123 with .f.,lkod with demo_kod
    else
	  replace l123 with .t.,lkod with 1010
	endif 
  endif
  close all
  run legos\install.bat &zdysk &zkatalog
else
  close all
  run legos\install.bat &zdysk &zkatalog
  if.not.zdemo
    copy file legos\lp_lic.dbf to &lleg01
  else
    copy file legos\lp_dem.dbf to &lleg01
  endif	
endif
set default to
if file("legos\kj_kasa.exe")
  lplik=zdysk+":\"+zkatalog+"\leg01\common.mem"
  restore from &lplik additive
  kasa_glowna=.t.
  save to &lplik 
endif
restore screen from ek
  kj_skom(12," Ok! ","Instalacja programu zakonczona pomyslnie.","","Nacisnij dowolny klawisz.",5)
INKEY(5)
set color to
clear
RETURN

PROCEDURE INSTAL_TLO()
local lcolor:=setcolor(),i
local t[8]

t[1]:= "                                                                              "
t[2]:= "   ∞∞≤      ∞∞∞∞∞≤   ∞∞∞∞∞∞∞≤   ∞∞∞∞∞∞∞≤   ∞∞∞∞∞∞≤                            "
t[3]:= "   ∞∞≤      ∞∞≤      ∞∞≤        ∞∞≤  ∞∞≤   ∞∞≤                                "
t[4]:= "   ∞∞≤      ∞∞∞∞≤    ∞∞≤ ∞∞∞≤   ∞∞≤  ∞∞≤   ∞∞∞∞∞∞≤                            "      
t[5]:= "   ∞∞≤      ∞∞≤      ∞∞≤  ∞∞≤   ∞∞≤  ∞∞≤       ∞∞≤                            "
t[6]:= "   ∞∞∞∞∞≤   ∞∞∞∞∞≤   ∞∞∞∞∞∞∞≤   ∞∞∞∞∞∞∞≤   ∞∞∞∞∞∞≤                            "      
t[7]:= "                                                                              "
t[8]:= "                                                                              "
clear

kj_okno(0,0,19, "  KJ_LEGOS - SYSTEM ZARZADZANIA FIRMA                                           ",5)
set color to "gr+/n,n/gr+"
@ 9,1 say  "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
@ 10,1 say "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
@ 11,1 say "     ÕÀ …Õ   …ÕÕÕª                                                            "
@ 12,1 say "      ∫…º        ∫                                                            "
@ 13,1 say "      Ã ª        ∫   ÕÕÕ   PROGRAM  INSTALACYJNY                              "
@ 14,1 say "     Õ  »Õ       ∫                                                            "
@ 15,1 say "             …ÕÕÕŒÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ     "
@ 16,1 say "             »ÕÕÕº                                                            "
@ 17,1 say "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"

*set color to bg+
for i=1 to 8
  @ i,1 say t[i]
next
kj_okno(18,0,5, "         A K T U A L N E      P A R A M E T R Y      I N S T A L A C J I        ",5)
*setcolor("w/b/b/w")
setcolor("b/w")
@ 3,58 to 5,76
@ 4,59 say " Soft-KJ-Service "
set color to w+/n
do case
  case file("LEGOS\lp_legos.exe")
    @ 13,55 say "L P _ L E G O S"
end case
RETURN

FUNCTION INSTAL_GDZIE()
local lcolor:=setcolor(),ldysk:=zdysk,lkatalog:=zkatalog,llic0:=zlic0
setcolor("b/w")
@ 20,10 say "Wpisz literowe oznaczenie dysku .......  :\"
@ 21,10 say "Zatwierdz katalog roboczy ............."
if.not.zdemo
  @ 22,10 say "Wpisz numer licencji .................."
endif
set cursor on
set color to
setcolor("b/w")
@ 20,50 get ldysk  when s_kom("Wybierz dysk na ktorym bedzie instalowany program i zatwierdz klawiszem [Enter] ",4)
@ 21,50 get lkatalog when s_kom("Jesli nie istnieje-zostanie utworzony. Warunek:lokalizacja w katalogu glownym",4)
if.not.zdemo
  @ 22,50 get llic0 picture "@!" when s_kom("Wpisz numer podany na dolaczonej do programu licencji",4)
endif
read
if.not.lastkey()=27
  zdysk=ldysk
  zkatalog=lkatalog
  zlic0=llic0
endif
set cursor off
setcolor(lcolor)
RETURN nil


PROCEDURE UZYT_KTO()
local lcolor:=setcolor(),i
local llic1:=zlic1,llic2:=zlic2,llic3:=zlic3
local llic4:=zlic4,llic5:=zlic5,llic6:=zlic6
kj_okno(0,0,19, "  KJ_LEGOS - SYSTEM ZARZADZANIA FIRMA                                           ",5)
*set color to "gr+/n,n/gr+"
*@ 1,1 say "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
*@ 2,1 say "     ÕÀ …Õ   …ÕÕÕª                                                            "
*@ 3,1 say "      ∫…º        ∫                                                            "
*@ 4,1 say "      Ã ª        ∫   ÕÕÕ   PROGRAM  INSTALACYJNY                              "
*@ 5,1 say "     Õ  »Õ       ∫                                                            "
*@ 6,1 say "             …ÕÕÕŒÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ     "
*@ 7,1 say "             »ÕÕÕº                                                            "
*@ 8,1 say "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"

kj_okno(9,0,14, "                   U Z Y T K O W N I K       P R O G R A M U                    ",5)
setcolor("b/w")
@ 11,5 say "NAZWA:                  "
@ 12,5 say "    ..............."
@ 13,5 say "    ..............."
@ 14,5 say "ADRES:"
@ 15,5 say "   Kod pocztowy ..."
@ 16,5 say "   Miejscowosc ...."
@ 17,5 say "   Ulica .........."       
@ 19,5 say "N I P  ............"       
*@ 21,5 say "REGON  ............"       
set color to
@ 1,1 clear to 8,78
@ 2,2 say "Uwaga!                                                                     "
@ 3,2 say "Wprowadzone  tu  dane  beda  pojawialy  sie  na  wydrukach .   Ich  dowolna"
@ 4,2 say "modyfikacja bedzie programowo ograniczona. W przypadku watpliwosci przerwij"
@ 5,2 say "instalacje wciskajac klawisz  [Esc],  uzupelnij dane i ponownie przeprowadz"
@ 6,2 say "instalacje.                                                                "
@ 7,2 say "                                                                           "
set color to n/w,w/n
do while.t.
  set cursor on
  @ 12,25 get zlic1 when s_kom("Wpisz nazwe firmy lub imie i nazwisko wlasciciela.",4)
  @ 13,25 get zlic2 when s_kom("Wpisz ciag dalszy nazwy firmy.",4)
  @ 15,25 get zlic3  when s_kom("Wpisz kod pocztowy wlasciwy dla adresu firmy.",4)
  @ 16,25 get zlic4 when s_kom("Wpisz miejscowosc.",4)
  @ 17,25 get zlic5 when s_kom("Wpisz nazwe ulicy, numer domu oraz lokalu.",4)
  @ 19,25 get zlic6 when s_kom("Wpisz numer identyfikacji podatkowej  NIP.",4)   
  read
  s_kom("",4)
  if lastkey()=27
    exit
  else
    if kj_gkom(3," Uwaga! ","  Czy wprowadzone dane sa poprawne ? ","Zatwierdzic ?",.t.,5)  
      if.not.limit_zmian()
	    exit
	  else
	    if kj_gkom(3," Uwaga! ","Przekroczony limit zmian podstawowych danych Uzytkownika! ","Przerwac instalacje ?",.t.,5)
          return .f.        
		else
		  zlz1=slz1
		  zlz2=slz2
		  zlz3=slz3
		endif
	  endif
	endif
  endif
enddo
set cursor off
RETURN .t.



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


FUNCTION UZYT_UZUP()
local llic_regon:=zlic_regon,llic_pesel:=zlic_pesel,llic_konto:=zlic_konto
local llic_tel:=zlic_tel,llic_fax:=zlic_fax
kj_okno(1,0,11, "                   U Z Y T K O W N I K   -    DANE PODSTAWOWE                   ",5)
setcolor("b/w")
@ 2,5 say "NAZWA:                  "
@ 3,5 say "    ..............."
@ 4,5 say "    ..............."
@ 5,5 say "ADRES:"
@ 6,5 say "   Kod pocztowy ..."
@ 7,5 say "   Miejscowosc ...."
@ 8,5 say "   Ulica .........."       
@ 9,5 say "N I P  ............"       
@ 3,25 say zlic1 
@ 4,25 say zlic2 
@ 6,25 say zlic3 
@ 7,25 say zlic4
@ 8,25 say zlic5
@ 9,25 say zlic6   
kj_okno(10,0,13, "                   U Z Y T K O W N I K   -    UZUPELNIENIE                      ",5)
@ 11,2 say " Uwaga ! "
@ 12,2 say "Wprowadzane w tej czesci programu dane mozna modyfikowac bez ograniczen."
@ 14,2 say "REGON .........."
@ 16,2 say "PESEL .........."
@ 18,2 say "Konto bankowe .."
@ 20,2 say "Telefon ........"
@ 22,2 say "Fax ............"
do while.t.
  set cursor on
  @ 14,18 get llic_regon when s_kom("Wpisz aktualny REGON ",4)
  @ 16,18 get llic_pesel when s_kom("Wpisz PESEL wlasciciela firmy ",4)
  @ 18,18 get llic_konto when s_kom("Wpisz nazwe banku i numer konta bankowego firmy",4)
  @ 20,18 get llic_tel when s_kom("Wpisz numer telefonu",4)
  @ 22,18 get llic_fax when s_kom("Wpisz numer faksa",4)
  read
  set cursor off
  if lastkey()=27
    exit
  else
    if kj_gkom(3," Uwaga! ","  Czy wprowadzone dane sa poprawne ? ","Zatwierdzic ?",.t.,5)  
      exit
	endif  
  endif
enddo
zlic_regon=llic_regon
zlic_pesel=llic_pesel
zlic_konto=llic_konto
zlic_tel=llic_tel
zlic_fax=llic_fax
RETURN nil


FUNCTION ZLEG_PUBLIC()
public zlic1:=space(50),zlic2:=space(50),zlic3:=space(6)
public zlic4:=space(50),zlic5:=space(50),zlic6:=space(13)
public zlic0:=space(15)
public zleg_kod:=space(5),zlz1:=.f.,zlz2:=.f.,zlz3:=.f.,zl123:=.f.
public zlkod:=0,zldat:=date(),zld:=14
public zlic_regon:=space(10),zlic_pesel:=space(11),zlic_konto:=space(60)
public zlic_tel:=space(15),zlic_fax:=space(15)
RETURN nil

FUNCTION SLEG_PUBLIC()
public slic1:=space(50),slic2:=space(50),slic3:=space(6)
public slic4:=space(50),slic5:=space(50),slic6:=space(13)
public slic0:=space(15)
public sleg_kod:=space(5),slz1:=.f.,slz2:=.f.,slz3:=.f.,sl123:=.f.
public slkod:=0,sldat:=date(),sld:=14
public slic_regon:=space(10),slic_pesel:=space(11),slic_konto:=space(60)
public slic_tel:=space(15),slic_fax:=space(15)
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

FUNCTION SLEG_LAD()
slic0=dekod(lic0)
slic1=dekod(lic1)
slic2=dekod(lic2)
slic3=dekod(lic3)
slic4=dekod(lic4)
slic5=dekod(lic5)
slic6=dekod(lic6)
sleg_kod=leg_kod
slz1=lz1
slz2=lz2
slz3=lz3
sl123=l123
slkod=lkod
sld=ld
slic_regon=lic_regon
slic_pesel=lic_pesel
slic_konto=lic_konto
slic_tel=lic_tel
slic_fax=lic_fax
RETURN

FUNCTION LEG_REPLAC()
replace leg_kod with zleg_kod,lic0 with kod(zlic0),lic1 with kod(zlic1)
replace lic2 with kod(zlic2),lic3 with kod(zlic3),lic4 with kod(zlic4)
replace lic5 with kod(zlic5),lic6 with kod(zlic6),lz1 with zlz1
replace lz2 with zlz2, lz3 with zlz3, l123 with zl123,lkod with zlkod
replace ldat with zldat,ld with zld
replace lic_regon with zlic_regon,lic_pesel with zlic_pesel
replace lic_konto with zlic_konto,lic_tel with zlic_tel,lic_fax with zlic_fax
RETURN 

FUNCTION INNA_FIRMA()
local inna:=.f.,lnazwa:=.f.,ladres:=.f.,lnip:=.f.
if zlic1#slic1.or.zlic2#slic2
  lnazwa=.t.
endif
if zlic4#slic4.or.zlic4#slic4
  ladres=.t.
endif
if zlic6#slic6
  lnip=.t.
endif
if lnazwa.and.ladres.and.lnip
  inna=.t.
endif
RETURN inna

FUNCTION DZIEWIC()
ldziewic:=.f.
if empty(slic1).and.empty(slic2).and.empty(slic3).and.empty(slic4).and.empty(slic5).and.empty(slic6)
  ldziewic=.t.
endif
RETURN ldziewic

FUNCTION LIMIT_ZMIAN()
local lblokuj:=.f.
if (zlic1#slic1.or.zlic2#slic2)
  if.not.dziewic()
    zlz1=.t.
  endif	
  if zlz2.and.zlz3
    lblokuj=.t.
  endif	
endif
if (zlic4#slic4.or.zlic5#slic5)
  if.not.dziewic()
    zlz2=.t.
  endif	
  if zlz1.and.zlz3
    lblokuj=.t.
  endif	
endif
if zlic6#slic6
  if.not.dziewic()
    zlz3=.t.
  endif	
  if zlz1.and.zlz2
    lblokuj=.t.
  endif	
endif
RETURN lblokuj

*******************************************************************************
* Procedura testuje moliwosc zpisu na dysku biezacym lub wskazanym przez      *
* parametr pdysk (a, b, "")  ""=dysk biezacy                                  *
*******************************************************************************
FUNCTION ZAPIS_TEST()
local lzapis:=.f.
n_nazwa="\testowy.$$$"
x=fcreate("&n_nazwa")
if ferror()=0
  lzapis=.t.
else
  lzapis=.f. 
endif
delete file &n_nazwa
RETURN lzapis
