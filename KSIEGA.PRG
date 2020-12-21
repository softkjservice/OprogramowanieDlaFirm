*******************************************************************************
* Menu glowne programu KSI®GA                                                     *
*******************************************************************************
FUNCTION SH_KMENU() 
local ek,ek1,ek2,ek3,ltnaz,ltkod,ltil,lfound:=.f.,lcolor,lzak_menu:=0
local lbelka:="∞  Moduày  ∞ Raporty  ∞ Zdarzenia  ∞ Kontrahent ∞  Inne  ∞  kOniec ∞"
local lliter:="   M         R          Z            K             I         O      "
local lpoz:=1,ltopis[20], i:=0,select
local l_inne:=1,l_inne2:=1,lzak:=1,lsprzed:=1,l_inne1:=1,lsprzed1:=1,lsprzed2:=1
local lzak1:=1, lzak2:=1,luse:=.t.,ldsiec:=.f.,t[1],l_inne3:=1
local lw_grup:=2,lk_grup:=2,ld_sciezka:=""
local lile:=6,ilanal:=0,lw:=0,l_inne4:=1,l_inne41:=1,l_kas1:=1,l_inne5:=1
local lopc:=1
vrow=0
k_w=0
k_k=0
zset_serwer=zks_serwer

if zksilefirm>1
  lbelka:="∞  Moduày  ∞ Raporty  ∞   Firma    ∞ Kontrahent ∞  Inne  ∞  kOniec ∞"
  lliter:="   M         R            F          K             I         O      "
endif
t[1]:="naz_dok"
for i=1 to 20
  ltopis[i]:="Ok!"
next
do while .t.    
 * close_all("SH")
  zdtyp="!"
  lpoz=menu_poziom(0,0,lile,lbelka,lliter,ltopis,lpoz,.f.,.f.)   &&Menu glowne
  save screen to ek
  if lastkey()=27
    if kj_gkom(12,"","Zako‰czyÜ prac© ?","",.t.,5).or.lastkey()=27
	  exit
	endif  
  endif
*  if lastkey()=-21
*    serwis()
*	exit
*  endif
  g_tlo()
  if kolor=0
    set color to n/w,w/n
  endif
  do case
    case lpoz=1
	  lw=(lpoz-1)*10
	  lcolor=setcolor()
	  do while .t.
	    setcolor(lcolor)
	    save screen to ek1
		set default to &dokdef_serwer
        if.not.file("dok_def.dbf")
		  ld_sciezka:=zd_serwer+"leg01"
		  set default to &ld_sciezka
		endif
	    select &dokdef_sel
	    if kj_use("dok_def",.f.,3)
		  set index to dok_def
		  ildok=ilosc_dok()
		  @ 2,lw+1 to 2+ildok+1,lw+14 
		  keyboard chr(205)
          dbedit(3,lw+2,3+ildok-1,lw+13,t,"FU_D","","","",,"")
	      close
		  if lastkey()=27
			exit
		  endif
		  do case
		    case substr(zsymbol_dok,2,1)="K"
		      if.not.zarchiw_up
		        if zwydziel_miesiac
                  save screen to ek3
				  lcolor=setcolor()
				  set color to
				  @ 8,28 to 12,52
				  @ 10,30 say "Zatwierd´ miesi•c:  "
				  set cursor on
				  @ 10,49 get zks_miesiac picture "99" range 0,12 when s_kom("Wyb¢r miesi•ca 0 lub wciòni©cie klawisza Esc powoduje udost©pnienie peànej bazy")
				  read
				  set cursor off
                  if lastkey()=27
				    zks_miesiac=0
				  endif				  				
				  restore screen from ek3
				  setcolor(lcolor)
				endif
				if.not.zkim1
				  do while.t.
	                lsprzed1=sprzed1_menu(lsprzed1,lw)
			        save screen to ek2  
		            do case
	                  case lastkey()=27
						exit
	                  case lsprzed1=1
				        nowy_ksiega_dok(.t.,.f.,.f.)
	                  case lsprzed1=2
                        dok_ksold(zks_serwer)
	                endcase	
	                restore screen from ek2
	              enddo
				else
				  lcolor=setcolor()
				  dok_ksold(zks_serwer)
				  setcolor(lcolor)
				  restore screen from ek2
				endif  
		      else
                archiw_menu(1)		    
		      endif
		    
			case substr(zsymbol_dok,2,1)="P"
			  do while .t.
			    wspol_def(.f.)
              	    if lastkey()=27
	                  exit
	                endif						    
			    ks_default(zfirnum)
				if file("pit5.dbf")
                  if kj_use("pit5",.f.,3)
				    zp_remanent=p_remanent
					za_remanent=a_remanent
					close
				  endif				  
				endif
				za_miesiac()
                if lastkey()=27
				  exit
				endif
				if.not.kj_gkom(19,"","WypeàniÜ deklaracj© ?","",.t.,5).or.lastkey()=27				
				  exit
				endif
				ks_pit5()
			  enddo
			  *ks_pit5()

			  
			case substr(zsymbol_dok,2,1)="U"
			  ks_utarg()		  
			  
			case substr(zsymbol_dok,2,1)="S"
			  vat7_param()		  			  
			case substr(zsymbol_dok,2,1)="L"
			  ks_import()

		  endcase
		  restore screen from ek1
          if.not.zkim1
		            close_all("SH")
		  endif			
		else
	      if.not.kj_gkom(12," Uwaga!","Brak dost©pu do pliku DOK_DEF.DBF","PonowiÜ pr¢b© ?",5)
		    exit
		  endif
	    endif
	  enddo	
	  
    case lpoz=2

	  set default to &set_serwer
      if file("analiza.dbf")
	    select &anal_sel
        k_zer()
		ksraport()		
		select &ks_sel
		close
		select &anal_sel		
	    close
	  endif	

    case lpoz=3.and.zksilefirm>1
	  keyboard chr(205)
	  ksfirnum()
	  
    case lpoz=3.and..not.zksilefirm>1
	  keyboard chr(205)
	  slownik_ks()	  
	case lpoz=4                    &&Kontrahent
      k_okno=.f.
	  k_txt=space(10)
	  k_klucz=1
	  k_ksiega=.f.
	  k_tryb=1
      kontrah(zk_serwer,k_okno,k_txt,k_klucz,k_ksiega,k_tryb)	   	   
      close_all("SH")

    case lpoz=5                &&Inne
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
			    l_inne1=inneks_menu1(l_inne1)
			  do case
			    case lastkey()=27
				  exit
                
				case l_inne1=1
                  druk_wybor(9,43)
			    case l_inne1=2
				  if zksilefirm>1
				    lopc=opcjeget_menu(lopc)
                    do case
					  case lopc=1.and.zopc_upraw
					    opcje_get(1) 
					  case lopc=1.and..not.zopc_upraw
                        kj_tkom(12," Uwaga! ","","Brak uprawnie‰","",5)       	
					  case lopc=2
					    opcje_get(2) 
					endcase
				  else
				    opcje_get(1)
				  endif	

				  
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
			  l_inne5=inne5_menu(l_inne5)
              if lastkey()=27
			    restore screen from ek2
			    exit
			  endif
			  do case
			    case l_inne5=1
				  ks_remanent()
				case l_inne5=2
				  ks_nowyrok()    
				case l_inne5=3
				  wspol_def(.t.)  				  
			  endcase
			enddo
			restore screen from ek2  
		endcase
	  enddo
	  

	  
      
	  
    case lpoz=6
	  if kj_gkom(12,"","Zako‰czyÜ prac© w progrmu ?","",.t.,5)
	    close all
        set color to
	    clear
	    return
	  endif	
  endcase

  restore screen from ek
  sh_paramsay()
enddo
RETURN nil






FUNCTION NOWY_KSIEGA_DOK(pkontrah,pdok,pautomat)
local ek,ltyt:=substr(zopis_dok,1,80),lpoz:=1,ltryb:=1
local lknaz1:="",ldtyp:=zdtyp,ldgrup:=zdgrup,ldndow:=zdndow
*dokdef(1)
zksdok_end=.f.
save screen to ek
ks_zer()
do while.t.
  z_zdok_def_lad()
  *if.not.lpoz=5.and.pkontrah
  if.not.pkontrah.or.ltryb=3.or.ltryb=1
    kontrah(zk_serwer,.t.,lknaz1,1,.T.,ltryb)
    zks_zk_lad()

  else
    set color to n/w,w/n
  endif	
  if lastkey()=27
    ks_use()
	exit
  endif
  ltryb=1
  lknaz1=zknaz1
  k_w=2
  k_k=0
  vksiega=.t.

  k_dop_tlo()
  k_say()
  dokksiega()
  if (lastkey()=27.and..not.pautomat).or.zksdok_end
    ks_use()
	exit
  endif
*  buf_use()
  set color to  
  @ 0,0 say space(80)
  lpoz=ksedit_menu(0,0,lpoz)
  do case
    case lastkey()=27
	  ks_use()
	  exit
    case lpoz=1
	  zap_ksdok(.f.)
	  exit
    case lpoz=2
	  zap_ksdok(.f.)	  
      d_zer()	
      ks_zer()
*      tow_zer()
    case lpoz=3
	  zap_ksdok(.f.)	  
      lknaz1=zknaz1
	  ltryb=3	  
    case lpoz=4
	  zap_ksdok(.f.)	  
      ltryb=2
    case lpoz=5
      lknaz1=zknaz1
	  ltryb=3	  
    case lpoz=6
      exit	  	  
  endcase
*  close_all("SH")
enddo
if.not.zkim1
  close_all("SH")
endif  
restore screen from ek
zdtyp=ldtyp
zdgrup=ldgrup
zdndow=ldndow
RETURN 

FUNCTION ZKS_ZK_LAD()
    zksknum=zknum
	zksnaz1=zknaz1
	zksnaz2=zknaz2
	zksmiasto=zkmiasto
	zksulica=zkulica
	zksnip=zknip
RETURN
	


FUNCTION SLOWNIK_KS()
local lcolor:=setcolor(),select:=select(),t[2],q[2],ek
t[1]:="mnaz"
t[2]:="mjm"
q[1]:=""
q[2]:=""
set color to n/w,w/n
set key 5 to 
set key 24 to 
*if lastkey()=18
  save screen to ek
  ks_default(zfirnum)
  if file("magaz.dbf")
    select &kasopis_sel
	if kj_use("magaz",.f.,3)
	  kj_okno(11,37,12," O p i s        zdarzenia                  ",2)
      keyboard chr(205)
      dbedit(13,39,22,77,t,"KS_FU1","",q,"ﬂ",,"ﬂ")
	  restore screen from ek
	  @ 16,12 say zksopis
	  close
	endif
	select &select
  endif
*endif
set key 5 to koncz5()
set key 24 to koncz24()
setcolor(lcolor)
RETURN .T.

FUNCTION KS_FU1()
local last:=lastkey(),lmnaz:=space(32),lrubryka:=space(3)
do case
  case last=27
	return 0
  case last=13
    zksopis=mnaz
	zksrubryka=val(mjm)
	return 0
  case chr(last)$"Dd"
    set cursor on
	@ 23,39 get lmnaz when s_kom("Nowy opis")
	@ 23,74 get lrubryka
	read
	if.not.lastkey()=27
      if kj_append(3)
	    replace mnaz with lmnaz
		replace mjm with lrubryka
        unlock
	  endif	
	endif
	set cursor off
    keyboard chr(205)
	return 2
  case chr(last)$"Pp"
    set cursor on
	lmnaz=mnaz
	lrubryka=mjm
	@ 23,39 get lmnaz when s_kom("Nowy opis")
	@ 23,74 get lrubryka
	read
	if.not.lastkey()=27
      if reclock(5)      
	    replace mnaz with lmnaz
        replace mjm with lrubryka
		unlock
	  endif	
	endif
	set cursor off	
    keyboard chr(205)
	return 2	
  case chr(last)$"Kk"
	lmnaz=mnaz
	@ 23,46 say lmnaz 
	if kj_gkom(12,"","Usun•Ü ? ","",.t.,5) 
      if reclock(5)      
	    delete
        unlock
	  endif	
	endif
	set cursor off	
    keyboard chr(205)
	return 2		

endcase
s_kom("Dopisz   Popraw   Kasuj   [Enter]-zatwierd´ wyb¢r    [Esc]-zrezygnuj")
RETURN 1

******
FUNCTION DOKKSIEGA()
local ltcen:=0
ltnaz:=space(32)
ksiega_tlo() 
if.not.ksiega_get()
*  ltcen=ztcen
*  if ztcen<0
*    ztcen=-1*ztcen
*  endif	
*  if buf_use()
*    zap
*	pack
*	append blank
*	replace tnaz with ztnaz, til with 1, tcen with ztcen
*	close
*  endif
*  ztcen=ltcen
*else
  zksdok_end=.t.
else
  zksdok_end=.f.
endif
RETURN







FUNCTION KSIEGA_TLO()
local ltyt:="               *    D O K U M E N T    *                                        "
local lks_kwoty:="NETTO"
if.not.zksnetto
  lks_kwoty:="BRUTTO"
endif
znet_brut="NETTO"
kj_okno(11,0,13,ltyt,7)
set color to 
@ 12,2 say "                                          ≥ Stawka                     VAT     "
@ 13,2 say "                                          ≥ ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ  "
@ 14,2 say "Data .....                                ≥                                  "
@ 15,2 say "Numer ....                                ≥                                  "
@ 16,2 say "Opis .....                                ≥                                  "
@ 17,2 say "Rubryka ..                                ≥                                  "
@ 18,2 say "Odliczenie                                ≥                                  "
@ 19,2 say "Zapis ....                                ≥                                  "
@ 20,2 say "Kwoty ....                                ≥                                  "
if zks_zwolniona
  @ 21,2 say "Dotyczy sp.                               ≥      ƒƒƒƒƒƒƒƒƒƒƒƒ  ƒƒƒƒƒƒƒƒƒƒƒƒ  "
else
  @ 21,2 say "                                          ≥      ƒƒƒƒƒƒƒƒƒƒƒƒ  ƒƒƒƒƒƒƒƒƒƒƒƒ  "
endif
@ 22,2 say "                                           Razem:                            "
@ 23,2 say "                                                                             "
@ 14,46 say zvat_a picture "99"
@ 15,46 say zvat_b picture "99"
@ 16,46 say zvat_c picture "99"
@ 17,46 say zvat_d picture "99"
@ 18,46 say zvat_e picture "99"
@ 19,46 say zvat_f picture "99"
@ 20,46 say "zw."
@ 12,56 say lks_kwoty
RETURN

FUNCTION KSIEGA_SAY(ptryb)
ksdok_licz()
@ 14,12 say zksdatdok 
@ 15,12 say zksndok 
@ 16,12 say zksopis 
@ 17,14 say zksrubryka picture "99" 
@ 17,18 say ks_rubnaz()

if zkspodlega
  @ 18,14 say "  Podlega rozliczeniu VAT     "
else
  @ 18,14 say "  Nie podlega rozliczeniu VAT "
endif
do case
  case zkszapis="A"
    @ 19,14 say "  Ksi©ga + Rejestry  VAT     "
  case zkszapis="B"
    @ 19,14 say "  Tylko  Ksi©ga              "
  case zkszapis="C"
    @ 19,14 say "  Tylko  Rejestry  VAT       "
endcase
do case
  case zks_zwolniona.and..not.zksrubryka=7.and..not.zksrubryka=8
    do case
      case zksdotycz="A"
        @ 21,2 say "Dotyczy sp.   Opodatkowanej podatkiem VAT"
      case zksdotycz="B"
        @ 21,2 say "Dotyczy sp.   Opodatkowanej i zwolnionej "
      case zksdotycz="C"
        @ 21,2 say "Dotyczy sp.   Tylko zwolnionej z pod. VAT"
    endcase  
  case zryczalt_ks.and.(zksrubryka=7.or.zksrubryka=8)
    @ 21,2 say "St.ryczaàtu                             "
	@ 21,14 say zksryczalt picture "99.99"
  otherwise
    @ 21,2 say "                                        "
endcase
do case
  case ptryb=1
    if zksnetto
      @ 12,56 say "NETTO     "
	  @ 20,14 say "  Prezentacja  NETTO "
      @ 22,51 say zksnet_all picture "999999999.99" 
    else
      @ 12,56 say "BRUTTO    "
	  @ 20,14 say "  Prezentacja  BRUTTO"
      @ 22,51 say zksbrut_all picture "999999999.99" 
    endif
    if zkspodlega.or.zksrubryka=10
      @ 14,51 say zks_a picture "999999999.99" 
      @ 15,51 say zks_b picture "999999999.99" 
      @ 16,51 say zks_c picture "999999999.99" 
	  @ 17,51 say zks_d picture "999999999.99" 
	  @ 18,51 say zks_e picture "999999999.99" 
	  @ 19,51 say zks_f picture "999999999.99" 
      @ 20,51 say zks_z picture "999999999.99" 
	  
      @ 14,66 say zksvat_a picture "999999999.99" 
	  @ 15,66 say zksvat_b picture "999999999.99" 
      @ 16,66 say zksvat_c picture "999999999.99" 
	  @ 17,66 say zksvat_d picture "999999999.99" 
	  @ 18,66 say zksvat_e picture "999999999.99" 
	  @ 19,66 say zksvat_f picture "999999999.99" 
      @ 20,66 say zksvat_z picture "999999999.99" 
    else
      @ 12,44 say "≥                                  "
      @ 13,44 say "≥ ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ  "
      @ 14,44 say "≥                                  "
      @ 15,44 say "≥                                  "
      @ 16,44 say "≥  Dokument nie uwzgl©dnia stawek  "
      @ 17,44 say "≥          podatku  VAT            "
      @ 18,44 say "≥                                  "
      @ 19,44 say "≥                                  "
      @ 20,2 say "                                          ≥                                  "
      @ 21,44 say "≥      ƒƒƒƒƒƒƒƒƒƒƒƒ  ƒƒƒƒƒƒƒƒƒƒƒƒ  "
    endif	  
  case ptryb=2  &&prezentacja w odwrotne konwencji NETTO - BRUTTO
    if zksnetto
      @ 12,56 say "BRUTTO    "
	  @ 20,14 say "  Prezentacja  BRUTTO"
      @ 22,51 say zksbrut_all picture "999999999.99" 
      if zkspodlega.or.zksrubryka=10
        @ 14,51 say zks_a+zksvat_a picture "999999999.99" 
        @ 15,51 say zks_b+zksvat_b picture "999999999.99" 
        @ 16,51 say zks_c+zksvat_c picture "999999999.99" 
	    @ 17,51 say zks_d+zksvat_d picture "999999999.99" 
	    @ 18,51 say zks_e+zksvat_e picture "999999999.99" 
	    @ 19,51 say zks_f+zksvat_f picture "999999999.99" 
        @ 20,51 say zks_z+zksvat_z picture "999999999.99" 
	  
        @ 14,66 say zksvat_a picture "999999999.99" 
	    @ 15,66 say zksvat_b picture "999999999.99" 
        @ 16,66 say zksvat_c picture "999999999.99" 
	    @ 17,66 say zksvat_d picture "999999999.99" 
	    @ 18,66 say zksvat_e picture "999999999.99" 
	    @ 19,66 say zksvat_f picture "999999999.99" 
        @ 20,66 say zksvat_z picture "999999999.99" 
      endif
    else
      @ 12,56 say "NETTO    "
	  @ 20,14 say "  Prezentacja  NETTO "
      @ 22,51 say zksnet_all picture "999999999.99" 	
      if zkspodlega.or.zksrubryka=10
        @ 14,51 say zks_a-zksvat_a picture "999999999.99" 
        @ 15,51 say zks_b-zksvat_b picture "999999999.99" 
        @ 16,51 say zks_c-zksvat_c picture "999999999.99" 
	    @ 17,51 say zks_d-zksvat_d picture "999999999.99" 
	    @ 18,51 say zks_e-zksvat_e picture "999999999.99" 
	    @ 19,51 say zks_f-zksvat_f picture "999999999.99" 
        @ 20,51 say zks_z-zksvat_z picture "999999999.99" 	  
	  
        @ 14,66 say zksvat_a picture "999999999.99" 
	    @ 15,66 say zksvat_b picture "999999999.99" 
        @ 16,66 say zksvat_c picture "999999999.99" 
	    @ 17,66 say zksvat_d picture "999999999.99" 
	    @ 18,66 say zksvat_e picture "999999999.99" 
	    @ 19,66 say zksvat_f picture "999999999.99" 
        @ 20,66 say zksvat_z picture "999999999.99" 
      endif
    endif
    if .not.(zkspodlega.or.zksrubryka=10)
      @ 12,44 say "≥                                  "
      @ 13,44 say "≥ ƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒƒ  "
      @ 14,44 say "≥                                  "
      @ 15,44 say "≥                                  "
      @ 16,44 say "≥  Dokument nie uwzgl©dnia stawek  "
      @ 17,44 say "≥          podatku  VAT            "
      @ 18,44 say "≥                                  "
      @ 19,44 say "≥                                  "
      @ 20,2 say "                                          ≥                                  "
      @ 21,44 say "≥      ƒƒƒƒƒƒƒƒƒƒƒƒ  ƒƒƒƒƒƒƒƒƒƒƒƒ  "
    endif	    
endcase  
  
    @ 22,66 say zksvat_all picture "999999999.99" 
if zksexport.and.(zksrubryka=7.or.zksrubryka=8)
  exportdok_get(.f.)
endif
RETURN


FUNCTION KS_RUBNAZ()
local lnazwa:=""
do case
  case zksrubryka=7
    lnazwa="WartoòÜ sprzedanych tow.  "
  case zksrubryka=8
    lnazwa="Pozostaàe przychody       "
  case zksrubryka=10
    lnazwa="Zakup towar¢w handlowychi "
  case zksrubryka=11
    lnazwa="Koszty uboczne zakupu     "
  case zksrubryka=12
    lnazwa="Koszty reprezentacji i rek"
  case zksrubryka=13
    lnazwa="Wynagrodzenia w got¢wce   "
  case zksrubryka=14
    lnazwa="Pozostaàe wydatki         "
  case zksrubryka=18
    lnazwa="órodki trwaàe             "
endcase
RETURN lnazwa




FUNCTION KSIEGA_GET(pdopisz)
local lcolor:=setcolor(),las,las1,lget:=.t.
local lkonto1:=substr(zkkonto,1,30),lkonto2:=substr(zkkonto,31,30)
local lkonto3:=substr(zkkonto,61,30),ldzien:=day(zksdatdok),lksdatdok
public vrow:=k_w+2
*set confirm off
set key 5 to koncz5()
set key 24 to koncz24()
set color to	
set cursor on
if zksrubryka=0
  zksrubryka =7
endif
do while.t.
  set cursor on
  do case
    case vrow=k_w+2
      if zwydziel_miesiac.and.zks_miesiac>0
	    @ 14,12 get ldzien picture "99" range 1,31  when s_kom("Wpisz dzie‰ wystawienia dokumentu")
	  else
	    @ 14,12 get zksdatdok when s_kom("Wpisz dat© wystawienia dokumentu")
	  endif


	case vrow=k_w+3  
      @ 15,12 get zksndok when s_kom("Wpisz numer dokumentu")
	case vrow=k_w+4  
      @ 16,12 get zksopis when s_kom("Wpisz opis zdarzenia gospodarczego.   PgUp - sàownik")
    case vrow=k_w+5	  
      @ 17,14 get zksrubryka picture "99" valid rub_dobra()  when s_kom("Wpisz odpowiedni numer rubryki w Ksi©dzie P. i R.   PgUp - sàownik") 
	case vrow=k_w+6  
      if.not.zksrubryka=13.and..not.zksrubryka=7
	    set cursor on
	    @ 18,14 get zkspodlega  when s_kom(".T. - dokument podlega rozliczeniu VAT  .F. - nie podlega  PgUp-sàownik")
      endif
	case vrow=k_w+7  
      if zkspodlega
	    @ 19,14 get zkszapis picture "!" valid ks_dobre()  when s_kom("A - Ksi©ga+Rejestry VAT   B - tylko Ksi©ga    C - tylko Rejestry VAT  PgUp-sàownik")
	  endif	
	case vrow=k_w+8  
      if zkspodlega.or.zksrubryka=10
	    @ 20,14 get zksnetto when s_kom(".T. - dokument w cenach NETTO    .F. - dokument w cenach BRUTTO   PgUp-sàownik")
	  endif	
	case vrow=k_w+9  
	  if zryczalt_ks.and.(zksrubryka=7.or.zksrubryka=8)
	    rycz_stawki() 
	  else
	    if zks_zwolniona.and..not.(zksrubryka=7.or.zksrubryka=8)
           @ 21,14 get zksdotycz picture "!" valid ks1_dobre()  when s_kom("Dotyczy sprzedaæy: A-opodatkowanej]   B-opodatk. i zwolnionej   C-zwolnionej")		
		endif
	  endif	 

  endcase
  read
  tone(1000,0.5)
	  do case
	    case zksrubryka=13
		  zkspodlega=.f.
		case zksrubryka=7
		  zkspodlega=.t. 
	  endcase
  if.not.zkspodlega   
    zkszapis="B"
    if zksrubryka=10
	  zksnetto=.t.
	endif
  endif
  *
  if zwydziel_miesiac.and.zks_miesiac>0
	    lmies=zks_miesiac
	    lrok=zrok
	    zksdatdok=kj_data(ldzien,lmies,lrok)	    
  endif		
  *
  ksiega_say(1)
  do case
	case lastkey()=18 .and. vrow=k_w+4
	  slownik_ks()
	  set cursor on
  	  vrow=vrow+1
    case lastkey()=18 .and. vrow=k_w+5
	  ks_rubryka()
   	  if (zksrubryka=7.or.zksrubryka=8).and.zexport_ks
	    if kj_gkom(4," Wybor dokumentu ","Czy jest to faktura eksportowa ?","",.t.,5)
	      exportdok_get(.t.)
		  if.not.lastkey()=27
		    zksexport=.t.
		  endif
		  *vrow=k_w+11	  
		  exit
	    else
		  zksexport=.f.
		  vrow=vrow+1	  
		endif
		set cursor on
	  else
	    vrow=vrow+1	  
	  endif	
    case lastkey()=18 .and. vrow=k_w+6
	  ks_podlega()
   	  vrow=vrow+1	  	  
    case lastkey()=18 .and. vrow=k_w+7
	  ks_zapis()
   	  vrow=vrow+1	  	  	  
    case lastkey()=18 .and. vrow=k_w+8
	  ks_kwoty()
   	  vrow=vrow+1	  	  	  	  
    case lastkey()=18 .and. vrow=k_w+9 .and. zks_zwolniona
	  ks_dotyczy()
   	  vrow=vrow+1	  	  	  
	case (vrow=k_w+5.and.(zksrubryka=7.or.zksrubryka=8)).and.zexport_ks
	  if kj_gkom(4," Wybor dokumentu ","Czy jest to faktura eksportowa ?","",.t.,5)
	    exportdok_get(.t.)
		if.not.lastkey()=27
		  zksexport=.t.
		endif
		*vrow=k_w+11
		exit
	  else
	    zksexport=.f.
	    vrow=vrow+1	  
	  endif

	case vrow=k_w+10
	  net_get()
	  vrow=vrow+1
    case vrow=k_w+11
	  if( zkspodlega.or.(zksrubryka=10.and.zutarg_ks)).and..not.zksrubryka=13
	    vat_get()
	  endif	
	  if zksrubryka=13
	    zksvat_a=0
		zksvat_b=0
		zksvat_c=0
		zksvat_d=0
		zksvat_e=0
		zksvat_f=0
		zksvat_z=0
	  endif
	  vrow=vrow+1	  
	case vrow>=k_w+12
		exit  
	case lastkey()=27
	  if kj_gkom(12," Uwaga! ","PrzerwaÜ zapis dokumentu ?","",.t.,5)
	    lget=.f.
		exit  
	  endif		  

	case lastkey()=3.and.zkoncz5.and.(zksrubryka=7.or.zksrubryka=13).and.vrow=k_w+6    &&nastepna	
	  vrow=vrow-1

	case lastkey()=3.and.zkoncz24.and.(zksrubryka=7.or.zksrubryka=13).and.vrow=k_w+6    &&nastepna	
	  vrow=vrow+1

    case lastkey()=3.and.zkoncz5.and..not.zkspodlega.and.vrow=k_w+7     
      vrow=vrow-1

    case lastkey()=3.and.zkoncz24.and..not.zkspodlega.and.vrow=k_w+7     
      vrow=vrow+1

    case lastkey()=13          &&nastepna	
	  vrow=vrow+1
      if ((zksrubryka=7.or.zksrubryka=13).and.vrow=k_w+6)  .or.  (.not.zkspodlega.and.vrow=k_w+7)
	    vrow=vrow+1
	  endif
  endcase
  ksiega_say(1)
enddo
set cursor off
setcolor(lcolor)
set key 24 to
set key 5 to
*set confirm on
RETURN lget


FUNCTION KS_RUBRYKA()
local ltnaz[8],ltlit[8],ltopis[8],lbelka:="",lpoz:=1,ek
local ltytul:="  Wybierz odpowiedni• rubryk© Ksi©gi Przychod¢w i Rozchod¢w     "
ltnaz[1]=" A:  WartoòÜ sprzedanych towar¢w i usàug ....... [ 7]"
ltnaz[2]=" B:  Pozostaàe przychody ........................[ 8]"
ltnaz[3]=" C:  Zakup towar¢w handlowychi materiaà¢ ........[10]"
ltnaz[4]=" D:  Koszty uboczne zakupu ......................[11]"
ltnaz[5]=" E:  Koszty reprezentacji i reklamy .............[12]"
ltnaz[6]=" F:  Wynagrodzenia w got¢wce i w naturze ........[13]"
ltnaz[7]=" G:  Pozostaàe wydatki ..........................[14]"
ltnaz[8]=" H:  órodki trwaàe ..............................[18]"
ltlit[1]=" A                                                   "
ltlit[2]=" B                                                   "
ltlit[3]=" C                                                   "
ltlit[4]=" D                                                   "
ltlit[5]=" E                                                   "
ltlit[6]=" F                                                   "
ltlit[7]=" G                                                   "
ltlit[8]=" H                                                   "
ltopis[1]="  WartoòÜ sprzedanych towar¢w i usàug ....... rubryka [ 7]"
ltopis[2]="  Pozostaàe przychody ........................rubryka   [ 8]"
ltopis[3]="  Zakup towar¢w handlowychi materiaà¢ ........rubryka   [10]"
ltopis[4]="  Koszty uboczne zakupu ......................rubryka   [11]"
ltopis[5]="  Koszty reprezentacji i reklamy .............rubryka   [12]"
ltopis[6]="  Wynagrodzenia w got¢wce i w naturze ........rubryka   [13]"
ltopis[7]="  Pozostaàe wydatki ..........................rubryka   [14]"
ltopis[8]="  órodki trwaàe                          "
save screen to ek
g_tlo()
set key 5 to
set key 24 to
*kj_okno(5,10,10,ltytul,2)
  lpoz=men_pion(7,7,8,ltytul,ltnaz,ltlit,ltopis,lpoz)
do case
  case lpoz=1
    zksrubryka=7
  case lpoz=2
    zksrubryka=8
  case lpoz=3
    zksrubryka=10
  case lpoz=4
    zksrubryka=11
  case lpoz=5
    zksrubryka=12
  case lpoz=6
    zksrubryka=13
  case lpoz=7
    zksrubryka=14
  case lpoz=8
    zksrubryka=18						
endcase
set key 5 to koncz5()
set key 24 to koncz24()
restore screen from ek
RETURN

FUNCTION KS_PODLEGA()
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=1,ek
local ltytul:=" Zatwierd´                       "
ltnaz[1]=" Podlega rozliczeniu VAT     "
ltnaz[2]=" Nie podlega rozliczeniu VAT "
ltlit[1]=" P"
ltlit[2]=" N" 
ltopis[1]=" VAT wykazany w dokumencie podlega odliczeniu"
ltopis[2]=" Dokument nie upowaænia do odliczenia podatku VAT"
save screen to ek
*g_tlo()
set key 5 to
set key 24 to
  lpoz=men_pion(18,15,2,ltytul,ltnaz,ltlit,ltopis,lpoz)
do case
  case lpoz=1
    zkspodlega=.t.
  case lpoz=2
    zkspodlega=.f.
endcase
set key 5 to koncz5()
set key 24 to koncz24()
restore screen from ek
RETURN


FUNCTION KS_DOBRE()
if zkszapis$"ABC"
  return .t.
endif
RETURN .F.

FUNCTION KS1_DOBRE()
if zksdotycz$"ABC"
  return .t.
endif
RETURN .F.

FUNCTION RUB_DOBRA()
if zksrubryka=7.or.zksrubryka=8.or.zksrubryka=10.or.zksrubryka=11.or.zksrubryka=12.or.zksrubryka=13.or.zksrubryka=14.or.zksrubryka=18.or.lastkey()=18
  return .t.
endif
RETURN .F.


FUNCTION KS_ZAPIS()
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=1,ek
local ltytul:=" Zatwierd´                      "
ltnaz[1]=" Ksi©ga + Rejestry  VAT     "
ltnaz[2]=" Tylko  Ksi©ga              "
ltnaz[3]=" Tylko  Rejestry  VAT       "
ltlit[1]=" K"
ltlit[2]=" T" 
ltlit[3]="        R"
ltopis[1]=" Zapisz dokument do Ksi©gi P. i R. oraz do rejestr¢w VAT"
ltopis[2]=" Zapisz dokument tylko do Ksi©gi Przychod¢w i Rozchod¢w"
ltopis[3]=" Zapisz dokument tylko do Rejestr¢w VAT"
save screen to ek
*g_tlo()
set key 5 to
set key 24 to
  lpoz=men_pion(18,15,3,ltytul,ltnaz,ltlit,ltopis,lpoz)
do case
  case lpoz=1
    zkszapis="A"
  case lpoz=2
    zkszapis="B"
  case lpoz=3
    zkszapis="C"	
endcase
set key 5 to koncz5()
set key 24 to koncz24()
restore screen from ek
RETURN

FUNCTION KS_DOTYCZY()
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=1,ek
local ltytul:=" Dotyczy sprzedaæy              "
ltnaz[1]="  Opodatkowanej             "
ltnaz[2]="  Opodatkowanej i zwolnionej"
ltnaz[3]="  Tylko  zwolnionej         "
ltlit[1]="  O"
ltlit[2]="   p" 
ltlit[3]="  T"
ltopis[1]=" Zakup dotyczy wyà•cznie sprzedaæy opodatkowanej podatkiem VAT"
ltopis[2]=" Zakup dotyczy sprzedaæy opodatkowanej podatkiem VAT i zwolnionej"
ltopis[3]=" Zakup dotyczy wyà•cznie sprzedaæy zwolnionej z podatku VAT"
save screen to ek
*g_tlo()
set key 5 to
set key 24 to
  lpoz=men_pion(18,18,3,ltytul,ltnaz,ltlit,ltopis,lpoz)
do case
  case lpoz=1
    zksdotycz="A"
  case lpoz=2
    zksdotycz="B"
  case lpoz=3
    zksdotycz="C"	
endcase
set key 5 to koncz5()
set key 24 to koncz24()
restore screen from ek
RETURN

FUNCTION KS_ZAPIS1()
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=1,ek
local ltytul:=" Zatwierd´                 "
ltnaz[1]=" Tylko  Ksi©ga              "
ltnaz[2]=" Tylko  Rejestry  VAT       "
ltlit[1]=" T" 
ltlit[2]="        R"
ltopis[1]=" Zapisz dokument tylko do Ksi©gi Przychod¢w i Rozchod¢w"
ltopis[2]=" Zapisz dokument tylko do Rejestr¢w VAT"
save screen to ek
*g_tlo()
kj_okno(0,0,8, "  ROZLICZENIE  FAKTURY  EKSPORTOWEJ                                             ",2)	  
set key 5 to
set key 24 to
  lpoz=men_pion(3,25,2,ltytul,ltnaz,ltlit,ltopis,lpoz)
do case
  case lpoz=1
    zkszapis="B"
  case lpoz=2
    zkszapis="C"	
endcase
set key 5 to koncz5()
set key 24 to koncz24()
restore screen from ek
RETURN


FUNCTION KS_KWOTY()
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=1,ek
local ltytul:=" Zatwierd´                       "
ltnaz[1]=" Prezentacja  NETTO "
ltnaz[2]=" Prezentacja  BRUTTO"
ltlit[1]="              N"
ltlit[2]="              B"
ltopis[1]=" Podatek Vat liczony od wartoòci NETTO"
ltopis[2]=" Podatek Vat liczony od wartoòci brutto"
save screen to ek
*g_tlo()
set key 5 to
set key 24 to
  lpoz=men_pion(19,15,2,ltytul,ltnaz,ltlit,ltopis,lpoz)
do case
  case lpoz=1
    zksnetto=.t.
  case lpoz=2
    zksnetto=.f.
endcase
set key 5 to koncz5()
set key 24 to koncz24()
restore screen from ek
RETURN

FUNCTION KS_EXPORT()
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=1,ek
local ltytul:=" Zatwierd´                       "
ltnaz[1]=" Dotyczy exportu    "
ltnaz[2]=" Nie dotyczy exportu"
ltlit[1]="              N"
ltlit[2]="              B"
ltopis[1]=" Podatek Vat liczony od wartoòci NETTO"
ltopis[2]=" Podatek Vat liczony od wartoòci brutto"
save screen to ek
*g_tlo()
set key 5 to
set key 24 to
  lpoz=men_pion(19,15,2,ltytul,ltnaz,ltlit,ltopis,lpoz)
do case
  case lpoz=1
    zksnetto=.t.
  case lpoz=2
    zksnetto=.f.
endcase
set key 5 to koncz5()
set key 24 to koncz24()
restore screen from ek
RETURN

FUNCTION NET_GET()
set key 5 to 
set key 24 to
if zksnetto
  @ 12,56 say "NETTO"
else
  @ 12,56 say "BRUTTO"
endif
if zkspodlega
      @ 14,51 get zks_a picture "999999999.99" when s_kom("Wpisz wartoòÜ netto dla odpowiedniej stawki VAT")
    if zvat00_numer>1
	  @ 15,51 get zks_b picture "999999999.99" when s_kom("Wpisz wartoòÜ netto dla odpowiedniej stawki VAT")
    endif  
	if zvat00_numer>2
	  @ 16,51 get zks_c picture "999999999.99" when s_kom("Wpisz wartoòÜ netto dla odpowiedniej stawki VAT")
	endif
	if zvat00_numer>3  
	  @ 17,51 get zks_d picture "999999999.99" when s_kom("Wpisz wartoòÜ netto dla odpowiedniej stawki VAT")
	endif
	if zvat00_numer>4  
	  @ 18,51 get zks_e picture "999999999.99" when s_kom("Wpisz wartoòÜ netto dla odpowiedniej stawki VAT")
	endif
	if zvat00_numer>5  
	  @ 19,51 get zks_f picture "999999999.99" when s_kom("Wpisz wartoòÜ netto dla odpowiedniej stawki VAT")
    endif
	  @ 20,51 get zks_z picture "999999999.99" when s_kom("Wpisz wartoòÜ netto dla odpowiedniej stawki VAT")
else
  @ 12,56 say "                     "
  @ 22,51 get zks_z picture "999999999.99" when s_kom("Wpisz wartoòÜ brutto ")  
endif
  read
@ 22,51 say zks_a+zks_b+zks_c+zks_d+zks_e+zks_f+zks_z picture "999999999.99" 
if lastkey()=27
  keyboard chr(205)
  vrow=k_w+1
endif  
set key 5 to koncz5()
set key 24 to koncz24()
RETURN

FUNCTION VAT_GET()
set key 5 to 
set key 24 to
if zksnetto
  zksvat_a=kj_round(zks_a*zvat_a/100,2)
  zksvat_b=kj_round(zks_b*zvat_b/100,2)
  zksvat_c=kj_round(zks_c*zvat_c/100,2)
  zksvat_d=kj_round(zks_d*zvat_d/100,2)
  zksvat_e=kj_round(zks_e*zvat_e/100,2)
  zksvat_f=kj_round(zks_f*zvat_f/100,2)
  zksvat_z=kj_round(zks_z*zvat_z/100,2)
else
  zksvat_a=kj_round((zks_a*zvat_a)/(100+zvat_a),2)
  zksvat_b=kj_round((zks_b*zvat_b)/(100+zvat_b),2)
  zksvat_c=kj_round((zks_c*zvat_c)/(100+zvat_c),2)
  zksvat_d=kj_round((zks_d*zvat_d)/(100+zvat_d),2)
  zksvat_e=kj_round((zks_e*zvat_e)/(100+zvat_e),2)
  zksvat_f=kj_round((zks_f*zvat_f)/(100+zvat_f),2)
  zksvat_z=kj_round((zks_z*zvat_z)/(100+zvat_z),2)
endif  
      @ 14,66 get zksvat_a picture "999999999.99" when s_kom("Wpisz wartoòÜ podatku VAT dla odpowiedniej stawki" )
	if zvat00_numer>1  
	  @ 15,66 get zksvat_b picture "999999999.99" when s_kom("Wpisz wartoòÜ podatku VAT dla odpowiedniej stawki" )
    endif
	if zvat00_numer>2  
	  @ 16,66 get zksvat_c picture "999999999.99" when s_kom("Wpisz wartoòÜ podatku VAT dla odpowiedniej stawki" )
	endif
	if zvat00_numer>3  
	  @ 17,66 get zksvat_d picture "999999999.99" when s_kom("Wpisz wartoòÜ podatku VAT dla odpowiedniej stawki" )
	endif
	if zvat00_numer>4  
	  @ 18,66 get zksvat_e picture "999999999.99" when s_kom("Wpisz wartoòÜ podatku VAT dla odpowiedniej stawki" )
	endif
	if zvat00_numer>5  
	  @ 19,66 get zksvat_f picture "999999999.99" when s_kom("Wpisz wartoòÜ podatku VAT dla odpowiedniej stawki" )
    endif
	  @ 20,66 get zksvat_z picture "999999999.99" when s_kom("Wpisz wartoòÜ podatku VAT dla odpowiedniej stawki" )
  read
@ 22,66 say zksvat_a+zksvat_b+zksvat_c+zksvat_d+zksvat_e+zksvat_f+zksvat_z picture "999999999.99" 
if lastkey()=27
  keyboard chr(205)
  vrow=k_w+8
endif  
set key 5 to koncz5()
set key 24 to koncz24()
RETURN

FUNCTION KSEDIT_MENU(pw,pk,ppoz1)
local topis[6],ek
local lbelka:="∞ Zapami©taj ∞ Nowy ∞ A_wz¢r ∞ B_wz¢r ∞ Popraw ∞ Zrezygnuj ∞"
local lliter:="  Z            N      A        B        P        Z          "
topis[1]:="Zapami©taj dokument bez drukowania."
topis[2]:="Zapami©taj bieæ•cy dokument i utw¢rz nowy."
topis[3]:="Zapami©taj i utw¢rz nowy dokument na wz¢r poprzedniego."
topis[4]:="Zapami©taj i utw¢rz nowy dokument na wz¢r poprzedniego bez zmiany kontrahenta."
topis[5]:="Popraw aktualnie redagowany dokument."
topis[6]:="Anuluj ostatni dokument."
ppoz1=menu_poziom(pw,pk,6,lbelka,lliter,topis,ppoz1,.f.,.f.)
RETURN ppoz1

FUNCTION KS_ZER()
zksndow:=space(15)
zksndok:=space(15)
zksdatdow=date()
zksdatdok=date()
zkstermin=ctod("")
zksniedop=0
zkssposzap="G"
zksakwizyt=0
zksdatsp=date()
zksdatzal=date()
zksdatsad=date()
zksdatgran=date()
zksster=space(3)
zkswalut=space(3)
zkskurs=1
zksanul=.f.
zksopis1=space(50)
zksopis2=space(50)
zksopis3=space(50)
zksopis4=space(50)
zksopis5=space(50)
zksopis6=space(50)
zksuwag=space(30)
zksopz=0
zksknum=0
zksnaz1=space(30)
zksnaz2=space(30)
zksmiasto=space(30)
zksulica=space(30)
zksnip=space(13)
zksopis=space(30)
zksrubryka=0
zkspodlega=.t.
zkszapis="A"
zksdotycz="A"
zksnetto=.t.
zksryczalt=0
zksexport=.f.
zksdekret=space(10)
zks_a=0
zks_b=0
zks_c=0
zks_d=0
zks_e=0
zks_f=0
zks_z=0
zksvat_a=0
zksvat_b=0
zksvat_c=0
zksvat_d=0
zksvat_e=0
zksvat_f=0
zksvat_z=0
zkssadnum:=space(30)
zksnbpnum:=space(30)
zkswaluta:=space(10)
zksprzelicz:=1
zks_kwoty="NETTO"
zksnet_all=0
zksvat_all=0
zksbrut_all=0
kssum_zer()
RETURN


FUNCTION ZAP_KSDOK()
local lkspoz:=0
fwar=dbfilter()
ks_use()
  if kj_append(3)
    ks_replac()  
    unlock
  endif  
*

*
RETURN

FUNCTION KS_USE()
ks_default(zfirnum)
select &ks_sel
if.not.used()
  if kj_use("ksiega",.f.,3)
    set index to ksiega
  else	
    return .f.
  endif
endif
RETURN .t.

FUNCTION KSPIT5_USE()
local lpit5:=""
ks_default(zfirnum)
select &kspit5_sel
do case
  case zwspolnik=0
    lpit5="pit5"
  case zwspolnik=1
    lpit5="pit5_01"	
  case zwspolnik=2
    lpit5="pit5_02"	
  case zwspolnik=3
    lpit5="pit5_03"	
  case zwspolnik=4
    lpit5="pit5_04"	
  case zwspolnik=5
    lpit5="pit5_05"					
endcase

if.not.used()
  if.not.kj_use(lpit5,.f.,3)
    return .f.
  endif
endif
RETURN .t.



FUNCTION KS_REPLAC()
replace ksndow with zksndow,ksndok with zksndok,ksdatdow with zksdatdow
replace ksdatdok with zksdatdok,kstermin with zkstermin,ksniedop with zksniedop
replace kssposzap with zkssposzap,ksakwizyt with zksakwizyt,ksdatsp with zksdatsp
replace ksdatzal with zksdatzal,ksdatsad with zksdatsad,ksdatgran with zksdatgran
replace ksster with zksster,kswalut with zkswalut,kskurs with zkskurs
replace ksanul with zksanul,ksopis1 with zksopis1,ksopis2 with zksopis2
replace ksopis3 with zksopis3,ksopis4 with zksopis4,ksopis5 with zksopis5
*replace ksopis6 with zksopis6,ksuwag with zksuwag,kspoz with zkspoz
replace ksopis6 with zksopis6,ksuwag with zksuwag
replace ksknum with zksknum,ksnaz1 with zksnaz1,ksnaz2 with zksnaz2,ksmiasto with zksmiasto
replace ksulica with zksulica,ksnip with zksnip,ksopis with zksopis
replace ksrubryka with zksrubryka,kspodlega with zkspodlega
replace kszapis with zkszapis,ksnetto with zksnetto,ksryczalt with zksryczalt
replace ksexport with zksexport,ksdekret with zksdekret,ksdotycz with zksdotycz
replace kssadnum with zkssadnum,ksnbpnum with zksnbpnum,kswaluta with zkswaluta
replace ksprzelicz with zksprzelicz
if.not.zksexport
  replace ks_a with zks_a,ks_b with zks_b,ks_c with zks_c,ks_d with zks_d
  replace ks_e with zks_e,ks_f with zks_f,ks_z with zks_z
  replace ksvat_a with zksvat_a,ksvat_b with zksvat_b,ksvat_c with zksvat_c
  replace ksvat_d with zksvat_d,ksvat_e with zksvat_e,ksvat_f with zksvat_f
  replace ksvat_z with zksvat_z
else
  if zvat00_znak="A"
    replace ks_b with zks_a,ksvat_b with zksvat_a
  endif
  if zvat00_znak="B"
    replace ks_c with zks_b,ksvat_c with zksvat_b
  endif
  if zvat00_znak="C"
    replace ks_d with zks_c,ksvat_d with zksvat_c
  endif
  if zvat00_znak="D"
    replace ks_e with zks_d,ksvat_e with zksvat_d
  endif
  if zvat00_znak="E"
    replace ks_f with zks_e,ksvat_f with zksvat_e
  endif
  if zvat00_znak="F"
    replace ks_z with zks_f,ksvat_z with zksvat_f					
  endif	
endif  
RETURN

FUNCTION KS_LAD()
zksndow=ksndow
zksndok=ksndok
zksdatdow=ksdatdow
zksdatdok=ksdatdok
zkstermin=kstermin
zksniedop=ksniedop
zkssposzap=kssposzap
zksakwizyt=ksakwizyt
zksdatsp=ksdatsp
zksdatzal=ksdatzal
zksdatsad=ksdatsad
zksdatgran=ksdatgran
zksster=ksster
zkswalut=kswalut
zkskurs=kskurs
zksanul=ksanul
zksopis1=ksopis1
zksopis2=ksopis2
zksopis3=ksopis3
zksopis4=ksopis4
zksopis5=ksopis5
zksopis6=ksopis6
zksuwag=ksuwag
zkspoz=kspoz
zksknum=ksknum
zksnaz1=ksnaz1
zksnaz2=ksnaz2
zksmiasto=ksmiasto
zksulica=ksulica
zksnip=ksnip
zksopis=ksopis
zksrubryka=ksrubryka
zkspodlega=kspodlega
zkszapis=kszapis
zksdotycz=ksdotycz
zksnetto=ksnetto
zksryczalt=ksryczalt
zksexport=ksexport
zksdekret=ksdekret
zks_a=ks_a
zks_b=ks_b
zks_c=ks_c
zks_d=ks_d
zks_e=ks_e
zks_f=ks_f
zks_z=ks_z
zksvat_a=ksvat_a
zksvat_b=ksvat_b
zksvat_c=ksvat_c
zksvat_d=ksvat_d
zksvat_e=ksvat_e
zksvat_f=ksvat_f
zksvat_z=ksvat_z
zkssadnum=kssadnum
zksnbpnum=ksnbpnum
zkswaluta=kswaluta
zksprzelicz=ksprzelicz
ksdok_licz()
zdewiz_kwot=zksnet_all*zksprzelicz/zkskurs
RETURN


*********************************DOK_OLD
FUNCTION DOK_KSOLD(pks_serwer)
local ek,lsukces,select:=select(),t[6],q[6],to[6],qo[6],ltyt:=space(80)


public enter:=.f.,fwar:=".t."
public f_nip:=space(15),f_naz1:=space(30),f_naz2:=space(30),f_miasto:=space(30)
public f_ulica:=space(30),f_odebral:=space(30)
public vmenu_end:=.f.
public dwar:=".t."
k_w:=0
k_k:=0
vrow=k_w+2
private d_sciezka:=space(100)
*private siec:=psiec
private k_w:=0,k_k:=0
vksiega=.t.
t[1]:="kspoz"
t[2]:="ksndok"
t[3]:="ksdatdok"
t[4]:="substr(ksnaz1,1,15)"
t[5]:="substr(ksopis,1,15)"
t[6]:="ksrubryka"
q[1]:="L.p."
q[2]:="Numer dokumentu"
q[3]:="Data dok."
q[4]:="Kontrahent"
q[5]:="Opis zdarzenia"
q[6]:="Rubr"
kj_okno(0,0,24,ltyt,10)
kj_okno(0,0,20,ltyt,10)
set color to
@ 0,2 say space(1)+znaz_dok+space(1)
set color to n/w,w/n
*close
if.not.ks_use()
  return
endif
go bottom
if empty(kspoz)
  ks_numpoz()
endif  
if zwydziel_miesiac.and.zks_miesiac>0
  if zdokanul_pokaz=0
    set filter to month(ksdatdok)=zks_miesiac.and.year(ksdatdok)=zrok.and.ksanul=.f.
  else
    set filter to month(ksdatdok)=zks_miesiac.and.year(ksdatdok)=zrok
  endif
  go top
else
  if zdokanul_pokaz=0
    set filter to ksanul=.f.
    go top
  endif
endif
  go top
  go bottom

keyboard chr(205)
dbedit(1,1,19,78,t,"KS_FU","",q,"ﬂ")
close_all("SH")
RETURN

FUNCTION KS_FU(tryb,numer)
local last:=lastkey(),lpoz:=1,ek,ek1,ek2,el3,lcolor:=setcolor(),t[1],select:=select()
local recno:=recno(),lanul:=.not.ksanul,ldrecno,lwplata:=0, ldruk:=1
local lnum:=space(15),lw:=1,kpoz:=1,lkaslicz:=1,ldkordok:="",ldalej:=.t.
local ldtyp:=zdtyp,lplat:=1,lksopis:=ksopis
local ltxt:="_F_iltr    <Enter> - MENU    pods_U_mowanie    <Esc> - rez.  _N_umeracja"  
local lkontrah:=space(200),len1:=len(alltrim(ksnaz1)),len2:=len(alltrim(ksnaz2))
local len3:=len(alltrim(ksmiasto)),len4:=len(alltrim(ksulica))
local latryb:=1, lznak:=" "
lkontrah=stuff(lkontrah,1,len1,alltrim(ksnaz1))
lkontrah=stuff(lkontrah,3+len1,len2,alltrim(ksnaz2))
lkontrah=stuff(lkontrah,6+len1+len2,len3,alltrim(ksmiasto))
lkontrah=stuff(lkontrah,8+len1+len2+len3,len4,alltrim(ksulica))
lkontrah=substr(lkontrah,1,75)
t[1]:="naz_dok"
save screen to ek
ks_lad()
ksdok_licz()
set color to
if substr(ksster,1,1)$"EDT"
  do case 
    case substr(ksster,1,1)="E"
	  @ 0,30 say " Eksport   "
    case substr(ksster,1,1)="D"
	  @ 0,30 say " Dostawa   "	  
    case substr(ksster,1,1)="T"
	  @ 0,30 say " Transakcja "
  endcase
else 
  @ 0,30 say replicate("∞",12)
endif
setcolor(lcolor)
if numer=3
  set color to
  @ 24,0 say "∞∞                                                                            ∞∞"  
  @ 24,3 say lkontrah
  setcolor(lcolor)
else
  do skom with ltxt
endif
if numer=4
  set color to
  @ 24,0 say "∞∞                               ∞∞∞∞∞∞                                       ∞∞"  
  @ 24,3 say ksopis
  setcolor(lcolor)
else
  if.not.numer=3
    do skom with ltxt
  else
    set color to
	@ 24,0 say "∞∞                                                                            ∞∞"  
	@ 24,3 say lkontrah
    setcolor(lcolor)
  endif	
endif
do case
  case chr(last)$"Dd".and.zkim1
    g_tlo()

	nowy_ksiega_dok(.t.,.f.,.f.)
	keyboard chr(205)
	return 2
  case last=13.and.numer=3
		  ztylko_kon=.t.
		  z1_tpopraw=.t.
		  ks_popraw()
		  z1_tpopraw=.f.
		  ztylko_kon=.f.
  case last=13.and.numer=4
    set cursor on
	@ 24,3 get lksopis
    read
	set cursor off
      if reclock(5)      
	    replace ksopis with lksopis
		unlock
	  endif		
	
  case last=13.and..not.numer=3
    ldrecno=recno()
    do while.t.
	  lpoz=enter_ks_menu(lpoz)
	  if lastkey()=27
	    *exit
		keyboard chr(205)
		return 2
	  endif
	  do case
	    case lpoz=1
		  ks_prezent(1)      && prezentacja dokumentu 
	    case lpoz=2
		    if kj_gkom(12,"","Usun•Ü wskazany dokument ? ","",.t.,5) 
              if reclock(5)      
	            delete
		        unlock
	          endif				  
			endif		   
		case lpoz=3
		  z1_tpopraw=.t.
		  ks_popraw()
		  z1_tpopraw=.f.
        case lpoz=4
		  latryb=atryb_menu(latryb)
		  do case
		    case latryb=1
			  lznak="E"
		    case latryb=2
			  lznak="D"
		    case latryb=3
			  lznak="T"			  			  
		    case latryb=4
			  lznak=" "			  			  			  
		  endcase
          if reclock(5)      
	        replace ksster with stuff(ksster,1,1,lznak)
		    unlock
	      endif		
	  endcase
	enddo

  case chr(last)$"Nn"
    recno=recno()
	ks_numpoz()
	go recno
	keyboard chr(205)
	return 2
  
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
		locate for substr(alltrim(ksndok),1,k1)=alltrim(lnum)     
        if .not.found()
          kj_tkom(12," Uwaga! ","","Dokument o numerze "+lnum+" nie odnaleziony","",5)    
        endif 
      endif   
     restore screen from ek     
     keyboard chr(205)
     setcolor(lcolor)
     return 2	
   
  case chr(last)$"Ff"
      dwar=".t."
	  fwar=".t."
      dwar_start:=dbfilter()
	  if empty(dwar_start)
	    dwar_start=".t."
	  endif
	  dwar_allstart:=".t."
	  do while.t.
		ks_filtr()
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
    plik="wydruki\rejvat.txt"
    set printer to &plik
	set device to printer
	ksbil_rap()
	set device to screen
	save screen to ek3
    edi=edit+" wydruki\rejvat.txt"
    run &edi 
    restore screen from ek3
    set cursor off   
	keyboard chr(205)
	return 2
	
  case last=27 
      return 0
endcase

ks_oknopom()
RETURN 1

FUNCTION KS_OKNOPOM()
local lcolor:=setcolor()
*local ltxt:="_F_iltr    <Enter> - MENU    pods_U_mowanie    <Esc> - REZYGNACJA"  
*do skom with ltxt
set color to 
do case
  case zdtyp$import_gr.or.zdtyp$eksport_gr
    @ 21,1 say "∞                                 ∞∞ W A R T O ó è :                         ∞"
    @ 22,1 say "∞                                 ∞∞     W walucie ..........                ∞"
    @ 23,1 say "∞                                 ∞∞     W zàot¢wkach .......                ∞"
 case .not.zkspodlega
    @ 21,1 say "∞                                 ∞∞                                         ∞"
    @ 22,1 say "∞                                 ∞∞ W A R T O ó è  .........                ∞"
    @ 23,1 say "∞                                 ∞∞                                         ∞"  
otherwise
    @ 21,1 say "∞                                 ∞∞                 NETTO...                ∞"
    @ 22,1 say "∞                                 ∞∞ W A R T O ó è : VAT.....                ∞"
    @ 23,1 say "∞                                 ∞∞                 BRUTTO..                ∞"
endcase

do case
  case zdtyp$import_gr.or.zdtyp$eksport_gr
    @ 22,63 say ztnet_all picture "99999999.99"
    @ 23,63 say ztnet_all*zdkurs picture "99999999.99"  
  case .not.zkspodlega
    @ 22,63 say zksnet_all picture "99999999.99"
otherwise
    @ 21,63 say zksnet_all picture "99999999.99"
    @ 22,63 say zksvat_all picture "99999999.99"
    @ 23,63 say zksbrut_all picture "99999999.99"
endcase
@ 20,1 say replicate(chr(176),78)


@ 21,3 say ks_rubnaz()
do case
  case kszapis="A"
    @ 22,3 say "Ksi©ga + Rejestry  VAT     "
  case kszapis="B"
    @ 22,3 say "Tylko  Ksi©ga              "
  case kszapis="C"
    @ 22,3 say "Tylko  Rejestry  VAT       "
endcase
@ 23,3 say "NIP:"
@ 23,8 say ksnip
if zdtyp$eksport_gr
  @ 20,37 say "Waluta: "+zkswalut
  @ 20,64 say "Kurs" +str(zkskurs) 
endif
if ksanul
  tone(300,0.5)
  set color to w/n*
  @ 22,3 say "Dokument anulowany !              "
  setcolor(lcolor)
endif
setcolor(lcolor)
RETURN nil


**********************************DOK_OLD END

FUNCTION KSDOK_LICZ()
if.not.zksanul
  if zksnetto  
	zksnet_a=zks_a
	zksnet_b=zks_b
	zksnet_c=zks_c
	zksnet_d=zks_d
	zksnet_e=zks_e
	zksnet_f=zks_f
	zksnet_z=zks_z
	zksbrut_a=zksnet_a+zksvat_a
	zksbrut_b=zksnet_b+zksvat_b
	zksbrut_c=zksnet_c+zksvat_c
	zksbrut_d=zksnet_d+zksvat_d
	zksbrut_e=zksnet_e+zksvat_e
	zksbrut_f=zksnet_f+zksvat_f
	zksbrut_z=zksnet_z+zksvat_z
	zksnet_all=zksnet_a+zksnet_b+zksnet_c+zksnet_d+zksnet_e+zksnet_f+zksnet_z
	zksvat_all=zksvat_a+zksvat_b+zksvat_c+zksvat_d+zksvat_e+zksvat_f+zksvat_z	
    zksbrut_all=zksnet_all+zksvat_all
  else
	zksnet_a=zks_a-zksvat_a
	zksnet_b=zks_b-zksvat_b
	zksnet_c=zks_c-zksvat_c
	zksnet_d=zks_d-zksvat_d
	zksnet_e=zks_e-zksvat_e
	zksnet_f=zks_f-zksvat_f
	zksnet_z=zks_z-zksvat_z
	zksbrut_a=zks_a
	zksbrut_b=zks_b
	zksbrut_c=zks_c
	zksbrut_d=zks_d
	zksbrut_e=zks_e
	zksbrut_f=zks_f
	zksbrut_z=zks_z
	zksbrut_all=zks_a+zks_b+zks_c+zks_d+zks_e+zks_f+zks_z
	zksvat_all=zksvat_a+zksvat_b+zksvat_c+zksvat_d+zksvat_e+zksvat_f+zksvat_z	
    zksnet_all=zksbrut_all-zksvat_all  
  endif	
endif
RETURN 

FUNCTION KSRUBR_LICZ()
ziledok_07=0
ziledok_08=0
ziledok_10=0
ziledok_11=0
ziledok_12=0
ziledok_13=0
ziledok_14=0
ziledok_18=0
zksrubr_7=0
zksrubr_8=0
zksrubr_10=0
zksrubr_11=0
zksrubr_12=0
zksrubr_13=0
zksrubr_14=0
zksrubr_18=0
zksvat_7=0
zksvat_8=0
zksvat_10=0
zksvat_11=0
zksvat_12=0
zksvat_13=0
zksvat_14=0
zksvat_18=0
zksrubr_export=0
sumrycz_a=0
sumrycz_b=0
sumrycz_c=0
go top
do while.not.eof()
  ks_lad()
  ksdok_licz()
  do case
    case zksrubryka=7
	  ziledok_07=ziledok_07+1
	  zksrubr_7=zksrubr_7+zksnet_all
      zksvat_7=zksvat_7+zksvat_all
      if zksexport
	    zksrubr_export=zksrubr_export+zksnet_all
	  endif
    case zksrubryka=8
	  ziledok_08=ziledok_08+1
	  zksrubr_8=zksrubr_8+zksnet_all
	  zksvat_8=zksvat_8+zksvat_all
      if zksexport
	    zksrubr_export=zksrubr_export+zksnet_all
	  endif
    case zksrubryka=10
	  ziledok_10=ziledok_10+1
	  zksrubr_10=zksrubr_10+zksnet_all	  	  
	  zksvat_10=zksvat_10+zksvat_all
    case zksrubryka=11
	  ziledok_11=ziledok_11+1
	  zksrubr_11=zksrubr_11+zksnet_all
	  zksvat_11=zksvat_11+zksvat_all	  	  	  
    case zksrubryka=12
	  ziledok_12=ziledok_12+1
	  zksrubr_12=zksrubr_12+zksnet_all	  	  
	  zksvat_12=zksvat_12+zksvat_all
    case zksrubryka=13
	  ziledok_13=ziledok_13+1
	  zksrubr_13=zksrubr_13+zksnet_all	  	  
	  zksvat_13=zksvat_13+zksvat_all
    case zksrubryka=14
	  ziledok_14=ziledok_14+1
	  zksrubr_14=zksrubr_14+zksnet_all	  	  
	  zksvat_14=zksvat_14+zksvat_all
    case zksrubryka=18
	  ziledok_18=ziledok_18+1
	  zksrubr_18=zksrubr_18+zksnet_all	  	  	  	  	  	  
	  zksvat_18=zksvat_18+zksvat_all
  endcase
  if (zksrubryka=7.or.zksrubryka=8).and.zryczalt_ks
    do case
	  case zksryczalt=zksrycz_a
	    sumrycz_a=sumrycz_a+zksnet_all	  	  
	  case zksryczalt=zksrycz_b
	    sumrycz_b=sumrycz_b+zksnet_all	  	  
	  case zksryczalt=zksrycz_c
	    sumrycz_c=sumrycz_c+zksnet_all	  	  				
	endcase
  endif
  skip
enddo
RETURN


FUNCTION ENTER_KS_MENU(ppoz)
local ltnaz[5],ltlit[5],ltopis[5],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Zaprezentuj   "
ltnaz[2]:=" Usu‰          "
ltnaz[3]:=" Popraw        "
ltnaz[4]:=" Nadaj atrybut "
ltlit[1]:=" Z"
ltlit[2]:=" U"
ltlit[3]:=" P"
ltlit[4]:=" N"
ltopis[1]:="Szczeg¢àowa prezentacja wybranego dokumentu"
ltopis[2]:="Bezpowrotnie usuni©cie dokumentu"
ltopis[3]:="Poprawianie dokumentu"
ltopis[4]:="Nadawanie lub zmiana atrybutu dokumentu."
if zksanul
  ltnaz[2]:=" Reanuluj    "
  ltlit[2]:=" R"
  ltopis[2]:="Przywr¢Ü dokument anulowany"
endif
if.not.zanul_up
  ltnaz[2]:="-Anulowanie  "
  ltopis[2]:="Brak uprawnie‰ do anulowania  dokument¢w"
endif
  @ 7,32,14,50 box chr(176)
  lpoz=men_pion(8,33,4,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION ATRYB_MENU(ppoz)
local ltnaz[5],ltlit[5],ltopis[5],lbelka:="",lpoz:=ppoz,ek
save screen to ek
ltnaz[1]:=" Eksport       "
ltnaz[2]:=" Dostawa       "
ltnaz[3]:=" Transakcja    "
ltnaz[4]:=" Usu‰ atrybut  "
ltlit[1]:=" E"
ltlit[2]:=" D"
ltlit[3]:=" T"
ltlit[4]:=" U"
ltopis[1]:="Eksport towar¢w do kraj¢w z poza UE  [EXP]"
ltopis[2]:="Wewn•trzwsp¢lnotowa dostawa towar¢w [WDT]"
ltopis[3]:="Wewn•trzwsp¢lnotowa tarnsakcja tr¢jstronna  [WTT]"
ltopis[4]:="Usuni©cie istniej•cego atrybutu"
  lpoz=men_pion(11,40,4,lbelka,ltnaz,ltlit,ltopis,lpoz)
restore screen from ek
RETURN lpoz

FUNCTION UE_DRUK_MENU(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz,ek
save screen to ek
ltnaz[1]:=" Drukarka "
ltnaz[2]:=" Ekran    "
ltlit[1]:=" D"
ltlit[2]:=" E"
ltopis[1]:="Wydruk na drukarce.  Esc - rezygnacja"
ltopis[2]:="Wydruk na ekranie.  Esc - rezygnacja"
  lpoz=men_pion(11,35,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
restore screen from ek
RETURN lpoz

FUNCTION UERAP_MENU(ppoz)
local ltnaz[4],ltlit[4],ltopis[4],lbelka:="",lpoz:=ppoz,ek
save screen to ek
ltnaz[1]:= " 1.    I Kwartaà  "
ltnaz[2]:= " 2.   II Kwartaà  "
ltnaz[3]:= " 3.  III Kwartaà  "
ltnaz[4]:= " 4.   IV Kwartaà  "
ltlit[1]:= " 1                "
ltlit[2]:= " 2                "
ltlit[3]:= " 3                "
ltlit[4]:= " 4                "
ltopis[1]:="Za mies•ce: Stycze‰, Luty i Marzec "
ltopis[2]:="Za mies•ce: Kwiecie‰, Maj i Czerwiec"
ltopis[3]:="Za mies•ce: Lipiec, Sierpie‰ i Wrzesie‰"
ltopis[4]:="Za mies•ce: Pa´dziernik, Listopad i Grudzie‰"
  lpoz=men_pion(6,54,4,lbelka,ltnaz,ltlit,ltopis,lpoz)
restore screen from ek
RETURN lpoz


FUNCTION KS_PREZENT(ptryb)
local ek,lknaz1:=zksnaz1,lcolor:=setcolor(),lknum:=zksknum,ltryb:=1
k_w=2
save screen to ek
zknum=zksknum
zknaz1=zksnaz1
zknaz2=zksnaz2
zkmiasto=zksmiasto
zkulica=zksulica
zknip=zksnip
g_tlo()
k_dop_tlo()
k_say()
ksiega_tlo()
if ptryb=1
  s_kom("[F2] - przeà•cznik rodzaju prezentacji : NETTO/BRUTTO")
  do while.t.
    ksiega_say(ltryb)
    inkey(0)
	if lastkey()=-1
	  if ltryb=1
	    ltryb=2
	  else
	    ltryb=1
	  endif
	else
	  exit
	endif
  enddo
  restore screen from ek
else
  ksiega_say(1)
endif  
setcolor(lcolor)
RETURN

FUNCTION KS_POPRAW()
local ek,ltryb:=2,lknaz1:=zksnaz1,select:=select(),lknum:=zksknum
save screen to ek
g_tlo()
set color to
@ 10,2 say "Zatwierd´"
@ 11,8 say " kontrahenta"
*kontrah(zk_serwer,.t.,lknaz1,1,.T.,ltryb)
zknum=zksknum
kontrah(zk_serwer,.t.,"",3,.T.,ltryb)
select &select
zks_zk_lad()
if.not.ztylko_kon
  ks_prezent(0)
  ksiega_get()
endif  
if.not.lastkey()=27
  if reclock(5)
    if.not.zkspodlega
	  zks_a=0
	  zks_b=0
	  zks_c=0
	  zks_d=0
	  zks_e=0
	  zks_f=0
	  zksvat_a=0
	  zksvat_b=0
	  zksvat_c=0
	  zksvat_d=0
	  zksvat_e=0
	  zksvat_f=0
	  zksvat_z=0
	endif
	ks_replac()        
	unlock
  endif	
endif
restore screen from ek
RETURN

FUNCTION KSSUM_ZER()
zksAnet1_sum=0
zksAvat1_sum=0
zksAbr1_sum=0
zksAnet1_a_sum=0
zksAnet1_b_sum=0
zksAnet1_c_sum=0
zksAnet1_d_sum=0
zksAnet1_e_sum=0
zksAnet1_f_sum=0
zksAnet1_z_sum=0
zksAvat1_a_sum=0
zksAvat1_b_sum=0
zksAvat1_c_sum=0
zksAvat1_d_sum=0
zksAvat1_e_sum=0
zksAvat1_f_sum=0
zksAvat1_z_sum=0
zksAbr1_a_sum=0
zksAbr1_b_sum=0
zksAbr1_c_sum=0
zksAbr1_d_sum=0
zksAbr1_e_sum=0
zksAbr1_f_sum=0
zksAbr1_z_sum=0

zksAnet2_sum=0
zksAvat2_sum=0
zksAbr2_sum=0
zksAnet2_a_sum=0
zksAnet2_b_sum=0
zksAnet2_c_sum=0
zksAnet2_d_sum=0
zksAnet2_e_sum=0
zksAnet2_f_sum=0
zksAnet2_z_sum=0
zksAvat2_a_sum=0
zksAvat2_b_sum=0
zksAvat2_c_sum=0
zksAvat2_d_sum=0
zksAvat2_e_sum=0
zksAvat2_f_sum=0
zksAvat2_z_sum=0
zksAbr2_a_sum=0
zksAbr2_b_sum=0
zksAbr2_c_sum=0
zksAbr2_d_sum=0
zksAbr2_e_sum=0
zksAbr2_f_sum=0
zksAbr2_z_sum=0
zksAniepodlega_sum=0
zksAnet_export=0
zksAtrwaly=0
zksAvattrwaly=0

zksBnet1_sum=0
zksBvat1_sum=0
zksBbr1_sum=0
zksBnet1_a_sum=0
zksBnet1_b_sum=0
zksBnet1_c_sum=0
zksBnet1_d_sum=0
zksBnet1_e_sum=0
zksBnet1_f_sum=0
zksBnet1_z_sum=0
zksBvat1_a_sum=0
zksBvat1_b_sum=0
zksBvat1_c_sum=0
zksBvat1_d_sum=0
zksBvat1_e_sum=0
zksBvat1_f_sum=0
zksBvat1_z_sum=0
zksBbr1_a_sum=0
zksBbr1_b_sum=0
zksBbr1_c_sum=0
zksBbr1_d_sum=0
zksBbr1_e_sum=0
zksBbr1_f_sum=0
zksBbr1_z_sum=0

zksBnet2_sum=0
zksBvat2_sum=0
zksBbr2_sum=0
zksBnet2_a_sum=0
zksBnet2_b_sum=0
zksBnet2_c_sum=0
zksBnet2_d_sum=0
zksBnet2_e_sum=0
zksBnet2_f_sum=0
zksBnet2_z_sum=0
zksBvat2_a_sum=0
zksBvat2_b_sum=0
zksBvat2_c_sum=0
zksBvat2_d_sum=0
zksBvat2_e_sum=0
zksBvat2_f_sum=0
zksBvat2_z_sum=0
zksBbr2_a_sum=0
zksBbr2_b_sum=0
zksBbr2_c_sum=0
zksBbr2_d_sum=0
zksBbr2_e_sum=0
zksBbr2_f_sum=0
zksBbr2_z_sum=0
zksBniepodlega_sum=0
zksBnet_export=0
zksBtrwaly=0
zksBvattrwaly=0

zksCnet1_sum=0
zksCvat1_sum=0
zksCbr1_sum=0
zksCnet1_a_sum=0
zksCnet1_b_sum=0
zksCnet1_c_sum=0
zksCnet1_d_sum=0
zksCnet1_e_sum=0
zksCnet1_f_sum=0
zksCnet1_z_sum=0
zksCvat1_a_sum=0
zksCvat1_b_sum=0
zksCvat1_c_sum=0
zksCvat1_d_sum=0
zksCvat1_e_sum=0
zksCvat1_f_sum=0
zksCvat1_z_sum=0
zksCbr1_a_sum=0
zksCbr1_b_sum=0
zksCbr1_c_sum=0
zksCbr1_d_sum=0
zksCbr1_e_sum=0
zksCbr1_f_sum=0
zksCbr1_z_sum=0

zksCnet2_sum=0
zksCvat2_sum=0
zksCbr2_sum=0
zksCnet2_a_sum=0
zksCnet2_b_sum=0
zksCnet2_c_sum=0
zksCnet2_d_sum=0
zksCnet2_e_sum=0
zksCnet2_f_sum=0
zksCnet2_z_sum=0
zksCvat2_a_sum=0
zksCvat2_b_sum=0
zksCvat2_c_sum=0
zksCvat2_d_sum=0
zksCvat2_e_sum=0
zksCvat2_f_sum=0
zksCvat2_z_sum=0
zksCbr2_a_sum=0
zksCbr2_b_sum=0
zksCbr2_c_sum=0
zksCbr2_d_sum=0
zksCbr2_e_sum=0
zksCbr2_f_sum=0
zksCbr2_z_sum=0
zksCniepodlega_sum=0
zksCnet_export=0
zksCtrwaly=0
zksCvattrwaly=0
zw_Anet_trwale=0
zw_Avat_trwale=0
zw_Anet_pozos=0
zw_Avat_pozos=0
zw_Bnet_trwale=0
zw_Bvat_trwale=0
zw_Bnet_pozos=0
zw_Bvat_pozos=0
zw_Cnet_trwale=0
zw_Cvat_trwale=0
zw_Cnet_pozos=0
zw_Cvat_pozos=0
RETURN

FUNCTION KSSUM_LICZ()
go top
kssum_zer()
do while.not.eof()
  ks_lad()  
  ksdok_licz()
  if zksrubryka=7.or.zksrubryka=8
    do case
	  case zkszapis="A"
	    zksAnet1_sum=zksAnet1_sum+zksnet_all
        zksAvat1_sum=zksAvat1_sum+zksvat_all
        zksAbr1_sum=zksAbr1_sum+zksbrut_all
        if zksexport
		  zksAnet_export=zksAnet_export+zksnet_all
		endif

		zksAnet1_a_sum=zksAnet1_a_sum+zksnet_a
        zksAnet1_b_sum=zksAnet1_b_sum+zksnet_b
        zksAnet1_c_sum=zksAnet1_c_sum+zksnet_c
        zksAnet1_d_sum=zksAnet1_d_sum+zksnet_d
        zksAnet1_e_sum=zksAnet1_e_sum+zksnet_e
        zksAnet1_f_sum=zksAnet1_f_sum+zksnet_f
        if zkspodlega
          zksAnet1_z_sum=zksAnet1_z_sum+zksnet_z
        else
          zksAniepodlega_sum=zksAniepodlega_sum+zksnet_z
        endif	
        zksAvat1_a_sum=zksAvat1_a_sum+zksvat_a
        zksAvat1_b_sum=zksAvat1_b_sum+zksvat_b
        zksAvat1_c_sum=zksAvat1_c_sum+zksvat_c
        zksAvat1_d_sum=zksAvat1_d_sum+zksvat_d
        zksAvat1_e_sum=zksAvat1_e_sum+zksvat_e
        zksAvat1_f_sum=zksAvat1_f_sum+zksvat_f  
        zksAvat1_z_sum=zksAvat1_z_sum+zksvat_z  
  
        zksAbr1_a_sum=zksAbr1_a_sum+zksbrut_a
        zksAbr1_b_sum=zksAbr1_b_sum+zksbrut_b
        zksAbr1_c_sum=zksAbr1_c_sum+zksbrut_c
        zksAbr1_d_sum=zksAbr1_d_sum+zksbrut_d
        zksAbr1_e_sum=zksAbr1_e_sum+zksbrut_e
        zksAbr1_f_sum=zksAbr1_f_sum+zksbrut_f  
        zksAbr1_z_sum=zksAbr1_z_sum+zksbrut_z    
		
	  case zkszapis="B"
	    zksBnet1_sum=zksBnet1_sum+zksnet_all
        zksBvat1_sum=zksBvat1_sum+zksvat_all
        zksBbr1_sum=zksBbr1_sum+zksbrut_all
         if zksexport
		  zksBnet_export=zksBnet_export+zksnet_all
		endif

        zksBnet1_a_sum=zksBnet1_a_sum+zksnet_a
        zksBnet1_b_sum=zksBnet1_b_sum+zksnet_b
        zksBnet1_c_sum=zksBnet1_c_sum+zksnet_c
        zksBnet1_d_sum=zksBnet1_d_sum+zksnet_d
        zksBnet1_e_sum=zksBnet1_e_sum+zksnet_e
        zksBnet1_f_sum=zksBnet1_f_sum+zksnet_f
        if zkspodlega
          zksBnet1_z_sum=zksBnet1_z_sum+zksnet_z
        else
          zksBniepodlega_sum=zksBniepodlega_sum+zksnet_z
        endif	
        zksBvat1_a_sum=zksBvat1_a_sum+zksvat_a
        zksBvat1_b_sum=zksBvat1_b_sum+zksvat_b
        zksBvat1_c_sum=zksBvat1_c_sum+zksvat_c
        zksBvat1_d_sum=zksBvat1_d_sum+zksvat_d
        zksBvat1_e_sum=zksBvat1_e_sum+zksvat_e
        zksBvat1_f_sum=zksBvat1_f_sum+zksvat_f  
        zksBvat1_z_sum=zksBvat1_z_sum+zksvat_z  
  
        zksBbr1_a_sum=zksBbr1_a_sum+zksbrut_a
        zksBbr1_b_sum=zksBbr1_b_sum+zksbrut_b
        zksBbr1_c_sum=zksBbr1_c_sum+zksbrut_c
        zksBbr1_d_sum=zksBbr1_d_sum+zksbrut_d
        zksBbr1_e_sum=zksBbr1_e_sum+zksbrut_e
        zksBbr1_f_sum=zksBbr1_f_sum+zksbrut_f  
        zksBbr1_z_sum=zksBbr1_z_sum+zksbrut_z    		

	  case zkszapis="C"
	    zksCnet1_sum=zksCnet1_sum+zksnet_all
        zksCvat1_sum=zksCvat1_sum+zksvat_all
        zksCbr1_sum=zksCbr1_sum+zksbrut_all
        if zksexport
		  zksCnet_export=zksCnet_export+zksnet_all
		endif

        zksCnet1_a_sum=zksCnet1_a_sum+zksnet_a
        zksCnet1_b_sum=zksCnet1_b_sum+zksnet_b
        zksCnet1_c_sum=zksCnet1_c_sum+zksnet_c
        zksCnet1_d_sum=zksCnet1_d_sum+zksnet_d
        zksCnet1_e_sum=zksCnet1_e_sum+zksnet_e
        zksCnet1_f_sum=zksCnet1_f_sum+zksnet_f
        if zkspodlega
          zksCnet1_z_sum=zksCnet1_z_sum+zksnet_z
        else
          zksCniepodlega_sum=zksCniepodlega_sum+zksnet_z
        endif	
        zksCvat1_a_sum=zksCvat1_a_sum+zksvat_a
        zksCvat1_b_sum=zksCvat1_b_sum+zksvat_b
        zksCvat1_c_sum=zksCvat1_c_sum+zksvat_c
        zksCvat1_d_sum=zksCvat1_d_sum+zksvat_d
        zksCvat1_e_sum=zksCvat1_e_sum+zksvat_e
        zksCvat1_f_sum=zksCvat1_f_sum+zksvat_f  
        zksCvat1_z_sum=zksCvat1_z_sum+zksvat_z  
  
        zksCbr1_a_sum=zksCbr1_a_sum+zksbrut_a
        zksCbr1_b_sum=zksCbr1_b_sum+zksbrut_b
        zksCbr1_c_sum=zksCbr1_c_sum+zksbrut_c
        zksCbr1_d_sum=zksCbr1_d_sum+zksbrut_d
        zksCbr1_e_sum=zksCbr1_e_sum+zksbrut_e
        zksCbr1_f_sum=zksCbr1_f_sum+zksbrut_f  
        zksCbr1_z_sum=zksCbr1_z_sum+zksbrut_z    
	endcase
  else
    do case
      case zkszapis="A"
	    zksAnet2_sum=zksAnet2_sum+zksnet_all
        zksAvat2_sum=zksAvat2_sum+zksvat_all
        zksAbr2_sum=zksAbr2_sum+zksbrut_all
        zksAnet2_a_sum=zksAnet2_a_sum+zksnet_a
        zksAnet2_b_sum=zksAnet2_b_sum+zksnet_b
        zksAnet2_c_sum=zksAnet2_c_sum+zksnet_c
        zksAnet2_d_sum=zksAnet2_d_sum+zksnet_d
        zksAnet2_e_sum=zksAnet2_e_sum+zksnet_e
        zksAnet2_f_sum=zksAnet2_f_sum+zksnet_f
        if zkspodlega
          zksAnet2_z_sum=zksAnet2_z_sum+zksnet_z
        else
          zksAniepodlega_sum=zksAniepodlega_sum+zksnet_z
        endif	
		if zksrubryka=18
		  zksAtrwaly=zksAtrwaly+zksnet_all
		  zksAvattrwaly=zksAvattrwaly+zksvat_all
		endif
        zksAvat2_a_sum=zksAvat2_a_sum+zksvat_a
        zksAvat2_b_sum=zksAvat2_b_sum+zksvat_b
        zksAvat2_c_sum=zksAvat2_c_sum+zksvat_c
        zksAvat2_d_sum=zksAvat2_d_sum+zksvat_d
        zksAvat2_e_sum=zksAvat2_e_sum+zksvat_e
        zksAvat2_f_sum=zksAvat2_f_sum+zksvat_f  
        zksAvat2_z_sum=zksAvat2_z_sum+zksvat_z  
  
        zksAbr2_a_sum=zksAbr2_a_sum+zksbrut_a
        zksAbr2_b_sum=zksAbr2_b_sum+zksbrut_b
        zksAbr2_c_sum=zksAbr2_c_sum+zksbrut_c
        zksAbr2_d_sum=zksAbr2_d_sum+zksbrut_d
        zksAbr2_e_sum=zksAbr2_e_sum+zksbrut_e
        zksAbr2_f_sum=zksAbr2_f_sum+zksbrut_f  
        zksAbr2_z_sum=zksAbr2_z_sum+zksbrut_z      

      case zkszapis="B"
	    zksBnet2_sum=zksBnet2_sum+zksnet_all
        zksBvat2_sum=zksBvat2_sum+zksvat_all
        zksBbr2_sum=zksBbr2_sum+zksbrut_all
        zksBnet2_a_sum=zksBnet2_a_sum+zksnet_a
        zksBnet2_b_sum=zksBnet2_b_sum+zksnet_b
        zksBnet2_c_sum=zksBnet2_c_sum+zksnet_c
        zksBnet2_d_sum=zksBnet2_d_sum+zksnet_d
        zksBnet2_e_sum=zksBnet2_e_sum+zksnet_e
        zksBnet2_f_sum=zksBnet2_f_sum+zksnet_f
        if zkspodlega
          zksBnet2_z_sum=zksBnet2_z_sum+zksnet_z
        else
          zksBniepodlega_sum=zksBniepodlega_sum+zksnet_z
        endif	
		if zksrubryka=18
		  zksBtrwaly=zksBtrwaly+zksnet_all
		  zksBvattrwaly=zksBvattrwaly+zksvat_all
		endif
        zksBvat2_a_sum=zksBvat2_a_sum+zksvat_a
        zksBvat2_b_sum=zksBvat2_b_sum+zksvat_b
        zksBvat2_c_sum=zksBvat2_c_sum+zksvat_c
        zksBvat2_d_sum=zksBvat2_d_sum+zksvat_d
        zksBvat2_e_sum=zksBvat2_e_sum+zksvat_e
        zksBvat2_f_sum=zksBvat2_f_sum+zksvat_f  
        zksBvat2_z_sum=zksBvat2_z_sum+zksvat_z  
  
        zksBbr2_a_sum=zksBbr2_a_sum+zksbrut_a
        zksBbr2_b_sum=zksBbr2_b_sum+zksbrut_b
        zksBbr2_c_sum=zksBbr2_c_sum+zksbrut_c
        zksBbr2_d_sum=zksBbr2_d_sum+zksbrut_d
        zksBbr2_e_sum=zksBbr2_e_sum+zksbrut_e
        zksBbr2_f_sum=zksBbr2_f_sum+zksbrut_f  
        zksBbr2_z_sum=zksBbr2_z_sum+zksbrut_z      

      case zkszapis="C"
	    zksCnet2_sum=zksCnet2_sum+zksnet_all
        zksCvat2_sum=zksCvat2_sum+zksvat_all
        zksCbr2_sum=zksCbr2_sum+zksbrut_all
        zksCnet2_a_sum=zksCnet2_a_sum+zksnet_a
        zksCnet2_b_sum=zksCnet2_b_sum+zksnet_b
        zksCnet2_c_sum=zksCnet2_c_sum+zksnet_c
        zksCnet2_d_sum=zksCnet2_d_sum+zksnet_d
        zksCnet2_e_sum=zksCnet2_e_sum+zksnet_e
        zksCnet2_f_sum=zksCnet2_f_sum+zksnet_f
        if zkspodlega
          zksCnet2_z_sum=zksCnet2_z_sum+zksnet_z
        else
          zksCniepodlega_sum=zksCniepodlega_sum+zksnet_z
        endif	
		if zksrubryka=18
		  zksCtrwaly=zksCtrwaly+zksnet_all
		  zksCvattrwaly=zksCvattrwaly+zksvat_all
		endif
        zksCvat2_a_sum=zksCvat2_a_sum+zksvat_a
        zksCvat2_b_sum=zksCvat2_b_sum+zksvat_b
        zksCvat2_c_sum=zksCvat2_c_sum+zksvat_c
        zksCvat2_d_sum=zksCvat2_d_sum+zksvat_d
        zksCvat2_e_sum=zksCvat2_e_sum+zksvat_e
        zksCvat2_f_sum=zksCvat2_f_sum+zksvat_f  
        zksCvat2_z_sum=zksCvat2_z_sum+zksvat_z  
  
        zksCbr2_a_sum=zksCbr2_a_sum+zksbrut_a
        zksCbr2_b_sum=zksCbr2_b_sum+zksbrut_b
        zksCbr2_c_sum=zksCbr2_c_sum+zksbrut_c
        zksCbr2_d_sum=zksCbr2_d_sum+zksbrut_d
        zksCbr2_e_sum=zksCbr2_e_sum+zksbrut_e
        zksCbr2_f_sum=zksCbr2_f_sum+zksbrut_f  
        zksCbr2_z_sum=zksCbr2_z_sum+zksbrut_z      

	endcase
    if zks_zwolniona
	  if zksrubryka=18
	    do case
	      case zksdotycz=="A"       && Dotyczy tylko sprzedaæy opodatkowanej
		    zw_Anet_trwale=zw_Anet_trwale+zksnet_all
			zw_Avat_trwale=zw_Avat_trwale+zksvat_all
	      case zksdotycz=="B"       && Dotyczy sprzedaæy opodatkowanej i zwolnionej
		    zw_Bnet_trwale=zw_Bnet_trwale+zksnet_all
			zw_Bvat_trwale=zw_Bvat_trwale+zksvat_all			
	      case zksdotycz=="C"       && Dotyczy tylko sprzedaæy zwolnionej
		    zw_Cnet_trwale=zw_Cnet_trwale+zksnet_all			
			zw_Cvat_trwale=zw_Cvat_trwale+zksvat_all
	    endcase
	  else
	    do case
	      case zksdotycz=="A"       && Dotyczy tylko sprzedaæy opodatkowanej
		    zw_Anet_pozos=zw_Anet_pozos+zksnet_all
			zw_Avat_pozos=zw_Avat_pozos+zksvat_all
	      case zksdotycz=="B"       && Dotyczy sprzedaæy opodatkowanej i zwolnionej
		    zw_Bnet_pozos=zw_Bnet_pozos+zksnet_all
			zw_Bvat_pozos=zw_Bvat_pozos+zksvat_all			
	      case zksdotycz=="C"       && Dotyczy tylko sprzedaæy zwolnionej
		    zw_Cnet_pozos=zw_Cnet_pozos+zksnet_all			
			zw_Cvat_pozos=zw_Cvat_pozos+zksvat_all
	    endcase	
	  endif
	endif  
	    
  
  endif
  skip
enddo
RETURN


FUNCTION KS_FILTR()
local ek,lbelka:="FILTR",ltnaz[9],ltlit[9],lopis[9],lpoz:=1
local lcolor:=setcolor(),recno:=recno(),lznak:=0
g_tlo()
ltnaz[1]:="Kontrahent"
ltnaz[2]:="Miesi•c   "
ltnaz[3]:="Dzie‰     " 
ltnaz[4]:="Rubryka   "
ltnaz[5]:="Opis zdarz"
ltnaz[6]:="Stawka VAT"
ltnaz[7]:="Ksi©ga+Rej"  
ltnaz[8]:="Tylko Ks. "
ltnaz[9]:="Tylko Rej."
ltlit[1]:="K         "
ltlit[2]:="M         "
ltlit[3]:="D         "
ltlit[4]:="R         "
ltlit[5]:="O         "
ltlit[6]:="S         "
ltlit[7]:="K         "
ltlit[8]:="T         "
ltlit[9]:="T         "
lopis[1]:="Dokumenty zwi•zane z wybranym kontrahentem"
lopis[2]:="Dokumenty z wybranego miesi•ca."
lopis[3]:="Dokumenty z wybranego dnia."
lopis[4]:="Dokumenty zwi•zane z okreòlon• rubryk• Ksi©go P. i R."
lopis[5]:="Dokumenty zwi•zane z okreòlonym opisem zdarzenia gospodarczego."
lopis[6]:="Dokumenty zawieraj•ce pozycje z wybran• stawk• VAT."
lopis[7]:="Dokumenty obj•te Ksi©g• Przychod¢w i Rozchod¢w oraz Rejestrami VAT."
lopis[8]:="Dokumenty obj©te wyà•cznie w Ksi©g• Przychod¢w i Rozchod¢w."
lopis[9]:="Dokumenty obj©te wyàacznie Rejestrami VAT."
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
		ks_default(zfirnum)
		select &ks_sel

		fwar=fwar+".and.ksnaz1=zknaz1.and.ksnip=zknip"
		dwar=dwar_start+".and."+fwar
		keyboard chr(205)

		  
 	  case lpoz=2
	      f_miesiac=month(ksdatdok)
		   @ 21,15 clear to 23,78
           @ 22,20 say " Miesi•c:                                    "
           set cursor on
		   
           @ 22,31 get f_miesiac picture "99"
		   read
           set cursor off
		   fwar=fwar+".and.month(ksdatdok)=f_miesiac"
		  dwar=dwar_start+".and."+fwar
          keyboard chr(205)		  

      case lpoz=3
	      f_ddatdok=ksdatdok
		   @ 21,15 clear to 23,78
           @ 22,20 say " Data  :                                     "
           set cursor on
           @ 22,31 get f_ddatdok
		   read
           set cursor off
		   fwar=fwar+".and.dtoc(ksdatdok)=dtoc(f_ddatdok)"
		  	
          dwar=dwar_start+".and."+fwar
		  keyboard chr(205)	  
		  
      case lpoz=4
		   @ 21,15 clear to 23,78
           @ 22,20 say " Rubryka:                                    "
           set cursor on
           @ 22,30 get zksrubryka picture "99" valid rub_dobra()  when s_kom("Wpisz opis numer rubryki w Ksi©dzie P. i R.   PgUp - sàownik") 
		   read
           set cursor off
		   if lastkey()=18
		     ks_rubryka()
             set key 5 to 
             set key 24 to 	   
		   endif
		   fwar=fwar+".and.ksrubryka=zksrubryka"
		  	
          dwar=dwar_start+".and."+fwar
		  keyboard chr(205)	  		  
		  
      case lpoz=5
		   public fks_opis:=space(30)
		   *zksopis=space(30)
		   @ 21,15 clear to 23,78
           @ 22,20 say " Opis :                                      "
           set cursor on
           @ 22,30 get fks_opis when s_kom("Wpisz opis zdarzenia gospodarczego.   PgUp - sàownik")
		   read
           set cursor off
		   if lastkey()=18
		     slownik_ks()
			 zksopis=substr(zksopis,1,30)
			 fks_opis=zksopis
			 set key 5 to 
             set key 24 to 	   
		   endif
		   
		   *fwar=fwar+".and.ksopis=substr(zksopis,1,30)"
		   fks_opis=alltrim(fks_opis)
		   fwar=fwar+".and.substr(ksopis,1,len(fks_opis))=fks_opis"
		  	
          dwar=dwar_start+".and."+fwar
		  keyboard chr(205)	  		  		  
		  
      case lpoz=6
		   @ 21,15 clear to 23,78
           @ 22,20 say " Stawka VAT                                  "
           ksstawka_menu()           
		   do case
		     case zksstawkavat=zvat_a
			   fwar=fwar+".and..not.ksvat_a=0"
		     case zksstawkavat=zvat_b
			   fwar=fwar+".and..not.ksvat_b=0"
		     case zksstawkavat=zvat_c
			   fwar=fwar+".and..not.ksvat_c=0"
		     case zksstawkavat=zvat_d
			   fwar=fwar+".and..not.ksvat_d=0"
		     case zksstawkavat=zvat_e
			   fwar=fwar+".and..not.ksvat_e=0"
		     case zksstawkavat=zvat_f
			   fwar=fwar+".and..not.ksvat_f=0"
		     case zksstawkavat=zvat_z
			   fwar=fwar+".and..not.ksvat_z=0"
		   endcase
		  	
          dwar=dwar_start+".and."+fwar
		  keyboard chr(205)	  		  		  

 	  case lpoz=7
          fwar=fwar+".and.kszapis='A'"
          dwar=dwar_start+".and."+fwar
		  keyboard chr(205)
 	  case lpoz=8
          fwar=fwar+".and.kszapis='B'"
          dwar=dwar_start+".and."+fwar
		  keyboard chr(205)		  
 	  case lpoz=9
          fwar=fwar+".and.kszapis='C'"
          dwar=dwar_start+".and."+fwar
		  keyboard chr(205)


 	  case lpoz=77
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

		  
 	  case lpoz=33
          fwar=fwar+".and.dniedop>0"
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
**
       case lpoz=7
          fwar=fwar+".and.dtyp='F'"
		  dwar=fwar
		  *dwar=dwar_allstart+".and."+fwar
          keyboard chr(205)		  	   
		  
       case lpoz=8
          fwar=fwar+".and.dtyp='R'"
		  dwar=fwar
		  *dwar=dwar_allstart+".and."+fwar
          keyboard chr(205)		  	   		  

endcase
restore screen from ek
setcolor(lcolor)
RETURN NIL


FUNCTION KSSTAWKA_MENU()
local ltnaz[7],ltlit[7],ltopis[7],lbelka:="",lpoz:=1
ltnaz[1]:=str(zvat_a)
ltnaz[2]:=str(zvat_b)
ltnaz[3]:=str(zvat_c)
ltnaz[4]:=str(zvat_d)
ltnaz[5]:=str(zvat_e)
ltnaz[6]:=str(zvat_f)
ltnaz[7]:="zw."
ltlit[1]:=" "
ltlit[2]:=" "
ltlit[3]:=" "
ltlit[4]:=" "
ltlit[5]:=" "
ltlit[6]:=" "
ltlit[7]:=" "
ltopis[1]:="Stawka a"
ltopis[2]:="Stawka b"
ltopis[3]:="Stawka c"
ltopis[4]:="Stawka d"
ltopis[5]:="Stawka e"
ltopis[6]:="Stawka f"
ltopis[7]:="Stawka zw."
  @ 7,33,17,44 box chr(176)
  lpoz=men_pion(8,34,7,lbelka,ltnaz,ltlit,ltopis,lpoz)
do case
  case lpoz=1
    zksstawkavat=zvat_a
  case lpoz=2
    zksstawkavat=zvat_b
  case lpoz=3
    zksstawkavat=zvat_c
  case lpoz=4
    zksstawkavat=zvat_d
  case lpoz=5
    zksstawkavat=zvat_e
  case lpoz=6
    zksstawkavat=zvat_f
  case lpoz=7
    zksstawkavat=zvat_z						
endcase
RETURN 


FUNCTION EXPORTDOK_GET(pget)
*zdewiz_kwot=zks00*zile_jednostek/val(zkurs)
local lsad_numer,lsad_dat,lcolor:=setcolor()
local lwaluta,lwal_skrot,lkurs
local lile_jednostek,ldewiz_kwot
local lks_kwota:=0,lilosc:=1
*ex_lad()
if zksprzelicz=0
  zksprzelicz=1
endif
@ 9,2 say " Kontrahent: " +zksnaz1
if pget
  ks_zapis1()
endif  
set color to n/w,w/n
kj_okno(0,0,8, "  ROZLICZENIE  FAKTURY  EKSPORTOWEJ                                             ",2)	  
do case
  case zkszapis="B"
    @ 2,2 say "Tabela kursow srednich NBP NR: ......"
    @ 3,2 say "Data przekroczenia granicy .........."  
  case zkszapis="C"
    @ 2,2 say "SAD  NR ............................."
    @ 3,2 say "Data rozliczenia SAD ................"  	
  otherwise
    kj_tkom(12," Uwaga! ","Bàadne dane !","Dokument naleæy zapisaÜ tylko w Ksi©dze lub tylko w Rejestrach.","",5)          
endcase

@ 4,2 say "Waluta / skrot ......................"
@ 5,2 say "Ilosc jednostek = kurs sredni  ......          ="
@ 6,2 say "Wartosc faktury w podanej walucie ..."
if pget
  set cursor on
  do case
    case zkszapis="B"
      @ 2,40 get zksnbpnum when s_kom("Podaj numer Tabeli NBP.")
      @ 3,40 get zksdatsad when s_kom("Podaj date TAbeli NBP  <dzien.miesiac.rok>")	
	case zkszapis="C"
      @ 2,40 get zkssadnum when s_kom("Podaj numer SAD-u.")
      @ 3,40 get zksdatsad when s_kom("Podaj date SAD-u  <dzien.miesiac.rok>")	  
  endcase
  @ 4,40 get zkswaluta when s_kom("Podaj nazwe waluty rozliczeniowej")
  @ 4,50 get zkswalut when s_kom("Podaj skrot waluty rozliczeniowej")
  @ 5,40 get zksprzelicz picture "999" when s_kom("Podaj ilosc jednostek okreslanych kursem srednim")
  @ 5,52 get zkskurs picture "999.9999" when s_kom("Podaj kurs sredni wynikajacy z podanej wyzej tabeli")
  @ 6,40 get zdewiz_kwot picture "9999999.99" when s_kom("Podaj wartosc faktury w okreslonej wyzej walucie")
  read
  set cursor off
else
  @ 2,40 say zkssadnum
  @ 3,40 say zksdatsad
  @ 4,40 say zkswaluta
  @ 4,50 say zkswalut
  @ 5,40 say zksprzelicz
  @ 5,52 say zkskurs
  @ 6,40 say zdewiz_kwot
endif
lks_kwota=zdewiz_kwot*zkskurs/zksprzelicznik
do case
  case zvat00_znak="A"
    zks_a=lks_kwota
  case zvat00_znak="B"
    zks_b=lks_kwota
  case zvat00_znak="C"
    zks_c=lks_kwota
  case zvat00_znak="D"
    zks_d=lks_kwota
  case zvat00_znak="E"
    zks_e=lks_kwota
  case zvat00_znak="F"
    zks_f=lks_kwota					
endcase
do case
  case zpapier_typ=1
    ilosc=2
  case zpapier_typ=3
    ilosc=3
  otherwise
    ilosc=1		
endcase
if.not.z1_tpopraw
  if kj_gkom(12,"","WydrukowaÜ dokument  ? ","",.t.,5) 
    set device to printer
    rozlicz_public_txt()
    ks_legexport_lad()
    do while.t.
      do case
	    case zkszapis="B"
	      k_export_dr()  
        case zkszapis="C"
	      r_export_dr()  		
 	  endcase
      lilosc=lilosc+1
      if lilosc>ilosc
        exit
      endif
    enddo
  endif
endif
set device to screen
setcolor(lcolor)
RETURN


FUNCTION KS_LEGEXPORT_LAD()
zkmiasto =zksmiasto
zkulica=zksulica
zdndok=zksndok
zdatdok=zksdatdok
zdatgranic=zksdatgran
zkursnbp_numer=zksnbpnum
zsad_numer=zkssadnum
zwaluta=zkswaluta
zdwaluta=zkswalut
zdkurs=zkskurs
zprzelicznik=zksprzelicz
ztnet_all=zdewiz_kwot
RETURN

FUNCTION RYCZ_STAWKI()
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=1,ek
local ltytul:=" Zatwierd´                      "
ltnaz[1]=" Stawka ryczaàtu  "+str(zksrycz_a)+"  "
ltnaz[2]=" Stawka ryczaàtu  "+str(zksrycz_b)+"  "
ltnaz[3]=" Stawka ryczaàtu  "+str(zksrycz_c)+"  "
ltlit[1]="  "
ltlit[2]="  " 
ltlit[3]=" R"
ltopis[1]=" Zatwierdæ stawk© ryczaàtu"
ltopis[2]=" Zatwierdæ stawk© ryczaàtu"
ltopis[3]=" Zatwierdæ stawk© ryczaàtu"
save screen to ek
*g_tlo()
set key 5 to
set key 24 to
@ 21,14 say "Stawka ryczaàtu:"
  lpoz=men_pion(18,15,3,ltytul,ltnaz,ltlit,ltopis,lpoz)
do case
  case lpoz=1
    zksryczalt=zksrycz_a
  case lpoz=2
    zksryczalt=zksrycz_b
  case lpoz=3
    zksryczalt=zksrycz_c
endcase
set key 5 to koncz5()
set key 24 to koncz24()
restore screen from ek
set cursor on
RETURN

*************RAPORTY
FUNCTION KSRAPORT()
local ilanal:=0,lw:=0,ek,ek1,lcolor:=setcolor(),lcen_rodz:=0
local lrap1:=.t.,lrap2:=.t.,lrap3:=.t.,lrap4:=.t.,lrap5:=.t.
local select
zokres_def=1
zdruk_def=1
zknum=0
zdznak="F"
if zryczalt_ks
  rap_plik="ryczrap.dbf"
else
  rap_plik="raport.dbf"
endif
save screen to ek
	  set default to &set_serwer
      *if file("raport.dbf")
	  if file(rap_plik)
	    select &rap_sel
		if kj_use(rap_plik,.f.,3)
		  an_lad()
		  lw=12
		  do while.not.eof()
		    ilanal=ilanal+1
		    skip
		  enddo
		  go top
		  @ 2,lw+1 to 2+ilanal+1,lw+17 
          save screen to ek1		  
          do while.t.
		    rapwar=".t."
			keyboard chr(205)
		    go top
			dbedit(3,lw+2,3+ilanal-1,lw+16,"an_nazwa","FU_A","","","",,"")
		    if lastkey()=27
			  exit
		    endif
            do case
              case alltrim(an_typ)=="zksbilans"
                an_lad()
				kswydruk(1)
              case alltrim(an_typ)=="zryczbilans"
                an_lad()
				kswydruk(6)				
              case alltrim(an_typ)=="zkstabulogram"
                an_lad()
	            ks_use()
	            *set filter to
	            *set filter to kszapis$"AB"
				set filter to year(ksdatdok)=zrok.and.kszapis$"AB".and..not.ksanul
				go top
	            lpoz=zkspoz_start
				do while.not.eof()
                  if reclock(5)      
	                replace kspoz with lpoz
		            unlock
	              endif
				  lpoz=lpoz+1					  
				  skip
				enddo
				close				
				kswydruk(2)				

              case alltrim(an_typ)=="zuerapzak"
                zrejtxt=""
                an_lad()
	            ks_use()
                set filter to kszapis$"AC".and.(ksrubryka=10.or.ksrubryka=11.or.ksrubryka=12.or.ksrubryka=13.or.ksrubryka=14).and..not.substr(ksnip,1,1)$"0123456789".and..not.substr(ksnip,1,2)="PL"
	            go top
                rapwar=dbfilter()
				ueraport()
				
              case alltrim(an_typ)=="zuerapsp"
                zrejtxt=""
                an_lad()
	            ks_use()
                set filter to kszapis$"AC".and.(ksrubryka=7.or.ksrubryka=8).and..not.substr(ksnip,1,1)$"0123456789".and..not.substr(ksnip,1,2)="PL"
	            go top
                rapwar=dbfilter()
				ueraport()				
				


			  case alltrim(an_typ)=="zkszakrej"
                zrejtxt=""
                an_lad()
	            ks_use()
				if.not.zks_zwolniona
	              set filter to kszapis$"AC".and.(ksrubryka=10.or.ksrubryka=11.or.ksrubryka=12.or.ksrubryka=13.or.ksrubryka=14)
	              go top

	              zdbfilter=dbfilter()
				  lpoz=0			  
                  zrejtxt="Bez òrodk¢w trwaàych"
				  if.not.kj_pusty()
					zdalej_druk=.t.
					kswydruk(3)
					zdalej_druk=.f.
				  else
				    lrap1=.f.
				  endif	

				else
	              set filter to kszapis$"AC".and.ksdotycz="A".and.(ksrubryka=10.or.ksrubryka=11.or.ksrubryka=12.or.ksrubryka=13.or.ksrubryka=14)
	              go top
				  zdbfilter=dbfilter()
	              lpoz=0
				  zrejtxt="Zakupy zwi•zane wyà•cznie ze sprzedaæ• opodatkowan• "
                 * if.not.kj_pusty()
				*	kswydruk(4)		
				 * else
				 *   lrap2=.f.
				 * endif	
				  zdalej_druk=.t.
				  kswydruk(4)	
				  zdalej_druk=.f.	
				  if.not.lastkey()=27
				    if kj_pusty()
				      lrap2=.f.
				    endif
				    ks_use()
	                set filter to kszapis$"AC".and.ksdotycz="B".and.(ksrubryka=10.or.ksrubryka=11.or.ksrubryka=12.or.ksrubryka=13.or.ksrubryka=14)
	                go top
				    zdbfilter=dbfilter()
	                lpoz=0			  
				    zrejtxt="Zakupy zwi•zane ze sprzedaæ• opodatkowan• i zwolnion• "
                    if.not.kj_pusty()
				      zdalej_druk=.t.
					  ksrejvat()	
					  zdalej_druk=.t.			  
				    else
				      lrap3=.f.
				    endif	
				  endif  
				endif

				  ************ Cykl tylko dla òrodk¢w trwaàych
				  if.not.zks_zwolniona
				    ks_use()
				    set filter to kszapis$"AC".and.ksrubryka=18
	                go top
				    zdbfilter=dbfilter()
	                lpoz=0			  
                    zrejtxt=""
				    if.not.kj_pusty()
					  ksrejvat()				  
				    else
				      lrap4=.f.
				    endif	
				  else  
				    ks_use()
				    set filter to kszapis$"AC".and.ksdotycz="A".and.ksrubryka=18
	                go top
				    zdbfilter=dbfilter()
	                lpoz=0			  
                    zrejtxt="órodki trwaàe zwi•zane wyà•cznie ze sprzedaæ• opodatkowan•"
				    if.not.kj_pusty()
					  ksrejvat()				  
				    else
				      lrap4=.f.
				    endif	
				    set filter to kszapis$"AC".and.ksdotycz="B".and.ksrubryka=18
	                go top
				    zdbfilter=dbfilter()
	                lpoz=0			  
                    zrejtxt="órodki trwaàe zwi•zane ze sprzedaæ• opodatkowan• i zwolnion•"
				    if.not.kj_pusty()
					  ksrejvat()				  
				    else
				      lrap5=.f.
				    endif					  
                  endif
				*
			
			  case alltrim(an_typ)=="zpit5"				
			    select=select()
				do while .t.
			      wspol_def(.f.)
              	      if lastkey()=27
	                    exit
	                  endif						    
			      ks_default(zfirnum)
				  if file("pit5.dbf")
                    if kj_use("pit5",.f.,3)
				      zp_remanent=p_remanent
					  za_remanent=a_remanent
				 	  close
				    endif				  
				  endif
				  za_miesiac()
                  if lastkey()=27
				   exit
				  endif
				  if.not.kj_gkom(19,"","WypeàniÜ deklaracj© ?","",.t.,5).or.lastkey()=27				
				    exit
				  endif
				  ks_pit5()
			    enddo
				close_all("SH")
				set default to &set_serwer
	            select &rap_sel
		        kj_use(rap_plik,.f.,3)				
                restore screen from ek1
			  
			  case alltrim(an_typ)=="zvat7"				
   			    vat7_param()		  	
				set default to &set_serwer
	            select &rap_sel
		        kj_use(rap_plik,.f.,3)				
                restore screen from ek1						  			
				
              case alltrim(an_typ)=="zkssprzedrej"
                zrejtxt=""
				an_lad()
				ks_use()
				do case
				  case zan_def1=0
	                set filter to kszapis$"AC".and.(ksrubryka=7.or.ksrubryka=8).and.(.not.substr(ksster,1,1)$"EDT")
	              case zan_def1=1
				    set filter to kszapis$"AC".and.(ksrubryka=7.or.ksrubryka=8).and.substr(ksster,1,1)="E"
	              case zan_def1=2
				    set filter to kszapis$"AC".and.(ksrubryka=7.or.ksrubryka=8).and.substr(ksster,1,1)="D"
	              case zan_def1=3
				    set filter to kszapis$"AC".and.(ksrubryka=7.or.ksrubryka=8).and.substr(ksster,1,1)="T"										
				endcase
				go top				  
				zdbfilter=dbfilter()
	            lpoz=0			  
                kswydruk(3)
				

              case alltrim(an_typ)=="zksewidencja".and.zryczalt_ks
                an_lad()
	            ks_use()
	            set filter to kszapis$"AB".and.(ksrubryka=7.or.ksrubryka=8)
	            go top
                lpoz=0
				kswydruk(5)								
				
 		    endcase
			select &rap_sel
		  enddo	
		  close
        else
          return
        endif
	  endif
if.not.lrap1.or..not.lrap2.or..not.lrap3.or..not.lrap4.or..not.lrap5
  kj_okno(11,5,8," Uwaga !                                                              ",2)
  lw=1
  if.not.lrap1
    @ 12+lw,7 say "Rejestr zakup¢w z wyà•czeniem òrodk¢w trwaàych nie zawiera wpis¢w."
    lw=lw+1
	inkey(10)
  endif
  if.not.lrap2
    @ 12+lw,7 say "Rejestr zakup¢w zwi•zanych ze sprzedaæ• opodatkowan• nie zawiera wpis¢w."
    lw=lw+1
	inkey(10)
  endif
  if.not.lrap3
    @ 12+lw,7 say "Rejestr zakup¢w zwi•zanych ze sprzedaæ• opod. i zw. nie zawiera wpis¢w."
    lw=lw+1
	inkey(10)
  endif
  if.not.lrap4
    @ 12+lw,7 say "Rejestr zakup¢w òrodk¢w trwaàych nie zawiera wpis¢w. 4"
    lw=lw+1
	inkey(0)
  endif  
  if.not.lrap5
    @ 12+lw,7 say "Rejestr zakup¢w òrodk¢w trwaàych nie zawiera wpis¢w. 5"
    lw=lw+1
	inkey(0)
  endif    
endif  

restore screen from ek
select &rap_sel
close		
RETURN

FUNCTION KSWYDRUK(prap)
* prap=1   bilans
* prap=2   tabulogram
local ek, lcolor:=setcolor(),lrap:=prap
save screen to ek
f_tmiesiac=month(date())
zokres_def=2
zdruk_def=1  
kj_okno(0,0,10, "                              TABULOGRAM                                        ",2)
do while.t.
  zknum=0
  if r_parametry()
	do case
	  case lrap=3
	    ksrejvat()				  
	  case lrap=4
	    ksrejvat()
	    exit		
	  otherwise	
	    ks_druk(lrap)  
	endcase
  else
    exit
  endif
  if zdalej_druk
    exit
  endif
enddo  
select &rap_sel
restore screen from ek
setcolor(lcolor)
RETURN

FUNCTION KS_DRUK(prodz)
local ek,lcolor:=setcolor(),lpoz:=0,lkon:=space(120)
public zdoktyp:=alltrim(substr(zan_txt,1,20))
public_rap()
public_srap()
zrap_zer()
zsrap_zer()
ks_use()
do case
  case zokres_def=1
    rapwar="ksdatdok=f_tdat1.and..not.ksanul"
  case zokres_def=2
    rapwar="month(ksdatdok)=f_tmiesiac.and.year(ksdatdok)=zrok.and..not.ksanul"	
  case zokres_def=3
    rapwar="max(f_tdat1,ksdatdok)=ksdatdok.and.min(f_tdat2,ksdatdok)=ksdatdok.and..not.ksanul"
endcase
if.not.empty(zknaz1)
  rapwar=rapwar+".and.ksnaz1=zknaz1.and.ksnip=zknip"
endif

*kj_okno(4,20,4, "  C z e k a j  ! !                      ",2)
*set color to n/w*
*@ 6,28 say "Trwaj• operacje dyskowe."
setcolor(lcolor)

select &ks_sel


set filter to &rapwar
go top


*BROWSE()

if zdruk_def=1
  if.not.start_druk()
    set device to screen
 	return .f.
  endif
else
  plik="wydruki\ksiega.txt"
  set printer to &plik
endif

set device to printer
*ksr_tyt()
*w=prow()+1
w=w+2
do case
  case prodz=1
    ksr_tyt()
    ksbil_rap()
	eject
  case prodz=2
    tabulogram()	
  case prodz=5
    ksr_tyt()
    ksewiden()
	eject
  case prodz=6
    ksr_tyt()	
    ryczbil_rap()
	eject
endcase
*eject
set device to screen
if.not.zdruk_def=1
  save screen to ek
  edi=edit+" wydruki\ksiega.txt"
  run &edi 
  restore screen from ek
  set cursor off   
endif
RETURN



FUNCTION KSR_TYT()
w=0
*@ w,0 say &zdr_kond
*@ w,80 say zan_miasto
*@ w,112 say dtoc(zan_data)+&zdr_kkond
*@ w,65 say dtoc(zan_data)
*w=w+1
if.not.empty(zfirnaz)
  @ w,0 say zfirnaz
  w=w+2
endif
@ w,0 say zan_tytul+&zdr_kond
w=w+2
do case
  case zokres_def=1
    @ w,0 say "Za dzie‰: "+dtoc(f_tdat1)+space(20)+zrejtxt
  case zokres_def=2
    @ w,0 say "Za miesi•c: "+nazwa_miesiaca(f_tmiesiac)+"  / "+str(zrok)+" r"+space(20)+zrejtxt
  case zokres_def=3
    @ w,0 say   "Za okres od dnia .. "+dtoc(f_tdat1)+"  do dnia .. "+dtoc(f_tdat2)+space(20)+zrejtxt
endcase

if.not.empty(zknaz1)
  w=w+2
  @ w,0 say "Kontrahent:  "+alltrim(zknaz1)+"  "+zkmiasto
endif

RETURN

FUNCTION KSBIL_RAP()
local ldozaplaty:=0
if empty(dbfilter())
  fwar=".t."
else
  fwar=dbfilter()
endif
fwar1=fwar+".and.kszapis$'AB'"
set filter to &fwar1
go top
ksrubr_licz()
kssum_licz()
w=w+1
@ w,0 say "Ksi©ga Przychod¢w i Rozchod¢w"
w=w+1
@ w,0 say replicate("=",79)
w=w+1
@ w,0 say "| Nr | Nazwa rubryki                        |L.dok| Podsumowanie |  Razem     |"
w=w+1
@ w,0 say replicate("=",79)
w=w+1
@ w,0 say "|"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "[ 7]  WartoòÜ sprzedanych towar¢w i usàug  |"
@ w,45 say ziledok_07 picture "9999"
@ w,50 say "|"
@ w,51 say zksrubr_7 picture "999999999.99"
@ w,65 say "| [7]+[8]"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "[ 8]  Pozostaàe przychody                  |"
@ w,45 say ziledok_08 picture "9999"
@ w,50 say "|"
@ w,51 say zksrubr_8 picture "999999999.99"
@ w,65 say "|"
@ w,66 say zksrubr_7+zksrubr_8 picture "999999999.99"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "                                           |"
@ w,50 say "|"
@ w,65 say "|"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "[10]  Zakup towar¢w handlowych i materiaàow|"
@ w,45 say ziledok_10 picture "9999"
@ w,50 say "|"
@ w,51 say zksrubr_10 picture "999999999.99"
@ w,65 say "| [10]+[11]"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "[11]  Koszty uboczne zakupu                |"
@ w,45 say ziledok_11 picture "9999"
@ w,50 say "|"
@ w,51 say zksrubr_11 picture "999999999.99"
@ w,65 say "|"
@ w,66 say zksrubr_10+zksrubr_11 picture "999999999.99"
@ w,78 say "|"

w=w+1
@ w,0 say "|"
@ w,1 say "                                           |"
@ w,50 say "|"
@ w,65 say "|"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "[12]  Koszty reprezentacji i reklamy       |"
@ w,45 say ziledok_12 picture "9999"
@ w,50 say "|"
@ w,51 say zksrubr_12 picture "999999999.99"
@ w,65 say "| [12]+[13]+"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "[13]  Wynagrodzenia w got¢wce i w naturze  |"
@ w,45 say ziledok_13 picture "9999"
@ w,50 say "|"
@ w,51 say zksrubr_13 picture "999999999.99"
@ w,65 say "| + [14]  ]"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "[14]  Pozostaàe wydatki                    |"
@ w,45 say ziledok_14+ziledok_18  picture "9999"
@ w,50 say "|"
@ w,51 say zksrubr_14+zksrubr_18 picture "999999999.99"
@ w,65 say "|"
@ w,66 say zksrubr_12+zksrubr_13+zksrubr_14+zksrubr_18 picture "999999999.99"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "                                           |"
@ w,50 say "|"
@ w,65 say "|"
@ w,78 say "|"
w=w+1
@ w,0 say replicate("=",79)
w=w+1
@ w,1 say "     ù•czna iloòÜ zaksi©gowanych dokument¢w "
@ w,45 say ziledok_07+ziledok_08+ziledok_10+ziledok_11+ziledok_12+ziledok_13+ziledok_14+ziledok_18 picture "9999"
w=w+2
@ w,0 say "Zysk ( [7]+[8] - { [10]+[11]+[12]+[13]+[14] } )  ="
@ w,50 say zksrubr_7+zksrubr_8 - (zksrubr_10+zksrubr_11+zksrubr_12+zksrubr_13+zksrubr_14+zksrubr_18) picture "999999999.99"


fwar1=fwar+".and.kszapis$'AC'"
set filter to &fwar1
go top
ksrubr_licz()
kssum_licz()
w=w+3
@ w,0 say "Rejestry VAT - podliczenie rubryk w wartoòciach NETTO"
w=w+1
@ w,0 say replicate("=",79)
w=w+1
@ w,0 say "| Nr | Nazwa rubryki                        |L.dok| Podsumowanie |  Razem     |"
w=w+1
@ w,0 say replicate("=",79)
w=w+1
@ w,0 say "|"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "[ 7]  WartoòÜ sprzedanych towar¢w i usàug  |"
@ w,45 say ziledok_07 picture "9999"
@ w,50 say "|"
@ w,51 say zksrubr_7 picture "999999999.99"
@ w,65 say "| [7]+[8]"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "[ 8]  Pozostaàe przychody                  |"
@ w,45 say ziledok_08 picture "9999"
@ w,50 say "|"
@ w,51 say zksrubr_8 picture "999999999.99"
@ w,65 say "|"
@ w,66 say zksrubr_7+zksrubr_8 picture "999999999.99"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "                                           |"
@ w,50 say "|"
@ w,65 say "|"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "[10]  Zakup towar¢w handlowych i materiaàow|"
@ w,45 say ziledok_10 picture "9999"
@ w,50 say "|"
@ w,51 say zksrubr_10 picture "999999999.99"
@ w,65 say "| [10]+[11]"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "[11]  Koszty uboczne zakupu                |"
@ w,45 say ziledok_11 picture "9999"
@ w,50 say "|"
@ w,51 say zksrubr_11 picture "999999999.99"
@ w,65 say "|"
@ w,66 say zksrubr_10+zksrubr_11 picture "999999999.99"
@ w,78 say "|"

w=w+1
@ w,0 say "|"
@ w,1 say "                                           |"
@ w,50 say "|"
@ w,65 say "|"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "[12]  Koszty reprezentacji i reklamy       |"
@ w,45 say ziledok_12 picture "9999"
@ w,50 say "|"
@ w,51 say zksrubr_12 picture "999999999.99"
@ w,65 say "| [12]+[13]+"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "[13]  Wynagrodzenia w got¢wce i w naturze  |"
@ w,45 say ziledok_13 picture "9999"
@ w,50 say "|"
@ w,51 say zksrubr_13 picture "999999999.99"
@ w,65 say "| + [14]  ]"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "[14]  Pozostaàe wydatki                    |"
@ w,45 say ziledok_14+ziledok_18 picture "9999"
@ w,50 say "|"
@ w,51 say zksrubr_14+zksrubr_18 picture "999999999.99"
@ w,65 say "|"
@ w,66 say zksrubr_12+zksrubr_13+zksrubr_14+zksrubr_18 picture "999999999.99"
@ w,78 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say "                                           |"
@ w,50 say "|"
@ w,65 say "|"
@ w,78 say "|"
w=w+1
@ w,0 say replicate("=",79)
w=w+1
@ w,1 say "     ù•czna iloòÜ zaksi©gowanych dokument¢w "
@ w,45 say ziledok_07+ziledok_08+ziledok_10+ziledok_11+ziledok_12+ziledok_13+ziledok_14+ziledok_18 picture "9999"
  w=w+3
  @ w,0 say "Rozliczenie podatku VAT z rozbiciem na stawki "
  w=w+1
  @ w,0 say replicate("=",60)
  w=w+1
  @ w,0 say "| Stawaka       Podatek naleæny       Podatek naliczony    |"
  w=w+1
  @ w,0 say replicate("=",60)
  w=w+1
  @ w,0 say "|"
  @ w,59 say "|"
  do while.t.
    if zvat00_znak="A"
      exit
    endif
    w=w+1
    @ w,0 say "|"
    @ w,2 say zvat_a picture "99"
    @ W,18 say zksAvat1_a_sum+zksCvat1_a_sum picture "999999999.99"
    @ w,42 say zksAvat2_a_sum+zksCvat2_a_sum picture "999999999.99"
    @ w,59 say "|"
    if zvat00_znak="B"
      exit
    endif
    w=w+1
    @ w,0 say "|"
    @ w,2 say zvat_b picture "99"
    @ W,18 say zksAvat1_b_sum+zksCvat1_b_sum picture "999999999.99"
    @ w,42 say zksAvat2_b_sum+zksCvat2_b_sum picture "999999999.99"
    @ w,59 say "|"
    if zvat00_znak="C"
      exit
    endif
    w=w+1
    @ w,0 say "|"
    @ w,2 say zvat_c picture "99"
    @ W,18 say zksAvat1_c_sum+zksCvat1_c_sum picture "999999999.99"
    @ w,42 say zksAvat2_c_sum+zksCvat2_c_sum picture "999999999.99"
    @ w,59 say "|"
    if zvat00_znak="D"
      exit
    endif
    w=w+1
    @ w,0 say "|"
    @ w,2 say zvat_d picture "99"
    @ W,18 say zksAvat1_d_sum+zksCvat1_d_sum picture "999999999.99"
    @ w,42 say zksAvat2_d_sum+zksCvat2_d_sum picture "999999999.99"
    @ w,59 say "|"
    if zvat00_znak="E"
      exit
    endif
    w=w+1
    @ w,0 say "|"
    @ w,2 say zvat_e picture "99"
    @ W,18 say zksAvat1_e_sum+zksCvat1_e_sum picture "999999999.99"
    @ w,42 say zksAvat2_e_sum+zksCvat2_e_sum picture "999999999.99"
    @ w,59 say "|"
    if zvat00_znak="F"
      exit
    endif
    w=w+1
    @ w,0 say "|"
    @ w,2 say zvat_f picture "99"
    @ W,18 say zksAvat1_f_sum+zksCvat1_f_sum picture "999999999.99"
    @ w,42 say zksAvat2_f_sum+zksCvat2_f_sum picture "999999999.99"
    @ w,59 say "|"
    if zvat00_znak="Z"
      exit
    endif
    w=w+1
    @ w,0 say "|"
    @ w,2 say zvat_z picture "99"
    @ W,18 say zksAvat1_z_sum+zksCvat1_z_sum picture "999999999.99"
    @ w,42 say zksAvat2_z_sum+zksCvat2_z_sum picture "999999999.99"
    @ w,59 say "|"
    exit
  enddo
  w=w+1
  @ w,0 say "|"
  @ w,18 say "------------"
  @ w,42 say "------------"
  @ w,59 say "|"
  w=w+1
  @ w,0 say "|"
  @ w,10 say "Razem:"
  @ w,18 say zksAvat1_a_sum+zksAvat1_b_sum+zksAvat1_c_sum+zksAvat1_d_sum+zksAvat1_e_sum+zksAvat1_f_sum+zksAvat1_z_sum+zksCvat1_a_sum+zksCvat1_b_sum+zksCvat1_c_sum+zksCvat1_d_sum+zksCvat1_e_sum+zksCvat1_f_sum+zksCvat1_z_sum  picture "999999999.99"
  @ w,42 say zksAvat2_a_sum+zksAvat2_b_sum+zksAvat2_c_sum+zksAvat2_d_sum+zksAvat2_e_sum+zksAvat2_f_sum+zksAvat2_z_sum+zksCvat2_a_sum+zksCvat2_b_sum+zksCvat2_c_sum+zksCvat2_d_sum+zksCvat2_e_sum+zksCvat2_f_sum+zksCvat2_z_sum  picture "999999999.99"
  @ w,59 say "|"
  w=w+1
  @ w,0 say replicate("=",60)
  w=w+2
  ldozaplaty=zksAvat1_a_sum+zksAvat1_b_sum+zksAvat1_c_sum+zksAvat1_d_sum+zksAvat1_e_sum+zksAvat1_f_sum+zksAvat1_z_sum -(zksAvat2_a_sum+zksAvat2_b_sum+zksAvat2_c_sum+zksAvat2_d_sum+zksAvat2_e_sum+zksAvat2_f_sum+zksAvat2_z_sum)+    zksCvat1_a_sum+zksCvat1_b_sum+zksCvat1_c_sum+zksCvat1_d_sum+zksCvat1_e_sum+zksCvat1_f_sum+zksCvat1_z_sum -(zksCvat2_a_sum+zksCvat2_b_sum+zksCvat2_c_sum+zksCvat2_d_sum+zksCvat2_e_sum+zksCvat2_f_sum+zksCvat2_z_sum)
  if ldozaplaty>=0
    @ w,0 say "Do zapàaty :"
    @ w,14 say ldozaplaty picture "999999999.99"
  else
    @ w,0 say "Do zwrotu :"
    @ w,14 say -1*ldozaplaty picture "999999999.99"
  endif  
  @ w,28 say "zà"
RETURN



FUNCTION RYCZBIL_RAP()
local ldozaplaty:=0
local ldatek_a:=0,ldatek_b:=0,ldatek_c:=0
local lsumrycz:=0,ludz_a:=0,ludz_b:=0,ludz_c:=0
local ldatek:=0, lpodstawa:=0
local ldo_podatku:=0
*

if empty(dbfilter())
  fwar=".t."
else
  fwar=dbfilter()
endif
fwar1=fwar+".and.kszapis$'ABC'"
set filter to &fwar1
go top
ksrubr_licz()
kssum_licz()

*ldatek_a=kj_round(sumrycz_a*zksrycz_a/100,2)
*ldatek_b=kj_round(sumrycz_b*zksrycz_b/100,2)
*ldatek_c=kj_round(sumrycz_c*zksrycz_c/100,2)

lsumrycz=sumrycz_a+sumrycz_b+sumrycz_c
ludz_a=kj_round((sumrycz_a/lsumrycz)*100,4)
ludz_b=kj_round((sumrycz_b/lsumrycz)*100,4)
ludz_c=kj_round((sumrycz_c/lsumrycz)*100,4)
if.not.(ludz_a=0.and.ludz_b=0.and.ludz_c=0)
  if .not. (ludz_a+ludz_b+ludz_c)=100
    do while.t.
      if.not.ludz_a=0
	    ludz_a=100-(ludz_b+ludz_c)
	    exit
	  endif
      if.not.ludz_b=0
	    ludz_b=100-(ludz_a+ludz_c)
	    exit
	  endif
      if.not.ludz_c=0
	    ludz_c=100-(ludz_b+ludz_a)
	    exit
	  endif		
    enddo
  endif
endif

lpodstawa=sumrycz_a+sumrycz_b+sumrycz_c
ldo_podatku=kj_round(lpodstawa-zrycz_odlicz,0)
*ldatek_a=kj_round(kj_round(ldo_podatku*(ludz_a/100),2)*(zksrycz_a/100),2)
*ldatek_b=kj_round(kj_round(ldo_podatku*(ludz_b/100),2)*(zksrycz_b/100),2)
*ldatek_c=kj_round(kj_round(ldo_podatku*(ludz_c/100),2)*(zksrycz_c/100),2)

ldatek_a=kj_round(ldo_podatku*(ludz_a/100)*(zksrycz_a/100),2)
ldatek_b=kj_round(ldo_podatku*(ludz_b/100)*(zksrycz_b/100),2)
ldatek_c=kj_round(ldo_podatku*(ludz_c/100)*(zksrycz_c/100),2)

ldatek=ldatek_a+ldatek_b+ldatek_c
***********PODATEK DOCHODOWY  /obr¢t*stawka_tyczaàtu/
w=w+1
@ w,0 say "Rozliczenie podatku dochodowego - forma ryczaàtowa"
w=w+1
@ w,0 say "=====================================    Podstawa opodatkowania..."
@ w,66 say lpodstawa picture "999999999.99"
w=w+1
@ w,0 say "| St.| Kwota     | Podatek   | Udz. |    Odliczenia od podstawy..."
@ w,66 say zrycz_odlicz picture "999999999.99"
w=w+1
@ w,0 say "| %  | [zà]      | [zà]      | %    |    Podstawa po odliczeniu..."
@ w,66 say lpodstawa-zrycz_odlicz picture "999999999.99"
w=w+1
@ w,0 say "=====================================    Podatek ................." 
@ w,66 say ldatek picture "999999999.99"
w=w+1
@ w,0 say "|"
@ w,1 say zksrycz_a picture "99.9"
@ w,5 say sumrycz_a picture "999999999.99"
@ w,17 say ldatek_a picture "999999999.99"
@ w,30 say ludz_a picture "999.99"
@ w,36 say "|"
@ w,41 say "Ubezp. zdrowotne ........" 
@ w,66 say zdrowotne picture "999999999.99"
w=w+1
@ w,0 say "|"
@ w,1 say zksrycz_b picture "99.9"
@ w,5 say sumrycz_b picture "999999999.99"
@ w,17 say ldatek_b picture "999999999.99"
@ w,30 say ludz_b picture "999.99"
@ w,36 say "|"
w=w+1
@ w,0 say "|"
@ w,1 say zksrycz_c picture "99.9"
@ w,5 say sumrycz_c picture "999999999.99"
@ w,17 say ldatek_c picture "999999999.99"
@ w,30 say ludz_c picture "999.99"
@ w,36 say "|"
@ w,41 say "PODATEK DO ZAPùATY ......" 
if (ldatek-zdrowotne)>0
  @ w,66 say kj_round(ldatek-zdrowotne,1) picture "999999999.99"
else
  @ w,66 say 0 picture "999999999.99"
endif  
@ w,66 say ""


***********VAT
w=w+1
@ w,0 say replicate("=",37)
  w=w+3
  @ w,0 say "Rozliczenie podateku VAT z rozbiciem na stawki"
  w=w+1
  @ w,0 say replicate("=",60)
  w=w+1
  @ w,0 say "| Stawaka       Podatek naleæny       Podatek naliczony    |"
  w=w+1
  @ w,0 say replicate("=",60)
  w=w+1
  @ w,0 say "|"
  @ w,59 say "|"
  do while.t.
    if zvat00_znak="A"
      exit
    endif
    w=w+1
    @ w,0 say "|"
    @ w,2 say zvat_a picture "99"
    @ W,18 say zksAvat1_a_sum+zksCvat1_a_sum picture "999999999.99"
    @ w,42 say zksAvat2_a_sum+zksCvat2_a_sum picture "999999999.99"
    @ w,59 say "|"
    if zvat00_znak="B"
      exit
    endif  
    w=w+1
    @ w,0 say "|"
    @ w,2 say zvat_b picture "99"
    @ W,18 say zksAvat1_b_sum+zksCvat1_b_sum picture "999999999.99"
    @ w,42 say zksAvat2_b_sum+zksCvat2_b_sum picture "999999999.99"
    @ w,59 say "|"
    if zvat00_znak="C"
      exit
    endif
    w=w+1
    @ w,0 say "|"
    @ w,2 say zvat_c picture "99"
    @ W,18 say zksAvat1_c_sum+zksCvat1_c_sum picture "999999999.99"
    @ w,42 say zksAvat2_c_sum+zksCvat2_c_sum picture "999999999.99"
    @ w,59 say "|"
    if zvat00_znak="D"
      exit
    endif
    w=w+1
    @ w,0 say "|"
    @ w,2 say zvat_d picture "99"
    @ W,18 say zksAvat1_d_sum+zksCvat1_d_sum picture "999999999.99"
    @ w,42 say zksAvat2_d_sum+zksCvat2_d_sum picture "999999999.99"
    @ w,59 say "|"
    if zvat00_znak="E"
      exit
    endif
    w=w+1
    @ w,0 say "|"
    @ w,2 say zvat_e picture "99"
    @ W,18 say zksAvat1_e_sum+zksCvat1_e_sum picture "999999999.99"
    @ w,42 say zksAvat2_e_sum+zksCvat2_e_sum picture "999999999.99"
    @ w,59 say "|"
    if zvat00_znak="F"
      exit
    endif
    w=w+1
    @ w,0 say "|"
    @ w,2 say zvat_f picture "99"
    @ W,18 say zksAvat1_f_sum+zksCvat1_f_sum picture "999999999.99"
    @ w,42 say zksAvat2_f_sum+zksCvat2_f_sum picture "999999999.99"
    @ w,59 say "|"
    if zvat00_znak="Z"
      exit
    endif
    w=w+1
    @ w,0 say "|"
    @ w,2 say zvat_z picture "99"
    @ W,18 say zksAvat1_z_sum+zksCvat1_z_sum picture "999999999.99"
    @ w,42 say zksAvat2_z_sum+zksCvat2_z_sum picture "999999999.99"
    @ w,59 say "|"
    exit
  enddo
  w=w+1
  @ w,0 say "|"
  @ w,18 say "------------"
  @ w,42 say "------------"
  @ w,59 say "|"
  w=w+1
  @ w,0 say "|"
  @ w,10 say "Razem:"
  @ w,18 say zksAvat1_a_sum+zksAvat1_b_sum+zksAvat1_c_sum+zksAvat1_d_sum+zksAvat1_e_sum+zksAvat1_f_sum+zksAvat1_z_sum+zksCvat1_a_sum+zksCvat1_b_sum+zksCvat1_c_sum+zksCvat1_d_sum+zksCvat1_e_sum+zksCvat1_f_sum+zksCvat1_z_sum  picture "999999999.99"
  @ w,42 say zksAvat2_a_sum+zksAvat2_b_sum+zksAvat2_c_sum+zksAvat2_d_sum+zksAvat2_e_sum+zksAvat2_f_sum+zksAvat2_z_sum+zksCvat2_a_sum+zksCvat2_b_sum+zksCvat2_c_sum+zksCvat2_d_sum+zksCvat2_e_sum+zksCvat2_f_sum+zksCvat2_z_sum  picture "999999999.99"
  @ w,59 say "|"
  w=w+1
  @ w,0 say replicate("=",60)
  w=w+2
  ldozaplaty=zksAvat1_a_sum+zksAvat1_b_sum+zksAvat1_c_sum+zksAvat1_d_sum+zksAvat1_e_sum+zksAvat1_f_sum+zksAvat1_z_sum -(zksAvat2_a_sum+zksAvat2_b_sum+zksAvat2_c_sum+zksAvat2_d_sum+zksAvat2_e_sum+zksAvat2_f_sum+zksAvat2_z_sum)+    zksCvat1_a_sum+zksCvat1_b_sum+zksCvat1_c_sum+zksCvat1_d_sum+zksCvat1_e_sum+zksCvat1_f_sum+zksCvat1_z_sum -(zksCvat2_a_sum+zksCvat2_b_sum+zksCvat2_c_sum+zksCvat2_d_sum+zksCvat2_e_sum+zksCvat2_f_sum+zksCvat2_z_sum)
  if ldozaplaty>=0
    @ w,0 say "Do zapàaty :"
    @ w,14 say ldozaplaty picture "999999999.99"
  else
    @ w,0 say "Do zwrotu :"
    @ w,14 say -1*ldozaplaty picture "999999999.99"
  endif  
  @ w,28 say "zà"

RETURN




*************KONIEC RAPORT‡W

FUNCTION PROGI_GET()
local ek,select:=select()
save screen to ek
g_tlo()
kj_okno(5,18,13," Stopy oraz progi podatkowe                ",5)
@  7,20 say "Stopa pierwsza .........."
@  8,20 say "Stopa druga ............."
@  9,20 say "Stopa trzecia ..........."
@ 11,20 say "Odliczenie pierwsze ....."
@ 12,20 say "Odliczenie drugie ......."
@ 13,20 say "Odliczenie trzecie ......"
@ 15,20 say "Pr¢g drugi .............."
@ 16,20 say "Pr¢g trzeci ............."
set cursor on
@ 7,46 get zrstopa1
@ 8,46 get zrstopa2
@ 9,46 get zrstopa3
@ 11,46 get zrdolicz1
@ 12,46 get zrdolicz2
@ 13,46 get zrdolicz3
@ 15,46 get zrprog2
@ 16,46 get zrprog3
read
set cursor off
if.not.lastkey()=27
  set default to &set_serwer
  select &kssetup_sel
  if file("kssetup.dbf")
    if kj_use("kssetup",.f.,3)
      if reclock(5)      
	    replace rstopa1 with zrstopa1,rstopa2 with zrstopa2,rstopa3 with zrstopa3
	    replace rdolicz1 with zrdolicz1,rdolicz2 with zrdolicz2
	    replace rdolicz3 with zrdolicz3,rprog2 with zrprog2,rprog3 with zrprog3
	    unlock
	  endif  
      use
    endif
  endif
endif
restore screen from ek  
select &select
RETURN

      

FUNCTION STAWKIRYCZ_GET()
local ek,select:=select()
save screen to ek
g_tlo()
kj_okno(5,18,8," Stawki podatku ryczaàtowego               ",5)
@  7,20 say "Stawka pierwsza ........."
@  8,20 say "Stawka druga ............"
@  9,20 say "Stawka trzecia .........."
set cursor on
@ 7,46 get zksrycz_a
@ 8,46 get zksrycz_b
@ 9,46 get zksrycz_c
read
set cursor off
if.not.lastkey()=27
  set default to &set_serwer
  select &kssetup_sel
  if file("kssetup.dbf")
    if kj_use("kssetup",.f.,3)
      if reclock(5)      
	    replace ksrycz_a with zksrycz_a,ksrycz_b with zksrycz_b
	    replace ksrycz_c with zksrycz_c
	    unlock
	  endif  
      use
    endif
  endif
endif
restore screen from ek  
select &select
RETURN


FUNCTION TABULOGRAM()
local lstron:=1
if empty(dbfilter())
  fwar=".t."
else
  fwar=dbfilter()
endif
fwar1=fwar+".and.kszapis$'AB'"
set filter to &fwar1
go top
ksrubr_licz()
kssum_licz()
if zlpt15
  dziel=0  
else
  dziel=1
endif

do while.t.
  rap()
  if dziel=1
    dziel=2
  else
    exit
  endif
enddo  
RETURN

FUNCTION TABUL_TYT()
local lmies_num:=f_tmiesiac, lmies_naz:=""
lmies_naz=mies_nazwa(f_tmiesiac)
w=0
@ w,0 say &zdr_kkond+zfirnaz+&zdr_kond
w=w+1
@ w,0 say zlic1
do case
  case zokres_def=1
    @ w,39 say "Za dzie‰ :"
    @ w,50 say f_tdat1
    @ w,80 say "TABULOGRAM KOMPUTEROWY "
    w=w+1
  case zokres_def=2
    @ w,37 say "Za miesiac :"
    @ w,50 say lmies_naz
    @ w,pcol()+3 say zrok
    @ w,pcol()+1 say "r."
    @ w,80 say "TABULOGRAM KOMPUTEROWY NR"
    @ w,106 say f_tmiesiac picture "99"
    @ w,108 say "/"
    @ w,109 say year(daf)
    w=w+1
  case zokres_def=3
    *@ w,40 say "Miesiac :"
	@ w,30 say "Za okres od dnia "
    @ w,47 say f_tdat1
	@ w,58 say "do dnia "
	@ w,66 say f_tdat2
    @ w,80 say "TABULOGRAM KOMPUTEROWY "
    w=w+1		
endcase
RETURN


FUNCTION TYTRAP(pstron)
local lmiesiac:=space(15)
tabul_tyt()
do case
  case dziel=0
    @ w,100 say "Strona :"
    @ w,108 say pstron picture "999"
    @ prow()+1,0 say '-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------'
    @ prow()+1,0 say '|    |  |  Nr    |          kontrahent           |     opis       |              przych¢d             |zak. mater.|  koszty   |                    wydatki (koszty)                       |         |'
    @ prow()+1,0 say '| Lp.|Dz| dowodu |-------------------------------|   zdarzenia    |-----------------------------------|podstawow. |  uboczne  |----------------------------------------------------------------------'
    @ prow()+1,0 say '|    |  | ksi©go-|imi© i nazwisko|     adres     |  gospodarczego |obr.ze sprz| pozostaàe |   RAZEM   | i towar¢w |  zakupu   |reprezenta-|wynagrodze-| pozostaàe |   razem   |           |  uwagi  |'
    @ prow()+1,0 say '|    |  |  wego  |    (firma)    |               |                |tow.  i usà| przychody | przych¢d  |handlowych |           |cji i rekl.|nie got/nat|  wydatki  |  wydatki  |           |         |'
    @ prow()+1,0 say '|----|--|--------|---------------|---------------|----------------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|---------|'
	@ prow()+1,0 say '| 1  |2 |   3    |       4       |        5      |        6       |     7     |      8    |     9     |    10     |     11    |   12      |     13    |     14    |     15    |     16    |    17   |'
    @ prow()+1,0 say '|----|--|--------|---------------|---------------|----------------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|---------|'
  case dziel=1
    @ w,100 say "Strona A"
	@ w,108 say pstron picture "999"
    @ prow()+1,0 say '-------------------------------------------------------------------------------------------------------------------'
    @ prow()+1,0 say '|    |  |  Nr    |          kontrahent           |     opis       |              przych¢d             |zak. mater.|'
    @ prow()+1,0 say '| Lp.|Dz| dowodu |-------------------------------|   zdarzenia    |-----------------------------------|podstawow. |'
    @ prow()+1,0 say '|    |  | ksiego-|imi© i nazwisko|     adres     |  gospodarczego |obr.ze sprz| pozostaàe |   RAZEM   | i towar¢w |'
    @ prow()+1,0 say '|    |  |  wego  |    (firma)    |               |                |tow.  i usà| przychody | przych¢d  |handlowych |'
    @ prow()+1,0 say '|----|--|--------|---------------|---------------|----------------|-----------|-----------|-----------|-----------|'
    @ prow()+1,0 say '| 1  |2 |   3    |       4       |        5      |        6       |     7     |      8    |     9     |    10     |'
    @ prow()+1,0 say '|----|--|--------|---------------|---------------|----------------|-----------|-----------|-----------|-----------|'
  case dziel=2
	@ w,100 say "Strona B"		
	@ w,108 say pstron picture "999"
    @ prow()+1,0 say '-----------------------------------------------------------------------------------'
    @ prow()+1,0 say '|  koszty   |                    wydatki (koszty)                       |         |'
    @ prow()+1,0 say '|  uboczne  |----------------------------------------------------------------------'
    @ prow()+1,0 say '|  zakupu   |reprezenta-|wynagrodze-| pozostaàe |   razem   |           |  uwagi  |'
    @ prow()+1,0 say '|           |cji i rekl.|nie got/nat|  wydatki  |  wydatki  |           |         |'
    @ prow()+1,0 say '|-----------|-----------|-----------|-----------|-----------|-----------|---------|'
	@ prow()+1,0 say '|     11    |   12      |     13    |     14    |     15    |     16    |    17   |'
    @ prow()+1,0 say '|-----------|-----------|-----------|-----------|-----------|-----------|---------|'
endcase
w=prow()+1
RETURN


FUNCTION RAP() 
local str:=1
local sep:='|----|--|--------|---------------|---------------|----------------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|---------|'
declare suma[13],folio[13]
for i=1 to 13
 suma[i]:=0
 folio[i]:=0
next
*tabul_tyt()
tytrap(str)
go top
do while.not.eof()
  ks_lad()  
  if w>zks_dl
    ksstopa()
    eject
	w=0
	str=str+1
	for i=1 to 13
	  folio[i]=folio[i]+suma[i]
	  suma[i]=0
	next
	tytrap(str)
  endif

do case
  case zksrubryka=7
    suma[1]=suma[1]+ks_net()
  case zksrubryka=8
    suma[2]=suma[2]+ks_net()
  case zksrubryka=10
    suma[4]=suma[4]+ks_net()
  case zksrubryka=11
    suma[5]=suma[5]+ks_net()
  case zksrubryka=12
    suma[6]=suma[6]+ks_net()
  case zksrubryka=13
    suma[7]=suma[7]+ks_net()
  case zksrubryka=14
    suma[8]=suma[8]+ks_net()
  case zksrubryka=18    &&amortyzacja jednorazowa
    suma[9]=suma[9]+ks_net()
endcase

wiersz()
  w=w+1  
  do case
    case dziel=0
      @ w,0 say sep
    case dziel=1
      @ w,0 say substr(sep,1,115)
    case dziel=2
      @ w,0 say substr(sep,115)
  endcase
  w=w+1
  skip
enddo
ksstopa()
eject
w=0
RETURN

FUNCTION KSSTOPA()
local t[13]
local sum:= '                                                 |                |           |           |           |           |           |           |           |           |           |           |         |'
local lin1:='|------------------------------------------------|----------------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|---------|'
local lin2:='                                                 ----------------------------------------------------------------------------------------------------------------------------------------------------'
suma[3]=suma[1]+suma[2]
suma[10]=suma[6]+suma[7]+suma[8]+suma[9]
suma[8]=suma[8]+suma[9]
for k=1 to 13
   t[k]=0
next
do case
  case dziel=0
    @ w,0 say lin1
  case dziel=1
    @ w,0 say substr(lin1,1,115)
  case dziel=2
	@ w,0 say substr(lin1,115) 
endcase
for i=1 to 3
  sum:='                                                 |                |           |           |           |           |           |           |           |           |           |           |         |'

  do case
    case i=1
	  for k=1 to 13
	    t[k]=suma[k]
	  next
      sum=stuff(sum,51,16," Suma folio     ")
    case i=2
	  for k=1 to 13
	    t[k]=folio[k]
	  next
	  sum=stuff(sum,51,16," Przen. z folio ")
    case i=3
	  for k=1 to 13
	    t[k]=suma[k]+folio[k]
	  next	
	  sum=stuff(sum,51,16," Razem          ")  
  endcase
  
  if t[1]#0
    sum=stuff(sum,68,11,str(t[1],11,2))
  endif
  if t[2]#0
    sum=stuff(sum,80,11,str(t[2],11,2))
  endif
  if t[3]#0
    sum=stuff(sum,92,11,str(t[3],11,2))
  endif
  if t[4]#0
    sum=stuff(sum,104,11,str(t[4],11,2))
  endif
  if t[5]#0
    sum=stuff(sum,116,11,str(t[5],11,2))
  endif
 if t[6]>0
   sum=stuff(sum,128,11,str(t[6],11,2))
 endif
 if t[7]>0
   sum=stuff(sum,140,11,str(t[7],11,2))
 endif
 if t[8]#0
   sum=stuff(sum,152,11,str(t[8],11,2))
 endif
 if t[10]>0
   sum=stuff(sum,164,11,str(t[10],11,2))
 endif

* if t[12]>0
*   sum=stuff(sum,199,11,str(t[12],11,2))
* endif

  w=w+1
  do case
    case dziel=0
      @ w,0 say sum
      w=w+1
      @ w,0 say lin2
    case dziel=1
      @ w,0 say substr(sum,1,115)
      w=w+1
      @ w,0 say substr(lin2,1,115)
    case dziel=2
      @ w,0 say substr(sum,115)
      w=w+1
      @ w,0 say substr(lin2,115)
  endcase

next
RETURN

FUNCTION WIERSZ()
local wtxt:= '|    |  |        |               |               |                |           |           |           |           |           |           |           |           |           |           |         |'
local wtxt1:='|    |  |        |               |               |                |           |           |           |           |           |           |           |           |           |           |         |'
local lksdow:=zksndok
local lksnaz:=space(100),lksadr:=space(100)
local len1:=len(alltrim(zksnaz1)),len2:=len(alltrim(zksnaz2))
local len3:=len(alltrim(zksulica)),len4:=len(alltrim(zksmiasto))
lksnaz=stuff(lksnaz,1,len1,alltrim(zksnaz1))
lksnaz=substr(stuff(lksnaz,2+len1,len2,alltrim(zksnaz2)),1,60)
lksadr=stuff(lksadr,1,len3,alltrim(zksulica))
lksadr=substr(stuff(lksadr,2+len3,len4,alltrim(zksmiasto)),1,60)
*if .not. kszak
*if zksrubryka=7.or.zksrubryka=8
*  lksdow=ndok_druk(lksdow)
*endif
wtxt=stuff(wtxt,2,4,str(zkspoz,4))
wtxt=stuff(wtxt,7,2,str(day(zksdatdok),2))
wtxt=stuff(wtxt,10,8,substr(lksdow,1,8))
wtxt=stuff(wtxt,19,15,substr(lksnaz,1,15))
wtxt=stuff(wtxt,35,15,substr(lksadr,1,15))
wtxt=stuff(wtxt,51,15,substr(zksopis,1,15))
wtxt=stuff(wtxt,188,9,substr(zksuwag,1,9))

if zksrubryka=7
  wtxt=stuff(wtxt,68,11,str(ks_net(),11,2))
endif
if zksrubryka=8
  wtxt=stuff(wtxt,80,11,str(ks_net(),11,2))
endif
if zksrubryka=7.or.zksrubryka=8
  wtxt=stuff(wtxt,92,11,str(ks_net(),11,2))
endif
if zksrubryka=10
  wtxt=stuff(wtxt,104,11,str(ks_net(),11,2))
endif
if zksrubryka=11
  wtxt=stuff(wtxt,116,11,str(ks_net(),11,2))
endif
if zksrubryka=12
  wtxt=stuff(wtxt,128,11,str(ks_net(),11,2))
endif
if zksrubryka=13
  wtxt=stuff(wtxt,140,11,str(ks_net(),11,2))
endif
if zksrubryka=14
  wtxt=stuff(wtxt,152,11,str(ks_net(),11,2))
endif
if zksrubryka=18
  wtxt=stuff(wtxt,152,11,str(ks_net(),11,2))
endif
if zksrubryka=12.or.zksrubryka=13.or.zksrubryka=14.or.zksrubryka=18
  wtxt=stuff(wtxt,164,11,str(ks_net(),11,2))
endif

do case
  case dziel=0
    @ w,0 say wtxt
  case dziel=1
    @ w,0 say substr(wtxt,1,115)
  case dziel=2
    @ w,0 say substr(wtxt,115)		
endcase

if substr(lksnaz,16,15)#space(15).or.substr(lksadr,16,15)#space(15).or.substr(zksndok,9,7)#space(7).or.substr(ksuwag,10,9)#space(9).or.substr(ksopis,16,15)#space(15)
  wtxt1='|    |  |        |               |               |                |           |           |           |           |           |           |           |           |           |           |         |'
  wtxt1=stuff(wtxt1,10,7,substr(zksndok,9,7))
  wtxt1=stuff(wtxt1,19,15,substr(lksnaz,16,15))
  wtxt1=stuff(wtxt1,35,15,substr(lksadr,16,15))
  wtxt1=stuff(wtxt1,51,15,substr(zksopis,16,15))
  wtxt1=stuff(wtxt1,188,9,substr(zksuwag,10,9))
  w=w+1
  do case
    case dziel=0
      @ w,0 say wtxt1
    case dziel=1
      @ w,0 say substr(wtxt1,1,115)
    case dziel=2
      @ w,0 say substr(wtxt1,115)		
  endcase  
endif
if substr(lksnaz,31,15)#space(15).or.substr(lksadr,31,15)#space(15).or.substr(ksuwag,19,9)#space(9)
  wtxt1='|    |  |        |               |               |                |           |           |           |           |           |           |           |           |           |           |         |'
  wtxt1=stuff(wtxt1,19,15,substr(lksnaz,31,15))
  wtxt1=stuff(wtxt1,35,15,substr(lksadr,31,15))
  wtxt1=stuff(wtxt1,188,9,substr(zksuwag,19,9))
  w=w+1
  do case
    case dziel=0
      @ w,0 say wtxt1
    case dziel=1
      @ w,0 say substr(wtxt1,1,115)
    case dziel=2
      @ w,0 say substr(wtxt1,115)		
  endcase  
endif
if substr(lksnaz,46,15)#space(15).or.substr(lksadr,46,15)#space(15).or..not.empty(substr(ksuwag,28,9))
  wtxt1='|    |  |        |               |               |                |           |           |           |           |           |           |           |           |           |           |         |'
  wtxt1=stuff(wtxt1,19,15,substr(lksnaz,46,15))
  wtxt1=stuff(wtxt1,35,15,substr(lksadr,46,15))
  wtxt1=stuff(wtxt1,188,3,substr(zksuwag,28,3))
  w=w+1
  do case
    case dziel=0
      @ w,0 say wtxt1
    case dziel=1
      @ w,0 say substr(wtxt1,1,115)
    case dziel=2
      @ w,0 say substr(wtxt1,115)		
  endcase  
endif
RETURN

FUNCTION KS_NET()
local lkwota:=zks_a+zks_b+zks_c+zks_d+zks_e+zks_f+zks_z,lbrut:=0,lvat:=0
if.not.zksnetto
  lbrut=zks_a+zks_b+zks_c+zks_d+zks_e+zks_f+zks_z
  lvat=zksvat_a+zksvat_b+zksvat_c+zksvat_d+zksvat_e+zksvat_f+zksvat_z
  lkwota=lbrut-lvat
endif
RETURN lkwota

FUNCTION KSREJVAT()
local ek,lcolor:=setcolor(),lpoz:=0,lkon:=space(120)
public zdoktyp:=alltrim(substr(zan_txt,1,20))
public_rap()
public_srap()
zrap_zer()
zsrap_zer()
rapwar=.t.
do case
  case zokres_def=1
    rapwar="ksdatdok=f_tdat1.and..not.ksanul"
  case zokres_def=2
    rapwar="month(ksdatdok)=f_tmiesiac.and.year(ksdatdok)=zrok.and..not.ksanul"	
  case zokres_def=3
    rapwar="max(f_tdat1,ksdatdok)=ksdatdok.and.min(f_tdat2,ksdatdok)=ksdatdok.and..not.ksanul"
endcase
if.not.zknum=0
  rapwar=rapwar+".and.dkontrah=zknum"
endif

*kj_okno(4,20,4, "  C z e k a j  ! !                      ",2)
*set color to n/w*
*@ 6,28 say "Trwaj• operacje dyskowe."
setcolor(lcolor)
select &ks_sel
rapwar=rapwar+".and."+zdbfilter
set filter to &rapwar
go top

if zdruk_def=1
  if.not.start_druk()
    set device to screen
 	return .f.
  endif
else
  plik="wydruki\rejvat.txt"
  set printer to &plik
endif
*
*
set device to printer

ksrejvat_tyt()
w=prow()+1
@ w,0 say "|"
@ w,128 say "|"
*dl=52
do while.not.eof()
  **
  if w>zvat_dl
    eject
	w=0
*	str=str+1
    ksrej_tyt()
    w=prow()+1
    @ w,0 say "|"
    @ w,128 say "|"
  endif  
  **
  lpoz=lpoz+1
  ks_lad()
  ksdok_licz()
  len1=len(alltrim(zksnaz1))
  len2=len(alltrim(zksnaz2))
  len3=len(alltrim(zksulica))
  len4=len(alltrim(zksmiasto))
  lkon=stuff(space(140),1,len1,alltrim(zksnaz1))
  len=len1+3
  lkon=stuff(lkon,len,len2,alltrim(zksnaz2))
  len=len+len2+2
  lkon=stuff(lkon,len,len3,alltrim(zksulica))  
  len=len+len3+2
  lkon=stuff(lkon,len,len4,alltrim(zksmiasto))    

    zrnet_a=zrnet_a+zksnet_a  
    zrnet_b=zrnet_b+zksnet_b  
    zrnet_c=zrnet_c+zksnet_c  
    zrnet_d=zrnet_d+zksnet_d  
    zrnet_e=zrnet_e+zksnet_e  
    zrnet_f=zrnet_f+zksnet_f  
    zrnet_z=zrnet_z+zksnet_z
    zrvat_a=zrvat_a+zksvat_a    
    zrvat_b=zrvat_b+zksvat_b    
    zrvat_c=zrvat_c+zksvat_c    
    zrvat_d=zrvat_d+zksvat_d    
    zrvat_e=zrvat_e+zksvat_e    
    zrvat_f=zrvat_f+zksvat_f
    zrbrut_a=zrbrut_a+zksbrut_a        
    zrbrut_b=zrbrut_b+zksbrut_b        
    zrbrut_c=zrbrut_c+zksbrut_c        
    zrbrut_d=zrbrut_d+zksbrut_d        
    zrbrut_e=zrbrut_e+zksbrut_e        
    zrbrut_f=zrbrut_f+zksbrut_f        
    zrbrut_z=zrbrut_z+zksbrut_z        

    zrnet_all=zrnet_all+zksnet_all
    zrvat_all=zrvat_all+zksvat_all
    zrbrut_all=zrbrut_all+zksbrut_all
    
	**Wiersz
	
    w=w+1
	@ w,0 say "|"
	@ w,1 say lpoz picture "999"
	@ w,6 say zksdatdok
	@ w,17 say zksndok
	@ w,33 say zksnip
  	@ w,48 say substr(lkon,1,30)
	lbyl=0
    lbylkon=.f.
	if.not.zks_a=0.or..not.zksvat_a=0
	  if.not.zvatexp_znak="A"
	    @ w,80 say zvat_a picture "99"	
	  else
	    @ w,80 say "exp"
	  endif	
      @ w,83 say zksnet_a picture "999999999.99"	
	  @ w,99 say zksvat_a picture "999999999.99"	
	  @ w,115 say zksbrut_a  picture "999999999.99"	
	  @ w,128 say "|"	
	  lbyl=lbyl+1
	endif
    if.not.empty(substr(lkon,31)).and.lbyl=1.and..not.lbylkon
	  lbylkon=.t.
	  w=w+1
	  @ w,0 say "|"
	  @ w,6 say substr(lkon,31,72)
      @ w,128 say "|"
	endif
    if.not.zks_b=0.or..not.zksvat_b=0
      if lbyl=1.and.empty(substr(lkon,31)).or.lbyl>1
	    w=w+1
		@ w,0 say "|"
	  endif
	  if.not.zvatexp_znak="B"
	    @ w,80 say zvat_b picture "99"	
	  else
	    @ w,80 say "exp"
	  endif	
	  @ w,83 say zksnet_b picture "999999999.99"	
	  @ w,99 say zksvat_b picture "999999999.99"	
	  @ w,115 say zksbrut_b  picture "999999999.99"	
	  @ w,128 say "|"	
	  lbyl=lbyl+1
	endif
    if.not.empty(substr(lkon,31)).and.lbyl=1.and..not.lbylkon
	  lbylkon=.t.
	  w=w+1
	  @ w,0 say "|"
	  @ w,6 say substr(lkon,31,72)
      @ w,128 say "|"
	endif
    if.not.zks_c=0.or..not.zksvat_c=0
      if lbyl=1.and.empty(substr(lkon,31)).or.lbyl>1
	    w=w+1
		@ w,0 say "|"
	  endif
	  if.not.zvatexp_znak="C"
	    @ w,80 say zvat_c picture "99"	
	  else
	    @ w,80 say "exp"
	  endif	
      @ w,83 say zksnet_c picture "999999999.99"	
	  @ w,99 say zksvat_c picture "999999999.99"	
	  @ w,115 say zksbrut_c  picture "999999999.99"	
	  @ w,128 say "|"	
	  lbyl=lbyl+1
	endif
    if.not.empty(substr(lkon,31)).and.lbyl=1.and..not.lbylkon
	  lbylkon=.t.
	  w=w+1
	  @ w,0 say "|"
	  @ w,6 say substr(lkon,31,72)
      @ w,128 say "|"
	endif
    if.not.zks_d=0.or..not.zksvat_d=0
      if lbyl=1.and.empty(substr(lkon,31)).or.lbyl>1
	    w=w+1
		@ w,0 say "|"
	  endif
	  if.not.zvatexp_znak="D"
	    @ w,80 say zvat_d picture "99"	
	  else
	    @ w,80 say "exp"
	  endif	
      @ w,83 say zksnet_d picture "999999999.99"	
	  @ w,99 say zksvat_d picture "999999999.99"	
	  @ w,115 say zksbrut_d  picture "999999999.99"	
	  @ w,128 say "|"	
	  lbyl=lbyl+1
	endif
    if.not.empty(substr(lkon,31)).and.lbyl=1.and..not.lbylkon
	  lbylkon=.t.
	  w=w+1
	  @ w,0 say "|"
	  @ w,6 say substr(lkon,31,72)
      @ w,128 say "|"
	endif
    if.not.zks_e=0.or..not.zksvat_e=0
      if lbyl=1.and.empty(substr(lkon,31)).or.lbyl>1
	    w=w+1
		@ w,0 say "|"
	  endif
	  if.not.zvatexp_znak="E"
	    @ w,80 say zvat_e picture "99"	
	  else
	    @ w,80 say "exp"
	  endif	
      @ w,83 say zksnet_e picture "999999999.99"	
	  @ w,99 say zksvat_e picture "999999999.99"	
	  @ w,115 say zksbrut_e  picture "999999999.99"	
	  @ w,128 say "|"	
	  lbyl=lbyl+1
	endif
    if.not.empty(substr(lkon,31)).and.lbyl=1.and..not.lbylkon
	  lbylkon=.t.
	  w=w+1
	  @ w,0 say "|"
	  @ w,6 say substr(lkon,31,72)
      @ w,128 say "|"
	endif
    if.not.zks_f=0.or..not.zksvat_f=0
      if lbyl=1.and.empty(substr(lkon,31)).or.lbyl>1
	    w=w+1
		@ w,0 say "|"
	  endif
	  if.not.zvatexp_znak="F"
	    @ w,80 say zvat_f picture "99"	
	  else
	    @ w,80 say "exp"
	  endif	
      @ w,83 say zksnet_f picture "999999999.99"	
	  @ w,99 say zksvat_f picture "999999999.99"	
	  @ w,115 say zksbrut_f  picture "999999999.99"	
	  @ w,128 say "|"	
	  lbyl=lbyl+1
	endif
    if.not.empty(substr(lkon,31)).and.lbyl=1.and..not.lbylkon
	  lbylkon=.t.
	  w=w+1
	  @ w,0 say "|"
	  @ w,6 say substr(lkon,31,72)
      @ w,128 say "|"
	endif	
    if.not.zks_z=0
	  if lbyl=1.and.empty(substr(lkon,31)).or.lbyl>1
	    w=w+1
		@ w,0 say "|"
	  endif
	  if.not.zvatexp_znak="Z"
	    @ w,80 say "zw "	  
	  else
	    @ w,80 say "exp"
	  endif	
      @ w,83 say zksnet_z picture "999999999.99"	
	  @ w,99 say 0 picture "999999999.99"	
	  @ w,115 say zksbrut_z  picture "999999999.99"	
	  @ w,128 say "|"	
	  lbyl=lbyl+1
	endif
    if.not.empty(substr(lkon,31)).and.lbyl=1.and..not.lbylkon
	  lbylkon=.t.
	  w=w+1
	  @ w,0 say "|"
	  @ w,6 say substr(lkon,31,72)
      @ w,128 say "|"
	endif						
	w=w+1
	@ w,0 say '|----|----------|---------------|-------------|-------------------------------|---|---------------|---------------|-------------|'
	**
  skip
enddo
***          przerwa
w=w+1
@ w,0 say '---------------------------------------------------------------------------------------------------------------------------------'
*close
***                Stopka              ****
w=w+1
@ w,0 say '                                              |            Razem :            |'
@ w,83 say zrnet_all picture "999999999.99"
@ w,99 say zrvat_all picture "999999999.99"
@ w,115 say zrbrut_all picture "999999999.99"
@ w,128 say "|"
w=w+1
@ w,0 say '                                              |            W tym ze stawk• :  |'
@ w,128 say "|"

if zrnet_a#0.or.zrvat_a#0.or.zrbrut_a#0
  w=w+1
  @ w,46 say "|"
  @ w,78 say "|"
  if.not.zvatexp_znak="A"
    @ w,80 say zvat_a picture "99"
    @ w,82 say "%"
  else
    @ w,80 say "exp"  
  endif	
  @ w,83 say zrnet_a picture "999999999.99"
  @ w,99 say zrvat_a picture "999999999.99"
  @ w,115 say zrbrut_a picture "999999999.99"
  @ w,128 say "|"
endif
if zrnet_b#0.or.zrvat_b#0.or.zrbrut_b#0
  w=w+1
  @ w,46 say "|"
  @ w,78 say "|"
  if.not.zvatexp_znak="B"
    @ w,80 say zvat_b picture "99"
    @ w,82 say "%"
  else
    @ w,80 say "exp"  
  endif	
  @ w,83 say zrnet_b picture "999999999.99"
  @ w,99 say zrvat_b picture "999999999.99"
  @ w,115 say zrbrut_b picture "999999999.99"
  @ w,128 say "|"
endif
if zrnet_c#0.or.zrvat_c#0.or.zrbrut_c#0
  w=w+1
  @ w,46 say "|"
  @ w,78 say "|"
  if.not.zvatexp_znak="C"
    @ w,80 say zvat_c picture "99"
    @ w,82 say "%"
  else
    @ w,80 say "exp"  
  endif	  
  @ w,83 say zrnet_c picture "999999999.99"
  @ w,99 say zrvat_c picture "999999999.99"
  @ w,115 say zrbrut_c picture "999999999.99"
  @ w,128 say "|"
endif
if zrnet_d#0.or.zrvat_d#0.or.zrbrut_d#0
  w=w+1
  @ w,46 say "|"
  @ w,78 say "|"
  if.not.zvatexp_znak="D"
    @ w,80 say zvat_d picture "99"
    @ w,82 say "%"
  else
    @ w,80 say "exp"  
  endif	  
  @ w,83 say zrnet_d picture "999999999.99"
  @ w,99 say zrvat_d picture "999999999.99"
  @ w,115 say zrbrut_d picture "999999999.99"
  @ w,128 say "|"
endif
if zrnet_e#0.or.zrvat_e#0.or.zrbrut_e#0
  w=w+1
  @ w,46 say "|"
  @ w,78 say "|"
  if.not.zvatexp_znak="E"
    @ w,80 say zvat_e picture "99"
    @ w,82 say "%"
  else
    @ w,80 say "exp"  
  endif	  
  @ w,83 say zrnet_e picture "999999999.99"
  @ w,99 say zrvat_e picture "999999999.99"
  @ w,115 say zrbrut_e picture "999999999.99"
  @ w,128 say "|"
endif
if zrnet_f#0.or.zrvat_f#0.or.zrbrut_f#0
  w=w+1
  @ w,46 say "|"
  @ w,78 say "|"
  if.not.zvatexp_znak="F"
    @ w,80 say zvat_f picture "99"
    @ w,82 say "%"
  else
    @ w,80 say "exp"  
  endif	  
  @ w,83 say zrnet_f picture "999999999.99"
  @ w,99 say zrvat_f picture "999999999.99"
  @ w,115 say zrbrut_f picture "999999999.99"
  @ w,128 say "|"
endif
if zrnet_z#0
  w=w+1
  @ w,46 say "|"
  @ w,78 say "|"
  if.not.zvatexp_znak="Z"
    @ w,80 say "zw."
  else
    @ w,80 say "exp"  
  endif	  
  @ w,83 say zrnet_z picture "999999999.99"
  @ w,128 say "|"
endif

w=w+1
@ w,46 say '-----------------------------------------------------------------------------------'
eject
***
set device to screen
if.not.zdruk_def=1
  save screen to ek
  edi=edit+" wydruki\rejvat.txt"
  run &edi 
  restore screen from ek
  set cursor off   
endif
RETURN


FUNCTION KSREJVAT_TYT()
ksr_tyt()
@ prow(),0 say  &zdr_kond
    @ prow()+2,0 say '---------------------------------------------------------------------------------------------------------------------------------'
    @ prow()+1,0 say '| Lp.|          |    numer      |            K O N T R A H E N T              |St.|    WartoòÜ    |    Podatek    |    WartoòÜ  |'
    @ prow()+1,0 say '|    |  DATA    |   rachunku    |---------------------------------------------|VAT|     NETTO     |     V A T     |    BRUTTO   |'
    @ prow()+1,0 say '|    |          |   (faktury)   |    N I P    |        Nazwa i adres          | % |               |               |             |'
    @ prow()+1,0 say '|----|----------|---------------|-------------|-------------------------------|---|---------------|---------------|-------------|'
	@ prow()+1,0 say '| 1  |   2      |        3      |      4      |               5               | 6 |       7       |       8       |        9    |'
    @ prow()+1,0 say '|===============================================================================================================================|'
RETURN

FUNCTION KSREJ_TYT()
@ prow(),0 say  &zdr_kond
    @ prow()+2,0 say '---------------------------------------------------------------------------------------------------------------------------------'
    @ prow()+1,0 say '| Lp.|          |    numer      |            K O N T R A H E N T              |St.|    WartoòÜ    |    Podatek    |    WartoòÜ  |'
    @ prow()+1,0 say '|    |  DATA    |   rachunku    |---------------------------------------------|VAT|     NETTO     |     V A T     |    BRUTTO   |'
    @ prow()+1,0 say '|    |          |   (faktury)   |    N I P    |        Nazwa i adres          | % |               |               |             |'
    @ prow()+1,0 say '|----|----------|---------------|-------------|-------------------------------|---|---------------|---------------|-------------|'
	@ prow()+1,0 say '| 1  |   2      |        3      |      4      |               5               | 6 |       7       |       8       |        9    |'
    @ prow()+1,0 say '|===============================================================================================================================|'
RETURN



FUNCTION KSEWIDEN1()
local ek,lcolor:=setcolor(),lpoz:=0,lkon:=space(120)
public zdoktyp:=alltrim(substr(zan_txt,1,20))

public_rap()
public_srap()
zrap_zer()
zsrap_zer()
do case
  case zokres_def=1
    rapwar="ksdatdok=f_tdat1.and..not.ksanul"
  case zokres_def=2
    rapwar="month(ksdatdok)=f_tmiesiac.and.year(ksdatdok)=zrok.and..not.ksanul"	
  case zokres_def=3
    rapwar="max(f_tdat1,ksdatdok)=ksdatdok.and.min(f_tdat2,ksdatdok)=ksdatdok.and..not.ksanul"
endcase
if.not.zknum=0
  rapwar=rapwar+".and.dkontrah=zknum"
endif

*kj_okno(4,20,4, "  C z e k a j  ! !                      ",2)
*set color to n/w*
*@ 6,28 say "Trwaj• operacje dyskowe."
setcolor(lcolor)
select &ks_sel
rapwar=rapwar+".and."+dbfilter()
set filter to &rapwar
go top

if zdruk_def=1
  if.not.start_druk()
    set device to screen
 	return .f.
  endif
else
  plik="wydruki\rejvat.txt"
  set printer to &plik
endif

set device to printer

ksrejvat_tyt()
w=prow()+1
*@ w,0 say "|"
@ w,0 say "|EWID"
@ w,130 say "|"

do while.not.eof()

enddo
RETURN


***********************************************************  EWIDENCJA
FUNCTION KSEWIDEN()
local cykl:=0
local str:=1
*local sep:="|---|--------|---------------|------------|------------|------------|------------|--------|---------------|------------|-----------|"
local sep:="|---|----------|---------------|------------|------------|------------|------------|----------|---------------|"
declare suma[5],folio[5]
pozycja=0        && kolejny numer na wydruku
dl=52
for i=1 to 5
 suma[i]:=0
 folio[i]:=0
next
ewid_tyt(str)

rapwar=rapwar+".and.(ksrubryka=7.or.ksrubryka=8)"
set filter to &rapwar
go top

do while.not.eof()
     ks_lad()
	 ksdok_licz()
	 pozycja=pozycja+1
      if w>dl
        do stopaew
        eject
        w=0
	    str=str+1
	    for i=1 to 5
	      folio[i]=folio[i]+suma[i]
	      suma[i]=0
	    next
	    ewid_tyt(str)
      endif
      
	  do case
	    case ksryczalt=zksrycz_a
		  suma[1]=suma[1]+zksnet_all
	    case ksryczalt=zksrycz_b
		  suma[2]=suma[2]+zksnet_all
	    case ksryczalt=zksrycz_c
		  suma[3]=suma[3]+zksnet_all  		  
	  endcase
	  suma[4]=suma[4]+zksnet_all
	  *suma[5]=suma[5]+kszakup

        wierszew()
        w=w+1  
        @ w,0 say sep
        w=w+1
	skip
enddo
do stopaew
RETURN


FUNCTION EWID_TYT(stron)
local t[8]
local lmiesiac:=space(15)
w=w+1
@ w,0 say &zdr_kkond+zfirnaz+&zdr_kond
w=w+1
*@ w,0 say zlic1
t[1]:="---------------------------------------------------------------------------------------------------------------"
t[2]:="|   |  Data    | Numer dowodu, |   Kwota przychodu opodatkowanego     |  Ogolem    | Data uzy |               |"
t[3]:="|Lp.| wpisu    | na podstawie  |           wedlug stawki              | przychod   | skania   |   U W A G I   |"
t[4]:="|   |          | ktorego doko- |------------|------------|------------| w zlotych  | przycho- |               |"
t[5]:="|   |          | nano wpisu    |        %   |        %   |        %   |  (4+5+6)   | du       |               |"
t[6]:="|---|----------|---------------|------------|------------|------------|------------|----------|---------------|"
t[7]:="| 1 |   2      |       3       |      4     |      5     |     6      |      7     |    8     |       9       |"
t[8]:="|=============================================================================================================="
t[5]=stuff(t[5],34,4,str(zksrycz_a,4,1))
t[5]=stuff(t[5],47,4,str(zksrycz_b,4,1))
t[5]=stuff(t[5],60,4,str(zksrycz_c,4,1))

@ w,90 say "Strona :"
@ w,98 say stron picture "999"
 *@ w,141 say fwl
for i=1 to 8
  w=w+1
  @ w,0 say t[i]
next
w=w+1
RETURN



FUNCTION WIERSZEW()
local wtxt:="|   |          |               |            |            |            |            |          |               |"
local lz:=0
local kstxt:=space(12)
local kztxt:=space(12)
if zksnet_all<1000000.00
  kstxt=stuff(kstxt,13-len(alltrim(strj(zksnet_all))),len(alltrim(strj(zksnet_all))),alltrim(strj(zksnet_all))) 
else
  kstxt=stuff(kstxt,13-len(alltrim(str(zksnet_all,11,2))),len(alltrim(str(zksnet_all,11,2))),alltrim(str(zksnet_all,11,2))) 
endif

wtxt=stuff(wtxt,2,3,str(pozycja,3,0))
wtxt=stuff(wtxt,6,10,dtoc(zksdatdok))
wtxt=stuff(wtxt,85,10,dtoc(zksdatdok))
wtxt=stuff(wtxt,96,15,substr(ksuwag,1,15))
    wtxt=stuff(wtxt,17,15,zksndok)
  do case
    case ksryczalt=zksrycz_a
      wtxt=stuff(wtxt,33,12,kstxt)
    case ksryczalt=zksrycz_b
      wtxt=stuff(wtxt,46,12,kstxt)
    case ksryczalt=zksrycz_c
      wtxt=stuff(wtxt,59,12,kstxt)		
  endcase	
  wtxt=stuff(wtxt,72,12,kstxt)		

@ w,0 say wtxt
RETURN



PROCEDURE STOPAEW
local stxt1:=space(12)
local stxt2:=space(12)
local stxt3:=space(12)
local stxt4:=space(12)
local stxt5:=space(12)
local lz:=0
local t[5] 
local  sum:="                               |            |            |            |            |          |               |"
local lin1:="|------------------------------|------------|------------|------------|------------|----------|---------------|"
local lin2:="                               |-------------------------------------------------------------------------------"
for k=1 to 5
   t[k]=0
next
    @ w,0 say lin1
for i=1 to 3
  sum:="                               |            |            |            |            |          |               |"

  do case
    case i=1
	  for k=1 to 5
	    t[k]=suma[k]
	  next
      sum=stuff(sum,16,13,"Suma folio   ")
    case i=2
	  for k=1 to 5
	    t[k]=folio[k]
	  next
	  sum=stuff(sum,16,13,"Przen.z folio")
    case i=3
	  for k=1 to 5
	    t[k]=suma[k]+folio[k]
	  next	
	  sum=stuff(sum,16,13," Razem       ")  
  endcase
  
  
if t[1]<1000000.00
  stxt1=stuff(space(12),13-len(alltrim(strj(t[1]))),len(alltrim(strj(t[1]))),alltrim(strj(t[1]))) 
else
  stxt1=stuff(space(12),13-len(alltrim(str(t[1],11,2))),len(alltrim(str(t[1],11,2))),alltrim(str(t[1],11,2))) 
endif

if t[2]<1000000.00
  stxt2=stuff(space(12),13-len(alltrim(strj(t[2]))),len(alltrim(strj(t[2]))),alltrim(strj(t[2]))) 
else
  stxt2=stuff(space(12),13-len(alltrim(str(t[2],11,2))),len(alltrim(str(t[2],11,2))),alltrim(str(t[2],11,2))) 
endif

if t[3]<1000000.00
  stxt3=stuff(space(12),13-len(alltrim(strj(t[3]))),len(alltrim(strj(t[3]))),alltrim(strj(t[3]))) 
else
  stxt3=stuff(space(12),13-len(alltrim(str(t[3],11,2))),len(alltrim(str(t[3],11,2))),alltrim(str(t[3],11,2))) 
endif

if t[4]<1000000.00
  stxt4=stuff(space(12),13-len(alltrim(strj(t[4]))),len(alltrim(strj(t[4]))),alltrim(strj(t[4]))) 
else
  stxt4=stuff(space(12),13-len(alltrim(str(t[4],11,2))),len(alltrim(str(t[4],11,2))),alltrim(str(t[4],11,2))) 
endif

if t[5]<1000000.00
  stxt5=stuff(space(12),13-len(alltrim(strj(t[5]))),len(alltrim(strj(t[5]))),alltrim(strj(t[5]))) 
else
  stxt5=stuff(space(12),13-len(alltrim(str(t[5],11,2))),len(alltrim(str(t[5],11,2))),alltrim(str(t[5],11,2))) 
endif  
  sum=stuff(sum,33,12,stxt1)
  sum=stuff(sum,46,12,stxt2)  
  sum=stuff(sum,59,12,stxt3)      
  sum=stuff(sum,72,12,stxt4)    
  w=w+1
      @ w,0 say sum
      w=w+1
      @ w,0 say lin2
next
RETURN

FUNCTION KS_UTARG()
local lbrut_a:=0,lbrut_b:=0,lbrut_c:=0,lbrut_d:=0,lbrut_e:=0,lbrut_f:=0,lbrut_z:=0
local lbrut_all:=0,lutarg:=0
local lutbrut_a:=0,lutbrut_b:=0,lutbrut_c:=0,lutbrut_d:=0,lutbrut_e:=0,lutbrut_f:=0,lutbrut_z:=0
local lmiesiac:=month(date()),lmies_nazwa:=""
local ldrukuj:=.f.,lksieguj:=.f.
private lnet_a:=0,lnet_b:=0,lnet_c:=0,lnet_d:=0,lnet_e:=0,lnet_f:=0,lnet_z:=0
private lvat_a:=0,lvat_b:=0,lvat_c:=0,lvat_d:=0,lvat_e:=0,lvat_f:=0,lvat_z:=0
do miesiac with 4,30,lmiesiac,lmies_nazwa
f_miesiac=lmiesiac
zksdatdok=date()
ks_use()
*set filter to month(ksdatdok)=f_miesiac.and.kszapis$"AB".and.ksrubryka=10
*go top
*BROWSE()
do while .not. eof()
  ks_lad()
  ksdok_licz()
  lbrut_a=lbrut_a+zksbrut_a
  lbrut_b=lbrut_b+zksbrut_b
  lbrut_c=lbrut_c+zksbrut_c
  lbrut_d=lbrut_d+zksbrut_d
  lbrut_e=lbrut_e+zksbrut_e
  lbrut_f=lbrut_f+zksbrut_f
  lbrut_z=lbrut_z+zksbrut_z
  skip
enddo
lbrut_all=lbrut_a+lbrut_b+lbrut_c+lbrut_d+lbrut_e+lbrut_f+lbrut_z
zksudz_a=kj_round((100*lbrut_a)/lbrut_all,2)
zksudz_b=kj_round((100*lbrut_b)/lbrut_all,2)
zksudz_c=kj_round((100*lbrut_c)/lbrut_all,2)
zksudz_d=kj_round((100*lbrut_d)/lbrut_all,2)
zksudz_e=kj_round((100*lbrut_e)/lbrut_all,2)
zksudz_f=kj_round((100*lbrut_f)/lbrut_all,2)
zksudz_z=kj_round((100*lbrut_z)/lbrut_all,2)



if.not.(zksudz_a+zksudz_b+zksudz_c+zksudz_d+zksudz_e+zksudz_f+zksudz_z)=100
 if.not.(zksudz_a=0.and.zksudz_b=0.and.zksudz_c=0.and.zksudz_d=0.and.zksudz_e=0.and.zksudz_f=0.and.zksudz_z=0)
  do while .t.
    if.not.zksudz_a=0
	  zksudz_a=100-(zksudz_b+zksudz_c+zksudz_d+zksudz_e+zksudz_f+zksudz_z)
	  exit
	endif
    if.not.zksudz_b=0
	  zksudz_b=100-(zksudz_a+zksudz_c+zksudz_d+zksudz_e+zksudz_f+zksudz_z)
 	  exit
	endif	
    if.not.zksudz_c=0
	  zksudz_c=100-(zksudz_b+zksudz_a+zksudz_d+zksudz_e+zksudz_f+zksudz_z)
	  exit
	endif	
    if.not.zksudz_d=0
	  zksudz_d=100-(zksudz_b+zksudz_c+zksudz_a+zksudz_e+zksudz_f+zksudz_z)
	  exit
	endif	
    if.not.zksudz_e=0
	  zksudz_e=100-(zksudz_b+zksudz_c+zksudz_d+zksudz_a+zksudz_f+zksudz_z)
	  exit
	endif	
    if.not.zksudz_f=0
	  zksudz_f=100-(zksudz_b+zksudz_c+zksudz_d+zksudz_e+zksudz_a+zksudz_z)
	  exit
	endif	
    if.not.zksudz_z=0
	  zksudz_z=100-(zksudz_b+zksudz_c+zksudz_d+zksudz_e+zksudz_f+zksudz_a)
	  exit
	endif	
  enddo
 endif
endif
ltyt="Rejestracja utargu kwot• brutto za miesi•c  "+alltrim(lmies_nazwa)
ltyt=stuff(space(80),2,len(alltrim(ltyt)),alltrim(ltyt))
kj_okno(0,0,24,ltyt,2)
**
w=10
utarg_druk()

**
set cursor on
@ 2,2 say "Data ksi©gowania ..................."
@ 4,2 say "Kwota brutto utargu ................"
@ 6,2 say "Zaksi©gowaÜ ? ......................"
@ 7,2 say "WydrukowaÜ  ? ......................"

*if zryczalt_ks
*  @ 6,2 say "Stawka ryczaàtu ...................."
*endif
@ 2,39 get zksdatdok when s_kom("Wpisz dat© zaksi©gowania utargu")
@ 4,39 get lutarg picture "999999999.99" when s_kom("Wpisz kwot© brutto utargu")

*if zryczalt_ks
*  @ 6,39 get zksryczalt picture "99.99"
*endif
read
set cursor off
lutbrut_a=kj_round(lutarg*(zksudz_a/100),2)
lutbrut_b=kj_round(lutarg*(zksudz_b/100),2)
lutbrut_c=kj_round(lutarg*(zksudz_c/100),2)
lutbrut_d=kj_round(lutarg*(zksudz_d/100),2)
lutbrut_e=kj_round(lutarg*(zksudz_e/100),2)
lutbrut_f=kj_round(lutarg*(zksudz_f/100),2)
lutbrut_z=kj_round(lutarg*(zksudz_z/100),2)

lvat_a=kj_round((lutbrut_a * zvat_a)/(100+zvat_a),2)
lvat_b=kj_round((lutbrut_b * zvat_b)/(100+zvat_b),2)
lvat_c=kj_round((lutbrut_c * zvat_c)/(100+zvat_c),2)
lvat_d=kj_round((lutbrut_d * zvat_d)/(100+zvat_d),2)
lvat_e=kj_round((lutbrut_e * zvat_e)/(100+zvat_e),2)
lvat_f=kj_round((lutbrut_f * zvat_f)/(100+zvat_f),2)
lvat_z=kj_round((lutbrut_z * zvat_z)/(100+zvat_z),2)

lnet_a=lutbrut_a-lvat_a
lnet_b=lutbrut_b-lvat_b
lnet_c=lutbrut_c-lvat_c
lnet_d=lutbrut_d-lvat_d
lnet_e=lutbrut_e-lvat_e
lnet_f=lutbrut_f-lvat_f
lnet_z=lutbrut_z-lvat_z
w=10
utarg_druk()
set cursor on
@ 6,39 get lksieguj when s_kom(".T. - zaksi©guj utarg miesi•ca   .F. - pomi‰ ksi©gowanie")
@ 7,39 get ldrukuj when s_kom(".T. - wydrukuj utarg miesi•ca   .F. - pomi‰ drukowanie")
read
set cursor off
if lksieguj
  ks_zer()
  zksndok="UTARG /        "
  zksndok=stuff(zksndok,9,7,substr(lmies_nazwa,1,7))
  zks_a=lnet_a  
  zks_b=lnet_b  
  zks_c=lnet_c  
  zks_d=lnet_d  
  zks_e=lnet_e  
  zks_f=lnet_f  
  zks_z=lnet_z
  zksvat_a=lvat_a
  zksvat_b=lvat_b
  zksvat_c=lvat_c
  zksvat_d=lvat_d
  zksvat_e=lvat_e
  zksvat_f=lvat_f
  zksvat_z=lvat_z
  zksopis="UTARG MIESI§CA"
  zksrubryka=7
  zkspodlega=.t.
  zkszapis="A"
  zksdotycz="A"
  zksnetto=.t.
  if ks_use()
      if kj_append(3)
        ks_replac()
        unlock
	  endif	  
    close	  
  endif	
endif
if ldrukuj
  if.not.start_druk()
    set device to screen
  else
    set device to printer
    w=prow()
    utarg_druk()   	
    eject
  endif
  set device to screen
endif
RETURN

FUNCTION UTARG_DRUK()
  @ w,2 say "Podatek VAT do zapàaty liczony metod• struktury zakup¢w "
  w=w+1
  @ w,2 say replicate("=",77)
  w=w+1
  @ w,2 say "| Stawaka       Utarg NETTO           Podatek VAT            Struktura zak. |"
  w=w+1
  @ w,2 say replicate("=",77)
*  w=w+1
*  @ w,2 say "|"
*  @ w,78 say "|"
  w=w+1
  @ w,2 say "|"
  @ w,4 say zvat_a picture "99"
  @ W,20 say lnet_a picture "999999999.99"
  @ w,44 say lvat_a picture "999999999.99"
  @ w,67 say zksudz_a picture "999.999"
  @ w,78 say "|"
  w=w+1
  @ w,2 say "|"
  @ w,4 say zvat_b picture "99"
  @ W,20 say lnet_b picture "999999999.99"
  @ w,44 say lvat_b picture "999999999.99"
  @ w,67 say zksudz_b picture "999.999"
  @ w,78 say "|"
  w=w+1
  @ w,2 say "|"
  @ w,4 say zvat_c picture "99"
  @ W,20 say lnet_c picture "999999999.99"
  @ w,44 say lvat_c picture "999999999.99"
  @ w,67 say zksudz_c picture "999.999"
  @ w,78 say "|"
  w=w+1
  @ w,2 say "|"
  @ w,4 say zvat_d picture "99"
  @ W,20 say lnet_d picture "999999999.99"
  @ w,44 say lvat_d picture "999999999.99"
  @ w,67 say zksudz_d picture "999.999"
  @ w,78 say "|"
  w=w+1
  @ w,2 say "|"
  @ w,4 say zvat_e picture "99"
  @ W,20 say lnet_e picture "999999999.99"
  @ w,44 say lvat_e picture "999999999.99"
  @ w,67 say zksudz_e picture "999.999"
  @ w,78 say "|"
  w=w+1
  @ w,2 say "|"
  @ w,4 say zvat_f picture "99"
  @ W,20 say lnet_f picture "999999999.99"
  @ w,44 say lvat_f picture "999999999.99"
  @ w,67 say zksudz_f picture "999.999"
  @ w,78 say "|"
  w=w+1
  @ w,2 say "|"
  @ w,4 say zvat_z picture "99"
  @ W,20 say lnet_z picture "999999999.99"
  @ w,44 say lvat_z picture "999999999.99"
  @ w,67 say zksudz_z picture "999.999"
  @ w,78 say "|"            
  w=w+1
  @ w,2 say replicate("=",77)
  w=w+1
  @ w,2 say "|"
  @ w,5 say "Razem:"
  @ W,20 say lnet_a+lnet_b+lnet_c+lnet_d+lnet_e+lnet_f+lnet_z picture "999999999.99"
  @ w,44 say lvat_a+lvat_b+lvat_c+lvat_d+lvat_e+lvat_f+lvat_z picture "999999999.99"
  @ w,67 say "100.000 %"                
  @ w,78 say "|"
  w=w+1
  @ w,2 say replicate("=",77)  
RETURN

FUNCTION VAT7_PARAM()
local lokreswar,ek,lpoz:=1,ek1,lcolor:=setcolor()
f_tmiesiac=month(date())
zan_typ="vat7"
zokres_def=2
zdruk_def=2
zround=0
save screen to ek
kj_okno(0,0,10, "                    DOKUMENTY SPRZEDAΩY - PODSUMOWANIE                          ",2)
g_tlo()
*save screen to ek1
do while.t.
  *restore screen from ek1
  select &rap_sel
  *an_lad()  
  zestpar_say(zokres_def,zdruk_def)
  lpoz=zestd_menu(lpoz)
  if lastkey()=27
    exit
  endif
  do case
    case lpoz=1
	  ks_vat7()
	case lpoz=2
	  parget_rap()
	case lpoz=3
	  exit    
  endcase
enddo
select &rap_sel
restore screen from ek
setcolor(lcolor)
RETURN


FUNCTION KS_VAT7()
local lmiesiac:=month(date()),lmies_nazwa:="",ldrukarka:=.f.,ek
local lnet_zero:=0,lnetsum1:=0,lvatsum1:=0,lnetsum2:=0,lvatsum2:=0
local lnet_k0:=0,lnet_e0:=0,lnet_a:=0,lnet_b:=0,lnet_c:=0,lnet_d:=0
local lnet_e:=0,lnet_f:=0,lnet_z:=0
local lvat_a:=0,lvat_b:=0,lvat_c:=0,lvat_d:=0
local lvat_e:=0,lvat_f:=0,lvat_z:=0
local lzak_net_trwale:=0,lzak_vat_trwale:=0,lzak_net_pozostale:=0
local lzak_vat_pozostale:=0,lzak_net_razem:=0,lzak_vat_razem:=0
local l1zak_net_trwale:=0,l1zak_vat_trwale:=0,l1netsum2:=0,l1vatsum2:=0
local lround:=zround
if zround=0.or.zround=1
  lround=2
endif
save screen to ek
*do miesiac with 4,30,lmiesiac,lmies_nazwa
*f_miesiac=lmiesiac
zksdatdok=date()


**
if zdruk_def=2
  if.not.lastkey()=27
    plik="wydruki\vat7.txt"
    set printer to &plik
  else
    return
  endif	
else
  if.not.lastkey()=27
    ldrukarka=.t.
    if.not.start_druk()
      set device to screen
 	  return .f.
    endif
  else
    return
  endif		
endif
**
set device to printer
ks_use()
set filter to month(ksdatdok)=f_tmiesiac.and.kszapis$"AC".and.kspodlega.and..not.ksanul
go top
kssum_licz()
sprzedtxt="| Opodatkowana stawk•                                                |"
sprzedtx_a=substr(stuff(sprzedtxt,23,3,str(zvat_a,3)),1,32)
sprzedtx_b=substr(stuff(sprzedtxt,23,3,str(zvat_b,3)),1,32)
sprzedtx_c=substr(stuff(sprzedtxt,23,3,str(zvat_c,3)),1,32)
sprzedtx_d=substr(stuff(sprzedtxt,23,3,str(zvat_d,3)),1,32)
sprzedtx_e=substr(stuff(sprzedtxt,23,3,str(zvat_e,3)),1,32)
sprzedtx_f=substr(stuff(sprzedtxt,23,3,str(zvat_f,3)),1,32)
w=prow()
k=5

if zvat_a=0
  lnet_zero=lnet_zero+zksAnet1_a_sum+zksCnet1_a_sum
endif  
if zvat_b=0
  lnet_zero=lnet_zero+zksAnet1_b_sum+zksCnet1_b_sum
endif  
if zvat_c=0
  lnet_zero=lnet_zero+zksAnet1_c_sum+zksCnet1_c_sum
endif  
if zvat_d=0
  lnet_zero=lnet_zero+zksAnet1_d_sum+zksCnet1_d_sum
endif  
if zvat_e=0
  lnet_zero=lnet_zero+zksAnet1_e_sum+zksCnet1_e_sum
endif  
if zvat_f=0
  lnet_zero=lnet_zero+zksAnet1_f_sum+zksCnet1_f_sum  
endif  
*lnet_zero=lnet_zero-(zksAnet_export+zksCnet_export)

@ w,k say "ROZLICZENIE SPRZEDAΩY TOWAR‡W I USùUG ORAZ PODATKU NALEΩNEGO"
w=w+1
@ w,k say "======================================================================" 
w=w+1
@ w,k say "| Sprzedaæ                      |  WartoòÜ netto  |  Podatek naleæny |"  
*w=w+1
*@ w,k say "|                               |       w zà      |        w zà      |"  
w=w+1
@ w,k say "|-------------------------------|-----------------|------------------|" 
*w=w+1
*@ w,k say "|                                                                    |"
set decimals to 0 
lnet_z=val(krop(str(kj_round(zksAnet1_z_sum+zksCnet1_z_sum,lround),12,lround)))
lnet_e0=val(krop(str(kj_round(zksAnet_export+zksCnet_export,lround),12,lround)))
lnet_k0=val(krop(str(kj_round(lnet_zero-(zksAnet_export+zksCnet_export),lround),12,lround)))
lnet_a=val(krop(str(kj_round(zksAnet1_a_sum+zksCnet1_a_sum,lround),12,lround)))
lvat_a=val(krop(str(kj_round(zksAvat1_a_sum+zksCvat1_a_sum,lround),12,lround)))
lnet_b=val(krop(str(kj_round(zksAnet1_b_sum+zksCnet1_b_sum,lround),12,lround)))
lvat_b=val(krop(str(kj_round(zksAvat1_b_sum+zksCvat1_b_sum,lround),12,lround)))
lnet_c=val(krop(str(kj_round(zksAnet1_c_sum+zksCnet1_c_sum,lround),12,lround)))
lvat_c=val(krop(str(kj_round(zksAvat1_c_sum+zksCvat1_c_sum,lround),12,lround)))
lnet_d=val(krop(str(kj_round(zksAnet1_d_sum+zksCnet1_d_sum,lround),12,lround)))
lvat_d=val(krop(str(kj_round(zksAvat1_d_sum+zksCvat1_d_sum,lround),12,lround)))
lnet_e=val(krop(str(kj_round(zksAnet1_e_sum+zksCnet1_e_sum,lround),12,lround)))
lvat_e=val(krop(str(kj_round(zksAvat1_e_sum+zksCvat1_e_sum,lround),12,lround)))
lnet_f=val(krop(str(kj_round(zksAnet1_f_sum+zksCnet1_f_sum,lround),12,lround)))
lvat_f=val(krop(str(kj_round(zksAvat1_f_sum+zksCvat1_f_sum,lround),12,lround)))

if.not.lnet_z=0
  w=w+1
  @ w,k say "| Sprzedaæ zwolniona od podatku "
  @ w,k+36 say lnet_z
  @ w,k+69 say "|"
endif

if.not.lnet_e0=0
  w=w+1
  @ w,k say "| Jako export opodatkowana st. 0"
  @ w,k+36 say lnet_e0
  @ w,k+69 say "|"
endif
if.not.lnet_k0=0
  w=w+1
  @ w,k say "| W kraju opodatkowana     st. 0"
  @ w,k+36 say lnet_k0
  @ w,k+69 say "|"
endif
if.not.lvat_a=0
  w=w+1
  @ w,k say sprzedtx_a
  @ w,k+36 say lnet_a
  @ w,k+54 say lvat_a
  @ w,k+69 say "|"
else
  lnet_a=0
endif  
if.not.lvat_b=0
  w=w+1
  @ w,k say sprzedtx_b
  @ w,k+36 say lnet_b
  @ w,k+54 say lvat_b
  @ w,k+69 say "|"
else
  lnet_b=0
endif  
if.not.lvat_c=0
  w=w+1
  @ w,k say sprzedtx_c
  @ w,k+36 say lnet_c
  @ w,k+54 say lvat_c
  @ w,k+69 say "|"
else
  lnet_c=0
endif  
if.not.lvat_d=0
  w=w+1
  @ w,k say sprzedtx_d
  @ w,k+36 say lnet_d
  @ w,k+54 say lvat_d
  @ w,k+69 say "|"
else
  lnet_d=0
endif  
if.not.lvat_e=0
  w=w+1
  @ w,k say sprzedtx_e
  @ w,k+36 say lnet_e
  @ w,k+54 say lvat_e
  @ w,k+69 say "|"
else
  lnet_e=0
endif  
if.not.lvat_f=0
  w=w+1
  @ w,k say sprzedtx_f
  @ w,k+36 say lnet_f
  @ w,k+54 say lvat_f
  @ w,k+69 say "|"
else
  lnet_f=0
endif  

lnetsum1=lnet_z+lnet_e0+lnet_k0+lnet_a+lnet_b+lnet_c+lnet_d+lnet_e+lnet_f
*lnetsum1=lnet_z+lnet_e0+lnet_k0+lnet_a+lnet_b+lnet_c+lnet_d+lnet_e
*lnetsum1=lnet_z+lnet_e0+lnet_k0+lnet_a+lnet_b+lnet_c+lnet_d

*lnetsum1=lnet_z+lnet_e0+lnet_k0+lnet_a+lnet_b+lnet_c
lvatsum1=lvat_a+lvat_b+lvat_c+lvat_d+lvat_e+lvat_f
w=w+1
@ w,k say "|-------------------------------|-----------------|------------------|" 
w=w+1
@ w,k say "|                R a z e m      |"
@ w,k+36 say lnetsum1
@ w,k+54 say lvatsum1
@ w,k+69 say "|"  
w=w+1
@ w,k say "----------------------------------------------------------------------" 

w=w+2
@ w,k say "ROZLICZENIE PODATKU NALICZONEGO"
w=w+1
@ w,k say "======================================================================" 
w=w+1
@ w,k say "|                      |        Zakupy zwi•zane ze sprzedaæ•         |"  
w=w+1
@ w,k say "|                      |     Opodatkowan•     | Opodatkowan• i zwoln.|"
w=w+1
@ w,k say "|                      |   NETTO   |    VAT   |   NETTO   |    VAT   |"
w=w+1
@ w,k say "|----------------------|-----------|----------|-----------|----------|" 
w=w+1
**
*local lzak_net_trwale:=0,lzak_vat_trwale:=0,lzak_net_pozostale:=0
*local lzak_vat_pozostale:=0,lzak_net_razem:=0,lzak_vat_razem:=0
**
lzak_net_trwale=val(krop(str(kj_round(zksAtrwaly+zksCtrwaly,lround),10,lround)))
lzak_vat_trwale=val(krop(str(kj_round(zksAvattrwaly+zksCvattrwaly,lround),9,lround)))
l1zak_net_trwale=kj_round(zksAtrwaly+zksCtrwaly,lround)
l1zak_vat_trwale=kj_round(zksAvattrwaly+zksCvattrwaly,lround)
@ w,k say "| órodki trwaàe "
if.not.zks_zwolniona
  @ w,k+25 say lzak_net_trwale
  @ w,k+37 say lzak_vat_trwale
else
  lzak=val(krop(str(kj_round(zw_Anet_trwale,lround),10,lround)))
  @ w,k+25 say lzak
  lzak=val(krop(str(kj_round(zw_Avat_trwale,lround),9,lround)))
  @ w,k+37 say lzak
  lzak=val(krop(str(kj_round(zw_Bnet_trwale,lround),10,lround)))
  @ w,k+48 say lzak
  lzak=val(krop(str(kj_round(zw_Bvat_trwale,lround),9,lround)))
  @ w,k+60 say lzak
endif  
@ w,k+69 say "|"
*lnetsum2=kj_round(zksAnet2_a_sum+zksCnet2_a_sum,lround)+kj_round(zksAnet2_b_sum+zksCnet2_b_sum,lround)+kj_round(zksAnet2_c_sum+zksCnet2_c_sum,lround)+kj_round(zksAnet2_d_sum+zksCnet2_d_sum,lround)+kj_round(zksAnet2_e_sum+zksCnet2_e_sum,lround)+kj_round(zksAnet2_f_sum+zksCnet2_f_sum,lround)
*lvatsum2=kj_round(zksAvat2_a_sum+zksCvat2_a_sum,lround)+kj_round(zksAvat2_b_sum+zksCvat2_b_sum,lround)+kj_round(zksAvat2_c_sum+zksCvat2_c_sum,lround)+kj_round(zksAvat2_d_sum+zksCvat2_d_sum,lround)+kj_round(zksAvat2_e_sum+zksCvat2_e_sum,lround)+kj_round(zksAvat2_f_sum+zksCvat2_f_sum,lround)

lnetsum2=val(krop(str(kj_round(zksAnet2_a_sum+zksCnet2_a_sum,lround)+kj_round(zksAnet2_b_sum+zksCnet2_b_sum,lround)+kj_round(zksAnet2_c_sum+zksCnet2_c_sum,lround)+kj_round(zksAnet2_d_sum+zksCnet2_d_sum,lround)+kj_round(zksAnet2_e_sum+zksCnet2_e_sum,lround)+kj_round(zksAnet2_f_sum+zksCnet2_f_sum,lround)+kj_round(zksAnet2_z_sum+zksCnet2_z_sum,lround),10,lround)))
lvatsum2=val(krop(str(kj_round(zksAvat2_a_sum+zksCvat2_a_sum,lround)+kj_round(zksAvat2_b_sum+zksCvat2_b_sum,lround)+kj_round(zksAvat2_c_sum+zksCvat2_c_sum,lround)+kj_round(zksAvat2_d_sum+zksCvat2_d_sum,lround)+kj_round(zksAvat2_e_sum+zksCvat2_e_sum,lround)+kj_round(zksAvat2_f_sum+zksCvat2_f_sum,lround)+kj_round(zksAvat2_z_sum+zksCvat2_z_sum,lround),9,lround)))
*lnetsum2_pozostale=lnetsum2-lzak_net_trwale
*lvatsum2_pozostale=lvatsum2-lzak_vat_trwale
l1netsum2=kj_round(zksAnet2_a_sum+zksCnet2_a_sum,lround)+kj_round(zksAnet2_b_sum+zksCnet2_b_sum,lround)+kj_round(zksAnet2_c_sum+zksCnet2_c_sum,lround)+kj_round(zksAnet2_d_sum+zksCnet2_d_sum,lround)+kj_round(zksAnet2_e_sum+zksCnet2_e_sum,lround)+kj_round(zksAnet2_f_sum+zksCnet2_f_sum,lround)+kj_round(zksAnet2_z_sum+zksCnet2_z_sum,lround)
l1vatsum2=kj_round(zksAvat2_a_sum+zksCvat2_a_sum,lround)+kj_round(zksAvat2_b_sum+zksCvat2_b_sum,lround)+kj_round(zksAvat2_c_sum+zksCvat2_c_sum,lround)+kj_round(zksAvat2_d_sum+zksCvat2_d_sum,lround)+kj_round(zksAvat2_e_sum+zksCvat2_e_sum,lround)+kj_round(zksAvat2_f_sum+zksCvat2_f_sum,lround)+kj_round(zksAvat2_z_sum+zksCvat2_z_sum,lround)
*
lnetsum2_pozostale=val(krop(str(l1netsum2-l1zak_net_trwale,10,lround)))
lvatsum2_pozostale=val(krop(str(l1vatsum2-l1zak_vat_trwale,10,lround)))
*
*
w=w+1
@ w,k say "| Pozostaàe     "
if.not.zks_zwolniona
  @ w,k+25 say lnetsum2_pozostale
  @ w,k+36 say lvatsum2_pozostale
else
  lzak=val(krop(str(kj_round(zw_Anet_pozos,lround),10,lround)))
  @ w,k+25 say lzak
  lzak=val(krop(str(kj_round(zw_Avat_pozos,lround),9,lround)))
  @ w,k+37 say lzak
  lzak=val(krop(str(kj_round(zw_Bnet_pozos,lround),10,lround)))
  @ w,k+48 say lzak
  lzak=val(krop(str(kj_round(zw_Bvat_pozos,lround),9,lround)))
  @ w,k+60 say lzak
endif  
@ w,k+69 say "|"
w=w+1
@ w,k say "|----------------------|-----------|----------|-----------|----------|" 
w=w+1
@ w,k say "|       R a z e m      |"
if.not.zks_zwolniona
*  @ w,k+25 say lnetsum2
*  @ w,k+37 say lvatsum2
  @ w,k+25 say lzak_net_trwale + lnetsum2_pozostale
  @ w,k+36 say lzak_vat_trwale + lvatsum2_pozostale
else
  lzak=val(krop(str(kj_round(zw_Anet_trwale + zw_Anet_pozos ,lround),10,lround)))
  @ w,k+25 say lzak
  lzak=val(krop(str(kj_round(zw_Avat_trwale + zw_Avat_pozos ,lround),9,lround)))
  @ w,k+37 say lzak
  lzak=val(krop(str(kj_round(zw_Bnet_trwale + zw_Bnet_pozos ,lround),10,lround)))
  @ w,k+48 say lzak
  lzak=val(krop(str(kj_round(zw_Bvat_trwale + zw_Bvat_pozos   ,lround),9,lround)))
  @ w,k+60 say lzak

endif  
@ w,k+69 say "|"
w=w+1
@ w,k say "----------------------------------------------------------------------" 
w=w+2
if.not.zks_zwolniona
  @ w,k say "VAT naleæny  -  VAT naliczony  =  "+alltrim(str(lvatsum1))+"  -  "+alltrim(str(lvatsum2))+"  =  "+alltrim(str(lvatsum1-lvatsum2))
else

endif
**
set device to screen
if.not.ldrukarka
  edi=edit+" wydruki\vat7.txt"
  run &edi 
  restore screen from ek
  set cursor off   
endif
**
RETURN

FUNCTION PIT5_MENU(ppoz)
local ltnaz[15],ltlit[15],ltopis[15],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" A. Miejsce skàadania deklaracji                           "
ltnaz[2]:=" B. Dane podatnika                                         "
ltnaz[3]:=" C. Ustalenie dochodu / straty                            "
ltnaz[4]:=" D. Doch¢d po odliczeniu dochodu zwolnionego i strat       "
ltnaz[5]:=" E. Odliczenia od dochodu                                  "
ltnaz[6]:=" F. Odliczenia z tytuàu wydatk¢w inwestycyjnych            "
ltnaz[7]:=" G. Doch¢d zwolniony od podatku                            "
ltnaz[8]:=" H. Doch¢d po odliczeniach                                 "
ltnaz[9]:=" I. Ustalenie podstawy obliczenia podatku                  "
ltnaz[10]:=" J. Obliczenia naleænego podatku                           "
ltnaz[11]:=" K. Pozarolnicza dziaàalnoòÜ gospodarcza                   "
ltnaz[12]:=" L. Pozarolnicza dziaàalnoòÜ gospodarcza - strefa specjalna"
ltnaz[13]:=" M. Najem, podnajem, dzieræawa oraz inne umowy             "
ltnaz[14]:=" N. Informacja o zaà•cznikach                              "
ltnaz[15]:=" O. Data wypeànienia deklaracji                            "

for i=1 to 15
  ltlit[i]:=""
  ltopis[i]:=""
next

ltlit[1]:=" A"
ltlit[2]:=" B"
ltlit[3]:=" C"
ltlit[4]:=" D"
ltlit[5]:=" E"
ltlit[6]:=" F"
ltlit[7]:=" G"
ltlit[8]:=" H"
ltlit[9]:=" I"
ltlit[10]:=" J"
ltlit[11]:=" K"
ltlit[12]:=" L"
ltlit[13]:=" M"
ltlit[14]:=" N"
ltlit[15]:=" O"
ltopis[1]:="Urz•d skarbowy, do kt¢rego adresowana jest deklaracja"
ltopis[2]:="Dane identyfikacyje oraz adres zamieszkania"
ltopis[3]:="Przych¢d, koszty uzyskania przychodu, doch¢d, strata"
ltopis[4]:="Doch¢d zwolniony od podatku, straty z lat ubiegàych"
ltopis[5]:="Odliczenie od dochod¢w wydatk¢w mieszkaniowych i innych"
ltopis[6]:="Dodatkowa obniæka, wydatki inwestycyjne oraz premie inwestycyjne"
ltopis[7]:="Na podstawie przepis¢w wykonawczych do ustawy o specjalnych strefach ekonomicz."
ltopis[8]:="Doch¢d po odliczeniu ulg i zwolnie‰"
ltopis[9]:="Kwoty zwi©kszaj•ce podstaw© opodatkowania, podstawa obliczenia podatku"
ltopis[10]:="Obliczenie podatku, odliczenia, ograniczenie, obliczenie zaliczki i zobowi•zania "
ltopis[11]:="W tym r¢wnieæ udziaà w sp¢àkach niemaj•cych osobowoòci prawnych"
ltopis[12]:="Prowadzona na terenie specjalnej strefy ekonomicznej"
ltopis[13]:="çr¢dào i miejsce przychodu, udziaà, przych¢d, koszty, doch¢d, strata"
ltopis[14]:="Liczba doà•czonych formularzy PIT-5A, PIT-5X, remanent likwidacyjny"
ltopis[15]:="Dzie‰, miesi•c i rok wypeànienia deklaracji"
  lpoz=men_pion(3,8,15,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION PIT5_PUBLIC()
public zpit5_miesiac:=space(12),zpit5_rok:=0
public za5_urzad:=space(30),zb6_nazwisk:=space(30),zb7_imie:=space(15)
public zb8_urodzon:=ctod(""),zb9_kraj:=space(15),zb10_wojew:=space(30)
public zb11_powiat:=space(30),zb12_gmina:=space(30),zb13_ulica:=space(30)
public zb14_dom:=space(10),zb15_lokal:=space(10),zb16_miejsc:=space(30)
public zb17_kod:=space(6),zb18_poczta:=space(30),oc19_przych:=0
public oc20_koszty:=0,oc21_dochod:=0,oc22_strata:=0
public oc23_przych:=0,oc24_koszty:=0,oc25_dochod:=0,oc26_strata:=0
public oc27_przych:=0,oc28_koszty:=0,oc29_dochod:=0,oc30_strata:=0
public zd31_zwolni:=0,zd32_straty:=0,od33_dochod:=0
public ze34_skladk:=0,ze35_odlicz:=0,ze36_wydatk:=0 
public ze37_wydatk:=0,ze38_wydatk:=0,ze39_wydatk:=0,ze40_ulgi:=0
public ze41_cele:=0,ze42_rodzaj:=space(30),ze43_inne:=0,zf44_obnizk:=0
public zf45_premia:=0,zg46_zwolni:=0,oh47_dochod:=0,zi48_kwoty:=0
public oi49_podstawa:=0,oj50_podatek:=0,zj51_zdrowo:=0
public zj52_ulgi:=0,zj53_ulgi:=0,zj54_decyzj:=space(30),zj55_ograni:=0
public zj56_data:=ctod(""),oj57_podatek:=0,oj58_suma:=0,zj59_zalicz:=0
public oj60_suma:=0,zj61_remane:=0,oj62_kwota:=0,zj63_odsetk:=0
public zk64_nip:=space(13),zk65_regon:=space(14),zk66_nazwa:=space(40) 
public zk67_miejsc:=space(40),zk68_udzial:=100,zk69_przych:=0,zk70_koszty:=0
public ok71_dochod:=0,ok72_strata:=0,zk73_nip:=space(13),zk74_regon:=space(14)
public zk75_nazwa:=space(40),zk76_miejsc:=space(40),zk77_udzial:=0
public zk78_przych:=0,zk79_koszty:=0,ok80_dochod:=0,ok81_strata:=0
public zk173_nip:=space(13),zk174_regon:=space(14)
public zk175_nazwa:=space(40),zk176_miejsc:=space(40),zk177_udzial:=0
public zk178_przych:=0,zk179_koszty:=0,ok180_dochod:=0,ok181_strata:=0
public zk273_nip:=space(13),zk274_regon:=space(14)
public zk275_nazwa:=space(40),zk276_miejsc:=space(40),zk277_udzial:=0
public zk278_przych:=0,zk279_koszty:=0,ok280_dochod:=0,ok281_strata:=0
public zk373_nip:=space(13),zk374_regon:=space(14)
public zk375_nazwa:=space(40),zk376_miejsc:=space(40),zk377_udzial:=0
public zk378_przych:=0,zk379_koszty:=0,ok380_dochod:=0,ok381_strata:=0
public zL82_rodzaj:=space(40),zL83_nip:=space(13),zL84_regon:=space(14)
public zL85_nazwa:=space(40),zL86_miejsc:=space(40),zL87_zezwol:=space(20)
public zL88_data_w:=ctod(""),zL89_data_r:=ctod(""),zL901_zasad:=.f.,zL902_zasad:=.f.,zL903_zasad:=.f.
public zL91_udzial:=0,zL92_przych:=0,zL93_koszty:=0,oL94_dochod:=0
public oL95_strata:=0,zL96_zwolni:=0,zL97_kwota:=0
public zL98_rodzaj:=space(40),zL99_nip:=space(13),zL100_regon:=space(14)
public zL101_nazwa:=space(40),zL102_miejs:=space(40),zL103_zezwo:=space(20)
public zL104_data_:=ctod(""),zL105_data_:=ctod(""),zL1061_zasad:=.f.,zL1062_zasad:=.f.,zL1063_zasad:=.f.
public zL107_udzia:=0,zL108_przyc:=0,zL109_koszt:=0,oL110_docho:=0
public oL111_strat:=0,zL112_zwoln:=0,zL113_kwota:=0
public zm114_zrodl:=space(40),zm115_miejs:=space(40),zm116_udzia:=0
public zm117_przyc:=0,zm118_koszt:=0,om119_docho:=0,om120_strat:=0
public zm121_zrodl:=space(40),zm122_miejs:=space(40),zm123_udzia:=0
public zm124_przyc:=0,zm125_koszt:=0,om126_docho:=0,om127_strat:=0
public zm221_zrodl:=space(40),zm222_miejs:=space(40),zm223_udzia:=0
public zm224_przyc:=0,zm225_koszt:=0,om226_docho:=0,om227_strat:=0
public zm321_zrodl:=space(40),zm322_miejs:=space(40),zm323_udzia:=0
public zm324_przyc:=0,zm325_koszt:=0,om326_docho:=0,om327_strat:=0
public zm421_zrodl:=space(40),zm422_miejs:=space(40),zm423_udzia:=0
public zm424_przyc:=0,zm425_koszt:=0,om426_docho:=0,om427_strat:=0
public zn128_zal_1:=0,zn129_zal_2:=0,zn130_zal_3:=0,zo131_data:=date()
*podliczenia narastaj•ce
public sd31_zwolni:=0,sd32_straty:=0,se34_skladk:=0,se35_odlicz:=0
public se36_wydatk:=0,se37_wydatk:=0,se38_wydatk:=0,se39_wydatk:=0
public se40_ulgi:=0,se41_cele:=0,se43_inne:=0,sf44_obnizk:=0
public sf45_premia:=0,sg46_zwolni:=0,si48_kwoty:=0,sj51_zdrowo:=0
public sj52_ulgi:=0,sj53_ulgi:=0,sj54_decyzj:=0,sj55_ograni:=0
public sj59_zalicz:=0,sj61_remane:=0,sj63_odsetk:=0,sk78_przych:=0
public sk69_przych:=0,sk70_koszty:=0
public sk79_koszty:=0,sk178_przych:=0,sk179_koszty:=0,sk278_przych:=0
public sk279_koszty:=0,sk378_przych:=0,sk379_koszty:=0,sL92_przych:=0
public sL93_koszty:=0,sL96_zwolni:=0,sL97_kwota:=0,sL108_przyc:=0
public sL109_koszt:=0,sL112_zwoln:=0,sL113_kwota:=0,sm117_przyc:=0
public sm118_koszt:=0,sm124_przyc:=0,sm125_koszt:=0,sm224_przyc:=0
public sm225_koszt:=0,sm324_przyc:=0,sm325_koszt:=0,sm424_przyc:=0,sm425_koszt:=0
RETURN

FUNCTION PIT5_LAD()
zpit5_miesiac=miesiac
zpit5_rok=rok
za5_urzad=a5_urzad
zb6_nazwisk=b6_nazwisk
zb7_imie=b7_imie
zb8_urodzon=b8_urodzon
zb9_kraj=b9_kraj
zb10_wojew=b10_wojew
zb11_powiat=b11_powiat
zb12_gmina=b12_gmina
zb13_ulica=b13_ulica
zb14_dom=b14_dom
zb15_lokal=b15_lokal
zb16_miejsc=b16_miejsc
zb17_kod=b17_kod
zb18_poczta=b18_poczta
zd31_zwolni=d31_zwolni
zd32_straty=d32_straty
ze34_skladk=e34_skladk
ze35_odlicz=e35_odlicz
ze36_wydatk=e36_wydatk
ze37_wydatk=e37_wydatk
ze38_wydatk=e38_wydatk
ze39_wydatk=e39_wydatk
ze40_ulgi=e40_ulgi
ze41_cele=e41_cele
ze42_rodzaj=e42_rodzaj
ze43_inne=e43_inne
zf44_obnizk=f44_obnizk
zf45_premia=f45_premia
zg46_zwolni=g46_zwolni
zi48_kwoty=i48_kwoty
zj51_zdrowo=j51_zdrowo
zj52_ulgi=j52_ulgi
zj53_ulgi=j53_ulgi
zj54_decyzj=j54_decyzj
zj55_ograni=j55_ograni
zj56_data=j56_data
zj61_remane=j61_remane
zj63_odsetk=j63_odsetk
zk64_nip=k64_nip
zk65_regon=k65_regon
zk66_nazwa=k66_nazwa
zk67_miejsc=k67_miejsc
zk68_udzial=k68_udzial
zk73_nip=k73_nip
zk74_regon=k74_regon
zk75_nazwa=k75_nazwa
zk76_miejsc=k76_miejsc
zk77_udzial=k77_udzial
zk78_przych=k78_przych
zk79_koszty=k79_koszty
zk173_nip=k173_nip
zk174_regon=k174_regon
zk175_nazwa=k175_nazwa
zk176_miejsc=k176_miejsc
zk177_udzial=k177_udzial
zk178_przych=k178_przych
zk179_koszty=k179_koszty
zk273_nip=k273_nip
zk274_regon=k274_regon
zk275_nazwa=k275_nazwa
zk276_miejsc=k276_miejsc
zk277_udzial=k277_udzial
zk278_przych=k278_przych
zk279_koszty=k279_koszty
zk373_nip=k373_nip
zk374_regon=k374_regon
zk375_nazwa=k375_nazwa
zk376_miejsc=k376_miejsc
zk377_udzial=k377_udzial
zk378_przych=k378_przych
zk379_koszty=k379_koszty
zL82_rodzaj=L82_rodzaj
zL83_nip=L83_nip
zL84_regon=L84_regon
zL85_nazwa=L85_nazwa
zL86_miejsc=L86_miejsc
zL87_zezwol=L87_zezwol
zL88_data_w=L88_data_w
zL89_data_r=L89_data_r
zL901_zasad=L901_zasad
zL902_zasad=L902_zasad
zL903_zasad=L903_zasad
zL91_udzial=L91_udzial
zL92_przych=L92_przych
zL93_koszty=L93_koszty
zL96_zwolni=L96_zwolni
zL97_kwota=L97_kwota
zL98_rodzaj=L98_rodzaj
zL99_nip=L99_nip
zL100_regon=L100_regon
zL101_nazwa=L101_nazwa
zL102_miejs=L102_miejs
zL103_zezwo=L103_zezwo
zL104_data_=L104_data_
zL105_data_=L105_data_
zL1061_zasa=L1061_zasa
zL1062_zasa=L1062_zasa
zL1063_zasa=L1063_zasa
zL107_udzia=L107_udzia
zL108_przyc=L108_przyc
zL109_koszt=L109_koszt
zL112_zwoln=L112_zwoln
zL113_kwota=L113_kwota
zm114_zrodl=m114_zrodl
zm115_miejs=m115_miejs
zm116_udzia=m116_udzia
zm117_przyc=m117_przyc
zm118_koszt=m118_koszt
zm121_zrodl=m121_zrodl
zm122_miejs=m122_miejs
zm123_udzia=m123_udzia
zm124_przyc=m124_przyc
zm125_koszt=m125_koszt
zm221_zrodl=m221_zrodl
zm222_miejs=m222_miejs
zm223_udzia=m223_udzia
zm224_przyc=m224_przyc
zm225_koszt=m225_koszt
zm321_zrodl=m321_zrodl
zm322_miejs=m322_miejs
zm323_udzia=m323_udzia
zm324_przyc=m324_przyc
zm325_koszt=m325_koszt
zm421_zrodl=m421_zrodl
zm422_miejs=m422_miejs
zm423_udzia=m423_udzia
zm424_przyc=m424_przyc
zm425_koszt=m425_koszt
zn128_zal_1=n128_zal_1
zn129_zal_2=n129_zal_2
zn130_zal_3=n130_zal_3
zo131_data=o131_data
RETURN

FUNCTION ZPIT5_ZER()
*zpit5_miesiac=miesiac
*zpit5_rok=rok
za5_urzad=space(30)
zb6_nazwisk=space(30)
zb7_imie=space(15)
zb8_urodzon=ctod("")
zb9_kraj=space(15)
zb10_wojew=space(30)
zb11_powiat=space(30)
zb12_gmina=space(30)
zb13_ulica=space(30)
zb14_dom=space(10)
zb15_lokal=space(10)
zb16_miejsc=space(30)
zb17_kod=space(6)
zb18_poczta=space(30)
zd31_zwolni=0
zd32_straty=0
ze34_skladk=0
ze35_odlicz=0
ze36_wydatk=0
ze37_wydatk=0
ze38_wydatk=0
ze39_wydatk=0
ze40_ulgi=0
ze41_cele=0
ze42_rodzaj=space(30)
ze43_inne=0
zf44_obnizk=0
zf45_premia=0
zg46_zwolni=0
zi48_kwoty=0
zj51_zdrowo=0
zj52_ulgi=0
zj53_ulgi=0
zj54_decyzj=space(30)
zj55_ograni=0
zj56_data=ctod("")
zj59_zalicz=0
zj61_remane=0
zj63_odsetk=0
zk64_nip=space(13)
zk65_regon=space(14)
zk66_nazwa=space(40)
zk67_miejsc=space(40)
zk68_udzial=0
zk69_przych=0
zk70_koszty=0
zk73_nip=space(13)
zk74_regon=space(14)
zk75_nazwa=space(40)
zk76_miejsc=space(40)
zk77_udzial=0
zk78_przych=0
zk79_koszty=0
zk173_nip=space(13)
zk174_regon=space(14)
zk175_nazwa=space(40)
zk176_miejsc=space(40)
zk177_udzial=0
zk178_przych=0
zk179_koszty=0
zk273_nip=space(13)
zk274_regon=space(14)
zk275_nazwa=space(40)
zk276_miejsc=space(40)
zk277_udzial=0
zk278_przych=0
zk279_koszty=0
zk373_nip=space(13)
zk374_regon=space(14)
zk375_nazwa=space(40)
zk376_miejsc=space(40)
zk377_udzial=0
zk378_przych=0
zk379_koszty=0
zL82_rodzaj=space(40)
zL83_nip=space(13)
zL84_regon=space(14)
zL85_nazwa=space(40)
zL86_miejsc=space(40)
zL87_zezwol=space(20)
zL88_data_w=ctod("")
zL89_data_r=ctod("")
zL901_zasad=.f.
zL902_zasad=.f.
zL903_zasad=.f.
zL91_udzial=0
zL92_przych=0
zL93_koszty=0
zL96_zwolni=0
zL97_kwota=0
zL98_rodzaj=space(40)
zL99_nip=space(13)
zL100_regon=space(14)
zL101_nazwa=space(40)
zL102_miejs=space(40)
zL103_zezwo=space(20)
zL104_data_=ctod("")
zL105_data_=ctod("")
zL1061_zasa=.f.
zL1062_zasa=.f.
zL1063_zasa=.f.
zL107_udzia=0
zL108_przyc=0
zL109_koszt=0
zL112_zwoln=0
zL113_kwota=0
zm114_zrodl=space(40)
zm115_miejs=space(40)
zm116_udzia=0
zm117_przyc=0
zm118_koszt=0
zm121_zrodl=space(40)
zm122_miejs=space(40)
zm123_udzia=0
zm124_przyc=0
zm125_koszt=0
zm221_zrodl=space(40)
zm222_miejs=space(40)
zm223_udzia=0
zm224_przyc=0
zm225_koszt=0
zm321_zrodl=space(40)
zm322_miejs=space(40)
zm323_udzia=0
zm324_przyc=0
zm325_koszt=0
zm421_zrodl=space(40)
zm422_miejs=space(40)
zm423_udzia=0
zm424_przyc=0
zm425_koszt=0
zn128_zal_1=0
zn129_zal_2=0
zn130_zal_3=0
zo131_data=ctod("")
RETURN


FUNCTION ZPIT5STYCZEN_ZER()
zd31_zwolni=0
zd32_straty=0
ze34_skladk=0
ze35_odlicz=0
ze36_wydatk=0
ze37_wydatk=0
ze38_wydatk=0
ze39_wydatk=0
ze40_ulgi=0
ze41_cele=0
ze43_inne=0
zf44_obnizk=0
zf45_premia=0
zg46_zwolni=0
zi48_kwoty=0
zj51_zdrowo=0
zj52_ulgi=0
zj53_ulgi=0
zj55_ograni=0
zj56_data=ctod("")
zj59_zalicz=0
zj61_remane=0
zj63_odsetk=0
*zk68_udzial=0
zk69_przych=0
zk70_koszty=0
*zk77_udzial=0
zk78_przych=0
zk79_koszty=0
*zk177_udzial=0
zk178_przych=0
zk179_koszty=0
*zk277_udzial=0
zk278_przych=0
zk279_koszty=0
*zk377_udzial=0
zk378_przych=0
zk379_koszty=0
zL88_data_w=ctod("")
zL89_data_r=ctod("")
zL901_zasad=.f.
zL902_zasad=.f.
zL903_zasad=.f.
*zL91_udzial=0
zL92_przych=0
zL93_koszty=0
zL96_zwolni=0
zL97_kwota=0
zL104_data_=ctod("")
zL105_data_=ctod("")
zL1061_zasa=.f.
zL1062_zasa=.f.
zL1063_zasa=.f.
zL107_udzia=0
zL108_przyc=0
zL109_koszt=0
zL112_zwoln=0
zL113_kwota=0
zm116_udzia=0
zm117_przyc=0
zm118_koszt=0
zm123_udzia=0
zm223_udzia=0
zm224_przyc=0
zm225_koszt=0
zm323_udzia=0
zm324_przyc=0
zm325_koszt=0
zm423_udzia=0
zm424_przyc=0
zm425_koszt=0
zn128_zal_1=0
zn129_zal_2=0
zn130_zal_3=0
zo131_data=ctod("")
RETURN


FUNCTION PIT5_REPLAC()
if reclock(5)      
  *replace miesiac with zpit5_miesiac
  *replace rok with zpit5_rok
  replace a5_urzad with za5_urzad
  replace b6_nazwisk with zb6_nazwisk
  replace b7_imie with zb7_imie
  replace b8_urodzon with zb8_urodzon
  replace b9_kraj with zb9_kraj
  replace b10_wojew with zb10_wojew
  replace b11_powiat with zb11_powiat
  replace b12_gmina with zb12_gmina
  replace b13_ulica with zb13_ulica
  replace b14_dom with zb14_dom
  replace b15_lokal with zb15_lokal
  replace b16_miejsc with zb16_miejsc
  replace b17_kod with zb17_kod
  replace b18_poczta with zb18_poczta
  replace d31_zwolni with zd31_zwolni
  replace d32_straty with zd32_straty
  replace e34_skladk with ze34_skladk
  replace e35_odlicz with ze35_odlicz
  replace e36_wydatk with ze36_wydatk
  replace e37_wydatk with ze37_wydatk
  replace e38_wydatk with ze38_wydatk
  replace e39_wydatk with ze39_wydatk
  replace e40_ulgi with ze40_ulgi
  replace e41_cele with ze41_cele
  replace e42_rodzaj with ze42_rodzaj
  replace e43_inne with ze43_inne
  replace f44_obnizk with zf44_obnizk
  replace f45_premia with zf45_premia
  replace g46_zwolni with zg46_zwolni
  replace i48_kwoty with zi48_kwoty
  replace j51_zdrowo with zj51_zdrowo
  replace j52_ulgi with zj52_ulgi
  replace j53_ulgi with zj53_ulgi
  replace j54_decyzj with zj54_decyzj
  replace j55_ograni with zj55_ograni
  replace j56_data with zj56_data
  replace j56_data with zj56_data
  replace j59_zalicz with zj59_zalicz
  replace j61_remane with zj61_remane
  replace j63_odsetk with zj63_odsetk
  replace k64_nip with zk64_nip
  replace k65_regon with zk65_regon
  replace k66_nazwa with zk66_nazwa
  replace k67_miejsc with zk67_miejsc
  replace k68_udzial with zk68_udzial
  replace k69_przych with zk69_przych
  replace k70_koszty with zk70_koszty
  replace k73_nip with zk73_nip
  replace k74_regon with zk74_regon
  replace k75_nazwa with zk75_nazwa
  replace k76_miejsc with zk76_miejsc
  replace k77_udzial with zk77_udzial
  replace k78_przych with zk78_przych
  replace k79_koszty with zk79_koszty
  replace k173_nip with zk173_nip
  replace k174_regon with zk174_regon
  replace k175_nazwa with zk175_nazwa
  replace k176_miejsc with zk176_miejsc
  replace k177_udzial with zk177_udzial
  replace k178_przych with zk178_przych
  replace k179_koszty with zk179_koszty
  replace k273_nip with zk273_nip
  replace k274_regon with zk274_regon
  replace k275_nazwa with zk275_nazwa
  replace k276_miejsc with zk276_miejsc
  replace k277_udzial with zk277_udzial
  replace k278_przych with zk278_przych
  replace k279_koszty with zk279_koszty
  replace k373_nip with zk373_nip
  replace k374_regon with zk374_regon
  replace k375_nazwa with zk375_nazwa
  replace k376_miejsc with zk376_miejsc
  replace k377_udzial with zk377_udzial
  replace k378_przych with zk378_przych
  replace k379_koszty with zk379_koszty
  replace L82_rodzaj with zL82_rodzaj
  replace L83_nip with zL83_nip
  replace L84_regon with zL84_regon
  replace L85_nazwa with zL85_nazwa
  replace L86_miejsc with zL86_miejsc
  replace L87_zezwol with zL87_zezwol
  replace L88_data_w with zL88_data_w
  replace L89_data_r with zL89_data_r
  replace L901_zasady with zL901_zasady
  replace L902_zasady with zL902_zasady
  replace L903_zasady with zL903_zasady
  replace L91_udzial with zL91_udzial
  replace L92_przych with zL92_przych
  replace L93_koszty with zL93_koszty
  replace L96_zwolni with zL96_zwolni
  replace L97_kwota with zL97_kwota
  replace L98_rodzaj with zL98_rodzaj
  replace L99_nip with zL99_nip
  replace L100_regon with zL100_regon
  replace L101_nazwa with zL101_nazwa
  replace L102_miejs with zL102_miejs
  replace L103_zezwo with zL103_zezwo
  replace L104_data_ with zL104_data_
  replace L105_data_ with zL105_data_
  replace L1061_zasa with zL1061_zasa
  replace L1062_zasa with zL1062_zasa
  replace L1063_zasa with zL1063_zasa
  replace L107_udzia with zL107_udzia
  replace L108_przyc with zL108_przyc
  replace L109_koszt with zL109_koszt
  replace L112_zwoln with zL112_zwoln
  replace L113_kwota with zL113_kwota
  replace m114_zrodl with zm114_zrodl
  replace m115_miejs with zm115_miejs
  replace m116_udzia with zm116_udzia
  replace m117_przyc with zm117_przyc
  replace m118_koszt with zm118_koszt
  replace m121_zrodl with zm121_zrodl
  replace m122_miejs with zm122_miejs
  replace m123_udzia with zm123_udzia
  replace m124_przyc with zm124_przyc
  replace m125_koszt with zm125_koszt
  replace m221_zrodl with zm221_zrodl
  replace m222_miejs with zm222_miejs
  replace m223_udzia with zm223_udzia
  replace m224_przyc with zm224_przyc
  replace m225_koszt with zm225_koszt
  replace m321_zrodl with zm321_zrodl
  replace m322_miejs with zm322_miejs
  replace m323_udzia with zm323_udzia
  replace m324_przyc with zm324_przyc
  replace m325_koszt with zm325_koszt
  replace m421_zrodl with zm421_zrodl
  replace m422_miejs with zm422_miejs
  replace m423_udzia with zm423_udzia
  replace m424_przyc with zm424_przyc
  replace m425_koszt with zm425_koszt
  replace n128_zal_1 with zn128_zal_1
  replace n129_zal_2 with zn129_zal_2
  replace n130_zal_3 with zn130_zal_3
  replace o131_data with zo131_data
		unlock
endif	  
RETURN


FUNCTION KS_PIT5()
local lpoz:=1,ek,lpoz1:=1,lpoz2:=1
kj_okno(0,0,24," Deklaracja na zaliczk© miesi©czn• na podatek dochodowy   PIT-5                 ",2)
g_tlo()
save screen to ek
do skom with "Czekaj! Trwaja obliczenia."
do while.t.
  lpoz=pit5_menu(lpoz)
  if lastkey()=27
    restore screen from ek
	exit
  endif
  do case
    case lpoz=1
	  miejsce()
    case lpoz=2
	  dane()	  
    case lpoz=3
	  ustalenie_dochodu()
    case lpoz=4
	  d_dochod()
	  pit5_say(5,5)
	  inkey(0)	  
	case lpoz=5
	 lpoz2=1
	 do while.t.
	   g_tlo()
	   lpoz2=odl_menu(lpoz2)
	   if lastkey()=27
	     exit
	   endif
	   e_odliczenia(lpoz2)  
	 enddo  
	 pit5_say(5,5)
	 inkey(0)
	case lpoz=6
	  f_odliczenie()
	  pit5_say(5,5)
	  inkey(0)
    case lpoz=7
	  g_dochod()
	  pit5_say(5,5)
	  inkey(0)	  	  
    case lpoz=8
	  h_dochod()
	  pit5_say(5,5)
	  inkey(0)	  	  

    case lpoz=9
	  i_ustalenie()
	  pit5_say(5,5)
	  inkey(0)	  	  	  
    case lpoz=10
	  *j_obliczenie()
	 lpoz2=1
	 do while.t.
	   g_tlo()
	   lpoz2=j_menu(lpoz2)
	   if lastkey()=27
	     exit
	   endif
	   j_obliczenie(lpoz2)
	 enddo  
	 pit5_say(5,5)
	 inkey(0)
    case lpoz=11
	  lpoz1=1
	  do while.t.
	    g_tlo()
	    lpoz1=kpit_menu(lpoz1)
	    if lastkey()=27
	      exit
	    endif
		k_pozarolnicza(lpoz1)
	    pit5_say(5,5)
	    inkey(0)	  	  	  	  
	  enddo	
	  
    case lpoz=12
	  lpoz1=1
	  do while.t.
	    g_tlo()
	    lpoz1=l_menu(lpoz1)
	    if lastkey()=27
	      exit
	    endif
		l_pozarolnicza(lpoz1)
	    pit5_say(5,5)
	    inkey(0)	  	  	  	  
	  enddo		  
    case lpoz=13
	  do while.t.
	    g_tlo()
	    lpoz1=mpit5_menu(lpoz1)
	    if lastkey()=27
	      exit
	    endif
		m_najem(lpoz1)
	    pit5_say(5,5)
	    inkey(0)	  	  	  	  
	  enddo		  	  
    case lpoz=14
	  n_informacje()
	case lpoz=15
	  o_oswiadczenie()  
  endcase
  restore screen from ek
enddo
select &kspit5_sel
close
RETURN


FUNCTION PIT5_SAY(prow,pcol)
local ltyt:=" Podliczenie deklaracji PIT-5  za miesi•c                             "
ltyt=stuff(ltyt,44,12,miesiac)
kj_okno(0,0,24," Deklaracja na zaliczk© miesi©czn• na podatek dochodowy   PIT-5                 ",2)
w=prow+2
k=pcol+2
g_tlo()
kj_okno(prow,pcol,12,ltyt,2)
@ w,k say "Razem: Przych¢d ...               Koszty ............."
@ w,k+19 say oc27_przych picture "999999999.99"
@ w,k+54 say oc28_koszty picture "999999999.99"
w=w+1
@ w,k say "       Doch¢d .....               Strata ............." 
@ w,k+19 say oc29_dochod picture "999999999.99"
@ w,k+54 say oc30_strata picture "999999999.99"
w=w+1
@ w,k say "Odlicz od dochodu .               Doch¢d po odliczen.."
@ w,k+19 say se34_skladk+se35_odlicz+se36_wydatk+se37_wydatk+se38_wydatk+se39_wydatk+se40_ulgi+se41_cele+se43_inne+sf44_obnizk+sf45_premia+sg46_zwolni  picture "999999999.99"
@ w,k+54 say oh47_dochod picture "999999999.99"
w=w+1
@ w,k say "Podstawa podatku ..               Podatek w/g skali .."  
@ w,k+19 say oi49_podstawa picture "999999999.99"
@ w,k+54 say oj50_podatek picture "999999999.99"
w=w+1
@ w,k say "Odlicz.od podatku .               Podatek po odliczen."
@ w,k+19 say sj51_zdrowo+sj52_ulgi+sj53_ulgi picture "999999999.99"
@ w,k+54 say oj50_podatek-(sj51_zdrowo+sj52_ulgi+sj53_ulgi) picture "999999999.99"
w=w+1
@ w,k say "Suma zal. za poprz.               Zaliczka za miesi•c "
@ w,k+19 say oj58_suma picture "999999999.99"
@ w,k+54 say zj59_zalicz picture "999999999.99"
w=w+1
*@ w,k say "Suma zal. od pocz..               Nadpàata ..........."
@ w,k say "Suma zal. od pocz..         "
@ w,k+19 say oj60_suma picture "999999999.99"
*@ w,k+54 say      picture "999999999.99"
w=w+2
@ w,k say "           K W O T A   D O   Z A P ù A T Y  "
@ w,k+47 say oj62_kwota picture "999999999.99"
rem_okno(w+2,k)
RETURN


FUNCTION ZA_MIESIAC()
local lmiesiac:=month(date()),lrok:=zrok,lmies_nazwa:=""
local ludzial,la5,lb7,lb8,lb9,lb10,lb11,lb12,lb13,lb14,lb15,lb16,lb17,lb18
local lk64,lk65,lk66,lk67,lk68, lk73,lk74,lk75,lk76,lk77, lk173,lk174,lk175
local lk176,lk177, lk273,lk274,lk275,lk276,lk277, lk373,lk374,lk375,lk376,lk377
local ll82,ll83,ll84,ll85,ll86,ll87,ll88,ll89,ll901,ll902,ll903,ll91, ll98,ll99,ll100,ll101,ll102,ll103,ll104
local ll105,ll1061,ll162,ll163,ll107, m114,m115,m116, m121,m122,m123, m221,m222,m223
local m321,m322,m323, m421,m422,m423  
g_tlo()
g_tlo()

do miesiac with 4,30,lmiesiac,lmies_nazwa
f_tmiesiac=lmiesiac  
if lastkey()=27
  return
endif
if.not.kspit5_use()
  return
endif
locate for lp=lmiesiac

g_tlo()
if k68_udzial=0.and..not.lmiesiac=1
  do while.t..and..not.bof()
	skip -1
	if.not.k68_udzial=0
	  la5=a5_urzad
	  lb6=b6_nazwisk
	  lb7=b7_imie
	  lb8=b8_urodzon
	  lb9=b9_kraj
	  lb10=b10_wojew
	  lb11=b11_powiat
	  lb12=b12_gmina
	  lb13=b13_ulica
	  lb14=b14_dom
	  lb15=b15_lokal
	  lb16=b16_miejsc
	  lb17=b17_kod
	  lb18=b18_poczta
	  lk64=k64_nip
	  lk65=k65_regon
	  lk66=k66_nazwa
	  lk67=k67_miejsc
	  lk68=k68_udzial
	  lk73=k73_nip
	  lk74=k74_regon
	  lk75=k75_nazwa
	  lk76=k76_miejsc
	  lk77=k77_udzial
	  lk173=k173_nip
	  lk174=k174_regon
	  lk175=k175_nazwa
	  lk176=k176_miejsc
	  lk177=k177_udzial	  
	  lk273=k273_nip
	  lk274=k274_regon
	  lk275=k275_nazwa
	  lk276=k276_miejsc
	  lk277=k277_udzial
	  lk373=k373_nip
	  lk374=k374_regon
	  lk375=k375_nazwa
	  lk376=k376_miejsc
	  lk377=k377_udzial
      ll82=l82_rodzaj
	  ll83=l83_nip
	  ll84=l84_regon
	  ll85=l85_nazwa
	  ll86=l86_miejsc
	  ll87=l87_zezwol
	  ll88=l88_data_w
	  ll89=l89_data_r
	  ll901=l901_zasad
	  ll902=l902_zasad
	  ll903=l903_zasad
	  ll91=l91_udzial
	  ll98=l98_rodzaj
	  ll99=l99_nip
	  ll100=l100_regon
	  ll101=l101_nazwa
	  ll102=l102_miejs
	  ll103=l103_zezwo
	  ll104=l104_data_
	  ll105=l105_data_
	  ll1061=l1061_zasad
	  ll1062=l1062_zasad
	  ll1063=l1063_zasad
	  ll107=l107_udzia
	  lm114=m114_zrodl
	  lm115=m115_miejs
	  lm116=m116_udzia
	  lm121=m121_zrodl
	  lm122=m122_miejs
	  lm123=m123_udzia
	  lm221=m221_zrodl
	  lm222=m222_miejs
	  lm223=m223_udzia	  
	  lm321=m321_zrodl
	  lm322=m322_miejs
	  lm323=m323_udzia	  
	  lm421=m421_zrodl
	  lm422=m422_miejs
	  lm423=m423_udzia	  
      
	  locate for lp=lmiesiac
      if reclock(5)      
	    replace a5_urzad with la5,b6_nazwisk with lb6
        replace b7_imie with lb7,b8_urodzon with lb8,b9_kraj with lb9
		replace b10_wojew with lb10,b11_powiat with lb11,b12_gmina with lb12
		replace b13_ulica with lb13,b14_dom with lb14,b15_lokal with lb15
		replace b16_miejsc with lb16,b17_kod with lb17,b18_poczta with lb18
		replace k64_nip with lk64,k65_regon with lk65,k66_nazwa with lk66
		replace k67_miejsc with lk67,k68_udzial with lk68
		replace k73_nip with lk73,k74_regon with lk74,k75_nazwa with lk75
		replace k76_miejsc with lk76,k77_udzial with lk77
		replace k173_nip with lk173,k174_regon with lk174,k175_nazwa with lk175
		replace k176_miejsc with lk176,k177_udzial with lk177
		replace k273_nip with lk273,k274_regon with lk274,k275_nazwa with lk275
		replace k276_miejsc with lk276,k277_udzial with lk277		
		replace k373_nip with lk373,k374_regon with lk374,k375_nazwa with lk375
		replace k376_miejsc with lk376,k377_udzial with lk377		
		replace l82_rodzaj with ll82,l83_nip with ll83,l84_regon with ll84
		replace l85_nazwa with ll85,l86_miejsc with ll86,l87_zezwol with ll87
		replace l88_data_w with ll88,l89_data_r with ll89
		replace l901_zasady with ll901,l902_zasady with ll902,l903_zasady with ll903
		replace l91_udzial with ll91,l98_rodzaj with ll98,l99_nip with ll99
		replace l100_regon with ll100,l101_nazwa with ll101
		replace l102_miejs with ll102,l103_zezwo with ll103
		replace l104_data_ with ll104,l105_data_ with ll105
		replace l1061_zasad with ll1061,l1062_zasad with ll1062,l1063_zasad with ll1063
		replace l107_udzia with ll107
		replace m114_zrodl with lm114,m115_miejs with lm115,m116_udzia with lm116
		replace m121_zrodl with lm121,m122_miejs with lm122,m123_udzia with lm123
		replace m221_zrodl with lm221,m222_miejs with lm222,m123_udzia with lm223		
		replace m321_zrodl with lm321,m322_miejs with lm322,m323_udzia with lm323		
		replace m421_zrodl with lm421,m422_miejs with lm422,m423_udzia with lm423		
		unlock
	    exit
	  endif		  
	endif
	
  enddo
endif
locate for lp=lmiesiac
pit5_public()
if k68_udzial=0
  kj_tkom(12,"","Zdefiniuj podstawow• pozarolnicz• dziaàalnoòÜ gospodarcz•","ze szczeg¢lnym uwzgl©dnieniem udziaàu w %","",5)    
  k_pozarolnicza(1)
endif
pit5_lad()
*pit5_licz()
pit5_start()
pit5_say(5,5)
RETURN .t.



FUNCTION ZAMIES_FU()
local last:=lastkey()
do case
  case last=27.or.last=13
    return 0
endcase
RETURN 1

FUNCTION DANE_PODATNIKA()
local ek
g_tlo()
save screen to ek

restore screen from ek
RETURN

FUNCTION MIEJSCE()
local ek,lw,lk,la5_urzad:=space(30)
save screen to ek
g_tlo()
lw=5
lk=2
kj_okno(lw,lk,6," A. MIEJSCE SKùADANIA DEKLARACJI                                            ",2)
@ lw+2,lk+2 say "Urz•d skarbowy, do kt¢rego adresowana jest deklaracja"
set cursor on
@ lw+4,lk+12 get la5_urzad
read
set cursor off
if.not.lastkey()=27
      if reclock(5)      
	    replace a5_urzad with la5_urzad
		unlock
	  endif	
endif
restore screen from ek
RETURN

FUNCTION DANE()
local ek,lw,lk,lb6:=b6_nazwisk,lb7:=b7_imie,lb8:=b8_urodzon,lb9:=b9_kraj
local lb10:=b10_wojew,lb11:=b11_powiat,lb12:=b12_gmina,lb13:=b13_ulica
local lb14:=b14_dom,lb15:=b15_lokal,lb16:=b16_miejsc,lb17:=b17_kod
local lb18:=b18_poczta

save screen to ek
g_tlo()
lw=2
lk=2
kj_okno(lw,lk,20," B. DANE PODATNIKA                                                          ",2)
lw=lw+2
lk=lk+2
@ lw,lk say "DANE IDENTYFIKACYJNE "

lw=lw+1
lk=lk+2
set cursor on
@ lw,lk say "Nazwisko ...................."
@ lw,lk+30 get lb6
lw=lw+1
@ lw,lk say "Pierwsze imi© ..............."
@ lw,lk+30 get lb7
lw=lw+1
@ lw,lk say "Data urodzenia .............."
@ lw,lk+30 get lb8
lw=lw+2
@ lw,lk-2 say "ADRES ZAMIESZKANIA"
lw=lw+1
@ lw,lk say "Kraj ........................"
@ lw,lk+30 get lb9
lw=lw+1
@ lw,lk say "Wojew¢dztwo ................."
@ lw,lk+30 get lb10
lw=lw+1
@ lw,lk say "Powiat ......................"
@ lw,lk+30 get lb11
lw=lw+1
@ lw,lk say "Gmina ......................."
@ lw,lk+30 get lb12
lw=lw+1
@ lw,lk say "Ulica ......................."
@ lw,lk+30 get lb13
lw=lw+1
@ lw,lk say "Nr domu ....................."
@ lw,lk+30 get lb14
lw=lw+1
@ lw,lk say "Nr lokalu ..................."
@ lw,lk+30 get lb15
lw=lw+1
@ lw,lk say "MiejscowoòÜ ................."
@ lw,lk+30 get lb16
lw=lw+1
@ lw,lk say "Kod pocztowy ................"
@ lw,lk+30 get lb17
lw=lw+1
@ lw,lk say "Poczta ......................"
@ lw,lk+30 get lb18
read
set cursor off
if.not.lastkey()=27
      if reclock(5)      
	    replace b6_nazwisk with lb6,b7_imie with lb7,b8_urodzon with lb8
		replace b9_kraj with lb9,b10_wojew with lb10,b11_powiat with lb11
		replace b12_gmina with lb12,b13_ulica with lb13,b14_dom with lb14
		replace b15_lokal with lb15,b16_miejsc with lb16,b17_kod with lb17
		replace b18_poczta with lb18
 		unlock
	  endif	
endif
restore screen from ek
RETURN

FUNCTION USTALENIE_DOCHODU()
local ek,w:=3,k:=3,lcolor:=setcolor()
save screen to ek
zpit5_licz()  
kj_okno(0,0,24," C. USTALENIE DOCHODU / STRATY                                                  ",2)
@ w,k say "=========================================================================="
w=w+1
@ w,k say "| çr¢dào przychod¢w | Przych¢d   | Koszty     | Doch¢d     | Strata      |"
w=w+1
@ w,k say "|------------------------------------------------------------------------|"
w=w+1
@ w,k say "|                                                                        |"
w=w+1
@ w,k say "| Pozarolnicza dzia-"
@ w,k+73 say "|"
w=w+1
@ w,k say "| àalnoòÜ gospodarcza                                                    |"
w=w+1
@ w,k say "|                                                                        |"      
w=w+1
@ w,k say "| Najem, podnajem,  "
@ w,k+73 say "|"

w=w+1
@ w,k say "| lub dzieræawa                                                          |"
w=w+1
@ w,k say "|                    ------------ ------------ ------------ ------------ |"
w=w+1
@ w,k say "|     R a z e m     "
@ w,k+73 say "|"
w=w+1
@ w,k say "=========================================================================="
w=7
@ w,k+21 say oc19_przych picture "999999999.99"
@ w,k+34 say oc20_koszty picture "999999999.99"
@ w,k+47 say oc21_dochod picture "999999999.99"
@ w,k+60 say oc22_strata picture "999999999.99"
w=w+3
@ w,k+21 say oc23_przych picture "999999999.99"
@ w,k+34 say oc24_koszty picture "999999999.99"

@ w,k+47 say oc25_dochod picture "999999999.99"
@ w,k+60 say oc26_strata picture "999999999.99"
w=w+3
  @ w,k+21 say oc27_przych picture "999999999.99"
  @ w,k+34 say oc28_koszty picture "999999999.99"
  @ w,k+47 say oc29_dochod picture "999999999.99"
  @ w,k+60 say oc30_strata picture "999999999.99"
s_kom("Naciònij dowolny klawisz")
inkey(0)
restore screen from ek
setcolor(lcolor)
RETURN



FUNCTION PIT5_LICZ()
local recno:=recno()
pit5_lad()
* wprowadzenie do rekordu aktualnych danych z ksi©gi
kspit5_licz()
zk69_przych= zksrubr_7+zksrubr_8
zk70_koszty= zksrubr_10+zksrubr_11+zksrubr_12+zksrubr_13+zksrubr_14+zksrubr_18
pit5_replac()
zpit5_licz()  
pit5_replac()
*
RETURN .t.


FUNCTION PIT5_START()
local lmiesiac:=f_tmiesiac,i
for i=1 to lmiesiac
  locate for lp=i
  f_tmiesiac=i
  pit5_licz()
next
RETURN .t.


FUNCTION KSPIT5_LICZ()
  if.not.ks_use()
    return .f.
  endif
  set filter to month(ksdatdok)=f_tmiesiac.and.kszapis$"AB"  
  ksrubr_licz()
  close
  select &kspit5_sel
RETURN


FUNCTION SPIT5_ZER()
    sd31_zwolni=0
	sd32_straty=0
	se34_skladk=0
	se35_odlicz=0
	se36_wydatk=0
	se37_wydatk=0
	se38_wydatk=0
	se39_wydatk=0
	se40_ulgi=0
	se41_cele=0
	se43_inne=0
	sf44_obnizk=0
	sf45_premia=0
	sg46_zwolni=0
	si48_kwoty=0
	sj51_zdrowo=0
    sj52_ulgi=0
    sj53_ulgi=0
    sj54_decyzj=0
    sj55_ograni=0
    sj59_zalicz=0
    sj61_remane=0
    sj63_odsetk=0
    sk69_przych=0
    sk70_koszty=0
    sk78_przych=0
    sk79_koszty=0	
    sk178_przych=0
    sk179_koszty=0
    sk278_przych=0
    sk279_koszty=0
    sk378_przych=0
    sk379_koszty=0
    sL92_przych=0
    sL93_koszty=0
    sL96_zwolni=0
    sL97_kwota=0
    sL108_przyc=0
    sL109_koszt=0
    sL112_zwoln=0
    sL113_kwota=0
    sm117_przyc=0
    sm118_koszt=0
    sm124_przyc=0
    sm125_koszt=0
    sm224_przyc=0
    sm225_koszt=0
    sm324_przyc=0
    sm325_koszt=0
    sm424_przyc=0
    sm425_koszt=0
RETURN



FUNCTION ZPIT5_LICZ()
local i,recno:=recno()
* Obliczenia narastaj•ce
spit5_zer()
      if reclock(5)      
	    replace j59_zalicz with 0
		unlock
	  endif	
  go top
  for i=1 to f_tmiesiac
    sd31_zwolni=sd31_zwolni+d31_zwolni
	sd32_straty=sd32_straty+d32_straty
	se34_skladk=se34_skladk+e34_skladk
	se35_odlicz=se35_odlicz+e35_odlicz
	se36_wydatk=se36_wydatk+e36_wydatk
	se37_wydatk=se37_wydatk+e37_wydatk
	se38_wydatk=se38_wydatk+e38_wydatk
	se39_wydatk=se39_wydatk+e39_wydatk
	se40_ulgi=se40_ulgi+e40_ulgi
	se41_cele=se41_cele+e41_cele
	se43_inne=se43_inne+e43_inne
	sf44_obnizk=sf44_obnizk+f44_obnizk
	sf45_premia=sf45_premia+f45_premia
	sg46_zwolni=sg46_zwolni+g46_zwolni
	si48_kwoty=si48_kwoty+i48_kwoty
	sj51_zdrowo=sj51_zdrowo+j51_zdrowo
    sj52_ulgi=sj52_ulgi+j52_ulgi
    sj53_ulgi=sj53_ulgi+j53_ulgi
    sj55_ograni=sj55_ograni+j55_ograni
    sj59_zalicz=sj59_zalicz+j59_zalicz
    sj61_remane=sj61_remane+j61_remane
    sj63_odsetk=sj63_odsetk+j63_odsetk
    sk69_przych=sk69_przych+k69_przych
    sk70_koszty=sk70_koszty+k70_koszty    
    sk78_przych=sk78_przych+k78_przych
    sk79_koszty=sk79_koszty+k79_koszty
    sk178_przych=sk178_przych+k178_przych
    sk179_koszty=sk179_koszty+k179_koszty
    sk278_przych=sk278_przych+k278_przych
    sk279_koszty=sk279_koszty+k279_koszty
    sk378_przych=sk378_przych+k378_przych
    sk379_koszty=sk379_koszty+k379_koszty
    sL92_przych=sL92_przych+L92_przych
    sL93_koszty=sL93_koszty+L93_koszty
    sL96_zwolni=sL96_zwolni+L96_zwolni
    sL97_kwota=sL97_kwota+L97_kwota
    sL108_przyc=sL108_przyc+L108_przyc
    sL109_koszt=sL109_koszt+L109_koszt
    sL112_zwoln=sL112_zwoln+L112_zwoln
    sL113_kwota=sL113_kwota+L113_kwota
    sm117_przyc=sm117_przyc+m117_przyc
    sm118_koszt=sm118_koszt+m118_koszt
    sm124_przyc=sm124_przyc+m124_przyc
    sm125_koszt=sm125_koszt+m125_koszt
    sm224_przyc=sm224_przyc+m224_przyc
    sm225_koszt=sm225_koszt+m225_koszt
    sm324_przyc=sm324_przyc+m324_przyc
    sm325_koszt=sm325_koszt+m325_koszt
    sm424_przyc=sm424_przyc+m424_przyc
    sm425_koszt=sm425_koszt+m425_koszt
	skip
  next
go recno
*Obliczenia

oc19_przych=kj_round(sk69_przych*(zk68_udzial/100),2)+sk78_przych+sk178_przyc+sk278_przyc+sk378_przyc+sL92_przych+sL108_przyc
oc20_koszty=kj_round(sk70_koszty*(zk68_udzial/100),2)+sk79_koszty+sk179_koszt+sk279_koszt+sk379_koszt+sL93_koszty+sL109_koszt

*
oc23_przych=sm117_przyc+sm124_przyc+ sm224_przyc+ sm324_przyc+ sm424_przyc
oc24_koszty=sm118_koszt+sm125_koszt+sm225_koszt+sm325_koszt+sm425_koszt


  oc21_dochod=ifminus(oc19_przych-oc20_koszty)
  oc22_strata=ifminus(oc20_koszty-oc19_przych)
  oc25_dochod=ifminus(oc23_przych-oc24_koszty)
  oc26_strata=ifminus(oc24_koszty-oc23_przych)

oc27_przych=oc19_przych+oc23_przych
oc28_koszty=oc20_koszty+oc24_koszty
oc29_dochod=ifminus(oc21_dochod)+ifminus(oc25_dochod)
oc30_strata=ifminus(oc22_strata)+ifminus(oc26_strata)
od33_dochod=oc29_dochod-(sd31_zwolni+sd32_straty)
ok71_dochod=ifminus(kj_round(sk69_przych*(zk68_udzial/100),2)-kj_round(sk70_koszty*(zk68_udzial/100),2))
ok72_strata=ifminus(kj_round(sk70_koszty*(zk68_udzial/100),2)-kj_round(sk69_przych*(zk68_udzial/100),2))
  ok80_dochod=ifminus(zk78_przych-zk79_koszty)
  ok81_strata=ifminus(zk79_koszty-zk78_przych)
  ok180_dochod=ifminus(zk178_przych-zk179_koszty)
  ok181_strata=ifminus(zk179_koszty-zk178_przych)
  ok280_dochod=ifminus(zk278_przych-zk279_koszty)
  ok281_strata=ifminus(zk279_koszty-zk278_przych)
  ok380_dochod=ifminus(zk378_przych-zk379_koszty)
  ok381_strata=ifminus(zk379_koszty-zk378_przych)
  oL94_dochod=ifminus(zL92_przych-zL93_koszty)
  oL95_strata=ifminus(zL93_koszty-zL92_przych)
  oL110_dochod=ifminus(zL108_przych-zL109_koszty)
  oL111_strata=ifminus(zL109_koszty-zL108_przych)
  om119_dochod=ifminus(zm117_przych-zm118_koszty)
  om120_strata=ifminus(zm118_koszty-zm117_przych)
  om126_dochod=ifminus(zm124_przych-zm125_koszty)
  om127_strata=ifminus(zm125_koszty-zm124_przych)
  om226_dochod=ifminus(zm224_przych-zm225_koszty)
  om227_strata=ifminus(zm225_koszty-zm224_przych)
  om326_dochod=ifminus(zm324_przych-zm325_koszty)
  om327_strata=ifminus(zm325_koszty-zm324_przych)
  om426_dochod=ifminus(zm424_przych-zm425_koszty)
  om427_strata=ifminus(zm425_koszty-zm424_przych)

if recno=12
  oh47_dochod=od33_dochod-(se34_skladk+se35_odlicz+se36_wydatk+se37_wydatk+se38_wydatk+se39_wydatk+se40_ulgi+se41_cele+se43_inne+sf44_obnizk+sf45_premia+sg46_zwolni)+((zk68_udzial/100)*(za_remanent-zp_remanent))
else
  oh47_dochod=od33_dochod-(se34_skladk+se35_odlicz+se36_wydatk+se37_wydatk+se38_wydatk+se39_wydatk+se40_ulgi+se41_cele+se43_inne+sf44_obnizk+sf45_premia+sg46_zwolni)
endif
*PODSTAWA
do case
  case oc21_dochod>0
    oi49_podstawa=kj_round(oh47_dochod+si48_kwoty,0)
  case oc21_dochod=0.and.oc22_strata<si48_kwoty
    oi49_podstawa=kj_round(oh47_dochod+si48_kwoty-oc22_straty,0)
  otherwise
    oi49_podstawa=kj_round(oh47_dochod,0)
endcase
*PODATEK
do case
  case oi49_podstawa<=zrprog2
    oj50_podatek=kj_round(oi49_podstawa*zrstopa1/100+zrdolicz1,2)
	if oj50_podatek<0
	  oj50_podatek=0
	endif
  case oi49_podstawa>zrprog2.and.oi49_podstawa<=zrprog3
    oj50_podatek=kj_round(((oi49_podstawa-zrprog2)*zrstopa2)/100+zrdolicz2,2)	
  case oi49_podstawa>zrprog3
    oj50_podatek=kj_round(((oi49_podstawa-zrprog3)*zrstopa3)/100+zrdolicz3,2)	
endcase
oj57_podatek=ifminus(oj50_podatek-(sj51_zdrowo+sj52_ulgi+sj53_ulgi+sj55_ograni))
*oj58_suma=sj59_zalicz-zj59_zalicz
oj58_suma=sj59_zalicz
*zj59_zalicz=ifminus(kj_round(oj57_podatek-oj58_suma,1))
zj59_zalicz=ifminus(kj_round(oj57_podatek-oj58_suma,0))  &&060216
oj60_suma=ifminus(oj58_suma)+zj59_zalicz
oj62_kwota=zj59_zalicz+zj61_remane
RETURN

FUNCTION D_DOCHOD()
local ek,ek1,w:=5,k:=6,lcolor:=setcolor()
pit5_lad()
save screen to ek
kj_okno(0,0,24," D. DOCH‡D PO ODLICZENIU DOCHODU ZWOLNIONEGO I STRAT                            ",2)
@ w,k say   "Doch¢d zwolniony od podatku "
@ w+1,k say "       zaksi©gowany w bieæ•cym miesi•cu ............"
@ w+2,k say "       zaksi©gowany od pocz•tku roku ..............."
@ w+4,k say "Straty z lat ubiegàych "
@ w+5,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
@ w+6,k say "       zaksi©gowane od pocz•tku roku ..............."
@ w+8,k say "Doch¢d po odliczeniu dochodu zwolnionego i strat ..."
@ w+2,k+54 say sd31_zwolni picture "999999999.99"
@ w+6,k+54 say sd32_straty picture "999999999.99"
set cursor on
@ w+1,k+54 get zd31_zwolni picture "999999999.99" when s_kom("rubryka 31 PIT-5(11)")
@ w+5,k+54 get zd32_straty picture "999999999.99" when s_kom("rubryka 32 PIT-5(11)")
read
set cursor off
save screen to ek1
if kj_gkom(17,"","ZatwierdziÜ ? ","",.t.,5) 
  restore screen from ek1
  pit5_replac()
  zpit5_licz()  
  @ w+8,k+54 say od33_dochod picture "999999999.99"
  @ w+2,k+54 say sd31_zwolni picture "999999999.99"
  @ w+6,k+54 say sd32_straty picture "999999999.99"  
  s_kom("Naciònij dowolny klawisz")
  inkey(0)
else
  pit5_lad()
endif

restore screen from ek
setcolor(lcolor)
RETURN

FUNCTION E_ODLICZENIA(prodz)
local ek,w:=3,k:=6,lcolor:=setcolor(),k1
pit5_lad()
k1=k-4
save screen to ek
kj_okno(0,0,24," E. ODLICZENIA OD DOCHODU                                                       ",2)
do case
  case prodz=1
    @ w,k say "ODLICZENIA OD DOCHODU NA PODSTAWIE ART.28 UST.1 PKT 2-6 i 9-10 USTAWY"
    w=5
	@ w,k say   "Skàadki okreòlone w przepisach o systemie ubezpiecze‰ spoàecznych"
    @ w+1,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+2,k say "       zaksi©gowane od pocz•tku roku ..............."
    @ w+4,k say "Odliczenia na podstawie art.26 ust.1 pkt 3-6 i 9-10 ustawy"
	@ w+5,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+6,k say "       zaksi©gowane od pocz•tku roku ..............."

    @ w+2,k+54 say se34_skladk picture "999999999.99"
    @ w+6,k+54 say se35_odlicz picture "999999999.99"
    set cursor on
    @ w+1,k+54 get ze34_skladk picture "999999999.99" when s_kom("rubryka 34 PIT-5(11)")
    @ w+5,k+54 get ze35_odlicz picture "999999999.99" when s_kom("rubryka 35 PIT-5(11)")
    read
    set cursor off
    save screen to ek1
    if kj_gkom(17,"","ZatwierdziÜ ? ","",.t.,5) 
      restore screen from ek1
      pit5_replac()
      zpit5_licz()  
      @ w+2,k+54 say se34_skladk picture "999999999.99"
      @ w+6,k+54 say se35_odlicz picture "999999999.99"
      s_kom("Naciònij dowolny klawisz")
      inkey(0)
    else
      pit5_lad()
    endif
  case prodz=2
    @ w,k say "ODLICZENIA OD DOCHODU NA BUDOWNICTWO WIELORODZINNE NA WYNAJEM"
    w=5
	@ w,k say   "Wydatki poniesione w latach ubiegàych:"
    @ w+1,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+2,k say "       zaksi©gowane od pocz•tku roku ..............."
    @ w+4,k say "Wydatki poniesione w roku podatkowym na kontynuacj©:"
	@ w+5,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+6,k say "       zaksi©gowane od pocz•tku roku ..............."

    @ w+2,k+54 say se36_wydatk picture "999999999.99"
    @ w+6,k+54 say se37_wydatk picture "999999999.99"
    set cursor on
    @ w+1,k+54 get ze36_wydatk picture "999999999.99" when s_kom("rubryka 36 PIT-5(11)")
    @ w+5,k+54 get ze37_wydatk picture "999999999.99" when s_kom("rubryka 37 PIT-5(11)")
    read
    set cursor off
    save screen to ek1
    if kj_gkom(17,"","ZatwierdziÜ ? ","",.t.,5) 
      restore screen from ek1
      pit5_replac()
      zpit5_licz()  
      @ w+2,k+54 say se36_wydatk picture "999999999.99"
      @ w+6,k+54 say se37_wydatk picture "999999999.99"
      s_kom("Naciònij dowolny klawisz")
      inkey(0)
    else
      pit5_lad()
    endif	
	
  case prodz=3
    @ w,k say "ODLICZENIA OD DOCHODU WYDATK‡W MIESZKANIOWYCH"
    w=5
	@ w,k say   "Wydatki poniesione w latach ubiegàych:"
    @ w+1,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+2,k say "       zaksi©gowane od pocz•tku roku ..............."
    @ w+4,k say "Wydatki poniesione w roku podatkowym na kontynuacj©:"
	@ w+5,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+6,k say "       zaksi©gowane od pocz•tku roku ..............."

    @ w+2,k+54 say se38_wydatk picture "999999999.99"
    @ w+6,k+54 say se39_wydatk picture "999999999.99"
    set cursor on
    @ w+1,k+54 get ze38_wydatk picture "999999999.99" when s_kom("rubryka 38 PIT-5(11)")
    @ w+5,k+54 get ze39_wydatk picture "999999999.99" when s_kom("rubryka 39 PIT-5(11)")
    read
    set cursor off
    save screen to ek1
    if kj_gkom(17,"","ZatwierdziÜ ? ","",.t.,5) 
      restore screen from ek1
      pit5_replac()
      zpit5_licz()  
      @ w+2,k+54 say se38_wydatk picture "999999999.99"
      @ w+6,k+54 say se39_wydatk picture "999999999.99"
      s_kom("Naciònij dowolny klawisz")
      inkey(0)
    else
      pit5_lad()
    endif		

  case prodz=4
    @ w,k say "ODLICZENIA WYD. MIESZKAN., DO KT‡RYCH NABYTO PRAWO W LATACH UBIEGùYCH"
    w=5
	@ w,k say   "Przysàuguj•ce, lecz nie zrealizowane ulgi:"
    @ w+1,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+2,k say "       zaksi©gowane od pocz•tku roku ..............."
    @ w+4,k say "Wydatki na cele mieszkaniowe:"
	@ w+5,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+6,k say "       zaksi©gowane od pocz•tku roku ..............."

    @ w+2,k+54 say se40_ulgi picture "999999999.99"
    @ w+6,k+54 say se41_cele picture "999999999.99"
    set cursor on
    @ w+1,k+54 get ze40_ulgi picture "999999999.99" when s_kom("rubryka 40 PIT-5(11)")
    @ w+5,k+54 get ze41_cele picture "999999999.99" when s_kom("rubryka 41 PIT-5(11)")
    read
    set cursor off
    save screen to ek1
    if kj_gkom(17,"","ZatwierdziÜ ? ","",.t.,5) 
      restore screen from ek1
      pit5_replac()
      zpit5_licz()  
      @ w+2,k+54 say se40_ulgi picture "999999999.99"
      @ w+6,k+54 say se41_cele picture "999999999.99"
      s_kom("Naciònij dowolny klawisz")
      inkey(0)
    else
      pit5_lad()
    endif			

  case prodz=5
    @ w,k say "INNE ODLICZENIA "
    w=5
	@ w,k say   "Inne odliczenia: rodzaj ........."                        
    w=6
	@ w+1,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+2,k say "       zaksi©gowane od pocz•tku roku ..............."

    @ w+2,k+54 say se43_inne picture "999999999.99"
    set cursor on
    @ w-1,k+36 get ze42_rodzaj  when s_kom("rubryka 42 PIT-5(11)")
	@ w+1,k+54 get ze43_inne picture "999999999.99" when s_kom("rubryka 43 PIT-5(11)")
    read
    set cursor off
    save screen to ek1
    if kj_gkom(17,"","ZatwierdziÜ ? ","",.t.,5) 
      restore screen from ek1
      pit5_replac()
      zpit5_licz()  
      @ w+2,k+54 say se43_inne picture "999999999.99"
      s_kom("Naciònij dowolny klawisz")
      inkey(0)
    else
      pit5_lad()
    endif			
  
endcase
restore screen from ek
setcolor(lcolor)
RETURN



FUNCTION F_ODLICZENIE()
local ek,w:=5,k:=6,lcolor:=setcolor()
pit5_lad()
save screen to ek
kj_okno(0,0,24," F. ODLICZENIE Z TYTUùU WYDATK‡W INWESTYCYJNYCH                                 ",2)
*
    w=5
	@ w,k say   "Dodatkowa obniæka:"
    @ w+1,k say "       zaksi©gowana w bieæ•cym miesi•cu ............"
    @ w+2,k say "       zaksi©gowana od pocz•tku roku ..............."
    @ w+4,k say "Wydatki inwestycyjne i premia inwestycyjna:"
	@ w+5,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+6,k say "       zaksi©gowane od pocz•tku roku ..............."

    @ w+2,k+54 say sf44_obnizk picture "999999999.99"
    @ w+6,k+54 say sf45_premia picture "999999999.99"
    set cursor on
    @ w+1,k+54 get zf44_obnizk picture "999999999.99" when s_kom("rubryka 44 PIT-5(11)")
    @ w+5,k+54 get zf45_premia picture "999999999.99" when s_kom("rubryka 45 PIT-5(11)")
    read
    set cursor off
    save screen to ek1
    if kj_gkom(17,"","ZatwierdziÜ ? ","",.t.,5) 
      restore screen from ek1
      pit5_replac()
      zpit5_licz()  
      @ w+2,k+54 say sf44_obnizk picture "999999999.99"
      @ w+6,k+54 say sf45_premia picture "999999999.99"
      s_kom("Naciònij dowolny klawisz")
      inkey(0)
    else
      pit5_lad()
    endif		
*
restore screen from ek
setcolor(lcolor)
RETURN

FUNCTION G_DOCHOD()
local ek,ek1,w:=5,k:=6,lcolor:=setcolor()
pit5_lad()
save screen to ek
kj_okno(0,0,24," G. DOCHOD ZWOLNIONY OD PODATKU                                                 ",2)
@ w,k say   "Doch¢d zwolniony od podatku:"
@ w+1,k say "       zaksi©gowana w bieæ•cym miesi•cu ............"
@ w+2,k say "       zaksi©gowana od pocz•tku roku ..............."
@ w+2,k+54 say sg46_zwolni picture "999999999.99"
set cursor on
@ w+1,k+54 get zg46_zwolni picture "999999999.99" when s_kom("rubryka 46 PIT-5(11)")
read
set cursor off
    save screen to ek1
	if kj_gkom(17,"","ZatwierdziÜ ? ","",.t.,5) 
      restore screen from ek1
      pit5_replac()
      zpit5_licz()  
      @ w+2,k+54 say sg46_zwolni picture "999999999.99"
      s_kom("Naciònij dowolny klawisz")
      inkey(0)
    else
      pit5_lad()
    endif		

restore screen from ek
setcolor(lcolor)
RETURN


FUNCTION H_DOCHOD()
local ek,w:=7,k:=6,lcolor:=setcolor()
pit5_lad()
save screen to ek
kj_okno(0,0,24," H. DOCHOD PO ODLICZENIACH                                                      ",2)
@ w,k say   "Doch¢d po odliczeniu ulg i zwolnie‰ ................"
@ w,k+54 say oh47_dochod picture "999999999.99"
s_kom("Naciònij dowolny klawisz")
inkey(0)
restore screen from ek
setcolor(lcolor)
RETURN

FUNCTION I_USTALENIE()
local ek,w:=5,k:=6,lcolor:=setcolor()
pit5_lad()
save screen to ek
kj_okno(0,0,24," I. USTALENIE PODSTAWY OBLICZENIA PODATKU                                             ",2)
*
@ w,k say   "Kwoty zwi©kszaj•ce podstaw© opodatkowania:"
@ w+1,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
@ w+2,k say "       zaksi©gowane od pocz•tku roku ..............."
@ w+2,k+54 say si48_kwoty picture "999999999.99"
set cursor on
@ w+1,k+54 get zi48_kwoty picture "999999999.99" when s_kom("rubryka 48 PIT-5(11)")
read
set cursor off
    save screen to ek1
	if kj_gkom(17,"","ZatwierdziÜ ? ","",.t.,5) 
      restore screen from ek1
      pit5_replac()
      zpit5_licz()  
      @ w+2,k+54 say si48_kwoty picture "999999999.99"
      s_kom("Naciònij dowolny klawisz")
      inkey(0)
    else
      pit5_lad()
    endif		
*
restore screen from ek
setcolor(lcolor)
RETURN


FUNCTION KPIT_MENU(ppoz)
local ltnaz[5],ltlit[5],ltopis[5],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" 1. Pozarolnicza dziaàalnoòÜ gospodarcza "
ltnaz[2]:=" 2. Pozarolnicza dziaàalnoòÜ gospodarcza "
ltnaz[3]:=" 3. Pozarolnicza dziaàalnoòÜ gospodarcza "
ltnaz[4]:=" 4. Pozarolnicza dziaàalnoòÜ gospodarcza "
ltnaz[5]:=" 5. Pozarolnicza dziaàalnoòÜ gospodarcza "

ltlit[1]:=" 1"
ltlit[2]:=" 2"
ltlit[3]:=" 3"
ltlit[4]:=" 4"
ltlit[5]:=" 5"
ltopis[1]:="w tym r¢wnieæ udziaà w sp¢àkach niemaj•cych osobowoòci prawnej"
ltopis[2]:="w tym r¢wnieæ udziaà w sp¢àkach niemaj•cych osobowoòci prawnej"
ltopis[3]:="w tym r¢wnieæ udziaà w sp¢àkach niemaj•cych osobowoòci prawnej"
ltopis[4]:="w tym r¢wnieæ udziaà w sp¢àkach niemaj•cych osobowoòci prawnej"
ltopis[5]:="w tym r¢wnieæ udziaà w sp¢àkach niemaj•cych osobowoòci prawnej"

  lpoz=men_pion(8,20,5,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION ODL_MENU(ppoz)
local ltnaz[5],ltlit[5],ltopis[5],lbelka:=" ODLICZENIA OD DOCHOD‡W                                     ",lpoz:=ppoz
ltnaz[1]:=" E1. NA PODSTAWIE ART.26 UST.1 PKT 2-6 i 9-10 USTAWY         "
ltnaz[2]:=" E2. NA BUDOWNICTWO WIELORODZINNE NA WYNAJEM                 "
ltnaz[3]:=" E3. WYDATK‡W MIESZKANIOWYCH                                 "
ltnaz[4]:=" E4. WYD. MIESZK. DO KT‡RYCH NABYTO PRAWA W LATACH UBIEGùYCH "
ltnaz[5]:=" E5. INNE, NIE WYMIENIONE W CZ®óCIACH OD E1 DO E4            "

ltlit[1]:="  1"
ltlit[2]:="  2"
ltlit[3]:="  3"
ltlit[4]:="  4"
ltlit[5]:="  5"
ltopis[1]:="Rubryka E.1. "
ltopis[2]:="Rubryka E.2. "
ltopis[3]:="Rubryka E.3. "
ltopis[4]:="Rubryka E.4. "
ltopis[5]:="Rubryka E.5. "

  lpoz=men_pion(8,10,5,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION J_MENU(ppoz)
local ltnaz[5],ltlit[5],ltopis[5],lbelka:=" ODLICZENIA OD DOCHOD‡W                               ",lpoz:=ppoz
ltnaz[1]:=" J1. OBLICZENIE PODATKU                                "
ltnaz[2]:=" J2. ODLICZENIA OD PODATKU                             "
ltnaz[3]:=" J3. OGRANICZENIE WYSOKOóCI ZAL                        "
ltnaz[4]:=" J4. OBLICZENIE NALEΩNEJ ZALICZ                        "
ltnaz[5]:=" J5. OBLICZENIE ZOBOWI§ZANIA PRZYPADAJ§CEGO DO ZAPùATY "

ltlit[1]:="  1"
ltlit[2]:="  2"
ltlit[3]:="  3"
ltlit[4]:="  4"
ltlit[5]:="  5"
ltopis[1]:="Rubryka J.1. "
ltopis[2]:="Rubryka J.2. "
ltopis[3]:="Rubryka J.3. "
ltopis[4]:="Rubryka J.4. "
ltopis[5]:="Rubryka J.5. "

  lpoz=men_pion(8,13,5,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz



FUNCTION L_MENU(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" 1. Pozarolnicza dziaàalnoòÜ gospodarcza "
ltnaz[2]:=" 2. Pozarolnicza dziaàalnoòÜ gospodarcza "

ltlit[1]:=" 1"
ltlit[2]:=" 2"
ltopis[1]:="prowadzona na terenie specjalnej strefy ekonomicznej"
ltopis[2]:="prowadzona na terenie specjalnej strefy ekonomicznej"

  lpoz=men_pion(10,20,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz



FUNCTION OPCJEGET_MENU(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Wsp¢lne "
ltnaz[2]:=" Lokalne "

ltlit[1]:=" W"
ltlit[2]:=" L"
ltopis[1]:="Parametry wsp¢lne dla wszystkich firm"
ltopis[2]:="Parametry tylko dla aktualnie obsàugiwanej firmy"

  lpoz=men_pion(10,26,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz


FUNCTION MPIT5_MENU(ppoz)
local ltnaz[5],ltlit[5],ltopis[5],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" 1. Najem, podnajem, dzieræawa oraz inne "
ltnaz[2]:=" 2. Najem, podnajem, dzieræawa oraz inne "
ltnaz[3]:=" 3. Najem, podnajem, dzieræawa oraz inne "
ltnaz[4]:=" 4. Najem, podnajem, dzieræawa oraz inne "
ltnaz[5]:=" 5. Najem, podnajem, dzieræawa oraz inne "

ltlit[1]:=" 1"
ltlit[2]:=" 2"
ltlit[3]:=" 3"
ltlit[4]:=" 4"
ltlit[5]:=" 5"
ltopis[1]:="umowy o podobnym charakterze, wsp¢àwàasnoòÜ i wsp¢lne posiadanie"
ltopis[2]:="umowy o podobnym charakterze, wsp¢àwàasnoòÜ i wsp¢lne posiadanie"
ltopis[3]:="umowy o podobnym charakterze, wsp¢àwàasnoòÜ i wsp¢lne posiadanie"
ltopis[4]:="umowy o podobnym charakterze, wsp¢àwàasnoòÜ i wsp¢lne posiadanie"
ltopis[5]:="umowy o podobnym charakterze, wsp¢àwàasnoòÜ i wsp¢lne posiadanie"

  lpoz=men_pion(8,20,5,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz



FUNCTION K_POZAROLNICZA(ppoz)
local ek,w:=3,k:=2,lcolor:=setcolor()
local lk64_nip:=space(13),lk65_regon:=space(14),lk66_nazwa:=space(40)
local lk67_miejsc:=space(40),lk68_udzial:=0
local lk73_nip:=space(13),lk74_regon:=space(14),lk75_nazwa:=space(40)
local lk76_miejsc:=space(40),lk77_udzial:=0
local lk173_nip:=space(13),lk174_regon:=space(14),lk175_nazwa:=space(40)
local lk176_miejsc:=space(40),lk177_udzial:=0
local lk273_nip:=space(13),lk274_regon:=space(14),lk275_nazwa:=space(40)
local lk276_miejsc:=space(40),lk277_udzial:=0
local lk373_nip:=space(13),lk374_regon:=space(14),lk375_nazwa:=space(40)
local lk376_miejsc:=space(40),lk377_udzial:=0

pit5_lad()
  lk64_nip:=zk64_nip
  lk65_regon:=zk65_regon
  lk66_nazwa:=zk66_nazwa
  lk67_miejsc:=zk67_miejsc
  lk68_udzial:=zk68_udzial
  lk73_nip:=zk73_nip
  lk74_regon:=zk74_regon
  lk75_nazwa:=zk75_nazwa
  lk76_miejsc:=zk76_miejsc
  lk77_udzial:=zk77_udzial
  lk173_nip:=zk173_nip
  lk174_regon:=zk174_regon
  lk175_nazwa:=zk175_nazwa
  lk176_miejsc:=zk176_miejsc
  lk177_udzial:=zk177_udzial
  lk273_nip:=zk273_nip
  lk274_regon:=zk274_regon
  lk275_nazwa:=zk275_nazwa
  lk276_miejsc:=zk276_miejsc
  lk277_udzial:=zk277_udzial
  lk373_nip:=zk373_nip
  lk374_regon:=zk374_regon
  lk375_nazwa:=zk375_nazwa
  lk376_miejsc:=zk376_miejsc
  lk377_udzial:=zk377_udzial
save screen to ek
kj_okno(0,0,24," K. POZAROLNICZA DZIAùALNOóè GOSPODARCZA                                              ",2)
@ w,k say   "Numer Identyfikacji Podatkowej ....."
@ w+2,k  say "Identyfikator REGON ................"
@ w+4,k  say "Nazwa peàna ........................"
@ w+6,k  say "Miejsce prowadzenia dziaàalnioòci .."
@ w+8,k  say "Udziaà w % ........................."
@ w+10,k say "Przych¢d ..........................."
@ w+12,k say "Koszty ............................."
@ w+14,k say "Doch¢d ............................."
@ w+16,k say "Strata ............................."
set cursor on
do case
  case ppoz=1
    @ w,k+37 get lk64_nip 
    @ w+2,k+37 get lk65_regon
    @ w+4,k+37 get lk66_nazwa
	@ w+6,k+37 get lk67_miejsc
	@ w+8,k+37 get lk68_udzial picture "999.999999"
  case ppoz=2
    @ w,k+37 get lk73_nip 
    @ w+2,k+37 get lk74_regon
    @ w+4,k+37 get lk75_nazwa
	@ w+6,k+37 get lk76_miejsc
	@ w+8,k+37 get lk77_udzial picture "999.999999"
	@ w+10,k+37 get zk78_przych picture "999999999.99" 
	@ w+12,k+37 get zk79_koszty picture "999999999.99" 
  case ppoz=3
    @ w,k+37 get lk173_nip 
    @ w+2,k+37 get lk174_regon
    @ w+4,k+37 get lk175_nazwa
	@ w+6,k+37 get lk176_miejsc
	@ w+8,k+37 get lk177_udzial picture "999.999999"
	@ w+10,k+37 get zk178_przych picture "999999999.99" 
	@ w+12,k+37 get zk179_koszty picture "999999999.99" 	
  case ppoz=4
    @ w,k+37 get lk273_nip 
    @ w+2,k+37 get lk274_regon
    @ w+4,k+37 get lk275_nazwa
	@ w+6,k+37 get lk276_miejsc
	@ w+8,k+37 get lk277_udzial picture "999.999999"
	@ w+10,k+37 get zk278_przych picture "999999999.99" 
	@ w+12,k+37 get zk279_koszty picture "999999999.99" 	
  case ppoz=5
    @ w,k+37 get lk373_nip 
    @ w+2,k+37 get lk374_regon
    @ w+4,k+37 get lk375_nazwa
	@ w+6,k+37 get lk376_miejsc
	@ w+8,k+37 get lk377_udzial picture "999.999999"
	@ w+10,k+37 get zk378_przych picture "999999999.99" 
	@ w+12,k+37 get zk379_koszty picture "999999999.99" 			
endcase
    read
set cursor off

zpit5_licz()  
do case
  case ppoz=1
    if.not.lk68_udzial=zk68_udzial
	  @ w+10,k say space(60)
	  @ w+12,k say space(60)
	  @ w+14,k say space(60)
	  @ w+16,k say space(60)
	else
	  @ w+10,k+37 say kj_round(sk69_przych*(zk68_udzial/100),2) picture "999999999.99"
      @ w+12,k+37 say kj_round(sk70_koszty*(zk68_udzial/100),2) picture "999999999.99"
      @ w+14,k+37 say ok71_dochod picture "999999999.99" 
      @ w+16,k+37 say ok72_strata picture "999999999.99"
	endif  
  case ppoz=2
    @ w+14,k+37 say ok80_dochod picture "999999999.99" 
    @ w+16,k+37 say ok81_strata picture "999999999.99"    
  case ppoz=3
    @ w+14,k+37 say ok180_dochod picture "999999999.99" 
    @ w+16,k+37 say ok181_strata picture "999999999.99"    	
  case ppoz=4
    @ w+14,k+37 say ok280_dochod picture "999999999.99" 
    @ w+16,k+37 say ok281_strata picture "999999999.99"    	
  case ppoz=5
    @ w+14,k+37 say ok380_dochod picture "999999999.99" 
    @ w+16,k+37 say ok381_strata picture "999999999.99"    			
endcase

if kj_gkom(20,"","ZatwierdziÜ ? ","",.t.,5) 
*
  zk64_nip=lk64_nip
  zk65_regon=lk65_regon
  zk66_nazwa=lk66_nazwa
  zk67_miejsc=lk67_miejsc
  zk68_udzial=lk68_udzial
  zk73_nip=lk73_nip
  zk74_regon=lk74_regon
  zk75_nazwa=lk75_nazwa
  zk76_miejsc=lk76_miejsc
  zk77_udzial=lk77_udzial
  zk173_nip=lk173_nip
  zk174_regon=lk174_regon
  zk175_nazwa=lk175_nazwa
  zk176_miejsc=lk176_miejsc
  zk177_udzial=lk177_udzial
  zk273_nip=lk273_nip
  zk274_regon=lk274_regon
  zk275_nazwa=lk275_nazwa
  zk276_miejsc=lk276_miejsc
  zk277_udzial=lk277_udzial
  zk373_nip=lk373_nip
  zk374_regon=lk374_regon
  zk375_nazwa=lk375_nazwa
  zk376_miejsc=lk376_miejsc
  zk377_udzial=lk377_udzial
*
  pit5_replac()
else
  pit5_lad()
endif
zpit5_licz()  
restore screen from ek
setcolor(lcolor)
RETURN


FUNCTION L_POZAROLNICZA(ppoz)
local ek,w:=2,k:=2,lcolor:=setcolor()
pit5_lad()
save screen to ek
kj_okno(0,0,24," L. POZAROLNICZA DZIAùALNOóè GOSPODARCZA PROWADZONA NA TERENIE SPECJALNEJ STREFY EKON.",2)
@ w,k say   "Rodzaj dziaàalnoòci ................"
@ w+1,k say "Numer Identyfikacji Podatkowej ....."
@ w+2,k say "Identyfikator REGON ................"
@ w+3,k  say "Nazwa peàna ........................"
@ w+4,k  say "Miejsce prowadzenia dziaàalnioòci .."
@ w+5,k say  "Numer zezwolenia ..................."
@ w+6,k say  "Data wydania zezwolenia ............"
@ w+7,k say  "Data rozpocz©cia dziaàalnoòci ......"
@ w+9,k say  "Zasady prowadzenia dziaàalnoòci:    "
@ w+10,k+3 say "Podatnik nie korzysta ze zwolnie‰ i preferencji ....."
@ w+11,k+3 say "Podatnik korzysta z preferencji ....................."
@ w+12,k+3 say "Podatnik korzysta ze zwolnie‰ ......................."
@ w+14,k  say "Udziaà w % ........................."
@ w+15,k say "Przych¢d ..........................."
@ w+16,k say "Koszty ............................."
@ w+17,k say "Doch¢d zwolniony od podatku ........"
@ w+18,k say "Kwota zwi©kszaj•ca podstaw© opodatk."
@ w+20,k say "Doch¢d ............................................"
@ w+21,k say "Strata ............................................"

set cursor on
do case
  case ppoz=1
    @ w,k+37 get zL82_rodzaj
    @ w+1,k+37 get zL83_nip 
    @ w+2,k+37 get zL84_regon
    @ w+3,k+37 get zL85_nazwa
	@ w+4,k+37 get zL86_miejsc
	@ w+5,k+37 get zL87_zezwol
	@ w+6,k+37 get zL88_data_w
	@ w+7,k+37 get zL89_data_r
    @ w+10,k+54 get zL901_zasad
    @ w+11,k+54 get zL902_zasad
    @ w+12,k+54 get zL903_zasad		
	@ w+14,k+37 get zL91_udzial picture "999.999999"
	@ w+15,k+37 get zL92_przych picture "999999999.99"
	@ w+16,k+37 get zL93_koszty picture "999999999.99"	
	@ w+17,k+37 get zL96_zwolni picture "999999999.99"	
	@ w+18,k+37 get zL97_kwota picture "999999999.99"	
  case ppoz=2
    @ w,k+37 get zL98_rodzaj
    @ w+1,k+37 get zL99_nip 
    @ w+2,k+37 get zL100_regon
    @ w+3,k+37 get zL101_nazwa
	@ w+4,k+37 get zL102_miejs
	@ w+5,k+37 get zL103_zezwo
	@ w+6,k+37 get zL104_data_
	@ w+7,k+37 get zL105_data_
    @ w+10,k+54 get zL1061_zasa
    @ w+11,k+54 get zL1062_zasa
    @ w+12,k+54 get zL1063_zasa		
	@ w+14,k+37 get zL107_udzial picture "999.999999"
	@ w+15,k+37 get zL108_przych picture "999999999.99"
	@ w+16,k+37 get zL109_koszty picture "999999999.99"	
	@ w+17,k+37 get zL112_zwoln picture "999999999.99"	
	@ w+18,k+37 get zL113_kwota picture "999999999.99"		
endcase
read
set cursor off
zpit5_licz()  
do case
  case ppoz=1
    @ w+20,k+52 say oL94_dochod picture "999999999.99"
	@ w+21,k+52 say oL95_strata picture "999999999.99"
  case ppoz=2
    @ w+20,k+52 say oL110_dochod picture "999999999.99"
	@ w+21,k+52 say oL111_strata picture "999999999.99"
endcase
if kj_gkom(20,"","ZatwierdziÜ ? ","",.t.,5) 
  pit5_replac()
else
  pit5_lad()
endif
restore screen from ek
setcolor(lcolor)
RETURN


FUNCTION M_NAJEM(ppoz)
local ek,w:=3,k:=2,lcolor:=setcolor()
pit5_lad()
save screen to ek
kj_okno(0,0,24," M. NAJEM, PODNAJEM, DZIERΩAWA ORAZ INNE UMOWY O PODOBNYM CHARAKTERZE                 ",2)
@ w,k say    "çr¢dào przychodu ..................."
@ w+2,k  say "Miejsce poàoæenia ´r¢dàa przychodu ."
@ w+4,k  say "Udziaà w % ........................."
@ w+6,k say "Przych¢d ..........................."
@ w+8,k say "Koszty ............................."
@ w+10,k say "Doch¢d ............................."
@ w+12,k say "Strata ............................."
set cursor on
do case
  case ppoz=1
    @ w,k+37 get zm114_zrodl 
    @ w+2,k+37 get zm115_miejs
    @ w+4,k+37 get zm116_udzia picture "999.999999"
	@ w+6,k+37 get zm117_przyc picture "999999999.99" 
	@ w+8,k+37 get zm118_koszt picture "999999999.99" 
  case ppoz=2
    @ w,k+37 get zm121_zrodl 
    @ w+2,k+37 get zm122_miejs
    @ w+4,k+37 get zm123_udzia picture "999.999999"
	@ w+6,k+37 get zm124_przyc picture "999999999.99" 
	@ w+8,k+37 get zm125_koszt picture "999999999.99" 
  case ppoz=3
    @ w,k+37 get zm221_zrodl 
    @ w+2,k+37 get zm222_miejs
    @ w+4,k+37 get zm223_udzia picture "999.999999"
	@ w+6,k+37 get zm224_przyc picture "999999999.99" 
	@ w+8,k+37 get zm225_koszt picture "999999999.99" 
  case ppoz=4
    @ w,k+37 get zm321_zrodl 
    @ w+2,k+37 get zm322_miejs
    @ w+4,k+37 get zm323_udzia picture "999.999999"
	@ w+6,k+37 get zm324_przyc picture "999999999.99" 
	@ w+8,k+37 get zm325_koszt picture "999999999.99" 
  case ppoz=5
    @ w,k+37 get zm421_zrodl 
    @ w+2,k+37 get zm422_miejs
    @ w+4,k+37 get zm423_udzia picture "999.999999"
	@ w+6,k+37 get zm424_przyc picture "999999999.99" 
	@ w+8,k+37 get zm425_koszt picture "999999999.99" 
endcase
    read
set cursor off
zpit5_licz()  
do case
  case ppoz=1
    @ w+14,k+37 say om119_dochod picture "999999999.99" 
    @ w+16,k+37 say om120_strata picture "999999999.99"      
  case ppoz=2
    @ w+14,k+37 say om126_dochod picture "999999999.99" 
    @ w+16,k+37 say om127_strata picture "999999999.99"        
  case ppoz=3
    @ w+14,k+37 say om226_dochod picture "999999999.99" 
    @ w+16,k+37 say om227_strata picture "999999999.99"        
  case ppoz=4
    @ w+14,k+37 say om326_dochod picture "999999999.99" 
    @ w+16,k+37 say om327_strata picture "999999999.99"        
  case ppoz=5
    @ w+14,k+37 say om426_dochod picture "999999999.99" 
    @ w+16,k+37 say om427_strata picture "999999999.99"        
endcase
if kj_gkom(20,"","ZatwierdziÜ ? ","",.t.,5) 
  pit5_replac()
else
  pit5_lad()
endif
restore screen from ek
setcolor(lcolor)
RETURN


FUNCTION N_INFORMACJA()
local ek,w:=5,k:=2,lcolor:=setcolor()
save screen to ek
kj_okno(0,0,24," N. INFORMACJA O ZAù§CZNIKACH                                                         ",2)
@ w,k say    "Podaj iloòÜ doà•czonych formularzy o podanym symbolu (remanent¢w) :"
@ w+2,k+3 say "P I T  -  5 / A  ..................."
@ w+4,k+3 say "P I T  -  5 / X  ..................."
@ w+6,k+3 say "Remanent likwidacyjny .............."
set cursor on
@ w+2,k+37 get zn128_zal_1 picture "999"
@ w+4,k+37 get zn129_zal_1 picture "999"
@ w+6,k+37 get zn130_zal_1 picture "999"
    read
set cursor off
if kj_gkom(20,"","ZatwierdziÜ ? ","",.t.,5) 
  pit5_replac()
else
  pit5_lad()
endif
restore screen from ek
setcolor(lcolor)
RETURN

FUNCTION O_OSWIADCZENIE()
local ek,w:=9,k:=2,lcolor:=setcolor()
save screen to ek
kj_okno(0,0,24," O. OóWIADCZENIE I PODPIS PODATNIKA                                                   ",2)
@ w,k say "Data wypeànienia deklaracji ........"
set cursor on
@ w,k+37 get zo131_data 
    read
set cursor off
if kj_gkom(20,"","ZatwierdziÜ ? ","",.t.,5) 
  pit5_replac()
else
  pit5_lad()
endif
restore screen from ek
setcolor(lcolor)
RETURN

FUNCTION J_OBLICZENIE(prodz)
local ek,w:=2,k:=2,lcolor:=setcolor()
save screen to ek
kj_okno(0,0,24," J. OBLICZENIE NALEΩNEGO PODATKU                                                      ",2)
do case
  case prodz=1
    @ w,k say "J.1. OBLICZENIE PODATKU  "
    @ w+1,k say "  Podatek od podstawy w/g skali ...."
    @ w+1,k+37 say oj50_podatek picture "999999999.99"
      s_kom("Naciònij dowolny klawisz")
      inkey(0)
  case prodz=2
    w=5
	@ w,k say   "Ubezpieczenie zdrowotne:"
    @ w+1,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+2,k say "       zaksi©gowana od pocz•tku roku ..............."
    @ w+4,k say "Ulgi inwestycyjne przyznane przed dniem 01.01.1992r."
	@ w+5,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+6,k say "       zaksi©gowane od pocz•tku roku ..............."
    @ w+8,k say "Ulgi za wyszkolenie uczni¢w:"
	@ w+9,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+10,k say "       zaksi©gowane od pocz•tku roku ..............."	

    @ w+2,k+54 say sj51_zdrowo picture "999999999.99"
    @ w+6,k+54 say sj52_ulgi picture "999999999.99"
    @ w+10,k+54 say sj53_ulgi picture "999999999.99"	
    set cursor on
    @ w+1,k+54 get zj51_zdrowo picture "999999999.99" when s_kom("rubryka 51 PIT-5(11)")
    @ w+5,k+54 get zj52_ulgi picture "999999999.99" when s_kom("rubryka 52 PIT-5(11)")
    @ w+9,k+54 get zj53_ulgi picture "999999999.99" when s_kom("rubryka 53 PIT-5(11)")	
    read
    set cursor off
    save screen to ek1
    if kj_gkom(17,"","ZatwierdziÜ ? ","",.t.,5) 
      restore screen from ek1
      pit5_replac()
      zpit5_licz()  
      @ w+2,k+54 say sj51_zdrowo picture "999999999.99"
      @ w+6,k+54 say sj52_ulgi picture "999999999.99"
	  @ w+10,k+54 say sj53_ulgi picture "999999999.99"
      s_kom("Naciònij dowolny klawisz")
      inkey(0)
    else
      pit5_lad()
    endif		  
  case prodz=3
    w=5
	@ w,k say   "Ograniczenie wysokoòci zaliczek:"
    @ w+1,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+2,k say "       zaksi©gowana od pocz•tku roku ..............."
    @ w+4,k say "Numer decyzji ...."
    @ w+6,k say "Data decyzji ....."

    @ w+2,k+54 say sj55_ograni picture "999999999.99"
    @ w+4,k+18 say zj54_decyzj
    @ w+6,k+18 say zj56_data
    set cursor on
    @ w+1,k+54 get zj55_ograni picture "999999999.99" when s_kom("rubryka 55 PIT-5(11)")
    @ w+4,k+18 get zj54_decyzj when s_kom("rubryka 54 PIT-5(11)")
    @ w+6,k+18 get zj56_data when s_kom("rubryka 56 PIT-5(11)")	
    read
    set cursor off
    save screen to ek1
    if kj_gkom(17,"","ZatwierdziÜ ? ","",.t.,5) 
      restore screen from ek1
      pit5_replac()
      zpit5_licz()  
      @ w+2,k+54 say sj55_ograni picture "999999999.99"
      s_kom("Naciònij dowolny klawisz")
      inkey(0)
    else
      pit5_lad()
    endif		  	
  case prodz=4
    w=5	
    @ w,k say "  Podatek od podst.od pocz•tku roku "
    @ w+2,k say "  Suma zalicz.za poprzednie miesi•ce"
    @ w+4,k say "  Naleæna zaliczka za miesi•c ......"
    @ w+6,k say "  Suma zaliczek od pocz•tku roku ..."
    @ w,k+37 say ifminus(oj57_podatek) picture "999999999.99"
    @ w+2,k+37 say ifminus(oj58_suma) picture "999999999.99"
    @ w+4,k+37 say ifminus(zj59_zalicz) picture "999999999.99"
    @ w+6,k+37 say oj60_suma picture "999999999.99"
    s_kom("Naciònij dowolny klawisz")
    inkey(0)

  case prodz=5
    w=5
	@ w,k say   "Naleæny zryczaàtowany podatek od dochodu i remanentu likwidacylnego:"
	@ w+1,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+2,k say "       zaksi©gowana od pocz•tku roku ..............."
    @ w+4,k say "Kwota odsetek naliczonych:"
	@ w+5,k say "       zaksi©gowane w bieæ•cym miesi•cu ............"
    @ w+6,k say "       zaksi©gowane od pocz•tku roku ..............."
    @ w+8,k say "Kwota do zapàaty ..................................."

    @ w+2,k+54 say sj61_remane picture "999999999.99"
    @ w+6,k+54 say sj63_odsetk picture "999999999.99"
    @ w+8,k+54 say oj62_kwota picture "999999999.99"	
    set cursor on
    @ w+1,k+54 get zj61_remane picture "999999999.99" when s_kom("rubryka 61 PIT-5(11)")
    @ w+5,k+54 get zj63_odsetk picture "999999999.99" when s_kom("rubryka 63 PIT-5(11)")
    read
    set cursor off
    save screen to ek1
    if kj_gkom(17,"","ZatwierdziÜ ? ","",.t.,5) 
      restore screen from ek1
      pit5_replac()
      zpit5_licz()  
      @ w+2,k+54 say sj61_remane picture "999999999.99"
      @ w+6,k+54 say sj63_odsetk picture "999999999.99"
	  @ w+8,k+54 say oj62_kwota picture "999999999.99"
      s_kom("Naciònij dowolny klawisz")
      inkey(0)
    else
      pit5_lad()
    endif		  
endcase
restore screen from ek
setcolor(lcolor)
RETURN





FUNCTION IFMINUS(pliczba)
local lliczba:=pliczba
if lliczba<0
  lliczba=0
endif
RETURN lliczba

FUNCTION KSFIRNUM()
local t[4],q[4],ek,lrec:=0
t[1]:="firnum"
t[2]:="firnaz"
t[3]:="firmiasto"
t[4]:="firulica"
q[1]:="Numer"
q[2]:="Nazwa"
q[3]:="Adres: miasto"
q[4]:="Adres: ulica"
save screen to ek
g_tlo()
plik_firdef=zks_serwer+s_common
set default to &plik_firdef
if file("firdef.dbf")
  select &firdef_sel
  if kj_use("firdef",.f.,3)
    set filter to firznak=zfirznak
	go top
	do while.not.eof()
	  lrec=lrec+1
	  skip
	enddo
	if lrec>18
	  lrec=18
	endif
	locate for firnum=zfirnum
	if.not.found()
	  go top
	endif
	kj_okno(2,8,4+lrec," Wyb¢r firmy                                                    ",2)
	keyboard chr(205)
	dbedit(4,9,6+lrec,70,t,"KSFIR_FU","",q,"ﬂ",,"ﬂ")
    close
    ks_default(zfirnum)
	if file("param.dbf")
      select &param_sel
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
  endif
else
  kj_tkom(12," Uwaga! ","","Brak dost©pu do zbioru obsàugiwanych firm. ","",5)     
endif
restore screen from ek
sh_paramsay()
RETURN

FUNCTION KSFIR_FU()
local last:=lastkey(),lfirnum:=1,lcolor,ek,lrecno
s_kom("szukaj po [N]umerze    [D]opisz    [P]opraw     [Delete] - usu‰    [Enter] - zatwierd´ ")
do case
  case last=27
    return 0
  case last=13
    zfir_lad()	
	return 0
  case (chr(last)$"Dd".or.chr(last)$"Pp".or.last=7).and..not.zksfir_upraw	
    kj_tkom(12," Uwaga! ","","Brak uprawnie‰","",5)       	
  case chr(last)$"Dd".and.zksfir_upraw	
    zfir_zer()
	ksfir_say()
	ksfir_get()
    if.not.lastkey()=27
      if kj_append(3)
        ksfir_replac()
		unlock
	  endif		  
	endif
	keyboard chr(205)
  case chr(last)$"Pp".and.zksfir_upraw	
    zfir_lad()
	ksfir_say()
	ksfir_get()
    if.not.lastkey()=27
	  if reclock(5)      
        ksfir_replac()
		unlock
	  endif		  
	endif	
	keyboard chr(205)
  case last=7.and.zksfir_upraw		
    zfir_lad()
	ksfir_say()
    if kj_gkom(12,"","Usun•Ü firm© ze spisu ?","",.t.,5).or.lastkey()=27
      skip
	  recno=recno()
	  skip -1
      if reclock(5)
        delete
	    unlock
	  endif
	  keyboard chr(205)
      go recno
	endif
	return 2			
  case chr(last)$"Nn"
    lrecno=recno()
	save screen to ek
	lcolor=setcolor()
	set color to
	@ 4,0 say " Podaj "
	@ 5,0 say " numer "
	set cursor on
	@ 7,3 get lfirnum picture "999"
    read
	if.not.lastkey()=27
	  locate for firnum=lfirnum
	  if.not.found()
        kj_tkom(12," Uwaga! ","","Firma o tym numerze jest niedost©pna. ","",5)     
	    go lrecno
	  endif
	endif
	set cursor off
	setcolor(lcolor)
	restore screen from ek
	keyboard chr(205)
endcase
RETURN 1

FUNCTION ZFIR_LAD()
zfirnum=firnum
zfirnaz=firnaz
zfirmiasto=firmiasto
zfirulica=firulica
zfirznak=firznak
RETURN

FUNCTION ZFIR_ZER()
zfirnum=0
zfirnaz=space(15)
zfirmiasto=space(15)
zfirulica=space(15)
zfirznak=space(2)
RETURN

FUNCTION KSFIR_REPLAC()
replace firnum with zfirnum,firnaz with zfirnaz,firmiasto with zfirmiasto
replace firulica with zfirulica,firznak with zfirznak
RETURN

FUNCTION KSFIR_SAY()
kj_okno(12,42,11," Parametry firmy                      ",2)
@ 14,44 say      "Numer ............"
@ 16,44 say      "Nazwa ............"            
@ 18,44 say      "Adres: miasto ...."
@ 19,44 say      "       ulica ....."
*@ 21,44 say      "Index firmy ......"
@ 14,63 say zfirnum picture "999"
@ 16,63 say zfirnaz
@ 18,63 say zfirmiasto
@ 19,63 say zfirulica
*@ 21,63 say zfirznak
RETURN

FUNCTION KSFIR_GET()
set cursor on
*@ 14,63 get zfirnum picture "999" valid 1 zksilefirm when s_kom("Wpisz numer firmy")
@ 14,63 get zfirnum picture "999"  when s_kom("Wpisz numer firmy")
@ 16,63 get zfirnaz when s_kom("Wpisz nazw© firmy")
@ 18,63 get zfirmiasto when s_kom("Wpisz adres firmy - miasto")
@ 19,63 get zfirulica when s_kom("Wpisz adres firmy - ulic© i numer domu")
*@ 21,63 get zfirznak when s_kom("Wpisz index umoæliwiaj•cy przydzielanie firm odpowiednim stanowiskom")
read
set cursor off
RETURN

FUNCTION KSIMPORT_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz
ltnaz[1]:="  Legos - Ksi©ga      "
ltnaz[2]:="  Ksi©ga_5st.- Ksi©ga "
ltnaz[3]:="  Ksi©ga_4st.- Ksi©ga "

ltlit[1]:="  L"
ltlit[2]:="         5"
ltlit[3]:="         4"
ltopis[1]:="Import z systemu fakturuj•cego Legos."
ltopis[2]:="Import z poprzedniej wersji Ksi©gi z pi©cioma stawkami VAT"
ltopis[3]:="Import z poprzedniej wersji Ksi©gi z czterema stawkami VAT"

  lpoz=men_pion(7,15,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION KS_IMPORT()
local lpoz:=1

lpoz=ksimport_menu(lpoz)
  do case
    case lpoz=1
	  transleg()
	  *run tsh.exe
	  leg_import()
	case lpoz=2
	  if trans_lad(1)
        if kj_gkom(12,"","Import danych do standartu LEGOS zako‰czony pomyòlnie.","ZaimportowaÜ do ksi©gi?",.t.,5).or.lastkey()=27
          zimp_sciezka=space(32)		  
		  leg_import()	  
		endif  
	  endif
	case lpoz=3
	  if trans_lad(2)
        if kj_gkom(12,"","Import danych do standartu LEGOS zako‰czony pomyòlnie.","ZaimportowaÜ do ksi©gi?",.t.,5).or.lastkey()=27
          zimp_sciezka=space(32)		  
		  leg_import()	  
		endif  
	  endif	  
  endcase
RETURN

*************
FUNCTION TRANS_TWORZ()
create nowa
append blank
replace field_name with "edtyp"
replace field_type with "C"
replace field_len with 1
append blank
replace field_name with "edznak"
replace field_type with "C"
replace field_len with 1
append blank
replace field_name with "edndok"
replace field_type with "C"
replace field_len with 15
append blank
replace field_name with "eddatdok"
replace field_type with "D"
replace field_len with 8
append blank
replace field_name with "edndow"
replace field_type with "C"
replace field_len with 15
append blank
replace field_name with "eddatdow"
replace field_type with "D"
replace field_len with 8
append blank
replace field_name with "enet_a"
replace field_type with "N"
replace field_len with 14
replace field_dec with 4
append blank
replace field_name with "enet_b"
replace field_type with "N"
replace field_len with 14
replace field_dec with 4
append blank
replace field_name with "enet_c"
replace field_type with "N"
replace field_len with 14
replace field_dec with 4
append blank
replace field_name with "enet_d"
replace field_type with "N"
replace field_len with 14
replace field_dec with 4
append blank
replace field_name with "enet_e"
replace field_type with "N"
replace field_len with 14
replace field_dec with 4
append blank
replace field_name with "enet_f"
replace field_type with "N"
replace field_len with 14
replace field_dec with 4
append blank
replace field_name with "enet_z"
replace field_type with "N"
replace field_len with 14
replace field_dec with 4
append blank
replace field_name with "evat_a"
replace field_type with "N"
replace field_len with 14
replace field_dec with 4
append blank
replace field_name with "evat_b"
replace field_type with "N"
replace field_len with 14
replace field_dec with 4
append blank
replace field_name with "evat_c"
replace field_type with "N"
replace field_len with 14
replace field_dec with 4
append blank
replace field_name with "evat_d"
replace field_type with "N"
replace field_len with 14
replace field_dec with 4
append blank
replace field_name with "evat_e"
replace field_type with "N"
replace field_len with 14
replace field_dec with 4
append blank
replace field_name with "evat_f"
replace field_type with "N"
replace field_len with 14
replace field_dec with 4

***********

append blank
replace field_name with "eknaz1"
replace field_type with "C"
replace field_len with 30
append blank
replace field_name with "eknaz2"
replace field_type with "C"
replace field_len with 30
append blank
replace field_name with "ekmiasto"
replace field_type with "C"
replace field_len with 30
append blank
replace field_name with "ekulica"
replace field_type with "C"
replace field_len with 30
append blank
replace field_name with "ekkod"
replace field_type with "C"
replace field_len with 6
append blank
replace field_name with "eknip"
replace field_type with "C"
replace field_len with 13
append blank
replace field_name with "eopis"
replace field_type with "C"
replace field_len with 30
append blank
replace field_name with "erejestr"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "eksiega"
replace field_type with "L"
replace field_len with 1
append blank
replace field_name with "eeksport"
replace field_type with "L"
replace field_len with 1

append blank
replace field_name with "ektel"
replace field_type with "C"
replace field_len with 15
append blank
replace field_name with "ekfax"
replace field_type with "C"
replace field_len with 15
append blank
replace field_name with "ekkonto"
replace field_type with "C"
replace field_len with 90
append blank
replace field_name with "ekgrupa"
replace field_type with "C"
replace field_len with 5
append blank
replace field_name with "ekgrup_kod"
replace field_type with "NC"
replace field_len with 3
replace field_dec with 0
append blank
replace field_name with "ekrabat"
replace field_type with "N"
replace field_len with 8
replace field_dec with 4
append blank
replace field_name with "eklimit"
replace field_type with "N"
replace field_len with 14
replace field_dec with 4
append blank
replace field_name with "edekret"
replace field_type with "C"
replace field_len with 10



create &transplik from nowa
use
erase nowa.dbf
RETURN nil

*******************************************************************************
* Program importuje dokumentu z systemu LLEGOS  formacie LEGOS                *
*******************************************************************************
FUNCTION LEG_IMPORT()
local lcolor:=setcolor(),ldatlast:=date(),limp_sciezka:=stuff(space(32),1,len(zimp_sciezka),zimp_sciezka)
local ltyt:="        IMPORT   DOKUMENTOW  Z  SYSTEMU   LEGOS          "
local lplik:="",t[8],q[8],ek
local lznaki:="",lpoz:=1,len:=0
t[1]:="data_dow"
t[2]:="nr_dowodu"
t[3]:="konto_wn"
t[4]:="kwota"
t[5]:="substr(nazwa_full,1,30)"
t[6]:="substr(kod_miasto,1,15)"
t[7]:="substr(ulica_dom,1,15)"
t[8]:="nr_nip"
q[1]:="Data"
q[2]:="Numer dokumentu"
q[3]:="Konto"
q[4]:="Kwota"
q[5]:="Nazwa kontrahenta"
q[6]:="Adres: miasto"
q[7]:="Adres: ulica"
q[8]:="NIP"

set color to r/g
clear
set color to n/w,w/n
kj_okno(4,12,10,ltyt,1)
@ 7,14 say "Program zaksi©guje dokumenty zawarte w pilku o nazwie"
@ 8,14 say "        >  T R A N S D O K . D B F  <                "
@ 11,14 say "Sciezka dostepu :"
set cursor on
@ 11,31 get limp_sciezka
read
if.not.lastkey()=27
  zimp_sciezka=limp_sciezka
  set default to
*  save to pam
  lplik=alltrim(limp_sciezka)+"transdok.dbf"
  if file(lplik)
    select 0
    use &lplik
*    index on DTOC(eddatdok)+edndok to transdok    
    index on str(month(eddatdok))+str(day(eddatdok))+edndok to transdok    
*	index on edndok to transdok    
    set index to transdok
	tra_sel=select()
	save screen to ek
	if kj_gkom(18,"","Plik transmisyjny odnaleziony.","Wyswietlic zawarte w nim dokumenty ?",.t.,5) 
*  dbedit(0,1,23,79,t,"I_FU","",q,"ﬂ",,"ﬂ")
      trans_say()
      restore screen from ek
	endif
    if kj_gkom(18,"","Zatwierdzic import ?","",.t.,5) 
      if file("leg01\zpnn.exe")
	    clear
		use
        lpoz=znaki_menu(lpoz)
		do case
		  case lpoz=2
			do case
			  case empty(limp_sciezka)
			    run leg01\zpnn /o7 transdok.dbf transdok.dbf
			  case alltrim(limp_sciezka)="a:\".or.alltrim(limp_sciezka)="A:\"	
			    run leg01\zpnn /o7 a:\transdok.dbf a:\transdok.dbf
		    endcase 
		  case lpoz=3
			do case  
			  case empty(limp_sciezka)
			    run leg01\zpnn /i7 transdok.dbf transdok.dbf
			  case alltrim(limp_sciezka)="a:\".or.alltrim(limp_sciezka)="A:\"	
			    run leg01\zpnn /i7 a:\transdok.dbf a:\transdok.dbf		  
			endcase 	
		endcase
		restore screen from ek
	    select 0
        use &lplik
        set index to transdok
        tra_sel=select()	  
	  endif
	  
	  if lastrec()=0
        kj_tkom(18," Uwaga!","Plik o nazwie",lplik,"nie zawiera dokumentow do importu.",5)  
        close all
		return 
      endif
	  if.not.leg_pisz()
	    kj_tkom(18," Uwaga!","Import danych nie zakonczony pomyslnie.","Odtworz baze ksiegi z archiwum,","sprawdz plik transmisyjny i ponow probe.",5)
	  endif
	endif
  else
    kj_tkom(18," Uwaga!","Plik o nazwie",lplik,"nie odnaleziony.",5)
  endif	
*  @ 0,0 say lplik
*  inkey(0)
endif
set cursor off
setcolor(lcolor) 
RETURN 

FUNCTION I_FU()
local last:=lastkey()
do case
  case last=27
    return 0
endcase
RETURN 1

FUNCTION TRANS_SAY()
local ek,t[30],q[30]
local lplik:=alltrim(zimp_sciezka)+"transdok"
t[1]:="edndok"
t[2]:="eddatdok"
t[3]:="substr(eopis,1,15)"
t[4]:="enet_a+enet_b+enet_c+enet_d+enet_e+enet_f+enet_z"
t[5]:="evat_a+evat_b+evat_c+evat_d+evat_e+evat_f"
t[6]:="edndow"
t[7]:="eddatdow"
t[8]:="enet_a"
t[9]:="enet_b"
t[10]:="enet_c"
t[11]:="enet_d"
t[12]:="enet_e"
t[13]:="enet_f"
t[14]:="enet_z"
t[15]:="evat_a"
t[16]:="evat_b"
t[17]:="evat_c"
t[18]:="evat_d"
t[19]:="evat_e"
t[20]:="evat_f"
t[21]:="erejestr"
t[22]:="eksiega"
t[23]:="eeksport"

q[1]:="Numer dokumentu"
q[2]:="Data dokumentu"
q[3]:="Opis zdarzenia"
q[4]:="WartoòÜ netto"
q[5]:="Podatek VAT"
q[6]:="Numer dowodu"
q[7]:="Data dowodu"
q[8]:="Netto-stawka A"
q[9]:="Netto-stawka B"
q[10]:="Netto-stawka C"
q[11]:="Netto-stawka D"
q[12]:="Netto-stawka E"
q[13]:="Netto-stawka F"
q[14]:="Netto-stawka Z"
q[15]:="VAT-stawka A"
q[16]:="VAT-stawka B"
q[17]:="VAT-stawka C"
q[18]:="VAT-stawka D"
q[19]:="VAT-stawka E"
q[20]:="VAT-stawka F"
q[21]:="Rejestr"
q[22]:="Ksi©ga"
q[23]:="Exsport"


save screen to ek
kj_okno(0,0,24, "  Dokumenty przeznaczone do zaksi©gowania                                       ",2)
set default to
select &tra_sel
*use &lplik
dbedit(1,1,20,78,t,"TR_FU","",q,"ﬂ",,"ﬂ")
restore screen from ek
RETURN 

FUNCTION TR_FU()
local last:=lastkey()
@ 21,2 say "Kontrahent:"
@ 22,2 say space(76)
@ 23,2 say space(76)
@ 22,2 say alltrim(eknaz1)+"  "+eknaz2
@ 23,2 say ekkod+"   "+alltrim(ekmiasto)+"  "+alltrim(ekulica)
@ 21,55 say "Export dokumentu do:"
do case
  case erejestr.and.eksiega
	@ 22,55 say "Ksi©gi i rejestru VAT"
  case erejestr.and..not.eksiega
	@ 22,55 say "Rejestru VAT"	
  case eksiega.and..not.erejestr
	@ 22,55 say "Ksi©gi   P. i R."	
  case .not.eksiega.and..not.erejestr
	@ 22,55 say "                      "
endcase
do case
  case last=27
    return 0
endcase
RETURN 1

FUNCTION ZNAKI_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" BEZ ZMIAN          "
ltnaz[2]:=" MAZIWIA >> LATIN_2 "
ltnaz[3]:=" LATIN_2 >> MAZOWIA "
ltlit[1]:=" B "
ltlit[2]:=" M "
ltlit[3]:=" L "
ltopis[1]:="Polskie znaki s• poprawne."
ltopis[2]:="Zmie‰ standart MAZIWII na standart LATIN_2."
ltopis[3]:="Zmie‰ standart LATIN_2 na standart MAZOWII."
  lpoz=men_pion(16,30,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION LEG_PISZ()
local lsukces:=.t.,lmiasto:="",lnet_sum:=0
local lksdok
local liledok:=0
local lzastap_all:=.f.,lkon_jest:=.f.
if.not.kon_use()
  kj_tkom(12," Uwaga! ","","Brak dost©pu do bazy Kontrahent¢w ","Zadanie przerwano",5)       	
  return
endif
if.not.ks_use()
  kj_tkom(12," Uwaga! ","","Brak dost©pu do bazy dokument¢w Ksi©gi","Zadanie przerwano",5)       	
  return
endif
select &tra_sel
go top
do while.not.eof()
  k_zer()
  lksdok=stuff(space(15),1,len(alltrim(edndok)),alltrim(edndok))
  zks_a=enet_a
  zks_b=enet_b
  zks_c=enet_c
  zks_d=enet_d 
  zks_e=enet_e
  zks_f=enet_f
  zks_z=enet_z
  zksvat_a=evat_a
  zksvat_b=evat_b
  zksvat_c=evat_c
  zksvat_d=evat_d
  zksvat_e=evat_e
  zksvat_f=evat_f
  zksrubryka=val(edekret)
  zksndow=edndow
  *zksndok=edndok
  zksndok=lksdok
  zksdatdow=eddatdow
  zksdatdok=eddatdok
  zksnaz1=eknaz1
  zksnaz2=eknaz2
  zksmiasto=ekmiasto
  zksulica=ekulica
  zksnip=eknip
  zksopis=eopis
  zknaz1=eknaz1
  zknaz2=eknaz2
  zkmiasto=ekmiasto
  zkulica=ekulica
  zknip=eknip

  do case
    case eksiega.and.erejestr
	  zkszapis="A"
    case eksiega.and..not.erejestr
	  zkszapis="B"
    case erejestr.and..not.eksiega
	  zkszapis="C"	  	  
  endcase
  zksexport=eeksport
  zkkod=ekkod
  zktel=ektel
  zkfax=ekfax
  zkkonto=ekkonto
  zkgrupa=ekgrupa
  zkgrup_kod=ekgrup_kod
  zkrabat=ekrabat
  zklimit=eklimit
  zksster=stuff(space(10),1,1,substr(ekgrupa,1,1))  
  
  
  select &kon_sel
    lkon_jest=.f.
	seek zksnaz1 
	if found()
	  do while knaz1=zksnaz1
	    if knaz2=zksnaz2.and.knip=zksnip.and.kmiasto=zksmiasto.and.kulica=zksulica
		  lkon_jest=.t.
		  zksknum=knum
		  exit
		endif
		skip
	  enddo
	endif     
	if.not.lkon_jest
	  set order to 3
	  go bottom
	  zknum=knum+1
	  zksnum=zknum
	  if kj_append(3)
        k_replac()	    
	  endif
	  set order to 1
	endif
  select &ks_sel
    locate for alltrim(ksndok)=alltrim(zksndok).and.ksdatdok=zksdatdok.and.alltrim(ksnip)=alltrim(zksnip).and.ksrubryka=zksrubryka
    if found()
      if.not.lzastap_all
	    if kj_gkom(18," Uwaga!","Dokument "+alltrim(zksndok)+" juæ istnieje. ZastapiÜ ?","Wybierz [Tak] aby zast•piÜ , [Nie] aby dopisaÜ dokument, Esc - aby pomin•Ü",.f.,5)
	      if.not.lastkey()=27.and.kj_gkom(18," Uwaga!","","Zast•piÜ wszystkie ?",.t.,5)
	        lzastap_all=.t.
	      endif     
        else
          if.not.lastkey()=27
	        *append blank
			kj_append(3)
	      endif		
	    endif
	  endif
    else
      *append blank
	  kj_append(3)
    endif	
*  if.not.lastkey()=27
      if reclock(5)      
        ks_replac()
		liledok=liledok+1
		unlock
	  endif	    
*  endif
  
  @ 0,0 say "Zapisywany dokument : "+zksndok
  select &tra_sel
  skip
enddo
kj_tkom(18," Ok!","Import danych zakonczony pomyslnie.","","Zaimportowano "+alltrim(str(liledok))+" dokum.",5)
close_all("SH")
RETURN lsukces


*************

FUNCTION TRANS_LAD(ptryb)
local ltyt:="       IMPORT   DOKUMENTOW  DO  STANDARTU  LEGOS         "
local limp_sciezka:=stuff(space(32),1,len(zimp_sciezka),zimp_sciezka)
local lmies:="00",i
local ldndok,lddatdok,lnet_a,lnet_b,lnet_c,lnet_d:=0,lnet_e,lnet_f,lnet_z
local lvat_a,lvat_b,lvat_c:=0,lvat_d,lvat_e,lvat_f,lknaz1,lknaz2,lkmiasto
local lkulica,lkkod,lknip,lkopis,lrejestr,lksiega,leksport,ldekret
local lkgrupa:=space(5)
if .not. empty(zksold_path)
  len=len(zksold_path)
  limp_sciezka=zksold_path
  do case
    case zfirnum<10
      limp_sciezka=stuff(space(len+4),1,len,limp_sciezka)
	  limp_sciezka=stuff(limp_sciezka,len+1,2,"F0")
	  limp_sciezka=stuff(limp_sciezka,len+3,1,alltrim(str(zfirnum)))
	  limp_sciezka=stuff(limp_sciezka,len+4,1,"\")  
    case zfirnum>9
      limp_sciezka=stuff(space(len+4),1,len,limp_sciezka)
	  limp_sciezka=stuff(limp_sciezka,len+1,1,"F")
	  limp_sciezka=stuff(limp_sciezka,len+2,2,alltrim(str(zfirnum)))
	  limp_sciezka=stuff(limp_sciezka,len+4,1,"\")  	  
	  
  endcase
endif
set color to r/g
clear
set color to n/w,w/n
kj_okno(4,12,10,ltyt,1)
@ 7,14 say "  Program zaimportuje dokumenty do pliku o nazwie    "
@ 8,14 say "          >  T R A N S D O K . D B F  <              "
@ 11,14 say "Sciezka dostepu :"
set cursor on
@ 11,31 get limp_sciezka
read
if lastkey()=27
  return .f.
endif
*
set default to
select &tra_sel
if .not. file("transdok.dbf")
  trans_tworz()
else
  use transdok 
  zap
endif
close
select &tra_sel
if.not.kj_use1("transdok",.t.,3)
  return .f.
endif  
*

zimp_sciezka=limp_sciezka
set default to
do case
  case ptryb=1.or.ptryb=2
    for i=1 to 12
      lmies=str(i,2)
      if empty(substr(lmies,1,1))
        lmies=stuff(lmies,1,1,"0")
      endif
  
      lplik=alltrim(limp_sciezka)+"M"+lmies+"\ksiega.dbf"
      if file(lplik)

	    select &zrodlo_sel
        use &lplik
        do while.not.eof()
          ldndok=ksdow
	      lddatdok=ksdata
	      lnet_a=ks22
	      lnet_b=ks07
          if ptryb=1
	        lnet_c=ks03
	        lnet_d=ks00
	      else
	        lnet_c=ks00
	      endif
	      lnet_z=kszw
		  lvat_a=ksvat22
		  lvat_b=ksvat07
		  if ptryb=1
		    lvat_c=ksvat03
		  endif
		  lknaz1=ksnaz
		  lkmiasto=ksadr
		  lknip=ksnip
		  lopis=ksopis
          if.not.substr(ksnic,2,2)="-R"
		    lrejestr=.t.
		  else
		    lrejestr=.f.
		  endif
          lkgrupa=stuff(space(5),1,1,substr(ksnic,1,1))		  	
		  lksiega=.t.
		  leksport=ksexport
		  do case
		    case .not. kstow=0
			  ldekret="7"
		    case .not. ksusl=0
			  ldekret="8"
		    case .not. kszakup=0
			  ldekret="10"
		    case .not. ksubocz=0
			  ldekret="11"
		    case .not. ksrep=0
			  ldekret="12"
		    case .not. ksgot=0
			  ldekret="13"
		    case .not. kswyd=0
			  ldekret="14"
		    case .not. kswypos=0
			  ldekret="18"
		  endcase
		  select &tra_sel
          if kj_append(3)
            replace edndok with ldndok,eddatdok with lddatdok
			replace enet_a with lnet_a,enet_b with lnet_b,enet_c with lnet_c
			replace enet_d with lnet_d,enet_z with lnet_z
			replace evat_a with lvat_a,evat_b with lvat_b,evat_c with lvat_c 
			replace eknaz1 with lknaz1,ekmiasto with lkmiasto,eknip with lknip
			replace eopis with lopis,erejestr with lrejestr,eksiega with lksiega
			replace eeksport with leksport,edekret with ldekret
            replace ekgrupa with lkgrupa
			unlock
	      endif			   		
	      select &zrodlo_sel
		  skip
	    enddo
	    close
      else
        kj_tkom(12," Uwaga! ","","Brak dost©pu do danych z miesi•ca stycznia","",5)       	
        return .f.
      endif
**REJESTR
      lplik=alltrim(limp_sciezka)+"M"+lmies+"\rejestr.dbf"
      if file(lplik)
        select &zrodlo_sel
        use &lplik
        do while.not.eof()
          ldndok=ksdow
	      lddatdok=ksdata
	      lnet_a=ks22
	      lnet_b=ks07
          if ptryb=1
	        lnet_c=ks03
	        lnet_d=ks00
	      else
	        lnet_c=ks00
	      endif
	      lnet_z=kszw
		  lvat_a=ksvat22
		  lvat_b=ksvat07
		  if ptryb=1
		    lvat_c=ksvat03
		  endif
		  lknaz1=ksnaz
		  lkmiasto=ksadr
		  lknip=ksnip
		  lopis=ksopis
		  lrejestr=.t.
		  lksiega=.f.
		  lkgrupa=stuff(space(5),1,1,substr(ksnic,1,1))		  	
		  leksport=ksexport
		  do case
		    case .not. kstow=0
			  ldekret="7"
		    case .not. ksusl=0
			  ldekret="8"
		    case .not. kszakup=0
			  ldekret="10"
		    case .not. ksubocz=0
			  ldekret="11"
		    case .not. ksrep=0
			  ldekret="12"
		    case .not. ksgot=0
			  ldekret="13"
		    case .not. kswyd=0
			  ldekret="14"
		    case .not. kswypos=0
			  ldekret="18"
		  endcase
		  select &tra_sel
          if kj_append(3)
            replace edndok with ldndok,eddatdok with lddatdok
			replace enet_a with lnet_a,enet_b with lnet_b,enet_c with lnet_c
			replace enet_d with lnet_d,enet_z with lnet_z
			replace evat_a with lvat_a,evat_b with lvat_b,evat_c with lvat_c 
			replace eknaz1 with lknaz1,ekmiasto with lkmiasto,eknip with lknip
			replace eopis with lopis,erejestr with lrejestr,eksiega with lksiega
			replace eeksport with leksport,edekret with ldekret
            replace ekgrupa with lkgrupa
			unlock
	      endif			   		
	      select &zrodlo_sel
		  skip
	    enddo
	    close
      else
        kj_tkom(12," Uwaga! ","","Brak dost©pu do danych z miesi•ca stycznia","",5)       	
        return .f.
      endif
**
    next
endcase
close_all("SH")
RETURN .t.

*******************TRANSMISJA

FUNCTION TRANSLEG()
*ansmisja danych w standarcie LEGOS (do Ksi©gi P. i R.)
local ek
set confirm on
public has_sel:=17,zmiesiac:=month(date()),zmies_nazwa:=""
public zk_serwer:="",zd_serwer:="",transplik:="transdok.dbf"
public fnaz:=space(50),fadres:=space(50)
public transmis_gr:=space(30),blokada:=1
public dok07_gr:=space(15),dok08_gr:=space(15),dok10_gr:=space(15)
public dok11_gr:=space(15),dok12_gr:=space(15),dok13_gr:=space(15)
public dok14_gr:=space(15),dokex_gr:=space(15)
public bezrej_gr:=space(15),bezks_gr:=space(15)
public opis07:=space(30),opis08:=space(30),opis10:=space(30),opis11:=space(30)
public opis12:=space(30),opis13:=space(30),opis14:=space(30),opisex:=space(30)
public blokuj:=.f.,zgdzie:=space(40)
tran_tlo()
set default to curdir()
set default to trans
transpar_lad()

*plik="trans\trans.mem"
*if file(plik)
*  restore from &plik additive
*endif


*tran_gmenu()
*save to &plik
**
  save screen to ek
  g_tlo()
	  kon_sciezka=zk_serwer+"KONTRAH"
	  dok_sciezka=zd_serwer+"001dok"
	  transdok()
	  if kj_gkom(12," Transmisja dokument¢w do Ksi©gi P. i R.","","WyòwietliÜ przeznaczone do zaksi©gowania dokumenty ?",.t.)
        trans_say()
	   endif
      close_all("SH")
      docel_plik=alltrim(zgdzie)+"transdok.dbf"
      if.not.empty(zgdzie)
        kj_skom(10," Czekaj ! ","","Trwa kopiowanie pliku transmisyjnego do katalogu docelowego","",5)
        copy file transdok.dbf to &docel_plik 
      endif	  
      restore screen from ek 
	  RETURN NIL
**
RETURN

FUNCTION TRAN_GMENU() 
local ek,ek0,ek2,ek3,lcolor,lset:=0
local lbelka:="∞ Transmisja ∞ Parametry ∞ Koniec ∞"
local lliter:="  T            P           K       "
local lpoz:=1,ltopis[20]
for i=1 to 20
  ltopis[i]:=""
next
ltopis[1]="Eksport bazy danych do Ksi©gi Przychod¢w i Rozchod¢w w standarcie LEGOS"
ltopis[2]="Parametry transmisji"
ltopis[3]="Wyjòcie z programu"

do while .t.    
  lpoz=menu_poziom(1,0,3,lbelka,lliter,ltopis,lpoz,.f.,.f.)   &&Menu glowne
  save screen to ek
  if lastkey()=27
    exit
  endif
  g_tlo()
  do case
    case lpoz=1
	  kon_sciezka=zk_serwer+"KONTRAH"
	  dok_sciezka=zd_serwer+"001dok"
	  transdok()
	  if kj_gkom(12," Transmisja dokument¢w do Ksi©gi P. i R.","","WyòwietliÜ przeznaczone do zaksi©gowania dokumenty ?",.t.)
        trans_say()
	   endif
      close_all("SH")
      docel_plik=alltrim(zgdzie)+"transdok.dbf"
      if.not.empty(zgdzie)
        kj_skom(10," Czekaj ! ","","Trwa kopiowanie pliku transmisyjnego do katalogu docelowego","",5)
        copy file transdok.dbf to &docel_plik 
      endif	  
	  RETURN NIL
	  *
	case lpoz=2
      param_get()

	case lpoz=3
	  exit
  endcase
  restore screen from ek
enddo
RETURN nil


FUNCTION PARAM_GET()
local ek,ek1,lpoz:=0
save screen to ek
do while.t.
  lpoz=par_menu(lpoz)
  save screen to ek1
  if lastkey()=27
    exit
  endif
  do case
    case lpoz=1
	  firpar()
    case lpoz=2
	  blokada=blok_menu(blokada)	  
    case lpoz=3
	  grupy_get()
    case lpoz=4
	  docel_get()	  
    case lpoz=5
	  rok_get()	  	  
  endcase
  restore screen from ek
enddo
RETURN




*******************************************************************************
* Tlo zgloszeniowe programu SH                                                *
*******************************************************************************
FUNCTION TRAN_TLO()
local lcolor:=setcolor()
setcolor("n/n+")
clear
kj_okno(0,0,10, "  KJ - Transmisja danych w standarcie   L E G O S                               ",2)
kj_okno(18,0,5, "                                                                                ",2)
set color to "gr+/n,n/gr+"
@ 11,0 say "∞     ÕÀ …Õ   …ÕÕÕª                                                            ∞"
@ 12,0 say "∞      ∫…º        ∫                                                            ∞"
@ 13,0 say "∞      Ã ª        ∫   ÕÕÕ    T   R   A   N   S   M   I   S   J   A             ∞"
@ 14,0 say "∞     Õ  »Õ       ∫                                                            ∞"
@ 15,0 say "∞             …ÕÕÕŒÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕÕ     ∞"
@ 16,0 say "∞             »ÕÕÕº                                                            ∞"
@ 17,0 say "∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞∞"
setcolor(lcolor)	
RETURN NIL



 

FUNCTION PAR_MENU(ppoz)
local ltnaz[5],ltlit[5],ltopis[5],lbelka:="",lpoz:=ppoz,ek
ltnaz[1]:=" Firma     "
ltnaz[2]:=" Blokada   "
ltnaz[3]:=" Grupy     "
ltnaz[4]:=" Wyòlij do "
ltnaz[5]:=" Zmie‰ rok "
ltlit[1]:=" F         "
ltlit[2]:=" B         "
ltlit[3]:=" G         "
ltlit[4]:=" W         "
ltlit[5]:=" Z         "
ltopis[1]:="Nazwa i adres firmy udost©pniaj•cej dane"
ltopis[2]:="Spos¢b obsàugi blokady ponownego importu"
ltopis[3]:="Podziaà dokument¢w na grupy "
ltopis[4]:="Umiejscowienie pliku transmisyjnego - [dysk:]\[katalogi]\ "
ltopis[5]:="Zmiana roku domyòlnego wynikaj•cego z daty systemowej na inny. "
  lpoz=men_pion(2,13,5,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION BLOK_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz,ek
ltnaz[1]:=" Nie blokuj "
ltnaz[2]:=" Blokuj     "
ltnaz[3]:=" Zapytaj    "
ltlit[1]:=" N         "
ltlit[2]:=" B         "
ltlit[3]:=" Z         "
ltopis[1]:="Nie blokuj moæliwoòÜ ponownej transmisji wyeksportowanych dokument¢w"
ltopis[2]:="Blokuj moæliwoòÜ ponownej transmisji wyeksportowanych dokument¢w"
ltopis[3]:="Zapytaj przd transmisj•"

  lpoz=men_pion(4,24,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz
 
FUNCTION FIRPAR_OLD()
local ek,lcolor:=setcolor()
g_tlo()
save screen to ek
kj_okno(5,5,10, " Parametry firmy udost©pniaj•cej dane do transmisji                   ",2)
set color to n/w,w/n
@ 7,7 say "Nazwa:"
@ 8,15 say fnaz
@ 11,7 say "Adres:"
@ 12,15 say fadres
set cursor on
@ 8,15 get fnaz
@ 12,15 get fadres
read
set cursor off
if.not.lastkey()=27
  save to &plik
endif

restore screen from ek
setcolor(lcolor)
RETURN 



FUNCTION GRUPY_GET()
local ek,lcolor:=setcolor()
g_tlo()
save screen to ek
kj_okno(3,1,16, " Klasyfikacja dokument¢w przeznaczonych do transmisji                         ",2)
set color to n/w,w/n
@ 5,4 say "Skr¢t     Wykaz typ¢w dokument¢w           Opis zdarzenia gospodzarczego  "            
@ 6,4 say "------------------------------------------------------------------------- "            
@ 8,4 say "Dok07_gr "
@ 9,4 say "Dok08_gr "
@ 10,4 say "Dok10_gr "
@ 11,4 say "Dok11_gr "
@ 12,4 say "Dok12_gr "
@ 13,4 say "Dok13_gr "
@ 14,4 say "Dok14_gr "
@ 15,4 say "Dokex_gr "
@ 16,4 say "Bezrej_gr"
@ 17,4 say "Bezks_gr"
set cursor on
@ 8,15 get dok07_gr when s_kom("Sprzedaæ towar¢w i usàug - rubryka 7")
@ 8,47 get opis07 when s_kom("Sprzedaæ towar¢w i usàug - rubryka 7")
@ 9,15 get dok08_gr when s_kom("Pozostaàe przychody - rubryka 8")
@ 9,47 get opis08 when s_kom("Pozostaàe przychody - rubryka 8")
@ 10,15 get dok10_gr when s_kom("Zakup towar¢w i materiaà¢w wg cen zakupu - rubryka 10")
@ 10,47 get opis10 when s_kom("Zakup towar¢w i materiaà¢w wg cen zakupu - rubryka 10")
@ 11,15 get dok11_gr when s_kom("Koszty uboczne zakupu - rubryka 11")
@ 11,47 get opis11 when s_kom("Koszty uboczne zakupu - rubryka 11")
@ 12,15 get dok12_gr when s_kom("Koszty reprezentacji i reklamy - rubryka 12")
@ 12,47 get opis12 when s_kom("Koszty reprezentacji i reklamy - rubryka 12")
@ 13,15 get dok13_gr when s_kom("Wynagrodzenie w got¢wce i naturze - rubryka 13")
@ 13,47 get opis13 when s_kom("Wynagrodzenie w got¢wce i naturze - rubryka 13")
@ 14,15 get dok14_gr when s_kom("Pozostaàe wydatki - rubryka 14")
@ 14,47 get opis14 when s_kom("Pozostaàe wydatki - rubryka 14")
@ 15,15 get dokex_gr when s_kom("Dokumenty eksportowe")
@ 16,15 get bezrej_gr when s_kom("Dokumenty wyà•czone z rejestru VAT")
@ 17,15 get bezks_gr when s_kom("Dokumenty wyà•czone z Ksi©gi P.i R.")
read
set cursor off
if.not.lastkey()=27
  save to &plik 
endif

restore screen from ek
setcolor(lcolor)
RETURN


FUNCTION DOCEL_GET()
local ek,lcolor:=setcolor(),lgdzie:=zgdzie
g_tlo()
save screen to ek
kj_okno(6,6,6, " Parametry przesàania pliku transmisyjnego                          ",2)
set color to n/w,w/n

set cursor on
@ 9,15 get lgdzie when s_kom("Okreòlenie òcieæki dla pliku transmisyjnego w formacie: [dysk:]\[katalogi]\")
read
set cursor off
if.not.lastkey()=27
  zgdzie=lgdzie
  save to &plik
endif

restore screen from ek
setcolor(lcolor)
RETURN


FUNCTION ROK_GET()
local ek,lcolor:=setcolor(),lgdzie:=zgdzie
g_tlo()
save screen to ek
kj_okno(6,6,6, " Rok rozliczeniowy uwzgl©dniony w transmisji                        ",2)
set color to n/w,w/n

set cursor on
@ 9,15 get rok when s_kom("Podaj rok rozliczeniowy.")
read
set cursor off

restore screen from ek
setcolor(lcolor)
RETURN



FUNCTION FIRPAR()
local ek,lcolor:=setcolor(),sciezka:=zset_serwer+"LEG01"
local lkonto1:=substr(zlic_konto,1,30)
local lkonto2:=substr(zlic_konto,31)
local ltel:=zlic_tel,lfax:=zlic_fax,lreg:=zlic_regon
save screen to ek
g_tlo()
kj_okno(3,5,14, "  Parametry firmy udost©pniaj•cej dane do transmisji                  ",2)
@ 5,7 say "Nazwa ..."+zlic1
@ 6,7 say "         "+zlic2
@ 7,7 say "Adres ..."+zlic5
@ 8,7 say "         "+zlic3+space(2)+zlic4
@ 9,7 say "Nip ....."+zlic6
@ 11,6 say replicate("-",68)
@ 13,7 say "Telefon "
@ 15,7 say "Fax ...."
*set cursor on
@ 13,15 say ltel
@ 15,15 say lfax
inkey(0)
set cursor off
restore screen from ek
setcolor(lcolor)
RETURN 



FUNCTION TRANSDOK()
local lmiesiac:=month(date())-1,lmies_nazwa:=zmies_nazwa,lkonjest:=.f.
transmis_gr=alltrim(dok07_gr)+alltrim(dok08_gr)+alltrim(dok10_gr)+alltrim(dok11_gr)+alltrim(dok12_gr)+alltrim(dok13_gr)+alltrim(dok14_gr)

if lmiesiac<1
  lmiesiac=12
endif
do miesiac with 4,30,lmiesiac,lmies_nazwa	  
	 if lastkey()#27
	    zmiesiac=lmiesiac
	    zmies_nazwa=mies_nazwa(lmiesiac)	 
	 else
	   return .f.
	 endif
*save to &plik
**
do case
  case blokada=1
    blokuj=.f.
  case blokada=2
    blokuj=.t.
  case blokada=3
    if kj_gkom(12," Uwaga ! ","","ZablokowaÜ moæliwoòÜ ponownego eksportu dokument¢w ?",.t.,5)
      blokuj=.t.
    else
      blokuj=.f.
    endif
endcase
**

set default to
select &tra_sel
if .not. file("transdok.dbf")
  trans_tworz()
else
  use transdok 
  zap
endif
close
select &tra_sel
if.not.kj_use1("transdok",.t.,3)
  return .f.
endif  
select &kon_sel
set default to &kon_sciezka
if kj_use1("kon",.f.,3)
  set index to k_num
else
  return .f.
endif
select &dok_sel
set default to &dok_sciezka
if kj_use1("dokum",.f.,3)
  set index to dok_num
else
  return .f.
endif
do while.not.eof()
  if.not.dksiegowy.and.dtyp$transmis_gr.and.((month(ddatdok)=zmiesiac.and.year(ddatdok)=rok.and..not.dtyp$dowod_gr).or.(month(ddatdow)=zmiesiac.and.year(ddatdow)=rok.and.dtyp$dowod_gr)).and..not.danul

    zdok_lad()
    if.not.zdkontrah=0
	  select &kon_sel
      seek zdkontrah
        
	  if found()
	    zkon_lad()
	    lkonjest=.t.
	  else
	    lkonjest=.f.
	    kj_tkom(12," Uwaga! ","Kontrahent zwi•zany z dokumentem "+zdndok,"nie odnaleziony w bieæ•cej bazie.","Transmisja nie b©dzie kompletna!  Uzupeànij dane kontrahenta w Ksi©dze P.iR.",5)
	  endif	
    else
      k_zer()	  
	  lkonjest=.t.
	endif
    dok_licz(zdndow,.f.)
    if zdtyp$import_gr.or.zdtyp$eksport_gr
	  ztnet_a=ztnet_a*(zdkurs/zprzelicznik)
	  ztnet_b=ztnet_b*(zdkurs/zprzelicznik)
	  ztnet_c=ztnet_c*(zdkurs/zprzelicznik)
	  ztnet_d=ztnet_d*(zdkurs/zprzelicznik)
	  ztnet_e=ztnet_e*(zdkurs/zprzelicznik)
	  ztnet_f=ztnet_f*(zdkurs/zprzelicznik)
	  ztnet_z=ztnet_z*(zdkurs/zprzelicznik)
	  ztvat_a=ztvat_a*(zdkurs/zprzelicznik)
	  ztvat_b=ztvat_b*(zdkurs/zprzelicznik)
	  ztvat_c=ztvat_c*(zdkurs/zprzelicznik)
	  ztvat_d=ztvat_d*(zdkurs/zprzelicznik)
	  ztvat_e=ztvat_e*(zdkurs/zprzelicznik)
	  ztvat_f=ztvat_f*(zdkurs/zprzelicznik)
	endif
	select &tra_sel
	append blank
    replace edtyp with zdtyp,edznak with zdznak,edndok with zdndok
	replace eddatdok with zddatdok,edndow with zdndow
	replace eddatdow with zddatdow
    replace enet_a with ztnet_a,enet_b with ztnet_b,enet_c with ztnet_c
    replace enet_d with ztnet_d,enet_e with ztnet_e,enet_f with ztnet_f
    replace enet_z with ztnet_z
    replace evat_a with ztvat_a,evat_b with ztvat_b,evat_c with ztvat_c	
    replace evat_d with ztvat_d,evat_e with ztvat_e,evat_f with ztvat_f		
	if lkonjest
	  replace eknaz1 with zknaz1,eknaz2 with zknaz2,ekmiasto with zkmiasto
	  replace ekulica with zkulica,ekkod with zkkod,eknip with zknip
	  replace ektel with zktel,ekfax with zkfax,ekkonto with zkkonto
	  replace ekgrupa with zkgrupa,ekgrup_kod with zkgrup_kod
	  replace ekrabat with zkrabat,eklimit with zklimit 
	endif
    do case
      case zdtyp$dok07_gr
	    replace edekret with "7",eopis with opis07
      case zdtyp$dok08_gr
	    replace edekret with "8",eopis with opis08
      case zdtyp$dok10_gr
	    replace edekret with "10",eopis with opis10	  	  
      case zdtyp$dok11_gr
	    replace edekret with "11",eopis with opis11
      case zdtyp$dok12_gr
	    replace edekret with "12",eopis with opis12
      case zdtyp$dok13_gr
	    replace edekret with "13",eopis with opis13
      case zdtyp$dok14_gr
	    replace edekret with "10",eopis with opis14	  	  	  	  	  	  	  	  	  	  	  	  
    endcase	
    if zdtyp$bezrej_gr
      replace erejestr with .f.
	else
	  replace erejestr with .t.
	endif  
    if zdtyp$bezks_gr
      replace eksiega with .f.
	else
	  replace eksiega with .t.
	endif  	
    if zdtyp$dokex_gr
      replace eeksport with .t.
	else
	  replace eeksport with .f.
	endif  	
    select &dok_sel
    if blokuj
      if reclock(5)      
	    replace dksiegowy with .t.
        unlock
        commit
      endif
    endif
  endif

  skip
enddo

select &kon_sel
close
select &dok_sel
close
select &tra_sel
*close all
commit
RETURN .t.

FUNCTION TRANSPAR_LAD()
if kj_use("transpar",.f.,3)
  dok07_gr=tdok07_gr
  opis07=topis07
  dok08_gr=tdok08_gr
  opis08=topis08
  dok10_gr=tdok10_gr
  opis10=topis10
  dok11_gr=tdok11_gr
  opis11=topis11
  dok12_gr=tdok12_gr
  opis12=topis12
  dok13_gr=tdok13_gr
  opis13=topis13
  dok14_gr=tdok14_gr
  opis14=topis14
  dokex_gr=tdokex_gr
  opisex=topis07      
  bezrej_gr=tbezrej_gr
  bezks_gr=tbezks_gr
  blokuj=tblokuj
  zgdzie=tgdzie
*  rok=trok
  transplik=ttransplik
endif
RETURN

FUNCTION WSPOL_DEF(pzmien)
local wt[1],wq[1]
wt[1]:="w_nazwa"
wq[1]:=""
                ks_default(zfirnum)
                if file("wspolnicy.dbf").and.zkswspolnik
                  select &wspol_sel
                  if kj_use("wspolnic.dbf",.f.,3)
                    set filter to w_widoczny
					go top

					kj_okno(16,2,6," Wsp¢àwàaòciciele ",5)    
                    
                    keyboard chr(205)
                	if pzmien
					  s_kom("[Enter] - rozpocz©cie i zako‰czenie edycji   [Esc] - rezygnacja")
					  dbedit(17,3,21,17,wt,"WL1_FU","",wq,"")
					else
					  s_kom("[Enter] - zatwierdzenie    [Esc] - rezygnacja")
					  dbedit(17,3,21,17,wt,"WL_FU","",wq,"")
					endif  
                    close

                  endif
				*else
                *  kj_tkom(14,"","Funkcja nie jest dost©pna w tej aplikacji.","Skontaktuj si© z producentem lub sprzedawc•.","",5)				  
				endif	
RETURN

FUNCTION WL_FU()
local last:=lastkey()
do case
  case last=27
    return 0
  case last=13
    zwspolnik=w_numer
	return 0
endcase
RETURN 1

FUNCTION WL1_FU()
local last:=lastkey(),lw_nazwa:=w_nazwa
do case
  case last=27
    return 0
  case last=13
    set cursor on
    @ row(),col() get lw_nazwa
	read
	set cursor off
	if.not.lastkey()=27
      if reclock(5)      
	    replace w_nazwa with lw_nazwa
		unlock
	  endif		
      keyboard chr(205)
	endif
	return 2
endcase
RETURN 1


FUNCTION KS_NOWYROK()
local i,ltest,lcolor:=setcolor(),ek
ldysk:="C"
lstary:=curdir()
lnowy:=stuff("LKS_    ",5,4,alltrim(str(year(date())-1)))
save screen to ek
g0_tlo()
kj_okno(7,15,10," Nowy rok rozliczeniowy !                         ",2)	
@ 9,17 say      " Przed uruchomieniem tej funkcji wykonaj dowol-"
@ 10,17 say     " n• metod• peàn• kopi© katalogu roboczego !    "
@ 11,17 say     " Dokumenty w bieæ•cej bazie zostan• usuni©te ! "
if kj_gkom(12,"","WykonaÜ ?","",.t.,5)
  g0_tlo()
  kj_okno(7,15,5," Uwaga !  Wymagana wyà•cznoòÜ dost©pu do baz !    ",5)	
  @ 9,17 say      " Dysk roboczy:                              "
  @ 10,17 say      " Katalog roboczy:                              "
  @ 11,17 say     " Katalog - kopia:                              "
  @ 9,35 say ldysk
  @ 10,35 say lstary
  do while.t.
    set cursor on
    @ 9,35 get ldysk when s_kom("Podaj literowe oznaczenie dysku roboczego")
	@ 11,35 get lnowy when s_kom("Zatwierd´ nazw© katalogu, w kt¢rym system podejmie pr¢b© utworzenia kopii")
    read
    set cursor off
    if.not.lastkey()=27
	  ltest=ldysk+":\"+lnowy+"\001fir\ksiega.dbf"    
	  if.not.file(ltest)
        if kj_gkom(12,"","WykonaÜ ?","",.t.,5).or.lastkey()=27
		  close_all("SH")
          close databases
		  run bat\ks_nowyr &ldysk &lstary &lnowy
	      if ferror()=0
		    pit5_nrok()
			restore screen from ek
		    kj_tkom(14,"","Operacja zako‰czona pomyòlnie.","Program przygotowaà Ksi©g© do obsàugi nowego roku.","",5)
		  endif
		  close_all("SH")
		  clear
		  exit
		endif  
	  else
        kj_tkom(14," Uwaga! "," Taki katalog juæ istnieje !","Zmie‰ nazw© katalogu i ponow pr¢b©.","",5)
	  endif
    else
	  exit
	endif
  enddo
endif
RETURN

FUNCTION KS_REMANENT()
local lp_remanent:=0,la_remanent:=0,ek
save screen to ek

ks_default(zfirnum)
if file("pit5.dbf")
  if kj_use("pit5",.f.,3)
    lp_remanent=p_remanent
	la_remanent=a_remanent
      g_tlo()
      kj_okno(5,10,12," Obsàuga remanentu                                          " ,5)
      @ 7,12 say  "WartoòÜ remanentu :"
      @ 9,12 say "   Na pocz•tku okresu rozliczeniowego ...              "
      @ 11,12 say "   Na ko‰cu okresu rozliczeniowego ......              "	  
	  set cursor on
	  @ 9,53 get lp_remanent picture "999999999.99"
	  @ 11,53 get la_remanent picture "999999999.99"
	  read
	  set cursor off
	  @ 9,53 say lp_remanent picture "999999999.99"
	  @ 11,53 say la_remanent picture "999999999.99"	  
      @ 12,12 say "                                         ------------ "	  
	  if la_remanent>lp_remanent
        @ 13,12 say "   Zwi©kszenie wartoòci remanentu  ......              "
		@ 13,53 say la_remanent-lp_remanent picture "999999999.99"
	  else
        @ 13,12 say "   Zmniejszenie wartoòci remanentu  .....              "
		@ 13,53 say lp_remanent-la_remanent picture "999999999.99"	  
	  endif
      @ 15,12 say   "Uwaga! "
	  @ 16,12 say   "Obliczenia PIT5 uwzgl©dniaj• r¢ænic© w remanencie." 
	  if kj_gkom(19,"","ZatwierdziÜ dane ?","",.t.,5).or.lastkey()=27
        if reclock(5)      
	      replace p_remanent with lp_remanent
		  replace a_remanent with la_remanent
		  unlock
	    endif		    
	  endif
    close
  endif
else
  kj_tkom(14," Uwaga! "," Brak pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub zostaà usuni©ty.","Konieczny serwis !",5)
endif
restore screen from ek
RETURN

FUNCTION PIT5_NROK()
local la_remanent:=0
local i:=1,k:=1
pit5_public()
select &kspit5_sel
for i=1 to zksilefirm
  ks_default(i)
  if file("pit5.dbf")
	if kj_use("pit5",.f.,3)  
	  la_remanent=a_remanent
	  locate for lp=12
	  if found()
        pit5_lad()
		locate for lp=1
		if found()
		  zpit5styczen_zer()
          pit5_replac()		
          if reclock(5)      
	        replace p_remanent with la_remanent
			replace a_remanent with la_remanent
		    unlock
	      endif
		  zpit5_zer()						  
		  for k=2 to 12
		    locate for lp=k
			if found()
              pit5_replac()		
			else
			  kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    
			endif
		  next
		else
          kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    		
		endif	  
	  else
        kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    
	  endif
	  close
	endif
  endif  
  if file("pit5_01.dbf")
    if kj_use("pit5_01",.f.,3)  
	  locate for lp=12
	  if found()
        pit5_lad()
		locate for lp=1
		if found()
		  zpit5styczen_zer()
          pit5_replac()		
		  zpit5_zer()			
		  for k=2 to 12
		    locate for lp=k
			if found()
              pit5_replac()		
			else
			  kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    
			endif
		  next
		else
          kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    		
		endif	  
	  else
        kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    
	  endif
	close
	endif
  endif    
  if file("pit5_02.dbf")
    if kj_use("pit5_02",.f.,3)  
	  locate for lp=12
	  if found()
        pit5_lad()
		locate for lp=1
		if found()
		  zpit5styczen_zer()
          pit5_replac()		
		  zpit5_zer()			
		  for k=2 to 12
		    locate for lp=k
			if found()
              pit5_replac()		
			else
			  kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    
			endif
		  next
		else
          kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    		
		endif	  
	  else
        kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    
	  endif
	close
	endif
  endif    
  if file("pit5_03.dbf")
    if kj_use("pit5_03",.f.,3)  
	  locate for lp=12
	  if found()
        pit5_lad()
		locate for lp=1
		if found()
		  zpit5styczen_zer()
          pit5_replac()		
		  zpit5_zer()			
		  for k=2 to 12
		    locate for lp=k
			if found()
              pit5_replac()		
			else
			  kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    
			endif
		  next
		else
          kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    		
		endif	  
	  else
        kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    
	  endif
	close
	endif
  endif    
  if file("pit5_04.dbf")
    if kj_use("pit5_04",.f.,3)  
	  locate for lp=12
	  if found()
        pit5_lad()
		locate for lp=1
		if found()
		  zpit5styczen_zer()
          pit5_replac()		
		  zpit5_zer()			
		  for k=2 to 12
		    locate for lp=k
			if found()
              pit5_replac()		
			else
			  kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    
			endif
		  next
		else
          kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    		
		endif	  
	  else
        kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    
	  endif
	close
	endif
  endif    
  if file("pit5_05.dbf")
    if kj_use("pit5_05",.f.,3)  
	  locate for lp=12
	  if found()
        pit5_lad()
		locate for lp=1
		if found()
		  zpit5styczen_zer()
          pit5_replac()		
		  zpit5_zer()			
		  for k=2 to 12
		    locate for lp=k
			if found()
              pit5_replac()		
			else
			  kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    
			endif
		  next
		else
          kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    		
		endif	  
	  else
        kj_tkom(14," Uwaga! "," Bàedne dane w pliku PIT5.DBF !","Prawdopodobnie ulegà on uszkodzeniu lub pochodzi z innej wersji programu.","Konieczny serwis !",5)	    
	  endif
	close
	endif
  endif            
next
RETURN

FUNCTION REM_OKNO(pw,pk)
if f_tmiesiac=12
  if za_remanent>zp_remanent
    @ pw,pk say " Uwaga!  Uwzgl©dniono wzrost wartoòci remanentu w kwocie: "+alltrim(str(za_remanent-zp_remanent,12,2))
  endif
  if za_remanent<zp_remanent
    @ pw,pk say " Uwaga!  Uwzgl©dniono spadek wartoòci remanentu w kwocie: "+alltrim(str(zp_remanent-za_remanent,12,2))
  endif
endif
RETURN

FUNCTION KROP(ptxtliczba)    &&060216
local llen:=0,i,lkrop:=.f.,lznak:=" ",ltxt:=ptxtliczba, lliczba:=0
if zround=0
  lliczba=val(ptxtliczba)
  lliczba=kj_round(lliczba,0)
  ltxt=str(lliczba)
endif
RETURN ltxt

FUNCTION KROP_old(ptxtliczba)    
local llen:=0,i,lkrop:=.f.,lznak:=" ",ltxt:=ptxtliczba
if zround=0
  *ltxt=alltrim(ptxtliczba)
  llen=len(ltxt)
  for i=1 to llen
    lznak=substr(ltxt,i,1)
    if lkrop
      ltxt=stuff(ltxt,i,1,"0")
    else
      if lznak=="."
	    lkrop=.t.
		ltxt=stuff(ltxt,i,1," ")
	  endif
    endif
  next
endif
RETURN ltxt

*FUNCTION INNE_MENU1(ppoz)
FUNCTION INNEKS_MENU1(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=1
ltnaz[1]:=" Drukarki    "
ltnaz[2]:=" Opcje       "

ltlit[1]:=" D           "
ltlit[2]:=" O           "
ltopis[1]:="Wyb¢r drukarki domyòlnej"
ltopis[2]:="Definiowane przez Uæytkownika opcje programu."
save screen to ek
  lpoz=men_pion(6,37,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION KS_NUMPOZ()
local lkspoz:=0
set filter to
go top
do while.not.eof()
  if.not.ksanul.and.year(ksdatdok)=zrok.and.kszapis$"AB"
    lkspoz=lkspoz+1
      if reclock(5)      
	    replace kspoz with lkspoz
		unlock
	  endif	  
  endif
  if kszapis$"C"
      if reclock(5)      
	    replace kspoz with 0
		unlock
	  endif	    
  endif
  skip
enddo
RETURN

FUNCTION KJ_DATA(pdzien,pmies,prok)
local ldat:="  .  .    ",lldat
if pdzien<10
  ldat=stuff(ldat,2,1,str(pdzien,1))
else
  ldat=stuff(ldat,1,2,str(pdzien,2))
endif
if pmies<10
  ldat=stuff(ldat,5,1,str(pmies,1)) 
else
    ldat=stuff(ldat,4,2,str(pmies,2))
endif
ldat=stuff(ldat,7,4,str(prok,4))
lldat=ctod(ldat)
RETURN lldat


*Funkcja umoæliwia zdefiniowanie odpowiedniego okresu do analizy             *
*oraz sumuje i drukuje obroty wszystkich firm, kt¢rych NIP zaczyna si© od    *
*liter ( z wyà•czeniem PL")                                                  *
*
FUNCTION UERAPORT()
local lrok:=zrok,lmiesiac:=month(date()),ek1,lsum:=0,lcol:=10,lpoz:=0
local lkwartal:=1, lsum_all:=0
save screen to ek1
ks_zapis()
rapwar=rapwar+".and.kszapis=zkszapis"
do case
  case zkszapis="A"
    @ 20,20 say " Ksi©ga + Rejestry "
  case zkszapis="B"
    @ 20,20 say " Tylko Ksi©ga      "
  case zkszapis="C"
    @ 20,20 say " Tylko Rejestry    "		
endcase
kj_okno(3,30,3,"                        ",5)
set cursor on
@ 5,32say "Zatwierd´ rok"
@ 5,47 get lrok picture "9999" range 2000,2030 when s_kom("Podaj rok dla ostatniego miesi•ca obj©tego analiz•.")
read
set cursor off
if lastkey()=27
  return
endif
zuerok=lrok
if lmiesiac=1
  lmiesiac=12
else
  lmiesiac=lmiesiac-1
endif
do case
  case lmiesiac=1.or.lmiesiac=2.or.lmiesiac=3
    lkwartal=1
  case lmiesiac=4.or.lmiesiac=5.or.lmiesiac=6
    lkwartal=2
  case lmiesiac=7.or.lmiesiac=8.or.lmiesiac=9
    lkwartal=3
  case lmiesiac=10.or.lmiesiac=11.or.lmiesiac=12
    lkwartal=4			
endcase
lkwartal=uerap_menu(lkwartal)
if lastkey()=27
  close
  return
endif

do case
  case lkwartal=1
    rapwar=rapwar+".and.( (month(ksdatdok)=1.or.month(ksdatdok)=2.or.month(ksdatdok)=3).and.year(ksdatdok)=zuerok )"	
  case lkwartal=2
    rapwar=rapwar+".and.( (month(ksdatdok)=4.or.month(ksdatdok)=5.or.month(ksdatdok)=6).and.year(ksdatdok)=zuerok )"	
  case lkwartal=3
    rapwar=rapwar+".and.( (month(ksdatdok)=7.or.month(ksdatdok)=8.or.month(ksdatdok)=9).and.year(ksdatdok)=zuerok )"	
  case lkwartal=4
    rapwar=rapwar+".and.( (month(ksdatdok)=10.or.month(ksdatdok)=11.or.month(ksdatdok)=12).and.year(ksdatdok)=zuerok )"				

endcase


restore screen from ek1


  if file("ueksiega.dbf")
    select &ueksiega_sel
    if kj_use("ueksiega",.t.,3)  
	  zap
	else
	  return
	endif
  else
    copy structure to ueksiega
	select &ueksiega_sel
	if.not.kj_use("ueksiega",.t.,3)  
	  return
	endif
  endif  
    
  select &ks_sel  
  set filter to
  go top
  index on ksnip to ksnip
  set index to ksnip
  set filter to &rapwar
  go top

  ks_lad()
  lsum_all=0
  lsum=ks_a+ks_b+ks_c+ks_d+ks_e+ks_f+ks_z
  do while.not.eof()
	skip
	if ksnip=zksnip
	  lsum=lsum+ks_a+ks_b+ks_c+ks_d+ks_e+ks_f+ks_z
	else
	  select &ueksiega_sel
	  append blank
	  replace ksnip with zksnip, ks_a with lsum
	  lsum_all=lsum_all+lsum
	  select &ks_sel
	  ks_lad()
	  lsum=ks_a+ks_b+ks_c+ks_d+ks_e+ks_f+ks_z
	endif
  enddo
close
select &ueksiega_sel
zdruk_def=1
zdruk_def=ue_druk_menu(zdruk_def)
if lastkey()=27
  close
  return
endif
if zdruk_def=1
  if.not.start_druk()
    set device to screen
 	return .f.
  endif
else
  plik="wydruki\ue_rap.txt"
  set printer to &plik
endif
go top
set device to printer

w=prow()
if.not.empty(zfirnaz)
  @ w,lcol say &zdr_kkond+zfirnaz
  w=w+2
endif
@ w,lcol say zan_tytul
w=w+2
@ w,lcol say "================================================="
w=w+1
@ w,lcol say "| Lp. | Kod kraju |   N I P    |  Kwota  w  zà. |"
w=w+1
@ w,lcol say "|=====|===========|============|================|"

w=w+1
@ w,lcol say "|     |           |            |                |"
do while.not.eof()
  lpoz=lpoz+1
  w=w+1
  @ w,lcol say "|"
  @ w,lcol+2 say lpoz picture "999"
  @ w,lcol+6 say "|"
  @ w,lcol+12 say substr(ksnip,1,2)
  @ w,lcol+18 say "|"
  @ w,lcol+20 say substr(ksnip,3)
  @ w,lcol+31 say "|"
  @ w,lcol+33 say kj_round(ks_a,0) picture "9999999.99"
  @ w,lcol+48 say "|"
  skip
enddo
close
w=w+1
@ w,lcol say "|     |           |            |                |"
w=w+1
@ w,lcol say "================================================="
w=w+2
@ w,lcol say "Razem: "
@ w,lcol+10 say lsum_all picture "9 999 999 999.99" 
eject
set device to screen
if.not.zdruk_def=1
  save screen to ek
  edi=edit+" wydruki\ue_rap.txt"
  run &edi 
  restore screen from ek
  set cursor off   
endif
set key 24 to
set key 5 to
RETURN