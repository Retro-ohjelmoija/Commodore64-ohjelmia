// Näytön täyttö (optimoitu) Kick Assembler -versio

BasicUpstart2(alku)

.const  naytto = 1024
.const  nayton_koko = 25 * 40

alku:
        ldx #0 // muisti-indeksi ja merkin screen code
loop1:
        txa
        sta naytto, X
        sta naytto + 256, X
        sta naytto + 256 * 2, X
        inx
        bne loop1
loop2:
        txa
        sta naytto + 256 * 3, X
        inx
        cpx #nayton_koko - 256 * 3
        bne loop2
loppu:
        rts
