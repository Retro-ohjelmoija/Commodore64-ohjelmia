# Basicin perusteet osa 1

Oheinen listaus on muotoiltu niin, että sen voi kopioida ja liittää sellaisenaan VICE-emulaattorin ikkunaan.

Tarvittaessa kirjoita ensin `new` -komento (poistaa aiemman Basic-ohjelman muistista).

```
10 rem (c) 2025 retro-ohjelmoija
20 print "montako rivia?"
30 input v$
40 l = val(v$)
50 if l = 0 then goto 90
60 for i = 1 to l
70 print "rivi " i
80 next i
90 end

```


