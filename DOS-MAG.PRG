*****************************************************************
* Modul glownuy programu sh.exe
*******************************************************************************
local lcolor,lyear:=year(date()),lmonth:=month(date())
set date to german
set delete on
set century on
set confirm on
public zkortryb:="0"
public zpkwiu22:=.f.
public zwinrapdruk:=.f.
public fis_com:=1, zcom_xp:=1
public zminus_blok:=.f.,zzero_blok:=.f.
public zwindruk:=.f.,zakwizytor:=.f.
public zzaznacz_dok:=.f.
public nip_nabywcy:="NIP nabywcy :",z56_kontrah:=.f.
public fifo_gr:="",zfifo_tryb:="1",zfifo:=.f.
public akwizyt_gr:=""
public bezkonto_gr:=""
public zop_txt10:=.f.
public bezznak_gr:=""
public zue_opois1:=space(80),zue_opis2:=space(80),zue_opis3:=space(80)
public zw_dewizach:=.t.,op_export_txt:=.f.
public eksport_ue_gr:="D"
public zknaz1_rap:="",zknum_rap:=0
public znaz_64:=.f.
public zmgrup_tryb:=1, zmopissay:=0
public zuerap:=.f.
public zkrescen:=""
public zksold_path:=""    &&wykorzystywana do automatyzacji transmisji danych mi©dzy star• i now• ksi©g•
public zdokcendruk:=0
public bezdozaplaty_gr:=""
public zwydziel_miesiac:=.f.,zks_miesiac:=month(date())
public zfirkod:=""
public bezenddok_gr:="",zpotwierdzenie:=" ",zkonto_newtyp:=.f.
public zkres_enter_tryb:=1,ek_dok,zkres_towtab:=.f.
public zm_dedyk:=.f.
public zrem_new:=.f.
public zdedyk_pokaz:=.f.
public ztowar_filtr:=.F.
public zkarta:=.t.
public zkordoksay:=.f.
public zhistowcen:=.f.,zszuflada:=.f.
public zat_typy:=space(30),zat_opis:=space(80),zat_plik:=space(12),zat_index:=space(3)
public zpin:="",zmtakisam:=""
public fir_index:=0,zaksieguj_jako:="r",zfir_skrot:="Koneser L-wo   "
public zdokexport:=.f.,zpath_dokexport:="A:\                                               "
public zdopiszmag_up:=.t.,zpoprawmag_up:=.t.,zcenzmien_up:=.t.
public zamienniki:=.f.
public zmagwidoczny:=.f.,zmadmin:=.f.,zmgrupy:=.f.,zamgrup:=space(3)
public zdalej_druk:=.f.
public zofer_path:="",zdok_path:=""
public zprod_tryb:=.f.,zprod_mag:=0, zplaca:=0
public daf:=date()
public zvat_dl:=58, zks_dl:=52
public zkswspolnik:=.f.
public zrozliczenie:=space(70)
public zkreskakod:=.f.,zkreskadruk:=.f.
public zpkw_i_u:=.f.
public produkcja:=.f.
public zkspoz_start:=1,zwspolnik:=0,zp_remanent:=0,za_remanent:=0
public bo_gr:="o"
public zile_bo_zak_sp:=.f.
public zkas_przed:=0       &&zmienna potrzebna do korygowania niedopàaty w dokumentach kasowych  poprawianych
public rok:=year(date())
public znew_1:=.f.
public zoknocen:=.f.
public zmopispoz:=.f.,zdopisz:=.t.,zdokumsay:=.f.
public ztukan:=.f.
public zkod_druk:=.f.
public zkon_oddzial:=.f.
public magaz_war:='zmagaz_op>0.and..not.zmagaz_zyn="**".and..not.zmag_filtr'
public mag_war:='zmagaz_op>0.and..not.zmagaz_zyn="**".and.zmag_filtr'
public zkon_mag:=.f.,zkmag_tryb:=.f.,zwz_bezcen:=.f.
public zan_klucz:=""
public zanalplik:=.f.
public zcdrom:=.f.
public fwar_pom:=".t.",fwar:=".t."
public zkim1:=.f.,zkim2:=.f.
public zkodwz_druk:=.f.
public zpietruszka:=.f.
public zrejtxt:="",zdbfilter:=".t."
public zkon_grubo:=.f.,zilosc_def:=.f.,zopis_dtryb:=1
public zimp_sciezka:=""
public zksfirnum:=1,zksilefirm:=1,zfirznak:="  ",zksfir_upraw:=.f.,zopc_upraw:=.f.
public zround:=0
public zrycz_odlicz:=0,zdrowotne:=0
public zks_zwolniona:=.f.,zkon_kod:=.t.,zkskon_wlasny:=.f.
public zvat00_znak:="",zvat00_numer:=0,zvatexp_znak:=""
public zlpt15:=.f.
public zutarg_ks:=.t.
public zryczalt_ks:=.f.
public zexport_ks:=.f.
public kskasa:=.f.
public zl123:=.t.
public zpoz_rabat:=.f.
public zdzierzawa:=.f.,zkod_dostepu:=0
public zkas_kol:=0
public zmiesiac_sprzed:=0    && 0-peàna data sprzedaæy  1-tylko miesi•c i rok
public zzam_num:=2
public znip_kontrol:=.t.
public zkuzyt_txt_last:="",zktime_txt_last:="",zkgrup_txt_kod:=""
public zvat_rap:=.f.
public zdarchiwum:=.f.,zkasarchiwum:=.t.
public zarchiw_up:=.f.  &&.t. - obsàuga wielu katalog¢w archiwalnych
public zmagkas_up:=.t.,zkonkas_up:=.t.  &&uprawnienia do kasowania poz. magazynowych oraz kontrahent¢w
public zduty_kor:=.t.   &&zmienna pomocnicza - uæywana do definiowania korekty nie wpàywaj•cej na magazyn (wykorzystywana przy aktywnej rozmiar¢wce)
public zzwrot_znak:=""
public znumodstep:=" ",znumrok_2:=.f.,zkordoklam:=.f.
public zpytajkormag:=0  &&dotyczy faktury koryguj•cej 0-koryguje stany magazynowe zawsze, 1-pyta czy korygowaÜ
public z_korekty_kormag:=.t.
public zpodsumowanie:=1
public eksport_gr:="E",eksportks_gr:="LXlx"
public opisdok_gr:="",zopisdok:=1
public zdokile:=0,zdokjm:=space(3),zdokiledruk:=.f.,zdok_dowod:=.f.
public zplusminus_up:=.f.
public zkonlimit:=0     &&1-wà•czona obsàuga kontroli pàatnoòci on line
public zmbrut:=0
public zmklucz:=1
public z2kod:=.f.
public zkj_detal:=.f.,zkj_hurt:=.f.,zkj_dehurt:=.f.,zkj_faktur:=.f.,zkj_serwis
public zkj_kasa:=.f.,zkj_ksiega:=.f.
public zkas_serwer:="",zks_serwer:=""
public zkasa:=.f.,zdokument:=.f.
public zprzelew:=.f.
public plotek_poziom:="=",ilosc_odstep:=0
public data_po_lewej:=0,konto_sprzedawcy:="Konto sprzedawcy:   ",plotek:="|"
public zmcen_prez:=0,zmcen_marz:=0
public mglowny:=1
public zpracow_kon:=.f.
public zdopisz_popr:=.f.
public zopis_poz:=.f.
public zwymian_znak:=""
public piecz_druk:=1
public magminus_tab:=1
public kasa_gr:=""
public kasadok_gr:=""
public bezdokkto_gr:=""
public ksiega_gr:=""
public zmarzowanie_op:=.f.,zdewizmarz_op:=.f.,zplacadef_op:=.f.
public mag_picture:="9999999.999",mag_round:=3
public wkonto:="0"
public dok_ekran:=1
public zrozmiar:=.f.
public zdr_port:="Lpt1"
public w:=0
public zdef_przelicznik:=1
public zdkurs_def:=0
public zdokwzor_op:=.f.
public dwzor:=.f.
public dwzor_wpasku:=.f.
public zdokzmienwzor_op:=.f.
public zdokwzor_op:=.f.
public zcen_dew:=1      &&tcen_dewiz= 1-mcen_d, 2-mcen_h, 3-mcen_s, 4-mcen_p
public zmoknower:=2
public zzest_tow_rap:=.f.
public zsh_analiza:=.f.
public zsh_raport:=.f.
public zzestdokum_rap:=.f.
public ztowsprzedaz_rap:=.f.
*public kolor:=0
public kolor:=1
public vmenu_end:=.f.
*

*
public f_tnaz:=space(32),f_tkod:=space(7),f_tmindex:="",f_tgrup:=space(3)

public f_tmiesiac:=1,f_tdat:=date(),f_tdat1:=date(),f_tdat2:=date()
*
public f_ddatdok:=date(),f_miesiac:=0,fd_grupa:=space(30),f_rok
public dwar:="",dwar_start:="",dwar_allstart:="",rapwar:=".t."
public zokres_def:=1,zdruk_def:=1
public twar:=".t.",twar_start:="tanul=.f..and..not.twyroznik$alltrim(proform_gr).and..not.twyroznik='o'",twar_allstart:="tanul=.f."
public m_default:=1
public numer_zam_op:=.f.
public zmagdefault:="001"
public zek          &&zapamietanie ekranu poza miduàem
public zkwota:=0
public zduplikat:=.f.
public def_stawka:=22,zuzyt_last:="KJ",def_sposzap:="G"
public def_dkonto:="1",zak_cendef:="zakup",sp_cendef:="detal"
public znie_mag:="!*"
private vdokkor_ster:=.f.   &&modyfikuje procedury dla obslugi korekt dokument¢w
zknum=0
wzor_public()
dokexp_public()
tablexp_public()
ks_public()
archiw_public()
zset_public()
zleg_sh_public()
magi_public()
wmagi_public()
grupa_public()
public_wmag()

public_kon()
public_dok()
public_tow()
public_tplik()             &&zmienne do obliczen plikow klasy towbuf.dbf

public z1_tpopraw:=.f.         &&decyduje o obsludze poprawek na biezaco
public z2_tpopraw:=.f.    &&decyduje o sposobie obslugi magazynu w opcji END_POPRAW
public zkordok_popraw:=.f.   &&blokuje zmian© obsàugi magazynu przez faktur© koryguj•c• w przypadku aktywnej funkcji wyboru (zpytaj_kormag=1)
*****************
public zmag_filtr:=.t.
public zmag_num:=1           &&!numer obsàugiwanego magazynu
public ztowlastrec:=0
public zkoncz5:=.f.,zkoncz24:=.f.
public zdnet:=0,zdvat:=0,zdbrut:=0
public zk_5:=2,zk_24:=16
wmagil=.f.                 &&! 

public sh_upraw:=0
public_an()
public_druk()              &&DO WYELIMINOWANIA
druk_public()
zhas_public()
dok_def_public()
xdok_def_public()

public zkoncz5:=.f.,zkoncz24:=.f.
public zkey10:=.f.    &&w polaczeniu z [Ctrl-Enter] konczy instrukcje get
public pamiasto:=space(19)
pamiasto="Legionowo          "
public zdtyp:="",zcen_dok:="",zwystawil:=space(30),zprac_wyst:=1
*public num_sel,smag_sel
***
public dok_sel:=1
public tow_sel:=2
public buf_sel:=3
public kon_sel:=4
public gmag_sel:=5
public pmag_sel:=6
public num_sel:=7
public sh_sel:=8
public wystaw_sel:=9
public num_sel:=10
public dokdef_sel:=11
public tnum_sel:=12
public gbo_sel:=13
public pbo_sel:=14
public magi_sel:=15
public grupy_sel:=16
public has_sel:=17
public anal_sel:=18
public rap_sel:=19
public rap1_sel:=20
public param_sel:=21
public wmagi_sel:=22
public wkonto_sel:=23
public groz_sel:=24
public topis_sel:=25
public magnumer_sel:=26
public kasopis_sel:=27
public kasa_sel:=28
public stowary_sel:=29
public anal_sel:=30
public archiw_sel:=31
public archdok_sel:=32
public archtow_sel:=33
public archdokkas_sel:=34
public archtowkas_sel:=35
public kod_sel:=36
public ks_sel:=37
public kssetup_sel:=38
public kspit5_sel:=39
public firdef_sel:=40
public tra_sel:=41
public zrodlo_sel:=42
public analplik_sel:=43
public konmag_sel:=44
public wspol_sel:=45
public wyrob_sel:=46
public sklad_sel:=47
public archiw_sel:=48
public oferdbf_sel:=59
public dlugrap_sel:=60
public analizy_sel:=61
public dokexp_sel:=62
public tablexp_sel:=63
public tablimp_sel:=64
public antowar_sel:=65
public wzor_sel:=66
public remplik_sel:=67
public ueksiega_sel:=68
public akwizyt_sel:=69
public fifo_sel:=70
public fifo_tow_sel:=71
public fifo_mag_sel:=72
public fifo_dat_sel:=73
public fifo_bo_sel:=74
***
public kormag_gr:="FUNRPTfunrptoK1234E"
public sprzedaz_gr:="FUNRPTK24EZY"
public zakup_gr:="frpurtijo13z"
public dowod_gr:="1234"
public dok_brut_gr:="URTutr34"
public dok_net_gr:="FNPIpfnio12"
public defnum_gr:="furnptijo"
public bezkontrah_gr:="PTp"
public przes_gr:="BC"
public przerob_gr:="A"
public stopabezvat_gr:=""
public opis1_gr:="K"
public fiskal_gr:="RNPT"
public zkordok_znak:="K"
public zkordok_symbol:="K"
public odebral_podpis_gr:="FURNKE"
public export_gr:="ELX"
public import_gr:="elx"
public importsad_gr:="s"
public eksportsad_gr:="LX"
public proform_gr:="Zz"
public bezvat_gr:=""
public dowodwew_gr:=""
public dokorekty_gr:="FURN"
***
*public zdok_filtr:=.t.
*public zmarz_online:=.t.
***
*public zanul_up:=.t.
*public zpopraw_up:=.t.
*public krabat_up:=.f.
*public drabat_up:=.f.
public zadministr_up:=.t.
**
*public kasa_glowna:=.f.
***
public zrabat_plus:=.f.
public ztowanal_op:=.f.
***
public zgmag:=zm_serwer+"001MAG",zpmag:=zm_serwer+"002MAG"
public mklucz:=1
**public edit:="ne"
*public edit:="edit"
***
vdok=.t.

set key 10 to koncz()
zk_5=2
zk_24=19
select 0
clear
public dokdef_serwer:="LEG01",set_serwer:="SHSET"
do case
  case procname()="KJ_DETAL"
    *dokdef_serwer="detal"
	*set_serwer="detal"
    zkj_detal=.t.
  case procname()="KJ_HURT"
    *dokdef_serwer="hurt"
	*set_serwer="hurt"
    zkj_hurt=.t.	
  case procname()="KJ_DEHUR"
    *dokdef_serwer="dehurt"
	*set_serwer="dehurt"
    zkj_dehurt=.t.		
  case procname()="KJ_FAKTU"
    *dokdef_serwer="faktur"
	*set_serwer="faktur"
    zkj_faktur=.t.			
  case procname()="KJ_KASA"
    dokdef_serwer="kasa"
	set_serwer="kasa"
    zkj_kasa=.t.				
  case procname()="KJ_KSIEG"
    dokdef_serwer="ksiega"
	set_serwer="ksiega"
    zkj_ksiega=.t.					
  case procname()="KJ_SERW"
    zkj_serwis=.t.					
endcase


if zla_instal("SH")
  kj_tkom(8," Uwaga! "," Wykryto bledy instalacyjne!","Program nie moze pracowac poprawnie.","Nacisnij dowolny klawisz.",5)
  clear
  return
endif

set default to leg01
if kj_use("leg01",.f.,3)

  locate for alltrim(leg_kod)="5823"
  if.not.found()
    close all
	return
  endif

*  if empty(ldat) &&dn.03.12.2004 
   if.not.lz1
				if reclock(5)      
	              replace ldat with date(),lz1 with .t.
                  unlock
	            endif			      
  endif
  zleg_lad()
  use
else
  set color to
  clear
  return    
endif	  


demo_legalizuj("SH")

if demo_end("SH")
  kj_tkom(3," Uwaga!  Korzystaliscie Panstwo z wersji   D E M O "," Dalsza praca z programem bedzie mozliwa po wykupieniu LICENCJI","Producent: Soft_KJ_Service  Tel: 0 604 219 784 ","Nacisnij dowolny klawisz.",5)
  clear
  return
endif

*set default to shset
set default to &set_serwer
if.not.file("towbuf.ntx")
  use towbuf new
  index on tnum to towbuf
  use towbuf index towbuf
  close
endif


set default to &set_serwer  
if file("shset.mem")
  restore from shset additive
  close all
else
    clear
	kj_tkom(9," Uwaga! ","Brak dost©pu do pliku <shset.mem>."," Sprawd´ instalacj© lub skontaktuj si© z serwisem.","Program nie zostanie uruchomiony",5) 
    clear
	return
endif


s_common=zset_serwer+"leg01"
set default to &s_common
if file("common.mem")
  restore from common additive
  close all
else
    clear
	kj_tkom(9," Uwaga! ","Brak dost©pu do pliku <common.mem>."," Sprawd´ instalacj© lub skontaktuj si© z serwisem.","Program nie zostanie uruchomiony",5) 
    clear
	return
endif



set default to &set_serwer
  select &sh_sel
  if kj_use("shset",.t.,3)    &&blokada rownoczesnosci obslugi aplikacji
*    localset_lad()	
*    sh_sel=select()
  else
    clear
	kj_tkom(9," Uwaga! ","Program obsluguje tylko jednego Uzytkownika."," Aby umozliwic rownoczesna prace,"," nalezy dokupic licencje na kolejne stanowisko.",5) 
    clear
	return
  endif



select 0
if file("kssetup.dbf")
  if kj_use("kssetup",.f.,3)
    kssetup_lad()
    use
  endif
endif


if zdzierzawa
  if file("kody.dbf")
    if.not.kod_ok(lyear,lmonth,1)
      clear
	  return  	
	endif
	if day(date())>20
	  if lmonth=12
	    lmonth=1
		lyear=lyear+1
	  else
	    lmonth=lmonth+1
	  endif
	  kod_ok(lyear,lmonth,2)
	endif
  else
	kj_tkom(9," Uwaga! ","Program dzieræawiony"," Wymagany plik KODY.DBF !"," Wymie‰ na poprawny lub skontaktuj si© z serwisem.",5) 
    clear
	return  
  endif

endif

if file("param.dbf")
  if kj_use("param",.f.,3)    &&
    param_lad()	
    close
  else
    clear
	kj_tkom(9," Uwaga! ","Wykryto problem w dost©pie do bazy <PARAM.DBF>."," Plik jest prawdopodobnie uszkodzony."," Wymie‰ na poprawny lub skontaktuj si© z serwisem.",5) 
    clear
	return
  endif
endif

if file("ue_opis.dbf")
  if kj_use("ue_opis",.f.,3)    &&
    zue_opis1=ue_opis1
	zue_opis2=ue_opis2
	zue_opis3=ue_opis3
    close
  else
    clear
	kj_tkom(9," Uwaga! ","Wykryto problem w dost©pie do bazy <UE_OPIS.DBF>."," Plik jest prawdopodobnie uszkodzony."," Wymie‰ na poprawny lub skontaktuj si© z serwisem.",5) 
    clear
	return
  endif
endif


* **
*
set default to leg01
if file("drukarki.dbf")
  if kj_use("drukarki",.f.,3)
    locate for dr="*"
	if.not.found()
	  go top
	endif
    druk_lad()	
    use
  endif
else
  clear
  @ 10,10 say "Brak pliku DRUKARKI.DBF"
  INKEY(0)
endif



public_txt()
public_mag()
if zakwizytor
  akwizyt_public()
endif
if zfifo
  fifo_public()
  fifo_tow_public()
endif

setcolor("n/n+")
clear
*IF PROCNAME()="SH"
*  @ 10,10 SAY "SPRZEDAΩ"
*ENDIF
*@ 0,0 SAY PROCNAME()
*INKEY(0)
close all
if zkj_serwis
  set color to
  serwis()
  close all
  return
endif

sh_tlo()
do case
  case kolor=24
    kj_okno(0,0,10, "  L  E  G  O  S                                                                 ",24)
    *kj_okno(18,0,5, "         A K T U A L N E      P A R A M E T R Y      P R O G R A M U            ",24)
	kj_okno(18,0,5, "                                                                                ",24)
  otherwise
    kj_okno(0,0,10, "  L  E  G  O  S                                                                 ",2)
    *kj_okno(18,0,5, "         A K T U A L N E      P A R A M E T R Y      P R O G R A M U            ",2)
	kj_okno(18,0,5, "                                                                                ",2)
endcase
lcolor=setcolor()
if zhaslo_l
  do skom with "Wpisz haslo i zatwierdz klawiszem [Enter]"
  set color to
  *set default to shset
  set default to &set_serwer
  if.not.kj_haslo(0,46,0)
    clear
    return
  endif
  set default to
endif
set color to "n/w,w/n"
sh_paramsay()

do case
  case mag_round=0
    mag_picture:="99999999999"
  case mag_round=1
    mag_picture:="999999999.9"
  case mag_round=2
    mag_picture:="99999999.99"
  case mag_round=3
    mag_picture:="9999999.999"			
  case mag_round=4
    mag_picture:="999999.9999"				
endcase
if z2kod
  f_tkod=space(14)
endif
set default to
if file("kj_kasa.exe")
  kasa_glowna:=.t.
endif

if file("kas_def.dbf").and..not.zkj_kasa.and..not.kasa_glowna
  kas_inst()  
endif
if produkcja
  wyrob_public()
  sklad_public()
endif
prac_public()
public zarchiw:=0
zmklucz=mklucz
zvat00_znak=vat00_znak()
zvatexp_znak=vatexp_znak()
zvat00_numer=vat00_numer()
close_all("SH")
if zkj_ksiega
  okno=.t.
  if zksilefirm>1
    ksfirnum()
  endif
  public zrok:=year(date())
  @ 7,20 say " Rok rozliczeniowy :       "
  set cursor on
  @ 7,41 get zrok
  read
  set cursor off
  sh_kmenu()
else
  sh_gmenu()
endif  
set color to
clear
RETURN






*******************************************************************************
* Tworzenie nowego dokumentu                                                  *
*******************************************************************************
FUNCTION NOWY_DOK()
local ek,ek1,ek2,ek3,lcolor:=setcolor(),lm_okno:=.t.,lm_num:=val(zdg_magazyn),lm_txt:="",lm_klucz:=1
local ltyp:=zdtyp,lndok:=0,l_use:=.t.,l_zap:=.t.,lpoz:=1,lpopraw:=1,luse:=.t.
local lclose:=.t.,lnowy:=.t.,ldndow:=space(15)
zpracow_kon=.f.
z1_tpopraw=.f.
z2_tpopraw=.f.
zkordok_popraw:=.f.
*zcen_dok=cen_dok()
d_zer()	
k_zer()
tow_zer()
z_zdok_def_lad()
*if (zdtyp$export_gr.or.zdtyp$import_gr).and..not.zdtyp$kormag_gr
if zdtyp$eksportks_gr 
  nowy_rozlicz_dok()
  setcolor(lcolor)
  restore screen from ek
  close_all("SH")
  return
endif
if zdtyp$kasa_gr
  do while.t.
    nowy_kasa_dok(.t.,.f.,.f.)
	if lastkey()=27
	  exit
	endif
  enddo	
  setcolor(lcolor)
  restore screen from ek
  close_all("SH")
  return
endif

*if zdtyp$ksiega_gr
*  do while.t.
*    nowy_ksiega_dok(.t.,.f.,.f.)
*	if lastkey()=27
*	  exit
*	endif
*  enddo	
*  setcolor(lcolor)
*  restore screen from ek
*  close_all("SH")
*  return
*endif

do while.t.
  save screen to ek
  dok_tlo(lnowy)

  set cursor off
  if.not.(ltyp$bezkontrah_gr.or.ltyp$przes_gr)
    g_tlo()
	kontrah(zk_serwer,.t.,"",1,.f.,1)
    if lastkey()=27
      close_all("SH")
	  return	
	endif
	kon_say()
    if zkonlimit=1.and.zdtyp$sprzedaz_gr
	  konlimit()
	endif
  endif	  

  if ltyp$przes_gr
    if empty(zdp_magazyn)
      g_tlo()
	  @ 0,0 say " Wyb¢r magazynu docelowego.                                "
      zpracow_kon=.t.
	  do while.t.
	    kontrah(zk_serwer,.t.,"",2,.f.,2)
        if lastkey()=27
	      return
	    endif
	    if zknum=1
          kj_tkom(10,"Uwaga !","Wybraàeò magazyn gà¢wny, kt¢ry zawsze zwi•zany jest z obsàugiwanym dokumentem.","W tej cz©òci dokumentu naleæy wskazaÜ magazyn pomocniczy. ","Zmie‰ magazyn na inny.",5)
        else
	      exit
	    endif	  
	  enddo  
	  zpracow_kon=.f.
      if lastkey()=27
        close_all("SH")
	    return	
	  endif
	  kon_say()
      zdp_magazyn=str(zknum,3)
    else
      if ltyp$przes_gr
	    zknum=val(zdp_magazyn)
	  endif
    endif
*
    zkserwer=zk_serwer
    zk_serwer=zp_serwer

    if.not.kon_use()
      return .f.
    endif
    locate for knum=val(zdg_magazyn)
	if found()
	  wmag_lad()
	endif
	locate for knum=val(zdp_magazyn)
	if found()
	  zkon_lad()
	endif
    close
    zk_serwer=zkserwer
*	
  endif
  
  if krabat_up.and.zkrabat#0.and.zdtyp$sprzedaz_gr
    save screen to ek1
	g_tlo()
    kj_okno(7,15,10," Obsàuga rabatu staàego                           ",2)	
	set cursor on
	@ 9,17 say "Kontrahent "+substr(zknaz1,1,30)
	@ 10,17 say "          "+substr(zknaz2,1,30)
	@ 12,17 say "posiada staày rabat w wysokoòci ....."+str(zkrabat)+" %"
	@ 14,17 say "Dla aktualnie redagowanego dokumentu"
	do while.t.
	  @ 15,17 say "zatwierd´ lub zmie‰ wysokoòÜ rabatu " get zkrabat when s_kom("Kaæda wprowadzona przez Operatora cena zostanie zmniejszona o wysokoòÜ rabatu!")
	  read
	  if lastkey()=13
	    zdrabat=zkrabat
		exit
	  endif
	enddo  
	set cursor off
	restore screen from ek1
  endif

  if zakwizytor.and.zdtyp$akwizyt_gr 
    zdakwizytor=akwizytor()        &&funkcja zapami©tuje parametry wybranego akwizytora
  endif

  tow_say(l_zap,0)
  keyboard chr(33)  
  luse=.t.
*  mag_clos()
  if zdtyp$przes_gr.and.zdtyp$zakup_gr
    lm_num=zknum
  endif
  magazyn(lm_num,lm_okno,lm_txt)	   	    
  if lastkey()=27
	close_all("SH")
	return
  endif
  close
  select &buf_sel
  tow_say(.f.,3)
  end_say()
  save screen to ek1
  do while.t.
*    restore screen from ek2
	    select &buf_sel
	    go top
		tow_say(.f.,3)	
    lpoz=end_menu(lpoz)
	save screen to ek2
	if lastkey()=27
      if kj_gkom(12," Uwaga! ","Dokument zostanie usuni©ty.","WykonaÜ  ?",.t.,25)
        dok_default()
		if zopis_poz.and.file("topis.dbf")
          select &topis_sel
	      if.not.kj_use("topis",.f.,3)
	        exit
	      else
	        if.not.kj_pusty()
			  set index to topis
			  do while empty(op_tndow)
				if reclock(5)      
	              delete
                  unlock
	            endif			  
			    go top
			  enddo
			endif
	        close
			
		  endif
        endif  		
		exit
	  endif	
    else
	
	do case
	  case lpoz=1
	    vdok_plik=.f.
		if zap_dok(.f.)
          if zdtyp$kormag_gr
		    if kor_mag(.f.)
			  dok_znacz()
			endif
		  endif

		  select &buf_sel
		  vdok_plik=.f.
		  dok_druk(vdok_plik,.t.)
          if kasa_glowna.and.zdtyp$kasadok_gr.and.zdsposzap$"GKR"
            dokdef(1)
		    ldndow=zdndow
		    zdniedop=ztbrut_all
            if lastkey()=27     &&wyà•czona drukarka i rezygnacja z wydruku
				dokdef(0)
				select &dok_sel
				if dok_use()
				  set order to 3
				  seek zdndow
				  if found()
				    if reclock(5)      
	                  replace dniedop with zdniedop
                      unlock
	                endif			  
				  else
                    kj_tkom(8," Uwaga! "," Wykryto bledy! ","Sprawd´ rozliczenie dokumentu.","",5)				    
				  endif	
				endif  
			else
			  kasa_dok()
			endif
		    close_all("SH")
		    dokdef(0)
          endif		
		  keyboard chr(13)
		else
		  kj_tkom(12," Uwaga! ","Dokument nie zostal zapamietany","Mozliwy blad sieciowy lub uszkodzony plik","Sprawdz i ponow probe.  Nacisnij dowolny klawisz",5)
		  keyboard chr(27)
		endif

	    keyboard chr(13)
        close_all("SH")
		exit			  

	  case lpoz=2
		if zap_dok(.f.)
		  vdok_plik=.t.
          if zdtyp$kormag_gr
		    if kor_mag(.f.)
			  dok_znacz()
			endif
		  endif

		  select &buf_sel
		  dok_druk(vdok_plik,.t.)
		  keyboard chr(13)
		  vdok_plik=.f.
		else
		  kj_tkom(12," Uwaga! ","Dokument nie zostal zapamietany","Mozliwy blad sieciowy lub uszkodzony plik","Sprawdz i ponow probe.  Nacisnij dowolny klawisz",5)
		endif
        if kasa_glowna.and.zdtyp$kasadok_gr.and.zdsposzap$"GKR"
          dokdef(1)
		  ldndow=zdndow
		  zdniedop=ztbrut_all
		  kasa_dok()
		  close_all("SH")
		  dokdef(0)
        endif		
	    keyboard chr(13)
		close_all("SH")
		exit
	  case lpoz=3
	    select &buf_sel
	    go top
		tow_say(.f.,4)
	  case lpoz=4
		do while.t.
		  restore screen from ek2
		  end_say()
		  select &buf_sel
	      go top
		  tow_say(.f.,3)
		  lpopraw=end_popraw_menu(lpopraw)	
		  if lastkey()=27
		    exit
		  endif
		  do case
		    case lpopraw=1.and..not.ltyp$bezkontrah_gr
              kontrah(zk_serwer,.t.,"",3,.f.,1)
              restore screen from ek2
			  kon_say()			
			  save screen to ek2
			  exit
			case lpopraw=2  
			  restore screen from ek1
			  go top
			  select &buf_sel
			  keyboard chr(205)
	          tow_say(.f.,5)
              dok_end()
 			case lpopraw=3
			  dok_end()
		  endcase
		enddo  
        @ 1,1 clear to 4,78
	  case lpoz=5.and.zdtyp$sprzedaz_gr.and..not.zdznak=zkordok_znak
	    if drabat_up
		  kj_rabat(zdrabat)
		  dok_end()		
		else
		  kj_tkom(12," Uwaga!","","Brak uprawnie‰ do nadawania rabatu.","",5)
		endif  
	  case lpoz=6
	    exit
	endcase
    endif          &&Kon
  enddo	
  exit
enddo
setcolor(lcolor)
restore screen from ek
end_say()
close_all("SH")

RETURN nil




*******************************************************************************
* Tlo nowego dokumentu z proponowanym kolejnym numerem                        *
*******************************************************************************
FUNCTION DOK_TLO(pnowy)
local ltytul:=space(80)
ul:=space(80)
if.not.pnowy.or..not.zsiec
  if empty(zdndok)
    ldndok=zdndow
  else
    ldndok=zdndok
  endif	
else
  ldndok=stuff(space(15),3,6,"*NOWY*")
endif  
do case
  case zdtyp$sprzedaz_gr
    ltytul:=" SPRZEDAΩ:               Dokument   nr                                          "       
  case zdtyp$zakup_gr
    ltytul:=" ZAKUP:                  Dokument   nr                                          "       
  case zdtyp$przes_gr
    ltytul:=" PRZESUNI®CIE            Dokument   nr                                          "       	
  case zdtyp$przerob_gr
    ltytul:=" PRZER‡B                 Dokument   nr                                          "       
  case zdtyp$dowodwew_gr
    ltytul:=" DOW‡D WEWN®TRZNY        Dokument   nr                                          "       	
endcase
ltytul=stuff(ltytul,40,15,ldndok)
ltytul=stuff(ltytul,66,12,znaz_dok)
kj_okno(0,0,24,ltytul,2)

RETURN NIL


*******************************************************************************
* Nadanie kolejnego numeru nowemu dokumentowi                                 *
* pndow=.t. wygeneruj kolejny numer grupowy  pndok=.t. wyg. nowy numer znaku  *
*******************************************************************************
FUNCTION NOWY_NUMDOK(pwzor)
local lexlusive:=.t.,lndok:=0,lodeslij_do:="",select:=select()
local lsciezka:=zdnum_serwer+"001dok"
set default to &lsciezka
  select &num_sel
*  if.not.empty(zdnum_serwer)
*    set default to &lsciezka
*  else
*    set default to 001dok
*  endif
  if kj_use("dpam",lexlusive,6)
    if empty(zdndow).or.pwzor          &&jeòli nowy dokument przyj©cia (wydania) towaru
	  if.not.empty(zznak_dow)
	    locate for znak=zznak_dow
	  else
	    locate for znak=zdgrup
	  endif
	  if.not.found()
	    kj_tkom(12," Uwaga!","","Brak moæliwoòci nadania kolejnego numeru.","Dotyczy dokument¢w z grupy "+zdgrup,5) 
	    close
		select &select
	    return .f.
	  else
	    lodeslij_do=odeslij_do
	  endif
      go top
	  locate for znak=lodeslij_do
	  if.not.found()
	    kj_tkom(12," Uwaga!","","Brak moæliwoòci nadania kolejnego numeru.","Bà©dy w pliku DPAM.DBF",5) 
	    close
		select &select
	    return .f.
	  else
	    lndok=numer+1
	  endif	
	  replace numer with lndok
      commit
	  zdndow=stuff(space(15),9-len(alltrim(str(lndok))),len(alltrim(str(lndok))),alltrim(str(lndok)))
      zdndow=stuff(zdndow,9,2,"/"+lodeslij_do)
*      zdndow=stuff(zdndow,11,4,"/"+ALLTRIM(STR(year(DATE()))))	  
      zdndow=stuff(zdndow,11,4,"/"+ALLTRIM(STR(year(zddatdow))))	  
      *if .not. empty(zd1_lamany) .and. .not.( zdznak$zkordok_znak.and..not.zkordoklam)
	  if .not. empty(zd1_lamany) &&060307
	    zdndow=alltrim(stuff(zdndow,12,2,""))
		zdndow=zdndow+znumodstep
		zdndow=alltrim(zdndow)
		zdndow=alltrim(zdndow+zd1_lamany)
		zdndow=stuff(space(15),16-len(zdndow),len(zdndow),zdndow)
	  endif      
	endif
	
*    if.not.(zdtyp$dowod_gr.or.zdtyp$defnum_gr)           &&jeòli nowy numer dokumentu zakupu (sprzedazy)
    if.not.(zdtyp$dowod_gr.or.zdtyp$defnum_gr).and..not.(zdtyp$kasa_gr.and.zdsposzap$"PR")           &&jeòli nowy numer dokumentu zakupu (sprzedazy)
	  locate for znak=zdznak
	  if.not.found()
	    kj_tkom(12," Uwaga!","","Brak moæliwoòci nadanie kolejnego numeru.","Dotyczy dokument¢w "+zdznak,5) 
	    close
	    select &select
		return .f.
	  else
	    lodeslij_do=odeslij_do
	  endif
      go top
	  locate for znak=lodeslij_do
	  if.not.found()
	    kj_tkom(12," Uwaga!","","Brak moæliwoòci nadanie kolejnego numeru.","Bà©dy w pliku DPAM.DBF "+zdznak,5) 
	    close
		select &select
	    return .f.
	  else
	    lndok=numer+1
	  endif	
	  replace numer with lndok
      commit
	  zdndok=stuff(space(15),9-len(alltrim(str(lndok))),len(alltrim(str(lndok))),alltrim(str(lndok)))
      zdndok=stuff(zdndok,9,2,"/"+lodeslij_do)
      zdndok=stuff(zdndok,11,4,"/"+ALLTRIM(STR(year(zddatdok))))	  
      *if .not. empty(zd1_lamany) .and. .not.( zdznak$zkordok_znak.and..not.zkordoklam)
	  if .not. empty(zd1_lamany)  &&060307

	    zdndok=alltrim(stuff(zdndok,12,2,""))
		zdndok=zdndok+znumodstep
		zdndok=alltrim(zdndok)
		zdndok=alltrim(zdndok+zd1_lamany)
		zdndok=stuff(space(15),16-len(zdndok),len(zdndok),zdndok)
	  endif      
	endif	
	close
  else
    select &select    
    return .f.
  endif
  select &select
RETURN .t.



*******************************************************************************
* Prezentacja wybranych do dokumentu pozycji magazynowych                     *
*******************************************************************************
FUNCTION TOW_SAY(p_zap,p_tryb)
local ltytul:="                  W  Y  K  A  Z       P  O  Z  Y  C  J  I                     "   
local select:=select(),lcolor:=setcolor()
local t[6],q[6],lnowy:=.t.
if.not.zdznak$zkordok_znak
  t[1]:="str(tnum,3)"
  if zrozmiar
    t[2]:="tnaz"
  else
    t[2]:="substr(tnaz,1,32)"
  endif	
  t[3]:="round(til,mag_round)"
  t[4]:="tjm"
  t[5]:="round(tcen,2)"
  t[6]:="tstawka"
  q[1]:="Lp."
  q[2]:="Nazwa"
  q[3]:="IloòÜ"
  q[4]:="J.m."
  q[5]:="Cena  NETTO"
  q[6]:="St"
else
  t[1]:="substr(tnaz,1,32)"
  t[2]:="round(til,mag_round)"
  t[3]:="tjm"
  t[4]:="round(tcen,2)"
  t[5]:="tstawka"
  q[1]:="Nazwa"
  q[2]:="IloòÜ"
  q[3]:="J.m."
  q[4]:="Cena  NETTO"
  q[5]:="St"
endif
if zdtyp $ dok_brut_gr
  t[5]:="round(tcen*(1+tstawka/100),2)"
  q[5]:="Cena BRUTTO"
endif
if zdtyp$importsad_gr
  q[5]:="WartoòÜ NETTO"
endif
if p_tryb=6    &&korekta
  t[5]="tanul"
  q[5]="Ko"
endif
set key 10 to
set key 24 to
set key 5 to
*      dok_default()
      *set default to shset
	  set default to &set_serwer
      select &buf_sel
	  if.not.used()
        if.not.kj_use("towbuf",.t.,3)
	      return
	    else
		  set index to towbuf
		endif
      endif
      if p_zap
        zap
      endif  	  
  kj_okno(5,1,15,ltytul,5)  
  go top
  tplik_sum(".not.eof()")
  @ 19,5 say "Razem NETTO:                 VAT:                 BRUTTO:            " 
  if zdtyp$import_gr.or.zdtyp$eksport_gr
    set color to
	@ 20,3 say " Waluta rozliczeniowa :             "
	@ 20,28 say zwaluta
	@ 20,39 say "    Kurs :            =            zà "
	@ 20,50 say zprzelicznik picture "999999"
	@ 20,57 say zdwaluta
	@ 20,63 say zdkurs picture "99999.9999"
	setcolor(lcolor)
  endif
  @ 19,15 say ztnet_all picture "99999999.99"
  @ 19,39 say ztvat_all picture "99999999.99"
  @ 19,60 say ztbrut_all picture "99999999.99"

	  		
do case
  case p_tryb=0
		go top
		tplik_sum(".not.eof()")
        @ 19,5 say "Razem NETTO:                 VAT:                 BRUTTO:            " 
        @ 19,15 say ztnet_all picture "99999999.99"
        @ 19,39 say ztvat_all picture "99999999.99"
        @ 19,60 say ztbrut_all picture "99999999.99"  
        kj_okno(5,1,15,ltytul,5)  
	    set color to
		dbedit(6,1,18,78,t,"T_FU_0","",q,"ﬂ",,"ﬂ")
		save screen to ek_dok
  case p_tryb=1
	  go top
      *lpoz_il=11
	  lpoz_il=10
	  for i=1 to lastrec()-lpoz_il
	    skip
	  next
      kj_okno(5,1,15,ltytul,5)  
	  set color to
	  dbedit(6,1,18,78,t,"T_FU_1","",q,"ﬂ",,"ﬂ")  		
      save screen to ek_dok
  case p_tryb=2
    lnowy=.f.
    dok_tlo(lnowy)
    kon_say()
    kj_okno(5,1,15,ltytul,5)  
    set color to
	dbedit(6,1,18,78,t,"T_FU_2","",q,"ﬂ",,"ﬂ")	  
	save screen to ek_dok
  case p_tryb=3
*    dok_tlo()
    kon_say()
    kj_okno(5,1,15,ltytul,5)  
    set color to
	dbedit(6,1,18,78,t,"T_FU_3","",q,"ﬂ",,"ﬂ")	  	
	save screen to ek_dok
  case p_tryb=4
    set color to
    keyboard chr(205)
	dbedit(6,1,18,78,t,"T_FU_4","",q,"ﬂ",,"ﬂ")	  		
	save screen to ek_dok
  case p_tryb=5
    set color to
    dbedit(6,1,18,78,t,"T_FU_5","",q,"ﬂ",,"ﬂ")	  			
	save screen to ek_dok
  case p_tryb=6
    set color to
    dbedit(6,1,18,78,t,"T_FU_6","",q,"ﬂ",,"ﬂ")	  				
	save screen to ek_dok
  case p_tryb=7
    set color to
    dbedit(6,1,18,78,t,"T_FU_7","",q,"ﬂ",,"ﬂ")	  					
	save screen to ek_dok
  case p_tryb=8
    set color to
    dbedit(6,1,18,78,t,"T_FU_8","",q,"ﬂ",,"ﬂ")	  						
	save screen to ek_dok
endcase
setcolor(lcolor)
ztowlastrec=lastrec()
select &select
RETURN nil



*******************************************************************************
* Mozliwosc poprawiania dokumentu juz zakonczonego                            *
* Poprawianie dokumentu
*******************************************************************************
FUNCTION T_FU_7(tryb,numer)
local lm_okno:=.t.,lm_num:=val(zdg_magazyn),lm_txt:="",lm_klucz:=1,luse:=.t.
local last:=lastkey(),recno:=recno(),ltxt
local m_num:=1,m_okno:=.t.,m_txt:="",m_klucz:=1,lrabat:=0
ztow_lad()
z2_tpopraw=.t.
zkordok_popraw:=.t.
*! buf_sel=select()
*do skom with "<D>opisz  <Enter>-popraw   <Ctrl-Enter>-kasuj               <Esc> - rezygnacja"
if zopis_poz
  do skom with "<D>opisz  <Enter>-popraw   <Ctrl-Enter>-kasuj  ra<B>at  <O>pis  <Esc> - rez."
else
  do skom with "<D>opisz  <Enter>-popraw   <Ctrl-Enter>-kasuj  ra<B>at    <Esc> - rezygnacja"
endif

if znaz_64.and..not.empty(substr(tnaz,33))
  ltxt=stuff(space(80),1,12,"| cd Nazwy: ")
  ltxt=stuff(ltxt,79,1,"|")
  ltxt=stuff(ltxt,15,32,substr(tnaz,33))
  do skom with ltxt
endif


*  recno=recno()
*  fwar=dbfilter()
*  set filter to
  go top
  tplik_sum(".not.eof()")
*  set filter to &fwar
*  go top
  go recno
  @ 19,5 say "Razem NETTO:                 VAT:                 BRUTTO:            " 
  @ 19,15 say ztnet_all picture "99999999.99"
  @ 19,39 say ztvat_all picture "99999999.99"
  @ 19,60 say ztbrut_all picture "99999999.99"
do case
  case chr(last)$"Oo"
    topis_popraw(1)
  case chr(last)$"Bb".and.zdtyp$sprzedaz_gr.and..not.zdznak=zkordok_znak
    lrabat=zdrabat
	kj_rabat(zdrabat)
	kj_bazrabat(lrabat,zdrabat)       &&zapisanie zmian w bazie towary.dbf
	keyboard chr(205)
	if.not.buf_use()
	  return 0
	endif
	return 2 
  case chr(last)$"Dd"
    zdopisz_popr=.t.
	keyboard chr(33)
	mag_clos()
    ztil=1
	magazyn(lm_num,lm_okno,lm_txt)	  
    mag_clos()
    if.not.lastkey()=27.or..not.ztkormag
	  dopisz_poz(.t.)
	endif  
    select &buf_sel
    go recno
    zdopisz_popr=.f.
	return 2

  case last=13.and.(zdznak$zkordok_znak.and.til<0)
    kj_tkom(12," Uwaga ! ","","Ta pozycja wynika z dokumentu korygowanego.","Nie moæe byÜ poprawiana.",5)
	keyboard chr(205)
	return 2
	
	
*  case last=13.and.twyroznik="o"
*    kj_tkom(12," Uwaga ! ","Aby poprawiÜ opis naleæy usun•Ü pozycj© wraz z opisem ","i nast©pnie wprowadziÜ ponownie.","Pozycja pojawi sie jako ostatnia w dokumencie",5)
*    opis_popraw()
*	keyboard chr(205)
*	return 2	
		
  case last=13.and..not.tanul.and.tkormag
    ztow_lad()
	mag_clos()
    anul_poz(.t.)
	keyboard chr(208)   &&wejscie do magazynu z wyszukaniem pozycji tow z jednoczesnym
	     ** nadaniem trybu poprawiania (z2_tpopraw=.t.)
    mag_clos()
	magazyn(lm_num,lm_okno,lm_txt)	   &&sekwencyjnie: wybor,ilosc,cena,zapamietanie w TOW	    
         ** zmienna z2_tpop raw decyduje o powrocie systemu z M_FU() do T_FU5()
    mag_clos()
    if zdtyp$import_gr.or.zdtyp$eksport_gr
	  ztcen=kj_round(ztcen*zdkurs/zprzelicznik,2)
	endif
    if.not.lastkey()=27
	  dopisz_poz(.t.)
	endif  
	select &buf_sel
	return 2
	
  case last=13.and..not.tanul.and..not.tkormag
    ztow_lad()
    anul_poz(.f.)
**    magdefault(val(zmg_dok))
    save screen to ek
	niemagpoz()
    if.not.ztwyroznik="o"
	  niemag_il()
	endif  
    restore screen from zek
	z1_tpopraw=.t.
*	tow_wyp(.f.)
    select &buf_sel
    go recno
    *if.not.lastkey()=27
      if zsiec
        if reclock(5)      
	      tow_replac()
          unlock
	    else
          return 2
	    endif
	  else
	    tow_replac()
	  endif
      commit
	*endif  
    dopisz_poz(.t.)
   	close_all("SH")
    buf_use()	
    keyboard chr(205)
	restore screen from ek
	
	return 2
	
  case last=10.and.tanul
    kj_tkom(12," Uwaga ! ","","Ta pozycja wynika z dokumentu korygowanego.","Nie moæe byÜ usuni©ta.",5)
	keyboard chr(205)
	return 2

  case last=10.and..not.tanul
    ztow_lad()
    if kj_gkom(12," Uwaga! ","Usunac pozycje",alltrim(ztnaz)+ "  ?",.t.,5)
	  mag_clos()
	  anul_poz(.t.)
      select &buf_sel
	  go top
	endif
	keyboard chr(205)
	return 2
  case last=27
    return 0
endcase

RETURN 1


*******************************************************************************
* Korekta dokumentu                                                           *
*******************************************************************************
FUNCTION T_FU_6(tryb,numer)
local lm_okno:=.t.,lm_num:=val(zdg_magazyn),lm_txt:="",lm_klucz:=1,luse:=.t.,ek
local last:=lastkey(),recno:=recno(),ltxt
local m_num:=1,m_okno:=.t.,m_txt:="",m_klucz:=1
ztow_lad()
z2_tpopraw=.t.

*do skom with "<D>opisz  <Enter>-popraw   <Ctrl-Enter>-kasuj  ra<B>at    <Esc> - rezygnacja"
do skom with " <Enter> - popraw    <D>opisz    <Esc> - rezygnacja"

if znaz_64.and..not.empty(substr(tnaz,33))
  ltxt=stuff(space(80),1,12,"| cd Nazwy: ")
  ltxt=stuff(ltxt,79,1,"|")
  ltxt=stuff(ltxt,15,32,substr(tnaz,33))
  do skom with ltxt
endif

fwar=dbfilter()
if zkordoksay
  set filter to til>0
else
  set filter to
endif  
go top
tplik_sum(".not.eof()")
set filter to &fwar
go top
go recno
@ 19,5 say "Razem NETTO:                 VAT:                 BRUTTO:            " 
@ 19,15 say ztnet_all picture "99999999.99"
@ 19,39 say ztvat_all picture "99999999.99"
@ 19,60 say ztbrut_all picture "99999999.99"
do case
  case chr(last)$"Dd"
    zdopisz_popr=.t.
	keyboard chr(33)
	mag_clos()
    ztil=1
	magazyn(lm_num,lm_okno,lm_txt)	  
    mag_clos()
*    if.not.lastkey()=27.or..not.ztkormag
*	  dopisz_poz(.t.)
*	endif  
    select &buf_sel
    go recno
    zdopisz_popr=.f.
	return 2
 
  case last=13.and..not.tanul.and.tkormag.and.til>0
    ztow_lad()
	delete
	mag_clos()
    if ztkormag
	  keyboard chr(208)   &&wejscie do magazynu z wyszukaniem pozycji tow z jednoczesnym
	     ** nadaniem trybu poprawiania (z2_tpopraw=.t.)
 	else
	  keyboard chr(33)   &&wejscie do magazynu bez wyszukania pozycji
	endif	
      mag_clos()
	  magazyn(lm_num,lm_okno,lm_txt)	   &&sekwencyjnie: wybor,ilosc,cena,zapamietanie w TOW	    
         ** zmienna z2_tpop raw decyduje o powrocie systemu z M_FU() do T_FU5()
      mag_clos()
	select &buf_sel
	return 2
	
  case last=13.and..not.tanul.and..not.tkormag.and.til>0
    save screen to ek
	ztow_lad()
	delete
    niemagpoz()	

	niemag_il()
    if kj_append(3)
	    tow_replac()
        unlock
	endif
    *append blank
	*tow_replac()
	select &buf_sel
	keyboard chr(205)
	restore screen from ek
	return 2	

  case last=27
    return 0
endcase

RETURN 1



*******************************************************************************
* Mozliwosc poprawiania dokumentu juz zakonczonego                            *
*******************************************************************************
FUNCTION T_FU_5(tryb,numer)
local lm_okno:=.t.,lm_num:=val(zdg_magazyn),lm_txt:="",lm_klucz:=1,luse:=.t.
local last:=lastkey(),recno:=recno(),ltxt
local m_num:=1,m_okno:=.t.,m_txt:="",m_klucz:=1
local ltxt1:="<D>opisz    <Enter> - popraw    <Ctrl-Enter> - kasuj      <Esc> - rezygnacja"
local ltxt2:="<D>opisz    <Enter> - popraw    <Ctrl-Enter> - kasuj   ra<B>at   <Esc> - rezygnacja"
if zopis_poz
  ltxt1:="<D>opisz  <Enter>-popraw  <Ctrl-Enter>-kasuj   <O>pis     <Esc> - rezygnacja"
  ltxt2:="<D>opisz  <Enter>-popraw  <Ctrl-Enter>-kasuj  ra<B>at  <O>pis    <Esc> - rezygnacja"
endif
ztow_lad()
z2_tpopraw=.t.

do case
  case zrabat_plus
    do skom with ltxt2 
  otherwise
    do skom with ltxt1 	
endcase

if znaz_64.and..not.empty(substr(tnaz,33))
  ltxt=stuff(space(80),1,12,"| cd Nazwy: ")
  ltxt=stuff(ltxt,79,1,"|")
  ltxt=stuff(ltxt,15,32,substr(tnaz,33))
  do skom with ltxt
endif

  recno=recno()
  go top
  tplik_sum(".not.eof()")
  go recno
  @ 19,5 say "Razem NETTO:                 VAT:                 BRUTTO:            " 
  @ 19,15 say ztnet_all picture "99999999.99"
  @ 19,39 say ztvat_all picture "99999999.99"
  @ 19,60 say ztbrut_all picture "99999999.99"
do case
  case chr(last)$"Oo"
    topis_popraw(2)
	
  case chr(last)$"Bb".and.zrabat_plus
    rabat_plus()
	keyboard chr(205)
	
  case chr(last)$"Dd"
    zdopisz_popr=.t.
    keyboard chr(33)
	ztil=1
	select &gmag_sel
	magazyn(lm_num,lm_okno,lm_txt)	  
    mag_clos()
	select &buf_sel
    go recno
	zdopisz_popr=.f.
	return 2
		
  case last=13.and.tkormag	
    ztow_lad()
    keyboard chr(29)   &&wejscie do magazynu z wyszukaniem pozycji tow z jednoczesnym
	     ** nadaniem trybu poprawiania (z2_tpopraw=.t.)
    luse=.f.
	select &gmag_sel
	close       &&    *!
	magazyn(lm_num,lm_okno,lm_txt)	   &&sekwencyjnie: wybor,ilosc,cena,zapamietanie w TOW	    
         ** zmienna z2_tpop raw decyduje o powrocie systemu z M_FU() do T_FU5()
    mag_clos()
	select &buf_sel
    go recno
	return 2
  case last=13.and..not.tkormag	
    niemagpoz()
    niemag_il()
	if zsiec
      if reclock(5)      
	    tow_replac()
        unlock
	  else
        return 2
	  endif
	else
	  tow_replac()
	endif
    commit
    keyboard chr(205)
	return 2
  case last=10
    ztow_lad()
    if kj_gkom(12," Uwaga! ","Usunac pozycje",alltrim(ztnaz)+ "  ?",.t.,5)
	  delete
	  pack
	  go top
	  go recno
	endif
	keyboard chr(205)
	return 2
  case last=27
    return 0
endcase
RETURN 1

*******************************************************************************
* Mozliwosc przegladania wybranych do dokumentu pozycji                       *
*******************************************************************************
FUNCTION T_FU_4(tryb,numer)
local last:=lastkey(),ltxt
dwzor=.f.
if.not. zdokexport
  if zdokwzor_op.and.dwzor_wpasku
    do skom with "<Enter> - opis pozycji    <W>z¢r      <Esc> - koniec prezentacji "
  else
    do skom with "<Strzalki> - przegladanie       <Esc> - koniec prezentacji dokumen"
  endif  
else
  if zdokwzor_op.and.dwzor_wpasku
    do skom with "<Enter> - opis pozycji    <W>z¢r  <E>ksport_dokumentu     <Esc> - koniec prezentacji "
  else
    do skom with "<Strzalki> - przegladanie  <E>ksport_dokumentu      <Esc> - koniec prezentacji dokumen"
  endif
endif

if znaz_64.and..not.empty(substr(tnaz,33))
  ltxt=stuff(space(80),1,12,"| cd Nazwy: ")
  ltxt=stuff(ltxt,79,1,"|")
  ltxt=stuff(ltxt,15,32,substr(tnaz,33))
  do skom with ltxt
endif

do case
  case last=27
    keyboard chr(205)
	return 0
  case chr(last)$"Ww".and.zdokwzor_op
    dwzor=.t.
    keyboard chr(27)
    return 0
  case chr(last)$"Ee".and.zdokexport
    dokexport()
    keyboard chr(27)
    return 0	
  case last=13.and.zdokwzor_op	
    topis_say()
	return 2
endcase
RETURN 1

*******************************************************************************
* Wydrukowanie na ekranie zawartosci pliku tow_buf z podliczeniem wartosci    *
*******************************************************************************
FUNCTION T_FU_3(tryb,numer)
  go top
  tplik_sum(".not.eof()")
  @ 19,5 say "Razem NETTO:                 VAT:                 BRUTTO:            " 
  @ 19,15 say ztnet_all picture "99999999.99"
  @ 19,39 say ztvat_all picture "99999999.99"
  @ 19,60 say ztbrut_all picture "99999999.99"
RETURN 0


*******************************************************************************
* Mozliwosc poprawiania dokumentu w trakcie tworzenia                         *
*******************************************************************************
FUNCTION T_FU_2(tryb,numer)
local lm_okno:=.t.,lm_num:=val(zdg_magazyn),lm_txt:="",lm_klucz:=1
local last:=lastkey(),recno:=recno(),ltxt
local m_num:=1,m_okno:=.t.,m_txt:="",m_klucz:=1
*local ltxt1:="<D>opisz    <Enter> - popraw    <Ctrl-Enter> - kasuj      <Esc> - rezygnacja"
*local ltxt2:="<D>opisz    <Enter> - popraw    <Ctrl-Enter> - kasuj   ra<B>at   <Esc> - rezygnacja"
local ltxt1:="<Enter> - popraw    <Ctrl-Enter> - kasuj      <Esc> - rezygnacja"
local ltxt2:="<Enter> - popraw    <Ctrl-Enter> - kasuj   ra<B>at   <Esc> - rezygnacja"
ztow_lad()
  @ 19,5 say "Razem NETTO:                 VAT:                 BRUTTO:            " 
  @ 19,17 say ztnet_all picture "99999999.99"
  @ 19,41 say ztvat_all picture "99999999.99"
  @ 19,62 say ztbrut_all picture "99999999.99"

do case
  case zrabat_plus
    do skom with ltxt2 
  otherwise
    do skom with ltxt1 	
endcase

if znaz_64.and..not.empty(substr(tnaz,33))
  ltxt=stuff(space(80),1,12,"| cd Nazwy: ")
  ltxt=stuff(ltxt,79,1,"|")
  ltxt=stuff(ltxt,15,32,substr(tnaz,33))
  do skom with ltxt
endif

z1_tpopraw=.f.
do case
*  case chr(last)$"Dd"
*    z1_tpopraw=.t.
*    keyboard chr(205)
*    return 0
  case chr(last)$"Bb".and.zrabat_plus
    rabat_plus()
	keyboard chr(205)
  case last=13.and.tkormag
    z1_tpopraw=.t.
    ztow_lad()
    return 0
  case last=13.and..not.tkormag	
    niemagpoz()
	niemag_il()
	  tow_replac()
    commit
    keyboard chr(205)
	return 2
  case last=10
    ztow_lad()
    if kj_gkom(12," Uwaga! ","Usunac pozycje",alltrim(ztnaz)+ "  ?",.t.,5)
	  delete
	  pack
      go top
	  tplik_sum(".not.eof()")
	  go recno
	endif
	keyboard chr(205)
	return 2
  case last=27
    return 0
endcase

RETURN 1

*******************************************************************************
* Wydruk zawartosci pliku tow_buf z prezentacja wartosci w sposob widoczny    *
* rowniez przy aktywnym oknie wyboru pozycji z magazynu                       *
*******************************************************************************
FUNCTION T_FU_1(tryb,numer)
*@ 19,5 say "Razem NETTO:                 BRUTTO:                 VAT             " 
local lcolor:=setcolor()
go top
tplik_sum(".not.eof()")
set color to n/w
kj_okno(19,1,4,"     W A R T O ó è    D O K U M E N T U     ",2)
@ 20,5 say "Razem NETTO:"
@ 21,5 say "        VAT:"
@ 22,5 say "     BRUTTO:"
@ 20,18 say ztnet_all picture "99999999.99"
@ 21,18 say ztvat_all picture "99999999.99"
@ 22,18 say ztbrut_all picture "99999999.99"
setcolor(lcolor)
return 0
RETURN 1

*******************************************************************************
* Rysowanie ramek dla startowego tla dokumentu                                *
*******************************************************************************
FUNCTION T_FU_0(tryb,numer)
  return 0
RETURN 1

*******************************************************************************
* Rysowanie ramek dla startowego tla dokumentu                                *
*******************************************************************************
FUNCTION T_FU_8(tryb,numer)
local lm_okno:=.t.,lm_num:=val(zdg_magazyn),lm_txt:="",lm_klucz:=1
local last:=lastkey(),recno:=recno(),ltyt:=space(78),lnazkod:="",lnumpoz:=""
local m_num:=1,m_okno:=.t.,m_txt:="",m_klucz:=1,lrazem:="",lpozwart:=""
local ltxt2:="<Enter>-popraw  <Ctrl-Enter>-kasuj  <D>opisz  ra<B>at  <Esc>-koniec"
local lnet:=0,lvat:=0,lbrut:=0
local lrow:=row(),lcol:=col(),lcen:=0
z1_tpopraw=.f.
zdopisz=.f.
zpozpopraw=.f.
ztow_lad()
if zdtyp $ dok_brut_gr        &&Obliczane od wartosci BRUTTO
  lbrut=kj_round(til*kj_round(brutto(tcen,tstawka),2),2)
  lvat=kj_round(lbrut*tstawka/(100+tstawka),2)
  lnet=lbrut-lvat
  lcen=kj_round(brutto(tcen,tstawka),2)
else                          &&Obliczanie od wartoòci NETTO
  lnet=kj_round(til*kj_round(tcen,2),2)
  lvat=kj_round(lnet*tstawka/100,2)
  lbrut=lnet+lvat
  lcen=kj_round(tcen,2)
endif
@ 0,40 say "*NOWY*"
set color to n/w,w/n
if krabat_up.and..not.zkrabat=0
  @ 4,2 say "Rabat:       %"
  @ 4,9 say zkrabat picture "999.9"
endif
lrazem="Razem wartoòÜ dokumentu:    Netto  "+alltrim(str(ztnet_all,11,2))+"    Vat  "+alltrim(str(ztvat_all,11,2))+"    Brutto  "+alltrim(str(ztbrut_all,11,2))
lrazem=stuff(space(76),2,len(alltrim(lrazem)),alltrim(lrazem))
lpozwart="WartoòÜ pozycji ........    Netto  "+alltrim(str(lnet,11,2))+"    Vat  "+alltrim(str(lvat,11,2))+"    Brutto  "+alltrim(str(lbrut,11,2))
lpozwart=stuff(space(76),2,len(alltrim(lpozwart)),alltrim(lpozwart))

lnumpoz=str(recno(),3)
lnazkod="Pozycja "+lnumpoz+"   "+alltrim(ztnaz)+"   KTM: "+alltrim(ztkod)
ltyt=stuff(ltyt,2,len(alltrim(lnazkod)),alltrim(lnazkod))
kj_okno(20,1,3,ltyt,5)
@ 19,2 say lrazem
@ 21,2 say lpozwart
@ 22,3 say "Symbol SWW ............     "+tsymbol
do skom with ltxt2 
do case
  case chr(last)$"Dd"
    m_okno_tlo()
	zdopisz=.t.
    keyboard chr(33)
	return 0
**
  case last=13.and.numer=3
    set cursor on
	@ lrow,lcol get til picture mag_picture
	read
	set cursor off
      go top
	  tplik_sum(".not.eof()")
	  go recno	
    keyboard chr(205)
	return 2	
  case last=13.and.numer=5
    set cursor on
	@ lrow,lcol get lcen picture "9999999999.99"
	read
    if zdtyp $ dok_brut_gr        &&Obliczane od wartosci BRUTTO
      lcen=kj_round(netto(lcen,tstawka),2) 	
	endif	
	if.not.lastkey()=27
	  replace tcen with lcen
	endif
	set cursor off
      go top
	  tplik_sum(".not.eof()")
	  go recno	
    keyboard chr(205)
	return 2		
  case last=13.and.tkormag
    m_okno_tlo()
	zdopisz=.t.
	z1_tpopraw=.t.
    ztow_lad()
    keyboard chr(29)
	return 0
  case last=13.and..not.tkormag	
    m_okno_tlo()
	zdopisz=.t.
	niemagpoz()
	niemag_il()
	  tow_replac()
    commit
    keyboard chr(205)
	return 2
  case last=10
    ztow_lad()
    if kj_gkom(12," Uwaga! ","Usunac pozycje",alltrim(ztnaz)+ "  ?",.t.,5)
	  delete
	  pack
      go top
	  tplik_sum(".not.eof()")
	  go recno
	endif
	keyboard chr(205)
	return 2
  case chr(last)$"Bb".and.zdtyp$sprzedaz_gr.and..not.zdznak=zkordok_znak
    lrabat=zdrabat
	kj_rabat(zdrabat)
	keyboard chr(205)
	return 2	
**

  case last=27
    return 0
endcase
RETURN 1

*******************************************************************************
* Wydruk danych kontrahenta w formacie dostosowanym do dokumentu              *
*******************************************************************************
FUNCTION KON_SAY()
local lcol:=0,lcolor:=setcolor()
set color to n/w,w/n
@ 1,1 clear to 4,78
@ 1,2 say "K O N T R A H E N T" 
@ 1,58 say "Nip:"
@ 1,63 say zknip
@ 2,2 say substr(zknaz1,1,30)
lcol=10+len(alltrim(zknaz1))
@ 2,lcol say substr(zknaz2,1,30)
@ 3,2 say zkulica 
lcol=10+len(alltrim(zkulica))
@ 3,lcol say zkkod
lcol=lcol+2+len(alltrim(zkkod))
@ 3,lcol say substr(zkmiasto,1,30)
setcolor(lcolor)
RETURN nil


*******************************************************************************
* Prezentacja danych wprowadzonych funkcja d_end_get() w formacie dokumentu   *
*******************************************************************************
FUNCTION END_SAY()
local lcolor:=setcolor()
@ 21,1 say " Data wystawienia:            ≥                            ≥                  "
@ 22,1 say " Data sprzedaæy:              ≥ Przyj©to kwot©:            ≥                  "
*@ 23,2 say "                             ≥                            ≥                  "
@ 23,1 say replicate(chr(176),78)

if zdtyp$dowod_gr
  @ 21,20 say zddatdow
else
  @ 21,20 say zddatdok
endif  
@ 22,20 say zddatsp
@ 21,62 say "Termin platnoòci"
do case
  case zdsposzap="G"
    @ 21,33 say "Pàatne got¢wka    "
  case zdsposzap="P"
    @ 21,33 say "Pàatne przelewem  "	
  case zdsposzap="O"
    @ 21,33 say "Op¢´niona pàatnoòÜ"
  case zdsposzap="K"
    @ 21,33 say "Pàatne kompensat• "	
  case zdsposzap="R"
    @ 21,33 say "Redukcja zadàuæe‰ "		
endcase
if zdsposzap$"PO"
  @ 22,66 say zdtermin
endif
@ 22,48 say ztbrut_all-zdniedop picture "9999999.99" 
if.not.empty(zkuzyt_txt_last).and..not.empty(zkuzyt_last)
  @ 0,60 say space(19)
  @ 0,61 say zkuzyt_last
endif
setcolor(lcolor)
RETURN nil


*******************************************************************************
* Zakonczenie dokumentu                                                       *
*******************************************************************************
FUNCTION DOK_END()
local lcolor:=setcolor(),ek
save screen to ek
if zdtyp$bo_gr
  keyboard chr(205)
  vmenu_end=.t.
  return  
endif

if zdtyp$dowodwew_gr
  dowwew_end()
  setcolor(lcolor)
  keyboard chr(205)
  vmenu_end=.t.
  return  
endif

if zdtyp$importsad_gr
  dsad_end()
  setcolor(lcolor)
  keyboard chr(205)
  vmenu_end=.t.
  return
endif
*if zdtyp$eksportsad_gr.or.zdtyp$import_gr
*  dewiz_end()
*  setcolor(lcolor)
*  keyboard chr(205)
*  vmenu_end=.t.
*  return  
*endif
if zdznak$zwymian_znak
  wymian_end()
  setcolor(lcolor)
  keyboard chr(205)
  vmenu_end=.t.
  return  
endif
d_end_tlo()
d_end_get()
restore screen from ek
setcolor(lcolor)
keyboard chr(205)
vmenu_end=.t.
RETURN nil






*******************************************************************************
* Tlo wykorzystywane do definiowania daty, rodzaju platnosci, wystawcy itp.   *
*******************************************************************************
FUNCTION D_END_TLO()
local lcolor:=setcolor()
local ltytul:="      ZAKO„CZENIE   DOKUMENTU       "  
@ 1,43,23,78 box chr(176) 
kj_okno(2,44,21,ltytul,1)

set color to n/w,w/n
@ 4,46 say"Odebraà:            "
@ 6,46 say"Wystawià:           "
@ 8,46 say "Data wystawienia ..."
if.not.zdtyp$proform_gr
  @ 10,46 say "Data sprzedaæy ....."
endif
@ 12,46 say "Spos¢b zapàaty ....."
    do case
      case zdsposzap="G"
        @ 12,66 say "Got¢wka"
	  case zdsposzap="P"
		@ 12,66 say "Przelew"
      case zdsposzap="O"
		@ 12,66 say "Op¢´niona pàat."
      case zdsposzap="K"
		if zkarta
		  @ 12,66 say "Karta pàatnicza"
		else
		  @ 12,66 say "Kompensata     "
		endif  
      case zdsposzap="R"
		@ 12,66 say "Redukcja zadà."
    endcase  
@ 14,46 say"Termin platnoòci ..."

if.not.kasa_glowna  
  @ 16,46 say "Przyj©to kwot© ...."
endif  
if zdtyp $ zakup_gr
  @ 4,46 say"                    "
  @ 6,46 say"                    "
  if.not.kasa_glowna  
    @ 16,46 say "Zapàacono kwot© ..."
  endif	
endif
if zdtyp$defnum_gr
  @ 18,46 say "Dokument nr :"
endif 
if numer_zam_op.and.zdtyp$sprzedaz_gr
  @ 19,46 say "Nr zam¢wienia .."
endif
if zdtyp$eksport_gr
  @ 21,46 say "Waluta ........."
  @ 22,46 say "Kurs ..........."
endif
setcolor(lcolor)
RETURN nil

*******************************************************************************
* Wprowadzenie informacji konczacych dokument: daty, sposobu platnosci itp.   *
*******************************************************************************
FUNCTION D_END_GET()
local lcolor:=setcolor()
buf_use()
set filter to
go top
tplik_sum(".not.eof()")
zkwota=ztbrut_all
set confirm off
if zdtyp $ sprzedaz_gr
 * zdodebral=zkodebral
else
  zdodebral=space(22)
endif
set color to
if zdsposzap$"PO"
  zkwota=0
endif
if zdznak$zkordok_znak
  zddatdok=date()
endif
set cursor on
if zdtyp $ sprzedaz_gr.and..not.zdtyp $ kasa_gr
  @ 4,56 get zdodebral picture "@S22" when .not.zdtyp$zakup_gr
  @ 6,56 get zwystawil  picture "@S22" when wystawil(.f.)
endif  
if zdtyp$dowod_gr
  @ 8,66 get zddatdow
else
  @ 8,66 get zddatdok
endif
if.not.zdtyp$proform_gr
  @ 10,66 get zddatsp
endif
if.not.zdtyp$bezkontrah_gr
  @ 12,66 get zdsposzap when sposzap_menu()
else
  @ 12,66 get zdsposzap when sposzap1_menu()
endif  
@ 14,66 get zdtermin when zdsposzap$"OP"
if.not.kasa_glowna
*  @ 16,66 get zkwota picture "99999999.99" when.not.zdsposzap$"K"
  @ 16,66 get zkwota picture "99999999.99"
endif  
if zdtyp$defnum_gr
  @ 18,60 get zdndok
endif
if numer_zam_op.and..not.zdtyp$proform_gr.and.zdtyp$sprzedaz_gr
  @ 19,63 get zdnumer_zam  
endif
if zdtyp$eksport_gr
  @ 21,63 get zdwaluta
  @ 22,63 get zdkurs picture "999.9999"
  zprzelicznik=1
  
endif
read
if.not. zdtyp$dowod_gr
 zddatdow=zddatdok
endif
if zdtyp$eksport_gr
  tow_kurs()
endif
zdniedop=ztbrut_all-zkwota

if zdsposzap="G".and..not.kj_round(zdniedop,2)=0
  zdsposzap="O"
  zdtermin=zddatdow+zopoznienie  
  @ 14,66 get zdtermin when s_kom("Kontrahent nie wpàacià peànej kwoty. Wpisz termin rozliczenia.")
  read
endif

if zdtyp$opisdok_gr.and.zdtyp$eksport_ue_gr
  zdopis1=zue_opis1
  zdopis2=zue_opis2
  zdopis3=zue_opis3
endif

if zdtyp$opisdok_gr.and.zopis_dtryb=1
  kj_okno(20,0,4, "  Opis dokumentu                                                                ",5)
  set cursor on
  if .not.zdznak$zkordok_znak
    @ 21,2 get zdopis1 picture "@S76"
  endif	
  @ 22,2 get zdopis2 picture "@S76"
  @ 23,2 get zdopis3 picture "@S76"
  read
endif
set cursor off
setcolor(lcolor)
set confirm on 
RETURN nil


FUNCTION DOWWEW_END()
local lcolor:=setcolor()
local ltytul:="      ZAKO„CZENIE   DOKUMENTU       "  
@ 1,43,8,78 box chr(176) 
kj_okno(2,44,6,ltytul,1)
@ 4,46 say "Data dokumentu ...."
set cursor on
@ 4,66 get zddatdok
read
set cursor off
RETURN

*******************************************************************************
* pdefin=.t. - mozliwosc definiowania - wywolanie z poziomu PARAMETROW        *
* =.f. - tylko wybor ze spisu - wywolanie z poziomu edycji dokumentu          *
*******************************************************************************
FUNCTION WYSTAWIL(pdefin)
local lcolor:=setcolor(),ek,select:=select()
local ltyt:=  "       WYBIERZ  SPRZEDAWCE        "  
local lexlusive:=.f.,lnowy:=.f.
save screen to ek
if pdefin
  kj_okno(0,0,10, "  L  E  G  O  S                                                                 ",2)  
  g_tlo()
  ltyt:=  "     ZDEFINIUJ  SPRZEDAWCOW       "  
  lnowy=.f.
*  dok_tlo(lnowy)
*  tow_say(.t.,0)
*  d_end_tlo()
**  close_all("SH")
else
  keyboard chr(295)
endif
kj_okno(16,45,7,ltyt,1)
dok_default()
if pdefin
  lexlusive=.t.
else
  lexlusive=.f.
endif
select &wystaw_sel
if.not.kj_use("wystawil",lexlusive,3)
  zwystawil=space(30)
  return .f.
endif

set color to n/w,w/n
set filter to sp_jest=.t.
go top
go bottom
v_lastnum=sp_num
locate for sp_num=zprac_wyst
if.not.found()
  go top
endif
keyboard chr(205)
if pdefin 
  dbedit(17,46,22,77,"sp_name","W_FUdef","","")
else
  dbedit(17,46,22,77,"sp_name","W_FU","","")
endif  
select &wystaw_sel
use
restore screen from ek
if.not.pdefin
 * @ 6,56 say substr(zwystawil,1,22)
 * inkey(.5)
else
  close_all("SH")
endif  
setcolor(lcolor)
select &select
set cursor on
RETURN .f.

*******************************************************************************
* Funkcja uzytkownika przy wywolaniu WYSTAWIL z parametrem .f.                *
*******************************************************************************
FUNCTION W_FU()
local last:=lastkey(),recno:=recno()
do case
  case last=27
    return 0
  case last=13
   * zprac_wyst=sp_num
	zwystawil=sp_name
	zdwystawil=sp_name
    return 0	      	
  case bof()
    return 0
  case sp_num=v_lastnum.and.last=24
    *inkey(0.1)
	keyboard chr(205)
	*if lastkey()=24
	if last()=24
      return 0	
	endif  
endcase
RETURN 1

*******************************************************************************
* Funkcja uzytkownika przy wywolaniu WYSTAWIL z parametrem .t.                *
*******************************************************************************
FUNCTION W_FUdef()
local last:=lastkey(),recno:=recno(),lwystawil:=space(30),ek
do skom with "<D>opisz   <P>opraw    <K>asuj    przy<W>roc   <Esc> - rezygnacja"
save screen to ek
do case
  case last=27
    return 0
  case chr(last)$"Dd"
    @ 22,2 say "Nowy ....."
	set cursor on
	@ 22,12 get lwystawil
	read
	if.not.lastkey()=27
	  append blank
	  replace sp_name with lwystawil,sp_num with recno(),sp_jest with .t.
	endif
	set cursor off
    if.not.lastkey()=27
	  keyboard chr(68)
    else
	  keyboard chr(205)
	endif  
	go top
	restore screen from ek
	return 2	      	
  case chr(last)$"Pp"
    @ 22,2 say "Popraw ..."
	set cursor on
	@ 22,12 get sp_name
	read
	set cursor off
	restore screen from ek
    return 2	      
  case chr(last)$"Kk"
    if kj_gkom(12," Uwaga! ","Usunac z listy sprzedawcow",alltrim(sp_name),.t.,5)
	  replace sp_jest with .f.
	endif
	go top
	return 2
  case chr(last)$"Ww"
    set filter to
	go top
	do while.not.eof()
	  replace sp_jest with .t.
	  skip
	enddo
	set filter to sp_jest=.t.
	go top
	keyboard chr(205)
	return 2
endcase
RETURN 1

*******************************************************************************
* Wybor jednego z czterech sposobow zaplaty za dokument                       *
*******************************************************************************
FUNCTION SPOSZAP_MENU()
local ltnaz[5],ltlit[5],ltopis[5],lbelka:="   WYBIERZ   ",lpoz:=1,ek
local lcolor:=setcolor()
ltnaz[1]:="Got¢wka        "
ltnaz[2]:="Przelew        "
if zkarta
  ltnaz[3]:="Karta pàatnicza"
else
  ltnaz[3]:="Kompensata     "
endif  
ltnaz[4]:="Op¢´niona pàat."
ltnaz[5]:="Red. zadàuæenia"
ltlit[1]:="G "
ltlit[2]:="P "
ltlit[3]:="K "
ltlit[4]:="O "
ltlit[5]:="R "
ltopis[1]:="Pàatne got¢wk• w dniu wystawienia dokumentu"
ltopis[2]:="Pàatne przelewem na konto bankowe"
if zkarta
  ltopis[3]:="Pàatne kart• - terminal"
else
  ltopis[3]:="Pàatne kompensat• - towar za towar"
endif  
ltopis[4]:="Pàatne got¢wk• z op¢´nionym terminem pàatnoòci"
ltopis[5]:="Redukcja zadàuæenia"

save screen to ek
if lastkey()=3
  restore screen from ek
  return .f.
endif
if zdtyp$bezkontrah_gr
  zdsposzap="G"
  zkwota=ztbrut_all
  return .t.
endif
do case
  case zdsposzap="G"
    lpoz=-1
  case zdsposzap="P"
    lpoz=-2
  case zdsposzap="K"
    lpoz=-3					
  case zdsposzap="O"
    lpoz=-4
  case zdsposzap="R"
    lpoz=-5			

endcase
  lpoz=men_pion(11,62,5,lbelka,ltnaz,ltlit,ltopis,lpoz)
do case 
  case lastkey()=13
    do case
      case lpoz=1
        zdsposzap="G"
        @ 12,66 say "Got¢wka"
	  case lpoz=2
        zdsposzap="P"
		@ 12,66 say "Przelew"
      case lpoz=3
        zdsposzap="K"			
		if zkarta
		  @ 12,66 say "Karta pàatnicza"
		else
		  @ 12,66 say "Kompensata     "
		endif  
      case lpoz=4
        zdsposzap="O"
		@ 12,66 say "Op¢´niona pàat."
      case lpoz=5
        zdsposzap="R"			
		@ 12,66 say "Red. zadàuæenia"

    endcase  
    keyboard chr(13)
  case lastkey()=5
     keyboard chr(5)
  case lastkey()=24
     keyboard chr(24)	 
endcase
set cursor on
restore screen from ek
if lastkey()=13
  set color to n/w,w/n
    do case
      case lpoz=1
        @ 12,66 say "Got¢wka"
	  case lpoz=2
		@ 12,66 say "Przelew"
      case lpoz=3
		if zkarta
		  @ 12,66 say "Karta pàatnicza"
		else
		  @ 12,66 say "Kompensata     "
		endif  
      case lpoz=4
		@ 12,66 say "Op¢´niona pàat."
      case lpoz=5
		@ 12,66 say "Red. zadàuæenia"
    endcase  
    if zdsposzap$"PO"
      zkwota=0
    else  
      zkwota=ztbrut_all
    endif  
    if zdsposzap$"OP"
      if zdtyp$dowod_gr
	    zdtermin=zddatdow+zopoznienie
	  else
	    zdtermin=zddatdok+zopoznienie
	  endif	
      if zdznak=zkordok_znak
	    zdtermin=date()+zopoznienie
	  endif	  
	endif
endif
setcolor(lcolor)
RETURN .T.


FUNCTION SPOSZAP1_MENU()
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="   WYBIERZ   ",lpoz:=1,ek
local lcolor:=setcolor()
ltnaz[1]:="Got¢wka        "
if zkarta
  ltnaz[2]:="Karta pàatnicza"
else
  ltnaz[2]:="Kompensata     "  
endif
ltlit[1]:="G "
ltlit[2]:="K "
ltopis[1]:="Pàatne got¢wk• w dniu wystawienia dokumentu"
if zkarta
  ltopis[2]:="Pàatne kart• - terminal"
else
  ltopis[2]:="Pàatne kompensat• - towar za towar"
endif  

save screen to ek
if lastkey()=3
  restore screen from ek
  return .f.
 endif
*if zdtyp$bezkontrah_gr
*  zdsposzap="G"
*  zkwota=ztbrut_all
*  return .t.
*endif
do case
  case zdsposzap="G"
    lpoz=-1
  case zdsposzap="K"
    lpoz=-2					
endcase
  lpoz=men_pion(11,62,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
do case 
  case lastkey()=13
    do case
      case lpoz=1
        zdsposzap="G"
        @ 12,66 say "Got¢wka"
	  case lpoz=2
        zdsposzap="K"			
		if zkarta
		  @ 12,66 say "Karta pàatnicza"
		else
		  @ 12,66 say "Kompensata     "
		endif  
    endcase  
    keyboard chr(13)
  case lastkey()=5
     keyboard chr(5)
  case lastkey()=24
     keyboard chr(24)	 
endcase
set cursor on
restore screen from ek
if lastkey()=13
  set color to n/w,w/n
    do case
      case lpoz=1
        @ 12,66 say "Got¢wka"
      case lpoz=2
		if zkarta
		  @ 12,66 say "Karta pàatnicza"
		else
		  @ 12,66 say "Kompensata     "
		endif  
    endcase  
    if zdsposzap$"PO"
      zkwota=0
    else  
      zkwota=ztbrut_all
    endif  
    if zdsposzap$"OP"
      if zdtyp$dowod_gr
	    zdtermin=zddatdow+zopoznienie
	  else
	    zdtermin=zddatdok+zopoznienie
	  endif	
      if zdznak=zkordok_znak
	    zdtermin=date()+zopoznienie
	  endif	  
	endif
endif
setcolor(lcolor)
RETURN .T.


*******************************************************************************
* Menu pojawiajace sie w trakcie definiwania towarow do sprzedazy (zakupu)    *
* Umozliwia przerwanie wyboru pozycji z magazynu i dokonanie poprawek w opisie*
* kontrahenta lub w wybranych do dokumentu pozycjach                          *
*******************************************************************************
FUNCTION DOK_MENU(ppoz)
local lbelka:="∞ Dalej ∞ Popraw ∞ Rabat ∞",lbelka1:="                W Y B I E R Z                "
local lliter:="  D       P        R      "
local lpoz:=1,ltopis[5]
ltopis[1]:="Wprowadzenie informacji konczacych tworzenie dokumentu."
ltopis[2]:="Przejscie do trybu poprawiania wybranych z magazynu pozycji. "
ltopis[3]:="Rabat jednakowy dla wszystkich pozycji."
tone(700,0.5)
lpoz=menu_poziom(0,0,3,lbelka,lliter,ltopis,lpoz,.f.,.f.)  
RETURN lpoz

*******************************************************************************
* Menu konczace tworzenie dokumentu.                                          *
*******************************************************************************
FUNCTION END_MENU(ppoz)
local lbelka:= "∞ Drukuj ∞ Zapamietaj ∞ Przegladaj ∞ pOpraw ∞ Rabat ∞ Anuluj ∞"
local lbelka1:="                        W Y B I E R Z                         "
local lliter:="  D        Z            P             O       R       A       "
local lpoz:=ppoz,ltopis[6]
ltopis[1]:="Zapamietanie i wydruk dokumentu na drukarke"
ltopis[2]:="Zapamietanie i wydruk dokumentu do pliku z pominieciem drukarki"
ltopis[3]:="Przejscie do trybu poprawiania dokumentu"
ltopis[4]:="Przegladanie wybranych do dokumentu pozycji"
ltopis[5]:="Udzielenie rabatu jednakowego dla wszystkich sprzedawanych pozycji"
ltopis[6]:="Rezygnacja z aktualnie redagowanego dokumentu"
tone(700,0.3)
@ 23,1 say replicate(chr(176),78)
lpoz=menu_poziom(0,0,6,lbelka,lliter,ltopis,lpoz,.f.,.f.) 
RETURN lpoz


*******************************************************************************
* Menu pojawiajace sie na zakonczenie definiwania dokumentu.                  *
* Umozliwia dokonanie poprawek w opisie kontrahenta, w wybranych do dokumentu *
* pozycjach oraz w zakonczeniu dokumentu                                      *
*******************************************************************************
FUNCTION END_POPRAW_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Kontrahenta "
ltnaz[2]:=" Pozycje     "
ltnaz[3]:=" Zako‰czenie "
ltlit[1]:=" K "
ltlit[2]:=" P "
ltlit[3]:=" Z "
ltopis[1]:="Popraw dane kontrahenta lub zmien na innego"
ltopis[2]:="Popraw wybrane do dokumentu pozycje"
ltopis[3]:="Popraw daty, sposob zaplaty, przyjeta kwote, wystawce i odbierce dokumentu"
@ 2,34 clear to 5,50
  lpoz=men_pion(1,35,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION WZ_DOK_MENU(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Dokument bieæ•cy "
ltnaz[2]:=" Zaznaczona grupa "
ltlit[1]:=" D "
ltlit[2]:=" Z "
ltopis[1]:="Utw¢rz faktur© na podstawie wyr¢ænionego dokumentu "
ltopis[2]:="Utw¢rz faktur© zbiorcz• na podstawie zaznaczonych dokument¢w"
  lpoz=men_pion(12,46,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz




*******************************************************************************
* Menu pojawiajace sie po wciòni©ciu Entera na dokumencie  .(z poprawianiem)  *
*******************************************************************************
FUNCTION ENTER_PDOK_MENU(ppoz)
local ltnaz[7],ltlit[7],ltopis[7],lbelka:="",lpoz:=ppoz,lile:=6
ltnaz[1]:=" Prezentacja "
ltnaz[2]:=" Wydruk      "
ltnaz[3]:=" Anulowanie  "
ltnaz[4]:=" Korekta     "
ltnaz[5]:=" Dow¢d-dokum."
ltnaz[6]:=" pOprawianie "
ltnaz[7]:="             "
ltlit[1]:=" P"
ltlit[2]:=" W"
ltlit[3]:=" A"
ltlit[4]:=" K" 
ltlit[5]:=" D" 
ltlit[6]:="  O"
ltlit[7]:="   "
ltopis[1]:="Szczeg¢àowa prezentacja wybranego dokumentu"
ltopis[2]:="Wydruk dokumentu"
ltopis[3]:="Anulowanie wskazanego kursorem dokumentu"
ltopis[4]:="Tworzenie dokumentu koryguj•cego do dokumentu wskazanego kursorem"
ltopis[5]:="Rejestracja dokumentu sprzedaæy na podstawie dowodu wydania WZ"
ltopis[6]:="Poprawianie wskazanego kursorem dokumentu"
ltopis[7]:=""
if zdokwzor_op
  ltnaz[1]=" Prezen./Wz¢r"
  ltopis[1]:="Prezentacja wybranego dokumentu z moæliwoòci• utworzenia nowego dok. na wz¢r."
endif
if.not.zanul_up
  ltnaz[3]:="-Anulowanie  "
  ltopis[3]:="Brak uprawnie‰ do anulowania  dokument¢w"
endif
if.not.(zdtyp$dokorekty_gr.and..not.zdznak$zkordok_znak)
  ltnaz[4]="-Korekta     "
  ltopis[4]="Dokument nie podlega korekcie"
endif
if dtyp $ zakup_gr
*  ltnaz[4]:="+ Nota koryg. "
**   ltnaz[4]:="-Korekta    "
*  ltlit[4]:="  N"
*  ltopis[4]:="Tworzenie noty koryguj•cej do dokumentu wskazanego kursorem"
  ltopis[5]:="Rejestracja dokumentu zakupu na podstawie dowodu przyj©cia  PZ"
endif
if.not.empty(dndok)
  if substr(dster,1,1)=="/"
    ltnaz[5]:=" Dokumenty WZ"
    ltopis[5]:="Wykaz dokumenyt¢w WZ tworz•cych faktur©. "  
  else
    ltnaz[5]:="-Dow¢d-dokum."
    ltopis[5]:="Funkcja dost©pna dla wykazu dowod¢w dostaw i dowod¢w wydania  "
  endif	
endif
if zdznak$zkordok_znak
  ltnaz[4]:="-Korekta     "
endif
  if.not.zdanul
    @ 6,33,lile+9,49 box chr(176)
    lpoz=men_pion(7,34,lile,lbelka,ltnaz,ltlit,ltopis,lpoz)
  else
    ltnaz[3]:=" Przywr¢Ü dok"
	ltlit[3]:=" P"
    ltopis[3]:="Przywr¢cenie dokumentu anulowanego"
	@ 6,33,12,49 box chr(176)
    lpoz=men_pion(7,34,3,lbelka,ltnaz,ltlit,ltopis,lpoz)  
  endif	
RETURN lpoz

*******************************************************************************
* Menu pojawiajace sie po wciòni©ciu Entera na dokumencie  (bez poprawiania)  *
*******************************************************************************
FUNCTION ENTER_DOK_MENU(ppoz)
local ltnaz[5],ltlit[5],ltopis[5],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Prezentacja "
ltnaz[2]:=" Wydruk      "
ltnaz[3]:=" Anulowanie  "
ltnaz[4]:=" Korekta     "
ltnaz[5]:=" Dow¢d-dokum."
ltlit[1]:=" P"
ltlit[2]:=" W"
ltlit[3]:=" A"
ltlit[4]:=" K" 
ltlit[5]:=" D" 
ltopis[1]:="Szczeg¢àowa prezentacja wybranego dokumentu"
ltopis[2]:="Wydruk dokumentu"
ltopis[3]:="Anulowanie wskazanego kursorem dokumentu"
ltopis[4]:="Tworzenie dokumentu koryguj•cego do dokumentu wskazanego kursorem"
ltopis[5]:="Rejestracja dokumentu sprzedaæy na podstawie dowodu wydania WZ"
if.not.zanul_up
  ltnaz[3]:="-Anulowanie  "
  ltopis[3]:="Brak uprawnie‰ do anulowania  dokument¢w"
endif
if.not.(zdtyp$dokorekty_gr.and..not.zdznak$zkordok_znak)
  ltnaz[4]="-Korekta     "
  ltnaz[4]="Dokument nie podlega korekcie"
endif
if dtyp $ zakup_gr
*  ltnaz[4]:=" Nota koryg. "
*  ltlit[4]:=" N"
*  ltopis[4]:="Tworzenie noty koryguj•cej do dokumentu wskazanego kursorem"
  ltopis[5]:="Rejestracja dokumentu zakupu na podstawie dowodu przyj©cia  PZ"
endif
if.not.empty(dndok)
  if substr(dster,1,1)=="/"
    ltnaz[5]:=" Dokumenty WZ"
    ltopis[5]:="Wykaz dokumenyt¢w WZ tworz•cych faktur©. "  
  else
    ltnaz[5]:="-Dow¢d-dokum."
    ltopis[5]:="Funkcja dost©pna dla wykazu dowod¢w dostaw i dowod¢w wydania  "
  endif	
endif
  @ 7,33,15,49 box chr(176)
  lpoz=men_pion(8,34,5,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz







FUNCTION ZAP_DOK(pwzor)
local lsukces:=.f.,ltil:=0,lwzor:=pwzor
local ldarchiwum:=zdarchiwum
if zdtyp$kasa_gr
  zdarchiwum:=.f.    &&poniewaæ dokumenty kasowe przechowywne s• w bieæ•cym katalogu
endif
close_all("SH")
do while .t.
*  dok_default()
  *set default to shset
  set default to &set_serwer
  select &buf_sel
  if.not.used()
    if.not.kj_use("towbuf",.t.,3)
      exit
    else
	  set index to towbuf
	endif
  endif
  if zdznak $ zkordok_znak
    reduk_buf()
	if kj_pusty()
      kj_tkom(12," Uwaga! ","Faktura koryguj•ca bà©dnie wystawiona.","Brak zmian przed i po korekciey.","Usu‰ problemy i ponow pr¢b©!",5)	  
*
        close_all("SH")
        *dok_default()
		*set default to shset
		set default to &set_serwer
        select &buf_sel
		if.not.used()
          kj_use("towbuf",.t.,3)
		  set index to towbuf
        endif
		dok_default()
        RETURN .f.
*

	endif
  endif  
***  
  if.not.dok_use()
    exit
  endif
*** 
 * dok_default()
 * select &dok_sel
 * if.not.used()
 *   if kj_use("dokum",.f.,3)
 *     set index to dok_ident,dok_num,dow_num
 *   else
 *     exit
 *   endif  
 * endif
  if.not.nowy_numdok(lwzor)
    exit
  endif
  dok_default()
  if zopis_poz.and.file("topis.dbf")
    select &topis_sel
	if kj_use("topis",.f.,3)
	  set index to topis
	  *skip
	  *if.not.eof()
	    do while.t.
          go top
	      if empty(op_tndow)
            if reclock(5)      
              replace op_tndow with zdndow
              unlock
	        endif	    
	      else
	        exit
	      endif
	    enddo
	  *endif
	  close
    endif
  endif
  *dok_licz(zdndow)  
**
  select &buf_sel
  go top
  tplik_sum(".not.eof()")  
  zdniedop=ztbrut_all-zkwota
	    if kasa_glowna.and.zdtyp$kasadok_gr.and.zdsposzap$"GKR"
		  zdniedop=ztbrut_all 
		endif  
**
  select &dok_sel
  if kj_append(3)
    dok_replac()  
    unlock
  else
    exit
  endif  
  select &tow_sel
  if.not.tow_use(.f.)
    exit
  endif
  select &buf_sel
	if zdtyp$import_gr.or.zdtyp$eksport_gr
	  go top
	  do while.not.eof()
	    replace tcen_dewiz with tcen
		replace tcen with kj_round(tcen*zdkurs/zprzelicznik,2)
		skip
	  enddo	
	endif
	if.not.zdtyp$kormag_gr  &&2005.01.17
	  go top
	  do while.not.eof()
	    replace tkormag with .f.
		skip
	  enddo		
	endif
	if lwzor.and.zwnew_typ$kormag_gr.and..not.zwwzor_typ$kormag_gr &&2005.01.17
	  go top
	  do while.not.eof()
	    replace tkormag with .t.
		skip
	  enddo		
	endif
  go top
  do while.not.eof()
    ztow_lad()
*	if zdtyp $ zakup_gr
*	  ztnum=tnum_new()
*	endif  

	select &tow_sel
    if zsiec
      if kj_append(3)
	    tow_replac()

*Modyfikacja 24_10_2002  usuni©cie trzech wierszy
        *if.not.zdtyp$kormag_gr
		*  replace tkormag with .f.
		*endif
*		
        unlock
	  else
        kj_tkom(12," Uwaga! ","System wykryà problem w dost©pie do baz danych.","Operacj© zapisu przerwano - dokument nie b©dzie zapami©tany.","Usu‰ problemy i ponow pr¢b©!",5)
        close_all("SH")
        *dok_default()
		*set default to shset
		set default to &set_serwer
        select &buf_sel
		if.not.used()
          kj_use("towbuf",.t.,3)
		  set index to towbuf
        endif
		dok_default()
        RETURN lsukces	  
	   endif	
	else
	  append blank
	  tow_replac()
        if.not.zdtyp$kormag_gr
		  replace tkormag with .f.
		endif
	endif
    commit
	select &buf_sel
	skip
  enddo	
  lsukces=.t.
  exit
enddo
if.not.lsukces
  kj_tkom(12," Uwaga! ","System wykryà problemy w dost©pie do baz danych.","Operacj© zapisu przerwano - dokument nie b©dzie zapami©tany.","Usu‰ problemy i ponow pr¢b©!",5)
endif  
set default to &(zk_serwer+"KONTRAH")
select &kon_sel
if kon_use()
  set order to 3
  seek zdkontrah
  if found()
		    if zsiec
	          if reclock(5)      
	            replace kodebral with  zdodebral 
		        unlock
	            lzapisano=.t.
	          endif	
	        else
	            replace kodebral with  zdodebral 			
	        endif			  
  endif
endif



close_all("SH")
*dok_default()
*set default to shset
set default to &set_serwer
select &buf_sel
if.not.used()
  if kj_use("towbuf",.t.,3)
    set index to towbuf
    if druk_fiskalna.and.zdtyp $ fiskal_gr
      if kj_gkom(12," Uwaga!","","WydrukowaÜ paragon fiskalny ?",.t.,5)
	    do fis with fis_com 
	  endif	
    endif  
  else
    lsukces=.f.
  endif  
endif
close_all("SH")
if zdtyp$kasa_gr.and..not.empty(zdnzam)
  zdarchiwum=ldarchiwum
  kas_rozlicz(zdnzam,0)
endif


RETURN lsukces



FUNCTION DOKDEF_REPLAC()
replace grupa_dok with zgrupa_dok,typ_dok with ztyp_dok,znak_dok with zznak_dok
replace symbol_dok with zsymbol_dok,naz_dok with znaz_dok,tyt_dok with ztyt_dok
replace laman_dok with zlaman_dok,magaz_dok with zmagaz_dok,mg_dok with zmg_dok
replace mp_dok with zmp_dok,walut_dok with zwalut_dok,opis_dok with zopis_dok
replace opis1_dok with zopis1_dok,opis2_dok with zopis2_dok,opis3_dok with zopis3_dok
if znew_1
  replace ukryj with zukryj
endif
RETURN

FUNCTION DOK_REPLAC()
if ztyp_dok$dowod_gr
 * zddatdok=ctod("")
endif
if.not.zdznak$zkordok_znak         &&Dopisano dn 25.02.2004
  if zdtyp$bezkontrah_gr
    zdnskrot=space(15)
  else
    zdnskrot=substr(zknaz1,1,15)
  endif
endif	
zdkontrah=zknum
zdniedop=ztbrut_all-zkwota
*
replace dgrup with zdgrup
replace dtyp with zdtyp
replace dznak with zdznak
*replace didentyfik with zdidentyfik
replace dsymbol with zdsymbol
replace dndow with zdndow
replace dndok with zdndok
replace dnzam with zdnzam
replace ddatdow with zddatdow
replace ddatdok with zddatdok
replace dtermin with zdtermin
replace dkordat with zdkordat
replace dkordok with zdkordok
replace dkontrah with zdkontrah
replace dnskrot with zdnskrot
replace dniedop with zdniedop
replace dsposzap with zdsposzap
replace drabat with zdrabat
replace dkonto with zdkonto
replace dg_magazyn with zdg_magazyn
replace dp_magazyn with zdp_magazyn
replace dkormag_ok with zdkormag_ok
*replace dwystawil with zdwystawil
replace dwystawil with zwystawil
replace dodebral with zdodebral
replace dakwizytor with zdakwizytor
replace dksiegowy with zdksiegowy
replace ddatsp with zddatsp
replace ddatzal with zddatzal
replace ddatsad with zddatsad
replace ddatgranic with zddatgranic
replace dster with zdster
replace d1_lamany with zd1_lamany
replace dwaluta with zdwaluta
replace dkurs with zdkurs
replace danul with zdanul
replace dopis1 with zdopis1
replace dopis2 with zdopis2
replace dopis3 with zdopis3
replace dpom with zdpom
if numer_zam_op
  replace dpom with stuff(dpom,1,15,zdnumer_zam)
endif
if zdtyp$ksiega_gr
  ks_replac()
endif
RETURN nil

FUNCTION KOR_MAG(panul)
local lmcen_m,ltcen,ltil:=0,lzapisano:=.f.,lsukces:=.t.,ltecen:=0,ltmindex
local lanul:=panul
if zdtyp$przes_gr.and.zdtyp$zakup_gr
  mag_use(zknum)
  set order to 4
else
  mag_dladokum()
endif  
dok_default()
if.not.tow_use(.f.)
  return .f.
endif
seek zdndow
do while alltrim(tndow)==alltrim(zdndow)
  ztow_lad()
  kor_poz(lanul)
  skip
enddo
close
if produkcja.and.zprod_mag=1.and.zdtyp$zakup_gr
  wyr_wycen()
  select &wyrob_sel
  close
endif
select &pmag_sel
if used()
  close
endif  
select &gmag_sel
close
RETURN lsukces

FUNCTION KOR_POZ(panul)
local select:=select()
if ztkormag
  if panul
    ltil=-1*ztil
  else
    ltil=ztil
  endif
  ltcen=ztcen
  ltmindex=ztmindex
  if.not.ztwyroznik $ znie_mag
    lzapisano=.f.
	select &gmag_sel
*	if empty(zmtakisam)            &&modyfikacja 18.09.2003
	  seek ztmindex
*	else
*      zmtakisam=alltrim(zmtakisam)	 
*	  locate for &zmtakisam
*	endif  
    if.not.found()
      kj_tkom(12," Uwaga! ","Pozycja "+ztnaz+"  "+ztkod,"o indeksie "+str(ztmindex),"nie odnaleziona w magazynie. Korekty stan¢w nie przeprowadzono.",5) 
    else
      *if mnaz=ztnaz.and.mkod=ztkod
        do case
	      case zdtyp $ sprzedaz_gr.and..not.zdtyp $ przes_gr .and..not.produkcja
		    if zsiec
	          if reclock(5)      
	            replace mil with mil-ltil
		        if zmagwidoczny
				  if.not.mil=0
				    replace mwidoczny with .t.
				  endif
				endif
				unlock
	            lzapisano=.t.
			  else
	            lzapisano=.f.
	          endif	
	        else
	          replace mil with mil-ltil
		        if zmagwidoczny
				  if.not.mil=0
				    replace mwidoczny with .t.
				  endif
				endif
			  lzapisano=.t.
	        endif			
			if zfifo.and..not.panul.and..not.zdanul
			  fifo_sprzedaj()
			endif
	      case zdtyp $ sprzedaz_gr.and..not.zdtyp $ przes_gr .and.produkcja
	        do case
			  case zprod_mag=1
			    prod_mag1(ltil)
			endcase

	      case zdtyp $ zakup_gr.and..not.zdtyp $ przes_gr
            cen_zak_sred(ltil,ltcen,ltmindex)     &&wprowadza ceny srednie zakupu
			if zsiec
	          if reclock(5)      
	            replace mil with mil+ltil
				if ztukan
				  replace mdokzak with zdndok
				  replace mdatzak with zddatdok
				endif
				if zdtyp$bo_gr
				  replace bo_il with bo_il+ltil,endstan_il with endstan_il+ltil
				  replace bo_cen with ztcen
				endif
				do case
				  case cenaew_typ="O"
				    replace mcen_m with ztcen
				  case cenaew_typ="S"
				    *òrednia obejmuj•ca wszystkie podmagazyny
				  case cenaew_typ="B"	
				    *òrednia obejmuj•ca tylko magazym bieæ•cy
				endcase
		        if zmagwidoczny
				  if.not.mil=0
				    replace mwidoczny with .t.
				  endif
				endif				
				if zfifo.and..not.panul
                  if fifo_use(1)
                    if kj_append(3)
	                  replace cindex with ztmindex,czakdat with zddatdow
					  replace cil with cil+ztil,ccena with ztcen,cwaluta with zdwaluta
					  replace ckurs with zdkurs,ckursdat with zddatsad
					  replace ckoszt with zckoszt,cndow with ztndow
					  replace ckontrah with zdkontrah,cster with zcster
					  replace canul with zcanul
                      unlock
	                endif
				  endif
				endif
				unlock
	            lzapisano=.t.
			  else
	            lzapisano=.f.
	          endif	
	        else
	          replace mil with mil+ltil
			  if.not.zdtyp$przes_gr
			    replace mcen_m with ztcen
			  endif	
		        if zmagwidoczny
				  if.not.mil=0
				    replace mwidoczny with .t.
				  endif
				endif			  
			  lzapisano=.t.
	        endif					  
*
          case zdtyp $ przes_gr.and.zdtyp$sprzedaz_gr.and..not.zdtyp$przerob_gr
            zmag_lad()		    
		    if zsiec
	          if reclock(5)      
	            replace mil with mil-ltil
		        if zmagwidoczny
				  if.not.mil=0
				    replace mwidoczny with .t.
				  endif
				endif		        
				unlock
	            lzapisano=.t.
			  else
	            lzapisano=.f.
	          endif	
	        else
	          replace mil with mil-ltil
		        if zmagwidoczny
				  if.not.mil=0
				    replace mwidoczny with .t.
				  endif
				endif
			  lzapisano=.t.
	        endif		  
*-----------
            close
			*magdefault(val(zdp_magazyn)) 
			magdefault(zknum) 
            select &pmag_sel
            if.not.used()
              if.not.kj_use("magaz",.f.,3)
	          return .f.
	          endif
            endif
            set index to m_naz,m_kod,m_mnk,m_index
            set order to 4


*-----
	        seek ztmindex
            if.not.found()
              *kj_tkom(12," Uwaga! ","Pozycja "+ztnaz+"  "+ztkod,"o indeksie "+str(ztmindex),"nie odnaleziona w magazynie. Korekty stan¢w nie przeprowadzono.",5) 
              zmil=ltil
			  if kj_append(3)
	            m_replac()
                unlock
	          endif              
			else          

			  if zsiec
	            if reclock(5)      
	              replace mil with mil+ltil
		          if zmagwidoczny
				    if.not.mil=0
				      replace mwidoczny with .t.
				    endif
				  endif				  
				  unlock
	              lzapisano=.t.
			    else
	              lzapisano=.f.
	            endif	
	          else
	            replace mil with mil+ltil
		        if zmagwidoczny
				  if.not.mil=0
				    replace mwidoczny with .t.
				  endif
				endif			    
				lzapisano=.t.
	          endif					  
		   
		    endif
			close
            
			mag_dladokum()			
*
          case zdtyp $ przes_gr.and.zdtyp$zakup_gr.and..not.zdtyp$przerob_gr
            zmag_lad()		    
		    if zsiec
	          if reclock(5)      
	            replace mil with mil-ltil
		        if zmagwidoczny
				  if.not.mil=0
				    replace mwidoczny with .t.
				  endif
				endif		        
				unlock
	            lzapisano=.t.
			  else
	            lzapisano=.f.
	          endif	
	        else
	          replace mil with mil-ltil
		        if zmagwidoczny
				  if.not.mil=0
				    replace mwidoczny with .t.
				  endif
				endif			  
			  lzapisano=.t.
	        endif		  
*-----------

            close
			magdefault(val(zdg_magazyn)) 
            select &pmag_sel
            if.not.used()
              if.not.kj_use("magaz",.f.,3)
	          return .f.
	          endif
            endif
            set index to m_naz,m_kod,m_mnk,m_index
            set order to 4

*-----
	        seek ztmindex
            if.not.found()
              *kj_tkom(12," Uwaga! ","Pozycja "+ztnaz+"  "+ztkod,"o indeksie "+str(ztmindex),"nie odnaleziona w magazynie. Korekty stan¢w nie przeprowadzono.",5) 
              zmil=ltil
			  if kj_append(3)
	            m_replac()
		        if zmagwidoczny
				  if.not.mil=0
				    replace mwidoczny with .t.
				  endif
				endif                
				unlock
	          endif              
			else          

			  if zsiec
	            if reclock(5)      
	              replace mil with mil+ltil
		          if zmagwidoczny
				    if.not.mil=0
				      replace mwidoczny with .t.
				    endif
				  endif
				  unlock
	              lzapisano=.t.
			    else
	              lzapisano=.f.
	            endif	
	          else
	            replace mil with mil+ltil
		        if zmagwidoczny
				  if.not.mil=0
				    replace mwidoczny with .t.
				  endif
				endif			    
				lzapisano=.t.
	          endif					  
		   
		    endif
			close
            *mag_dladokum()			
			mag_use(zknum)
			set order to 4
*
		  otherwise
		    lzapisano=.t.
      endcase  
		    	
        
    endif
    if.not.lzapisano
      lsukces=.f.
    endif
  endif
  
  select &tow_sel
  if.not.used()
    if.not.tow_use(.f.)
      return .f.
    endif        
  endif
  if zsiec
    if reclock(5)      
      replace twykonal with lzapisano
      unlock
    else
      kj_tkom(12," Uwaga! ","","Zablokowany rekord w bazie dok_tow","System przerywa prac©.",5) 	
    endif	
  else
    replace twykonal with lzapisano
  endif
  select &select
endif
RETURN

******************************************************************************
* Obsàuga magazynu dla uproszczonej wersji produkcji
******************************************************************************
FUNCTION PROD_MAG1(ptil)
local select:=select(),recno:=recno(),ek,recno1,ltil:=ptil
*save screen to ek
if.not.ztnorm_num=0
  sklad_use(1)
  wyrob_use(1)
  set order to 3
  seek ztnorm_num           && sprawdzam, czy sprzedawana pozycja jest wyrobem
  if found()
    zwyr_lad()
    select &sklad_sel
    set filter to snorm_num=ztnorm_num   && wydzieliàem skàadniki wyrobu
    go top
    do while .not.eof()
      zsklad_lad()
	  select &gmag_sel
	  seek zsklad_num
	  if found()
			  if reclock(5)      
	            replace mil with mil-ltil*zsklad_il
		        if zmagwidoczny
				  if.not.mil=0
				    replace mwidoczny with .t.
				  endif
				endif		        
				unlock
	            lzapisano=.t.
			  else
	            lzapisano=.f.
	          endif		
	  else
        kj_tkom(8," Uwaga! ","Skàadnik "+ zsklad_naz + "  " +zsklad_kod,"nie odnaleziona w magazynie.","Dotyczy wyrobu "+zwyr_naz+"  "+zwyr_kod,5)      	
	  endif
      select &sklad_sel	
	  skip
    enddo
    close
    select &wyrob_sel
    close
    select &gmag_sel
  else
    kj_tkom(8," Uwaga! ","Normatyw wyrobu "+zwyr_naz+"  "+zwyr_kod,"nie odnaleziony.","Brak moæliwoòci dokonania korekty stan¢w magazynowych !",5)      	  
  endif
else
  select &gmag_sel
			  if reclock(5)      
	            replace mil with mil-ltil
		        if zmagwidoczny
				  if.not.mil=0
				    replace mwidoczny with .t.
				  endif
				endif		        
				unlock
	            lzapisano=.t.
			  else
	            lzapisano=.f.
	          endif	
endif

RETURN lzapisano




*******************************************************************************
* Funkcja wylicza sredni• cen© zakupu dla magazyn¢w lokalnych                 *
*******************************************************************************
FUNCTION CEN_ZAK_SRED(ptil,ptcen,ptmindex)
local lcen:=0,recno:=recno(),lwartosc:=0,lmil:=0

set order to 4
seek ptmindex
if found()
  do while mindex=ptmindex
    lwartosc=lwartosc+mil*mcen_m
	lmil=lmil+mil
    skip
  enddo
endif  
lwartosc=lwartosc+ptil*ptcen

if.not.lmil>0
  lcen=ptcen
else
  lmil=lmil+ptil
  lcen=lwartosc/lmil
endif
seek ptmindex
if found()
  do while mindex=ptmindex
			if zsiec
	          if reclock(5)      
		        replace mcen_m with lcen
				unlock
                return .t.
			  else
	            return .f.
	          endif	
	        else
			  replace mcen_m with lcen
	        endif					  
    skip
  enddo
endif  
set order to mklucz
go recno
RETURN .t.



FUNCTION KOR_ZAK_REPLAC()
	    if cenaew_typ="S"    &&uòrednianie ceny zakupu
	     * lmcen_m=mcen_m
	     * ltcen=ztcen
	     * ltil=ztil
		  *replace mcen_m with cena_srednia(lmcen_m,ltil,ltcen)	  
		  do case
		    case mil>=0.and.ztil>=0
		      replace mcen_m with (mil*mcen_m+ztil*ztcen)/(mil+ztil)
		    case mil<0
			  kj_tkom(12," Uwaga!","Wykryto stany ujemne w magazynie w pozycji :",mnaz+"  "+mkod,"Brak mozliwosci usrednienia ceny zakupu. Przyjeto cene z aktualnego dokumentu",5)
		      replace mcen_m with ztcen			  
		    case ztil<0
			  kj_tkom(12," Uwaga!","Wykryto ujemny zakup pozycji :",ztnaz+"  "+ztkod,"Brak mozliwosci usrednienia ceny zakupu. Przyjeto cene z dotychczsowa",5)
		      replace mcen_m with ztcen			  			  
	      endcase
		else
	      replace mcen_m with ztcen
	    endif
		replace mil with mil+ztil
RETURN


FUNCTION COMMONSET_LAD()
local ljak

do while.not.eof()
  do case
    case alltrim(co)=="VAT"
	  lvat=alltrim(jak)
	  if ljak="1"
	    zvat=.t.
	  endif
    case alltrim(co)=="VAT_A"
	  zvat_a=val(alltrim(jak))
    case alltrim(co)=="VAT_B"
      zvat_b=val(alltrim(jak))	  
    case alltrim(co)=="VAT_C"
	  zvat_c=val(alltrim(jak))	  	  
    case alltrim(co)=="VAT_D"
	  zvat_d=val(alltrim(jak))
    case alltrim(co)=="VAT_E"
	  zvat_e=val(alltrim(jak))	  	  
    case alltrim(co)=="VAT_F"
	  zvat_f=val(alltrim(jak))	  	  
    case alltrim(co)=="VAT_G"
	  zvat_g=val(alltrim(jak))	  	  
    case alltrim(co)=="VAT_Z"
	  zvat_z=val(alltrim(jak))	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="D_FIS"
	  ljak=alltrim(jak)
	  if ljak="1"
	    zd_fis=.t.
	  endif	
    case alltrim(co)=="K_FIS"
	  ljak=alltrim(jak)
	  if ljak="1"
	    zk_fis=.t.
	  endif		  
**
    case alltrim(co)=="MAG_TYP"
	  zmag_typ=alltrim(jak)
      do case
	    case zmag_typ=="SRED"
		  zm_sred=.t.
	    case zmag_typ=="FIFO"
		  zm_fifo=.t.
	    case zmag_typ=="LIFO"
		  zm_lifo=.t.
	  endcase
    case alltrim(co)=="MARZA_OP"
	  ljak=alltrim(jak)
	  if ljak="1"
	    zmarza_op=.t.
	  endif

    case alltrim(co)=="M_KODPOWT"
	  if alltrim(jak)="1"
	    zm_kodpowt=.t.
	  endif	  	  	  	  	  
    case alltrim(co)=="MINUS_MAG"
	  if alltrim(jak)="1"
	    zminus_mag=.t.
	  endif	  	  	  	  	  	  

    case alltrim(co)=="MAGAZ_OP"
	  *zmagaz_op=alltrim(jak)	  
	  zmagaz_op=val(jak)	  
    case alltrim(co)=="GRUPA_OP"
	  zgrupa_op=val(jak)
    case alltrim(co)=="DEKRET"
	  if alltrim(jak)="1"
	    zdekret_op=.t.
	  endif	  	  	  	  	  	  
    case alltrim(co)=="POLZNAK"
      zpolznak=val(alltrim(jak))		  
    case alltrim(co)=="KORMAG_GR"
	  kormag_gr=alltrim(jak)	  	  	  	  	  	  	  	  	  

    case alltrim(co)=="SPRZEDAZ_GR"
	  sprzedaz_gr=alltrim(jak)	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZAKUP_GR"
	  zakup_gr=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="DOWOD_GR"
	  dowod_gr=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="DOK_BRUT_GR"
	  dok_brut_gr=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="DOK_NET_GR"
	  dok_net_gr=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="DEFNUM_GR"
	  defnum_gr=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="KONTRAHDOK_GR"
	  kontrahdok_gr=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="PRZES_GR"
	  przes_gr=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="PRZEROB_GR"
	  przerob_gr=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="STOPABEZVAT_GR"
	  stopabezvat_gr=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="OPIS1_GR"
	  opis1_gr=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZKORDOK_ZNAK"
	  zkordok_znak=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZKORDOK_SYMBOL"
	  zkordok_symbol=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="KASA_GLOWNA"
	  if alltrim(jak)="1"
	    kasa_glowna=.t.
	  endif	  	  	  	  	  	  	  
    case alltrim(co)=="CENAEW_TYP"
	  cenaew_typ=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  	  	  
  endcase
  skip
enddo
RETURN nil

FUNCTION PARAM_LAD()
do while.not.eof()
  do case
    case alltrim(co)=="LPT15"
	  if alltrim(jak)="1"
	    zlpt15=.t.
	  else
	    zlpt15=.f.
	  endif	  	  	  	  
    case alltrim(co)=="ZPKWIU22"
	  if alltrim(jak)="1"
	    zpkwiu22=.t.
	  else
	    zpkwiu22=.f.
	  endif	  	  	  	  	  
    case alltrim(co)=="ZZERO_BLOK"
	  if alltrim(jak)="1"
	    zzero_blok=.t.
	  else
	    zzero_blok=.f.
	  endif	  	  	  	  	  
    case alltrim(co)=="ZMINUS_BLOK"
	  if alltrim(jak)="1"
	    zminus_blok=.t.
	  else
	    zminus_blok=.f.
	  endif	  	  	  	  	  	  
    case alltrim(co)=="ZFIFO"
	  if alltrim(jak)="1"
	    zfifo=.t.
	  else
	    zfifo=.f.
	  endif	  	  	  	  
    case alltrim(co)=="ZFIFO_TRYB"
	  zfifo_tryb=alltrim(jak)
    case alltrim(co)=="ZKORTRYB"
      zkortryb=alltrim(jak)	  	
    case alltrim(co)=="ZAKWIZYTOR"
	  if alltrim(jak)="1"
	    zakwizytor=.t.
	  else
	    zakwizytor=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZWINDRUK"
	  if alltrim(jak)="1"
	    zwindruk=.t.
	  else
	    zwindruk=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZWINRAPDRUK"
	  if alltrim(jak)="1"
	    zwinrapdruk=.t.
	  else
	    zwinrapdruk=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="Z56_KONTRAH"
	  if alltrim(jak)="1"
	    z56_kontrah=.t.
	  else
	    z56_kontrah=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZZAZNACZ_DOK"
	  if alltrim(jak)="1"
	    zzaznacz_dok=.t.
	  else
	    zzaznacz_dok=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="NIP_NABYWCY"
	  nip_nabywcy=alltrim(jak)
    case alltrim(co)=="OPOZNIENIE"
      zopoznienie=val(alltrim(jak))		  
    case alltrim(co)=="PAPIER_TYP"
      zpapier_typ=val(alltrim(jak))		  
    case alltrim(co)=="STRONA_DL"
      zstrona_dl=val(alltrim(jak))		  
    case alltrim(co)=="MJM_DEF"
      zmjm_def=alltrim(jak)	
    case alltrim(co)=="M_SP_BRUT"
	  if alltrim(jak)="1"
	    zm_sp_brut=.t.
	  else
	    zm_sp_brut=.f.
	  endif	  	  	  	  	  	  
    case alltrim(co)=="MIASTO"
      zmiasto=alltrim(jak)		  	  
    case alltrim(co)=="EDIT"
      edit=alltrim(jak)		  	  	  
    case alltrim(co)=="KOLOR"
      kolor=val(alltrim(jak))
    case alltrim(co)=="DFIS_PORT"
      dfis_port=alltrim(jak)	
	  fis_com=val(alltrim(substr(opis,1,15)))
    case alltrim(co)=="DFIS_DRUK"
      dfis_druk=alltrim(jak)	
    case alltrim(co)=="DRUK_FISKALNA"
	  if alltrim(jak)="1"
	    druk_fiskalna=.t.
	  else
	    druk_fiskalna=.f.
	  endif
    case alltrim(co)=="ZDOKEXPORT"
	  if alltrim(jak)="1"
	    zdokexport=.t.
	  else
	    zdokexport=.f.
	  endif	  
    case alltrim(co)=="ZPIN"
      zpin=alltrim(jak)		  
    case alltrim(co)=="ZMTAKISAM"
      zmtakisam=alltrim(jak)		  	  
    case alltrim(co)=="ZAMIENNIKI"
	  if alltrim(jak)="1"
	    zamienniki=.t.
	  else
	    zamienniki=.f.
	  endif	  	  	  	  	  	  	  	  
    case alltrim(co)=="OP_PLATNOSC_TXT"
	  do case
	    case alltrim(jak)="0"
		  op_platnosc_txt=.f.
	    case alltrim(jak)="1"
		  op_platnosc_txt=.t.
	    case alltrim(jak)="2"
		  op_platnosc_txt=.t.
		  op_export_txt=.f.
	    case alltrim(jak)="3"
		  op_platnosc_txt=.t.
		  op_export_txt=.t.		  
	  endcase
    case alltrim(co)=="OP_TXT1"
      op_txt1=alltrim(opis)		  	  	  	  
	  op_txt1=stuff(space(30),1,len(op_txt1),op_txt1)
    case alltrim(co)=="OP_TXT2"
      op_txt2=alltrim(opis)		  	  	  	  
	  op_txt2=stuff(space(30),1,len(op_txt2),op_txt2)
    case alltrim(co)=="OP_TXT3"
      op_txt3=alltrim(opis)		  	  	  	  
	  op_txt3=stuff(space(30),1,len(op_txt3),op_txt3)
    case alltrim(co)=="OP_TXT4"
      op_txt4=alltrim(opis)		  	  	  	  
	  op_txt4=stuff(space(30),1,len(op_txt4),op_txt4)
    case alltrim(co)=="OP_TXT5"
      op_txt5=alltrim(opis)		  	  	  	  
	  op_txt5=stuff(space(30),1,len(op_txt5),op_txt5)
    case alltrim(co)=="OP_TXT6"
      op_txt6=alltrim(opis)		  	  
	  op_txt6=stuff(space(30),1,len(op_txt6),op_txt6)
    case alltrim(co)=="OP_TXT10"
	  if alltrim(jak)="1"
	    zop_txt10=.t.
	  else
	    zop_txt10=.f.
	  endif	  	  	  	  	  	  	  
	  op_txt10=alltrim(opis)		  	  
    case alltrim(co)=="OPISD_1"
      opisd_1=alltrim(opis)		  	  
    case alltrim(co)=="OPISD_2"
      opisd_2=alltrim(opis)		  	  
    case alltrim(co)=="OPISD_3"
      opisd_3=alltrim(opis)		  	  
    case alltrim(co)=="OPISD_4"
      opisd_4=alltrim(opis)		  	  
    case alltrim(co)=="OPISD_5"
      opisd_5=alltrim(opis)		  	  
    case alltrim(co)=="OPISD_6"
      opisd_6=alltrim(opis)		  	  	  	  	  	  	  	  
    case alltrim(co)=="ZDOKANUL_POKAZ"
	  zdokanul_pokaz=val(alltrim(jak))		  
    case alltrim(co)=="ZWALUTA_DEF"
	  zwaluta_def=alltrim(jak)		  	  
    case alltrim(co)=="ZDWALUTA_DEF"
	  zdwaluta_def=alltrim(jak)
    case alltrim(co)=="DOK_EKRAN"
      dok_ekran=val(alltrim(jak))	  		  	  	  
    case alltrim(co)=="ZWMAG_OP"
      zwmag_op=val(alltrim(jak))	  		  	  	  	  
    case alltrim(co)=="WKONTO"
      wkonto=val(alltrim(jak))	  		  	  	  	  
    case alltrim(co)=="RABAT NA POZYC."
	  if alltrim(jak)="1"
	    zpoz_rabat=.t.
	  else
	    zpoz_rabat=.f.
	  endif	  	  	  	  	  	  	  
    case alltrim(co)=="ZPKW_I_U"
	  if alltrim(jak)="1"
	    zpkw_i_u=.t.
	  else
	    zpkw_i_u=.f.
	  endif	  	  	  	  	  	  	  	  
    case alltrim(co)=="EXPORT_KS"
	  if alltrim(jak)="1"
	    zexport_ks=.t.
	  else
	    zexport_ks=.f.
	  endif	  	  	  	  	  	  	  	  
    case alltrim(co)=="RYCZALT_KS"
	  if alltrim(jak)="1"
	    zryczalt_ks=.t.
	  else
	    zryczalt_ks=.f.
	  endif	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="UTARG_KS"
	  if alltrim(jak)="1"
	    zutarg_ks=.t.
	  else
	    zutarg_ks=.f.
	  endif	  	  	  	  	  	  	  	  	  	  

    case alltrim(co)=="ZNAZ_64"
	  if alltrim(jak)="1"
	    znaz_64=.t.
	  else
	    znaz_64=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZWYDZIEL_MIESIAC"
	  if alltrim(jak)="1"
	    zwydziel_miesiac=.t.
	  else
	    zwydziel_miesiac=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZKONTO_NEWTYP"
	  if alltrim(jak)="1"
	    zkonto_newtyp=.t.
	  else
	    zkonto_newtyp=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZW_DEWIZACH"
	  if alltrim(jak)="1"
	    zw_dewizach=.t.
	  else
	    zw_dewizach=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZPOTWIERDZENIE"
	    zpotwierdzenie=alltrim(jak)
    case alltrim(co)=="ZKRESCEN"
	    zkrescen=alltrim(jak)		
    case alltrim(co)=="ZARCHIW"
	    zarchiw=val(alltrim(jak))		
    case alltrim(co)=="ZDOKCENDRUK"
	    zdokcendruk=alltrim(jak)
    case alltrim(co)=="ZFIRKOD"
	    zfirkod=alltrim(jak)		
    case alltrim(co)=="ZKRES_TOWTAB"
	  if alltrim(jak)="1"
	    zkres_towtab=.t.
	  else
	    zkres_towtab=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZWOLNIONA"
	  if alltrim(jak)="1"
	    zks_zwolniona=.t.
	  else
	    zks_zwolniona=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZKON_KOD"
	  if alltrim(jak)="1"
	    zkon_kod=.t.
	  else
	    zkon_kod=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="KSWFIR"
      zksilefirm=val(alltrim(jak))
	  if zksilefirm<2
	    zfirnum=1
	  endif
    case alltrim(co)=="ZKSKON"
	  if alltrim(jak)="1"
	    zkskon_wlasny=.t.
	  else
	    zkskon_wlasny=.f.
	  endif	  	  	  	  	  
    case alltrim(co)=="ZKSFIRZNAK"
	  zfirznak=alltrim(jak)
    case alltrim(co)=="BEZENDDOK_GR"
	  bezenddok_gr=alltrim(jak)	
	case alltrim(co)=="ZKSFIR_UPRAW"
	  if alltrim(jak)="1"
	    zksfir_upraw=.t.
	  else
	    zksfir_upraw=.f.
	  endif	  	  	  	  	  
    case alltrim(co)=="ZOPC_UPRAW"
	  if alltrim(jak)="1"
	    zopc_upraw=.t.
	  else
	    zopc_upraw=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="STAWKI_VAT"
	  vat_dekod()
    case alltrim(co)=="ZPIETRUSZKA"
	  if alltrim(jak)="1"
	    zpietruszka=.t.
	  else
	    zpietruszka=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZKIM1"
	  if alltrim(jak)="1"
	    zkim1=.t.
	  else
	    zkim1=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZKIM2"
	  if alltrim(jak)="1"
	    zkim2=.t.
	  else
	    zkim2=.f.
	  endif	  	  	  	  
    case alltrim(co)=="ZKSOLD_PATH"
	  zksold_path=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZKS_SERWER"
	  zks_serwer=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZSET_SERWER"
	  zset_serwer=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZK_SERWER"
	  zk_serwer=alltrim(jak)	  	  	  	  	  	  	  	  	  	  	  	  	  	  
    case alltrim(co)=="ZKSWSPOLNIK"
	  if alltrim(jak)="1"
	    zkswspolnik=.t.
	  else
	    zkswspolnik=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  
     case alltrim(co)=="ZMOPISSAY"
      zmopissay=val(alltrim(jak))	  		  	  	  	  
     case alltrim(co)=="ZMGRUP_TRYB"
      zmgrup_tryb=val(alltrim(jak))	  		  	  	  	  	  

     case alltrim(co)=="ZKSPOZ_START"
      zkspoz_start=val(alltrim(jak))	  		  	  	  	  
     case alltrim(co)=="ZKRES_ENTER_TRYB"
      zkres_enter_tryb=val(alltrim(jak))	  		  	  	  	  	  
     case alltrim(co)=="ZD_SZUKAJ"
      zd_szukaj=alltrim(jak)	  		  	  	  	  	  	  
     case alltrim(co)=="ZVAT_DL"
      zvat_dl=val(alltrim(jak))	  		  	  	  	  	  
     case alltrim(co)=="ZKS_DL"
      zks_dl=val(alltrim(jak))	  		  	  	  	  	  	  
     case alltrim(co)=="ZOFER_PATH"
      zofer_path=alltrim(jak)	  		  	  	  	  	  	  	  
     case alltrim(co)=="ZDOK_PATH"
      zdok_path=alltrim(jak)	  		  	  	  	  	  	  
     case alltrim(co)=="ZMAGWIDOCZNY"
	  if alltrim(jak)="1"
	    zmagwidoczny=.t.
	  else
	    zmagwidoczny=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  
     case alltrim(co)=="ZTOWAR_FILTR"
	  if alltrim(jak)="1"
	    ztowar_filtr=.t.
	  else
	    ztowar_filtr=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  
     case alltrim(co)=="ZKARTA"
	  if alltrim(jak)="1"
	    zkarta=.t.
	  else
	    zkarta=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  
     case alltrim(co)=="ZREM_NEW"
	  if alltrim(jak)="1"
	    zrem_new=.t.
	  else
	    zrem_new=.f.
	  endif	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  
  endcase
  skip
enddo
RETURN nil



FUNCTION ARCHIW_LAD()
zarch_poz=arch_poz
zarch_naz=arch_naz
zarch_opis=arch_opis
zadok_path=ALLTRIM(adok_path)
zakas_path=ALLTRIM(akas_path)
zamag_path=ALLTRIM(amag_path)
zakon_path=ALLTRIM(akon_path)
zarch_wid=arch_wid
RETURN



*******************************************************************************
* Ladowanie zmiennych towaru zmiennymi z grupy magazynowej i dokumentu        *
*******************************************************************************
FUNCTION ZT_ZMD_LAD()
ztndow=zdndow
ztnaz=zmnaz
ztkod=zmkod
*ztnum=0
ztmindex=zmindex
*ztdatdow=date()
*ztkormag=zmkormag
ztkormag=.T.
*ztil=0
ztjm=zmjm
*ztcen=0
ztcen_ew=mcen_m
*ztcen_dewiz=0
ztstawka=zmstawka
ztsymbol=substr(msymbol,1,15)
ztzwolniony=zmzwolniony
*ztwyroznik=space(1)
ztwykonal=.f.
ztster=zmster
ztmagaz=zmmagaz
ztgrup=zmgrup
ztdekret=zmdekret
ztpasek=zmpasek
if zkon_mag
  mag_dedykowany_lad()
endif
do case
  case zcen_dew=1
    ztcen_dewiz=zmcen_d
  case zcen_dew=2
    ztcen_dewiz=zmcen_h	
  case zcen_dew=3
    ztcen_dewiz=zmcen_s
  case zcen_dew=4
    ztcen_dewiz=zmcen_p		
endcase
RETURN nil

FUNCTION MAG_DEDYKOWANY_LAD()
local select:=select()
if konmag_use(1)
  set order to 4
  seek zmindex
  if found()
    do while mindex=zmindex
      if mkontrah=zknum
	    ztnaz=mnaz
        ztkod=mkod    
        zmcen_d=mcen_d
	    zmcen_h=mcen_h
	    zmjm=mjm
		exit
	  endif	
	  skip
	enddo  
  endif
  close  
endif  
select &select
RETURN


*******************************************************************************
* Ladowanie zmiennych towatu wartosciami z pliku tow_buf                      *
*******************************************************************************
FUNCTION ZTOW_LAD()
ztndow=tndow
ztnaz=tnaz
ztkod=tkod
ztnum=tnum
ztmindex=tmindex
ztdatdow=tdatdow
ztkormag=tkormag
ztil=til
ztjm=tjm
ztcen=tcen
ztcen_ew=tcen_ew
ztcen_dewiz=tcen_dewiz
ztstawka=tstawka
ztsymbol=substr(tsymbol,1,15)
ztzwolniony=tzwolniony
ztwyroznik=twyroznik
ztwykonal=twykonal
ztster=tster
ztmagaz=tmagaz
ztgrup=tgrup
ztdekret=tdekret
ztanul=tanul
ztil_dost=til_dost
if zkreskakod
  ztpasek=tpasek
endif  
if produkcja.and..not.zkj_kasa
  ztnorm_num=tnorm_num
endif
RETURN nil






FUNCTION DOKDEF(ptryb)
if ptryb=0
  zdokdef_recno:=xdokdef_recno
  zgrupa_dok:=xgrupa_dok
  ztyp_dok:=xtyp_dok
  zznak_dok:=xznak_dok
  zznak_dow:=xznak_dow
  znaz_dok:=xnaz_dok
  ztyt_dok:=xtyt_dok
  zlaman_dok:=xlaman_dok
  zmagaz_dok:=xmagaz_dok
  zmg_dok:=xmg_dok
  zmp_dok:=xmp_dok
  zwalut_dok:=xwalut_dok
  zopis_dok:=xopis_dok
  zopis1_dok:=xopis1_dok
  zopis2_dok:=xopis2_dok
  zopis3_dok:=xopis3_dok
  zsymbol_dok:=xsymbol_dok
  zukryj=xukryj
else
  zdokdef_recno:=zdokdef_recno
  xgrupa_dok:=zgrupa_dok
  xtyp_dok:=ztyp_dok
  xznak_dok:=zznak_dok
  xznak_dow:=zznak_dow
  xnaz_dok:=znaz_dok
  xtyt_dok:=ztyt_dok
  xlaman_dok:=zlaman_dok
  xmagaz_dok:=zmagaz_dok
  xmg_dok:=zmg_dok
  xmp_dok:=zmp_dok
  xwalut_dok:=zwalut_dok
  xopis_dok:=zopis_dok
  xopis1_dok:=zopis1_dok
  xopis2_dok:=zopis2_dok
  xopis3_dok:=zopis3_dok
  xsymbol_dok:=zsymbol_dok
  xukryj=zukryj
endif
**

if.not.ztyp_dok$zkordok_znak  &&mod.25.02.2004 
  zdtyp=ztyp_dok
  zdgrup=zgrupa_dok
endif  
zdznak=zznak_dok
zdg_magazyn=zmg_dok
zdp_magazyn=zmp_dok
zmagaz_zyn=zmagaz_dok
zdsymbol=zsymbol_dok
zdopis1=zopis1_dok
zdopis2=zopis2_dok
zdopis3=zopis3_dok
if zdtyp$przes_gr
  zknum=val(zmp_dok)
endif
**
RETURN nil


*******************************************************************************
* Zerowanie zmiennych okreslajacych dokument                                  *
*******************************************************************************
FUNCTION D_ZER()
*zdgrup=space(1)
*zdtyp=space(1)
*zdznak=space(1)
*zdidentyfik:=space(2)
*zdsymbol:=space(2)
zdndow=space(15)
zdndok=space(15)
zdnzam=space(15)
zddatdow=date()
zddatdok=date()
zdtermin=ctod("")
zdkordat=ctod("")
zdkordok=space(15)
zdkontrah=0
zdnskrot=space(15)
zdniedop=0
zdsposzap=def_sposzap
zdrabat=0
zdkonto=def_dkonto 
*zdg_magazyn=space(3)
*zdp_magazyn=space(3)
zdkormag_ok=.f.
*zdwystawil=space(30)
zdodebral=space(30)
zdakwizytor=0
zdksiegowy=.f.
zddatsp=date()
zddatzal=date()
zddatsad=ctod("")
zddatgranic=ctod("")
zdster=space(3)
zd1_lamany=space(3) 
zdwaluta=space(3)
zdkurs=1
zdanul=.f.
zdopis1=space(80)
zdopis2=space(80)
zdopis3=space(80)
zdpom=space(30)
zsad_numer=space(30)
zkursnbp_numer=space(30)
zwaluta=space(10)
zprzelicznik=1
zks_opis=space(30)
RETURN nil

FUNCTION TOW_ZER()
ztndow=space(15)
ztnaz=space(32)
ztkod=space(7)
ztnum=0
ztmindex=0
ztdatdow=date()
ztkormag=.t.
ztil=0
ztjm=space(3)
ztcen=0
ztcen_ew=0
ztcen_dewiz=0
ztstawka=def_stawka
ztsymbol=space(15)
ztzwolniony=.f.
ztwyroznik=space(1)
ztwykonal=.f.
ztster=space(3)
ztmagaz=space(1)
ztgrup=space(3)
ztdekret=space(10)
ztpasek=space(13)
ztnorm_num=0
ztil_dost=0
ztanul=.f.
if z2kod
  ztkod=space(14)
endif
RETURN

FUNCTION DOKEXP_REPLAC()
replace eod_kogo with zeod_kogo,edla_kogo with zedla_kogo
replace enr_dok with zenr_dok,edat_dok with zedat_dok
replace eks_jako with zeks_jako,ezaksiegow with zezaksiegow
replace eilosc with zeilosc,ecena with zecena,ester with zester
replace efir_naz with zefir_naz,emagnum with zemagnum
RETURN


*******************************************************************************
* Zapamietanie zmiennych w pliku sprzedaz                                     *
*******************************************************************************
FUNCTION TOW_REPLAC()
if ztnum=0
  ztnum=recno()
endif
ztndow=zdndow
ztdatdow=zddatdow
replace tndow with ztndow
replace tnaz with ztnaz
replace tkod with ztkod
replace tnum with ztnum
replace tmindex with ztmindex
replace tdatdow with ztdatdow
replace tkormag with ztkormag
replace til with ztil
replace tjm with ztjm
replace tcen with ztcen
replace tcen_ew with ztcen_ew
replace tcen_dewiz with ztcen_dewiz
if zdtyp$eksport_gr
  replace tstawka with 0
else
  replace tstawka with ztstawka
endif
replace tsymbol with ztsymbol
replace tzwolniony with ztzwolniony
if empty(ztwyroznik)
  if.not.zdtyp="o"
    replace twyroznik with zdtyp
  else
    replace twyroznik with "º"
  endif	
else
  replace twyroznik with ztwyroznik
endif  
replace twykonal with ztwykonal
replace tster with ztster
replace tmagaz with ztmagaz
replace tgrup with ztgrup
replace tdekret with ztdekret
if zpoz_rabat
  replace til_dost with ztil_dost
endif  
replace tanul with ztanul
if zkreskakod
  replace tpasek with ztpasek
endif
if produkcja.and..not.zkj_kasa
  replace tnorm_num with ztnorm_num
endif
*if.not.zdtyp$kormag_gr
*  replace tkormag with .f.
*endif
RETURN nil


FUNCTION ZPLIK_ZER()
ztnet_a=0
ztnet_b=0
ztnet_c=0
ztnet_d=0
ztnet_e=0
ztnet_f=0
ztnet_z=0
ztvat_a:=0
ztvat_b:=0
ztvat_c:=0
ztvat_d:=0
ztvat_e:=0
ztvat_f:=0
ztvat_z:=0
ztbrut_a=0
ztbrut_b=0
ztbrut_c=0
ztbrut_d=0
ztbrut_e=0
ztbrut_f=0
ztbrut_z=0
ztnet_all=0
ztvat_all=0
ztbrut_all=0
*zkwota=0
RETURN nil


FUNCTION ZRAP_ZER()
zrnet_a=0
zrnet_b=0
zrnet_c=0
zrnet_d=0
zrnet_e=0
zrnet_f=0
zrnet_z=0
zrvat_a:=0
zrvat_b:=0
zrvat_c:=0
zrvat_d:=0
zrvat_e:=0
zrvat_f:=0
zrvat_z:=0
zrbrut_a=0
zrbrut_b=0
zrbrut_c=0
zrbrut_d=0
zrbrut_e=0
zrbrut_f=0
zrbrut_z=0
zrnet_all=0
zrvat_all=0
zrbrut_all=0
RETURN nil

FUNCTION ZSRAP_ZER()
zsnet_a=0
zsnet_b=0
zsnet_c=0
zsnet_d=0
zsnet_e=0
zsnet_f=0
zsnet_z=0
zsvat_a:=0
zsvat_b:=0
zsvat_c:=0
zsvat_d:=0
zsvat_e:=0
zsvat_f:=0
zsvat_z:=0
zsbrut_a=0
zsbrut_b=0
zsbrut_c=0
zsbrut_d=0
zsbrut_e=0
zsbrut_f=0
zsbrut_z=0
zsnet_all=0
zsvat_all=0
zsbrut_all=0
RETURN nil

FUNCTION TABLEXP_LAD()
zxnadawca=xnadawca
zxodbiorca=xodbiorca
zxodbiortyp=xodbiortyp
zxdokex_typ=xdokex_typ
zxks_jako=xks_jako
zxster=xster
zxmagnum=xmagnum
RETURN

FUNCTION DOKEXP_LAD()
zeod_kogo=eod_kogo
zedla_kogo=edla_kogo
zenr_dok=enr_dok
zedat_dok=edat_dok
zeks_jako=eks_jako
zezaksiegow=ezaksiegow
zeilosc=eilosc
zecena=ecena
zester=ester
zemagnum=emagnum
zefir_naz=efir_naz
RETURN

FUNCTION WZOR_LAD()
zwwzor_typ=wwzor_typ
zwnew_typ=wnew_typ
zwmozliwe=wmozliwe
zwkontrah=wkontrah
zwkormag=wkormag
zwster=wster
RETURN

FUNCTION ZDOK_LAD()
local select:=select()
zdgrup=dgrup
zdtyp=dtyp
zdznak=dznak
*zdidentyfik=didentyfik
zdsymbol=dsymbol
zdndow=dndow
zdndok=dndok
zdnzam=dnzam
zddatdow=ddatdow
zddatdok=ddatdok
zdtermin=dtermin
zdkordat=dkordat
zdkordok=dkordok
zdkontrah=dkontrah
zdnskrot=dnskrot
zdniedop=dniedop
zdsposzap=dsposzap
zdrabat=drabat
zdkonto=dkonto
zdg_magazyn=dg_magazyn
zdp_magazyn=dp_magazyn
zdkormag_ok=dkormag_ok
zdwystawil=dwystawil
zdodebral=dodebral
zdakwizytor=dakwizytor
zdksiegowy=dksiegowy
zddatsp=ddatsp
zddatzal=ddatzal
zddatsad=ddatsad
zddatgranic=ddatsad
zdster=dster
zd1_lamany=d1_lamany
zdwaluta=dwaluta
zdkurs=dkurs
zdanul=danul
zdopis1=dopis1
zdopis2=dopis2
zdopis3=dopis3
zdpom=dpom
if numer_zam_op
  zdnumer_zam:=substr(dpom,1,15)
endif
if zdtyp$eksportsad_gr.or.zdtyp$import_gr.or.zdtyp$importsad_gr
  zsad_numer=substr(zdopis2,1,30)
  zkursnbp_numer=substr(zdopis2,31,30)
  zwaluta=substr(zdopis2,61,10)
  zprzelicznik=val(substr(zdopis2,71,6))
endif
if zdtyp$przes_gr
  zknum=zdkontrah
*
    zkserwer=zk_serwer
    zk_serwer=zp_serwer

    if.not.kon_use()
      return .f.
    endif
    locate for knum=val(zdg_magazyn)
	if found()
	  wmag_lad()
	endif
	locate for knum=zknum
	if found()
	  zkon_lad()
	endif
    close
    zk_serwer=zkserwer
    select &select
*	
endif
if zdtyp$ksiega_gr
  ks_lad()
endif
RETURN nil

FUNCTION ZDOK_DEF_LAD()
zdokdef_recno=recno()
zgrupa_dok=grupa_dok
ztyp_dok=typ_dok
zznak_dok=znak_dok
zznak_dow=znak_dow
znaz_dok=naz_dok
ztyt_dok=tyt_dok
zlaman_dok=laman_dok
zmg_dok=mg_dok
zmp_dok=mp_dok
zwalut_dok=walut_dok
zopis_dok=opis_dok
zopis1_dok=opis1_dok
zopis2_dok=opis2_dok
zopis3_dok=opis3_dok
**
zdgrup=grupa_dok
zdtyp=typ_dok
zdznak=znak_dok
zdg_magazyn=mg_dok
zdp_magazyn=mp_dok
zmagaz_zyn=magaz_dok
zmagaz_dok=magaz_dok
*zidentyfik=identyfik
*zdidentyfik=identyfik
zsymbol_dok=symbol_dok
zdsymbol=symbol_dok
zdopis1=opis1_dok
zdopis2=opis2_dok
zdopis3=opis3_dok
if zdtyp$przes_gr
  zknum=val(mp_dok)
endif
if znew_1
  zukryj=ukryj
endif  
RETURN NIL

FUNCTION Z_ZDOK_DEF_LAD()
**
zdgrup=zgrupa_dok
zdtyp=ztyp_dok
zdznak=zznak_dok
zdg_magazyn=zmg_dok
zdp_magazyn=zmp_dok
zmagaz_zyn=zmagaz_dok
zmagaz_dok=zmagaz_dok
*zidentyfik=identyfik
*zdidentyfik=identyfik
zdsymbol=zsymbol_dok
zd1_lamany=zlaman_dok
RETURN NIL


*******************************************************************************
* SH_MENU                                                                     *
*******************************************************************************
*******************************************************************************
* Menu glowne programu SH                                                     *
*******************************************************************************
FUNCTION SH_GMENU() 
local ek,ek1,ek2,ek3,ltnaz,ltkod,ltil,lfound:=.f.,lcolor:=setcolor(),lzak_menu:=0
local lbelka:="∞ Sprzedaæ ∞    Zakup    ∞  Magazyn   ∞ Kontrahent ∞  Inne  ∞  Koniec ∞"
local lliter:="  S             Z           M           K             I                "
local lpoz:=1,ltopis[20], i:=0,select
local l_inne:=1,l_inne2:=1,lzak:=1,lsprzed:=1,l_inne1:=1,lsprzed1:=1,lsprzed2:=1
local lzak1:=1, lzak2:=1,luse:=.t.,ldsiec:=.f.,t[1],l_inne3:=1
local lw_grup:=2,lk_grup:=2,ld_sciezka:=""
local lile:=6,ilanal:=0,lw:=0,l_inne4:=1,l_inne41:=1,l_kas1:=1
local lmagwidoczny:=zmagwidoczny,lexpimp:=1,lpin:=space(10),l_innep:=1
local l_inne_pracownik:=1
*for i=1 to 20
*  ltopis[i]:="Ok!"
*next
if empty(kormag_gr)
   lbelka:="∞ Sprzedaæ ∞    Zakup    ∞  Cennik    ∞ Kontrahent ∞  Inne  ∞  Koniec ∞"
   lliter:="  S             Z           C           K             I                "
endif

ltopis[1]:="Dokumenty zwi•zane ze sprzedaæ•"
ltopis[2]:="Dokumenty zwi•zane z zakupem"
ltopis[3]:="Obsàuga magazynu"
ltopis[4]:="Kartoteka kontrahent¢w"
ltopis[5]:="Parametry, administracja, indeksacja"
ltopis[6]:="Zamkni©cie baz danych i zako‰czenie pracy z programem"
if zsh_analiza
  lbelka:="∞ Sprzedaæ ∞    Zakup    ∞  Magazyn   ∞ Kontrahent ∞  Inne  ∞ Analiza ∞ Koniec ∞"
  lliter:="  S             Z           M           K             I       A                 "
  lile=7
  ltopis[6]:="Analizy wykonywane w oparciu o dokumenty zakupu i sprzedaæy"
  ltopis[7]:="Zamkni©cie baz danych i zako‰czenie pracy z programem"  
endif
*if zkj_faktur
if empty(kormag_gr).and.zsh_analiza
  lbelka:="∞ Sprzedaæ ∞ Zakup  ∞  Cennik    ∞ Kontrahent ∞  Inne  ∞ Analiza ∞ Koniec ∞"
  lliter:="  S          Z         C           K             I       A                 "
  ltopis[3]:="Cennik towar¢w i usàug"
endif
if zkj_kasa
  lbelka:="∞ Wpàata   ∞   Wypàata   ∞  Sàownik   ∞ Kontrahent ∞  Inne  ∞ Analiza ∞ Koniec ∞"
  lliter:="  W             y           S           K             I       A                 "
  ltopis[1]:="Rejestracja wpàat do kasy"
  ltopis[2]:="Rejestracja wypàat z kasy"
  ltopis[3]:="Podr©czna baza zawierajca opisy dokument¢w kasowych"
  ltopis[6]:="Raporty kasowe dzienne i okresowe"
endif
t[1]:="naz_dok"

do while .t.    
set color to n/w, w/n
  close_all("SH")
  zdtyp="!"
  lpoz=menu_poziom(0,0,lile,lbelka,lliter,ltopis,lpoz,.f.,.f.)   &&Menu glowne
  save screen to ek
  if lastkey()=27
    if kj_gkom(12,"","Zako‰czyÜ prac© ?","",.t.,25).or.lastkey()=27
      if zarchiw>0	  
	    archiwizuj()
	  endif	
	  exit
	else
      lpoz=1
	endif  
  endif
  keyboard chr(205)
*  if lastkey()=-21
*    serwis()
*	exit
*  endif
  g_tlo()
  if kolor=0
    set color to n/w,w/n
  endif
  do case
    case lpoz=1.and.lastkey()=13
	  lw=(lpoz-1)*10
	  do while .t.
	    save screen to ek1
		set default to &dokdef_serwer
        if.not.file("dok_def.dbf")
		  ld_sciezka:=zd_serwer+"leg01"
		  set default to &ld_sciezka
		endif
	    select &dokdef_sel
	    if kj_use("dok_def",.f.,3)
		  set index to dok_def
		  set filter to grupa_dok$"205678".and.substr(opis_dok,1,1)$"SM".and..not.ukryj
		  go top
		  ildok=ilosc_dok()
		  @ 2,lw+1 to 2+ildok+1,lw+14 
		  keyboard chr(205)
          dbedit(3,lw+2,3+ildok-1,lw+13,t,"FU_D","","","",,"")
	      close
		  if lastkey()=27
			exit
		  endif
		  if.not.zarchiw_up.or.zdtyp$kasa_gr
		  
		    if.not.zznak_dok=zkordok_znak
		      do while.t.
	            lsprzed1=sprzed1_menu(lsprzed1,lw)
			    save screen to ek2  
		        do case
	              case lastkey()=27
		            exit
	              case lsprzed1=1
				    nowy_dok()
	              case lsprzed1=2
                    dok_old(zd_serwer,zk_serwer,zm_serwer)
				    if zdsymbol=zkordok_symbol
				      exit
				    endif
	            endcase	
	            restore screen from ek2
	          enddo
		    else
		      dok_old(zd_serwer,zk_serwer,zm_serwer)
		    endif				   
	      
		  else
            archiw_menu(1)		    
		  endif
		  
		  restore screen from ek1
          close_all("SH")
		else
	      if.not.kj_gkom(12," Uwaga!","Brak dost©pu do pliku DOK_DEF.DBF","PonowiÜ pr¢b© ?",5)
		    exit
		  endif
	    endif
	  enddo	
*	case lpoz=2.and.zkj_faktur
*      opcje_get()
	  
    case lpoz=2.and.lastkey()=13
	  lw=(lpoz-1)*10
	  do while .t.
	    save screen to ek1
		set default to &dokdef_serwer
	    select &dokdef_sel
        if.not.file("dok_def.dbf")
		  ld_sciezka:=zd_serwer+"leg01"
		  set default to &ld_sciezka
		endif		
	    if kj_use("dok_def",.f.,3)
		  set index to dok_def
	      set filter to grupa_dok$"105678".and.substr(opis_dok,1,1)$"ZM".and..not.ukryj
		  go top
	      ildok=ilosc_dok()
		  @ 2,lw+2 to 2+ildok+1,lw+15 
		  keyboard chr(205)
          dbedit(3,lw+3,3+ildok-1,lw+14,t,"FU_D","","","",,"")
	      close
		  if lastkey()=27
			exit
		  endif
		  if.not.zarchiw_up
		    do while.t.
	          lsprzed1=sprzed1_menu(lsprzed1,lw)
			  save screen to ek2  
		      do case
	            case lastkey()=27
		          exit
	            case lsprzed1=1
				  nowy_dok()
	            case lsprzed1=2
                  dok_old(zd_serwer,zk_serwer,zm_serwer)
	          endcase	
	          restore screen from ek2
	        enddo			   
	      else
		    archiw_menu(2)		    
		  endif
		  
		  restore screen from ek1
          close_all("SH")
		else
	      if.not.kj_gkom(12," Uwaga!","Brak dost©pu do pliku DOK_DEF.DBF","PonowiÜ pr¢b© ?",5)
		    exit
		  endif
	    endif
	  enddo		  
	  
    case lpoz=3.and.zkj_kasa.and.lastkey()=13
	  keyboard chr(205)
	  slownik_kas()	  
    case lpoz=3.and.lastkey()=13                &&Magazyn 
      m_num=1
	  m_okno=.F.
	  m_txt=""
	  m_klucz=1
	  m_siec=.t.
	  m_tryb=1
	  close_all("SH")
*	  save screen to ek
	  lsp_menu=1
	  luse=.t.


        if zmagaz_op>0.or.zwmag_op>0
		  
	      do while .t.
	        if zwmag_op>0
              ztyt_dok=space(15)
			  zopis_dok=space(80)
			  zpracow_kon=.t.
			  kontrah(zk_serwer,.t.,"",2,.f.,3)
			  zpracow_kon=.f.
	          m_num=zknum
	          if zknum=0
			    wmag_sum()
			  endif
			endif
            if lastkey()=27
			  exit
			endif					  
		    magdefault(m_num)
		    if zmagaz_op>0
			  mag_wybor(2,25,.f.)
			endif  
            if lastkey()=27
			  exit
			endif
			keyboard chr(205)
		    magazyn(m_num,m_okno,m_txt,m_klucz)	   	      
			close
		  enddo
        else
		  magdefault(m_num)
          magazyn(m_num,m_okno,m_txt,m_klucz)	   	      
		endif
	 * restore screen from ek
	  close_all("SH")


	case lpoz=4.and.lastkey()=13                    &&Kontrahent
      k_okno=.f.
	  k_txt=space(10)
	  k_klucz=1
	  k_ksiega=.f.
	  k_tryb=1
      kontrah(zk_serwer,k_okno,k_txt,k_klucz,k_ksiega,k_tryb)	   	   
      close_all("SH")

    case lpoz=5.and.lastkey()=13                &&Inne
	  do while.t.
	    l_inne=inne_menu(l_inne)
	    if lastkey()=27
		  exit
		endif		
		do case
		  case l_inne=1
		    save screen to ek1
			do while.t.
			  restore screen from ek1
			  if zkj_kasa
			    l_inne1=0
				l_kas1=kas_menu1(l_kas1)
			  else
			    l_kas1=0
			    l_inne1=inne_menu1(l_inne1)
			  endif	
			  do case
			    case lastkey()=27
				  exit
                
				case l_inne1=1.or.l_kas1=1       &&Wydruki
                  druk_wybor(9,43)
			    case l_inne1=2       &&Dokumenty  wystawià
				  if zakwizytor
				    l_inne_pracownik=inne_pracownik_menu(l_inne_pracownik)
					do case
					  case l_inne_pracownik=1
					    wystawil(.t.)  	
					  case l_inne_pracownik=2
						akwizyt_edit()			
					endcase
				  else
				    wystawil(.t.)  				
				  endif	
				  *save screen to ek2
				  *do while.t.
				  *  restore screen from ek2
				*	l_innep=inne_menu4(l_innep)
				*	if lastkey()=27
				*	  exit
				*	endif				  
				 *   do case
				*	  case l_innep=1
				*	    kwestionariusz()
				*	  case l_innep=2
				 *       wystawil(.t.)  				
				*	endcase  
				 * enddo	
			    case l_inne1=3       &&Parametry uæytkownika
				  uparam_get()
				
				case l_inne1=4.and.(zgrupa_op>0.or.zmagaz_op>0)       &&Magazyny   
				  save screen to ek2
				  do while.t.
				    restore screen from ek2
					l_inne3=inne_menu3(l_inne3)
					if lastkey()=27
					  exit
					endif
					do case
					  case l_inne3=1
					    magdefault(val(zdg_magazyn)) 
						do while .t.
						  if zmagaz_op>0
						    mag_wybor(2,2,.f.)
						    lw_grup=4
							lk_grup=12
						  else
						    lw_grup=2
							lk_grup=2						  	
						  endif  	
						  if lastkey()=27
						    exit
						  endif
						  
                          if zgrupa_op>0						  
						    do while .t.
						      grup_wybor(lw_grup,lk_grup,.t.)
							  if lastkey()=27
							    keyboard chr(205)
						        exit
						      endif
						    enddo	
						  else
						    exit
						  endif	
						enddo  
					  case l_inne3=2.and.zmagaz_op>0
					    magdefault(val(zdg_magazyn)) 
                        do while .t.
						  mag_wybor(2,2,.t.)
						  close
						  if lastkey()=27
						    exit
						  endif
						enddo  
					  case l_inne3=3.and.zwmag_op>0
					    magdefault(val(zdg_magazyn)) 
                        do while .t.
						  w_mag_wybor(2,2,.t.,"")
						  close
						  if lastkey()=27
						    exit
						  endif
						enddo  												
					endcase
				  enddo


			    case l_inne1=5.or.l_kas1=2       &&Opcje programu       
				  opcje_get(1)

				  
			  endcase
			enddo
            restore screen from ek1
		  case l_inne=2
		    *set default to shset
			set default to &set_serwer
			has_new(6,20,12)
		  case l_inne=3
		    indeksacja()
		  case l_inne=4
		    save screen to ek2
			**
			lcolor=setcolor()
			do skom with "Wpisz haslo i zatwierdz klawiszem [Enter]"
            set color to
            *set default to shset
			set default to &set_serwer
		    if.not.kj_haslo(10,46,1)
              exit
            endif
			setcolor(lcolor)
			**
			do while.t.
			  restore screen from ek2
			    l_inne4=inne4_menu(l_inne4)
                if lastkey()=27
			      restore screen from ek2
			      exit
			    endif
			    do case
				  case l_inne4=6
	                kod_pisz()
			      case l_inne4=1
				    numdok_zmien()					  
				  case l_inne4=2
				    sh_nowyrok()
				  case l_inne4=3
				    dostep_dok()
				  case l_inne4=4
**
      m_num=1
	  m_okno=.F.
	  m_txt=""
	  m_klucz=1
	  m_siec=.t.
	  m_tryb=1
	  close_all("SH")
	  lsp_menu=1
	  luse=.t.

        if zmagaz_op>0.or.zwmag_op>0
		  
	      do while .t.
	        if zwmag_op>0
              ztyt_dok=space(15)
			  zopis_dok=space(80)
			  zpracow_kon=.t.
			  kontrah(zk_serwer,.t.,"",2,.f.,3)
			  zpracow_kon=.f.
	          m_num=zknum
	          if zknum=0
			    wmag_sum()
			  endif
			endif
            if lastkey()=27
			  exit
			endif					  
		    magdefault(m_num)
		    if zmagaz_op>0
			  mag_wybor(2,25,.f.)
			endif  
            if lastkey()=27
			  exit
			endif
			keyboard chr(205)
		    lmagwidoczny=zmagwidoczny
			zmagwidoczny=.f.
			zmadmin=.t.
			magazyn(m_num,m_okno,m_txt,m_klucz)	   	      
		    zmagwidoczny=lmagwidoczny
			zmadmin=.f.
			close
		  enddo
        else
		  lmagwidoczny=zmagwidoczny
		  zmagwidoczny=.f.
		  zmadmin=.t.
		  magdefault(m_num)
          magazyn(m_num,m_okno,m_txt,m_klucz)	   	      
		  zmagwidoczny=lmagwidoczny
		  zmadmin=.f.					  
		endif
	 * restore screen from ek
	  close_all("SH")
**    
				  case l_inne4=5
				    lexpimp=expimp_menu(lexpimp)
					if.not.lastkey()=27
                      close all
					  set default to
					  set color to
					  clear
                      kj_okno(3,3,18, " Obsàuga eksporu i importu plik¢w                                          ",7)
					  do case
					    case lexpimp=1
                          if file("out_conf.bat")
						    if kj_gkom(12,"","Pliki konfiguracyjne umieszczone zostan• pliku <l_config.arj>.","WykonaÜ  ?",.t.,25)
						      run out_conf.bat baz_exp
							  inkey(2)
						    endif	
						  else
                            kj_tkom(12," Uwaga! ","Brak pliku <out_conf.bat>","Operacja nie moæe byÜ wykonana.","Skontaktuj si© z serwisem.",5)						  
						  endif	
					    case lexpimp=2
                          if file("out_dbf.bat")
                            if kj_gkom(12,"","Pliki zawieraj•ce dane (*.dbf) umieszczone zostan• pliku <l_dbf.arj>.","WykonaÜ  ?",.t.,25)
						      run out_dbf.bat baz_exp
							  inkey(2)
    					    endif	
						  else
                            kj_tkom(12," Uwaga! ","Brak pliku <out_dbf.bat>","Operacja nie moæe byÜ wykonana.","Skontaktuj si© z serwisem.",5)						  
						  endif	
					    case lexpimp=3
                          if file("out_baz.bat")                          
						    if kj_gkom(12,"","Wszystkie pliki z wyà•czeniem program¢w"," umieszczone zostan• pliku <l_baz.arj>   WykonaÜ  ?",.t.,25)
						      run out_baz.bat baz_exp
							  inkey(2)
    						endif
						  else
                            kj_tkom(12," Uwaga! ","Brak pliku <out_baz.bat>","Operacja nie moæe byÜ wykonana.","Skontaktuj si© z serwisem.",5)						  
						  endif									
					    case lexpimp=4
                          if file("out_all.bat")                          
						    if kj_gkom(12,"","Wszystkie pliki umieszczone zostan• pliku <l_all.arj>.","WykonaÜ  ?",.t.,25)
						      run out_all.bat baz_exp
							  inkey(2)
						    endif
						  else
                            kj_tkom(12," Uwaga! ","Brak pliku <out_all.bat>","Operacja nie moæe byÜ wykonana.","Skontaktuj si© z serwisem.",5)						  
						  endif															  						  						  
					    case lexpimp=5
                          if file("in_conf.bat")
						    if kj_gkom(8,"","Pliki konfiguracyjne umieszczone pliku <l_config.arj>","wprowadzone zostan• do systemy zast©puj•c dotychczasowe!     WykonaÜ  ?",.t.,25)
						      set cursor on
							  lpin=space(10)
							  @ 12,10 say "Wpisz odpowiedni PIN : " get lpin
							  read
							  set cursor off
							  if.not.lastkey()=27
							    if alltrim(lpin)==alltrim(zpin)
							      run out_conf.bat baz_last
								  run in_conf.bat baz_imp
							      inkey(2)
								else
                                  kj_tkom(12," Uwaga! ","Podany PIN nie jest prawidàowy! ","Operacja nie moæe byÜ wykonana.","Skontaktuj si© z administratorem systemu.",5)					
								endif  
							  endif	
						    endif	
						  else
                            kj_tkom(12," Uwaga! ","Brak pliku <in_conf.bat>","Operacja nie moæe byÜ wykonana.","Skontaktuj si© z serwisem.",5)						  
						  endif	
					    case lexpimp=6
                          if file("in_dbf.bat")
						    if kj_gkom(8,"","Pliki z danymi umieszczone pliku <l_dbf.arj>","wprowadzone zostan• do systemy zast©puj•c dotychczasowe!     WykonaÜ  ?",.t.,25)
						      set cursor on
							  lpin=space(10)
							  @ 12,10 say "Wpisz odpowiedni PIN : " get lpin
							  read
							  set cursor off
							  if.not.lastkey()=27
							    if alltrim(lpin)==alltrim(zpin)
							      run out_dbf.bat baz_last
								  run in_dbf.bat baz_imp
							      close_all("SH")
							      indeksacja()
								else
                                  kj_tkom(12," Uwaga! ","Podany PIN nie jest prawidàowy! ","Operacja nie moæe byÜ wykonana.","Skontaktuj si© z administratorem systemu.",5)					
								endif  
							  endif
						    endif	
						  else
                            kj_tkom(12," Uwaga! ","Brak pliku <in_dbf.bat>","Operacja nie moæe byÜ wykonana.","Skontaktuj si© z serwisem.",5)						  
						  endif							  
					    case lexpimp=7
                          if file("in_baz.bat")
						    if kj_gkom(8,"","Wszystkie pliki z wyà•czeniem program¢w umieszczone pliku <l_baz.arj>","wprowadzone zostan• do systemy zast©puj•c dotychczasowe!     WykonaÜ  ?",.t.,25)
						      set cursor on
							  lpin=space(10)
							  @ 12,10 say "Wpisz odpowiedni PIN : " get lpin
							  read
							  set cursor off
							  if.not.lastkey()=27
							    if alltrim(lpin)==alltrim(zpin)
							      run out_baz.bat baz_last
								  run in_baz.bat baz_imp
							      inkey(2)
								else
                                  kj_tkom(12," Uwaga! ","Podany PIN nie jest prawidàowy! ","Operacja nie moæe byÜ wykonana.","Skontaktuj si© z administratorem systemu.",5)					
								endif  
							  endif	
						    endif	
						  else
                            kj_tkom(12," Uwaga! ","Brak pliku <in_baz.bat>","Operacja nie moæe byÜ wykonana.","Skontaktuj si© z serwisem.",5)						  
						  endif	
					    case lexpimp=8
                          if file("in_all.bat")
						    if kj_gkom(8,"","Wszystkie pliki umieszczone pliku <l_all.arj>","wprowadzone zostan• do systemy zast©puj•c dotychczasowe!     WykonaÜ  ?",.t.,25)
						      set cursor on
							  lpin=space(10)
							  @ 12,10 say "Wpisz odpowiedni PIN : " get lpin
							  read
							  set cursor off
							  if.not.lastkey()=27
							    if alltrim(lpin)==alltrim(zpin)
							      run out_all.bat baz_last
								  run in_all.bat baz_imp
							      inkey(2)
								else
                                  kj_tkom(12," Uwaga! ","Podany PIN nie jest prawidàowy! ","Operacja nie moæe byÜ wykonana.","Skontaktuj si© z administratorem systemu.",5)					
								endif  
							  endif	
						    endif	
						  else
                            kj_tkom(12," Uwaga! ","Brak pliku <in_all.bat>","Operacja nie moæe byÜ wykonana.","Skontaktuj si© z serwisem.",5)						  
						  endif	
						  



					  endcase
					  setcolor(lcolor)
					endif
			    
				
				endcase
			enddo
			restore screen from ek2  
		endcase
	  enddo
	  
	case lpoz=6.and.zsh_analiza.and.lastkey()=13
      *set default to shset
	  set default to &set_serwer
      if file("analiza.dbf")
	    select &anal_sel
        if kj_use("analiza",.f.,3)
		  lw=60
		  ilanal=lastrec()
		  @ 2,lw+1 to 2+ilanal+1,lw+17 
		  
          do while.t.
		    keyboard chr(205)
		    go top
			dbedit(3,lw+2,3+ilanal-1,lw+16,"an_nazwa","FU_A","","","",,"")
		    if lastkey()=27
			  exit
		    endif
            an_lad()
			do case
              case ztowanal_op.and.alltrim(an_typ)="atowanal_op"
			    towanal()
              case zsh_raport.and.alltrim(an_typ)="ash_raport"
				raport()				
		    endcase
			select &anal_sel
		  enddo	
		  close
        else
          return
        endif
      else
       * do case
		*  case ztowanal_op
		 *   towanal()
		*endcase	  
	    if zkj_kasa
		  raport()				
		endif	
	  endif

	  
      
	  
    case (lpoz=6.and..not.zsh_analiza).or.lpoz=7.or.lpoz=0
	  if zszuflada
	    if kj_gkom(12,"","OtworzyÜ szuflad© ?","",.t.,5)
          do szuf with fis_com           
	    endif	
	  endif
	  if kj_gkom(12,"","Zako‰czyÜ prac© w programie ?","",.t.,25)
	    close all
        set color to
	    if zarchiw>0	  
		  archiwizuj()
		endif
		clear
	    return
	  endif
	  keyboard chr(205)		  
  endcase

  restore screen from ek
  sh_paramsay()
enddo
RETURN nil



*******************************************************************************
* KJ_KSIEGA   MENU                                                                     *
*******************************************************************************





FUNCTION FU_A()
local last:=lastkey(),lcolor:=setcolor()

do case
  case last=27
    return 0
  case last=13
    set color to w/n*
	@ row(),col() say an_nazwa
	setcolor(lcolor)
    *zdok_def_lad()
	return 0	
endcase
do skom with alltrim(an_opis)
RETURN 1

FUNCTION FU_D()
local last:=lastkey(),lcolor:=setcolor()

do case
  case last=27
    return 0
  case last=13
    set color to w/n*
	@ row(),col() say naz_dok
	setcolor(lcolor)
    zdok_def_lad()
	return 0	
endcase
do skom with alltrim(opis_dok)
RETURN 1



*******************************************************************************
* Tworzy menu sprzedazy - wybor dokumentu  zd_pimienny - parametr decydujacy  *
* o mozliwosci uaktywnienia czwartej pozycji menu                             *
*******************************************************************************
FUNCTION SPRZED_MENU(ppoz)
local ltnaz[4],ltlit[4],ltopis[4],lbelka:="",lpoz:=ppoz,lmenu
ltnaz[1]:=" Faktury  "
ltnaz[2]:=" Rachunki "
ltnaz[3]:=" Paragony "
ltnaz[4]:=" p.Imienne"
ltlit[1]:=" F         "
ltlit[2]:=" R          "
ltlit[3]:=" P          "
ltlit[4]:="   I        "
ltopis[1]:="Faktury  VAT "
ltopis[2]:="Rachunki uproszczone"
ltopis[3]:="Paragony bezimienne"
ltopis[4]:="Paragony imienne"
save screen to ek
if zp_imienny
  lmenu=4
else
  lmenu=3
endif
lpoz=men_pion(2,1,lmenu,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

*******************************************************************************
* Menu dostepne po wyborze dokumentu sprzedazy. Decyduje czy tworzymy nowy    *
* dokument czy przegladamy (poprawiamy) dokumenty wczesniej zarejestrowane    *
*******************************************************************************
FUNCTION SPRZED1_MENU(ppoz,pw)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Nowy dokument"
ltnaz[2]:=" Archiwum     "
ltlit[1]:=" N            "
ltlit[2]:=" A            "
ltopis[1]:="Tworzenie i wydruk nowego dokumentu sprzedazy "
ltopis[2]:="Przeglad wczesniej zarejestrowanych dokumentow"
save screen to ek
  lpoz=men_pion(5,pw+13,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

*******************************************************************************
* Menu dostepne po wyborze dokumentu zakupu.    Decyduje czy tworzymy nowy    *
* dokument czy przegladamy (poprawiamy) dokumenty wczesniej zarejestrowane    *
*******************************************************************************
FUNCTION ZAK1_MENU(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Nowy dokument"
ltnaz[2]:=" Archiwum     "
ltlit[1]:=" N            "
ltlit[2]:=" A            "
ltopis[1]:="Tworzenie i wydruk nowego dokumentu sprzedazy "
ltopis[2]:="Przeglad wczesniej zarejestrowanych dokumentow"
save screen to ek
  lpoz=men_pion(5,21,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

*******************************************************************************
* Menu dostepne po wyborze dokumentu sprzedazy i w kolejnym menu - nowego     *
* dokumentu. Decyduje o sposobie prezentacji cen zakupu: netto czy brutto     *
*******************************************************************************
FUNCTION ZAK_CEN_MENU(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" ceny Netto  "
ltnaz[2]:=" ceny Brutto "
ltlit[1]:="      N      "
ltlit[2]:="      B      "
ltopis[1]:="Dokument wystawiony  w cenach netto"
ltopis[2]:="Dokument wystawiony  w cenach brutto"
save screen to ek
  lpoz=men_pion(7,31,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

*******************************************************************************
* Tworzy menu w czesci zwiazanej z zakupem:  wybor dokumentu zakupa           *
*******************************************************************************
FUNCTION ZAK_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Faktury    "
ltnaz[2]:=" Rachunki   "
ltnaz[3]:=" Dowody     "
ltlit[1]:=" F          "
ltlit[2]:=" R          "
ltlit[3]:=" D          "
ltopis[1]:="Przeglad, dopisywanie nowych, poprawianie istniejacych, anulowanie"
ltopis[2]:="Przeglad, dopisywanie nowych, poprawianie istniejacych, anulowanie"
ltopis[3]:="Przeglad, dopisywanie nowych, poprawianie istniejacych, anulowanie"
save screen to ek
  lpoz=men_pion(2,12,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

*******************************************************************************
* Tworzy menu uaktywniajace funkcje techniczne programu                       *
*******************************************************************************
FUNCTION INNE_MENU(ppoz)
local lile:=4
local ltnaz[4],ltlit[4],ltopis[4],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Parametry    "
ltnaz[2]:=" Zmiana hasla "
ltnaz[3]:=" Indeksacja   "
ltnaz[4]:=" Administrator"
ltlit[1]:=" P            "
ltlit[2]:=" Z            "
ltlit[3]:=" I            "
ltlit[4]:=" A            "
ltopis[1]:="Modyfikacja i zatwierdzanie parametrow programu"
ltopis[2]:="Zmiana obowiazujacego hasla"
ltopis[3]:="Uporzadkowanie baz danych - odtworzenie uszkodzonych plikow indeksowych"
ltopis[4]:="Funfcje administratora programu"
if.not.zadministr_up
  lile=3
endif
save screen to ek
  lpoz=men_pion(2,50,lile,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION INNE4_MENU(ppoz)
local lile:=5
local ltnaz[6],ltlit[6],ltopis[6],lbelka:="",lpoz:=ppoz
if zdzierzawa
  lile=6
endif
ltnaz[1]:=" Numeracja startowa"
ltnaz[2]:=" Rozpocz©cie roku  "
ltnaz[3]:=" Dob¢r dokument¢w  "
ltnaz[4]:=" Magazyn           "
ltnaz[5]:=" Export/import baz "
ltnaz[6]:=" Kody aktywacyjne  "
ltlit[1]:=" N                 "
ltlit[2]:=" R                 "
ltlit[3]:=" D                 "
ltlit[4]:=" M                 "
ltlit[5]:=" E                 "
ltlit[6]:=" K                 "
ltopis[1]:="Funkcja nadaje numery pocz•tkowe dokumentom"
ltopis[2]:="Operacje zwi•zane z rozpocz©ciem nowego roku"
ltopis[3]:="Zarz•dzanie dost©pnoòci• dokument¢w"
ltopis[4]:="Dost©p do peànego magazynu, moæliwoòÜ przywr¢cenia pozycji wczeòniej usuni©tych"
ltopis[5]:="Eksport baz do pliku / Import baz z pliku"
ltopis[6]:="Wprowadzanie miesi©cznych kod¢w aktywacyjnych"
save screen to ek
  lpoz=men_pion(6,32,lile,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz


FUNCTION EXPIMP_MENU(ppoz)
local lile:=8
local ltnaz[8],ltlit[8],ltopis[8],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" 1. Eksport konfiguracji "
ltnaz[2]:=" 2. Eksport baz *.dbf    "
ltnaz[3]:=" 3. Eksport peànych baz  "
ltnaz[4]:=" 4. Eksport wszystkiego  "
ltnaz[5]:=" 5. Import  konfiguracji "
ltnaz[6]:=" 6. Import  baz *.dbf    "
ltnaz[7]:=" 7. Import  peànych baz  "
ltnaz[8]:=" 8. Import  wszystkiego  "
ltlit[1]:=" 1                 "
ltlit[2]:=" 2                 "
ltlit[3]:=" 3                 "
ltlit[4]:=" 4                 "
ltlit[5]:=" 5                 "
ltlit[6]:=" 6                 "
ltlit[7]:=" 7                 "
ltlit[8]:=" 8                 "
ltopis[1]:="Eksport plik¢w odpowiedzialnych wyàacznie za konfiguracj© systemu"
ltopis[2]:="Eksport plik¢w odpowiedzialnych za przechowywanie danych."
ltopis[3]:="Eksport wszystkich plik¢w z wyà•czeniem program¢w."
ltopis[4]:="Eksport wszystkich plik¢w."
ltopis[5]:="Import plik¢w odpowiedzialnych wyàacznie za konfiguracj© systemu"
ltopis[6]:="Import plik¢w odpowiedzialnych za przechowywanie danych."
ltopis[7]:="Import wszystkich plik¢w z wyà•czeniem program¢w."
ltopis[8]:="Import wszystkich plik¢w."
save screen to ek
  lpoz=men_pion(11,14,lile,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION ADMIN_D_MENU(ppoz)
local lile:=2
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Sprzedaæ"
ltnaz[2]:=" Zakup   "
ltlit[1]:=" S       "
ltlit[2]:=" Z       "
ltopis[1]:="Dost©pnoòÜ dokument¢w z grupy sprzedaæy"
ltopis[2]:="Dost©pnoòÜ dokument¢w z grupy zakupu"
  lpoz=men_pion(9,22,lile,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION INNE5_MENU(ppoz)
local lile:=3
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" WartoòÜ remanentu "
ltnaz[2]:=" Rozpocz©cie roku  "
ltnaz[3]:=" Definiowanie wsp¢l"
ltlit[1]:=" W                 "
ltlit[2]:=" R                 "
ltlit[3]:=" D                 "
ltopis[1]:="WartoòÜ remanentu na pocz•tku i na ko‰cu okresu rozliczeniowego"
ltopis[2]:="Operacje zwi•zane z rozpocz©ciem nowego roku"
ltopis[3]:="Definiowanie wsp¢àwàaòcicieli firmy"
save screen to ek
  lpoz=men_pion(6,32,lile,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION INNE41_MENU(ppoz)
local lile:=2
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Zerowanie  "
ltnaz[2]:=" Ustawianie "
ltlit[1]:=" Z          "
ltlit[2]:=" U          "
ltopis[1]:="Zerowanie licznika dla wszystkich dokument¢w"
ltopis[2]:="Ustawianie licznika numer¢w dla wybranego dokumentu"
save screen to ek
  lpoz=men_pion(8,21,lile,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

*******************************************************************************
* Menu dostepne po wyborze z menu INNE opcji PARAMETRY                        *
* Otwiera mozliwosc modyfikacji lub wydruku parametrow oraz wprowadzenia nazw *
*******************************************************************************
FUNCTION INNE_MENU1(ppoz)
local ltnaz[5],ltlit[5],ltopis[5],lbelka:="",lpoz:=1
ltnaz[1]:=" Drukarki    "
ltnaz[2]:=" Pracownik   "
ltnaz[3]:=" Uæytkownik  "
ltnaz[4]:=" Magazyny    "
ltnaz[5]:=" Opcje       "

ltlit[1]:=" D           "
ltlit[2]:=" P           "
ltlit[3]:=" U           "
ltlit[4]:=" M           "
ltlit[5]:=" O           "
ltopis[1]:="Wyb¢r drukarki domyòlnej"
ltopis[2]:="Tworzenie listy pracownik¢w upowaænionych do wystawiania dokument¢w"
ltopis[3]:="Definiowanie parametr¢w Uæutkownika - wàaòciciela licencji."
ltopis[4]:="Definiowanie nazw magazyn¢w i grup towarowych."
ltopis[5]:="Definiowane przez Uæytkownika opcje programu."
save screen to ek
  lpoz=men_pion(4,37,5,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION INNE_PRACOWNIK_MENU(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=1
ltnaz[1]:=" Sprzedawca  "
ltnaz[2]:=" Akwizytor   "
ltlit[1]:=" S           "
ltlit[2]:=" A           "
ltopis[1]:="Lista uprawnionych do wystawienia dokumentu"
ltopis[2]:="Lista akwizytor¢w, ich dane oraz prowizje."
save screen to ek
  lpoz=men_pion(7,27,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION INNE_MENU2(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=1
ltnaz[1]:=" Wystawil    "
ltnaz[2]:=" Opoznienie  "
ltlit[1]:=" W           "
ltlit[2]:=" O           "
ltopis[1]:="Lista uprawnionych do wystawienia dokumentu"
ltopis[2]:="Okreslenie zwyczajowego opoznienia platnosci"
save screen to ek
  lpoz=men_pion(7,27,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION INNE_MENU3(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=1,lile:=2
ltnaz[1]:=" Grupy towar."
ltnaz[2]:=" Magazyny lok"
ltnaz[3]:=" Magazyny Zew"
ltlit[1]:=" G           "
ltlit[2]:=" M           "
ltlit[3]:=" M        Z  "
ltopis[1]:="Definiowanie grup towarowych."
ltopis[2]:="Nazwy i kody magazyn¢w lokalnych. (Podziaà magazynu gà¢wnego)"
ltopis[3]:="Nazwy i kody magazyn¢w zewn©trznych. "
if.not.zmagaz_op>0
  ltnaz[2]="             "
  ltlit[2]="             "
  ltopis[2]="Funkcja niedost©pna."
endif
if.not.zwmag_op>0
  ltnaz[3]="             "
  ltlit[3]="             "
  ltopis[3]="Funkcja niedost©pna."  
else
  lile=3
endif

save screen to ek
  lpoz=men_pion(7,27,lile,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz


FUNCTION INNE_MENU4(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=1,lile:=2
ltnaz[1]:=" Zatrudniony "
ltnaz[2]:=" Fakturzysta"
ltlit[1]:=" Z           "
ltlit[2]:=" F           "
ltopis[1]:="Kwestionariusz osobowy."
ltopis[2]:="Osoba upowaæniona do wystawiania faktur VAT"

save screen to ek
  lpoz=men_pion(7,27,lile,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

*******************************************************************************
* Tlo zgloszeniowe programu SH                                                *
*******************************************************************************
FUNCTION SH_TLO()
local lcolor:=setcolor()
set color to "gr+/n,n/gr+"
@ 11,0 say "∞     ÕÀ …Õ   …ÕÕÕª                                                            ∞"
@ 12,0 say "∞      ∫…º        ∫                                                            ∞"
@ 13,0 say "∞      Ã ª        ∫   ÕÕÕ    DOS-Mag    /  OBSùUGA OBROTU TOWAROWEGO           ∞"
@ 14,0 say "∞     Õ  »Õ       ∫                                                            ∞"
@ 15,0 say "∞             …ÕÕÕŒÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ     ∞"
@ 16,0 say "∞             »ÕÕÕº                                                            ∞"
@ 17,0 say "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
if.not.zl123
  @ 14,0 say "∞     Õ  »Õ       ∫              wersja    D E M O                             ∞"
endif
do case
    case zkj_detal
      @ 13,0 say "∞      Ã ª        ∫   ÕÕÕ    D   E   T   A   L     /   L E G O S               ∞"
    case zkj_hurt
      @ 13,0 say "∞      Ã ª        ∫   ÕÕÕ    H   U   R   T     /       L E G O S               ∞"	  
    case zkj_dehurt
      @ 13,0 say "∞      Ã ª        ∫   ÕÕÕ    H U R T  -  D E T A L  /  L E G O S               ∞"	  	  
    case zkj_faktur
      @ 13,0 say "∞      Ã ª        ∫   ÕÕÕ    F  A  K  T  U  R  Y    /  L E G O S               ∞"	  	  	  
    case zkj_kasa  
      @ 13,0 say "∞      Ã ª        ∫   ÕÕÕ    K    A    S    A       /  L E G O S               ∞"	  	  	  	  
    case zkj_ksiega  
      @ 13,0 say "∞      Ã ª        ∫   ÕÕÕ    KSI®GA PRZYCHOD‡W I ROZCHOD‡W                     ∞"	  	  	  	  	  
endcase
setcolor(lcolor)	
RETURN NIL

*******************************************************************************
* Drukuje na ekranie kilka aktualnych parametrow programu SH                  *
*******************************************************************************
FUNCTION SH_PARAMSAY()
do case
  case kolor=24
    setcolor("w/b")
  otherwise  
	setcolor("n/w,w/n")
endcase
@ 19,2 say " DATA ......."        
@ 19,16 say date()
@ 22,2 say " Katalog roboczy ....."
*@ 19,25 say space(20)
@ 22,26 say SUBSTR(curdir(),1,30)
if zsiec
  @ 21,2 say " Wersja sieciowa          " 
else
  @ 21,2 say " Wersja jednostanowiskowa " 
endif
*setcolor("w/b/b/w")
*@ 3,58 to 5,76
*@ 4,60 say "Soft-KJ-Service"
if zkj_ksiega.and.zksilefirm>1
  @ 21,2 say "                          " 
  @ 21,3 say zfirnaz
endif
RETURN (NIL)


*******************************************************************************
* INDEKS                                                                      *
*******************************************************************************
*******************************************************************************
* Indeksacja wszystkich plikow                                                *
*******************************************************************************
*******************************************************************************
* Indeksacja plikow programu sh_firma                                         *
*******************************************************************************
FUNCTION INDEKSACJA()
local ek,lcolor:=setcolor(),lm_siec,lm_serwer
local lfirnum:=zfirnum,lkj_ksiega:=zkj_ksiega,lkskon_wlasny:=zkskon_wlasny
save screen to ek
close_all("SH")
select 0
*set default to shset
set default to &set_serwer
        if.not.file("param.dbf")
		  ld_sciezka:=zd_serwer+"shset"
		  set default to &ld_sciezka
		endif
if file("tow_buf.dbf")
  if kj_use("tow_buf",.t.,3)
    do skom with " Indeksacja pliku tow_buf.dbf"
    index on tnum to tow_buf
	use
  else
    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku tow_buf.dbf","Przerwac indeksacje ?",.t.,5)
	  restore screen from ek
      setcolor(lcolor)
	  return
	endif 	
  endif
endif


if file("param.dbf")
  if kj_use("param",.t.,3)
    do skom with " Indeksacja pliku param.dbf"
    index on index to param
	use
  else
    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku param.dbf","Przerwac indeksacje ?",.t.,5)
	  restore screen from ek
      setcolor(lcolor)
	  return
	endif 	
  endif
endif

set default to leg01
        if.not.file("dok_def.dbf")
		  ld_sciezka:=zd_serwer+"leg01"
		  set default to &ld_sciezka
		endif
if file("dok_def.dbf")
  if kj_use("dok_def",.t.,3)
    do skom with " Indeksacja pliku dok_def.dbf"
    index on symbol_dok to dok_def
	use
  else
    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku dok_def.dbf","Przerwac indeksacje ?",.t.,5)
	  restore screen from ek
      setcolor(lcolor)
	  return
	endif 	
  endif
endif

set default to ksiega
if file("dok_def.dbf")
  if kj_use("dok_def",.t.,3)
    do skom with " Indeksacja pliku dok_def.dbf - ksi©ga"
    index on symbol_dok to dok_def
	use
  else
    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku dok_def.dbf - ksi©ga","Przerwac indeksacje ?",.t.,5)
	  restore screen from ek
      setcolor(lcolor)
	  return
	endif 	
  endif
endif
*****************************    Dokumenty
*zak_default()
*if file("zakup.dbf")
*  if kj_use("zakup",.t.,3)
*    do skom with " Indeksacja pliku zakup.dbf"
*    index on tndow to z_dow
*	index on str(tmindex)+dtos(tdatdow) to z_index
*	use
*  else
*    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku zakup.dbf","Przerwac indeksacje ?",.t.,5)
*	  restore screen from ek
*      setcolor(lcolor)
*	  return
*	endif 	
*  endif
*ELSE
*  @ 0,0 SAY ZZAK_SERWER
*  INKEY(0)
*endif

dok_default()

if file("towary.dbf")
  if kj_use("towary",.t.,3)
    do skom with " Indeksacja pliku towary.dbf"
    index on tndow+STR(tnum) to t_dow
	index on str(tmindex)+dtos(tdatdow) to t_index
	*index on tmindex to t_index
	index on tnaz+tkod to t_nazkod
	use
  else
    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku towary.dbf","Przerwac indeksacje ?",.t.,5)
	  restore screen from ek
      setcolor(lcolor)
	  return
	endif 	
  endif
ELSE
  @ 0,0 SAY ZZAK_SERWER
  *INKEY(0)
endif

if file("topis.dbf")
  if kj_use("topis",.t.,3)
    do skom with " Indeksacja pliku towary.dbf"
    index on op_tndow to topis
	use
  else
    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku topis.dbf","Przerwac indeksacje ?",.t.,5)
	  restore screen from ek
      setcolor(lcolor)
	  return
	endif 	
  endif
endif

if file("akwizyt.dbf")
  if kj_use("akwizyt",.t.,3)
    do skom with " Indeksacja pliku akwizyt.dbf"
    index on akw_skrot to akw_skr
	index on akw_num to akw_num
	use
  else
    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku akwizyt.dbf","Przerwac indeksacje ?",.t.,5)
	  restore screen from ek
      setcolor(lcolor)
	  return
	endif 	
  endif
endif

if file("fifo_tow.dbf")
  if kj_use("fifo_tow",.t.,3)
    do skom with " Indeksacja pliku fifo_tow.dbf"
    index on endow to fifo_tow
	use
  else
    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku fifo_tow.dbf","Przerwac indeksacje ?",.t.,5)
	  restore screen from ek
      setcolor(lcolor)
	  return
	endif 	
  endif
endif



if file("dokum.dbf")
  if kj_use("dokum",.t.,3)
    do skom with "Indeksacja pliku dokument.dbf"
    *index on didentyfik + dndok to dok_ident
	*index on dsymbol + dndok to dok_ident
    index on dsymbol to dok_ident
	index on dndok to dok_num
	index on dndow to dow_num
    index on dkontrah to dow_knum
	use
  else
    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku dokument.dbf","Przerwac indeksacje ?",.t.,5)
	  restore screen from ek
      setcolor(lcolor)
	  return
	endif 
  endif
endif

if file("dok_def.dbf")
  if kj_use("dok_def",.t.,3)
    do skom with " Indeksacja pliku dok_def.dbf"
    index on symbol_dok to dok_def
	use
  else
    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku dok_def.dbf","Przerwac indeksacje ?",.t.,5)
	  restore screen from ek
      setcolor(lcolor)
	  return
	endif 	
  endif
endif

if file("param.dbf")
  if kj_use("param",.t.,3)
    do skom with " Indeksacja pliku param.dbf"
    index on index to param
	use
  else
    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku param.dbf","Przerwac indeksacje ?",.t.,5)
	  restore screen from ek
      setcolor(lcolor)
	  return
	endif 	
  endif
endif

if file("tow_buf.dbf")
  if kj_use("tow_buf",.t.,3)
    do skom with " Indeksacja pliku tow_buf.dbf"
    index on tnum to tow_buf
	use
  else
    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku tow_buf.dbf","Przerwac indeksacje ?",.t.,5)
	  restore screen from ek
      setcolor(lcolor)
	  return
	endif 	
  endif
endif


*********************************   Koniec dokumentow

*********************************   Kontrahent

if zsiec
  set default to &(zk_serwer+"KONTRAH")
else
  set default to kontrah
endif
if file("kon.dbf")
  if kj_use("kon",.t.,3)
    do skom with "Indeksacja pliku kontrah.dbf"
    index on knaz1 to k_naz
	index on knip to k_nip
	index on knum to k_num
	use
  else
    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku kontrah.dbf","Przerwac indeksacje ?",.t.,5)
	  restore screen from ek
      setcolor(lcolor)
	  return
	endif 
  endif
endif
***************************   Koniec kontrahenta

*Podmagazyny
if zsiec
  set default to &(zk_serwer+"LEG01\KONTRAH")
else
  set default to leg01\kontrah
endif
if file("kon.dbf")
  if kj_use("kon",.t.,3)
    do skom with "Indeksacja pliku kontrah.dbf"
    index on knaz1 to k_naz
	index on knip to k_nip
	index on knum to k_num
	use
  else
    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku kontrah.dbf","Przerwac indeksacje ?",.t.,5)
	  restore screen from ek
      setcolor(lcolor)
	  return
	endif 
  endif
endif
***************************   Koniec podmagazyn¢w

*********************************   Pracownik
if zsiec
  set default to &zp_serwer
else
  set default to pracow
endif
if file("pracow.dbf")
  if kj_use("pracow",.t.,3)
    do skom with "Indeksacja pliku pracow.dbf"
    index on nazwisko to prac_naz
	use
  else
    if kj_gkom(12," Uwaga! ","Brak dostepu do pliku pracow.dbf","Przerwac indeksacje ?",.t.,5)
	  restore screen from ek
      setcolor(lcolor)
	  return
	endif 
  endif
endif
***************************   Koniec kontrahenta

***************************   Magazyny
lmag=0
do while.t.
  lmag=lmag+1
  magdefault(lmag)
	  if file("magaz.dbf")
        if kj_use("magaz",.t.,3)
		  do skom with "Indeksacja pliku magaz.dbf w magazynie "
		  @ 24,60 say lmag
	      if zrozmiar
		    index on substr(mnaz,1,45)+mkod to m_naz
		  else
		    index on mnaz+mkod to m_naz
		  endif	
		  index on mkod+mnaz to m_kod
	      index on mindex to m_index
		  index on mmagaz+mnaz+mkod to m_mnk
		  index on mmagaz+mkod+mnaz to m_mkn		  
		  if zmgrupy
		    do case
			  case zmgrup_tryb=1
			    index on mgrup+mnaz to m_grup		  
			  case zmgrup_tryb=2
			    index on mmagaz+mnaz to m_grup		  				
			endcase
			
		  endif
		  if zkreskakod
		    index on mpasek to m_kresk
		  endif
		  use
        else
          if kj_gkom(12," Uwaga! ","Brak dostepu do pliku magaz.dbf w magazynie",lmag+"  Przerwac indeksacje ?",.t.,5)
	        restore screen from ek
            setcolor(lcolor)
	        return
	      endif 
        endif
      else
	    exit
	  endif
	  
	  if file("konmag.dbf")
        if kj_use("konmag",.t.,3)
		  do skom with "Indeksacja pliku konmag.dbf w magazynie "
		  @ 24,60 say lmag
	      if zrozmiar
		    index on substr(mnaz,1,45)+mkod to km_naz
		  else
		    index on mnaz+mkod to km_naz
		  endif	
		  index on mkod+mnaz to km_kod
	      index on mindex to km_index
		  index on mmagaz+mnaz+mkod to km_mnk
		  index on mmagaz+mkod+mnaz to km_mkn		  
		  use
        else
          if kj_gkom(12," Uwaga! ","Brak dostepu do pliku konmag.dbf w magazynie",lmag+"  Przerwac indeksacje ?",.t.,5)
	        restore screen from ek
            setcolor(lcolor)
	        return
	      endif 
        endif
	  endif	  
	  
	  
	  if file("bo.dbf")
        if kj_use("bo",.t.,3)
		  do skom with "Indeksacja pliku bo.dbf w magazynie "
		  @ 24,60 say lmag
          *index on mnaz+mkod to bo_naz
	      if zrozmiar
		    index on substr(mnaz,1,45)+mkod to bo_naz
		  else
		    index on mnaz+mkod to bo_naz
		  endif			  
		  index on mkod+mnaz to bo_kod
	      index on mindex to bo_index
		  index on mmagaz+mnaz+mkod to bo_mnk
		  index on mmagaz+mkod+mnaz to bo_mkn		  
		  if zmgrupy
		    index on mgrup+mnaz to bo_grup		  
		  endif
		  use
        else
          if kj_gkom(12," Uwaga! ","Brak dostepu do pliku bo.dbf w magazynie",lmag+"  Przerwac indeksacje ?",.t.,5)
	        restore screen from ek
            setcolor(lcolor)
	        return
	      endif 
        endif		
      endif
	  if file("mag_cen.dbf")
        if kj_use("mag_cen",.t.,3)
		  do skom with "Indeksacja pliku mag_cen.dbf w magazynie "
		  @ 24,60 say lmag		
          index on mnaz+mkod+dtos(mdata) to cen_naz
	      use
        else
          if kj_gkom(12," Uwaga! ","Brak dostepu do pliku mag_cen.dbf w magazynie",lmag+"  Przerwac indeksacje ?",.t.,5)
	        restore screen from ek
            setcolor(lcolor)
	        return
	      endif 
        endif		
	  endif
	  if file("wmagi.dbf")
        if kj_use("wmagi",.t.,3)
		  do skom with "Indeksacja pliku wmagi.dbf w magazynie "
		  @ 24,60 say lmag		
          index on mag_magaz to wmagi
	      use
        else
          if kj_gkom(12," Uwaga! ","Brak dostepu do pliku magi.dbf w magazynie",lmag+"  Przerwac indeksacje ?",.t.,5)
	        restore screen from ek
            setcolor(lcolor)
	        return
	      endif 
        endif		
	  endif	  	  
	  if file("magi.dbf")
        if kj_use("magi",.t.,3)
		  do skom with "Indeksacja pliku magi.dbf w magazynie "
		  @ 24,60 say lmag		
          index on mag_magaz to magi
	      use
        else
          if kj_gkom(12," Uwaga! ","Brak dostepu do pliku magi.dbf w magazynie",lmag+"  Przerwac indeksacje ?",.t.,5)
	        restore screen from ek
            setcolor(lcolor)
	        return
	      endif 
        endif		
	  endif	  
	  if file("grupy.dbf")
        if kj_use("grupy",.t.,3)
		  do skom with "Indeksacja pliku grupy.dbf w magazynie "
		  @ 24,60 say lmag		
          index on mag_grupa to grupy
	      use
        else
          if kj_gkom(12," Uwaga! ","Brak dostepu do pliku grupy.dbf w magazynie",lmag+"  Przerwac indeksacje ?",.t.,5)
	        restore screen from ek
            setcolor(lcolor)
	        return
	      endif 
        endif		
	  endif	  	  
    if file("wyrob.dbf")
	  if kj_use("wyrob",.t.,3)
		  do skom with "Indeksacja pliku wyrob.dbf w magazynie "
		  @ 24,60 say lmag		
          index on wyr_num to wyr_num
		  index on wyr_naz+norm_kod to wyr_naz
	      index on norm_num to norm_num
		  use
      else
          if kj_gkom(12," Uwaga! ","Brak dostepu do pliku wyrob.dbf w magazynie",lmag+"  Przerwac indeksacje ?",.t.,5)
	        restore screen from ek
            setcolor(lcolor)
	        return
	      endif 
      endif			  
	endif
    if file("sklad.dbf")
	  if kj_use("sklad",.t.,3)
		  do skom with "Indeksacja pliku sklad.dbf w magazynie "
		  @ 24,60 say lmag		
          index on sklad_num to sklad_nu
		  index on snorm_num to snorm_nu
	      use
      else
          if kj_gkom(12," Uwaga! ","Brak dostepu do pliku sklad.dbf w magazynie",lmag+"  Przerwac indeksacje ?",.t.,5)
	        restore screen from ek
            setcolor(lcolor)
	        return
	      endif 
      endif			  
	endif	
    if file("fifo.dbf")
	  if kj_use("fifo",.t.,3)
		  do skom with "Indeksacja pliku fifo.dbf w magazynie "
		  @ 24,60 say lmag		
          *index on str(cindex)+dtoc(czakdat) to fifo
		  index on str(cindex)+str(year(czakdat))+str(month(czakdat))+str(day(czakdat))+cndow to fifo
	      use
      else
          if kj_gkom(12," Uwaga! ","Brak dostepu do pliku fifo.dbf w magazynie",lmag+"  Przerwac indeksacje ?",.t.,5)
	        restore screen from ek
            setcolor(lcolor)
	        return
	      endif 
      endif			  
	endif		
	
    if file("fifo_bo.dbf")
	  if kj_use("fifo_bo",.t.,3)
		  do skom with "Indeksacja pliku fifo_bo.dbf w magazynie "
		  @ 24,60 say lmag		
		  index on str(cindex)+str(year(czakdat))+str(month(czakdat))+str(day(czakdat))+cndow to fifo_bo
	      use
      else
          if kj_gkom(12," Uwaga! ","Brak dostepu do pliku fifo_bo w magazynie",lmag+"  Przerwac indeksacje ?",.t.,5)
	        restore screen from ek
            setcolor(lcolor)
	        return
	      endif 
      endif			  
	endif			
            
enddo

************************* Ksi©ga P. i R.
lfirnum=zfirnum
lkj_ksiega=zkj_ksiega
lkskon_wlasny=zkskon_wlasny
for i=1 to zksilefirm
  zfirnum=i
  ks_default(zfirnum)
  if file("ksiega.dbf")
    if kj_use("ksiega",.t.,3)
      do skom with "Indeksacja pliku ksiega.dbf"
      index on ksdatdok to ksiega
	  use
    else
      if kj_gkom(12," Uwaga! ","Brak dostepu do pliku ksiega.dbf","Przerwac indeksacje ?",.t.,5)
	    restore screen from ek
        setcolor(lcolor)
	    return
	  endif 
    endif
  endif  
  kondefault()  
  if file("kon.dbf")
    if kj_use("kon",.t.,3)
      do skom with "Indeksacja pliku kon.dbf"
      index on knaz1 to k_naz
	  index on knip to k_nip
	  index on knum to k_num
	  use
    else
      if kj_gkom(12," Uwaga! ","Brak dostepu do pliku xxxfir\kontrah.dbf","Przerwac indeksacje ?",.t.,5)
	    restore screen from ek
        setcolor(lcolor)
	    return
	  endif 
    endif
  endif    
next
zfirnum=lfirnum
zkj_ksiega=lkj_ksiega
zkskon_wlasny=lkskon_wlasny
************************* Koniec Ksi©gi

close_all("SH")
kj_tkom(12," Ok! ","","Indeksacja zakonczona pomyòlnie","Nacisnij dowolny klawisz",15)
restore screen from ek
setcolor(lcolor)
RETURN nil


*******************************************************************************
* OBLICZ                                                                      *
*******************************************************************************
*******************************************************************************
* Funkcja zwraca wartosc brutto z dokladnoscia do .0000                       *
* Stawka podana w postaci kodu literowego - odpowiednia wartosc liczbowa      *
* dostepna w postaci zmiennych: zvat_a, zvat_b .... zvat_f                    *
*******************************************************************************
FUNCTION BRUTTO(pnetto,pstawka)
local lbrutto
lbrutto=pnetto*(1+(pstawka/100))
RETURN lbrutto

*******************************************************************************
* Funkcja zwraca wartosc netto  z dokladnoscia do .0000                       *
* Stawka podana w postaci kodu literowego - odpowiednia wartosc liczbowa      *
* dostepna w postaci zmiennych: zvat_a, zvat_b .... zvat_f                    *
* Metoda: policzyc vat wg wzoru vat=(brutto*st)/(100+st) i netto=brutto-vat   *
*******************************************************************************
FUNCTION NETTO(pbrutto,pstawka)
local lnetto,lvat
lvat=(pbrutto*pstawka)/(100+pstawka)
lnetto=pbrutto-lvat
RETURN lnetto

*******************************************************************************
* Funkcja zwraca wartosc  VAT   z dokladnoscia do .0000 liczony od NETTO      *
* Stawka podana w postaci kodu literowego - odpowiednia wartosc liczbowa      *
* dostepna w postaci zmiennych: zvat_a, zvat_b .... zvat_f                    *
* Metoda : vat=netto*(stawka/100)
*******************************************************************************
FUNCTION MN_VAT(pnetto,plitera_vat)
local lvat,lstawka
if plitera_vat="Z"
  lvat=0
else  
  lstawka=mvat(plitera_vat)
  lvat=round(pnetto*(lstawka/100),4)
endif  
RETURN lvat

*******************************************************************************
* Funkcja zwraca wartosc  VAT   z dokladnoscia do .0000 liczony od BRUTTO     *
* Stawka podana w postaci kodu literowego - odpowiednia wartosc liczbowa      *
* dostepna w postaci zmiennych: zvat_a, zvat_b .... zvat_f                    *
* Metoda : vat=(brutto*stawka)/(100+stawka)    gdzie stawka podana w %
*******************************************************************************
FUNCTION MB_VAT(pbrutto,plitera_vat)
local lvat,lstawka
if plitera_vat="Z"
  lvat=0
else  
  lstawka=mvat(plitera_vat)
  lvat=round((pbrutto*lstawka)/(100+lstawka),4)
endif  
RETURN lvat


*******************************************************************************
* Funkcja zwraca wartosc brutto z dokladnoscia do .0000                       *
* Stawka podana w postaci cyfrowej w %                                        *
*******************************************************************************
FUNCTION TBRUTTO(pnetto,ptstawka)
  local lbrutto
  lbrutto=pnetto*(1+(ptstawka/100))
RETURN lbrutto

*******************************************************************************
* Funkcja zwraca wartosc netto  z dokladnoscia do .0000                       *
* Stawka podana w postaci cyfrowej w %                                        *
* Metoda: policzyc vat wg wzoru vat=(brutto*st)/(100+st) i netto=brutto-vat   *
*******************************************************************************
FUNCTION TNETTO(pbrutto,ptstawka)
  local lnetto,lvat
  lvat=(pbrutto*ptstawka)/(100+ptstawka)
  lnetto=pbrutto-lvat
RETURN lnetto

*******************************************************************************
* Funkcja zwraca wartosc  VAT   z dokladnoscia do .0000 liczony od NETTO      *
* Stawka podana w postaci cyfrowej w %                                        *
* Metoda : vat=netto*(stawka/100)
*******************************************************************************
FUNCTION TN_VAT(pnetto,ptstawka)
  local lvat
  lvat=round(pnetto*(ptstawka/100),4)
  if zdtyp$eksport_gr
    lvat=0
  endif
RETURN lvat

*******************************************************************************
* Funkcja zwraca wartosc  VAT   z dokladnoscia do .0000 liczony od BRUTTO     *
* Stawka podana w postaci cyfrowej                                            *
* Metoda : vat=(brutto*stawka)/(100+stawka)    gdzie stawka podana w %
*******************************************************************************
FUNCTION TB_VAT(pbrutto,ptstawka)
  local lvat
  lvat=round((pbrutto*ptstawka)/(100+ptstawka),4)
  if zdtyp$eksport_gr
    lvat=0
  endif
RETURN lvat


*******************************************************************************
* Zwraca stawke w postaci cyfrowej ( % )  dla aktualnej wartosci zmiennej     *
* magazynowej (tekstowej) zmstawka. Zmienne zvat_a - zvat_f dostepne na       *
* starcie programu z pliku fs_setup                                           *
*******************************************************************************
FUNCTION MVAT(plitera)
local l_vat:=0
do case
  case plitera="A"
     l_vat=zvat_a
  case plitera="B"
    l_vat=zvat_b
  case plitera="C"
    l_vat=zvat_c
  case plitera="D"
    l_vat=zvat_d
  case plitera="E"
    l_vat=zvat_e
  case plitera="F"
    l_vat=zvat_f
  case plitera="Z"
    l_vat=0
  otherwise
    l_vat=0	
endcase
RETURN l_vat

*******************************************************************************
* Zwraca stawke w postaci cyfrowej ( % )  dla aktualnej wartosci zmiennej     *
* magazynowej (tekstowej) zmstawka. Zmienne zvat_a - zvat_f dostepne na       *
* starcie programu z pliku fs_setup                                           *
*******************************************************************************
FUNCTION VAT_LITERA(pprocent,pzwolniony)
local l_litera
do case
  case pprocent=0.and.pzwolniony
     l_litera="Z"  
  case pprocent=zvat_a
     l_litera="A"
  case pprocent=zvat_b
     l_litera="B"
  case pprocent=zvat_c 
     l_litera="C"
  case pprocent=zvat_d
     l_litera="D"
  case pprocent=zvat_e
     l_litera="E"
  case pprocent=zvat_f
     l_litera="F"	 	 	 	 	 
endcase
RETURN l_litera


*******************************************************************************
* Podliczenie wartosci netto, brutto io vatu dla kazdej stawki osobno oraz    *
* lacznie dla pliku klasy towbuf.dbf wedlug metody od wartosci netto          *
* Wynik umieszczony w zmiennych public: ztnet_a - ztnet_z, ztvat_a - ztvat_f  *
* ztbrut_a - ztbrut_f, ztnet_all, ztvat_all, ztbru_all, wymaga otwartego pliku*
*******************************************************************************
FUNCTION TPLIK_SUM(pwarunek)
local recno:=recno(),llitera,lwarunek:=pwarunek,ltcen
zplik_zer()  &&zerowanie wartosci netto, vatu oraz brutto dla wszystkich stawek
zdokile=0
zdokjm=space(3)
if zdtyp$importsad_gr
  sadplik_sum(lwarunek)
  return
endif

do case
 
  case zdtyp $ dok_brut_gr        &&Obliczane od wartosci BRUTTO
    *do while.not.eof()
	do while &pwarunek
	  zdokile=zdokile+til
	  zdokjm=tjm
	  ltcen=tcen
	    if (zdtyp$import_gr.or.zdtyp$eksport_gr).and.zw_dewizach
		  ltcen=tcen_dewiz
		endif
      do case
        case tzwolniony
		 ztbrut_z=ztbrut_z+kj_round(til*ltcen,2)		 		 		 		 		 		 
        case tstawka=zvat_a
		 ztbrut_a=ztbrut_a+kj_round(til*kj_round(brutto(ltcen,tstawka),2),2)
        case tstawka=zvat_b
		 ztbrut_b=ztbrut_b+kj_round(til*kj_round(brutto(ltcen,tstawka),2),2)		 
        case tstawka=zvat_c
		 ztbrut_c=ztbrut_c+kj_round(til*kj_round(brutto(ltcen,tstawka),2),2)		 
        case tstawka=zvat_d
		 ztbrut_d=ztbrut_d+kj_round(til*kj_round(brutto(ltcen,tstawka),2),2)
        case tstawka=zvat_e
		 ztbrut_e=ztbrut_e+kj_round(til*kj_round(brutto(ltcen,tstawka),2),2)		 
        case tstawka=zvat_f
		 ztbrut_f=ztbrut_f+kj_round(til*kj_round(brutto(ltcen,tstawka),2),2)		 

      endcase
      skip
    enddo
  if zdtyp$eksport_gr.or.zdtyp$bezvat_gr
    ztvat_a=0
    ztvat_b=0
    ztvat_c=0
    ztvat_d=0
    ztvat_e=0
    ztvat_f=0
  else
    ztvat_a=kj_round(ztbrut_a*zvat_a/(100+zvat_a),2)
    ztvat_b=kj_round(ztbrut_b*zvat_b/(100+zvat_b),2)
    ztvat_c=kj_round(ztbrut_c*zvat_c/(100+zvat_c),2)
    ztvat_d=kj_round(ztbrut_d*zvat_d/(100+zvat_d),2)
    ztvat_e=kj_round(ztbrut_e*zvat_e/(100+zvat_e),2)
    ztvat_f=kj_round(ztbrut_f*zvat_f/(100+zvat_f),2)
  endif
  ztnet_a=ztbrut_a-ztvat_a
  ztnet_b=ztbrut_b-ztvat_b
  ztnet_c=ztbrut_c-ztvat_c
  ztnet_d=ztbrut_d-ztvat_d
  ztnet_e=ztbrut_e-ztvat_e
  ztnet_f=ztbrut_f-ztvat_f
  ztnet_z=ztbrut_z-ztvat_z
  ztbrut_all=ztbrut_a+ztbrut_b+ztbrut_c+ztbrut_d+ztbrut_e+ztbrut_f+ztbrut_z
  ztvat_all=ztvat_a+ztvat_b+ztvat_c+ztvat_d+ztvat_e+ztvat_f
  ztnet_all=ztbrut_all-ztvat_all

  otherwise                  &&zdtyp $ dok_net_gr
	do while &pwarunek
	  zdokile=zdokile+til
	  zdokjm=tjm	  
	  ltcen=tcen
	    if (zdtyp$import_gr.or.zdtyp$eksport_gr).and.zw_dewizach
		  ltcen=tcen_dewiz
		endif
      do case
        case tzwolniony
	      ztnet_z=ztnet_z+kj_round(til*kj_round(ltcen,2),2)	  	  	  	  	  	  
        case tstawka=zvat_a
	      ztnet_a=ztnet_a+kj_round(til*kj_round(ltcen,2),2)
        case tstawka=zvat_b
	      ztnet_b=ztnet_b+kj_round(til*kj_round(ltcen,2),2)
        case tstawka=zvat_c
	      ztnet_c=ztnet_c+kj_round(til*kj_round(ltcen,2),2)
        case tstawka=zvat_d
	      ztnet_d=ztnet_d+kj_round(til*kj_round(ltcen,2),2)
        case tstawka=zvat_e
	      ztnet_e=ztnet_e+kj_round(til*kj_round(ltcen,2),2)
        case tstawka=zvat_f
	      ztnet_f=ztnet_f+kj_round(til*kj_round(ltcen,2),2)
      endcase
      skip
    enddo
    if zdtyp$eksport_gr.or.zdtyp$bezvat_gr
	  ztvat_a=0
      ztvat_b=0
      ztvat_c=0
      ztvat_d=0
      ztvat_e=0
      ztvat_f=0
	else
	  ztvat_a=kj_round(ztnet_a*zvat_a/100,2)
      ztvat_b=kj_round(ztnet_b*zvat_b/100,2)
      ztvat_c=kj_round(ztnet_c*zvat_c/100,2)
      ztvat_d=kj_round(ztnet_d*zvat_d/100,2)
      ztvat_e=kj_round(ztnet_e*zvat_e/100,2)
      ztvat_f=kj_round(ztnet_f*zvat_f/100,2)
    endif
	ztbrut_a=ztnet_a+ztvat_a
    ztbrut_b=ztnet_b+ztvat_b
    ztbrut_c=ztnet_c+ztvat_c
    ztbrut_d=ztnet_d+ztvat_d
    ztbrut_e=ztnet_e+ztvat_e
    ztbrut_f=ztnet_f+ztvat_f
    ztbrut_z=ztnet_z
	ztnet_all=ztnet_a+ztnet_b+ztnet_c+ztnet_d+ztnet_e+ztnet_f+ztnet_z
    ztvat_all=ztvat_a+ztvat_b+ztvat_c+ztvat_d+ztvat_e+ztvat_f 
    ztbrut_all=ztnet_all+ztvat_all  
  
endcase
go recno
RETURN nil


*******************************************************************************
* WYDRUK                                                                      *
*******************************************************************************
*******************************************************************************
* Wydruk dokumentow                                                           *
*******************************************************************************
FUNCTION DOK_DRUK(pplik,pdok)
*local ilosc:=1,plik:="wydruki\nowy.txt",select:=select(),ek
local plik:="wydruki\nowy.txt",select:=select(),ek
local ldarchiwum:=zdarchiwum,ldokplik:=""
local lw_dewizach:=zw_dewizach
local lplik:=pplik, ldok:=pdok
private k:=1,vdok:=pdok,ilosc:=1
*set default to shset


set default to &set_serwer
select &buf_sel

if.not.used()
        if.not.kj_use("towbuf",.t.,3)
	      return
	    else
		  set index to towbuf
		endif  
endif

if zdtyp$bezvat_gr
  vcol=20
else
  vcol=5
endif  
strona=1
stro=.f.
if.not.zwindruk
  if pplik
    plik="wydruki\dokument.txt"
    set printer to &plik
  else
  * port_def()
    if.not.pstart_druk()
      dok_default() 
      select &select
      set device to screen
 	  return .f.
  *  else
  *    port_def()
    endif
  endif
endif
**
if zdtyp$kasa_gr.and..not.zkasarchiwum
  zdarchiwum=.f.
endif  
zw_dewizach:=.t.
dok_licz(zdndow,.f.)
zw_dewizach:=lw_dewizach
if tow_use(.f.)
  seek zdndow
  if.not.found()
    kj_tkom(12," Uwaga! ","Dokument nie zostaà poprawnie zapami©tany","lub nast•piào rozindeksowanie bazy danych","Przeprowad´ indeksacj© i ponow pr¢b©",5)
  endif
endif  
if zdtyp$kasa_gr.and..not.zkasarchiwum
  zdarchiwum=ldarchiwum
endif  

if zpapier_typ=1.and..not.zdtyp$kasa_gr
  ilosc=2
endif
if zpapier_typ=3.and..not.zdtyp$kasa_gr
  ilosc=3
endif
set device to screen
if zilosc_def.and..not.pplik.and..not.zwindruk
  set cursor on
  @ 20,1 clear to 23,78
  @ 21,28 to 23,52
  ilosc=ilosc-1
  @ 22,30 say "IloòÜ kopii ... "   
  @ 22,46 get ilosc picture "99" when s_kom("Wydrukowany zostanie oryginaà oraz podana tu iloòÜ kopii")
  read
  ilosc=ilosc+1
  if ilosc>1
    zpapier_typ=1
  else
    zpapier_typ=0
  endif
  set cursor off
endif



if zwindruk
  dok_win_druk(lplik,ldok)
  close
  select &select
  return
endif




set device to printer
w=prow()
@ prow(),pcol() say &zdr_kond

do case
  * Wzorzec: Rozliczenie faktury exportowej (importowej) dla cel¢w pod. dochod.
  case zdtyp$kasa_gr
    kasa_druk(ilosc)
  case (zdtyp$import_gr.or.zdtyp$eksportsad_gr).and..not.zdtyp$kormag_gr
    rozlicz_druk(ilosc)	
  otherwise          &&wzorzec standartowy
    do while.t.
      dok_tyt()  
      if.not.zdtyp$bezdokkto_gr
	    if.not.zdtyp$dowodwew_gr
		  w=w+2
		endif  
        dok_kto()
      endif
*
      if zdtyp$opisdok_gr.and.zopisdok=1
	    if.not.empty(zdopis1).and..not.zdznak$zkordok_znak
		  w=w+1
		  *@ w,0 say &zdr_kkond+zdopis1+&zdr_kond 
		  @ w,10 say zdopis1+&zdr_kond 
		endif
	    if.not.empty(zdopis2)
		  w=w+1
		  *@ w,0 say &zdr_kkond+zdopis2+&zdr_kond 
		  @ w,10 say zdopis2+&zdr_kond 
		endif
	    if.not.empty(zdopis3)
		  w=w+1
		  *@ w,0 say &zdr_kkond+zdopis3+&zdr_kond 
		  @ w,10 say zdopis3+&zdr_kond 
		endif				
	  endif
*
	  w=w+2
      if zdznak $ zkordok_znak
	    tow_kdruk()
	  else
	    tow_druk()
      endif
	  w=w+1
      stopa()
	  if.not.empty(zopis2_dok)
        w=w+1
        if zdznak $ zkordok_znak
		  @ w,0 say &zdr_kond + zopis2_dok
		else
		  @ w,0 say &zdr_kond + zopis2_dok + &zdr_kkond
		endif  
      endif
	  w=w+1
	  if zdznak $ zkordok_znak
	    w=w+1
		kor_txt()
	  else
	    if.not.zdtyp$importsad_gr.and..not.zdznak$zwymian_znak
		  if.not.zdtyp$przes_gr.and..not.zdtyp$dowodwew_gr.and..not.zdtyp$bo_gr.and..not.zdtyp$bezdozaplaty_gr
		    zaplacono()
		  
		    w=w+1
	        if zdtyp$eksport_gr
		      do case
			    case zpolznak="L"
			      p_slownie(zdwaluta,"")
			    case zpolznak=" "
			      empty_p_slownie(zdwaluta,"")
			    case zpolznak="M"
			      maz_p_slownie(zdwaluta,"")								
			  endcase
		    else
		      if.not.zdtyp$przes_gr.and..not.(zdtyp$dowod_gr.and.zwz_bezcen).and..not.zdtyp$bo_gr 
		        do case
			      case zpolznak=" "
			        empty_slownie()
			      case zpolznak="L"
			        slownie()
			      case zpolznak="M"
			        maz_slownie()				  				  
			    endcase	  
			  endif  
		    endif	
		  endif	
		endif  
	  endif
	  if.not.empty(op_txt10).and.zdsposzap$"PO".and.zop_txt10
        w=w+1
  	    @ w,5 say &zdr_kond + op_txt10 
      endif 
      if zdtyp$opisdok_gr.and.zopisdok=2
	    if.not.empty(zdopis1).and..not.zdznak$zkordok_znak
		  w=w+1
		  *@ w,0 say &zdr_kkond+zdopis1+&zdr_kond 
		  @ w,10 say zdopis1+&zdr_kond 
		endif
	    if.not.empty(zdopis2)
		  w=w+1
		  *@ w,0 say &zdr_kkond+zdopis2+&zdr_kond 
		  @ w,10 say zdopis2+&zdr_kond 
		endif
	    if.not.empty(zdopis3)
		  w=w+1
		  *@ w,0 say &zdr_kkond+zdopis3+&zdr_kond 
		  @ w,10 say zdopis3+&zdr_kond 
		endif				
	  endif
	  if .not.zdznak$zwymian_znak
	    podpis()
	  endif	
	  if.not.empty(zopis3_dok)
        w=w+2
  	    @ w,0 say &zdr_kond + zopis3_dok + &zdr_kkond
      endif 
	  if.not.empty(opisd_1)
        w=w+1
  	    @ w,5 say &zdr_kond + opisd_1 +opisd_2
      endif 
	  if.not.empty(opisd_3)
        w=w+1
  	    @ w,5 say &zdr_kond + opisd_3 +opisd_4
      endif 
	  if.not.empty(opisd_5)
        w=w+1
  	    @ w,5 say &zdr_kond + opisd_5 +opisd_6
      endif 	  	  
        if zpotwierdzenie="3"
		  w=w+2
*		  @ prow(),pcol() say &zdr_kkond
		  @ w,0 say replicate("-",130)
		  w=w+2
          @ w,5 say "Potwierdzam odbi¢r towar¢w zgodnie ze specyfikacj•"
          @ w,70 say "Podpis osoby"
		  w=w+1
          if zdtyp$sprzedaz_gr
		    @ w,5 say "zawart• w treòci faktury Nr "+zdndok
		  else
		    @ w,5 say "zawart• w treòci dokumentu Nr "+zdndok
		  endif	
		  @ w,70 say "upowaænionej do odbioru towar¢w ............................."		  
		endif
        eject
      k=k+1
      if k>ilosc
        exit
      else
        *dok_use()
		tow_use(.f.)
	    seek zdndow
	    w=prow()
	  endif	
    enddo
endcase	
if zpotwierdzenie ="2"
* Tworzenie odr©bnego wydruku potwierdzenia odbioru towar¢w"
  set device to screen
  if kj_gkom(12,"","DrukowaÜ potwierdzenie odbioru towar¢w ?","",.t.,25)  
    set device to printer
	w=prow()
	if data_po_lewej=1
	  @ w,5 say "Data wystawienia:"+dtoc(zddatdok)+&zdr_kkond+&zdr_grubo
	else
	  @ w,75 say "Data wystawienia: "+dtoc(zddatdok)+&zdr_kkond+&zdr_grubo
	endif  
    w=w+2
	@ w,25 say "POTWIERDZENIE ODBIORU TOWAR‡W"
	w=w+1
	@ W,25 say "============================="+&zdr_kgrubo	
	w=w+3
	@ w,15 say "Potwierdzam odbi¢r towar¢w zgodnie ze specyfikacj•"
	w=w+1
	if zdtyp$sprzedaz_gr
	  @ w,15 say "zawart• w treòci faktury Nr "+zdndok
	else
	  @ w,15 say "zawart• w treòci dokumentu Nr "+zdndok
	endif  
	w=w+4
	@ w,15 say "Podpis osoby"
    w=w+1
	@ w,15 say "upowaænionej do odbioru towar¢w ..................."
	eject
  endif	
endif
set device to screen
if pplik.and.dok_ekran=1
  save screen to ek
  edi=edit+" wydruki\dokument.txt"
  run &edi 
  restore screen from ek
  set cursor off   
endif
if pplik
  if.not.empty(zdok_path).and.zdtyp$sprzedaz_gr
    ldokplik=zdok_path+"\dokument.txt"
    copy file "wydruki\dokument.txt" to (ldokplik)
  endif
endif
close
select &select
RETURN nil


FUNCTION KOR_TXT()
@ w,5 say "Przyczyna korekty:  "+zdopis1
w=w+2
do case
  case ztnet_all<0
    @ w,5 say kwota_zmniejszenia
	@ w,40 say str(-1*ztnet_all)+ kor_zl+ "    "
	do case
	  case zpolznak="L"
	    pslownie(prow(),pcol(),-1*ztnet_all)
	  case zpolznak=" "
	    empty_pslownie(prow(),pcol(),-1*ztnet_all)		
	  case zpolznak="M"
	    maz_pslownie(prow(),pcol(),-1*ztnet_all)		
	endcase
  case ztnet_all=0
    @ w,5 say korekta_bez_wplywu
  case ztnet_all>0
    @ w,5 say kwota_zwiekszenia
	@ w,40 say str(ztnet_all)+ kor_zl+ "    "
	do case
	  case zpolznak="L"
	    pslownie(prow(),pcol(),ztnet_all)
	  case zpolznak=" "
	    empty_pslownie(prow(),pcol(),ztnet_all)
	  case zpolznak="M"
	    maz_pslownie(prow(),pcol(),ztnet_all)				
	endcase
endcase
w=w+1
do case
  case ztvat_all<0
    @ w,5 say vat_zmniejszenia
	@ w,40 say str(-1*ztvat_all)+ kor_zl+ "    "
	do case
	  case zpolznak="L"
	    pslownie(prow(),pcol(),-1*ztvat_all)
	  case zpolznak=" "
	    empty_pslownie(prow(),pcol(),-1*ztvat_all)
	  case zpolznak="M"
	    maz_pslownie(prow(),pcol(),-1*ztvat_all)				
	endcase
  case ztvat_all=0
    @ w,5 say vat_bez_wplywu
  case ztvat_all>0
    @ w,5 say vat_zwiekszenia
	@ w,40 say str(ztvat_all)+ kor_zl+ "    "
	do case
	  case zpolznak="L"
	    pslownie(prow(),pcol(),ztvat_all)
	  case zpolznak=" "
	    empty_pslownie(prow(),pcol(),ztvat_all)
	  case zpolznak="M"
	    maz_pslownie(prow(),pcol(),ztvat_all)				
	endcase
endcase
w=w+1
do case
  case ztbrut_all<0
    @ w,5 say brut_zmniejszenia
	@ w,40 say str(-1*ztbrut_all)+ kor_zl+ "    "
	do case
	  case zpolznak="L"
	    pslownie(prow(),pcol(),-1*ztbrut_all)
	  case zpolznak=" "
	    empty_pslownie(prow(),pcol(),-1*ztbrut_all)
	  case zpolznak="M"
	    maz_pslownie(prow(),pcol(),-1*ztbrut_all)				
	endcase
  case ztbrut_all=0
    @ w,5 say brut_bez_wplywu
  case ztbrut_all>0
    @ w,5 say brut_zwiekszenia
	@ w,40 say str(ztbrut_all)+ kor_zl+ "    "
	do case
	  case zpolznak="L"
	    pslownie(prow(),pcol(),ztbrut_all)
	  case zpolznak=" "
	    empty_pslownie(prow(),pcol(),ztbrut_all)
	  case zpolznak="M"
	    maz_pslownie(prow(),pcol(),ztbrut_all)				
	endcase
endcase
RETURN


FUNCTION DOK_TYT()
local ltyt:="",lrep:=len(alltrim(ztyt_dok))+18+len(alltrim(zdndow))+len(alltrim(zlaman_dok))
*lrep:=len(alltrim(ztyt_dok))+20+len(alltrim(zlaman_dok))
local ltyt_dok:="",ldata:="",lkol:=0
local ldotyczy:=space(120),ldndok:=""
do case
  case zdtyp$sprzedaz_gr
    ltyt_dok="Wydanie zewn©trzne   W Z "
	ldata=data_sprzedazy
	if zmiesiac_sprzed=1
	  ldata="Miesi•c i rok sprzedaæy: "
	endif
  case zdtyp$zakup_gr
    ltyt_dok="Przyj©cie zewn©trzne   P Z "	
	ldata="Data zakupu: "
endcase
do case
  case zdtyp$importsad_gr
    lkol=80-len(alltrim(zmiasto))-33
	*@ w,lkol say &zdr_kkond+&zdr_grubo+alltrim(zmiasto)+"    Data ksi©gowania: "+dtoc(zddatdok)    
	@ prow(),pcol() say &zdr_kkond+&zdr_grubo
	@ w,lkol say alltrim(zmiasto)+data_ksiegow+dtoc(zddatdok)    
  otherwise
    if data_po_lewej=1
	  @ w,5 say "Data wystawienia:"+&zdr_kkond+&zdr_grubo
	else
	  @ w,75 say "Data wystawienia:"+&zdr_kkond+&zdr_grubo
	endif  
    if zdtyp$dowod_gr.or..not.vdok
      @ w,pcol()+2 say zddatdow
    else
      @ w,pcol()+2 say zddatdok
    endif
    @ prow(),pcol() say &zdr_kgrubo+&zdr_kond
    if.not.zdtyp$proform_gr
	  w=w+1
	  if data_po_lewej=1
	    @ w,4 say ldata
	  else
	    @ w,74 say ldata
	  endif  
      if zmiesiac_sprzed=1
	    @ w,pcol() say substr(dtoc(zddatsp),4)+ " / "+zmiasto
	  else
	    @ w,pcol() say dtoc(zddatsp)+ " / "+zmiasto
	  endif  
	endif  
endcase
**
if.not.zdtyp$proform_gr
  if numer_zam_op.and.zzam_num=1
    w=w+1
    if data_po_lewej=1
      @ w,4 say "Numer zam¢wienia: "+zdnumer_zam
    else
      @ w,74 say "Numer zam¢wienia: "+zdnumer_zam
    endif	
  endif
endif
**
@ prow(),pcol() say &zdr_grubo+&zdr_kkond 
if stro
  @ prow(),pcol() say &zdr_kgrubo+&zdr_kond
  w=w+1
  @ w,0 say "Strona:"
  @ w,9 say strona picture "999"
  @ prow(),pcol() say &zdr_grubo+&zdr_kkond
  w=w+1
else
  w=w+2
endif  

if zdtyp$dowod_gr.or..not.vdok
  @ w,round((80-lrep)/2,0) say alltrim(ltyt_dok)+"  NR  "+alltrim(zdndow)
else
  ldndok=kj_doknumer(zdndok)

  @ w,round((80-lrep)/2,0) say alltrim(ztyt_dok)+"  NR  "+alltrim(ldndok)
endif
*if.not.empty(zopis1_dok)
*  w=w+2
*  @ w,round((80-lrep)/2,0) say alltrim(zopis1_dok)
*  w=w+1
*endif

*if.not.empty(zdndok)
*  @ w,round((80-lrep)/2,0) say alltrim(ztyt_dok)+"  NR "+zdndok+zlaman_dok
*else
*  @ w,round((80-lrep)/2,0) say alltrim(ztyt_dok)+"  NR "+zdndow+zlaman_dok
*endif  
pcol=pcol()
w=w+1
*@ w,24 say replicate(chr(61),pcol-24)
@ w,round((80-lrep)/2,0) say replicate(chr(61),lrep)+&zdr_kgrubo
if zdtyp$importsad_gr
  w=w+1
  if.not.empty(zdopis3)
    ldotyczy="Dotyczy faktur:                                                                                  "  
    ldotyczy=stuff(ldotyczy,18,80,zdopis3)
	ldotyczy=alltrim(ldotyczy)
	kol=round((130-len(ldotyczy))/2,0)
	@ w,0 say &zdr_kond
	@ w,kol say ldotyczy+&zdr_kkond
  endif
  w=w+2
  @ w,round((80-lrep)/2,0) say "NUMER DOKUMENTU  S A D :  " +zsad_numer
endif
w=w+1
if zdznak $ zkordok_znak
*  @ w,round((80-lrep)/2,0) say "Dotyczy dokumentu Nr  "+zdkordok
  @ w,round((80-lrep)/2,0) say "Dotyczy dokumentu Nr  "+zdnskrot
endif
if.not.zdtyp$dowod_gr.and..not.vdok
  w=w+1
  @ prow(),pcol() say &zdr_kond
  @ w,35 say "Dotyczy dokumentu:  "+alltrim(ztyt_dok)+"  Nr  "+alltrim(zdndok)+"  z dnia  "+dtoc(zddatdok)
endif
if.not.zdtyp$importsad_gr
  @ prow(),pcol() say &zdr_kond
  w=w+2
  @ prow(),pcol() say &zdr_kond
  if.not.piecz_druk=0.and..not.zdtyp$przes_gr
    @ w,7 say ".............................."
  endif
  do case
    case zpapier_typ=1.or.zpapier_typ=3
      if k=1
        @ w,50 say "O R Y G I N A ù"
      else
        @ w,50 say "K O P I A"
      endif  
    case zpapier_typ=2
      @ w,50 say "ORYGINAL - bialy        KOPIA - kolor"	
  endcase
  w=w+1
  if.not.piecz_druk=0.and..not.zdtyp$przes_gr
    @ w,7 say pieczec_sprzedawcy
  endif	
  if zdtyp$przes_gr
    @ w,5 say alltrim(zlic1)+"  "+alltrim(zlic2)
  endif	
else
  w=w+2
  @ W,0 say &zdr_kond
  do case
    case zpapier_typ=1
      if k=1
        @ w,50 say "O R Y G I N A ù"
      else
        @ w,50 say "K O P I A"
      endif  
    case zpapier_typ=2
      @ w,50 say "ORYGINAL - bialy        KOPIA - kolor"
  endcase
  @ w,0 say &zdr_kkond
endif
if zduplikat
  @ w,50 say "D U P L I K A T"
endif
RETURN


FUNCTION DOK_KTO()
local ld1,lnip_len:=0
local llic1:=zlic1,llic2:=zlic2,llic3:=zlic3,llic4:=zlic4
local llic5:=zlic5,llic6:=zlic6,llic_regon:=zlic_regon
local llic_tel:=zlic_tel,llic_fax:=zlic_fax
ld1="S P R Z E D A W C A  :                 N A B Y W C A  :                         "
if.not.empty(zonaz1).or..not.empty(zonaz2).or..not.empty(zomiasto).or..not.empty(zoulica)
  ld1="S P R Z E D A W C A  :                 P ù A T N I K  :                         "
endif
if zdtyp$zakup_gr
  ld1="N A B Y W C A  :                       S P R Z E D A W C A  :                   "
endif
if zdtyp$bezkontrah_gr
  ld1="S P R Z E D A W C A  : "
endif
if zdtyp$przes_gr
  ld1="MAGAZYN WYDAJ§CY TOWAR:              MAGAZYN DOCELOWY:                        "
  if zdtyp$zakup_gr
    ld1="MAGAZYN PRZYJMUJ§CY TOWAR:           MAGAZYN WYDAJ§CY TOWAR:                  "  
  endif
  llic1=wknaz1
  llic2=wknaz2
  llic5=wkulica
  llic3=wkkod
  llic4=wkmiasto
  llic6=wknip
  llic_regon=""
  llic_tel=wktel
  llic_fax=wkfax
endif
if zdtyp $ dowodwew_gr
  ld1="                       "
endif
@ prow(),pcol() say &zdr_grubo+&zdr_kkond
if.not.zkon_grubo
  @ w,3 say ld1+&zdr_kgrubo+&zdr_kond
else
  @ w,3 say ld1+&zdr_kond
endif  
*if zdtyp$sprzedaz_gr.and.(.not.empty(zkuzyt_last).or..not.empty(zktime_last))
if zdtyp$sprzedaz_gr.and.zpietruszka
  w=w+1
  @ w,5 say zktime_txt_last+"   "+zktime_last
  @ w,70 say zkuzyt_txt_last+"   "+zkuzyt_last
endif
if.not.zdtyp$dowodwew_gr
  w=w+1
  @ w,5 say llic1
  @ w,70 say zknaz1
  w=w+1
  @ w,5 say llic2
  @ w,70 say zknaz2
  w=w+1
  @ w,5 say llic5
  @ w,70 say zkulica
  w=w+1
  @ w,5 say llic3
  @ w,13 say llic4
  @ w,70 say zkkod
  if empty(zkkod).or.alltrim(zkkod)=="-"
    @ w,70 say zkmiasto
  else
    @ w,78 say substr(zkmiasto,1,48)
  endif 
  w=w+1
  if.NOT.zdtyp$przes_gr
  
    @ w,5 say "NIP:"
    if zdtyp$eksport_ue_gr
	  @ w,10 say nip_pl()
	else
	  @ w,10 say substr(llic6,1,13)
	endif  
    @ w,30 say "Regon: "+llic_regon
    if z56_kontrah
	 * @ w,70 say nip_nabywcy
     * lnip_len=len(alltrim(nip_nabywcy))
	  if.not.zkon_grubo
	   * @ w,70 + lnip_len  say substr(zknip,lnip_len+1,56-lnip_len)
	    @ w,70 say zknip
	  else
	   * @ w,70 + lnip_len  say substr(zknip,lnip_len+1,56-lnip_len)+&zdr_kgrubo
	    @ w,70 say zknip+&zdr_kgrubo
*	    @ w,84 say zknip+&zdr_kgrubo
	  endif  
	else
	  @ w,70 say "NIP nabywcy: "+substr(zknip,1,13)
	endif  
  endif
  w=w+1
  do case
    case.not.empty(llic_tel).and..not.empty(llic_fax).and..not.llic_tel=llic_fax
      @ w,5 say "Tel:"
	  @ w,10 say alltrim(llic_tel)
	  @ w,pcol()+3 say "Fax:"
	  @ w,pcol()+2 say alltrim(llic_fax)
    case.not.empty(llic_tel).and..not.empty(llic_fax).and.llic_tel=llic_fax
      @ w,5 say "Telefon/Fax:"
	  @ w,18 say llic_tel
    case.not.empty(llic_tel).and.empty(llic_fax)
      @ w,5 say "Telefon:"
	  @ w,14 say llic_tel
    case empty(llic_tel).and..not.empty(llic_fax)
      @ w,5 say "Fax:"
	  @ w,10 say llic_fax
  endcase
  if.not.empty(zktel)
    @ w,70 say "Telefon:"+"  "+zktel
  endif
  if zdsposzap$"PO".and..not.zdtyp$bezkonto_gr
    w=w+1
    if empty(substr(zwalut_dok,2,1))
      @ w,5 say alltrim(konto_sprzedawcy)+&zdr_grubo+"  "+zlic_konto+&zdr_kgrubo
    else
      @ w,5 say alltrim(konto_sprzedawcy)+&zdr_grubo+"  "+wkonto()+&zdr_kgrubo
    endif	
  endif
if.not.empty(zonaz1).or..not.empty(zonaz2).or..not.empty(zomiasto).or..not.empty(zoulica)
  w=w+2
  @ w,5 say "O D B I O R C A : "
  if.not.empty(zonaz1).or..not.empty(zonaz2)
    w=w+1
    @ w,7 say alltrim(zonaz1)+"   "+alltrim(zonaz2)
  endif	
  if.not.empty(zoulica).or..not.empty(zomiasto)
    w=w+1
    @ w,7 say alltrim(zoulica)+"    "+zokod+"   "+zomiasto
  endif	  
  if.not.empty(zotel).or..not.empty(zofax)
    w=w+1
    @ w,7 say "Tel. "+alltrim(zotel)+"    Fax. "+alltrim(zofax)
  endif	  
endif

  if.not.zdznak$zkordok_znak.and..not.empty(zopis1_dok)
    w=w+2
    do case
      case substr(zopis1_dok,1,1)="K".and.substr(zopis1_dok,2,1)="G"
        @ w,0 say &zdr_kond+&zdr_grubo + substr(zopis1_dok,4) + &zdr_kgrubo 	
      case substr(zopis1_dok,1,1)="K"
        @ w,0 say &zdr_kond + substr(zopis1_dok,4)
      case substr(zopis1_dok,2,1)="G"
        @ w,0 say &zdr_kkond+&zdr_grubo + substr(zopis1_dok,4) +&zdr_kond + &zdr_kgrubo 		  
      otherwise
	    @ w,0 say &zdr_kond + substr(zopis1_dok,4) +&zdr_kond  		  
    endcase
  endif
 
else
  @ w,5 say alltrim(llic1)+"    "+alltrim(llic2)
  w=w+1
  @ w,5 say alltrim(llic5)+"    "+alltrim(llic3)+"  "+alltrim(llic4)
  w=w+1
  @ w,5 say "NIP:  "+substr(llic6,1,13)+"    Regon:   "+llic_regon +space(42)+replicate("_",19)
  w=w+1
  @ w,91 say "Piecz©Ü firmowa"   
endif
RETURN nil

*******************************************************************************
* Funkcja drukuje zawartosc pliku tow_buf                                     *
*******************************************************************************
FUNCTION TOW_DRUK()
local lt1:="========================================================================================================================="
lp=0
tow_tyt()
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
    poz_druk()
    w=w+1
    skip  
  enddo
else
  do while alltrim(tndow)==alltrim(zdndow)
    ztow_lad()
	if.not.ztwyroznik="o"
	  lp=lp+1
	endif       
	poz_druk()
    w=w+1
    skip  
  enddo
endif  
if zdtyp$bezvat_gr
  @ w,vcol say substr(d_plotek(lt1,plotek_poziom),1,80)
else
  @ w,vcol say d_plotek(lt1,plotek_poziom)
endif  
RETURN nil

*******************************************************************************
* Funkcja drukuje zawartosc pliku tow_buf w dokumencie koryguj•cym                                     *
*******************************************************************************
FUNCTION TOW_KDRUK()
local lt1:="========================================================================================================================="
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


FUNCTION TOW_TYT()
local lt1:="========================================================================================================================="
*local lt2:="|Lp.|          N A Z W A             |  ILOóè   |Jm.|  CENA    |  WARTOSC  |St.|  PODATEK  |  WARTOSC   |    SYMBOL     |"
*local lt3:="|   |  wyrobu  towaru  lub  usàugi   |          |   |  NETTO   |   NETTO   | % |   V A T   |  BRUTTO    |    PKW i U    |"
local lt2:=wartosc
local lt3:="|   |         T O W A R U            |          |   |  NETTO   |   NETTO   | % |   V A T   |  BRUTTO    |    PKW i U    |"
*local lt3:=uslugi
local lt4:="|===|================================|==========|===|==========|===========|===|===========|============|===============|"
local lt5:="|                                                                                                                       |"
local lnv1:=space(92)
local lnv2:=space(92)
local lnv3:=space(92)
local lnv4:=space(92)
local lnv5:=space(92)
if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
  if zdtyp$dok_brut_gr
    lt3:="|   |         T O W A R U            |          |   |  BRUTTO  |   NETTO   | % |   V A T   |  BRUTTO    |               |"
  else
    lt3:="|   |         T O W A R U            |          |   |  NETTO   |   NETTO   | % |   V A T   |  BRUTTO    |               |"  
  endif	
endif
if zpoz_rabat
  lt3="|   |         T O W A R U            |          | m.|  JEDNOSTKOWA  |   NETTO   | % |   V A T   |  BRUTTO    |    %     |"
  wartosc:="|Lp.|          N A Z W A             |  ILOóè   |Jm.|   CENA   |  WARTOóè  |St.|  PODATEK  |  WARTOóè   |     RABAT     |"
  lp_ramka:="|Lp.|          N A Z W A             |  ILOóè   |J. |   CENA   |  WARTOóè  |St.|   W tym   |  WARTOóè   |     RABAT     |"
  if zdtyp$dok_brut_gr
     lp1_ramka:="|   |  wyrobu  towaru  lub  usàugi   |          |   |  BRUTTO  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |      %        |"	
  else
    lp1_ramka:="|   |  wyrobu  towaru  lub  usàugi   |          |   |  NETTO   |BRUTTO-VAT | % |   V A T   |  BRUTTO    |      %        |"	
  endif	 
  do case
    case empty(zpolznak)
      wartosc="|Lp.|          N A Z W A             |  ILOSC   |Jm.|   CENA   |  WARTOSC  |St.|  PODATEK  |  WARTOSC   |     RABAT     |"		      
      lp_ramka="|Lp.|          N A Z W A             |  ILOSC   |J. |   CENA   |  WARTOSC  |St.|   W tym   |  WARTOSC   |     RABAT     |"
      if zdtyp$dok_brut_gr
	    lp1_ramka="|   |  wyrobu  towaru  lub  uslugi   |          |   |  BRUTTO  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |      %        |"
      else
	    lp1_ramka="|   |  wyrobu  towaru  lub  uslugi   |          |   |  BRUTTO  |BRUTTO-VAT | % |   V A T   |  NETTO     |      %        |"
	  endif		
    case zpolznak="M"
      wartosc="|Lp.|          N A Z W A             |  ILOòï   |Jm.|   CENA   |  WARTOòï  |St.|  PODATEK  |  WARTOòï   |     RABAT     |"	
      lp_ramka="|Lp.|          N A Z W A             |  ILOòï   |J. |   CENA   |  WARTOòï  |St.|   W tym   |  WARTOòï   |     RABAT     |"
      if zdtyp$dok_brut_gr
	    lp1_ramka="|   |  wyrobu  towaru  lub  usíugi   |          |   |  BRUTTO  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |      %        |"
      else
	    lp1_ramka="|   |  wyrobu  towaru  lub  usíugi   |          |   |  NETTO   |BRUTTO-VAT | % |   V A T   |  BRUTTO    |      %        |"
	  endif		
  endcase
  lt2=wartosc

endif
 

if zrozmiar
  lt2=towar
  if zdtyp$dok_brut_gr
    lt3="|   |  nazwa  /  kolor  /  rozmiar   |          | m.|  BRUTTO  |   NETTO   | % |   V A T   |  BRUTTO    |    PKW i U    |"
  else
    lt3="|   |  nazwa  /  kolor  /  rozmiar   |          | m.|  NETTO   |   NETTO   | % |   V A T   |  BRUTTO    |    PKW i U    |"
  endif	
  if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
    lt2:="|Lp.|          T O W A R             |  ILOóè   |Jm.|   CENA   |  WARTOóè  |St.|  PODATEK  |  WARTOóè   |     K T M     |"
    lt3="|   |  nazwa  /  kolor  /  rozmiar   |          | m.|   NETTO  |   NETTO   | % |   V A T   |  BRUTTO    |               |"  
  endif
endif
if zdtyp $ bezvat_gr
   lp_ramka="|Lp.|          N A Z W A             |  ILOóè   |Jm |  C E N A |    WARTOóè    |"
   lp1_ramka="|   |        T O W A R U             |          |   | JEDNOSTK.|   SPRZEDAΩY   |"
   lt2:=lp_ramka
   lt3:=lp1_ramka
endif

do case
  case zdtyp$dok_brut_gr.and..not.zrozmiar
    lt2:=lp_ramka
    lt3:=lp1_ramka
  case zdtyp$dok_brut_gr.and.zrozmiar
    lt2:=r_ramka
    lt3:="|   |  nazwa  /  kolor  /  rozmiar   |          | m.|  BRUTTO  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |    PKW i U   |"	
    if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
      lt2:="|Lp.|          T O W A R             |  ILOóè   |Jm.|   CENA   |  WARTOóè  |St.|   W tym   |  WARTOóè   |     K T M     |"
      lt3:="|   |  nazwa  /  kolor  /  rozmiar   |          | m.|   BRUTTO |BRUTTO-VAT | % |   V A T   |  BRUTTO    |               |"	
	endif
endcase

@ prow(),pcol() say &zdr_kond
if zdtyp$bezvat_gr
  lt1=substr(lt1,1,80)
  lt2=substr(lt2,1,80)
  lt3=substr(lt3,1,80)
  lt4=substr(lt4,1,80)
  lt5="|                                                                               |"
  @ w,vcol say lt1
  w=w+1
  @ w,vcol say substr(d_plotek(lt2,plotek),1,80)
  w=w+1
  @ w,vcol say substr(d_plotek(lt3,plotek),1,80)
  w=w+1
  *@ w,vcol say lt4
    @ w,vcol say substr(d_plotek(lt4,plotek_poziom),1,80)
  w=w+1
  @ w,vcol say substr(d_plotek(lt5,plotek),1,80)
else
  @ w,vcol say lt1
  w=w+1
  @ w,vcol say d_plotek(lt2,plotek)
  w=w+1
  @ w,vcol say d_plotek(lt3,plotek)
  w=w+1
  *@ w,vcol say lt4
  if zdtyp$bezvat_gr
    @ w,vcol say substr(d_plotek(lt4,plotek_poziom),1,80)
  else
    @ w,vcol say d_plotek(lt4,plotek_poziom) 
  endif
  w=w+1
  @ w,vcol say d_plotek(lt5,plotek)
endif


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
    @ w,vcol+120 say plotek  
  otherwise  
    @ w,vcol+1 say lp picture"999"
*    if zrozmiar.and..not.zdtyp$dowod_gr.and.vdok.and..not.zdznak$zwymian_znak
*      @ w,vcol+5 say substr(ztnaz,1,32)
*    else
*      @ w,vcol+5 say ztnaz
*    endif
    if zrozmiar.and.zdtyp$dowod_gr.or.zdznak$zwymian_znak.or.(zrozmiar.and..not.vdok) 
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
		else
		  if zkreskadruk.and.(zdtyp$dowod_gr.or.zdok_dowod)
		    lwiersz_dodatkowy:=.t.
		    if len(alltrim(lnaz))<17
		      lwiersz_dodatkowy:=.f.
		      lnaz=stuff(space(32),1,len(alltrim(lnaz)),alltrim(lnaz))
		      lnaz=stuff(lnaz,18,2,"k:")
			  lnaz=stuff(lnaz,20,len(alltrim(ztpasek)),alltrim(ztpasek))
		    endif		
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
          @ w,vcol+53 say round(tbrutto(ltcen,ztstawka),2) picture "9999999.99"
	      @ w,vcol+64 say lnet picture "99999999.99"
	      if.not.ztzwolniony
		    @ w,vcol+77 say ztstawka picture "99"
		  else
		    @ w,vcol+77 say "zw."
		  endif	
	      @ w,vcol+80 say lvat picture "99999999.99"
	      @ w,vcol+92 say lbrut picture "99999999.99"	
          if zpoz_rabat
		    @ w,vcol+105 say ztil_dost picture "999.9999"
		  else
		    if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
		      @ w,vcol+105 say ztkod   
		    else
		      if .not.zpkw_i_u
			    @ w,vcol+105 say substr(ztsymbol,1,10)
			  else
			    @ w,vcol+105 say substr(ztsymbol,1,15)
			  endif	
		    endif	
		  endif  
          @ w,vcol+120 say plotek	
        otherwise                             &&zdtyp$dok_net_gr
          if zdtyp$importsad_gr
	        lnet=round(ltcen,2)
	        lvat=round(tn_vat(lnet,ztstawka),1)
            lbrut=lnet+lvat	
	      else
	        lnet=round(ztil*round(ltcen,2),2)
	        lvat=round(tn_vat(lnet,ztstawka),2)
            lbrut=lnet+lvat
	        @ w,vcol+53 say round(ltcen,2) picture "9999999.99"
	      endif
	      @ w,vcol+64 say lnet picture "99999999.99"
	      if.not.zdtyp$bezvat_gr
		    if.not.ztzwolniony
			  @ w,vcol+77 say ztstawka picture "99"
			else
			  @ w,vcol+77 say "zw."
			endif  
	        @ w,vcol+80 say lvat picture "99999999.99"
	        @ w,vcol+92 say lbrut picture "99999999.99"	
            if zpoz_rabat
		      @ w,vcol+105 say ztil_dost picture "999.9999"
		    else
		      if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
			    @ w,vcol+105 say ztkod   
			  else
			    if .not.zpkw_i_u
				  @ w,vcol+105 say substr(ztsymbol,1,10)   
				else
				  @ w,vcol+105 say substr(ztsymbol,1,15)   
				endif  
			  endif  
		    endif  
            @ w,vcol+120 say plotek  
          else
		    @ w,vcol+79 say plotek  
		  endif
	  endcase
	endif
	
	if lwiersz_dodatkowy
	  if zkod_druk
	    w=w+1
	    @ w,vcol say plotek
        @ w, vcol+5 say "KTM:"
	    @ w,vcol+10 say ztkod	  
	    @ w,vcol+120 say plotek  
	    lwiersz_dodatkowy:=.f.
	  else
	    if zkreskadruk.and.(zdtyp$dowod_gr.or.zdok_dowod)
		  w=w+1
	      @ w,vcol say plotek
          @ w, vcol+5 say "Kod kreskowy ....."
	      @ w,vcol+24 say ztpasek 
	      @ w,vcol+120 say plotek  
	      lwiersz_dodatkowy:=.f.	  
		endif  
	  endif	
	endif

    if znaz_64.and..not.empty(substr(ztnaz,33))  &&wydruk drugiej cz©òci nazwy dla dàugich nazw (2x 32 znaki)
		  w=w+1
	      @ w,vcol say plotek
          @ w, vcol+5 say substr(ztnaz,33)
	      @ w,vcol+120 say plotek  
	endif

*	if((.not.ztstawka=22).and.zpoz_rabat.and..not.zdtyp$bezvat_gr).or.(len(alltrim(ztsymbol))>10.and.zpkw_i_u)
*	  w=w+1
*	  @ w,vcol say plotek
*      @ w, vcol+5 say "SYMBOL PKW i U:"
*	  @ w,vcol+21 say ztsymbol	  
*	  @ w,vcol+120 say plotek  
*	endif
	if ztwyroznik$"O"
	  topispoz_druk()
	endif
endcase  
  
RETURN nil


FUNCTION STOPA()
local ltxt1:=space(48)+plotek+"  R a z e m :  "
local ltxt2:=space(8)+sposob_zaplaty+gotowka+"    "+plotek
local ltxt2b:=space(8)+sposob_zaplaty+gotowka
*local ltxt3:=space(48)+"|"+space(10)
local ltxt3:=space(43)+plotek+space(2),ltxt3b
local t[7],q[7],i
    if zdtyp$dowod_gr.and.zwz_bezcen 
	  return
	endif
if zdtyp$przes_gr.or.zdtyp$bo_gr.or.zdtyp$bezdozaplaty_gr
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
  ltxt1="        Udzielono rabatu: "+str(zdrabat,8,4)+" %"+space(7)+plotek+"     R a z e m :    "
endif
do case
  case zdsposzap="P"
    ltxt2=stuff(ltxt2,27,18,"Przelew           ")
	ltxt2b=stuff(ltxt2,27,18,"Przelew           ")
  case zdsposzap="O"
    ltxt2=stuff(ltxt2,27,18,opozniona)
	ltxt2b=stuff(ltxt2,27,18,opozniona)
  case zdsposzap="K"
    if zkarta
	  ltxt2=stuff(ltxt2,27,18,"Karta pàatnicza   ")		
	  ltxt2b=stuff(ltxt2,27,18,"Karta pàatnicza   ")		
	else
	  ltxt2=stuff(ltxt2,27,18,"Kompensata        ")		
	  ltxt2b=stuff(ltxt2,27,18,"Kompensata        ")		
	endif  
  case zdsposzap="R"
    ltxt2=stuff(ltxt2,27,18,"Red. zadàuæenia   ")			
	ltxt2b=stuff(ltxt2,27,18,"Red. zadàuæenia   ")			
endcase
if zdtyp$przes_gr.or.zdtyp$bo_gr
  ltxt2=stuff(ltxt2,27,18,"                  ")		
endif
if zdsposzap$"PO"
  ltxt3=space(8)+termin+dtoc(zdtermin)+space(12)+plotek+space(2)
  ltxt3b=space(8)+termin+dtoc(zdtermin)
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
        @ w,vcol+43 say plotek+"  "+ q[i]+space(6)+t[i]
		w=w+1         	  
	  endif
	  i=i+1
	  if i>7
	    exit
	  endif
	enddo
else
    @ w,vcol say substr(ltxt1+l_all,1,80) 
	w=w+1
endif
*w=w+1
if numer_zam_op.and.zzam_num=2
  @ w,13 say "Numer zam¢wienia: "+zdnumer_zam
endif
if zdtyp$bezvat_gr
  @ w,vcol+48 say replicate("=",32)
  w=w+1
	@ w,vcol say ltxt2b
	w=w+1
	@ w,vcol say ltxt3b
    w=w+1
else
  @ w,vcol+48 say replicate("=",73)
endif  
w=w+1
if (zdtyp$dowod_gr.or.zdok_dowod).and.zdokiledruk
  @ w,vcol say "L•czna iloòÜ "+zdokjm+" = "+alltrim(str(zdokile,11,mag_round))
  w=w+1
endif
RETURN nil



FUNCTION ZAPLACONO
if.not.(zdtyp$dowod_gr.and.zwz_bezcen) 
  @ prow(),pcol() say &zdr_grubo+&zdr_kkond
  if zdtyp$eksport_gr
    @ w,3 say do_zaplaty+alltrim(str(ztbrut_all,11,2))+space(2)+ zdwaluta+&zdr_kgrubo +&zdr_kond
  else
    @ w,3 say do_zaplaty+alltrim(str(ztbrut_all,11,2))+ zl+&zdr_kgrubo +&zdr_kond
  endif  
  *zkwota=ztbrut_all-zdniedop
  if.not.zdtyp$proform_gr.and.vdok.and..not.kasa_glowna
    do case
      case zdsposzap$"GK"
        @ w,pcol()+20 say naleznosc
      case zdsposzap$"OP"
	    zkwota=ztbrut_all-zdniedop        
	    if.not.kj_round(zkwota,2)=0
        	@ w,pcol()+10 say przyjeto+alltrim(str(zkwota,11,2))+pozostalo+alltrim(str((zdniedop),11,2))	
		endif		
*      case zdsposzap$"K"
*        @ w,pcol()+20 say rozliczono
    endcase
  endif
endif
RETURN nil



FUNCTION PODPIS()
local lt1:=upowazniona
local lt2:="                                                                                                                      "
local lt3:=space(80)
local lt4:="podpis           ..............................                       podpis           .............................. "
local lt5:="                                                                                                                      "
local lt6:="                                                                                                                      "
local lupomnienie:=.f.
local select:=select(),lw:=5
if.not. zdtyp$odebral_podpis_gr
  lt1:="                                                                                       DOKUMENT WYSTAWIù :            "
  lt2:="                                                                                                                      "
  lt3:="                                                                                                                      "
  lt4:="                                                                      podpis           .............................. "
  lt5:="                                                                                                                      "
  lt6:="                                                                                                                      "  

endif

if zdtyp$importsad_gr
  *lt1:="Rozliczenie sporz•dzià:                               .............."
  lt1:=rozl_sporzadzil
  lt2:="                                                          podpis    "
  lt1=STUFF(lt1,26,30,zwystawil)
  lt3:=""
  lt4:=""
  lt5:=""
  lt6:=""
endif

if zdtyp$dowodwew_gr
  lt1:="                             SPORZ§DZIù                                       ZATWIERDZIù"
  lt2:=""
  lt3:=""
  lt4:=""
  lt5:="                  .............................                     .............................."
  lt6:="                              podpis                                           podpis                        "
endif


if op_platnosc_txt.and.zdsposzap$"PO".and.zdtyp$sprzedaz_gr
  lupomnienie=.t.
endif
if zdtyp$eksport_gr.and..not.op_export_txt
  lupomnienie=.f.
endif

if.not.lupomnienie
  if zdtyp$odebral_podpis_gr
    lt3=STUFF(lt3,20,30,zdodebral)
  endif
  lt3=STUFF(lt3,90,30,zdwystawil)
else
  *set default to shset
  set default to &set_serwer
  if.not.file("grozba.dbf")
    if zdtyp$odebral_podpis_gr
      lt1:=fakture_odebral
      lt2:="                                                                                                                        "
	  lt6:="                                                                                                                        "
      lt3:="                                                                                                                        "
      lt4:="                                             podpis osoby                               podpis osoby                    "
      lt5:="                                             upowaænionej ..................            upowaænionej .................. "    
      lt3=STUFF(lt3,46,30,zdodebral)
    endif
    lt3=STUFF(lt3,89,30,zwystawil)
    lt1=stuff(lt1,1,30,op_txt1)
    lt2=stuff(lt2,1,30,op_txt2)
    lt3=stuff(lt3,1,30,op_txt3)
    lt4=stuff(lt4,1,30,op_txt4)
    lt6=stuff(lt6,1,30,op_txt6)  
   *lt4=stuff(lt4,1,30,op_txt5)
    lt5=stuff(lt5,1,30,op_txt5)
  else
    select &groz_sel
    if kj_use("grozba",.f.,3)
      w=w+1
	  do while.not.eof()
	    w=w+1
	    @ w,lw say tekst
	    skip
	  enddo      	
	endif
    if zdtyp$odebral_podpis_gr
      lt3=STUFF(lt3,20,30,zdodebral)
    endif
    lt3=STUFF(lt3,90,30,zdwystawil)	
	select &select
  endif	
endif

if zpotwierdzenie="1".and. zdtyp$sprzedaz_gr
    if zdtyp$odebral_podpis_gr
      lt1:=fakture_odebral
      lt2:="                                                                                                                        "
	  lt6:="                                                                                                                        "
      lt3:="                                                                                                                        "
      lt4:="                                             podpis osoby                               podpis osoby                    "
      lt5:="                                             upowaænionej ..................            upowaænionej .................. "    
      lt3=STUFF(lt3,46,30,zdodebral)
    endif
    lt3=STUFF(lt3,89,30,zwystawil)
    lt1=stuff(lt1,1,30,"     Potwierdzam odbi¢r towaru")
    lt2=stuff(lt2,1,31,"zgodnie ze specyfikacj• zawart•")
    if zdtyp$sprzedaz_gr
	  lt3=stuff(lt3,1,30,"w treòci faktury.             ")
	else
	  lt3=stuff(lt3,1,30,"w treòci dokumentu            ")
	endif  
    lt4=stuff(lt4,1,30,"                              ")	
    lt5=stuff(lt5,1,40,"Podpis osoby ...........................")  
    lt6=stuff(lt6,1,30,"upowaænionej do odbioru towaru")  	


endif


w=w+3
if file("grozba.dbf")
  @ w,lw say lt1
*  w=w+1
*  @ w,lw say lt2
  if.not.zdtyp$importsad_gr
    w=w+1
    @ w,lw say lt3
    w=w+1
*    @ w,lw say lt6
    w=w+1
    @ w,lw say lt4
    w=w+1
    @ w,lw say lt5  
  endif
else
  @ w,lw say lt1
  w=w+1
  @ w,lw say lt2
  if.not.zdtyp$importsad_gr
    w=w+1
    @ w,lw say lt3
    w=w+1
    @ w,lw say lt4
    w=w+1
    @ w,lw say lt5
    w=w+1
    @ w,lw say lt6	  
  endif
endif  
RETURN nil

*******************************************************************************
* DOK_EDIT                                                                    *
*******************************************************************************
******************************************************************************
* Moduà obsàugi kontrahenta                                                  *
* psciezka: katalog z plikami pokno=.t.:kontrahent w oknie                   *
* ptxt:tekstowa postaÜ klucza do szukania, pklucz: =1/po nazwie              *
* =2/po nipie =3/po numerze ,pksiega=.t.: wersja z kr¢tsz• nazw•             *
* ptryb=1 - aktualizacja plikow lokalnych na biezaco                         *
* ptryb=2 - aktualizacja plikow lokalnych wymuszana                          *
******************************************************************************
FUNCTION DOK_OLD(pdok_sciezka,pkon_sciezka,pmag_sciezka,psiec)
local ek,lsukces,select:=select(),t[8],q[8],to[5],qo[5],ltyt:=space(80)
public enter:=.f.,fwar:=".t."
public f_nip:=space(15),f_naz1:=space(30),f_naz2:=space(30),f_miasto:=space(30)
public f_ulica:=space(30),f_odebral:=space(30)
public vmenu_end:=.f.
private d_sciezka:=space(100)
private siec:=psiec
private k_w:=0,k_k:=0
t[1]:="kj_doknumer(dndok)"
t[2]:="ddatdok"
t[3]:="dnskrot"
t[4]:="dniedop"
t[5]:="dtermin"
t[6]:="dsposzap"
t[7]:="dndow"
t[8]:="ddatdow"
q[1]:="Numer dokumentu"
q[2]:="Data dok."
q[3]:="Kontrahent"
q[4]:="Niedoplata"
q[5]:="Termin"
q[6]:="Pàat."
q[7]:="Numer dowodu"
q[8]:="Data dow."
if zzaznacz_dok
  t[6]:="substr(dster,1,1)"
  q[6]:="*"
endif
if ztyp_dok$dowod_gr
 t[1]:="dndow"
 t[2]:="ddatdow"
 t[7]:="dndok"
 t[8]:="ddatdok"
 q[1]:="Numer dowodu"
 q[2]:="Data dow."
 q[7]:="Numer dokumentu"
 q[8]:="Data dok."
endif
if zdtyp$kasa_gr
  t[4]:="dkordok"
  t[5]:="dwystawil"
  q[4]:="Dotyczy"
  q[5]:="Dok.wystawià"
endif
*if zdznak$zkordok_znak
if zznak_dok$zkordok_znak
  q[3]:="Dotyczy dokum."
endif

kj_okno(0,0,24,ltyt,10)
kj_okno(0,0,20,ltyt,10)
set color to
*@ 0,2 say space(1)+alltrim(substr(zopis_dok,1,75))+space(1)
@ 0,2 say space(1)+znaz_dok+space(1)
set color to n/w,w/n
if.not.dok_use()
  return
endif
*set order to 2
if zdokanul_pokaz=0
  set filter to danul=.f.
  go top
endif

if zdok_filtr
  if zdokanul_pokaz=0
    set filter to alltrim(dsymbol)==alltrim(zsymbol_dok).and.danul=.f.
  else
    set filter to alltrim(dsymbol)==alltrim(zsymbol_dok)
  endif
  go top
  go bottom
  if empty(dsymbol)
    kj_tkom(12,"","","Brak zarejestrowanych dokument¢w","",5)
    close_all("SH")
    return 
  endif
else
  seek zdsymbol
  if.not.found()
    kj_tkom(12,"","","Brak zarejestrowanych dokument¢w","",5)
    close_all("SH")
    return 
  endif
endif  

keyboard chr(205)
dbedit(1,1,19,78,t,"D_FU","",q,"ﬂ")
close_all("SH")
RETURN

FUNCTION D_FU(tryb,numer)
local last:=lastkey(),lpoz:=1,ek,ek1,ek2,lcolor:=setcolor(),t[1],select:=select()
local recno:=recno(),lanul:=.not.danul,ldrecno,lwplata:=0, ldruk:=1
local lnum:=space(15),lw:=1,kpoz:=1,lkaslicz:=1,ldkordok:="",ldalej:=.t.
local ldtyp:=zdtyp,lplat:=1,ldopliku:=1,lwzdok:=1
public d_filterek:=dbfilter()
t[1]:="naz_dok"
save screen to ek

*
if.not.empty(dgrup)
  zdok_lad()
endif  
do case
  case last=-2.and..not.zdtyp$kasa_gr     &&F3 - raport dla dàuænik¢w
    if kj_gkom(14," W y b i e r z "," Tak - wydruk na drukarke","Nie - wydruk do pliku",.t.,5)
      plikdruk=.f.
    else
      plikdruk=.t.
    endif
	dlug_rap(plikdruk)
	keyboard chr(205)
	return 2	

  case chr(last)$"*"
    if substr(dster,1,1)="*"
      if reclock(5)      
	    replace dster with stuff(dster,1,1," ")
	  endif	  
	else
      if reclock(5)      
	    replace dster with stuff(dster,1,1,"*")
	  endif	  	
	endif  
	unlock

  case last=-1     &&F2 - kolejnoòÜ numer¢w
    set order to 2
	keyboard chr(205)
	return 2
  case last=13
    ldrecno=recno()
    do while.t.
	  do case
	    case zdtyp$kasa_gr
		  lpoz=-1
		  okno=.t.
		  kpoz=enter_kas_menu(kpoz)
	    otherwise
	      *if zpopraw_up.and..not.zdznak$zkordok_znak
		  if zpopraw_up
	        lpoz=enter_pdok_menu(lpoz)
	      else
	        lpoz=enter_dok_menu(lpoz)
	      endif  
	  endcase
	  if lastkey()=27
	    *exit
		keyboard chr(205)
		return 2
	  endif
	  do case
	    case kpoz=1.and.zdtyp$kasa_gr
		  kasa_prezent(0)      && prezentacja dokumentu kasowego
		case kpoz=2
          dok_licz(zdndow,.f.)
          kj_dok_say(.f.)		  
		  dok_druk(.f.,.t.)    && wydruk dokumentu kasowego
        case kpoz=3.and.zdtyp$kasa_gr            
		  kasa_prezent(1)		  
		case kpoz=4
          save screen to ek2

		  ldnzam=zdnzam
		  ldkordok=zdkordok
		  @ 21,1 clear to 23,78
		  @ 22,25 say "Dotyczy dokumentu :"
		  set cursor on
		  @ 22,45 get ldkordok
		  read
		  set cursor off
		  if.not.ldkordok=zdkordok
		    locate for dkordok=ldkordok
            ldalej=.t.
			if found()
			  ldnzam=dnzam
			else
			  kj_tkom(12," Uwaga! ","","Z tym dokumentem  nie s• zwi•zane æadne dokumenty kasowe ","",5)
			  ldalej=.f.
			endif			
		  endif
		  if ldalej
		    lkaslicz=kaslicz_menu(lkaslicz)
		    kas_rozlicz(ldnzam,lkaslicz)		  
		  endif
		  restore screen from ek2
		case kpoz=5
		  popraw_kasa_dok()

		case lpoz=1.and.(zdtyp$export_gr.or.zdtyp$import_gr).and..not.zdtyp$kormag_gr
          rozlicz_prezent(0)   && prezentacja dokumentu rozliczeniowego
	    case lpoz=1
		  dok_licz(zdndow,.f.)
          dwzor_wpasku=.t.
		  kj_dok_say(.t.)
		  dwzor_wpasku=.f.
          if dwzor
            set default to &set_serwer		    
			if file("wzor.dbf")
			   dokwzor1_tworz()
            else
			  dokwzor_tworz()
			endif
			
		  endif
	    case lpoz=2
          dok_licz(zdndow,.f.)
          kj_dok_say(.f.)
          zkwota=0
		  save screen to ek1
		  do while.t.          
		    restore screen from ek1
		    ldruk=enterdruk_menu(ldruk)
		    if lastkey()=27
			  restore screen from ek1
		      exit
		    endif
		    do case
		      case ldruk=1
                ldopliku=dopliku_menu(ldopliku)
				do case
				  case ldopliku=1
				    dok_druk(.f.,.t.)
				  case ldopliku=2
				    dok_druk(.t.,.t.)					
				endcase

		      case ldruk=2
			    zduplikat=.t.
                ldopliku=dopliku_menu(ldopliku)
				do case
				  case ldopliku=1
				    dok_druk(.f.,.t.)
				  case ldopliku=2
				    dok_druk(.t.,.t.)					
				endcase
			    zduplikat=.f.
			  case ldruk=3
			    *if zdtyp$kormag_gr.and..not.zdtyp$importsad_gr
				if .not.zdtyp$importsad_gr
				  zdok_dowod=.t.
                ldopliku=dopliku_menu(ldopliku)
				do case
				  case ldopliku=1
				    dok_druk(.f.,.f.)
				  case ldopliku=2
				    dok_druk(.t.,.f.)					
				endcase
				  zdok_dowod=.f.
				else
				  kj_tkom(12," Uwaga! ","","Dokument magazynowy nie istnieje","",5)
				endif  
			  case ldruk=4.and.zdtyp$fiskal_gr
			      if kj_gkom(10," Uwaga! ","Awaryjny wydruk paragonu fiskalnego!","WydrukowaÜ ?",.t.,5) 
                    if kj_gkom(12," Uwaga! ","Funkcja stosowana , gdy paragonu nie wydrukowano automatycznie." ,"WydrukowaÜ ?",.t.,5) 				      
					  do fis with fis_com
                    endif 
				  endif	  
                  select &select
				case ldruk=4.and..not.zdtyp$fiskal_gr.and.zprzelew
				  przelew_druk()
				case ldruk=5
				  przelew_druk()
		    endcase
			restore screen from ek
		  enddo

        
        case lpoz=3.and.(zdtyp$export_gr.or.zdtyp$import_gr).and..not.zdtyp$kormag_gr            
	      rozlicz_prezent(1)
		case lpoz=3.and..not.zdarchiwum          &&anulowanie
          kj_dok_say(.t.)
		  select &dok_sel
          if.not.anul_dok()
		    return 0
		  endif
          return 2
	    
		case lpoz=3.and.zdarchiwum          &&anulowanie
          kj_tkom(12," Uwaga! ","Dokument zostaà przeniesiony do archiwum","Operacja anulowania nie jest dost©pna","",5)    		
          keyboard chr(205)
		  return 2
		  		
		*case lpoz=4.and.zdtyp$sprzedaz_gr.and..not.zdznak$zkordok_znak.and..not.zdtyp$bezkontrah_gr.and..not.zdtyp$dowod_gr
		case lpoz=4.and.zdtyp$dokorekty_gr.and..not.zdznak$zkordok_znak
          *dlakorekty_buf()
          zkordoksay=.t.
		  kj_dok_say(.f.)
		  zkordoksay=.f.
**
 		  if zpytajkormag=1 
		    if.not. kj_gkom(12,"","KorygowaÜ stany magazynowe ?","",.t.,5)  
	          zduty_kor=.f.
              buf_use()
			  go top
			  do while.not.eof()
	            replace tkormag with .f.
	            skip
	          enddo  
              fifo_buf()
			  select &dok_sel
            else
			  zduty_kor=.t.
			endif
		  
		  endif
**
*          kj_dok_say(.f.)
		  vdokkor_ster=.t.
*
		  korekta_dok()
		  vdokkor_ster=.f.
		  return 2
		
	    *case lpoz=5.and.zdgrup=zdznak
		*case lpoz=5.and.zdznak$dowod_gr
        case lpoz=5.and..not.zdtyp$dowod_gr.and.substr(dster,1,1)=="/"
          public z1dndow:=dndow
		  set filter to dndok=z1dndow
		  go top
		  keyboard chr(205)
		  return 2 		  

		case lpoz=5.and.zdtyp$dowod_gr
		  if zzaznacz_dok
			lwzdok=wz_dok_menu(lwzdok)
			if lastkey()=27
			  keyboard chr(205)
			  return 2			  
			endif
			if lwzdok=2
                        if.not.zbiorczy_dok()
						  keyboard chr(205)
						  return 2
						endif
			endif		    
		  endif
		  g_tlo()
		  zkwota=0
		  dok_licz(zdndow,.f.)	      
		  kj_dok_say(.t.)
          select=select()			
		  set default to leg01
	      select &dokdef_sel
          if.not.file("dok_def.dbf")
		    ld_sciezka:=zd_serwer+"leg01"
		    set default to &ld_sciezka
		  endif			  
	      if kj_use("dok_def",.f.,3)
		    set index to dok_def
	        set filter to grupa_dok=zdgrup.and..not.znak_dok=zznak_dok.and..not.ukryj
		    go top
	        ildok=ilosc_dok()
		    @ 2,lw+2 to 2+ildok+1,lw+15 
		    @ 2,lw+4 say " Dokument " 
		    keyboard chr(205)
            do case
			  case zdgrup="1"
			    @ 0,1 say " Rejestracja dokumentu zakupu na podstawie dowodu PZ "
			  case zdgrup="2"
			    @ 0,1 say " Rejestracja dokumentu sprzedaæy na podstawie dowodu WZ "					
			endcase
			dbedit(3,lw+3,3+ildok-1,lw+14,t,"FU_D","","","",,"")
	        close	
			select &select		
          endif			
          kj_okno(2,30,6,"   *  D a n e   u z u p e à n i a j • c e  *   ",2)
          @ 4,32 say     "Data wystawienia dokumentu..             "
		  zddatdok=date()
		  set cursor on
		  @ 4,60 get zddatdok
		  do case
		    case zdgrup="1"
              @ 6,32 say     "Numer  dokumentu ...........             "               
		      @ 6,60 get zdndok
			otherwise
              @ 6,32 say     "Dokumentowi nadano numer ...             "               
			  if.not.nowy_numdok(.f.)
                return .f.
              endif			    
		      @ 6,60 say zdndok  &&060307
		  endcase	
		  read
		  set cursor off
          if.not.lastkey()=27
			if zsiec
	          if reclock(5)      
	            replace ddatdok with zddatdok,dndok with zdndok
			    replace dtyp with ztyp_dok,dznak with zznak_dok
		        replace dsymbol with zsymbol_dok
			    unlock
			  else
                return 0
			  endif	
	        else
	          replace ddatdok with zddatdok,dndok with zdndok
		 	  replace dtyp with ztyp_dok,dznak with zznak_dok
			  replace dsymbol with zsymbol_dok
	        endif					  		    
		    go bottom
            if kasa_glowna.and.zdtyp$kasadok_gr.and.zdsposzap$"GKR"
              dokdef(1)
		      ldndow=zdndow
		      zdniedop=ztbrut_all
		      kasa_dok()
		      close_all("SH")
		      dokdef(0)
            endif		
	        keyboard chr(13)
		    close_all("SH")
			exit
		  endif
	    
		
		case lpoz=6.and..not.zdarchiwum
		  kj_dok_say(.f.)
		  popraw_dok()
 *         if kasa_glowna.and.zdtyp$kasadok_gr.and.zdsposzap="G"
          if kasa_glowna.and.zdtyp$kasadok_gr.and..not.zdsposzap="K"
            dokdef(1)
		    kas_rozlicz(zdndow,0)
		    dokdef(0)
          endif				  
		  go ldrecno
		  return 2
		  
	    case lpoz=6.and.zdarchiwum
          kj_tkom(12," Uwaga! ","Dokument zostaà przeniesiony do archiwum","Operacja poprawiania nie jest dost©pna","",5)    		
          keyboard chr(205)
		  return 2

	  endcase
	enddo
    return 0

    case chr(last)$"Oo"
      if zdtyp$opisdok_gr.and.zopis_dtryb=2
        kj_okno(20,0,4, "  Opis dokumentu                                                                ",5)
        set cursor on
        if .not.zdznak$zkordok_znak
          @ 21,2 get zdopis1 picture "@S76"
        endif	
        @ 22,2 get zdopis2 picture "@S76"
        @ 23,2 get zdopis3 picture "@S76"
        read
		set cursor off	
        if.not.lastkey()=27
              if reclock(5)      
	            replace dopis1 with zdopis1 
				replace dopis2 with zdopis2 
				replace dopis3 with zdopis3 
                unlock
	          endif			  		  
		endif
	  endif


    case chr(last)$"Ss"
      set color to
	  @ 21,1 clear to 23,78
      set cursor on    
      @ 22,21 say "Podaj numer dokumentu  "
      @ 22,44 get lnum 
      read
      set cursor off   
      k1=LEN(ALLTRIM(lnum))     
      if lnum#space(15)
	    if dtyp $ dowod_gr
		  locate for substr(alltrim(dndow),1,k1)=alltrim(lnum)     
		else
		  locate for substr(alltrim(dndok),1,k1)=alltrim(lnum)     
		endif
        if .not.found()
          kj_tkom(12," Uwaga! ","","Dokument o numerze "+lnum+" nie odnaleziony","",5)    
        endif 
      endif   
   restore screen from ek     
   keyboard chr(205)
   setcolor(lcolor)
   return 2	
   
   case chr(last)$"Ww".and.kasa_glowna.and..not.zdtyp$kasa_gr
     * kasa_dok()
     vdtyp=zdtyp
	 vsymbol_dok=zsymbol_dok
	 kj_dok_say(.f.)
	 lcolor=setcolor()
	 dok_filtr=dbfilter()
	 dok_recno=recno()

	 do case
	   case zdtyp$sprzedaz_gr
	     zdtyp=substr(kasa_gr,1,1)
	   case zdtyp$zakup_gr
	     zdtyp=substr(kasa_gr,2,1)		 
	 endcase
     ldokdef_recno=zdokdef_recno
	 if dokdef_use()	 
	   locate for typ_dok=zdtyp
	   if found()
         zdok_def_lad()	     
	   else
         kj_tkom(12," Uwaga !","  Wystapil blad.","Prawdopodobnie nie zostaà zdefiniowany dokument kasowy. ","Sprawd´ plik DOK_DEF.DBF",5)  	     
	   endif
	   close
	 endif
     select &dok_sel	 
	 dok_default()
     ztcen=zdniedop
     do case
	   case zdsposzap="G"
	     lplat=1
	   case zdsposzap="P"
	     lplat=2		 
	   case zdsposzap="K"
	     lplat=3		 		 
	   case zdsposzap="R"
	     lplat=4		 		 		 
	 endcase
	 lplat=przelgot_menu(lplat)
	 do case
	   case lplat=1
	     zdsposzap="G"
	   case lplat=2
	     zdsposzap="P"		 
	   case lplat=3
	     zdsposzap="K"	 		 
	   case lplat=4
	     zdsposzap="R"	 		 		 
	 endcase
	 nowy_kasa_dok(.f.,.t.,.f.)      
	 close_all("SH")
	 zdtyp=vdtyp
	 zsymbol_dok=vsymbol_dok
	 if dokdef_use()	 
	   locate for typ_dok=zdtyp.and.symbol_dok=zsymbol_dok
	   if found()
         zdok_def_lad()	     
	   endif
	   close
	 endif	 
	 tow_use(.f.)
	 dok_use()
	 set filter to &dok_filtr
	 go top
	 go dok_recno
	 
	 zdok_lad()
	 setcolor(lcolor)	 

     keyboard chr(205)
	 return 2		  	
	
    case chr(last)$"Ww".and..not.kasa_glowna	
	  set color to
	  @ 21,1 clear to 23,78
	  @ 22,3 say "Zaksi©guj wpàat© :"
	  set cursor on
	  @ 22,50 get lwplata picture "9999999.99"
	  read
	  set cursor off
		    if zsiec
	          if reclock(5)      
	            replace dniedop with dniedop-lwplata
				unlock
	          endif	
	        else
              replace dniedop with dniedop-lwplata
	        endif	
			commit			  
       setcolor(lcolor)
    case chr(last)$"Ff"
      *do skom with topis[4]
*	  fwat=dbfilter()
      fwar=".t."
      dwar_start:=dbfilter()
*	  dwar1_start:=dbfilter()
	  dwar_allstart:=".t."
	  do while.t.
	    do case
		  case zdtyp$kasa_gr
		    dkas_filtr() 
		 
		otherwise
		  d_filtr()
		endcase  
		if kj_gkom(12,"","Zako‰czyÜ definiowanie filtru ?","",.t.,5)
          exit
	    endif
	  enddo  
	  if lastkey()#27
		set filter to &dwar
        go top
	  endif
    keyboard chr(205)
	return 2		  	
	
    case chr(last)$"Uu"
	  if .not.zdtyp$kasa_gr
	    dok_sum()	
	  else
        kj_tkom(12," Uwaga !","Dla grupy dokument¢w kasowych ","analiza dost©pna jest wyà•cznie z poziomu programu KJ_KASA.","",5)  	  
	  endif	
	  


	case last=27 
      return 0
endcase

d_oknopom()
RETURN 1

*******************************************************************************
* Menu konczace tworzenie dokumentu.                                          *
*******************************************************************************
FUNCTION EDIT_MENU(ppoz)
local lbelka:= "∞ Wyswietl ∞ Drukuj ∞ Anuluj ∞ Popraw ∞ kOrekta ∞ Koncz ∞"
local lbelka1:="                        W Y B I E R Z                         "
local lliter:= "  P          D        A        P         O        K      "
local lpoz:=ppoz,ltopis[6]
ltopis[1]:="Wyswietl wyrozniony dokument w pelnym brzmieniu"
ltopis[2]:="Wydrukuj wyrozniony dokument"
ltopis[3]:="Anuluj wyrozniony dokument"
ltopis[4]:="Popraw wyrozniony dokument"
ltopis[5]:="Utworz dokument korygujacy"
ltopis[6]:="Powroc do przegladania dokumentow"
tone(700,0.3)
@ 23,1 say replicate(chr(176),78)
lpoz=menu_poziom(0,0,6,lbelka,lliter,ltopis,lpoz,.f.,.f.) 
RETURN lpoz


FUNCTION D_OKNOPOM()
local lcolor:=setcolor()
local ltxt:="_W_pàata   _F_iltr   <Enter>-MENU    pods_U_mowanie    <Esc>"  
if.not.zzaznacz_dok
  ltxt:="F_iltr   W_pàata   pods_U_mowanie    S_zukaj   <Enter>-MENU    <Esc>-REZYGNACJA"  
else
  ltxt:="F_iltr  W_pàata  pods_U_mowanie   S_zukaj  <Enter>-MENU   <Esc>-REZ. *-zaznacz"  
endif
dok_licz(zdndow,.f.)
*set color to n/w,w/n
do skom with ltxt
set color to 

*@ 20,1 say replicate(chr(223),78)
do case
  case zdtyp$import_gr.or.zdtyp$eksport_gr
    @ 21,1 say "∞                                 ∞∞ W A R T O ó è :                         ∞"
    @ 22,1 say "∞                                 ∞∞     W walucie ..........                ∞"
    @ 23,1 say "∞                                 ∞∞     W zàot¢wkach .......                ∞"
 case zdtyp$kasa_gr
    @ 21,1 say "∞                                 ∞∞                                         ∞"
    @ 22,1 say "∞                                 ∞∞ W A R T O ó è  .........                ∞"
    @ 23,1 say "∞                                 ∞∞                                         ∞"  
otherwise
    @ 21,1 say "∞                                 ∞∞                 NETTO...                ∞"
    @ 22,1 say "∞                                 ∞∞ W A R T O ó è : VAT.....                ∞"
    @ 23,1 say "∞                                 ∞∞                 BRUTTO..                ∞"
endcase

do case
      case zdsposzap="G"
        @ 21,3 say "Platne gotowka          "
      case zdsposzap="O"
        @ 21,3 say "Platnosc opozniona      "     
      case zdsposzap="P"
        @ 21,3 say "Platne przelewem        "     
      case zdsposzap="R"
        @ 21,3 say "Redukcja zadàuæenia     "
      case zdsposzap="K"
        @ 21,3 say "Pàatne kart•            "		
endcase
if zdrabat#0
  @ 23,3 say "Udzielono rabatu           %  "
  @ 23,21 say zdrabat
else
  @ 23,3 say "                              " 
endif	 
do case
  case zdtyp$import_gr.or.zdtyp$eksport_gr
    if zw_dewizach
	  @ 22,63 say ztnet_all picture "99999999.99"
      @ 23,63 say ztnet_all*zdkurs picture "99999999.99"  
	else
	  @ 22,63 say ztnet_all/zdkurs picture "99999999.99"
      @ 23,63 say ztnet_all picture "99999999.99"  	
	endif  
  case zdtyp$kasa_gr
    @ 22,63 say ztnet_all picture "99999999.99"
otherwise
    @ 21,63 say ztnet_all picture "99999999.99"
    @ 22,63 say ztvat_all picture "99999999.99"
    @ 23,63 say ztbrut_all picture "99999999.99"
endcase

@ 20,1 say replicate(chr(176),78)
if zdtyp$eksport_gr
  @ 20,37 say "Waluta: "+zdwaluta
  @ 20,64 say "Kurs" +str(zdkurs) 
endif
if danul
  tone(300,0.5)
  set color to w/n*
  @ 23,3 say "Dokument anulowany !              "
  setcolor(lcolor)
else
  if zdsposzap$"OP"
    @ 22,3 say "Termin platnosci          "
    @ 22,21 say zdtermin	  
    if max(zdtermin,date())=date().and.round(dniedop,0)#0
      tone(500,1)
	  set color to W/N *
	  @ 20,3 say "UWAGA!   "
	  set color to
	  @ 20,12 say "ZALEGùA PùATNOóè    " 
    endif
  endif   
endif
setcolor(lcolor)
RETURN nil




FUNCTION KJ_DOK_SAY(ptlo)
local select:=select(),ek,lnowy:=.f.
local lsay:=ptlo
save screen to ek
if ptlo
  dok_tlo(lnowy)
endif  
if.not. zdtyp $ bezkontrah_gr
  *kondefault()
select &kon_sel
  if kon_use()
    set order to 3
	seek zdkontrah
	if.not.found()
	  kj_tkom(12," Uwaga !  Wystapil blad.","Kontrahent o numerze "+str(zdkontrah,5)+" nie odnaleziony","Przeprowadz indeksacje i ponow probe.","Nacisnij dowolny klawisz.",5)  
	  select &select
	  restore screen from ek
	  return .f.
	endif
	zkon_lad()
	close
	if ptlo
	  kon_say()
	endif  
  else
    restore screen from ek
    select &select
    return .f.
  endif
else
  k_zer()
endif  

  if.not.buf_lad(lsay)
    restore screen from ek
    select &select
    return
  endif
if zkortryb="1"  &&060504
  if zkordoksay  
    dlakorekty_buf()
  endif
endif  
select &select
*inkey(0)
restore screen from ek
RETURN .t.

FUNCTION BUF_LAD(psay)
dok_default()
select &tow_sel
if.not.used()
  if.not.tow_use(.f.)
    return .f. 
  endif
endif
*set default to shset
set default to &set_serwer
select &buf_sel
if.not.used()
  if.not.kj_use("towbuf",.t.,3)
    return .f.
  else
    set index to towbuf
  endif
endif
zap
dok_default()
select &tow_sel
seek zdndow
if.not.found()
	    kj_tkom(12," Uwaga !  Wystapil blad.","Odtworzenie dokumentu o numerze "+zdndok+" nie jest mozliwe","Przeprowadz indeksacje i ponow probe.","Nacisnij dowolny klawisz.",5)  	  
	    close
	    select &buf_sel
	    close
	    return .f.
endif

*do while tndow==zdndow
do while alltrim(tndow)==alltrim(zdndow)
	    ztow_lad()
	    if zdtyp$import_gr.or.zdtyp$eksport_gr
		  ztcen=ztcen_dewiz
		endif
		select &buf_sel
	    append blank
	    tow_replac()
	    select &tow_sel
	    skip
enddo
close

select &buf_sel
go top
if psay
  end_say()
  tow_say(.f.,4)
endif  
close
RETURN .t.

FUNCTION ILOSC_DOK()
local liledok:=0
go top
do while.not.eof()
  liledok=liledok+1
  skip
enddo
go top
RETURN liledok

FUNCTION CEN_DOK()
local lcen_dok:=0
if zdtyp$sprzedaz_gr
    lcen_dok=sp_cendef
else
  lcen_dok=zak_cendef
endif
RETURN lcen_dok

FUNCTION DOK_LICZ(pnumer,pdruk)
local select:=select(),lsukces:=.f.
public zdoklicz_numer:=pnumer
select &tow_sel
if.not.used()
  if.not.tow_use(.f.)
    return .f.
  endif
endif
seek zdoklicz_numer
if.not.found()
      if pdruk
	    set device to screen
	  endif
      kj_tkom(12," Uwaga! ","Pozycje dokumentu o numerze",zdoklicz_numer,"nie odnalezione",5) 
      zplik_zer()
	  close
	  select &select
      if pdruk
	    set device to printer
	  endif	  
	  return lsukces
endif
tplik_sum("alltrim(tndow)==alltrim(zdoklicz_numer)")
lsukces=.t.
close
select &select
RETURN lsukces

FUNCTION DOK_ZNACZ()
dok_default()
if kj_use("dokum",.f.,3)
            set index to dow_num
			seek zdndow
			if found()
			  if zsiec
	            if reclock(5)      
	              replace dkormag_ok with .t.
		          unlock
			    else
	              kj_tkom(12," Uwaga! ","Korekta stan¢w magazynowych zako‰czona pomyòlnie.","Zaistniaàa blokada dost©pu do bazy dokument¢w","System nie wpisaà potwierdzenia poprawnoòci korekt magazynowych",15)
			    endif	
	          else
                replace dkormag_ok with .t.
	          endif					  
			else
			  kj_tkom(12," Uwaga! ","","Zapis nie potwierdzony !","",5)
			endif  
			close
endif
RETURN

FUNCTION GORA(szukacz)
  seek szukacz
RETURN NIL

FUNCTION DOL(szukacz)
set softseek on
seek substr(szukacz,1,len(szukacz)-1)+chr(asc(substr(szukacz,len(szukacz)))+1)
skip -1
set softseek off
RETURN nil

FUNCTION TNUM_NEW()
local ltnum:=0,select:=select()
select &tnum_sel
if kj_use("tow_num",.t.,10)
  ltnum=townum+1
  replace townum with ltnum
  close
endif
select &select
RETURN ltnum

FUNCTION DOK_DOW_TLO()
local ek,ltyt1:=""
save screen to ek

restore screen from ek
RETURN 



FUNCTION PRZYCZ_MENU(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz,lcolor:=setcolor()
ltnaz[1]:=" Korekta wpàywaj•ca na kwoty "
ltnaz[2]:=" Korekta bez wpàywu na kwoty "
ltlit[1]:="   "
ltlit[2]:="   "
ltopis[1]:="Zwrot towar¢w, zmiana ceny, zmiana kwoty VAT"
ltopis[2]:="Zmiana danych kontrahenta, zmiana daty lub sposobu pàatnoòci"
set color to
@ 9,25 say "  Zatwierd´ przyczyn© korekty  "
  lpoz=men_pion(10,25,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
setcolor(lcolor)
RETURN lpoz

FUNCTION DOPLIKU_MENU(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz,lcolor:=setcolor()
ltnaz[1]:=" Na drukark© "
ltnaz[2]:=" Do pliku    "
ltlit[1]:=" N "
ltlit[2]:=" D "
ltopis[1]:="Wydruk skierowany na drukark©"
ltopis[2]:="Wydruk skierowany do pliku"
set color to
  lpoz=men_pion(13,63,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
setcolor(lcolor)
RETURN lpoz

FUNCTION ENTERDRUK_MENU(ppoz)
local ltnaz[5],ltlit[5],ltopis[5],lbelka:="",lpoz:=ppoz,lcolor:=setcolor()
ltnaz[1]:=" Dokument          "
ltnaz[2]:=" doKument duplikat "
ltnaz[3]:=" Dokument Magazyn  "
ltnaz[4]:=" Paragon fiskalny  "
ltnaz[5]:=" przeLew bankowy   "
ltlit[1]:=" D "
ltlit[2]:="   K"
ltlit[3]:="          M"
ltlit[4]:=" P "
ltlit[5]:="     L" 
ltopis[1]:="Wydruk zapami©tanego wczeòniej dokumentu "
ltopis[2]:="Wydruk duplikatu dokumentu"
ltopis[3]:="Wydruk dokumentu wydania zewn©trznego W Z"
ltopis[4]:="Awaryjny wydruk paragonu fiskalnego"
ltopis[5]:="Wydruk przelewu bankowego."
if zdtyp$zakup_gr
  ltopis[3]:="Wydruk dokumentu przyj©cia zewn©trznego P Z"
endif
set color to

do case
  case druk_fiskalna.and.zdtyp $ fiskal_gr.and..not.zdznak$zkordok_znak.and..not.zprzelew
    lpoz=men_pion(10,45,4,lbelka,ltnaz,ltlit,ltopis,lpoz)
  case druk_fiskalna.and.zdtyp $ fiskal_gr.and..not.zdznak$zkordok_znak.and.zprzelew
    lpoz=men_pion(10,45,5,lbelka,ltnaz,ltlit,ltopis,lpoz)	
	
  otherwise	
    do case
	  case zprzelew
	    ltnaz[4]=ltnaz[5]
        ltlit[4]=ltlit[5]
		ltopis[4]=ltopis[5]		
	    lpoz=men_pion(10,45,4,lbelka,ltnaz,ltlit,ltopis,lpoz)
	  case .not.zprzelew
	    lpoz=men_pion(10,45,3,lbelka,ltnaz,ltlit,ltopis,lpoz)		
    endcase 
endcase


*if druk_fiskalna.and.zdtyp $ fiskal_gr.and..not.zdznak$zkordok_znak
*  lpoz=men_pion(10,45,4,lbelka,ltnaz,ltlit,ltopis,lpoz)
*else
*  lpoz=men_pion(10,45,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
*endif
setcolor(lcolor)
RETURN lpoz

FUNCTION POPR_MENU(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz,lcolor:=setcolor()
ltnaz[1]:=" Zmiana  wpàywaj•ca na kwoty "
ltnaz[2]:=" Zmiana  bez wpàywu na kwoty "
ltlit[1]:="   "
ltlit[2]:="   "
ltopis[1]:="Zwrot towar¢w, zmiana ceny, zmiana kwoty VAT"
ltopis[2]:="Zmiana danych kontrahenta, zmiana daty lub sposobu pàatnoòci"
set color to
@ 9,25 say "     W  y  b  i  e  r  z       "
  lpoz=men_pion(10,25,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
setcolor(lcolor)
RETURN lpoz


FUNCTION KORDOK_END_MENU(ppoz)
local ltnaz[4],ltlit[4],ltopis[4],lbelka:="",lpoz:=ppoz,lcolor:=setcolor()
ltnaz[1]:=" Zapami©taj i wydrukuj     "
ltnaz[2]:=" Zapami©taj bez drukowania "
ltnaz[3]:=" Powr¢Ü do przegl•dznia    "
ltnaz[4]:=" Zrezygnuj z dokumentu     "
ltlit[1]:="   "
ltlit[2]:="   "
ltlit[3]:="   "
ltlit[4]:="   "
ltopis[1]:="Zapami©tanie dokumentu poà•czone z wydrukiem"
ltopis[2]:="Zapami©tanie dokumentu bez wydruku"
ltopis[3]:="Powr¢t do prezentacji dokumentu"
ltopis[4]:="Rezygnacja z zapami©tanie i z wydruku dokumentu"
g_tlo()
set color to
@ 8,25 say "        W y b i e r z        "
  lpoz=men_pion(9,25,4,lbelka,ltnaz,ltlit,ltopis,lpoz)
setcolor(lcolor)
RETURN lpoz


FUNCTION POPRAW_END_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz,lcolor:=setcolor()
ltnaz[1]:=" Zapami©taj i wydrukuj     "
ltnaz[2]:=" Zapami©taj bez drukowania "
ltnaz[3]:=" Powr¢Ü do przegl•dznia    "
ltlit[1]:="   "
ltlit[2]:="   "
ltlit[3]:="   "
ltopis[1]:="Zapami©tanie dokumentu poà•czone z wydrukiem"
ltopis[2]:="Zapami©tanie dokumentu bez wydruku"
ltopis[3]:="Powr¢t do prezentacji dokumentu"
g_tlo()
set color to
@ 8,25 say "        W y b i e r z        "
  lpoz=men_pion(9,25,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
setcolor(lcolor)
RETURN lpoz

*******************************************************************************
*******************************************************************************



*******************************************************************************
*******************************************************************************

FUNCTION KOREKTA_DOK()
local lprzyczyna:=1,lkordok:=1,ek,recno:=recno(),ldg_magazyn
local lzap_dok:=.f.
*zdkordok:=zdndok
zdkordok:=zdndow
zdnskrot=zdndok     &&dopisano dn.25.02.2004
zdkordat:=zddatdok
dok_licz(zdndow,.f.)
zkwota=0
save screen to ek
g_tlo()
	zdznak=zkordok_znak
	ldg_magazyn=dg_magazyn
*    zdtyp=zkordok_znak
*	zdsymbol=zkordok_symbol	    
    dokumdef()
	zdg_magazyn=ldg_magazyn
    close_all("SH")
	*set default to shset
	set default to &set_serwer
    select &buf_sel
	if.not.kj_use("towbuf",.t.,3)
	  return .f.
	else
	  set index to towbuf
	endif
	keyboard chr(205)
*    tow_say(.f.,6)


		do while.not.eof()
		  replace til with -1*til,tanul with .t.
		  skip
		enddo
        set filter to tanul=.t.
		go top
		do while.not.eof()
		  recno=recno()
		  ztow_lad()
		  append blank
		  tow_replac()
		  replace  til with -1*til,tanul with .f.
		  go recno
		  skip
		enddo
		set filter to tanul=.f.
		go top
*	    tow_say(.f.,6)

    do while.t.
      zkordoksay=.t.
	  tow_say(.f.,6)
	  zkordoksay=.f.
	  @ 2,1 say "Przyczyna korekty:"
	  set cursor on
	  @ 3,1 get zdopis1 picture "@S78"
	  read
	  set cursor off
      dok_end()
	  lkordok=kordok_end_menu(lkordok)
	  if lastkey()=27
	    exit
	  endif
zdarchiwum=.f.
	  do case
	    case lkordok=1.or.lkordok=2
	      if zap_dok(.t.)
            lzap_dok=.t.
            if zdtyp$kormag_gr
		      if kor_mag(.f.)
			    dok_znacz()
			  endif
		    endif
		    select &buf_sel
		    if lkordok=1
			  vdok_plik=.f.
			else
			  vdok_plik=.t.
			endif   
		    dok_druk(vdok_plik,.t.)
		    keyboard chr(13)
		  else
		    kj_tkom(12," Uwaga! ","Dokument nie zostal zapamietany","Mozliwy blad sieciowy lub uszkodzony plik","Sprawdz i ponow probe.  Nacisnij dowolny klawisz",5)
		    keyboard chr(27)
		  endif
		  close_all("SH")
		  select &dok_sel
          if.not.dok_use()
            kj_tkom(12," Uwaga!","Wyst•pià bà•d sieciwy","Przerwij aplikacj©, sprawd´ poà•czenie sieciowe i urucho ponownie.","",5)
            return .f.
          else
            if zdok_filtr			
			  set filter to alltrim(dsymbol)==alltrim(zdsymbol)
			  go top
			else
              seek zdsymbol			
			endif  
		  endif		   
**
        if kasa_glowna.and.zdtyp$kasadok_gr.and.zdsposzap$"GKR".and.lzap_dok
          dokdef(1)
		  ldndow=zdndow
		  zdniedop=ztbrut_all

		  kasa_dok()
		  close_all("SH")
		  dokdef(0)
        endif		
	    keyboard chr(13)
        close_all("SH")
**		  
		  exit

	    case lkordok=3
          keyboard chr(205)
	    case lkordok=4
		  exit	  
	  endcase
    enddo




close_all("SH")
***  
 * if.not.dok_use()
 *   exit
 * endif
*** 
*dok_default()
*select &dok_sel
*if kj_use("dokum",.f.,3)
if dok_use()
*    set index to dok_ident,dok_num,dow_num
              if zdok_filtr
				set filter to alltrim(dsymbol)==alltrim(zdsymbol)
                go top
				go recno
              else
                seek zdsymbol
              endif  	
endif  
keyboard chr(205)
RETURN .t.


FUNCTION POPRAW_DOK()
local lprzyczyna:=1,lkordok:=1,ek,recno:=recno(),last_27:=.f.
dok_licz(zdndow,.f.)
save screen to ek
*if (zdtyp$export_gr.or.zdtyp$import_gr).and..not.zdtyp$kormag_gr
if zdtyp$eksportks_gr
  popraw_rozlicz_dok()
  keyboard chr(205)
  return
endif
if zdtyp$kasa_gr
  popraw_kasa_dok()
  keyboard chr(205)
  return
endif
g_tlo()
lprzyczyna=popr_menu(lprzyczyna)
do case
  case lprzyczyna = 1 .and. ( zdtyp$fiskal_gr.and.druk_fiskalna)
    kj_tkom(12," Uwaga! "," Dokument zwi•zany z drukark• fiskaln• !","Modyfikacja zablokowana.","Nacisnij dowolny klawisz.",5)   
  case lprzyczyna = 1 .and. (.not. zdtyp$fiskal_gr.or..not.druk_fiskalna)
    close_all("SH")
	dok_default()
	keyboard chr(205)
    tow_say(.f.,7)
    do while.t.
      tow_say(.f.,7)
      dok_end()
	  lkordok=popraw_end_menu(lkordok)
	  if lastkey()=27
	    last_27=.t.
	    kj_tkom(12," Uwaga ! ","Nie moæesz teraz zrezygnowaÜ.","Powr¢Ü do edycji"," lub zapami©taj dokument w aktualnym brzmieniu.",5) 
        keyboard chr(205)
	  else
	    last_27=.f.
	  endif
      if.not.last_27
	    do case
	      case lkordok=1.or.lkordok=2
		    select &buf_sel
		    if lkordok=1
			  vdok_plik=.f.
			else
			  vdok_plik=.t.
			endif   
		    dok_druk(vdok_plik,.t.)
		    keyboard chr(13)
		    close_all("SH")
		    select &dok_sel
            if.not.dok_use()
              kj_tkom(12," Uwaga!","Wyst•pià bà•d sieciwy","Przerwij aplikacj©, sprawd´ poà•czenie sieciowe i urucho ponownie.","",5)
              return .f.
            else
              if zdok_filtr			
			    set filter to alltrim(dsymbol)==alltrim(zdsymbol)
			    go top
			  else
                seek zdsymbol			
			  endif  
		    endif		   
		    exit

	      case lkordok=3
            keyboard chr(205)
	    endcase
	  endif
    enddo




  case lprzyczyna = 2
    kontrah(zk_serwer,.t.,zknaz1,1,.f.,2)
    dok_end()
    zdkontrah=zknum
*    select &dok_sel
*    if zsiec
*      if reclock(5)      
*        dok_replac()  
*        unlock
*      else
*        return
*      endif 
*    else
*      dok_replac()
*    endif 
*    close

	do while.t.
	  kj_dok_say(.t.)
	  lkordok=popraw_end_menu(lkordok)
	  do case
	    case lkordok=1.or.lkordok=2
          select &buf_sel
		  if lkordok=1
		    vdok_plik=.f.
		  else
		    vdok_plik=.t.
		  endif   
	select &buf_sel
    if.not.used()
	  *dok_default()
	  *set default to shset
	  set default to &set_serwer
	  if.not.kj_use("towbuf",.t.,3)
	    return .f.
	  else
	    set index to towbuf
	  endif
	endif
	      dok_default()
		  dok_druk(vdok_plik,.t.)
		  keyboard chr(13)		  
		  close_all("SH")
		  select &dok_sel
          if.not.dok_use()
            kj_tkom(12," Uwaga!","Wyst•pià bà•d sieciwy","Przerwij aplikacj©, sprawd´ poà•czenie sieciowe i urucho ponownie.","",5)
            return .f.
          else
            if zdok_filtr			
			  set filter to alltrim(dsymbol)==alltrim(zdsymbol)
			  go top
			  
			else
              seek zdsymbol			
			endif  
		  endif		   
		  exit

	    case lkordok=3
          keyboard chr(205)
	    case lkordok=4
		  exit	  
	  endcase
    enddo
endcase
close_all("SH")
***

***
*dok_default()
*select &dok_sel
*if kj_use("dokum",.f.,3)
*    set index to dok_ident,dok_num,dow_num
if dok_use()
              if zdok_filtr
				set filter to alltrim(dsymbol)==alltrim(zdsymbol)
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
keyboard chr(205)
RETURN .t.


******************************************************************************
* Pozycja przechwycona w towbuf, odnaleziona w dok_tow, usuni©ta i nast©pnie *
* przeprowadzona korekta 
* Operaca poprzedza poprzwianie pozycji
******************************************************************************
FUNCTION ANUL_POZ(pbufdel)
local select:=select()
if.not.tow_use(.f.)
  return .f.
endif

seek ztndow
do while tndow=ztndow
 if tmindex=ztmindex.and.til=ztil.and.(tcen=ztcen.or.kj_round(tcen,2)=kj_round(ztcen*zdkurs,2))
  do case
    case ztkormag


      if tmindex=ztmindex.and..not.(zdznak$zkordok_znak.and.til<0)
        if zsiec
          if reclock(5)
            delete
		    unlock
          else
	        kj_tkom(9," Uwaga ! ","Brak dostepu do rekordu.","Operacja kasowania nie zostala wykonana.","Sprawdz innych uzytkownikow i ponow probe.",5)
	      endif 	
        else
          delete
          pack
        endif
        close
	    mag_dladokum()
	    kor_poz(.t.)
	    select &tow_sel
	    close	              
	    select &buf_sel
	    if pbufdel
	      delete
	    endif  
	    return .t.
      endif
	otherwise
      if tnaz=ztnaz.and.tkod=ztkod.and..not.(zdznak$zkordok_znak.and.til<0)
        if zsiec
          if reclock(5)
            delete
		    unlock
          else
	        kj_tkom(9," Uwaga ! ","Brak dostepu do rekordu.","Operacja kasowania nie zostala wykonana.","Sprawdz innych uzytkownikow i ponow probe.",5)
	      endif 	
        else
          delete
          pack
        endif
        close
	    select &tow_sel
	    close	              
	    select &buf_sel
	    if pbufdel
	      delete
	    endif  
	    return .t.
      endif	
  endcase
 endif
 skip
enddo
RETURN .f.


FUNCTION WYROZNIK_O()
local select:=select()
if.not.tow_use(.f.)
  return .f.
endif

seek ztndow
do while tndow=ztndow
 if tmindex=ztmindex.and.til=ztil.and.(tcen=ztcen.or.kj_round(tcen,2)=kj_round(ztcen*zdkurs,2))
	            if reclock(5)      
	              replace twyroznik with "O"
                  unlock
				  close
				  return .t.
				endif   
 endif
 skip
enddo
close
RETURN .f.



FUNCTION ANUL_KPOZ()
	select &buf_sel
	delete
	return .t.
RETURN .f.


******************************************************************************
* Dopisuje pozycj© do otwartego pliku *_tow, przeprowadza korekt© syan¢w
******************************************************************************
FUNCTION DOPISZ_POZ(puse)
  if.not.tow_use(.f.)
    return .f.
  endif  
if zsiec
  if kj_append(3)
    tow_replac()
    unlock
  else
    return .f.
  endif
else
  append blank
  tow_replac()
endif
if ztkormag
  mag_dladokum()
  kor_poz(.f.)	              
endif
select &tow_sel
close
RETURN .t.


FUNCTION MAG_DLADOKUM()
if.not.empty(zdg_magazyn)
  zgmag=zm_serwer+zdg_magazyn+"MAG"
endif
set default to &zgmag
select &gmag_sel
if.not.used()
  if.not.kj_use("magaz",.f.,3)
    return .f.
  endif
endif
set index to m_index

*if zdtyp$przes_gr
*  if.not.empty(zdp_magazyn)
*    zpmag=zm_serwer+zdp_magazyn+"MAG"
*  endif
*  set default to &zpmag
*  magdefault(val(zdp_magazyn)) 
*  select &pmag_sel
*  if.not.used()
*    if.not.kj_use("magaz",.f.,3)
*	  return .f.
*	endif
*  endif
*  set index to mag_num
*endif
RETURN

FUNCTION ANUL_DOK()
local recno:=recno(),lanul:=.not.danul
		  if.not.danul
		    if.not.kj_gkom(12," Uwaga! ","Dokument zostanie anulowany.","WykonaÜ ?",.t.,25)
              return .t.
            endif
		  else
		    if.not.kj_gkom(12," Uwaga! ","Dokument byà anulowany.","Przywr¢ciÜ  ?",.t.,5)
              return .t.
            endif		  
		  endif	
* adnotacja w anulowanym dokumencie
			  
			  if zsiec
	            if reclock(5)      
	              replace danul with lanul,dkormag_ok with .f.
                  unlock
				else
                  kj_tkom(12," Uwaga! ","Brak dost©pu do rekordu bazy danych.","Dokument nie zostaà anulowany","Ponow pr¢b•.",5) 
                  return .t.
			    endif	
	          else
			    replace danul with lanul
	          endif					  		    		  

* towar
              if.not.tow_use(.f.)
                  kj_tkom(12," Uwaga! ","Brak dost©pu do baz danych.","Dokument nie zostaà poprawnie anulowany","Zapami©taj numer dokumentu i skontaktuj si© z serwisem.",5) 
                  select &select
				  return .t.
              endif
              seek zdndow
			  if found()
			    do while tndow=zdndow
* adnotacja w anulowanych towarach
			      if zsiec
	                if reclock(5)      
	                  replace twykonal  with .f.
			          if lanul
				        replace tanul with .t.
				      else
				        replace tanul with .f.
				      endif	
					  unlock		          	
					else
                      kj_tkom(12," Uwaga! ","Brak dost©pu do rekordu bazy danych.","Dokument nie zostaà anulowany","Ponow pr¢b•.",5) 
                      return .f.
			        endif	
	              else
			        replace twykonal  with .f.
			          if lanul
				        replace tanul with .t.
				      else
				        replace tanul with .f.
				      endif			          						
	              endif					  		    		  				  
				  skip
				enddo
			  else
                  kj_tkom(12," Uwaga! ","Bà•d w bazie dokument¢w.","Dokument nie zostaà poprawnie anulowany","Zapami©taj numer dokumentu i skontaktuj si© z serwisem.",5) 
                  return .f.			  			  
			  endif              
			  close_all("SH")
* korekta stan¢w magazynowych              
			  if zdtyp$kormag_gr
		        if kor_mag(lanul)
			      dok_znacz()
			    endif
		        if zfifo
				  do case
				    case zdtyp$zakup_gr
					  fifo_zak_anul()
					case zdtyp$sprzedaz_gr
					  fifo_sp_anul()
				  endcase
				endif
				
			  endif                              
              close_all("SH")
if kasa_glowna.and.zdtyp$kasadok_gr
  zkj_kasa=.t.
  dok_use()
  set filter to dnzam==zdndow
  go top
  do while.not.eof()
	                if reclock(5)      
			          if lanul
				        replace danul with .t.
				      else
				        replace danul with .f.
				      endif	
					  unlock		          	
					endif
    
    skip
  enddo
  zkj_kasa=.f.
  close_all("SH")
  *ANULKAS
endif
if zdtyp$kasa_gr.and..not.empty(zdnzam)
  zkas_przed=0
  if lanul
    kasdok_dok(.f.)
  else	
    kasdok_dok(.t.)
  endif
endif
			  *dok_default()
			  *select &dok_sel
              *if.not.kj_use("dokum",.f.,3)
              if.not.dok_use()
			     return .f.
              endif
			  *set index to dok_ident,dok_num,dow_num
              if zdok_filtr
                set filter to alltrim(dsymbol)==alltrim(zsymbol_dok)
                go top
              else
                seek zdsymbol
              endif  
			  go recno
RETURN .t.

*******************************************************************************
* Funkcja wykorzystywana w dokumentach koryguj•cych do wydzielenia
* pozycji korygowanych 
*******************************************************************************
FUNCTION REDUK_BUF()
local recno,ltnaz,ltkod,ltmindex,ltstawka,ltil,ltjm,ltcen,ltsymbol
pack
go top
do while.not.eof()
  replace tanul with .f.
  skip
enddo
go top
do while.not.eof()
  recno=recno()
  ltnaz=tnaz
  ltkod=tkod
  ltmindex=tmindex
  ltstawka=tstawka
  ltil=-1*til
  ltjm=tjm
  ltcen=tcen
  ltsymbol=tsymbol
  locate for tnaz=ltnaz.and.tkod=ltkod.and.tmindex=ltmindex.and.tstawka=ltstawka.and.til=ltil.and.tjm=ltjm.and.tcen=ltcen.and.tsymbol=ltsymbol.and.til#0.and..not.tanul
  if found()
    delete
	go recno
	delete
  endif
  go recno
  skip
enddo

go top
do while.not.eof()           &&Wyrzucenie pozycji z iloòci• zero przed korekt•
  recno=recno()
  ltnaz=tnaz
  ltkod=tkod
  ltmindex=tmindex
  ltstawka=tstawka
  ltil=-1*til
  ltjm=tjm
  ltcen=tcen
  ltsymbol=tsymbol
  if til=0
    locate for tnaz=ltnaz.and.tkod=ltkod.and.tmindex=ltmindex.and.tstawka=ltstawka.and.til=ltil.and.tjm=ltjm.and.tcen=ltcen.and.tsymbol=ltsymbol.and..not.tanul.and.recno()#recno
    if found()
      delete
	  go recno
	  delete
    endif
    go recno
  endif
  skip
enddo
go top
RETURN .t.


FUNCTION D_FILTR()
local ek,lbelka:="FILTR",ltnaz[9],ltlit[9],lopis[9],lpoz:=1
local lcolor:=setcolor(),recno:=recno(),lznak:=0
g_tlo()
ltnaz[1]:="Kontrahent"
ltnaz[2]:="Miesi•c   "
ltnaz[3]:="Nie rozl. " 
ltnaz[4]:="Zalegàe   "
ltnaz[5]:="Dzie‰     "
ltnaz[6]:="Grupy dok."
ltnaz[7]:="Rok       "  
ltnaz[8]:="Akwizytor "
ltnaz[9]:="*         "
ltlit[1]:="K         "
ltlit[2]:="M         "
ltlit[3]:="N         "
ltlit[4]:="Z         "
ltlit[5]:="D         "
ltlit[6]:="G         "
ltlit[7]:="R         "
ltlit[8]:="A         "
ltlit[9]:="          "
lopis[1]:="Dokumenty zwi•zane z wybranym kontrahentem"
lopis[2]:="Dokumenty z wybranego miesi•ca."
lopis[3]:="Dokumenty nie rozliczone."
lopis[4]:="Dokumenty nie rozliczone z przekroczonym terminem pàatnoòci."
lopis[5]:="Dokumenty z wybranego dnia."
lopis[6]:="Prezentacja wybranych grup dokument¢w"
lopis[7]:="Dokumenty z wybranego roku"
lopis[8]:="Dokumenty zwi•zane z wybranym akwizytorem"
lopis[9]:=""
save screen to ek
set color to
@ 12,0 clear to 24,14
lpoz=men_pion(13,1,9,lbelka,ltnaz,ltlit,lopis,lpoz)
set color to
do case
      case lastkey()=27
        fwar=".t."
*		dwar_start=dwar1_start
		dwar=dwar_start
      case lpoz=1					 
        kontrah(zk_serwer,.t.,"",1,.f.,1)
		dok_default()
		select &dok_sel

		fwar=fwar+".and.dkontrah=zknum"
		dwar=dwar_start+".and."+fwar
		keyboard chr(205)

		  
 	  case lpoz=2
        if zdtyp$dowod_gr
	      f_miesiac=month(ddatdow)
		else
		  f_miesiac=month(ddatdok)
		endif  
		   @ 21,15 clear to 23,78
           @ 22,20 say " Miesi•c:                                    "
           set cursor on
		   
           @ 22,31 get f_miesiac picture "99"
		   read
           set cursor off
		   if zdtyp$dowod_gr
             fwar=fwar+".and.month(ddatdow)=f_miesiac"
		   else
		     fwar=fwar+".and.month(ddatdok)=f_miesiac"
		   endif	 
		  dwar=dwar_start+".and."+fwar
          keyboard chr(205)		  

 	  case lpoz=3
          *fwar=fwar+".and.dniedop>0"&&zmiana dn 11.04.2003
		  fwar=fwar+".and..not.dniedop=0"
          dwar=dwar_start+".and."+fwar
		  keyboard chr(205)
		  
		  
 	  case lpoz=4
          fwar=fwar+".and.dniedop>0.and.max(dtermin,date())=date()"
          dwar=dwar_start+".and."+fwar
		  keyboard chr(205)		  		  		  
		  			 
 	  case lpoz=5
	    if zdtyp$dowod_gr
		  f_ddatdok=ddatdow
		else
	      f_ddatdok=ddatdok
		endif  
		   @ 21,15 clear to 23,78
           @ 22,20 say " Data  :                                     "
           set cursor on
           @ 22,31 get f_ddatdok
		   read
           set cursor off
          if zdtyp$dowod_gr
		    fwar=fwar+".and.dtoc(ddatdow)=dtoc(f_ddatdok)"
		  else
		    fwar=fwar+".and.dtoc(ddatdok)=dtoc(f_ddatdok)"
		  endif
		  	
          dwar=dwar_start+".and."+fwar
		  keyboard chr(205)

 	  case lpoz=6
        dwar_start=".t."
		do case
		  case zznak_dok $ sprzedaz_gr
		    fd_grupa=sprzedaz_gr
		  case zznak_dok $ zakup_gr
		    fd_grupa=zakup_gr			
		  otherwise
		    fd_grupa=space(30)
		endcase
		   @ 21,15 clear to 23,78
           @ 22,20 say " Grupa :                                     "
           set cursor on
           @ 22,31 get fd_grupa when s_kom("Wyb¢r grup dokument¢w do prezentacji")
           read
           set cursor off
          fwar=fwar+".and.dtyp$ALLTRIM(fd_grupa).and..not.danul"
		  dwar=fwar
		  *dwar=dwar_allstart+".and."+fwar
          keyboard chr(205)		  



 	  case lpoz=7
        if zdtyp$dowod_gr
	      f_rok=year(ddatdow)
		else
		  f_rok=year(ddatdok)
		endif  
		   @ 21,15 clear to 23,78
           @ 22,20 say " Rok :"
           set cursor on
		   
           @ 22,31 get f_rok picture "9999"
		   read
           set cursor off
		   if zdtyp$dowod_gr
             fwar=fwar+".and.year(ddatdow)=f_rok"
		   else
		     fwar=fwar+".and.year(ddatdok)=f_rok"
		   endif	 
		  dwar=dwar_start+".and."+fwar
          keyboard chr(205)		  

      case lpoz=8					 
		zdakwizytor=akwizytor()		
		select &dok_sel
        if.not.lastkey()=27
		  fwar=fwar+".and.dakwizytor=zdakwizytor"
		  dwar=dwar_start+".and."+fwar
		endif
		keyboard chr(205)

		  


endcase
restore screen from ek
setcolor(lcolor)
RETURN NIL


FUNCTION DKAS_FILTR()
local ek,lbelka:="FILTR",ltnaz[9],ltlit[9],lopis[9],lpoz:=1
local lcolor:=setcolor(),recno:=recno(),lznak:=0
g_tlo()
ltnaz[1]:="Kontrahent"
ltnaz[2]:="Rok       "
ltnaz[3]:="Miesi•c   " 
ltnaz[4]:="Dzie‰     "
ltnaz[5]:="*         "
ltnaz[6]:="*         "
ltnaz[7]:="*         "  
ltnaz[8]:="*         "
ltnaz[9]:="*         "
ltlit[1]:="K         "
ltlit[2]:="R         "
ltlit[3]:="M         "
ltlit[4]:="D         "
ltlit[5]:="          "
ltlit[6]:="          "
ltlit[7]:="          "
ltlit[8]:="          "
ltlit[9]:="          "
lopis[1]:="Dokumenty zwi•zane z wybranym kontrahentem"
lopis[2]:="Dokumenty z wybranego roku."
lopis[3]:="Dokumenty z wybranego miesi•ca."
lopis[4]:="Dokumenty z wybranego dnia."
lopis[5]:=""
lopis[6]:=""
lopis[7]:=""
lopis[8]:=""
lopis[9]:=""
save screen to ek
set color to
@ 12,0 clear to 24,14
lpoz=men_pion(13,1,9,lbelka,ltnaz,ltlit,lopis,lpoz)
set color to
do case
      case lastkey()=27
        fwar=".t."
*		dwar_start=dwar1_start
		dwar=dwar_start
      case lpoz=1					 
        kontrah(zk_serwer,.t.,"",1,.f.,1)
		dok_default()
		select &dok_sel

		fwar=fwar+".and.dkontrah=zknum"
		dwar=dwar_start+".and."+fwar
		keyboard chr(205)

 	  case lpoz=2
        if zdtyp$dowod_gr
	      f_rok=year(ddatdow)
		else
		  f_rok=year(ddatdok)
		endif  
		   @ 21,15 clear to 23,78
           @ 22,20 say " Rok :"
           set cursor on
		   
           @ 22,31 get f_rok picture "9999"
		   read
           set cursor off
		   if zdtyp$dowod_gr
             fwar=fwar+".and.year(ddatdow)=f_rok"
		   else
		     fwar=fwar+".and.year(ddatdok)=f_rok"
		   endif	 
		  dwar=dwar_start+".and."+fwar
          keyboard chr(205)		  

		  
 	  case lpoz=3
        if zdtyp$dowod_gr
	      f_miesiac=month(ddatdow)
		else
		  f_miesiac=month(ddatdok)
		endif  
		   @ 21,15 clear to 23,78
           @ 22,20 say " Miesi•c:                                    "
           set cursor on
		   
           @ 22,31 get f_miesiac picture "99"
		   read
           set cursor off
		   if zdtyp$dowod_gr
             fwar=fwar+".and.month(ddatdow)=f_miesiac"
		   else
		     fwar=fwar+".and.month(ddatdok)=f_miesiac"
		   endif	 
		  dwar=dwar_start+".and."+fwar
          keyboard chr(205)		  

		  			 
 	  case lpoz=4
	    if zdtyp$dowod_gr
		  f_ddatdok=ddatdow
		else
	      f_ddatdok=ddatdok
		endif  
		   @ 21,15 clear to 23,78
           @ 22,20 say " Data  :                                     "
           set cursor on
           @ 22,31 get f_ddatdok
		   read
           set cursor off
          if zdtyp$dowod_gr
		    fwar=fwar+".and.dtoc(ddatdow)=dtoc(f_ddatdok)"
		  else
		    fwar=fwar+".and.dtoc(ddatdok)=dtoc(f_ddatdok)"
		  endif
		  	
          dwar=dwar_start+".and."+fwar
		  keyboard chr(205)

endcase
restore screen from ek
setcolor(lcolor)
RETURN NIL





FUNCTION KJ_RABAT(prab)
local ek,lrab:=prab,ltcen,select:=select()
save screen to ek
g_tlo()
      *set default to shset
	  set default to &set_serwer
      select &buf_sel
	  if.not.used()
        if.not.kj_use("towbuf",.t.,3)
	      return .f.
	    else
		  set index to towbuf
		endif
      endif
@ 22,28 say "Zatwierd´ rabat:         %"
set cursor on
@ 22,45 get lrab picture "999.9999"
read
set cursor off
if.not.lrab=prab.and..not.lastkey()=27
  do while.not.eof()
	ltcen=(tcen*100)/(100-prab)
	ltcen=(ltcen*(100-lrab))/100
	*replace tcen with kj_round(ltcen,4)     
	replace tcen with kj_round(ltcen,2)      &&12LUTY2003     
    skip
  enddo	  
  zdrabat=lrab
  zkrabat=lrab
endif
tow_say(.f.,1)
select &select
restore screen from ek  
RETURN .t.


FUNCTION KJ_BAZRABAT(pbyl,pjest)
local ek,ltcen,select:=select()
      if.not.tow_use(.f.)
	      return .f.
      endif
if.not.pbyl=pjest
  seek zdndow
  if found()
    do while tndow=zdndow
	  ltcen=(tcen*100)/(100-pbyl)
	  ltcen=(ltcen*(100-pjest))/100
		    if zsiec
	          if reclock(5)      
	            replace tcen with kj_round(ltcen,4)     
				unlock
	          endif	
	        else
              replace tcen with kj_round(ltcen,4)     
	        endif	
			commit			  	  
      skip
    enddo	  
  else
    kj_tkom(12," Uwaga ! ","Podczas zmiany rabatu wyst•pià bl•d","Zmiany nie zostan• poprawnie zapami©tane.","Usu‰ problem i ponow pr¢b© lub skontaktuj si© z serwisem.",5)
  endif	
endif
select &select
RETURN .t.

FUNCTION RABAT_PLUS()
local ek,lrabat_plus:=0,recno:=recno()
    save screen to ek
	@ 21,0 clear to 23,79
	@ 22,30 say "  Rabat :           "
	set cursor on
	@ 22,41 get lrabat_plus picture "999.9999" when s_kom("Wpisz rabat dla wybranej pozycji. ")
	read
	set cursor off
	if.not.lastkey()=27
	  replace tcen with ((100-lrabat_plus)/100)*tcen
	endif
	restore screen from ek
    go top
    tplik_sum(".not.eof()")
    go recno	
RETURN



FUNCTION DOK_SUM()
local lnet:=0,lvat:=0,lbrut:=0,lniedop:=0,ek,lcolor:=setcolor()
local recno:=recno(),lgrupa:=sprzedaz_gr,lpoz:=1
save screen to ek
go top
do while.not.eof()
  kj_okno(17,1,3," Czekaj !   Trwaj• obliczenia.          ",5)	  
  @ 18,2 say dndok + "  " +dnskrot
  zdtyp=dtyp
  if.not.danul
    dok_licz(dndow,.f.)
    lnet=lnet+ztnet_all
    lvat=lvat+ztvat_all
    lbrut=lbrut+ztbrut_all
    lniedop=lniedop+dniedop
  endif	
  skip
enddo
restore screen from ek
set color to
      @ 21,1 say "∞ ù§CZNA NIEDOPùATA:              ∞∞                 NETTO...                ∞"
      @ 22,1 say "∞                                 ∞∞ RAZEM WARTOóè : VAT.....                ∞"
      @ 23,1 say "∞                                 ∞∞                 BRUTTO..                ∞"

@ 22,10 say lniedop picture "999 999 999.99"
@ 21,63 say lnet picture "999 999 999.99"
@ 22,63 say lvat picture "999 999 999.99"
@ 23,63 say lbrut picture "999 999 999.99"

lpoz=doksum_menu(lpoz)
if.not.lastkey()=27
  do case
    case lpoz=1
      doksum_druk(.T.)     && do pliku
    case lpoz=2
      doksum_druk(.f.)     && na drukark©	
  endcase
endif
restore screen from ek
setcolor(lcolor)
RETURN

FUNCTION DOKSUM_DRUK(pplik)
local lnet:=0,lvat:=0,lbrut:=0,lniedop:=0,lcolor:=setcolor()
local lpoz:=0,plik:="wydruki\nowy.txt",select:=select(),ek
local ltxt1:="            Z E S T A W I E N I E    D O K U M E N T ‡ W                      "
local ltxt2:="            ============================================                      "
local ltxt3:=space(78),ltxt4:=space(78),ltxt5:=space(78)

if.not.lastkey()=27
  if pplik
    kj_okno(17,1,3," Czekaj !                        ",2)	  
    set color to n/w,w/n
	@ 18,2 say "Trwa przygotowanie wydruku. "
	@ 19,2 say "Moæe to potrwaÜ kilka minut !"
	set color to
	plik="wydruki\doksum.txt"
    set printer to &plik
  else
    kj_okno(0,0,6, "  Tytuà raportu                                                                 ",2)
    set color to n/w,w/n
    set cursor on
    @ 1,1 get ltxt1 when s_kom("Wpisz pierwsz• linijk© nagà¢wka")
    @ 2,1 get ltxt2 when s_kom("Wpisz drug• linijk© nagà¢wka")
    @ 3,1 get ltxt3 when s_kom("Wpisz trzeci• linijk© nagà¢wka")
    @ 4,1 get ltxt4 when s_kom("Wpisz czwart• linijk© nagà¢wka")
    @ 5,1 get ltxt5 when s_kom("Wpisz pi•t• linijk© nagà¢wka")
    read
    set cursor off
    setcolor(lcolor)	  
    if.not.pstart_druk()
      dok_default() 
      select &select
      set device to screen
 	  return .f.
    endif
  endif
  set device to printer
  w=prow()
      doksum_tyt(ltxt1,ltxt2,ltxt3,ltxt4,ltxt5)  
      go top
	  do while.not.eof()
        if.not.danul
          lpoz=lpoz+1
		  dok_licz(dndow,.t.)
          lnet=lnet+ztnet_all
          lvat=lvat+ztvat_all
          lbrut=lbrut+ztbrut_all
          lniedop=lniedop+dniedop
          @ w,0 say " "
		  @ w,1 say lpoz picture "9999"
		  @ w,5 say dndok
		  @ w,22 say ddatdok
		  @ w,34 say dnskrot
		  @ w,49 say ztnet_all picture "9999999.99"
		  if.not.zdtyp$kasa_gr
		    @ w,61 say ztvat_all picture "9999999.99"
		    @ w,72 say ztbrut_all picture "9999999.99"
		    if.not.zdtyp$przes_gr
		      @ w,85 say dniedop picture "9999999.99"
		      @ w,98 say dtermin picture "9999999.99"
		    endif
		  endif
		  @ w,109 say " "
		  w=w+1
		endif		    
	    skip
	  enddo
      if.not.zdtyp$kasa_gr
	    @ w,0 say "--------------------------------------------------------------------------------------------------------------" 
        w=w+1
	    @ w,0 say "                                   R a z e m :                                                                "
		  @ w,49 say lnet picture "9999999.99"
		  @ w,61 say lvat picture "9999999.99"
		  @ w,72 say lbrut picture "9999999.99"
		  if.not.zdtyp$przes_gr
		    @ w,85 say lniedop picture "9999999.99"	  
		  endif	
	    w=w+1
	    @ w,0 say "                                ------------------------------------------------------------------------------"
      else
	    @ w,0 say "-------------------------------------------------------------"
        w=w+1
	    @ w,0 say "                                   R a z e m :                                                               |"
		  @ w,49 say lnet picture "9999999.99"
	    w=w+1
	    @ w,0 say "                                -----------------------------"
	  endif	
  eject

  set device to screen
  if pplik
    save screen to ek
    edi=edit+" wydruki\doksum.txt"
    run &edi 
    restore screen from ek
    set cursor off   
  endif
endif
select &select
RETURN nil

FUNCTION DOKSUM_TYT(ptxt1,ptxt2,ptxt3,ptxt4,ptxt5)
local lnet:=0,lvat:=0,lbrut:=0,lniedop:=0
@ prow(),pcol() say &zdr_kkond
k=0
w=prow()
@ w,k say ptxt1
w=w+1
@ w,k say ptxt2
w=w+1
@ w,k say ptxt3
w=w+1
@ w,k say ptxt4
w=w+1
@ w,k say ptxt5 + &zdr_kond
w=w+1
if.not.zdtyp$przes_gr
  if.not.zdtyp$kasa_gr
    @ w,k say "--------------------------------------------------------------------------------------------------------------"
    w=w+1
    @ w,k say "  Lp.      Numer         Data       Kontrahent     WartoòÜ     Podatek    WartoòÜ     Niedopàata    termin    " 
    w=w+1
    @ w,k say "         dokumentu    dokumentu                   N E T T O     V A T    B R U T T O               pàatnoòci  " 
    w=w+1
    @ w,k say "--------------------------------------------------------------------------------------------------------------" 
  else
    @ w,k say "-------------------------------------------------------------"
    w=w+1
    @ w,k say "  Lp.      Numer         Data       Kontrahent     WartoòÜ   "
    w=w+1
    @ w,k say "         dokumentu    dokumentu                               "
    w=w+1
    @ w,k say "-------------------------------------------------------------"
  endif	
else
  @ w,k say "--------------------------------------------------------------------------------------------------------------"
  w=w+1
  @ w,k say "  Lp.      Numer         Data       Kontrahent     WartoòÜ     Podatek    WartoòÜ           U w a g i         " 
  w=w+1
  @ w,k say "         dokumentu    dokumentu                   N E T T O     V A T    B R U T T O                          " 
  w=w+1
  @ w,k say "--------------------------------------------------------------------------------------------------------------" 
endif

w=w+1
RETURN 

FUNCTION UPARAM_GET()
local ek,lcolor:=setcolor(),sciezka:=zset_serwer+"LEG01"
local lkonto1:=substr(zlic_konto,1,30)
local lkonto2:=substr(zlic_konto,31)
local ltel:=zlic_tel,lfax:=zlic_fax,lreg:=zlic_regon
if zkonto_newtyp
  lkonto1:=substr(zlic_konto,1,32)
  lkonto2:=substr(zlic_konto,33)
endif
save screen to ek
g_tlo()
kj_okno(3,5,19, "  Parametry Uæytkownika - wàaòciciela LICENCJI                        ",2)
@ 5,7 say "Nazwa ..."+zlic1
@ 6,7 say "         "+zlic2
@ 7,7 say "Adres ..."+zlic5
@ 8,7 say "         "+zlic3
@ 9,7 say "Nip ....."+zlic6
@ 11,6 say replicate("-",68)
@ 13,7 say "Konto .."
@ 16,7 say "Telefon "
@ 18,7 say "Fax ...."
@ 20,7 say "Regon .."
set cursor on
*if.not.zl123
  @ 5,16 get zlic1
  @ 6,16 get zlic2
  @ 7,16 get zlic5
  @ 8,16 get zlic3
  @ 8,24 get zlic4 picture "@S42"
  @ 9,16 get zlic6
*endif
@ 13,15 get lkonto1
@ 14,15 get lkonto2
@ 16,15 get ltel
@ 18,15 get lfax
@ 20,15 get lreg
read
if .not. lastkey()=27
  if.not.zkonto_newtyp
    zlic_konto=stuff(zlic_konto,1,30,lkonto1)
    zlic_konto=stuff(zlic_konto,31,30,lkonto2)
  else
    zlic_konto=stuff(zlic_konto,1,32,lkonto1)
    zlic_konto=stuff(zlic_konto,33,30,lkonto2)  
  endif
  zlic_tel=ltel
  zlic_fax=lfax
  zlic_regon=lreg
  set default to &sciezka
  if file("leg01.dbf")
    if kj_use("leg01",.f.,3)
        if reclock(5)      
	      replace lic_konto with zlic_konto,lic_tel with zlic_tel
		  replace lic_fax with zlic_fax,lic_regon with zlic_regon  
          *if.not.zl123
            replace lic1 with kod(zlic1),lic2 with kod(zlic2)
            replace lic3 with kod(zlic3),lic4 with kod(zlic4)
            replace lic5 with kod(zlic5),lic6 with kod(zlic6)
		  *endif
		  unlock
	    else
          return 
	    endif
      commit
    endif	
  else
    kj_tkom(12," Uwaga! ","Plik <leg01.dbf> nie odnaleziony","Sprawd´ poà•czenia sieciowe","",5)
  endif
endif
set cursor off
restore screen from ek
setcolor(lcolor)
RETURN 





************************ t_analiza
FUNCTION TOWANAL()
local ek,t[7],q[7],lcolor:=setcolor()
if zrozmiar
  t[1]:="tnaz"
else
  t[1]:="substr(tnaz,1,32)"
endif  
t[2]:="tkod"
t[3]:="str(til,10,mag_round)"
t[4]:="tjm"
t[5]:="tcen"
t[6]:="tstawka"
t[7]:="kj_round(tcen*((100+tstawka)/100),2)"
q[1]:="Nazwa"
q[2]:="Kod"
q[3]:="IloòÜ"
q[4]:="J.m"
q[5]:="Cena NETTO"
q[6]:="Stawka VAT"
q[7]:="Cena BRUTTO"
if zhistowcen   &&Jeòli prezentacja w cenach brutto
  t[5]:="kj_round(tcen*((100+tstawka)/100),2)"
  t[7]:="tcen"
  q[5]:="Cena BRUTTO"
  q[7]:="Cena NETTO"
endif
save screen to ek
kj_okno(0,0,24, "  DOS-Mag :  Analiza szczeg¢àowa obrotu towarowego                              ",2)

dok_use()
set order to 3
tow_use(.f.)
set filter to &twar_start
go top
do skom with "<F>iltr     s<U>ma     <S>zukaj     d<R>ukuj    <Esc>"
dbedit(1,1,20,78,t,"TA_FU","",q,"ﬂ",,"∞")
close
select &dok_sel
close
restore screen from ek
setcolor(lcolor)
RETURN

FUNCTION TA_FU()
local last:=lastkey(),lcolor:=setcolor()
ztow_lad()
select &dok_sel
seek ztndow
if found()
  zdok_lad()
else
  if.not.empty(ztndow)
    kj_tkom(12," Uwaga! ","","Problem w odnalezieniu dokumentu","NR "+ztndow,5)  
  endif
endif
select &tow_sel
set color to
@ 21,1 clear to 23,78
@ 21,1 say " Numer dowodu .....                  z dnia"
@ 22,1 say " Numer dokumentu ..                  z dnia"
@ 21,20 say zdndow
@ 21,46 say zddatdow
@ 22,20 say zdndok
@ 22,46 say zddatdok
setcolor(lcolor)
do case
  case last=27
    return 0
  case chr(last)$"Ff"
    fwar=".t."
    do while.t.
	  t_filtr()
	  if kj_gkom(12,"","Zako‰czyÜ definiowanie filtru ?","",.t.,5)
        exit
	  endif
	enddo  
	if lastkey()#27
	  set filter to &twar
      go top
	endif
    keyboard chr(205)
	return 2		  		
  case chr(last)$"Ss"
    t_sek_szuk() 
    keyboard chr(205)
	return 2		  			
	
  case chr(last)$"Uu"
    t_suma() 
    keyboard chr(205)
	return 2		  				
	
  case chr(last)$"Rr"
    t_hisdruk() 
    keyboard chr(205)
	return 2		  					


endcase
RETURN 1

************************** t_filtr
FUNCTION T_FILTR()
local ek,lbelka:="FILTR",ltnaz[4],ltlit[4],lopis[4],lpoz:=1,lpoz1:=1,lpoz2:=1
local lcolor:=setcolor(),recno:=recno(),lznak:=0,lpoz3:=1,lpoz4:=1
local t[1],q[1],lplik:="",select
t[1]:="at_nazwa"
q[1]:="Wybierz grup© dok."
g_tlo()
ltnaz[1]:="Kontrahent "
ltnaz[2]:="Towar     "
ltnaz[3]:="Dokument  " 
ltnaz[4]:="Okres     "
ltlit[1]:="K         "
ltlit[2]:="T         "
ltlit[3]:="D         "
ltlit[4]:="O         "
lopis[1]:="Wydziel tylko towary zwi•zane z wybranym kontrahentem."
lopis[2]:="Wydziel tylko wybrane towary."
lopis[3]:="Wydziel towary zwi•zane z odpowiednimi dokumentami."
lopis[4]:="Wydziel towary zwi•zane z okreòlonymi datami."
save screen to ek
set color to
@ 16,0 clear to 24,14
lpoz=men_pion(17,1,4,lbelka,ltnaz,ltlit,lopis,lpoz)
set color to
do case
      case lastkey()=27
        fwar=".t."
		twar=twar_start
        restore screen from ek
        setcolor(lcolor)
        return
	  
	  case lpoz=1
        kontrah(zk_serwer,.t.,"",1,.f.,1)
        select &kon_sel
		close
		select &tow_sel
		fwar=fwar+".and.f_kontrah()"	  		

	  case lpoz=2
	    lpoz1=ftowar_menu(lpoz1)
        do case
		  case lpoz1=1
		    f_tnaz=tnaz
            kj_okno(10,18,4, " Filtr na nazw© towaru                      ",2)		    
			set color to n/w,w/n
			@ 12,20 say "Nazwa:"
			setcolor(lcolor)
			set cursor on
			@ 12,28 get f_tnaz picture "@!" 
			read
			set cursor off
            if.not.empty(f_tnaz).and.lastkey()#27
			  f_tnaz=alltrim(f_tnaz)
              fwar=fwar+".and.substr(tnaz,1,len(f_tnaz))=f_tnaz"
			endif
		  case lpoz1=2
		    f_tkod=tkod
            kj_okno(10,18,4, " Filtr na kod towaru                        ",2)		    
			set color to n/w,w/n
			@ 12,20 say "K o d:"
			setcolor(lcolor)
			set cursor on
			@ 12,28 get f_tkod picture "@!" 
			read
			set cursor off
            if.not.empty(f_tkod).and.lastkey()#27
			  f_tkod=alltrim(f_tkod)
              fwar=fwar+".and.substr(tkod,1,len(f_tkod))=f_tkod"
			endif		
			case lpoz1=3
            kj_okno(10,18,4, " Filtr na towar                             ",2)		    
			set color to n/w,w/n
			@ 12,20 say "Nazwa:"
            @ 12,28 say tnaz picture "@!" 
			if kj_gkom(19,"","ZatwierdziÜ ?","",.t.,5)
			  f_tmindex=str(tmindex) 
              fwar=fwar+".and.str(tmindex)=f_tmindex"
			endif	
		endcase 

	  case lpoz=3
	    lplik=set_serwer+"\antowar.dbf"
		if file(lplik)
          select=select()		  
		  if antowar_use()
		    @ 11,13 to 23,35
		    keyboard chr(205)
			dbedit(12,14,22,34,t,"AT_FU","",q,"ﬂ",,"ﬂ")
		      if.not.lastkey()=27
		        fwar=fwar+".and.f_dtyp(zat_typy)"	  				  
		      endif
			  close
			  keyboard chr(205)
           endif
		   select &select
		else
	      lpoz2=fdokument_menu(lpoz2)
		  do case
		    case lpoz2=1
		      fwar=fwar+".and.f_dtyp(sprzedaz_gr)"	  				  
		    case lpoz2=2
		      fwar=fwar+".and.f_dtyp(zakup_gr)"	  		
		  endcase
        endif

      case lpoz=4
        lpoz3=fokresdok_menu(lpoz3)
		lpoz4=fokres_menu(lpoz4)
        do case
		  case lpoz3=1.and.lpoz4=1
		    f_tdat=date()
            kj_okno(10,18,4, " Filtr na wybrany dzie‰                     ",2)		    
			set color to n/w,w/n
			@ 12,20 say "Data :"
			setcolor(lcolor)
			set cursor on
			@ 12,28 get f_tdat
			read
			set cursor off
            if lastkey()#27
              fwar=fwar+".and.f_datdok(f_tdat)"
			endif			
			
		  case lpoz3=1.and.lpoz4=2
		    f_tmiesiac=month(date())
            kj_okno(10,18,4, " Filtr na wybrany miesi•c                   ",2)		    
			set color to n/w,w/n
			@ 12,20 say "Miesi•c : "
			setcolor(lcolor)
			set cursor on
			@ 12,33 get f_tmiesiac picture "99"
			read
			set cursor off
            if lastkey()#27
              fwar=fwar+".and.f_miesdok(f_tmiesiac)"
			endif						
			
		  case lpoz3=1.and.lpoz4=3
		    f_tdat1=date() 
			f_tdat2=date()
            kj_okno(10,18,4, " Filtr na wybrany okres                     ",2)		    
			set color to n/w,w/n
			@ 12,20 say "Od dnia : "
			@ 13,20 say "Do dnia : "
			setcolor(lcolor)
			set cursor on
			@ 12,33 get f_tdat1
			@ 13,33 get f_tdat2
			read
			set cursor off
            if lastkey()#27
              fwar=fwar+".and.f_2datdok(f_tdat1,f_tdat2)"
			endif									
			
		  case lpoz3=2.and.lpoz4=1
		    f_tdat=date()
            kj_okno(10,18,4, " Filtr na wybrany dzie‰                     ",2)		    
			set color to n/w,w/n
			@ 12,20 say "Data :"
			setcolor(lcolor)
			set cursor on
			@ 12,28 get f_tdat
			read
			set cursor off
            if lastkey()#27
              fwar=fwar+".and.f_datdow(f_tdat)"
			endif			
			
		  case lpoz3=2.and.lpoz4=2
		    f_tmiesiac=month(date())
            kj_okno(10,18,4, " Filtr na wybrany miesi•c                   ",2)		    
			set color to n/w,w/n
			@ 12,20 say "Miesi•c : "
			setcolor(lcolor)
			set cursor on
			@ 12,33 get f_tmiesiac picture "99"
			read
			set cursor off
            if lastkey()#27
              fwar=fwar+".and.f_miesdow(f_tmiesiac)"
			endif						
			
		  case lpoz3=2.and.lpoz4=3
		    f_tdat1=date() 
			f_tdat2=date()
            kj_okno(10,18,4, " Filtr na wybrany okres                     ",2)		    
			set color to n/w,w/n
			@ 12,20 say "Od dnia : "
			@ 13,20 say "Do dnia : "
			setcolor(lcolor)
			set cursor on
			@ 12,33 get f_tdat1
			@ 13,33 get f_tdat2
			read
			set cursor off
            if lastkey()#27
              fwar=fwar+".and.f_2datdow(f_tdat1,f_tdat2)"
			endif												

		    
		endcase		
        

endcase
twar=twar_start+".and."+fwar
keyboard chr(205)		
restore screen from ek
setcolor(lcolor)
RETURN NIL

FUNCTION AT_FU()
local last:=lastkey()
s_kom(at_opis)
do case
  case last=13
    zat_typy=alltrim(at_typy)
	zat_plik=at_plik
	zat_index=at_index
	return 0
  case last=27
    zat_typy=space(30)
	return 0	
endcase
RETURN 1

FUNCTION FTOWAR_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Nazwa "
ltnaz[2]:=" Kod   "
ltnaz[3]:=" Index "
ltlit[1]:=" N "
ltlit[2]:=" K "
ltlit[3]:=" I "
ltopis[1]:="Wydziel tylko pozycje o okreòlonej nazwie."
ltopis[2]:="Wydziel tylko pozycje o okreòlonym kodzie."
ltopis[3]:="Wydziel tylko pozycje o indeksie wskazanym przez kursor."
  lpoz=men_pion(19,15,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION DOKSUM_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Wydrukuj na ekran    "
ltnaz[2]:=" Wydrukuj na drukark© "
ltnaz[3]:=" Zrezygnuj z wydruku  "
ltlit[1]:="  "
ltlit[2]:="  "
ltlit[3]:="  "
ltopis[1]:="Wydruk do pliku - prezentacja na ekranie."
ltopis[2]:="Wydruk na drukark©."
ltopis[3]:="Rezygnacja z wydruku i powr¢t do wykazu dokument¢w."
  lpoz=men_pion(9,29,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION FDOKUMENT_MENU(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Sprzedaæ "
ltnaz[2]:=" Zakup    "
ltlit[1]:=" S "
ltlit[2]:=" Z "
ltopis[1]:="Wydziel tylko pozycje zwi•zane z dokumentami sprzedaæy."
ltopis[2]:="Wydziel tylko pozycje zwi•zane z dokumentami zakupu."
  lpoz=men_pion(20,15,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION FOKRESDOK_MENU(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" doKument "
ltnaz[2]:=" doW¢d    "
ltlit[1]:="   K"
ltlit[2]:="   W"
ltopis[1]:="Analiza dotyczy zarejestrowanych dokument¢w."
ltopis[2]:="Analiza dotyczy dowod¢w magazynowych (PZ,WZ)"
  lpoz=men_pion(20,15,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION FOKRES_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Dzie‰    "
ltnaz[2]:=" Miesi•c  "
ltnaz[3]:=" Okres    "
ltlit[1]:=" D  "
ltlit[2]:=" M  "
ltlit[3]:=" O  "
ltopis[1]:="Analiza dotyczy wybranego dnia."
ltopis[2]:="Analiza dotyczy wybranego miesi•ca."
ltopis[3]:="Analiza dotyczy okresu od dnia ... do dnia ... "
  lpoz=men_pion(19,26,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz



FUNCTION F_KONTRAH()
local ltndow:=tndow
select &dok_sel
seek ltndow
if found()
  if .not.danul.and.dkontrah=zknum
    select &tow_sel
    return .t.
  endif
endif
select &tow_sel
RETURN .f.


FUNCTION FRAP_KONTRAH()
local ltndow:=tndow
select &dok_sel
seek ltndow
if found()
  if .not.danul.and.dkontrah=zknum_rap
    select &tow_sel
    return .t.
  endif
endif
select &tow_sel
RETURN .f.


FUNCTION F_DTYP(pznaki)
local ltndow:=tndow
select &dok_sel
seek ltndow
if found()
  if .not.danul.and.dtyp$pznaki
    select &tow_sel
    return .t.
  endif
endif
select &tow_sel
RETURN .f.


FUNCTION F_DATDOK(p_dat)
local ltndow:=tndow
select &dok_sel
seek ltndow
if found()
  zdok_lad()    
  if zdtyp$dowod_gr
    if .not.danul.and.ddatdow=p_dat
      select &tow_sel
	  return .t.  
    endif
  else
    if .not.danul.and.ddatdok=p_dat
      select &tow_sel
	  return .t.
    endif
  endif
endif
select &tow_sel
RETURN .f.

FUNCTION F_MIESDOK(p_miesiac)
local ltndow:=tndow
select &dok_sel
seek ltndow
if found()
  zdok_lad()    
  if zdtyp$dowod_gr
    if month(ddatdow)=p_miesiac.and.year(ddatdow)=year(date())
	  select &tow_sel
      return .t.
    endif
  else
    if month(ddatdok)=p_miesiac.and.year(ddatdok)=year(date())
	  select &tow_sel
      return .t.
    endif  
  endif	
endif
select &tow_sel
RETURN .f.

FUNCTION F_ROKDOK(p_rok)
local ltndow:=tndow
select &dok_sel
seek ltndow
if found()
  zdok_lad()    
  if zdtyp$dowod_gr
    if.not.danul.and.year(ddatdow)=p_rok
	  select &tow_sel
      return .t.
    endif
  else
    if.not.danul.and.year(ddatdok)=p_rok
	  select &tow_sel
      return .t.
    endif  
  endif	
endif
select &tow_sel
RETURN .f.


FUNCTION F_2DATDOK(p_dat1,p_dat2)
local ltndow:=tndow
select &dok_sel
seek ltndow
if found()
  zdok_lad()    
  if zdtyp$dowod_gr
    if .not.danul.and.max(p_dat1,ddatdow)=ddatdow.and.min(p_dat2,ddatdow)=ddatdow
	  select &tow_sel
      return .t.
    endif
  else
    if .not.danul.and.max(p_dat1,ddatdok)=ddatdok.and.min(p_dat2,ddatdok)=ddatdok
	  select &tow_sel
      return .t.
    endif  
  endif	
endif
select &tow_sel
RETURN .f.


FUNCTION F_DATDOW(p_dat)
local ltndow:=tndow
select &dok_sel
seek ltndow
if found()
  if .not.danul.and.ddatdow=p_dat
    zdok_lad()    
	select &tow_sel
    return .t.
  endif
endif
select &tow_sel
RETURN .f.

FUNCTION F_MIESDOW(p_miesiac)
local ltndow:=tndow
select &dok_sel
seek ltndow
if found()
  if .not.danul.and.month(ddatdow)=p_miesiac
    zdok_lad()    
	select &tow_sel
    return .t.
  endif
endif
select &tow_sel
RETURN .f.

FUNCTION F_ROKDOW(p_rok)
local ltndow:=tndow
select &dok_sel
seek ltndow
if found()
  if .not.danul.and.year(ddatdow)=p_rok
    zdok_lad()    
	select &tow_sel
    return .t.
  endif
endif
select &tow_sel
RETURN .f.

FUNCTION F_2DATDOW(p_dat1,p_dat2)
local ltndow:=tndow
select &dok_sel
seek ltndow
if found()
  if .not.danul.and.max(p_dat1,ddatdow)=ddatdow.and.min(p_dat2,ddatdow)=ddatdow
    zdok_lad()    
	select &tow_sel
    return .t.
  endif
endif
select &tow_sel
RETURN .f.

************************** koniec t_filtr

FUNCTION TNDOK()
local ltndow:=tndow,ltndok:=space(15)
select &dok_sel
seek ltndow
if found()
  zdtyp=dtyp
  zddatdok=ddatdok
  zddatdow=ddatdow
  zdnskrot=dnskrot
  ltndok=dndok
  select &tow_sel
  return ltndok
else
  zdtyp=""
  zddatdok=ctod("")
  zddatdow=ctod("")
  zdnskrot=space(15)
endif
select &tow_sel
RETURN ltndok

**************************

FUNCTION T_SEK_SZUK()
local lgo_top:=.t.,ltxt:=space(30),ljest,lnum_pol:=2,ek,lcolor:=setcolor()
save screen to ek
set color to
@ 21,1 clear to 23,78
@ 22,15 say "Znajd´ sekwencj© :"
set cursor on
@ 22,35 get ltxt picture "@!" when s_kom("Przeszukiwanie obejmuje nazw© oraz kod")
read
set cursor off
if lastkey()#27
  do while.t.
    lnum_pol=2
	ljest=kj_rat(ltxt,lnum_pol,lgo_top)
    if.not.ljest
	  lnum_pol=3
	  ljest=kj_rat(ltxt,lnum_pol,lgo_top)
	endif
	if ljest
	  lgo_top=.f.
            g_tlo()
            kj_okno(10,18,4, " Znaleziono pozycj© :                       ",2)		    
			set color to n/w,w/n
			@ 12,20 say "Nazwa:"
			@ 13,20 say "K o d:"
			@ 12,28 say tnaz
			@ 13,28 say tkod
			setcolor(lcolor)

      zz=.t.
	  do gkom with "SzukaÜ dalej ?  [T/N] ",zz
	  if.not.zz.or.lastkey()=27
	    exit
	  endif
    else
	  do tkom with "Pozycja nie odnaleziona.  Nacisnij dowolny klawisz."
	  exit
	endif
  enddo	
endif
restore screen from ek
setcolor(lcolor)
RETURN nil


FUNCTION T_SUMA()
local ltndow:=space(15),lbrut,lnet,lvat,lcolor:=setcolor()
zplik_zer()  &&zerowanie wartosci netto, vatu oraz brutto dla wszystkich stawek
ztil=0
go top
do while.not.eof()
  ltndow=tndow
  select &dok_sel
  seek ltndow
  if found()
    zdtyp=dtyp
  else
    kj_tkom(8," Uwaga! "," Wykryto bà©dy w bazie dokument¢w !","Dla dowodu o numerze "+ltndow,"nie odnaleziono odpowiedniego dokumentu (ani rezerwacji).",5)  
  endif
  select &tow_sel
  ****
  if.not.tanul
    ztil=ztil+til
    if zdtyp $ dok_brut_gr        &&Obliczane od wartosci BRUTTO
      lbrut=kj_round(til*kj_round(brutto(tcen,tstawka),2),2)
      if.not.zdtyp$eksport_gr
        lvat=kj_round(lbrut*tstawka/(100+tstawka),2)
      else
	    lvat=0
	  endif	
	  ztbrut_all=ztbrut_all+lbrut
	  ztnet_all=ztnet_all+(lbrut-lvat)
    else
      lnet=kj_round(til*kj_round(tcen,2),2)  
      if.not.zdtyp$eksport_gr
        lvat=kj_round(lnet*tstawka/(100),2)
      else
	    lvat=0
	  endif		
      ztnet_all=ztnet_all+lnet
	  ztbrut_all=ztbrut_all+(lnet+lvat)
    endif
    ztvat_all=ztvat_all+lvat
  endif
  ***
  skip
enddo
g_tlo()
kj_okno(7,18,8, " Podsumowanie                                   ",2)		    
set color to n/w,w/n
@ 9,20 say "Razem: WartoòÜ NETTO ........"
@ 10,20 say "       Podatek VAT .........."
@ 11,20 say "       WartoòÜ BRUTTO ......."
@ 13,20 say "Podsumowanie rubryki ILOóè .."
@ 9,49 say ztnet_all picture "999 999 999.99"
@ 10,49 say ztvat_all picture "999 999 999.99"
@ 11,49 say ztbrut_all picture "999 999 999.99"
*@ 13,49 say ztil picture "999 999 999.999"
@ 13,49 say ztil picture mag_picture
inkey(0)
			setcolor(lcolor)

*  case zdtyp $ dok_brut_gr        &&Obliczane od wartosci BRUTTO
RETURN






FUNCTION NIEMAG_IL()
local ek,lcolor:=setcolor()
    if zdtyp$dok_brut_gr
	  ztcen=brutto(ztcen,ztstawka)
	endif
save screen to ek
	niemag_tlo()
	set cursor on
	@ 20,4 say "IloòÜ .... " get ztil picture mag_picture
	@ 21,4 say "Cena ..... "get ztcen picture "99999999.99"
	read
    set cursor off
   if zdtyp$dok_brut_gr
	  ztcen=netto(ztcen,ztstawka)
	endif	
restore screen from ek	
setcolor(lcolor)
RETURN

FUNCTION OPCJE_GET(pserwer)
local ek,select:=select()
local t[2],q[2]
t[1]:="nazwa"
t[2]:="substr(jak,1,10)"
q[1]:=""
q[2]:=""
save screen to ek
*set default to shset
set default to &set_serwer
if pserwer=2
  ks_default(zfirnum)
endif  
select &param_sel
if file("param.dbf")
  if kj_use("param",.f.,3)    &&
    set index to param
  else
    clear
	kj_tkom(9," Uwaga! ","Program obsluguje tylko jednego Uzytkownika."," Aby umozliwic rownoczesna prace,"," nalezy dokupic licencje na kolejne stanowisko.",5) 
    clear
	return
  endif
else
  kj_tkom(8," Uwaga! "," Brak pliku <PARAM.DBF>","Program b©dzie przcowaà z ustawieniami domyòlnymi.","Nacisnij dowolny klawisz.",5)
  restore screen from ek
  return
endif
set filter to widoczny=.t.
go top
@ 2,2 to 22,34 
keyboard chr(205)
dbedit(3,3,21,33,t,"P_FU","","","","≥",,"")
go top
param_lad()
close
restore screen from ek
select &select
RETURN

FUNCTION P_FU()
*local last:=lastkey(),lopis:=opis,ljak:=stuff(space(10),1,len(alltrim(jak)),alltrim(jak))
local last:=lastkey(),lopis:=opis,ljak:=jak,select:=select()
do case
  case last=27
    return 0
  case last=13
    do case
      case alltrim(co)=="DLUG_RAP"
	    if dlugrap_use(.t.)
		  browse()
		  close
		endif
		select &select 
	  case alltrim(co)=="DFIS_DRUK"
        fisdruk_menu()
	    if reclock(5)      
          replace jak with dfis_druk
          unlock
	    else
          kj_tkom(8," Uwaga! "," Brak moæliwoòci zapisu parametr¢w. ","Wprowadzone zmiany obowi•zywaÜ b©d• do nast©pnego wà•czenia programu.","NACISNIJ DOWOLNY KLAWISZ.",5)          
	    endif
	  case alltrim(co)=="PROGI"
	    progi_get()	
	  case alltrim(co)=="STAWKIRYCZ"
	    stawkirycz_get()			
	  case alltrim(co)=="STAWKI_VAT"
	    stawkivat_get()					
	otherwise
      set cursor on
	  @ row(),24 get ljak picture "@S10"
	  read
	  set cursor off	
      if.not.lastkey()=27
	    if reclock(5)      
          replace jak with ljak
          unlock
	    else
          kj_tkom(8," Uwaga! "," Brak moæliwoòci zapisu parametr¢w. ","Wprowadzone zmiany obowi•zywaÜ b©d• do nast©pnego wà•czenia programu.","NACISNIJ DOWOLNY KLAWISZ.",5)          
	    endif
	  endif  
	  if alltrim(co)=="OP_PLATNOSC_TXT".and.alltrim(jak)="1"
	    optxt_lad()
	  endif
	  if alltrim(co)=="DFIS_PORT"
	    do case
	      case jak="COM1".or.jak="com1".or.jak="Com1"
		    zcom_xp=1
			if reclock(5)      
              replace opis with stuff(opis,1,4,"1016")		  
		      unlock
		    endif	
	      case jak="COM2".or.jak="com2".or.jak="Com2"
		    zcom_xp=2
			if reclock(5)      
              replace opis with stuff(opis,1,4,"760 ")		  
		      unlock
		    endif			  
	    endcase
	  endif
	  if alltrim(co)=="WKONTO".and.alltrim(jak)="1"
	    wkonto_get()
	  endif 

	endcase
endcase
do skom with lopis
RETURN 1

FUNCTION OPTXT_LAD()
local recno:=recno(),ek,lcolor:=setcolor()
op_txt1=stuff(space(30),1,len(alltrim(op_txt1)),alltrim(op_txt1))
op_txt2=stuff(space(30),1,len(alltrim(op_txt2)),alltrim(op_txt2))
op_txt3=stuff(space(30),1,len(alltrim(op_txt3)),alltrim(op_txt3))
op_txt4=stuff(space(30),1,len(alltrim(op_txt4)),alltrim(op_txt4))
op_txt5=stuff(space(30),1,len(alltrim(op_txt5)),alltrim(op_txt5))
op_txt6=stuff(space(30),1,len(alltrim(op_txt6)),alltrim(op_txt6))
save screen to ek
kj_okno(13,39,9, " Tekst na dok. z op¢´nion• pàatnoòci• ",2)
set color to n/w,w/n
set cursor on
@ 15,43 get op_txt1
@ 16,43 get op_txt2
@ 17,43 get op_txt3
@ 18,43 get op_txt4
@ 19,43 get op_txt5
@ 20,43 get op_txt6
read
set cursor off
set filter to
go top
if.not.lastkey()=27
  locate for alltrim(co)=="OP_TXT1"
  if found()
    if reclock(5)      
	  replace opis with op_txt1
      unlock
	 endif
  endif
  locate for alltrim(co)=="OP_TXT2"
  if found()
    if reclock(5)      
	  replace opis with op_txt2
      unlock
     endif
  endif
  locate for alltrim(co)=="OP_TXT3"
  if found()
    if reclock(5)      
	  replace opis with op_txt3
      unlock
     endif
  endif
  locate for alltrim(co)=="OP_TXT4"
  if found()
    if reclock(5)      
	  replace opis with op_txt4
      unlock
     endif
  endif
  locate for alltrim(co)=="OP_TXT5"
  if found()
    if reclock(5)      
	  replace opis with op_txt5
      unlock
     endif
  endif
  locate for alltrim(co)=="OP_TXT6"
  if found()
    if reclock(5)      
	  replace opis with op_txt6
      unlock
     endif
  endif          
endif
setcolor(lcolor)
restore screen from ek
set filter to widoczny=.t.
go top
go recno
RETURN

FUNCTION DOKWZOR_TWORZ()
local ek,lnowy:=.f.,lw:=2,lk:=2,t[1],ldni:=0,ldniedop:=zdniedop
local lop_tndow,lop_tnum,lop_tnaz,lop_pom,lrecno
select &dok_sel
dwar=dbfilter()
t[1]:="naz_dok"
save screen to ek
@ 0,1 say " Wz¢r :     "
g_tlo()
if zdznak=zkordok_znak
  kj_tkom(8," Uwaga! ","Dokument wzorcowy naleæy do grupy dokument¢w koryguj•cych. ","Moduà WZ‡R nie dotyczy tej grupy dokument¢w","nACISNIJ DOWOLNY KLAWISZ.",5)            
  restore screen from ek
  return .f.
endif
**
set default to leg01
if.not.file("dok_def.dbf")
  ld_sciezka:=zd_serwer+"leg01"
  set default to &ld_sciezka
endif
select &dokdef_sel
if zdokzmienwzor_op.and.kj_use("dok_def",.f.,3)
  set index to dok_def
  do case
    case zdtyp$dowod_gr
      set filter to typ_dok$dowod_gr.and..not.znak_dok=zkordok_znak
    otherwise
	  set filter to .not.typ_dok$dowod_gr.and..not.znak_dok=zkordok_znak
  endcase	  
  go top
  locate for znak_dok=zdznak
  ildok=ilosc_dok()
  @ 2,lw+1 to 2+ildok+1,lw+14 
  keyboard chr(205)
  dbedit(3,lw+2,3+ildok-1,lw+13,t,"FU_D","","","",,"")
  close
  if lastkey()=27
    select &dok_sel
	restore screen from ek
    return .f.
  endif
endif
  keyboard chr(205)
  if zdtyp$dowod_gr
    if.not.empty(zdtermin).and..not.empty(zddatdow)
      ldni=zdtermin-zddatdow  
	  zdtermin=date()+ldni
    endif  
  else
    if.not.empty(zdtermin).and..not.empty(zddatdok)
      ldni=zdtermin-zddatdok  
	  zdtermin=date()+ldni
    endif
  endif	
*
  
  dok_default()
  if zopis_poz.and.file("topis.dbf")  &&przeniesienie opisw pozycji
    select &topis_sel
	if kj_use("topis",.f.,3)
	  set index to topis
	  seek zdndow
	  if found()
	    do while op_tndow=zdndow
          lrecno=recno()
		  lop_tnum=op_tnum
		  lop_tnaz=op_tnaz
		  lop_pom=op_pom
          if kj_append(3)
	        replace op_tnum with lop_tnum,op_tnaz with lop_tnaz,op_pom with lop_pom
            unlock
	      endif		  
		  go lrecno		
		  skip
		enddo
	  endif
	endif
	close  
  endif	  
*
  zdanul=.f.
  zddatdok=date()
  zddatdow=date()
  zddatsp=date()
  zap_dok(.t.)
          if zdtyp$kormag_gr
		    if kor_mag(.f.)
			  dok_znacz()
			endif
		  endif
        if kasa_glowna.and.zdtyp$kasadok_gr.and.zdsposzap$"GKR"
          dokdef(1)
		  ldndow=zdndow
		  zdniedop=ztbrut_all
		  kasa_dok()
		  close_all("SH")
		  dokdef(0)
        endif		


  select &dok_sel
  dok_use()
  set filter to &dwar
  go top
  go bottom
*        if reclock(5)      
*	      replace dniedop with ldniedop
*          unlock
*	    endif

**
keyboard chr(27)
restore screen from ek
RETURN .t.



FUNCTION NUMDOK_ZER()
local lsciezka:=zdnum_serwer+"001dok"
local ek
save screen to ek
g_tlo()
kj_okno(7,15,10," Uwaga !                                          ",2)	
@ 9,17 say      " Zatwierdzenie funkcji spowoduje wyzerowanie   "
@ 10,17 say     " licznika numeracji dla wszystkich dokument¢w. "
if kj_gkom(12,"","WykonaÜ ?","",.t.,25)
  set default to &lsciezka
  select &num_sel
  if kj_use("dpam",.t.,6)
     do while.not.eof()
       if.not.znak="5"  &&wyzeruj wszystkie liczniki z wyj•tkiem dok.kasowych
	     replace numer with 0
       endif
	   skip
     enddo
     close
  endif
  g_tlo()
  kj_tkom(8," Ok!","","Operacja zerowania licznik¢w dokument¢w wykonana pomyòlnie.","",15)  
endif	
restore screen from ek
RETURN 



FUNCTION NUMDOK_ZMIEN()
local ek,lw:=2,t[1]
t[1]:="naz_dok"
save screen to ek
g0_tlo()
kj_okno(7,15,10," Uwaga !                                          ",2)	
@ 9,17 say      " Stsuj•c t© funkcj© naleæy zachowaÜ szczeg¢ln• "
@ 10,17 say     " ostroænoòÜ, aby unikn•Ü bà©d¢w w numeracji.   "
if kj_gkom(12,"","WykonaÜ ?","",.t.,25)

**
  set default to leg01
  if.not.file("dok_def.dbf")
    ld_sciezka:=zd_serwer+"leg01"
    set default to &ld_sciezka
  endif
  select &dokdef_sel
  if kj_use("dok_def",.f.,3)
    set index to dok_def
    set filter to .not.typ_dok$defnum_gr
    go top
    ildok=ilosc_dok()
    if ildok>19
	  ildok=19
	endif
	g0_tlo() 
	@ 0,2 say " Wybierz dokument z listy "
    @ 2,lw+1 to 2+ildok+1,lw+14 
    keyboard chr(205)
    go top	
	
    dbedit(3,lw+2,3+ildok-1,lw+13,t,"FU_N","","","",,"")
    close
  endif
endif
restore screen from ek
RETURN
**

FUNCTION FU_N()
local last:=lastkey()
znaz_dok=naz_dok
zznak_dok=znak_dok
zopis_dok=opis_dok
zdtyp=typ_dok
do skom with zopis_dok
do case
  case last=13
    numdok_get()
	return 2
  case last=27
    return 0
endcase
RETURN 1

FUNCTION NUMDOK_GET()
local lsciezka:=zdnum_serwer+"001dok"
local ek,lsukces:=.f.,lodeslij_do,lnumer,lnumer_new:=0
local lsukcestxt:="Operacja przestawienia licznika numeracji nie zostaàa zako‰czona pomyòlnie!"
save screen to ek
kj_okno(7,15,8," Ustawienie licznika numeracji                    ",5)	
@ 9,17 say      " Dotyczy dokumentu :  "+znaz_dok
@ 11,17 say     " Dotychczasowy numer: "
@ 12,17 say     " Zmie‰ na:            "
set default to &lsciezka
select &num_sel
if kj_use("dpam",.f.,6)
  locate for znak=zznak_dok  
  if found()
    lodeslij_do=odeslij_do
	go top
	locate for znak=lodeslij_do
	if found()
	  lnumer=numer
	  lnumer_new=numer
	  @ 11,40 say lnumer picture "999999999"
	  set cursor on
	  @ 12,40 get lnumer_new picture "999999999" when s_kom("Wpisz numer ostatnio zarejestrowanego dokunmentu")
	  read
	  set cursor off
	  if.not.lastkey()=27
		if zdtyp$dowod_gr.and.lnumer_new<lnumer
          kj_tkom(8," Uwaga! ","","Dla tego dokumentu dopuszczona jest zmiana numeru wyà•cznie na wyæszy! ","Nacisnij dowolny klawisz.",5)		  
		else
		  if reclock(5)      
	        replace numer with lnumer_new
            unlock
		    lsukces=.t.
		  endif  
		endif
	  else
	    lsukcestxt:="Operacj© przerwano !"
	  endif	
	endif
  endif
endif
close
if lsukces
  lsukcestxt:="Operacja zako‰czona pomyòlnie!"
endif 
g_tlo()
kj_tkom(8," Ok!","",lsukcestxt,"",5)
keyboard chr(205)
select &dokdef_sel
restore screen from ek
RETURN




******************************************************************************
* Funkcja przygotowuje prezentacj© wydruku dla FIFO i rozmiar¢wki - zbija do  *
* kupy pozycje speàniaj•ce odpowiedni warunek                                 *
******************************************************************************
FUNCTION FIFO_BUF()
local recno,lwarunek:="tnaz=ztnaz.and.tkod=ztkod.and.tjm=ztjm.and.tcen=ztcen"
local lilsum:=0
if zrozmiar
  lwarunek="substr(tnaz,1,32)=substr(ztnaz,1,32).and.tkod=ztkod.and.tjm=ztjm.and.kj_round(tcen,2)=kj_round(ztcen,2)"
endif
go top
do while.not.eof()
  ztow_lad()
  set filter to &lwarunek
  go top
  recno=recno()
  lilsum=til
  do while.t.
    skip
	if eof()
	  exit
	else
	  lilsum=lilsum+til
	  delete
	endif
  enddo	
  go recno
  replace til with lilsum
  set filter to
  go top
  go recno
  skip
enddo
go top
RETURN

FUNCTION FIFO1_BUF()
local recno,lwarunek:="tnaz=ztnaz.and.tkod=ztkod.and.tjm=ztjm.and.tcen=ztcen"
local lilsum:=0
*if zrozmiar
*  lwarunek="substr(tnaz,1,32)=substr(ztnaz,1,32).and.tkod=ztkod.and.tjm=ztjm.and.kj_round(tcen,2)=kj_round(ztcen,2)"
*endif
go top
do while.not.eof()
  ztow_lad()
  set filter to &lwarunek
  go top
  recno=recno()
  lilsum=til
  do while.t.
    skip
	if eof()
	  exit
	else
	  lilsum=lilsum+til
	  delete
	endif
  enddo	
  go recno
  replace til with lilsum
  set filter to
  go top
  go recno
  skip
enddo
go top
RETURN



FUNCTION DOKUMDEF()
local ldtyp:=zdtyp,ldgrup:=zdgrup
		set default to &dokdef_serwer
        if.not.file("dok_def.dbf")
		  ld_sciezka:=zd_serwer+"leg01"
		  set default to &ld_sciezka
		endif
	    select &dokdef_sel
	    if kj_use("dok_def",.f.,3)
		  locate for znak_dok=zkordok_znak
		  if found()
		    zdok_def_lad()
			zdtyp=ldtyp
			zdgrup=ldgrup     &&dodano dn. 25.02.2004
		  endif
		  close
		endif
RETURN

FUNCTION WKONTO_GET()
local ek,select:=select()
save screen to ek
g_tlo()
select &wkonto_sel
if kj_use("konto",.t.,3)  
  browse(2,2,22,77)
  close
endif
restore screen from ek
select &select
RETURN

FUNCTION WKONTO()
local lkonto:=space(60),select:=select()
*set default to shset
set default to &set_serwer
select &wkonto_sel
if kj_use("konto",.f.,3)  
  locate for index=substr(zwalut_dok,2,1)
  if found()
    lkonto=konto
  endif
  close
endif
dok_default()
select &select
RETURN lkonto

FUNCTION WYMIAN_END()
local ltytul:="      ZAKO„CZENIE   DOKUMENTU       "  
@ 1,43,23,78 box chr(176) 
kj_okno(2,44,21,ltytul,1)
set color to n/w,w/n
@ 5,46 say "WartoòÜ dokumentu: "  
@ 5,65 say kj_round(ztbrut_all,2) picture "9999999.99"
if.not.kj_round(ztbrut_all,2)=0
  kj_tkom(8," Uwaga! "," WartoòÜ dokumentu wymiany powinna wynosiÜ zero !","Sprawd´ poprawnoòÜ dokumentu.","",5)
else
  inkey(2)
endif
RETURN

FUNCTION OPIS_POPRAW()
local ek,t[1],q[1],ltytul:="             O  P  I  S             "
local lw:=5,lk:=23,lcolor:=setcolor()
t[1]:="tnaz"
q[1]:=""
save screen to ek
g_tlo()
kj_okno(lw,lk,14,ltytul,5)
	if tow_use(.f.)
	  set filter to alltrim(tndow)==alltrim(zdndow).and.twyroznik="o"
	  go top
      set color to n/w,w/n
	  dbedit(lw+1,lk+2,lw+13,lk+32,t,"FU_OP","",q,"",,"")
      close
    endif
    select &buf_sel
setcolor(lcolor)
restore screen from ek
RETURN

FUNCTION FU_OP()
local last:=lastkey(),lnaz:=tnaz
do case
  case last=27 
    return 0
  case chr(last)$"Pp"
    set cursor on
    @ row(),col() get lnaz
	read
	set cursor off
	if.not.lastkey()=27  
	  if reclock(5)      
	      replace tnaz with lnaz
          unlock
	  else
          return 2
	  endif
	endif 	
endcase
RETURN 1

FUNCTION TOPIS_POPRAW(ptryb)
local select:=select(),ek,t[12],i,ltytul:="             O  P  I  S             "
local lw:=5,lk:=23,lcolor:=setcolor()
for i=1 to 12
  t[i]:=space(32)
next
i=1
dok_default()
select &topis_sel
if kj_use("topis",.f.,3)
  set index to topis
  if ptryb=1
    seek ztndow
    if found()
      do while op_tndow=ztndow
	    if op_tnum=ztnum
          t[i]=op_tnaz	    
	      i=i+1
          if i>12
		    exit
		  endif
		  if reclock(5)
            delete
	        unlock
          endif      		
	    endif

	    skip
	  enddo
    endif
  else
    go top
      do while empty(op_tndow).and..not.eof()
	    if op_tnum=ztnum
          t[i]=op_tnaz	    
	      i=i+1
          if i>12
		    exit
		  endif
		  if reclock(5)
            delete
	        unlock
          endif      		
	    endif

	    skip
	  enddo	
  endif	
*
  save screen to ek
  g_tlo()
  set color to
  @ 2,2 say ztnaz+"  "+ztkod
  kj_okno(lw,lk,14,ltytul,5)
  set color to
  set cursor on
    @ lw+1,lk+2 get t[1]
    @ lw+2,lk+2 get t[2]
    @ lw+3,lk+2 get t[3]
    @ lw+4,lk+2 get t[4]
    @ lw+5,lk+2 get t[5]
    @ lw+6,lk+2 get t[6]
    @ lw+7,lk+2 get t[7]
    @ lw+8,lk+2 get t[8]
    @ lw+9,lk+2 get t[9]
    @ lw+10,lk+2 get t[10]
    @ lw+11,lk+2 get t[11]
    @ lw+12,lk+2 get t[12]
    read
    set cursor off
*  if.not.lastkey()=27
	  for i=1 to 12
	    if.not.empty(t[i])
		  if kj_append(3)
	        replace op_tnaz with t[i]
			replace op_tnum with ztnum
            if ptryb=1
			  replace op_tndow with ztndow
	        endif
			unlock 
		  else
		    exit
		  endif  
		else
		  exit
		endif
	  next
*  endif

*  
  close
endif
if.not.lastkey()=27      
wyroznik_o()           &&060316 wpisuje wyr¢ænik O do pozycji z opisem

select &select
        if reclock(5)      
	      replace twyroznik with "O"
          unlock
	    endif  
else
  select &select
endif
restore screen from ek
setcolor(lcolor)  
RETURN 


FUNCTION TOPIS_SAY()
local select:=select(),ek,t[12],i,ltytul:="             O  P  I  S             "
local lw:=18,lk:=1,lcolor:=setcolor()
for i=1 to 12
  t[i]:=space(32)
next
i=1
ztnum=tnum      &&060316
dok_default()
select &topis_sel
if kj_use("topis",.f.,3)
  set index to topis
  seek ztndow
  if found()
    do while op_tndow=ztndow
	  if op_tnum=ztnum
        t[i]=op_tnaz	    
	    i=i+1
        if i>12
		  exit
		endif
	  endif

	  skip
	enddo
  endif
*
  save screen to ek
*  g_tlo()
*  set color to
*  @ 2,2 say ztnaz+"  "+ztkod
  kj_okno(lw,lk,5,ltytul,5)
  set color to
    @ lw+1,lk+2 say t[1]
    @ lw+2,lk+2 say t[2]
    @ lw+3,lk+2 say t[3]
    @ lw+4,lk+2 say t[4]
*    @ lw+5,lk+2 say t[5]
*    @ lw+6,lk+2 say t[6]
*    @ lw+7,lk+2 say t[7]
*    @ lw+8,lk+2 say t[8]
*    @ lw+9,lk+2 say t[9]
*    @ lw+10,lk+2 say t[10]
*    @ lw+11,lk+2 say t[11]
*    @ lw+12,lk+2 get t[12]
*  
  close
endif
inkey(0)
if lastkey()=27
  keyboard chr(205)
endif
select &select
restore screen from ek
setcolor(lcolor)  
RETURN 



FUNCTION TOPISPOZ_DRUK(pk)
local select:=select()
*set device to screen
*browse()
*set device to printer
dok_default()
if file("topis.dbf")
  select &topis_sel
  if kj_use("topis",.f.,3)
    set index to topis
    seek ztndow
    if found()
      do while op_tndow=ztndow
	    if op_tnum=ztnum
	      w=w+1
		  @ w,vcol say plotek
		  @ w,vcol+7 say op_tnaz
		  @ w,vcol+120 say plotek
	    endif
	    skip
	  enddo
    endif
  endif
  select &select
endif
*set device to screen
*browse()
*set device to printer
RETURN



FUNCTION PUBLIC_TXT()
public do_zaplaty:="DO ZAPùATY: ",zl:="  Zù",data_sprzedazy:="Data sprzedaæy: "
public pieczec_sprzedawcy:="     PIECZ®è   SPRZEDAWCY     "  
public wartosc:="|Lp.|          N A Z W A             |  ILOóè   |Jm.|   CENA   |  WARTOóè  |St.|  PODATEK  |  WARTOóè   |    SYMBOL     |"
public uslugi:="|   |  wyrobu  towaru  lub  usàugi   |          |   |          |   NETTO   | % |   V A T   |  BRUTTO    |    PKW i U    |"
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


public towar:="|Lp.|          T O W A R             |  ILOóè   |Jm.|   CENA   |  WARTOóè  |St.|  PODATEK  |  WARTOóè   |    SYMBOL     |"
public lp_ramka:="|Lp.|          N A Z W A             |  ILOóè   |Jm.|   CENA   |  WARTOóè  |St.|   W tym   |  WARTOóè   |    SYMBOL     |"
public lp1_ramka:="|   |  wyrobu  towaru  lub  usàugi   |          |   |  BRUTTO  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |    PKW i U    |"
public r_ramka:="|Lp.|          T O W A R             |  ILOóè   |Jm.|   CENA   |  WARTOóè  |St.|   W tym   |  WARTOóè   |    SYMBOL     |"
public rozl_sporzadzil:="Rozliczenie sporz•dzià:                               .............."
if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
  towar="|Lp.|          T O W A R             |  ILOóè   |Jm.|   CENA   |  WARTOóè  |St.|  PODATEK  |  WARTOóè   |     K T M     |"
  r_ramka="|Lp.|          T O W A R             |  ILOóè   |Jm.|   CENA   |  WARTOóè  |St.|   W tym   |  WARTOóè   |     K T M     |"
  lp_ramka:="|Lp.|          N A Z W A             |  ILOóè   |Jm.|   CENA   |  WARTOóè  |St.|   W tym   |  WARTOóè   |     K T M     |"
  lp1_ramka:="|   |  wyrobu  towaru  lub  usàugi   |          |   |  BRUTTO  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |     K T M     |"
endif

do case
  case empty(zpolznak)
    do_zaplaty="DO ZAPLATY: "
	zl="  ZL"
    data_sprzedazy="Data sprzedazy: "
	pieczec_sprzedawcy="     PIECZEC   SPRZEDAWCY     "  
    wartosc="|Lp.|          N A Z W A             |  ILOSC   |Jm.|   CENA   |  WARTOSC  |St.|  PODATEK  |  WARTOSC   |    SYMBOL     |"
	uslugi="|   |  wyrobu  towaru  lub  uslugi   |          |   |  STKOWA  |   NETTO   | % |   V A T   |  BRUTTO    |    PKW i U    |"
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
    towar="|Lp.|          T O W A R             |  ILOSC   |Jm.|   CENA   |  WARTOSC  |St.|  PODATEK  |  WARTOSC   |    SYMBOL     |"
    lp_ramka="|Lp.|          N A Z W A             |  ILOSC   |Jm.|   CENA   |  WARTOSC  |St.|   W tym   |  WARTOSC   |    SYMBOL     |"
    lp1_ramka="|   |  wyrobu  towaru  lub  uslugi   |          |   |  BRUTTO  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |    PKW i U    |"
    r_ramka="|Lp.|          T O W A R             |  ILOSC   |Jm.|   CENA   |  WARTOSC  |St.|   W tym   |  WARTOSC   |    SYMBOL     |"
    rozl_sporzadzil="Rozliczenie sporzadzil:                               .............."
	data_ksiegow="    Data ksiegowania:  "
	if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
      towar="|Lp.|          T O W A R             |  ILOSC   |Jm.|   CENA   |  WARTOSC  |St.|  PODATEK  |  WARTOSC   |     K T M     |"
      r_ramka="|Lp.|          T O W A R             |  ILOSC   |Jm.|   CENA   |  WARTOSC  |St.|   W tym   |  WARTOSC   |     K T M     |"
      lp_ramka="|Lp.|          N A Z W A             |  ILOSC   |Jm.|   CENA   |  WARTOSC  |St.|   W tym   |  WARTOSC   |     K T M     |"
	endif
 
	
  case zpolznak="M"
    do_zaplaty="DO ZAPúATY: "
	zl="  Zú"
    data_sprzedazy="Data sprzedaßy: "
	pieczec_sprzedawcy="     PIECZêï   SPRZEDAWCY     "  
    wartosc="|Lp.|          N A Z W A             |  ILOòï   |Jm.|   CENA   |  WARTOòï  |St.|  PODATEK  |  WARTOòï   |    SYMBOL     |"	
	uslugi="|   |  wyrobu  towaru  lub  usíugi   |          |   |          |   NETTO   | % |   V A T   |  BRUTTO    |    PKW i U    |"
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

    towar="|Lp.|          T O W A R             |  ILOòï   |Jm.|   CENA   |  WARTOòï  |St.|  PODATEK  |  WARTOòï   |    SYMBOL     |"
    lp_ramka="|Lp.|          N A Z W A             |  ILOòï   |Jm.|   CENA   |  WARTOòï  |St.|   W tym   |  WARTOòï   |    SYMBOL     |"
    lp1_ramka="|   |  wyrobu  towaru  lub  usíugi   |          |   |  BRUTTO  |BRUTTO-VAT | % |   V A T   |  BRUTTO    |    PKW i U    |"
    r_ramka="|Lp.|          T O W A R             |  ILOòï   |Jm.|   CENA   |  WARTOòï  |St.|   W tym   |  WARTOòï   |    SYMBOL     |"		
    rozl_sporzadzil="Rozliczenie sporzÜdzií:                               .............."
	if zkodwz_druk.and.(zdtyp$dowod_gr.or..not.vdok)
      towar="|Lp.|          T O W A R             |  ILOòï   |Jm.|   CENA   |  WARTOòï  |St.|  PODATEK  |  WARTOòï   |     K T M     |"
      r_ramka="|Lp.|          T O W A R             |  ILOòï   |Jm.|   CENA   |  WARTOòï  |St.|   W tym   |  WARTOòï   |     K T M     |"		
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
ltxt=stuff(ltxt,64,1,pznak)
ltxt=stuff(ltxt,76,1,pznak)
ltxt=stuff(ltxt,80,1,pznak)
ltxt=stuff(ltxt,92,1,pznak)
ltxt=stuff(ltxt,105,1,pznak)
ltxt=stuff(ltxt,121,1,pznak)
RETURN ltxt

FUNCTION PRZELEW_DRUK()
*kj_tkom(8," Uwaga! ","","Wydruk przelewu.","",5)
local ek,w:=prow(),k:=0
local txt1:= " - A -                 POLECENIE PRZELEWU                        |   - B -                POLECENIE PRZELEWU                       "
local txt101:= " - C -                 POLECENIE PRZELEWU                        |   - D -                POLECENIE PRZELEWU                       "
local txt2:= "---------------------------------------------------------------  |  ---------------------------------------------------------------"
local txt3:= "|      W ci©æar rachunku       |       Na dobro rachunku      |  |  |      W ci©æar rachunku       |       Na dobro rachunku      |"
local txt4:= "|------------------------------|------------------------------|  |  |------------------------------|------------------------------|"
local txt5:= "|  Nazwa zleceniodawcy:        |  Nazwa odbiorcy:             |  |  |  Nazwa zleceniodawcy:        |  Nazwa odbiorcy:             |"
local txt6:= "|                              |                              |  |  |                              |                              |"
local txt7:= "|                              |                              |  |  |                              |                              |"
local txt8:= "|                              |                              |  |  |                              |                              |"
local txt9:= "|                              |                              |  |  |                              |                              |"
local txt10:="|------------------------------|------------------------------|  |  |------------------------------|------------------------------|"
local txt11:="|  Konto zleceniodawcy:        |  Konto odbiorcy:             |  |  |  Konto zleceniodawcy:        |  Konto odbiorcy:             |"
local txt12:="|                              |                              |  |  |                              |                              |"
local txt13:="|                              |                              |  |  |                              |                              |"
local txt14:="|------------------------------|------------------------------|  |  |------------------------------|------------------------------|"
local txt15:="|                              |                              |  |  |                              |                              |"
local txt16:="|  Data:                       |  Kwota:                      |  |  |  Data:                       |  Kwota:                      |"
local txt17:="|                              |                              |  |  |                              |                              |"
local txt18:="|------------------------------|------------------------------|  |  |------------------------------|------------------------------|"
local txt19:="|                                                             |  |  |                                                             |"
local txt20:="|  Tytuà: Zapàata za faktur© Nr                               |  |  |  Tytuà: Zapàata za faktur© Nr                               |"
local txt21:="|                                                             |  |  |                                                             |"
local txt22:="|-------------------------------------------------------------|  |  |-------------------------------------------------------------|"
local txt23:="|  Piecz©Ü i podpis zleceniodawcy:                            |  |  |  Piecz©Ü i podpis zleceniodawcy:                            |"
local txt24:="|                                                             |  |  |                                                             |"
local txt25:="|                                                             |  |  |                                                             |"
local txt26:="|                                                             |  |  |                                                             |"
local txt27:="|                                                             |  |  |                                                             |"
local txt28:="|                                                             |  |  |                                                             |"
local txt29:="---------------------------------------------------------------  |  ---------------------------------------------------------------"
local txt30:="                                                                 |                                                                 "
local txt31:="-----------------------------------------------------------------|-----------------------------------------------------------------"
local llic1:=substr(zlic1,1,30)
local llic2:=substr(zlic2,1,30)
local llic5:=substr(zlic5,1,30)
local llic34:=stuff(space(30),1,6,zlic3)
local lkon34:=stuff(space(30),1,6,zkkod)

local ldata:=date()
*local lkwota:=ztbrut_all
local lkwota:=zdniedop
local ltytul:="Zapàata za faktur© Nr                             "
local lksiegow:=.t.

ltytul=stuff(ltytul,23,15,zdndok)

kj_okno(11,1,12, " POLECENIE PRZELEWU                                                  ",2)
@ 14,3 say "Data ........."
@ 16,3 say "Kwota ........"
@ 18,3 say "Tytuà ........"
@ 20,3 say"Ksi©gowanie .."
set cursor on
@ 14,18 get ldata when s_kom("Wpisz dat© przelewu")
@ 16,18 get lkwota when s_kom("Zatwierd´ kwot© przelewu")
@ 18,18 get ltytul when s_kom("Okreòl tutuà zobowi•zania")
@ 20,18 get lksiegow when s_kom("Wpisz .T. aby zaksi©gowaÜ wpàat© lub .F. aby pomin•Ü ksi©gowzmie.")
read
if lastkey()=27
  restore screen from ek
  RETURN  
endif
set cursor off

if lksiegow
  select &dok_sel
        if reclock(5)      
	      replace dniedop with dniedop-lkwota
          unlock
	    endif
endif



llic34=stuff(llic34,8,23,substr(zlic4,1,23))
lkon34=stuff(lkon34,8,23,substr(zkmiasto,1,23))

txt6=stuff(txt6,2,30,llic1)
txt7=stuff(txt7,2,30,llic2)
txt8=stuff(txt8,2,30,llic5)
txt9=stuff(txt9,2,30,llic34)

txt6=stuff(txt6,33,30,zknaz1)
txt7=stuff(txt7,33,30,zknaz2)
txt8=stuff(txt8,33,30,zkulica)
txt9=stuff(txt9,33,30,lkon34)

txt6=stuff(txt6,70,30,llic1)
txt7=stuff(txt7,70,30,llic2)
txt8=stuff(txt8,70,30,llic5)
txt9=stuff(txt9,70,30,llic34)

txt6=stuff(txt6,101,30,zknaz1)
txt7=stuff(txt7,101,30,zknaz2)
txt8=stuff(txt8,101,30,zkulica)
txt9=stuff(txt9,101,30,lkon34)

txt12=stuff(txt12,2,30,substr(zlic_konto,1,30))
txt12=stuff(txt12,70,30,substr(zlic_konto,1,30))
txt13=stuff(txt13,2,30,substr(zlic_konto,31,30))
txt13=stuff(txt13,70,30,substr(zlic_konto,31,30))

txt12=stuff(txt12,33,30,substr(zkkonto,1,30))
txt12=stuff(txt12,101,30,substr(zkkonto,1,30))
txt13=stuff(txt13,33,30,substr(zkkonto,31,30))
txt13=stuff(txt13,101,30,substr(zkkonto,31,30))

txt16=stuff(txt16,11,10,dtoc(ldata))
txt16=stuff(txt16,78,10,dtoc(ldata))
txt16=stuff(txt16,41,12,str(lkwota,12,2))
txt16=stuff(txt16,109,12,str(lkwota,12,2))

txt20=stuff(txt20,11,50,ltytul)
txt20=stuff(txt20,78,50,ltytul)

save screen to ek
if pstart_druk()
  @ w,k say &zdr_kond+txt1
  w=w+1
  @ w,k say txt2
  w=w+1
  @ w,k say txt3
  w=w+1
  @ w,k say txt4  
  w=w+1
  @ w,k say txt5  
  w=w+1
  @ w,k say txt6  
  w=w+1
  @ w,k say txt7  
  w=w+1
  @ w,k say txt8  
  w=w+1
  @ w,k say txt9  
  w=w+1
  @ w,k say txt10 
  w=w+1
  @ w,k say txt11 
  w=w+1
  @ w,k say txt12 
  w=w+1
  @ w,k say txt13                   
  w=w+1
  @ w,k say txt14                    
  w=w+1
  @ w,k say txt15                    
  w=w+1
  @ w,k say txt16                    
  w=w+1
  @ w,k say txt17                    
  w=w+1
  @ w,k say txt18                    
  w=w+1
  @ w,k say txt19                    
  w=w+1
  @ w,k say txt20                    
  w=w+1
  @ w,k say txt21                    
  w=w+1
  @ w,k say txt22                    
  w=w+1
  @ w,k say txt23                    
  w=w+1
  @ w,k say txt24                    
  w=w+1
  @ w,k say txt25                    
  w=w+1
  @ w,k say txt26                    
  w=w+1
  @ w,k say txt27                    
  w=w+1
  @ w,k say txt28                    
  w=w+1
  @ w,k say txt29                                                  
  w=w+1
  @ w,k say txt30
  w=w+1
  @ w,k say txt30
  w=w+1
  @ w,k say txt30
  w=w+1
  @ w,k say txt31

  w=w+1
  @ w,k say txt30
  w=w+1
  @ w,k say txt101
  w=w+1
  @ w,k say txt2
  w=w+1
  @ w,k say txt3
  w=w+1
  @ w,k say txt4  
  w=w+1
  @ w,k say txt5  
  w=w+1
  @ w,k say txt6  
  w=w+1
  @ w,k say txt7  
  w=w+1
  @ w,k say txt8  
  w=w+1
  @ w,k say txt9  
  w=w+1
  @ w,k say txt10 
  w=w+1
  @ w,k say txt11 
  w=w+1
  @ w,k say txt12 
  w=w+1
  @ w,k say txt13                   
  w=w+1
  @ w,k say txt14                    
  w=w+1
  @ w,k say txt15                    
  w=w+1
  @ w,k say txt16                    
  w=w+1
  @ w,k say txt17                    
  w=w+1
  @ w,k say txt18                    
  w=w+1
  @ w,k say txt19                    
  w=w+1
  @ w,k say txt20                    
  w=w+1
  @ w,k say txt21                    
  w=w+1
  @ w,k say txt22                    
  w=w+1
  @ w,k say txt23                    
  w=w+1
  @ w,k say txt24                    
  w=w+1
  @ w,k say txt25                    
  w=w+1
  @ w,k say txt26                    
  w=w+1
  @ w,k say txt27                    
  w=w+1
  @ w,k say txt28                    
  w=w+1
  @ w,k say txt29                                                  
  w=w+1
  @ w,k say txt30+&zdr_kkond   
endif
eject
set device to screen
restore screen from ek
RETURN

FUNCTION KSDOK_TLO()
do case
  case zdtyp$kasa_gr
    kas_tlo()
  case (zdtyp$export_gr.or.zdtyp$import_gr).and..not.zdtyp$kormag_gr
    ks_tlo()	
endcase
RETURN

FUNCTION DOKDEF_USE()
local lsukces:=.f.
		*set default to leg01
		set default to &dokdef_serwer
        if.not.file("dok_def.dbf")
		  ld_sciezka:=zd_serwer+"leg01"
		  set default to &ld_sciezka
		endif
	    select &dokdef_sel
	    if kj_use("dok_def",.f.,3)
          lsukces=.t.
        endif
RETURN lsukces


FUNCTION KONLIMIT()
local select:=select(),recno:=recno(),lniedop_sum:=0,lzaleg_sum:=0,lkredyt_sum:=0
if dok_use()
  set order to 4
  seek zknum
  if found()
    do while dkontrah=zknum
	  if max(dtermin,date())=date()
	    lzaleg_sum=lzaleg_sum+dniedop
	  else
	    lkredyt_sum=lkredyt_sum+dniedop
	  endif
	  skip
	enddo  
    kj_okno(7,10,10, "  Rozliczenie pàatnoòci                                   ",5)
    if zklimit=0
	  @ 9,12 say "Limit kredytowy nie zdefiniowany"
	else
	  @ 9,12 say "Przyznany limit kredytowy  ......... "
	endif  
    @ 11,12 say "Pàatnoòci       przeterminowane ......"
	@ 12,12 say "             nie przeterminowane ....."
	@ 13,12 say "                                       ..............." 
    @ 14,12 say "                 Razem ................"
	if zklimit>0
	  if zklimit-(lzaleg_sum+lkredyt_sum)>0
        @ 16,12 say "Dopuszczalna wartoòÜ dokumentu ........."  
	    @ 16,50 say zklimit-(lzaleg_sum+lkredyt_sum) picture "999999999.99"
	  else
	    @ 16,12 say "Uwaga!  Kontrahent wyczerpaà limit kredytowy"  
	  endif
	endif
	@ 9,50 say zklimit picture "999999999.99"
	@ 11,50 say lzaleg_sum picture "999999999.99"
	@ 12,50 say lkredyt_sum picture "999999999.99"
	@ 14,50 say lzaleg_sum+lkredyt_sum picture "999999999.99"
	INKEY(0)
  endif
endif
close
*select &select
*go recno
RETURN

FUNCTION NAZ_DRUK(pnaz,prozmiar,pcol1,pcol2,pcol3)
	  if len(pnaz)<16.or.empty(prozmiar)
	    @ w,pcol2 say pnaz
		@ w,pcol2+17 say prozmiar
	  else
		@ w,pcol2 say pnaz
		w=w+1
        @ w,pcol1 say plotek
        @ w,pcol2+17 say prozmiar
		@ w,pcol3 say plotek		        		
	  endif
RETURN	  





FUNCTION KOD_OK(pyear,pmonth,ptryb)
local l_ok:=.f.,year:=pyear,month:=pmonth
local lkod1:=space(5),lkod2:=space(7),lkod3:=space(5),lkod_numer:=0
local lproba:=0,lokres:=""
lhas=(66+month)*(year+3*month)+12345*month
select &kod_sel
if kj_use("kody",.f.,3)   
  locate for kod2=lhas
  if.not.found()
    kj_okno(0,0,24, "  PROGRAM DZIERΩAWIONY - WPROWADZANIE KODU                                      ",7)
	if ptryb=2
      if .not. kj_gkom(12," Uwaga! ","Zbliæa si© koniec miesi•ca","Czy chcesz wprowadziÜ kod na miesi•c nast©pny ?",.t.,5)	  
        close
        return .f.
	  endif
	endif
	
	@ 8,10 say "Wprowad´ kod za miesi•c "+mies_nazwa(month)+"  / "+str(year)
	set cursor on
	do while .t.
	  
	 * @ 11,10 get lkod1
	 * @ 11,17 say "-"
	  @ 11,20 get lkod2
	 * @ 11,29 say "-"
	 * @ 11,32 get lkod3
	  read
	  lkod_numer=val(lkod2)
	  lokres=mies_nazwa(month)+"  / "+str(year)
      if lkod_numer=lhas
	    l_ok=.t.
        if kj_append(3)
	      *replace kod1 with lkod1,kod2 with lkod_numer,kod3 with lkod3
		  replace kod2 with lkod_numer,data with date()
          replace okres with lokres
		  unlock
		  kj_tkom(14," Ok! "," ","Kod wprowadzony poprawnie.","",5)	    
		else
		  kj_tkom(14," Uwaga! ","Podczas zapisu kodu wyst•pià bà•d ","Wprowad´ kodponownie.","",5)	    
		endif
		exit
	  else
	    lproba=lproba+1
	  endif	
	  if lproba>2
        kj_tkom(14," Uwaga! "," Bà©dny kod !","Brak dost©pu do programu.","",5)	    
        return .f.
	  endif
	enddo
	
	set cursor off
  else
    l_ok=.t.
  endif
endif
close
RETURN l_ok

FUNCTION VAT00_ZNAK()
local lznak:=" "
do case
  case zvat_a=0
    lznak="A"
  case zvat_b=0
    lznak="B"
  case zvat_c=0
    lznak="C"
  case zvat_d=0
    lznak="D"
  case zvat_e=0
    lznak="E"
  case zvat_f=0
    lznak="F"
endcase
RETURN lznak

FUNCTION VATEXP_ZNAK()
local lznak:=" "
do case
  case zvat_a=0
    lznak="B"
  case zvat_b=0
    lznak="C"
  case zvat_c=0
    lznak="D"
  case zvat_d=0
    lznak="E"
  case zvat_e=0
    lznak="F"
  case zvat_f=0
    lznak="Z"
endcase
RETURN lznak

FUNCTION VAT00_NUMER()
local lnum:=10
do case
  case zvat_a=0
    lnum=1
  case zvat_b=0
    lnum=2
  case zvat_c=0
    lnum=3
  case zvat_d=0
    lnum=4
  case zvat_e=0
    lnum=5
  case zvat_f=0
    lnum=6
endcase
RETURN lnum

FUNCTION STAWKIVAT_GET()
local ek,select:=select(),l_jak:=space(50)
save screen to ek
g_tlo()
kj_okno(5,18,8," Stawki VAT                                ",5)
@  7,20 say "Stawka A ................"
@  8,20 say "Stawka B ................"
@  9,20 say "Stawka C ................"
@  10,20 say "Stawka D ................"
@  11,20 say "Stawka E ................"
@  12,20 say "Stawka F ................"
set cursor on
@ 7,46 get zvat_a picture "99"
@ 8,46 get zvat_b picture "99"
@ 9,46 get zvat_c picture "99"
@ 10,46 get zvat_d picture "99"
@ 11,46 get zvat_e picture "99"
@ 12,46 get zvat_f picture "99"
read
set cursor off
if.not.lastkey()=27
      l_jak=vat_kod()
      if reclock(5)  
	    replace jak with l_jak
	    unlock
	  endif  
endif
restore screen from ek  
select &select
RETURN


FUNCTION VAT_KOD()
local lvat_a:=alltrim(str(zvat_a)),lvat_b:=alltrim(str(zvat_b)),lvat_c:=alltrim(str(zvat_c))
local lvat_d:=alltrim(str(zvat_d)),lvat_e:=alltrim(str(zvat_e)),lvat_f:=alltrim(str(zvat_f))
local len_a:=len(lvat_a),len_b:=len(lvat_b),len_c:=len(lvat_c)
local len_d:=len(lvat_d),len_e:=len(lvat_e),len_f:=len(lvat_f)
local ljak:=space(50)
ljak=stuff(ljak,1,len_a,lvat_a)
ljak=stuff(ljak,4,len_b,lvat_b)
ljak=stuff(ljak,7,len_c,lvat_c)
ljak=stuff(ljak,10,len_d,lvat_d)
ljak=stuff(ljak,13,len_e,lvat_e)
ljak=stuff(ljak,16,len_f,lvat_f)
RETURN ljak

FUNCTION VAT_DEKOD()
zvat_a=val(substr(jak,1,2))
zvat_b=val(substr(jak,4,2))
zvat_c=val(substr(jak,7,2))
zvat_d=val(substr(jak,10,2))
zvat_e=val(substr(jak,13,2))
zvat_f=val(substr(jak,16,2))
RETURN

FUNCTION DOSTEP_DOK()
local ek, lpoz:=1,t[2]
t[1]:="naz_dok"
t[2]:=".not.ukryj"
lpoz=admin_d_menu(lpoz)
do case
  case lpoz=1
    dok_war='grupa_dok$"205678".and.substr(opis_dok,1,1)$"SM"'
  case lpoz=2	
    dok_war='grupa_dok$"105678".and.substr(opis_dok,1,1)$"ZM"'
endcase
	    save screen to ek
        kj_okno(17,26,5, " Uwaga.                                             ",2)
		@ 18,32 say "Dokumenty oznaczone znakiem  T  s• dost©pne"
		@ 20,32 say "[Enter] - moæliwoòÜ zmiany"
		@ 21,32 say "[Esc] - rezygnacja "
		set default to &dokdef_serwer
        if.not.file("dok_def.dbf")
		  ld_sciezka:=zd_serwer+"leg01"
		  set default to &ld_sciezka
		endif
	    select &dokdef_sel
	    if kj_use("dok_def",.f.,3)
		  set index to dok_def
		  set filter to &dok_war
		  go top
		  ildok=ilosc_dok()
		  @ 2,1 to 22,19 
		  keyboard chr(205)
          dbedit(3,2,21,18,t,"FU_D1","","","",,"")
	      close
		endif  
RETURN

FUNCTION FU_D1()
local last:=lastkey(),lkom:=opis_dok
s_kom(lkom)
do case
  case last=13
    if ukryj
      if kj_gkom(12," ","Dokument aktualnie nie jest dost©pny.","Czy ma byÜ dost©pny  ?",.t.,5)	  
				if reclock(5)      
	              replace ukryj with .f.
                  unlock
	            endif			      	    
	  endif
	else
      if kj_gkom(12," ","Dokument aktualnie jest dost©pny.","Czy ma byÜ ukryty  ?",.t.,5)	  
				if reclock(5)      
	              replace ukryj with .t.
                  unlock
	            endif			      	    
	  endif	
	endif
  case last=27
    return 0 
endcase
RETURN 1



FUNCTION DLUG_RAP(pplik)
local ek,glow[20],stop[20],i,j,k,m,lkontrah:=0
local lnet:=0,lvat:=0,lbrut:=0,lniedop:=0,lcolor:=setcolor()
local lpoz:=0,plik:="wydruki\nowy.txt",select:=select()
local ltxt1:="         *   Z E S T A W I E N I E    D O K U M E N T ‡ W                      "
local ltxt2:="            ============================================                      "
local ltxt3:=space(78),ltxt4:=space(78),ltxt5:=space(78)

go top
lkontrah=dkontrah
if kon_use()
  set order to 3
  seek lkontrah
  if found()
    zkon_lad()
  else
    kj_tkom(8," Uwaga! "," Wykryto bà©dy w bazie kontrahenta! ","Raport nie moæe byÜ wykonany.","Nacisnij dowolny klawisz.",5)    
    select &select
    restore screen from ek
	return  
  endif
  close
  select &select
endif
do while.not.eof()
  if.not.dkontrah=lkontrah
    kj_tkom(8," Uwaga! "," Raport powinien dotyczyÜ tylko jednego wybranego kontrahenta! ","Zainstaluj odpowiedni warunek filtrujcy i ponow pr¢b©.","Nacisnij dowolny klawisz.",5)    
    restore screen from ek
	return
  endif
  skip
enddo


for i=1 to 20
  glow[i]:=""
  stop[i]:=""
next

if dlugrap_use(.f.)
  set filter to dl_ster=="G"
  go top
  i=0
  do while.not.eof()
    i=i+1
	glow[i]=dl_txt
    skip
  enddo
  set filter to dl_ster=="S"
  go top
  j=0  
  do while.not.eof()
    j=j+1
	stop[j]=dl_txt
    skip
  enddo  
else
  select &select
  restore screen from ek
  return
endif
close
select &select

if.not.lastkey()=27
  if pplik
    kj_okno(17,1,3," Czekaj !                        ",2)	  
    set color to n/w,w/n
	@ 18,2 say "Trwa przygotowanie wydruku. "
	@ 19,2 say "Moæe to potrwaÜ kilka minut !"
	set color to
	plik="wydruki\doksum.txt"
    set printer to &plik
  else
    kj_okno(0,0,6, "  Tytuà raportu                                                                 ",2)
    set color to n/w,w/n
    set cursor on
    ltxt1=glow[4]
	ltxt2=glow[5]
	ltxt3=glow[6]
	ltxt4=glow[7]
	ltxt5=glow[8]
	@ 1,1 get ltxt1 when s_kom("Wpisz pierwsz• linijk© nagà¢wka")
    @ 2,1 get ltxt2 when s_kom("Wpisz drug• linijk© nagà¢wka")
    @ 3,1 get ltxt3 when s_kom("Wpisz trzeci• linijk© nagà¢wka")
    @ 4,1 get ltxt4 when s_kom("Wpisz czwart• linijk© nagà¢wka")
    @ 5,1 get ltxt5 when s_kom("Wpisz pi•t• linijk© nagà¢wka")
    read
    set cursor off
    setcolor(lcolor)	  
    if.not.pstart_druk()
      dok_default() 
      select &select
      set device to screen
 	  return .f.
    endif
  endif
  set device to printer
  w=prow()
  @ w,0 say &zdr_kkond+alltrim(zmiasto)+"  Dnia "+dtoc(date())
  w=w+2
  @ w,0 say glow[1]
  w=w+1
  @ w,0 say glow[2] 
  w=w+2
  @ w,0 say glow[3]
  w=w+1
  @ w,0 say alltrim(zknaz1)+"  "+alltrim(zknaz2)
  w=w+1
  @ w,0 say alltrim(zkulica)+"  "+alltrim(zkmiasto)
  w=w+1
  @ w,0 say ""
  w=w+1
  @ w,0 say ""  
      doksum_tyt(ltxt1,ltxt2,ltxt3,ltxt4,ltxt5)  

      go top
	  do while.not.eof()
        if.not.danul
          lpoz=lpoz+1
		  dok_licz(dndow,.t.)
          lnet=lnet+ztnet_all
          lvat=lvat+ztvat_all
          lbrut=lbrut+ztbrut_all
          lniedop=lniedop+dniedop
          @ w,0 say " "
		  @ w,1 say lpoz picture "9999"
		  @ w,5 say dndok
		  @ w,22 say ddatdok
		  @ w,34 say dnskrot
		  @ w,49 say ztnet_all picture "9999999.99"
		  if.not.zdtyp$kasa_gr
		    @ w,61 say ztvat_all picture "9999999.99"
		    @ w,72 say ztbrut_all picture "9999999.99"
		    if.not.zdtyp$przes_gr
		      @ w,85 say dniedop picture "9999999.99"
		      @ w,98 say dtermin picture "9999999.99"
		    endif
		  endif
		  @ w,109 say " "
		  w=w+1
		endif		    
	    skip
	  enddo
      if.not.zdtyp$kasa_gr
	    @ w,0 say "--------------------------------------------------------------------------------------------------------------" 
        w=w+1
	    @ w,0 say "                                   R a z e m :                                                                "
		  @ w,49 say lnet picture "9999999.99"
		  @ w,61 say lvat picture "9999999.99"
		  @ w,72 say lbrut picture "9999999.99"
		  if.not.zdtyp$przes_gr
		    @ w,85 say lniedop picture "9999999.99"	  
		  endif	
	    w=w+1
	    @ w,0 say "                                ------------------------------------------------------------------------------"
      else
	    @ w,0 say "-------------------------------------------------------------"
        w=w+1
	    @ w,0 say "                                   R a z e m :                                                               |"
		  @ w,49 say lnet picture "9999999.99"
	    w=w+1
	    @ w,0 say "                                -----------------------------"
	  endif	
w=w+2
@ w,0 say &zdr_kkond
for k=1 to j
  @ w+k,0 say stop[k]
next
  eject

  set device to screen
  if pplik
    save screen to ek
    edi=edit+" wydruki\doksum.txt"
    run &edi 
    restore screen from ek
    set cursor off   
  endif
endif
select &select
RETURN nil


FUNCTION DOKEXPORT()
local ek,lplik1:="",lplik2:="",lcolor:=setcolor()
save screen to ek
clear
kj_okno(3,3,18, " Eksport dokumentu                                                        ",7)
    if tablexp_use()
	  locate for xodbiorca=zdkontrah.and.xdokex_typ=zdtyp
	  if found()
        tablexp_lad()	  
	  else
        kj_tkom(8," Uwaga! "," Wybrany typ dokument¢w w obecnej konfiguracji "," nie jest przeznaczony do eksportu.","",5) 
        close
	    setcolor(lcolor)
	    return		  
	  endif
	else
      kj_tkom(8," Uwaga! "," Baza <tabl_exp>  nie jest dost©pna. "," Zako‰cz prac© programu, uruchom ponownie i pon¢w pr¢b©."," Jeòli problem powt¢rzy si©, skontaktuj si© z serwisem.",5) 
      close
	  setcolor(lcolor)
	  return	
	endif    

@ 5,5 say "Eksport dokumentu "+zdndok + " z dnia "+dtoc(zddatdok)
@ 7,5 say "Dokument przeznaczony dla:"
@ 8,8 say zknaz1
@ 9,8 say zknaz2
@ 10,8 say zkulica
@ 11,8 say zkmiasto
set cursor on
@ 15,5 say "Zatwierd´ òcieæk© docelow•:"
@ 16,10 get zpath_dokexport
read
if.not.lastkey()=27
  lplik1="001dok\dok_exp.dbf"
  lplik2=alltrim(zpath_dokexport)+"dok_exp.dbf"
  if kj_gkom(14,"","Nast•pi eksport dokumentu w formie elektronocznej.","WykonaÜ  ?",.t.,25)

	mag_use(1)
	set order to 4
	if dokexp_use()
	  zap
	else
      kj_tkom(8," Uwaga! "," Baza eksportowa nie jest gotowa.","Wyà•cz program. uruchom ponownie i ponow pr¢b© eksportu","",5)				    	
	endif  
    select &buf_sel	
	go top
	do while.not.eof()
	  ztow_lad()
	  if ztkormag
	    select &gmag_sel
	    seek ztmindex
	    if found()
	      zmag_lad()	
		else
		  m_zer()
		endif
		select &dokexp_sel
        if kj_append(3)
	      m_replac()
		  replace enr_dok with zdndok,edat_dok with zddatdok
		  replace eilosc with ztil,ecena with ztcen
          replace eod_kogo with fir_index,eks_jako with zxks_jako
		  replace efir_naz with zdnskrot,emagnum with zxmagnum
		  replace edla_kogo with zdkontrah
		  replace mcen_d with ztcen,mcen_h with ztcen,mcen_m with ztcen
		  replace bo_il with 0,bo_cen with 0
		  unlock
	    endif		
	  endif
	  select &buf_sel
	  skip
	enddo
	select &gmag_sel
	close
	select &dokexp_sel
	close	
	copy file &lplik1 to &lplik2
	clear
	@ 10,1 say "Export dokumentu zako‰czony pomyòlnie"
	@ 20,20 say "Naciònij dowolny klawisz."
	inkey(0)
  endif  
endif

set cursor off
restore screen from ek
RETURN

FUNCTION DOKIMPORT()
local ek,lplik1:="",lplik2:="",lcolor:=setcolor()
local t[4],q[4]
t[1]:="mnaz"
t[2]:="mkod"
t[3]:="eilosc"
t[4]:="ecena"
q[1]:="Nazwa towaru"
q[2]:="Kod"
q[3]:="IloòÜ"
q[4]:="Cena detal"
d_zer()
k_zer()
save screen to ek
set color to
clear
kj_okno(3,3,18, " Obsàuga importu dokument¢w                                              ",7)
@ 10,5 say "Czekaj! System archiwizuje bazy danych."
@ 12,5 say "Moæe to potrwaÜ nawet kilka minut."
inkey(5)
if.not.lastkey()=27
  run out_baz.bat baz_last
endif  
clear
kj_okno(3,3,18, " Obsàuga importu dokument¢w                                              ",7)
@ 5,5 say "Import  dokumentu "
set cursor on
@ 10,5 say "Zatwierd´ òcieæk© docelow•:"
@ 12,10 get zpath_dokexport
read
if.not.lastkey()=27
  lplik1="001dok\dok_exp.dbf"
  lplik2=alltrim(zpath_dokexport)+"dok_exp.dbf"
  copy file &lplik2 to &lplik1
endif
dokexp_use()
dokexp_lad()
* Sprawdzenie poprawnoòci Nadawca - Adresat
if tablimp_use()
  locate for inadawca=zeod_kogo
  if found()
    if.not.imoj_ident=zedla_kogo
                kj_tkom(8," Uwaga! "," Bà•d kontroli Nadawca - Adresat"," Dokument prawdopodobnie przeznaczony jest dla innego komputera."," Dokumentu nie moæna zaimportowaÜ.",5) 
                close_all("SH")
				setcolor(lcolor)
				return	
	endif
  else
                kj_tkom(8," Uwaga! "," Bà•d kontroli Nadawca - Adresat","Prawdopodobnie nie zdefiniowano odpowiedniego kanaàu przesyàowego."," Dokumentu nie moæna zaimportowaÜ.",5) 
                close_all("SH")
				setcolor(lcolor)
				return	  
  endif
else
                kj_tkom(8," Uwaga! "," Baza <tabl_imp> nie jest dost©pna. "," Brak moæliwoòci potwierdzenia poprawnosci relacji:"," Nadawca - Adresat. Dokumentu nie moæna zaimportowaÜ.",5) 
                close_all("SH")
				setcolor(lcolor)
				return
endif

  *Blokada ponownego zapisu
				if dok_use()
                  locate for dndok=zenr_dok.and..not.danul				  
				  if found()
				    kj_tkom(8," Uwaga! "," Dokument o numerze "+zenr_dok,"jest juæ zarejestrowany. Aby ponownie importowaÜ,"," naleæy anulowaÜ istniej•cy w bazie dokument i ponowiÜ pr¢b©.",5)				    
                    close_all("SH")
					setcolor(lcolor)
					return
				  endif	
				else
                  kj_tkom(8," Uwaga! "," Baza dokument¢w nie jest dost©pna. "," Zako‰cz prac© programu, uruchom ponownie i pon¢w pr¢b©."," Jeòli problem powt¢rzy si©, skontaktuj si© z serwisem.",5) 
                    close_all("SH")
					setcolor(lcolor)
					return
				endif
  *Koniec blokady
if kon_use()
  set order to 3
  seek zeod_kogo
  if found()
    zkon_lad()
  endif
else
  kj_tkom(8," Uwaga! "," Baza kontrahent¢w nie jest dost©pna. "," Zako‰cz prac© programu, uruchom ponownie i pon¢w pr¢b©."," Jeòli problem powt¢rzy si©, skontaktuj si© z serwisem.",5) 
                    close_all("SH")
					setcolor(lcolor)
					return
endif
if dokdef_use()
  locate for typ_dok=zeks_jako
  if found()
    zdok_def_lad()
*  *@ 0,0 SAY ZDTYP
*  @ 1,0 SAY ZTYP_DOK
*  @ 2,0 SAY ZZNAK_DOK
*  @ 3,0 SAY ZZNAK_DOW
*  @ 10,0 say zdtyp
*  @ 11,0 say zdznak
*  @ 12,0 say zdsymbol
*  INKEY(0)
else
  kj_tkom(8," Uwaga! "," Baza definicji dokument¢w nie jest dost©pna. "," Zako‰cz prac© programu, uruchom ponownie i pon¢w pr¢b©."," Jeòli problem powt¢rzy si©, skontaktuj si© z serwisem.",5) 
                    close_all("SH")
					setcolor(lcolor)
					return
endif

  kj_okno(3,3,18, " Obsàuga importu dokument¢w                                              ",7)  
  set color to
  @ 5,5 say "Dokument pochodz•cy od "+zefir_naz+ " o numerze "+zenr_dok
  @ 7,5 say "z dnia "+dtoc(zedat_dok)+ " zaksi©gowany zostanie jeko "+znaz_dok
  @ 22,5 say "Wciònij [Enter] aby zatwierdziÜ import   [Esc] - aby zrezygnowaÜ"
  select &dokexp_sel
  keyboard chr(205)
  dbedit(10,6,20,72,t,"IMP_FU","",q,"ﬂ",,"ﬂ")
  if.not.lastkey()=27
    if kj_gkom(12," ","Dokument przeprowadzi korekt© stan¢w magazynowych.","WykonaÜ  ?",.t.,25)  
			  if.not.nowy_numdok(.f.)
                    close_all("SH")
					setcolor(lcolor)
					return
              endif			    
*@ 10,0 SAY ZDNDOK
*@ 11,0 SAY ZDNDOW
*INKEY(0)			  


	  
	  if.not.tow_use(.f.)
        kj_tkom(8," Uwaga! "," Baza towar¢w nie jest dost©pna. "," Zako‰cz prac© programu, uruchom ponownie i pon¢w pr¢b©."," Jeòli problem powt¢rzy si©, skontaktuj si© z serwisem.",5) 
        close_all("SH")
		setcolor(lcolor)
		return	  
	  endif
      if mag_use(zxmagnum)	        
	    set order to 4
	  else
        kj_tkom(8," Uwaga! "," Baza magazynowa nie jest dost©pna. "," Zako‰cz prac© programu, uruchom ponownie i pon¢w pr¢b©."," Jeòli problem powt¢rzy si©, skontaktuj si© z serwisem.",5) 
        close_all("SH")
		setcolor(lcolor)
		return	  
	  endif	
* Zapisywanie
      select &dok_sel
        if kj_append(3)
          dok_replac()
          replace dndok with zenr_dok,ddatdok with zedat_dok,ddatdow with date()
		  unlock
	    endif		
	  select &dokexp_sel
	  go top
	  do while.not.eof()
	    tow_zer()
		dokexp_lad()
		zmag_lad()
		zt_zmd_lad()
		select &tow_sel
        if kj_append(3)
          ztil=zeilosc
		  ztjm=zmjm
		  ztcen=zecena
		  tow_replac()
		  unlock
	    endif		
		select &gmag_sel
        seek zmindex
		*locate for mindex=zmindex.and.mcen_d=zmcen_d
		if found()
				if reclock(5)      
	              replace mil with mil+zeilosc
				  replace mcen_d with zmcen_d,mcen_h with zmcen_h
				  replace mcen_m with zmcen_m
                  replace mwidoczny with .t.
				  unlock
	            endif			      		  
		else
		  if kj_append(3)
            m_replac()
		    replace mil with zeilosc
			replace mwidoczny with .t.
			unlock
	      endif
		endif				
		select &dokexp_sel
		skip
	  enddo     
	  clear
      @ 10,10 say "Czekaj! Trwa indeksacja bazy danych."
      indeksacja()
	  @ 14,10 say "Import dokumentu zako‰czony pomyòlnie."
	  inkey(5)
	  clear
    endif 
  endif
else
  kj_tkom(8," Uwaga! "," Odpowiedni dokument nie zostaà w systemie zdefiniowany.","Import nie jest moæliwy!.","Skontaktuj si© z serwisem.",5)  
endif
setcolor(lcolor)
RETURN 

FUNCTION IMP_FU()
local last:=lastkey()
do case
  case last=27
    return 0
  case last=13
    return 0	
endcase
RETURN 1

FUNCTION DOKWZOR1_TWORZ()
local ek,lnowy:=.f.,lw:=2,lk:=2,t[1],ldni:=0,ldniedop:=zdniedop
local lop_tndow,lop_tnum,lop_tnaz,lop_pom,lrecno,lwzor_typ:=zdtyp
local ldndow:=zdndow
select &dok_sel
dwar=dbfilter()
t[1]:="naz_dok"
save screen to ek
@ 0,1 say " Wybierz dokument do utworzenia :     "
g_tlo()
if wzor_use()
  locate for wwzor_typ==zdtyp
  if found()
    wzor_lad()
	zwmozliwe=alltrim(zwmozliwe)
  else
    inkey(0)
	kj_tkom(8," Uwaga! ","Ten dokument nie zostaà zdefiniowany jako wzorcowy.","Zadanie nie zostanie wykonane.","",5)            
    restore screen from ek
    select &dok_sel

	return .f.
  endif
else
  inkey(0)
  kj_tkom(8," Uwaga! ","Brak dost©pu do bazy <wzor.dbf>. ","Zadanie zostanie przerwane.","",5)            
  restore screen from ek
  select &dok_sel
  return .f.
endif
**
set default to leg01
if.not.file("dok_def.dbf")
  ld_sciezka:=zd_serwer+"leg01"
  set default to &ld_sciezka
endif
select &dokdef_sel
if zdokzmienwzor_op.and.kj_use("dok_def",.f.,3)
  set index to dok_def
  set filter to typ_dok$zwmozliwe
  go top
  locate for znak_dok=zdznak
  ildok=ilosc_dok()
  @ 2,lw+1 to 2+ildok+1,lw+14 
  keyboard chr(205)
  dbedit(3,lw+2,3+ildok-1,lw+13,t,"FU_D","","","",,"")
  close
  if lastkey()=27
    select &dok_sel
	restore screen from ek
    return .f.
  endif
endif
*
if wzor_use()
  locate for wwzor_typ==lwzor_typ.and.wnew_typ==zdtyp
  if found()
    wzor_lad()
  else
    inkey(0)
	kj_tkom(8," Uwaga! ","Wykryto bà©dy w pliku <wzor.dbf>.","Zadanie nie zostanie wykonane.","",5)            
    restore screen from ek
    select &dok_sel
	return .f.
  endif
else
  inkey(0)
  kj_tkom(8," Uwaga! ","Brak dost©pu do bazy <wzor.dbf>. ","Zadanie zostanie przerwane.","",5)            
  restore screen from ek
  select &dok_sel
  return .f.
endif
*
  keyboard chr(205)
  if zdtyp$dowod_gr
    if.not.empty(zdtermin).and..not.empty(zddatdow)
      ldni=zdtermin-zddatdow  
	  zdtermin=date()+ldni
    endif  
  else
    if.not.empty(zdtermin).and..not.empty(zddatdok)
      ldni=zdtermin-zddatdok  
	  zdtermin=date()+ldni
    endif
  endif	
*
  
  dok_default()
  if zopis_poz.and.file("topis.dbf")  &&przeniesienie opisw pozycji
    select &topis_sel
	if kj_use("topis",.f.,3)
	  set index to topis
	  seek zdndow
	  if found()
	    do while op_tndow=zdndow
          lrecno=recno()
		  lop_tnum=op_tnum
		  lop_tnaz=op_tnaz
		  lop_pom=op_pom
          if kj_append(3)
	        replace op_tnum with lop_tnum,op_tnaz with lop_tnaz,op_pom with lop_pom
            unlock
	      endif		  
		  go lrecno		
		  skip
		enddo
	  endif
	endif
	close  
  endif	  
*

if substr(zwster,1,1)=="1"  && Sytuacja gdy dokument wzorcowy jest anulowany i uzyskuje blokad© modyfikacji stan¢w magazynowych
  if tow_use(.f.)
    seek zdndow
	if found()
	  do while tndow=zdndow
				if reclock(5)      
	              replace tkormag with .f.,tanul with .t.
                  unlock
	            endif			      	    
		skip
	  enddo
	endif
  endif
				*if dok_use()
				  select &dok_sel
				  zdfiltr=dbfilter()
				  set filter to
				  go top
				  set order to 3
				  seek zdndow
				  if found()
				    if reclock(5)      
	                  replace danul with .t.
                      unlock
	                endif			  
				  else
                    kj_tkom(8," Uwaga! "," Nie moæna odnale´Ü dokumentu ",zdndow,"",5)				    
				  endif	
				  set filter to &zdfiltr
				  go top
				  set order to 1
				*endif      
endif
if substr(zwster,1,1)=="2"  && Sytuacja gdy dokument wzorcowy uzyskuje blokad© modyfikacji stan¢w magazynowych
  if tow_use(.f.)
    seek zdndow
	if found()
	  do while tndow=zdndow
				if reclock(5)      
	              replace tkormag with .f.
                  unlock
	            endif			      	    
		skip
	  enddo
	endif
  endif
endif

  zdanul=.f.
  zddatdok=date()
  zddatdow=date()
  zddatsp=date()
  if zwkontrah
    kontrah(zk_serwer,.t.,"",3,.f.,1)      
    if lastkey()=27
      restore screen from ek
      select &dok_sel
	  return .f.	
	endif
  endif
**22.04.2004
if substr(zwster,2,1)=="1"  &&Prezentacja dokumentu tworzonego w cenach detalicznych
	mag_use(1)
	set order to 4
    *select &buf_sel	
	buf_use()
	go top
	do while.not.eof()
	  ztow_lad()
	    select &gmag_sel
	    seek ztmindex
	    if found()
	      zmag_lad()	
		else
		  m_zer()
		endif
		select &buf_sel
        replace tcen with zmcen_d
		unlock
	  skip
	enddo
	select &gmag_sel
	close
endif
**
          kj_okno(2,30,6,"   *  D a n e   u z u p e à n i a j • c e  *   ",2)
          @ 4,32 say     "Data wystawienia dokumentu..             "
		  
		  zddatdok=date()
		  set cursor on
		  @ 4,60 get zddatdok
		  do case
		    case zdtyp$defnum_gr
              @ 6,32 say     "Numer  dokumentu ...........             "               
		      @ 6,60 get zdndok
			otherwise
              *@ 6,32 say     "Dokumentowi nadano numer ...             "               
			  *if.not.nowy_numdok(.f.)
              *  return .f.
              *endif			    
		      *@ 6,60 say zdndok+1  &&060307
		  endcase	
		  read
		  set cursor off
***
  zap_dok(.t.)
          if zwkormag
		    if kor_mag(.f.)
			  dok_znacz()
			endif
		  endif
        *if kasa_glowna.and.zdtyp$kasadok_gr.and.zdsposzap$"GKR"
		if kasa_glowna.and.zdtyp$kasadok_gr
          dokdef(1)
		  ldndow=zdndow
          zdniedop=ztbrut_all
		  kasa_dok()
		  close_all("SH")
		  dokdef(0)
        endif		


  select &dok_sel
  dok_use()
  set filter to &dwar
  go top
  go bottom
*        if reclock(5)      
*	      replace dniedop with ldniedop
*          unlock
*	    endif

**
keyboard chr(27)
restore screen from ek
RETURN .t.

FUNCTION DLAKOREKTY_BUF()
local recno,ldok_war:=dbfilter(),ldndow:=space(15),select:=select()
if.not.tow_use(.f.)
  kj_tkom(8," Uwaga! "," Brak dost©pu do bazy <towary.dbf> !","Faktura koryguj•ca nie zostanie wystawiona.","",5)  
endif
if.not.buf_use(.f.)
  kj_tkom(8," Uwaga! "," Brak dost©pu do bazy <tow_buf.dbf> !","Faktura koryguj•ca nie zostanie wystawiona.","",5)  
endif
select &dok_sel
recno=recno()
*set filter to dkordok=zdndok
set filter to dkordok=zdndow
go top
do while.not.eof()
  ldndow=dndow
  select &tow_sel
  seek ldndow
  if found()
    do while tndow=ldndow
*	  if.not.ztanul &&060504
	    ztow_lad()
	    if.not.til=0
	      select &buf_sel
          if kj_append(3)
	        tow_replac()
            unlock
	      endif
	      select &tow_sel
	    endif
*	  endif
	  skip
	enddo
  endif
  select &dok_sel
  skip
enddo
select &tow_sel
close
selec &buf_sel
if.not.zduty_kor
  fifo_buf()
else
  fifo1_buf()
endif  
select &dok_sel
go recno
RETURN

FUNCTION TOW_KURS()
local select:=select(),recno:=recno()
  if.not.tow_use(.f.)
    return
  endif
seek zdndow
if found()
  do while tndow=zdndow
				if reclock(5)      
	              replace tcen with kj_round(tcen_dewiz*zdkurs,4)
                  unlock
	            endif			          
	skip
  enddo
endif  
select &select
*go recno
RETURN




FUNCTION ARCHIWIZUJ()
g_tlo()
if kj_gkom(12,"","Czy chcesz przeprowadziÜ archiwizacj© danych ?","",.t.,25)
  if zarchiw=1
	run bat\archiw.bat
  endif
  if zarchiw=2	
    day=day(date())
	do case
	  case day=1.or.day=11.or.day=21.or.day=31
	    run bat\archiw01.bat
	  case day=2.or.day=12.or.day=22
	    run bat\archiw02.bat
	  case day=3.or.day=13.or.day=23
	    run bat\archiw03.bat
	  case day=4.or.day=14.or.day=24
	    run bat\archiw04.bat
	  case day=5.or.day=15.or.day=25
	    run bat\archiw05.bat
	  case day=6.or.day=16.or.day=26
	    run bat\archiw06.bat
	  case day=7.or.day=17.or.day=27
	    run bat\archiw07.bat
	  case day=8.or.day=18.or.day=28
	    run bat\archiw08.bat
	  case day=9.or.day=19.or.day=29
	    run bat\archiw09.bat
	  case day=10.or.day=20.or.day=30
	    run bat\archiw00.bat																
	endcase
  endif  
endif
RETURN

FUNCTION KJ_DOKNUMER(pdndok)
local ldndok:=pdndok
  if zdtyp$bezznak_gr
    do case 
	  case substr(ldndok,10,1)$"ABCDEFGHIJKLMNOPRSTUVWYZabcdefghijklmnoprstuvwyz"
	    ldndok=stuff(ldndok,10,2,"")  
      case substr(ldndok,9,1)$"ABCDEFGHIJKLMNOPRSTUVWYZabcdefghijklmnoprstuvwyz"
	    ldndok=stuff(ldndok,9,2,"")  
      case substr(ldndok,11,1)$"ABCDEFGHIJKLMNOPRSTUVWYZabcdefghijklmnoprstuvwyz"
	    ldndok=stuff(ldndok,11,2,"")  	  	  
	endcase
  endif
RETURN ldndok

FUNCTION NIP_PL()
local lnip:=substr(zlic6,1,13),i,lnip_pl
for i=1 to 13
  if substr(lnip,i,1)="-"
    lnip=stuff(lnip,i,1,"")
  endif
next
lnip="PL"+lnip
RETURN lnip

FUNCTION ZBIORCZY_DOK()
local recno:=recno(),ek, lcolor:=setcolor(),lile_dok:=0, lsukces:=.t.
local lweryf:=.t.,ldkontrah:=0,ldndow:="", ldniedop:=0,ldnskrot:=""
public zdzbiorczy_filtr:=dbfilter()
public z1zbior:=zdzbiorczy_filtr+'.and.substr(dster,1,1)=="*"'
buf_use()
zap
if.not.tow_use(.f.)
  return .f.
endif
select &dok_sel
set filter to &z1zbior
go top
ldkontrah=dkontrah
ldnskrot=dnskrot
zknum=dkontrah
***********************************Weryfikacja i liczenie dokument¢w
do while.not.eof()
  zdok_lad()  
  if .not.dkontrah=ldkontrah
    lweryf=.f.
  endif
  lile_dok=lile_dok+1
  select &dok_sel
  skip
enddo







save screen to ek
set color to b/b,b/b
clear
set color to lcolor

do while.t.
  kj_okno(7,18,8, "     D O K U M E N T    Z B I O R C Z Y     ",7)
  set color to 
  @ 11,20 say "Zaznaczono" 
  @ 11,32 say lile_dok picture "999"
  do case
    case lile_dok=0
      @ 11,20 say "Nie zaznaczono æadnych dokument¢w"
	  inkey(1)
	  lsukces=.f.
	  exit
    case lile_dok=1	
      @ 11,38 say "dokument"
    case lile_dok>1.and.lile_dok<5		
      @ 11,38 say "dokumenty"
    otherwise
  	  @ 11,38 say "dokument¢w"
  endcase

  inkey(1)
  set color to w+*
  @ 11,20 say "Czekaj !  Trwa weryfikacja dokument¢w."
  set color to
  

  inkey(1)
  
  if lweryf
    @ 11,20 say "Weryfikacja zako‰czona sukcesem.      " 
    inkey(2)

  else
    @ 9,20 say "Weryfikacja zako‰czona bà©dem !!!     " 
    @ 10,20 say "                                      " 
	@ 11,20 say "Dokumenty musz• dotyczyÜ tego samego  "
	@ 12,20 say "           kontrahenta.               "  
	@ 14,20 say "Sprawd´ zaznaczone dokumenty.         "  
	inkey(2)
	lsukces=.f.
	exit
  endif

************************************Tworzeie pliku tow_buf
  select &dok_sel
  go top
  do while.not.eof()
    zdok_lad()  
    ldniedop=ldniedop+dniedop
    ldndow=dndow
    select &tow_sel
    seek ldndow
    if found()
      do while alltrim(tndow)==alltrim(ldndow)
        ztow_lad()
        if reclock(5)      
          replace tanul with .t.,tster with stuff(tster,1,2," *"),tkormag with .f.
          unlock
        endif			              
	    select &buf_sel
	    locate for tnaz=ztnaz.and.tkod=ztkod.and.tjm=ztjm.and.tcen=ztcen
	    if found()
	      replace til with til+ztil
	    else
	      append blank
	      tow_replac()
	    endif
	    select &tow_sel
        skip
      enddo
    endif
    select &dok_sel
    skip
  enddo

**********************************Porz•dkowanie numeracji poz. na dokumencie
  select &buf_sel
  go top
  set index to
  do while.not.eof()
    replace tnum with recno()
    skip
  enddo
  index on tnum to towbuf
**********************************Nadanie nowego numeru zbiorczemu WZ  
			  if.not.nowy_numdok(.T.)
                return .f.
              endif			    
*********************************Tworzenie dokumentu zbiorczego WZ
	select &dok_sel
    go top
    do while.not.eof()
      if reclock(5)      
        replace dndok with zdndow,ddatdok with date(),dster with stuff(dster,1,2," *")
        replace danul with .t.
	    unlock
      endif			        
      skip
    enddo

select &dok_sel

  if kj_append(3)
    dster=stuff(dster,1,1,"/")
	dok_replac()  
	replace dster with stuff(dster,1,1,"/"),dniedop with ldniedop
    replace ddatdow with date(),dnskrot with ldnskrot
	unlock
  endif  
  
  select &buf_sel
  go top
  do while.not.eof()
    ztow_lad()
	select &tow_sel
    if kj_append(3)
	    tow_replac()
        replace tndow with zdndow
		unlock
	endif	
	select &buf_sel
	skip
  enddo

  
  exit
enddo
select &dok_sel
set filter to &zdzbiorczy_filtr
go top
set color to (lcolor)
restore screen from ek
go bottom
RETURN lsukces


FUNCTION AKWIZYTOR()
local lnum:=0,lcolor:="w/b"
set color to (lcolor)
keyboard chr(205)
if akwizyt_use()
  set filter to .not.akw_ukryj
  go top
  @ 5,1 to 19,20
  dbedit(6,2,18,19,"akw_skrot","AKW_FU1","","Wybierz akwizytora",chr(196),"",)
  close
endif  
lnum=zakw_num
RETURN lnum

FUNCTION AKW_FU1()
local last:=lastkey()
do case
  case last=27
    return 0
  case last=13
    akwizyt_lad()

	return 0	
endcase
RETURN 1

FUNCTION AKWIZYT_EDIT()
local lnum:=0,lcolor:="w/b"
local t[10],q[10]
t[1]:="akw_ukryj"
t[2]:="akw_skrot"
t[3]:="akw_prowiz"
t[4]:="akw_naz1"
t[5]:="akw_naz2"
t[6]:="akw_ulica"
t[7]:="akw_kod"
t[8]:="akw_miasto"
t[9]:="akw_tel"
t[10]:="akw_mail"
q[1]:="Ukryj"
q[2]:="Skr¢t nazwy"
q[3]:="Prowizja"
q[4]:="Nazwa "
q[5]:="Nazwa"
q[6]:="Adres: ulica"
q[7]:="Kod"
q[8]:="Miasto"
q[9]:="Numery telefon¢w"
q[10]:="Adres poczty elektronicznej"


set color to (lcolor)
keyboard chr(205)
if akwizyt_use()
  @ 5,1 to 23,78
  dbedit(6,2,22,77,t,"AKW_FU2","",q,chr(196),,"",)
  close
endif  
RETURN

FUNCTION AKW_FU2()
local last:=lastkey(),ek
do skom with "<D>opisz   <P>opraw    <U>kryj    przy<W>roc   <Esc> - rezygnacja"
akwizyt_lad()
do case
  case last=27
    return 0
  case last=13
    akw_edit("0")
	keyboard chr(205)
	return 2
  case chr(last)$"Uu"
				if reclock(5)      
	              replace akw_ukryj with .t.
                  unlock
	            endif			           		
  case chr(last)$"Ww"
				if reclock(5)      
	              replace akw_ukryj with .f.
                  unlock
	            endif	
  case chr(last)$"Dd"
    akw_edit("1")
	keyboard chr(205)
	return 2
  case chr(last)$"Pp"
    akw_edit("2")	
	keyboard chr(205)
	return 2
endcase
RETURN 1

FUNCTION AKW_EDIT(ptryb)
local ek
if ptryb="1"
  akwizyt_zer()
endif  
save screen to ek
clear
@ 1,1 say "DANE AKWIZYTORA:"
@ 2,10 to 21,70
set cursor on	
@ 4,12 say  "Skr¢t nazwy ......."
@ 6,12 say  "Nazwa ............."
@ 7,12 say  "Nazwa (cd) ........"
@ 9,12 say  "ADRES:"
@ 10,12 say "      Ulica ......."
@ 12,12 say "      Kod ........."
@ 14,12 say "      Miasto ......"
@ 16,12 say "Telefon ..........."
@ 18,12 say "E-mail ............"
@ 20,12 say "Prowizja [ % ] ...."
if ptryb$"12"
  @ 4,32 get zakw_skrot when s_kom("Wpisz skr¢t nazwy akwizytora")
  @ 6,32 get zakw_naz1 when s_kom("Wpisz nazw© akwizytora")
  @ 7,32 get zakw_naz2 when s_kom("Wpisz dalszy ci•g nazwy akwizytora")
  @ 10,32 get zakw_ulica when s_kom("Wpisz adres akwizytora - nazw© ulicy")
  @ 12,32 get zakw_kod  when s_kom("Wpisz kod pocztowy")
  @ 14,32 get zakw_miasto when s_kom("Wpisz miasto")
  @ 16,32 get zakw_tel  when s_kom("Wpisz telefony kontaktowe akwizytora")
  @ 18,32 get zakw_mail  when s_kom("Wpisz adres poczty elektronicznej akwizytora")
  @ 20,32 get zakw_prowiz picture "99.99" when  s_kom("Wpisz wysokoòÜ prowizji w % ")
  read
else
  @ 4,32 say zakw_skrot
  @ 6,32 say zakw_naz1
  @ 7,32 say zakw_naz2
  @ 10,32 say zakw_ulica
  @ 12,32 say zakw_kod
  @ 14,32 say zakw_miasto
  @ 16,32 say zakw_tel
  @ 18,32 say zakw_mail
  @ 20,32 say zakw_prowiz
  s_kom("Naciònij dowolny klawisz ")
  inkey(0)
endif
set cursor off
if.not.lastkey()=27
  do case
    case ptryb="1"
      if kj_append(3)
	      akwizyt_replac()
          unlock
	  endif
    case ptryb="2"	
	  if reclock(5)      
        akwizyt_replac()
        unlock
      endif			           		
  endcase
endif
restore screen from ek
RETURN

FUNCTION FIFO_KLESZCZ()
local lbo_rok:="bo_xxxx.dbf"
lbo_rok=stuff(lbo_rok,4,4,alltrim(str(year(date())-1)))
*fifo_zrob()
if file("bo.dbf")
  copy file "bo.dbf" to &lbo_rok
endif
copy file "magaz.dbf" to "bo.dbf"
        if kj_use("bo",.t.,3)
		  do skom with "Indeksacja pliku bo.dbf w magazynie "
		  @ 24,60 say lmag
	      if zrozmiar
		    index on substr(mnaz,1,45)+mkod to bo_naz
		  else
		    index on mnaz+mkod to bo_naz
		  endif	
		  index on mkod+mnaz to bo_kod
	      index on mindex to bo_index
		  index on mmagaz+mnaz+mkod to bo_mnk
		  index on mmagaz+mkod+mnaz to bo_mkn		  
		  if zmgrupy
		    do case
			  case zmgrup_tryb=1
			    index on mgrup+mnaz to bo_grup		  
			  case zmgrup_tryb=2
			    index on mmagaz+mnaz to bo_grup		  				
			endcase
			
		  endif
		  if zkreskakod
		    index on mpasek to bo_kresk
		  endif
		  use
        else
          if kj_gkom(12," Uwaga! ","Brak dostepu do pliku bo.dbf w magazynie",lmag+"  Przerwac indeksacje ?",.t.,5)
	        restore screen from ek
            setcolor(lcolor)
	        return
	      endif 
        endif


copy file "fifo.dbf"  to "bo_fifo.dbf"
index on str(cindex)+dtoc(czakdat) to bo_fifo
RETURN



FUNCTION FIFO_ZAK_ANUL()
if fifo_use(1)
  if buf_use()
    go top
    do while.not.eof()
      ztow_lad()
	  select &fifo_sel
	  seek str(ztmindex)
	  if found()
	    do while cindex=ztmindex
	      if cndow=ztndow.and.ccena=ztcen
		    if canul
				if reclock(5)      
	              replace canul with .f.
                  unlock
	            endif			      		  
		    else
				if reclock(5)      
	              replace canul with .t.
                  unlock
	            endif			      		  		  
		    endif
		  endif
		  skip
	    enddo
	  else
        kj_tkom(8," Uwaga! "," Brak obsàugi FIFO dla pozycji",ztnaz,"Nacisnij dowolny klawisz.",5)	  
	  endif
	  select &buf_sel     
      skip
    enddo
  endif
endif  
RETURN

FUNCTION FIFO_SPRZEDAJ()
local select:=select(),ltil:=ztil
if.not.fifo_tow_use()
  kj_tkom(8," Uwaga! "," Wyst•pià bà•d obsàugi FIFO dla pozycji",ztnaz,"Nacisnij dowolny klawisz.",5)	    
endif
if fifo_use(1)
  seek str(ztmindex)
  if found()
    do while cindex=ztmindex  
	  fifo_lad()
	  if cil>0.and..not.canul
        if ltil>cil
		        ltil=ltil-cil  		  		  		  
				if reclock(5)      
	              replace cil with 0
                  unlock
	            endif			    
				select &fifo_tow_sel
                if kj_append(3)
	              zeindex=zcindex
				  zeil=zcil
				  zecena=zccena
				  zendow=zdndow
				  zendow_zak=zcndow
				  zester=zcster
				  fifo_tow_replac()
                  unlock
	            endif		
				select &fifo_sel		
		else
				if reclock(5)      
	              replace cil with cil-ltil
                  unlock
	            endif			      	
				select &fifo_tow_sel
                if kj_append(3)
	              zeindex=zcindex
				  zeil=ltil
				  zecena_zak=zccena
				  zendow=zdndow
				  zendow_zak=zcndow
				  zester=zcster
				  fifo_tow_replac()
                  unlock
	            endif		
				select &fifo_sel							  		  		 
				exit
		endif	  
	  endif
	  skip
	enddo
  else
    kj_tkom(8," Uwaga! "," Brak obsàugi FIFO dla pozycji",ztnaz,"Nacisnij dowolny klawisz.",5)	    
  endif  
  close
endif
select &fifo_tow_sel
close
select &select
RETURN

FUNCTION FIFO_SP_ANUL()
local ltil:=0
if.not.fifo_use(1)
  kj_tkom(8," Uwaga! "," Wyst•pià bà•d obsàugi FIFO (mag) dla funkcji ","anulowania sprzedaæy.","Nacisnij dowolny klawisz.",5)	    
  return
endif

if.not.zdanul
  if fifo_tow_use()
    seek zdndow
    if found()
      do while endow=zdndow
				if reclock(5)      
			      replace eanul with .t.
				  unlock
	            endif
        fifo_tow_lad()					      		  
		select &fifo_sel
		seek str(zeindex)
		if found()
		    do while cindex=zeindex
			  if cndow=zendow_zak.and.ccena=zecena
				if reclock(5)      
	              replace cil with cil+zeil
                  unlock
	            endif			      			  
			  endif
			  skip
			enddo
		endif  
		select &fifo_tow_sel
	    skip
	  enddo
    endif
  else
    kj_tkom(8," Uwaga! "," Wyst•pià bà•d obsàugi FIFO (tow) dla funkcji ","anulowania sprzedaæy.","Nacisnij dowolny klawisz.",5)	    
  endif
else                   &&reanulowanie
  if buf_use()
	go top
			  do while.not.eof()
			    ztow_lad()
				fifo_sprzedaj()			
				skip
			  enddo	
  endif
endif
RETURN


FUNCTION FIFO_ZROB()
local lbo_dat:=ctod("01.01.2000"),lstart_dat:=date(),lend_dat:=date(),lrok:=year(date())
local ek, lcolor:=setcolor(),ltxt_dat:="",lfifo_ok:=.t.,lcykl:=1
save screen to ek

********************************************** Ustalenie zakresu czasowego
g_tlo()
kj_okno(6,25,6, "  ANALIZA MAGAZYNU WEDùUG FIFO ",24)
set color to w/b
@ 8,27 say "Za rok .......... "
set cursor on
@ 8,45 get lrok when s_kom("Wpisz rok obj©ty analiz•.")
read
ltxt_dat="01.01."+str(lrok)
lstart_dat=ctod(ltxt_dat)
@ 10,27 say "Od dnia ......... "
@ 10,45 say lstart_dat
@ 11,27 say "Do dnia ......... "
@ 11,45 get lend_dat
read
set cursor off
***********************************************

***************************przygotowanie obszar¢w roboczych
if.not.dok_use()
  kj_tkom(8," Uwaga! 01 "," Wykryto bledy w procedurze FIFO","Operacja nie zostaàa wykonana","Nacisnij dowolny klawisz.",5)
  return .f.
else
  *index on dtoc(ddatdow)+dgrup to dok_dg
  index on str(year(ddatdow))+str(month(ddatdow))+str(day(ddatdow))+dgrup to dok_dg
  set index to dok_dg
endif
if.not.tow_use(.f.)
  kj_tkom(8," Uwaga! 02 "," Wykryto bledy w procedurze FIFO","Operacja nie zostaàa wykonana","Nacisnij dowolny klawisz.",5)
  return .f.
else
  set filter to .not. tanul
  go top
endif
if.not.fifo_tow_use()
  kj_tkom(8," Uwaga! 03"," Wykryto bledy w procedurze FIFO","Operacja nie zostaàa wykonana","Nacisnij dowolny klawisz.",5)
  return .f.
else
  zap  
endif

*if.not.fifo_bo_use(1)
*  kj_tkom(8," Uwaga! 03"," Wykryto bledy w procedurze FIFO","Operacja nie zostaàa wykonana","Nacisnij dowolny klawisz.",5)
*  return .f.
*endif
magdefault(1)
copy file "magaz.dbf" to fifo_mag.dbf
select &fifo_mag_sel
use fifo_mag
do while.not.eof()
  replace bo_il with mil
  replace mil with 0
  skip
enddo
*** indeksacja pliku fifo_mag
		  index on mkod+mnaz to f_kod
	      index on mindex to f_index
		  index on mmagaz+mnaz+mkod to f_mnk
		  index on mmagaz+mkod+mnaz to f_mkn		  
		  if zmgrupy
		    do case
			  case zmgrup_tryb=1
			    index on mgrup+mnaz to f_grup		  
			  case zmgrup_tryb=2
			    index on mmagaz+mnaz to f_grup		  				
			endcase
			
		  endif
		  if zkreskakod
		    index on mpasek to f_kresk
		  endif
***
use fifo_mag index f_index
*******************************************

***************************wpisanie zawartoòci BO do pliku fifo
if file("bo.dbf")
  select &fifo_bo_sel
   magdefault(1)
   use fifo_bo
   set index to fifo_bo
   zap
   if bo_use(1)
     set filter to mil>0
	 go top
     do while .not.eof()
       zmag_lad()      	   
	   select &fifo_bo_sel
	   append blank
	   replace cindex with zmindex,czakdat with lbo_dat,cil with zmil
	   replace ccena with zmcen_m,cndow with " B O ",cster with zmster
	   select &gbo_sel
	   skip
	 enddo     
   endif
   close
   select &fifo_bo_sel
   close   
endif   
copy file fifo_bo.dbf to fifo.dbf
select &fifo_sel
magdefault(1)
use fifo
index on str(cindex)+str(year(czakdat))+str(month(czakdat))+str(day(czakdat))+cndow to fifo
use fifo index fifo
*****************************

************************analiza dokument¢w 
lcykl=1
select &dok_sel
do while .t.
  do case
    case zfifo_tryb="1"
      set filter to dtyp$fifo_gr.and.year(ddatdow)=lrok.and.min(ddatdow,lend_dat)=ddatdow.and..not.danul
    case zfifo_tryb="2".and.lcykl=1
      set filter to dtyp$zakup_gr.and.dtyp$fifo_gr.and.year(ddatdow)=lrok.and.min(ddatdow,lend_dat)=ddatdow.and..not.danul	  
	case zfifo_tryb="2".and.lcykl=2  
	  set filter to dtyp$sprzedaz_gr.and.dtyp$fifo_gr.and.year(ddatdow)=lrok.and.min(ddatdow,lend_dat)=ddatdow.and..not.danul	  
	go top
  endcase
  do while.not.eof()
    if lastkey()=27
      if kj_gkom(12," ","PrzerwaÜ analiz© FIFO ?","",.t.,25)
	    lfifo_ok=.f.
	    exit
	  endif  
    endif
    zdok_lad()
      select &tow_sel
      seek zdndow
      if found()
        do while tndow=zdndow
	      ztow_lad()
	      if ztkormag
		    select &fifo_sel
	        do case 
			  case zdtyp$zakup_gr.and.ztil>=0
	            append blank
	            replace cindex with ztmindex,czakdat with zddatdow,cil with ztil
	            replace ccena with ztcen,cndow with zdndow,cster with ztster
				replace ckontrah with zdkontrah
		
		        *************************ewentualne uzupeànienie usuni©tego z magazynu  indeksu
		        select &fifo_mag_sel
		        seek ztmindex
		        if.not.found()
		          append blank
		          replace mindex with ztmindex,mnaz with ztnaz,mkod with ztkod
		          replace mmagaz with ztmagaz,mgrup with ztgrup,mjm with ztjm
		          replace mcen_m with ztcen,mstawka with ztstawka,msymbol with ztsymbol
		          replace mster with "fif",mpasek with ztpasek,mdekret with ztdekret
		          replace mkormag with .t.,mdokzak with zdndow
			    endif
		        *******************************
 		      
			  case zdtyp$zakup_gr.and.ztil<0
			    seek str(ztmindex)
				if found()
				  l_ok=.f.
                  do while cindex=ztmindex
				    *if czakdat=zdkordat.and.ckontrah=zdkontrah.and.ccena=ztcen
					if ckontrah=zdkontrah.and.ccena=ztcen
					  if cil=-ztil
					    replace cil with cil+ztil
						l_ok=.t.
						exit
					  else
                        kj_tkom(9," Uwaga!* ","Wykryto problem podczas obsàugi dokumentu koryguj•cego w pozycji",alltrim(ztnaz)+" Nr WZ  "+alltrim(ztndow)+" z dnia "+dtoc(zddatdow),"Prawdopodobnie anulowano lub zmieniono dokument zakupu!",5)									    
					  endif	
					endif
					skip
				  enddo		
				  if.not.l_ok
				    kj_tkom(9," Uwaga!** ","Wykryto problem podczas obsàugi dokumentu koryguj•cego w pozycji",alltrim(ztnaz)+" Nr WZ  "+alltrim(ztndow)+" z dnia "+dtoc(zddatdow),"Prawdopodobnie anulowano lub zmieniono dokument zakupu!",5)									    
					lfifo_ok=.f.
				  endif		
				else
                  kj_tkom(9," Uwaga! ","Wykryto problem podczas obsàugi dokumentu koryguj•cego w pozycji",alltrim(ztnaz)+" Nr WZ  "+alltrim(ztndow)+" z dnia "+dtoc(zddatdow),"Prawdopodobnie anulowano lub zmieniono dokument zakupu!",5)				
				  lfifo_ok=.f.
				endif
			    
			  case zdtyp$sprzedaz_gr  
				seek str(ztmindex)
				if found()
				  do case
					case ztil>=0
					  lsukces=.f.
					  lkoncz=.f.				    
					  do while cindex=ztmindex
					    fifo_lad()
						if cil>=ztil
						  lil=ztil
						  replace cil with cil-ztil
						  lkoncz=.t.
						else
						  lil=cil
						  replace cil with 0
						endif
						ztil=ztil-lil
						select &fifo_tow_sel
						append blank
						replace endow with zdndow,eindex with ztmindex
						replace eil with lil, ecena_zak with zccena
						replace endow_zak with zcndow,edat_zak with zczakdat
						replace ekon_zak with zckontrah
						select &fifo_sel
						if lkoncz
						  lsukces=.t.
						  exit
						else
						  skip 
						endif					    
					  enddo
					  

					  if.not.lsukces
						kj_tkom(9,"* Uwaga! ","Wykryto problem iloòciowe w magazynie w pozycji",alltrim(ztnaz)+" Nr WZ  "+alltrim(ztndow)+" z dnia "+dtoc(zddatdow),"Prawdopodobnie anulowano lub zmieniono dokument zakupu!",5)
					    lfifo_ok=.f.
					  endif					  
					
					case ztil<0			
					  select &fifo_tow_sel
                      seek zdkordok
					  if found()	
						do while endow=zdkordok
						  if eindex=ztmindex
						    leil=eil
							lecena_zak=ecena_zak
							ledat_zak=edat_zak
							lendow_zak=endow_zak
							lekon_zak=ekon_zak
                            replace eil with 0
														
							select &fifo_sel
							append blank
							replace cindex with ztmindex, czakdat with ledat_zak
							replace cil with leil, ccena with lecena_zak
							replace cndow with lendow_zak, ckontrah with lekon_zak
							replace cster with "korek"
						  endif
						  select &fifo_tow_sel
						  skip
						enddo						
                      else
					    kj_tkom(9," Uwaga![1] ","Stwierdzono sprzedaæ z iloòci• ujemn•!","Dotyczy dokumentu "+zdndow ,"Pozycja "+alltrim(ztnaz),5)					  
				      endif
				  endcase
				else
                  kj_tkom(9," **Uwaga! ","Wykryto problem w magazynie. Brak pozycji",ztnaz,"",5) 				 				
				  lfifo_ok:=.f.
				endif
		    endcase
		  endif
	      select &tow_sel
	      skip
	    enddo
      endif
  
    select &dok_sel
    skip
  enddo
  do case
    case zfifo_tryb="1"
	  exit
	case zfifo_tryb="2"
	  lcykl=lcykl+1
	  if lcykl>2
	    exit
	  endif  
  endcase  
  
enddo

**********************************Wyliczanie stan¢w na podstawie pliku fifo.dbf
select &fifo_sel
go top
lindex=cindex
lil=0
do while.not.eof()
  if cindex=lindex
    lil=lil+cil
  else
	 select &fifo_mag_sel
	 seek lindex
	 if found()
	   replace mil with lil
	 endif
	 select &fifo_sel
	 lindex=cindex
	 lil=cil
  endif
  skip
enddo
	 select &fifo_mag_sel
	 seek lindex
	 if found()
	   replace mil with lil
	 endif
go top
do while.not.eof()
  if.not.mil=0
    replace mwidoczny with .t.
  endif
  skip
enddo
select &fifo_sel
close
select &fifo_mag_sel
if .not.lend_dat=date()
  browse()
  setcolor(lcolor)
  restore screen from ek
  close
  return
endif
close

magdefault(1)
select &fifo_dat_sel
use fifo_dat
append blank
replace data with date()
close

if lfifo_ok.and.lend_dat=date()
  copy file fifo_mag.dbf to magaz.dbf
		if kj_use("magaz",.t.,3)
	      if zrozmiar
		    index on substr(mnaz,1,45)+mkod to m_naz
		  else
		    index on mnaz+mkod to m_naz
		  endif	
		  index on mkod+mnaz to m_kod
	      index on mindex to m_index
		  index on mmagaz+mnaz+mkod to m_mnk
		  index on mmagaz+mkod+mnaz to m_mkn		  
		  if zmgrupy
		    do case
			  case zmgrup_tryb=1
			    index on mgrup+mnaz to m_grup		  
			  case zmgrup_tryb=2
			    index on mmagaz+mnaz to m_grup		  				
			endcase
			
		  endif
		  if zkreskakod
		    index on mpasek to m_kresk
		  endif
		endif
		kj_tkom(12," Ok! ","Analiza FIFO zako‰czona powodzeniem.","Stany magazynowe s• zgodne z dokumentami.","",24) 				 				
else
  kj_tkom(12," Uwaga! ","Analiza FIFO zawiera bà©dy.","System zachowaà dotychczsowe stany magazynowe","Napraw bà©dy i ponow pr¢b©",5) 				 				
endif
setcolor(lcolor)
restore screen from ek
RETURN