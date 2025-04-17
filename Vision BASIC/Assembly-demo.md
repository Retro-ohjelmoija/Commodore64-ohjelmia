# Assembly upotettuna Basic-ohjelmaan

Vision BASIC mahdollistaa assemblyn upotuksen basic-ohjelman joukkoon. Assembly alkaa [ -merkillä.

Listaus on suunniteltu niin, että se voidaan copy-pasteta VICE-emulaattorin ikkunaan, jossa Vision BASIC on käynnissä.

```
0 clr
10 rem (c) 2025 retro-ohjelmoija

100 rem kaikki int muuttujia (16 bittia)
110 a = 10
120 b = 100
130 c = 200
140 d = 500
150 e = 65000

200 rem seuraavissa laskenta vain 8 bitilla

250 rem a = 10 + 1
260 [ldx a ; a-muuttujan arvo x-rekisteriin
270 [inx   ; lisaa yksi
280 [stx a ; x:n arvo a-muuttujaan

300 rem b = 100 + 11
310 [lda b ; b-muuttujan arvo akkuun
320 [clc   ; tyhjataan carry-lippu
330 [adc a ; lisaa a arvo akkuun
340 [sta b ; akun sisalto b-muuttujaan

400 rem c = 200 + 10 (+ carry!)
410 [lda c ; c-muuttujan arvo akkuun
420 [sec   ; asetetaan carry-lippu!!!
430 [adc a ; lisaa a arvo akkuun
440 [sta c ; akun sisalto c-muuttujaan

500 rem d = 500 + 111 (mutta vain lo byte)
510 [lda d ; d-muuttujan arvo akkuun
520 [clc   ; tyhjataan carry-lippu
530 [adc b ; lisaa b arvo akkuun
540 [sta d ; akun sisalto d-muuttujaan

600 rem seuraavaksi laskenta 16 bitilla

700 rem e = 65000 + 355 (lo ja high byte)
710 [lda e   ; e-muuttujan arvo akkuun
720 [clc     ; tyhjataan carry-lippu
730 [adc d   ; lisaa b arvo akkuun
740 [sta e   ; akun sisalto e-muuttujaan
750 [lda e+1 ; e-muuttujan arvo akkuun
760 [adc d+1 ; lisaa b arvo akkuun + carry
780 [sta e+1 ; akun sisalto e-muuttujaan

900 print "a="; a
910 print "b="; b
920 print "c="; c; " <- 'vaara' tulos"
930 print "d="; d; " <- 'vaara' tulos"
940 print "e="; e

9999 end

```


