# Viiva nurkasta nurkkaan

Tämä Basic-ohjelma on demo siitä, miksi tulkkaava Basic ei oikein sovellu grafiikan ohjelmointiin.

Oheinen listaus on muotoiltu niin, että sen voi kopioida ja liittää sellaisenaan VICE emulaattorin ikkunaan.

Tarvittaessa kirjoita ensin `new` -komento (poistaa aiemman Basic-ohjelman muistista).

Kun ohjelman ajaa `run` -komennolla, näytölle ilmestyy värillisiä kuvioita. Odota rauhassa, että näyttö tyhjenee (rivit 150 - 200) ja viivan piirto alkaa.

```
10 rem (c) 2025 retro-ohjelmoija

100 base=2*4096
110 p1=peek(53272)
120 poke 53272,peek(53272) or 8
130 p2=peek(53265)
140 poke 53265,peek(53265) or 32

150 for i=base to base+7999
160 poke i,0
170 next i

180 for i=1024 to 2023
190 poke i,16
200 next i

300 hps=0
310 vps=0
320 for i=1 to 320
330 hps=hps+1
340 vps=i / 320 * 200
350 gosub 1000
360 next i

960 get a$ : if a$="" then goto 960

970 poke 53272,p1
980 poke 53265,p2
990 print chr$(147)
999 end

1000 rem piirra piste
1010 xtmp=int(hps/8)
1020 row=int(vps/8)
1030 rivi=vps and 7
1040 byte=base+row*320+8*xtmp+rivi
1050 bit=7-(hps and 7)
1060 poke byte,peek(byte) or (2^bit)
1070 return

```
