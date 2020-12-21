*******************************************************************************
* Modul zapewnia obsluge drukarki fiskalnej DF-2 /realizuje wydruk paragonu/  *
* Dane wejsciowe to otwarty plik "towbuf.dbf"                                 *
* Parametr pcom zawiera adres portu szeregowego                               *
*******************************************************************************
parameters pcom
local lnazwa,lind_ptu,lilosc,lcena,lforma,lkwota_zapl,lkwota_reszty
local kod_zwr,lrabat:="000",lkwota:="0.00     ",lsum:=0
*pcom=1016        && COM1
*pcom=760         && COM2
if alltrim(dfis_druk)=="DF-301".or.alltrim(dfis_druk)=="TERMAL"
  posnet301()
  RETURN
endif

if alltrim(dfis_druk)=="DF-3"
  DFRSMODE(1)
endif  

if alltrim(dfis_druk)="DF-2"
  DFRSMODE(0)
endif  

kod_zwr = DFStart(pcom)
if.not.kod_zwr=1
  do drukcom with kod_zwr
  return  
endif

kod_zwr = DFStartTra()
if.not.kod_zwr=1
  do drukcom with kod_zwr
  return  
endif

*use towbuf index towbuf new
select &buf_sel
set default to &set_serwer
if.not.used()
  if.not.kj_use("towbuf",.t.,5)
    return
  endif 
endif
do while.not.eof()
  lsum=lsum+kj_round(til*kj_round(BRUTTO(tcen,tstawka),2),2)
  lnazwa=substr(tnaz,1,18)
  do case
    case tstawka=0.and.tzwolniony
      lind_ptu="Z"	  	  	  	  	  	  	  	  	  	  	  	  
    case tstawka=zvat_a
      lind_ptu="A"
    case tstawka=zvat_b
      lind_ptu="B"
    case tstawka=zvat_c
      lind_ptu="C"
    case tstawka=zvat_d
      lind_ptu="D"	  
    case tstawka=zvat_e 
      lind_ptu="E"	  	  	  
    case tstawka=zvat_f 
      lind_ptu="F"
    case tstawka=zvat_g 
      lind_ptu="G"
*    case tstawka=zvat_z 
*      lind_ptu="Z"	  	  	  	  	  	  	  	  	  	  	  	  
  endcase
  lilosc=str(til,9,2)
  lcena=str(BRUTTO(tcen,tstawka),9,2)

  kod_zwr = DFAdd(lnazwa,lind_ptu,lilosc,lcena,lrabat)
  if.not.kod_zwr=1
    do drukcom with kod_zwr
    return  
  endif
  skip
enddo
close

kod_zwr = DFFinish( lkwota )
if.not.kod_zwr=1
  do drukcom with kod_zwr
  return  
endif
*lforma=zsposzap             &&sprawdzic dostepne formaty
if zdsposzap="G"
  lforma=zdsposzap           
else
  lforma="N"
endif
lkwota_zap=str(lsum,9,2)
lkwota_reszty="0.00     "

kod_zwr = DFPrParf(lforma,lkwota_zapl,lkwota_reszty)
if.not.kod_zwr=1
  do drukcom with kod_zwr
  return  
endif
RETURN

PROCEDURE CKOM3
parameters ptxt1,ptxt2,ptxt3
local len[10],ile_wiersz:=5,ile_kol:=30,w1,w2,k1,k2,ek

len1=len(ptxt1)
len2=len(ptxt2)
len3=len(ptxt3)

save screen to ek
if len1#0
  ile_wiersz=1
endif
if len2#0
  ile_wiersz=2
endif
if len3#0
  ile_wiersz=3
endif
ile_kol=max(ile_kol,len1)
ile_kol=max(ile_kol,len2)
ile_kol=max(ile_kol,len3)

w1=round((24-ile_wiersz)/2,0)-1
w2=w1+ile_wiersz+1
k1=round((80-ile_kol)/2,0)-3
k2=k1+ile_kol+6

@ w1,k1 clear to w2,k2
@ w1,k1 to w2,k2 double
@ w1,k1+3 say " Uwaga ! "
@ w2,k1+3 say "Nacisnij dowolny klawisz"
k1=round((80-len1)/2,0)
@ w1+1,k1+1 say ptxt1
k1=round((80-len2)/2,0)
@ w1+2,k1+1 say ptxt2
k1=round((80-len3)/2,0)
@ w1+3,k1+1 say ptxt3

inkey(0)
restore screen from ek
RETURN


PROCEDURE CKOM5
parameters ptxt1,ptxt2,ptxt3,ptxt4,ptxt5
local len[10],ile_wiersz:=5,ile_kol:=30,w1,w2,k1,k2,ek

len1=len(ptxt1)
len2=len(ptxt2)
len3=len(ptxt3)
len4=len(ptxt4)
len5=len(ptxt5)

save screen to ek
if len1#0
  ile_wiersz=1
endif
if len2#0
  ile_wiersz=2
endif
if len3#0
  ile_wiersz=3
endif
if len4#0
  ile_wiersz=4
endif
if len5#0
  ile_wiersz=5
endif
ile_kol=max(ile_kol,len1)
ile_kol=max(ile_kol,len2)
ile_kol=max(ile_kol,len3)
ile_kol=max(ile_kol,len4)
ile_kol=max(ile_kol,len5)

w1=round((24-ile_wiersz)/2,0)-1
w2=w1+ile_wiersz+1
k1=round((80-ile_kol)/2,0)-3
k2=k1+ile_kol+6

@ w1,k1 clear to w2,k2
@ w1,k1 to w2,k2 double
@ w1,k1+3 say " Uwaga ! "
@ w2,k1+3 say "Nacisnij dowolny klawisz"
k1=round((80-len1)/2,0)
@ w1+1,k1+1 say ptxt1
k1=round((80-len2)/2,0)
@ w1+2,k1+1 say ptxt2
k1=round((80-len3)/2,0)
@ w1+3,k1+1 say ptxt3
k1=round((80-len4)/2,0)
@ w1+4,k1+1 say ptxt4
k1=round((80-len5)/2,0)
@ w1+5,k1+1 say ptxt5

inkey(0)
restore screen from ek
RETURN


PROCEDURE DRUKCOM
parameters pkod
local blad:="Blad wykonania NR        "
blad=stuff(blad,19,3,str(pkod,3))
do case
  case pkod=0
    do ckom3 with "Brak komunikacji z drukarka.","",blad
  case pkod=2
    do ckom3 with "Zly zakres lub format danych","",blad
  case pkod=3
    do ckom3 with "Przekroczony zakres arytmetyczny","",blad
  case pkod=4
    do ckom3 with "Transakcja anulowana.","Uplynal maksymalny czas trwania transakcji.",blad
  case pkod=5
    do ckom3 with "Brak napiecia 24 V .","",blad
  case pkod=6
    do ckom3 with "SERWIS WYMAGANY !","Wykryto blad totalizerow.",blad
  case pkod=7
    do ckom3 with "Zablokowany mechanizm drukarki.","",blad
  case pkod=8
    do ckom3 with "Drukarka jest w stanie TYLKO ODCZYT.","",blad
  case pkod=9
    do ckom3 with "Data w kalendarzu drukarki jest wczesniejsza","od daty ostatniej rejestracji w pamieci fiskalnej.",blad
  case pkod=10
    do ckom3 with "Nie wykonano fiskalnego raportu dobowoego","za dzien wczesniejszy",blad
  case pkod=11
    do ckom3 with "Proba sprzedazy towaru ze zwiekszonym indeksem PTU","podczas gdy byl on juz poprzednio zmniejszany",blad
  case pkod=12
    do ckom3 with "Trzy nieudane proby zapisu do pamieci fiskalnej,","drukarka jest w stanie SERVIS WYMAGANY.",blad
  case pkod=13
    do ckom3 with "Brak miejsca na nowe stawki.","",blad
  case pkod=14 
    do ckom3 with "Transakcja nie zostala rozpoczeta.","",blad
  case pkod=15
    do ckom3 with "Zbyt duzo pozycji na paragonie.","",blad
  otherwise
    do ckom3 with "",blad,""	  	
endcase
RETURN

*******************************************************************************
* Menu pojawiajace sie w parametrach. Umo¾liwia wyb¢r drukarki fiskalnej      *
* Zwraca nazw© obsˆugiwanej drykarki.                                         *
*******************************************************************************
FUNCTION FISDRUK_MENU()
local ltnaz[4],ltlit[4],ltopis[4],lbelka:="",lpoz:=1,lnaz:=""
ltnaz[1]:=" ORHMET_DF-2   "
ltnaz[2]:=" ORHMET_DF-3   "
ltnaz[3]:=" POSNET DF-301 "
ltnaz[4]:=" POSNET TERMAL "
ltlit[1]:="           2 "
ltlit[2]:="           3 "
ltlit[3]:=" P           "
ltlit[4]:="        T    "
ltopis[1]:="Drukarka ORHMET typ DF-2"
ltopis[2]:="Drukarka ORHMET typ DF-3"
ltopis[3]:="Drukarka POSNET DF-301 "
ltopis[4]:="Drukarka POSNET TERMAL "
do case
  case dfis_druk="DF-2"
    lpoz=1
  case dfis_druk="DF-3"
    lpoz=2	
  case dfis_druk="DF-301"
    lpoz=3		
  case dfis_druk="TERMAL"
    lpoz=4			
endcase
  lpoz=men_pion(15,35,4,lbelka,ltnaz,ltlit,ltopis,lpoz)
if.not.lastkey()=27
  do case
    case lpoz=1
      dfis_druk="DF-2"
    case lpoz=2
      dfis_druk="DF-3"	
    case lpoz=3
      dfis_druk="DF-301"		  
    case lpoz=4
      dfis_druk="TERMAL"		  	  
  endcase
endif  
RETURN lnaz



FUNCTION POSNET301
local Linia1:=space(40),Linia2:=space(40),Linia3:=space(40)
 PUBLIC OstatniBlad
 PRIVATE ycomm
 PRIVATE Wybrano


 DO df301

 Wybrano=1
 CLEAR SCREEN
 ycomm=DrKtoryRS()
 IF (ycomm=-1)
   ycomm=1
   @ 1,1 SAY "Nie mog© wykry† drukarki fiskalnej"
   @ 2,1 SAY "Podaj numer RS232 do kt¢rego podˆ¥czono drukark©: " GET ycomm RANGE 1,4
   READ
 ENDIF
 
 InitIntr(ycomm)
&& przechwytuje procedury obslugi bledu
* LastHandler:=ERRORBLOCK({ |objErr| myHandler(objErr)})

********
DrOtworzSzuflad()
    RestoreIntr() 
RETURN



PROCEDURE BladDrukarki
PARAMETERS KodBledu
&&  CLEAR SCREEN
  ? "Ostatnia operacja zakonczyla sie bledem o kodzie : ", KodBledu
  IF (KodBledu<0)
    ? "Jest to blad transmisji lub blad uzytkownika"
  else
    ? "Jest to blad obslugi drukarki"
  ENDIF
  inkey(20)
  RETURN
