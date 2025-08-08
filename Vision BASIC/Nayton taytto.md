# Vision BASIC näytön täyttö - demo / nopeustesti

Tämä ohjelma täyttää näytön 256 eri merkillä sarake sarakkeelta, rivi riviltä.

Ohjelman voi ajaa tavallisessa C64:ssä ja Vision BASIC -kääntäjällä. Kesto C64:ssä noin 24 sekuntia ja Vision BASIC:ssa noin 4 sekuntia.

Ohjelmakoodi on muotoiltu niin, että sen voi copy-pasteta VICE emulaattorin ikkunaan, jossa Vision BASIC on käytössä.

Kirjoita ensin `new` komento ja liitä sitten alla oleva koodi. Aja ohjelma `run` -komennolla ja lopeta ohjelma painamalla STOP -näppäintä (ESC) tai STOP + RESTORE (ESC + PageUp).

```
0 clr
10 m = 0
20 for r = 0 to 24
30 for s = 0 to 39
40 os = r * 40 + s + 1024
50 poke os, m
60 m = m + 1
70 if m > 255 then m = 0
80 next
90 next
100 goto 100

```

Konekielellä (eli assemblyllä) ohjelmoitu version näytön täytöstä löytyy täältä: [Näytön täyttö](../Assembly/Nayton%20taytto.md).
