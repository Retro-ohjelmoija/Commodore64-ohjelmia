# Reunoista pomppaava pallo (sprite) - Vision Basic -versio

Tämä Basic-ohjelma on animaatio pallosta, joka liikkuu näytöllä ja törmätessään reunaan kimpoaa siitä.

Tässä pallo on toteutettu spritenä, eri C64:n erityisenä 24 X 21 pikselin grafiikkaelementtinä, jota voi liikutella näytöllä näytön muusta sisällöstä välittämättä.

Tämä versio on muokattu Vision BASIC:lle C64 Basic -versiosta, joka on täällä: [Reunoista pomppaava pallo](../C64%20Basic%20V2/Pomppupallo%203.md).
Ohjelmassa on käytetty Vision BASIC:in sprite-käskyjä ja ohjelmaa on muutenkin muokattu Vision BASIC:in mukaiseksi. Lisäksi sprite-data ladataan run pack "B-828" ohjeen
mukaisesti muistilohkoon 11 (Vision BASIC User Manual s. 201).

Ohjelmakoodi on muotoiltu niin, että sen voi copy-pasteta VICE emulaattorin ikkunaan, jossa Vision BASIC on käytössä.

Kirjoita ensin `new` komento ja liitä sitten alla oleva koodi. Aja ohjelma `run` -komennolla ja lopeta ohjelma painamalla `q` -näppäintä.

```
0 clr:cls:colors 14,14,6
1 rem (c) 2025 retro-ohjelmoija

100 rem ** pomppupallo spritella **
110 gosub 600 : rem alusta naytto
120 gosub 400 : rem alusta sprite
130 dx = -1 : dy = -1 : x = 100 : y = 100
140 sx = 23 : sy = 50 : mx = 321 : my = 229
150 x = x + dx
160 vc = 0 : rem pomppu -> varin vaihto
170 if x > mx then x = mx - 1 : dx = -dx : vc = 1
180 if x < sx then x = sx + 1 : dx = -dx : vc = 1
190 y = y + dy
200 if y > my then y = my - 1 : dy = -dy : vc = 1
210 if y < sy then y = sy + 1 : dy = -dy : vc = 1
220 if vc > 0 then gosub 500
230 mobxy x, y
240 get a$ : if a$="" then goto 150
250 mobclr : rem spritet piiloon
260 end

400 rem ** valmistele sprite **
410 mobclr
420 mob 2,1,0,0,x,y,0,0 : rem sprite 2 aktiiviseksi
430 os=11 : mobpat os,0 : rem sprite 2 data 11x64=704
440 for n = 0 to 62: read q : nt=os*64+n : poke nt,q: next
450 return

500 rem ** vaihda spriten vari **
510 c = c + 1 : if c > 15 then c = 0
520 if c = 6 then c = 7
530 mobcol c
540 return

600 rem ** nayton alustus **
610 loc 5,9; : print "sprite liikkuu tekstin paalla"
620 print 
630 for i = 1 to 40
640 print chr$(166);
650 next
660 print chr$(18);
670 for i = 1 to 40
680 print chr$(32);
690 next
700 print chr$(146);
710 loc 7,19; : print "(c) 2025 retro-ohjelmoija"
720 return

1000 rem ** sprite pallo **
1010 data 0,126,0
1020 data 1,255,128
1030 data 7,255,224
1040 data 15,255,240
1050 data 31,255,248
1060 data 31,241,248
1070 data 63,252,124
1080 data 63,255,60
1090 data 127,255,190
1100 data 127,255,158
1110 data 127,255,222
1120 data 127,255,254
1130 data 127,255,254
1140 data 63,255,252
1150 data 63,255,252
1160 data 31,255,248
1170 data 31,255,248
1180 data 15,255,240
1190 data 7,255,224
1200 data 1,255,128
1210 data 0,126,0

```

