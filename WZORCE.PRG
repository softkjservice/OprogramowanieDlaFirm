*******************************************************************************
* Funkcja drukuje zawartosc pliku tow_buf                                     *
*******************************************************************************
FUNCTION A_TOW_DRUK()
local lt1:="================================================|===================|===========|===|===========|============|==========|"
lp=0
a_tow_tyt()
if zmag_typ="FIFO".or.zmag_typ="LIFO".or.zrozmiar.and..not.zdtyp$dowod_gr.and.vdok
  buf_lad(.f.)
  if.not.buf_use()
    return 
  endif
  if.not.zdznak$zwymian_znak
    fifo_buf()
  endif	
  do while .not.eof()
    ztow_lad()
	if.not.ztwyroznik="o"
	  lp=lp+1
	endif   
    a_poz_druk()
    w=w+1
    skip  
  enddo
else
  do while alltrim(tndow)==alltrim(zdndow)
    ztow_lad()
	if.not.ztwyroznik="o"
	  lp=lp+1
	endif       
	a_poz_druk()
    w=w+1
    skip  
  enddo
endif  
if zdtyp$bezvat_gr
  @ w,vcol say substr(a_d_plotek(lt1,plotek_poziom),1,81)
else
  @ w,vcol say a_d_plotek(lt1,plotek_poziom)
endif  
RETURN nil

*******************************************************************************
* Funkcja drukuje zawartosc pliku tow_buf w dokumencie koryguj•cym                                     *
*******************************************************************************
FUNCTION TOW_KDRUK()
local lt1:="================================================|===================|===========|===|===========|============|==========|"
lp=0
@ w,5 say przed_korekta
w=w+1
tow_tyt()
select &buf_sel
set filter to til<0
go top
do while.not.eof()
  ztow_lad()
  ztil=-1*ztil
	if.not.ztwyroznik="o"
	  lp=lp+1
	  poz_druk()
	  w=w+1
	endif     
  skip  
enddo  
@ w,vcol say d_plotek(lt1,plotek_poziom)
lp=0
w=w+2
@ w,5 say "Po korekcie: "
w=w+1
tow_tyt()
set filter to til>=0
go top
do while.not.eof()
  ztow_lad()
	if.not.ztwyroznik="o"
	  lp=lp+1
	  poz_druk()
	  w=w+1
	endif     
  
  skip  
enddo  
@ w,vcol say d_plotek(lt1,plotek_poziom)
RETURN nil


FUNCTION A_TOW_TYT()
local lt1:="========================================================================================================================="
local lt2:="|Lp.|          N A Z W A             |  ILOóè   |Jm.|  CENA  NETTO  |  WARTOóè  |St.|  PODATEK  |  WARTOóè   |  SYMBOL  |"
local lt3:="|   |         T O W A R U            |          |   |  JEDNOSTKOWA  |   NETTO   | % |   V A T   |  BRUTTO    |  PKW i U |"
local lt4:="|===|================================|==========|===|===============|===========|===|===========|============|==========|"
local lt5:="|                                                                                                                       |"
if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
  lt3:="|   |         T O W A R U            |          |   |  JEDNOSTKOWA  |   NETTO   | % |   V A T   |  BRUTTO    |          |"
endif
if zpoz_rabat
  lt3="|   |         T O W A R U            |          | m.|  JEDNOSTKOWA  |   NETTO   | % |   V A T   |  BRUTTO    |    %     |"
  wartosc:="|Lp.|          N A Z W A             |  ILOóè   |Jm.|  CENA  NETTO  |  WARTOóè  |St.|  PODATEK  |  WARTOóè   |  RABAT   |"
  lp_ramka:="|Lp.|          N A Z W A             |  ILOóè   |J. |  CENA BRUTTO  |  WARTOóè  |St.|   W tym   |  WARTOóè   |   RABAT  |"
  lp1_ramka:="|   |  wyrobu  towaru  lub  usàugi   |          |   |  JEDNOSTKOWA  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |    %     |"	
  do case
    case empty(zpolznak)
      wartosc="|Lp.|          N A Z W A             |  ILOSC   |Jm.|  CENA  NETTO  |  WARTOSC  |St.|  PODATEK  |  WARTOSC   |  RABAT   |"		      
      lp_ramka="|Lp.|          N A Z W A             |  ILOSC   |J. |  CENA BRUTTO  |  WARTOSC  |St.|   W tym   |  WARTOSC   |   RABAT  |"
      lp1_ramka="|   |  wyrobu  towaru  lub  uslugi   |          |   |  JEDNOSTKOWA  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |    %     |"
    case zpolznak="M"
      wartosc="|Lp.|          N A Z W A             |  ILOòï   |Jm.|  CENA  NETTO  |  WARTOòï  |St.|  PODATEK  |  WARTOòï   |  RABAT   |"	
      lp_ramka="|Lp.|          N A Z W A             |  ILOòï   |J. |  CENA BRUTTO  |  WARTOòï  |St.|   W tym   |  WARTOòï   |   RABAT  |"
      lp1_ramka="|   |  wyrobu  towaru  lub  usíugi   |          |   |  JEDNOSTKOWA  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |    %     |"
  endcase
  lt2=wartosc

endif
 

if zrozmiar
  lt2=towar
  lt3="|   |  nazwa  /  kolor  /  rozmiar   |          | m.|  JEDNOSTKOWA  |   NETTO   | % |   V A T   |  BRUTTO    |  PKW i U |"
  if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
    lt2:="|Lp.|          T O W A R             |  ILOóè   |Jm.|  CENA  NETTO  |  WARTOóè  |St.|  PODATEK  |  WARTOóè   |   K T M  |"
    lt3="|   |  nazwa  /  kolor  /  rozmiar   |          | m.|  JEDNOSTKOWA  |   NETTO   | % |   V A T   |  BRUTTO    |          |"  
  endif
endif
if zdtyp $ bezvat_gr
   lp_ramka="|Lp.|          N A Z W A             |  ILOSC   |Jm |     C E N A   |  WARTOSC  |"
   lp1_ramka="|   |        T O W A R U             |          |   |  JEDNOSTKOWA  |           |"
   lt2:=lp_ramka
   lt3:=lp1_ramka
endif

do case
  case zdtyp$dok_brut_gr.and..not.zrozmiar
    lt2:=lp_ramka
    lt3:=lp1_ramka
  case zdtyp$dok_brut_gr.and.zrozmiar
    lt2:=r_ramka
    lt3:="|   |  nazwa  /  kolor  /  rozmiar   |          | m.|  JEDNOSTKOWA  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |  PKW i U |"	
    if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
      lt2:="|Lp.|          T O W A R             |  ILOóè   |Jm.|  CENA BRUTTO  |  WARTOóè  |St.|   W tym   |  WARTOóè   |   K T M  |"
      lt3:="|   |  nazwa  /  kolor  /  rozmiar   |          | m.|  JEDNOSTKOWA  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |          |"	
	endif

endcase
if zdtyp$bezvat_gr
  lt1=substr(lt1,1,81)
 * lt4=substr(lt4,1,81)
endif
@ prow(),pcol() say &zdr_kond
@ w,vcol say lt1
w=w+1
@ w,vcol say d_plotek(lt2,plotek)
w=w+1
@ w,vcol say d_plotek(lt3,plotek)
w=w+1
*@ w,vcol say lt4
if zdtyp$bezvat_gr
  @ w,vcol say substr(d_plotek(lt4,plotek_poziom),1,81)
else
  @ w,vcol say d_plotek(lt4,plotek_poziom) 
endif
w=w+1
@ w,vcol say d_plotek(lt5,plotek)
w=w+1
RETURN nil

FUNCTION POZ_DRUK()
local lnet,lvat,lbrut,ltcen:=ztcen
local lnaz, lrozmiar,lwiersz_dodatkowy:=.f.
@ w,vcol say plotek
do case
  case ztwyroznik="o"
    if substr(ztnaz,1,1)=";"
	  @ w,vcol+7 say space(32)
	else
	  @ w,vcol+7 say ztnaz
	endif  
    @ w,vcol+120+vpkw_plus say plotek  
  otherwise  
    @ w,vcol+1 say lp picture"999"
*    if zrozmiar.and..not.zdtyp$dowod_gr.and.vdok.and..not.zdznak$zwymian_znak
*      @ w,vcol+5 say substr(ztnaz,1,32)
*    else
*      @ w,vcol+5 say ztnaz
*    endif
    if zrozmiar.and.zdtyp$dowod_gr.or.zdznak$zwymian_znak.or..not.vdok 
      lnaz=alltrim(substr(ztnaz,1,32))
	  lrozmiar=substr(ztnaz,33)
	  naz_druk(lnaz,lrozmiar,vcol,vcol+5,vcol+120)

    else
	  if zkgrup_kod=1          &&obsàuga pietruszek - Wolica
        lnaz=stuff(space(32),1,7,ztkod)
		lnaz=stuff(lnaz,11,24,substr(ztnaz,1,24))	    
		@ w,vcol+5 say lnaz
	  else
	    lnaz=substr(ztnaz,1,32)
		if zkod_druk
		  lwiersz_dodatkowy:=.t.
		  if len(alltrim(lnaz))<17
		    lwiersz_dodatkowy:=.f.
		    lnaz=stuff(space(32),1,len(alltrim(lnaz)),alltrim(lnaz))
		    lnaz=stuff(lnaz,18,len(alltrim(ztkod)),alltrim(ztkod))
		  endif
		endif
		@ w,vcol+5 say lnaz
	  endif	
	endif
    if.not.zdtyp$importsad_gr
	  @ w,vcol+37-ilosc_odstep say ztil picture mag_picture
      @ w,vcol+49 say ztjm
	endif  
    if zdtyp$eksport_gr
      ltcen=ztcen_dewiz
    endif
    if.not.(zdtyp$dowod_gr.and.zwz_bezcen) 
	  do case
        case zdtyp$dok_brut_gr
          lbrut=round(round(tbrutto(ltcen,ztstawka),2)*ztil,2)   
	      lvat=round(tb_vat(lbrut,ztstawka),2)  
          lnet=lbrut-lvat
          @ w,vcol+53 say round(tbrutto(ltcen,ztstawka),2) picture "999 999 999.99"
	      @ w,vcol+69 say lnet picture "99999999.99"
	      @ w,vcol+82 say ztstawka picture "99"
	      @ w,vcol+85 say lvat picture "99999999.99"
	      @ w,vcol+97 say lbrut picture "99999999.99"	
          if zpoz_rabat
		    @ w,vcol+110 say ztil_dost picture "999.9999"
		  else
		    if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
		      @ w,vcol+110 say ztkod   
		    else
		      @ w,vcol+110 say ztsymbol   
		    endif	
		  endif  
          @ w,vcol+120+vpkw_plus say plotek	
        otherwise                             &&zdtyp$dok_net_gr
          if zdtyp$importsad_gr
	        lnet=round(ltcen,2)
	        lvat=round(tn_vat(lnet,ztstawka),1)
            lbrut=lnet+lvat	
	      else
	        lnet=round(ztil*round(ltcen,2),2)
	        lvat=round(tn_vat(lnet,ztstawka),2)
            lbrut=lnet+lvat
	        @ w,vcol+53 say round(ltcen,2) picture "999 999 999.99"
	      endif
	      @ w,vcol+69 say lnet picture "99999999.99"
	      if.not.zdtyp$bezvat_gr
		    @ w,vcol+82 say ztstawka picture "99"
	        @ w,vcol+85 say lvat picture "99999999.99"
	        @ w,vcol+97 say lbrut picture "99999999.99"	
            if zpoz_rabat
		      @ w,vcol+110 say ztil_dost picture "999.9999"
		    else
		      if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
			    @ w,vcol+110 say ztkod   
			  else
			    @ w,vcol+110 say ztsymbol   
			  endif  
		    endif  
            @ w,vcol+120 say plotek  
          else
		    @ w,vcol+80 say plotek  
		  endif
	  endcase
	endif
	
	if lwiersz_dodatkowy
	  w=w+1
	  @ w,vcol say plotek
      @ w, vcol+5 say "KTM:"
	  @ w,vcol+10 say ztkod	  
	  @ w,vcol+120 say plotek  
	  lwiersz_dodatkowy:=.f.
	endif
	if(.not.ztstawka=22).and.zpoz_rabat.and..not.zdtyp$bezvat_gr
	  w=w+1
	  @ w,vcol say plotek
      @ w, vcol+5 say "SYMBOL PKW i U:"
	  @ w,vcol+21 say ztsymbol	  
	  @ w,vcol+120+vpkw_plus say plotek  
	endif
	if ztwyroznik$"O"
	  topispoz_druk()
	endif
endcase  
  
RETURN nil


FUNCTION STOPA()
local ltxt1:=space(48)+plotek+"     R a z e m :    "
local ltxt2:=space(8)+sposob_zaplaty+gotowka+"    "+plotek
*local ltxt3:=space(48)+"|"+space(10)
local ltxt3:=space(48)+plotek+space(2)
local t[7],q[7],i
    if zdtyp$dowod_gr.and.zwz_bezcen 
	  return
	endif
if zdtyp$przes_gr.or.zdtyp$bo_gr
  ltxt2:=space(8)+"                  "+"                  "+"    "+plotek
endif
if zdtyp$importsad_gr
  sad_stopa()
  RETURN
endif
for i=1 to 7
  t[i]:=space(73)
  q[i]:=space(2)
next
i=1
if.not.zdrabat=0
  ltxt1="        Udzielono rabatu: "+str(zdrabat,8,4)+" %"+space(12)+plotek+"     R a z e m :    "
endif
do case
  case zdsposzap="P"
    ltxt2=stuff(ltxt2,27,18,"Przelew           ")
  case zdsposzap="O"
    ltxt2=stuff(ltxt2,27,18,opozniona)
  case zdsposzap="K"
    ltxt2=stuff(ltxt2,27,18,"Kompensata        ")		
  case zdsposzap="R"
    ltxt2=stuff(ltxt2,27,18,"Red. zadàuæenia   ")			
endcase
if zdtyp$przes_gr.or.zdtyp$bo_gr
  ltxt2=stuff(ltxt2,27,18,"                  ")		
endif
if zdsposzap$"PO"
  ltxt3=space(8)+termin+dtoc(zdtermin)+space(12)+plotek+space(2)
endif

l_all=str(ztnet_all,11,2)+"     "+str(ztvat_all,11,2)+" "+str(ztbrut_all,11,2)+"            "+plotek
  if.not.zdtyp $ stopabezvat_gr
    if.not.ztnet_a=0
      t[i]=str(ztnet_a,11,2)+space(5)+str(ztvat_a,11,2)+" "+str(ztbrut_a,11,2)+"            "+plotek
      q[i]=str(mvat("A"))+" %"       
	  i=i+1
	endif  
    if.not.ztnet_b=0
      t[i]=str(ztnet_b,11,2)+space(5)+str(ztvat_b,11,2)+" "+str(ztbrut_b,11,2)+"            "+plotek
      q[i]=str(mvat("B"))+" %"              
	  i=i+1
	endif  
    if.not.ztnet_c=0
      t[i]=str(ztnet_c,11,2)+space(5)+str(ztvat_c,11,2)+" "+str(ztbrut_c,11,2)+"            "+plotek
      q[i]=str(mvat("C"))+" %"       
	  i=i+1
	endif  
    if.not.ztnet_d=0
      t[i]=str(ztnet_d,11,2)+space(5)+str(ztvat_d,11,2)+" "+str(ztbrut_d,11,2)+"            "+plotek
      q[i]=str(mvat("D"))+" %"              
	  i=i+1
	endif  
    if.not.ztnet_e=0
      t[i]=str(ztnet_e,11,2)+space(5)+str(ztvat_e,11,2)+" "+str(ztbrut_e,11,2)+"            "+plotek
      q[i]=str(mvat("E"))+" %"              
	  i=i+1
	endif  
    if.not.ztnet_f=0
      t[i]=str(ztnet_f,11,2)+space(5)+str(ztvat_f,11,2)+" "+str(ztbrut_f,11,2)+"            "+plotek
      q[i]=str(mvat("F"))+" %"              
	  i=i+1
	endif  
    if.not.ztnet_z=0
      t[i]=str(ztnet_z,11,2)+space(5)+str(ztvat_z,11,2)+" "+str(ztbrut_z,11,2)+"            "+plotek
      q[i]="        zw"+". "       
	  i=i+1
	endif  						
    @ w,vcol say ltxt1+l_all
	w=w+1
	@ w,vcol say ltxt2+w_tym_ze_stawka+space(53)+plotek
	w=w+1
	@ w,vcol say ltxt3+q[1]+space(6)+t[1]
    w=w+1
    i=2
	do while.t.
      if.not.empty(t[i])
        @ w,vcol+48 say plotek+"  "+ q[i]+space(6)+t[i]
		w=w+1         	  
	  endif
	  i=i+1
	  if i>7
	    exit
	  endif
	enddo
else
    @ w,vcol say substr(ltxt1+l_all,1,81) 
	w=w+1
endif
*w=w+1
if numer_zam_op.and.zzam_num=2
  @ w,13 say "Numer zam¢wienia: "+zdnumer_zam
endif
if zdtyp$bezvat_gr
  @ w,vcol+48 say replicate("=",33)
else
  @ w,vcol+48 say replicate("=",73)
endif  
w=w+1
if (zdtyp$dowod_gr.or.zdok_dowod).and.zdokiledruk
  @ w,vcol say "L•czna iloòÜ "+zdokjm+" = "+alltrim(str(zdokile,11,mag_round))
  w=w+1
endif
RETURN nil


FUNCTION PUBLIC_TXT()
public do_zaplaty:="DO ZAPùATY: ",zl:="  Zù",data_sprzedazy:="Data sprzedaæy: "
public pieczec_sprzedawcy:="     PIECZ®è   SPRZEDAWCY     "  
public wartosc:="|Lp.|          N A Z W A             |  ILOóè   |Jm.|  CENA  NETTO  |  WARTOóè  |St.|  PODATEK  |  WARTOóè   |  SYMBOL  |"
public uslugi:="|   |  wyrobu  towaru  lub  usàugi   |          |   |  JEDNOSTKOWA  |   NETTO   | % |   V A T   |  BRUTTO    |  PKW i U |"
public sposob_zaplaty:="Spos¢b zapàaty:   ",gotowka:="Got¢wka           "
public w_tym_ze_stawka:="  W tym ze stawk•:",wtymzestawka:="W tym ze stawk•:"
public naleznosc:="NaleænoòÜ zapàacono got¢wk•",przyjeto:="Przyj©to kwot©:  "
public pozostalo:="      Pozostaào do zapàaty: "
public rozliczono:="NaleænoòÜ rozliczono towarami o wartoòci r¢wnej kwocie do zapàaty."
public opozniona:="Op¢´niona pàatnoòÜ",termin:="Termin pàatnoòci: "
public upowazniona:="OSOBA   UPOWAΩNIONA  DO   OTRZYMANIA   FAKTURY                        OSOBA UPOWAΩNIONA  DO WYSTAWIENIA  FAKTURY VAT  "
public fakture_odebral:="                                           FAKTUR® VAT ODEBRAù:                       FAKTUR® VAT WYSTAWIù:           "
public kwota_zmniejszenia:="Kwota zmniejszenia wartoòci NETTO:"
public korekta_bez_wplywu:="Korekta bez wpàywu na wartoòÜ NETTO"
public kor_zl:=" zà"
public kwota_zwiekszenia:="Kwota zwi©kszenia wartoòci NETTO:"
public vat_zmniejszenia:="Kwota zmniejszenia wartoòci VAT:"
public vat_bez_wplywu:="Korekta bez wpàywu na kwot© VAT"
public vat_zwiekszenia:="Kwota zwi©kszenia wartoòci VAT:"
public brut_zmniejszenia:="Kwota zmniejszenia wartoòci BRUTTO:"
public brut_bez_wplywu:="Korekta bez wpàywu na wartoòÜ BRUTTO"
public brut_zwiekszenia:="Kwota zwi©kszenia wartoòci BRUTTO:"
public przed_korekta:="Przed korekt•: "
public data_ksiegow:="    Data ksi©gowania:  "


public towar:="|Lp.|          T O W A R             |  ILOóè   |Jm.|  CENA  NETTO  |  WARTOóè  |St.|  PODATEK  |  WARTOóè   |  SYMBOL  |"
public lp_ramka:="|Lp.|          N A Z W A             |  ILOóè   |Jm.|  CENA BRUTTO  |  WARTOóè  |St.|   W tym   |  WARTOóè   |  SYMBOL  |"
public lp1_ramka:="|   |  wyrobu  towaru  lub  usàugi   |          |   |  JEDNOSTKOWA  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |  PKW i U |"
public r_ramka:="|Lp.|          T O W A R             |  ILOóè   |Jm.|  CENA BRUTTO  |  WARTOóè  |St.|   W tym   |  WARTOóè   |  SYMBOL  |"
public rozl_sporzadzil:="Rozliczenie sporz•dzià:                               .............."
if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
  towar="|Lp.|          T O W A R             |  ILOóè   |Jm.|  CENA  NETTO  |  WARTOóè  |St.|  PODATEK  |  WARTOóè   |   K T M  |"
  r_ramka="|Lp.|          T O W A R             |  ILOóè   |Jm.|  CENA BRUTTO  |  WARTOóè  |St.|   W tym   |  WARTOóè   |   K T M  |"
  lp_ramka:="|Lp.|          N A Z W A             |  ILOóè   |Jm.|  CENA BRUTTO  |  WARTOóè  |St.|   W tym   |  WARTOóè   |   K T M  |"
  lp1_ramka:="|   |  wyrobu  towaru  lub  usàugi   |          |   |  JEDNOSTKOWA  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |   K T M  |"
endif

do case
  case empty(zpolznak)
    do_zaplaty="DO ZAPLATY: "
	zl="  ZL"
    data_sprzedazy="Data sprzedazy: "
	pieczec_sprzedawcy="     PIECZEC   SPRZEDAWCY     "  
    wartosc="|Lp.|          N A Z W A             |  ILOSC   |Jm.|  CENA  NETTO  |  WARTOSC  |St.|  PODATEK  |  WARTOSC   |  SYMBOL  |"
	uslugi="|   |  wyrobu  towaru  lub  uslugi   |          |   |  JEDNOSTKOWA  |   NETTO   | % |   V A T   |  BRUTTO    |  PKW i U |"
    sposob_zaplaty="Sposob zaplaty:   "
	gotowka="Gotowka           "
	w_tym_ze_stawka="  W tym ze stawka:"
	wtymzestawka="W tym ze stawka:"
	naleznosc="Naleznosc zaplacono gotowka"
	przyjeto="Przyjeto kwote:  "
	pozostalo="      Pozostalo do zaplaty: "
    rozliczono="Naleznosc rozliczono towarami o wartosci rownej kwocie do zaplaty."
    opozniona="Opozniona platnosc"
	termin="Termin platnosci: "
    upowazniona="| OSOBA   UPOWAZNIONA  DO   OTRZYMANIA   FAKTURY |                    | OSOBA UPOWAZNIONA  DO WYSTAWIENIA  FAKTURY VAT |"
    fakture_odebral="                                           | FAKTURE VAT ODEBRAL:           |         | FAKTURE VAT WYSTAWIL:          |"
    kwota_zmniejszenia="Kwota zmniejszenia wartosci NETTO:"
    korekta_bez_wplywu="Korekta bez wplywu na wartosc NETTO"
    kor_zl=" zl"
    kwota_zwiekszenia="Kwota zwiekszenia wartosci NETTO:"
	vat_zmniejszenia="Kwota zmniejszenia wartosci VAT:"
	vat_bez_wplywu="Korekta bez wplywu na kwote VAT"
	vat_zwiekszenia="Kwota zwiekszenia wartosci VAT:"
	brut_zmniejszenia="Kwota zmniejszenia wartosci BRUTTO:"
	brut_bez_wplywu="Korekta bez wplywu na wartosc BRUTTO"
	brut_zwiekszenia="Kwota zwiekszenia wartosci BRUTTO:"
	przed_korekta="Przed korekta: "
    towar="|Lp.|          T O W A R             |  ILOSC   |Jm.|  CENA  NETTO  |  WARTOSC  |St.|  PODATEK  |  WARTOSC   |  SYMBOL  |"
    lp_ramka="|Lp.|          N A Z W A             |  ILOSC   |Jm.|  CENA BRUTTO  |  WARTOSC  |St.|   W tym   |  WARTOSC   |  SYMBOL  |"
    lp1_ramka="|   |  wyrobu  towaru  lub  uslugi   |          |   |  JEDNOSTKOWA  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |  PKW i U |"
    r_ramka="|Lp.|          T O W A R             |  ILOSC   |Jm.|  CENA BRUTTO  |  WARTOSC  |St.|   W tym   |  WARTOSC   |  SYMBOL  |"
    rozl_sporzadzil="Rozliczenie sporzadzil:                               .............."
	data_ksiegow="    Data ksiegowania:  "
	if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
      towar="|Lp.|          T O W A R             |  ILOSC   |Jm.|  CENA  NETTO  |  WARTOSC  |St.|  PODATEK  |  WARTOSC   |   K T M  |"
      r_ramka="|Lp.|          T O W A R             |  ILOSC   |Jm.|  CENA BRUTTO  |  WARTOSC  |St.|   W tym   |  WARTOSC   |   K T M  |"
      lp_ramka="|Lp.|          N A Z W A             |  ILOSC   |Jm.|  CENA BRUTTO  |  WARTOSC  |St.|   W tym   |  WARTOSC   |   K T M  |"
	endif
 
	
  case zpolznak="M"
    do_zaplaty="DO ZAPúATY: "
	zl="  Zú"
    data_sprzedazy="Data sprzedaßy: "
	pieczec_sprzedawcy="     PIECZêï   SPRZEDAWCY     "  
    wartosc="|Lp.|          N A Z W A             |  ILOòï   |Jm.|  CENA  NETTO  |  WARTOòï  |St.|  PODATEK  |  WARTOòï   |  SYMBOL  |"	
	uslugi="|   |  wyrobu  towaru  lub  usíugi   |          |   |  JEDNOSTKOWA  |   NETTO   | % |   V A T   |  BRUTTO    |  PKW i U |"
    sposob_zaplaty="Spos¢b zapíaty:   "
	gotowka="Got¢wka           "
	w_tym_ze_stawka="  W tym ze stawkÜ:"
	wtymzestawka="W tym ze stawkÜ:"
	naleznosc="Naleßnoûç zapíacono got¢wkÜ"
	przyjeto="Przyjëto kwotë:  "
	pozostalo="      Pozostaío do zapíaty: "
    rozliczono="Naleßnoûç rozliczono towarami o wartoûci r¢wnej kwocie do zapíaty."
    opozniona="Op¢¶niona píatnoûç"
	termin="Termin píatnoûci: "
    upowazniona="| OSOBA   UPOWA°NIONA  DO   OTRZYMANIA   FAKTURY |                    | OSOBA UPOWA°NIONA  DO WYSTAWIENIA  FAKTURY VAT |"
    fakture_odebral="                                           | FAKTURê VAT ODEBRAú:           |         | FAKTURê VAT WYSTAWIú:          |"
    kwota_zmniejszenia="Kwota zmniejszenia wartoûci NETTO:"
    korekta_bez_wplywu="Korekta bez wpíywu na wartoûç NETTO"
    kor_zl=" zí"
    kwota_zwiekszenia="Kwota zwiekszenia wartoûci NETTO:"
	vat_zmniejszenia="Kwota zmniejszenia wartoûci VAT:"
	vat_bez_wplywu="Korekta bez wpíywu na kwotë VAT"
	vat_zwiekszenia="Kwota zwiëkszenia wartoûci VAT:"
	brut_zmniejszenia="Kwota zmniejszenia wartoûci BRUTTO:"
	brut_bez_wplywu="Korekta bez wpíywu na wartoûç BRUTTO"
	brut_zwiekszenia="Kwota zwiekszenia wartoûci BRUTTO:"
	przed_korekta="Przed korektÜ: "
    data_ksiegow="    Data ksiëgowania:  "

    towar="|Lp.|          T O W A R             |  ILOòï   |Jm.|  CENA  NETTO  |  WARTOòï  |St.|  PODATEK  |  WARTOòï   |  SYMBOL  |"
    lp_ramka="|Lp.|          N A Z W A             |  ILOòï   |Jm.|  CENA BRUTTO  |  WARTOòï  |St.|   W tym   |  WARTOòï   |  SYMBOL  |"
    lp1_ramka="|   |  wyrobu  towaru  lub  usíugi   |          |   |  JEDNOSTKOWA  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |  PKW i U |"
    r_ramka="|Lp.|          T O W A R             |  ILOòï   |Jm.|  CENA BRUTTO  |  WARTOòï  |St.|   W tym   |  WARTOòï   |  SYMBOL  |"		
    rozl_sporzadzil="Rozliczenie sporzÜdzií:                               .............."
	if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
      towar="|Lp.|          T O W A R             |  ILOòï   |Jm.|  CENA  NETTO  |  WARTOòï  |St.|  PODATEK  |  WARTOòï   |   K T M  |"
      r_ramka="|Lp.|          T O W A R             |  ILOòï   |Jm.|  CENA BRUTTO  |  WARTOòï  |St.|   W tym   |  WARTOòï   |   K T M  |"		
	endif
endcase
RETURN

FUNCTION D_PLOTEK(ptxt,pznak)
local ltxt:=ptxt
ltxt=stuff(ltxt,1,1,pznak)
ltxt=stuff(ltxt,5,1,pznak)
ltxt=stuff(ltxt,38,1,pznak)
ltxt=stuff(ltxt,49,1,pznak)
ltxt=stuff(ltxt,53,1,pznak)
ltxt=stuff(ltxt,69,1,pznak)
ltxt=stuff(ltxt,81,1,pznak)
ltxt=stuff(ltxt,85,1,pznak)
ltxt=stuff(ltxt,97,1,pznak)
ltxt=stuff(ltxt,110,1,pznak)
ltxt=stuff(ltxt,121,1,pznak)
RETURN ltxt
