# Ä Ö ja Å

Ns. skandimerkkien määrittely. Korvaa merkit "[", "]" ja "£" merkeillä "Ä", "Ö", "Å".

Lähde: "German Example" https://www.c64-wiki.com/wiki/Character_set#German_Example

Kopioi lähteestä rivit 10 - 26 oheiseen listaukseen (ja poista tästä listauksesta rivit 1 - 2).

Ohjelman ajon jälkeen skandimerkit ovat käytettävissä painelemalla näppäimistöstä "[", "]" ja "£" -näppäimiä.

```
1 rem kopio tähän https://www.c64-wiki.com/wiki/Character_set#German_Example
2 rem rivit 10 - 26 (listauksesta German Example)


500 rem define chars
510 cr=12288 : rem $3000
520 for i = 1 to 3
530 read id
540 id=id*8
550 for j=cr+id to cr+id+7
560 read da
570 poke j,da
580 poke j+1024,255-da
590 next j
600 next i
610 end

1005 data 27 : rem index [
1010 data 102,24,60,102,126,102,102,0 : rem a-umlaut 
1015 data 28 : rem index £
1020 data 24,0,60,102,126,102,102,0 : rem a-ring
1025 data 29 : rem index ]
1030 data 102,0,60,102,102,102,60,0 : rem o-umlaut

```
