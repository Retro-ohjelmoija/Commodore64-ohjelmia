# Reunoista pomppaava pallo (nopea), versio 2

Tämä Basic-ohjelma on yksinkertainen animaatio pallosta, joka liikkuu näytöllä ja törmätessään reunaan kimpoaa siitä.

Tämässä versiossa ohjelman luettavuutta on parannettu, mutta samalla ajonaikainen suoritettavien käskyjen määrä on lisääntynyt.

Oheinen listaus on muotoiltu niin, että sen voi kopioida ja liittää sellaisenaan VICE emulaattorin ikkunaan.

Tarvittaessa kirjoita ensin `new` -komento (poistaa aiemman Basic-ohjelman muistista).

Aja ohjelma `run` -komennolla. Stoppaa ohjelma emulaattorissa esc-näppäimellä (= stop-näppäin).


```
10 rem (c) 2025 retro-ohjelmoija

100 print chr$(147)
110 dx = -1 : dy = -1 : x = 20 : y = 12
200 rem ** paalooppi **
210 gosub 1000 : rem laskenta
220 gosub 2000 : rem vanha pallo
230 gosub 3000 : rem uusi pallo
240 goto 210

1000 rem ** koordinaattien laskenta **
1010 ex = x : ey = y
1020 x = x + dx
1030 if x > 40 then x = 39 : dx = -dx
1040 if x < 1 then x = 2 : dx = -dx
1050 y = y + dy
1060 if y > 25 then y = 24 : dy = -dy
1070 if y < 1 then y = 2 : dy = -dy
1080 return

2000 rem ** vanha pallo pois **
2010 poke 1024 + (ey - 1) * 40 + ex - 1, asc(" ")
2040 return

3000 rem ** uusi pallo paikalleen **
3010 poke 1024 + (y - 1) * 40 + x - 1, 81
3040 return

```

### Poke-selitys

POKE n, 81 on PRINT CHR$(209)
