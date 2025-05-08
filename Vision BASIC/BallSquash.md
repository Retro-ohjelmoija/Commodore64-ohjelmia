# Pallopeli ("squash")

Yksinkertainen teksinäytöllä pelattava mailapallopeli - muistuttaa squashia.

Ohjelmakoodi on muotoiltu niin, että sen voi copy-pasteta VICE emulaattorin ikkunaan, jossa Vision BASIC on käytössä.

Huom.: Pelissä liikkuva pallo "vilkkuu", joten näyttö voi aiheuttaa herkille oireita.

```
0 clr : cls : random : colors 1, 11, 9
1 rem (c) 2025 retro-ohjelmoija / jari ahola

10 loc 13,11; : print "hit the ball!"
20 loc 1,14; : print "(c) 2025 retro-ohjelmoija / jari ahola"
30 loc 3,19; : print "warning! contains flashing images!"
40 loc 2,22; : print "use k and m or s and x to move racket"
50 loc 10,24; : print "hit any key to start";
60 keypress
70 label aloitus
80 cls

90 gosub 10110 : rem pelikentan piirto

110 ti = clock : pdelay = 6 : rdelay = 3 
120 dx = -1 : dy = -1 : x = 30 : y = rnd(0) / 13 + 3
130 pady = 10 : edpady = pady - 1 : gosub 4000
140 c = clock
150 npd = c + pdelay
160 nrd = c + rdelay

200 label paalooppi
210 c = clock
220 if c >= npd then gosub 400 : npd = c + pdelay : rem siirra palloa
230 if c >= nrd then gosub 500 : nrd = c + rdelay : rem siirra mailaa
240 if x > 40 then stpgame
250 goto paalooppi

300 label stpgame
310 cls
320 loc 16,11; : print "game end"
330 loc 10,13; : print "press n for new game"
340 loc 10,14; : print "press q to end game"
350 keypress "qn" : then aloitus 

398 cls
399 end

400 rem ** siirra palloa **
410 gosub 1000 : rem laskenta
420 gosub 2000 : rem vanha pallo
430 gosub 3000 : rem uusi pallo
440 return

500 rem ** siirra mailaa **
540 get k
550 if k = 77 or k = 88 then if pady < 20 then pady = pady + 1 : gosub 4000
560 if k = 75 or k = 83 then if pady > 1 then pady = pady - 1 : gosub 4000
580 return

1000 rem ** koordinaattien laskenta **
1010 ex = x : ey = y
1020 x = x + dx
1030 if x > 39 
1040 then rem then x = 39 : dx = -dx
1050 then padend = pady + 4
1060 then if pady <= y and padend >= y then x = 38 : dx = -dx
1070 if x < 2 then x = 3 : dx = -dx
1080 y = y + dy
1090 if y > 24 then y = 23 : dy = -dy
1100 if y < 2 then y = 3 : dy = -dy
1110 return

2000 rem ** vanha pallo pois **
2010 m = ey - 1 * 40 + ex - 1 + 1024 
2020 poke m, 32
2040 return

3000 rem ** uusi pallo paikalleen **
3010 m = y - 1 * 40 + x - 1 + 1024 
3020 poke m, 81
3040 return

4000 rem ** uusi mailan paikka **
4010 if edpady = pady then return
4020 m = pady * 40 + 1024 + 39
4030 if edpady > pady then n = 40 * 4 + m : poke n, 32
4040 if edpady < pady then n = m - 40 : poke n, 32 
4050 for i = 1 to 4
4060 poke m, 160
4070 m = m + 40
4080 next
4090 edpady = pady
4100 return

10110 rem ** piirretaan pelikentta **
10110 x = 1024
10120 for i = 1 to 40
10130 poke x, 160
10140 x = x + 1
10150 next

10160 x = 24 * 40 + 1024
10170 for i = 1 to 40
10180 poke x, 160
10190 x = x + 1
10200 next

10210 x = 40 + 1024
10220 for i = 1 to 23
10230 poke x, 160
10240 x = x + 40
10250 next

10260 return

```

Jos haluat vain pelata peliä, niin .d64 levykuvan voi ladata tästä:
[Hit The Ball.d64](https://github.com/Retro-ohjelmoija/Basic-ohjelmia/blob/main/Vision%20BASIC/d64/Hit%20The%20Ball.d64)

Vision BASIC -kääntäjää ei tarvita, levykuvalla oleva valmiiksi käännetty ohjelma toimii sellaisenaan C64:ssä / emulaattorissa ilman Vision BASIC:ia.




