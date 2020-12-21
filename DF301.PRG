EXTERNAL _nstrin, _strout, _strin, _getcrc, _prepack, _intint, _rstint, _czbuf

&& kody sterujace drukarki
PUBLIC DrESC , DrST_SEQ, DrEND_SEQ, DrCFF, DrENQ, DrCR, DrBELL, DrCANCEL
PUBLIC ZnPAR,ZnTRF,ZnCMD,ZnSSK,ZnNaglowek
&& zachowanie drukarki po wystapieniu bledu
PUBLIC BLAD_DALEJ,BLAD_CZEKAJ
&& Bledy obslugi drukarki
PUBLIC BlTransmisji
PUBLIC BlRozbieznoscDat
PUBLIC BlOK
PUBLIC BlNieznanyRozkaz
&& Rodzaje rabatu dla linii transakcji
&&   Przy zakonczeniu transakcji nalezy wykorzystywac stale
&&   RabBrak,RabProcentowy,RabDoplProc
PUBLIC RabBrak
PUBLIC RabKwotowy
PUBLIC RabProcentowy
&& Rabat doplata procentowa
PUBLIC RabDoplProc
&& Rabat doplata kwotowa
PUBLIC RabDoplKwot
&& rabaty dla zakonczenia transkacji
PUBLIC RabAProcentowy
PUBLIC RabADoplProcentowa

&& Sposoby zakonczenia transakcji
&& TransZO stary sposob zakonczenia transakcji
&&   (zakoczenie transkacji,odciecie paragonu)
PUBLIC TransZO
&& TransBO zakonczenie transkacji bez odciecia paragonu
PUBLIC TransBO
&& TransON wydrukowanie naglowka nowego paragonu, odciecie starego
&& wlaczenie blokowego trybu transkacji
PUBLIC TransON
&& TransSkrocona oznacza wydruk skroconego podsumowania
&& przy zakonczeniu transakcji dla grupy towarow z jednej stawki podatkowej
PUBLIC TransSkrocona
&& TransSkrocona oznacza wydruk normalnego zakonczenia transkacji
PUBLIC TransNormalna
&& Czas oczekiwania na informacje zwrotna (timeout) w sekundach
PUBLIC _Timeout
_TimeOut=40

BlTransmisji=-1
BlRozbieznoscDat=-2
BlOK=0
BlNieznanyRozkaz=-3

BLAD_CZEKAJ="0"
BLAD_DALEJ="1"

DrESC = CHR(27)
DrST_SEQ = (DrESC+"P")
DrEND_SEQ = (DrESC +"\")
DrCFF = CHR(12)
DrENQ = CHR(5)
DrCR  = CHR(13)
DrBELL = CHR(7)
DrCANCEL = CHR(18)
&& Znacznik statusu
ZnPAR=1
ZnTRF=2
ZnCMD=4
ZnSSK=8
ZnNaglowek=96

RabBrak="0"
RabKwotowy="1"
RabProcentowy="2"
RabDoplProc="4"
RabDoplKwot="3"

RabAProcentowy="1"
RabADoplProc="2"
TransZO="0"
TransBO="1"
TransON="2"

TransSkrocona="1"
TransNormalna="0"

RETURN

FUNCTION MyPadr
PARAMETERS tekst,tlen,dummy
i=len(tekst)
i=tlen-i
IF i<=0
  RETURN tekst
ELSE
  RETURN tekst+space(i)
ENDIF


FUNCTION MyPadl
PARAMETERS tekst,tlen,dummy
i=len(tekst)
i=tlen-i
IF i<=0
  RETURN substr(tekst,1,tlen)
ELSE
  RETURN space(i)+tekst
ENDIF

FUNCTION nCharsIn
PARAMETERS Znakow, timeout
IF pcount()<2
  timeout=5*18
ENDIF
RETURN _nstrin(Znakow,timeout)

FUNCTION CharsOut
PARAMETERS Chars2Send,timeout
IF pcount()<2
  timeout=5
ENDIF
RETURN _strout(Chars2Send , timeout*18)

FUNCTION CharsIn
PARAMETERS timeout
IF pcount()<1
  timeout=5
ENDIF
RETURN _strin(timeout*18)

FUNCTION GetCRC
PARAMETERS Chars
RETURN _getcrc(Chars)

FUNCTION PrePack
PARAMETERS Chars
RETURN _prepack(Chars)

FUNCTION InitIntr
PARAMETERS ComIrq,ComAddr
IF pcount()<1
  RETURN _intint()
ENDIF
IF pcount()<2
  _intint(ComIrq)
ELSE
  _intint(ComIrq,ComAddr)
ENDIF

FUNCTION RestoreIntr
RETURN _rstint()

FUNCTION LA
PARAMETERS Tekst,Dlugosc
RETURN LEFT(ALLTRIM(Tekst),Dlugosc)

FUNCTION _LnTrans
PARAMETERS NumerLinii,Nazwa,Ilosc,KodPTU,Cena,Brutto,;
           RodzajRabatu,KwotaRabatu
LOCAL LRabat

IF(pcount()<=6)
&& Stary format linii transakcji
  RETURN LA(NumerLinii,2)+"$l"+MyPadr(LEFT(Nazwa,40),40)+DrCR+MyPadl(LEFT(Ilosc,16),16)+;
       DrCR+LA(KodPTU,1)+"/"+MyPadl(LA(Cena,10),10)+"/"+MyPadl(LA(Brutto,10),10)+"/"
ELSE
&& Format linii transakcji uwzgledniajacy rabat
  IF LA(RodzajRabatu,1)="0"
    RETURN LA(NumerLinii,2)+"$l"+MyPadr(LEFT(Nazwa,40),40)+DrCR+;
      MyPadl(LEFT(Ilosc,16),16)+DrCR+LA(KodPTU,1)+"/"+MyPadl(LA(Cena,10),10)+"/"+MyPadl(LA(Brutto,10),10)+"/"
  ELSE
    RETURN LA(NumerLinii,2)+";"+LA(RodzajRabatu,1)+"$l"+MyPadr(LEFT(Nazwa,40),40)+DrCR+;
      MyPadl(LEFT(Ilosc,16),16)+DrCR+LA(KodPTU,1)+"/"+MyPadl(LA(Cena,10),10)+"/"+MyPadl(LA(Brutto,10),10)+"/"+;
      MyPadl(LA(KwotaRabatu,11),11)+"/"
  ENDIF
ENDIF

FUNCTION _AkcTrans
PARAMETERS Rabat,KodTerm,Wplata,Total,Linia1,Linia2,Linia3
LOCAL Lines,LinesNo,strLineNo,LKodTerm
Lines=""
LinesNo=0
strLinesNo=""
IF (Linia1!=NIL)
  IF (LEN(Linia1)>0)
    LinesNo=LinesNo+1
    Lines=Lines+Linia1+DrCr
  END
END
IF (Linia2!=NIL)
  IF (LEN(Linia2)>0)
    LinesNo=LinesNo+1
    Lines=Lines+Linia2+DrCr
  END
END
IF (Linia3!=NIL)
  IF (LEN(Linia3)>0)
    LinesNo=LinesNo+1
    Lines=Lines+Linia3+DrCr
  END
END
IF (LinesNo>0)
  strLinesNo=";"+ALLTRIM(STR(LinesNo))
END
LKodTerm=IF(KodTerm=NIL,"---",IF(ALLTRIM(KodTerm)=="","---",KodTerm))
RETURN ("1;"+LA(Rabat,2)+strLinesNo+"$e"+LA(LKodTerm,3)+DrCR+Lines+ALLTRIM(Wplata)+;
          "/"+ALLTRIM(Total)+"/")


FUNCTION _NFAkcTrans
PARAMETERS TrybTrans,RodzRabatu,Skrocona,Rabat,KodTerm,;
           Wplata,Total,Linia1,Linia2,Linia3
LOCAL LRabat,Lines,LinesNo,LTrybTrans,LRodzRabatu,LSkrocona,LKodTerm
Lines=""
LinesNo=0
IF (Linia1!=NIL)
  IF (LEN(Linia1)>0)
    LinesNo=LinesNo+1
    Lines=Lines+Linia1+DrCr
  END
END
IF (Linia2!=NIL)
  IF (LEN(Linia2)>0)
    LinesNo=LinesNo+1
    Lines=Lines+Linia2+DrCr
  END
END
IF (Linia3!=NIL)
  IF (LEN(Linia3)>0)
    LinesNo=LinesNo+1
    Lines=Lines+Linia3+DrCr
  END
END
LTrybTrans=IF(TrybTrans=NIL,TransZO,TrybTrans)
LRodzRabatu=IF(RodzRabatu=NIL,RabBrak,RodzRabatu)
LSkrocona=IF(Skrocona=NIL,TransNormalna,Skrocona)
LRabat=IF(LRodzRabatu==RabBrak,"",LA(ALLTRIM(Rabat),11)+"/")
LKodTerm=IF(KodTerm=NIL,"---",IF(ALLTRIM(KodTerm)=="","---",KodTerm))
RETURN ("1;0;"+ALLTRIM(STR(LinesNo))+";"+LA(LTrybTrans,1)+";"+LA(LRodzRabatu,1)+";"+;
  LA(LSkrocona,1)+"$e"+LA(LKodTerm,3)+DrCR+Lines+ALLTRIM(Wplata)+"/"+ALLTRIM(Total)+"/"+;
  ALLTRIM(LRabat))

FUNCTION _StTrans
PARAMETERS PozycjiSprzedazy,Linia1,Linia2,Linia3
LOCAL LinesNo,Lines
Lines=""
LinesNo=0
IF (PozycjiSprzedazy=NIL)
  PozycjiSprzedazy=0
END
IF (Linia1!=NIL)
  IF (LEN(Linia1)>0)
    LinesNo=LinesNo+1
    Lines=Lines+MyPADR(Linia1,40)+DrCr
  END
END
IF (Linia2!=NIL)
  IF (LEN(Linia2)>0)
    LinesNo=LinesNo+1
    Lines=Lines+MyPADR(Linia2,40)+DrCr
  END
END
IF (Linia3!=NIL)
  IF (LEN(Linia3)>0)
    LinesNo=LinesNo+1
    Lines=Lines+MyPADR(Linia3,40)+DrCr
  END
END
RETURN LA(PozycjiSprzedazy,2)+";"+ALLTRIM(STR(LinesNo))+"$h"+Lines

FUNCTION _AnulujTrans
RETURN "0$e"

FUNCTION _WplataDoKasy
PARAMETERS Wplata
RETURN "0#i"+ALLTRIM(Wplata)+"/"

FUNCTION _WyplataZKasy
PARAMETERS Wyplata
RETURN "0#d"+ALLTRIM(Wyplata)+"/"

FUNCTION _StanKasy
RETURN "0#t"

FUNCTION _RaportKasy
PARAMETERS Zmiana, Kasjer
RETURN "0#k"+LEFT(Zmiana,8)+DrCR+LEFT(Kasjer,32)+DrCR

FUNCTION _RaportOkresowy
PARAMETERS Rok1,Miesiac1,Dzien1,Rok2,Miesiac2,Dzien2
RETURN LA(Rok1,2)+";"+LA(Miesiac1,2)+";"+LA(Dzien1,2)+";"+LA(Rok2,2)+ ;
   ";"+LA(Miesiac2,2)+";"+LA(Dzien2,2)+"#o"

FUNCTION _RaportDobowy
RETURN "0#r"

FUNCTION _ObslugaBledow
PARAMETERS TrybObslugi
RETURN LA(TrybObslugi,1)+"#e"

FUNCTION _UstawZegar
PARAMETERS Rok,Miesiac,Dzien,Godzina,Minuta,Sekunda
IF pcount()<2
  RETURN  Rok+"$c"
ENDIF
RETURN LA(Rok,2)+";"+LA(Miesiac,2)+";"+LA(Dzien,2)+";"+LA(Godzina,2)+ ;
     ";"+LA(Minuta,2)+";"+LA(Sekunda,2)+"$c"

FUNCTION _OtworzSzuflade
RETURN "1$d"

FUNCTION _WyswNapis
PARAMETERS Tekst
RETURN "2$d"+Tekst

FUNCTION _WyswZegar
RETURN "3$d"

FUNCTION _WyswKase
RETURN "4$d"

FUNCTION _Naglowek
PARAMETERS Tekst
Tekst=LEFT(Tekst,216)
IF substr(Tekst,len(tekst),1)<>DrCR
  Tekst=Tekst+DrCR
ENDIF
RETURN "0$f"+Tekst+chr(255)

FUNCTION _PodajDate
RETURN "0#c"

FUNCTION _PodajInfoKasowe
RETURN "0#s"

FUNCTION _WlaczGlos
RETURN "0#x"

FUNCTION _WylaczGlos
RETURN "1#x"

&& Wydawanie rozkazow drukarce
FUNCTION _Druk
PARAMETERS Tekst,timeout
&& ? STRTRAN(Tekst,DrCr,"|")
IF pcount()<2
  RETURN CharsOut(PrePack(Tekst))
ELSE
  RETURN CharsOut(PrePack(Tekst),timeout)
ENDIF

  && Rozpoznaje typ parametru i dokonuje automatycznej konwersji
  && na ciag znakow
FUNCTION _StdKnw
PARAMETERS _Parametr
DO CASE
  CASE VALTYPE(_Parametr)=="N"
    RETURN ALLTRIM(STR(_Parametr))
  CASE VALTYPE(_Parametr)=="C"
    RETURN ALLTRIM(_Parametr)
ENDCASE
RETURN ""

&& funkcja dokonuje konwersji parametry do standardowej postaci ceny
FUNCTION _StdPrc
PARAMETERS _Parametr
DO CASE
  CASE VALTYPE(_Parametr)=="N"
    RETURN ALLTRIM(TRANSFORM(_Parametr,"99999999999.99"))
  CASE VALTYPE(_Parametr)=="C"
    RETURN ALLTRIM(_Parametr)
ENDCASE
RETURN ""

  && Wykonuje automatyczna konwersje podanej stawki PTU na kod PTU
FUNCTION _PTUKnw
PARAMETERS _Stawka
DO CASE
  CASE VALTYPE(_Stawka)=="C"
    RETURN UPPER(ALLTRIM(_Stawka))
  CASE VALTYPE(_Stawka)=="N"
    && Jesli drukarka ma zdefiniowana podana stawke, to funkcja zwroci jej kod
    && jesli nie, to wynikiem funkcji bedzie pusty ciag znakow
    RETURN DrVatNaKod(_Stawka)
ENDCASE
RETURN ""

&& obsluga transkacji
&& Wystartuj transakcje
FUNCTION DrStTrans
LOCAL Result
PARAMETERS PozycjiSprzedazy,Linia1,Linia2,Linia3
Result=_Druk(_StTrans(_StdKnw(PozycjiSprzedazy),Linia1 ,Linia2 ,Linia3))
RETURN DrPodajKodBledu(Result)

&& Drukuj linie transakcji
FUNCTION DrLnTrans
PARAMETERS NumerLinii,Nazwa,Ilosc,KodPTU,Cena,Brutto,;
           RodzajRabatu,KwotaRabatu
IF(pcount()<=6)
  RETURN  DrPodajKodBledu(_Druk(_LnTrans(_StdKnw(NumerLinii),;
    Nazwa,_StdKnw(Ilosc),_PTUKnw(KodPTU),;
    _StdKnw(Cena),_StdKnw(Brutto))))
ELSE
  RETURN  DrPodajKodBledu(_Druk(_LnTrans(_StdKnw(NumerLinii),;
  Nazwa,_StdKnw(Ilosc),_PTUKnw(KodPTU),;
  _StdKnw(Cena),_StdKnw(Brutto),RodzajRabatu,_StdKnw(KwotaRabatu))))
ENDIF

&& Akceptacja transakcji
FUNCTION DrAkcTrans
PARAMETERS Rabat,KodTerm,Wplata,Total,Linia1,Linia2,Linia3
RETURN  DrPodajKodBledu(_Druk(_AkcTrans(_StdKnw(Rabat),KodTerm,;
  _StdKnw(Wplata),_StdKnw(Total),Linia1,Linia2,Linia3)),_Timeout)


FUNCTION DrNFAkcTrans
PARAMETERS TrybTrans,RodzRabatu,Skrocona,Rabat,KodTerm,;
           Wplata,Total,Linia1,Linia2,Linia3
RETURN  DrPodajKodBledu(_Druk(_NFAkcTrans(TrybTrans,RodzRabatu,Skrocona,;
        _StdKnw(Rabat),KodTerm,_StdKnw(Wplata),_StdKnw(Total),;
        Linia1,Linia2,Linia3)),_Timeout)

&& Anulacja transakcji
FUNCTION DrAnulujTrans
RETURN DrPodajKodBledu(_Druk(_AnulujTrans()))

&& Drukowanie raportow
FUNCTION DrWplataDoKasy
PARAMETERS Wplata
RETURN DrPodajKodBledu(_Druk(_WplataDoKasy(_StdKnw(Wplata))))

FUNCTION DrWyplataZKasy
PARAMETERS Wyplata
RETURN   DrPodajKodBledu(_Druk(_WyplataZKasy(_StdKnw(Wyplata))))

FUNCTION DrStanKasy
RETURN  DrPodajKodBledu(_Druk(_StanKasy()))

FUNCTION DrWlaczGlos
RETURN  DrPodajKodBledu(_Druk(_WlaczGlos()))

FUNCTION DrWylaczGlos
RETURN  DrPodajKodBledu(_Druk(_WylaczGlos()))

FUNCTION DrRaportKasy
PARAMETERS Zmiana, Kasjer
RETURN  DrPodajKodBledu(_Druk(_RaportKasy(Zmiana,Kasjer)))

FUNCTION DrRaportOkresowy
PARAMETERS Rok1,Miesiac1,Dzien1,Rok2,Miesiac2,Dzien2
RETURN DrPodajKodBledu(_Druk(_RaportOkresowy(;
  Rok1,Miesiac1,Dzien1,Rok2,Miesiac2,Dzien2)),45)

FUNCTION DrObslugaBledow
PARAMETERS TrybObslugi
RETURN DrPodajKodBledu(_Druk(_ObslugaBledow(TrybObslugi)))

&& Programowanie parametr¢w

FUNCTION DrUstawZegar
PARAMETERS Rok,Miesiac,Dzien,Godzina,Minuta,Sekunda
IF(pcount()<2)
  RETURN DrPodajKodBledu(_Druk(_UstawZegar(Rok)))
ENDIF
RETURN  DrPodajKodBledu(_Druk(_UstawZegar(;
  Rok,Miesiac,Dzien,Godzina,Minuta,Sekunda)))

FUNCTION DrOtworzSzuflade
RETURN DrPodajKodBledu(CharsOut(DrST_SEQ+_OtworzSzuflade()+DrEND_SEQ))

FUNCTION DrWyswNapis
PARAMETERS Tekst
RETURN DrPodajKodBledu(CharsOut(DrST_SEQ+_WyswNapis(Tekst)+DrEND_SEQ))

FUNCTION DrWyswZegar
RETURN DrPodajKodBledu(CharsOut(DrST_SEQ+_WyswZegar()+DrEND_SEQ))

FUNCTION DrWyswKase
RETURN DrPodajKodBledu(CharsOut(DrST_SEQ+_WyswKase()+DrEND_SEQ))

FUNCTION DrBell
RETURN DrPodajKodBledu(CharsOut(DrBELL))

FUNCTION DrNaglowek
PARAMETERS Tekst
RETURN DrPodajKodBledu(_Druk(_Naglowek(Tekst)))

FUNCTION _DrPodajDate
RETURN CharsOut(DrST_SEQ+_PodajDate()+DrEND_SEQ)

FUNCTION _DrRaportDobowy
RETURN DrPodajKodBledu(_Druk(_RaportDobowy()),120)

FUNCTION _DrPodajInfoKasowe
RETURN CharsOut(DrST_SEQ+_PodajInfoKasowe()+DrEND_SEQ)


FUNCTION _DoSeparatora
PARAMETERS Tekst,Separator
LOCAL SeparatorAt
SeparatorAt=at(Separator,Tekst)
IF(SeparatorAt<=0)
  RETURN Tekst
END
RETURN left(tekst,SeparatorAt-1)

FUNCTION _ZaSeparatorem
PARAMETERS Tekst,Separator
LOCAL SeparatorAt
SeparatorAt=at(Separator,Tekst)
IF(SeparatorAt<=0)
  RETURN ""
ENDIF
RETURN substr(Tekst,SeparatorAt+1)

FUNCTION _SpakujDate
PARAMETERS rok,miesiac,dzien,godzina,minuty
RETURN PAD(rok,2,"0")+";"+MyPadl(miesiac,2,"0")+";"+MyPadl(dzien,2,"0")+;
  ";"+MyPadl(godzina,2,"0")+";"+MyPadl(minuty,2,"0")+";00"

FUNCTION _SpakujClDate
PARAMETERS Data,Czas
RETURN RIGHT(STR(YEAR(Data)),2)+";"+STR(MONTH(Data),2)+";"+STR(DAY(Data),2)+";"+ ;
  substr(Czas,1,2)+";"+substr(Czas,4,2)+";"+substr(Czas,7,2)


FUNCTION DrPodajDate
  PARAMETERS Result
  LOCAL DataIn,rok,miesiac,dzien,godzina,minuty,Stat
  _czbuf()
  Stat=_DrPodajDate()
  IF(Stat==BlOK)
    DataIn=_strin(5*18)
  ELSE
    RETURN Stat
  END
  IF(len(DataIn)==0)
    RETURN BlTransmisji
  ENDIF
  IF((substr(DataIn,1,5)<>(DrESC+"P1#T")).AND.(substr(DataIn,1,5)<>(DrESC+"P1#C")))
    RETURN BlTransmisji
  ENDIF
  DataIn=substr(DataIn,6)
  rok=_DoSeparatora(DataIn,";")
  DataIn=_ZaSeparatorem(DataIn,";")
  miesiac=_DoSeparatora(DataIn,";")
  DataIn=_ZaSeparatorem(DataIn,";")
  dzien=_DoSeparatora(DataIn,";")
  DataIn=_ZaSeparatorem(DataIn,";")
  godzina=_DoSeparatora(DataIn,";")
  DataIn=_ZaSeparatorem(DataIn,";")
  minuty=_DoSeparatora(DataIn,";")
  DataIn=_ZaSeparatorem(DataIn,";")
  IF(DataIn<>"0"+DrESC+"\")
    RETURN BlTransmisji
  ENDIF
  IF((val(rok)==0).OR.(val(miesiac)==0).OR.(val(dzien)==0))
    RETURN BlTransmisji
  ENDIF
  Result=PAD(rok,2,"0")+";"+MyPadl(miesiac,2,"0")+";"+MyPadl(dzien,2,"0")+";"+;
         MyPadl(godzina,2,"0")+";"+MyPadl(minuty,2,"0")+";00"
  RETURN BlOK

FUNCTION Time2Seconds
PARAMETERS Tm
RETURN val(substr(Tm,7,2))+60*(val(substr(Tm,4,2)) + 60*val(substr(Tm,1,2)))

FUNCTION _PorownajDaty
PARAMETERS Data1,Data2
LOCAL Dt1,Dt2,Tm1,Tm2
dt1=ctod(substr(Data1,4,2)+"/"+substr(Data1,7,2)+"/"+substr(Data1,1,2))
dt2=ctod(substr(Data2,4,2)+"/"+substr(Data2,7,2)+"/"+substr(Data2,1,2))
Tm1=Time2Seconds(substr(Data1,10))
Tm2=Time2Seconds(substr(Data2,10))
RETURN (dt2-dt1)*3600*24+Tm2-Tm1


&& drukuje raport dobowy. Dopuszczalna roznica jest liczba dopuszczalnych
&& liczba sekund pomiedzy czasem drukarki, a czasem systemowym
FUNCTION DrRaportDobowy
PARAMETERS DopuszczalnaRoznica
LOCAL DataDrukarki,_BlDataDrukarki
DataDrukarki=""
_BlDataDrukarki=DrPodajDate(@DataDrukarki)
IF(_BlDataDrukarki<>BlOK)
  RETURN _BlDataDrukarki
ENDIF
IF(abs(_PorownajDaty(DataDrukarki,_SpakujClDate(date(),time())))> ;
        DopuszczalnaRoznica)
  DrBell()
  RETURN BlRozbieznoscDat
ENDIF
RETURN _DrRaportDobowy()

&& Zerowanie wyswietlacza
FUNCTION DrZerujWysw

IF(DrStTrans("1")==BlOK)
  RETURN DrAnulujTrans()
ELSE
  RETURN BlTransmisji
ENDIF
RETURN BlOK


&& zwraca szereg informacji kasowych
FUNCTION DrPodajInfoKasowe
PARAMETERS TabWyniku,timeout
LOCAL mRekord,status
LOCAL KodBledu, TrybPracy1, TrybPracy2, ZnacznikTRF, FormatKwot, ;
    LiczbaZerowan, RAMrok, RAMmiesiac, RAMdzien,;
    LiczbaStawekPTU,PTU_A, PTU_B, ;
    PTU_C, PTU_D, PTU_E, PTU_F, LiczbaParagonow, ;
    TOT_A, TOT_B, TOT_C, TOT_D, TOT_E, TOT_F, TOT_Z, ;
    Gotowka, NumerDrukarki
&& W TabWart (tablicy) przechowuje ciagi znakow pomiedzy poszczegolnymi
&& znakami "/". Elementy tej tablicy interpretowane sa nastepnie
&& w zaleznosci od liczby znakow "/" (liczby stawek PTU) i przypisywane
&& DO odpowiednich zmiennych PTU_, TOT_ itd..
LOCAL TabWart[18],LicznikSlash,StartTot

&& Ustal wartosci typow elementow TabWyniku

KodBledu        =-1
TrybPracy1      =-1
TrybPracy2      =-1
ZnacznikTRF     =-1
FormatKwot      =""
LiczbaZerowan   =-1
RAMrok          =-1
RAMmiesiac      =-1
RAMdzien        =-1
LiczbaStawekPTU =-1
PTU_A           =-1
PTU_B           =-1
PTU_C           =-1
PTU_D           =-1
PTU_E           =-1
PTU_F           =-1
LiczbaParagonow =-1
TOT_A           =-1
TOT_B           =-1
TOT_C           =-1
TOT_D           =-1
TOT_E           =-1
TOT_F           =-1
TOT_Z           =-1
Gotowka         =-1
NumerDrukarki   =""

TabWyniku[ 1]=KodBledu
TabWyniku[ 2]=TrybPracy1
TabWyniku[ 3]=TrybPracy2
TabWyniku[ 4]=ZnacznikTRF
TabWyniku[ 5]=FormatKwot
TabWyniku[ 6]=LiczbaZerowan
TabWyniku[ 7]=RAMrok
TabWyniku[ 8]=RAMmiesiac
TabWyniku[ 9]=RAMdzien
TabWyniku[10]=LiczbaStawekPTU
TabWyniku[11]=PTU_A
TabWyniku[12]=PTU_B
TabWyniku[13]=PTU_C
TabWyniku[14]=PTU_D
TabWyniku[15]=PTU_E
TabWyniku[16]=PTU_F
TabWyniku[17]=LiczbaParagonow
TabWyniku[18]=TOT_A
TabWyniku[19]=TOT_B
TabWyniku[20]=TOT_C
TabWyniku[21]=TOT_D
TabWyniku[22]=TOT_E
TabWyniku[23]=TOT_F
TabWyniku[24]=TOT_Z
TabWyniku[25]=Gotowka
TabWyniku[26]=NumerDrukarki

_czbuf()
IF pcount()<2
  timeout=10
ENDIF
status=DrPodajStatus(timeout)
IF(_DrPodajInfoKasowe()<0)
  RETURN BlTransmisji
ENDIF
mRekord=_strin(timeout)
IF(len(mRekord)<=0)
  RETURN BlTransmisji
ENDIF
IF(substr(mRekord,1,5) <> DrESC+"P1#X")
  RETURN BlTransmisji
ENDIF

mRekord=substr(mRekord,6)
KodBledu=val(_DoSeparatora(mRekord,";"))
IF KodBledu==0
  IF(status<0)
     KodBledu= BlTransmisji
  ELSEIF (CzyRozkazPopr(status))
    KodBledu=BlOK
  ELSE
    KodBledu=BlNieznanyRozkaz
  ENDIF
ENDIF

mRekord=_ZaSeparatorem(mRekord,";")
TrybPracy1=val(_DoSeparatora(mRekord,";"))
mRekord=_ZaSeparatorem(mRekord,";")
TrybPracy2=val(_DoSeparatora(mRekord,";"))
mRekord=_ZaSeparatorem(mRekord,";")
ZnacznikTRF=val(_DoSeparatora(mRekord,";"))
mRekord=_ZaSeparatorem(mRekord,";")
FormatKwot=_DoSeparatora(mRekord,";")
mRekord=_ZaSeparatorem(mRekord,";")
LiczbaZerowan=val(_DoSeparatora(mRekord,";"))
mRekord=_ZaSeparatorem(mRekord,";")
RAMrok=val(_DoSeparatora(mRekord,";"))
mRekord=_ZaSeparatorem(mRekord,";")
RAMmiesiac=val(_DoSeparatora(mRekord,";"))
mRekord=_ZaSeparatorem(mRekord,";")
RAMdzien=val(_DoSeparatora(mRekord,"/"))
mRekord=_ZaSeparatorem(mRekord,"/")

AFILL(TabWart,"")
&& wczytaj stringi pomiedzy "/" DO tablicy TabWart DO ostatniego "/"
LicznikSlash=1
&& zmodyfikuj troche mRekord tak aby ponizsza petla mogla zakonczyc
&& dzialanie, jak i wstaw straznika na koniec stringu
IF(LEN(mRekord)>2)
  mRekord=LEFT(mRekord,LEN(mRekord)-2)+"/"+RIGHT(mRekord,2)
ENDIF
mRekord=mRekord+"/"

DO WHILE (LicznikSlash<19).AND.(LEN(mRekord)>0)
  TabWart[LicznikSlash]=_DoSeparatora(mRekord,"/")
  LicznikSlash=LicznikSlash+1
  mRekord=_ZaSeparatorem(mRekord,"/")
END
LicznikSlash=LicznikSlash-1
  && czy blad transmisji
IF((TabWart[LicznikSlash]<>DrESC+"\").OR.;
    ((LicznikSlash<>7).AND.(LicznikSlash<>9).AND.(LicznikSlash<>11).AND.;
    (LicznikSlash<>13).AND.(LicznikSlash<>15).AND.(LicznikSlash<>17)))
  RETURN BlTransmisji
ENDIF
LicznikSlash=LicznikSlash-1
LiczbaStawekPTU=(LicznikSlash-4)/2
StartTot=LiczbaStawekPTU+2
PTU_A=Val(TabWart[1])
TOT_A=Val(TabWart[StartTot])
IF(LiczbaStawekPTU>1)
  PTU_B=Val(TabWart[2])
  TOT_B=Val(TabWart[StartTot+1])
  IF(LiczbaStawekPTU>2)
    PTU_C=Val(TabWart[3])
    TOT_C=Val(TabWart[StartTot+2])
    IF(LiczbaStawekPTU>3)
      PTU_D=Val(TabWart[4])
      TOT_D=Val(TabWart[StartTot+3])
      IF(LiczbaStawekPTU>4)
        PTU_E=Val(TabWart[5])
        TOT_E=Val(TabWart[StartTot+4])
        IF(LiczbaStawekPTU>5)
          PTU_F=Val(TabWart[6])
          TOT_F=Val(TabWart[StartTot+5])
        ENDIF
      ENDIF
    ENDIF
  ENDIF
ENDIF

LiczbaParagonow=Val(TabWart[StartTot-1])
TOT_Z=Val(TabWart[StartTot+LiczbaStawekPTU])
Gotowka=Val(TabWart[StartTot+LiczbaStawekPTU+1])
NumerDrukarki=TabWart[StartTot+LiczbaStawekPTU+2]

TabWyniku[1] =KodBledu
TabWyniku[2] =TrybPracy1
TabWyniku[3] =TrybPracy2
TabWyniku[4] =ZnacznikTRF
TabWyniku[5] =FormatKwot
TabWyniku[6] =LiczbaZerowan
TabWyniku[7] =RAMrok
TabWyniku[8] =RAMmiesiac
TabWyniku[9] =RAMdzien
TabWyniku[10]=LiczbaStawekPTU
TabWyniku[11]=PTU_A
TabWyniku[12]=PTU_B
TabWyniku[13]=PTU_C
TabWyniku[14]=PTU_D
TabWyniku[15]=PTU_E
TabWyniku[16]=PTU_F
TabWyniku[17]=LiczbaParagonow
TabWyniku[18]=TOT_A
TabWyniku[19]=TOT_B
TabWyniku[20]=TOT_C
TabWyniku[21]=TOT_D
TabWyniku[22]=TOT_E
TabWyniku[23]=TOT_F
TabWyniku[24]=TOT_Z
TabWyniku[25]=Gotowka
TabWyniku[26]=NumerDrukarki

RETURN BlOk

FUNCTION DrPodajStatus
PARAMETERS timeout
LOCAL status,nstatus

IF pcount()<1
  timeout=5
ENDIF
_czbuf()
IF(CharsOut(DrENQ)<0)
  RETURN BlTransmisji
ENDIF
&& Wczytujemy pierwsza odpowiedz na pytanie o status, musi przyjsc
&& jesli drukarka jest sprawna
status=nCharsIn(1,timeout*18)
nstatus=status
&& Wczytujemy nadmiarowe odpowiedzi na status. Podobno moga takie nadejsc..
DO WHILE len(nstatus)>0
  nstatus=nCharsIn(1,5)
  IF(len(nstatus)>0)
    status=nstatus
  ENDIF
ENDDO
IF (len(status)>0)
  RETURN ASC(status)
END
RETURN BlTransmisji

FUNCTION RozlozDrDate
PARAMETERS DrData,ClData,ClCzas
ClData=substr(DrData,4,2)+"/"+substr(DrData,7,2)+"/"+substr(DrData,1,2)
ClCzas=substr(DrData,10,2)+":"+substr(DrData,13,2)+":"+substr(DrData,16,2)
RETURN BlOK

FUNCTION DrCzyscWysw
RETURN DrWyswNapis(DrCFF)

FUNCTION SprawdzZnacznik
PARAMETERS Status,Znacznik
LOCAL BitAnd
BitAnd=_chflag(Status,Znacznik)
RETURN BitAnd==Znacznik

FUNCTION CzyTransPopr
PARAMETERS Status
RETURN SprawdzZnacznik(Status,ZnTRF)

FUNCTION CzyRozkazPopr
PARAMETERS Status
RETURN SprawdzZnacznik(Status,ZnCMD)

FUNCTION CzyTrybTrans
PARAMETERS Status
RETURN SprawdzZnacznik(Status,ZnPAR)

FUNCTION CzyTrybFiskalny
PARAMETERS Status
RETURN SprawdzZnacznik(Status,ZnSSK)

FUNCTION CzyNaglowekPopr
PARAMETERS Status
RETURN SprawdzZnacznik(Status,ZnNaglowek)

&& zwraca kod bledu ostatnio wykonanej operacji
FUNCTION DrPodajKodBledu
PARAMETERS BladTrans,timeout
LOCAL KodBledu,TabInfoKasowe[40]
IF(type(str(BladTrans))=="C")
  IF(BladTrans=="")
    RETURN BlTransmisji
  ENDIF
ELSEIF (BladTrans<>BlOK)
  RETURN BlTransmisji
ENDIF
IF pcount()<2
  timeout=_Timeout
ENDIF
IF(DrPodajInfoKasowe(TabInfoKasowe,timeout)<>BlOK)
  RETURN BlTransmisji
ENDIF
RETURN TabInfoKasowe[1]

  && funkcja zamienia stawke VAT wyrazona w procentach (-1 zwolnienie)
  && na stawke rozpoznawana przez drukarke zgodnie ze informacja kasowa
  && zwrocona przez DrPodajInfoKasowe
FUNCTION DrVatNaKod
PARAMETERS ParVatPrc,ParInfoTable
LOCAL LocTabInfoKasowe[40]
IF (ParInfoTable=NIL)
  && nie podano tablicy z danymi drukarki, pozyskujemy ja
  IF (DrPodajInfoKasowe(LocTabInfoKasowe)=BlOK)
    RETURN _DrVat2Code(ParVatPrc,LocTabInfoKasowe)
  ENDIF
  RETURN ""
ENDIF
RETURN _DrVat2Code(ParVatPrc,ParInfoTable)

FUNCTION _DrVat2Code
PARAMETERS ParVatPrc,ParInfoTable
DO CASE
  CASE ParVatPrc=-1
    RETURN "Z"
  CASE ParVatPrc=ParInfoTable[11].OR.ParVatPrc*100=ParInfoTable[11]
    return "A"
  CASE ParVatPrc=ParInfoTable[12].OR.ParVatPrc*100=ParInfoTable[12]
    return "B"
  CASE ParVatPrc=ParInfoTable[13].OR.ParVatPrc*100=ParInfoTable[13]
    return "C"
  CASE ParVatPrc=ParInfoTable[14].OR.ParVatPrc*100=ParInfoTable[14]
    return "D"
  CASE ParVatPrc=ParInfoTable[15].OR.ParVatPrc*100=ParInfoTable[15]
    return "E"
  CASE ParVatPrc=ParInfoTable[16].OR.ParVatPrc*100=ParInfoTable[16]
    return "F"
ENDCASE
RETURN ""

  && funkcja antysymetryczna w dzialania w stosunku do Vat2Code.
  && zwraca stawke Vat zwiazana z danym kodem (-1 jesli zwolniona)
  && Jezeli zdarzy sie jakis blad, to funkcja pusty zwraca ciag znakow
FUNCTION DrKodNaVat
PARAMETERS ParCode,ParInfoTab
LOCAL LocTabInfoKasowe[40],LocIndeks

LocIndeks=DrKodNaIndeks(ParCode)
IF (LocIndeks>0)
  IF (ParInfoTab=NIL)
      && nie podano tablicy z danymi drukarki, pozyskujemy ja
    IF (DrPodajInfoKasowe(LocTabInfoKasowe)=BlOK)
      return LocTabInfoKasowe[LocIndeks]
    ENDIF
    RETURN -2
  ENDIF
  RETURN ParInfoTab[LocIndeks]
ENDIF
IF (ParCode=="Z")
  RETURN -1
ENDIF
RETURN -2

FUNCTION DrKodNaIndeks
PARAMETERS ParCode
DO CASE
  CASE ParCode=="A"
    return 11
  CASE ParCode=="B"
    return 12
  CASE ParCode=="C"
    return 13
  CASE ParCode=="D"
    return 14
  CASE ParCode=="E"
    return 15
  CASE ParCode=="F"
    return 16
ENDCASE
return -1

&& Automatyczna detekcja comm'a z podlaczona drukarka. Funkcja zwraca
&& numer RS do ktorego podlaczono drukarke, albo -1 jesli nie odnaleziono
&& drukarki. Funkcja ta moze byc wywolana na poczatku programu poprzez
&&   RDComm=RDKtoryRS()
&&   if (RDComm<=0)
&&     RDComm=1
&&     && informacja o braku drukarki ..
&&   endif
&& UWAGA Jesli do jednego z Comm'ow podlaczono urzadzenie inne niz drukarka
&& po wywolaniu RDKtoryRS() moze okazac sie, ze urzadzenie to nie bedzie 
&& dzialac poprawnie.

FUNCTION DRKtoryRS
LOCAL DRRSno,DRStatus
FOR DRRSno=1 TO 8
  InitIntr(DRRSno)
  DRStatus=DrPodajStatus(1)
  RestoreIntr()
  if (DRStatus!=BlTransmisji)
    RETURN DRRSno
  END
NEXT
RETURN -1





