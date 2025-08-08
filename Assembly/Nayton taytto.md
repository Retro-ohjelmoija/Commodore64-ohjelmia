# Näytön täyttö - assembly versio

Assembly-ohjelmaa ei ole yritetty millään tavalla optimoida.

Alkuperäinen Basic-versio on täällä: [Näytön täyttö](../Vision%20BASIC/Nayton%20taytto.md).


```
// Näytön täyttö Kick Assembler -versio

BasicUpstart2(alku)

alku:
        ldy #0
        ldx #0
loop1:
        tya
        sta 1024,X
        iny
        inx
        bne loop1
loop2:
        tya
        sta 1024 + 256,X
        iny
        inx
        bne loop2
loop3:
        tya
        sta 1024 + 256 * 2,X
        iny
        inx
        bne loop3
loop4:
        tya
        sta 1024 + 256 * 3,X
        iny
        inx
        cpx #232
        bne loop4
loppu:
        rts


```
