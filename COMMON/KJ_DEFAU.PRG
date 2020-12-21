FUNCTION DOK_DEFAULT()
set default to curdir()
if.not.zdarchiwum
  do case
*  case (zdtyp$kasa_gr.or.zkj_kasa).and..not.zdokument
    case (zdtyp$kasa_gr.or.zkj_kasa)
      set default to &(zkas_serwer+"KASA")
    case zdtyp$przerob_gr
	  set default to &(zd_serwer+"001prod")
	otherwise	
      set default to &(zd_serwer+"001dok")
  endcase	
else
  do case
*  case (zdtyp$kasa_gr.or.zkj_kasa).and..not.zdokument
    case (zdtyp$kasa_gr.or.zkj_kasa)
      *set default to &(zakas_path+"KASA")
	  set default to &(zkas_serwer+"KASA")
    case zdtyp$przerob_gr
	  set default to &(zadok_path+"001prod")	  
    otherwise	
      set default to &(zadok_path+"001dok")
  endcase	
endif
RETURN nil

FUNCTION ZAK_DEFAULT()
set default to curdir()
set default to &(zzak_serwer+"001dok")
RETURN nil

FUNCTION SDOK_DEFAULT()
  set default to curdir()
  set default to &zd_server
RETURN nil


PROCEDURE DOKDEFAULT
if.not.rekon
  set default to curdir()
  do case
    case NumKas=1
      set default to 1DOK
    case NumKas=2
      set default to 2DOK
    case NumKas=3
      set default to 3DOK
    case NumKas=4
      set default to 4DOK
    case NumKas=5
      set default to 5DOK				
    case NumKas=6
      set default to 6DOK				
    case NumKas=7
      set default to 7DOK				
    case NumKas=8
      set default to 8DOK					  	  	  
  endcase
endif  
RETURN


*******************************************************************************
*Procedura kiruje do katalogu zawierajacego magazyn przyporzadkowany jako
*glowny dla zainstalowanego stanowiska - decyduje zmienna NumStan
*******************************************************************************
PROCEDURE OLD_MAGDEFAULT
set default to curdir()
	do case
	  case NumStan=1
	    set default to 1MAG
	  case NumStan=2
	    set default to AMAG
	  case NumStan=3
	    set default to BMAG
	  case NumStan=4
	    set default to CMAG	
	  case NumStan=5
	    set default to DMAG	
	  case NumStan=6
	    set default to EMAG	
	  case NumStan=7
	    set default to FMAG	
	  case NumStan=8
	    set default to GMAG								  		
	  case NumStan=9
	    set default to HMAG	
	  case NumStan=10
	    set default to 10MAG								  				
	  case NumStan=11
	    set default to 11MAG								  				
	  case NumStan=12
	    set default to 12MAG								  				
	  case NumStan=13
	    set default to 13MAG								  				
	  case NumStan=14
	    set default to 14MAG								  				
	  case NumStan=15
	    set default to 15MAG								  				
	  case NumStan=16
	    set default to 16MAG								  				
	  case NumStan=17
	    set default to 17MAG								  				
	  case NumStan=18
	    set default to 18MAG								  				
	  case NumStan=19
	    set default to 19MAG								  				
	  case NumStan=20
	    set default to 20MAG								  																								
	  case NumStan=21
	    set default to 21MAG								  				
	  case NumStan=22
	    set default to 22MAG								  				
	  case NumStan=23
	    set default to 23MAG								  				
	  case NumStan=24
	    set default to 24MAG								  				
	  case NumStan=25
	    set default to 25MAG								  				
	  case NumStan=26
	    set default to 26MAG								  				
	  case NumStan=27
	    set default to 27MAG								  				
	  case NumStan=28
	    set default to 28MAG								  				
	  case NumStan=29
	    set default to 29MAG								  				
	  case NumStan=30
	    set default to 30MAG	
	  case NumStan=31
	    set default to 31MAG								  				
	  case NumStan=32
	    set default to 32MAG								  				
	  case NumStan=33
	    set default to 33MAG								  				
	  case NumStan=34
	    set default to 34MAG								  				
	  case NumStan=35
	    set default to 35MAG								  				
	  case NumStan=36
	    set default to 36MAG								  				
	  case NumStan=37
	    set default to 37MAG								  				
	  case NumStan=38
	    set default to 38MAG								  				
	  case NumStan=39
	    set default to 39MAG								  				
	  case NumStan=40
	    set default to 40MAG
	  case NumStan=41
	    set default to 41MAG								  				
	  case NumStan=42
	    set default to 42MAG								  				
	  case NumStan=43
	    set default to 43MAG								  				
	  case NumStan=44
	    set default to 44MAG								  				
	  case NumStan=45
	    set default to 45MAG								  				
	  case NumStan=46
	    set default to 46MAG								  				
	  case NumStan=47
	    set default to 47MAG								  				
	  case NumStan=48
	    set default to 48MAG								  				
	  case NumStan=49
	    set default to 49MAG								  				
	  case NumStan=50
	    set default to 50MAG
	  case NumStan=51
	    set default to 51MAG								  				
	  case NumStan=52
	    set default to 52MAG								  				
	  case NumStan=53
	    set default to 53MAG								  				
	  case NumStan=54
	    set default to 54MAG								  				
	  case NumStan=55
	    set default to 55MAG								  				
	  case NumStan=56
	    set default to 56MAG								  				
	  case NumStan=57
	    set default to 57MAG								  				
	  case NumStan=58
	    set default to 58MAG								  				
	  case NumStan=59
	    set default to 59MAG								  				
	  case NumStan=60
	    set default to 60MAG
	  case NumStan=61
	    set default to 61MAG								  				
	  case NumStan=62
	    set default to 62MAG								  				
	  case NumStan=63
	    set default to 63MAG								  				
	  case NumStan=64
	    set default to 64MAG								  				
	  case NumStan=65
	    set default to 65MAG								  				
	  case NumStan=66
	    set default to 66MAG								  				
	  case NumStan=67
	    set default to 67MAG								  				
	  case NumStan=68
	    set default to 68MAG								  				
	  case NumStan=69
	    set default to 69MAG								  				
	  case NumStan=70
	    set default to 70MAG
	  case NumStan=71
	    set default to 71MAG								  				
	  case NumStan=72
	    set default to 72MAG								  				
	  case NumStan=73
	    set default to 73MAG								  				
	  case NumStan=74
	    set default to 74MAG								  				
	  case NumStan=75
	    set default to 75MAG								  				
	  case NumStan=76
	    set default to 76MAG								  				
	  case NumStan=77
	    set default to 77MAG								  				
	  case NumStan=78
	    set default to 78MAG								  				
	  case NumStan=79
	    set default to 79MAG								  				
	  case NumStan=80
	    set default to 80MAG
	  case NumStan=81
	    set default to 81MAG								  				
	  case NumStan=82
	    set default to 82MAG								  				
	  case NumStan=83
	    set default to 83MAG								  				
	  case NumStan=84
	    set default to 84MAG								  				
	  case NumStan=85
	    set default to 85MAG								  				
	  case NumStan=86
	    set default to 86MAG								  				
	  case NumStan=87
	    set default to 87MAG								  				
	  case NumStan=88
	    set default to 88MAG								  				
	  case NumStan=89
	    set default to 89MAG								  				
	  case NumStan=90
	    set default to 90MAG
	  case NumStan=91
	    set default to 91MAG								  				
	  case NumStan=92
	    set default to 92MAG								  				
	  case NumStan=93
	    set default to 93MAG								  				
	  case NumStan=94
	    set default to 94MAG								  				
	  case NumStan=95
	    set default to 95MAG								  				
	  case NumStan=96
	    set default to 96MAG								  				
	  case NumStan=97
	    set default to 97MAG								  				
	  case NumStan=98
	    set default to 98MAG								  				
	  case NumStan=99
	    set default to 99MAG								  				
	  case NumStan=100
	    set default to 100MAG
	endcase
RETURN

*******************************************************************************
*Procedura kiruje do katalogu zawierajacego magazyn.                      
*Decyduje parametr okreslajacy numer przyporzadkowany magazynowi
*******************************************************************************
PROCEDURE OLD_PMAGDEFAULT
parameters pmag
set default to curdir()
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


PROCEDURE PRACDEFAULT
if.not.rekon
  set default to curdir()
  set default to pracow
endif
RETURN

*******************************************************************************
* Funkcja wybiera odpowiedni magazyn. Pmag - numer magazynu.                  *
* Rozpoznaje katalogi dla instalacji sieciowej i indywidualnej                * 
*******************************************************************************
FUNCTION MAGDEFAULT(pmag)
local ldefault
ldefault=stuff("000mag",1,3,str(pmag,3))
  if substr(ldefault,1,1)=" "
    ldefault=stuff(ldefault,1,1,"0")
  endif
  if substr(ldefault,2,1)=" "
    ldefault=stuff(ldefault,2,1,"0")
  endif
  if substr(ldefault,3,1)=" "
    ldefault=stuff(ldefault,3,1,"0")
  endif    
ldefault=zm_serwer+ldefault
set default to &ldefault
RETURN nil

*******************************************************************************
* Funkcja wybiera odpowiedni magazyn. Pmag - numer magazynu.                  *
* Rozpoznaje katalogi dla instalacji sieciowej i indywidualnej                * 
*******************************************************************************
FUNCTION SMAGDEFAULT(pmag)
local ldefault,llen
  ldefault=alltrim(zm_serwer)
  llen=len(ldefault)
  ldefault=substr(ldefault,1,llen-7)
  llen=len(ldefault)
  ldefault=stuff(ldefault,llen+1,6,"000mag")
  ldefault=stuff(ldefault,llen+2,3,str(pmag,3))
  if substr(ldefault,llen+2,1)=" "
    ldefault=stuff(ldefault,llen+2,1,"0")
  endif
  if substr(ldefault,llen+3,1)=" "
    ldefault=stuff(ldefault,llen+3,1,"0")
  endif
  if substr(ldefault,llen+4,1)=" "
    ldefault=stuff(ldefault,llen+4,1,"0")
  endif    
set default to &ldefault
RETURN nil

FUNCTION KONDEFAULT()
local sciezka:=zk_serwer+"kontrah",lks:="000fir"

if zdtyp$przes_gr
  sciezka:=zp_serwer+"kontrah"
endif

*if zkj_ksiega.and.zksilefirm>1
if zkj_ksiega.and.zkskon_wlasny
  lks=stuff(lks,1,3,str(zfirnum,3))
  if substr(lks,1,1)=" "
    lks=stuff(lks,1,1,"0")
  endif
  if substr(lks,2,1)=" "
    lks=stuff(lks,2,1,"0")
  endif  
  if substr(lks,3,1)=" "
    lks=stuff(lks,3,1,"0")
  endif  
  sciezka:=zk_serwer+lks+"\kontrah"
endif

set default to
set default to &sciezka
RETURN nil

FUNCTION PRAC_DEFAULT()
local sciezka:=zp_serwer+"pracow"
set default to
set default to &sciezka
RETURN nil

FUNCTION KS_DEFAULT(pfirm)
local ldefault
ldefault=stuff("000fir",1,3,str(pfirm,3))
  if substr(ldefault,1,1)=" "
    ldefault=stuff(ldefault,1,1,"0")
  endif
  if substr(ldefault,2,1)=" "
    ldefault=stuff(ldefault,2,1,"0")
  endif
  if substr(ldefault,3,1)=" "
    ldefault=stuff(ldefault,3,1,"0")
  endif    
ldefault=zks_serwer+ldefault
set default to &ldefault
RETURN nil