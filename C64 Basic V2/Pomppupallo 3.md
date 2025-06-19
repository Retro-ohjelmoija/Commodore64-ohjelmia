# Reunoista pomppaava pallo (sprite)

Tämä Basic-ohjelma on animaatio pallosta, joka liikkuu näytöllä ja törmätessään reunaan kimpoaa siitä.

Tässä pallo on toteutettu spritenä, eri C64:n erityisenä 24 X 21 pikselin grafiikkaelementtinä, jota voi liikutella näytöllä näytön muusta sisällöstä välittämättä.

Oheinen listaus on muotoiltu niin, että sen voi kopioida ja liittää sellaisenaan VICE emulaattorin ikkunaan.

Tarvittaessa kirjoita ensin `new` -komento (poistaa aiemman Basic-ohjelman muistista).

Aja ohjelma `run` -komennolla. Stoppaa ohjelma painamalla jotain näppäintä.

### Hiukan selitystä tukemaan ohjelmalistausta ja siinä olevia kommentteja:

C64:ssä on käytettävissä kahdeksan spriteä (0 - 7). Tässä ohjelmassa on käytetty spriteä nro kaksi. 
Valinnalle ei ole mitään erityistä syytä, eikä sillä ole mitään erityistä merkitystä.

Spritejä hallitaan yhdellä tavulla (8 bittiä), joten sprite kaksi on 0000 0100, eli desimaalilukuna 4. Siis sprite 0 on 0000 0001, sprite 1 on 0000 0010 jne.

Spritejä ohjaa VIC-piiri, jonka reksiterit alkavat osoitteesta 53248. VIC piiri näkee 16k muistia, joten 64k muisti jakaantuu neljään muispankkiin / lohkoon.
Oletuksena VIC käyttää muistin alusta ensimmäistä 16k lohkoa. Spriten esitys (bittikuvio) varaa 64 tavun tilan. 
VIC-piirille tämän sijainti ilmoitetaan osoitteessa 2042 kertomalla se 64 tavun blokki, jossa data on (16k / 64 = 256 blokkia).

Tässä ohjelmassa sprite-data ladataan data-lauseista muistiin osoitteesta 832 (= blokki 13) eteenpäin. Osoite sijaitsee kasettinauhurin puskurin (datasette buffer) alueella ja se on vapaa,
koska tämä ohjelma ei käytä kasettinauria :-)


```
1 rem (c) 2025 retro-ohjelmoija

100 print chr$(147) : rem nayton tyhjennys
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
230 xh = int(x / 256) : xl = x - (xh * 256)
240 poke v+16,xh * 4 : rem x yli 255? 0 tai 1
250 poke v+4,xl: rem x-koordinaatti 
260 poke v+5,y: rem y-koordinaatti
270 get a$ : if a$="" then goto 150
280 poke v+21,0 : rem spritet piiloon
290 end

400 rem ** valmistele sprite **
410 v=53248 : rem vic rekisterit
420 poke v+21,4 : rem sprite 2 paalle (0000 0100 = 4)
430 poke 2042,13 : rem sprite 2 data 13x64=832
440 for n = 0 to 62: read q : poke 832+n,q: next
450 return

500 rem ** vaihda spriten vari **
510 c = c + 1 : if c > 15 then c = 0
520 if c = 6 then c = 7
530 poke v+41, c
540 return

600 rem ** nayton alustus **
610 print:print:print:print:print:print:print:print
620 print tab(5) "sprite liikkuu tekstin paalla"
630 print 
640 for i = 1 to 40
650 print chr$(166);
660 next
670 print chr$(18);
680 for i = 1 to 40
690 print chr$(32);
700 next
710 print chr$(146);
720 print:print:print:print:print:print
730 print tab(7) "(c) 2025 retro-ohjelmoija"
740 return

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

Tästä ohjelmasta Vision BASIC:lle sovitettu versio: [Reunoista pomppaava pallo](../Vision%20BASIC/Pomppupallo%20VB.md)



