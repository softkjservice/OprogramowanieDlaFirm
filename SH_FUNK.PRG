*******************************************************************************
* Otworzenie odpowiedniej bazy dokumentow                                     *
*******************************************************************************
FUNCTION DOK_USE()
local lexlusive:=.t.
if zd_siec
  lexlusive=.f.
endif
dok_default()
*do case
*  case zkj_kasa.or.zdtyp$kasa_gr
*    select &kasa_sel
*  otherwise
    select &dok_sel
*endcase
if.not.used()
  if kj_use("dokum",lexlusive,3)
    set index to dok_ident,dok_num,dow_num
	if zkonlimit=1
	  if.not.file("dow_knum.ntx")
	    index on dkontrah to dow_knum
		set index to dok_ident,dok_num,dow_num,dow_knum
	  else
	    set index to dok_ident,dok_num,dow_num,dow_knum
	  endif
	endif
  else	
    return .f.
  endif
endif
RETURN .t.

FUNCTION BUF_USE()
      *set default to shset
	  set default to &set_serwer
      select &buf_sel
	  if.not.used()
        if.not.kj_use("towbuf",.t.,3)
	      return .F.
		else
		  set index to towbuf
		endif
		set index to towbuf
      else
	    set index to towbuf
	  endif
RETURN .T.

FUNCTION DOKEXP_USE()
      dok_default()
      select &dokexp_sel
	  if.not.used()
        if.not.kj_use("dok_exp",.t.,3)
	      return .F.
		endif
      endif
RETURN .T.


FUNCTION TABLEXP_USE()
      set default to &set_serwer
      select &tablexp_sel
	  if.not.used()
        if.not.kj_use("tabl_exp",.f.,3)
	      return .F.
		endif
      endif
RETURN .T.

FUNCTION WZOR_USE()
      set default to &set_serwer
      select &wzor_sel
	  if.not.used()
        if.not.kj_use("wzor",.f.,3)
	      return .F.
		endif
      endif
RETURN .T.

FUNCTION ANTOWAR_USE()
      set default to &set_serwer
      select &antowar_sel
	  if.not.used()
        if.not.kj_use("antowar",.f.,3)
	      return .F.
		endif
      endif
RETURN .T.


FUNCTION TABLIMP_USE()
      set default to &set_serwer
      select &tablimp_sel
	  if.not.used()
        if.not.kj_use("tabl_imp",.f.,3)
	      return .F.
		endif
      endif
RETURN .T.

FUNCTION DLUGRAP_USE(pwar)
	  set default to &set_serwer
      select &dlugrap_sel
	  if.not.used()
        if.not.kj_use("dlug_rap",pwar,3)
	      return .F.
		endif
	  endif
RETURN .T.



FUNCTION KON_USE()
lexlusive:=.f.
if.not.zsiec
  lexlusive:=.t.
endif
kondefault()
select &kon_sel
if.not.used()
  if.not.kj_use("kon",lexlusive,3)
    return .f.
  endif
  set index to k_naz,k_nip,k_num
endif
RETURN .t.

FUNCTION ODDZIAL_USE()
lexlusive:=.f.
if.not.zsiec
  lexlusive:=.t.
endif
kondefault()
select &oddzial_sel
if.not.used()
  if.not.kj_use("oddzial",lexlusive,3)
    return .f.
  endif
  set index to o_naz,o_nip,o_num
endif
RETURN .t.





FUNCTION TOW_USE(pexlusive)
local lexlusive:=pexlusive
select &tow_sel
close
    dok_default()
    if.not.kj_use("towary",lexlusive,3)
      return .f.
    endif
    set index to t_dow,t_index,t_nazkod
RETURN .t.

FUNCTION BO_USE(pmag)
local lmag:=pmag,luse:=.f.
lexlusive:=.f.
if.not.zsiec
  lexlusive:=.t.
endif
magdefault(lmag)
select &gbo_sel
if file("bo.dbf")
  if.not.used()
    if kj_use("bo",lexlusive,3)
      luse=.t.
    else
	  return luse
	endif
  else
    luse=.t.
  endif
  set index to bo_naz,bo_kod,bo_mnk,bo_index
  set order to mklucz
  go top
endif
RETURN luse


FUNCTION MAG_USE(pmag)
local lmag:=pmag,luse:=.f.
lexlusive:=.f.
if.not.zsiec
  lexlusive:=.t.
endif
magdefault(lmag)
select &gmag_sel
  if.not.used()
    if kj_use("magaz",lexlusive,3)
      luse=.t.
    else
	  return luse
	endif
  else
    luse=.t.
  endif
  if zkreskakod
    if zmgrupy
      set index to m_naz,m_kod,m_kresr,m_index,m_grup
    else
      set index to m_naz,m_kod,m_kresk,m_index
    endif  
  else
    if zmgrupy
      set index to m_naz,m_kod,m_mnk,m_index,m_grup
    else
      set index to m_naz,m_kod,m_mnk,m_index
    endif
  endif	
  set order to mklucz
  go top
RETURN luse

FUNCTION FIFO_USE(pmag)
local lmag:=pmag,luse:=.f.
lexlusive:=.f.
if.not.zsiec
  lexlusive:=.t.
endif
magdefault(lmag)
select &fifo_sel
  if.not.used()
    if kj_use("fifo",lexlusive,3)
      luse=.t.
	  set index to fifo
    else
	  return luse
	endif
  else
    luse=.t.
  endif
  go top
RETURN luse

FUNCTION FIFO_BO_USE(pmag)
local lmag:=pmag,luse:=.f.
lexlusive:=.f.
if.not.zsiec
  lexlusive:=.t.
endif
magdefault(lmag)
select &fifo_bo_sel
  if.not.used()
    if kj_use("fifo_bo",lexlusive,3)
      luse=.t.
	  set index to fifo_bo
    else
	  return luse
	endif
  else
    luse=.t.
  endif
  go top
RETURN luse

FUNCTION FIFO_TOW_USE()
select &fifo_tow_sel
close
    dok_default()
    if.not.kj_use("fifo_tow",.t.,3)
      return .f.
    endif
    set index to fifo_tow
RETURN .t.


FUNCTION REMPLIK_USE(pmag)
local lmag:=pmag,luse:=.f.
lexlusive:=.f.
if.not.zsiec
  lexlusive:=.t.
endif
magdefault(lmag)
select &remplik_sel
  if.not.used()
    if kj_use("remplik",lexlusive,3)
      luse=.t.
    else
	  return luse
	endif
  else
    luse=.t.
  endif
    set index to rem_naz,rem_kod
  go top
RETURN luse


FUNCTION KONMAG_USE(pmag)
local lmag:=pmag,luse:=.f.
lexlusive:=.f.
if.not.zsiec
  lexlusive:=.t.
endif
magdefault(lmag)
select &konmag_sel
  if.not.used()
    if kj_use("konmag",lexlusive,3)
      luse=.t.
    else
	  return luse
	endif
  else
    luse=.t.
  endif
  set index to km_naz,km_kod,km_mnk,km_index
  set order to mklucz
  go top
RETURN luse

FUNCTION AKWIZYT_USE()
      dok_default()
      select &akwizyt_sel
	  if.not.used()
        if.not.kj_use("akwizyt",.f.,3)
	      return .F.
		endif
      endif
	  set index to akw_skr,akw_num
RETURN .T.


******************050715
*******************************************************************************
* Kontrola dostepu do zasobow sieciowych                                      *
*******************************************************************************
FUNCTION D_NET()
local lcolor:=setcolor(),ek
if file(f_set)     
  pnet=.t.
else
  save screen to ek
  kj_tkom(10," Uwaga! "," Brak dostepu do zasobow sieciowych.","Sprawdz polaczenia sieciowe oraz ustawienia parametrow","Popraw i ponow probe.  Nacisnij dowolny klawisz.",5)
  restore screen from ek
  pnet=.f.
endif
RETURN pnet




*******************************************************************************
*******************************************************************************
*******************************************************************************
FUNCTION KSSETUP_LAD()
zrstopa1=rstopa1
zrstopa2=rstopa2
zrstopa3=rstopa3
zrdolicz1:=rdolicz1
zrdolicz2:=rdolicz2
zrdolicz3:=rdolicz3
zrprog2=rprog2
zrprog3=rprog3
zksrycz_a=ksrycz_a
zksrycz_b=ksrycz_b
zksrycz_c=ksrycz_c
RETURN

FUNCTION LOCALSET_LAD()
do while.not.eof()
  do case
    case alltrim(co)=="D_SERWER"
	  zd_serwer=alltrim(jak)
    case alltrim(co)=="M_SERWER"
	  zm_serwer=alltrim(jak)	  
    case alltrim(co)=="K_SERWER"
	  zk_serwer=alltrim(jak)	  
    case alltrim(co)=="P_SERWER"
	  zp_serwer=alltrim(jak)	  
    case alltrim(co)=="DNUM_SERWER"
	  zdnum_serwer=alltrim(jak)	  	  
    case alltrim(co)=="SET_SERWER"
	  zset_serwer=alltrim(jak)	  	  	  
    case alltrim(co)=="ZAK_SERWER"
	  zzak_serwer=alltrim(jak)	  	  	  	  
    case alltrim(co)=="SIEC"
	  if alltrim(jak)="1"
	    zsiec=.t.
	  endif
    case alltrim(co)=="D_SIEC"
	  if alltrim(jak)="1"
	    zd_siec=.t.
	  endif	  
    case alltrim(co)=="HASLO_L"
	  if alltrim(jak)="1"
	    zhaslo_l=.t.
	  endif	   	  
    case alltrim(co)=="HASLO_D"
	  if alltrim(jak)="1"
	    zhaslo_d=.t.
	  endif	   	  	  
    case alltrim(co)=="WIELOMAG"
	  if alltrim(jak)="1"
	    zwielomag=.t.
	  endif	  	 
    case alltrim(co)=="WMAGIL"
      zwmagil=val(alltrim(jak))
    case alltrim(co)=="OPOZNIENIE"
      zopoznienie=val(alltrim(jak))		  
    case alltrim(co)=="STRONA_DL"
      zstrona_dl=val(alltrim(jak))		  
    case alltrim(co)=="MJM_DEF"
      zmjm_def=alltrim(jak)	
    case alltrim(co)=="ZM_ZA_BRUT"
	  if alltrim(jak)="1"
	    zm_za_brut=.t.
	  endif	  
    case alltrim(co)=="ZDOK_FILTR"
	  if alltrim(jak)="1"
	    zdok_filtr=.t.
	  endif	  	  
    case alltrim(co)=="ZMARZ_ONLINE"
	  if alltrim(jak)="1"
	    zmarz_online=.t.
	  endif	  	  
    case alltrim(co)=="ZANUL_UP"
	  if alltrim(jak)="1"
	    zanul_up=.t.
	  endif	  	
    case alltrim(co)=="ZPOPRAW_UP"
	  if alltrim(jak)="1"
	    zpopraw_up=.t.
	  endif	  	  
    case alltrim(co)=="KRABAT_UP"
	  if alltrim(jak)="1"
	    krabat_up=.t.
	  endif	  	    
    case alltrim(co)=="DRABAT_UP"
	  if alltrim(jak)="1"
	    drabat_up=.t.
	  endif	  	    	  

    case alltrim(co)=="EDIT"
	  edit=alltrim(jak)	  	  
  endcase
  skip
enddo
RETURN nil

*******************************************************************************
* Zapamietanie zmiennych w pliku fl_setup                                     *
*******************************************************************************
FUNCTION ZF_SET_L_REPLAC()
replace siec with zsiec,d_siec with zd_siec,d_server with zd_server,d_tryb with zd_tryb
replace d_znak with zd_znak,d_round with zd_round,d_fis with zd_fis
replace d_fbrutto with zd_fbrutto,d_rbrutto with zd_rbrutto,d_pbrutto with zd_pbrutto    
replace d_pskrocon with zd_pskrocon,d_pimienny with zd_pimienny,d_logo with zd_logo  
replace k_siec with zk_siec,k_server with zk_server,k_tryb with zk_tryb  
replace m_siec with zm_siec,m_server with zm_server,m_tryb with zm_tryb  
replace p_siec with zp_siec,p_server with zp_server,p_tryb with zp_tryb
replace m_wmagil with zm_wmagil
RETURN nil

*******************************************************************************
* Zapamietanie zmiennych w pliku fs_setup                                     *
*******************************************************************************
FUNCTION ZF_SET_S_REPLAC()
replace vat_a with zvat_a,vat_b with zvat_b,vat_c with zvat_c  
replace vat_d with zvat_d,vat_e with zvat_e,vat_f with zvat_f
replace m_ponizej with zm_ponizej,m_narzut with zm_narzut    
RETURN nil



FUNCTION SADPLIK_SUM(pwarunek)
local recno:=recno(),llitera,lwarunek:=pwarunek,ltcen
	do while &pwarunek
      ltcen=tcen
	    if zdtyp$import_gr.or.zdtyp$eksport_gr
		  ltcen=tcen_dewiz
		endif
	  do case
        case tstawka=zvat_a
	      ztnet_a=ztnet_a+round(ltcen,2)
		  ztvat_a=ztvat_a+round(ltcen*zvat_a/100,1)
        case tstawka=zvat_b
	      ztnet_b=ztnet_b+round(ltcen,2)
		  ztvat_b=ztvat_b+round(ltcen*zvat_b/100,1)
        case tstawka=zvat_c
	      ztnet_c=ztnet_c+round(ltcen,2)
		  ztvat_c=ztvat_c+round(ltcen*zvat_c/100,1)
        case tstawka=zvat_d
	      ztnet_d=ztnet_d+round(ltcen,2)
		  ztvat_d=ztvat_d+round(ltcen*zvat_d/100,1)
        case tstawka=zvat_e
	      ztnet_e=ztnet_e+round(ltcen,2)
		  ztvat_e=ztvat_e+round(ltcen*zvat_e/100,1)
        case tstawka=zvat_f
	      ztnet_f=ztnet_f+round(ltcen,2)
		  ztvat_f=ztvat_f+round(ltcen*zvat_f/100,1)
        case tzwolniony
	      ztnet_z=ztnet_z+round(ltcen,2)
      endcase
      skip
    enddo
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
go recno
RETURN nil

FUNCTION SAD_STOPA()
local ltxt1:=space(48)+"|     R a z e m :    "
local ltxt2:=space(44)+"    |"
*local ltxt3:=space(48)+"|"+space(10)
local ltxt3:=space(48)+"|"+space(2)
local t[7],q[7],i
for i=1 to 7
  t[i]:=space(73)
  q[i]:=space(2)
next
i=1

l_all=str(ztnet_all,11,2)+"     "+str(ztvat_all,11,2)+" "+str(ztbrut_all,11,2)+"            |"
  if.not.zdtyp $ stopabezvat_gr
    if.not.ztnet_a=0
      t[i]=str(ztnet_a,11,2)+space(5)+str(ztvat_a,11,2)+" "+str(ztbrut_a,11,2)+"            |"
      q[i]=str(mvat("A"))+" %"       
	  i=i+1
	endif  
    if.not.ztnet_b=0
      t[i]=str(ztnet_b,11,2)+space(5)+str(ztvat_b,11,2)+" "+str(ztbrut_b,11,2)+"            |"
      q[i]=str(mvat("B"))+" %"              
	  i=i+1
	endif  
    if.not.ztnet_c=0
      t[i]=str(ztnet_c,11,2)+space(5)+str(ztvat_c,11,2)+" "+str(ztbrut_c,11,2)+"            |"
      q[i]=str(mvat("C"))+" %"       
	  i=i+1
	endif  
    if.not.ztnet_d=0
      t[i]=str(ztnet_d,11,2)+space(5)+str(ztvat_d,11,2)+" "+str(ztbrut_d,11,2)+"            |"
      q[i]=str(mvat("D"))+" %"              
	  i=i+1
	endif  
    if.not.ztnet_e=0
      t[i]=str(ztnet_e,11,2)+space(5)+str(ztvat_e,11,2)+" "+str(ztbrut_e,11,2)+"            |"
      q[i]=str(mvat("E"))+" %"              
	  i=i+1
	endif  
    if.not.ztnet_f=0
      t[i]=str(ztnet_f,11,2)+space(5)+str(ztvat_f,11,2)+" "+str(ztbrut_f,11,2)+"            |"
      q[i]=str(mvat("F"))+" %"              
	  i=i+1
	endif  
    if.not.ztnet_z=0
      t[i]=str(ztnet_z,11,2)+space(5)+str(ztvat_z,11,2)+" "+str(ztbrut_z,11,2)+"            |"
      q[i]="zw"+". "       
	  i=i+1
	endif  						
    @ w,vcol say ltxt1+l_all
	w=w+1
	@ w,vcol say ltxt2+w_tym_ze_stawka+space(53)+"|"
	w=w+1
	@ w,vcol say ltxt3+q[1]+space(6)+t[1]
    w=w+1
    i=2
	do while.t.
      if.not.empty(t[i])
        @ w,vcol+48 say "|  "+ q[i]+space(6)+t[i]
		w=w+1         	  
	  endif
	  i=i+1
	  if i>7
	    exit
	  endif
	enddo
endif
@ w,vcol+48 say replicate("=",73)
w=w+1
RETURN nil


FUNCTION DSAD_END()
local ek
local ltyt:=" Rozliczenie zakupu towar¢w wg SAD z uwzgl©dnieniem stawek podatku VAT"
save screen to ek
g_tlo()
kj_okno(2,5,8,ltyt,2)
@ 4,7 say   "Numer dokumentu SAD ................"
@ 6,7 say   "Data ksi©gowania ..................."
if zdtyp$importsad_gr
  @ 8,7 say "Dotyczy dokument¢w......."
endif
set cursor on
@ 4,43 get zsad_numer
@ 6,43 get zddatdok
@ 8,33 get zdopis3 picture "@S40"
read
set cursor off
if.not.lastkey()=27
  zdopis2=stuff(zdopis2,1,30,zsad_numer)
endif
wystawil(.f.)
restore screen from ek	
RETURN


FUNCTION SH_NOWYROK()
local i,ltest,lcolor:=setcolor(),ek
lstary:=curdir()
lnowy:=stuff("LEG_    ",5,4,alltrim(str(year(date())-1)))
save screen to ek
g0_tlo()
kj_okno(7,15,10," Nowy rok rozliczeniowy                           ",2)	
@ 9,17 say      " Funkcja utworzy kopi© baz danych we wskazanym "
@ 10,17 say     " katalogu, wyzeruje numeracj© dokument¢w oraz  "
@ 11,17 say     " zatwierdzi bie¾¥cy stan magazynowy jako  B.O. "
if kj_gkom(12,"","Wykona† ?","",.t.,25)
  g0_tlo()
  kj_okno(7,15,5," Uwaga !  Wymagana wyˆ¥czno˜† dost©pu do baz !    ",5)	
  @ 9,17 say      " Katalog roboczy:                              "
  @ 11,17 say     " Katalog - kopia:                              "
  @ 9,35 say lstary
  do while.t.
    set cursor on
    @ 11,35 get lnowy
    read
    set cursor off
    if.not.lastkey()=27
	  ltest=lnowy+"\001dok\dokum.dbf"    
	  if.not.file(ltest)
        close all
        close databases
		run bat\sh_nowyr &lstary &lnowy
        numdok_zer()
        *if znew_1
		*  bo_new()
		*else
		  bo_kleszcz(1)
		*endif  
	    close_all("SH")
		clear
	    exit
	  else
        kj_tkom(14," Uwaga! "," Taki katalog ju¾ istnieje !","Zmieä nazw© katalogu i ponow pr¢b©.","",5)
	  endif
    endif
  enddo
endif
RETURN

FUNCTION BO_KLESZCZ(pmag)
local lcolor:=setcolor()
g0_tlo()
vmag=pmag
close_all("SH")
if.not.mag_use(pmag)
  return
endif
if zrem_new
  if pmag=1
    if zfifo="1"
	  fifo_kleszcz()
	else
	  remplik()
      select &remplik_sel
      boremplik_zatwierdz()
	endif
  else
    bo_zatwierdz()
  endif
else
  magdefault(pmag)
  select &gmag_sel
  bo_zatwierdz()
endif

setcolor(lcolor)	      
RETURN

FUNCTION ARCHIW_MENU(prodz_dok)
local t[1]
local lpoz:=1
t[1]:="arch_naz"
	  *lw=(lpoz-1)*10
	  lk=prodz_dok*10
	  do while .t.
	    save screen to ek1
		set default to &dokdef_serwer
        if.not.file("archiw.dbf")
		  ld_sciezka:=zd_serwer+"leg01"
		  set default to &ld_sciezka
		endif
	    select &archiw_sel
	    if kj_use("archiw",.f.,3)
		  ildok=ilosc_dok()   &&Liczy faktyczn¥ ilo˜† dost©pnych rekord¢w
		  @ 4,lk+3 to 4+ildok+1,lk+19 
		  keyboard chr(205)
          dbedit(5,lk+4,5+ildok-1,lk+18,t,"FU_MA","","","",,"")
	      close
		  if lastkey()=27
			exit
		  endif
		  
		    do while.t.
			  save screen to ek2  
		      do case
	            case lastkey()=27
		          exit
	            case zarch_poz=-1
				  
				  dokimport()
				  exit
				case zarch_poz=0
				  if.not.zznak_dok=zkordok_znak
				    nowy_dok()
				  endif
	            case zarch_poz=1
                  dok_old(zd_serwer,zk_serwer,zm_serwer)
				  if zdsymbol=zkordok_symbol
				    exit
				  endif
				case zarch_poz>1
				  zdarchiwum=.t.
                  if zdtyp$kasa_gr
				    zkasarchiwum=.t.
				  else
				    zkasarchiwum=.f.
				  endif
				  dok_old(zd_serwer,zk_serwer,zm_serwer)
				  zdarchiwum=.f.
				  if zdsymbol=zkordok_symbol
				    exit
				  endif				  
	          endcase	
	          restore screen from ek2
	        enddo
	      restore screen from ek1
          close_all("SH")
		else
	      if.not.kj_gkom(12," Uwaga!","Brak dost©pu do pliku ARCHIW.DBF","Ponowi† pr¢b© ?",5)
		    exit
		  endif
	    endif
	  enddo	

RETURN lpoz

FUNCTION FU_MA()
local last:=lastkey()
do case
  case last=27
    return 0
  case last=13
    archiw_lad()
	return 0
endcase

RETURN 1


FUNCTION A_KWESTIONARIUSZ()
local ek,lcolor:=setcolor(),lzam1:=substr(zpadr_zam,1,56)
local lzam2:=substr(zpadr_zam,57),lkor1:=substr(zpadr_kor,1,54)
local lkor2:=substr(zpadr_kor,55)
save screen to ek
set color to b/b
clear
s_kom("oK!")
set color to w/gr+
@ 0,0 say space(80)
@ 0,2 say "KWESTIONARIUSZ OSOBOWY"
set color to n/w,gr+/w
set cursor on
@ 2,1 say "Nazwisko.."
@ 2,12 get zpnazwisko
@ 2,37 say "Imi©.."
@ 2,43 get zpimie
@ 4,1 say "Nazwisko rodowe.."
@ 4,18 get zpnaz_rod
@ 4,43 say "Imi© matki.."
@ 4,55 get zpimie_m
@ 6,1 say "Imi© ojca.."
@ 6,12 get zpimie_o
@ 6,32 say "Nazwisko rodowe matki.."
@ 6,55 get zpnaz_m_rod
@ 8,1 say "Data i miejsce urodzenia.."
@ 8,27 get zpurodz
@ 8,1 say "Obywatelstwo.."
@ 8,15 get zpobywat
@ 10,35 say "PESEL.."
@ 10,42 get zppesel
@ 10,58 say "NIP.."
@ 10,63 get zpnip
@ 12,1 say "Miejsce zameldowania.."
@ 12,23 get lzam1
@ 13,1 get lzam2
@ 15,1 say "Adres korespondencyjny.."
@ 15,25 get lkor1
@ 16,1 get lkor2
@ 18,1 say "Tel..."
@ 18,7 get zptel
@ 18,50 say "Kasa chorych.."
@ 18,64 get zpkasa
read

zpadr_zam=stuff(space(134),1,56,lzam1)
zpadr_zam=stuff(zpadr_zam,57,78,lzam2)
zpadr_kor=stuff(space(132),1,54,lkor1)
zpadr_kor=stuff(zpadr_zam,55,78,lkor2)

set cursor off
s_kom("oK!")
inkey(0)
restore screen from ek
RETURN

FUNCTION B_KWESTIONARIUSZ()
local ek,lcolor:=setcolor(),lzam1:=substr(zpadr_zam,1,56)
local lzam2:=substr(zpadr_zam,57),lkor1:=substr(zpadr_kor,1,54)
local lkor2:=substr(zpadr_kor,55)
save screen to ek
set color to b/b
*set color to b/b,n/w
clear
set color to gr+/gr+
for i=0 to 24
  @ i,0 say "°"
  @ i,79 say "°"
next
@ 0,0 say replicate("°",80)
s_kom("oK!")
set color to w/gr+

@ 0,2 say "KWESTIONARIUSZ OSOBOWY"
set color to gr+/b
set cursor on
@ 2,1 say "Nazwisko.."
@ 2,12 get zpnazwisko
@ 2,37 say "Imi©.."
@ 2,43 get zpimie
@ 3,1 say "Nazwisko rodowe.."
@ 3,18 get zpnaz_rod
@ 3,43 say "Imi© matki.."
@ 3,55 get zpimie_m
@ 4,1 say "Imi© ojca.."
@ 4,12 get zpimie_o
@ 4,32 say "Nazwisko rodowe matki.."
@ 4,55 get zpnaz_m_rod
@ 5,1 say "Data i miejsce urodzenia.."
@ 5,27 get zpurodz
@ 6,1 say "Obywatelstwo.."
@ 6,15 get zpobywat
@ 6,35 say "PESEL.."
@ 6,42 get zppesel
@ 6,58 say "NIP.."
@ 6,63 get zpnip
@ 7,1 say "Miejsce zameldowania.."
@ 7,23 get lzam1
@ 8,1 get lzam2
@ 9,1 say "Adres korespondencyjny.."
@ 9,25 get lkor1
@ 10,1 get lkor2
@ 11,1 say "Tel..."
@ 11,7 get zptel
@ 11,50 say "Kasa chorych.."
@ 11,64 get zpkasa
read
zpadr_zam=stuff(space(134),1,56,lzam1)
zpadr_zam=stuff(zpadr_zam,57,78,lzam2)
zpadr_kor=stuff(space(132),1,54,lkor1)
zpadr_kor=stuff(zpadr_zam,55,78,lkor2)

set cursor off
s_kom("oK!")
inkey(0)
restore screen from ek
RETURN

FUNCTION KWESTIONARIUSZ()
local ek,lcolor:=setcolor(),lzam1:=substr(zpadr_zam,1,56)
local lzam2:=substr(zpadr_zam,57),lkor1:=substr(zpadr_kor,1,54)
local lkor2:=substr(zpadr_kor,55)
local lzatrud1:=substr(zpzatrud,1,40),lzatrud2:=substr(zpzatrud,41)
local lstan1:=substr(zpstan,1,64),lstan2:=substr(zpstan,65)
local losob1:=substr(zposob,1,31),losob2:=substr(zposob,32)
save screen to ek
set color to b/b
*set color to b/b,n/w
clear
set color to gr+/gr+
for i=0 to 24
  @ i,0 say "°"
  @ i,79 say "°"
next
@ 0,0 say replicate("°",80)
s_kom("oK!")
set color to w/gr+

@ 0,2 say "KWESTIONARIUSZ OSOBOWY"
set color to gr+/b
set cursor on
@ 1,1 say "Nazwisko.."
@ 1,12 get zpnazwisko
@ 1,37 say "Imi©.."
@ 1,43 get zpimie
@ 2,1 say "Nazwisko rodowe.."
@ 2,18 get zpnaz_rod
@ 2,43 say "Imi© matki.."
@ 2,55 get zpimie_m
@ 3,1 say "Imi© ojca.."
@ 3,12 get zpimie_o
@ 3,32 say "Nazwisko rodowe matki.."
@ 3,55 get zpnaz_m_rod
@ 4,1 say "Data i miejsce urodzenia.."
@ 4,27 get zpurodz
@ 5,1 say "Obywatelstwo.."
@ 5,15 get zpobywat
@ 5,35 say "PESEL.."
@ 5,42 get zppesel
@ 5,58 say "NIP.."
@ 5,63 get zpnip
@ 6,1 say "Miejsce zameldowania.."
@ 6,23 get lzam1
@ 7,1 get lzam2
@ 8,1 say "Adres korespondencyjny.."
@ 8,25 get lkor1
@ 9,1 get lkor2
@ 10,1 say "Tel..."
@ 10,7 get zptel
@ 10,50 say "Kasa chorych.."
@ 10,64 get zpkasa
@ 11,1 say "Wyksztaˆcenie.."
@ 11,16 get zpwykszt
@ 12,1 say "Wyksztaˆcenie uzupeˆniaj¥ce.."
@ 12,30 get zpuzup
@ 13,1 say "Przebieg dotychczsowego zatrudnienia.."
@ 13,39 get lzatrud1
@ 14,1 get lzatrud2
@ 15,1 say "Dodatkowe uprawnienia.."
@ 15,24 get zpupraw
@ 16,1 say "Stan rodziny.."
@ 16,15 get lstan1
@ 17,1 get lstan2
@ 18,1 say "Stosunek do powszechnego obowi¥zku obrony.."
@ 18,44 get zpstos
@ 19,1 say "Osoba,kt¢r¥ nale¾y zawiadomi† w razie wypadku.."
@ 19,48 get losob1
@ 20,1 get losob2
@ 21,1 say "Dow¢d osobisty: Seria.."
@ 21,24 get zpseria
@ 21,31 say "Numer.."
@ 21,38 get zpnumdow
@ 22,1 say "Wydany przez.."
@ 22,15 get zpprzez
@ 22,50 say "w.."
@ 22,53 get zpw
@ 23,1 say "Inny dow¢d to¾samo˜ci.."
@ 23,24 get zpinny
read
zpadr_zam=stuff(space(134),1,56,lzam1)
zpadr_zam=stuff(zpadr_zam,57,78,lzam2)
zpadr_kor=stuff(space(132),1,54,lkor1)
zpadr_kor=stuff(zpadr_kor,55,78,lkor2)
zpzatrud=stuff(space(118),1,40,lzatrud1)
zpzatrud=stuff(zpzatrud,41,78,lzatrud2)
zpstan=stuff(space(142),1,64,lstan1)
zpstan=stuff(zpstan,65,78,lstan2)
zposob=stuff(space(109),1,31,losob1)
zposob=stuff(zposob,32,78,losob2)

set cursor off
s_kom("oK!")
inkey(0)
restore screen from ek
RETURN

FUNCTION PRAC_PUBLIC()
public zpnazwisko:=space(20),zpimie:=space(15),zpnaz_rod:=space(20)
public zpimie_m:=space(15),zpimie_o:=space(15),zpnaz_m_rod:=space(20)
public zpurodz:=space(52),zpobywat:=space(15),zppesel:=space(11)
public zpnip:=space(13),zpadr_zam:=space(134),zpadr_kor:=space(132)
public zptel:=space(38),zpkasa:=space(15),zpwykszt:=space(63)
public zpuzup:=space(49),zpzatrud:=space(118),zpupraw:=space(55)
public zpstan:=space(142),zpstos:=space(35),zposob:=space(109)
public zpseria:=space(2),zpnumdow:=space(7),zpprzez:=space(30),zpw:=space(26)
public zpinny:=space(55)
RETURN


******************************************************************************
* Obsˆuga magazynu dla uproszczonej wersji produkcji
******************************************************************************
FUNCTION PRODOLD_MAG1(ptil)
local select:=select(),recno:=recno(),ek,recno1,ltil:=ptil
*save screen to ek
wyrob_use(1)
set order to 2
sklad_use(1)
select &wyrob_sel
set filter to .not.norm_anul
go top
seek ztmindex           && sprawdzam, czy sprzedawana pozycja jest wyrobem
if found()
  recno1=recno()        && je˜li tak, to szukam normatywu gˆ¢wnego, je˜li nie 
                        *  zostaˆ zaznaczony, to jako gˆ¢wny przyjmuj©
						*  zdefiniowany najwcze˜niej 
  do while wyr_num=ztmindex
    if g_znak="*"
	  recno1=recno()
	  exit
	endif
	skip
  enddo
  go recno1            && wybraˆem receptur© aktywn¥
  zwyr_lad()
  select &sklad_sel
  set filter to snorm_num=znorm_num   && wydzieliˆem skˆadniki wyrobu
  go top
  do while .not.eof()
    zsklad_lad()
	select &gmag_sel
	seek zsklad_num
	if found()
			  if reclock(5)      
	            replace mil with mil-ltil*zsklad_il
		        unlock
	            lzapisano=.t.
			  else
	            lzapisano=.f.
	          endif		
	else
      kj_tkom(8," Uwaga! ","Skˆadnik "+ zsklad_naz + "  " +zsklad_kod,"nie odnaleziona w magazynie.","Dotyczy wyrobu "+zwyr_naz+"  "+zwyr_kod,5)      	
	endif
    select &sklad_sel	
	skip
  enddo
  close
  select &wyrob_sel
  close
  select &gmag_sel
else
  select &gmag_sel
			  if reclock(5)      
	            replace mil with mil-ltil
		        unlock
	            lzapisano=.t.
			  else
	            lzapisano=.f.
	          endif	
endif

RETURN lzapisano


****************************PUBLIC
FUNCTION WZOR_PUBLIC()
public zwwzor_typ:=" ",zwnew_typ:=" ",zwmozliwe:=space(20),zwkontrah:=.f.
public zwkormag:=.f.,zwster:=space(3)
RETURN

FUNCTION TABLEXP_PUBLIC()
public zxnadawca:=0,zxodbiorca:=0,zxodbiortyp:="",zxdokex_typ:=""
public zxks_jako:="",zxster:=space(3),zxmagnum:=1
*dotyczy tablicy tabl_imp
public zinadawca:=0,zimoj_ident:=0,ister:=space(3)
RETURN

FUNCTION DOKEXP_PUBLIC()
public zeod_kogo:=0,zedla_kogo:=0,zenr_dok:=space(15),zedat_dok:=ctod("")
public zeks_jako:=space(3),zezaksiegow:=.f.,zeilosc:=0,zecena:=0,zester:=space(10)
public zefir_naz:=space(15),zemagnum:=1
RETURN

FUNCTION KS_PUBLIC()
public zuerok:=0
public zksndow:=space(15),zksndok:=space(15),zksdatdow:=date()
public zksdatdok:=date(),zkstermin:=ctod(""),zksniedop:=0
public zkssposzap:="G",zksakwizyt:=0,zksdatsp:=ctod("")
public zksdatzal:=ctod(""),zksdatsad:=ctod(""),zksdatgran:=ctod("")
public zksster:=space(10),zkswalut:=space(3),zkskurs:=1,zksanul:=.f.
public zksopis1:=space(50),zksopis2:=space(50),zksopis3:=space(50)
public zksopis4:=space(50),zksopis5:=space(50),zksopis6:=space(50)
public zksuwag:=space(30),zkspoz:=0,zksknum:=0,zksnaz1:=space(30),zksnaz2:=space(30)
public zksmiasto:=space(30),zksulica:=space(30),zksnip:=space(13)
public zksopis:=space(30),zksrubryka:=0,zkspodlega:=.t.
public zkszapis:="A",zksdotycz:="A",zksnetto:=.t.
public zksryczalt:=0,zksexport:=.f.,zksdekret:=space(10)
public zks_a:=0,zks_b:=0,zks_c:=0,zks_d:=0,zks_e:=0,zks_f:=0,zks_z:=0
public zksvat_a:=0,zksvat_b:=0,zksvat_c:=0,zksvat_d:=0,zksvat_e:=0
public zksvat_f:=0,zksvat_z:=0
public zkssadnum:=space(30),zksnbpnum:=space(30),zkswaluta:=space(10)
public zksprzelicz:=1
public zks_kwoty:="NETTO",zksnet_all:=0,zksvat_all:=0,zksbrut_all:=0

public zksAnet1_sum:=0,zksAvat1_sum:=0,zksAbr1_sum:=0
public zksAnet2_sum:=0,zksAvat2_sum:=0,zksAbr2_sum:=0
public zksBnet1_sum:=0,zksBvat1_sum:=0,zksBbr1_sum:=0
public zksBnet2_sum:=0,zksBvat2_sum:=0,zksBbr2_sum:=0
public zksCnet1_sum:=0,zksCvat1_sum:=0,zksCbr1_sum:=0
public zksCnet2_sum:=0,zksCvat2_sum:=0,zksCbr2_sum:=0


public zksAnet1_a_sum:=0,zksAnet1_b_sum:=0,zksAnet1_c_sum:=0,zksAnet1_d_sum:=0
public zksAnet1_e_sum:=0,zksAnet1_f_sum:=0,zksAnet1_z_sum:=0
public zksAvat1_a_sum:=0,zksAvat1_b_sum:=0,zksAvat1_c_sum:=0,zksAvat1_d_sum:=0
public zksAvat1_e_sum:=0,zksAvat1_f_sum:=0,zksAvat1_z_sum:=0
public zksAbr1_a_sum:=0,zksAbr1_b_sum:=0,zksAbr1_c_sum:=0,zksAbr1_d_sum:=0
public zksAbr1_e_sum:=0,zksAbr1_f_sum:=0,zksAbr1_z_sum:=0
public zksAnet_export:=0

public zksAnet2_a_sum:=0,zksAnet2_b_sum:=0,zksAnet2_c_sum:=0,zksAnet2_d_sum:=0
public zksAnet2_e_sum:=0,zksAnet2_f_sum:=0,zksAnet2_z_sum:=0
public zksAvat2_a_sum:=0,zksAvat2_b_sum:=0,zksAvat2_c_sum:=0,zksAvat2_d_sum:=0
public zksAvat2_e_sum:=0,zksAvat2_f_sum:=0,zksAvat2_z_sum:=0
public zksAbr2_a_sum:=0,zksAbr2_b_sum:=0,zksAbr2_c_sum:=0,zksAbr2_d_sum:=0
public zksAbr2_e_sum:=0,zksAbr2_f_sum:=0,zksAbr2_z_sum:=0
public zksAtrwaly:=0,zksAvattrwaly:=0
*B
public zksBnet1_a_sum:=0,zksBnet1_b_sum:=0,zksBnet1_c_sum:=0,zksBnet1_d_sum:=0
public zksBnet1_e_sum:=0,zksBnet1_f_sum:=0,zksBnet1_z_sum:=0
public zksBvat1_a_sum:=0,zksBvat1_b_sum:=0,zksBvat1_c_sum:=0,zksBvat1_d_sum:=0
public zksBvat1_e_sum:=0,zksBvat1_f_sum:=0,zksBvat1_z_sum:=0
public zksBbr1_a_sum:=0,zksBbr1_b_sum:=0,zksBbr1_c_sum:=0,zksBbr1_d_sum:=0
public zksBbr1_e_sum:=0,zksBbr1_f_sum:=0,zksBbr1_z_sum:=0
public zksBnet_export:=0

public zksBnet2_a_sum:=0,zksBnet2_b_sum:=0,zksBnet2_c_sum:=0,zksBnet2_d_sum:=0
public zksBnet2_e_sum:=0,zksBnet2_f_sum:=0,zksBnet2_z_sum:=0
public zksBvat2_a_sum:=0,zksBvat2_b_sum:=0,zksBvat2_c_sum:=0,zksBvat2_d_sum:=0
public zksBvat2_e_sum:=0,zksBvat2_f_sum:=0,zksBvat2_z_sum:=0
public zksBbr2_a_sum:=0,zksBbr2_b_sum:=0,zksBbr2_c_sum:=0,zksBbr2_d_sum:=0
public zksBbr2_e_sum:=0,zksBbr2_f_sum:=0,zksBbr2_z_sum:=0
public zksBtrwaly:=0,zksBvattrwaly:=0

public zksCnet1_a_sum:=0,zksCnet1_b_sum:=0,zksCnet1_c_sum:=0,zksCnet1_d_sum:=0
public zksCnet1_e_sum:=0,zksCnet1_f_sum:=0,zksCnet1_z_sum:=0
public zksCvat1_a_sum:=0,zksCvat1_b_sum:=0,zksCvat1_c_sum:=0,zksCvat1_d_sum:=0
public zksCvat1_e_sum:=0,zksCvat1_f_sum:=0,zksCvat1_z_sum:=0
public zksCbr1_a_sum:=0,zksCbr1_b_sum:=0,zksCbr1_c_sum:=0,zksCbr1_d_sum:=0
public zksCbr1_e_sum:=0,zksCbr1_f_sum:=0,zksCbr1_z_sum:=0
public zksCnet_export:=0

public zksCnet2_a_sum:=0,zksCnet2_b_sum:=0,zksCnet2_c_sum:=0,zksCnet2_d_sum:=0
public zksCnet2_e_sum:=0,zksCnet2_f_sum:=0,zksCnet2_z_sum:=0
public zksCvat2_a_sum:=0,zksCvat2_b_sum:=0,zksCvat2_c_sum:=0,zksCvat2_d_sum:=0
public zksCvat2_e_sum:=0,zksCvat2_f_sum:=0,zksCvat2_z_sum:=0
public zksCbr2_a_sum:=0,zksCbr2_b_sum:=0,zksCbr2_c_sum:=0,zksCbr2_d_sum:=0
public zksCbr2_e_sum:=0,zksCbr2_f_sum:=0,zksCbr2_z_sum:=0
public zksCtrwaly:=0,zksCvattrwaly:=0

public zksnet_a:=0,zksnet_b:=0,zksnet_c:=0,zksnet_d:=0
public zksnet_e:=0,zksnet_f:=0,zksnet_z:=0
public zksvat_a:=0,zksvat_b:=0,zksvat_c:=0,zksvat_d:=0
public zksvat_e:=0,zksvat_f:=0,zksvat_z:=0
public zksbrut_a:=0,zksbrut_b:=0,zksbrut_c:=0,zksbrut_d:=0
public zksbrut_e:=0,zksbrut_f:=0,zksbrut_z:=0

public zksAniepodlega_sum:=0,zksBniepodlega_sum:=0,zksCniepodlega_sum:=0
public zksstawkavat:=0,zdewiz_kwot:=0
public zrstopa1:=0,zrstopa2:=0,zrstopa3:=0,zrdolicz1:=0
public zrdolicz2:=0,zrdolicz3:=0,zrprog2:=0,zrprog3:=0
public zksrycz_a:=0,zksrycz_b:=0,zksrycz_c:=0

public zksfirnaz:=space(30),zksfiradres:=space(30),zksfirnip:=space(13)
public zksfirnum:=1

public zksrubr_7:=0,zksrubr_8:=0,zksrubr_10:=0,zksrubr_11:=0
public zksrubr_12:=0,zksrubr_13:=0,zksrubr_14:=0,zksrubr_18:=0
public zksvat_7:=0,zksvat_8:=0,zksvat_10:=0,zksvat_11:=0
public zksvat_12:=0,zksvat_13:=0,zksvat_14:=0,zksvat_18:=0
public zksrubr_export:=0
public sumrycz_a:=0,sumrycz_b:=0,sumrycz_c:=0

public zksudz_a:=0,zksudz_b:=0,zksudz_c:=0,zksudz_d:=0,zksudz_e:=0
public zksudz_f:=0, zksudz_z:=0
public ztylko_kon:=.f.

public zfirnum:=1,zfirnaz:=space(15),zfirmiasto:=space(15)
public zfirulica:=space(15),zfirznak:=space(2)

public ziledok_07:=0,ziledok_08:=0,ziledok_10:=0,ziledok_11:=0
public ziledok_12:=0,ziledok_13:=0,ziledok_14:=0,ziledok_18:=0

public zw_Anet_trwale:=0,zw_Avat_trwale:=0, zw_Anet_pozos:=0,zw_Avat_pozos:=0
public zw_Bnet_trwale:=0,zw_Bvat_trwale:=0, zw_Bnet_pozos:=0,zw_Bvat_pozos:=0
public zw_Cnet_trwale:=0,zw_Cvat_trwale:=0, zw_Cnet_pozos:=0,zw_Cvat_pozos:=0

RETURN





FUNCTION ARCHIW_PUBLIC()
public zarch_poz:=0,zarch_naz:=space(15),zarch_opis:=space(80)
public zadok_path:=space(50), zamag_path:=space(50), zakon_path:=space(50)
public zarch_wid:=.t.,zakas_path:=space(50)
RETURN 


FUNCTION ZLEG_SH_PUBLIC()
public zlic1:=space(50),zlic2:=space(50),zlic3:=space(6)
public zlic4:=space(50),zlic5:=space(50),zlic6:=space(13)
public zlic0:=space(15)
public zleg_kod:=space(5),zlz1:=.f.,zlz2:=.f.,zlz3:=.f.,zl123:=.f.
public zlkod:=0,zldat:=date(),zld:=14
public zlic_regon:=space(10),zlic_pesel:=space(11),zlic_konto:=space(60)
public zlic_tel:=space(15),zlic_fax:=space(15)
RETURN nil


FUNCTION ZSET_PUBLIC()
*sekcja common_s
public zvat:=.f.,zvat_a:=0,zvat_b:=0,zvat_c:=0,zvat_d:=0,zvat_e:=0,zvat_f:=0
public zvat_g:=0,zvat_z:=0,zd_fis:=.f.,zk_fis:=.f.
public zmarza_op:=.f.,zm_kodpowt:=.f.,zminus_mag:=.f.
public zwmag_op:=0,zmagaz_op:=0,zgrupa_op:=0,zdekret_op:=.f.
public zpolznak:="L",kormag_gr:="",sprzedaz_gr:="",zakup_gr:="",dok_brut_gr:=""
public dok_net_gr:="",defin_gr:="",bezkontrah_gr:="",przes_gr:="",przerob_gr:=""
public stopabezvat_gr:="",opis1_gr:="",zkordok_znak:="",zkordok_symbol:=""
public kasa_glowna:=.f.,defnum_gr:="",dowod_gr:="",cenaew_typ:="S"
public fiskal_gr:="",kasa_fiskalna:=.f.,druk_fiskalna:=.f.
public odebral_podpis_gr

*sekcja local_set
public zd_serwer:="",zm_serwer:="",zk_serwer:=""
public zp_serwer:="",zzak_serwer:=""
public zdnum_serwer:="",zset_serwer:=""
public zhaslo_l:=.f.,zhaslo_d:=.f.,zwielomag:=.f.,zwmagil:=1
public zm_za_brut:=.f.,zdok_filtr:=.t.,zmarz_online:=.f.,zanul_up:=.t.
public zpopraw_up:=.f.,krabat_up:=.f.,drabat_up:=.f.,edit:="edit"
public lpt2_gr:="",lpt3_gr:="",lpt4_gr:="",lpt5_gr:=""

*sekcja param_set
public zopoznienie:=14,zpapier_typ:=0,zstrona_dl:=57,zd_siec:=.f.,zsiec:=.f.
public zmjm_def:=space(3),zm_sp_brut:=.f.,zd_szukaj:="1",zmiasto:=""
public fis_com:=1016,op_platnosc_txt:=.f.,op_txt1:=space(30),op_txt2:=space(30)
public op_txt3:=space(30),op_txt4:=space(30),op_txt5:=space(30)
public op_txt6:=space(30),zdokanul_pokaz:=1,zwaluta_def:=space(10)
public zdwaluta_def:=space(3),op_txt10:=space(80),dfis_druk:="DF-2"
public opisd_1:=space(60),opisd_2:=space(60),opisd_3:=space(60)
public opisd_4:=space(60),opisd_5:=space(60),opisd_6:=space(60)
RETURN

*******************************************************************************
* Nadanie wartosci poczatkowych zmiennym z pliku dokument                     *
*******************************************************************************
FUNCTION PUBLIC_DOK()
public zdgrup:=space(1)
public zdtyp:=space(1)
public zdznak:=space(1)
*public zdidentyfik:=space(2)
public zdsymbol:=space(2)
public zdndow:=space(15)
public zdndok:=space(15)
public zdnzam:=space(15)
public zddatdow:=date()
public zddatdok:=date()
public zdtermin:=ctod("")
public zdkordat:=ctod("")
public zdkordok:=space(15)
public zdkontrah:=0
public zdnskrot:=space(15)
public zdniedop:=0
public zdsposzap:=def_sposzap
public zdrabat:=0
public zdkonto:=def_dkonto 
public zdg_magazyn:=space(3)
public zdp_magazyn:=space(3)
public zdkormag_ok:=.f.
public zdwystawil:=space(30)
public zdodebral:=space(30)
public zdakwizytor:=0
public zdksiegowy:=.f.
public zddatsp:=date()
public zddatzal:=date()
public zddatsad:=ctod("")
public zddatgranic:=ctod("")
public zdster:=space(3)
public zd1_lamany:=space(3) 
public zdwaluta:=space(3)
public zdkurs:=1
public zdanul:=.f.
public zdopis1:=space(80)
public zdopis2:=space(80)
public zdopis3:=space(80)
public zdpom:=space(30)
*import_eksport
public zsad_numer:=space(30)
public zkursnbp_numer:=space(30)
public zwaluta:=space(10)
public zprzelicznik:=1
*
**
public zdnumer_zam:=space(15)
RETURN nil

*******************************************************************************
* Nadanie wartosci poczatkowych zmiennym wykorzystywanym do obliczen          *
* wartosci plikow typu towbuf.dbf                                             *
*******************************************************************************
FUNCTION PUBLIC_TPLIK()
public ztnet_a:=0,ztnet_b:=0,ztnet_c:=0,ztnet_d:=0,ztnet_e:=0,ztnet_f:=0,ztnet_z:=0
public ztvat_a:=0,ztvat_b:=0,ztvat_c:=0,ztvat_d:=0,ztvat_e:=0,ztvat_f:=0,ztvat_z:=0
public ztbrut_a:=0,ztbrut_b:=0,ztbrut_c:=0,ztbrut_d:=0,ztbrut_e:=0,ztbrut_f:=0
public ztnet_all:=0,ztvat_all:=0,ztbrut_all:=0,ztvat_z:=0,ztbrut_z:=0
RETURN nil

FUNCTION PUBLIC_RAP()
public zrnet_a:=0,zrnet_b:=0,zrnet_c:=0,zrnet_d:=0,zrnet_e:=0,zrnet_f:=0,zrnet_z:=0
public zrvat_a:=0,zrvat_b:=0,zrvat_c:=0,zrvat_d:=0,zrvat_e:=0,zrvat_f:=0,zrvat_z:=0
public zrbrut_a:=0,zrbrut_b:=0,zrbrut_c:=0,zrbrut_d:=0,zrbrut_e:=0,zrbrut_f:=0
public zrnet_all:=0,zrvat_all:=0,zrbrut_all:=0,zrvat_z:=0,zrbrut_z:=0
RETURN nil

FUNCTION PUBLIC_SRAP()
public zsnet_a:=0,zsnet_b:=0,zsnet_c:=0,zsnet_d:=0,zsnet_e:=0,zsnet_f:=0,zsnet_z:=0
public zsvat_a:=0,zsvat_b:=0,zsvat_c:=0,zsvat_d:=0,zsvat_e:=0,zsvat_f:=0,zsvat_z:=0
public zsbrut_a:=0,zsbrut_b:=0,zsbrut_c:=0,zsbrut_d:=0,zsbrut_e:=0,zsbrut_f:=0
public zsnet_all:=0,zsvat_all:=0,zsbrut_all:=0,zsvat_z:=0,zsbrut_z:=0
RETURN nil

*******************************************************************************
* Nadanie wartosci poczatkowych zmiennym z pliku sprzedaz                     *
*******************************************************************************
FUNCTION PUBLIC_TOW()
public ztndow:=space(15)
public ztnaz:=space(32)
public ztkod:=space(7)
public ztnum:=0
public ztmindex:=0
public ztdatdow:=date()
public ztkormag:=.t.
public ztil:=0
public ztjm:=space(3)
public ztcen:=0
public ztcen_ew:=0
public ztcen_dewiz:=0
public ztstawka:=def_stawka
public ztsymbol:=space(15)
public ztzwolniony:=.f.
public ztwyroznik:=space(1)
public ztwykonal:=.f.
public ztster:=space(3)
public ztmagaz:=space(1)
public ztgrup:=space(3)
public ztdekret:=space(10)
public ztpasek:=space(13)
public ztnorm_num:=0
public ztil_dost:=0
public ztanul:=.f.
if z2kod
  ztkod:=space(14)  
endif
RETURN nil

FUNCTION DOK_DEF_PUBLIC()
public zdokdef_recno:=recno()
public zgrupa_dok:=space(1)
public ztyp_dok:=space(1)
public zznak_dok:=space(1)
public zznak_dow:=space(1)
public znaz_dok:=space(10)
public ztyt_dok:=space(30)
public zlaman_dok:=space(3)
public zmagaz_dok:=space(2)	
public zmg_dok:=space(3)
public zmp_dok:=space(3)
public zwalut_dok:=space(3)
public zopis_dok:=space(80)
public zopis1_dok:=space(80)
public zopis2_dok:=space(80)
public zopis3_dok:=space(80)
*public identyfik:=space(2)
public zsymbol_dok:=space(2)
public zukryj:=.f.
RETURN nil

FUNCTION XDOK_DEF_PUBLIC()
public xdokdef_recno:=recno()
public xgrupa_dok:=space(1)
public xtyp_dok:=space(1)
public xznak_dok:=space(1)
public xznak_dow:=space(1)
public xnaz_dok:=space(10)
public xtyt_dok:=space(30)
public xlaman_dok:=space(3)
public xmagaz_dok:=space(2)	
public xmg_dok:=space(3)
public xmp_dok:=space(3)
public xwalut_dok:=space(3)
public xopis_dok:=space(80)
public xopis1_dok:=space(80)
public xopis2_dok:=space(80)
public xopis3_dok:=space(80)
*public identyfik:=space(2)
public xsymbol_dok:=space(2)
public xukryj:=.f.
RETURN nil


FUNCTION AKWIZYT_PUBLIC()
public zakw_skrot:=space(18),zakw_naz1:=space(30),zakw_naz2:=space(30)
public zakw_ulica:=space(30),zakw_kod:=space(6),zakw_miasto:=space(30)
public zakw_prowiz:=0,zakw_ster:=space(5),zakw_num:=0,zakw_ukryj:=.f.
public zakw_tel:=space(30),zakw_mail:=space(30)
RETURN

FUNCTION AKWIZYT_ZER()
zakw_skrot=space(18)
zakw_naz1=space(30)
zakw_naz2=space(30)
zakw_ulica=space(30)
zakw_kod=space(6)
zakw_miasto=space(30)
zakw_prowiz=0
zakw_ster=space(5)
zakw_num=0
zakw_ukryj=.f.
zakw_tel=space(30)
zakw_mail=space(30)
RETURN

FUNCTION AKWIZYT_LAD()
zakw_skrot=akw_skrot
zakw_naz1=akw_naz1
zakw_naz2=akw_naz2
zakw_ulica=akw_ulica
zakw_kod=akw_kod
zakw_miasto=akw_miasto
zakw_prowiz=akw_prowiz
zakw_ster=akw_ster
zakw_num=akw_num
zakw_ukryj=akw_ukryj
zakw_tel=akw_tel
zakw_mail=akw_mail
RETURN

FUNCTION AKWIZYT_REPLAC()
replace akw_skrot with zakw_skrot
replace akw_naz1 with zakw_naz1
replace akw_naz2 with zakw_naz2
replace akw_ulica with zakw_ulica
replace akw_kod with zakw_kod
replace akw_miasto with zakw_miasto
replace akw_prowiz with zakw_prowiz
replace akw_ster with zakw_ster
replace akw_num with zakw_num
replace akw_ukryj with zakw_ukryj
replace akw_tel with zakw_tel
replace akw_mail with zakw_mail
RETURN


FUNCTION FIFO_PUBLIC()
public zcindex:=0,zczakdat:=date(),zcil:=0,zccena:=0,zcwaluta:=space(3)
public zckurs:=1,zckursdat:=date(),zckoszt:=0,zcndow:=space(15)
public zckontrah:=0,zcster:=space(5),zcanul:=.f.
RETURN

FUNCTION FIFO_ZER()
zcindex=0
zczakdat=date()
zcil=0
zccena=0
zcwaluta=space(3)
zckurs=1
zckursdat=date()
zckoszt=0
zcndow=space(15)
zckontrah=0
zcster=space(5)
zcanul=.f.
RETURN

FUNCTION FIFO_LAD()
zcindex=cindex
zczakdat=czakdat
zcil=cil
zccena=ccena
zcwaluta=cwaluta
zckurs=ckurs
zckursdat=ckursdat
zckoszt=ckoszt
zcndow=cndow
zckontrah=ckontrah
zcster=cster
zcanul=canul
RETURN

FUNCTION FIFO_REPLAC()
replace cindex with zcindex
replace czakdat with zczakdat
replace cil with zcil
replace ccena with zccena
replace cwaluta with zcwaluta
replace ckurs with zckurs
replace ckursdat with zckursdat
replace ckoszt with zckoszt
replace cndow with zcndow
replace ckontrah with zckontrah
replace cster with zcster
replace canul with zcanul
RETURN



FUNCTION FIFO_TOW_PUBLIC()
public zeindex:=0,zeil:=0,zecena_zak:=0,zedat_zak:=date()
public zendow:=space(15),zendow_zak:=space(15),zekon_zak:=0
public zester:=space(5),zeanul:=.f.
RETURN

FUNCTION FIFO_TOW_ZER()
zeindex=0
zeil=0
zecena_zak=0
zendow=space(15)
zendow_zak=space(15)
zester=space(5)
zeanul=.f.
zedat_zak:=date()
zekon_zak:=0
RETURN

FUNCTION FIFO_TOW_LAD()
zeindex=eindex
zeil=eil
zecena_zak=ecena_zak
zendow=endow
zendow_zak=endow_zak
zedat_zak=edat_zak
zekon_zak=ekon_zak
zester=ester
zeanul=eanul
RETURN

FUNCTION FIFO_TOW_REPLAC()
replace eindex with zeindex
replace eil with zeil
replace ecena_zak with zecena_zak
replace endow with zendow
replace endow_zak with zendow_zak
replace edat_zak with zedat_zak
replace ekon_zak with zekon_zak
replace ester with zester
replace eanul with zeanul
RETURN


FUNCTION KOD_PISZ()
local lselect:=select()
select &sh_sel
set default to shset
use kody
browse()
replace data with date()
close
select &lselect
RETURN