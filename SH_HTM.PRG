*******************************************************************************
* WYDRUK WINDOWS                                                                      *
*******************************************************************************
FUNCTION HTML_START()

lwiersz="<html>"+chr(13)+chr(10)
lwiersz=lwiersz+"<meta http-equiv='Content-Type' content='text/html; charset=ibm852'>"+chr(13)+chr(10)
lwiersz=lwiersz+"<head> </head>"+chr(13)+chr(10)
lwiersz=lwiersz+"<body>"+chr(13)+chr(10)

plik="wydruki\remanent.htm"

lwiersz=lwiersz+"</body>"+chr(13)+chr(10)
lwiersz=lwiersz+"</html>"+chr(13)+chr(10)
lwiersz=lwiersz+"<FONT COLOR = 'WHITE'>"+chr(13)+chr(10)
memowrit("wydruki\remanent.htm",lwiersz)
run explorer wydruki\remanent.htm
RETURN
*******************************************************************************
* Wydruk dokumentow                                                           *
*******************************************************************************
FUNCTION DOK_WIN_DRUK(pplik,pdok)
*local ilosc:=1,plik:="wydruki\nowy.txt",select:=select(),ek
local plik:="wydruki\nowy.txt",select:=select(),ek
local ldarchiwum:=zdarchiwum,ldokplik:=""
local lw_dewizach:=zw_dewizach
local lwiersz:="",loryginal:=""
local k:=1
private vdok:=pdok

plik="wydruki\dokument.htm"
**
*****************************************************************
*program tworzy plik f_vat.htm

lwiersz="<html>"+chr(13)+chr(10)

lwiersz=lwiersz+"<meta http-equiv='Content-Type' content='text/html; charset=ibm852'>"+chr(13)+chr(10)
lwiersz=lwiersz+"<head> </head>"+chr(13)+chr(10)
lwiersz=lwiersz+"<body>"+chr(13)+chr(10)


if zpapier_typ>0
  loryginal="EGZEMPLARZ 1 / EGZEMPLARZ 2"
endif

if zduplikat
  loryginal="DUPLIKAT"
endif  
lwiersz=dok_win_tyt(lwiersz,loryginal)
lwiersz=lwiersz+"<br>"+chr(13)+chr(10)

lwiersz=win_dok_kto(lwiersz)

lwiersz=lwiersz+"<br><br>"+chr(13)+chr(10)

do case
  case zdznak$zkordok_znak
    lwiersz=win_pozkor(lwiersz) 
  case zdtyp$kasa_gr
    lwiersz=win_kaspoz(lwiersz)
  otherwise

    lwiersz=win_poz(lwiersz)
endcase

lwiersz=lwiersz+"<br><br>"+chr(13)+chr(10)
if zdznak$zkordok_znak
  lwiersz=win_kwota(lwiersz)
else
  lwiersz=win_do_zaplaty(lwiersz)
endif

if zdtyp$wew_gr
  lwiersz=win_wew(lwiersz)
endif


lwiersz=win_opisdok(lwiersz)

lwiersz=win_grozba(lwiersz)

if zdtyp$wew_gr
  lwiersz=lwiersz+"<br>"+chr(13)+chr(10)
else
  lwiersz=lwiersz+"<br><br><br>"+chr(13)+chr(10)
endif
lwiersz=win_podpis(lwiersz)
  
lwiersz=lwiersz+"</body>"+chr(13)+chr(10)
lwiersz=lwiersz+"</html>"+chr(13)+chr(10)
lwiersz=lwiersz+"<FONT COLOR = 'WHITE'>"+chr(13)+chr(10)
memowrit("wydruki\dokument.htm",lwiersz)
run explorer wydruki\dokument.htm

close
select &select
RETURN nil



FUNCTION DOK_WIN_TYT(pwiersz,poryginal)
local ltyt:="",lrep:=len(alltrim(ztyt_dok))+18+len(alltrim(zdndow))+len(alltrim(zlaman_dok))
*lrep:=len(alltrim(ztyt_dok))+20+len(alltrim(zlaman_dok))
local ltyt_dok:="",ldata:="",lkol:=0
local ldotyczy:=space(120),ldndok:=""
local lwiersz:=pwiersz,ltytnum:="",ldat
local ldata_wystawienia:="    Data wystawienia  "
local logo_bmp:="\"+curdir()+"\shset\logo.bmp"
local logo_jpg:="\"+curdir()+"\shset\logo.jpg"
local logo_gif:="\"+curdir()+"\wydruki\logo.gif"
do case
  case zdtyp$sprzedaz_gr
    ltyt_dok="Wydanie zewn©trzne   W Z "
	ldata="  Data sprzedaæy  "
	if zmiesiac_sprzed=1
	  ldata="  Miesi•c i rok sprzedaæy: "
	endif
  case zdtyp$zakup_gr
    ltyt_dok="Przyj©cie zewn©trzne   P Z "	
	ldata="  Data zakupu: "
endcase

    if zdtyp$dowod_gr.or..not.vdok
      ldat=dtoc(zddatdow)
    else
      ldat=dtoc(zddatdok)
    endif

if zdtyp$dowod_gr.or..not.vdok
  ltytnum=alltrim(ltyt_dok)+"  NR  "+alltrim(zdndow)
else
  ldndok=kj_doknumer(zdndok)
  ltytnum=alltrim(ztyt_dok)+"&nbsp;  NR  "+alltrim(ldndok)
*  if zdtyp$wew_gr
*    ltytnum="Faktura wewn©trzna Nr  "+alltrim(ldndok)
*  endif	
endif

*************************************************************
lwiersz=lwiersz+'<table cols=3 width="100%">'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr>'+chr(13)+chr(10)
do case
  case file("wydruki\logo.gif")
    lwiersz=lwiersz+'<td><IMG SRC=logo.gif width="150" height="50"></td>'+chr(13)+chr(10)
  case file("wydruki\logo.jpg")
    lwiersz=lwiersz+'<td><IMG SRC=logo.jpg width="180" height="60"></td>'+chr(13)+chr(10)	
  case file("wydruki\logo.bmp")
    lwiersz=lwiersz+'<td><IMG SRC=logo.bmp width="100" height="80"></td>'+chr(13)+chr(10)	
  otherwise
    lwiersz=lwiersz+'<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>'+chr(13)+chr(10)	
endcase
lwiersz=lwiersz+'<td><center><b><font face="Arial CE" size=3>'+ltytnum+'&nbsp;&nbsp;</font></b>'+chr(13)+chr(10)
lwiersz=lwiersz+'<br><center><b><font color="#FF0000" face="Arial CE" size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+poryginal+chr(13)+chr(10)
do case
  case zdznak$zkordok_znak
    lwiersz=lwiersz+"<br>"+"Dotyczy dokumentu: "+zdnskrot+chr(13)+chr(10)
  case numer_zam_op
    lwiersz=lwiersz+"<br>"+"Numer zam¢wienia: "+zdnumer_zam+chr(13)+chr(10)
endcase
*if numer_zam_op
*    lwiersz=lwiersz+"<br>"+"Numer zam¢wienia: "+zdnumer_zam+chr(13)+chr(10)
*endif
lwiersz=lwiersz+'</font></b>'+chr(13)+chr(10)

lwiersz=lwiersz+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td align=right valign=top><font face="Arial CE" size=1>'+zmiasto+'&nbsp;&nbsp;&nbsp;&nbsp;'+ldata_wystawienia+'<font size=2>'+ldat+chr(13)+chr(10)
lwiersz=lwiersz+'<br><font size=1>'+ldata+'<font size=2>'+ldat+chr(13)+chr(10)
lwiersz=lwiersz+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'</table>'+chr(13)+chr(10)


return lwiersz
*************************************************************


FUNCTION WIN_DOK_KTO(pwiersz)
local lwiersz:=pwiersz
local ld1:="",ld2:="",lnip_len:=0
local llic1:=zlic1,llic2:=zlic2,llic3:=zlic3,llic4:=zlic4
local llic5:=zlic5,llic6:=zlic6,llic_regon:=zlic_regon
local llic_tel:=zlic_tel,llic_fax:=zlic_fax
ld1="Sprzedawca"
ld2="Nabywca"
if.not.empty(zonaz1).or..not.empty(zonaz2).or..not.empty(zomiasto).or..not.empty(zoulica)
  ld1="Sprzedawca"
  ld2="Pàatnik"
endif
if zdtyp$zakup_gr
  ld1="Nabywca"
  ld2="Sprzedawca"
endif
if zdtyp$bezkontrah_gr
  ld1="Sprzedawca"
  ld2:=""
endif
if zdtyp$przes_gr
  ld1="Magazyn wydaj•cy towar"
  ld2="Magazyn docelowy"
  if zdtyp$zakup_gr
    ld1="Magazyn przyjmuj•cy towar"
	ld2="Magazyn wydaj•cy towar"
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
  ld1=""
  ld2=""
endif
if zdtyp$wew_gr
  ld1="Nabywca"
  ld2="Dostawca"
endif
*************************************************************

if.not.zdtyp$dowodwew_gr
  lwiersz=lwiersz+'<table cols=2 width="100%">'+chr(13)+chr(10)
  lwiersz=lwiersz+'<tr>'+chr(13)+chr(10)

  lwiersz=lwiersz+'<td valign=top width=50%><left><b><font face="Arial CE" size=3>'+ld1+'</font></b>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<font face="Arial CE" size=1>'+'<br><br>'+llic1+chr(13)+chr(10)
  lwiersz=lwiersz+'<br><font size=1>'+llic2+chr(13)+chr(10)
  lwiersz=lwiersz+'<br><font size=1>'+llic5+chr(13)+chr(10)
  lwiersz=lwiersz+'<br><font size=1>'+llic3+'&nbsp;&nbsp;'+llic4+'</b>'+chr(13)+chr(10)
  if.not.zdtyp$przes_gr
    if zdtyp$eksport_ue_gr
      lwiersz=lwiersz+'<br><font size=2> NIP: '+nip_pl()+chr(13)+chr(10)
    else
      lwiersz=lwiersz+'<br><font size=2> NIP: '+substr(llic6,1,13)+chr(13)+chr(10)
    endif	
  endif
  lwiersz=lwiersz+"</td>"+chr(13)+chr(10)
  
  if.not.zdtyp$bezkontrah_gr
    lwiersz=lwiersz+'<td valign=top width=50%><left><b><font face="Arial CE" size=3>'+ld2+'</font></b>'+chr(13)+chr(10)
    lwiersz=lwiersz+'<font face="Arial CE" size=1>'+'<br><br>'+zknaz1+chr(13)+chr(10)
    lwiersz=lwiersz+'<br><font size=1>'+zknaz2+chr(13)+chr(10)
    lwiersz=lwiersz+'<br><font size=1>'+zkulica+chr(13)+chr(10)
    lwiersz=lwiersz+'<br><font size=1>'+zkkod+'&nbsp;&nbsp;'+zkmiasto+chr(13)+chr(10)
    if zdtyp$wew_gr.and.substr(zknip,1,2)="NL"
	  zknip=zknip_nl
	endif
	if.not.zdtyp$przes_gr
	  lwiersz=lwiersz+'<br><font size=2> NIP: '+zknip+chr(13)+chr(10)
    endif
	lwiersz=lwiersz+"</td>"+chr(13)+chr(10)
  endif
  
  lwiersz=lwiersz+"</tr>"+chr(13)+chr(10)
  lwiersz=lwiersz+'</table>'+chr(13)+chr(10)

  if zdsposzap$"PO".and..not.zdtyp$bezkonto_gr
    lwiersz=lwiersz+'<font size=1>'+alltrim(konto_sprzedawcy)+"<br><font size=2><b> "+zlic_konto+"</b>"+chr(13)+chr(10)
  endif

  if.not.empty(zonaz1).or..not.empty(zonaz2).or..not.empty(zomiasto).or..not.empty(zoulica)
    lwiersz=lwiersz+"<br><br>"+"<b>Odbiorca:</b><br><font size=1> "+zonaz1+'&nbsp;&nbsp;'+zonaz2+'&nbsp;&nbsp;'+zoulica+'&nbsp;&nbsp;'+zokod+'&nbsp;'+zomiasto+'&nbsp;&nbsp;'+zotel+'&nbsp;&nbsp;'+zofax+chr(13)+chr(10)
  endif
else
  lwiersz=lwiersz+llic1+'&nbsp;&nbsp;'+llic2+"<br>"+chr(13)+chr(10)
  lwiersz=lwiersz+llic5+'&nbsp;&nbsp;'+llic3+" "+llic4+"<br>"+chr(13)+chr(10)  
  lwiersz=lwiersz+"NIP: "+substr(llic6,1,13)+'&nbsp;&nbsp;&nbsp;&nbsp;'+"Regon: "+llic_regon+"<br>"+chr(13)+chr(10)  
endif

return lwiersz


FUNCTION WIN_POZ(pwiersz)
local lwiersz:=pwiersz
local lnetto:="<font size=1>NETTO<font size=2>"
local lvat:="<font size=1>VAT<font size=2>"
local lbrutto:="<font size=1>BRUTTO<font size=2>"
local lst:="<font size=1>St.<font size=2>"
local lpkw_i_u:="<font size=1>zwolnienia z VAT<font size=2>"
local lp:=1,lptxt:=""
local lrazem_netto:="Razem NETTO: "
ltnet_all=str(ztnet_all,12,2)
ltvat_all=str(ztvat_all,12,2)
ltbrut_all=str(ztbrut_all,12,2)

if zdtyp$dok_brut_gr
  lnetto:="<font size=1>BRUTTO<font size=2>"
  lrazem_netto="Razem BRUTTO: "
  ltnet_all=str(ztbrut_all,12,2)
endif

*************************************************************
lwiersz=lwiersz+'<table cols=8 width="100%" bgcolor="#C7F1F3" rules=cols  bordercolor=black border>'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr> <font face="Arial CE" size=2>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center>Lp.</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="40%" align=center>Nazwa <br><font size=1>towaru lub usàugi<font size=2></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>IloòÜ</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center valign=top>J.m.</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>Cena <br>'+lnetto+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center valign=top>St. <br>'+lvat+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>WartoòÜ <br>'+lnetto+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>Podstawa <br>'+lpkw_i_u+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'</table>'+chr(13)+chr(10)

lwiersz=lwiersz+'<table cols=8 width="100%"  rules=none  bordercolor=black border>'+chr(13)+chr(10)


lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left>&nbsp;</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="40%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)

buf_lad(.f.)
buf_use()
select &buf_sel

do while.not.eof()
  ztow_lad()
  lptxt=str(lp,3,0)
  liltxt=str(til,10,mag_round)
  lstawkatxt=str(tstawka,2,0)
  if zdtyp$dok_brut_gr
    lcentxt=str(round(tbrutto(ztcen,ztstawka),2),10,2)
    lbrut=round(round(tbrutto(ztcen,ztstawka),2)*ztil,2)   
	lnettxt=str(lbrut,10,2)
  else
    lcentxt=str(tcen,10,2)
    lnettxt=str(round(ztil*round(ztcen,2),2),10,2)
  endif
  lwiersz=lwiersz+'<tr> <font face="Arial CE" >'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="4%" align=center ><font size=1>'+lptxt+'.</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="40%" align=left ><font size=1>'+tnaz+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top ><font size=1>'+liltxt+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="4%" align=right valign=top ><font size=1>'+tjm+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+lcentxt+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="4%" align=right valign=top><font size=1>'+lstawkatxt+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+lnettxt+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top ><font size=1>'+tsymbol+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)
  if twyroznik$"O"
	lwiersz=win_opispoz(lwiersz)
  endif  
  lp=lp+1
  skip
enddo  


lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left>&nbsp;</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="40%" align=center></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)

lwiersz=lwiersz+'<table cols=8 width="100%"  rules=none  bordercolor=black border>'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="40%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+lrazem_netto+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1><b>'+ltnet_all+'</td></b>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
lwiersz=lwiersz+'</table>'+chr(13)+chr(10)

lwiersz=lwiersz+'<table cols=6 width="100%"  rules=none  bordercolor=black border>'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  if.not.zdrabat=0
    lwiersz=lwiersz+'<td width="46%" align=center><font size=2>Udzielono rabatu '+str(zdrabat,8,4)+'% </td>'+chr(13)+chr(10)
  else
    lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  endif
lwiersz=lwiersz+'<td width="12%" align=left><font size=2>&nbsp;&nbsp;&nbsp;&nbsp;<font size=1>Ze stawk•</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="6%" align=right valign=top>'+lst+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=right valign=top>'+lnetto+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=right valign=top>'+lvat+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=right valign=top>'+lbrutto+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)

if.not.ztnet_a=0
  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right><font size=1></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>'+str(mvat("A"))+'%</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztnet_a,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztvat_a,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztbrut_a,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
endif

if.not.ztnet_b=0
  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right><font size=1></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>'+str(mvat("B"))+'%</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztnet_b,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztvat_b,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztbrut_b,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
endif

if.not.ztnet_c=0
  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right><font size=1></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>'+str(mvat("C"))+'%</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztnet_c,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztvat_c,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztbrut_c,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
endif

if.not.ztnet_d=0
  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right><font size=1></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>'+str(mvat("D"))+'%</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztnet_d,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztvat_d,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztbrut_d,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
endif

if.not.ztnet_e=0
  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right><font size=1></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>'+str(mvat("E"))+'%</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztnet_e,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztvat_e,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztbrut_e,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
endif

if.not.ztnet_f=0
  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right><font size=1></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>'+str(mvat("F"))+'%</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztnet_f,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztvat_f,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztbrut_f,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
endif

if.not.ztnet_z=0
  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right><font size=1></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>zw.</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztnet_z,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztvat_z,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztbrut_z,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
endif


  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)

if.not.zdtyp$wew_gr  
  do case
    case zdsposzap="G"
      lwiersz=lwiersz+'<td width="46%" align=center><font size=2>Spos¢b zapàaty: Got¢wka </td>'+chr(13)+chr(10)	     
    case zdsposzap="P"
      lwiersz=lwiersz+'<td width="46%" align=left><font size=1>Spos¢b zapàaty: Przelew &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Termin pàatnoòci&nbsp;&nbsp; <b> '+dtoc(zdtermin)+'</b> </td>'+chr(13)+chr(10)	     
    case zdsposzap="K"
      lwiersz=lwiersz+'<td width="46%" align=center><font size=2>Spos¢b zapàaty: Karta pàatnicza </td>'+chr(13)+chr(10)	     	  
    case zdsposzap="R"
      lwiersz=lwiersz+'<td width="46%" align=center><font size=2>Spos¢b zapàaty: Redukcja zadàuæenia </td>'+chr(13)+chr(10)	     
    case zdsposzap="O"
      lwiersz=lwiersz+'<td width="46%" align=left><font size=1>Spos¢b zapàaty: Got¢wka &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Termin pàatnoòci &nbsp;&nbsp; <b> '+dtoc(zdtermin)+'</b> </td>'+chr(13)+chr(10)	     
  endcase
else
  lwiersz=lwiersz+'<td width="46%" align=center><font size=2></td>'+chr(13)+chr(10)	       
endif
  lwiersz=lwiersz+'<td width="12%" align=left><b><font size=2>&nbsp;&nbsp;&nbsp;&nbsp;Razem</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>xx</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1><b>'+str(ztnet_all,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1><b>'+str(ztvat_all,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1><b>'+str(ztbrut_all,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font></b>'+chr(13)+chr(10)

lwiersz=lwiersz+'</table>'+chr(13)+chr(10)

return lwiersz


FUNCTION WIN_KASPOZ(pwiersz)
local lwiersz:=pwiersz
local lnetto:="<font size=1>NETTO<font size=2>"
local lvat:="<font size=1>VAT<font size=2>"
local lbrutto:="<font size=1>BRUTTO<font size=2>"
local lst:="<font size=1>St.<font size=2>"
local lpkw_i_u:="<font size=1>zwolnienia z VAT<font size=2>"
local lp:=1,lptxt:=""
local lrazem_netto:="Razem NETTO: "
ltnet_all=str(ztnet_all,12,2)
ltvat_all=str(ztvat_all,12,2)
ltbrut_all=str(ztbrut_all,12,2)

if zdtyp$dok_brut_gr
  lnetto:="<font size=1>BRUTTO<font size=2>"
  lrazem_netto="Razem BRUTTO: "
  ltnet_all=str(ztbrut_all,12,2)
endif


select &buf_sel
ztow_lad()
lwiersz=lwiersz+'<br><br><font size=2>Tytuàem:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; '+ztnaz+chr(13)+chr(10) 


return lwiersz

*************************************************************


FUNCTION WIN_DO_ZAPLATY(pwiersz)
local lwiersz:=pwiersz,lkwota:=ztbrut_all
ldwaluta:="Zà."
if.not.empty(zdwaluta)
  ldwaluta=zdwaluta
endif
if zdtyp$kasa_gr
  lwiersz=lwiersz+'<font size=2><b>Kwota: <font size=3>&nbsp;&nbsp;'+str(ztbrut_all,11,2)+'&nbsp; <font size=2>'+ldwaluta +chr(13)+chr(10)
else
  if zdtyp$wew_gr
    lwiersz=lwiersz+'<font size=2><b>WartoòÜ: <font size=3>&nbsp;&nbsp;'+str(ztbrut_all,11,2)+'&nbsp; <font size=2>'+ldwaluta +chr(13)+chr(10)
  else
    lwiersz=lwiersz+'<font size=2><b>Do zapàaty: <font size=3>&nbsp;&nbsp;'+str(ztbrut_all,11,2)+'&nbsp; <font size=2>'+ldwaluta +chr(13)+chr(10)
  endif	
endif

lwiersz=lwiersz+'<font size=1></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+chr(13)+chr(10)
lwiersz=win_slownie(lwiersz,lkwota)

if.not.zdtyp$proform_gr.and.vdok.and..not.kasa_glowna
  do case
    case zdsposzap$"GK"
      lwiersz=lwiersz+'<font size=1></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NaleænoòÜ zapàacono got¢wk•'+chr(13)+chr(10)
    case zdsposzap$"OP"
      zkwota=ztbrut_all-zdniedop        
      if.not.kj_round(zkwota,2)=0
       	*@ w,pcol()+10 say przyjeto+alltrim(str(zkwota,11,2))+pozostalo+alltrim(str((zdniedop),11,2))	
        lwiersz=lwiersz+'<font size=1></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Przyj©to kwot©: '+alltrim(str(zkwota,11,2))+'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Pozostaào do zapàaty: '+alltrim(str((zdniedop),11,2))+chr(13)+chr(10)
	  endif		
  endcase
endif

if zdtyp$kasa_gr
  lwiersz=lwiersz+'<font size=1><br><br>Powyæsz• kwot© otrzymaàem <br> '+chr(13)+chr(10)
endif

RETURN lwiersz

FUNCTION WIN_SLOWNIE(pwiersz,pkwota)
local kwota:=ALLTRIM(str(pkwota))
local cyfra:=" ",lwiersz:=pwiersz
lwiersz=lwiersz+"Sàownie : "
for i=1 to len(kwota)
  do case
    case substr(kwota,i,1)="0"
	  cyfra="*zero"
    case substr(kwota,i,1)="1"
	  cyfra="*jeden"
    case substr(kwota,i,1)="2"
	  cyfra="*dwa"
    case substr(kwota,i,1)="3"
      cyfra="*trzy"
    case substr(kwota,i,1)="4"
	  cyfra="*cztery"
    case substr(kwota,i,1)="5"
      cyfra="*pi©Ü"
    case substr(kwota,i,1)="6"
	  cyfra="*szeòÜ"
    case substr(kwota,i,1)="7"
	  cyfra="*siedem"
    case substr(kwota,i,1)="8"
	  cyfra="*osiem"
    case substr(kwota,i,1)="9"
	  cyfra="*dziewi©Ü"
    case substr(kwota,i,1)="."
	  if empty(zdwaluta)
	    cyfra="Zà."
	  else
	    cyfra=zdwaluta	  
	  endif	
  endcase
  lwiersz=lwiersz+cyfra+chr(13)+chr(10)
next
  if empty(zdwaluta)
    lwiersz=lwiersz+'Gr.'+chr(13)+chr(10)
  endif	
RETURN lwiersz

FUNCTION SPOSOB_ZAP(pwiersz)
local lwiersz:=pwiersz

RETURN lwiersz

FUNCTION WIN_STOPA(pwiersz)
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

FUNCTION WIN_PODPIS(pwiersz)
local lwiersz:=pwiersz
local lt1_a,lt2_a,lt3_a,lt4_a,lt5_a,lt6_a
local lt1_b,lt2_b,lt3_b,lt4_b,lt5_b,lt6_b
local lt1_c,lt2_c,lt3_c,lt4_c,lt5_c,lt6_c
local lupomnienie:=.f.
local select:=select()

if op_platnosc_txt.and.zdsposzap$"PO".and.zdtyp$sprzedaz_gr
  lupomnienie=.t.
endif
if zdtyp$eksport_gr.and..not.op_export_txt
  lupomnienie=.f.
endif

lt1_a=op_txt1
lt2_a=op_txt2
lt3_a=op_txt3
lt4_a=op_txt4
lt5_a=op_txt5
lt6_a=op_txt6

if zdtyp$kasa_gr
  lt1_b=""
else
  lt1_b="Osoba upowaæniona do wystawienia dokumentu: "
endif  
lt2_b="<br>&nbsp;"
lt3_b="<br>&nbsp; "
lt4_b=zdwystawil
lt5_b="podpis ...................................................... "


lt1_c="Osoba upowaæniona do odbioru dokumentu: "
lt2_c="<br>&nbsp;"
lt3_c="<br>&nbsp; "
lt4_c=zdodebral
lt5_c="podpis ...................................................... "

if.not. zdtyp$odebral_podpis_gr
  lt1_c="<br>&nbsp;"
  lt2_c="<br>&nbsp;"
  lt3_c="<br>&nbsp;"
  lt4_c="<br>&nbsp;"
  lt5_c="<br>&nbsp; "
endif

if zdtyp$dowodwew_gr
  lt1_b="Dokument sporz•dzià"
  lt1_c="Dokument zatwierdzià"
endif

if zdtyp$wew_gr
  lt1_c=""
  lt2_c=""
  lt3_c=""
  lt4_c=""
  lt5_c=""
endif

if zdtyp$wew_gr
  lwiersz=lwiersz+'&nbsp;<TABLE width="100%"><TR><TD width="50%"></TD><TD width="50%"><font face="Arial CE" size=1> Podpis wystawcy faktury  ...................................</TD></TR></TABLE>'+chr(13)+chr(10)
  RETURN lwiersz  
endif

if.not.lupomnienie.or.ztbrut_all<=0
  lwiersz=lwiersz+'<table cols=2 width="100%">'+chr(13)+chr(10)
  lwiersz=lwiersz+'<tr>'+chr(13)+chr(10)

  lwiersz=lwiersz+'<td valign=top width=50%><left><font size=1>'+lt1_b+chr(13)+chr(10)
  lwiersz=lwiersz+'<font size=1><br>'+lt2_b+chr(13)+chr(10)
*  lwiersz=lwiersz+'<font size=1><br>'+lt3_b+chr(13)+chr(10)  
  lwiersz=lwiersz+'<font size=1><br>'+lt4_b+chr(13)+chr(10)  
  lwiersz=lwiersz+'<font size=1><br>'+lt5_b+chr(13)+chr(10)  
  lwiersz=lwiersz+"</td>"+chr(13)+chr(10)

  lwiersz=lwiersz+'<td valign=top width=50%><left><font size=1>'+lt1_c+chr(13)+chr(10)
  lwiersz=lwiersz+'<font size=1><br>'+lt2_c+chr(13)+chr(10)
*  lwiersz=lwiersz+'<font size=1><br>'+lt3_c+chr(13)+chr(10)  
  lwiersz=lwiersz+'<font size=1><br>'+lt4_c+chr(13)+chr(10)  
  lwiersz=lwiersz+'<font size=1><br>'+lt5_c+chr(13)+chr(10)  
  lwiersz=lwiersz+"</td>"+chr(13)+chr(10)

  lwiersz=lwiersz+"</tr>"+chr(13)+chr(10)
  lwiersz=lwiersz+'</table>'+chr(13)+chr(10)
else
  lwiersz=lwiersz+'<table cols=3 width="100%">'+chr(13)+chr(10)
  lwiersz=lwiersz+'<tr>'+chr(13)+chr(10)

  lwiersz=lwiersz+'<td valign=top width=26%><left><font size=1>'+lt1_a+chr(13)+chr(10)
  lwiersz=lwiersz+'<font size=1><br>'+lt2_a+chr(13)+chr(10)
  lwiersz=lwiersz+'<font size=1><br>'+lt3_a+chr(13)+chr(10)  
  lwiersz=lwiersz+'<font size=1><br>'+lt4_a+chr(13)+chr(10)  
  lwiersz=lwiersz+'<font size=1><br>'+lt5_a+chr(13)+chr(10)  
  lwiersz=lwiersz+'<font size=1><br>'+lt6_a+chr(13)+chr(10)    
  lwiersz=lwiersz+"</td>"+chr(13)+chr(10)
  
  lwiersz=lwiersz+'<td valign=top width=37%><left><font size=1>'+lt1_b+chr(13)+chr(10)
  lwiersz=lwiersz+'<font size=1><br>'+lt2_b+chr(13)+chr(10)
*  lwiersz=lwiersz+'<font size=1><br>'+lt3_b+chr(13)+chr(10)  
  lwiersz=lwiersz+'<font size=1><br>'+lt4_b+chr(13)+chr(10)  
  lwiersz=lwiersz+'<font size=1><br>'+lt5_b+chr(13)+chr(10)  
  lwiersz=lwiersz+"</td>"+chr(13)+chr(10)  

  lwiersz=lwiersz+'<td valign=top width=37%><left><font size=1>'+lt1_c+chr(13)+chr(10)
  lwiersz=lwiersz+'<font size=1><br>'+lt2_c+chr(13)+chr(10)
*  lwiersz=lwiersz+'<font size=1><br>'+lt3_c+chr(13)+chr(10)  
  lwiersz=lwiersz+'<font size=1><br>'+lt4_c+chr(13)+chr(10)  
  lwiersz=lwiersz+'<font size=1><br>'+lt5_c+chr(13)+chr(10)  
  lwiersz=lwiersz+"</td>"+chr(13)+chr(10)

  lwiersz=lwiersz+"</tr>"+chr(13)+chr(10)
  lwiersz=lwiersz+'</table>'+chr(13)+chr(10)
endif 
RETURN lwiersz


FUNCTION WINOLD_PODPIS(pwiersz)
local lwiersz:=pwiersz

local lt1:=upowazniona
local lt2:="                                                                                                                      "
local lt3:=space(80)
local lt4:="podpis           ..............................                       podpis           .............................. "
local lt5:="                                                                                                                      "
local lt6:="                                                                                                                      "
local lupomnienie:=.f.
local select:=select(),lw:=5

if op_platnosc_txt.and.zdsposzap$"PO".and.zdtyp$sprzedaz_gr
  lupomnienie=.t.
endif
if zdtyp$eksport_gr.and..not.op_export_txt
  lupomnienie=.f.
endif



if.not.lupomnienie

else

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
	  do while.not.eof()
	    lwiersz=lwiersz+'<br>'+tekst+chr(13)+chr(10)
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

FUNCTION WIN_GROZBA(pwiersz)
local lwiersz:=pwiersz
set default to &set_serwer
if file("grozba.dbf").and.zdsposzap$"PO".and.zdtyp$sprzedaz_gr
    lwiersz=lwiersz+'<br><br>'+chr(13)+chr(10)
    select &groz_sel
    if kj_use("grozba",.f.,3)
	  do while.not.eof()
	    lwiersz=lwiersz+'<br>'+tekst+chr(13)+chr(10)
	    skip
	  enddo      	
	endif
endif  
RETURN lwiersz



FUNCTION WIN_OPISDOK(pwiersz)
lwiersz:=pwiersz
      if zdtyp$opisdok_gr
	    if.not.empty(zdopis1).and..not.zdznak$zkordok_znak
		  lwiersz=lwiersz+'<br><br>'+zdopis1+chr(13)+chr(10)
		endif
	    if.not.empty(zdopis2)
          lwiersz=lwiersz+'<br>'+zdopis2+chr(13)+chr(10)
		endif
	    if.not.empty(zdopis3)
          lwiersz=lwiersz+'<br>'+zdopis3+chr(13)+chr(10) 
		endif				
	  endif
RETURN lwiersz	  

FUNCTION WIN_OPISPOZ(pwiersz)
local lwiersz:=pwiersz
local select:=select()
dok_default()
if file("topis.dbf")
  select &topis_sel
  if kj_use("topis",.f.,3)
    set index to topis
    seek ztndow
    if found()

      do while op_tndow=ztndow

	    if op_tnum=ztnum
          lwiersz=lwiersz+'<tr> <font face="Arial CE" >'+chr(13)+chr(10)
          lwiersz=lwiersz+'<td width="4%" align=center ><font size=1>&nbsp;</td>'+chr(13)+chr(10)
          lwiersz=lwiersz+'<td width="40%" align=left ><font size=1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+op_tnaz+'</td>'+chr(13)+chr(10)
          lwiersz=lwiersz+'<td width="12%" align=right valign=top ><font size=1></td>'+chr(13)+chr(10)
          lwiersz=lwiersz+'<td width="4%" align=right valign=top ><font size=1></td>'+chr(13)+chr(10)
          lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1></td>'+chr(13)+chr(10)
          lwiersz=lwiersz+'<td width="4%" align=right valign=top><font size=1></td>'+chr(13)+chr(10)
          lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1></td>'+chr(13)+chr(10)
          lwiersz=lwiersz+'<td width="12%" align=right valign=top ><font size=1></td>'+chr(13)+chr(10)
          lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)
	    endif
	    skip
	  enddo
    endif
  endif
  select &select
endif
RETURN lwiersz


FUNCTION WIN_POZKOR(pwiersz)
local lwiersz:=pwiersz
local lnetto:="<font size=1>NETTO<font size=2>"
local lvat:="<font size=1>VAT<font size=2>"
local lbrutto:="<font size=1>BRUTTO<font size=2>"
local lst:="<font size=1>St.<font size=2>"
local lpkw_i_u:="<font size=1>PKW i U<font size=2>"
local lp:=1,lptxt:=""
local lrazem_netto:="Razem NETTO: "
ltnet_all=str(ztnet_all,12,2)
ltvat_all=str(ztvat_all,12,2)
ltbrut_all=str(ztbrut_all,12,2)

if zdtyp$dok_brut_gr
  lnetto:="<font size=1>BRUTTO<font size=2>"
  lrazem_netto="Razem BRUTTO: "
  ltnet_all=str(ztbrut_all,12,2)
endif

*************************************************************
lwiersz=lwiersz+'<tr> <font face="Arial CE" size=2><b>Przed korekt•</b>'+chr(13)+chr(10)

lwiersz=lwiersz+'<table cols=8 width="100%" bgcolor="#C7F1F3" rules=cols  bordercolor=black border>'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr> <font face="Arial CE" size=2>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center>Lp.</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="40%" align=center>Nazwa <br><font size=1>towaru lub usàugi<font size=2></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>IloòÜ</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center valign=top>J.m.</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>Cena <br>'+lnetto+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center valign=top>St. <br>'+lvat+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>WartoòÜ <br>'+lnetto+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>Symbol <br>'+lpkw_i_u+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'</table>'+chr(13)+chr(10)


lwiersz=lwiersz+'<table cols=8 width="100%"  rules=none  bordercolor=black border>'+chr(13)+chr(10)

lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left>&nbsp;</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="40%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)

select &buf_sel
set filter to til<0
go top

do while.not.eof()
  ztow_lad()
  ztil=-1*ztil
  lptxt=str(lp,3,0)
  liltxt=str(ztil,10,mag_round)
  lstawkatxt=str(tstawka,2,0)
  if zdtyp$dok_brut_gr
    lcentxt=str(round(tbrutto(ztcen,ztstawka),2),10,2)
    lbrut=round(round(tbrutto(ztcen,ztstawka),2)*ztil,2)   
	lnettxt=str(lbrut,10,2)
  else
    lcentxt=str(tcen,10,2)
    lnettxt=str(round(ztil*round(ztcen,2),2),10,2)
  endif
  lwiersz=lwiersz+'<tr> <font face="Arial CE" >'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="4%" align=center ><font size=1>'+lptxt+'.</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="40%" align=left ><font size=1>'+tnaz+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top ><font size=1>'+liltxt+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="4%" align=right valign=top ><font size=1>'+tjm+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+lcentxt+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="4%" align=right valign=top><font size=1>'+lstawkatxt+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+lnettxt+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top ><font size=1>'+tsymbol+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)
*  if twyroznik$"O"
*	lwiersz=win_opispoz(lwiersz)
*  endif  
  lp=lp+1
  skip
enddo  


lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left>&nbsp;</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="40%" align=center></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr></table>'+chr(13)+chr(10)

lwiersz=lwiersz+'<br><br><font size=2><b>Po korekcie</b>'+chr(13)+chr(10)

lwiersz=lwiersz+'<table cols=8 width="100%" bgcolor="#C7F1F3" rules=cols  bordercolor=black border>'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr> <font face="Arial CE" size=2>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center>Lp.</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="40%" align=center>Nazwa <br><font size=1>towaru lub usàugi<font size=2></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>IloòÜ</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center valign=top>J.m.</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>Cena <br>'+lnetto+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center valign=top>St. <br>'+lvat+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>WartoòÜ <br>'+lnetto+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>Symbol <br>'+lpkw_i_u+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'</table>'+chr(13)+chr(10)


lwiersz=lwiersz+'<table cols=8 width="100%"  rules=none  bordercolor=black border>'+chr(13)+chr(10)

lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left>&nbsp;</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="40%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)

set filter to til>=0
go top
lp=1
do while.not.eof()
  ztow_lad()
  lptxt=str(lp,3,0)
  liltxt=str(ztil,10,mag_round)
  lstawkatxt=str(tstawka,2,0)
  if zdtyp$dok_brut_gr
    lcentxt=str(round(tbrutto(ztcen,ztstawka),2),10,2)
    lbrut=round(round(tbrutto(ztcen,ztstawka),2)*ztil,2)   
	lnettxt=str(lbrut,10,2)
  else
    lcentxt=str(tcen,10,2)
    lnettxt=str(round(ztil*round(ztcen,2),2),10,2)
  endif
  lwiersz=lwiersz+'<tr> <font face="Arial CE" >'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="4%" align=center ><font size=1>'+lptxt+'.</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="40%" align=left ><font size=1>'+tnaz+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top ><font size=1>'+liltxt+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="4%" align=right valign=top ><font size=1>'+tjm+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+lcentxt+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="4%" align=right valign=top><font size=1>'+lstawkatxt+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+lnettxt+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top ><font size=1>'+tsymbol+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)
*  if twyroznik$"O"
*	lwiersz=win_opispoz(lwiersz)
*  endif  
  lp=lp+1
  skip
enddo  


lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left>&nbsp;</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="40%" align=center></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr></table>'+chr(13)+chr(10)





lwiersz=lwiersz+'<table cols=8 width="100%"  rules=none  bordercolor=black border>'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="40%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+lrazem_netto+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1><b>'+ltnet_all+'</td></b>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
lwiersz=lwiersz+'</table>'+chr(13)+chr(10)

lwiersz=lwiersz+'<table cols=6 width="100%"  rules=none  bordercolor=black border>'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  if.not.zdrabat=0
    lwiersz=lwiersz+'<td width="46%" align=center><font size=2>Udzielono rabatu '+str(zdrabat,8,4)+'% </td>'+chr(13)+chr(10)
  else
    lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  endif
lwiersz=lwiersz+'<td width="12%" align=left><font size=2>&nbsp;&nbsp;&nbsp;&nbsp;<font size=1>Ze stawk•</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="6%" align=right valign=top>'+lst+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=right valign=top>'+lnetto+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=right valign=top>'+lvat+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=right valign=top>'+lbrutto+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)

if.not.ztnet_a=0
  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right><font size=1></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>'+str(mvat("A"))+'%</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztnet_a,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztvat_a,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztbrut_a,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
endif

if.not.ztnet_b=0
  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right><font size=1></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>'+str(mvat("B"))+'%</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztnet_b,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztvat_b,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztbrut_b,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
endif

if.not.ztnet_c=0
  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right><font size=1></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>'+str(mvat("C"))+'%</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztnet_c,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztvat_c,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztbrut_c,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
endif

if.not.ztnet_d=0
  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right><font size=1></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>'+str(mvat("D"))+'%</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztnet_d,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztvat_d,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztbrut_d,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
endif

if.not.ztnet_e=0
  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right><font size=1></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>'+str(mvat("E"))+'%</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztnet_e,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztvat_e,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztbrut_e,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
endif

if.not.ztnet_f=0
  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right><font size=1></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>'+str(mvat("F"))+'%</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztnet_f,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztvat_f,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztbrut_f,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
endif

if.not.ztnet_z=0
  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="46%" align=left></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right><font size=1></td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>zw.</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztnet_z,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztvat_z,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(ztbrut_z,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
endif


  lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
  
  do case
    case zdsposzap="G"
      lwiersz=lwiersz+'<td width="46%" align=center><font size=2>Spos¢b zapàaty: Got¢wka </td>'+chr(13)+chr(10)	     
    case zdsposzap="P"
      lwiersz=lwiersz+'<td width="46%" align=left><font size=1>Spos¢b zapàaty: Przelew &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Termin pàatnoòci&nbsp;&nbsp; <b> '+dtoc(zdtermin)+'</b> </td>'+chr(13)+chr(10)	     
    case zdsposzap="K"
      lwiersz=lwiersz+'<td width="46%" align=center><font size=2>Spos¢b zapàaty: Karta pàatnicza </td>'+chr(13)+chr(10)	     	  
    case zdsposzap="R"
      lwiersz=lwiersz+'<td width="46%" align=center><font size=2>Spos¢b zapàaty: Redukcja zadàuæenia </td>'+chr(13)+chr(10)	     
    case zdsposzap="O"
      lwiersz=lwiersz+'<td width="46%" align=left><font size=1>Spos¢b zapàaty: Got¢wka &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Termin pàatnoòci &nbsp;&nbsp; <b> '+dtoc(zdtermin)+'</b> </td>'+chr(13)+chr(10)	     
  endcase

  lwiersz=lwiersz+'<td width="12%" align=left><b><font size=2>&nbsp;&nbsp;&nbsp;&nbsp;Razem</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>xx</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1><b>'+str(ztnet_all,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1><b>'+str(ztvat_all,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1><b>'+str(ztbrut_all,11,2)+'</td>'+chr(13)+chr(10)
  lwiersz=lwiersz+'</tr></font></b>'+chr(13)+chr(10)

lwiersz=lwiersz+'</table>'+chr(13)+chr(10)

return lwiersz


FUNCTION WIN_KWOTA(pwiersz)
local lwiersz:=pwiersz,ldwaluta:=zdwaluta
local ltnet_all:=0,ltvat_all:=0,ltbrut_all:=0
if empty(ldwaluta)
  ldwaluta="Zà."
endif
lwiersz=lwiersz+'Przyczyna korekty &nbsp;&nbsp;&nbsp;'+zdopis1+'<br><br>'+chr(13)+chr(10)
do case
  case ztnet_all<0
    ltnet_all=-1*ztnet_all
	lwiersz=lwiersz+'<table cols=3 width="100%"  >'+chr(13)+chr(10)
	lwiersz=lwiersz+'<tr><td width="30%" align=left><font size=1>Kwota zmniejszenia wartoòci NETTO</td><td width="15%" align=right><b><font size=1>'+str(ltnet_all)+'</b>&nbsp;'+ldwaluta+'</td><td width="55%"><font size=1>'+chr(13)+chr(10)  
    lwiersz=win_slownie(lwiersz,ltnet_all)+'</td></tr></table>'+chr(13)+chr(10)  
  case ztnet_all=0
	lwiersz=lwiersz+'<table cols=3 width="100%"  >'+chr(13)+chr(10)
	lwiersz=lwiersz+'<tr><td width="30%" align=left><font size=1>Kwota NETTO nie ulegàa zmianie</td><td width="15%" align=right><b><font size=1></td><td width="55%"><font size=1>'+chr(13)+chr(10)  
    lwiersz=lwiersz+'</td></tr></table>'+chr(13)+chr(10)  	
  case ztnet_all>0
    ltnet_all=ztnet_all
	lwiersz=lwiersz+'<table cols=3 width="100%"  >'+chr(13)+chr(10)
	lwiersz=lwiersz+'<tr><td width="30%" align=left><font size=1>Kwota zwi©kszenia wartoòci NETTO</td><td width="15%" align=right><b><font size=1>'+str(ltnet_all)+'</b>&nbsp;'+ldwaluta+'</td><td width="55%"><font size=1>'+chr(13)+chr(10)  
    lwiersz=win_slownie(lwiersz,ltnet_all)+'</td></tr></table>'+chr(13)+chr(10)  	
endcase

do case
  case ztvat_all<0
    ltvat_all=-1*ztvat_all
	lwiersz=lwiersz+'<table cols=3 width="100%"  >'+chr(13)+chr(10)
	lwiersz=lwiersz+'<tr><td width="30%" align=left><font size=1>Kwota zmniejszenia wartoòci VAT</td><td width="15%" align=right><b><font size=1>'+str(ltvat_all)+'</b>&nbsp;'+ldwaluta+'</td><td width="55%"><font size=1>'+chr(13)+chr(10)  
    lwiersz=win_slownie(lwiersz,ltvat_all)+'</td></tr></table>'+chr(13)+chr(10)  	
  case ztvat_all=0
	lwiersz=lwiersz+'<table cols=3 width="100%"  >'+chr(13)+chr(10)
	lwiersz=lwiersz+'<tr><td width="30%" align=left><font size=1>Kwota VAT nie ulegàa zmianie</td><td width="15%" align=right><b><font size=1></td><td width="55%"><font size=1>'+chr(13)+chr(10)  
    lwiersz=lwiersz+'</td></tr></table>'+chr(13)+chr(10)  		
  case ztvat_all>0
    ltvat_all=ztvat_all
	lwiersz=lwiersz+'<table cols=3 width="100%"  >'+chr(13)+chr(10)
	lwiersz=lwiersz+'<tr><td width="30%" align=left><font size=1>Kwota zwi©kszenia wartoòci VAT</td><td width="15%" align=right><b><font size=1>'+str(ltvat_all)+'</b>&nbsp;'+ldwaluta+'</td><td width="55%"><font size=1>'+chr(13)+chr(10)  
    lwiersz=win_slownie(lwiersz,ltvat_all)+'</td></tr></table>'+chr(13)+chr(10)  	
endcase  

do case
  case ztbrut_all<0
    ltbrut_all=-1*ztbrut_all
	lwiersz=lwiersz+'<table cols=3 width="100%"  >'+chr(13)+chr(10)
	lwiersz=lwiersz+'<tr><td width="30%" align=left><font size=1>Kwota zmniejszenia wartoòci BRUTTO</td><td width="15%" align=right><b><font size=1>'+str(ltbrut_all)+'</b>&nbsp;'+ldwaluta+'</td><td width="55%"><font size=1>'+chr(13)+chr(10)  
    lwiersz=win_slownie(lwiersz,ltbrut_all)+'</td></tr></table>'+chr(13)+chr(10)  	
  case ztbrut_all=0
	lwiersz=lwiersz+'<table cols=3 width="100%"  >'+chr(13)+chr(10)
	lwiersz=lwiersz+'<tr><td width="30%" align=left><font size=1>Kwota BRUTTO nie ulegàa zmianie</td><td width="15%" align=right><b><font size=1></td><td width="55%"><font size=1>'+chr(13)+chr(10)  
    lwiersz=lwiersz+'</td></tr></table>'+chr(13)+chr(10)  		
  case ztbrut_all>0
    ltbrut_all=ztbrut_all
	lwiersz=lwiersz+'<table cols=3 width="100%"  >'+chr(13)+chr(10)
	lwiersz=lwiersz+'<tr><td width="30%" align=left><font size=1>Kwota zwi©kszenia wartoòci BRUTTO</td><td width="15%" align=right><b><font size=1>'+str(ltbrut_all)+'</b>&nbsp;'+ldwaluta+'</td><td width="55%"><font size=1>'+chr(13)+chr(10)  
    lwiersz=win_slownie(lwiersz,ltbrut_all)+'</td></tr></table>'+chr(13)+chr(10)  	
endcase  

RETURN lwiersz

********************************* Magazyn
FUNCTION MAG_WINDRUK()
local lcolor:=setcolor(),ek,lnum:=0,lstrona:=1
local ltytul:="                   D E F I N I O W A N I E     W Y D R U K U                    "  
local lnagl_1:=space(78),lnagl_2:=space(78),lnagl_3:=space(78)
local lnagl_4:=space(78),lnagl_5:=space(78),lnagl_6:=space(78),lnagl_7:=space(78)
local lnet_a:=0,lnet_b:=0,lnet_c:=0,lnet_d:=0,lnet_e:=0,lnet_f:=0,lnet_z:=0
local lnet:=0,lbrut:=0
local ldate:=date(),lremtyt:="REMANENT                     "

save screen to ek

lnagl_1=stuff(lnagl_1,40,19,substr(zmiasto,1,19))
lnagl_1=stuff(lnagl_1,60,5,"Dnia:")
lnagl_1=stuff(lnagl_1,67,8,dtoc(date()))
lnagl_2=stuff(lnagl_2,1,30,zlic1)
lnagl_3=stuff(lnagl_3,1,30,zlic2)
lnagl_4=stuff(lnagl_4,1,6,zlic3)
lnagl_4=stuff(lnagl_4,10,30,zlic4)
lnagl_5=stuff(lnagl_5,1,30,zlic5)


private w:=0
save screen to ek
kj_okno(0,0,24,ltytul,1)
@ 1,1 clear to 4,78
set color to n/w
set cursor on
@ 2,1  say "Data ............. "get ldate
@ 3,1  say "Nazwa dokumenty .. "get lremtyt
read
set cursor off
********************************************html start
plik="wydruki\remanent.htm"
*
lwiersz="<html>"+chr(13)+chr(10)
lwiersz=lwiersz+"<meta http-equiv='Content-Type' content='text/html; charset=ibm852'>"+chr(13)+chr(10)
lwiersz=lwiersz+"<head> </head>"+chr(13)+chr(10)
lwiersz=lwiersz+"<body><basefont size=1>"+chr(13)+chr(10)
* Nagà¢wek
lwiersz=lwiersz+'<table cols=3 width="100%">'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="25%"><font size=1>'+zlic1+'<br>'+zlic2+'</td>'+chr(13)+chr(10)	
lwiersz=lwiersz+'<td width="50%"align=center><b><font size=3>'+lremtyt+'</b></font>'+chr(13)+chr(10)
lwiersz=lwiersz+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="25" align=right valign=top><font size=1>Dnia: &nbsp;'+dtoc(ldate)+chr(13)+chr(10)
lwiersz=lwiersz+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'</table>'+chr(13)+chr(10)
* Nagà¢wek end
lwiersz=lwiersz+"<br>"+chr(13)+chr(10)
* Tabelka - tytuà
do case
  case zrozmiar
    lwiersz=mag_rwintyt(lwiersz)
	lwiersz=mag_rwinpoz(lwiersz)
  otherwise
    lwiersz=mag_wintyt(lwiersz)
	lwiersz=mag_winpoz(lwiersz)
endcase
lwiersz=lwiersz+"<br><br><br><br>"+chr(13)+chr(10)
lwiersz=win_sporzadzil(lwiersz)

 

lwiersz=lwiersz+"</body>"+chr(13)+chr(10)
lwiersz=lwiersz+"</html>"+chr(13)+chr(10)
lwiersz=lwiersz+"<FONT COLOR = 'WHITE'>"+chr(13)+chr(10)
*memowrit("wydruki\remanent.htm",lwiersz)
memowrit("wydruki\pom.htm",lwiersz)
run wydruki\rem.bat
restore screen from ek
run explorer wydruki\remanent.htm
RETURN

FUNCTION MAG_WINTYT(pwiersz)
local lwiersz:=pwiersz
local lcolor:=setcolor()

lwiersz=lwiersz+'<table cols=7 width="100%" bgcolor="#C7F1F3" rules=cols  bordercolor=black border>'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr> <font face="Arial CE" size=2>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="6%" align=center>Lp.</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="45%" align=center>Nazwa </td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>Kod </td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="9%" align=center valign=top>IloòÜ</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center valign=top>J.m.</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>Cena<br>NETTO </td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>WartoòÜ <br>NETTO</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'</table>'+chr(13)+chr(10)

RETURN lwiersz


FUNCTION MAG_RWINTYT(pwiersz)
local lwiersz:=pwiersz
local lcolor:=setcolor()

lwiersz=lwiersz+'<table cols=9 width="100%" bgcolor="#C7F1F3" rules=cols  bordercolor=black border>'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr> <font face="Arial CE" size=2>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="6%" align=center>Lp.</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="30%" align=center>Nazwa </td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="11%" align=center>Kolor </td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center>Rm</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>Kod </td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="9%" align=center valign=top>IloòÜ</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center valign=top>J.m.</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>Cena<br>NETTO </td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>WartoòÜ <br>NETTO</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'</table>'+chr(13)+chr(10)

RETURN lwiersz



FUNCTION MAG_RWINPOZ(pwiersz)
local lwiersz:=pwiersz
local lnet_a:=0,lnet_b:=0,lnet_c:=0,lnet_d:=0,lnet_e:=0,lnet_f:=0,lnet_z:=0
local lbrut_a:=0,lbrut_b:=0,lbrut_c:=0,lbrut_d:=0,lbrut_e:=0,lbrut_f:=0,lbrut_z:=0
local lnet:=0,lbrut:=0,lvat:=0
local lnum:=0
*Pozycje

lwiersz=lwiersz+'<table cols=7 width="100%" rules=none  bordercolor=black border><basefont size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr> <font size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="6%" align=left>&nbsp;</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="30%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="11%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="9%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)

  


go top
do while.not.eof()

    do case
      case mstawka=zvat_a
	    lnet_a=lnet_a+ROUND(mil*mcen_m,4)
      case mstawka=zvat_b
	    lnet_b=lnet_b+ROUND(mil*mcen_m,4)
      case mstawka=zvat_c
	    lnet_c=lnet_c+ROUND(mil*mcen_m,4)
      case mstawka=zvat_d
	    lnet_d=lnet_d+ROUND(mil*mcen_m,4)
      case mstawka=zvat_e
	    lnet_e=lnet_e+ROUND(mil*mcen_m,4)
      case mstawka=zvat_f
	    lnet_f=lnet_f+ROUND(mil*mcen_m,4)
      case mstawka=0.and.mzwolniony
	    lnet_z=lnet_z+ROUND(mil*mcen_m,4)	  	  	  	  	  	  
    endcase
    lbrut_a=ROUND(lnet_a*(1+(zvat_a/100)),4)
    lbrut_b=ROUND(lnet_b*(1+(zvat_b/100)),4)
    lbrut_c=ROUND(lnet_c*(1+(zvat_c/100)),4)
    lbrut_d=ROUND(lnet_d*(1+(zvat_d/100)),4)
    lbrut_e=ROUND(lnet_e*(1+(zvat_e/100)),4)
    lbrut_f=ROUND(lnet_f*(1+(zvat_f/100)),4)
    lbrut_z=lnet_z
    lnet=lnet_a+lnet_b+lnet_c+lnet_d+lnet_e+lnet_f+lnet_z
    lbrut=lbrut_a+lbrut_b+lbrut_c+lbrut_d+lbrut_e+lbrut_f+lbrut_z

    lnum=lnum+1
      lwiersz=lwiersz+'<tr > '+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>'+str(lnum)+'&nbsp;</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="30%" align=left valign=top><font size=1>'+substr(mnaz,1,32)+'</td>'+chr(13)+chr(10)
	  lwiersz=lwiersz+'<td width="11%" align=left valign=top><font size=1>'+substr(mnaz,33,12)+'</td>'+chr(13)+chr(10)
	  lwiersz=lwiersz+'<td width="4%" align=left valign=top><font size=1>'+substr(mnaz,46,3)+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="12%" align=left valign=top><font size=1>'+mkod+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="9%" align=right valign=top><font size=1>'+str(mil,10,mag_round)+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="4%" align=right valign=top><font size=1>'+mjm+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(kj_round(mcen_m,2),12,2)+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(kj_round(round(mcen_m,2)*mil,2),12,2)+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
    skip
enddo

 
*Last
lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="6%" align=left>&nbsp;</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="30%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="11%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="9%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)

lwiersz=lwiersz+'</table>'+chr(13)+chr(10)

lwiersz=lwiersz+'<br><br><br><b><font size=3>Podsumowanie</b><br>'+chr(13)+chr(10)

lwiersz=lwiersz+'<table cols=3 width="100%">'+chr(13)+chr(10)

lwiersz=lwiersz+'<tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="53%" align=left valign=top><font size=2>ù•czna wartoòÜ magazynu w cenach NETTO</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="33%" align=left valign=top><b><font size=2>'+str(lnet,12,2)+'</b></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="14%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)

lwiersz=lwiersz+'<tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="53%" align=left valign=top><font size=2>ù•czna wartoòÜ zawartego w magazynie podatku VAT</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="33%" align=left valign=top><b><font size=2>'+str((lbrut-lnet),12,2)+'</b></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="14%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)

lwiersz=lwiersz+'<tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="53%" align=left valign=top><font size=2>ù•czna wartoòÜ magazynu w cenach BRUTTO</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="33%" align=left valign=top><b><font size=2>'+str((lbrut),12,2)+'</b></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="14%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)

lwiersz=lwiersz+'</table>'+chr(13)+chr(10)
RETURN lwiersz

FUNCTION MAG_WINPOZ(pwiersz)
local lwiersz:=pwiersz
local lnet_a:=0,lnet_b:=0,lnet_c:=0,lnet_d:=0,lnet_e:=0,lnet_f:=0,lnet_z:=0
local lbrut_a:=0,lbrut_b:=0,lbrut_c:=0,lbrut_d:=0,lbrut_e:=0,lbrut_f:=0,lbrut_z:=0
local lnet:=0,lbrut:=0,lvat:=0
local lnum:=0
*Pozycje
plik_pom="wydruki\pom.htm"

lwiersz=lwiersz+'<table cols=7 width="100%" rules=none  bordercolor=black border><basefont size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr> <font size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="6%" align=left>&nbsp;</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="45%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="9%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)

memowrit("wydruki\remanent.htm",lwiersz)  

lwiersz="" 
licz=0
go top
do while.not.eof()
	do case
      case mstawka=zvat_a
	    lnet_a=lnet_a+ROUND(mil*mcen_m,4)
      case mstawka=zvat_b
	    lnet_b=lnet_b+ROUND(mil*mcen_m,4)
      case mstawka=zvat_c
	    lnet_c=lnet_c+ROUND(mil*mcen_m,4)
      case mstawka=zvat_d
	    lnet_d=lnet_d+ROUND(mil*mcen_m,4)
      case mstawka=zvat_e
	    lnet_e=lnet_e+ROUND(mil*mcen_m,4)
      case mstawka=zvat_f
	    lnet_f=lnet_f+ROUND(mil*mcen_m,4)
      case mstawka=0.and.mzwolniony
	    lnet_z=lnet_z+ROUND(mil*mcen_m,4)	  	  	  	  	  	  
    endcase
    lbrut_a=ROUND(lnet_a*(1+(zvat_a/100)),4)
    lbrut_b=ROUND(lnet_b*(1+(zvat_b/100)),4)
    lbrut_c=ROUND(lnet_c*(1+(zvat_c/100)),4)
    lbrut_d=ROUND(lnet_d*(1+(zvat_d/100)),4)
    lbrut_e=ROUND(lnet_e*(1+(zvat_e/100)),4)
    lbrut_f=ROUND(lnet_f*(1+(zvat_f/100)),4)
    lbrut_z=lnet_z
    lnet=lnet_a+lnet_b+lnet_c+lnet_d+lnet_e+lnet_f+lnet_z
    lbrut=lbrut_a+lbrut_b+lbrut_c+lbrut_d+lbrut_e+lbrut_f+lbrut_z

    lnum=lnum+1
      lwiersz=lwiersz+'<tr > '+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>'+str(lnum)+'&nbsp;</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="45%" align=left valign=top><font size=1>'+mnaz+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="12%" align=left valign=top><font size=1>'+mkod+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="9%" align=right valign=top><font size=1>'+str(mil,10,mag_round)+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="4%" align=right valign=top><font size=1>'+mjm+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(kj_round(mcen_m,2),12,2)+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(kj_round(round(mcen_m,2)*mil,2),12,2)+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
    skip
	licz=licz+1
	if licz>=50
      memowrit("wydruki\pom.htm",lwiersz)
	  run wydruki\rem.bat
	  licz=0
	  lwiersz=""
	endif  
enddo
memowrit("wydruki\pom.htm",lwiersz)
run wydruki\rem.bat

 
*Last
lwiersz=""
lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="6%" align=left>&nbsp;</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="45%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="9%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)

lwiersz=lwiersz+'</table>'+chr(13)+chr(10)

lwiersz=lwiersz+'<br><br><br><b><font size=3>Podsumowanie</b><br>'+chr(13)+chr(10)

lwiersz=lwiersz+'<table cols=3 width="100%">'+chr(13)+chr(10)

lwiersz=lwiersz+'<tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="53%" align=left valign=top><font size=2>ù•czna wartoòÜ magazynu w cenach NETTO</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="33%" align=left valign=top><b><font size=2>'+str(lnet,12,2)+'</b></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="14%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)

lwiersz=lwiersz+'<tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="53%" align=left valign=top><font size=2>ù•czna wartoòÜ zawartego w magazynie podatku VAT</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="33%" align=left valign=top><b><font size=2>'+str((lbrut-lnet),12,2)+'</b></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="14%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)

lwiersz=lwiersz+'<tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="53%" align=left valign=top><font size=2>ù•czna wartoòÜ magazynu w cenach BRUTTO</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="33%" align=left valign=top><b><font size=2>'+str((lbrut),12,2)+'</b></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="14%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)

lwiersz=lwiersz+'</table>'+chr(13)+chr(10)


RETURN lwiersz




FUNCTION WIN_SPORZADZIL(pwiersz)
local lwiersz:=pwiersz
lwiersz=lwiersz+'<table cols=3 width="100%">'+chr(13)+chr(10)

lwiersz=lwiersz+'<tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="50%" align=left valign=top><font size=2>Sporz•dzià ..............................</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="50%" align=left valign=top><font size=2>Zatwierdzià ..............................</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)

lwiersz=lwiersz+'</table>'+chr(13)+chr(10)
RETURN lwiersz






***************************Oferta

FUNCTION WINOFERTA(pcen)
local lcolor:=setcolor(),ek,lnum:=0,lstrona:=1
local ltytul:="                   D E F I N I O W A N I E     W Y D R U K U                    "  
local lnagl_1:=space(78),lnagl_2:=space(78),lnagl_3:=space(78)
local lnagl_4:=space(78),lnagl_5:=space(78),lnagl_6:=space(78),lnagl_7:=space(78)
local lnet_a:=0,lnet_b:=0,lnet_c:=0,lnet_d:=0,lnet_e:=0,lnet_f:=0,lnet_z:=0
local lnet:=0,lbrut:=0
local ldate:=date(),lremtyt:="CENNIK                       ",ltel:=stuff(space(120),1,4,"Tel.")
local lcen:=pcen

save screen to ek

lnagl_1=stuff(lnagl_1,40,19,substr(zmiasto,1,19))
lnagl_1=stuff(lnagl_1,60,5,"Dnia:")
lnagl_1=stuff(lnagl_1,67,8,dtoc(date()))
lnagl_2=stuff(lnagl_2,1,30,zlic1)
lnagl_3=space(120)
lnagl_4=stuff(lnagl_4,1,6,zlic3)
lnagl_4=stuff(lnagl_4,10,30,zlic4)
lnagl_5=stuff(lnagl_5,1,30,zlic5)


private w:=0
save screen to ek
kj_okno(0,0,24,ltytul,1)
@ 1,1 clear to 4,78
set color to n/w
set cursor on
@ 2,1  say "Data ............. "get ldate
@ 3,1  say "Nazwa dokumenty .. "get lremtyt
@ 4,1  get ltel picture "@S75"
read
set cursor off
********************************************html start
plik="wydruki\cennik.htm"
*
lwiersz="<html>"+chr(13)+chr(10)
lwiersz=lwiersz+"<meta http-equiv='Content-Type' content='text/html; charset=ibm852'>"+chr(13)+chr(10)
lwiersz=lwiersz+"<head> </head>"+chr(13)+chr(10)
lwiersz=lwiersz+"<body><basefont size=1>"+chr(13)+chr(10)
* Nagà¢wek
lwiersz=lwiersz+'<table cols=3 width="100%">'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="25%"><font size=1>'+zlic1+'<br>'+zlic2+'</td>'+chr(13)+chr(10)	
lwiersz=lwiersz+'<td width="50%"align=center><b><font size=3>'+lremtyt+'</b></font>'+chr(13)+chr(10)
lwiersz=lwiersz+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="25" align=right valign=top><font size=1>Dnia: &nbsp;'+dtoc(ldate)+chr(13)+chr(10)
lwiersz=lwiersz+'</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'</table>'+chr(13)+chr(10)
lwiersz=lwiersz+'<table cols=3 width="100%">'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td ><font size=1>'+ltel+'</td>'+chr(13)+chr(10)	
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'</table>'+chr(13)+chr(10)
* Nagà¢wek end
lwiersz=lwiersz+"<br>"+chr(13)+chr(10)
* Tabelka - tytuà
do case
  case zrozmiar
    lwiersz=mag_rwintyt(lwiersz)
	lwiersz=mag_rwinpoz(lwiersz)
  otherwise
    lwiersz=mag_ofertytwin(lwiersz)
	lwiersz=mag_oferwinpoz(lwiersz,lcen)
endcase

lwiersz=lwiersz+"</body>"+chr(13)+chr(10)
lwiersz=lwiersz+"</html>"+chr(13)+chr(10)
lwiersz=lwiersz+"<FONT COLOR = 'WHITE'>"+chr(13)+chr(10)
*memowrit("wydruki\remanent.htm",lwiersz)
memowrit("wydruki\pom.htm",lwiersz)
run wydruki\cennik.bat
restore screen from ek
run explorer wydruki\cennik.htm
RETURN


FUNCTION MAG_OFERWINPOZ(pwiersz,pcen)
local lwiersz:=pwiersz,lcen:=pcen
local lnet_a:=0,lnet_b:=0,lnet_c:=0,lnet_d:=0,lnet_e:=0,lnet_f:=0,lnet_z:=0
local lbrut_a:=0,lbrut_b:=0,lbrut_c:=0,lbrut_d:=0,lbrut_e:=0,lbrut_f:=0,lbrut_z:=0
local lnet:=0,lbrut:=0,lvat:=0
local lnum:=0,lcen_brut:=0
*Pozycje
plik_pom="wydruki\pom.htm"

lwiersz=lwiersz+'<table cols=6 width="100%" rules=none  bordercolor=black border><basefont size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr> <font size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="6%" align=left>&nbsp;</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="54%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)

memowrit("wydruki\cennik.htm",lwiersz)  

lwiersz="" 
licz=0
go top
do while.not.eof()
    do case
	  case lcen=1
	    lcen=mcen_d
	  case lcen=2
	    lcen=mcen_h
	  case lcen=3
	    lcen=mcen_m				
	endcase
	lcen_brut=ROUND(lcen*(1+(mstawka/100)),2)

    lnum=lnum+1
      lwiersz=lwiersz+'<tr > '+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="6%" align=right valign=top><font size=1>'+str(lnum)+'&nbsp;</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="54%" align=left valign=top><font size=1>'+mnaz+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="12%" align=left valign=top><font size=1>'+mkod+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="4%" align=right valign=top><font size=1>'+mjm+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(kj_round(lcen,2),12,2)+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'<td width="12%" align=right valign=top><font size=1>'+str(kj_round(round(lcen_brut,2),2),12,2)+'</td>'+chr(13)+chr(10)
      lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)
    skip
	licz=licz+1
	if licz>=50
      memowrit("wydruki\pom.htm",lwiersz)
	  run wydruki\cennik.bat
	  licz=0
	  lwiersz=""
	endif  
enddo
memowrit("wydruki\pom.htm",lwiersz)
run wydruki\cennik.bat

 
*Last
lwiersz=""
lwiersz=lwiersz+'<tr> <font face="Arial CE" size=1>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="6%" align=left>&nbsp;</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="54%" align=left></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=left valign=top></td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr></font>'+chr(13)+chr(10)

lwiersz=lwiersz+'</table>'+chr(13)+chr(10)


RETURN lwiersz


FUNCTION MAG_OFERTYTWIN(pwiersz)
local lwiersz:=pwiersz
local lcolor:=setcolor()

lwiersz=lwiersz+'<table cols=6 width="100%" bgcolor="#C7F1F3" rules=cols  bordercolor=black border>'+chr(13)+chr(10)
lwiersz=lwiersz+'<tr> <font face="Arial CE" size=2>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="6%" align=center>Lp.</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="54%" align=center>Nazwa </td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>Kod </td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="4%" align=center valign=top>J.m.</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>Cena<br>NETTO </td>'+chr(13)+chr(10)
lwiersz=lwiersz+'<td width="12%" align=center valign=top>Cena <br>BRUTTO</td>'+chr(13)+chr(10)
lwiersz=lwiersz+'</tr>'+chr(13)+chr(10)
lwiersz=lwiersz+'</table>'+chr(13)+chr(10)

RETURN lwiersz



FUNCTION WIN_WEW(pwiersz)
local lwiersz:=pwiersz

lwiersz=lwiersz+'<br><br>'+chr(13)+chr(10)
*lwiersz=lwiersz+'<br>'+tekst+chr(13)+chr(10)
do case
  case ztytul_wy="W"
    lwiersz=lwiersz+'<br>'+'Tytuà wystawienia ..... Wewn•trzwsp¢lnotowe nabycie towar¢w'+chr(13)+chr(10)
  case ztytul_wy="I"
    lwiersz=lwiersz+'<br>'+'Tytuà wystawienia ..... Import usàug'+chr(13)+chr(10)	
  case ztytul_wy="D"
    lwiersz=lwiersz+'<br>'+'Tytuà wystawienia ..... Dostawa towar¢w, dla kt¢rej pàatnikiem jest nabywca'+chr(13)+chr(10)
endcase

lwiersz=lwiersz+'<br>'+'Tabela kurs¢w .......... '+ztabela+chr(13)+chr(10)
lwiersz=lwiersz+'<br>'+'Kurs waluty ............... '+ztab_kurs+chr(13)+chr(10)
lwiersz=lwiersz+'<br>'+'Data kursu waluty ..... '+ztab_data+chr(13)+chr(10)

RETURN lwiersz
