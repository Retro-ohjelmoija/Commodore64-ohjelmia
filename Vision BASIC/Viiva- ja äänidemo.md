Vision BASIC User Manual -kirjasta sovellettu viivoja piirtävä ja ääniä soittava demo.

Viivanpiirtoesimerkki sivulta 183.

Ääniesimerkki sivulta 188.

Ohjelmakoodi on muotoiltu niin, että sen voi copy-pasteta VICE emulaattorin ikkunaan, jossa Vision BASIC on käytössä.

Kirjoita ensin new komento ja liitä sitten alla oleva koodi. Aja ohjelma run -komennolla ja lopeta ohjelma painamalla q -näppäintä.

```
0 clr : decimal x, y
10 ti = clock
20 release = 0
100 bmpclr 1,1,5,3
110 bitmap 1,1,5,5,3,2,6,7,1,1
120 limits 160,200,0,0,0
130 rem limits 80, 100, 40, 50, 0

200 sidclr
210 vol 15
220 voice 1
230 adsr 4, 12, 6, 10
240 nsound

310 label loop
320 x = rnd(1) * 160
330 y = rnd(1) * 200
340 [inc 2199 ; rem last used color + 1
350 line x, y, x1, y1
360 x1 = x
370 y1 = y

400 td = clock - ti
410 if td > 30 and release = 0
420 then wave 0 : release = 1
430 if td > 120
440 then nsound

899 q = asc("q")
900 get m : if m <> q then goto loop
999 end

2000 proc nsound 
2010 fr = rnd(0) + 300 * 17 : rem freq * 16.778523
2020 freq fr
2030 wave 1, 1
2040 ti = clock
2050 release = 0
2060 return

```
