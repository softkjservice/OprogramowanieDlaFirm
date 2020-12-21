FUNCTION SERWIS()
local lpoz:=1
*local login:="kogut",lhaslo:="kjhas1957"
*local login:="",lhaslo:=""
local login:="kogut",lhaslo:="kjhas1957"
local log:=space(20),lhas:=space(20)
local lfmag:="\"+curdir(),lkmag:="\"+curdir(),lfkon:="\"+curdir(),lkkon:="\"+curdir()
local ltyt:=stuff(space(80),23,34,"Program serwisowy KJ_SERWIS       ") 
local ek
local lpoz1:=1
public zroboczy:=stuff(space(70),2,len(curdir()),curdir())
public rapwardow:=.t.,rapwardok:=".t."
set delete on
zroboczy=stuff(zroboczy,1,1,"\")
kj_okno(0,0,24, "  KJ - Serwis                                                                   ",2)
g_tlo()
@ 10,20 say "Login ..."
@ 12,20 say "Hasˆo ..."
set color to w/n,n/n
@ 10,30 get log
@ 12,30 get lhas
read
set color to
if.not.(alltrim(log)=login.and.alltrim(lhas)=lhaslo)
  @ 20,20 say "Bˆ©dne dane - brak dost©pu"
  inkey(0)
  return
endif
set cursor on
@ 2,2 say "Zatwierd¾ katalog roboczy:"
@ 4,5 get zroboczy
read
set cursor off
save screen to ek
if lastkey()=27
  return
endif
do while .t.
  g_tlo()
  lpoz=serwis_menu(lpoz)
  if lastkey()=27
    exit
  endif
  do case
    case lpoz=1
	  lpoz1=1
	  do while.t.
	    lpoz1=sdok_menu(lpoz1)
        if lastkey()=27
          exit
        endif	  
	    do case
	      case lpoz1=1
		    lpoz2=1
		    do while.t.
		      lpoz2=archiwum_menu(lpoz2)
              if lastkey()=27
                exit
              endif	
		      do case
	            case lpoz2=1	  
		          set default to &dokdef_serwer
		          if file("archiw.dbf")
                    select &archiw_sel
			        use archiw		  
                    browse()
		          else
		            kj_tkom(8," Uwaga! "," Brak pliku &set_serwer\an_towary.dbf","Uzupeˆnij lub zrezygnuj.","Nacisnij dowolny klawisz.",5)
		          endif			
                case lpoz2=2
				  trans_okres(.t.)
                case lpoz2=3
				  trans_okres(.f.)				  
		      endcase
            enddo
        
		  case lpoz1=2
            serwis_rap()
		  case lpoz1=3
		    kas_uzup()	
			kj_tkom(8," Ok! "," ","Operacja zakoäczona pomy˜lnie.","",5)
	    endcase
	  enddo
    case lpoz=2
      lpoz1=1
	  lpoz1=comag_menu(lpoz1)
	  do case
	    case lpoz1=1
          mnum_powt()	  
	    case lpoz1=2
	  endcase 	  
    case lpoz=3
	  lpoz1=1
      lpoz1=cokon_menu(lpoz1)
	  do case
	    case lpoz1=1
          knum_powt()	  
	    case lpoz1=2
	      polacz_kon()
	endcase   
    case lpoz=4
	  has_gener()
	case lpoz=5
	  paramdbf_get()
  endcase
enddo  
RETURN

FUNCTION SERWIS_MENU(ppoz)
local ltnaz[7],ltlit[7],ltopis[7],lbelka:="",lpoz:=ppoz,lile:=6
ltnaz[1]:=" Dokumenty   "
ltnaz[2]:=" Magazyn     "
ltnaz[3]:=" Kontrahent  "
ltnaz[4]:=" Hasˆa       "
ltnaz[5]:=" Parametry   "
ltnaz[6]:=" *           "
ltnaz[7]:="             "
ltlit[1]:=" D"
ltlit[2]:=" M"
ltlit[3]:=" K"
ltlit[4]:=" H" 
ltlit[5]:=" P" 
ltlit[6]:=" *"
ltlit[7]:=" *"
ltopis[1]:="Kontrola sp¢jno˜ci dokument¢w, poprawno˜ci korekt magazynowych"
ltopis[2]:="Kontrola magazynu"
ltopis[3]:="Kontrola kontrahent¢w"
ltopis[4]:="Hasˆa dla aplikacji dzier¾awionych"
ltopis[5]:="Modyfikacja parametr¢w zapisanych w pliku param.dbf na podstawie wzorca"
ltopis[6]:=""
ltopis[7]:=""
lpoz=men_pion(1,1,7,lbelka,ltnaz,ltlit,ltopis,lpoz)  
RETURN lpoz

FUNCTION SDOK_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Archiwum   "
ltnaz[2]:=" Stany magaz"
ltnaz[3]:=" Dok.kasowe "
ltlit[1]:=" U "
ltlit[2]:=" S "
ltlit[3]:=" D "
ltopis[1]:="Scie¾ki do ¾r¢deˆ dokument¢w"
ltopis[2]:="Korekta stan¢w magazynowych zgodna z BO oraz dokumentani"
ltopis[3]:="Tworzy dokumenty kasowe dla wszystkich dokument¢w sprzeda¾y i zakupu"
  lpoz=men_pion(6,12,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz


FUNCTION ARCHIWUM_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Katalogi   "
ltnaz[2]:=" Eksport baz"
ltnaz[3]:=" Import baz "
ltlit[1]:=" K "
ltlit[2]:=" E "
ltlit[3]:=" I "
ltopis[1]:="Scie¾ki do ¾r¢deˆ dokument¢w archiwalnych"
ltopis[2]:="Przeniesienie dokument¢w z bazy bie¾¥cej do archiwum"
ltopis[3]:="Przywr¢cenie dokument¢w z archiwum do bazy bie¾¥cej"
  lpoz=men_pion(9,24,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz


FUNCTION COKON_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Numeracja  "
ltnaz[2]:=" ¥czenie   "
ltnaz[3]:=" *          "
ltlit[1]:=" N "
ltlit[2]:="  "
ltlit[3]:=" * "
ltopis[1]:="Kontrola powtarzalno˜ci numer¢w"
ltopis[2]:="Dopisywanie do bazy docelowej kontrahent¢w z bazy «r¢dˆowej"
ltopis[3]:=""
  lpoz=men_pion(8,12,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION COMAG_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Numeracja  "
ltnaz[2]:=" *          "
ltnaz[3]:=" *          "
ltlit[1]:=" N "
ltlit[2]:=" * "
ltlit[3]:=" * "
ltopis[1]:="Kontrola powtarzalno˜ci indeks¢w"
ltopis[2]:=""
ltopis[3]:=""
  lpoz=men_pion(9,12,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION SERVEND_MENU(ppoz)
local ltnaz[6],ltlit[6],ltopis[6],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Prezentacja  "
ltnaz[2]:=" Ceny magaz.  "
ltnaz[3]:=" Ilo˜ci       "
ltnaz[4]:=" Rozbie¾no˜ci "
ltnaz[5]:=" Wydruk rozb.i"
ltnaz[6]:=" *            "
ltlit[1]:=" P "
ltlit[2]:=" C "
ltlit[3]:=" I "
ltlit[4]:=" R "
ltlit[5]:=" W "
ltlit[6]:=" * "
ltopis[1]:="Prezentacja pliku rozliczeniowego w caˆo˜ci"
ltopis[2]:="Zast¥pienie cen ˜rednicj w magazynie cenami wyliczonymi z dokument¢w"
ltopis[3]:="Zast¥pienie stan¢w magazynowych ilo˜ciami wyliczonymi z dokument¢w"
ltopis[4]:="Prezentacja tych pozycji dla kt¢rych ilo˜† w magazynie r¢¾ni si© od wyliczonej"
ltopis[5]:="Wydruk tych pozycji dla kt¢rych ilo˜† w magazynie r¢¾ni si© od wyliczonej"
ltopis[6]:=""
  lpoz=men_pion(3,12,6,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz


FUNCTION POLACZ_KON()
local ek,lzrodlo:=space(70),ldocel
local ltyt:="  Funkcje programu                                                      "
local z_plik,d_plik,lpoz:=0,llast:=0                                                 
ldocel="\"+curdir()+"\kontrah\"
ldocel=stuff(space(70),1,len(ldocel),ldocel)
save screen to ek
g_tlo()
set cursor on
@ 2,2 say "Zatwierd« katalog «r¢dˆowy"
@ 4,5 get lzrodlo
@ 6,2 say "Zatwierd« katalog docelowy"
@ 8,5 get ldocel
read
set cursor off
z_plik=alltrim(lzrodlo)+"kon"
d_plik=alltrim(ldocel)+"kon"
kj_okno(10,3,7,ltyt,1)
set color to n/w,w/n
@ 12,5 say "W wyniku dziaˆania programu nowi kontrahenci z katalogu «r¢dˆowego   " 
@ 13,5 say "zostan¥ dopisani do katalogu docelowego. Program przydzieli im       "
@ 14,5 say "kolejne numery wynikaj¥ce z numeracji w bazie docelowej. Warunkiem   "
@ 15,5 say "dopisania jest wypeˆniony, nie istniej¥cy w bazie docelowej NIP.     "
if kj_gkom(18," ","    Wykona†  ? ","",.t.,5)
  g_tlo()
  select 1
  set default to &ldocel
  use kon index k_nip,k_num alias pierwszy
  select 2
  use &z_plik alias drugi
  llast=lastrec()  
  ltlo=.f.
  do while .not.eof()
    lpoz=recno()
    ltlo=kj_pasek(4,15,"UZUPENIANIE BAZY ",llast,lpoz,ltlo)
	zkon_lad()
	select 1
	if.not.empty(zknip)
	  seek zknip
	  if.not.found()
	    k_numnew()
		append blank
        k_replac()		
	  endif
	endif  
	select 2
	
	skip
  enddo
  kj_tkom(12," Ok! "," ","Operacja zakoäczona pomy˜lnie.","",5)
endif
restore screen from ek
RETURN

FUNCTION KNUM_POWT()
local ek,llast:=0,lpoz:=0
local ksciezka:=alltrim(zroboczy)+"\kontrah"
local ltyt:=" Uwaga! Wykryto gro«ny bˆ¥d w numeracji kontrahent¢w !                      "
local ltytul:=.t.
public w:=0
select 1
set default to &ksciezka
use kon
llast=lastrec()
set index to k_num
  ltlo=.f.
g_tlo()
  do while .not.eof()
    lpoz=lpoz+1
    ltlo=kj_pasek(2,15," KONTROLA NUMERàW ",llast,lpoz,ltlo)
	zkon_lad()
	skip
	if knum=zknum
	  kj_okno(7,2,14,ltyt,1)
      set color to n/w,w/n
	  @ 9,4 say "Dotyczy numeru:" + str(zknum)
	  @ 11,4 say "Obj©te bˆ©dn¥ numeracj¥ firmy to:"
	  @ 13,6 say alltrim(zknaz1)+"  "+alltrim(zknaz2)
	  @ 14,6 say alltrim(zkulica)+"  "+alltrim(zkmiasto)
	  @ 15,6 say "NIP: "+zknip
	  @ 16,4 say "oraz"
	  @ 17,6 say alltrim(knaz1)+"  "+alltrim(knaz2)
	  @ 18,6 say alltrim(kulica)+"  "+alltrim(kmiasto)
	  @ 19,6 say "NIP: "+knip	  
	  inkey(0)
      do case
	    case lastkey()=27
	      if kj_gkom(18," "," Przerwa† prac© programu  ? ","",.t.,5)
		    exit
		  endif		
	    case chr(lastkey())$"Rr"
		  set device to printer
          
		  if ltytul
		    w=prow()
		    @ w,0 say "Program serwisowy KJ_LEGOS         Dnia: "
			@ w,41 say date()
			w=w+1
			@ w,0 say "W bazie kontrahent¢w wykryto gro«ne bˆ©dy w numeracji."
			w=w+2
			@ w,0 say replicate("-",80) 
			ltytul=.f.
		  endif
		  w=w+2
		  @ w,0 say "Dotyczy numeru:" + str(zknum)
		  w=w+1
		  @ w,0 say alltrim(zknaz1)+"  "+alltrim(zknaz2)
		  w=w+1
		  @ w,0 say alltrim(zkulica)+"  "+alltrim(zkmiasto) +"   "+"NIP: "+zknip
		  w=w+1
		  @ w,0 say "oraz"
		  w=w+1
          @ w,0 say alltrim(knaz1)+"  "+alltrim(knaz2)
		  w=w+1
		  @ w,0 say alltrim(kulica)+"  "+alltrim(kmiasto) +"   "+"NIP: "+knip		  
		  set device to screen
	  endcase
	endif
  enddo	
RETURN

FUNCTION MNUM_POWT()
local ek,llast:=0,lpoz:=0
local ksciezka:=alltrim(zroboczy)+"\001mag"
local ltyt:=" Uwaga! Wykryto gro«ny bˆ¥d w numeracji pozycji magazynowych !                      "
select 1
set default to &ksciezka
use magaz
llast=lastrec()
index on mindex to mindex
use magaz index mindex
  ltlo=.f.
g_tlo()
  do while .not.eof()
    lpoz=lpoz+1
    ltlo=kj_pasek(2,15," KONTROLA NUMERàW ",llast,lpoz,ltlo)
	zmag_lad()
	skip
	if mindex=zmindex
	  kj_okno(7,2,14,ltyt,1)
      set color to n/w,w/n
	  @ 9,4 say "Dotyczy numeru:" + str(zmindex)
	  @ 11,4 say "Obj©te bˆ©dn¥ numeracj¥ pozycje :"
	  @ 14,6 say alltrim(zmnaz)+"  "+alltrim(zmkod)
	  @ 16,4 say "oraz"
	  @ 18,6 say alltrim(mnaz)+"  "+alltrim(mkod)
	  inkey(0)
	  if lastkey()=27
	    if kj_gkom(18," "," Przerwa† prac© programu  ? ","",.t.,5)
		  exit
		endif
	  endif
	endif
  enddo	
RETURN

FUNCTION K_NUMNEW()
        set order to 2
	    go bottom
	    zknum=knum+1
	    set order to 1
RETURN


FUNCTION SERWIS_RAP()
local lcolor:=setcolor(),ltindex,ltil:=0,ltilplus:=0,lsumplus:=0
local ltilplus1:=0,lsumplus1:=0,lcen_magaz:=0,ldok_il:=0
local lcen_zak:=0,lcen_sprzed:=0,lwartosc:=0
public rapwar1:=".t.",zbo:=.f.
set color to n/w,w/n
	  set default to &set_serwer
      if file("raport.dbf")
	    select &rap_sel
		if kj_use("raport",.f.,3)
		  an_lad()
		endif
	  endif	  
zan_sporzad="FURNPTABC1234furnptabc"
do while.t.
  if r_parametry()
	  set default to analizy
	  if kj_gkom(12,"","Wyzerowa† plik analityczny ?","",.t.,5)
	    if file("analiz.dbf")
 	      select &anal_sel
	      use analiz
		  zap
          index on index to analiz
		  close
		  use analiz index analiz
	    else
          kj_tkom(8," Uwaga! "," Brak pliku analizy\analiz.dbf!","Analiza nie mo¾e by† wykonana.","Nacisnij dowolny klawisz.",5)	  
	      exit
	    endif  
        zdoktyp=zan_sporzad
	    zdg_magazyn="1"
        if kj_gkom(12,"","Uwzgl©dni† BO ?","",.t.,5)
	      zbo=.t.
		  magdefault(val(zdg_magazyn)) 
          if file("bo.dbf")	  
	        select &gbo_sel
	        if.not.kj_use("bo",.f.,3)
              exit
	        endif
	      else
	        kj_tkom(8," Uwaga! "," Nie zatwierdzono bilansu otwarcia!","Plik bo.dbf nie odnaleziony.","Nacisnij dowolny klawisz.",5)
	      endif	
	      do while.not.eof()
	        zmag_lad()
		    select &anal_sel
		    append blank
		    replace naz with zmnaz,kod with zmkod,index with zmindex,jm with zmjm
		    replace stawka with zmstawka,grup with zmgrup,bo_il with zmil
		    replace bo_cen with zmcen_m 
		    select &gbo_sel  
		    skip
	      enddo
	    else
		  zbo=.f.
		endif  
	  else
	    if file("analiz.dbf")
		  zdoktyp=zan_sporzad
	      zdg_magazyn="1"
 	      select &anal_sel
		  use analiz index analiz
	    else
          kj_tkom(8," Uwaga! "," Brak pliku analizy\analiz.dbf!","Analiza nie mo¾e by† wykonana.","Nacisnij dowolny klawisz.",5)	  
	      exit
	    endif  	  
	  endif	
	* koniec obsˆugi BO
**
    dok_use()
    set order to 3
    tow_use(.f.)
    *set order to 3   &&indeksacja po tnaz+tkod
	set order to 2   &&indeksacja po indeksie
    do case
      case zokres_def=1
       * rapwar="f_datdok(f_tdat1).and.f_dtyp(zdoktyp)"
	    rapwar="tkormag.and.f_datdok(f_tdat1).and.f_dtyp(zdoktyp)"
      case zokres_def=2
	    rapwar="tkormag.and.f_miesdok(f_tmiesiac).and.f_dtyp(zdoktyp)"	
      case zokres_def=3
        rapwar="tkormag.and.f_2datdok(f_tdat1,f_tdat2).and.f_dtyp(zdoktyp)"
    endcase
    if.not.zknum=0
      rapwar=rapwar+".and.f_kontrah()"
    endif
	select &tow_sel
    cykl=1
	do while.t.
      do case
	    case cykl=1
		  rapwar1=rapwar+".and.zdtyp$zakup_gr.and..not.(zdtyp$dowod_gr.or.zdtyp$przes_gr.or.zdtyp$przerob_gr).and.zdtyp$kormag_gr"
		  lopis_cykl="  Zakup - dokumenty"
	    case cykl=2
		  rapwar1=rapwar+".and.zdtyp$zakup_gr.and.zdtyp$dowod_gr.and..not.(zdtyp$przes_gr.or.zdtyp$przerob_gr).and.zdtyp$kormag_gr"
          lopis_cykl="  Zakup - PZ "
	    case cykl=3
		  rapwar1=rapwar+".and.zdtyp$sprzedaz_gr.and..not.(zdtyp$dowod_gr.or.zdtyp$przes_gr.or.zdtyp$przerob_gr).and.zdtyp$kormag_gr"
          lopis_cykl="  Sprzeda¾ - dokumenty"
	    case cykl=4
		  rapwar1=rapwar+".and.zdtyp$sprzedaz_gr.and.zdtyp$dowod_gr.and..not.(zdtyp$przes_gr.or.zdtyp$przerob_gr).and.zdtyp$kormag_gr"
          lopis_cykl="  Sprzeda¾ - WZ"
	    case cykl=5
          rapwar1=rapwar+".and.zdtyp$sprzedaz_gr.and.zdtyp$przes_gr.and..not.(zdtyp$dowod_gr.or.zdtyp$przerob_gr).and.zdtyp$kormag_gr"
          lopis_cykl="  Przesuni©cia - wydania"
	    case cykl=6
          rapwar1=rapwar+".and.zdtyp$zakup_gr.and.zdtyp$przes_gr.and..not.(zdtyp$dowod_gr.or.zdtyp$przerob_gr).and.zdtyp$kormag_gr"
          lopis_cykl="  Przesuni©cia - przej©cia"
	    case cykl=7
          rapwar1=rapwar+".and.zdtyp$sprzedaz_gr.and.zdtyp$przerob_gr.and..not.(zdtyp$dowod_gr.or.zdtyp$przes_gr).and.zdtyp$kormag_gr"
	    case cykl=8
          rapwar1=rapwar+".and.zdtyp$zakup_gr.and.zdtyp$przerob_gr.and..not.(zdtyp$dowod_gr.or.zdtyp$przes_gr).and.zdtyp$kormag_gr"
	  endcase 
	  kj_okno(4,20,4, "  C z e k a j  ! !                      ",2)
      set color to n/w*
      @ 6,28 say "Trwaj¥ operacje dyskowe."
      @ 7,28 say "Cykl "
	  @ 7,34 say lopis_cykl	  
      set filter to &rapwar1
      go top
	  setcolor(lcolor)    
*BROWSE()
	  
      do while.not.eof()
        @ 23,0 say tnaz
        ztow_lad()
	    ltindex=tmindex
	    ltil=0
	    lwartosc=0
	    do while tmindex=ltindex
      @ 22,0 SAY TMINDEX
	      ltil=ltil+til
		  lwartosc=lwartosc+til*tcen
	      skip
	    enddo	  
		lcen_sred=lwartosc/ltil
        select &anal_sel	  
	    seek ltindex
	    if.not.found()
	      append blank
		  replace naz with ztnaz,kod with ztkod,num with ztnum,index with ztmindex
		  replace jm with ztjm,stawka with ztstawka
	    endif
		do case
	      case cykl=1
            lcen_sred=((zakdok_il+zakpz_il)*zak_cen+lwartosc)/(zakdok_il+zakpz_il+ltil)
			replace zakdok_il with zakdok_il+ltil,zak_cen with lcen_sred
			replace magaz with ztmagaz,grup with ztgrup
		  case cykl=2
			lcen_zak=((zakdok_il+zakpz_il)*zak_cen+lwartosc)/(zakdok_il+zakpz_il+ltil)
			replace zakpz_il with zakpz_il+ltil,zak_cen with lcen_zak
			replace magaz with ztmagaz,grup with ztgrup			
	      case cykl=3
		    lcen_sprzed=((spdok_il+spwz_il)*sprzed_cen+lwartosc)/(spdok_il+spwz_il+ltil)
            replace spdok_il with spdok_il+ltil,sprzed_cen with lcen_sred
			replace magaz with ztmagaz,grup with ztgrup
		  case cykl=4
            lcen_sprzed=((spdok_il+spwz_il)*sprzed_cen+lwartosc)/(spdok_il+spwz_il+ltil)
			replace spwz_il with spwz_il+ltil,sprzed_cen with lcen_sprzed
			replace magaz with ztmagaz,grup with ztgrup						
	      case cykl=5
		    lcen_sred=(mmwyd_il*mmw_cen+lwartosc)/(mmwyd_il+ltil)
            replace mmwyd_il with mmwyd_il+ltil,mmw_cen with lcen_sred
			replace magaz with ztmagaz,grup with ztgrup
	      case cykl=6
		    lcen_sred=(mmprzyj_il*mmp_cen+lwartosc)/(mmprzyj_il+ltil)
            replace mmprzyj_il with mmprzyj_il+ltil,mmp_cen with lcen_sred
			replace magaz with ztmagaz,grup with ztgrup			
	      case cykl=7
           * replace prod_il with -1*ltil,mmw_cen with lcen_sred
		*	replace magaz with ztmagaz,grup with ztgrup
	      case cykl=8
         *   replace mmprzyj_il with ltil,mmp_cen with lcen_sred
		*	replace magaz with ztmagaz,grup with ztgrup						
	    endcase

        select &tow_sel	  
	  enddo
	  cykl=cykl+1
	  if cykl>6
	    exit
	  endif	  
	enddo
**
	*towar_anal()
  else
    exit
  endif
enddo  		
cen_kor=.f.
il_kor=.f.
g_tlo()

**  Por¢wnanie z magazynem
  mag_use(1)
  set order to 4
**
select &anal_sel	  
go top
do while.not.eof()
  replace dok_il with bo_il+zakdok_il+zakpz_il+mmprzyj_il-(spdok_il+spwz_il+mmwyd_il)
  replace cen_magaz with (bo_il*bo_cen+(zakdok_il+zakpz_il)*zak_cen)/(bo_il+zakdok_il+zakpz_il)
  lindex=index
  ldok_il=dok_il
  lcen_magaz=cen_magaz
  select &gmag_sel
  seek lindex
  if found()
    lmil=mil
	select &anal_sel	  
	replace mag_il with lmil
    select &gmag_sel
	if cen_kor
        if reclock(5)      
	      replace mcen_m with lcen_magaz
          unlock
	    endif
	endif
    if il_kor
        if reclock(5)      
	      replace mil with ldok_il
          unlock
	    endif	
	endif
  endif
  select &anal_sel	  
  skip
enddo  
*browse()
g_tlo()
lpoz=1
do while.t.
  g_tlo()
  lpoz=servend_menu(lpoz)
  if lastkey()=27
    exit
  endif
  do case
    case lpoz=1
      set filter to
	  go top
	  browse()
     * g_tlo()
	 * @ 10,20 say " Koniec prezentacji "
	 * inkey(0)
    case lpoz=2
      select &anal_sel	  
      go top
      do while.not.eof()
        lindex=index
        lcen_magaz=cen_magaz
        select &gmag_sel
        seek lindex
        if found()
          if reclock(5)      
	        replace mcen_m with lcen_magaz
            unlock
	      endif
        endif
        select &anal_sel	  
	    skip
	  enddo	  
      kj_tkom(8," "," Operacja uaktualnienia ˜rednich cen magazynowych zakoäczona pomy˜lnie!","","Nacisnij dowolny klawisz.",5)
      keyboard chr(205)
	case lpoz=3
      select &anal_sel	  
      go top
      do while.not.eof()
        lindex=index
        ldok_il=dok_il
        select &gmag_sel
        seek lindex
        if found()
          if reclock(5)      
	        replace mil with ldok_il
            unlock
	      endif	
        endif
        select &anal_sel	  
	    skip
	  enddo
      kj_tkom(8," "," Operacja uaktualnienia stan¢w magazynowych zakoäczona pomy˜lnie!","","Nacisnij dowolny klawisz.",5)
      keyboard chr(205)
	case lpoz=4
	  set filter to .not.dok_il=mag_il
	  go top
	  browse()  
      *g_tlo()
	  *@ 10,20 say " Koniec prezentacji "
	  *inkey(0)
    case lpoz=5
	  rozbiez_druk()
  endcase

enddo  
close all
RETURN

FUNCTION ROZBIEZ_DRUK()
local lpoz:=0
local dok_sum:=0,mag_sum:=0
select &anal_sel
set filter to .not.dok_il=mag_il
go top
set device to printer
w=prow()
@ w,0 say " "
w=w+1
@ w,0 say "Raport rozbie¾no˜ci stan¢w magazynowych z dnia "
@ w,50 say date()
w=w+2
do case
  case zokres_def=1
    @ w,0 say "Za dzieä "
	@ w, 10 say f_tdat1
  case zokres_def=2
    @ w,0 say "Za miesi¥c "
	@ w,12 say f_tmiesiac
  case zokres_def=3
    @ w,0 say "Za okres od dnia "
	@ w,18 say f_tdat1
	@ w,30 say "do dnia "
	@ w,39 say f_tdat2		
endcase
w=w+1
if zbo
  @ w,0 say "Z uwzgl©dnieniem bilansu otwarcia"
else
  @ w,0 say "Bez uwzgl©dnienia bilansu otwarcia"
endif
w=w+2
@ w,0 say "Dotyczy firmy:"
w=w+1
@ w,15 say zlic1
w=w+1
@ w,15 say zlic2+&zdr_kond
w=w+2
@ w,0 say "=================================================================================================================================="
w=w+1
@ w,0 say " Lp.    Nazwa                                            Kod             Cena ˜rednia    Ilo˜†          Ilo˜†        R¢¾nica      "
w=w+1
@ w,0 say "                                                                         z dokument¢w    z dokument¢w   z magazynu   mag - dok    "
w=w+1
@ w,0 say "=================================================================================================================================="
w=w+1
do while.not.eof()
  lpoz=lpoz+1
  @ w,0 say lpoz picture "99999"
  @ w,9 say naz
  @ w,58 say kod
  @ w,74 say kj_round(cen_magaz,2) picture "999999999.99"
  @ w,90 say kj_round(dok_il,2) picture "999999999.99"
  @ w,105 say kj_round(mag_il,2) picture "999999999.99"  
  @ w,118 say kj_round(mag_il-dok_il,2) picture "999999999.99"
  dok_sum=dok_sum+kj_round(kj_round(cen_magaz,2)*kj_round(dok_il,2),2)
  mag_sum=mag_sum+kj_round(kj_round(cen_magaz,2)*kj_round(mag_il,2),2)  
  w=w+1
  skip
enddo
w=w+1
@ w,0 say "=================================================================================================================================="
w=w+2
@ w,0 say "¥czna warto˜† magazynu na podstawie stan¢w magazynowych ="
@ w,60 say mag_sum picture "999 999 999.99"
w=w+1
@ w,0 say "¥czna warto˜† magazynu na podstawie ilo˜ci z dokument¢w ="
@ w,60 say dok_sum picture "999 999 999.99"
w=w+1
@ w,60 say "--------------"
w=w+1
@ w,40 say "R¢¾nica (mag - dok) ="
@ w,60 say mag_sum-dok_sum picture "999 999 999.99"+&zdr_kkond
eject
set device to screen
RETURN

FUNCTION ZDOK1_LAD()
zdgrup=dgrup
zdtyp=dtyp
zdznak=dznak
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
zdnzam=dnzam
RETURN nil

FUNCTION DOK1_REPLAC()
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
RETURN nil


FUNCTION TOW1_REPLAC()
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
replace tstawka with ztstawka
replace tsymbol with ztsymbol
replace tzwolniony with ztzwolniony
replace twyroznik with ztwyroznik
replace twykonal with ztwykonal
replace tster with ztster
replace tmagaz with ztmagaz
replace tgrup with ztgrup
replace tdekret with ztdekret
replace tanul with ztanul
RETURN nil



FUNCTION TRANS_OKRES(pdo_archiwum)
local t[8],q[8]
local ek,lcolor:=setcolor(),lpoz:=1,lpoz1:=1,lpoz2:=1
local lokrestxt:="Dzieä ...",lok_def:=1,ldruk_def:=1
local ek1,ek2,ek3,lcykl:=1
t[1]:="arch_poz"
t[2]:="arch_naz"
t[3]:="arch_opis"
t[4]:="adok_path"
t[5]:="akas_path"
t[6]:="amag_path"
t[7]:="akon_path"
t[8]:="arch_wid"
q[1]:="Numer"
q[2]:="Nazwa archiwum"
q[3]:="Opis archiwum"
q[4]:="—cie¾ka dokument¢w"
q[5]:="—cie¾ka dok.kasowych" 
q[6]:="—cie¾ka magazynu"
q[7]:="—cie¾ka kontrahenta"
q[8]:="Widoczny"
f_tdat1=date()
f_tdat2=date()
f_tmiesiac=month(date())
g_tlo()
save screen to ek     
set color to
lpoz2=zestokres_menu(lpoz2)
if lastkey()=27
  keyboard chr(205)
  return			
endif  
set cursor on
do case
  case lpoz2=1
    @ 12,24 say space(44)
	@ 12,37 get f_tdat1 when s_kom("Zatwierd« dat© obj©tych raportem dokument¢w.")
  case lpoz2=2
    @ 12,24 say space(44)
    @ 12,24 say "Miesi¥c .... " get f_tmiesiac range 1,12 when s_kom("Zatwierd« miesi¥c obj©tych raportem dokument¢w.")
  case lpoz2=3
    @ 12,24 say space(44)
    @ 12,35 get f_tdat1 when s_kom("Zatwierd« dat© pocz¥tkow¥ obj©tych raportem dokument¢w.")			  
    @ 12,58 get f_tdat2 when s_kom("Zatwierd« dat© koäcow¥ obj©tych raportem dokument¢w.")			  				
endcase
read
set cursor off
if lastkey()=27
  keyboard chr(205)
  return			
endif  
zokres_def=lpoz2
do case
  case zokres_def=1
    rapwardok="ddatdok=f_tdat1.and..not.dtyp$dowod_gr"
    rapwardow="ddatdow=f_tdat1.and.dtyp$dowod_gr"
  case zokres_def=2
    rapwardok="month(ddatdok)=f_tmiesiac.and.year(ddatdok)=year(date()).and..not.dtyp$dowod_gr"
	rapwardow="month(ddatdow)=f_tmiesiac.and.year(ddatdow)=year(date()).and.dtyp$dowod_gr"
  case zokres_def=3
    rapwardok="max(f_tdat1,ddatdok)=ddatdok.and.min(f_tdat2,ddatdok)=ddatdok.and..not.dtyp$dowod_gr"
	rapwardow="max(f_tdat1,ddatdow)=ddatdow.and.min(f_tdat2,ddatdow)=ddatdow.and.dtyp$dowod_gr"
endcase


**
		          set default to &dokdef_serwer
		          g_tlo()
				  if file("archiw.dbf")
                    select &archiw_sel
			        use archiw		  
                    *browse()
					keyboard chr(205)
					dbedit(6,2,18,77,t,"AFU","",q,"ß",,"ß")
		            close all
					if lastkey()=27
					  return
					endif
				  else
		            kj_tkom(8," Uwaga! "," Brak pliku &set_serwer\an_towary.dbf","Uzupeˆnij lub zrezygnuj.","Nacisnij dowolny klawisz.",5)
		          endif			
**

**
dokpath=zadok_path+"001dok"
set default to &dokpath
select &archtow_sel
use towary index t_dow,t_index,t_nazkod alias arch_tow
select &archdok_sel
use dokum index dok_ident,dok_num,dow_num alias arch_dok

*dok_default()
set default to &(zd_serwer+"001dok")
select &tow_sel
use towary index t_dow,t_index,t_nazkod alias aktual_tow
select &dok_sel
use dokum index dok_ident,dok_num,dow_num alias aktual_dok
if.not.pdo_archiwum
  select &archdok_sel
endif

do while.t.
  do case
    case lcykl=1
      set filter to &rapwardok
    case lcykl=2
      set filter to &rapwardow	  
  endcase
  go top
  browse()
  g_tlo()
  go top
  if kj_gkom(18," ","    Wykona†  ? ","",.t.,5)
    if pdo_archiwum
	  do while.not.eof()
        zdok1_lad()
        *replace dster with "delete_poz"
	    delete
	    select &archdok_sel
	    append blank
	    dok1_replac()  
	    select &tow_sel
        seek zdndow
	    if found()
          do while tndow=zdndow
		    @ 22,0 say zdndow
			@ 23,0 say tnaz+"  "+tkod
			ztow_lad()
		    *replace tster with "del"
		    delete
		    select &archtow_sel
		    append blank
            tow1_replac()
		    select &tow_sel 		  
		    skip
		  enddo	  
	    else
	      kj_tkom(8," Uwaga! "," dokument o numerze",zdndok,"nie posiada bazy towarowej.",5)
	    endif
        select &dok_sel
	    skip
      enddo
      select &tow_sel
      pack	  	
      select &dok_sel
      pack

	else
	  do while.not.eof()
        zdok1_lad()
        *replace dster with "delete_poz"
	    delete
	    select &dok_sel
	    append blank
	    dok1_replac()  
	    select &archtow_sel
        seek zdndow
	    if found()
          do while tndow=zdndow
		    @ 22,0 say zdndow
			@ 23,0 say tnaz+"  "+tkod		  
		    ztow_lad()
		    *replace tster with "del"
		    delete
		    select &tow_sel
		    append blank
            tow1_replac()
		    select &archtow_sel 		  
		    skip
		  enddo	  
	    else
	      kj_tkom(8," Uwaga! "," dokument o numerze",zdndok,"nie posiada bazy towarowej.",5)
	    endif
        select &archdok_sel
	    skip
      enddo
      select &archtow_sel
      pack	  	
      select &archdok_sel
      pack


	endif
** etap usuwania

  endif
  lcykl=lcykl+1
  if lcykl>1
    exit
  endif
enddo
close all	
** doˆo¾ono dn 09.04.2003
kj_tkom(12," Ok! "," ","Operacja zakoäczona pomy˜lnie.","",5)
restore screen from ek
**
RETURN
*********** odci©to dnia 09.04.2003
*return

set default to &(zkas_serwer+"kasa")
if.not.file("dokum.dbf")
  kj_tkom(12," Ok! "," ","Operacja zakoäczona pomy˜lnie.","",5)  
  return  
endif

*
set default to &(zakas_path+"kasa")
select &archtow_sel
use towary index t_dow,t_index,t_nazkod alias arch_tow
select &archdok_sel
use dokum index dok_ident,dok_num,dow_num alias arch_dok

*dok_default()
set default to &(zkas_serwer+"kasa")
select &tow_sel
use towary index t_dow,t_index,t_nazkod alias aktk_tow
select &dok_sel
use dokum index dok_ident,dok_num,dow_num alias aktk_dok
if.not.pdo_archiwum
  select &archdok_sel
endif
*
  set filter to &rapwardok
  go top
  browse()
  g_tlo()
  go top
  if kj_gkom(18," ","    Wykona†  ? ","",.t.,5)
    if pdo_archiwum
	  do while.not.eof()
        zdok1_lad()
        *replace dster with "delete_poz"
	    delete
	    select &archdok_sel
	    append blank
	    dok1_replac()  
	    select &tow_sel
        seek zdndow
	    if found()
          do while tndow=zdndow
		    @ 22,0 say zdndow
			@ 23,0 say tnaz+"  "+tkod
		    ztow_lad()
		    *replace tster with "del"
		    delete
		    select &archtow_sel
		    append blank
            tow1_replac()
		    select &tow_sel 		  
		    skip
		  enddo	  
	    else
	      kj_tkom(8," Uwaga! "," dokument o numerze",zdndok,"nie posiada bazy towarowej.",5)
	    endif
        select &dok_sel
	    skip
      enddo	
      select &dok_sel
      pack
      select &tow_sel
      pack
	else
	  do while.not.eof()
        zdok1_lad()
        *replace dster with "delete_poz"
	    delete
	    select &dok_sel
	    append blank
	    dok1_replac()  
	    select &archtow_sel
        seek zdndow
	    if found()
          do while tndow=zdndow
		    @ 22,0 say zdndow
			@ 23,0 say tnaz+"  "+tkod
		    ztow_lad()
		    *replace tster with "del"
		    delete
		    select &tow_sel
		    append blank
            tow1_replac()
		    select &archtow_sel 		  
		    skip
		  enddo	  
	    else
	      kj_tkom(8," Uwaga! "," dokument o numerze",zdndok,"nie posiada bazy towarowej.",5)
	    endif
        select &archdok_sel
	    skip
      enddo	
      select &archdok_sel
      pack
      select &archtow_sel
      pack

	endif
  endif
close all		
*
kj_tkom(12," Ok! "," ","Operacja zakoäczona pomy˜lnie.","",5)
restore screen from ek
RETURN    &&koniec odci©cia z dnia 09.04.2003


FUNCTION AFU()
local last:=lastkey()
do case
  case last=27
    return 0
  case last=13
    archiw_lad()
	return 0	
endcase
RETURN 1

FUNCTION HAS_GENER()
local ek,lhas:=0,minth:=month(date())
save screen to ek
clear
@ 1,2 say "Hasˆa dla aplikacji dzier¾awionych na rok:"
@ 1,47 say year(date())
@ 3,2 say "Styczeä .........."
@ 4,2 say "Luty ............."
@ 5,2 say "Marzec ..........."
@ 6,2 say "Kwiecieä ........."
@ 7,2 say "Maj .............."
@ 8,2 say "Czerwiec ........."
@ 9,2 say "Lipiec ..........."
@ 10,2 say "Sierpieä ........."
@ 11,2 say "Wrzesieä ........."
@ 12,2 say "Pa«dziernik ......"
@ 13,2 say "Listopad ........."
@ 14,2 say "Grudzieä ........."
for month=1 to 12
  lhas=(66+month)*(year(date())+3*month)+12345*month
  @ 2+month,20 say lhas
next

inkey(0)
restore screen from ek
RETURN

FUNCTION PARAMDBF_GET()
local ldocel:=alltrim(zroboczy)+"\shset                    ",lzrodlo:="a:                                     "
local ek,lnazwa,lco,ljak,lopis,lgrupa,lindex,lwidoczny
local l1zaznacz:=.f.,l2zaznacz:=.f.
save screen to ek
g_tlo()
@ 5,2 say "Katalog «r¢dˆowy ....."
@ 7,2 say "Katalog docelowy ....."
set cursor on
@ 5,25 get lzrodlo
@ 7,25 get ldocel
read
set cursor off
lzrodlo=alltrim(lzrodlo)
ldocel=alltrim(ldocel)
select 1
set default to &lzrodlo
use param alias par1
select 2
set default to &ldocel
use param alias par2
set index to param
select 1
browse()
go top
locate for substr(grupa,3,1)="*"
if found()
  l1zaznacz:=.t.
  set filter to substr(grupa,3,1)="*"
  go top
  @ 0,2 say "Pozycje przeznaczone do wprowadzenia"
  browse()
  set filter to
endif
go top
locate for substr(grupa,3,1)="!"
if found()
  l2zaznacz:=.t.
  set filter to substr(grupa,3,1)="!"
  go top
  @ 0,2 say "Pozycje przeznaczone do usuni©cia   "
  browse()
endif
if l1zaznacz.or.l2zaznacz
  if kj_gkom(18," ","    Wykona†  ? ","",.t.,5)
    if l1zaznacz
	  set filter to substr(grupa,3,1)="*"
	  go top
      do while.not.eof()
        lnazwa=nazwa
	    lco=co
	    ljak=jak
	    lopis=opis
	    lgrupa=stuff(space(3),1,2,substr(grupa,1,2))
	    lindex=index
	    lwidoczny=widoczny
	    select 2
	    append blank
	    replace nazwa with lnazwa,co with lco,jak with ljak,opis with lopis
	    replace grupa with lgrupa,index with lindex,widoczny with lwidoczny
	    select 1
	    skip
      enddo
      select 2
      browse()  
    endif
	
    if l2zaznacz
	  set filter to substr(grupa,3,1)="!"
	  go top
      do while.not.eof()
	    lco=co
	    select 2
        locate for co==lco
		if found()
		  delete
          pack
		endif
	    select 1
	    skip
      enddo
      select 2
      browse()  
    endif	
  endif	
else
  kj_tkom(8," Uwaga! "," Brak pozycji do instalacji","Zaznacz i ponow pr¢b©","Pole grupa [ ] [ ] [*] lub [ ] [ ] [!].",5)
endif
restore screen from ek
close all
RETURN

******** Uzupeˆnienie dokument¢w kasowych
FUNCTION KAS_UZUP()
local recno:=recno(),ldnskrot:=""
local lnum_5:=0,lnum_kp:=0,lnum_kw:=0
if.not.kj_gkom(18," Uwaga ! ","Program usunie dokumenty kasowe i utworzy nowe "," Wykona† ?",.t.,5)
  return
endif
copy file "kasa\dokum.dbf" to "kasa\kj_dokum.dbf"
copy file "kasa\towary.dbf" to "kasa\kj_towar.dbf"
zkj_kasa=.t.
zd_siec=.f.
dok_use()
zap
tow_use(.t.)
zap
close all
zkj_kasa=.f.
dok_use()
go top
zd_siec=.t.
ztyp_dok="*"
do while.not.eof()
  @ 23,1 say dndok+ "  " +dnskrot
  zdok_lad()
  zddatdok=date()
  zddatdow=date()
  if zdtyp$kasadok_gr  
    zknum=zdkontrah
	ldnskrot=zdnskrot
	lnum_5=lnum_5+1
    recno=recno()
  
    dok_licz(zdndow,.f.)
    ztcen=ztbrut_all-zdniedop
    ztnaz="Za faktur©                      "
    ztnaz=stuff(ztnaz,12,15,zdndok)
    ztil=1
    ztstawka=0
	zdnzam=zdndow
    zdkordok=zdndok  
    zddatdok=zddatdow
    close all	
    zkj_kasa=.t.
    nowy5_numkas(lnum_5,"5")
    zdgrup="5"
    
    do case
      case zdtyp$sprzedaz_gr
	    zdtyp="G"
	    zdznak="G"
	    zdsymbol="ZG"
	    lnum_kp=lnum_kp+1
	    if zdsposzap="G"
	      nowy_numkas(lnum_kp,"G")
	    else
	      zdndok=space(15)
	    endif	
      case zdtyp$zakup_gr
        zdtyp="g"
	    zdznak="g"
	    zdsymbol="zg"
	    lnum_kw=lnum_kw+1	
	    if zdsposzap="G"
	      nowy_numkas(lnum_kw,"g")
	    else
	      zdndok=space(15)
	    endif	
    endcase  
  
    dok_use()
    if kj_append(3)
	    dok_replac()
        replace dnskrot with ldnskrot
		unlock
	else
	  clear
	  @ 10,10 say "nie mog© doda† pozycji"
	  @ 11,10 say zdndow
	  @ 12,10 say zdndok
	  INKEY(0)
	endif  	
    tow_use(.T.)
    append blank
    tow_replac()
  
    close all	
    zkj_kasa=.f.
    zdtyp=""
    dok_use()
    go recno
  else
    clear
	@ 9,10 say "nie nale¾y do kasadok_gr"
	@ 10,10 say zdndow
	@ 11,10 say zdndok
	INKEY(0)
  endif
  skip
enddo
close all
indeksacja()
dok_default()
select 1
use dpam
locate for odeslij_do="5"
if.not.found()
  append blank
  replace dokument with "KASA",znak with "5", odeslij_do with "5"
  replace numer with lnum_5,typ_dokum with "Zewn©trzny"
else
  replace numer with lnum_5
endif

locate for odeslij_do="G"
if.not.found()
  append blank
  replace dokument with "KP",znak with "G", odeslij_do with "G"
  replace numer with lnum_kp,typ_dokum with "Zewn©trzny"
else
  replace numer with lnum_kp
endif
locate for odeslij_do="g"
if.not.found()
  append blank
  replace dokument with "KW",znak with "g", odeslij_do with "g"
  replace numer with lnum_kw,typ_dokum with "Zewn©trzny"
else
  replace numer with lnum_kw
endif
close
RETURN

FUNCTION NOWY5_NUMKAS(pnum_dow,pdow_znak)
local lndok:=pnum_dow,lodeslij_do:=pdow_znak
	  zdndow=stuff(space(15),9-len(alltrim(str(lndok))),len(alltrim(str(lndok))),alltrim(str(lndok)))
      zdndow=stuff(zdndow,9,2,"/"+lodeslij_do)
      zdndow=stuff(zdndow,11,4,"/"+ALLTRIM(STR(year(DATE()))))	  
      if .not. empty(zd1_lamany) .and. .not.( zdznak$zkordok_znak.and..not.zkordoklam)
	    zdndow=alltrim(stuff(zdndow,12,2,""))
		zdndow=zdndow+znumodstep
		zdndow=alltrim(zdndow)
		zdndow=alltrim(zdndow+zd1_lamany)
		zdndow=stuff(space(15),16-len(zdndow),len(zdndow),zdndow)
	  endif      
RETURN .t.

FUNCTION NOWY_NUMKAS(pnum_dok,pdok_znak)
local lndok:=pnum_dok,lodeslij_do:=pdok_znak
	  zdndok=stuff(space(15),9-len(alltrim(str(lndok))),len(alltrim(str(lndok))),alltrim(str(lndok)))
      zdndok=stuff(zdndok,9,2,"/"+lodeslij_do)
      zdndok=stuff(zdndok,11,4,"/"+ALLTRIM(STR(year(zddatdok))))	  
      if .not. empty(zd1_lamany) .and. .not.( zdznak$zkordok_znak.and..not.zkordoklam)
	    zdndok=alltrim(stuff(zdndok,12,2,""))
		zdndok=zdndok+znumodstep
		zdndok=alltrim(zdndok)
		zdndok=alltrim(zdndok+zd1_lamany)
		zdndok=stuff(space(15),16-len(zdndok),len(zdndok),zdndok)
	  endif      
RETURN .t.


******* Koniec