# Reunoista pomppaava pallo (hidas)

Tämä Basic-ohjelma on yksinkertainen animaatio pallosta, joka liikkuu näytöllä ja törmätessään reunaan kimpoaa siitä.

Oheinen listaus on muotoiltu niin, että sen voi kopioida ja liittää sellaisenaan VICE emulaattorin ikkunaan.

Tarvittaessa kirjoita ensin `new` -komento (poistaa aiemman Basic-ohjelman muistista).

Aja ohjelma `run` -komennolla. Stoppaa ohjelma emulaattorissa esc-näppäimellä (= stop-näppäin).


```
10 rem (c) 2025 retro-ohjelmoija

100 print chr$(147)
110 dx = -1 : dy = -1 : x = 20 : y = 12
200 rem ** paalooppi alkaa **
210 ex = x : ey = y
220 x = x + dx
230 if x > 40 then x = 39 : dx = -dx
240 if x < 1 then x = 2 : dx = -dx
250 y = y + dy
260 if y > 25 then y = 24 : dy = -dy
270 if y < 1 then y = 2 : dy = -dy
300 gosub 1000
310 gosub 2000
330 goto 210

1000 rem ** vanha pallo pois **
1005 print chr$(19);
1010 if ey > 1 then for r=1 to ey-1 : print chr$(17); : next r
1020 if ex > 1 then for s=1 to ex-1 : print chr$(29); : next s
1030 print " ";
1040 return

2000 rem ** uusi pallo paikalleen **
2005 print chr$(19);
2010 if y > 1 then for r=1 to y-1 : print chr$(17); : next r
2020 if x > 1 then for s=1 to x-1 : print chr$(29); : next s
2030 print chr$(209);
2040 return

```

### Erikoismerkkien selitykset - CHR$(x)

17 = kursori alas yksi rivi

19 = kursori näytön vasempaan ylänurkkaan

29 = kursori oikealle yksi merkkipaikka

147 = näytön tyhjennys

209 = pallo


