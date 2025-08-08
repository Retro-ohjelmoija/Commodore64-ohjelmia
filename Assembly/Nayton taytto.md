# Näytön täyttö - assembly versio

Assembly-ohjelmaa ei ole yritetty millään tavalla optimoida. Silti näyttö täyttyy näennäisen välittömästi.

Alkuperäinen Basic-versio on täällä: [Näytön täyttö](../Vision%20BASIC/Nayton%20taytto.md).


```
// Näytön täyttö Kick Assembler -versio

BasicUpstart2(alku)

.const  naytto = 1024
.const  nayton_koko = 25 * 40

alku:
        ldy #0 // merkin screen code
        ldx #0 // muisti-indeksi
loop1:
        tya
        sta naytto, X
        iny
        inx
        bne loop1
loop2:
        tya
        sta naytto + 256, X
        iny
        inx
        bne loop2
loop3:
        tya
        sta naytto + 256 * 2, X
        iny
        inx
        bne loop3
loop4:
        tya
        sta naytto + 256 * 3, X
        iny
        inx
        cpx #nayton_koko - 256 * 3
        bne loop4
loppu:
        rts

```
