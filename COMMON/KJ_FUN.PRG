FUNCTION Z_DOK_DEF()
************************Zmienne - nowy dokument
public ztyp:=space(4)
public zndok:=space(15)
public zzewndok:=space(15)
public zdatdok:=date()
public znskrot:=space(15)
public zwartosc:=0  
public zwar:=0
public znplat:=0
public znzamow:=space(15) 
public ztermin:=date()+14
public zdatzap:=date()
public zkonto:=0
public zkwota:=0
public zksiegowy:=.f.
public zsposzap:=space(1)
public zdatsp:=date()
public zdatzal:=date()
public ztransport:=space(20)
public zdster:=space(3)
public zopis:=space(16)
public zdnet_22:=0
public zdnet_07:=0
public zdnet_00:=0
public zdnet_zw:=0
public opis_dok:=space(16)
RETURN nil

FUNCTION Z_KON_DEF()
*******************Zmienne - opis kontrahentow
public znaz1:=space(30)
public znaz2:=space(30)
public zmiasto:=space(30)
public zulica:=space(30)
public zkod:=space(6)
public ztel:=space(15)
public znip:=space(13)
public zfax:=space(15)
public zpager:=space(15)
public zkkonto:=space(40)
public zkontrahkonto:=space(29)
public zgrupa:=space(5)
public znskrot:=space(15)
public zrabat:=0.0
public zdrabat:=0.0
public znr_kontr:=0
RETURN nil

FUNCTION Z_MAG_DEF()
*******************Zmienne magazyn
public zmnaz:=space(32)
public zmil:=0
public zmcen_d:=0
public zmcen_h:=0
public zmcen_m:=0
public zmrez:=0
public zmkod:=space(7)
public zmjm:=space(3)
public zmdata:=date()
public zmagaz:=0
public znmag:=0
public zmstawka:=0
public zmsymbol:=space(10)
public zmmarza_d:=0
public zmmarza_h:=0
public zmwaluta:=space(1)
public zmster:=space(3)
public zmcen_p:=0
public zmdokzak:=space(15)
public zmntrah:=0
public zmilpom:=0
public zmilsum:=0
public zmindex:=0
public zmagnum:=0
RETURN nil

FUNCTION Z_TOW_DEF()
******************Zmienne - nowa pozycja rejestrowana w dokumentach
public ztlp:=0
public ztnaz:=space(32)
public ztil:=1.00
public ztcen:=0.00
public ztwar:=0.00
public ztkod:=space(7)
public ztmagazyn:=.t.
public ztndok:=space(15)
public ztjm:=space(3)
public ztsymbol:=space(15)
public ztstawka:=0
public ztcen_m:=0
public ztcen_d:=0
public ztcen_h:=0
public ztcen_p:=0
public ztnkon:=0
public ztster:=space(3)
public ztdat:=date()
public ztnmag:=0
public ztmagnum:=0
public ztntrah:=0
public ztzewndok:=space(15)
*public ztwartbp:=0
*public ztvat:=0
public ztprac:=0
public ztindex:=0
public ztdokzak:=space(15)
public ztntrah:=0
RETURN nil

FUNCTION Z_PRAC_DEF()
******************Zmienne - nowy pracownik
public rindex:=0
public rnazwisko:=space(20)
public rimie1:=space(15)
RETURN nil

FUNCTION DOK_LAD()
  zndok=ndok
  ztyp=typ
  zdatdok=datdok
  znskrot=nskrot
  zwartosc=wartosc
  zopis=opis
  znplat=nplat
  znzamow=nzamow
  ztermin=termin
  zdatzap=datzap
  zkonto=konto
  zkwota=kwota
  zksiegowy=ksiegowy
  zzewndok=zewndok
  zdatsp=datsp
  zdatzal=datzal
  ztransport=transport
  zsposzap=sposzap
  zdster=dster
  zdnet_22=dnet_22
  zdnet_07=dnet_07
  zdnet_00=dnet_00
  zdnet_zw=dnet_zw
  zdrabat=drabat
RETURN nil

FUNCTION TOW_LAD()  
  ztlp=tlp
  ztnaz=tnaz
  ztkod=tkod
  ztjm=tjm
  ztil=til
  ztcen=tcen
  ztmagazyn=tmagazyn  
  ztndok=tndok
  ztcen_m=tcen_m
  ztdat=tdat
  ztsymbol=tsymbol
  ztstawka=tstawka
  ztnkon=tnkon
  ztster=tster
  ztnmag=tnmag
  ztmagnum=tmagnum
  ztntrah=tntrah
  ztzewndok=tzewndok
  ztprac=tprac
  ztindex=tindex
RETURN nil

FUNCTION KON_LAD()  
  znaz1=naz1
  znaz2=naz2
  zmiasto=miasto
  zulica=ulica
  zkod=kod
  ztel=tel
  zfax=fax
  zpager=pager
  zkkonto=konto
  zgrupa=grupa
  znskrot=nskrot
  zrabat=rabat
  znr_kontr=nr_kontr
  znip=nip
RETURN nil  


FUNCTION MAG_LAD()  
        zmnaz=mnaz
        zmil=mil
	    zmcen_d=mcen_d
        zmcen_h=mcen_h	  
        zmcen_m=mcen_m
        zmrez=mrez
        zmkod=mkod
	    zmjm=mjm
		zmdata=mdata
        zmagaz=magaz  		   	
	    znmag=nmag
		zmstawka=mstawka
		zmsymbol=msymbol
        zmwaluta=mwaluta
		zmster=mster
		zmcen_p=mcen_p
		zmdokzak=mdokzak		
        zmntrah=mntrah
        zmindex=mindex
        zmagnum=magnum
RETURN nil		

FUNCTION MAG_TOW_LAD()  
        zmnaz=ztnaz
        zmil=ztil
	    zmcen_d=ztcen
        zmcen_h=ztcen	  
        zmcen_m=ztcen_m
        zmrez=0
        zmkod=ztkod
	    zmjm=ztjm
		zmdata=ztdat
        zmagaz=0  		   	
	    znmag=0
		zmstawka=ztstawka
		zmsymbol=ztsymbol
        zmwaluta=""
		zmster=ztster
		zmcen_p=0
		zmdokzak=ztzewndok		
        zmntrah=ztnkon
        zmindex=ztindex
        zmagnum=1
RETURN nil		

FUNCTION DOK_OLD_REPLAC()
replace typ with ztyp,ndok with zndok,datdok with zdatdok,nskrot with znskrot
replace opis with zopis,nplat with znplat,datzap with zdatzap
replace nzamow with znzamow,termin with ztermin,konto with zkonto
replace kwota with zkwota,ksiegowy with zksiegowy
replace datsp with zdatsp,datzal with zdatzal,transport with ztransport
replace sposzap with zsposzap,dster with zdster
replace zewndok with zzewndok,drabat with zdrabat
replace wartosc with zwartosc,dnet_22 with zdnet_22,dnet_07 with zdnet_07
replace dnet_00 with zdnet_00,dnet_zw with zdnet_zw
RETURN nil


FUNCTION TOW_OLD_REPLAC()  
  replace tlp with ztlp,tnaz with ztnaz,til with ztil,tcen with ztcen
  replace tkod with ztkod,tjm with ztjm,tndok with ztndok,tmagazyn with ztmagazyn
  replace tnkon with ztnkon,tsymbol with ztsymbol,tstawka with ztstawka
  replace tster with ztster,tcen_m with ztcen_m,tntrah with ztntrah
  replace tdat with ztdat,tnmag with ztnmag,tmagnum with ztmagnum
  replace tindex with ztindex
  replace tzewndok with ztzewndok,tntrah with ztntrah
RETURN nil  

FUNCTION KON_OLD_REPLAC()  
	    replace naz1 with znaz1,naz2 with znaz2,miasto with zmiasto,ulica with zulica
	    replace kod with zkod,tel with ztel,fax with zfax,pager with zpager,konto with zkkonto
	    replace nip with znip,grupa with zgrupa,nskrot with znskrot
	    replace rabat with zrabat,nr_kontr with znr_kontr
RETURN	nil	

FUNCTION MAG_OLD_REPLAC()  
		replace mnaz with zmnaz,mindex with zmindex,nmag with znmag 
	    replace mil with zmil,mrez with zmrez,mcen_m with zmcen_m
        replace mkod with zmkod,magaz with zmagaz,mjm with zmjm    		
		replace mdata with zmdata,mstawka with zmstawka,msymbol with zmsymbol
		replace mwaluta with zmwaluta,mntrah with zmntrah,magnum with zmagnum
		replace mdokzak with zmdokzak,mster with zmster,mcen_p with zmcen_p 
        replace mcen_d with zmcen_d,mcen_h with zmcen_h		
RETURN	nil	


FUNCTION KON_ZER()  
  znaz1=space(30)
  znaz2=space(30)
  zmiasto=space(30)
  zulica=space(30)
  zkod="  -   "
  ztel=space(15)
  zfax=space(15)
  zpager=space(15)
  zkkonto=space(60)
  zgrupa=space(5)
  znskrot=space(15)
  zrabat=0.0
  znr_kontr=0
  zkontrahkonto=space(40)
  znip=space(13)
RETURN  nil



FUNCTION ZEW_NUM(ptyp2)  
local lnumdok:="",lnum:=0
*  use dpam new
  do case
    case ptyp2="F"
	  lnum=dnumfakt+1
      replace dnumfakt with dnumfakt+1
    case ptyp2="R"
	  lnum=dnumrach +1
      replace dnumrach with dnumrach+1	  
    case ptyp2="P"
	  lnum=dnumpar+1
      replace dnumpar with dnumpar+1	  
    case ptyp2="Z"
	  lnum=dnumpz+1
      replace dnumpz with dnumpz+1	  
  endcase   
lnumdok=numer(lnum,ztyp)
RETURN  lnumdok

FUNCTION NUMER(pnum,pkod)
local poz:=0
local tnum:=space(15)
local em:=savescreen(0,0,24,79)
local numer:="          / /  "
pkod=substr(pkod,4,1)
if pnum>999999
  do while .t.
    pnum=pnum-1000000
	if pnum<=999999
	  exit
	endif  
  enddo	
endif  
tnum=alltrim(str(pnum))
poz=11-len(tnum)
numer=stuff(numer,poz,len(tnum),tnum)
numer=stuff(numer,12,1,pkod)
*numer=stuff(numer,13,1,stanowisko)
numer=stuff(numer,14,2,SUBSTR(ALLTRIM(STR(year(date()))),3))
*if wielokas
*  NumKasTxt=ALLTRIM(str(NumKas))
*  numer=stuff(numer,14,1,NumKasTxt)
*endif
RETURN numer


*******************************************************************************
*Procedura kiruje do katalogu zawierajacego magazyn.                      
*Decyduje parametr okreslajacy numer przyporzadkowany magazynowi
*******************************************************************************
FUNCTION PMAGDEFAULT(pmag)
set default to 
	do case
	  case pmag=1
	    set default to 1MAG
	  case pmag=2
	    set default to AMAG
	  case pmag=3
	    set default to BMAG
	  case pmag=4
	    set default to CMAG						
	  case pmag=5
	    set default to DMAG
	  case pmag=6
	    set default to EMAG
	  case pmag=7
	    set default to FMAG
	  case pmag=8
	    set default to GMAG								
	  case pmag=9
	    set default to HMAG								
	  case pmag=10
	    set default to 10MAG
	  case pmag=11
	    set default to 11MAG
	  case pmag=12
	    set default to 12MAG
	  case pmag=13
	    set default to 13MAG
	  case pmag=14
	    set default to 14MAG
	  case pmag=15
	    set default to 15MAG
	  case pmag=16
	    set default to 16MAG
	  case pmag=17
	    set default to 17MAG
	  case pmag=18
	    set default to 18MAG
	  case pmag=19
	    set default to 19MAG
	  case pmag=20
	    set default to 20MAG
	  case pmag=21
	    set default to 21MAG
	  case pmag=22
	    set default to 22MAG
	  case pmag=23
	    set default to 23MAG
	  case pmag=24
	    set default to 24MAG
	  case pmag=25
	    set default to 25MAG
	  case pmag=26
	    set default to 26MAG
	  case pmag=27
	    set default to 27MAG
	  case pmag=28
	    set default to 28MAG
	  case pmag=29
	    set default to 29MAG
	  case pmag=30
	    set default to 30MAG
	  case pmag=31
	    set default to 31MAG
	  case pmag=32
	    set default to 32MAG
	  case pmag=33
	    set default to 33MAG
	  case pmag=34
	    set default to 34MAG
	  case pmag=35
	    set default to 35MAG
	  case pmag=36
	    set default to 36MAG
	  case pmag=37
	    set default to 37MAG
	  case pmag=38
	    set default to 38MAG
	  case pmag=39
	    set default to 39MAG
	  case pmag=40
	    set default to 40MAG
	  case pmag=41
	    set default to 41MAG
	  case pmag=42
	    set default to 42MAG
	  case pmag=43
	    set default to 43MAG
	  case pmag=44
	    set default to 44MAG
	  case pmag=45
	    set default to 45MAG
	  case pmag=46
	    set default to 46MAG
	  case pmag=47
	    set default to 47MAG
	  case pmag=48
	    set default to 48MAG
	  case pmag=49
	    set default to 49MAG
	  case pmag=50
	    set default to 50MAG
	  case pmag=51
	    set default to 51MAG
	  case pmag=52
	    set default to 52MAG
	  case pmag=53
	    set default to 53MAG
	  case pmag=54
	    set default to 54MAG
	  case pmag=55
	    set default to 55MAG
	  case pmag=56
	    set default to 56MAG
	  case pmag=57
	    set default to 57MAG
	  case pmag=58
	    set default to 58MAG
	  case pmag=59
	    set default to 59MAG
	  case pmag=60
	    set default to 60MAG
	  case pmag=61
	    set default to 61MAG
	  case pmag=62
	    set default to 62MAG
	  case pmag=63
	    set default to 63MAG
	  case pmag=64
	    set default to 64MAG
	  case pmag=65
	    set default to 65MAG
	  case pmag=66
	    set default to 66MAG
	  case pmag=67
	    set default to 67MAG
	  case pmag=68
	    set default to 68MAG
	  case pmag=69
	    set default to 69MAG
	  case pmag=70
	    set default to 70MAG
	  case pmag=71
	    set default to 71MAG
	  case pmag=72
	    set default to 72MAG
	  case pmag=73
	    set default to 73MAG
	  case pmag=74
	    set default to 74MAG
	  case pmag=75
	    set default to 75MAG
	  case pmag=76
	    set default to 76MAG
	  case pmag=77
	    set default to 77MAG
	  case pmag=78
	    set default to 78MAG
	  case pmag=79
	    set default to 79MAG
	  case pmag=80
	    set default to 80MAG
	  case pmag=81
	    set default to 81MAG
	  case pmag=82
	    set default to 82MAG
	  case pmag=83
	    set default to 83MAG
	  case pmag=84
	    set default to 84MAG
	  case pmag=85
	    set default to 85MAG
	  case pmag=86
	    set default to 86MAG
	  case pmag=87
	    set default to 87MAG
	  case pmag=88
	    set default to 88MAG
	  case pmag=89
	    set default to 89MAG
	  case pmag=90
	    set default to 90MAG
	  case pmag=91
	    set default to 91MAG
	  case pmag=92
	    set default to 92MAG
	  case pmag=93
	    set default to 93MAG
	  case pmag=94
	    set default to 94MAG
	  case pmag=95
	    set default to 95MAG
	  case pmag=96
	    set default to 96MAG
	  case pmag=97
	    set default to 97MAG
	  case pmag=98
	    set default to 98MAG
	  case pmag=99
	    set default to 99MAG
	  case pmag=100
	    set default to 100MAG
	endcase
RETURN


*******************************************************************************
* Funkcja zamienia zmienna numeryczna (do 12 zn.) na tekst                    *
* w formacie "999 999 999 999"   wart. zerowa = space(15)                     *
*******************************************************************************
FUNCTION STRJ
parameters plicz
plicz=ROUND(plicz,2)
tx=space(15)
if plicz#0
  tx1=alltrim(str(plicz))
  tx1=stuff(space(12),13-len(tx1),len(tx1),tx1)
  tx=stuff(tx,2,3,substr(tx1,1,3))
  tx=stuff(tx,5,1," ")
  tx=stuff(tx,6,3,substr(tx1,4,3))
  tx=stuff(tx,9,1," ")
  tx=stuff(tx,10,3,substr(tx1,7,3))
 *tx=stuff(tx,12,1," ")
 *tx=stuff(tx,13,3,substr(tx1,10,3))
 tx=stuff(tx,13,3,substr(tx1,10,3))
endif
RETURN tx
