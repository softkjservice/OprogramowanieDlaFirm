*******************************************************************************
* Funkcja ustala parametry programu FIRMA                                     *
*******************************************************************************
FUNCTION FIRMA_SET()
local lcolor:=setcolor(),ek,sel_setup,select:=select()
local ltyt:="                      PARAMETRY  PROGRAMU  FIRMA                      "
local lk_serwer,lm_serwer,ld_serwer,lp_serwer,lk_tryb,lm_tryb,ld_tryb,lp_tryb
save screen to ek
kj_okno(3,4,15,ltyt,1)
set default to
select 0
kj_use("f_setup",.t.,3)
lk_serwer=k_serwer
lm_serwer=m_serwer
ld_serwer=d_serwer
lp_serwer=p_serwer
lk_tryb=k_tryb
lm_tryb=m_tryb
ld_tryb=d_tryb
lp_tryb=p_tryb
@ 5,6 say "KONTRAHENT     Katalog roboczy ....."
@ 6,6 say "               Tryb obslugi sieci .."
@ 8,6 say "MAGAZYN        Katalog roboczy ....."
@ 9,6 say "               Tryb obslugi sieci .."
@ 11,6 say "DOKUMENTY      Katalog roboczy ....."
@ 12,6 say "               Tryb obslugi sieci .."
@ 14,6 say "PRACOWNIK      Katalog roboczy ....."
@ 15,6 say "               Tryb obslugi sieci .."
set cursor on
@ 5,42 get lk_serwer picture "@S30"
@ 6,42 get lk_tryb picture "99"
@ 8,42 get lm_serwer picture "@S30"
@ 9,42 get lm_tryb picture "99"
@ 11,42 get ld_serwer picture "@S30"
@ 12,42 get ld_tryb picture "99"
@ 14,42 get lp_serwer picture "@S30"
@ 15,42 get lp_tryb picture "99"
read
set cursor off
if.not.lastkey()=27
  replace k_serwer with lk_serwer,m_serwer with lm_serwer,d_serwer with ld_serwer
  replace p_serwer with lp_serwer, k_tryb with lk_tryb, m_tryb with lm_tryb
  replace d_tryb with ld_tryb, p_tryb with lp_tryb
endif
restore screen from ek
setcolor(lcolor)
use
select &select
RETURN