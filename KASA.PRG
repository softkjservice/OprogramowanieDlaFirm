FUNCTION NOWY_KASA_DOK(pkontrah,pdok,pautomat)
local ek,ltyt:=substr(zopis_dok,1,80),lpoz:=1,ltryb:=1
local lknaz1:="",ldtyp:=zdtyp,ldgrup:=zdgrup,ldndow:=zdndow
*dokdef(1)
zdpom:="Got¢wka"
zdgrup:=5
za_dokument=pdok
if pdok
  ztcen=zdniedop
  ztnaz="Za dokument                     "
  ztnaz=stuff(ztnaz,14,15,zdndok)
  zdnzam=zdndow
  zdkordok=zdndok
endif
save screen to ek

do while.t.
  
  zdndow=space(15)
  z_zdok_def_lad()

  kasa_tlo()

  if.not.lpoz=5.and.pkontrah
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
  okno=.t.
  k_dop_tlo()
  k_say()

  dokkasa()
  if lastkey()=27.and..not.pautomat
    exit
  endif
 * wystawil(.f.)
  buf_use()
  go top
  tplik_sum(".not.eof()")
  zkwota=ztbrut_all
  set color to  
  @ 0,0 say space(80)
  if pkontrah.or..not.pdok
    lpoz=rozlicz_menu(0,0,lpoz)
  else
*	if.not.lastkey()=27

	  zap_dok(.f.)
	  vdok_plik=.f.
	  select &buf_sel	 
	  if pdok
        if kj_gkom(12,"","Drukowa†  ? ","",.t.,5) 
		  dok_druk(vdok_plik,.t.)	  
		endif	    
	  else
	    dok_druk(vdok_plik,.t.)	  
	  endif	
	  exit    
*	endif  
  endif	
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
      ltryb=2
    case lpoz=5
	  zap_dok(.f.)	  
    case lpoz=6
      ltryb=2	  
    case lpoz=7
      exit	  	  
  endcase
  close_all("SH")
enddo
close_all("SH")
restore screen from ek
zdtyp=ldtyp
zdgrup=ldgrup
zdndow=ldndow
*dokdef(0)
RETURN 

FUNCTION KASA_DRUK(pilosc)
local lilosc:=1
w=prow()
k=0

do while.t.
  kas_dr()
  lilosc=lilosc+1
  if lilosc>pilosc
    exit
  endif
enddo
RETURN

FUNCTION KAS_DR()
local lkol,llic4,ltyt,len
local loryginal:="oryginaˆ",lkop:=1
w=prow()
*k=0
k=zkas_kol
@ w,k say &zdr_kond
do while.t.
  lkol=65-len(alltrim(zmiasto))-15
  @ w,lkol say alltrim(zmiasto)+"   "+dtoc(zddatdok)    
  if.not.empty(zlic1)
    w=w+1
    lkol=(65-len(alltrim(zlic1)))/2
    @ w,lkol say alltrim(zlic1)
  endif 
  if.not.empty(zlic2)
    w=w+1
    lkol=(65-len(alltrim(zlic2)))/2
    @ w,lkol say alltrim(zlic2)
  endif 
  if.not.empty(zlic5)
    w=w+1
    lkol=(65-len(alltrim(zlic5)))/2
    @ w,lkol say alltrim(zlic5)
  endif 
  *if.not.empty(zlic4)
  llic4=stuff(space(50),1,6,zlic3)
  llic4=stuff(llic4,9,42,substr(zlic4,1,42))
  w=w+1
  lkol=(65-len(alltrim(llic4)))/2
  @ w,lkol say alltrim(llic4)+&zdr_kkond+&zdr_grubo
  *endif 
  w=w+2
  len=len(alltrim(ztyt_dok))
  ltyt=stuff(space(40),1,len,alltrim(ztyt_dok))
  if zdsposzap="P"
    ltyt="Przelew "
  endif
  ltyt=stuff(ltyt,len+1,4," nr ")
  if zdsposzap="R"
    ltyt="Redukcja zadˆu¾enia /dok. "
	len=26
    ltyt=stuff(ltyt,len+1,4,"")
  endif  


  ltyt=stuff(ltyt,len+7,len(alltrim(zdndok)),alltrim(zdndok))
  lkol=(40-len(alltrim(ltyt)))/2
  @ w,lkol say ltyt+&zdr_kond+&zdr_kgrubo
  w=w+1
  do case
    case zpapier_typ=1
	  @ w,29 say loryginal
    case zpapier_typ=2
	  @ w,18 say "oryginaˆ biaˆy / kopia kolor"
  endcase
  w=w+1
  @ w,k say "Kontrahent:"
  w=w+1
  @ w,k+3 say zknaz1  
  w=w+1
  @ w,k+3 say zknaz2
  w=w+1
  @ w,k+3 say zkulica
  w=w+1
  @ w,k+3 say zkkod + "  "+zkmiasto
  w=w+1
  @ w,k say "Tytuˆem:  "+ztnaz
  w=w+1
  @ w,k say "Kwota:    "+alltrim(str(ztbrut_all,12,2))+" zˆ"
  w=w+1
		      do case
			    case zpolznak=" "
			      empty_slownie()
			    case zpolznak="L"
			      slownie()
			    case zpolznak="M"
			      maz_slownie()				  				  
			  endcase	  
  w=w+2
  @ w,k say "Powy¾sz¥ kwot© otrzymaˆem"
  w=w+4
  @ w,k say "..................................."			    
  w=w+1
  @ w,k say "             podpis                "
  w=w+1
  do case
    case  zdtyp$sprzedaz_gr
      @ w,k say "Wystawiaj¥cy: "+zdwystawil  
    case  zdtyp$zakup_gr
      @ w,k+5 say "Powy¾sz¥ kwot© otrzymaˆem"
  endcase  
  	
  

  if zpapier_typ=1.and.lkop<2
    loryginal="kopia"
	lkop=lkop+1
	w=w+5
    @ w,k say replicate("-",65)
	w=w+5
  else
    exit
  endif	

enddo
if.not.zpapier_typ=1.or.loryginal="kopia" 
  eject
endif  

RETURN





FUNCTION ROZLICZ_MENU(pw,pk,ppoz1)
local topis[7],ek
local lbelka:="° Drukuj ° Zapami©taj ° Nowy ° A_wz¢r ° B_wz¢r ° Popraw ° Zrezygnuj °"
local lliter:="  D        Z            N      A        B        P          Z          "
topis[1]:="Zapami©taj i wydrukuj dokument."
topis[2]:="Zapami©taj dokument bez drukowania."
topis[3]:="Zapami©taj bie¾¥cy dokument i utw¢rz nowy."
topis[4]:="Zapami©taj i utw¢rz nowy dokument na wz¢r poprzedniego."
topis[5]:="Zapami©taj i utw¢rz nowy dokument na wz¢r poprzedniego bez zmiany kontrahenta."
topis[6]:="Popraw aktualnie redagowany dokument."
topis[7]:="Anuluj ostatni dokument."
ppoz1=menu_poziom(pw,pk,7,lbelka,lliter,topis,ppoz1,.f.,.f.)
RETURN ppoz1






FUNCTION KASA_TLO()
local ltyt:=substr(zopis_dok,1,80)
*ks_tlo()
kj_okno(0,0,24,ltyt,2)
g_tlo()
RETURN


FUNCTION DOKKASA()
local ltcen:=0
ltnaz:=space(32)
  kas_tlo() 
  kas_get()
  ltcen=ztcen
  
  if ztcen<0
    ztcen=-1*ztcen
  endif	
  if buf_use()
    zap
	pack
	append blank
	replace tnaz with ztnaz, til with 1, tcen with ztcen
	close
  endif
  ztcen=ltcen
RETURN

FUNCTION KAS_TLO()
local ltyt:="                   D O K U M E N T                     "
set color to n/w,w/n
kj_okno(13,12,10,ltyt,2)
@ 15,15 say "Data ....."
@ 17,15 say "Warto˜† .."
@ 19,15 say "Opis ....."
RETURN

FUNCTION KAS_GET()
local lcolor:=setcolor(),select:=select(),ek
zddatdow=date()
zkas_przed=ztcen
set cursor on
set color to n/w,w/n
@ 15,25 get zddatdow when s_kom("Wpisz dat© wystawienia dokumentu")
@ 17,25 get ztcen picture "9999999.99" when s_kom("Wpisz warto˜† dokumentu w ni¾ej podanej walucie")
if.not.za_dokument
  @ 19,25 get ztnaz when s_kom("Opisz dokument kasowy")
else
  @ 19,25 say ztnaz 
endif  
if zdsposzap="P"
  zdndok=space(15)
  @ 21,15 say "Numer przelewu: "
  @ 21,32 get zdndok 
endif
if zdsposzap="R"
  zdndok=space(15)
  @ 21,15 say "Red. za dokument"
  @ 21,32 get zdndok 
endif
*if zdsposzap="K"
*  zdndok=space(15)
*  @ 21,15 say "Komp.za dokument"
*  @ 21,32 get zdndok 
*endif
read
if ztcen<0
  *ztcen=-1*ztcen
  do case
    case zdtyp=substr(kasa_gr,1,1)    &&sprzeda¾ czyli KP
      zdtyp=substr(kasa_gr,2,1)		 
    case zdtyp=substr(kasa_gr,2,1)    &&zakup czyli KW
      zdtyp=substr(kasa_gr,1,1)	
  endcase
	 if dokdef_use()	 
	   locate for typ_dok=zdtyp
	   if found()
         zdok_def_lad()	     
	   else
         kj_tkom(12," Uwaga !","  Wystapil blad.","Prawdopodobnie nie zostaˆ zdefiniowany dokument kasowy. ","Sprawd« plik DOK_DEF.DBF",5)  	     
	   endif
	   close
	 endif
     select &dok_sel	   
endif
zddatdok=zddatdow
if lastkey()=18
  slownik_kas()
  zdkordok=ztnaz
endif
set cursor off
setcolor(lcolor)
RETURN

FUNCTION SLOWNIK_KAS()
local lcolor:=setcolor(),select:=select(),t[1],q[1],ek
t[1]:="mnaz"
q[1]:=""
  save screen to ek
  dok_default()
  if file("magaz.dbf")
    select &kasopis_sel
	if kj_use("magaz",.f.,3)
	  kj_okno(11,44,12," O p i s    dokumentu kasowego      ",2)
	  dbedit(13,46,22,77,t,"K_FU1","",q,"ß",,"ß")
	  keyboard chr(205)
	  inkey(.1)
	  restore screen from ek
	  @ 19,25 say ztnaz
	  close
	endif
	select &select
  endif
RETURN

FUNCTION K_FU1()
local last:=lastkey(),lmnaz:=space(32)

do case
  case last=27
    return 0
  case last=13
    ztnaz=mnaz
	return 0
  case chr(last)$"Dd"
    set cursor on
	@ 23,46 get lmnaz when s_kom("Nowy opis")
	read
	if.not.lastkey()=27
      if kj_append(3)
	    replace mnaz with lmnaz
        unlock
	  endif	
	endif
	set cursor off
    keyboard chr(205)
	return 2
  case chr(last)$"Pp"
    set cursor on
	lmnaz=mnaz
	@ 23,46 get lmnaz when s_kom("Modyfikacja opisu")
	read
	if.not.lastkey()=27
      if reclock(5)      
	    replace mnaz with lmnaz
        unlock
	  endif	
	endif
	set cursor off	
    keyboard chr(205)
	return 2	
  case chr(last)$"Kk"
	lmnaz=mnaz
	@ 23,46 say lmnaz 
	if kj_gkom(12,"","Usun¥† ? ","",.t.,5) 
      if reclock(5)      
	    delete
        unlock
	  endif	
	endif
	set cursor off	
    keyboard chr(205)
	return 2		

endcase
s_kom("Dopisz   Popraw   Kasuj   [Enter]-zatwierd« wyb¢r    [Esc]-zrezygnuj")
RETURN 1

FUNCTION KAS_SAY()
local lcolor:=setcolor()
set cursor on
set color to n/w,w/n
@ 15,25 say zddatdow
@ 17,25 say ztcen
@ 19,25 say ztnaz
setcolor(lcolor)
RETURN


FUNCTION POPRAW_KASA_DOK()
local recno:=recno(),ek,lselect,ldtyp,lkj_kasa
save screen to ek
za_dokument=.f.
vksiega=.t.
k_w=2
k_k=12
zdok_lad()
kj_dok_say(.f.)
zkwota=ztbrut_all
kasa_tlo()
k_dop_tlo()
kas_tlo() 
k_say()
*kas_get()
dokkasa()
if.not.lastkey()=27
  if.not.lastkey()=3
    *wystawil(.f.)
    if kj_gkom(12,"","Czy chcesz poprawi† dane kontrahenta ? ","",.t.,5) 
      kontrah(zk_serwer,.t.,zknaz1,1,.T.,1)
    endif	
  endif

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
*  select &kasa_sel
  if kj_use("dokum",.f.,3)
    set index to dok_ident,dok_num,dow_num
	go recno
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
** Odnotowanie zmian w dokumencie rozliczanym
kasdok_dok(.t.)

**
***
  dok_default()
  if kj_use("dokum",.f.,3)
    set index to dok_ident,dok_num,dow_num
              if zdok_filtr
				set filter to alltrim(dsymbol)==alltrim(zdsymbol)
                go top
				go recno
              else
                seek zdsymbol
              endif  	
  endif  
***
else
  dok_default()
  select &dok_sel
*  select &kasa_sel
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
endif
keyboard chr(205)
set cursor off
restore screen from ek
RETURN	  
	  
	  
FUNCTION KASA_PREZENT(ptryb)
local ek
save screen to ek
vksiega=.t.
k_w=2
k_k=12
zdok_lad()
kj_dok_say(.f.)
zkwota=ztbrut_all
kasa_tlo()
k_dop_tlo()
kas_tlo() 
k_say()
kas_say()
s_kom("Naci˜nij dowolny klawisz !")
inkey(0)
do case
  case ptryb=1
  anul_dok()	
endcase
vksiega=.F.
restore screen from ek
RETURN	  

FUNCTION ENTER_KAS_MENU(ppoz)
local ltnaz[5],ltlit[5],ltopis[5],lbelka:="",lpoz:=ppoz,lile:=5
ltnaz[1]:=" Prezentacja "
ltnaz[2]:=" Wydruk      "
ltnaz[3]:=" Anulowanie  "
ltnaz[4]:=" Rozliczenie "
ltnaz[5]:=" Poprawianie "
ltlit[1]:=" P"
ltlit[2]:=" W"
ltlit[3]:=" A"
ltlit[4]:=" R" 
ltlit[5]:=" P" 
ltopis[1]:="Prezentacja wybranego dokumentu"
ltopis[2]:="Wydruk dokumentu kasowego"
ltopis[3]:="Anulowanie wskazanego kursorem dokumentu kasowego"
ltopis[4]:="Prezentacja dokument¢w kasowych dotycz¥cych wybranego rozliczenia"
ltopis[5]:="Poprawianie dokumentu wskazanego kursorem"
if.not.zanul_up
  ltnaz[3]:="-Anulowanie  "
  ltopis[3]:="Brak uprawnieä do anulowania  dokument¢w"
endif
if.not.zpopraw_up
  lile=4
endif
  @ 7,33,10+lile,49 box chr(176)
  lpoz=men_pion(8,34,lile,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz


FUNCTION KASLICZ_MENU(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Ekran    "
ltnaz[2]:=" Drukarka "
ltlit[1]:=" E"
ltlit[2]:=" D"
ltopis[1]:="Prezentacja na ekranie"
ltopis[2]:="Wydruk rozliczenia"
  lpoz=men_pion(12,46,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz



FUNCTION KAS_ROZLICZ(pnumdow,prap)
local lkj_kasa:=zkj_kasa,lnumdow:=pnumdow,recno:=recno(),ltbrut_all:=0
local ltyt:="",lnumdok:="",ldtyp:=zdtyp,sk, t[3],q[3],lkas_all:=0,lndok,k:=5
local l_dtyp:="",ldtyp1:="",ltcen:=ztcen,ldster:=""
local lnum:=0
local ldarchiwum:=zdarchiwum
vnumdow:=pnumdow
t[1]:="dndok"
t[2]:="ddatdok"
t[3]:="dwystawil"
q[1]:="Numer"
q[2]:="Data"
Q[3]:="Dokument wystawiˆ"
save screen to ek
*dokdef(1)
if.not.empty(dbfilter())
  kasfiltr:=dbfilter()
else
  kasfiltr:=".t."
endif  

close
** Obliczanie warto˜ci dokumentu
zkj_kasa=.f.
zdtyp=""
dok_use()
set order to 3
seek lnumdow
if.not.found()
  kj_tkom(12,"Uwaga","Dokument nie odnaleziony",lnumdow,"Operacja przerwana.",5)
else
  zdtyp=dtyp
  ldtyp1=dtyp
  ldster=dster
  lnumdok=dndok
  lndok=dndok
  ldnskrot=dnskrot
  lddatdok=ddatdok
  ldtermin=dtermin
  ltyt=stuff(space(80),2,23,"Rozliczenie dokumentu: ")  
  ltyt=stuff(ltyt,26,15,lnumdok)
  dok_licz(lnumdow,.f.)
  zdtyp=""
  ltbrut_all=ztbrut_all
  close    
  zkj_kasa=.t.
  if prap=0
    zdarchiwum=.f.
  endif
  dok_default()
  dok_use()
  set filter to alltrim(dnzam)==alltrim(vnumdow).and..not.danul
  go top
  do while.not.eof()
    lkpkw_dtyp=dtyp
	lnumdow=dndow
	dok_licz(lnumdow,.f.)
**
		  if ldtyp1$sprzedaz_gr.and.lkpkw_dtyp=substr(kasa_gr,2,1).or.ldtyp1$zakup_gr.and.lkpkw_dtyp=substr(kasa_gr,1,1)		 		 
		    ztbrut_all=-1*ztbrut_all
		  endif
**	
	lkas_all=lkas_all+ztbrut_all
	skip
  enddo
  go top
  do case
    case prap=1
      kj_okno(0,0,24,ltyt,2)
      @ 2,2 say "Warto˜† dokumentu BRUTTO .................."
      @ 4,2 say "¥czna warto˜† wpˆat got¢wkowych .........."
      @ 6,2 say "Pozostaˆo do zapˆaty ......................"
      @ 2,45 say ltbrut_all picture "999 999 999.99"
      @ 4,45 say lkas_all picture "999 999 999.99"
      @ 6,45 say ltbrut_all-lkas_all picture "999 999 999.99"
      kj_okno(9,23,13,"  Wykaz dokument¢w kasowych         ",2)
      dbedit(10,24,20,56,t,"K_FU2","",q,"ß",,"ß")
      
  case prap=2
    set device to printer
	if pstart_druk()
      w=prow()
      lkol=80-len(alltrim(zmiasto))-18
	  @ w,lkol say alltrim(zmiasto)+"  dn. "+dtoc(date())
	  w=w+2
	  @ w,k say zlic1
	  w=w+1
	  @ w,k say zlic2   
	  w=w+1
	  @ w,k say zlic5
	  w=w+1
	  @ w,k say zlic3+"  "+zlic4
	  w=w+4
	  @ w,k+20 say "R O Z L I C Z E N I E"
	  w=w+1
	  @ w,k+20 say "====================="
      w=w+3
	  @ w,k say "Dotycz dokumentu nr "+alltrim(lndok) + "  z dnia "+ dtoc(lddatdok)    	
	  w=w+1
	  @ w,k say "Kontrahent ...................... "+ldnskrot
	  w=w+3
	  @ w,k say "Warto˜† dokumentu brutto ........ "
	  @ w,k+34 say ltbrut_all picture "999 999 999.99"
	  w=w+2
	  @ w,k say "¥czna warto˜† wpˆat ............ "
	  @ w,k+34 say lkas_all picture "999 999 999.99"
	  w=w+2
	  @ w,k say "Pozostaˆo do zapˆaty ............ "
	  @ w,k+34 say ltbrut_all-lkas_all picture "999 999 999.99"
      w=w+3
	  @ w,k say "Szczeg¢ˆowy wykaz dokument¢w kasowych:"
	  w=w+2
	  @ w,k say "---------------------------------------------------"
	  w=w+1
      @ w,k	say "  Lp.   Numer dokumentu   Data        Kwota        "     
	  w=w+1
	  @ w,k say "           kasowego                                "
	  w=w+1
	  @ w,k say "---------------------------------------------------"
	  
	  do while.not.eof()
	    lnum=lnum+1
		w=w+1
		@ w,k say " "
		@ w,k+1 say lnum picture "9999"
		@ w,k+7 say dndok
		@ w,k+25 say ddatdok
        lnumdow=dndow
        dok_licz(lnumdow,.f.)
        @ w,k+37 say ztbrut_all picture "999999999.99"
        @ w,k+50 say " "
	    skip
	  enddo
	  w=w+1
	  @ w,k say "---------------------------------------------------"
	  w=w+1
	  @ w,k say "                           Razem:"
      @ w,k+37 say lkas_all picture "999999999.99"
	  @ w,k+50 say " "
	  w=w+1
	  @ w,k say "                        ---------------------------"
	  w=w+8
	  @ w,k say ".........................."
	  w=w+1
	  @ w,k say "         podpis           "            
      eject
    endif  	  
	set device to screen
  
  case prap=0.and..not.empty(pnumdow)
	  *select &kasa_sel
	  select &dok_sel
	  close
	  zkj_kasa=.f.
	  zdarchiwum:=ldarchiwum
	  if dok_use()
	    set order to 3
		seek pnumdow

		if found()
		  if reclock(5)      
            if ldster=="BRAK_KP_KW"  &&dotyczy dokument¢w zarejestrowanych w latach ubiegˆych, do kt¢rych nie wygenerowano dokument¢w KP (KW)
			  replace dniedop with dniedop-ltcen    &&ltcen - warto˜† dok. kasowego
			else
			  replace dniedop with ltbrut_all-lkas_all  &&lkas_all - warto˜† wszystkich dokument¢w kasowych rozliczaj¥cych dokument sprzeda¾y (zakupu)
            endif
			unlock
          endif 		  
		else
          kj_tkom(12,"Uwaga","Brak dokumentu o numerze",pnumdow,"",5)		
		endif
	    close
	  else
	    kj_tkom(12,"Uwaga","Brak dost©pu do bazy dokument¢w","","",5)		
	  endif
  endcase
  close
endif
*dokdef(0)
close
zkj_kasa=lkj_kasa
zdtyp=ldtyp
dok_default()
dok_use()
set filter to &kasfiltr
go top
go recno
restore screen from ek

RETURN

FUNCTION K_FU2()
local last:=lastkey()
lnumdow=dndow
dok_licz(lnumdow,.f.)
@ 21,26 say "Warto˜† wpˆaty:"
@ 21,41 say ztbrut_all picture "999 999 999.99"
do case
  case last=27
    return 0
endcase
RETURN 1



FUNCTION KAS_RAP()
local ek, lcolor:=setcolor()
save screen to ek
set device to screen
if empty(zan_txt)
  zdtyp="G"
else
  zdtyp=substr(zan_txt,1,1)
endif
zdznak=zdtyp
do while.t.
  if r_parametry()
    kasrap_druk()  
  else
    exit
  endif
enddo
select &rap_sel
restore screen from ek
setcolor(lcolor)
RETURN

*****************************

FUNCTION KASRAP_DRUK()
local ek,lcolor:=setcolor()
public rapwar:=".t."
private vpoz:=0
private vilosc_sum:=0,vcen_zak:=0,vcen_sp:=0,vwart_zak:=0,vwart_sp:=0
private vzak_all:=0,vsp_all:=0
public zdoktyp:=alltrim(substr(zan_txt,1,20))
public_rap()
public_srap()
zrap_zer()
zsrap_zer()
save screen to ek
dok_use()
set order to 3
tow_use(.f.)
if.not.empty(zdoktyp)
  if zdtyp$dowod_gr
    do case
      case zokres_def=1
        rapwar="f_datdow(f_tdat1).and.f_dtyp(zdoktyp)"
      case zokres_def=2
	    rapwar="f_miesdow(f_tmiesiac).and.f_dtyp(zdoktyp)"	
      case zokres_def=3
        rapwar="f_2datdow(f_tdat1,f_tdat2).and.f_dtyp(zdoktyp)"
    endcase
  else
    do case
      case zokres_def=1
        rapwar="f_datdok(f_tdat1).and.f_dtyp(zdoktyp)"
      case zokres_def=2
	    rapwar="f_miesdok(f_tmiesiac).and.f_dtyp(zdoktyp)"	
      case zokres_def=3
        rapwar="f_2datdok(f_tdat1,f_tdat2).and.f_dtyp(zdoktyp)"
    endcase
  endif
else
  if zdtyp$dowod_gr
    do case
      case zokres_def=1
        rapwar="f_datdow(f_tdat1)"
      case zokres_def=2
	    rapwar="f_miesdow(f_tmiesiac)"	
      case zokres_def=3
        rapwar="f_2datdow(f_tdat1,f_tdat2)"
    endcase  
  else
    do case
      case zokres_def=1
        rapwar="f_datdok(f_tdat1)"
      case zokres_def=2
	    rapwar="f_miesdok(f_tmiesiac)"	
      case zokres_def=3
        rapwar="f_2datdok(f_tdat1,f_tdat2)"
    endcase
  endif
endif
if.not.zknum=0
  rapwar=rapwar+".and.f_kontrah()"
endif



kj_okno(4,20,4, "  C z e k a j  ! !                      ",2)
set color to n/w*
@ 6,28 say "Trwaj¥ operacje dyskowe."
setcolor(lcolor)

select &tow_sel
set filter to &rapwar
go top
set device to printer

if zdruk_def=1
  if.not.pstart_druk()
    set device to screen
 	return .f.
  endif
  *set printer to
else
  plik="wydruki\kas_rap.txt"
  set printer to &plik
endif

set device to printer

do case
  case zan_def2=0
    kasrap_szcz(.t.)    

  case zan_def2=1
    kasrap_szcz(.t.)    
	eject
    set device to screen
	if kj_gkom(12," ","Drukowa† posdsumowanie ?","",.t.,5)	
	  set device to printer
	  kas_sum(1)
      eject
	endif	
  case zan_def2=2
    kasrap_szcz(.t.)    
	eject
	kas_sum(1)
	eject    
  case zan_def2=3
    kasrap_szcz(.f.)    
	kas_sum(1)    	
	eject
endcase

    set device to screen
    if.not.zdruk_def=1
      edi=edit+" wydruki\kas_rap.txt"
      run &edi 
      restore screen from ek
      set cursor off   
    endif
**


restore screen from ek
RETURN


FUNCTION KASRAP_SZCZ(pdruk)
local lraz:=1
private vpoz:=0
public kpg_all:=0,kpp_all:=0,kwg_all:=0,kwp_all:=0
public kpr_all:=0,kwr_all:=0,kpk_all:=0,kwk_all:=0

select &tow_sel
for lraz=1 to 2
  go top
  
  vpoz=0
  if pdruk
    kas_szcz_tyt(lraz)
  endif	
  do while.not.eof()
    do case
	  case lraz=1.and.zdtyp=substr(kasa_gr,1,1)
	  	if pdruk
		  vpoz=vpoz+1
          kas_szcz_wiersz()
		endif  
		do case
		  case zdsposzap="G"
		    kpg_all=kpg_all+kj_round(tcen,2)
		  case zdsposzap="P"
		    kpp_all=kpp_all+kj_round(tcen,2)
		  case zdsposzap="R"
		    kpr_all=kpr_all+kj_round(tcen,2)
		  case zdsposzap="K"
		    kpk_all=kpk_all+kj_round(tcen,2)
		endcase
		
	  case lraz=2.and.zdtyp=substr(kasa_gr,2,1)
	  	if pdruk
		  vpoz=vpoz+1
          kas_szcz_wiersz()
		endif  
		do case
		  case zdsposzap="G"
		    kwg_all=kwg_all+kj_round(tcen,2)
		  case zdsposzap="P"
		    kwp_all=kwp_all+kj_round(tcen,2)
		  case zdsposzap="R"
		    kwr_all=kwr_all+kj_round(tcen,2)
		  case zdsposzap="K"
		    kwk_all=kwk_all+kj_round(tcen,2)
		endcase
	endcase
    skip
  enddo
  if lraz=1.and.pdruk
    kas_szcz_stopa(1)
    eject
  endif
next
close
if.not.pdruk
  return
endif
kas_szcz_stopa(2)
w=w+5
kas_sum(0)
end_rap()
eject
RETURN

FUNCTION KAS_SZCZ_WIERSZ()
w=w+1
@ w,1 say vpoz picture "99999"
@ w,8 say zdndok
@ w,26 say zddatdok
@ w,42 say tnaz
do case
  case zdsposzap="G"
    @ w,77 say kj_round(tcen,2) picture "99999999.99"
  case zdsposzap="P"
    @ w,90 say kj_round(tcen,2) picture "99999999.99"
  case zdsposzap="R"
    @ w,103 say kj_round(tcen,2) picture "99999999.99"
  case zdsposzap="K"
    @ w,116 say kj_round(tcen,2) picture "99999999.99"
endcase

RETURN

FUNCTION KAS_SZCZ_TYT(ptryb)
local k:=0
local ltxt1:="Zestawienie dokument¢w typu KP - przyj©cie got¢wki do kasy lub rejestracja wpˆaty przelewowej"
local ltxt2:="================================================================================================================================"
local ltxt3:="  Lp.   Numer dokumentu   Data            Tytuˆ pˆatno˜ci                       Got¢wka     Przelew      Redukcja     Karta pˆ. "
if.not.zkarta
  ltxt3="  Lp.   Numer dokumentu   Data            Tytuˆ pˆatno˜ci                       Got¢wka     Przelew      Redukcja     Kompensata"
endif
if ptryb=2
  ltxt1:="Zestawienie dokument¢w typu KW - wydanie got¢wki z kasy lub rejestracja zapˆaty przelewem"
endif
r_tyt()
@ prow(),pcol() say &zdr_kond
w=w+3
@ w,0 say ltxt1+&zdr_kond
w=w+2
@ w,k say ltxt2
w=w+2
@ w,k say ltxt3
w=w+2
@ w,k say ltxt2
RETURN 

FUNCTION KAS_SZCZ_STOPA(ptryb)
local k:=0
local ltxt1:="================================================================================================================================"
local ltxt2:="                                                                 ==============================================================="
w=w+1
@ w,k say ltxt1
w=w+1
@ w,k+65 say "Razem:"
do case
  case ptryb=1
    @ w,77 say kpg_all picture "99999999.99"
    @ w,90 say kpp_all picture "99999999.99"
	@ w,103 say kpr_all picture "99999999.99"
	@ w,116 say kpk_all picture "99999999.99"
	
  case ptryb=2
    @ w,77 say kwg_all picture "99999999.99"
	@ w,90 say kwp_all picture "99999999.99"
	@ w,103 say kwr_all picture "99999999.99"
	@ w,116 say kwk_all picture "99999999.99"
endcase
w=w+1
@ w,k say ltxt2
RETURN  

FUNCTION KAS_SUM(ptryb)
local ltxt1:="KP - przyj©cie got¢wki do kasy "
local ltxt2:="KW - wydanie got¢wki z kasy    "
if ptryb=1
  r_tyt()
  w=w+4
endif
@ w,0 say &zdr_kkond+ltxt1
w=w+1
@ w,0 say ltxt2

w=w+3
@ w,0 say "¥czna warto˜† dokument¢w typu KP ........"
@ w,42 say kpg_all picture "999 999 999.99"
w=w+1
@ w,0 say "¥czna warto˜† dokument¢w typu KW ........"
@ w,42 say kwg_all picture "999 999 999.99"
w=w+1
@ w,43 say "-------------"
w=w+1
@ w,0 say "Warto˜† got¢wki w kasie .................."
@ w,42 say kpg_all-kwg_all picture "999 999 999.99"

w=w+3
@ w,0 say "¥czna warto˜† przelew¢w przyj©tych ......"
@ w,42 say kpp_all picture "999 999 999.99"
w=w+1
@ w,0 say "¥czna warto˜† przelew¢w wysˆanych ......."
@ w,42 say kwp_all picture "999 999 999.99"
w=w+1
@ w,43 say "-------------"
w=w+1
@ w,0 say "Warto˜† got¢wki w banku .................."
@ w,42 say kpp_all-kwp_all picture "999 999 999.99"

w=w+3
@ w,0 say "¥czna warto˜† redukcji typy KP .........."
@ w,42 say kpr_all picture "999 999 999.99"
w=w+1
@ w,0 say "¥czna warto˜† redukcji typy KW .........."
@ w,42 say kwr_all picture "999 999 999.99"
w=w+1
@ w,43 say "-------------"
w=w+1
@ w,0 say "Bilans redukcji zadˆu¾enia ..............."
@ w,42 say kpr_all-kwr_all picture "999 999 999.99"

w=w+3
if zkarta
  @ w,0 say "¥czna warto˜† wpˆat kart¥ pˆatnicz¥ ....."
else
  @ w,0 say "¥czna warto˜† wpˆat kompensat¥ .........."
endif
  
@ w,42 say kpk_all picture "999 999 999.99"
w=w+1
if zkarta
  @ w,0 say "¥czna warto˜† wypˆat kart¥ pˆatnicz¥ ...."
else
  @ w,0 say "¥czna warto˜† wypˆat kompensat¥ ........."
endif  
@ w,42 say kwk_all picture "999 999 999.99"
w=w+1
@ w,43 say "-------------"
w=w+1
if zkarta
  @ w,0 say "Bilans wpˆat i wypˆat kart¥ pˆatnicz¥ ...."
else
  @ w,0 say "Bilans wpˆat i wypˆat kompensat¥ ........."
endif  
@ w,42 say kpk_all-kwk_all picture "999 999 999.99"


w=w+3
@ w,0 say "Razem po stronie KP (przychody) .........."
@ w,42 say kpg_all+kpp_all+kpr_all+kpk_all picture "999 999 999.99"
w=w+2
@ w,0 say "Razem po stronie KW (wydatki) ............"
@ w,42 say kwg_all+kwp_all+kwr_all+kwk_all picture "999 999 999.99"
w=w+1
@ w,43 say "-------------"
w=w+1
@ w,0 say "Warto˜† got¢wki w kasie i w banku ........"
@ w,42 say kpg_all+kpp_all+kpr_all+kpk_all-kwg_all-kwp_all-kwr_all-kwk_all picture "999 999 999.99"
RETURN 

FUNCTION KAS_MENU1(ppoz)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=1
ltnaz[1]:=" Drukarki    "
ltnaz[2]:=" Opcje       "

ltlit[1]:=" D           "
ltlit[2]:=" O           "
ltopis[1]:="Wyb¢r drukarki domy˜lnej"
ltopis[2]:="Definiowane przez U¾ytkownika opcje programu."
save screen to ek
  lpoz=men_pion(6,37,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION KASA_DOK()
*dokdef(1)
     vdtyp=zdtyp
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
	   endif
	   close
	 endif
     select &dok_sel	 
	 dok_default()
     nowy_kasa_dok(.f.,.t.,.t.)      
     zdtyp=vdtyp
	 if dokdef_use()	 
	   go ldokdef_recno
       zdok_def_lad()	     
	   close
	 endif	 
	 *tow_use(.f.)
	 *dok_use()
	 *set filter to &dok_filtr
	 *go top
	 *go dok_recno
	 *zdok_lad()
	 setcolor(lcolor)
RETURN 



FUNCTION KAS_INST()
select 100
if.not.kj_use("kas_def",.t.,3)
  kj_tkom(12,"Uwaga","","Wyst¥piˆ problem przy pr¢bie doinstalowania programu kasowego.","",5)
  return
endif
if dokdef_use()	 
  set index to dok_def
else
  kj_tkom(12,"Uwaga","","Wyst¥piˆ problem przy pr¢bie doinstalowania programu kasowego.","",5)
  return  
endif
s_kom("Czekaj !   Trwa instalacja programu kasowego.")
select 100
do while.not.eof()
  zdok_def_lad()
  select &dokdef_sel
  locate for typ_dok==ztyp_dok
  if.not.found()
    if kj_append(3)
	  dokdef_replac()
      unlock
    endif  
  endif
  select 100
  skip
enddo
close_all("SH")
erase kas_def.dbf
indeksacja()
zkj_kasa=.f.
zdtyp="*"
dok_default()
if.not.kj_use("dpam",.t.,3)
  kj_tkom(12,"Uwaga","","Wyst¥piˆ problem - brak dost©pu do pliku dpam.dbf.","",5)
  return
endif
locate for znak="5"
if.not.found()
      if kj_append(3)
	    replace dokument with "KASA", znak with "5", odeslij_do with "5"
		replace numer with 0, typ_dokum with "Zewn."
        unlock
	  endif	
endif
locate for znak="G"
if.not.found()
      if kj_append(3)
	    replace dokument with "KP", znak with "G", odeslij_do with "G"
		replace numer with 0, typ_dokum with "Zewn."
        unlock
	  endif	
endif
locate for znak="g"
if.not.found()
      if kj_append(3)
	    replace dokument with "KW", znak with "g", odeslij_do with "g"
		replace numer with 0, typ_dokum with "Zewn."
        unlock
	  endif	
endif
kj_tkom(12,"Ok!","","Program kasowy doinstalowano poprawnie.","",5)
RETURN

FUNCTION PRZELGOT_MENU(ppoz)
local ltnaz[5],ltlit[5],ltopis[5],lbelka:="",lpoz:=ppoz,lile:=4
ltnaz[1]:=" Got¢wka   "
ltnaz[2]:=" Przelew   "
if zkarta
  ltnaz[3]:=" Karta pˆ."
else
  ltnaz[3]:=" Kompensata"
endif  
ltnaz[4]:=" Redukcja  "
ltlit[1]:=" G"
ltlit[2]:=" P"
ltlit[3]:=" K"
ltlit[4]:=" K"
ltopis[1]:="Wpˆata got¢wkowa"
ltopis[2]:="Wpˆata przelewem"
if zkarta
  ltopis[3]:="Wpˆata z wykorzystaniem karty pˆatniczej"
else
  ltopis[3]:="Rozliczenie towarem za towar"
endif  
ltopis[4]:="Redukcja zadˆu¾enia"
  @ 7,33,10+lile,47 box chr(176)
  lpoz=men_pion(8,34,lile,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz


FUNCTION KASDOK_DOK(ptryb)
local lks_kasa,ldtyp,lselect
lselect=select()
close_all("SH")
ldtyp=zdtyp
zdtyp="F"
lkj_kasa=zkj_kasa
zkj_kasa=.f.
if.not.ptryb
  ztcen=-ztcen
endif
lroznica=ztcen-zkas_przed 
dok_default()
select &dok_sel
if kj_use("dokum",.f.,3)
  set index to dow_num
*browse()
  if.not.empty(zdnzam)
    seek zdnzam
	if found()
      if reclock(5)      
	    replace dniedop with dniedop-lroznica
        unlock
	  endif		  
	else
      close
	  set default to leg01
	  select &archiw_sel
	  ljest=.f.
	  ld_serwer=zd_serwer
	  if file("archiw.dbf")
	    if kj_use("archiw",.f.,3)
		  go 3
		  do while.not.eof()
		    zd_serwer=alltrim(adok_path)
		    dok_default()
            select &dok_sel
		    if kj_use("dokum",.f.,3)
              set index to dow_num		
		      seek zdnzam
	          if found()
                if reclock(5)      
	              replace dniedop with dniedop-lroznica
                  unlock
				  ljest=.t.
				  exit
				endif		  
		      endif
		    endif
		    skip
		  enddo  
		endif
	  endif
	  zd_serwer=ld_serwer
      dok_default()
      select &dok_sel
	  if.not.ljest
	    kj_tkom(12," Uwaga !","  Wystapil blad.","Dokumentu, kt¢rego dotyczy wpˆata nie odnaleziono. ","",5)  	     	
	  endif	
	endif
  else
    kj_tkom(12," Uwaga !","  Wystapil blad.","Pusto. ","",5)  	     	    
  endif
endif
if.not.ptryb
  ztcen=-ztcen
endif
close_all("SH")
zkj_kasa=.t.
zdtyp=ldtyp
zkj_kasa=lkj_kasa
select &lselect
RETURN