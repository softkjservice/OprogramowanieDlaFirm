*Raporty programu sh_firma
FUNCTION RAPORT()
local ilanal:=0,lw:=0,ek,ek1,lcolor:=setcolor(),lcen_rodz:=0
zokres_def=1
zdruk_def=1
zknum=0
f_tnaz:=space(32)
f_tkod:=space(7)
f_tgrup:=space(3)
if zile_bo_zak_sp
  f_tdat1=ctod("01.01."+str(year(date())))
  f_tdat2=date()
  zokres_def=3
else
*  f_tdat1=date()
*  f_tdat2=date()
*  f_tmiesiac=month(date())
endif  
zdznak="F"
save screen to ek
      *set default to shset
	  set default to &set_serwer
      if file("raport.dbf")
	    select &rap_sel
		if kj_use("raport",.f.,3)
		  an_lad()
		  if.not.an_def1=0          &&wyb¢r ceny do raportu
		    lcen_rodz=an_def1
		  endif
		  lw=45
		  *ilanal=lastrec()
		  do while.not.eof()
		    ilanal=ilanal+1
		    skip
		  enddo
		  go top
		  @ 4,lw+1 to 4+ilanal+1,lw+17 
		  
          do while.t.
		    rapwar=".t."
			keyboard chr(205)
		    go top
			dbedit(5,lw+2,5+ilanal-1,lw+16,"an_nazwa","FU_A","","","",,"")
		    if lastkey()=27
			  exit
		    endif
            do case
              case zvat_rap.and.alltrim(an_typ)=="zvat_rap"
                an_lad()
				rejvat_rap()
              case zzestdokum_rap.and.alltrim(an_typ)=="azestdokum_rap"
                an_lad()
				zestdokum_rap()				
              case ztowsprzedaz_rap.and.alltrim(an_typ)=="atowsprzedaz_rap"
                an_lad()
				towsprzedaz_rap()
              case zzest_tow_rap.and.alltrim(an_typ)=="zzest_tow_rap"
                 an_lad()
		         lcen_rodz=an_def1
			     zest_tow(lcen_rodz)
              case zzest_tow_rap.and.alltrim(an_typ)=="ile_bo_zak_sp"
                 an_lad()
                 do case
				   case zan_def3=0
				     ile_bo_zak_sp()
				   case zan_def3=1
				     fifo_zrob()	 
				 endcase
			  case alltrim(an_typ)=="rap_kas"
			    an_lad()
				kas_rap()

 		    endcase
			select &rap_sel
		  enddo	
		  close
        else
          return
        endif
      else
        do case
		  case zzestdokum_rap
			zestdokum_rap()
		  case ztowsprzedaz_rap	
			    @ 0,0 say "Towary"
				INKEY(0)
		endcase	  
	  endif
restore screen from ek
select &rap_sel
close		
RETURN





****************************RAPORT: ZESTAWIENIE DOKUMENTàW
FUNCTION ZESTDOKUM_RAP()
local lokreswar,ek,lpoz:=1,ek1,lcolor:=setcolor()

save screen to ek
kj_okno(0,0,10, "                    DOKUMENTY SPRZEDA½Y - PODSUMOWANIE                          ",2)
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

      if zdruk_def=1
        if reclock(5)      
          replace an_numer with zan_numer
          unlock
	    else
          kj_tkom(8," Uwaga! "," Wykryto problem w numeracji raport¢w !","Przerwij prac© innych aplikacji i ponow pr¢b©.","Nacisnij dowolny klawisz.",5)
	    endif
	  endif	  
	  zest_drap()
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


****************************PARAMETRY RAPORTU
FUNCTION PARGET_RAP()
local ek,lcolor:=setcolor(),lpoz:=1,lpoz1:=1,lpoz2:=1
local lokrestxt:="Dzieä ...",lok_def:=1,ldruk_def:=1
local ek1,ek2,ek3
*local lmiesiac:=month(date()),lmies_nazwa:=""
local lmiesiac:=f_tmiesiac,lmies_nazwa:=""
*f_tdat1=date()
*f_tdat2=date()
*f_tmiesiac=month(date())
      save screen to ek     
	  do while.t.
	    restore screen from ek
		zestpar_say(zokres_def,zdruk_def)
	    lpoz1=zestpar_menu(lpoz1,1)
        if lastkey()=27
	      keyboard chr(205)
		  exit
	    endif
	    do case
	      case lpoz1=1
	        do case
			  case zan_typ=="vat7"
				do miesiac with 4,30,lmiesiac,lmies_nazwa
                f_tmiesiac=lmiesiac  
			  otherwise
			    lpoz2=zestokres_menu(lpoz2)
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
			     zokres_def=lpoz2	 
			endcase
			read
			set cursor off
            

	      case lpoz1=2
            zdruk_def=zestdru_menu(zdruk_def,4,20)	    
          
		  case lpoz1=3
            set cursor on
            do case
			  case zan_typ=="vat7"
			    @ 16,54 get zround picture "9" range 0,2
            otherwise
              @ 16,34 get zan_numer
              @ 17,34 get zan_data
              @ 18,34 get zan_miasto
              @ 19,34 get zan_sporzadzil
              @ 20,34 get zan_zatwierdzil			
			endcase  
		    read 
			if.not.lastkey()=27.and..not.zan_typ=="vat7"
			  select &rap_sel
              if reclock(5)
			    an_replac()      
                unlock
			  else
			    return
			  endif	
			endif
            set cursor off
	    endcase
      enddo
restore screen from ek
RETURN


FUNCTION ZESTD_MENU(ppoz)
local lbelka:="° Drukuj ° Parametry ° Koniec °",lbelka1:="                  W Y B I E R Z                  "
local lliter:="  D        P           K      "
local lpoz:=1,ltopis[5]
ltopis[1]:="Wydrukuj raport."
ltopis[2]:="Zmieä parametry raportu."
ltopis[3]:="Koniec obsˆugi raportu: DOKUMENTY SPRZEDA½Y - PODSUMOWANIE"
tone(700,0.5)
lpoz=menu_poziom(1,0,3,lbelka,lliter,ltopis,lpoz,.f.,.f.)  
RETURN lpoz

FUNCTION ZESTPAR_MENU(ppoz,pwer)
local ltnaz[5],ltlit[5],ltopis[5],lbelka:="",lpoz:=ppoz
ltnaz[1]:="  Okres      "
ltnaz[2]:="  Wydruk     "
ltnaz[3]:="  Kontrahent "
ltnaz[4]:="  Inne       "
ltlit[1]:="  O "
ltlit[2]:="  W "
ltlit[3]:="  K "
ltlit[4]:="  I "
ltopis[1]:="Wyb¢r okresu obj©tego raportem."
ltopis[2]:="Wydruk na drukark© lub na ekran."
ltopis[3]:="Wyb¢r kontrahenta do raportu."
ltopis[4]:="Dane osobowe: sporz¥dziˆ,sprawdziˆ,zatwierdziˆ  oraz miejsce i data sporz¥dzenia."
do case
  case pwer=1       &&
    ltnaz[3]=ltnaz[4]
	ltlit[3]=ltlit[4]
	ltopis[3]=ltopis[4]
    lpoz=men_pion(2,10,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
  case pwer=2	
    lpoz=men_pion(2,10,4,lbelka,ltnaz,ltlit,ltopis,lpoz)
  case pwer=3	
    ltnaz[4]:="  Towar      "
	ltnaz[5]:="  Inne       "
	ltlit[4]:="  T "
	ltlit[5]:="  I "
	ltopis[4]:="Wyb¢r towar¢w do raportu."
    ltopis[5]:="Dane osobowe: sporz¥dziˆ,sprawdziˆ,zatwierdziˆ  oraz miejsce i data sporz¥dzenia."
    lpoz=men_pion(2,10,5,lbelka,ltnaz,ltlit,ltopis,lpoz)	
endcase
  
RETURN lpoz

FUNCTION ZESTOKRES_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Dzieä                   "
ltnaz[2]:=" Miesi¥c                 "
ltnaz[3]:=" Od dnia ... do dnia ... "
ltlit[1]:=" D "
ltlit[2]:=" M "
ltlit[3]:=" O "
ltopis[1]:="Raport obejmie wybrany dzieä."
ltopis[2]:="Raport obejmie wybrany miesi¥c (rok bie¾¥cy)."
ltopis[3]:="Raport obejmie okres od dnia ... do dnia ... z wˆ¥czeniem dat skrajnych."
  lpoz=men_pion(3,20,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

FUNCTION ZESTDRU_MENU(ppoz,pw,pk)
local ltnaz[2],ltlit[2],ltopis[2],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Drukarka "
ltnaz[2]:=" Ekran    "
ltlit[1]:=" D "
ltlit[2]:=" E "
ltopis[1]:="Skieruj wydruk na drukark©."
ltopis[2]:="Skieruj wydruk na ekran (r¢wnocze˜nie do pliku:WYDRUKI\ZEST_RAP.TXT)"
  lpoz=men_pion(pw,pk,2,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz

****************************KONIEC PARAMETRàW RAPORTU


FUNCTION ZESTPAR_SAY(pokres,pdruk)
local lokrestxt,ldruktxt
kj_okno(10,10,12, "  PARAMETRY RAPORTU                                          ",2)
@ 11,12 say "OKRES:  "
@ 13,12 say "WYDRUK: "
@ 15,12 say "INNE:   "
do case
  case zan_typ=="vat7"
        @ 16,12 say "     Dokˆadno˜† ..........................."
        @ 16,54 say zround picture "9" 
  otherwise		
    @ 16,12 say "     Numer ........."
    @ 17,12 say "     Data ......... "
    @ 18,12 say "     Miejsce ......."
    @ 19,12 say "     Sporz¥dziˆ ...."
    @ 20,12 say "     Zatwierdziˆ ..."
    @ 16,34 say str(zan_numer)+zan_lamany 
    @ 17,34 say zan_data
    @ 18,34 say zan_miasto
    @ 19,34 say zan_sporzadzil
    @ 20,34 say zan_zatwierdzil
endcase 	
do case
  case pokres=1
    lokrestxt:="Dzieä ...... "+dtoc(f_tdat1)
  case pokres=2
    lokrestxt:="Miesi¥c .... "+nazwa_miesiaca(f_tmiesiac)+"  / "+str(year(date()))+" r"			
  case pokres=3
    lokrestxt:="Od dnia .. "+dtoc(f_tdat1)+"  do dnia .. "+dtoc(f_tdat2)
endcase
do case
  case pdruk=1
    ldruktxt="DRUKARKA"
  case pdruk=2
    ldruktxt="EKRAN"	
endcase
@ 12,24 say space(44)
@ 14,24 say space(44)
@ 12,24 say lokrestxt
@ 14,24 say ldruktxt

RETURN



FUNCTION PUBLIC_AN()
public zan_nazwa:=space(15),zan_typ:=space(20),zan_numer:=0,zan_lamany:=space(10)
public zan_opis:=space(80),zan_txt:=space(80),zan_sporzadzil:=space(30)
public zan_zatwierdzil:=space(30),zan_miasto:=space(30),zan_data:=date()
public zan_tytul:=space(60),zan_def1:=0,zan_def2:=0,zan_def3:=0,zan_def4:=0
public zan_def5:=0
RETURN

FUNCTION AN_LAD()
zan_nazwa:=an_nazwa
zan_typ=an_typ
zan_numer=an_numer+1
zan_lamany=an_lamany
zan_opis=an_opis
zan_tytul=an_tytul
zan_txt=an_txt
zan_sporzadzil=an_sporzadzil
zan_zatwierdzil=an_zatwierdzil
zan_miasto=an_miasto
zan_def1=an_def1
zan_def2=an_def2
zan_def3=an_def3
zan_def4=an_def4
zan_def5=an_def5
if empty(zan_txt)
  zdtyp="F"
else
  zdtyp=substr(zan_txt,1,1)
endif
RETURN

FUNCTION AN_REPLAC()
replace an_numer with zan_numer,an_sporzadzil with zan_sporzadzil
replace an_zatwierdzil with zan_zatwierdzil, an_miasto with zan_miasto
RETURN

FUNCTION ZEST_DRAP()
local ek
private vpoz:=0
public zndok_start:=space(15),zndok_end:=space(15)
z_plik="r_doksum.dbf"
if.not.empty(zan_txt)
  z_plik=alltrim(substr(zan_txt,1,20))
endif  
public_rap()
public_srap()
zrap_zer()
zsrap_zer()

save screen to ek
do case
  case zokres_def=1
    rapwar="ddatdok=f_tdat1.and..not.danul"
  case zokres_def=2
    rapwar="month(ddatdok)=f_tmiesiac.and.year(ddatdok)=year(date()).and..not.danul"	
  case zokres_def=3
    rapwar="max(f_tdat1,ddatdok)=ddatdok.and.min(f_tdat2,ddatdok)=ddatdok.and..not.danul"
endcase

**
*set default to shset
set default to &set_serwer
*if file("r_doksum.dbf")
if file(z_plik)
  select &rap1_sel
  *if.not.kj_use("r_doksum",.f.,3)
  if.not.kj_use(z_plik,.f.,3)
    return
  endif
else

  kj_tkom(8," Uwaga! ","Uszkodzony plik R_DOKSUM.DBF. Raport nie b©dzie wykonany. ","Skontaktuj si© z serwisem.  ","Nacisnij dowolny klawisz.",5)
  return
endif    

**

if zdruk_def=1
  if.not.start_druk()
    set device to screen
 	return .f.
  endif
 * set printer to
else
  plik="wydruki\r_doksum.txt"
  set printer to &plik
endif
set device to printer
**
w=prow()
r_doksum_tyt()
lrapwar=rapwar
do while.not.eof()
  rapwar=lrapwar
  zrap_zer()
  vpoz=vpoz+1
  vr_dokum=r_dokum
  vr_znak=alltrim(r_znak)
  vr_numery=r_numery   
  *rapwar=rapwar+".and.dznak$vr_znak"
  if substr(r_znak,1,1)$zkordok_znak
    rapwar=rapwar+".and.dznak$zkordok_znak"
  else
    rapwar=rapwar+".and..not.dznak$zkordok_znak"
  endif
  rapwar=rapwar+".and.dtyp$vr_znak"
  
  r_doksum_wiersz()
**
    zsnet_a=zsnet_a+zrnet_a  
    zsnet_b=zsnet_b+zrnet_b  
    zsnet_c=zsnet_c+zrnet_c  
    zsnet_d=zsnet_d+zrnet_d  
    zsnet_e=zsnet_e+zrnet_e  
    zsnet_f=zsnet_f+zrnet_f  
    zsnet_z=zsnet_z+zrnet_z
    zsvat_a=zsvat_a+zrvat_a    
    zsvat_b=zsvat_b+zrvat_b    
    zsvat_c=zsvat_c+zrvat_c    
    zsvat_d=zsvat_d+zrvat_d    
    zsvat_e=zsvat_e+zrvat_e    
    zsvat_f=zsvat_f+zrvat_f
    zsbrut_a=zsbrut_a+zrbrut_a        
    zsbrut_b=zsbrut_b+zrbrut_b        
    zsbrut_c=zsbrut_c+zrbrut_c        
    zsbrut_d=zsbrut_d+zrbrut_d        
    zsbrut_e=zsbrut_e+zrbrut_e        
    zsbrut_f=zsbrut_f+zrbrut_f        
    zsbrut_z=zsbrut_z+zrbrut_z        
    zsnet_all=zsnet_all+zrnet_all
    zsvat_all=zsvat_all+zrvat_all
    zsbrut_all=zsbrut_all+zrbrut_all
**  
  select &rap1_sel
  skip
enddo
close
r_doksum_stopa()
end_rap()
eject
**
set device to screen
if.not.zdruk_def=1
  save screen to ek
  edi=edit+" wydruki\r_doksum.txt"
  run &edi 
  restore screen from ek
  set cursor off   
endif
RETURN


FUNCTION R_DOKSUM_TYT()
local ltxt1:="=========================================================================================================================="
local ltxt2:="|    |                               |                 |                 |           W   a   r   t   o   ˜   †           |"
local ltxt3:="| Lp.| Dokument                      | Od numeru       | Do numeru       |     NETTO     |      VAT      |     BRUTTO    |"
local ltxt4:="|====|===============================|=================|=================|===============|===============|===============|"
local ltxt5:="|    |                               |                 |                 |               |               |               |"
r_tyt()

w=w+2
@ w,0 say &zdr_kond+ltxt1
w=w+1
@ w,0 say ltxt2
w=w+1
@ w,0 say ltxt3
w=w+1
@ w,0 say ltxt4
w=w+1
RETURN 

FUNCTION R_DOKSUM_WIERSZ()
local ltxt1:="|====|===============================|=================|=================|===============|===============|===============|"
local ltxt2:="|    |                               |                 |                 |               |               |               |"
local t[7],q[7],i
for i=1 to 7
  t[i]:=space(73)
  q[i]:=space(2)
next
i=1


*************OBLICZENIA
dok_use()
set filter to &rapwar
go top
if vr_numery
  zndok_start=dndok
  go bottom
  zndok_end=dndok
  go top
else
  zndok_start=space(15)
  zndok_end=space(15)
endif
set device to screen
do while.not.eof()
  zdok_lad()
  if.not.zdanul
    dok_licz(zdndow,.f.)
    zrnet_a=zrnet_a+ztnet_a  
    zrnet_b=zrnet_b+ztnet_b  
    zrnet_c=zrnet_c+ztnet_c  
    zrnet_d=zrnet_d+ztnet_d  
    zrnet_e=zrnet_e+ztnet_e  
    zrnet_f=zrnet_f+ztnet_f  
    zrnet_z=zrnet_z+ztnet_z
    zrvat_a=zrvat_a+ztvat_a    
    zrvat_b=zrvat_b+ztvat_b    
    zrvat_c=zrvat_c+ztvat_c    
    zrvat_d=zrvat_d+ztvat_d    
    zrvat_e=zrvat_e+ztvat_e    
    zrvat_f=zrvat_f+ztvat_f
    zrbrut_a=zrbrut_a+ztbrut_a        
    zrbrut_b=zrbrut_b+ztbrut_b        
    zrbrut_c=zrbrut_c+ztbrut_c        
    zrbrut_d=zrbrut_d+ztbrut_d        
    zrbrut_e=zrbrut_e+ztbrut_e        
    zrbrut_f=zrbrut_f+ztbrut_f        
    zrbrut_z=zrbrut_z+ztbrut_z        
    zrnet_all=zrnet_all+ztnet_all
    zrvat_all=zrvat_all+ztvat_all
    zrbrut_all=zrbrut_all+ztbrut_all
  endif
  skip
enddo
close
set device to printer
************KONIEC OBLICZEã



@ w,0 say ltxt2
w=w+1
@ w,0 say "|"
@ w,2 say vpoz picture "99"
@ w,5 say "|"
@ w,6 say vr_dokum

@ w,37 say "|"
@ w,39 say zndok_start
@ w,55 say "|"
@ w,57 say zndok_end
@ w,73 say "|"
@ w,74 say zrnet_all picture "9999999999.99"
@ w,89 say "|"
@ w,90 say zrvat_all picture "9999999999.99"
@ w,105 say "|"
@ w,106 say zrbrut_all picture "9999999999.99"
@ w,121 say "|"
w=w+1

**
    if.not.zrnet_a=0
      t[i]=str(zrnet_a,11,2)+space(5)+str(zrvat_a,11,2)+"     "+str(zrbrut_a,11,2)+"  |"
      q[i]=str(mvat("A"))+" %"       
	  i=i+1
	endif  
    if.not.zrnet_b=0
      t[i]=str(zrnet_b,11,2)+space(5)+str(zrvat_b,11,2)+"     "+str(zrbrut_b,11,2)+"  |"
      q[i]=str(mvat("B"))+" %"              
	  i=i+1
	endif  
    if.not.zrnet_c=0
      t[i]=str(zrnet_c,11,2)+space(5)+str(zrvat_c,11,2)+"     "+str(zrbrut_c,11,2)+"  |"
      q[i]=str(mvat("C"))+" %"       
	  i=i+1
	endif  
    if.not.zrnet_d=0
      t[i]=str(zrnet_d,11,2)+space(5)+str(zrvat_d,11,2)+"     "+str(zrbrut_d,11,2)+"  |"
      q[i]=str(mvat("D"))+" %"              
	  i=i+1
	endif  
    if.not.zrnet_e=0
      t[i]=str(zrnet_e,11,2)+space(5)+str(zrvat_e,11,2)+"     "+str(zrbrut_e,11,2)+"  |"
      q[i]=str(mvat("E"))+" %"              
	  i=i+1
	endif  
    if.not.zrnet_f=0
      t[i]=str(zrnet_f,11,2)+space(5)+str(zrvat_f,11,2)+"     "+str(zrbrut_f,11,2)+"  |"
      q[i]=str(mvat("F"))+" %"              
	  i=i+1
	endif  
    if.not.zrnet_z=0
      t[i]=str(zrnet_z,11,2)+space(5)+str(zrvat_z,11,2)+"     "+str(zrbrut_z,11,2)+"  |"
      q[i]="        zw"+". "       
	  i=i+1
	endif  			
	if.not.empty(t[1])				
      @ w,0 say "|"
	  @ w,5 say "|"
	  @ w,37 say "|"
	  @ w,55 say "|"
	  @ w,57 say wtymzestawka
	  @ w,121 say "|"
	  w=w+1
      @ w,0 say "|"
	  @ w,5 say "|"
	  @ w,37 say "|"
	  @ w,55 say "|"	
	  @ w,57 say q[1]+space(7)+t[1]
	  w=w+1
    endif
    i=2
	do while.t.
      if.not.empty(t[i])
        @ w,0 say "|"
	    @ w,5 say "|"
	    @ w,37 say "|"
	    @ w,55 say "|"	  
        @ w,57 say  q[i]+space(7)+t[i]
		w=w+1         	  
	  endif
	  i=i+1
	  if i>7
	    exit
	  endif
	enddo
**

@ w,0 say ltxt2
w=w+1
@ w,0 say ltxt1
w=w+1

RETURN 

FUNCTION R_DOKSUM_STOPA()
local ltxt1:="=========================================================================================================================|" 
local t[7],q[7],i
for i=1 to 7
  t[i]:=space(73)
  q[i]:=space(2)
next
i=1
**
    if.not.zsnet_a=0
      t[i]=str(zsnet_a,11,2)+space(5)+str(zsvat_a,11,2)+"     "+str(zsbrut_a,11,2)+"  |"
      q[i]=str(mvat("A"))+" %"       
	  i=i+1
	endif  
    if.not.zsnet_b=0
      t[i]=str(zsnet_b,11,2)+space(5)+str(zsvat_b,11,2)+"     "+str(zsbrut_b,11,2)+"  |"
      q[i]=str(mvat("B"))+" %"              
	  i=i+1
	endif  
    if.not.zsnet_c=0
      t[i]=str(zsnet_c,11,2)+space(5)+str(zsvat_c,11,2)+"     "+str(zsbrut_c,11,2)+"  |"
      q[i]=str(mvat("C"))+" %"       
	  i=i+1
	endif  
    if.not.zsnet_d=0
      t[i]=str(zsnet_d,11,2)+space(5)+str(zsvat_d,11,2)+"     "+str(zsbrut_d,11,2)+"  |"
      q[i]=str(mvat("D"))+" %"              
	  i=i+1
	endif  
    if.not.zsnet_e=0
      t[i]=str(zsnet_e,11,2)+space(5)+str(zsvat_e,11,2)+"     "+str(zsbrut_e,11,2)+"  |"
      q[i]=str(mvat("E"))+" %"              
	  i=i+1
	endif  
    if.not.zsnet_f=0
      t[i]=str(zsnet_f,11,2)+space(5)+str(zsvat_f,11,2)+"     "+str(zsbrut_f,11,2)+"  |"
      q[i]=str(mvat("F"))+" %"              
	  i=i+1
	endif  
    if.not.zsnet_z=0 
	  t[i]=str(zsnet_z,11,2)+space(5)+str(zsvat_z,11,2)+"     "+str(zsbrut_z,11,2)+"  |"
      q[i]="        zw"+". "       
	  i=i+1
	endif  						
    @ w,0 say ltxt1
    w=w+1
	@ w,55 say "|   Razem:"
	@ w,76 say str(zsnet_all,11,2)+space(5)+str(zsvat_all,11,2)+"     "+str(zsbrut_all,11,2)+"  |"
	w=w+1
	@ w,55 say "|"
	@ w,57 say wtymzestawka
	@ w,121 say "|"
	w=w+1
	@ w,55 say "|"	
	@ w,57 say q[1]+space(7)+t[1]
    w=w+1
    i=2
	do while.t.
      if.not.empty(t[i])
	    @ w,55 say "|"	  
        @ w,57 say  q[i]+space(7)+t[i]
		w=w+1         	  
	  endif
	  i=i+1
	  if i>7
	    exit
	  endif
	enddo
	@ w,55 say "|"
	@ w,121 say "|"
	w=w+1
	@ w,55 say replicate("=",66)
	
**

RETURN


****************************RAPORT: ZESTAWIENIE TOWARàW
FUNCTION TOWSPRZEDAZ_RAP()
local ek, lcolor:=setcolor()
save screen to ek
do while.t.
  if r_parametry()
    zest_trap()  
  else
    exit
  endif
enddo  
select &rap_sel
restore screen from ek
setcolor(lcolor)
RETURN

FUNCTION ILE_BO_ZAK_SP()
local ek, lcolor:=setcolor()
save screen to ek
zile_bo_zak_sp=.t.
  f_tdat1=ctod("01.01."+str(year(date())))
  f_tdat2=date()
  zokres_def=3
do while.t.
  if r_parametry()
    ilebozaksp()  
  else
    exit
  endif
enddo  
zile_bo_zak_sp=.f.
select &rap_sel
restore screen from ek
setcolor(lcolor)
RETURN


FUNCTION R_PARAMETRY()
local lokreswar,ek,lpoz:=1,ek1,lcolor:=setcolor()
*f_tnaz:=space(32)
*f_tkod:=space(7)
*f_tgrup:=space(3)
*if zile_bo_zak_sp
*  f_tdat1=ctod("01.01."+str(year(date())))
*  f_tdat2=date()
*  zokres_def=3
*else
*  f_tdat1=date()
*  f_tdat2=date()
*  f_tmiesiac=month(date())
*endif  
save screen to ek

kj_okno(0,0,10, " KJ_LEGOS - RAPORTY                                                             ",2)
g_tlo()

do while.t.
  select &rap_sel
  an_lad()  
  tzestpar_say(zokres_def,zdruk_def,zknum_rap)
  lpoz=zestd_menu(lpoz)
  if lastkey()=27
    return .f.
  endif
  do case
    case lpoz=1
      if zdruk_def=1
        if reclock(5)      
          replace an_numer with zan_numer
          unlock
	    else
          kj_tkom(8," Uwaga! "," Wykryto problem w numeracji raport¢w !","Przerwij prac© innych aplikacji i ponow pr¢b©.","Nacisnij dowolny klawisz.",5)
	    endif
	  endif	  
	  return .t.
	case lpoz=2
	  tparget_rap()
	case lpoz=3
	  return .f.
  endcase
enddo
RETURN .f.

****************************PARAMETRY RAPORTU TOWSPRZEDAZ_RAP
FUNCTION TPARGET_RAP()
local ek,lcolor:=setcolor(),lpoz:=1,lpoz1:=1,lpoz2:=1
local lokrestxt:="Dzieä ...",lok_def:=1,ldruk_def:=1
local ek1,ek2,ek3
*f_tnaz:=space(32)
*f_tkod:=space(7)
*f_tgrup:=space(3)
*if.not.zile_bo_zak_sp
*  f_tdat1=date()
*  f_tdat2=date()
*endif
*f_tmiesiac=month(date())
      save screen to ek     
	  do while.t.
	    restore screen from ek
		tzestpar_say(zokres_def,zdruk_def,zknum_rap)
	    if ztowar_filtr
		  lpoz1=zestpar_menu(lpoz1,3)
		else
		  lpoz1=zestpar_menu(lpoz1,2)
		endif  
        if lastkey()=27
	      keyboard chr(205)
		  exit
	    endif
	    do case
	      case lpoz1=1.and..not.zile_bo_zak_sp
	        lpoz2=zestokres_menu(lpoz2)
		    set cursor on
			do case
		      case lpoz2=1
                @ 11,24 say space(44)
				@ 11,37 get f_tdat1 when s_kom("Zatwierd« dat© obj©tych raportem dokument¢w.")
		      case lpoz2=2
			    @ 11,25 say space(44)
                @ 11,25 say "Miesi¥c .... " get f_tmiesiac range 1,12 when s_kom("Zatwierd« miesi¥c obj©tych raportem dokument¢w.")
		      case lpoz2=3
			    @ 11,25 say space(44)
                @ 11,35 get f_tdat1 when s_kom("Zatwierd« dat© pocz¥tkow¥ obj©tych raportem dokument¢w.")			  
                @ 11,58 get f_tdat2 when s_kom("Zatwierd« dat© koäcow¥ obj©tych raportem dokument¢w.")			  				
		    endcase
			read
			set cursor off
            zokres_def=lpoz2

          case lpoz1=1.and.zile_bo_zak_sp
		    f_tdat1=ctod("01.01."+str(year(date())))
			*f_tdat1=date()-20
			set cursor on
                @ 11,25 say "Od dnia .. "+dtoc(f_tdat1)+"  do dnia .. "
                @ 11,58 get f_tdat2 when s_kom("Zatwierd« dat© koäcow¥ obj©tych raportem dokument¢w.")			  				
			read
			set cursor off
            zokres_def=3

	      case lpoz1=2
            zdruk_def=zestdru_menu(zdruk_def,4,20)	    
          
		  case lpoz1=3
            rkontrah_get()

          case lpoz1=4.and.ztowar_filtr
		    rtowar_get()

		  case (lpoz1=4.and..not.ztowar_filtr).or.(lpoz1=5.and.ztowar_filtr)
            set cursor on
            do case
              case alltrim(zan_typ)=="zryczbilans"
                @ 16,54 get zrycz_odlicz picture "999999999.99" 
                @ 18,54 get zdrowotne picture "999999999.99" 
            otherwise
                @ 16,34 get zan_numer
                @ 17,34 get zan_data
                @ 18,34 get zan_miasto
                @ 19,34 get zan_sporzadzil
                @ 20,34 get zan_zatwierdzil			
		    endcase
			read 
			if.not.lastkey()=27
			  select &rap_sel
              if reclock(5)
			    an_replac()      
                unlock
			  else
			    return
			  endif	
			endif
            set cursor off
	    endcase
      enddo
restore screen from ek
RETURN


FUNCTION TZESTPAR_SAY(pokres,pdruk,pkontrah)
local lokrestxt,ldruktxt,lkontrah:=""
kj_okno(10,10,12, "  PARAMETRY RAPORTU                                          ",2)
@ 11,12 say "OKRES:  "
@ 12,12 say "WYDRUK: "
@ 13,12 say "KONTRAHENT:"
@ 15,12 say "INNE:   "

do case
  case alltrim(zan_typ)=="zryczbilans"
    @ 16,12 say "     Odliczenie od podstawy ..............."
	@ 18,12 say "     Skˆadki na ubezpieczenie zdrowotne ..."

  otherwise
    @ 16,12 say "     Numer ........."
    @ 17,12 say "     Data ......... "
    @ 18,12 say "     Miejsce ......."
    @ 19,12 say "     Sporz¥dziˆ ...."
    @ 20,12 say "     Zatwierdziˆ ..."
endcase	

do case
  case pokres=1
    lokrestxt:="Dzieä ...... "+dtoc(f_tdat1)
  case pokres=2
    lokrestxt:="Miesi¥c .... "+nazwa_miesiaca(f_tmiesiac)+"  / "+str(year(date()))+" r"			
  case pokres=3
    lokrestxt:="Od dnia .. "+dtoc(f_tdat1)+"  do dnia .. "+dtoc(f_tdat2)
endcase
do case
  case pdruk=1
    ldruktxt="DRUKARKA"
  case pdruk=2
    ldruktxt="EKRAN"	
endcase
if.not.pkontrah=0
  lkontrah=zknaz1_rap
endif
  
@ 11,25 say space(41)
@ 12,25 say space(41)
@ 13,25 say space(41)
@ 11,25 say lokrestxt
@ 12,25 say ldruktxt
@ 13,25 say lkontrah 
do case
  case alltrim(zan_typ)=="zryczbilans"
    @ 16,54 say zrycz_odlicz picture "999999999.99" 
    @ 18,54 say zdrowotne picture "999999999.99" 
  otherwise
    @ 16,34 say str(zan_numer)+zan_lamany 
    @ 17,34 say zan_data
    @ 18,34 say zan_miasto
    @ 19,34 say zan_sporzadzil
    @ 20,34 say zan_zatwierdzil
endcase
if ztowar_filtr
  if.not.empty(f_tnaz).or..not.empty(f_tkod).or..not.empty(f_tgrup)
    kj_okno(6,29,4, "  Towar:                                  ",2)  
    @ 7,31 say "Nazwa: "
	@ 8,31 say "Kod:   "
	@ 9,31 say "Grupa: "
	@ 7,38 say f_tnaz
	@ 8,38 say f_tkod
	@ 9,38 say f_tgrup 
  endif
endif
RETURN


FUNCTION RKONTRAH_GET()
local ek,select:=select()
save screen to ek
g_tlo()
k_zer()

kontrah(zk_serwer,.t.,"",1,.f.,1)		  
if lastkey()=27
  zknum=0
endif
zknum_rap=zknum
zknaz1_rap=zknaz1
select &select
restore screen from ek
RETURN 

***************************RAPORT:ZESTAWIENIE TOWARàW W CENACH ZAK i SP NETTO
FUNCTION ZEST_TRAP()
local ek,lcolor:=setcolor(),t[50]
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
if zanalplik
  select &analplik_sel
  use anplik
  zap
endif
tow_use(.f.)
set order to 3
do case
  case zokres_def=1
    rapwar="f_datdok(f_tdat1).and.f_dtyp(zdoktyp).and..not.tanul"
  case zokres_def=2
	rapwar="f_miesdok(f_tmiesiac).and.f_dtyp(zdoktyp).and..not.tanul"	
  case zokres_def=3
    rapwar="f_2datdok(f_tdat1,f_tdat2).and.f_dtyp(zdoktyp).and..not.tanul"
endcase
if.not.zknum_rap=0
  rapwar=rapwar+".and.frap_kontrah()"
endif
if ztowar_filtr.and..not.empty(f_tnaz)
  rapwar=rapwar+".and.substr(tnaz,1,len(alltrim(f_tnaz)))=alltrim(f_tnaz)"
endif
if ztowar_filtr.and..not.empty(f_tkod)
  rapwar=rapwar+".and.substr(tkod,1,len(alltrim(f_tkod)))=alltrim(f_tkod)"
endif
if ztowar_filtr.and..not.empty(f_tgrup)
*  rapwar=rapwar+".and.substr(tgrup,1,len(alltrim(f_tgrup)))=alltrim(f_tgrup)"
  rapwar=rapwar+".and.alltrim(tgrup)=alltrim(f_tgrup)"
endif


kj_okno(4,20,4, "  C z e k a j  ! !                      ",2)
set color to n/w*
@ 6,28 say "Trwaj¥ operacje dyskowe."
setcolor(lcolor)

select &tow_sel
set filter to &rapwar
go top
if zdruk_def=1
  if.not.start_druk()
    set device to screen
 	return .f.
  endif
 * set printer to
else
  plik="wydruki\r_sp_tow.txt"
  set printer to &plik
endif


set device to printer
*w=prow()
  do case
    case zan_def3=1
	  zan_klucz="Klucz=ILO—"
    case zan_def3=2
	  zan_klucz="Klucz=OBRàT"
    case zan_def3=3
	  zan_klucz="Klucz=ZYSK"
  endcase

r_sptow_tyt()
do while.not.eof()
  vpoz=vpoz+1
  ztow_lad()

  vilosc_sum=0
  vwart_zak=0
  vwart_sp=0
  do while tnaz=ztnaz.and.tkod=ztkod.and.tjm=ztjm
    vilosc_sum=vilosc_sum+til
	vwart_zak=vwart_zak+kj_round(til*tcen_ew,2)
	vwart_sp=vwart_sp+kj_round(til*tcen,2)    
    skip
  enddo  
  vcen_zak=kj_round(vwart_zak/vilosc_sum,2)
  vcen_sp=kj_round(vwart_sp/vilosc_sum,2)  
  if zanalplik
    select &analplik_sel
	append blank
    replace anazwa with ztnaz,akod with ztkod,ail with vilosc_sum
	replace ajm with ztjm,acen_zak with vcen_zak,acen_sp with vcen_sp
	replace	aobrot with vwart_sp,azysk with vwart_sp-vwart_zak
	replace amagaz with ztmagaz,agrup with ztgrup,adekret with ztdekret
	replace astawka with ztstawka,asymbol with ztsymbol,azwolniony with ztzwolniony
	replace awyroznik with ztwyroznik,akormag with ztkormag,aster with ztster
	select &tow_sel
  else
    r_sptow_wiersz()
	vzak_all=vzak_all+vwart_zak
    vsp_all=vsp_all+vwart_sp
  endif	

enddo
close
if zanalplik
  select &analplik_sel
**                      pole an_def3 decydyje o kluczu 
  do case
    case zan_def3=1
*	  zan_klucz="Klucz=ILO—"
	  index on descend(ail) to an_ilosc
    case zan_def3=2
*	  zan_klucz="Klucz=OBRàT"
	  index on descend(aobrot) to an_obrot	  
    case zan_def3=3
*	  zan_klucz="Klucz=ZYSK"
	  index on descend(azysk) to an_zysk	  
    case zan_def3=4
*	  zan_klucz="Klucz=NAZWA"
	  index on anazwa to an_nazwa	  	  
    case zan_def3=5
*	  zan_klucz="Klucz=KOD"
	  index on akod to an_kod	  	  	  
  endcase

  go top
  if.not.zan_def4=0  &&an_def4 przechowuje informacj© o ilo˜ci pozostawionych w raporcie rekordach licz¥c od pierwszego
    vpoz=0
	do while.not.eof()
	  vpoz=vpoz+1
	  if vpoz>zan_def4
	    delete
	  endif
	  skip
	enddo  
  endif
  go top
  vpoz=0
  do while.not.eof()
    vpoz=vpoz+1
	if zrozmiar
	  ztnaz=anazwa
	else
	  ztnaz=substr(anazwa,1,32)
	endif  
	if z2kod
	  ztkod=akod
	else
	  ztkod=substr(akod,1,7)
	endif  
	vilosc_sum=ail
	ztjm=ajm
	vcen_zak=acen_zak
	vcen_sp=acen_sp
	vwart_zak=aobrot-azysk
	vwart_sp=aobrot
	r_sptow_wiersz()
	vzak_all=vzak_all+vwart_zak
    vsp_all=vsp_all+vwart_sp
	skip
  enddo
  *close

  if file("001dok\analizy\kj.txt")
    do case
      case zan_def3=1
*	    zan_klucz="Klucz=ILO—"
	    copy structure to 001dok\analizy\ran_s_il.dbf fields anazwa,ail
		select &analizy_sel
		use 001dok\analizy\ran_s_il.dbf  
        select &analplik_sel
	    go top
	    do while.not.eof()
          lanazwa=anazwa
		  lail=ail
	      select &analizy_sel
	      append blank
          replace anazwa with lanazwa,ail with lail
	      select &analplik_sel
	      skip
	    enddo
		
      case zan_def3=2
*	    zan_klucz="Klucz=OBRàT"
	    copy structure to 001dok\analizy\ran_s_ob.dbf fields anazwa,aobrot
		select &analizy_sel
		use 001dok\analizy\ran_s_ob.dbf  
        select &analplik_sel
	    go top
	    do while.not.eof()
          lanazwa=anazwa
		  laobrot=aobrot
	      select &analizy_sel
	      append blank
          replace anazwa with lanazwa,aobrot with laobrot
	      select &analplik_sel
	      skip
	    enddo		
      case zan_def3=3
*	    zan_klucz="Klucz=ZYSK"
	    copy structure to 001dok\analizy\ran_s_zy.dbf fields anazwa,azysk
		select &analizy_sel
		use 001dok\analizy\ran_s_zy.dbf  
        select &analplik_sel
	    go top
	    do while.not.eof()
          lanazwa=anazwa
		  lazysk=azysk
	      select &analizy_sel
	      append blank
          replace anazwa with lanazwa,azysk with lazysk
	      select &analplik_sel
	      skip
	    enddo		
    endcase	 

*    select &analplik_sel
*	go top
*	do while.not.eof()
*      for i=1 to fcount()
*	    t[i]:=fieldget(i)
*	  next		  
*	  select &analizy_sel
*	  append blank
*	  for i=1 to fcount()
*	    fieldput(i,t[i])
*	  next
*	  select &analplik_sel
*	  skip
*	enddo

	close
	select &analizy_sel
	close
	 
  endif


  
*  wydruk z pliku
endif
r_sptow_stopa()
end_rap()

eject
**
set device to screen
if.not.zdruk_def=1
  edi=edit+" wydruki\r_sp_tow.txt"
  run &edi 
  restore screen from ek
  set cursor off   
endif

restore screen from ek
RETURN


FUNCTION ILEBOZAKSP()
local ek,lcolor:=setcolor(),lbo_jest:=.f.,lmindex
local lboil:=0,lbocen:=0,lpozwartosc:=0
public rapwar:=".t."
private vpoz:=0
private vbo_il:=0,vbo_cen:=0,zak_il:=0,zak_cen:=0,sp_il:=0,sp_cen:=0
private sp_wartosc:=0,zak_wartosc:=0,stan_wartosc:=0,stan_il:=0,stan_all_wartosc:=0
public zdoktyp:=alltrim(substr(zan_txt,1,20))
public_rap()
public_srap()
zrap_zer()
zsrap_zer()
save screen to ek
if mag_use(1)
  set order to 1
else
    kj_tkom(8," Uwaga! "," Brak dost©pu do bazy magazynowej !","Raport nie mo¾e by† wykonany. ","",5)
	return
endif	
*if.not.znew_1
if file("bo.dbf")
  if bo_use(1)
    set order to 4
	lbo_jest=.t.
  else
    lbo_jest=.f.
  endif
endif  
dok_use()
set order to 3
tow_use(.f.)
set order to 2
do case
  case zokres_def=1
    rapwar="f_datdok(f_tdat1).and.f_dtyp(zdoktyp).and..not.tanul"
  case zokres_def=2
	rapwar="f_miesdok(f_tmiesiac).and.f_dtyp(zdoktyp).and..not.tanul"	
  case zokres_def=3
    rapwar="f_2datdok(f_tdat1,f_tdat2).and.f_dtyp(zdoktyp).and..not.tanul"
endcase
if.not.zknum_rap=0
  rapwar=rapwar+".and.frap_kontrah()"
endif

kj_okno(4,20,4, "  C z e k a j  ! !                      ",2)
set color to n/w*
@ 6,28 say "Trwaj¥ operacje dyskowe."
setcolor(lcolor)

select &tow_sel
set filter to &rapwar
go top

if zdruk_def=1
  set printer to 
  if.not.start_druk()
    set device to screen
 	return .f.
  endif
 * set printer to
else
  plik="wydruki\ile_bo_zak.txt"
  set printer to &plik
endif

set device to printer
ile_bo_tyt()
select &gmag_sel
public zmagfiltr:=".t."
**
if ztowar_filtr.and..not.empty(f_tnaz)
  zmagfiltr=zmagfiltr+".and.substr(mnaz,1,len(alltrim(f_tnaz)))=alltrim(f_tnaz)"
  set filter to &zmagfiltr
  go top
  zmagfiltr=dbfilter()
endif
if ztowar_filtr.and..not.empty(f_tkod)
  zmagfiltr=zmagfiltr+".and.substr(mkod,1,len(alltrim(f_tkod)))=alltrim(f_tkod)"
  set filter to &zmagfiltr
  go top
  zmagfiltr=dbfilter()
endif
if ztowar_filtr.and..not.empty(f_tgrup)
  zmagfiltr=zmagfiltr+".and.alltrim(mgrup)=alltrim(f_tgrup)"
  set filter to &zmagfiltr
  go top
  zmagfiltr=dbfilter()
endif
**
do while.not.eof()
  lboil=0
  lbocen=0
  lpozwartosc=0
  zmag_lad()  
  vbo_il=0
  sp_il=0
  zak_il=0
  zak_wartosc=0
  vpoz=vpoz+1
  if lbo_jest
      select &gbo_sel
      *if kj_mseek(ztnaz,ztkod,ztjm)
      set order to 4
	  seek zmindex
	  if found()
		do while mindex=zmindex
		  lboil=lboil+mil
		  lpozwartosc=lpozwartosc+kj_round(mil*kj_round(mcen_m,2),2)
		  skip
		enddo
		vbo_il=lboil
	    if.not.lboil=0
		  vbo_cen=kj_round(lpozwartosc/lboil,2)
		else
		  vbo_cen=0
		endif  
	  endif
      select &tow_sel
  else
	vbo_il=bo_il
	vbo_cen=bo_cen
  endif
  select &tow_sel
  lmindex=str(zmindex)
  seek lmindex
  if found()
    do while tmindex=zmindex
      if.not.tanul
	    do case
          case substr(tndow,10,1)$sprzedaz_gr
	        sp_il=sp_il+til
          case substr(tndow,10,1)$zakup_gr
	        zak_il=zak_il+til	   
            zak_wartosc=zak_wartosc+kj_round(til*kj_round(tcen,2),2)
        endcase
      endif
	  skip
    enddo  
  else
    skip
  endif
  *zak_cen=kj_round((vbo_il*kj_round(vbo_cen,2)+zak_wartosc)/(vbo_il+zak_il),2)
  zak_cen=kj_round((lpozwartosc+zak_wartosc)/(vbo_il+zak_il),2)
  stan_il=vbo_il+zak_il-sp_il
  stan_wartosc=kj_round(stan_il*zak_cen,2)
  stan_all_wartosc=stan_all_wartosc+stan_wartosc
  ile_bo_wiersz()
  select &gmag_sel
  skip
enddo
close
if.not.znew_1
  select &gbo_sel
  close
endif
select &tow_sel
close

ile_bo_stopa()
end_rap()

eject
**
set device to screen
if.not.zdruk_def=1
  edi=edit+" wydruki\ile_bo_zak.txt"
  run &edi 
  restore screen from ek
  set cursor off   
endif

restore screen from ek
RETURN

FUNCTION oldILEBOZAKSP()
local ek,lcolor:=setcolor(),lbo_jest:=.f.
public rapwar:=".t."
private vpoz:=0
private vbo_il:=0,vbo_cen:=0,zak_il:=0,zak_cen:=0,sp_il:=0,sp_cen:=0
private sp_wartosc:=0,zak_wartosc:=0,stan_wartosc:=0,stan_il:=0,stan_all_wartosc:=0
public zdoktyp:=alltrim(substr(zan_txt,1,20))
public_rap()
public_srap()
zrap_zer()
zsrap_zer()
save screen to ek
if.not.znew_1
  if bo_use(1)
    set order to 4
	lbo_jest=.t.
  endif
else
  if mag_use(1)
    set order to 4
	lbo_jest=.t.
  else
    kj_tkom(8," Uwaga! "," Brak dost©pu do bazy magazynowej !","Raport nie mo¾e by† wykonany. ","",5)
	return
  endif	
endif
dok_use()
set order to 3
tow_use(.f.)
set order to 3
do case
  case zokres_def=1
    rapwar="f_datdok(f_tdat1).and.f_dtyp(zdoktyp).and..not.tanul"
  case zokres_def=2
	rapwar="f_miesdok(f_tmiesiac).and.f_dtyp(zdoktyp).and..not.tanul"	
  case zokres_def=3
    rapwar="f_2datdok(f_tdat1,f_tdat2).and.f_dtyp(zdoktyp).and..not.tanul"
endcase
if.not.zknum_rap=0
  rapwar=rapwar+".and.frap_kontrah()"
endif

kj_okno(4,20,4, "  C z e k a j  ! !                      ",2)
set color to n/w*
@ 6,28 say "Trwaj¥ operacje dyskowe."
setcolor(lcolor)

select &tow_sel
set filter to &rapwar
go top

if zdruk_def=1
  set printer to 
  if.not.start_druk()
    set device to screen
 	return .f.
  endif
 * set printer to
else
  plik="wydruki\ile_bo_zak.txt"
  set printer to &plik
endif

set device to printer
*w=prow()
*r_sptow_tyt()
ile_bo_tyt()
do while.not.eof()
  vbo_il=0
  sp_il=0
  zak_il=0
  zak_wartosc=0
  vpoz=vpoz+1
  ztow_lad()
  if.not.znew_1
    if lbo_jest
      select &gbo_sel
      *if kj_mseek(ztnaz,ztkod,ztjm)
	  seek ztmindex
	  if found()
		vbo_il=mil
	    vbo_cen=mcen_m
	  endif
      select &tow_sel
    endif  
  else
    if lbo_jest
      select &gmag_sel
      *if kj_mseek(ztnaz,ztkod,ztjm)
	  seek ztmindex
	  if found()
		vbo_il=bo_il
	    vbo_cen=bo_cen
	  endif
      select &tow_sel
    endif  
  endif
  do while tnaz=ztnaz.and.tkod=ztkod.and.tjm=ztjm
    if.not.tanul
	  do case
        case substr(tndow,10,1)$sprzedaz_gr
	      sp_il=sp_il+til
        case substr(tndow,10,1)$zakup_gr
	      zak_il=zak_il+til	   
          zak_wartosc=zak_wartosc+kj_round(til*kj_round(tcen,2),2)
      endcase
    endif
	skip
  enddo  
  zak_cen=kj_round((vbo_il*kj_round(vbo_cen,2)+zak_wartosc)/(vbo_il+zak_il),2)
  stan_il=vbo_il+zak_il-sp_il
  stan_wartosc=kj_round(stan_il*zak_cen,2)
  stan_all_wartosc=stan_all_wartosc+stan_wartosc
  ile_bo_wiersz()
enddo
close
if.not.znew_1
  select &gbo_sel
else
  select &gmag_sel
endif
close
ile_bo_stopa()
end_rap()

eject
**
set device to screen
if.not.zdruk_def=1
  edi=edit+" wydruki\ile_bo_zak.txt"
  run &edi 
  restore screen from ek
  set cursor off   
endif

restore screen from ek
RETURN



FUNCTION R_SPTOW_TYT()
local ltxt1:="==================================================================================================================================="
local ltxt2:="|     |                                |       |            |    |   Srednia cena NETTO    |    Warto˜† wg. cen      |            |"
local ltxt3:="| Lp. | Nazwa towaru                   | Kod   | lo˜†       | Jm.| Zakupu     | Sprzeda¾y  | Zakupu     | Sprzeda¾y  | Zysk       |"
local ltxt4:="|=====|================================|=======|============|====|============|============|============|============|============|"
local ltxt5:="|     |                                |       |            |    |            |            |            |            |            |"
r_tyt()
if zan_def3>0
  w=w+1
  @ w,0 say zan_klucz
endif
w=w+2
@ w,0 say &zdr_kond+ltxt1
w=w+1
@ w,0 say ltxt2
w=w+1
@ w,0 say ltxt3
w=w+1
@ w,0 say ltxt4

RETURN 

FUNCTION R_SPTOW_WIERSZ()
local lnaz,lrozmiar
w=w+1
@ w,0 say "|"
@ w,1 say vpoz picture "99999"
*@ w,7 say stuff("................................",1,len(alltrim(ztnaz)),alltrim(ztnaz))
if zrozmiar
      lnaz=alltrim(substr(ztnaz,1,32))
	  lrozmiar=substr(ztnaz,33)  
  naz_druk(lnaz,lrozmiar,0,7,130)
else  
  @ w,7 say stuff("................................",1,len(alltrim(ztnaz)),alltrim(ztnaz))
endif
@ w,40 say substr(ztkod,1,7)
*@ w,48 say vilosc_sum picture "999999999.99"
@ w,48 say vilosc_sum picture mag_picture
@ w,62 say ztjm
@ w,66 say vcen_zak picture "999999999.99"
@ w,79 say vcen_sp picture "999999999.99"
@ w,92 say vwart_zak picture "999999999.99"
@ w,105 say vwart_sp picture "999999999.99"
@ w,118 say vwart_sp-vwart_zak picture "999999999.99"
@ w,130 say "|"
if z2kod.and..not.empty(substr(ztkod,8))
  w=w+1
  @ w,0 say "|"
  @ w,40 say substr(ztkod,8)
  @ w,130 say "|"
endif
RETURN


FUNCTION R_SPTOW_STOPA()
local ltxt1:="==============================================================================|============|============|============|============|"
local ltxt2:="                                                                              |            |            |            |            |"
local ltxt3:="                                                                              ====================================================="
w=w+1
@ w,0 say ltxt1
*w=w+1
*@ w,0 say ltxt2
w=w+1
@ w,78 say "|"
@ w,79 say "   Razem:"
@ w,92 say vzak_all picture "999999999.99"
@ w,105 say vsp_all picture "999999999.99"
@ w,118 say vsp_all-vzak_all picture "999999999.99"
@ w,130 say "|"
*w=w+1
*@ w,0 say ltxt2
w=w+1
@ w,0 say ltxt3
RETURN


FUNCTION ILE_BO_TYT()
local ltxt1:="==================================================================================================================================="
local ltxt2:="|     |                                |       |                  I   L   O   —                   |J. | —rednia cena|  Warto˜†   |"
local ltxt3:="| Lp. | Nazwa towaru                   | Kod   |     B O    |  Przyj©to  |   Wydano   |  Dost©pna  | m.|    zakupu   |            |"
local ltxt4:="|=====|================================|=======|============|============|============|============|===|=============|============|"
local ltxt5:="|     |                                |       |            |            |            |            |   |             |            |"
r_tyt()

w=w+2
@ w,0 say &zdr_kond+ltxt1
w=w+1
@ w,0 say ltxt2
w=w+1
@ w,0 say ltxt3
w=w+1
@ w,0 say ltxt4
RETURN 

FUNCTION ILE_BO_WIERSZ()
local lnaz,lrozmiar
w=w+1
@ w,0 say "|"
@ w,1 say vpoz picture "99999"
*@ w,7 say stuff("................................",1,len(alltrim(ztnaz)),alltrim(ztnaz))
if zrozmiar
      lnaz=alltrim(substr(zmnaz,1,32))
	  lrozmiar=substr(zmnaz,33)  
  naz_druk(lnaz,lrozmiar,0,7,130)
else  
  @ w,7 say stuff("................................",1,len(alltrim(zmnaz)),alltrim(zmnaz))
endif
@ w,40 say substr(zmkod,1,7)
@ w,48 say vbo_il picture mag_picture
@ w,61 say zak_il picture mag_picture
@ w,74 say sp_il picture mag_picture
@ w,87 say stan_il picture mag_picture
@ w,100 say zmjm
@ w,104 say zak_cen picture "999999999.99"
@ w,118 say stan_wartosc picture "999999999.99"
@ w,130 say "|"
if z2kod.and..not.empty(substr(zmkod,8))
  w=w+1
  @ w,0 say "|"
  @ w,40 say substr(zmkod,8)
  @ w,130 say "|"
endif
RETURN

FUNCTION ILE_BO_STOPA()
local ltxt1:="=======================================================================================================|=============|============|"
local ltxt2:="                                                                                                                     |            |"
local ltxt3:="                                                                                                       ============================"
w=w+1
@ w,0 say ltxt1
w=w+1
@ w,103 say "|"
@ w,105 say "   Razem:"
@ w,118 say stan_all_wartosc picture "999999999.99"
@ w,130 say "|"
w=w+1
@ w,0 say ltxt3
RETURN



*************************************************HISTORIA TOWARàW
FUNCTION T_HISDRUK()
local ek,lplik:="WYDRUKI\",lat_plik:=alltrim(zat_plik)
private vhiswar:=0,vpoz:=0
lplik=lplik+lat_plik
save screen to ek
zdruk_def=zestdru_menu(zdruk_def,20,1)	    
if zdruk_def=1
  if.not.start_druk()
    set device to screen
 	return .f.
  endif
 * set printer to
else
*  plik="wydruki\his_tow.txt"
 * set printer to &plik
 set printer to &lplik
endif
dok_use()
set order to 3
select &tow_sel
go top
set device to printer
*w=prow()
r_histow_tyt()
do while.not.eof()
  vpoz=vpoz+1
  hiswiersz()
  vhiswar=vhiswar+kj_round(til*tcen,2)  
  skip
enddo
r_histow_stopa()
end_rap()
eject


set device to screen
if.not.zdruk_def=1
  *edi=edit+" wydruki\his_tow.txt"
  edi=edit+" "+lplik
  run &edi 
  restore screen from ek
  set cursor off   
endif
RETURN 

FUNCTION R_HISTOW_TYT()
local ltxt1:="====================================================================================================================================="
local ltxt2:="| Lp.|     Numer      |   Data   | Kontrahent   | Nazwa towaru                   |  Kod  |    Ilo˜†   |Jm.|   Cena     |  Warto˜†   |"
local ltxt3:="|    |   dokumentu    |          |              |                                |       |            |   |   NETTO    |  NETTO     |"
local ltxt4:="|====|================|==========|==============|================================|=======|============|===|============|============|"
if substr(zat_index,2,1)=="B"
  ltxt3="|    |   dokumentu    |          |              |                                |       |            |   |   BRUTTO   |  BRUTTO    |"
endif
@ w,0 say &zdr_kond
@ w,80 say zan_miasto
@ w,112 say dtoc(zan_data)+&zdr_kkond
w=w+2
*@ w,0 say alltrim(zan_tytul)+space(2)+str(zan_numer,3)+zan_lamany
@ w,0 say alltrim(zan_tytul)
w=w+2
@ w,0 say &zdr_kond+ltxt1
w=w+1
@ w,0 say ltxt2
w=w+1
@ w,0 say ltxt3
w=w+1
@ w,0 say ltxt4
RETURN

FUNCTION HISWIERSZ()
local ltndok:=tndok(),ltcen:=0
w=w+1
@ w,0 say "|"
@ w,1 say vpoz picture "9999"
if zdtyp$dowod_gr
  @ w,6 say tndow
 * @ w,23 say tdatdow
  @ w,23 say zddatdow
else
  @ w,6 say ltndok
  @ w,23 say zddatdok
endif  
@ w,35 say substr(zdnskrot,1,12)
*@ w,49 say stuff("................................",1,len(alltrim(tnaz)),alltrim(tnaz))
if zrozmiar
      lnaz=alltrim(substr(ztnaz,1,32))
	  lrozmiar=substr(ztnaz,33)  
  naz_druk(lnaz,lrozmiar,0,49,132)
else  
  @ w,49 say stuff("................................",1,len(alltrim(tnaz)),alltrim(tnaz))  
endif
@ w,82 say stuff(".......",1,len(alltrim(tkod)),alltrim(tkod))
*@ w,90 say til picture "99999999.999"
@ w,90 say til picture mag_picture
@ w,103 say tjm
if substr(zat_index,2,1)=="B"
  ltcen=kj_round(tcen*((100+tstawka)/100),2)
  @ w,107 say ltcen picture "999999999.99" 
  @ w,120 say kj_round(til*ltcen,2) picture "999999999.99"
else
  @ w,107 say tcen picture "999999999.99" 
  @ w,120 say kj_round(til*tcen,2) picture "999999999.99"
endif
@ w,132 say "|"
RETURN


FUNCTION R_HISTOW_STOPA()
local ltxt1:="====================================================================================================================================="
local ltxt2:="                                                                                                          ==========================="
w=w+1
@ w,0 say ltxt1
w=w+1
@ w,106 say "|"
@ w,108 say "Razem:"
@ w,120 say vhiswar picture "999999999.99"
@ w,132 say "|"
w=w+1
@ w,0 say ltxt2
RETURN

*********************************** KONIEC HISTORII TOWARàW

FUNCTION END_RAP()
w=w+10
if.not.empty(zan_sporzad)
  @ w,0 say "Sporz¥dziˆ:  "+zan_sporzad+"            ....................                         ....................."
  w=w+1
  @ w,0 say space(43)+                  "                    Podpis                                       Piecz©†      "                      
  w=w+5
endif
if.not.empty(zan_zatwierdzil)
  @ w,0 say "Zatwierdziˆ:  "+zan_zatwierdzil+"           ....................                         ....................."
  w=w+1
  @ w,0 say space(43)+                  "                   Podpis                                       Piecz©†      "                      
endif
RETURN


*****************RAPORT:ZESTAWIENIE TOWARàW W CENACH zparametryzowanych
FUNCTION ZEST_TOW(pcen_rodz)
local ek, lcolor:=setcolor(),lcen_rodz:=pcen_rodz

save screen to ek
set device to screen
if empty(zan_txt)
  zdtyp="F"
else
  zdtyp=substr(zan_txt,1,1)
endif
zdznak=zdtyp
do while.t.
  if r_parametry()

    zest_towdruk(lcen_rodz)  
  else
    exit
  endif
enddo
select &rap_sel
restore screen from ek
setcolor(lcolor)
RETURN


FUNCTION ZEST_TOWDRUK(pcen_rodz)
local ek,lcolor:=setcolor(),lcen_rodz:=pcen_rodz
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
set order to 3
if.not.empty(zdoktyp)
  if zdtyp$dowod_gr
    do case
      case zokres_def=1
        rapwar="f_datdow(f_tdat1).and.f_dtyp(zdoktyp).and..not.tanul"
      case zokres_def=2
	    rapwar="f_miesdow(f_tmiesiac).and.f_dtyp(zdoktyp).and..not.tanul"	
      case zokres_def=3
        rapwar="f_2datdow(f_tdat1,f_tdat2).and.f_dtyp(zdoktyp).and..not.tanul"
    endcase
  else
    do case
      case zokres_def=1
        rapwar="f_datdok(f_tdat1).and.f_dtyp(zdoktyp).and..not.tanul"
      case zokres_def=2
	    rapwar="f_miesdok(f_tmiesiac).and.f_dtyp(zdoktyp).and..not.tanul"	
      case zokres_def=3
        rapwar="f_2datdok(f_tdat1,f_tdat2).and.f_dtyp(zdoktyp).and..not.tanul"
    endcase
  endif
else
  if zdtyp$dowod_gr
    do case
      case zokres_def=1
        rapwar="f_datdow(f_tdat1).and..not.tanul"
      case zokres_def=2
	    rapwar="f_miesdow(f_tmiesiac).and..not.tanul"	
      case zokres_def=3
        rapwar="f_2datdow(f_tdat1,f_tdat2).and..not.tanul"
    endcase  
  else
    do case
      case zokres_def=1
        rapwar="f_datdok(f_tdat1).and..not.tanul"
      case zokres_def=2
	    rapwar="f_miesdok(f_tmiesiac).and..not.tanul"	
      case zokres_def=3
        rapwar="f_2datdok(f_tdat1,f_tdat2).and..not.tanul"
    endcase
  endif
endif
if.not.zknum_rap=0
  rapwar=rapwar+".and.frap_kontrah()"
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
  if.not.start_druk()
    set device to screen
 	return .f.
  endif
  *set printer to
else
  plik="wydruki\towszcz.txt"
  set printer to &plik
endif
bufor_laduj(lcen_rodz)
go top

tplik_sum(".not.eof()")
go top
set device to printer

do case
  case zan_def2=0
    r_drtow_szcz()    
	eject

  case zan_def2=1
    r_drtow_szcz()    
	eject
    set device to screen
	if kj_gkom(12," ","Drukowa† posdsumowanie ?","",.t.,5)	
	  set device to printer
	  r_drtow_sum()    
      eject
	endif	
  case zan_def2=2
    r_drtow_szcz()    
	eject
	r_drtow_sum()
	eject    
  case zan_def2=3
	r_drtow_sum()    	
	eject
endcase

    set device to screen
    if.not.zdruk_def=1
      edi=edit+" wydruki\towszcz.txt"
      run &edi 
      restore screen from ek
      set cursor off   
    endif
**


restore screen from ek
RETURN

FUNCTION R_DRTOW_SZCZ()
private vpoz:=0

rt_szcz_tyt()
select &buf_sel
go top
do while.not.eof()
  vpoz=vpoz+1
  rt_szcz_wiersz()
  skip
enddo
close
rt_szcz_stopa()
end_rap()
eject
RETURN

FUNCTION RT_SZCZ_WIERSZ()
local lrozmiar,lnaz
w=w+1
@ w,0 say "|"
@ w,1 say vpoz picture "99999"
*@ w,7 say stuff("................................",1,len(alltrim(tnaz)),alltrim(tnaz))
if zrozmiar
      lnaz=alltrim(substr(tnaz,1,32))
	  lrozmiar=substr(tnaz,33)  
  naz_druk(lnaz,lrozmiar,0,7,117)
else  
  @ w,7 say stuff("................................",1,len(alltrim(tnaz)),alltrim(tnaz))  
endif
@ w,40 say substr(tkod,1,7)
*@ w,48 say til picture "99999999.999"
@ w,48 say til picture mag_picture
@ w,61 say tjm
*if zdtyp $ dok_brut_gr    &&060105
*  @ w,76 say brutto(tcen,tstawka) picture "999 999 999.99"
*  @ w,101 say kj_round(til*brutto(tcen,tstawka),2) picture "999 999 999.99"
*else
  @ w,76 say tcen picture "999 999 999.99"
  @ w,101 say kj_round(til*tcen,2) picture "999 999 999.99"
*endif
@ w,117 say "|"
if z2kod.and..not.empty(substr(tkod,8))
  w=w+1
  @ w,0 say "|"
  @ w,40 say substr(tkod,8)
  @ w,117 say "|"
endif
RETURN

FUNCTION RT_SZCZ_TYT()
local ltxt1:="======================================================================================================================"
local ltxt2:="|     |                                |       |            |    |   Srednia cena  NETTO   |    Warto˜† NETTO        |"
local ltxt3:="| Lp. | Nazwa towaru                   | Kod   | lo˜†       | Jm.|      rozliczeniowa      | wg. ˜rednich cen rozl.  |"
local ltxt4:="|=====|================================|=======|============|====|============|============|============|============|"
local ltxt5:="|     |                                |       |            |    |            |            |            |            |"
*if zdtyp$dok_brut_gr  &&060105
*  ltxt2:="|     |                                |       |            |    |   Srednia cena  BRUTTO  |    Warto˜† BRUTTO       |"
*  ltxt3:="| Lp. | Nazwa towaru                   | Kod   | lo˜†       | Jm.|      rozliczeniowa      | wg. ˜rednich cen rozl.  |"
*endif

r_tyt()

w=w+2
@ w,0 say &zdr_kond+ltxt1
w=w+1
@ w,0 say ltxt2
w=w+1
@ w,0 say ltxt3
w=w+1
@ w,0 say ltxt4
RETURN 

FUNCTION RT_SZCZ_STOPA()
local ltxt1:="=================================================================|===================================================|"
local ltxt2:="                                                                 ====================================================="
w=w+1
@ w,0 say ltxt1
w=w+1
@ w,65 say "|"
@ w,76 say "Razem:"
*if zdtyp $ dok_brut_gr  &&060105
*  @ w,101 say ztbrut_all picture "999 999 999.99"
*else
  @ w,101 say ztnet_all picture "999 999 999.99"
*endif
@ w,117 say "|"
w=w+1
@ w,0 say ltxt2
RETURN  

FUNCTION R_DRTOW_SUM()
local ltxt1:="P O D S U M O W A N I E  "
local ltxt2:="=======================  "
r_tyt()

w=w+4
@ w,0 say &zdr_kkond+ltxt1
w=w+1
@ w,0 say ltxt2
w=w+3
@ w,0 say "=========================================================================="
w=w+1
@ w,0 say "|  Stawka VAT  |  Warto˜†  NETTO  |       V A T      |  Warto˜†  BRUTTO  |"
w=w+1
@ w,0 say "|==============|==================|==================|===================|"
w=w+1
@ w,0 say "|                                                                        |"

if ztnet_a#0
  w=w+1
  @ w,0 say "|"
  @ w,6 say zvat_a picture "99"
  @ w,10 say "%"
  @ w,16 say ztnet_a picture "999 999 999.99"
  @ w,35 say ztvat_a picture "999 999 999.99"
  @ w,54 say ztbrut_a picture "999 999 999.99"
  @ w,73 say "|"  
  w=w+1
  @ w,0 say "|                                                                        |"
endif
if ztnet_b#0
  w=w+1
  @ w,0 say "|"
  @ w,6 say zvat_b picture "99"
  @ w,10 say "%"
  @ w,16 say ztnet_b picture "999 999 999.99"
  @ w,35 say ztvat_b picture "999 999 999.99"
  @ w,54 say ztbrut_b picture "999 999 999.99"
  @ w,73 say "|"  
  w=w+1
  @ w,0 say "|                                                                        |"
endif
if ztnet_c#0
  w=w+1
  @ w,0 say "|"
  @ w,6 say zvat_c picture "99"
  @ w,10 say "%"
  @ w,16 say ztnet_c picture "999 999 999.99"
  @ w,35 say ztvat_c picture "999 999 999.99"
  @ w,54 say ztbrut_c picture "999 999 999.99"
  @ w,73 say "|"  
  w=w+1
  @ w,0 say "|                                                                        |"
endif
if ztnet_d#0
  w=w+1
  @ w,0 say "|"
  @ w,6 say zvat_d picture "99"
  @ w,10 say "%"
  @ w,16 say ztnet_d picture "999 999 999.99"
  @ w,35 say ztvat_d picture "999 999 999.99"
  @ w,54 say ztbrut_d picture "999 999 999.99"
  @ w,73 say "|"  
  w=w+1
  @ w,0 say "|                                                                        |"
endif
if ztnet_e#0
  w=w+1
  @ w,0 say "|"
  @ w,6 say zvat_e picture "99"
  @ w,10 say "%"
  @ w,16 say ztnet_e picture "999 999 999.99"
  @ w,35 say ztvat_e picture "999 999 999.99"
  @ w,54 say ztbrut_e picture "999 999 999.99"
  @ w,73 say "|"  
  w=w+1
  @ w,0 say "|                                                                        |"
endif
if ztnet_f#0
  w=w+1
  @ w,0 say "|"
  @ w,6 say zvat_f picture "99"
  @ w,10 say "%"
  @ w,16 say ztnet_f picture "999 999 999.99"
  @ w,35 say ztvat_f picture "999 999 999.99"
  @ w,54 say ztbrut_f picture "999 999 999.99"
  @ w,73 say "|"  
  w=w+1
  @ w,0 say "|                                                                        |"
endif
if ztnet_z#0
  w=w+1
  @ w,0 say "|"
  @ w,6 say "zw."
  @ w,16 say ztnet_z picture "999 999 999.99"
  @ w,35 say ztvat_z picture "999 999 999.99"
  @ w,54 say ztbrut_z picture "999 999 999.99"
  @ w,73 say "|"  
  w=w+1
  @ w,0 say "|                                                                        |"
endif
w=w+1
@ w,0 say "|                                                                        |"
w=w+1
@ w,0 say "|==============|==================|==================|===================|"
w=w+1
@ w,0 say "|                                                                        |"
w=w+1
@ w,0 say "|  Razem:   "
@ w,16 say ztnet_all picture "999 999 999.99"
@ w,35 say ztvat_all picture "999 999 999.99"
@ w,54 say ztbrut_all picture "999 999 999.99"
@ w,73 say "|"  
w=w+1
@ w,0 say "|                                                                        |"
w=w+1
@ w,0 say "=========================================================================="
RETURN 



FUNCTION BUFOR_LADUJ(prodz)
* prodz=1 - cena detaliczna brutto
local lpoz:=0,lilosc_sum:=0,lwartosc_sum:=0,lcen_sred:=0
local ltndow:=space(15)
if.not.buf_use()
  return .f.
else
  zap
  set index to
endif
select &tow_sel
set order to 3
go top

do while.not.eof()
  vpoz=vpoz+1
  ztow_lad()
  ltndow=tndow
  lilosc_sum=0
  lwart_sum=0
  do while tnaz=ztnaz.and.tkod=ztkod.and.tjm=ztjm
    do case
	  case prodz=0
	    ztcen_ew=tcen        
	  case prodz=1
	    ztcen_ew=tcen_ew  
      case prodz=2
	    ztcen_ew=tcen_dewiz  		
    endcase
    lilosc_sum=lilosc_sum+til
	lwart_sum=lwart_sum+kj_round(til*ztcen_ew,2)
    skip
  enddo  
  *lcen_sred=kj_round(lwart_sum/lilosc_sum,4)
  if lilosc_sum=0
     lcen_sred=0
  else
    lcen_sred=lwart_sum/lilosc_sum
  endif	 
  ztcen=lcen_sred
  ztil=lilosc_sum
  select &buf_sel
  append blank
  tow_replac()
  replace tndow with ltndow
  select &tow_sel
enddo
select &tow_sel
close
select &buf_sel
RETURN 

FUNCTION R_TYT()
w=0
@ w,0 say &zdr_kond
@ w,80 say zan_miasto
@ w,112 say dtoc(zan_data)+&zdr_kkond
w=w+2
*@ w,0 say alltrim(zan_tytul)+space(2)+str(zan_numer,3)+zan_lamany
*@ w,0 say alltrim(zan_tytul)
w=w+1
@ w,0 say alltrim(zlic1)
w=w+1
@ w,0 say alltrim(zlic2)
w=w+1
@ w,0 say alltrim(zlic5)
llic4=stuff(space(50),1,6,zlic3)
llic4=stuff(llic4,9,42,substr(zlic4,1,42))
w=w+1
@ w,0 say alltrim(llic4)
w=w+2
@ w,0 say alltrim(zan_tytul)+"  "+ alltrim(str(zan_numer))+alltrim(zan_lamany) 
w=w+2
do case
  case zokres_def=1
    @ w,0 say "Za dzieä: "+dtoc(f_tdat1)
  case zokres_def=2
    @ w,0 say "Za miesi¥c: "+nazwa_miesiaca(f_tmiesiac)+"  / "+str(year(date()))+" r"
  case zokres_def=3
    @ w,0 say   "Za okres od dnia .. "+dtoc(f_tdat1)+"  do dnia .. "+dtoc(f_tdat2)
endcase
if.not.zknum_rap=0
  w=w+2
  @ w,0 say "Kontrahent:  "+alltrim(zknaz1_rap)+"  "+zkmiasto
endif
RETURN



***************************RAPORT: REJESTR ZAKUPU I SPRZEDA½Y
FUNCTION REJVAT_RAP()
local ek, lcolor:=setcolor()
save screen to ek

kj_okno(0,0,10, "                              REJESTRY VAT                                      ",2)
do while.t.
  zknum_rap=0
  if r_parametry()
    rejestr_vat()
  else
    exit
  endif
enddo  
select &rap_sel
restore screen from ek
setcolor(lcolor)
RETURN

FUNCTION REJESTR_VAT()
local ek,lcolor:=setcolor(),lpoz:=0,lkon:=space(120)
public zdoktyp:=alltrim(substr(zan_txt,1,20))
public_rap()
public_srap()
zrap_zer()
zsrap_zer()
dok_use()
*set order to 3
tow_use(.f.)
*set order to 3
do case
  case zokres_def=1
    rapwar="ddatdok=f_tdat1.and.dtyp$zdoktyp.and..not.danul"
  case zokres_def=2
    rapwar="month(ddatdok)=f_tmiesiac.and.year(ddatdok)=year(date()).and.dtyp$zdoktyp.and..not.danul"	
  case zokres_def=3
    rapwar="max(f_tdat1,ddatdok)=ddatdok.and.min(f_tdat2,ddatdok)=ddatdok.and.dtyp$zdoktyp.and..not.danul"
endcase
if.not.zknum_rap=0
  rapwar=rapwar+".and.dkontrah=zknum_rap"
endif

kj_okno(4,20,4, "  C z e k a j  ! !                      ",2)
set color to n/w*
@ 6,28 say "Trwaj¥ operacje dyskowe."
setcolor(lcolor)

select &dok_sel
index on dsymbol+dndok to symbnum
set index to symbnum
set filter to &rapwar
go top

*BROWSE()

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

rejvat_tyt()
w=prow()+1
@ w,0 say "|"
@ w,130 say "|"
do while.not.eof()
  lpoz=lpoz+1
  zdok_lad()
  kj_dok_say(.f.)
  len1=len(alltrim(zknaz1))
  len2=len(alltrim(zknaz2))
  len3=len(alltrim(zkulica))
  len4=len(alltrim(zkmiasto))
  lkon=stuff(space(140),1,len1,alltrim(zknaz1))
  len=len1+3
  lkon=stuff(lkon,len,len2,alltrim(zknaz2))
  len=len+len2+2
  lkon=stuff(lkon,len,len3,alltrim(zkulica))  
  len=len+len3+2
  lkon=stuff(lkon,len,len4,alltrim(zkmiasto))    
  if.not.zdanul
    dok_licz(zdndow,.f.)
    zrnet_a=zrnet_a+ztnet_a  
    zrnet_b=zrnet_b+ztnet_b  
    zrnet_c=zrnet_c+ztnet_c  
    zrnet_d=zrnet_d+ztnet_d  
    zrnet_e=zrnet_e+ztnet_e  
    zrnet_f=zrnet_f+ztnet_f  
    zrnet_z=zrnet_z+ztnet_z
    zrvat_a=zrvat_a+ztvat_a    
    zrvat_b=zrvat_b+ztvat_b    
    zrvat_c=zrvat_c+ztvat_c    
    zrvat_d=zrvat_d+ztvat_d    
    zrvat_e=zrvat_e+ztvat_e    
    zrvat_f=zrvat_f+ztvat_f
    zrbrut_a=zrbrut_a+ztbrut_a        
    zrbrut_b=zrbrut_b+ztbrut_b        
    zrbrut_c=zrbrut_c+ztbrut_c        
    zrbrut_d=zrbrut_d+ztbrut_d        
    zrbrut_e=zrbrut_e+ztbrut_e        
    zrbrut_f=zrbrut_f+ztbrut_f        
    zrbrut_z=zrbrut_z+ztbrut_z        
    zrnet_all=zrnet_all+ztnet_all
    zrvat_all=zrvat_all+ztvat_all
    zrbrut_all=zrbrut_all+ztbrut_all
    
	**Wiersz
	
    w=w+1
	@ w,0 say "|"
	@ w,1 say lpoz picture "999"
	@ w,6 say zddatdok
	@ w,17 say zdndok
	@ w,33 say zknip
  	@ w,48 say substr(lkon,1,30)
	lbyl=0
    lbylkon=.f.
	if.not.ztnet_a=0.or..not.ztvat_a=0
	  @ w,80 say zvat_a picture "99"	
      @ w,83 say ztnet_a picture "999999999.99"	
	  @ w,99 say ztvat_a picture "999999999.99"	
	  if lbyl=0
	    @ w,115 say ztbrut_all picture "999999999.99"	
	  endif	
	  @ w,130 say "|"	
	  lbyl=lbyl+1
	endif
    if.not.empty(substr(lkon,31)).and.lbyl=1.and..not.lbylkon
	  lbylkon=.t.
	  w=w+1
	  @ w,0 say "|"
	  @ w,6 say substr(lkon,31,72)
      @ w,130 say "|"
	endif
    if.not.ztnet_b=0.or..not.ztvat_b=0
      if lbyl=1.and.empty(substr(lkon,31)).or.lbyl>1
	    w=w+1
		@ w,0 say "|"
	  endif
	  @ w,80 say zvat_b picture "99"		  
	  @ w,83 say ztnet_b picture "999999999.99"	
	  @ w,99 say ztvat_b picture "999999999.99"	
	  if lbyl=0
	    @ w,115 say ztbrut_all picture "999999999.99"	
	  endif	
	  @ w,130 say "|"	
	  lbyl=lbyl+1
	endif
    if.not.empty(substr(lkon,31)).and.lbyl=1.and..not.lbylkon
	  lbylkon=.t.
	  w=w+1
	  @ w,0 say "|"
	  @ w,6 say substr(lkon,31,72)
      @ w,130 say "|"
	endif
    if.not.ztnet_c=0.or..not.ztvat_c=0
      if lbyl=1.and.empty(substr(lkon,31)).or.lbyl>1
	    w=w+1
		@ w,0 say "|"
	  endif
	  @ w,80 say zvat_c picture "99"		  
      @ w,83 say ztnet_c picture "999999999.99"	
	  @ w,99 say ztvat_c picture "999999999.99"	
	  if lbyl=0
	    @ w,115 say ztbrut_all picture "999999999.99"	
	  endif	
	  @ w,130 say "|"	
	  lbyl=lbyl+1
	endif
    if.not.empty(substr(lkon,31)).and.lbyl=1.and..not.lbylkon
	  lbylkon=.t.
	  w=w+1
	  @ w,0 say "|"
	  @ w,6 say substr(lkon,31,72)
      @ w,130 say "|"
	endif
    if.not.ztnet_d=0.or..not.ztvat_d=0
      if lbyl=1.and.empty(substr(lkon,31)).or.lbyl>1
	    w=w+1
		@ w,0 say "|"
	  endif
	  @ w,80 say zvat_d picture "99"		  
      @ w,83 say ztnet_d picture "999999999.99"	
	  @ w,99 say ztvat_d picture "999999999.99"	
	  if lbyl=0
	    @ w,115 say ztbrut_all picture "999999999.99"	
	  endif	
	  @ w,130 say "|"	
	  lbyl=lbyl+1
	endif
    if.not.empty(substr(lkon,31)).and.lbyl=1.and..not.lbylkon
	  lbylkon=.t.
	  w=w+1
	  @ w,0 say "|"
	  @ w,6 say substr(lkon,31,72)
      @ w,130 say "|"
	endif
    if.not.ztnet_e=0.or..not.ztvat_e=0
      if lbyl=1.and.empty(substr(lkon,31)).or.lbyl>1
	    w=w+1
		@ w,0 say "|"
	  endif
	  @ w,80 say zvat_e picture "99"	
      @ w,83 say ztnet_e picture "999999999.99"	
	  @ w,99 say ztvat_e picture "999999999.99"	
	  if lbyl=0
	    @ w,115 say ztbrut_all picture "999999999.99"	
	  endif	
	  @ w,130 say "|"	
	  lbyl=lbyl+1
	endif
    if.not.empty(substr(lkon,31)).and.lbyl=1.and..not.lbylkon
	  lbylkon=.t.
	  w=w+1
	  @ w,0 say "|"
	  @ w,6 say substr(lkon,31,72)
      @ w,130 say "|"
	endif
    if.not.ztnet_f=0.or..not.ztvat_f=0
      if lbyl=1.and.empty(substr(lkon,31)).or.lbyl>1
	    w=w+1
		@ w,0 say "|"
	  endif
	  @ w,80 say zvat_f picture "99"		  
      @ w,83 say ztnet_f picture "999999999.99"	
	  @ w,99 say ztvat_f picture "999999999.99"	
	  if lbyl=0
	    @ w,115 say ztbrut_all picture "999999999.99"	
	  endif	
	  @ w,130 say "|"	
	  lbyl=lbyl+1
	endif
    if.not.empty(substr(lkon,31)).and.lbyl=1.and..not.lbylkon
	  lbylkon=.t.
	  w=w+1
	  @ w,0 say "|"
	  @ w,6 say substr(lkon,31,72)
      @ w,130 say "|"
	endif	
    if.not.ztnet_z=0
	  if lbyl=1.and.empty(substr(lkon,31)).or.lbyl>1
	    w=w+1
		@ w,0 say "|"
	  endif
	  @ w,80 say "zw "	  
      @ w,83 say ztnet_z picture "999999999.99"	
	  @ w,99 say 0 picture "999999999.99"	
	  if lbyl=0
	    @ w,115 say ztbrut_all picture "999999999.99"	
	  endif	
	  @ w,130 say "|"	
	  lbyl=lbyl+1
	endif
    if.not.empty(substr(lkon,31)).and.lbyl=1.and..not.lbylkon
	  lbylkon=.t.
	  w=w+1
	  @ w,0 say "|"
	  @ w,6 say substr(lkon,31,72)
      @ w,130 say "|"
	endif						
	w=w+1
	@ w,0 say '|----|----------|---------------|-------------|-------------------------------|---|---------------|---------------|---------------|'
	**
  endif
  skip
enddo
w=w+1
@ w,0 say '-----------------------------------------------------------------------------------------------------------------------------------'
close
select &tow_sel
close
***                Stopka              ****
w=w+1
@ w,0 say '                                              |            Razem :            |'
@ w,83 say zrnet_all picture "999999999.99"
@ w,99 say zrvat_all picture "999999999.99"
@ w,115 say zrbrut_all picture "999999999.99"
@ w,130 say "|"
w=w+1
@ w,0 say '                                              |            W tym ze stawk¥ :  |'
@ w,130 say "|"

if zrnet_a#0.or.zrvat_a#0.or.zrbrut_a#0
  w=w+1
  @ w,46 say "|"
  @ w,78 say "|"
  @ w,80 say zvat_a picture "99"
  @ w,82 say "%"
  @ w,83 say zrnet_a picture "999999999.99"
  @ w,99 say zrvat_a picture "999999999.99"
  @ w,115 say zrbrut_a picture "999999999.99"
  @ w,130 say "|"
endif
if zrnet_b#0.or.zrvat_b#0.or.zrbrut_b#0
  w=w+1
  @ w,46 say "|"
  @ w,78 say "|"
  @ w,80 say zvat_b picture "99"
  @ w,82 say "%"
  @ w,83 say zrnet_b picture "999999999.99"
  @ w,99 say zrvat_b picture "999999999.99"
  @ w,115 say zrbrut_b picture "999999999.99"
  @ w,130 say "|"
endif
if zrnet_c#0.or.zrvat_c#0.or.zrbrut_c#0
  w=w+1
  @ w,46 say "|"
  @ w,78 say "|"
  @ w,80 say zvat_c picture "99"
  @ w,82 say "%"
  @ w,83 say zrnet_c picture "999999999.99"
  @ w,99 say zrvat_c picture "999999999.99"
  @ w,115 say zrbrut_c picture "999999999.99"
  @ w,130 say "|"
endif
if zrnet_d#0.or.zrvat_d#0.or.zrbrut_d#0
  w=w+1
  @ w,46 say "|"
  @ w,78 say "|"
  @ w,80 say zvat_d picture "99"
  @ w,82 say "%"
  @ w,83 say zrnet_d picture "999999999.99"
  @ w,99 say zrvat_d picture "999999999.99"
  @ w,115 say zrbrut_d picture "999999999.99"
  @ w,130 say "|"
endif
if zrnet_e#0.or.zrvat_e#0.or.zrbrut_e#0
  w=w+1
  @ w,46 say "|"
  @ w,78 say "|"
  @ w,80 say zvat_e picture "99"
  @ w,82 say "%"
  @ w,83 say zrnet_e picture "999999999.99"
  @ w,99 say zrvat_e picture "999999999.99"
  @ w,115 say zrbrut_e picture "999999999.99"
  @ w,130 say "|"
endif
if zrnet_f#0.or.zrvat_f#0.or.zrbrut_f#0
  w=w+1
  @ w,46 say "|"
  @ w,78 say "|"
  @ w,80 say zvat_f picture "99"
  @ w,82 say "%"
  @ w,83 say zrnet_f picture "999999999.99"
  @ w,99 say zrvat_f picture "999999999.99"
  @ w,115 say zrbrut_f picture "999999999.99"
  @ w,130 say "|"
endif
if zrnet_z#0
  w=w+1
  @ w,46 say "|"
  @ w,78 say "|"
  @ w,80 say "zw."
  @ w,83 say zrnet_z picture "999999999.99"
  @ w,130 say "|"
endif

w=w+1
@ w,46 say '-------------------------------------------------------------------------------------'
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




FUNCTION REJVAT_TYT()
r_tyt()
@ prow(),0 say  &zdr_kond
    @ prow()+2,0 say '-----------------------------------------------------------------------------------------------------------------------------------'
    @ prow()+1,0 say '| Lp.|          |    numer      |            K O N T R A H E N T              |St.|    Warto˜†    |    Podatek    |    Warto˜†    |'
    @ prow()+1,0 say '|    |  DATA    |   rachunku    |---------------------------------------------|VAT|     NETTO     |     V A T     |    BRUTTO     |'
    @ prow()+1,0 say '|    |          |   (faktury)   |    N I P    |        Nazwa i adres          | % |               |               |               |'
    @ prow()+1,0 say '|----|----------|---------------|-------------|-------------------------------|---|---------------|---------------|---------------|'
	@ prow()+1,0 say '| 1  |   2      |        3      |      4      |               5               | 6 |       7       |       8       |        9      |'
    @ prow()+1,0 say '|=================================================================================================================================|'
RETURN




***************************RAPORT:ZESTAWIENIE TOWARàW W CENACH ZAK i SP NETTO
FUNCTION MAG_WART()
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
if zanalplik
  select &analplik_sel
  use anplik
  zap
endif
tow_use(.f.)
set order to 3
do case
  case zokres_def=1
    rapwar="f_datdok(f_tdat1).and.f_dtyp(zdoktyp).and..not.tanul"
  case zokres_def=2
	rapwar="f_miesdok(f_tmiesiac).and.f_dtyp(zdoktyp).and..not.tanul"	
  case zokres_def=3
    rapwar="f_2datdok(f_tdat1,f_tdat2).and.f_dtyp(zdoktyp).and..not.tanul"
endcase
if.not.zknum_rap=0
  rapwar=rapwar+".and.frap_kontrah()"
endif

kj_okno(4,20,4, "  C z e k a j  ! !                      ",2)
set color to n/w*
@ 6,28 say "Trwaj¥ operacje dyskowe."
setcolor(lcolor)

select &tow_sel
set filter to &rapwar
go top
if zdruk_def=1
  if.not.start_druk()
    set device to screen
 	return .f.
  endif
 * set printer to
else
  plik="wydruki\r_sp_tow.txt"
  set printer to &plik
endif


set device to printer
*w=prow()
  do case
    case zan_def3=1
	  zan_klucz="Klucz=ILO—"
    case zan_def3=2
	  zan_klucz="Klucz=OBRàT"
    case zan_def3=3
	  zan_klucz="Klucz=ZYSK"
  endcase

r_sptow_tyt()
do while.not.eof()
  vpoz=vpoz+1
  ztow_lad()

  vilosc_sum=0
  vwart_zak=0
  vwart_sp=0
  do while tnaz=ztnaz.and.tkod=ztkod.and.tjm=ztjm
    vilosc_sum=vilosc_sum+til
	vwart_zak=vwart_zak+kj_round(til*tcen_ew,2)
	vwart_sp=vwart_sp+kj_round(til*tcen,2)    
    skip
  enddo  
  vcen_zak=kj_round(vwart_zak/vilosc_sum,2)
  vcen_sp=kj_round(vwart_sp/vilosc_sum,2)  
  if zanalplik
    select &analplik_sel
	append blank
    replace anazwa with ztnaz,akod with ztkod,ail with vilosc_sum
	replace ajm with ztjm,acen_zak with vcen_zak,acen_sp with vcen_sp
	replace	aobrot with vwart_sp,azysk with vwart_sp-vwart_zak
	replace amagaz with ztmagaz,agrup with ztgrup,adekret with ztdekret
	replace astawka with ztstawka,asymbol with ztsymbol,azwolniony with ztzwolniony
	replace awyroznik with ztwyroznik,akormag with ztkormag,aster with ztster
	select &tow_sel
  else
    r_sptow_wiersz()
	vzak_all=vzak_all+vwart_zak
    vsp_all=vsp_all+vwart_sp
  endif	

enddo
close
if zanalplik
  select &analplik_sel
**                      pole an_def3 decydyje o kluczu 
  do case
    case zan_def3=1
*	  zan_klucz="Klucz=ILO—"
	  index on descend(ail) to an_ilosc
    case zan_def3=2
*	  zan_klucz="Klucz=OBRàT"
	  index on descend(aobrot) to an_obrot	  
    case zan_def3=3
*	  zan_klucz="Klucz=ZYSK"
	  index on descend(azysk) to an_zysk	  
    case zan_def3=4
*	  zan_klucz="Klucz=NAZWA"
	  index on anazwa to an_nazwa	  	  
    case zan_def3=5
*	  zan_klucz="Klucz=KOD"
	  index on akod to an_kod	  	  	  
  endcase

  go top
  if.not.zan_def4=0  &&an_def4 przechowuje informacj© o ilo˜ci pozostawionych w raporcie rekordach licz¥c od pierwszego
    vpoz=0
	do while.not.eof()
	  vpoz=vpoz+1
	  if vpoz>zan_def4
	    delete
	  endif
	  skip
	enddo  
  endif
  go top
  vpoz=0
  do while.not.eof()
    vpoz=vpoz+1
	if zrozmiar
	  ztnaz=anazwa
	else
	  ztnaz=substr(anazwa,1,32)
	endif  
	if z2kod
	  ztkod=akod
	else
	  ztkod=substr(akod,1,7)
	endif  
	vilosc_sum=ail
	ztjm=ajm
	vcen_zak=acen_zak
	vcen_sp=acen_sp
	vwart_zak=aobrot-azysk
	vwart_sp=aobrot
	r_sptow_wiersz()
	vzak_all=vzak_all+vwart_zak
    vsp_all=vsp_all+vwart_sp
	skip
  enddo
*  wydruk z pliku
endif
r_sptow_stopa()
end_rap()

eject
**
set device to screen
if.not.zdruk_def=1
  edi=edit+" wydruki\r_sp_tow.txt"
  run &edi 
  restore screen from ek
  set cursor off   
endif

restore screen from ek
RETURN


FUNCTION RTOWAR_GET()
local ek,lpoz1:=1,lcolor:=setcolor()
save screen to ek
**
do while .t.
    kj_okno(6,29,4, "  Towar:                                  ",2)  
    @ 7,31 say "Nazwa: "
	@ 8,31 say "Kod:   "
	@ 9,31 say "Grupa: "
	@ 7,38 say f_tnaz
	@ 8,38 say f_tkod
	@ 9,38 say f_tgrup 
	    lpoz1=ftowar1_menu(lpoz1)
        if lastkey()=27
		  exit
		endif
		do case
		  case lpoz1=1
			setcolor(lcolor)
			set cursor on
			@ 7,38 get f_tnaz picture "@!" 
			read
			set cursor off
		  case lpoz1=2
			setcolor(lcolor)
			set cursor on
			@ 8,38 get f_tkod picture "@!" 
			read
			set cursor off
		  case lpoz1=3
			setcolor(lcolor)
			set cursor on
			@ 9,38 get f_tgrup picture "@!" 
			read
			set cursor off			
		endcase 
enddo
**

restore screen from ek
RETURN


FUNCTION FTOWAR1_MENU(ppoz)
local ltnaz[3],ltlit[3],ltopis[3],lbelka:="",lpoz:=ppoz
ltnaz[1]:=" Nazwa "
ltnaz[2]:=" Kod   "
ltnaz[3]:=" Grupa "
ltlit[1]:=" N "
ltlit[2]:=" K "
ltlit[3]:=" G "
ltopis[1]:="Wydziel tylko pozycje o okre˜lonej nazwie."
ltopis[2]:="Wydziel tylko pozycje o okre˜lonym kodzie."
ltopis[3]:="Wydziel tylko pozycje z wybranej grupy."
  lpoz=men_pion(6,29,3,lbelka,ltnaz,ltlit,ltopis,lpoz)
RETURN lpoz
